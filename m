Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F496A41EC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 13:44:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502508.774354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcrB-0003p8-6m; Mon, 27 Feb 2023 12:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502508.774354; Mon, 27 Feb 2023 12:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcrB-0003nI-3r; Mon, 27 Feb 2023 12:43:53 +0000
Received: by outflank-mailman (input) for mailman id 502508;
 Mon, 27 Feb 2023 12:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWcr9-0003nC-DX
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 12:43:51 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe13::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60b1c5a7-b69c-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 13:43:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 12:43:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 12:43:45 +0000
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
X-Inumbo-ID: 60b1c5a7-b69c-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThhvA1leYAi6cNI6nEY/lrsGeSU38wVxbQJ7/qsnLhV9PUYufEFj8NUxETkWxTifpPB8qQuzdRb9dbRIDgt0Jlfrln07lnBv1RYN0lwTy1KzTCyoFXo4dWncXgUBWYEtehJMrXmDXZtDbUYzaUBFbol5bJ9eubZEBp+uRgLmtGBJIsHVlTUTAsEHmMw6Vx5DUSvvb+k4yFm+0mupzKex396jM3JR3ZhEsHtnsmweoEuPRqwRCRa5CdKpdxEai13/5c9lU0KnietUX2RT8sm/ieF92QjPTCj0Yr+UHDY8kut4c2o3XGTgjpd7O871oHDwcN5k1QNcliTMuVS2q3/ijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0kF9jI8hKrUSJfgXViDlmp1tkP4Wv2f6t3kdegWPjQ=;
 b=YXVOzT6DipW/ss1Omg4UU/DpGMBgWOMUvIxybHMDWXyhYl5VXbUBxcyei8rNlA/F0SsoQrzwJWv416G9LDQTMKU8bvfthZlEN87jm9HAd2kIX+qNuiMGXSQFdQlyVPFHbEJQyjoNjCZ5NGz8b1BRhJR5zCmx1V6x4LdcM8K2CjwroJITN/hQB/OyLiLYJbLYrr6PVfurj9gHaSO26EER7PLUe0JqBvy6w71XD1Fd7BZsYfUocgLQU/4DKKWVvbI6udogd7LjqIgUCmoWVDJN1gxJJgtRrQO27Pbs4oEWFifz8Sm9EArCcyyJiu57NFF6+gWgC96V834gltLn/tfRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0kF9jI8hKrUSJfgXViDlmp1tkP4Wv2f6t3kdegWPjQ=;
 b=E3aPtzkOWvQZmiCAZm/G/Cy2tUdYHQmguccpo2X84YqtYDNVvvRuxPorDa5YpkcX2UW4jS1WwzExDvg8BTC2EzXVEplIzSyFQrm03zkdRTkykKE8lKJKnDTuatX6+VPdrOFhbNoQ4Vw7ypqX/96HcFh8WEHc6QKJMkcGGBb2OpDC7p4Y5eHDjQePOrFIo1ktF1+KK1zVB6niT7D8nYox8t1OPkVJd5KeZqA9JauqnR3lQYOQdPdcop3AGLS6Ih+qceod77+b/6n6mInJhXy//BeEmPuitptQxjf2RJcIl/ARssdsJQ3gEALzdmuc/+Wt2VwibX2WJ2qc4hYCmfPPVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da345d46-3027-f0fa-bef7-04494da35ac0@suse.com>
