Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4WjXA9pAQmog2wkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 11:54:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A2A6D87FF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 11:54:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OZW9ZBdu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1347399.1605251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8h1-0006IL-Aa; Mon, 29 Jun 2026 09:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347399.1605251; Mon, 29 Jun 2026 09:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8h1-0006Gh-7p; Mon, 29 Jun 2026 09:54:19 +0000
Received: by outflank-mailman (input) for mailman id 1347399;
 Mon, 29 Jun 2026 09:54:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1we8gz-0006FW-FD
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:54:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we8gy-00DhWP-CZ
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 11:54:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4240c0-5cb7-0a2a0a5109dd-0a2a4506bad0-26
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:54:16 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4240c8-08de-0a2a45060019-d155dd2ce0a2-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:54:16 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-472493849a3so1142380f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 02:54:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47327c47122sm12501722f8f.34.2026.06.29.02.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 02:54:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782726856; x=1783331656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s7+wpNRUMbPOlk0tq2A+yyypDT43uBszaNrwNFtHDM8=;
        b=OZW9ZBduHxb/RSlLrvOigmZTfGjlAiJ7aLK8vqYOpPoRDDmB9MjwjCOY0jrIyF83bY
         U2oc8lXrS3sjZ2IGGUgbIcrTbKxsjSZLlndTD1jWh2hBvwnWj+vFcsiS3fnHdWYGNZLB
         vGHyuW5o3LJYCp14q5I+Xtb1lx98Vce9XyCIdjeSSqaKOi+ZSlkewnSd03UJkhoGPQ1f
         kyO8eNGPuag+27kGCvVcgKenfdPbakfhaSuUr/PgksyE8DS9D8yJFiDcHbaRXfY5YQC2
         hfC2l3KF6VFw3ypxZvuYyBWFCSTpCi570nNn2ynmvx0X3oBgkdX0FU7xK5+txo6D2Jsa
         QhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726856; x=1783331656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7+wpNRUMbPOlk0tq2A+yyypDT43uBszaNrwNFtHDM8=;
        b=IbA0d2apAdgiuY5y0/XGiY9IMMmyVMyqoJnYPye4HHgypxZgY1yARzOfHgEAX4BqBX
         s2ib12Ls8qTCauhB8NLc5tTS/bzGQheK7mJoyFUW4DNr46gacQYcn2ocleBInzfKSWIc
         3mWNDb81928fB4/7y6ZPYhmovmcGGW7iY4DNGUkNzbnnjoVj3eKGypr+oj7TELadbrh0
         BJ/THkQybMMji0zpXu5BvrtHaCfdqe7GQmixfJbTd6yiw6eseqUcI7PQbBnctPgU4UcH
         kqOxrMyR7EjnkCLzJuNqY4OGb/++xMbx9HZtQZK2C5g7qcvhqQ1f6uptiTDDzOGY2O8X
         W3Og==
X-Gm-Message-State: AOJu0YzxcnC7N4absDW517v1AQOAuaww4W7nrexgahoG3M9LAX+fwdm+
	8JWX/NtGLUqGJlLdScsytw6hjhO5iqxDvNsu62TUKlzwyvJFREdUlMWgrm1RCQ==
X-Gm-Gg: AfdE7cm/SQ1cqp9y92YQfd27YsDOKyioAqk+i/yI1OF6VVFX00bXIcbTYvAFOfpA4FZ
	uWkCrP859+nGo/5oZDKq7eCbFSBf/tB0NUedOj6tSrp+O9gl7+JypAXuLL8r5lcu40bYKhy/26y
	pqSEizyEOQ7ZnipI1PURukIlFXYBgghiLYqaSTvDG+t92V93iQ7+R//B50NqYIJnWR6YB/KcYJi
	6ll8zHqcdcqSFRAgF/OkwCprUSqWIRIHWV8ktNvk0P5j+hFCDNLAjGJWnNmyzhShaNB0Ai23lo7
	VAmAB4gSOP2olFTbaZRKNe7uppnH7ZUV4wysxL5QHIvCq6oItJ96+OD7FWmu6LNtUEq5AeJkgJP
	VaJYwzBCQiDzac/aRehAQRF9JZZl4H2obwhZlEkMAVbiJjXAUfhmx9/5t8MO6nJtQpT0Algk55D
	3Lcbl1XY197bf+mvGzptCthTrj6ygUFnS1Sppa7bIgvWVKb+IkFYvXYpVyV2Ba0E9rgXM=
X-Received: by 2002:a05:6000:230b:b0:472:c587:1aa with SMTP id ffacd0b85a97d-472c587029cmr8705822f8f.3.1782726855587;
        Mon, 29 Jun 2026 02:54:15 -0700 (PDT)
Message-ID: <6b388225-2a8b-41e9-9e06-e98ccd5e3646@gmail.com>
Date: Mon, 29 Jun 2026 11:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/25] xen/riscv: introduce aia_init() and aia_usable()
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <709f4f1d9d593501819fa3d579b2cef0a108b48e.1782487661.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <709f4f1d9d593501819fa3d579b2cef0a108b48e.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1782726856-42F2468D-0C0F2D80/10/73395122804
X-purgate-type: spam
X-purgate-size: 707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96A2A6D87FF



On 6/26/26 5:46 PM, Oleksii Kurochko wrote:
> diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
> new file mode 100644
> index 000000000000..ca42c3086126
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/aia.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ASM__RISCV__AIA_H
> +#define ASM__RISCV__AIA_H
> +
> +bool aia_usable(void);
> +
> +void aia_init(void);
> +
> +#endif /* ASM__RISCV__ACPI_H */

I just noticed that it should be s/ASM__RISCV__ACPI_H/ASM__RISCV__AIA_H.

I would be happy if it could be done during commit. I am also okay to 
fix that during the next version of this patch series.

~ Oleksii

