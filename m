Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBDPLqZ1pWkNBgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:33:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A81D78BB
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244190.1543649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1Wg-0000qc-Iy; Mon, 02 Mar 2026 11:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244190.1543649; Mon, 02 Mar 2026 11:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1Wg-0000oR-G4; Mon, 02 Mar 2026 11:33:26 +0000
Received: by outflank-mailman (input) for mailman id 1244190;
 Mon, 02 Mar 2026 11:33:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx1We-0000oL-Md
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 11:33:24 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f0ea1fb-162b-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 12:33:23 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso29871385e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 03:33:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b4a121sm274266195e9.8.2026.03.02.03.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 03:33:22 -0800 (PST)
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
X-Inumbo-ID: 9f0ea1fb-162b-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772451203; x=1773056003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aqoJzViB893XGgdMEvONv6B6m5eJ+Ze2n/2VeDTpwkc=;
        b=Ub3P1ExU3YLDRBUzbZOoTKEPER+hntdjEceP22IAydNwwxD49R+KZ+N8XwIX/lg1we
         bmZT4fjl+5td5+bfLVmf9goz1Mm0NsCANRHbJnApFOpDWbfAejFNeqi+0xxkOpO4U9nR
         2m4RQicc+00bx8xI/c2Rg93q7tdb0T0Y2/UGRVRGXipfDMylZ7LuzZGVYyuhGo8HVzum
         koH/pV7OP7lHsy7rQgpj/czkF2bdOYj/9MmCbw2rMP36KKBCQoXXhp7FUtSu0HLXlAdM
         7yGGO2redKVUJ+mKVN/npuGAT/LF1vitFAeYIC4A8qQYFZVvrSxzpgq7k2VSM9sYTQbB
         GPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772451203; x=1773056003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqoJzViB893XGgdMEvONv6B6m5eJ+Ze2n/2VeDTpwkc=;
        b=QER9yZyNe6QSb8csfJjnVdRao8TKEPSDgXHRtoFzI/zvu6GDhOUZCgEHiKbw1QEfaw
         UswbjvzORKGHDvPmE7LnX1VZ6RiUwRtxjuM96tGyExPkVO0A3AKsZlxhJxbuf97k3trB
         j8+2X7tvRVm2XVXgZ1TSOqmq96X0Tdwt5Roz0sRyLlnm6et3dvIbDqVtSxirgKQpuQF3
         d9uD3t1cf84/BRJnGa7tPqXIUw2wdvCDKpX/FX91yI8jGpOBI1+gU41y2SQmvjbmKmhL
         /ikhfyFQXupfH452FaV1D1pnYLKfwg7dt7bl1vPjHJsw4anyvIIbtQJrg7lDZetGCLF3
         Tf5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqQOE0Dl8aFIgVr4LfdU+kBaGkb8ePueAnWVns2/WkRRzoDkeGPzOCzUIKIOumQn1TsdX8jY+A6qU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNiiXeg9sSG3FOqfKq+0zmy99Uf3zKZR43Yhkkf9xO0DkCDBqX
	5rM3WiHU4M5vB4a5BHiOEF6HuKSIBfTTsQZbR9aO+Ie2k2kwG4aUNpw4X9cYONM31w==
X-Gm-Gg: ATEYQzzW/pDOUzFQvH/ttKbOojSgoJQSkizrmHM8KxyLLZirqwmhEzikcTRLrvzmydI
	u8BTO1ObJ8mQqp3xjf9nODvR2Tyu261lNiZt3fSIpiw0bMQAnkGSKLEyib1v45DKcRpbdDdMmXG
	r4Y80hG1IGlwrjrBxdHQwOCiuD2Ksf+UkZ6FvdwlRj5MWM7M19C0GosSIC+6J/+cKTkGoWHa+PM
	M9CcN2KcWRUEUv+QObvjlMKRcYnpHLukV990wucJjKsDbEsHMObaZ/uKa536P7Rr/bqJT/XZLNE
	9AMTGJZYGtnxJlNpuaBerfnTGwlNT8aQbwp/u/ZqbtsOnlnQtfYE4DJf+U4l9txFUWgfPkSbPNM
	xd0DacFdFuagH39fcZBdqmm0sRBovozQEZeAq9rfSCnlkqw5YAxo3ik8AD74uu4lFshe9sZqstM
	2O6xLMeWrIe9T+YKwL2muN1bPq5f6AkeKEAVy1wg4kxpgbXD3C3nZgTWNOG6GzvGjJ6tvZaqia2
	nXwoZhiepaV2sM=
X-Received: by 2002:a05:600c:8509:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-483c990bddfmr215547965e9.5.1772451202745;
        Mon, 02 Mar 2026 03:33:22 -0800 (PST)
Message-ID: <fb3d6869-5d9f-4a9d-a31e-29ef7049de35@suse.com>
Date: Mon, 2 Mar 2026 12:33:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/14] x86/boot: Move gdt_l1e caching out of
 traps_init()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260227231636.3955109-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2E6A81D78BB
X-Rspamd-Action: no action

On 28.02.2026 00:16, Andrew Cooper wrote:
> Commit 564d261687c0 ("x86/ctxt-switch: Document and improve GDT handling") put
> the initialisation of {,compat_}gdt_l1e into traps_init() but this wasn't a
> great choice.  Instead, put it in smp_prepare_cpus() which performs the BSP
> preparation of variables normally set up by cpu_smpboot_alloc() for APs.
> 
> This removes an implicit dependency that prevents traps_init() moving earlier
> than move_xen() in the boot sequence.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I'm on the fence about the ASSERT(), but I'm getting rather tired of unstated
> dependencies.  For a PV64 guest using SYSEXIT to enter the guest, it's the
> first interrupt/exception which references the GDT, which could be after the
> guest is running.

I think that's okay to have there. "Unstated dependencies" is of course a wide
field, and going too far with assertions is also a risk.

Jan

