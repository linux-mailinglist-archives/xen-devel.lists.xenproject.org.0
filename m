Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3ED462D7E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 08:29:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234880.407590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrxZZ-0004XC-WD; Tue, 30 Nov 2021 07:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234880.407590; Tue, 30 Nov 2021 07:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrxZZ-0004UE-S4; Tue, 30 Nov 2021 07:29:05 +0000
Received: by outflank-mailman (input) for mailman id 234880;
 Tue, 30 Nov 2021 07:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrxZY-0004S7-97
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 07:29:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3178fb5c-51af-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 08:29:03 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-_a-1MpBqPyaqeVCLWe4yBg-1; Tue, 30 Nov 2021 08:29:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Tue, 30 Nov
 2021 07:28:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 07:28:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.21 via Frontend Transport; Tue, 30 Nov 2021 07:28:59 +0000
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
X-Inumbo-ID: 3178fb5c-51af-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638257343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=riXpl2rI5n5scz2zsuRZ4uQqkJT+aptk+SVH1dCHE+M=;
	b=LtVbnqokfATBsZovl737DxHzCwrZpH6fSrz4mrAtNakQntg9cMDoHaq6vjaEkmocZ4FGCu
	p5CA3hLZMdQ6Vab5VgAuz3kn5l5zVbsfQH/bntrv3V0wkoZUoOBj5uvN6C2hHRgEuXxsKj
	SCSlsecqeHXp0J6yRTPKhcA6ZPXMP30=
X-MC-Unique: _a-1MpBqPyaqeVCLWe4yBg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKaxCGfYbXJDYY4cIm4PTKocN1sLDYTL6HWdo19xbA4Xs7yKOU7Q5PvX64cgEMAw75G12T1CIdu8+jrLcR+GQDzk29TW6gXQUC9gOMdqbT+q8vFXIh0Uba1L0887rcFqgt9JrwzvWVoFhaGzb+BIFLcgfpXoumHIOEKXOtuVYEgtKzn10IdwSgoP8qZ67D4wXDq/yUyVil4ihTx0Ydf0a+n3da50FTZy4YpXYvoXqNGNorJXI1CqIP6lWQ1OazOUuUS/bTxfDI1OuYNgbZ2t7hOGLyxo+GwbDTc2hTHJ0m2oTwi3HUufDgp5tWg5LtS0VZpf4JjIqNF1mzyYm5O2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcMuwCIf/3zNe7ITRHkVBpMM6xRtuH128dXgm68zJ9E=;
 b=ZZ9yFiGj8wG5bwYRFsJoL70MuauO6BdnPks/ZDsS/5+f40kLFPzggfkekJnNYYHEW76QhrO2bHeQTJb82his7NORB7kdrL9lmKqbh2LdIsoVZT/zo3ocJmt90s/Rg9pTxig4VD739M8/goyKS1DLlSE3E6a2IFudn+ihutH1j+PwqH6SENKz/CP/ES73N8pfpRuI2i8ssZulWVCR8z1334CRIEYKPLW+j/Ba7Wv3Gq2SMK1+QOj3dGBEJiZZzzt9YtC1qkRsUPsr293qu56GjVmS5L4Ie1uQNLAYxakFmk1XzCCWtQ7lSthXt46UMymy7gmhnVSrXKnyOvqoSYzmzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab477724-ed2d-9d3f-4cff-00872759b9b3@suse.com>
