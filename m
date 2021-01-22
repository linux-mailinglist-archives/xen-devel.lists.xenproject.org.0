Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFF93003DB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 14:11:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72760.131052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2wDu-00038g-PV; Fri, 22 Jan 2021 13:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72760.131052; Fri, 22 Jan 2021 13:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2wDu-00038H-M7; Fri, 22 Jan 2021 13:11:34 +0000
Received: by outflank-mailman (input) for mailman id 72760;
 Fri, 22 Jan 2021 13:11:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j0/X=GZ=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1l2wDt-00038C-J9
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 13:11:33 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 985072ac-4358-4c12-ab70-d030741bb249;
 Fri, 22 Jan 2021 13:11:32 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1l2wDq-000GQi-HM; Fri, 22 Jan 2021 13:11:30 +0000
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
X-Inumbo-ID: 985072ac-4358-4c12-ab70-d030741bb249
Date: Fri, 22 Jan 2021 13:11:30 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 15/17] x86/shadow: drop SH_type_l2h_pae_shadow
Message-ID: <YArPAicNIR0H5Q0y@deinos.phlegethon.org>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <c412bbe4-d555-7d36-997c-92274679d9ae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c412bbe4-d555-7d36-997c-92274679d9ae@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

Hi,

At 16:10 +0100 on 14 Jan (1610640627), Jan Beulich wrote:
> This is a remnant from 32-bit days, having no place anymore where a
> shadow of this type would be created.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> hash_{domain,vcpu}_foreach() have a use each of literal 15. It's not
> clear to me what the proper replacement constant would be, as it
> doesn't look as if SH_type_monitor_table was meant.

Good spot.  I think the '<= 15' should be replaced with '< SH_type_unused'.
It originally matched the callback arrays all being coded as
"static hash_callback_t callbacks[16]".

Cheers,

Tim

