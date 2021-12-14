Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50E3474394
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 14:36:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246733.425500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx7xP-0003dC-OL; Tue, 14 Dec 2021 13:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246733.425500; Tue, 14 Dec 2021 13:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx7xP-0003aV-L9; Tue, 14 Dec 2021 13:35:03 +0000
Received: by outflank-mailman (input) for mailman id 246733;
 Tue, 14 Dec 2021 13:35:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z9rB=Q7=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1mx7xN-0003aP-UG
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 13:35:02 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2a29b1f-5ce2-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 14:35:00 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id z8so28306614ljz.9
 for <xen-devel@lists.xenproject.org>; Tue, 14 Dec 2021 05:35:00 -0800 (PST)
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
X-Inumbo-ID: a2a29b1f-5ce2-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TlxjNyqeqo4Wdhom6SPIkPBaNmlnztiz6pIKybY2+8c=;
        b=PXfwgG5ZpsSRysswoSWec0gaWbWXrYGDxXXNVGFXbSbbRjSsFWb2gsmCbqqL0RnnP3
         jdmpxl85s74mZdSQR2X+XJZAn+K+aPdNVhZStUgq7GK/8UCxf1l1LLMf3v1d6ZSb4OJd
         SvKKRxSA8yY6uP3+3L4LwDZchGgevLa2x61Q4jPlFQEu4S6Y6lQVMTN1Toc2//Ch/FJD
         k9RB2QvaWiMnwcXS6Msx2BBR+wo5fVW2EI/MNprxIpRu40ZFX93xSg1gohnT97Y9Kn8i
         QUrdmkM1V/O0+6uf2S38feS4f99hEqVfeXh4aHdx+j9EHeu1IUvS5JfRG06HgqFW5z40
         SvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TlxjNyqeqo4Wdhom6SPIkPBaNmlnztiz6pIKybY2+8c=;
        b=6Esh0LJ0jE/NnXXiZWEsjlWarAsNewlZ+IL2e4Reeov9itigenmzTb9Hafmqonjan4
         wi4sPu/KWtrFh74sk5NdMYxcFBAYHkkPLVcD/MDFSpAqIEx51lI2It7Rcq9kBAXjvUlm
         UYh5rY60ny2EGGXpkkHZ0FbvprI1ELpW5Xxe0CQJ4NH0JBaOQ7yWRH7lkAM6/4wZBydf
         XGQBwnHv03kCZI7JlDm337Eys9AkzrEM74j+jST/IjxXSlD6FjnlnBqvBURJ7NbC39Pf
         CCaMLw0hdzBceJWAXSdFOkOM8SM63Q2gmzvWZ9sXekIWzBYmCXpGVcaaSGj9ZO3h3ZeQ
         pO7Q==
X-Gm-Message-State: AOAM532hmJ6uTJG1W8yr3jCVbmx48BveiMWmgSZZa7Bb6R6Xooxjn4Nb
	ply4raooh4CDpdAjs4ng/0h8wmAaIsflEY3buwk=
X-Google-Smtp-Source: ABdhPJy3z1jkawSuYE0c5cvaDnae95EW67Yef2dNtf20YE3Z9B6l7+HVttacfuJ4YnHAOi5KpLSON8qMG+ray4eIvLA=
X-Received: by 2002:a2e:8ecd:: with SMTP id e13mr4834831ljl.459.1639488899600;
 Tue, 14 Dec 2021 05:34:59 -0800 (PST)
MIME-Version: 1.0
References: <5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com>
In-Reply-To: <5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 Dec 2021 08:34:48 -0500
Message-ID: <CAKf6xpt6+ZkXK5uXyp15UyA1J2AhtZWipW04M1xD1Yx4nx3jOw@mail.gmail.com>
Subject: Re: [PATCH] libxl/PCI: defer backend wait upon attaching to PV guest
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Paul Durrant <paul@xen.org>, 
	Stefano Stabellini <stefano@stabellini.net>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 14, 2021 at 2:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> Attempting to wait when the backend hasn't been created yet can't work:
> the function will complain "Backend ... does not exist". Move the
> waiting past the creation of the backend (and that of other related
> nodes), hoping that there are no other dependencies that would now be
> broken.
>
> Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are reflected in the config")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Just to make it explicit: I have no idea why the waiting is needed in
> the first place. It's been there from the very introduction of PCI
> passthrough support (commit b0a1af61678b). I therefore can't exclude
> that an even better fix would be to simply omit the 2nd hunk here.

The first time a device is attached, the backend does not exist, and
the wait is not needed.  However, when a second device is attached,
the backend does exist.  Since pciback goes through Reconfiguring and
Reconfigured, I believe the wait exists to let the frontend/backend
settle back to Connected before modifying the xenstore entries to add
the additional device.  I could be wrong, but that is my best answer
for why someone went to the trouble of adding a wait in the first
place.

Prior to 0fdb48ffe7a1, the backend was created before the watch:
     num_devs = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/num_devs", be_path));
-    if (!num_devs)
-        return libxl__create_pci_backend(gc, domid, pci, 1);

     libxl_domain_type domtype = libxl__domain_type(gc, domid);
     if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
         return ERROR_FAIL;

     if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
         if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d",
XenbusStateConnected)) < 0)
             return ERROR_FAIL;
     }

Here and elsewhere, num_devs has been used to identify pre-existing
backends.  That's why I went with the following to address this:
-    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
-        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d",
XenbusStateConnected)) < 0)
+    /* wait is only needed if the backend already exists (num_devs != NULL) */
+    if (num_devs && !starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
+        if (libxl__wait_for_backend(gc, be_path,
+                                    GCSPRINTF("%d", XenbusStateConnected)) < 0)

Regards,
Jason

> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -157,11 +157,6 @@ static int libxl__device_pci_add_xenstor
>      if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
>          return ERROR_FAIL;
>
> -    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> -        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
> -            return ERROR_FAIL;
> -    }
> -
>      back = flexarray_make(gc, 16, 1);
>
>      LOGD(DEBUG, domid, "Adding new pci device to xenstore");
> @@ -213,6 +208,9 @@ static int libxl__device_pci_add_xenstor
>          if (rc < 0) goto out;
>      }
>
> +    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV)
> +        rc = libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected));
> +
>  out:
>      libxl__xs_transaction_abort(gc, &t);
>      if (lock) libxl__unlock_file(lock);
>
>

