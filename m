Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E42CCB98B88
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 10:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129036.1469206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPU-0000V1-3z; Wed, 24 Sep 2025 07:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129036.1469206; Wed, 24 Sep 2025 07:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPT-0000Ph-Rj; Wed, 24 Sep 2025 07:59:31 +0000
Received: by outflank-mailman (input) for mailman id 1129036;
 Wed, 24 Sep 2025 07:59:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4Db=4D=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v1KPR-0007np-Nu
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 07:59:29 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 650f9624-991c-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 09:59:28 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8118.eurprd03.prod.outlook.com
 (2603:10a6:20b:445::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 07:59:22 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 07:59:22 +0000
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
X-Inumbo-ID: 650f9624-991c-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlCB6a0BpZcQaBFCGXnQTZfJI4GKNxeP3EIQWeYGbdnEWNEC8A66bCj1/gD85+Z7GGN1skllJ9VnBruKjus4eNc1PcWjIoefrJ3JEFadwpqVtpVqeE6hhQ565UobcNjyMVAiWtYPhtkvFHKTxUj+aLW494rAL++wnB6LaD71RnRluqGexiNX8Db0iIcMPwQ1s9TzifzIyqf0dEjuI2sYC3WEsKCmwS0knKi0gc+lnceKJ4AtjuPtCkFhnLhU41+2A4r2P0loknWtR8fqB5bpTvWPul+UN8dF/kqxCBFM2y5Shm0KEq+rkuMwxSkeXQT0Bdft5YzhI/k4HsXS3jEj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/J+B8SmmFZkxU0vI4rRuSl7qd5Ef4KyDBUosgN+zjEU=;
 b=nF+I9MsJOqKBxptTKiwvxob8V7rmP7QQM27P7qllIOUXW3dXLqeUGuktwC5G5HDRCIbeC7vGsjjTqe8yhd1maZ3LwrJyLOQ8voqjfrLAVWPM9HtgLywFB/XA2tUC6K/4CwH/t3KfNzAGIlJR4k8n2RoBOKIVmcR/zlj/UiRXQGPDc7SscimcGmmxY4SIw+vgVuKJFxxo7bFHZ0TyHyUmRcPXXa/B5VN/U/5UPrU2VAbFnNhfGJbimLKdSfsSLGc2NsVe71HvnBQUej12kvxDed+1Wn5E8gWLZaxNL+AUOgZqvraDf+q197wLXHjA9sLHu1WUCSSt4TjITqxA9sq2zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/J+B8SmmFZkxU0vI4rRuSl7qd5Ef4KyDBUosgN+zjEU=;
 b=hCXGGMNgQMqSumOXMtUs9tjBrvnCzjVq9djbNibet4Vn3E8pG88KV+hwUdAtn5BVTEUgOijrBdEG91/soIs8hi8KWsy0WsVxW2scCHGmwGom0MQ46b84iVdBhQJEjqpnVpPJoA4NLIEzWng/6MKNkD1kCUmxhRPtR3rVuKGN8InJq3j87EEctqmK9s9T58NlMktNXoyFWrcRg39tYm3bPYHLvNCGa9EHwZxbH649NNs/6tdzSGSn9ibX/hllO50fAjh8Wgw8GANGf/dVNd9ERnivfcwWewNMa88jYwLLU+MrtHpcuxu4pAGBRzJhx+OAl2cDUOLTsf3XUFLofLXPeA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v1 4/8] xen/pci: disable pci_device_{add,remove} when hwdom
 uses vpci on arm
Thread-Topic: [PATCH v1 4/8] xen/pci: disable pci_device_{add,remove} when
 hwdom uses vpci on arm
Thread-Index: AQHcLSkjp9oz81JUVE62TQagPRX78w==
Date: Wed, 24 Sep 2025 07:59:22 +0000
Message-ID:
 <d86ae19db4a62d196b696e421683725d0c647b2c.1758618839.git.mykyta_poturai@epam.com>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1758618839.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8118:EE_
