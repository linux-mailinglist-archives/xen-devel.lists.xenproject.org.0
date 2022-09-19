Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48775BD385
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 19:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408867.651709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaKQ3-0005JY-3d; Mon, 19 Sep 2022 17:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408867.651709; Mon, 19 Sep 2022 17:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaKQ3-0005GX-0Z; Mon, 19 Sep 2022 17:18:55 +0000
Received: by outflank-mailman (input) for mailman id 408867;
 Mon, 19 Sep 2022 17:18:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3MU=ZW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oaKQ1-0005GR-B8
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 17:18:53 +0000
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [2607:f8b0:4864:20::d2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21a403a9-383f-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 19:18:52 +0200 (CEST)
Received: by mail-io1-xd2c.google.com with SMTP id r134so77501iod.8
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 10:18:52 -0700 (PDT)
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
X-Inumbo-ID: 21a403a9-383f-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ITpYqLR+bXSCs/G+SgS3cZYa1rXHQaZ/9kX7yDXaFac=;
        b=IJbzYe3Ab9ZGwq99AujxkiD9E6fvBnAJfwn6CMnSCBfQGhOpypywgojYPTN1Sn3flj
         kS04QYT54pB6+PFwKqV3QUKvK/YEu1qvmwzRtfoL6p8ggB3y+qOQd/eMEBS0czEwa/GT
         lGJ1eOTR6B39UuA1DvVCOZmh1I7dRjg12D2OEbm0ZQuO5TSzIAZAwVnI5b25NC4KVsm0
         eu/cX/VymISAMW7LDAhrzDYxZ+2nlG6H43XICy3vfaBW4u2AcUEwxGLwoXnCW5xmabp3
         FaIIvXZdgM3iJaZF4av+tiVaMOO3l9ktZfBve0/eIIUSS80+SGq5ql033lffdxdaRnSR
         39kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ITpYqLR+bXSCs/G+SgS3cZYa1rXHQaZ/9kX7yDXaFac=;
        b=4Wf5s/hU99OfI6fBZm9fZa8tTb+fLVF89m6Q1RYw0v82DkwBUo+vbhkkhQpIsKYPu3
         QmSiiqhZmAUzZWJgv9IKOdORd7nOfKYzIGQJhP0CMh1UCJbwDAOi1hhrzRvs4QsmaeFa
         EZPtxERC9nYOKSfshGfCHD69MM2KGgvYq1rKCrGQStARyorwdj0HnbuG9bPek/XpqdU/
         wNxIjUwBvRcuRk7nN7F6e++FZ4zZahAEC2GmGpzQMVHxlIK8ke5Y2KFewy5H8P4yJtGJ
         7b2nAnB7nCu3LH1NtuLoFfnzJwnuK3YYNg8tEabr5MsypMoADjir+XZIJwVnYYFOhnzL
         ol/g==
X-Gm-Message-State: ACrzQf2wqp7EdVk0j8aklOM4jrpVLEC79sfuFmJtNgBpRh0GIZsWeGZj
	QTMdCrO6X9U/biPauvhoc1nUjREmRRutYTIBZ7s=
X-Google-Smtp-Source: AMsMyM7CKNZYu0slHiffyHEluWyj7A3zdYu5sFJLLZ2XXeOIyfeHtOovsQSLRw3bV4jgtiYoSu0hQVlwCkuzwc4NAFY=
X-Received: by 2002:a05:6602:1609:b0:6a1:899e:bf36 with SMTP id
 x9-20020a056602160900b006a1899ebf36mr7191878iow.121.1663607931226; Mon, 19
 Sep 2022 10:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com> <20220915204029.1227112-1-jennifer.herbert@citrix.com>
In-Reply-To: <20220915204029.1227112-1-jennifer.herbert@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 19 Sep 2022 13:18:39 -0400
Message-ID: <CAKf6xpt04v52fzq7v4RC8XFJcfT8Hit-tnCTaBZ0w5mv8F0kbg@mail.gmail.com>
Subject: Re: [PATCH 1/2] acpi: Make TPM version configurable.
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, wl@xen.org, 
	roger.pau@citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 15, 2022 at 4:41 PM Jennifer Herbert
<jennifer.herbert@citrix.com> wrote:
>
> This patch makes the TPM version, for which the ACPI libary probes, configurable.
> If acpi_config.tpm_verison is set to 1, it indicates that 1.2 (TCPA) should be probed.
> I have also added to hvmloader an option to allow setting this new config, which can
> be triggered by setting the platform/tpm_verion xenstore key.
>
> Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
> ---
>  docs/misc/xenstore-paths.pandoc |  8 ++++
>  tools/firmware/hvmloader/util.c | 13 ++++++-
>  tools/libacpi/build.c           | 68 ++++++++++++++++++---------------
>  tools/libacpi/libacpi.h         |  4 +-
>  4 files changed, 59 insertions(+), 34 deletions(-)
>
> diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
> index 5cd5c8a3b9..7270b46721 100644
> --- a/docs/misc/xenstore-paths.pandoc
> +++ b/docs/misc/xenstore-paths.pandoc
> @@ -269,6 +269,14 @@ at the guest physical address in HVM_PARAM_VM_GENERATION_ID_ADDR.
>  See Microsoft's "Virtual Machine Generation ID" specification for the
>  circumstances where the generation ID needs to be changed.
>
> +
> +#### ~/platform/tpm_version = INTEGER [HVM,INTERNAL]
> +
> +The TPM version to be probed for.
> +
> +A value of 1 indicates to probe for TPM 1.2. If unset, or an
> +invalid version, then no TPM is probed.
> +

Hi,

In patch 2, I think you want to expand this section for TPM 2.0 support.

Regards,
Jason

