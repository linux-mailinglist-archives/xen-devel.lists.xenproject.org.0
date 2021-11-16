Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F1B452B75
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 08:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226140.390711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmsji-0004cS-PK; Tue, 16 Nov 2021 07:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226140.390711; Tue, 16 Nov 2021 07:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmsji-0004aJ-Lu; Tue, 16 Nov 2021 07:18:34 +0000
Received: by outflank-mailman (input) for mailman id 226140;
 Tue, 16 Nov 2021 07:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmsjh-0004aD-PI
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 07:18:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67b05e78-46ad-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 08:18:32 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-HYVbKztBOuCD8RH_pQXn_w-1; Tue, 16 Nov 2021 08:18:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 07:18:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 07:18:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16 via Frontend Transport; Tue, 16 Nov 2021 07:18:27 +0000
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
X-Inumbo-ID: 67b05e78-46ad-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637047112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BRuIXSgutMvtcIQDtRFlR7tDvJ0azY5gyVE4c3OnYPA=;
	b=AthzinTodvcsIGjnPSW7wNswt11CBHwMI8YGT1oWOm7Ch8qkGaP7Jz4nmmBbDoq1slZK7k
	unOONacAX/cnJpLLkh3ge3Lqz04/MV7DC88PHr/h39k2Sqdp7HrH4kdXU85zR0CPV8MIgw
	HiFGXq/Nx4frrsy63wau4qepaFVK+T4=
X-MC-Unique: HYVbKztBOuCD8RH_pQXn_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vh1lzzRl31GJL1bO2Y0vlH0hGV1nsXZSIYo7yauPT9/rCkumkTgWR2gDaCxEEOtfVxQL4zIehPaauNaafM+JprtdzT34Ij55+5EJ46YO85c274KWhV7NshkJLHvbIqyviRrZpKwNtM4GC624H+F7N5J/FJb76grNkoYqgTo8YwA+i2UT6EkyfTJRyVj1bin1NW10inUdq5hSb76iH2wgRlqWJKPfjNHRzdy0fASALf1tQNsLTcuZb0iAza5GoLZX7ZFYL4HmPOp1m9JXVfElqdQbeznAkhBwoArr4258jnL4WGmtP/YL/Lx2x/SCynwML5IP6rUBIRHGX2B60WIoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRuIXSgutMvtcIQDtRFlR7tDvJ0azY5gyVE4c3OnYPA=;
 b=Xmam8vNa5RdOZRHl0stmhCMLGLR54IpVImzkGC4hy6nRBOBCsgSDpzuTnbEPUNLzUEa5EOiTyexnPxg2+98L7bJ+ynixVynZyayPrdV8w1X0OtBmurSZZJcexg1glIekOhbEve/tvewHFsoEjNNuDN1HHrYawq1RfQH+mtcoFlDbcRjRtykfRCRdAOZnd4M6uJRuiNKZXh9weJnDa4Y1/BI1givl62fij92dg0zUvMP3UEN9g/4c/9N/c39TkzZnv+gyCYPW3iPTJikrrzt1s1+Qd3Rq5m6True4vR3yg3SdSGDhiSV+tzbx9M6BbCzPk+8D43L9tS45kZx1DXubpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3c5087b-4eb2-8599-f68c-cc9dbd375767@suse.com>
