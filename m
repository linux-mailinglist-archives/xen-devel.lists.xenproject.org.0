Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7684A8FD1D4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 17:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735801.1141926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEsjL-00011t-HF; Wed, 05 Jun 2024 15:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735801.1141926; Wed, 05 Jun 2024 15:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEsjL-0000zz-DN; Wed, 05 Jun 2024 15:39:15 +0000
Received: by outflank-mailman (input) for mailman id 735801;
 Wed, 05 Jun 2024 15:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNKw=NH=cloud.com=alex.brett@srs-se1.protection.inumbo.net>)
 id 1sEsjJ-0000zn-VP
 for xen-devel@lists.xen.org; Wed, 05 Jun 2024 15:39:14 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0e3cd60-2351-11ef-b4bb-af5377834399;
 Wed, 05 Jun 2024 17:39:11 +0200 (CEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2c1ab9e17f6so30417a91.1
 for <xen-devel@lists.xen.org>; Wed, 05 Jun 2024 08:39:11 -0700 (PDT)
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
X-Inumbo-ID: c0e3cd60-2351-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717601950; x=1718206750; darn=lists.xen.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0yzbyUBTrQd441rxXQik5Gk9in4UvsE2GoeY89+O74=;
        b=I1TXGOLkeuX1x74m+wQqkW6D5HVLQgRnuwkPepqtMLKnZa7Q/lP0Ix0qOstohdEzNZ
         ddbwdnJoLXWIsf99Wa9NKzeosMcr9eiYwAiKDzmeMfWqabQBSK+yvBUgP/O31lk51/o9
         q9jwL26ys6n2ZpNd0wp4N5UDs+jYsdJmQ8pgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717601950; x=1718206750;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i0yzbyUBTrQd441rxXQik5Gk9in4UvsE2GoeY89+O74=;
        b=kOu+ZSgcMFvgps2sslvZFsNucUL+7Ylqeb5yLCqWutayrwhKQNBztqK/qGEL57cuU+
         aBufl6UK+vr9GnV/otP98nQ2iKKKPIGG6PaPY5KhUm2HsXJ6th5y96f0T54+7m4NlVOO
         Y0mx8/UDNq0h5vah5tdABbpb4h1Y4yTsWr4MwxEJAcmS6lntxdtpwPdtukAwgxw/B5SJ
         VIdovdQpNwtMEg1Qig0vwMnbmcLNToT7z66b0ZM+23ZDzE2MApFUj8vgPEu7iWzr8KrS
         x/op5BpEKoKYTbItY/+VPVA9FvdkwTbwE0PtcT6X8F7mNkJW+EI/YpF00u5hWWGdi/Ne
         MKqg==
X-Gm-Message-State: AOJu0YyguHLOhaFXFpGL5Qxh31Y8qnVeM+e0xFTSkva8QoUBgnzNQ6Y/
	GvgbvhOtuT7SczHh899G68aLrwiu72w5iAYuLXSMJQGfUsU8S/x8DJh/Udqm4qAosSJ0n7CPLTF
	Rh+8c5jNFxjacHPxlOGYPgpbUVqF83zvGvyrwXIHrI7hGYY5KXK8=
X-Google-Smtp-Source: AGHT+IEPqjLHp+jMjuC12pzbuFH6S5VNLrz/m+oYp6ZsLpAfynXVLNBFE4dv7l1cyBnQHOrYTyn1s3vlp/T0GSF0iAU=
X-Received: by 2002:a17:90a:a418:b0:2bf:9981:e0ae with SMTP id
 98e67ed59e1d1-2c27db5a46emr3167255a91.39.1717601949433; Wed, 05 Jun 2024
 08:39:09 -0700 (PDT)
MIME-Version: 1.0
Reply-To: alex.brett@cloud.com
From: Alex Brett <alex.brett@citrix.com>
Date: Wed, 5 Jun 2024 16:39:01 +0100
Message-ID: <CAMC3yeFCJX+C3ELHSbAKTJD-24NTxXk0kUg9VHjbKQXv41W=jg@mail.gmail.com>
Subject: Design session notes: guest unaware migration
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="0000000000000fe83b061a265efc"

--0000000000000fe83b061a265efc
Content-Type: text/plain; charset="UTF-8"

Notes from the design session on guest unaware migration:

Migration is often needed for e.g. host maintenance. When this is done, we
(XenServer) see two classes of issues with guests:
  - Guest kernel crashes (relatively rare). Often detectable by the
toolstack and thus reported to the admin, distros generally take patches
quickly.

  - Guest userspace issues (more common).
    Primarily seen around networking - e.g. iptables rules get cleaned up,
and not re-injected. This can break e.g. Kubernetes networking.
Some other examples around clustered services (though not clear if this is
the guest being aware of the migration or just a result of the downtime).
Generally impossible for the toolstack to detect, so admin normally unaware
until users/monitoring complains.

It was also mentioned that NetBSD has issues with live migration around
suspend of the network interface.

Possible solutions
1. Do the migration in a way that the guest is entirely unaware of it
Amazon produced a proposal for this non-cooperative migration:
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob_plain;f=docs/designs/non-cooperative-migration.md;hb=HEAD
Believed to be some older patch series on this

Some notes from VM forking work that might be relevant:
  Some state was not saved as part of regular VM save, so resuming VM
didn't work in some cases - likely will need to save this state if doing
non-cooperative migration
  Dumping / restoring qemu state worked for Windows, but for Linux needed a
save, fork, restore, so appears to be some sort of dependency there

There is an issue around domids - in the proposal these are randomised, but
that still means certain destinations aren't possible (in Amazon's case
they just find a compatible target, but this is not necessarily an option
in server virt scenarios where the admin specifies where they want the VM
migrated to).
The domid is a 15bit integer, so if you have < 32k VMs you could allocate
centrally across a pool of servers.

