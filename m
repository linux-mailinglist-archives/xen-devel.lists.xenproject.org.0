Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E89560F94F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 15:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431061.683561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo368-0005GI-Ov; Thu, 27 Oct 2022 13:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431061.683561; Thu, 27 Oct 2022 13:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo368-0005DA-KS; Thu, 27 Oct 2022 13:39:04 +0000
Received: by outflank-mailman (input) for mailman id 431061;
 Thu, 27 Oct 2022 13:39:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cef=24=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oo367-0005D4-Nu
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 13:39:03 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2059.outbound.protection.outlook.com [40.107.102.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6d307b0-55fc-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 15:39:01 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BL1PR12MB5205.namprd12.prod.outlook.com (2603:10b6:208:308::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 27 Oct
 2022 13:38:58 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 13:38:57 +0000
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
X-Inumbo-ID: b6d307b0-55fc-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFRmNfY21KL4NazIxSQaX1MXKTsF1KFw9xYelgenO9KoOM9kbZEKToFnvszANZ8yyUlVSBqzhCUYig7NJnXJOqbbLFDYulmDrpMrwSxz5fEF9STKccyLPguqvpIZbpWicxlbJwFUwmWAxQc0eniOQfp/vAMMKJy/eTuHLsUE1dXKY+yr/vt0Zdt2ineQTuhW56iSJiyuxv/NHrvKYHkPHI2ITmKbJjLMsj+x0N4mZp7dNkcWcNZjO6W7xYuHmAE5+Dm0QtJGH4JoUAMkywf78pmMUP8Fm6Zj7fnZDZUevqgFemj8pRuUCSVeMcn1AKZSt2huWPt7MBeY8vImsHVYqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ih4QiThEgWEnw+Z5gksqekf4rUZ0mkCZ5D35fwR/f4=;
 b=g8ideGILa6X+eyTBCRNpx8lr+W/fvkWb1Swbb3sNyibbOSivHe2Ui9IAhxnSRmvcRIuORqJOmGa41vR2FqVSA2TKuD58NDwV1A9WddK6VT78V/H//JuHLdAhMHxZIZpslTEPlWwR4M6TzHWNn6tHgmjJk3fSDMSidDnbNVtbH1ZpBg1IrRj6TJ11CNwRq8Rj4RI96Ca1Up7q+KGuqjmD9d49r+HIywGrw6fFPEprICswsMFlGN6ocwsBR3V2JGQbu6vMBK+OulegOPW5B7Ij7aJ3SzlBiz0AgRTvWjf7/CSH2IH9lmI9U8i0uvL7HAGz06GVL6Pg2dfYSzz/h1qJCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ih4QiThEgWEnw+Z5gksqekf4rUZ0mkCZ5D35fwR/f4=;
 b=3tm8Jvl2AkETJ6RxCZdgWLSwQx/Eex5XFCC+BfpD85Q/P8mWfrzyvxGRJWkM91t/IFwGzWrqDe4ArR0feX6447ZTHwwMbhS1nwiF9rzS5uogqYYEJsgD5UlJibXss4uVMWFxJxzlNrhc54yPhd2fTD6ZSArKbk9altjSuoN5ekg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7f1bdc88-da6b-9a0c-03d4-319e9d8966d4@amd.com>
Date: Thu, 27 Oct 2022 14:38:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: GICv3: Aarch32: Need guidance on the atomic access of "union
 host_lpi" or if ITS is supported on R52
To: Andre Przywara <andre.przywara@arm.com>
Cc: "stefanos@xilinx.com" <stefanos@xilinx.com>, Julien Grall
 <julien@xen.org>, bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bedc03b9-e6b9-c85b-27d6-33860ba7bdd7@amd.com>
 <20221025145506.5708839c@donnerap.cambridge.arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20221025145506.5708839c@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0188.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::32) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BL1PR12MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: d968d4e9-a9bd-4f86-4d3e-08dab8209949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hsYCkwX2k50+fY2eFVFkzix3f/8iVCf4V0Mo7DFwZ6eBrpqX7VeD93fb8iTbWo4Hgyl3SdsKMFFIB/8WWs+S1F/9xRPse3Sn6BYizJH1pJiWorJ39+zuCSQdb5bxnOeHCUEMYA7MUBnzMBFYX+0Qv1EGeOQw9B4a0y0KOYD8h4b1JiPk3agbbirasptXv6klHiJaxKvRV1IsbCtkMlfuN/sLNz+Z+ZJu3g6xCUkSaMFGpE9qFMgwPs/5fY3s5ENDCHRnRUY1U0fxRCbMP+6KkCHhzTzP5P1xetjB8VE0ksELylekygDbBCDr0LWhsK/z3TekcUxD2RcbRvrlCEqX9/Y9lIWCFgHzH9Y1iSodXPSQoewhKcTh3UldshmmsqX0wtE9gXTT7BJ3OJFzfFE57mTbZDz3eTSueHYC+i3YkzXU+gjsYGIQ/UT/NCyUq1cI5WhsZ7oyM+QwFNXoB/qd4uVBL0pmWMT5LvK2k2CJxz7eo9d3/dn4P/zuRsTa3GWDM6f4WH447IV5l/qpldx6HgKoeemFc9p/51AqNlRTiSme6CecAkegzuRNacz2gPyQtqhP+uLSBY/edhCsWtfPaEym816Aet275pokNTQvivhrgntiFMzZRpguLeHikG0Naya8NhxDa3gxS081sMj4hAbMcBhqIvPSe+VWSuD3SQB+VmP/4ucjpCvnj5X/fLWr3gn3GuPnKKVAjUOGUf1dxh6WrYQxh1yaZ1nW7tjFlHx0YBFbcvFSUmDF144Ry2zvjnQZ5MYdzS7qHBi/gVgOYVmfNqdXL6o8vAnlBad+l8w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199015)(2906002)(8936002)(186003)(2616005)(5660300002)(54906003)(6916009)(41300700001)(36756003)(26005)(53546011)(6512007)(6666004)(316002)(8676002)(4326008)(6506007)(66556008)(66476007)(66946007)(38100700002)(31696002)(6486002)(478600001)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmJMOUp3QzJLUXZlS0t3Zlo2RVEweGZBZEJDL2N6V1RNOUtseEN1T2RmRS9j?=
 =?utf-8?B?M3RsbWNRbldVWmtxNEZ4M3ZBOWxydUg4dUJ0UjhSL3QxZjFXOEZBRUxRSWZZ?=
 =?utf-8?B?alBsN3V1TTljem41OXZQR01IVExrN1A2L0hrTVJuMkROeVJBdGdnYVgwYk96?=
 =?utf-8?B?cXc4OWNNSERBd0dUc2FQNkVYQVBEWnk4OURtWUhRSU9xYU9OU2hKcXEvNXY5?=
 =?utf-8?B?amVHMWVRZ05FcXI2YUNrUjdlR0xiQStVaHhFZ1ZsMUd2RGVsbHJOOG5Td3No?=
 =?utf-8?B?ekJaRWdVMGF2dzRwOWMzNUF1aU1SMmNoaUtBWDJoOGQvbnVCeWZBY0trNFgx?=
 =?utf-8?B?Um9Canhwenh5VVFHRHhITDFqZnYvc2tHWFgzR20xN0dBNnlnd1VsMmVLSUNh?=
 =?utf-8?B?Y2JValZDYzExekRxbXhjQVZqZ0ViR01FcnJrVGZNUlJNUFl1UXdhM2FORWYz?=
 =?utf-8?B?YXBkYlNnNEFhQzZvUG8xajFzdkVIRU5wZFhIaW9LMFlOR2dmd25KZTJZSzg3?=
 =?utf-8?B?bmNRdVRWSnAzMEEwWjlBWUt2WFBnWThNVDNvU0hHR2FjT3FEZGhRTkhmSWtV?=
 =?utf-8?B?SUx5dC8xcTdhQ2N6RTBkUDVSTEJ0dGpmL05oQjN3azlESGRvY0M0REJLdXRx?=
 =?utf-8?B?M2ZReUpCSExKWGFJTjM4R3c5ZXpMdjhndzRtRnNic0VveFZ4K1I1RVY1YVRK?=
 =?utf-8?B?UnpqcnB4VFJLUGRSeU1Lb2l1NThmS3dWcFQ0S0U1VWsvMTh1NmhkRnMwMUs0?=
 =?utf-8?B?c2wwd3RidmRabksrNDNkSTJ0TGo2RXBsdXdoYTJtUHJVcDRJQ1RETVI4Mnk4?=
 =?utf-8?B?c0NFazdnN0d1eWJKOGc5RGdXSzNiK1kxSE9TdDhmUVNwUUk5dlVvdER5MEYw?=
 =?utf-8?B?UWVFNHRuNlJYZmNmQXYwaWtXd3cwVGtySTVQa1hMS2NJcmlnZDNkR2x6cTlK?=
 =?utf-8?B?WDkrWHgySHE1SzRybHd4dGNWemlRZmszNGpadkU4eUc1WnJDMm1NZWc3cHph?=
 =?utf-8?B?bnNPL2pZTW5mZDBKOHRHc2NLVmwwMXVBYlhHNGw2dWFXM0dMbWdlY3pxTFo3?=
 =?utf-8?B?MC9PaFVIR1ozUndLVWxrTTJBMFlxUTFic3orSWRvWko2TUx2WDVOODRkNmhn?=
 =?utf-8?B?M2VEc29sMWp1aXpyRVh4YklGVzZGUitoajFiUmpHWVBJdHE5Z1FWZTliZVI4?=
 =?utf-8?B?aTdDYnhDUjJMQ3Y1Z2I5akJMUjQzQTJKNzNPSmZVUmN1ZUV5aGVUUmZBN1J2?=
 =?utf-8?B?U2dubEpCb3prMyt2RHVVcGVvUnduMUV6YUpqbmRENEgwcmJtV1pwekNVYnIv?=
 =?utf-8?B?QkZKK0xyRWgrM1l6Yk8vRk5iR1hBcnVwd1NJdFZCSEt3czFtdU9nbzVna2NF?=
 =?utf-8?B?UlJmY0J1MUJiRWtjcnRmekFkcDY3SHRRbHBiNFVKc2RsTGs2eC9KeDA0TDNp?=
 =?utf-8?B?dUdsSFlwY3N1NWFjUTlacmlUbzZQMGRocjRWN05GUTRzKzB3TUtsOVNRbXhq?=
 =?utf-8?B?bXg0dk9aSHIzcW5aNmJpYXQrLytCVzNZZDJQT1JVdUQwcktmZHNaR0hlR2tv?=
 =?utf-8?B?aWp3TytWdUU5UHRjZkhmU05TMERESFIwdk5XdkZpSFk1TXMvK2Z1RXFQbXMx?=
 =?utf-8?B?QjVNSnM4SGhsWFFab244OTRrRUNBalFLQklTbXJYMENMekV6cUNsS1BBOWp5?=
 =?utf-8?B?YVU4eVE2SXVkclhzWHI1M0lvYUxKbTQ3MzJwdEMremlHKzdvekRLUjBGSGJ4?=
 =?utf-8?B?TEZnaXF2OHZPZUgyMHRQYkFISU1PanpiRko2a1p6OEF3b3E5T1lUakRCUTdi?=
 =?utf-8?B?ZDQwZ1l0YWRhS0NaVVY3d2x2ZkVSVlJMeHIzZDJxUGRqQXJzZmZyMEhSYWox?=
 =?utf-8?B?Vncwb0JIMXNKdEJ5WWFhNXdZWEdvNXR2RkRRVXlQUWh6RngwTW1CYnhHU0ZW?=
 =?utf-8?B?MWhLb0ZoNlF1WUM5T0M3NVhaUVZjU1RPZ0srakd1ejNWQUV3bmVaR2RSUGo4?=
 =?utf-8?B?aGVVSXY3Szh0bjNpR3BZSzBIT3ZRL0h5Y2xqNGRkcFp0Y3pVMXh3ZnIwYjUx?=
 =?utf-8?B?aC9CMzhEYTM1Y2ZEUm5BY0VaK1dTZEtMUmk3S1VUaUc5SHprSjhKNVhEQXhO?=
 =?utf-8?Q?xCKMejhH9X6K/vxbe/27awokJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d968d4e9-a9bd-4f86-4d3e-08dab8209949
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 13:38:57.8872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4EPSzO+U5MnpclHDhIYpy/5oAGefUtNg6YqXMmB3obxwRAksWAq/W8t/0s1UP9qV2CbmHRjcTLor7qWRVF1Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5205


