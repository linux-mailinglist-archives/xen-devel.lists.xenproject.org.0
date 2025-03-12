Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E0AA5E13F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 16:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910526.1317227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsOSu-0005bi-W9; Wed, 12 Mar 2025 15:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910526.1317227; Wed, 12 Mar 2025 15:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsOSu-0005aG-TP; Wed, 12 Mar 2025 15:57:52 +0000
Received: by outflank-mailman (input) for mailman id 910526;
 Wed, 12 Mar 2025 15:57:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8h/g=V7=bounce.vates.tech=bounce-md_30504962.67d1aef9.v1-a735cce01c05447bb713fb00167c548f@srs-se1.protection.inumbo.net>)
 id 1tsOSt-0005a8-Ut
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 15:57:51 +0000
Received: from mail186-3.suw21.mandrillapp.com
 (mail186-3.suw21.mandrillapp.com [198.2.186.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd30e628-ff5a-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 16:57:46 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-3.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZCZyx4CCVzDRJCN4
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 15:57:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a735cce01c05447bb713fb00167c548f; Wed, 12 Mar 2025 15:57:45 +0000
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
X-Inumbo-ID: bd30e628-ff5a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741795065; x=1742065065;
	bh=nAmIFM4CjnvkyICVxTX3oUeTQv6V2AaVsgnTN88vk3A=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=A5d5zRyfeirbH1WKyeRkU+GAZpjgG8WgmfxGI0lFFaYjQ7o3m30wWsFRTXG0D8RXv
	 cuDouPVzARmVAQsm+uw9UcRB0Ngc8BD/WnldyZOj7P8a/LL7+wSIK8a0qrgQ6KYOIS
	 Z+gK1nrTdh/GMpbuJ5s5zBMUZBAt84nxK1XnS2uLLQsNhB9hsZPK2zd8PRmO/JvXo2
	 AM+PvrcJR2EKHRCvo5FxWTQgNl/UwHfjf27iGTDDK2qSz7uHwtxBTFo/2qAMLDCvEE
	 6IuT1op5EVxjN2YYoQ5uyLVfxnT58wipuRlVbv44weEjZuY3LObyqRkvJANwOUhU8c
	 fwHHfXqG3I8FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741795065; x=1742055565; i=anthony.perard@vates.tech;
	bh=nAmIFM4CjnvkyICVxTX3oUeTQv6V2AaVsgnTN88vk3A=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mUc1bkVSKpIbp3FGJehjVEPFfS8vSRRzKDrasJbN83MF56tsNYIcwHXIpHG5/v3Lo
	 x66i7tjE2ZoEaC/n64Xx4A+n4QY/aBrQZGQqodRXrJbrzQQG6ZnAKFCq9SiEMXu8ha
	 S44XZqgLQZPy+j++1aWg83faxHcdXwMD1EWb4WWvHQ+r2wR5wuowOkwKpFwD8JKlSW
	 Jyi4/hHYheC8ZShtezT2E75S7WkYqxvYuWg2v1FXukxlpQ6Dt29/J9hzGX1iLX9mKg
	 CUTOOvWjbm0m6aX6qOKOplLgcWliAGaXgc7hPY2hz1mVPP5G2gjFL6W/6Ue5GifO2h
	 GiEol73ifcksw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=202/2]=20tools/libxl:=20Skip=20missing=20PCI=20GSIs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741795064561
To: "Jason Andryuk" <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Juergen Gross" <jgross@suse.com>
Message-Id: <Z9Gu-N4kbzgwQ-5R@l14>
References: <20250308001711.18746-1-jason.andryuk@amd.com> <20250308001711.18746-3-jason.andryuk@amd.com>
In-Reply-To: <20250308001711.18746-3-jason.andryuk@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a735cce01c05447bb713fb00167c548f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250312:md
Date: Wed, 12 Mar 2025 15:57:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Mar 07, 2025 at 07:17:11PM -0500, Jason Andryuk wrote:
> A PCI device may not have a legacy IRQ.  In that case, we don't need to
> do anything, so don't fail in libxl__arch_hvm_map_gsi() and
> libxl__arch_hvm_unmap_gsi().
> 
> Requires an updated pciback to return -ENOENT.
> 
> Fixes: f97f885c7198 ("tools: Add new function to do PIRQ (un)map on PVH dom0")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

