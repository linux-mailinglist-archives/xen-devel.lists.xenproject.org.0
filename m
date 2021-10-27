Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C3343CB61
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 16:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216986.376803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfjSx-0002rl-KO; Wed, 27 Oct 2021 13:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216986.376803; Wed, 27 Oct 2021 13:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfjSx-0002pz-HD; Wed, 27 Oct 2021 13:59:43 +0000
Received: by outflank-mailman (input) for mailman id 216986;
 Wed, 27 Oct 2021 13:59:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yfZ=PP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mfjSw-0002pt-Cz
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 13:59:42 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2147d1eb-372e-11ec-8460-12813bfff9fa;
 Wed, 27 Oct 2021 13:59:41 +0000 (UTC)
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
X-Inumbo-ID: 2147d1eb-372e-11ec-8460-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635343181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QO3evD+5ru6SBtboebElv0wLrxWv04BBbpZkkqlAlPQ=;
  b=IhAhQHTt2+RUEODiqc/Y636IqPhOZMbpNXQRZS2h/Y1KctRLVmbfk2Lx
   X1SpOsd1Jfkw4NX1LMyo+k1zTgWqOCXtU7OSItwoIT8AqN41kFKm6oOJL
   GIVioy5uqA+asMQrE+QPlaP6HOzxLjJdwrS/Gk5RNfdzvsHEnILBRNG85
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2tUkm5hz3JYdCPGIFSIijTldf9nl0hyIjRtlnGloDs3Ccg7iAbOpWXORJLbKlb7ZV3QJ2aDipV
 U+iME93b8WPCnGFArq4vYqg9wIz3aWKcA5DOXcNgAfCsdu30aCuLIPO4mUZr9ABMcROe3bei62
 +U+fJwNopW+YR46K+jgACeLDLRJH+tMK0cwYKusM0Xe411/ESrdsItmJ9qodyXAkfpwvgS6yY9
 shtLsaS0LNOzc4CsLFYUtGmxyCB4PGQP2ks8GbkRYB+3sZFboIS3P6OVlhxor4fJMTz5voBmS3
 Pzem3vCiilzH7LzOyMk5NaZA
X-SBRS: 5.1
X-MesageID: 58289320
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1y4VFaDTeu1wdxVW/7Xkw5YqxClBgxIJ4kV8jS/XYbTApDx30GNRy
 GAcUD/SPvqDYDekf9oiao3i9EMPvJWGzII3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX550007wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/tCe7kfBsw
 sV06N+6dEAxNZyUxtwfekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjG1g15sURZ4yY
 eJBbiRfSiWdbydCYHkbIdVgg8OmqVXwJmgwRFW9+vNsvjm7IBZK+LPkKtbSd/SBTN9ZmUver
 WXDl0zmBjkKOdrZziCKmlq3muLBlCX8HpkOHbe18vprhly71m0XCRsGE1C8pJGRkVWiUthSL
 0gV/CsGrqUo8kGvCN7nUHWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc3Wj4Cx
 lKPh8nuBzFkrPuSU331y1uPhWrsY25PdzZEPHJaC1teizX+nG0tpi3dfNhDDaSlt4C2Ewy32
 zu79HYGhZxG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZ0+9pWGK2T9f3sQaDvJ6sOK7cFwPb5
 CFVxKBy+chXVcnV/BFhVtnhC11ACxytCzbbnUJ0V6co8zCg6hZPlqgBvWkgei+F3isCEAIFg
 XM/WysNu/e/31PwNMebhr5d7exwlcAM8vy+D5jpgiJmOMQZSeN+1HgGibSs927silMwtqo0J
 I2Wd82hZV5DV/86lmXtF71FiOd2rszb+Y81bcqjp/hA+eHHDEN5tJ9faAfeBgzHxPrcyOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3wYsTXvjLRzhsXrfbeGJOQTh5Y9eImO9JU9E1zsx9y7aTl
 lngCxAw9bYKrSCeQel8Qis4M+2HsFcWhS9TABHAyn7yhCd6Mdf1tf5OH3b1FJF+nNFeITdPZ
 6FtU6297j5nE2uvF+01YcavoYp8Wg6sgA7SbSOpbCJmJ8xrRhDT+8+idQzqrXFcAi2yvMo4g
 ruhygKEHsZTG1U8VJ7bOKC10le8nXkBg+YuDUHGFcZeJRf3+49wJi2v0vJue5MQKQ/Ozyex3
 hqNBUtKvvHEpoI4qYGbha2No4qzPfF5G05WQzvS4bqsbHGI9Wu/245QFu2PeGmFBm/z/ayjY
 8RTzu39b6JbzAob7dIkHu8yn6wk5tbpq7tL9SheHS3GPwaxF7dtAniaxs0T5KdD8aBU5FmtU
 UWV99gEZbjQYJH5EEQcLRYOZ/iY0a1GgSHb6Pk4LRmo5CJz+7bbA0xeMwPV1X5YJbpxdogk3
 f0gqIgd7Anm0kgmNdOPjyZ18WWQLyNfD/V7589CWIK72BA2zlxiYIDHDn6k6Z6CXNxAL002L
 2LGn6HFnbldmhLPfndb+aIhBgaBaUDiYCx38WI=
