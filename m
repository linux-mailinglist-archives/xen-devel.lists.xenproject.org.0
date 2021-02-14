Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0FC31B31B
	for <lists+xen-devel@lfdr.de>; Sun, 14 Feb 2021 23:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85027.159359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBQ9R-00010C-4M; Sun, 14 Feb 2021 22:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85027.159359; Sun, 14 Feb 2021 22:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBQ9R-0000zn-1B; Sun, 14 Feb 2021 22:46:01 +0000
Received: by outflank-mailman (input) for mailman id 85027;
 Sun, 14 Feb 2021 22:45:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0kZh=HQ=daemonizer.de=maxi@srs-us1.protection.inumbo.net>)
 id 1lBQ9P-0000zi-PL
 for xen-devel@lists.xenproject.org; Sun, 14 Feb 2021 22:45:59 +0000
Received: from mx1.somlen.de (unknown [89.238.87.226])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84c5f96c-93bc-48de-84c2-5900121afe07;
 Sun, 14 Feb 2021 22:45:56 +0000 (UTC)
Received: by mx1.somlen.de with ESMTPSA id E0D95C36AAE;
 Sun, 14 Feb 2021 23:45:54 +0100 (CET)
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
X-Inumbo-ID: 84c5f96c-93bc-48de-84c2-5900121afe07
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, pkg-xen-devel@lists.alioth.debian.org
Subject: Re: [BUG] Linux pvh vm not getting destroyed on shutdown
Date: Sun, 14 Feb 2021 23:45:47 +0100
Message-ID: <22128555.Kfurr2TIWe@localhost>
In-Reply-To: <YCgYxOxXwitkFB0T@mattapan.m5p.com>
References: <2195346.r5JaYcbZso@localhost> <YCgYxOxXwitkFB0T@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1779699.oyBIJXxD3g"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1779699.oyBIJXxD3g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Samstag, 13. Februar 2021 19:21:56 CET Elliott Mitchell wrote:
> On Sat, Feb 13, 2021 at 04:36:24PM +0100, Maximilian Engelhardt wrote:
> > after a recent upgrade of one of our test systems to Debian Bullseye we
> > noticed an issue where on shutdown of a pvh vm the vm was not destroyed by
> > xen automatically. It could still be destroyed by manually issuing a 'xl
> > destroy $vm' command.
> 
> Usually I would expect such an issue to show on the Debian bug database
> before xen-devel.  In particular as this is a behavior change with
> security updates, there is a good chance this isn't attributable to the
> Xen Project.  Additionally the Xen Project's support window is rather
> narrow.  I've been observing the same (or similar) issue for a bit too.

I posted this bug report to the xen-devel list because I was told to do so on 
upstream #xen irc channel.
Before writing my mail, I also checked the Debian kernel packaging for 
anything that might be related to our issue, but could not find anything.
Please note we didn't observe any behavior change in Debian buster on our 
systems and also didn't notice the shutdown issue there. For us the issue 
only started with kernel version 5.8.3+1~exp1.

> > Here are some things I noticed while trying to debug this issue:
> > 
> > * It happens on a Debian buster dom0 as well as on a bullseye dom0
> 
> I stick with stable on non-development machines, so I can't say anything
> to this.
> 
> > * It seems to only affect pvh vms.
> 
> I've observed it with pv and hvm VMs as well.
> 
> > * shutdown from the pvgrub menu ("c" -> "halt") does work
> 
> Woah!  That is quite the observation.  Since I had a handy opportunity
> I tried this and this reproduces for me.
> 
> > * the vm seems to shut down normal, the last lines in the console are:
> I agree with this.  Everything appears typical until the last moment.
> 
> > * issuing a reboot instead of a shutdown does work fine.
> 
> I disagree with this.  I'm seeing the issue occur with restart attempts
> too.
> 
> > * The issue started with Debian kernel 5.8.3+1~exp1 running in the vm,
> > Debian kernel 5.7.17-1 does not show the issue.
> 
> I think the first kernel update during which I saw the issue was around
> linux-image-4.19.0-12-amd64 or linux-image-4.19.0-13-amd64.  I think
> the last security update to the Xen packages was in a similar timeframe
> though.  Rate this portion as unreliable though.  I can definitely state
> this occurs with Debian's linux-image-4.19.0-13-amd64 and kernels built
> from corresponding source, this may have shown earlier.

