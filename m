Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8379F53DC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 18:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859741.1271851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNbRq-00049F-G1; Tue, 17 Dec 2024 17:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859741.1271851; Tue, 17 Dec 2024 17:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNbRq-00047g-Bs; Tue, 17 Dec 2024 17:33:30 +0000
Received: by outflank-mailman (input) for mailman id 859741;
 Tue, 17 Dec 2024 17:33:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t3Bs=TK=bounce.vates.tech=bounce-md_30504962.6761b5e4.v1-9ec811cf02754aa29e21200cfff0775a@srs-se1.protection.inumbo.net>)
 id 1tNbRo-0003r3-FF
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 17:33:28 +0000
Received: from mail179-16.suw41.mandrillapp.com
 (mail179-16.suw41.mandrillapp.com [198.2.179.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 051caf4f-bc9d-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 18:33:26 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-16.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4YCP6X5Q7bzB5qYdJ
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 17:33:24 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9ec811cf02754aa29e21200cfff0775a; Tue, 17 Dec 2024 17:33:24 +0000
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
X-Inumbo-ID: 051caf4f-bc9d-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1734456804; x=1734717304;
	bh=h3ZT4OBhKIwyNI1UGD/oAXQV03lWDod1gteYPImIABU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ml2UbnncDqrMFuDSjgo+nPPwCm4NlsByxV/apRZ5vsiJSDqDDbsAh+/F8UqB5Ds6c
	 mcaF4TLTfhSPoXT9OCuK1h4E6K584dj9h/FhTGN/qAVtM7WeY2RCFBIKEyPQrC7Gj+
	 YPWsomK7DllcYir0iUbXNJZoLKTczMnpJ+10LRazP6vFy/iq0TuQI6Nkj5qoczpQFM
	 HWkdE98kuJLtLipFHFhy8UP1Uqa+jOUTOTLXeJpU7jICI93Ae0RrFbL7Dra34Ne22S
	 P8PVo+AusQSqQN1/gqfi/xgTC3AZODc2p/7erZDlJYFqLmr3RmfKlG11PEbRwR+DxC
	 lixEKwrFPcdfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1734456804; x=1734717304; i=anthony.perard@vates.tech;
	bh=h3ZT4OBhKIwyNI1UGD/oAXQV03lWDod1gteYPImIABU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xA5hBLA4Qe5AvroZgyAwNcEcYWcma4hBSbgt2Dg4aqYV0euAQ8ao55QdIXeHhoL9A
	 No3KD21UCMzfyFIFfFfveK32adqBKahjfAleQdN8+J+0+DlWA8FlTQ8bmpxtGRYGwJ
	 cz6sm4U1+YiUiVDw7rsF463HeTOqs4EUzXPvB60kwVBM/FXP0g22C4hXfupLN7/jv2
	 /TrwuU9fHlJWYRAN7ya2Og11DHuzXKjTvtmvDevacDt3IzFvbwPyOm28dXA5zOd7jP
	 SJHhCesQBC8GYav1dhITvzv++5cATDm2e+GY7PlnOGei0eekaqx1KuefCce/8GANdR
	 lOSYU4l2FUSQg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5=205/5]=20tools/xenstored:=20use=20new=20stable=20interface=20instead=20of=20libxenctrl?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1734456803986
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Samuel Thibault" <samuel.thibault@ens-lyon.org>, "Julien Grall" <julien@xen.org>
Message-Id: <Z2G14bDyV_Dn06YP@l14>
References: <20241217142218.24129-1-jgross@suse.com> <20241217142218.24129-6-jgross@suse.com>
In-Reply-To: <20241217142218.24129-6-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9ec811cf02754aa29e21200cfff0775a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241217:md
Date: Tue, 17 Dec 2024 17:33:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Dec 17, 2024 at 03:22:18PM +0100, Juergen Gross wrote:
> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index 64c8fd0cc3..a6506a5bb2 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -1258,15 +1248,9 @@ void domain_early_init(void)
>  	if (!domhash)
>  		barf_perror("Failed to allocate domain hashtable");
>  
> -	xc_handle = talloc(talloc_autofree_context(), xc_interface*);
> -	if (!xc_handle)
> -		barf_perror("Failed to allocate domain handle");
> -
> -	*xc_handle = xc_interface_open(0,0,0);
> -	if (!*xc_handle)
> -		barf_perror("Failed to open connection to hypervisor");
> -
> -	talloc_set_destructor(xc_handle, close_xc_handle);
> +	xm_handle = xenmanage_open(NULL, 0);
> +	if (!xm_handle)
> +		barf_perror("Failed to open connection to libxenmanage");
>  
>  	xgt_handle = talloc(talloc_autofree_context(), xengnttab_handle*);
>  	if (!xgt_handle)
> @@ -1306,6 +1290,8 @@ void domain_deinit(void)
>  {
>  	if (virq_port)
>  		xenevtchn_unbind(xce_handle, virq_port);
> +
> +	xenmanage_close(xm_handle);

Is this the rigth place to free `xm_handle`? domain_deinit() seems to
only be called by the live update code. All the other initialisation
done in domain_early_init() are free via talloc_autofree() it seems,
which is called by atexit().

So, shouldn't `xm_handle` by handle with talloc like the others?

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

