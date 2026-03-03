Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IL9BEzTpmk3XQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 13:25:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418DA1EF5DF
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 13:25:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244694.1544085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxOob-0007PK-6y; Tue, 03 Mar 2026 12:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244694.1544085; Tue, 03 Mar 2026 12:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxOob-0007NP-3p; Tue, 03 Mar 2026 12:25:29 +0000
Received: by outflank-mailman (input) for mailman id 1244694;
 Tue, 03 Mar 2026 12:25:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxOoZ-0007N0-SX
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 12:25:27 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e521b5b-16fc-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 13:25:25 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439b611274bso1447805f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 04:25:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b59723fesm15659360f8f.38.2026.03.03.04.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 04:25:24 -0800 (PST)
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
X-Inumbo-ID: 0e521b5b-16fc-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772540725; x=1773145525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=glQI9NyYmvZoatxQQXBPml8NKmzywG1lmIdrGzxSNlo=;
        b=AXF1LHHHyKrQQ93+vKbG5+9WJNVaHl8IyGXKPKCapPpalU5mF6v09wtShr3YIMQwIA
         Kyu8r9EUhQVDKDTZ3X4Vg97QFvwa2e2hvA/whFog9mXfebg5MNt7scQvaeS+xJMhB4uN
         8F3DV8iqPLwJwldrNHzOCUyKnmc7tj5EU3aTiJSKtvBoYDwFjzFprNb5auDGmqIGyd+Z
         DnqyoQZ0fBGsCHM55g2SXNkPczabfCLiAF5WQ6IZBr0DbRRDRDk3IuUMSMFdPsWdZrt+
         0wJgnJQDA58A+X1Je07C+XsBrvrwS9rJ6i9S/hN8N3ZQaubk53Y70kwYP/nNFsOUw5qi
         UptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772540725; x=1773145525;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glQI9NyYmvZoatxQQXBPml8NKmzywG1lmIdrGzxSNlo=;
        b=LfCbCVamSfxc6YRXvBwpDKfxjXKtDGuii6024srlPLMuaatp1cdZ4dyzwKo0L0Seny
         YTMwmU77UYV+TIVJCOuSHwDrZdmOL1RX8kFtUIV37co7izeyzy7FOdM1pmDjbCfmCadu
         dRVkEWhAAUjy19iBF0KB97Shjj7LKSmaRYAAmkOepgd+XT9RqtahAhCXLhM3sltL6s6v
         STsah4p4bFtrQBhpqhFbLN1pD3LnNOeIZtqVx6ehf/EjqHpOtG/fjzsE2w5z72vJkJIM
         8P0RqPn6mvqk0d7C39UEocn9HIghUUKnQH+/WX9ZWYzgKkMroGBh7Po7PtEd4OlIYDFi
         WYAg==
X-Forwarded-Encrypted: i=1; AJvYcCUTaxPwKPiythX5wB9XViJxWRmVkPU/ONBIMyrhkcsfSFWFJHQrYdxyKJGNAiGuiiW0kQk1q9BdXzk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcgB9APoC9hYYbKfQVHSWUiMGMD05iPhym/ynvZRnQkSFNx0NV
	BJGQllOVYvALfc9w2zyDljV6RI0M1ba8Cfavc7ty0GPB111UqCYio/wk+knrKAZDLw==
X-Gm-Gg: ATEYQzxGS1Novu3vD0kxa1Up/qGqqXUPDjqu8r5ZsJKS1kmEO5Y8hsZEkDsIco6QiBT
	zSKv4vzKOJq4n0px49Dktw5Zd2ZI2Au/CFxGkxqnRb0qpK0Lho+rMbT2EOuLmPdWkAzWKEpR/gZ
	xaMb4K46Ke1ubMjSVvzKJC5/kBtxnOsiNNm+b1eNwsxQLqrbVp6ZpqF6wIGlkl7kWhN3JTfs0nV
	5GOxbiHCYovaZR4zWVmDejB4FCXR5NayeK0vP7Kbaf7x47/r3duVpWaQxxR6r1lWQT5Z3tyzROs
	e6ABiJbEp/w1FrgYefFcJa95SwA0EhqkuSHyLUDICdkS/1y/pl/VIiP6GzUU6kJHhE7XUUhmczK
	OIwzrL9SPVeH49Z/62urp/AZATQbUOcr0VMjidwYHPgmDpZqIFINaAMd3KC16i6ZVlobadVZjbA
	pg4KTELal18i8OnnPBRm5kzgw2X9RF4LNkxYL0T0S99QhMvutQfW5GG05cQ7fetQ4R+8uFI1v38
	bVQN8z2yZev+8Q=
X-Received: by 2002:a05:600c:8106:b0:47e:e8de:7420 with SMTP id 5b1f17b1804b1-483c9c1d4bamr255211005e9.22.1772540724801;
        Tue, 03 Mar 2026 04:25:24 -0800 (PST)
Message-ID: <1607bd00-99a3-4601-a995-e038b4e02d4a@suse.com>
Date: Tue, 3 Mar 2026 13:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/14] xen/riscv: implement vcpu_csr_init()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
 <9694ff5787d5f162581a16f0974ac9a55c538019.1772016457.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9694ff5787d5f162581a16f0974ac9a55c538019.1772016457.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 418DA1EF5DF
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 26.02.2026 12:51, Oleksii Kurochko wrote:
> Introduce vcpu_csr_init() to initialise hypervisor CSRs that control
> vCPU execution and virtualization behaviour before the vCPU is first
> scheduled.
> The function configures trap and interrupt delegation to VS-mode by
> setting the appropriate bits in the hedeleg and hideleg registers,
> initializes hstatus so that execution enters VS-mode when control is
> passed to the guest, and restricts guest access to hardware performance
> counters by initializing hcounteren, as unrestricted access would
> require additional handling in Xen.
> When the Smstateen and SSAIA extensions are available, access to AIA
> CSRs and IMSIC guest interrupt files is enabled by setting the
> corresponding bits in hstateen0, avoiding unnecessary traps into Xen
> (note that SVSLCT(Supervisor Virtual Select) name is used intead of
> CSRIND as OpenSBI uses such name and riscv_encoding.h is mostly based
> on it).
> If the Svpbmt extension is supported, the PBMTE bit is set in
> henvcfg to allow its use for VS-stage address translation. Guest
> access to the ENVCFG CSR is also enabled by setting ENVCFG bit in
> hstateen0, as a guest may need to control certain characteristics of
> the U-mode (VU-mode when V=1) execution environment.
> 
> For CSRs that may contain read-only bits (e.g. hedeleg, hideleg,
> hstateen0), to the written value a correspondent mask is applied to
> avoid divergence between the software state and the actual CSR
> contents.
> 
> As hstatus is not part of struct arch_vcpu (it already resides in
> struct cpu_user_regs), introduce vcpu_guest_cpu_user_regs() to provide
> a uniform way to access hstatus and other guest CPU user registers.
> 
> This establishes a consistent and well-defined initial CSR state for
> vCPUs prior to their first context switch.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


