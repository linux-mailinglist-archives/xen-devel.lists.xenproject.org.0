Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF976CC16F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515865.799153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9km-0001zl-Pl; Tue, 28 Mar 2023 13:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515865.799153; Tue, 28 Mar 2023 13:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9km-0001y0-M3; Tue, 28 Mar 2023 13:52:48 +0000
Received: by outflank-mailman (input) for mailman id 515865;
 Tue, 28 Mar 2023 13:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZWa=7U=redhat.com=pabeni@srs-se1.protection.inumbo.net>)
 id 1ph9kk-0001xs-Qp
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:52:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0623f00-cd6f-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 15:52:45 +0200 (CEST)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-w9lb66jMOy6vIbYMtvz_Qw-1; Tue, 28 Mar 2023 09:52:42 -0400
Received: by mail-qv1-f69.google.com with SMTP id
 e1-20020a0cd641000000b005b47df84f6eso5111365qvj.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Mar 2023 06:52:42 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-232-148.dyn.eolo.it.
 [146.241.232.148]) by smtp.gmail.com with ESMTPSA id
 s20-20020a374514000000b00746b2ca65edsm7102786qka.75.2023.03.28.06.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 06:52:41 -0700 (PDT)
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
X-Inumbo-ID: d0623f00-cd6f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680011563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lj+lqmXXS0BSikuA1TdKYzG9abofXGYmvsNuCdhCLz8=;
	b=FYIKUnu4O4fWwrwalTCOfjjHkXf12Ymk/4lVH5i13RoeyczFYSV6jc/Leig1EFYgTZJO3n
	AFwHzvCaOV3MnllS+uhFyIR7cWWf6jrE1Lm8R7ughNuf2BJxJKLahDGyWGx8BlubxkfcPZ
	JLDj4nR/MsvjHpY1oeAYuT+4WwQaQ6A=
X-MC-Unique: w9lb66jMOy6vIbYMtvz_Qw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680011562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lj+lqmXXS0BSikuA1TdKYzG9abofXGYmvsNuCdhCLz8=;
        b=b3wtNsSnz1rUi5U3d8dd8Osx7QciI+AhjuNvn1vJO2T2CZAVtL93kN66PA1xD1V37I
         meCvMn9DVoXwGdyg8t3UZYIhc065bWsXAG/G5c2hDKCyCFf/wM+hJ7BR13VzS9YtZxMW
         2ENscSnP+DHx3LsPtQtey4Ty2wPyEj55MATvqSEE4DXaZk3CwDgf2BkCU66AqfGDANnw
         ICDcfQgcNGg0hWVJV/G+tzZD91+5n7tzTFyr0oXP1+cPnVTLRjn2w4BgMW5L5lcKmV0P
         tz/j/VepdHVQnezU9nVcRfrocJN57qoK8qiUG6VtXkObuwe/QiseoazYs+AmPDOvGkwo
         sLyg==
X-Gm-Message-State: AO0yUKVmJRrIbSP8Lm0fhKBCCeNnN4E5C8CPBEH+ZT6KxySeJuLKy1+s
	GioluGQa3sI23rdszMtusop8UxHTDcwawtuIi5GLW4t44h0J+aLAC7msPpBHRXjDjcSDdbP/F3t
	SpZ7E8B6TAYEBEm0T+gJYaf0xQws=
X-Received: by 2002:ac8:5c49:0:b0:3e1:b2b4:f766 with SMTP id j9-20020ac85c49000000b003e1b2b4f766mr26805731qtj.5.1680011561956;
        Tue, 28 Mar 2023 06:52:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Nsnehld0v77wMMLYEKM1+leVknIUJ69BwExMVTazmwQLBmfGnLpDVN40nlnWtQr6AxhbgBA==
X-Received: by 2002:ac8:5c49:0:b0:3e1:b2b4:f766 with SMTP id j9-20020ac85c49000000b003e1b2b4f766mr26805706qtj.5.1680011561719;
        Tue, 28 Mar 2023 06:52:41 -0700 (PDT)
Message-ID: <da45f73bcc2642260ef7718a6650dc535cc05c86.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] xen/netback: fix issue introduced recently
From: Paolo Abeni <pabeni@redhat.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  xen-devel@lists.xenproject.org,
 stable@vger.kernel.org
Date: Tue, 28 Mar 2023 15:52:38 +0200
In-Reply-To: <20230328131047.2440-1-jgross@suse.com>
References: <20230328131047.2440-1-jgross@suse.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 2023-03-28 at 15:10 +0200, Juergen Gross wrote:
> The fix for XSA-423 introduced a bug which resulted in loss of network
> connection in some configurations.
>=20
> The first patch is fixing the issue, while the second one is removing
> a test which isn't needed. The third patch is making error messages
> more uniform.
>=20
> Changes in V2:
> - add patch 3
> - comment addressed (patch 1)

I misread the thread on v2 as the build_bug_on() was not needed and
applied such revision.=C2=A0

Please rebase any further change on top of current net.

Thanks,

Paolo


