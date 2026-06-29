Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2W/2NXpCQmqz2wkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:01:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0986D8919
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:01:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MDIo6Y6g;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1347407.1605261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8nj-0000Tm-Vd; Mon, 29 Jun 2026 10:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347407.1605261; Mon, 29 Jun 2026 10:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8nj-0000S1-SQ; Mon, 29 Jun 2026 10:01:15 +0000
Received: by outflank-mailman (input) for mailman id 1347407;
 Mon, 29 Jun 2026 10:01:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1we8ni-0000Rv-4S
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 10:01:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we8ng-00DPcd-PZ
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 12:01:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a424267-5cb7-0a2a0a5109dd-0a2a4503d936-8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:01:12 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a424268-ec1a-0a2a45030019-d155da2cc9f2-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:01:12 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-c12614b81c9so169240966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 03:01:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c126bcb08desm114190866b.51.2026.06.29.03.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 03:01:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782727272; x=1783332072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fgq+v4Es9/eMUqonr0zupEz3GLH90c42eoiPJBw+Jqo=;
        b=MDIo6Y6gEAdIBnP+pg+Ik74g/ieu8fECp680pDuD9L9vjYcVJGhMpIZs6UPoxJ8Tk+
         C/cpEvmcgB0jkCHTFLGNyHFM9U9jWYhV1FAWx82jJ6ho1P78YxDGRqrHO6wZw0QAa5WT
         qG+esiSnWtJluX2uR4yOjwEWx+r3PBL4gA+QVR+8o/YX9vG40Dvf3FQwes7wCWFxstr7
         ZdoASc/rsQwgdSZGTmfD1M1P7QRExlhyeTnjmrTo2KG6td1yzez66RgioJgsNoS4uO8U
         UDo/UtcJ7mprrJfyutQxlapPMG6n/iXKbqUS31ClY2nyieIb/+DYzqObbQqHTnVmx5bE
         3gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727272; x=1783332072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fgq+v4Es9/eMUqonr0zupEz3GLH90c42eoiPJBw+Jqo=;
        b=AXRrJxvNEsHRo3DMAwoo3gkpyh1ghTDJBBDCcaZbOjYu1etsS82CFpgLL+ItOldYsP
         rFW0eUELeomy6/25KkMWrvUMLvfLEgxIxabDLp9ofkY/6IoPws/eBdHopZzS1FIEDtp5
         cA4eA/3VAD/uYbI/eWScvnc4lya36ZUTOYYjcZ4iz+P4fwM/Jz0Azxqlahhb3sUyelpU
         KP2P9BH8yOTOtWVlv9aPFXmMBPbpLVgGqLVt0YidFkuZF+1D1rAUVuPqX608kn0iRhtb
         Add7PGZiDHeNCUWxUmCJJt9DE3wtQnF2KRJNLv8n0wOcGpjgACD9IsdD5eL7yAqzlUsw
         h/Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rp2ClLNYIZDFidZotpqvDP80PF3Plausx+d7+sGAMrZF4FgJ0tmZw40e/OKYzss66UJEo2pKk+Ch/8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTP3iYqszGrfIe/VTfUkwngyuMTUJcDreY30XIKkWPM/cu05uT
	9uHFAubXJG+t0cHctgighUaZgfQILHghZunFAD1bnLeTlcIo5mtakYNp
X-Gm-Gg: AfdE7cnyBaqIsvPxaUaBmvsZAQukUYwCa+LDeCj07Z3zOhAozuAem7BlmhFTv3WBg+a
	Yy3yOrsh0gFofpoNGUkKI9W+sUOX1vTePRCisz9tnmmakZmtYZ8XPO+Qf3gnYbN2i49OXY/GD6g
	vfvu1Vc2OcVd+UkVeFUcdkZ0PLfN/ZPDq27ogUntQrTAvr/zw20k1DXbIJVWSgg5WRQUikOxUgy
	79YV+/xZekZy5u8Kl8V301IXPM8Mc5CVnEL3IKiJOSQ4ooI2L5qVQOEgFyAnhmCdwSst+39F/o8
	oKC24aAJbgpjIgeefNA9en0WIhXqgXSLf/twH5wQIDkiPkYdOaax9CwSEIn25NAvUDfHWIlQl7Y
	tnWpaXlxfVn+T69KuRyHJ95GlCpJ6+V+gu+m5WC4T8eydXYgh2SYNBdebRV9ViRtFY2F/p10iPT
	sakS1TYTkL62UC+NkMOKmYCpWaqmzCyy3f9oLHb4qCFLYi2E9IkacX6PAC9rNhXmgrS1Q=
X-Received: by 2002:a17:907:9694:b0:c12:2b10:e131 with SMTP id a640c23a62f3a-c122b10e261mr559175166b.2.1782727271662;
        Mon, 29 Jun 2026 03:01:11 -0700 (PDT)
Message-ID: <d7abb999-2f68-495b-9d3f-2f7d672de537@gmail.com>
Date: Mon, 29 Jun 2026 12:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 1/4] riscv/irq: define a per-arch
 irq_to_desc()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-2-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260629094531.55555-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1782727272-B55BC5D1-0E2A50D6/10/73395122804
X-purgate-type: spam
X-purgate-size: 1951
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F0986D8919



On 6/29/26 11:45 AM, Roger Pau Monne wrote:
> RISCV declares irq_desc as a static array, opposed to x86 that uses a
> pointer allocated at boot time.  This creates issues when attempting to add
> an extern declaration for irq_desc, as asm/irq.h is included by xen/irq.h where
> the definition of struct irq_desc resides, and an empty forward declaration
> doesn't make the compiler happy because it doesn't know the type
> data-storage.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>   xen/arch/riscv/include/asm/irq.h | 4 ++++
>   xen/arch/riscv/irq.c             | 5 +++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
> index f633636dc308..b3e03117ac97 100644
> --- a/xen/arch/riscv/include/asm/irq.h
> +++ b/xen/arch/riscv/include/asm/irq.h
> @@ -35,6 +35,10 @@ struct arch_irq_desc {
>       unsigned int type;
>   };
>   
> +struct irq_desc;
> +struct irq_desc *irq_to_desc(unsigned int irq);
> +#define irq_to_desc irq_to_desc
> +
>   struct cpu_user_regs;
>   struct dt_device_node;
>   
> diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
> index 25d329500212..353e9246f15b 100644
> --- a/xen/arch/riscv/irq.c
> +++ b/xen/arch/riscv/irq.c
> @@ -19,6 +19,11 @@
>   
>   static irq_desc_t irq_desc[NR_IRQS];
>   
> +struct irq_desc *irq_to_desc(unsigned int irq)
> +{
> +    return &irq_desc[irq];
> +}
> +
>   static bool irq_validate_new_type(unsigned int curr, unsigned int new)
>   {
>       return curr == IRQ_TYPE_INVALID || curr == new;

Changes looks good to me.

There are similar changes in my dom0less enablement config for RISC-V 
but considering that likely this patch will be in staging faster then my 
patch series:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

