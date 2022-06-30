Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E4560FF5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 06:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358183.587245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6lb5-0005Fi-TM; Thu, 30 Jun 2022 04:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358183.587245; Thu, 30 Jun 2022 04:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6lb5-0005D0-Q9; Thu, 30 Jun 2022 04:16:07 +0000
Received: by outflank-mailman (input) for mailman id 358183;
 Thu, 30 Jun 2022 03:33:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3GZP=XF=amd.com=SivaSangeetha.SK@srs-se1.protection.inumbo.net>)
 id 1o6kwA-0000jA-Ql
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 03:33:51 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c5e0ea8-f825-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 05:32:42 +0200 (CEST)
Received: from DM4PR12MB5200.namprd12.prod.outlook.com (2603:10b6:5:397::11)
 by MWHPR12MB1886.namprd12.prod.outlook.com (2603:10b6:300:10f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 03:32:36 +0000
Received: from DM4PR12MB5200.namprd12.prod.outlook.com
 ([fe80::c969:8bc8:b7c1:49f6]) by DM4PR12MB5200.namprd12.prod.outlook.com
 ([fe80::c969:8bc8:b7c1:49f6%7]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 03:32:36 +0000
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
X-Inumbo-ID: 4c5e0ea8-f825-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwO/rBWA4DdrRjkcDQBtUrdEsOQGUQ3D5roDh7UEtUziohhSDV5cfWsLRh1Wc0SOaJMD/qNbpS0YdiSc236Ao/9VWmFQ8qL4p1JA+Y+IordcLjDDeXUpUDJty8rQSPZ9JIgkCjLcd/s/SYOJTVQvQgf+Tv14o5BNv4mSA8/6MB4+qS2j2tj1cy/jI5gkFn+cBZglSHTQvDEZEPDC54bQPvgQLHBMyWWIMEMGUFe3AhzKEq4PUgdA02PJ23yWGGywFspEyLCy+WO2N8hFs1SC50C5anzsvnO/iR+EvvUZUScd8zwvlE9SBrqaeD/TlGIV/jfbKc3j4ch6yR7wtm4mKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+6+xBHQBEIoHUQGVwQy0HjFAgGXo3IOZhrED5V38qM=;
 b=PL9VoqmKrddtP1admZKgtLb+veyWerawfvsKiHXT9RWlfxTztqZuwOi99nUv5NxcNBBm1w6FvObhR7NOqnH/XEeVHnaxxJ2FtboOQWbgFzXrw79RCTubzkAh8UTPSYgshvzRzEcYgS/9d2kGgTv+2ZjS0cg7SkB1jVK1iRnq1vsUCaVP6kc2+XwAjQjFhy9dAEwn1GgeBNtlYoAq6A3B1Q403UaPaQYyEcQ/r3o9vU0KiGfpOdhhRMIrVA7HpqtvFjrvvVQxBMlmx7O3Qu2iSdllgrXJVsoACzNj9WB+QkKa9+uZdlyqp+nJfZ5rWJJOLUW+sU9mdh2nCQbTr9V9EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+6+xBHQBEIoHUQGVwQy0HjFAgGXo3IOZhrED5V38qM=;
 b=qSjfIVqYrVktXsOWffrPWd3Rwu4iH7CCV90t9GHDeXJc1Z7yNsmYu2Jz4kopbvf/e6LEMXWBGaf0f9fgw0p05CfNezhMo2v35bTqpOwonbDCYAJN6OWKjDo3RqpB8lbPn5QEE0T+WMlLg8qPC/84zN7xzb6/lAmfmODpK65icCg=
From: "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "jgross@suse.com" <jgross@suse.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "Pandeshwara
 krishna, Mythri" <Mythri.Pandeshwarakrishna@amd.com>, "Rangasamy, Devaraj"
	<Devaraj.Rangasamy@amd.com>, "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Subject: RE: Reg. Tee init fail...
Thread-Topic: Reg. Tee init fail...
Thread-Index: AdiHr2So4ZRGcIepR0+LrE4BlT2RXAAQHZuAAQDerQAAD6nlcA==
Date: Thu, 30 Jun 2022 03:32:36 +0000
Message-ID:
 <DM4PR12MB520060A696B62EFBA3E5E96680BA9@DM4PR12MB5200.namprd12.prod.outlook.com>
References:
 <DM4PR12MB5200C7C38770E07B5946424A80B49@DM4PR12MB5200.namprd12.prod.outlook.com>
 <7689497b-1977-b30a-5835-587fa266c721@xen.org>
 <alpine.DEB.2.22.394.2206291251240.4389@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2206291251240.4389@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-30T03:32:33Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=dcb75614-3210-49a0-b087-30203244579f;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7c21439-e308-4657-6513-08da5a492d1c
x-ms-traffictypediagnostic: MWHPR12MB1886:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jxcEkr13C4gZ7n+Cfg6uzDWsmXssm4Ac4pEbMSX66lf3u7K5u5/G+yZPxfVicrTCI+S5Nc2RHwgOfl6lr5QrU3du7Ba93yy+6S/SrsPqeWon5mU02+fbY6bpJEBNX9/UmR6BCguslubmtoER+Q1zOkzcC5I4fFPEoqYUpighdVo4plhkzQAKq8F/4Xo3jgvEQivgjweEbYmwkN2LtlA+Fnptu3goDi7PqbjG6c+D9fsnamw6xT/0BtD45TsCCyoTBADb7Pc6dBsfIwwV7Po04GUtzE+lN5+kzMgIEC9nkrQKGgVAjubKONG0wLFj/L01TE+uVGsbCUT6AueCc9vUvK8jtKDr6pnTR5lnMNfif4+7m8TNxAw+XYYYVQ+Tbisf3e7NjlhsfCl7bHHld/HVyqto8ryQ9FwZd/My1Ppcw344IyNx8PhWXusn+y0JLfIvJPkFilqbDploHRBPTFyjd5kzbGvZlnxiypxcoGMLknrz1FOT3apchu89I9Ulo/yDZxzwCxxblc+MHX9Frfjico3eBnz6j5ZtKNWnm1a64a11s8kQk4daMSkvHnCyRAB+a+ld+A9QxMQB/zaVX8Gf4fJJczKzrxpB8JlkN5vX9c1m7xA10sTUQ/6q+NmQ9echLkqyXpxearYYpF9JepfJk67KtVTZzCNigP2HZtoVxwI4tbLc1L8VXYQLBlWNT8dNFajCTxQYj5gaQDKq0ee/DTUNl2l9Cq0T0QNHIgUWv0WO335eaxIZPCthHjtuyEhDZTjnH20HPR07uRRbLgt6EqDerFN5zBsR+4BGY7yttD9P7E0A2n/8R5VVe8P3WZArVs+el61CEnHIcQ6c1CPyzbKUja5erPpio9Pgit8csNR3eSb1tp15HnNEX0/j5wz8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5200.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(45080400002)(55236004)(478600001)(52536014)(38100700002)(53546011)(966005)(41300700001)(110136005)(26005)(54906003)(2906002)(9686003)(6506007)(186003)(7696005)(83380400001)(316002)(8936002)(5660300002)(55016003)(4326008)(66446008)(8676002)(71200400001)(86362001)(66476007)(33656002)(64756008)(66556008)(76116006)(122000001)(38070700005)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pbUONR/z9QJQMhlD1hKzk2cHkdg5NpN+UNvaqZ4gH2XCjssrrxo9mAHkIh5d?=
 =?us-ascii?Q?dNEXHzxA34h3wkctauYVrPtqWUWzwlWVLzj3ix1w4RQACApcnyzMnfQUcFMD?=
 =?us-ascii?Q?up/n13szIiQMPg45gJnHw4G0PcJ5qfBOVYUgJbk0LhJ3RTKVC7y4CPryBZKq?=
 =?us-ascii?Q?iLCLyC/lZ732THE+06AlIGksFREKLmYXVZy3H/P5z+T9NksusIM0efvjjH5E?=
 =?us-ascii?Q?nK3UjhJlftgJhfKmWjF7kr9PGRmpNyuzYGXNplxYs0tgXfysH0G1x8CawGzR?=
 =?us-ascii?Q?Rf5aDKV/Nmz09WwU+WHeHpoQoPYLg4NqUzWnwUm7KxQjnYekzMw4SBpChyHj?=
 =?us-ascii?Q?tyEH2NCtgN83qoaso6QdBnJugNNaTW0qPJ0A21acYZ4TdkWu92Ut2F2y3SBJ?=
 =?us-ascii?Q?+AazrpXIdVAp8s1bOYv46nEdiqBdHPKI7BAQUytGo+SGQFyLfUtnHUQj3hGU?=
 =?us-ascii?Q?jvGiHMJIi2i8fZqhcPGDEA4juEdUo76vx3jPUMx0FiWUDiUcb63J7DaORUmV?=
 =?us-ascii?Q?oO+dtS3GOc4GbkOPFgLmd79cpfo+69YBFe4YoAKGcmXr+B5xeHLz7okkp3z4?=
 =?us-ascii?Q?OZVPoJ9r2SK/avzduOLZVb4WFnWibW/M30kHUlp5Ibc+CGkmApNepBsJrH9F?=
 =?us-ascii?Q?ei9v6i92IREf551TivpV/szHnquMDZCxArQbKEHW7CWX9yTIY4r5dHBXVhjD?=
 =?us-ascii?Q?RYaMAvrjrGET1BxSSi3XrvWcT8tO0bSfwPd5P/GBM+i4hpu+1ssxIcsU/nyn?=
 =?us-ascii?Q?DvR5BU1aITEkNrghdmAjtAfPiHJ1nPaSIXSFRVRz8tKBtdC0b16a5ydx13nD?=
 =?us-ascii?Q?tKVvdyXDd7aE5E+mcDFA5c2eOTZiRHmoqgBZdgZL0i7QFNc5IozhJpotbo6d?=
 =?us-ascii?Q?D87ylN3yQWeaNY1mnmFx/XR2g5BkWm4+bD8R9jvaqA0EGoL/INVxSrsdOR/Q?=
 =?us-ascii?Q?UAFrhgWQWkfFszmmLlP+3rzf0BOoQjrEWetc1wf1YTxrGdina315I6HNZDBW?=
 =?us-ascii?Q?CNbSn/p9Ft2QHs5UUPeasj49R7cQmEPSORjMQhAMVORKtk/t/UfzMj/QdZWN?=
 =?us-ascii?Q?hhEappqdFndQBdSYQDVxQEhX8Apf3+Z3lhXpFqJoLGut4BbIlAT2MvLXzE+4?=
 =?us-ascii?Q?9JPedYUwG01Yau9tkrwdswx2pGdmMVTyW5WPejuoWYCQKpFWcMUoIsoVAqQp?=
 =?us-ascii?Q?zEdIWYB9/deN9+d+z1rpdOk2RcfzfROFZPG2AQlz/Zs+a8JaXlaR6r7grrR5?=
 =?us-ascii?Q?q8R1Gi2EmWNqOckCcBDz+C/YbYz11kJoxMmcsIj4PyEaMsWlGatIdxOuQKPp?=
 =?us-ascii?Q?ya3a7ASaJMSaDAdTWqUedFws4XCCkU97283FcHGGfDqfcHyGUh5+SXLnjBB6?=
 =?us-ascii?Q?X2lliycjS/fpb1avrkobk/47WedC+z/LLnda/szErtey43HXFjDvtxS3P1pe?=
 =?us-ascii?Q?JehLxzUBrtM1U+Kk6R+Os7rKbbewEJsp5dSxq7p0+/NhwbhhgNWzxXwxZ7bn?=
 =?us-ascii?Q?JrdmF7cEpIqsey2vwUc5XO6rhlPuvlL6YqofxVuXc/psnPBcNYUTxyFJ5AI+?=
 =?us-ascii?Q?oThOmZd/Ud57nqpV9WU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5200.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c21439-e308-4657-6513-08da5a492d1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 03:32:36.1982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kN3SdH7niHdzw4Jipa7tCQKKa9QJTHhjGT8suFDPRHiv5+9xEf0l2V1Vi6VfzaY+jnh6jJEWY+usyfh8L100kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1886

[AMD Official Use Only - General]

+team

-----Original Message-----
From: Stefano Stabellini <sstabellini@kernel.org>=20
Sent: Thursday, June 30, 2022 1:34 AM
To: Julien Grall <julien@xen.org>
Cc: SK, SivaSangeetha (Siva Sangeetha) <SivaSangeetha.SK@amd.com>; xen-deve=
l@lists.xenproject.org; Stefano Stabellini <sstabellini@kernel.org>; Bertra=
nd Marquis <bertrand.marquis@arm.com>; Volodymyr Babchuk <Volodymyr_Babchuk=
@epam.com>; jgross@suse.com; boris.ostrovsky@oracle.com
Subject: Re: Reg. Tee init fail...

Adding Juergen and Boris because this is a Linux/x86 issue.


As you can see from this Linux driver:
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Felixir.=
bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fcrypto%2Fccp%2Ftee-dev.c%=
23L132&amp;data=3D05%7C01%7CSivaSangeetha.SK%40amd.com%7Ce962a907794f4917a8=
0b08da5a0a7b3b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637921298315828=
104%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DNxmMUckiDRGLv3qLJrhZKBt2zNT=
uomEZqYJdV74tXxA%3D&amp;reserved=3D0

Linux as dom0 on x86 is trying to communicate with firmware (TEE). Linux is=
 calling __pa to pass a physical address to firmware. However, __pa returns=
 a "fake" address not an mfn. I imagine that a quick workaround would be to=
 call "virt_to_machine" instead of "__pa" in tee-dev.c.

Normally, if this was a device, the "right fix" would be to use swiotlb-xen=
:xen_swiotlb_map_page to get back a real physical address.

However, xen_swiotlb_map_page is meant to be used as part of the dma_ops AP=
I and takes a struct device *dev as input parameter. Maybe xen_swiotlb_map_=
page can be used for tee-dev as well?


Basically tee-dev would need to call dma_map_page before passing addresses =
to firmware, and dma_unmap_page when it is done. E.g.:


  cmd_buffer =3D dma_map_page(dev, virt_to_page(cmd),
                            cmd & ~PAGE_MASK,
                            ring_size,
                            DMA_TO_DEVICE);


Juergen, Boris,
what do you think?



On Fri, 24 Jun 2022, Julien Grall wrote:
> Hi,
>=20
> (moving the discussion to xen-devel as I think it is more appropriate)
>=20
> On 24/06/2022 10:53, SK, SivaSangeetha (Siva Sangeetha) wrote:
> > [AMD Official Use Only - General]
>=20
> Not clear what this means.
>=20
> >=20
> > Hi Xen team,
> >=20
> > In TEE driver, We allocate a ring buffer, get its physical address=20
> > from
> > __pa() macro, pass the physical address to secure processor for=20
> > mapping it and using in secure processor side.
> >=20
> > Source:
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fel
> > ixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fcrypto%2Fccp%
> > 2Ftee-dev.c%23L132&amp;data=3D05%7C01%7CSivaSangeetha.SK%40amd.com%7Ce
> > 962a907794f4917a80b08da5a0a7b3b%7C3dd8961fe4884e608e11a82d994e183d%7
> > C0%7C0%7C637921298315828104%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> > MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&a
> > mp;sdata=3DNxmMUckiDRGLv3qLJrhZKBt2zNTuomEZqYJdV74tXxA%3D&amp;reserved
> > =3D0
> >=20
> > This works good natively in Dom0 on the target.
> > When we boot the same Dom0 kernel, with Xen hypervisor enabled, ring=20
> > init fails.
>=20
> Do you have any error message or error code?
>=20
> >=20
> >=20
> > We suspect that the address passed to secure processor, is not same=20
> > when xen is enabled, and when xen is enabled, some level of address=20
> > translation might be required to get exact physical address.
>=20
> If you are using Xen upstream, Dom0 will be mapped with IPA =3D=3D PA. So=
=20
> there should be no need for translation.
>=20
> Can you provide more details on your setup (version of Xen, Linux...)?
>=20
> Cheers,
>=20
> --
> Julien Grall
>=20

