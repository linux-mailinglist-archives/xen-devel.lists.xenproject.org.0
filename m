Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E419C87AB7D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 17:41:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692627.1079951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkRfP-0008FV-Kf; Wed, 13 Mar 2024 16:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692627.1079951; Wed, 13 Mar 2024 16:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkRfP-0008Dw-Hu; Wed, 13 Mar 2024 16:41:23 +0000
Received: by outflank-mailman (input) for mailman id 692627;
 Wed, 13 Mar 2024 16:41:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fMvF=KT=bounce.vates.tech=bounce-md_30504962.65f1d72e.v1-955815554105470d8cc16439a67cb507@srs-se1.protection.inumbo.net>)
 id 1rkRfO-0008Dq-LH
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 16:41:22 +0000
Received: from mail137-23.atl71.mandrillapp.com
 (mail137-23.atl71.mandrillapp.com [198.2.137.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8523251d-e158-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 17:41:21 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-23.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4Tvx9B1V3Nz1XLJlY
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 16:41:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 955815554105470d8cc16439a67cb507; Wed, 13 Mar 2024 16:41:18 +0000
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
X-Inumbo-ID: 8523251d-e158-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1710348078; x=1710608578;
	bh=0bduU8vi4qUwaEqWeiDsH+4vvViTADvEp8YdEFXN0zs=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=MluqUJDd7QgnBCO9/UmrxW33FMqUiNfTqLr7KDVXO9oFpVTXXMGWWwI8I3ZFQ6DjT
	 L+8Sz80efk9pwxDIS2Kj733wTzhhuquHHTNzU5wmWAZ9L6EYnBCk8yU1Z2kpEHQCPI
	 IaHc2x+OVOy9QbJIiop7rYTzeFv3evCEEy0ZBiS+aPX4qDSo+j5PXb2VKG8HRPAM7H
	 OoXLPCfIhk+6O58QR3eMO4ZchhK5OOtDeQEwn5ofKd55ESwVjMDd5k60VYbMB4KLW7
	 imfHjqt60ntECTEme7eWEmpTxUHoX+tkvHb1T4NvC/v4hoMoKxgXEnPhE3Mo5nSn55
	 6uY7wO7Lv1MmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1710348078; x=1710608578; i=vaishali.thakkar@vates.tech;
	bh=0bduU8vi4qUwaEqWeiDsH+4vvViTADvEp8YdEFXN0zs=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=V1oXK6CpbTdLnLGjfdAAeMN8Tt0z9s1i+ooCxzex9e2b9de8YxAQ6BkhXwOvQ7j43
	 /AWsZgC6KBcZsA7kOKO/BURXuyuTL0GmzAzDb3XCKm4f8iGM1mQ8PnXn5zKFIcKMWd
	 4W+BenjUFtah49jJM1u/jkhSEuw2vPDvueqcyDO2BxI3hP5LUJkdnN/c090SxZbGkM
	 6KOK3TqY67wn1LBS4zYhdYXOuY7nat7FqiR28eLrTc4aRxAyW1/KiBvi1Wi34FRzjO
	 dq068MK+2UT9n/mS56PAK37Hpy5/Hmrpgm/AHSGTZfBCwVZEyJcJNW0VlrePVqgViZ
	 jocT5hEYy7wmA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=200/3]=20Misc=20changes=20for=20few=20VMCB=20bits?=
X-Mailer: git-send-email 2.44.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1710348077128
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <cover.1710347950.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.955815554105470d8cc16439a67cb507?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240313:md
Date: Wed, 13 Mar 2024 16:41:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

In this patchset, first & second patch removes the unnecessary
suffix from a bunch of vmcb bits. Third patch is about printing
the status of sev and sev-es bits while dumping VMCB.

Changes since v1:
  - Address comments from Andrew and Jan
  - Add extrapatch to drop the suffix _guest as per Andrew's
    suggestion in one of the reviews
  - Address Andrew's comment with respect to pretty printing

Changes since v2:
  - Use VMCB accessors instead of open coding in patch 1 & 2
  - Fix one remaining instance of using false/true instead of
    0/1 in patch 2
  - Improve the pretty printing in svm-debug based on Jan's
    comments
  - Improve commit logs and the subject of patch 3 to include
    the changes done in v3

Vaishali Thakkar (3):
  x86/svm: Drop the _enabled suffix from vmcb bits
  x86/svm: Drop the suffix _guest from vmcb bit
  x86/svmdebug: Print np, sev and sev_es vmcb bits

 xen/arch/x86/hvm/svm/asid.c                  |  6 ++---
 xen/arch/x86/hvm/svm/nestedsvm.c             | 22 ++++++++---------
 xen/arch/x86/hvm/svm/svm.c                   |  2 +-
 xen/arch/x86/hvm/svm/svmdebug.c              |  7 ++++--
 xen/arch/x86/hvm/svm/vmcb.c                  |  2 +-
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h |  2 +-
 xen/arch/x86/include/asm/hvm/svm/vmcb.h      | 26 ++++++++++----------
 7 files changed, 35 insertions(+), 32 deletions(-)

-- 
2.44.0

