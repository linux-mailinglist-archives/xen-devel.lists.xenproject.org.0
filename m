Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656B7AC662F
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:45:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999292.1379970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKDLg-0002qY-G9; Wed, 28 May 2025 09:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999292.1379970; Wed, 28 May 2025 09:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKDLg-0002nT-CJ; Wed, 28 May 2025 09:45:24 +0000
Received: by outflank-mailman (input) for mailman id 999292;
 Wed, 28 May 2025 09:45:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uKDLe-0002nN-Oj
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:45:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uKDLd-006dLC-2x;
 Wed, 28 May 2025 09:45:21 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uKDLe-000wwE-0G;
 Wed, 28 May 2025 09:45:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=3XSUshn+9ysuFhv88HRysdEbfKWggC5ZCgqhf2qipe4=; b=dxMst8uyCkARcR48zfhM7hefr4
	kJ90i9e1wZr1V0hCr/O8MXaR9jFcuOl/Va9bgp8u0DSba3tr+++cNWTe3elFgnoFufoQ4E3e9m90/
	bytaKGEKR9yck5d6HkaMmQ+TZOta6Ces0+hFD287bZab/1I4xbfevxLTOFcn0qGwQy48=;
Date: Wed, 28 May 2025 11:45:19 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/3] CI: Use bash arrays to simplfy dom0 rootfs
 construction
Message-ID: <aDbbL9cgz5ZqFV5O@l14>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com>
 <20250522173640.575452-3-andrew.cooper3@citrix.com>
 <aDXFviVAxsscfKV2@l14>
 <aDXX-PagUgzu54u4@mail-itl>
 <b5dfadcb-6f22-40bb-84a9-fcc48955c44c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5dfadcb-6f22-40bb-84a9-fcc48955c44c@citrix.com>

On Tue, May 27, 2025 at 04:24:57PM +0100, Andrew Cooper wrote:
> On 27/05/2025 4:19 pm, Marek Marczykowski-Górecki wrote:
> > On Tue, May 27, 2025 at 04:01:34PM +0200, Anthony PERARD wrote:
> >> On Thu, May 22, 2025 at 06:36:39PM +0100, Andrew Cooper wrote:
> >>> For Qubes, this requires switching from sh to bash.
> >>>
> >>> This reduces the number of times the target filename needs to be written to 1.
> >>>
> >>> Expand the comment to explain the concatination constraints.
> >> Isn't the correct spelling "concatenation"? Same for the two comments.
> >>
> >>> No functional change.
> >>>
> >>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> ---
> >>> I would like to find a slightly nicer way of conditional parts, but nothing
> >>> comes to mind.
> >> Well, one way I can think of is having a new variable which can carry
> >> the rootfs part associated with a particular test, then that variable
> >> can be updated at the time we configure for that test. Something like:
> >>
> >> # init
> >> declare -a append_rootfs_part
> >> # or append_rootfs_part=() is probably fine too.
> >>
> >> case $test in
> >>   argo)
> >>     append_rootfs_part+=(argo.cpio.gz)
> >>     # ... other test configuration
> >>     ;;
> >> esac
> >>
> >> # Dom0 rootfs
> >> parts=(
> >>     rootfs.cpio.gz
> >>     xen-tools.cpio.gz
> >>     "${append_rootfs_part[@]}"
> >> )
> >>
> >> And that should works fine, even if there isn't any extra rootfs part.
> > That would work for compressed parts, but not for uncompressed - which
> > need to come before all compressed. But maybe there could be two arrays
> > - one for uncompressed and another for compressed? Then, each could be
> > extended anywhere, without messing the order.

You could use "${append_rootfs_part:#*.gz}" and
"${(M)append_rootfs_part:#*.gz}" to grab the uncompressed part then the
compressed part... on zsh :-). But something similar could be codded in
bash. But I guess two variables will be more acceptable.

> Hmm, two might work, but they surely need to not be quoted when forming
> parts=(), or having multiple entries will go wrong on the eventual cat
> command line.

The double quote are needed! Well not really because it's very unlikely
that there's going to be blanked characters in paths to parts.

Maybe this will help understand how "${var[@]}" is expended into
multiple arguments:

# Testing with just for loop, also show the difference between
#  "${v[@]}" and "${v[*]}":

$ parts=(one two)
$ for i in "${parts[@]}"; do echo "- $i"; done
- one
- two
$ for i in "${parts[*]}"; do echo "- $i"; done
- one two
$ extra=("first extra" "second extra")
$ for i in "${extra[@]}"; do echo "- $i"; done
- first extra
- second extra
$ parts=(one "${extra[@]}" two)
$ for i in "${parts[@]}"; do echo "- $i"; done
- one
- first extra
- second extra
- two

# And now with function

$ print_array(){ for i in "$@"; do echo "- $i"; done; }
$ print_array "${parts[@]}"
- one
- first extra
- second extra
- two
$ print_array ${parts[@]}
- one
- first
- extra
- second
- extra
- two

Cheers,

-- 
Anthony PERARD

