Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45DD6374DD
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 10:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447899.704518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy8GE-0001E3-QU; Thu, 24 Nov 2022 09:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447899.704518; Thu, 24 Nov 2022 09:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy8GE-0001BW-No; Thu, 24 Nov 2022 09:11:10 +0000
Received: by outflank-mailman (input) for mailman id 447899;
 Thu, 24 Nov 2022 09:11:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fS9R=3Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oy8GD-0001BQ-B8
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 09:11:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee25d347-6bd7-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 10:11:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7805.eurprd04.prod.outlook.com (2603:10a6:102:c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Thu, 24 Nov
 2022 09:11:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 09:11:06 +0000
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
X-Inumbo-ID: ee25d347-6bd7-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWf+PNn9AIqM5kcmKoqs/+RCx3PWXoSQkMFT9zvXZbA40KqlArleyHLbeD32DRZJhZH63pROFRAPY59NAszJmHOk/hSd7WIFXRlQPkvil+592ZWYK//NTkyO9dmLbGJRFx+a56IipW1coovMMEfTSP0aG8QYHeZPNjiDbshrc2QrzSmcka9LwcwhnsX8WYc5qZjInLN4V4OVVqw74rE6nLQce4tx4fEXJh9Gntnt/vbgyJlmfafgWtMICJFrwUYw4Un0g5dXu17xFSsJHwjXRyATAU1eQKLwmRRSictjeQH1H+frHDWOt5HpFv83QIr1SKsg3tPXKmAcbvrjXMeHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0ov05lpmgHe2Wu0m2soH19Sh3osuAD12ntAahKDk4U=;
 b=lR2hJPozCI9kHr9IeZcdVDLn/zZI4cf3zAjUF/QjJSj0ImiktjWI9Akr71/7gCiQXhjZ9n3mNrew2O/UG0r152KA8CmPXWlK4S8tUIBk0YJj0i2IL2qYQMS1UTLjeI1KN84oQ2WDmMb9ypaCNZg9AV0UKwAYFCuKNPZO4XeqqUS3vTsfyUZZJ5RBnRx4szolyq9A4qG+WFNoTnvjXZhRNYngNvCaChcF9YUjVBz1404d4HW2UFZKqJbKqnu0dckTNAWvR9EVxyNTvR+M39qTp05CAbSsSZVMjInGLiAZYVuhMooYF605Y8MB2H/TVdrvVYsCDSzeUALlTjwloCuOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0ov05lpmgHe2Wu0m2soH19Sh3osuAD12ntAahKDk4U=;
 b=0Mon3d9FQvt7qwyjnkA2rxceKBb7aqVnncMgnFJ1NsK5fxrAWBkDzrGyJPck2/c7ETWz1gH6LwduJ7peOT/PHyAjec36iSNmfV9Xj/Sw+sNB03lC1Lw93jfhKj0xfwV1WzxwT+yBx08OmLg6NwGm8CbLaVP3hfQ45SQp/R3Zjz0xiuw0mPXWprK1ADxMwIvL+mpATpvWxTnLyStSssi44/d3yz8JhbV1NnM4icZn9MtdJ6TezzTpS6OKAz2lZMK60nXy9x5tLX53tH9fUM5Im4vdg7dVlj2TesHu7DkyulYvSaMGndsoFLxIi1E1m8kG/0285SNeTJ7nFLQfj3OsOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c928c198-2565-2105-2b6e-b07e96935080@suse.com>
Date: Thu, 24 Nov 2022 10:11:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
 <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
 <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
 <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
 <Y34L/MwSFGUsSe2I@Air-de-Roger>
 <351a6e54-8002-aef0-993a-c6b8bdcc1e8e@suse.com>
 <Y38ugExH9uGdw83a@Air-de-Roger> <Y38z/h4aEkzh5rCG@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y38z/h4aEkzh5rCG@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b587e9-9c0c-4f76-e5b2-08dacdfbd192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8JKSvSvhc+1YsHGFZSGvBuF8mAja3XPqB477cSHQMwGDoi6L1etUSoAwmVnrA1Rc+tQMCA5OmNZ8YH02uKJ2rTUkckqUkPKhW/eYYfnc7NZkkcJ4Pb3LDLcTVYyXd+LMwyWa8qs4jjIyTGhEwmrVP294R8sFQ6Wt3kRSl5hrEOGmgrM9dhqqitdcux1O7PvZtgBRJxBH/RmLHUG9+adMh6gob2t0JK2t5Lpm2UiATYB7ddByzDNLBFXSpAn8TM9IfEI4UdmzT1iCADsp1dBFJK+klvuIWxdN71oq2g8Thn9MsJwAp9ctT12ErA0qdmAgVTk76UAmV8DZ6e4PH+g/E0/SF74XgxD1WSUUqohksPNgPLJZCay+u04z4TWZav6OAJOVf80uWg/ZNm/vPCHpdbyeChgukhdg0/Gn14CGVto2m0KVPw7BUU4YKMN20P9m70S/ekpUuBU1miWXf/7wAeEcgixuZiSToSO4IW41/EyO4HtuIM59w2kTyQ6di1vzLgni43hGRFd85jhy0zI1dJgGDtnwB9h2lLCCpz5Y+1wfEpYcDK7budapYuKkFlfsURRbeMgTOtGrXhVO3FyJyOxNDEtPt2ZPUJgHu+8PJxtiZ48ViBM2kMqJYQrDqbqn/RrrgN2HVduRUon8Dp9uiguXmTATk+btQB/aqZ0CswfN5/WWGg6tSm7ufESqKZUQe8MuqVQjR/1VN0a6TJgCbO2UlZWDiPN0+xm/WDMACunWhw8k1dD4cluubxTXFOBnNxiMI0L99uwkVGYk/jhKGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199015)(66899015)(36756003)(31686004)(6506007)(86362001)(31696002)(53546011)(38100700002)(2906002)(83380400001)(8676002)(41300700001)(8936002)(66556008)(66946007)(6512007)(5660300002)(26005)(186003)(316002)(6486002)(478600001)(66476007)(4326008)(966005)(2616005)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjVrak5BdUZXZkIwYkI0OUhCNmpKUkRSc1dOU0Q2enZhYmM3SnRZY1ZmNFE2?=
 =?utf-8?B?dTUwakxYeEhNZnArUmNWbHNDWG1vdzhBWnZkYTk2cW9mRWpBSTcxN0dPdTVB?=
 =?utf-8?B?OWNuOVl4TEkxRFRBbStBaWxhVnBmNGtXbnNaRzM4UHdjRFJFMisvR1lubzIv?=
 =?utf-8?B?NjRlWm9rRExPeUp1cFgvU0RXdmcyalI0RHBxSjRlZ1RZZWNZeHhIbG5SUkdy?=
 =?utf-8?B?TjNXdWw4SzdPSDFYV2VpNWR1SCtOdkFrVWRsVlk0TzEwSXZ4TmlURW5TV1pi?=
 =?utf-8?B?OFAwMkpZc25hZU9qQUdSWTdIU3ZRekY4OGlzbCs1VTVXWXZubDhNVFFmMDFt?=
 =?utf-8?B?T05GWnhHV0dZaUFyNit4V1NITEM0OUtZM01CSzlEZVlOdWpyT0tna0hjMHk2?=
 =?utf-8?B?REZSTnNsSjN5MUw1ZXVkWThRdXVBakZaeENYWjgyUkkyaW90RysrUEltOGI5?=
 =?utf-8?B?a1lQcHRyTTQ0TlNpVG1UcCtOem5HcmZFbmxESVNwZE5kek5qNVp0RFdpTS8v?=
 =?utf-8?B?QU9laEVZRlBvMnZxV3NKLzVVM1VHS3ErQmdjR2ZiTzVXNlVqSjNQSjJVWHJ6?=
 =?utf-8?B?cStUa1FzMFJnZWZsN3NKOXNLOHBBWGdDcmpQSGJWeCttNHREUW9yRWNoQldK?=
 =?utf-8?B?a3JJeTQvdzFLRHJRdTZ3M1UrTER6ZUlDTXh1NGxXYS9nQy9qZHZkMUlTYVY3?=
 =?utf-8?B?YUxwYnQzaWFQMENiVi9xdUNlZlprVjlac3M0R2NRK1JVbGNtR3FkR3VWbmFF?=
 =?utf-8?B?WmNuVjhOYXZaYkZFSURxQmp6d0VWQXdNSnZCczFwSWpmWUU3dEthL1FZSUxH?=
 =?utf-8?B?SFY5Y3c1UDFxQXZmelJ4b0tOSDJpV3E5ZHU5eC9yWWc5WjBtaG9jdkg5ZTJl?=
 =?utf-8?B?TFVDd2pHRm90L2xkbEgwNXN6U0pTRGxXSUFZUGh4SDNBQ2h3ZitLRmduWkdY?=
 =?utf-8?B?alNZUkpPUVl6VmdyamJaMDB3TDNZai90OVYyL1orY09Wd0tQM3BJRU13eldS?=
 =?utf-8?B?ZHdCZktIZmJvbkZUVmxYK3A2bDVOQUFUbXNGM0FzQkkza0VVTXhEcmdReU0z?=
 =?utf-8?B?QmcvWWFEZkdtdjNhTWNBby9Mb05uaU5oNUdrMmpQSWE1MEJSN05kM3RnLzhI?=
 =?utf-8?B?ZlpWa2dmdmdZOWoxd3U0aE1JRjQwcWViNXBOSTlnTUR4SmIzeExTL2pCd1p6?=
 =?utf-8?B?V01SSWxoUnZvSm9Lek5PZDk2K0Y1ZHZGRFpmNlVtY2QxVUVDY1F4VTVjUWFN?=
 =?utf-8?B?N0ZPRXFndmtYQzBoNnd1TmRMNE5jSzRKS3Z1M2gxdFlyWlp6Y09XZHA4V2dy?=
 =?utf-8?B?SEU4R0QycFRta0lYcU4yNStNSHRkdWJNcms4ZHRlV3hCcWhNbzJLOEJKbkc1?=
 =?utf-8?B?VTJMM1pLSjE0dVVEVmd5Y05rUjlHZVdSSnYvTlpoWEE3MTZkYW1FamJ2aXlJ?=
 =?utf-8?B?bWt0STIzWVhWQklvai80a2FsbnhUMXZyUk1ndmFUbEFBTGdkVEtQcUpsVkF2?=
 =?utf-8?B?YXE2SE9xekZIenNKeFNvNnZudFNOSVUwN05mbU9uNWpKL3ZOWnRxSGIzMnZi?=
 =?utf-8?B?YjR4S0RaQkJOZkl4RURVWU9qTEVkZFZ5MVZrclBPY2ZMc0N3THl3ek03VUpO?=
 =?utf-8?B?QnRET2E0Z2U4dGZQVlEzbDc4U01GV2ZVNk1MYjRrTUFIMHRESjNwVHFKZkRG?=
 =?utf-8?B?VHNMaG5YMFpPaks3SnNQNUdWQ1hybUIwcy85MElmZUZhMlVYMlZDTENuWmlG?=
 =?utf-8?B?ZksyY0JGOXJsdkV4MUNrdnhNanhjTHV1SEtPUkw3dFMrQXY2N29FRGlQblh2?=
 =?utf-8?B?NTlZbkNvdFQ0eWczeGhMRlJFMjY1NDdiZ2hHWGswSUdXQkJ3dFkvcExNNnNP?=
 =?utf-8?B?MnQwYkJXZlRTUkpieWRYcVlaWmM4N1J5YWt2Yjl6NHhoWHUreU1WRTJ4Wm5n?=
 =?utf-8?B?c0h2UnU2MWtjcVhsL0hWS1BFdjJ1Zy9YaEJoQmxLTUlhQlBMSVl5NXp1azBM?=
 =?utf-8?B?dkxlSHNBdElPNFJtc1hjTzRaUXlmVm50N0Zmc0dhZGpBbFhLMnphZXIvRUJx?=
 =?utf-8?B?TS9QaHc5WU1mZ0RsS0wrN0ExbUorZnlLY2lHU1pOZVdFWmwrRUlqS29uU1JS?=
 =?utf-8?Q?lIRzD5L7WfGy307i9unJUTvaj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b587e9-9c0c-4f76-e5b2-08dacdfbd192
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 09:11:06.3834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31Bexid5mBzauFud0tlBlWt25M0wIifZXBSACL8Jj/yB8Wl/0zoeo4Bs+Vj7NiTvQME3nTlK29+3EVnV1o86Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7805

