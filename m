Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6055F00C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 22:59:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357370.585858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6IIY-0004eB-21; Tue, 28 Jun 2022 20:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357370.585858; Tue, 28 Jun 2022 20:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6IIX-0004aj-UB; Tue, 28 Jun 2022 20:59:01 +0000
Received: by outflank-mailman (input) for mailman id 357370;
 Tue, 28 Jun 2022 20:59:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vcau=XD=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1o6IIW-0004ad-NH
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 20:59:00 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 217a2ed0-f725-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 22:58:59 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id c65so19301475edf.4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jun 2022 13:58:59 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-111-114.77.13.pool.telefonica.de.
 [77.13.111.114]) by smtp.gmail.com with ESMTPSA id
 d20-20020aa7ce14000000b00435d4179bbdsm10331687edv.4.2022.06.28.13.58.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jun 2022 13:58:58 -0700 (PDT)
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
X-Inumbo-ID: 217a2ed0-f725-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:references:message-id
         :mime-version:content-transfer-encoding;
        bh=VYyYVaguM9AiFz2TacfiRyojZpDmxjlgMkPeylJcdgQ=;
        b=mF8IcLcvwuMm6Be0+eyVflbaFtOrEUkx2oDWudB0rvhcP3nnoJpFFyJzqlgu1ouxTU
         PEt0871jMzuVjrOrpAC5V1HejZYdYGefXtzUK8HVxefBgJ/HQksV1wAnrdGRx7tnroOo
         0mzGEUhOYLweECH17El+RhxCDSlYQX3PxbrZvsK1Zg+3KLARmzs0yG+FpLjrINLjZVWR
         1YwxKYRoOmUs5Sy5MvGrziqRJi01v8gji08yCwY222RRt41gP27pA+ii6EjXFABzllXL
         0coiCUqWPcr92Td8O5ovc8NYErIo/adThn2kECuTfAwb0xqOVwktjcOrmpq13Kumanzp
         uG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=VYyYVaguM9AiFz2TacfiRyojZpDmxjlgMkPeylJcdgQ=;
        b=BKn1FS4Gs53NNb1Qe0N+iDg4ck23Zwv+P0vzAVdcKQPEOS6Lcet2Rbn93jcdhhN9Nc
         DkrENmZ6A8oGXVWym1cvgjoemHekGIbE233W3pfG+o6u3jxRSVYwbdSpwAkCKcmweIm+
         jMlp+iruNu3eP94c1hyZqZBtSlbxt6dlorH9IkSi+v8a2TLdqZGyy/8n7sUULz0nmsXz
         /a3gtnV+uqjXNjl+m5lpd0H+ENRdrSQaVcnq9ihLtMJtHM9wxzO0ehDaHcmtSEuMu3oy
         hUztQFE2WwK0Lxq0zcc0AwlMKQJy1VREzuWN+zQEnH1b3DvipmB/QHqT9Wi+jJSsVebJ
         gCeg==
X-Gm-Message-State: AJIora8c+mZuGxArZNL6it+PHhjVX0EBLYRs8RyIwhXKNm7yOkuWzDyQ
	OtLEiZtJQ8iUoa6hjSWlJ6M=
X-Google-Smtp-Source: AGRyM1s3dozt9bvArLV6A7D/jktCc2unZFpP4SoY0M8gCtHnEeirqTD4xhcTN6fkDmV7R6YoFH0EOQ==
X-Received: by 2002:aa7:d38e:0:b0:435:6785:66d1 with SMTP id x14-20020aa7d38e000000b00435678566d1mr25310422edq.393.1656449938552;
        Tue, 28 Jun 2022 13:58:58 -0700 (PDT)
Date: Tue, 28 Jun 2022 20:58:52 +0000
From: B <shentey@gmail.com>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
CC: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 0/2] Decouple Xen-HVM from PIIX
In-Reply-To: <20220626094656.15673-1-shentey@gmail.com>
References: <20220626094656.15673-1-shentey@gmail.com>
Message-ID: <D8EF825B-45A2-4DE5-A787-8FE7BE88D2E6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 26=2E Juni 2022 09:46:54 UTC schrieb Bernhard Beschow <shentey@gmail=2E=
com>:
>hw/i386/xen/xen-hvm=2Ec contains logic which is PIIX-specific=2E This mak=
es xen-hvm=2Ec depend on PIIX which can be avoided if PIIX logic was isolat=
ed in PIIX itself=2E
>
>
>
>Bernhard Beschow (2):
>
>  hw/i386/xen/xen-hvm: Allow for stubbing xen_set_pci_link_route()
>
>  hw/i386/xen/xen-hvm: Inline xen_piix_pci_write_config_client() and
>
>    remove it
>
>
>
> hw/i386/xen/xen-hvm=2Ec       | 17 ++---------------
>
> hw/isa/piix3=2Ec              | 15 ++++++++++++++-
>
> include/hw/xen/xen=2Eh        |  2 +-
>
> include/hw/xen/xen_common=2Eh |  6 ------
>
> stubs/xen-hw-stub=2Ec         |  3 ++-
>
> 5 files changed, 19 insertions(+), 24 deletions(-)
>
>
>
>-- >
>2=2E36=2E1
>
>
>

Hi Laurent,

would you like to queue this as well? Both patches have been reviewed at l=
east once, piix twice=2E Or would you rather keep the review period open fo=
r longer?

Best regards,
Bernhard