Date: Tue, 30 Nov 2021 08:28:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/boot: Drop incorrect mapping at l2_xenmap[0]
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211129172617.12779-1-andrew.cooper3@citrix.com>
 <dbba70b3-d811-8f40-f847-d5f310a47c74@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dbba70b3-d811-8f40-f847-d5f310a47c74@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P251CA0012.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2abaaec-6199-4266-ea90-08d9b3d31384
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6383DB66531E376DA94E7E1EB3679@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HkASVm5uRkxPs4dt6RNTyGVdiPB7t9ZV3rkOUZyVbCzysI7/nlM6s2qFG+Z8krOuHhWYGW++Wi46av3oudixLwK559JdYDIYy2g2jUYM3WbiVLaBrosEg1EptVJWuvSzXZrpo1y8O1hrNqFNTFfxBggaYaZT45Vo4+cxD2UVts3Pxn+3Hcv0nt6/UPqaUTDsxirf5cNAdEjRuifcXOCTqn8YKFHwwt3cL6XWqzDeHZMHXEJ9uMJO23iLFY9ZQPZ18wY84iPh+CA2pFVLbo9tafGYxRzxCgRRFj2/ohhrA8J9gkFfgvNfKCfH9wp+LLqS8/xLFqHbdhd/H5YL4yNy0WCT1xF1R4L/QBHD6bEGIBEJDxyq8wU8Ypq9o0y8aXf29nEkzQL/BqcFA8nDrt11gdX1uA+maUFsK0RdyzPWE0/OoCih4VpL6jSt8IEQzvu1VO4y7r0FkMMKGoT0lYzWwFvw11HXYZ9aqzy1jMRikWzPMfxPZrTss8uAw97iv4v4FbvPQbgMZxwTJLFrpY+4IOFEZBFkpknqmHTHgvQCVFyd6RCG5RHoIAJTnuOsmypEa7jvQFr3+Z53pc9FxKELqiud1fCGRrR/71eB+jpUVvZXPNpm24KfbKXCjG/gMKNibs+54ccJ8a8wRNsltanm3xaFsXYJ5irCcE21/EbSViZRFP1vs1o278y2i0LuOn3ZxGm/kGQLK5RuwDMX3ph8VQdStAlff1v/NZxoqyw+wJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(6486002)(83380400001)(4326008)(38100700002)(8936002)(54906003)(86362001)(31686004)(5660300002)(31696002)(110136005)(956004)(66946007)(66556008)(186003)(508600001)(36756003)(53546011)(16576012)(8676002)(2906002)(2616005)(26005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ynoFLmP3abAnpXsK1RyaQrA6aaFCn8oJDClbkNChC5eqDHTcGUIJXiHwEq5D?=
 =?us-ascii?Q?NGkTyv5QuJFqrINUYanHf2NgfG0Wtg05TIt+4e+d2/MTAAn0+AzW0dvZQJAE?=
 =?us-ascii?Q?KegV3jszCqCrKvHEe7Q01nWX3kAXpVth1Cmv+qlp61217bAbwIp2cZ9zPaqj?=
 =?us-ascii?Q?0uXpWVWttiBY1GV1TUklsA8Wc8WTR7yEtYt7KqNQu5WM6/H3Xr/uyskdd+ZV?=
 =?us-ascii?Q?dzwOLgwVDe82XgNHVLPqrGW6WAjps3h2zvBOKDITerqWBVea86hRMCq85RBG?=
 =?us-ascii?Q?4JuEk/ohV+dpIgIk/bwrkqAnM5KIhD6ey6NzN61U5wo5E8aRJI1FO1lKGu43?=
 =?us-ascii?Q?2a7yD3IC0DmcmLkVcc60IrKk7hlPji+BpDDT3HhPAMexWxKSwxJPkW8H4U1Q?=
 =?us-ascii?Q?mBkLZHe+kYt80Q+CvhxctSDUM2cu7WrBatuNNiC4j0h53qvEQBvSe0vs/RTe?=
 =?us-ascii?Q?NR0i3Yrc/EyfZRWG71d3L5PEzHvcjPjlfF+dYShxzVWW2mvnY9gIaBsX82R5?=
 =?us-ascii?Q?zCwUZu0375RZxzVYX/TaU1OzWYZqHxyGeSPuowsZpbT0cIwW8/9NK/uhsGaB?=
 =?us-ascii?Q?YBSGE2nzs65yRPV96PTc4K3WtIDn+0yBSJAet4ByLF0ptX49g1DAQCn3psBI?=
 =?us-ascii?Q?VcUYUaliKMtAWaIbdaAH+Zt1gnp7n3X5GvhQTDjN/aisc4euZENlJFl9VRd9?=
 =?us-ascii?Q?Sv2xjc553sO00fqmODt91MNREEnYpMRyTQlkvQm2224eZDKYiEvHLt3b/ZR2?=
 =?us-ascii?Q?9WwyuowFd2HyfWla8VCNJfMiL8TpPq1L6DqFHwCf9qi1TQ+ubdwC0zMQEzG7?=
 =?us-ascii?Q?kguKXy59uk8sVFRmZy9a19IHu5hcc6106wWK2IbGlfGuu/rSesA96cpPA/YW?=
 =?us-ascii?Q?xxi5+dP4x31drABXCZocD3C1PzQCsTuMrT4auvrDWxFHLjbPdLpB3KfUvK7o?=
 =?us-ascii?Q?vduuvz/fhd9Y7V2ytMCJ/luDEZDZNHah4lSdI5fM0fClVcBU6ZkosMjYd88B?=
 =?us-ascii?Q?bW4t/S7NeDOOB4G1EdgzST7X4CELJnaoPFfqVPTPjj6Dhc+qBh8n61KcLpJf?=
 =?us-ascii?Q?Ty1T+zpHbONDKJFJbOzM459+mbe/tlpuB0awwlPDujAGQSsrkXRnjhjPjtTQ?=
 =?us-ascii?Q?57Kd6ZnWKummFPdSBLQe/Jok2Oumd6FvbI0s0VKXusOhQwV85f9sUADkWilK?=
 =?us-ascii?Q?D+cMCIoyjoyd79Tbw7PDPhIKN4oly+cV9iikr5LaFe7jzizLt3gd3NLQFW2r?=
 =?us-ascii?Q?IeV4pJsLk+wguFKQ+fDP4M6vJ1eXNhnZACIHayRGwjp8Gp/5sb5yCJf9l5Rk?=
 =?us-ascii?Q?ULl46goJsrE68Sbj3nurC8Mm2ekJQsmWvqbsYeClEl4ARiaUsm0XvZWSkxTg?=
 =?us-ascii?Q?q6eTGUzaaLNzxR/L+534P/5hw4eBqkY3lGnWI+DgF17z9vQFIQGBgXMYqShI?=
 =?us-ascii?Q?j6VN+4cUyQVAovd3FbsxHxvs4l5ueQWYhwx3sI97YQI24vTalsaTWY9/Bx3v?=
 =?us-ascii?Q?frgAmifUr3LkVCH87SXwLJYShpDWrn/RQrnQdKbPIyviZCr6UP8Go4OhlkEC?=
 =?us-ascii?Q?VLvS+6ntl4TiHdtGp9oHMUU37W7+rQ1OkwlSZR/iHV7QZTv1zum1umSCX8fb?=
 =?us-ascii?Q?uheCzAC3uimxWJyomekhKFA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2abaaec-6199-4266-ea90-08d9b3d31384
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 07:28:59.8144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgSp2/JgoMvU9xLCcfVkE8ywVb6ZfY+MYpMo1N5uPWwm1hvYts+vbkCG1Kss4UPrnts94B0YQIVX6DPuPh6W/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

On 29.11.2021 18:42, Andrew Cooper wrote:
> On 29/11/2021 17:26, Andrew Cooper wrote:
>> It has been 4 years since the default load address changed from 1M to 2M=
, and
>> _stext ceased residing in l2_xenmap[0].  We should not be inserting an u=
nused
>> mapping.
>>
>> To ensure we don't create/remove mappings accidentally, loop from 0 and =
obey
>> _PAGE_PRESENT on all entries.
>>
>> Fixes: 7ed93f3a0dff ("x86: change default load address from 1 MiB to 2 M=
iB")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> I ought to have spotted this in c/s 52975142d154 ("x86/boot: Create the
>> l2_xenmap[] mappings dynamically") too.
>> ---
>>  xen/arch/x86/setup.c | 10 +++-------
>>  1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index da47cdea14a1..6f241048425c 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1279,16 +1279,12 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)
>> =20
>>              /* The only data mappings to be relocated are in the Xen ar=
ea. */
>>              pl2e =3D __va(__pa(l2_xenmap));
>> -            /*
>> -             * Undo the temporary-hooking of the l1_directmap.  __2M_te=
xt_start
>> -             * is contained in this PTE.
>> -             */
>> +
>>              BUG_ON(using_2M_mapping() &&
>>                     l2_table_offset((unsigned long)_erodata) =3D=3D
>>                     l2_table_offset((unsigned long)_stext));
>> -            *pl2e++ =3D l2e_from_pfn(xen_phys_start >> PAGE_SHIFT,
>> -                                   PAGE_HYPERVISOR_RX | _PAGE_PSE);
>> -            for ( i =3D 1; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
>> +
>> +            for ( i =3D 0; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
>>              {
>>                  unsigned int flags;
>> =20
>=20
> Actually, on further consideration, this hunk should be included too, to
> cross-check that we don't zap any of the dynamically created mappings.

I agree in principle, but ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1320,7 +1320,7 @@ void __init noreturn __start_xen(unsigned long mbi_=
p)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *pl2e =3D l2e_empty();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_UNREACHABLE();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 }

... this isn't going to help non-debug builds. Dropping the zapping would
mean release builds then run with an unadjusted PTE. I can see two options:
Extract the flags from the existing PTE as fallback (i.e. keeping the
ASSERT_UNREACHABLE()) or use BUG() instead.

Jan


