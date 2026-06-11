Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yHaFKLHTKmqzxgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:26:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F36C6730CC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:26:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=LphuEYKg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335774.1597955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhIR-0003g1-58; Thu, 11 Jun 2026 15:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335774.1597955; Thu, 11 Jun 2026 15:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhIR-0003dr-2T; Thu, 11 Jun 2026 15:26:19 +0000
Received: by outflank-mailman (input) for mailman id 1335774;
 Thu, 11 Jun 2026 15:26:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXhIQ-0003dl-3j
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:26:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXhIP-006vMc-9R
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 17:26:17 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ad38b-5cb7-0a2a0a5109dd-0a2a450a9baa-42
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:26:17 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ad399-56b3-0a2a450a0019-d155dd2bbd44-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:26:17 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso4421721f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 08:26:17 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e533848asm67339135e9.15.2026.06.11.08.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 08:26:15 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781191577; x=1781796377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GTrugLe6FvUIrFVflDGD/CoqeuPHvSFzIUGZgVRq/yY=;
        b=LphuEYKgcJvmDGB+WjyCBsSJyIvwTsarCi5Y8AXVQ6saZsfwzR09OhxDUgfaGOmDiq
         cmTsPT0BSLDLWTgh6jJ7u7sAtqUgOO0T7fImBBr1VHpYosSdJEx2UBMOlqNCKaK1EFSo
         MOdZ1/QNIS1IabMMckz52xD5c0Tftf4p5dlAFHtzNBbQlLe499kWzTMNxU9JQjPFN30T
         S2vNocSD8groB2FbdDFivxCc2/gR1FrC5nFdQqY3WffjpyOfD6U5UK9hxmCqZsTGuB8u
         qOSebTeaCE4GXqnpuLvTGEQX2Wkpqk1VhxzwEMoqlYyWWWSTkArXwmUBVOUb0RzfzHIq
         H6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781191577; x=1781796377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTrugLe6FvUIrFVflDGD/CoqeuPHvSFzIUGZgVRq/yY=;
        b=VNxIgjU6Wl03KSSEezMIh0CfqEAxUT+X59AogwvTy6Znjz80kWJpe0FvoDt8o5fMaa
         NnfOKvxMU3lNdY9XDPG5+C8/mnvQPOtRw466oj76trybFzEuNFPC7Mm/FYQvVR/Gl1qa
         xqi+CpYlFVVWgq6DWlCnQXcqgA2jIYFypenX+DFGzAPDYB0XxUpZDHbwpLk3rEg6O1Y8
         K+zm9OBB6W7+QIONbWcD92z/riRm7ybveN+SvETrjwB3BwQmiVLyyfRssRc0TZprNZPx
         qNCVVVDR4CwLoQzebY+lkw8aMl5YxGK/Jv9usLqc5/Y5EuUelFmcH/qtqdRnoUg9sEtY
         9Pwg==
X-Forwarded-Encrypted: i=1; AFNElJ8mTRLzPCvovASY3BFH5oQlMjViPVcWx5N76AFMgTISVwnV3qjX6HqNH0/FA6a7vLdpN+HR9jPbGI0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyF4Kgu1/3an85gjnYKtd/ktzi4sYTBGtJwrh3AVToPpKD3hd/i
	BL+tFc38KNV92SRG15QbsARtH0PhjTq9zzByGUHNz5Xjmp6gs5H6J6ha3a2VWbN3UktzBJdT3/O
	MJ9w=
X-Gm-Gg: Acq92OEtWYLZkGP5jz8PVpioq8JDMcdxvosSS5WzBr0KQt7FBokc/b8kxq5JFgl2+DH
	fIR+IZTJ2faVwD+nyaBQWUA4dKeIANVjaKOorS0o/ZwhoFunmDDgTBs/QpL4eh3z7LTj7LOisAK
	ej91mFgbgNiij+CVGjaylzgOjOcES5yO1kYeDubXS9pNrxtdvttO/poR8IblPhLR2DpY/uyLWny
	khgZIlCYcnCKZt08TdqZ+TQKuKIUIPioj49/UiCdvqVg/svvenxGPSy1jvEzEhIma3YDyBqNt5I
	M5P0WaE0teIlXrC+6BKg5h4Rn4teGY6lrKc6w9ujPR6tlUYc15YCwIiUUguYzeYO1JUFcVgMCfp
	OrMKAi4u/Ozpq+1h583wksMS+P9xoqKyqeczqPXDNbVSxEkraOpYiuz+xsHfaebRwRNMMpSm/z1
	tCcjiAOCubbaw5oIuKdyAhjxGv5awlg+EHb1iRacFGKAQjr25C7QmrsUuSky+8c+Cwed/shQxfz
	fVzfgGu16mQDCnWMpCMa1uoO9fMSrm1lyYhCFPCVSr9+NdtreKmuGAakh9AwHzy+QCWaszFiyNs
	eBJGGQ==
