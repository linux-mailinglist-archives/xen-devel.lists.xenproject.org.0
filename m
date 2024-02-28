Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7ED86B2F6
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 16:21:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686710.1069072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLkE-00048o-Ax; Wed, 28 Feb 2024 15:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686710.1069072; Wed, 28 Feb 2024 15:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLkE-00047I-7W; Wed, 28 Feb 2024 15:21:18 +0000
Received: by outflank-mailman (input) for mailman id 686710;
 Wed, 28 Feb 2024 15:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIhW=KF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfLkC-00046f-8I
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 15:21:16 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02ada04e-d64d-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 16:21:14 +0100 (CET)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-68facd7ea4aso7932696d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 07:21:14 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 od1-20020a0562142f0100b0068f9b20fb0bsm5268569qvb.100.2024.02.28.07.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 07:21:12 -0800 (PST)
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
X-Inumbo-ID: 02ada04e-d64d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709133673; x=1709738473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j8QTheCBKVUBKIDTYuNTqQKn7bHopMG2hMs7YpvwL3U=;
        b=db7jyLT/TtxwD250EOvy1G/mgPbssl/1RbR5s645p+DWO8E1vYtreDXncA/1yQn6BY
         /JOQ0EIEe9cvFDJD03fEyae/jPt4/YvcNxvH6fUclqvIsVCiztpFhNsZBuRz1cQCGq2p
         nrFpqG/SiirxKh1S4hcxwqgMJr+09ZvJH0LY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709133673; x=1709738473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8QTheCBKVUBKIDTYuNTqQKn7bHopMG2hMs7YpvwL3U=;
        b=P4GmKbRDWDno4wfOKnGJTBXsG/aFyP6OZV9vXMkgHmQwyyBtuTe247MRDQEQWaHFaA
         Z1+gXPPztRYv4mSE6xbk4Ww77seg1ELAcOQu/Qpr9GWjUKTnEk787hHlCshbdpSPLTy6
         adtqEeYv3gcyFswMHFSsvBeY0AV/qtr3HzZnkqwVaEY5MSHCcp5KVpgjv+Rmf7npB4zK
         5ftswTYh9380xB5MsoSOV1oxXAZ9+57eR/HvtF6qrq8+iJdavG/PG/pLYCFQwVguiRAT
         NONC5rbYnEQFrYz/nsXPVIZDJcwnaF+QnQErXJ4oVEaOLkGxnaYHjQQRs53dJE84Tuhs
         tFHA==
X-Forwarded-Encrypted: i=1; AJvYcCWCQZA5mDFIHoRO4Tu5FkDzFbLRdmlAY78PFVoBRGGrR6RLev6Atrg7OcwWLironn4adrG48CO36qOFVpzdoFrySjSmHS60Crci4poHRtg=
X-Gm-Message-State: AOJu0YyAH20lETt1so9Vny9iHKz2S+NheISEvW0dHX8wP1EdRnR8TDcL
	d/NjA6X8kjdL6O/sBu3ZXHbGFfqplEWU2fMbovlg8IGRKnkRIcTEtYKQDnZsAzs=
X-Google-Smtp-Source: AGHT+IHgPadCOuUfGjl3pP8WzlQeO8n82cN1iJCQ/5y3YWVMXyvauzK4uwFaGn4xem11JmxI/lgP2w==
X-Received: by 2002:a0c:df85:0:b0:68f:edbb:f317 with SMTP id w5-20020a0cdf85000000b0068fedbbf317mr2710300qvl.30.1709133673589;
        Wed, 28 Feb 2024 07:21:13 -0800 (PST)
Message-ID: <aebc274a-31ea-41f2-abb7-e45493ada436@citrix.com>
Date: Wed, 28 Feb 2024 15:21:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/traps: use entry_ssp in fixup_exception_return()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
 <45f89d82-bdc6-44b6-a784-bcdfdcca403d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <45f89d82-bdc6-44b6-a784-bcdfdcca403d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/02/2024 1:52 pm, Jan Beulich wrote:
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -837,24 +825,26 @@ static void fixup_exception_return(struc
>  {
>      if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
>      {
> -        unsigned long ssp, *ptr, *base;
> +        unsigned long ssp = rdssp();
>  
> -        if ( (ssp = rdssp()) == SSP_NO_SHSTK )
> -            goto shstk_done;
> +        if ( ssp != SSP_NO_SHSTK )
> +        {
> +            unsigned long *ptr = _p(regs->entry_ssp);

To double check, this works by the magic of:

    signed long entry_ssp:48;

getting sign extended back into a canonical address?

~Andrew

