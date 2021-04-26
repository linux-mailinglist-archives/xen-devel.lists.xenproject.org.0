Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3931336B862
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 19:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117856.223774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5QZ-0005Yj-GG; Mon, 26 Apr 2021 17:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117856.223774; Mon, 26 Apr 2021 17:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5QZ-0005YK-DC; Mon, 26 Apr 2021 17:53:47 +0000
Received: by outflank-mailman (input) for mailman id 117856;
 Mon, 26 Apr 2021 17:53:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/oNb=JX=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lb5QX-0005YF-0M
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 17:53:45 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a282536-b0cd-40da-a182-427bcb94200d;
 Mon, 26 Apr 2021 17:53:44 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lb5QQ-00065I-Lo; Mon, 26 Apr 2021 17:53:38 +0000
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
X-Inumbo-ID: 7a282536-b0cd-40da-a182-427bcb94200d
Date: Mon, 26 Apr 2021 18:53:38 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v4 1/3] VMX: use a single, global APIC access page
Message-ID: <YIb+Iky2sQuoubxR@deinos.phlegethon.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <3e7ad009-f062-d58a-9380-103ce1573a73@suse.com>
 <837a427a-a74e-00e9-70c7-1d3cfa28b30c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <837a427a-a74e-00e9-70c7-1d3cfa28b30c@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 12:52 +0200 on 23 Apr (1619182377), Jan Beulich wrote:
> The address of this page is used by the CPU only to recognize when to
> access the virtual APIC page instead. No accesses would ever go to this
> page. It only needs to be present in the (CPU) page tables so that
> address translation will produce its address as result for respective
> accesses.
> 
> By making this page global, we also eliminate the need to refcount it,
> or to assign it to any domain in the first place.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks good, thanks for the changes!

Acked-by: Tim Deegan <tim@xen.org>

