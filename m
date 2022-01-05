Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A2C485509
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 15:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253633.434850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n57c6-0003Dv-68; Wed, 05 Jan 2022 14:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253633.434850; Wed, 05 Jan 2022 14:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n57c6-0003BN-2c; Wed, 05 Jan 2022 14:50:06 +0000
Received: by outflank-mailman (input) for mailman id 253633;
 Wed, 05 Jan 2022 14:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMgQ=RV=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n57c4-00032m-Se
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 14:50:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2541cea-6e36-11ec-9ce5-af14b9085ebd;
 Wed, 05 Jan 2022 15:50:03 +0100 (CET)
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
X-Inumbo-ID: c2541cea-6e36-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641394203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H13BgpPPUV4SEDIc867h0PGp5ysovgEk4Za/lxtJCQk=;
  b=fQXESNALohB6uiCB44hp4B8jujXPUnUc7j6PGE0p+s9OvvhlIZzcEtW5
   qs2zdNVS76fvqQ7EWX40L6H2K+Efdw0fkCY6U3ns4DuAsJiHeP+vgqatw
   +xN3QGOuYtxGoDpg8GjvI9m2YOmA+AZnmJqJOAcVXNwAybZuzWOE+aiNI
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IuVcM1OLePDaAzlo/w5sTWb//RsMAtuxTUjtYXojXI2S9mStxcmiofAPS0jAD9ZTqqhBptGAU0
 Dhd/FPpwFYSEJyYX5qw4A5hwLIGyM0pqTuFZ9Tj7bAFaL4+4Cb++4el7Y7oXX10VDcYsuI5MAH
 BdGKa3dq8Hms+SDwBk8E5N/ZLObxcQhC25Y8UMX1EvaLvwS8KWQQGdX6N3/oTbDxSz+DHg/8aC
 YLSecFejbsWgK86u6Z705YmmqgVAHZmCAYp3R0heDsunwW//lherMrG7jfX3yLlKsQZCLqO0ey
 W3tWFsoGy+bpy/07mk0kCVi1
X-SBRS: 5.1
X-MesageID: 61290521
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:J9fsraBquIt81xVW//bkw5YqxClBgxIJ4kV8jS/XYbTApDwj1jECn
 GMdWjyPb62MNGShLo0gaIy19B4EvZeAx4RhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940U87wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/jWmElPZJ1
 dF2paO6cCsyN5SQg9xDXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcGhW1h3p0URJ4yY
 eIkcAFXRiryTyZuGXgPT7sug82OgGDwJmgwRFW9+vNsvjm7IBZK+LnyMvLFd9qSX8JXk02E4
 GXc8AzRHRUyJNGZjz2f/RqEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixADQJRRh5ddgdpPA8fBAx3
 2bVhOu3Cmk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+hL5fPnwZlX6rwub9iEgpHSBjA46QzMNo5OxlMoPdX1D2BEBLWy0BqhEGp7ZgXR1
 JTns5LHhAzrMX1rvHfTKAnqNOvzj8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5VoKvsYDZSXwMfEfj2eN5yIClvaI+TPNDKu8UzazSsIpKF/vEN9GOCZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8dZFb7x17FPf/QhnnTm7bcmil3yPiOPCDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbqNmPT0EC7agCsQWmKZORW03wY8TWcqr9pcJL7HbeWKL2ggJUpfs/F/oQKQ994w9qwsC1
 i/VtpZwxAWtiHvZBx+Nb3w/OrrjUYwm9SAwPDA2PEbu0H8mON794KAafpoxXL8m6O08kqIkE
 6hbI52NUqZVVzDK2zUBdp2h/oZsQwum2FCVNC2/bTlhI5M5H17V+sXpdxfE/TUVCnblrtM3p
 rCtj1uJQZcKSwl4ItzRbfajkwG4sXQHwbogVErUONhDPk7r9dEyeSD2i/Y2JeAKKAnCmWTGh
 1rHX09AqLCU8YEv8dTPiaSVlKuTErNzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8z6oe9p7JeyQg4TnzHY07yV+FlK3iCm8JOqrdM1vlSvg7vA
 hCD/dxTOLOoPsL5EQFOeFp5P7rbjfxEyCPP6fkVIVnh4H4l9bWKZkxeIh2QhXEPN7ByKo4kn
 b8stcN+B9ZTUfb23gJqVhxpylk=
IronPort-HdrOrdr: A9a23:3QOx7qAXF8w+9ZXlHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.88,264,1635220800"; 
   d="scan'208";a="61290521"
Date: Wed, 5 Jan 2022 14:49:56 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Wei Liu" <wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH] tools/xen-detect: avoid possible pitfall with cpuid()
Message-ID: <YdWwFKcp7ux6Tvxm@perard>
References: <94338540-4bcc-7ad7-9de1-944c0dc96709@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <94338540-4bcc-7ad7-9de1-944c0dc96709@suse.com>

On Fri, Dec 03, 2021 at 01:09:04PM +0100, Jan Beulich wrote:
> The 64-bit form forces %ecx to 0 while the 32-bit one so far didn't - it
> only ended up that way when "pv_context" is zero. While presently no
> leaf queried by callers has separate subleaves, let's avoid chancing it.
> 
> While there
> - replace references to operands by number,
> - relax constraints where possible,
> - limit PUSH/POP to just the registers not also used as input,
> all where applicable also for the 64-bit variant.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

