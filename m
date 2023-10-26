Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C9F7D81F1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 13:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623743.971882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyjr-0003aH-Lw; Thu, 26 Oct 2023 11:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623743.971882; Thu, 26 Oct 2023 11:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyjr-0003Yc-JL; Thu, 26 Oct 2023 11:41:23 +0000
Received: by outflank-mailman (input) for mailman id 623743;
 Thu, 26 Oct 2023 11:41:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvyjq-0003YT-J9
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 11:41:22 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95787f05-73f4-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 13:41:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8687.eurprd04.prod.outlook.com (2603:10a6:102:21e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 11:41:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 11:41:18 +0000
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
X-Inumbo-ID: 95787f05-73f4-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtgTW+sJkdrKGe1iwPCkldIDQRXIrjFEUkcAKQ3k3yQoHd4bIKDjU4mHbJzgrLxbvsRcilj8I1YSM/dD+HYaLyyD+4E42K7oVxftoTHG7RcO7uJuIK65nTtbPFjgZb/UA5kiDOoo619/0tW7thJWu23pr7psYh15lnDK+yjav2U73wtYCwx2bjxgqo9khnpE6vEgnkatub3CbvJJZevgfgSACiyFAvF6XnT7enlFYmPHipwOZNM8PzwfzojWB/5tDYoLMxC5EIH32VtVnKLJYZjC1ANLnQj7/o6JIdn5pnZxNdXXkSRp9u5jDpg9BbNZtwY3GiJfoy6RpzId/MThTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcaA5TvrO/WTLESNjnkEpRqG2ZVVTL9yiPwmp9Cf+Yw=;
 b=T5cvBm9lIpxl+lIirvRPyf72BGqckimyyXbgOHkt+TM2UzA/wSJMV30WAV7XYa4At02ElEG6rzqYaO2CpxbU8v23VxyJ1GIk8ay20T/SG4ie0X9yprYzYAScce9jcXv8cqcg9/osgN1vRGI2h5jjmYjIOyzgbxfXCvhjCrkk4BATq2hyH04xpy+a6Q5uNpx/HOy+763VfqnUcKJqCqWzg6/ofczqOJTTmLDOZCkjy7f4v0fFGXPL7LRgSAdgvxayxU2ADe7JpjLSUdF03+mgcwOz2cZkJynoqLSjVijaR/bWHLIypFfMFmmVX/3wZmkNw/XdFMYkR1WxCu9s/DA4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcaA5TvrO/WTLESNjnkEpRqG2ZVVTL9yiPwmp9Cf+Yw=;
 b=ufgw24DVyu5XsNx4ZYx5Glb3cRN61l08gk/Rpy9XBlTq/oZzr6FsvELBS3iTK+VkP7lMru0di5hNtCdPM8ApnX6lWuc7BZE2mRV6WfFh8wr0mhzw+gzJgIZqz1/HhdRL7+5tyBLERC/v190QiKUh8OvIU53xf4MfCxL0OBNtFim1QywLDfQ78nrlY/F0A844nnqc7xcnUBJOXi+iW7imcJ59sWDW+8jmCfUu2g8elEwaT0UWlRtP++2jo5CUcTaiZ/Ip0pmriIZiX4W7mjRPim6G2yKxERqh5UWL+df1XzUXauEmsgplgAOTAiehQO9Kg1OovWNIlQXbrorskSADEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <84b6679c-1956-4c6d-1fbd-b72846b69d1a@suse.com>
Date: Thu, 26 Oct 2023 13:41:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
 <cc4c6681-a788-4069-8470-730969018fd0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cc4c6681-a788-4069-8470-730969018fd0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 068c3cb0-64ac-42f7-d50e-08dbd618781b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ofB5O6UIe88XQIl2Vtai0FJh5h+eUevE0R0JARihmyBzcirRg1/rfJUGHj12CELY8rM+3ZVBrOGBYzEWlE/os+jhqI4pFlmgNcw5Qh+BwdDT+WbD9l1JlCmyHi5wa5mITu0HlPXKj1KYx/DB4YC2MNF5xZYnnIf/sc1TgvMBiqA/xQdwZ0LPruWsJ4kxT5U8kFVzbl/Fhb1gqajkTxkkKr+wS+9/TngB3iWdKw+kMuMVUu7Wdr3OIxM1v4jvR70tHk6xC3235ULZb4FKS1RRpH/0JmiVPUB5oUkNtYUiFugz/CCaNv1mEk9j7BUmj8n8sZswKhkTQf/TSTETBguFs9dggk5f5+nAXs3TCYjqLtc8ylNUJpYdnhjO8TuutjOGfW6w1lZiWOZstjCzrH38a6SvOVbLN0+VJBnC+KURl29nZftp1bj29+gNRPAEGr3YTZBz4kiZCXOg2WBplOnOHSbUy6t3jmr0X+NkEPTU+UXmi+xgaOVpmgT137i2rnBsDvBkOXp2BO0RMGv6hlue3EtDMc1KFeS0INvnW3rTFBunOkhYmYulEs5kAq/jEQfBe3+lLTLSDmWjH2XclQcdevxQoIUkbE1AZMf2mxEGFOS5yea0ZqJR88Ivyty5iZoINrNViDIBU+HZYYrUpuNzrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(346002)(396003)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(41300700001)(53546011)(478600001)(6506007)(66476007)(2616005)(54906003)(66946007)(6512007)(110136005)(36756003)(31696002)(86362001)(6486002)(66556008)(26005)(38100700002)(8676002)(83380400001)(8936002)(4326008)(5660300002)(316002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmxKZGJiRkIweUR6NUZGS3JyQnhaYUFHV0t1bkZpVHBBUFk3YzhjKzVQaXAw?=
 =?utf-8?B?K082ME5rQnlYT1lGWnZKVEkzNE5lWFJJQmNrSmJzbjVaL2pvUGsxWjVVWVRM?=
 =?utf-8?B?YkplM3FZOEtCelhSZkNSNVphbmRjcE9NTlY3eVdXT2o2OXJVbVY2dzlEYlB3?=
 =?utf-8?B?UG0ranA4WmNNdzZSUHBySGU4NjVXSSt5MU5JbHA5OWUxajNNSGdOeHR0QmNz?=
 =?utf-8?B?UzRxOWppRmtPVy83c3JUb0FUbXZSUVVyRUo2a2FBdzlqNzRRb2xaNUl1S1pB?=
 =?utf-8?B?aEJhMi84cUhaemFnZUZ3VzhkK0ZaU2EzZUlncURpTGMvQ2l5N2VaM1NYUHA3?=
 =?utf-8?B?a0IrUUp4TzA1QzVIWEk3NmFCbzFjZldHWUc4YUN1ZSs0SlpQajh4dmkrdmVy?=
 =?utf-8?B?ZjJ2UmpzUlBzeWxuTFpEcTJINGc4TnhTeUEySVlUd0paWnN6bGtxbnhwMkdX?=
 =?utf-8?B?STFCb2xKaTVFZEQ2VDhKS1FSTWhNdnFsbWtpUFkwMmEydThnSmRMaHZNNG54?=
 =?utf-8?B?eWxNeDFSL2w1UCtvSjVDL2VQZ3Bmd2hlRzFlcSt5dXorK1BXakFmby8yeHhV?=
 =?utf-8?B?ZVBRcDlTNUorUGswZEpZbkprNVNvSVhFK09hYVpuZnhBVE5HV25TQWo3bk5x?=
 =?utf-8?B?SkpLRS9KQ2ZMVy8rQkpzZmE0MG5OU1cvWXBrMnpQVnhINXlQc2UrT2FMMVdL?=
 =?utf-8?B?c29UZTZNTEY4aHR1eE9pK1k3WlRWQm02bW5jNnYvcHFubVNlZFZSTU5oTkpk?=
 =?utf-8?B?d2dUMEZuR2gvS1RwUXRtS25SYUxnOWlrRG9jL0Nqa2tMN0RsQ0pHTXViVm5W?=
 =?utf-8?B?ejF5NGhYb3dZQWtOUHRtS1NqVXI3TWsyeTdBdVRCS3MybWJ6ZTJSU2ltcjlx?=
 =?utf-8?B?WU5xRkY0Nk1aSUQreVI0K2ltQ1JjS0pZUHRMQWlpeHJjZExRMWFUSHYyTkZp?=
 =?utf-8?B?OXg1c2dOM1FhaHg3dkw4ZTZrcGN2a3ZWZTFkdGVmN3hHbURCenFzdUFzYlhO?=
 =?utf-8?B?OWJSYWdacUh5VXZFM2pkdGRqb2k2SmdtSTJ0dy9Wdkk0aTRCVnJVdmx0V0h3?=
 =?utf-8?B?TUhyRElCSlh4ZU9FZjhvdXlJK1p0cDBLb2JCZGgzaVFnU1FoTUtDSC9pc3Aw?=
 =?utf-8?B?OGc5WHViT3VLVko0K09hZEFBMGpmK01oSGltVDEzcXVmME1tRkhOTXZ4czgx?=
 =?utf-8?B?bTJLeU42TlVieGl1WlpPSVY3ajZQcXZhMWR0SDJHdU16bGdBNzd0Ry9zVUpj?=
 =?utf-8?B?R2FhbzhPRU1XT0h3RERVSEpQUDdrd1VyOUloY2s1L2plYm82eWhiSWdxaDVh?=
 =?utf-8?B?RFdNb2xSTnZrT2poRWV3NGpjbTFUMHNuVGRsZzgwZThSbnRMQ1UxOFBvY0lZ?=
 =?utf-8?B?aDk2WEFUc3M2UW1DM3Y1ZmxiaHZJaGpWcHE3a1h0dXltNldQb0h5VnZjdVkv?=
 =?utf-8?B?SmhFMUYwaktsdzAvWVU5SURLR1dKUlYrZVRsdWNNYm94cFNpbDQ1ZG9xMXZw?=
 =?utf-8?B?WGFMejZUY3YzZS9nZ1RRRmk0TEtORExJRUlDSUIvV1lsM292Ylhac1pTQTV1?=
 =?utf-8?B?S3dhMnZsekNVNGFWaVhQSDIwRUNBa00zSEVRT3Y0L1FlN3YxRDhkNkN3UlpT?=
 =?utf-8?B?aFdPNUxmL2tUMWc4a3ZKRW51VDZzV01IYjcyQTdzUVlmd2ZFTWpTZzhLZGRI?=
 =?utf-8?B?M1hYS1hhSUtZUk04YTNMZ01kQlpyOWtpTWZibks5ZHVrR3pycUpxeWU2eVRF?=
 =?utf-8?B?NlhDNXYwdmdXQkpBaW5IYURwdDN2cWJUVzlIK1k4bHNNcnNyM1ladEhFeEJn?=
 =?utf-8?B?eE4xS2Yxb0dHSC9GeFJnUW5JTzU3dDJhR1dkd3lleTdqaFVWTGFmR0xTTmpP?=
 =?utf-8?B?TFErZGM3eTJsNTY3ODZmSm5QZy9GQUlYQ0orcXh6RmFyNjhRZEZXdG9rTmF4?=
 =?utf-8?B?b0FWTTFydHlPQnFBT1huS2tzTlRGMDVlTGlGQ2VyaG0yNjBVYzkvUStVcWFF?=
 =?utf-8?B?YkQ4Wk83QUZZUVA2N3V0a2p4UzFmQSs0TmFhM01RR3ZFUHNXd3VtSjMvalFW?=
 =?utf-8?B?NEVMZEgvdjNIbDVYaXRGMHhiUERqTzdxTkdLUC8rM1VnMUVNK1RUR1p4bUFa?=
 =?utf-8?Q?D5Wui/jg8oi9ZsvFWKZLwNX/g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068c3cb0-64ac-42f7-d50e-08dbd618781b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 11:41:18.7144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjEUc4x0t4p31lnzplK7v9DUT1FFcjg9ZwNQLXuSb6D7eA0+G1+zuY8OnzNDmYTdLsIf7h2XcoKa6pD6kDU1dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8687

On 26.10.2023 12:31, Andrew Cooper wrote:
> On 26/10/2023 9:34 am, Xenia Ragiadakou wrote:
>> On 26/10/23 10:35, Jan Beulich wrote:
>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>> Given that start < kernel_end and end > kernel_start, the logic that
>>>> determines the best placement for dom0 initrd and metadata, does not
>>>> take into account the two cases below:
>>>> (1) start > kernel_start && end > kernel_end
>>>> (2) start < kernel_start && end < kernel_end
>>>>
>>>> In case (1), the evaluation will result in end = kernel_start
>>>> i.e. end < start, and will load initrd in the middle of the kernel.
>>>> In case (2), the evaluation will result in start = kernel_end
>>>> i.e. end < start, and will load initrd at kernel_end, that is out
>>>> of the memory region under evaluation.
>>> I agree there is a problem if the kernel range overlaps but is not fully
>>> contained in the E820 range under inspection. I'd like to ask though
>>> under what conditions that can happen, as it seems suspicious for the
>>> kernel range to span multiple E820 ranges.
>>
>> We tried to boot Zephyr as pvh dom0 and its load address was under 1MB.
>>
>> I know ... that maybe shouldn't have been permitted at all, but
>> nevertheless we hit this issue.
> 
> 
> Zephyr is linked to run at 4k.  That's what the ELF Headers say, and the
> entrypoint is not position-independent.

Very interesting. What size is their kernel? And, Xenia, can you provide
the E820 map that you were finding the collision with?

Jan

> So trying to put the binary anywhere else is going to work about as well
> having the notes section misalign the pagetables by 0x20 bytes[1].
> 
> ~Andrew
> 
> [1] Guess what was causing the "Zephyr doesn't boot PVH" issues.  Which
> is doubly irritating because about 6h of debugging prior, I'd pointed
> out that the linker was complaining about an orphaned section and that
> that ought to be fixed before trying to debug further...


