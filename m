Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD5492B86
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 17:50:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258610.445588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9rfw-0000oL-6b; Tue, 18 Jan 2022 16:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258610.445588; Tue, 18 Jan 2022 16:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9rfw-0000mV-3N; Tue, 18 Jan 2022 16:49:40 +0000
Received: by outflank-mailman (input) for mailman id 258610;
 Tue, 18 Jan 2022 16:49:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BW1=SC=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n9rfu-0000mP-7p
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 16:49:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d899385-787e-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 17:49:36 +0100 (CET)
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
X-Inumbo-ID: 9d899385-787e-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642524576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B7AYMVvBmFRDqWJCIIkgTsVN7bI045gCoVOFgBPjw+0=;
  b=CZyRJbWC9wbZPN8NoPXOLN6U5Y9HDmVdVdrOXZftfsM46Dm11+YOmLYh
   oiN7ie1DTkHAA5n7SrqzuJMyw3PZ3OIrKv31fzNsE0Yg/jPMrDhdAULPj
   McjHEF5N7swOewwnhWJF3FrA1dBF0g1mUszl8jnVDhubNZOF0t/qxcNFr
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: P36h00nDnj/631sx2cXE7KFAKE1rCXI5WuCg921nMGWCkYfeCBK+7DrXSdA3aym83Q9r9mUSot
 eGiCu9ckyg53CT/xgLJzecqLAZDgdafrqS2eQS+2xasW4M+BdYbyCdc1emF+D7fjJUDNK4Wzso
 DKj2T7XoOfU90i1A96WVxN4gXIs7IggFWEYJs4jjWMSHVMWXFER6jh74mmHz6heYqBGAdONVvv
 mp1dqqI7UZ4uZH+WDzNV25eYF1XBzpnV5gmIeT25eiNcHbEO/bIFUSiFOTI7o269q3HJb16DuV
 ylMPIDXXDbdjWCQ7qs4qff2m
X-SBRS: 5.2
X-MesageID: 64377955
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AOBKBauyDN0yIi1vfxYkqTxasefnVBdYMUV32f8akzHdYApBsoF/q
 tZmKTuEOfmJZTakfdwjatvioEwH7cTXz9U2T1Bqqy1mFyMV+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx2IjhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpliMa/VQoXfa33n7oWdT16GAEkEIdX5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AO
 5FGNmsyMXwsZTVyKEgVDps/rdu2xSXAWRdG8lLI/oQ4tj27IAtZj+G2bYu9lsaxbftSmkGUt
 2fX5VPTCxsRNMGc4Ted+3fqjejK9QvkXKoCGbv+8eRl6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZtPwRQGiqXiI+BsVQcNNEvYS4RuIjKHT5m6xB3cGZi5MbsQ8s807TiBs0
 UWG9/vrDzFytLyeSVqG66yZ6zi1PEA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8adjMDxGDz26
 yCHqm45nbp7sCIQ//zlpxad2Wvq/8WXCF5ujunKYo67xj4ja5KoWc+o0l+F5tBkDo25FHSrr
 WdRzqBy89syJZ2KkSWMRsAEE7eo++uJPVXgvLJ/I3Uy32/zoiD+JOi89Bk7fR40aZhcJVcFd
 WeK4VsJjKK/KkdGekOej2iZL80xhZbtGt3+Phw/RoofO8MhHONrEcwHWKJx44wPuBV0+U3cE
 c3CGSpJMZr8If44pNZRb71MuYLHPghkmQvuqWnTlnxLK4a2an+PUqsiO1CTdO0/567siFyLr
 4wDa5fblUkECrCWjszrHWg7dw9iwZ8TX8GeliCqXrTbfloO9J8JVpc9Po/Ni6Q6xv8Ix48kD
 1m2W1NCyUqXuJE0AV7iV5yXU5u2BcwXhStiZUQEZA/0s1B+P9rHxPpBJvMfIOl2nMQ+nKUcZ
 6RUJK297gFnF26vF8I1N8et9eSPtX2D2GqzAsZSSGNuIM47GV2Yo4+Mk8mG3HBmMxdbfPAW+
 9WIvj43i7JaL+i7JMqJOv+p0X2run0RxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkQ8S4YpxGrpm14wk4N7rq+MIxwhoBiyTPV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNIfVgrdOWO0/0QiwL+1/VtLRWo/jJz8ZqGTV5WY0uGhhtCIeYnK4gi2
 +og5pIbslTtlhowP9+apSlI7GDQfGcYWqAqu5xGUo/mjg0nlgNLbZDGU3Kk5ZiOb5NHM1UwI
 y/Sj63H3uwOyk3Hens1NH7MwesC2she5EEUlAcPdwaTh97Ipv4rxxkAoz04QzNcwghDz+8ua
 HNgMFd4JPnW8jpl7CSZs7tAx+2V6MWlx3HM
IronPort-HdrOrdr: A9a23:YuJ4RKyFk+TZTk9NiFQiKrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="64377955"
Date: Tue, 18 Jan 2022 16:49:29 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 27/47] build: grab common EFI source files in arch
 specific dir
Message-ID: <Yebvmf1MZHla0Z6S@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-28-anthony.perard@citrix.com>
 <57f03aed-c260-1c80-c604-0223d4603b4a@suse.com>
 <YeafMh0du+5K8YDD@perard>
 <c947e8b1-7319-2c88-da05-3c0cc2d7822f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c947e8b1-7319-2c88-da05-3c0cc2d7822f@suse.com>

On Tue, Jan 18, 2022 at 02:49:37PM +0100, Jan Beulich wrote:
> On 18.01.2022 12:06, Anthony PERARD wrote:
> > On Tue, Dec 21, 2021 at 02:53:49PM +0100, Jan Beulich wrote:
> >> On 25.11.2021 14:39, Anthony PERARD wrote:
> >>> Rather than preparing the efi source file, we will make the symbolic
> >>> link as needed from the build location.
> >>>
> >>> The `ln` command is run every time to allow to update the link in case
> >>> the source tree change location.
> >>
> >> Btw, since symlinks aren't being liked, would there be a way to make
> >> things work using vpath?
> > 
> > No, that's not possible. With "vpath = /build/xen/common/efi", make
> > would look at path "/build/xen/common/efi/arch/x86/efi/runtime.c" to
> > build "arch/x86/efi/runtime.o".
> 
> But /build/xen/common/efi/arch/x86/efi/runtime.c doesn't exist (and
> never will afaict), so wouldn't make go on finding the file elsewhere?

If we have the implicit rule
    %.o: %.c

and vpath set.
When trying to build the target "arch/x86/efi/runtime.o", make will try
our above rule and look for "arch/x86/efi/runtime.c" as make will not
remove the directory part from the path. If that prerequisite isn't
found, make will also try to prepend $(VPATH) to it.

I don't think it's not possible to tell make to substitute a directory
for vpath, in a target or prerequisite.

Cheers,

-- 
Anthony PERARD

