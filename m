Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6IPZJpXlTWo+/wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 07:52:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E132B72205F
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 07:52:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KS1hB5cV;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356606.1611177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whLCJ-0007F1-1N; Wed, 08 Jul 2026 05:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356606.1611177; Wed, 08 Jul 2026 05:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whLCI-0007D6-Ur; Wed, 08 Jul 2026 05:51:50 +0000
Received: by outflank-mailman (input) for mailman id 1356606;
 Wed, 08 Jul 2026 05:51:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whLCH-0007D0-4h
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 05:51:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whLCF-008X4Y-IH
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 07:51:47 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4de570-5cb7-0a2a0a5109dd-0a2a4508a72a-8
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 07:51:47 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4de573-edec-0a2a45080019-d155802bc526-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 07:51:47 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493c7902f47so1337035e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 22:51:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e5a6240fsm26032745e9.2.2026.07.07.22.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 22:51:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1783489907; x=1784094707; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nHHna5FscLGw+zvZ+qQCNakjVaTtZ6wRM76t+L989s=;
        b=KS1hB5cV9dPzQnb/SS8aa03fTJfG9eQuSh4ZMkvDtmK9oM+zKmpXbDJwxrgoiS0ESl
         6XeBVw909svusf9VPNl5mPUnzujz4VS/ew7VBk8vVWDdHDGPMOkmJ47Wpe2/hUUVxVaX
         bwSQcPbKD+Ab4D+poQEep4Alk80mpaSBcZISU2xPYe8uOTM9Ez49bjmorF1j1+/Krioo
         daW3TTvznoi8uTIEcrQBMO2fu2AXG1Nr4OPWfks2eAusNWgFv72CRu0Na37tYOjSko+1
         XmAhuoirsucomgaGtyp8Bqr8Bbk0LfEy0v+itD0m8kHzcoHcv/sZ7FEV4e4myYaOg5Gx
         578g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489907; x=1784094707;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nHHna5FscLGw+zvZ+qQCNakjVaTtZ6wRM76t+L989s=;
        b=azH+eJIPUTn9d4wudJCB3o4edZPPXPB15+DKQ1UZ1uFJ+3mHDU9v4vDZerErUrH2vI
         aS5S0YvPqOKRNhFpxDhI841jNr9qDrbLmOeXN4sJbKvV9+A4ryatHbrrFamYZeaSpjt/
         bFGzH90y8upDOb6Z9dR/7dIhayq9AjQNbmHUsZ0t4iAB00Yyxw1UpQFtCBtqsZu9Xn/t
         Vj8OLTJVsq8dei0piyeS1TQHZ4PrSRsygFSEGWm3HA4ZGR2KZuqWj9sQE4w2n3Sea7oM
         qjHWOfx1ZIBuhSCKIAl85mwiKg5n89qAOuBumtFFbFCYytr0usybQ6jVujB1I+3p3udX
         jyPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5KDBd9urnQf34Ckuueyqm9n5LDAvynXlBR4RsbT1c3TMZSGMHsrBs/ufmGbxLrlQ3AmrPpL0unLg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyk2JIJ4mxzxVgz4/Ps5RmGZTOYewRCBUC1U4jvuL03l1xwXyun
	ZzKrH+XFHB1vXCZAB9GG509B1G4cR0c/6qd9QiE+RFEiPA2qlfkntdDyiioj3pYNYg==
X-Gm-Gg: AfdE7ckBW4KwgTn2pV5zkzIOG0yMZQDCq01zi4C8xxa1qxoa10e5cJXUav4BVQOYKDp
	qzN8syIWzF2RdGjp6yysWph87XL2R+BeylYY02OvWYSDbs1/hsUtP8gurpbL5YnowANbV2Hdzoa
	+1sOxGZfgI8RFqTWE4ZtgMhfBNSeogGw5yOjlRRdQGTei3Fpo5FKJEv8ochfmoRZpSqzpFDh9yl
	0AIXQNtCSMP8x2tuAxBoQEjcUJQa6gX4vq5/fYw3q9Aps+fYzuL15Xa/7Fvnhh26Fu7kymg55At
	uHdQuwAbz+64gC9XzeKxUD4Ogrx63Y8uZy0AXzOmOjQpdi8aVWiDs7+c7BkwPc8nYO2/5gUMC9X
	AzaIh1fhZ2/9HxRkZaZxOrahHyj5a4IXhKNYATQkivYIPLKfqHCMHtILSU4ZozsA2fSLTIerr9+
	ptusZYsr7mIPdx2wLk7ZEuIqfd9euuqURfLn0iIonSC225aoi6ktcHnqeLcctfmVDlJVyWswd1G
	WOI
X-Received: by 2002:a05:600c:c84:b0:493:aa24:792b with SMTP id 5b1f17b1804b1-493e685fef8mr6919855e9.22.1783489906779;
        Tue, 07 Jul 2026 22:51:46 -0700 (PDT)
Message-ID: <aaf50f82-d3c6-4d85-a208-e719a567b018@suse.com>
Date: Wed, 8 Jul 2026 07:51:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/entry: Use PUSH_AND_CLEAR_GPRS and drop SAVE_ALL
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
 <20260706153415.1264750-4-andrew.cooper3@citrix.com>
 <6c4bb5bc-be27-4eef-a08f-1dd96df81304@suse.com>
 <5869bc7a-94cc-46dd-b8fd-b1582e12ec26@citrix.com>
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
In-Reply-To: <5869bc7a-94cc-46dd-b8fd-b1582e12ec26@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1783489907-A23203FC-97BBBD27/0/0
X-purgate-type: clean
X-purgate-size: 1280
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E132B72205F

On 07.07.2026 18:09, Andrew Cooper wrote:
> On 07/07/2026 8:16 am, Jan Beulich wrote:
>> Btw, as it occurs to me while mentioning SLS: Judging from the patches I
>> have, IRET looks to be immune, albeit I can't find any statement in the doc.
>> What about ERET{S,U}, uses of which we've gained only relatively recently?
> I think the bit you want is in SDM Vol2.  For ERETS:
> 
> "Instruction ordering. Instructions following execution of ERETS may be
> fetched from memory before earlier instructions complete execution, but
> they will not execute (even speculatively) until all instructions prior
> to ERETS have completed execution (the later instructions may execute
> before data stored by the earlier instructions have become globally
> visible)."
> 
> and says the same for ERETU.  Sadly, "following" is ambiguous in the
> context of SLS, but an ERETS-to-self could end up legitimately executing
> the next sequential instruction.  Either way, the "not execute even
> speculatively" is the property wanted.

There's a worse ambiguity here, imo: What they say excludes ERETS itself.
I.e. while ERETS itself executes, subsequent instruction may already be
speculated.

Interestingly the FRED spec (9.0) says such only for ERETU, not ERETS.

Jan

