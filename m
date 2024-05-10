Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D1E8C2A00
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 20:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720022.1122941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5V90-0000bX-Ro; Fri, 10 May 2024 18:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720022.1122941; Fri, 10 May 2024 18:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5V90-0000YL-OP; Fri, 10 May 2024 18:38:58 +0000
Received: by outflank-mailman (input) for mailman id 720022;
 Fri, 10 May 2024 18:38:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i6G=MN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5V8z-0000YE-1A
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 18:38:57 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d25d419-0efc-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 20:38:54 +0200 (CEST)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6a0ffaa079dso29548776d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 11:38:54 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f179685sm19594636d6.14.2024.05.10.11.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 11:38:52 -0700 (PDT)
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
X-Inumbo-ID: 8d25d419-0efc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715366333; x=1715971133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+uCd3k4S2h4kpULClLQ4KsyX2o+rNejT1whJjLp1Eiw=;
        b=DBnEvClUgOaFdAkVHtfH46M9JOF961ovhYHn9HG0cKJ4Z8B832x+mHCJrPWvlpDaqW
         DFsOKjPTRMcCTtQ1Qb8krkr0MCrk/zs6uWw4IqADIp40phS7F9pOME2oWl5xGySqnG+r
         GlhOK0E2GOmTStnObUcBRc1wVacOOjMOURKBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715366333; x=1715971133;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uCd3k4S2h4kpULClLQ4KsyX2o+rNejT1whJjLp1Eiw=;
        b=XONt1chxW1tXsfPSuVpasafFiGgDi0RsuVVwYz0VKSq5LbZoUCPd29lLayI44j06fR
         fSDrYIP8VWUi42Ddm/9jjiqoW/1phBcWCPQvsrfHG8h3TDXAicsK7fkUCysTmDitiiWy
         6cOKSokmyiy5lOn6xU1a9z7b1vgOx/SRAyGMu7GmRwubQ94Y/+kfSdpZtdVlzyswKJNf
         p4gs1doUTc0aAHoO6eO1ffiMdwPsFGxfjoS5dyGgYwHMzDGsbaqDDFeC6mDuasubMOmk
         9sHOIukLG2W8tO9/Lz+9dFssm+As3j+kHNPL0Uw3kMfrc4fZQcb/HOP3b5raitYCqTtx
         USRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVklzvBDFOqdJukZQvTgnH3A/q+JZrW9O3+pc13JJwoE7E+pYW6Gjvs+GhukGVwwbDagfj4wCORvhTMr60a6E50m8SIJj1AsQvd5st60s0=
X-Gm-Message-State: AOJu0YxON5vtdQL0nWycAGlUTSW6mfCuYICFvB7nYgvZnMvSNLKYvBOe
	o9jCeXDsiwX11JW5wl3yOMnP7wmbB3oISEMKlFXzBd1I9pfF0NLdvHwi/NriuAVNRU9oFrFXPf6
	f
X-Google-Smtp-Source: AGHT+IHvtYCYaHND0Sb2jL0BiO4LZ56Fc9N75yLNdjwfGZJLm2q/954mLway+/Lw02tQVW2k7ATT0A==
X-Received: by 2002:a05:6214:4412:b0:696:4086:5e1 with SMTP id 6a1803df08f44-6a16790406fmr53215156d6.2.1715366332964;
        Fri, 10 May 2024 11:38:52 -0700 (PDT)
Message-ID: <fc278245-4666-4820-80cf-a0d39ff965fe@citrix.com>
Date: Fri, 10 May 2024 19:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair_analysis: tag MISRA C Rule 1.1 as
 clean
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <c19bc75727d18399f73a19dae991660c608a4a84.1715352180.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c19bc75727d18399f73a19dae991660c608a4a84.1715352180.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2024 7:03 pm, Nicola Vetrini wrote:
> Tag the rule as clean, as there are no more violations in the codebase since
> 93c27d54dd23 ("xen/arm: Fix MISRA regression on R1.1,
> flexible array member not at the end").
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


