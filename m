Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF92674362E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 09:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557346.870619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF8sc-00019o-JA; Fri, 30 Jun 2023 07:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557346.870619; Fri, 30 Jun 2023 07:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF8sc-000180-G7; Fri, 30 Jun 2023 07:49:22 +0000
Received: by outflank-mailman (input) for mailman id 557346;
 Fri, 30 Jun 2023 07:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DkL4=CS=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1qF8sa-00017u-Rb
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 07:49:20 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e56c893-171a-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 09:49:19 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 07:49:16 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::4ef5:2244:743b:9989]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::4ef5:2244:743b:9989%4]) with mapi id 15.20.6521.023; Fri, 30 Jun 2023
 07:49:16 +0000
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
X-Inumbo-ID: 9e56c893-171a-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hl9dQtdTJaqwaW2P0d3lFKTCW7yt04RELzgD8VGFV8Vpg4z72kDBtVCRALLxnV38pzS0OkT+ZYCbGdnCgRYRNsEJ8x0kDMebIi0OuOIXF+rfrhjD4/Lc9OXWBAj+b1ZhpjAxAkknvEfDXg5sXhKcdywuci1Crby6aOF1J4D/mtqlRHBjCHJQoC3z0NSXXw8iY8BcG5roQcmbSQy6r6atfoAivdb4UhIyqkOuolEjx8IWaGVc0AV6/85TlgxvzmtWiW0SFszuIgl+ZmT4Nx/u+fOPv2gKbeXh2TQQpV6rNkMQgs0+Z2QILQMgqJEHEaQhZkpUSGeytU9D2R4ht5NMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtInnFJqOyslEA8NEIBnpvOKVL1G0FRZKRX4Po5/E60=;
 b=A3lo5L+jrmFyGLvLbXaVJ0IbN3zVe3dNI6LHqGzAQnzLi5IoZB5s3ZdpDtaSevNJuXnoBm2JK0j6LKuG8p+iW76YHitdpXz32/6+NIBgXYYgR/U6YNFl1cDc/zPBA1Mz8rwAYQyHQY7igmxqn+Jn83O0o8qSm9AiyiNpUATnYJR42LoGxzsBwsgVDwrjn7WlFNyXlZj8gM8WVhxQOCc89Q79DlD0hnjct1Vmucub7ttlLv7DdiMarPAqEgoekrkV86fjFowjP9dgpi0FiWlMzalb321Q70SakiV2Z4WCxnrFtHlvl9B/xTauUeaI1PbCCmGcr086AnVjzjFDb462Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtInnFJqOyslEA8NEIBnpvOKVL1G0FRZKRX4Po5/E60=;
 b=4JynHim+2KQuC8EbYtstyYw53R2Yqms3wS8+ateObJzzpJpyw15M+kUBK14/86UDk7nLXGREeiaWPI6MBM5ZS/WRwxEn9sF7L7+URPdg7e4OmxwDgmwd/0DND336veLa5w9jCH6hAtdP9h6hJel9bq2p5ie/790YeEIvN7o9WCc=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>, Gurchetan
 Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Juergen
 Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Robert Beckett <bob.beckett@collabora.com>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
	<Christian.Koenig@amd.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang, Julia"
	<Julia.Zhang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian"
	<Jiqian.Chen@amd.com>
Subject: Recall: [LINUX KERNEL PATCH v2 0/1] add S3 support for virtgpu
Thread-Topic: [LINUX KERNEL PATCH v2 0/1] add S3 support for virtgpu
Thread-Index: AQHZqydezdjrVoCNy0y4p3DT/S/pAQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Fri, 30 Jun 2023 07:49:16 +0000
Message-ID:
 <BL1PR12MB5849E3A0DD8DC6C6BF280487E72AA@BL1PR12MB5849.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM6PR12MB4169:EE_
