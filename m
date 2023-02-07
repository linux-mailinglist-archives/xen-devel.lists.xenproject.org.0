Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE63568D5A4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 12:37:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491041.759990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPMHw-0000XL-JD; Tue, 07 Feb 2023 11:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491041.759990; Tue, 07 Feb 2023 11:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPMHw-0000UQ-GG; Tue, 07 Feb 2023 11:37:28 +0000
Received: by outflank-mailman (input) for mailman id 491041;
 Tue, 07 Feb 2023 11:37:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if6N=6D=citrix.com=prvs=3954b4a48=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pPMHu-0000UK-Pr
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 11:37:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c88f70ef-a6db-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 12:37:23 +0100 (CET)
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
X-Inumbo-ID: c88f70ef-a6db-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675769844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2RdYT+BhoSAbPtnOB239Ez6A+I/nIOHIo1uOpKSaS7Y=;
  b=KAbPJAjNAgXvoJZ61WCVzRxgpnxJskEBoSh+zVNTVCmb3GDfIti64CaR
   mzl/G0WCAHI5Zlvd69V33Q0fTDayb/5pm2c1JSDqcYTBeZyigg+p0Ro3m
   34BStQ6tSUyjXAj6LcLODYGUmPT4coXNLKbRBx63ANftVtTsub7b+D4X5
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96408112
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:TbkC0apdLqPdEOCITZ222Hkxqv9eBmI+ZRIvgKrLsJaIsI4StFCzt
 garIBnQM6zcYGamKN4jbIu3pk9Vv5WEyYBkG1c9qyhhE3sQ8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzyZNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGEHPhPT2c2s+4+2UbQ32PoSc9vSLqpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jOYozypW0hAXDCZ4Wbcylf8pOrMpircXZoySq+e6KBA2ELGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Ul7Cmdx6yS5ByWbkAGQSRGc8cOr9ItSHoh0
 Vrht9rxCCZmqrG9VXOX/bDSpjS3URX5NkdbO3VCF1FcpYC+/sdq1Emnostf/LCd39elGmGu7
 CqxkSUl2u5Ns/9UxZyp1AWS696znaThQgkw7wTRe2uq6AJleYKoD7CVBUjnAeVod9jAEATY1
 JQQs43Htb1VU8nR/MCYaL9VdIxF8cppJ9E1bbRHO5A6vwqg9He4FWy7yGEvfRw5WirolNKAX
 aMyhe+zzMULVJdJRfUtC25UNyjN5faIKDgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJjzUClCWfg/k2bsHY/xNIPHIQhnlAvuqW3TlUz7gdJymlbFIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WO0HqHXooBQlSdxATXMmmw/G7g8bfemKK7kl9Ua6OqV7gEqQ595loehDgo
 ijnBR8AmAKh3hUq62yiMxheVV8mZr4nxVpTAMDmFQ/AN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:WD7fC65FdlX33dJLQQPXwYOCI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6QxhP03I/OrrBEDuewK5yXcY2/hoAV7BZnibhILYFvAe0WKK+VSJcECelp856U
 p5SdkdNDSaNykAsS+V2njDLz8V+qj5zEnkv5ao815dCSVRL41w5QZwDQiWVmVwWQl9HJI8UL
 aM+8ZdoDKkWHIPKuC2HGMMUeTvr8DC0MuOW29OOzcXrC21yR+44r/zFBaVmj8YTjN02L8ntU
 TVjgDj4a2nkvejjjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHffWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdqTUJhFwVmhzf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKprzPKN
 MeTf002cwmPG9yLkqp9FWH+ebcFUjbyy32DnTruaSuoktrdT5CvgslLfck7wc9HaIGOud5Dt
 v/Q9VVfZF1P7orhPFGdZM8qI2MeyTwaCOJCXmVJ1v/EqEBJjbil77biY9Fpt2CSdgw1501l4
 3GUFRE8UgIW2yrJ/Gv8fRwg1PwqEPUZ0Wo9iib3ek9hpTMAIDGC2mobncAs+WdmN0jIuv9H8
 yeBfttcpneBGHzA5tO2wHke7Q6EwhmbPEo
