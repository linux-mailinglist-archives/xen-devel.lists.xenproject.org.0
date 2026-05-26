Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NjxK9+xFWpxYAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 16:44:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C7C5D7D7C
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 16:44:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319957.1587376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRt0q-0001Ik-CS; Tue, 26 May 2026 14:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319957.1587376; Tue, 26 May 2026 14:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRt0q-0001Fu-9s; Tue, 26 May 2026 14:44:08 +0000
Received: by outflank-mailman (input) for mailman id 1319957;
 Tue, 26 May 2026 14:44:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wRt0o-0001Fo-NH
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:44:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRt0o-0048Il-3N
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 16:44:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a15b1a2-2eae-0a2a0a5409dd-0a2a450794a8-46
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 16:44:06 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a15b1b5-229c-0a2a45070019-d155dd32cde1-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 16:44:06 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-444826c16ffso9083075f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 07:44:05 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ed90f8978sm3792998f8f.7.2026.05.26.07.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 07:44:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779806645; x=1780411445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/X8eZNrrybPMnti/+Gb3e66Bh32G+5tDXPR98n1gyo=;
        b=KHvNeQaOqghETj5Ub0af9Y4IfPePAYW8NXkSbZfuNONmI9unCjdpUZGYjfiI2B9j9G
         lUSCXRisetFFfjrqv5Acmd5v8wwm7+JAOQ4HjeCgutGVjMj49PUXW851XCuAmTkF6xQD
         f6v/wCtPby4Fec3Zx0PZHCS8ZVoYJhfOfl/Co4LHzMnE9w7ZbmlEN6lKlQE3zUPOuJHx
         K30iQgnNkKdkMIYBQrnjyKC1tuh+8ZAgcawo1W9FR5yZnPHjTLdc+0gvnEyAf7422goY
         XaHllxXneBwVOb5U0qPsAyC0Fgk8QUZ3qzkymHIyJKlMBPBXs8vNuIEdqQiIbH5HMwdx
         l/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806645; x=1780411445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/X8eZNrrybPMnti/+Gb3e66Bh32G+5tDXPR98n1gyo=;
        b=OMy2mDrcxR1k4nCZ2u8ArzeDFaIX9RF4URPekyr81W5ZwSsELXdM8CO3Qc01f1uK7X
         qVNTE4JLf/T8q4LbBjSO+4QurkPWX/lArkAuACpfj0nHHkSP7g3Pobaiwj/LboGRPbMF
         5FinoedfgydL6I2WsUt1DaVxzbHyhsUwmS9QxtyvPk+wlt65LeE3GbkXEZ2ss6fvvqtB
         RYTmmtETO7sbHKZOv2gO2iF51JW3FEXsZcn/0+7vD/gZ659p5shswt4GA4RDbFrNu+vB
         XR4fR1BPgF1R87S6NDGj1abmzKocoyHaIjSsFBKFfb+VxH6fGlRWgI5penUv+/L4POk/
         52Bw==
X-Forwarded-Encrypted: i=1; AFNElJ9wIp8E2kEctWINSagj81R62Ecr9JyEokUrGBoeGxH4uoIX6QabHpSiierkfcj4m3KvqqtdOwgE2yU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlgQvJdelqoQYwrLbQfuLuw8K9vvKA50CNnxs8IkDmw+owaMRh
	NPYpRq2vFxATb65xExW+5wEkKqR4yY7WCnqyWHdUwnHdcEq0puNCIojR
X-Gm-Gg: Acq92OF2K58FQ0LO2tp5Vqk9iTuZK0smmOtU+WirDp1GIBuDlKvCmf7Vp3r9lWmEAKr
	GJ8UakHoiEArHIlj5QK24bj6wI8NK1xFaaMG2gYnbPUvdHDJC91HMQVzFvXnp8EKOObYhzWhGMi
	SLqcvbK45W5A7JKWStPpCBu7b8s4ttROVexOJeAocvMZDojWKhSgKaCrPnnAzhNV8IU06mEAV26
	4yw3eBHeJzKZq98ZnZZpvlmNpT9gK304qrYUeHf9Rm5Adm0P2zBinwAnVB2+/+zv6ghsy3hPUNa
	UBZHZ2vBgBplMy33cbvvE4nhRalUY9apVLTlj/STz1nY4bDjT6fnZ/+GW33Q7Z25SWRzv140DAu
	DVhTyc5hk43R07KYmWu1yqe+VL0J4teyJaCXxYrUXZCsWYPBxULwMFWZbELLa/WqcfzzNee3rxr
	O79S92yBBpe4HTgTfJFnYeyFgVxkHYB8V20qOeb8kLgHCBxmtlg/HhoDtCPXzKWuZAD0k/c91jr
	n4=
X-Received: by 2002:a05:6000:25ed:b0:449:e8c0:fd58 with SMTP id ffacd0b85a97d-45eb38bae85mr32441210f8f.27.1779806644939;
        Tue, 26 May 2026 07:44:04 -0700 (PDT)
Message-ID: <7b05a728-cb46-41fe-9c29-e37c3a605d70@gmail.com>
Date: Tue, 26 May 2026 16:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: scan CLIDR Ctype fields upwards when probing
 LLC
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Miccio <lucmiccio@gmail.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <fc9f1babe0c320214c03b1d294398d411fa41254.1779708833.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fc9f1babe0c320214c03b1d294398d411fa41254.1779708833.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1779806646-0976AC48-A1659BB8/10/73395122804
X-purgate-type: spam
X-purgate-size: 1490
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:lucmiccio@gmail.com,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,m:luca.fancellu@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com,minervasys.tech];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 13C7C5D7D7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/26 1:47 PM, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> get_llc_way_size() currently scans CLIDR_EL1 Ctype fields from the
> highest level downwards and stops at the first unified cache it finds.
> 
> However, CLIDR_EL1 describes the cache hierarchy from Ctype1 upwards.
> Arm ARM DDI 0487J.a, D19.2.27 says that once software has seen a
> Ctype value of 0b000 while reading from Ctype1 upwards, no caches
> manageable by the architected set/way maintenance instructions exist at
> further-out levels, and the higher Ctype fields must be ignored.
> 
> The current reverse scan can therefore select a unified cache level from
> a Ctype field above the first no-cache level. Such a field is not part of
> the architecturally described CLIDR/CCSIDR cache hierarchy and should not
> be used for selecting the CCSIDR level.
> 
> Scan Ctype fields from L1 upwards, stop at the first no-cache level, and
> keep the outermost unified cache observed before that point.
> 
> This preserves the result for regular cache hierarchies, while avoiding
> selection of an architecturally ignored Ctype field.
> 
> Fixes: f4985fce6f0b ("xen/arm: add initial support for LLC coloring on arm64")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

