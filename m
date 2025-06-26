Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306FAAE9E38
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 15:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026345.1401531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmKe-0004QA-2r; Thu, 26 Jun 2025 13:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026345.1401531; Thu, 26 Jun 2025 13:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmKd-0004Ol-W7; Thu, 26 Jun 2025 13:07:59 +0000
Received: by outflank-mailman (input) for mailman id 1026345;
 Thu, 26 Jun 2025 13:07:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TH9p=ZJ=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uUmKb-0004Of-QM
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 13:07:57 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9121482c-528e-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 15:07:52 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB7669.eurprd03.prod.outlook.com (2603:10a6:20b:34f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 13:07:50 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 13:07:50 +0000
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
X-Inumbo-ID: 9121482c-528e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYZV/2tbW9z3Ec7W5jklEmZsXsmPh7xErlnXCRIm8q3Pfos5FbpWWlhXIIEHi5o5Mjtfm7zdllJA+lARDR0dC6nEdBWg2lyaKXgP0X6sZadckwwDlNrVXZvI1FJaKt+8IUq21JBk7GCHEjkwYB+HsVIgWXxvZUP+4vNWoC4tBsGGXrqW+M4WXHclvOnYFQsZRFh2oXwNS3LRJi1nmi6KZwLjKdIVnRzeVvhXhcr+RWG6+osssjeICNlus2XBHPG1sJpvDTg2im2n7ud1atHkvpcMWOrXCdl4WEwt1jLIVJvb41tVU+ZaSQBikvIDOd3PjFGHtjnQxGVNIs/MwxouPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQOXd2xuBmC0z2sS76ftQRZkVS8V/6CMt3/5wSiZYQE=;
 b=WqvLnHPfLepLdIyZ/zAiWBai7vT6DupsQDTr4xVGtvp20g9Iwl3L2b/Kr4dNN4wNlRY6i1MSX7avvX7ig8Zid48FXhQwWOYkGzwMqbL8aMaG1ND/5WbgDhbq2f7Hd//+ms+PV7IcoB367lzEuRQjPFWJDEPH0H7UdQJBEJHkvAcuz297wTCJEVIfGJ7RDAMwe07sS/BLUqPZ8hKlYeTUZg5qR4qZETB9QcovnrwK0ZLAZxxNCjpZidE3SM8uSr53ZCSXOtou304eQhXsmTVWFMyKFesO1pJYobLIQvhfBX/0SQROrPfTKPeJZ0g8k6zInGXdf758bZKXZcsD8/vLTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQOXd2xuBmC0z2sS76ftQRZkVS8V/6CMt3/5wSiZYQE=;
 b=hRUPKNWGbWEZ70YRUDwW/rDL3zGzILd1MAXQ5JfdHVeZxulITf2UHB413lbLstk9O11rCqPK5JcXF5mPEReWAJW073qm3R9Ir5bRnoVlQQ8fs4dTnvsVOIIxcEX6eIpkAAMqCq5YTud8domR+nFR1rtfNaYqw/1N3Rf6IeZiGhT2zlzTSphjXFjsu1fZZF8vGT44QZuapy7RRdQxs4xqDvSpTJ/zxqyLrPjo0perUra9618bnvEufTTLom3cIrKgnYK6aGLwKhTsgdnJUYmGktf4BE8cOyNUjJNu31EVPaOUOGTXi9vkQmrm17ot0VUJSCnzmWoI/v57otKJH08ctA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
Thread-Index:
 AQHbyNXPDXt2FT3RV02cltfdm/Dd7rPdzmiAgCG+LgCACKrsAIACoXoAgAWykoCAA/lGgIAAq3gAgAB0qoA=
Date: Thu, 26 Jun 2025 13:07:50 +0000
Message-ID: <0cb693b6-c22c-41e2-b332-7b7e4134d0df@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop>
 <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
 <alpine.DEB.2.22.394.2506171701190.1780597@ubuntu-linux-20-04-desktop>
 <1780646c-cb6f-4508-86c8-a573fbc09f6a@epam.com>
 <1e116116-ddf7-4640-9809-2502203abe46@suse.com>
 <3e190e60-74a4-4565-acae-3b8602a4c46e@epam.com>
 <8bb4e188-eb3b-4ee3-88cc-93c826b04ef8@suse.com>
In-Reply-To: <8bb4e188-eb3b-4ee3-88cc-93c826b04ef8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB7669:EE_
x-ms-office365-filtering-correlation-id: 65be1eef-384d-42d9-2442-08ddb4b27436
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dnd2VWRwTk5YZFdqb1FOTWl5M2dtdEJtS3preXhTVDlZWUQ2NGJqcDdXaXZX?=
 =?utf-8?B?TWNWUmhvQU5ueXoyc0ZjREdMcE02WjBhd3kwdnpJS0x1ZU1BLzQzMk9TMHRY?=
 =?utf-8?B?WWNCNXZQWUdzTS82RXhjaDZvV1kvQjUveS9zTHZzTE9nbG9ZOGU1TitTaitO?=
 =?utf-8?B?L1hSdncrQ2pVR1dXVFRYWGQycFd4Z21va01XVDlWcXVDdEhXUlFBbHdiT01m?=
 =?utf-8?B?Y25kaDBTcStSbVNnYWVnbTdWU2cyb0pLT3RRdjZRSVRpbHAzZjdvUTFrcjBS?=
 =?utf-8?B?WnkweHVualE1eFZRckRjK09MT2dPamNhdHNyWEJWRWtOMDJvdTNDSVdEUEda?=
 =?utf-8?B?TmRWaGxvTCtRT1V6YTE4UTB1d0h5WEc0SC9aeXlOWGhkN0tzQU9vV0xPc0Ja?=
 =?utf-8?B?Qkp6Ynl2eDN3dC9pTysyYTRpWjcxZEc5cU1rNGRjUjhCb1JhMXFmcnd3d1Bk?=
 =?utf-8?B?b2wvOHo0VGtiaHAxeXhFRENRR1IwMWxuNjJCcE80bFQvSXBGMGNMVm5nMERQ?=
 =?utf-8?B?bjdNMHJkS1pMenpVMWdld1RqOUZ2SGVCTjBxK3BMNnY5eG5OWVUwQlpXb0lx?=
 =?utf-8?B?S0hrNHBnNElxMTF0clNvcVdkcURuV1NibTVzQTZTZ3RDbEFqUHlKdlhTK3l1?=
 =?utf-8?B?YVZZV3hOaHd6RkNPbXlSellQVDAwTnFsWWN5QkhyODkrR3pmWWM5YXFFVDhS?=
 =?utf-8?B?cE5qMGJjK2VXdm9iR0xpOGxETTlyZmdMbEtuUjBaa21NZGJWZklIUmtIU010?=
 =?utf-8?B?R1NDZWV1aDQ2N0g2WHNHOEhpSlMzdU5LbnJ1cUZ5ZENiaHRGTEU5eFR4THky?=
 =?utf-8?B?MTBDWEl2Tno4cVF4d1lyT2tsM1JnMkluQ09lWk94SzZ5NU9zalUyZlc1RUxV?=
 =?utf-8?B?R1BkNkh2eFF6L0pUR29BTGYwUDRVdStXdjRFcnBrdVVld2IvUnE5bWRvWEt5?=
 =?utf-8?B?MnU3b0FlaFVjaDlER0RiQmFwanUrY25GQ1hqTmNDank0UWJUU1p6VmtTTGRR?=
 =?utf-8?B?Z3pMc1pGUHN3SFZGOVJpWWt4QnRxSmxsTXk4TThwSW5IZVlMMjYxRmN2dFVv?=
 =?utf-8?B?aGcrbW9xMDhtdXFYOUxWNnZPTkQ5MUpma0NwV2NQcS92ckVPczk2NGFtQ1NC?=
 =?utf-8?B?TmhqakxyVU9IR1Zna2w1cDJZTWI1L1ViUkFUWndDVXpJVGNaM3Nzc1dVMnRT?=
 =?utf-8?B?UGtERS84R2pNTE1qWm5nYXdHK2RQLzZYUm9SNDExNkcwcEZMR0ZLdGsvRGRm?=
 =?utf-8?B?dENyb25RZDJCQ2IxMG0xR2d4KzdjQW5VNnVPTVdtR2lPeEcyaW8vNm1UVFZD?=
 =?utf-8?B?OVZXSUZhemZKeE0yUWQrUFFGVVNEZWhWeHREdTY4UitPcG80M1VyWHBkZDJZ?=
 =?utf-8?B?SW5EUm5GQmQzR0xWdUFhbFlTazJjRnZxOStKVTllMFlVY1crcGtJWDE0MEtZ?=
 =?utf-8?B?QnVWU1FLbFo2TEN0VGhBdStaSXM1eXJxVjd0cmJhNkNleUtNTS9Eek54dTYy?=
 =?utf-8?B?ZTF2SDBxaStMeGJDdFF5bDA2cnVtVVVEZ1l0akt6UDhFbjkvMXhQTWtYdGEz?=
 =?utf-8?B?MS9OUVdyNTloMEJ5bHc5ZlZsUWFLaGJsVlcxMWN0OVY1V1ZMeFFFOGsyU1FE?=
 =?utf-8?B?NllycWtWQUVoNFM4Q2ZuZW5qbGR1ckhFMHZzWW9JYXhGTE02d1k0aDNZMHho?=
 =?utf-8?B?MGpHZEN1d3lCNkZrb1QwYy9mcEYyLy9OQWdVejZJUW0rZG45Ri9mV0NWYkZ2?=
 =?utf-8?B?ZFdBNXJndXcrc2poV1FkbklzTmtNZG5vV0pnWmh3ZkhNSUo5UGJwUGt0aWxk?=
 =?utf-8?B?d0NHcTlOaTUzOXJzT1NmeXZ6RHpaVm1aU2wza1BMZkNid0ZnLzZLNkhEcDIy?=
 =?utf-8?B?NkxJNkZmcHo2RTJ4QUVoTjQ2THg4VVJGZG9sajQybVZDbGhEYXp0cGRpd3JZ?=
 =?utf-8?Q?n3ooCobwzNg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXJTMEdKamtzbGh3N21yWEhoUWxISlM0d0pMTTZ1THF1NHcyMjlzS3k4L1lG?=
 =?utf-8?B?S01DclVpVy9mNkJZZGx3aDBPbEhZL05JZ2V4dEx4ak9IV0g0bHE0T0p0bXFB?=
 =?utf-8?B?ZXE1VmVkNVBwV3dHaFEva0YyRHpqYld5VS9DWDVJQ1JDWkFKSGJpN2pBcGJB?=
 =?utf-8?B?anZiL05pemVVNnBrck9EdzRlOUdBYjdkQVVXcjk4dnpWMkFicGcvY3ViZklx?=
 =?utf-8?B?ZExpZzFFTWMvazNaRi93azJCRDJBMUI5UEViMm84d2xCYWdFTHM3ajBmT1Jj?=
 =?utf-8?B?WkIrRXY5SVJNN2dkM3pYMm82a2o0cmpBWjJTbno4OXpjeUx3ZlJQeERlSENq?=
 =?utf-8?B?T3B2czF5bFgxVkF3UlBDUVloeEhMeDZYM1pTR3p3R255UjMvSWxWbjJtYWJt?=
 =?utf-8?B?SXlmOVNaUmdLVFZubFRjcW1UdXFiRENGcVpjWEZod0ZlZ1dkemFMWUxmRkV0?=
 =?utf-8?B?REhPanNLU1ZpRTAwbUo5bHpralZtRHhiVE92eEczVk5kbVlRWExsTlhobmZR?=
 =?utf-8?B?aWVFL0FJWHV6MUJBalhPT2pSMk96bTNrdEJKTkdxS2Fwc0xPbk5hZUtZZkZK?=
 =?utf-8?B?VTRGckZaM1prNWE5K2Y0NGtDak44a01BWEw2dm1ka3hXVGIzVTBwbEpxYVRw?=
 =?utf-8?B?RUI0R2xlWEYrQm9SZXFKbUhiZDZGT0RrTXJoQUQxTHBVQzNFcXZRaVA3d0FY?=
 =?utf-8?B?UGs2a0Y4Z2liTm9CZkxVenVMRTlRYUJnaFNkSXpoNzM1L3IxRHF2VE9MWTBU?=
 =?utf-8?B?c29tMkZhNkZzaThiNTlLK2FyZVVCc1Z2YVR0Q0ZlcEtEV1NZL3picFRvanRJ?=
 =?utf-8?B?WGVhWk9NeHB1T01SWHlleFgxc1RBdVlpOWZ3NDBPNTRGN2NQWVh6aitNYnFO?=
 =?utf-8?B?c1YxYUUvWmpXUDI2N2NucEE2NXBtWkg4WmlONHg3di9kc2hqRVJKdjdCcGtT?=
 =?utf-8?B?cmoxZXdiWDZjNlE3ZkJ5aWdwZFZQSVFEN1FYelh1b3g3TFB3VzBxZGNUZWNy?=
 =?utf-8?B?cm1YbzlCTzI5MExTOFRockpKQzFTR0JlSWVYeitjQkNhSnZQTHVLMFhSMVBr?=
 =?utf-8?B?MFZaSkZxN0dGditlNmhsRitPZVMzb1JlNlRPYUhqTDdzdTFXa0U2cklvVnRs?=
 =?utf-8?B?bTZKQjFTc1NTemFydXdUSjMySDBSV09sdlh1L3JwY1pYSis2YkNlQkh0VHpF?=
 =?utf-8?B?ZVYyeXJVYXkrS0wrTTF5bE95Qk0zTXdxTFd1VGlLeUpsTjdPNGdLeHhKMys4?=
 =?utf-8?B?SnNQRnJDWGIzNnlrUndmOEp5ZnkvZUhORzZNbVNGN2M2NTY4aThZVjMyZW9T?=
 =?utf-8?B?NkNoa3dXcDQyZyt5OUJZUFBJcXJvYkVPUHYyTEozdkhpRmd5aFROdk1RNFFM?=
 =?utf-8?B?NHhWK2tIcjFDVnl3dEZYa3ZQSWZyQ3l2VnJIZUFBNHR1WGVGVDNyVHIrRlh0?=
 =?utf-8?B?YVBrMWYybGY0OHlDV1h6SFFFbkxlaGE1eEdMN1hncjFpR3ZJMnBwem5RZFor?=
 =?utf-8?B?a3c5dkg0ZXZXK3hCNVFKUXB5S3c5b0p2bjJ4d2xDRUZCS2x2eDBRQTJBWExw?=
 =?utf-8?B?R25hNy9mTERmK2daMjRZcm56bDZVQStBT003ak5sNi9jZDlhcmRBYUZQUEJO?=
 =?utf-8?B?WlI1aVN5UjhmbnJlSytFOWZWLzRFUXcvZkFDRVg5bWh0MXllZk1MWU9OeVdv?=
 =?utf-8?B?SkpIekU1NzZjMmpaSVF0OWFFb1RhWUc1VGdhY2MySEZwK3duVVI1RldLcUpI?=
 =?utf-8?B?QVdHb01OQ0lLVFRVWldocWtGeHA3eEo5NnNMOERlaHFDbVoxcHBRSjRnU1NY?=
 =?utf-8?B?YTJpS3FNY2VJTllwUFlWalczR21PQlFhT0dTU1ArNHdPY29RcWw4TTlWbkFt?=
 =?utf-8?B?OHcrTmdSUmZuTCtIYnZua3ZlZE9HSHV2NGk4L040VjRZZHRJWm1lVytlL2RF?=
 =?utf-8?B?eUU2b3N1UC96R3ZIMUNoS2Q0WXVaSFRFcU1IOTZVYUJsN2d3MlpwdTYyZWhu?=
 =?utf-8?B?cmNyeWcxTTROeERwSXZ2TFpsRkU2ZmRQNnhFaEVJNHU3aVQrTjl0S1IyMUtQ?=
 =?utf-8?B?Q0hvdFd6SnFoSGI5OUJUK1l5L2JOaHRUbmVwZHRoMk8rS1Z3SGxUVHRCb0lz?=
 =?utf-8?B?Q0FHVytxQUtOQndFR3ViSHN6bmxMVk1QNGRQR3JNdFJoNVIwS2lVd1YrbWsy?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <221FA101A8A34440B86CD74ED8ABCA22@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65be1eef-384d-42d9-2442-08ddb4b27436
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 13:07:50.3108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FShf/aZHNFSFWOjk0EypnMVJMpldsVSwB4v2gT0c8yaD0u9/YA2yA9sElKaTEWjiQhUapVprKzn562K+FY+D4D+52bn2Hulg5Ip+mORtmSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7669

DQpPbiAyNi8wNi8yMDI1IDA5OjEwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjUuMDYuMjAy
NSAyMTo1NiwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiBPbiAyMy8wNi8yMDI1IDEwOjE1
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxOS4wNi4yMDI1IDE4OjE1LCBPbGVrc2lpIE1v
aXNpZWlldiB3cm90ZToNCj4+Pj4gT24gMTgvMDYvMjAyNSAwMzowNCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOg0KPj4+Pj4gT24gVGh1LCAxMiBKdW4gMjAyNSwgT2xla3NpaSBNb2lzaWVpZXYg
d3JvdGU6DQo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5j
IGIveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5jDQo+Pj4+Pj4+PiBpbmRleCBlMTUyMmUxMGUy
Li44ZWZkNTQxYzRmIDEwMDY0NA0KPj4+Pj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2Zpcm13YXJl
L3NjaS5jDQo+Pj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZmlybXdhcmUvc2NpLmMNCj4+Pj4+
Pj4+IEBAIC0xMjYsNiArMTI2LDQzIEBAIGludCBzY2lfYXNzaWduX2R0X2RldmljZShzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldikNCj4+Pj4+Pj4+ICAgICAgICAg
IHJldHVybiAwOw0KPj4+Pj4+Pj4gICAgICB9DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gK2ludCBzY2lf
ZG9fZG9tY3RsKHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0cnVjdCBkb21haW4gKmQsDQo+
Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9t
Y3RsX3QpIHVfZG9tY3RsKQ0KPj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4+ICsgICAgc3RydWN0IGR0X2Rl
dmljZV9ub2RlICpkZXY7DQo+Pj4+Pj4+PiArICAgIGludCByZXQgPSAwOw0KPj4+Pj4+Pj4gKw0K
Pj4+Pj4+Pj4gKyAgICBzd2l0Y2ggKCBkb21jdGwtPmNtZCApDQo+Pj4+Pj4+PiArICAgIHsNCj4+
Pj4+Pj4+ICsgICAgY2FzZSBYRU5fRE9NQ1RMX2Fzc2lnbl9kZXZpY2U6DQo+Pj4+Pj4+PiArICAg
ICAgICByZXQgPSAtRU9QTk9UU1VQUDsNCj4+Pj4+Pj4gQXJlIHlvdSBzdXJlIC1FT1BOT1RTVVBQ
IGlzIHRoZSByaWdodCBlcnJvciBjb2RlIGZvciB0aGUgMyBjaGVja3MgYmVsb3c/DQo+Pj4+Pj4g
VGhlIC1FT1BOT1RTVVBQIGNvZGUgaXMgdXNlZCBiZWNhdXNlIHRoaXMgaXMgcGFydCBvZiBhIGNo
YWluZWQgY2FsbCBhZnRlcg0KPj4+Pj4+IGlvbW11X2RvX2RvbWN0bCwgYXMgc3RhdGVkIGluIHhl
bi9jb21tb24vZG9tY3RsLmM6ODU5LiBUaGUNCj4+Pj4+PiBYRU5fRE9NQ1RMX2Fzc2lnbl9kZXZp
Y2UNCj4+Pj4+PiBjYWxsIGlzIGV4cGVjdGVkIHRvIGhhbmRsZSBhbnkgRFQgZGV2aWNlLCByZWdh
cmRsZXNzIG9mIHdoZXRoZXIgdGhlIERUDQo+Pj4+Pj4gZGV2aWNlIGlzDQo+Pj4+Pj4gcHJvdGVj
dGVkIGJ5IGFuIElPTU1VIG9yIGlmIHRoZSBJT01NVSBpcyBkaXNhYmxlZC4NCj4+Pj4+PiBUaGUg
Zm9sbG93aW5nIGNhc2VzIGFyZSBjb25zaWRlcmVkOg0KPj4+Pj4+DQo+Pj4+Pj4gMS4gSU9NTVUg
UHJvdGVjdGVkIERldmljZSAoU3VjY2VzcykNCj4+Pj4+Pg0KPj4+Pj4+IElmIHRoZSBkZXZpY2Ug
aXMgcHJvdGVjdGVkIGJ5IHRoZSBJT01NVSBhbmQgaW9tbXVfZG9fZG9tY3RsIHJldHVybnMgMCwN
Cj4+Pj4+PiB3ZSBjb250aW51ZQ0KPj4+Pj4+IHByb2Nlc3NpbmcgdGhlIERUIGRldmljZSBieSBj
YWxsaW5nIHNjaV9kb19kb21jdGwuDQo+Pj4+Pj4NCj4+Pj4+PiAyLiBJT01NVSBEaXNhYmxlZCAo
LUVPUE5PVFNVUFAgZnJvbSBpb21tdV9kb19kb21jdGwpDQo+Pj4+Pj4NCj4+Pj4+PiBJZiBpb21t
dV9kb19kb21jdGwgcmV0dXJucyAtRU9QTk9UU1VQUCwgaW5kaWNhdGluZyB0aGF0IHRoZSBJT01N
VSBpcw0KPj4+Pj4+IGRpc2FibGVkLA0KPj4+Pj4+IHdlIHN0aWxsIHByb2NlZWQgdG8gY2FsbCBz
Y2lfZG9fZG9tY3RsLg0KPj4+Pj4gT0sgdGhpcyBtYWtlcyBzZW5zZS4gIEkgdGhpbmsgaXQgaXMg
T0sgdG8gaGF2ZSBhIHNwZWNpYWwgZXJyb3IgY29kZSB0bw0KPj4+Pj4gc2F5ICJ0aGUgSU9NTVUg
aXMgZGlzYWJsZWQiIGJ1dCBJIGRvbid0IGtub3cgaWYgaXQgaXMgYSBnb29kIGlkZWEgdG8gdHJ5
DQo+Pj4+PiB0byB1c2UgLUVPUE5PVFNVUFAgZm9yIHRoYXQuIC1FT1BOT1RTVVBQIGNvdWxkIG1l
YW4gYSBoeXBlcnZpc29yDQo+Pj4+PiBjb25maWd1cmF0aW9uIHdpdGggZG9tY3RsIGRpc2FibGVk
LCBmb3IgaW5zdGFuY2UuDQo+Pj4+Pg0KPj4+Pj4gSXQgbWlnaHQgYmUgd2lzZXIgdG8gdXNlIGEg
ZGlmZmVyZW50IGVycm9yIGNvZGUuIE1heWJlIEVOT0VOVD8NCj4+Pj4+DQo+Pj4+IEkgc2VlIHRo
YXQgaW4gdGhlIGZvbGxvd2luZyBjb21taXQ6DQo+Pj4+DQo+Pj4+IDcxZTYxN2E2YjggKHVzZSBp
c19pb21tdV9lbmFibGVkKCkgd2hlcmUgYXBwcm9wcmlhdGUuLi4sIDIwMTktMDktMTcpDQo+Pj4+
DQo+Pj4+IC1FTk9TWVMgcmV0dXJuIGNvZGUgd2FzIGNoYW5nZWQgdG8gLUVPUE5PVFNVUFAgaW4g
aW9tbXVfZG9fZG9tY3RsLg0KPj4+Pg0KPj4+PiBJdCdzIG5vdCBjbGVhciB0byBtZSB3aHkgdGhp
cyB3YXMgZG9uZSBmcm9tIHRoZSBjb21taXQgZGVzY3JpcHRpb24uDQo+Pj4gVGhpcyBoYXMgYmVl
biBkaXNjdXNzZWQgbWFueSB0aW1lcyBlbHNld2hlcmUuIE1hbnkgb2Ygb3VyIEVOT1NZUyB1c2Vz
IGFyZQ0KPj4+IHNpbXBseSB3cm9uZy4gRU5PU1lTIGhhcyB2ZXJ5IGxpbWl0ZWQgYXBwbGljYWJp
bGl0eTogVW5hdmFpbGFiaWxpdHkgb2YgYQ0KPj4+IHRvcC1sZXZlbCBoeXBlcmNhbGwgKG9yaWdp
bmFsbHk6IHN5c2NhbGwpLg0KPj4+DQo+PiBXaGF0IGlzIHlvdXIgb3BpbmlvbiBhYm91dCBjaGFu
Z2luZyBpdCB0byAtRU5PRU5UIHRvIHNheSAidGhlIElPTU1VIGlzDQo+PiBkaXNhYmxlZCIgYXMg
U3RlZmFubyBzdWdnZXN0ZWQgaW4gWzBdPw0KPj4NCj4+IFswXTogaHR0cHM6Ly9saXN0cy54ZW4u
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDYvbXNnMDEyMzMuaHRtbA0KPiBUbyBt
ZSwgRU5PRU5UIGlzIGNsb3NlciB0byBFTk9ERVYsIGFuZCBoZW5jZSBub3Qgb3Zlcmx5IGFwcGxp
Y2FibGUgaGVyZS4NCj4gSWYgeW91IHdhbnQgdG8gYXZvaWQgRU9QTk9UU1VQUCBmb3Igd2hhdGV2
ZXIgcmVhc29uLCBob3cgYWJvdXQgRU5YSU8gb3INCj4gRUlPPyAoRVBFUk0gbWlnaHQgYWxzbyBi
ZSBhbiBvcHRpb24sIGJ1dCB3ZSBhc3NpZ24gdGhhdCBhIGRpZmZlcmVudA0KPiBtZWFuaW5nIGdl
bmVyYWxseS4pDQo+DQo+IEphbg0KDQpNYXliZSAtRU5PREVWIGlzIGEgYmV0dGVyIGNob2ljZSBi
ZWNhdXNlIGlvbW11X2RvX3BjaV9kb21jdGwgYW5kDQppb21tdV9kb19kdF9kb21jdGwgcmV0dXJu
IHRoaXMNCg0KY29kZSB3aGVuIHNvbWUgZmVhdHVyZSBpcyBub3Qgc3VwcG9ydGVkLg0KDQpJIHRo
aW5rIC1FSU8gb3IgLUVOWElPIGFyZW7igJl0IHN1aXRhYmxlIGhlcmUgc2luY2Ugd2XigJlyZSBw
bGFubmluZyB0byBzZW5kDQp0aGlzIG1lc3NhZ2Ugd2hlbiB0aGUgSU9NTVUgaXMgZGlzYWJsZWQu
DQoNCldoYXQgZG8geW91IHRoaW5rPw0KDQpXQlIsDQoNCk9sZWtzaWkuDQoNCg0K

