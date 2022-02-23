Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C154C154B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 15:22:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277381.473853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMsWg-00031S-EZ; Wed, 23 Feb 2022 14:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277381.473853; Wed, 23 Feb 2022 14:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMsWg-0002yO-9h; Wed, 23 Feb 2022 14:21:54 +0000
Received: by outflank-mailman (input) for mailman id 277381;
 Wed, 23 Feb 2022 14:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMsWe-0002yI-7C
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 14:21:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f039b7e6-94b3-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 15:21:49 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-1uSaRqjlPDCnrPYpNyqmXw-1; Wed, 23 Feb 2022 15:21:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7526.eurprd04.prod.outlook.com (2603:10a6:20b:299::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 14:21:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 14:21:46 +0000
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
X-Inumbo-ID: f039b7e6-94b3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645626109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9mErHoWBNXlU4c6ehoUvC5L0ONmTsuIw67G/LF2Lo4=;
	b=KU4omN5QrJKh3oMDMJyG8uwISFn1wpEq6rGoWp3kcX84pRWjAkM6mbUoBj+RkPuxh0PQhD
	atmvX7dlLUS8kvHbeH9WKxO+NQueN6xlPNHnHBG5HmMxPLivY34Xakj+LqzUcQ2VgTtxvV
	aUV9nqy9TOH7LYuxEOiq3nFtnVSf9PQ=
X-MC-Unique: 1uSaRqjlPDCnrPYpNyqmXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJY8aa4C4ZdvCoQT2oUJbd394hd+HhfgLn1LAgBZMDGpc5UsCAybi8P0BRE9K/9wjd54DoZzLedu0piccxc5X7HLqVCuWdMRbC6EJa+H8acVRwWNKmI5Xn6VAYLs4qL4GNmWbRRGaQHLzN7YyqoGp3TsIl8gTTMNnCPT8NsAPJ232JaTvWmg8+th56Z7ocvOHf0ElI6hEDd3R63Zx+PR6VgurK+hRAekOuCAYJooBSuBmc36V8TvlOiWgNQ6zYfKgdDMNuTXLXbFa6eeMig39+uplPROIaSj4IfKbu0RhsbgKzZmBtowE0rJcLYL8ZWcclZiGHQ2PVvCi/mq9u+cNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej7z5zi7D8K89Nvw/xyrnIcxV2VEYFlVY6IgcY0QquQ=;
 b=egpuUz21ggxuXZzpx6/sKQ89NumcHlTYxOCAWBIHIU/dZQQZlEdS4g4uEzalfD3abi0s/j0x52WlVmqkUhT1rk19/tNpgMDMq4y8GKBVfLGTw+Y22w7IlX9IkuLco+uGeJa0dk48ULI1GNIbL0C4aGfrvXqO8hNSXFQIAO5TyJOWneyFj95pyQLJiDrWwx1uiF9lKi0Rep9TkJ22+5VvZoBtqBuMMBHxeV4dQ1fs0ry+nQZzsRYtFx9pNuqlDw/Za6Iof9RtIZK1Z4WbHilzzgZCXOT5QZIzeEo8tFsM2TIIMQrT5Z2/Xf98Kh+r12HXLepjuYrWBkQtXnYl7EbgTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d376a457-ef35-4fcb-38d9-d495b385fb65@suse.com>
Date: Wed, 23 Feb 2022 15:21:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 59/70] x86: Use control flow typechecking where
 possible
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
 <20220222152645.8844-14-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220222152645.8844-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P250CA0009.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed4196e6-30be-4330-9147-08d9f6d7d25e
