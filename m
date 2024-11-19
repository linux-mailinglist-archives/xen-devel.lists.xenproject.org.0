Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F039D2330
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 11:16:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839871.1255680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLGs-00038l-1R; Tue, 19 Nov 2024 10:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839871.1255680; Tue, 19 Nov 2024 10:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLGr-000361-UA; Tue, 19 Nov 2024 10:15:45 +0000
Received: by outflank-mailman (input) for mailman id 839871;
 Tue, 19 Nov 2024 10:15:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ioL=SO=bounce.vates.tech=bounce-md_30504962.673c6549.v1-8302679767524367a79a93a9fe957b94@srs-se1.protection.inumbo.net>)
 id 1tDLGq-0002Fw-JQ
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 10:15:44 +0000
Received: from mail136-26.atl41.mandrillapp.com
 (mail136-26.atl41.mandrillapp.com [198.2.136.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a872587-a65f-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 11:15:41 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-26.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4Xt0kK5QMxzJKF3pv
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 10:15:37 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8302679767524367a79a93a9fe957b94; Tue, 19 Nov 2024 10:15:37 +0000
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
X-Inumbo-ID: 3a872587-a65f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNi4yNiIsImhlbG8iOiJtYWlsMTM2LTI2LmF0bDQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjNhODcyNTg3LWE2NWYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDExMzQxLjQ1OTMxMiwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2M2NTQ5LnYxLTgzMDI2Nzk3Njc1MjQzNjdhNzlhOTNhOWZlOTU3Yjk0QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732011337; x=1732271837;
	bh=/DRu8gQgvvfdcVbSOLin4M8g9as0i3t/ZsNNAzxTS+I=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Fxu0UWAG34EwPCtYnMzK1UO8ImEe5XNmR6SyZJHMvQEiQU8LO+zwfv/Hqm6AZjb2U
	 cnNpKoKmrQSOLxEBj0Mi4X5SamJiJTTqTlcR4K2h5CBILOjvn9t7r4oBRzJa+P6EeA
	 RjMHZ9OtGVlOAGb3aLxt/5UwiSD55L+G9oDnQFZFp12Z3IuXsLIXkHtw4GYSqvZzbP
	 EMNPUgozmKDPJRK98HehnKHszWKlfbxmt56WzowIKE8RBd2C5J6tLcIJEwUHQywlUD
	 Uvaa9oQLApQe3eeguK0qu7IHSCwVuZL3VD8VNXyZ3xoIkLRcPiCUUW7RHTKOtYWhk2
	 sqf8ZGci42xcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732011337; x=1732271837; i=anthony.perard@vates.tech;
	bh=/DRu8gQgvvfdcVbSOLin4M8g9as0i3t/ZsNNAzxTS+I=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=sZnscscAkLVtk4dRwW/+S8zCEusNu4Fi6bFzVRCLY+B3EQIjgQfcOR2N6yuLfFWjM
	 AXNxUeuXD6ujip+Y/Ij/BCD1dmxHv5Iu9Kj+pKMGP3i53TY61emGGu+xeMk9N5dlAA
	 4LyI8+aGWnxCiEWseaCFCJi70AGHyXjr1EJ7nMcle/Z0XzYdR/NHyCCwROjdIqJqXZ
	 8+feEm+ABZEM/jpiSkdHOpD9jNIqQbMVyl3tzxYS4zk2U7ZayUS/3evB5N3y+bp+of
	 K3iHcOlcrUx8lluYbso7DoIUbkAouVRIv9lj+kG7a8lueHv7/ONB0Gus0ha0UUsoF4
	 xGJAH78SadumQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=200/3]=20CI:=20Allow=20automatic=20rebuild=20of=20rolling=20release=20containers?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732011325912
To: xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20241119101449.49747-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8302679767524367a79a93a9fe957b94?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241119:md
Date: Tue, 19 Nov 2024 10:15:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Patch series available in this git branch:
https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git br.gitlab-ci-rebuild-arch-container-v2

v2:
- remove the logic to test containers once rebuilt, and only do container build
  in the pipeline.

Hi,

This patch series would allow to setup a scheduled pipeline on GitLab which
would rebuild containers.

To enable this, just running a pipeline with XEN_CI_REBUILD_CONTAINERS=1 will
do.

I intend to add a scheduled pipeline to run once a month.

Thanks,

Anthony PERARD (3):
  CI: Remove deprecated "only:variables" in favor of "rules:if"
  CI: Define XEN_REGISTRY variable
  CI: New stage "containers" to rebuild some containers

 .gitlab-ci.yml                       | 19 +++++++++++++++---
 automation/gitlab-ci/build.yaml      |  4 ++--
 automation/gitlab-ci/containers.yaml | 29 ++++++++++++++++++++++++++++
 automation/gitlab-ci/test.yaml       | 17 +++++++---------
 4 files changed, 54 insertions(+), 15 deletions(-)
 create mode 100644 automation/gitlab-ci/containers.yaml

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

