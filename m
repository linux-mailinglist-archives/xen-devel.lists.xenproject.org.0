Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNfjAWhxwmmncwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:11:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD4B307116
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260338.1553686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zf6-0008Ah-7q; Tue, 24 Mar 2026 11:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260338.1553686; Tue, 24 Mar 2026 11:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zf6-00088O-3W; Tue, 24 Mar 2026 11:11:04 +0000
Received: by outflank-mailman (input) for mailman id 1260338;
 Tue, 24 Mar 2026 11:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iLjC=BY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w4zf4-00087q-HC
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:11:02 +0000
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22ec1594-2772-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Mar 2026 12:10:59 +0100 (CET)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43b4d734678so1154028f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 04:10:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644ae37dsm38128339f8f.2.2026.03.24.04.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 04:10:57 -0700 (PDT)
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
X-Inumbo-ID: 22ec1594-2772-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774350658; x=1774955458; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=spx48gohNAna1AZGZiteYfD5dZNK/E2a/rQ5/1YwxyY=;
        b=UDawpU7xbOSmIAlVl/kG2Wr2Mmvo7CEGuFUoVKYijcneiT5L2KiZ3gumQPDe9jbT8q
         Q5Vlv2wb18gAhDivpFGaJSlbPFSGgxCWj+CZF/vOmWsxpOe4EioT46/gCZGuiRX6zeMQ
         0S1Ox8XbNXteuSCxaN09icmRXO1scB2z8g+Sys4zBgf7YaBkbuPv0n83XB++bhlGipyu
         OXoyKYB8bQL0sn5yCfLPQDMmYFDBoRzY8Rz0zDHIM/Q3BP5NA6Qn9qc6iKM1ximU9/fG
         C2S/+Q1b9+tH5cqpWZFDRtu8NSaIp5t1r86hp+2SbjJpIx/ikBP2B9uVgepKcxOuesGB
         F6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774350658; x=1774955458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spx48gohNAna1AZGZiteYfD5dZNK/E2a/rQ5/1YwxyY=;
        b=Ov0UVxPNDquSyMjwt0OZ8reUs5WhZe2WGDd/w0OgnsxZv5IM/ftVJjC1tTIDc10e3y
         xdr7OWCi5zw6d+VLrBKukNGYldXdsv8hlRU5Q5QphUPIGb6vLxUdEdcu8b+ks0GWUQVY
         o4+DGKwgEZEc3STWKN0myhLPAEr6Mgi/CavrD59It9CtuuknQ8wnzEuL424Tu740dTMr
         pM2JydRJ2Jdq62VXJdJPtxvoHARcbY6L3m9ACBoKa7eV9BqS3ZLtidQlATSObkmLheYi
         xxzNls+q3KQVzmbseNv12v+IjA4HHMBttTTZuW2VP4hSGmrTVlDE9R7Ot8g4EeghmDfp
         gIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqEMomeqXJRUACNJ2fgZz6UUYBiIH4t5+1Dbp6qPRZPO/fMhUELL5a/VnBroq3viyrPq11yD3V0Hg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQoP74QEHKmtxTAqyt4LHoVLdkC7UHohRDtlCGOPx2GnQ3Trx3
	EP7OSgifn04eoepHnSdfgcQPzVSDvLMQQnBVUg0QLIV4RBuLTixWKHj85MXzQ3QW/VtGH0phy+F
	U91F4+Q==
X-Gm-Gg: ATEYQzwiLpXhSjhXEn1n16rTu+cfGu0Q4nTOq17P0rD4DUY5Ztj9T2PZsbDTrLW53ra
	F5/8hh0kRaGSVf87qo/zvebkLab5+bCrADvhLTU8xUfTNbMQ42lBRN2iqBOSxM20A2Ej3B24+XR
	NYiLDOV6gAyLeP3469S6Euq1Vr0aXau8fGp1V0e9ihah2/WcUO+BM+YPe/qHfNk9wKPLez6BOtD
	C8Zru9CGDfJ8Mh9KI3wTFivB6AFlvme4Jt6y7652hivboJIXMP4OP/s1Coro6oi1dPQp/3saBtR
	7/j8oTdDI7ez9TE2XW6Yr1gEAaVjFeadP4GiINC6VxbNvvZxltT2/uMserKGp57nb+ZFTOP/eeY
	Myz17gkzCIlQp39dljbCbYL5XFbfJAY9OG/iyS+0jFw6skZFUkBnvjbxN7zLFQUNToWaAR2OCI6
	jMEnodsWljxuY3KKR00CIX6Q9tsCqRV/t9Kp2oGxHCFA9cphM8Z/0AMBQog5I8Pjxi3+BDaIKJX
	jSl/kS2xQpXETI=
X-Received: by 2002:a05:6000:290b:b0:439:c6d9:7fc with SMTP id ffacd0b85a97d-43b64264b1dmr24400861f8f.25.1774350658089;
        Tue, 24 Mar 2026 04:10:58 -0700 (PDT)
Message-ID: <a33150bd-2c08-4fdd-9504-a3e57bf63013@suse.com>
Date: Tue, 24 Mar 2026 12:10:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86/vpmu: Expose PEBS and DS area in PV mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Teddy Astie <teddy.astie@vates.tech>
References: <cover.1773160025.git.teddy.astie@vates.tech>
 <0762ceb722be83bbdf6703cf419debf30609feb0.1773160025.git.teddy.astie@vates.tech>
 <7e4be441-c0ae-498f-9fdf-e5ea8bf11e48@suse.com>
 <9172b52f-13f8-4d9e-9caf-87ef04b5fb05@citrix.com>
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
In-Reply-To: <9172b52f-13f8-4d9e-9caf-87ef04b5fb05@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5CD4B307116
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 11:42, Andrew Cooper wrote:
> On 24/03/2026 9:11 am, Jan Beulich wrote:
>> On 10.03.2026 17:44, Teddy Astie wrote:
>>> I don't see any reason for them for not be available, especially
>>> since core2_vpmu_do_wrmsr has PV specific logic for MSR_IA32_DS_AREA.
>> This is really dangerous: You allow PV domains to control whether the area
>> is actually mapped. It lacking a mapping can, iirc, on at least some CPUs
>> result in a complete hang.
> 
> It's ~all, and explicitly documented.  SDM Vol3 20.4.9.3:
> 
> "The recording of branch records in the BTS buffer (or PEBS records in
> the PEBS buffer) may not operate properly if accesses to the linear
> addresses in any of the three DS save area sections cause page faults,
> VM exits, or the setting of accessed or dirty flags in the paging
> structures (ordinary or EPT).  For that reason, system software should
> establish paging structures (both ordinary and EPT) to prevent such
> occurrences."
> 
> There are potentially uses for PEBS/DS, but it needs to be via explicit
> opt in only; it is absolutely not safe to let guests have in general.

That would extend to HVM as well then, wouldn't it?

> One fun interaction would be a PV domain which gets shadowed (PV-L1TF,
> or migrated), which will instantly violate the #PF requirement.

Same here, just with EPT misconfig exits in place of #PF?

Jan

