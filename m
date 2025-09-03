Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E3B420F0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 15:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108272.1458450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utnOD-0001kn-7v; Wed, 03 Sep 2025 13:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108272.1458450; Wed, 03 Sep 2025 13:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utnOD-0001fm-4D; Wed, 03 Sep 2025 13:19:05 +0000
Received: by outflank-mailman (input) for mailman id 1108272;
 Wed, 03 Sep 2025 13:19:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wznA=3O=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1utnOC-0001dW-1M
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 13:19:04 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f4fcca0-88c8-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 15:19:02 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB7571.eurprd03.prod.outlook.com (2603:10a6:20b:34a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 13:18:58 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Wed, 3 Sep 2025
 13:18:56 +0000
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
X-Inumbo-ID: 8f4fcca0-88c8-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFRfE3M0c8eeyJFIP4UXZstuYG5vhXPlw33ddfiZtOn3MYQfP+dOO9PnKfrdjnnXyvU1mvAhxQLx1rax4dS8iBJFhkg4BO3Z/w7Bz0iZo2nDu91ql9fmclbhIHSxbjsqWNuNJNBo06t/Egd7mTKxCE/8vwLYKM9aFDr6zU2/xYsairYFNZVcJVq0V/BQMu85DbBdDxOMzvMKYkOG5TTNSjAvaPcb9TZ+Mq+ND8KJDhS/5q58S2IGDRsForT0N+aUvEc2LL/HuV0Gsl9IUVbX4ZcawtjYGicHshzywsBoTu4b31K0rYoJW/QtKOWEIYA7SFsGCqW7Lsgh92Go5k6pJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYyf9uMSyGYMAhDGcubaXfEJRx7TblCIszb89bJrjRk=;
 b=L9S9WsWTlZ/4cnr2rJz5+pz+AqyNP/VbpGgeeef26ZFxZ8zA7Ors3giL1tRc+bw3i3J4x0MvR0fn5FtGewhUmMpZuAR5p8/8jFhz/avr8HZLSKexGajmZU4hdBpqBlmLTnDigm3rIR+/RUkyPhWTuKPVHWPpiOTxPd0mgYurhvpxAqQBL+gghh7Dr0Ig92L8/y57siSRKsRwRIvXDEPwpcBeggWXZi+XKYe2muLJCCraiqlg+QADO40jBeTCM/sSuj9wsqogxzynJs4RfY86pY08AytbVwGtIVzgPgU13j0dYpL/J73R3/PTQ1bcsib4k5Od78WsJGGgDeqpWQwSwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYyf9uMSyGYMAhDGcubaXfEJRx7TblCIszb89bJrjRk=;
 b=qNdbO7NGLmzYaUaVX/UFGRQSCDdPi/FG/Xr281k3uxp8jJ8ox99tfcdlQk6p35sKNlQCjE8hYpF+oX/JGpOgUEIei/AT6vOEwHkTaKGWLKz0P00ABM2ClDpKGqvS4dXHe7mowEi97c0JtMePRALft646aXyfGMpnS+ed8E56KiYYveXTg2NCYTharLIYfbtwCw74PCTQEqudhy+9OOCgXyGfsxCwj/TOCa4chDNPsjfPP5DN10aoHGewrKwMWP/SLIdEFepwkNc+SJP1gv4iqmaPS2/6EGHueLKDX2e7bF2roiHVdwnYZr9p9Hjhjg9VRbKrlY7noYfyG1WY2iSdQQ==
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
Subject: [PATCH v8 1/4] xen/arm: add generic SCI subsystem
Thread-Topic: [PATCH v8 1/4] xen/arm: add generic SCI subsystem
Thread-Index: AQHcHNVMIdkBkepdeEKtCYcl72337w==
Date: Wed, 3 Sep 2025 13:18:54 +0000
Message-ID:
 <279579a2dffed091e4b9a208c286371c7ff87a26.1756905487.git.oleksii_moisieiev@epam.com>
References: <cover.1756905487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756905487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB7571:EE_
x-ms-office365-filtering-correlation-id: 0a51d4c7-9e64-4fd3-3bc4-08ddeaec6fbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AutgZLaywJ3MifsTlvM/onoImlzdOCHsvMUGVc1vVUdmt+frkiIWty8VQ9?=
 =?iso-8859-1?Q?/bR/5mKdMYixY+DZFXHp/49pooBoV6tW8yBJgx1VOFvfYO4UGHlLVjS+Bh?=
 =?iso-8859-1?Q?CvQi38xXfjta6DDE0m37hoUtj3ERxfxvXCtlVMrFEn1+7pbAAB5wFmBhik?=
 =?iso-8859-1?Q?m6LhFNTMDday0Io1ln/ywYPOuvfjUPTOk+fh+XguEqadCtC/Iy1O92gyeQ?=
 =?iso-8859-1?Q?nyEcX2J0c/waSi8sNM3tAzxM1FVUJ9e5HnqqOg1MVa3j2lJpV4gF+IL7Wr?=
 =?iso-8859-1?Q?9zJhH6rrTmc+QFzVeEb3SomZG6Gx1e4TfcIC6YQ3Y1HE/dG7K+gvIOsFlI?=
 =?iso-8859-1?Q?iF1vviMgCCtCzq1Oej4Wi/jDVOxynmDoT16ngc+be+qsLF/7rOV95W/3x5?=
 =?iso-8859-1?Q?R6REGPTFL1tHxrcQYbFNB5XIKf48vQXfEzFTpv113ZMeEcn9p1zo+nr+3v?=
 =?iso-8859-1?Q?oq4c9T8QQb5lJM3j2xoIrRu7gTNbhg0A6LPKLpI+JeCZiqIE7qcreFvXMN?=
 =?iso-8859-1?Q?dlc3vKdaOo26cV2oqePLLifstZqLXZ1f17PvDZIObqwkN6AJRWj0U/pUoT?=
 =?iso-8859-1?Q?wcfYLiR7kE9nN1PCX9wkU/PiOQ+pHT8nUvEZXpHujpMHpBkZXbAA++TuGq?=
 =?iso-8859-1?Q?6fnFYdDRz0tgUvqKF72dF9sWrFrRgvNuIuP5usKBk1woesKj2gQ516qxjH?=
 =?iso-8859-1?Q?bE/7EDOhf8tUHQZQxYDT+Vaake4oLwrPxpbinsDqdFcM1vkx4xSjzN4oXx?=
 =?iso-8859-1?Q?ezrk/KVvk4UcTb23cgP5BePJ7shMuAjoGrdMLaTjUBjL27bTyAYCzTWYmV?=
 =?iso-8859-1?Q?xPX1gQdrtFC8JcNDvtm0Dw+uSxX/isP5tNNZhfjkNfCHgZVLlirYJODoUg?=
 =?iso-8859-1?Q?0ADAErdoP7ospa95l0S1/7D/PiRckGOQtNBxbVxp6HNbVLKLV89nQWDG7u?=
 =?iso-8859-1?Q?kHg9B3kyoW8dKF8JRhqcosV48EAivSOAkldRFmhxgaUGzE8ltBJSZfcXMy?=
 =?iso-8859-1?Q?eVNro+u0b+242/44qC7oqDK58zVvHoMXT5CU3eZuslqRvfQejW8buwYPAr?=
 =?iso-8859-1?Q?EbzYcXs9Gh6UyVgPjZNtYfrYxn5XrMZ7bYeuS4/KO89S+gzn5LI6EdvXJ/?=
 =?iso-8859-1?Q?x91mwQFn8p4WAOlMWrZd0+auz1t/5KnJhScHt0yuOOXr+kufPEwU8ha3pw?=
 =?iso-8859-1?Q?X8c6NZ9hjJbbJzl1m/TE0px3WfztI+zblYTpogV1BthE+WzRKF2X1qd9HO?=
 =?iso-8859-1?Q?AqxLNCCbAUZbJkVWMjekk/wGYErWbG4xgXvvkwg3M3FKzg/PbQBuG3+qCo?=
 =?iso-8859-1?Q?uhc+NFo4rB5ADxsyXtKFfL5NuGKl0hazsPFmlZCbjH0QmH2muZiPM5c054?=
 =?iso-8859-1?Q?P9aPuurRk0LOpasmYy3LGIV1LJNWPfYVyj5Xs3HJbBXYgx7npk3Kr/xbne?=
 =?iso-8859-1?Q?vIgpVzFVtoqMeSVQ+Yp3/VBsk2EF0KGSEvA/Zzz/8Vb+QpqGgnsOk4y7Mo?=
 =?iso-8859-1?Q?+IpFmORse1Mc2GsfwrYnzYiriFyXgNOeXeloN7vVXrCQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GhSmkrDXe0Yxisspqj1XieaBmWCdZbfqEGZLdgmav3nxw8Pqs6u8fyLyqf?=
 =?iso-8859-1?Q?zdldH2x0/qCJLOt1uHu6H4SQD0YrLx1tL6SYuKbwb8IEEEZKANpQbkrVP0?=
 =?iso-8859-1?Q?HVrFIDwzYfwJTEUOaeNHvgaDY2TcVx6DFk2fWOzcVoREkBXPt1O+rVQLKT?=
 =?iso-8859-1?Q?iOQ1A7cygc8ljLF8Fp3PnKJAIsLvA9dqoAbDz9lTH2JZz47C3FMkV5d5Xs?=
 =?iso-8859-1?Q?cBl07jmH4tcumpTSV9uCwCQYS3vY2U/OucJkWCFyVShz7irmSmc7BviBbY?=
 =?iso-8859-1?Q?NpAGsY2eUyIWDK7g9DYcaXFfN3CZQ1efDh2uRm0lJ2XJhWMP7hcOjVjzUc?=
 =?iso-8859-1?Q?0yIxiXGfL6AiwyP0jcXnQBAE8IDU99UjNkRaRDwl0VSf2AqRx8ugPBfmSp?=
 =?iso-8859-1?Q?7EzhHIwvN7/p+U/K3JdWUVK18/TFV5Iwz7GShFXSC4aRdH0wnnrxWTB+HO?=
 =?iso-8859-1?Q?ljNn+k3bioCBNvD2NBEHbsivbKVaMsNZvySdDakEfqxsRaOAGtVyY8S0sr?=
 =?iso-8859-1?Q?WZkWLti3wS6qwITCdZivynJsmOaFVRUsG4P02H7ivXFD2/34iA6F4AED75?=
 =?iso-8859-1?Q?9g4LZwCkZzjFxXouUovnFkzLoEF5fJe9PkzKpsvW0blBlLgMcjtHJYzZZK?=
 =?iso-8859-1?Q?mJkFHzLHYKqXQWqb30NqS+kl2eT3DA85u0t648QU0Unq8mDtlS1IS3qHFE?=
 =?iso-8859-1?Q?ZIyho6yWAk4nTuT0Du3y1bdHFBPXJU4Xi9GHmjLWPCfIDtRm6kqZnj+pL8?=
 =?iso-8859-1?Q?+MJdBkmpBuLHBV+WIfs+EDP9pb/3t0KwqaKaAYbXj5+79FPNpAt3uTIU4K?=
 =?iso-8859-1?Q?5Z1f4O8slLZ2VMw+1Dm8DG4Dpbu5Nfr47BpxEoJF0h4EsYPT93ZIz1RlUz?=
 =?iso-8859-1?Q?joL4+LgG56G/O5KGt3QTCHSWiKfZssCzBCfWouQDU6FPfcgpybhAw8a8eo?=
 =?iso-8859-1?Q?UGuJDSGWrlyVxCC60WW0TeDU1mYtvPXe8bvE/DueB4gBo6oJbmBx0s3SCU?=
 =?iso-8859-1?Q?ISnY4e5/y4F/fru7R9/JMBMvhI2T+eD8VDaTDbCngHhhI31ZNI5hQaNqsK?=
 =?iso-8859-1?Q?oA8lqtgE6o6igEhSgYVYJZJzus/E/n070bvjUU14YRX1rTTTCpqRd9DKv5?=
 =?iso-8859-1?Q?Kod7VlZxggjjS93OnzybWqk0SBLVDfpWNoRwghy3/CXLsjlmRBRpDlleFM?=
 =?iso-8859-1?Q?GFoO9XUe2J6W9PQBUuPXvAleQPi9KSpuRsUloisP2sHKAW+RQPYHD39n5O?=
 =?iso-8859-1?Q?r6C0tkD6n35zaAcKN3JWiBcN76KqsBF1BZE9TEz5vHTlrJ3nP2XTgBSHO4?=
 =?iso-8859-1?Q?jpVsLJnh/fogwKGlonMwdYSu197E77q4mZUmflZxrvHyb0ywDIsQxoM/yl?=
 =?iso-8859-1?Q?mdG7mF9Zvm6h0oq8/P+iUP45wDl/dEFng1bBeCwnPWAb0Pc+XhfuebqfGD?=
 =?iso-8859-1?Q?jR18sywQUhyxAxD+zTfSc7lH7WZmBWUCV7CQ8cFHZmNZdh/Z10Kr6lAbeG?=
 =?iso-8859-1?Q?xCCufonwNgeUBXgLzfYBcrMG0PrTYKkXiYJyXr9qYjfbW8Xsao99dyNAXe?=
 =?iso-8859-1?Q?mpnkjXLJ5AP5nRI1wbJwZnS4v9YkD20gZ1B4UszpVX5PT0gMQrSXnZUWSN?=
 =?iso-8859-1?Q?VRpBc6Gz2qWTba6Qr/wxVQmgyul5QkmSf+NziQE1T/29zlcaLIT0z7Vg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a51d4c7-9e64-4fd3-3bc4-08ddeaec6fbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 13:18:54.5998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8dQaThsDsX4szzR2s/BjEQ7deNG0OMzq2fTJ3OAnG2H0lnweZCn2PFSkjBsUIIoZpyymPhgD48AtbLP/F53bPEuHP1CqrX8EwiggwPScfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7571

This patch adds the basic framework for ARM SCI mediator. SCI is System
Control Interface, which is designed to redirect requests from the Domains
to ARM specific Firmware (for example SCMI). This will allow the devices,
passed-through to the different Domains, to access to the System resources
(such as clocks/resets etc) by sending requests to the firmware.

ARM SCI subsystem allows to implement different SCI drivers to handle
specific ARM firmware interfaces (like ARM SCMI) and mediate requests
-between the Domains and the Firmware. Also it allows SCI drivers to perfor=
m
proper action during Domain creation/destruction which is vital for
handling use cases like Domain reboot.

This patch introduces new DEVICE_FIRMWARE device subclass for probing SCI
drivers basing on device tree, SCI drivers register itself with
DT_DEVICE_START/END macro. On init - the SCI drivers should register its
SCI ops with sci_register(). Only one SCI driver can be supported.

At run-time, the following SCI API calls are introduced:

- sci_domain_sanitise_config() called from arch_sanitise_domain_config()
- sci_domain_init() called from arch_domain_create()
- sci_relinquish_resources() called from domain_relinquish_resources()
- sci_domain_destroy() called from arch_domain_destroy()
- sci_handle_call() called from vsmccc_handle_call()
- sci_dt_handle_node()
- sci_dt_finalize() called from handle_node() (Dom0 DT)

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---

(no changes since v7)

Changes in v7:
- fix sci_handl_call to make changes more readable
- fix build error when DOM0LESS_BUILD is disabled (removed
 arch_handle_passthrough_prop from the header)
- sort headers in alphabetical order in sci.h

Changes in v6:
- rebase on top of the latest master
- fix return value of sci_dt_finalize() call

Changes in v5:
- update Maintainers file. Set role as a Reviewer
- rebased on the latest master branch
- Introduce arch_handle_passthrough_prop call to handle arm specific nodes

Changes in v4:
- fix SPDX-License
- rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
- move XEN_DOMCTL_assign_device code in separate patch
- Add documentation for SCI SCMI drivers

 MAINTAINERS                             |   6 +
 xen/arch/arm/device.c                   |   5 +
 xen/arch/arm/dom0less-build.c           |   8 +
 xen/arch/arm/domain.c                   |  12 +-
 xen/arch/arm/domain_build.c             |   8 +
 xen/arch/arm/firmware/Kconfig           |   8 +
 xen/arch/arm/firmware/Makefile          |   1 +
 xen/arch/arm/firmware/sci.c             | 154 ++++++++++++++++++
 xen/arch/arm/include/asm/domain.h       |   5 +
 xen/arch/arm/include/asm/firmware/sci.h | 200 ++++++++++++++++++++++++
 xen/arch/arm/vsmc.c                     |   3 +-
 xen/common/device-tree/dom0less-build.c |   4 +
 xen/include/asm-generic/device.h        |   1 +
 xen/include/public/arch-arm.h           |   4 +
 xen/include/xen/dom0less-build.h        |   3 +
 15 files changed, 420 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c4886c1159..31dbba54bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -509,6 +509,12 @@ R:	George Dunlap <gwd@xenproject.org>
 S:	Supported
 F:	xen/common/sched/
=20
+SCI MEDIATORS
+R:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+S:	Supported
+F:	xen/arch/arm/firmware/sci.c
+F:	xen/arch/arm/include/asm/firmware/sci.h
+
 SEABIOS UPSTREAM
 M:	Wei Liu <wl@xen.org>
 S:	Supported
diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 11523750ae..74b54cad34 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -13,6 +13,7 @@
 #include <xen/iocap.h>
 #include <xen/lib.h>
=20
+#include <asm/firmware/sci.h>
 #include <asm/setup.h>
=20
 int map_irq_to_domain(struct domain *d, unsigned int irq,
@@ -303,6 +304,10 @@ int handle_device(struct domain *d, struct dt_device_n=
ode *dev, p2m_type_t p2mt,
                 return res;
             }
         }
+
+        res =3D sci_assign_dt_device(d, dev);
+        if ( res )
+            return res;
     }
