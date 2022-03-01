Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AD24C8B4B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 13:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281296.479565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1Ly-0008L1-HG; Tue, 01 Mar 2022 12:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281296.479565; Tue, 01 Mar 2022 12:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1Ly-0008Io-Dz; Tue, 01 Mar 2022 12:11:42 +0000
Received: by outflank-mailman (input) for mailman id 281296;
 Tue, 01 Mar 2022 12:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWoc=TM=citrix.com=prvs=05201426e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nP1Lw-0008Ic-Uo
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 12:11:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be63be4d-9958-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 13:11:39 +0100 (CET)
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
X-Inumbo-ID: be63be4d-9958-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646136699;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AOGi+1fHNk/QNeSxzKelWiy0U7zrLKMb5/LRkXgzbOY=;
  b=JcVXfpMcUiFK0HwxKcFye7bpsppBhQ3iLKoSI6vY44kTj3q/XL4FPDX9
   CAvrqC605CyA3HcgYif6M/J/uNVXVY5AUecJmMJo2eav9/KhfczWGlaTF
   H+oZLIJnjC+akt/U3nT1utIPlLD45h16Lj5BGkkC93i/bPwpGPGZYxgw8
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65210546
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ispNrqrhh24HIKV4f7H0lznPno9eBmIEZRIvgKrLsJaIsI4StFCzt
 garIBnXOKuKZGD8L90jad+/oxgCupXTnNUxGVA4ry03Qn5Bp5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 Yqq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBD7KUuc0hTSlhKQonYfcb9qLWESWGmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIxMU6ZO0ATZD/7DrpghNe5n3j2XQd5j061l7oyyWfL4id+he2F3N39JYXRGJQ9clyjj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcIkbDrG/+9ZhiUefwWFVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgEYc8pdFas98g7l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt+L2XR1GjKOlcEi2r+vO8D2vKBhIFEZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZovl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQenBCxWtamS0bbtT838JrWzFF5mLJ9043d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8S4y6Da6IN4MXM/CdkTNrGgk0PiZ8OEi3zSARfVwXY
 8/HIa5A815AYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bamn13DbylCgGKoNF7ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt6I901x/kOz7yQl
 px/M2cBoGfCabT8AV3iQhhehHnHB/6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:idZC86mo4H/rYRgXzZlyKbqYGyDpDfIm3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7Qr5OUtQ/uxoV5PgfZqxz/NICOoqTNWftWvd2FdARbsKheCJ/9SJIVybygc378
 ldmsZFZOEYdWIK7vrH3A==
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65210546"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 0/3] automation: auto-build container, check generated file
Date: Tue, 1 Mar 2022 12:11:30 +0000
Message-ID: <20220301121133.19271-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-ci-build-container-v1

I wanted to automatically check that generated files that we have in our repo
are up-to-date, those are autoconf and *.gen.go files generataed from
libxl_types.idl. But this can only be check on debian stable. So new container,
and I look at building the new container from the CI.

The second patch depends on some changes to our GitLab runner:
    https://gitlab.com/xen-project/xen-gitlab-ci/-/merge_requests/15
I've already apply the changes to one runner, for testing.

The new debian:stable container is already published, but commiting the change
should rebuild it.

Thanks.

Anthony PERARD (3):
  automation: adding debian:stable container
  automation: automatically build debian:stable container
  automation: check for generated files

 .gitlab-ci.yml                            |  2 +
 automation/build/debian/stable.dockerfile | 53 ++++++++++++++++++++++
 automation/gitlab-ci/containers.yaml      | 22 +++++++++
 automation/gitlab-ci/test.yaml            | 10 +++++
 automation/scripts/check-generated-files  | 55 +++++++++++++++++++++++
 5 files changed, 142 insertions(+)
 create mode 100644 automation/build/debian/stable.dockerfile
 create mode 100644 automation/gitlab-ci/containers.yaml
 create mode 100755 automation/scripts/check-generated-files

-- 
Anthony PERARD


