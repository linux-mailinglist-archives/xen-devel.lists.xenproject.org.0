Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5CE587DE3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 16:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379375.612783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIsXs-0004P8-2O; Tue, 02 Aug 2022 14:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379375.612783; Tue, 02 Aug 2022 14:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIsXr-0004MQ-Vx; Tue, 02 Aug 2022 14:06:51 +0000
Received: by outflank-mailman (input) for mailman id 379375;
 Tue, 02 Aug 2022 14:06:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7Wv=YG=kolabnow.com=brunoce@srs-se1.protection.inumbo.net>)
 id 1oIsXr-0004MK-CT
 for Xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 14:06:51 +0000
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a2f8fe1-126c-11ed-924f-1f966e50362f;
 Tue, 02 Aug 2022 16:06:50 +0200 (CEST)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id C15FA171C
 for <Xen-devel@lists.xenproject.org>; Tue,  2 Aug 2022 16:06:48 +0200 (CEST)
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXMYdj0ytXwi for <Xen-devel@lists.xenproject.org>;
 Tue,  2 Aug 2022 16:06:48 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
 by mx.kolabnow.com (Postfix) with ESMTPS id CC00B45A
 for <Xen-devel@lists.xenproject.org>; Tue,  2 Aug 2022 16:06:47 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
 by int-mx001.mykolab.com (Postfix) with ESMTPS id 94D22C4D
 for <Xen-devel@lists.xenproject.org>; Tue,  2 Aug 2022 16:06:47 +0200 (CEST)
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
X-Inumbo-ID: 5a2f8fe1-126c-11ed-924f-1f966e50362f
Authentication-Results: ext-mx-out002.mykolab.com (amavisd-new);
	dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
	header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
	message-id:subject:subject:date:date:mime-version:from:from
	:content-transfer-encoding:content-type:content-type:received
	:received:received; s=dkim20160331; t=1659449208; x=1661263609;
	 bh=SSkDmv9yFltTBSZ6Bp/nqa3BLv5L6Y32jKUVFzFwz9Q=; b=3aBHee21r3sj
	GMLn/FQGQ8rpkUGiBhUpjYSOjwX5Y4bxZ2Kte5zDgcQy+92LVpoD9ZwqRSAbUe9t
	/OGt9evDIgyz6nN93PEPsFXXNBaCabpQgoIAoewUbw0/GOiSW2fwRk00gKICE0Xt
	hZ2ei7YGNF+JcfpwuUHwTBYaLvZK67N7fR4KCAED2VO4v/sjPdcFUPXI9WXBaiYD
	13rnA7WpqubRnke6lVMzV3UaoehfQ8c9jrZ2Z5fPdNJFRzzV6Ee3k3rQeQigpx8H
	zUkZpr2B+8qPQhXLiDP3Ebqsvds8ZgX3/i2AhjOVlCiZusHtNub6TfKvR3rJP+6w
	V+lneQVqKKDjqS1Zdgi8+cgEvTAVGYnQpJxeq6nhqjmWXgrKLo++D0wCcTwGY6db
	BMuKQP6aXuw6J0hkgykzREz4PrcWO0DgsgH8yYgQvmL56a6tr9z3+yT3ljq6oqNN
	6JT4FGbMCEfb+tRQVlS28ohst0vvrgSE2DFLJvriahSkorS0vmvOFJZZ0MVxZLhO
	pmzasMfIf2xQoqRu8t7dBKv3x8XNwr23GiX0pgY0firaA4pwi9OeztE5V0WFauze
	hA2GMpUCSxd+Ahvkue35tzvn4Kvo/yGshxhKf2XjAGPG9EpvjrW9qPiF6d2JLdSk
	A6b61z4HCrHi2uvDMiocFcpystcHF0Q=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
X-Spam-Status: No, score=-1.898 tagged_above=-10 required=5
	tests=[BAYES_00=-1.9, HTML_MESSAGE=0.001, MIME_QP_LONG_LINE=0.001]
	autolearn=ham autolearn_force=no
Content-Type: multipart/alternative; boundary=Apple-Mail-848B3C4E-E5DC-4337-ACD2-40ACA98765F8
Content-Transfer-Encoding: 7bit
From: Bruno <brunoce@kolabnow.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 2 Aug 2022 15:06:45 +0100
Subject: Acer Aspire 5 A517-52G - No firmware ACIP and no boot
Message-Id: <7331DC21-5ADC-4785-B663-742C53710C2A@kolabnow.com>
To: Xen-devel@lists.xenproject.org


--Apple-Mail-848B3C4E-E5DC-4337-ACD2-40ACA98765F8
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello Xen-Devel.

I would like to report no compatible firmware for a new laptop Acer Aspire 5=
 A517-52G.

The firmware problem I witness is ACIP errors. Xen does not boot.

These ACIP errors lead to boot into initramfs without mounting storage capab=
ilities.

There is extensive logs, dmesg and attempts I recently send to Xen-Users and=
 got a lot of help and feedback there on a long thread of attempts, but we h=
ave hit a lack of support at this point.

https://lists.xenproject.org/archives/html/xen-users/2022-07/msg00061.html

Can we please have an update to allow this hardware to run Xen.

Kind regards,

Bruno Schroeder=20




--Apple-Mail-848B3C4E-E5DC-4337-ACD2-40ACA98765F8
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hello Xen-Devel.<div dir=3D"ltr"></div><div=
><br></div><div>I would like to report no compatible firmware for a new lapt=
op Acer Aspire 5 A517-52G.</div><div><br></div><div>The firmware problem I w=
itness is ACIP errors. Xen does not boot.</div><div><br></div><div>These ACI=
P errors lead to boot into initramfs without mounting storage capabilities.<=
/div><div><br></div><div>There is extensive logs, dmesg and attempts I recen=
tly send to Xen-Users and got a lot of help and feedback there on a long thr=
ead of attempts, but we have hit a lack of support at this point.</div><div>=
<br></div><div><a href=3D"https://lists.xenproject.org/archives/html/xen-use=
rs/2022-07/msg00061.html">https://lists.xenproject.org/archives/html/xen-use=
rs/2022-07/msg00061.html</a></div><div><br></div><div>Can we please have an u=
pdate to allow this hardware to run Xen.</div><div><br></div><div>Kind regar=
ds,</div><div><br></div><div>Bruno Schroeder&nbsp;</div><div><br></div><div>=
<br></div><div><br></div></body></html>=

--Apple-Mail-848B3C4E-E5DC-4337-ACD2-40ACA98765F8--

