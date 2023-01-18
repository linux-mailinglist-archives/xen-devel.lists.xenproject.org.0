Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68D671A90
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 12:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480518.744984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6d4-0002pW-Kw; Wed, 18 Jan 2023 11:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480518.744984; Wed, 18 Jan 2023 11:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6d4-0002ne-I7; Wed, 18 Jan 2023 11:29:18 +0000
Received: by outflank-mailman (input) for mailman id 480518;
 Wed, 18 Jan 2023 11:29:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Njh=5P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pI6d3-0002nV-0R
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 11:29:17 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5718229a-9723-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 12:29:16 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso1171857wmc.4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jan 2023 03:29:16 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 az22-20020adfe196000000b002bddaea7a0bsm15168213wrb.57.2023.01.18.03.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 03:29:14 -0800 (PST)
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
X-Inumbo-ID: 5718229a-9723-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qEV92wfwdsO0B1tLELn1ll5CtfMZ7h/ID1HNqTwBTNk=;
        b=Ry7CEBuLJsOBpq3zLak71M18QxVBjWnKe7nkY5XJPt6jUb35DlRGb0kv0Hnu18/frh
         dsmE7+ere3gEQlohlBtSgUMbwup34/mTqzail17i9d1O1+LzP8kdF6iDCP7a/LvITqES
         2oWCGPt7Io6c9g5+zgMg6ACIIv4Bl6sTT79veXYY32jAypZArmeW8VB6DNMNbwLglq/K
         5goZvXU+dJ3veWvB4aK64x1SFaZJyYb8aP7viC2QW2jwm/iMtG8b6kdrWIR1wTn0iecQ
         hnsbYwEnkcDbjqj9RTJZkLcLRpTpMk/OBHijwk0YpPWgpvDDlI/sCHE+uTiZFg8EBhP1
         x8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEV92wfwdsO0B1tLELn1ll5CtfMZ7h/ID1HNqTwBTNk=;
        b=famFdYIhxXP/6hhF1M68+j5LMGttPDHEO9n8ZFpmTTR0c1YtIZeOt/uUr1BvOX46+M
         n32dOdFnund7Ti/Tyj7D5+6CW/hmF0S/BdBmhGi9dbSdb/5xSeixuxWpOu2RuxImv5It
         wCK1wAeLEiFt1GXAKSDC2jEPR8Y6RosV9wmrX9FJ6xfHMnfKcRkqJTbMQVZohydy8bLx
         Z3rd0elkY0LlMaWcc3e6/LpMxAochBM4vZTthxnBmMUDiq/kkWVJAzPdxrVyktytDGcK
         +mLcFkcRvbn2EDvdnshJL2sPvmiF8VTK72EfdETWCFx9nTl9a4gy8MTFPEMVZp5/HN1i
         tKjQ==
X-Gm-Message-State: AFqh2kqvfVIKH4K6UZOUHp2WDdp8CAxGc/tWPVGF5yASfmdQLQWVpYY+
	/lLFGK/FcIFlOnnzIPvd6yU=
X-Google-Smtp-Source: AMrXdXsemPLV/JCeNTgzBZrHgiZpi5btTEVvLY9haEZVF3meE9elI/rJnif/2MJEW9iFff0yVWTV/w==
X-Received: by 2002:a05:600c:3c8a:b0:3da:2a78:d7a4 with SMTP id bg10-20020a05600c3c8a00b003da2a78d7a4mr6220743wmb.21.1674041355631;
        Wed, 18 Jan 2023 03:29:15 -0800 (PST)
Message-ID: <bdb3f2f5df270b081fa44eac9e1f6347e694ca0d.camel@gmail.com>
Subject: Re: [PATCH v4 2/4] xen/riscv: introduce sbi call to putchar to
 console
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>,  Gianluca Guida <gianluca@rivosinc.com>, Bobby
 Eshleman <bobby.eshleman@gmail.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Date: Wed, 18 Jan 2023 13:29:14 +0200
