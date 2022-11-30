Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A917A63CF9A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 08:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449730.706640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0HEH-0003nF-Cs; Wed, 30 Nov 2022 07:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449730.706640; Wed, 30 Nov 2022 07:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0HEH-0003j5-9n; Wed, 30 Nov 2022 07:10:01 +0000
Received: by outflank-mailman (input) for mailman id 449730;
 Wed, 30 Nov 2022 07:09:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0HEF-0003iv-J4
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 07:09:59 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff128d46-707d-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 08:09:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7344.eurprd04.prod.outlook.com (2603:10a6:800:1a1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Wed, 30 Nov
 2022 07:09:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 07:09:55 +0000
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
X-Inumbo-ID: ff128d46-707d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHxEnU+/E5zCMFZd7Od1BV1Ch6nTd7HclqIKC2D/O/+7PztoRpU5o2/wsMCK7m58e7Lz+H2yGht9BAb7ASHXEdku2xCsQz+gooOCHymekjo3FVrUTeFHgThDoa6mTwCALdoZo/ArgCoXdrb+hiI+WDKsENWvXWKiLo6Q2/VgXgfTVgz5m73vq7syeHv0TifZj4QCANqu9nflvNwuvc5sjsT1Ij7Y03stz/A8tob4cVLGLCZy94epBSfl8OrMyPeap42NxvwLPtFEhpg32B9xPXlbggkECQA3LNHMJAEME/Asw6ZjraRmOTkbHenovHf1gmtOBicfqVVLf5ObUVU2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpyK08Vqk6dONHsWeVR2ow6OIUp6q0mwqG7BsJwv2po=;
 b=J3NCgH+z2nOtaGsupPs/yi3L+tc58g3dqk1fobVBUaNb1B+/OFq6M3O8YnW2kk1cDl7Y+Bd9j7ayFA7CLauW7NQaUXWb8GD7TAXiUnV1Xm8V5sdMPylSQK9IU2Or73hWz4lNjC2Cem7QAXgNWEGcccYFG1Vx/ErsfpuMZ345DD/DKm06UyCQp4CIdeXl09Tjzv8ch+RtDc5AtXC+0wRO6RZPpRj4T6eDgbSI3xMH72Igg6WgkyExboERMeH4CAx0xIecZQV9eWNr4wm3IvBY1uADjbaSxC4CdPrHD3WVkbdgtJg5PuvylH/uBofSfEz0n8bRvzrq7G03fAz67Uirlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpyK08Vqk6dONHsWeVR2ow6OIUp6q0mwqG7BsJwv2po=;
 b=378mGQ9naG7K7iybiaSOvVMdrXVmbrha0AnAq3w4R1R6vism+Me8QRej0F2S6dRW4YmzR0osCZTvH3IeGg1M42Y/FK5ZmJjR3717/zrf4XRrXCLCH76x1FDokMUAkMm/5fAVL+Ov/tTY1tqdTLsM7wK+L1rJr79s/EfddzqWSafYWdbkl8dRaw7+Y/x0wzKdGWhKZWgWo6U1PnVhDMydD1AaQixsUnOca1QOVqTqEX6mcWtrnVZ6K2rEqgyfjZ8SPMV092EJjbGJ1GsTE2/1w3+LTCnOZZaewj8f6TXuAmQOR+iRc7gMoRvK/0Vetgc1AtT7H3oWT9E2cGJ2uC+tXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22d28805-8889-25e9-6d18-c868bf5e51bb@suse.com>
Date: Wed, 30 Nov 2022 08:09:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Arm: AArch32: Need suggestions to support 32 bit physical
 addresses
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Vladimir Murzin
 <vladimir.murzin@arm.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <70651dbc-085d-706d-17d0-a419086a0700@amd.com>
 <a352eb18-0ae6-a1f3-08e6-87f53494ad8a@xen.org>
 <65891843-db28-e5dd-6e9e-3fb003fcabc5@amd.com>
 <ddeb7a03-cab3-2a26-7f64-3a1b5f0882d6@xen.org>
 <105a0d45-5b3d-7986-92c1-9a13eb803bd8@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <105a0d45-5b3d-7986-92c1-9a13eb803bd8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: c782e178-8f28-4851-6600-08dad2a1e222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vnac9Z2+nUSAjOCYkX6lQNkhhx5aoWYRxjOW98eP1lM540bzYMdvkyPkP7a+20l3sxGduNXFbz5TDIdTnzshxggWgMvFpHt3/Qy6xWkq3avz0aPeLdfBj3sC18zA4CWKQDk4HV6QjC7lma3jgngJGkIYUT/uRm6ISeoCmZYucm/dm0SsSC7o3fYTaLDmoe8eanbrk0fl5j1nSYv+XGuOnptB1SA+aOaL9cFVMN8eg0GcZaMxlBj85AALd327kQZDM5ttAHWL1aKGW8stQdEJFy6pRvB6SDI9PMAQqwQ9ztzfYCgaG8QcoB8i86HpZ+YFxtAtnxug6xI3/TXETNgsxkGEo2N8VpZWVihBb8LgpH07E2kfiIgtpJmw51dqsurU4gtkAmgm0kxXfW28rF5rWxIxOWfyZqApw1fg2qAZBr/lhdXvAcKGSd6NxSNR0S2Mi1jm9RqG5689TI0j5gkJHgQ8YD2l/RBX7+GKvYjTre2tIlSbHYhXh/RLb2pLqyq8CxUeWjtzJsJrWie3dYwxiHUOUbuDEu/6HgPR2tU6Hb8B/8EQXzh/p2viWYQw6hhkyH16uIMHlvq/72S9GrIi4z7De6leRfr+37TsluaA25S7LAsmu1oZgddhIttebErn7YecuPJcjpaMQnsrv2C3Zn9lFCQ0oy4Lr9SLqvXUxUXrJRpk6AqtySJqjrwWDGmclC84vpx0dBnktIW5uUMuuokju+ipRcRKShWC568D2qA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199015)(86362001)(83380400001)(66476007)(31696002)(2906002)(41300700001)(7416002)(6506007)(8936002)(4326008)(5660300002)(26005)(53546011)(6512007)(186003)(316002)(6486002)(54906003)(8676002)(38100700002)(478600001)(6916009)(2616005)(66946007)(36756003)(66556008)(66899015)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXFVMERJREZmZXFFMmRDTzJDeURMdDdiL0lXWjV1WU9Sd0xOTGUxL2tmekJP?=
 =?utf-8?B?MHVzZ2pCUGZUM0lQSWhoSFFLeVdoK3pYRC9KMzJ4Qi9JOEFyWmkxR3BLVTdY?=
 =?utf-8?B?d093T0NHaDZrOHlwcFRrMlZEZnd1Qk5oZDRrYThBQXZSVC9HR2tLenRjVWdO?=
 =?utf-8?B?bXd6aGd1bTJOWFg4MkFVNGJrRExCNHNRRTc2cXVEZCszQkVpRzNNR1lvR0E5?=
 =?utf-8?B?b2tuVXE3OU13R21ZeGFQV1N2OCtxZm1tQ0sxWWh5ekFQNXR5TkZJTHgxK1du?=
 =?utf-8?B?b3dCK201eDc1bzVHVU9KZzVDL1BlN2x3R1B5TjlUejArVEZSRXVBeU1mb01L?=
 =?utf-8?B?K1pjcDRhVWIza3JZTjdxZEhzaFlaaGhCaW9wNTB4YW5aV1NBM05nNnNDc3U0?=
 =?utf-8?B?UEpNY2F4bVpJTk9XenAzaHMrQ3I0dmR4dVRTMzAwclZ6UXh5dHRaekRtTXRO?=
 =?utf-8?B?ZmdTNURNdnR1SFMrUG54SElqK2h1R0pmeEs1OVhVdStJVEhpK1dSaXFsZE81?=
 =?utf-8?B?R2JScm95bm5JSWJqOUJ5b2N4aFo4ZGw3MDVyOS9hb2Y2T1duZVNzb0k4TEhl?=
 =?utf-8?B?djZpRXEvZlJTcUdVdDZRVFpWdWV4YVVmbzZNNVR2b1RpejczcTlOR1c0dHpE?=
 =?utf-8?B?NFBOZnF4MHFtVnVubG1KN0VwOE93WnBJYk1xcDh4TEhTK0tSMEF0LzdZRjlL?=
 =?utf-8?B?WG5ZUm01ZHRDRVVCaFUrOXFNT0NpMTR5YXh5Qy9CV0RKcmlvYlYxYVlaeFk5?=
 =?utf-8?B?R0tJKytaZlBtS0J2VGh2aWVtM1VpSGRoTi93TVJlam9RWm01WG4yT01aUjFr?=
 =?utf-8?B?SWY4R0xkQkJTUlFaNDBxUnA2NFUyUm5ucDArTTJFMUlCSmRzRnZJTVFFZWJp?=
 =?utf-8?B?dlpjWms2cVNaLzYrV1BiRCtZdSs0K1UwL051YzRIRGtHRHRucUhlQjI2UERM?=
 =?utf-8?B?a0JQTDY3ZVhtMTdiSXNqTU5xK0lnR3kzVzJUL2ExaTF2NzZBYVFSRUtROE8w?=
 =?utf-8?B?YWxCaDZmMkJhRUxlL3c2ZnEwZ01YM2lLdGhpZFRPbDVMS01sTmpCYmNHVEhR?=
 =?utf-8?B?SlJpbmk5aFVZQlpReG9mUTdSVXhqTmQzQVNja2lHWjJSQkEzbWR1TFZnT3ZD?=
 =?utf-8?B?VUpCVUU1dlNZTVVwM0Z3MkJTamJtVmJYK2F1dkVkQXhneE5pYUV0aUVvVFJv?=
 =?utf-8?B?WEVPbzlRRG0zbTE5UWQyRnZvZFg0YjlOWlY0Sk5VRi9GdVpTalRMUG9Rb2s1?=
 =?utf-8?B?RDZIRW44dUdpUjlPL3FRODZHQlZvSlQ3NmU0VWpGWW9HaC9hMjQyQ2JzbWRS?=
 =?utf-8?B?QWNydzEyMW9nWElUZFlDbXdWOVdzSVMyMXRxSyt1R1NJWGJjaXNRbndrSVFn?=
 =?utf-8?B?Mk9RTFp6Zk1Ia0E1bmxBekZJUkNwWFhSV1JzNmEyWkt4cTI0VkNJREV0QU0z?=
 =?utf-8?B?TzFZWFZOYWdzbFVmZmpsOTVkclh1YTU3T056Zzk3d0xvWHpGTVNqTUZjRDM4?=
 =?utf-8?B?TENGVTRkYndYY2dTTHpXQTJYUDJoeTkrcVd5dW43WW83OW5BMmJjMDFCZ3pN?=
 =?utf-8?B?ek1OK2hwOTNCQmo4bmxRMVpIZUJYUDNZV3ZSUG5CK05rYnc5SzF6OFd2T0dY?=
 =?utf-8?B?Yk0yMmVFQTYwWkk5L2kwMmI1R25UNHJ2dnpjR1UxZTBKWDVMenhXKzVVM0hS?=
 =?utf-8?B?MTY2MmtJR1J1ckxTTEJtdFZrNWRZSk16WmNPa2hTZHNsYWQwOE1qQUVOV2xZ?=
 =?utf-8?B?S0duR3RMTndRemk5Vmh0VXVnQzdTbDFnZWtkakk4N1FlcHh1cHZFeXNPTUh4?=
 =?utf-8?B?UmlGdjhpSFBRazkyUyt1ZTJqTHlWbGNvdzRWTXlYZ1JKY3JrQXh2bDRyaVBY?=
 =?utf-8?B?UVJNQXNlZlZ2M0ZrRWl2VlM2dlhrUmtROXIzNUx3QjY1WEhOOVZGc2NROFhj?=
 =?utf-8?B?MzNxVGI5OXAyb2hNdmZoUG5uOFRoSG41S3NLTUg4OGFGTUpuUm8vYlF1Vm1H?=
 =?utf-8?B?V21qUFRydFUvbnFTVDRpSGt5SSttTUsyUmgrb0s0M3BJTGZYelE2QmVlMzZa?=
 =?utf-8?B?WC9EKzM0eTI0b1dha0JPOHR5Sm5HZllGS2ZMbU1KL1FJeGoyUUlKTkV4OTkv?=
 =?utf-8?Q?Tiiw4FAIJwSfdFwGxhK9onMPB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c782e178-8f28-4851-6600-08dad2a1e222
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 07:09:55.2756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2XylXvk4XCBTSy4ZDuMjbnwom+2Smcvox/jsPSSGfXp4kJeDMiar+RjNi1sctQSKjSDGtXmhb20p6i6mlY2cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7344

