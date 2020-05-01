Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5554E1C17D2
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 16:33:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUWiF-0007ju-Ll; Fri, 01 May 2020 14:32:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojhz=6P=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jUWiE-0007jp-FG
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 14:32:22 +0000
X-Inumbo-ID: 9108da1a-8bb8-11ea-9b16-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9108da1a-8bb8-11ea-9b16-12813bfff9fa;
 Fri, 01 May 2020 14:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588343541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VMQteekUVywQm2O/041EgLV88Aa0nA+GlxeS8W/BlsQ=;
 b=gzOzvXyxWpv9zscxz8HgHsQOrCRjN/A4oJwHC+AtdIuOgVU/eQiVd+Iz
 +1eGea4249nhXaP0s13sx7MxhbXWqRcoR9uV7OZ40XEKjHOk6HtP/U40R
 FImHSM+X6NCU3B7FXHtCZmi/Viuj6CT6ylNcNDDnzyHq4N3AwrECqETzF Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Myl32l8cbv7VqxAh29KK9KoZBJH7UFlLRY6IDKdasUnMsj7DANSEFbtXeF7px8yak0RMh9S/vJ
 Saen0CmgTRXBYwlPv1fiRDvQapCwXBl8Og6DDzrqISl+btHqhzJsOeV8vczyfEk/qn4GbZKn7n
 wmSvpUilfhLD6pmqfEewn55/9ttd3hSAWtGg0aeVWCCe69PPnXVpalndScqbjYN3pcJ5s9hqKQ
 eHzzf1rZwRj8l7G9R15GJgESsnG3SkPqui7SS+N9g1ObVL1J5l+zmh/6Q3SgP7lqLnycZjhvFn
 Dv4=
X-SBRS: 2.7
X-MesageID: 16561827
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,339,1583211600"; d="scan'208";a="16561827"
Date: Fri, 1 May 2020 15:32:15 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v5 08/16] build: Introduce $(cpp_flags)
Message-ID: <20200501143215.GD2116@perard.uk.xensource.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-9-anthony.perard@citrix.com>
 <62011f46-b208-334a-4070-0bd72cb21d28@suse.com>
 <20200428140119.GC2116@perard.uk.xensource.com>
 <86af7c75-8f8b-db0a-7420-343ccd70fc33@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86af7c75-8f8b-db0a-7420-343ccd70fc33@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

On Tue, Apr 28, 2020 at 04:20:57PM +0200, Jan Beulich wrote:
> On 28.04.2020 16:01, Anthony PERARD wrote:
> > On Thu, Apr 23, 2020 at 06:48:51PM +0200, Jan Beulich wrote:
> >> On 21.04.2020 18:12, Anthony PERARD wrote:
> >>> --- a/xen/Rules.mk
> >>> +++ b/xen/Rules.mk
> >>> @@ -123,6 +123,7 @@ $(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
> >>>  
> >>>  c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_CFLAGS) '-D__OBJECT_FILE__="$@"'
> >>>  a_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_AFLAGS)
> >>> +cpp_flags = $(filter-out -Wa$(comma)%,$(a_flags))
> >>
> >> I can see this happening to be this way right now, but in principle
> >> I could see a_flags to hold items applicable to assembly files only,
> >> but not to (the preprocessing of) C files. Hence while this is fine
> >> for now, ...
> >>
> >>> @@ -207,7 +208,7 @@ quiet_cmd_cc_s_c = CC      $@
> >>>  cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
> >>>  
> >>>  quiet_cmd_s_S = CPP     $@
> >>> -cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
> >>> +cmd_s_S = $(CPP) $(cpp_flags) $< -o $@
> >>
> >> ... this one is a trap waiting for someone to fall in imo. Instead
> >> where I'd expect this patch to use $(cpp_flags) is e.g. in
> >> xen/arch/x86/mm/Makefile:
> >>
> >> guest_walk_%.i: guest_walk.c Makefile
> >> 	$(CPP) $(cpp_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
> >>
> >> And note how this currently uses $(c_flags), not $(a_flags), which
> >> suggests that your deriving from $(a_flags) isn't correct either.
> > 
> > I think we can drop this patch for now, and change patch "xen/build:
> > factorise generation of the linker scripts" to not use $(cpp_flags).
> > 
> > If we derive $(cpp_flags) from $(c_flags) instead, we would need to
> > find out if CPP commands using a_flags can use c_flags instead.
> > 
> > On the other hand, I've looked at Linux source code, and they use
> > $(cpp_flags) for only a few targets, only to generate the .lds scripts.
> > For other rules, they use either a_flags or c_flags, for example:
> >     %.i: %.c ; uses $(c_flags)
> >     %.i: %.S ; uses $(a_flags)
> >     %.s: %.S ; uses $(a_flags)
> 
> The first on really ought to be use cpp_flags. I couldn't find the
> middle one. The last one clearly has to do something about -Wa,
> options, but apart from this I'd consider a_flags appropriate to
> use there.
> 
> > (Also, they use -Qunused-arguments clang's options, so they don't need
> > to filter out -Wa,* arguments, I think.)
> 
> Maybe we should do so too then?
> 
> > So, maybe having a single $(cpp_flags) when running the CPP command
> > isn't such a good idea.
> 
> Right - after all in particular the use of CPP to produce .lds is
> an abuse, as the source file (named .lds.S) isn't really what its
> name says.
> 
> > So, would dropping $(cpp_flags) for now, and rework the *FLAGS later, be
> > good enough?
> 
> I don't think so, no, I'm sorry. cpp_flags should be there for its
> real purpose. Whether the .lds.S -> .lds rule can use it, or should
> use a_flags, or yet something else is a different thing.


OK. I think we can rework the patch to derive cpp_flags from c_flags,
use this new cpp_flags for %.i:%.c; but keep using a_flags for %.s:%.S.

As for the .lds, we could use this new cpp_flags, the only think I saw
missing was -D__ASSEMBLY__, which can be added to the command line.
(There would also be an extra -std=gnu99, but I don't think it matters.)

Does that sounds good?
(Just two patch to change, this one and the one reworking .lds
generation.)


As for using -Qunused-arguments with clang, I didn't managed to find the
documentation of clang's command line argument for clang 3.5 on llvm
website, but I found it for clang 5.0 and the option is listed there.
I've tested building Xen on our gitlab CI, which as debian jessie which
seems to have clang 3.5, and Xen built just fine. So that might be an
option we can use later, but probably only for CPP flags.

Thanks,

-- 
Anthony PERARD