IronPort-HdrOrdr: A9a23:+5L9t6rDppiilzssayX6aWYaV5oreYIsimQD101hICG8cqSj+f
 xGuM5rsSMc6QxhPU3I9ursBEDtex/hHNtOkO4s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkZNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.87,186,1631592000"; 
   d="scan'208";a="58289320"
Date: Wed, 27 Oct 2021 14:59:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>,
	<cardoe@cardoe.com>, <wl@xen.org>, <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 3/3] automation: add a QEMU based x86_64 Dom0/DomU test
Message-ID: <YXlbOjiphjN/XqMz@perard>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-3-sstabellini@kernel.org>
 <YXK2lTWZHiTXIBtJ@perard>
 <alpine.DEB.2.21.2110221219520.2311@sstabellini-ThinkPad-T480s>
 <YXbXwjxHPNjSAKrG@perard>
 <alpine.DEB.2.21.2110251754210.4586@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110251754210.4586@sstabellini-ThinkPad-T480s>

On Mon, Oct 25, 2021 at 06:33:53PM -0700, Stefano Stabellini wrote:
> On Mon, 25 Oct 2021, Anthony PERARD wrote:
> > There is something I'm missing, how is it a problem to have a container
> > that is a bit bigger? What sort of problem could we have to deal with?
> 
> It takes time to clone the container in the gitlab-ci, the bigger the
> container the more time it takes. It is fetched over the network. Now we
> are fetching qemu (as part of the container) 10 times during the build
> although it is not needed.

I guess the issue would be more like we don't do enough caching with our
gitlab runners. So package installation is just a workaround.

> But we do have a severe problem at the moment with external sources: our
> "git clones" keep failing during the build on x86. That is definitely
> something worth improving (see my other email thread on the subject) and
> it is the main problem affecting gitlab-ci at the moment, I keep having
> to restart jobs almost daily to get the overall pipeline to "pass".
> 
> If you have any ideas on how to stop fetching things using "git" from
> external repositories in gitlab-ci that would be fantastic :-)
> The only thing I could think of to "fix it" is moving all external repos
> to gitlab repositories mirrors.

I don't think that would work, I've seen the initial clone/fetch of a
job fail as well, so from gitlab. If we could have a cache of those
external resources closer to the runners, that would be better.

> > > I am not entirely sure what is the best solution overall, but for this
> > > series at this stage I would prefer to keep the same strategy used for
> > > the ARM tests (i.e. reuse the debian unstable build container and
> > > apt-get the few missing packages.) If we do change the way we do it, I
> > > would rather change both x86 and ARM at the same time.
> > 
> > I'm pretty sure the best strategy would be to do as little as possible
> > during a job, download as little as possible and possibly cache as much
> > as possible and do as much as possible ahead of time. Feel free to
> > change the Arm test, but I don't think it is necessary to change the Arm
> > test at the same time as introducing an x86 test.
> 
> I agree.
> 
> At the same time it would be nice to follow the same strategy between
> x86 and ARM going forward: if one optimization is made for one, it is
> also made for the other.

Probably better, yes.

Thanks,

-- 
Anthony PERARD

