Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F35CD28329
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 20:46:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205781.1519790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgTHh-0001Mf-Ry; Thu, 15 Jan 2026 19:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205781.1519790; Thu, 15 Jan 2026 19:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgTHh-0001KC-Ol; Thu, 15 Jan 2026 19:45:33 +0000
Received: by outflank-mailman (input) for mailman id 1205781;
 Thu, 15 Jan 2026 19:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzQq=7U=oasis-open.org=kelly.cullinane@srs-se1.protection.inumbo.net>)
 id 1vgTHg-0001K6-9x
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 19:45:32 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcf1e426-f24a-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 20:45:26 +0100 (CET)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-8907ec50855so17536656d6.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 11:45:26 -0800 (PST)
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
X-Inumbo-ID: bcf1e426-f24a-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oasis-open-org.20230601.gappssmtp.com; s=20230601; t=1768506325; x=1769111125; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        b=zfsED9WeRCYkwrAr87Pz4EnCp0Z9CCj8hUABpGa0XNgAz1pK9sedpurFOn2ookGiSS
         D26++vyI7sqUoxUSSgPGZ35I+aGKK89dLRPnI6a4rCAajASRMM40wUEJZOdT9H1tiVDY
         6vZqOId1TZsTQMZMu80OPzIXvftRIW2/m4Wk5KbT5FylyDqQeuUKrOPQjhk8uE4zOpwJ
         eCKGvis5KZA0Cyvv3s3CSUCJaHglR49qEVOhmPkt614CvMH3OLEFA9RKKNU99koeBXkr
         FaxmcbSuT4ZGep++MPhi44v3txy+B3DqH4E41YhLHcBMtDTNyHpwch21jqDp52QqQvma
         okWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768506325; x=1769111125;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        b=aQhquKNThdJpcQoiyvhKrZJIl/LhzTP5+8JvSpEo8JSTo7tnCZHMuPOEWizS2yxV5Y
         FW0CdrSp0l1IYyNN4mMVBikQjoUW5NinC2hxwUFKHPmuQLhLsXWOhg6bnk3NkSiFd9Hp
         0KCzp10+cJQwVZusAY9Qjbg/1pjTC2VrX9/bF17diRQaqQJxQScTx2N7li/D7CXkgd+V
         DIxTtjHLXBGFgYhFk9bJ9xKEyla5TVTfnF5SHyOz9OvmTC5uBfhvvEGRM49ltcTfU2OG
         9eKRE1vWYJSrKr/7pImNb1lW+CEVDbtOd80oEu06OIFYyU6U2pt2gWQNa0VB21XXz4eo
         anmg==
X-Gm-Message-State: AOJu0Ywp80DcEQjloisKfeKM3G6jtfvz1YFCPbdD/2E8bLKmOTBGXZnB
	PxJzLY56iN85AflFRrrGwUXqBOYev+ju5uy+KsrjDMCYEV8CfFfzDmlp5lpgSWQiFtCZ621FUWq
	o2eVovjyjBpluga69mE+mGI8+yrRxfuci+rkEpIXNFUxvZLcdgfqSyzo=
X-Gm-Gg: AY/fxX48aa5ccoYmA1lU64fqolQL03LrUPY0BTlHx3wEfJVBFLDVRPgPCqPSPCoacEA
	uww5Buvy9i3rrWXU125VV4tHo1njgFzjMzAUEFGCnBD/iiiL7jr/ADZXNhyTheiKj/Y6YI/QMUb
	nrxicoRh5DCxIoktUHhmQw7GYqOdy4HfGEf+cWKTXPHrWgfzrroLNA1gMC8ISV99h2XFE3AJ0o4
	7Zz7aTtpuxIbAoeEt93+cngltl+Ej/yfeS1t8DjPINeW0lAZvN3EppyvMGEU53gdaaDXarmhrhZ
	Far0djH9kaJotNGjVGnlGaP8y2d9A6KPuatCdahIJ/NFtF8KejrS0P+iJgPq
X-Received: by 2002:ad4:5cc1:0:b0:888:7f91:e276 with SMTP id
 6a1803df08f44-8942e42cc8fmr7330426d6.30.1768506325306; Thu, 15 Jan 2026
 11:45:25 -0800 (PST)
MIME-Version: 1.0
From: Kelly Cullinane <kelly.cullinane@oasis-open.org>
Date: Thu, 15 Jan 2026 14:44:49 -0500
X-Gm-Features: AZwV_Qhv46EC-3juuarlSq3uhNN5xVVUoigaoPryNNEIJSl3WMf_ROS7L5svrwM
Message-ID: <CAAiF6017daWh_fRW_SaEyO+TMS_3kdx_oJeZhiRre7fLPAgKfw@mail.gmail.com>
Subject: Invitation to comment on VIRTIO v1.4 CSD01
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OASIS members and other interested parties,

OASIS and the VIRTIO TC are pleased to announce that VIRTIO v1.4 CSD01
is now available for public review and comment.

VIRTIO TC aims to enhance the performance of virtual devices by
standardizing key features of the VIRTIO (Virtual I/O) Device
Specification.

Virtual I/O Device (VIRTIO) Version 1.4
Committee Specification Draft 01 / Public Review Draft 01
09 December 2025

TEX: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csp=
rd01.html
(Authoritative)
HTML: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-cs=
prd01.html
PDF: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csp=
rd01.pdf

The ZIP containing the complete files of this release is found in the direc=
tory:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
zip

How to Provide Feedback
OASIS and the VIRTIO TC value your feedback. We solicit input from
developers, users and others, whether OASIS members or not, for the
sake of improving the interoperability and quality of its technical
work.

The public review is now open and ends Friday, February 13 2026 at 23:59 UT=
C.

Comments may be submitted to the project=E2=80=99s comment mailing list at
virtio-comment@lists.linux.dev. You can subscribe to the list by
sending an email to
virtio-comment+subscribe@lists.linux.dev.

All comments submitted to OASIS are subject to the OASIS Feedback
License, which ensures that the feedback you provide carries the same
obligations at least as the obligations of the TC members. In
connection with this public review, we call your attention to the
OASIS IPR Policy applicable especially to the work of this technical
committee. All members of the TC should be familiar with this
document, which may create obligations regarding the disclosure and
availability of a member's patent, copyright, trademark and license
rights that read on an approved OASIS specification.

OASIS invites any persons who know of any such claims to disclose
these if they may be essential to the implementation of the above
specification, so that notice of them may be posted to the notice page
for this TC's work.

Additional information about the specification and the VIRTIO TC can
be found at the TC=E2=80=99s public homepage.