X-IronPort-AV: E=Sophos;i="5.97,278,1669093200"; 
   d="scan'208";a="96408112"
Date: Tue, 7 Feb 2023 11:37:12 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [XEN PATCH for-4.17 v6 2/5] libs/light: Rework targets
 prerequisites
Message-ID: <Y+I36LIDzNwiwI83@perard.uk.xensource.com>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
 <20230120194431.55922-3-anthony.perard@citrix.com>
 <fff0eb32-cc4d-a3b5-c637-58f643cb644a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fff0eb32-cc4d-a3b5-c637-58f643cb644a@citrix.com>

On Mon, Feb 06, 2023 at 06:02:51PM +0000, Andrew Cooper wrote:
> On 20/01/2023 7:44 pm, Anthony PERARD wrote:
> > diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> > index cd3fa855e1..b28447a2ae 100644
> > --- a/tools/libs/light/Makefile
> > +++ b/tools/libs/light/Makefile
> > @@ -178,13 +175,13 @@ libxl_x86_acpi.o libxl_x86_acpi.opic: CFLAGS += -I$(XEN_ROOT)/tools
> >  $(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenguest)
> >  
> >  testidl.o: CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenlight)
> > -testidl.c: libxl_types.idl gentest.py $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
> > -	$(PYTHON) gentest.py libxl_types.idl testidl.c.new
> > -	mv testidl.c.new testidl.c
> > +testidl.c: libxl_types.idl gentest.py
> > +	$(PYTHON) gentest.py $< $@.new
> > +	mv -f $@.new $@
> 
> Doesn't this want to be a mov-if-changed?
> 
> We don't need to force a rebuild if testidl.c hasn't changed, I don't think.

I don't like move-if-changed, as when the prerequisites happens to be
newer than the target, the rules keeps been executed on incremental
builds.

Also in this case, only two targets depends on this one, "testidl.o" and
"testidl", so move-if-changed would not be very useful.

> > @@ -208,14 +205,22 @@ _libxl_save_msgs_helper.h _libxl_save_msgs_callout.h: \
> >  	$(PERL) -w $< $@ >$@.new
> >  	$(call move-if-changed,$@.new,$@)
> >  
> > +#
> > +# headers dependencies on generated headers
> > +#
> >  $(XEN_INCLUDE)/libxl.h: $(XEN_INCLUDE)/_libxl_types.h
> >  $(XEN_INCLUDE)/libxl_json.h: $(XEN_INCLUDE)/_libxl_types_json.h
> >  libxl_internal.h: $(XEN_INCLUDE)/libxl.h $(XEN_INCLUDE)/libxl_json.h
> >  libxl_internal.h: _libxl_types_internal.h _libxl_types_private.h _libxl_types_internal_private.h
> > -libxl_internal_json.h: _libxl_types_internal_json.h
> > +libxl_internal.h: _libxl_save_msgs_callout.h
> >  
> > -$(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS) $(SAVE_HELPER_OBJS): $(XEN_INCLUDE)/libxl.h
> > +#
> > +# objects dependencies on headers that depends on generated headers
> > +#
> > +$(TEST_PROG_OBJS): $(XEN_INCLUDE)/libxl.h
> >  $(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS): libxl_internal.h
> > +$(SAVE_HELPER_OBJS): $(XEN_INCLUDE)/libxl.h _libxl_save_msgs_helper.h
> > +testidl.o: $(XEN_INCLUDE)/libxl.h
> 
> I know you're just rearranging existing the existing logic, but why
> doesn't `#include <libxl.h>` not generate suitable dependences ?

Make doesn't know how to read *.c files ;-). But more importantly, we
don't have any logic to generate dependencies ahead of building the
object, so make doesn't know about it.

Thanks,

-- 
Anthony PERARD

