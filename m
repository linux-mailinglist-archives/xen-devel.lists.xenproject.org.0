Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F0A2736F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881482.1291653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNR-0008Aa-UU; Tue, 04 Feb 2025 13:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881482.1291653; Tue, 04 Feb 2025 13:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNR-00087w-Qb; Tue, 04 Feb 2025 13:54:09 +0000
Received: by outflank-mailman (input) for mailman id 881482;
 Tue, 04 Feb 2025 13:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jloo=U3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tfJNP-0007bp-Ti
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:54:07 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f403:260d::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f97726e-e2ff-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 14:54:06 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB10120.eurprd03.prod.outlook.com
 (2603:10a6:20b:57f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 13:54:04 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 13:54:03 +0000
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
X-Inumbo-ID: 7f97726e-e2ff-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGZL0ZMd3bsoeEyN70EuVVLItPh8YH+wsxE/mSwL/Ri1eGUr8VBcKQ2g5Nxh3DFF64bM5O2bvTGdsWOdvFweOAuyeBPLFn4izZ57Uwe2Q31ryS5Y/VXHFrxei5OsoHFulyeXxT8eGTViiZXHZvioZJruW3fLEHUJ8PeOmzYFaZpeHpFhSfO9RPjcnu1/yWzcyVw8pA8S6W1r49g4dmI6anhDTf6Mt1UT5P7EC52AD/qVStucRCbd115vE3x8DVbbXwkPSV5IOUiBjfdc/y2sXpF+Mw1esJMajhXBkG5B5rLs2PAG6l4YW/meRkGT2m53k+XHmqcAsFNSC7dqlO2GEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKTBm2RZE0pMVnRAxDCvI2tXHKoAe5L9tuqQ8B6N5H4=;
 b=p0bDjq3LrenkrAlWLwXxUvW3JnroixD/en0rBZzpaRIznwbhxlEwD+tFeOvRzhK4pf5wAfwlIGerCGWRuiDP4cZxiaR4JGXZSG8qgISmUGpyvast56oFAF/k8BYTVd8tNBBCH4pu2PIZjzF1xXnsLkS2snscrhP7gnKmR307csKhK9IoqcWoSdXA84R+BC/sE7jofExesVQQ7qq/rd9ssupeHQsZUa1UgyC8GwZPlB7m9x13EYnLdWZDGHV9jHaWINBFUYE1SJa/Czr7aLoiq7JByKBHBpPfe71XMJta0V3peECYjic0MC+XQGV2EMnTZ1XmoE9NWhPFQYF6Vd+fuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKTBm2RZE0pMVnRAxDCvI2tXHKoAe5L9tuqQ8B6N5H4=;
 b=Mcpy4rHY46EVMe4DndCtPrElFeLJoUZUPjTWwhxBKAkIdYDXUaV4l8crGWmX+VrsZFjbYWMi6BDV8HvjeGoGrMbOA1x+Dt7PqQdzQQ+Ca2U3qaMpo4KPFFVU6z/VmQZDs7H6TNW15yyrKFdJulVBpSNZua1uVFhYDUC87pdit2bsE9CCPEs/sMhYfPqlPdNPu5aJHs3JwsB/B/4kLUuazM4kMd1TYrQ1DZ3yFiz0HCeQtzYzXuGko8M5EUmtH3B2H8OS2VKFKZdB808go08gP7OYpnPYS21bWm/w1moUHAJwhXX64Hblc3ua1VR8OH2BSUWG2vhk75qiodWeWHCxew==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v7 3/8] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
Thread-Topic: [PATCH v7 3/8] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
Thread-Index: AQHbdww/vF8UEX8f+Eqe/gBBXDD4hg==
Date: Tue, 4 Feb 2025 13:54:03 +0000
Message-ID:
 <67c485e674b2828e15660baf1d4c050e734cbb59.1738665272.git.mykyta_poturai@epam.com>
