Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0F46A882A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 18:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505301.778042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7r-0001Ka-Be; Thu, 02 Mar 2023 17:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505301.778042; Thu, 02 Mar 2023 17:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7r-0001G5-44; Thu, 02 Mar 2023 17:53:55 +0000
Received: by outflank-mailman (input) for mailman id 505301;
 Thu, 02 Mar 2023 17:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPDg=62=citrix.com=prvs=418368d91=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pXn7p-00086w-20
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 17:53:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 314e9849-b923-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 18:53:52 +0100 (CET)
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
X-Inumbo-ID: 314e9849-b923-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677779632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1AvREz+PvLkNyC39prxv/3cYddEHElji8V8zUhhi588=;
  b=MD72dHcmexJVikVb7mKOn6pTtstvF4si8gIEVGvE9jBb18uJbqols0wN
   GOVLJ9YgqMQH7D7y3i36cY0B5zieT2WH5qXRYYGKTizbaTG8U2DuZnjMJ
   K/6nt+rjeH9uwFy79SUHRxKlxQ/phx2SS8EgeIhdSU9u7NvryMRh0sTVe
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98603790
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:w0QN+66Dg6OQFwe/8ySrUAxRtCPHchMFZxGqfqrLsTDasY5as4F+v
 jNMX2/SOquIYjPxKt11a4m3oB4H6sSAnYQwTwZo+CE0Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasT5geF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 MVfAR0uSi+5p7ya4fWqZOpIpp4lFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9zxbG/
 jmZrjyR7hcyFNqWxjCZ0yiWrMyRhC7CWo88Er2Ez6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9FZCeE95SmGw7DY5AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8bqyuIZ/tANJGProPZOHbh7
 TOujHI4vuBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWW0C
 KMwkVkLjHO2AJdNRf4fXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZzzv9uZ
 MfDKJ/wXB727JiLKxLsGo8gPUIDnHhilQs/u7igp/hY7VZuTCHMEupUWLd/Rus48LmFsG3oH
 yV3bqO3J+FkeLSmOEH/qNdDRW3m2FBnXfgaXeQLLL/cSuencUl9Y8LsLUQJINc5xP8MzrmRr
 xlQmCZwkTLCuJEOEi3SAlgLVV8ldc8XQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:44Nwq6wEYqckkHcAG5cxKrPwO71zdoMgy1knxilNoH1uA6+lfq
 WV954mPHDP+VQssQ4b6LW90cW7LE80lqQU3WByB9mftWDd0QOVxedZgbcKqAeAJ8SRzIFgPK
 5bAsxDNOE=
X-IronPort-AV: E=Sophos;i="5.98,228,1673931600"; 
   d="scan'208";a="98603790"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 6/7] automation: Push container been tested
Date: Thu, 2 Mar 2023 17:53:31 +0000
Message-ID: <20230302175332.56052-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230302175332.56052-1-anthony.perard@citrix.com>
References: <20230302175332.56052-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Now, we can run a pipeline and set two variables to have a container
been rebuilt, tested, and pushed.

Variables:
    DO_REBUILD_CONTAINER = "ubuntu/xenial"
    PUSH_CONTAINER = 1

Or if PUSH_CONTAINER is set on a gitlab project "xen-project/xen", a
change on the dockerfile can result in a container been rebuild when
the change is pushed to staging.

The push-containers stage pull the container been tested and retag it
before pushing it. So both tagged container with and without "-test"
suffix are the same.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    Something that could be added is to check that the container that we are
    going to push is the same one that have been tested. Maybe by comparing
    "digest", or maybe by using a suffix that is only generated by the
    current pipeline.

 .gitlab-ci.yml                            |  2 ++
 automation/build/Makefile                 | 12 +++++++++
 automation/gitlab-ci/push-containers.yaml | 30 +++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 automation/gitlab-ci/push-containers.yaml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ed5383ab50..0cd45ad001 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -3,9 +3,11 @@ stages:
   - test
   - containers
   - test-containers
+  - push-containers
 
 include:
   - 'automation/gitlab-ci/build.yaml'
   - 'automation/gitlab-ci/test.yaml'
   - 'automation/gitlab-ci/containers.yaml'
   - 'automation/gitlab-ci/test-containers.yaml'
+  - 'automation/gitlab-ci/push-containers.yaml'
diff --git a/automation/build/Makefile b/automation/build/Makefile
index 5515938878..14d1320b23 100644
--- a/automation/build/Makefile
+++ b/automation/build/Makefile
@@ -21,6 +21,18 @@ include yocto/yocto.inc
 		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F)$(BUILD_CONTAINER_SUFFIX); \
 	fi
 
+# rule used by GitLab CI jobs, to push a container that as just been built and
+# tested. It override the rule used to build a container.
+ifdef PUSH_TEST_CONTAINER_SUFFIX
+%: %.dockerfile
+	$(if $(BUILD_CONTAINER_SUFFIX),$(error BUILD_CONTAINER_SUFFIX should not be set anymore))
+	$(DOCKER_CMD) pull $(REGISTRY)/$(@D):$(@F)$(PUSH_TEST_CONTAINER_SUFFIX)
+	$(DOCKER_CMD) image tag $(REGISTRY)/$(@D):$(@F)$(PUSH_TEST_CONTAINER_SUFFIX) $(REGISTRY)/$(@D):$(@F)
+	@if [ ! -z $${PUSH+x} ]; then \
+		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
+	fi
+endif
+
 .PHONY: all clean
 all: $(CONTAINERS)
 
diff --git a/automation/gitlab-ci/push-containers.yaml b/automation/gitlab-ci/push-containers.yaml
new file mode 100644
index 0000000000..d7e7e2b9e2
--- /dev/null
+++ b/automation/gitlab-ci/push-containers.yaml
@@ -0,0 +1,30 @@
+.push-container-build-tmpl:
+  stage: push-containers
+  image: docker:stable
+  tags:
+    - container-builder
+  rules:
+    - if: $PUSH_CONTAINER != "1"
+      when: never
+    - !reference [.container-build-tmpl, rules]
+  services:
+    - docker:dind
+  before_script:
+    - apk add make
+    - docker info
+    - docker login -u $CI_DEPLOY_USER -p $CI_DEPLOY_PASSWORD $CI_REGISTRY
+  script:
+    - make -C automation/build ${BUILD_CONTAINER} PUSH=1 PUSH_TEST_CONTAINER_SUFFIX=-test
+  after_script:
+    - docker logout
+
+push-ubuntu-xenial-container:
+  variables:
+    BUILD_CONTAINER: ubuntu/xenial
+  extends:
+    - .push-container-build-tmpl
+  needs:
+    - test-ubuntu-xenial-clang
+    - test-ubuntu-xenial-clang-debug
+    - test-ubuntu-xenial-gcc
+    - test-ubuntu-xenial-gcc-debug
-- 
Anthony PERARD


