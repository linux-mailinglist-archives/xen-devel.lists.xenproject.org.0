Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 455FD92EBA5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 17:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757601.1166632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRvhT-0003Q7-Iq; Thu, 11 Jul 2024 15:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757601.1166632; Thu, 11 Jul 2024 15:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRvhT-0003NI-Fv; Thu, 11 Jul 2024 15:27:15 +0000
Received: by outflank-mailman (input) for mailman id 757601;
 Thu, 11 Jul 2024 15:27:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Dqq=OL=bounce.vates.tech=bounce-md_30504962.668ff9ce.v1-79ddfcd060164c05a384959153e4b4a5@srs-se1.protection.inumbo.net>)
 id 1sRvhR-0003GF-Rh
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 15:27:14 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0af715e7-3f9a-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 17:27:12 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WKdrG2BbxzB5p4kV
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 15:27:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 79ddfcd060164c05a384959153e4b4a5; Thu, 11 Jul 2024 15:27:10 +0000
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
X-Inumbo-ID: 0af715e7-3f9a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720711630; x=1720972130;
	bh=QgJYeohbFH8Mh2yaKpGbacs2mEe+CPEMVNcKYwAYhDM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yTP65Jtxp76yuQXAni5lYZls0Uix8bDwcs12izhsA2OxLmDITqrq7/uu+q3UJcNr1
	 Sq95LYZRYgW9+cd/23A7ouVP8aiOB/w5XQw0a/RjQYlRB54lL4oDJLbpi+dRHKf/+j
	 VLYDYm2GKvBY4uuI/U1ggWpxiGQPYlvRDc+tWOloJ6MIliPRl9ZTCxXso1aIGCORgf
	 VTl7QFWM5BmQt1q7ky0+1zhVc+vW6dwSpX6zhlQkHaBjKxOOj9pLO9jvVXz1lyuWIc
	 9L9k3nHZtQ6MphsUmFB0O30ppW8h8MAr+Cqp6GGOoeM1cjKooyfKCIpefmVs+vQ2RO
	 BMtbnNS10X3EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720711630; x=1720972130; i=anthony.perard@vates.tech;
	bh=QgJYeohbFH8Mh2yaKpGbacs2mEe+CPEMVNcKYwAYhDM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Qzi46XL/NP40kIVfiyc0ocdmsC2X2RRtCMal79tO4ZZnNb8lRJ25Vs3JTyOIvQNba
	 heps+Qy7DGNZ3+n4j2kBgovru2xFFMIkoeim3p0K0K0O4l6LogNzqBQDEgUEI4Wfhd
	 2+HtV1qO2JrxCQedwukSaDmnQU/Az5hATuuQYl86oVKOKWnVDdK2aq9roCFK6eg6YO
	 j2dRMYPtMcedkkPIOh+cwia0agzfmDZ4yry+cAhuYvj8xE8q6NlBPDxsWLy+DhxoX1
	 5YGfd0ZSqkhaVgxoaq95ivvlOcIPzqYzoZTpHEtWEvcNzdMN48LSjCCQ/4dLVeyX5v
	 2AluaKZJbel7A==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2003/12]=20CI:=20Drop=20Debian=20Jessie=20dockerfiles?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720711629055
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <Zo/5zIUfanul1DLj@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-4-andrew.cooper3@citrix.com>
In-Reply-To: <20240711111517.3064810-4-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.79ddfcd060164c05a384959153e4b4a5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 15:27:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 12:15:08PM +0100, Andrew Cooper wrote:
> These were removed from testing in Xen 4.18.
> 
> Fixes: 3817e3c1b4b8 ("automation: Remove testing on Debian Jessie")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

