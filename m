Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C59C442FEB
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 15:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220271.381464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuUp-00032H-Fg; Tue, 02 Nov 2021 14:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220271.381464; Tue, 02 Nov 2021 14:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuUp-0002zT-Cc; Tue, 02 Nov 2021 14:10:39 +0000
Received: by outflank-mailman (input) for mailman id 220271;
 Tue, 02 Nov 2021 14:10:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XNU=PV=epam.com=prvs=19406420d3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mhuUn-0002zN-HX
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 14:10:37 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6946077c-ba7b-4c3d-9517-4837e79b78cf;
 Tue, 02 Nov 2021 14:10:36 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2E8naX022210;
 Tue, 2 Nov 2021 14:10:29 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c36ua0084-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 14:10:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6785.eurprd03.prod.outlook.com (2603:10a6:20b:2d4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 14:10:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 14:10:24 +0000
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
X-Inumbo-ID: 6946077c-ba7b-4c3d-9517-4837e79b78cf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLvoRsgayFjWveWlf2Ri6u3rT6A0woHryP/B1gkmbHLA2fXqCwN69hhOdkJDEVucD3w4zV67R1zNXNND5XFVlUA9DqZskFv4beidGv7zKpFI0slwKm+BbQ6+oOYWRXp6a2mKreZ9eHyCJrtcojB4EpM+moSvU4722P8JZD9Ge7l2NpZkl7vHbd0TC65RZwertpGKHa/XKvArAdyyfuh997UCVlYG9A4GhVgwLkC5lUee4Kef3O6wjE2PiuABc3EdE0zpo9ElwYnjQvcU8B08XEXHKTZBTvFk3bazxU9vE6uBebRl3zetH93fJDAU75LqTKlEIyDuALshNBTowDFcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXVVfRUVIe3AEfm6BKwbiddAkI/UN6/DqRNxSZDBYUQ=;
 b=EY4OyKeV3h4jVmguLDziIICRVXvpo6Ssfq6gi7jgTPDnM28mPY9JMzsvaZSXPY0+++YPDMVQHBB0BAGl6E1YrSmbV6uOhghZqor4hUHa+bovnrIpJ5UqXQhd/RX9qnyHqMrHsQybBsLBkCr5BuezQ909zAZdI+Ykmiysk19ANnY8ghGi0AiakIYeXQ2rNFWQNC6CZ8sqgzvXYerITDSzn5KxxdmNlRh7nVFhkUy7zHEBELLCcAaKtUPossx/zSanOsQ7LfUfA1OcjkMQV489vSRimCEES3NKzyNq7YGe+rm2ZWfS/NtktOcXNBgSgKX3KxgVF8j6kitpB0iS0QcIxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXVVfRUVIe3AEfm6BKwbiddAkI/UN6/DqRNxSZDBYUQ=;
 b=DNvbpiRqmEcE3DbhuEilnBz4JhEdngmCalCrXEmP9fMfI6vLIGS89LEtKtAVZGMc1FPqpoSOlDpwGILQ2p3vce6JDlS52YhdM9S0VhWEG4gGPXx30JJwV9Kc/BMICBE5Z/ylaXuY0Yhm+yu6JyqT2e70vBAJEIBMzyk9ITmXwZe++8gK+ZGEcT46KK8uTFcuF7UFHQfbA2EtHSBPeCUzdoAtHvP3rGt9eXd4ECuYNDDfRziIBK1zuCeKWnVh5ZgxKjsQKE0tkJcq3uJDeHqFfGRl0pFT8yAy4kDK3si/YcR7XxhJ6WaLDTLpELoa7TUVUwH/LNSyy8iJmsfFdFxLUg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Michal Orzel <michal.orzel@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Index: AQHXtdAkq8Qmwxr3HUWTio8KWsEpvKvlQ6KAgAsHq4CAAAimAIAAIt2AgAAEUIA=
Date: Tue, 2 Nov 2021 14:10:24 +0000
Message-ID: <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
 <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
In-Reply-To: <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4472b6b1-cd9b-4569-1f00-08d99e0a8375
x-ms-traffictypediagnostic: AM9PR03MB6785:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB6785871F6AB576A297E0739EE78B9@AM9PR03MB6785.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gIIuQZxX8UXYrJHMBzyhJVsKnLlvdOzS8z66JfCgJBFZPmtgeEYR3ULOpxnxYu2tiIVtENY6uuUi8AeWGYVcHDa46wKUFxX3ff/U8bNNhINFGK7adMTp4reWW81/FpAIfV27MQubRDzXdOZ61FGbMMHjs0rxwkEfzk/yeBEXfPWlow2gJ03ZSvP4JQf5RBAUEcl5dJoSKP9pLpo3XyQsaroYHKHqhK+j20vGCjBIv88AH5OafN0ubzKJdyqetAgg2yiF/9GmsG7t+hUPgJSZ5BGztEpO7vuOqgw0L4XLcVbQsgTbkahjF25UjYsE5h71PqwgsR1w0nFbDShegvCDuPpewcD0Gw5+6NEXG56BJf60k15pqKwaOG2XgnsfWwhDDCdhwDn63o+bhnSE8GjEF6HExpO3/8ilbyGmR8y0roTk1TBgTZ9GXsBfPFq98hRbWcNAQdYGqDAVRFPl7lk0FNxn9j9Mx1TmG2SQ4H/hj7iHmi3OZS4E2mT89PGHMcnQ9Pj7wZ49fJ2IyFXrh5o9bsmDou+PuL7WecRA9pvQ9YotpqLuRo/skU5/gZrA5b7/nyY6HmBKUKZdSMmi72Kz/8KEhbFP2cLZaDUqA7FFpzfeocWFwgWS/AEkKRpjor0Ja2jXpY7W7L+wuH2WxvPULg34+3YIrB60AUd1siUG/+edZ9tMUK+pytuMBT3XgSQvZ6SY6esRFiEJENwl/EdYei7GLM+yMK9e/fvWDrH237M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(66946007)(76116006)(31696002)(53546011)(6512007)(91956017)(64756008)(66446008)(6486002)(110136005)(38100700002)(86362001)(66476007)(2906002)(6506007)(66556008)(54906003)(2616005)(36756003)(122000001)(83380400001)(8936002)(508600001)(186003)(5660300002)(38070700005)(107886003)(8676002)(4326008)(31686004)(71200400001)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aC9VanhSaCs5bTYvVVMwVWxDL1d5dFdHRHlPZmZ0azJBOWYvWE1TK3RDT3Q1?=
 =?utf-8?B?VzlZS0ZmYUNpd3krNVExd2lPVUF5UEdjQ1pvbVVtd1JUWkVYQmNGZTFJQnE5?=
 =?utf-8?B?djJNZlNucm5kSDJhU0hYMVhJaU82RjBMZXh5dnNFU1RqaVdQWjkvRTg4N2xH?=
 =?utf-8?B?T3lBaUI2UjlLbXNNUVNNa2dzaEpiRC9YRjFwdDF5YVdOaW1uc3I5b0dnanpp?=
 =?utf-8?B?QjNTMzFPTkw4Q0pKN2xOdnZxR05MSzgrMUZraFQ1UEtkYjBvM3YzcEl0STla?=
 =?utf-8?B?alNnNmEyYVJvUkRNYVJKVS82ZGtvWk5mZXRvZU9CWEZKdzJibUo2bkVlbnpC?=
 =?utf-8?B?aW5wMUIzTFVUMGVSNHZJd2N5c2greGtnWksyTGdCVEl5M2piMmdjek1TSTgr?=
 =?utf-8?B?anVxdTZ5TkZVNXd3cFFjS3JhYkdsUElRQWlVSjVXQk5ONmhSdHlDTW9ETWFz?=
 =?utf-8?B?Tms1M1B0TkJOZGVLdXhsNmYvNTUwZ3FMdE9oK1BJdktsM3E5eGhId3pkaXk3?=
 =?utf-8?B?ZWRqUmUvVDYvSEJ4bm5xTExTbVJHWlE1NDRPUU5IVGhYTUtzUHUwS0JTdTFF?=
 =?utf-8?B?T2Q4VFQ4TnJUTEl4MjVZcDRYM2h2NmZCMHhKWVpEVzRsWkpDOUJTZ0E5TTJY?=
 =?utf-8?B?TVYvZVV3aVBSSHJjL1hlcThXNXF3alloYjFlZFVCeVlHLzl5ZGY4QnI1U21F?=
 =?utf-8?B?eVhkWExHc2xpZW1tZ0w0T2pkbXhaakhSd2JlNHNkU0lxTEhWd0plOU9TbVZv?=
 =?utf-8?B?ZDRKelg1Q2VrYnI4NTV1clNFV3JteWZ6Mjk5eWhlVkNJbmk0U2o5ZEZhUzh3?=
 =?utf-8?B?T09BZDNRNlZpc0xEejM4TkFXcEkvMUFFZzR5ck1wQTdqQUZXWXFHQ1V3VVI1?=
 =?utf-8?B?LzlhS3N3WWYvR0NLV2kzRlltR3JFU0FDV2Z3cmE0bnVmejFESEs2WG52S25W?=
 =?utf-8?B?b2IrQi9jMDg3d1FBbGMyNDA3L0xCODF1YVY4Zjl2em5kVEp4NmF6WXdRZkNK?=
 =?utf-8?B?VjFDTklTOWZYSlVFeVhCTk12TkpuQmt6cHBPb3A2ako2WEJSaXVEUGxDRGJN?=
 =?utf-8?B?cTR0WHlDbGdvc0ZZMGU1VFNJbC8rRStWN1A2R0FBWUJWQWJzNnNHV3pyTVZE?=
 =?utf-8?B?bG9EWkQ5UGp2dUhwd0J3STcvaHMvMUZDOFRZVDg0YWtndmxhSk9SNzVuSXNq?=
 =?utf-8?B?RGdjNzRNN2ZKVktaWWhSWjZRbGVMUS9mNmFUUFJMemkyRlhObEpjYWhoemZp?=
 =?utf-8?B?MHk4MlBMcTRlb3BVa3lzWm03YktSZ1d4MnRkY0xCVExqV25HVWNrUEdMRnRv?=
 =?utf-8?B?UjBud2pXQ0MvYU5acU1PdE1UMHNJV1BpVzZUN1dacytCRDhUUnhwNi84ZVlz?=
 =?utf-8?B?aEtpR2FCV0ZXamE0ZU1uaUhVcFVGdnl6SllkWXRsWEZ6MjJRejFhWFJRQk1Q?=
 =?utf-8?B?d3g1R2c1M0UxWExNWXZ4WStKUUhrUFRqZVp0N29SNzJ3WnpBVURRYnhYWVpx?=
 =?utf-8?B?TXRuczcyM3A0MXVyMVZ6WWxVVDBkQS9ZeXRtSDhnUFpJRGRNb3BOeWZmd1A0?=
 =?utf-8?B?d3JTSmdkSStGNWcrdTZGUy9mS0EvaFZVdFV4bnZySmloRWZNckh3TFloU0lt?=
 =?utf-8?B?WWRVdU1kSFhxaDBPNTdjQjdWTm51VTJkUkhrMUZ6K1MwTmVGbEo1UjVtWlBn?=
 =?utf-8?B?NmVCY25KbTBRQ0lvUXB4VjVlczFiRmlkdW5ZZk5xQ0pFWExLejdadUV5UlBL?=
 =?utf-8?B?SHhzRjhKODA1MWk0SGx5a3BBcUNLbkdzV20xUDBFY2c5QjVFaWk5ZXRtRmpF?=
 =?utf-8?B?blJBS2JQOGpsOGNMdFh2UDFRdDJEU09HOTBYNnYrR1dRdWdvQ3lHYmVHWklN?=
 =?utf-8?B?aVFySFQwcldMdDJxem9MNlhzczVxWmVmVGlkeTBuVnBaekE4dkFpZE9TOEp4?=
 =?utf-8?B?UzJlanZYN204SVlaelRHb0ZrdDZMV1oraTR0WFBJU3ZhbUdoMVMrM3ptYkIw?=
 =?utf-8?B?V1c1d3ZkckdMZ1pNa0hVV2FOT2V0elFEK0E5VzZySzlXaEZ2aFNZdDE0aDZl?=
 =?utf-8?B?MkJFdU5MMmtBNTF5VzM2d04wTXljM1FZcmdRZS9xcHE1eWpJbkFWYTkxYWhT?=
 =?utf-8?B?T1NBZ2pHWDlQMkVqSXpvblNMQTRheTU4U25jU0VXbm9wcWwvMC9CNnJVTXND?=
 =?utf-8?B?dXVnS3BsVmE5VHdhUFVHWHArMXMwd2VhVWFKYnd5WGdhdW1DeVhQTVk0eU1O?=
 =?utf-8?B?YUcyc3RKYkNXTXdHOG9TOXVvTDZBeFNaeTM3NlRJcDVPRjAxTlVnS0VVWjFW?=
 =?utf-8?B?bjlJdVZVRFRyaXlnNFI0ejZGQWI5eUJkeFB5a2NhbFRzVVlRdmt3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA20B9AEE09BEC45BDA0242B4EF49C10@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4472b6b1-cd9b-4569-1f00-08d99e0a8375
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 14:10:24.0634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iMMhcGP0Z1rTmQCCWx3NPJNoFPwyah1WkUkkN0R+Cpxj7rJXNLur4kfrY5jvz3HM33fv1DGOCNtPO2q7IXhLv4A0HYMHQz9ne4kWqRuje0p8xXmIxQCAd9eq3xHXjgGe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6785
X-Proofpoint-ORIG-GUID: Fv_5WTlgpIl2HbdXH-65XzNKK3nfwFxM
X-Proofpoint-GUID: Fv_5WTlgpIl2HbdXH-65XzNKK3nfwFxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=772
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020084

DQoNCk9uIDAyLjExLjIxIDE1OjU0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDIuMTEuMjAy
MSAxMjo1MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIFR1ZSwgTm92IDAyLCAyMDIx
IGF0IDEyOjE5OjEzUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI2LjEwLjIw
MjEgMTI6NTIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+IE9uIFRodSwgU2VwIDMwLCAy
MDIxIGF0IDEwOjUyOjIwQU0gKzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0K
Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4gKysrIGIveGVuL2Ry
aXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4gQEAgLTQ1MSw2ICs0NTEsMzIgQEAgc3RhdGljIHZv
aWQgY21kX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVn
LA0KPj4+Pj4gICAgICAgICAgIHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2JkZiwgcmVnLCBjbWQp
Ow0KPj4+Pj4gICB9DQo+Pj4+PiAgIA0KPj4+Pj4gK3N0YXRpYyB2b2lkIGd1ZXN0X2NtZF93cml0
ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgY21kLCB2b2lkICpkYXRhKQ0KPj4+
Pj4gK3sNCj4+Pj4+ICsgICAgLyogVE9ETzogQWRkIHByb3BlciBlbXVsYXRpb24gZm9yIGFsbCBi
aXRzIG9mIHRoZSBjb21tYW5kIHJlZ2lzdGVyLiAqLw0KPj4+Pj4gKw0KPj4+Pj4gKyAgICBpZiAo
IChjbWQgJiBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUpID09IDAgKQ0KPj4+Pj4gKyAgICB7DQo+
Pj4+PiArICAgICAgICAvKg0KPj4+Pj4gKyAgICAgICAgICogR3Vlc3Qgd2FudHMgdG8gZW5hYmxl
IElOVHguIEl0IGNhbid0IGJlIGVuYWJsZWQgaWY6DQo+Pj4+PiArICAgICAgICAgKiAgLSBob3N0
IGhhcyBJTlR4IGRpc2FibGVkDQo+Pj4+PiArICAgICAgICAgKiAgLSBNU0kvTVNJLVggZW5hYmxl
ZA0KPj4+Pj4gKyAgICAgICAgICovDQo+Pj4+PiArICAgICAgICBpZiAoIHBkZXYtPnZwY2ktPm1z
aS0+ZW5hYmxlZCApDQo+Pj4+PiArICAgICAgICAgICAgY21kIHw9IFBDSV9DT01NQU5EX0lOVFhf
RElTQUJMRTsNCj4+Pj4+ICsgICAgICAgIGVsc2UNCj4+Pj4+ICsgICAgICAgIHsNCj4+Pj4+ICsg
ICAgICAgICAgICB1aW50MTZfdCBjdXJyZW50X2NtZCA9IHBjaV9jb25mX3JlYWQxNihwZGV2LT5z
YmRmLCByZWcpOw0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAgICAgICAgIGlmICggY3VycmVudF9jbWQg
JiBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUgKQ0KPj4+Pj4gKyAgICAgICAgICAgICAgICBjbWQg
fD0gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFOw0KPj4+Pj4gKyAgICAgICAgfQ0KPj4+PiBUaGlz
IGxhc3QgcGFydCBzaG91bGQgYmUgQXJtIHNwZWNpZmljLiBPbiBvdGhlciBhcmNoaXRlY3R1cmVz
IHdlDQo+Pj4+IGxpa2VseSB3YW50IHRoZSBndWVzdCB0byBtb2RpZnkgSU5UeCBkaXNhYmxlIGlu
IG9yZGVyIHRvIHNlbGVjdCB0aGUNCj4+Pj4gaW50ZXJydXB0IGRlbGl2ZXJ5IG1vZGUgZm9yIHRo
ZSBkZXZpY2UuDQo+Pj4gV2UgY2Fubm90IGFsbG93IGEgZ3Vlc3QgdG8gY2xlYXIgdGhlIGJpdCB3
aGVuIGl0IGhhcyBNU0kgLyBNU0ktWA0KPj4+IGVuYWJsZWQgLSBvbmx5IG9uZSBvZiB0aGUgdGhy
ZWUgaXMgc3VwcG9zZWQgdG8gYmUgYWN0aXZlIGF0IGEgdGltZS4NCj4+PiAoSU9XIHNpbWlsYXJs
eSB3ZSBjYW5ub3QgYWxsb3cgYSBndWVzdCB0byBlbmFibGUgTVNJIC8gTVNJLVggd2hlbg0KPj4+
IHRoZSBiaXQgaXMgY2xlYXIuKQ0KPj4gU3VyZSwgYnV0IHRoaXMgY29kZSBpcyBtYWtpbmcgdGhl
IGJpdCBzdGlja3ksIGJ5IG5vdCBhbGxvd2luZw0KPj4gSU5UWF9ESVNBQkxFIHRvIGJlIGNsZWFy
ZWQgb25jZSBzZXQuIFdlIGRvIG5vdCB3YW50IHRoYXQgYmVoYXZpb3Igb24NCj4+IHg4NiwgYXMg
YSBndWVzdCBjYW4gZGVjaWRlIHRvIHVzZSBNU0kgb3IgSU5UeC4gVGhlIGVsc2UgYnJhbmNoIG5l
ZWRzDQo+PiB0byBiZSBBcm0gb25seS4NCj4gSXNuJ3QgdGhlICJlbHNlIiBwYXJ0IHF1ZXN0aW9u
YWJsZSBldmVuIG9uIEFybT8NCkl0IGlzLiBPbmNlIGZpeGVkIEkgY2FuJ3Qgc2VlIGFueXRoaW5n
IEFybSBzcGVjaWZpYyBoZXJlDQo+DQo+IEphbg0KPg0K

