Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B631547BCE4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 10:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250254.431053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzbTp-0000vo-TU; Tue, 21 Dec 2021 09:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250254.431053; Tue, 21 Dec 2021 09:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzbTp-0000tV-Pw; Tue, 21 Dec 2021 09:30:45 +0000
Received: by outflank-mailman (input) for mailman id 250254;
 Tue, 21 Dec 2021 09:30:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mzbTo-0000tP-Og
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 09:30:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa1c3abd-6240-11ec-8d39-b1a4ed000e3e;
 Tue, 21 Dec 2021 10:30:43 +0100 (CET)
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
X-Inumbo-ID: aa1c3abd-6240-11ec-8d39-b1a4ed000e3e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640079043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vbl6T8es3mxt8akruFaFUiZctnlQ2rCsIEtlMcYYi60=;
  b=FMOK1ipymiUlk2ipLgNGmX88UAG6Sj9lUK6uV9X3cvHAjtrP4CE+eNoN
   yKSqZYUhQ986YIatI8qpC1RP1rjC3VidOZiVEBFmVQBcwi06FLGSfD0iy
   ivBsnkMag7/+RICjZ4nYEogDkqB6vRjit0pCBE/ZlOo7M/tcd97/tCLAS
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MAjUbPfwbolqxdpDmac+8IZPu1i5sqvkq8SnUkVOvWuTbInzSa22r6gqGhs6XkC6V9GDA3pbkI
 RS1nf40BtMn+eK7L+NU+OhbgHXOWsNcYfX69Kf2Ui+gfRZ0RuRJGluBSUs4F9etX5p5/33tTH1
 lWTwEuji3RHQ6NDDXc3px1prnAvHRTB0LyEqLwWjylUf3nc7sxww4sck6B12n1k9ule//pb2Cb
 R9zzIZil3yGtj/dn9XN4JX9NnyqlXlJq4mFPdWsAcX9BnBFBopV+8KPI63D8JcORskofTnw7SE
 fJHVfOd9hF/OcHgcD2LU0ii4
X-SBRS: 5.1
X-MesageID: 60429733
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iC0b2KMvqHhg5H3vrR1xkcFynXyQoLVcMsEvi/4bfWQNrUon1zwGm
 DcdXT+GOv6DZmL2fot2bY2y8UwCu5/RyIVkGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400g6w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxSlsdpYy
 opfjoGPcAgxGoH8sv4gfiANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgm9s3JERRq22i
 8wxWCI+bS/MRxNzAlpGJowen7fwtlryfGgNwL6SjfVuuDWCpOBr65DmN9zTfd6GTNtUhW6Xo
 2vH+yLyBRRyHNWbyCGZ+3O2wOHVlCXwWZk6C7GzsPVthTW7zGEJFAcfU1f9pPCjk1O/QPpWM
 UlS8S0rxYAx80qxR9W7QBy8o1aDpBcXX9cWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmLGNUnec6re8pCu/IzQINnQFYTIYTAwD+J/op4Rbph7AQttsCqedksz+GTa2x
 SuD6ic5md07jNEJ/7W2+0jdhDChrYSPSRQ6ji3dWWiv/w5iZIqoYoWuwVfe5PdEao2eSzGpv
 nIJhsyf5+AmFoyWmWqGR+BlNLO04/eINhXMjFgpGIMunxyT/HqkcZFV8StJDk5jOcYZehfke
 EbW/whW4fd7I3+CfaJxJYWrBKwC1rP8HN7oUvTVaNtmYZVrcgKDuiZ0aiatM3vFyRZ21/tlY
 NHCLJjqXS1y5blbICSeZssz25YpmTIF2FzqSojf4ySNy4ezXSvAIVsaC2emYuc85aKChQza9
 ddDKseHoylivP3Cjjr/qtBKcw1TRZQvLdWv8pEMKLbfSuZzMDh5U6e5/F83R2Byc025fM/s9
 2r1ZEJXwUGXaZbveVTTMSALhF8CsP9CQZMH0c4EYQfAN5sLO9/HAEIjm30fJ+FPGAtLl6Ecc
 hX9U5/casmjsxyek9jnUbHzrZZ5aDOgjh+UMiyubVAXJsA8H1STp4C4JFK0rkHi6xZbU+Nk+
 9VMMSuBHvI+q/lKVp6KOJpDMXvs1ZTipA6CdxSReYQCEKkd2INrNzbwnpcKzzIkcn3+Ks+h/
 1/OW38w/LCVy6dsqYWhrf3U/u+BTroldmIHTjaz0FpDHXSDloZV6dQbC7jgkPG0fD6cxZhOk
 s0Jlayha6Neww4R22e+ep4ypZ8DCxLUj+cy5mxZ8L/jNDxH05tsfSuL29dhrKpIyuMLsAe6Q
 BvXqNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOcnOo0S3
 up86tUd7Bayi0R2P4/e3DxU7WmFMlcJT74j6sMBGIbuhwdykgNCbJXQBzXY+paKb9kQYEAmL
 iXN3PjJhqhGx1qEeH02TCCf0e1YjJUImRZL0F5deAjZxoub3qc6hUQD/y42QwJZygR8/9hyY
 mU7ZVdoIaiu/itzgJQRVW6bBAwcVgaS/Vb8ygVVmTSBHVWoTGHEMEY0Jf2JoBIC62tZczVWo
 OOYxWLiXWq4dc39xHJvC0tsqvilRt1t7AzS3sugGp3dTZU9ZDPkhI6oZHYJ9ES7UZ9g2hWfq
 Lk45vt0ZI36KTUU8v8yBISt3LgNTAyJeT5ZSvZ78aJVRWzRdVleA9RVx5xdri+VG8H3zA==
