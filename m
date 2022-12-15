Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694AD64DFB8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 18:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463674.721908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5s7C-0004iR-ED; Thu, 15 Dec 2022 17:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463674.721908; Thu, 15 Dec 2022 17:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5s7C-0004fl-BJ; Thu, 15 Dec 2022 17:33:50 +0000
Received: by outflank-mailman (input) for mailman id 463674;
 Thu, 15 Dec 2022 17:33:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQug=4N=citrix.com=prvs=341112f0b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p5s7B-0004ff-5t
 for xen-devel@lists.xen.org; Thu, 15 Dec 2022 17:33:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fd47f41-7c9e-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 18:33:48 +0100 (CET)
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
X-Inumbo-ID: 9fd47f41-7c9e-11ed-8fd3-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671125627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gTt4orLTr07tRz/N5MkoBGq46E/pxbPWFGzCqxGCX5w=;
  b=E6jaUbuAXUlKHfE1yVXxOsqeS4HVr3vcYPZN2gPGB46aRxpCyvBAt7t2
   4CqceFwhQuh7ctd2yP/Ms/VHPh1rVvm071IlEl7w4vdcAXvvxxQzHcQ4w
   YU7GuI4vLuBXd7pg/WZXL39ilXyD1t7RVv7fu3ALLV/ciY5PCuGkJl0e3
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88993350
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N+dYCK0Nl3Mavsk1kPbD5fV2kn2cJEfYwER7XKvMYLTBsI5bpzYGy
 WUfDGmCPvzcMWHwc4ona9jk8x8PuZbSn9MwS1A6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wZnOKgW1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfIEdU2
 9cHLi42Nz/Ztr3qmYm6TLVSv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TaFZQExR3F/
 goq+UzGICsEEoS90gCMyXiJqs3flCjmaoU7QejQGvlC3wTImz175ActfUCnrPewjEn4QM5WI
 UEQ/isorIAi9UiqSMm7VBq9yFaNuhMMHdBdFes35SmJy6zd+QHfAXILJhZadMYvqMgtADAny
 HeOh5btBCdzq/uRSHSU7LDSqim9UQAQJHMCZCIZCxMC4sPirZsbihPJR8xkVqWyi7XdBjXY0
 z2M6i8kiN07isoG1L6n7EvHqz2pr5nNCAUy423/W2Om40V5Y4qgapeA7Vnd5OxHaoGDQTGpo
 nkCkMWY8KYBEJCRiCuRaOEMGriz4LCCKjK0qUBuBZQ693Ku5nuqZ6hU4Td3PkAvNdwLERfra
 kLOvQJa5LdIIWCnK6RwZuqZG8ksiKTtC9nhfvTVdcZVJIh8ckmA5i4GTUmLxHzgi1RpmK06O
 JGzYcuqFWwdC6ls0HyxXeh1+b02wiEzw0vDSJa9yA6ouZKca2SSUqwtK0aVY6Yy66bsnenO2
 48BbY3QkUwZCbCgJHmMmWIOEbwUBVkdH77dtMpJTbeseDs5RDgaCvmN/4p0LuSJgJ9pvuvP+
 3i8XGpRx1z+mWDLJG22V5xzVF/8dc0h9CxmZETAKX7tgiF+Otj3sM/zYrNtJdEaGPpfIemYp
 hXvU+GJGbxxRzvO4FzxhrGt/dU5JHxHae9jVhdJgQTTnbY6H2QlGfe+JGMDERXi6QLp3fbSW
 5X6imvmrWMrHmyO9vr+ZvO11E+WtnMAgu90VEagCoANJxy0rNI0dn2r0KVfzyQwxfPrnGPyO
 +G+WEdwmAUwi9VtrImhaV6s8e9F7NeS7mIFRjKGvN5axAHR/3a5wJ8obQp7VWm1aY8Aw437P
 b8956ilYJU6cKNi79IU/0BDkfhvuLMCZtZykmxZIZk8RwvxU+k4eSXdgaGidMRln9dkhOd/Y
 WrXkvEyBFlDEJqN/II5TOb9Utm+6A==
IronPort-HdrOrdr: A9a23:vvmafq5yKIo/x2LN3gPXwSCBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhIE3I6urwQ5VoIEmsg6KdjrNhWYtKMDOGhILsFvAa0WKA+UyoJ8SdzJ876U
 4IScEXYuEYT2IK6/oSiDPIUurIq+P3k5xA8N2uqkuFOjsaCZ2IgT0YNu4TeXcceOHJbaBJV6
 Z1uaF8ygaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnR4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlfFtyssHfjWG1SYczPgNkHmpDh1L8eqq
 iAn/5vBbU815qbRBDOnfKk4Xic7N+F0Q6j9bbQuwqeneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2K0oM3R3am6a/hRrDvHnVMy1eoIy3BPW4oXb7Fc6YQZ4UNOCZ8FWCb38pouHu
 ViBNzVoK8+SyLsU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsJg9V55H7e
 LZNbkArsA7cibXV9MMOA4se7rHNoWWe2OyDIu7GyWYKJ06
X-IronPort-AV: E=Sophos;i="5.96,248,1665460800"; 
   d="scan'208";a="88993350"
Date: Thu, 15 Dec 2022 17:33:34 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>,
	"osstest-admin@xenproject.org" <osstest-admin@xenproject.org>, Vincent
 Guittot <vincent.guittot@linaro.org>, "stratos-dev@op-lists.linaro.org"
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] libxl: virtio: Fix build error for 32-bit platforms
Message-ID: <Y5tabu1WUgS6sTNq@perard.uk.xensource.com>
References: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
 <d4cf6539ff179e7ade820feadd8088f33da49196.1671111056.git.viresh.kumar@linaro.org>
 <Y5slue6ujqmCscJd@perard.uk.xensource.com>
 <b4c0e361-2b6a-f7b9-941d-4315144c6f65@suse.com>
 <e8988370-f838-dd23-729f-892561f54b58@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8988370-f838-dd23-729f-892561f54b58@citrix.com>

On Thu, Dec 15, 2022 at 04:58:02PM +0000, Andrew Cooper wrote:
> A consumer of xenstore has to cope with all bases anyway.  Anything that
> doesn't is broken.

So libxl is broken, that good to know :-). Most keys read by libxl are
expected to be base 10, with some allowed to be in different base (as
they're a few that uses strtoul(,,0);)

So don't try to change the base of existing keys ;-).

For those virtio one in particular, it's probably ok. libxl doesn't
mind, and hopefully the consumer of those don't mind either.

-- 
Anthony PERARD

