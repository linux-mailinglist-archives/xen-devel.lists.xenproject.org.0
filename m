Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1899D92FE8F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758224.1167613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ8u-0005q8-2Q; Fri, 12 Jul 2024 16:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758224.1167613; Fri, 12 Jul 2024 16:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ8t-0005oN-Vv; Fri, 12 Jul 2024 16:29:07 +0000
Received: by outflank-mailman (input) for mailman id 758224;
 Fri, 12 Jul 2024 16:29:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sC2F=OM=bounce.vates.tech=bounce-md_30504962.669159ce.v1-a6693b26e05f4ee09beeb3d29e2b7f24@srs-se1.protection.inumbo.net>)
 id 1sSJ8s-0005oH-IT
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:29:06 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9f4845f-406b-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 18:29:04 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WLH9B5cxYz6CQMYB
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 16:29:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a6693b26e05f4ee09beeb3d29e2b7f24; Fri, 12 Jul 2024 16:29:02 +0000
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
X-Inumbo-ID: d9f4845f-406b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720801742; x=1721062242;
	bh=1rVGXqJHOyhrSpxal1tJKvVF6QyHwGarvDtXEHrLXgo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NJahI3LOwl8VbXGrfOdXd1r6YvDqkEvu8O137L5Qow+J1sQpPVCefLhfKjetN8aVx
	 ZwcMgMGCigwFgi/wsKdiQfQ7BFTdGO5E9T+DLQdLZxqRZI97OP40DlEbAyi/Y9CEhg
	 944hMIcDajxV9uQTmsvufpM0LJZoNhUvRg+2Z7aPZnwHoChaecA8kLzKxFxCxeUkB9
	 CVH02cS9dBFlsta+5TQXETOUFC1Iy6Jljc7fdSWOhvWC+zopFoPHALPs2+REOzdpcQ
	 3KjqwWwvASOk+YO+xrJ9ajsbGJBjiwek0TnKGDlHG4sD2y8DM6ABvLPHrCHHREwnwP
	 SZVp7fpFnJE2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720801742; x=1721062242; i=anthony.perard@vates.tech;
	bh=1rVGXqJHOyhrSpxal1tJKvVF6QyHwGarvDtXEHrLXgo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=068kYU8S8do2M8lmehRfHGSYRj+UQnGTDWYLs/tueAkSkGc1EhT6MXgilreo3F9t5
	 KDy+tNqHmmRPaiDZ7ggnNNCgf5oA2NhK2pKraDRplkxk7Ca3yNpCiRCgUtS0Km9FIG
	 MvU0V875NM+YWDdn0OlpgG6jaBJVIIn/7u/V8IhFso59+FKV5MPlGVMn90DBGuqjdj
	 3VIKcjThEAwwuR0rFvIrVLoJNjCgAowN8+bCLQ47Tp15onBN6xMIRukFAk4f+auey0
	 SxUAlvo7ggY4P88HkYsjoLDSP+agSUzKPT/cVBVSBbKf7/Jllg8v1dH4XLeRRl0kbf
	 LBJNQ2aEYftVA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2017/12]=20CI:=20Refresh=20Ubuntu=20Focal=20container=20as=2020.04-x86=5F64?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720801741557
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <ZpFZzDVDDUZWjOEh@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240712104855.3237883-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240712104855.3237883-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a6693b26e05f4ee09beeb3d29e2b7f24?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240712:md
Date: Fri, 12 Jul 2024 16:29:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jul 12, 2024 at 11:48:55AM +0100, Andrew Cooper wrote:
> Exactly as per 18.04 (Bionic).  This saves ~500M:
> 
>   registry.gitlab.com/xen-project/xen/ubuntu    20.04-x86_64           1.06GB
>   registry.gitlab.com/xen-project/xen/ubuntu    focal                  1.57GB
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

