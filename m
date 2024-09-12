Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1179765BA
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797149.1206982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogDm-0001AO-JD; Thu, 12 Sep 2024 09:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797149.1206982; Thu, 12 Sep 2024 09:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogDm-00017d-GI; Thu, 12 Sep 2024 09:34:38 +0000
Received: by outflank-mailman (input) for mailman id 797149;
 Thu, 12 Sep 2024 09:34:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R2iB=QK=bounce.vates.tech=bounce-md_30504962.66e2b5a8.v1-95ee1db029b543dfbac8076d613d9fc4@srs-se1.protection.inumbo.net>)
 id 1sogDk-00017X-KZ
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:34:37 +0000
Received: from mail145-28.atl61.mandrillapp.com
 (mail145-28.atl61.mandrillapp.com [198.2.145.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37eb5a33-70ea-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 11:34:34 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-28.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4X4C2J58l0zKsbWyh
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 09:34:32 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 95ee1db029b543dfbac8076d613d9fc4; Thu, 12 Sep 2024 09:34:32 +0000
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
X-Inumbo-ID: 37eb5a33-70ea-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1726133672; x=1726394172;
	bh=PdwAs3yGzBKdq5XvXUloxUqXwL32B5/BHH+3EdRFRQg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fckJKfYicjsoFSdMG4laphEzuvJlD0Zcpl8d+H0rxrbeoLyBcajSRtDPtZfwFVK9i
	 x++Ex06TVgcwjfPZ8ybkad6fgAWpPHhQZ0S/YBAidKCDKS7h9JFyyxF331g1ApPrOP
	 nvrEVruCY+YGSd9YV7fZ8LGm+n8q5BpeBvB75XsO4jlglr7V5TDZEt4BYEEj2gajBr
	 Gw62F9kwT6WZuGMrsYXJkRDN8iWvProuHYPL0YKnGL3h8KN7W0AK+BXo7LOMZvUBt8
	 RoKsqu3AFJhBqrG5uW1DxobrX5WEoChzGh50cNSUBHp9cOiFrKH9G25B4KR2aVSAKl
	 x2GUbhjD3IxXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1726133672; x=1726394172; i=anthony.perard@vates.tech;
	bh=PdwAs3yGzBKdq5XvXUloxUqXwL32B5/BHH+3EdRFRQg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=TseZF2fhtijUlIqMeK+rRzQvX8KY3+1WwiXGQnvs9Ys376C1sLf4dhORVHq3jQprv
	 fWqV0mrZqxujJijfuzNvsg8hUzp2wBzsdZrTGllPbOLBcwyWJY0ujXik4Yw9stHDYo
	 HJEBXlYz8fFyJL+67JQynmSTMNFGpeWLp9U5RMdqi8YcBYTvvQwLo3A4jj692NsvqN
	 kDsSapr/M4gmIpS1P0Kzkxqq9ZD2zweeKHPZk/Q+BZ7r91u/evtr1eOS4IeZOmK+nz
	 9UXHtA9txSiM8WOZoSVho8Qu+PqrJtiRQBhyUx+lFroUtfClEXvrnsqUdIVRw/AnEj
	 XrSEYr4t8KUrA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH=20v15=204/4]=20tools:=20Add=20new=20function=20to=20do=20PIRQ=20(un)map=20on=20PVH=20dom0?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1726133671058
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, Huang Rui <ray.huang@amd.com>
Message-Id: <ZuK1pn4lbFL0QJ1W@l14>
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com> <20240911065832.1591273-5-Jiqian.Chen@amd.com>
In-Reply-To: <20240911065832.1591273-5-Jiqian.Chen@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.95ee1db029b543dfbac8076d613d9fc4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240912:md
Date: Thu, 12 Sep 2024 09:34:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Sep 11, 2024 at 02:58:32PM +0800, Jiqian Chen wrote:
> When dom0 is PVH, and passthrough a device to dumU, xl will
> use the gsi number of device to do a pirq mapping, see
> pci_add_dm_done->xc_physdev_map_pirq, but the gsi number is
> got from file /sys/bus/pci/devices/<sbdf>/irq, that confuses
> irq and gsi, they are in different space and are not equal,
> so it will fail when mapping.
> To solve this issue, to get the real gsi and add a new function
> xc_physdev_map_pirq_gsi to get a free pirq for gsi.
> Note: why not use current function xc_physdev_map_pirq, because
> it doesn't support to allocate a free pirq, what's more, to
> prevent changing it and affecting its callers, so add
> xc_physdev_map_pirq_gsi.
> 
> Besides, PVH dom0 doesn't have PIRQs flag, it doesn't do
> PHYSDEVOP_map_pirq for each gsi. So grant function callstack
> pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
> domain_pirq_to_irq. And old hypercall XEN_DOMCTL_irq_permission
> requires passing in pirq, it is not suitable for PVH dom0 that
> doesn't have PIRQs to grant irq permission.
> To solve this issue, use the another hypercall
> XEN_DOMCTL_gsi_permission to grant the permission of irq(
> translate from gsi) to dumU when dom0 has no PIRQs.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

