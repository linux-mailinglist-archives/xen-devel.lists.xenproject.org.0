Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0KN/CkCsK2rIBgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 08:50:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792FD677078
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 08:50:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=EvHoLGD3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1336352.1598129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXviO-0001Pg-3b; Fri, 12 Jun 2026 06:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336352.1598129; Fri, 12 Jun 2026 06:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXviO-0001Lo-03; Fri, 12 Jun 2026 06:50:04 +0000
Received: by outflank-mailman (input) for mailman id 1336352;
 Fri, 12 Jun 2026 06:50:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXviM-0000zH-8r
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 06:50:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXviL-00CfMd-FK
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 08:50:01 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2bac17-2eae-0a2a0a5409dd-0a2a4508ecf8-8
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 08:50:01 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2bac19-63b5-0a2a45080019-d155802ec024-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 08:50:01 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490c1915793so4566565e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 23:50:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2d046d5sm120706595e9.13.2026.06.11.23.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 23:50:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1781247000; x=1781851800; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iKYlQBb8gM4OcjUKbqwcWw8X/VLJPQKht/pN869PUWM=;
        b=EvHoLGD3dZmTO04xuwGyWduY09q2KEGGRIT4MDR/2SlMgKGGL8Nx5jRdFXsVevQMq/
         /7/i+2afghSByhNexHCh/Ba1zhIJG8Hp2Jx+V10J1j3U9ebYsXFOTRyoLkYqr3ve30DF
         PzCdjA6npC0v+6d5s4Nbi4wF8hLD4okKRNi5k7p75hOq3P5IPkfOKNL6/gbWTpH2b5NX
         0lr2DICyxLzterQAOnvBzUWIoEa2ggDCOiolHJwDRNUHRxjVoIT9OpSURYHKBx+5Of1B
         khT97+osWoKOaYiuDwI6laYKKKJttbdDUm4OK1J/pCrFIyqMR3QYWZev0pjI9ICcjLPQ
         Vs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247000; x=1781851800;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKYlQBb8gM4OcjUKbqwcWw8X/VLJPQKht/pN869PUWM=;
        b=hjUSfBIQ/EBi2yxeXNGni20GgmjhtKIPSd4Zr/uhCrprOhYQLJCdHE7xFP1vFQP0uT
         862C6pya4aay6KDvsCvywhEjUG9kcYDAzNXbUOGcvH2MMP+g4QFUNdBiU8wCQU0OR7s3
         G8f9UuvRNWxY8LbMoi7lxMYFUEW7aZeQHFj1tu0q1AsPVcun6U3toYGTJ24jJAQMbmbp
         UQ/c1WBbzIb2RQiaYhO4VFWta99XzOP8LR0fvwauyqTJJXQrUFhBKjo1/74xLLZoX/Jk
         hR3Rip3/ibJl1LEQlg/+NrN9nR5roe9rO5svFLIrwuGOxEoPwqX/BU1Nprc9KoNZtDDy
         fnpA==
X-Forwarded-Encrypted: i=1; AFNElJ9x6FKiKbmjnr2Z2vNOMt8zIJQxIfAPDUV9HQUPOmOZar9ox5iRxLOylEeGvS+nQYjOAE0fM1+m30s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/w7XQAdMf8+pqWMgc+qjnBmvmzisFzdeoEtM0wQhEW+N3LZPU
	fFlNZAC0+MR/RXmd0dMH+AFe5aQZIaG5f62V43aPk5NIa1WA+4Y1xgnfeycWlpMbxQ==
X-Gm-Gg: Acq92OGkxZ6L7yv11VGXZgdNoRzR8Vj9hVESANEiQiQfGMOu2jUvnx8mxpaDX+VbinU
	Gu26iPaAI+A6K3PHf8EyCW3oW7f15OyqrI6BwJ50xr5oc7HcOfYnvD0XEaRT2KgVkbLc/3lncj/
	yCjAHdWAPHV4XkfoNOBLxCVCpDQXsG/Bw+erHt4Bt7w0eDnuCd1wMTKjdD3Ix3fdPuTFkERdwtJ
	hulKXZAhbQxkjiYudvZqp09j0HcWixSSIh/3tvqDW9cw5FAX4aS/VaRJjIJgimcpXvpT22Jfdf8
	3dgiiL0cdqnFA8L8JexFCEzSvl0igJGC0rHnrUj6VV9LIxqogT6H/o0VOy6UI0yNnEUK1sTnXT5
	5pImBe22pKq/uJKauZwf0uM8JfvtG35hDHAFJQaFKRYCjyzODUm2HU8PWxYixKfGVf3Wzsf0eQV
	7ilZyscybx+wJzsbSd1DV57oecAJMvrvwVRhXB/wkRR8Blhd/JN9EpXQz6IH662RfGWLnAR42q3
	ndLEAFEn9pkJM4=
X-Received: by 2002:a05:600c:820c:b0:490:c2a3:3302 with SMTP id 5b1f17b1804b1-490ec526f4fmr16226695e9.35.1781247000671;
        Thu, 11 Jun 2026 23:50:00 -0700 (PDT)
Message-ID: <5f53ea64-bbac-4814-b96a-2bb49bd034c9@suse.com>
Date: Fri, 12 Jun 2026 08:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-2-taka@valinux.co.jp>
 <25065ffe-4bfa-450d-87ff-982ec37a77b3@suse.com>
 <OS9P286MB7222AA4E4F26E616305D08B882182@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
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
In-Reply-To: <OS9P286MB7222AA4E4F26E616305D08B882182@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1781247001-B7171DB1-B270E1E1/0/0
X-purgate-type: clean
X-purgate-size: 919
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 792FD677078

On 12.06.2026 04:29, Hirokazu Takahashi wrote:
>>> --- /dev/null
>>
> 
>> The name of the new file does not in any way
> 
>> ... express this is all about DT stuff. Is this intentional? Else it
>> may want adjusting.
> 
> To address the immediate concern, I agree with renaming the file
> to 'dt-cpu-topology.h' in v2, since the current implementation is
> purely Device Tree-based.
> 
> However, my original intention behind the generic name was to
> accommodate future enhancements. Since ARM Xen supports both Device
> Tree and ACPI-based boots determined at runtime, I hoped to allow
> ACPI boots to populate and share the same underlying topology data
> structure. I think this can be achieved by scanning the ACPI PPTT
> (Processor Properties Topology Table).

If that's the plan, then keeping the name is fine (at least with me)
as long as that plan is mentioned in the description.

Jan

