Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPE4GIWhwmm3fQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:36:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCB230A426
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260911.1554076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52s0-0008GD-8q; Tue, 24 Mar 2026 14:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260911.1554076; Tue, 24 Mar 2026 14:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52s0-0008Eo-6D; Tue, 24 Mar 2026 14:36:36 +0000
Received: by outflank-mailman (input) for mailman id 1260911;
 Tue, 24 Mar 2026 14:36:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w52rz-0008Ei-KD
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 14:36:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w52ry-00B2AX-W9
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:36:35 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2a16e-bab6-0a2a0a5309dd-0a2a450bca8e-26
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:36:34 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2a172-ef63-0a2a450b0019-d1558033a80c-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:36:34 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso59782835e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 07:36:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48711007830sm26107495e9.7.2026.03.24.07.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 07:36:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1774362994; x=1774967794; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=15SPtgP5UZDXK6qGNQVN4OTCckbxz06/dBZpe5NbVCA=;
        b=Af7YhZmrYe3qX6w4/rk1YCb6rpO1TnYGLIkN6qOalRL0CKgcRRSUnfKNU+4K+cECNT
         N65WoKQeoUF5sES8l5xHyjFhjx6LJbbevqD/m/wD/UkSI+5cf0I5sokrtJ6SaViAB0gs
         ztyhxy/ErVN7emWD48T9txVpib+E8W+UrHangr+Bwo8rrnqdeD7CurdV1OPlTb77owsY
         j1HZztnK15TEU2OIrxxp4FcllpXlamSKMfe2CF94CuZhgOqoqQFyQaAhY15jk6ljWuFR
         /3pDo7p/PLGsVqu/RbQ0vgOBLhTJS0oo8eMUf9yiqsS7eXko9qGuz416va+Xxn4xcMip
         eLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774362994; x=1774967794;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15SPtgP5UZDXK6qGNQVN4OTCckbxz06/dBZpe5NbVCA=;
        b=fiU8KoXT1zsFHx6J4i8tN8jhlxzuz2HxMwHVEs0nj3VRk07lkTUjyqXOERkm6Q6O7w
         vtY42m4tFQd7BKlhQckOf4v5R2LwDITObAkYXQXQ7nnXutGbU6oCKG7lhVKUyuxHFgRr
         Qe3N6S/Abg+OA3wwo5GfjKvNkxG1cezP1+GNtmPWn8kY69C6GjgEDFAwz7gY5Ti5rq3E
         NW0gLtKdHUVBIfxiFSDzeRqwpYD/eJsOc/pLxCtcN52+8maPi6XEzraN5c9L89R+vvjJ
         5M5XL7RQREMrbcGdUXKKopz28DJ7Ne27l/ocotgYCH3490Xk8q+ue9kyNn5ZdG1S83RL
         Frvg==
X-Forwarded-Encrypted: i=1; AJvYcCUmEQeBiTvtvu2FWJL4NcNOIJlmGkmc2Thqjyop1Dg4h6WnTUG4LbVxMMhjAyv6RfjEflrVzcTlDhk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLuuTIHASwWHvIBHKsAH4lImgMJyDkK4T2aI9cN/Kcl52aPwKM
	Dz/XBSfwQCsi7oO7nGNbv2JuHRoX6Tu1shtkW7eGFPRkWglDQeEZkmGZAA2FvR5e4A==
X-Gm-Gg: ATEYQzz39tpkEYi1Q7JfU0dgNv9o8jjdly15RBCexuGUzbf0Gzaliz12tPvPEVZyBy0
	ut5WtsJ+yLEOMDuadtqxC6QdzpEEwiqR2hL1HblnxIAHD1aw4UUmOdwMYaviGL2er4V1IN2grDo
	PcU8T0rUawYMAq/WTroPXGmBHRu41TnfFu+ye1MlJQglvJnxaUk62vJ8iNcYhf/9omVQot6KJ9k
	Ml+hUqE0jc3/U1zVCiQNlfcbjDG2BlMqYWbtYfyGbmPWxZza/YrS8gZJhqbSxUITQBaQe10YDF7
	tJ6zCyJDzeh95S+BgCM0qOOthI+UqFBA2VR5RRn9KXs+QgA7RKsNBHYYfRyfRznRevXjACIKGI0
	pMVGKFeIaUtNVZKUWBKnoS1dyjMuonrKbgKUepidM+YKTKRmLMeZS32jkhWw8uzmO2ncmOgrDqC
	iBxaCWY5KPmwIOr4BLoxIfmZGw1tEeLu/29CfVEZdJQ5Z2mvmhrSNUvECtyHNxv9rhs0i4vIOs9
	HsLpzoM7oV0p8A=
X-Received: by 2002:a05:600c:c0c5:b0:485:3c11:de84 with SMTP id 5b1f17b1804b1-4870f212e52mr44767385e9.14.1774362994012;
        Tue, 24 Mar 2026 07:36:34 -0700 (PDT)
Message-ID: <c5e1cd58-92ba-43cd-bef6-16578d0f06b8@suse.com>
Date: Tue, 24 Mar 2026 15:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] xen/riscv: init_csr_masks()-related improvements
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
 <b283d6a8d59d66010f6249161245e4a7f4219589.1773419622.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b283d6a8d59d66010f6249161245e4a7f4219589.1773419622.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1774362994-A0807112-9825787D/0/0
X-purgate-type: clean
X-purgate-size: 536
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
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
X-Rspamd-Queue-Id: BFCB230A426
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 17:44, Oleksii Kurochko wrote:
> There is no reason to use _UL() in define-s sitting in C file hence use UL
> prefix instead.
> 
> Drop 3d argument of INIT_CSR_MASK() and INIT_RO_ONE_MASK() to reduce risk
> of incomplete editing after copy-and-paste, or other typo-ing.

Another brief sentence about the AVAIL -> VALID transformation? Then ...

> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