x-ms-office365-filtering-correlation-id: 827ea8c8-17c2-4d91-ac7c-08db793e8103
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 v5YNKznZ3cGg7B04UPG+iPlvGJaU2W8l1MF2U9sD1NsKrK5EQ56OsUyvdu37C8gTgrPQcK/lKn8DGdB65Sm5iYTTmdKm3L7SUO4ISiOFJDLvxr4YDFNoNlYAVnBLi8Q1mo+Gnr/xoPr2qigv4BDflM/VoejkcbksTM598wJ4rjvtlaDECDADoQRtCrOIfUBpGNjf3zEhIPKzYr6ujB8Ofreg45CggP00uQnNaUtOgPVzv9SV4gR0SS3o1kZGPsjY7ZPu+4gFV4PiBg0epYTP19o/LOybCcNd2esaTTBkdDQt8BCMxFAFHHS0+4uO7RW1wUqFeS3HYEILbD41Sd0Ruo/N7ZCBH38u5KvmuX5IEmojWkePLqrvq0v3oNxJ9sbRJij9YEzhRM2td2hXXuLDLWiqq4hJJjn3icVgn5Kmj6G+AvjIOgUoYblWHdP2hpeyqIyf6rSvFi0hjwxOa49YFqKP2RZd9LlP+/TpgmEvCZY2S1tfexl6vBnJxP219AJRyxT8PXwQvSPnP8frkNaW4JYeKqmUaBtiP5YNmiuRCK2sthYC7L9KuJ58zPcwQOlv4x+2d6MvNG4D/k+geNyqSpG4yD16x/9BDC/XrhERWVzq8mnSNuSUasG2lJMjKcAgIx816p4ugUgMbZu6CtsAcQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199021)(7696005)(478600001)(71200400001)(558084003)(33656002)(186003)(9686003)(6506007)(83380400001)(38100700002)(122000001)(38070700005)(921005)(55016003)(4326008)(64756008)(76116006)(66946007)(66556008)(66476007)(66446008)(2906002)(316002)(7416002)(5660300002)(8936002)(8676002)(41300700001)(52536014)(110136005)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Uttz7BPwPg4VeNJDZn/KUSvjnzp/jw6x2GvBgL6t/RXx1aIh6ho2DcqstE?=
 =?iso-8859-1?Q?f9hOx4nsgTne/erpZZdxgQmEN/lJgmnV2GJOMOiZCKbXarxtuwfYplDzsc?=
 =?iso-8859-1?Q?YGsgBA4PI6iAfXHmTWOB77HYw4IjSCMcnWKUWt2Bq4HOVhNiKHuFKZ/oOI?=
 =?iso-8859-1?Q?hsW5kjXE6VkBss6o6VJ1gl/iaJTZ5LqnPTPMCPHk2gTOk+UxBB9g7UN2Ay?=
 =?iso-8859-1?Q?vhlOH0mt0OgNfWYVPGyatFvp9LoU0bJ20OOOsC5nDJBa6nzG3BD1s0qbdA?=
 =?iso-8859-1?Q?zMmLpX8rWMWbrJmrltOeuAHGESDnmDOOMsuakgawAvo18KS4uGlWNU0mE2?=
 =?iso-8859-1?Q?sLFV2SxnD0eyJyEP+PAQ6i0cHa4fR85pvwfbtJqQ5qPFOMyP736A2IjBUH?=
 =?iso-8859-1?Q?wRqrneSi0ygCJZof4pI7QSoWY8PL7ezbOUHWIHy8SQwFw55tOas/8XQhaG?=
 =?iso-8859-1?Q?sexjIoyWwOC0rrtjznNzOWhK6OZCm4J9jxOJ8d28vRN3RGimgn8qq2AU8z?=
 =?iso-8859-1?Q?ZSI4YrdDiaayNf2ioqobngNp5uvUaVbKLDkqZ+lcPCeEka9QfGpRFStT83?=
 =?iso-8859-1?Q?H16MlqzTHPQX/SHCCdM88ypNmuC/AIwEOrevM1xYVIDubWqQYf9yRP1OkS?=
 =?iso-8859-1?Q?n8ZHhqQAi6n2tzKj8+dZOoxwkp6DQ/qoo8TJWXaNFKakCFESoVQ1kbYRDU?=
 =?iso-8859-1?Q?lLvihGkrz4BusGBMBqt/YnakCMH7/1Xgzmo/rOtbg/nFFb6fdwWdyWUHNa?=
 =?iso-8859-1?Q?4A5P1TSrQg3fjyRleJC6XlNJGyqbvyubfw9cbId0AuKRgsAb9Ndom2lvFr?=
 =?iso-8859-1?Q?GC3R6LYm/1Nbkl3FpMOwMSQGfpxOYETP3LcKAGGKIDIxkzSAGpQDWpN1nX?=
 =?iso-8859-1?Q?nRujRjhkWZ01EmItTrh8vM245QoQuBZIg4GcavO8wM/ZXlHl7np4b0ZheK?=
 =?iso-8859-1?Q?6GRYuGJHcn1WlBiPbG04HXzbaPldTE9fI7qGoU1SDUL1hDZsW7XT6wbgWE?=
 =?iso-8859-1?Q?1c3OdT5+iK5E35lW2flKInjrB/KBAKHGRuYCa8Leut0TUwQUFKlyQo5x4G?=
 =?iso-8859-1?Q?NMsOS/C5yR2ctWOMwW51nOTZn4iCjzA7FyeMGy4SlO3cNQ5RtDw9t5/rBz?=
 =?iso-8859-1?Q?T37FPZOXPJaHURLpiWuEU+DMmoI/lTpidv0DXxYYB4b9tI4WoUpu0mlb6i?=
 =?iso-8859-1?Q?GMUynxbDwHNNCQ7byH1WsRySITTxitVEeU1GLuAuzrzLihsiJv96xQ/2NZ?=
 =?iso-8859-1?Q?cyoPl86zfXezx+tADeBqxCJZdswxjsdjwhXy4BEx86H+7FjWpxAlTn60hS?=
 =?iso-8859-1?Q?I5MBu6UlCBM5O1NtE/t6cV3Y+/GYiEuFpC/qCY4t04yszIDIeaZoh5R7Jk?=
 =?iso-8859-1?Q?EL3FC5ikbMuwG0LWet+MBRzGP8tiY4YJTcVNffwFT43nkUjIbIAqMvmJsH?=
 =?iso-8859-1?Q?VAXnOiqLtBsI5zcblyLiioaT2co3anHYKDIVxmQQ870/qO75L28utD6Nsi?=
 =?iso-8859-1?Q?06eWGgK2XpG6XqpZaNoaWAOXz+FpM0iI92gyguwBJGR2qhw0EvNQ0p/8ld?=
 =?iso-8859-1?Q?mgjgqm8jDaJz3oeGWAYzlAmff2OS6ymJbVJycTDUJN8kQ8ic5g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827ea8c8-17c2-4d91-ac7c-08db793e8103
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 07:49:16.2474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRwJft7cIhMvoMG635/SHEDt5cOXq5cjGb6vr/R9B7BlATR/yLpDNugZrgH5NkD8nhJK6I12uRTvBPYHJ9bxNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169

Chen, Jiqian would like to recall the message, "[LINUX KERNEL PATCH v2 0/1]=
 add S3 support for virtgpu".=

