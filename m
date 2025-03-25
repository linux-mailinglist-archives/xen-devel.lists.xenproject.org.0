Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773A5A6F619
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 12:45:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926394.1329240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2iB-0002mW-GB; Tue, 25 Mar 2025 11:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926394.1329240; Tue, 25 Mar 2025 11:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2iB-0002kP-DE; Tue, 25 Mar 2025 11:44:51 +0000
Received: by outflank-mailman (input) for mailman id 926394;
 Tue, 25 Mar 2025 11:44:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+BiV=WM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tx2i9-0002kJ-7C
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 11:44:49 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e04be05-096e-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 12:44:48 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso54532825e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 04:44:48 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd9df6bsm147633095e9.31.2025.03.25.04.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 04:44:47 -0700 (PDT)
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
X-Inumbo-ID: 8e04be05-096e-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742903088; x=1743507888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3VPhdK5EXCLAcPaEgh+hMFWAxKCNu4xAoILNQpbMggw=;
        b=QoqMlWv+q3/yKAMbQqE+QTjgTcLhn0jkd+Xw7xUNieLI4ww5kEb2C4UR3MeK+uGhC0
         VXftY5dR0p18lWbt+L8vfGXP0kk5pNKutXnWPqNEUwHNP62kHUgMUoBEPKonvCTclsMf
         z9STClKVJ9dB8KgjQvvmamN6/hYyhNU/Fqtrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903088; x=1743507888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VPhdK5EXCLAcPaEgh+hMFWAxKCNu4xAoILNQpbMggw=;
        b=AgaMe83j0W/8lLMGorOWI3r/r6MBCirsNpNOSCFpX4/YrV3VneVv129y7MRvdIudkK
         769UlB8xhlODT+1KGb5P7ETWfDv0yrWrvf5KQt0UaiEzr6tSNoePOJf70amdTOi+UrXB
         jZ543YBoUj2mEXYKJ9LWpYXNwtGo97+fBgX26cG2tz894QZ1BLHBUbmsJVeZ1LWVzmme
         zO1IDqiMDappjmyJOxg7ny8bc0/fameMM9PtT5KZ3/BkNakzNQcf+z1dBxnp0uC/egyN
         GWt5m1K1DX9ZUJGeVC1JjBBBcX58vY+S4OzgStb0vu9K1srmsOFCGtzkUY9O+Xvv375/
         0ldg==
X-Forwarded-Encrypted: i=1; AJvYcCXMQLsudAFC6oIIzsIE2D2AHqyopu2ZtdVuzoW19Akg9aI+flAtyLhRpsCjV/G9lOOVVB0K2fssZfs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKuwEqj7BcZNMnfZGAzUM7E2SW5UhLRhaAQ05JZiTfXuCcS8rV
	An06+SxYzPMSsgRGRCGGYa4zm+UYnBg8q7ZMNcF/vfC5L/kuCJVvgCFylkF0DkQ=
X-Gm-Gg: ASbGncsRtQnvHbiY+CZ9OS/H8kvIPe8yrBo6u/hXa7AWhKpLPL3PL2Hke8zftXierFv
	l4p0V6C0VcmnYC1jmo3RVi7ECbyoTNm4xc0vhmxCYcx/eB5NGH9CEMi9sLP7HRcrNX2AdGm95UQ
	5Ke9JkQos0KKT+7cagjllR1GiQQfbcSitHIr/rC75lvM62+HavV/SCZS9a4MCrGcNBgr9PJYq2d
	sEhtnypqOcW0Cu5Od94GbOv8HIfmqvzhvbu7jXtap7UACxgYZ+pGZRyj4tcNvJOMpHg3l9D6bMx
	qo5aJfQJA67HdxvHG4HR3MjfKFbSJJilJMFJpHnCHTVnTw+3UBSfNWvIbhnLHoXPaHeYsTSHMRh
	fTurWbJQfQQ==
X-Google-Smtp-Source: AGHT+IFF+YlmkmOWsA3qOgbvUbEOpaJkwdFY+8EAtQMlvkG9VYODG8ScBlQI/MS8wx/JhX22hOghGg==
X-Received: by 2002:a05:600c:3c9e:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-43d58c9a7cemr116813275e9.15.1742903087687;
        Tue, 25 Mar 2025 04:44:47 -0700 (PDT)
Message-ID: <a143ae21-0639-481d-b016-cffaae9038b6@citrix.com>
Date: Tue, 25 Mar 2025 11:44:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/inflate.c: remove dead code
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
References: <552377d2-a2f1-40eb-83dc-fa09931cae6d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <552377d2-a2f1-40eb-83dc-fa09931cae6d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/03/2025 8:13 am, Jan Beulich wrote:
> From: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
>
> This is a follow up from a discussion in Xen:
>
> The if-statement tests that `res` is non-zero; meaning the case zero is
> never reached.
>
> Link: https://lore.kernel.org/all/7587b503-b2ca-4476-8dc9-e9683d4ca5f0@suse.com/
> Link: https://lkml.kernel.org/r/20241219092615.644642-2-ariel.otilibili-anieli@eurecom.fr
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 41c761dede6e
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