=20
     res =3D map_device_irqs_to_domain(d, dev, own_device, irq_ranges);
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index c8d07213e2..0094cf9e40 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -22,6 +22,7 @@
=20
 #include <asm/arm64/sve.h>
 #include <asm/domain_build.h>
+#include <asm/firmware/sci.h>
 #include <asm/grant_table.h>
 #include <asm/setup.h>
=20
@@ -272,6 +273,12 @@ int __init init_vuart(struct domain *d, struct kernel_=
info *kinfo,
     return rc;
 }
=20
+int __init arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                        struct dt_device_node *node)
+{
+    return sci_assign_dt_device(kinfo->bd.d, node);
+}
+
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
@@ -281,6 +288,7 @@ int __init arch_parse_dom0less_node(struct dt_device_no=
de *node,
=20
     d_cfg->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
+    d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
=20
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 863ae18157..1a8585d02b 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -24,6 +24,7 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/firmware/sci.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
@@ -699,7 +700,7 @@ int arch_sanitise_domain_config(struct xen_domctl_creat=
edomain *config)
         return -EINVAL;
     }
=20
-    return 0;
+    return sci_domain_sanitise_config(config);
 }
=20
 int arch_domain_create(struct domain *d,
@@ -791,6 +792,9 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl =3D config->arch.sve_vl;
 #endif
=20
+    if ( (rc =3D sci_domain_init(d, config)) !=3D 0 )
+        goto fail;
+
     return 0;
=20
 fail:
@@ -851,6 +855,7 @@ void arch_domain_destroy(struct domain *d)
     domain_vgic_free(d);
     domain_vuart_free(d);
     free_xenheap_page(d->shared_info);
+    sci_domain_destroy(d);
 #ifdef CONFIG_ACPI
     free_xenheap_pages(d->arch.efi_acpi_table,
                        get_order_from_bytes(d->arch.efi_acpi_len));
@@ -1044,6 +1049,7 @@ enum {
     PROG_p2m_root,
     PROG_p2m,
     PROG_p2m_pool,
+    PROG_sci,
     PROG_done,
 };
=20
@@ -1103,6 +1109,10 @@ int domain_relinquish_resources(struct domain *d)
         ret =3D relinquish_p2m_mapping(d);
         if ( ret )
             return ret;
+    PROGRESS(sci):
+        ret =3D sci_relinquish_resources(d);
+        if ( ret )
+            return ret;
=20
     PROGRESS(p2m_root):
         /*
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a9e4153e3c..039aa71439 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -28,6 +28,7 @@
 #include <asm/setup.h>
 #include <asm/tee/tee.h>
 #include <asm/pci.h>
+#include <asm/firmware/sci.h>
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
@@ -1640,6 +1641,9 @@ static int __init handle_node(struct domain *d, struc=
t kernel_info *kinfo,
         return 0;
     }
=20
+    if ( sci_dt_handle_node(d, node) )
+        return 0;
+
     /*
      * The vGIC does not support routing hardware PPIs to guest. So
      * we need to skip any node using PPIs.
@@ -1740,6 +1744,10 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
         if ( res )
             return res;
=20
+        res =3D sci_dt_finalize(d, kinfo->fdt);
+        if ( res )
+            return res;
+
         /*
          * Create a second memory node to store the ranges covering
          * reserved-memory regions.
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 817da745fd..fc7918c7fc 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -1,3 +1,11 @@
+config ARM_SCI
+	bool
+	depends on ARM
+	help
+	  This option enables generic Arm SCI (System Control Interface) mediator=
s
+	  support. It allows domains to control system resources via one of
+	  Arm SCI mediators drivers implemented in XEN, like SCMI.
+
 menu "Firmware Drivers"
=20
 config SCMI_SMC
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefil=
e
index a5e4542666..71bdefc24a 100644
--- a/xen/arch/arm/firmware/Makefile
+++ b/xen/arch/arm/firmware/Makefile
@@ -1 +1,2 @@
+obj-$(CONFIG_ARM_SCI) +=3D sci.o
 obj-$(CONFIG_SCMI_SMC) +=3D scmi-smc.o
diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
new file mode 100644
index 0000000000..e1522e10e2
--- /dev/null
+++ b/xen/arch/arm/firmware/sci.c
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic part of the SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/acpi.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/firmware/sci.h>
+
+static const struct sci_mediator_ops __read_mostly *cur_mediator;
+
+int sci_register(const struct sci_mediator_ops *ops)
+{
+    if ( cur_mediator )
+        return -EEXIST;
+
+    if ( !ops->domain_init || !ops->domain_destroy || !ops->handle_call )
+        return -EINVAL;
+
+    cur_mediator =3D ops;
+
+    return 0;
+};
+
+bool sci_handle_call(struct cpu_user_regs *args)
+{
+    if ( unlikely(!cur_mediator) )
+        return false;
+
+    return cur_mediator->handle_call(args);
+}
+
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *conf=
ig)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    return cur_mediator->domain_init(d, config);
+}
+
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->domain_sanitise_config )
+        return 0;
+
+    return cur_mediator->domain_sanitise_config(config);
+}
+
+void sci_domain_destroy(struct domain *d)
+{
+    if ( !cur_mediator )
+        return;
+
+    cur_mediator->domain_destroy(d);
+}
+
+int sci_relinquish_resources(struct domain *d)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->relinquish_resources )
+        return 0;
+
+    return cur_mediator->relinquish_resources(d);
+}
+
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_handle_node )
+        return 0;
+
+    return cur_mediator->dom0_dt_handle_node(d, node);
+}
+
+int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_finalize )
+        return 0;
+
+    return cur_mediator->dom0_dt_finalize(d, fdt);
+}
+
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
+{
+    struct dt_phandle_args ac_spec;
+    int index =3D 0;
+    int ret;
+
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->assign_dt_device )
+        return 0;
+
+    while ( !dt_parse_phandle_with_args(dev, "access-controllers",
+                                        "#access-controller-cells", index,
+                                        &ac_spec) )
+    {
+        printk(XENLOG_DEBUG "sci: assign device %s to %pd\n",
+               dt_node_full_name(dev), d);
+
+        ret =3D cur_mediator->assign_dt_device(d, &ac_spec);
+        if ( ret )
+            return ret;
+
+        index++;
+    }
+
+    return 0;
+}
+
+static int __init sci_init(void)
+{
+    struct dt_device_node *np;
+    unsigned int num_sci =3D 0;
+    int rc;
+
+    dt_for_each_device_node(dt_host, np)
+    {
+        rc =3D device_init(np, DEVICE_FIRMWARE, NULL);
+        if ( !rc && num_sci )
+        {
+            printk(XENLOG_ERR
+                   "SCMI: Only one SCI controller is supported. found seco=
nd %s\n",
+                   np->name);
+            return -EOPNOTSUPP;
+        }
+        else if ( !rc )
+            num_sci++;
+        else if ( rc !=3D -EBADF && rc !=3D -ENODEV )
+            return rc;
+    }
+
+    return 0;
+}
+
+__initcall(sci_init);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index a3487ca713..af3e168374 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -120,6 +120,11 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+#ifdef CONFIG_ARM_SCI
+    bool sci_enabled;
+    /* ARM SCI driver's specific data */
+    void *sci_data;
+#endif
=20
 }  __cacheline_aligned;
