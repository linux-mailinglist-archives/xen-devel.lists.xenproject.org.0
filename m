Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADF949FC6C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 16:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262078.454148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDSpe-0006V0-49; Fri, 28 Jan 2022 15:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262078.454148; Fri, 28 Jan 2022 15:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDSpe-0006SP-0Q; Fri, 28 Jan 2022 15:06:34 +0000
Received: by outflank-mailman (input) for mailman id 262078;
 Fri, 28 Jan 2022 15:06:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1b2=SM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nDSpc-0006SJ-Pz
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 15:06:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de926588-804b-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 16:06:31 +0100 (CET)
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
X-Inumbo-ID: de926588-804b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643382391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z7FEy7JRdaOkj6PsFW8SKUjjVhC9itzQQqFt7OhhQCc=;
  b=iUuXqE6mK+/WfiyFeMAUipS5o9I2rgrXZDHwSKiIOfCckwMZQIk6dHmF
   GilqDfWTlDwCLshXed6OW8kqR8aC3kQL3v++G+/ffJwOgzFzubzlk/bO2
   h7vm5GhH6SoDEJBHFrhlrV6PpWYV/k8x1N1Ait+Ns8jdnaY7E3uK7pluj
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hecgMeuv5LiQNuTPVuhHWjE+2Gjo9UZC9/XKzf7JaZIbLrZmJB+3xQqOtn05CPV/WdERH3Ckzd
 PRdI0Gm5vZUiwt9gTLq9d24CbXkX/fxviW9Pp6GwgmN1EuSl9NQLStFB4Dr216bZ64F0B1A5l9
 DENYNJEa7o660InMoFYtYW8TV4S4nX7qke7SFpJV+z0o9medn6UaCgDqq54GWErJBfQ47FN66r
 1HL+pV58uwoUarua1KUlLnH+woPOkUja+J2irS/f47dxKtzKwZhd8epNve/96QiSXHmPsmS4yp
 91MuqZsvtxP3uEd4bytVR+xB
X-SBRS: 5.2
X-MesageID: 63397348
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3Mb9RqzhwlGxOkplo1h6t+fhwSrEfRIJ4+MujC+fZmUNrF6WrkVRz
 WoZXW6PO6rYYzD3ctxwPoux8k1Tu5KHz9A2QAtr/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRp2tIAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+J39
 opp7Ia1cFoOYqLgwc8eEDBXAy4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JsVTKmFO
 5pxhTxHMxPdWhQMF1UsMosEwf2Ti2fjQzMFpwfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCntTz/cJIfEvu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYuXeQPN7Qg7TjQ7fbbz1+yBSstQS5OPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPc1
 JTjs5PGhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGokfx8ybJtcJG6Bj
 KrvVeV5vsE70JyCNvcfXm5MI55ykfiI+SrNCJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjmz+7bc2lnnyPjOrPDFbIGOxtGAbfMYgEAFas/V+9H
 yB3bZXakn2ykYTWP0HqzGLkBQladCdgXcGv9ZU/myzqClMOJVzNwsT5mdsJE7GJVYwMzrugE
 qiVVhAKxVzhq2fALAnWOHlvZKm2BcR0rG4hPDxqNlGtgiBxbYGq5aYZVp02Ybh4q7Azka8qF
 6EIK5eaH/BCajXb4DBBP5Pzm5NvKUawjgWUMiv7PDVmJ8x8RxbE88PPdxf08HVcFTK+sMYz+
 uXy1g7STZcZaR5lCcLaNKCmw1+r5CBPk+NuRUrYZNJUfRy0ooRtLiXwiN4xIt0NdkqflmfLi
 V7ODE5B9+fXooIz/N3Yvoy+rt+kQ7lkA05XP2jH9rLqZyPUyXWunN1bW+GScDGDCG6toPe+Z
 f9Yxu3XOeEcmAoYqJJ1FrtmwP5s59broLMGnA1oEG+SMgauA7JkZHKHwdNOputGwboA4Vm6X
 UeG+997P7SVOZy6TA5NdVR9NunTh+sJnjTy7OguJBSo7SB6y7OLTEFOMkTekydaNrZ0bNsoz
 OpJVBT6MOBjZs7G6uq7sx0=
IronPort-HdrOrdr: A9a23:ptFpsawVCHqgwhRNSFq5KrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="63397348"
Date: Fri, 28 Jan 2022 15:04:55 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v9 03/30] build: fix exported variable name
 CFLAGS_stack_boundary
Message-ID: <YfQGF0JHWcxQHwmy@perard>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-4-anthony.perard@citrix.com>
 <d729f897-6319-e82d-f953-c8411fde1e07@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d729f897-6319-e82d-f953-c8411fde1e07@suse.com>

On Fri, Jan 28, 2022 at 12:14:58PM +0100, Jan Beulich wrote:
> On 25.01.2022 12:00, Anthony PERARD wrote:
> > Exporting a variable with a dash doesn't work reliably, they may be
> > striped from the environment when calling a sub-make or sub-shell.
> > 
> > CFLAGS-stack-boundary start to be removed from env in patch "build:
> > set ALL_OBJS in main Makefile; move prelink.o to main Makefile" when
> > running `make "ALL_OBJS=.."` due to the addition of the quote. At
> > least in my empirical tests.
> > 
> > Fixes: 2740d96efd ("xen/build: have the root Makefile generates the CFLAGS")
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> While I did commit this, I'm still somewhat confused. How would quoting
> of elements on a make command line make a difference to which variables
> get exported?

I don't know, maybe without quote, make run sub-make directly, but with
double-quote, a shell is used.

But after reading the manual, I didn't expect the variable to be passed
down sub-make at all:

    5.7.2 Communicating Variables to a Sub-make

    Except by explicit request, make exports a variable only if it is
    either defined in the environment initially or set on the command
    line, and if its name consists only of letters, numbers, and
    underscores.

But somehow, sub-makes also export the non-shell-exportable variables,
unless the command line in a recipe invoking make has double-quotes.


I've tried again, and checked the process list:
  - when running `$(MAKE) -C foo`; make just execute make
  - when running `$(MAKE) -C 'foo'`; make just execute make
  - when running `$(MAKE) -C "foo"`; make execute /bin/sh -c ...
  - when running `$(MAKE) -C foo | tee`; make execute /bin/sh -c ...

So, CFLAGS-stack-boundary disappear when /bin/sh is involved.

> In any event I understand the description that prior to the subsequent
> change there's not actually any issue. Hence I'm not going to queue
> this for backporting despite the Fixes: tag. Unless of course I'm told
> otherwise (with justification).

Justification would be that it's not supposed to work, based on
information from make's manual.

Thanks,

-- 
Anthony PERARD

