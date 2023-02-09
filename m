Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED4B690FC5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 19:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492885.762647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQBDR-0005Tz-6u; Thu, 09 Feb 2023 18:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492885.762647; Thu, 09 Feb 2023 18:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQBDR-0005RF-3W; Thu, 09 Feb 2023 18:00:13 +0000
Received: by outflank-mailman (input) for mailman id 492885;
 Thu, 09 Feb 2023 18:00:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rTn=6F=citrix.com=prvs=3970fcfec=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pQBDP-0005R9-At
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 18:00:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96f87304-a8a3-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 19:00:09 +0100 (CET)
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
X-Inumbo-ID: 96f87304-a8a3-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675965609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wl3c0Qfxyvotoj1ZLLkshjDTcebAgiJ+acqaZNuN4gI=;
  b=UiSk2rersj97rcepSimBLx4n6+ROXRuicRmhHZrVXXpLE8gD80akZmWi
   Bh70t4+GF1OgJk8JA8JRj9WhvdcCZ5C0LN5uED8TnC/zFKGZ4HZ7gtkrM
   ILolKzxpeQp83DELfDLtVFK3PfmlAMcNKrtWGBck3KBf0RNK0KHp6LnHF
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95248249
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:jPER9qD30CzfTRVW///jw5YqxClBgxIJ4kV8jS/XYbTApD933mMGz
 WtLD2CDPqzYYmHzeItwO4Xn8ElS6pDTyNRmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlA7wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwq/RzBCZ82
 P0jExMCTBqIrdDo+7WeY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9K4HQGZUPwhfwS
 mTup0X7QQ8YKsOllz+dzCmIptTFnzPiR9dHfFG/3qEz2wDCroAJMzUUX1ampfiyimalRslSb
 UcT/0IGr7U29UGtZsnwWVu/unHslgUHR9NaHuk+6QeM4qnZ+QCUAi4DVDEpQMMinN87Q3otz
 FDht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLqZk+lBvVQv5/EaS+iZv+HjSY/
 tyRhHFg3fNJ15dNjvjluwmd2FpAu6QlUCZk9AHSGVCI7zhCR4GHbYeC2wbg6tNpedPxoka6g
 FAInM2X7eYrBJ6LlTCQTOhlIIxF98ppIxWH3wcxQsBJGyCFvif6INsOuG0WyFJBaJ5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmO2vpnkGia24hTqFfK0QfUYXZ
 /+mnT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiHIGedcaAXfP7pohE9hnOkz2
 40PXydt40wAONASnwGNqdJDRbz0BSdT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7GJbIwM/tokC
 kqVAxcCoHKm3C2vFOl/Qiw7AF8Zdcol/C1T0O1FFQrA5kXPlq71tv1PJsJoJ+V8nAGhpNYtJ
 8Q4lwy7KqwnYlz6F/41N/ERcKQKmMyXuD+z
IronPort-HdrOrdr: A9a23:OsXi9qMyDOqU/sBcTjejsMiBIKoaSvp037BK7S1MoHtuA6qlfq
 GV7ZMmPHrP4gr5N0tOpTntAse9qDbnhP1ICOoqTNOftWvd2FdARbsKheffKn/bak/DH4Zmvp
 uIGJIObeEYY2IasS77ijPIbOrJwrO8gd6VbTG19QYdceloAZsQnzuQEmygYzRLrJEtP+tFKH
 KbjPA33waISDAsQemQIGIKZOTHr82jruObXfZXbyRXkzVnlFmTmcTHLyQ=
X-IronPort-AV: E=Sophos;i="5.97,284,1669093200"; 
   d="scan'208";a="95248249"
Date: Thu, 9 Feb 2023 17:59:57 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@cloud.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Proposal for consistent Kconfig usage by the hypervisor build
 system
Message-ID: <Y+U0nWkIXmksbHM7@perard.uk.xensource.com>
References: <d77c1a7a-9d15-491d-38fa-99739f20bebd@suse.com>
 <906028ef-b9cd-93bd-8ee2-f263851496f5@citrix.com>
 <b899223d-6e13-af64-2359-76d0c30ec46e@suse.com>
 <CA+zSX=Z+y5CkSR-xBpgeLx_gouuGbbNd3c2z12OKeSODsKimDA@mail.gmail.com>
 <383dfffe-ed1b-7539-d601-c9e7caee22ee@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <383dfffe-ed1b-7539-d601-c9e7caee22ee@suse.com>

On Thu, Feb 09, 2023 at 05:08:10PM +0100, Jan Beulich wrote:
> On 09.02.2023 17:02, George Dunlap wrote:
> > On Thu, Feb 9, 2023 at 1:43 PM Jan Beulich <jbeulich@suse.com> wrote:
> > 
> >> On 02.02.2023 16:51, Andrew Cooper wrote:
> >>> On 12/01/2023 4:52 pm, Jan Beulich wrote:
> >>
> >> Anyway, I have a prototype for the two CET controls mostly ready now, so
> >> I guess we'll continue the discussion there once I've submitted that one.
> >>
> > 
> > One thing that it occured to me will be important: `make randconfig` must
> > continue to work somehow.
> 
> Hmm, good point. For now I've merely added a TBD to the patch I've already
> sent. Right now I can't see how that might be possible without the user
> specifying which options cannot be turned on due to tool chain dependencies
> (by way of a seeding .config, I suppose).
> 
> >  I'm not sure how Anthony's patch to deal with `checkpolicy` deals with that.
> 
> Given his remark on the community call I did actually try to locate it,
> assuming that it had at least "policy" in the title. But I couldn't find
> anything in my mailbox.

0b000a2ce813 ("xen: rework `checkpolicy` detection when using "randconfig"")

It boil down to adding "CONFIG_XSM_FLASK_POLICY=n" via
KCONFIG_ALLCONFIG option. The macro $(filechk_kconfig_allconfig,) does
the job.

-- 
Anthony PERARD

