Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGfyIFkM1WlQzwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 15:53:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E77A3AF855
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 15:53:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275033.1561010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA6rG-0008U4-TM; Tue, 07 Apr 2026 13:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275033.1561010; Tue, 07 Apr 2026 13:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA6rG-0008Rm-QC; Tue, 07 Apr 2026 13:52:46 +0000
Received: by outflank-mailman (input) for mailman id 1275033;
 Tue, 07 Apr 2026 13:52:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wA6rE-0008Rg-Mz
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 13:52:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA6rD-002jhN-Va
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 15:52:43 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d50c19-5cb7-0a2a0a5109dd-0a2a4504b712-32
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 15:52:43 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d50c2b-bb33-0a2a45040019-d1558029c893-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 15:52:43 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso37288375e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 06:52:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a616sm1025390435e9.2.2026.04.07.06.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 06:52:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1775569963; x=1776174763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MPta1GhncLW1FHtaZZuAkEG+3wgrwKTTvWRMJfaAmuw=;
        b=bknB2D4YjpRVNRTrm1elUQKjBHEjIuqBdzepCf15ZQ7sUmj/hxlQ6U72a4HG/r9ZQO
         91ZSOH7KL0+Anundtye5O5XUrRTp23uc/hjDUcpJjOcbnpMat9y+R2FbSBk1huSr0qJF
         CNJGEVrFotILjFUYGOAcy5MMI4PCqMNx+kK/xUffPgy2gt7/iEvqHncFJjDDv1ytn70o
         JcoTREyntcEBul1KwrGk/1BQBlpOHaORc5R04Iupee2EUvHetWGc6O7xQmN+r7h+DlFk
         ChD9yj/Rwkx68tPEm/SIHc8tukbdYEsWAOPslRowi4b2pGsDyLrCWaVUofBhz+y0qzTb
         4fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569963; x=1776174763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPta1GhncLW1FHtaZZuAkEG+3wgrwKTTvWRMJfaAmuw=;
        b=Son4WZBqUBWNKc0KrgQ/0VBBh+tL+q2kDGfh+HunqBbYP5OxhyedbSWVsznA23g53u
         UGBOe5Bolq4bRCMIQd6eRYf4YjuNhgSw8iK8nSwVGGrnlOmws+lnpc154xq9DVoy+NO7
         et7RCz3uK4JSyFs7mhKMAt4cwQETcc//XTg03huSS/RY+4tbPQmROXyVeIAVNHAni4Wc
         j2LAU22k/L2NS3ztryZWeAuPK8ZEMnD7e8Z50hksCaiumSiYrOKZWy/MYSPhpK1BAhvD
         K8zrk33ypn1NQl7DnNxUgowL5o+WqMX5LH1+X4ebTg3/6YAKAHkDnpvZwRGncEtcnhTs
         TQEg==
X-Forwarded-Encrypted: i=1; AJvYcCVDrseXYm4qXSHGrxxrIMMJ8aV2xZGCVEQTdkmDd913aXfNTjE2r2gBqeVDDM7STCB32QGqDXuIhnk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8sizY2hQZWt3jKBqGH3GzPqcIHOBLmzs87yEnTeeHQUOXbE6N
	5i30sNvZxxpoEUQ8+6iAlNi2BcxHlJtruSOWrCnXvOtk7Q2993C3qQV9O0m2jVlICg==
X-Gm-Gg: AeBDieuqIXvmwuoDZdv0P6lilmy7Qwg/Ax9xOYJDH+CaKTGjPinCMrqaoYklhhLgb4B
	V092dCjrv8PwSCzxdOXnfj1emNxDQay4l+M9GNKAmBH31Mox4izhCHWNnng9YJKECKRrd0WNDq6
	+3vqqU+U29aljJEcCRx+ZYgfe43tZmerErM7VY6UZEtd6byDXxn9PQJ8eAtcWpjM0di5KS9tK+v
	DLdhBQts9X7HtmLxNMNuJGxbopVxHBsShnpnWVQN26/PiAfxCjix+2KC/XcjenpazJ5TNo5oTBC
	+qiybIM1Upe5Px9rG/OQRoQ+hp0QMIE/7u1NHBSkk9FNexed0DpXTmTXzyjsFfBNlzcMANiPSv5
	UW7oPgm408YuwncIJlx3hmJxsuU4YiPaP4VPISPrkw+bWpoeYXaRax60a+U1ws4oRhQTbJSgbEA
	+AiNHRp2sMajpLRfXSYDBj72oQAODZpFn1QOI2JeMEjHviFaTMw8zLkBSWz5HKvnnliPPDvHDg1
	7U6Z81cT6Z3yNJ2wlINiJKD5A==
X-Received: by 2002:a05:600c:c8d:b0:486:ffa3:594 with SMTP id 5b1f17b1804b1-488997a6883mr231861065e9.23.1775569962939;
        Tue, 07 Apr 2026 06:52:42 -0700 (PDT)
Message-ID: <6e95af5c-0f04-45f2-8ab2-cff6e6fb9112@suse.com>
Date: Tue, 7 Apr 2026 15:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 26/27] xen/riscv: provide init_vuart()
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
 <71483b96126964a7cfcb24253cb04379a9f662c1.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <71483b96126964a7cfcb24253cb04379a9f662c1.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1775569963-3052B51B-CEF7893F/10/73395122804
X-purgate-type: spam
X-purgate-size: 629
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7E77A3AF855
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> For debug purpose is enough to have only print messages from guest what is
> now implemented in vsbi_legacy_ecall_handler().
> 
> For full guesst console support it will better to have something similar to
> [1], thereby there is nothing specific should be done, at least, for now
> and init_vuart() is provided to make dom0less code buildable.
> 
> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop/
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