Date: Tue, 16 Nov 2021 08:18:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: ACPI/UEFI support for Xen/ARM status?
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>, Elliott Mitchell <ehem+xen@m5p.com>
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
 <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
 <YY6L5JQPn0s3c6Jp@mattapan.m5p.com>
 <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
 <64e9208d-ecda-2e62-e10f-81750c0279fb@suse.com>
 <78aa1ec7-3d47-716d-c9d6-b74d66486e9e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <78aa1ec7-3d47-716d-c9d6-b74d66486e9e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0012.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc021878-5703-486c-8073-08d9a8d14960
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2447AB25B3EC9F6A3F097227B3999@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jyDHN/5JLhlcqEjtJnrJUP2F7yllDuO9PIPcALNKGy+JtVgoIEL4dRgEfJsEioLr068iiUoi25oGkfQ+F6X1rRHRBI5AAJTGSpbpV2CGRnzoiQ/kMPRcR74RuHKPvdGxmvJiLVhqvr/UClBSaoSop1J4Rd5Ab2W0g8vb8MQuq6nl69pIAPDbf1IKTfOkZNOwvujIVboN7+9XPd15MqCRRwo8PlJ5kJLYJ9JmqDdd8o2ISn2y6d2TU7wivH8VyGkXLuaddi3WhhkgWUrNuf+9UhbX7zH99eHQF2N0MV44cqgAZnzvEiyx82TP8y3MGlmDTSuvEsZ73OhM5q4ydx6A5fkWkNdcPbQm25vIR2IsuoQubS6r6MNP6aZz/bmjfep+oXBql498uQUNIEP+0kz755fuA2kWDTQWtTTOJNPKNS9P3tfh6RGcVgBUPBTTnSd8MInanJCuEDVCeohoRpj5lQC4W40wzQdFcd/9onVsNtofBhh/SxHU7zUnWo7rjaRu0ZNuEiARK5nT648uQR1kEMsvtOQbLfnNnoEz6DHXQrgiTnL1qgnr27JXJvptGvwtJ7OkTdjLW/cRs0Nj/9Erubl9VJV1eD+z72z+iNIvP/ynU62hVww4XUEzRLCIZ5Ie3iolaYrUNi5brzPfCDlaaD8CfxdEDkl1nHB3N0qQWisMLr+1KxyZCGF6SpizvZSJ60KeHB+X86vQ6w4aUpGPEpeI05JSq4+tdsrkWBG3qwxT9raBGcvxviCOGBDelpIV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(956004)(2616005)(508600001)(316002)(36756003)(66476007)(66556008)(186003)(6916009)(66946007)(86362001)(16576012)(54906003)(83380400001)(31696002)(4326008)(26005)(6486002)(5660300002)(53546011)(2906002)(38100700002)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGdGbVlieTBLeHdDZm16V3FkWWQ3OGNZNkZkTlNQdlpGMVQ1M3dNc0JLSGdP?=
 =?utf-8?B?U2FIVmlDcU9qaDV3UW5tN0xTeHNsS1BEeG1VQzFtL2U4MkZZWFBTU085aXQ3?=
 =?utf-8?B?WDZRdGpqbXhIS1FqNWpzN2p1T1ZjQm5Lb1hIc21iUkRwM0JQQWJINFZaYTlL?=
 =?utf-8?B?aE1yTS9jQ1BqV3U5cEthVDFxNDVLQ0E3VzdaTDI2K1FSeHF3Q2NZY3dRTkcz?=
 =?utf-8?B?QlBzSWZ1aks0TDMxb2tjUURoQ09kZ0ZiNDZEN1hpa3d1SU0yU0R2RHI4d002?=
 =?utf-8?B?elJBZlhBSFhGQkxEQm5rb0M2ZlVHeXRqUUd1aXZOQ3pBUW9ReWxBMEZBY3di?=
 =?utf-8?B?NkwwZXFNZCtZWGxHZzBQWHErVUdxdUZyZzhIeVNqdmNLREdaZ0JuY29xU0NO?=
 =?utf-8?B?cWpBcUJIMjVONTRXTmhqMEFRazhTNXJXNUxGdE1JSGpkL0t5Vm5MSHMrNUF6?=
 =?utf-8?B?c0dxQ2R4SDgzblhGak9QY2NFLzl4M1o4NUs1ODBhSHlJS0lPMDlWMjVsSGhE?=
 =?utf-8?B?MnNvN1QrMjNHaFBpeXFEMCtsMEg1Rmo1UFIwV0pFdEdodGxrbkVlOWc5VjBE?=
 =?utf-8?B?NkJtN0Z5SnVyOU9rWUNBK1lTR3ZlRWc1MEJTaDZjZEhCTGVjbkRIL203Z0lR?=
 =?utf-8?B?djZBL3VXdzVHZDZUU2dreGxkekJiOXQ3dFluSXUrbFNvSitPM2tKNEh5MU5Z?=
 =?utf-8?B?MzZtWGM5bzk3UzlnL1lobkZzeG8wdVJka1BOdFZzV01SenoyZkx6QXpoMVhw?=
 =?utf-8?B?L012OWRFMWh3SUxqM1hQazQ4bGRzdTQyYkhwajdJeVFiOHphZy94TmNBY0t0?=
 =?utf-8?B?Z3lrMDZWSElRWmFnUU0rSEtodXU3RmYyaHhiSTl4VGNUNXJ0RDRIclFEaGp4?=
 =?utf-8?B?djc3VFRXb3pVOHp2K1lzV3o4QW8vWVM3NHQyRXBxL0pVbHFybjJFZUxzNS9v?=
 =?utf-8?B?MGcvSVpRdEwzSm5ZdjNEbE5NWjdhV1pDN01haHkycVRIalgrQWhuUUc1VTRV?=
 =?utf-8?B?K1VmcVliZk02NXI1dmVpb1lMdmFick1KSXJlaFp5KzBHUDIxODhnOWVWcCt4?=
 =?utf-8?B?a2Z1ZEJzRzk1aDdkclduZXpINExvWFJYbFFxdnRueWsxZEJQRmluR0lobHZM?=
 =?utf-8?B?cEJVcHRhSmhKdkduVEZab2pKZmgyUDZoNjEwME05UHdIOFcvSE1QelJKclFn?=
 =?utf-8?B?UTBkT0JSY2NVamw3VnRSYm9mT2ZDMEh3UUkxcnZzQVg4UVc2emJoQVFZeVFX?=
 =?utf-8?B?Yk5JVERlbmpYY0ZSRG1TRzUvellSK2hOK2FCaXJDNVFkWFVkKzBLUmx3TlM3?=
 =?utf-8?B?Wm1tTUxsSlNmYlFua0M2eXNyWGtZUU4yQ3Z6WmdmMllmVDJKSzV4dC9IeTl3?=
 =?utf-8?B?K2ovNFFvdkJveVFPeGFhVmdDMUd1VVhiS2RRSkp3aUdVU3pJTkdBbzlsWHhh?=
 =?utf-8?B?bWd4Y3Y1SGJyN2dWM0x6bFN2ajV3eEpqbmtRNHlrRm5vM1BmT3RUU1poS0p5?=
 =?utf-8?B?K1VrVjNqclliR3IwTWN2cm9XZUxnaTJJT04rWHZDMkZMVTN1RnkzRG1ub0VY?=
 =?utf-8?B?aGw3dWZLdkhwSGdJMlhmYTk0VmRIUWJmTUZOVFViMUJCOTVPeGU0M2ZVRDky?=
 =?utf-8?B?Mnc1MXdqcms1ZXZKL0g0SGJ6bzlPdXkvK3RQSXNaT1Fzak13ekUyOWRTZVFp?=
 =?utf-8?B?NzFodWtzUCtWaEZQRm5jSVFHNzlaTXR6eVdhaFc2RHlPOTl2VFlvZElWTG5Y?=
 =?utf-8?B?Y1ZOVjJ1MVphSWlaVS9RZnptMTVVWTUyOUoweVBpTi9kc3VsL0lUbWpxazZp?=
 =?utf-8?B?YmpJTzhPS2pkMEs4MHVNbWFVendQa1F3QTFTb1BPdjUyUXFLWTdoUnh0aXUy?=
 =?utf-8?B?Q0hrcUdGekY1dFl1dSthVXdsaUcxaFZrMnQzZ3h4RFMvTHZhY01VUG9qM2tS?=
 =?utf-8?B?VDZseTQvRlFlOCtBNG9WMFk1ZzMvdG80M3dSMGRmNUFnU2VOTnNlSURrcGwz?=
 =?utf-8?B?akU2R1BQdk13NFlUYXZGaE0rVzMwVWZJSUZDd0ZiUExJVzJVU0YxYmZSbCt0?=
 =?utf-8?B?cWxyQ3pvVHkvc2R0R2xXdExOaFREZkhwd1JXbFN5c2Y5dGtXY250Wk8rQzU1?=
 =?utf-8?B?SzNweWEyN0krTGZWUFJXNlNoVUx0bmppQklEVXYvWC96VTZ5WDkrczlTNDRn?=
 =?utf-8?Q?fr9WgUc2W3nlFylpddIUq+w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc021878-5703-486c-8073-08d9a8d14960
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 07:18:28.3667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHccAPExo1T+6BekhI+IpSqvf9M/+9et31Qunim7+qkeofNkyroYttklGiiKTRKvnw5W1OPB3tWf0s0jBHFp+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 15.11.2021 20:09, Julien Grall wrote:
> Hi Jan,
> 
> On 15/11/2021 10:13, Jan Beulich wrote:
>> On 12.11.2021 17:02, Julien Grall wrote:
>>> Hi Elliott,
>>>
>>> On 12/11/2021 15:44, Elliott Mitchell wrote:
>>>> On Fri, Nov 12, 2021 at 05:54:08AM +0000, Henry Wang wrote:
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>>>>>> Elliott Mitchell
>>>>>>
>>>>>> I've been busy with another part of this project, so I've lost track of
>>>>>> progress on ACPI/UEFI support on ARM.
>>>>>>
>>>>>> Last I'd read full support for ACPI/UEFI seemed a ways off.  Using a stub
>>>>>> domain to constrain ACPI table parsing seemed the favored approach.  I
>>>>>> was under the impression that would take some time.
>>>>>>
>>>>>> What is the status?  Do the Xen/ARM leads have any guesses for when full
>>>>>> ACPI/UEFI support might reach completion?
>>>>>
>>>>> I am doing some development based on the Xen UEFI/ACPI on AArch64 using
>>>>> the Arm FVP_Base platform. Using edk2 and master branch of Xen with
>>>>> `CONFIG_ACPI=y`, it seems everything can work properly.
>>>>>
>>>>> Here are some of my logs:
>>>>> Shell> FS2:EFI\XEN\xen.efi
>>>>> Xen 4.16-rc (c/s Fri Nov 12 02:34:01 2021 +0000 git:323b47ffd9-dirty) EFI loader
>>>>> ...
>>>>> (XEN) PFN compression on bits 20...22
>>>>> (XEN) ACPI: RSDP F5E30018, 0024 (r2 LINARO)
>>>>> (XEN) ACPI: XSDT F5E3FE98, 005C (r1 LINARO RTSMVEV8        2       1000013)
>>>>> (XEN) ACPI: FACP F5E3FA98, 0114 (r6 LINARO RTSMVEV8        2 LNRO        2)
>>>>> (XEN) ACPI: DSDT F5E3ED98, 02AB (r2 LINARO RTSMVEV8        4 INTL 20200925)
>>>>> (XEN) ACPI: GTDT F5E3FC18, 00E0 (r2 LINARO RTSMVEV8        2 LNRO        2)
>>>>> (XEN) ACPI: APIC F5E3E998, 02D4 (r4 LINARO RTSMVEV8        2 LNRO        2)
>>>>> (XEN) ACPI: SPCR F5E3FF98, 0050 (r2 LINARO RTSMVEV8        2 LNRO        2)
>>>>> (XEN) Domain heap initialised
>>>>
>>>>> ...
>>>>> [    0.000000] ACPI: SPCR 0x00000000F5E3FF98 000050 (v02 LINARO RTSMVEV8 00000002 LNRO 00000002)
>>>>> [    0.000000] ACPI: SPCR: console: pl011,mmio32,0x1c090000,115200
>>>>> ...
>>>>>
>>>>> Hopefully this answers your question. :)
>>>>
>>>> Thanks for the attempt at answering, but the SPCR entry tells me there is
>>>> a substantial portion of ACPI/UEFI functionality you're not testing.  I'm
>>>> specifically looking for framebuffer console support and SPCR says you're
>>>> using serial console.  While serial console is appropriate for true
>>>> servers, for some use cases it is inadequate.
>>>
>>> We don't have any support for framebuffer in Xen on Arm (even for
>>> Device-Tree). I would be happy to consider any patches if you are plan
>>> to post some.
>>>
>>>>
>>>> Julien Grall and Stefano Stabellini had been proposing doing ACPI table
>>>> parsing in a stub domain, but I'm unaware of the status.  Not finding
>>>> much suggests it hasn't gone very far yet.
>>>
>>> This was a very early proposal in case we needed to parse the DSDT in
>>> Xen. This hasn't been needed so far, hence why this is not implemented
>>> and no-one worked on it.
>>>
>>> I am not very familiar how the framebuffer is detected in ACPI. Can you
>>> provide more details on what exactly you want to parse?
>>
>> I don't think there's any ACPI support involved there. Instead UEFI data
>> needs propagating to Dom0, as that can't access EFI boot services itself.
>> At least this is all that's needed on the x86 side (and all the needed
>> code is there, just presumably not [fully] wired up on Arm).
> 
> Thanks for the feedback. At the moment, we don't enable EFI runtime 
> services nor propagate it to Dom0. So this needs to be wired up.

Well, the frame buffer info doesn't really get communicated via a
hypercall, but rather via start_info. Albeit for PVH my proposal to
reuse that wasn't accepted, and I'm still waiting for an alternative
proposal by either Roger or Andrew. IOW I don't know yet how this
will be done on PVH.

> However, for Elliott's case, I am not sure this is going to sufficient. 
> The Raspberry PI has some devices that can only DMA into the first 1GB 
> of the RAM (the GPU seems to be one). So we need to make sure Xen is 
> allocating enough memory for Dom0 below that limit.

Urgh.

> Do you have similar problem on x86? If so, how do you deal with it?

No, we don't have any such restrictions that I would be aware of.

Jan


