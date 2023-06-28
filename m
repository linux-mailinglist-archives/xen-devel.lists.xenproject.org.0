Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B1E741646
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 18:24:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556528.869118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEXwV-0005ha-BA; Wed, 28 Jun 2023 16:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556528.869118; Wed, 28 Jun 2023 16:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEXwV-0005fq-8I; Wed, 28 Jun 2023 16:22:55 +0000
Received: by outflank-mailman (input) for mailman id 556528;
 Wed, 28 Jun 2023 16:22:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vNTu=CQ=citrix.com=prvs=5368aad6b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qEXwT-0005fj-Rg
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 16:22:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 039e6866-15d0-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 18:22:47 +0200 (CEST)
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
X-Inumbo-ID: 039e6866-15d0-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687969367;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4bET0VFEQ/yWoZT9e59qk3/7ikezHUiT8HTgU0WeGmY=;
  b=ZG3FM3PvwRUg9QYXBOQ3UWN0bRpog7h6q6H52LcA03uDivocfXdNAVvd
   bzZwjq5F02jSA6nexGGTB4w7YVLPC995HE8QnthK5z9Fnh3ULLENcfl3k
   7p6GFX2QbbEwBC2xpIfg1GOGv3JVe7wYAqvwF3BukGT47dzOXRPcQJMeb
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 114907622
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:zPB0uqIALuqeEVq6FE+R6pUlxSXFcZb7ZxGr2PjKsXjdYENSgjIAn
 GYYCj3Vb6mLMzT9Ltknb9629U4C6MSEy4M1TQFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4AZuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5HP31M8
 v8ZFwtdQUra28CG4rC7R+hV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJkExhnG/
 DiuE2LRIg5KbeKxxX258WuyitPttj/2c607C+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAfVSJIYtEisM4wRBQp2
 0WPktevAiZg2JWfRGiB7L6SoXW3MDIMMG4ZTSYeSE0O5NyLiIgrgwjGVNpLDK+/hdqzEjb1q
 w1mtwBn2e9V15RSkfzmoxae2WnESoX1ohAd1jvLXGWm7zxCNKH/PtCK2XrZ7ftBFdPMJrWeh
 0Toi/Ry/chXU8HSyXDUHbxXdF26z63baWOB2DaDC7Fkrm3woCD7IOi89RkkfC9U3tA4lSgFi
 aM5kSdY/9dtMXSjdsebiKrhWp1xncAM+TkIP804j+aigbArLmdrBAk0OSatM5nFySDAa50XN
 5aBatqLBn0HE6lhxzfeb75DgeB2mn1mmDiLHcmTI/GbPVy2PiD9pVAtagHmUwzExPnc/FW9H
 yh3aaNmNCmzoMWhO3KKoOb/3HgBLGQhBICeliCkXrfrH+aSI0l4U6W56ep4K+RYc1F9yr+gE
 oeVBhUJlzISRBTvdW23V5yUQOi0Bs0v9ilnYnZE0JTB8yFLXLtDJZw3L/MfFYTLPsQ6pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:YgGzT63VDHY0+4tRvwsJ+wqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: =?us-ascii?q?9a23=3ARDfhcGgnVGV5O7s3/or9+PSyKTJuQkPBznDTInC?=
 =?us-ascii?q?DWUkzEeG3eX2S+K5lqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AaNS66A89QHE4+ODGUyHx9h2Qf+d3s/2QJkxKrZY?=
 =?us-ascii?q?fpcW4FwdsNhyypSviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,165,1684814400"; 
   d="scan'208";a="114907622"
Date: Wed, 28 Jun 2023 17:22:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Design session notes: possible improvements to our documented
 committing process
Message-ID: <0cd24cfb-6638-4e7e-8056-9ed43ee163ff@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Notes from the design session: possible improvements to our documented committing process