On 24.11.2022 10:06, Roger Pau Monné wrote:
> On Thu, Nov 24, 2022 at 09:42:40AM +0100, Roger Pau Monné wrote:
>> On Thu, Nov 24, 2022 at 08:59:00AM +0100, Jan Beulich wrote:
>>> - problematic wrt evtchn_upcall_pending, once set, preventing event
>>>   injection later on.
>>> As you may have inferred already, I'm inclined to suggest to drop the
>>> the is_vcpu_online() check from hvm_set_callback_via().
>>>
>>> One related question here is whether vlapic_do_init() shouldn't have
>>> the non-architectural side effect of clearing evtchn_upcall_pending.
>>> While this again violates the principle of the hypervisor only ever
>>> setting that bit, it would deal with the risk of no further event
>>> injection once the flag is set, considering that vlapic_do_init()
>>> clears IRR (and ISR).
>>
>> That would seem sensible to me, and was kind of what I was suggesting
>> in:
>>
>> https://lore.kernel.org/xen-devel/Y3eO0bMKRPYJc2yQ@Air-de-Roger/
> 
> Another option would be for vcpu_mark_events_pending() to
> unconditionally call hvm_assert_evtchn_irq() regardless of the state
> of evtchn_upcall_pending.

I think you said so before, and ...

>  This will create some spurious events.

... I continue to be afraid of s/some/many/. This event delivery is meant
to be kind of edge triggered, and I think it is a reasonable model to treat
the flag going from 0 to 1 as the "edge".

Jan