x-ms-office365-filtering-correlation-id: 51be07f0-1935-401a-9589-08ddfb4045cc
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6WaYqXLW0PryVPDGcm3j12UT0+whM6BkCsNUEZ9NTrsJOBhG61OEwWwk+y?=
 =?iso-8859-1?Q?2bRE2Yx07y1rxEHpXIHaRm5YWs3Rn1kF7OPUEYsA1fO00Z4uT8T2PdTW5Y?=
 =?iso-8859-1?Q?C5bNeXH+RXuc1jcnBpe/R6aEJwg2E+lN4gRFbX1y26YV1yjNeYBSQo/d01?=
 =?iso-8859-1?Q?e3n2W07YvyHIoBmoKC+UjfwuvsK7tvt8dGXiC7GUoHu06hI382eAsdZ1qg?=
 =?iso-8859-1?Q?y59ROmLRp+y2ZeBY51TXPGiCtsiV37KFJBjAs3u/8fnUMSyniTN6XkJr3N?=
 =?iso-8859-1?Q?Fw8XyEoQwy/ptS6Do2PdkgxYpVgVIZjT+IU1cPHeKjLNXciCj3qQ2M7ir1?=
 =?iso-8859-1?Q?brR9QoECJ6PZrZPReR9UladrS90fHTgAPsG+CmK+JJWTmQZqRfb0x+aJl9?=
 =?iso-8859-1?Q?+vIEp9FvK9xN9qUOtG/O5HzgF0Xf3MGd4QtufjltiHbpLlUxUpPNOf8Xip?=
 =?iso-8859-1?Q?TpUrZaoFqXd57HzrjpfFHcC0f4gOVB/5Iyg5OdVtf/CnR5Fm6HslZ/dFP7?=
 =?iso-8859-1?Q?Z5Oq5ezFW3EMLPdgjNOv/U9NfF2PDxqpYwuMGz8/QmDonMIf5SfC4QAEdX?=
 =?iso-8859-1?Q?/IrpiV2hUg7yU1jhoHk+dU62T3FxpnXndFC/bpojF9JasxxDk68Rn7UV9d?=
 =?iso-8859-1?Q?62+oQb6IUq7LI462dL95//rkGcEQco4D0j6S3e09Ahv7IyUaB3JbcpTjM4?=
 =?iso-8859-1?Q?KBKCiKyMOaWOBMd3GSgrModRee7zXz+X/1RTPH6Hj5PP3QWRX0ALfd8HaH?=
 =?iso-8859-1?Q?xxVZEipcweeGJVRPEsgvOqH6mjG6oCF+iffiq1TzjZoFJMxZ0aEdnqEqw9?=
 =?iso-8859-1?Q?wqEX7jZvZoWTWl7w5BT6BYuHdt3TF4f6IXx+hBmo/rp4AqDZ9bC+rpxklN?=
 =?iso-8859-1?Q?eY13302VWz4/AEffBAweB5OXnVkvpVqo9Sne5xag2r/mVyeXt+4DpfBGS/?=
 =?iso-8859-1?Q?VxhFwK3mJCGoJt2tE48o70g9ef/03pEebx9dWddt2ODMq4/i4YhZ3/XcPm?=
 =?iso-8859-1?Q?zm8JZLwjaG/ubdypLIUgt0c6lOGzjKhEkV2+Se50jXJJr9U96rnJfNi5EY?=
 =?iso-8859-1?Q?u161o8BLgqq5WKFOeiorTax85dJHZNsfuj/2l4E0sJD1VQd6cXg/5zu6ce?=
 =?iso-8859-1?Q?nuVf1BKvkCzAt/SQnPedbqV+Jrk++1o0lW11hwOJ/+RhoDoIr4fyHJmKJw?=
 =?iso-8859-1?Q?0TYVArGuPLfOhxxJL0MSB1iamyRkbRkhFM07BjJY01yvPK1WtSf1T7ikqh?=
 =?iso-8859-1?Q?l+sWYdVqWZAIIl8ra/fYyFjAh9PYoF0Bsd4e5t5sj9IyuiJ0g2rB6z07br?=
 =?iso-8859-1?Q?OpjtgZT+WqLrjiEoXGX8q9jeZbUVWZ12RnBM7eS5BDtlmws4GfEe0VJpQV?=
 =?iso-8859-1?Q?2zSfs06QfZstF/eQ7GdlosEehOJHbUC5UEQmliqD1IEKfCf427yZKbyYbS?=
 =?iso-8859-1?Q?oSUPb3f1l3FtRk756lZLz492Z3aT+BhnVwJLkgjLSHrDFq8LQBSFoPnSYT?=
 =?iso-8859-1?Q?TmI4J5OkS+Sxqr3wmwIqtmwyZV86osZVJxmMBs3X+JcckLN03utju90hkP?=
 =?iso-8859-1?Q?qsiRZ98=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?e6lms9sMeq2L1ytNFkI4fdPbxVa1GLK6AySRNoDtMrdDC5QdUYO/FHPDzy?=
 =?iso-8859-1?Q?wyWvBRHWDUNohN40ThMBBtgoISXWx+uDd5Al2jMqjez1sJRwkcnICOddxA?=
 =?iso-8859-1?Q?FyJzJbpOYtFB8LDgF2V+JZlh4LEQjQGtdph6vQCz+CpbnnebALoRb4ZOvn?=
 =?iso-8859-1?Q?+sYGoiqmiL7eGTNdyDCDkNcgaG4ugY6sncCtELK6KVlZXUgbLPwiTs1Vwz?=
 =?iso-8859-1?Q?GvzgDVgIzcqVCRKaR1VDh2zhVIfqXTZy/vD+3DEcRa8KCIiGxr/FKvu6RZ?=
 =?iso-8859-1?Q?LQXymUAv1l6I3uZDXZHlrMdL7NJMBTsQd+jnlVbSO3WZBbcPieUF5BwVPx?=
 =?iso-8859-1?Q?dHJ+JkSdl1zFLgdo49fGZ2WpcuNUHrocxFFWJeFSoNyUVXaFMrsBdwAfY9?=
 =?iso-8859-1?Q?XrKPgZf1RRUnTEH/XA4VzScOLCzglQAY2uk+9b8KkmxB6OlVtslmEPuxqX?=
 =?iso-8859-1?Q?SWUlo0fbkGsKTE5u6Vw8oTwS4fjPZKO/ao9TMixWKQcmUcJL2JE9kyvbu8?=
 =?iso-8859-1?Q?KApAzSegs4Fzb6sDTy12wGqZ7g1IHG0uGyNpXNwhnlxAV+PB20Bsn66/fP?=
 =?iso-8859-1?Q?WifaPHYMFwxMt+EpofGU4pA2VwQoFGtC4YUEXbyZjQf7ze3IepzdsK1eMc?=
 =?iso-8859-1?Q?PBcIohnSwyeLyd6eNfsaWcJ8rlKX3qQ4ZRbT/sjXqZYtWxzGLTt8/dmDD9?=
 =?iso-8859-1?Q?OG/YAEIAtlCU78ynGSZJKhjYYkKcazQ/2KbUaNCiWgP/NrSBMw+Vd+jQgs?=
 =?iso-8859-1?Q?Vge/1dBckgkm8M9MYGygcCxaw4PhXOz8+mjQQ7gSyVpsdND4fN6gf8gXF7?=
 =?iso-8859-1?Q?CeVlcghkMmeeXfc6HT9IrSdZyoouqA3bbH8v51ly8aIY72Ar+H4ts4hXkX?=
 =?iso-8859-1?Q?4PK+18ffw8PtEXqzP0nSzm7AqN5UPrSfu4EmDRZVmoSewMOoz2O1IU6cg+?=
 =?iso-8859-1?Q?LBB3CnhNwS48EhMHvrWq1XiPfUa3l1xrEK7Q3R6Fz9kBvUkM4AgGjzewZ5?=
 =?iso-8859-1?Q?DmPvub4bvkjWP9tKsCU2QbT8q1PlahNWAM9wnYivB3/EGxmG8imN9klckK?=
 =?iso-8859-1?Q?Jk0XkKr24jf7U658pe4uyN73EImHoU5HUUDal9+RIRgPvPukL4shURV70B?=
 =?iso-8859-1?Q?g4O8pbzehbRbZcCpe/2zXUKyNtFQnxCYrbapGIh4aoPIA+KB69pSbXd+0a?=
 =?iso-8859-1?Q?LA6+l/h3K6Q15YgnyB2V71lHFh6axnzt3XVJxCXe1fJ0ypWn5TXRczur8/?=
 =?iso-8859-1?Q?n2xoDN6VfRXSAECiS0skcol/l9KKUv/e6BljlVKtZvDeNeoE20PxZk3A2x?=
 =?iso-8859-1?Q?ZNkxc417KnjzNfmn0sRfEALYxXkUri7XeN0uA9qbnPLeIc8GIaGmzenCJ8?=
 =?iso-8859-1?Q?VmdtUVS5flq210JTM5zfG2AxMcs80PM7QjyEQgkPbGhJkEH3SskpfPi5Wd?=
 =?iso-8859-1?Q?wnTJTcYHIJumR3tolvpv75CeyD5PW8z+esH6Swh2iEifn4lHNyjzPssJQK?=
 =?iso-8859-1?Q?zH51TwMTYtb6pVnJuwdVlWvLdwWguZFbGuW7auqTbYAXZEHlxz+P0m8aJB?=
 =?iso-8859-1?Q?QEoXb0DKAZnJG1ztWjpPjXrxMptFzK7aqqW1F2wzXlxlEk3SEbgiayOMyw?=
 =?iso-8859-1?Q?ueL4uuGYxNIeNiqI5GYyQYCPUd3va8Aek4IWO8VIolVCimH1BzTLRE8g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51be07f0-1935-401a-9589-08ddfb4045cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 07:59:22.3130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: giB6UVB7ILmWIHwqgPk8nNeXf92/0/giQVUVPBOtoE1gAVI4MsBMdGE8RT8ZFmaexqrl/mSC5nn2s+/eMWg2Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8118

From: Luca Fancellu <luca.fancellu@arm.com>

On ARM, if the hardware domain is using the emulated bus, it should not
be allowed to add/remove pci devices, so return EOPNOTSUPP in that case.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/drivers/pci/physdev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index d46501b884..5b3f8dde14 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -19,6 +19,9 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
         struct pci_dev_info pdev_info;
         nodeid_t node =3D NUMA_NO_NODE;
=20
+        if ( hwdom_uses_vpci() )
+            return -EOPNOTSUPP;
+
         if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop()=
 )
             return -EOPNOTSUPP;
=20
@@ -57,6 +60,9 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
     case PHYSDEVOP_pci_device_remove: {
         struct physdev_pci_device dev;
=20
+        if ( hwdom_uses_vpci() )
+            return -EOPNOTSUPP;
+
         if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop()=
 )
             return -EOPNOTSUPP;
=20
--=20
2.34.1

