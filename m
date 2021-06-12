Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252353A5151
	for <lists+xen-devel@lfdr.de>; Sun, 13 Jun 2021 01:14:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140875.260306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsCpF-0005Nk-KC; Sat, 12 Jun 2021 23:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140875.260306; Sat, 12 Jun 2021 23:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsCpF-0005Kd-H9; Sat, 12 Jun 2021 23:14:01 +0000
Received: by outflank-mailman (input) for mailman id 140875;
 Sat, 12 Jun 2021 23:13:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eFEz=LG=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1lsCpD-0005KX-Gc
 for xen-devel@lists.xenproject.org; Sat, 12 Jun 2021 23:13:59 +0000
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91059439-b96c-4bb6-a5e3-45ca0bf01d61;
 Sat, 12 Jun 2021 23:13:58 +0000 (UTC)
Received: from andy by mail.bitfolk.com with local (Exim 4.89)
 (envelope-from <andy@strugglers.net>) id 1lsCpB-0000GS-9p
 for xen-devel@lists.xenproject.org; Sat, 12 Jun 2021 23:13:57 +0000
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
X-Inumbo-ID: 91059439-b96c-4bb6-a5e3-45ca0bf01d61
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com
	; s=alpha; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OWqO3i/j6QzXQuag1dyHMW1KO6nKQG3OtJaUXgkTHN4=; b=fXBEVLDH9ukq5atMdaluX/xDrG
	kdELEy6ZZuyeHmIqKyEurU5FOtHqPPgA5XCrWyu4QcRPB3Yo8nrIcqagLA7Xz4TFI1sNQjHDm+tOW
	cW48OltHGva7YY4z89JZCoKmttlBGUgvgQc7OVXL8Kb7hkLkaPLv6CODsIifc5uPSv6HMSj2CvgZK
	SytOxxTji1edDEfijkQmHQXyVo3suYcM8d1jNOrie6jAuLudHF1H8nFbB0ynHudMzYSuBPul6R5fm
	leKhiBjOSKm002t3dRWv4VICjXLWy5rAQKKfjh0LWfpWK7zyMPzQq7jkLX1IE5AF3Fs5ixh1wijhN
	TlKfqbIQ==;
Date: Sat, 12 Jun 2021 23:13:57 +0000
From: Andy Smith <andy@strugglers.net>
To: xen-devel@lists.xenproject.org
Subject: Re: dom0 suddenly blocking on all access to md device
Message-ID: <20210612231357.upxplm7ecpvl3zlo@bitfolk.com>
References: <20210226223927.GQ29212@bitfolk.com>
 <20210612141132.rjtmvjv6377lz4tl@bitfolk.com>
 <CA+VdTb8TQFu81S=s4n26NyBoZ2Lr-XQo6wWBrsN4hsv0_y-gcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+VdTb8TQFu81S=s4n26NyBoZ2Lr-XQo6wWBrsN4hsv0_y-gcA@mail.gmail.com>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hi Rob,

On Sat, Jun 12, 2021 at 05:47:49PM -0500, Rob Townley wrote:
> mdadm.conf has email reporting capabilities to alert to failing drives.
> Test that you receive emails.

I do receive those emails, when such things occur, but the drives
are not failing.

Devices are not kicked out of MD arrays, all IO just stalls
completely. Also these incidents coincide with an upgrade of OS and
hypervisor and are happening on 5 different servers so far, so it
would be highly unlikely that so many devices suddenly went bad.

> Use mdadm to run tests on the raid.

Weekly scrubs take place using /usr/share/mdadm/checkarray

> smartctl -a /dev/

Yep, SMART health checks and self-testing are enabled.

I've now put two test servers on linux-image-amd64/buster-backports
and any time any of the production servers experiences the issue I
will boot it into that kernel next time.

Cheers,
Andy

