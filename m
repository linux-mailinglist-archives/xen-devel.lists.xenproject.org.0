Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF1D904E2E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 10:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738963.1145839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJOq-0007Ob-JR; Wed, 12 Jun 2024 08:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738963.1145839; Wed, 12 Jun 2024 08:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJOq-0007M0-Fh; Wed, 12 Jun 2024 08:32:08 +0000
Received: by outflank-mailman (input) for mailman id 738963;
 Wed, 12 Jun 2024 08:32:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIwU=NO=bounce.vates.tech=bounce-md_30504962.66695cfe.v1-064d15fccc2f44c2a0ae4ace68583eb4@srs-se1.protection.inumbo.net>)
 id 1sHJOo-0007Lu-Rl
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 08:32:06 +0000
Received: from mail180-20.suw31.mandrillapp.com
 (mail180-20.suw31.mandrillapp.com [198.2.180.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f96030e-2896-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 10:32:06 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-20.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4Vzf0h2FRnzFCWZ7Y
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 08:32:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 064d15fccc2f44c2a0ae4ace68583eb4; Wed, 12 Jun 2024 08:31:58 +0000
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
X-Inumbo-ID: 3f96030e-2896-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718181124; x=1718441624;
	bh=1jBDSWnswaV80WNWJr1M+dh0MUU46rLIQXch3TjMFfs=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=A3kBiTkesPL8EXf6KhMcht0/7Kfiu3atvcCE5bQfHYbWXXFh/3ti38/3v9CD+zKbf
	 837H7l/+NDot/y9B5rRGBJvqAoGf5Djl4ugGZ89zCwUutt3MiN0hrtGB3gwMBBWMTH
	 tCYICCQiu115WH+pAtRwbqqITsqUvrg4ey0CGQW/9ae7tKnPBS+u3xXA8pu9ndEnbZ
	 AddvCFTX/1441hA07YxjiRLDTugR1sAivMSxF4TRCDaZUL7BqxrkPfLQAE1dM9vbNx
	 TUAy70/m5FV8LR9MxeoVfDALJkQyxyoyXojjeZO3TP0vFciI+pvunFkuru+Rz2qhsI
	 x17ZewPyRErcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718181124; x=1718441624; i=anthony.perard@vates.tech;
	bh=1jBDSWnswaV80WNWJr1M+dh0MUU46rLIQXch3TjMFfs=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XtbasWmKYevWo8uDVdPxP+FeONkyx9Sdo38eovxWK6vWnB2NT2/vdhZuiSCeMTa/s
	 p3CGM60BsRnJRq0J6hifHrwK20MmEpnefce2v1hEFGa0tofxW52DlVmU2QidiDOysu
	 oWnE3gFWxaaD+CESFgzrVvWfWztTvfnPHJL3s6YqoTHvt86RvVaoHtjfbD78uXfHJK
	 vSiDtg9AsOFEpS2L3ityZX+LVxn0UFUHgD9ogse0yqTiUPQr+NzvBSbnu+wq4LwC8s
	 V/8Jyy1sfJtcollZnCDdh136vdyEDxK/FHb15w+Z8zPhbBilDtzIHA0+P6jdegCCSc
	 0q0cy2ZGurXUQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.19=3F=20v6=207/9]=20tools/libxl:=20Activate=20the=20altp2m=5Fcount=20feature?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718181117933
To: =?utf-8?Q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Message-Id: <Zmlc/e2cfak0n2f0@l14>
References: <cover.1718038855.git.w1benny@gmail.com> <ad7aa98a3b0a0493130f1d9a84724e98be766897.1718038855.git.w1benny@gmail.com>
In-Reply-To: <ad7aa98a3b0a0493130f1d9a84724e98be766897.1718038855.git.w1benny@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.064d15fccc2f44c2a0ae4ace68583eb4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240612:md
Date: Wed, 12 Jun 2024 08:31:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 05:10:45PM +0000, Petr Bene=C5=A1 wrote:
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
> 
> This commit activates the previously introduced altp2m_count parameter,
> establishing the connection between libxl and Xen.
> 
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


