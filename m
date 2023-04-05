Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA156D7D54
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 15:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518524.805174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2oC-0007Uo-Hm; Wed, 05 Apr 2023 13:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518524.805174; Wed, 05 Apr 2023 13:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2oC-0007SM-Dr; Wed, 05 Apr 2023 13:04:16 +0000
Received: by outflank-mailman (input) for mailman id 518524;
 Wed, 05 Apr 2023 13:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pk2oA-0007SC-Dp
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 13:04:14 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe02::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c6942ab-d3b2-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 15:04:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9099.eurprd04.prod.outlook.com (2603:10a6:10:2f2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 13:04:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 13:04:08 +0000
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
X-Inumbo-ID: 5c6942ab-d3b2-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0K2nSDTWCPjyRe5K/YcvofxJxRW4cvVZ3q/yrRSUbbuJuXEfE3+mgtoKr7xphQ4IuYRsVrjj8wj4GpFDMupmwormcIdT4JYXFmLxya7791b3Q/x1stiIXnzOPjDGxmEDWJ5jP3OpJYMP/xH1Ab4xU7ymFeJma0osNeopNoPIjX7aNpWxTE6ZEpKsSQbKjuFChLxKrrle0ERe86Pr40TlPKubM1dhHPw4x/sa4mcYCmFKWsSor7IvgmJx4Ya98h0LYax/tQEdlnFzCIA5BmI8qCp601Y7b9bMeGOXZUOqBBWCHlKiCaVZ3M9jg2k7GkTAFNFIesGljSAJm3RqP8yVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuJFnVFq4lYzErg+AcntKHgzOzemz92LMQw4cTfU8u4=;
 b=OKeQPRmFiUELpLtmXyUeRceSqAtltirsMpBjlppkFKlunUlD5gb8/Tqn+DoCEhnVgauyh0yQsT3nmuRsBDGX8malFYbi9cij0yvc1N5Ssp7UMN7hh7GexRSwIf1QZvdE02Wkjgn9vsvcviQw08Hm5VOQfYb2fXf3HAfbMQPEonWW6PYWueyQpI60UP71iC81XB5zhDtUAalVBfHwI8aH2FHNwooIzw6QO6d9ZTZ9eYEWb7csdWPn5aM478sR5vaeFUmTpXG/V8d1uO136h+xL4l3o43pyEdRWB9SEWX76HRarq4h4JJw0lfdH/cnJerAk51+QcRjMtXwj6/0AM0F6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuJFnVFq4lYzErg+AcntKHgzOzemz92LMQw4cTfU8u4=;
 b=sc8vbdxCa+AlaKCvvmuaMFLJX1wDgkjEE4BS8c9AJRO8uh+Y7PlViptmWIZTLYizQlDUk5C05c3GDYc6xPNY/qDnz1kUTwXejtA0dyMmjaGCEIt4VldgIxy7zo6vDB9DdYaC1d8gH33grcUI8zkj2+PcbbbLtpjMazZuj2r/IoFOuGI3CRgK8WjJ0DVxJWIUcSJ/I7abhezCz6W7WIbT1/e+eVglTx/astwF9wtMFURIjBFxPT5yFVwnB6FdP7Kunrv+bSbmpmRIr0AdyWuWRiuKSUioEgwPm6ac+Ld/wwsQMWFauWl9SoeUSVO4fCH23KP+YqFl1qFKaIz34b5rbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1fceb2af-cf5e-9e70-59d5-24cbad3cb81f@suse.com>
Date: Wed, 5 Apr 2023 15:04:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/2] xen: update CONFIG_DEBUG_INFO help text
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230403162823.30681-1-jgross@suse.com>
 <20230403162823.30681-3-jgross@suse.com>
 <358e9788-b930-5c51-1e89-232be43f83e5@suse.com>
 <563ff69f-0e9d-c90a-d18c-b3c351575716@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <563ff69f-0e9d-c90a-d18c-b3c351575716@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9099:EE_
