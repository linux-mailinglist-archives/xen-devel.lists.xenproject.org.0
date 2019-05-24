Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4059829DD3
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 20:15:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUEf6-00071n-SU; Fri, 24 May 2019 18:11:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VGqG=TY=gmail.com=pgnet.dev@srs-us1.protection.inumbo.net>)
 id 1hUCCh-0001lN-LM
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 15:33:55 +0000
X-Inumbo-ID: 56a93478-7e39-11e9-8980-bc764e045a96
Received: from mail-pg1-x532.google.com (unknown [2607:f8b0:4864:20::532])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 56a93478-7e39-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 15:33:54 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id w22so5252983pgi.6
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2019 08:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wZNSajLPgan4vVSU7fR0JGheSOLa3SIsdJIB+VlyoLk=;
 b=HN8VUZzSgQGnOTAxUvE6kMCulFB7KVvtj3L+4fMSmjfBW/K76roCyfyWZAFybNdQYz
 deDeVo7gSYJuMdwWImTXhkYZeha8yj/ixLGXxqVApKYf4qe1u8lTSZeyHdG8HZUVifPk
 lRv30/U88YkYST/4o6XBAMCY3PgUHACBqQ32GLNquSaARknrQZfxOm0wax98+UJSb+tQ
 jLakcSMFnimuTn3sAEk9jNUqfLYPReB0h27VVI9i5oe8UYwaX/s0UEoowtvHTcNtTht9
 qbdNFuJYAG4QipYHmJ2lU2lmfsWlRWPQFENPG+fVaoKk+kVeQ8MfPpQ25aXml653TI/W
 xR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:from:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wZNSajLPgan4vVSU7fR0JGheSOLa3SIsdJIB+VlyoLk=;
 b=KpD23aWvxZbPaUiXl9esjo0Fjsz35JwAr4irmxnrccfNr1Rx6evp57TM/1uAA5s1BM
 IIzFSAWY1siPDF7QTw6UMJdipHw00LX4qXV6u71XwncMdVtqZRgAoRQMmCOv/7A4xD/L
 WxWipRsfanq7/SCEJurfEZfNlNrx8Vwaq3R2qw2Ijlb3XhnWPF4BDcKu9R9RBMoYQh5q
 zdLkgTKfHrpG/DPxXo3gUQRlMVlAQBiZg/aCZI6SSfMSkaLENf0cj0lBV7WRd2qDsfOt
 0Ns5smBoe+UVDq4DD3JSs4JURIAz8Hc2XXWMMyedKFNPpAZ7NgXjjnh7iJo/QAXkK11U
 VlPg==
X-Gm-Message-State: APjAAAXLi6LP2Yue9qFdZOp9NPS0xMfG34ZpDAwAYc2M3NarVgxb+3yT
 UbUsKP6RZ0JWOm/ojFw19VY=
X-Google-Smtp-Source: APXvYqzl8udsKlqs55kNAkCvkExNgknk4Nv+aBDTEPIHmZv5oI6MFsHSFiXkVndvc8MI275WSX9MTg==
X-Received: by 2002:a62:2506:: with SMTP id l6mr112622260pfl.250.1558712033869; 
 Fri, 24 May 2019 08:33:53 -0700 (PDT)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net.
 [99.7.172.215])
 by smtp.gmail.com with ESMTPSA id h14sm2457289pgj.8.2019.05.24.08.33.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 08:33:52 -0700 (PDT)
From: PGNet Dev <pgnet.dev@gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@FreeBSD.org>
References: <21708669-ac14-d8f8-d513-a7e745c65861@gmail.com>
 <20190416105043.nbvx522kqy3p3svx@Air-de-Roger.citrite.net>
 <20190417120518.63ulfqksrx37ver5@Air-de-Roger.citrite.net>
 <c000684c-d930-6557-a35f-d76b94b296b7@gmail.com>
 <ab29f7ca-9653-ae48-4de7-86a73e0bc7c2@gmail.com>
 <20190418125228.yjjgj7qzzxqbhf3k@Air-de-Roger.citrite.net>
 <c41ced7d-f1c4-a4a9-e2bf-aa5b0caeced6@gmail.com>
