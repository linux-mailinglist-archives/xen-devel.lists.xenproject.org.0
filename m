Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4400A07D26
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 17:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868963.1280473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVvC3-0002VI-8D; Thu, 09 Jan 2025 16:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868963.1280473; Thu, 09 Jan 2025 16:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVvC3-0002RY-54; Thu, 09 Jan 2025 16:15:35 +0000
Received: by outflank-mailman (input) for mailman id 868963;
 Thu, 09 Jan 2025 16:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wq9x=UB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVvC1-0002PN-Og
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 16:15:33 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f310c09f-cea4-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 17:15:32 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso190128566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 08:15:32 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9645fddsm83988066b.169.2025.01.09.08.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 08:15:31 -0800 (PST)
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
X-Inumbo-ID: f310c09f-cea4-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736439331; x=1737044131; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k02q0uVqEedz6OethSIEqDgrfhFBHQS0vlrPrSFQJPw=;
        b=OBWyG9N+Bq4yEhhTAGTHMD8D2o5BDGPScbiD+ACpg6kzupqZfGLdyYTbqNIjRL9yba
         4f3O4Pv6V57XrMD/w/DIgVuvyOWSYqgIvLM4NlL3J36qoIM0G632QVet55+o0egJ+37h
         /An5mIWn9TpMyNzfUdJmvMHWXyRAd5a6UC2n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736439331; x=1737044131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k02q0uVqEedz6OethSIEqDgrfhFBHQS0vlrPrSFQJPw=;
        b=X7NWm1Phke0xoBlWHfRtPNSUCn+aZSFBpneps3oFui8LGPsGWm8wjdGZ5NrPfprbcR
         /uyRF+++jaH63SzMtmx+K+7Nj9I0q4XDMehW8lZcyKnSYhlVoa4HIR4kFr2x+lS4AxVe
         WeVMlhas7mA3YF7usKWU6tE22DwmkhyE+xuLkffaRxI46NyS8+O4D/3atsyLO5jw667j
         UnLC8dl3YcUeC6qIe8o7gj0E4YlrUfqyIjhidotuUwYHFFbJvUgj1Y7htkwZAS3uF03Z
         K+JbruZOUO2qxP2/0qAE6AOk3WNog6meUBEbXzbrQXk9oukyy1/GLrRhJDKe+5cIp9o8
         qD/w==
X-Forwarded-Encrypted: i=1; AJvYcCXMlscLd1zE00tWBUPH7naMAUl9nb3nu+XzrPNkbQh8BnJxX0HLeWkSACdFOQ6pZkZ1j6G2tv2alio=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKgNl+WeEdjLCJ9H8OjmYTz93oVXd3cGqFMCCUpzhgqzfxUQR/
	KChEV4hS8iQwwNFPd86NTo2uAXmdvrxyRQ2mIlRzOlyZTTHsr+lKpEmpx0Pa3ac=
X-Gm-Gg: ASbGncs4/E7uZ6sXyvlHVl1uYfFG847urKJGzGfzG08WQDEtYAc+HPplFardV/kttKa
	4rJK3po9UYtGvxWRuMD+1owLYNpSqsur+DsFfbOAd5KWMJUsAwmHtt0egCOR7HoMyyVbQN3tUoi
	YpmbJWzRh96m5xVic9F1G1y0Bd96WDI3OVyvNxXUBP4+fv8r/fp8WbPVxhOdQQFLDtcMNAnl3+e
	NpgWrW7nMLRL7NOwGB6Y5DhteANIeFji5Y7JklUzjvn5csDCsfMy1VTnkJuoA==
X-Google-Smtp-Source: AGHT+IHtOa0K6VX3BliPmhDS5BYi81wa3891u/ccPf61M2Pph9hCJc33gfh7s/tmPgj+pMUjlYaTKA==
X-Received: by 2002:a17:907:d9f:b0:aac:180e:b1d4 with SMTP id a640c23a62f3a-ab2ab6fe016mr651317366b.27.1736439331372;
        Thu, 09 Jan 2025 08:15:31 -0800 (PST)
Date: Thu, 9 Jan 2025 17:15:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen: do not use '%ms' scanf specifier
Message-ID: <Z3_2IhGZvpF-5IiX@macbook.local>
References: <20250107093140.86180-1-roger.pau@citrix.com>
 <20250107093140.86180-3-roger.pau@citrix.com>
 <Z3-sJMXpiFUoATHz@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3-sJMXpiFUoATHz@l14>

On Thu, Jan 09, 2025 at 11:59:48AM +0100, Anthony PERARD wrote:
> On Tue, Jan 07, 2025 at 10:31:40AM +0100, Roger Pau Monne wrote:
> > The 'm' parameter used to request auto-allocation of the destination variable
> > is not supported on FreeBSD, and as such leads to failures to parse.
> > 
> > What's more, the current usage of '%ms' with xs_node_scanf() is pointless, as
> > it just leads to a double allocation of the same string.  Instead use
> > qemu_xen_xs_read() to read the whole xenstore node.
> > 
> > Fixes: a783f8ad4ec9 ('xen: add a mechanism to automatically create XenDevice-s...')
> > Fixes: 9b7737469080 ('hw/xen: update Xen console to XenDevice model')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  hw/char/xen_console.c | 11 +++++++++--
> >  hw/xen/xen-bus.c      |  7 +++++--
> >  2 files changed, 14 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
> > index af706c7ef440..18afd214c2f6 100644
> > --- a/hw/char/xen_console.c
> > +++ b/hw/char/xen_console.c
> > @@ -531,6 +531,7 @@ static void xen_console_device_create(XenBackendInstance *backend,
> >      const char *name = xen_backend_get_name(backend);
> >      unsigned long number;
> >      char *fe = NULL, *type = NULL, *output = NULL;
> > +    const char *node_path;
> 
> Is "const" correct when we are changing to which string `node_path` is
> pointing at? Also, why "const"? Also, compiler complains that we can't
> free a "const something*".

It's my understanding that the proposed const signals that the pointer
value can change, but the contents of the pointer cannot (iow: the
string cannot be modified).

My build seem to be fine, but I see that g_free() doesn't seem to take
a const pointer.  Will adjust.

> >      char label[32];
> >      XenDevice *xendev = NULL;
> >      XenConsole *con;
> > @@ -550,7 +551,10 @@ static void xen_console_device_create(XenBackendInstance *backend,
> >          goto fail;
> >      }
> >  
> > -    if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, "%ms", &type) != 1) {
> > +    node_path = g_strdup_printf("%s/type", fe);
> > +    type = qemu_xen_xs_read(xsh, XBT_NULL, node_path, NULL);
> > +    g_free(node_path);
> 
> I feel like we want "xs_node_read()" which would be similair to
> xs_node_vscanf() but would simply return the result of
> qemu_xen_xs_read(). This would avoid the need format of the node path in
> several place in the code. But it's OK like that as well.

I was about to introduce such, but didn't end up doing.  I can do.

Thanks, Roger.