X-MS-Office365-Filtering-Correlation-Id: 179879b0-b9c3-419e-90d5-08db35d63e3c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hKfKDVMU20wogdw0QJfXRjMlvULPEWaEZ3neYzqk3CMTs+JF/wAlG5dYdVoSV//iGOkFlJTCYzgNXe09ig7/qTxDXb05nE+APOT/Obr6vrEewgkAD9eh4vCsNz+uFAIY3pz2I6/UusyZ+GS8oB6jnAUS7rDluudsXrjZFQHnDAppgb0Nz4FcrZjG0uMQZ1Q6FCcve9Kfe6b1T4QuVlcRb4Pd/vshuumwJThQkxyWa54JmRDAtW0JXCp934zBaPHzo1T42TUEhJyzYuxHno5paINWTldIJ4Tz6QCBSOI8mC1AQ6/EB1c5HnPR6oOyjs8M2IFamXZC/M2RDyErgYBmxmHxcQ1VnadSW6AcFojf/YIwDchVwXMyJToBfCkYFT0yyjpiXie2G4pjZM43+yICSoqFFtnA7+zTJUQ95Ji6Gr2SsuG/nYkgXGT25UFULUxEJ8WPbsYCBnjqVX9bo0frARcAWScnwdrMxPekdaSS7Hx6Ncaq8IBJAFFeKQMgVe5qz195be3CkOK5+Xuov4wI39fB0guvNhYuVx8piPJ+OZctPvXG/68VOk+9zq8t827/j3N6Xbfyf6kYp8aCbD+KzditrgNRR880jzXDHMZv3j9JbxO8HU+KkzRKKmiSD5Og0cpJUuWGMPqSXRq3+6AQeQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199021)(6486002)(83380400001)(36756003)(2616005)(31696002)(86362001)(38100700002)(53546011)(6512007)(6506007)(26005)(186003)(2906002)(54906003)(6636002)(37006003)(316002)(5660300002)(31686004)(8936002)(41300700001)(66946007)(6862004)(66476007)(8676002)(4326008)(66556008)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzZyT0M0QWJiank4NTM5akErcjRiendCTjN2QXdEZ1RqeW10Q2lUYVhobVRH?=
 =?utf-8?B?ajlFMlp3a2lpS2FCd0JvSnBtTzVhQ214YytrNVZmWGVtWFZCQ0NHRGRnNzRx?=
 =?utf-8?B?N2Fnd0J3MW9NTlAyaUVlVzRZbEQreHhNNVlCalN3RE5XeVZ4aEhZU2VSQ2tB?=
 =?utf-8?B?MHpyWFY4andJbk1GR2U5QlBBSE54cHg2UzR5T25OZzRselpXMnlHN2YxVENO?=
 =?utf-8?B?NDhqd0xoYUdqaWJ2bitGYlBtYlBYTWgzOEpZSUJVdWZFU2hRWnpGUWl4TnQr?=
 =?utf-8?B?bHY3NFZHcG5iOHhaT1BlSkZXNG9DODh4YmpzSGl5dmtMenZlazVNdFdxSjky?=
 =?utf-8?B?QjZXZGhMT3B5Vjd4VkwxeGhmWVo4RHd4WFg1MDZHZjErNmxMQWtYZk5lb3Mx?=
 =?utf-8?B?ZmNvM3ZUZzFWMVVBM05palpUVVhmZHgvdGdwcit2VXptMXozbWpUZVd2ZGVD?=
 =?utf-8?B?THZSNjBHSUFqakxxRFZKdGVuQTdXQWo1RkVtQ3FLaTk2WHRkZm1WQ1ZpZUFr?=
 =?utf-8?B?UWt2dzFyRG4xa3NvemJQVTlza0RFUG5DVFBtQjhPNnBFSnVRQmpVV05LRmho?=
 =?utf-8?B?ZHgxQXlhL0NJYTA5NFhLZjdPOU1yV1lpY0Z6M25xY2ttc3BPZHFTN1U4MXZh?=
 =?utf-8?B?RjNoTms4NlRxa0g1U2lDZmtBa0ZUM2E1K3lPQUZteFFzeUpRS2Zrd0poWC9l?=
 =?utf-8?B?elF5NDRZclg5NnN1WVdvblB1VS9DL2o0OXl6a2hyZk1GVTFuRjdjQisyZnNI?=
 =?utf-8?B?RUhHdFhoWTVRdmFOdWxLK0xrbUlDVlh3THJtMVVuejFiTUZlYnBxT1lUS1g4?=
 =?utf-8?B?RXJuRk5GZzd6N1daT053UTBReTBRYTFkTmpFajRQa0Y0cXN4TTFsNG5IN1Zj?=
 =?utf-8?B?ZGFKWGppMFRMdzNlRFNXOUM0UWtMeXZ6SnNaTzFnRkEySWtaY0htVlJPTmRm?=
 =?utf-8?B?aU9yRHRLL3Ixc2FiL000NFVqVml4NzBjaFNjMUVCbGowZTRsT2VLL1BHR25u?=
 =?utf-8?B?L1VISVZGV3RXQ0plK3AzekpyRDRTeStWUmFXdUQwOVZGdXJFVTZPZUJ1R2xu?=
 =?utf-8?B?U003ZG1BaVdxRzVZSmI1TlNsclpiZXQ4amw3ei9xb3VuNTQ0RmowbURoZTZU?=
 =?utf-8?B?dVpFZElIbXoycW84VE9rZGQ4cHh2UUFTbnhpQ2RSZXJTZDMwS1VwcG9aNDNT?=
 =?utf-8?B?WHFwSmxybXk1bVJtWld6NnVQUjFWWGM1bmU5a09qbjh0NjF3bXg4QnB0T2Fn?=
 =?utf-8?B?ckRKUnkrYUhtS1dlQmlOOER1aDJxR0FxKzdKeklxemhZN3c2aE5UbVdPbFlD?=
 =?utf-8?B?M1pjOUNJNnhHT2FLK0JWQ3hmWi9QQmpwMmVnWVc4UWhkdjM4ZXNxNCs3VVVl?=
 =?utf-8?B?THk2SVVKeFltQ3h6S1dTdmNSWEpTM2hIdXlacmdNYzBmTEZqTWU4YVFJVkVy?=
 =?utf-8?B?czJmSkx1bzlmQ2JXeVphL1J2VXU5T2VHWHhqVzV3MWFmZ2phRWE0NDNraVRt?=
 =?utf-8?B?ejA2QWtWZFUrRFhYVW0yNlhSRy9HeTZSUFY0QzJtT2pHN1NZR2hkUDJhaUUz?=
 =?utf-8?B?MW9jODA2U2JOMUVLU2doV2NUL0pxOFoxTjVZSGNxUExKTU1UQmtYejlITVJR?=
 =?utf-8?B?aE9DOUNWWXJwWCtNejg0bWRYd1d6N2tOYlowSGtVY2MxY2VSR2UvVXEzUlhL?=
 =?utf-8?B?azBmTVNZSlRvT05TWFJvRmFHVndCTXNoN0VHYTQ2THFVT2EwRkFQQnZXVU16?=
 =?utf-8?B?b2ViME94Vzc5RnVmQmYyQ2Nza1ZvcGpiSlhxOStRTFd5SHlCTnYxakc4OHBX?=
 =?utf-8?B?Q2FDbDFBdVdqYnh5UWpCam1FenkraXR5RENwNGZKQm1SR0ZFVVBselBVQlJs?=
 =?utf-8?B?TnlXS0JTYjZsVnExMXlLblpUbXhmS0VhenhuQWtOR0FkQkI3SHJNK09qdkNG?=
 =?utf-8?B?R054dGxRREppWW9pQXlKNVRBNSsvdEpQcXVNTFN4eU8yeVE1eE1JZWQvczhI?=
 =?utf-8?B?N04zbDRtSkJZclV0dEk3WGczRzRhS1o5YVE0djJmdHlTcHhVNTNuVUxDS3Bp?=
 =?utf-8?B?bzdFL1JYRTNCeG1wSlRpV3l2YThXVzZFWktKYTZjU1hldUJrQ2NPSUJ6QWtB?=
 =?utf-8?Q?gtPIRz8eZ95Qo7IWIQSZvXlNq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179879b0-b9c3-419e-90d5-08db35d63e3c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 13:04:08.8407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVMpSXEJ9nO/8PvduEgP3HQOQP6p38FPncw9nweg8QY7ZQtsp7H+BlrYvKY2ilVsiVjOGUXAMEifXsQCzPcMeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9099

