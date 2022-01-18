Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D67492589
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 13:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258466.445139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9nOH-0004LW-M4; Tue, 18 Jan 2022 12:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258466.445139; Tue, 18 Jan 2022 12:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9nOH-0004Iz-I2; Tue, 18 Jan 2022 12:15:09 +0000
Received: by outflank-mailman (input) for mailman id 258466;
 Tue, 18 Jan 2022 12:15:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BW1=SC=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n9nOG-0004It-8g
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 12:15:08 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44c4fa5e-7858-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 13:15:06 +0100 (CET)
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
X-Inumbo-ID: 44c4fa5e-7858-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642508106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OCBpBS1RS9kF2/KyjcHxkiDJe6gxmB9kFBdnfVPdVfQ=;
  b=QEBo7mHmQV54tRPbaNxfz/iRWkcb91FhydVJOfO5O9ShPlKr8KHRZsTl
   W5W+zZB0buFvkc9ytL82WPSopVbVl03GW+sWk4btfChcngnYrf74F7B+c
   kfFveF6B0XgXta7NAZx7CsBc/VKDzG44Ffg94CXR3peab8pvV6UaBRgAc
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: C1cXWPd3E0f8AL5RvYKrrsn30z8pGBeF9ZE5+D1ysIeH+cEJ/2JmBwGbTVpByC/tMmhqzvMEY3
 rBl9KwbNPuzfbSHeryA3htloNtUtoUEI9y0QksXW948bcwfD5x1G93oWgrultdvWNkxhgT+bZK
 B6oZmPZ6GUH6iduphZTynFOClweCPcyYM7RsoTVCEyc43kmP3Yp9+rom5BKCBSpI8ww7rhWwZu
 dqcgV+yMaKVgowdkXhlsIcx/9G02+b4kKOK32eQcEjqgm948YcHlfjtiddDO+8KBGGQCfL67gm
 HJfGJU1OgGpAYayCDkbPh+EB
X-SBRS: 5.2
X-MesageID: 64347479
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:taE2WaMm9QMsA3zvrR0ukMFynXyQoLVcMsEvi/4bfWQNrUog1z0Ay
 zdOCm/QaPyKNGf3fNB0YNzg9R8Bu5TdzdNgQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Eszw7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo22bgtpg8
 I5ij4SPeCsvZfH3v/Q7AjANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgmtr2p8SQqe2i
 8wxOR9rK0iRYwx2J15HLYMMv8KIjSj6SmgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSAzRKV/3TqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 04e9zcqrKMy3Fe2VdS7VBq9yFaFoRw0S9dWC/c96gyG1uzT+QnxLmoZSj9MbvQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHE9lteJBT5M0dadzIOXDNezOP7n7AfiEmTdfFzNv+c24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodd7BFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gNuFmSx28za67onAMFh
 meJ5mu9A7cJbROXgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgTy3zBRwwP9jY
 s3GGSpJMZr8If44pNZRb71MuYLHOwhknT+DLXwF50nPPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPRoyizpNbWO3GNmaZKdAhiBSFiWfje9pILHsbefFsOMDxxWpf5nOJ6E6Q4zvs9qws91
 iznMqOu4ACh1SSvxMTjQi0LVY4Dqr4k/C1rZnJ9bA/4s5XhCK72hJoim1IMVeFP3IReITRcF
 pHpou2MXaZCTCrp4TMYYcWvpYBubk3z1wmPIzCkcH40eJs5H17F/drtfw3O8igSD3Xo6Zti8
 uP4jg6LE4AeQwlCDdrNbK79xV2GonVAyvl5WFHFI4cPdRy0opRqMSH4ktQ+P9oIdUfY3jKf2
 gvPWUUYqODBrpUb6t7MgazY/Y6lH/EnRhhRHnXB7KbwPi7fpzLxzYhFWeeOXDbcSGKrp/nyO
 bQLl6nxaaRVkkxLvoxwF6dQ4Zg/v9a/9aVHyglEHWnQawj5AL1XPXTbj9JEsbdAx+EFtFLuC
 F6P4NRTJZ6AJNjhTAwKPAMgY+mOiaMUlz3V4ahnKUn2/nYqrr+OUEEUNBiQki1NarByNdp9k
 +smvccX7S25iwYrbYna3nwFqTzUIyxSSbgju7EbHJTv21gixVx1aJDBDjP7vcOUYNJWP0h2e
 jKZicIuXViHKpYup5brKUXw4A==
IronPort-HdrOrdr: A9a23:yHVYxK19ThJ4wtZ/vCi2RQqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="64347479"
Date: Tue, 18 Jan 2022 12:14:59 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 31/47] build: specify source tree in include/ for
 prerequisite
Message-ID: <YeavQyhA9VdKEpuh@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-32-anthony.perard@citrix.com>
 <a8045db2-a647-fc5b-0c98-890edce10dc8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a8045db2-a647-fc5b-0c98-890edce10dc8@suse.com>

On Tue, Dec 21, 2021 at 03:16:25PM +0100, Jan Beulich wrote:
> On 25.11.2021 14:39, Anthony PERARD wrote:
> > When doing an out-of-tree build, and thus setting VPATH,
> > GNU Make 3.81 on Ubuntu Trusty complains about Circular dependency of
> > include/Makefile and include/xlat.lst and drop them. The build fails
> > later due to headers malformed.
> 
> A circular dependency would mean that besides the expected dependency
> there is also one of include/Makefile on include/xlat.lst. Where is
> that? I'm not aware of anything include/Makefile depends on. Is there
> any dependency being introduced in this series, perhaps by way of new
> (generated) dependency files? It would be good to have a clear
> understanding of the issue - as you describe it, it could as well be
> a make flaw.

I've got a bunch of:
make[2]: Circular include/compat/arch-x86_32.i <- include/Makefile dependency dropped.


Maybe the issue is with:
    make[2]: Circular include/compat/.xlat/arch-x86/pmu.lst <- include/xlat.lst dependency dropped.
    make[2]: Circular include/compat/.xlat/arch-x86/pmu.lst <- include/Makefile dependency dropped.

with rule
     $(obj)/compat/.xlat/%.lst:  $(src)/xlat.lst $(src)/Makefile

at that mean %.lst have no prerequisite left, so $< is empty in
"grep pattern $<" so there's nothing to grep.

But that doesn't happen every time.

I can't think of anything or find anything which would introduce a
prerequisite for "xlat.lst".

The build seems to work if I only change this rule, to avoid make
looking into VPATH to find $(src)/xlat.lst. Changing this to
"$(srcdir)/xlat.lst" works. But of course, make still complain about
circular dependencies on include/Makefile.

I think I've look for this issue online at the time, but I probably
found the workaround rather than a bug report.

Cheers,

-- 
Anthony PERARD

