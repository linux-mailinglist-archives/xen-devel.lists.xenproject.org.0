Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C91C699EB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164699.1491598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsu-0004SB-EC; Tue, 18 Nov 2025 13:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164699.1491598; Tue, 18 Nov 2025 13:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsu-0004Pm-AQ; Tue, 18 Nov 2025 13:36:40 +0000
Received: by outflank-mailman (input) for mailman id 1164699;
 Tue, 18 Nov 2025 13:36:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ey2=52=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vLLss-0004PV-O0
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:36:38 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a0e168d-c483-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 14:36:35 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7650.eurprd03.prod.outlook.com
 (2603:10a6:102:1de::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 13:36:32 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 13:36:32 +0000
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
X-Inumbo-ID: 9a0e168d-c483-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsgT4JlWgjdTEO5W/cqBfLThrza7pIEkqhBxyCt5amD+RFf1yURz3jVucYhmTR7LIQqFGE1eHYiNkZfkn9D/kjO1orviE/wVs/oN6lVZ9z8UnN2eEmHkWGXXgzKPA1UFAMOXynW6XTorz1OsDsWVO6+M3Yrk0kQlZJyA5+s5+IxLZCoXI3vRAByPEAljY7/6sjaO8D3nwXjurXqfguJk0aGsC04KGeKRNYbJa18/R6PvO5gyQMt6hi4sTxpeYxPIn1RXhFuucTUAoXGUwqhxx4UUc/zsKjQYhIxlKKlVRcZn1LkOKzk34uqtInkgxzPB39ZvZOHo9s/waBUeBVUKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkB35NieCXk1vIie1ryoHvk/rHk8k3GfGPh6rTR6Gp8=;
 b=J0qQ7bqaW6Wf3c6tsx0xvg5qvTwb5tPsBpXCaCktFjOrKp8Po/YVFXhbfwkhzJZIRIK4THbhhglTDQp3rHCkjL0lUMFeTQieM7c1uLSqLr+YYobF6k8LCr4q/KyI1X/0uBhouT2MFbCEkqVv+SUSUMfV4rGhiS/UXFFr85x2L86qF9FCH6uqp3Dt2LOSH6D3a+1wbai19JDTtcnZ/k8A3KmYAOjMSkS8Iq9tZifBS4aeTAUAGhR3X2Ei4JWp45oQnnUTLacXiujK0PyblPP1fArJNu/qyrBhlMhFYyv/XxmshUfhEzNCy+C6J0I4n+4GBjKK8Xos4x5u44J7CuHpDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkB35NieCXk1vIie1ryoHvk/rHk8k3GfGPh6rTR6Gp8=;
 b=Uyqh29VOoHMkt1aAGe3DgRnf0fC5AsD/RqO1Litd8n2r91lxeqF3SIM1afYHiaFkGGJdhuImTJQMuRZQAQ18WWBcxUN6ULqIeLt6x7gpHPMR7BX5JPCKdFz5RGemtiFybp37MELXnrbXqwgbNCxwUrSwRftxt30IQsLSParVa64OE2ut6Gyc73A3e4Ogx1FzN4F9FZcT/IERYW9wOXdCW0WFw7vRAde5lWPr/imgH8FvnfwolA+lJjteAXG3ImgwSA+21oPDx6VHXqwTGJRwTr6cE47rTDXAR0AzO5jOss/4gAX8O/2da3CW68O/G3Qt8qFs/7dhLOspnd7fBdnRZQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v3 0/8] Implement PCI device enumeration on Arm
