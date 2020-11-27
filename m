Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E27E2C683B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 15:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39555.72494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kif6w-0002WE-AL; Fri, 27 Nov 2020 14:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39555.72494; Fri, 27 Nov 2020 14:52:34 +0000
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
	id 1kif6w-0002Vp-76; Fri, 27 Nov 2020 14:52:34 +0000
Received: by outflank-mailman (input) for mailman id 39555;
 Fri, 27 Nov 2020 14:52:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0dHZ=FB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kif6u-0002Vk-Oh
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:52:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9093f5f-f704-4be1-a771-d5704ed7c4df;
 Fri, 27 Nov 2020 14:52:31 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0dHZ=FB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kif6u-0002Vk-Oh
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:52:32 +0000
X-Inumbo-ID: f9093f5f-f704-4be1-a771-d5704ed7c4df
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f9093f5f-f704-4be1-a771-d5704ed7c4df;
	Fri, 27 Nov 2020 14:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606488751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jJUcZXbN3G+d9ShSTyFz3C85sAOZLC2pSugnQvqiPxY=;
  b=d7kPj7DzqNLzRrDionuwuFiLAs/bLbQS7X20Nz6WTw79PJVOdjH16PAh
   zT3Aay16Lz52augxSzo6aNTjUpMVVtnuIORpCC9D/ez5VRPrpnLXE30dN
   pUo8LS0prqnMytDdI7zGBRXWZQnvGaHTb0m8p07I/+Ay9+q9tiSKq7M+0
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: F81GW4oBIsFnf3DpXILoVgoHENqX4BfBxXBaBnkRhAWH2+0zZ2j/guKA7KooSvnQBEafrTkZ6M
 /oDh/0MtzQL+Oo/kRAgHJctdgjnO7t/IAK5MClGk/Fy5K7LKR/Nl/KgNrDQQTo+g+mlRuwJG/Q
 syHLyYIFRvxFxwKnMBuarl5+WmLWeGYUn1xa1Ucupfe+7PCki/nrGDZZY6ii6ABS+LZCuWPcXk
 1qKpPJ7dPIU7mEFeeOARLuQpowzPwkC6/nkvmQvalyskPkB4lGAc+D0dXvMcOeBlzu0FcYT8nb
 K0U=
X-SBRS: None
X-MesageID: 33214504
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,374,1599537600"; 
   d="scan'208";a="33214504"
Date: Fri, 27 Nov 2020 14:52:27 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Eduardo Habkost <ehabkost@redhat.com>
CC: <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth
	<thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>, Richard Henderson
	<richard.henderson@linaro.org>, Claudio Fontana <cfontana@suse.de>, Roman
 Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH v2 4/6] xen: Delete xen_available() function
Message-ID: <20201127145227.GD2098@perard.uk.xensource.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-5-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201125205636.3305257-5-ehabkost@redhat.com>

On Wed, Nov 25, 2020 at 03:56:34PM -0500, Eduardo Habkost wrote:
> The function can be replaced with accel_available("xen").
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

