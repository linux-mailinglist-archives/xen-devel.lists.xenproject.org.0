Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A46CB3C0A5
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:26:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101858.1454775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1vu-0001l0-9p; Fri, 29 Aug 2025 16:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101858.1454775; Fri, 29 Aug 2025 16:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1vu-0001ii-7J; Fri, 29 Aug 2025 16:26:34 +0000
Received: by outflank-mailman (input) for mailman id 1101858;
 Fri, 29 Aug 2025 16:26:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1us1vt-0001ic-7E
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:26:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1us1vs-00Ch8z-2z
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:26:33 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1us1vt-007nIV-0I
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:26:33 +0000
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-5432dfa5e8eso1679582e0c.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 09:26:33 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Type:To:Subject:Message-ID:Date:
	From:MIME-Version; bh=ZQJcuJVbvc5yynz4tPhTCxCdUqklamRgf1ulOy6FLZc=; b=GpopGPS
	BiC4LtiFl8nNgHpo3p58h2UKV+N289UY48OMkegs1JgBD8WMvpKEnNRJ4qeYj5mZYSWi7BN/dHilh
	BUelWH6eBUZ2ASgXUTD97+zOxeqdk52uSFt7kzvGg8TAy98hpzIcM7HUrUow37bbiEXvBvyhH6NKT
	+IRPNNq3DE=;
X-Gm-Message-State: AOJu0YyCnJSi9igx8J65uaZBEgSy8mViptCTHaqOXfXjswUlFt3SiFkS
	jxFhLgRjwf87zbA3zZ43g3wMk66VRy71yFtLM2q0pPtZ4WZj3BuCIJNIcfP3artmQ/leQSJMMTy
	cWkv0fs/jaAxTlV8/PfA6U8KSEF9VkDQ=
X-Google-Smtp-Source: AGHT+IH6Y1IuhKKBT4+m2iDEW2mxh+gaILIdayjHtiZsr1gW9yaQuU0oNnO1wtNvpMBneMiOkVEp5QkczrDGK97d53I=
X-Received: by 2002:a05:6122:4d0e:b0:541:5bea:f4ab with SMTP id
 71dfb90a1353d-5415beafb4amr7221693e0c.10.1756484792669; Fri, 29 Aug 2025
 09:26:32 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Fri, 29 Aug 2025 18:26:21 +0200
X-Gmail-Original-Message-ID: <CAJbE=Kz3UNoqEvc2izJX4uxhdQYe6Z_tAGeUB_XzZZTLDL57XA@mail.gmail.com>
X-Gm-Features: Ac12FXzcm7tK_CcO_yq0mlhHn-EqZHnpv5d2Nxj9gKrQZL9C_qZ5bnzwXfFj0Pw
Message-ID: <CAJbE=Kz3UNoqEvc2izJX4uxhdQYe6Z_tAGeUB_XzZZTLDL57XA@mail.gmail.com>
Subject: [ANNOUNCE] September Community Call
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000001edbf0063d837c47"

--0000000000001edbf0063d837c47
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Don't forget that our September community call is scheduled for Thursday
September 4 @ 15:00 UTC.

I'll send out a proposed agenda at the beginning of the week, but I wanted
to send out a friendly reminder before the weekend.

I'm looking forward to seeing you on Thursday!

Have a great weekend,

Cody Zuschlag
Xen Project - Community Manager

--0000000000001edbf0063d837c47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,<br clear=3D"all"></div><div><br></div><d=
iv>Don&#39;t forget that our September community=C2=A0call is scheduled for=
 Thursday September 4 @ 15:00 UTC.</div><div><br></div><div>I&#39;ll send o=
ut a proposed agenda at the beginning=C2=A0of the week, but I wanted to sen=
d out a friendly reminder before the weekend.</div><div><br></div><div>I&#3=
9;m looking forward to seeing you on Thursday!</div><div><br></div><div>Hav=
e a great weekend,</div><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr"><img src=3D"https://ci3.go=
ogleusercontent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQti=
tBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br><div>Cody Zuschlag</div><div>Xe=
n Project - Community Manager</div></div></div></div></div>

--0000000000001edbf0063d837c47--

