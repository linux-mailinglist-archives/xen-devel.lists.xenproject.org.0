Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1EC6ADF05
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 13:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507349.780722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZWh7-0006kx-L9; Tue, 07 Mar 2023 12:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507349.780722; Tue, 07 Mar 2023 12:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZWh7-0006i6-II; Tue, 07 Mar 2023 12:45:29 +0000
Received: by outflank-mailman (input) for mailman id 507349;
 Tue, 07 Mar 2023 12:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZWh6-0006i0-0a
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 12:45:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef119b4b-bce5-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 13:45:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7858.eurprd04.prod.outlook.com (2603:10a6:20b:237::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 12:45:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 12:45:23 +0000
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
X-Inumbo-ID: ef119b4b-bce5-11ed-96b5-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIxLxBxNzldMXaDB6xQtMY5vD1qdtwK7IVBk+K2dzBtZ0MZgeg30Gx2lZWqV+cq97qQBUsl2sy6HST+Bj2sLsM63DJJCsRkZU28zbGH9kyFWxAnKTIlFtVxSZmQ0xK1c9zwgPmUYeN1YjO62GkFw79/gauijb/mFFagbVsuhsyGY91bEcK68JmtP1lfclkBJ1Y8fV6hecRrq4Vy6MYDBSrk1yiiU31q+2QeXAQMJYZUbS+rYbnG+KcQC+GdUOlatlP8vPsPdc2BO1e1A8gpORQuBsGjnfuBVMBGtMWft82M6hOUI+EZ4e6ElPwi5xtToavi+1F4bwzwlFm8BnqMIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPDVsrmBaSXOKsPeybsEpDBovDutUOcdx11CwB3cyjo=;
 b=FWBxhw9eXEHb78B2XQsjKPPgklTDBfSeOY270N8yqQaGZcZ3pbnf0/gc7JLAiekqCVu1IUHKly2qVl0o2p+Cub6BXY17NJznYgIWe65dAx4YAZzyBeGD7fOFsK6dqHgkRPi61W4bUehro36zvTbc84d2h7R8YXT9AtKaVREaqgnOd3Hn7pS1HeMR7mXRCTD/5SV78knMj85LI5OBBasMIdvMIBmak1HFyjqlCZ1s7ROnfXnthA7YLcrYkDRZtzIzId7eZb4bQ6LpGsHonADpnsLHLjUTgQMrgc+EafiaEj+LFbbklJ8xfs4NWh2iy8yADGpksS9CeJIa2EMrnjwQeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPDVsrmBaSXOKsPeybsEpDBovDutUOcdx11CwB3cyjo=;
 b=TRGM1i6HyTpdkV+ICOXcMmoIWelbGMsmY71tTv0hNHtJxbZRXoQlkK2VwGu0nytthJH1EhkcLH/zqxvlWtJ+40NyFgJUQOcc3o6mpsLvIeotdAXKmaSW3xgXkyCfKWynaST6dwg7ib1XS94qBDWznFudKNZLbmKMRkW3AG/HA+2fE1FFdRQ6jVAfGImARLlxMB6MgLIXTzjXFpXT/nZVtg0hxCd3+x21Eh/RVaIyffT7gZQOsn14/feTLF1ST5Yek2zyVK36FsQsaxxAZqPiW/ypvpuw7Tk0parQ7v+TZNkRuUtVa2/zh/QepF2zGxsaCbkMIXKjZjR1jLkK4BU7Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2159afc3-c55e-1559-4eb8-b20dcde41317@suse.com>
Date: Tue, 7 Mar 2023 13:45:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-2-jgross@suse.com>
 <e1353c0c-9501-3713-b759-0989447e6496@suse.com>
 <d3d2b65c-ccb4-5408-38d2-d637e1f67064@suse.com>
 <40fa3767-cc11-aba9-15bc-e528965b599a@suse.com>
 <9a80af7b-1b35-ea7b-b449-ecf9f0256914@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9a80af7b-1b35-ea7b-b449-ecf9f0256914@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: b7681e7f-bd85-4d16-09eb-08db1f09d170
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yD8UR9gdoAzvYtaVqjvNCqq4KDu46QHezGaMDa32RMedl7lNKY4itjsFi0wJRWAw/jif4jvaWpWMBCy/GBR9QzDLBF4Qi3vX1Yzz/hq2Vvn7ngejbBGKgLyBaBhUktdsWNgecf/9UvS7qDA2xBVvt6iR7HoX3CJiJ/+NHrACxmsIQxh+C0rLiTTs34uh7TWII6TCtoxYoeWDYIradpTLISe/7FZ1vHHlmY+BGuu04CTfDjmA4JHk7jUwNJ9vnpFgkANGsn8J33+q1gvM4ElRrd28FDYTzLpkCWrqicHSz0nSctgLmUC79ns6RS0mql5FnVMfi9qrOxkdffatXN9xjdlVZi4BBkbrQFaEXxc8vvjSmjtdP1DcrIDKSx8r0tl7gH3PFWRybh2K55uw/I7hRpjS3BAaZDmVFrkIjVqClfyZ+rBi+xeYnMXVroeN6lGD4E/OdbuiD7uzsnh/oBT6x1nVXAMgfSKGdLusDz2HseZ1Z0OGmXA+K9y4xtThSSnJPmpqFu2PpC3I9MZ8nmvkZOD84WA7qlanXeOPj6DPXE/Uu/+pXou3ynWIGJODA9rf8WYpMuBpUK+kI4DP99hGVWKb6I/sYSs6R+FdeUV4D9QUIjZV19Z2w+TzaA1vaGJoXtmv4aAq+bJEm5PN1tCvZ2D3UFwQiGu2juSdw9dDnQ/n7KDWeCv8J2VCevmDunipWv9em1uJ3fqQ72D1kEu4IytcI92oOYRNJG9bzTQ66hY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199018)(2906002)(38100700002)(186003)(26005)(6506007)(53546011)(6512007)(2616005)(31686004)(66946007)(66476007)(66556008)(478600001)(8936002)(5660300002)(6862004)(6486002)(41300700001)(31696002)(6636002)(54906003)(36756003)(4326008)(37006003)(8676002)(316002)(86362001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVNMVG92VUx1RmJINDRGS2tsb3NTUXBEQXI4bVl4YlNFbktBaW4vUGxiL3dG?=
 =?utf-8?B?RWR1Z1NlTG5WUzlQWVRzTVVDTE1nZzI3V3V6ditweGthVTl5NUcxYmM1MG1Y?=
 =?utf-8?B?TmtTTnA4TFJhOFVCMVhCYkx2UHdaaE1LVjA5LzZUblJUUDAzQmViNWxvK01D?=
 =?utf-8?B?NXRhWG9uUW9hL24vWGNwSlVPZ1grV1VNcDdGZWcvNlRhYlEycnlCaTA2NENo?=
 =?utf-8?B?Sy9lRU9KNDZUY0g4U3N3VWw4ekxRUnlYaHRidjdXdjlmTXdvbjAwZ0lvby9R?=
 =?utf-8?B?UUVyTElhVGgzdTAyV0tVZ2RrZHBSN0JvSlNVeFV6VzBhRHhEQzRSQmRwaHU0?=
 =?utf-8?B?MXRTZC9DRXgzNXY1T3JKbnpNV1dySFJjY3UvMWdBVkx2THpTY3REYnhDVGlz?=
 =?utf-8?B?eGk2ZVRjZ1lGMHRoZWJzbXRCN1VXOCt5cXprMHVoNndveEU1dklWL2x5UVZT?=
 =?utf-8?B?Wko5SVFsVG90dEd6MmhGeVIvTzl6ZGR4WU9KakFOTGxyaGlVN0FuSy90V3Y3?=
 =?utf-8?B?ejZXbVN1SWgxbEs4Q1FObDdndTVxVXgwc3E4OFp5aUtIVXplT05BbWNEOEdm?=
 =?utf-8?B?WlhNakZkaWpibERKYkpMWHpxMjZCMGpLN0pEZ3ByOUw5MjVsR0ZJWTRMTjVW?=
 =?utf-8?B?ZGhaekNTb1hmUk5yQW44VWxTL1ZmUlBTckl4S09CV2xKelZncWY5RWxSa2Zm?=
 =?utf-8?B?MmVBMVJDd2tVS0NvQk1ZZVR4SVhsU2NkSE5ZNUw3bW9QQ2UzWW1Kb010TzdL?=
 =?utf-8?B?dWNINStUVFhaTTJsbWFXeEJydUNtU2NDTDdzVU9PWFZTR2ZTOENpYmVQaXZB?=
 =?utf-8?B?WGRYdDB4empMalliN1NvM2c4cUdudThDbFNZK3BleUNIWlI0enpvaXAxUFJx?=
 =?utf-8?B?MEJtbnlDOUhubUlKcDFtYzA0Mk1lYnIvWXJUdDVKSWt2SHRGTlRONDdkS1Vj?=
 =?utf-8?B?OTdpZHY4ZEZwWDhSYmxtRFFIRmYxRTFXK2JtY2VFS1Zsd1JzZmEwaEI0VWJa?=
 =?utf-8?B?eUk5aURxOTNDYnQzQ1JtUGM5RDZBVjlhR05PVTlUOWNidEpuZitiUWloQXY2?=
 =?utf-8?B?REdqS281bTB2MVlHREhuTzA4RmNyS25kdVkwK0t4YVI0c01UWWxqVC9remVO?=
 =?utf-8?B?WmZwQ3RhNHJVVlIwMVplSVc3UWJJb1ZtZ2JraXdoY2RnQm1ZbVVWN3VGaGVV?=
 =?utf-8?B?VVQrYzVrNXEvMHZ0bHBSOUNWS0FsRDgwMmF6NG9OUXNDcWg1cDJNZWhValVR?=
 =?utf-8?B?YU9FYzVmS0dURWpyTjY4RzlUNENQdlZUMWswb29MUm1Hd0JHcVFMa0VGYkR6?=
 =?utf-8?B?clp4ang1WXJ4bHN1OTF6d3ladkZTOWlDSUVWeVBQTjdSSWdiTU1uMkdIalF2?=
 =?utf-8?B?WEdtQWU5TEFVb2loekV0RUJ4ME5sM3dsbUFVUXNBczZna3ZiU0RrQ0c5d0lw?=
 =?utf-8?B?SnA2Wkdjc3h2R1BKalNYVzZBNHUxanBsZzNVUXBBRU5PM0duUFk5SXY4dXNi?=
 =?utf-8?B?a2JUY2NOWFhmYmZub3NYYVNpblRjQUxDblpVWU1HQ1RCNEZOazlJZDNXVWZm?=
 =?utf-8?B?U2NlbEJsQzE5bWtBdEpvWStwUWROeGpCVGF3OXJRRWlLa0p1UGVkS1QvQ2U2?=
 =?utf-8?B?UWRheFJTWTZRdEV0cmtMZmIxVWkyYzlyeStWd3FoQ1NEajdFRmMzWWdlWGtY?=
 =?utf-8?B?bDU3T29lTTlkb2lSY1dWd1lqTktuYWZDMTFTcFRFTm01MkhkQVBNUUI3eTl0?=
 =?utf-8?B?VGJHVDYvM25CQ2lMTFZFUWVLTG5tSHRZbHA4VGxkL0EwREo0YnZlY2xjVE4x?=
 =?utf-8?B?MzhoWHkxTndSdEYvSXI5alQxQ2tScWdyU0t5amhKeWVWckhuUTdYblRIZUo1?=
 =?utf-8?B?bzFrSENuTDJoWVJHdFN3bnU3UWg4MHdBbE1EVUZVcXQ1cmZ1RG1Wa1BnTFo3?=
 =?utf-8?B?MDg1NHN2TlhaWVFhMkJsdkxmNUU0UFlMQ2FZWUl1cmFxZFIwajZ3NkxJMEdC?=
 =?utf-8?B?RDZ0VC94V2lVYW8xMmZqcTViL2Fya0RpNmdScWtRYjl2Uk1IWjFla2JZS2ZG?=
 =?utf-8?B?OCs1RnhXTXBHbFlPcjE4THRCYjVncGcyMEZ6WkZrd3FNMkxIb2ZwQ0p4bU9n?=
 =?utf-8?Q?GXsURj55JVr86IwCL9pImQILv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7681e7f-bd85-4d16-09eb-08db1f09d170
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 12:45:23.4660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDGLAsBeEaB627mDzoeFCHFh6qsETwb0TmUbHbH8/uIpYG8x2W94iZv3Efe6uDNNJK8h3dBNrUHpUFa4LF4K2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7858

On 07.03.2023 13:04, Juergen Gross wrote:
> On 07.03.23 12:42, Jan Beulich wrote:
>> On 07.03.2023 12:33, Juergen Gross wrote:
>>> On 07.03.23 11:31, Jan Beulich wrote:
>>>> On 07.03.2023 07:32, Juergen Gross wrote:
>>>>> Using a rather oldish gcc (7.5) it was verified that code generation
>>>>> doesn't really differ between CONFIG_DEBUG_INFO on or off without
>>>>> CONFIG_DEBUG being set (only observed differences were slightly
>>>>> different symbol addresses, verified via "objdump -d"). The old gcc
>>>>> version selection was based on the assumption, that newer gcc won't
>>>>> regress in this regard.
>>>>
>>>> This is good to know, but I'm still curious about the mentioned
>>>> differences in symbol addresses: If code generation didn't change, what
>>>> caused addresses to differ? Is that merely because individual functions
>>>> or objects are emitted in different order by the compiler? (If so I'd
>>>> be inclined to infer that comparing generated code must have been
>>>> quite a bit of effort, as first of all you would have had to undo that
>>>> re-ordering.)
>>>
>>> I did a simple diff of the two disassembly outputs and got only small
>>> differences for %rip relative addresses (the differences were in the
>>> range of +/- 32 bytes).
>>
>> That's still odd and hence imo wants understanding. Do you still have
>> both binaries around?
> 
> I have just regenerated the one with debug-info. It is a 4.17 build.
> 
> I just found the at least one reason: xen_config_data has a different size
> (obviously!) and this finally leads to an offset of 32 bytes for symbols
> at higher addresses (with some items only differing by 8 bytes due to
> alignment).

Thanks for checking - this kind of a delta is of course to be expected.

Jan

