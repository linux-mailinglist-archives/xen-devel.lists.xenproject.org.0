Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150E64D7D4
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 09:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463154.721294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jhU-0002JZ-A6; Thu, 15 Dec 2022 08:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463154.721294; Thu, 15 Dec 2022 08:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jhU-0002H0-7S; Thu, 15 Dec 2022 08:34:44 +0000
Received: by outflank-mailman (input) for mailman id 463154;
 Thu, 15 Dec 2022 08:34:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5jhR-0002Gs-UP
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 08:34:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5jhQ-0004hF-Pl; Thu, 15 Dec 2022 08:34:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5jhQ-0008Nv-Kq; Thu, 15 Dec 2022 08:34:40 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=wNaKOAMuqBt2Sx4uwfjW2J9iq6uzgSPsaqC4p0LVqRo=; b=5dtQCx0UJPwTW87HvP/FIhpQCD
	oMDbXnrsxlX+5R6RsbDftAYIlwqkOX4nQ9xwKZERVxLQGh5rk1c0U+EHYevF3jNE7+ARDy9HZzy74
	xT4cUdIvwH/Zw7G2VNxk6C/sSoI3IYr9E5muK3ihoYWWKItjCePlI4PnaaxQglA6nUQo=;
Message-ID: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
Date: Thu, 15 Dec 2022 08:34:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [xen-unstable-smoke test] 175226: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Viresh Kumar <viresh.kumar@linaro.org>
References: <osstest-175226-mainreport@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <osstest-175226-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/12/2022 01:41, osstest service owner wrote:
> flight 175226 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/175226/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   build-armhf                   6 xen-build                fail REGR. vs. 175173

armhf/xen/tools/libs/light/../../../tools/config.h  -c -o libxl_genid.o 
libxl_genid.c
In file included from libxl_virtio.c:15:
libxl_virtio.c: In function 'libxl__set_xenstore_virtio':
libxl_internal.h:4388:51: error: format '%lu' expects argument of type 
'long unsigned int', but argument 3 has type 'uint64_t' {aka 'long long 
unsigned int'} [-Werror=format=]
  #define GCSPRINTF(fmt, ...) (libxl__sprintf((gc), (fmt), __VA_ARGS__))
                                                    ^~~~~
libxl_virtio.c:48:41: note: in expansion of macro 'GCSPRINTF'
      flexarray_append_pair(back, "base", GCSPRINTF("%lu", virtio->base));
                                          ^~~~~~~~~
libxl_internal.h:4388:51: error: format '%lu' expects argument of type 
'long unsigned int', but argument 3 has type 'uint64_t' {aka 'long long 
unsigned int'} [-Werror=format=]
  #define GCSPRINTF(fmt, ...) (libxl__sprintf((gc), (fmt), __VA_ARGS__))
                                                    ^~~~~
libxl_virtio.c:53:42: note: in expansion of macro 'GCSPRINTF'
      flexarray_append_pair(front, "base", GCSPRINTF("%lu", virtio->base));
                                           ^~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** 
[/home/osstest/build.175251.build-armhf/xen/tools/libs/light/../../../tools/Rules.mk:188: 
libxl_virtio.o] Error 1


This build breakage was introduced by "libxl: add support for generic 
virtio device". %lu will likely want to be switched to PRIx64.

Viresh, we need to unblock OSStest (our CI) as soon as possible. So can 
you look at it and confirm the rest of the tools build on arm32?

Cheers,

-- 
Julien Grall

