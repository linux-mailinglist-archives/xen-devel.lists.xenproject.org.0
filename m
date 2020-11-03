Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E884B2A4CF6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 18:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18553.43558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka09o-0000nc-4y; Tue, 03 Nov 2020 17:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18553.43558; Tue, 03 Nov 2020 17:31:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka09o-0000nD-1s; Tue, 03 Nov 2020 17:31:44 +0000
Received: by outflank-mailman (input) for mailman id 18553;
 Tue, 03 Nov 2020 17:31:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=41xg=EJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ka09n-0000n8-6W
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 17:31:43 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfd500e8-a119-4019-8e19-933af3f2c3d5;
 Tue, 03 Nov 2020 17:31:42 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=41xg=EJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1ka09n-0000n8-6W
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 17:31:43 +0000
X-Inumbo-ID: dfd500e8-a119-4019-8e19-933af3f2c3d5
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dfd500e8-a119-4019-8e19-933af3f2c3d5;
	Tue, 03 Nov 2020 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604424702;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=s0pQQFFvhWYyXKJWlitZjyFa0XWXukXhrXKQfbo2Kr8=;
  b=Q3MZnZ9q/fhPsBJLHPBHqZml6c5kkhO1+Df9oVPnutfHen4OPHKGuquy
   yjzfo+9qtIcYsL/1XboMafD5PCYetUiS8YHRVgdj14b6cPWHqPtp2i/+S
   hk2BHJ+gWmIHGteK6HjkZ697UVmWdpak7o9jOu283Hq0kQlTPr1p22Df7
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Mm2REViDg1xsQhVFqs0wtoWSRUzOYJIqZ9tDIODDfXplzzSgsKkaU10JZLuKw91WNpbesAD4w2
 8t1YLzZZH2p8RccOoU6qpPmU1UaiBnuy7aics1wouNYlM/AbF/embRwpQs923G7qTKKdXPsHn5
 YJpJ694mjQRTaZ+Ai3lEDsxmQQAB7Kxu+RQAQYxFSiShZQGjjq2Ox8R1/rN+brPZ9FHuXE8Sko
 Ao3+so7lCCX1FkvYYjISpas7hDIpbH3+Qmmzf7kOyuJf2PtGYbNQScz+PA+vkkM/J4hf5sdF5n
 CGc=
X-SBRS: None
X-MesageID: 30636121
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,448,1596513600"; 
   d="scan'208";a="30636121"
Subject: Re: [PATCH] x86/PV: conditionally avoid raising #GP for early guest
 MSR accesses
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cf814663-0319-6a30-f3a2-dc43432eedb1@citrix.com>
Date: Tue, 3 Nov 2020 17:31:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 03/11/2020 17:06, Jan Beulich wrote:
> Prior to 4.15 Linux, when running in PV mode, did not install a #GP
> handler early enough to cover for example the rdmsrl_safe() of
> MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded read
> of MSR_K7_HWCR later in the same function). The respective change
> (42b3a4cb5609 "x86/xen: Support early interrupts in xen pv guests") was
> backported to 4.14, but no further - presumably since it wasn't really
> easy because of other dependencies.
>
> Therefore, to prevent our change in the handling of guest MSR accesses
> to render PV Linux 4.13 and older unusable on at least AMD systems, make
> the raising of #GP on these paths conditional upon the guest having
> installed a handler. Producing zero for reads and discarding writes
> isn't necessarily correct and may trip code trying to detect presence of
> MSRs early, but since such detection logic won't work without a #GP
> handler anyway, this ought to be a fair workaround.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I appreciate that we probably have to do something, but I don't think
this is a wise move.

Linux is fundamentally buggy.  It is deliberately looking for a
potential #GP fault given its use of rdmsrl_safe().  The reason this bug
stayed hidden for so long was as a consequence of Xen's inappropriate
MSR handling for guests, and the reasons for changing Xen's behaviour
still stand.

This change, in particular, does not apply to any explicitly handled
MSRs, and therefore is not a comprehensive fix.  Nor is it robust to
someone adding code to explicitly handling the impacted MSRs at a later
date (which are are likely to need to do for HWCR), and which would
reintroduce this failure to boot.

We should have the impacted MSRs handled explicitly, with a note stating
this was a bug in Linux 4.14 and older.  We already have workaround for
similar bugs in Windows, and it also gives us a timeline to eventually
removing support for obsolete workarounds, rather than having a "now and
in the future, we'll explicitly tolerate broken PV behaviour for one bug
back in ancient linux".

~Andrew

