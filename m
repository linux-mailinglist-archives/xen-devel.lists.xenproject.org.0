Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lZsVFel9O2rPYggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 08:49:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57D06BBE3E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 08:49:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=PCs4RrST;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344562.1603618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcHPz-0006iH-N9; Wed, 24 Jun 2026 06:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344562.1603618; Wed, 24 Jun 2026 06:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcHPz-0006gq-KT; Wed, 24 Jun 2026 06:49:03 +0000
Received: by outflank-mailman (input) for mailman id 1344562;
 Wed, 24 Jun 2026 06:49:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcHPy-0006gk-Ov
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 06:49:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcHPy-000abI-53
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 08:49:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3b7dd8-bab6-0a2a0a5309dd-0a2a450bc21e-16
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 08:49:01 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3b7ddd-5e53-0a2a450b0019-d155802de0b0-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 08:49:01 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49241dbf9c1so5041385e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 23:49:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49249238900sm331802145e9.4.2026.06.23.23.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 23:49:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1782283741; x=1782888541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LVWApeuBHOJo2c/W5calFtXk25tkUWfZNTJXbJnwZxE=;
        b=PCs4RrSTC0KhxzjGdVqcrHsV7yFQg6MlPwAbNdmxRnvFILQF6Rud5xDeYGLqPUamMl
         OoCwtGnz6kCcrHfzUIPs2RzkKic/gbkIrjF15It0HcDDou81lhRGrfENwV0V5TVijaeg
         1bRbHb7HU/2i3iW8NukR6cir2Oz8x1Q6BSC4srIm2OKEm2pR8h1Jy4djfqHMHBDGanKC
         LaUitHOZn8uY8ay+jBhrjmyGWERzQFEZRUXt1AiTQnT3bw3q0BGdEmVkblCb3IuqcHcL
         0fPn3sEMhhTZV7LfI6qul8ySXUU4OCc57h6xIAKEE1ftj7Bofx/TW4Uyji4Qpw/sBgu+
         nj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782283741; x=1782888541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVWApeuBHOJo2c/W5calFtXk25tkUWfZNTJXbJnwZxE=;
        b=P73zxud0FoEg7MJGC2RfDeFDUTGkhlfAtaGMmvnmOI9i/V+WVtQTs2DDGUHvB6cEix
         7/vMeM+cbZS9fWTT8N2qJO96AcUxO6BFCEhEDhkC64cVbFs2cIdkshMhfEQtiuHzB1bX
         0cDFI4SQj4oD2+YObrUd7MV/MRza3aAufcHWY2HMRdPuArFVFyQxLoAjPGsfOz/sFrt2
         DUNaNq4sjDBTW+96U/K40p8pCMofykaEidWvdnPAvP7oBHMRvQnWSmi2kE3wfReJsAAC
         0K0xf1fblBVH1j2catVxl1mrj+r21RAJzJyF3uB2lWnJL3YD2HpUdNvaDViSfqbVH3EV
         sJlA==
X-Forwarded-Encrypted: i=1; AFNElJ/vGIaSDFY0kzyUBc4bMl4q9eBfJHE67eY+aMYl4QVV6IXFQRMWdvNMztp5Klc+9DXJny64M/tP5t0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtUZaW2ZE0VcV8MkF70BdAYa+RzHaV+dyF38IytWSni7sdXp/G
	uITbHJwZY2q9IfoiAZ6adMkzjEKOORxmz8UBfkfXfWMpYMEjfuPrRDnWoGE5daB/wRuv3dO9CCL
	bpwhijg==
