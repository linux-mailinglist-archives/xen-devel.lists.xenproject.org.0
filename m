Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37C14FFA13
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 17:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304220.518829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neetG-0005iQ-Ii; Wed, 13 Apr 2022 15:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304220.518829; Wed, 13 Apr 2022 15:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neetG-0005gX-FV; Wed, 13 Apr 2022 15:26:42 +0000
Received: by outflank-mailman (input) for mailman id 304220;
 Wed, 13 Apr 2022 15:26:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1neetE-0005gR-MM
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 15:26:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1neetD-0004dI-QV; Wed, 13 Apr 2022 15:26:39 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.7.236.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1neetD-0007EJ-Kp; Wed, 13 Apr 2022 15:26:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=L4dYL0a/ulyEmdUE8rKKVi2O351Wz5eo0sBy29tIeKI=; b=HG694bQvGyKDmt+9zuSF1P8X7M
	XsAw5ysMhb/XvG6wI39DSnX2BZocRvTShMezclN7YBfagsjz6k717FA9jy31EorQLSM3a39smKa7M
	McnQQ4MvydYxfqsooSU7MJCK3k6o1bgi9nT77lG9AS9Z+mgl6Q9PgZBJ6Tjh8jzULY7U=;
Message-ID: <9107705b-f34b-9cc2-83f5-24c254f53cbb@xen.org>
Date: Wed, 13 Apr 2022 16:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [xen-unstable-smoke test] 169361: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-169361-mainreport@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <osstest-169361-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/04/2022 15:48, osstest service owner wrote:
> flight 169361 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/169361/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   build-arm64-xsm               6 xen-build                fail REGR. vs. 169320

I think this is a transient network issue:

fatal: remote error: git-cache-proxy: git remote died with error exit 
code 1 // Fetching origin // remote: The git server, Gitaly, is not 
available at this time. Please contact your administrator. // fatal: 
unable to access 'https://gitlab.com/qemu-project/meson.git/': The 
requested URL returned error: 503 // error: Could not fetch origin
fatal: clone of 'https://gitlab.com/qemu-project/meson.git' into 
submodule path 
'/home/osstest/build.169361.build-arm64-xsm/xen/tools/qemu-xen-dir-remote/meson' 
failed
Failed to clone 'meson' a second time, aborting
/home/osstest/build.169361.build-arm64-xsm/xen/tools/qemu-xen-dir/scripts/git-submodule.sh: 
failed to update modules

Unable to automatically checkout GIT submodules ' ui/keycodemapdb meson 
tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone 
slirp'.
If you require use of an alternative GIT binary (for example to
enable use of a transparent proxy), then please specify it by
running configure by with the '--with-git' argument. e.g.

Cheers,

-- 
Julien Grall

