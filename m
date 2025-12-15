Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2BCBF023
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 17:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187459.1508847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVBjS-0000gb-E5; Mon, 15 Dec 2025 16:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187459.1508847; Mon, 15 Dec 2025 16:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVBjS-0000eb-Ay; Mon, 15 Dec 2025 16:47:34 +0000
Received: by outflank-mailman (input) for mailman id 1187459;
 Mon, 15 Dec 2025 16:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CXo8=6V=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1vVBjR-0000eV-2p
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 16:47:33 +0000
Received: from mx1.somlen.de (breeze.somlen.de [2a00:1828:a019::100:0])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf5b5ef7-d9d5-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 17:47:31 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id 32C1D5030C2;
 Mon, 15 Dec 2025 17:47:30 +0100 (CET)
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
X-Inumbo-ID: bf5b5ef7-d9d5-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1765817250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lmCc9H/h+2w6XJOSeUk5bHT5eGN+hX+DOKaNBuFwzJc=;
	b=LSBwna1tze02XaoOVKVjStv/Dmg37YjVGWswI3CQBULMzCzxttr8TPmI7RQsczoSWJv55y
	bwH0nyVvQIAefZSKN6TdK1P+qG3A15n6J4VIzXCjxFY9bcDezBmpwswiyafZDL1Vo/KDdp
	0kyoL+4Au9pbYGmuUSyg/bgQCVU6IzrMDuAre1QrMOmf9+1W1AZkfk1CDfQ5UhsVK3vOTk
	02eQABXMyPOu0APVT7rJzKuxRHz+QUhQdGaZ/LCW1Ma9+Wrv35MdLk5WUphq6yECsmfxCA
	uNmJdHehGXz4XqRLDHouJdSOPN53HHHcBxHz/kEQ1VirsWdHNSXbfGooH8AIpw==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Anthony PERARD <anthony@xenproject.org>
Subject:
 Re: [XEN PATCH] libxl: Fix device_add QMP calls with QEMU 9.2 and newer
Date: Mon, 15 Dec 2025 17:47:24 +0100
Message-ID: <3949153.VdNmn5OnKV@localhost>
In-Reply-To: <20251215135124.11410-1-anthony@xenproject.org>
References: <20251215135124.11410-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 15 December 2025 14:51:24 CET Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> QEMU used to ignore JSON types and do conversion string <-> integer
> automatically for the command "device_add", but that was removed in
> QEMU 9.2 (428d1789df91 ("docs/about: Belatedly document tightening of
> QMP device_add checking")).
> 
> Fixes: 9718ab394d5d ("libxl_usb: Make libxl__device_usbctrl_add uses
> ev_qmp")
> Fixes: 40c7eca10a82 ("libxl_usb: Make libxl__device_usbdev_add
> uses ev_qmp")
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

I can confirm with this patch usb passthrough works on the debian xen 4.20 
package.

Tested-by: Maximilian Engelhardt <maxi@daemonizer.de>



