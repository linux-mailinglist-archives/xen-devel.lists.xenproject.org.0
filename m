Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R0zEFgwvRmokLQsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:27:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CF26F53B0
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:27:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=RwdQA7fA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351453.1608621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDhh-0005C7-Kx; Thu, 02 Jul 2026 09:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351453.1608621; Thu, 02 Jul 2026 09:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDhh-00059r-Hz; Thu, 02 Jul 2026 09:27:29 +0000
Received: by outflank-mailman (input) for mailman id 1351453;
 Thu, 02 Jul 2026 09:27:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfDhf-00059h-Sl
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:27:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfDhf-00DxRL-9L
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:27:27 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a462ef6-bab6-0a2a0a5309dd-0a2a4508d830-26
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:27:27 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a462efe-edec-0a2a45080019-d155dd2acda5-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:27:27 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-473ba028d46so1579709f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 02:27:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477ddf0f27bsm7055977f8f.30.2026.07.02.02.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 02:27:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1782984446; x=1783589246; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8ChJZT2uxOwOpgq3GZb2mrsTu1483VVYtw+84CX3LBQ=;
        b=RwdQA7fAR0pIVNk+UMxzDMhejuwDuhy87ydwhF1V24AI9+BG6drBT/DItalCMGRlLw
         D+pIkTiBgVXdi7bDzzoE7eiSAElqSzUcOa8eb6f9GV03ONxoA4UYp4vOt0eIPlhGfHGp
         KeRqETDSoxm/VtVyI6mNk/sNjUJhFWQsTgQY0kGugi+i6u62Ihu6N6Qiv5xeqTa0NT4Z
         m/R1WYNuZu/ss9DM5VxJbKryQoXOFWjXQJ4fe9pFyKtym3FCgRls10d66uV8Ygh+ntoC
         Z0kLT+CGkwkhNMbYOpwq+/eqOpweXcCWIpTL7K6oZyywxlsoMcwkejVx6UKRLq4Xi7EI
         upJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984446; x=1783589246;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ChJZT2uxOwOpgq3GZb2mrsTu1483VVYtw+84CX3LBQ=;
        b=kur0lQ4BT390C7SfaklHIbu4QhFqvYshk4Cui3yYLROHEM3R99SUVnwchobpS3srwd
         B8EIc/qqL7lKrp6XkYTwKS2aY3P5dPk9hCI8hdMiHxUKxUmFgLEdoQmNZqIB3B0usg0H
         45bCn7vQUHAZSbBVs/J/NJAU6aC1632KdLByi3bQnQTS12bi9cdI+kAzE57Mw97uu1bt
         OXX/PFIRQcHceK+ROYLBoXdzFGbl0vAq/a5lwouI5e8Uh2GV28MJLLHzu792Lvb3BbyS
         cp9eujJDWfOMlYdzIZ8QavC3hDRcx9S4+m4x3mVlfCZ/vHF7gAjlKx4lxHicCu0+Rdnx
         spFg==
X-Forwarded-Encrypted: i=1; AHgh+RpDhdT7KAp+LrPq8Rp+upRSIxfJKmnEeVP6Fy/rGpZ8V8XiYx/cxQUDwKP0uoRhu0Kciz8HXeKajEI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwU3DslXFGuXvZRGOTY/w1rtjyxQJsXBMbNq/oiVEifmQoKmWoT
	FE8U9cJ2ZdAlAMTmXsUaw4giCQ8mXchSHUtfvWaDsLFMphKf4xWodxB8n3MB2GEM6A==
X-Gm-Gg: AfdE7clc0zh9EunVQ+MvMmwNw4yTA47guwFG1sSZLXUZD3nciYUAH68PmGkJBvglFXO
	iJZuBVq1wSFTuyAyrQVnyP7DAmOT+ABbnSwzrSjPViyzqSzyuxKkSk2rDJ108trhLPUOCuOjKW0
	vU7cTdJWmn33GFW/qm7uO2WIYdroszdrt+mm+/N/QN5oOjUuBd8KE3a7LKlRqRR5RUNOcD7XZei
	owwKX51ycCgyND3CuuELGY5dwE1a99GQE6H1gF28fDCgidcvVmCniOC4Ahp3ohlqhS5b9P8yA9i
	1r74tFThlppmGB8IW/+URGaZTPsEtGXBQgJodmjPYh/VM6pA+8mdal85osioKTk1HCcrL2srkQA
	q+sPlIeqQAxt4L+PRYg7tWe67CzTZqCaIlk6wwJzkzyW4uD9jxllPmhhFo6XnLzTRd5QfnfNm3D
	aM6L+MtCQKVKXHIonnph5sjp8qktFQ1OrLiAeyxrzhu7vcAUuF8FZGl+VmhI32Aox4d1qlVG73i
	Jjp
X-Received: by 2002:a05:6000:2589:b0:475:f0c2:75ab with SMTP id ffacd0b85a97d-4775b176e29mr7562020f8f.60.1782984446607;
        Thu, 02 Jul 2026 02:27:26 -0700 (PDT)
Message-ID: <d61b30c4-4c63-4954-8ba7-3188ccebf0d8@suse.com>
Date: Thu, 2 Jul 2026 11:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] lib: make safe_copy_string_from_guest() validate
 input
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <7e492b98-26d5-4d90-a703-ee25beae7e23@suse.com>
 <1562ea63-7f17-4748-9380-94712dd84d1a@gmail.com>
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
In-Reply-To: <1562ea63-7f17-4748-9380-94712dd84d1a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1782984447-A11293FC-CAA0749F/0/0
X-purgate-type: clean
X-purgate-size: 816
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4CF26F53B0

On 02.07.2026 10:30, Oleksii Kurochko wrote:
> On 6/16/26 11:03 AM, Jan Beulich wrote:
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -11,6 +11,8 @@ The format is based on [Keep a Changelog
>>      to obtain an automatically allocated domid.  The prior sentinel values (0
>>      since the start of Xen, and DOMID_INVALID since Xen 4.21) now no longer
>>      represent a wildcard input.
>> + - XEN_DOMCTL_DEV_DT's, FLASK_[GS]ETBOOL's, and FLASK_DEVICETREE_LABEL's input
>> +   string sizes need to include the nul terminator.
> 
> The patch isn't tagged as "for 4.22", but the change in `CHANGELOG.md` 
> makes it look like it's intended for the 4.22 release.
> 
> Do you expect this patch to be included in 4.22?

Not anymore. See also the v2 re-posting (where I'd appreciate your ack).

Jan

