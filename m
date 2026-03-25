Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD4WNO6Rw2ncrgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 08:42:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305CC320DBA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 08:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261749.1554540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Is7-0007uF-DB; Wed, 25 Mar 2026 07:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261749.1554540; Wed, 25 Mar 2026 07:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Is7-0007rc-AT; Wed, 25 Mar 2026 07:41:47 +0000
Received: by outflank-mailman (input) for mailman id 1261749;
 Wed, 25 Mar 2026 07:41:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5Is6-0007rW-CP
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 07:41:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Is5-00FY7v-Kj
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 08:41:45 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c391b1-2eae-0a2a0a5409dd-0a2a450cad5a-20
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 08:41:45 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c391b9-f93d-0a2a450c0019-d155dd36e16a-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 08:41:45 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43b87970468so832997f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 00:41:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b86fbb195sm8459119f8f.14.2026.03.25.00.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 00:41:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774424505; x=1775029305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9V565P+lYSBCUNizOzfMKl+sHas+5sTmvHZMhTc9/CM=;
        b=N4DTZDfLFrw9cNk4uWsJZxPIs45LmIg/QDbbY4oE8e2GPkrGBzBHN1VUFCnx+xpfyz
         WWenJa5/7vxsYmtJxMLJXKTXeV4Dt5DcU4/MWC8qxLQ+62oaOZeDSc5ZGpl5E3csj3SC
         dEKwheUwZwvTunCRMsIHJ12Ag5oKEJEUBn2byXhtVbe2egPwzQzqwpNZ9d92s4Ox0n8W
         rLjZt67pZoSbww5e76AxRKEOSyGMffe0Ip3X/xE9J4botXSKBieo8NAqK8ttWO4FWdmu
         QDwiwA6dlmz+3qt+dgCyRKx0+5TFfXU2JzJFtCRMpEhk+6Vs9xNq3LHjoJCAhhMdha4r
         q5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774424505; x=1775029305;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9V565P+lYSBCUNizOzfMKl+sHas+5sTmvHZMhTc9/CM=;
        b=bXWW66TY/QkZMy/PuIKtpgG3DU6M3O6sbGl4GyYGtLEWJwPVMaaWmtKrFLAYTqQxpa
         q0rOulgtoRRe3nBBHZyzQjxBhdJEs/xDHFxpWGwSxLVT5IaCEaQk8yjznjij96v3g/IP
         GeBGnQHToMXTt/69UccTZ78F3N09r7x09s9QbmylejGyDr+hgsEXZ6vi5ViummwMhQwn
         iMI4p/Pf3fs484NDf8bRoqhPUAltiTrI56WulfodkwBHKyNFYHnfyZ3uvKN99jjaoA3L
         uWHjVs3qHTWUUppH/okhmZ/LAFMY4A9n5JhqA/YRuH8oPr7Z0BkSpAVvY2JYFQpuEBXg
         Ropg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ9kmPeSWwkMxE179ieGUAtPbbK+aofx1j4G/HZT14LzUbRHShe+AySaBWUM18gc2jZh/0SwATFSM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbpIueTSm8ymG1ZdnFAN1qiUiCzlnKdd+U5HEYvPzua8DLvvp2
	9tSiOkFLBNWFeTQ87szpiNJBvxjJ4ChEjU6SUMQBLzUEgSysuEdF3fMcBDxJ8slmPYrvG9P3lzq
	tnp0CLg==
X-Gm-Gg: ATEYQzzJYhSHzRDEBMWi1StkN2+EpAsAN1NSiw8PX+IlyL+ENcjUlojhG7VXepnDYBV
	l/LNnmxhpIMumnwUgTeYIDtPh/hrZwVbsTulqr4WT8RAS9eNFTU6r6QfVJTETDAjudaHwiQ0iEx
	ljMODUbceLVTDCj/L/898TAqJj+f6H2DIsyKOov2Mt1s2yneOfVCM6xMzKNUl2D5lfIvSngN02d
	CLBdifkccSeNZdMuULkN4jbys7CfHBaLgunuQQWoXtOVHlGB+OY9D8UfjeD/LqGTQ7pI4joMDBr
	kLir0TF0NFBw/2KUscH1PIbzGdo5sJ8eK+oNZyioCUe/98yriEu0Fv90j69P2PjnqwKlJScFaxV
	UVwIYhu5O+4d31ybv7Aos/d04Emm1WNHl8phU0xsCtC+8V0bx8FJa07Vh99EDTbL9THTOX81N8n
	hGh11TUNvKWMMCSIaVI8FzwbiH+tdnO52ZTzrlgR2NQ0xRAlfv3pIXhrjHSfakjcmoXnl3l9rFg
	KrBxt0XJAEPPEQ=
X-Received: by 2002:a05:6000:18a8:b0:43b:4440:9c28 with SMTP id ffacd0b85a97d-43b88972329mr3138166f8f.0.1774424504656;
        Wed, 25 Mar 2026 00:41:44 -0700 (PDT)
Message-ID: <a582abf0-f41c-4a4d-9696-95d449f27b83@suse.com>
Date: Wed, 25 Mar 2026 08:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] EFI: avoid OOB config file reads
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Kamil Frankowicz <kamil.frankowicz@cert.pl>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
 <f56a8eac-bd35-496d-ae9a-b429f8305b31@suse.com>
 <d86ec941-ba0a-4beb-b213-7d1bc9a1ec19@citrix.com>
 <d66de28e-ab0e-44cf-b255-deb5856f7c58@suse.com>
Content-Language: en-US
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
In-Reply-To: <d66de28e-ab0e-44cf-b255-deb5856f7c58@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774424505-6C8BC734-271FA7D3/0/0
X-purgate-type: clean
X-purgate-size: 1516
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:kamil.frankowicz@cert.pl,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 305CC320DBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 07:12, Jan Beulich wrote:
> On 24.03.2026 18:13, Andrew Cooper wrote:
>> On 24/03/2026 4:36 pm, Jan Beulich wrote:
>>> The message emitted by pre_parse() pretty clearly states the intention.
>>> Make sure we actually do so.
>>>
>>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>>> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -907,8 +907,13 @@ static void __init pre_parse(const struc
>>>              start = 0;
>>>      }
>>>      if ( file->size && end[-1] )
>>> +    {
>>>           PrintStr(L"No newline at end of config file,"
>>>                     " last line will be ignored.\r\n");
>>> +
>>> +         for ( UINTN pos = file->size; pos-- && *--end; )
>>> +             *end = 0;
>>> +    }
>>
>> I agree this is what the the function intended.
>>
>> But, ignoring the final line is rude and there's no viable editor in a
>> UEFI shell to fix it.
> 
> On all the early EFI systems I had in use there was one. I'd need to check
> more recent systems, though. (I know some come without any EFI shell at all.)
> 
>>   Can't we just copy the file into a
>> one-byte-bigger buffer and terminate it properly?
> 
> If that would have been possible with equally little churn, I would have
> done it that way. Of course it is possible in principle.

Actually, it doesn't look all that bad - let me give that a try.

Jan

