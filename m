Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A20793CE1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 14:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596589.930530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrpm-0007kZ-Jo; Wed, 06 Sep 2023 12:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596589.930530; Wed, 06 Sep 2023 12:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrpm-0007hp-GZ; Wed, 06 Sep 2023 12:40:38 +0000
Received: by outflank-mailman (input) for mailman id 596589;
 Wed, 06 Sep 2023 12:40:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdrpk-0007at-SU
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 12:40:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92c83b9f-4cb2-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 14:40:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7727.eurprd04.prod.outlook.com (2603:10a6:102:e0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 12:40:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 12:40:32 +0000
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
X-Inumbo-ID: 92c83b9f-4cb2-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JECIs4YSO0ihU1yyDnef2cTR084TXD3qpeNnAIrYocQe5Ea9YZupuLX4p9ck3yQgL7N52rCyITHzUlcJJ3UjlRJQYmQAT/agPMDquIQqFiAk7iRF3T31j8wrJitBfocSTcJJvRe5JXHrpoX5csaCdf9iNueCzcBvxLcrEfeZA70cJLipVEmP+P/nAmjsmTVInBo28oFwAF/D67e5P1ce0H2MCFrgzAWE91BgW9qByEW2d3bhvNK/yty28ywx5S/wM5FNbIZGhFm9WQkoluMdEDhewsTMphCLbiOuS9K46d5xhVhIt1HofQ37y10PNrI6UnEP65jp6pZkJLPMQvnVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fd9Rl61b+F4wAgMH6fIQoygRcwqItCzl+5KoNESXVDc=;
 b=ZNmsrSZgkiRoqGR+YnTXaDttR5JmlqLgYNuw0AOUVlTTfC7hIgltHNb1vi2PXpOeLLS27Q55DAHKw1BzMWs5mDOtQEFX7f1QKdJK8uSFWpEAGllLqXqUpuJYJO9XBy+diS53ayA30p3TKe8mVEIHioRFBtoORQjLVCfPnBrkONjQ5dm7q8jVYo132OFV9mxYDoHQC4zBeSU2ZakTnCMO8OrAnJjCV1oUI1KHI/m+wobvMXRizQzN5Zz8K0ElMFuLTn+9LSD0AODK9RDSucSGEb7MoyLLQBPT3DEn2dvCk53paE43fNelv7KlUZRGiXBSmC51LboeSR81zXvNubaeVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fd9Rl61b+F4wAgMH6fIQoygRcwqItCzl+5KoNESXVDc=;
 b=EbMez13SytnjSvC4CrMYjD4TxTzFGNRMsvtfikw5h2Gqw33DjhnWn8mpXR7/IPq7zux+sXPaykEiv0WcV0kwHPJMnKACP+cXV+08dCs/I67AhrjxeMG6GnZvPk3EqWURpHKj/dD2X/HDkBrVbW4fewIAPkxdjSJuosCAaNWrPkc9wdWD3I6DwnAelrGEW8HCWo242nlHMMu9Zrl4Dyjzwkwrxmj3LeK11HIV3T6XncKfJyxWx+cJv4YQQ2slvPELTRe71gQ9eUqT1W7GwYM//mAy+flS0SNHu8+ttmuarS6zpo7YLBzW4moLeD2XzbdrF4DG2zbA9AVgfzZZ+q51hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <627a5863-0ced-956d-f76a-0547cd46c2bd@suse.com>
Date: Wed, 6 Sep 2023 14:40:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
 <731b436d-748c-092d-0bec-dcea5bdaed29@suse.com>
 <66fcd43cbcb176f13b5fe2aad53f659feefb9667.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <66fcd43cbcb176f13b5fe2aad53f659feefb9667.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d35e82-117b-418c-8011-08dbaed675a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lkdp5CSK54P8PVloBAK/l7XzALDGg99tpNp2B462mfR/bxvedEqJ32sdKsZSd9ZWwMxv3gTjOoavkCxsPowaEI5GtmxwErG+Mdq2EHqnyRGjIXRlTyFDOfKkMnQYOen54eYaV5WsDUyfqJ/lx8ocSGB4rACZ8OOrRdgufNBAB3iEivqm6OagNouoyfYR2oQbMkdNWhj9iHzHL4licMea/bO0Qrdd7ZbU0Q/GVjZ3+yUTE+SwfQTLvE5mQiJGdKjugMAON/dH6YxVTXNGL/U31jq8zbKvJi8bq0Qwz8zd9jB8qYWxAMpoBSzwfEag9D0xc9FUo56hJspY8M5dl7iwGthu3j659yrxw6cFue78ysKLDzM9mDDAlm5ED2wlVbBqy8e43F+yfvoaNEwvigBzlMCqzhlqd72nHepvETIvqBkcaKS1APKFvArEYwxphwbscB8RESkRj6GP3a+qvwUy86b7Y8qmimzR1R1xhXzGG/dMCnb/eJpOUAWQa0PbuCGr8fq0UkpKr0zWKgLN6J/ejEaQvqQ0F4wTEwarFHnhzPwWgU81FObFSGf/DxmzipsuxbW7rwFuXmJgb/zSNB0C2I6oScy3VRhfXC2p+tHl+6MtMB4Qwux+mvCqE0tek+tySK70oGaI8txLAS01EL84c4Koi+PnKaQYwGyg0w+VYLs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199024)(1800799009)(186009)(8936002)(8676002)(4326008)(478600001)(66476007)(66556008)(66946007)(5660300002)(83380400001)(31686004)(7416002)(2906002)(41300700001)(6666004)(31696002)(316002)(86362001)(54906003)(6916009)(6506007)(53546011)(6486002)(6512007)(2616005)(38100700002)(26005)(36756003)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjkzZ1l3ZHl5aHdOTjVwcXAvVUpnbnk2V1N5Q0JxNXBPNXJHMEFXTStPaUFl?=
 =?utf-8?B?ZXc4ZjU2djhTRnRXay9wYlRRMUpNZkcyYithd0l5WWR3VVI5Q2lQaHF4WGs3?=
 =?utf-8?B?cWxrRGNDMStHcTZKTzRFblVkeHdrN2VMb1BpdndNMEo1d1hzUmU3Y3h2V2FR?=
 =?utf-8?B?dEhGVjF1NHN0SzVJNEQwWGtmZWpidVd1UlZCYjd2ck8ySHo1d2Zvb0xNaXc5?=
 =?utf-8?B?Q210eWVaTWNIM0c2VW5Vby9IWDd0eGRVZFpQM21HeWxFN0xYeEd1RDIwUWFv?=
 =?utf-8?B?VGFWTVpPVnRhclZwUlVrRzdNU3dEOUxSK0pDUlI3NjdPN3pHMnZ3Y1F4aDho?=
 =?utf-8?B?V1NIaDZxc2ErMHpSUy9admZlK2J3TS9VYldHV1BwRGJOYzY5bTRJQ0ZzWWhN?=
 =?utf-8?B?ekY5b1JFRDk0MU5ZOWZqK0pKaHRjWEQrS3BYL29kK055NGlpb2IvUkNFNTZq?=
 =?utf-8?B?MmhUeVB0TXUzTGdxWENkL0JtSGNvQTJlZmtDdVpUUmIyb3NPbStKL05HNXAx?=
 =?utf-8?B?WSsyU2gvU3JrZ0NkVVBzaDRmMXlZb3kwNmt6Rmtkb3BuY0gzQXV4NVZIU3B4?=
 =?utf-8?B?Tm9iUm03QmJ5WXdySHRHMENMNUVrc1l4SXZucWQ4UlVjQ1dsMlFFaC9Pd3ZI?=
 =?utf-8?B?UHZ6RXc5QmlsUE5sM2E4ZS80dlMwazY3NHhCMUJVc1VlaE1aZWo2b3gyRDN2?=
 =?utf-8?B?SXNXMlhpc0JnN3hPTmR0WHc2K3VUbVplZzJnMHRWWGtNV1B2cmJYaVk3Ungv?=
 =?utf-8?B?QVl5NUVnbm1QcmNDZFhQbXJZS1BVMVIwYVRCOW10eFY5aUUzaTJHTGFGK1dD?=
 =?utf-8?B?NUowTTdXUlVwR0dGTkp4Wml5d1k0Z3pzYkRRSWhoMVdKdGg2V1QrSDUxT09H?=
 =?utf-8?B?T0dXNHlnR1dlV1pRYUJpTDNGdVRZWCtaaUo2UENiQUUyYWVpb1FUclNrd3Vn?=
 =?utf-8?B?cnBxNTJiRU4wZitnSGVBclRyZVBoemJsak9xU05kbGZkdDZ0ZFVmQ0ZqRDJP?=
 =?utf-8?B?OCtyVXhGczdGWURpYXpuQlpjUU1jSVBLbzZOYlBlNkZZeEEwSU84WU5ta1pL?=
 =?utf-8?B?Vm9rTG9mSWIwaFVmMUtqdnRnd1k5dzhLZHhpVUZWeGIwY0tIcE5Rdi9mcm5y?=
 =?utf-8?B?dTlxU3drWjQ0OWs5MFpSN20rbkZ5aUF6NkxpQTZKRkp4K2xEaFhpSXY4ZFI2?=
 =?utf-8?B?VVdpbm01bVJsWnFuSkFLcTBCVWFMTHVXN0g0cWtHUDdjTjRuYXJRMWI0c3NK?=
 =?utf-8?B?RUxsRzFQRkhsWXhncWwva0Fta0hUeTNLcXJxU2JNZWx2VThDVGM5amhIZ0l2?=
 =?utf-8?B?YnZONzkrUFQwdUlRVG9aTS9LM25UM1FvQkMvZ2tSVDZKV1E3RTNjZGdMQ0Zx?=
 =?utf-8?B?dkpzbnRoM2h5OVZlbnVsSW9pdk5DSzNLVEdIOE84WDY5cG85T3pCckc0WU9P?=
 =?utf-8?B?S3cyV2FCdnNYZ3hGcVZPSitXL2FjS2h4eFl2ZWg2TTNyczdZWHYvSEFsU2k0?=
 =?utf-8?B?VTJIQzJ4d2pQUERDRWw3MnZWUUdoL2d6azVhYjVrcGxjK25rUlZXQ2JCQytW?=
 =?utf-8?B?RlAwdUF1bTdWTWxYcTcwbi9kZzdaYmU2WW0zNnRaN0JycHRYdWVScnhpWWVi?=
 =?utf-8?B?QUVFbXNaSzVRWGFaNzhoang1ZExSZDVZWkJvaUkxenNndFp3QzBpS2RsVlpn?=
 =?utf-8?B?S3RacTR5Y0FzN1h5YjhhRTRDOUZDYUlVcGR0b29seVIzWjNSc1MwZnlKYnFp?=
 =?utf-8?B?ZGhKMG5NOHd0dSt6N0NEaEYrMkhCSHF5SjFUSTBhVUl1WGYyTENuRDg1bFFk?=
 =?utf-8?B?RUFpOW9IMjI5VzljMUwza24yYmowV1ZsNUhDTG92L2VxVzlIc3F1M25PVHZr?=
 =?utf-8?B?T0hhdTRWYVVNdFJqNUdYc1p0ai9YWjFBazBqTDA2c0lzOE5xeDRUMWV5UVNX?=
 =?utf-8?B?NE0vQllMd1FpbjdZUFBLMjQ3anNLQ0RTeVpyeHJYU09iQndUOFBGRFFZRjB0?=
 =?utf-8?B?QWNxcDVNUmpRaDdNS2NJWVpTL3NjWE1SN2ZsQ1NUYWJEc2lpZEpsbGtkSFY1?=
 =?utf-8?B?QTY0RTZMY0tiUHlSbkxaclBQMUVLRTIxcTh1OUs2OEh6L2cvVUQ3K3lDS1o1?=
 =?utf-8?Q?2ids0Vyh3jG24oOvOtn7La62F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d35e82-117b-418c-8011-08dbaed675a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 12:40:32.3994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njV58toZj3xNKe8hUngeLe3/3nrQhYPZVQyr9hVULCEC9jGUcyysO442ytw5LF8t0HorPgVjY4d6Wm8qKjHvAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7727

