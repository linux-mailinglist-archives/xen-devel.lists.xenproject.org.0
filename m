Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7774BA544
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 16:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274880.470502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjB9-0007Mm-Hc; Thu, 17 Feb 2022 15:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274880.470502; Thu, 17 Feb 2022 15:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjB9-0007Jp-Dx; Thu, 17 Feb 2022 15:58:47 +0000
Received: by outflank-mailman (input) for mailman id 274880;
 Thu, 17 Feb 2022 15:58:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzVd=TA=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nKjB7-00078y-9a
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 15:58:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a100682-900a-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 16:58:43 +0100 (CET)
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
X-Inumbo-ID: 7a100682-900a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645113523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7vDmYNMG7ZomJStg1puDXZbYX7r23zfLVP7LyhkGS+8=;
  b=FPPTAsnHmGgzaORvrrKjHSe9zGvMcuT1uin66b42BKgRH13gn+Jjt4ao
   Ets0XdVWWTjDm7cklTHCdSzzgIbXHF+F2WSVGx6SolemVzstRcGJuGEZ2
   4a2xBYuLRAfwSJfza6Iuvp4Y65sQIZV3rd949fZi8OoRLALkoBgQw67/m
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: aVbdd8Cqg1GvyoqlbC0TBHxYVYiDqzEhtzAFShveLdnnQXY+sBbSDx7OnwyLUtBFCFulGGUJ6q
 wWU+gGmLFTAGKmDAZ5BUYC5DWdOtJj+rDsjv8M/DzDVntjrYxKt7CDKeSPPfZc4KkG9L0/oh5l
 y84AATyktHWj9puG+PEZULaNUuE1jjKU84MatIVeRll7sAlzMtdYeUS1ekdcXScOgaOuFWcLO7
 wkiT91iCyWd6uQMNx5g8XSHdPVGWtn3Ebh9y3IL383HfXtksZAhJ/U+txwxFaxJeA0NwvjjvA8
 urwCxGLutKl43mOmzsO0kTAH
X-SBRS: 5.1
X-MesageID: 66687161
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Wj7mjaocTefr5xGdmxvVGHKNcbVeBmK4YhIvgKrLsJaIsI4StFCzt
 garIBnTa/mKNDanfoglbNu1oBgDvpHXnNZqG1c/pHg0FyNEpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnd+oVhoHbr3doc82AjgETAtCI5QB+ZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZRHOWU2Mk2ojxtnYQcJK8xjjt2S3niuS21b9UKQvIZqyj2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkkM9iYxSuA42ibrObFliPmW6ofDLS9sPVthTW7zGEJFAcfU1f9pPCjk1O/QPpWM
 UlS8S0rxYAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vrGDhuvbu9WX+bsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uTvkjYnhz8tonwZSVkx1mIdF6710R4TdvwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yP7JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiIP7KigbArLWdrGR2Cg2bKgAgBd2B2zMkC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+bDPCXKF+tYawTTBgzc0E9iiF+Km
 zq4H5HXoyizrcWkOnWHmWLtBQtiwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNyAyAJuyDM0XhS9qYkQR0aOAhiFLjXCHt/xEKfPavNAPqYRe8BKDZ
 6JUIZreXKUUG2+vFvZ0RcCVkbGOvS+D3WqmVxdJqhBmF3K5bwCWqNLiYCX18ywCUni+ucck+
 uXy3QLHW5sTAQ9lCZ+OOv6oylqwu1kbmf5zABSUcoUCJh20/dg4MTH1g982P9oIdUfJyAyF2
 lvEGhwfv+TM/dM4qYGbmaCeoo61OOJiBU4GTXLD5LO7OHCCrGquyINNSsiSejXZWD+m8amuf
 7wNnfr9LOcGjBBBtI8lS+Rnyqc35t3Oob5Gz1s7QCWXPgrzUr45eyuIx8hCsKFJ14R1gwruV
 xLd4MReNJWIJNjhTAwbKj06Y7nRzvoTgDTTs6g4eR2o+C9t8bObekxOJB3Q2jdFJb54PY55k
 +csvMkat162hhYwa4vUiylV8yKHL2AaUrVhvZYfWde5hg0uw1BEQJrdFi6pv83fN4QSahEnc
 m2Oma7Pp7VA3U6TIXM8GE/E0fdZmZlT6gtBy0UPJgjRl9fI7hPtMMa9Ldjjotxp8yh6
IronPort-HdrOrdr: A9a23:wbASVq0TZM9x+vcvNPQsWwqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,376,1635220800"; 
   d="scan'208";a="66687161"
Date: Thu, 17 Feb 2022 15:58:36 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>
Subject: Ping: [XEN PATCH v9 04/30] build: set ALL_OBJS in main Makefile;
 move prelink.o to main Makefile
Message-ID: <Yg5wrGAhJ/+kMPcU@perard.uk.xensource.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-5-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220125110103.3527686-5-anthony.perard@citrix.com>

Hi Julien, Stefano,

This patch has some changes to the Arm makefiles. Could you have a quick
look or ack the changes?

They are some other patches in the series which might want a Arm ack:
- 20/30 build: rework "clean" to clean from the root dir
- 24/30 build: grab common EFI source files in arch specific dir
- 25/30 build: replace $(BASEDIR) by $(objtree)

Cheers.

On Tue, Jan 25, 2022 at 11:00:37AM +0000, Anthony PERARD wrote:
> This is to avoid arch/$arch/Makefile having to recurse into parents
> directories.
> 
> This avoid duplication of the logic to build prelink.o between arches.
> 
> In order to do that, we cut the $(TARGET) target in the main Makefile in
> two, there is a "prepare" phase/target runned before starting to build
> "prelink.o" which will prepare "include/" among other things, then all
> the $(ALL_OBJS) will be generated in order to build "prelink.o" and
> finally $(TARGET) will be generated by calling into "arch/*/" to make
> $(TARGET).
> 
> Now we don't need to prefix $(ALL_OBJS) with $(BASEDIR) as it is now
> only used from the main Makefile. Other changes is to use "$<" instead
> of spelling "prelink.o" in the target "$(TARGET)" in both
> arch/*/Makefile.
> 
> Beside "prelink.o" been at a different location, no other functional
> change intended.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
>  xen/Makefile          | 12 +++++++++++-
>  xen/Rules.mk          | 13 -------------
>  xen/arch/arm/Makefile | 31 ++++---------------------------
>  xen/arch/arm/Rules.mk |  4 ++++
>  xen/arch/arm/arch.mk  |  2 ++
>  xen/arch/x86/Makefile | 29 ++++++-----------------------
>  xen/arch/x86/arch.mk  |  2 ++
>  xen/build.mk          | 18 ++++++++++++++++++
>  8 files changed, 47 insertions(+), 64 deletions(-)

-- 
Anthony PERARD

