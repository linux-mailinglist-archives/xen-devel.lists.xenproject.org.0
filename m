Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0025970AF
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 16:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388958.625741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOJn8-0003oc-0H; Wed, 17 Aug 2022 14:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388958.625741; Wed, 17 Aug 2022 14:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOJn7-0003m7-Ti; Wed, 17 Aug 2022 14:13:05 +0000
Received: by outflank-mailman (input) for mailman id 388958;
 Wed, 17 Aug 2022 14:13:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2RHf=YV=citrix.com=prvs=221cc9648=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oOJn6-0003kU-Al
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 14:13:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2e88445-1e36-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 16:13:01 +0200 (CEST)
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
X-Inumbo-ID: b2e88445-1e36-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660745581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jy8zmhEkfrVPWDhHSxlOgu9i7Zc9dmrAQxTzYo9zAwM=;
  b=eMsh9BlRFQOpaRBt7u9IbTTBg04uov0uQl4CN0PhDsejnNcbzw7oOgM7
   UGSuifrpXtaYeWAWqIJ3zBWqZWFoO887Th+NEy9VVFTJcAtgslS8IIm7k
   E0sViWk9rDi7O39ZUQ0ZHHAnp3tZqmn2a2yJ8axlDZoTQSM5ZJrkoczq6
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78300275
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:a5RYZqm/1ESZ2LYEix3SdJ7o5gxMJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKC2GPPv+IMGGheIh2btixo00EuJKDzIRnSQE6+y02FSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37K2t4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kmIqgH2b8uDVtS2
 qwkOD0pRw+Bq9OPlefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+Oe9a4KNIIPXLSlTtmrBg
 VyY5mX+ORglDMGblBuf73S3oMaayEsXX6pNTeblp5aGmma7zGEJFAcfU1f9pPCjk1O/QPpWM
 UlS8S0rxYAM80isQsj4TgePineOtR4BWPJdC+Q/rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRUcAbyIZSQoO4/H4vZo+yBnIS75LErOxj9DzMSH9x
 XaNtidWr64IkccB2qG//FbGqzGhvJ7ESkgy/Aq/Y46+xlonPsj/PdXusAWFq6YbRGqEcrWfl
 Ggbvte9tbkCN42ixBCdTcEkA7OF1s/QZVUwnmVT84kdGyWFoiD9Jd4Lum0veS+FIe5fJ2a3P
 Ra7VRd5ocYKYSD0NfIfj5eZUZxC8ET2KTjyuhk4hPJqa4M5SgKI9ToGiaW4jzG0yxhEfU3S1
 P6mnSeQ4ZUyU/0PIMKeHbt17FPS7nlWKZnvbZ761Q+79rGVeWSYT7wIWHPXML5hsvzY8VSJq
 o0DXydv9/m4eLyWX8Uq2dRLcQBiwYYTX/gaVPC7hsbce1E7SQnN+tfawK87epwNopm5Ytzgp
 yjlMmcFmQWXuJEyAV/VApyVQO+wAM0XQLNSFXBEAGtELFB9ONvws/9BKMVfkHtO3LUL8MOYh
 sItI62oasmjgByek9jBRfERdLBfSSk=
IronPort-HdrOrdr: A9a23:d3YNWa2QshVAz/fH/mtAvQqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.93,243,1654574400"; 
   d="scan'208";a="78300275"
Date: Wed, 17 Aug 2022 15:12:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v2] build: Fix x86 out-of-tree build without EFI
Message-ID: <Yvz3Yuc+gqcKQ59R@perard.uk.xensource.com>
References: <20220816103043.32662-1-anthony.perard@citrix.com>
 <20220817091540.18949-1-anthony.perard@citrix.com>
 <e2d3cc4d-4b5e-560a-53f1-380d260a66b6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e2d3cc4d-4b5e-560a-53f1-380d260a66b6@suse.com>

On Wed, Aug 17, 2022 at 12:38:36PM +0200, Jan Beulich wrote:
> On 17.08.2022 11:15, Anthony PERARD wrote:
> > --- a/xen/common/efi/efi-common.mk
> > +++ b/xen/common/efi/efi-common.mk
> > @@ -9,9 +9,9 @@ CFLAGS-y += -iquote $(srcdir)
> >  # e.g.: It transforms "dir/foo/bar" into successively
> >  #       "dir foo bar", ".. .. ..", "../../.."
> >  $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
> > -	$(Q)test -f $@ || \
> > -	    ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
> > +	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
> 
> I'm afraid the commit message hasn't made clear to me why this part of
> the change is (still) needed (or perhaps just wanted). The rest of this
> lgtm now, thanks.

There's an explanation in the commit message, quoted here:
> >  The issue is that in out-of-tree, make might find x86/efi/stub.c via
> >  VPATH, but as the target needs to be rebuilt due to FORCE, make
> >  actually avoid changing the source tree and rebuilt the target with
> >  VPATH ignored, so $@ lead to the build tree where "stub.c" dosen't
> >  exist yet so a link is made to "common/stub.c".

The problem with `test -f $@` it doesn't test what we think it does. It
doesn't test for the presence of a regular file in the source tree as
stated in the original tree. First, `test -f` happily follow symlinks.
Second, $@ is always going to point to the build dir, as GNU Make will
try to not make changes to the source tree, if I understand the logic
correctly.

Instead of `test -f`, we could probably remove the "FORCE" from the
prerequisite, but there's still going to be an issue if there's a file
with the same name in both common and per-arch directory, when the common
file is newer.

So `test -f` needs to go.

Cheers,

-- 
Anthony PERARD

