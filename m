Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKSxEyAlFGrfKAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 12:32:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5305C942B
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 12:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319153.1586867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRSat-00075D-SM; Mon, 25 May 2026 10:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319153.1586867; Mon, 25 May 2026 10:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRSat-00072d-PF; Mon, 25 May 2026 10:31:35 +0000
Received: by outflank-mailman (input) for mailman id 1319153;
 Mon, 25 May 2026 10:31:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wRSar-00072X-Jc
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 10:31:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRSaq-000HQ9-HR
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 12:31:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1424db-e002-0a2a0a5209dd-0a2a4501a00a-48
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 12:31:32 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a142504-c1f2-0a2a45010019-d155da2fbd4d-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 12:31:32 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-bdbcc6c4500so646485066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 03:31:32 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc2c4e3d5sm389245266b.15.2026.05.25.03.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 03:31:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779705092; x=1780309892; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vLWh1GxdQcROq+aAV7QgtzGQetrtaB+xsOL2qAt5NDY=;
        b=A5GGErHxWsh0CMHHd26hG50Fu7uwixJGkTbZpKEW+dyalkmOznvKuIoaij/uqTAzWw
         Pr5iUQHmNHmVC4y2OKaIZgziazsOKc1g4AAWdpq0wCQVrlqVoCSr82ZjUIL1ieU2Ccuh
         RWJsGccbY2OL9tF0ciGpiAvdKovoeVX5xyRtZivBFtmlfaOoVQBMOLIWKperhZ6kFYLN
         nKiLS70LkSocdcx2FVqFy5Goenk6XGfW8mzHX5mcEixrhynb3L4pUP15Fm+XnknDMq5A
         kzdQDQihPiizx/FiDmKN9Y/e29ge51s/xF+1c+38Ry1+MLCwYmsBLpXpS60NYtaKE9fs
         3FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705092; x=1780309892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLWh1GxdQcROq+aAV7QgtzGQetrtaB+xsOL2qAt5NDY=;
        b=mlfhZcyIVtcmpT6mX1HzoAEhg5xkhC0Co11E6UY75BuC6H46TCYXiorl10dqhw04aF
         8X2WFDNPNqXu1Q8c2M8AC+rPuuxV7e+DKdO7TMXl9+y37m8x93JZPnX5LZuVGbWeUT/o
         M9nzuIsCdRggpwalKc0vGrb0PczjePB8KIyo4QWkjKGxZazyEY1C5yJgS9scgrJZZEOm
         GmObWLcMDIE+P2e0Dep5qpN1Fe85AJuoyLuf4wHv57266R+JLhXQ4HNjP98eCwj4AOdP
         lfdezbcVtGT7J7+AYnRY53cOhfCcUZzH8oSSMPKgIC5kXPFufaMJsHmvfHtXHfNpVU4K
         LBhA==
X-Forwarded-Encrypted: i=1; AFNElJ/DwjoOtS2ToJZpcPJTqJk36Lc+4FOMxGMc6ejFM5S7/ebKQMXI4zhgVV+0TlrD0pe8sPRZb2tU5xQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywl7GNzlC5t+4dki2+6vIEFoR6mRjJXYGt5Eo27p/7vYTtIXeeN
	/QHfhWrTBiz+30Dsot8caLn3smYtM1Ky6Jmfxpqh3hMCaTkLcGuooRak
X-Gm-Gg: Acq92OFKspEKC6wfa9u0b65T0m+oUfKBixUYuJvSnAbOeGkXjNHNFFyLbrwuUvLyGo6
	7FFEI/eyyzR0i8u1V+/eZ/V7RYWxwJKzBgQtxvryh4RY1IR5gqdi/OgjpzgDkJeYVw+TkCZ1FRW
	69YpJNCp32C3ai+2pgy6zBkOxuZwwpGczbBRvQf6jLdDVouCMotJMkPc9EPTr3Ft4zpcfCQjRtL
	3HFged2+6H4L+6itpeFrUIrli1Wo3O0W/ouy6/tc1GajwfFI3AmcR6lYl3ktTWFGF+m+rOYwNsq
	bifLsonYdWouyXPi1p/oIAh5CHkTxjOqNd+JQb11QjhmZvW+mLIV92tN4t1+Ka0VOE/jJw7Vn3q
	4tRbAAd7Q0RL+fN/9HOfqECySawcDdwSVfpPQZECSiAoIEOQz4OurLUsLyoHEQrxTUioLha0ER0
	5yvYQnglftdZpKWrhbapGUkn5GPYR+sYyD2xTCiJvKS1XFOdV7hQusk8JnIoBT41/fkHAB1ZVZz
	7A=
X-Received: by 2002:a17:906:df09:b0:be2:d66:eb21 with SMTP id a640c23a62f3a-be20d66f9e0mr41406366b.26.1779705091644;
        Mon, 25 May 2026 03:31:31 -0700 (PDT)
Message-ID: <021315b7-7ac3-4cf3-8089-2de244b64de5@gmail.com>
Date: Mon, 25 May 2026 12:31:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] xen/common: llc-coloring parser fixes
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 Luca Miccio <luca.miccio@amd.com>, Mykola Kvach <mykola_kvach@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1779388510.git.mykola_kvach@epam.com>
 <1524b146-cb05-441b-a055-ce3337d83b44@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1524b146-cb05-441b-a055-ce3337d83b44@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1779705092-AFD51FF4-A9685F57/10/73395122804
X-purgate-type: spam
X-purgate-size: 219
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,m:luca.miccio@amd.com,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.950];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EA5305C942B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/26 12:06 PM, Orzel, Michal wrote:
> CC: Oleksii
> 
> @Oleksii, can we ask for your release ack for this series?

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

