Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5873F65E5FC
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 08:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471666.731602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDKZj-0001s5-IO; Thu, 05 Jan 2023 07:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471666.731602; Thu, 05 Jan 2023 07:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDKZj-0001oh-FC; Thu, 05 Jan 2023 07:22:07 +0000
Received: by outflank-mailman (input) for mailman id 471666;
 Thu, 05 Jan 2023 07:22:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDKZh-0001ob-Fb
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 07:22:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7097441-8cc9-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 08:22:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 07:22:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 07:22:01 +0000
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
X-Inumbo-ID: a7097441-8cc9-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DK6G3ULUcYtFg74R2S9L9wqwLLN3+1jfcD6GGteXsVrQIFoEvcYlkzf5sSBCiOrP/sYiVBsomQ4VYwLWUF1AmVBarRDYmG814+9Y5nBD5u5EziMiJHFXwXqK6FdPXPC6x988DQbVN2cs2UGmdTMxSU3LMWyLRxp7a55c0Vox+BcTkb5IcE3fRuO8q9cZerDbGw+RmhJH5FGjErpjF0mricgnBr6ttPQRApQg0EP5bYzS+cP5p5xuaKhTDNK7ONc7nP7wyEuVoESrc7mpdxLxuz+wK1+JRl/FwmxoC6lTYBPkunHOsEZlXuofsXFzuODpTz+P65+AzFcFkjsmnwcnTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vc6zNnVnnN9AEYpO0uP9nMDevrwJb8ehtkqTdKNxanY=;
 b=ipukJdbW7okFFaXvuKZqyZvjyPVKNO74JyGEvJeoNTDFyZ+2mP+O0f5yjSHv8WkmSgIr8sNrOavBKpesPYLzdpj3YLu32s3t4o2R7LBXvtU2YJgkdAvnPej/kFnDiqzx8jetonSEDkMBeAHJQ2FOxsQ5uKwFodfxSlch6+Rf6cWCGrguXJMt1wqugBPU84YtM7R8lAE05K7O85EzVfANwu1Wr9X2QUIAiEoFJwyjJKtcWBQFED4gV/LTXo1Ana4dS7K4zGCag4VPH3PZN0HnrUpFY3auZOGd9g3NNRmGMCODE13qlnuVlJOH4dBrv6eix4cy60Zf2m6LYb72PurxZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc6zNnVnnN9AEYpO0uP9nMDevrwJb8ehtkqTdKNxanY=;
 b=eSLOkKfoPH04qKiI0F2O3oD/V/G4VP2iUC/jY2ObQU4SLl2saES/kinmJQAX6YizL4yiTV7vglF5q0asZ1kmU3GgHZaPig3OfpLGsu/+XJIH4z+GqpEQeeeFDmV5LFDzru24eDC3Pe/XEvQ05CefVi3lWe162gLQp56X6u+y7XlnYINa3XE5XHY1EsEGrshselLD06dReUh8E6r+vlMpN4Robj/H+/tN0OSOf7tTPZduBnPlOlPB4DcGoaZQ9PIusw6ptfN1Li3+L+X/qtWtaJpPTV8MLrzSGkFhinP8avpCMWQy0J7IzvxpGFz4+h+e8rfwTt9DmG2q0wfHVW0BoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8da65f2f-19ae-6f79-d13c-c502ae1d3889@suse.com>
