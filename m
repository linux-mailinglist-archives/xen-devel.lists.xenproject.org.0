Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B59B420F5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 15:19:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108274.1458475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utnOF-0002MC-Su; Wed, 03 Sep 2025 13:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108274.1458475; Wed, 03 Sep 2025 13:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utnOF-0002JB-O9; Wed, 03 Sep 2025 13:19:07 +0000
Received: by outflank-mailman (input) for mailman id 1108274;
 Wed, 03 Sep 2025 13:19:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wznA=3O=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1utnOE-0001dc-48
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 13:19:06 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8febc884-88c8-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 15:19:03 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB8120.eurprd03.prod.outlook.com (2603:10a6:20b:447::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 13:18:59 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Wed, 3 Sep 2025
 13:18:59 +0000
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
X-Inumbo-ID: 8febc884-88c8-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLQ2FZvMbX5L1MLTkR5iouQ0gTQXh6n+scZuIHbgKlKn4bnAEV2eAbGCTmciXiZVvR3o3u+lxd+bh6SdPJal1WmKxCWupH8qPdyzKRaYqgTfGbhcYCHUKvz5eiLQhHZfVqAsT491rxMQFWqqtQwwU9Yuk2YSj+02/WGPekMzqTUYcSuZuyzTR78GvWPQ4SnEOUCH7Z1uyXOaH+R/1oJGqm8MBaxKbSFqfeWx5BV3CMDhtsgdJP8YwYGdYINjhDGrerAxUPB8q7Fe5AnBHOMeZRQmzWMMUL3juWQLni3zj56EiCxeGDlsrQ+wMTlMA9FqV5aqCvP4eI/GlxtwvQX+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Mm03IUR6xnzmkwFBucRTvpL5NnWIb+JOPQ07cSTRto=;
 b=Jzjs9g2wfBfUR/YhevOtWqaiXfM17YwKNPpAolbGFtJcCcq6cnh/yhdEm6ywRlX7QG1zSMKRhkXk2x3+0C7/qcotOl+LXK9Eq6syIgAi02HgGxI70oZ6xYzUHzTWdrBmOggbXHhntRP9I1P82nEkqwrbsIBM3YenOzSaLTsH8j4j7u7MOvuHw7TpdTXHvx6SBQmIIbW7PvUDczBD+ItpvD6DZqXCZFhQx5LUuLubYgIqIem5li11H1TF/6CeL9IYuHfeqKktfxcb2nGI791yxGj9BUno6qRtrozP5Fsdp1lOH2ITM3+Ke2UH2+OfKR4TeIDaGjro8GoLe5M/kBOIgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Mm03IUR6xnzmkwFBucRTvpL5NnWIb+JOPQ07cSTRto=;
 b=VF1fiioOFhT3XRvLpho81yn8jmPT9SGtBEZpyxNmL6waXAV9//m+JJ+M8H4kvkZSXL3FmNmRMbj2YiF4WrTu/pESWkCaUE+cjhu6t/SfjUTXcLD2kbScpX5SS5mbVHrHX/GpZ/znPt0uHvjh8/5PzuW9160lmBQNffi0RgOXj9pWy0mN/KlsnDNsDORRHJDMBfyB9msQeZONV7FAYOBgsPCcWVVL1Yp0IfAE/LUg8olWxpp+vLB+KYM6sfPclROBi+XwAYHaIfjk0gsTgaYwfNY2yj7Z/kkz1A8X/126RkMwZQHatR8cX1B8hZ+yeiZ6O1NiumlZz3Y96i6325FOsQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v8 3/4] xen/arm: scmi-smc: passthrough SCMI SMC to domain,
 single agent
Thread-Topic: [PATCH v8 3/4] xen/arm: scmi-smc: passthrough SCMI SMC to
 domain, single agent
Thread-Index: AQHcHNVM0KndCD74VkeM9gjMBTxXTA==
Date: Wed, 3 Sep 2025 13:18:55 +0000
Message-ID:
 <dd5775b99e11ad4ef7086ee0923dd6ac9d4a3e4e.1756905487.git.oleksii_moisieiev@epam.com>
References: <cover.1756905487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756905487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB8120:EE_
x-ms-office365-filtering-correlation-id: d23c5f3e-8478-4a35-32d5-08ddeaec712c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iBnhsj+M+/twG/Mip9x7LSs5/SCzbLfI/IpsLCWfiCbiLRyJejVGJJ2BnY?=
 =?iso-8859-1?Q?LdLjhmHQfA4hDqdVA3tns5XmIkof3H1u5Ndyg120u/1OdWudmOPCgI9AR3?=
 =?iso-8859-1?Q?LAD5OBJVexyfAtweOkpKSmK0lPkRR3p9zg/20EeK9NCuAij2LuvqpWFep3?=
 =?iso-8859-1?Q?u0NxvdAQgJpYS76Igb5svPnOsCuKUr2QiT6Rl+bQJypzxpQHQLDHUTNAgy?=
 =?iso-8859-1?Q?QGk5Hp8tMJ0MBgJJBV+VKJLZYbebo3J5PTG7uzSfKtgXUAhCc8Kz6vlzhe?=
 =?iso-8859-1?Q?R9vc7IT17wvI6JAKJ/OqgiZ5NrAzFQfgQTK3UdL9ST6WiWujmvEIDRPDc6?=
 =?iso-8859-1?Q?KyO7bb0Ub5SSJXq3uwFE8IoQjlSy+HShTX3QirfWk67kXqelv4qhPhz4a+?=
 =?iso-8859-1?Q?J6KT4l63FM3ERcg4yvOaJ1CSggiNRfm1vgTt0UPrt2sNrUTgTSqCa6vhnN?=
 =?iso-8859-1?Q?xYZ/nkdfNHUQs0Ii08Fosvbi4LbZEH6n45Jvg5kor+neHUKFTt4TFZIPua?=
 =?iso-8859-1?Q?2ml2m7YtIt4gbq7VVVcJwtFyVBVfq5/fiVpsU7sqq3C0K4ZCFTZh8WxhHP?=
 =?iso-8859-1?Q?V1VSK5yEegIyd5nXnQDSzmSpJzwfShE5jmqHdVKf5UfeTK7K5Dk0wRxcp/?=
 =?iso-8859-1?Q?j9aOfURh5pc554yzENuplGf6mFL8Utxl5UWSp1znfL6OY7lu0EkAQlA/tA?=
 =?iso-8859-1?Q?Cpo5Ar7wUP8VlJJjPhfSDbE81fsbJzlATQ+uoTdJoZhGpvJ+SnV6zFjfoI?=
 =?iso-8859-1?Q?C8dQEQZfi7atM+ama+XUBaZGQA+OKSdgmsZ7wPNmhecmp02tDn3FU50x+A?=
 =?iso-8859-1?Q?igcit9YaD30R5bbn+K8p3fXk0yXiyo5xojy0sUmMBpOc017wFA/0ftqDIO?=
 =?iso-8859-1?Q?c/4LX+/R9Igo2aOadFaYjE0H+/tYxwKsWaKJbVVxuHWVptr0TTLKfmoUlW?=
 =?iso-8859-1?Q?3QqV23Z477uYR1c/9TND0ChH7l8swfMwoXE0PWQy+c646R5MbzLg/gHLXT?=
 =?iso-8859-1?Q?uNvVB4OoqJTn4QT2z5xRkwLk8uh5eVn+1VA1QmqFt1FHWeS8pMchVBUKrj?=
 =?iso-8859-1?Q?4Qk744I7mlvv9A9CHKKTJKecwbKaQhdTWLMkqhzTl7UISflArwAXrRJxBH?=
 =?iso-8859-1?Q?/oC7fkaDpkVg07uQ/4gRsGb6pP4diRk2+c9bKqlsSjjep/mxoy6pXE3IdH?=
 =?iso-8859-1?Q?OZ/tQCso98k1o4EuBE7LJSahRPduq/OcKpkkUC+nK2uoBiqLYSOB3LIKFS?=
 =?iso-8859-1?Q?IhQtwMS4kQ9azBWIo9JHb9QS3XcvaQRpt230/Iy3ll1fnyHF/90dn7AA5s?=
 =?iso-8859-1?Q?UlrzZtCxalgQNWlJbcyYKdt3GqJuNNYuAHwFzuq3Sm0ql5ley1VZjLQTw6?=
 =?iso-8859-1?Q?7ksQyjQvi3clvKUdhJutngof3toOUAMU6X9sizhVRtgPHzn+oUtsgyM9bB?=
 =?iso-8859-1?Q?Z1qIyWoaG1n0LC8eGEEhQ/ZbmOiMrhfl7NRVvHR3HuZfL+oa/dFJeUQV86?=
 =?iso-8859-1?Q?v5xqpY1+x9cBFKUPMAAITSMhjyJkFF6L7lM+9f6CJLBA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TlL0+hWVANqgj8asuYqdB45OJPP7fOM/a6mw0iVgzDrlmOG/k1MCXo09TC?=
 =?iso-8859-1?Q?JyHfA6tFSACZGJSbq4UVvc6rfvpKqdBTMGa3em7habxtRzNKSAWfcy8QQt?=
 =?iso-8859-1?Q?bVF+H7g5JIETDGUm9ZKUqrDjEikeTQkRVBbN3sZeOBvKHfZ7hqQXZK+Xm1?=
 =?iso-8859-1?Q?7cW1GDmNab4SQMhh0yNIHOInFprHxwlP/ZrceHpjEJ1uhuJnPU2af1cogc?=
 =?iso-8859-1?Q?U205i/kEzGA4340BjBUcDni+hiJQNbzZeVAnhCTGOupl+okl+IFn0bViqO?=
 =?iso-8859-1?Q?Bu4lImLcTZNq0WRhx6mFAkT0FYxqoSSxuPKnLPv9eWiV8P1Bi/sGtsfdXu?=
 =?iso-8859-1?Q?AP+o3CPCdqtkh+v+fJ8sF1ujuirhkw2cKGq8Y1WLCgAo4mBsHjLYNraCLg?=
 =?iso-8859-1?Q?Mt3uX+Xalcop/3ZjXX6m7fCTr5JoW46BfLTz70I3pqnN0RhZbYHjf4q2Pb?=
 =?iso-8859-1?Q?9Cddj5aY+BuOSgiCZ+zh67iiCZ6BF0QJ+RMtkai4ep5BPteWEpNlM3dspF?=
 =?iso-8859-1?Q?cTbnU3Xsww6+LV2eYykcimNVrej4FjBt3rESDHKyTUu9+vpjLRy+mVk16C?=
 =?iso-8859-1?Q?hewTCtLiQMES/Dn11SnrEP+YPJm4YR8+gXDjwuAVRXthZKcGpX47Rgr6jB?=
 =?iso-8859-1?Q?PcozQpQO6jA/nRDQ5zrqPjZ3vtl5yMrYvyx3CZMu5c1tWvCygKIp5OR9jS?=
 =?iso-8859-1?Q?eWZ8qJbXOiLhpPwemx05f8trxau1MiWEibiKqe5Zn2rTnvztKS1lNqnzYh?=
 =?iso-8859-1?Q?rL0RAtJkUfBaiA8uaGh+bOVB/5CJMSB0Cuj7IVG9DjWmmC/mCQR8chvDoc?=
 =?iso-8859-1?Q?Y392OYzpgJzlWYQlczs2Ym37a1Kdt9Q7CsF0xb5UEtBefxgflkS7khQoI4?=
 =?iso-8859-1?Q?t6DzYhtSnnh6Swb63kxrI6BRW3dy9Cpvmg74lPeyGhfGiHKKuw+bOyFv91?=
 =?iso-8859-1?Q?S9u5NRTjymFVNId+t7yf9JOawvRoPIWg5+8B6twQJGme7YUTxWHDhqeoDT?=
 =?iso-8859-1?Q?e0Vdtnd31m5DiyOZgxI3rHAntKoMvqDf3dGfEIOOVX8OL8mJWjCp2sXVVD?=
 =?iso-8859-1?Q?zgWKWfiJ5SNb8LIEFzZaZk3aN1vKrsa32Wl3gkVedwk8mtILwTScx+4MLn?=
 =?iso-8859-1?Q?FTPBxiFwqAudnFbh7Fioo4qNbk8SLu8L3gGEEMBFtQDDKxb58Ugc0kSude?=
 =?iso-8859-1?Q?V9h9/3KgcV7PiBQWTt25KgfUSy7oUDuqGykkdeq3wmy7C92tOrGQ/D9LXr?=
 =?iso-8859-1?Q?vKzpjQEFeJuTYHbTYooO5/cDrD6jYH/2ScNw2X5ZBwtQQMnQunRPT+tyCU?=
 =?iso-8859-1?Q?P0FJOzov5V4awTRcMBYCBt25e4ilZ77ciqTzD6Pwe6DdmNh0jC8b5zxxEy?=
 =?iso-8859-1?Q?wbvx1fXsP/bqZz5L9orGcTTojIPBRAbxoLFS4uoS5cdHMnqgHR0iqdY+Sv?=
 =?iso-8859-1?Q?wyaiLR362w44VQdx4jq7VIw8eY4+hHUWBQFN5X8Vd0o/x1eGuVULWmXSuR?=
 =?iso-8859-1?Q?YpyeY+3l70JE/pZfp2bZms2WBOnSfOEJ0FEDQwsW0VrScBzbVzh7XkSyCt?=
 =?iso-8859-1?Q?mYxJlmJBu+ex7dMNX/dJAR/YRNIm/oShvyVol8aZyw7+RqXZgl5IgMzKdI?=
 =?iso-8859-1?Q?ombMPlwrC1/dpF1csKbJO4X3D/4WWcWIwS4CkHC6qTZJeHg93gvZ08xQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23c5f3e-8478-4a35-32d5-08ddeaec712c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 13:18:55.5777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iZqTW/wkC7JaVGmrkWO6oN7XnyLBo+CQkVj1MYz3GTEPelSunx/LhjKqAHuZe+MapTdrgDhUpQostLTGGkTIvdkTymgSGavOd2lmAVoqbbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8120

From: Grygorii Strashko <grygorii_strashko@epam.com>

The commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls
handling layer") introduces simple driver which forwards SCMI over SMC
calls from hwdom/dom0 to EL3 firmware (TF-A) with a single SCMI OSPM agent
support. While it is working gracefully for hwdom/dom0 use case it doesn't
cover "thin Dom0 with guest domain, which serves as Driver domain"
use-case. In this case HW need to be enable in Driver domain and dom0 is
performing only control functions.

The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is
pretty generic case for the default vendors SDK and new platforms.

This patch enables passthrough of SCMI SMC single agent interface to the
one guest domain serving as Driver domain.

Configure Dom0 to enable SCMI passthrough:

 - dom0: add scmi-smc-passthrough to the Xen Command Line

Enabled SCMI passthrough for guest using toolstack in the following way:

 - domD: xl.cfg add "arm_sci" option as below

   arm_sci =3D "type=3Dscmi_smc"

 - domD: xl.cfg enable access to the "arm,scmi-shmem"

iomem =3D [
    "47ff0,1@22001",
]

 - domD: add SCMI nodes to the Driver domain partial device tree as in the
 below example:

passthrough {
   scmi_shm_0: sram@22001000 {
       compatible =3D "arm,scmi-shmem";
       reg =3D <0x0 0x22001000 0x0 0x1000>;
   };

   firmware {
        compatible =3D "simple-bus";
            scmi: scmi {
                compatible =3D "arm,scmi-smc";
                shmem =3D <&scmi_shm_0>;
                ...
            }
    }
}

dom0less case configuration:

- add "xen,sci_type" property for required DomU ("xen,domain") node

   xen,sci_type=3D"scmi_smc"

- add scmi nodes to the Driver domain partial device tree the same way
as above and enable access to the "arm,scmi-shmem" according to
dom0less documentation. For example:

  scmi_shm_0: sram@22001000 {
        compatible =3D "arm,scmi-shmem";
        reg =3D <0x00 0x22001000 0x00 0x1000>;
->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
->        xen,force-assign-without-iommu;
  };

The SCMI SMC single agent interface can be enabled for one and only one
domain. In general, the configuration is similar to any other HW
passthrough, except explicitly enabling SCMI with "arm_sci" xl.cfg option.

Note that "arm,scmi-smc" and "arm,scmi-shmem" nodes will be removed from
dom0/hwdom DT when "scmi-smc-passthrough" cmdline parameter was provided.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech> # tools
---

Changes in v8:
- reneregated {helpers/types}.gen.go, dropped unneeded parameters

Changes in v7:
- Fix commit description.
- Move scmi-smc-passthrough definition to match alphaberical order
- remove unneeded initialization with NULL
- changed u64 to uint64_t
- Send warning if iomem permit access was failed

Changes in v6:
- added generated helpers and types go files
- rename cmdline parameter to scmi-smc-passthrough
- fix goto tag in parse_arm_sci_config

Changes in v5:
- rename dom0_scmi_smc_passthrough to scmi_smc_passthrough

Changes in v4:
- xl.cfg doc
- fix comments from Stefano Stabellini
- fix toolstack code as sugested by Anthony PERARD
  - use MATCH_OPTION()
  - move arm_sci struct and cfg params in "arch_arm"
- add SCMI passthrough for dom0less case

 docs/man/xl.cfg.5.pod.in              |  34 ++++++++
 docs/misc/arm/device-tree/booting.txt |  15 ++++
 docs/misc/xen-command-line.pandoc     |   9 ++
 tools/golang/xenlight/helpers.gen.go  |  35 ++++++++
 tools/golang/xenlight/types.gen.go    |  11 +++
 tools/include/libxl.h                 |   5 ++
 tools/libs/light/libxl_arm.c          |  14 ++++
 tools/libs/light/libxl_types.idl      |  10 +++
 tools/xl/xl_parse.c                   |  36 ++++++++
 xen/arch/arm/dom0less-build.c         |  34 +++++++-
 xen/arch/arm/firmware/Kconfig         |   4 +-
 xen/arch/arm/firmware/scmi-smc.c      | 115 +++++++++++++++++++++++++-
 12 files changed, 317 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index acff45d308..3b18bcc095 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3123,6 +3123,40 @@ writes will be ignored.
=20
 This option is only implemented for Arm where the default is enabled.
=20
+=3Ditem B<arm_sci=3D"ARM_SCI_STRING">
+
+Set ARM_SCI specific options for the guest. ARM SCI is System
+Control Protocol allows domain to manage various functions that are provid=
ed
+by HW platform firmware.
+
+B<ARM_SCI_STRING> is a comma separated list of C<KEY=3DVALUE> settings,
+from the following list:
+
+=3Dover 4
+
+=3Ditem B<type=3DSTRING>
+
+Specifies an ARM SCI type for the guest.
+
+=3Dover 4
+
+=3Ditem B<none>
+
+Don't allow guest to use ARM SCI if present on the platform. This is the
+default value.
+
+=3Ditem B<scmi_smc>
+
+Enables ARM SCMI SMC support for the guest by enabling SCMI over SMC calls
+forwarding from domain to the EL3 firmware (like Trusted Firmware-A) with =
a
+single SCMI OSPM agent support.
+Should be used together with B<scmi-smc-passthrough> Xen command line
+option.
+
+=3Dback
+
+=3Dback
+
 =3Dback
=20
 =3Dhead3 x86
diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-t=
ree/booting.txt
index 07acc7ba64..977b428608 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -307,6 +307,21 @@ with the following properties:
     passed through. This option is the default if this property is missing
     and the user does not provide the device partial device tree for the d=
omain.
=20
+- xen,sci_type
+
+    A string property specifying an ARM SCI type for the guest.
+
+    - "none"
+    Don't allow guest to use ARM SCI if present on the platform. This is t=
he
+    default value.
+
+    - "scmi_smc"
+    Enables ARM SCMI SMC support for the guest by enabling SCMI over SMC c=
alls
+    forwarding from domain to the EL3 firmware (like Trusted Firmware-A) w=
ith a
+    single SCMI OSPM agent support.
+    Should be used together with scmi-smc-passthrough Xen command line
+    option.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
=20
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 4adcd7e762..518e42d965 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2382,6 +2382,15 @@ sockets, &c.  This will reduce performance somewhat,=
 particularly on
 systems with hyperthreading enabled, but should reduce power by
 enabling more sockets and cores to go into deeper sleep states.
=20
+### scmi-smc-passthrough (ARM)
+> `=3D <boolean>`
+
+The option is available when `CONFIG_SCMI_SMC` is compiled in, and allows =
to
+enable SCMI SMC single agent interface for any, but only one guest domain,
+which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom an=
d
+SCMI nodes removed from Dom0/hwdom device tree.
+(for example, thin Dom0 with Driver domain use-case).
+
 ### scrub-domheap
 > `=3D <boolean>`
=20
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/h=
elpers.gen.go
index 667030cbd7..8909fe8a1b 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -938,6 +938,35 @@ return fmt.Errorf("converting field Vcpus: %v", err)
  return nil
  }
