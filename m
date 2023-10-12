Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E8D7C7969
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:22:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616124.957946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr44g-0005te-4w; Thu, 12 Oct 2023 22:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616124.957946; Thu, 12 Oct 2023 22:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr44g-0005ry-0p; Thu, 12 Oct 2023 22:22:34 +0000
Received: by outflank-mailman (input) for mailman id 616124;
 Thu, 12 Oct 2023 22:22:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3sL-00016s-GW
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:49 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dbbbeb5-694c-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 00:09:47 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CG29eP021659; Thu, 12 Oct 2023 22:09:33 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3tpcc6c048-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8758.eurprd03.prod.outlook.com (2603:10a6:20b:53e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Thu, 12 Oct
 2023 22:09:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:27 +0000
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
X-Inumbo-ID: 0dbbbeb5-694c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZX5CmX5ZAA1MFmLL+DAWkF5Qv69/hO3KeUn82IVnWIlfXkM8x2euEaHimm99zXw7uZ5JvbYD1ee7m8lHUm5EcKkTQncavHm7q2obXmw4QdH3nzv0TlpCHruxlf0TODcPSTv3J4FlyA7fiLq+GD+87cxAsPCc3hxAoGrocgk3qtAXwCwtaGxbN8+r0Okay/ueWjE9rbIGHbaWbqsB63imO6SRwTijK8/Y/24azq7ti41qjNtRF1087KKV2qFtsF1ALFbv7gUfU/Xt1FMExOBVwA0olThQiMdN2I6qLjzcSANg5DdaTjV/RwH1boQoGQY+x8SNZAOb5MoGUxx1W8mv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntwIQOSKcHFal4kV0pXQkxtpoJAwWh5cbfLdqCXSimQ=;
 b=baJjW/HnTYnLX/6VFCx/qOIS/mypLINKET48DoF/+1ycdBitODdroGpJqgKn2AE6oncGnmL8o7pCXYwHDrZ+7usrw3gLnKm1sq5OIn0YiWroAJqlNu7cD/ZgtersEuyE6kxB0HZSTARQbVpdPbJIiSVQglEfUXynnSrRajQVtE6v6j6Gn0xfy6vyqT1pHL/TjNiCE2v3ACjMFnkSd3bG+dgFpB9xDp8yvXjebcmyFWrtkMOZfbuFWN31+VItY1dFfh4dmZ36RrYXbEZSxiVJIWVBvrF9MaFZciEsdlxvX1aw6fOXGdCJDhe30vitRAgB7HqcQWVs5WQAHhyk0cvb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntwIQOSKcHFal4kV0pXQkxtpoJAwWh5cbfLdqCXSimQ=;
 b=SKZV3kc6hPg5rrRhIaOny8XRAy89MIRSw7BAlIDZNSDrACRVzrfntl0soV1BNJK/QGfV/g0bfNKYZhvfm9FRXxpWsAsXi4H6lD26ye06TgHLoyN7qyRpuTuT5/K7Oo3o7YNkGH3ReHJ3pUIVMWCxKW76xp4K9kByfTNAjhcpNOAKyY7tQ3vnK+QmCSloBBrJUFFBUvcHiPauRDZJXr59wJnsaHW8S1WfKfFGN/ba1lqGs1UlHRqfjN9g9h3X1xC8UzDP0IHWVA8TxLtOowwzLT27x/sGy+0gZBI2+HmQahWYZNZOIU+rK35dRWZ6VJJkdd58O2dJVrSdO6CmSjAnBg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Julien Grall <jgrall@amazon.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 15/17] xen/arm: account IO handlers for emulated PCI MSI-X
