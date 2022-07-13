Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6FD5734BE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 12:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366480.597275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBa2N-0002ut-Cp; Wed, 13 Jul 2022 10:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366480.597275; Wed, 13 Jul 2022 10:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBa2N-0002sb-9B; Wed, 13 Jul 2022 10:56:11 +0000
Received: by outflank-mailman (input) for mailman id 366480;
 Wed, 13 Jul 2022 10:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBa2M-0002sV-Is
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 10:56:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66886c81-029a-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 12:56:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9297.eurprd04.prod.outlook.com (2603:10a6:10:354::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 10:56:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 10:56:07 +0000
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
X-Inumbo-ID: 66886c81-029a-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDe7ckSL8yoquC85WXXYFVxnaJ/OkaNFkCz4HssQu/vbA8b4mkgSxJ+mYjL69Mu8/ZvDY+/QsKAXOU1mGIzZ6PIJU7uK+8d+ZeKZylJQPwr66/YO1ejbbWnIgQDz2u0RlG8XmpigFEO7SF3aYPES48tS9h7LxCJZK5JaXKvTVh8tHWMZS+Lp+DcgjDc6/09tZAEnZAq8svCmy/7a5EBlQk2+SEhL3D5XS1siGRIw6w5QFPJYPQDRuHVfcv68wHGTFfqomBqEvbDNblMZOFt0qJYzqsSPLXsgGl6pXl2AEOZDH1sx2c+/5V4MQA3NvI5X3EeBYQ5LIBdKhun6f7/Xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBv92jFERIyUUuSdPy5W7MkGC5RJaQFYPDo0M5aO2w8=;
 b=DnUght/esJmYfwVoCrYVa2UmuhhakGB5ycB4cAgBicf+amKh6VFsfryHt0Fs2NrSEMuzZ8KM9ibgE64OXO/pQ4/rRnO2ba+eIeWN3c9/RSyZYWXSatrsX873qtut3/ijnXO3wATzdGK6Odz6G4dtprexIIjXAS/sCQA1u2LA6VEL3GVm449DQL2sO2twEE4APwI9030bNCAdOt2n1jKGyd1hJTJF0DUlavKYVNdtj+8HWiAsc5UnJM41hxc566Gv3WQJ/GxnYocRFsehLw/hsh5OVpRxVkR22mNJ38bTyOG47Z90mrcGIfjnH1Is6mt/gSTORR7zg6vcuUKvctxIdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBv92jFERIyUUuSdPy5W7MkGC5RJaQFYPDo0M5aO2w8=;
 b=kZ8eQ183v2H6QLPsgYh4U0E5F0FxVQimD9EiSjBTUZc0nWcyMXNXeP8HaEATUX2B5tXwsY3jmsvVoNoX6K7RSjt0h85jxJhqy0+yz+nfOhndWFOsjXlqQb/eDbHkxZ+9fWvC1e0C8US3Z67CJPjrRnvUfxW4I/VOwmoiPG7C1YbGlzLdzBCYgzn8/eh9bG2X7WgUWWRlGGiS0ZFQ08jtkjtJ1XwcFlJHCrHBHX+OLaTx5dB9cjjJf8JwRK0DhjB8MOxUkrBOeHTfw1AizGuBJIrWiiTIw27W2MEit6pX43pzaOfTcS6uxQ4eBpVaNI2vpCqRBNp5jgQBm3lIpI9y5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
Date: Wed, 13 Jul 2022 12:56:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c69f99b9-bd2e-4b80-a8bb-08da64be49a0
X-MS-TrafficTypeDiagnostic: DU0PR04MB9297:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TiG0vE/afUjrxalCi5PfJXUWlAzUJzs89myhQpVYQs0PUQDTpYul+KI+MQO3JHOvzjTrSgkkpuTcrlOxufkk4nhIxlQFgp4Nis0qcYDh7BMy86Bt4gJ1DyPhr09/CRmUuUydfx4YU1O8LEuBHp1nka0nHi5GXBBlfkKAAP/CI9n8LTV5DLKQv2+HbPrf2SOzgZ0XQkSUtfdWUbRERVPBKviXmbUXAuMRiVU5j1OyFXDrdnBnQo0xp8O7mIexEzGPh1uZsE9gYgtePtkQLTQN0gYZI9B1D06/s4k8Kpc6Vib4XPBxzT7hYWdVyxgJ6qEyBx1nmyt4rEMkTmJxBWeYeY0hZY66AgQxSpNEmijxSmy80Kav5rnEo5jPv2v40SmeUilgTpJ6FV4wrqe8+5BLrcWjS4oYV+YtQMbICewNWlaEwSWMEAT6oscy7I05JupUONvnkrtz/VxDNX477CRjwzMwjb1PR8t6keRno7vDCu29jJ7gw/xHRECzjP5SgNoo4mf3osJxTCJJaIua43GR6BPjCrHi+PkAQgF0wWkWxJIthsjbHczXCwwU+6bCF+vTFabz7d/9XBcNbchpFAd9SfaWvz5WiRu0dRvqRjRBxgMtVw75CgeWQvSBSSCo8q8sAtZ9ubLgJpOVLgcXFqkde7KiE0WdOYO62yejbnUQnrepHeGuLTuKpM6B1jrkGSeyjmuJOU0j4PPAwxP9fPckrdAkxk3V3QCPPkS+5x9V+r0gDR1x9/Vq1YQxv8xUxGj/Y1QhyK9c2MF1K4avah/lgVNvy57ZPC0EHum89y9EexJZBwLiA30OGA22hHfgQvoj4jxtp8fkH+pIF/n6AwMIfxkZxXekEJvmC2IRQh9dbeI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(346002)(39860400002)(366004)(396003)(186003)(38100700002)(2616005)(31686004)(2906002)(36756003)(5660300002)(8936002)(66556008)(66946007)(8676002)(26005)(478600001)(41300700001)(6506007)(6486002)(6512007)(4326008)(83380400001)(66476007)(53546011)(86362001)(31696002)(54906003)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ektMeXg0cTdCMktxc01DL2ZrSk1qdGxORVc0MkxYV2RJVVdpek1iSTFPUjRz?=
 =?utf-8?B?a2pZWGNoMlFFZTNXZTJUMit0OEdGZjVyR2pLWHlsajlZcW1IQ1loazhTaExF?=
 =?utf-8?B?eEY0dmxqellGVUt4ay90RGMyMGh1UTFuK0Z2TW5aMWs4M21nVlQreDQ5SWpi?=
 =?utf-8?B?WVpxS3kyMWEza2JsMGRRaGNnZkJtSExCYjN3Wm9STzNQMkN3ZmlEbjdLVEIz?=
 =?utf-8?B?dHgyYkQ2S3h0cGZjMmdwWlZHUDRuRjRIaE53N2ZyMU1lRWRIZUkxNnNVZk5m?=
 =?utf-8?B?YmxCNzExR0JOYUlCSXhSWnpjNENRT25IQmhlS3EwemkwSjdKT1VwNlQrQVkv?=
 =?utf-8?B?TVBFL0NsUDk2cnBlR1hmS2Q4Snl3bk96SWV3am1YbUQ4UEpoUG5rUXJuT1Z1?=
 =?utf-8?B?YVA0SEVBS2diVklFaG5nZ0ptZ0d5blhOaGVJRDF6dHlzN1FybDlmNW94Q0JR?=
 =?utf-8?B?clVQSWdDT2xhdEw4TnViRkFiNVdEY0RXRGtRSktVaHNldTZyWXdSeDN2QXl1?=
 =?utf-8?B?R1BHRTRhTmorYVV0a3k2MmcwU2Y4OTFjdzFxMjRIbXk1a2RKSXdsUUxndU1r?=
 =?utf-8?B?bVg5Y2wySVhqdmgxT3IvNERCTzZ1WUU1NTZLUDZmaUdjeTJEOTZwczBmaEhF?=
 =?utf-8?B?UVB5SlRyYm9kZy9GeFE4b3hyL00vNHk1cGFOb0MrdmtIQ0VuN1RGSU9lZTJZ?=
 =?utf-8?B?UnZIQXR2Z1llZCtrNmw5M0F5aEhTZFZ3S29uRjJjSXYrUTNEbWkxTDdLUjE0?=
 =?utf-8?B?dXFDRHNVc2RNNnROWVRyTVl1dzlQRWFDR1hISStwVkwybXBDbEhZWmFEa3RB?=
 =?utf-8?B?aGdqbkNoa3htQmRaSVh4UWVDZGZwL0EvYU5FY1lpTCs1eEovTE8rSnpMcno4?=
 =?utf-8?B?S0hRSnI1OXQ5c1dYZnZEZHBVQUxSbktwdXNadTVDMDlodURSNUFlL1Z6TjUw?=
 =?utf-8?B?ekxSZ3E1TWtDSS8vQ2hOMXhKbEhHQUsvMThiZlYrSUx0eDMxV2JFeGVVMUpL?=
 =?utf-8?B?cWNYcGVNWmhpeTdaSjlFTkFnbENPRjNuc3JQYVhhZVI0SlFXMXpyV1Q3WW9L?=
 =?utf-8?B?S0VpbHBnWWNIaTFzemJiSDRpY3BJcVBtTnoyQ01IUUZ5ZU1oRjJpK0NKbUVB?=
 =?utf-8?B?THdQNGhCdXBhUS8zNkk5MVY2c3k3dnRkREZ3Q2k5V0RNVFlESFdzWGdYS3Rt?=
 =?utf-8?B?MXpyRm42MGd4ZldCY0RqQXVWQU5od09UT3Q0S05WMXc0NmVldmZCMlA0cjgz?=
 =?utf-8?B?cGdJYVp4QjN4cW9TeTJ1S3R0RksyRVV2OW5tRmhXNFNPclRKVmJTb1NEUDh5?=
 =?utf-8?B?YTlzeWZWcDRqYUZxTlhUU01RaFVWbHU4MUt2U1dPeStFVWt2N01PVjlOanpG?=
 =?utf-8?B?RUFQM05OeE9hTEFydmlQSlpiRDBZSjlNUzdWYUJ0VUVlMC9PcVJETG5vTHZU?=
 =?utf-8?B?YldYNFpJbzlrZVM3VGJmUkJITG1qMzFMYklaRXdzZkl2ZmJWVzMxUWpDMFk1?=
 =?utf-8?B?VTUrcStsU2FtSGp2TXVPTThyUXJWNkVvY1lWcWxKY28wL1NkUkdMbVIwd3o4?=
 =?utf-8?B?aHBudWtvUjI5OVR4cTlHeVRFOGNlME1aWHJJa2lNUytCZ0NyWEZvcXN1RXkz?=
 =?utf-8?B?aTVjaW13WDZHYVFzZStTd09rVE1KUkJxb3hweDBRQndJYTdsOHVqNFFqR1Fq?=
 =?utf-8?B?cHB3dHNINEwyRjRCUWc1VWVLcDl2dXdCQ1A0ZzhUMm1jUkcwU0JFakdkSlVW?=
 =?utf-8?B?QzJNUU44Q3VnRzlWYTUzcitBeko0NE9Za1ZyRzNBK0Uyd3pEVUhiekdrckRM?=
 =?utf-8?B?S1VyT0xmTmtaTlFUbVR3UVM4SEhoSVVZcTk3dk9IWUYxd1hwOFBEQ0ZESzJl?=
 =?utf-8?B?b0lhWXAzUTdQZ0dJYmE0bVRZV3l2anY4NmxQNmdWbHB6SE56a3Q4ZWVuZDhW?=
 =?utf-8?B?bDB0L3FFQmtzYnV0K0RCdXhjNWtRTUFWcHRBZ25tMzZocThNKzZZajRxMXBN?=
 =?utf-8?B?Y2JCaEFXaU5hL2djbWhNMU92Uy9IYmJLRlZKTHJCODEvQzAzS0kxdzhpMzJr?=
 =?utf-8?B?M3NLRnlUbitncUVNT2NIUER0RDB1L0dxU1dIVTMvSDZzaUxYNUg0Uno4eEE5?=
 =?utf-8?Q?1sDbodMwV62PatFbSi2K1QtVR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69f99b9-bd2e-4b80-a8bb-08da64be49a0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 10:56:06.9582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4E359YnXzlDqANVEWf6m0k4t4kna1LxRv+ZCQCvhLSbuh3CbldApz6EGW/tZIOeVe6mwBNjpNloXVXwy0zYdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9297

On 13.07.2022 12:18, Julien Grall wrote:
> On 13/07/2022 10:53, Jan Beulich wrote:
>> On 13.07.2022 11:35, Julien Grall wrote:
>>> On 13/07/2022 07:21, Jan Beulich wrote:
>>>>>> For the FIFO issue, we can introduce the new config option to restrict the maximum number of static
>>>>>> port supported in Xen. We can check the user-defined static port when we parse the device tree and if
>>>>>> a user-defined static port is greater than the maximum allowed static port will return an error to the user.
>>>>>> In this way, we can avoid allocating a lot of memory to fill the hole.
>>>>>>
>>>>>> Let me know your view on this.
>>>>>>
>>>>>> config MAX_STATIC_PORT
>>>>>>        int "Maximum number of static ports”
>>>>>>        range 1 4095
>>>>>>        help
>>>>>>           Controls the build-time maximum number of static port supported
>>>>>
>>>>> The problem is not exclusive to the static event channel. So I don't
>>>>> think this is right to introduce MAX_STATIC_PORT to mitigate the issue
>>>>> (even though this is the only user today).
>>>>>
>>>>> A few of alternative solutions:
>>>>>      1) Handle preemption in alloc_evtchn_bucket()
>>>>>      2) Allocate all the buckets when the domain is created (the max
>>>>> numbers event channel is known). We may need to think about preemption
>>>>>      3) Tweak is_port_valid() to check if the bucket is valid. This would
>>>>> introduce a couple of extra memory access (might be OK as the bucket
>>>>> would be accessed afterwards) and we would need to update some users.
>>>>>
>>>>> At the moment, 3) is appealing me the most. I would be interested to
>>>>> have an opionions from the other maintainers.
>>>>
>>>> Fwiw of the named alternatives I would also prefer 3. Whether things
>>>> really need generalizing at this point I'm not sure, though.
>>> I am worry that we may end up to forget that we had non-generaic way
>>> (e.g. MAX_STATIC_PORT) to prevent trigger the issue. So we could end up
>>> to mistakenly introduce a security issue.
>>>
>>> However, my point was less about generalization but more about
>>> introducing CONFIG_MAX_STATIC_PORT.
>>>
>>> It seems strange to let the admin to decide the maximum number of static
>>> port supported.
>>
>> Why (assuming s/admin/build admin/)? I view both a build time upper bound
>> as well as (alternatively) a command line driven upper bound as reasonable
>> (in the latter case there of course still would want/need to be an upper
>> bound on what is legitimate to specify from the command line). Using
>> static ports after all means there's a static largest port number.
>> Determined across all intended uses of a build such an upper bound can be
>> a feasible mechanism.
> 
> AFAICT, the limit is only here to mitigate the risk with the patch I 
> proposed. With a proper fix, the limit would be articial and therefore 
> it is not clear why the admin should be able to configure it (even 
> temporarily).

The limit would be as artificial as other limits we enforce. I can't
see why it would be wrong to have a more tight limit on static ports
than on traditional ("dynamic") ones. Even if only to make sure so
many dynamic ones are left. That said, ...

> Instead, I think we want to have a limit that apply for both statically 
> and dynamically allocated even channel. This is what d->max_evtchn_port 
> is for.

... I also have no issue with following your way of thinking. I view
both perspectives as valid ones to take.

Jan

