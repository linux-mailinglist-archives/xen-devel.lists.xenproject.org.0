Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA79FACDC62
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 13:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005428.1384925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMmAH-0006G5-7Y; Wed, 04 Jun 2025 11:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005428.1384925; Wed, 04 Jun 2025 11:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMmAH-0006Dm-3A; Wed, 04 Jun 2025 11:20:13 +0000
Received: by outflank-mailman (input) for mailman id 1005428;
 Wed, 04 Jun 2025 11:20:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EvyC=YT=renesas.com=jahan.murudi.zg@srs-se1.protection.inumbo.net>)
 id 1uMmAF-0006Dg-Le
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 11:20:12 +0000
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c406::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc77232b-4135-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 13:20:05 +0200 (CEST)
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com (2603:1096:604:2d7::7)
 by TYYPR01MB6697.jpnprd01.prod.outlook.com (2603:1096:400:c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Wed, 4 Jun
 2025 11:19:55 +0000
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1]) by OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1%4]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 11:19:55 +0000
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
X-Inumbo-ID: dc77232b-4135-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8EnLnXOKzlsHWTcdWwNA5oOO7w8KZ+R3/8J1Fa3j3+h9DkKSfm6/tlTaXZh+pXtBthiRkO3ufxg29nXPQjFudYngyM5XMofidqP9GsZeURnyIYMA1dtlV4mPQcnDB82+/s1U0OiYTEiDx2YkkinExuYqhNJmrRdboTdsC0pYCBjFsdgf99nk3tj/BeOwj82YyAT0uj02rr8nVQLFa7LYjdd91TkXgv4rFCoa0zBHb8LwOvJzFIV2bQHgqoq4canDs2DS7jR+qNG6DRDzR99TzrckGwrvr0+rugTQgq6Lr5w43YxAd/OmH9lbP21S23keZ0PmKlmmBxFlJ9j/+zVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNrgudgmzOX5uFrNQV2dwcE6ST9TJL2pYV4m02zJjrQ=;
 b=a/SuS4LkPLJsiisagZHSK4yPobzezsNVu2mjSWcgU47yYzVAqkoOOWZXG+ZJN9Xwj9grma7nH0wD+8rKHBsdc6LSOg4dWoHV5jg9CafTk5d2OfpjkxwfIpjWYtIjgFeY9ZbR1+QmOKRUU0mVwra1R2xnCbwQspE32Q+XrY2Ya+ThWuwUVvtWK8SA798yw6o1nR8WnOh/IOLloQKqCdFSyp9/D3reP9QTLARo7HVeF24735alZyQbJ6KfuoERtljeUlQqLisyLTTEDXdedrEmxMHJv1ZnN4vTqXQ5Xppbnd68grFurcYgH4gkD++VyCroaGX8FLjhGm/EhAfqMFa1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNrgudgmzOX5uFrNQV2dwcE6ST9TJL2pYV4m02zJjrQ=;
 b=g6cGJcW7DMi4F+ZhkzIZSf7d8qlnqQmuNZgAEykI+lQ5UYjsu5wQ+tL1DFzazfjDiJguzW/TQJ5kToeLcIWPW04HSAmx7koJC4Fb6Q1rH3bwPdBF6DbF63XF5zhrhICrMENaS6FiWMkCUzVae8G2tIjUfzKXfb+p3YRj8WhOQjA=
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] arm/vgic-v2: Fix undefined behavior in
 vgic_fetch_itargetsr()
Thread-Topic: [PATCH v2] arm/vgic-v2: Fix undefined behavior in
 vgic_fetch_itargetsr()
Thread-Index: AQHb0xLawsf35GKOO0Slf/uLdloOKrPvcB4AgANsdTA=
Date: Wed, 4 Jun 2025 11:19:55 +0000
Message-ID:
 <OSOPR01MB1240844B24BCC5F45EEF29CDBAB6CA@OSOPR01MB12408.jpnprd01.prod.outlook.com>
References: <20250601163212.2988162-1-jahan.murudi.zg@renesas.com>
 <01c5ad19-2add-4270-948d-ecdf3d5e8bd6@amd.com>
