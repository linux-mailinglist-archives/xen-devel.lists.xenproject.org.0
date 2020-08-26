Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B772528F3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 10:09:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAqUV-0003xg-KG; Wed, 26 Aug 2020 08:09:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6WbI=CE=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1kAqUU-0003xb-3Y
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 08:09:06 +0000
X-Inumbo-ID: 64a25817-2e5f-40d4-a635-14fdf45d0c34
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 64a25817-2e5f-40d4-a635-14fdf45d0c34;
 Wed, 26 Aug 2020 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598429345;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLP42d08jlqtDdnGGiR1ac66izB7N8sAvplYxoFxlws=;
 b=YncmLgeSCS3MEPWvE8yKY+nH17jSaIcGymCg7fkTmDYf1bv6FZdWJNzjvZHoIHEzR2tY0Q
 BIv4A3437p6d/iwGyfLy1D/VwjLHoTpH6i9vv3C7AW9Ng6mR7aQzFfq8GiVh5aUlmx+ahS
 OSP/poPoH0+4lgMJsTmAzCLZ4tBF8Zc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-ljbUGZZFNGCFIq2M9cuKGg-1; Wed, 26 Aug 2020 04:09:03 -0400
X-MC-Unique: ljbUGZZFNGCFIq2M9cuKGg-1
Received: by mail-wm1-f69.google.com with SMTP id b14so470521wmj.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2020 01:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLIsu+nEc3aBl1VyG4Sd867PXkn1bWp9ManfPK6FPHs=;
 b=bJwnIqgAbJwMTxQJoOV3TLh8jUITSlzqWRqiIPhOliM7Knqv0WH+4lvtvXTa/18OuQ
 VCI9HeN4k+xZlXTMC8x/D9nU99I7AJE1qy9BaTXaa40zYkSxCxRBRyqdLbpEYDAvLULC
 92s5/dqOzTBsPwzlP76mlJ2crAGrzX73IyQJAPcvHzOOX1M9gjVackyJmbUX91pa1JCr
 UIVgZkwh76oWHc/KRf5GXR7o2XnWLy0S1Os+3HPYiWMlvvafkeQuatVEIUmetPywhVJY
 vEj4BqPDXoHVWwg6GK341AxLrPOXjaVXw+JPHJexiCvvz1EmrhrDXahS4/Xa9UepL5Me
 6Lzw==
X-Gm-Message-State: AOAM531jV2SE//LUpCHLpB2AVxvaMyZEDTvjhArGM8fS+flfpmdoi52l
 MIqjy9i5jh0lSypr7H/7povhO4QEZyhaIWpJaMDBzj3bS5RXccDJHHELXGOgBMmBNeJR7UEBWXy
 pC6QChNvahh99AX1ZUJkLSQVFD1I=
X-Received: by 2002:adf:9e8d:: with SMTP id a13mr13566866wrf.94.1598429341765; 
 Wed, 26 Aug 2020 01:09:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT9BIXEipC0KHHms1/LKk2MRcW/qT6UlqJ2yHzgxQ4Cz3Ybar/ud7Phbq6goZoBDpiyvRYng==
X-Received: by 2002:adf:9e8d:: with SMTP id a13mr13566848wrf.94.1598429341511; 
 Wed, 26 Aug 2020 01:09:01 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id z9sm3613141wmg.46.2020.08.26.01.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 01:09:00 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 66/74] [automated] Use DECLARE_*CHECKER* macros
In-Reply-To: <20200825192110.3528606-67-ehabkost@redhat.com> (Eduardo
 Habkost's message of "Tue, 25 Aug 2020 15:21:02 -0400")
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-67-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 26 Aug 2020 10:08:59 +0200
Message-ID: <87ft89ygkk.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: quintela@redhat.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Eduardo Habkost <ehabkost@redhat.com> wrote:
>  $ ./scripts/codeconverter/converter.py -i \
>    --pattern=3DTypeCheckMacro $(git grep -l '' -- '*.[ch]')
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v2 -> v3:
> * Removed hunks due to rebase conflicts:
>   hw/arm/integratorcp.c hw/arm/versatilepb.c hw/sd/pl181.c
>   include/hw/ppc/xive.h
> * Reviewed-by line from Daniel was kept, as no additional hunks
>   are introduced in this version

[Dropeed CC'd]

...

> diff --git a/migration/rdma.c b/migration/rdma.c
> index e3eac913bc..87cb277d05 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -399,8 +399,8 @@ typedef struct RDMAContext {
> =20
>  #define TYPE_QIO_CHANNEL_RDMA "qio-channel-rdma"
>  typedef struct QIOChannelRDMA QIOChannelRDMA;
> -#define QIO_CHANNEL_RDMA(obj)                                     \
> -    OBJECT_CHECK(QIOChannelRDMA, (obj), TYPE_QIO_CHANNEL_RDMA)
> +DECLARE_INSTANCE_CHECKER(QIOChannelRDMA, QIO_CHANNEL_RDMA,
> +                         TYPE_QIO_CHANNEL_RDMA)
> =20
> =20
> =20

Reviewed-by: Juan Quintela <quintela@redhat.com>


