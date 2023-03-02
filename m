Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDBF6A8823
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 18:54:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505298.778004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7l-00008R-5Y; Thu, 02 Mar 2023 17:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505298.778004; Thu, 02 Mar 2023 17:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7k-0008Rc-U1; Thu, 02 Mar 2023 17:53:48 +0000
Received: by outflank-mailman (input) for mailman id 505298;
 Thu, 02 Mar 2023 17:53:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPDg=62=citrix.com=prvs=418368d91=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pXn7j-00086v-3J
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 17:53:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d0cb084-b923-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 18:53:45 +0100 (CET)
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
X-Inumbo-ID: 2d0cb084-b923-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677779625;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pqjolciy/GYaOh/EUUxEl9qt3jG0Ps61g++fsO8Rsmo=;
  b=GcHEtLSafx9DhybyYzjnebuSYLNmy89Wmpkz4JhaYZRS9+gIsHjqgyzo
   a69YF/LYIxUFQ9qM1mu8RCEFcTv8HIlst8KyS+f05O9CFEeDTs8NA6h2G
   OIujfWsCt+FszkIpKFyy8zf4oHVPjHEWPZjqOEts4MqDqsFNygLC3wAdA
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101652772
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:riksuKmrKu4cilt5syG4ocro5gybJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeXmjUb//eZWbxft1yaYy/o0kF6MXRx9ZgSVY+pSxmFCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5AWGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 e4qMiEEcBahu8udxK6DG8MzxekOLsa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/A/
 zybpTumWHn2MvSYzmG3olGUjNbesgjrCaAzRb6fztBD1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4CPYm4QuAzq7V5QexBWUeSDNFLts8u6ceTjUw2
 liEt9jgHzBovfueTnf1y1uPhWrsY25PdzZEPHJaC1JfuLEPvb3fkDrdfMxyGbCzrOHcMjXs+
 2Gg82sTqrcc2JtjO7qAwXjLhDelp57sRwEz5xnKUm/N0j6VdLJJdKTztwGFsK8owJKxCwDY4
 SNaw5T2APUmV8nlqcCbfAka8FhFDd6hOSaUv1NgFoJJG9+Fqy/6JtA4DN2TyS5U3ic4ld3BO
 hK7VeB5vsU70J6WgUhfMuqM5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/5gZ
 8bGIZ71VCpLYUiC8NZRb71AuYLHOwhknT+DLXwF50/PPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPToyizpNbWO3GNmaZKdABiEJTOLcyuwyChXrLZc1UO9aBII6O5/I7NjKQ+xPgOzb6Qo
 CjsMqKaoXKm7UD6xcyxQigLQNvSsVxX9xrX4QRE0Y6U5kUe
IronPort-HdrOrdr: A9a23:pLwkj6BC9YtXctTlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.98,228,1673931600"; 
   d="scan'208";a="101652772"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [RFC XEN PATCH 0/7] automation, RFC prototype, Have GitLab CI built its own containers
Date: Thu, 2 Mar 2023 17:53:25 +0000
Message-ID: <20230302175332.56052-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-containers-auto-rebuild-v1

Hi,

I have done some research to be able to build containers in the CI. This works
only for x86 containers as I've setup only a single x86 gitlab-runner to be
able to run docker-in-docker.

The runner is setup to only accept jobs from a branch that is "protected" in
gitlab. Also, one need credential to push to the container register, those are
called "Group deploy tokens", and I've set the variables CI_DEPLOY_USER and
CI_DEPLOY_PASSWORD in the project "xen-project/xen" (variables only visible on
a pipeline running on a protected branch).

These patch introduce quite a lot of redundancies in jobs, 2 new jobs per
containers which build/push containers, and duplicate most of build.yaml.
This mean that if we go with this, we have to duplicate and keep in sync many
jobs.

To avoid having to do the duplicated jobs by hand, I could look at
creating a script that use "build.yaml" as input and produce the 3
stages needed to update a container, but that script would need to be
run by hand, as gitlab can't really use it, unless ..

I've look at generated pipeline, and they look like this in gitlab:
    https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/777665738
But the result of the generated/child pipeline doesn't seems to be taken into
account in the original pipeline, which make me think that we can't use them to
generate "build.yaml". But maybe the could be use for generating the pipeline
that will update a container.
Doc:
    https://docs.gitlab.com/ee/ci/pipelines/downstream_pipelines.html#dynamic-child-pipelines

So, with all of this, is it reasonable to test containers before
pushing them to production? Or is it to much work? We could simply have jobs
tacking care of rebuilding a container and pushing them to production without
testing.

An example with the variable DO_REBUILD_CONTAINER and PUSH_CONTAINER set (and
existing build/test jobs disabled):
    https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/791711467

Cheers,

Anthony PERARD (7):
  automation: Automatically rebuild debian:unstable container
  automation: Introduce test-containers stage
  automation: Add a template per container for build jobs.
  automation: Adding containers build jobs and test of thoses
  automation: Introduce DO_REBUILD_CONTAINER, to allow to rebuild a
    container
  automation: Push container been tested
  automation: Add some more push containers jobs

 .gitlab-ci.yml                            |   6 +
 automation/build/Makefile                 |  14 +-
 automation/gitlab-ci/build.yaml           | 327 ++++++++------
 automation/gitlab-ci/containers.yaml      |  98 +++++
 automation/gitlab-ci/push-containers.yaml |  79 ++++
 automation/gitlab-ci/test-containers.yaml | 496 ++++++++++++++++++++++
 6 files changed, 894 insertions(+), 126 deletions(-)
 create mode 100644 automation/gitlab-ci/containers.yaml
 create mode 100644 automation/gitlab-ci/push-containers.yaml
 create mode 100644 automation/gitlab-ci/test-containers.yaml

-- 
Anthony PERARD