We don't see any issues with the current Debian buster (Debian stable) kernel 
(4.19.0-14-amd64 #1 SMP Debian 4.19.171-2 (2021-01-30) x86_64 GNU/Linux) and 
also did not notice any issues with the older kernel packages in buster. Also 
the security update of xen in buster did not cause any behavior change for us. 
In our case everything in buster is working as we expect it to work (using 
latest updates and security updates).

> > * setting vcpus equal to maxvcpus does *not* show the hang.
> 
> I haven't tried things related to this, so I can't comment on this
> part.
> 
> 
> Fresh observation.  During a similar timeframe I started noticing VM
> creation leaving a `xl create` process behind.  I had discovered this
> process could be freely killed without appearing to effect the VM and had
> thus been doing so (memory in a lean Dom0 is precious).
> 
> While typing this I realized there was another scenario I needed to try.
> Turns out if I boot PV GRUB and get to its command-line (press 'c'), then
> get away from the VM console, kill the `xl create` process, return to
> the console and type "halt".  This results in a hung VM.
> 
> Are you perhaps either killing the `xl create` process for effected VMs,
> or migrating the VM and thus splitting the `xl create` process from the
> effected VMs?
> 
> This seems more a Debian issue than a Xen Project issue right now.

We don't migrate the vms, we don't kill any processes running on the dom0 and 
I don't see anything in our logs indicating something gets killed on the dom0. 
On our systems the running 'xl create' processes only use very little memory.

Have you tried if you still observer your hangs if you don't kill the xl 
processes?
--nextPart1779699.oyBIJXxD3g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ8gZ7vwsPje0uPkIgepkfSQr0hUFAmApqBsACgkQgepkfSQr
0hWQexAArihR0+TqNRoVfPjTFQCO4a4ByZNufXeappdTaKahvwK29qr+2aRIjn4L
8pcSPYuJV/CsMH+ZVR19pfR/DC1R5EUYOeBd9+K/Q0VlJ/XzMPJ7cTbccyzm7Nub
muCCWHRidlGVUNGXVvANdj7MlU8LAAmkjSFcCav2jiySnsdiwm/Q8PKvUWzqA3Ju
5syeYqkUh3PWqIwGGfSLuAJyAKSzYdFWSk/5Rep07J5CPK0rzMTxuYUZcqw+fD+8
KAcFV7uXSusDKSl+8qVCbraPvOPisZ0xvy1gDSMH5Jsz+aS2nnbdls3zE6U77IhC
/Z4WXGXe3QvVhyuLd8iT36EhD+PjQfV0bUvY9ECCqmuaIryQLrIcJiayYmX03K3X
gC8LAIVAHX/G65c3S+BzsNaHPQ8GZ2LiFG3jFYUlAjoMlNerB1F+aCwuI6ZLwPML
v7qdtJ9nKJsU4kVDKan5tUc5IZ7NM9VwQeSI83/EhkMIfUCfdHVKHyrNdfWWj4Gx
LS62SKjPC4gDIOfUr6booAvxB6vCQMYp90r8+GagKNNCxqvXezI3lWE2woBW49BC
BxtIJ26AYBrBWHUYGmpj9LUFPA0GwkArPt9opKQfvtL154+nD+HY9buMGPZaxaqA
17lL2i4HhzcUn5sD0urQg2pFI8asPSBv9l7HQsIuvexaPh4OzDI=
=zb5T
-----END PGP SIGNATURE-----

--nextPart1779699.oyBIJXxD3g--