Thread-Topic: [PATCH v3 0/8] Implement PCI device enumeration on Arm
Thread-Index: AQHcWJBZXXA6diOiFk6VZUR45VGpMw==
Date: Tue, 18 Nov 2025 13:36:32 +0000
Message-ID: <cover.1763462211.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7650:EE_
x-ms-office365-filtering-correlation-id: 74e783ed-758d-40be-258e-08de26a77c8e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8YEepBJvnDDdfqTg8sn6zrAbipI9aBODERSsBdP3GT3bG3evXz3Rmc8tY5?=
 =?iso-8859-1?Q?qmwSxJ2STHcPcC5yxnrghKt3XHyDqU4g+pwMEURwaYsPv53oQ8MKoxdDUz?=
 =?iso-8859-1?Q?wWZdQ16Mc4GS8gtaTcWbjDcxyptFZdtHS5mweQVPT0ee24LqPuRIa9RNNd?=
 =?iso-8859-1?Q?weEHM7n5RGxTUDmy1mBxMW1HU+T9gHFxNcC+Wye8C0IXMNKWW3wUPsw6kl?=
 =?iso-8859-1?Q?klyTdV6D6yMImjV4NsmLwvCpJP2RtLHsHErQSGXXu/UQsyfXkAOAkMqjMf?=
 =?iso-8859-1?Q?VCiWWaiVRotd+D4oejzPgYbCP3SjAOwlDeqeiPk5fi+XGoq2JOLH9sdQEP?=
 =?iso-8859-1?Q?FNl/CziGV3bOB4BNGPs3PeuoAUlHFdHGI+otMlvwj7xqVD8HY8/uB9eZc6?=
 =?iso-8859-1?Q?Uh6I2iOckkBO2LuMwNUcuPN5ye2wyDo2TuJBEAPiw7mMNK7CeA7kOTSS0U?=
 =?iso-8859-1?Q?H7aB5Ui+GQ3ojDgXNuVoQ52jJ5YyfM0DxQ8QIKvSX1mGL/X1N1HXVdmslE?=
 =?iso-8859-1?Q?yTsFC7aVBKYzoIwS1uN7Mdd2Thh8ybrR76miKQQc2HQXijVzlh02IOl3DR?=
 =?iso-8859-1?Q?Z9R1mYLZjJkYBDiXcy7eF/vsBND62ruG8Dcq7uWEFeS2P0/ccultk+k+R8?=
 =?iso-8859-1?Q?tnFlezNE+7v4g+tszRTpGe7SSXHQOv3WWSPWAI6Bi98M3p27E8tCXeTBav?=
 =?iso-8859-1?Q?8RLk7BpIN7ZV8Q6WiDSB9e/KWBi4GpHWMRYbEo04KXe9WyQlLnHEEmZPah?=
 =?iso-8859-1?Q?yV5PKyNSlFj9GLrU6UEARhYctHUCkZ0smnmg4B2/v2H36T/oh5TkgrrY1C?=
 =?iso-8859-1?Q?4Nopc9c9umUUh2n723m6QpYCIaHz9xiJ3eQobcLPSE3tk29MoY2IqYd19i?=
 =?iso-8859-1?Q?Bjmx3ArsU682exx4jQaIeof5qrTX0Qg0O6aTb0uKYQ2L+uWk+Y83UsXSIq?=
 =?iso-8859-1?Q?zJ1xB7Oq70yF3UCGjMkwF1fkfkz/7fgLbYQ7yrZCCYwOy0djDoMJfSVili?=
 =?iso-8859-1?Q?iAnhSor07qFMDraRhhyn2Y+m7DX0FH+TIf9cM/fqY4fr8flDX2q0wiOyUN?=
 =?iso-8859-1?Q?4/kjpkb0KjfWxFbE1DxHsyzOis6zsfOyj+3mmNP9a30IjZv/NOYO9ZPtZD?=
 =?iso-8859-1?Q?wON+pHx8MoH2BDAH0we7br7GMSunQS6yIGwL66L9R9KxN+2CIQCDoTpok9?=
 =?iso-8859-1?Q?z9vmpGuf5czO/hBohQNuncR9hNYlJv6BqpH7MKBOv7vTOaO/1gqg9HIJ7r?=
 =?iso-8859-1?Q?av4G8vPUksMM6lGhNP7OcV0XtTwX+Akvdu5DUTL5pHZLM+dox4mW0wwEaQ?=
 =?iso-8859-1?Q?hs6UpNskbd+VyDDZNHR1RcTUx4Qn986QIcc2covESQ90gS5sUKlqaEWFuH?=
 =?iso-8859-1?Q?AJ8TlJeUBCAusif5203Jb/8+RpAL1zlPRbOhMGARx5rWKeb2sUc7kykaLN?=
 =?iso-8859-1?Q?2rmo3Nty5vS4V40kZH7FSLh5zrTgOekRAgKbRjrcNRpjXyFgE4UZBJiEiL?=
 =?iso-8859-1?Q?Hx2pzv4NjnL2P9AyGlcHszSpsMdWlppnpYzVy6CjXSq/zbDxfg3bWLCVwM?=
 =?iso-8859-1?Q?LOD6is1c9aZAmDK4B9IRD/xfc7u4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xQVPeNIBpy2zS1Z/fXrbPFOKaxoyrZgRxIvJklkbJXDgW+jc1mLn2viPOO?=
 =?iso-8859-1?Q?ZrBC39GxoPddDRFEI4Vpnt214FJJl59nQGu67gmT0AiAelAv2AGPh77oi8?=
 =?iso-8859-1?Q?zvgD6jb5Ca+2Bp/eRNVaWAooxTx2T62M5jivMOST01psOG5DqUa9xfXBYa?=
 =?iso-8859-1?Q?CELthhuXvGwqKm46+Gw+l8LB14o0D3LOG65aoMyPgg/s0mMuyOsi9bTvtS?=
 =?iso-8859-1?Q?7FjpkNupC0oXCJKAUTWZxBHe135ez5zvtcP0pAMgQiPmfxeArYpp7kXBXa?=
 =?iso-8859-1?Q?7IY94/0SoLcg8l5WNhD2VBFGbedP2QTKw9yLAJVLFLVv9wF4iNBGMpfi9G?=
 =?iso-8859-1?Q?VNY9ymY8VIa/WH/91q4oc6ea+UZ6pPd9xM8L1Sm6QeX2IYXrnkf5JGjH/K?=
 =?iso-8859-1?Q?eJmvQzETPdWKSpKN3iEf+hVyggFDRkWhOdwN5KYnu8Wu6u3AXRmRpNjJtr?=
 =?iso-8859-1?Q?y2+c+ukLhWv5xIDr4TfYC3O+CjckciyqMybQYERqZdyaDzxrX7qSQxBnwM?=
 =?iso-8859-1?Q?lWYlfuEFbt+rzK0xDWQujoBTa9X4wAUX+CnSaN58dtY/3wZW9jMEDoQ/1v?=
 =?iso-8859-1?Q?s2f5MBB4J+jZ1ZfmS6nhlX2WqST3yVSE97+Rp3O4Xozu70dQt4nwGxMxbA?=
 =?iso-8859-1?Q?GJ6ZOxJgp3R0hbEVWOaPjYrlv55gLLRnCSR2KX8Y5E0CU/qNlf7ESgbmlu?=
 =?iso-8859-1?Q?Lokz/3diP7AZ8tM2/RgW1n+dXz5VmS86clD483CMI7aiJEVXbuwvkcYvSs?=
 =?iso-8859-1?Q?oh7d7ayXKXlZRwFI/QeYu3XJxML1i8Co0DAGfhY0kTl45y82Q9vGUJNlS+?=
 =?iso-8859-1?Q?N3BIJQ2no3r9Lv9Dt0snLXq31phhCp8m4hcQ/0LfwuHfQOogD/9qV5pNcx?=
 =?iso-8859-1?Q?IL3CtgVVEtuxM5Wamb9nmJSHmMr7Vo6/0YT8odHpeMSZLskuTh+YV0NBKT?=
 =?iso-8859-1?Q?wtsaPIzN6xER+n0Ta2gVAq5EJXmFTO16urjqtcvbDsSdK0DlcTRt0fenFF?=
 =?iso-8859-1?Q?BKdiQx78T/P4Kd5tgOgWvkSD6X1S9usShhqq6+UjKRVmYCAOHyFbXbGDdB?=
 =?iso-8859-1?Q?RCPex60+6nOs8SniHhvS45ZLJCXPJzuyVdamgY61zaQG7xRbVK+a8g+zJz?=
 =?iso-8859-1?Q?/kCkYYZWAJIcV3ckSKYXS7PBxOKFDFWpDqH6adcToyMmPTj1Ts22hHdbzL?=
 =?iso-8859-1?Q?2X0D50xJwyzKZF4ZyLey+6RHgJ0muBqZ1rAWXK+LpGnucft1vUUdD/wA86?=
 =?iso-8859-1?Q?ldHr2cRHjme1Om+y/26SOKztUcBMlaeFzSfnt/SLAbfam7yiM6UwmzG4sw?=
 =?iso-8859-1?Q?wmZcaT5G6MeptyuAbJRhQEobhm0rvN32RVT9xiCZ94X9ASI9vqLFj4FAtZ?=
 =?iso-8859-1?Q?rJCZM17IwhTdoSk5LvLo3xroGGpF66bVP8gqweh1Pavk0DddNFDnGSr39W?=
 =?iso-8859-1?Q?uKT1UwjFtqKGfubEBhRo1Epnm6tiOxUPJI3vKUdaQje6d6i1qYZNYmduG4?=
 =?iso-8859-1?Q?cmVZZtkalAy6PufYG/vv8wBkW8CtTAOzuriQnUOa26zxwUxsIvLJwzvf75?=
 =?iso-8859-1?Q?t9JpW9c5mIHtMeVVi9QjGUA5m6yRukuihgpWfSIeELPJfoTWLmTM9WdB8/?=
 =?iso-8859-1?Q?unOguzPMu9XoB0eSWu3BzURDF2JmC2B11naSX9ezGkRt4ngTIqJI0CTA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e783ed-758d-40be-258e-08de26a77c8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 13:36:32.4028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4AAsNTdmEhfeFkOrkF1QM5J0pPD770y0+rYbzLLDTGuDBUIe9MwwIe8iqDNJLnmO4Qx1bb8S1TlGN511JI9sNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7650

