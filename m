Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOuGMzCvHmr7JAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:23:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EBA62C7CA
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:23:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324730.1590231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUMH0-0008DB-H5; Tue, 02 Jun 2026 10:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324730.1590231; Tue, 02 Jun 2026 10:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUMH0-0008B1-Dv; Tue, 02 Jun 2026 10:23:02 +0000
Received: by outflank-mailman (input) for mailman id 1324730;
 Tue, 02 Jun 2026 10:23:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUMGz-0008Av-2D
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 10:23:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUMGy-002mP7-Aj
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:23:00 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eaef1-e002-0a2a0a5209dd-0a2a4503ed2a-14
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:22:59 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eaf03-672d-0a2a45030019-d155802ed567-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:22:59 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49068493267so63675065e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 03:22:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c12b2dbsm136180935e9.6.2026.06.02.03.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 03:22:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780395779; x=1781000579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m+Nq/T23u6vUjRxpJx9ccLXLWTkKRZH2bj58ERM3IUk=;
        b=D7PXaFgIRe+2RE9CRhHavkIDWryLjv3IDwjP3abyY6HPJZL3vkpnweI4E2nta7vtVP
         2z3fj6/o73CYsJkfFcdvmmenBbvvVmEFaGUD0fctHiKJzOp2BI+hz7DNHKmh7r4Rha7+
         BZlq+YGfLe/oQh+e6EQr/RKMZQmsoTK2u4l1Ck5MiKZTU9CTZSjOvlmUluMAX+ZOsut3
         hgCpZA0aXdZyydABJpnG4V/mIonGHjFGOQhs/qrDp1jgV+kRauPFNxvSf5IyDUTZoiLc
         qcpIVtXnlMW5olHfSi4xZRud/35QRf65cirkGCgfIzUoQrxY58Xst+BnPYmK4kWHylWw
         KIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395779; x=1781000579;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+Nq/T23u6vUjRxpJx9ccLXLWTkKRZH2bj58ERM3IUk=;
        b=fdrHVsbKPJ7K9Y7neBMmYoI5RgBOio8Pns/Bm6Ul+wR1UP9DE8mUBV5c5dTqFzD2q1
         MmylyqUoY5pc2JK7kToMhmTbL3gDrilXS+um45N8879dFk+5odP+2tYCGRtLkogyU7iV
         xNPC2O9zr5GI/iOAPD7j9TRnxjo2rN+0pZcsk6fMNj0+Sy5jb2R/eUQjY/eYkvTfEh06
         HNZ2NFcOnfT55KN4alLv632YLH6Aa+opErljPbaPU84SXWimJRg2f1egrptAIrHJd1PJ
         M+NirzkEcwnSGKhYSNOfZuXYJTEoQhcH5f0LSqaaLKFjm/gyGgenpSlORKz4dr84BhVf
         9ELw==
X-Forwarded-Encrypted: i=1; AFNElJ9xBMpYkn/Tj89SJ1QTOccCDXGaS3JeEktFtQCIg8/E3lwWm+xdOYvmPJKkBZcJSmw8Db0LfSsKex8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycOAc/e08XHujY/k28FkGOU55MyXRTlJK5u15gVKePjTe/VIuH
	Ek4WBs+uYFZ95NMiebFGwQraZnhzTQFHv8DaESzShWg49Eif3pI2Dba3YfadWVvq/g==
X-Gm-Gg: Acq92OGnpA04NbGZL7x6ZsdWwsequiL600MoEV9wYSs1tq4y1aqWOvToX8G77JS6cT6
	+AqgQ8eqLBcOmvPVHMGIUwzmZ3i2Ypb9M9+pXQ22MAxOkmIEDlZxtSaV5leK9rCMT0vkmFfaTMa
	44PSvJSc2ack5IrIZlz7NW1W7LHU0hyXfjMejAofeUQlSDlO/BnZpsnz/+L3kt0hoINpIccAYBn
	OxmBLTWhq5SqdRQ4HK8WKncKLeJ8Nx6urZ8f0U2wT1+iwd8t2aieTdSsUgmiu7eBbLFDu/aDfsq
	z05sWjiE1lbh/sp+dOMd+j95X4gs8dUXNb9Q6pMuxBSe6fxULyuWUwSZPfQ6hBDLP9w2sbDirYx
	Y7CZNC4mngEdfsQSAhWdymhDzJdyy2k0jrhSsuGYfwdvFFA2e4069irYruFWdHA711ii3OyM6Mf
	lbLnApdCvIuumZAdVKtMWrjCm4GIKtt1CT4H+OvmptvtHLaCY0WKLYlELWne1or8QH9+KzG115t
	j/ygG6cct3teQOstHdsORsB9A==