X-MS-TrafficTypeDiagnostic: AS8PR04MB7526:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB75269032987840F929AC62E8B33C9@AS8PR04MB7526.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NUlBoZAkvbBNpRVCDLXQAXkAU4PFRd1TcB5FUZ4qF87a2ei2U0z0x3hc5DFuuZHwh9T6VDKX/FHi1YVfk8H7Py9vQBzlHvrl1OIp6P47sKGYNVG/We5erPIi8R2vmvROvCXNQKQp4wUS7qQ+qSiflER/asge1iq2ybLl5lp8ihvvYm5d964Ob/qX4blFKdlxbcMKTbiEVjSvTp7lFq1LunuGg12wdvDXc0xhrKncmt9koapEaj6RSHwA9F0m3/Nm1bymJhf97nucpT6GKNpkvzvnGB/XVF/sjM3wS2sSw3mDR4Xytw21g1iJIUL/n4Pgju8Kf/CUm/lzNhMDk/fWS0pxNLxtYvoU2UyElWqCh5/jMd03oGXA6plWP5wPYUcxYyAVIdPhzuKfcNB5rB9zpGSu9tj/oBoUcBi4ko2uD/Q2m5/MFHb3aAp0p3u+EDFJpck7Ra/yTZTSK2aDdhiV4kw4mmuvhn7dLbb2gTSElMemr0Z2CAYYLTYYlkpMzGexZJvNwVgqODi//FjLVIZoZ6sG1oo8IUr8w5sZ38q6V7VOIAeKzyYpbDJaw4SVsp6WMxgxy08c3pKKvu9zeQIEcQ1mdkF0w28e4cFjN5+642PM3XXCVu5cZ3JrZUfW2gp9pZUKGWiQwZ5/Juct1iybF6qT0zdLHJH+lJ6yKQPeO6lD/Npnf4sv3UPZTl4U0izj7PLFy+ZkfeJLJtA7uw1KR7vHl4qloOWTpU58HZIrobtawDtvEhutaURVBHyYOLPDkkovMAPqrj9BR8ovY3iIaZijk1vpAjsDvpV7nRmU+QDbgun44c/9iC8vkp+DSOea
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(4326008)(8676002)(508600001)(31696002)(86362001)(316002)(54906003)(6916009)(66476007)(66556008)(966005)(6486002)(5660300002)(31686004)(38100700002)(2906002)(8936002)(186003)(26005)(6512007)(6506007)(83380400001)(2616005)(53546011)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NiVDPauOCakg9UQBPMvPplEPJPqxHZM33pnOBr1uiEST/X6fTr+x1LDULIqc?=
 =?us-ascii?Q?MIkvLPMEvMDVVlIZaPDaWo5B7uDdILikFjTF2gfebP6a3nbpDh4kp3EcaNql?=
 =?us-ascii?Q?4IzokIyQ3dNZoWgmwGFgP1QMg30mya7CQyZypr0YwYYD8l4KSCfi7ROo0o8B?=
 =?us-ascii?Q?iZPFCjKrB68pf5oUuM4CnTDPO3jl/mmVPU1Q8sQ45wVqsr8ODmAAlwpPYxwZ?=
 =?us-ascii?Q?f002qcPCwkAoUTWT78opN45XzQfJb7W/YJ8O1hpUA7Hbm3LklUVOXAmSLaNs?=
 =?us-ascii?Q?JOAP7iNm4dmjAKwkknjfOwQkvI/fImEzqnqxUzpXhQRuAO2e3RQSFTd1f9fs?=
 =?us-ascii?Q?XKmTK0HNhxnVbfaDmFGq0yEKSdrenW4aZBWxCxoFnMsX2tuHCTaIYvCZdr1X?=
 =?us-ascii?Q?iNrKNHm7lR7Gu40Ij/XgzVq6113UpI2qKPNXSyN/g3/ARCh1TBlfloujSlgm?=
 =?us-ascii?Q?IDdra8aJrid+PaCCDENoAlOu2fx/Yr0Zv64Pl4xNBJ1itY1F8u4obFiGhCLC?=
 =?us-ascii?Q?LFVbXTBqXflA/kSPCGIQ9WQPGBuzPDpH73pJg086VBznhP6ayI9LEaLGNmKP?=
 =?us-ascii?Q?QU3pdyqzIo8LqkM/gFRGjv1nZu68tLzJwmKwnYITquX/5dcji4I+emOT3fxK?=
 =?us-ascii?Q?amq0YThr/MIUiQcTQQqMYpafus+oCY7VIt+RP9CVYtO2ZMgCWi3XA2Ccr1Rn?=
 =?us-ascii?Q?AHf9gPTaqQCstSKVjb/PSWyl5BrpI3mwjhmdU6lYG5mdwTOq+HNT4s4bOKeH?=
 =?us-ascii?Q?TC8UW7JsowiCAo4uQV9lA7azr4lwQ5ueIY0luiFfXk0eCCAb0ISDlwdQq5FS?=
 =?us-ascii?Q?nsdbN95u/sRsCzxZoWwDj9YfPdfMPQz4MzP0rVeOZ13afDD5bVyY1klpEUv4?=
 =?us-ascii?Q?jq+1yicqC1r8ICdhUahfH2LZ0uxbDHCtiOIt9QtWBpOYMQoTu8wZHAjX6N7K?=
 =?us-ascii?Q?eKOCznzF72EW8oDoXVAH3bmhPWggevj3LnYkoYwog4B+V6DhjEXMdkvXDjAt?=
 =?us-ascii?Q?WEQDOr/+bxtd0x/hXsPGjiCltssI2n0jsmOWr1Rj1saL9Uni2eksqZFsBuMh?=
 =?us-ascii?Q?97+LbOgdzNmW92SyztqJ/d/PAenZAzDFPzpMkby7RaAUDDtqEpQf9Owulv27?=
 =?us-ascii?Q?lYw9EJ/Oj1U/laxd/jGj4Y6IP0ehlCZ0kgVd/klk5x/lDYNOz6B6ELQxW+4/?=
 =?us-ascii?Q?AXfRc103MhS3LtuEU9CnNdo8s948xQFPWJ38k9xAjuukKuukT9izG6VdtoLl?=
 =?us-ascii?Q?V8Hv2tyhGnMD2NxcLb20b3ZJrjyvpyWCywpvjwsozGzI5MjtRUJ2kEvqMFoe?=
 =?us-ascii?Q?UNF29GeTuMLD621zXlTThC84h8svgZU/dyaBzZWQ8jKjk/Lt63u1VASSLkY7?=
 =?us-ascii?Q?QHVxumXhhTXjgqWRolhMVtSa5iA7TAMpXt+SB33E2GMbM+SCfy6m40POsl0/?=
 =?us-ascii?Q?dry8Uflq8b6oPOU81h2lI5vsolrN5b7bhkQRH87oRSzDUN15zRLIEmadyg3G?=
 =?us-ascii?Q?m1ToZ/59yaJQPpl63LPxSnrC0VaL2qJd7b3RpUUBuVPiW3wLuP/CntZQW7I1?=
 =?us-ascii?Q?e7oItf6GaGi/9hBXv0w1av7hBFySrqSkHQgCKqdJ7ILXoo1YQkCNpfJyB1AS?=
 =?us-ascii?Q?IqPsJptaY/iBz4BS056pdDk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4196e6-30be-4330-9147-08d9f6d7d25e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 14:21:45.9012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsrwQ/pj663YwpH/wG/1wKorILUbZQr55JG3a2qiVB5AcXAwziY3WGr/QfUmzozcAgdRnWIA33TVRQsHXDnQ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7526

