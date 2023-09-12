Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266E279DCCD
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 01:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600861.936671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgD17-0006qY-DU; Tue, 12 Sep 2023 23:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600861.936671; Tue, 12 Sep 2023 23:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgD17-0006og-Ap; Tue, 12 Sep 2023 23:42:01 +0000
Received: by outflank-mailman (input) for mailman id 600861;
 Tue, 12 Sep 2023 23:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dd3m=E4=epam.com=prvs=3619f40973=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qgD15-0006oa-Kq
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 23:41:59 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5b959a1-51c5-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 01:41:58 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38CKhMSe024185; Tue, 12 Sep 2023 23:41:48 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3t2y9908qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Sep 2023 23:41:48 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7286.eurprd03.prod.outlook.com (2603:10a6:20b:2b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 23:41:43 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::e9f8:ffda:29cc:3dbe]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::e9f8:ffda:29cc:3dbe%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 23:41:42 +0000
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
X-Inumbo-ID: f5b959a1-51c5-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrViNF5Flpu3LMtwBY5n9XmOBow3sow9e+4+0lR/jwiIncNXwvHR6omtmXjzzhW68Wh2SAfG6ZZB32RteSOya7Wbl0tnJaMdOKnaSCn95K97YotLTZf1wSKlQ9qZFW16gNwYaVCFTUJRWMHaMiP60IgkCUtFJASHtHiy0WlwmbH6BxIRAg2RkUttn513Fg8RdJdwNAxfm9W9x6fZXZvw7hhJ4wm4EjLpkGFYwlHIscqlTkgNesqL7KiN4p2tXP6wStXpnSMARTixSyyUmrtMQo3i27R56UnPy7VxcltZMOA2BQy9gozWGed6seapbGryds+pn1JfTkcRU5MrwlpFgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByCiywusZZZLVTSAT8Os38Och+OnuvlsrVYSwBJUIE8=;
 b=l7vI+wgfJozDMLQcpJsW9XTcVFZRdnjrc1QpRQL9QxN4y1Zmbwk/zc7ooIAz0+QChVfCuCS84aZaGhkzu6sj5G+e2tycxaBmN4cJnXbLhYQunF8eHERM8Jp04tLWdIETITAZ0LVjsDVbpJF6ULqQ7UyRVnk45WroA5opwTR0BLxn/Y3FKPqyBR6vNaM/ZilvtabM4aIJ9WqymNQ208GKRFJ9W3ijURWLOT5Tr0KtHA4dIG4KmwV6Bn3BDaHdtk0BfWggC+110k0PlKFWj/zV99w9w0jfXbnK7/oMs88qUB6dKUJqu9siemHJ+fd8/3puU4ZQ86m4MHW76BHByomDBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByCiywusZZZLVTSAT8Os38Och+OnuvlsrVYSwBJUIE8=;
 b=sEd7pzlQE+bVaMIkwYMwCnNGKPuQtdO21lEzH1yE7QP8rGdnig12tX3uDQUZ5HeaettL9vxfWg7yyYEvpG0edgmruw0Db+n953Y95A+YS6Go+aCcbQ8iVm0xwP1pcELGgAM/+VuM5AnyPGnsbzMhv7QG2YYbwOiRDK1aPs0YObV0bKTsLzZooj8j2B4LLjbpa9Jch+ITPzfX4vlvwDKjrEz1tEPL5aLpYEV1S+KrEmcJHLtnLlqOYwt+57Rpg1TEDpj+UdxZfhAZp6FBIGqSJKw8SgEtohZ7/v/3JPy/jmu+DK6koVglv4IPGU/7tHgPuJw0+AcN7ZYj3CsAVjYvfQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien
 Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>,
        Paul Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 04/16] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v9 04/16] vpci: add hooks for PCI device assign/de-assign
Thread-Index: AQHZ2s9Kc9kNunOnfUurMYypVVbdQ7AXA+KAgADqFoA=
Date: Tue, 12 Sep 2023 23:41:41 +0000
Message-ID: <874jjzhsd4.fsf@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-5-volodymyr_babchuk@epam.com>
 <77e2dbc0-c224-4c1e-72a0-5b19aa76ba0b@suse.com>
