Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F36E4748EF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246964.425942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBJO-0007OD-VM; Tue, 14 Dec 2021 17:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246964.425942; Tue, 14 Dec 2021 17:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBJO-0007M4-Re; Tue, 14 Dec 2021 17:09:58 +0000
Received: by outflank-mailman (input) for mailman id 246964;
 Tue, 14 Dec 2021 17:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q7Ra=Q7=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mxBJN-0007Lr-NL
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:09:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4404363-5d00-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 18:09:49 +0100 (CET)
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
X-Inumbo-ID: a4404363-5d00-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639501795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8hn57TMkA5v9dIzqrpDBV1g9Ok9lBo7N43dr/HPID7I=;
  b=HxRnK7zr7h6qyoZdwv+DoACJ4ewbQRkWYlBiRMnriJUp30G9JSXjByyD
   ErutfxpM60rp3Tfe703ef/KT3iYYxgMBHujTQxx9xkyvamgjk+vBfQVUB
   ATWipnmNPH6421gR3kfUstqRNGKtvgSO1ipx+KA6immRol+OUxL9ZQ9Lw
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: P19R1AKNmumojWfJZeb306TR1taRhAj7QWHpS+SKSk7jJTrkm1+Ne7v55m1luAg0kcA2UsovSK
 +vd0/lctz3qfpi+bCjPOR7IorXjB9xU/JChLhofKv5+iQ7tU8K/HhZ1NVZ3485s8X1SYGs4q7C
 0V0uG5LaB8AdPHK2FsxojV0Ca3woyZY2oGpFLlaXgD299OeU17tf+VLJ9NeKOciDl1datyDBmM
 2YJTJukn5NpTiinVZ4shT1Ft7JMBmQJPvTe+bHeUPVhQUZZ3dyWG1FVF0xCytf2IVVWEvTTozj
 1w1erCXT8kaNgYP1cshfxHRp
X-SBRS: 5.1
X-MesageID: 59506316
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SDRZCapAuT7BxfcOYzrOe0M6/mJeBmKnYhIvgKrLsJaIsI4StFCzt
 garIBmCPvaPYmD9co1zOonn8EMOucWByoU3QQM++yA0RXtG8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2Ncx24HlW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZmpVjt4ZPfNo/4MQjl2TXEmH5BGu6CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ptEMWQ0NUqojxtnHgYsGJY/lteU2TrAUCxBilOu4qEv/D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkBL8CWwzeB9nOqh8fMkDn9VYZUE6e3ntZgjUeP3GUVBFsTXEGivPiiokekXpRUL
 El80hQpqa8+5Um6VO7XVhezoGOHlhMEUt8WGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmL+ITXOQ8J+EoDX0PjIaRUcDei0sXQYD+8Pkoow4klTIVNkLOKy/g8DxGDrw6
 yuXtyV4jLIW5fPnzI3iowqB2Wj14MGUEEhlvW07Q15J8Ct8fZGZNtby6GPB/OdgAtjJFnu8v
 Dsbzp32AP81MbmBkymEQeMoFb6v5uqYPDC0vWODD6XN5Bz2pSf9INk4DCVWYR4wb51aIWOBj
 Fr74FsJvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBcmBwwcnT2
 r/BKK5A6Er274w9k1JaoM9HjtcWKtgWnz+7eHwC503PPUCiTHCUU6wZF1CFc/o06qiJyC2Mr
 Y0Oa5HTk0gBD7yuCsUyzWL1BQpVRZTcLcqpw/G7i8bZelY2cI3fI6G5LUwdl3xNwP0Oy7agE
 oCVUU5E0lvv7UAr2i3RAk2PnIjHBM4lxVpiZHREFQ/xhxALPNf3hI9CJsBfVeR2q4ReIQtcE
 qBtlzOoWa8UFFwqOl01MPHAkWCVXEjx2F/VYXP6OGNXklwJb1Whx+IItzDHrEEmZhdbf+Nny
 1F5/g+EE5cFWSp4C8PaNKCmw1+r5CBPk+NuRUrYZNJUfRy0ooRtLiXwiN4xIt0NdkqflmfLi
 V7ODEdKv/TJrq807MLN2fKOobC2HrYsBUFdBWTas+q7bHGI4mq5zIZce++UZjSBBnjs8aCva
 LwNnfHxOfEKhnhQtI94H+o5xK4y/YK39bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQDYOeHIsLoFlIVNTEJVOXb2KFGgCTW4NQ0PF7+uH198o2YXBgAJBKLkiFccud4adt33
 ec7tccKwAWjkR52YM2ehyVZ+mnQfHwNV6Ir6sMTDIPx01d5z1hDZdrXCzPs4YHJYNJJaxF4L
 jiRjavEprJd2kudLCZjSSmThbJQ1cYUpRRH7F4ePFDYyNPKi8g+0ABV7TlqHB9eyQ9K0r4rN
 2VmX6GvyX5iI9u8aBB/Yl2R
IronPort-HdrOrdr: A9a23:L9Bqq6q9nKfd1LcfZqQnJkIaV5opeYIsimQD101hICG8cqSj9v
 xGuM5rsiMc6QxhPE3I9urtBEDtexzhHNtOkO8s1NSZLWzbUQmTXeJfBOLZqlWKcUDDH6xmpM
 VdmsBFeaTN5DNB7foSjjPXL+od
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="59506316"
Date: Tue, 14 Dec 2021 17:09:49 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v8 01/47] build: factorise generation of the linker
 scripts
Message-ID: <YbjP3ZBaRVf0s4t6@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-2-anthony.perard@citrix.com>
 <f9a5844a-6e70-cb10-a5b8-4bdf55751f5f@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f9a5844a-6e70-cb10-a5b8-4bdf55751f5f@xen.org>

On Tue, Dec 14, 2021 at 04:54:21PM +0000, Julien Grall wrote:
> On 25/11/2021 13:39, Anthony PERARD wrote:
> > diff --git a/xen/Rules.mk b/xen/Rules.mk
> > +# Linker scripts, .lds.S -> .lds
> > +quiet_cmd_cpp_lds_S = LDS     $@
> > +cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -D__LINKER__ -MQ $@ -o $@ $<
> > +

> > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > +xen.lds: xen.lds.S FORCE
> > +	$(call if_changed,cpp_lds_S)
> 
> Sorry, I haven't really followed the build system rework. Could you explain
> why it is necessary to add FORCE?

This new rules make use of a new macro "if_changed", and we need to
execute this new macro every time, even if the source file hasn't been
modified.

if_changed, in addition to checking if the source is newer than the
target that make does, also compare the command line used to generate
the target. If the command line have changed, the macro update the
target.

The command line to execute is stored in "cmd_$1" variables, in this case
"cmd_cpp_lds_S". The macro if_changed store the command line in the file
".${target-name}.cmd".

So, every time the macro if_changed is used, we need to tell make to
always execute the recipe, thus FORCE.

Cheers,

-- 
Anthony PERARD

