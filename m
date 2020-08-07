Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ADF23EA6E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 11:35:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3ymh-0004dS-8k; Fri, 07 Aug 2020 09:35:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3abS=BR=tronnes.org=noralf@srs-us1.protection.inumbo.net>)
 id 1k3ymf-0004dK-Q9
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 09:35:29 +0000
X-Inumbo-ID: c2be4be2-fcba-4cd0-b29e-78fb660b8eb5
Received: from smtp.domeneshop.no (unknown [2a01:5b40:0:3005::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2be4be2-fcba-4cd0-b29e-78fb660b8eb5;
 Fri, 07 Aug 2020 09:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gGIwDhOjA1LUWyVCPaxr0QUqfVFuaQ2aeOuDTG1FAG0=; b=MslSwSkr01gt37As8fjtp3c4L+
 6xxPqtPSL4bh0HaSr22/l0EGjObkF7Y1b2yd2VrnO1qxWjAao21ToRnsob2Q5HbRxmUk+K7ktL12e
 fWSA93OWvOje0tkgZmr2nk07ub+RYndaYdyv+soRH/pget70PhJuqhr+rN+PgY2iCwHGJtCohnlZg
 v4TLPW1TL7Ywcwt3k72wJq6XiXclEFTwFNgw7x4GdYH1v54sHHX+/uCERdnN1lRTARFnk8sUiEwEi
 Uit4ZbeeL+I0RrTXQKS5ObwCFH0AHHQtFg6tWAe7QKe14ZsFxgXUV+ABxCRIBtndf2CBx3IADZFgB
 HQotCxuQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53009
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1k3ymc-0001ze-4F; Fri, 07 Aug 2020 11:35:26 +0200
Subject: Re: [PATCH 3/6] drm/xen-front: Add YUYV to supported formats
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200731125109.18666-1-andr2000@gmail.com>
 <20200731125109.18666-4-andr2000@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a7a3ce30-34a8-c084-5cbd-88271271ac67@tronnes.org>
Date: Fri, 7 Aug 2020 11:35:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731125109.18666-4-andr2000@gmail.com>
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
> Add YUYV to supported formats, so the frontend can work with the
> formats used by cameras and other HW.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---

Acked-by: Noralf Trønnes <noralf@tronnes.org>

