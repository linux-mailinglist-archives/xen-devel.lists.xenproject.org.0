Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E890F588C52
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379902.613779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDha-0004Bn-Cn; Wed, 03 Aug 2022 12:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379902.613779; Wed, 03 Aug 2022 12:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDha-00049G-9e; Wed, 03 Aug 2022 12:42:18 +0000
Received: by outflank-mailman (input) for mailman id 379902;
 Wed, 03 Aug 2022 12:42:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+C7S=YH=citrix.com=prvs=207fd374a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oJDhZ-00049A-Dr
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 12:42:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b25b7bcc-1329-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 14:42:15 +0200 (CEST)
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
X-Inumbo-ID: b25b7bcc-1329-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659530535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HNenlgPDUfJoQjwtRN5JSN7KCZRDqY3qbaM7W6z63AM=;
  b=bbGATsDNaqP4BoMpbavbuRLJiqEx0RHTOIWt7PIjASPDaHLbO0W3BtQV
   KyLW/boyqOrclFLaBKp/2AvkvsYGECC4AYs8n2IwVeXP7ubY8T5AGJpJs
   uBGr9X4xR3qIsOyTt7ZKJHRV0A2lq9xSrjC3NXvuBorLaf+OF+bqLGqbi
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77042423
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:enCK4aBjUjAmsRVW/1Hjw5YqxClBgxIJ4kV8jS/XYbTApD4i1jUEn
 zQaDTqEPa6DZ2b9e9kiPYzi/ElXv8eBmtJqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpEs/nb8nuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW3azm7ZqVB0LBJQ3xKFPXk0Q3
 tlIcy9YO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQTNpcBTHZQwJIloNAYgytOypmmP+Y3tTr1f9Sa8fvDeLkFYtiuOF3Nz9dNapX+9Fk0Sk+
 mvdoGvVIBQkbMC01m/Qmp6rrrCWxn6qMG4IL5Wn8tZ6jVvVwXYcYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHyOswMYWtFQO/Yn8wzLwa3Riy6VD3YJZiRMY9snsIkxXzNC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBWJdPWwAFVc42sDMnsYL0T6RZfMzS7Hg27UZBgrML
 yC2QDkW3utO3JJTivzmpzgrkBr3+MGXE1ddChH/Gzv8s1gnPNPNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83oJrW3FF4aLJ9w43d2HDB4B3jw4UTHoe
 lTPngha+YVeOnCnBYcuPd/gV5p3kfK+Toi0PhwxUjapSsEpHDJrAQk0PRLAt4wTuBJEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYIWKtQF7TqKHfjTkkX4uYdykVbPFt/pxnPSMb1ihE5FyS2Jm
 +ti2zyikEoOAbSiOHCPrOb+7zkidBAGOHw/kOQPHsbrH+asMDhJ5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:ZPc5Ua+2fiO9HoeOz4Buk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-IronPort-AV: E=Sophos;i="5.93,214,1654574400"; 
   d="scan'208";a="77042423"
Date: Wed, 3 Aug 2022 13:42:01 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Edwin Torok <edvin.torok@citrix.com>
Subject: Re: [PATCH v1 1/7] tools/ocaml/Makefile: do not run ocamldep during
 make clean
Message-ID: <YuptGYZBvc+iKeHD@perard.uk.xensource.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <835ba84cf1fb7619fa6672d194aaf279795a5246.1659116941.git.edvin.torok@citrix.com>
 <6b7a9b52-d378-f404-57a9-20b148f2e7a2@suse.com>
 <FEF021F3-739B-4585-82D6-D13CDCBBC24F@citrix.com>
 <YupUhpinFKt2Dl0s@perard.uk.xensource.com>
 <e6adf8c3-0120-a737-aea9-6ae37cae3be1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e6adf8c3-0120-a737-aea9-6ae37cae3be1@suse.com>

On Wed, Aug 03, 2022 at 01:58:34PM +0200, Jan Beulich wrote:
> On 03.08.2022 12:57, Anthony PERARD wrote:
> > On Wed, Aug 03, 2022 at 10:24:26AM +0000, Edwin Torok wrote:
> >>
> >> -ifneq ($(MAKECMDGOALS),clean)
> >> +ifeq (,$(findstring clean,$(MAKECMDGOALS)))
> > 
> > I think it would be better with $(filter-out,):
> > 
> >     ifeq (,$(filter-out %clean,$(MAKECMDGOALS)))
> > 
> >>  .ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(OCAML_TOPLEVEL)/Makefile.rules
> >>  	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli $o,MLDEP,)
> > 
> > Also, don't hide this rule, instead, hide the "-include", there is no
> > need to have make waist time trying to find a rule to make
> > ".ocamldep.make" and failing when not needed.
> 
> Hmm, this sounds like I should be reverting the commit?

Well, it's not exactly an issue as there isn't any alternative rules,
and make is told to ignore failures to make ".ocamldep.make"; so `make
clean` and other targets still works as expected. Just a follow-up patch
would be fine I think.

-- 
Anthony PERARD

