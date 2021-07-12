Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE373C60AA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 18:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154636.285712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2yrW-0006b3-VM; Mon, 12 Jul 2021 16:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154636.285712; Mon, 12 Jul 2021 16:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2yrW-0006Xe-SJ; Mon, 12 Jul 2021 16:32:54 +0000
Received: by outflank-mailman (input) for mailman id 154636;
 Mon, 12 Jul 2021 16:32:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKSD=ME=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m2yrV-0006XY-4Z
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 16:32:53 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2c77bbe-13ff-4d4f-a893-80180d4e9d5a;
 Mon, 12 Jul 2021 16:32:51 +0000 (UTC)
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
X-Inumbo-ID: d2c77bbe-13ff-4d4f-a893-80180d4e9d5a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626107571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QqjednZWiW7Krg0g4ko5oGfOhVausO7FISERS9qFUHM=;
  b=XrPh4FDE9qifJQh0sw8Y2DR0RgM4a0zvxQvRORVBpjizpG5gSRgv+mlH
   hnZo0XIdYFNpO/JH7+NaVQVpqm5gS7dUMlIKLo2itmj64sVen11GieDDX
   G7raHaj6my9zRxGCjkcDP2idpXfpFVP6fMN/p8CTwq5nBBWHTU8R2TAoA
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SCMWdATDDpfEzRf6O7buMkpv1TprRQxLbNWdQM5/6DL202IqcZMASy0Fk7L5g4TH97zWlhTlbT
 +c0RDVKF50sHCgOJXzr9A9RPssML6Fs5oqj8616c+3BlTUHOf1fvvuAuz7S5Q2FnZCsUkEylXi
 f2CTVp4NUw/O8qQwHZChkD1kkkYCu3Aa16XTEHHrfnuNlco7ix/fWpEYZGCKDq5e3Y5ncSI0/3
 86aFqUV9UcWZ2Ndo16BHFUo+Y7z57p0khSw7kbPSwhVyZfhQ0zd4i0MUpdRk7QTJL8MPeFjNqF
 Z/g=
X-SBRS: 5.1
X-MesageID: 49725095
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lLzoDKFazmVvpUcApLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.84,234,1620705600"; 
   d="scan'208";a="49725095"
Date: Mon, 12 Jul 2021 17:32:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 17/31] build: convert binfile use to if_changed
Message-ID: <YOxurzTEAfW3I8yU@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-18-anthony.perard@citrix.com>
 <dbb33a01-d54b-d4f3-caf3-5e5544d52095@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dbb33a01-d54b-d4f3-caf3-5e5544d52095@suse.com>

On Wed, Jul 07, 2021 at 05:48:57PM +0200, Jan Beulich wrote:
> On 01.07.2021 16:09, Anthony PERARD wrote:
> > --- a/xen/common/Makefile
> > +++ b/xen/common/Makefile
> > @@ -80,8 +80,12 @@ config.gz: $(CONF_FILE)
> >  
> >  config_data.o: config.gz
> >  
> > -config_data.S: $(BASEDIR)/tools/binfile
> > -	$(SHELL) $(BASEDIR)/tools/binfile $@ config.gz xen_config_data
> > +quiet_cmd_binfile = BINFILE $@
> > +cmd_binfile = $(SHELL) $< $@ config.gz xen_config_data
> 
> This is an abuse of $< which I consider overly confusing:
> $(BASEDIR)/tools/binfile is not the input file to the rule. Instead
> the script generates an assembly file "out of thin air", with not
> input files at all. The rule and ...
> 
> > +config_data.S: $(BASEDIR)/tools/binfile FORCE
> 
> ... dependency shouldn't give a different impression. What would
> be nice (without having checked how difficult this might be) would
> be if quiet_cmd_binfile and cmd_binfile could move to xen/Rules.mk
> and merely be used from here (and the other location, where the
> same concern obviously applies).

I've though of having cmd_binfile in Rules.mk, but it's made more
complicated by having a "-i" flag used in flask/.

So one things I've writen was:

config_data.S: $(BASEDIR)/tools/binfile FORCE
       $(call if_changed,binfile,,config.gz xen_config_data)
flask-policy.S: $(BASEDIR)/tools/binfile FORCE
       $(call if_changed,binfile,-i,policy.bin xsm_flask_init_policy)

with:
cmd_binfile = $(SHELL) $(BASEDIR)/tools/binfile $(2) $@ $(3)

I thought this would be confusing, so I avoid it.
But maybe with the lists of flags at the end, it would be better:
   $(call if_changed,binfile,policy.bin xsm_flask_init_policy,-i)

Still want to move cmd_binfile to Rules.mk?

But I can at least spell "tools/binfile" instead of using $<.

Thanks,

-- 
Anthony PERARD

