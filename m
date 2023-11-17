Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5C67EED63
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 09:13:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634866.990417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3txZ-0006Oj-K5; Fri, 17 Nov 2023 08:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634866.990417; Fri, 17 Nov 2023 08:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3txZ-0006LY-G5; Fri, 17 Nov 2023 08:12:17 +0000
Received: by outflank-mailman (input) for mailman id 634866;
 Fri, 17 Nov 2023 08:12:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5++=G6=epam.com=prvs=5685d04c48=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1r3txX-0006LS-VQ
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 08:12:16 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 035996d5-8521-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 09:12:14 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AH6cGU0003309; Fri, 17 Nov 2023 08:12:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ud54ncxfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 08:12:07 +0000
Received: from m0174680.ppops.net (m0174680.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AH86dLS027288;
 Fri, 17 Nov 2023 08:12:06 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ud54ncxfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 08:12:05 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by PAXPR03MB8299.eurprd03.prod.outlook.com (2603:10a6:102:241::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 08:12:00 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::fea9:8f02:fb13:fd44]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::fea9:8f02:fb13:fd44%6]) with mapi id 15.20.6977.029; Fri, 17 Nov 2023
 08:11:59 +0000
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
X-Inumbo-ID: 035996d5-8521-11ee-98dc-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFj4LNKkulkYZRhxVwhnEePhIMIej/UvlZ5neSHJOtWiNFg83wJi1LsWfy5c34B2TICCcv5Q/XJM/B7Q0i4X7Ozct4OIT6yDklNDBT22W32MzmKngoe6G4OVZxp128nJ0ggw0GzDy8kV+gKRCDrkjHFVbNWlVmrZsIGti/l8kh9lRYgxrvcAa+rSAf+DghX860fAe6b73btV8N5iVJd5JFxtWCCcLC4XJPpKvPhBLjoelryUMElJFu4aedOXDOftIgrNEt6ug8YhqQLUQk66QnIydrTkzTuIZbi90Z2+PpZC1R5r8c9R+Pdn4WZmhqXmDAv1B1sWwGCxE1lxX2pnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ3EpuPRaUQNjMvfMjZxEepvNY1Ql+1IAP8Du5F6Xs0=;
 b=LbGI5DO7PqWDOXN/EIgtQWm0qNw3BaAxbTftADKbbAgl2ssr9ZXeeB8jOGVEDVMMnq48j1JT05q7402ZswLhLl1voE2GucY8Tr8qJQ5indcrFIc9pzSkIU9HTAX7w0JW4PWwDI7qi0HB+6blgCnZBVDD8kFwmyImZJuuA2iQAUeIHaY4Bo6cWha2lKp38XNZoB+i/TC8ZoMFH+VivSt49KSWdwIJa7NjM5UoAOodJlFouSq5dRjM2GhdXZ33NsU9a+4UiVKN51EvrGhk/FSDscOLM01jVR3RAEm2d3wqaMTK4FmjVTB9z5oph/yduOzyHvkjHqK0urCVpYNZSyjhKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ3EpuPRaUQNjMvfMjZxEepvNY1Ql+1IAP8Du5F6Xs0=;
 b=mTrwYDoVtoetiOp615yZkckhLlqf6VIl7U9d+r9z+DMVbWfnIJiKDmBy0JSd7s/easBUbVRzTzkZdx8rgurWoaIo1krq3AEyuwDQ3bwUEJIE6a6Mzn2hMQR/VItOaUqG6XqWcHlL9JeCEi25FtJNfzAr6TOD/w3hVvnKIyvx/EkoQmCVUKT3kXcgZqxK0xeyVnThhyOt/YOq85Ja+/QdCwPP3v3XBFwFer2vXTyU/8SEbGkwq+Oc3BWnPivee1ZDQtNfL+7jIDM0JMw01S3GLb0CUz4RJC4Kx0OqS++PXr8eqrr1Pi41APw1EMACfJcVrrbVmTJ6Vj5LrbP86nID1w==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
CC: Julien Grall <julien@xen.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        "vikram.garhwal@amd.com"
	<vikram.garhwal@amd.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Thread-Topic: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Thread-Index: AQHaF7/0l4ZQp7ixjkGnkGM6dDamtLB7mIqAgABuuwCAAdZJgIAATmUA
Date: Fri, 17 Nov 2023 08:11:59 +0000
Message-ID: <a96732c2-cdfb-43fb-9e88-1cd54994eab4@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
 <78c59979-5110-4fa3-855d-e0fa6df116f0@amd.com>
