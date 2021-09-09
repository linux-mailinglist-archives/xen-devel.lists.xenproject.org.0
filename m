Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAC6404832
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 12:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182933.330801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGtk-0002Dp-Rx; Thu, 09 Sep 2021 10:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182933.330801; Thu, 09 Sep 2021 10:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGtk-0002By-Oe; Thu, 09 Sep 2021 10:03:12 +0000
Received: by outflank-mailman (input) for mailman id 182933;
 Thu, 09 Sep 2021 10:03:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o0l/=N7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mOGtj-0002Bo-KF
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 10:03:11 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 230f70c2-1155-11ec-b1ab-12813bfff9fa;
 Thu, 09 Sep 2021 10:03:10 +0000 (UTC)
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
X-Inumbo-ID: 230f70c2-1155-11ec-b1ab-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631181790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IeINUvl4C5/dwCvB0P3GDK7VX2gf3en260aSHwb3l2s=;
  b=RQOkfmaGf2jS9OC3w/3NvDqOTl2vKW/hRYkdkq+hv4uKL0cJRqIHVQtk
   Tg2aYw6Bn4ELBDqBszlKiw7b2ZVYlEVYqb/5G/Jxk/Qn5J182lFc49Iw/
   PANkind510sybwER+lSU/ZCJc1POlP2JSLlvAgJxSGE82KNJO0xREYCpg
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Beew7uxmj13Bf6E7BNydK8vV6TYcJqe4lFR7RgGL6M1GtVcvhQO1/klaiR+xBrIiW/OaB699zQ
 4Tpbx1mFQx4axiKrz4ijccBj3bCBmH2UWj5+5ErYZbj4J+GC2OmQZMsCccvC+G+PF6xdrkOpw7
 7IVpTFS8J3deaF9bfg7vA1a2HeOISzqTuBfn7uBeaesg2UbUkE0rSWm/qMzeECPjPBmhY7x0qE
 tFWw3outJTEQzSF5GBKhGC0UJb8HmPWG0f0moEFqEQpxcNVNl7/wivYUHpIpjcY5p30qxMrFYc
 mFUw8KV5KShNbMUSvXGgjRZa
X-SBRS: 5.1
X-MesageID: 52326854
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:dlFoSaHOfsfhSQjwpLqE6seALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZUgpHvJYVkqNE3I9eruBEDEewK7yXcX2/h1AV7BZniEhILAFugLhuGO/9SjIVydygc079
 YYT0EUMr3N5DZB4/rH3A==
X-IronPort-AV: E=Sophos;i="5.85,279,1624334400"; 
   d="scan'208";a="52326854"
Date: Thu, 9 Sep 2021 11:03:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, "Tim
 Deegan" <tim@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 05/51] x86/mm: avoid building multiple .o from a
 single .c file
Message-ID: <YTnb2J/49D5KaLeQ@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-6-anthony.perard@citrix.com>
 <e633af0e-a34c-3c11-49ba-1e2c6f544613@suse.com>
 <YTibMaayiWlJwcZ/@perard>
 <27874b1a-70cb-e647-d271-93ef12dc40dc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <27874b1a-70cb-e647-d271-93ef12dc40dc@suse.com>

On Wed, Sep 08, 2021 at 02:01:43PM +0200, Jan Beulich wrote:
> On 08.09.2021 13:14, Anthony PERARD wrote:
> > What kind of issue is there with those tiny source files?
> 
> To me they're ugly and their presence is at least mildly confusing.
> And apparently I'm not the only one thinking that way, or else such
> tiny stubs would have been put there right when introducing these
> multiply built sources.

Well, at the time when this was introduced, tools/symbols didn't exist,
so avoiding the stubs might have been ok by then, but it meant to
duplicated %.o:%.c rules in the Makefile...

Now, we have tools/symbols, a hack put into the source file to add a
".file instruction", a heuristic in tools/symbols to pick up the ".file"
we want, and a workaround to change in behavior of binutils.

This is a lot of complexity to avoid introducing those extra source
files... complexity that were needed to by added _after_ the initial
introduction of multiply built sources, due to changes in the build
system.

My patches have attempted to remove all the complexity, and having ugly
small source files is the price to pay. And you want to add back some
complexity in the build system just to avoid those tiny files? I mean
hypervisor and build system are complex software to write, do we really
need to add complexity at every opportunity?

-- 
Anthony PERARD