In-Reply-To: <01c5ad19-2add-4270-948d-ecdf3d5e8bd6@amd.com>
Accept-Language: en-IN, kn-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSOPR01MB12408:EE_|TYYPR01MB6697:EE_
x-ms-office365-filtering-correlation-id: df9abec2-1510-413c-a071-08dda359bbdc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WEtEMVdyRVQzcFpxd2pTZVNBSVh6R3U4ay9LWjl1dVFPY0E1ZFc1NVhENVJU?=
 =?utf-8?B?YXEzSENJQUY4dnRxRGhVY29BaEpJTld5RVhqM01nZEM4ODFQczdKb0p2eGJk?=
 =?utf-8?B?RkNSTjIzcWRtNVVwV3Q3d0FQM1VydksvUzJYbHR4SnBwY2ZQb3d2Yy8raXN5?=
 =?utf-8?B?eitackFoOTRuNXhWZFdDQTNyRnpkTTdEUE9WNlNudjJRNVNhWFJubFl6enV4?=
 =?utf-8?B?RmdMM2JDL2VzeWJYOXpnMEpUa1BIcHpocHNyQmgvT1hFYTMvSzJPVWdnd2pP?=
 =?utf-8?B?Q3lSc0FyNnFhdlF6M1RSOStnK3RFNlhlQlQ1Ny9iaUJQc0tCOVZ4UG5VMzVy?=
 =?utf-8?B?eWpJM3A1empLZVdMbjdMYnNEYkFIczAzbThEOU5UdnFKRUVuMlpXZDJQNnlE?=
 =?utf-8?B?Z2drZytNb3M3Vk4wS0NWd2IwRXRNTGp3alc0ZW9MdTdvalIyTVJsQ1cvakdI?=
 =?utf-8?B?TVlYVmtUR0JvaHFyTnRRYjgzR3Jmd3hvanpLbmg2MVBmc2ppZDZTejZ4UzBs?=
 =?utf-8?B?bkNUaStrWFQzTFd2TTJSdjZQTTJSUk5rVXhCOC9wamVsNU10RzVFR09ZTE45?=
 =?utf-8?B?RGVqNTBFV2JJbFFlQUd3M3l4eE5ZZkNTaXQ3T0tjbVBDWk1WUUNMWTBBU1RI?=
 =?utf-8?B?cEhPZ1U1WWU5YWJSamtaaHUwTUNKTTYySGJPTUZYVkF1SWFWWHdnU3p4YnF3?=
 =?utf-8?B?UWI1Vm5Bc1hYbEphV21reWlPS3JHSmlEOFljdDVyN1VEMnhEVVBKTUt3c2dQ?=
 =?utf-8?B?a2U5NjNoTWVqMkh0dnRFbFJHclQ3em9yY2N4b2RGR09PZzl2WC92NXZBM0Z6?=
 =?utf-8?B?WTNSUEt4V0VsVG1nczBXZEFpSlNJZGZ5UUhvSGhDeUpFZDB0Y0NaZkRLYUtH?=
 =?utf-8?B?TzNERVZJRUE5aWpPQjhqNHdTZisvT1NUSlhwVEp3N2VITjVSZlpLeTFlbEN6?=
 =?utf-8?B?eTl1MkZheWVmYnJJYUxBN0Y1b1pYNnF0ZXk2c3Z4SzlkK1RoS0tpNlFMN1Jy?=
 =?utf-8?B?aklnZ3lEUXl0UnlQU2tyTG4yNGVyZE0zaG82TG5yYUtSZW1adHQyMXFlamMx?=
 =?utf-8?B?cDdJME1FdHZJeTRiMmpwUFErK2ZpMmQzdEpwQW9ISzN5cTVhVHhGYytScHNU?=
 =?utf-8?B?YTJTKzlNNDhjNHJ1MjJmM3RtSHN4VitkeVVXaE9VRVovaXVQUXorNldXSzZB?=
 =?utf-8?B?TjBkWlliSlE2RXY4TGxPaG5rNldYdytHMTZaOWVkUWsyUGMwU2YzZEJvNHps?=
 =?utf-8?B?QXlaRGpwR3grOEYvZDdLTHJPcG50ZmR5b0J6V1FxaFJ3czNEdU9TTG9GQVVV?=
 =?utf-8?B?TXdzc3hseTlpanlqZVpJVEI4M09Kdi9xNDUzRDlhQTR3Y3JTY25NOThORWxv?=
 =?utf-8?B?RDREWjB5TUM5RURReHdxakFKZXpJbndhd2tnT3lmdzAyQTdoNjROUVcrMEdJ?=
 =?utf-8?B?MThYbUJMWFdEM2I4STF1VDVOeFUvVHBTVTVRaVFHVlFxZEwxVitoallsV043?=
 =?utf-8?B?cFFWOStoZHFWVThtZC9QVVRaZ1VEL2dGQnRleEZhWmJtaUNHTTF2VnE0WVlj?=
 =?utf-8?B?Qi8yQklSeThDRGZjbWVXUm96VGNIdi9MY0pvclN6cE5rMktYZXZDSy82L21I?=
 =?utf-8?B?cmpiSHVFMnVvYlY4c3dnQ0xSRUwyNVdDYnlneDZPYW9DWklQemdBSWtGQ3JR?=
 =?utf-8?B?eVBtZWpKMmRjRGZSRlZPYy9WYlEvd1pIN2FzT1U1VmVoUGJVWmx1ZUVHQlcy?=
 =?utf-8?B?NGp3MWdsaG40emJjY2hVbVNUSnhqMnFMa0ZVMU5lSk42SzZpRU90WDJ2ckk4?=
 =?utf-8?B?RW1lMUVES1g2YUxBZTEzQ0RrY3NKQnZSUm5sTGxMK1Y3dE5OWjlkWGYwL3Zk?=
 =?utf-8?B?SGtGK1FPaFd5QlFqVjROSkpydThNc1ByRENGd2J0Vk51d090WERtbFR3NVVa?=
 =?utf-8?B?M3NyNTdHM1RWRDZtVHQ0M2N1ZU1EMjVuZkI3NEtwdHlCbVIyV2RNV2h5RW1r?=
 =?utf-8?Q?L2fgPki68NHeUYwKuZtazhk2+KbNdk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB12408.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmhBU3gvZU5PcmtmeUZxbTdnMUVZUkRvNnM3bXoxYnhSWVFIKzZRVmdvWjht?=
 =?utf-8?B?K2ZnYUNubE5QNGU0Kzk0VzZKdWNjY25qSmVvdHpWNTRwdktyRk9IeEkycmdC?=
 =?utf-8?B?WXFCK2ZFcDNOc2hQeEUyLzQrUUFkdU8vNExqN3ZtenRMVkdZdHhoNDE1QldI?=
 =?utf-8?B?K0NNNjFOZmxqRG9haEJUYURpVnZUeVNtQlJFTklSLzZNY2xCN0hPTWpJaTMx?=
 =?utf-8?B?OU1iZ3V6bEdWaTJrVmd6UnhoeHpKQWtpYnBHbFVnbXg0OHJoU3VWRVc5RSt6?=
 =?utf-8?B?aTRsZzRsMzNQT0FjSlJpdjkzdzNFZHhHS2h2Vm5vTlBBNHpzUVlvTmdaN056?=
 =?utf-8?B?VlMyZnNxRnJOQWdDN2VKNXJ5UTRjd0o4eEJLZEovcUJlaXVabkdtS2xkRWVs?=
 =?utf-8?B?RHMvZjhRbjZmVFAzU2s4NGVDUE54cGV2elJkZE1RQ3RncTh0WUVTdWxmdlBH?=
 =?utf-8?B?Y3ZtWWZXTndLQ2RseFlkMTJBTmVuemo4bEZzL0RkZnozQ1VubkdIZDhQeHNP?=
 =?utf-8?B?Q3huVGR3SHNWWVZON3dQdmprTjJzNWd0QkU5Qlo4WG5lNWMwbGIrYnlzT0o0?=
 =?utf-8?B?SFk0K000cGdMVnJEM0NPQTlJUFRWcWthbU96bDFtaG9SbVdyb3dVRkJMTXVF?=
 =?utf-8?B?cW1BVW9wY0RVZmpzdEdtbVIyTUo3c2p1L1VXdXI0ZzNJZ3lLdWU4cElJa25V?=
 =?utf-8?B?TXNFZCtab0cyeENtTjFlekNIVWFLS0dYQVcxcHU3NFoyOVVhQk1uMTRHUXRh?=
 =?utf-8?B?MGsxQUZvUzB5cktOaXhycWpHUUJsT25od20yQ0lWcmpmd0JsaUIrNCtxWGtB?=
 =?utf-8?B?SEQrRUVkSUlzUTJzTjBoUnFld1BBSkx5UGxkZGp0Wmt5OGJTUVg4Mm15Wng4?=
 =?utf-8?B?Y2JVSTV3V1lWWTBqYnJ3K3FDNzRud1NmMFN6T2dSUTlJOVRCZGJ5d1p6ei9P?=
 =?utf-8?B?K2FrZFRBK2ZZR0JIejE5alh6K3RWaHdMdzd1b0ZPQ2QwS1l5NDFBUXNzY2ox?=
 =?utf-8?B?WmpWMjNtV3VlcTZ0TzNwWlZiVmQ4bTZrNnR2Q2N3NFRLOUxCcU5lb0pGWGR2?=
 =?utf-8?B?REdyWURkOGRjeXQvVUVIbzlqK0NXSG1iNll6TW5INDJjb1oyOEFyTDRDZGth?=
 =?utf-8?B?WTd2UE5ENHRNYnZlcmUrOHArMDlBZWc3MjFRYTNFaG9nL2pkYlFhQ1RnWHE2?=
 =?utf-8?B?OGorMUY2TXlmcytaVHUrcDlRV2FLQkNudkhwa3NxMlhOelZqamNtQzMyVW5v?=
 =?utf-8?B?ek9CZWxmc3pLMUVDV0dPdDBvMlBtNFo3dks3Wng4VFRLNDF5aGJvWTJIVVFM?=
 =?utf-8?B?NUNqR3NMZHlKZytHNjhzVG5nMUxYRkhhNWY3eUVYRFQwY2x5VXhhSUVWOHdm?=
 =?utf-8?B?R0dja1VkcHNUQmlzMjA0RzlWSTlFZ0t2VURVMmFraDU5TGNoaGJlYUJLZy96?=
 =?utf-8?B?Uzg1RU1qMHkxbHowcXZNbHliMU0vVkpXeGR6VWZKK1JIeS9IUUxTaEV4Wkla?=
 =?utf-8?B?Q3FFM2dVWmdld21tUjhFL3Nnd0RkSjRjOGplSXFxSDVmc1RaazJwMXlTaTcz?=
 =?utf-8?B?eDlaMEtYTVZJM1BHNUgyMTZNZ2NQZFh0S3I2ZU5aNGt0bGFETDVHV1RkQVcw?=
 =?utf-8?B?bmhSYmpCQ2U4ejlhS0JVcEp2M2kxZ2tja0JBeTd5YTNMUnp5MUZKSmk3U1VN?=
 =?utf-8?B?bHdIMldXcHFXbGYwZHRYdmc3cjRFbFFHejNFOTJ4Ung3aXoyKzRMbXFPQUta?=
 =?utf-8?B?UksxNitsRGZhSnRGV1dMKzcrMDMvSk0rRjczTVVOMDVNa1VZK2JadXhxTTRU?=
 =?utf-8?B?UnBTVjBLeTNNZmhGRFlwcEltTTdlTDZiTURkWXVZQ3FYa2FsR1BHdVA3S25K?=
 =?utf-8?B?cUhGV2JGUStJZkF5SllBTEc1Zk5iTHVWeVFZTjI1aUk2VE9CUTduTS96bWJL?=
 =?utf-8?B?cVpqWWxNREVLY3pwYlBBZU90UW5HV3RnbnQwWkZ2dk5hMThPSUZxNWlvdXk3?=
 =?utf-8?B?M1pVRU10TjRteEk1clB0NjVPYnFadURVMzFDOC9oTGhiTzJ2dUZRTnNZRkc3?=
 =?utf-8?B?dFRRZnhEYUJRNVdCdVBXQ01SSVdMeFFFSk56M0Q2TWJEcW0veDM2VzVwSUdQ?=
 =?utf-8?B?UXBRbHZHVUVuTmhqbHlZVUhWSUhVQXQxbDJaVWRNaEd6VEN6L0dtQnJzakJF?=
 =?utf-8?B?R2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB12408.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9abec2-1510-413c-a071-08dda359bbdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 11:19:55.5073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1tKuJCJZiJt8wZGK9PyC3ZPjUp2GSnlycYshKHSNcKGA/wc29kOZuCxWePcF/fU75JVViSN3fzQ6IMrpMMjWf2863qoTfuJI/0Ou4QDuP/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6697

