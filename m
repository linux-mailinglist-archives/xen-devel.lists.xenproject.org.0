Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342492528DF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAqR6-0003kz-WF; Wed, 26 Aug 2020 08:05:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6WbI=CE=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1kAqR5-0003ks-EE
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 08:05:35 +0000
X-Inumbo-ID: b1790286-ad5a-4b4c-8aa3-de145140f26e
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b1790286-ad5a-4b4c-8aa3-de145140f26e;
 Wed, 26 Aug 2020 08:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598429133;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFDWzhffgHT0QS8qC9AD7o9JYYlIaLMf7gtouYw5uzA=;
 b=jVKMk8fzn4RHI+ljAUw7Fkaz3MOpkAgqO70VTT8IpEOWGczypb5PtMhjjsMLdN0kwOeywG
 co2f2vRBrzhCI68s4DD6zRyGBbDPEbWBVonrb+aNXK/KNAJtQKP1dyaRMkTsEa09kFnQzP
 3Bz7dk3MHGPCZSn6s4G4XDuAUiOEwXM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-U2MU0v2JM6u1l3dwxR5GYw-1; Wed, 26 Aug 2020 04:05:31 -0400
X-MC-Unique: U2MU0v2JM6u1l3dwxR5GYw-1
Received: by mail-wr1-f70.google.com with SMTP id u10so235637wrp.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2020 01:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NImKQq5ezsHefkpdy9SfbA9+4hFpj3XxE5AoedYCYBg=;
 b=NSzsfm6x/I+KWeyZOTspJHk0c+aRnd8xQqA0UbXmbxnSW83MaVv84po+1Zof5A8NyQ
 vCIv+Gkh8D/kDtFNVU/6ulUej0uMBzuMrKfi1dy6mA25DcpwinfNZjdeOXRGOKp9bnl3
 V5KIk8Q3pmcPzC95A7KkYb6Ey624j2MKNGLgZuTcyKsQGICex0S9zO9cz157e52hUUlP
 B9yf7X51w2eMdkFkNepD6IBA5zckWXJe9eSxVJOgzDUO+rTTHMO6IC2WcjUZ2VDgL1Va
 NyyCVFmXp9pgtoyx33nMMLoTDy1Neq5mjBsm2WdMPXK0a4tVowKhe3kYu7Iixuv8xGom
 D9hQ==
X-Gm-Message-State: AOAM530zG4ch3AOCpe+JcRucjJcIjUx7L/zPKi7YONQUkMPdh4jweE5v
 3ouCYhjwXmvHJDqaQt2e/VoFM3vyf2MZP4DuCljmTxpfg3Dvvnbx5I1tIZItmmvFBdaPA0YqLe6
 B9tcD3ywlaeQOS7JmkIoZqbty8Tg=
X-Received: by 2002:adf:eec4:: with SMTP id a4mr14022205wrp.325.1598429130568; 
 Wed, 26 Aug 2020 01:05:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgV0qEJw4SvfJJWICezdAreWgvFDuo0MZfhubnxoYYQuYepB/xRHiBkFBXO890vClnc3da7Q==
X-Received: by 2002:adf:eec4:: with SMTP id a4mr14022174wrp.325.1598429130323; 
 Wed, 26 Aug 2020 01:05:30 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id d11sm4063512wrw.77.2020.08.26.01.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 01:05:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
 qemu-block@nongnu.org,  qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,
 kvm@vger.kernel.org,  xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 64/74] [automated] Move QOM typedefs and add missing
 includes
In-Reply-To: <20200825192110.3528606-65-ehabkost@redhat.com> (Eduardo
 Habkost's message of "Tue, 25 Aug 2020 15:21:00 -0400")
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-65-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 26 Aug 2020 10:05:28 +0200
Message-ID: <87o8mxygqf.fsf@secure.mitica>
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


[dropped people from CC]

Eduardo Habkost <ehabkost@redhat.com> wrote:
> Some typedefs and macros are defined after the type check macros.
> This makes it difficult to automatically replace their
> definitions with OBJECT_DECLARE_TYPE.
>
> Patch generated using:
>
>  $ ./scripts/codeconverter/converter.py -i \
>    --pattern=3DQOMStructTypedefSplit $(git grep -l '' -- '*.[ch]')
>
> which will split "typdef struct { ... } TypedefName"
> declarations.
>
> Followed by:
>
>  $ ./scripts/codeconverter/converter.py -i --pattern=3DMoveSymbols \
>     $(git grep -l '' -- '*.[ch]')
>
> which will:
> - move the typedefs and #defines above the type check macros
> - add missing #include "qom/object.h" lines if necessary
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v2 -> v3:
> * Removed hunks due to rebase conflicts: hw/arm/integratorcp.c
>   hw/arm/versatilepb.c hw/arm/vexpress.c hw/sd/pl181.c
>   include/hw/ppc/xive.h
> * Removed hunks due to conflicts with other patches in this
>   series: include/hw/block/swim.h include/hw/display/macfb.h
>   include/hw/rdma/rdma.h migration/migration.h
>   target/rx/cpu-qom.h
> * Reviewed-by line from Daniel was kept, as no additional hunks
>   are introduced in this version
>
> Changes v1 -> v2:
> * Re-ran script after moving a few macros and typedefs.  Now the
>   patch also changes:
>   - SysbusAHCIState at hw/ide/ahci.h
>   - VhostUserGPU at hw/virtio/virtio-gpu.h
>   - I8257State at hw/dma/i8257.h
>   - AllwinnerAHCIState at hw/ide/ahci.h
>   - ISAKBDState at hw/input/i8042.h
>   - PIIXState at hw/southbridge/piix.h
>   - VFIOPCIDevice at hw/vfio/pci.h
>   - missing include at hw/net/rocker/rocker.h
>   - missing include at hw/scsi/mptsas.h
>   - missing include at include/hw/arm/pxa.h
>   - missing include at include/sysemu/kvm.h
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

> diff --git a/migration/rdma.c b/migration/rdma.c
> index 15ad985d26..e3eac913bc 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -35,6 +35,7 @@
>  #include <arpa/inet.h>
>  #include <rdma/rdma_cma.h>
>  #include "trace.h"
> +#include "qom/object.h"
> =20
>  /*
>   * Print and error on both the Monitor and the Log file.
> @@ -397,10 +398,10 @@ typedef struct RDMAContext {
>  } RDMAContext;
> =20
>  #define TYPE_QIO_CHANNEL_RDMA "qio-channel-rdma"
> +typedef struct QIOChannelRDMA QIOChannelRDMA;
>  #define QIO_CHANNEL_RDMA(obj)                                     \
>      OBJECT_CHECK(QIOChannelRDMA, (obj), TYPE_QIO_CHANNEL_RDMA)
> =20
> -typedef struct QIOChannelRDMA QIOChannelRDMA;
> =20
> =20
>  struct QIOChannelRDMA {

Reviewed-by: Juan Quintela <quintela@redhat.com>


