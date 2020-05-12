Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734441CF9F7
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 17:58:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYXIP-0001EY-TE; Tue, 12 May 2020 15:58:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh4E=62=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYXIO-0001EO-A9
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 15:58:16 +0000
X-Inumbo-ID: 6348ec5a-9469-11ea-a2cd-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6348ec5a-9469-11ea-a2cd-12813bfff9fa;
 Tue, 12 May 2020 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589299096;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=XJtRyoWkbnyGP96LNpNOc6p2euzgTk05FDsqLU/e4Q8=;
 b=KlQi2KSBMdA7hVlbVjwJihdVnStfKCFRbW0+nrGyfCJk1GEi6IHPlXuO
 4XLOvPcBiMOpfXGgmnj2OkI9xcV0SiN7KNGZDIk+FQlgYiRhbB9PUUkb0
 cprfKe9U7UMkZBTqzpBXVrdNU2Y6aFhw+CxgkoaTaC6OfBgbHUZuBL1Ub 8=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: zd44B1xrkETwMRCWIwqUb8Cd0Ds0m+uwNTW4de+Sq4y/ikYsGRpZLnT6TuDoSH8t2yutrhXtvn
 3k+0W9pKlklBoHJW6FgOnvWOCGTEpYNRiGzBL5pUD9SW8Z/FCEVlBJ3bsnJQua9R8wYBhle6Pz
 EQqLkX14pg+jW4FvdMTExblZX2Urrqsq8CrY/EJByCRsW0lfHkW2N4ApL77sTCu71kBy3G/Jsi
 noWbvpTX++SXCye/jT+p4UPN/TwUmdxTHBk4UzPurRCOhhVPkFpjpP/59bqIRPvLHkBqpCfcPa
 dd4=
X-SBRS: 2.7
X-MesageID: 17356193
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17356193"
Subject: Re: [PATCH 2/2] x86/boot: Drop .note.gnu.properties in build32.lds
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>
References: <20200512033948.3507-1-jandryuk@gmail.com>
 <20200512033948.3507-3-jandryuk@gmail.com>
 <69dd92f0-5b23-7a3d-3568-feab20874f97@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <372f83e4-6016-cc10-a8e6-970d644eb561@citrix.com>
Date: Tue, 12 May 2020 16:58:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <69dd92f0-5b23-7a3d-3568-feab20874f97@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Stefan Bader <stefan.bader@canonical.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/05/2020 16:32, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 12.05.2020 05:39, Jason Andryuk wrote:
>> reloc.S and cmdline.S as arrays of executable bytes for inclusion in
>> head.S generated from compiled object files.  Object files generated by
>> an -fcf-protection toolchain include a .note.gnu.property section.  The
>> way reloc.S and cmdline.S are generated, the bytes of .note.gnu.property
>> become the start of the .S files.  When head.S calls reloc or
>> cmdline_parse_early, those note bytes are executed instead of the
>> intended .text section.  This results in an early crash in reloc.
> I may be misremembering, but I vaguely recall some similar change
> suggestion. What I'm missing here is some form of statement as to
> whether this is legitimate tool chain behavior, or a bug, and
> hence whether this is a fix or a workaround.

The linker is free to position unreferenced sections anywhere it wishes.

It is deeply unhelpful behaviour, but neither Binutils nor Clang
developers think it is something wanting fixing.

One option might be to use --orphan-handling=error so unexpected
toolchain behaviour breaks the build, or in this case perhaps =discard
might be better.

>> Discard the .note.gnu.property section when linking to avoid the extra
>> bytes.
> If we go this route (and if, as per above, I'm misremembering,
> meaning we didn't reject such a change earlier on), why would we
> not strip .note and .note.* in one go?
>
>> Stefan Bader also noticed that build32.mk requires -fcf-protection=none
>> or else the hypervisor will not boot.
>> https://bugs.launchpad.net/ubuntu/+source/gcc-9/+bug/1863260
> How's this related to the change here?

I think there is a bit of confusion as to exactly what is going on.

Ubuntu defaults -fcf-protection to enabled, which has a side effect of
turning on CET, which inserts ENDBR{32,64} instructions and generates
.note.gnu.properties indicating that the binary is CET-IBT compatible.

ENDBR* instructions come from the Hint Nop space so are safe on older
processors, but do ultimately add to binary bloat.  It also occurs to me
that it likely breaks livepath.

The reason Xen fails to boot is purely to do with the position of
.note.gnu.properties, not the ENDBR* instructions.

~Andrew

