Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE7978371A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 02:46:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587946.919347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYFWg-0007ha-2a; Tue, 22 Aug 2023 00:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587946.919347; Tue, 22 Aug 2023 00:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYFWf-0007eH-VY; Tue, 22 Aug 2023 00:45:41 +0000
Received: by outflank-mailman (input) for mailman id 587946;
 Tue, 22 Aug 2023 00:45:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gk3p=EH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYFWe-0007P4-Fm
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 00:45:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36c014c5-4085-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 02:45:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 82B5660C08;
 Tue, 22 Aug 2023 00:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1939AC433C8;
 Tue, 22 Aug 2023 00:45:36 +0000 (UTC)
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
X-Inumbo-ID: 36c014c5-4085-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692665137;
	bh=qoLgfJQBWiPHTzycW67/vN/z3+TsS+y7d+PacMcrhnY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PKwFWqy4qynyI1zaCBqO4CJ6aTYQe8/EvWMlTJ9cvyQd7TBLGpwkN8tCAhxUCOxKD
	 peqxajrpgYUnLWFyvSbN+VoWLK7dvPaBrpIYLRJpv8l+68r9Vkt+8Xcg38YtSLFMQ2
	 trhykHEy1k1OvFNnuzaZHZtWCGV1VudiAhR3sdNYEBx++CdknGlQiICzaIaB0Bk3AW
	 q3LGqB6BN/g1fFFN4dR4n10lCvc1ysznKapoBbLtbt9Cwe8rWZGNOBD4z+XPY6i6xG
	 cVHZwLBXXY6XAkpE0YfL7zTscf5NRRAPX5XDEHOwlRBsFAj4ZP6ayb2H8CKNZiDCW4
	 VJiUfJEtKR3LA==
Date: Mon, 21 Aug 2023 17:45:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    andrew.cooper3@citrix.com, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 2/2] automation: avoid pipelines on specific
 branches
In-Reply-To: <8ca21d49e7b95e788a4c092c1b8dcd3d1245d638.1692607487.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308211744110.6458@ubuntu-linux-20-04-desktop>
References: <cover.1692607487.git.simone.ballarin@bugseng.com> <8ca21d49e7b95e788a4c092c1b8dcd3d1245d638.1692607487.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Aug 2023, Simone Ballarin wrote:
> This patch avoids the execution of pipelines in the
> following branches:
> - master
> - smoke
> - coverirty-tested/.*
> - stable-.*
> 
> The job-level exclusions have been removed as they are
> pointless with this new workspace-level exclusion.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - remove useless except clause in .yocto-test.
> ---
>  .gitlab-ci.yml                  |  6 ++++++
>  automation/gitlab-ci/build.yaml | 11 -----------
>  automation/gitlab-ci/test.yaml  |  5 -----
>  3 files changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ee5430b8b7..ef4484e09a 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,3 +1,9 @@
> +workflow:
> +  rules:
> +    - if: $CI_COMMIT_BRANCH =~ /^(master|smoke|^coverity-tested\/.*|stable-.*)$/
> +      when: never
> +    - when: always
> +
>  stages:
>    - analyze
>    - build
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 1a4a5e490d..b633facff4 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -12,11 +12,6 @@
>        - '*/*.log'
>      when: always
>    needs: []
> -  except:
> -    - master
> -    - smoke
> -    - /^coverity-tested\/.*/
> -    - /^stable-.*/
>  
>  .gcc-tmpl:
>    variables: &gcc
> @@ -214,11 +209,6 @@
>  .yocto-test:
>    stage: build
>    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> -  except:
> -    - master
> -    - smoke
> -    - /^coverity-tested\/.*/
> -    - /^stable-.*/
>    script:
>      - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD} ${YOCTO_OUTPUT}
>    variables:
> @@ -269,7 +259,6 @@
>  .test-jobs-artifact-common:
>    stage: build
>    needs: []
> -  except: !reference [.test-jobs-common, except]
>  
>  # Arm test artifacts
>  
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 810631bc46..8737f367c8 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -1,11 +1,6 @@
>  .test-jobs-common:
>    stage: test
>    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> -  except:
> -    - master
> -    - smoke
> -    - /^coverity-tested\/.*/
> -    - /^stable-.*/
>  
>  .arm64-test-needs: &arm64-test-needs
>    - alpine-3.18-arm64-rootfs-export
> -- 
> 2.34.1
> 

