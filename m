Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EDC5708A0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 19:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365331.595452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAwnX-0004Ys-5n; Mon, 11 Jul 2022 17:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365331.595452; Mon, 11 Jul 2022 17:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAwnX-0004Vr-2P; Mon, 11 Jul 2022 17:02:15 +0000
Received: by outflank-mailman (input) for mailman id 365331;
 Mon, 11 Jul 2022 17:02:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79kg=XQ=citrix.com=prvs=184793b5a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oAwnV-0004Vl-W9
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 17:02:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 342dd00d-013b-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 19:02:12 +0200 (CEST)
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
X-Inumbo-ID: 342dd00d-013b-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657558932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gNmpfx9ATpOVkWL0AY17AFe15NpE1SUxAGwUweyAUf8=;
  b=eE+YZSG+iuPyPQ0wwvhO2D0gu/3b1gd2W8W9LYfl6P671xLGb+qiPER8
   BNOxBcGgquw12fniINiyuf46Hg6ZxSbgfOTjYuPx1UXFbrVdxn5mMrk5K
   3UXW3s8EcPTHvCPdT4A9iGvCFZs8qkiyTE8zwVxqll2xSLyNM1F5CPba1
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74844172
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5+LtTKtQWtwMIeeMa2Yi42NJ5OfnVAZeMUV32f8akzHdYApBsoF/q
 tZmKT2AbvuNMDPyKYpyO4Xg/BwBv5HXytRkSgJt+SEwRnka+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywYbVvqYy2YLjW1zU4
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8ZBJfTgMlGViBqEiN3MoxU24TheWOg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWUzPEicOkIVUrsRIM07wPvzvSPQShxdpXW2jLgK31mU7RMkhdABN/KKI4fXFK25hH2wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZ1hHWDy2pVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l+pDu/B60XW09fD9DYdMHpuwNY2Qxy
 Qrc9z/2PgCDoIF5WFrEqOrL9mvoZHFMRYMRTXRaFFVYurEPtKl210uSFYg7TcZZm/WvQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhKTysDA3Fd4acO6koqCp5
 RDoYfS24uEUFo2qnyeQWugLF7zBz6/bbWKA3g42QMVwrWjFF5ufkWd4uWsWGauUGpxcJW+Bj
 LH742u9G6O/zFP1NPQqMupd+uwhzLT6FMSNa804muFmO8ArHCfepXkGTRfJgwjFzRl3+Ylia
 MjzTCpZJStDYUiR5GHuF7l1PH5C7n1W+F4/sriikk73gOrANC7IIVrHWXPXBt0EAGq/iF292
 75i2wGikH2zjMWWjvHrzLMu
IronPort-HdrOrdr: A9a23:UH5KR627HTHLbmNtk+RMggqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.92,263,1650945600"; 
   d="scan'208";a="74844172"
Date: Mon, 11 Jul 2022 18:01:48 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v3 04/25] tools/firmware/hvmloader: rework Makefile
Message-ID: <YsxXfJ3AKI0jwb9g@perard.uk.xensource.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-5-anthony.perard@citrix.com>
 <76605880-bf6c-afd0-8fbb-a15bfccc1eed@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <76605880-bf6c-afd0-8fbb-a15bfccc1eed@suse.com>

On Mon, Jul 11, 2022 at 03:52:52PM +0200, Jan Beulich wrote:
> On 24.06.2022 18:04, Anthony PERARD wrote:
> > Setup proper dependencies with libacpi so we don't need to run "make
> > hvmloader" in the "all" target. ("build.o" new prerequisite isn't
> > exactly proper but a side effect of building the $(DSDT_FILES) is to
> > generate the "ssdt_*.h" needed by "build.o".)
> 
> Maybe leave a brief comment there?

Sounds good.

> > Make use if "-iquote" instead of a plain "-I".
> > 
> > For "roms.inc" target, use "$(SHELL)" instead of plain "sh". And use
> > full path to "mkhex" instead of a relative one. Lastly, add "-f" flag
> > to "mv", in case the target already exist.
> 
> Hmm - according to my understanding -f isn't needed just because the
> file may already exist. It would be needed if a pre-existing file
> isn't writable. (I don't mind the addition of the flag, but I think
> what you say can end up misleading.)

Yes. After reading the posix doc about `mv`, the following would be
better:

    Lastly, add "-f" flag to "mv" to avoid a prompt in case the target
    already exist and we don't have write permission.

Thanks,

-- 
Anthony PERARD