In-Reply-To: <78c59979-5110-4fa3-855d-e0fa6df116f0@amd.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|PAXPR03MB8299:EE_
x-ms-office365-filtering-correlation-id: ab378e73-ff71-4337-dc12-08dbe744dfa5
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yvDqeKk2+p3GkLvMLPcODHC8uL7R2fy7kALKVr9BR8bZKaf71phzcXqb4QoGNzidcAqViu/h6YF/QuzroByjRZtm5Oz022O16J8wbRcoBqxzjYZivv3m0iC/NzIXxpkjm4TWmGZ5HkogvpLzweA4iIYMDA/ehwzv/kXuLYaMEws80I8PrANUoWkNln2rH/LBXZI275/nimS+0cqF0wUr64wFfWPf2Y66PHlO/g7dR3ap3NpLWfmja5J+rPgKqj+T7S1FBU/95V0+cdvZfzZGZ4y3fMYMVQA+QboIKFSxEysEC0SU9iSIZ86/BC1QtnIy+c+eg+Hz3fEjLaDgQC9O7nnD08tVVUzOxRiX9h1GcxP9mNoPp4pafHMSa9oE4uzINi3k2fnj3NxMTi9hEa2fH19XcBNchp8nO0Ku+IpU70oJlaBt/rA0IDji+vSZ3qRvrO+4M7pIOqmu+cDKRmyEVxTr39SoX8QRiv8KrxoQgtmGASh9s4ecMqwDVqm4loCEqkTU+yhUKNymJirtyz/eiyqjidroJm2Q4h0xEpQuli/x9o44KTR0j48793FhijvK/hEQlq1284O4RgLW/YfhYn1yPnxRbapRz+bRCvozusrQcJLqVyU4bnfSwOOdmXFZpBrjr0M0/7nxTbDYIqB5bw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(91956017)(66446008)(54906003)(76116006)(66476007)(66556008)(64756008)(66946007)(316002)(6916009)(83380400001)(2616005)(36756003)(53546011)(6506007)(38070700009)(71200400001)(6512007)(966005)(6486002)(478600001)(26005)(38100700002)(5660300002)(122000001)(31686004)(31696002)(41300700001)(2906002)(86362001)(8936002)(8676002)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eml2b0pHdm5ORzhid29MeUVVNDlkR3Jha1VCdmJvMmgzdnJucitxeE9ldUJJ?=
 =?utf-8?B?dXRSNlEvVWs4N0x1RzZoQnhzNFFLZWV4aFUrdURQeXRlOWNYY3JMTlVTM05k?=
 =?utf-8?B?TEhvWks4YXlUcW91dDdwdHZQaWZ6dTlyME9CcWEvMkRDVnNUQkdGVCtVZVpG?=
 =?utf-8?B?QWNKdTl6S2p3L3JlQStmZnYvR2N2Z0tnRmpjOTZlTFh3Nno5OWZoK1c1TlFD?=
 =?utf-8?B?cXREM0ZucTE5NlpwRnFLajNxQ2NYdW9GNXFSdE55bnNhdlFidmdSOEZUVEpy?=
 =?utf-8?B?ZmJoQnB1bHFjZE94cVFjUERhSERmdFhGL1lBY1JyS1FnVGdqK0tBbUFEbzFF?=
 =?utf-8?B?c043RTZJbUplT0pXMnUxSE1mVUNjQTFCaCt2Y3RwczUvR3ZnRXNIVE05UkJp?=
 =?utf-8?B?eTdQNWFub3E2WStwUlMrQ083MnZsUTJaQXNYTHBTQXFWMEQzM29GRTRGRUpP?=
 =?utf-8?B?UEJ0OHgvN0hSL3ltVk95Z1RCOG9WRWN2TXU0S29YckVVNGtKbUUwSlRKdi81?=
 =?utf-8?B?MGY4R1ZKMWhHT1ZEVUJOdmFyTzdDUlArdktMUHZGakhzQ3FzWWFORHQxTTlh?=
 =?utf-8?B?YjZ2Y1FJcTJPUloxYXgzdG1iSWFhRWJ2bkwwZEZTeTNRY2J2N3JBSHdIcFBl?=
 =?utf-8?B?RXBuWVJkeDRPaWxiYWhyTjdWV1NPMk5mT25CeXNsamdma0RFTjNITHdSN0xL?=
 =?utf-8?B?UEVia3hnTzVTSHRqaUNSU2FaYnRVUVRaSGZ0aldUcWY4Mk9hNHA4dENyeUt2?=
 =?utf-8?B?RXVTMTZQd1N0aTRVbjNKNDJUVHJOZEpYeU1KTGo1aER5aWUvUUdKalJ6ZGg1?=
 =?utf-8?B?RXVQWXUzOVJSeVR4bXhmUGUxR2V3UkRKR3lOa1B6UzBzaGErWlU0eHlJTWhL?=
 =?utf-8?B?SjZ3VzlBRGl4RXgwWXAzd00vbWxDL1dJcjJJZmVrVUJIOUlSR01NL0lGRDA3?=
 =?utf-8?B?RVU2bzdOcC9tUklJTzM0eEphU01laWI5NGU4cklGbUZTMkdqbkNXNGpoMzRS?=
 =?utf-8?B?NzZCWHMvVHlZaXl6ZE9QbDdHbFdUUFkzQkVhUFFqbngxaGR5RFc1SlNxb0lk?=
 =?utf-8?B?ZzcxbHBjNWFqVmNNdDRtd2E1UGdhZWpNOXRXR24yUHBXdkNaUTI0NFpkaDBr?=
 =?utf-8?B?RkViTWN5dWhlNWk4eGdrSk9tUWlqWXVpdENaazl6Y3ZzK1BiUlkxZURDc0F4?=
 =?utf-8?B?SHFDSTRIV3BWMENCMGd1MUszK25aVjkwWkxZaEJpMDlGd2VSK2FGU3U0MUhB?=
 =?utf-8?B?Q0YyeWdBUXJOMHF6dTkzUnNPRjhmdTF1VGhxdWFIdzJnSFZVMjB4TnB1UVQv?=
 =?utf-8?B?RWtwSllKdUc2enJXa2ZjNU1NTmRzQmhwbWtnYmY0b25VMUdoMjd2U2tYMzZ6?=
 =?utf-8?B?ZEJQdC8xT284K1RqRkNBbCsyUm94V2R5K0FBR2FNdVNBbm5pTGZZcC9MUjlX?=
 =?utf-8?B?cG9FVkhNaUdZTGI1UEppaWNVN2sxZ2RscE4wWm41VWJwMk12R0ptVUtpUm1X?=
 =?utf-8?B?bitvV3o4RHdFMTAzcjFWeTlheG9CS1BQbzVuTnI4eCtZSnE4d213M0lUVDhp?=
 =?utf-8?B?TUtLWTFpNTRXeTJTNElFM3RWWS9GSEYrWnRzYnhUL0RENnVsR2FLYjFVS29m?=
 =?utf-8?B?T09PZFgvWjBtcHkrY2phUFRnQWlMM1NwN0xKQ3pXbzgvMHp3WFFNdi9Ja0Zi?=
 =?utf-8?B?clQrb1o0Vi94dGJkeHJhVDN0ZGs1WWxLaUhpdlJpMGdKOS9WZUpBNUpZa3Jl?=
 =?utf-8?B?NTRxUXUwdkJCWWJqQlMyTHFnT2NuYzBXK01qT3h0eWhFOElUa3NzYlBiWFlE?=
 =?utf-8?B?RDdXdzFsSDVrbks2WG1FSm44eTJtemwxQmMrS1JndFZTa3pIS0ZneXlKRkp6?=
 =?utf-8?B?bTdOS2tSZFFxYzljZFcyM3UybTJVcldEZGdydlpLUC9YeURzbFdXOVNFczZZ?=
 =?utf-8?B?bllWNDFYS0hqTW9rbjVDdDNMY3RrblcyNkVXaGhnUTlkVzljVnN0VWpONlRm?=
 =?utf-8?B?MUg2Si9aZlVmckN5czZxeHFmOW1CRHhwSlQ3NUpYTHhKdTM4RHVscTNSbFdT?=
 =?utf-8?B?cHJaY0J6bHI3eTJSd1hHSEtqZFVNVHVpM2xMT1FqbWtGaUpnWUppUmFMUTRv?=
 =?utf-8?B?SGF4WHVyT2hqUFJka0tZd2liQUhxcnY0YlNzUm5wUWRKNjAyTHZvczdrRTlk?=
 =?utf-8?Q?AlSO/20grr92BO+Mij8uSF4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90D80E560FFE9A45A96BBEF04EC960A7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab378e73-ff71-4337-dc12-08dbe744dfa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 08:11:59.8807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sFCeVBM6yOKIlCabmtgaHpf8B/BH99QtRCojDOw5xD/Fx3Cos2Vp9JjKAfPX9uIZT4QepqxbznixHGfczri62NZiOaNRrtZU8w88dmw67Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8299
