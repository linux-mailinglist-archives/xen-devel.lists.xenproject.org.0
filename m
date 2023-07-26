Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A12763B76
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 17:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570566.892454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgg0-0005U5-4W; Wed, 26 Jul 2023 15:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570566.892454; Wed, 26 Jul 2023 15:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgg0-0005SA-1J; Wed, 26 Jul 2023 15:43:48 +0000
Received: by outflank-mailman (input) for mailman id 570566;
 Wed, 26 Jul 2023 15:43:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOgfy-0005RY-5S
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 15:43:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 340c492b-2bcb-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 17:43:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9908.eurprd04.prod.outlook.com (2603:10a6:800:1d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 15:43:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 15:43:41 +0000
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
X-Inumbo-ID: 340c492b-2bcb-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnB775esu5VDFHyzoru35TYHjt2JKw3ogCCRhFJyzGbG9sAxKnzGqhoim1A4Rut+ODN9Yfv+4ntkR1UZIBkCZ5/XAMNQ9WMq5wrcu0hjcncDJ9M83gCQeKgVOXe+ccL4EdMQ0RuJxNrEvN8UZi0LuJKxoPOwqqJdigThtQGGRXqFCz1TE8jPYm32f84aLSfLBtLFRmrMhEol2cr0KqRLUGxMG8zHVxYPZ61IfxteqdWPM45RlG8tzgQfYCS8khGQm/R8rFBMfNtPnxHg7SkVjmdAkJ0LYbNhQ8te+xuu0gELhQMInK/MJlFjaVOWN/spacEukF9A+Q9B7Yfwwszf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMC4RJzItodQMYR5VcVof/3DJxX9dbh0E7tFCUgdzVQ=;
 b=NcujP57KHVEpv42y9aCUng9k81IxuOqvti2FDIMisx7m/Kv24wKw0DpuRQzCMtbuSqvoKtZA9jsmdiqds1NiqcDjrR6KERQjVmv32WaeYptHGnJ1UN04MgU39/AQfHMOPfrHY2RmLRw7TbeeFtLRjj4At0wsvd45mcqbrYj050t0BXdXn3C8uoELInc1RERys8CZUYGErXXms8rxu6CRl6KBif3IXRZ5fGrED7BtuIaXEz5oC3X83ACQq0eKP//OIX9bFNka+KfVmEOzQe4dogRKSYepPC5l5eEjfwBUz2Rw21OfyCFRoWevK614uzqiBT0sjjGqt6QAWYyKttEg9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMC4RJzItodQMYR5VcVof/3DJxX9dbh0E7tFCUgdzVQ=;
 b=g+kcOse/yf4VGC4sELA9a98P+G6WzPekkokQyDGN31djxF/eiN9vr+UPjp/icb3V3CF9LrX2kohg33Gp525XAyPbkt1MFhbi9iRN6wGP6QykzQpJJnBx/pX6JkDdGmqh5sYm/cO2Kb6lDoje04TrPZRuWUG5PkgllWcRCQDyj/ygD7TfZ6URjl9KOf1aRSRH/+PGDuH54vEvimX1eYsJDdVnJirSD+cPT4XkwZGcigdCboZhAHr37Q9kh2AVtaE9ysNpPNZsZxOs3ofhyuNnj2oC3hZSzM9RpDXEiqxBHyh0sIFW8VzYe4OgLnW31Jx8Xg6TnXFeUZp8BAadPkDOoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f721e9e2-b73e-71ec-c337-bc3ad2352246@suse.com>
Date: Wed, 26 Jul 2023 17:43:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 6/8] RISC-V: annotate entry points with type and size
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
 <959bdb6d-9b6c-cde0-9459-c83cd3f58b18@suse.com>
 <60e57a9b-8091-0e6a-6066-2364d7d5441a@suse.com>
 <de4204862d2912611b004a9b2067b3743c0fbfbf.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <de4204862d2912611b004a9b2067b3743c0fbfbf.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9908:EE_