Date: Thu, 5 Jan 2023 08:22:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] xen/version: Drop compat/kernel.c
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-3-andrew.cooper3@citrix.com>
 <074042f5-ecc1-11c9-bdcd-b9d619475d58@suse.com>
 <c67509bf-b5e0-5364-9307-5432f5417ce5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c67509bf-b5e0-5364-9307-5432f5417ce5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: b7984aa7-66dd-4f7f-6884-08daeeed8a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ohY8MRUUyZ9R6tWr7g0b2AT/RpwbNkiU5Lt3qKXtGf42nPN3OYD4fq7Z5qX6UTitiyFSJ313nygIdafU5TCTuU8pECQYoPC6DJFqOoZqWQW3PbTLR0Vzi1mYpNYFG4NsCHpdTSfRdInsPRXxTbByLszTFx/7lhV8/s8QFaLnUYgxlsk0ARfKJJYKTgxquRKQbDYaOQGwVQNzPbU+pLvnbsTmEMtRceQ8K1HU0skXuaZBbwvMCgR1Bq0RRzcs/KGtbtp7HUgE8mTBQj/0wlWOlkH4xb4YJfjD1cFTWoWJ9WkYtcJNqrNfIdfT1EqCLhiSdb2kYidM3GZ1W+VNzFyJTvBzNTyUDO8/L82nr2q19riex7dtYj+mnMqWwfDPhAfPZxifpy1INfwKnehM+/yMeQBXzrS6/MfiLJxYqjLJ2/dmQjDEYz3b1ESYGCo1xJkGL/Ky3rKCHunFskj8X1BC7b3Th41lSYquVrwlsDqv+U+CWhUkzG0vugyWfQHf7WlHjC5YroWVqstEc0cJHaFVXAq9dYi6dhI+2VgDyOPDPLV9KWf+VJa7gHoBhY+M7StJaUEZocDwu/gIECPK0VR2qYQkHLkTaiwJQ8cXbh/DqSNquaRpiQ3q1phTicKCHxriVcEy/Ck3Gfr2ttaHAJeiDFK8WQze7RHR+PtM8Iu01z5G23giT7ejYwvFhXLamV9jeIzX56eM/lhD3wJU4xIAp/AyvUO+nxhJ9PvouUDtSOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(41300700001)(8936002)(66946007)(5660300002)(8676002)(54906003)(6916009)(2906002)(66556008)(316002)(31686004)(4326008)(6486002)(53546011)(6506007)(478600001)(66476007)(31696002)(86362001)(26005)(186003)(83380400001)(2616005)(6512007)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXlIQXFpVSsrcEpwWlRPQzZmWkp4L2Q1TVNhN3lZdUlHNWRHM1R3ZS9IV3dy?=
 =?utf-8?B?UlNXdFAvR3llRTlNVStlbzJVZEgrYnVFWVo0VWJZYVdtYk93YVVUNThkaCtR?=
 =?utf-8?B?WTFLZWNxVUVSQTFCWDk1Rmlrc3kzU2l6MkgrS2hhNk1KMkRXVnd4OTd4NEwx?=
 =?utf-8?B?MDRYMGU2ajFXRjQ0WjUvWjRhVHdNbkttZTVlL3lhdU9xUVkvdWFyUXlTa2hT?=
 =?utf-8?B?MDNpWi9XUFlGZWowd1BZVFdSNU1HMU1YT2JEWVlVRGlZMVJNY1cxSnpoOHFP?=
 =?utf-8?B?OGtBcDE4NU5hbGlNUHd2dU9iUitNYmV1NmsrZzM4eC9wN09XdER2QitpTms4?=
 =?utf-8?B?MXBIVHhnQWZnZDQ4WEU0RTduQUIwazhhRS90bzRqTlZ0LzVBMzRGeDZxaWpr?=
 =?utf-8?B?WWR4WXJ3YTdsMjd3TlVKa0hBYUFNZU1hQWxNVEc3YWNHQ1lQaVJZaURNMnJq?=
 =?utf-8?B?VkR4K1dXRE55NjdZUkxWOVJFSFIydDdieGNxRzFCcElvTTlHOHVyMGMvM1Z6?=
 =?utf-8?B?cFRTUGZoaEhpckZHMUhCT3NyNUxJaFlkbWNCbkQ3NktQRGRzVVFXQTdlTTh1?=
 =?utf-8?B?Z0l1dFB6THFnd3lLZW1DZzRFem9ZNENvRlhrd2dvaUlHRjJwNFVsZ0JyRThM?=
 =?utf-8?B?ZkpMeE52cXllTFNGV09WRW9YVXlwTHMyOG1lRVJPbzdESTdDeUNyK1lEZ0pr?=
 =?utf-8?B?eDUrQk81MWRZbXI5c0RQdDNsWG5lUzNoTUREM29CaXZpQlhaZXAwL2FydTNr?=
 =?utf-8?B?VlJTenJwY0tORUtnUUlETEV6OFNtNFo2NHJ5eGFpeGhmT1ZScjU0UmxlYnN1?=
 =?utf-8?B?MGZuUnNYd0tSVnIyeHN5bDU2VjR0QUdKVWRrd25GQUVQL1lYVGg5U0s4YWdF?=
 =?utf-8?B?bzFQdHk4bU4wK0ljY1NlUTVlNnBoV0RRcUVOYlg1eVJmTVZtUXZzcFRURHV6?=
 =?utf-8?B?OGduYmh2SE1IamF5OG9UbTYrVFQwdTFJeU9ETlRaVTBVYlpUai9XYXd5QXVV?=
 =?utf-8?B?R2hJbW9CWlRPb09EMVVVTWZQUXFPeExobEIxZWlIbldhcTFSZ1FtK0hCZFNy?=
 =?utf-8?B?UnJYVUFGU01ldHQxRlFkOVFXM2lQSUhWbDBaQ0Y0Qk5XV3VVV0NMcFdwdlpj?=
 =?utf-8?B?NTMzK0ZWVk9JbndKck16Ui9nUTFsWTlFa1QwQkRldFJyOGZ2RHM2Z1hBc1d4?=
 =?utf-8?B?ZnJsaktQdnRicGNqcW5oS2dZb1g1ZEFOSFRqeW1hblVRaHRFd3ZINkdVU0tq?=
 =?utf-8?B?SkNVKzZZVFlMRjNOdE5yRVlhdFNqTHRweGJUWlg1aHlaQ2tMVzJHaFdEeVR3?=
 =?utf-8?B?eEFMeTFyQlVmRElvcWNRc3pCZmMzbFVOZU9FNDg2K0NNQ0F0TCt3SlhuWFpW?=
 =?utf-8?B?K2h1bHBvaERyV2tFNGY2ODErYkNXQTFCa1ZjSEc0aC9QbldKNXF3VlBvOG1H?=
 =?utf-8?B?N01iWTY1T2ZtUWtKelB2QmFRVVZlbDhKdlhURy9NaEEzK0hCYmtQVjdqMUpo?=
 =?utf-8?B?Y0FYWGxJNFpQNTV0eCsvVTZ3bDlYTlplT2JKNHE0WFFxZUdaZzVKeUM0cm9p?=
 =?utf-8?B?am9tVEpVZkN0VnNJSURjWXZRWHZad1NOOEwrVmx4QWJmUGs2UWc5V3Z6aXVU?=
 =?utf-8?B?cFU0VFNQd3FwaDd0SSt6aVhjYWJISm5YT1p0RDFwbm11bm1QcUVZSHNXbFpB?=
 =?utf-8?B?Tlo1NWt5N1hZR2RzaGdWNi85ZWtrK0tBV1F6RDJEeUdWR2NKNHhJM29zdzVy?=
 =?utf-8?B?R2UxOTVDK29LUjVvSnhtNGU4b1ZVWTBOT2NIaFZFSW8vY2xmNjYwNzUyVG9Z?=
 =?utf-8?B?NC8rMlVnTTkwNUoyNC9PeDgyN25VV1lYYXdyaTRiR2xNUldSK1Q1R0puTnU2?=
 =?utf-8?B?NDlpNlErVDBPTGR0T2grN2wwQkx1alVacXhmamVLN2FXZlAremN6c1JZWU1h?=
 =?utf-8?B?U1g2WEZKTmw4Q29GejkyZXo3bkhyWTVXckVpcHd6TEJHbDNUZE4zUEZoZEJT?=
 =?utf-8?B?bU1NQVpYZW9tK2Q2bktIS2V6ekh5akVCQkU3cXFsRXpRNmVOM0NOamh4Y0JG?=
 =?utf-8?B?OEZNUEhPOE1yRFpIMXVkN0ZLZzFRODl1cTVselQ5M1BtN2Vmb3A2M3hkQjdC?=
 =?utf-8?Q?SG5Jo8ORettOSDezFjgogHYUq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7984aa7-66dd-4f7f-6884-08daeeed8a03
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 07:22:01.7891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26BJLJl2LdsUqszAbkNVJqq39/92P1W+nwUEabl/k7bT+DfoS+YM7ywFnA/1ieI16OB91HHbZ/S6U+IKItZ2vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051

