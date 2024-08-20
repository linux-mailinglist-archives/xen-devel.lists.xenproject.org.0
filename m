Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F34958C29
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 18:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780671.1190305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgRec-0000DP-0p; Tue, 20 Aug 2024 16:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780671.1190305; Tue, 20 Aug 2024 16:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgReb-0000Az-UQ; Tue, 20 Aug 2024 16:24:17 +0000
Received: by outflank-mailman (input) for mailman id 780671;
 Tue, 20 Aug 2024 16:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=axOY=PT=bounce.vates.tech=bounce-md_30504962.66c4c327.v1-d5d912f90e9942e39efed96c854fe1c9@srs-se1.protection.inumbo.net>)
 id 1sgRea-0000Aa-GM
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 16:24:16 +0000
Received: from mail186-11.suw21.mandrillapp.com
 (mail186-11.suw21.mandrillapp.com [198.2.186.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a36831f0-5f10-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 18:24:14 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-11.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WpFCW6SVjzLfH7VX
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 16:24:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d5d912f90e9942e39efed96c854fe1c9; Tue, 20 Aug 2024 16:24:07 +0000
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
X-Inumbo-ID: a36831f0-5f10-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724171047; x=1724431547;
	bh=oREGtW1Qw8NPzQcTfa6qhs8+JE+YDa7gTH9PgR4BUBQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xjwKHlTc85uuiblSlqsnPS8TRAKHaydf4gTsCE0ZqxKsYA3DVsFmLIxzRARz8xk0p
	 RYGe5yz/RfflNQIutbL8JQiG68LiErANoCk6eMtq3reepPnqW9/CiI1uMDWjTZwM/U
	 o/Hs0Lvn8wHjV6O+CNz3YZntAdiRkRzmSpNXBLTimMR7QxTiR3qJPOhBo3IZEjvoxY
	 5jnwf/WqFEtkAv47JEqJi8a30Cm6bcP16PKNWuYZtIZW582op31pHM4JjunIqW4IRi
	 uQx3Vw/PhbSahKoZl7qjweAEYvLO6Y/RyWbtMm90zZfjfLs0SnqR21cGwUh7Ad0QIZ
	 VECRrI9UQkUNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724171047; x=1724431547; i=anthony.perard@vates.tech;
	bh=oREGtW1Qw8NPzQcTfa6qhs8+JE+YDa7gTH9PgR4BUBQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=prtqHUUfnM9bEgZARu9ZU+aqruzNTNg7vwfN2snNnPkQogc2G4i/nEPcwBIFLERO4
	 SlKt8T6L8bY48xGTrv7SevLaGi1uf2qFAp0e1gMCd3Bcw8oScH4Z+/MGRduytmL5sH
	 dPqBdhwwU7/8RfVtOkr0fq1pGkeLYXr1KltJMSVQ8GDSnSszb6oO6swio1onCT+lL9
	 hgUX5Q4iex4xnPUsLLzxW8P5ul5+7fl6ztFdxFLlsO+q7adtPw1AXohZtFLl/RvCip
	 FhD9QpkK9xCscYQyFRcBnI2Mf374pF/FSDvTjVxsDQ7o2INhF6iPCHORXFXskKadLB
	 h8vS8Iu8v7I3g==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20tools/helpers/init-dom0less:=20fix=20vcpu=20availability?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724171046984
To: Amneesh Singh <a-singh21@ti.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <ZsTDJhcfFpm23oHO@l14>
References: <20240820080416.323725-1-a-singh21@ti.com>
In-Reply-To: <20240820080416.323725-1-a-singh21@ti.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d5d912f90e9942e39efed96c854fe1c9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240820:md
Date: Tue, 20 Aug 2024 16:24:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Aug 20, 2024 at 01:34:17PM +0530, Amneesh Singh wrote:
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> index fee9345..722a5af 100644
> --- a/tools/helpers/init-dom0less.c
> +++ b/tools/helpers/init-dom0less.c
> @@ -167,15 +167,20 @@ retry_transaction:
>      /* /domain */
>      if (!do_xs_write_dom(xsh, t, domid, "vm", vm_val_str)) goto err;
>      if (!do_xs_write_dom(xsh, t, domid, "name", dom_name_str)) goto err;
> -    if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) goto err;

You should probably keep this node even if "*/availability" isn't going
to be written. It might be useful for watching everything under the
"cpu" node. (libxl create this node independently from all the other
"availability" sub-nodes.)

> @@ -330,14 +336,24 @@ int main(int argc, char **argv)
>  
>      for (i = 0; i < nb_vm; i++) {
>          domid_t domid = info[i].domid;
> +        libxl_vcpuinfo *vcpuinfo;
> +        int nb_vcpu = 0, nr_cpus = 0;
> +
>  
>          /* Don't need to check for Dom0 */
>          if (!domid)
>              continue;
>  
> +        vcpuinfo = libxl_list_vcpu(ctx, domid, &nb_vcpu, &nr_cpus);
> +
> +        if (!vcpuinfo) {
> +          fprintf(stderr, "libxl_list_vcpu failed.\n");
> +          nb_vcpu = 0;

Is there any value to keep going if libxl_list_vcpu() fails?
Or is the reasoning is that cpu/*/availability was broken before, so
it's not important enough to stop init-dom0less?


Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

