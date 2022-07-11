Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B9A570478
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 15:39:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365126.595204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAtcb-0004ox-Bf; Mon, 11 Jul 2022 13:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365126.595204; Mon, 11 Jul 2022 13:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAtcb-0004n8-8p; Mon, 11 Jul 2022 13:38:45 +0000
Received: by outflank-mailman (input) for mailman id 365126;
 Mon, 11 Jul 2022 13:38:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79kg=XQ=citrix.com=prvs=184793b5a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oAtcZ-0004n2-Bk
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 13:38:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c54d62f5-011e-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 15:38:40 +0200 (CEST)
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
X-Inumbo-ID: c54d62f5-011e-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657546720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=C1JIpxUxEqS1qXuzjxxekE0wJgUC+1iqSnMv/HZ4EYg=;
  b=Sq/UaQ4GCqhUH/r1mYkWv6nTVlUrlbnh9hAxLPEz83uoVFNa4I2aI2F1
   7FYFoI0Li41OZglHqBY5N6//+npImRGfrK1LwvN+4HLef+34c4K9EseD3
   XxiEv6jIsCik9kNPCmRqX5BdLMna2I6iwqMUcZzLJ2q6ZUFvzMCyPTQIZ
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 78082890
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:10OJiqkIOxP97FCaXGm2Rsvo5gzoJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWmvQb62MY2r8Ltoja4Tjpk8BupPUnNZhTlQ4qC8zQSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EgLd9IR2NYy24DmWlrV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYVD8UG/fip9UhShxyLAhGY4xG+7L+GC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJGOWI/NkSRO3WjPH8XC619wfW1r0DZMBQEqFCNrpE2/zPMmVkZPL/Fb4OOJ43iqd9utkSSq
 3/C/m/5KgoHL9HZwj2AmlqzgsffkCW9X5gdfJWc6/VjxnOawGceDBkLfVKhpL+yjUvWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSICy
 2e0uonHOg1Tqbi/dlulqJaUrj6LAH1ARYMdXhPoXTfp8vG6/txs1UqVE486eEKmpoarQG+tm
 lhmuAB73uxO1pBTis1X6Hid21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyD8hUVPlhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeRg1bZZdJmO4O
 hO7VeZtCHh7ZSHCUEOKS9jpV5RCIVbIT7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFrXXAZZoXY
 M/BGe71VC5yIf0+kFKeGrZGuZd2l39W+I8mbc2ip/hR+eHGNCD9pHZsGAbmU93VG4ve8V+Kq
 IcPbZHQo/idOcWnChTqHUcoBQhiBRAG6Vre8qS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:cTEk8qP9Ua50g8BcTsejsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nIpoV96faUskd1ZJhOo7290cW7LU80sKQFh7X5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAtFD4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.92,263,1650945600"; 
   d="scan'208";a="78082890"
Date: Mon, 11 Jul 2022 14:38:21 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 04/25] tools/firmware/hvmloader: rework Makefile
Message-ID: <YswnzaCLry167ghv@perard.uk.xensource.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-5-anthony.perard@citrix.com>
 <35DF552D-E8EE-4478-891F-792F67D690D2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35DF552D-E8EE-4478-891F-792F67D690D2@arm.com>

On Fri, Jul 08, 2022 at 03:39:00PM +0000, Luca Fancellu wrote:
> > On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrote:
[...]
> > For "roms.inc" target, use "$(SHELL)" instead of plain "sh". And use
> > full path to "mkhex" instead of a relative one. Lastly, add "-f" flag
> > to "mv", in case the target already exist.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> > diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
> > index b754220839..fc20932110 100644
> > --- a/tools/firmware/hvmloader/Makefile
> > +++ b/tools/firmware/hvmloader/Makefile
> > @@ -87,21 +89,21 @@ roms.inc: $(ROMS)
> > 
> > ifneq ($(ROMBIOS_ROM),)
> > 	echo "#ifdef ROM_INCLUDE_ROMBIOS" >> $@.new
> > -	sh ../../misc/mkhex rombios $(ROMBIOS_ROM) >> $@.new
> > +	$(SHELL) $(XEN_ROOT)/tools/misc/mkhex rombios $(ROMBIOS_ROM) >> $@.new
> > 	echo "#endif" >> $@.new
> > endif
> > 
> > ifneq ($(STDVGA_ROM),)
> > 	echo "#ifdef ROM_INCLUDE_VGABIOS" >> $@.new
> > -	sh ../../misc/mkhex vgabios_stdvga $(STDVGA_ROM) >> $@.new
> > +	$(SHELL) $(XEN_ROOT)/tools/misc/mkhex vgabios_stdvga $(STDVGA_ROM) >> $@.new
> > 	echo "#endif" >> $@.new
> > endif
> > ifneq ($(CIRRUSVGA_ROM),)
> > 	echo "#ifdef ROM_INCLUDE_VGABIOS" >> $@.new
> > -	sh ../../misc/mkhex vgabios_cirrusvga $(CIRRUSVGA_ROM) >> $@.new
> > +	$(SHELL) $(XEN_ROOT)/tools/misc/mkhex vgabios_cirrusvga $(CIRRUSVGA_ROM) >> $@.new
> > 	echo "#endif" >> $@.new
> > endif
> > -	mv $@.new $@
> > +	mv -f $@.new $@
> 
> Here, instead of -f, is it safer -u? What’s your opinion on that? The patch looks good to me.

make want to rebuild the target, so there is no reason to keep the
existing target. We do need to overwrite the existing target if it
exist.

Thanks for the reviews!

-- 
Anthony PERARD

