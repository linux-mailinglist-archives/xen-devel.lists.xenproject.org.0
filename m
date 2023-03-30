Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015446D0565
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 14:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516702.801255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phrnG-0002GU-6U; Thu, 30 Mar 2023 12:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516702.801255; Thu, 30 Mar 2023 12:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phrnG-0002Dy-3Y; Thu, 30 Mar 2023 12:54:18 +0000
Received: by outflank-mailman (input) for mailman id 516702;
 Thu, 30 Mar 2023 12:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzUU=7W=citrix.com=prvs=446aa7e4f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1phrnE-0002Ds-Ba
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 12:54:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f770c9e4-cef9-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 14:54:13 +0200 (CEST)
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
X-Inumbo-ID: f770c9e4-cef9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680180852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zFVWl6FHEqhOUvgAIvCkLHmwVEt/WkNWTO6CEDMa4UU=;
  b=RgTqQJQR/plJqWoWkViolA00OOvRghAN4QJMQnFOf03whCYJoUbUccHA
   ziEnLrbA7x1vVhZEVTXFbHgxg6Qfz5UBpIxVI9ZJ+dAEkFIIIaHnDsaFy
   15f21H5cSUT32mEHSgn8pkSdthT3YlZ0pgef+jI9gN8XvnLbw29hmukeb
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103702062
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:blYcU6xJU+HUzXxAaJx6t+cpwSrEfRIJ4+MujC+fZmUNrF6WrkUPm
 2BODWCFPf/fMWKnLookOYqw8UgPsJCBzNNlSVdtqyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPqgT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXEe9
 qBbAhc3Uheoo+2WxZ7hddA8me12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNxRnA/
 DqYpQwVBDkaM922zReP7kv3i+HfsQfAZK1KBpCBo6sCbFq7mTVIVUx+uUGAieK5h0iiVsN3J
 Ekd+y5opq83nGSyQ9zgGhG1vnOAlhgbXdVWDqs98g7l4q/d+Q2UAi4NVjBMbNYvqcoeSjkj1
 1vPlNTsbRR3urqTW3Ob95+OoD+yMDRTJmgHDQcIUg4ay9DmqZM0iFTESZB+E8adjsXyBCrrw
 jaitiU3jKkUlogMzarT1VnamT+op5XPZgco/AjTBTjj6A5lDKaoa5Gh81TcxfZJJoWeVUXHu
 nUY8+CG5f0KJYGAkmqKWuplNKGk4bOJPSPRhXZrHoI97HK99ni7Z4dS7TpiYkBzPa4sfCT1S
 FXetQNY+NlYO37CRbRsf4u7BsAuzK7hPdfoTPbZapxJeJcZXBWG9yFnf0LW323rnEU2iqY5E
 ZOad8+2CjAdE6sP5CK2RuMY3ZcvxyY332SVQor0pzyty7GeeXWWW58MN1/IZec8hIuNuAjP+
 sxTH9eLwR5YFub5Z0HqHZU7dA5QayJhXNav9pIRL7TYSuZ7JI0/I++Bwu9iUatfo6N+sujo+
 13nZXYI13Oq0BUrNj62hmBfhKLHBMgg/CNrbXBwbT5EyFB4P9/xsf53m48fOOB+qbc9laMco
 +wtIZ3oPxhZdtjQF93xh7HZpZcqShmkjBnm08GNMGlmJM4Iq+AkF7bZkurTGMomVHDfWTMW+
 eHI6+8iacNrq/5eJMjXcumz6Fi6oGIQnul/N2ORfIkLIRywrtc0e3Kv5hPSHy3qAU+brtd9/
 1j+PPvljbOV/99dHCfh3shoULtF48MhRxEHTgE3HJ69NDXA/3rL/LKspN2gJGiHPEutofXKW
 Amg562kWBHxtAoQ4tUU/ncC5f5W2uYDUJcAlFo8RCiQNwv1Yl6iS1HftfRyWmR27ucxkWOLt
 oino7G25Z3h1BvZLWMs
IronPort-HdrOrdr: A9a23:ZRgbaaBIfugAqaflHemO55DYdb4zR+YMi2TDtnoBLCC9F/bz+v
 xG88526faZslkssQgb6Le90cq7MBHhHPxOgbX5VI3KNDUO3lHHEGgI1/qA/9SPIUzDH9lmpM
 NdmvhFY+EY1WIK9/oSOjPIa+rIHeP3lpxAWd2utEuFkzsaFp2JgG9Ce3+mLnE=
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103702062"
Date: Thu, 30 Mar 2023 13:54:05 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>, Aurelien Jarno
	<aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, Paul Durrant
	<paul@xen.org>, <xen-devel@lists.xenproject.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Chuck Zmudzinski
	<brchuckz@aol.com>
Subject: Re: [PATCH v3 1/6] include/hw/xen/xen: Rename xen_piix3_set_irq() to
 xen_intx_set_irq()
Message-ID: <b380f2c5-4f56-4713-b372-91d54114aa4e@perard>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-2-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230312120221.99183-2-shentey@gmail.com>

On Sun, Mar 12, 2023 at 01:02:16PM +0100, Bernhard Beschow wrote:
> xen_piix3_set_irq() isn't PIIX specific: PIIX is a single PCI device
> while xen_piix3_set_irq() maps multiple PCI devices to their respective
> IRQs, which is board-specific. Rename xen_piix3_set_irq() to communicate
> this.
> 
> Also rename XEN_PIIX_NUM_PIRQS to XEN_IOAPIC_NUM_PIRQS since the Xen's
> IOAPIC rather than PIIX has this many interrupt routes.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