IronPort-HdrOrdr: A9a23:pfn1L618gI0A9X5pLfaijgqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.88,223,1635220800"; 
   d="scan'208";a="60429733"
Date: Tue, 21 Dec 2021 09:30:25 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 12/47] build: build everything from the root dir,
 use obj=$subdir
Message-ID: <YcGescJTNrwi7HUP@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-13-anthony.perard@citrix.com>
 <0b2eb0e2-a07f-6ba2-8f59-b7c207ed30da@suse.com>
 <YbseOtj7prFqViyV@perard>
 <YcBpLbxObugQ3doZ@perard>
 <35327375-fb82-ace7-ecb0-be9188c0d280@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <35327375-fb82-ace7-ecb0-be9188c0d280@suse.com>

On Tue, Dec 21, 2021 at 08:55:26AM +0100, Jan Beulich wrote:
> On 20.12.2021 12:29, Anthony PERARD wrote:
> > On Thu, Dec 16, 2021 at 11:08:47AM +0000, Anthony PERARD wrote:
> >> On Tue, Dec 07, 2021 at 12:10:34PM +0100, Jan Beulich wrote:
> >>> On 25.11.2021 14:39, Anthony PERARD wrote:
> >>>> --- a/xen/Makefile
> >>>> +++ b/xen/Makefile
> >>>> @@ -22,6 +22,15 @@ export CHECKPOLICY	?= checkpolicy
> >>>>  export BASEDIR := $(CURDIR)
> >>>>  export XEN_ROOT := $(BASEDIR)/..
> >>>>  
> >>>> +abs_objtree := $(CURDIR)
> >>>> +abs_srctree := $(CURDIR)
> >>>
> >>> Nit: In line with e.g. obj-y I think these would better be abs-srctree and
> >>> abs-objtree.
> >>
> >> I guess that would be fine, we don't need to keep the same spelling that
> >> Kbuild does.
> > 
> > Actually, those two variables are exported, as it appear in the next two
> > lines. Exporting a variable with a dash doesn't work very well as shells
> > may not be able to use them. When make find a variable with a dash in
> > it in the environment, it unexport them.
> > 
> > So, for those two variable, we need to avoid using a dash, so I think
> > keeping the current name is better. (And now, I've find out that there's
> > an issue in the build system, I'll prepare a patch.)
> 
> Oh, sure - if they have to be exported, the names should remain as they are.
> Question of course why they need exporting when by the end of the conversion
> you don't change directories anymore.

So far, the value of those two variables are simple, but they get a bit
more complicated when we introduce out-of-tree build. I would rather
avoid recalculating those values later one and be sure that the values
are the same on recursion.

Thanks,

-- 
Anthony PERARD

