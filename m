Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3851443CB99
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 16:08:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217007.376835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfjbN-0005fl-2F; Wed, 27 Oct 2021 14:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217007.376835; Wed, 27 Oct 2021 14:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfjbM-0005dK-VI; Wed, 27 Oct 2021 14:08:24 +0000
Received: by outflank-mailman (input) for mailman id 217007;
 Wed, 27 Oct 2021 14:08:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lYk=PP=epam.com=prvs=0934bd4bd6=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mfjbL-0005d5-TM
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 14:08:23 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 584e2738-372f-11ec-8461-12813bfff9fa;
 Wed, 27 Oct 2021 14:08:22 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RD4HSf006746; 
 Wed, 27 Oct 2021 14:08:20 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56])
 by mx0b-0039f301.pphosted.com with ESMTP id 3by7awra5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 14:08:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4881.eurprd03.prod.outlook.com (2603:10a6:208:100::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 14:08:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 14:08:13 +0000
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
X-Inumbo-ID: 584e2738-372f-11ec-8461-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sd/utTyXvWs1bztXD0rO3lRI9iceTJTgjIL9V9VPw2xM+h6//o4wx3NCSd/tb6t4kVA9tJkXT6/Sb78fpcdj2psdzvQF1/4snMMIcFVyNFcVDg8WTau7E14CsxjumpDfRbV5+B46Ih7SGVJcGfRU2dk8c28rKBGaMoXHLLX73xogxz/Y8fmjJ6ppgmEC/7/BMn8iawoY13x5j1ZR6MEbobh3bq0P9tv0owsn4OKR2w1g7yskkVXnLVs1qq7RA6sEPfwJQNT73LuKkl5kY93ohSuFcBj9exikPZNixFShHsVhv4oM5vrlJFn9bu4ichgcelmf6qKD2RnaR0l30IsHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rn3I5RN5vIvThW5WWjLNL3MsWJiUA8D8v+CAnC/faGI=;
 b=Bqscu/bBNOzT/Hhfz2SmyyCiC2meGxNdmQ2ZmQvweCXAXHagR/gFokX5tjPuUnBYHmib6afvcmPq2EjFWWJA1tpZ33bQGDK0p4RDopJBo0QdaiBIcr8EmuZbZsTM97XGmVqqIIGiy0nvLO2MNyQAmgbPhEsH/wYNblqgt5R5I/BuvqSco2+VnTR9VWAgC7XDiwptiI/0Nfe5JcagUqQE9nuYjlIC4FKjFqIEaz2d0uxmk+a1Bf51eEeu7DYI9A+7m755SybRwB6FiyI5pVEtcTLX+VVmmP2fJddYVtNUZZiTAQtbyUNwpluj2Dh0ELx22Kxe3xVoXME5Bl6KThZYxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn3I5RN5vIvThW5WWjLNL3MsWJiUA8D8v+CAnC/faGI=;
 b=eGmSP/umu01mvC9s6YF6YUhYAEZnm6/NDweKP83EJ1vWqQn+LfHRGvAo2F9QkQFhCorawBVrQtei698TM/b7LpWkcwiH8tZTW2oFuVkjFtCnPrX1bdK0pD1l0aiV1h6p6LqmbIeyvGd3ZsFMXWzZz0sRWj5OlVSP5LJTqZOe32HS/ZsmwBITATpIqw2zo8aunI35Tuisi0xqzN6lXP9kC3yilyNq89v7iju+wZS0UeJBvPJJWMTOtjQpHZ08ssaG3/3uy3HZuWHdWR8RAtNtuEec39VA9qTFEM8x2dR5kqpo//adBAeb1zcM8ta+WnP+gujwDJ3DrxdX/eLaVwCt2g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5] xen-pciback: allow compiling on other archs than x86
Thread-Topic: [PATCH v5] xen-pciback: allow compiling on other archs than x86
Thread-Index: AQHXtDtdCEW9atNFMk2qqaldf5A98Kvm/I6AgAATI4A=
Date: Wed, 27 Oct 2021 14:08:13 +0000
Message-ID: <a54ab50a-f35c-26b9-3907-20c014a1120a@epam.com>
References: <20210928073501.433559-1-andr2000@gmail.com>
 <71ce7c97-1d08-9fdf-b217-53eb914a29a6@oracle.com>
In-Reply-To: <71ce7c97-1d08-9fdf-b217-53eb914a29a6@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ecf37fa-9219-4632-6d55-08d99953375a
x-ms-traffictypediagnostic: AM0PR03MB4881:
x-microsoft-antispam-prvs: 
 <AM0PR03MB4881045FCF2A12E99B49E8A4E7859@AM0PR03MB4881.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kKDTZuZ1a+MTcICOGfBfs8L/pfO28kZAzLf8wysiYz/N5eMC804N6RRBFaM4a1beTBUdX839bob7Uxro9J/7+gxAeR8IcVSjgK0RJBJCkL2MDwv/v3FPHWtT77qrwXFS655/lymAUGZFLnj6Smdn9Wi0AMgXQJpxBg38bfwLYSA9gjzwM+T5d3eu+9S4iCMaSm1nyrHQoyHRIuhBIweteiHL8t7FxRBnPuckKOMoq0G3TgdtPo9L7JEzif7LevJw7KHfsIHFcfqBAGVTYUbk/0ykKmp5srjuRXgvD4ITCq0zMVXlDEWWkul0zvnCIb3ketzZpZYlCGaJAH6KWpqSVFjy593y7eE9YqqVhbtNC3qnxDAyXn44YEasubGY3ULz95xMti0equUNYjKaoyVyI2bUXhplE4DIm+MILgkFdkmgRcdpnt7WL2LWbLwIag52NOIuZ42b8ZtfOL3cpyZYSsu+F2RVPLrgA0OXWLHvU2xg132tcRhw52ECkk06BtwoJcjdfTNQOxxHqHQv3lhPqMDr/zLXRMeKUPh6syFbFRBCWxq4O3pZkVVl3RKlwnp4L2Tnb+SPtKV8sUx6Ep0g2xThG1FRZxvVjgryENTW0k3xtdgmhZLqCuVf7iBE1FlZTQQ36ao/Nf89tzVwyAFn5ildFYZ3+MiwvVrHaaUX7j56CB7Vp1mlOweS4jLq5GniCwis7uT2zYdct+E7RIqY6XV1oWmp0HPjyOp1vOe4HGi1RCqRCD1uq6zAAZ9wK7RD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(2616005)(122000001)(36756003)(107886003)(54906003)(38100700002)(31686004)(31696002)(38070700005)(316002)(6512007)(110136005)(5660300002)(86362001)(6486002)(508600001)(2906002)(4326008)(71200400001)(66946007)(66446008)(66476007)(64756008)(91956017)(76116006)(66556008)(6506007)(53546011)(186003)(83380400001)(26005)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U0lJS0Q2MWdNQk93Ryt4R1RkN2tFNkNjR1hLTU15S2N6cXQ5OHVqYVpZZ1cx?=
 =?utf-8?B?cVlHOThKV3VHT0RXRnVDbzFVZG1DWWdSM3J1STNXVjBmYUtpMGFXa3VlRW9B?=
 =?utf-8?B?c2hDMC83Vm9tWXdDRWVJbzllYXBRMnZJMEdKZkhpclRpRWJLdklsbDIwRG9D?=
 =?utf-8?B?MHpsTUo3SEc2bFE2eWZQZXF3S1VYS2JLZ2F4ZmFIMWxOL3lTam5HU2FRSVU5?=
 =?utf-8?B?czlGQXJIQkxxakRaOTFpalRMR3NId2hqMmxQNUVSaVBaV1hoUnd0SmhXNEEw?=
 =?utf-8?B?bFVJalBROXhpN2tKV2krQk5WOTJZY0crTVNsaEt6QUloTGREUDVOZGdySktT?=
 =?utf-8?B?QzB4VzY1VkdQekw5ejZTKzkzRm41aTRGT1hiY1B4UitTZ0wxZktpQWYrcUlr?=
 =?utf-8?B?OXVRQjErb3JIcHEzeHYzOVFkQmNKbmROVVJCZXU2TExkQnhUcTZZR1hNN3Vs?=
 =?utf-8?B?dzVNQ1JwSG9tenFBZVBMb0M4NXZvZExUbEJPMlo3VFl3MWZMU1lRTk4rTnZk?=
 =?utf-8?B?QTRpM0FwZ1RZLzVDeUxEZnB1UG03aUtwOUFwMFBlQjFvVm80amF6d25HdlNU?=
 =?utf-8?B?cXZMZUhNR1R4d0JCanE4ZFhocDRhTERKYk5KRTRRWjQ1TDVPRmdENHdBbytm?=
 =?utf-8?B?M3hEUk5jWnBqR1M5U2JITndpVUY5aDRzVUZOaGgwUU1BLzQvNlZ0Ujhyemly?=
 =?utf-8?B?WFhlWTdZZ0hoNWwwV0lQY2Z0QmUzcFlXcFYzeXZ4Wkw5LzFXRjl2bWp0VWZM?=
 =?utf-8?B?MkExQmpJdVlNbnN4L0Nrb2tzQU9YQ1l4TWhWblFYWGpDYlhCOFdZb0t5RmVs?=
 =?utf-8?B?Q3V3Zi9Ob09janZJZ1BtZEdrOEtjU2o1M29ncVhxTitRTjdXRGt1UzdyZzVr?=
 =?utf-8?B?VnhCYzlpVWhXL0R0Mll3dGFYdThjcEduWjF4T2YrVkRRV2I5cUk3bVJoaDdJ?=
 =?utf-8?B?bHVsTmRyeis4VFV1ZFRIUm8wNTFEWjRlSGNKUGRXRG5lc0tWdEsvLzFsZHhy?=
 =?utf-8?B?Zkt2eThWdUJRbHU3VHFabVJiTlFYZ2p5Y0hPL2tTNHZreVBUUEZhZW16VGhF?=
 =?utf-8?B?VnJiMTdrcU5oVU8wYkVPa0Z6YkowcUxzTVdiU0dvUURWeEZURWpERzZkYllR?=
 =?utf-8?B?dEJ2bVJnck1yOTM0dENjZzBZSzRCU2xsZW5wM2RNT1pUeUpDZlErbm1zRHBn?=
 =?utf-8?B?UDlRc29tUDlmY2MzN0dtOUNFSU13NGdveVVwS09MZ2puRGx1M0J6MVJsWDRZ?=
 =?utf-8?B?SFZOVkhhSlRQcW1qODh2alBjbHpwcWk2NE42Z0d1YWx0c1U4RjAyT2R2TUY0?=
 =?utf-8?B?ei9ob0gzM012eU4rYlYvbTQyTlJDVVIwaHdrcDhDSWtzMldyZnFHbCtmOWw5?=
 =?utf-8?B?VVE0RUxCdmFZZlZyQUprSmhBcm55QXd4VGZGMU1PL09pclQzVWh1ZUdDdXRR?=
 =?utf-8?B?SmpEdlJFWXgyRmpGQ0g4L3Z0OGhKQ2haK2l3aFZuM09ad1ZnZDEraTE4dmFZ?=
 =?utf-8?B?eDh2a1psNzZtdEhha25ieXNQV1JVaU1XQzdZemRmTU9oUlRBQXBnUHFOL0ow?=
 =?utf-8?B?YkxFMFJnc0RqMnc3d3JGN1ZYbFoyNjJTcE1ERWdHYkpLeWJOK3RnVjBsWW5M?=
 =?utf-8?B?ajI3UFZDcFFJSUFGOUs1VWFrb3N5SmJZTElqMi9oRGwwRC92aDhPTUwwSHVF?=
 =?utf-8?B?bDYyZzREVVN3Tm9pNkhjbWNQdlo3ZE5MYy84MVBkNWw1Q25KblYrVU5MYzBB?=
 =?utf-8?B?TjFRM2N4T3EzRm5ETjNKampKQy9GMDZHaTNXNFhibFBNellQdEZwbE5WcU0w?=
 =?utf-8?B?YnpQNXE3UEVqL1h5NlJiSS9sQXVjc2VLYmFyakNwcGVZazZQVldYZ2tYTVNx?=
 =?utf-8?B?VjVXZ05xeW5pQTVmQ0ZGd1JKS3NqMHFnZE1QMmhqQnlHSFJYZHBNUEhxZ2NC?=
 =?utf-8?B?UlVxZU9BVzJDaGlpdlg5dDhlaWFVMUlMeGVCQmJTNnEzbmk1bmRMR3FHZVIz?=
 =?utf-8?B?bU8yaW84ek9zNE1mNkVVT0ZVUjcvOGJLL0YvcXZwZjFhcTZIUWdxVVdUVFlx?=
 =?utf-8?B?Z0JDeENJN0k5VGZjcjliMkRDQ0FrbEh2WVROVXFST3pNd1R0NVlaVHMxeWlu?=
 =?utf-8?B?elpkMUF4bUp2M1lRSk53TTVUNk1ocVltelh2TjZWUnE0MEd5WkxlTWhVZk9V?=
 =?utf-8?B?WkpxNTJzV1EreU9vVWJTeFVDeHlVMEFtbVQ2R1IvcnBpYlk4bmJVWVlhOFh0?=
 =?utf-8?B?RmlYQ3N6MUFNV2ZuWTJYVS96dmNBa2VLWTNOUjJ0Y29pNm9weGluN1dQK2ow?=
 =?utf-8?B?QXZuOVRhUnZJRldEMWdRd1NXeVJaNGhsTEd5UVE2a1djTUd6NFluQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63AC4E6A6599E646A8110B071D4793C1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecf37fa-9219-4632-6d55-08d99953375a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 14:08:13.8529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4LBRjLfEQZBabVc7SHcdH05vEDqlNy9lljYGqYdGKPwPalIvGs+weq4iJ1gCjrphTTkzC7e17h8etUxt/PD2/PtA3kz/SgOq0eBSdP1LToB60KC5jbTX8MJMiiEVE5Iv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4881
X-Proofpoint-GUID: -GGOC06-1D2eJXhRrbBJgsySY5UCtfVZ
X-Proofpoint-ORIG-GUID: -GGOC06-1D2eJXhRrbBJgsySY5UCtfVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270086

SGksIEJvcmlzIQ0KDQpPbiAyNy4xMC4yMSAxNTo1OSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOg0K
Pg0KPiBPbiA5LzI4LzIxIDM6MzUgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0K
Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtv
QGVwYW0uY29tPg0KPj4NCj4+IFhlbi1wY2liYWNrIGRyaXZlciB3YXMgZGVzaWduZWQgdG8gYmUg
YnVpbHQgZm9yIHg4NiBvbmx5LiBCdXQgaXQNCj4+IGNhbiBhbHNvIGJlIHVzZWQgYnkgb3RoZXIg
YXJjaGl0ZWN0dXJlcywgZS5nLiBBcm0uDQo+Pg0KPj4gQ3VycmVudGx5IFBDSSBiYWNrZW5kIGlt
cGxlbWVudHMgbXVsdGlwbGUgZnVuY3Rpb25hbGl0aWVzIGF0IGEgdGltZSwNCj4+IHN1Y2ggYXM6
DQo+PiAxLiBJdCBpcyB1c2VkIGFzIGEgZGF0YWJhc2UgZm9yIGFzc2lnbmFibGUgUENJIGRldmlj
ZXMsIGUuZy4geGwNCj4+IMKgwqDCoCBwY2ktYXNzaWduYWJsZS17YWRkfHJlbW92ZXxsaXN0fSBt
YW5pcHVsYXRlcyB0aGF0IGxpc3QuIFNvLCB3aGVuZXZlcg0KPj4gwqDCoMKgIHRoZSB0b29sc3Rh
Y2sgbmVlZHMgdG8ga25vdyB3aGljaCBQQ0kgZGV2aWNlcyBjYW4gYmUgcGFzc2VkIHRocm91Z2gN
Cj4+IMKgwqDCoCBpdCByZWFkcyB0aGF0IGZyb20gdGhlIHJlbGV2YW50IHN5c2ZzIGVudHJpZXMg
b2YgdGhlIHBjaWJhY2suDQo+PiAyLiBJdCBpcyB1c2VkIHRvIGhvbGQgdGhlIHVuYm91bmQgUENJ
IGRldmljZXMgbGlzdCwgZS5nLiB3aGVuIHBhc3NpbmcNCj4+IMKgwqDCoCB0aHJvdWdoIGEgUENJ
IGRldmljZSBpdCBuZWVkcyB0byBiZSB1bmJvdW5kIGZyb20gdGhlIHJlbGV2YW50IGRldmljZQ0K
Pj4gwqDCoMKgIGRyaXZlciBhbmQgYm91bmQgdG8gcGNpYmFjayAoc3RyaWN0bHkgc3BlYWtpbmcg
aXQgaXMgbm90IHJlcXVpcmVkDQo+PiDCoMKgwqAgdGhhdCB0aGUgZGV2aWNlIGlzIGJvdW5kIHRv
IHBjaWJhY2ssIGJ1dCBwY2liYWNrIGlzIGFnYWluIHVzZWQgYXMgYQ0KPj4gwqDCoMKgIGRhdGFi
YXNlIG9mIHRoZSBwYXNzZWQgdGhyb3VnaCBQQ0kgZGV2aWNlcywgc28gd2UgY2FuIHJlLWJpbmQg
dGhlDQo+PiDCoMKgwqAgZGV2aWNlcyBiYWNrIHRvIHRoZWlyIG9yaWdpbmFsIGRyaXZlcnMgd2hl
biBndWVzdCBkb21haW4gc2h1dHMgZG93bikNCj4+IDMuIERldmljZSByZXNldCBmb3IgdGhlIGRl
dmljZXMgYmVpbmcgcGFzc2VkIHRocm91Z2gNCj4+IDQuIFBhcmEtdmlydHVhbGlzZWQgdXNlLWNh
c2VzIHN1cHBvcnQNCj4+DQo+PiBUaGUgcGFyYS12aXJ0dWFsaXNlZCBwYXJ0IG9mIHRoZSBkcml2
ZXIgaXMgbm90IGFsd2F5cyBuZWVkZWQgYXMgc29tZQ0KPj4gYXJjaGl0ZWN0dXJlcywgZS5nLiBB
cm0gb3IgeDg2IFBWSCBEb20wLCBhcmUgbm90IHVzaW5nIGJhY2tlbmQtZnJvbnRlbmQNCj4+IG1v
ZGVsIGZvciBQQ0kgZGV2aWNlIHBhc3N0aHJvdWdoLg0KPj4NCj4+IEZvciBzdWNoIHVzZS1jYXNl
cyBtYWtlIHRoZSB2ZXJ5IGZpcnN0IHN0ZXAgaW4gc3BsaXR0aW5nIHRoZQ0KPj4geGVuLXBjaWJh
Y2sgZHJpdmVyIGludG8gdHdvIHBhcnRzOiBYZW4gUENJIHN0dWIgYW5kIFBDSSBQViBiYWNrZW5k
DQo+PiBkcml2ZXJzLg0KPj4NCj4+IEZvciB0aGF0IGFkZCBuZXcgY29uZmlndXJhdGlvbiBvcHRp
b25zIENPTkZJR19YRU5fUENJX1NUVUIgYW5kDQo+PiBDT05GSUdfWEVOX1BDSURFVl9TVFVCLCBz
byB0aGUgZHJpdmVyIGNhbiBiZSBsaW1pdGVkIGluIGl0cw0KPj4gZnVuY3Rpb25hbGl0eSwgZS5n
LiBubyBzdXBwb3J0IGZvciBwYXJhLXZpcnR1YWxpc2VkIHNjZW5hcmlvLg0KPj4geDg2IHBsYXRm
b3JtIHdpbGwgY29udGludWUgdXNpbmcgQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORCBmb3IgdGhl
DQo+PiBmdWxseSBmZWF0dXJlZCBiYWNrZW5kIGRyaXZlci4NCj4+DQo+PiBQbGVhc2Ugbm90ZSwg
dGhhdCBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EIGFuZCBDT05GSUdfWEVOX1BDSURFVl9TVFVC
DQo+PiBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+
IFNpZ25lZC1vZmYtYnk6IEFuYXN0YXNpaWEgTHVraWFuZW5rbyA8YW5hc3Rhc2lpYV9sdWtpYW5l
bmtvQGVwYW0uY29tPg0KPj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4NCj4NCj4NCj4gT2xla3NhbmRyLA0KPg0KPg0KPg0KPiBDYW4geW91
IHBsZWFzZSByZWJhc2UgdGhpcyBvbiB0b3Agb2YgNS4xNS1yYzc/IFRoZXJlIGlzIGEgYnVuY2gg
b2YgY29uZmxpY3RzIGR1ZSB0byBjYWU3ZDgxYTM3MzBkZmUwODYyM2Y4YzEwODMyMzBjOGQwOTg3
NjM5Lg0KPg0KSSdsbCB0cnkgdG8gZG8gdGhhdCBBU0FQICh3aGF0IGlzIHRoZSBkZWFkbGluZSBm
b3IgdGhhdD8pDQo+DQo+IFRoYW5rcy4NCj4NCj4gLWJvcmlzDQo+DQpUaGFuayB5b3UsDQpPbGVr
c2FuZHI=