IEhpIFN0ZWZhbm8vSnVsaWVuLA0KDQpUaGlzIHYyIHBhdGNoIHdhcyByZXZpZXdlZC1ieSBNaWNo
YWwgT3J6ZWwgb24gMm5kIEp1bmUuIENvdWxkIGl0IGJlIG1lcmdlZD8NCg0KTGluayA6IGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjAyNTA2MDEx
NjMyMTIuMjk4ODE2Mi0xLWphaGFuLm11cnVkaS56Z0ByZW5lc2FzLmNvbS8NCg0KVGhhbmtzLCAN
CkphaGFuIE11cnVkaQ0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBPcnpl
bCwgTWljaGFsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4gDQpTZW50OiAwMiBKdW5lIDIwMjUgMTI6
MjQNClRvOiBKYWhhbiBNdXJ1ZGkgPGphaGFuLm11cnVkaS56Z0ByZW5lc2FzLmNvbT47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFu
ZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1ayA8
dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBhcm0v
dmdpYy12MjogRml4IHVuZGVmaW5lZCBiZWhhdmlvciBpbiB2Z2ljX2ZldGNoX2l0YXJnZXRzcigp
DQoNCg0KDQpPbiAwMS8wNi8yMDI1IDE4OjMyLCBKYWhhbiBNdXJ1ZGkgd3JvdGU6DQo+IFRoZSBj
dXJyZW50IGltcGxlbWVudGF0aW9uIHBlcmZvcm1zIGxlZnQgc2hpZnQgb3BlcmF0aW9ucyB0aGF0
IG1heSANCj4gdHJpZ2dlciB1bmRlZmluZWQgYmVoYXZpb3Igd2hlbiB0aGUgdGFyZ2V0IHZhbHVl
IGlzIHRvbyBsYXJnZS4gVGhpcyBwYXRjaDoNCj4gDQo+IDEuIENoYW5nZXMgdGhlIHNoaWZ0IGZy
b20gc2lnbmVkICgxKSB0byB1bnNpZ25lZCAoMVUpIHRvIGVuc3VyZSANCj4gd2VsbC1kZWZpbmVk
DQpOSVQgZm9yIHRoZSBmdXR1cmU6IFVzZSBpbXBlcmF0aXZlIG1vb2QNCg0KPiAgICBiZWhhdmlv
ciBmb3IgYWxsIHZhbGlkIHRhcmdldCB2YWx1ZXMgMi4gTWFpbnRhaW5zIGlkZW50aWNhbCANCj4g
ZnVuY3Rpb25hbGl0eSB3aGlsZSBmaXhpbmcgdGhlIFVCU0FOIHdhcm5pbmcNCj4gDQo+IFRoZSBp
c3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgVUJTQU46DQo+IChYRU4pIFVCU0FOOiBVbmRlZmluZWQgYmVo
YXZpb3VyIGluIGFyY2gvYXJtL3ZnaWMtdjIuYzo3Mzo1Ng0KPiAoWEVOKSBsZWZ0IHNoaWZ0IG9m
IDEyOCBieSAyNCBwbGFjZXMgY2Fubm90IGJlIHJlcHJlc2VudGVkIGluIHR5cGUgJ2ludCcNCj4g
KFhFTikgWGVuIFdBUk4gYXQgY29tbW9uL3Vic2FuL3Vic2FuLmM6MTc0DQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBKYWhhbiBNdXJ1ZGkgPGphaGFuLm11cnVkaS56Z0ByZW5lc2FzLmNvbT4NClJldmll
d2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KDQp+TWljaGFsDQoN
Cj4gDQo+IC0tLQ0KPiBDaGFuZ2VkIHNpbmNlIHYxOg0KPiAgKiBBZGRlZCBzcGFjZSBhZnRlciBz
dWJqZWN0IGxpbmUNCj4gLS0tDQo+ICB4ZW4vYXJjaC9hcm0vdmdpYy12Mi5jIHwgMiArLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMtdjIuYyBiL3hlbi9hcmNoL2FybS92Z2ljLXYyLmMg
aW5kZXggDQo+IGExOWQ2MTAxNzguLjY0MjQwN2ZkNWIgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNo
L2FybS92Z2ljLXYyLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL3ZnaWMtdjIuYw0KPiBAQCAtNzAs
NyArNzAsNyBAQCBzdGF0aWMgdWludDMyX3QgdmdpY19mZXRjaF9pdGFyZ2V0c3Ioc3RydWN0IHZn
aWNfaXJxX3JhbmsgKnJhbmssDQo+ICAgICAgb2Zmc2V0ICY9IH4oTlJfVEFSR0VUU19QRVJfSVRB
UkdFVFNSIC0gMSk7DQo+ICANCj4gICAgICBmb3IgKCBpID0gMDsgaSA8IE5SX1RBUkdFVFNfUEVS
X0lUQVJHRVRTUjsgaSsrLCBvZmZzZXQrKyApDQo+IC0gICAgICAgIHJlZyB8PSAoMSA8PCByZWFk
X2F0b21pYygmcmFuay0+dmNwdVtvZmZzZXRdKSkgPDwgKGkgKiBOUl9CSVRTX1BFUl9UQVJHRVQp
Ow0KPiArICAgICAgICByZWcgfD0gKDFVIDw8IHJlYWRfYXRvbWljKCZyYW5rLT52Y3B1W29mZnNl
dF0pKSA8PCAoaSAqIA0KPiArIE5SX0JJVFNfUEVSX1RBUkdFVCk7DQo+ICANCj4gICAgICByZXR1
cm4gcmVnOw0KPiAgfQ0KDQo=