On 05.04.2023 13:24, Juergen Gross wrote:
> On 04.04.23 11:09, Jan Beulich wrote:
>> On 03.04.2023 18:28, Juergen Gross wrote:
>>> --- a/xen/Kconfig.debug
>>> +++ b/xen/Kconfig.debug
>>> @@ -15,8 +15,14 @@ config DEBUG_INFO
>>>   	bool "Compile Xen with debug info"
>>>   	default DEBUG
>>>   	help
>>> -	  If you say Y here the resulting Xen will include debugging info
>>> -	  resulting in a larger binary image.
>>> +	  Say Y here if you want to build Xen with debug information. This
>>> +	  information is needed e.g. for doing crash dump analysis of the
>>> +	  hypervisor via the "crash" tool.
>>> +	  Saying Y will increase the size of the xen-syms and xen.efi
>>> +	  binaries. In case the space on the EFI boot partition is rather
>>> +	  limited, you may want to make use of the INSTALL_EFI_STRIP make
>>> +	  variable when building the hypervisor, in order to strip xen.efi
>>> +	  before installing it to the EFI partition.
>>
>> Hmm, INSTALL_EFI_STRIP is only a courtesy to developers wanting to install
>> xen.efi directly into the EFI partition. It wouldn't affect the normal
>> flow, and hence I think this wants expressing here such that both kinds of
>> people have at least a hint what they need to do. I.e. in the normal case
>> they'd need to adjust the way xen.efi is "propagated" from its installed
>> location onto the EFI partition, to do the desired stripping at that time.
> 
> Would you be fine with:
> 
>    In case the space on the EFI boot partition is rather
>    limited, you may want to install a stripped variant of xen.efi in
>    the EFI boot partition (look for "INSTALL_EFI_STRIP" in
>    docs/misc/efi.pandoc for more information - when not using
>    "make install-xen" for installing xen.efi, stripping needs to be
>    done outside the Xen build environment).

SGTM, thanks.

Jan

