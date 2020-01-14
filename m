Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781BE13B0AC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:18:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irPnj-0000Io-Ac; Tue, 14 Jan 2020 17:16:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irPnh-0000Ij-U5
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:16:21 +0000
X-Inumbo-ID: 908e2ca0-36f1-11ea-ac27-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 908e2ca0-36f1-11ea-ac27-bc764e2007e4;
 Tue, 14 Jan 2020 17:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579022173;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ccqBj4mfnvhTlm7pAIADfzI8vcMSzGUlvAiswO3YubI=;
 b=NfYUk8+llPSaf4kbkaGhkc/4SFpmvUoMcC+lOy4mlz8jZ1IxfhXsU+iY
 CkApEkCHdSvH7b9TI4qAN3bqA/w9qJy/vPgXFAcuxYn5jTF/Htka3NYSX
 FzSVf8vFK/C9rlkYo2iOAkyLWYCwTUAQq7QVY04DCWJ+rO2daopaCS1wi I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JF9gilP6NwvY2lly+8QbbvAiLnSBdOd2eskdvGLkQVXDX6SQiERbmv76M4dvbf79H9eP0xcMfM
 H1NaEzbbeSTITHWOT9YpNPhwzDAi3fi4tAAcE+PJ2wNHaOVS8HyaSYRIfXhhCNsGxme7mAumyu
 uqD1bDVzqMp4Dg3V0lkekU1VOUIbfIjSDbo/Sdk6/4F12d+LBnI7r+0CaVKGvITuKznMPkIXeK
 IKp9+bkTxQ4HWnsv7P8pJB7UM1RfNjggGMKaXFlBNog/A1acePMHzFjDoLqtDxkEmFKID7eYHd
 6ok=
X-SBRS: 2.7
X-MesageID: 11491703
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="11491703"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.63322.171444.461140@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 17:16:10 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191224151932.6304-12-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-12-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH 11/12] libxc/restore: Handle X86_{CPUID,
 MSR}_DATA records
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMTEvMTJdIGxpYnhjL3Jlc3RvcmU6IEhhbmRs
ZSBYODZfe0NQVUlELE1TUn1fREFUQSByZWNvcmRzIik6Cj4gRm9yIG5vdywgdGhlIGRhdGEgYXJl
IGp1c3Qgc3Rhc2hlZCwgYW5kIGRpc2NhcmRlZCBhdCB0aGUgZW5kLiAgVGhpcyB3aWxsCj4gYmUg
YWRkcmVzc2VkIHdoZW4gdGhlIFRPRE8gaW4geDg2X3N0YXRpY19kYXRhX2NvbXBsZXRlKCkgaXMg
YWRkcmVzc2VkLgo+IAo+IE5vIHByYWN0aWNhbCBjaGFuZ2UgdG8gYmVoYXZpb3VyIC0gdGhpcyBp
cyBhbGwgcGx1bWJpbmcgd29yay4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
