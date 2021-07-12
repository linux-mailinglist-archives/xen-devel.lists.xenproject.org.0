Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF463C5B25
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 13:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154523.285522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2tnv-0001HS-9t; Mon, 12 Jul 2021 11:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154523.285522; Mon, 12 Jul 2021 11:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2tnv-0001En-6q; Mon, 12 Jul 2021 11:08:51 +0000
Received: by outflank-mailman (input) for mailman id 154523;
 Mon, 12 Jul 2021 11:08:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKSD=ME=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m2tnt-0001Eh-Tg
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 11:08:49 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 881d88ab-e301-11eb-86e4-12813bfff9fa;
 Mon, 12 Jul 2021 11:08:48 +0000 (UTC)
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
X-Inumbo-ID: 881d88ab-e301-11eb-86e4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626088128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lJUq4Z0u3S96kD1s6DMoESEiQ6//EUE6Tykso2B4kOE=;
  b=C7r7XwxWA9JISTxu+WO9RVaQ/yXC9V2NMMn80ubJqRJKKiQwQRNtMB2d
   DPgAgrKe1YcYaHtevUFdEJUW5O3y26OvtonEMnNOTDDjDPNZmK7aCycZL
   uB6e8SE7fIS1aaXNkTC+Db4rB0dNx61ZtZcko9idmDIylqBxePz+pL2J3
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bY4JrQDKTjk3mTik+xtB+spGuvyL1L4MAUTe7ke5+ppupXX9lNziMY5cJ1kEaknG1MVTXunMW1
 1AvE0XyWtLMuxHnd+tr7nqEAUfeqHkWXyyRfwu5jKa/HYSdirN0DUYWwYuR/pIm+dZuPPDCrvw
 KauvP3cd71GaRk8qsq9+D1mcAHKSy+yInxDkt4skbOky53fWOHA0qP9E9Q+FJQ+UTv7paG23bO
 ApqpCPWa/73dZY2j7C8SxdVqkXTYgReD2g8Q7j+62Exeh2wl50IWsAOLAsSlwCJvEodzpVe7H+
 3JM=
X-SBRS: None
X-MesageID: 48049175
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ds4ZrKNxS/SR4MBcTsOjsMiBIKoaSvp037Eqv3oRdfVwSL3+qy
 nOpoV+6faaslossR0b9uxofZPwJ080lqQFhLX5X43SPzUO0VHAROoJgLcKgQeQeREWntQtrJ
 uIGJIfNDSfNzZHsfo=
X-IronPort-AV: E=Sophos;i="5.84,232,1620705600"; 
   d="scan'208";a="48049175"
Date: Mon, 12 Jul 2021 12:08:34 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v6 03/31] build: use if_changed on built_in.o
Message-ID: <YOwisvhJDI4upgEk@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-4-anthony.perard@citrix.com>
 <9bb04af6-105f-1040-d71e-799497034f2f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9bb04af6-105f-1040-d71e-799497034f2f@citrix.com>

On Thu, Jul 08, 2021 at 01:03:46PM +0100, Andrew Cooper wrote:
> On 01/07/2021 15:09, Anthony PERARD wrote:
> > diff --git a/xen/Rules.mk b/xen/Rules.mk
> > index f778058f80a6..6a0cdfde2eed 100644
> > --- a/xen/Rules.mk
> > +++ b/xen/Rules.mk
> > @@ -147,17 +147,22 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
> >  c_flags += $(CFLAGS-y)
> >  a_flags += $(CFLAGS-y) $(AFLAGS-y)
> >  
> > -built_in.o: $(obj-y) $(if $(strip $(lib-y)),lib.a) $(extra-y)
> > -ifeq ($(strip $(obj-y)),)
> > -	$(CC) $(c_flags) -c -x c /dev/null -o $@
> > -else
> > +quiet_cmd_cc_builtin = LD      $@
> 
> s/LD/CC/

Will fix that.

Thanks,

-- 
Anthony PERARD

