Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF7544E88E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 15:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225268.389020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlXR6-0006U1-UB; Fri, 12 Nov 2021 14:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225268.389020; Fri, 12 Nov 2021 14:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlXR6-0006Qp-Qj; Fri, 12 Nov 2021 14:21:48 +0000
Received: by outflank-mailman (input) for mailman id 225268;
 Fri, 12 Nov 2021 14:21:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wASN=P7=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mlXR4-0006Qe-Rb
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 14:21:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc5d900e-43c3-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 15:21:45 +0100 (CET)
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
X-Inumbo-ID: dc5d900e-43c3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636726905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PJgvDmnU0Gw2TCe3FV2QRTHKwc1zmFb1icOaRHm2mVk=;
  b=Cyb0MZLzRBkrf85Vdjk6FpzrBoe09Vaj7YQaxly8bPtM4I7ySwxuxkxP
   YrVKWCEI2wdy0kZFu9CqvQ5a7Wtr56rjZOn1GgMo9oyt3BtiG/Vqn+aSo
   E+mHEUWY6Az4NpdFC+5XTWmmTia3MMjdZn1frelCK/Pfxrwthenf3I4jD
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: k1iMMWY6VSdUrONqWuWD2Do0ah8bvWhE9hIlXrXIho2iyPZD9qVbF9w/sqFOaOwGX2fWScZ/nX
 iwhs5QmhZcVAvTxTZiboo+5X8tIdCvGPj0ywp8BsnABWwHw7mukcb+1LWtO3YNYhzz/nBnFglv
 fjL5b7jWMuEsw+6lbcs7lO6MJK+eEc/Q7tYCdjMGEEljW+dTJhGpHlNupCqp6UHHyFgXx3moc+
 LOzy7wDFNn5erJKTEZK+iovyPYbym3jqsZKYpIiZ/V86dwa6tOW8EakhlsR/4Z4wEugBB15hTs
 WSVWyDOeRp1thnc9Lhj8KHfE
X-SBRS: 5.1
X-MesageID: 59654895
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:A9lFXKIR4yB1fnUqFE+Rm5MlxSXFcZb7ZxGr2PjKsXjdYENSgWMAy
 jAYXGuPbvyNNmWhLth3Ptm3pE9QuMPdyNI2GgVlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es6wbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Csel2y
 dYS6aaNChwwZpDmwtgYWEBhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gph2J0STaeDD
 yYfQR4/NBHvQy9pAUkaL7QBs6CUmGf5LRQN/Tp5ooJoujOOnWSdyoPFMcXXUsyHQ91PmUSVr
 X6A+H72ajkEM9iYxSuA42ibjObFliPmW6ofDLS9sPVthTW7xGMJDwYNfUCmuvT/gUm7M/pAL
 2QE9yxoqrI9nGShQ8PhRRS+rDiBtwQFRttLO+Qg7UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq1+LGJ6y2zOjIcKEcSZCsFSxtD6N7myKkxkxbOQ9BLAKOzyNrvFlnY2
 CuWpSIzg7ESi88j1Kih+13DxTW2qfD0ohUdv1uNGDj/t0UgOdDjN9fABUXnAehoJ6igSViC4
 yQ+pouF9bgzJ8uxkSfUebBYdF223MqtPDrZiF9pOpAu8TWx5nKuFbxtDCFCyFRBaZhdJ2KwC
 KPHkUYIvcIIYiP2BUNiS9vpU5xC8ET2KTjyuhk4hPJqa4M5SgKI9ToGiaW4jzG0yxhEfU3S1
 P6mnSeQ4ZQyVfsPINmeHb51PVoXKsYWnz67qXfTlUTP7FZmTCTJIYrpyXPXBgzD0IuKoR/O7
 /FUPNaQxhNUXYXWO3eMr9BOcwpRdilmX/gaTvC7kMbZf2KK/0l7W5fsLU4JIdQ5z8y5aM+Ul
 p1CZqOo4AWm3iCWQel7QntidKnuTf5CQYETZkQR0aKT8yF7O+6Htf5HH7NuJOVP3LEznJZcE
 qheE+3dU6snd9gy02lEBXULhNc5L0rDaMPnF3fNXQXTiLY8HVGUoYG9IVO0nMTMZwLu3fYDT
 3Sb/luzafI+q85KV646sdqjkAG8u2YzguV3UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvoclS+RrwKsy6sHBvbhfygg4TnzHY07yUuFrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoN73R2+sVlz/e6eUODH/7vCInrqCaVUhyPgWXjHAPJrVCL454k
 /wqv9Qb6lLjh0NyYMqGlC1d60+FMmcED/c8rpgfDYLm1lgrx1VFbcCOAyP6+sjSOdBFM01sK
 T6InqvSwb9bwxOaIXY0EHHM28tbhIgP508WnANTeQzRl4qXnOIz0T1Q7S8zH1ZcwRhw2u5uP
 nRmah9uLqKU8jY03MVOUghAwe2a6MF1LqAp92Y0qQ==
