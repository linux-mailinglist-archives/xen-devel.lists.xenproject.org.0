Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCKEAoIRg2kPhQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:29:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5BDE3D7C
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220298.1529009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZCP-0004mK-HH; Wed, 04 Feb 2026 09:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220298.1529009; Wed, 04 Feb 2026 09:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZCP-0004jf-EC; Wed, 04 Feb 2026 09:29:25 +0000
Received: by outflank-mailman (input) for mailman id 1220298;
 Wed, 04 Feb 2026 09:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ke1/=AI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vnZCO-0004jY-E8
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 09:29:24 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc6cc8f6-01ab-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 10:29:21 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-480142406b3so49030105e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 01:29:21 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310895107sm31234985e9.12.2026.02.04.01.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 01:29:20 -0800 (PST)
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
X-Inumbo-ID: fc6cc8f6-01ab-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770197361; x=1770802161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VGqIGOmp5L6oImFK/rrOvkiXDVA06P2GGn1E0eqG14=;
        b=Eav+GK8ZjUzuLz7N2PbTghD/N46Bg38v09Z/5F60dAVFuNB3sbzp0cz0btCyxuosy9
         BiDUC2JzqDG2iR+u1k+4kM7fVKFyC/5bfBPIQr/jd8twQQAOzxE687oh6JkjN8nX4C4f
         4yAtcp/cpPVZJuDB6yUEcD2Oh/FUnZnWJ1uGf9ATS9ZAFLdIRFUT6Les+Fxq11rIWg/P
         m5vjCAjz8ri1FlxpTqpsG7kmVxnM5F64vG6zhr+ezNCNgLBCrLW2FZ8EavE2ZEA6twP2
         b3GcVwaY5+uiObV1cp6fMGF++PL3CFz72HeJMe3kXz84A3ZapboelgsEDpOJQgDU+pJd
         hvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770197361; x=1770802161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VGqIGOmp5L6oImFK/rrOvkiXDVA06P2GGn1E0eqG14=;
        b=JtDT1ELXqgOXKtdu30pupXppnoJc2fzNVVYRgk1/taIzeAkg9ePWqR/5vUCvQvIiGZ
         DUmT39Yj/Z14HDhsLV3INVyHgCbDudWUwrd4z1/636wElge5kKW7ToPlG37n5P1hMUCT
         QG8Iov5Oy9SWydsEX2RY7bBCtCM5972UiZfvCR6O3ME+0jOMp2qWLOwdr6fh2a8PRxli
         zP437i5gAN3AVEE66ZSuJnReoouD/MV0BqfSgVGdcEv3N9xxW3bFw06vJkwNR65q5Xsq
         Pah3z8pae5Hulkro/YsN/AzwZ95aRv3Lmoikid8y6hVndK9y0TVTGWBncaQU0VT5myWk
         GUeA==
X-Forwarded-Encrypted: i=1; AJvYcCXVB4lvml2xcNjm7mgecYxA4vd0TwBfMliH2pLMEDpEFkwrX/lc7neV+R6I8rBk2CYDlQSDMrOLMX4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVlbjJdKTvwHqv5EqZbJ1+FLVp81lcLFGBUV1Xu2sAwvmFE/c8
	GNQ92xtlrpKxWjjOfkreG2S4q6WHe9cohfJ6O/G6rSB/g0LxPpjjpqCW
X-Gm-Gg: AZuq6aJlw0t3ptvnUldTrFyvJawhseg3xleQXZJUqoIJ6teXbquPZTFI96U1n6GuiOC
	cdJ7Nqg/TqEflPgNZFr/Qhi2sHQj88/TplHakZAbl/Gf/ps/Jl7JV0e+uiuSGfdLaoUjF8tm2Pd
	q+lOsAjpVV0KZApUqlF3MGoHGObY+acXu478BCMR7Bpajah6mZ7LoJ7H4AsFdXTxnyPg4BlAw/k
	GaZId6stQsPLE4KjfMVcPTYHOga7pX5RmcHFCDmOiA+H2HbDgPOmaMk+Q+cFIp0ZxiRadfBYhOD
	DkkABOEmb4CuN9Tk3vo7pXI4oPOYG0Q45I0RgsNJJm7zlgSsYT5moo/14x5/iw6+EAm31oev2FH
	Bacm1GWQ6pJVVMSm6sc0/aXuoGpNIvJD+tJS8CvZgt4F/YpG5aioi+ZzFo8YAcwrv72RCW+ybDJ
	lcMmz5d4pWcNN5CVCvbhPoyn2NJuf+eeG4UCpSXS/RdTNeZUfC7YBlaYE/bJEFotU=
X-Received: by 2002:a05:600c:3555:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-4830e93eaa6mr38843345e9.3.1770197360460;
        Wed, 04 Feb 2026 01:29:20 -0800 (PST)
Message-ID: <061f894b-fbe0-4565-a9e2-502c97b1dada@gmail.com>
Date: Wed, 4 Feb 2026 10:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] xen/riscv: introduce sbi_set_timer()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <2fd4da2ad7c4af2241368edba739b24d0e976552.1769099885.git.oleksii.kurochko@gmail.com>
 <9f2b3559-0658-4343-abec-1a35e7d6da44@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9f2b3559-0658-4343-abec-1a35e7d6da44@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9F5BDE3D7C
X-Rspamd-Action: no action


On 2/3/26 6:02 PM, Jan Beulich wrote:
> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/sbi.c
>> +++ b/xen/arch/riscv/sbi.c
>> @@ -249,6 +249,38 @@ static int (* __ro_after_init sbi_rfence)(unsigned long fid,
>>                                             unsigned long arg4,
>>                                             unsigned long arg5);
>>   
>> +static int cf_check sbi_set_timer_v02(uint64_t stime_value)
>> +{
>> +    struct sbiret ret;
>> +
>> +    ret = sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
>> +#ifdef CONFIG_RISCV_32
>> +                    stime_value >> 32,
>> +#else
>> +                    0,
>> +#endif
>> +                    0, 0, 0, 0);
>> +
>> +    return sbi_err_map_xen_errno(ret.error);
>> +}
>> +
>> +static int cf_check sbi_set_timer_v01(uint64_t stime_value)
>> +{
>> +    struct sbiret ret;
>> +
>> +    ret = sbi_ecall(SBI_EXT_0_1_SET_TIMER, 0, stime_value,
>  From this name I'm judging version 0.1 is meant. How does this fit with ...
>
>> @@ -326,6 +358,14 @@ int __init sbi_init(void)
>>               sbi_rfence = sbi_rfence_v02;
>>               printk("SBI v0.2 RFENCE extension detected\n");
>>           }
>> +
>> +        if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
>> +        {
>> +            sbi_set_timer = sbi_set_timer_v02;
>> +            printk("SBI v0.2 TIME extension detected\n");
>> +        }
>> +        else
>> +            sbi_set_timer = sbi_set_timer_v01;
>>       }
>>       else
>>           panic("Ooops. SBI spec version 0.1 detected. Need to add support");
> ... the panic() here?

panic() is still here as then we will want to add support for rfence v01 SBI call
too what hasn't been done yet.

Could it be an option to change panic to:
    sbi_set_timer = sbi_set_timer_v01;
    dprintk("SBI v0.1 isn't fully supported\n");
and then add sbi_rfence = sbi_rfence_v01 when i will be first used?

~ Oleksii