On 04.01.2023 20:15, Andrew Cooper wrote:
> On 04/01/2023 4:29 pm, Jan Beulich wrote:
>> On 03.01.2023 21:09, Andrew Cooper wrote:
>>> --- a/xen/common/compat/kernel.c
>>> +++ /dev/null
>>> @@ -1,53 +0,0 @@
>>> -/******************************************************************************
>>> - * kernel.c
>>> - */
>>> -
>>> -EMIT_FILE;
>>> -
>>> -#include <xen/init.h>
>>> -#include <xen/lib.h>
>>> -#include <xen/errno.h>
>>> -#include <xen/version.h>
>>> -#include <xen/sched.h>
>>> -#include <xen/guest_access.h>
>>> -#include <asm/current.h>
>>> -#include <compat/xen.h>
>>> -#include <compat/version.h>
>>> -
>>> -extern xen_commandline_t saved_cmdline;
>>> -
>>> -#define xen_extraversion compat_extraversion
>>> -#define xen_extraversion_t compat_extraversion_t
>>> -
>>> -#define xen_compile_info compat_compile_info
>>> -#define xen_compile_info_t compat_compile_info_t
>>> -
>>> -CHECK_TYPE(capabilities_info);
>> This and ...
>>
>>> -#define xen_platform_parameters compat_platform_parameters
>>> -#define xen_platform_parameters_t compat_platform_parameters_t
>>> -#undef HYPERVISOR_VIRT_START
>>> -#define HYPERVISOR_VIRT_START HYPERVISOR_COMPAT_VIRT_START(current->domain)
>>> -
>>> -#define xen_changeset_info compat_changeset_info
>>> -#define xen_changeset_info_t compat_changeset_info_t
>>> -
>>> -#define xen_feature_info compat_feature_info
>>> -#define xen_feature_info_t compat_feature_info_t
>>> -
>>> -CHECK_TYPE(domain_handle);
>> ... this go away without any replacement. Considering they're both
>> char[], that's probably fine, but could do with mentioning in the
>> description.
> 
> I did actually mean to ask about these two, because they're incomplete
> already.
> 
> Why do we CHECK_TYPE(capabilities_info) but define identity aliases for
> compat_extraversion (amongst others) ?
> 
> Is there even a point for having a compat alias of a char array?

To be quite honest, for capabilities_info I don't recall why it wasn't
aliased. For domain_handle I think the reason was that it's declared
outside of this header, and it could conceivably be a more UUID-like
struct.

> I'm tempted to just drop them.  I don't think the check does anything
> useful for us.

As said, I'm pretty much okay with this, but would like you to mention
in the description that this is an intentional change.

Jan

