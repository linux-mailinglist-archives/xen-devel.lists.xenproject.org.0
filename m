Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5205E47C509
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 18:31:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250524.431506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mziyN-0005yx-0y; Tue, 21 Dec 2021 17:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250524.431506; Tue, 21 Dec 2021 17:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mziyM-0005vu-U1; Tue, 21 Dec 2021 17:30:46 +0000
Received: by outflank-mailman (input) for mailman id 250524;
 Tue, 21 Dec 2021 17:30:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mziyM-0005vo-4r
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 17:30:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b973cbd8-6283-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 18:30:44 +0100 (CET)
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
X-Inumbo-ID: b973cbd8-6283-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640107844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xn5qMGE+vmCZsSA3KdmK1gRo+2f/TDiBlrPIKST3Hoc=;
  b=Gc+IE/zVPa+aivt8CzMpDo714HSrtXChV779YNTA6TDRxLjVjrwxiLzs
   Zx6KddxMHV96ovEDzFMy+diRauc4p+EAPDAYnbgtBPRgmJt1Hx6VNmGjv
   PvItPzU8a253TCoYFhmFzX0fpHlXmeDj6D7DPWGAuQ8TaqZ5/MoNbHsmX
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sXRWb7X01lik0YtQ6l0RPMOfZQzNNmUvfAUgBAEmp4AlXu4gXDmEq+XIUZWm0r/5IwuoIXkP+Q
 NiOfpz5HOMyxUOoWuEaauYjk2G39vTxBcND6dzdG4NbeEf4FgYSc6ZO2FgXlI8pcpHnS67u/2k
 LTgBUOpamCe1DsyykoRxSMojX7K8uzB62wD4qs70PGYG4AXOkSJ5HutLva56dPVDAq5NW7l5tZ
 7iXskAuMFWDzQthpJPqqJpL5EvyUmqPbcURWoOdTRSErlqtc7Abe8fl1iTQGL3HmiSZiur1+Un
 ig0nkjeBUwx/kyoz7cI3ceF7
X-SBRS: 5.1
X-MesageID: 60920995
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3iAwyau0JtVBbqNGeOg+MIZb3efnVNxZMUV32f8akzHdYApBsoF/q
 tZmKTjXa/ffazf2Ltx+aIzi8UwOvsXSzdVgQQFvqykzRXsR+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj29cy24HhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljZqbVVkVJ5fwp8s/CDoIHgZRGpF90eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AP
 5tDMWs+MXwsZTV/HQwKNZYVpdv3vVDwKw9pkHm4n6Eotj27IAtZj+G2bYu9lsaxbchRk0CR4
 H/I/mHlGRwEPfSY0zOO9n/qjejK9Qv6R4A6BLC+7uRtglCY2ioUEhJ+fUS/iem0jAi5Qd03A
 0UR8XtwhbMo/0LtSNThNzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMYwWTwt0
 E7Ph97zDCZjmLKQQHOZsLyTqFuP1TM9dDFYI3VeFE1cvoel8NpbYg/zoshLKKiekoPJAAvM/
 B+o9wtuipI8qvIw/vDulbzYuA6Eqp/MRw8zwwzYWGO58w90DLKYi5yUBUvztqgZctvAJrWVl
 D1dwpXFsrhSZX2YvHXVGL1lIV2/2xqS3NQwa3ZLFoJpyTmi8mXLkWt4sGAnfxcB3irplFbUj
 K7vVeF5uM470JiCN/Yfj2eN5yICl/CI+TPNDK+8Uza2SsItHDJrBQk3DaJq40jjkVI3jYY0M
 oqBfMCnAB4yUPo7lGLsGrhBi+ZwnEjSIF8/o7ihl3xLNpLEOxaopUotagPSPojVEovZyOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3wYsTXvjLRzhsXrfbeGJOQTh5Y9eImO9JU9E1zsx9y7aTl
 lngCxAw9bYKrSCeQel8Qis4M+2HsFcWhS9TABHAyn70gSV+Otj2s/9EH3b1FJF+nNFeITdPZ
 6FtU6297j5nEFwrIhwRMsvwqpJMbhOuiV7cNiapemFnLZVhWxbI6pnveQ62rHsCCS++tM0fp
 by811yEHcpfFlo6VMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroJsqIvJiKmIop2HCex7GkYGTWDX4azvbXvR/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxSu85w7g/6t3jo65h4j5lRHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4Pk4fBf66Stw8ObVWEleJUDR2ilULb8zO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDd+5kBcvx3FDfYfYW33/75y4YtlRNlUnf
 22Pj63YirUAnkfPfhLfz5QWMTaxUXjWhC138Q==
IronPort-HdrOrdr: A9a23:hQSU3aj/slAsiKRd+WnSDf6NgnBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.88,224,1635220800"; 
   d="scan'208";a="60920995"
Date: Tue, 21 Dec 2021 17:30:28 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@gmail.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	"Ian Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 24/57] tools/debugger/gdbsx: Fix and cleanup makefiles
Message-ID: <YcIPNDlwv0do6BqC@perard>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-25-anthony.perard@citrix.com>
 <ec048161-a117-36cf-b84f-e537a300d35b@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ec048161-a117-36cf-b84f-e537a300d35b@srcf.net>

On Thu, Dec 16, 2021 at 05:55:29PM +0000, Andrew Cooper wrote:
> On 06/12/2021 17:02, Anthony PERARD wrote:
> > diff --git a/tools/debugger/gdbsx/Makefile b/tools/debugger/gdbsx/Makefile
> > index 8d7cd94a31..4aaf427c45 100644
> > --- a/tools/debugger/gdbsx/Makefile
> > +++ b/tools/debugger/gdbsx/Makefile
> > @@ -28,7 +28,7 @@ uninstall:
> >  gdbsx: gx/gx_all.a xg/xg_all.a 
> >  	$(CC) $(LDFLAGS) -o $@ $^
> >  
> > -xg/xg_all.a:
> > +xg/xg_all.a: FORCE
> >  	$(MAKE) -C xg
> > -gx/gx_all.a:
> > +gx/gx_all.a: FORCE
> >  	$(MAKE) -C gx
> 
> Shouldn't these be in the sub Make's ?

No, this is how we tell make how to build some of the prerequisite
needed to build "gdbsx", we tell make that they are build in
sub-directory.

> > diff --git a/tools/debugger/gdbsx/gx/Makefile b/tools/debugger/gdbsx/gx/Makefile
> > -#%.o: %.c $(GX_HDRS) Makefile
> > -#	$(CC) -c $(CFLAGS) -o $@ $<
> > -
> > -gx_all.a: $(GX_OBJS) Makefile $(GX_HDRS)
> > -	ar cr $@ $(GX_OBJS)        # problem with ld using -m32 
> > +gx_all.a: $(GX_OBJS) Makefile
> > +	ar cr $@ $(GX_OBJS)
> 
> There's probably an $(AR) we ought to be using.

Yes, I'll look at that.

Thanks,

-- 
Anthony PERARD

