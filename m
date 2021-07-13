Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF353C72B8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 16:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155455.286970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Jrm-0002jD-6s; Tue, 13 Jul 2021 14:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155455.286970; Tue, 13 Jul 2021 14:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Jrm-0002gj-3t; Tue, 13 Jul 2021 14:58:34 +0000
Received: by outflank-mailman (input) for mailman id 155455;
 Tue, 13 Jul 2021 14:58:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8l0=MF=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m3Jrk-0002gd-6n
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 14:58:32 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bdf917e-2927-499f-838d-3964e6969f9b;
 Tue, 13 Jul 2021 14:58:30 +0000 (UTC)
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
X-Inumbo-ID: 5bdf917e-2927-499f-838d-3964e6969f9b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626188310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RZMpCbqD5drMfUio+HAs5niwWvaS/B493xQBUNIla0o=;
  b=VKPk2d9vUyWVPHKvKnqJedti7sUKR31zFPtfzs3wtY37clGvqUnG3MsE
   mtUNFeeZxAyodvL4ahhTK8lMIqWTVOJDcioYHZCWhCm6hR49zDcNGwiQ8
   DUBCmqxctDHUhZRpwLJg+rwtBQQTO6YGYITZ57/8pUW3HCqman+mBMsNh
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: drYYIWQU6jP0kFVdig1/onAD4lTM0PqCNoWy2ZORMVmc3GPZiP1Dl2lBf0nha2bYA1gT81mIWu
 BGtOApQqi2ThYLYA1OhMTDVqCKc6VxFBL/XyfwdpA4BnA1zBuDcqD0f0gYIneYeVRkXvNzSjGb
 jIpc2+Ma3jk5zQ7Ylga9oD4o+tfLkIl8GO2F73yApnKxP9aI+McIjfll06urNeM5RTtT3PEH/z
 98K4lINIuLkZtEkceeNlI/C1i/r3hLB80Wil30o/DCasS5aDIfxQsXB+KGUavR/piBJ+9r+oGo
 RwQ=
X-SBRS: 5.1
X-MesageID: 47866055
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3ocXg6hgXK7alHLTgJEt6h8tsnBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.84,236,1620705600"; 
   d="scan'208";a="47866055"
Date: Tue, 13 Jul 2021 15:58:25 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 17/31] build: convert binfile use to if_changed
Message-ID: <YO2qEaFOMVM3xvkO@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-18-anthony.perard@citrix.com>
 <dbb33a01-d54b-d4f3-caf3-5e5544d52095@suse.com> <YOxurzTEAfW3I8yU@perard>
 <ddc38760-c042-febb-822f-560a4b613e91@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ddc38760-c042-febb-822f-560a4b613e91@suse.com>

On Tue, Jul 13, 2021 at 09:51:45AM +0200, Jan Beulich wrote:
> On 12.07.2021 18:32, Anthony PERARD wrote:
> > On Wed, Jul 07, 2021 at 05:48:57PM +0200, Jan Beulich wrote:
> >> On 01.07.2021 16:09, Anthony PERARD wrote:
> >>> --- a/xen/common/Makefile
> >>> +++ b/xen/common/Makefile
> >>> @@ -80,8 +80,12 @@ config.gz: $(CONF_FILE)
> >>>  
> >>>  config_data.o: config.gz
> >>>  
> >>> -config_data.S: $(BASEDIR)/tools/binfile
> >>> -	$(SHELL) $(BASEDIR)/tools/binfile $@ config.gz xen_config_data
> >>> +quiet_cmd_binfile = BINFILE $@
> >>> +cmd_binfile = $(SHELL) $< $@ config.gz xen_config_data
> >>
> >> This is an abuse of $< which I consider overly confusing:
> >> $(BASEDIR)/tools/binfile is not the input file to the rule. Instead
> >> the script generates an assembly file "out of thin air", with not
> >> input files at all. The rule and ...
> >>
> >>> +config_data.S: $(BASEDIR)/tools/binfile FORCE
> >>
> >> ... dependency shouldn't give a different impression. What would
> >> be nice (without having checked how difficult this might be) would
> >> be if quiet_cmd_binfile and cmd_binfile could move to xen/Rules.mk
> >> and merely be used from here (and the other location, where the
> >> same concern obviously applies).
> > 
> > I've though of having cmd_binfile in Rules.mk, but it's made more
> > complicated by having a "-i" flag used in flask/.
> > 
> > So one things I've writen was:
> > 
> > config_data.S: $(BASEDIR)/tools/binfile FORCE
> >        $(call if_changed,binfile,,config.gz xen_config_data)
> > flask-policy.S: $(BASEDIR)/tools/binfile FORCE
> >        $(call if_changed,binfile,-i,policy.bin xsm_flask_init_policy)
> > 
> > with:
> > cmd_binfile = $(SHELL) $(BASEDIR)/tools/binfile $(2) $@ $(3)
> > 
> > I thought this would be confusing, so I avoid it.
> 
> Indeed that's why I did write "without having checked how difficult
> this might be", because I definitely didn't want to suggest such
> anomalies to get introduced. It's unhelpful that options have to
> come first.
> 
> > But maybe with the lists of flags at the end, it would be better:
> >    $(call if_changed,binfile,policy.bin xsm_flask_init_policy,-i)
> 
> Yes, this is a little better imo, but still not pretty.
> 
> > Still want to move cmd_binfile to Rules.mk?
> 
> I'd still like it to be moved, but without resulting in a rule
> that's not consistent with others. Maybe we should have a
> BINFILE_FLAGS variable (paralleling e.g. CFLAGS)?

Sound good.

    cmd_binfile = $(SHELL) $(BASEDIR)/tools/binfile $(BINFILE_FLAGS) $@ $(2)

    flask-policy.S: BINFILE_FLAGS := -i
    flask-policy.S: $(BASEDIR)/tools/binfile FORCE
           $(call if_changed,binfile,policy.bin xsm_flask_init_policy)

Would the above be OK?
Otherwise, maybe you'll prefer the following:

    flask-policy.S: BINFILE_FLAGS = -i $@ policy.bin xsm_flask_init_policy
    flask-policy.S: $(BASEDIR)/tools/binfile FORCE
           $(call if_changed,binfile)

Thanks,

-- 
Anthony PERARD

