Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED1547C53D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 18:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250531.431528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzjCr-0008GX-Ka; Tue, 21 Dec 2021 17:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250531.431528; Tue, 21 Dec 2021 17:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzjCr-0008Ec-Ha; Tue, 21 Dec 2021 17:45:45 +0000
Received: by outflank-mailman (input) for mailman id 250531;
 Tue, 21 Dec 2021 17:45:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mzjCp-0008EW-Fs
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 17:45:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cff0a297-6285-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 18:45:41 +0100 (CET)
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
X-Inumbo-ID: cff0a297-6285-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640108741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=N1jtymTyzz325UlEs+2YAvvRcH+N+hxLqQoIzjbdzDs=;
  b=KFUnDfLxf8zRu5crGiRJQnoob8DI+y3cklionPDFDa2a6gU1H2SzLVYO
   +Q52Puv59rpiyeHRi6vlHeB5BS9Oi9W4NYJE/RYEI0Xlc1TTh5h1YIVfY
   2V3FuakIA3X/CqXPfSRP+wvM2Hh4r6fJ8d+YvesiVM7xzLMps17nzlDOP
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zL6hvQGY+WVLsZaQ31bBFQ+u8GDBMhb99p365OQ9nVmdD/nHuZKfl+FsZdOZP706NKmi3qU4tQ
 pPkW2NipI11n3YaUv3g5IbfwxJPOqHD/ZtNGuuN58CUH6a3WNK97xJt/kyxt88Xl/fQz2Yr0i1
 TQkTUb0TtSlUJASaG0PmFifFz2+8Cx9Uh2opRKW23dqP8jDqCQ4Tqdvw+Y+MFL8fuQffpI4JfL
 ieRr8ZZYo8Zjnyk6G9Yo3sjP6/QTKRKbHsEHesLaCMiGlSYaZ0WjsYwVZ+V6laiIoIfBHu+Fyw
 eAJg6izuy9lBa4AfilmcdZ4v
X-SBRS: 5.1
X-MesageID: 60922121
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lJt/RqnWLQ2EtB/O+SKl2D/o5gwCIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeCGDVbPqKMWT0KdxyYIS/9h8P7ZDcy4RrSwRvryxkEyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbdg2NQx2YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IpHpb20aTY4B4n3lvoFfQNZGB5OOKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ66PP
 ZBAM2MHgBLoYS9eNHcbKMsEvPaYg3TFKRty8FS0qv9ii4TU5FMoi+W8WDbPQfSIT8hImkeTp
 krd4n/0RBodMbS31j6t4n+qwOjVkkvTWZ0QPK218OZwh1+ezXBVDwcZPXOypPLo1GalQdlRb
 UoZ5kIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6QAHQESThQLsQrrsYsSRQl0
 1aIm5XiAjkHjVGOYSvDrPHO92r0YHVLaz9ZDcMZcecby4bpsKA3riPed/JYHrCtoMf0Eg7Ax
 j/f+UDSmI4vpcIM0qy6+3XOjDStuoXFQ2YJ2+nHYo62xlgnPdD4PuRE/XCetK8dd9jBEjFtq
 VBdw5DGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuLGppVEdMKS
 BWK0e+02HO1FCHyBUOQS9juY/nGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 c/DK5vzUSxDUv4PIN+KqwE1i+dDKscWnzy7eHwG507/jer2iIC9FN/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnK/zGLnFnhTdSJTLcmv86R/L7ffSiI7SDBJI6KAmtsJJt0695m5Y8+Vp
 xlRrGcDkwGh7ZAGQC3XAk1ehETHAcwi8CllZHN0Zj5FGRELOO6S0UvWTLNvFZFPyQCp5aUco
 yAtd5rSD/JRZC7A/jhBP5DxoJY7LEaghB6UPjrjaz86JsYySwvM897iXw3u6ChRUXbn6Zpg+
 +WthlHBXJ4OZwV+F8KKOvih+Ey84CoGk+VoUkqWftQKIBfw8JJnIjDah+MsJ51eMg3KwzaXj
 l7EARoRqeTXjZUy9d3F2fKNo4uzSrMsFUtGBWjLq72xMHCCrGakxIZBVseOfCzcCzyoqPnzO
 70NwqilYvMdnVtMv45tKJpRzPozt4n1urtX7gV4B3GXPV6lPaxtfyud1s5Vu6wTmrIA4VmqW
 liC88VxMKmSPJ+3C0YYIQcoY7jR1fwQnTWOv/05LF+juX1y9buDF05TIwONmGpWK74saNEpx
 uIoucg37Q2ji0V1boba334Mr2ncfGYdV6gHt40BBN65gwUm/VhOfJjAB3Kk+5qIcdhNbhEnL
 zL8aHAuXFiAKp4uq0YOKEU=
IronPort-HdrOrdr: A9a23:PkgLXKAxVv1R65LlHemU55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG+85rsyMc6QxhPE3I9urtBEDtexzhHNtOkPAs1NSZLWzbUQmTXeJfBOLZqlWKcUDDH6xmpM
 VdmsBFeaXN5DNB7foSjjPXL+od
X-IronPort-AV: E=Sophos;i="5.88,224,1635220800"; 
   d="scan'208";a="60922121"
Date: Tue, 21 Dec 2021 17:45:32 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@gmail.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [XEN PATCH 26/57] tools/firmware/hvmloader: rework Makefile
Message-ID: <YcISvBKAUY25XGIp@perard>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-27-anthony.perard@citrix.com>
 <d10d6034-f0a3-12fd-47f6-daf3333dc5c4@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d10d6034-f0a3-12fd-47f6-daf3333dc5c4@srcf.net>

On Thu, Dec 16, 2021 at 06:03:54PM +0000, Andrew Cooper wrote:
> On 06/12/2021 17:02, Anthony PERARD wrote:
> > Setup proper dependencies with libacpi so we don't need to run "make
> > hvmloader" in the "all" target. ("build.o" new prerequisite isn't
> > exactly proper but a side effect of building the $(DSDT_FILES) is to
> > generate the "ssdt_*.h" needed by "build.o".)
> >
> > Make use if "-iquote" instead of a plain "-I".
> 
> So I've read up on what this means, but is it really that important in
> the grand scheme of things?

It something that Jan proposed to do in some cases in the hypervisor
build system. I thought it was something good to do so I start using
-iquote in the toolstack as well.

> Can't we actually make our problems go away by turning libacpi into a
> real static library?  (Also, the "kill hvmloader plans" will turn
> libacpi back into only having one single user, so that too)

Well, libacpi also have some headers that needs to be generated, so I'm
not sure which problem are going away when turning it into a static lib.
Also, I don't think hvmloader and libxl would want the same library.

Thanks,

-- 
Anthony PERARD

