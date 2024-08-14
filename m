Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D151B951783
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 11:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777011.1187203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seA9l-0006n4-FR; Wed, 14 Aug 2024 09:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777011.1187203; Wed, 14 Aug 2024 09:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seA9l-0006lA-Cq; Wed, 14 Aug 2024 09:19:01 +0000
Received: by outflank-mailman (input) for mailman id 777011;
 Wed, 14 Aug 2024 09:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xu2o=PN=bounce.vates.tech=bounce-md_30504962.66bc7680.v1-b8355132978a4a7087759d98b47c2ae2@srs-se1.protection.inumbo.net>)
 id 1seA9j-0006l4-Uq
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 09:19:00 +0000
Received: from mail135-13.atl141.mandrillapp.com
 (mail135-13.atl141.mandrillapp.com [198.2.135.13])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c0be893-5a1e-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 11:18:58 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-13.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WkN3h3XVGzNCd90D
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 09:18:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b8355132978a4a7087759d98b47c2ae2; Wed, 14 Aug 2024 09:18:56 +0000
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
X-Inumbo-ID: 3c0be893-5a1e-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1723627136; x=1723887636;
	bh=Z4n6LJLCL+mJrXsNz9PY039uuwcbFos8lsyc9UNb5xE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=S3HeCTfpG4gsCCTCNJoFCHFmJ7EWDScX7d5vPMlGOXLPpFn76adOsBLy+PRRvtyCj
	 iLRLlo9e9yQhqRUkOUu1ZNDNrjo+d37EfTLxQ++fX8OCpdVmlV4Oyk7X5OVppHU4cF
	 Uk0kqJ7QVFd5bkpVb12HZWKx2p+uWmI42PxykqgEsU9tfiLSANfU12eA/pOF3cHl/4
	 u1Q+yhpyoI3qCCglyiHuyMkvtF0l1ohm3CPEI+BntSwpNhYNi2fF9k6z7Jul1+J1H3
	 4FFWiY83mZHc24ceGjWXsVz+n9EzPa6PMn3HVDYb9qzGJy6M2A1IeTnSsU2TvDLWVM
	 PyGFaBClHbFLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1723627136; x=1723887636; i=anthony.perard@vates.tech;
	bh=Z4n6LJLCL+mJrXsNz9PY039uuwcbFos8lsyc9UNb5xE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MiAXp8Yws5cDVpVfJfBIqtIiZ0zJL6yQRjWS2PJPrEsBh/ktuX8leZoEIGfDJ/1N+
	 x3DbmFz9BihrN/XZm5QGChWZnLRPIm6nCrTB4A6LXyVUuTdU0qK6KOM98WMsuBMPAY
	 NTGjqPv9aDaTzSI2UUor/VOH2um4gFbljhzvH8YbBsXzvg+24xK7vAwE4iQg7fv1lm
	 fMSIJAblVkS2gt2tb+S9lZDr4n6luLj9AvpfhXnbz55vZou/keQ5z/hF+exWOIgfWr
	 60Z5OAJKu+RIMhOFb4+pWjUgrcanT/nzEwHObgVl/v1gtEx3HJUALdECUatvtKWvw9
	 4S616xdVw40lw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20tools/helpers/init-dom0less:=20fix=20vcpu=20availability?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1723627135748
To: Amneesh Singh <a-singh21@ti.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <Zrx2f7Y2EXBKYThf@l14>
References: <20240802075823.116920-1-a-singh21@ti.com>
In-Reply-To: <20240802075823.116920-1-a-singh21@ti.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b8355132978a4a7087759d98b47c2ae2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240814:md
Date: Wed, 14 Aug 2024 09:18:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Amneesh,

On Fri, Aug 02, 2024 at 01:28:25PM +0530, Amneesh Singh wrote:
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> index fee9345..a8cdc6d 100644
> --- a/tools/helpers/init-dom0less.c
> +++ b/tools/helpers/init-dom0less.c
> @@ -300,7 +301,7 @@ int main(int argc, char **argv)
>  {
>      libxl_dominfo *info = NULL;
>      libxl_ctx *ctx;
> -    int nb_vm = 0, rc = 0, i;
> +    int nb_vm = 0, nb_vcpu = 0, nr_cpus = 0, rc = 0, i;
>      struct xs_handle *xsh = NULL;
>      struct xc_interface_core *xch = NULL;
>      xenforeignmemory_handle *xfh = NULL;
> @@ -330,14 +331,17 @@ int main(int argc, char **argv)
>  
>      for (i = 0; i < nb_vm; i++) {
>          domid_t domid = info[i].domid;
> +        libxl_vcpuinfo *vcpuinfo;
>  
>          /* Don't need to check for Dom0 */
>          if (!domid)
>              continue;
>  
> +        vcpuinfo = libxl_list_vcpu(ctx, domid, &nb_vcpu, &nr_cpus);

You should check that libxl_list_vcpu() didn't return an error. If it
did, `vcpuinfo` would be NULL, and `nb_vcpu` would be an outdated value.


>          printf("Checking domid: %u\n", domid);
>          if (!domain_exists(xsh, domid)) {
> -            rc = init_domain(xsh, xch, xfh, &info[i]);
> +            rc = init_domain(xsh, xch, xfh, &info[i], vcpuinfo);
>              if (rc < 0) {
>                  fprintf(stderr, "init_domain failed.\n");
>                  goto out;
> @@ -345,6 +349,8 @@ int main(int argc, char **argv)
>          } else {
>              printf("Domain %u has already been initialized\n", domid);
>          }
> +
> +        libxl_vcpuinfo_list_free(vcpuinfo, nb_vcpu);
>      }
>  out:
>      libxl_dominfo_list_free(info, nb_vm);


The rest of the patch looks fine.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

