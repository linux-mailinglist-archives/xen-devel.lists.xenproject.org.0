Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /W1dNHyCQmpM8wkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:34:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A006DC19E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:34:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VgIFW6cu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347624.1605459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weD46-00055M-4u; Mon, 29 Jun 2026 14:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347624.1605459; Mon, 29 Jun 2026 14:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weD46-00053g-14; Mon, 29 Jun 2026 14:34:26 +0000
Received: by outflank-mailman (input) for mailman id 1347624;
 Mon, 29 Jun 2026 14:34:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weD44-00053a-KT
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:34:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weD44-002OGB-0n
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:34:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428265-bab6-0a2a0a5309dd-0a2a45039b70-30
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:34:23 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a42826f-ec1a-0a2a45030019-d155dd36bd83-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:34:23 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-472a14c9965so1299726f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 07:34:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4728072189asm16711717f8f.30.2026.06.29.07.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:34:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1782743663; x=1783348463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N/8KpGOepGaMgthCrwAAgXryR7rPpRRa8k7sLniQhFI=;
        b=VgIFW6cupXQZDx4G3/knbsCqvOj7UAJOZqHF3mWyNkU7P/KmG+M4Ukp9r3O211lBqt
         MROVYs7isiB/rSlRHlBC7pzufRfrnkfdeSH6E2y7ArfJv0zYxgUPjOXTCcEsk9JSPVXV
         AmdSi+lwPlG+75FcjaxxAhMLJ1oOXLhI5VH9Z4ejYpL4lKVZZXxaJgewkie+jaf/PtqM
         g6+PJRnYfzeOgwCFxGzSiNYsc3WOSQuftzf9IkRnXFrWfMxxRvhfNv0dAFlxMJV9qw/p
         ttih6b7kwva0C+OCxV5eBQCqJLwHAWH3H6ewQiFfo87z6oZiu4QxITqpmchorjcRIoAt
         WYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743663; x=1783348463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/8KpGOepGaMgthCrwAAgXryR7rPpRRa8k7sLniQhFI=;
        b=iYFnTq+VHgKEoo84t6YQTNe66ncOfg6+FmBSpZNP+xk1cJk3jhWsSaQaQFS3WxIUOm
         ZHTS+OSeiWme2e35mJiqdFV6oJr44Gun3GSMovRopBDW8D6l6V0+3kxy0BZPBjcIW0PU
         +b7M3PSwsIVNt8BumjN19e8/MIuRvaDK3nWrIkS/0d9VDS4jJREHcDlKkrdt/xucz/TM
         zdv/blD2FMbUJvf0bYbOaqVknCHKSOYcN1t3WU/zIxzBMuCbrAapRWS9V3ITyXRxa3tp
         DX2VKVaONhWIClkGn6zmdZBA6x21ucOLmk2neNx2bnB+OSqw1BdsyHV6hzcTUFAHatNZ
         mreA==
X-Forwarded-Encrypted: i=1; AHgh+Rp898zYiGkPOHOzj5XlHZOncRcMUB9EoPG8q1TsuKwkK0emLE9OtmCGN1bmBrlmknNWFgiO2zXg2XI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOKSvHBC8D7CkHPa33pPsHBewoTHh918GdgQHTCcGPbKmQi0JW
	7/DuxCje0EwjL5HIDES9i1xW6TQgbs+FnkBvSvz8ixLsQ7ObEwKXwy+AnDUCQRT4hA==
X-Gm-Gg: AfdE7clcfkQyBIAWmOcfObMtBHGzGibZbFsCqfkyRgZ6Rn6XWcx9RjZS/T/mhR/WNBp
	bvi9+cmR12ybTBqNZUUJasiacB0I79IyNQjeOmoewpWkIpDr/qNuZaAAhiwIUBCHcpEXE0S2iiN
	Xx4zqITZ/uU8rrYUewH+QifE1au1Hr6QcKHcTMfWoscxCDg1bIiTI9C1Elp53NEVw/tOV0CYMtV
	DK/29/ulSk4Mqvh+fI2Pb/ATaFGOluh2c8cbDbVyTBDh/d1MF+XcNZBX83tzCP+744f3g8c+DpQ
	M4IxEM+UltXsifWSP1SovOjoaMVQelzBaSlpaVISaWg21ins0RqGquM2UumnypEGr2PsIGqo90b
	LGAz3c3RBAxJ30zILeBj77OQM4r6KUGFGqd64kBtqBggChJj0oJRr7twd1M/CPv5JASsPwRkcUv
	5gTm0Az4WbVcKUsM++CUVn9FBNZKu+gC9I53EnRP3bkrdJKtr0MufhrQiTIZzZu7drxctS19Zec
	EHO
X-Received: by 2002:a05:6000:bd0:b0:46c:8f47:3b5a with SMTP id ffacd0b85a97d-47500d5eb3bmr1042335f8f.23.1782743663295;
        Mon, 29 Jun 2026 07:34:23 -0700 (PDT)
Message-ID: <b28a9027-c811-4415-9a3a-c66d5d642706@suse.com>
Date: Mon, 29 Jun 2026 16:34:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/25] xen/dom0less: turn max_init_domid into a common
 variable
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <2c60cbed167fda0f90ce3aa4324ea4c4b076c43d.1782487661.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2c60cbed167fda0f90ce3aa4324ea4c4b076c43d.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782743663-075275D1-CF46E18B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1886
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,raptorengineering.com,wdc.com,gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
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
X-Rspamd-Queue-Id: 35A006DC19E

On 26.06.2026 17:46, Oleksii Kurochko wrote:
> Until now every architecture carried its own notion of max_init_domid:
> Arm defined a real variable (declared in asm/setup.h, defined in
> setup.c), while ppc, riscv and x86 each provided a "#define
> max_init_domid (0)" stub in their asm/setup.h. This duplicated the same
> declaration across all arches and placed a purely dom0less concept in
> arch setup headers.
> 
> Now that the dom0less build code lives in common (xen/common/
> device-tree/dom0less-build.c sets max_init_domid, and the console
> serial-input switcher reads it), there is no reason for the symbol to be
> per-arch. Provide a single declaration in <xen/dom0less-build.h>, with
> the !CONFIG_DOM0LESS_BOOT stub kept there as well, so there is one source
> of truth and the arch headers no longer need to mention it. Update
> console.c to include <xen/dom0less-build.h> for the declaration instead
> of relying on asm/setup.h.
> 
> Place the definition in xen/common/domid.c rather than in dom0less-
> build.c. The latter is built as dom0less-build.init.o, i.e. the whole
> object is relocated into the .init.* sections and freed after boot,
> whereas max_init_domid must outlive boot because it is read at runtime
> by the console serial-input switcher. domid.c is always linked (obj-y)
> and resides in regular (non-init) sections, so it is a correct home for
> the variable. It is marked __ro_after_init since it is only updated
> while creating boot-time domains and read-only afterwards, and guarded
> by CONFIG_DOM0LESS_BOOT as domid.c itself is unconditional.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> Regarding last paragraph it is also alternative option just make
> dom0less-build.init.o no-init.

That would be a pretty bad move imo.

Jan

