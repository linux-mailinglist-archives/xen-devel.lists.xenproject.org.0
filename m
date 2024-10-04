Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D49D990C71
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 20:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810608.1223326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swnMj-0001PA-T7; Fri, 04 Oct 2024 18:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810608.1223326; Fri, 04 Oct 2024 18:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swnMj-0001N9-Ps; Fri, 04 Oct 2024 18:49:25 +0000
Received: by outflank-mailman (input) for mailman id 810608;
 Fri, 04 Oct 2024 18:49:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kl2=RA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1swnMi-0001N1-DN
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 18:49:24 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e899a16-8281-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 20:49:22 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c42e7adbddso2829454a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 11:49:22 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e663f4fsm28645166b.92.2024.10.04.11.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 11:49:20 -0700 (PDT)
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
X-Inumbo-ID: 5e899a16-8281-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728067761; x=1728672561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pXcXchHRyspHEtFKj/8Nl7FIg1t1X1qUr6b0qgmDPqQ=;
        b=XkRycn9XrhPC6pUrPWI4d1S+xrXafVPgXkH9t753cx9igOc/Nx+SOuTA92B6ResJev
         QR8/jmAU9847xHF7joc1YxucmXj2YrTWIAMvj2IWQyDfGFOcfBbCHypx67lpAnKgSVIu
         mMY/5oK3XXZEmXj8bTIvka6hPGqqDWzXi5rnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728067761; x=1728672561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXcXchHRyspHEtFKj/8Nl7FIg1t1X1qUr6b0qgmDPqQ=;
        b=JSWv7scpmaKQAtGJ6EA8czDBfIVnDFiN2DkCKc2zsV6irdbBAo2ApJJEegFitDAxhy
         yGC/GnavaGxivT7KyEphqieTxslq7jwjUYqE6hs4B8OM3zwWmIDpyZTEAkMElFt5sN4F
         PcpVvnCV9EUrxl8JIHKApO2X2URi8FR53u9rDE0tVRPCR4hrMia7+kNWlBRro6fVcXpS
         WExyvuo2sf8MCZw1d+he+NEakmZvn3niorgs0OzflGgmih72Oe8kv/MtMRBUEkdmbU55
         ShgGwIBsbId5SMB9w2Qb632NnL+mfwNFJJARcSgxR3eNr8tRyoDhW02uDyfWqWzY0zkl
         c9JA==
X-Forwarded-Encrypted: i=1; AJvYcCV7LYdW+es9pBgAArnFHzwb1dRWKgUDpPg2xU0bWaAEF38xMpkz/EYSko9cfkOp7I+/DzvniApMxN0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcDxnl596JUXcI80MjFTu2RxLi6XId6b54XUuOayiDKChihDqC
	QFdXAvSC4A3ZmHsJAXofwrxLdBIji+rR2NxsSxXt6UJgs9jKVI84t8uRVHNwtPY=
X-Google-Smtp-Source: AGHT+IGK4+q9TDZZVT2IpXaTZoixlI5143zVYiecoltcha528vUPVZ6V5qYnH/aeA/3vlTaCkLUebg==
X-Received: by 2002:a17:907:960c:b0:a86:8b7b:7880 with SMTP id a640c23a62f3a-a991c06317fmr292648166b.63.1728067761494;
        Fri, 04 Oct 2024 11:49:21 -0700 (PDT)
Message-ID: <5357e6f1-6f3e-4ed4-85f9-828ffb0272e4@citrix.com>
Date: Fri, 4 Oct 2024 19:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Further simplify CR4 handling in
 dom0_construct_pv()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241002232008.1988682-1-andrew.cooper3@citrix.com>
 <7dbd7fae-e2e8-4508-a012-cf9b719c68f1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7dbd7fae-e2e8-4508-a012-cf9b719c68f1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/10/2024 7:52 am, Jan Beulich wrote:
> On 03.10.2024 01:20, Andrew Cooper wrote:
>> The logic would be more robust disabling SMAP based on its precense in CR4,
>> rather than SMAP's accociation with a synthetic feature.
> It's hard to tell what's more robust without knowing what future changes
> there might be. In particular ...
>
>> @@ -1064,19 +1065,19 @@ int __init dom0_construct_pv(struct domain *d,
>>       * prevents us needing to write construct_dom0() in terms of
>>       * copy_{to,from}_user().
>>       */
>> -    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>> +    if ( cr4 & X86_CR4_SMAP )
> ... with this adjustment ...
>
>>      {
>>          if ( IS_ENABLED(CONFIG_PV32) )
>>              cr4_pv32_mask &= ~X86_CR4_SMAP;
> ... this update of a global no longer occurs. Playing games with CR4
> elsewhere might run into issues with this lack of updating.

We don't know the future, but I'm confused by your reasoning here. 
Right now there's an expectation/assumption that FEAT_XEN_SMAP == CR4.SMAP.

In fact, the logic in staging right now is wonky if FEAT_XEN_SMAP=1 but
CR4.SMAP=1.  In this case, we'll do nothing on the way in, and then
activate SMAP on the way out.

construct_dom0() will definitely crash if SMAP is active.  So looking at
CR4 is strictly better than accidentally falling into a FEAT_XEN_SMAP=0
but CR4.SMAP=1 case.

Needing to play with the global cr4_pv32_mask is a consequence of
choosing to disabling SMAP, rather than using STAC and/or rewriting
using copy_*_user().  If you want to avoid playing with cr4_pv32_mask,
we'll need to revisit this decision.

While the APs are active/working at this point in boot, they're not
running guests (32bit PV or otherwise), so alterations to cr4_pv32_mask
don't really matter.


But, as to the robustness.  The code is now written in terms of it's
actual requirements, not its assumptions, and no longer malfunctions
when it's assumptions are violated.

> As the future is unknown, I'm really fine either way, so if you continue
> to think this way is strictly better:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

