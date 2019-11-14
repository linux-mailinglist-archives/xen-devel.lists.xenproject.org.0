Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F70EFCA07
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 16:37:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVH8p-00063V-TL; Thu, 14 Nov 2019 15:34:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=isnB=ZG=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVH8o-00063O-3X
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 15:34:38 +0000
X-Inumbo-ID: 43c37b1e-06f4-11ea-9631-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43c37b1e-06f4-11ea-9631-bc764e2007e4;
 Thu, 14 Nov 2019 15:34:37 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j14so5394315lfb.8
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2019 07:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sxioVmteUu+KvWTX5OYi+qZsGZgrL5o/ex1pyJBIrOI=;
 b=P6OiQwD+8XWkGdNiHZxwH8xUGW0/TLMRi4gmNTE5TVGC5SUUV0Zvuh94vUrh+nzT9G
 8gA3txvxVeDVjGgCFv00usOWtgqY+pvlFUJLdjGyyhikbAWSbGwcxs72brbzi4/0ubDo
 z4IWuj4r48ZRVx5acz/zYjegpePCIAjMHwcHqbSsZlg4MHmm+VUC1K0YmYovp88wTth7
 FbwfU3SznbkfRuhOeAs5vKoXEmq8pHuPGrVrlrQQz+NAi8YBLv2KY0hjUKkaHnGdK/zV
 ZC6kt+Azi+Rr5pDXNyfXb5huv5U3kNn21vEFSUjtiP0F7ISDnJleOMDpVD/VNojANsHq
 5Cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sxioVmteUu+KvWTX5OYi+qZsGZgrL5o/ex1pyJBIrOI=;
 b=NVJE4EsGRfA/j6sJfsXISwe7Mi+NK+Pl2wp/cC3ppAIPlijTinyrZN6dQnwD+eRF/s
 H6xxTfKwhJQunZz+hZKd8C3JNxupyrE2N1hOvY/62NChAWMEJsyHtDeMwgwzCIUbk8pP
 iY+4+UWJEWMsPMfNLFbHcMd9orhE8wIslDC0VYXbkvw8Ub9Njc7x3K4ATxcYcPpRTcBl
 bd1JkzqHxftDLFrONZQ1KjllU7kZcP0fZMui6bxD3fAgbmDzAUHwv4xww/yOQn9lpWkR
 OMHbmwecoCJ5DpZZkpLB+9PfmcDyTKnnMP1Ol8aolNSTs+GOrMEhQZPbdJkS6HHeb12T
 8LRA==
X-Gm-Message-State: APjAAAX+AmY/QTaJaEyeA0Ji7jXGYJU8o5DwSQPcyRsGsCCgi5lXAwzE
 +GlYJg30tpszjOLNuMSsaliG3WSLoz5ghET40f8=
X-Google-Smtp-Source: APXvYqywpVtYz/bZaWvHK1fPtWCh3euiyGfjd9qz6CDSCeUYbkIlGoCgY7/dOSQt+3KV4S2NosHCz4zThZ5rFqIwKcQ=
X-Received: by 2002:a19:41c8:: with SMTP id o191mr7219590lfa.101.1573745676260; 
 Thu, 14 Nov 2019 07:34:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <c3740e59a9c5aecb69c9b075aab23d4a427c07bf.1570456846.git.rosbrookn@ainfosec.com>
 <6cdc3ae9-89cc-7128-3a30-0edd2f68fe34@citrix.com>
 <CAEBZRSf19GHHZBh2Uid=7QjYkktMUABiJiaX0jdEmKApT75t9g@mail.gmail.com>
 <36bbfd53-0876-8c0d-961c-ae8d0dea1cdd@citrix.com>
In-Reply-To: <36bbfd53-0876-8c0d-961c-ae8d0dea1cdd@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 14 Nov 2019 10:34:24 -0500
Message-ID: <CAEBZRSdPJK-X30udND9OaaZBtaHk-v9CKDCA0PMxRpje4cLjJA@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 08/24] golang/xenlight: define Mac builtin
 type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBTbyB0aGUgY29kZSB5b3UgaGF2ZSBpcyBwcm9iYWJseSBnb2luZyB0byBiZSBhYm91dCBlcXVh
bGx5IGVmZmljaWVudCBhbnl3YXkuCgpBIHF1aWNrIGJlbmNobWFyayBbMV0gc2hvd3M6Cgpnb29z
OiBsaW51eApnb2FyY2g6IGFtZDY0CkJlbmNobWFya1N0cmluZzEtOCAgICAgICAgNTAwMDAwMCAg
ICAgICAgICAgMjUxIG5zL29wCkJlbmNobWFya1N0cmluZzItOCAgICAgICAgNTAwMDAwMCAgICAg
ICAgICAgMjQ3IG5zL29wCgpTbyB5ZXMsIHRoZXkncmUgYWJvdXQgdGhlIHNhbWUgOikKCkknbGwg
bGVhdmUgaXQgYXMgaXMuCgotTlIKClsxXSBodHRwczovL3BsYXkuZ29sYW5nLm9yZy9wLzJjT3pC
cG9UZmdFCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
