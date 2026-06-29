Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A09NOLSOQmrd9gkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 17:26:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476966DCA2D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 17:26:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=BCOSvmYW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347731.1605557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDsW-000471-9p; Mon, 29 Jun 2026 15:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347731.1605557; Mon, 29 Jun 2026 15:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDsW-00045Z-7E; Mon, 29 Jun 2026 15:26:32 +0000
Received: by outflank-mailman (input) for mailman id 1347731;
 Mon, 29 Jun 2026 15:26:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weDsT-00045R-RA
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 15:26:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weDsT-00Ek8L-4O
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:26:29 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428e96-5cb7-0a2a0a5109dd-0a2a4502d294-38
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 17:26:29 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428ea4-5a27-0a2a45020019-d1558033e55b-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 17:26:28 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493ae59eca6so5878245e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 08:26:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-470f55acda0sm22484480f8f.23.2026.06.29.08.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 08:26:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1782746788; x=1783351588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cf8pnyV2I9HDqONUD064lFP+sPqaVN9hiADkH7H3x8Y=;
        b=BCOSvmYW+DVjLq6zBxJlXRItVnBMyarz32RN9j2+zzPvsNKDZKjnz8uMVGcKPFfM+6
         VnSxdcX39imJgpuEEyEcgC2kZdK5u2sUe+VXltVeW2fwkt/+7FDfYIQddF54jbII4Tgs
         12oxyZTxSK8nNzTFmNHRNjiN+eS9Lc9s2d0hWqDXBBSVPIFfoQ6hyMzPZX844wUcDObI
         E70Zyj7T+dB30HhdDJ300wT2pdDBnzM9zc3yg0admjH0kdKC/1WJvAnKDtoVUKwU7C/e
         jNW9DTgyRpHc0S+9KcVwXSGQHSBx3t93LVUUCGxgzK7g7lWwIjrq2j/8MoFcQc/m+dBN
         wrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746788; x=1783351588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cf8pnyV2I9HDqONUD064lFP+sPqaVN9hiADkH7H3x8Y=;
        b=Yz75lQ70GmXNIshhh576kUuk0RMk3tyXisAZNm4ZqdeL5HdpfJn+p0NEUnOlksdLsB
         NQrwt/udk4qseWkqWTgtems3Y+bEO2nw82LzLk2ZQx9Eu5KKlWfP5VbqaA0A4N7W7QBJ
         EIH8f66umMbrczRHa1ad3GDAjPZkk2jC9P63lZMirkeaLqzix30uQ5qNsNhQ+lAjKsr0
         g/tqDrPWq5bxVb9YD2Iw7BBRVGtmN3hHbrMtOnvBq1VlYVK/qgk0UbVPrb3YJP0Xb+Xv
         61GzA6OoUFpUmGm1KJ1LJ5gm1wuF/eITeKeOOI4liHKOgAMR1b3MbHkaqvPbbQyZgY80
         gCsA==
X-Forwarded-Encrypted: i=1; AFNElJ8tNSfOLT+CdNhw4GvtflZSfvSnvLe89ln6PNG/0yZXHPlGJAZqI974mHWKukxeti6BxFFLiPVcF0c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7pAIKfAi9zsnU5CkNMvbPdmK/u2zp10XOK4VdLvpmj5JlIfh0
	B3c14TIpjYz1yRrttBPxtTCxlHy72I1Z45HEtMMBQGhBsl4CSFacHGSRYRIzF35QHg==
X-Gm-Gg: AfdE7cl+N2swP0YVdj2Pp4YQUdL7bSLlic7t5bzpYvlLdroB7dZSlGsB24Z8xTnwxCo
	Tbm/mUJdsCmZWcloXe48LEI+WTBFJWGJatKpcFfAP4pyBR4z3cCOZw/24f1EvRjZM+A/zkcDr8W
	4asW3NEY39C/FXDqodgtJGkSp0gQKO8/BVe2HYgjPRIZj17TJtKytguCRxzwnbv0KIpZxZXo/Oh
	JOCNWprDH4mv8OfWa0LkX3irjLyAxlgFzDAGTqfrunb7smqzHy7CHSZsvdxk58z6s654NJGwMDX
	3gV8LV89MU7jIU+X446B5E3FUfPHdEJmx25NvCrUmpBIpM3E1ydUuwjcEW1bPwRzVXnNfpbOO5z
	AnnrJwIDxteYK9poLwD9MTT8h520RtCYsP6rol0zs50Ehl/aFRLHDAJkcit7PsHdL8edemkmHXb
	kw75MTmwKJk8t3WWvLIdMoBRn/1vdm0rb0jrJPHLUkD1zbRisXTiYu8mNgqXZewyl4kcx3VYiUC
	Ps1
X-Received: by 2002:a05:600c:188a:b0:490:c032:ae92 with SMTP id 5b1f17b1804b1-493b82c4c65mr1516235e9.33.1782746788329;
        Mon, 29 Jun 2026 08:26:28 -0700 (PDT)
Message-ID: <76b16195-43a8-40cc-9d22-7b9c21e4c8f1@suse.com>
Date: Mon, 29 Jun 2026 17:26:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/25] xen/riscv: create APLIC DT node for guest
 domains
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <2bab716741ae436c7b92989d7613dac620166b89.1782487661.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2bab716741ae436c7b92989d7613dac620166b89.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1782746789-4FF197C5-74CCD12C/0/0
X-purgate-type: clean
X-purgate-size: 1501
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 476966DCA2D

On 26.06.2026 17:46, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/imsic.h
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -78,6 +78,7 @@ struct vimsic_state {
>  };
>  
>  struct dt_device_node;
> +struct kernel_info;
>  struct vcpu;
>  
>  int imsic_init(const struct dt_device_node *node);
> @@ -93,4 +94,6 @@ int vcpu_imsic_init(struct vcpu *v);
>  void vcpu_imsic_deinit(struct vcpu *v);
>  unsigned int vcpu_guest_file_id(const struct vcpu *v);
>  
> +int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);

Doesn't this belong in the earlier patch?

> --- a/xen/arch/riscv/vaplic.c
> +++ b/xen/arch/riscv/vaplic.c
> @@ -9,6 +9,8 @@
>   */
>  
>  #include <xen/errno.h>
> +#include <xen/fdt-kernel.h>
> +#include <xen/libfdt/libfdt.h>
>  #include <xen/sched.h>
>  #include <xen/xvmalloc.h>
>  
> @@ -19,6 +21,11 @@
>  
>  #include "aplic-priv.h"
>  
> +#define VAPLIC_COMPATIBLE "riscv,aplic"
> +#define VAPLIC_NUM_SOURCES 96

So for the IMSIC the host value is relevant, but for the APLIC the count is
an arbitrary(?) compile time constant? Why?

> @@ -29,6 +36,74 @@ static void cf_check vaplic_deinit(struct vcpu *v)
>      return vcpu_imsic_deinit(v);
>  }
>  
> +static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
> +{
> +    struct domain *d = kinfo->bd.d;
> +    int res = 0;

I'm pretty sure I did point out this (or a very similar) pointless initializer
before.

Jan

