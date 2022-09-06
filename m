Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44925AE4D3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 11:54:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399736.641022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVVHj-0004JH-Pm; Tue, 06 Sep 2022 09:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399736.641022; Tue, 06 Sep 2022 09:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVVHj-0004GW-My; Tue, 06 Sep 2022 09:54:23 +0000
Received: by outflank-mailman (input) for mailman id 399736;
 Tue, 06 Sep 2022 09:54:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yAEs=ZJ=bounce.vates.fr=bounce-md_30504962.631718cb.v1-4be0d71aa2844790b36dc51616f2ea80@srs-se1.protection.inumbo.net>)
 id 1oVVHi-0004GK-RX
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 09:54:22 +0000
Received: from mail145-24.atl61.mandrillapp.com
 (mail145-24.atl61.mandrillapp.com [198.2.145.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0e75fcc-2dc9-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 11:54:21 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-24.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4MMLMH5spqzGlspCP
 for <xen-devel@lists.xenproject.org>; Tue,  6 Sep 2022 09:54:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4be0d71aa2844790b36dc51616f2ea80; Tue, 06 Sep 2022 09:54:19 +0000
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
X-Inumbo-ID: e0e75fcc-2dc9-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1662458059; x=1662760459; i=andrei.semenov@vates.fr;
	bh=urDc9A+qx5y028VCP4ahYiB7xtOwiFvSVqTYVaRjrX4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Z6KD2qtT+Z2ahFmsa37xdWPqH5K8SLBGt41IjGSa7nWCjuQLjF0uErnqPdjQXQrP8
	 sarOjwIesHgBxOuHSlN3zw/IJoH2s+IyFQQYNRX4YtrTqrnLfyfgSazcvyke/l2yVV
	 xoIkzpcPNLsGpKImPREdC6MFAkrq0U2B00e1yIQk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1662458059; h=From : 
 Subject : To : Cc : Message-Id : Date : MIME-Version : Content-Type : 
 Content-Transfer-Encoding : From : Subject : Date : X-Mandrill-User : 
 List-Unsubscribe; bh=urDc9A+qx5y028VCP4ahYiB7xtOwiFvSVqTYVaRjrX4=; 
 b=mwCBXM+lr9uH7RZxQsa15zRbtIzvdbt1MOsxTZTOz9ekEr2Y4iM3PylJWh2IN3h3ehC0DR
 /E9MHIpXHN7hdHOJ/jWAgVaco1f81EoFDOGzt9j9DpRsOq3NXd7niVjDpk0xFmrZyIRumV7L
 gSe6IOcmZB4EHdd+xgHeY0I4KmkDA=
From: Andrei Semenov <andrei.semenov@vates.fr>
Subject: [PATCH v2 0/2] live migration: optimisations
X-Mailer: git-send-email 2.34.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 5cd6f291-6f11-459d-97c0-d09b574c3896
X-Bm-Transport-Timestamp: 1662458058793
To: andrei.semenov@vates.fr, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Message-Id: <cover.1662457291.git.andrei.semenov@vates.fr>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.4be0d71aa2844790b36dc51616f2ea80
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20220906:md
Date: Tue, 06 Sep 2022 09:54:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This 2 patches implement some optimisations for guests live migraiton. 

Andrei Semenov (2):
  live migration: do not use deffered bitmap when inappropriate
  live migration: use superpages for physmap population on restore when
    possible

 tools/include/xen-tools/libs.h           |  4 ++
 tools/libs/guest/xg_private.h            |  3 +
 tools/libs/guest/xg_sr_common.h          | 44 +++++++++++-
 tools/libs/guest/xg_sr_restore.c         | 60 +++++++---------
 tools/libs/guest/xg_sr_restore_x86_hvm.c | 88 +++++++++++++++++++++++-
 tools/libs/guest/xg_sr_restore_x86_pv.c  | 22 +++++-
 tools/libs/guest/xg_sr_save.c            | 23 +++----
 tools/libs/guest/xg_sr_save_x86_hvm.c    | 21 ++++++
 tools/libs/guest/xg_sr_save_x86_pv.c     | 39 +++++++++++
 9 files changed, 247 insertions(+), 57 deletions(-)

-- 
2.34.1



Andrei Semenov | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

