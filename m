Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D6640DDA3
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 17:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188570.337772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQt1y-0001Dd-Ld; Thu, 16 Sep 2021 15:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188570.337772; Thu, 16 Sep 2021 15:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQt1y-0001Bk-Hq; Thu, 16 Sep 2021 15:10:30 +0000
Received: by outflank-mailman (input) for mailman id 188570;
 Thu, 16 Sep 2021 15:10:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQt1w-0001Be-LR
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 15:10:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39213cb4-1700-11ec-b60b-12813bfff9fa;
 Thu, 16 Sep 2021 15:10:27 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-ryzTmbsDN9ubuo782gcXiQ-1;
 Thu, 16 Sep 2021 17:10:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 15:10:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 15:10:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0100.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 15:10:22 +0000
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
X-Inumbo-ID: 39213cb4-1700-11ec-b60b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631805026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8pPSKM5Q0L3yIcVNn8XWc4jzv3bY9pqdqLn7+Or50s=;
	b=fFcQHuQH3uGA0OVv0x7fkgdYBt8UZsS8h1Z0mPGCio3EY+/S+cpYotyqy4LYPcNbySdlgm
	+Eu5c5BveNbChcoEXG1hqOE9yk7MNnSUX36diZddbkkZUQPjc+DDhFeaV5iWHVa9JSsUT5
	sK8B0lqKXseipDTsruP6NPiGSZJ3vkc=
X-MC-Unique: ryzTmbsDN9ubuo782gcXiQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg4bMAvZ0W6D7L0s2t00QUk2hLmF4e+fE7STz6bq/W+ZairtWDcPzV8hrfokN9EAukY/9qiI1+4LrGYVHRtY6t2NbvJ96cUpJetmXhq7Y2K8NsbnaeZVPDTZNn95i0c8w2w6qvn7uOD7nMqknMAGnckVeBjTgho+tLhZA7esG2ErGQCh/luXcFy4nHlSjtuhv5BsmLAnwdjQCm71yD7T3KRKjiJ62RNgLeYEE6AH4fNoMuj/iqpF9WHQJR7l93uNtj4wLbFL3A18EABSzPLNnRSCAJKCRmChgi+RaqupBCpKGWNxE7Qtf5PmWo2H+NcfrAuX3GYzrBvnEWuRVnMYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=a97Ig6zm8T1jnMaVipdEfnwGiSbwMa8VsaSPBnHCBfA=;
 b=ACVBLmrnjBIEDztw1cCTUwNwasJBOJxB+CHzKtMdNVwP5BaqWUrzrHDLSZ/bIdY5VefEwF4SUQ0hv+RbYOqQTmF5vF06hTtlQHQ8IywfTwQ87D1C/kAOhD+CD9rfi0OB6IIdRJPmE8+2H1tCfBZlzxigYdnYMbqzhaf0TRzhsgqOZihfCl7y1kzbCdzyVjcbjbEwmn2SDbQKVWohafFrmibfnZ+JTclLp5Omk+80AtqcmWmK8pV0j4IKHZjKbunsI8k6Zwj3XkO14so9iDiHP81dLKaYHjDQoKCrMEuerviZrE218wqmwlVXpRHy4r7pxLk9TG5V0y1qENNHBPvDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-3-luca.fancellu@arm.com>
 <b3263ea5-b875-1c28-0e03-f911e0e97382@suse.com>
 <59F99E1E-C306-40BE-8B47-5D92ABF101F5@arm.com>
 <5bfb2544-402b-d6e1-9a8a-027e36a60acd@suse.com>
 <29091674-DCAE-4289-901E-9158FD029D96@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <125df38d-ac1f-c4a3-2ef9-1ce0f03e77c6@suse.com>
