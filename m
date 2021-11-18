Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E25A456164
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 18:24:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227516.393509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnl8W-0000jb-8u; Thu, 18 Nov 2021 17:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227516.393509; Thu, 18 Nov 2021 17:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnl8W-0000ho-5o; Thu, 18 Nov 2021 17:23:48 +0000
Received: by outflank-mailman (input) for mailman id 227516;
 Thu, 18 Nov 2021 17:23:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl7d=QF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mnl8U-0000hi-KK
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 17:23:46 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47744098-4894-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 18:23:44 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62BAB61154;
 Thu, 18 Nov 2021 17:23:41 +0000 (UTC)
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
X-Inumbo-ID: 47744098-4894-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637256223;
	bh=b2MdE1ve3OgEDaRSFm5dZpvr8LY3cY+agcRnQy7nBBs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WiSy34G+B40fcbatlVn5VBPxiz/zth6XmhKxZqUPAtkeRdOO/18E8TpkFVfYboS10
	 dVa3XcKc6OrK1iQm+Ad2TRcQzyIoqgSNGB4SdwNBFB4W4uGPW5SAdIpBs9+SHr8LgL
	 N9NMJEtikNX0J+trPgqipNLcSv7NlkRINV6TPkPvXhW+eXOOGywzBLd7bpUPGNuRl2
	 jqE/FF04Erq+BRJTgyodLsAcCnThxhPIS3oa5iuxOVh2kQbVOZ8ahWZieHkYEAlBWd
	 vU2bN4I4xUjMkg2Q/wToVLelr5BfaT62+fJzKRVfo72IEx2B+875cX++d4g3dcfM3C
	 CJGAJW4+hIT9Q==
Date: Thu, 18 Nov 2021 09:23:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>, 
    Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    Dario Faggioli <dfaggioli@suse.com>, David Scott <dave@recoil.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Josh Whitehead <josh.whitehead@dornerworks.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
    Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Meng Xu <mengxu@cis.upenn.edu>, Nick Rosbrook <rosbrookn@ainfosec.com>, 
    Paul Durrant <paul@xen.org>, Quan Xu <quan.xu0@gmail.com>, 
    Rahul Singh <rahul.singh@arm.com>, 
    Ross Lagerwall <ross.lagerwall@citrix.com>, 
    Samuel Thibault <samuel.thibault@ens-lyon.org>, 
    Shriram Rajagopalan <rshriram@cs.ubc.ca>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Stewart Hildebrand <stewart.hildebrand@dornerworks.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>, 
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
In-Reply-To: <20211117095338.14947-3-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2111180920500.1412361@ubuntu-linux-20-04-desktop>
References: <20211117095338.14947-1-roger.pau@citrix.com> <20211117095338.14947-3-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2090811883-1637256222=:1412361"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2090811883-1637256222=:1412361
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 17 Nov 2021, Roger Pau Monne wrote:
> Document some of the relevant changes during the 4.16 release cycle,
> likely more entries are missing.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  CHANGELOG.md | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ad1a8c2bc2..8b0bdd9cf0 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
>     no longer be built per default. In order to be able to use those, configure needs to
>     be called with "--enable-qemu-traditional" as parameter.
> + - Fixes for credit2 scheduler stability in corner case conditions.
> + - Ongoing improvements in the hypervisor build system.
> + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
> + - 32bit PV guests only supported in shim mode.
> + - Improved PVH dom0 debug key handling.
> + - Fix booting on some Intel systems without a PIT (i8254).
> +
> +### Added
> + - 32bit Arm builds to the automated tests.

I think you can expand this:

- greatly improved gitlab-ci based automated tests:
    - 32-bit Arm builds
    - x86 full system tests

Or with single lines only:

- 32bit Arm builds to the gitlab-ci automated tests
- x86 full system tests to the gitlab-ci automated tests
--8323329-2090811883-1637256222=:1412361--

