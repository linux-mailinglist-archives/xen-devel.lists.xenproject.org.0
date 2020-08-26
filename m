Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2772528C3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 10:02:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAqO2-0003cL-Fo; Wed, 26 Aug 2020 08:02:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6WbI=CE=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1kAqO0-0003c1-Qr
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 08:02:24 +0000
X-Inumbo-ID: 12c82d8d-d49d-4c20-b0b3-eb68e2d5acfe
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 12c82d8d-d49d-4c20-b0b3-eb68e2d5acfe;
 Wed, 26 Aug 2020 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598428942;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IceReS5urR7oxiq7JZofugZ7vn307giG56gUhEw1ORE=;
 b=Ybbs/zVESLcoN/uV0h6aia87sKEtvIqQzSzaMyZXkraPABonAPQ6by6uN72kQxI9dtBp07
 zChu+DYo126WOlQw1ejHEkY8uuXFTbP8b0wyYEwvTRsqLfsbXsZJn4ki65J3NF0bf7qfSc
 WpN09E6mMzzYJCXepZnUi5Cx+twf+nc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-P75ilBFRPW62gv7XD3LE8g-1; Wed, 26 Aug 2020 04:02:18 -0400
X-MC-Unique: P75ilBFRPW62gv7XD3LE8g-1
Received: by mail-wm1-f71.google.com with SMTP id b14so465085wmj.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2020 01:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+cLFL8yEdkBH3yow4+6ZbZvxrDo8zepFhkkyNnP2kg=;
 b=J/3jWWM/An53ao1a3KduZSxQn1CUaxNTn7fZ1KEVrmsnyrXPahKulcowBA4p2JcK+T
 OqTLUMQJgmb0n9oi4t6s3svjKuP1vYns0LYwss4cBIkdvIjNF5jQzmj77JG9ttNuoxG2
 z/cRnA/M5d1AQOHZcuObakqma1IGOn+Pi86VzWvM7wp1sHhF4znebqC85P2oPzAWIn+O
 Dyd+xoUIgqa6EVb2GiGCeBWMFg6IcmlAZ+YbJ/kuc/mZrDgsoaoua6JL9HyvMKCBNrdt
 7IopSV1R0aVwZXYIQFBr/BRaP89zZA4h+yqqPbnECsnZXmURfKiAwF+lROAUuyh+TKN1
 SWkQ==
X-Gm-Message-State: AOAM531jKswyOfbRHLXVMODahcoz0HzIUXK8XwNcRR3MGxbrY+Cj1quk
 jgzVbNDPJpvxr0AX6y9ajo4GSOU5EST26ysmY8Bsvxa6Ghh/62KASvtIo+SiztuJwBDLNTW0Tda
 8xWnzwTAqytDQ/2V32VkjhTOkGrE=
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr15309313wra.118.1598428937431; 
 Wed, 26 Aug 2020 01:02:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTUhdcIpNRU3VUvS4tp1AIY+Oz9N9C9qsavDdUBCjRbYqMLCYnQmaNkxYRTh7m6m1+LgttHA==
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr15309298wra.118.1598428937244; 
 Wed, 26 Aug 2020 01:02:17 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id o2sm3715968wrj.21.2020.08.26.01.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 01:02:16 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org,  qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,  haxm-team@intel.com
Subject: Re: [PATCH v3 62/74] [automated] Use TYPE_INFO macro
In-Reply-To: <20200825192110.3528606-63-ehabkost@redhat.com> (Eduardo
 Habkost's message of "Tue, 25 Aug 2020 15:20:58 -0400")
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-63-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 26 Aug 2020 10:02:15 +0200
Message-ID: <87y2m1ygvs.fsf@secure.mitica>
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
> Generated using:
>   $ ./scripts/codeconverter/converter.py -i --passes=3D2 \
>     --pattern=3DTypeRegisterCall,TypeInitMacro $(git grep -l TypeInfo -- =
'*.[ch]')
>
> One notable difference is that files declaring multiple types
> will now have multiple separate __construtor__ functions
> declared, instead of one for all types.
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v2 -> v3:
> * Removed hunks due to rebase conflicts:
>   hw/sd/milkymist-memcard.c hw/sd/pl181.c
> * Reviewed-by line from Daniel was kept, as no additional hunks
>   are introduced in this version
>
> Changes v1 -> v2:
> * Add note about multiple constructor functions to commit message
>   (suggested by Daniel)
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

[ I removed CC'd people, -ETOOMANYRECIPIENTS]

....

> diff --git a/migration/migration.c b/migration/migration.c
> index dbd4afa1e8..561e2ae697 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3844,10 +3844,6 @@ static const TypeInfo migration_type =3D {
>      .instance_init =3D migration_instance_init,
>      .instance_finalize =3D migration_instance_finalize,
>  };
> +TYPE_INFO(migration_type)
> =20
> -static void register_migration_types(void)
> -{
> -    type_register_static(&migration_type);
> -}
> =20
> -type_init(register_migration_types);
> diff --git a/migration/rdma.c b/migration/rdma.c
> index bea6532813..15ad985d26 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3942,13 +3942,9 @@ static const TypeInfo qio_channel_rdma_info =3D {
>      .instance_finalize =3D qio_channel_rdma_finalize,
>      .class_init =3D qio_channel_rdma_class_init,
>  };
> +TYPE_INFO(qio_channel_rdma_info)
> =20
> -static void qio_channel_rdma_register_types(void)
> -{
> -    type_register_static(&qio_channel_rdma_info);
> -}
> =20
> -type_init(qio_channel_rdma_register_types);
> =20
>  static QEMUFile *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
>  {

For the migration bits.

Reviewed-by: Juan Quintela <quintela@redhat.com>


