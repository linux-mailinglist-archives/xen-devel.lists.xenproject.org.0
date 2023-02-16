Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C995699A9B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 17:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496677.767542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pShWZ-0006MT-8a; Thu, 16 Feb 2023 16:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496677.767542; Thu, 16 Feb 2023 16:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pShWZ-0006K1-5l; Thu, 16 Feb 2023 16:54:23 +0000
Received: by outflank-mailman (input) for mailman id 496677;
 Thu, 16 Feb 2023 16:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pShWX-0006Jv-Qc
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 16:54:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e0634d6-ae1a-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 17:54:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6944.eurprd04.prod.outlook.com (2603:10a6:803:133::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 16:54:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 16:54:17 +0000
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
X-Inumbo-ID: 8e0634d6-ae1a-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ft1YGPBrDdPni4AxLiuhn3/WeK3x18ND0GgAlViWtyLJ3MKIuO9aOOToPBaZvxe74aAxTh6maY7vYF9ytDlrZx9nUWjvKph7IJIJ9u4yTE1LZQN/cOa9D2ysTwYG0HNNM9zTVaThnHpGLKZJu4wjewQY/qwu8zW/BpanQixXFAB+cfsZV+iYmfQ0b0RVP0vy+wsCCl8ppvvFpimQ3awwkbP8dppM2kkhiAZJyuCIlj2HY7DJudwFm0wTSmNT7Hs0KCnjEUnwqxroztLXMwb7MUGbd8V8i8vpiRaMoYwJA7bAoyWeL0AcwZOCHoaifE+yUQ6ZeUoI4fBBvY5iHWjg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCLsLa+Vl9xWn1eps/SOOfDbga9BWYmePRLGGMrYXso=;
 b=dm5ILsSJXRRFU934+XgRkiAwx5FjWmMjNeed6q4XKQjVlqEzgWG1NLcT5jx9+SXeImRoN4khBOTL25PmXsG/WbEof82A3kBbMdpbJkGcJxSXF2uPbCjbgI1et+HINHHJzYna8CYeTqiiYP7hYIFZcNczt10ZNTeVeaHubST5ApGa6H8zrBpLWlIl/SLwtJ4pjgZWwMD/KmQSsHTdJLPJ0ysPTm9RhjhfP82UlvJ+F8GPnLBofq+tigKKuUH38fcCA2MypvqYJDr+MxedDzeN3sh5LTe7dSNpT4BA3OQ6wyxo8m14KLQiN6eonKrL80WVCtu508GgX9w0NfNuzoAaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCLsLa+Vl9xWn1eps/SOOfDbga9BWYmePRLGGMrYXso=;
 b=fP6owUyv/P5v0hpCfGQ2JAQvC6MUmqCWtvMMqIwPfeVW8EJn44Jwm0Yb4AcS78kY19EvChZg7nJK90teEUvbvewdAGLgfamG+dzW5QeqGuQdi601YjM4DyWqqfzgeQiiW8tbBcIrgEWTJ2ztCCuNXaIya28TlUA/p2d7snRuRfPG6OV8CNlH4OmhuvuDBZwZ4RaD9op7Hu8aHtaNnKqEcAA3sTqVvW0i/gTGX7FAv5NucliBINBzdq8bJuHfrCfov01D+MT1/oMFaapJy1yO5xfj/TfOv2HIBjcmc7EIee1cHDRTE5rIS6Vv2JN2Jlr/XJVvR0EFWvz7QvGEd3FY/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f1ba096-d51e-00e6-1038-db01008c90b7@suse.com>
Date: Thu, 16 Feb 2023 17:54:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [XEN PATCH v2] libs: Fix unstable libs build on FreeBSD,
 auto-generate version-script
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230216141007.21827-1-anthony.perard@citrix.com>
 <fa7e1420-b7a3-23f5-e0a4-99bc8905cd91@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fa7e1420-b7a3-23f5-e0a4-99bc8905cd91@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: a6cd544c-fdd0-4f7d-44a7-08db103e7101
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F9sad5kMcp2ignKSljVnrWTQj+jTP0INwiYFxhOVOBwZHNdOMlIybdwas64kVJkT4p9HQMkEgWzaqWfSknmLJyv8nSAiziOlb6EZXOuLN/L0/LyNJ7h6G3v3zhjufihLQD9GibKE1hWbhgfTeMmveSvzasY6PQrz/q2lR5MhTkRm67lvXOsVuOAZoxSRvg41AWUSEK1VTbyUVkzhXzdkYBAlkUCnX5fAvyhtGnYHtKcgmG7KFvLfE09Dx0Szlb08BjiOaj+5Y0BhboEGC4PJbl6AX7Y1LQZDQaruU4UZQoXbPLyZpFL+XcelndJkAiaB4aZZkISJatrp5ObsCyfL644hgaXjJsxAtY/DOF9r5N5V5BiQ/sk9ZEdnoUmD1e0PYiGxTISFisLs4mLwlvgP2t2p91zXB6GTgPDK+6R7acSlCIbP73vicJ/VrXtdj4Cl8QsjzA5dB5eQwrRqgRw0UvcxEFTcZnWIuvYlxRBv+2MVE80JeD/iTvFoCoBHl3LVGbkCd/igbt60XZItleX1T50mY3Tyn7RW9UXUBWelsnMR/LzwVflu05bejvZwr6OoHt/fokJDObWIVaWbS10AJ31IVz6+Xw5QeucIsWQaZh3qDUW6ThUXr6e7PoeUL3qoVt00apm7Nwk90KZJF3MLruXApMVD/eH9+PYqbAyW/2WInu9hR2GcCKQ8WgntDy+lDSzU1OKeRlcPwYSjaWms8ko6LoG0z9PQO2yPYD71Y5Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(376002)(366004)(136003)(39850400004)(451199018)(53546011)(478600001)(6486002)(31686004)(6506007)(6512007)(186003)(26005)(2906002)(2616005)(316002)(54906003)(38100700002)(36756003)(66476007)(66556008)(66946007)(6916009)(4326008)(31696002)(86362001)(41300700001)(8936002)(4744005)(8676002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmFnNmVHN1VZZGtEd2lDUzhqTGt3cVNHWmYzMENvZ2dYVmNSZjBrQlVLMGZz?=
 =?utf-8?B?ZTFvcTQ5SlFkYXZKTXJRc05lNTVhejFzaEtIbS9qSHNxVkRtLzB1dDFCdEs2?=
 =?utf-8?B?RXhiQ3FNVE5Sc1pRbk5FOWR0eFhnZ3hYdHZNU1BrK2dTcU5nUlFVQkM2VCtI?=
 =?utf-8?B?bzlZQmJaRjRScnYremIyc1JXMkVlbndaaWM2NUxMWnRlZHNkUzVUQmdIUnVE?=
 =?utf-8?B?NlQ0NUsvVHhNRWpQMmNWQytseEFEMGdKcTcxVHJwUExPSUJHdjVQRlhScHRy?=
 =?utf-8?B?ZUlPQkpkY0Nra0MvWDBMYzl5WFUvMXBDK3pWOW9xMjJTUStoLzV4ZkU3TDNk?=
 =?utf-8?B?MDBIQ2Eydld6dGEyZ3VpQjNXR0Y2WUVhNkRaeWo2RHpBVDc4YWw5SnlEaC80?=
 =?utf-8?B?OXFkNzJWZG13cVFSaVJMMVREZThFM3pONFhjWDF1bVAxUHYweFpZTlk5UUVo?=
 =?utf-8?B?VWI1bzRYb1ZnT0xHYm1OZGRZRm11NXhSQ241YWYvcFZ2S0pqcmxiM3Q4bHRS?=
 =?utf-8?B?eWlTU2lqQ2RYYW8xOVBMNEV5TWRwTWNEZTc0aXVEZGtGSy9QYTNsSGJXVkdZ?=
 =?utf-8?B?K2lSQXJYcktYN3hYOGE1SEJGb3dRa0xOQWg1Uk1pejFkOFFsNUYydXV6c2dT?=
 =?utf-8?B?NFUrbSs4MFBOd2pvSGx6VDNBNHhZcUVZQjZNektUWVNtUnl6anVmTnJ2cnZw?=
 =?utf-8?B?Zmc4ZXZRc2JkQXZHWVdzYWUvYjBUK2pYd29LV2c5ZFpHZkxFTG5rclNBVWFI?=
 =?utf-8?B?ay9jdWdld0llYkU3SWNOQ282TC9udUlWZmd2NXRvNHB0SXdiQUxBbzRrWHBO?=
 =?utf-8?B?SVdaSXRjVzJEWGlVS01odWc3dmdoZEpBdjZNcmN0YnhBMVl2Q3hRcDNRRlZq?=
 =?utf-8?B?V29HenRnL05oVEZ0bWlzV3RlWmlIOUYyZjhwbnhISXFEckhDRHlMSWhRbHND?=
 =?utf-8?B?a1NxTTQ3dnNWNE9KRVY1Y2Q3QW12QmlhWFJhMnRaNVd6TnR1aFBySHFwZXZZ?=
 =?utf-8?B?T0hpUVNCQ2FMUEpYV2N3WjJFZ1cxeUR6cHh2T1liazVMNmI4REIvYi9QNHlx?=
 =?utf-8?B?TndsWm5tU1U3Ly9ZN1B0b3gzSnNhWDNUMytNaEJXM1lQS3FQYUdlbW41QnRx?=
 =?utf-8?B?YS9sa09ZaHNuZmJmZWVFelFlQitYZGlzb0pzeGR5QkZnT2hrSXlDa0hqaS95?=
 =?utf-8?B?ZmV3MmtEMTd4QnFyekxOQ2plSzU4QW1jUklBVHcrcjNWc0dTSEh1Q0hwdnVr?=
 =?utf-8?B?a25SaHZLTENHbk4yWEd6ZCtnMDEyM0pyVjVWVG1ka2U3RGZSM0JYQUpLR1Bi?=
 =?utf-8?B?eDFSb21NUnpxWXR5YVBLc2VOZkNXTVZHZTBDRVFib0I3eStJcUtqbmxlNHlq?=
 =?utf-8?B?Y2JVWUswclhUQ281RktLZnBaTVZZNlJYK2htcTdIU00zazl1eElXeUIySTF6?=
 =?utf-8?B?Wk55SWNMM2xHSEFUcEZ3a1hGR1RSbjdjN2t4LzJzcnUyaG5BUUk5VW5kUDZI?=
 =?utf-8?B?UFFBdGRybkJaMitXWU9KdXA5MFVRZjNsY2x5WXFFMVBrWGZ5NTlwNFpjZFVv?=
 =?utf-8?B?RVRzZVhRZlRFajBlUjVzNEhzdFk5YWMxNGd3b1lsS3N1Z1pITmcyL25QdGFD?=
 =?utf-8?B?UUxCdkszOVZLcXhMNzlKMHdudTI4YXVZT0IrR3c2dFpyS0x5Z1gzckFQeGdW?=
 =?utf-8?B?blFnUHRyTE5GQmgzRHErS3NobE9tREpETmpiMDMzd21KSVdFSDJYcmRLOFFS?=
 =?utf-8?B?MlAxYnRJL0htL2xyaEFlTkxvSFlkOXFkYkN6ZEdwKzczTVBOQVlxU1B4QWdI?=
 =?utf-8?B?NGVHOTNONFJtNmd1blpCZ3dabXJnb2s2UG9yZ0Q3RzR4N0dIQVJPYnpOQUlD?=
 =?utf-8?B?d0NRSkNtYVVsMncvbEJGRFduSVczMGUwcEw4emE5WDdZWis3dGZSOU82V3pL?=
 =?utf-8?B?M3RPVTF2ZVhJa2xrK3V4SjVvd2xka1dmZlIyR1J2MkxqNHJ2Q2RNdGtoUVBX?=
 =?utf-8?B?MHJnQnI3WkhFVWVPRkpoVjBFaXQ5REluVzV2QXFhZk5QWXY0bmJhU2tYOW5H?=
 =?utf-8?B?Rm1uQjBoT1JiYnF2bmxTRExkNzFhdUpXbFBKK3VYYVdOb2RycUFBQm5FTzlD?=
 =?utf-8?Q?9SyVSHkfqX4jmzb8TKJec6sXq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cd544c-fdd0-4f7d-44a7-08db103e7101
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 16:54:17.5013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUJ7LCvtKIDgAFvsQzgj/ienhwcKO5fwZuqr67FQCWgOwb9zinle3CYTp0a+gY13jmge5qlvbZIqcE1jNXW7Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6944

On 16.02.2023 17:50, Andrew Cooper wrote:
> On 16/02/2023 2:10 pm, Anthony PERARD wrote:
>> diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
>> index 0e4b5e0bd0..ffb6c9f064 100644
>> --- a/tools/libs/libs.mk
>> +++ b/tools/libs/libs.mk
>> @@ -120,7 +127,7 @@ TAGS:
>>  clean::
>>  	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
>>  	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
>> -	rm -f headers.chk headers.lst
>> +	rm -f headers.chk headers.lst lib*.map.tmp .*.tmp
> 
> Doesn't *.tmp cover lib*.map.tmp ?

It's .*.tmp, not *.tmp (but I agree the leading dot is easy to mistake).

Jan

