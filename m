Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Wz/ED3dHmpwWgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:40:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC1C62E94A
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:40:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=JrINy03x;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325058.1590584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUPL5-0005ET-HW; Tue, 02 Jun 2026 13:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325058.1590584; Tue, 02 Jun 2026 13:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUPL5-0005C4-CM; Tue, 02 Jun 2026 13:39:27 +0000
Received: by outflank-mailman (input) for mailman id 1325058;
 Tue, 02 Jun 2026 13:39:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUPL3-0005By-Rm
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:39:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUPL3-00BT3p-4g
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:39:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1edd02-5cb7-0a2a0a5109dd-0a2a45028c4c-42
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:39:24 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1edd0c-af86-0a2a45020019-d155dd2cf0d0-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:39:24 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45eecb8bf67so3931003f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 06:39:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46018c94d80sm6078100f8f.31.2026.06.02.06.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 06:39:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1780407564; x=1781012364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ODPyHBn+U6yQNF4JJB1Isd0rtoSKvW0S+zP2ZUcqQVI=;
        b=JrINy03xKTGSZ7YS/TSS0DkUHM4/bumtXYnhrW3ixOA0fJMBowauRgXJwokDaganPj
         BRoIc3q1ZwSKGxg7SMjr8oTkEUSUD/syzklCuUSU9W8Lx8prWsL0tJJWRKusnZwii/Hi
         M6I+ieHFiAyBZyesC+jHewlFgRIt1aom7rgnzPaA6NMzVg1RZGs0aqimc+Oo+jC80L05
         XT61mmWEHKW3IzxQBKlAu5RRU2/byrDTbSphaWZDeF2+6gRpLZQQBoebc32sZOgIyYii
         /X0AToE6S8pcozVmxZGzzBVQELPyqFtHzkaEFM021wVMz1xUMhtX9aXM4xjRoBukk17J
         TdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780407564; x=1781012364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODPyHBn+U6yQNF4JJB1Isd0rtoSKvW0S+zP2ZUcqQVI=;
        b=VRe2LFYFU/RQp9KnMkyjiPhPNjizQ0PzuTg0R5GkWd7iERbNqDvVSmIUQtHBJrOulK
         oaxQJEoug9CoCY+DGps9bWZHEOV15Xie9vwr6AN4TCMSRJ5orSMzplVCusPGAAiunRep
         Q738Uptq1LcMMdfpm/o0eFtZvJjo9AhXCydsRAax9zgO3Ssn2HY+uHEn0rLMcAqhnYX9
         wZnQcSxl0BFpSBGyzUxDeA5MGqcc3eeEOmmFAdvsr8oY8U3NGWgcYr9AszdHmcYaTrM0
         vTSJGQcXggByaHCsOQ7shDiedAPOtGzncsWrZLcv7M6CK+IHvOFxSAMnW1nN+adBT/Gx
         tEjw==
X-Forwarded-Encrypted: i=1; AFNElJ/uJU8cbP1qkTSWZKwCz9jRsjvHLPIfbb4ssYUh1hjExWgNg322SeWxBfVm8CORqXJ0AfgTTXhukbU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzb2A44zVDBoVKtov5Yss8xOyWFiv6cZ08AKzT651ZSvrSRYcXe
	qn92xceC7U2G81DwxcS03YpWTrwjUs37y18xOg9u1vm35rLOfTz+AG/rfrIGNx15+A==
X-Gm-Gg: Acq92OEQBMl4xtb9T2RoQrhoxXU7Mf+62dogsu7Lr9TQsERZ9zfR2Nz0sZx6uRE5ME0
	10/5ArEJY5kSXmU4SNUiGP5fq6vBG2xdSHUzUK1kBRIlCbjOf2z/HVAT2PlAzKzgd1u/SFJnpJF
	HrS85JQ6Ki3BzK/quHi1GKaSYNy4Qk/Q6sL2g9S2Du9b7U7Mi9jD01hCi10dynZtYTDtLGDKkGA
	L0vCEcK99USLCtrDZHbTJqmDQ6Asel9t/SPj0nHWDkYLpVF5h9gpdFsgoIffU0G1hA0+oju27bb
	8X08dMPWVbwcFAWmAsZmmOpw271UIHXZXCFDLLBITWSWoCsoGkCYjG99rB98T8oi7gKbL/+WzqC
	CEvnZDdHtYqbry/TlqF9Z2ANaLn6LOQFr/I0HtLn740dxE+mOyx5sgRsdyCxSsfYh5ivdhmWaEb
	hcHnPsEXdDcJxRZbe1pa23QxaTvxC1079eus6vQLlqZNeKOpE/DcihAxy64tOBn6+xMCeNROJNt
	7gt1gNSxrSEUodw1Bzzk6wsdA==
X-Received: by 2002:adf:e64f:0:b0:45e:f604:1c36 with SMTP id ffacd0b85a97d-4601754864dmr5509631f8f.11.1780407564026;
        Tue, 02 Jun 2026 06:39:24 -0700 (PDT)
Message-ID: <5f0f2996-af75-4d0c-9250-c14d99c21d1f@suse.com>
Date: Tue, 2 Jun 2026 15:39:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/PV: rename a local variable in
 pv_emulate_gate_op()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b61214a2-6198-48eb-95ef-9104d57f3691@suse.com>
 <7032298b-e870-4337-8c49-b5816f03fe7f@citrix.com>
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
In-Reply-To: <7032298b-e870-4337-8c49-b5816f03fe7f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1780407564-8276A161-3CABDAAA/0/0
X-purgate-type: clean
X-purgate-size: 1113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,bugseng.com,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AC1C62E94A

On 02.06.2026 15:29, Andrew Cooper wrote:
> On 02/06/2026 2:20 pm, Jan Beulich wrote:
>> ... shadowing a function scope one, thus violating Misra C:2012 rule 5.3
>> ("An identifier declared in an inner scope shall not hide an identifier
>> declared in an outer scope"). No difference in generated code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Technically, as the outer scope "rc" isn't used again later, we could
>> simply drop the inner decl. That seemed more error prone to me, though.
> 
> But it's consistent with how we use this pattern and naming for
> injecting pagefaults elsewhere.
> 
> left (as in remaining) is a complicated name to use, because it's
> ambiguous with left (vs right), but this is not a context where the
> meaning is clear (e.g. the sort functions).
> 
> I think deleting the inner rc is the better way to go here.

Well, okay, can do, but: Couldn't you have said so on v1 already, so I
wouldn't have needed to make a v3 right after sending v2? Iirc you
pointed out the conflict with Teddy's fix, so you must have looked at
v1 ...

Jan

