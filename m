Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F41DA6197A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 19:34:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915304.1320841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9rE-000623-1q; Fri, 14 Mar 2025 18:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915304.1320841; Fri, 14 Mar 2025 18:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9rD-00061B-UW; Fri, 14 Mar 2025 18:34:07 +0000
Received: by outflank-mailman (input) for mailman id 915304;
 Fri, 14 Mar 2025 18:34:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM9V=WB=bounce.vates.tech=bounce-md_30504962.67d4769b.v1-dca156a3b3a8495fa85d0e310b1e2711@srs-se1.protection.inumbo.net>)
 id 1tt9rC-0005eJ-LT
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 18:34:06 +0000
Received: from mail177-1.suw61.mandrillapp.com
 (mail177-1.suw61.mandrillapp.com [198.2.177.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e819bb62-0102-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 19:34:05 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-1.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4ZDtLM6qhCzBsTv06
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 18:34:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dca156a3b3a8495fa85d0e310b1e2711; Fri, 14 Mar 2025 18:34:03 +0000
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
X-Inumbo-ID: e819bb62-0102-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741977244; x=1742247244;
	bh=XJ3a24qpetFIlkUTjB8MUIt/veN1MpcWIkxiqMq1Nms=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aaWKYPimRCqRRAy6n+ctCUPqUGc94HbVex7qnyWYVjnHtJ7oIV1g6fSXWlYl20NTf
	 6qxWNlOQqLZ6CB+gZuPvM4b3ka7DC25kQmv53399TtuReRzs6F6S0v4y5KJT23HiGR
	 s8XMZQ//nxsAkL/tVtWzJY8JK6TntTX3/uSNgQCtpLZociXGu8wOD8MYYHOtjp6UtM
	 goU6Oo7W1VWcgDH2hiDYAIZb1xle/wcXEfSy9ygWmErR9eeKaRT7RCIBfa7B2aD2R1
	 hItWsVoFOQMZXmpqsZFbU8zt8hyITxaqxzBPjrUiXF7UDqJyUWejZgOgNi65VDO2GN
	 NBQRZXueTUdHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741977244; x=1742237744; i=anthony.perard@vates.tech;
	bh=XJ3a24qpetFIlkUTjB8MUIt/veN1MpcWIkxiqMq1Nms=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zGtD+Mt1kQ7tGCAohXX3zb5J8rQNNsorw1WXnGpRL8vr8jtRcjiy2Q51p+75TiiyU
	 L5AeEQJqSzcR2hYvVSAgu/nGOQN5f+bGxJjl2+Ew2b+7oiakmPxV0MOjtSo/s8HIOV
	 /HXCmLd++10X/OYz1b9ulesfojl6n2Ms8Wq+opSDvOzc+1LRBjLFETMPgwkniZp2a4
	 wJXYauMY3+tuQOQlaAja2bugJ3TwuJsjGO/FRJO0c5T2HOke8dmwg/0qRJbs77oyvV
	 onnoxBuW+BH9LVnJY3MocyYCyXf5DxcK3hKKUxf08XryynUPEzQsey8eJFyC22D/rh
	 uNkS8CuCPIyiA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5=2000/17]=20make=20system=20memory=20API=20available=20for=20common=20code?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741977242834
To: "Pierrick Bouvier" <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, "Yoshinori Sato" <ysato@users.sourceforge.jp>, "Paul Durrant" <paul@xen.org>, "Peter Xu" <peterx@redhat.com>, alex.bennee@linaro.org, "Harsh Prateek Bora" <harshpb@linux.ibm.com>, "David Hildenbrand" <david@redhat.com>, "Alistair Francis" <alistair.francis@wdc.com>, "=?utf-8?Q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, "Richard Henderson" <richard.henderson@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, "Nicholas Piggin" <npiggin@gmail.com>, "Daniel Henrique Barboza" <danielhb413@gmail.com>, qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org, "Palmer Dabbelt" <palmer@dabbelt.com>, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Paolo Bonzini" <pbonzini@redhat.com>, "Weiwei Li" <liwei1518@gmail.com>
Message-Id: <Z9R2mjfaNcsSuQWq@l14>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org> <5951f731-b936-42eb-b3ff-bc66ef9c9414@linaro.org>
In-Reply-To: <5951f731-b936-42eb-b3ff-bc66ef9c9414@linaro.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dca156a3b3a8495fa85d0e310b1e2711?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250314:md
Date: Fri, 14 Mar 2025 18:34:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Mar 14, 2025 at 10:33:08AM -0700, Pierrick Bouvier wrote:
> Hi,
> 
> one patch is missing review:
> [PATCH v5 12/17] hw/xen: add stubs for various functions.

My "Acked-by" wasn't enough? Feel free try change it to "Reviewed-by"
instead.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

