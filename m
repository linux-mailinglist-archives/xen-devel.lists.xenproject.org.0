Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B81B3EAD1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 17:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105103.1456072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6a5-0005hX-Jl; Mon, 01 Sep 2025 15:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105103.1456072; Mon, 01 Sep 2025 15:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6a5-0005fB-FZ; Mon, 01 Sep 2025 15:36:29 +0000
Received: by outflank-mailman (input) for mailman id 1105103;
 Mon, 01 Sep 2025 15:36:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdOO=3M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ut6a3-0005f5-RK
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 15:36:27 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6badfe43-8749-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 17:36:25 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3cf48ec9fa4so2276437f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 08:36:25 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf270fc496sm15946333f8f.1.2025.09.01.08.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:36:24 -0700 (PDT)
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
X-Inumbo-ID: 6badfe43-8749-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756740985; x=1757345785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qa/Hedt3Y8zuBYIdTot2jnq+2kQydTcFXmUh1zEBTEs=;
        b=iIsHKqG2zqSAgd27kCPc0KIIhlA2aBAYwQYEJSKhehFWfAsW5Cuz4K08el3jI72xPV
         XsgF7Yknw5oP2qCbyN7neCyNUIbMGZItZqLpV3wOBhDGDiqepEbuPiq32nxE+Fxp2rcC
         RlzQSgZmG3gz6AuBx9xPs2wUnd+nzdf0qfyfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756740985; x=1757345785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa/Hedt3Y8zuBYIdTot2jnq+2kQydTcFXmUh1zEBTEs=;
        b=Xu/4YZJhbZwTQ8Vyt/1K/BLyW6OTaxR5usRcibbfVZe7G9Lp/oI0B/eGh4RKeiic0L
         77tHwoiwH8Z8iO+7W7iPsVHVGLmuXS1ZT7kNMiW/dQorHPGaYOTR1/mCxChbFERd7Yu1
         O/idILgsn8vcw6BcAHgHsNlrgJee9mf/hP5+P2Zex3OtRggY+hcCQ1rbGaLJPUiUzHfo
         lCl0pnoS2U0XdfANEKMqTIVPj6bz6rpR/qA3I0wrnMb6O61biV4qeUGVmnx7068rL76c
         bTLZ1LuBpRTnE9sD4tNpQGmcfO6ExEAuyXXuF/SsYtqI9lOsbHoccvmLATOOSI5N+1Hp
         cB9g==
X-Forwarded-Encrypted: i=1; AJvYcCXRotPU2BgRmdwanSutc494rSCfHVu5UvEzGdrssXsagimSYNB9q4VeRkLvGU0uphMJbqNmm7kARUs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLc1dz966v2btEsu3EnCp28JhO1cqCxcnRx7bLruv5PzzxzE5r
	xAEV6YCgkJzuzuPz99cpw2cUUzzINfoGBhg/V+vWOzLVg1UiCgi5SeV1TaKTo07FQ0doylfT586
	OoVK8
X-Gm-Gg: ASbGncv8w3+ede2e1ghUTmveLnTguI9Nb20W6WEXuU4nRsczbZ1l9+UrMtS8lq83SrA
	ieFAV1M24B86kwMLXtFSYSbPpwuKX71olLCIVcbFGdqD4RcgD7sS2bARbq9rsx+wdIDwQIF1wkc
	qVgtBYyPLkdYF5uk2Jv5rwrP/xXfoDEluD4WaVaDbyuT3arNRAkDMyth7JUSE8IqfDNrUEgRhrz
	GxhsARS5WDUvysNDRK4I3Mw7UT6kl4x/S+qbkSB9aOKZ4CNLF+LctBmnCXn+KAFAl8+c/Kj2B7P
	XPGPiy4IHRyFg6TbDUSgRBWpkbKmttZisROqa3dKeeydRv1Y/0puAcm1A5AYZw6K5BLo/a09478
	mSuoEL/DG7Ku8ZCEHOgTXBzsiJIlM/QuzqtMuvM2Td+aLH9a4U10WFcYeWpVfMotpglut
X-Google-Smtp-Source: AGHT+IHGTt2wR4EiP5O1Cc3QdCgxuLmSpcMi+zAjU3yrs+h0FBBdwM6ig6rltchyXJYWTQYFqsIm2A==
X-Received: by 2002:a05:6000:25ee:b0:3d6:92ed:cae8 with SMTP id ffacd0b85a97d-3d692edce86mr4181226f8f.34.1756740985253;
        Mon, 01 Sep 2025 08:36:25 -0700 (PDT)
Message-ID: <d113f104-8bf1-48d4-bd99-2ae06c0ea448@citrix.com>
Date: Mon, 1 Sep 2025 16:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/23] x86/traps: Make an IDT-specific #PF helper
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-12-andrew.cooper3@citrix.com>
 <5c0cb015-b2e7-467d-9c1f-2314bcb66ad6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5c0cb015-b2e7-467d-9c1f-2314bcb66ad6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/09/2025 10:46 am, Jan Beulich wrote:
> On 28.08.2025 17:03, Andrew Cooper wrote:
>> FRED provides %cr2 in the the stack frame, avoiding the need to read %cr2
>> manually.
>>
>> Rename do_page_fault() to handle_PF(), and update it to take cr2, still named
>> addr for consistency.
>>
>> Introduce a new handle_PF_IDT() which reads %cr2 and conditionally re-enables
>> interrupts.
> Why does this IRQ-re-enabling move to the IDT-specific function? Do you intend
> to do the re-enabling yet earlier in FRED mode?

It is updated in a common path under FRED.

#PF (and #DB but that didn't get updated recently) are the weird cases
IDT mode.

~Andrew

