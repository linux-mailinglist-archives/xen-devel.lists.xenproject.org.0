Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3447FB3979C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 10:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097816.1452015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYTN-0007qC-4m; Thu, 28 Aug 2025 08:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097816.1452015; Thu, 28 Aug 2025 08:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYTN-0007oU-0h; Thu, 28 Aug 2025 08:59:09 +0000
Received: by outflank-mailman (input) for mailman id 1097816;
 Thu, 28 Aug 2025 08:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRvb=3I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1urYTL-0007nz-Q0
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 08:59:08 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4108774f-83ed-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 10:59:07 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 08:59:04 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 08:59:03 +0000
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
X-Inumbo-ID: 4108774f-83ed-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFg9KiH7N3mFdIdh9JZ89PhhAgCn65AZRPqWrIKteCUAhlLXk7q2h/71bsmMq2EZ+qOIsWqX6FrSHpamgg5iMw4Aqe4rjtCnj70z8+gmxiG5jVzA0qFMo8n7Ew1QIkIw8hHo/RCTyx/fBFpvB5bCtkMpoKH2IyaWRAOks/Ew0fFPJFosRl4XFgqjV5kndx/eEIszvobH8eEmPUOB1SJyBSknqZ5TKiew/f3kRUpVdEN1yeGD5uBEep1BFSpuI8Q6oNwwmHFXbJ0bISWAWyuxjIOsoplC/E0+lKvrH/UJJ1yMiVtvWBE7gZELP60EjrmIijkxxzjIaIcDw8J7+2oQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0lXEm6g+lwJ0lk7JxnilHnI3CE2LfVstsxIveYN5zA=;
 b=BW6z1xboP3xArRsdxLb4UEUXmbP5ntyTil/hc6qy9KoiuaZ1HhIcBtbwEVelaqiBKcSjobxsTgCvproBUjdV2JXrQk9vnjM5ppJgs/mtcAfoQuQk/advDuNEytUWYLCqACoR6M0HOenqGRnv/tX2u2NF+vZL3smk2va+8dHBhu8sSAzrxBOdyP1Wak+NojSjE6ISsLoQMDSXs68+pXLczaRIgZiAgCVW/VTo6lPwOwle2d93fN4b+WHP9aY13iNZlX9cbgWlETUhta1f/5z/+IKvIzK037xm33Pv/w07VBWbCrIbf04fQbBkfJRmkfiXERk2M82RjjSMTBPriLYt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0lXEm6g+lwJ0lk7JxnilHnI3CE2LfVstsxIveYN5zA=;
 b=KesIn38ym6t/8zW+f1tfEqwQ0fL1FHZ7yyaSrmSsdQ3wjTdV/p3xGQWq/KW7h3kPBo+ccL8AsAr6V2h0UFqhNYNVtsQLCwJGLbECXl/7L6li4Mfzg42Wc2mgIBZhrIyS5F77tWRnXMwTwbGHnJn8qEhLA2ApLlCyklxYRrBasNs2xSdFZyy/PfWapgQUFLyL2Pr4eoGYbR72qt5qMrEYs4Wo44HgeLynCSuYTUs/7loWgErKyb/qOoE1D57OrsvZTnPkVMjvMsn96H8w/zAsVoEYSrnIafFrIdIj/fbWo5IxFb7+tJCGy3Iau+LYZFaARkz/0sctkTMUQq2Dx3aS1w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
Thread-Topic: [PATCH] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
Thread-Index: AQHcF/Q482rbLahQD0qhywmRaenDcbR3vFaAgAAHwoA=
Date: Thu, 28 Aug 2025 08:59:03 +0000
Message-ID: <50c98f8f-d3d0-4827-87ed-e1c99ef4fec7@epam.com>
References:
 <d7768394209c65cfef4006c3ffc0a0f5d82c4c18.1756368997.git.dmytro_prokopchuk1@epam.com>
 <185dce3ba4762d4528866f2e50e45371@bugseng.com>
