Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D2F842820
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 16:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673576.1047975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUq7K-00079G-AD; Tue, 30 Jan 2024 15:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673576.1047975; Tue, 30 Jan 2024 15:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUq7K-000779-6p; Tue, 30 Jan 2024 15:33:42 +0000
Received: by outflank-mailman (input) for mailman id 673576;
 Tue, 30 Jan 2024 15:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rmC/=JI=bounce.vates.tech=bounce-md_30504962.65b916d0.v1-6e5fce633a274c1eafd97dcf402857bc@srs-se1.protection.inumbo.net>)
 id 1rUq7I-000770-2H
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 15:33:40 +0000
Received: from mail133-13.atl131.mandrillapp.com
 (mail133-13.atl131.mandrillapp.com [198.2.133.13])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef5de662-bf84-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 16:33:37 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-13.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4TPThw26fjzNCd9DZ
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 15:33:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6e5fce633a274c1eafd97dcf402857bc; Tue, 30 Jan 2024 15:33:36 +0000
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
X-Inumbo-ID: ef5de662-bf84-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1706628816; x=1706889316;
	bh=mSam6B+xwtzVmw0y4+wx3N8oXaIFj7LqpE7cntKN0Vg=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=dZ8o82ZxrYCDLHHF24dIZ+kA9NFT6QWb+HV3DTg6yDt69epqcIT2SLXBp0QMahCwt
	 0Duq+iF8g5wa+IKL2Ef058su/gbTRaKxIkruBv6tPKdgOW7yBHGhmZ4bAdpr1xaCWN
	 KoAchapGUxUHvPyWLPevR3CTlR/xH4HvzSZAGwW27oDnz2zhZYw8VorEigveXQUKw6
	 zndVnG/0G2L63nevLf7H7saay2fWhfEEVP+LpUAXHAFlQx39PUjfPvvOYs65785gZu
	 B7oiWVUB81mEWBHIAiMLDEPz33BuxzYrq+l17hhPpTDBp4GpQ/r4QDVQ+8v/Hrwkqj
	 gikUwQXfsmHkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1706628816; x=1706889316; i=yann.dirson@vates.tech;
	bh=mSam6B+xwtzVmw0y4+wx3N8oXaIFj7LqpE7cntKN0Vg=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=tQdhvImIwVUOwKQulMVZBbK7tynv+g8Yugmox8vFOv2dByLGXCLZk0HCCOUa57jIN
	 ZPjocz137c6ljHvQKO5Lw7/GdOYWZUgx9/OBQrX/BG5V6t1IUl12ZWXOenOJG99lXT
	 2B/EoGrJ4chGMPc13zfv1OQof4RXS2z4V2h5vnIGnpEHx4afDI0CrFBu+bVzw3WZTQ
	 I4495Bm6AdBZiQ84bHDWTHY+d3NhkQqRqyE0jHSsFQvj2iLQosa4CE3LGEQdnSkJrC
	 ctDSYzOnigtfAZB2cSJuWDSzWoJIAhewatOgFCNwgNK7psA8sC/LIKbEXJO4QEEmUk
	 D7uvOm5LOjrIA==
From: Yann Dirson <yann.dirson@vates.tech>
Subject: =?utf-8?Q?Mirroring=20git=20repositories=20to=20gitlab?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1706628815555
Message-Id: <edcb2078-0039-49a6-a93b-e35d7ffccde8@vates.tech>
To: xen-devel@lists.xenproject.org
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6e5fce633a274c1eafd97dcf402857bc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240130:md
Date: Tue, 30 Jan 2024 15:33:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello all,

The official project git repositories on https://xenbits.xen.org/ do not 
let people subscribe to get eg. notifications on push.  A few repos are 
mirrored in https://gitlab.com/xen-project/ but it does not look like 
there are that many of them, aside from xen.git.

I would love to have all repositories publicly mirrored there, maybe in 
a "xenbits-mirror" subgroub.  Could we do that, or would there be any 
problem with it?

Best regards,
-- 
Yann


Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

