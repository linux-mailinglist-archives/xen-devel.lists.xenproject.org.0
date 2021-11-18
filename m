Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E4D455553
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 08:14:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227134.392761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnbc0-0007UN-PH; Thu, 18 Nov 2021 07:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227134.392761; Thu, 18 Nov 2021 07:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnbc0-0007S0-Lm; Thu, 18 Nov 2021 07:13:36 +0000
Received: by outflank-mailman (input) for mailman id 227134;
 Thu, 18 Nov 2021 07:13:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVvB=QF=epam.com=prvs=1956dce401=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mnbbz-0007Ru-5i
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 07:13:35 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09b2e784-483f-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 08:13:33 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AI6XjNr028339;
 Thu, 18 Nov 2021 07:13:29 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cd9rw921g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 07:13:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5699.eurprd03.prod.outlook.com (2603:10a6:208:173::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 07:13:26 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 07:13:26 +0000
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
X-Inumbo-ID: 09b2e784-483f-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5nccRxlHe4Ki6AXFT8O4C1QXZrc4QrjkTc1oOtwE4C4acG09XWwt0bkSNSBy2G7aKKq5fPGYhtkJXF4gXF148pAyjIFzZf/wrVIZYUWcl+l71zFF8Roqz1ocRXpzjGLalsIlCGN1ARfqYC2s7EVJ//CN7tX5Qg02L2ka09FgrMpKYhSYObtzouNnhyPYL/VVim9aC08len9Z8XQqlmqtjdD+qLACh6ebXu6ILizOvIfwps9tmfDWSryMAiLC5046Wm2rZycZJl2+H9wBJ01IDr4z012vApFJ60JRZsg+qu7nfyvbXI+PiTNmBo3XavWCG4dswBLo2BYKHiBtdxYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0gLZ0Oh3Y/Mv2bWc9bEGo1/i2jYCcrUWHkpOJcuC/o=;
 b=hmBRGNDbTmh1q7uTZ2MxIUSzBgZfPn/d24E6Ud2SAtYIzIyytRfQbTaHO8TZvrgrqdKS/a4XRM4HhhPzrbC95D1uSoWWLufh0MD2/E9xHbjWHs6bUxNpHqL+UCbbkTyk5uF3Q+1EW3pgXDUJVe4O87KGEePiP5IB7rGYFsVKgz2Put7Sxaz/QJsSrPTFgPKbgKgPBS5o6JGpW46QuXFt+fioozkVm/C9//CHNj/dgAPDz4jyBgq9ojXm2323g49tBtYk1Gj5PgN+ZZwTWmM8xqSN1LMNDR1Xxek3yrm3YcGy2lejbG7kgEczkC30bjCFquRWKNyp4bKkJKgNsHVyAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0gLZ0Oh3Y/Mv2bWc9bEGo1/i2jYCcrUWHkpOJcuC/o=;
 b=QlHf9o0hcIvdBYTa1MsX6+AbkDjVlDbloRHOAJtNT2koUVgtFsymmx8uQ9qwD8N6dy7K6SPMx/1B+bpM41dysKaJdLKCsNDgLDeb8G1Lfq1L/WAAh1GC4bc5gLIiMjcP9J2dLguv/wwhIWDpLzy84LtwrXkqGgdg2K7zgscUXkLf8BE61orT28i7sUK2jU7H84CXt5CjeZfgmYSbYgEfWKPg1XH1z9luEqgVZTP+11Hci4c5bWf4p0Dk/bUCsyFSJZ52XobG1ETDtMf+QefJknigl0JeYo0JbrcNMx5pinpgfqUjU5YpTIBbkCkZIQ6q8oXtsRb7GnWC/70h5M6cqA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Thread-Topic: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Thread-Index: AQHX0g8QVTbfP59mVU+LM2unTUGOtawGkRQAgADLYgCAAPUEgIAAofWA
Date: Thu, 18 Nov 2021 07:13:26 +0000
Message-ID: <072848c8-54da-cb73-3b8a-0c35826cc812@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-3-andr2000@gmail.com>
 <86cabc8a-cbf2-84d4-4162-7d5591d127c5@xen.org>
 <de155886-d039-4c45-0407-47f38f8cd75d@epam.com>
 <ab95fc39-d1b2-be80-8245-85161a8271e1@xen.org>
In-Reply-To: <ab95fc39-d1b2-be80-8245-85161a8271e1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 832e36fe-3e1d-472c-d833-08d9aa62ea66
x-ms-traffictypediagnostic: AM0PR03MB5699:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5699BFAE6419AB17D158F396E79B9@AM0PR03MB5699.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Md56VFhxg6PT3Bmj76JgOPZr2mBZolFBBH3jQpdJmK2G5xg6lsn5vSGmW6dng44fpG3foXKkKlJFFs1398vefamumoNZ6TX1/wwLUZElcPViPJPhTdsfl+GVp1MCx7DO2wTZE+aOuWvdlXwjP9iVmiFgiTJcqdWPV15MroToN8nRK7UMsmucFZ0XLDET7aj1CXhUGcBt2abpz3Ur50jzNXs/stMmnsXQXFU+nYN3/m3Zw65Z/UQI+BXkEKk2AvCg03V7wrMkNbBn5gXyxd+glxN2GWYv7hjuu9SNOHI3Zl7QUKiFtIsgv5olTUegrhLP66+IohR0uwKSkO9XEvsuUyuPNZQkimHDu1oAVRNrZcPJvQUb3r31L+agaEIH7Eh6jpY6JfGfDccmMNQb9WoXeVPPuI/yETaadPMagCsTvr3oSrtcmY6VKxGmfT+xsFy8v39pVdsAuwENsR2fEVr4ztr7Ko3uPB4Zp1agN2vtSlSgFOQgN3lUCUBBLEWn9IPG6OwajsP0LYERB3pdzuMRDzWbk9ELBJ6atp0AJZLSbF/VzRAeqp06wG544sR5Slz1UanDNZOtqpY8JECPucVdyaPqC0K/1DACiFUVVi0C1QFMVGl/v+9NghI1IPCNwldlUUA4CVbhUSHPyDFM2VZTTCII4P7an0m93Rd8NjgH/JGNnOB1kk0smFFvAzkcVKOiESVCInuYvwCpV5ZwB0puvA5W5xOhK9xeIZJ+K3Jmpdwq/fEcS+8R9nnaLFIGv2V1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(31686004)(83380400001)(38100700002)(71200400001)(54906003)(110136005)(66946007)(76116006)(91956017)(2616005)(316002)(2906002)(122000001)(4326008)(31696002)(66476007)(66556008)(66446008)(64756008)(186003)(5660300002)(7416002)(8676002)(6512007)(107886003)(8936002)(6506007)(38070700005)(86362001)(6486002)(508600001)(53546011)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M2J3ZUhkZnJtRkd1bXdpSU5VYk1IRk5WTHFqb2k5RDZhNVltZW9ncUxGS0I4?=
 =?utf-8?B?SnFxT0hFYVdGYS9hQU1ybERNN01vQWdHR3pmVDFuR0VnUS9oTW05WUdGVzM4?=
 =?utf-8?B?WVB5aFYwdGlJbE1CTGZhTUsxWGlqaC9ubWZ5SUZaYlN5ZDZ1L2x1QkJBWnBQ?=
 =?utf-8?B?Wm1CdndscWRlSUc1cGtSMXJhaXFwN1VzYWxRaGhtSlJxeVBSWnd1WnNWZDVK?=
 =?utf-8?B?aGIrd29QNjlpVkRCRmlWR0FtampNVW4wc2NKNDgySUlCZ1ZVd29TeXRnWlpW?=
 =?utf-8?B?Q3NjQ2VRUEt1enF6dEJwb25aVjMvU3d2NGQzWk80VkVDYzBVemlrdmJRcWxC?=
 =?utf-8?B?dWdSUUJab2ZxYzZwQ1BUWTYrU2drK3lxejdZbVE5czBDa3hmOVZ5UW9BYldl?=
 =?utf-8?B?MzBaQTY2TldKem1RNG9pZHdMVDVta21xbUgwNStlMmNnS1RQZFM2d2pHSGlt?=
 =?utf-8?B?RGxqc2tPODBIVThRTmhhbGlyMG93ZHhoOXBKa0xIa0xzWWU0R1NuZUlVOG1y?=
 =?utf-8?B?TlRCYVFpR0I3TE1oVTBqMnpnMUsrKzgxRUFVQXZUMFpiQVpNWjlTTWhGTzBZ?=
 =?utf-8?B?aFNBbjZIV1ZaYVZlNWpuTGt6dlFrMTVRdCtPQXBRU0VDVnBqM2xtQStZY3Jr?=
 =?utf-8?B?VVYzdkFsRTVLdmtqNDhPa1JTbkpZTGlsMmJpYS9WbEFnb2lpNDNjd21MbTJn?=
 =?utf-8?B?TzVqWFpTK3MwUVdyUlBTTS9sa2JCbGMxbkpEYzRLaERseExMMTIrWHFKeGJ0?=
 =?utf-8?B?ZHZwaUhJbFg1Sk96eFNTMTZsM1JPVmtDTThiTGlYSDFpZ1NYNDhndURkMWIr?=
 =?utf-8?B?TmQ0aDFTa2ZYZXVobHY0ejljSngxbXZCdHE1Z0IyWFNsYlNndFFWS2JmdnYw?=
 =?utf-8?B?QlVZUVA1QUFKWFZvSG5sTTJIOTRZb3RZbFRaVHFwNS9EdURmLzl1SDFrUjlm?=
 =?utf-8?B?OHJ1TGJ4UW5OdCtmcHJqbGdBTmV5VW5xT3k2NjJweTJnbklxRTZvSVMyRTl0?=
 =?utf-8?B?enZVTVcrZ1V4cFFKeE1wK2d2SXp0NUNDKzlDRzFPM1BZTzVSSXlWdm91cEd2?=
 =?utf-8?B?OUVEeWdEbGJ3bExRQXI5YUVvOGZnbnZGTmRqODJTT3EvVXpOeS9Ic0JDVy9M?=
 =?utf-8?B?MlVJRVoxTDh2UUo4Zm1yeWdLN0pEbTZqMkhjTkdqcFN5UHNtalVtK05ScEVt?=
 =?utf-8?B?NGNDdkJiR3VFdnVTSjB2R3E5L3c0NDlXRjhRMHJwL0pPZUg3RUFTKzhLRGxy?=
 =?utf-8?B?Wld4bDBSUUI0eFpCdDZxa2hFdmZWMEZZVnZsU2M0YnJNVi9rUGRoNEgxQ3J1?=
 =?utf-8?B?eURoWVliOWJXSkVtVFJ5aG1yaDhNMlNEMmY3WEZlSVA2TytaaXZoOERTS3Jy?=
 =?utf-8?B?d0E4SG8rMXUwVm1CY1RKeTVxOFYrc25NZGZtNnc2S2l1SFg5NGRYeFNDeHE0?=
 =?utf-8?B?a3AzaGdIVmE3eC8xcE1oQ1BtSGZDS3ZtaWF4V0JOWU1vcXpBT3k3UDdVK1RL?=
 =?utf-8?B?cUVBaVg1aUI2NDdSejBzQTFSRDgrZG1zL1lESFN2TENHQW1VWDZMRUI2bW01?=
 =?utf-8?B?NzZ4cFRwMXJzdE40QkFlTFVrdzFOb2VmYTFpbDNGdUlQVjcyUUhQc1h6NmpP?=
 =?utf-8?B?RG44TVFJRk1tc3dtRHFVTTEwaFNOalJMUzdVYkd0eVFJL0lnUVViVFY5ZDlO?=
 =?utf-8?B?R2REWGtaSTlCcm1DZHl6ZGgreHpaSVVZVUZ0T1J1dW40TkRobGJSQlF3L2hQ?=
 =?utf-8?B?NTJYRjR3aWlxdy9rdmpiUnRuREJtaWdBVEJvUmNVUnBNTDFPdHVWRjRXdFJZ?=
 =?utf-8?B?NGZYSWl6djFYc20yOWpTdy9OZjRqbWZUUlk4UXFJZjhCQk1tbXJtMGJOVThU?=
 =?utf-8?B?NU9ZYmw1d0pnQy81eFF3bFc0UHVQc21XcTFxRU1xRUJuSGR1M0FlSHV1ekdZ?=
 =?utf-8?B?YlIza2FhNnBEL21wekRvb2MyUlplWm8zWUE3Q3M2YzhIdi9Kc0ZjWWJVRnFK?=
 =?utf-8?B?a3Z3ZUI1Q0VNa3lPQitYNndrK0p6cDVUditmdUR4WGVVbnpKQi9PMVhVTExC?=
 =?utf-8?B?WWJGZDRtRGt5dVZHUjdmelYwSytvL2tIdXNaK0ZYbFJRcGM4MkxPL3FIT2tu?=
 =?utf-8?B?QWZOMVdPUUMwblFEcHJ6WVYvYTVwa2NhTTlhaFpOYk8wbU5qZkdZeklVQk1F?=
 =?utf-8?B?bE1ITkJ3TWVjOTRyOGFyMUgzQk44emppNHRHUTQ4TGhKZ2RNY3VzU2JPV3Zi?=
 =?utf-8?B?TWhnK3lWK29YdStDaXNjbWRsbnVFekk2eXdHeTBkeURLcE5pQzZJNWlwZmRF?=
 =?utf-8?B?TjJFQWk0ZWZ0QWgvWURNNTVyNzgzdnVSdElBYm9ValhnR29RRlVmQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8192FCFB8F4384419C569E9929687706@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 832e36fe-3e1d-472c-d833-08d9aa62ea66
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 07:13:26.4536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nclKanBW2Bb+xQVG3rB2sRW94xZeROKw2lVCNutTQk+EGFMy8OMYtHNkIhqjxrB43qND5ge3O0sLiPFtVeWq9YNSG0teWilq+fp3Z9RJFpojRY90TKJZ/1TQ3or0VF22
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5699
X-Proofpoint-GUID: nGFisaquNEGvOq5872Igubh5SNf_tO2a
X-Proofpoint-ORIG-GUID: nGFisaquNEGvOq5872Igubh5SNf_tO2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_02,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180042

SGksIEp1bGllbiENCg0KT24gMTcuMTEuMjEgMjM6MzMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAxNy8xMS8yMDIxIDA2OjU2LCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+IEhpLCBKdWxpZW4hDQo+Pg0KPj4gT24gMTYuMTEuMjEgMjA6NDgs
IEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBPbGVrc2FuZGVyLA0KPj4+DQo+Pj4gT24gMDUv
MTEvMjAyMSAwNjozMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEZyb206
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4NCj4+Pj4NCj4+Pj4gSWYgYSBQQ0kgaG9zdCBicmlkZ2UgZGV2aWNlIGlzIHByZXNlbnQgaW4g
dGhlIGRldmljZSB0cmVlLCBidXQgaXMNCj4+Pj4gZGlzYWJsZWQsIHRoZW4gaXRzIFBDSSBob3N0
IGJyaWRnZSBkcml2ZXIgd2FzIG5vdCBpbnN0YW50aWF0ZWQuDQo+Pj4+IFRoaXMgcmVzdWx0cyBp
biB0aGUgZmFpbHVyZSBvZiB0aGUgcGNpX2dldF9ob3N0X2JyaWRnZV9zZWdtZW50KCkNCj4+Pj4g
YW5kIHRoZSBmb2xsb3dpbmcgcGFuaWMgZHVyaW5nIFhlbiBzdGFydDoNCj4+Pj4NCj4+Pj4gKFhF
TikgRGV2aWNlIHRyZWUgZ2VuZXJhdGlvbiBmYWlsZWQgKC0yMikuDQo+Pj4+IChYRU4pDQo+Pj4+
IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4+Pj4gKFhF
TikgUGFuaWMgb24gQ1BVIDA6DQo+Pj4+IChYRU4pIENvdWxkIG5vdCBzZXQgdXAgRE9NMCBndWVz
dCBPUw0KPj4+PiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
DQo+Pj4+DQo+Pj4+IEZpeCB0aGlzIGJ5IGFkZGluZyAibGludXgscGNpLWRvbWFpbiIgcHJvcGVy
dHkgZm9yIGFsbCBkZXZpY2UgdHJlZSBub2Rlcw0KPj4+PiB3aGljaCBoYXZlICJwY2kiIGRldmlj
ZSB0eXBlLCBzbyB3ZSBrbm93IHdoaWNoIHNlZ21lbnRzIHdpbGwgYmUgdXNlZCBieQ0KPj4+PiB0
aGUgZ3Vlc3QgZm9yIHdoaWNoIGJyaWRnZXMuDQo+Pj4+DQo+Pj4+IEZpeGVzOiA0Y2ZhYjQ0MjVk
MzkgKCJ4ZW4vYXJtOiBBZGQgbGludXgscGNpLWRvbWFpbiBwcm9wZXJ0eSBmb3IgaHdkb20gaWYg
bm90IGF2YWlsYWJsZS4iKQ0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+DQo+Pj4+
IC0tLQ0KPj4+PiBOZXcgaW4gdjYNCj4+Pj4gLS0tDQo+Pj4+IMKgwqAgeGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jwqDCoMKgwqDCoMKgwqAgfCAxNSArKysrKysrKysrKysrKy0NCj4+Pj4gwqDC
oCB4ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jIHzCoCAyICstDQo+Pj4+IMKgwqAg
eGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOCArKysrKysr
Kw0KPj4+PiDCoMKgIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
YyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+PiBpbmRleCA0OTFmNWUyYzMxNmUu
LmY3ZmNiMTQwMGMxOSAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+PiBAQCAtNzUz
LDkgKzc1MywyMiBAQCBzdGF0aWMgaW50IF9faW5pdCB3cml0ZV9wcm9wZXJ0aWVzKHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50MTZfdCBzZWdt
ZW50Ow0KPj4+PiDCoMKgICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qDQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKiBUaGUgbm9kZSBkb2Vzbid0IGhhdmUgImxpbnV4LHBjaS1kb21h
aW4iIHByb3BlcnR5IGFuZCBpdCBpcw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICog
cG9zc2libGUgdGhhdDoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqwqAgLSBYZW4g
b25seSBoYXMgZHJpdmVycyBmb3IgYSBwYXJ0IG9mIHRoZSBob3N0IGJyaWRnZXMNCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqwqAgLSBzb21lIGhvc3QgYnJpZGdlcyBhcmUgZGlzYWJs
ZWQNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIE1ha2Ugc3VyZSB3ZSBpbnNlcnQg
dGhlIGNvcnJlY3QgImxpbnV4LHBjaS1kb21haW4iIHByb3BlcnR5DQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBpbiBhbnkgY2FzZSwgc28gd2Uga25vdyB3aGljaCBzZWdtZW50cyB3
aWxsIGJlIHVzZWQNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGJ5IExpbnV4IGZv
ciB3aGljaCBicmlkZ2VzLg0KPj4+DQo+Pj4gVGhlIGNoZWNrIGFib3ZlIHdpbGwgY2hlY2sgdGhl
IG5vZGUgdHlwZSBpcyAicGNpIi4gQUZBSUNULCB0aGlzIHdvdWxkIGFsc28gY292ZXIgUENJIGRl
dmljZXMuIEkgYW0gbm90IGF3YXJlIG9mIGFueSBpc3N1ZSB0byBhZGQgImxpbnV4LHBjaS1kb21h
aW4iIGZvciB0aGVtLiBIb3dldmVyLCB0aGlzIGZlZWxzIGEgYml0IG9kZC4NCj4+Pg0KPj4+IMKg
RnJvbSBteSB1bmRlcnN0YW5kaW5nLCBhIFBDSSBkZXZpY2Ugd291bGQgYWx3YXlzIGJlIGRlc2Ny
aWJlZCBhcyBhIGNoaWxkIG9mIHRoZSBob3N0YnJpZGdlcy4gU28gSSB3b3VsZCByZXdvcmsgdGhl
ICdpZicgdG8gYWxzbyBjaGVjayBpZiB0aGUgcGFyZW50IHR5cGUgaXMgbm90ICJwY2kiLg0KPj4+
DQo+PiBXZSBtYXkgaGF2ZSAiYnJpZGdlIC0+IGJyaWRnZSAtPiBkZXZpY2UiIHRvcG9sb2d5IGFz
IHdlbGwuDQo+DQo+IERvIHlvdSBoYXZlIGFuIGV4YW1wbGUgb2YgRGV2aWNlLVRyZWU/DQpObywg
SSBkb24ndCBoYXZlIGF0IGhhbmQsIGJ1dCBJIGNhbiBpbWFnaW5lIHRoaXMgY2FuIHJlbGF0aXZl
bHkgZWFzeSBiZSBkb25lIHdpdGggUUVNVQ0KRXZlbiBpZiBub3QsIGRvIHlvdSBhc3N1bWUgdGhp
cyB0b3BvbG9neSBjYW4gbmV2ZXIgaGFwcGVuPw0KPg0KPj4gU28sIEkgcHJlZmVyIHRvIGhhdmUg
dGhlIGNoZWNrIGFzIGl0IGlzLg0KPg0KPiBJIGRvbid0IHJlYWxseSBsaWtlIHRoZSBpZGVhIHRv
IHNwdXJpb3VzbHkgYWRkICJsaW51eCxwY2ktZG9tYWluIiB0byBQQ0kgRFQgbm9kZS4gQnV0IGlm
IHRoZXJlIGFyZSBubyBvdGhlciBzb2x1dGlvbiwgdGhlbiB0aGlzIHNob3VsZCBhdCBsZWFzdCBi
ZSBtZW50aW9ubmVkIGluIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgY29kZS4NCkkgYW0gZmluZSB3
aXRoIGFueSBzb2x1dGlvbiBoZXJlLCBJIGp1c3Qgd2FudCB0aGF0IHRvIGJlIGRlZmluZWQgYW5k
IGltcGxlbWVudGVkLg0KUGxlYXNlIGxldCBtZSBrbm93IHRoZSBmaW5hbCBkZWNpc2lvbiBvbiB0
aGlzIGFuZCBob3cgd2UgcHJvY2VlZA0KPg0KPiBbLi4uXQ0KPg0KPj4gWWVzLCB0aGlzIHNvdW5k
cyByZWFzb25hYmxlLCBJIHdpbGwgYWRkIHRoaXMgY2hhbmdlIGFuZCBwcmludCBhbiBlcnJvciBt
ZXNzYWdlIHNvIGl0IGlzDQo+PiBlYXNpZXIgdG8gdW5kZXJzdGFuZCB3aGF0IFhlbiBkb2Vzbid0
IGxpa2UgKGl0IHRvb2sgbWUgYSB3aGlsZSB0byBkZWJ1ZyBhbmQgdW5kZXJzdGFuZA0KPj4gd2h5
IEkgaGF2ZSAiKFhFTikgRGV2aWNlIHRyZWUgZ2VuZXJhdGlvbiBmYWlsZWQgKC0yMikuIikNCj4N
Cj4NCj4gU291bmRzIGdvb2QgdG8gbWUuIFRoZSBjdXJyZW50IGVycm9yIGlzIGluZGVlZCBjb25m
dXNpbmcuDQo+DQo+IENoZWVycywNCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