Thread-Topic: [PATCH v10 15/17] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Index: AQHZ/Vi/WuE7cEBbNE2PUEpOXmVwbA==
Date: Thu, 12 Oct 2023 22:09:19 +0000
Message-ID: <20231012220854.2736994-16-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8758:EE_
x-ms-office365-filtering-correlation-id: c3a20365-1089-4e00-a60b-08dbcb6fe6e4
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UDUDW4GJK+gQ7nZrHdUIGaQN6bHf/FG4io24AzMDKurSotPzQTJGlyFZF/bP92ICM5YcdM59G9ALeBpdHtIYfDlnYA2dthgxZeLoBRlkpFJCjA4ljEJm+tYe8ndXCT0ySesVHow8f92Q/2y2/QFHa5gHlhxdMZs4GLNgTQ1MHTTxOMC7qfIbjFDnepAl6UV9q9CbLpCorCWaML4HrNMZLuybe1opmn6+3BFguZ9dyzer7UObmx19PI4Z8fncGQG5tjR31CfgJM4NNZE93UkOgsy9OuVWOg0PBPmwDrNboE37w9TOZjcT2tmo4zje17w3tRrzia3bTrnWJ5kDBIfSujw1+heb8JE/9TJbnxIfsaCQisime3AgQ/lFFLk7+O4puLXdHFPybvDW6+CFr90C9aHLXfWXYtxPiHbikyVDc4U8pWQmsUA3Y3MvflSN9c+hulkR22IWVQOa2Z2369Wzd54l0v9YQRcDF867DQDwITAwq9HABy9U5WJoprlmfo5DTO7yMQxXvL7aL8y3v23Jv6SF9SDdDANwFREzdB/wDv4xeuS+lrYqqu78GFUKukNO8rFlGfaBJlopjXQsxJgCo0UB3zAsJ6FUHW5086KbCUwfP0iSEchJWHwfeSLMxlnV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38070700005)(6916009)(5660300002)(41300700001)(316002)(83380400001)(86362001)(122000001)(38100700002)(66446008)(66899024)(71200400001)(6486002)(26005)(1076003)(2616005)(54906003)(478600001)(76116006)(66556008)(66946007)(66476007)(64756008)(91956017)(2906002)(8936002)(8676002)(36756003)(15650500001)(6512007)(6666004)(55236004)(6506007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?nKZVTjkf9xFLWi8aVvUMm5F8QKk/HXMCyS6Mvly8J5xjr6juhrj6isCXWl?=
 =?iso-8859-1?Q?6jgF+SjbszYZaY/JgQXJYx7ook5dYKMfCdCiBagazdLw7aw1+NTvSDyNL1?=
 =?iso-8859-1?Q?j90EeDwG+X9KhFaBocc70P816clxKSNUuZBcx5H2fuv1kWEuEbS9cs4IA5?=
 =?iso-8859-1?Q?hyDOTV12OtOjA4yz7lBXOD5qEDU/izUkvfHXAY3L9GdsS8WUzOL7pIVnMb?=
 =?iso-8859-1?Q?eXR0wo0IYnbWjSVZIOF4RNVddSS+Q+5Pr1huqGuufzO6rMr6RwWX8h9Cjy?=
 =?iso-8859-1?Q?TunOTEZXjnXVKSlvz4AUNVBfHLoHdrUgzey/JpjQQnzv5XPhsR/zsjZY24?=
 =?iso-8859-1?Q?rUJajouLtzf9TvpPOSvZUK2sVSEZ4QVaAMcVTFfVhGxk8Dy2Kx3zx9+Jjm?=
 =?iso-8859-1?Q?GmfJMg7Ri9FLPYmPHGGKnjnDWrzAxuvyYA1QziyCzG5IWkrceV4zIRvIYo?=
 =?iso-8859-1?Q?fPrKaQdaTvjqsOkqALd25Oo3yftts9GOWan+aynyNqY20M9vliiMybBECh?=
 =?iso-8859-1?Q?6b++TUWz8RX44yPwIzCm3yKihnbf2X4u0uFAaTyaWpaKXhpyF/ts7fluHo?=
 =?iso-8859-1?Q?zffcZX/gjNqRhPQKsRMKeS5HIYkDsauGeul3y/63ZaysdwElMY/uglq8mX?=
 =?iso-8859-1?Q?Jzu/fSR2iJwdCv4atcewAP1L4B2q9i0IBjWhJEUfM32rLoDQHxc4WTsWoh?=
 =?iso-8859-1?Q?xkP5UGxgiqTaXPYDNMV0cilAWC/9X4mzJr7Wtdm2pcSwaElSCkAgdblJoH?=
 =?iso-8859-1?Q?wrF+WgM5X6+KlojwuNZGtrerekrmW0CEvMteymnKW57FBrwLEqGR6s5hYJ?=
 =?iso-8859-1?Q?KjqFODNBoqhLWLkMmgyWARRmlwR46E6RtKvLaiq97OUL0xk22TO0PoPFKO?=
 =?iso-8859-1?Q?DWStvMihIpdcSF9NcNBLDP/SL5c2jh+mfk4Ig6y8GeB2i0d9TKXfIF5v6t?=
 =?iso-8859-1?Q?MYISYHFWrrFDSKV8LcQtdsuz42g+ZZAFBksopOVMY104FdenHfNL95/7wS?=
 =?iso-8859-1?Q?pYj7ycsEEq7X61EBr5FF093ZLKcELjvnk01yhu6l0CrA+oFVSs4lVxyfjn?=
 =?iso-8859-1?Q?qXPuQJrMyW12iIYSvepYtzsKsSwFP1kAIko3bCtbWcBP+XNIZVySYdese3?=
 =?iso-8859-1?Q?oAZqpJQ8lpkNnWqi9wg1HKr34nMRvYNprQ3NWu3N8SH5rNTxkzo2U4W7uw?=
 =?iso-8859-1?Q?yF39xLSuWYwVfYTOLkuUaSnI6hyX58rDURL+czEMllaed2LfA7/FuYtR/j?=
 =?iso-8859-1?Q?R68M+0dqO2nsG1jXzPdAUBihLRQOEKt1rCu+/UjTycWZ3wa0PlNTbmwdh8?=
 =?iso-8859-1?Q?UkPMTWU2y51XnY0o55/3f49YEYe4Q6VsoTswcU1ltk5KdCRO7WRBDy+LxQ?=
 =?iso-8859-1?Q?sR/tQbAn3eBlDxy5f8K+Ek1t+ocDfGr8WdD1D22VzWnq7r7WnZtHs/Ag+i?=
 =?iso-8859-1?Q?YcPCrRjnewZ+vYfMzKtyu1qwLf81vHoGZVeQAV1xEQ4/ZKqfCFgH6E0Hvw?=
 =?iso-8859-1?Q?+hdTFwhlTSyeXSGuHaVFsdB05SWE2H3X93jyrocc6HcObzAq+DPMJ3v/32?=
 =?iso-8859-1?Q?2SVuVyyz+/GE8+SrkZ0tNqoqao9zUfM9BmGrxhREKQBL7a4y9O4wHdBjKw?=
 =?iso-8859-1?Q?NohLXO6YxTajQnMbcZ3F6sb2Ah4w/O5u78s6TkRVlIKeosf3MefSSZow?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a20365-1089-4e00-a60b-08dbcb6fe6e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:19.0875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LUfhM3fXebidXZgmN7yZKylfOyzSN/YRqVPQZpnQc+FIzbWBXn4HgT7UQBAL1UyXA+Of/R7df+8d0rrmPGGTDsm51xEOM9ofdVklbT2j4c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8758
X-Proofpoint-GUID: 8tQ5bdFlrfWwIv5IwbLsTI4yzCUg4ofu
X-Proofpoint-ORIG-GUID: 8tQ5bdFlrfWwIv5IwbLsTI4yzCUg4ofu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 mlxscore=0 bulkscore=0 mlxlogscore=417 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310120186

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
MSI-X registers we need to explicitly tell that we have additional IO
handlers, so those are accounted.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
This actually moved here from the part 2 of the prep work for PCI
passthrough on Arm as it seems to be the proper place for it.

Since v5:
- optimize with IS_ENABLED(CONFIG_HAS_PCI_MSI) since VPCI_MAX_VIRT_DEV is
  defined unconditionally
New in v5
---
 xen/arch/arm/vpci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 58e2a20135..01b50d435e 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -134,6 +134,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
=20
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
=20
@@ -154,7 +156,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct =
domain *d)
      * For guests each host bridge requires one region to cover the
      * configuration space. At the moment, we only expose a single host br=
idge.
      */
-    return 1;
+    count =3D 1;
+
+    /*
+     * There's a single MSI-X MMIO handler that deals with both PBA
+     * and MSI-X tables per each PCI device being passed through.
+     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
+     */
+    if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
+        count +=3D VPCI_MAX_VIRT_DEV;
+
+    return count;
 }
=20
 /*
--=20
2.42.0

