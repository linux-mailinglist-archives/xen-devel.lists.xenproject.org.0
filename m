Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F4224FDFF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 14:46:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kABrJ-0006Ge-5k; Mon, 24 Aug 2020 12:45:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/Qh=CC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kABrI-0006GZ-5N
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 12:45:56 +0000
X-Inumbo-ID: c21440eb-3930-42b4-8bda-77e514cee967
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c21440eb-3930-42b4-8bda-77e514cee967;
 Mon, 24 Aug 2020 12:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598273153;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=D0KEwIWOL3KGd4ZDZBa4LcecWyhBPPyq/+lxMIPpTaw=;
 b=LPnDoDdkQGdmVOrzzFaYzNxf6rAmaH5Zi74wGMSDLPb46Vj1YKP7VBHo
 4bsI9bVbbPBkZ0ZXEznZCuQfgC7VPfH7VcIckoLhxj2wbpbv7ny8v9089
 ee8x9EoEAkZ+KdF3F+YxFPFlWpnMmqj5YC8sRifVKHB1Re67lmoRgtWOv I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GWp0dTHNNTOUSfVjGCzDXSQDE51REwnko6HOE41eaQPH3NEQbb3qwR8Bn7DdfPuYdHa8693rXD
 m1jMu2vghXb91eXZjMnK59JsQndsFguSHaD1HOefHjy/kKWyx+N/N9F8f465rdjGC8G7hhJXVy
 lKLvX0SVAZ9DpKszr1OQbrAGh+eveOmQGr7pxkRaJf3WGJN3DHTGtE03X1hFvVkb5/00fMipIV
 NOzqGT/sOTFFlVc+Ctnjn++ah4xoNZFcQ5rk5ADTHBpHacEvlkzrc5kzcbP5NR7IK5UNAgZP8m
 gKw=
X-SBRS: 2.7
X-MesageID: 25291848
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,348,1592884800"; d="scan'208";a="25291848"
Subject: Re: [PATCH v2 1/5] x86: convert set_gpfn_from_mfn() to a function
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
 <27a76f08-6ce4-71aa-a528-ee2633287576@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8e5467a4-73a5-ad92-7e06-f0e313849e3a@citrix.com>
Date: Mon, 24 Aug 2020 13:45:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <27a76f08-6ce4-71aa-a528-ee2633287576@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/08/2020 13:34, Jan Beulich wrote:
> It is already a little too heavy for a macro, and more logic is about to
> get added to it.
>
> This also allows reducing the scope of compat_machine_to_phys_mapping.
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

It's a shame that we can't reduce the scope of
machine_to_phys_mapping_valid too.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