This series adds basic PCI device enumeration in Xen on Arm. This will allo=
w us
to not rely on Dom0 enumeration for supported controllers, which will enabl=
e PCI
passthrough for dom0less setups.

Enumeration is disabled by default and can be enabled with "pci-scan" cmdli=
ne
option.

For now the discovered devices are only assigned to HW domain. To achieve t=
his,
several things need to be done:
1. A VPCI node is created for HW domain device tree, and the real PCI nodes=
 are
hidden from it.
2. Discovered devices BARs are initialized.
3. Register handles for VPCI are updated to change behaviour depending on
whether or not the calling domain uses VPCI or HW PCI, instead of relying o=
n
is_hardware_domain()

Tested on QEMU.
Arm:
* pci-scan=3Dyes pci-passthrough=3Dyes
* pci-scan=3Dno pci-passthrough=3Dyes
* pci-scan=3Dno pci-passthrough=3Dno
X86:
* no special options

v2->v3:
* add arm/pci: Mark pci_host_common_probe as init
* reorder patches
* see individual patches

v1->v2:
* drop xen/pci: disable pci_device_{add,remove} when hwdom uses vpci on arm
* see individual patches


Edward Pickup (1):
  arm/pci: Add pci-scan boot argument

Luca Fancellu (2):
  xen/pci: update DT for hwdom when it uses vpci
  xen/pci: assign discovered devices to hwdom

