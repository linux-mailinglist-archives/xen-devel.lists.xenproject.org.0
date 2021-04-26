Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E875636B867
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 19:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117877.223833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5S7-00065V-7p; Mon, 26 Apr 2021 17:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117877.223833; Mon, 26 Apr 2021 17:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5S7-000656-4d; Mon, 26 Apr 2021 17:55:23 +0000
Received: by outflank-mailman (input) for mailman id 117877;
 Mon, 26 Apr 2021 17:55:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/oNb=JX=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lb5S6-00063z-4b
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 17:55:22 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29f2d5a3-d2a7-4d32-942e-728e8f647f4a;
 Mon, 26 Apr 2021 17:55:21 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lb5S3-000668-KQ; Mon, 26 Apr 2021 17:55:19 +0000
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
X-Inumbo-ID: 29f2d5a3-d2a7-4d32-942e-728e8f647f4a
Date: Mon, 26 Apr 2021 18:55:19 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v4 1/3] VMX: use a single, global APIC access page
Message-ID: <YIb+h9BKG5w+Px6P@deinos.phlegethon.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <3e7ad009-f062-d58a-9380-103ce1573a73@suse.com>
 <837a427a-a74e-00e9-70c7-1d3cfa28b30c@suse.com>
 <YILXDfXfR69mwfHH@Air-de-Roger>
 <d4c91967-2934-5b55-4228-e8028a5c4290@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4c91967-2934-5b55-4228-e8028a5c4290@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 16:42 +0200 on 23 Apr (1619196141), Jan Beulich wrote:
> On 23.04.2021 16:17, Roger Pau Monné wrote:
> > On Fri, Apr 23, 2021 at 12:52:57PM +0200, Jan Beulich wrote:
> >> +    if ( mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) &&
> > 
> > Nit: I would prefer if assigned mfn outside of the condition, like
> > it's done in the chunk added to shadow_get_page_from_l1e.
> 
> Well, I did it differently here because the variable really is
> only needed inside the if(), whereas in "get" the subsequent
> patches use it elsewhere as well. I'll wait what Tim says.

No strong feelings on this, but since you asked me, I would also
prefer it to be outside the condition.

Cheers,

Tim.