On 29.11.2022 19:18, Ayan Kumar Halder wrote:
> On 29/11/2022 15:52, Julien Grall wrote:
>> On 29/11/2022 16:23, Ayan Kumar Halder wrote:
>>> On 29/11/2022 14:52, Julien Grall wrote:
>>>> On 29/11/2022 14:57, Ayan Kumar Halder wrote:
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -2245,7 +2245,9 @@ void __init xenheap_max_mfn(unsigned long mfn)
>>>   {
>>>       ASSERT(!first_node_initialised);
>>>       ASSERT(!xenheap_bits);
>>> +#ifndef CONFIG_AARCH32_V8R
>>>       BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
>>> +#endif
>>
>> BUILD_BUG_ON() are used to indicate that the code would fall over the 
>> check pass. I can't find the justification for this change in the 
>> commit message.
> 
> I had a look at the following commit which introduced this, but I 
> couldn't get the explaination for this.
> 
> commit 88e3ed61642bb393458acc7a9bd2f96edc337190
> Author: Jan Beulich <jbeulich@suse.com>
> Date:   Tue Sep 1 14:02:57 2015 +0200
> 
> @Jan :- Do you know why BUILD_BUG_ON() was introduced ?

You've cut too much context - the next line explains this all by itself,
I think:

    xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);

Clearly addresses used for the Xen heap need to be representable in an
unsigned long (which we assume to be the same size as void *).

But I'm afraid there's further context missing for your question: Why
would that construct be a problem in your case? Is it just that you'd
need it to be > rather than the >= that's used presently? If so, why
do you add an #ifdef rather than dealing with the (apparent) off-by-1?
(I say "apparent" because I haven't checked whether the >= is really
depended upon anywhere.)

Jan