Description about the intended discussion:
>  Various typically smaller changes have difficulty getting acks from all
>  relevant maintainers. It is often quite reasonable to not wait long with
>  such, and pinging - besides often being fruitless - may also be excessive.
>  The possibility to “fall back to THE REST” is also fuzzy at best.
>  Furthermore what gets (or doesn't get) committed would also be nice to not
>  depend on the particular committer, but be (somewhat / more) predictable /
>  consistent across committers instead.
>
>  In this context also remember that the chasing of acks is generally the job
>  of the submitter, yet in particular infrequent submitters frequently won’t
>  do so (possibly because they don't even know).
>
>  Main intended audience here are the committers, without any intention to
>  restrict this discussion to just them.

Notes:

Committing patch without formal acks is only for emergency

before ianj was slow to ack tools patches
for tools with anthony taking over, formal acks situation improved

libxc situation is weirds
    libxc-x86 is kind of own by x86
        should be in maintainer files
libxc should formaly acks patches
but edition to it, are usually obvious and self contains
    but committing libxc edition should be ack by toolstack by rules (from
    MAINTAINERS file) but that may not be necessary

vtx area, maintainer takes a long time to respond, if ever
so part of the maintainer files may needs to be updated

it may be better to have an area without maintainer than with unresponsive maintainers.
we would want maintainers to each area, but it's difficult to find maintainers,
    like we still don't have co-maintainers for tools.

george: I receive too many patches that I don't need to responds (due to be "THE REST" maintainer)
    this delay respond for patch that needs to be looked at.

sometime, patch get some review, but may not have the right kind of review,
    then they gets commited with security issue, because the had enough acks/review

how to tell if a patch have enough review?
    could be on by case by case basis
how long should we wait for maintainers?
    should we remove maintainer when they don't respond fast enough?
    this could be an issue in our situation,

This is a people problem,
people problem are always the worst.

when a maintainer isn't responding, we could try to discus with them.

does libxc could be maintainer by hypervisor maintainers?
    how about libxenguest? was part of libxc before.
libxc could be under the rest.
it's common code.

common code hypervisor maintainer? "the rest" has too much stuff
    as the rest maintainer, you receive too many patch that may not need review by the rest.

adding a committers section? so some committer could remove themselfs from "the rest"

we need a new entry for hypervisor, common...
with this, committer could lose visibility on what to commit. (by not be cced)

if only we have a tool, that could check if patch are ready to be committed, under current rules.
lars did try to have a tools, but was too complicated, expensive, close source
we could try to have a simpler tools instead.

should we rely on maintainer (contributer?) to ping committer when patch are ready?

New contributer may not know that they can ping, get committer/maintainer attention.
    so a tools would be better
        tools to ping maintainer when no review happened yet, e.g.

it would be ideal if we have a toolsmith, which can write such tools.
    (whisper: chatgpt?)

some situation are still going to be fuzzy

exception could be ok, instead of insisting on rules

when a maintainer is "absent", could we ask them if they are ok with going forward without a formal ack/review.

sometime, we did end-up with timing-out waiting on formal ack.

ianj did extend maintainers rules for his area, where obvious patch could be
committed without following the written rules, and without his ack. (that rules
is normally for emergency)

with relax rules, it can be hard to find-out where to draw the line
maybe we could have two committers/maintainers agree that a patch don't need a formal ack (when they are unresponsive)
having two persons is better, maybe it's safer, make taking the decision more comfortable.

when committers disagree, there's a process to resolve the situation, with votes.

when a maintainer disagree with a patch committed, after the fact, discussion could happen to re-adjust the expectation of the committers

ping by email make problem worst, it create more email
ping by irc is a better approach

what next?
    Straw poll vote?
    discussion at community call?  -> Yes!

we could try the explicits second opinion call first. This would give data

QEMU as trivial mailing list for trivial patches.
    not really an issue for us, trivial patch are easier to spot, so the mailing list doesn't seems useful
    (mailing list / list of trivial patch maintainers)

some maintainers prefer ping by mail, other are ok with ping by irc.

TODO: add "ping committers on irc" on beginner's page.
    there's a committers@
TODO: discussion at community call.

-- 
Anthony PERARD

