Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C091965D51
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 11:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786324.1195904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyGH-0007wB-QO; Fri, 30 Aug 2024 09:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786324.1195904; Fri, 30 Aug 2024 09:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyGH-0007u5-Nd; Fri, 30 Aug 2024 09:49:45 +0000
Received: by outflank-mailman (input) for mailman id 786324;
 Fri, 30 Aug 2024 09:49:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fTbV=P5=bounce.vates.tech=bounce-md_30504962.66d195b3.v1-1aeebc3cf2674cbf8c3aa11c57ca257b@srs-se1.protection.inumbo.net>)
 id 1sjyGF-0007to-Hc
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 09:49:43 +0000
Received: from mail135-11.atl141.mandrillapp.com
 (mail135-11.atl141.mandrillapp.com [198.2.135.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d59a5e8-66b5-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 11:49:41 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-11.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WwCzl6DwTzLfH0Q4
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 09:49:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1aeebc3cf2674cbf8c3aa11c57ca257b; Fri, 30 Aug 2024 09:49:39 +0000
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
X-Inumbo-ID: 2d59a5e8-66b5-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725011379; x=1725271879;
	bh=4sGqzl3pHWUWgo6zIvCEtetCdFeclMIXIb/FR8+SB4I=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Ok8439v9HCJB3Rumc66JDiPPx+jV3A4iXnwHMzNEWD4Fku+SAkSNsK/K4P0328ESS
	 69gyURoVqVz9vodTXHX+RUnFcCnHecIxvm1Iy8hkhc0kOD9KyOnbI7hcjTe9IoyZHl
	 OdaeLq52Jc2ml1zcO9/kH/Kam86FXr2jZpN2+LvB5soIMU9x1BVkwRov9f6mqPQmlN
	 fKNoyhU+ism5Sd+TB2lCDQLwqMvkFItn2HdmoP0d2OeQJDll8GbjXcgQvKqLs8itnl
	 20uEuY4GVLkWM04ioB1r/eu0hsRltUqd0K5nJPIfMYs8Op4IZZy760EZ1i5oYevHwu
	 SEMRKpfWsVJPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725011379; x=1725271879; i=anthony.perard@vates.tech;
	bh=4sGqzl3pHWUWgo6zIvCEtetCdFeclMIXIb/FR8+SB4I=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ogampzA65DubjkKOiMrLD7Dciql9sjmUYjG9uItq3vETHMX0VnyGPPTob/DobSwnu
	 HjnKtfbACE4DqjLonoS2ablkyWaZp9tnVlFvAxMCTxHligNZUTztfETY+Vl6QeOKsu
	 TXxEPBCxMxToFIjfZbnJQJswU8zR0dSQowG8zkRUPHkokgeTRkDrJYm39fXbxOydu7
	 9JZkTJ4aEnIEJddRskIOEKm4IGgik5IoSmHzzZx4/dMIR82vUKSghdXzfGzX8JlwFP
	 ypXnslOAunmrCZfBastXqnPXCBrWh1d6S2LO3b7Z56gx5GID5qZGmGigV4D6s+YByr
	 Hu5vZBpmfEAVg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=200/2]=20libxl:=20Implement=20QEMU=20command=20line=20probe?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725011379275
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Message-Id: <20240830094937.40476-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1aeebc3cf2674cbf8c3aa11c57ca257b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240830:md
Date: Fri, 30 Aug 2024 09:49:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.libxl-qemu-cmdline-probe-v2

v2:
- removed commited patch
- rename "qemu_cmdline" to "qemu_opts" in struct field and func parameters.
- rename "struct libxl__qemu_available_cmd_line" to
  "struct libxl__qemu_available_opts".

Starting with QEMU 9.0, the option "-chroot", that we use for the
"dmrestrict" feature, is removed. We need to find out which to use
between "-chroot" and "-run-with chroot=dir".

Also, "-runas" is deprecated in QEMU 9.1 and will be remove in a future
release, it's replaced with "-run-with user=user".

To find out which command line option we can use, we'll spawn QEMU, and run the
QMP command "query-command-line-options".

Some example of running these patches:
    with qemu-xen (8.0):
        http://logs.test-lab.xenproject.org/osstest/logs/187352/
    with QEMU (upstream, 9.1-rc3):
        http://logs.test-lab.xenproject.org/osstest/logs/187353/

Anthony PERARD (2):
  libxl: Probe QEMU for -run-with chroot=dir and use it
  libxl: Probe QEMU for -run-with user=user and use it

 tools/libs/light/libxl_dm.c       | 90 +++++++++++++++++++++++++------
 tools/libs/light/libxl_internal.h |  6 +++
 2 files changed, 80 insertions(+), 16 deletions(-)

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