X-Received: by 2002:a05:600c:8a0a:20b0:48f:da34:ec4e with SMTP id 5b1f17b1804b1-490a29303aemr197981135e9.19.1780395779324;
        Tue, 02 Jun 2026 03:22:59 -0700 (PDT)
Message-ID: <25c7c4e2-d8a6-46a7-a5aa-68f1c2760435@suse.com>
Date: Tue, 2 Jun 2026 12:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Fix fallout from DOMID_ANY ABI breakage
To: Pau Ruiz Safont <pau.safont@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Denis Mukhin <dmukhin@ford.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Colin James <colin.barr@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260528113915.2355130-1-andrew.cooper3@citrix.com>
 <1779969378.8631fc262581453bbf619ec5b2062170.19e6e7146fb000d780@vates.tech>
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
In-Reply-To: <1779969378.8631fc262581453bbf619ec5b2062170.19e6e7146fb000d780@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1780395779-3AF62938-DEF054B3/0/0
X-purgate-type: clean
X-purgate-size: 2284
X-Rspamd-Queue-Id: 32EBA62C7CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:mid,xenproject.org:url,changelog.md:url,keepachangelog.com:url];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:pau.safont@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:dmukhin@ford.com,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:colin.barr@vates.tech,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[vates.tech,amd.com,xen.org,citrix.com,kernel.org,suse.com,ford.com,gmail.com,invisiblethingslab.com,lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 28.05.2026 13:56, Pau Ruiz Safont wrote:
> On 28/05/2026 12:39, Andrew Cooper wrote:
>> ---
>>   CHANGELOG.md                         | 4 ++++
>>   tools/helpers/init-xenstore-domain.c | 2 +-
>>   tools/ocaml/libs/xc/xenctrl.ml       | 4 +++-
>>   tools/python/xen/lowlevel/xc/xc.c    | 2 +-
>>   4 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 25f5a192ed48..1db3efc4864c 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -7,6 +7,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>   ## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>>   
>>   ### Changed
>> + - Users of XEN_DOMCTL_createdomain/xc_domain_create() must now pass DOMID_ANY
>> +   to obtain an automatically allocated domid.  The prior sentinel values (0
>> +   since the start of Xen, and DOMID_INVALID since Xen 4.21) now no longer
>> +   represent a wildcard input.
>>    - On x86:
>>      - Enable pf-fixup option by default for PVH dom0.
>>   
>> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
>> index 97108b9d861a..147afa62c293 100644
>> --- a/tools/ocaml/libs/xc/xenctrl.ml
>> +++ b/tools/ocaml/libs/xc/xenctrl.ml
>> @@ -208,7 +208,9 @@ let with_intf f =
>>   external domain_create_stub: handle -> domid -> domctl_create_config -> domid
>>     = "stub_xc_domain_create"
>>   
>> -let domain_create handle ?(domid=0) config =
>> +let domid_any = 0x7ff5 (* DOMID_ANY from public/xen.h *)
>> +
>> +let domain_create handle ?(domid=domid_any) config =
>>     domain_create_stub handle domid config
>>   
>>   external domain_sethandle: handle -> domid -> string -> unit
>> base-commit: e63ba93511b33c0d3bb8cc5870f946f41e1d2655
> 
> Acked-by: Pau Ruiz Safont <pau.safont@vates.tech>

Just FYI: While of course you're free to offer such ack-s, they're largely
meaningless unless they come from a maintainer. Non-maintainers can offer
(meaningful) Reviewed-by: tags (assuming they indeed did a proper review).

That said, I think I saw in passing that somewhere you were mentioned as a
possible future maintainer of the OCaml bindings, yet that still needs
formalizing then.

Jan

