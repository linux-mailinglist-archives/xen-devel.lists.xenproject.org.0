Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213CB57812A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 13:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369707.601195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDPB7-00076d-Tm; Mon, 18 Jul 2022 11:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369707.601195; Mon, 18 Jul 2022 11:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDPB7-00073o-Qr; Mon, 18 Jul 2022 11:44:45 +0000
Received: by outflank-mailman (input) for mailman id 369707;
 Mon, 18 Jul 2022 11:44:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDPB6-00073i-9t
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 11:44:44 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50078.outbound.protection.outlook.com [40.107.5.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03571508-068f-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 13:44:42 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 11:44:41 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 11:44:41 +0000
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
X-Inumbo-ID: 03571508-068f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHh6RkuHRK78yw8ZkF5bLC164JEB11ktcMRW0fK/kahUKxzAvqE/A13GD6hAoJVVf+ipknzg7SxlylQRTap2D4GJ0WzUi1OLuDQYIV7nH9FwB0N4aciMkpA55LZ6S/aVsbddAA3TX36PMix1qVUm09AphNyefSxU1h12Si4x48jzquHjddqTe0o8/swFk4TAYs4ShIcIhSHi8LZKk7gTcwjnTswuUlFa2qEUdOhnGg9oXuEnOrSyrYW5+juzj/5F5isO5Ww71O+oDOzTki6kKexLptLR0d6ttEob2aAZXDi2bqdXCqEa1l4y7GIlbylab7lqJSfOw0tZcVZXnH/Jdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRwopZa8W3JKHcoInQtQujPiQ1LWAhBAeND4hEXgBvw=;
 b=Lr8U3IghAJHLINDNKXCYD8JXbtvjO1d+DsvIfH0A81hwDg/MjuAVgKkM7VYOWVgVFTlqNDK7iOWgf6E/f+SSGW+zsrheg7r9WE1FOx9cm0GvE0WnVbgRo6BJ2lX0X/bzVJav69s9mS0biW+n/UIFnXATzD41dt7BZu2AAUmAjP7BUOqn+OiOczKhdGxNDip72qrKQqABeTu3XYch+EbyzbnziOCRKQrdL+TocdCYNKj9Zqurl51a36HiGiJGT6YlKogeHEVsWMDnn+pYia8OLWCLMBkN8YnSeApFEjbh/2rDEApfno75u7fVvXNtgB/riCe71phFwmI+5fUXLkpg4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRwopZa8W3JKHcoInQtQujPiQ1LWAhBAeND4hEXgBvw=;
 b=VxGEO95dwaT6YKI9T2aadh4mbP+zcGQxuaaU0Icav2COxtggj6gpH5jDkRz+ByoQrL5u0M1qTrLa2eYuxuAgWNZMsjPPkVjt4tMcfKDdSX5wBXs7xnX+lG3T/ukY3g2M5vF3O2CUlxPlxs/BxOVB2z8jSLuCWlOLcNO4O/Zvajj4xZ+eBExEu4jvz49XSP+We6nnMAlWmEDRhV+ew2Qy/6Qe7Xt3josYWev2nPyGsx6EL2DlCYsE86INuhOGrC5HBfctLIr7qx8kyOm1jWGab7zmUrN19hhUpkl47BKJtlnYKeQD3bE20DthUKfTSiWPN+GMKkiOn2wuKFXV9f3yVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a5c7db7-75de-59c2-6c17-58a5276189b5@suse.com>
Date: Mon, 18 Jul 2022 13:44:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/9] IOMMU/AMD: wire common device reserved memory API
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <457056cbc6dcc00958b1f4e0cad35121e0cd1557.1657121519.git-series.marmarek@invisiblethingslab.com>
 <00c64c2e-a007-8188-469e-08e8c8cd25e1@suse.com> <YtVFhljIHQBhHQPt@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YtVFhljIHQBhHQPt@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b79a3bc0-1bb3-4608-8d54-08da68b2e69a
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	upVlFsjta8ss8gYWGgIaSP+zZDKMed9AnOnE0yyDDOqp/gE0i+SIoHWeX3HdrkD57LPpkzhzulkYX9OA4LL2Oz7if2uiQ4KW+FJgn6W06NAOUKsL5qEeMCHg6iulGyP2k83f1ngbyO81E7L9nrFKM/xuyoNky0rEVFhH1NurTu4HdEJBDVsE8A2BwSEVPduRkwyXW5xyBV83/PbO39ddErX7/NhqWIVrOmIXWhY6T5eVreV6vfQ71VZy1Sgm2pch/gkNuNB8pdg65IgAXo831hpD8Qu9EFSelUcRgbHKWDXqIl1pwbrhIeEd7gLcsVmPNrd8c8jY7VwHoRvXMmOjbNo+uSWlc/XVmbG9IFjNS4pqglQbS4Sc76APCYrk+C1p4jMmSnAsH1TaHoL6DeCgrFsTeoMNfrbQh6KvAN8Tk5XVuggYDRc6tLKdmTK1ZI28LtO/5r7kIreH/r+i1yh7iqIOEcPxKZ/pxEiNx+0tazAWsiTcWqxrGAZEzq4bKxGTcHsLM5gDkOQzLEpRmNwK5QViC9iJ+IvUUoHTGhJ2siQSC4eVW5xJ1r5cmJnOIDO7K0lQLDTkRPdxrQGRw0RHwlOVHC7A27A/P51zu6LAliMm+ySU217ejFoaqVzEfOKLUeMcfKGB/6Pn6Z3Sz/+ozo/RKW0FMeqHHj5vREpU6Vh0EXTvos/q7hCC/raEaW88TGY+gxAnOzpqlzp64Om6haqaRp/iBj1pLRrXya8NB/pVfCDsFtYd6JAgW5qMkd5Vs730ae4EXp8Rs+yDGK2JYZ7Ghi6CaXzyaRnMApfJ1SABvOrsGL3Q3RSK7dcYviB72yZdjfBkjotegkKfG/eEp2UGJNk4jisTDmep6hr+qKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(396003)(136003)(366004)(346002)(41300700001)(6486002)(478600001)(186003)(6512007)(66574015)(26005)(2616005)(53546011)(66476007)(66946007)(6506007)(38100700002)(83380400001)(31686004)(2906002)(5660300002)(8936002)(316002)(36756003)(86362001)(6916009)(8676002)(66556008)(4326008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3VUVGtVeEwrRWo1anVYZkltUUxWeEVraVlqUFBxYUtwQ2Rmd1N5eHpCYXVM?=
 =?utf-8?B?Z0lvNjRpRHV3NzVKSGZFMExXVU1JMWI4djI1ZjNKVFFDUDNKK2dpT2tzWkE2?=
 =?utf-8?B?eVVoSTFaZ1Q4Zy80UUlaT0hQK1lsaXJuRXQzQ256STBRWGNsM2VZMUhKK1Br?=
 =?utf-8?B?aDFmUFdlM1YzS2lGalh6QXZvNFhKdG9HdXZMR2Q3clQ5UjNMc0kxUGx6MzhW?=
 =?utf-8?B?aVZwVWx0bHV5V1ByNlZhdkJZQ1pXaHMxSWVtMXM3V1ZXOEs4NGpSV2o0U05z?=
 =?utf-8?B?Q3Y2NDR3RjYrZDQwN3lublFFbzVPcXovV3V0THhrNXZJa1d2VHhSMktKRWJx?=
 =?utf-8?B?M1ZxZlhSSWxvMXg5cC9VSjFHMTFRZmdueU5MTW53SUU2emtuTGFqRkI5RE1s?=
 =?utf-8?B?bVluZTZxTFFCditSTlgvQURSNmxqL1F5akNINzg5U0ZEVXlpY1BzUTFyQ3A2?=
 =?utf-8?B?NTJHZThiUkU3REN5SmR1Wm1MSGpBbUhQcW1heGtNVkl1RytVZFBGTTNINnE0?=
 =?utf-8?B?aC9sMzh0WDBrSGFkZm16M2F3c1BWZXd3emJSZ1h4ZEZwcitGbEhXYUNWWDJZ?=
 =?utf-8?B?U0hrZGd1a1BPT1FaZE1mMTZLV05xSmdhMytCTU1ZOWtmSFMxeHp1empZaFF5?=
 =?utf-8?B?L013Z0Yxb2QzOEVTRzlON0liTnRaYXVhalF5M0ZLdGVCWXQ3SUxmVnpqK1JL?=
 =?utf-8?B?dGVKL2FpY3RXVXdLbkpjczJubWJjMjFQZUxUQzNNek1VakJaR1RpamRIY0VT?=
 =?utf-8?B?ZmEvYmozRXV0RnZTOWFQOXA3a0N4emtiei9UWHBpd1o4QzV3RkFoQUZNRy9a?=
 =?utf-8?B?L05oU0JOeEZveWRPbDFQWlIxdXphd25NRStYWFpQZVo0bzBoZHF2c2t6SFVh?=
 =?utf-8?B?YkN2ZFZXV3lPdjJabzcyWVZYTkpPMWVEYXRvelhtQm00NXpmZjRpQlBuUVpx?=
 =?utf-8?B?Z1lSek9HTVYvSzFWcnQ4T2dTNmxxalVlWTU3WkxHWTRDNXhSeGJYSThlWHl1?=
 =?utf-8?B?ZWRSdUhvZDdTUnN1ci9iQVBzUzBod2dQMk5tclhpRW5LZXJmdHlPS25zN3c3?=
 =?utf-8?B?U0VKZUlFblV4dHlJVnU4UkptUXlOUXNyeUcrR25vVmM3bnU0cDA2MFB3bXpL?=
 =?utf-8?B?OERPTWsvbk5INE5UVTUxNld4cGR5T3FWRVJWSXhrTlc2dVVtTzFiMFBtQXBz?=
 =?utf-8?B?aFh6TjJEbDdGRFN5QlZTVmpGeEZYZ1Z2R2kvVms2bzE4ckJza1kxMGttRzNF?=
 =?utf-8?B?YzZoWm5tYkJoNUcrbHRodzNrOEI3L1VEWkNYVWlsYStPQk8yaHczZENlb3hE?=
 =?utf-8?B?elc3VThrQWlia0F4bDc0OEdYUDNjS05CcXpZMXNLQXp3LzJYTDBSUVhoNlRZ?=
 =?utf-8?B?Qmk5amU0QjJWMnhWeXpVOWNEOXFYQTZrM0d3RFdNd3VEYVQ0bWFLSVhPSHNx?=
 =?utf-8?B?cXl3NEJKM0h4aDJkcHhIeng2cTVDakV5U3lkTE5mV0l3aVdjSWF0c2hML0Vt?=
 =?utf-8?B?c0pTM1RORWZmQVRZeVdSNkhFT3NqcU45L3lvZmRMZGVMeXJuc2NZcitEdnpw?=
 =?utf-8?B?ME5qSlNMUmQwNXFPb3AyUkp6c3BXRjRuaWtQMWNqVjlwMkNrSXdjMGVvRGhD?=
 =?utf-8?B?Z2ZNOStDa3BIZFp6Uy84ckduWm5POFV6T3E4d1ZrSzl2Y0k4b2NpN0R4eEZU?=
 =?utf-8?B?QkZIUTBwMHJSN0NzK3lQbHVHK2pmaXllYkI3RXZDY0xsOGVUYVVwTWtDc3hj?=
 =?utf-8?B?UGJFZVZacXVGaFZ0NmpjYlY4cjhlTTBTMElhaGg1ejM3aEJuZlVQVlRBNEw2?=
 =?utf-8?B?TUhUbDU0ZU1Zd2VXdGpCd0kzbWpUOTFiOGlzdzVTV2ZObEYyclNiK1RabjZY?=
 =?utf-8?B?bjQ3bWJONHA1NnVLZmRtWHhsbDFHcUdLN3BUTkZzZ1hNaTRsUWkyWTFnak1w?=
 =?utf-8?B?SHFGaWlXTlc3dlZZS2tsdG5qNzlDdDhWN2ZsT0N3V3lqdGtKVUhTOXlvaXhK?=
 =?utf-8?B?bkZlVTNZclJ1NFNqMHE4WXNPTDVPQzJPWGNrZUllWXVKWXNSaUhGbTQ5TmFl?=
 =?utf-8?B?b1h4NUMybkR1NC9VUEhxVjdtcXNIWHlvRXg3eUNuVWliazZRSHNQN2pibWdk?=
 =?utf-8?Q?lPOhB4I49zXZg1OrKFB7ejxFO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b79a3bc0-1bb3-4608-8d54-08da68b2e69a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 11:44:40.9952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RU0u+HTUkWSQ/Hq9cNPz+GCj0cQrdLmb8c/eExX0Zfg5OVH51osUYmxOKMlPaUxyk9E1nWy+delDXMTSxja5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8774

On 18.07.2022 13:35, Marek Marczykowski-Górecki wrote:
> On Thu, Jul 14, 2022 at 12:22:36PM +0200, Jan Beulich wrote:
>> On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
>>> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
>>> @@ -1078,6 +1078,20 @@ static inline bool_t is_ivmd_block(u8 type)
>>>              type == ACPI_IVRS_TYPE_MEMORY_IOMMU);
>>>  }
>>>  
>>> +static int __init cf_check add_one_extra_ivmd(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
>>> +{
>>> +    struct acpi_ivrs_memory ivmd;
>>> +
>>> +    ivmd.start_address = start << PAGE_SHIFT;
>>> +    ivmd.memory_length = nr << PAGE_SHIFT;
>>
>> Aren't these at risk of truncation on 32-bit architectures? We have
>> suitable wrappers for such conversions, avoiding such issues.
> 
> Well, this (and the vtd equivalent) is x86-only, so it's always 64-bit.

Nevertheless writing things cleanly everywhere will reduce the risk of
somebody cloning this code on the assumption that it's correct.

> Anyway, what are those wrappers?

pfn_to_paddr()

Jan

