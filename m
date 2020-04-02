Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EAE19C18F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 14:58:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJzO9-0005vm-Fm; Thu, 02 Apr 2020 12:56:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJzO7-0005vh-5L
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 12:56:03 +0000
X-Inumbo-ID: 4dd483fe-74e1-11ea-b58d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dd483fe-74e1-11ea-b58d-bc764e2007e4;
 Thu, 02 Apr 2020 12:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585832162;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=p0nro/otG9FvlcbRWEZTTq4craSZautD7iOq2tx3e4E=;
 b=DEEMEyYoz0OLr4ZRVpRcEtBMCrxiKjl5XalOxkSDZ8NMFZtOMfacnutD
 +a611sfGy1O7gMOo5q2AWLpG3nWnGcfRHIgt0oyRVUL4kVDuRrem+hqZ5
 +mJ3a0H1aTO4fSRQM9xgmbNBqsniK6wEdIPko4NYa1BUpjzuJJ+/cND8O 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YhJserJ4oif0agV9Yy0Udz2wB1yeV6J9pSg+383q2AEyH9vKpnEfvLkaQEFMQ808KAHpuq5l3b
 /QqxbUtP+pdx2cezN6NLROUVaB/Iec0uROqFUz32K61aKlf1S7XdvQ7v40XBxHP2wwJd3VSifG
 bluGpXTNqiJM6dUwDecixvvDQEeCJSBmgUdv99RBVrLswqmANu9ReSvf+NCe9ON8FpEed2IfZY
 qrZcuIpz6ShXqy50a4ocRrsXoAJnotuvFMGxjvmyN51eUWBS7s5n7Cmjbz3/GWdRzzUlbzmgLE
 sjg=
X-SBRS: 2.7
X-MesageID: 15047941
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,335,1580792400"; d="scan'208";a="15047941"
Subject: Re: 4.13: import xen.lowlevel.xc fails with SystemError: bad call
 flags
To: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>,
 <xen-devel@lists.xenproject.org>
References: <CABwOO=doPdSR1PUPLU-X2R6akDGRgBoqMv_wK_sPpkh9jF6kCQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <49bb60b5-d64b-393c-bdd2-a4024e695e6e@citrix.com>
Date: Thu, 2 Apr 2020 13:55:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CABwOO=doPdSR1PUPLU-X2R6akDGRgBoqMv_wK_sPpkh9jF6kCQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02/04/2020 13:43, Kevin Buckley wrote:
> Hello again,
>
> despite having built a Xen 4.13 with just Python3 on a
> Linux From Scratch system,
>
>   http://youvegotbuckleys.org.nz/LFS/LFS-BOOK.html
>
> specifically
>
>  http://youvegotbuckleys.org.nz/LFS/LFS-BOOK.html#ch-xen
>
>
> and booted into the Dom0 (Linux 5.5.3, GCC 9.2.0, Python 3.8.1)
> without issue, in coming to boot up a DomU, I get the following
> terse message
>
>
> ~ # cat /var/log/xen/bootloader.3.log
> Traceback (most recent call last):
>   File "/usr/lib/xen/bin/pygrub", line 21, in <module>
>     import xen.lowlevel.xc
> SystemError: bad call flags
> ~ #
>
> in the wake of these messages during the xl cretate's  pygrub boot:
>
>
> libxl: error: libxl_bootloader.c:648:bootloader_finished: Domain
> 3:bootloader failed - consult logfile /var/log/xen/bootloader.3.log
> libxl: error: libxl_exec.c:117:libxl_report_child_exitstatus:
> bootloader [766] exited with error status 1
> libxl: error: libxl_create.c:1420:domcreate_rebuild_done: Domain
> 3:cannot (re-)build domain: -3
> libxl: error: libxl_domain.c:1177:libxl__destroy_domid: Domain
> 3:Non-existant domain
> libxl: error: libxl_domain.c:1131:domain_destroy_callback: Domain
> 3:Unable to destroy guest
> libxl: error: libxl_domain.c:1058:domain_destroy_cb: Domain
> 3:Destruction of domain failed
> libxl: error: libxl_dom.c:40:libxl__domain_type: unable to get domain
> type for domid=3
> xl: unable to exec console client: No such file or directory
> libxl: error: libxl_exec.c:117:libxl_report_child_exitstatus: console
> child [767] exited with error status 1
>
>
> There's a suggestion out on the interweb thing that these
>
>   SystemError: bad call flags
>
> are something to do with Python 3.8, as in this thread I found
> when searching for the above:
>
> -------
> It's a bug in the Python binding of libcomps. I proposed a fix upstream:
> https://github.com/rpm-software-management/libcomps/pull/50
>
> Extract:
>
>> In Python 3.7, import didn't check descriptor flags (METH_KEYWORDS):
>> these flags were only checked when the methods were called.
>>
>> In Python 3.8, the flags are checked at soon as the module is imported,
>> which prevents the module to be imported.
> -------
>
> Is that likely to be what i am seeing?
>
> I had a gander at
>
> tools/python/xen/lowlevel/xc/xc.c
>
> tools/python/xen/lowlevel/xs/xc.c
>
> but it's not obvious to me where, presumably in,
>
> #if PY_MAJOR_VERSION >= 3
> #define INITERROR return NULL
> PyMODINIT_FUNC PyInit_xc(void)
> #else
> #define INITERROR return
> PyMODINIT_FUNC initxc(void)
> #endif
> {
>
> I could start to "play around" with any "descriptor flags"
>
>
> Any pointers welcome, including "it's not a Python 3.8 thing,
> you idiot" responses,

We've got a fix in staging

https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=e19b4b3b55f84e0cfcc02fe5d66965969a81c965

It hasn't been backported to the 4.13 stable tree yet.

~Andrew

