Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E824D5393AE
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 17:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339744.564637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3W2-0002ow-Cx; Tue, 31 May 2022 15:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339744.564637; Tue, 31 May 2022 15:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3W2-0002lr-A6; Tue, 31 May 2022 15:10:38 +0000
Received: by outflank-mailman (input) for mailman id 339744;
 Tue, 31 May 2022 15:10:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nw3W0-0002ll-UE
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 15:10:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d179d326-e0f3-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 17:10:35 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654009831597725.6408293875925;
 Tue, 31 May 2022 08:10:31 -0700 (PDT)
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
X-Inumbo-ID: d179d326-e0f3-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1654009832; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VuNh5T56RjoCpstSmPnhtDy8P4z4ozgBJXlIQh5tDpgIgTiCwls+3T4jLLhXTRpL6wSj8lABQsuMRjBKDTaFcI+iWMgqJNYZbg1Iz0s+ccisWEB9CKYuc6G3kIjIdGi4ILjiU8nzIZLo2WShN46Nxi6XIuju+PGnet1RkmxCzfU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654009832; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=j1HktkrmvpiBISVz8NJU02AjYlC6cm7hboaefj1cMXA=; 
	b=dfBQRY9VtUFojQpGteQTat2se+z2iRmX33WieR9TUaQgIjBLa06Q9GwLUUnonZ4tmk0nJSo8fv0wyl7+alNjRpk+43FD+UvJGYqgefKlHPORoAEiBkE7TgAhXZd1gh25cuew1zQOwcNZGLqLmoh5a4CaaQd0u0z65Wl+II6lWVQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654009832;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=j1HktkrmvpiBISVz8NJU02AjYlC6cm7hboaefj1cMXA=;
	b=oFEaygcDThITCWUoEXpIL8Lo/QF68RsI/SwoPox9RVIW+imYe57V7TzXvgWnspS3
	Q7MH6Ujp6N1zd/HKGcSFKCI/wX8dGSmkkdv/MRzAFkTuAsKpTv4KOL80NzOeMN1XnK5
	/7ah6rnR7i1EIXPcMvrMzLBb3dVcQqUxlLuSnuM4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	jandryuk@gmail.com
Subject: [PATCH v3 0/3] xsm: refactor and optimize policy loading
Date: Tue, 31 May 2022 11:08:54 -0400
Message-Id: <20220531150857.19727-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series was born out of some cleanup work done while crafting the
hyperlaunch boot modules patch series. The primary purpose of this series was
to stop walking all boot modules when it was not necessary, but the scope
creeped during review.

Changes in v3:
* added arm Rb for patch #3
* mainly a resend due to fubar on sending v2

Changes in v2:
* changed init_policy to policy_file_required
* split the patch into a series
* corrected casting of policy buffer
* use IS_ENABLED() instead of #ifdef sequence
* moved #ifdef inside of braces for xsm_dt_policy_init()
* addressed lack of error handling of xsm{mb,dt}_init()

Daniel P. Smith (3):
  xsm: only search for a policy file when needed
  xsm: consolidate loading the policy buffer
  xsm: properly handle error from XSM init

 xen/arch/arm/setup.c  | 10 ++++----
 xen/arch/x86/setup.c  |  9 +++++--
 xen/include/xsm/xsm.h |  2 +-
 xen/xsm/xsm_core.c    | 56 +++++++++++++++++++++----------------------
 xen/xsm/xsm_policy.c  | 31 ++++++++++++++++++++----
 5 files changed, 68 insertions(+), 40 deletions(-)

-- 
2.20.1