=20
+// NewArmSci returns an instance of ArmSci initialized with defaults.
+func NewArmSci() (*ArmSci, error) {
+var (
+x ArmSci
+xc C.libxl_arm_sci)
+
+C.libxl_arm_sci_init(&xc)
+defer C.libxl_arm_sci_dispose(&xc)
+
+if err :=3D x.fromC(&xc); err !=3D nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *ArmSci) fromC(xc *C.libxl_arm_sci) error {
+ x.Type =3D ArmSciType(xc._type)
+
+ return nil}
+
+func (x *ArmSci) toC(xc *C.libxl_arm_sci) (err error){defer func(){
+if err !=3D nil{
+C.libxl_arm_sci_dispose(xc)}
+}()
+
+xc._type =3D C.libxl_arm_sci_type(x.Type)
+
+ return nil
+ }
+
 // NewRdmReserve returns an instance of RdmReserve initialized with defaul=
ts.
 func NewRdmReserve() (*RdmReserve, error) {
 var (
@@ -1163,6 +1192,9 @@ x.ArchArm.GicVersion =3D GicVersion(xc.arch_arm.gic_v=
ersion)
 x.ArchArm.Vuart =3D VuartType(xc.arch_arm.vuart)
 x.ArchArm.SveVl =3D SveType(xc.arch_arm.sve_vl)
 x.ArchArm.NrSpis =3D uint32(xc.arch_arm.nr_spis)
+if err :=3D x.ArchArm.ArmSci.fromC(&xc.arch_arm.arm_sci);err !=3D nil {
+return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
+}
 if err :=3D x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err !=3D =
nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1699,6 +1731,9 @@ xc.arch_arm.gic_version =3D C.libxl_gic_version(x.Arc=
hArm.GicVersion)
 xc.arch_arm.vuart =3D C.libxl_vuart_type(x.ArchArm.Vuart)
 xc.arch_arm.sve_vl =3D C.libxl_sve_type(x.ArchArm.SveVl)
 xc.arch_arm.nr_spis =3D C.uint32_t(x.ArchArm.NrSpis)
+if err :=3D x.ArchArm.ArmSci.toC(&xc.arch_arm.arm_sci); err !=3D nil {
+return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
+}
 if err :=3D x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err !=3D n=
il {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/typ=
es.gen.go
index e26b3cdfc7..ab9d4ca7b4 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -520,6 +520,16 @@ SveType1920 SveType =3D 1920
 SveType2048 SveType =3D 2048
 )
=20
+type ArmSciType int
+const(
+ArmSciTypeNone ArmSciType =3D 0
+ArmSciTypeScmiSmc ArmSciType =3D 1
+)
+
+type ArmSci struct {
+Type ArmSciType
+}
+
 type RdmReserve struct {
 Strategy RdmReserveStrategy
 Policy RdmReservePolicy
@@ -599,6 +609,7 @@ GicVersion GicVersion
 Vuart VuartType
 SveVl SveType
 NrSpis uint32
+ArmSci ArmSci
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 185f74d8a8..bc35e412da 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -313,6 +313,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_NR_SPIS 1
=20
+/*
+ * libxl_domain_build_info has the arch_arm.sci* fields.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 4a19a8d22b..7e9f8a1bc3 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -233,6 +233,20 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl =3D d_config->b_info.arch_arm.sve_vl / 128U;
     }
=20
+    switch (d_config->b_info.arch_arm.arm_sci.type) {
+    case LIBXL_ARM_SCI_TYPE_NONE:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+        break;
+    case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
+        break;
+    default:
+        LOG(ERROR, "Unknown ARM_SCI type %d",
+            d_config->b_info.arch_arm.arm_sci.type);
+        return ERROR_FAIL;
+    }
+    LOG(DEBUG, " - SCI type=3D%u", config->arch.arm_sci_type);
+
     return 0;
 }
=20
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index a6030a2dbd..b53e013a44 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -551,6 +551,15 @@ libxl_sve_type =3D Enumeration("sve_type", [
     (2048, "2048")
     ], init_val =3D "LIBXL_SVE_TYPE_DISABLED")
=20
+libxl_arm_sci_type =3D Enumeration("arm_sci_type", [
+    (0, "none"),
+    (1, "scmi_smc")
+    ], init_val =3D "LIBXL_ARM_SCI_TYPE_NONE")
+
+libxl_arm_sci =3D Struct("arm_sci", [
+    ("type", libxl_arm_sci_type),
+    ])
+
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -725,6 +734,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
                                ("vuart", libxl_vuart_type),
                                ("sve_vl", libxl_sve_type),
                                ("nr_spis", uint32, {'init_val': 'LIBXL_NR_=
SPIS_DEFAULT'}),
+                               ("arm_sci", libxl_arm_sci),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 90c9386f5b..af86d3186d 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1284,6 +1284,36 @@ out:
     if (rc) exit(EXIT_FAILURE);
 }
=20
+static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
+                                const char *str)
+{
+    int ret =3D 0;
+    char *buf2, *ptr;
+    char *oparg;
+
+    if (NULL =3D=3D (buf2 =3D ptr =3D strdup(str)))
+        return ERROR_NOMEM;
+
+    ptr =3D strtok(buf2, ",");
+    while (ptr !=3D NULL)
+    {
+        if (MATCH_OPTION("type", ptr, oparg)) {
+            ret =3D libxl_arm_sci_type_from_string(oparg, &arm_sci->type);
+            if (ret) {
+                fprintf(stderr, "Unknown ARM_SCI type: %s\n", oparg);
+                ret =3D ERROR_INVAL;
+                goto out;
+            }
+        }
+
+        ptr =3D strtok(NULL, ",");
+    }
+
+out:
+    free(buf2);
+    return ret;
+}
+
 void parse_config_data(const char *config_source,
                        const char *config_data,
                        int config_len,
@@ -2989,6 +3019,12 @@ skip_usbdev:
     xlu_cfg_get_defbool(config, "trap_unmapped_accesses",
                         &b_info->trap_unmapped_accesses, 0);
=20
+    if (!xlu_cfg_get_string(config, "arm_sci", &buf, 1)) {
+        if (parse_arm_sci_config(config, &b_info->arch_arm.arm_sci, buf)) =
{
+            exit(EXIT_FAILURE);
+        }
+    }
+
     parse_vkb_list(config, d_config);
=20
     d_config->virtios =3D NULL;
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 0094cf9e40..418657eed0 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -279,6 +279,36 @@ int __init arch_handle_passthrough_prop(struct kernel_=
info *kinfo,
     return sci_assign_dt_device(kinfo->bd.d, node);
 }
=20
+int __init domu_dt_sci_parse(struct dt_device_node *node,
+                             struct xen_domctl_createdomain *d_cfg)
+{
+    const char *sci_type;
+    int ret;
+
+    d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+
+    if ( !IS_ENABLED(CONFIG_ARM_SCI) ||
+         !dt_property_read_bool(node, "xen,sci_type") )
+        return 0;
+
+    ret =3D dt_property_read_string(node, "xen,sci_type", &sci_type);
+    if ( ret )
+        return ret;
+
+    if ( !strcmp(sci_type, "none") )
+        d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+    else if ( !strcmp(sci_type, "scmi_smc") )
+        d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
+    else
+    {
+        printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n"=
,
+               sci_type, dt_node_name(node));
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
@@ -288,7 +318,9 @@ int __init arch_parse_dom0less_node(struct dt_device_no=
de *node,
=20
     d_cfg->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
-    d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+
+    if ( domu_dt_sci_parse(node, d_cfg) )
+        panic("Error getting SCI configuration\n");
=20
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index bbf88fbb9a..5c5f0880c4 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -25,7 +25,9 @@ config SCMI_SMC
 	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
 	  compatible only). The value of "arm,smc-id" DT property from SCMI
 	  firmware node is used to trap and forward corresponding SCMI SMCs
-	  to firmware running at EL3, for calls coming from the hardware domain.
+	  to firmware running at EL3, for calls coming from the hardware domain o=
r
+	  driver domain.
+	  Use with EL3 firmware which supports only single SCMI OSPM agent.
=20
 endchoice
=20
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-=
smc.c
index 4c5df714c2..0835ddeeec 100644
--- a/xen/arch/arm/firmware/scmi-smc.c
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -13,6 +13,8 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/iocap.h>
+#include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/types.h>
=20
@@ -22,7 +24,11 @@
=20
 #define SCMI_SMC_ID_PROP   "arm,smc-id"
=20
+static bool __ro_after_init opt_scmi_smc_passthrough;
+boolean_param("scmi-smc-passthrough", opt_scmi_smc_passthrough);
+
 static uint32_t __ro_after_init scmi_smc_id;
+static struct domain __read_mostly *scmi_dom;
=20
 /*
  * Check if provided SMC Function Identifier matches the one known by the =
SCMI
@@ -50,7 +56,7 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
         return false;
=20
     /* Only the hardware domain should use SCMI calls */
-    if ( !is_hardware_domain(current->domain) )
+    if ( scmi_dom !=3D current->domain )
     {
         gdprintk(XENLOG_WARNING, "SCMI: Unprivileged access attempt\n");
         return false;
@@ -75,12 +81,45 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
     return true;
 }
=20
+static int
+scmi_smc_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
+         config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC=
 )
+        return -EINVAL;
+
+    return 0;
+}
+
 static int scmi_smc_domain_init(struct domain *d,
                                 struct xen_domctl_createdomain *config)
 {
-    if ( !is_hardware_domain(d) )
+    /*
+     * scmi_passthrough is not enabled:
+     * - proceed only for hw_domain
+     * - fail if guest domain has SCMI enabled.
+     */
+    if ( !opt_scmi_smc_passthrough && !is_hardware_domain(d) )
+    {
+        if ( config->arch.arm_sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_SC=
MI_SMC )
+            return -EINVAL;
+        else
+            return 0;
+    }
+    /*
+     * scmi_passthrough is enabled:
+     * - ignore hw_domain
+     * - proceed only for domain with SCMI enabled.
+     */
+    if ( opt_scmi_smc_passthrough &&
+         (config->arch.arm_sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE =
||
+          is_hardware_domain(d)) )
         return 0;
=20
+    if ( scmi_dom )
+        return -EEXIST;
+
+    scmi_dom =3D d;
     d->arch.sci_enabled =3D true;
     printk(XENLOG_DEBUG "SCMI: %pd init\n", d);
     return 0;
@@ -88,12 +127,80 @@ static int scmi_smc_domain_init(struct domain *d,
=20
 static void scmi_smc_domain_destroy(struct domain *d)
 {
-    if ( !is_hardware_domain(d) )
+    if ( scmi_dom && scmi_dom !=3D d )
         return;
=20
+    scmi_dom =3D NULL;
+    d->arch.sci_enabled =3D false;
     printk(XENLOG_DEBUG "SCMI: %pd destroy\n", d);
 }
=20
+/*
+ * Handle Dom0 SCMI SMC specific DT nodes
+ *
+ * if scmi_smc_passthrough=3Dfalse:
+ * - Copy SCMI nodes into Dom0 device tree.
+ * if scmi_smc_passthrough=3Dtrue:
+ * - skip SCMI nodes from Dom0 DT
+ * - give dom0 control access to SCMI shmem MMIO, so SCMI can be passed
+ *   through to guest.
+ */
+static bool scmi_smc_dt_handle_node(struct domain *d,
+                                    struct dt_device_node *node)
+{
+    static const struct dt_device_match shmem_matches[] __initconst =3D {
+        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
+        { /* sentinel */ },
+    };
+    static const struct dt_device_match scmi_matches[] __initconst =3D {
+        DT_MATCH_PATH("/firmware/scmi"),
+        { /* sentinel */ },
+    };
+
+    /* skip scmi shmem node for dom0 if scmi not enabled */
+    if ( dt_match_node(shmem_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        dt_dprintk("Skip scmi shmem node\n");
+        return true;
+    }
+
+    /*
+     * skip scmi node for dom0 if scmi not enabled, but give dom0 control
+     * access to SCMI shmem
+     */
+    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        struct dt_device_node *shmem_node;
+        const __be32 *prop;
+        uint64_t paddr, size;
+        int ret;
+
+        /* give dom0 control access to SCMI shmem */
+        prop =3D dt_get_property(node, "shmem", NULL);
+        if ( !prop )
+            return true;
+
+        shmem_node =3D dt_find_node_by_phandle(be32_to_cpu(*prop));
+        if ( !shmem_node )
+            return true;
+
+        ret =3D dt_device_get_address(shmem_node, 0, &paddr, &size);
+        if ( ret )
+            return true;
+
+        ret =3D iomem_permit_access(d, paddr_to_pfn(paddr),
+                                  paddr_to_pfn(paddr + size - 1));
+        if ( ret )
+            printk(XENLOG_WARNING
+                     "SCMI: Failed to give access to SCMI shmem with code:=
 %d\n", ret);
+
+        dt_dprintk("Skip scmi node\n");
+        return true;
+    }
+
+    return false;
+}
+
 static int __init scmi_check_smccc_ver(void)
 {
     if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
@@ -108,8 +215,10 @@ static int __init scmi_check_smccc_ver(void)
=20
 static const struct sci_mediator_ops scmi_smc_ops =3D {
     .handle_call =3D scmi_handle_smc,
+    .domain_sanitise_config =3D scmi_smc_domain_sanitise_config,
     .domain_init =3D scmi_smc_domain_init,
     .domain_destroy =3D scmi_smc_domain_destroy,
+    .dom0_dt_handle_node =3D scmi_smc_dt_handle_node,
 };
=20
 /* Initialize the SCMI layer based on SMCs and Device-tree */
--=20
2.34.1