=20
diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include=
/asm/firmware/sci.h
new file mode 100644
index 0000000000..66c88cec3c
--- /dev/null
+++ b/xen/arch/arm/include/asm/firmware/sci.h
@@ -0,0 +1,200 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic ARM SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#ifndef __ASM_ARM_SCI_H
+#define __ASM_ARM_SCI_H
+
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#ifdef CONFIG_ARM_SCI
+
+struct sci_mediator_ops {
+    /*
+     * Called during domain construction. If it is requested to enable
+     * SCI support, so SCI driver can create own structures for the new do=
main
+     * and inform firmware about new domain (if required).
+     * Mandatory.
+     */
+    int (*domain_init)(struct domain *d,
+                       struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain construction. The SCI driver uses
+     * it to sanitize domain SCI configuration parameters.
+     * Optional.
+     */
+    int (*domain_sanitise_config)(struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain destruction, releases all resources, that
+     * were allocated for domain.
+     * Mandatory.
+     */
+    void (*domain_destroy)(struct domain *d);
+
+    /*
+     * Called during domain destruction to relinquish resources used
+     * by SCI driver itself and request resources releasing from firmware.
+     * Optional.
+     */
+    int (*relinquish_resources)(struct domain *d);
+
+    /* SMC/HVC Handle callback */
+    bool (*handle_call)(struct cpu_user_regs *regs);
+
+    /*
+     * Dom0 DT nodes handling callback so SCI driver can detect DT nodes i=
t
+     * need to handle and decide if those nodes need to be provided to Dom=
0.
+     * Optional.
+     */
+    bool (*dom0_dt_handle_node)(struct domain *d, struct dt_device_node *n=
ode);
+
+    /*
+     * SCI driver callback called at the end of Dom0 DT generation, so
+     * it can perform steps to modify DT to enable/disable SCI
+     * functionality for Dom0.
+     */
+    int (*dom0_dt_finalize)(struct domain *d, void *fdt);
+
+    /*
+     * SCI driver callback called when DT device is passed through to gues=
t,
+     * so SCI driver can enable device access to the domain if SCI FW prov=
ides
+     * Device specific access control functionality.
+     * Optional.
+     */
+    int (*assign_dt_device)(struct domain *d, struct dt_phandle_args *ac_s=
pec);
+};
+
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return d->arch.sci_enabled;
+}
+
+/*
+ * Register SCI subsystem ops.
+ *
+ * Register SCI drivers operation and so enable SCI functionality.
+ * Only one SCI driver is supported.
+ */
+int sci_register(const struct sci_mediator_ops *ops);
+
+/*
+ * Initialize SCI functionality for domain if configured.
+ *
+ * Initialization routine to enable SCI functionality for the domain.
+ * The SCI configuration data and decision about enabling SCI functionalit=
y
+ * for the domain is SCI driver specific.
+ */
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *conf=
ig);
+
+/*
+ * Sanitise domain configuration parameters.
+ *
+ */
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config);
+
+/*
+ * Destroy SCI domain instance.
+ */
+void sci_domain_destroy(struct domain *d);
+
+/*
+ * Free resources assigned to the certain domain.
+ */
+int sci_relinquish_resources(struct domain *d);
+
+/*
+ * SMC/HVC Handle callback.
+ *
+ * SCI driver acts as SMC/HVC server for the registered domains and
+ * does redirection of the domain calls to the SCI firmware,
+ * such as ARM TF-A or similar.
+ */
+bool sci_handle_call(struct cpu_user_regs *regs);
+
+/*
+ * Dom0 DT nodes handling function.
+ *
+ * Allows SCI driver to detect DT nodes it need to handle and decide if
+ * those nodes need to be provided to Dom0.
+ */
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node);
+
+/*
+ * Dom0 DT generation finalize.
+ *
+ * Called at the end of Dom0 DT generation, so SCI driver can perform step=
s
+ * to modify DT to enable/disable SCI functionality for Dom0.
+ */
+int sci_dt_finalize(struct domain *d, void *fdt);
+
+/*
+ * Assign DT device to domain.
+ *
+ * Called when DT device is passed through to guest, so SCI driver can ena=
ble
+ * device access to the domain if SCI FW provides "Device specific access
+ * control" functionality.
+ */
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
+#else
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return false;
+}
+
+static inline int sci_domain_init(struct domain *d,
+                                  struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline int
+sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline void sci_domain_destroy(struct domain *d)
+{}
+
+static inline int sci_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+static inline bool sci_handle_call(struct cpu_user_regs *args)
+{
+    return false;
+}
+
+static inline bool sci_dt_handle_node(struct domain *d,
+                                      struct dt_device_node *node)
+{
+    return false;
+}
+
+static inline int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    return 0;
+}
+
+static inline int sci_assign_dt_device(struct domain *d,
+                                       struct dt_device_node *dev)
+{
+    return 0;
+}
+
+#endif /* CONFIG_ARM_SCI */
+
+#endif /* __ASM_ARM_SCI_H */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 6081f14ed0..4095171533 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -12,6 +12,7 @@
 #include <public/arch-arm/smccc.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/firmware/sci.h>
 #include <asm/monitor.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
