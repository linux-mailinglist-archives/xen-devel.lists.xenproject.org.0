Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5EA5F6829
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 15:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416924.661618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogQwm-00072X-RZ; Thu, 06 Oct 2022 13:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416924.661618; Thu, 06 Oct 2022 13:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogQwm-00070X-Nv; Thu, 06 Oct 2022 13:29:56 +0000
Received: by outflank-mailman (input) for mailman id 416924;
 Thu, 06 Oct 2022 13:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G1sz=2H=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ogQwl-0006oe-8x
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 13:29:55 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6975b6e-457a-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 15:29:54 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id w10so2825104edd.4
 for <xen-devel@lists.xenproject.org>; Thu, 06 Oct 2022 06:29:54 -0700 (PDT)
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
X-Inumbo-ID: f6975b6e-457a-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6ZdDTmo4+335EbBvlEmQjT8GDpny2W8EHJfskLeQgYU=;
        b=OM8dnY2tg5vevPKL7Mnvbt5ETiaM4d58uhREXqFxxKt0/V8KauGHkWTvb7x2Oqt0IQ
         aEejxhNdge0oFvaJY8CAdxgnWAgK4wSbysP8CQBrYZU3tVc/HUG18oqON1Qc4k0HyvmX
         xlO3nuv08QPmrsaC57vOL93rMqf5EgWpd8LoA0wI1km1qOGq2FaqvoFLcrHX61sGkweU
         UCD0Mp5xzvsFNg18sdEOvnJG0+cBg12+ROqA3DOYIVWuyz7cndaSK170EIJX7lh9BErx
         EWob7RD84FlsXzau9HMYQ7oaLWlnBSdFxt77whBg73BDOMcQkml0e3x8yR7IJXGg4cVc
         iYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6ZdDTmo4+335EbBvlEmQjT8GDpny2W8EHJfskLeQgYU=;
        b=H7ceR4NUZxjWo3DDZerOKqRXNK6fTAO1xiR4trJuEimoOvYB3jxkXfPIwQachTLZOb
         5aqar8TdorIN/+98+0yB9RvN2mmdKashMa1bLbyWxslvpeI0hf+8nw1Azp73zVnQr8hV
         E6RCR8bnYbEgsmW4L5jgfROh1nLQKMLtsLhwiJGz0da6h5uXqGuDNcfncuSMcAf3qUe6
         qGDu6mU7jEoaLjhjQ7DNVYrvmktM8o/VESVQ6Vt266aYKMyWHJLu2sDENPXteV2NSeZF
         iAOXKkj73YupKZcI50UgfuoRCuQanLvWJNjrF9dSyAwf/6pS1/cjn4DkvcVfYZYvb8+1
         ArQg==
X-Gm-Message-State: ACrzQf1pwJO28NDizSvR/ufHm9NpFzB/ET4dIqezkOWX9Jcz9+cfuWQv
	lyiUyIsp7XIXWKuwDkrhHuADtvaKaAwQXrq8AeY=
X-Google-Smtp-Source: AMsMyM5EPdeLuWOWDgXAOEFMd2VbWS3fbiofJOic5lMpfbYcw1O+Uxlkjte/6Xq5LeSybtdVQY6hogt1NJyXHeeymfo=
X-Received: by 2002:a05:6402:524d:b0:459:3619:9cfa with SMTP id
 t13-20020a056402524d00b0045936199cfamr4749148edd.227.1665062993966; Thu, 06
 Oct 2022 06:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221006092929.30041-1-jgross@suse.com>
In-Reply-To: <20221006092929.30041-1-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 6 Oct 2022 09:29:41 -0400
Message-ID: <CAKf6xpvS20J0oz6vn+g47OBbKxEhAC8f2gyQ9otj+rOn+L9FOw@mail.gmail.com>
Subject: Re: [PATCH] xen/pcifront: move xenstore config scanning into sub-function
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 6, 2022 at 5:29 AM Juergen Gross <jgross@suse.com> wrote:
>
> pcifront_try_connect() and pcifront_attach_devices() share a large
> chunk of duplicated code for reading the config information from
> Xenstore, which only differs regarding a function call.
>
> Put that code into a new sub-function. While at it fix the error
> reporting in case the root-xx node had the wrong format.
>
> As the return value of pcifront_try_connect() and
> pcifront_attach_devices() are not used anywhere make those functions
> return void. As an additional bonus this removes the dubious return
> of -EFAULT in case of an unexpected driver state.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/pci/xen-pcifront.c | 133 +++++++++++--------------------------
>  1 file changed, 40 insertions(+), 93 deletions(-)
>
> diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
> index 689271c4245c..a68e47dcdd7e 100644
> --- a/drivers/pci/xen-pcifront.c
> +++ b/drivers/pci/xen-pcifront.c
> @@ -819,76 +819,79 @@ static int pcifront_publish_info(struct pcifront_device *pdev)

>         err = xenbus_scanf(XBT_NIL, pdev->xdev->otherend,
>                            "root_num", "%d", &num_roots);
>         if (err == -ENOENT) {
>                 xenbus_dev_error(pdev->xdev, err,
>                                  "No PCI Roots found, trying 0000:00");
> -               err = pcifront_scan_root(pdev, 0, 0);
> +               if (rescan)
> +                       err = pcifront_rescan_root(pdev, 0, 0);
> +               else
> +                       err = pcifront_scan_root(pdev, 0, 0);

Early in pcifront_rescan_root(), we have:

        b = pci_find_bus(domain, bus);
        if (!b)
                /* If the bus is unknown, create it. */
                return pcifront_scan_root(pdev, domain, bus);

pcifront_scan_root() does some allocation, but the later scanning
matches that of pcifront_rescan_root().  So I think we can just always
call pcifront_rescan_root() and it should do the right thing.  That
drops the need for the rescan boolean.

Regardless of the above idea:

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Regards,
Jason

