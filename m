Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5CA91DF45
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 14:30:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751543.1159530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOGA6-0007DJ-EL; Mon, 01 Jul 2024 12:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751543.1159530; Mon, 01 Jul 2024 12:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOGA6-0007Be-Ap; Mon, 01 Jul 2024 12:29:38 +0000
Received: by outflank-mailman (input) for mailman id 751543;
 Mon, 01 Jul 2024 12:29:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Zhz=OB=bounce.vates.tech=bounce-md_30504962.6682a12c.v1-67ff1999aabb4b26b70ba007a130aac8@srs-se1.protection.inumbo.net>)
 id 1sOGA4-0007BY-6N
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 12:29:36 +0000
Received: from mail137-26.atl71.mandrillapp.com
 (mail137-26.atl71.mandrillapp.com [198.2.137.26])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9245d9c1-37a5-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 14:29:34 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-26.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4WCQMw1k4WzJKFKVg
 for <xen-devel@lists.xenproject.org>; Mon,  1 Jul 2024 12:29:32 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 67ff1999aabb4b26b70ba007a130aac8; Mon, 01 Jul 2024 12:29:32 +0000
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
X-Inumbo-ID: 9245d9c1-37a5-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719836972; x=1720097472;
	bh=OT8ctyaM66k0G56mqx0roUr+TADRdL10IAfJSELRmic=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=j9tN7X+PRjM5V4R5HtaQWQ9dkAuXlOb1jeMKh+Afl3163TzjWv5cvAIXSXJjXamBg
	 jIaI7/SJa/gHmrVdA8TDPVcXZLmn9+QdYF2aKLrpCVPe6PAs+//32x5n/z69m7uzpt
	 2icy4U4oaYNMFajkqwpk/UNUiflJxjqdgK3CziPIRCpUO2wKJefse6UU3+6ohqHoeu
	 Veix3U1vPB4DwN8ob21N2iyd+A0s1wbIuozctppLyXIa5d0Xy7HvyIxsthu43asQup
	 yGJuJmmTbE/asd3cwyo8ab6xMOONmy1E8TULklkIqj78LHIQ1ev1L3g+VA97gcRYeq
	 IQF7qfiMiJ8Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719836972; x=1720097472; i=anthony.perard@vates.tech;
	bh=OT8ctyaM66k0G56mqx0roUr+TADRdL10IAfJSELRmic=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GK05kfPdFZPZDaxWtviLU6J/4+7zfEN94aDN1sZtoDeri3CqxEFfJbNX/6QaXoWTh
	 IrpQPAC2mk1kFOd0anZn2R1JQ41oNFHp7rofgilLrzeTgpvwlqdhD6ZpH61hoW1hoH
	 eRxID1MM8OLDVdb0qt4AD5R79JBqHhzVXGHOc9jQRQUPeT2Q5LiVOuIKeMfebIxvJV
	 fxJtgob9mXoVyy9J0KtvBYHAPH6KFqB5RTO5FORIfX/1Zohlwpc2haOoFOJZ1sg/0w
	 JdnDqnbxVWYb09pNM2yX3V4VJ34MrgSyiwsLRXp9pN3ne/WGYtx1pQITVFWr66a8oc
	 P1IOeup5smCXg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v8=2006/13]=20tools:=20add=20support=20for=20cache=20coloring=20configuration?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719836971740
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, Juergen Gross <jgross@suse.com>, Marco Solieri <marco.solieri@minervasys.tech>
Message-Id: <ZoKhK5uIk9P5XpcZ@l14>
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech> <20240502165533.319988-7-carlo.nonato@minervasys.tech>
In-Reply-To: <20240502165533.319988-7-carlo.nonato@minervasys.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.67ff1999aabb4b26b70ba007a130aac8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240701:md
Date: Mon, 01 Jul 2024 12:29:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, May 02, 2024 at 06:55:26PM +0200, Carlo Nonato wrote:
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 41252ec553..ff80625bd6 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -726,6 +726,19 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>              /* A new domain now exists */
>              *domid = local_domid;
>  
> +            ret = xc_domain_set_llc_colors(ctx->xch, local_domid,
> +                                           b_info->llc_colors,
> +                                           b_info->num_llc_colors);
> +            if (ret < 0 && errno == EOPNOTSUPP) {
> +                if (b_info->num_llc_colors > 0)
> +                    LOGED(WARN, local_domid,
> +                          "LLC coloring not enabled in the hypervisor");

Why is this only a "warning"?

> +            } else if (ret < 0) {
> +                LOGED(ERROR, local_domid, "LLC colors allocation failed");
> +                rc = ERROR_FAIL;
> +                goto out;
> +            }
> +
>              rc = libxl__is_domid_recent(gc, local_domid, &recent);
>              if (rc)
>                  goto out;

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

