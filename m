Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FEDABEC12
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 08:44:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991512.1375344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdBZ-00065A-G8; Wed, 21 May 2025 06:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991512.1375344; Wed, 21 May 2025 06:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdBZ-00062n-DU; Wed, 21 May 2025 06:44:17 +0000
Received: by outflank-mailman (input) for mailman id 991512;
 Wed, 21 May 2025 06:44:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RySz=YF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uHdBY-00062O-JL
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 06:44:16 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2414::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01a5dcb8-360f-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 08:44:14 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ1PR12MB6052.namprd12.prod.outlook.com (2603:10b6:a03:489::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 06:44:08 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 06:44:08 +0000
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
X-Inumbo-ID: 01a5dcb8-360f-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R51JgBn77qHVkzoAg60Nk3BIZZWpGG48KiW1OdLgR4wRtV7e41XxkdJL7cOhnrqO0KMycaAuo3WmHS1ug7aHCYeRdc9FhZOd8KRroxXxOsDC0N1mcwHVp83TxTwQbyeyUnSQkrXXvRhvBxh1ipheVKmA9fP4TDICHyPG3/bF5rfm/m3UDkDK/W2demccf5mQc/ykRh9L9XxqwhnNKKjsVjj00k9OO5mu1eXVCBOhQXOG2Oq9i2YIwIfOvii1C4TgUDs3fXmppdJeQZVJq6qE0gpNZUPijUWD3kH2Wao5RuMF3B/1GQSS0W7mBi3MnF7eyBRKIXNs7TAc4dKJhTXFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtjVC67YxlCZqbn7KmV2mmInRoQ+z/Gt965b69Z6vZk=;
 b=L2Ul8Lszv5494jSZ2hF+4nZggNT0kn0vZGjjLC17fa6sfnIR474B4aKOXSmN4ZSxWDmmntHmoOxGUGAD/d2PFYGDESNopETYfNQJMZ94bqMvsZYiknvQ1hfxe3m3RgR/v0MUQ3uFy0YnnpSEutHuNcp8/N3N6YdVsYaJ7AJYsnvdwXt65w85qDAXbzDkD3Il1XHaczn9XDK5j/hK2/ftTDurShgKQGvs9WOCFlNRrQx8N1nVgsA1N381oAdgJ+OFVBbuhYXpXd/W/b4enGu75vtxqPnYvg4zN0dGJwLJHnx7rV1liBBW6S+XhnJtvDrY30nQ2YjT1X+uIBl+CUIJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtjVC67YxlCZqbn7KmV2mmInRoQ+z/Gt965b69Z6vZk=;
 b=P64J+dkOksNCXCujqd5NanhnES9h1lV4LYro9HobpDLPZF3uDceNEoRqWoUX163DAgFlI3sL524/0MLFZu3RCGqzAutY9+vXItd+kLUyfIXbEizOCIEC8AAlz0dUfYZhCCDxTzy8/OgHEj9gmzeDLop8xkVnryhM/+puAh3hMOg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
Thread-Topic: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
Thread-Index:
 AQHbwMGevTfR886wakahq6ntIeNmMrPYfnSAgAGVuQD//4B5gIAAiU8A///fQoCAAAM5gIADLxQA//+BMIAAES4rAA==
Date: Wed, 21 May 2025 06:44:08 +0000
Message-ID:
 <BL1PR12MB5849DF34D5EEBC288E935F80E79EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-4-Jiqian.Chen@amd.com>
 <b569f90b-673d-44c0-b350-8a6f5f3c8d78@suse.com>
 <BL1PR12MB5849E0E13D669CE6B2755399E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <bcdc0848-0c12-4ee0-b923-c7d5243bf097@suse.com>
 <BL1PR12MB58494740C0B258C63C3EBC08E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <20d48f86-d7fe-47c8-89ab-61d816e1d6e9@suse.com> <aCswbbh-0GTdr1tr@Mac.lan>
 <BL1PR12MB5849FAED8343F6F2D2C68BA5E79EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <79ae134b-f364-472f-b9a2-eeb1ff55c6fc@suse.com>
In-Reply-To: <79ae134b-f364-472f-b9a2-eeb1ff55c6fc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8746.028)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ1PR12MB6052:EE_
x-ms-office365-filtering-correlation-id: dc4b8652-40ec-42d4-4240-08dd9832e353
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?JVk+0dPYHWeSFZtH4Twap4DhxonZgFso5G9Xdd0HXxFBnUHFyPpJWejDjg?=
 =?iso-8859-1?Q?ZglYnA0M8HnvkhUMY+Pj98n4dG0jimz+MglyWidNMuCtbnbYgpYNeEPf7o?=
 =?iso-8859-1?Q?Qill2TJubSTq73S/JUjVVd9Rb9ja83XfBOsjxNHbWae9SmgvvU3aozQPKx?=
 =?iso-8859-1?Q?38bH35zwBYjsEFWHEd5wGpOo4791p3lGUHhEPZiTuqLTscJH8KK7sQbi+H?=
 =?iso-8859-1?Q?goF6eHvgq9hxDQt3w6I0YSOQIhataJ4Wal0IBnqhWGAILf9IXSeVOJmGpz?=
 =?iso-8859-1?Q?KV7CFsBaYJ2OTHbBNwW0sASmi9Sl8hm//vO575spJ9AJe2pWU+thGB6OWB?=
 =?iso-8859-1?Q?MZC6YA0fM1PwyFUddq96qBw+gml3fkL/X7/UhjD1H1q3OgA72YIoDpE4xc?=
 =?iso-8859-1?Q?4MOPPq/xZA0FGke3aDrxZzAAN6zM4o1yfcTGsAcGzXa83Pq6wh2OZaBVEz?=
 =?iso-8859-1?Q?/k9AC/oqIYw2NsYBS44Ocy/Y8Onak5a9q8DhMyqBydRf08go/sA9w7rOQi?=
 =?iso-8859-1?Q?xwpcMG9QAH40GR6T34fc03oNK4QHN2o0KrpJQK8xBCmXu3dOQjIaWWXTYY?=
 =?iso-8859-1?Q?G90+hg4Z6m/mwyhHwVMdJv2MCGwnT+YVbZkvgwGEMMnyowuil8RLqzOIxJ?=
 =?iso-8859-1?Q?de0y6FqknOW1o+tTkU4FPgCW8oNE6Ig08BQDwCDPnd+Umef9N6ChwBjn1N?=
 =?iso-8859-1?Q?fCmlEaxdq+idXbxoxwBRqofGmZUzXGemyH3SsNJTI/E4+FmgdK3aMuwdai?=
 =?iso-8859-1?Q?KyJJgVCnuG96q078GlHXl5KqATfZyNy9B9S4QOB0H/LhS9X/czaHZlaGpd?=
 =?iso-8859-1?Q?rwlJpg31Jc66Es/L3yqt4rLGifjCM5luLaYLFw+lhrknef/H1JsPdl/9Jf?=
 =?iso-8859-1?Q?+7aFY8b+oHvF/yUlhnzP4kiH1f98JRUM9R/GY3TmhLtJyo3GSwW6Ba/u26?=
 =?iso-8859-1?Q?SSKBUxoILKy2VOIgh6AQ6LYvudPD+ef60EvKsVnzJwC9vjA6P2Vp3F3p4b?=
 =?iso-8859-1?Q?AvRZghXciGGD0DheRcGh4xeKcSdvS+N6ukpWq5AZ85uskHYOmFMltKR7zb?=
 =?iso-8859-1?Q?/EDuOQEUhOohiiQ79qUMm6/2kRPjm9FW9o05Mv6Ss7mz654xYUvVM899gN?=
 =?iso-8859-1?Q?6312X6Jfx29rbRF/Ff5flr4N+hLtmQVT4UJs0Q9H/f06h6tA5m7qqxdwJS?=
 =?iso-8859-1?Q?kGs3mBRK1CCww1azwd9dDqZw7DiAbfPt5BSRH1lT9h4GL9ZIe8w7yzE0iY?=
 =?iso-8859-1?Q?+jqTqDz8+ZTKHdXxIhvfN3eyE7H+N0eyFLZJI78/3+Ot5qq+qba20T1Ow9?=
 =?iso-8859-1?Q?bwyIl391lvN/f+gWs9XfyqkD4vBGV2dNR1wSJqEUbaFq5I1O4CF2Ev+O9w?=
 =?iso-8859-1?Q?UFVe2iSHVXxq25Eoui5BRgNrR+DL+LRJYD8qFrsEqdZpn6O6ZBc29QNLkf?=
 =?iso-8859-1?Q?CGIVveuYK79ZF01fCY6RQIuEecayUf7Vc1lf2VROYwGcJsSQOUiAL5xrn/?=
 =?iso-8859-1?Q?S8HjxhQv7UrBR+OZ4dglMgpU0aL98FTUD7dAzWwk3MCA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HnsNl6BsFWfAlWF4SzPXCuO7jtHCvEciwEzPc+9a64QqTQrXPoqZRq5BzU?=
 =?iso-8859-1?Q?R3NP3Yx68I0MpkcWg4ZhM9D2kRDgY1uuDIXAYAV56FmJl7VqhJpe7h07IB?=
 =?iso-8859-1?Q?CIbzNN2FGgkqEw53mOkUY6FMIcXRKdGnZQxNVvJreionHR2GQ0McepihG6?=
 =?iso-8859-1?Q?/GBnURaO1574RzucatyOlRtRAlaQMLb5ijdyHY1+EpqGHp70OMv7VrahM2?=
 =?iso-8859-1?Q?FbGrnvKql1UXhRXaU4CWm6q7HUOuN4QaTF4pnAzNj4gNTj6ZvRHKdlLuHq?=
 =?iso-8859-1?Q?uKkeajqxLORDGpy7LEZw8c3QXYcKBCwhkNtkQvhbXWvcGi+41/8wY6OizY?=
 =?iso-8859-1?Q?0rJ4NEvzb8N8ejYkQI++pxoOmUpXg8Bhs/GSpD0RvsOGUakr6oTGTXj1AR?=
 =?iso-8859-1?Q?M71y0iSXKQHOBS5b/prgkpqe4ZQtT41bEaokgZodrxnswQyywEc/UKQJmI?=
 =?iso-8859-1?Q?kqLu53BP7X3q5PWRZ/zwOMS539JWsnjgmVXkYSmcISWpOegssKBhXVDxhX?=
 =?iso-8859-1?Q?P6pvD4UP7SdyaFhUs7buHxAwsLCF4GI43FQpX2nGKGXdfSYnZb2MLq7tso?=
 =?iso-8859-1?Q?obPYBP9KBNSa2iXQWGCTb/i1kj0uiHy4zRB+tSsnYTRqwgFToPDsVWiD0/?=
 =?iso-8859-1?Q?TSbbhzbCjhB2d7BTdC98YFXsUtk7Y4joARoi5QminY7E+i+xnpLo5Pgwmx?=
 =?iso-8859-1?Q?/Neta9l19+K2gxMbxpuHRkBMNfdobbIZ7bx6qXfNhUbfwVSd38KnERhwOv?=
 =?iso-8859-1?Q?fIbVl24eH8sFm3DNwro8fTuV0lqnwqaygXa/eiIIDif8BZOsNRvMjHrsb/?=
 =?iso-8859-1?Q?S79fw3CDlBsHZD4P0nBkqnh2azpxBbFyFwKIbbLvxcXqWWZ53ac/q++og5?=
 =?iso-8859-1?Q?b9Si/BNBFYoieaVkvRyHupXLJ4j1qyintt5AmMeQjTOK8Pfa+KnginysJA?=
 =?iso-8859-1?Q?vjw5NQKA8JdH4zh+FoIX9DZxY+4bDeIPYDcEUjfhnLmL4pbNgY4hg/qscY?=
 =?iso-8859-1?Q?HDVcy6JTZ9/nDHL4nNSv6k5CEsrKwjMWlFDeLYfiiXSUACOukqW1ipYYff?=
 =?iso-8859-1?Q?+osB8W9sayyUKl0lyUPmG00APqAp76dnP5Wyy7GVQC4Pw6mn9Enx1TAp4p?=
 =?iso-8859-1?Q?N4V+8YTa1dUm0x8R6zdQSUg1B7woM6UfwwkCUmwrso6dc4YYUoRJbs60w4?=
 =?iso-8859-1?Q?sZOB0xpAM7TJ5XbyBvmZJLZsEjWUW2Imqchp2dNw+8w20VVv/nkhH/5rIg?=
 =?iso-8859-1?Q?x17crS31rEiccKFW4slncGFGzYmq++nmmSLUvi5AOpRNvVA40Q3+s915IU?=
 =?iso-8859-1?Q?GqtS+UHsyg5+Hoj/pJpKKXArsQz7St8O0SGrB8qkujHkD1+Hmmi04AOSxz?=
 =?iso-8859-1?Q?mOcZBZfQ0F1+nQ8AdQbOef7ohXgakQ91CtabM8THA0suPRWf9OEfgrRsZB?=
 =?iso-8859-1?Q?c9QO2aLUD3FMr+U2BCR2Y+5MzzKugkZbsYYEk1eONInfVGsuNFA3r7qBKY?=
 =?iso-8859-1?Q?cgudd0oQhRQKQ52wu49+aaxmJSBGKTvAn0D04lAoVrnBsVhkobJNa+2Xjv?=
 =?iso-8859-1?Q?waT8TVzjj+qqhuTE7KoKLP7NsPJa3rOWfKGKcueF9jOLwvgUCfpQInTuEy?=
 =?iso-8859-1?Q?RQwl5E21V8hb8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6ABB37A2EFAFD540A4BD2D2AD3DFF2BC@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4b8652-40ec-42d4-4240-08dd9832e353
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 06:44:08.5523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PgyfIRNU+UEoy6fVufvcDOriwaP4VmtWP5kfSzD+vTwwUGJ2ZGxIvNXXcy3tyjAZjXX9ZXvez/p5BOSh7qHvJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6052

