Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF6F19D96E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 16:47:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKNbC-0006ZD-7o; Fri, 03 Apr 2020 14:47:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WUFr=5T=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jKNbB-0006Z8-IO
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 14:47:09 +0000
X-Inumbo-ID: fe131554-75b9-11ea-bd27-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe131554-75b9-11ea-bd27-12813bfff9fa;
 Fri, 03 Apr 2020 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585925229;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=oxPW7MOKegcxbi4LDSye//dOB8eww9B/bng/tIoUMPI=;
 b=FQLpaazv6hAKxSL4X/ILogYeC69QahwyMyZvJ2uytKqWaLSZ6PpS8X3w
 JbnlcOqkSEeU1YLmpa+udALCnvGhk/lZjdteXjlEe6sH/wSw09LMFo9Fg
 EzUHP8BxRGlW9FXYJk6Zl+etvkCXN5khSytkJSPQhD6kxWQiJnDmScHX2 o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IVC62dvuwDkLnmhAept02G9gHIYm0ilRdntOg3p+LP+g9oSFnizbSXlEtAAOn5j3JaVNoir7iy
 ZhVuJrzPrQEUEW2q4MZ4dy66n/pr2cVIoGLuJ5OXO+Lq6UA2zQ47iu01NSDmiwz/u3fzmfipwA
 KhNSPF5cSyYFUGXtD1FSJnmNj1AnpQvhMbg6KdhtdnRF2e0NxCi2D8v0ZoSxN21Nqbjzzb/T3P
 nKCYuBTDAr1vZvISfO1HUqCrIgPhZgAT5MBBttxjaKdRhBWCPPqwc3bijrDbf/y7Jp+iejlxbM
 mlw=
X-SBRS: 2.7
X-MesageID: 15360870
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,340,1580792400"; d="scan'208";a="15360870"
Subject: Re: [PATCH] hvmloader: probe memory below 4G before allocation for
 OVMF
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
 <66ee36a9-b525-50d4-17e8-8a10f6afd55f@suse.com>
 <0faaee38-e314-24a8-b97d-9f000251a63e@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <9cba6eda-2c7c-9700-a484-c72100b8268f@citrix.com>
Date: Fri, 3 Apr 2020 15:47:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0faaee38-e314-24a8-b97d-9f000251a63e@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, wl@xen.org,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/04/2020 15:39, Andrew Cooper wrote:
> On 03/04/2020 14:53, Jan Beulich wrote:
>> On 02.04.2020 18:18, Igor Druzhinin wrote:
>>> The area just below 4G where OVMF image is originally relocated is not
>>> necessarily a hole - it might contain pages preallocated by device model
>>> or the toolstack. By unconditionally populating on top of this memory
>>> the original pages are getting lost while still potentially foreign mapped
>>> in Dom0.
>> When there are pre-allocated pages - have they been orphaned? If
>> so, shouldn't whoever populated them unpopulate rather than
>> orphaning them? Or if not - how is the re-use you do safe?
> 
> So this is a mess.
> 
> OVMF is linked to run at a fixed address suitable for native hardware,
> which is in the SPI ROM immediately below the 4G boundary (this is
> correct).  We also put the framebuffer there (this is not correct).
> 
> This was fine for RomBIOS which is located under the 1M boundary.
> 
> It is also fine for a fully-emulated VGA device in Qemu, because the the
> framebuffer if moved (re-set up actually) when the virtual BAR is moved,
> but with a real GPU (SR-IOV in this case), there is no logic to play games.
> 
> The problem is entirely caused by the framebuffer in Xen not being like
> any real system.  The framebuffer isn't actually in a BAR, and also
> doesn't manifest itself in the way that graphics-stolen-ram normally
> does, either.

Adding to what Andrew said:

There multiple technical complications that caused this mess.
One of them is that there is no unfortunately a better place for the
framebuffer to be located initially. Second, SR-IOV device
is real and adding a virtual BAR to it is also complicated (due to
compatibility reasons) and NVIDIA decided to avoid that.

Igor

