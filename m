Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C03F66E429
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 17:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479621.743580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHpFa-0001BY-Ia; Tue, 17 Jan 2023 16:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479621.743580; Tue, 17 Jan 2023 16:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHpFa-00019k-FY; Tue, 17 Jan 2023 16:55:54 +0000
Received: by outflank-mailman (input) for mailman id 479621;
 Tue, 17 Jan 2023 16:55:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sgDM=5O=citrix.com=prvs=374aff589=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pHpFY-00019b-RH
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 16:55:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb311129-9687-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 17:55:51 +0100 (CET)
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
X-Inumbo-ID: cb311129-9687-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673974550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gk+2bwqbVv+3ZSL50/GVf7VB0UR/zK7MJKki0suyuRQ=;
  b=TXNfRF5GrzP/y4Unbh5051Kf0aZYIJHOoqzphOp/t4tGUnfSBCWshnlE
   aosN70WjWZQ10ybc0pKu2tyfIcokTfclANDnBygS8FlvLbDH8obtOam+4
   Bp11zXj0FWBZ0TVDPRuHhDzlnqQN0ctzc66Zb6vlGSSJ2K4pSMoWTDcZb
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92998965
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:SNXmAKlC9EM5CaJpe35kY9no5gy5JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXCj3VO/nYMGakco1yPY208kgFsJTWyN9lTwRpqCBmQyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgS5QCGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cQgDitXRyCvvtiR27WlCe41vukcJ8a+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthfC9
 zOWrjqkav0cHOKGmACEwl2Dvc6Mkyj8eroVNpuTytc/1TV/wURMUUZLBDNXu8KRrlO1UpRxI
 kof9y4qsIA77kntRd74NzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqf67OVoDWaKSUTa2gYakcsVhAZ6tPupIUyiBPnTdt5FqOxyNrvFlnY3
 DSivCU4wbIJgqY2O76TpA6dxWj2/96QE1Bzv1+MNo640u9nTLadQZfywGj31MxnN4GHDV7Yh
 FU7kMfLuYjiEqqxeDyxrPQlRe/2vKffamWD0TaDDLF6qW3zpifLkZR4pWgneRw3aptslSrBO
 he7hO9H2HNE0JJGh4dTapn5NcklxLOI+T/NBqGNNYomjnScmWa6EMBSia24hTqFfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8+gn0X7ierPPS/OIVvgDLdpRrlphJ5oXS2Pq
 4oPXyd040g3vBLCjtn/rtdIcAFiwYkTDpHqsc1HHtNv0SI/cFzN/8T5mOt7E6Q8xvQ9qws91
 i3lMqOu4Aal1CKvxMTjQiwLVY4Dqr4k9ChnZ3ZyZw33s5XhCK72hJoim1IMVeFP3IReITRcF
 JHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:foVIpqvS79aAEWNCwURQ2egA7skDhtV00zEX/kB9WHVpm6yj+v
 xG/c5rsiMc7Qx6ZJhOo7+90cW7L080sKQFgrX5Xo3SODUO2lHJEGgK1+KLrwEIWReOlNK1vZ
 0KT0EUMqyUMbEVt6fHCAnTKadd/DGEmprY+ts3GR1WPH9Xg6IL1XYJNu6CeHcGIjWvnfACZe
 ChDswsnUvYRV0nKv6VK1MiROb5q9jChPvdEGM7705O0nj3sduwgoSKaCSl4g==
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="92998965"
Date: Tue, 17 Jan 2023 16:55:39 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Message-ID: <Y8bTC3Ftr494imCr@perard.uk.xensource.com>
References: <20230116181048.30704-1-anthony.perard@citrix.com>
 <20230116181048.30704-2-anthony.perard@citrix.com>
 <399DE18D-39B4-4BC6-940F-09864D4BEEE5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <399DE18D-39B4-4BC6-940F-09864D4BEEE5@arm.com>

On Tue, Jan 17, 2023 at 04:07:24PM +0000, Luca Fancellu wrote:
> > On 16 Jan 2023, at 18:10, Anthony PERARD <anthony.perard@citrix.com> wrote:
> > diff --git a/xen/tools/compat-xlat-header.py b/xen/tools/compat-xlat-header.py
> > new file mode 100644
> > index 0000000000..c1b361ac56
> > --- /dev/null
> > +++ b/xen/tools/compat-xlat-header.py
> > @@ -0,0 +1,468 @@
> > +#!/usr/bin/env python
> 
> Would it make sense to start with python3 since it is a new script?

That shebang isn't even used as the script doesn't even have the
execution bit set. So why do you say that the script isn't python3? Not
really asking, just been pedantic :-)

Even if it's a new script, it isn't a new project. We can't depend on
brand new functionality from our dependencies. We need to be able to
build the hypervisor with old build toolchain / distribution.

Anyway, I did start by writing a python3 script in all its glory (or at
least some of the new part of the language that I know about), but I had
to rework it to be able to use it on older distribution. Our centos7
container in our GitLab CI seems to use python2.7.

So I had to stop using str.removeprefix() and I introduce some function
doing the same thing instead (so that works with older than python 3.9).
Then I had to stop using f-strings and use %-formatting instead.
Then use "m.groups()[0]" instead of "m[1]" where "m" is a match result
from re.match() and other.
And use the classing "from __future__ ..." preamble.

Cheers,

-- 
Anthony PERARD

