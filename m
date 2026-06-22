Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k90zCfo5OWqQowcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 15:34:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEE46AFE65
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 15:34:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=FBt1CxoN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343756.1602981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbenL-0001v1-6i; Mon, 22 Jun 2026 13:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343756.1602981; Mon, 22 Jun 2026 13:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbenL-0001sf-43; Mon, 22 Jun 2026 13:34:35 +0000
Received: by outflank-mailman (input) for mailman id 1343756;
 Mon, 22 Jun 2026 13:34:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wbenK-0001sZ-Jz
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 13:34:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbenK-004kQN-0R
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:34:34 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3939d2-e002-0a2a0a5209dd-0a2a45088ca4-40
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 15:34:33 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3939e9-9ee7-0a2a45080019-d1558036bd6e-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 15:34:33 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4923fb1f095so32020835e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 06:34:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd1fa34sm333016215e9.5.2026.06.22.06.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 06:34:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1782135273; x=1782740073; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6riZrL1n0k6q7Ffv4KfypYZiV1sSyBYSeurv3IfBmeY=;
        b=FBt1CxoN66In38y9ncl7V5PMTKj+KJ3qgR0XDTv7Rd7qjo40M29HD4hNpZntnojZtH
         h4qdB+IjGqq2uLUC5YTI3U+UV0XwGxhGSGlflda9x2m2Gx+Z8uakxjzeWw6bykc7L301
         687MYFUvZXevZy7khi+MG6ebG1hf3s9R1aQy4LMsbtY3pclpLHSrKOB37rmfiac568M1
         VP8CFJi8Hw8ic0iCgVqeT54R25khv6DOu9OmWCyHs6P4yncl6Ydt1cKVwXykhqnfP2Xt
         72dT5CwoyHPlOMpyya98YBI9Dy05+oj2g6dEcOqmLxtNcL8NEheqJqaa88dQMKck9Rf7
         9QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135273; x=1782740073;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6riZrL1n0k6q7Ffv4KfypYZiV1sSyBYSeurv3IfBmeY=;
        b=PDNuC6xkwTRB03OSLoWlu7pavDp9qMbWwGRR8pnPu8riKxe1hI6x179vuzw//lnKyr
         rpdZTSDKE25hm8OxSGIW5aGR+qHujv6uejHFpPR4qzxoj8t8k+AAIVgZZokIcmVSLi5G
         HX4kmTzTaoaD/8LpPnmeoyVzr+Hqai9E46yRAc3A5NkqmcWGbRwTR94UTnbW/i4il7S7
         Y/mng8CjTCAUOADS4ctM4ffwg3zP8MJC/l/NVXAYF1ArGFOO3+EVstwTlD0MjDFlKiHv
         lw/X3S4ql4EFjLxryUhVLGZ+wWfR9c55xYOW74lvjnwEDU9is+NfblsRTIcsPk47CIiW
         7n/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+yq/XtpV/o/lx+8YxOSQqHenbflAYAR6+cnG6USmKdMXTVdQnYPH2S+HOfj4EVhOWZhxX1BfiUpa0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0rXMXokeyLgyJ9EfTqWptR1rZLO9bKdManIe621VPJLOQwdIr
	dXe7mWE0ApSu1sIKpzJZbPG8d9g6QqChyi2bBFJ1YkdHX+jQqKlL5UadXmgdOk8aqg==
X-Gm-Gg: AfdE7cmVlIIFU7oVzwmsWc1HJO6tA/DuE6Un1ndHxxOd/dIW7ZtbwuhDs3fyBEvobuH
	oIO0x9PXBhs+neT39nxLHaHHuYxthO7NGMbxDTNXcdLJochpkskmy7PlfC583QLAVnuMS6fUDsT
	AZyovgJRe4XgarasPJKDQFl3LSKhPg4FUWNrv2XN1RMITJ785EfR0/toAt1+VrBC2GhhuJGsvlg
	Gh53euqnxS351NLSsIN0r244UuvmelssnqzI2Ou0KL5h3f0HIDL5DeCSkpK91CVTfplCE+cwdpw
	Qg9b35GVaJz1d7Uqpsa+SobEirjWAo/3nbIjUX0WXuZW/zQMqeSmJHtC4qXS16XAGdptStBqywA
	Oc7MuM2arhlO+p7rnsNb3m5wuU948bbourVTAFCAeue46np7fzUu/D22jCrlIWT/F1V0rm0QJ6o
	VDJCUAEl9Cwc9J+6HQgXlWVY/EN5cOaXOKmQfKj/yfVd5hSnSYDyourHRyVknG10sFqkPyXbA5Z
	YOt
X-Received: by 2002:a05:600c:4fc4:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-49242582235mr211922485e9.29.1782135273412;
        Mon, 22 Jun 2026 06:34:33 -0700 (PDT)
Message-ID: <48ecbfab-b4df-4218-a081-e04f9ea736ed@suse.com>
Date: Mon, 22 Jun 2026 15:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/23] xen/riscv: implement prerequisites for
 domain_create()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <6785b861e192b9812f9a945bce19ff4b725a996d.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6785b861e192b9812f9a945bce19ff4b725a996d.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1782135273-5E5E80FA-3659E07E/10/73395122804
X-purgate-type: spam
X-purgate-size: 505
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
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
X-Rspamd-Queue-Id: 7AEE46AFE65

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> arch_domain_create() and arch_sanitise_domain_config() are prerequisites for
> domain_create().
> 
> arch_sanitise_domain_config() currently returns 0, as there is no specific
> work required at this stage.
> 
> arch_domain_create() performs basic initialization, such as setting up the P2M
> and initializing of next unused phandle.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


