Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2C5B13E2B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 17:25:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061695.1427277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugPiq-0004En-0h; Mon, 28 Jul 2025 15:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061695.1427277; Mon, 28 Jul 2025 15:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugPip-0004Cq-UE; Mon, 28 Jul 2025 15:25:03 +0000
Received: by outflank-mailman (input) for mailman id 1061695;
 Mon, 28 Jul 2025 15:25:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44Jj=2J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ugPip-0004Ck-4l
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 15:25:03 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07be580b-6bc7-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 17:25:02 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b78d13bf10so209372f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 08:25:02 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b78813ab93sm4212778f8f.4.2025.07.28.08.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 08:25:01 -0700 (PDT)
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
X-Inumbo-ID: 07be580b-6bc7-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753716301; x=1754321101; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K6iyXFrXaz09QZOpunxONmeHh6w/EvGdc7BmZdh5vNg=;
        b=QEtvSXJ0FGKJbZlR2CnQG2yQr+7A25YYI7VrNDuNPbMqNEsYWc0ZRVTYHmMP9HQBGM
         Q/ELnyi4h09IcEPzQUA3wu5HdcxbGjZ75fKmzmv6Ywx5DnOewWbjvAwQHyHm5dyT2iYw
         KtbI4tMApdy7iPaIZZmswBeObKuX4oHq3gk+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753716301; x=1754321101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6iyXFrXaz09QZOpunxONmeHh6w/EvGdc7BmZdh5vNg=;
        b=dyXcAIH2lGHazDA5uRct8HGcown0LACcyHhE1PA1oXIOlfP3UHXoFmthrXEAO+c4YB
         pNWSlDbWmDJ8/LSFsPuN67tElfN+zKTo+j+WYY5B4tHpGw9Ga6h5EwqiGgQLiUpFyXJl
         JoT30Wj3GulCQMz5kdU7QTfORrHwRpxxxDu1RN3GyotxlHg3MUdhv9RemxG1AMW1A+fM
         +m5MbpCddQ/x9GfwgBfQLfVJii2nwuHLM38c/vv2SAmuI/kv77EZqp5hSQJjSVL/7VK3
         slDdTpM1y3m2vsmF8Jn3AuQZ/0p5I+O5+wPh4imXhFGy1gRc6923QYkPuR0yI/BscvUE
         6DSQ==
X-Gm-Message-State: AOJu0YzKBZW53TGL0aY+rFSfvqdCDlOm8Ygcr/fTx9Ysqj25WhnAcM0Q
	iGTxVzKNPU3S5Dcw0vVndss2ESURq93ZVoQK2DUkkJq5voKiCc5p7lW8nh/Kjp6b+C0=
X-Gm-Gg: ASbGncvDHKzFWLZhj6jpi5JXxGiH0IK+Pjzx5maz6ghbt918AXbPaae1iHSJxG2XuSk
	mwKCsJ8nZD1JPgQmoWLV8tE3XyAbR7rsX/j3zO52B+hLfvUXJfDbPfqamxS+05rO1+2RrHyA0x3
	dpwtq+wiC+2rKtqhPnDg0eliNbCwhIE5BlwisjBE13cFlZb7A3ToV9jSnrnorTy9G+iPkPjxhVq
	HL5uSBLWvNjpgq9ejLg7pSA/c33tvO1wLBTC/mtz48r6JHHw6bDgJMnU1BsDy1JMt1lh9YYtAfV
	yeZsmgOHvosE13hl47BBRyQlFuTOV8/wFfJMjOOKmMHNqydus6fiaUGZ4dmHIbT97bUfxveiQGw
	kE+IucYn9M7WtAchf9dxSkkyjP9UBrHIES3O9OH6/sGtAvCJ9lkXEJVQJZk5d12MZvQ==
X-Google-Smtp-Source: AGHT+IEPYzX3usa+pcKiV9PFs5QhgiaXAC+m8nlIQGZqY9//itlJmo7Q12DGoosYn+ciDCdCRuz0PQ==
X-Received: by 2002:a05:6000:288f:b0:3a4:ef33:e60 with SMTP id ffacd0b85a97d-3b776781b1amr8293704f8f.40.1753716301501;
        Mon, 28 Jul 2025 08:25:01 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:25:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/rangeset: fix typo in comment
Message-ID: <aIeWTNM21dme8Dgn@macbook.local>
References: <20250728125036.41305-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728125036.41305-1-frediano.ziglio@cloud.com>

On Mon, Jul 28, 2025 at 01:50:33PM +0100, Frediano Ziglio wrote:
> Fixes: fc41b5c1fdbe ("Extend the range abstraction"...)
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