In-Reply-To: <185dce3ba4762d4528866f2e50e45371@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PAVPR03MB9020:EE_
x-ms-office365-filtering-correlation-id: 876a45fb-1960-4098-b2ff-08dde6112352
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cVl4dStmTmpFUWdSdzVhK0hSWjJrZGU5V2VyNjQ0SHB2bDhVR2N3bjd2T0hT?=
 =?utf-8?B?c1A3WEU0T2lBMmprTUNLS3JSMEVzZndqanNFeDlsL3hmNDg0SmJNY3NxM1FO?=
 =?utf-8?B?dWZWdlBUSDZiVWJESlNoYjc5MmdOSjJmbDRXNERFODdPV21ySzUvckxMUkxC?=
 =?utf-8?B?aEZOVWFOcXQwYWNLcHlEaUd6U2FqdFdTTitJZXZSdGlKYVRUZnBzTSt1NUJl?=
 =?utf-8?B?SXhtZDNweFZXV05CUkx5Y01GZVd1MHBoVGdMRkoyd0lTM2cyYnU2Q3pjWnRm?=
 =?utf-8?B?RlZZcXZVczJFeVhabk9COWRsWFBualVtVTRHLzBmWGV2bjV0OFpLNVdINnpN?=
 =?utf-8?B?QmtkbnFvcVBrTTB6Q0Q4NmErdXF3SGVzRjF6NkZtZmxhSWRxbHFiVmgvcUh2?=
 =?utf-8?B?VzF0WnFKM3U4TGlFdDZrVE4wYVIybHRWRmgwdUdTN0ppaWYrK3dCM3BtR3Rm?=
 =?utf-8?B?dXptRjhGWE1yRGhhOUxDMXlVWDhMdjFkRTRYQmpFQ0ZaTEtMWXBhWW5wb2hX?=
 =?utf-8?B?VjZTSFZ6MmFGdDlML2xCdVVHUVZTaFpxaG9kaEdiNzFCS3dyZXhOendWVVlj?=
 =?utf-8?B?Z1JGTkJGd2VOMHppLzZzZXhFZFJieVIyTGNaYW81SThEWTRjZXRYWUdoSXF6?=
 =?utf-8?B?NWxSaTU5MUJTZkdIYW0xSWRsa1dkcExjRFRYd2VhYVY5YmsyTi9WajVVaHp1?=
 =?utf-8?B?VTZoMHBZdDBlcHF3VlVJenNjaFNlS3hTOUpLdjE5bC9UWTlLUUxOakZsVU1Q?=
 =?utf-8?B?L3RWSHBiVWpwSlNDdW1IVWk3Y1ZHSk85U1FZRE93ancxdEJra2U2U3laZ1Fv?=
 =?utf-8?B?Vmw5a1c3MnBPbmN3T1hiUGxpMWNvRVM5TmlleXVDVGxIUlFXN05URWlzRnNj?=
 =?utf-8?B?MWtob21CbzVwL2s5QTlwRDQ3TXVVb1BNbllkOHM5T0RkZXBkaHlxSWVMOExw?=
 =?utf-8?B?NTA3alVyQW5HVUQ1U09PL3NpSjJvd0pzOHM0Vnd2bDU5NzRQck9aZ3QrV21x?=
 =?utf-8?B?SCtTL1o4eVVMNkNCWWhVajBHcXNGZ1hDVjE1eFFVcCtDK2tDcHkrSUJCWkxQ?=
 =?utf-8?B?TDFPY3BQd0huVFh4TDQzT1I2ZUhUZUptMGNlMGpqTWpMNGZNODRUeEtidmlC?=
 =?utf-8?B?cUwzM1RHMXU5Y3pydnRjM2ZhLzNCMXp0Qm5TbTZSdHlwZmhBSGYyZys5WERJ?=
 =?utf-8?B?TW9oVkFQKzR5WUU3cDZ5dWd3T29wbHJKSDhTWHNkdk1tdHVBcVc4a2E5ajhh?=
 =?utf-8?B?TFJBb25WTnJnMzVzT1hVK0hBVGoxWTFTYmpiUFl2TVB3K00raWxXVy9xdTRB?=
 =?utf-8?B?bFo5SXp2U0c0RU9jUFRqdHlZaVJsMzJjYXFTbkRmK0pQc0RCb0NxYjlGY2JQ?=
 =?utf-8?B?WHF0aEowakJWd2lZZU8wTWZiOGV2V2RIYW4zUlVveExJZ0hTUnp4T1hDcGpI?=
 =?utf-8?B?RTZ1amw2UEx6elliMVgvanJjRnVHdmZrQzBFN1ZJc1RONkltYTNveHhTYUhH?=
 =?utf-8?B?OUp5amloeW1ZemZoZlZUMzkxRHpzT0xsZUUvWDdVM3ZXVUJQQVBXYWlZUXB2?=
 =?utf-8?B?SkhraGRVL0VwTG1Md1lUdVowaFIwVVlXZnFFckU0d3I3Ty9HNXpVcnZ2QlEy?=
 =?utf-8?B?MWsyMDBucmF5YmFIYjNqWU5nSEMwMG5lbGt5VGhGcGplcmNNUStGVTRWRjEx?=
 =?utf-8?B?Qk44T3ZKQUxBdkVEdkhwRVk3aWVjRjRLVnRpMjNtNUVsYmEyTTBiaU56Sksv?=
 =?utf-8?B?cmxkcmRDMWljWlJpblFMRWlZMk5VZmhURzZnSzFWcFA3cEZva1FuWWw1YmMv?=
 =?utf-8?B?WWZPV1BWd3kwS1N3YXplQ0NYUWtMZDFyQU44T2ZJR2RRTnViWDdXdWNJbE8r?=
 =?utf-8?B?ZDZTU29hekZldDQ5Q0Z5WTQwdjhoMGI1YTIwT0Z3ajRJeVlnWW9IYWlFSUtx?=
 =?utf-8?B?TGF6QmxHUzB4bmphSmRMNzE2bzg1SGJtMG5qQ1B3L1hMM1RySWFTOUdSS242?=
 =?utf-8?B?VSt2dThyWnhBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWpMb1BhdEhWMnhFalBGLzN4Rmt3VnZuZTdUZmZ4ZFBhbEN0WG9nT2ZtZysy?=
 =?utf-8?B?ZytwelF5NDNIK0FqTzd5dWNuTGx3a2NOblNybVRVRGtSNjY4bXZmMnZ3V1Rw?=
 =?utf-8?B?VWpWR2Zhc2V6RmNJY2JTdHNQNnNZUEVPUnhRYXUzQ0R6UlE1QjF1MDdWZXdN?=
 =?utf-8?B?aTh0SXptSThzOXkwTXl1MnVZRzF4MUVmOTBJV1BuWTNoVjl6UlVlc1dib0w3?=
 =?utf-8?B?cU42alY2WmZ0SGp3eWJHMTN4bmFaN0paS3FKeCtFaEJ6d050Y2ZrMjRRYWtW?=
 =?utf-8?B?azBjR1U0Q1dpSng4UTAwbjdnL3F0T1ZCVGFnUmViU0VJc2E2cFNxbkFnYjc2?=
 =?utf-8?B?R0UrUnYyaXF0RDZiQ2FpR3p3Z2RtM2ZJUmprTlI4WG5qbG8vTG11TE0vSzB6?=
 =?utf-8?B?THdOYWEvaFJxcU9oSkowWW9rMzkybnl4Ymxqck9PMUw1SmU3Q1dBMEdlNlVy?=
 =?utf-8?B?OHBINDQ3TzF4alJ0ZXlRcDhta05rTDZseXBnWnhNMWgxZ1Uxbm9oTWVjZHVC?=
 =?utf-8?B?M3ZxcGJPbGkxQStjVUR2UjBYUWthSXFtRVNMaE9uRUd4aDc3by9HNXVnajdW?=
 =?utf-8?B?ekJkbEZTWTV6bGQ0alpLTUlQcm50MlZkNTYzNURhbXlzbGtsNTNvL1dkeFRJ?=
 =?utf-8?B?SWx4Nlh5N2ZUd3ZSQ2diNGxiRmNnVFNuZjRDRXBNU0hSL2FRRytOQno3VWEw?=
 =?utf-8?B?WWMvamFNd0tVcFJCeDB2aVV2OFJpN28razN4bkhlUHdrbUZ1YUpKOE1qVm9Z?=
 =?utf-8?B?YTIzN0pKSGVzQXFVYmVGSVFuRXB0QnpPR2YxeUVwbEJjcEhvTnFud2tPbm1n?=
 =?utf-8?B?L1ZXT0Y5eWlqZk5rL1ZjdTdSYSt3cENacjdocVRtVTVkRnFRV3FyZUM3Y281?=
 =?utf-8?B?Z3BLK2N6MkNET1lrZDN0VkhOYThsYjFReEc4SU9GUERScDFOalFmYXUrajdI?=
 =?utf-8?B?VlZBWGxVME1IWlBQWVc1VjlyWWlTUDdJM1hJd0FGQUhiaWlBZVhnVzF5dUlx?=
 =?utf-8?B?TEdHT093QVpyM3hjcHdzNFlETjladHR1TUt1VlZQQzR6ZmdvdG5TajRPK2Yr?=
 =?utf-8?B?ZS9WU2taVThDY3BzWWNVU1lTSHEvMjFaejdqY2QzU2FvT01ReEo2YVFXd2ZG?=
 =?utf-8?B?eGxZcnM4MUt3V1hWVzFQRFh0c3JHaTRQR0ZpRlpZVUV1c3lraEloa2lGdVEy?=
 =?utf-8?B?ZHJKNG80Sjk0WWRXUTgrRXNhRncwVk4yVjFUdUZUUnhLanY3SjBnSzNMOExv?=
 =?utf-8?B?T3ZOQXVDVXBha3FaN2pvcHdRNllkWFAvNXhhSUluOUNtRDN0N3FTN1VtNVA3?=
 =?utf-8?B?TXNXRTdIelRtMm56aUtGTzJJa3BSNy8zckxsTEoxSlRPZ0s4OUJUdklDcFFP?=
 =?utf-8?B?ZVlPajRJWFRxMFpDTENBZmwwUkl4YmJIMWFvYkJzUDRJUE9welczVWF1UkNq?=
 =?utf-8?B?NnpIWFJaS0V1QUlWNlZiVGZqSm5GSG1SSFVmeHdWRkN5SEYybXU3cWZhQUdM?=
 =?utf-8?B?bVE1UHZ0dkZaS0J1YmxFSWNKeDU2TWg2RTJsSkdjek0xZXFLcDlJNjcrTXFv?=
 =?utf-8?B?T3I0VXZZdkVwM1NmMmdQNjd1eHdZRFVQR2JGaDhZV1plUEM4WFVHU2NrOHlE?=
 =?utf-8?B?azlVRm5xaU9reEtiYy83Um13NnAzL2NocmJJci9wbTZmWmIySmN0bzY4SS9K?=
 =?utf-8?B?S3NwcDZ5M0JGTDFaa0xXVzNsZUNxdk01VHQydDZMRmVVZFFDWWxFaUlRYXN5?=
 =?utf-8?B?Tk1DVG1FRWIrQXhGY1cwem5PaHNVYkJ2cG13d3pla1grelZBemZ6NnEvcVVW?=
 =?utf-8?B?cEpQOUFmNGZWZnNvL3RiNWkwdmhXekU3SFhGc1BUWlJTbkFSSmtSY1JaeVB3?=
 =?utf-8?B?QW01WStJQjVZWWhmdnRUankvbFkzU2FkOVBINytEYXEySmZEbStsaFJmNDFK?=
 =?utf-8?B?ZC9UTS95akNNOHNPL2dDbGVlN0V1Qk4renJxSGFZM0xkdVVlK3BFazJIcE1L?=
 =?utf-8?B?bEhTdVZBcE1qdEF6SVZsa1ptSG5WcE5tdmN4aVpjdGxqNmFYeDVKZktwK0NF?=
 =?utf-8?B?czVZV3VYSEg4a1RDMWtyRlpUdldWcVdObFkyUEFkSjVZWGpzNDcwbDVETnQ0?=
 =?utf-8?B?L002YkU1bnNnampGV2p2VVZFcnIxQ0FjVmRWU3FkY2dZNWh6Wkdabng3TU5a?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5917905B4B638C4C96A3D1D8E766EFD6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 876a45fb-1960-4098-b2ff-08dde6112352
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 08:59:03.7511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SsE1HmWDRZ+8eFaogfHC6oB5XPXuena6fVzwTIF/GPTsFqnmQCOG27dOCKEpA7FBsVOSxPdjL3XLu+8TUd4WuHMOf/XG4hgxO9xV8fbbrwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9020