X-Received: by 2002:a05:600d:6451:20b0:490:d079:2919 with SMTP id 5b1f17b1804b1-490e55cdbf9mr35861215e9.14.1781191576463;
        Thu, 11 Jun 2026 08:26:16 -0700 (PDT)
Message-ID: <d5e26c5f-31cb-42e3-9a91-ee42674cf184@suse.com>
Date: Thu, 11 Jun 2026 17:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] argo: lower level of noisy connection-refused log
To: Daniel Smith <dpsmith@apertussolutions.com>
Cc: dmukhin <dmukhin@ford.com>, xen-devel <xen-devel@lists.xenproject.org>,
 "andrew.cooper3" <andrew.cooper3@citrix.com>,
 "anthony.perard" <anthony.perard@vates.tech>, julien <julien@xen.org>,
 "michal.orzel" <michal.orzel@amd.com>, "roger.pau" <roger.pau@citrix.com>,
 sstabellini <sstabellini@kernel.org>,
 "christopher.w.clark" <christopher.w.clark@gmail.com>,
 Mykola Kvach <mykola_kvach@epam.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-2-dmukhin@ford.com>
 <ae19de19-aef5-47af-833d-87a46efb9afc@apertussolutions.com>
 <c51ecc59-7252-4d1f-a192-717ae55dacd5@amd.com>
 <19eac3f10c4.4656d1b3334797.1477306808945740845@apertussolutions.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <19eac3f10c4.4656d1b3334797.1477306808945740845@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1781191577-7C8788B7-B4CA10F9/0/0
X-purgate-type: clean
X-purgate-size: 2178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:mykola_kvach@epam.com,m:jason.andryuk@amd.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[ford.com,lists.xenproject.org,citrix.com,vates.tech,xen.org,amd.com,kernel.org,gmail.com,epam.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,ford.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F36C6730CC

On 09.06.2026 13:57, Daniel Smith wrote:
> From: Jason Andryuk <jason.andryuk@amd.com>
> Date: Mon, 08 Jun 2026 19:16:01 -0400
>  > On 2026-06-08 15:54, Daniel P. Smith wrote: 
>  > > On 5/26/26 5:58 PM, dmukhin@ford.com wrote: 
>  > >> --- a/xen/common/argo.c 
>  > >> +++ b/xen/common/argo.c 
>  > >> @@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t 
>  > >> *src_addr, 
>  > >>                                           src_id.domain_id); 
>  > >>       if ( !ring_info ) 
>  > >>       { 
>  > >> -        gprintk(XENLOG_ERR, 
>  > >> -                "argo: vm%u connection refused, src (vm%u:%x) dst 
>  > >> (vm%u:%x)\n", 
>  > >> -                current->domain->domain_id, src_id.domain_id, 
>  > >> src_id.aport, 
>  > >> -                dst_addr->domain_id, dst_addr->aport); 
>  > >> +        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst 
>  > >> (vm%u:%x)\n", 
>  > >> +                     current->domain->domain_id, src_id.domain_id, 
>  > >> src_id.aport, 
>  > >> +                     dst_addr->domain_id, dst_addr->aport); 
>  > >>           ret = -ECONNREFUSED; 
>  > >>       } 
>  > > 
>  > > My apologies but this is not the wisest approach, hitting this is a real 
>  > > error and shouldn't be getting silenced. 
>  >  
>  > -ECONNREFUSED is still returned, and that is the important part, I think? 
>  >  
> 
> Absolutely not. Argo at its essence is a security protocol where you want to minimize the amount of implicit trust we have to have with the endpoint. Telling a bad actor he did a bad action tells you nothing. The send operation is the critical security path and you must have an auditable record that an endpoint misbehaved. If yo want to implicitly trust your end point after passing the accees check, then you can just use grants. 

Yet then - is potentially spamming the log an appropriate model? Furthermore
gprintk()-s are, by default, rate-limited in release builds, and hence there
isn't going to reliably be an "auditable record" anyway. If you want logging
for auditing purposes, I think you'll need to add separate logging (not to
the system console).

Jan

