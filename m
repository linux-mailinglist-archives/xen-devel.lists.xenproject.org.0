Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC284A77C9F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934390.1336103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbzj-0006BS-Eq; Tue, 01 Apr 2025 13:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934390.1336103; Tue, 01 Apr 2025 13:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbzj-00068L-BO; Tue, 01 Apr 2025 13:49:35 +0000
Received: by outflank-mailman (input) for mailman id 934390;
 Tue, 01 Apr 2025 13:49:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZod=WT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzbzh-00068F-O2
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:49:33 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 240a45b5-0f00-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 15:49:32 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so62016505e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:49:32 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d900013besm158220585e9.38.2025.04.01.06.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 06:49:31 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 240a45b5-0f00-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743515372; x=1744120172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=934f/DsVR2RZXg9cTFXimx5/9vVGZ8O6IYrjxAnGHlA=;
        b=Qk8N0LNLZLR5e6V/6D8n3c1EjOOlKrE6yvnHv+JiUtLovO9kDYvJAM9URDl9Nxfjsg
         DDdTzXDjuMqJfj6iq1IzN5y+DPDvEmJO7033I7oAF0jaKQxgfBDTOWB1owjMKGe+QgSx
         EhixJQrl7JG78GqM8nVj4S1+52S7cEt9H71W0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743515372; x=1744120172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=934f/DsVR2RZXg9cTFXimx5/9vVGZ8O6IYrjxAnGHlA=;
        b=wWagbeiT9lLi0CGD7xv7FEkz3YdN6Yhng+OC/LXIhhSPxxdvn5H3dyl1e2kyIdE0jj
         3VVB4lKeauBKFN72kILs42a1TbfDDH66dhs1DctO/6np+1LSnvLWXW0cAiQy3n9ZUv46
         VQPexF1MmPPoLC/L2QOc1i+yeeud3IbN0XXEs9zfklDbjBHxTFHWhREGWID8UcsO6FCn
         1UnsAhWFZxu81VFpiIUH3gZcg6lKBDflsChfea8pF0hDNIwJltpV7hh+3arNwQxXFB+Y
         ea1qeBJFHr/g0mQ45jpf2mvPvVMCMo3q+BE5P38/6CaooFgo/BHh+0jpYflNbal9Nmx1
         da2A==
X-Forwarded-Encrypted: i=1; AJvYcCUUlB0rNhvIjqUqR26N0K2ZK9vOjfmRgCrsuHNn52eYl8sKmQQ6gIOSuKYj41kzPmAqBeml+iGdqcQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzE5xzZ9Uny1GYyKEsvZnq6oghkwuS1ZmRNlMFM1ycYZetbIBzh
	8oCzgxYJZDRIpJBNLEQrJK4rPKz0sokQBBElR/3s0KPqG+qz117BuvbMBwThsAM=
X-Gm-Gg: ASbGncui6DXsu82/QFJvE56Z96NNrF43c8bbhLcfJrpLyKmu6Bj5QdeiDohVRSexRiu
	xE0PWtZNSs1h/243ju/44o1tDSV9B51Szz1oRS3WUEc6rOaIRWD6Vx/6mBc0HKadLCu8rNVxuhm
	/ZqXZFVv1tlZfH8CeKZcowPP7p6P9EsPyPE9UCTEMU5rCfq17y/wXDgPrN3BcuaY4ZGmJIhQCqv
	J6ltuV+MTukhdGuwNbzMJL9bri/x2hnGCzTTuvMeCSmN3gErh/nN8Z7nh+l/fUfL0Wk3wo1qdy4
	yHvCjuwDSPB9CcrCgODhwT3cOPkVCdx8fVS3N0dGheqhG/BobVRLlG84QqOAB9yhizEhrFaI1X9
	YoCLVk+0Khw==
X-Google-Smtp-Source: AGHT+IGiuPEay/hUrF2L2v/AAQ4KTbNqUAx8g+/h5+2YH5OQij6UIcPoFh6cGdA6QpWQROsokAxJUA==
X-Received: by 2002:a05:600c:3b9d:b0:43c:ebc4:36a5 with SMTP id 5b1f17b1804b1-43db6222078mr97141745e9.7.1743515372269;
        Tue, 01 Apr 2025 06:49:32 -0700 (PDT)
Message-ID: <3fd56964-918a-49f7-a0fe-a1c6b8633af6@citrix.com>
Date: Tue, 1 Apr 2025 14:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] x86/boot: place trampoline code in a non-execute
 section
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-9-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250401130840.72119-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/04/2025 2:08 pm, Roger Pau Monne wrote:
> The trampoline code is never executed in the position placed by the
> loader.  It's first copied to the low 1MB, and always executed from
> there.
>
> Move the trampoline code from being in .init.text section into
> .init.data, so it's not in an executable section.  This allows applying
> the relocations safely against a non-executable (and thus non-read only)
> section, and then copy the relocated trampoline to the low 1MB.  Note
> that the trampoline code is placed on an .init section, so zapped after
> boot has finished.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> An alternative approach is to apply the relocations after having copied the
> trampoline to the low 1MB, but that still generates relocations in mkreloc,
> which is not helpful for the goal of having no relocations applied to
> read-execute code sections.  This approach however places code in a data
> section, which might cause issues when debugging it.

I, probably most of all, spend a reasonable amount of time disassembling
the trampoline. I really would prefer to keep it in an executable section.

What are the options with relocations?  Can't we simply drop any in the
trampoline region?

~Andrew

