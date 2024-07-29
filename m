Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A98693FB1B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 18:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767005.1177564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYTGI-0004sA-40; Mon, 29 Jul 2024 16:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767005.1177564; Mon, 29 Jul 2024 16:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYTGI-0004pS-1D; Mon, 29 Jul 2024 16:30:14 +0000
Received: by outflank-mailman (input) for mailman id 767005;
 Mon, 29 Jul 2024 16:30:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYFf=O5=bounce.vates.tech=bounce-md_30504962.66a7c391.v1-d803707a3069417398f26b8cd2904e63@srs-se1.protection.inumbo.net>)
 id 1sYTGG-0004pM-Ir
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 16:30:12 +0000
Received: from mail145-27.atl61.mandrillapp.com
 (mail145-27.atl61.mandrillapp.com [198.2.145.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2f21523-4dc7-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 18:30:11 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-27.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4WXkNd3dnjz4f3k3v
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 16:30:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d803707a3069417398f26b8cd2904e63; Mon, 29 Jul 2024 16:30:09 +0000
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
X-Inumbo-ID: d2f21523-4dc7-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1722270609; x=1722531109;
	bh=Ruy1Q7hG2+TYV4ovuEb0fCW3N1ymemBberSeQrXFI40=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SxP7Jm/s0235zPNU+EDtBAJihoAgJ1nVN3EIEV4dcl9XL1AQ9PNvLwSe6OjiHnQFV
	 0NG80l/xF4KpuUhhL21/RJz0fP/GCpWjbDLFifFXcJ/KlLmteytioLPxgm/QmO/2qy
	 Peg1DvWYLh+iCxXx2ugp8wpJi7IrZyCPi2atnI64lhIo+HZKJ9cP/o6jm+1hw87vg7
	 ixD+CL2P4sz/HCBNN7JLcLHjX1YNaWv5KGzIiGvYNoWA9sukPKWGVuuCrSTx2ibgOm
	 pa9Ew9AYCEQ2P/OkeCg5nl/Iecz59kztj01dPaesppg4fq/9ihDY6ocu4g/CKB89Lk
	 cV62O+hWGH++Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1722270609; x=1722531109; i=anthony.perard@vates.tech;
	bh=Ruy1Q7hG2+TYV4ovuEb0fCW3N1ymemBberSeQrXFI40=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=a6EcfDtlfSt8UJ/d9AHxlGvOz4qVLT6arUemw7iocEG8Agqr46/3n1uGu3A2W2kJc
	 eVt3Nns8zcKFamUE8fxiLyBeqIKqb1QND0YqTweOh5djNw7f6riMZnVMhb5RczreJH
	 avk6hqr1+k0kdwi+5llKPNfaA4SaeeywnxiHNiiTCLQZXt/qE1nG1tshmK24B6YQwK
	 UhXmH4PVFunZ55LHJs7wdYL4sZ6AbO6FZsI/YHSZHHBcGb9UsPly7ytIhY+4p09gEs
	 HvVpaqrgY8kOxw3kfm+IqHvl8GUlXOKiwN7ytpIArhhlXi3m+bI/Hu5oCV0BjofImo
	 uB167IeqCnPrA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH=20v12=206/7]=20tools:=20Add=20new=20function=20to=20get=20gsi=20from=20dev?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1722270607522
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Message-Id: <ZqfDjjpq6zDZojJi@l14>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com> <20240708114124.407797-7-Jiqian.Chen@amd.com> <ZovpKmmoabIvy135@l14> <BL1PR12MB5849BEF865F5E6413402C219E7DB2@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5849BEF865F5E6413402C219E7DB2@BL1PR12MB5849.namprd12.prod.outlook.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d803707a3069417398f26b8cd2904e63?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240729:md
Date: Mon, 29 Jul 2024 16:30:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Jul 09, 2024 at 03:35:57AM +0000, Chen, Jiqian wrote:
> On 2024/7/8 21:27, Anthony PERARD wrote:
> > You could reuse the already opened fd from libxencall:
> >     xencall_fd(xch->xcall)
> Do I need to check it this fd<0?

No, it should be good to use.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

