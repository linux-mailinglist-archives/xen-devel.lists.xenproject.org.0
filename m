Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A82199546C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813336.1226230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syD3j-0003zB-LF; Tue, 08 Oct 2024 16:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813336.1226230; Tue, 08 Oct 2024 16:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syD3j-0003xC-Ij; Tue, 08 Oct 2024 16:27:39 +0000
Received: by outflank-mailman (input) for mailman id 813336;
 Tue, 08 Oct 2024 16:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi96=RE=bounce.vates.tech=bounce-md_30504962.67055d76.v1-9680306c77f04a38bfcb1bfe39c7adf0@srs-se1.protection.inumbo.net>)
 id 1syD3i-0003ri-AN
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:27:38 +0000
Received: from mail137-12.atl71.mandrillapp.com
 (mail137-12.atl71.mandrillapp.com [198.2.137.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39c6f58d-8592-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 18:27:36 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-12.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4XNLyt33hLz5QkQhT
 for <xen-devel@lists.xenproject.org>; Tue,  8 Oct 2024 16:27:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9680306c77f04a38bfcb1bfe39c7adf0; Tue, 08 Oct 2024 16:27:34 +0000
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
X-Inumbo-ID: 39c6f58d-8592-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1728404854; x=1728665354;
	bh=Agy44/npwfnWPWGmMglssLELbqq010UDLOCVNcJ9Zc0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=scyzeFe7gMHpvx1X3WNNeX14RmyOYdiFABiSxcdPuxK5EyPWe+kjdvpKNyT4ArvY7
	 Dlev1KYs242XBjJcVIlkGdqJsss7EgTRTG7+2K8YDpzUHOTnxbrhcZM01VwMEbjA9j
	 MaRGplXdDDM8iP+zAsbzzZzWJn3pUznqNFugWDC1P33PI3uhWGe2Qk24fNRm5km+gl
	 UqXzJnx8Cyz0LGXhtynxRysoX1hRzhtQRkq1z2EX6IGYPzXeOjs0o/KynT1DjZBWrr
	 lKgs3O84S96lohEuQ/bYiLJQo0ivkncjIngKuTmdQtlcqrbj5pLg+qqH8VVgtNicJk
	 AIIvT3TPdhkUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1728404854; x=1728665354; i=anthony.perard@vates.tech;
	bh=Agy44/npwfnWPWGmMglssLELbqq010UDLOCVNcJ9Zc0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FrXMssUVb/seDNsWJ0Ad6xLce18+dlvTi2z/RqbpXoB5SaJR+BQ45FmK+AG/pkE7p
	 b3ZF0Eq/MExkf+dMSt1fJfWLwPg9/S+jB3RBs25nv9oIoCEMlSOxHQYbnwCuscpFUT
	 aNd9Ve5Pd2CMtrErGtDhXGPV5leDT1R8qz+uvVJRS93g6KlbtQZj6zw9CDpgHVHELn
	 qEBrFcGwHBTynfRmf/QcS2k+WY6n/zdkEQhNTolTjBGa1pL+VfsOmlH9JcNAVCDSxy
	 dYlS5+ITM1Sd4XJ9/OL4BiN2n2CwolrYFOhjMZGc/01T+HjCF7d9Fsp3Q8dKH66H+c
	 52KFFS4nqvzcw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20CI:=20Stop=20building=20QEMU=20in=20general?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1728404852765
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-Id: <ZwVddI62BTAtMUls@l14>
References: <20241008155023.2571517-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241008155023.2571517-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9680306c77f04a38bfcb1bfe39c7adf0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241008:md
Date: Tue, 08 Oct 2024 16:27:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Oct 08, 2024 at 04:50:23PM +0100, Andrew Cooper wrote:
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index c668736bdc2f..c83e0bdbe119 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -339,6 +339,7 @@ alpine-3.18-gcc-debug:
>    extends: .gcc-x86-64-build-debug
>    variables:
>      CONTAINER: alpine:3.18
> +    QEMU: y

Could you use a different name for the variable? This is exposed as an
environment variable, it could easily be used in a build system already,
like used to store a path to a QEMU to use.

We don't really have a name space for CI variable, but maybe
BUILD_QEMU or BUILD_QEMU_XEN would be less likely to clash with other
usages.

Otherwise patch looks fine.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