References: <cover.1738665272.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1738665272.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB10120:EE_
x-ms-office365-filtering-correlation-id: 4f585b5f-d899-4515-ca54-08dd45236262
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?T+t9j3eoZ5J9lmsMNEOnXqup79TMFx5jfsalao0P1fOxm9dAF0qSBNq2Lq?=
 =?iso-8859-1?Q?hlNGmZkLh0n5vU8NVashPV5y9yi6QSAFbMPPsIkM9aTu7uCKdmwFDT5AfP?=
 =?iso-8859-1?Q?r8XdfRYrJhoXDp8BAMZTd0gjoKPtGURSeJmdOZ3ywtPjMhBMJz+EGMBDCI?=
 =?iso-8859-1?Q?GDo+FYIkbEi8lb65QwgqOVFsICbEn3z1fDFPsZ8r3V7+pIDm/RV1GxgPL9?=
 =?iso-8859-1?Q?0UYDs7unT39ABXKYkmbGaV0MC4gKFWzMqG4gNHwEpCzlTz8uZX8oUljvf4?=
 =?iso-8859-1?Q?AoMK/798tThpYvJRzJhy4klPmRY+7Hwc9x7BbP6deDSYr9akv2qep8RC+F?=
 =?iso-8859-1?Q?tJJiw4LBsWibpJfVl8ZLDUEfkTakijFRbmjs1UvCLC2rabT3/ZZB1LzmqW?=
 =?iso-8859-1?Q?YSwtfg86vOq14wO/h39kereXxEt/D/f+AUGo1cGBrdkeeOp5m8XGZPqoM8?=
 =?iso-8859-1?Q?Y0uIJHFwiEGKvYyVnTnXcIRnMT48Vy6+YnsCRf+DlPO/KgeKzqYdA0RP4Z?=
 =?iso-8859-1?Q?sIfeMmFsDp6TlgAOEcPSu6vWONepygPc1NcyyUk5NphYZMzClJU90WJqda?=
 =?iso-8859-1?Q?96QxkSSO5w3OZ9uRqfwqtWem3dvLsGYL0iyAGHj7VsmGnNJI4yrwowsd9w?=
 =?iso-8859-1?Q?dVuzPYkh9oTB/uCkYjXHT96J0AuBDHawJ0/3mhDxU913YVMeBntVq6PKwi?=
 =?iso-8859-1?Q?nZp6AoUdB6Q/nwhoCd1Y/+ryLK0sQ2ZuOv4C4GvG8st+56FD0hSMZBl/Tw?=
 =?iso-8859-1?Q?P2kCCQmR+3dcUShe5w0FNxYS8RHoq1OfTW3biA7uyxXMl/PewWOl4GkgRZ?=
 =?iso-8859-1?Q?qWyEH2sy1xl1zUQk5pKiQ7jQC2C0iCJ6Xvw7e0RpHOutfK7EZMC2lEXodv?=
 =?iso-8859-1?Q?KaothDAHLlVeGyNzqmz8vGOa1bBGA3jZWsl2yjYUAA3QM++qcgAoB+QZ33?=
 =?iso-8859-1?Q?Ettu9AOPAKebdaxMGLIbYdQErCLZ+9BowisQ6jqn3qw9R/IzQnXLI2h4Qp?=
 =?iso-8859-1?Q?QZtg2IvjtbGRzzjhPtx/H9aRNvlmKlgpFdc4GcjENVIN38/jP3jK7hqPvy?=
 =?iso-8859-1?Q?sym/2GDmcz0629v3iWh8yor2xj9oo93w2JDL9NS6Nau53e95C6Or57aSxH?=
 =?iso-8859-1?Q?HiU192hifQmWKe+paS1V/srhGAxwF5IL2V6zocGn5AjzTNPbBczcJ+lEv9?=
 =?iso-8859-1?Q?8H7+HrM0HX3P4UIpOpWwmoGvgtsGDI5eyybWWyWI5mG0KHzv4irTPS1TSq?=
 =?iso-8859-1?Q?m5zn1ufG6zowqxGkZjDWCKjD+NnFphQhJS2qpELH0CUvBhCwQucLgTNwh1?=
 =?iso-8859-1?Q?yi752+6MLvaFBI8EDBb4NEgj/2w/TYBS/wmQt05ZPTVn2GQEWCK0Xo4ooF?=
 =?iso-8859-1?Q?eZZo/t6RntLAJ5m0ulM9rb02Ua4iGgFpF3R2lab06qtpLaJjTl+9EaTyds?=
 =?iso-8859-1?Q?TidhriTst/X46jX8X3KF9uk/eXkIXYY7M4L6KBRWVtEiO3K9GBBB1K6eDT?=
 =?iso-8859-1?Q?gKeF0GXdaMfnv342O+dwlW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?T4RrpF9CRnxIbPei6iKNWcG+dggk37AzldAwUHX4H1YZIctfJmwnOV6RRK?=
 =?iso-8859-1?Q?gWS56tTFllAoqz7lMLcATM4tHEPO22yeKoRNBZscVMMW871RVEvGrvDhgk?=
 =?iso-8859-1?Q?cL00HRPSSFH9CowEOF7P85vxpC1MD2NUouHeUUc5T/dlhtGXxFAW4CPEx+?=
 =?iso-8859-1?Q?RWer1nzxzS8w09qAF+GUNVUMFMjTEvpnj8AV4NaZbapLIvEL245l8T05Ru?=
 =?iso-8859-1?Q?wWQKWbc3P4MAhc0tX4bymO90Vf77HBE4fVlrYh4R9pYRzzSgWFOkTpM+DK?=
 =?iso-8859-1?Q?PKe/Jp0LT3SCMbJhpgilf898WzDTKdybYoWiDi5AA+CXQbPQBJFrtK9HGA?=
 =?iso-8859-1?Q?FFgJaB2iKSgJDm2FL2KGpiM0pCuSTFVQIEIOOxrQzEzr4pOQV75wRwptz+?=
 =?iso-8859-1?Q?szTOUxiYG45GrvLG3W2Es4rXfWDA0bL1Y1WIWnZEexAE+JXcHgc+Mdz1Wq?=
 =?iso-8859-1?Q?tLemlTkcia+VyusZ3M7xsAxAb4SYCEAcZrhZ7ZUMevyqikno72pdSYEi7w?=
 =?iso-8859-1?Q?MoHo+jCjMTsnQi0i+MdwubNOInxP7JPhz8/nAiycEi9i/mrQYuRz4PMRuK?=
 =?iso-8859-1?Q?vhXDYKDCY3hvU8end9nokKSj5oMaNshTMH5OEUmFF/G3vhCc9u9DD/Rrzl?=
 =?iso-8859-1?Q?NmBBMIWbMuyhow/o5ZhCZmFMS9c+Ql0WBbiX/3qrzhe9s66f1Xr3aXeiHX?=
 =?iso-8859-1?Q?RqlyB7X0D2FXQ17gjw3KqiAAspTtxrsAln4FCPFgFt6uiEZo8n4IuiMRqE?=
 =?iso-8859-1?Q?lQLfy5xIT13gta51Kd+vpsWIkNhHm6u6K0h2przWvK8XYAWy0ij7eF7S4u?=
 =?iso-8859-1?Q?hTyLDD8SaJCoO2xBo2Rwf4RL226N+2g/fJ381SfqHYlvCTLoOtipRuGGuo?=
 =?iso-8859-1?Q?0E/ZLTcqYSEa4TnjlWEZcu03TgxpMssax89jtE4AXCqplPJyoyeI8/CqrP?=
 =?iso-8859-1?Q?piRr4/m+M3zn7cMKJOIjHhOx/+5IYRKYvWZ+4273oSa2sOKk87saKq0PJb?=
 =?iso-8859-1?Q?lLeBS5vTdY1YCKgFm/+huOoX/Q8y+qT9LyKjj8O/wn4sO9NSZLyKQB7Dj4?=
 =?iso-8859-1?Q?0QB0eXXK39Of6/S3PfOv/E/B3wEFApdoIM/caeFho51XiWripho969mPVo?=
 =?iso-8859-1?Q?uLP0TBmSds+Q8H6h2xdNDv6Igm2R9xqKD95MWXAKjh5YCoIF64PRGT7PxR?=
 =?iso-8859-1?Q?bX4vtpItHzxj1aUKtZzJFNt+Y5LvGg/fVYbLTMszURzH2mEbjVAlZ2Ly7L?=
 =?iso-8859-1?Q?ZYsfRe0/UUBWylm956UW2gs7me5LahikXqoAiFswFshwLNBRPYzHAfOhoC?=
 =?iso-8859-1?Q?OsNEvkOIDZnQSWzlvib0DUa7Ozot9VA6hELW6PDvKuv0IZdZ3G6CS2O8ne?=
 =?iso-8859-1?Q?lmJSJMm5UHr+a13bMycea/hDAusqBEp9BvioJ+2B8guU9fJsj9Hd2sHuJp?=
 =?iso-8859-1?Q?F70xbIKK5AnvbCTBxdxnZqY7+B6yRFFt5wGCisy69oUwKLlLIKlvSFx7WV?=
 =?iso-8859-1?Q?9TBzarji1m0zh3vKz9jKUHIHjGTxTFK+6bhipFKJ/RMx6h1sSeu75ffq7h?=
 =?iso-8859-1?Q?zaUkYcfIRTzCU77bDWTV07Vug3bMcbgv1Mu843m9/qgE0VpVXCPvwUslUi?=
 =?iso-8859-1?Q?q7u+nIEHfg/RkP1LRZTUYvxAL4Yz+OyoWKkenLXYOLbduX07qBSFSp9Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f585b5f-d899-4515-ca54-08dd45236262
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 13:54:03.2790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4o3AlzrRC0EbagDZqj9WFgHxfSJOd647BuUWtDleX85OXECdjduCf+NP/wcUwlucW2WD7t3PpW9h291gwrtRJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10120

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Handle phantom functions in iommu_add_dt_pci_sideband_ids(). Each phantom
function will have a unique requestor ID (RID)/BDF. On ARM, we need to
map/translate the RID/BDF to an AXI stream ID for each phantom function
according to the pci-iommu device tree mapping [1]. The RID/BDF -> AXI stre=
am ID
mapping in DT could allow phantom devices (i.e. devices with phantom functi=
ons)
to use different AXI stream IDs based on the (phantom) function.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-io=
mmu.txt

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v6->v7:
* no change

