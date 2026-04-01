Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP1ONLsrzWn7aQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:29:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A35737C270
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270435.1559105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wZA-0002dA-5z; Wed, 01 Apr 2026 14:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270435.1559105; Wed, 01 Apr 2026 14:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wZA-0002bc-2g; Wed, 01 Apr 2026 14:29:08 +0000
Received: by outflank-mailman (input) for mailman id 1270435;
 Wed, 01 Apr 2026 14:29:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7wZ9-0002bW-5J
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:29:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wZ8-007BsH-HN
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:29:06 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2ba2-bab6-0a2a0a5309dd-0a2a4509c04e-24
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:29:06 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2bb2-bf79-0a2a45090019-d1558034ac07-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:29:06 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-486fb439299so65391735e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:29:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a63c963sm2691885e9.4.2026.04.01.07.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 07:29:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1775053746; x=1775658546; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=82tjc1sSitgvrDcck9MA2eyCYZsqE3otnzzVKnNlipQ=;
        b=HsNmLl/c9eWM6R8Frq/mpydbi/ZYW+k44YqSIMZ5yT5ZF6T935hcHaVus1SRsUIcMm
         W/t/wFKLFwX8kuLl092dANKWiyJg4IpDC4ZU8hK0o69FYNpJl9qqwQvg+0N5fb+4Lg8E
         rnUB3xja6Gh3xS/iSQzMfWNsynac2xNqwoeVsUILa2yKxRyzxa2OzQtayEOXJN0MLS8Z
         v4IlHLXrI9+y9CtWPrGGl/un9BTEA6HTehAG2lVSWgchghtfS6fMyhhFJGkrCMt8Pcdv
         gWVfHqahuoEozcrAo8rJvu0vvf1nt2xa6IHPwwK5QwbgNF9uCw6NMr4qhzMnc3ccj0IH
         xlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053746; x=1775658546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82tjc1sSitgvrDcck9MA2eyCYZsqE3otnzzVKnNlipQ=;
        b=HHj9qPAkBVSiTKpIJS/W2tiKIlvGtcZBQs4vpG7BWLwwnU/vGcoA0eW1VGChbuxlbO
         5cRSdm0vcYDW1j+2xH5B+NB0Ee9FYsu55aAFg7hGz3Rps7NSGbDP4fMVeUNhUOZf69VB
         NgJb+E+WmzEvSDExPgSWnpAVDlv1tx8A2SLfaj+S+iZXXp5s6464QNTMBsyhwNBqU3hr
         JTsV8fY/eacz7HK6jP6DmeR9y0p9ua2OWqyXBr24/NYzGVUCGXBpJK9wgmcahpoWQN8P
         mjRkUB5LDxnWb79Y51egUmod1BaThiQf9ZAYSYGYaJYv6LbTQIMY14U/BTmF8H2qXg5C
         IOPw==
X-Forwarded-Encrypted: i=1; AJvYcCWNt+iZr7AoCd48DZxUuRHKeEPBlIy3FD+yVB0Mqp/dVMZ8kpjEOWl3Rx4si4R0KquExn+OM9AbyOg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCEL+Q+QKfoZsrYg2zKrfXr86x3Pt8ezuAhuX0WDdbGP4EZ6LL
	lhVD0Mn5n6Tjuz32O0FuqJHh83umE88I9ypzTfqtydaZ4AUGILHAKm8c8E3okNoqpA==
X-Gm-Gg: ATEYQzweQBxlyLndINhcEcwzzhggUpTKcEdlaHusF3IhIeMYinrXgIwvJeJtKWIvhi8
	OYVjLOJOeR3ZtmOAUIYE19zxGp4ZHGWQubDcUuSg5GONAOKKGxAJFkKLsRB6Y9z5NMtBOxZh+Pq
	qHbQ+dhCt7hFsvwstSVGoi+Fnl9nRksIIl7Eno2mNKcLl3+hzSy1o69OuNwL+K4NjmupAsFb0Hj
	dsHelkW8FywvdfyIubC4wyXOIccaXzTnqBUgrvibd22mg28KgTmUHFgr/+HhnXMMXakObTbgdmf
	8Fn7o9F6aWMCWhl7I6JVV7cnVFDtKYplbXBVqiDT7LeX3LE1+ixSzSBfFdXIvBaNb0zuy6slmCb
	Ql3LTtkaBDs/4e59+Z3tlyVlXj4I2oNJIwfyeJ1UQ3p/PnwYxJ5kJ7bkE55Q8F0TU8UxVyKMyrj
	zT/40tnbVOGuMK1I25WrKs5gGAhRspC6/CBq1tO/DiBZIuvkXLEtYfSkyeOpwxSc9FWlnM1xtaN
	U8Po8idGDagZFo=
X-Received: by 2002:a05:600c:c04a:b0:486:f9aa:2b57 with SMTP id 5b1f17b1804b1-48883597e39mr46941995e9.16.1775053745810;
        Wed, 01 Apr 2026 07:29:05 -0700 (PDT)
Message-ID: <08732737-e02b-4be8-a49f-fdebc38924a5@suse.com>
Date: Wed, 1 Apr 2026 16:29:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/27] xen/riscv: implement make_arch_nodes()
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
 <9c97b4bc6fb8a5e556c38cfe7e34de0eb3cbbbb0.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9c97b4bc6fb8a5e556c38cfe7e34de0eb3cbbbb0.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1775053746-2FD47152-3D53C688/10/73395122804
X-purgate-type: spam
X-purgate-size: 977
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5A35737C270
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> No RISC-V-specific nodes need to be created at the moment,
> so make_arch_nodes() is implemented to simply return 0.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Same question as on the previous patch, albeit to a lesser degree: An
arch hook may plausibly exist (and be called) uniformly, even if on
some arch-es it doesn't do anything.

> ---
>  xen/arch/riscv/Makefile         |  1 +
>  xen/arch/riscv/dom0less-build.c | 11 +++++++++++
>  2 files changed, 12 insertions(+)
>  create mode 100644 xen/arch/riscv/dom0less-build.c

Further, on what basis is this function put in this new file, when the
earlier ones live in domain-build.c?

> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,5 +1,6 @@
>  obj-y += aplic.o
>  obj-y += cpufeature.o
> +obj-y += dom0less-build.o

obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o

just like Arm has it?

Jan