Message-ID: <dc5536b9-97e0-55a5-7ada-474910d7ae9b@gmail.com>
Date: Fri, 24 May 2019 08:33:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c41ced7d-f1c4-a4a9-e2bf-aa5b0caeced6@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 24 May 2019 18:11:23 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWZ0ZXIgdXBncmFkaW5nIEtlcm5lbCB0byA1LjEuNC9yZWxlYXNlIG9uIGFuIHg4Nl82NCBzZXJ2
ZXIsIFhlbiA0LjEyLjAgRG9tMCBzdWNjZXNzZnVsbHkgYm9vdHMgaW4gUFZIIG1vZGUgKGRvbTA9
cHZoIC4uLiksIHdpdGggZWZpIHZhcnMgYXZhaWxhYmxlIHNvIHRoYXQgZWZpYm9vdG1nciBmdW5j
dGlvbnMsCgoJeGwgbGlzdAoJCU5hbWUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgSUQgICBNZW0gVkNQVXMgICAgICBTdGF0ZSAgIFRpbWUocykKCQlEb21haW4tMCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwICA0MDE1ICAgICA0ICAgICByLS0tLS0g
ICAgIDg0Ny42CgkJWGVuc3RvcmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
MSAgICAzMSAgICAgMSAgICAgLWItLS0tICAgICAgIDAuMAoKCWRtZXNnIHwgZ3JlcCAtaSBwdmgK
CQlbICAgIDAuMTgxOTczXSBCb290aW5nIHBhcmF2aXJ0dWFsaXplZCBrZXJuZWwgb24gWGVuIFBW
SAoKCWVmaWJvb3RtZ3IKCQlCb290Q3VycmVudDogMDAwMAoJCVRpbWVvdXQ6IDEgc2Vjb25kcwoJ
CUJvb3RPcmRlcjogMDAwMCwwMDAyLDAwMDMKCQlCb290MDAwMCogeGVuc3ZyIEhEKDIsR1BULDk3
MTEyNTVlLWQxMWQtMzFjNS04OGZlLTFlMTY0ZDRkNGM5NSwweDEwMDAsMHg5NjAwMCkvRmlsZShc
RUZJXE9QRU5TVVNFXEdSVUJYNjQuRUZJKQoJCUJvb3QwMDAyKiBVRUZJIE9TICAgICAgIEhEKDIs
R1BULDk3MTEyNTVlLWQxMWQtMzFjNS04OGZlLTFlMTY0ZDRkNGM5NSwweDEwMDAsMHg5NjAwMCkv
RmlsZShcRUZJXEJPT1RcQk9PVFg2NC5FRkkpLi5CTwoJCUJvb3QwMDAzKiBVRUZJOiBCdWlsdC1p
biBFRkkgU2hlbGwgICAgICBWZW5NZWRpYSg1MTI2YzhkYy1lNmE0LWIzZTktYTExOS1jZjQxMzQ1
Yzk3NTQpLi5CTwoKRnJvbQoKCWh0dHBzOi8veGVucHJvamVjdC5vcmcvMjAxOC8wNy8xMC94ZW4t
cHJvamVjdC1oeXBlcnZpc29yLTQtMTEtYnJpbmdzLWNsZWFuZXItYXJjaGl0ZWN0dXJlLXRvLWh5
cGVydmlzb3ItY29yZS10ZWNobm9sb2dpZXMvCgpJIHVuZGVyc3RhbmQgdGhhdCBQVkggRG9tMCAq
cmVtb3ZlcyogcWVtdSBkZXBlbmRlbmN5LAoKCSJQVkggRG9tMCBSZWR1Y2VzIHRoZSBBdHRhY2sg
U3VyZmFjZSBvZiBYZW4gUHJvamVjdCBCYXNlZCBTeXN0ZW1zCgoJUFZIIGNvbWJpbmVzIHRoZSBi
ZXN0IG9mIFBWIGFuZCBIVk0gbW9kZSB0byBzaW1wbGlmeSB0aGUgaW50ZXJmYWNlIGJldHdlZW4g
b3BlcmF0aW5nIHN5c3RlbXMgd2l0aCBYZW4gUHJvamVjdCBTdXBwb3J0IGFuZCB0aGUgWGVuIFBy
b2plY3QgSHlwZXJ2aXNvciBhbmQgdG8gcmVkdWNlIHRoZSBhdHRhY2sgc3VyZmFjZSBvZiBYZW4g
UHJvamVjdCBTb2Z0d2FyZS4gUFZIIGd1ZXN0cyBhcmUgbGlnaHR3ZWlnaHQgSFZNIGd1ZXN0cyB0
aGF0IHVzZSBoYXJkd2FyZSB2aXJ0dWFsaXphdGlvbiBzdXBwb3J0IGZvciBtZW1vcnkgYW5kIHBy
aXZpbGVnZWQgaW5zdHJ1Y3Rpb25zLiBQVkggZG9lcyBub3QgcmVxdWlyZSBRRU1VLgoKCVhlbiBQ
cm9qZWN0IDQuMTEgYWRkcyBleHBlcmltZW50YWwgUFZIIERvbTAgc3VwcG9ydCBieSBjYWxsaW5n
IFhlbiB2aWEgZG9tMD1wdmggb24gdGhlIGNvbW1hbmQgbGluZS4gUnVubmluZyBhIFBWSCBEb20w
IHJlbW92ZXMgYXBwcm94aW1hdGVseSAxIG1pbGxpb24gbGluZXMgb2YgUUVNVSBjb2RlIGZyb20g
WGVuIFByb2plY3TigJlzIGNvbXB1dGluZyBiYXNlIHNocmlua2luZyB0aGUgYXR0YWNrIHN1cmZh
Y2Ugb2YgWGVuIFByb2plY3QgYmFzZWQgc3lzdGVtcy4iCgpDaGVja2luZywgcWVtdSBpcyBzdGls
bCByZXNpZGVudCwKCglwcyBheCB8IGdyZXAgcWVtdQoJCTE4OTUgPyAgICAgICAgU2wgICAgIDA6
MDAgL3Vzci9iaW4vcWVtdS1zeXN0ZW0taTM4NiAteGVuLWRvbWlkIDAgLXhlbi1hdHRhY2ggLW5h
bWUgZG9tMCAtbm9ncmFwaGljIC1NIHhlbnB2IC1kYWVtb25pemUgLW1vbml0b3IgL2Rldi9udWxs
IC1zZXJpYWwgL2Rldi9udWxsIC1wYXJhbGxlbCAvZGV2L251bGwgLW5vZGVmYXVsdHMgLW5vLXVz
ZXItY29uZmlnIC1waWRmaWxlIC92YXIvcnVuL3hlbi9xZW11LWRvbTAucGlkCgpJcyB0aGlzIHN0
aWxsIGV4cGVjdGVkPwoKSWYgc28sIHdoeSB0aGUgKmkzODYqIHZhcmlhbnQsIG5vdCAvdXNyL2Jp
bi9xZW11LXN5c3RlbS14ODZfNjQ/CgpJZiBub3QsIGlzIHRoZXJlIHNvbWUgYWRkaXRpb25hbCBj
b25maWcgcmVxdWlyZWQgdG8gZGlzYWJsZSBpdHMgdXNlIGhlcmU/CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
