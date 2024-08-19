Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046D495692F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 13:18:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779507.1189263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg0Oy-00040X-Fa; Mon, 19 Aug 2024 11:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779507.1189263; Mon, 19 Aug 2024 11:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg0Oy-0003yI-Cc; Mon, 19 Aug 2024 11:18:20 +0000
Received: by outflank-mailman (input) for mailman id 779507;
 Mon, 19 Aug 2024 09:46:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ws91=PS=bounce.vates.tech=bounce-md_30504962.66c31482.v1-fc016af0e3024006b85150e2876adb8d@srs-se1.protection.inumbo.net>)
 id 1sfyyL-0002K1-AD
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 09:46:45 +0000
Received: from mail137-17.atl71.mandrillapp.com
 (mail137-17.atl71.mandrillapp.com [198.2.137.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f101b1e4-5e0f-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 11:46:44 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-17.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4WnSRQ3QlLzPm0Pmj
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 09:46:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fc016af0e3024006b85150e2876adb8d; Mon, 19 Aug 2024 09:46:42 +0000
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
X-Inumbo-ID: f101b1e4-5e0f-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724060802; x=1724321302;
	bh=G8elqKwHsG2cymVfWO0cd3BkZEw7znurCHPirnN0AOs=;
	h=From:Subject:Message-Id:To:Cc:Feedback-ID:Date:MIME-Version:
	 Content-Type:CC:Date:Subject:From;
	b=jWcy9rFgPHgd/7FgB5BNh8YfbrtcuZ6A81EVkArgJoA9mgC2gWeJVnghh1/67/Gdh
	 Z/Ybnb9QvmO5fSNo5gHr9KTGQD5lgI5R7Kp2NNdkCpKBN4XmDxDMt+PtwyFzNfXfPp
	 3BwjacBQ4FNa0OAQ0bXgHRerBDxBszci+mgth7tkF95GghRbZmy3IDr9MS9q8UdpW9
	 SFzoE6oTwaYFP1zfIpBNfim53hGg8Tyfns9jMUmgytnfJZhlkT2mMxLPsaowTFRJKb
	 zTuYvDeNq0eQB/TiPmpZ4iYZFfApYGHMqUMT0eolkNJDnSRuMy2xTiEwFWaL13jHLn
	 kPQH6nPuMY85w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724060802; x=1724321302; i=charles.schulz@vates.tech;
	bh=G8elqKwHsG2cymVfWO0cd3BkZEw7znurCHPirnN0AOs=;
	h=From:Subject:Message-Id:To:Cc:Feedback-ID:Date:MIME-Version:
	 Content-Type:CC:Date:Subject:From;
	b=tEGCzntCu3rGVlRtBFyXJgmGcWJvVAZl7tK9jahJrIvov6JdnIRiPl1R5Enck/u3z
	 aWIABDeKWxw7BAXjJY5Is7j8ymPaEWQ5+rch4fU9EY64tbABKpMfc/dExjli49p4Z3
	 1M5bfamOn1YPVAW480TSwdPo2VLC49KkgLCVS5hrnlcod1BliwYby8JInfrVWHdZAz
	 R0DKMgq5GajoCUgAQD37qTFZdzk6LW7bX4Zr7XvmWEWyT29h7p2yYYsaXimS/AczzK
	 SxJs0TZVKaWtxcLqvLckwrpv9lb7LhXYRPcO5lPT4+ruvmwPtq3gVJU7kPVCCJ6L4J
	 pKYgJN7dMD49Q==
From: "Charles-H. Schulz" <charles.schulz@vates.tech>
Subject: =?utf-8?Q?Setting=20up=20the=20Xen=20Communications=20Team?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724060798873
Message-Id: <e56ff82c1a1d7398a5b38784fc84a7adf51ec918.camel@vates.tech>
To: xen-devel <xen-devel@lists.xenproject.org>, Xen Project Advisory Board <advisory-board@lists.xenproject.org>
Cc: Kelly Choi <kelly.choi@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fc016af0e3024006b85150e2876adb8d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240819:md
Date: Mon, 19 Aug 2024 09:46:42 +0000
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="_av-3w5-efQcpESJEyXLgvX8Cw"

--_av-3w5-efQcpESJEyXLgvX8Cw
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Just like any major FOSS project, Xen needs to take care of its
messaging and communication. We are usually focused on software
development, however we'd like to take the opportunity to call on
whoever is interested here to join the small team in charge of
Communications.=C2=A0

We do not expect this to involve a large additional workload. If you
are interested in joining, please send a message to Kelly or reply to
this email.

Thank you,

-- 
Charles-H. Schulz
Chief Strategy Officer
Vates SAS - +33 (0)6 98 65 54 24



--_av-3w5-efQcpESJEyXLgvX8Cw
Content-Type: application/pgp-signature
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUFCQ0FBZEZp
RUVCcE15NjBzdVV4LzhhVjUxZnFKcldiZVl0T01GQW1iREZIUUFDZ2tRZnFK
cldiZVkKdE9OcitRLy9SS1NyQndVQWtjVG05TDQ2WUJJVUNsdXowNHhlQ01x
aUlQTTY3NWJzZDJYVldyWmw1TVlRUm5wNQpKenZLc2c1VnFVcDEvd1VUbEdr
YkU0dUgvaTdaRUpDQ0NFLzgxTXgrb3VhRE9vYmZVbnB6Zm82VWhGQTlPQ0pO
CmYxdTZhSmErcEpFZXIvWEVUOGpKRm9UeVVValVhakVhUDdEOVdsYmkwUTA3
OUlRMlV5STVVclVVWGExS0JybmUKRmxZUHN5TEJScVlPa1ZWSGxzSjNnVDF5
T3BUYWFQWUNra0dUeThwYk1LaGs1QmkrVFExQy93cGkzUzhaaDBlbwprR3Fq
S2FLSitlRERqWTJUMUozM29YQ3l2Qm8wTjd1M2loUDVya3BXSEY3ZVR6WDZX
RlEwbzN5clZSRGI2KzJJCmpjckpFVk5oRGFtMUtsWjJzeHlMMzNrYjdqa2VB
ZW1hbmViOTdiRCtMaHRnY1dqWlJDOThlQ0srcG1WWElFVE8KaFRGdTc3K1A4
N2hTeXptNytEckxDMHBGRndFOXZDcTlhc1I2RzViQzA0OUNkdTB0WnB4RTda
OTB2Q0RmcGVxawpZTXB4TjdWOHlVVmJvaXRCdzhMYWdIb2tHMithM2dLc3ZF
M21EdUZGTndsZFhCZGNyWkF0YWRrZzlsTm9YVmhsCmVlcDFjLzNkRmlDRCtP
QWVYREp2TVdKeEtzd0gvRnRZM3JoZ01JaU5ucUVVSjNSay85eFZmVklwT0RQ
bDYvSzYKWitUVmUvcjk1RHEwYUhZeFZXai9KSnhFWm5uOWdHU2xyN2daOWV2
Rzk3T3ZFM2RPZXFoT05oeHFDSE5jN3B0ZQpwbmZkenFoTE5LRUNETUIrSE1l
REFVTXZudEJwZUl5bmZCSGhhQy9oeHpBQW9UL3NySm89Cj1sYVgvCi0tLS0t
RU5EIFBHUCBTSUdOQVRVUkUtLS0tLQoK

--_av-3w5-efQcpESJEyXLgvX8Cw--


