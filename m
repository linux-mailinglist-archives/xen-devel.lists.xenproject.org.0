Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7254D897F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 17:36:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290338.492382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTngP-0002V5-Gw; Mon, 14 Mar 2022 16:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290338.492382; Mon, 14 Mar 2022 16:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTngP-0002SV-E3; Mon, 14 Mar 2022 16:36:33 +0000
Received: by outflank-mailman (input) for mailman id 290338;
 Mon, 14 Mar 2022 16:36:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zml5=TZ=strugglers.net=andy@srs-se1.protection.inumbo.net>)
 id 1nTngN-0002SP-Mh
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 16:36:31 +0000
Received: from mail.bitfolk.com (mail.bitfolk.com [2001:ba8:1f1:f019::25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e57210a6-a3b4-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 17:36:29 +0100 (CET)
Received: from andy by mail.bitfolk.com with local (Exim 4.89)
 (envelope-from <andy@strugglers.net>)
 id 1nTngJ-0005oD-PT; Mon, 14 Mar 2022 16:36:27 +0000
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
X-Inumbo-ID: e57210a6-a3b4-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com
	; s=alpha; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8uJnhy1bbsD1TNqDTRNKKLOV7YlCNlGnT/Ct3vHmX1w=; b=ZE2bEIbwaPB9XDo3bA9KmwikOT
	fjQw2bvv7AGb4nDVo55q7Dt6/mB+24Vkiszz6LwUziqr6MD96+AJaWz6TgZiX58Dy/I87OQEw5wBT
	yAibmISmdMHrE5GtZes6SkU+DRZ5pViIQzwlfo6HHjPJOe+FHn7XWpeznsm0Q96Xp3LPdC608fynz
	bjpnPsywsIkkzfy5WE4q/kDG4SF9jmgRxZ3llV3bl2ErmorgAW0OMV2TwGUorEOREQ9ebgewoCI46
	uDpBhWBmRWTjuqKyPsBI2xW1zurnPrBOHpDUiukhEEHI6oX7rV/+rWONLUrEKSHjq4ErW3g8MepXj
	JlnxLhSQ==;
Date: Mon, 14 Mar 2022 16:36:27 +0000
From: Andy Smith <andy@strugglers.net>
To: xen-devel@lists.xenproject.org
Cc: mikeh@csits.net
Subject: Some feature requests for guest consoles
Message-ID: <20220314163627.4pck24ahx6igggff@bitfolk.com>
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

Mike H <mikeh@csits.net> made a feature request in:

    https://lists.xenproject.org/archives/html/xen-users/2022-03/msg00009.html

for the Xen guest console as connected to with "xl console" to
correctly support the terminal size rather than always being 80x20.

Additionally I wondered about some other features:

- Ability to remap the "magic sysrq" key combination which is
  ctrl-o, and possibly disable it while leaving "xl sysrq" and
  /proc/sysrq-trigger in the guest generally working.

  Reason: guest administrators are often inexperienced with the
  details of Xen. ctrl-o is a bad choice because it's actually the
  "save buffer" shortcut in the popular editor nano. On more than
  one occasion I have had guest administrators be editing a file
  with nano on their console, they go to save it with ctrl-o which
  appears to do nothing (because Xen is waiting for the sysrq
  command that follows), so they do ctrl-o again which is taken as
  being command 'o' - immediate power off! I have had an emergency
  support ticket about this because "my guest randomly crashed while
  I was editing a file".

  I would therefore like to remap "magic sysrq" to something more
  obscure, or failing that disable it in guests as we/they will use
  "xl sysrq" instead.

A couple of other things which may already be possible but I don't
know how, so if anyone's done it maybe they could give hints:

- Systematically and automatically log all guest console activity to
  individual files without interfering with the ability to use "xl
  console"

- Somehow plumb the xenconsole pty to a web terminal like xterm.js

Thanks!
Andy

