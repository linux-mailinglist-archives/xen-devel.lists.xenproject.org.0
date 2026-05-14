Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPwNLFt5BWoaXgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 09:27:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDDA53EDB2
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 09:27:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308694.1580072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNQTO-0004EX-0m; Thu, 14 May 2026 07:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308694.1580072; Thu, 14 May 2026 07:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNQTN-0004CE-UB; Thu, 14 May 2026 07:27:09 +0000
Received: by outflank-mailman (input) for mailman id 1308694;
 Thu, 14 May 2026 07:27:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wNQTM-0004C8-D8
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 07:27:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNQTL-009cVS-Ps
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 09:27:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a057910-2eae-0a2a0a5409dd-0a2a4507a780-28
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 09:27:07 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a05794b-229c-0a2a45070019-d155802da8b2-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 09:27:07 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so46941665e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 00:27:07 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fd63052b9sm14143555e9.12.2026.05.14.00.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 00:27:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778743627; x=1779348427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i8d7z1rh/c7xbzrs4O0IBsk/WrWbYrbyGA7OYm+AvuE=;
        b=ra0pLFDnlJCYyZWtv+H/Ipb3fcbT3EWYC57wOjpn6vluGrcrcESMvNk3GVFMeTPNlM
         ynhtk1GwzX1t42RsyYggb377mKoh8/KxvLFEK5J/w1p1vpmBONCZoBUwEAXURidmKKpv
         ssqydpEP8cI+n4ZXx7/Ih5oDtkFVqnFoD5mlppZaRU6tpqbGncgPEz6YmQPzk2RPWveD
         igS/2shBv/OuRa3mtascahwBSZKHWTh8jTvJuwpE/iauJgdyGJJAC1G6UfOte+8vjemq
         cbyFIzckg2PUuGIqcmicAkxF2QU1Prl/SKhcSnP6KO+FIaT9Ddwuy6ZgoD/TtEp+AhUY
         fSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778743627; x=1779348427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8d7z1rh/c7xbzrs4O0IBsk/WrWbYrbyGA7OYm+AvuE=;
        b=Eg623YzmY5R9EZptKdZk0fT0oLB2e6t9hpz3ZS4sOEzw1/6hUGnSBVNkN+wxnQjXD/
         7Nnekgll/JRWg2sxbCNxXNebDEZiBD00bmbggRT2G4b0ONvdcKz9Jx2aFJTtihuZoQiT
         FFMnt6kkk6RjwVvyEfA99hy/NxEqzI5jsDl+I7k6d0dvfzFU+JSviliJLjFRiVmwMKaQ
         VxKffidJapGHMkM20rOiE6qmj5qUg+igtLAD0RtA8Spze4UXar896ie7bO8SCGtePc6/
         5UmUL6CuY8TR/oHlNNqu9hKMfKpkUcUp/+WRxfTx35bfMEei12qgcjoftinz5QCx6ZkR
         oLNA==
X-Forwarded-Encrypted: i=1; AFNElJ+otTynajBR5RjdZqExrP00zKFNL6OJrzm+y3oIjXW7dX5tiQBa+NPkB9cjLsr4auX3xtJ1zwvx4gc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2fM2a2q5Ia9ZeMYfTE4/+krKlu7WeeBeSiOUjfvbfevU29aPT
	V4ZfGiBV0BBW/in7NFg9D3U89+45LS1WhhTvnJLMf3FXc9fSyrPZFafP
X-Gm-Gg: Acq92OFwx7jMih9Ykd907hF6aAYCfolMhV7qUAS+w4JQj5miDYaRhUo7XUWjjtlwNjp
	O7mSRd3DVnC0RO2emPGFiXOTRup93O2UNRisDIWLjNdcbGDBHn23XiB30oGMqMlU6tPNj95drVr
	00T4TeNwbGIs3lMTvTD8O7Opyvs7cg1+wktmwE6Y4dUzCtGBVj7CuWXTR/maSqfz/cN+jDgZ5gy
	OrGabpH+IA2rVejHtWlFPHp/Y8ut8UVp6xFI0LEdDodH92d0Qg6d9dYX5G0iNbYZecM+KOiFWAi
	VkLGMifyaVHDRsw/9pbQd6lgm7ufn7rfReXVNZfRze7HcQL68CyWuVnNcgS/ZgowHxDbg+JpTGr
	CC7ttjwscGZzlDzjLxBjd1cffn3tI3E0ZM7gygGbqg3vjnBUYcdLO8VEzIQ4c1nNag7owl09FMg
	cU6CM7JHt4JwidSc0i9cdKfa0n9SijQkklxEGu8ydCc69FpsfEvkh6Of5RecWnK9k64fd2DwYv1
	O2yein5LHhgGg==
X-Received: by 2002:a05:600c:34d6:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48fd635049amr779655e9.7.1778743627246;
        Thu, 14 May 2026 00:27:07 -0700 (PDT)
Message-ID: <e81837f1-8d97-42c6-9bf8-f6829213733b@gmail.com>
Date: Thu, 14 May 2026 09:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 1/5] x86/time: use RTC century byte when
 available
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <2723456f-5d8c-4a2a-9876-e65d35579936@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2723456f-5d8c-4a2a-9876-e65d35579936@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778743627-23175C48-3A017615/10/73395122804
X-purgate-type: spam
X-purgate-size: 1635
X-Rspamd-Queue-Id: 0EDDA53EDB2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	URIBL_MULTI_FAIL(0.00)[suse.com:server fail,lists.xenproject.org:server fail];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/12/26 4:58 PM, Jan Beulich wrote:
> Without this the present logic will misbehave from 2070 onwards.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Generally it looks like 4.22 won't be used in 2070 or higher (I am 
curious do we have similar use cases now that very old Xen version is 
used nowadays?) but the patch looks pretty straightforward:
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1257,6 +1257,7 @@ struct rtc_time {
>   static bool __get_cmos_time(struct rtc_time *rtc)
>   {
>       s_time_t start, t1, t2;
> +    unsigned int century = 0;
>       unsigned long flags;
>   
>       spin_lock_irqsave(&rtc_lock, flags);
> @@ -1280,6 +1281,8 @@ static bool __get_cmos_time(struct rtc_t
>       rtc->day  = CMOS_READ(RTC_DAY_OF_MONTH);
>       rtc->mon  = CMOS_READ(RTC_MONTH);
>       rtc->year = CMOS_READ(RTC_YEAR);
> +    if ( acpi_gbl_FADT.century && acpi_gbl_FADT.century < 0x80 )
> +        century = CMOS_READ(acpi_gbl_FADT.century);
>       
>       if ( RTC_ALWAYS_BCD || !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY) )
>       {
> @@ -1293,7 +1296,12 @@ static bool __get_cmos_time(struct rtc_t
>   
>       spin_unlock_irqrestore(&rtc_lock, flags);
>   
> -    if ( (rtc->year += 1900) < 1970 )
> +    if ( century )
> +    {
> +        BCD_TO_BIN(century);
> +        rtc->year += century * 100;
> +    }
> +    else if ( (rtc->year += 1900) < 1970 )
>           rtc->year += 100;
>   
>       return t1 <= SECONDS(1) && t2 < MILLISECS(3);
> 