IronPort-HdrOrdr: A9a23:EhJepawnrcinrgLJfM7JKrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.87,229,1631592000"; 
   d="scan'208";a="59654895"
Date: Fri, 12 Nov 2021 14:21:39 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <bertrand.marquis@arm.com>, <volodymyr_babchuk@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [XEN][RFC PATCH v2 10/12] tools/libs/ctrl: Implement new xc
 interfaces for dt overlay
Message-ID: <YY54czzrdy23TKZY@perard>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-11-git-send-email-fnu.vikram@xilinx.com>
 <YY1KwUC7EaJC4vJa@perard>
 <20211111194634.GA211320@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211111194634.GA211320@xilinx.com>

On Thu, Nov 11, 2021 at 11:46:36AM -0800, Vikram Garhwal wrote:
> On Thu, Nov 11, 2021 at 04:54:25PM +0000, Anthony PERARD wrote:
> Hi Anthony,
> > On Mon, Nov 08, 2021 at 11:02:25PM -0800, Vikram Garhwal wrote:
> > > +SRCS-$(CONFIG_OVERLAY_DTB) += xc_overlay.c
> > 
> > So, this patch seems to introduce the use of CONFIG_OVERLAY_DTB, is
> > there a reason why the new functionality can't be always builtin?
> > 
> Above, if you meant removing "CONFIG_OEVRLAY_DTB" then here is my answer:
> This feature is supported by ARM based FPGA devices only so there were a few
> comments on v1 series to keep the code inside a config only. Now, for the tool
> side also I kept the CONFIG_OVERLAY_DTB to align the xen-tools with Xen.
> 
> Although, now i saw your comments on patch 10 regarding  "always provide
> libxl_dt_overlay() but which would return ENOSYS when libxl is built without
> CONFIG_OVERLAY_DTB". That seems better approach here for all three xen-tool
> patches.
> 
> Initially, i was not sure what to do here that's why i wrote a question in the
> cover letter about this.
> 
> Also, do you know how to enable this config via menuconfig when building the Xen
> tools? I know how to enable for Xen but not sure about tools.

It isn't possible to use the configuration of the hypervisor to build
the tool. We use autoconf (configure.ac, ...) to configure the tools but
I don't think in this case that having CONFIG_OVERLAY_DTB for the tools
is the right thing to do. In the tools, we don't really have a way to
select functionalities available in the different libraries, or it is
mostly based on the architecture or operating system or available
system libraries.

Contrary to the hypervisor side, the added code in the libraries is
mostly glue which calls the hypervisor, so their isn't really a need to
avoid building it. If the functionality isn't available in the
hypervisor, it should return an error and the library can deal with that
error.

You might want to limit the build to Arm, but I don't know if that
"overlay dtb" thing is really Arm specific (even though device trees are
mostly use on Arm I guess).

-- 
Anthony PERARD

