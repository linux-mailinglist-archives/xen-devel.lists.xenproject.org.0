Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGuTO2ZQ52lW6QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:24:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7CE439747
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288801.1569042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8HK-0006XR-HT; Tue, 21 Apr 2026 10:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288801.1569042; Tue, 21 Apr 2026 10:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8HK-0006VQ-Em; Tue, 21 Apr 2026 10:24:26 +0000
Received: by outflank-mailman (input) for mailman id 1288801;
 Tue, 21 Apr 2026 10:24:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF8HI-0006VI-M8
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:24:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF8HH-003Jx8-VP
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 12:24:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e7504e-bab6-0a2a0a5309dd-0a2a4509bd7e-34
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:24:23 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e75057-2497-0a2a45090019-d1558029cc86-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:24:23 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so24225595e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 03:24:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891cca5743sm150155185e9.9.2026.04.21.03.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 03:24:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1776767063; x=1777371863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ds/NgsiTz5/hi/HIUrMoZfylWeyyQZPp8ypQua8kOB0=;
        b=CTl95oidWLIOIqPs8TOVGXxZqFkvPNQKuk8yLZ4o/bP0z5xybMz3Hduqo2zru/MEfN
         E2H5JqthIuXLjJtthr7Pw5+2SxVBYYq7B2jJTQQDYw35N8CngFSGf78ARITbMJPqm+rj
         3hfjOoC6cUgcjPf6zAnCcdDd2cAC2gh94wJZV+rUkXXJmD9mivPpRDk6s3uNH2sCHZLT
         dI6kq6B75wzvxZpjkoQslg/VPs87BojB2vyQGuX3HESHYxt4nQm3EdhvJKBQReYqWOYn
         gTemCkCQymbofl6enHG7h+afwwF67MZp6lInyEPJxnyf+3HXp/TtrqhQOAfY7BJVRQIQ
         rlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767063; x=1777371863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ds/NgsiTz5/hi/HIUrMoZfylWeyyQZPp8ypQua8kOB0=;
        b=gqDkNGeLhmAITyQtvkHSoqCqFTZJVI7YGtyZKA1+NGcTxvlQhlIPyPvYCLA+j6bDK6
         Sg+0MUnyxRbIFGt1l2WjqXTILDFGufsjVaEK3BvFEKsdZcnakAaXUPwzAaDnJb7FBPYG
         75vz/DX4j+HlpgTXH/ttGEs/a8RmD6nOkiZoDWaQwM8Yvqr5mxBG6tlruoZyY21pmynE
         qh+79GdZtCBlxITBQIgf61diDwxN9eYmnC7560V0zhL19jPat7/A07aLVGFTFnzn5q+r
         vwDBT0h/WmW+TnQNUCe5ZhqoHR7RYtnIU7CvrsSCLpj/CCHVnMhgHR7b7cIIVDusWA2j
         bvag==
X-Forwarded-Encrypted: i=1; AFNElJ+O4HNEW729qaflzeqLrSQ+stT/wo/GyAGa1VtJGcZ+tkE1nFyOc2PfzpO9qipWzNTynBKqamFEGC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbPK9fifz7Y8N0moVQoRDodR40OLqfU/9ciAfu3XYRb0vz2ymC
	oAcG+GlXyOw4Tzg3L83KHlSkvt0TYprjhme4aYCufKXcy9LgIMoiIC2FC+EkqXghEw==
X-Gm-Gg: AeBDiev/ysFeETtk4i74kSW8RlFjxAUY0lDwfRTqlRAwHqYJfNzM9SfFz8tj86d4Voj
	GZ7ldVyDwa/6xTr24YjE6dMJWATGuy61ffbs4WddaOhSbR0fNkkR7+i00VlHkx/mqmCicJoG4EI
	1gVT5GdkmvV08OXkEn0tOwB07zoiqlqbSYwMGdOA2EahC2RwntKFEg7T1UU5qMbE3NUdBXvWxrG
	v/MsM6BFlZPOLxlh4muXIpic5VpkNZYSoRNumSzVTxRW20vLiLUUL7eLU+OjHZKLV475mjoUY4L
	luHSwM2dEpmYjKKsTM/L5fxf8dHnEQQj2t2QCoMvz2NTCcuxEHEzvDSu9BeiKoBuVBsuiK1X2/c
	1dKuxBT3fkAn/K0DNyE69OXUd8tdpxfXqiZiBOd72QsBA1m3vQ6rtAY29tVym8Wd4vE94pEgadY
	cTKVGiZDi7MHwXitqSI0hcS+CbD+y7rTI/VlTS7hNnF+2SpvRL1AtgYHAcTttUziAdbnIpyZHKB
	19HEVAXfIsUXt8zthx4k6yOAw==
X-Received: by 2002:a05:600c:4e4f:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-488fb778703mr252973015e9.15.1776767063174;
        Tue, 21 Apr 2026 03:24:23 -0700 (PDT)
Message-ID: <a6d09913-3de1-463f-8143-69911af0150e@suse.com>
Date: Tue, 21 Apr 2026 12:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] xen/riscv: add definition of guest RAM banks
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <8280fe1a5effacd595d3dd69b2b11e06226411b2.1775836193.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8280fe1a5effacd595d3dd69b2b11e06226411b2.1775836193.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1776767063-416B0A53-5C2EA19A/10/73395122804
X-purgate-type: spam
X-purgate-size: 1373
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: 5E7CE439747
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 17:54, Oleksii Kurochko wrote:
> The dom0less solution uses defined RAM banks as compile-time constants,
> so introduce macros to describe guest RAM banks.
> 
> The reason for 2 banks is that there is typically always a use case for
> low memory under 4 GB, but the bank under 4 GB ends up being small because
> there are other things under 4 GB it can conflict with (interrupt
> controller, PCI BARs, etc.). So a second bank is added above that MMIO
> region (starting at 8 GiB) to provide the remaining RAM; the gap between
> the two banks also exercises code paths handling discontiguous memory.
> For Sv32 guests (34-bit GPA, 16 GiB addressable), bank0 provides 2 GB
> (2–4 GB) and the first 8 GB of bank1 (8–16 GB) is accessible.
> 
> Extended regions are useful for RISC-V: they could be used to provide a
> "space" for Linux to map grant mappings.
> 
> Despite the fact that for every guest MMU mode the GPA could be up
> to 56 bits wide (except Sv32 whose GPA is 34 bits), the combined size
> of both banks is limited to 1018 GB as it is more than enough for most
> use cases.
> 
> Add inclusion of asm/guest-layout.h to asm/domain.h to make dom0less
> common code build happy.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Again pretty hesitantly:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

