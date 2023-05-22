Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F670C2B2
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 17:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538026.837753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q17n9-0002oV-Mz; Mon, 22 May 2023 15:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538026.837753; Mon, 22 May 2023 15:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q17n9-0002mY-Js; Mon, 22 May 2023 15:49:47 +0000
Received: by outflank-mailman (input) for mailman id 538026;
 Mon, 22 May 2023 15:49:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y+8G=BL=citrix.com=prvs=4993fc31b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q17n7-0002mS-Kz
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 15:49:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43cba945-f8b8-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 17:49:43 +0200 (CEST)
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
X-Inumbo-ID: 43cba945-f8b8-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684770583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SJc3SCfBe5OsiyVSoP2ByjfbA3Gd7WO976ExFwtGNZw=;
  b=JOyJp7BVMoyZs3VlFu2H4ohZNgtDrJgkTIGyxMKK+t5Sb8JuidDgYApK
   YDhhoCjtJoXCBoT1RePCnaLU7S9SB8g4ngNKgxljG4GfQ+Bd6cbA6ibEw
   xV3PHO/2HAXLrYi5ovbuLyfib6DdplKiwvqwXKTczHrYb+jVjpcALE70a
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109831211
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:i1jqvKBYb+zrgBVW/+Xjw5YqxClBgxIJ4kV8jS/XYbTApGwhgzZUn
 WtOUW3Vbv/YM2Oje4t1O4++9B5TuZDSnYVmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G5C5ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+vxlW3l2r
 MAid24RKS2Kq//tm6i3c7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TbFZ4MxB/Bz
 o7A13/8KDo4Oo2V8ACM1S2dmMHMpQXVZI1HQdVU8dY12QbOlwT/EiY+V1G2vP24gU6WQM9EJ
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xBHUATzNHQMwrsokxXzNC/
 kSSg9rjCDhrsbuUYXGQ7LGZqXW1Iyd9BXAGTT8JS00C+daLiIgrgwjGVNpLDK+/hdqzEjb1q
 w1mtwBn2e9V15RSkfzmoxae2WnESoX1ohAd5h/FBHqdtz9DO9C5ILGhxUWAtuxMFdPMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gA2QcR4n9i50zv6JN0LvmkiTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONl1Hs1DaJz9zq3+KTJrU3YE
 cnzTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDFFelUawrfNLBhsstoRTk5F
 P4GbaO3J+h3CrWiMkE7D6ZIRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fs/F/VQKQ8x/49vr6Rr
 hmAtrpwlAKXaYvvdV/bNRiOqdrHAf5CkJ7MFXVzYA/5hSB4OtvHAWV2X8JfQITLPddLlZZcJ
 8Tpse3aahiTYlwrIwggUKQ=
IronPort-HdrOrdr: A9a23:3sMyLa5ZhAykhJnCagPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-Talos-CUID: 9a23:whXJ7W2nffzWPgL4Rvr0PLxfGto3KGXllUvqfBGkTltgZKDOEkWcwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3A8Zlwyg8NyPzlUkv9ZQrsJyqQf9xtyY+MBhEHqK8?=
 =?us-ascii?q?PnJa1KwJzAxGzsDviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,184,1681185600"; 
   d="scan'208";a="109831211"
Date: Mon, 22 May 2023 16:49:36 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RFC] build: respect top-level .config also for
 out-of-tree hypervisor builds
Message-ID: <a87f9103-2262-4fc2-9598-7442074df71a@perard>
References: <beace0ce-e90b-eb79-4419-03de45ea7360@suse.com>
 <a08f3650-0c81-4873-ae10-f5200f8b7613@perard>
 <3c9f8fd2-b60b-5540-00be-87351fec656e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3c9f8fd2-b60b-5540-00be-87351fec656e@suse.com>

