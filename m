Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543009072D3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 14:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739946.1146911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHjv6-0002Yn-Gu; Thu, 13 Jun 2024 12:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739946.1146911; Thu, 13 Jun 2024 12:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHjv6-0002Wy-Do; Thu, 13 Jun 2024 12:51:12 +0000
Received: by outflank-mailman (input) for mailman id 739946;
 Thu, 13 Jun 2024 12:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sySU=NP=bounce.vates.tech=bounce-md_30504962.666aeb39.v1-c2b85fac760e4aaf95af6a4eaa84fc63@srs-se1.protection.inumbo.net>)
 id 1sHjv5-0002Wp-Np
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 12:51:11 +0000
Received: from mail187-11.suw11.mandrillapp.com
 (mail187-11.suw11.mandrillapp.com [198.2.187.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99c18921-2983-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 14:51:07 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-11.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4W0Mj537XGzLfMRBF
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 12:51:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c2b85fac760e4aaf95af6a4eaa84fc63; Thu, 13 Jun 2024 12:51:05 +0000
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
X-Inumbo-ID: 99c18921-2983-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718283065; x=1718543565;
	bh=H4iqKVTD7LURL26EcQvbtrjH8XxZS+TosojtxE4Ee48=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=c08wS/AKcz57wazOW4VwyD1EncMNtY8sgZOsJqRbVDore7HbhEyB57ZEFllCiwjyf
	 8pn9XGXZLMnvBJlbJK7CKPwawMqEEMUQi7UFkrCwAHVhnhWqN7uvSb6dtuGk3G6jb/
	 afnX9g/Behp9Hd9Ndmu6fg9zn4dEsTm03WgiD5Niupynsiw65hMFhdfZyiHtxRPkor
	 0UbQowr8j7/a/5yTG31pEZhcE9OI2NYb4fiyZ+KwFXAviK/kUbE/WNhe7VDLGrg4k1
	 9V1MMXY7kRDDbafeePHBRsQn85kHybT7Yf7qYHIerxwEbUzqI2SnglJLuz5ELbyxzq
	 rWWisp75PW/AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718283065; x=1718543565; i=anthony.perard@vates.tech;
	bh=H4iqKVTD7LURL26EcQvbtrjH8XxZS+TosojtxE4Ee48=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RhXGyfq95LXceV67VjE3+2f+QTWRJokQf3eow1su+AZajJd7OsW2NdlFSII+c6ytz
	 PVFhsaiOIE+TyMiLlaOGGMK4MuGZ0IaBAJ1DwcXbz8sY6M93deivd2q2au9WaoSoqM
	 TFGDrmjGsE1c2Fx4UXNuzv75h5z38mo0l4z79OKDhpjbq5+UEt3MOxJueclDUvDLlb
	 LsyZqM8Z+yaD5CN/fCDJ95anDG3gyBQpkJiwKCJgCaDGrzR9sBtn6KTN0W3NcqmE6I
	 oAzkmIihS2fbIkCjXHG7log23VZuLOJ1K7XnXAPWwdkwduQrXYqmzIrQDlT9AT8v1f
	 7L6SaYPmUaqXQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH=20v9=205/5]=20domctl:=20Add=20XEN=5FDOMCTL=5Fgsi=5Fpermission=20to=20grant=20gsi?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718283062766
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org, "Daniel P . Smith" <dpsmith@apertussolutions.com>
Message-Id: <ZmrrNvv2sVaOIS5h@l14>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com> <20240607081127.126593-6-Jiqian.Chen@amd.com> <987f5d21-bbb5-4cdb-975b-91949e802921@suse.com> <BL1PR12MB5849FF595AEED1112622A98DE7C02@BL1PR12MB5849.namprd12.prod.outlook.com> <c2a5b9cd-2a85-4e01-8b8b-31b85726dbd4@suse.com> <BL1PR12MB5849652CE3039C8D17CD7FA6E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5849652CE3039C8D17CD7FA6E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c2b85fac760e4aaf95af6a4eaa84fc63?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240613:md
Date: Thu, 13 Jun 2024 12:51:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Jun 12, 2024 at 10:55:14AM +0000, Chen, Jiqian wrote:
> On 2024/6/12 18:34, Jan Beulich wrote:
> > On 12.06.2024 12:12, Chen, Jiqian wrote:
> >> On 2024/6/11 22:39, Jan Beulich wrote:
> >>> On 07.06.2024 10:11, Jiqian Chen wrote:
> >>>> +    r = xc_domain_gsi_permission(ctx->xch, domid, gsi, map);
> >>>
> >>> Looking at the hypervisor side, this will fail for PV Dom0. In which case imo
> >>> you better would avoid making the call in the first place.
> >> Yes, for PV dom0, the errno is EOPNOTSUPP, then it will do below xc_domain_irq_permission.
> > 
> > Hence why call xc_domain_gsi_permission() at all on a PV Dom0?
> Is there a function to distinguish that current dom0 is PV or PVH dom0 in tools/libs?

That might have never been needed before, so probably not. There's
libxl__domain_type() but if that works with dom0 it might return "HVM"
for PVH dom0. So if xc_domain_getinfo_single() works and give the right
info about dom0, libxl__domain_type() could be extended to deal with
dom0 I guess. I don't know if there's a good way to find out which
flavor of dom0 is running.

Cheers,

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

