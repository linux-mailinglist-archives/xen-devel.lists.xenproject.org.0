Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9153D9A2A03
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820819.1234432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Ttn-0005pc-88; Thu, 17 Oct 2024 17:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820819.1234432; Thu, 17 Oct 2024 17:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Ttn-0005nv-4i; Thu, 17 Oct 2024 17:02:55 +0000
Received: by outflank-mailman (input) for mailman id 820819;
 Thu, 17 Oct 2024 17:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0C1g=RN=bounce.vates.tech=bounce-md_30504962.67114339.v1-36c0712005714e83bc891fbb4b76035d@srs-se1.protection.inumbo.net>)
 id 1t1Ttm-0005np-EE
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:02:54 +0000
Received: from mail186-28.suw21.mandrillapp.com
 (mail186-28.suw21.mandrillapp.com [198.2.186.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a45b3c37-8ca9-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:02:52 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-28.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4XTvKP4SRGzMQxdJX
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 17:02:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 36c0712005714e83bc891fbb4b76035d; Thu, 17 Oct 2024 17:02:49 +0000
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
X-Inumbo-ID: a45b3c37-8ca9-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1729184569; x=1729445069;
	bh=RuKXeiTwVLED9q8JXfpU9iyhN9lwitkaLd9n5bwKn5Q=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VdH3QFdi38fNtiDyHI0MX6NUTrezUGartAPiD2aEt/16UfQEVELiZgx8pAEoL72F5
	 wUDqvPs8OFw3pg4UySkYbP9rlwS4pGKtf7zI3/AuGrkHhbvmX+0Tctit7QESAcybd5
	 EJpmYmJz5xnHtHe3s4E+rONFTfcz/oUnzDldeL+diQJEHp531iDmolB3CyJE4eRpOV
	 6uvG7q+R1PM4oEVkVPU5R2ltoVjClspmL1Ek2ZCUoGuYnx7IycivgItCVXYOMbFGzC
	 f9bVb+YreClHaGa8WsdP3MYoV+m7ybd2T6H1jFax59pk4BPPm/dMblnVDdVTZMY2BB
	 2R2kJsX7nYLnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1729184569; x=1729445069; i=anthony.perard@vates.tech;
	bh=RuKXeiTwVLED9q8JXfpU9iyhN9lwitkaLd9n5bwKn5Q=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YSlsOHzcKPSrjvbUGRV68wA79xEVA3fham6R0PfZXwG0glLFrTurY0M1RkH2fIiid
	 +mWZZ5pjJgsZwMtZRClHcr0qo5qbAYa/i17BcYrWknCSfV9wNZqqpKH+hrV026CtnD
	 OOCgAXM8/sia0SZ18D2QAaGb/8TuonLwpQf80qjiiHwj/fNVqZFQkZilcXLsCgPvFr
	 U1lYyNbWqG/jUwyQn5hwlbXodbXrbkZLj6RsqQ1KGj/aJ0fDeK48N/cctsjk2FRTBR
	 IdUGoa3v8lq7Wol7yoQ+J38DrZXDrbQIowWieXhftzk+IGRu3myPbEeg90FHjsA0yJ
	 lbeS1oDDvksDA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v1=201/3]=20automation:=20Fix=20URL=20to=20the=20gitlab=20container=20registry=20documentation?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1729184568275
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <ZxFDN0rRfsg0iNBj@l14>
References: <cover.1729170005.git.javi.merino@cloud.com> <5ebb776792a345724b43b0843aa41c21febcc843.1729170005.git.javi.merino@cloud.com>
In-Reply-To: <5ebb776792a345724b43b0843aa41c21febcc843.1729170005.git.javi.merino@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.36c0712005714e83bc891fbb4b76035d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241017:md
Date: Thu, 17 Oct 2024 17:02:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Oct 17, 2024 at 05:20:19PM +0100, Javi Merino wrote:
> The gitlab documentation is now at
> https://docs.gitlab.com/ee/administration/packages/container_registry.html

This link seems to be for self-managed instance of gitlab, but the link
in the patch looks fine.

> Signed-off-by: Javi Merino <javi.merino@cloud.com>

The patch description could be removed, so:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

> ---
>  automation/build/README.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/build/README.md b/automation/build/README.md
> index bd0c0e041804..ecc898680c91 100644
> --- a/automation/build/README.md
> +++ b/automation/build/README.md
> @@ -110,7 +110,7 @@ make -C automation/build opensuse/tumbleweed-x86_64 PUSH=1
>  
>  [BuildKit]: https://docs.docker.com/build/buildkit/
>  [registry]: https://gitlab.com/xen-project/xen/container_registry
> -[registry help]: https://gitlab.com/help/user/project/container_registry
> +[registry help]: https://docs.gitlab.com/ee/user/packages/container_registry/
>  
>  
>  Building/Running container for a different architecture

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