@@ -232,7 +233,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
     if ( platform_smc(regs) )
         return true;
=20
-    return scmi_handle_smc(regs);
+    return (scmi_handle_smc(regs)) ? true : sci_handle_call(regs);
 }
=20
 /*
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index badc227031..aaa5e9b22c 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -228,6 +228,10 @@ static int __init handle_passthrough_prop(struct kerne=
l_info *kinfo,
     if ( res < 0 )
         return res;
=20
+    res =3D arch_handle_passthrough_prop(kinfo, node);
+    if ( res )
+        return res;
+
     /* If xen_force, we allow assignment of devices without IOMMU protecti=
on. */
     if ( xen_force && !dt_device_is_protected(node) )
         return 0;
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/dev=
ice.h
index 3bd97e33c5..cb13f7faea 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -18,6 +18,7 @@ enum device_class
     DEVICE_IOMMU,
     DEVICE_INTERRUPT_CONTROLLER,
     DEVICE_PCI_HOSTBRIDGE,
+    DEVICE_FIRMWARE,
     /* Use for error */
     DEVICE_UNKNOWN,
 };
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e2412a1747..e7a17ede3e 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -327,6 +327,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
=20
+#define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
@@ -350,6 +352,8 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+    /* IN */
+    uint8_t arm_sci_type;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-bu=
ild.h
index 408859e325..faaf660424 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -62,6 +62,9 @@ void set_domain_type(struct domain *d, struct kernel_info=
 *kinfo);
 int init_intc_phandle(struct kernel_info *kinfo, const char *name,
                       const int node_next, const void *pfdt);
=20
+int arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                 struct dt_device_node *node);
+
 #else /* !CONFIG_DOM0LESS_BOOT */
=20
 static inline void create_domUs(void) {}
--=20
2.34.1