Date: Mon, 27 Feb 2023 13:43:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] tools: add offsetof() to xen-tools/libs.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230227120957.10037-1-jgross@suse.com>
 <20230227120957.10037-4-jgross@suse.com>
 <8865a525-b55d-9b4f-ad2c-fe1f70afd0ba@suse.com>
 <809b25b3-1e8e-43ee-dc3a-1a54a938c9f7@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <809b25b3-1e8e-43ee-dc3a-1a54a938c9f7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: 33724d6f-ca40-4085-f3a5-08db18c043f5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xnbmBrjhFfAzs13T0GZfWXNBAMy8Ny4HV+0UFRPKhrHGTVfYCeU3DD4+i7RCMExpkLXGO/ZdHMEkBSzkM1wvMM6brXviyASk7oaInDk+FJ1TZXjvI8+ujsVw/gOgPU2eWaK6HQkP/3fTgZ10H0pWcX6p07lh/EY7T8o+NMmUTuguJ7YeDPzo6ghXGn/vXy3IKwVIqGelXU3G9+/8YnBeIutcAF2LOUmD/rL/QyMj0zkqw4AsBJ0Z8ieyCqiBpeUEUV1qGXZ+q4756oTbgGuk/rdyRIfIzx9a80aJtFvmFL4jul277L7bOEfmy+vMX5Yd2WCYL0HlqekzvsR8SE3u5Tv89JLs7gedF+0Oq3I7KJ38fjMZSHjpGVHdA/x5zk8LgO2jN21on/LrcUKaYEYYyqk+sDzmHrdoU73Ig39Zb8azRTnMWSmFHjRl0+19iACuXSx8wr3CHVP/WiVvONBZHiMWMN6z2kXyYkGg7c/UTNxDW4Z+zxLCMNBnoN7Q5t0+NjlG66Nd6c4DDceAeSsRI6b4m00RxmEsBKWLT/ysKRSMxEgoq44kBuLjHX83rzwUr3A1Grwedp+yIGA3go1EM4z0f3ww+d2zkdJ1KGwYrleFhZJOIg5Ng+XB8gX3KI+kHNMWERvQHE+IKI46eVFYyzKjMAEyVym6ulJI/vm/0R8Wfxv2zsrMLnM+uGfxh4AVCKWlPv++7B9S8GeGV62Ia0SxCQ4K/8DwHgfO3eJKqqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199018)(31686004)(2616005)(6486002)(37006003)(316002)(36756003)(86362001)(31696002)(54906003)(6636002)(186003)(2906002)(5660300002)(8676002)(4326008)(66556008)(66476007)(8936002)(41300700001)(66946007)(6512007)(53546011)(478600001)(26005)(6862004)(6506007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWxGaC80ZGJOVzhrZG1sWFRMRHpYRytHUmMwMnhUNE94dG4vUU5Xd09OeDN5?=
 =?utf-8?B?elk5Rkh3bFI3VzVLWWdjQ2syTTJ3WFdsK1pqbUsvRkZZSUpvdk1COW5sRzFa?=
 =?utf-8?B?RFRnazYvSTRzZi80c2lCQzBGMFphdDUwVld4Q0VLUmE5NlRmcnA3WFZDMEsv?=
 =?utf-8?B?VE5pWUVjL0w0ZjNXMXJLYW4va0lnWTB0NGE1STRqcmx4MlU4dTVvLzBIZ2VD?=
 =?utf-8?B?VUkvMXJ4Uk1nR1pIQ3dNNWRrcFI2enY2clJmb1RPaGd1OFFkaTQ1UnR5N3R0?=
 =?utf-8?B?V0pVMFF6a3FVOXBuZlpCQ0V6SkhwVzMzcGx1S210WkFUNlVjeVhIcmh0QXE0?=
 =?utf-8?B?THZQWXhDQ2FOaENoQTB0UkdtSkFDTjFsRjk4Nyt2OEVRT05ndm9FTXBabmR5?=
 =?utf-8?B?ZnNUallBeUxYWXUyaDVmUmdwaVpsaFdUL052cU1ZQWoxY0lmZjlvMHVNVU5B?=
 =?utf-8?B?cTVlVjV2eE9vWEtra0UwcDJrbUQzaDVqaHdjMUo3Mkx3Y0FLQ0poU3hEUCs1?=
 =?utf-8?B?Z2VEMm5ZMHV1aHRsbHl1YXUrUGZkY2YvV2prNnBCbTVrcndWUmozb29aMjQv?=
 =?utf-8?B?cG12YW5BT3NSSlcxRGZMZjRpUWFWVGxoNkhGWmlucTRPQWVDWmVDV3U1NjFi?=
 =?utf-8?B?MHZCQ1hqcWFQeC9sMnFwbEVIOFluNHM3eGxYcWsveDJTc0h1M0N3UXQ5ZVBB?=
 =?utf-8?B?aituVFBLQ2RCQnUyYTBoeUZHMWhEek5PUFVnMDFGeXpPQTBja1MxNXdTMzVz?=
 =?utf-8?B?b3Z0OVlQNG1CVVVhUnA5WnBwRndZSWVoSWZmQ2Z3dmJ4TlhoR3ZsaW9NaTha?=
 =?utf-8?B?NjljbVg1L2h3NzdHWWcrZCtCcUowWHp0MS9CVzZpc3phWVFCbGtsbE5xZ291?=
 =?utf-8?B?elBtSjI4Yk5Uc3dLVkFGOU1mdURkc1hSRVJPSkhPN2RkWWJabkQ5bHdxLzdi?=
 =?utf-8?B?QlRSNTBFSVFSaWxsYjc1SVRlRkJMNnV3eWI5UjhPMkZKTExUeUYyOHNjWjBV?=
 =?utf-8?B?bTBBTHBteFdCbEtDMEFzWTJKbExnZ3kwYzZKY0NhU01VVFRUNzl4dUpYaWhK?=
 =?utf-8?B?WHhFVFFpTDNSMHZMMHhibzgydVZzNmVTL2poTGlmVkJ4Z0Y5Y0l5SWovODlD?=
 =?utf-8?B?NEd3Q3Q4V0F1eks3UWQ5WVZzWVRkdlBOMG5IYzlVYXRLYi9CYmRZclYzVmFP?=
 =?utf-8?B?eGZ4bkhUR1hFTWUxcGpUOGhBR1dhQzNBMit6NkZ2R0pEQU9hVmFocWZHUy9O?=
 =?utf-8?B?L0J2cm1yN3hBSE5WbktVVTEvV2wvZWFJMEJLbUdadmszbTBuZFFJc20zSjB4?=
 =?utf-8?B?UEZCeHFGWFNuc0ViSFhGM3BMWlRTbnd4cVhtaWVVVmgxOXQ3U2E4T0tYbjZ2?=
 =?utf-8?B?WFhJcnF4UUZQTmF6YzI5V3JZMURJLzIzZmtoTWVmTVl5b1FCRHlTYjZJRnlX?=
 =?utf-8?B?elZQNmo4WEE2elFmeHZWcUgxcXdKREZvZXFQWFo2NlErNFpKU1F4WWpENFJP?=
 =?utf-8?B?QVN2bFpjUXhGYnAvaTR0eTQzdXh6VG9JZkxJeTh1cjBQTzd2YVhYZ210N0RV?=
 =?utf-8?B?R3dIc0prbGZoWkRDcGFHMjA1UkloUmxtK1EwdGdhWW1tWXQyMTVKL0hWZGpU?=
 =?utf-8?B?c0UwOXpGVVZnM3grSzcyMk5PSkNvdFBOTjlmOXFENHRBQWhJU1lmMSs3K3Jn?=
 =?utf-8?B?RzR3eUdrOWZFTHprU05DRFZQMkdiVUZWS0FoY1B2VXIrQUhZZkVsTTA3UlNu?=
 =?utf-8?B?MGlxMEU5N3hmS0FMaWpyYlBja0ZDZU9TY3ZYM3VsL2o3MmVUV0M2V2EyWTg3?=
 =?utf-8?B?UHRwVGU4YzVUakM5UHVlNGZQbGhLNkNpUlZQSEN6UEJhVm9ibk9lK1V4YU40?=
 =?utf-8?B?V3NCeHZ0ZTJjdE1lR052S200aUw3SWk1czE2UEJENDg3Y0hueW9JVCtOa0tI?=
 =?utf-8?B?aE9Ba0hLcDRHbldZR20wUG9zNG55ZmpjYWJ4K1dqRlBXdVptd3NCeVpzTXNm?=
 =?utf-8?B?Uzl4Uy95aUI4OExKOW9kS3hqOXVBZTE1dkNWWm1FbjJCdlhjK3dLLzJKNTlz?=
 =?utf-8?B?UlpHYjRMZVVoVUowMVRqbEMxcDRmbDlteE9penZ3WmNHUFM0SndzQ1I5M3hX?=
 =?utf-8?Q?9xOKkhFEakydHQeZfkGjV8OQm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33724d6f-ca40-4085-f3a5-08db18c043f5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 12:43:45.7911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //hcn+xenzzu6Z2gbuipmTin3ARtzRNGXbBreJpD5hy5ts4MWwnIYjLxOdDdWWdcaf2sduKxgGuycgO/++XYxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900

On 27.02.2023 13:34, Juergen Gross wrote:
> On 27.02.23 13:31, Jan Beulich wrote:
>> On 27.02.2023 13:09, Juergen Gross wrote:
>>> --- a/tools/firmware/hvmloader/util.h
>>> +++ b/tools/firmware/hvmloader/util.h
>>> @@ -30,9 +30,6 @@ enum {
>>>   #define SEL_DATA32          0x0020
>>>   #define SEL_CODE64          0x0028
>>>   
>>> -#undef offsetof
>>> -#define offsetof(t, m) ((unsigned long)&((t *)0)->m)
>>> -
>>>   #undef NULL
>>>   #define NULL ((void*)0)
>>>   
>>> diff --git a/tools/firmware/include/stddef.h b/tools/firmware/include/stddef.h
>>> index c7f974608a..926ae12fa5 100644
>>> --- a/tools/firmware/include/stddef.h
>>> +++ b/tools/firmware/include/stddef.h
>>> @@ -1,10 +1,10 @@
>>>   #ifndef _STDDEF_H_
>>>   #define _STDDEF_H_
>>>   
>>> +#include <xen-tools/libs.h>
>>
>> I'm not convinced firmware/ files can validly include this header.
> 
> This file only contains macros which don't call any external functions.
> 
> Would you be fine with me adding a related comment to it?

If it was to be usable like this, that would be a prereq, but personally
I don't view this as sufficient. The environment code runs in that lives
under firmware/ is simply different (hvmloader, for example, is 32-bit
no matter that the toolstack would normally be 64-bit), so to me it
feels like setting up a trap for ourselves. If Andrew or Roger are fully
convinced this is a good move, I won't be standing in the way ...

Jan

