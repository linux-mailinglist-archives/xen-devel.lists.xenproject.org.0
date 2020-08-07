Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220C623EA6B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 11:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3ylB-0004Vw-M8; Fri, 07 Aug 2020 09:33:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3abS=BR=tronnes.org=noralf@srs-us1.protection.inumbo.net>)
 id 1k3yl9-0004Vr-Bx
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 09:33:55 +0000
X-Inumbo-ID: cc44c402-c43c-493f-be3f-f049b9594f81
Received: from smtp.domeneshop.no (unknown [2a01:5b40:0:3005::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc44c402-c43c-493f-be3f-f049b9594f81;
 Fri, 07 Aug 2020 09:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dhBn85DVkd9WiwzdeA0ZAk87Jr2Z06qRR9qaDjfK2Q0=; b=m+PWgSDl91eMGK8rvIUKM0yLbY
 BTtvVt7GHjbFDWuiAwCew1o4DpGo0X5EvPmAu5NoF3KVa/WrJcno0rE7yU1ZuLLtdori78nG3MTCt
 /b8lIQ2wjTrAa0IiTxbfflVOoB7ItTWH5BtnD5ca03DmpWO/VJDk2VuV869dshjYbkabO+gvNdp24
 JWObB1zbNo/5PI0p3ZVDSwL/BO7R7V/6mJxK0CCdbPFRQbzPeg7iUN/yZAnyl20Pngs2xjN3NmTPy
 zdQzdFT7BoYqEc5G2bz0PhPFH2d51HiC/khBGUEla9ZiuFb88uEbH9k/urcGwnv8sV65Q7rLD6Dvg
 5yexQLUA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52994
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1k3yl5-0001BT-1d; Fri, 07 Aug 2020 11:33:51 +0200
Subject: Re: [PATCH 5/6] drm/xen-front: Pass dumb buffer data offset to the
 backend
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200731125109.18666-1-andr2000@gmail.com>
 <20200731125109.18666-6-andr2000@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a8930c22-756f-0fc9-6288-8945a058764e@tronnes.org>
Date: Fri, 7 Aug 2020 11:33:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731125109.18666-6-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



Den 31.07.2020 14.51, skrev Oleksandr Andrushchenko:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> While importing a dmabuf it is possible that the data of the buffer
> is put with offset which is indicated by the SGT offset.
> Respect the offset value and forward it to the backend.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---

Acked-by: Noralf Trønnes <noralf@tronnes.org>

