Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 597A893C676
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 17:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765062.1175639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX0RZ-0005NN-Qt; Thu, 25 Jul 2024 15:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765062.1175639; Thu, 25 Jul 2024 15:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX0RZ-0005LX-OF; Thu, 25 Jul 2024 15:31:49 +0000
Received: by outflank-mailman (input) for mailman id 765062;
 Thu, 25 Jul 2024 15:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wvf=OZ=bounce.vates.tech=bounce-md_30504962.66a26fe0.v1-1aff5e7615cf4445bc978cfa9b42682f@srs-se1.protection.inumbo.net>)
 id 1sX0RY-0005LR-4b
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 15:31:48 +0000
Received: from mail177-18.suw61.mandrillapp.com
 (mail177-18.suw61.mandrillapp.com [198.2.177.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 001fa911-4a9b-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 17:31:46 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-18.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4WVFH45jZZzCf9QZ2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 15:31:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1aff5e7615cf4445bc978cfa9b42682f; Thu, 25 Jul 2024 15:31:44 +0000
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
X-Inumbo-ID: 001fa911-4a9b-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721921504; x=1722182004;
	bh=a3TUdkuBh4DWTRcuXtKOWymiELHH4Spp935SCdmXsoA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1sMF8OWYPNdQZE8Nu30TIXyTQVM97ca+hMUNXMjuNLmrKk9LITB130yV8HSM9+7h+
	 3vnZHSPZBNYoM9t+dlWlFjrr9BkHKOLiasUJas7Api7MFo3Da3tGSMbUn8YUkz+k2M
	 Is82llP0oJ88XO51+Sv40DVkDMiH1IMJfCYrHMir7ReMPdH2IuKuOTt8Cs6yTa8Gwy
	 L3NK3Yxg5MHZQSGUTKK52Yh34w5kY5T5YNBaHLyUTIt11pNx7VrONK1mtQ7Pvgq2uu
	 fo+V3hbPqDX94VCF3eYkB6zYROUxIgQDhyl8YB0lAL7jXU29zecqJiiQK3hSjInRFL
	 YOzfk1pxRs1Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721921504; x=1722182004; i=anthony.perard@vates.tech;
	bh=a3TUdkuBh4DWTRcuXtKOWymiELHH4Spp935SCdmXsoA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=u6+GN1cWWPwuXXtRCs1sHlAwS/rpXdi5xQJiT+8mswdDY4xJ0U9exgsa0RAWahTbw
	 pR8PMrVksviMWqZfdUwxtCpfwmhJH3D2/weUL5kGjibuQpwCa2D7gufmcdsOYgtc7W
	 aUbGjAR61WEVPg4nQ4UTOb18Av/3rFLyBV0MyY8voRht16+zY1gnDiXg7I3jHbfI0D
	 qTht+azgTsWuGB2W6m3yKcOTD+bkJVnUw5gHVPZNzG+NLDFvEbgK0UozqoKB5R2Osn
	 nrtbhKbVgew2TnNxailkwzQqb+3OefEaKsl8a3rqyUONxV/YQ5pEgoLT6eb59PL0Sy
	 1qQPqgG5nmMDw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3]=20libxl:=20Enable=20stubdom=20cdrom=20changing?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721921503339
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Message-Id: <ZqJv3rflSUC0Iv1d@l14>
References: <20240516021010.3783-1-jandryuk@gmail.com>
In-Reply-To: <20240516021010.3783-1-jandryuk@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1aff5e7615cf4445bc978cfa9b42682f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240725:md
Date: Thu, 25 Jul 2024 15:31:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, May 15, 2024 at 10:10:10PM -0400, Jason Andryuk wrote:
> +static void cdrom_insert_stubdom_parse_fdset_rm(libxl__egc *egc,
> +                                                libxl__ev_qmp *qmp,
> +                                                const libxl__json_object *resp,
> +                                                int rc)
> +{
> +    EGC_GC;
> +    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
> +    int devid;
> +    int fdset;
> +
> +    if (rc) goto out;
> +
> +    /* Only called for qemu-xen/linux stubdom. */
> +    assert(cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
> +
> +    devid = libxl__device_disk_dev_number(cis->disk->vdev, NULL, NULL);
> +    fdset = query_fdsets_find_fdset(gc, resp, devid);
> +    if (fdset < 0) {
> +        rc = fdset;
> +        goto out;
> +    }
> +
> +    LOGD(DEBUG, cis->domid, "Found fdset %d", fdset);
> +
> +    libxl__json_object *args = NULL;
> +
> +    libxl__qmp_param_add_integer(gc, &args, "fdset-id", fdset);
> +
> +    cis->qmp.callback = cdrom_insert_stubdom_ejected;
> +
> +    rc = libxl__ev_qmp_send(egc, &cis->qmp, "remove-fd", args);
> +    if (rc) goto out;
> +
> +    return;
> +
> + out:
> +    if (rc == ERROR_NOTFOUND) {
> +        LOGD(DEBUG, cis->domid, "No fdset found - skipping remove-fd");
> +        cdrom_insert_stubdom_ejected(egc, qmp, resp, 0);

I think technically, cdrom_insert_stubdom_ejected also "must be last",
like cdrom_insert_done, for one thing it actually call cdrom_insert_done
in some cases. I think we used "/* must be last */" to indicate that
resources used by the current chain of callback could be freed,
including `egc`, `gc`, `ao`. There's quite a few more calls in this
patch that would benefit from the annotation. But we can live without
those.

> +    } else {
> +        cdrom_insert_done(egc, cis, rc); /* must be last */
> +    }
> +}
[...]
> +static void cdrom_insert_stubdom_parse_fdset(libxl__egc *egc,
> +                                             libxl__ev_qmp *qmp,
> +                                             const libxl__json_object *response,
> +                                             int rc)
> +{
> +    EGC_GC;
> +    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
> +    int devid;
> +    int fdset;
> +
> +    if (rc) goto out;
> +
> +    /* Only called for qemu-xen/linux stubdom. */
> +    assert(cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
> +
> +    devid = libxl__device_disk_dev_number(cis->disk->vdev, NULL, NULL);
> +    fdset = query_fdsets_find_fdset(gc, response, devid);
> +    if (fdset < 0) {
> +        rc = fdset;
> +        goto out;
> +    }
> +
> +    cis->stubdom_fdset = fdset;
> +
> +    LOGD(DEBUG, cis->domid, "Found fdset %d", cis->stubdom_fdset);
> +    cdrom_insert_ejected(egc, &cis->qmp, NULL, rc);
> +    return;
> +
> + out:
> +    if (rc == ERROR_NOTFOUND) {

While in the previous function it seems ok to deal with the NOTFOUND
error in the "out:" path, I don't think it's a good idea here as it is
an expected part of the workflow of this callback, and not an error.

Could you move setting this timer above again? I guess something like
that would work fine:

  fdset = query_fdsets_find_fdset()
  if (fdset == ERROR_NOTFOUND) {
    // doesn't exist yet, wait a bit
    rc = libxl__ev_time_register_rel()
    if (rc) goto out;
    return
  }
  if (fdset < 0) {
  ...

Or also possible to deal with all error from query_fdsets..() first with
something like:
  if (fdset < 0 && fdset != ERROR_NOTFOUND) {
    rc = fdset;
    goto out;
   ...


> +        rc = libxl__ev_time_register_rel(cis->ao, &cis->retry_timer,
> +                                         cdrom_insert_stubdom_query_fdset,
> +                                         200);
> +        if (rc) goto out;

That "goto out" after the "out" label makes this even stranger and even
a potential infinite loop if `rc` would happen to be set to
ERROR_NOTFOUND again, which I don't think can happen right now.

> +        return;
> +    }
> +
> +    cdrom_insert_done(egc, cis, rc); /* must be last */
> +}


Otherwise patch looks good, with just the comment in
cdrom_insert_stubdom_parse_fdset
act on: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