Mykyta Poturai (2):
  arm/pci: Mark pci_host_common_probe as init
  arm/pci: enable vpci for hwdom when pci-scan is enabled

Stefano Stabellini (1):
  xen/vpci: introduce has_vpci_bridge

Stewart Hildebrand (2):
  xen/dt: pass flags to callback in dt_for_each_range()
  xen/pci: initialize BARs

 docs/misc/xen-command-line.pandoc    |   9 ++
 xen/arch/arm/device.c                |   4 +-
 xen/arch/arm/domain_build.c          | 154 ++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain.h    |   3 +-
 xen/arch/arm/include/asm/pci.h       |  10 ++
 xen/arch/arm/include/asm/setup.h     |   2 +-
 xen/arch/arm/pci/pci-host-common.c   | 110 ++++++++++++++++++-
 xen/arch/arm/pci/pci.c               | 139 +++++++++++++++++++++++-
 xen/common/device-tree/device-tree.c |   5 +-
 xen/common/rangeset.c                |  62 ++++++++++-
 xen/drivers/passthrough/arm/iommu.c  |  15 +++
 xen/drivers/passthrough/pci.c        |  11 ++
 xen/drivers/vpci/header.c            |  74 ++++++-------
 xen/drivers/vpci/vpci.c              |   4 +-
 xen/include/xen/device_tree.h        |   2 +-
 xen/include/xen/rangeset.h           |  11 ++
 xen/include/xen/vpci.h               |   8 ++
 17 files changed, 565 insertions(+), 58 deletions(-)

--=20
2.51.2

