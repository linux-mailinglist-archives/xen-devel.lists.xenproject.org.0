Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E5D329577
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 01:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92003.173647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGt9U-0003zz-2h; Tue, 02 Mar 2021 00:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92003.173647; Tue, 02 Mar 2021 00:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGt9T-0003za-VT; Tue, 02 Mar 2021 00:44:39 +0000
Received: by outflank-mailman (input) for mailman id 92003;
 Tue, 02 Mar 2021 00:44:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCML=IA=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1lGt9S-0003zT-9u
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 00:44:38 +0000
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4609805-f63f-42a7-9926-6670dc830d81;
 Tue, 02 Mar 2021 00:44:36 +0000 (UTC)
Received: from andy by mail.bitfolk.com with local (Exim 4.84_2)
 (envelope-from <andy@strugglers.net>) id 1lGt9O-0002Fw-NQ
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 00:44:34 +0000
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
X-Inumbo-ID: a4609805-f63f-42a7-9926-6670dc830d81
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com; s=alpha;
	h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date; bh=VRgcg4bkoQUiZiUmSrKnYj32LjVYxw8K7GbLGase1jw=;
	b=aQ1rkjAV04C6Ud4WGk3tnrFaLA7IvA9lJHEcEAJKE/HTALV2OxC5CO3NHDemrqCzGHY9j0xneVPWWQcwWXjMXZGcQzeQ03V4YDFGdDCUgovpfW8RFH4wN36TiBg/11YNtzriQC8QmVk794SpQn8piHKLKMR7mHITHWbn7gKTGE05MJgeT1w1d2wZvpRvypTWNdxqK5B7yy5lmy6OvfkuvT7HyMzj7sGhUVvu2lY8bx74mcewR04N1qSKRfk36zcLVeSH03HjyGIWkV7YzQFspb5kGInt/L0HR6SfOuM5t79emU968uvmbG0wcYv7oBq16aRlG9PnLD94/L/VBlWkLA==;
Date: Tue, 2 Mar 2021 00:44:34 +0000
From: Andy Smith <andy@strugglers.net>
To: xen-devel@lists.xenproject.org
Subject: Re: dom0 suddenly blocking on all access to md device
Message-ID: <20210302004434.GG29212@bitfolk.com>
References: <20210226223927.GQ29212@bitfolk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210226223927.GQ29212@bitfolk.com>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hello,

On Fri, Feb 26, 2021 at 10:39:27PM +0000, Andy Smith wrote:
> just lately I've been sporadically having issues where dom0 blocks
> or severely slows down on all access to the particular md device
> that hosts all domU block devices.

This just happened again on the same server as the previous
occurrence on 26th February.

Again I was able to get things going again and avoid having to
destroy all guests and hard reset the host by doing a destroy on a
guest that was seen to be trying to do the most block IO (through
xentop).

This means that this particular host is still on Debian buster
kernel 4.19.0-13-amd64 and credit2 scheduler. As it's been only a
few days this might present itself again on this host quite soon. Is
there any useful information I can provide when it does?

Unfortunately there were no logs of interest neither in the dom0
syslog, guest syslog nor dom0 serial console. After the heavy IO
guest was destroyed dom0 syslog did give:

Mar  2 00:14:08 clockwork kernel: [6732447.973298] xen-blkback: Scheduled work from previous purge is still busy, cannot purge list

…but I assume that is just a result of IO springing back to life.

Thanks,
Andy