DQoNCk9uIDgvMjgvMjUgMTE6MzEsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTA4
LTI4IDEwOjE3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBSZXNvbHZlIGluZmluaXRl
IGxvb3AgaXNzdWUgaW4gdGhlICdmYWlsOicgY2xlYW51cCBwYXRoIG9mIHRoZSBmdW5jdGlvbg0K
Pj4gJ2Fzc2lnbl9zaGFyZWRfbWVtb3J5KCknLiBUaGUgaXNzdWUgd2FzIGNhdXNlZCBieSBhbiAn
dW5zaWduZWQgbG9uZycgdHlwZQ0KPj4gZm9yIHRoZSBsb29wIGNvdW50ZXIgJ2knLCB3aGljaCBj
b3VsZCB1bmRlcmZsb3cgYW5kIHdyYXAgYXJvdW5kLCANCj4+IHZpb2xhdGluZw0KPj4gdGVybWlu
YXRpb24gY29uZGl0aW9ucy4NCj4+IENoYW5nZSAnaScgdG8gYSBzaWduZWQgZGF0YSB0eXBlICgn
bG9uZycpIHRvIGVuc3VyZSBzYWZlIHRlcm1pbmF0aW9uIG9mDQo+PiB0aGUgJ3doaWxlICgtLWkg
Pj0gMCknIGxvb3AuDQo+Pg0KPiANCj4gVGhlbiB0aGlzIGxpa2VseSBzaG91bGQgaGF2ZSBGaXhl
cyB0YWcuIFRoZSBSMTQuMyB2aW9sYXRpb24gd2FzIGZvdW5kIA0KPiBhZnRlciBhZGRpbmcgQ09O
RklHX1VOU1VQUE9SVEVEPXkgdG8gYW5hbHl6ZS55YW1sPw0KV2lsbCBhZGQgIkZpeGVzIi4NClll
cywgd2l0aCAiQ09ORklHX1VOU1VQUE9SVEVEPXkiLg0KPiANCj4+IFRoaXMgY2hhbmdlIGFkaGVy
ZXMgdG8gTUlTUkEgUnVsZSBSMTQuMzogIkNvbnRyb2xsaW5nIGV4cHJlc3Npb25zIHNoYWxsDQo+
PiBub3QgYmUgaW52YXJpYW50LiINCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29w
Y2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KPj4gLS0tDQo+PiDCoHhlbi9jb21t
b24vZGV2aWNlLXRyZWUvc3RhdGljLXNobWVtLmMgfCAzICsrLQ0KPj4gwqAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24vZGV2aWNlLXRyZWUvc3RhdGljLXNobWVtLmMgYi94ZW4vY29tbW9uLyANCj4+IGRl
dmljZS10cmVlL3N0YXRpYy1zaG1lbS5jDQo+PiBpbmRleCA4MDIzYzBhNDg0Li5iNGM3NzI0NjZj
IDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9zdGF0aWMtc2htZW0uYw0K
Pj4gKysrIGIveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9zdGF0aWMtc2htZW0uYw0KPj4gQEAgLTEz
NCw3ICsxMzQsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBhc3NpZ25fc2hhcmVkX21lbW9yeShzdHJ1
Y3QgDQo+PiBkb21haW4gKmQsIHBhZGRyX3QgZ2Jhc2UsDQo+PiDCoHsNCj4+IMKgwqDCoMKgIG1m
bl90IHNtZm47DQo+PiDCoMKgwqDCoCBpbnQgcmV0ID0gMDsNCj4+IC3CoMKgwqAgdW5zaWduZWQg
bG9uZyBucl9wYWdlcywgbnJfYm9ycm93ZXJzLCBpOw0KPj4gK8KgwqDCoCB1bnNpZ25lZCBsb25n
IG5yX3BhZ2VzLCBucl9ib3Jyb3dlcnM7DQo+PiArwqDCoMKgIGxvbmcgaTsNCj4+IMKgwqDCoMKg
IHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7DQo+PiDCoMKgwqDCoCBwYWRkcl90IHBiYXNlLCBwc2l6
ZTsNCj4gDQo=

