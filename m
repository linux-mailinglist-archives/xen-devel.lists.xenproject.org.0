Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C9494B7F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 11:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259011.446642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAUUH-00021x-8J; Thu, 20 Jan 2022 10:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259011.446642; Thu, 20 Jan 2022 10:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAUUH-0001zi-50; Thu, 20 Jan 2022 10:16:13 +0000
Received: by outflank-mailman (input) for mailman id 259011;
 Thu, 20 Jan 2022 10:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UD6j=SE=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nAUUF-0001zc-Vw
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 10:16:11 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb146737-79d9-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 11:16:10 +0100 (CET)
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
X-Inumbo-ID: fb146737-79d9-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642673769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ktOEAffOvuUAbiQjz89m46oAE0pAfVhfqNmOSlqF+Y=;
  b=Y8p3j8RGNMmq2uiPYOYz83BBYcTeC5hLlLnLQgrPNrbftz5kL22THRxE
   pcYeOJLOkg8KjrtpWEqsxUAqg5DO5gVQz2956hBJq3A+svfawUgLHxaki
   BARdlMD9+qLD9AkE9zrongBpLs8sh7dtVFHCPE22XSPQFEeSbg7BbmVaz
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AcKzM1i3MgHBuRm3fJraVDYE24bs8RZZf6Qp9+TA0diMTWl6L4zTtqCVzOn6QOW4Ts1e3nzqWC
 pir6Nd/4Va0/DS8z6t1rLCu9VJLore5Vi3YrV6jUNCk0bUWnqE3JxJNhNgUF5BTTVBMuoG8bVx
 PsZmiYmR40AJswZvDb1pRZW1zVjz9HVsfIjK8kJqPf1MaUsZbx9gqLBjKSit9oRMCDFjLDQon/
 ZW/BBxMRTX5QogQqi7/S1GJ1/8mClt+eTLWFuIe57itkWi1O6yF5cUenzgO+zCUSq6AwYL7api
 k+jpcp+ZTve1QCplYncIowCr
X-SBRS: 5.2
X-MesageID: 64536588
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:D43GL6DYAQmkNhVW/2jlw5YqxClBgxIJ4kV8jS/XYbTApDNwhGRWn
 WoZUDvTMvfeNzTxKI1zaInjo0hQu56EmNZlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En9400o7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/1TTWloh47
 8lx75mWFD8tAJXriNstTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcGgGpr2J0eTZ4yY
 eI+bz93UD/AQSdUJ29NIZYkovenq2bgJmgwRFW9+vNsvjm7IBZK+IbqNN3Za9mbX/J/l0yTp
 n/F12nhCxRcP9uaoRKa9lq8i+mJmjn0MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80iAjt7Qo/UqnCNz0RQSloWWstwQZHdFXFoUS6R6P4rrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kbjA/LT9tlOL64iJvyAz6Y/
 tyRhHFg3fNJ15dNjvjluwCc696xmnTXZlA0uQyPV0W50ll8QtOdY7KQzkjk3ekVee51UWK9l
 HQDnsGf6sUHApeMiDGBTY0xIV252xqWGGaC2AAyRvHN4xzooif+Jt4IvFmSMW8wap5cEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONl1H0/DaJz9zq0+KTJrU3ZE
 c3HGSpLJSxLYZmLNBLsG48gPUYDn0jSP1/7S5Hh1AiA2rGDfnOTQrptGALQMrpntfzU/FuJq
 oY32y62J/N3CrGWjs7/qtZ7ELz3BSJjWcCeRzJ/K4Zv3TaK6El+UqSMkNvNiqRunrhPl/egw
 51OchQw9bYLvlWecV/iQik6MNvHBM8jxVpmY3BEFQv2ihALPNb+hI9CJsBfVeR2q4ReIQtcE
 qNtlzOoWKofE1wqOl01MPHAkWCVXE373F3VZ3v8PmFXklwJb1Whx+IItzDHrEEmZhdbf+Nny
 1F5/g+EE5cFWSp4C8PaNKCmw1+r5CBPk+NuRUrYZNJUfRy0ooRtLiXwiN4xIt0NdkqflmfLi
 V7ODEdKv/TJrq807MLN2fKOobC2HrYsBUFdBWTas+q7bHGI4mq5zIZce++UZjSBBnjs8aCva
 LwNnfHxOfEKhnhQtI94H+o5xK4y/YK39bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQDYOeHIsLoFlIVNTEJVOXb2KFGgCTW4NQ0PF7+uH198o2YXBgAJBKLkiFccud4adt33
 ec7tccKwAWjkR52YM2ehyVZ+mnQfHwNV6Ir6sMTDIPx01d5z1hDZdrXCzPs4YHJYNJJaxF4L
 jiRjavEprJd2kudLCZjSSmThbJQ1cYUpRRH7F4ePFDYyNPKi8g+0ABV7TlqHB9eyQ9K0r4rN
 2VmX6GvyX5iI9u8aBB/Yl2R
IronPort-HdrOrdr: A9a23:s7BEvq8SvQrOlLQ/nENuk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,302,1635220800"; 
   d="scan'208";a="64536588"
Date: Thu, 20 Jan 2022 10:16:02 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 27/47] build: grab common EFI source files in arch
 specific dir
Message-ID: <Yek2YmixXsWWMQ/q@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-28-anthony.perard@citrix.com>
 <57f03aed-c260-1c80-c604-0223d4603b4a@suse.com>
 <YeafMh0du+5K8YDD@perard>
 <YebpHJk1JIArcdvW@perard>
 <2689b94b-7576-307c-0e2d-edd60354f161@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2689b94b-7576-307c-0e2d-edd60354f161@suse.com>

On Wed, Jan 19, 2022 at 08:46:09AM +0100, Jan Beulich wrote:
> On 18.01.2022 17:21, Anthony PERARD wrote:
> > The added "source/" depends on whether we do out-of-tree build or not.
> 
> Well, I guess we're free to add a "source => ." symlink even in the
> in-tree build case, deviating slightly from what Linux does? That
> would then slightly simplify your construct.

I'm not sure about that, but I can see only one issue with that: if one
was to use "source/" in a make rules (in target or prerequisite), make
would potentially have two different path leading to the same file when
running out-of-tree. But that shouldn't happen has we have "$(srctree)".
Currently, Kbuild doesn't remove "source" on distclean, but I guess we
can do that, which would avoid the potential issue.

I don't see other reason a link "source -> ." would be an issue, so I'll
add that to the patch "build: adding out-of-tree support to the xen
build".

Thanks,

-- 
Anthony PERARD

