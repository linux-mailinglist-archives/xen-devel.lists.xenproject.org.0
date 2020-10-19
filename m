Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9548529290E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 16:11:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8721.23380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUVsZ-0001BA-IE; Mon, 19 Oct 2020 14:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8721.23380; Mon, 19 Oct 2020 14:11:15 +0000
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
	id 1kUVsZ-0001Al-Ep; Mon, 19 Oct 2020 14:11:15 +0000
Received: by outflank-mailman (input) for mailman id 8721;
 Mon, 19 Oct 2020 14:11:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L3Wa=D2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kUVsX-0001Ae-En
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 14:11:13 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5d267e0-b21b-492b-bc33-e0b8ff10cbb5;
 Mon, 19 Oct 2020 14:11:11 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=L3Wa=D2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kUVsX-0001Ae-En
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 14:11:13 +0000
X-Inumbo-ID: c5d267e0-b21b-492b-bc33-e0b8ff10cbb5
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c5d267e0-b21b-492b-bc33-e0b8ff10cbb5;
	Mon, 19 Oct 2020 14:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603116672;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=5f7+/MNH6SaV19O3fTW/yecNFlNGLoKclSOSAsEY1Zo=;
  b=b6AQtf3vhINp/lKZNuMogwSB107/kbZx4IEyjkKs6kcz5BUnZuSwxqRs
   p8i66nsjGS6cmjYiA6I4arByEEg3Fb/GAI5+0lg+0Ie3hVKuFpL8VrO1D
   UNbkBagMcKPTR6XBnkiGEDReoJe9K2P6Sl7XOYt5657g+znYy9TSb+4yE
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vLVREriFjx0v8ejZNAN8fPnm3PHtWYqAF3XvpoLdTRi5TGNpr+ziIhwt6+vG/2vUT6njaNnT1u
 PhGLPX2r0Fv1yAYQgS+jEzOQilZlHLok2setgqlN5xFsrk/x+V3DQtV3K+IKoHKH9GpXboLLHe
 T+L16yN4gbG8ZeONtd4tAdbDPdc45WF5/YPwDuXK9V927gNJJ0UjZDuGxhwIJEzC3G9NEGZzPA
 NQBZ3HMjmDJQqOhWtR8dvGyGU5YgCGOqgWbwBi2xKtq0dZttWH2zb8ftC/GnqYX1gT9pHxFI3O
 iyk=
X-SBRS: None
X-MesageID: 29304147
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,394,1596513600"; 
   d="scan'208";a="29304147"
Subject: Re: [PATCH] SVM: avoid VMSAVE in ctxt-switch-to
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <a01862b8-6e16-5ddc-7f48-2d3bed2f34b6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9d0cae4e-f849-f2a3-4261-d3efb977deeb@citrix.com>
Date: Mon, 19 Oct 2020 15:10:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a01862b8-6e16-5ddc-7f48-2d3bed2f34b6@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 19/10/2020 14:40, Jan Beulich wrote:
> Of the state saved by the insn and reloaded by the corresponding VMLOAD
> - TR, syscall, and sysenter state are invariant while having Xen's state
>   loaded,
> - FS, GS, and LDTR are not used by Xen and get suitably set in PV
>   context switch code.

I think it would be helpful to state that Xen's state is suitably cached
in _svm_cpu_up(), as this does now introduce an ordering dependency
during boot.

Is it possibly worth putting an assert checking the TR selector?  That
ought to be good enough to catch stray init reordering problems.

> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Either way, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

