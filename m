Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E1654F87D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 15:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351454.578090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2CJ2-000898-Fo; Fri, 17 Jun 2022 13:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351454.578090; Fri, 17 Jun 2022 13:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2CJ2-00087J-Ck; Fri, 17 Jun 2022 13:46:36 +0000
Received: by outflank-mailman (input) for mailman id 351454;
 Fri, 17 Jun 2022 13:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rI7C=WY=citrix.com=prvs=160677330=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o2CJ1-00087D-Dl
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 13:46:35 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e57ee484-ee43-11ec-bd2d-47488cf2e6aa;
 Fri, 17 Jun 2022 15:46:33 +0200 (CEST)
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
X-Inumbo-ID: e57ee484-ee43-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655473593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K9DTIGZoKLsNPanDI8UIMlN4m4LWEe/dXwk4moImZpw=;
  b=Z166WuJ3tnwSfyr3AyGdF7cn90khPn8zWMtH0CbSo5sYC9OTXtoVSHji
   uygysJNEGVgmKi7WnTJ1ZrTZ8GUh+6wtcgW9o4x5JrdOxhMOUqjdeCzkM
   zcXsmzBE4RVbSzh35TowWojbPR8aVg2/3Xgi1gwf2XEQfshhnDKTOah3z
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 76412064
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6GIky6sOwfAPxp46tJODr2rUkufnVH1eMUV32f8akzHdYApBsoF/q
 tZmKWmEPaqDZTfxf9Eka9i38htQvZHQn9RqTVA5pXo8Hn4U+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywYbVvqYy2YLjW13U5
 4uuyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8zPPbvmNRCciNEFgpaIPxtpZLJYkqg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWUxME2aO0MTUrsRII06nqSN2WnjSSYClEK3+7c9ykaN9xMkhdABN/KKI4fXFK25hH2wu
 Wbu72n/RBYAO7S3yzWf9Wm3rvTShi69U4UXfJW6/PN3hFyYxkQIFQYbE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JaCeY69QqO2ILS7hqCDWEcQ3hHZcBOnM0/QzAwx
 0KKt9zsDD1r9raSTBq1/7Kf/G2aIjIeIykEaDNscOcey4C9+sdp1EuJF4s9Vv7u5jHoJd3u6
 yqI9ws+t+oyt9IO/IGmrHuarjzvlIecG2bZ+T7rsnKZAhJRPdD4OtDzsQKDsJ6sP67CEADf4
 SFsd9y2qblXUMrTzHHlrPAlRunB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCHx7ZiLCgVdfOd7ZNijQ8YDuFM7+StffZcdUb556eWevpX8zOBLIgzywyBFxy8nT3
 Kt3lu79ZUv29Iw9lGbmLwvj+eRDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGazghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHsaZPBFcEX0sY9eIh+tJl3pNxP8OyI8lP
 xiVBydl9bYIrSeXdlnSNik7MumHsFQWhStTABHA9G2AgxALCbtDJo9DH3frVdHLLNBe8MM=
IronPort-HdrOrdr: A9a23:23/5pKAARxqNpT3lHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.92,306,1650945600"; 
   d="scan'208";a="76412064"
Date: Fri, 17 Jun 2022 14:46:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Chuck Zmudzinski <brchuckz@netscape.net>
CC: Jason Andryuk <jandryuk@gmail.com>, Andrew Cooper <amc96@srcf.net>,
	xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant
 access to Intel IGD opregion
Message-ID: <YqyFoPJ8Bv9EnO5N@perard.uk.xensource.com>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
 <408e5e07-453c-f377-a5b0-c421d002aec5@srcf.net>
 <46a8585e-2a2a-4d12-f221-e57bd157dec6@netscape.net>
 <CAKf6xpths4SX4wq-j4VhnXZnx0DW=468z3=9FYHso=Wy1i_Rsg@mail.gmail.com>
 <da62d06d-fd18-a313-9e69-2a4581e97c1a@netscape.net>
 <CAKf6xptZ9g79MphwYPAGq6ATBtCrW+pCd5+NYJPdFniW+tFzPg@mail.gmail.com>
 <ea5c1606-04d3-c847-643e-d242d8f6ba06@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ea5c1606-04d3-c847-643e-d242d8f6ba06@netscape.net>

On Thu, Mar 31, 2022 at 03:44:33PM -0400, Chuck Zmudzinski wrote:
> On 3/31/22 10:19 AM, Jason Andryuk wrote:
> > On Thu, Mar 31, 2022 at 10:05 AM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
> > > 
> > > That still doesn't answer my question - will the Qemu upstream
> > > accept the patches that move the hypercalls to the toolstack? If
> > > not, we have to live with what we have now, which is that the
> > > hypercalls are done in Qemu.
> > Xen-associated people maintain hw/xen code in QEMU, so yes it could be accepted.
> > 
> > Maybe it would need to be backwards compatible to have libxl check the
> > QEMU version to decide who makes the hypercall?  Unless it is broken
> > today, in which case just make it work.
> > 
> > Regards,
> > Jason
> 
> I know of another reason to check the Qemu upstream version,
> and that is dealing with deprecated / removed device model
> options that xl.cfg still uses. I looked at that a few years ago
> with regard to the deprecated 'usbdevice tablet' Qemu option,
> but I did not see anything in libxl to distinguish Qemu versions
> except for upstream vs. traditional. AFAICT, detecting traditional
> vs. upstream Qemu depends solely on the device_model_version
> xl.cfg setting. So it might be useful for libxl to add the capability
> to detect the upstream Qemu version or at least create an xl.cfg
> setting to inform libxl about the Qemu version.

Hi,

There's already some code to deal with QEMU's version (QEMU = upstream
Qemu) in libxl, but this code is dealing with an already running QEMU.
When libxl interact with QEMU through QMP, to setup some more devices,
QEMU also advertise it's version, which we can use on follow up qmp
commands.

I think adding passthrough pci devices is all done via QMP, so we can
potentially move an hypercall from QEMU to libxl, and tell libxl that
depending on which version of QEMU is talking to, it needs or not do the
hypercall. Also, we could probably add a parameter so that QEMU know if
it have to do the hypercall or not, and thus newer version of QEMU could
also deal with older version of libxl.

(There's maybe some example like that in both QEMU and libxl, when doing
live migration, dm_state_save_to_fdset() in libxl as a pointer)

Cheers,

-- 
Anthony PERARD

