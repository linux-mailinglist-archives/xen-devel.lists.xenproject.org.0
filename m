Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B445ECAAB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 19:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412897.656360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odEGZ-0003Bq-TT; Tue, 27 Sep 2022 17:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412897.656360; Tue, 27 Sep 2022 17:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odEGZ-00039J-Qo; Tue, 27 Sep 2022 17:21:07 +0000
Received: by outflank-mailman (input) for mailman id 412897;
 Tue, 27 Sep 2022 17:21:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4SB=Z6=citrix.com=prvs=2628f7867=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1odEGZ-00039A-2m
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 17:21:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1f92430-3e88-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 19:21:02 +0200 (CEST)
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
X-Inumbo-ID: c1f92430-3e88-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664299262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iO4qwHzOfI2N25EDvltRySpbetX8kQ1Q0zmpmfLD0P4=;
  b=Co8BmQFJahSeQvJiRer8lr4flCiNz1nkTfnxLBIdU+C3CqKVmMOTWn8H
   Z4tVPoP9U3Jbv4BNtQiQSdQtXlOh6bhTrIW7flffhqAEzURPuMij76OgC
   Yu3m0J4srW+jl47l+u/DrIg+L+COi8sYkfUFa59gnUzhuLsmUnN7A+jJq
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83977139
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:G0B0fq4z8TRMSwbgU8bCVQxRtK/HchMFZxGqfqrLsTDasY5as4F+v
 mAYD2zTbP7Yamv9Kt4kb4Sxp0pUsMDWzdNnHQo4pHs1Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPYwP9TlK6q4mlA7wZhPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5cOlBP3
 vsENQshRR/S3Oi4z6CGcPJj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUozRFJoKxx3Jz
 o7A1z7kOS0nLuKG8x6c6UiWj7DpnnzHUqtHQdVU8dY12QbOlwT/EiY+WV6qveO+vVWzXt9ZJ
 lAP0ic2pK10/0uuJvH/UAe/u2WspQMHVpxbFOhSwB+Kzq3Y8gOIHF8ORzRKaMElnMIuTDls3
 ViM9/vgAzV0rLSOSHOUwbOJrjK7PyUTLmgqaDcNSE0O5NyLiJE+iFfDQ8huFIaxj8bpAnfgz
 jaSti88ir4Py8kR2M2T8VXGnyi94IPESwMz6xnMdm2g5wJ9IoWiYuSA9lzz/ftGaoGDQTGpu
 3wJmNOX6uwUOpiLmDaQW+UGHLyv5PGtPSXVhBhkGJxJyti20yf9J8YKumg4fRo3dJZfEdP0X
 KPNkShq1Z54O2e3VoNcbNPqAcol35XaDtuwA5g4ceFySpR2cQaG+gRnakiRw33hnSAQrE0vB
 XuIWZ3yVChHUMyL2BLzHr5AiuFzmkjS0EuJHfjGIwKbPa1yjZJ/YZMMKxOwY+8w98toSy2Fo
 o8EZ6NmJ/iyOdASgxU7E6ZJdTjmzlBhX/gaTvC7kcbcSjeK4El7V5fsLUoJIuSJZZh9mObS5
 W2aUURF0lf5jnCvAVzUNCw5MeyyDMYu9SNT0ckQ0bGAhBAejXuHtv9DJ/Pbg5F+nACc8RKEZ
 6ZcIJjRahi+Yj/G5y4cffHAkWCWTzzy3FrmAsZQSGJgF3KWb1CWp4SMk8qG3HVmMxdbQuNk/
 eD+j1mLHcddL+mgZe6PAM+SI5qKlSB1sIpPs4Hge7G/pG2EHFBWFhHM
IronPort-HdrOrdr: A9a23:lnlzbaBRPEOGGovlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.93,350,1654574400"; 
   d="scan'208";a="83977139"
Date: Tue, 27 Sep 2022 18:20:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <dmitry.semenets@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Dmytro Semenets <dmytro_semenets@epam.com>, Anastasiia
 Lukianenko <anastasiia_lukianenko@epam.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 4/4] tools/xl: Add pcid daemon to xl
Message-ID: <YzMw8i7w7HyINjEp@perard.uk.xensource.com>
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
 <20220713150311.4152528-4-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220713150311.4152528-4-dmitry.semenets@gmail.com>

On Wed, Jul 13, 2022 at 06:03:11PM +0300, dmitry.semenets@gmail.com wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add pcid daemon (based on vchan-node2) implements pcid protocol. Protocol is
> OS independed and should work on ane supported OS.
> 
> Add essential functionality to handle pcid protocol:
> - define required constants
> - prepare for handling remote requests
> - prepare and send an error packet
> 
> pcid server used if domain has passthrough PCI controller and we wants
> assign some device to other domain.
> pcid server should be launched in domain owns the PCI controller and process
> request from other domains.
> 
> Message exchange imnplementation based on JSON via libvchan. Supported
> messages:
> - make_assignable
> - revert_assignable
> - is_device_assigned
> - resource_list
> - reset_device
> - write_bdf
> 
> Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Hi Dmitry,

I don't think libxl is the right place to implement a daemon, and xl
isn't the place to start a new daemon either. Could you look into
creating a new binary which implements only "pcid"?

I understand that making use of the facilities in libxl makes writing
this daemon a bit easier, but still I don't think the code belong to
libxl. Maybe some of libxl's code could be moved to libxlu (utils) if
that help, but I'm not sure.

Also, this patch is way to big, makes too many changes, including
changes to existing libxl's API which we try to avoid. (Adding new
functions is fine, changing the prototype of existing one is what we try
to avoid.)

As for the protocol, it might be better to have the description
somewhere in "docs/" instead of within a C header. I'm not sure which
sub-directory as we have protocols in different one, like in "misc" or
"design" or "features", but "misc" might be the one. Also, the document
should say somewhere that the protocol is based on JSON, as that's
missing in pcid.h.

Thanks,

-- 
Anthony PERARD

