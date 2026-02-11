Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPpLH3SdjGmPrgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 16:17:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED81258A9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 16:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227819.1534239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBxb-0008Cz-Kw; Wed, 11 Feb 2026 15:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227819.1534239; Wed, 11 Feb 2026 15:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBxb-0008An-HS; Wed, 11 Feb 2026 15:16:59 +0000
Received: by outflank-mailman (input) for mailman id 1227819;
 Wed, 11 Feb 2026 15:16:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqBxa-0008Ag-8o
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 15:16:58 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4658ab9-075c-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 16:16:57 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so7241575e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 07:16:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835ba3024asm31427825e9.5.2026.02.11.07.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 07:16:56 -0800 (PST)
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
X-Inumbo-ID: b4658ab9-075c-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770823016; x=1771427816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=buNWejGN2aABvi32BRa/t0i+eOiyQM9z/9XcXTzXrLI=;
        b=RNsKL60sJhYmx3+zc5DDfyXvkT1uqw9msNaNyIhT/ZXcUEfv+cqk//HwwYB/RVtFPA
         D5QB65ywlyseuQFg5rI2hUvRZZ9iX618v+AvAl2hhLeqkbZaSwOOpC1tO4D4eq+LYfGF
         EV1qgK76B4cYIg+Oj+oHPs4110O0PWH76N6k6A0RILNr7U8ZrTvF+esekZ05nW1NdR6J
         t7Q06qYj4eT4sESvUIlfRddJOoIyq02JV7sFzP08Acu9rYOcy2DTT6yV6+wJNwA6wjsw
         LuigrY4eMDZKefCUYhTAIkyp6CxV0T3Jv4u+fjVGeMc8qpaQ1HfVezX45U9+hWiWi59X
         vq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770823016; x=1771427816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buNWejGN2aABvi32BRa/t0i+eOiyQM9z/9XcXTzXrLI=;
        b=xSXgHeEB1SdlVMwIqvTJCzDrC6Ytdeajo4HKT8j67S0k4SiGy3kBuXF5WYlLppxpyR
         2RrBHBv/J8+q9cyZwLTNyC6RAFGkl22nCPm/48Vgbbmne97HaAL8ckVYOXj01dPXUklO
         gX3eRQ6AgsyT/Sr/k1fyci01HR3FEQXlruRZm6ys8nM/Dz8RFgaT02hRhwQEQ12/lCAx
         yIUUmHr4JQ51depaaOVZy4G/glk5zvWCm+INi1FCVl277Qn+Wx8xyjlVikDledNpcMs+
         YrZ6kCsDxyFEcPhOQcN1ud14G65A9HNK25LK0NX47lDH3GPdagqEPAMtwspbE906/xhM
         fZ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVurU5+A2w/hX0Nmz4gFFI4ecacaiidFwfow9O60mTf49ZB5LX5HRwQgcpEt2AM2/BSvkGdjoldeCA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwU6ff9mZV97m3menVLhORUBiNim3Kw2PUPutJA6FCou6B6R2R
	RYFGjDO2w4HOenFIM6qB0q02lncGYQ0avzbxy2VV5BRfAJ4DWMGYLOLRMkgkuAcwG0q1UTokbRK
	aDFg=
X-Gm-Gg: AZuq6aKbraI4az4it+F2UaKxxHW7hL/Sgvvhl0vz5gHgU2xWO3dfyHzqDarvf04XFEK
	Tso4f7cxEA/tJhDganTEvfRYI6bKSuQOeRSWHsD6VSBcuABuCVG5kaf1VfGf0GQIYeZOmNOMJ2y
	Uo2avxwMbMiFnVQ6rDGNVsmtZlAhaYcUX1DsV1fXZxzl/r85VvmkY9N08l9i4oxVU6Yq8anOpDA
	DdyKk1H9GHVnRf+kkIFoo25dtT6J5Xnx25OS43YhziJQZAKJVsvMjp/SDlIWP77neXkk2WO7ANV
	uoGNE2exFREGH0OGC4LZPuJIaZo5BmzlB2hm2SNDmg1ksAka29f8Dr5dJV3724oC53JJ+J1UQnx
	TTnlqsWAe3gP/4S5KK4IxynZxZTU4Z4vhrh8wmETXz8pIYSTryfMSLj+LIqtaBsI/bCQBYtQF3i
	LAYK2bnL/zHObLYcAwJnKWZqjuXF/9sXpTVDjQXegdRYiIkF4m32WGdjZtHur5PXScDOp7D0bYY
	YetISMXph/YwuI=
X-Received: by 2002:a7b:cd0e:0:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-4834f6c1513mr65836805e9.1.1770823016559;
        Wed, 11 Feb 2026 07:16:56 -0800 (PST)
Message-ID: <64e0c923-dc1c-42c2-9b36-67f0a289e144@suse.com>
Date: Wed, 11 Feb 2026 16:16:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/16] xen/riscv: implement sync_vcpu_execstate()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <b6df040691dcec56cd2f91699f0fa444cc0ef7ea.1770650552.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b6df040691dcec56cd2f91699f0fa444cc0ef7ea.1770650552.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E0ED81258A9
X-Rspamd-Action: no action

On 09.02.2026 17:52, Oleksii Kurochko wrote:
> The scheduler may call this function to force synchronization of given
> vCPU's state. RISC-V does not support lazy context switching, so nothing
> is done in sync_vcpu_execstate() and sync_local_execstate().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


