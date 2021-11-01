Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A2B4413A7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 07:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219011.379635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhQap-0003pa-Dv; Mon, 01 Nov 2021 06:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219011.379635; Mon, 01 Nov 2021 06:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhQap-0003nb-Aj; Mon, 01 Nov 2021 06:14:51 +0000
Received: by outflank-mailman (input) for mailman id 219011;
 Mon, 01 Nov 2021 06:14:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WR8P=PU=epam.com=prvs=1939429689=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mhQao-0003nV-2f
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 06:14:50 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4c15c79-1759-43cb-accc-c3add88c2a0e;
 Mon, 01 Nov 2021 06:14:47 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A168DAq014414;
 Mon, 1 Nov 2021 06:14:44 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c27xjg9h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Nov 2021 06:14:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3428.eurprd03.prod.outlook.com (2603:10a6:208:c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 06:14:40 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 06:14:40 +0000
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
X-Inumbo-ID: c4c15c79-1759-43cb-accc-c3add88c2a0e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A30cz1jj1TfcueWMehkVq237mu9dxWzZUwhEICwcHVVaTNb5rC/ZNEZFRbsetXJGxFVIBbFeLa5KrmqOwLrb4nEcHborJntQETtAoTVD6+F2wcj2Jx2XcOv+hgtZCm6Qy7O539/MZaYTY1tRAFTbtEEn+MjtHJVwIMwhQvKl9sGpja8WJQw39feU7t0TBjKpPbjp0xl228NFt6D7UrM/mCNQvrpNCqxkPqbq7vnoLXbh6ZbbEbehjVx1RLuKlRFJIgTNlluya3WeCwZF8PrjNFjsSWhyxgDQ0YivHfoFOF9VN2Pwg4cAuxevHv8fkLebU36nNMmF4OwehBOAxO9Klw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTo0dn/L7115InFcQ0kFyrNCkRVFf15R/vqYUP3GAA8=;
 b=kKpGoWpvC7BF3HgqyXKVEGG5Iz0M3m6DuU/aEgMRVvvUGlWTCI/sFv/LqJb4x2ZM+W1nE94b31AKoWJHuxBIpzl4lQvCcBS5wFewJUVf2KADnZ4SiWE0Js8olPTr/iYu8isSCJqA6XVyRSOysNALanwPh30HxNcYcsn2VgoWyZF+AMNyoZfOxUOpXq8AauYEkbFfHKyov24GrDQQ5WMVoAhKEiwIgE8RnkNal/BUnvn9FpBuzzevBaIIIrzEiB/SS5jRkWlc3Bg87WTHDwXSRJQZE+rhghwHC1LM2l1L0kTCylY4NFbaSCXgbDiooMNXK3/dIKwR6U3lNJ76goBwPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTo0dn/L7115InFcQ0kFyrNCkRVFf15R/vqYUP3GAA8=;
 b=gtiu3tXDxEq0QCus4kWW6/ruHgFExLEXRvJ7buksWcuPGzeBScqdkTAfrtGFKjFheDlenTNBujcXxl3Qo+isKJ8gPXbB1w4Tz+OfiRNXfI04PRjNbPE9axkxoUHlb962eH8GX8EnqMUs+wO+a7Uil5O7hdb+d5dX/Dgn5TG5E6ORKssJObYV3ZxIzF7gzMSQUsK4aQnBu8rPq3qsj6JV//F152J0foxnHiilo4Kx2jv1LzjnquvW1swF2Qhd8U+8uiOLPy50XZUVRzgqk5pfiorWdjzfIQFshQR5aOUDGyjx6D5BblLlntBJ25lxgoEqaLL4UFedeEqG4IUjyW0QVw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Topic: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Index: 
 AQHXyww6rKHs3LJru0q52eLUia+oNavnHBIAgAE3H4CAABhAgIAADTsAgAAb4gCAAB9PgIAA5K+AgASg3IA=
Date: Mon, 1 Nov 2021 06:14:40 +0000
Message-ID: <0ba7aa82-40bc-c0d3-38a2-8c4d141d0afd@epam.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <YXqnS7iZUvokJby6@Air-de-Roger>
 <3206478e-f230-cd91-5de9-85ef6c251405@epam.com>
 <YXrJyLMiMxaNmFAs@Air-de-Roger>
 <5de6c2f1-ef5c-9d8c-4287-9b0e3ff08b34@epam.com>
 <YXuj4frtHIRuSgOO@Air-de-Roger>
In-Reply-To: <YXuj4frtHIRuSgOO@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0473b673-2bbf-460f-e936-08d99cfee3e3
x-ms-traffictypediagnostic: AM0PR0302MB3428:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR0302MB34285D72E9A2F316B4CAFDABE78A9@AM0PR0302MB3428.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wZDy3dh+5NZtCVIA0yy+1nL/uhG1wE6iWqnrarXBVMt2hkDsfdgEpPdZmnFX1OIyfOJi036ClCmFSY9GbnJVX+3nxpHxs3Qf+86B2B8OsFdB0VWWGBVfzGLOsgGeQpiby5KfbAoTzRNIl/QKyxotM8ys2LLpwjL8vwBiWDY95/vl1E195W19LbCQmMaJ7i3OV3Tl3S6cefK7GWjUImtTDuufgHGJQfDp26nHh45SmWawAG6sIduw/mrDkRZ0dnDcLheFFKNlS8awXTAZTnt78JExUPxvDIAHHiEmm7pq4GDlqz6/opW0PGtcWbgNl5bqyERcNmoz/4AKsmaCc9WKF/i57P0rSBTOeLEbx28Ff6Z1ETEcp/gypeHjT/4b9wEqhQMr23c9AUkvXFsyLg5FoFPADQMvIhUv1rLf4+CDzB7w5v2ZTSEcnsCsw3jEpgJpqAf6DfHZqU7Lo2lRQiz9zb0FmugH/+EittYUv2J5u2anD/c71EjI70P4kYIPPBp1TRHV1Zz7GmPVYqF6ttFZfPob1HBI7090WC5kvi/FzzKxZ9X1CX3ZGUmEgXsG/up/erGT1PBEAryLz6DVdk0NnffpzJWi/YbBKj9b4QvzKtDPrJ8qTa9C1ro1c/Ix78Ga2rTLaMWWQ28bAMIhR/bCPIqW2zsaMyISQEKcrqiknb6QgBZ+8ja5t5dTv4WE2+BjvItAs6ahtIt4s4Se9uWkzT3wLCK5kiR5MrH0I9OhSBwQsWbSxJlxAOFn011BTdp5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(26005)(83380400001)(8936002)(2616005)(71200400001)(31686004)(186003)(54906003)(6486002)(5660300002)(38070700005)(36756003)(86362001)(6916009)(2906002)(107886003)(316002)(6512007)(508600001)(53546011)(8676002)(31696002)(6506007)(122000001)(91956017)(76116006)(66476007)(66556008)(64756008)(66446008)(66946007)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZkVkOTFMY2YyZlU1cHpqNjlxR2laWkRkUk0rbldqRnZpRzAvSmlrSHcyOVNQ?=
 =?utf-8?B?RGsvbEhvdldHWVZMVGsrbmcvUGc2M0pPd3JYV2JuZURkVndnYXNSWGFTZFpT?=
 =?utf-8?B?TGpvVStYSFV4Uy91R2N6am9sYmpSUDJUdnZaN0ZzRThiKzdkaGh4dE5PRG1k?=
 =?utf-8?B?QTZDcFVUcFRzT3hOWnozb1BLRlNsUk5CSlBiMkE2WGtLRS9KOXczbEJtL3Na?=
 =?utf-8?B?YXphdWZ0dEVwQ2dJZWNNem1ROW56aFAzU3h2YW9pdENITnRybFZJcERjb1Fk?=
 =?utf-8?B?VWlzeFlaMkI2bjNXUm84VFVWS2xiV01JeUNIWWEvQWxpTGY3MWN1SEVKYVIw?=
 =?utf-8?B?QjZIVWRNaXZXYmx3LzhxaUd0bE95UkNuNFBOL09FRGtpcmNQYXZuckN3d1B5?=
 =?utf-8?B?SjFzcnNlUEg1eFVlQlF4ZFRJVVhkdkswS3diMDBYQzBEQ0VSWVAyd0F5ZEZp?=
 =?utf-8?B?V3hZZjJ1K2pIeGw2NVcyTFN6Ty9SSW9vZjB6Vy9XblRpWVpOdG90T2xaMUtp?=
 =?utf-8?B?VTh4R0ZsTzkxZXc2VSs4YWRwd0xtenVTOUJjbFBvY2FwVUhMbDdaRWxqSEZB?=
 =?utf-8?B?QnZrK2pZRmRFUjVlWDQ0Vk5UM2NvM2ZCazZydk45cit1NThmckJqM3pXeDZl?=
 =?utf-8?B?MEIwYnovdTdqWkJJNndsSkZ2MFNGRFYrcVh6YTVRTkRscUNqeGwxSi8vUmt3?=
 =?utf-8?B?dG42R1JLN0Z6ZTA2anNJb1pFdVFPVTZaWkhiOXhhNGRrYmk0eDZzYVBXRFBL?=
 =?utf-8?B?VEhDdG90dG45TFljM2VQNDlwbktzRWdzdVVrWEpnNXpWODdYa3owd0FpbU5V?=
 =?utf-8?B?MXduS1A5WWFoc21lalkwMVk0NE51WlU1QXh4NDVWR1dOckdqeGdmY3hPaldF?=
 =?utf-8?B?VnpIRTNhZEg4VVRXdGdhd3ErTTdUNWc4eEN6ekg2NXIraWUvL01Sa3l4eXlS?=
 =?utf-8?B?aVBQVW8xYU5BYWVFK21TckhHWHIrVElya0xCaVlYUGxzYThDOWNDWG8xTHFJ?=
 =?utf-8?B?K3hKVDlTTFc5RElZUzN4WndjbER5amtUVjA1WGxjQVEyUXRCUjZkTGNwQm1y?=
 =?utf-8?B?aCtlcnUxVEJMRjdLQzBWMEliQmx5TDdlN1Zlb21oUTBsdnA0ZjFUdEM4ZWQr?=
 =?utf-8?B?UXFXckl0UWxvWGRRV3g2Q3RUblFERmhDQ0M2WVJ0NEFtaTcvdFVMR0g1ZC9G?=
 =?utf-8?B?ekZlN0YxNkh1K2tsY3hHNVhLVWJKNlVYTFltQW13d2ltSXZCZEhlSWNJb1JT?=
 =?utf-8?B?K0RPSlNPaEs0S1NFM24ybUFGdW5VNVVOUkFsYi9IeG1vVlRjRU1lNDdXbWdq?=
 =?utf-8?B?Z2g2MlhBMWhkOVNMRTR0djlvTHNUOVprUmRvZDMrN1RVeW44UlZHRU9BZ1I2?=
 =?utf-8?B?MEZQVFlRc1g3L0xvVloya1hGS2d5bDdOTGJneDUrMHVHeWRwLytSS0I3WFJF?=
 =?utf-8?B?NlFJOXBkNW9hUzN5ZGhOd09EbGFnWmw0RmVOVGphWmgvT1d0ZzVid1dqNUNV?=
 =?utf-8?B?Tkg1LzJ5eUM4bG8yajh6RGU4L0JXNGk2NEdTUEtIU1lWNXNUbTgzSVMrV1Vs?=
 =?utf-8?B?Q21Ha1ZHUkp6WkwvWjJtUCtLd2thYjdwc2kvWE1XWHdYZVZndEo4VXhTaDBH?=
 =?utf-8?B?b01ZTU45eCt1VXloWDdacUJnYUViMFMya0V2dmFJU1N6TkxwYm9MazMyK3l2?=
 =?utf-8?B?Yk4wSW9IS3RaWkJ6cndaTW83K09sdVA1emdYZnVkRGRoWEFzTmdaeVllc1NU?=
 =?utf-8?B?MTBmTU9VY1dQdWxmNlUzK2Q3dmRRcHQ2dVJ5bWdUanhIY2VEZUFtTWtRMHgy?=
 =?utf-8?B?NWE0NW9JTHp3ZHhpeDM1UW5zUjZkUHZzRGhPVGxuMVVublVtd0dyMUhUVXlX?=
 =?utf-8?B?Q3p2Y3loVFBsd2Z0b1VZTkFkQmx4RFBHSGx1cGJ5S0l6K3pxb1ZtaWVOWS9p?=
 =?utf-8?B?bUlWMUdiT1llMTRsN2lBR0RrUGxUVGxwWWE4ZWVqOU9XbDQ1UFJrVWUrazg5?=
 =?utf-8?B?TEpyemk5bkFXVmxtSEx4ZGZpcmgzMWhJcXUzdU9abDU3WkhIM0FVaGVGMzAw?=
 =?utf-8?B?dXNyMVRMOFZxVmVBbEpleEJpV0JJUzlYVW5FQ09HenR6TW83Vys2RnRaaVV4?=
 =?utf-8?B?SytuV0NXM3ovWWkyajRwQzlZOTNlMmwzVjJIWXk1N0ZCV3hNNGZKRVZCa2Q3?=
 =?utf-8?B?WGZkWTFOM2JzVzFZazZPSEFjc3E2SHU4cUxjNDY3RHZ4TVFwRFBUZ2k4dUFW?=
 =?utf-8?B?UnRHcDYzTzJyUVdvbGVtWHNkbkhxU1lIMHhjSlpPVlJYdkJkOVc0M1RCMjQx?=
 =?utf-8?B?QmFlT3FPbVhLakVROTZTWXlEeDBYajhyb3RFK0dyNHdZenhqV0M0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6474B68C2E81D6449C590E928BD447EC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0473b673-2bbf-460f-e936-08d99cfee3e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2021 06:14:40.7411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whoJWRm8+gTsf2wYZdRIOtJdfFmN6masHj6vFRsFRpHkJyZswZECvN5PyGM0USodmHPgncC4UtVvTjfF2X/OZUt/CNnNRLlVHdrAOnq4RM6xbsnsQsxwxIRWdRNNoo03
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3428
X-Proofpoint-GUID: oZ5wf37GzZdscMuqwdwU4RcPHfEfvTtC
X-Proofpoint-ORIG-GUID: oZ5wf37GzZdscMuqwdwU4RcPHfEfvTtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-01_02,2021-10-29_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111010036

DQoNCk9uIDI5LjEwLjIxIDEwOjMzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUaHUs
IE9jdCAyOCwgMjAyMSBhdCAwNTo1NToyNVBNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAyOC4xMC4yMSAxOTowMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBUaHUsIE9jdCAyOCwgMjAyMSBhdCAwMjoyMzozNFBNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMjguMTAuMjEgMTY6MzYsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBPbiBUaHUsIE9jdCAyOCwgMjAyMSBhdCAxMjowOToyM1BN
ICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBIaSwgSnVsaWVu
IQ0KPj4+Pj4+DQo+Pj4+Pj4gT24gMjcuMTAuMjEgMjA6MzUsIEp1bGllbiBHcmFsbCB3cm90ZToN
Cj4+Pj4+Pj4gSGkgT2xla3NhbmRyLA0KPj4+Pj4+Pg0KPj4+Pj4+PiBPbiAyNy8xMC8yMDIxIDA5
OjI1LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+Pj4+IEZyb206IE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+
Pj4+Pj4+DQo+Pj4+Pj4+PiBXaGlsZSBpbiB2UENJIE1NSU8gdHJhcCBoYW5kbGVycyBmb3IgdGhl
IGd1ZXN0IFBDSSBob3N0IGJyaWRnZSBpdCBpcyBub3QNCj4+Pj4+Pj4+IGVub3VnaCBmb3IgU0JE
RiB0cmFuc2xhdGlvbiB0byBzaW1wbHkgY2FsbCBWUENJX0VDQU1fQkRGKGluZm8tPmdwYSkgYXMN
Cj4+Pj4+Pj4+IHRoZSBiYXNlIGFkZHJlc3MgbWF5IG5vdCBiZSBhbGlnbmVkIGluIHRoZSB3YXkg
dGhhdCB0aGUgdHJhbnNsYXRpb24NCj4+Pj4+Pj4+IGFsd2F5cyB3b3JrLiBJZiBub3QgYWRqdXN0
ZWQgd2l0aCByZXNwZWN0IHRvIHRoZSBiYXNlIGFkZHJlc3MgaXQgbWF5IG5vdCBiZQ0KPj4+Pj4+
Pj4gYWJsZSB0byBwcm9wZXJseSBjb252ZXJ0IFNCREYgYW5kIGNyYXNoZXM6DQo+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4gKFhFTikgdnBjaV9tbWlvX3JlYWQgMDAwMDo2NToxYS4wIHJlZyA4YmMgZ3BhIGU2
NWQwOGJjDQo+Pj4+Pj4+IEkgY2FuJ3QgZmluZCBhIHByaW50aygpIHRoYXQgbWF5IG91dHB1dCB0
aGlzIG1lc3NhZ2UuIFdoZXJlIGRvZXMgdGhpcyBjb21lcyBmcm9tPw0KPj4+Pj4+IFRoYXQgd2Fz
IGEgZGVidWcgcHJpbnQuIEkgc2hvdWxkbid0IGhhdmUgdXNlZCB0aGF0IGluIHRoZSBwYXRjaCBk
ZXNjcmlwdGlvbiwgYnV0DQo+Pj4+Pj4gcHJvYmFibHkgYWZ0ZXIgIi0tLSIgdG8gYmV0dGVyIGV4
cGxhaW4gd2hhdCdzIGhhcHBlbmluZw0KPj4+Pj4+PiBBbnl3YXksIElJVUMgdGhlIGd1ZXN0IHBo
eXNpY2FsIGFkZHJlc3MgaXMgMHhlNjVkMDhiYyB3aGljaCwgaWYgSSBhbSBub3QgbWlzdGFrZW4s
IGRvZXNuJ3QgYmVsb25nIHRvIHRoZSByYW5nZSBhZHZlcnRpc2VkIGZvciBHVUVTVF9WUENJX0VD
QU0uDQo+Pj4+Pj4gVGhpcyBpcyBmcm9tIGRvbTAgSSBhbSB3b3JraW5nIG9uIG5vdy4NCj4+Pj4+
Pj4gSU1ITywgdGhlIHN0YWNrIHRyYWNlIHNob3VsZCBjb21lIGZyb20gdXNwdHJlYW0gWGVuIG9y
IG5lZWQgc29tZSBpbmZvcm1hdGlvbiB0byBleHBsYWluIGhvdyB0aGlzIHdhcyByZXByb2R1Y2Vk
Lg0KPj4+Pj4+Pg0KPj4+Pj4+Pj4gKFhFTikgRGF0YSBBYm9ydCBUcmFwLiBTeW5kcm9tZT0weDYN
Cj4+Pj4+Pj4+IChYRU4pIFdhbGtpbmcgSHlwZXJ2aXNvciBWQSAweDQ2N2EyOGJjIG9uIENQVTAg
dmlhIFRUQlIgMHgwMDAwMDAwMDQ4MWQ1MDAwDQo+Pj4+Pj4+IEkgY2FuIHVuZGVyc3RuYWQgdGhh
dCBpZiB3ZSBkb24ndCBzdWJzdHJhY3QgR1VFU1RfVlBDSV9FQ0FNLCB3ZSB3b3VsZCAoaW4gdGhl
b3J5KSBub3QgZ2V0IHRoZSBjb3JyZWN0IEJERi4gQnV0Li4uIEkgZG9uJ3QgdW5kZXJzdGFuZCBo
b3cgdGhpcyB3b3VsZCByZXN1bHQgdG8gYSBkYXRhIGFib3J0IGluIHRoZSBoeXBlcnZpc29yLg0K
Pj4+Pj4+Pg0KPj4+Pj4+PiBJbiBmYWN0LCBJIHRoaW5rIHRoZSB2UENJIGNvZGUgc2hvdWxkIGJl
IHJlc2lsaWVudCBlbm91Z2ggdG8gbm90IGNyYXNoIGlmIHdlIHBhc3MgdGhlIHdyb25nIEJERi4N
Cj4+Pj4+PiBXZWxsLCB0aGVyZSBpcyBubyAoPykgZWFzeSB3YXkgdG8gdmFsaWRhdGUgU0JERi4g
QW5kIHRoaXMgY291bGQgYmUgYSBwcm9ibGVtIGlmIHdlIGhhdmUgYSBtaXNiZWhhdmluZw0KPj4+
Pj4+IGd1ZXN0IHdoaWNoIG1heSBmb3JjZSBYZW4gdG8gYWNjZXNzIHRoZSBtZW1vcnkgYmV5b25k
IHRoYXQgb2YgUENJIGhvc3QgYnJpZGdlDQo+Pj4+PiBIb3cgY291bGQgdGhhdCBiZT8gVGhlIEVD
QU0gcmVnaW9uIGV4cG9zZWQgdG8gdGhlIGd1ZXN0IHlvdSBzaG91bGQgYmUNCj4+Pj4+IHRoZSBz
YW1lIGFzIHRoZSBwaHlzaWNhbCBvbmUgZm9yIGRvbTA/DQo+Pj4+IE9rLCBJIGhhdmUgYSBEZXNp
Z253YXJlIFBDSSBoaXN0IHdoaWNoIGhhcyAyIEVDQU0gcmVnaW9ucyAoSSBhbSBzdGFydGluZyB0
bw0KPj4+PiBpbXBsZW1lbnQgdGhlIGRyaXZlciBmb3IgaXQsIHNvIEkgY2FuIGJlIHdyb25nIGhl
cmUpOg0KPj4+PiAtIFJvb3QgQ29tcGxleCBFQ0FNIGFyZWEgKCJkYmkiKSwgaXQgaXMgc29tZXRo
aW5nIGxpa2UgMHgzMDAwIGJ5dGVzIGxvbmcNCj4+Pj4gLSAiQ2xpZW50IiBFQ0FNIGFyZWEgKCJj
b25maWciKQ0KPj4+PiBTbyBmcm9tIERvbTAgUE9WIHdlIGhhdmUgMiBFQ0FNIHJlZ2lvbnMgYW5k
IGZvciB0aGUgZ3Vlc3QNCj4+Pj4gd2UgYWx3YXlzIGVtdWxhdGUgYSBzaW5nbGUgYmlnIHJlZ2lv
bjoNCj4+PiBZb3UgbmVlZCBzdXBwb3J0IGZvciBtdWx0aXBsZSBFQ0FNIHJlZ2lvbnMuIFRoYXQn
cyBob3cgd2UgZG8gaXQgb24geDg2DQo+Pj4gUFZIIGRvbTAuIFNlZSByZWdpc3Rlcl92cGNpX21t
Y2ZnX2hhbmRsZXIgYW5kIHJlbGF0ZWQgbWFjaGluZXJ5Lg0KPj4gSXMgaXQgY29tbW9uIGZvciBh
IFBDSSBob3N0IGJyaWRnZSB0byBoYXZlIG11bHRpcGxlIEVDQU0gcmVnaW9ucz8NCj4+IEN1cnJl
bnRseSBvbiBBcm0gd2Ugd2VyZSBhYm91dCB0byBzdXBwb3J0ICJwY2ktaG9zdC1lY2FtLWdlbmVy
aWMiIFsxXSwNCj4+IGUuZy4gZ2VuZXJpYyBFQ0FNIGhvc3QgYnJpZGdlIHdoaWNoIG5vcm1hbGx5
ICg/KSBoYXMgYSBzaW5nbGUgRUNBTQ0KPj4gcmVnaW9uIFsyXS4gQnV0IHRoZSBob3N0IGJyaWRn
ZSBJIHdhbnQgdG8gc3VwcG9ydCBoYXMgbXVsdGlwbGUsIHNvDQo+PiBzdHJpY3RseSBzcGVha2lu
ZyBpdCBpcyBub3QgdGhlIG9uZSB0aGF0IHdlIGltcGxlbWVudC4NCj4gSXQncyBwb3NzaWJsZSBv
biB4ODYgdG8gaGF2ZSBtdWx0aXBsZSBFQ0FNIHJlZ2lvbnMsIHdoZXRoZXIgdGhhdCBtZWFucw0K
PiBtdWx0aXBsZSBob3N0IGJyaWRnZXMsIG9yIGhvc3QgYnJpZGdlcyBoYXZpbmcgbXVsdGlwbGUg
RUNBTSByZWdpb25zIGlzDQo+IHVua25vd24gdG8gbWUuIEl0J3MgYWxsIHJlcG9ydGVkIGluIHRo
ZSBNQ0ZHIEFDUEkgdGFibGUgKHNlZSBQQ0kNCj4gRmlybXdhcmUgZG9jdW1lbnQgZm9yIHRoZSBk
ZXRhaWxlZCBkZXNjcmlwdGlvbiBvZiBNQ0ZHKSB1c2luZyB0aGUNCj4gIkNvbmZpZ3VyYXRpb24g
U3BhY2UgQmFzZSBBZGRyZXNzIEFsbG9jYXRpb24gU3RydWN0dXJlIiwgYW5kIHRoZXJlIGNhbg0K
PiBiZSBtdWx0aXBsZSBvZiB0aG9zZSBzdHJ1Y3R1cmVzLg0KQXMgd2UgYXJlIGN1cnJlbnRseSBz
dXBwb3J0aW5nIGdlbmVyaWMgRUNBTSBob3N0IGJyaWRnZSB3aGljaA0KaGFzIGEgc2luZ2xlIEVD
QU0gcmVnaW9uIEkgdGhpbmsgdGhlIGV4aXN0aW5nIGNvZGUgd2UgaGF2ZSBhbmQNCmFib3V0IHRv
IHVwc3RyZWFtIGlzIG9rIGFzIGlzIGZvciBub3cuDQpJIG93biBhIGJyaWRnZSB3aGljaCBoYXMg
MiBFQ0FNIHJlZ2lvbnMsIHNvIEkgd2lsbCB3b3JrIHRvd2FyZHMNCmFkZGluZyBpdHMgc3VwcG9y
dCBzb29uLg0KPg0KPj4gQXJtIGZvbGtzLCBkbyB3ZSB3YW50IHRoaXMgZ2VuZXJhbGl6YXRpb24g
YXQgdGhpcyBtb21lbnQgdG8gYWxpZ24gd2l0aCB4ODYNCj4+IHdpdGggdGhpcyByZXNwZWN0Pw0K
Pj4NCj4+IFdlIGNhbiBsaXZlIHdpdGggdGhlIGN1cnJlbnQgYXBwcm9hY2ggYW5kIHdoZW4gSSBo
YXZlIG15IGRyaXZlciBpbXBsZW1lbnRlZA0KPj4gSSBjYW4gc2VuZCBwYXRjaGVzIHRvIG1ha2Ug
dGhhdCBnZW5lcmFsaXphdGlvbi4NCj4+Pj4gLyoNCj4+Pj4gICAgwqAqIDI1NiBNQiBpcyByZXNl
cnZlZCBmb3IgVlBDSSBjb25maWd1cmF0aW9uIHNwYWNlIGJhc2VkIG9uIGNhbGN1bGF0aW9uDQo+
Pj4+ICAgIMKgKiAyNTYgYnVzZXMgeCAzMiBkZXZpY2VzIHggOCBmdW5jdGlvbnMgeCA0IEtCID0g
MjU2IE1CDQo+Pj4+ICAgIMKgKi8NCj4+Pj4gI2RlZmluZSBHVUVTVF9WUENJX0VDQU1fQkFTRcKg
wqDCoCB4ZW5fbWtfdWxsb25nKDB4MTAwMDAwMDApDQo+Pj4+ICNkZWZpbmUgR1VFU1RfVlBDSV9F
Q0FNX1NJWkXCoMKgwqAgeGVuX21rX3VsbG9uZygweDEwMDAwMDAwKQ0KPj4+Pg0KPj4+PiBTbywg
d2UgaGF2ZSB0aGUgYmFzZSBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZSBlbXVsYXRlZCBFQ0FNIHNw
YWNlDQo+Pj4+IG5vdCBjb25uZWN0ZWQgdG8gdGhlIHJlYWwgaG9zdCBicmlkZ2UNCj4+Pj4+IEFu
ZCBmb3IgZG9tVXMgeW91IHJlYWxseSBuZWVkIHRvIGZpeCB2cGNpX3tyZWFkLHdyaXRlfSB0byBu
b3QNCj4+Pj4+IHBhc3N0aHJvdWdoIGFjY2Vzc2VzIG5vdCBleHBsaWNpdGx5IGhhbmRsZWQuDQo+
Pj4+IERvIHlvdSBtZWFuIHRoYXQgd2UgbmVlZCB0byB2YWxpZGF0ZSBTQkRGcyB0aGVyZT8NCj4+
Pj4gVGhpcyBjYW4gYmUgdHJpY2t5IGlmIHdlIGhhdmUgYSB1c2UtY2FzZSB3aGVuIGEgUENJIGRl
dmljZSBiZWluZw0KPj4+PiBwYXNzZWQgdGhyb3VnaCBpZiBub3QgcHV0IGF0IDAwMDA6MDA6MC4w
LCBidXQgcmVxdWVzdGVkIHRvIGJlLCBmb3INCj4+Pj4gZXhhbXBsZSwgMDAwMDowZDowLjAuIFNv
LCB3ZSBuZWVkIHRvIGdvIG92ZXIgdGhlIGxpc3Qgb2YgdmlydHVhbA0KPj4+PiBkZXZpY2VzIGFu
ZCBzZWUgaWYgU0JERiB0aGUgZ3Vlc3QgaXMgdHJ5aW5nIHRvIGFjY2VzcyBpcyBhIHZhbGlkIFNC
REYuDQo+Pj4+IElzIHRoaXMgd2hhdCB5b3UgbWVhbj8NCj4+PiBObywgeW91IG5lZWQgdG8gcHJl
dmVudCBhY2Nlc3NlcyB0byByZWdpc3RlcnMgbm90IGV4cGxpY2l0bHkgaGFuZGxlZA0KPj4+IGJ5
IHZwY2kuIEllOiBkbyBub3QgZm9yd2FyZCB1bmhhbmRsZWQgYWNjZXNzZXMgdG8NCj4+PiB2cGNp
X3tyZWFkLHdyaWV9X2h3KS4NCj4+IEkgc2VlLCBzbyB0aG9zZSB3aGljaCBoYXZlIG5vIGhhbmRs
ZXJzIGFyZSBub3QgcGFzc2VkIHRvIHRoZSBoYXJkd2FyZS4NCj4+IEkgbmVlZCB0byBzZWUgaG93
IHRvIGRvIHRoYXQNCj4gSW5kZWVkLiBXaXRob3V0IGZpeGluZyB0aGF0IHBhc3N0aHJvdWdoIHRv
IGRvbVVzIGlzIGNvbXBsZXRlbHkgdW5zYWZlLA0KPiBhcyB5b3UgYWxsb3cgZG9tVXMgZnVsbCBh
Y2Nlc3MgdG8gcmVnaXN0ZXJzIG5vdCBleHBsaWNpdGx5IGhhbmRsZWQgYnkNCj4gY3VycmVudCB2
UENJIGNvZGUuDQpXZWxsLCBteSB1bmRlcnN0YW5kaW5nIGlzOiB3ZSBjYW4gbGV0IHRoZSBndWVz
dCBhY2Nlc3Mgd2hhdGV2ZXINCnJlZ2lzdGVycyBpdCB3YW50cyB3aXRoIHRoZSBmb2xsb3dpbmcg
ZXhjZXB0aW9uczoNCi0gInNwZWNpYWwiIHJlZ2lzdGVycyB3ZSBhbHJlYWR5IHRyYXAgaW4gdlBD
SSwgZS5nLiBjb21tYW5kLCBCQVJzDQotIHdlIG11c3Qgbm90IGxldCB0aGUgZ3Vlc3QgZ28gb3V0
IG9mIHRoZSBjb25maWd1cmF0aW9uIHNwYWNlIG9mIGENCnNwZWNpZmljIFBDSSBkZXZpY2UsIGUu
Zy4gcHJldmVudCBpdCBmcm9tIGFjY2Vzc2luZyBjb25maWd1cmF0aW9uDQpzcGFjZXMgb2Ygb3Ro
ZXIgZGV2aWNlcy4NClRoZSByZXN0IGFjY2Vzc2VzIHNlZW0gdG8gYmUgb2sgdG8gbWUgYXMgd2Ug
ZG8gbm90IHJlYWxseSB3YW50Og0KLSBoYXZlIGhhbmRsZXJzIGFuZCBlbXVsYXRlIGFsbCBwb3Nz
aWJsZSByZWdpc3RlcnMNCi0gd2UgZG8gbm90IHdhbnQgdGhlIGd1ZXN0IHRvIGZhaWwgaWYgaXQg
YWNjZXNzZXMgYSB2YWxpZCByZWdpc3RlciB3aGljaA0Kd2UgZG8gbm90IGVtdWxhdGUuDQo+DQo+
IFJlZ2FyZHMsIFJvZ2VyLg0KPg0KVGhhbmtzLA0KT2xla3NhbmRy

