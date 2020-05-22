Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F901DE41C
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:19:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4m9-0002Nc-5d; Fri, 22 May 2020 10:19:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L400=7E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jc4m7-0002NO-NR
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:19:35 +0000
X-Inumbo-ID: bb7bc402-9c15-11ea-abab-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb7bc402-9c15-11ea-abab-12813bfff9fa;
 Fri, 22 May 2020 10:19:34 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HmLuVmKF0041qSAPfbrl73oRNrN5n9et4OeZebTCWbsXxtXsbRxOTSkrCgM3AHw/d+mYMsqtjr
 UbfH1urKxTmQZTWYt1pJLiMCITidX5iLL4OJ3BGuWDA+I2NgAqbN4IqyMfqkSv/9GUprw6x9fX
 9C7kmswsZrjZCgUx6CUnULQUKgcO7tNwaSKLtnEDGDUn/EP2QoJBVR97EHRcSCjPiJ+hg3Cswf
 ifyD3F7XKG0BjNC6E0xa+Cm09Mn1zsUhzF3X97Z7DKO+lsdoNklf/L/mO0iRlb/YEs8lKtDLPk
 G8c=
X-SBRS: 2.7
X-MesageID: 18527956
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18527956"
Date: Fri, 22 May 2020 12:19:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Message-ID: <20200522101927.GW54375@Air-de-Roger>
References: <20200514140522.GD54375@Air-de-Roger>
 <83534bf1-fa57-1d4a-c615-f656338a8457@suse.com>
 <20200520093106.GI54375@Air-de-Roger>
 <53fdfbe2-615a-72f9-7f2d-26402a0a64d0@suse.com>
 <20200520102805.GK54375@Air-de-Roger>
 <0e97e3af-b66e-4924-a76c-9e33cdd1a726@suse.com>
 <20200520114327.GL54375@Air-de-Roger>
 <d0a15359-339f-6edd-034c-cd6385e929d1@suse.com>
 <20200520171829.GO54375@Air-de-Roger>
 <2be7b657-1027-2fef-fd26-131c27e940db@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2be7b657-1027-2fef-fd26-131c27e940db@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 11:58:40AM +0200, Jan Beulich wrote:
> On 20.05.2020 19:18, Roger Pau Monné wrote:
> > I also assume that using no_caller_saved_registers when available or
> > else keeping the current behavior is not an acceptable solution? FWIW,
> > from a FreeBSD PoV I would be OK with that, as I don't think there are
> > any supported targets with clang < 5.
> 
> By "current behavior" do you mean what the patch currently
> does (matching my earlier response that I may try going this
> route) or the unpatched upstream tree?

Sorry this wasn't clear. By current I meant what's in the upstream
tree. IMO having both no_caller_saved_registers, the -ffixed-reg stuff
and the current upstream no popcnt implementation is kind of too much
divergence?

My preference would be to add popcnt support only when
no_caller_saved_registers is supported by the compiler, as I think
that's the cleanest solution. This is purely a performance
optimization, so it doesn't seem that bad to me to request a newish
compiler in order to enable it.

Roger.

