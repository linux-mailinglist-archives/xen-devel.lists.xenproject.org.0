Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED3664DC9C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 14:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463437.721617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5okp-0004jM-5O; Thu, 15 Dec 2022 13:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463437.721617; Thu, 15 Dec 2022 13:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5okp-0004gF-1V; Thu, 15 Dec 2022 13:58:31 +0000
Received: by outflank-mailman (input) for mailman id 463437;
 Thu, 15 Dec 2022 13:58:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQug=4N=citrix.com=prvs=341112f0b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p5okn-0004Y6-73
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 13:58:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c17a077-7c80-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 14:58:28 +0100 (CET)
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
X-Inumbo-ID: 8c17a077-7c80-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671112708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iy3wqSszruMtIFzyZkL9309ypW8PeGzxBiemXBA8rgQ=;
  b=UZ8LzD9cLBp7aO8m7T4kGm6bed30qUrxNKtzQh9mH6p0IMmw3kQ4ehFW
   Tqgu5dzRSNAaoEJY+X9yHe5weEWQnwaCKRnzYZOgXEIJR2oE7lBXwnWc9
   CwsV0CXAwlUAc9vmcW29HwZvKeruMW6y1LIYOZXNj3U3gFsTKYuTtrLZ/
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91035621
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IE5SEahIW7KfvAIn8Xcx+9NfX161WxAKZh0ujC45NGQN5FlHY01je
 htvCmyGO62Na2XzLoh/bY3g9B8D6J7UydMyTgc9/ytgRi4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5gaDzyV94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ8Ey1cbwqAgd7uze+2V9tji+ksb8n0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthfB/
 jmboT6gav0cHNCt7Dig1XaLv+uVzXryX94iLr+2yMc/1TV/wURMUUZLBDNXu8KRjVWlR99EN
 wkd9i8vq4Ai+UqzVN7/Uhak5nmesXY0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neXnsnkHjwps6CQQGi18raSpCm1fy8PIgcqZzIATAYDy8nupsc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV/4GA4AHGmTGqmsDEEwMo1Arac23m7hwsMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hz3oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9/y/Dpg4jfIUOPCdkTNrGwkwDXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgmjqLGcqlkkX9j+D2iJuppVEtagPmggcRtfPsneko2
 4wHa5viJ+t3DoUSnRU7AaZMdAtXfBDX9Lj9qtBNd/7rH+aVMDhJNhMl+pt4I9YNt/0Mxo/1E
 oSVBhcwJKzX2SeWdm1nqxlLNNvSYHqIhSlmYnd2YA/xhCdLjETGxP53SqbbtIIPrIRLpcOYh
 dFcEylcKpyjkgj6xgk=
IronPort-HdrOrdr: A9a23:yb/RcaA82ExBgHnlHejpsceALOsnbusQ8zAXPiFKOGlom6mj/K
 6TdZsgtSMc9wxhJE3I9ergBEDiewKuyXcK2/hyAV7KZmCP0ldAR7sSjrcKrQeQfhEX/YZmpN
 hdm8AVMrHN5TMRt6nHCMbTKbsd6ejCyYTtodr3i05qSwQCUdAT0++6YDzrbHGfgGN9dOoE/F
 /33Ls3m9PaQwVyUu2LQkMdWvTFpZnijYuOW29+OzcXrDOWiC+u6vrQDxic034lIk5y6IZny3
 HBjwv6ooKqt/3T8G6660bjq65OncfnyJ9kGsuBkaEuW1PRozftXp1lR7qB+AoUjYiUmS4Xue
 iJmQ4kI8Nwr0ncZX64ujzk3wWI6kdU11bSjWWAhGflo4jHSCkhC8xH7LgpCCfk1w==
X-IronPort-AV: E=Sophos;i="5.96,247,1665460800"; 
   d="scan'208";a="91035621"
Date: Thu, 15 Dec 2022 13:58:16 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: Julien Grall <julien@xen.org>, osstest service owner
	<osstest-admin@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [xen-unstable-smoke test] 175226: regressions - FAIL
Message-ID: <Y5sn+FgartHoFgnu@perard.uk.xensource.com>
References: <osstest-175226-mainreport@xen.org>
 <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
 <20221215133303.hlgm2hkzge3jh6zr@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221215133303.hlgm2hkzge3jh6zr@vireshk-i7>

On Thu, Dec 15, 2022 at 07:03:03PM +0530, Viresh Kumar wrote:
> On 15-12-22, 08:34, Julien Grall wrote:
> > This build breakage was introduced by "libxl: add support for generic virtio
> > device". %lu will likely want to be switched to PRIx64.
> > 
> > Viresh, we need to unblock OSStest (our CI) as soon as possible. So can you
> > look at it and confirm the rest of the tools build on arm32?
> 
> I am trying 32 bit build for the first time today and still haven't
> got it fully working. I have sent a patch though which shall fix
> this issue, will keep on getting the 32 bit build up and running.

You could just use our containers (that Gitlab CI uses) and run
something like that:

    CONTAINER=registry.gitlab.com/xen-project/xen/debian:unstable-i386 automation/scripts/containerize env XEN_TARGET_ARCH=x86_32 debug=n CC=gcc CXX=g++ automation/scripts/build

That would be something similar to what Gitlab CI is running.
And to get a shell:
    CONTAINER=registry.gitlab.com/xen-project/xen/debian:unstable-i386 automation/scripts/containerize

Cheers,

-- 
Anthony PERARD

