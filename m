Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJayJav7gmm6gAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:56:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA50E2DC2
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:56:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220152.1528869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXkG-0008OU-Ka; Wed, 04 Feb 2026 07:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220152.1528869; Wed, 04 Feb 2026 07:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXkG-0008MR-H5; Wed, 04 Feb 2026 07:56:16 +0000
Received: by outflank-mailman (input) for mailman id 1220152;
 Wed, 04 Feb 2026 07:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnXkG-0008MJ-00
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 07:56:16 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9dd0202-019e-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 08:56:13 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48068127f00so55409995e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 23:56:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310919211sm36577745e9.11.2026.02.03.23.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 23:56:12 -0800 (PST)
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
X-Inumbo-ID: f9dd0202-019e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770191773; x=1770796573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7cNt5S8Guw1QvJVJP7O71waURfLNPoe7GDaEP/qaok=;
        b=eS/m6iNZXlVJZQV6vTlU7mmKBGTPC5mTNOubmcZYJi9JtvYj5the0oRwSUJt1b3X5Z
         Fem2IVFqSsZ3FDUMbw5GH6LNRBaFKDhbAND25c0sQf5R5J0cnUT4bujCrjYY36akCL13
         UcG4oaFzGSJAf2xK4pxgpvkLfiIsa1Mub+b2f27g9LDZI/9pUvjlb18hARCX+cnCPtv1
         GThF1FrkJd+7XadKMW066rvjblBRBjR2uchOnfBdxE/OT0EIgZkcoPpyvtoYgptEjPTg
         aWskewz/qa4aupbMgliIuhXhsEuxMbkKT4jSs6CckW1af3P24rjpSgEs6StqAI1iQ0yx
         nFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770191773; x=1770796573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7cNt5S8Guw1QvJVJP7O71waURfLNPoe7GDaEP/qaok=;
        b=q0mSmEyqXNrF9Wqc32ig0clA4x4fXMMN3U84U3RwxFYGPj9vaCG9w3Hp7e1sTqL7M0
         Y3dNrpb/2TNL77b2oMWuo2TEJbX2sBUGxFMuWcZ730qHm9Vjm5NJDJkB0mA3ONkiLhO3
         OSEVvaiibiZv9AWFycwrTnYQBLTjelT6nT7fah2wpX4pOimp2U+t86L3f+asDbdDdQDa
         Rs+gCd/s2ABZW+vsOjzNgDnI0FIzJoa7jsCRQo9JJBmsThJoY1uIRYFy2yEI+DJtmk+1
         M7gMehOflWLzYPEvceJ/EfON00gLcfpKjtOiPpLLz6umIOpccwPYBsCV2aNoSn0kkcLS
         Tx5w==
X-Gm-Message-State: AOJu0YwjuFhn27T4+t9OfWURShO5aw6rbVIRv6te9+1uShXU7nazHKnD
	JLV4l8F8GtpgQCs8a+LmtdO7VNqaPRDdsN/WWa2wsrtu5xYu0gjZesdTAJVdydPiSQ==
X-Gm-Gg: AZuq6aIS3FT9pNAzq1Xp8OM9hm3jHGrw4yoy0IBhAm13oPzJR8JcuE+/6YxYIUCxMuO
	N+5syOZdt+2jpHBGb7U+pPcm556AocFrFrsLPi++OslXkKAlktNy0BZanAC0j0j84aXVF412y/+
	TCT9CCouCVN23RgJnkCZIaMITc4i2dO0tRdUNUlKs5jijgnnfWK00QTF8jjMu5NfKWkHOXifBlB
	K9z7tPRKsilMZph7l1nlGUgldO4ykBEOMIBlZiUVbbAWCkOV7kJUkQTyD3iAYzDTLvUdrxpD1CO
	2R5dxmsNzSrpsTMeamz9zOCe1fsX/dJNkJvbpThZ2omNCM28Exo0MkKjwoWrwKEtIaOud7GK9Fg
	BupHOejW+OB9fnRatabY374JEFji/sjUKUN+v2ktYe+Nd2HbiEfSL+0Pi+t3DNO1yS9TPtTe6RQ
	1/glJPURQM+vCRweyV7KAuBx5DpfdE4S/C3DM2Hqyq1o3kaRXKNuHBqCK2KUjDosKTiDRLhmMsh
	/A=
X-Received: by 2002:a05:600c:8715:b0:47e:e2ec:995b with SMTP id 5b1f17b1804b1-4830e93033cmr28479945e9.9.1770191773011;
        Tue, 03 Feb 2026 23:56:13 -0800 (PST)
Message-ID: <0e3a1af4-d87c-405c-a0a7-598929df3f4b@suse.com>
Date: Wed, 4 Feb 2026 08:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 sstabellini@kernel.org, dmukhin@ford.com
References: <20260109140747.195460-2-dmukhin@ford.com>
 <aYL6Bt3Cs3HgeMPm@Mac.lan>
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
In-Reply-To: <aYL6Bt3Cs3HgeMPm@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:email,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0DA50E2DC2
X-Rspamd-Action: no action

On 04.02.2026 08:49, Roger Pau Monné wrote:
> On Fri, Jan 09, 2026 at 06:07:48AM -0800, dmukhin@xen.org wrote:
>> --- a/xen/include/public/xen.h
>> +++ b/xen/include/public/xen.h
>> @@ -608,6 +608,11 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
>>  /* DOMID_INVALID is used to identify pages with unknown owner. */
>>  #define DOMID_INVALID        xen_mk_uint(0x7FF4)
>>  
>> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
>> +/* Domain ID allocator: search [1..DOMID_FIRST_RESERVED-1] range. */
>> +#define DOMID_ANY            xen_mk_uint(0x7FF5)
>> +#endif
> 
> I would attempt to word the comment in a more generic way.  While this
> is now only used for the domain ID allocator, it's likely to gain more
> uses going forward (Juergen already expressed interest):
> 
> "DOMID_ANY is used to signal no specific domid requested.  Handler
> should pick a valid domid, or handle it as a broadcast value depending
> on the context."

+1

> Also, I would remove the tools guards, I think once a DOMID_ constant
> is allocated it becomes part of the public ABI, and it cannot be
> withdrawn.  See for example DOMID_IDLE: it's only used internally in
> the hypervisor AFAICT, yet the define is fully visible in the
> headers.

It was me to ask for it to be guarded like this. DOMID_IDLE (and perhaps
others) not being guarded (at least for IDLE: by just __XEN__) imo was a
mistake. That mistake may in fact be correctable, if we could prove that
the ID cannot usefully be passed into anywhere.

Jan