X-Gm-Gg: AfdE7ckvvDkCKlOwL5j42Qp9ViQaUOEpKrOOtMLqwfuC1ju/kWEJF9didVOzGfIIUrC
	sQ5u74ClUp0Ci2QKkqRMPnbgcWxg33RyxDXQOJiX+jckOOq72oR0PEh8GY4jgELknJEF1R8I9Pe
	GaeO1jB4iz7R7c36Oa+Hso1KuSHjj1ndyFPw+W+9b+7MRwBSSNgN+SK/jfQq8MgvZuV4Qg2GqBN
	yWySuotDvG/IewFAHoDmIKim4i0tdhCb5MgCs7FSnU+U5jyqLjl1ZZRlkK9B4IppypjUs/JkNBq
	yl00AZiy74uxh8uPeQRfxBKjDpdQFlRQHhQgGcduEz/QZTEVw4ZL/oBnXQjq43d0DpbvoWE00E6
	Z2rzzANL7V0RoVPa+bv9zJTS3pdfB34vr2co8GJcSC2bDj+zKgxjYnm0hT/SpI42fjpT5As21XC
	ZdGKD5E5cRfvTHn/LnjCC2l90upvMGe7hYr1+yxmLO9ATGK6Igrhfi0KDt2GbOwfP8j8olT3nLb
	Mpe
X-Received: by 2002:a05:600c:6097:b0:492:4a56:68fa with SMTP id 5b1f17b1804b1-49260872e27mr24571825e9.24.1782283741435;
        Tue, 23 Jun 2026 23:49:01 -0700 (PDT)
Message-ID: <284ffcf9-4621-498b-ad78-7d53f15a828c@suse.com>
Date: Wed, 24 Jun 2026 08:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86/kexec: add digest checks
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Lampis <kevin.lampis@citrix.com>
Cc: roger.pau@citrix.com, ross.lagerwall@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
 <20260622151833.3397692-2-kevin.lampis@citrix.com>
 <b7bfcd3f-acad-4637-a391-32cc9bd71a38@suse.com>
 <5176cb78-4445-4c94-a76c-fd08c1417211@citrix.com>
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
In-Reply-To: <5176cb78-4445-4c94-a76c-fd08c1417211@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1782283741-45BFF00E-A795DE34/0/0
X-purgate-type: clean
X-purgate-size: 2330
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:kevin.lampis@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime,citrix.com:email];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B57D06BBE3E

On 23.06.2026 18:08, Andrew Cooper wrote:
> On 23/06/2026 3:44 pm, Jan Beulich wrote:
>> On 22.06.2026 17:18, Kevin Lampis wrote:
>>> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>>>
>>> To support UEFI Secure Boot we must check that the kexec data has not
>>> changed between signature verification and actual execution.
>>> However, this is also a good check to perform generally.
>>>
>>> During kexec load, calculate a digest over all the kexec segments. This
>>> digest is stored and verified again later prior to entering the image.
>>>
>>> For now, only kexec crash images are supported.
>>>
>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
>> I guess I'm not quite following here. For secure boot purposes, shouldn't
>> the new kernel already come with a digest (or really with a signature),
>> which we could check in both kexec_load() and kexec_crash()? If we check
>> against a digest we calculated ourselves, we'd apply more trust than we
>> should.
> 
> There are two problems.
> 
> One is plain TOCTOU.  We load the crash kernel at boot, and we jump to
> it in the case that something has fatally-but-not-catastrophically gone
> wrong.  Really, the digest here is an integrity check.
> 
> One is that Xen cannot perform the signature check on the passed
> kernel.  At least, not without gaining a full X.509 stack and
> authenticode algorithm, or a PGP implementation or equivalent. 
> ExitBootServices() nukes SHIM_LOCK/LOADER protocols so they cannot be
> used later in runtime.
> 
> Because we are defining the TCB of the system as "Xen + Dom0 kernel",
> it's fine to let Dom0 do the certificate check and say "trust me, I
> checked this" to Xen (albeit requiring that dom0 userspace can't issue
> the hypercall).  In the current implementation the dom0 checks the
> signature of the binary that userspace proposes, and either rejects it
> or passes it forward to Xen.
> 
> All Xen needs to do is ensure that the bytes the dom0 kernel said were
> good are still the same bytes we're about to jump into.  Hence the
> integrity check, which is a good move even in the non UEFI-SB case.

I.e. "To support UEFI Secure Boot we must check ..." in the description
is really misleading.

Jan

