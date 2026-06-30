Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YCKoCMTHQ2qfhgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:42:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A64A6E4F69
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:42:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=OJIEIEq+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348945.1606734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYj3-00070A-KI; Tue, 30 Jun 2026 13:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348945.1606734; Tue, 30 Jun 2026 13:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYj3-0006wK-HY; Tue, 30 Jun 2026 13:42:09 +0000
Received: by outflank-mailman (input) for mailman id 1348945;
 Tue, 30 Jun 2026 13:42:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weYj2-0006wE-PD
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:42:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYj1-004dG4-FH
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:42:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43c7a8-2eae-0a2a0a5409dd-0a2a45088460-20
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:42:07 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43c7af-edec-0a2a45080019-d155dd30a81e-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:42:07 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4631679f204so436947f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 06:42:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8ca8671sm75195445e9.11.2026.06.30.06.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 06:42:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1782826926; x=1783431726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BWwQtK41V1KuKR37x6uZlmiXJj0XG6Q8cgUbD4LUq3I=;
        b=OJIEIEq+e+E5uYxLBlmwdNpdtlD4ruOcXcre9PM17mFh/nZ09m6dJs8fjkI9q4Xc1T
         AHGtB3t8di86S0s4q75qi+tBoGorct8Sf3LUByygQCvbKYBKGabwvy1dEcuswohLakGz
         cePlVmCc+CvMA5j2N9toO1xkDXXpD0xEHYetIrlABEiFVolLwuGZuiXUgLvgLEX6Bzeo
         jmZXiAAWFGggG8Fucr/Zv6WGiwhNSrGXq+4UsdLSAiTyGu2UULY1/hOFmk2SbaXC2znH
         zWeepgz65Pv2rxv9s8VcMH7471yVZg/qTKRRzGZOBs21b+RoWSRZ9akURsTIG0Vj7KaY
         zbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826926; x=1783431726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWwQtK41V1KuKR37x6uZlmiXJj0XG6Q8cgUbD4LUq3I=;
        b=F9ldgCqSzH43QGhfl/NIHLE7wA/YKSy+ylD48z8AMvQCfoOvVFQJVqiVStmn2iNp6j
         EDUnyXT5q/VNoz9XawBVtYiQQ+iCNlJ8s/tFwLDPVfnTnXRZX01oFdBLc/DgL59U/HDL
         TWmC0HQ0JDIGyNB5YvwXvs9DQwkpU+LKOFbho2ZBPKordms5Invtr1u+8Gelai5/dKbO
         p5n6r9HHnwpTpuC8Z2lf6WMkEEBIuRQOr0QitefQmno6YWASbysBJxj/98E7iQJwnOvZ
         szZcjlT1BcRqucRvikyUgBjWQ2PUZu0TZTMx0QlOKydZYcxVc2wuQRFp2UmM7FCBpZSy
         yobw==
X-Forwarded-Encrypted: i=1; AFNElJ/HUsdXyNcgssA5bDC1JlEM4BrYe9cs5YTAz8wgRaRBUZaw9wdDwI3qxnloKd2qS89pPGZgUTuPGCU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE6p3pJ64dr6tIOEhR6/HX/cFnKi/uIG6OfoIfMbMWhqSsemMg
	DcWmJUHc/ipyVXWcuyzG9OJ3wBANNwsdJecuQkTCmnYDVlP6IZwuoJ5ah3V0Km0W9Q==
X-Gm-Gg: AfdE7ckwSIqw15cH1XaTCX0B9XmvPFP//WmC334rAOsWAV4ml3khCwJbxC6Qy+Cqgrk
	bUgPGWtrdxj0IKfLvnV7Hj50qvyBNjVFiyi0LeggONZGFrvz05Nl0sOuiObZl8NNjciwTK7Z5xP
	xhkQC/kP3GI5hujHUO08O4cuM7qpEnoA/8gCZeMUv8zQMp3FL0bC8fu2zieGe89jqH4eTDZ9D8Z
	Kphdj/iotkefMB09pWD8fipOLvM+4tcBm+TqdiTH6+1jodMev2QVX1EF7O6mmz2EqTe6x968mOE
	LdHATCj2TebtnL1LJmAqA/Z7zeg3ymTc2R+6cYtZVh1e7iXyio7t35okdztZ5JLJbAkW+QMJMdD
	XzgabZkHn510kGkIurXMvWrWMxDcjBvH7dc0CiLd41WSGCfVFvuQcD3HUYsHmNjGVYHUHJpgLEE
	F6mCOjfUfP/9l0KDtyudfca3HzI7jI6FPpn8X6poelm494qR3rhhQ28OsBGvYugcb3/k1zMEdjJ
	N5j
X-Received: by 2002:a05:600c:3e8f:b0:492:6f5c:fd8c with SMTP id 5b1f17b1804b1-493bc74b8f3mr24129015e9.15.1782826926526;
        Tue, 30 Jun 2026 06:42:06 -0700 (PDT)
Message-ID: <564dfce6-5516-4677-ab60-19b156a21af6@suse.com>
Date: Tue, 30 Jun 2026 15:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: kexec is PV-only
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <36b16760-8888-4fa1-b486-2fa14b60053d@suse.com>
 <065ae596-2fed-46e9-bfda-bad183fd6b67@citrix.com>
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
In-Reply-To: <065ae596-2fed-46e9-bfda-bad183fd6b67@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1782826927-A19253FC-97CB1873/0/0
X-purgate-type: clean
X-purgate-size: 1106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A64A6E4F69

On 30.06.2026 15:37, Andrew Cooper wrote:
> On 30/06/2026 2:35 pm, Jan Beulich wrote:
>> Kexec is of no use without its hypercall, and that hypercall is wired up
>> only for PV. Allowing that code to be built when !PV therefore results in
>> a lot of unreachable code, violating Misra C:2012 rule 2.1.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -22,7 +22,7 @@ config X86
>>  	select HAS_EX_TABLE
>>  	select HAS_FAST_MULTIPLY
>>  	select HAS_IOPORTS
>> -	select HAS_KEXEC
>> +	select HAS_KEXEC if PV
>>  	select HAS_NS16550
>>  	select HAS_PASSTHROUGH
>>  	select HAS_PCI
> 
> This might be true, but it's wrong.  kexec should be wired up for PVH
> too, and I don't see any reason why it can't be.

I'm happy to drop this patch if one enabling PVH surfaces. I did point out
the issue a little while back, and since nothing really happened, I thought
I'd make this patch to at least address the Misra aspect. I just don't see
myself audit the affected code paths for validity in the PVH case.

Jan

