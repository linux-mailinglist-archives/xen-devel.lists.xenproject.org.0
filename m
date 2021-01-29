Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F82E3087DB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77925.141492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5R8F-0006zj-Qb; Fri, 29 Jan 2021 10:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77925.141492; Fri, 29 Jan 2021 10:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5R8F-0006zN-NJ; Fri, 29 Jan 2021 10:36:03 +0000
Received: by outflank-mailman (input) for mailman id 77925;
 Fri, 29 Jan 2021 10:36:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XqTT=HA=kroah.com=greg@srs-us1.protection.inumbo.net>)
 id 1l5R8D-0006zG-Sz
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:36:02 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da0409bc-883b-4e97-9a41-6a0eb94fc658;
 Fri, 29 Jan 2021 10:36:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C43B25C0140;
 Fri, 29 Jan 2021 05:36:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Jan 2021 05:36:00 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id D0C6824005A;
 Fri, 29 Jan 2021 05:35:59 -0500 (EST)
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
X-Inumbo-ID: da0409bc-883b-4e97-9a41-6a0eb94fc658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=4
	sIVOb41X70JozTnXUFauGcmu5JH2TTTxgOh8kwtLio=; b=i5y8AFC4LGZNzIng3
	HcNqx9+534XhTle7SY3wqifd8MLofkKftMPShvY66fq1GhlCoHTnHmWx68eSI1GE
	WkSdLvZMEakiSM97H5xvT8pBAu4CpCe7uNXg32FVggPL/R8oX3R9bNmGbHg8H1zy
	RS84HQHfyjDR+MO276H3FCZoCX7N6JBH3Gr0OIonQEtCfg8/qUpkXfMWnYMNzQgZ
	XoT9QRfxXyoOws4JznVh1sJSg2CJ3gnCAf4CnDDIKgdRkVgg696KKw73JRDzJlTM
	zZh2zqsohmQA8Q01AVQieV/Aq4HhNIABrJhs6AwV+i9ukv48VI+38Bya9Njg+pzx
	hma+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=4sIVOb41X70JozTnXUFauGcmu5JH2TTTxgOh8kwtL
	io=; b=plX3JTRcqeuRKvG7BElo/HzGurSMidrt3MACFT+kLsh1/nwXsXXsr1fpZ
	Wo9LpSRaO6PKqC7NXe4DLALKF5lDxkauTkEe6FeXc03K3SL6VSskyN1sxBQSEtBs
	JeVbCWTvZ0nksfZlFy5FjVTQQIQm76+Ir21UJ1xu2mVobldsLFdDXc/tI4zFnfv4
	We0mDJ6uRFOkPuJwT1Ctej3C1KwmW5O73heWZALR2QjA6fCTtRzEsmfVqDMAp9hH
	YPLYSAOHRSCh55Ti/KAoF7aBuPSXdyO/dr+QAsVWP01VP/5wQlu+iP756xQZ7J1a
	ZRM7lrQcmHCqp8uNhTgtcdVeAQxqA==
X-ME-Sender: <xms:EOUTYLzBvktTXHXabjsI1L2fSxfnSgDnzIwws3gZcqeHqPQBLu4kkA>
    <xme:EOUTYDSBjYsbLc_ypmKjRNERfEuJP0x6i87xDt5L9xA24d_No2jMkE6fn_bl6GQb6
    QEVqih2GT5fcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvgdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpedvfffgue
    eiuefhheevheetgfehvdefgeekfeevueejfeeftdetudetiefhheffvdenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghh
    rdgtohhm
X-ME-Proxy: <xmx:EOUTYFUTpbhs8MEQ4UKGy0FhtmoXNzd-nKYNYsU0Ig1N9UDYAg6IIQ>
    <xmx:EOUTYFgF57rFL5Xtv3XGwVlhHKJeWUGi4Vz5L8dLxk9Bu2mZkrp1Aw>
    <xmx:EOUTYNAajpxrgs-cLG8AwyZqQxg5OUtVMNDKQAnqHIOKHa4BkBYt_g>
    <xmx:EOUTYMOG1EiNTVfPi1icuxQqzjM8M7vKuMp34BjjSRysjOOZcMYxyw>
Date: Fri, 29 Jan 2021 11:35:58 +0100
From: Greg KH <greg@kroah.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: stable@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH for <= 5.4] xen/privcmd: allow fetching resource sizes
Message-ID: <YBPlDmlJTK78clC3@kroah.com>
References: <20210118140426.80458-1-roger.pau@citrix.com>
 <YAgN7hlFe73mrBWE@kroah.com>
 <1a70f632-1437-5501-faac-98f05380d5ea@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a70f632-1437-5501-faac-98f05380d5ea@citrix.com>

On Tue, Jan 26, 2021 at 05:22:59PM +0000, Andrew Cooper wrote:
> On 20/01/2021 11:03, Greg KH wrote:
> > On Mon, Jan 18, 2021 at 03:04:26PM +0100, Roger Pau Monne wrote:
> >> commit ef3a575baf53571dc405ee4028e26f50856898e7 upstream
> >>
> >> Allow issuing an IOCTL_PRIVCMD_MMAP_RESOURCE ioctl with num = 0 and
> >> addr = 0 in order to fetch the size of a specific resource.
> >>
> >> Add a shortcut to the default map resource path, since fetching the
> >> size requires no address to be passed in, and thus no VMA to setup.
> >>
> >> This is missing from the initial implementation, and causes issues
> >> when mapping resources that don't have fixed or known sizes.
> >>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Reviewed-by: Juergen Gross <jgross@suse.com>
> >> Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Cc: stable@vger.kernel.org # >= 4.18
> >> Link: https://lore.kernel.org/r/20210112115358.23346-1-roger.pau@citrix.com
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >> ---
> >> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> >> Cc: xen-devel@lists.xenproject.org
> >> ---
> >>  drivers/xen/privcmd.c | 25 +++++++++++++++++++------
> >>  1 file changed, 19 insertions(+), 6 deletions(-)
> > Now queued up, thanks.
> 
> Hello,
> 
> The upstream version of this patch was queued against 5.4 and 4.19, both
> of which suffered a patch conflict, and are fixed by this version.
> 
> Was it an oversight that this version didn't get queued for 4.19?

It does not apply cleanly there, if you provide a working backport, I
will be glad to apply it.

thanks,

greg k-h