On 06.09.2023 14:28, Oleksii wrote:
> On Wed, 2023-09-06 at 14:16 +0200, Jan Beulich wrote:
>> On 01.09.2023 18:02, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/scripts/Makefile.asm-generic
>>> @@ -0,0 +1,23 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>
>> While this is what the Linux file presently says, you still want to
>> add
>> "-only", which is merely the newer name for the same thing.
>>
>>> +# include/asm-generic contains a lot of files that are used
>>> +# verbatim by several architectures.
>>> +#
>>> +# This Makefile reads the file arch/$(SRCARCH)/include/asm/Kbuild
>>> +# and for each file listed in this file with generic-y creates
>>> +# a small wrapper file in $(obj)
>>> (arch/$(SRCARCH)/include/generated/asm)
>>> +
>>> +kbuild-file := $(srctree)/arch/$(SRCARCH)/include/asm/Kbuild
>>> +include $(kbuild-file)
>>> +
>>> +include scripts/Kbuild.include
>>> +
>>> +# Create output directory if not already present
>>> +_dummy := $(shell [ -d $(obj) ] || mkdir -p $(obj))
>>> +
>>> +quiet_cmd_wrap = WRAP    $@
>>> +cmd_wrap = echo "\#include <asm-generic/$*.h>" >$@
>>> +
>>> +all: $(patsubst %, $(obj)/%, $(generic-y))
>>> +
>>> +$(obj)/%.h:
>>> +       $(call cmd,wrap)
>>
>> You've removed quite a bit of functionality, comparing with the Linux
>> original. May I ask why that is? What they have all makes sense to
>> me,
>> and looks to be useful down the road.
> I decided to take only minimum needed now but if you think it would be
> better to use the latest Linux's Makefile.asm-generic then I will
> update it in the next patch version.

Unless there are things getting in the way, I indeed think it would be
better to take the whole thing largely verbatim (a few edits are
unavoidable afaict).

Jan