In-Reply-To: <e5e38496-3dcd-3a42-6c2a-43ccb988caf3@suse.com>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
	 <06ad9f6c8cbc87284ef4ecd4b85d9c7df33bd2c1.1673877778.git.oleksii.kurochko@gmail.com>
	 <7918f456-14ff-77b2-3cdb-1e879e030b39@citrix.com>
	 <e5e38496-3dcd-3a42-6c2a-43ccb988caf3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

T24gV2VkLCAyMDIzLTAxLTE4IGF0IDA4OjM4ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAxOC4wMS4yMDIzIDAwOjMyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4gT24gMTYvMDEvMjAy
MyAyOjM5IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gPiArc3RydWN0IHNiaXJldCBz
YmlfZWNhbGwodW5zaWduZWQgbG9uZyBleHQsIHVuc2lnbmVkIGxvbmcgZmlkLAo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25n
IGFyZzAsIHVuc2lnbmVkIGxvbmcgYXJnMSwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBhcmcyLCB1bnNpZ25lZCBsb25n
IGFyZzMsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHVuc2lnbmVkIGxvbmcgYXJnNCwgdW5zaWduZWQgbG9uZyBhcmc1KQo+ID4gPiArewo+ID4g
PiArwqDCoMKgIHN0cnVjdCBzYmlyZXQgcmV0Owo+ID4gPiArCj4gPiA+ICvCoMKgwqAgcmVnaXN0
ZXIgdW5zaWduZWQgbG9uZyBhMCBhc20gKCJhMCIpID0gYXJnMDsKPiA+ID4gK8KgwqDCoCByZWdp
c3RlciB1bnNpZ25lZCBsb25nIGExIGFzbSAoImExIikgPSBhcmcxOwo+ID4gPiArwqDCoMKgIHJl
Z2lzdGVyIHVuc2lnbmVkIGxvbmcgYTIgYXNtICgiYTIiKSA9IGFyZzI7Cj4gPiA+ICvCoMKgwqAg
cmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBhMyBhc20gKCJhMyIpID0gYXJnMzsKPiA+ID4gK8KgwqDC
oCByZWdpc3RlciB1bnNpZ25lZCBsb25nIGE0IGFzbSAoImE0IikgPSBhcmc0Owo+ID4gPiArwqDC
oMKgIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgYTUgYXNtICgiYTUiKSA9IGFyZzU7Cj4gPiA+ICvC
oMKgwqAgcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBhNiBhc20gKCJhNiIpID0gZmlkOwo+ID4gPiAr
wqDCoMKgIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgYTcgYXNtICgiYTciKSA9IGV4dDsKPiA+ID4g
Kwo+ID4gPiArwqDCoMKgIGFzbSB2b2xhdGlsZSAoImVjYWxsIgo+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgOiAiK3IiIChhMCksICIrciIgKGExKQo+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgOiAiciIgKGEyKSwgInIiIChhMyksICJyIiAoYTQpLCAiciIgKGE1KSwg
InIiCj4gPiA+IChhNiksICJyIiAoYTcpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA6ICJtZW1vcnkiKTsKPiA+IAo+ID4gSW5kZW50YXRpb24uwqAgRWFjaCBjb2xvbiB3YW50cyA0
IG1vcmUgc3BhY2VzIGluIGZyb250IG9mIGl0Lgo+IAo+IFBsdXMsIGlmIHdlJ3JlIGFscmVhZHkg
dGFsa2luZyBvZiBzdHlsZSwgYmxhbmtzIGFyZSBtaXNzaW5nCj4gaW1tZWRpYXRlbHkgaW5zaWRl
Cj4gdGhlIG91dGVybW9zdCBwYXJlbnRoZXNlcywgcmVxdWlyaW5nIHlldCBvbmUgbW9yZSBzcGFj
ZSBvZgo+IGluZGVudGF0aW9uIG9uIHRoZQo+IHN1YnNlcXVlbnQgbGluZXMuCj4gClRoYW5rcyBB
bmRyZXcgYW5kIEphbiBmb3IgdGhlIGNvbW1lbnRzLiBJJ2xsIHRha2UgdGhlbSBpbnRvIGFjY291
bnQuCj4gSmFuCj4gCgo=


