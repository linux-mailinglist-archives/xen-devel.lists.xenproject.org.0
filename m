Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C3F6D0436
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 14:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516677.801196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqx5-0002EW-Os; Thu, 30 Mar 2023 12:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516677.801196; Thu, 30 Mar 2023 12:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqx5-0002Bl-LR; Thu, 30 Mar 2023 12:00:23 +0000
Received: by outflank-mailman (input) for mailman id 516677;
 Thu, 30 Mar 2023 12:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X8Ok=7W=redhat.com=pabeni@srs-se1.protection.inumbo.net>)
 id 1phqx3-0002Bd-TK
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 12:00:22 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70a57118-cef2-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 14:00:19 +0200 (CEST)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-2Uk5yuQePL20CV_iUyLP4A-1; Thu, 30 Mar 2023 08:00:17 -0400
Received: by mail-qk1-f200.google.com with SMTP id
 pc36-20020a05620a842400b00742c715894bso8690860qkn.21
 for <xen-devel@lists.xenproject.org>; Thu, 30 Mar 2023 05:00:16 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-228-125.dyn.eolo.it.
 [146.241.228.125]) by smtp.gmail.com with ESMTPSA id
 4-20020a05620a048400b007468bf8362esm13619101qkr.66.2023.03.30.05.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 05:00:14 -0700 (PDT)
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
X-Inumbo-ID: 70a57118-cef2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680177618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y4kBL+83QToteVgKil7VO5tgjxZqNxgaDRNr3gcrywg=;
	b=eI/winFgXfLGgBtkD1h+Do6bZZ2a8HYRDY2rcunOI4PQrQXV4NxfxBG5zz0spcEkonXlsi
	uKRMj7mPVwsWW1MUejpVZt+4czrR3MEa01OfaDnTZqq1pknqipEKOLbIzyej4DvAl9+p/T
	fb0NkQB7jHbCl2xJIgdV1y//gYKJvq8=
X-MC-Unique: 2Uk5yuQePL20CV_iUyLP4A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680177615; x=1682769615;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y4kBL+83QToteVgKil7VO5tgjxZqNxgaDRNr3gcrywg=;
        b=ZOdu/r5NaVXpOjoaqTlMQp4hu5MsvKHsUsJNdoJRjWE9aekZI6bXzp9n4JbZaC37aF
         WmS7j0AV9WL5M5S2LYOYOnYnKjRiErhHfmy39SyRkBCvpuEfxqoiKuIFec7l/RyS3zU7
         lec/adZeZRN/EZq/PrjUEBNOyEz6mxevF8l3khhuebLeKqkGxHY3DKoN0aRJVsd4Xc/9
         c2XaKLSLz7lpz8u9QrqZlDrKnNLluXparhc5K+YvIEIn0hof+iXMEHjaMi3oqO59SZHr
         VV1NmZWJkKqp/dUBH+ctX1cCYNYDcSCqjH/FR/ZYSZxxEWJEVXfJtAzwZxAlEcJ/4rxH
         gtkw==
X-Gm-Message-State: AAQBX9dsqKlR5qWa+RgzOejlwT/IsZRkGY8zqVshUR1gB8odEo9S5I73
	LkEBDxEJ3+s37r0iGYowNYmX3Zxot/zdlXhmsBO1NBiLwQPmDkqUCh82cWbD6W6LfaIXI0qz/Wj
	D8hQBH1rmWVt8kBFuz7znAD5RfHI=
X-Received: by 2002:a05:622a:1815:b0:3e6:30c4:656f with SMTP id t21-20020a05622a181500b003e630c4656fmr3382248qtc.3.1680177615245;
        Thu, 30 Mar 2023 05:00:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZsHaKjIuC84GXaAXjkM9JM90iIamxuSWXB5xzRL6fwcpPAZ7ZkIYl8hCrmXXt/5ZFlO14V9w==
X-Received: by 2002:a05:622a:1815:b0:3e6:30c4:656f with SMTP id t21-20020a05622a181500b003e630c4656fmr3382202qtc.3.1680177614894;
        Thu, 30 Mar 2023 05:00:14 -0700 (PDT)
Message-ID: <4c10487da3a217bcfa9f5d7c515ab4a300c84949.camel@redhat.com>
Subject: Re: [PATCH v3] xen/netback: use same error messages for same errors
From: Paolo Abeni <pabeni@redhat.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  xen-devel@lists.xenproject.org, Jan Beulich
 <jbeulich@suse.com>
Date: Thu, 30 Mar 2023 14:00:11 +0200
In-Reply-To: <20230329080259.14823-1-jgross@suse.com>
References: <20230329080259.14823-1-jgross@suse.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, 2023-03-29 at 10:02 +0200, Juergen Gross wrote:
> Issue the same error message in case an illegal page boundary crossing
> has been detected in both cases where this is tested.
>=20
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

As this was intended to be part of:

xen/netback: fix issue introduced recently

I'm going to apply this one on net, unless someone screams very loudly,
very soon :)

thanks!

Paolo