On Mon, May 08, 2023 at 08:23:43AM +0200, Jan Beulich wrote:
> On 05.05.2023 18:08, Anthony PERARD wrote:
> > On Wed, Mar 15, 2023 at 03:58:59PM +0100, Jan Beulich wrote:
> >> With in-tree builds Config.mk includes a .config file (if present) from
> >> the top-level directory. Similar functionality is wanted with out-of-
> >> tree builds. Yet the concept of "top-level directory" becomes fuzzy in
> >> that case, because there is not really a requirement to have identical
> >> top-level directory structure in the output tree; in fact there's no
> >> need for anything top-level-ish there. Look for such a .config, but only
> >> if the tree layout matches (read: if the directory we're building in is
> >> named "xen").
> > 
> > Well, as long as the "xen/" part of the repository is the only build
> > system to be able to build out-of-srctree, there isn't going to be a
> > top-level .config possible in the build tree, as such .config will be
> > outside of the build tree. Reading outside of the build tree or source
> > tree might be problematic.
> > 
> > It's a possibility that some project might want to just build the
> > hypervisor, and they happened to name the build tree "xen", but they
> > also have a ".config" use for something else. Kconfig is using ".config"
> > for other reason for example, like we do to build Xen.
> 
> Right, that's what my first RFC remark is about.
> 
> > It might be better to have a different name instead of ".config", and
> > putting it in the build tree rather than the parent directory. Maybe
> > ".xenbuild-config" ?
> 
> Using a less ambiguous name is clearly an option. Putting the file in
> the (Xen) build directory, otoh, imo isn't: In the hope that further
> sub-trees would be enabled to build out-of-tree (qemu for instance in
> principle can already, and I guess at least some of stubdom's sub-
> packages also can), the present functionality of the top-level
> .config (or whatever its new name) also controlling those builds would
> better be retained.

I'm not sure what out-of-tree build for the whole tree will look like,
but it probably going to be `/path/to/configure && make`. After that,
Config.mk should know what kind of build it's doing, and probably only
load ".config" in the build tree. In the meantime, it feels out of place
for xen/Makefile or xen/Rules.mk to load a ".config" that would be
present in the parent directory of the build dir.

> > I've been using the optional makefile named "xen-version" to adjust
> > variable of the build system, with content like:
> > 
> >     export XEN_TARGET_ARCH=arm64
> >     export CROSS_COMPILE=aarch64-linux-gnu-
> > 
> > so that I can have multiple build tree for different arch, and not have
> > to do anything other than running make and do the expected build. Maybe
> > that's not possible because for some reason, the build system still
> > reconfigure some variable when entering a sub-directory, but that's a
> > start.
> 
> Hmm, interesting idea. I could (ab)use this at least in the short
> term. Yet even then the file would further need including from
> Rules.mk. Requiring all variables defined there to be exported isn't
> a good idea, imo. Iirc not all make variables can usefully be
> exported. For example, I have a local extension to CROSS_COMPILE in
> place, which uses a variable with a dash in its name.
> 
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> RFC: The directory name based heuristic of course isn't nice. But I
> >>      couldn't think of anything better. Suggestions?
> > 
> > I can only thing of looking at a file that is in the build-tree rather
> > than outside of it. A file named ".xenbuild-config" proposed early for
> > example.
> > 
> >> RFC: There also being a .config in the top-level source dir would be a
> >>      little problematic: It would be included _after_ the one in the
> >>      object tree. Yet if such a scenario is to be expected/supported at
> >>      all, it makes more sense the other way around.
> > 
> > Well, that would mean teaching Config.mk about out-of-tree build that
> > part of the repository is capable of, or better would be to stop trying
> > to read ".config" from Config.mk, and handle the file in the different
> > sub-build systems.
> 
> Hmm, is that a viable option? Or put differently: Wouldn't this mean doing
> away with ./Config.mk altogether? Which in turn would mean no central
> place anymore where XEN_TARGET_ARCH and friends could be overridden. (I
> view this as a capability that we want to retain, if nothing else then for
> the - see above - future option of allowing more than just xen/ to be
> built out-of-tree.)

No, I'm not trying to get rid of Config.mk. There's a few thing in it
that I'd like to remove from it, but not everything. I don't know how to
deal with ".config" at the moment, but I guess that if Config.mk knew
about out-of-tree build, it probably should only read one ".config", the
one in the build tree.

-- 
Anthony PERARD

