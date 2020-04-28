Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1381BCDC0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 22:56:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTXGw-00048C-UN; Tue, 28 Apr 2020 20:56:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pugY=6M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jTXGv-000486-IN
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 20:56:05 +0000
X-Inumbo-ID: abeed82a-8992-11ea-9887-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abeed82a-8992-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 20:56:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e26so253264wmk.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 13:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KKvsDRiFjALps8a6wOB2tzLVbtwckFH331UbKPAJ6KA=;
 b=nxKSt14czAl95ARfnssZwExIdlnG6FY8cW5lG200nGW8FbUwOcMHk431d2EN5ynXEP
 KFFORKkQn3QyMVphbsxrEB7TIJTDw0K8NXHg187TAn+3QYDl1lLuoVjuB8utZ/iVIB1a
 11xAaKuUZegPzcMMHP/ThMzp7aJ9Lju8AwFj8rx3Ee2FGpYNgK3Gre+AICAtibhSCsEo
 i6BzbrUsqyu4lc6hjsBJ3Zdv42sanssP3B/NNNu+E2neMiVbIyNXTPTpmJvDHFjYUY9g
 Ps1OqhXPbyklHnvDvVIie7iakJM2otkZSI19zZ1i5iqTHTyinaW0pdYu8exuvAhOVpnT
 7LdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KKvsDRiFjALps8a6wOB2tzLVbtwckFH331UbKPAJ6KA=;
 b=RmUnYqAFbKFtTYEL49sNlM5kIJWHroqklgyugUH5aTZio5zzN1DjIAXlU1C46gr455
 +gjgLwVSGUaM9/tO2Po38zJplPIBXgBe15OPM1gLC83FuJt5DESkBD+QAWJUrJxN89vU
 ah6oi0qFyMvgXvzidpwMkRqVg4MkfedMfnMwfTKpiTkiC/2TwvRvDON1uxd7S6dS4Jhh
 Vg36TbrQ4EBDCdGMuP/duspWyPRHf3o/3E6LYB1BuRTLS9qGlUsEXRbiV3Paeov7J38y
 9Id+z2s0BWoAMm0hzSJ/QxMqifrAvJuq8sv355Xzt2zfdTGOLWNSCFG3NA9khqL3BRrg
 TCYg==
X-Gm-Message-State: AGi0PuZwk13PBkIA5uv2Jda/fT9DIWN5ag7XdyJC1yS7n6H3oRLMxPLA
 MhxkhMKCmhRlD+c6gpZe0sApcimxFDGCw5NNfM8=
X-Google-Smtp-Source: APiQypKOdI8Quh3q1ys0N7VYAg8WD3bL952HfWMSzWK6lgCzFOqwp5qxGp8/NIaah4TguR2AxIUxY1GW4Me1NT2rVHw=
X-Received: by 2002:a7b:c8cc:: with SMTP id f12mr6217140wml.7.1588107362653;
 Tue, 28 Apr 2020 13:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200428155144.8253-1-jgross@suse.com>
In-Reply-To: <20200428155144.8253-1-jgross@suse.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 28 Apr 2020 21:55:51 +0100
Message-ID: <CAJ=z9a0WfWQs+UJ-t4Kt6PGGdNnA2kMeK5p8bNnDT_eFcpDiiQ@mail.gmail.com>
Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring page in
 xensotred
To: Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,

On Tue, 28 Apr 2020 at 16:53, Juergen Gross <jgross@suse.com> wrote:
>
> The XS_INTRODUCE command has two parameters: the mfn (or better: gfn)
> of the domain's xenstore ring page and the event channel of the
> domain for communicating with Xenstore.
>
> The gfn is not really needed. It is stored in the per-domain struct
> in xenstored and in case of another XS_INTRODUCE for the domain it
> is tested to match the original value. If it doesn't match the
> command is aborted via EINVAL.
>
> Today there shouldn't be multiple XS_INTRODUCE requests for the same
> domain issued, so the mfn/gfn can just be ignored and multiple
> XS_INTRODUCE commands can be rejected without testing the mfn/gfn.

So there is a comment in the else part:

/* Use XS_INTRODUCE for recreating the xenbus event-channel. */

From the commit message this is not entirely clear why we want to
prevent recreating the event-channel. Can you expand it?

>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/xenstore/xenstored_domain.c | 47 ++++++++++++++++-----------------------
>  1 file changed, 19 insertions(+), 28 deletions(-)
>
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index 5858185211..17328f9fc9 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -369,7 +369,6 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
>         struct domain *domain;
>         char *vec[3];
>         unsigned int domid;
> -       unsigned long mfn;
>         evtchn_port_t port;
>         int rc;
>         struct xenstore_domain_interface *interface;
> @@ -381,7 +380,7 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
>                 return EACCES;
>
>         domid = atoi(vec[0]);
> -       mfn = atol(vec[1]);
> +       /* Ignore the mfn, we don't need it. */

s/mfn/GFN/

>         port = atoi(vec[2]);
>
>         /* Sanity check args. */
> @@ -390,34 +389,26 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
>
>         domain = find_domain_by_domid(domid);
>
> -       if (domain == NULL) {
> -               interface = map_interface(domid);
> -               if (!interface)
> -                       return errno;
> -               /* Hang domain off "in" until we're finished. */
> -               domain = new_domain(in, domid, port);
> -               if (!domain) {
> -                       rc = errno;
> -                       unmap_interface(interface);
> -                       return rc;
> -               }
> -               domain->interface = interface;
> -               domain->mfn = mfn;

AFAICT domain->mfn is not used anymore, so could we remove the field?

Cheers,

