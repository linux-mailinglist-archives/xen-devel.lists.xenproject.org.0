Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63653A72DDF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 11:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928926.1331564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txkYn-0005vu-C3; Thu, 27 Mar 2025 10:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928926.1331564; Thu, 27 Mar 2025 10:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txkYn-0005sm-93; Thu, 27 Mar 2025 10:34:05 +0000
Received: by outflank-mailman (input) for mailman id 928926;
 Thu, 27 Mar 2025 10:34:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dp8+=WO=bounce.vates.tech=bounce-md_30504962.67e52999.v1-e13a6d7d97f648efba5b3b5c4c2969bc@srs-se1.protection.inumbo.net>)
 id 1txkYl-0005sg-Ti
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 10:34:03 +0000
Received: from mail134-16.atl141.mandrillapp.com
 (mail134-16.atl141.mandrillapp.com [198.2.134.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffe12821-0af6-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 11:34:02 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-16.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4ZNg4T28TzzB5p51t
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 10:34:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e13a6d7d97f648efba5b3b5c4c2969bc; Thu, 27 Mar 2025 10:34:01 +0000
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
X-Inumbo-ID: ffe12821-0af6-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743071641; x=1743341641;
	bh=hI1YTu+xJpgiQd0xIPrnt1Cx7BuR6zlbc0m5bcO8eU4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=cu2t5jqjY5ZZZ6cj1SWaa2+9MnXgO1BQzBBcw9wo7k6HsjZvdyltIt3YfAV0ldsSH
	 Du58QZ5G5NYZJcTjqd/pyj/uCdTgL67rNJrWgQPO+j6rv9MFMrEJKG/+8JErshMCdu
	 GPnHT4I6ADa/6jQqzvxZ+M8ccc8UUAPWjmiAFg4/r4l7NHKHxUYCPCVr54mR41m/Bg
	 KAQ64QHzhAULpjHNsAcGLkTVy3F+/rZNBuEBgA+odHOH12pAON1I/9NpCTPMFjCPTJ
	 xPR461MnVXOVzQirVWzMbTeA1EiujLcko8yDaAw1YBuLRWC7UG/ed+1BOO2DLrZst+
	 SlaVsn0aU4Utg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743071641; x=1743332141; i=anthony.perard@vates.tech;
	bh=hI1YTu+xJpgiQd0xIPrnt1Cx7BuR6zlbc0m5bcO8eU4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Q6q0kXFuvXdM3/1+D/26VxplL2+eQHUcfxxJVO3s4p+P6oDff/F26kRKvsh2DAEwd
	 mafxUFX6ZTVv51Inkum8ljaVOJP28P6RKiZtYyJAAbbqZ50psLUaDON8ND8vkyzuow
	 XJlfB1WCAq1RGtneCvg4q44spseEck95AxXB6pLuUbTl9WPPMUXT9yPC2uu6Hhnh1t
	 NmapB1tHahg+gBNLzXzRNN4VwAJRdqYzef76nsao2zXYWxTytqOya5U+KrigcAa5a5
	 TW8VKMkh31hhqFS44Qh+IchvXAuU91QkRiSbKwi7vEjBVz/ZAWHDHWHGcnUK3iRV2T
	 fVZx3ztl3VB4A==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH]=20CI:=20Change=20pipeline=20name=20for=20scheduled=20pipeline?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743071640318
To: xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20250327103345.21306-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e13a6d7d97f648efba5b3b5c4c2969bc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250327:md
Date: Thu, 27 Mar 2025 10:34:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This description is already displayed on the web UI of the list of
pipeline, but using it as "name" will make it available in webhooks as
well and can be used by a bot.

This doesn't change the behavior for other pipeline types, where the
variable isn't set.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

Notes:
    doc:
    https://docs.gitlab.com/ci/yaml/#workflowname
    https://docs.gitlab.com/ci/variables/predefined_variables/#predefined-variables

 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b3beb2ff9d..7974ac4e82 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,6 +4,7 @@ variables:
     description: "Regex to select only some jobs, must be enclosed with /. For example /job1|job2/"
 
 workflow:
+  name: "$CI_PIPELINE_SCHEDULE_DESCRIPTION"
   rules:
     - if: $CI_COMMIT_BRANCH =~ /^(master|smoke|^coverity-tested\/.*|stable-.*)$/
       when: never
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

