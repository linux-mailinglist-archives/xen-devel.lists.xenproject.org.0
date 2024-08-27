Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA52B9606A1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 12:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783746.1193018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sit32-000180-0L; Tue, 27 Aug 2024 10:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783746.1193018; Tue, 27 Aug 2024 10:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sit31-000167-Tu; Tue, 27 Aug 2024 10:03:35 +0000
Received: by outflank-mailman (input) for mailman id 783746;
 Tue, 27 Aug 2024 10:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lqxM=P2=bounce.vates.tech=bounce-md_30504962.66cda473.v1-8f1f9f88efe5427d845b945a4ac8ba8b@srs-se1.protection.inumbo.net>)
 id 1sit30-00015q-GO
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 10:03:34 +0000
Received: from mail187-32.suw11.mandrillapp.com
 (mail187-32.suw11.mandrillapp.com [198.2.187.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d769d2c-645b-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 12:03:32 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-32.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4WtNR70lRPzQXg2bd
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 10:03:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8f1f9f88efe5427d845b945a4ac8ba8b; Tue, 27 Aug 2024 10:03:31 +0000
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
X-Inumbo-ID: 9d769d2c-645b-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724753011; x=1725013511;
	bh=85xl+42r3E+d5KYyQdGBwoXGanIObfXZWBWVlXbR904=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Yq/8kFDTSFAWQ8f44lbhZ98PVMYaElQJC72k58LBa5HyUJnlboK8b0T8A3685spgI
	 xJf+0E1IuX7xrZTTE6enJg+OMKzJXGJJNBdTmyl6OSyczYAeLPyjRkl9AXNmU/XsMT
	 rSDhKnDoHrLSNTbgsgxSED1oN6qt09O33bZHz12mhxZacSMiWyqt7STq/w+7GJw36/
	 l/hkvuCSfnt5dovHHotbtgYOe2KEHWrA0c329tvyHHoBtjCo1jkQHss+U7cB2f6R2t
	 qXL2ee83Eb/2OQNk/M8sLIqNMMjSMTWQSswTmdwH0PtrzFis8O0mIa9ZlVPNUg41oD
	 vKo2gks427BDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724753011; x=1725013511; i=anthony.perard@vates.tech;
	bh=85xl+42r3E+d5KYyQdGBwoXGanIObfXZWBWVlXbR904=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Z9LGYjXE5Ajkz+ie05bmLGp4BWs4cD2NZbvPfd6IEnDuOCIP3Fr/pU1ldhq+G054v
	 NecoP6fmO/oOUMafcRKWa4VY9xLhlBvwhCJR+E/gmLAgnBfiednTFC+kbjOMJnGa5U
	 GqB/mbxXx7ft9Ux34zgWKqZPcfiMGbmDFC7Oct8cDD/pfETxldRLuFnXuvHTAlYU86
	 GYjhIohI1wnQI8B5FsWlE5k7LELbb8gDn9Q7Wrta5yuYyG6am8VKOBupKHvC9S0UyW
	 zkTbnqFprqebs7GNweQnOqDxiXRVDYwqYIdVCslxHNIkM3P1WNh2XlszvQZTWQ+jYT
	 uepFTnHtBIGgw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=200/3]=20libxl:=20Implement=20QEMU=20command=20line=20probe?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724753010498
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Message-Id: <20240827100328.23216-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8f1f9f88efe5427d845b945a4ac8ba8b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240827:md
Date: Tue, 27 Aug 2024 10:03:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.libxl-qemu-cmdline-probe-v1

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

Anthony PERARD (3):
  libxl: Implement QEMU command line probe
  libxl: Probe QEMU for -run-with chroot=dir and use it
  libxl: Probe QEMU for -run-with user=user and use it

 tools/libs/light/libxl_dm.c       | 297 +++++++++++++++++++++++++++---
 tools/libs/light/libxl_internal.h |   7 +
 2 files changed, 278 insertions(+), 26 deletions(-)

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

