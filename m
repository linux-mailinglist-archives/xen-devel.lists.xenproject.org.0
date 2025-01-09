Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10172A07C94
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:54:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868912.1280424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuqz-0006f4-Gs; Thu, 09 Jan 2025 15:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868912.1280424; Thu, 09 Jan 2025 15:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuqz-0006db-Ds; Thu, 09 Jan 2025 15:53:49 +0000
Received: by outflank-mailman (input) for mailman id 868912;
 Thu, 09 Jan 2025 15:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iU6M=UB=bounce.vates.tech=bounce-md_30504962.677ff108.v1-93678dbcbe8647bc8544e19a5cbd3011@srs-se1.protection.inumbo.net>)
 id 1tVuqx-0006dV-IO
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:53:47 +0000
Received: from mail178-22.suw51.mandrillapp.com
 (mail178-22.suw51.mandrillapp.com [198.2.178.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e850b115-cea1-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 16:53:46 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-22.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YTTpw5w2qzGlspL3
 for <xen-devel@lists.xenproject.org>; Thu,  9 Jan 2025 15:53:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 93678dbcbe8647bc8544e19a5cbd3011; Thu, 09 Jan 2025 15:53:44 +0000
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
X-Inumbo-ID: e850b115-cea1-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736438024; x=1736698524;
	bh=aaXGWiKEjgxDs6iETcyvBhyR1zK3Bd5uz77TWnzIS/4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=W7kmsZe6y21O3Dh+4kPRm3bRBu4KDb4PUJCd+HUrbYBz+T8XAKwsdQbhaQzllMSQX
	 19WJBSJh3dL5qqFbjDX11Lsa92xFt3PDzJ+seXQIF1mvI3mr3GZq5TbZWIivah67Wi
	 nHyhXPqfbdOoud4FS8aMENai3XN6d8FAh7ULdwh2T5NT8PuP+lWwNh1HrfCzLaG5Ae
	 ZeppZIb6apvjUuo2CXnc1DNkkvDEfmOhkwpfEwBZ2CWMooOIGsQl4Bn4y+KroaOWGE
	 IxRdHl0aevXBaaScibI+sIsxVXxyu4ErcrZr+3N1/f3ggjFj4JXh/0bPtWjzwdvXxn
	 iP3vJMMiTdHrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736438024; x=1736698524; i=anthony.perard@vates.tech;
	bh=aaXGWiKEjgxDs6iETcyvBhyR1zK3Bd5uz77TWnzIS/4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Sib1P7WK9hfHPhKr92NRlCbmRWIVsce96EZJQsZYxJWcba0zBqTdMg9sZ1MO2kwdq
	 HaYE86FVTCcAnEI36u2Y/QcEa0TzKFWFPFPyT7Gxlpvv/SH7/zT71eqIsoVqH4sWiU
	 PKpiu3C12nR0zhW6j7ApSWN+lcrBPsRKOZfm+ZrZC2cptfLjCq7e9+MxgffIj/XbvX
	 Rs1idyijlgdG5Bby29yNrXZYgtOrlyiYE6ZV0BS+5s89uU6XBiKbQLo0C3UV0Ahz6G
	 g+fiwqzJEWGNEZH7/EzwzfW+EChUn+jTcL3Jnv4An4r7jhWtZFXO0Wm6xKB+CQRp8i
	 FOoXZ4vPvIlpQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/2]=20Config.mk:=20Pin=20QEMU=5FUPSTREAM=5FREVISION?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736438023339
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Message-Id: <Z3_xBjLGs5OJ5neR@l14>
References: <20250109153921.43610-1-andrew.cooper3@citrix.com> <20250109153921.43610-2-andrew.cooper3@citrix.com>
In-Reply-To: <20250109153921.43610-2-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.93678dbcbe8647bc8544e19a5cbd3011?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250109:md
Date: Thu, 09 Jan 2025 15:53:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jan 09, 2025 at 03:39:20PM +0000, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

