Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF6743CB8D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 16:07:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217001.376824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfjZp-00052U-Np; Wed, 27 Oct 2021 14:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217001.376824; Wed, 27 Oct 2021 14:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfjZp-0004zr-Ka; Wed, 27 Oct 2021 14:06:49 +0000
Received: by outflank-mailman (input) for mailman id 217001;
 Wed, 27 Oct 2021 14:06:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lYk=PP=epam.com=prvs=0934bd4bd6=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mfjZn-0004zl-U0
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 14:06:48 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6ee6fce-ca17-47ef-9f01-74032ae8a223;
 Wed, 27 Oct 2021 14:06:46 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RBScdw022557; 
 Wed, 27 Oct 2021 14:06:44 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 3by2x9swv2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 14:06:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4020.eurprd03.prod.outlook.com (2603:10a6:208:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 27 Oct
 2021 14:06:40 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 14:06:40 +0000
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
X-Inumbo-ID: e6ee6fce-ca17-47ef-9f01-74032ae8a223
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V284zms6pkYFrlk9bq5tO1xaMTfkajPASJxk7LD4QKQ9iRKxu+ZOVAGZ4SqqVONsYSo3QZw1l0RFFFR2seMJmAaUHwhgd07h3+alV7BJjDTqAKZ6o7e9EaS4X60A1NrzXmpORh9JNHfW94On/GPKI6FeVun7tXTUHiQQdyZTMSvlkBs9A1LuPyJO5zG9gad6K89ca87HnsV3+P2NT7IcGHH4EPV+U2+unR/90EM9U5WhfFs7/w3210+RKYYmHmIbtZQcgwzEqNog/AEYy4KdSGkdhHSVrBd7AsHvXlgySNKILOz9cKqm+CX9XqYeSJYv6rP/L1OAzO78lgbYKsxbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DI778T0dFEeWmm1k3GfkJmWyAYvd0gsLkVcNoLsTGS4=;
 b=ZNO6xt0sw4faeOsRl2x2Txctj/zbMJ+r8sMs0lXs91JDZCm6RLt8cHASlRstPw79y9TbwzTchErIu4ciEp1erepr3rnTdXJVXPLwyApnreZQ4QK3RtFFKvbQiVCPpQMqybwmhiVWqFk8xUbN8/MKAcjZ40G1TeWpah+itlrsSVmttWjCcbBkPhIOckAV8OxPxrfleELlIj6jhm2xn1bQLa1/61fkbhvYxwXVHASOS2ybZIGQmsGhI+8qWnaI4h+eGbN7QAnI3UKqlmbUdpOLF+6Tg5pkg1W6pM1fe+1BKvIKE9T2AvxZBwUNI7TmbhS5461HWq2n3ZiFBrMR/Iya/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DI778T0dFEeWmm1k3GfkJmWyAYvd0gsLkVcNoLsTGS4=;
 b=rgxhzbzEvyTNFNEDMZm5DYIAgEVjSuyny0PLlx+k80yrYsAoVeoO45/2Kfzy+ixAVEQo9piIbYVA0VaamdWDAwbYbeo/BfpMR1zUHVNHYahFS0e5Qp2ap2h74phRR0vDLpH0XqDz5zvxWgFQ8XHKr/D2/APg1CBKXV88lbfbgNc1sanmmgAPxmUnOjXBNhNYSI4cYGuBFE+WJ46NqNc/Oh7qSAl7kWchG4GE/OrPLIm6HXE+gdCU/WVFH7uIqMRA9FZLHP+mhBTfRbemLqbM2z0kVZX0FF/tRPO7fQYB84pB0ApX0nm2SZ52OFI9FuUq9axkW5s1hiUwY7CKHC1UqQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Move register assignments from
 init_bars
Thread-Topic: [PATCH v3 03/11] vpci/header: Move register assignments from
 init_bars
Thread-Index: AQHXtdAhPfrDnvz+/U+T4IKIC1fCcavRBz+AgBXEsICAABy1AIAAF4OAgAAL8YA=
Date: Wed, 27 Oct 2021 14:06:40 +0000
Message-ID: <368bf4b5-f9fd-76a6-294e-dbb93a18e73f@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-4-andr2000@gmail.com>
 <YWbkZ216FbV8lBns@MacBook-Air-de-Roger.local>
 <89e1f09e-c840-860e-e596-38fb141aa707@epam.com>
 <344cf880-8f76-1a71-d27c-e7ba10459d5b@epam.com>
 <YXlS68Ghrphi5dHB@Air-de-Roger>
In-Reply-To: <YXlS68Ghrphi5dHB@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14e0102e-6fa6-40ff-9a06-08d99952ff8d
x-ms-traffictypediagnostic: AM0PR03MB4020:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4020C0010626509DF53BAE34E7859@AM0PR03MB4020.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tPxr4yJYNKlP0Hsm+Bl2TQMyRRCCKa88tsmvw0zV0VmyR5dRrADKFQO/vWmJ+ooa/9DwcPxBBU9bWKqnSiv5K2DjWdz2EXHbvxFTGdibyaqzHdYqpYQQN+mgwB1cLDR9rtPbV+9C3RyBpfRm7xory8lOXP7tRqd0XAQ1Gy5rFB0COGXcNSfESc0Tdqt+VO8EA4rIGVPz8S7ebJCl+z+3C3ORmRy8lVDAHPY7yeeakIDbfl/X88gYIeECNmjkINAasXvJkKpAx9R3LXyRWE6D++FN5Ef5iW1kuLtmC/0WrnE90eNBDGW0odkbHD9prS7wBz0e8oM1t7IiU0j7henJ8a2c70JpV6LbBxVNCx4ulX9Xhpnx2iNqJ7irvBGxH6grJb6alDLv5rN7Ukdj9H1OmPjH/Op2o/Oj6Skt1oz0CPrzQLiMsVIlG9af8yms+yxLStHTT7AZiarNIITGSK5pXU2CK53UGFpMQ1RqnkYjjZcZClXSk06BcwyDwpwSIA1ZXYio4/4eyzDdA/Xpp5g6ktp/TAnKCcz68seIQMrF8LtWZIaR7kvtmFHAPIVi0/uYOcSpWPr0lRjvLSlpF/lKRgw8MJa91d1Mnbmdy5UVFmt5R/SSj8gozpuX1jWNpGOOk5TnALpahmvJmvM2+8b51zVoSZbmnrifi24qQh3rr9H4VBtfoRJyo62Q6mIOtmejBeFmxwauxbxvgi4iK84DXWvq11PdHwXyk6EpWUx39lBr/6Fw6hwrp/vwbfzDLibbuB2bf1IG02CsAu2LiuHkhz618JpJqLXTMA2bYgjLW2g+FOuknchgxjMavZVr8bus8cjlU2dPp4Kb5SKOBXEedQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(26005)(508600001)(71200400001)(66946007)(36756003)(76116006)(6486002)(64756008)(54906003)(38100700002)(966005)(91956017)(66556008)(6512007)(5660300002)(66446008)(66476007)(2906002)(53546011)(122000001)(4326008)(186003)(316002)(38070700005)(31696002)(2616005)(31686004)(8936002)(8676002)(6506007)(83380400001)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NXJzS1VnQVVMbHFJOFliWi85OUcrUzdINTVjbWJlOFc4MzZSNk9qWnN5WnRT?=
 =?utf-8?B?ZXBDcnRuUmpuUHpnK1FrMG1DUFZIbUZIQ01vNWdZUHZYbGNoU3NKZ09aMGVR?=
 =?utf-8?B?MDQzUFlOZHBYL1FQeFhGaE5RRXNmeHdQano5ZUt6RU9kMEJHMUpLOWNDNkpR?=
 =?utf-8?B?UFpMQyt3eS9EUnBPdTZiMnZ4TnNTd29mK2hRV3NUQzBSM3pONXZ4dkF2Q243?=
 =?utf-8?B?R2FrQ2dOZzE4SHhHaG13a0RxQWZyUU1DdUtTbm96MjUxUi9IR3dlMGRTTitF?=
 =?utf-8?B?RHg1bHFGd1FrNjBTY1BSMjdjNTluSkxpUFo5R1UvR2pkU3pqWER3U1YzUHEy?=
 =?utf-8?B?TlhxbTJzaGRZOEd5MnV0R2Y3QnpMUWtPQStoT3ZFVTlUMzZEd0dpSHVVcWlQ?=
 =?utf-8?B?TFYrSnJWdFhGRXRmODh3djBsTW5tUWFNbncrZ1kwV3hYL2pCeTMvb2NBdG5R?=
 =?utf-8?B?TVZiUHFETWgrdit0bE90SUZ5Y3dUektJRlhINlFwbXR0V2M5N0hXZUFNWm1Q?=
 =?utf-8?B?bjM3dEpja3kxbXJtZGswbEJ5RHVPd3JNQzhISjViRXRiRWdHQWx5NXdPbHRC?=
 =?utf-8?B?THQzekQ1T2xnQUNwYUEzQzFvd0hPK2trZkRLWEtpQ0dzS1p6R0RSbkZ5UDh6?=
 =?utf-8?B?ditzL29jelZPQ0QwbmIxUERoa3NoN0JsaWxCNWwrV3Y2dC9PQytSY0RTYnpQ?=
 =?utf-8?B?ZkhXaVVRdWpHdGxJN0JodFBDOEk0UktPUU5rVytVdVFVVko3Q3o2VnJGYU1i?=
 =?utf-8?B?VkVpZTNvM21YK2NpN00zK0JMd2JacFJQNzBqMWZCWjJoT3hpbk5KWllsK3VW?=
 =?utf-8?B?Y042M3R4WGdWbThzbk9YWXFzNmdydG0xSmQvMFRSMzBHYUwyRktBam9GV1gx?=
 =?utf-8?B?bnpJbG10TjVOYzBIaUdIdDhTRWU0Vm9zeGM5aHh5MFhUUG9ZVzBzSmQxVGtD?=
 =?utf-8?B?REVwTXZOektoZGxmU3VIMUhIK3BadnpCKzNpbUpqYSsrTkdzUER3RzV3TCtL?=
 =?utf-8?B?T0lVMVhTeU9IVzFjR2wwUHlqbDdYNjk5TEcxQm42VFBmVmF5U0FGcVN6Z3JF?=
 =?utf-8?B?Z3RiWGNoNUpHMjZ6UEdoMi9VWngvWkFwWGRaL0c1WGZKRkRnRnI0YUZuZWM3?=
 =?utf-8?B?d0E5K0FxUFR6Tnc4R3ZITkpCMnEwV0VZcU10aGhDY1k5RUtaRXY1TktGYmhr?=
 =?utf-8?B?eW14cXpLVlBKVitWeUg0b3M1S0ZrSlhkQXpDR1R0WFFmdzhleVhiMFFLeStU?=
 =?utf-8?B?b0huUlRVcmtQeHBxUTN6S1JLTEtORU11WDVZVDQ2OXBiYXV5M1lOUjdzVUwv?=
 =?utf-8?B?Z0F4eEtBL1V1aWJLZDdIcS9vRGVjZExwK3Jubm13TTdWOXJ1VHlCRjRDUHNY?=
 =?utf-8?B?ZDE5UWRzcEpjZjBhWjJPRVFJeS9SYTZZM2R3QVlsM3poQ3ZxSVRmWm9zak9R?=
 =?utf-8?B?a3FWK2hHcTBFdHR2Zjk1c1JOZ1NwdURHbFcyUmtCeEtkVlFwcHh3MmZBLzc2?=
 =?utf-8?B?cTZTa0tFaDJFTjMwMDFaWk84Sit1WldGV0haVDhyWFZPSDExR3pnMm1SVVVR?=
 =?utf-8?B?Rm5wTXo3MS84MTErUXlFWFBYdmEyWEhhOUNzSi9NTENZUXdTbEFpRDhpeUpi?=
 =?utf-8?B?L1ZlM0h3Z3BVbkpXSnlxMXNzUjZsbmQvZHpVcTF1TkFNVkdBUDVBdk9IektR?=
 =?utf-8?B?REpKeWp3N1Q2REhHVzV6SHV1UUhSQ1pEUDIxTTk2enArZHFWaUhTQisxaStM?=
 =?utf-8?B?YnZReUpBNFZBODZuL0FiWkU3b08rR1drR3Q3L1hLMHlPZVZ1T1pETjBmVHBX?=
 =?utf-8?B?U1NlUDBNc2ZYRjJHcHpnaXd0UkNnRFNtNlpwZ1RtWUpLbVVwL2lwUWYveHdE?=
 =?utf-8?B?RWhqcC9iWlRNNzh2OS9JMTMwRmhta05JQy95aHZSMzd0cjZDNHNvRFJRNXhp?=
 =?utf-8?B?alF3TTI1NUJlL0VMUWkrZURBcFJhNkhTVHFSNFM0ekhlSndkRVJiUlBGVFBE?=
 =?utf-8?B?WVhpRmM2enVDMU1Dd1owb2xSL2drZmRSQVJadndKenZHWnAzdUR4b1VaVlBy?=
 =?utf-8?B?Mm9BYStWZytJM25hRXZOczNUSk9UNFh2Qlhjcmk4cnN1d0ozOTlVNWNnOWQx?=
 =?utf-8?B?THUzNTRHcTVkOVNpeGQ1WGY2TGxnZUhyWFRIWGdVSE5yTzVXd2JudFViTTJR?=
 =?utf-8?B?L3lWU0dxTVJBWHNnWEVRL1k5RVpzd0twSWtGMXM1RHpVTzNnV0tHSS9JMFNG?=
 =?utf-8?B?NzVmQTlLVDJLL3N3bmIzUElvVGxZbGJGbXNlMDdmZkFyZG56WFhBTVBmMlNF?=
 =?utf-8?B?KzU5MW9JTVdQOVVKcTZ0RUdUVUpNTEx1REdqZ2ZnT0ZDMHNPc2dkdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC9DB9DDE48C2C49888C74CD1F2001CA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e0102e-6fa6-40ff-9a06-08d99952ff8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 14:06:40.2010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MmlF8KA8PpTJ1H9t5TSpVxoTiZP2YYQ6zrNvEInyDYg9/7eUV8AxW1ha4sVWcqzyi6plJrZjjwGlqChvOAxLfS7gVkxhqZi5feUmMjmdaoyg8KkpanWpdoF0vN2FLmRz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4020
X-Proofpoint-ORIG-GUID: SVbeTDCmLfqbJ7l_6e9iOfZtMxuxRhWX
X-Proofpoint-GUID: SVbeTDCmLfqbJ7l_6e9iOfZtMxuxRhWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270086

DQoNCk9uIDI3LjEwLjIxIDE2OjIzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQs
IE9jdCAyNywgMjAyMSBhdCAxMTo1OTo0N0FNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEhpLCBSb2dlciENCj4+DQo+PiBPbiAyNy4xMC4yMSAxMzoxNywgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gSGksIFJvZ2VyIQ0KPj4+DQo+Pj4gT24gMTMu
MTAuMjEgMTY6NTEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+IE9uIFRodSwgU2VwIDMw
LCAyMDIxIGF0IDEwOjUyOjE1QU0gKzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4NCj4+Pj4+IFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gZm9y
IGR5bmFtaWMgYXNzaWdubWVudCBvZiB0aGUgdlBDSSByZWdpc3Rlcg0KPj4+Pj4gaGFuZGxlcnMg
ZGVwZW5kaW5nIG9uIHRoZSBkb21haW46IGh3ZG9tIG9yIGd1ZXN0Lg0KPj4+Pj4gVGhlIG5lZWQg
Zm9yIHRoaXMgc3RlcCBpcyB0aGF0IGl0IGlzIGVhc2llciB0byBoYXZlIGFsbCByZWxhdGVkIGZ1
bmN0aW9uYWxpdHkNCj4+Pj4+IHB1dCBhdCBvbmUgcGxhY2UuIFdoZW4gdGhlIHN1YnNlcXVlbnQg
cGF0Y2hlcyBhZGQgZGVjaXNpb25zIG9uIHdoaWNoDQo+Pj4+PiBoYW5kbGVycyB0byBpbnN0YWxs
LCBlLmcuIGh3ZG9tIG9yIGd1ZXN0IGhhbmRsZXJzLCB0aGVuIHRoaXMgaXMgZWFzaWx5DQo+Pj4+
PiBhY2hpZXZhYmxlLg0KPj4+PiBXb24ndCBpdCBiZSBwb3NzaWJsZSB0byBzZWxlY3QgdGhlIGhh
bmRsZXJzIHRvIGluc3RhbGwgaW4gaW5pdF9iYXJzDQo+Pj4+IGl0c2VsZj8NCj4+PiBJdCBpcyBw
b3NzaWJsZQ0KPj4+PiBTcGxpdHRpbmcgaXQgbGlrZSB0aGF0IG1lYW5zIHlvdSBuZWVkIHRvIGl0
ZXJhdGUgb3ZlciB0aGUgbnVtYmVycyBvZg0KPj4+PiBCQVJzIHR3aWNlIChvbmUgaW4gYWRkX2Jh
cl9oYW5kbGVycyBhbmQgb25lIGluIGluaXRfYmFycyksIHdoaWNoIG1ha2VzDQo+Pj4+IGl0IG1v
cmUgbGlrZWx5IHRvIGludHJvZHVjZSBlcnJvcnMgb3IgZGl2ZXJnZW5jZXMuDQo+Pj4+DQo+Pj4+
IERlY291cGxpbmcgdGhlIGZpbGxpbmcgb2YgdnBjaV9iYXIgZGF0YSB3aXRoIHNldHRpbmcgdGhl
IGhhbmRsZXJzDQo+Pj4+IHNlZW1zIHNsaWdodGx5IGNvbmZ1c2luZy4NCj4+PiBPaywgSSB3b24n
dCBpbnRyb2R1Y2UgYWRkX2Jhcl9oYW5kbGVycywgdGh1cyByZW5kZXJpbmcgdGhpcyBwYXRjaCB1
c2VsZXNzLg0KPj4+IEknbGwgZHJvcCBpdCBhbmQgcmUtd29yayB0aGUgdXBjb21pbmcgcGF0Y2hl
cyB3aXRoIHRoaXMgcmVzcGVjdA0KPj4gT24gdGhlIG90aGVyIGhhbmQgYWZ0ZXIgdGhpbmtpbmcg
YSBiaXQgbW9yZS4NCj4+IFdoYXQgYWN0dWFsbHkgaW5pdF9iYXJzIGRvPw0KPj4gMS4gUnVucyBv
bmNlIHBlciBlYWNoIHBkZXYgKF9faW5pdD8pDQo+PiAyLiBTaXplcyB0aGUgQkFScyBhbmQgZGV0
ZWN0cyB0aGVpciB0eXBlLCBzZXRzIHVwIHBkZXYtPnZwY2ktPmhlYWRlciBCQVIgdmFsdWVzDQo+
PiAzLiBBZGRzIHJlZ2lzdGVyIGhhbmRsZXJzLg0KPj4NCj4+IEZvciBEb21VIHdlIG9ubHkgbmVl
ZCAzKSwgc28gd2UgY2FuIHNldHVwIGd1ZXN0IGhhbmRsZXJzLg0KPiBJIHRoaW5rIHlvdSBhc3N1
bWUgdGhhdCB0aGVyZSB3aWxsIGFsd2F5cyBiZSBhIGhhcmR3YXJlIGRvbWFpbiB3aXRoDQo+IHZQ
Q0kgZW5hYmxlZCB0aGF0IHdpbGwgZ2V0IHRoZSBkZXZpY2UgYXNzaWduZWQgYW5kIHRodXMgaW5p
dF9iYXJzIHdpbGwNCj4gYmUgZXhlY3V0ZWQgcHJpb3IgdG8gYXNzaWduaW5nIHRvIGEgZG9tVS4N
ClllcywgdGhpcyBpcyB0aGUgY3VycmVudCBhc3N1bXB0aW9uLi4uDQo+DQo+IEJ1dCB3aGF0IGFi
b3V0IGRvbTBsZXNzLA0KaXQgd2FzIGRlY2lkZWQgdG8gcHV0IGRvbTBsZXNzIG91dCBvZiBzY29w
ZSBmb3Igbm93DQo+ICAgb3Igd2hlbiB1c2luZyBhIGNsYXNzaWMgUFYgZG9tMD8NCkkgdGhvdWdo
dCB0aGF0IHZQQ0kgaXMgb25seSB1c2VkIGZvciBQVkggRG9tMCBhbmQgaXQgaXMgZW5vdWdoIGZv
ciBub3cNCih5ZXMsIHRoaXMgaXMgYSB3ZWFrIGFyZ3VtZW50LCBidXQgd2UgZG8gbm90IHdhbnQg
UENJIHBhc3N0aHJvdWdoIG9uIEFybQ0KdG8gYmVjb21lIGEgbmV2ZXIgZW5kaW5nIGdhbWUuLi4g
c2luY2UgMjAxNS4uLikNCj4gICBJbiB0aGF0IGNhc2UNCj4gdGhlIGRldmljZSB3b24ndCBnZXQg
YXNzaWduZWQgdG8gYSBoYXJkd2FyZSBkb21haW4gd2l0aCB2UENJIHN1cHBvcnQsDQo+IHNvIHRo
ZSB2cGNpIHN0cnVjdHVyZSB3b24ndCBiZSBhbGxvY2F0ZWQgb3IgZmlsbGVkLA0KWWVzLCB0aGlz
IGlzIHRydWUuIEJ1dCBiZWNhdXNlIG9mIHRoZSAzIGZ1bmN0aW9uZmxpdGllcyBvZiB0aGUgaW5p
dF9iYXJzIGlzDQpkb2luZyBpdCBtaWdodCBzdGlsbCBuZWVkIHNvbWUgZGlzLWFnZ3JlZ2F0aW9u
LCBlLmcuIEJBUiBzaXppbmcNCmlzIG5vdCBuZWVkZWQgYW5kIG1pZ2h0IG5vdCBiZSBwb3NzaWJs
ZSB3aGlsZSBhc3NpZ25pbmcgdG8gYSBEb21VLg0KU28sIEkgdGhpbmsgdGhhdCBpbml0X2JhcnMg
d2lsbCBuZWVkIHRvIGJlIHNwbGl0IGluIGFueSBjYXNlLg0KPiAgIGFuZCBoZW5jZQ0KPiBpbml0
X2JhcnMgd291bGQgaGF2ZSB0byBiZSBleGVjdXRlZCB3aGVuIGFzc2lnbmluZyB0byBhIGRvbVUu
DQpQbGVhc2Ugc2VlIGFib3ZlOiBub3Qgc3VyZSBpbml0X2JhcnMgY2FuIGV4aXN0IGluIGl0cyBm
b3JtIHRvIGFjaGlldmUgdGhhdC4NCk9uZSBvZiB0aGUgc3RlcHMgdGhpcyBwYXRjaCBpcyBkb2lu
ZyBpcyB3ZSBzcGxpdCBpbml0X2JhcnMgaW50bw0KYSkgcmVnaXN0ZXIgYXNzaWdubWVudA0KYikg
YWxsIHRoZSByZXNldDogaW5pdGlhbCBwZGV2J3MgaGVhZGVyIGluaXRpYWxpemF0aW9uLCBzaXpp
bmcgZXRjLg0KDQpUaGUgc2FtZSBpcyB0cnVlIGZvciBNU0kvTVNJLVguIFdoZW4gd2UgYWRkIHN1
cHBvcnQgZm9yIE1TSS9NU0ktWCBvbiBBcm0NCnlvdSB3aWxsIHNlZSB0aGUgc2FtZTogd2UgbmVl
ZCB0byBzcGxpdCBbMV0gKHRoaXMgaXMgV0lQKS4NCg0KU28sIEkgYW0gc3RpbGwgY29udmluY2Vk
IHRoYXQgd2UgbmVlZCBhZGRfYmFyX2hhbmRsZXJzIGluIHNvbWUgZm9ybS4NCj4gVGhhbmtzLCBS
b2dlci4NCj4NClsxXSBodHRwczovL2dpdGxhYi5jb20vcmFoc2luZ2gveGVuLWludGVncmF0aW9u
Ly0vY29tbWl0LzdiODk4NjAxMjYxZmMzYWQ4MzRhYzNkMDZjYzRjNzg0ZjMzYzk1YmI=