On 25/10/2022 14:55, Andre Przywara wrote:
> On Tue, 25 Oct 2022 13:25:52 +0100
> Ayan Kumar Halder <ayankuma@amd.com> wrote:
>
> Hi,

Hi Andre,

Many thanks for the explanation.

I need a clarification on the issue of atomic access to 64bit normal 
memory on R52.

>
>> Hi Andre/All,
>>
>> This came up while porting Xen on R52.
>>
>> Refer "ARM DDI 0568A.cID110520", B1.3.1
>>
>> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE
>> must not implement LPI support. "
>>
>> Does this mean ITS is not supported on R52 ? I am assuming yes, please
>> correct me if mistaken.
> An ITS relies on LPIs, so yes: no ITS on a v8-R32 system. I cannot find
> this restriction anymore in the v8-R64 supplement, so it would only apply
> to the R52/AArch32.
>
>> If the answer is no, then my next query is follows :-
> Answering to that anyway ...
>
>> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
>> index 9ca74bc321..dea60aac0d 100644
>> --- a/xen/arch/arm/gic-v3-lpi.c
>> +++ b/xen/arch/arm/gic-v3-lpi.c
>> @@ -423,7 +423,7 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
>>        int rc;
>>
>>        /* We rely on the data structure being atomically accessible. */
>> -    BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
>> +    BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(uint64_t));
>>
>> "unsigned long" on Aarch32 is 32 bits. So this bug gets triggered.
>>
>> Is it fine to change it as above ?
>>
>> Reading"ARM DDI 0487G.bID07202", E2.2.1, "Requirements for single-copy
>> atomicity".
>>
>> "LDRD and STRD accesses to 64-bit aligned locations are 64-bit
>> single-copy atomic as seen by translation table walks and accesses to
>> translation tables"
> This (and the explaining paragraph) indeed suggests that this should
> work architecturally, if you use normal system memory (where you would
> hold page tables). It would be confined to ARMv8 AArch32 and ARMv7 w/
> LPAE, which matches Xen's requirements.

Does it mean that ldrd/strd will not work atomically on AArch32-v8R as 
it uses MPU (not MMU, so no page tables) ?

If so, then is using ldrexd/strexd the solution for this ?

IIUC "Memory accesses caused by LDREXD and STREXD instructions to 
doubleword-aligned locations.", then the answer seems yes.

- Ayan

>
> But it's only atomic if you are using ldrd/strd, which you cannot know for
> sure in C, because it's up to the compiler to generate the instructions.
>
> This is why we have that test. Changing the unsigned long to uint64_t
> would make the check pointless, since the data structure is 64-bits long,
> so it would always be true.
>
> So given that you don't seem to need it, right now, it would leave the
> test alone.
>
> If you need that on AArch32 anyway, you would need to replace accesses to
> the host_lpis array with inline assembly accessors, to ensure ldrd/strd
> instructions. This seems doable (there are only so many places which
> directly access the array members), but would need a good use case.
>
> Cheers,
> Andre
>
>> Does this imply that atomicity will be retained (with the above change)
>> ? Os will this require ldrexd/strexd as R52 supports MPU (not MMU, so
>> translation tables are irrelevant).
>> Kind regards,
>> Ayan
>>

