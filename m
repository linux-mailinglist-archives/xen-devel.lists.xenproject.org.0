Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6sDyG9QZMGpFNgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 17:27:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8635687A81
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 17:27:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=dZQnNV3D;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338410.1599440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ9DL-0003HG-Oo; Mon, 15 Jun 2026 15:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338410.1599440; Mon, 15 Jun 2026 15:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ9DL-0003FD-M6; Mon, 15 Jun 2026 15:27:03 +0000
Received: by outflank-mailman (input) for mailman id 1338410;
 Mon, 15 Jun 2026 15:27:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZ9DJ-0003F7-SW
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 15:27:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ9DJ-001ADP-5I
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 17:27:01 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3019b7-2eae-0a2a0a5409dd-0a2a4509b71e-34
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:27:01 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3019c4-2497-0a2a45090019-d155dd36b46c-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:27:01 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-45fd461e4a5so2808193f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 08:27:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c5266sm40410769f8f.29.2026.06.15.08.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 08:26:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1781537220; x=1782142020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nZSp+UeZrFhJTM26btPscK7HJUUQJAebEmPCc68wNSs=;
        b=dZQnNV3D2KEw9IZaZQTsKu59/4l8Wn7+OLryIBR2V58kcm4Oh0zHnhSf8AklsPZn/Q
         xcAVUY/NCrTsQYzkkdqArGnMsxXmlQUsOWdoCvDdW1AMzoVwtALFPLHsFr9/zemU4NWY
         6tr6scbG1sh/laTIqBmR8oDIRyGjFQbj0u+dO0XGihbh8DeXBFs/57aqnNnH7PbWHP/e
         3ni5qAIxf70IPATndBBegRO1EgIkzKYUAHDuLxSs/o5s21SWxcoudfZy82wJZxJLgajh
         DMfhG98psa+crEZDUTwL3znRmTRt0CpbmxJck9xFatghyyGuoYgIBXqyUcVrNdVr7Rx3
         O4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781537220; x=1782142020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZSp+UeZrFhJTM26btPscK7HJUUQJAebEmPCc68wNSs=;
        b=JcaVxzltdhLgynmKaSdi4AbnSTfdZxQK3hiBBOX9qum92UZHa1gdT9yQfW8z/KJlqz
         R4GYAWKihsaql53FAW0XHT68XcrInrxY1swUBHnB80FhDkBObMr/VtQ8O4oOYR1c9SbD
         gx+agZga/L5uZ+okQSkU2Veqob5hJxFhhBYLXfIifvmPWQi5/zv2Aome9p+hhTrlPt22
         fyhPj2eV36vFCN0FLNBwh5+MVRrftR7ckRlCcY0DSGQxFqKnHzeitVaYzl1/KnkBTXZ9
         oMDxAU3w+oX6Thzg4LsAJCAqamcV+qVGrDGuiEpfbnEpb3vLOhnvoefM67A7way6ok8P
         /1kg==
X-Forwarded-Encrypted: i=1; AFNElJ9gp22U6rIki2usJqB9h6Sbf5Mbr0I6HDVG8CALjrrUQTR3DTInSlnVeV/sWvwXLhM6/D5GiSQRxUY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7CAbWEHx7G6tAxy8F1/o/VyOCzruiqSSJQxyP6RlLi+9tFtSx
	9dbnTdGK27fzqb6rGWVUm4gVj3qGHOE/3EwQhl4lE/1HjtKNdHMr1OU9JJN/6kc+Bg==
X-Gm-Gg: Acq92OHZjTvft8Avygg/jbrZ+vCVaOUaMBPhJVS6oosrJh2505uxloa5HTsgaPlJ5n4
	7vlryLJKU8LP17HPmp8kL4oH2Bt7Arau64wG1Hq5NDnpRxdg2y03ED+gsgwY6klKaLUstvAKFB3
	SdnD1nPUgVTYYaq4AuSKM7trvkXxIGZK+tBRQu5h7EW/MaLxqHZf5zxPWBP3JXnAMPVjnHfAZI8
	SPR7K4rL7pPuiD9SQU+6Rd82OG+oMwu41cUqYtb5WNt11TBVdmPE0/001MwIzQ1KCfllj9XNiUq
	iqA2N2kJl91nf/twFSg2sceF0ePcEU/bBm37itJ7tAeSbGa++ncubqv03rrnF1htVw6KCheDJML
	TmLuUQjNywrs/Vs7RyTv1l0mZ+JyGEJzLBYrf354fOIMPTn+CTb7SjrYqBohd91MPYPlg6CZpEg
	LLSBGRpGR6oFuwUlDufBgLpONpSx1zoDq8qsH+3GU6lKQlu2oG81hHJYqXYsUZqUMV9E769fb1k
	1zv660UUO0Bhuk=
X-Received: by 2002:a5d:5d01:0:b0:45e:ec18:f20a with SMTP id ffacd0b85a97d-4606dbeff08mr21739340f8f.32.1781537220337;
        Mon, 15 Jun 2026 08:27:00 -0700 (PDT)
Message-ID: <b15238bc-6102-4388-8eff-5b1ecf767ee1@suse.com>
Date: Mon, 15 Jun 2026 17:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/26] xen/riscv: initialize RCU, scheduler, and system
 domains in start_xen()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <824f8624bf920d0e7f558a07ace58bfc18a44788.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <824f8624bf920d0e7f558a07ace58bfc18a44788.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1781537221-37175A53-6F9AFAB2/10/73395122804
X-purgate-type: spam
X-purgate-size: 437
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8635687A81

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> Wire up the missing early-boot initialization steps in start_xen().
> 
> The scheduler must be initialized prior to do_initcalls() because
> cpupool_create_pool() is called during initcalls; without it,
> BUG_ON(IS_ERR(pool)) is triggered inside cpupool_create_pool().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


