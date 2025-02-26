Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B2A465A9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 16:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896890.1305636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJkf-0008Pz-Fq; Wed, 26 Feb 2025 15:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896890.1305636; Wed, 26 Feb 2025 15:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJkf-0008NY-D2; Wed, 26 Feb 2025 15:55:13 +0000
Received: by outflank-mailman (input) for mailman id 896890;
 Wed, 26 Feb 2025 15:55:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MdgR=VR=bounce.vates.tech=bounce-md_30504962.67bf395c.v1-24bee47b70a94366994fb199b878ed36@srs-se1.protection.inumbo.net>)
 id 1tnJkd-0008NS-Un
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 15:55:12 +0000
Received: from mail179-45.suw41.mandrillapp.com
 (mail179-45.suw41.mandrillapp.com [198.2.179.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e552b55-f45a-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 16:55:10 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-45.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4Z2zZP09SfzNCdXbL
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 15:55:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 24bee47b70a94366994fb199b878ed36; Wed, 26 Feb 2025 15:55:08 +0000
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
X-Inumbo-ID: 0e552b55-f45a-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1740585309; x=1740855309;
	bh=+xpkdY8kVACeQiEm3mG5/qr1CoUCZFZRBkCgHCmGyVc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=medrktEKMJ9vtU7U7PaXG3/w0x0d8TLL7c2xkrzWfv9ZUHejPC2efspcn3t7DEZAz
	 Jcg4j+eVm6IHUUZd1o5yFXq6d+HLqo5tvInZXe0M+0DT7tJDTGkQr0LYTGM3SF2Wwp
	 KW4wXkmdi6BDlQRI+ItWpkzWsSOJqSMi322AQdKttjuEWdlxtQitPCOaqE2jMp/UPt
	 IwBsjaQQypfeatwXx+zmlWYYUHyQGaJZZBldcDqa6OMIe4VJxBUcmRzyX0WRWHH+88
	 3GMfMyEC6npGkWOhLCHoreWw5sYB9DgFp0GRkO94Ykdi59tETPc53eb568nYdRvWax
	 DWugZm9BBDrtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1740585309; x=1740845809; i=anthony.perard@vates.tech;
	bh=+xpkdY8kVACeQiEm3mG5/qr1CoUCZFZRBkCgHCmGyVc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YQV9lUqzx4kkxD2s7yunWaTl/nHi+bmG8wojyS2cVF0I4wEUVWfwXivi7MR9CeS+1
	 ZGiJaJyC1qUkY7tpxhmLA7GiMOA5XRf8OYVqkiMxBC7/J5RE8kyQuzjFLpXBL08J5i
	 vSlZ3KSDx5+8RUYaYUuUcBm0iKZIQ+85W4epbzr8ecdGKjU7XmkmUEegSzgvTeXfAC
	 AwtG+XSvHumqHzNkL4ISjpmoqCTjZfzCwe8ynnXNIs8tLnddq9vsWZv7gw+lo1zwrL
	 2XJHwh83vG75Q5BrnhCTGKdxzn6jXggcVKw2sSs6iQnksXm8+4DKEgiTt0enpQ5KqL
	 BOJb/2mBCh4lQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20tools/xl:=20fix=20channel=20configuration=20setting?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1740585308372
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <Z785WyG39EGCRM1y@l14>
References: <20250225073033.20972-1-jgross@suse.com>
In-Reply-To: <20250225073033.20972-1-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.24bee47b70a94366994fb199b878ed36?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250226:md
Date: Wed, 26 Feb 2025 15:55:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Feb 25, 2025 at 08:30:33AM +0100, Juergen Gross wrote:
> Channels work differently than other device types: their devid should
> be -1 initially in order to distinguish them from the primary console
> which has the devid of 0.
> 
> So when parsing the channel configuration, use
> ARRAY_EXTEND_INIT_NODEVID() in order to avoid overwriting the devid
> set by libxl_device_channel_init().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

This might want a:
    Fixes: 3a6679634766 ("libxl: set channel devid when not provided by application")

Before that, the devid set by `xl` was probably ignored. I think before,
the console devid would be taken from libxl__init_console_from_channel()
parametters, so the first devnum would be `0+1`, so never 0.

Do you agree?

In anycase:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