v5->v6:
* no change

v4->v5:
* no change

v3->v4:
* s/iommu_dt_pci_map_id/dt_map_id/

v2->v3:
* new patch title (was: iommu/arm: iommu_add_dt_pci_device phantom handling=
)
* rework loop to reduce duplication
* s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/

v1->v2:
* new patch

---
TODO: investigate Jan's comment [2]
[2] https://lore.kernel.org/xen-devel/806a2978-19fb-4d31-ab6a-35ea7317c8de@=
suse.com/
---
 xen/drivers/passthrough/device_tree.c | 33 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index edbd3f17ad..eba1a5bac7 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -169,6 +169,7 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
     struct device *dev =3D pci_to_dev(pdev);
     const struct dt_device_node *np;
     int rc;
+    unsigned int devfn =3D pdev->devfn;
=20
     if ( !iommu_enabled )
         return NO_IOMMU;
@@ -183,21 +184,27 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pde=
v)
     if ( !np )
         return -ENODEV;
=20
-    /*
-     * According to the Documentation/devicetree/bindings/pci/pci-iommu.tx=
t
-     * from Linux.
-     */
-    rc =3D dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
-                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
-    if ( rc )
-        return (rc =3D=3D -ENODEV) ? NO_IOMMU : rc;
+    do {
+        /*
+         * According to the Documentation/devicetree/bindings/pci/pci-iomm=
u.txt
+         * from Linux.
+         */
+        rc =3D dt_map_id(np, PCI_BDF(pdev->bus, devfn), "iommu-map",
+                       "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+        if ( rc )
+            return (rc =3D=3D -ENODEV) ? NO_IOMMU : rc;
=20
-    rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
-    if ( rc < 0 )
-    {
-        iommu_fwspec_free(dev);
-        return -EINVAL;
+        rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
+        if ( rc < 0 )
+        {
+            iommu_fwspec_free(dev);
+            return -EINVAL;
+        }
+
+        devfn +=3D pdev->phantom_stride;
     }
+    while ( (devfn !=3D pdev->devfn) &&
+            (PCI_SLOT(devfn) =3D=3D PCI_SLOT(pdev->devfn)) );
=20
     return rc;
 }
--=20
2.34.1

