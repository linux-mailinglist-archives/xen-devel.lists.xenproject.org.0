Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9587D1AE016
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 16:42:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPSCI-0001lg-Ug; Fri, 17 Apr 2020 14:42:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iNba=6B=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jPSCH-0001lb-FM
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:42:25 +0000
X-Inumbo-ID: a6850760-80b9-11ea-83d8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6850760-80b9-11ea-83d8-bc764e2007e4;
 Fri, 17 Apr 2020 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587134544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ldFwJ8f/H27/uGBJtOv7qMBB0cnH3N9x8Av4ARicKfA=;
 b=PDHanGuQKTQru7iyqh6ixzq7llVk/mAoeWVWFRNOcZaJtxeDc8T87d0b
 4NTbR7u6HQDiw7jEt4i7PlGUJV/Jhzowbqx3qKfeWxVjgYwRupJwLjLV2
 hk5o3S8VHBc4sRYKJ6DpjBYd1tF45si5ue8zUaCB0S+FSyNf0g543IEnk M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /pEXAGlykJ4dqop1vj8FVgfw0qwPoGgU0S27Ju89JPLhKYNexP7Q/3DDx0KtPE+kSHrL0dJcl3
 E5VnIJk2WUGhNiTHupbWnzdbHdBh/NsRbF4z9pT4rCYIS1UI8l4WTmrEC0JYTtmy/pUZibvJjq
 /g45nAgrwwYUn/GzG5KVjRgUk78a1YflANFcZ5Zwwd5IyraREKgUHbZs57aqmTMz/9Cmq4WWY9
 +Nav/Zk54S1MmoxSwSne8R1DV59JYAa2Ho0A2Q27o5BbbhnMWrn4MhLITs2kq9U3IzWjmSxjqB
 MWg=
X-SBRS: 2.7
X-MesageID: 16164727
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,395,1580792400"; d="scan'208";a="16164727"
Date: Fri, 17 Apr 2020 15:42:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 14/18] xen,symbols: rework file symbols selection
Message-ID: <20200417144218.GN4088@perard.uk.xensource.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-15-anthony.perard@citrix.com>
 <e28fa2b6-89c9-8e87-eaf0-91a3d6f6a62f@suse.com>
 <20200416124400.GG4088@perard.uk.xensource.com>
 <312e719f-2bae-cb29-a6dd-29ae0d976d95@suse.com>
 <20200416150929.GL4088@perard.uk.xensource.com>
 <586cff44-d46e-3a5b-9e47-0c7ff4de8801@suse.com>
 <20200417131931.GM4088@perard.uk.xensource.com>
 <83de83ee-848f-a048-7293-d1e5b01dd217@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <83de83ee-848f-a048-7293-d1e5b01dd217@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 17, 2020 at 03:39:48PM +0200, Jan Beulich wrote:
> On 17.04.2020 15:19, Anthony PERARD wrote:
> > Or do you mean keeping exception to the rule? And hope that when someone
> > changes the rule, it doesn't forget to check if the exception needs
> > changing as well?
> 
> ... "exception" like you put it (requiring special care to keep
> multiple instances in sync) is not the only way this can be done
> (and indeed I'd not want something like this). Since you have
> (in patch 15) e.g.
> 
> guest_walk_%.o: guest_walk.c FORCE
> 	$(call if_changed_rule,cc_o_c)
> 
> anyway, the desire to skip the objcopy step could be communicated
> to the command from here, without needing to clone the command.
> One way might be a special (phony) dependency, another might be to
> set some variable along the lines of
> 
> guest_walk_%.o: SPECIAL := y

I guess something like that could be done. But if possible, I'd like to
avoid that.

> > Also, I'm going to have to use this patch later anyway as sometime CC
> > use a full path to the source as file symbol. So this is going to be
> > important when we will run for example
> > `clang -o arch/x86/mm/guest_walk_2.o arch/x86/mm/guest_walk.c`.
> > (There isn't a patch for that yet.)
> 
> That's interesting - what will be the goal of that future adjustment?

It's a step toward my goal of been able to have out-of-tree build for
xen, as stated in my cover letter. In order to do that, I try to adapt
Kbuild to build Xen.

Kbuild is building the linux kernel without changing directory, so I'd
like to do the same, as it probably makes it easier to do out-of-tree
build.

Another tool I'd like to use from Kbuild is ./fixdep, it's a small
program that run after running CC and fix the dependency file that CC
generates. The main thing it does is to add a dependency on
Kconfig options that a source file uses instead of having a dependency
on whether any unrelated Kconfig has change at all. But ./fixdep from
Linux only works if we build without changing directory. ([1] for more
on fixdep)

I guess one advantage of never changing directory is that we can always
use relative path in global *FLAGS. There isn't a need to use absolute
path, which is an issue when the source tree is moved to a different
location. That can easily happen when for example you try to build in a
container (mapping the source tree inside it) then try to rebuild from
outside. (After using automation/scripts/containerize for example.)
And we don't need tricks like the .*.d2 files (which isn't needed in the
hypervisor anyway, so far at least).


[1], copied from Linux's scripts/basic/fixdep.c introduction:
    If the user re-runs make *config, autoconf.h will be
    regenerated.  make notices that and will rebuild every file which
    includes autoconf.h, i.e. basically all files. This is extremely
    annoying if the user just changed CONFIG_HIS_DRIVER from n to m.

    So we play the same trick that "mkdep" played before. We replace
    the dependency on autoconf.h by a dependency on every config
    option which is mentioned in any of the listed prerequisites.

    kconfig populates a tree in include/config/ with an empty file
    for each config symbol and when the configuration is updated
    the files representing changed config options are touched
    which then let make pick up the changes and the files that use
    the config symbols are rebuilt.

    So if the user changes his CONFIG_HIS_DRIVER option, only the objects
    which depend on "include/config/his/driver.h" will be rebuilt,
    so most likely only his driver ;-)

-- 
Anthony PERARD

