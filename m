Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C5EA612CF
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 14:35:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914607.1320392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bs-0006IF-Cd; Fri, 14 Mar 2025 13:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914607.1320392; Fri, 14 Mar 2025 13:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bs-0006FM-4M; Fri, 14 Mar 2025 13:35:08 +0000
Received: by outflank-mailman (input) for mailman id 914607;
 Fri, 14 Mar 2025 13:35:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=liwF=WB=bounce.vates.tech=bounce-md_30504962.67d43086.v1-d5e0b5c140f5486eb4d5bdaf868ac800@srs-se1.protection.inumbo.net>)
 id 1tt5Bp-0003Jp-Ty
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 13:35:05 +0000
Received: from mail177-1.suw61.mandrillapp.com
 (mail177-1.suw61.mandrillapp.com [198.2.177.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2201e7a5-00d9-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 14:35:03 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-1.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4ZDljL0b3CzBsThPJ
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 13:35:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d5e0b5c140f5486eb4d5bdaf868ac800; Fri, 14 Mar 2025 13:35:02 +0000
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
X-Inumbo-ID: 2201e7a5-00d9-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741959302; x=1742229302;
	bh=uG1KcJgwcW9T2cGN3oyD/12pz8pEMNAmvmnymfhPGS4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=g9hfdA/eM7vcBcCDkScEmdyush/aDVF9niLOhO1Tls29AehJMunYoTLPcqPx4URix
	 /aMh2g12ndPjgUTy22QDmBO2Q/RAv0cXaFZI+qOcWz1ZgrHfQZCrr1K3y464VLIJyL
	 qwG0X7PDYl8MR1m8vayWQ7hjrpV24L5fx3uL30NrDreDdDALoHwoF2h0fysd+K3iam
	 uuGcNVID5TPwnEu+AzI8k4h0x2P7SOTZNSkGAuW/rTouVWcrQV+q0j9IK/9Uc1NvBZ
	 Z7+4wG6V3IKm+zhLAqIfOwcWPE+QHkNe69r5WmAQgVIJNVrhCRzbohvB2D7UahSoln
	 xxQo5w3wwGFsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741959302; x=1742219802; i=anthony.perard@vates.tech;
	bh=uG1KcJgwcW9T2cGN3oyD/12pz8pEMNAmvmnymfhPGS4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JLfWifvyw3oMpzh/DIkhmNZnn3FOeOLirZx5hCQxLEpJmiyfjBrlmwr/pGpcuVoIu
	 fByVYbcweMsQZSr7P+jLoVx6FJX4LBZ/iPwhvohnmYlx2QihXR4olRcsJr2TAYMy5/
	 hudYvliyweXeQ59PZIeXS3fEzmoqQIVSV6WfgZ8kP/fcI+MggULGuM1sVWsTSFvWHP
	 wXDJuAaRWZnF/BAQRml7SWQp9RISG2jZlaNr/J+RKpmHFJEJy5WNTAhhvlfN+4YBHH
	 UwqWVJizjxihe4lGii0OSWJTOD6a2L1zM3QHS6AxlxRtem1HD3UbiF+zgVJ/AFupkT
	 hzdtfbtU4eblQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=2012/17]=20hw/xen:=20add=20stubs=20for=20various=20functions?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741959300664
To: "Pierrick Bouvier" <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, "Paul Durrant" <paul@xen.org>, "=?utf-8?Q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, "Harsh Prateek Bora" <harshpb@linux.ibm.com>, "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, xen-devel@lists.xenproject.org, "Peter Xu" <peterx@redhat.com>, alex.bennee@linaro.org, manos.pitsidianakis@linaro.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Paolo Bonzini" <pbonzini@redhat.com>, qemu-ppc@nongnu.org, "Richard Henderson" <richard.henderson@linaro.org>, kvm@vger.kernel.org, "David Hildenbrand" <david@redhat.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Weiwei Li" <liwei1518@gmail.com>, qemu-riscv@nongnu.org, "Alistair Francis" <alistair.francis@wdc.com>, "Yoshinori Sato" <ysato@users.sourceforge.jp>, "Daniel Henrique Barboza" <danielhb413@gmail.com>, "Nicholas Piggin" <npiggin@gmail.com>
Message-Id: <Z9Qwg4PC_1bEaOLK@l14>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org> <20250313163903.1738581-13-pierrick.bouvier@linaro.org>
In-Reply-To: <20250313163903.1738581-13-pierrick.bouvier@linaro.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d5e0b5c140f5486eb4d5bdaf868ac800?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250314:md
Date: Fri, 14 Mar 2025 13:35:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Mar 13, 2025 at 09:38:58AM -0700, Pierrick Bouvier wrote:
> Those functions are used by system/physmem.c, and are called only if
> xen is enabled (which happens only if CONFIG_XEN is not set).

You mean, 's/is not set/is set/'?
> 
> So we can crash in case those are called.
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
> diff --git a/hw/xen/xen_stubs.c b/hw/xen/xen_stubs.c
> new file mode 100644
> index 00000000000..19cee84bbb4
> --- /dev/null
> +++ b/hw/xen/xen_stubs.c
> +
> +void xen_invalidate_map_cache(void)
> +{

Is this stub actually necessary? xen_invalidate_map_cache() doesn't
seems to be used outside of xen's code.

In anycase:
Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

