Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF696D9C09
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 17:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518925.805940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkRNc-0007hf-Sm; Thu, 06 Apr 2023 15:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518925.805940; Thu, 06 Apr 2023 15:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkRNc-0007eV-Q0; Thu, 06 Apr 2023 15:18:28 +0000
Received: by outflank-mailman (input) for mailman id 518925;
 Thu, 06 Apr 2023 15:18:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hdop=75=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pkRNa-0007e6-Qn
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 15:18:26 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46a36581-d48e-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 17:18:25 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id l17so2238007ejp.8
 for <xen-devel@lists.xenproject.org>; Thu, 06 Apr 2023 08:18:25 -0700 (PDT)
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
X-Inumbo-ID: 46a36581-d48e-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680794305; x=1683386305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DTYmK8YkPVhMeVdQAleCZ/tAcp1XekiLSY2jWJ8OVn0=;
        b=o3sXOGaTy35TBrWdA/ZCTjDHsafZroabmM7isj5bmvtyQzYNf8w0e6W2k5tDIZJOT5
         ZtB6SjqdlNsiTLK5jMTOa65QbxUKFL1QtdRlcLTCok/3waNhaSOTzSZm+sRQY+yAK0lW
         Gi4So07q5CVUbS2L9HUiwJvvYHUB6Q4vj3e6EhKcFFbiC8jMzEAQh9aTrDG3uGQUY/U5
         kzzUHFzg/wt6ZN4jsviiQ2NQraL5cbmbtq4S1ATmJ48Y0P7bFi3K5BWWuFpKUGrOiNDC
         NEYh2UGteXEvs2orgNeNIg/6c4ya/viPWQqtTpBOFtAM6nVYAKwullSbt+p47ZKT1Mhp
         zyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794305; x=1683386305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTYmK8YkPVhMeVdQAleCZ/tAcp1XekiLSY2jWJ8OVn0=;
        b=4Ee/iMwUBLxGRpHM8AWdlZ4CxS1Wd+3HS+nCR6h8DMDNF1S1MepzTUE/5hyc7stnrz
         jN/0AUADjg7cfVnEUQRWXcqgV3aYDP1wdAr9yYPHddk8XVVOwwQu4ZN3fShbe9so+9zi
         AYblrZmzjYpsqAJmPJUqEiUGmeoQ3BTkdNjzezYaF5/WsD6eJOAhIlJhliqKdFp2ksq0
         GABv5x8vY4Mwtjz0qMX90TsaXr87V2zoqxX90kAfUrzXbOBNPBmCMdVDMfqvrfnx6dQ2
         WMBjsaHD/Kbb7FXu2mUJX+iypgFFkOgGG+OJVR90io9/VAlNimzWeOED7PTDYXXdEXbI
         31Eg==
X-Gm-Message-State: AAQBX9dWnTew+ohena3S8meRRwgwonfMGHTezPCaiWWMr2Y73hUr2gYq
	TChSzWBXFQHx9ET2B0974fvDW9Y+rkrvzJTBHG4MCQ==
X-Google-Smtp-Source: AKy350Zs8ZnFOSDFZhmrHpJmPBzmdZ0OVPINfkHmM71Js2ejfgFIiy9ZLXoyIwUqzPcpT94JVtx18iJ0Fh+BaFTYbQU=
X-Received: by 2002:a17:906:73d8:b0:939:a51a:dc30 with SMTP id
 n24-20020a17090673d800b00939a51adc30mr4786343ejl.2.1680794305057; Thu, 06 Apr
 2023 08:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org> <20230307182707.2298618-15-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-15-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 16:18:14 +0100
Message-ID: <CAFEAcA-9GDCa8ZrxjZJBq7wx=pVDAdvvDvTQs_oVyhD-HNSsrA@mail.gmail.com>
Subject: Re: [PULL 14/27] hw/xen: Move xenstore_store_pv_console_info to xen_console.c
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
	Joao Martins <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Mar 2023 at 18:28, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> There's no need for this to be in the Xen accel code, and as we want to
> use the Xen console support with KVM-emulated Xen we'll want to have a
> platform-agnostic version of it. Make it use GString to build up the
> path while we're at it.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>

Hi; Coverity points out a double-free here (CID 1508254):

> +static int store_con_info(struct XenConsole *con)
> +{
> +    Chardev *cs = qemu_chr_fe_get_driver(&con->chr);
> +    char *pts = NULL;
> +    char *dom_path;
> +    GString *path;
> +    int ret = -1;
> +
> +    /* Only continue if we're talking to a pty. */
> +    if (!CHARDEV_IS_PTY(cs)) {
> +        return 0;
> +    }
> +    pts = cs->filename + 4;
> +
> +    dom_path = qemu_xen_xs_get_domain_path(xenstore, xen_domid);
> +    if (!dom_path) {
> +        return 0;
> +    }
> +
> +    path = g_string_new(dom_path);
> +    free(dom_path);
> +
> +    if (con->xendev.dev) {
> +        g_string_append_printf(path, "/device/console/%d", con->xendev.dev);
> +    } else {
> +        g_string_append(path, "/console");
> +    }
> +    g_string_append(path, "/tty");
> +
> +    if (xenstore_write_str(con->console, path->str, pts)) {
> +        fprintf(stderr, "xenstore_write_str for '%s' fail", path->str);
> +        goto out;
> +    }
> +    ret = 0;
> +
> +out:
> +    g_string_free(path, true);
> +    free(path);

g_string_free frees the GString, but then we call free() on it
as well. Presumably the free() should just be deleted ?

> +
> +    return ret;
> +}

thanks
-- PMM

