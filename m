Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526A82B7C3
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 16:40:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVGki-0002oq-BZ; Mon, 27 May 2019 14:37:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uaDf=T3=gmail.com=pgnet.dev@srs-us1.protection.inumbo.net>)
 id 1hVGkh-0002ok-0O
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 14:37:27 +0000
X-Inumbo-ID: f1fc83a2-808c-11e9-8980-bc764e045a96
Received: from mail-pl1-x635.google.com (unknown [2607:f8b0:4864:20::635])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f1fc83a2-808c-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 14:37:25 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id g9so7114088plm.6
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2019 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pyPx9/X6OWs9ozwGU8sYI0AIIgpFV4hw7GL6xO1oIKU=;
 b=E0Lxd1UaQxowr27JjXHP4lNYifXZkfvG5n2h+QBxgZ9PhZqpLfWluoNUC2mB1NrwBe
 ssL2TIHQvrUXOyRhL8NZIw9rIwNrE6PnZjNWwMMMkavaKM7TTGTw8bC46GXn9/+qR8kr
 r71LQdeKHMO2/Dw8NKGey69OETJh/XmZkIbDFi1xFhZsSuky/Oe2fntrC2Q75LdjDwk2
 RluYDvW8OdlZ0EnTL3QtKdBUhkZeAgrx8vu2E6aJCEpixs/p9pqFZrfoOptOgP2061l3
 bl0I3utBt2zmCnCXW/H56JOA2OfZHnve1T8HCk92e1rO6bDdepxu34J5wdycwVI1kmPO
 svmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pyPx9/X6OWs9ozwGU8sYI0AIIgpFV4hw7GL6xO1oIKU=;
 b=eVgtY02Z3pTxdNUEKPzIO72QvIu0+tLclFrhTCXKMwOd22rdkXThYDc3zXMct/a6Dm
 RFPgnYg5pH9dHiquQYbJSpmfoREAq5/0LGsRKJqzi2TlKG4iqP23FIsfTQBC0VjKDHE2
 oUz4GBOxjraftJazdf7VzChDQL6USz2R9jSQs27+hC7MwUcyLNG4iQ5vbKtQOcrdRSTz
 5+AJGq7gdFkKE8U2JCoY02Fr1T0KT811MUw/vDeGmoq4pWrnRALI+/SSA7KEumopXUAA
 HiL6zTWRbJBWp2Wxy2RXlH6X8ZQS4gjC+e2JQhAiLx6CcYTIF+/hyhk2fcnPjIa625pA
 5Ejg==
X-Gm-Message-State: APjAAAUTT4Qkpmix0g9mU2fRsmGKTAlmu0MGD5R3FKnHkSHob8XE90Jv
 eIwh1L2vt8E5jGtqWQMgxrM=
X-Google-Smtp-Source: APXvYqyusoD31jWN5vdnE0uvkwpehBRjrtf0ndSvbItGhuoVdai/GeYIoVBEiSi/x87uZr8Tpc/igQ==
X-Received: by 2002:a17:902:e409:: with SMTP id
 ci9mr19158997plb.103.1558967845086; 
 Mon, 27 May 2019 07:37:25 -0700 (PDT)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net.
 [99.7.172.215])
 by smtp.gmail.com with ESMTPSA id c16sm12114896pfd.99.2019.05.27.07.37.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 07:37:24 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@FreeBSD.org>
References: <21708669-ac14-d8f8-d513-a7e745c65861@gmail.com>
 <20190416105043.nbvx522kqy3p3svx@Air-de-Roger.citrite.net>
 <20190417120518.63ulfqksrx37ver5@Air-de-Roger.citrite.net>
 <c000684c-d930-6557-a35f-d76b94b296b7@gmail.com>
 <ab29f7ca-9653-ae48-4de7-86a73e0bc7c2@gmail.com>
 <20190418125228.yjjgj7qzzxqbhf3k@Air-de-Roger.citrite.net>
 <c41ced7d-f1c4-a4a9-e2bf-aa5b0caeced6@gmail.com>
 <dc5536b9-97e0-55a5-7ada-474910d7ae9b@gmail.com>
 <20190527114101.37qnacubde6ud5bl@Air-de-Roger>
From: PGNet Dev <pgnet.dev@gmail.com>
Message-ID: <5b8b7332-044f-df46-64b4-1b93674ca627@gmail.com>
Date: Mon, 27 May 2019 07:37:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190527114101.37qnacubde6ud5bl@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.12.0 Dom0=pvh mode EFI variables 'not
 supported' after boot
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: pgnet.dev@gmail.com
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBMZXQncyBjbGFyaWZ5IHRoaXMgYSBiaXQ6CgphIHZlcnkgdXNlZnVsICYgY2xlYXIgcmVwbHkg
LS0gaWYgdGhhdCdzIGFsbCBpbiB0aGUgZG9jcy93aWtpIGFscmVhZHksIEkgCm1hbmFnZWQgdG8g
bWlzcyBpdCEKCnRoeCEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
