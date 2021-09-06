Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29676401970
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 12:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179558.325880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNBVz-000456-Lq; Mon, 06 Sep 2021 10:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179558.325880; Mon, 06 Sep 2021 10:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNBVz-00041x-Hz; Mon, 06 Sep 2021 10:06:11 +0000
Received: by outflank-mailman (input) for mailman id 179558;
 Mon, 06 Sep 2021 10:06:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Prhc=N4=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mNBVx-00041r-Fx
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 10:06:09 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07395f79-cf56-48d6-84eb-f99b86417c34;
 Mon, 06 Sep 2021 10:06:05 +0000 (UTC)
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
X-Inumbo-ID: 07395f79-cf56-48d6-84eb-f99b86417c34
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630922765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+fziuhvRpesrSNJ0c58bAv+DQLU4/GtqeroDqk51ko=;
  b=Txa8Q1FrwWSYqb/7kg10gt9OvL4/smv5v490hv3SJmlSN3zQPZEVPVLr
   Ij5zWv9IZQQ3hnx5x+IssLtSZl1cD1+/ZKdkhY7eSVssduiwm9B+lmXmg
   q71FK9u/mKlOQoYEbFlCQSpGOIALn8cjLsP/9AVcJsOSVdOtvRirMNShg
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: So0UWvXWJbMpiG7Qti2/no7YCzlCG/49Hbao8u9m0kWwGa0lkGO5dvExafKxklAzj6OIWJamLg
 cp8/WRGR8mmTOnsMmWeFPRem/SIRvIqxXhQlaNtBpdnRTlGed76w2mPf2U5QL0msZnaYmANnsh
 Bciibf9T7J6C6ZsT/cv4YyO1XNErb0FJvTrKxPQSje3IBPOWRlR9upE5+nzu4vJ21rcZ9c/ywK
 CizNEtVFksmMTBKez0xygl1B+nroj0HtV5W71BMYJs8AocF9ixeEsMlfJ/LWf0DKPSYXkA3IM4
 0FJk65YWwePoNZZvCarQLjN7
X-SBRS: 5.1
X-MesageID: 52079071
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AGu+uavt4251vxZfbGl7V1O47skDdtV00zEX/kB9WHVpmszxra
 6TddAgpHvJYVcqKRQdcL+7VZVoLUmxyXcx2/h3AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IObuEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="52079071"
Date: Mon, 6 Sep 2021 11:06:01 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, "Tim
 Deegan" <tim@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 01/51] build: introduce cpp_flags macro
Message-ID: <YTXoCQ3SSvN4eU/C@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-2-anthony.perard@citrix.com>
 <ba3cfb06-1d89-ff62-1012-6edc2a9c5259@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ba3cfb06-1d89-ff62-1012-6edc2a9c5259@suse.com>

On Thu, Sep 02, 2021 at 12:08:58PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:49, Anthony PERARD wrote:
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit with a remark:
> 
> > --- a/xen/Rules.mk
> > +++ b/xen/Rules.mk
> > @@ -133,6 +133,9 @@ endif
> >  # Always build obj-bin files as binary even if they come from C source. 
> >  $(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
> >  
> > +# To be use with $(a_flags) or $(c_flags) to produce CPP flags
> > +cpp_flags = $(filter-out -Wa$(comma)% -flto,$(1))
> 
> Afaics this has nothing to do with Linux'es cpp_flags, so what we do here
> is entirely up to us. If this is strictly intended to be used the another
> macro, wouldn't it make sense to have
> 
> cpp_flags = $(filter-out -Wa$(comma)% -flto,$($(1)))
> 
> here and then e.g. ...
> 
> > @@ -222,13 +225,13 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): %.init.o: %.o FORCE
> >  	$(call if_changed,obj_init_o)
> >  
> >  quiet_cmd_cpp_i_c = CPP     $@
> > -cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -MQ $@ -o $@ $<
> > +cmd_cpp_i_c = $(CPP) $(call cpp_flags,$(c_flags)) -MQ $@ -o $@ $<
> 
> ... the slightly simpler / easier to read
> 
> cmd_cpp_i_c = $(CPP) $(call cpp_flags,c_flags) -MQ $@ -o $@ $<
> 
> here?

I don't think this is better or simpler. "cpp_flags" don't need to know
the name of the variable to be useful. I think it is better to know that
"cpp_flags" act on the value of the variable rather than the variable
itself, when reading "$(call cpp_flags, $(a_flags))".

But thanks for the suggestion, and for the review,

-- 
Anthony PERARD