X-Proofpoint-ORIG-GUID: kzqApv9XM61SFgMTxKxOLqAlTiXMhFnB
X-Proofpoint-GUID: kzqApv9XM61SFgMTxKxOLqAlTiXMhFnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_06,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=2 engine=8.12.0-2311060000 definitions=main-2311170059

DQoNCk9uIDE3LjExLjIzIDA1OjMxLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQoNCkhlbGxv
IFN0ZXdhcnQNCg0KW2Fuc3dlcmluZyBvbmx5IGZvciB2aXJ0aW8tcGNpIGJpdHMgYXMgZm9yIHZQ
Q0kgSSBhbSBvbmx5IGZhbWlsaWFyIHdpdGggDQpjb2RlIHJlc3BvbnNpYmxlIGZvciB0cmFwcGlu
ZyBjb25maWcgc3BhY2UgYWNjZXNzZXNdDQoNCltzbmlwXQ0KDQo+Pg0KPj4NCj4+IExldCBtZSBz
dGFydCBieSBzYXlpbmcgdGhhdCBpZiB3ZSBjYW4gZ2V0IGF3YXkgd2l0aCBpdCwgSSB0aGluayB0
aGF0IGENCj4+IHNpbmdsZSBQQ0kgUm9vdCBDb21wbGV4IGluIFhlbiB3b3VsZCBiZSBiZXN0IGJl
Y2F1c2UgaXQgcmVxdWlyZXMgbGVzcw0KPj4gY29tcGxleGl0eS4gV2h5IGVtdWxhdGUgMi8zIFBD
SSBSb290IENvbXBsZXhlcyBpZiB3ZSBjYW4gZW11bGF0ZSBvbmx5DQo+PiBvbmU/DQo+Pg0KPj4g
U3Rld2FydCwgeW91IGFyZSBkZWVwIGludG8gdlBDSSwgd2hhdCdzIHlvdXIgdGhpbmtpbmc/DQo+
IA0KPiBGaXJzdCBhbGxvdyBtZSBleHBsYWluIHRoZSBtb3ZpbmcgcGllY2VzIGluIGEgYml0IG1v
cmUgZGV0YWlsIChza2lwIGFoZWFkIHRvICJCYWNrIHRvIHRoZSBxdWVzdGlvbjogIiBpZiB5b3Ug
ZG9uJ3Qgd2FudCB0byBiZSBib3JlZCB3aXRoIHRoZSBkZXRhaWxzKS4gSSBwbGF5ZWQgYXJvdW5k
IHdpdGggdGhpcyBzZXJpZXMsIGFuZCBJIHBhc3NlZCB0aHJvdWdoIGEgUENJIGRldmljZSAod2l0
aCB2UENJKSBhbmQgZW5hYmxlZCB2aXJ0aW8tcGNpOg0KPiANCj4gdmlydGlvID0gWyAidHlwZT12
aXJ0aW8sZGV2aWNlLHRyYW5zcG9ydD1wY2ksYmRmPTAwMDA6MDA6MDAuMCxiYWNrZW5kX3R5cGU9
cWVtdSIgXQ0KPiBkZXZpY2VfbW9kZWxfYXJncyA9IFsgIi1kZXZpY2UiLCAidmlydGlvLXNlcmlh
bC1wY2kiIF0NCj4gcGNpID0gWyAiMDE6MDAuMCIgXQ0KPiANCj4gSW5kZWVkIHdlIGdldCB0d28g
cm9vdCBjb21wbGV4ZXMgKDIgRUNBTSByYW5nZXMsIDIgc2V0cyBvZiBpbnRlcnJ1cHRzLCBldGMu
KSBmcm9tIHRoZSBkb21VIHBvaW50IG9mIHZpZXc6DQo+IA0KPiAgICAgIHBjaWVAMTAwMDAwMDAg
ew0KPiAgICAgICAgICBjb21wYXRpYmxlID0gInBjaS1ob3N0LWVjYW0tZ2VuZXJpYyI7DQo+ICAg
ICAgICAgIGRldmljZV90eXBlID0gInBjaSI7DQo+ICAgICAgICAgIHJlZyA9IDwweDAwIDB4MTAw
MDAwMDAgMHgwMCAweDEwMDAwMDAwPjsNCj4gICAgICAgICAgYnVzLXJhbmdlID0gPDB4MDAgMHhm
Zj47DQo+ICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4MDM+Ow0KPiAgICAgICAgICAjc2l6
ZS1jZWxscyA9IDwweDAyPjsNCj4gICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiAgICAgICAg
ICByYW5nZXMgPSA8MHgyMDAwMDAwIDB4MDAgMHgyMzAwMDAwMCAweDAwIDB4MjMwMDAwMDAgMHgw
MCAweDEwMDAwMDAwIDB4NDIwMDAwMDAgMHgwMSAweDAwIDB4MDEgMHgwMCAweDAxIDB4MDA+Ow0K
PiAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDB4MDE+Ow0KPiAgICAgICAgICBpbnRlcnJ1
cHQtbWFwID0gPDB4MDAgMHgwMCAweDAwIDB4MDEgMHhmZGU4IDB4MDAgMHg3NCAweDA0PjsNCj4g
ICAgICAgICAgaW50ZXJydXB0LW1hcC1tYXNrID0gPDB4MDAgMHgwMCAweDAwIDB4MDc+Ow0KDQoN
CkkgYW0gd29uZGVyaW5nIGhvdyB5b3UgZ290IGludGVycnVwdC1tYXAgaGVyZT8gQUZBSVIgdXBz
dHJlYW0gdG9vbHN0YWNrIA0KZG9lc24ndCBhZGQgdGhhdCBwcm9wZXJ0eSBmb3IgdnBjaSBkdCBu
b2RlLg0KDQo+ICAgICAgfTsNCj4gDQo+ICAgICAgcGNpZUAzMzAwMDAwMCB7DQo+ICAgICAgICAg
IGNvbXBhdGlibGUgPSAicGNpLWhvc3QtZWNhbS1nZW5lcmljIjsNCj4gICAgICAgICAgZGV2aWNl
X3R5cGUgPSAicGNpIjsNCj4gICAgICAgICAgcmVnID0gPDB4MDAgMHgzMzAwMDAwMCAweDAwIDB4
MjAwMDAwPjsNCj4gICAgICAgICAgYnVzLXJhbmdlID0gPDB4MDAgMHgwMT47DQo+ICAgICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDB4MDM+Ow0KPiAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDAy
PjsNCj4gICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiAgICAgICAgICByYW5nZXMgPSA8MHgy
MDAwMDAwIDB4MDAgMHgzNDAwMDAwMCAweDAwIDB4MzQwMDAwMDAgMHgwMCAweDgwMDAwMCAweDQy
MDAwMDAwIDB4MDAgMHgzYTAwMDAwMCAweDAwIDB4M2EwMDAwMDAgMHgwMCAweDgwMDAwMD47DQo+
ICAgICAgICAgIGRtYS1jb2hlcmVudDsNCj4gICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDww
eDAxPjsNCj4gICAgICAgICAgaW50ZXJydXB0LW1hcCA9IDwweDAwIDB4MDAgMHgwMCAweDAxIDB4
ZmRlOCAweDAwIDB4MGMgMHgwNCAweDAwIDB4MDAgMHgwMCAweDAyIDB4ZmRlOCAweDAwIDB4MGQg
MHgwNCAweDAwIDB4MDAgMHgwMCAweDAzIDB4ZmRlOCAweDAwIDB4MGUgMHgwNCAweDAwIDB4MDAg
MHgwMCAweDA0IDB4ZmRlOCAweDAwIDB4MGYgMHgwNCAweDgwMCAweDAwIDB4MDAgMHgwMSAweGZk
ZTggMHgwMCAweDBkIDB4MDQgMHg4MDAgMHgwMCAweDAwIDB4MDIgMHhmZGU4IDB4MDAgMHgwZSAw
eDA0IDB4ODAwIDB4MDAgMHgwMCAweDAzIDB4ZmRlOCAweDAwIDB4MGYgMHgwNCAweDgwMCAweDAw
IDB4MDAgMHgwNCAweGZkZTggMHgwMCAweDBjIDB4MDQgMHgxMDAwIDB4MDAgMHgwMCAweDAxIDB4
ZmRlOCAweDAwIDB4MGUgMHgwNCAweDEwMDAgMHgwMCAweDAwIDB4MDIgMHhmZGU4IDB4MDAgMHgw
ZiAweDA0IDB4MTAwMCAweDAwIDB4MDAgMHgwMyAweGZkZTggMHgwMCAweDBjIDB4MDQgMHgxMDAw
IDB4MDAgMHgwMCAweDA0IDB4ZmRlOCAweDAwIDB4MGQgMHgwNCAweDE4MDAgMHgwMCAweDAwIDB4
MDEgMHhmZGU4IDB4MDAgMHgwZiAweDA0IDB4MTgwMCAweDAwIDB4MDAgMHgwMiAweGZkZTggMHgw
MCAweDBjIDB4MDQgMHgxODAwIDB4MDAgMHgwMCAweDAzIDB4ZmRlOCAweDAwIDB4MGQgMHgwNCAw
eDE4MDAgMHgwMCAweDAwIDB4MDQgMHhmZGU4IDB4MDAgMHgwZSAweDA0PjsNCj4gICAgICAgICAg
aW50ZXJydXB0LW1hcC1tYXNrID0gPDB4MTgwMCAweDAwIDB4MDAgMHgwNz47DQoNCg0KdGhhdCBp
cyBjb3JyZWN0IGR1bXAuDQoNCkJUVywgaWYgeW91IGFkZGVkICJncmFudF91c2FnZT0xIiAoaXQg
aXMgZGlzYWJsZWQgYnkgZGVmYXVsdCBmb3IgZG9tMCkgDQp0byB2aXJ0aW8gY29uZmlndXJhdGlv
biB5b3Ugd291bGQgZ2V0IGlvbW11LW1hcCBwcm9wZXJ0eSBoZXJlIGFzIHdlbGwgDQpbMV0uIFRo
aXMgaXMgYW5vdGhlciBwb2ludCB0byB0aGluayBhYm91dCB3aGVuIGNvbnNpZGVyaW5nIGNvbWJp
bmVkIA0KYXBwcm9hY2ggKHNpbmdsZSBQQ0kgSG9zdCBicmlkZ2Ugbm9kZSAtPiBzaW5nbGUgdmly
dHVhbCByb290IGNvbXBsZXgpLCBJIA0KZ3Vlc3MgdXN1YWwgUENJIGRldmljZSBkb2Vzbid0IHdh
bnQgZ3JhbnQgYmFzZWQgRE1BIGFkZHJlc3NlcywgY29ycmVjdD8gDQpJZiBzbywgaXQgc2hvdWxk
bid0IGJlIHNwZWNpZmllZCBpbiB0aGUgcHJvcGVydHkuDQoNCg0KPiAgICAgIH07DQo+IA0KPiBY
ZW4gdlBDSSBkb2Vzbid0IGN1cnJlbnRseSBleHBvc2UgYSBob3N0IGJyaWRnZSAoaS5lLiBhIGRl
dmljZSB3aXRoIGJhc2UgY2xhc3MgMHgwNikuIEFzIGFuIGFzaWRlLCB3ZSBtYXkgZXZlbnR1YWxs
eSB3YW50IHRvIGV4cG9zZSBhIHZpcnR1YWwvZW11bGF0ZWQgaG9zdCBicmlkZ2UgaW4gdlBDSSwg
YmVjYXVzZSBMaW51eCdzIHg4NiBQQ0kgcHJvYmUgZXhwZWN0cyBvbmUgWzBdLg0KPiANCj4gUWVt
dSBleHBvc2VzIGFuIGVtdWxhdGVkIGhvc3QgYnJpZGdlLCBhbG9uZyB3aXRoIGFueSByZXF1ZXN0
ZWQgZW11bGF0ZWQgZGV2aWNlcy4NCj4gDQo+IFJ1bm5pbmcgbHNwY2kgLXYgaW4gdGhlIGRvbVUg
eWllbGRzIHRoZSBmb2xsb3dpbmc6DQo+IA0KPiAwMDAwOjAwOjAwLjAgTmV0d29yayBjb250cm9s
bGVyOiBSYWxpbmsgY29ycC4gUlQyNzkwIFdpcmVsZXNzIDgwMi4xMW4gMVQvMlIgUENJZQ0KPiAg
ICAgICAgICBTdWJzeXN0ZW06IEFTVVNUZUsgQ29tcHV0ZXIgSW5jLiBSVDI3OTAgV2lyZWxlc3Mg
ODAyLjExbiAxVC8yUiBQQ0llDQo+ICAgICAgICAgIEZsYWdzOiBidXMgbWFzdGVyLCBmYXN0IGRl
dnNlbCwgbGF0ZW5jeSAwLCBJUlEgMTMNCj4gICAgICAgICAgTWVtb3J5IGF0IDIzMDAwMDAwICgz
Mi1iaXQsIG5vbi1wcmVmZXRjaGFibGUpIFtzaXplPTY0S10NCj4gICAgICAgICAgQ2FwYWJpbGl0
aWVzOiBbNTBdIE1TSTogRW5hYmxlLSBDb3VudD0xLzEyOCBNYXNrYWJsZS0gNjRiaXQrDQo+ICAg
ICAgICAgIEtlcm5lbCBkcml2ZXIgaW4gdXNlOiBydDI4MDBwY2kNCj4gDQo+IDAwMDE6MDA6MDAu
MCBIb3N0IGJyaWRnZTogUmVkIEhhdCwgSW5jLiBRRU1VIFBDSWUgSG9zdCBicmlkZ2UNCj4gICAg
ICAgICAgU3Vic3lzdGVtOiBSZWQgSGF0LCBJbmMuIFFFTVUgUENJZSBIb3N0IGJyaWRnZQ0KPiAg
ICAgICAgICBGbGFnczogZmFzdCBkZXZzZWwNCj4gDQo+IDAwMDE6MDA6MDEuMCBDb21tdW5pY2F0
aW9uIGNvbnRyb2xsZXI6IFJlZCBIYXQsIEluYy4gVmlydGlvIGNvbnNvbGUNCj4gICAgICAgICAg
U3Vic3lzdGVtOiBSZWQgSGF0LCBJbmMuIFZpcnRpbyBjb25zb2xlDQo+ICAgICAgICAgIEZsYWdz
OiBidXMgbWFzdGVyLCBmYXN0IGRldnNlbCwgbGF0ZW5jeSAwLCBJUlEgMTQNCj4gICAgICAgICAg
TWVtb3J5IGF0IDNhMDAwMDAwICg2NC1iaXQsIHByZWZldGNoYWJsZSkgW3NpemU9MTZLXQ0KPiAg
ICAgICAgICBDYXBhYmlsaXRpZXM6IFs4NF0gVmVuZG9yIFNwZWNpZmljIEluZm9ybWF0aW9uOiBW
aXJ0SU86IDx1bmtub3duPg0KPiAgICAgICAgICBDYXBhYmlsaXRpZXM6IFs3MF0gVmVuZG9yIFNw
ZWNpZmljIEluZm9ybWF0aW9uOiBWaXJ0SU86IE5vdGlmeQ0KPiAgICAgICAgICBDYXBhYmlsaXRp
ZXM6IFs2MF0gVmVuZG9yIFNwZWNpZmljIEluZm9ybWF0aW9uOiBWaXJ0SU86IERldmljZUNmZw0K
PiAgICAgICAgICBDYXBhYmlsaXRpZXM6IFs1MF0gVmVuZG9yIFNwZWNpZmljIEluZm9ybWF0aW9u
OiBWaXJ0SU86IElTUg0KPiAgICAgICAgICBDYXBhYmlsaXRpZXM6IFs0MF0gVmVuZG9yIFNwZWNp
ZmljIEluZm9ybWF0aW9uOiBWaXJ0SU86IENvbW1vbkNmZw0KPiAgICAgICAgICBLZXJuZWwgZHJp
dmVyIGluIHVzZTogdmlydGlvLXBjaQ0KPiANCj4gMDAwMDowMDowMC4wIGlzIGEgcmVhbCBwYXNz
ZWQgdGhyb3VnaCBkZXZpY2UgKGNvcnJlc3BvbmRpbmcgdG8gMDAwMDowMTowMC4wIGluIGRvbTAp
Lg0KPiAwMDAxOjAwOjAwLjAgaXMgdGhlIHFlbXUgaG9zdCBicmlkZ2UgKGJhc2UgY2xhc3MgMHgw
NikuDQo+IFRoZXkgYXJlIG9uIGRpZmZlcmVudCBzZWdtZW50cyBiZWNhdXNlIHRoZXkgYXJlIGFz
c29jaWF0ZWQgd2l0aCBkaWZmZXJlbnQgcm9vdCBjb21wbGV4ZXMuDQoNCg0KR2xhZCB0byBoZWFy
IHRoaXMgcGF0Y2ggc2VyaWVzIGRvZXNuJ3Qgc2VlbSB0byBicmVhayBQQ0kgcGFzc3Rocm91Z2gg
aW4gDQp5b3VyIGVudmlyb25tZW50Lg0KDQoNCj4gDQo+IA0KPiBCYWNrIHRvIHRoZSBxdWVzdGlv
bjogU3VyZSwgYXZvaWRpbmcgcmVzZXJ2aW5nIG1vcmUgbWVtb3J5IGZyb20gdGhlIHByZWNpb3Vz
bHkgc21hbGwgbG93bWVtIHZpcnR1YWwgbWVtb3J5IGxheW91dCBpcyBwcm9iYWJseSBhIGdvb2Qg
aWRlYS4gV2l0aCBldmVyeXRoaW5nIGluIGEgc2luZ2xlIHZpcnR1YWwgcm9vdCBjb21wbGV4IChz
ZWdtZW50KSwgaXQncyBwcm9iYWJseSBwb3NzaWJsZSB0byBjb21lIHVwIHdpdGggc29tZSB2QkRG
LXBpY2tpbmcgYWxnb3JpdGhtICgrIHVzZXIgYWJpbGl0eSB0byBzcGVjaWZ5KSB0aGF0IHdvcmtz
IGZvciBtb3N0IHVzZSBjYXNlcyBhcyBkaXNjdXNzZWQgZWxzZXdoZXJlLiBJdCB3aWxsIGFsd2F5
cyBiZSBpbiBhIHNpbmdsZSBmaXhlZCBzZWdtZW50IGFzIGZhciBhcyBJIGNhbiB0ZWxsLg0KPiAN
Cj4gU29tZSBtb3JlIG9ic2VydmF0aW9ucyBhc3N1bWluZyBhIHNpbmdsZSB2aXJ0dWFsIHJvb3Qg
Y29tcGxleDoNCj4gDQo+IFdlIHNob3VsZCBwcm9iYWJseSBoaWRlIHRoZSBxZW11IGhvc3QgYnJp
ZGdlKHMpIGZyb20gdGhlIGd1ZXN0LiBJbiBvdGhlciB3b3JkcywgaGlkZSBhbGwgZGV2aWNlcyB3
aXRoIGJhc2UgY2xhc3MgMHgwNiwgZXhjZXB0IGV2ZW50dWFsbHkgdlBDSSdzIG93biB2aXJ0dWFs
IGhvc3QgYnJpZGdlLiBJZiB3ZSBkb24ndCBoaWRlIHRoZW0sIHdlIHdvdWxkIGxpa2VseSBlbmQg
dXAgd2l0aCBtdWx0aXBsZSBlbXVsYXRlZCBob3N0IGJyaWRnZXMgb24gYSBzaW5nbGUgcm9vdCBj
b21wbGV4IChzZWdtZW50KS4gVGhhdCBzb3VuZHMgbWVzc3kgYW5kIGhhcmQgdG8gbWFuYWdlLg0K
PiANCj4gV2UgaGF2ZSBhIG5lZWQgdG8gY29udHJvbCB0aGUgdkJERiBleHBvc2VkIHRvIHRoZSBn
dWVzdCAtIGNhbiB3ZSBmb3JjZSBxZW11IHRvIHVzZSBwYXJ0aWN1bGFyIEJERnMgZm9yIGl0cyBl
bXVsYXRlZCBkZXZpY2VzPw0KDQoNClllcywgaXQgaXMgcG9zc2libGUuIE1heWJlIHRoZXJlIGlz
IGEgYmV0dGVyIHdheSwgYnV0IGF0DQpsZWFzdCAqYnVzKiBhbmQgKmFkZHIqIGNhbiBiZSBzcGVj
aWZpZWQgYW5kIFFlbXUgaW5kZWVkIGZvbGxvd3MgdGhhdC4NCg0KZGV2aWNlX21vZGVsX2FyZ3M9
WyAnLWRldmljZScsIA0KJ3ZpcnRpby1ibGstcGNpLHNjc2k9b2ZmLGRpc2FibGUtbGVnYWN5PW9u
LGlvbW11X3BsYXRmb3JtPW9uLGJ1cz1wY2llLjAsYWRkcj0yLGRyaXZlPWltYWdlJywgDQonLWRy
aXZlJywgJ2lmPW5vbmUsaWQ9aW1hZ2UsZm9ybWF0PXJhdyxmaWxlPS9kZXYvbW1jYmxrMXAzJyBd
DQoNCnZpcnRpbz1bICJiYWNrZW5kPURvbWFpbi0wLCB0eXBlPXZpcnRpbyxkZXZpY2UsIHRyYW5z
cG9ydD1wY2ksIA0KYmRmPTAwMDA6MDA6MDIuMCwgZ3JhbnRfdXNhZ2U9MSwgYmFja2VuZF90eXBl
PXFlbXUiIF0NCg0Kcm9vdEBoM3VsY2ItZG9tZDp+IyBkbWVzZyB8IGdyZXAgdmlydGlvDQpbICAg
MC42NjA3ODldIHZpcnRpby1wY2kgMDAwMDowMDowMi4wOiBlbmFibGluZyBkZXZpY2UgKDAwMDAg
LT4gMDAwMikNClsgICAwLjcxNTg3Nl0gdmlydGlvX2JsayB2aXJ0aW8wOiBbdmRhXSA0MDk2IDUx
Mi1ieXRlIGxvZ2ljYWwgYmxvY2tzIA0KKDIuMTAgTUIvMi4wMCBNaUIpDQoNCnJvb3RAaDN1bGNi
LWRvbWQ6fiMgbHNwY2kNCjAwOjAwLjAgSG9zdCBicmlkZ2U6IFJlZCBIYXQsIEluYy4gUUVNVSBQ
Q0llIEhvc3QgYnJpZGdlDQowMDowMi4wIFNDU0kgc3RvcmFnZSBjb250cm9sbGVyOiBSZWQgSGF0
LCBJbmMuIFZpcnRpbyBibG9jayBkZXZpY2UgKHJldiAwMSkNCg0KQWxzbyB0aGVyZSBpcyBvbmUg
bW9tZW50IGZvciBjdXJyZW50IHNlcmllczogYmRmIHNwZWNpZmllZCBmb3IgDQp2aXJ0aW8tcGNp
IGRldmljZSBvbmx5IG1ha2VzIHNlbnNlIGZvciBpb21tdS1tYXAgcHJvcGVydHkuIFNvIA0KYmRm
PTAwMDA6MDA6MDIuMCBpbiB2aXJ0aW8gcHJvcGVydHkgYW5kIGJ1cz1wY2llLjAsYWRkcj0yIGlu
IA0KZGV2aWNlX21vZGVsX2FyZ3MgcHJvcGVydHkgc2hvdWxkIGJlIGluIHN5bmMuDQoNClsxXSAN
Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjAy
MzExMTUxMTI2MTEuMzg2NTkwNS01LVNlcmdpeV9LaWJyaWtAZXBhbS5jb20vDQoNCg0KW3NuaXBd

