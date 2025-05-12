Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45410AB4532
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 21:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982104.1368651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZAN-00042j-ED; Mon, 12 May 2025 19:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982104.1368651; Mon, 12 May 2025 19:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZAN-00040B-Aw; Mon, 12 May 2025 19:50:23 +0000
Received: by outflank-mailman (input) for mailman id 982104;
 Mon, 12 May 2025 19:50:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KLgg=X4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uEZAM-000405-HP
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 19:50:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53b2efc8-2f6a-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 21:50:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2AE8BA4C85A;
 Mon, 12 May 2025 19:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD54C4CEE7;
 Mon, 12 May 2025 19:50:15 +0000 (UTC)
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
X-Inumbo-ID: 53b2efc8-2f6a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747079415;
	bh=tzLoLPXmHPCenoM8r3SLFf2RIKA16WxDCw5Blsv9Zlw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lAj2d16fwvaH1yY0o7wiVCiYsQRnt/Z8vaLlUHHIbh05nRBH5ki4C8rAQ4tKcalRU
	 73hH+fWdFtQL7pRTWPqKq4uNpID1thLV15ZGFwOVdCOpIjElhfgQT49szOVVQDgmuK
	 VBIOR2J1XCP9DqVTD7pbYgXUbOeKFA3JwLUc8e/04zEizy5ZGf9MnbIyX38L8QdsPQ
	 DVF7r1TRypC6gndhHrZmPRbVyww0K7LgQbBOoq1+YjDpMA2wiWzq77KoWs5kFl+NOx
	 RKsPbDfegChp1Gybc0xLLc6JJAYdJmAKLJeiLshAdeFuTxy0jboOHgjSschWH8sQwh
	 KEIkdYk+7lkoQ==
Date: Mon, 12 May 2025 12:50:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [RFC PATCH v3 2/2] ci: enable fuzzing for arm64
In-Reply-To: <87plgdd4s1.fsf@epam.com>
Message-ID: <alpine.DEB.2.22.394.2505121249580.8380@ubuntu-linux-20-04-desktop>
References: <20250507095338.735228-1-volodymyr_babchuk@epam.com> <20250507095338.735228-3-volodymyr_babchuk@epam.com> <alpine.DEB.2.22.394.2505091445030.3879245@ubuntu-linux-20-04-desktop> <87plgdd4s1.fsf@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 May 2025, Volodymyr Babchuk wrote:
> Hi Stefano,
> 
> 
> Stefano Stabellini <sstabellini@kernel.org> writes:
> 
> > On Wed, 7 May 2025, Volodymyr Babchuk wrote:
> 
> >>  alpine-3.18-gcc-debug-arm64:
> >> +  extends: .gcc-arm64-build-debug
> >> +  variables:
> >> +    CONTAINER: alpine:3.18-arm64v8
> >> +    EXTRA_XEN_CONFIG: |
> >> +      CONFIG_UBSAN=y
> >> +      CONFIG_UBSAN_FATAL=
> >
> > The diff is strange and I might be wrong, but it looks like this should
> > be CONFIG_UBSAN_FATAL=y
> 
> Yes, looks like a mistake from my side.
> 
> >
> >> +alpine-3.18-gcc-fuzzing-arm64:
> >>    extends: .gcc-arm64-build-debug
> >>    variables:
> >>      CONTAINER: alpine:3.18-arm64v8
> >>      EXTRA_XEN_CONFIG: |
> >>        CONFIG_UBSAN=y
> >>        CONFIG_UBSAN_FATAL=y
> >> +      CONFIG_FUZZING=y
> >> +      CONFIG_FUZZER_LIBAFL_QEMU=y
> >> +      CONFIG_FUZZER_PASS_BLOCKING=y
> >>  
> >>  alpine-3.18-gcc-arm64-randconfig:
> >>    extends: .gcc-arm64-build
> >> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> >> index a603d4039a..bb8670026f 100644
> >> --- a/automation/gitlab-ci/test.yaml
> >> +++ b/automation/gitlab-ci/test.yaml
> >> @@ -197,6 +197,30 @@
> >>    tags:
> >>      - qubes-hw11
> >>  
> >> +.fuzzer-arm:
> >> +  stage: test
> >> +  image: xentroops/xen-fuzzer:v1
> >> +  variables:
> >> +    HARNESS: hypercall
> >> +    FUZZING_TIME: 600
> >> +  rules:
> >> +  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> >> +  - if: $SELECTED_JOBS_ONLY
> >> +    when: never
> >> +  - when: on_success
> >> +  script:
> >> +    - cd /root/
> >> +    - ./xen_fuzzer -t ${FUZZING_TIME} run ${CI_PROJECT_DIR}/binaries/xen test-mmu64le-arm-${HARNESS}-fuzzer 2>&1 | tee ${CI_PROJECT_DIR}/fuzzer-${HARNESS}.log
> >
> > Can you run it from outside the directory, like this?
> >
> > /root/xen_fuzzer -t ...
> >
> 
> Well, right now it is looking for some QEMU files, like firmware image,
> relatively to ${CWD}. It is possible to provide the full QEMU
> command line along with -L option and then we will be able to run
> it from anywhere, but, IMO, it is easier to just change directory.

OK


> >> +  after_script:
> >> +    - cd ${CI_PROJECT_DIR}
> >> +    - mv /root/crashes .
> >
> > Also here you could probably do:
> >
> > mv /root/crashes ${CI_PROJECT_DIR}
> >
> 
> Yes, agree.
> 
> 
> -- 
> WBR, Volodymyr

