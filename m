Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D50E6D6BFB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 20:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518122.804333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjlON-0003rY-2k; Tue, 04 Apr 2023 18:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518122.804333; Tue, 04 Apr 2023 18:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjlOM-0003pt-VS; Tue, 04 Apr 2023 18:28:26 +0000
Received: by outflank-mailman (input) for mailman id 518122;
 Tue, 04 Apr 2023 18:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jyst=73=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pjlOL-0003pn-Ov
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 18:28:25 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b76eb4c-d316-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 20:28:23 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id t10so134161537edd.12
 for <xen-devel@lists.xenproject.org>; Tue, 04 Apr 2023 11:28:23 -0700 (PDT)
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
X-Inumbo-ID: 7b76eb4c-d316-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680632903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r+d5Q9YLXYIEcRrYG4TRRbzODXP0vlh3YF3733MY38Y=;
        b=f3BpCBNxoILDtSyKj6axT8mrPBlR5NN0lRzyoX5tdjNO/89HEPknpa4WvDWvmDY58B
         BI0hYUwNBgaMA8tYJ7g1HLqAvUExLBy3m1U1+4LSeQHitztp3uTADQEFWKk3ejKh8zHG
         d8eIbwe2BJ3fYazGz2Q4bSoA4I96qXA5V+g/6roXRdYcnwfhMpurLv7XqBXSibhOa8T4
         uZcgEoBlNaqEyFJ1VY53AKfCGcQ/Cel/7ok7tvgZq4mf9GXwVfV67QswY7pBPxG4byhj
         5Gzf52tGeynPD3urXrj/SVyzZcSHBswX6C3Zinr9W2c1498cvHXAwVpExI0VTjq7CdSU
         bAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+d5Q9YLXYIEcRrYG4TRRbzODXP0vlh3YF3733MY38Y=;
        b=qYebnK8ESyCUChQ7qXgwN+NFPf8mORiaU+6gEYjhfEdCVUFrqG/qGWI2z/Xc3zOkoC
         6cNrzBjp5ulnoxbOCK1kdd9xc/Q8G3Vs2TkI44laZAE3KgSyYFk0t1j+h+ruR2WKu1wp
         lQsfLWeNeMeukKUvGbpXNdpvASPc8MqKjfhMRAEKqn5nFUMQgK25331VzBZ4lUd299Fs
         NoG91vXsQhPiycsrTk/UuMMMCFDKLoEzGdEjZiuZqHKiRTcVCFDsY6EK0y7IEJwru+//
         0jmRFIc61PS8QK2PcZpgUM+4ec/bH7TAPFOOhIU6iE9xV9LdL+mT/36XC1fNi+rYIsDf
         P2MA==
X-Gm-Message-State: AAQBX9dyddlt8xdILmbfHkfqeEM4keUcyB1dgSUB5liKMK38x6Xls6lA
	MTnPRKy2SLRiUp0Xbp38FoZXZDG0sDXuY5i1eqRLiQ==
X-Google-Smtp-Source: AKy350ZT252GSKd/98j6Mu/b60fK17QV1dP+JE4fqqkBHdumFzII2W394UiPvTI+M3TSV0LF0wvFMeuQ5PxM5EcMK/M=
X-Received: by 2002:a50:bb43:0:b0:4fb:7e7a:ebf1 with SMTP id
 y61-20020a50bb43000000b004fb7e7aebf1mr222707ede.6.1680632902832; Tue, 04 Apr
 2023 11:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <daaa71eea7fa0c4bdb70131d794ce8e5cee0e0c2.camel@infradead.org>
In-Reply-To: <daaa71eea7fa0c4bdb70131d794ce8e5cee0e0c2.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 19:28:12 +0100
Message-ID: <CAFEAcA_-ejPodtPeaJb1xpS7aK1ApQtE1qdRU7L5aJO_XzgPZA@mail.gmail.com>
Subject: Re: [PATCH] hw/xen: Fix memory leak in libxenstore_open() for Xen
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Apr 2023 at 19:25, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> There was a superfluous allocation of the XS handle, leading to it
> being leaked on both the error path and the success path (where it gets
> allocated again).
>
> Spotted by Coverity (CID 1508098).
>
> Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirection to internal emulation")
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  hw/xen/xen-operations.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
> index 4b78fbf4bd..3d213d28df 100644
> --- a/hw/xen/xen-operations.c
> +++ b/hw/xen/xen-operations.c
> @@ -287,7 +287,7 @@ static void watch_event(void *opaque)
>  static struct qemu_xs_handle *libxenstore_open(void)
>  {
>      struct xs_handle *xsh = xs_open(0);
> -    struct qemu_xs_handle *h = g_new0(struct qemu_xs_handle, 1);
> +    struct qemu_xs_handle *h;
>
>      if (!xsh) {
>          return NULL;
> --
> 2.34.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

