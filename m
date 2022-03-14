Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4869B4D8C4B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 20:23:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290431.492537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTqHi-0001pT-4h; Mon, 14 Mar 2022 19:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290431.492537; Mon, 14 Mar 2022 19:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTqHi-0001nQ-1T; Mon, 14 Mar 2022 19:23:14 +0000
Received: by outflank-mailman (input) for mailman id 290431;
 Mon, 14 Mar 2022 19:23:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bxqh=TZ=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1nTqHg-0001ms-Qs
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 19:23:12 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 303c9231-a3cc-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 20:23:12 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id b15so17261696edn.4
 for <xen-devel@lists.xenproject.org>; Mon, 14 Mar 2022 12:23:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 sa13-20020a1709076d0d00b006ce3ef8e1d4sm7068524ejc.31.2022.03.14.12.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 12:23:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 117581FFB7;
 Mon, 14 Mar 2022 19:23:10 +0000 (GMT)
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
X-Inumbo-ID: 303c9231-a3cc-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=vwsEf23SGv9uU5Z5WKKS3nYhdclo4TxJUctKhcssOgU=;
        b=qvTNjBOvKwjtOKZE7TV+144NPqDHMdIuTMR2L4vLzrDFbF50W8MgId7xWklR7gQ7ee
         m1QhfAaSvZnLn66ax1xooADuhGrNNgCne1BBid6u3Gh0LdRB3DCFqDiSzHPBkvSQU7/1
         ARfBXBv6cFzOjaWh+JerzOI2v5WTvgqMRdwX3XRYHJOQ/bMo0EPsBvdMJlCcZ2qiedRE
         03E/08n9fH/SPMmg8wDKXE3wezITjh0Ku7x2GHRQJxOB28dnC8WtnI6ZBWinc58SZVuy
         SMn1h1Gw/QOgZrbW+ApQnfN+ZY7XwXBwNNPCZU9vR3Re+TkWn2jpxFHrOTbRTUk37cfE
         AgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=vwsEf23SGv9uU5Z5WKKS3nYhdclo4TxJUctKhcssOgU=;
        b=zfGDTR7XxIx7sIi8fQVGQsMwo/8MPScPxvIlaMiKo7r02Nrd6XFLGTIAQk0xn7zTbY
         puqDw8ODQET2t7BP8RR34zA2N9S5++hfDfWcIr2fEmLJ+e1PJoazlhavyDblLYe+4wob
         xj6s4T73e/s9w0J22UejksoEz76Y4Vw1InkIuSw3hkbak6SKNoV4RFCK2zSqxJ+IGGAd
         ygxavWQxM6cxxa91KCwED6oDoi3cOxtr8hWUA2+S7LdScKRZbZfukGr5R//vpozwuF24
         cpOriSy+3Ol5M3CJTaNMUKR5vh11AFvyCF+CE3BauxaBLIeGVz9wcHxAdAeVcbAyWLOH
         Sd+Q==
X-Gm-Message-State: AOAM5314TNyfabEbrPj8HTs4IgkZgpj53EcQcproxeaJ/UlW+gDISJ/C
	CVFSGs7bFNa9XtG0emDVCwNHIw==
X-Google-Smtp-Source: ABdhPJxcq//GLw34w34R/ZbAznfxC0Uo39AL2FcFmtAlAOmZNvx3LMgnwn1d/9NJkypRc95UVUwxTA==
X-Received: by 2002:a05:6402:b42:b0:415:e6e7:65aa with SMTP id bx2-20020a0564020b4200b00415e6e765aamr21292242edb.105.1647285791693;
        Mon, 14 Mar 2022 12:23:11 -0700 (PDT)
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-3-armbru@redhat.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Laurent
 Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Corey Minyard <cminyard@mvista.com>,
 Patrick Venture <venture@google.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Jean-Christophe
 Dubois
 <jcd@tribudubois.net>, Keith Busch <kbusch@kernel.org>, Klaus Jensen
 <its@irrelevant.dk>, Yuval Shaia <yuval.shaia.ml@gmail.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>, KONRAD Frederic
 <frederic.konrad@adacore.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth
 <michael.roth@amd.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Pavel
 Dovgalyuk <pavel.dovgaluk@ispras.ru>, David Hildenbrand
 <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>, Colin Xu
 <colin.xu@intel.com>, Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk
 <reinoud@netbsd.org>, Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia
 Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, John Snow <jsnow@redhat.com>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH 2/3] 9pfs: Use g_new() & friends where that makes
 obvious sense
Date: Mon, 14 Mar 2022 19:23:04 +0000
In-reply-to: <20220314160108.1440470-3-armbru@redhat.com>
Message-ID: <87ee345of5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Markus Armbruster <armbru@redhat.com> writes:

> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>
> This commit only touches allocations with size arguments of the form
> sizeof(T).
>
> Patch created mechanically with:
>
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
>
> Except this uncovers a typing error:
>
>     ../hw/9pfs/9p.c:855:13: warning: incompatible pointer types assigning=
 to 'QpfEntry *' from 'QppEntry *' [-Wincompatible-pointer-types]
> 	    val =3D g_new0(QppEntry, 1);
> 		^ ~~~~~~~~~~~~~~~~~~~
>     1 warning generated.
>
> Harmless, because QppEntry is larger than QpfEntry.  Fix to allocate a
> QpfEntry instead.
>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