On 2025/5/21 14:25, Jan Beulich wrote:
> On 21.05.2025 08:08, Chen, Jiqian wrote:
>> On 2025/5/19 21:21, Roger Pau Monn=E9 wrote:
>>> On Mon, May 19, 2025 at 03:10:17PM +0200, Jan Beulich wrote:
>>>> On 19.05.2025 09:13, Chen, Jiqian wrote:
>>>>> On 2025/5/19 14:56, Jan Beulich wrote:
>>>>>> On 19.05.2025 08:43, Chen, Jiqian wrote:
>>>>>>> On 2025/5/18 22:20, Jan Beulich wrote:
>>>>>>>> On 09.05.2025 11:05, Jiqian Chen wrote:
>>>>>>>>> @@ -827,6 +827,34 @@ static int vpci_init_capability_list(struct =
pci_dev *pdev)
>>>>>>>>>                                                   PCI_STATUS_RSVD=
Z_MASK);
>>>>>>>>>  }
>>>>>>>>> =20
>>>>>>>>> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
>>>>>>>>> +{
>>>>>>>>> +    unsigned int pos =3D PCI_CFG_SPACE_SIZE, ttl =3D 480;
>>>>>>>>
>>>>>>>> The ttl value exists (in the function you took it from) to make su=
re
>>>>>>>> the loop below eventually ends. That is, to be able to kind of
>>>>>>>> gracefully deal with loops in the linked list. Such loops, however=
,
>>>>>>>> would ...
>>>>>>>>
>>>>>>>>> +    if ( !is_hardware_domain(pdev->domain) )
>>>>>>>>> +        /* Extended capabilities read as zero, write ignore for =
guest */
>>>>>>>>> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL=
,
>>>>>>>>> +                                 pos, 4, (void *)0);
>>>>>>>>> +
>>>>>>>>> +    while ( pos >=3D PCI_CFG_SPACE_SIZE && ttl-- )
>>>>>>>>> +    {
>>>>>>>>> +        uint32_t header =3D pci_conf_read32(pdev->sbdf, pos);
>>>>>>>>> +        int rc;
>>>>>>>>> +
>>>>>>>>> +        if ( !header )
>>>>>>>>> +            return 0;
>>>>>>>>> +
>>>>>>>>> +        rc =3D vpci_add_register(pdev->vpci, vpci_read_val, vpci=
_hw_write32,
>>>>>>>>> +                               pos, 4, (void *)(uintptr_t)header=
);
>>>>>>>>
>>>>>>>> ... mean we may invoke this twice for the same capability. Such
>>>>>>>> a secondary invocation would fail with -EEXIST, causing device ini=
t
>>>>>>>> to fail altogether. Which is kind of against our aim of exposing
>>>>>>>> (in a controlled manner) as much of the PCI hardware as possible.
>>>>>>> May I know what situation that can make this twice for one capabili=
ty when initialization?
>>>>>>> Does hardware capability list have a cycle?
>>>>>>
>>>>>> Any of this is to work around flawed hardware, I suppose.
>>>>>>
>>>>>>>> Imo we ought to be using a bitmap to detect the situation earlier
>>>>>>>> and hence to be able to avoid redundant register addition. Thought=
s?
>>>>>>> Can we just let it go forward and continue to add register for next=
 capability when rc =3D=3D -EXIST, instead of returning error ?
>>>>>>
>>>>>> Possible, but feels wrong.
>>>>> How about when EXIST, setting the next bits of previous extended capa=
bility to be zero and return 0? Then we break the cycle.
>>>>
>>>> Hmm. Again an option, yet again I'm not certain. But that's perhaps ju=
st
>>>> me, and Roger may be fine with it. IOW we might as well start out this=
 way,
>>>> and adjust if (ever) an issue with a real device is found.
>>>
>>> Returning -EEXIST might be fine, but at that point there's no further
>>> capability to process.  There's a loop in the linked capability list,
>>> and we should just exit.  There needs to be a warning in this case,
>>> and since this is for the hardware domain only it shouldn't be fatal.
>>>
>> If I understand correctly, I need to add below in next version?
>>
>>          rc =3D vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_wri=
te32,
>>                                 pos, 4, (void *)(uintptr_t)header);
>> +
>> +        if ( rc =3D=3D -EEXIST )
>> +        {
>> +            printk(XENLOG_WARNING
>> +                   "%pd %pp: there is a loop in the linked capability l=
ist\n",
>=20
> I think we shouldn't say "loop" unless we firmly know that's what the
> issue is. Maybe use "overlap" instead? And then also log the offending
> register range? (As a nit: "there is" and "linked" are not adding any
> value to the log message; to keep them short [without losing
> information], please try to avoid such.)
OK, below may be more in line with your opinion.

         rc =3D vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write3=
2,
                                pos, 4, (void *)(uintptr_t)header);
+
+        if ( rc =3D=3D -EEXIST )
+        {
+            printk(XENLOG_WARNING
+                   "%pd %pp: overlap in extended cap list, offset %#x\n",
+                   pdev->domain, &pdev->sbdf, pos);
+            return 0;
+        }
+
         if ( rc )
             return rc;

>=20
> Jan

--=20
Best regards,
Jiqian Chen.

