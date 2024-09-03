Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A6496A006
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 16:13:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789244.1198799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUHF-0004kl-PG; Tue, 03 Sep 2024 14:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789244.1198799; Tue, 03 Sep 2024 14:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUHF-0004hl-Ma; Tue, 03 Sep 2024 14:13:01 +0000
Received: by outflank-mailman (input) for mailman id 789244;
 Tue, 03 Sep 2024 14:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HL1Y=QB=bounce.vates.tech=bounce-md_30504962.66d71969.v1-59641078e9924d87922749027eb55538@srs-se1.protection.inumbo.net>)
 id 1slUHD-0004hf-AJ
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 14:12:59 +0000
Received: from mail177-17.suw61.mandrillapp.com
 (mail177-17.suw61.mandrillapp.com [198.2.177.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e7e1d71-69fe-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 16:12:58 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-17.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4Wyndj0wclzRKLlgx
 for <xen-devel@lists.xenproject.org>; Tue,  3 Sep 2024 14:12:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 59641078e9924d87922749027eb55538; Tue, 03 Sep 2024 14:12:57 +0000
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
X-Inumbo-ID: 9e7e1d71-69fe-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725372777; x=1725633277;
	bh=UtQtgoJxxMCwVjzYlefX4GN0XhAj4tiyYX36m1sEVaY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=G7QoHrN8IuDz6zOgMneOKA50y9g9wo0WR5oPnf4RSY05hk4v4gzQlbjolvTkkHJHi
	 NtwTE+knNVw3PgPeQpG8RDg7/79LYzVtIjiYVZlwpTiOtFhIwdDE8iWuxOxEpW9YPb
	 AEUrVzVKaqwuVhlUSnPBVKN5tQQDtYqicTewdOZJnQKnkAsxmdbu4lAPxjzta7KFjZ
	 W6bgTcfvx42btIxelsBk3dkP1BfFrfFiMcXwRWXrZdlrDxHfCEhNsNDXa12EqeQQJx
	 1//ggGFh75ND3HHdtwcNWfFGg8R6V5qNI9PWvE/HPaOtmFbNjckzfQCHHNFBAZbKRH
	 m3cQ18dOtMmHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725372777; x=1725633277; i=anthony.perard@vates.tech;
	bh=UtQtgoJxxMCwVjzYlefX4GN0XhAj4tiyYX36m1sEVaY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=i72+KhIrKwgHiH/3qpMPQAnVBNNpDq5GthkWqmSGhfKidkxprddYGtBh6DMhdBNfR
	 2NcNKtDisqqbcADM0LumOih67A88wvh5kJPR3+RBqXSSIihblzCLWvZlLkkhBgpIvw
	 SjijQsXiVvdqewnqcPf39j3AlK9MFPTIugPCJAOaNnXTkuw8AyWKIcDKVXS1aNbJfl
	 g/xczDvH8yvRV889yjfLEG+AmWk9vWvLbam2uayJv5c6ddDe6EtDmOHiDK27/lwpWZ
	 9lFyAErFlpNeblG9xji+QAD/PkJbr+4bAKqX0V4wwJoG+rRA3nCYXboP2dkAy2NnCo
	 4Ac07KxCCopJw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH=20v14=204/5]=20tools:=20Add=20new=20function=20to=20get=20gsi=20from=20dev?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725372775049
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <ray.huang@amd.com>
Message-Id: <ZtcZZh6ebgFonQDR@l14>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com> <20240903070424.982218-5-Jiqian.Chen@amd.com>
In-Reply-To: <20240903070424.982218-5-Jiqian.Chen@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.59641078e9924d87922749027eb55538?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240903:md
Date: Tue, 03 Sep 2024 14:12:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Sep 03, 2024 at 03:04:23PM +0800, Jiqian Chen wrote:
> When passthrough a device to domU, QEMU and xl tools use its gsi
> number to do pirq mapping, see QEMU code
> xen_pt_realize->xc_physdev_map_pirq, and xl code
> pci_add_dm_done->xc_physdev_map_pirq, but the gsi number is got
> from file /sys/bus/pci/devices/<sbdf>/irq, that is wrong, because
> irq is not equal with gsi, they are in different spaces, so pirq
> mapping fails.
> 
> And in current codes, there is no method to get gsi for userspace.
> For above purpose, add new function to get gsi, and the
> corresponding ioctl is implemented on linux kernel side.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> ---
> RFC: it needs to wait for the corresponding third patch on linux kernel side to be merged.
> https://lore.kernel.org/xen-devel/20240607075109.126277-4-Jiqian.Chen@amd.com/
> ---
> v13->v14 changes:
> No.
> 
> v12->v13 changes:
> Rename the function xc_physdev_gsi_from_pcidev to xc_pcidev_get_gsi to avoid confusion with physdev namesapce.
> Move the implementation of xc_pcidev_get_gsi into xc_linux.c.
> Directly use xencall_fd(xch->xcall) in the function xc_pcidev_get_gsi instead of opening "privcmd".

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

