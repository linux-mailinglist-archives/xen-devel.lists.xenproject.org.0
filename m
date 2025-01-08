Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED759A05E80
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:23:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867310.1278780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVWxL-0004FI-5F; Wed, 08 Jan 2025 14:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867310.1278780; Wed, 08 Jan 2025 14:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVWxL-0004D6-26; Wed, 08 Jan 2025 14:22:47 +0000
Received: by outflank-mailman (input) for mailman id 867310;
 Wed, 08 Jan 2025 14:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dlK9=UA=bounce.vates.tech=bounce-md_30504962.677e8a32.v1-92b24b3a57f545cb8805b8815b935cad@srs-se1.protection.inumbo.net>)
 id 1tVWxK-0004Co-Am
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:22:46 +0000
Received: from mail135-5.atl141.mandrillapp.com
 (mail135-5.atl141.mandrillapp.com [198.2.135.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 062bcc52-cdcc-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:22:44 +0100 (CET)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-5.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4YSqrL3NxkzG0CDyJ
 for <xen-devel@lists.xenproject.org>; Wed,  8 Jan 2025 14:22:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 92b24b3a57f545cb8805b8815b935cad; Wed, 08 Jan 2025 14:22:42 +0000
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
X-Inumbo-ID: 062bcc52-cdcc-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736346162; x=1736606662;
	bh=l9aIgygx1SD+0C6R9iRWsOo3b79znwZL6XYccVqWfEI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JvLO8QGeiNr9xSj8t6kedsuZzI9HlFxuk1NVjHmfdVn5etdV+J3lDPSx+IjYA2u3k
	 GFlzICa9b+5CF+6Tne+JfKQf+LP2ceVA4cgaDUgY7rA7T6viXSCszZc/w6DirbulEA
	 NzO0KAHDxntNBctLFlmxkbh4JzZq3CPddyhbdd6eZ7t6nQSktVtYJtMuU0td9JeQHy
	 /h0Lu2oTOuCooBwMrc+I2lxVpmc5BiYdB5VKnYrrDA7ohiB0XPQBP6xCLW07UiVx5m
	 IiTv7oyhmguwFgyqsEvRsd/T2ER5n8AHZ7kseoeSRwi0BCunrzOJEKQKpcB9fObN4e
	 gkT6WffXxW9dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736346162; x=1736606662; i=anthony.perard@vates.tech;
	bh=l9aIgygx1SD+0C6R9iRWsOo3b79znwZL6XYccVqWfEI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GcS1ztowT+ZYK4aaaGdZuT/pJTv13deBe0Tm7oJScLRjkt1SSUNj0hZi1n7Nm5xms
	 k26QRbm3h0fYCLogAR+DWQ1DvonX33IhVvB3Kz96GNGgCSlzsN89/18e0Hbg0Wc/bm
	 GR/TiVnKw8O/UCRj6B4y0sbHrEgd3Y1LW6tuAs1cS2Z/8TpmIdnw1Li7Vb0iiV9NSk
	 VJD0yG+dw+nItQ1gipbEnXaOdNkrZ+kKZstKLO6LE3jMZ+c5SCvFPY6gpjwT9DpPmY
	 A4w8lweZra2ea2h/S/lJXxns45FkzEi1deHP7855x/r0GOHQsK0IaHCHOYBJzfup7D
	 QbxVU9HMdrXnQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.20]=20CI:=20Update=20Fedora=20to=2041?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736346160531
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Michal Orzel" <michal.orzel@amd.com>, "Doug Goldstein" <cardoe@cardoe.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <Z36KL4Sss_QuUQim@l14>
References: <20250108124316.1107121-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250108124316.1107121-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.92b24b3a57f545cb8805b8815b935cad?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250108:md
Date: Wed, 08 Jan 2025 14:22:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Jan 08, 2025 at 12:43:16PM +0000, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

