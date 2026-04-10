Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJACDvzV2GmuiwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:50:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A94B3D5D94
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278734.1563492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9RP-0000Ch-Me; Fri, 10 Apr 2026 10:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278734.1563492; Fri, 10 Apr 2026 10:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9RP-0000AZ-Iv; Fri, 10 Apr 2026 10:50:23 +0000
Received: by outflank-mailman (input) for mailman id 1278734;
 Fri, 10 Apr 2026 10:50:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wB9RO-0000AT-ML
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:50:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB9RO-00FKW1-2P
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:50:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d8d5e7-2eae-0a2a0a5409dd-0a2a450ba59a-26
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:50:21 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d8d5ed-bca8-0a2a450b0019-d155dd2fccff-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:50:21 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43cf8d550bdso1859510f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 03:50:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63deba9esm6932343f8f.10.2026.04.10.03.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 03:50:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1775818221; x=1776423021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B+HoP/mMaG5yYZyVjtUnYROQmO400kNler9q5jRv0/g=;
        b=ZPr5Nd3A0VNO1YjMIx3Dmb0zarIK+rEdOWBfCOn9ChOuLMZBRH7Hv8QJsqfhTyqzsA
         PgEnumRhJX1hGpst4wvQYJ+qg6wvIGQJhxp6543N2gyRCBpaFRvd0BVe8lJAXLtzAR+a
         MWSXgnoCLnp2w8L9wfoPkkMWfSBaPi9fp+ENtNGEEVLV2ivDnhwyE3DVc+rHLuCc9/Sj
         fdlwjTnESF0RTr95AxuH2NNFJcXAVfYkJT+bzkENP+mJ7nNfhAYxTEs7UP7d4aUozN9+
         WYl0q7kplekIyf+FaT6zOSQ9XMjgp9EpAHJ7YJxjntgSBY56ovsRcTcGtSUyKM1PY0hC
         XjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775818221; x=1776423021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+HoP/mMaG5yYZyVjtUnYROQmO400kNler9q5jRv0/g=;
        b=UDmx4ndXlw4LnHHlbuabGieFLO69xtU1ZaU6IXjoDreZeyZ0plkUbH28CwK8MGWDo2
         P+OVSruv3rBwG2osxLHE0uCK4vO1zMO6hOCgHy6r6L9tkr5zAtEAUmeNF3nsr1uWzlMd
         wwfJpEesaEw5jjWAmGeP4PNRyPruvPPf6wnEwVl1W3AoV2ovUBP0i0XR/B5hIJbosaU2
         FRW+aEjXc9sL5Jb3QOzisy71SCE6mt3HxxyU9BXiGpQ7ohMleIf5Myly2G2JfId/RhH7
         5dirFLLBXIaLJjgS29xgJ0TIPYZTkXWNRlhMko3MJaTpvS+fUpffmAuJds/x7sLDHJhO
         h9XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqBB09TBIiS2kw5PkJLryvbpSsdOTppoBtGPKg9c6Zrrn7ZFkgb/7VCFP0SNummt3JrbRzc7T4a68=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLxAe+upk+E4ar8hbmeXd7mRCNep7/OHXNO/9tiMrMzSpusktK
	V1B+YHbMQrNAs5mF2RPNv1bhYmnyZ5dNJpO86bCaF9uQzLN6KS6xOjnCUpqRCZwPbg==
X-Gm-Gg: AeBDies294f6k9WrvsgLhrQnzdwyPE5UaKh1+sn2jl4hYPmjxrL0ztxUX0PFLicPyJ8
	4CWrSYNY3KlfsA0tnWCqTqfiCRXbrB7qLgDKPSnhrafuRzgJmrgZ33MlimMd1l6MXA71K2L2yVX
	4SI+VTdx9wv6YPI2HurRP58jfrYtnOqdDEfwDeRoQgZb18nFUYyl/M/eacOyURt9YN+PksU4/42
	JObhIVJtIxRg318Pk1HFGBvFmhYXIhH8wJCDUJOdNb3gUt8tJd3idtk/Xz/uz8sEbXtyHP17a23
	Kal2J3Jn07tT5QrXo3rAq3DSlkgyp0NCq+SHF0AxinzHDmOkQD/ZLaOBYt9l/KtUtjC9g4K8qF5
	dEk6JYHYOMvjkZXrRlIh0vOXr0xpLLG8ykmhH2RsgrQZjvx/qhyaxqBbru5NNwE8x1KAv2A4R+n
	9y3aF8Tb1afwjnrWFN/Z+QOaIvURRzdfHJgSQVB0wrKMwPyXsIKPGj1ytd7x1qL2T2CilTroWE+
	vtm3fduL755nz8=
X-Received: by 2002:a5d:64c7:0:b0:43c:fbde:310f with SMTP id ffacd0b85a97d-43d642d35d2mr4098591f8f.36.1775818221438;
        Fri, 10 Apr 2026 03:50:21 -0700 (PDT)
Message-ID: <7bdb23f7-fea8-4fbe-bffd-c6f2bf2c373e@suse.com>
Date: Fri, 10 Apr 2026 12:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/27] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <007c0a0243ac7ff1d1ab3faa4ebcdd6fcd14e485.1773157782.git.oleksii.kurochko@gmail.com>
 <efe5b1f5-29a0-43a8-92f8-cc20bd922e62@suse.com>
 <d66424c9-f156-4bd8-9547-46d181aa95f3@gmail.com>
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
In-Reply-To: <d66424c9-f156-4bd8-9547-46d181aa95f3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775818221-EED4F2A1-620E2A1B/0/0
X-purgate-type: clean
X-purgate-size: 1264
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9A94B3D5D94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 12:24, Oleksii Kurochko wrote:
> On 4/1/26 3:49 PM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> +#define MAX_GUEST_ISA_STR_LEN 256
>>> +char guest_isa_str[MAX_GUEST_ISA_STR_LEN];
>>
>> __ro_after_init?
>>
>> Yet then - can this really be a global? Isn't the set of extensions
>> available to a guest a per-guest property, i.e. a global could at best
>> represent an upper bound on features?
> 
> At least, for now I think it is okay just to use global guest riscv,isa 
> for all the domains. From my point of view if Xen doesn't support some 
> extension to be used by guest so then should be responsible to generate 
> proper riscv,isa.
> 
> It probably make sense to have riscv,isa per guest but then we still 
> will want to parse this passed riscv,isa and check what Xen supports and 
> what not, what looks like a double work a little bit. Probably it is the 
> best one option and if riscv,isa isn't provided then just use that one 
> generated by Xen.

My take is: Have data arrangement be as it wants to be in the end (i.e.
here: record what ought to be per guest as per-guest data). All guests
using the same value for now is a fair restriction until things have
progressed more.

Jan