In-Reply-To: <77e2dbc0-c224-4c1e-72a0-5b19aa76ba0b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7286:EE_
x-ms-office365-filtering-correlation-id: 2722a01a-5881-4923-42aa-08dbb3e9d0db
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3whGvaP+duoz3uQ7LN5ku0hU1+tjgODKZCnUqflBTIB4j4w2hCBG25XR1Zf51p0Jph5NPYKvtTXTXnAj7veBOu7cIkntV9BDPQnneL4Woc5UI8B8l5YVT84HnN9T9uWIypI73ahsqa+fqxnpe2CFXFPE6FOKuVxJ4fYLChzZylM3KA/BIxD+9mYCrSeJ/y2ASi9kngD4lzXPxRcGr+qhqvp4dTjLataY7yc4hikt4qZOcEVoIL0o23qYxBayzbuxTmgvP/oLtoaFaJOKm5YqoBM+4EO0Iq54M9eDNBIgi2+Lna5kcq0PmvAPHJVKQ+FzJfUPF4itL0o0i9QEsukDG4thVYolG8yfFvIWp2MMn3a6psMcRzpnljL0k0OnH8QEASWOfzJEyk5dkdGYkNebokX3R8OVKMZa5RlHx4oV0Poqu7/QuHnu4gn5zlxRHMetStaYo7ywsx1enleQBOsUZJRVLHqTSOE8f6EnMfzg7ZXbOQBPON/SUgEil+fZSxGpwsK+nzYL34RnXe0ZZHBa4tXqx0UZvzCGr3gqiXY8uEMXOKfIWh2uxJ8K6TBbDT4njK6bJp0NpQY9+Ahn9rEh9b1Gd5fRwK+iu6czy9aPZadIsbMAWuXsGE+Lpj+7EM62
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(396003)(346002)(376002)(186009)(451199024)(1800799009)(7416002)(6512007)(5660300002)(55236004)(71200400001)(6486002)(53546011)(6506007)(26005)(478600001)(2906002)(2616005)(83380400001)(8936002)(4326008)(6916009)(66946007)(41300700001)(91956017)(122000001)(8676002)(38070700005)(76116006)(38100700002)(54906003)(66446008)(316002)(86362001)(64756008)(36756003)(66556008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?2RHOet4OR7dwCpNXscSc2DMN6JHjCNT9TrkrrI3gj2N8yN9aVLmpoWZx5a?=
 =?iso-8859-1?Q?HQuMRnTd902tqmGu1gKl0J5oCN37nXY2LicnQVA584bWjuJ0c9YbF6yPQD?=
 =?iso-8859-1?Q?u0JMo4tKcPhpS6zSkgtexnEIlVImBuPVvhYZZOr9w98PSBgkDoEuz88M0M?=
 =?iso-8859-1?Q?S2tk8oyXMtbpCyLL2LG7aOpQukY6HTxeQ2bkKOLn+vphPr630P7ShAoyyV?=
 =?iso-8859-1?Q?9QPpoS+ocNeZmQHeBTLs89ZeTB4/Vgo6AwExtEEin6tZnGMJRY5fvCu7y2?=
 =?iso-8859-1?Q?3pd+g60P7NDab0DnkhVduQ8cbHbWMnI93yjwLAtZHfgbIO5t2+YIb4FmCB?=
 =?iso-8859-1?Q?ybeWUvs1nosI5Xq4iC+CkNPmka1jZsvZuPZPkVMduX78Zfp/kuPHatUAeP?=
 =?iso-8859-1?Q?TleupgUXvPSIUm/gyM8awjnSfCw30+CC/iM4oko+wuhwYKOM+AuZA6yXVO?=
 =?iso-8859-1?Q?OAi7SaHdBx45ugRIBiLthUu0g02RhOrzU9AJSCbI63CP7I8dQ+UIexK+wb?=
 =?iso-8859-1?Q?AyideE3/twZCQzCk90kkTFoguZ7lEK/JuHccGbhfMU1LxVm6YE0FG4NK3G?=
 =?iso-8859-1?Q?A0pu5mIuYy+B2gdnBGMfpSWtLxmyJqZGZ6RjSAPQhl7RafuNoelGgTZavz?=
 =?iso-8859-1?Q?Lu3d9MOpnlRPA8bBrXGpyxJuI/lFL8jh1W8R5efP8/ZgDBS3C/ERH/GIwE?=
 =?iso-8859-1?Q?o8vYXXB9SXiHZ+YrPoPTua8GYwcdnlBV1pWGv2wlPygq4vMKj/e1qdszHF?=
 =?iso-8859-1?Q?BYrXQoZo0EBDKW7k2MLmxql9FPJyoH+FSqaSfmAwXfPL/Bdo90tWK5Lyd+?=
 =?iso-8859-1?Q?EOk0gmq6foJjxEM5hxYKlff8IODEZAb79fRVG+Y3JLPJbUR4+AioiXJVTM?=
 =?iso-8859-1?Q?60jhaUQtUJoTPdFVGl37CTp+qXmQA9lNERBTLnCsTJQgInhwCTr57PmLcC?=
 =?iso-8859-1?Q?rnvnPUz89iSNEO7J6fI9WX9LnzJhZ1DICOpU/j2LT3vokDtn/SclZnMyl7?=
 =?iso-8859-1?Q?I8ztQvjPdjb9/CUYW5Jx8isPvW/h19KAzE99uLIdBBhey/1fHcXOJ2dudF?=
 =?iso-8859-1?Q?C5PSYO2iSNiPOMSjpWM44YO3LQZxX8duJ5N+gQLtJZLsulXBHQXjp8GGaA?=
 =?iso-8859-1?Q?TfYLFnnkHpJvghapQAdeGYFsZ1v4zU3nN252AYj0whppoEgRZRcD6KNpGA?=
 =?iso-8859-1?Q?ByDME2Tf7ZigVl0RWrh91ocnBAQADJpJpgLoOB9WVwhrisMxpddyu2LILw?=
 =?iso-8859-1?Q?n5AjTdyhBTKWl2yfOZBhHWbeP+eNXB5/6OCP3DXvFZhSRaNtQCP23O+kXm?=
 =?iso-8859-1?Q?5flffXnUrotIukAalMDkjnrYF1nV/XslgBVtQ8JQP03nNxFvHcBmYSs8Jd?=
 =?iso-8859-1?Q?kTrTiWSCyTdG9bcFawuw/aOEEKtV4rV10KptfWebnlbnnOq7UW9w4l2Bc/?=
 =?iso-8859-1?Q?iOg+KtZz9xJmYg0uYZmEbIbQo0VGz1LCCdncMOAIXLEHMLqrLvZzla84+e?=
 =?iso-8859-1?Q?KK/S3Kc+K7o9cKxgITgDC172ESO522ZSld9VrZ0xvSA1YewDE6wUsIoAvk?=
 =?iso-8859-1?Q?DxopH+aN40xgTCA6OOlTUuBkrK01xzVw+f0rztUto4FBRlsxQxQVolhnIN?=
 =?iso-8859-1?Q?cFCP0Wq7Aw/hB1elqjbKjVeFTvaPFqWitKgdDHBLN50a0hmmjrBHaqXQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2722a01a-5881-4923-42aa-08dbb3e9d0db
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 23:41:41.5345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9TLf+7br29Juq/aXhjC5cUD1VVMb781fzaPMlraacbVoA2H+GWxlblzTaMMN2j8/tvpFQA4KF2awwMtb4IIlphXxk2Egm20QRYyUkM/Yep4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7286
X-Proofpoint-GUID: kg7lmJNT3NUUY6WgQwM6fy2sdEt4zpMq
X-Proofpoint-ORIG-GUID: kg7lmJNT3NUUY6WgQwM6fy2sdEt4zpMq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_22,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 mlxscore=0 clxscore=1011 mlxlogscore=919 impostorscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309120201


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 30.08.2023 01:19, Volodymyr Babchuk wrote:
>> @@ -1481,6 +1488,13 @@ static int assign_device(struct domain *d, u16 se=
g, u8 bus, u8 devfn, u32 flag)
>>      if ( pdev->broken && d !=3D hardware_domain && d !=3D dom_io )
>>          goto done;
>> =20
>> +    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
>> +    {
>> +        write_lock(&pdev->domain->pci_lock);
>> +        vpci_deassign_device(pdev);
>> +        write_unlock(&pdev->domain->pci_lock);
>> +    }
>
> Why is the DomIO special case ...

vpci_deassign_device() does nothing if vPCI was initialized for a
domain. So it not wrong to call this function even if pdev belongs to dom_i=
o.

>> @@ -1506,6 +1520,15 @@ static int assign_device(struct domain *d, u16 se=
g, u8 bus, u8 devfn, u32 flag)
>>          rc =3D iommu_call(hd->platform_ops, assign_device, d, devfn,
>>                          pci_to_dev(pdev), flag);
>>      }
>> +    if ( rc )
>> +        goto done;
>> +
>> +    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) && d !=3D dom_io)
>> +    {
>> +        write_lock(&d->pci_lock);
>> +        rc =3D vpci_assign_device(pdev);
>> +        write_unlock(&d->pci_lock);
>> +    }
>
> ... relevant only here?
>

There is no sense to initialize vPCI for dom_io.


--=20
WBR, Volodymyr=