X-MS-Office365-Filtering-Correlation-Id: 2395a9c2-9ccb-472a-0d1e-08db8def1600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UC3bXPVDl1f8OI2vUXo4X3kJ7EjmrIjRz/Ep7a4u7vqFWws2GZGEpgJeKXPGmsnm/WSKv65u0WXSKh51WHti02LXIMyX2LInc+sJCkp594NoobPMTAx0oNqcMjVS0WxnD1KQ/nowRWaywsXMGFsYR19qcov5fIDl5PWHtfWCBKk4D69fd+FHtWpqHlNgaDS/Yb9G5Ah5VMWJFnS54kDgseHnohkbG7V6qdDN0Lqf/HN3Ls3qGZD7jptXKXlxgiTQDvJnHw9C9kb11SzoVe77L5ydhOAsttbWzMz5Ghb+5zuGYqeqP+ZjZCt+6kPHoD91aXH7U5A2tL/dnb00an0B/AUy7tdOWH0lENvyYpNN9oxrXzqCp3XH0uxP/uK7t+HOQIv+eomRV5aTdUWthOrX/4c2BsovN3OUL75YSTeixN/kvsYNNIPENte3UekYjJ5o5pQdH1db9HhlBzaLg/7+UpUi8EOHBXi6NzD9xDGFpD+0tEU96GhkkEso0Dq/3ATM/+a8NY2nCetbLnoyBR4YYsr36vCEK3HKL5U/fbTwQuhpDxow8sKT/EnvmkKL2w1WAVRxkiT0dUHNaW7gClKClSgHoo29pBUKb/MrUsAQvGeQZaa9X3zqeBKYdbfndUeKzpXy1jQ7T6yUmkSTwqmb5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(54906003)(66556008)(66946007)(66476007)(2616005)(36756003)(6512007)(83380400001)(86362001)(31696002)(38100700002)(186003)(6506007)(6666004)(26005)(6486002)(53546011)(478600001)(31686004)(41300700001)(5660300002)(2906002)(316002)(6916009)(4326008)(8676002)(8936002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXRSMXMwN2ZFS2M3UkYrc0dWbGluZkp2OG1PQkdaU01EQ1Z0Y2ViL1lZMWh2?=
 =?utf-8?B?WTgxME5ISEgrT1p4TjdFSm1BQytYVnVBY1ltTStoK3FsYlZ5WUZaZHNJc3k3?=
 =?utf-8?B?SVBBdVZKVUFVOVUxaFEzVjhYbllMRzZlK3VWZkwzSXI1OUNOOGM1WkRMS1Vi?=
 =?utf-8?B?U3VmWkZWRTNDRkcycnpSY1JvOEZJR1FtZEdEYTc0WXVqbnlSWC9hR0c0bTVP?=
 =?utf-8?B?SGRtTHNjSkpkYzB4R1E3YzV3MGFEWGgrWnMrVURHK3FuU0Q5dFFKdXYwbVRv?=
 =?utf-8?B?d2RYc3F4Q3NmTCtsNUo2UVBjZ1E3MWRINVNoTDZCZ1BicGxhM3pONDE1LzJJ?=
 =?utf-8?B?bzExOG9FdFJRb3I2dk1nbXoyNHBObnkzTk1uUjlFL3JzMnVsOGJMeWxZQjFK?=
 =?utf-8?B?d094MDZ0VDJ6eHllUHZhR1BxalFXaHM4Wnc2eXBXWi93a3V1SmJpTkpCbHE0?=
 =?utf-8?B?TU4zZmhaU1dQVTh5NlhseEc3OVVQZTFyTVU4SjU1THZlZE1KZWh5aUM1VWRa?=
 =?utf-8?B?eDU2R1EvMWM5MkxHSDF5eitBM0JlaEJpOUpTNktLeTBZVDNVMGkwVlMzMCsw?=
 =?utf-8?B?YUNZMmUxb0ZnTkFITUtCUXE3aWRqS3NGeUM5S0kybDZYV0hPMGp2aXlmdWhQ?=
 =?utf-8?B?M0JiWXNpQVM2RVNGZXlGRk5zV2pzU1dsbHpMRGVldWdHLzh4S3VJZ1VKSzh1?=
 =?utf-8?B?WERac2FWcUlZK2Q0dUVlYnlkTkVBaEg2Q0ZkR3RqUFNQOWtwaStpRkFGRGxP?=
 =?utf-8?B?bWxrTWUrNE0vZ3QvWkZTb3dNSnlOUFd6QWM2U0tEbGVZampFblRBa3NiL1dm?=
 =?utf-8?B?dEhRbE5Zb0hJdllrbHl4Tjl6VnptZnlUMm1FSllTdlpwTHhxS0E5bzVIN1A3?=
 =?utf-8?B?S29yOGNIdmdESmlwdE0rRFRoanJkcmkxS2Mxd1hDaXo3OHJQQnFoRURYK01M?=
 =?utf-8?B?RVNQcXBNdkM2YUdOc0hOMjV1VDhzTXVQR3NPaFdnL0F2aE04VTY5bC9pV2xx?=
 =?utf-8?B?R0RIVkg1Y1NXWlEydmVKa2Nmb1pYNlNXclNUTjlTeFBxN1dyOWdqR0JkMHRZ?=
 =?utf-8?B?U0tsa2tzSmNUVmRGK2l4ZnZUOW00NU9rcUszQzkrWXo4OThmbHZtdm90cTQr?=
 =?utf-8?B?L2hBSkJqNzFEckNrUjViRWhXcHQ4WFQ3ZTVLV3M0dWcvMlFRa3pUMVhRZlhz?=
 =?utf-8?B?bFg4d2xaZ2RMUzU4cTVqS01iWW1ySW9JTXh2U0xYemRtMlg3U1Q4OUZ1cUUv?=
 =?utf-8?B?eUdNdHhtVWRVSGRuSW1mcWNNWG1idHN0MnU0T3N5dkdCVVhLL0k2VzVxL0hQ?=
 =?utf-8?B?a2VVZlgrZzlQeGtvOXhPREQ5ZkI0ZENuVFd1RTBxTXVyMVNOODV0Y0hLQ2dl?=
 =?utf-8?B?Tk5DM2x4aHdtMTAwNHdsK1JrdmR3YUVrcXJkUVZkTy8xV1BGK21YWEE3cTFJ?=
 =?utf-8?B?eHlDeld6em5scU5CNkJVeVFFMFNOMElCRWpFVkREbDc1UERUM3lINXAvWS9o?=
 =?utf-8?B?czdST2k4U3lVWGxzNjdKT0Z2UlNuSmluaWJ5OTdUNzhGSFJKOTVwM2t0b1Nh?=
 =?utf-8?B?UTZUdE56YStxbUNRSTQ5SkNDdk15Y3pnSXZManlyWDUrdnU1ci8rQ295a3NG?=
 =?utf-8?B?MFVoT0NXaE12bmp4bC9aOGlFcktqcXVwY2F6eU1SMXlqVUNQSDVYbmZ6K0RB?=
 =?utf-8?B?V01oYk5ueGhkVG9GcC9LSkxsQytGTjJIL0RzL2UyZUxqYVpjU1ltVkVZOUVm?=
 =?utf-8?B?T0V2ZE9UQzlKK3JMQ3lCVGJ4VlRVeHFIclpxNmpVd05ERzBCaWZwNkh1anFF?=
 =?utf-8?B?MDlVMWJ3anNsMUhtNDZMU0hJdHFNOHJzVjFsWDVFS2xDeHlUc3hvUUJEbEtr?=
 =?utf-8?B?ajVSR1ZhNGZOUUljVFlyQVVydlVvSnR5V2NOWXovbVFVNnRCb0dpc1IrdzNJ?=
 =?utf-8?B?VXpqWitiMEFJR3gvTHFGZ0dNTi9oZVFqaElMUUZqYjBNc2tQM1pLTzFrZWFt?=
 =?utf-8?B?UEZ3VS9BajI0ZUJmRFNtNHI0NEJoRlpPUzdiVTh1R0ExM2JlNFViR0s3NVph?=
 =?utf-8?B?M0xnQzBkSDBWVVYwOVIzNU81M3dtN2l1R3kwTDVqS0NIUDhFU2ZWa25kRld4?=
 =?utf-8?Q?bjizM/fGvvKzwUd4q8ScrxEbX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2395a9c2-9ccb-472a-0d1e-08db8def1600
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 15:43:41.0095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKMdW7s8ogjuZJx8XVrJ2YPX60MnvqPhMHs5umnjEYOYgA9wkjJuQH8M3pAgsvJt7USKPlX18TMD3HczHhmo+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9908

On 26.07.2023 17:28, Oleksii wrote:
> On Mon, 2023-07-10 at 10:58 +0200, Jan Beulich wrote:
>> On 10.07.2023 10:56, Jan Beulich wrote:
>>> Use the generic framework in xen/linkage.h. No change in generated
>>> code
>>> except of course the converted symbols change to be hidden ones and
>>> gain
>>> a valid size.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> I'm sorry, the Cc list was incomplete here. Adding back the remaining
>> REST
>> maintainers.
>>
>> Jan
>>
>>> ---
>>> Probably count_args_exp() should move to macros.h, but I first
>>> wanted to
>>> see whether anyone can suggest any better approach for checking
>>> whether
>>> a defined macro expands to nothing.
> What about introduction of conditional macros ?
> Something similar to:
> #include <stdio.h>
> 
> #define CONDITIONAL_RETURN(arg1, arg2) CONDITIONAL_RETURN_IMPL(arg1,
> arg2, EMPTY)
> 
> #define EMPTY(...) ""
> 
> #define CONDITIONAL_RETURN_IMPL(arg1, arg2, empty_check) \
>     CONDITIONAL_RETURN_##empty_check(arg1, arg2)
> 
> #define CONDITIONAL_RETURN_EMPTY(arg1, arg2) \
>     CONDITIONAL_RETURN_ARG1(arg1, arg2)
> 
> #define CONDITIONAL_RETURN_ARG1(arg1, arg2) arg1, arg2
> 
> #define CONDITIONAL_RETURN_ARG2(arg1, arg2) arg1

I don't see how this would be used in your scheme. It ...

> int main() {
>     int a = 42;
>     const char* b = "hello";
> 
>     // Second argument is not empty, both arguments are returned
>     printf("Case 1: %d, %s\n", CONDITIONAL_RETURN(a, b));  // Prints:
> Case 1: 42, hello
> 
>     // Second argument is empty, only the first argument is returned
>     printf("Case 2: %d, %s\n", CONDITIONAL_RETURN(a, "")); // Prints:
> Case 2: 42,

... certainly isn't here, or this likely would cause at least a warning
from the compiler (for there being too few arguments to printf()) and
then a runtime UB for interpreting something as a pointer to a string
which likely isn't.

>     return 0;
> }
> 
> and then define DO_CODE_ALIGN using CONDITIONAL_RETURN?

Afaict instead of getting rid of the comma, you'd actually add ""
after it. What am I missing?

Jan