Could use non-cooperative migration where possible, but not expect it to
work everywhere (e.g. within a pool, but not cross-pool in a XenServer
example).

Alternative idea from Alejandro - could VMs be faked to always think they
always have a fixed domid (e.g. 1), then have dom0 know the actual one,
with e.g. xenstore translating?
  Suggestion to talk to Juergen, he may have thoughts on this.

Could we use a UUID instead of domid in the protocols?
  Large string/value that would be in lots of xenstore messages, could that
cause problems.
  Does a VM need to know its domid (e.g. for giving to other guests to set
up grants), or could it be hidden?
  Is this too much of a hack?

If the guest is unaware, we still need to make sure the gratuitous ARP gets
sent after migration.

There are other use cases for non-cooperative migration, which would
require not having anything custom in the VM.


2. Can we modify netfront so we don't generate the events (link down /
interface removed - not clear which?) across a migration, thus userspace
isn't aware even if the kernel is?
  Likely needs some code inspection to understand what's actually happening
here as to any potential improvements.

--0000000000000fe83b061a265efc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Notes from the design session on guest unaware migrat=
ion:</div><div><br></div>Migration is often needed for e.g. host maintenanc=
e. When this is done, we (XenServer) see two classes of issues with guests:=
<br>=C2=A0 - Guest kernel crashes (relatively rare). Often detectable by th=
e toolstack and thus reported to the admin, distros generally take patches =
quickly.<br><br>=C2=A0 - Guest userspace issues (more common).<br>=C2=A0 =
=C2=A0 Primarily seen around networking - e.g. iptables rules get cleaned u=
p, and not re-injected. This can break e.g. Kubernetes networking.<br><div>=
	Some other examples around clustered services (though not clear if this is=
 the guest being aware of the migration or just a result of the downtime).<=
br>	Generally impossible for the toolstack to detect, so admin normally una=
ware until users/monitoring complains.<br><br>It was also mentioned that Ne=
tBSD has issues with live migration around suspend of the network interface=
.<br>	<br>Possible solutions<br>1. Do the migration in a way that the guest=
 is entirely unaware of it<br>Amazon produced a proposal for this non-coope=
rative migration: <a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dblob_plain;f=3Ddocs/designs/non-cooperative-migration.md;hb=3DHEAD">http=
s://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob_plain;f=3Ddocs/designs/non=
-cooperative-migration.md;hb=3DHEAD</a><br>Believed to be some older patch =
series on this<br>=C2=A0<br>Some notes from VM forking work that might be r=
elevant:<br>=C2=A0 Some state was not saved as part of regular VM save, so =
resuming VM didn&#39;t work in some cases - likely will need to save this s=
tate if doing non-cooperative migration<br>=C2=A0 Dumping / restoring qemu =
state worked for Windows, but for Linux needed a save, fork, restore, so ap=
pears to be some sort of dependency there<br>=C2=A0<br>There is an issue ar=
ound domids - in the proposal these are randomised, but that still means ce=
rtain destinations aren&#39;t possible (in Amazon&#39;s case they just find=
 a compatible target, but this is not necessarily an option in server virt =
scenarios where the admin specifies where they want the VM migrated to).<br=
>The domid is a 15bit integer, so if you have &lt; 32k VMs you could alloca=
te centrally across a pool of servers.<br><br>Could use non-cooperative mig=
ration where possible, but not expect it to work everywhere (e.g. within a =
pool, but not cross-pool in a XenServer example).<br><br>Alternative idea f=
rom Alejandro - could VMs be faked to always think they always have a fixed=
 domid (e.g. 1), then have dom0 know the actual one, with e.g. xenstore tra=
nslating?<br>=C2=A0 Suggestion to talk to Juergen, he may have thoughts on =
this.<br>=C2=A0 <br>Could we use a UUID instead of domid in the protocols?<=
br>=C2=A0 Large string/value that would be in lots of xenstore messages, co=
uld that cause problems.<br>=C2=A0 Does a VM need to know its domid (e.g. f=
or giving to other guests to set up grants), or could it be hidden?<br>=C2=
=A0 Is this too much of a hack?<br><br>If the guest is unaware, we still ne=
ed to make sure the gratuitous ARP gets sent after migration.<br><br>There =
are other use cases for non-cooperative migration, which would require not =
having anything custom in the VM.<br><br><br>2. Can we modify netfront so w=
e don&#39;t generate the events (link down / interface removed - not clear =
which?) across a migration, thus userspace isn&#39;t aware even if the kern=
el is?<br>=C2=A0 Likely needs some code inspection to understand what&#39;s=
 actually happening here as to any potential improvements.<br><div dir=3D"l=
tr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"></div></di=
v></div>

--0000000000000fe83b061a265efc--