Date: Thu, 16 Sep 2021 17:10:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <29091674-DCAE-4289-901E-9158FD029D96@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0100.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f54e0552-8518-46f8-e09c-08d979241b64
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5743B16181251A496CBCACF7B3DC9@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xhNnTrLW5gEfk3iblEStHa/N/DbRru7//8R31f0kdTdJLKSxSPwZa+hDDdlywPqc00HG+0/Wa+J4AhBkhBsAL1jtF5N7/olakA7AwcLZHxG4vWgm7qRTA+kEhiCrFAkAqN/lAC2oxFXfVnpbeiSGOc/vrEX8ACNeEsQwYinrdJpg3hu+qGAGLSbRMtYeedbtxMRTTEMwdgyoojIVp25Rvu786PZOvSSDqBbyXsgoAvxuaalHllxJ7dvtqaxrCA4I0U/ZcyxGHtl3sVzcGPcNlm2p4UJKvN70fev4C+oc1fb9G/fyMu+4hHIT52Yt9NHGS99tuBE0rBAseIvzdI+8epokVgtoaES5i5l5SKjxvJzWc/9XeYROkY8XNOdvdruxLXMNIQQ+yXhWgq20ZwRr9mrm7dEt2LIQh+Szg7P12Ivp8HRfzzLiJxO12cnRR76YkcTsu9QfimqPpQr5HWghGfvTu8nUPKjG4O8NbL26Uk2XVHoHCsZzfSbwq9REmgSbTloQZir1QuqocqKiVcs08K9Rv/q+DxR/27LRxB0tCGI3PMxf686CCbEZbnpBQPlvQB3QzYmLjVS8JTE2L61s8q9Jwm0bxRZw1xyM1Z/Z42BFMphJxaSbC5ngecT9UYYAb+JGMPM9HBXEY/bKwDIpPIglPd9S0jPToFPcBI3yeoBSVB+4iRZQ3HcVgw9xipAcg3PZyarX72JAqS+9Mc7SdP7f+wvdqiyExFQ59xujnY+mgrqyW3c3hZZhzUvJlke+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(39860400002)(366004)(376002)(186003)(38100700002)(6486002)(7416002)(478600001)(2616005)(956004)(66476007)(31686004)(66946007)(316002)(8676002)(5660300002)(16576012)(8936002)(26005)(86362001)(110136005)(53546011)(54906003)(4326008)(83380400001)(4744005)(2906002)(66556008)(36756003)(31696002)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zlgbt9XGKlYqKr4DYXF70yzxNT4MBTdLdeYqgrhuMP/56jfE/YqvJYaUeQU4?=
 =?us-ascii?Q?5/SzRxp7K6u9wY9ivcjLuKGDGRBtM0V0WrH/y64Yi54fm5u/ErR75UrUllQv?=
 =?us-ascii?Q?N6fNxVUR/fowgbZ2cRSOp4chTiMsA0qHQiR4C3mdNkiY4O5vUrX2Vl9DbI14?=
 =?us-ascii?Q?oy7Fc+F5p2MCRkjcajc240SgU4E/NvNLmxCehSP66Cc0q9Q3xRsQzkpUJlcb?=
 =?us-ascii?Q?83NrGMj7S8CHKSH/9KMCy5rDT03pJOyX+9sapaemzgi6AxYjO4Qf3DGZlrSd?=
 =?us-ascii?Q?IV9apCP0tU6AylFJxYTascjoPwaXrEPKBcvDbyzgldUIxLEZghQyA4BbY8I+?=
 =?us-ascii?Q?jI/S7APmNt1r6DVs6/fDZQCCHj3ZN5TT8lmUYXfxRG3gSGHTwhml+GINE6pC?=
 =?us-ascii?Q?3H1UmhO7R10t8XBBFIMPDjIs/dNzz9uciqSuVLV/PxMB6c3s2vk1hJLYJdIg?=
 =?us-ascii?Q?x81WGnFWICO/q2/c7oePk1UcoqU9ErftHOg2Tx4nNdZql6zMJyHItG0/CzBV?=
 =?us-ascii?Q?io1LspRjkaNZRHy2JLPIzN53B5ai00bzF6e7yQMIcoKZGLXcJFtwWNPUkKSI?=
 =?us-ascii?Q?DR+FmTLRUk60v0mYDAAmmPxmwgm/QbigRrpiOFcxg2RpHWH3zzrJyCxfbiWA?=
 =?us-ascii?Q?6SofEpwoBSDctEZ7IEADxRVXPU0VEiAFT+wr5MPeFmzrNn3wWAQvlv4qidji?=
 =?us-ascii?Q?t1rvjkkZvVuEh9AeZGowI8Kk54PxxSq8+qDmYQJ4l/ZcyVIiS7Y0y/TjPdVi?=
 =?us-ascii?Q?pJF+vSqR4EbnrNQfCvAT14Kc9UuwO7GS6WGIt5G0sJbohj7mCjx+pbSeCneg?=
 =?us-ascii?Q?tJtymc8fFdHC6Ml8tTvg4Ldlj78M/m8ylOoh+C+4pKEzyQcEjQXI6l/Yy9xT?=
 =?us-ascii?Q?YZ50/qVNif49NoOO7TsMVwXwI5qwbblyL8UjVJcB9dYKdmOsGvGE2xPBC5DS?=
 =?us-ascii?Q?zy/hxEyMb/bf9IcyiYKeiqa4bYg6RqCh2158wzRdmaHZMMqvXTyKaN3Z+FvL?=
 =?us-ascii?Q?lawmS3UjDSoVz3CHMKvGPAKEfk/UUdqG++RnVLaRGa75jMxsFGiTz6PpUzLr?=
 =?us-ascii?Q?L6aMekRmDKMmOPlCjElsbV8K3OtUhPYdN1TT4WhetS8+GMA84GH8PkiEFCJH?=
 =?us-ascii?Q?IYGUxIf/Du4G+f8VAHuJEpRjBvLot9uV4C/I6IxWGP69omavhlT8CFQ7VMNO?=
 =?us-ascii?Q?tnpOc3J67kvMwAlb7XRsEI/OKvSpDGIa6iR0HMn4lpVEkiGMC0MiUXOrkxyS?=
 =?us-ascii?Q?uu4fUnLQ24Tzraf8cCMCxYx163e+ownLW7YOvS4zsAfEytyKphFg+r9SsSlx?=
 =?us-ascii?Q?kedtHQkNEnr7FTlf22k8henE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f54e0552-8518-46f8-e09c-08d979241b64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 15:10:23.6294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUrDVi2hnoVYiDGP1fNQ8u4cj+P3DwpUWw0ZBLFPyeaenboUimK7uCCv/M6Nhem9uY1h9i+MDERQd4sPmOvGkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 16.09.2021 17:07, Luca Fancellu wrote:
> I explain here my understanding on dom0less, this feature is used to star=
t domUs at
> Xen boot in parallel, the name is misleading but it doesn=E2=80=99t requi=
re dom0 to be absent.
>=20
> So if you have a dom0 kernel embed in the image, it's completely fine to =
start it and it=20
> doesn=E2=80=99t have to be skipped.
>=20
> Here the possible user cases:
> 1) start only dom0 [dom0 modules on xen.cfg or embedded in Xen image]
> 2) start only domUs, true dom0less [no dom0 modules on xen.cfg or embedde=
d in Xen image, domUs on DT]
> 3) start dom0 and domUs [(dom0 modules on xen.cfg or embedded in Xen imag=
e) and domUs on DT]

If that's the intention - fine. Stefano?

Jan


