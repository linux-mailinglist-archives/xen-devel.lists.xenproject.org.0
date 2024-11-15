Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F79CF25F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 18:08:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837870.1253777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBznS-0007kQ-TU; Fri, 15 Nov 2024 17:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837870.1253777; Fri, 15 Nov 2024 17:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBznS-0007fM-Oa; Fri, 15 Nov 2024 17:07:50 +0000
Received: by outflank-mailman (input) for mailman id 837870;
 Fri, 15 Nov 2024 17:07:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0yuK=SK=bounce.vates.tech=bounce-md_30504962.67377fdf.v1-ded2c197463741b0b8e8fe50e52c91eb@srs-se1.protection.inumbo.net>)
 id 1tBznR-0007cN-Nw
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 17:07:49 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 210b2cf8-a374-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 18:07:44 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4Xqk3g1Jspz3sNVQ6
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 17:07:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ded2c197463741b0b8e8fe50e52c91eb; Fri, 15 Nov 2024 17:07:43 +0000
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
X-Inumbo-ID: 210b2cf8-a374-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjIxMGIyY2Y4LWEzNzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjkwNDY0LjcyNDgwNywic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3Mzc3ZmRmLnYxLWRlZDJjMTk3NDYzNzQxYjBiOGU4ZmU1MGU1MmM5MWViQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731690463; x=1731950963;
	bh=5XTdFWtUX2noifMS8VWYV7Ry5GziFIbvFNCFiCbcUF4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=aH8+8IGETRjqWxod+pSHi6EklhWpcQ3GXDIutwB+XC8UNnQDgKGKCn/ZvwuLzQL4Y
	 1PfU0d93Zky/SrjtB2DjMhmBjygktoV/pdm4gotaFNcLq5rGvPUAaVWVEsbFsPOm8t
	 0OYyFbNK4iuNRmjMe9djs2/baWi6RB2WsSk6XECeNTPWw4O8AR0e1LO2HK7q5THdFd
	 uYdvWTqyUaFvAZH2FDdOfnBX39bWNeDUWPvn9r61d4Vq1i46zo4LaQXbYzia1mRI/j
	 ju/86uUZlzhGpBEjxujV6EzdheQFBsuc0ws8buOxSpMFJvCG9ztrFUqFqPaCc48sMM
	 DdAAB70/E6Guw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731690463; x=1731950963; i=anthony.perard@vates.tech;
	bh=5XTdFWtUX2noifMS8VWYV7Ry5GziFIbvFNCFiCbcUF4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=yfZY/nxBNxiBjVqMLJRISV8KEJ+TjuMkqrR6kmlyhZYynGC07Wl0xACHBQWdrQ+RS
	 fyFQoxg6VQML+SqqMdT6FF4PAtCDnjRPd2/ammRZMw2Vrv74nmC7BbWqR7X7QMeNYO
	 y1XkcJJWxJNn4vTWHj9Dr0MrSh3ko9MztDSVkpg31XMlj7fvskQ7ki8XzGPHaero2D
	 x0ajrCHL8NNVE230fA7tyS9Pwx1jbtBoRFv8d5kvR3VIzyeFwEWKMosOSG8GsWwTBn
	 hzlmUKomjySodsg3CN0XCfyxf3Rk2jmHAhYVL9T2xne9ftaUYUuOEGHB1RRZY0Fo82
	 7fYJ+fEUxX08Q==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=200/3]=20CI:=20Allow=20automatic=20rebuild=20of=20rolling=20release=20containers?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731690461855
To: xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20241115170739.48983-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ded2c197463741b0b8e8fe50e52c91eb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241115:md
Date: Fri, 15 Nov 2024 17:07:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Patch series available in this git branch:
https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git br.gitlab-ci-rebuild-arch-container-v1

Hi,

This patch series would allow to setup a scheduled pipeline on GitLab which
would rebuild containers and run a test on them immediately (the container is
updated even if the test fail, but at least we can find out about it sooner
rather than later).

To enable this, just running a pipeline with XEN_CI_REBUILD_CONTAINERS=1 will
do.

I intend to add a scheduled pipeline to run once a month.

Thanks,

Anthony PERARD (3):
  CI: Remove deprecated "only:variables" in favor of "rules:if"
  CI: Define XEN_REGISTRY variable
  CI: New stage "containers" to rebuild some containers

 .gitlab-ci.yml                       |  5 +++
 automation/gitlab-ci/build.yaml      | 61 ++++++++++++++++++----------
 automation/gitlab-ci/containers.yaml | 29 +++++++++++++
 automation/gitlab-ci/test.yaml       | 30 +++++++++-----
 4 files changed, 93 insertions(+), 32 deletions(-)
 create mode 100644 automation/gitlab-ci/containers.yaml

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