On 22.02.2022 16:26, Andrew Cooper wrote:
> Now all callees have been annotated, turn on typechecking to catch issues=
 in
> the future.
>=20
> This extension isn't in a released version of GCC yet, so provide a conta=
iner
> to use with the extention included, and add it to CI.  RANDCONFIG is nece=
ssary
> because some stubs for compiled-out subsystems are used as function point=
er
> targets.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I certainly see that we will want to have this extra level of safety.
Hence feel free to add
Acked-by: Jan Beulich <jbeulich@suse.com>

But I'd like us to form a plan in case the change doesn't get committed
relatively soon after gcc re-opens for general development after gcc12
was branched off. We don't want to get into the position of needing to
maintain a gcc patch. Do you have any insight as to what is actually
blocking the committing of that change, seeing that it has been around
for a while?

Jan

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>=20
> v3:
>  * Provide container.  Already pushed to Gitlab.
> ---
>  automation/build/debian/buster-gcc-ibt.dockerfile | 66 +++++++++++++++++=
++++++
>  automation/gitlab-ci/build.yaml                   |  6 +++
>  automation/scripts/containerize                   |  1 +
>  xen/arch/x86/arch.mk                              |  1 +
>  4 files changed, 74 insertions(+)
>  create mode 100644 automation/build/debian/buster-gcc-ibt.dockerfile
>=20
> diff --git a/automation/build/debian/buster-gcc-ibt.dockerfile b/automati=
on/build/debian/buster-gcc-ibt.dockerfile
> new file mode 100644
> index 000000000000..441d9a9ab37a
> --- /dev/null
> +++ b/automation/build/debian/buster-gcc-ibt.dockerfile
> @@ -0,0 +1,66 @@
> +FROM debian:buster-slim AS builder
> +
> +ENV DEBIAN_FRONTEND=3Dnoninteractive
> +ENV USER root
> +
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        bison \
> +        build-essential \
> +        flex \
> +        libc6-dev-i386 \
> +        libgmp-dev \
> +        libisl-dev \
> +        libmpc-dev \
> +        libmpfr-dev \
> +        patch \
> +        wget
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +RUN wget -q https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz -O =
- | tar xJ --strip=3D1
> +RUN wget -q https://xenbits.xen.org/people/andrewcoop/gcc-11.2-Add-fcf-c=
heck-attribute-yes-no.patch -O - | patch -p1
> +RUN ./configure \
> +        --prefix=3D/opt/gcc-11-ibt \
> +        --enable-languages=3Dc \
> +        --disable-nls \
> +        --disable-threads \
> +        --disable-bootstrap \
> +        --disable-shared \
> +        --disable-libmudflap \
> +        --disable-libssp \
> +        --disable-libgomp \
> +        --disable-decimal-float \
> +        --disable-libquadmath \
> +        --disable-libatomic \
> +        --disable-libcc1 \
> +        --disable-libmpx
> +RUN make -j`nproc` && make -j`nproc` install
> +
> +
> +FROM debian:buster-slim
> +COPY --from=3Dbuilder /opt/gcc-11-ibt /opt/gcc-11-ibt
> +
> +LABEL maintainer.name=3D"The Xen Project" \
> +      maintainer.email=3D"xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=3Dnoninteractive
> +ENV USER root
> +ENV PATH=3D"/opt/gcc-11-ibt/bin:${PATH}"
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        bison \
> +        checkpolicy \
> +        flex \
> +        gawk \
> +        make \
> +        python3 \
> +        && \
> +        apt-get autoremove -y && \
> +        apt-get clean && \
> +        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build=
.yaml
> index fdd5c76582b3..cc36428cf55b 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -294,6 +294,12 @@ debian-stretch-32-gcc-debug:
>    variables:
>      CONTAINER: debian:stretch-i386
> =20
> +debian-buster-gcc-ibt:
> +  extends: .gcc-x86-64-build
> +  variables:
> +    CONTAINER: debian:buster-gcc-ibt
> +    RANDCONFIG: y
> +
>  debian-unstable-clang:
>    extends: .clang-x86-64-build
>    variables:
> diff --git a/automation/scripts/containerize b/automation/scripts/contain=
erize
> index 7682ccd34759..8992c67278ae 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -33,6 +33,7 @@ case "_${CONTAINER}" in
>      _focal) CONTAINER=3D"${BASE}/ubuntu:focal" ;;
>      _jessie) CONTAINER=3D"${BASE}/debian:jessie" ;;
>      _stretch|_) CONTAINER=3D"${BASE}/debian:stretch" ;;
> +    _buster-gcc-ibt) CONTAINER=3D"${BASE}/debian:buster-gcc-ibt" ;;
>      _unstable|_) CONTAINER=3D"${BASE}/debian:unstable" ;;
>      _trusty) CONTAINER=3D"${BASE}/ubuntu:trusty" ;;
>      _xenial) CONTAINER=3D"${BASE}/ubuntu:xenial" ;;
> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
> index f780c912a9cf..92fd19811013 100644
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -54,6 +54,7 @@ endif
> =20
>  ifdef CONFIG_XEN_IBT
>  CFLAGS +=3D -fcf-protection=3Dbranch -mmanual-endbr
> +$(call cc-option-add,CFLAGS,CC,-fcf-check-attribute=3Dno)
>  else
>  $(call cc-option-add,CFLAGS,CC,-fcf-protection=3Dnone)
>  endif


