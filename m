Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA79A07E20
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 17:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869010.1280521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVvob-0000WE-RT; Thu, 09 Jan 2025 16:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869010.1280521; Thu, 09 Jan 2025 16:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVvob-0000TO-NL; Thu, 09 Jan 2025 16:55:25 +0000
Received: by outflank-mailman (input) for mailman id 869010;
 Thu, 09 Jan 2025 16:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wq9x=UB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVvoa-0000S8-0T
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 16:55:24 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83a32600-ceaa-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 17:55:22 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa69107179cso247553666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 08:55:22 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9060bccsm87855766b.22.2025.01.09.08.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 08:55:21 -0800 (PST)
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
X-Inumbo-ID: 83a32600-ceaa-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736441721; x=1737046521; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cAZUAQvOu49U0hMeCh88veBnObf9ztRSpbDykRVZvls=;
        b=tf+gYbMOB9Sx8iAXZHRAZi7xIGjU51SWxqjUUCztUdiLgMSS0XoNOzJH9PK7D5z3hL
         nt1KKSwIoOGsPIDix9YteBNcVAGVCuUJ3ulNE5Cz4ZZbUSBW00ipo6TonY9GKF4La5cv
         tfRUxt4d/O/DYxjxWCA5TBuRLT3v7W6y6ByIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736441721; x=1737046521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAZUAQvOu49U0hMeCh88veBnObf9ztRSpbDykRVZvls=;
        b=Mddsg9VDQqiMp9H696xP7ytZ/p7nilXGr5KrzDJWsb95RU47eGl1tW6KbBLhvMKJmM
         xRGFm0p/PtvkTVLGdobtMp96gLP89RcW1C9qco+Vbb8s+2NEZgaOI284DCnqSSKcOgwx
         5vO4q7vttUPKFmBFKw5Z+M4A2Yzuj0dpgMg9rCfceCX1migx+oPJjGrloSh3EElHLx4k
         PHOxWVMCebRaLmkrse5n8EeDVl9gqr1R1w/OQR6QYL0UkggwN/GKutX6T+GmRC3veUv3
         xgtHwblXRfJW2Dn5WwX8ok18c2p1ayS1bs9NJMRb9Iy/4L6RNfdenSSDeEZdF9U5n1vH
         7IBA==
X-Forwarded-Encrypted: i=1; AJvYcCWIYi/zF4TCN2kSvjA2XqrcidFLAxZS2JTPS+RfKk6Ja7As2frYQdpmKRBF1FQrOhCuH7Z5Gpc6HwI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaIjftoHgVq23yzTlLgXCWEzc3sagiEYxQs3i4NBkMGDpkRQeV
	6F2TX8v7OBSw7y/g9o2czuIK86k0In1Em4lNCnFYcuyxagMiuiiEhsIAB1uG6h0=
X-Gm-Gg: ASbGncsZ/7r4/6rtWS8aykQqD+7vONJEuJnMAj9/u1etCZx1UrMorDM0SoMIIk2scjs
	wwPBilbIruCz+YW6H7y3SksjDQeByp31oustDjs+eoEBDpkwlwZL8nkmdFgrJRZlssH0IyomQVP
	sGOqXWbVt6GyE3tAHrLGWduOLj1Eux42LJno5LLWQqbKeNBY714GFH0djZvOlHn1ytPoDAq1bNA
	6ssyONiUA1xgfbbTctI1g8kn6p88fbCNSJ5Z95KTuQfsnFN0tYGZmNbGPiDk8aJyeM=
X-Google-Smtp-Source: AGHT+IEPfaoIteOnCS1BZkrnCp2XmLg4coGnDJ6lEs9RhKv2NEsZx36bQjMcFZH/VY0iyaYox8xY1g==
X-Received: by 2002:a17:907:1c24:b0:aa6:85d0:1492 with SMTP id a640c23a62f3a-ab2abc6d423mr636122966b.37.1736441721609;
        Thu, 09 Jan 2025 08:55:21 -0800 (PST)
Date: Thu, 9 Jan 2025 17:55:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Anthony PERARD <anthony@xenproject.org>, qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen: do not use '%ms' scanf specifier
Message-ID: <Z3__eDp4hShe79Pl@macbook.local>
References: <20250107093140.86180-1-roger.pau@citrix.com>
 <20250107093140.86180-3-roger.pau@citrix.com>
 <Z3-sJMXpiFUoATHz@l14>
 <974ab6743d168d34babd458fe5e2e7766bb280b4.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <974ab6743d168d34babd458fe5e2e7766bb280b4.camel@infradead.org>

On Thu, Jan 09, 2025 at 11:25:13AM +0000, David Woodhouse wrote:
> On Thu, 2025-01-09 at 11:59 +0100, Anthony PERARD wrote:
> > 
> > >       char label[32];
> > >       XenDevice *xendev = NULL;
> > >       XenConsole *con;
> > > @@ -550,7 +551,10 @@ static void xen_console_device_create(XenBackendInstance *backend,
> > >           goto fail;
> > >       }
> > >   
> > > -    if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, "%ms", &type) != 1) {
> > > +    node_path = g_strdup_printf("%s/type", fe);
> > > +    type = qemu_xen_xs_read(xsh, XBT_NULL, node_path, NULL);
> > > +    g_free(node_path);
> > 
> > I feel like we want "xs_node_read()" which would be similair to
> > xs_node_vscanf() but would simply return the result of
> > qemu_xen_xs_read(). This would avoid the need format of the node path in
> > several place in the code. But it's OK like that as well.
> 
> If you look at the other callers of qemu_xen_xs_read(), it looks like
> the majority of them create the path with snprintf and then pass it in.
> Or with g_strdup_printf(), pass it in, then free it afterwards.
> 
> So perhaps qemu_xen_xs_read() should be a printf-style function too,
> with its last arg(s) being the node name.

I just went with Anthony suggestion and introduced xs_node_read(), as
I didn't want to play with qemu_xen_xs_read().  Not that I think the
suggestion is not valid, just seemed more work than what I wanted to
do right now.

Thanks, Roger.

