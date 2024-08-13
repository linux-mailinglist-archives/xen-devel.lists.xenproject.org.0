Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6E4950AF6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 19:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776467.1186621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdutT-0004ap-6I; Tue, 13 Aug 2024 17:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776467.1186621; Tue, 13 Aug 2024 17:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdutT-0004Y0-3A; Tue, 13 Aug 2024 17:01:11 +0000
Received: by outflank-mailman (input) for mailman id 776467;
 Tue, 13 Aug 2024 17:01:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NddN=PM=bounce.vates.tech=bounce-md_30504962.66bb9150.v1-9dc6e5e91a9343d197bad6794c309536@srs-se1.protection.inumbo.net>)
 id 1sdutR-0004Xu-Qy
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 17:01:09 +0000
Received: from mail135-25.atl141.mandrillapp.com
 (mail135-25.atl141.mandrillapp.com [198.2.135.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a07d4101-5995-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 19:01:05 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-25.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WjyMN54FSz4f3k4w
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 17:01:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9dc6e5e91a9343d197bad6794c309536; Tue, 13 Aug 2024 17:01:04 +0000
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
X-Inumbo-ID: a07d4101-5995-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1723568464; x=1723828964;
	bh=8msjE1uYcHOgMsjwb0WcL/eRD1wMP1aYn+7I4QHETYU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GNRiVkOkDXXmC7/s2JTHlnQP07zCbLYLKmdI97mseU66NLBtiR7f38Xon3Iu5Zn0/
	 ryml44wq9VhsJtlZegnA4X9jVKMqMqqHCis1MFyYDdJqNTFhwqNF97kpGILNpYlUps
	 1ws+gpwLG7D+aISYqdyZvfTvui63vx5RcgzZZVQ8pv2AGXtpgC8G9wFDajPAYVbvnf
	 rDIIo2KHfNfQBjszN+pZfw1CUu7Movfo4qzEDPXnliYyVNexRx5TKY6DCsvb2T7zgK
	 VR1zwqFfantlYtBzCpgsn6wB9lEJuGV+Us4SDSYwzOQl3zt5u1+ou9QUxxLxo23Vir
	 dMasFzZiv4Qrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1723568464; x=1723828964; i=anthony.perard@vates.tech;
	bh=8msjE1uYcHOgMsjwb0WcL/eRD1wMP1aYn+7I4QHETYU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0Ca/ft5ezmuZwVfELgsrwKGLTF+Y//aavkIka/B4fY19RY4Zsf6cnY7EuG/N+uJws
	 bvyKoKAmGzhJU/5D3j7RWFmRdllZEw9LI5IBpZ6B/1zT4sNm+LikwdjADbeem01X4k
	 GiTc9B442DB+nFa2eWWzX016rZhxBQYFV0G+Ym4Jqr0LIavTEpefhrZbzhv3TACqHL
	 Wk5HDCMUy98460H5gRTZPQ+zIUqjLEzbM2/866k1W4MBUN51KzAV29jvrXMFXDOyg/
	 VB400Cf+8SBG1uLMhQms9sh6YiDqe+co+8pIKVcVxeb2Zl7UOnXavxU0tCP7muKEKr
	 0ag7NqxZkUOoA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20Fixed=20incorrect=20output=20in=20xl's=20"help"=20command.?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1723568463876
To: Juergen Gross <jgross@suse.com>
Cc: "John E. Krokes" <mag@netherworld.org>, xen-devel@lists.xenproject.org
Message-Id: <ZruRTzGtNxxvRPq2@l14>
References: <20240805141159.21872-1-mag@netherworld.org> <9988e590-e992-4d3e-b77b-5bde8c80d1cf@suse.com>
In-Reply-To: <9988e590-e992-4d3e-b77b-5bde8c80d1cf@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9dc6e5e91a9343d197bad6794c309536?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240813:md
Date: Tue, 13 Aug 2024 17:01:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Aug 05, 2024 at 04:14:34PM +0200, Juergen Gross wrote:
> On 05.08.24 16:11, John E. Krokes wrote:
> > In "xl help", the output includes this line:
> > 
> >   vsnd-list           List virtual display devices for a domain
> > 
> > This should obviously say "sound devices" instead of "display devices".
> > 
> > Signed-off-by: John E. Krokes <mag@netherworld.org>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

