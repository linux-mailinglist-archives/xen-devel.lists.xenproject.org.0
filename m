Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EF73F992C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 14:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173643.316796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJbGi-0003aO-EL; Fri, 27 Aug 2021 12:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173643.316796; Fri, 27 Aug 2021 12:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJbGi-0003Xi-Aj; Fri, 27 Aug 2021 12:47:36 +0000
Received: by outflank-mailman (input) for mailman id 173643;
 Fri, 27 Aug 2021 12:47:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht3v=NS=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1mJbGg-0003Xb-Fh
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 12:47:34 +0000
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27244754-d234-42f2-9f29-62e7b8920876;
 Fri, 27 Aug 2021 12:47:33 +0000 (UTC)
Received: from andy by mail.bitfolk.com with local (Exim 4.89)
 (envelope-from <andy@strugglers.net>)
 id 1mJbGd-0008Sf-Hs; Fri, 27 Aug 2021 12:47:31 +0000
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
X-Inumbo-ID: 27244754-d234-42f2-9f29-62e7b8920876
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com
	; s=alpha; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dhgjZh/Us8j+b87rYcAlSqnFQ+LUI+HkUmbHMTbo4wQ=; b=W52cavZpfibsUVOHFU6Gb9WpLa
	Z4ZTfW17eRiXwoy0apr1VSpXRwgZ2mDBPvZqB2/unjupm6Jb2RbBAMB4cSqx6E1ZQiVB+BkVGDMKC
	3gSFH37oecQS+IqGmKAISWCxdQPNXjQOeHSvY8ONuANjRjG/bfoo1ply0eD3OpXZvlG7s/3ZaCFoh
	WDQA9CgaYAI/jy9VTCpkuyp7UnjByYvbaIOxkkzvyeAyM2O624Lg8WzM4ADpywkietFeUyRHa4OSc
	uHHSnm+EnW6eK2oD7n6P3Am2rDB1u5SgwNl5r4MNkfE007IhQAsW5bvuHvsIRoN6lxi8rVICUMiQJ
	yueyekUw==;
Date: Fri, 27 Aug 2021 12:47:31 +0000
From: Andy Smith <andy@strugglers.net>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bob Liu <bob.liu@oracle.com>
Subject: Filesystem corruption on restore without "xen-blkfront: introduce
 blkfront_gather_backend_features()"
Message-ID: <20210827124731.byhwfxkehrfqtvyt@bitfolk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hi,

[This conversation started on the xen-security-issues-discuss list
as I mistakenly thought it was to do with then-embargoed XSA
patches]

I did "xl save" on 17 domUs that were running under dom0 kernel
4.19.0-16-amd64 (4.19.181-1), hypervisor 4.14.2. I then rebooted
dom0 into kernel 5.10.0-0.bpo.8-amd64 (5.10.46-4~bpo10+1). On
restore 3 of the domUs were unresponsive and their consoles were
scrolling with:

backed has not unmapped grant: 1073
backed has not unmapped grant: 881
backed has not unmapped grant: 1474

(note typo)

After a destroy and boot there was filesystem corruption in the
domUs extensive enough to not be recoverable.

Andrew Cooper pointed me towards:

    https://lore.kernel.org/lkml/1437449441-2964-1-git-send-email-bob.liu@oracle.com/

The affected domUs were running obsolete kernels that did not have
that fix, which appears to have reached upstream in v4.2-rc7. Two of
them were running a 3.16 kernel from Debian 8 (jessie), one a 2.6.32
kernel from CentOS 6.

Out of the 17 there were quite a few other obsolete guest kernels
that apparently were not affected - just luck?

As I have these plus more users still running these obsolete kernels
I have some questions about this patch.

- Is the problem here in my case that the dom0 kernel 4.19 had not
  used feature-persistent whereas the dom0 kernel 5.10 does, and
  guests with obsolete kernels don't recognise this when they
  restore?

- The obsolete guests that apparently managed to restore okay
  presumably still have the problem and so can never safely be
  restored again until they have booted into a kernel with this
  patch?

- Am I right in thinking that guest kernels with this patch should
  be safe to keep doing save/restore even if they have already been
  restored across that change of dom0 4.19->5.10?

- Can guests with obsolete kernels that have done a shutdown and
  boot under 5.10 now be safely saved and restored again, as long as
  no new backend features are added?

Basically I now have a population of domUs running that I think can't
be safely saved/restored and I now need to identify them.

(The guests administrators have already been ignoring advice to
upgrade for a long time, so I can't just upgrade the problematic
ones. They will probably accept loss of save/restore rather than
upgrade.)

Thanks,
Andy

