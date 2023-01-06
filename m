Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151E365FC52
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 08:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472362.732556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDhaw-0002aU-PG; Fri, 06 Jan 2023 07:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472362.732556; Fri, 06 Jan 2023 07:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDhaw-0002Xt-Lt; Fri, 06 Jan 2023 07:56:54 +0000
Received: by outflank-mailman (input) for mailman id 472362;
 Fri, 06 Jan 2023 07:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ggnj=5D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDhaw-0002Xn-5P
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 07:56:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id add77bcc-8d97-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 08:56:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9127.eurprd04.prod.outlook.com (2603:10a6:20b:44a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 07:56:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 07:56:50 +0000
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
X-Inumbo-ID: add77bcc-8d97-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9JQ8z+niPqPw2LkBL00+4xDnfDwMmHDHKyCSDQk/T0nikroYfuh3ZgXS1NXf9gOurmZmf4h7EmWUsLpC/nvGYTexIhi+2p4hLmtz8fOX6uF9ayQnwwvhMDL0zg8BPjreoUUy8l0NO6jnWVXVUS3Xjgetyk0YlCsezviNFxIjH3iYukwZUDCSYpBT4+tzlVtT6XrRqLs04saEpKlAs4dlfM0GbSPpl0IeRf/4EtwQ4YxRCV+GTZWK3un/aXybgQ5nvUqZo3iy4cLPLKB4M5b2DVI9vhmj5K7H1eZ6nuIylTEgZyH/iDNDcHqNaYcxsB47O/WIS8d7v2jPeWaSE5NCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRhZxzzZ3J6kJnMtHAlWdvDXceG75enGMlLVUHsUWvE=;
 b=fNYmCoNc4IGsnFAbChKwC90zH872QGfWjPuiMTwy2mkVB8vyznxWf2Y+rAJDSMaP7+/W08kk66j6XKQEVhiHf0Ct73fstaeiHZ+DazZp+J9IAd077BaWNJ81uZOz8stlnLgzZIdH1P3UPoVI0xM2S9hMCQ2E51tbIfuXzaacAKIf4Ys7tP+0E1g7oCn+pAy7dyJj7VsxXnV3/sUML4OFRGq6/asPV0UKqjlohy9M9m96V4w5tLyH+o7Yp2j6lvB+BCWdH2dyi4C4KqPKPqXRlpTb4c70r0mvJ8EFcwxhveZ1v2Xk+whbGpMgB3cxwyhOL0dV4aQ7FRWBdzusFyaLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRhZxzzZ3J6kJnMtHAlWdvDXceG75enGMlLVUHsUWvE=;
 b=DG9Z+Y/653hM3aRV9vS4ImGGejfRK/RYMYaLSNj8cIEour9MLIHCQeYhkh8tSno13gXet2umftwpKv7i2uvM1nPmXOa0UMsuyNjtYp8OGT5KgOp58BpQ9aSFP/WknR+soHPgmgBTj8KDKrs6JQX9M6DnWBu3ZbIfr09e4vQ9QmiHrXsP1V0A5x8Dx8a/yMuQFEFoT10Aq+4GUDhAhigxMQ7AEi7A2cjIt53UyK5kOz7/6zRopk0Z6ee3Dn1Dn47de1Th2KqSCXj1aMPtwwvBEvjMCa8JlLCNjpu/2ujTqwNvAudGvF/dTZPzj9u2d6Og1TiGxvkWcuL4kCB5XrhEMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ce9eaed-7684-22ea-9ce6-9a45d9cc69c1@suse.com>
Date: Fri, 6 Jan 2023 08:56:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/4] xen/version: Introduce non-truncating XENVER_* subops
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-5-andrew.cooper3@citrix.com>
 <a0cb9c83-dc4d-5f03-0f65-3756fadfde0b@suse.com>
 <9c9cedd5-cca7-95d4-00bb-f34a56de2695@citrix.com>
 <f90111d0-b94e-8127-3b13-fbe3558d53f7@suse.com>
 <63789ce5-5dff-c981-4127-d1ef3227595e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <63789ce5-5dff-c981-4127-d1ef3227595e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9127:EE_
X-MS-Office365-Filtering-Correlation-Id: 1184f8a4-23b1-4bb1-074a-08daefbb9146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8R0P1dpyZKCsjrAS67GvwwrP+/tl043X/nqDlgYmvldn943s6m3WE1trL4B/5JawmPY/VjOIay3GbjDqCSQYJp7hIr5aYJ+vHqsZhmE+BwqMJce9PiPnyQxzK81YVYGCZbJvirmq+JZPUBh/i3nF6YC3hQ6TYl0O3JB8WHMaG1SVUJqYQ9BcpqQirlZpjvEChg+8fI76BnplnfhytDUmShiMqEI8Imw3pTg7vxXuAco8mDTR7qJePbXVWKbY6O3jMIZ6KmxhhdvEs/PjsmwMmjVaSQClmcs7hFMSKZLwDbilP2PlvonnhUFkfuLV4hJFzAUnIZKYWP9AT1xGl1suFXxcSY8bjYN7WmHcDSNQXHvCTP1uxp1BkNrWtzEFo6xllisf9S8iLcn3EGC/ti8417erwL2/SSxv0t7zXr375QlaR7GstywBRxmkd+GjTquwNqf55uA1SB+2juNJIaUsVNOAJM1VLdBU4EEqpysZzVH5YXgeIphZmdJwTddoF+Ga+atrPqeHmj9uX6kuOekCZKAji3ViNx7p+rz+jwtf2WBgHS6OQPxW1X7v+UP1Cg9ymcdegiw4ymayoks1qr1+d8hw6aHqsnYAG4NO3DBfF5v8b0pKgPFuRGpG7VKoF5yOwXz9v48pSXK5iBw590EGCgoCZkmFuZ5XbDgPNeYCfscyO5ULgA5KVXpdR0gp4vO7RoPiXUAm7vzfO+HZc0ApIuzShIBq47mtYBnM+Ng8oUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199015)(83380400001)(2616005)(186003)(26005)(6506007)(53546011)(6512007)(31696002)(86362001)(36756003)(38100700002)(8676002)(4326008)(66899015)(316002)(41300700001)(31686004)(2906002)(8936002)(5660300002)(6486002)(66556008)(478600001)(66946007)(6916009)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFZEM2o4cjRDTk5lN2lBdW9sU1c5ZUZkdmlkdk1EbkJBYk41Z0xtT2hzeTNL?=
 =?utf-8?B?NjEzZWRCVnFEK2RJMis2WnJoTGhOWEsrM0Z5NCtHUDE1clZMQmFtK1J2azFm?=
 =?utf-8?B?V0tHN0pGUjh6NE9HSlpkbmhKY28rRXRoOG51a2VYcDJTZ2ZkN2pjS1lPRlpl?=
 =?utf-8?B?U2ZHVUJRZk5uaGVqNndoVk50SE4vK1QyNHRJajdSMks5TFAvVzNBQi91b3Iy?=
 =?utf-8?B?eVJ0RlpuU2plZGx0MXpLY2NySGEyeVI0UE9oM3liMGpnWnVuOFN1WkJTNUlF?=
 =?utf-8?B?NHNSRUNvdnlwcmtsMm9LeTc4Z3R4YUdJc3VzWHIvbEIrRlh4bWNGWXoxbkVN?=
 =?utf-8?B?Q1ZtSWZ1SjYxV2Y3SWVTeEgzSUM3Qk9pSlIxMWx1eFhxei9tMzE1UW1sYXpv?=
 =?utf-8?B?dmNWZjB5R3JIMmtsbVF0MklCbDRkeE1aTW16Skh4d1gwb3pUMkJUNGNlZmY0?=
 =?utf-8?B?dXNmcncvbmdJTTZlRzlSenkwVlRMeEo1QlJMdWN2RlZZbkZ2UGhJNjRUdHNv?=
 =?utf-8?B?Ymo1UHo4cEVhaC8ycERtZy82ZE4xcEJlblduNnVPb2xPdkxrejl3V3V4VTRJ?=
 =?utf-8?B?RDZ5c1ljNEZhM3FwN1NKWU9VaGhDaG1JWkhKVU5NRGtrc0krRHg5RlVUVm5Q?=
 =?utf-8?B?TWMvdm5oc2VVK0JZMzlURjF1ZGMzRThkOCtkLy9nNWN3b3lDZ3BoQTI0WTdX?=
 =?utf-8?B?dERZQ3dTR1lKQkZNWjJsZlJuZzkzd1BuTk1hbWJCa01ndUFlM3dIeHhPME55?=
 =?utf-8?B?bm50VVhBbXRDU0l0ODFnbkxHZ24vdnhGdmVBQ2diUjZOcndBaXcxc1V6TkRk?=
 =?utf-8?B?NU9tK0ZxZmdvL1NYckF3MG1QMFNWUzJRWXN5STRyZkY1T2JlaDJ3V0lHRlI3?=
 =?utf-8?B?Q0JteHVDYVZ4TGIvTk5TYUFvRkhNdlNYV0VteUUrOWhGREh3UGwyRVk0dmJV?=
 =?utf-8?B?aVpIM2FQQnFjaUF5NGZDR1pXK0hBZzNkVTVSMXMwRUVsUGhnbU1TS2J4ZmNR?=
 =?utf-8?B?Nk9KdG5Makw2QWlKQldKV3o5Nk5oQk83UzZRS2ZzTlkzb29Mb2RUS2FGWTEy?=
 =?utf-8?B?VHUwOUdad1d2RkJMN05wL0M5aTllbzZlb25tazhvbnhITWZkZzBxeUtQQUVp?=
 =?utf-8?B?cmRQR1QrRXhDK09MVFlSRzB1QWRYYU5kc2p4ditkZ0tpVkVXSHAvTitPelpL?=
 =?utf-8?B?clczcU8wQWNrMG4yRlRIUkpwZjczcDQ4dzF0RkZvcnk3a3ZzVXk0NzJhVnJY?=
 =?utf-8?B?NmZESFJaTUprUmtacWdyZzBEN29RaGtacG9UN1JKMVo5UFBXMnFCSVdxTTRo?=
 =?utf-8?B?S1F6MG84V3VUKytMSmZrMUdOTnVCSWZPTlZuTEcyK2NVRWE1RWYzOVlmeUhK?=
 =?utf-8?B?VkNvZkI0YkRjaWZzYU9odmpOSk9mLzMwMzBXNlpPNGxxdHBsNHhpQWVJcTRG?=
 =?utf-8?B?T3k3UUdzZk1SSXRrVXlJSExKbEUySkthN29ianFBV1BoVm01Mysxd29QNUcr?=
 =?utf-8?B?a0VsKzNKM2FJamtNRksxREJENjJ1U1FzZE5sRHJPNEpCUUpOTXM5YkZ4VGJE?=
 =?utf-8?B?RGt0WTQyVmNJZ1NidEJDRGhpWWV2OUdzVitDeFVoWi8wODQ4d21ZUmdZZjM5?=
 =?utf-8?B?ZDNRQlFGUE1lZm5PSmU4MnR2S2RxS3FtdjNmM3N2Mk9VTml3ZnlnMDJZZ2hI?=
 =?utf-8?B?R0FUNG9YZ0lIMHJJalhVTzJadHVBbnFFbWpvN0Q4S0J5QjFHRThsbjBtMEUw?=
 =?utf-8?B?QTVYaGpLbGR6VUkvSG1UZ0FvdmJoYlE4bTdzcmJVbGJBSVVCNEt3bFFXN2xC?=
 =?utf-8?B?Y0dSbE1EN3VmMXdOMHcyNCtLeGl2MGVZTEl1OE1vSEVlcDVDdU0xYWp4SnB5?=
 =?utf-8?B?emhnaWl3bG9UeHE3RFlaWTdRaXo3VVQ2SXRoS2t4b1ZWa2tlVGNIeU1UMnZ1?=
 =?utf-8?B?SG1qZS94Ri9HOU04WGJQb3BWK2hhR2JwRW1uZ3BkYi9hS2RJTE80QTNwRDZ5?=
 =?utf-8?B?L21xeis2aVhSVHFXTVc4N2Z3Tnc5Rzh3a1FqUTkzbGc5WXkwd1pzZkowa3ZR?=
 =?utf-8?B?N1FLU01OSk9rNEtQQXVvbkhKTWpHVzF6RlY4OWFWajByMTg0Q3VVUzlhNlE2?=
 =?utf-8?Q?4dkkcLtLtXH4X27PysBUpRqDN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1184f8a4-23b1-4bb1-074a-08daefbb9146
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 07:56:50.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sLSIJxn6efdQWTCApkn9G0rXtAqqn5qqGTTB/f1ZyKZmC6vJm6XnDPYIOWw8jRNDKLEg8cf3HDZ02gjou3exg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9127

On 05.01.2023 23:28, Andrew Cooper wrote:
> On 05/01/2023 8:15 am, Jan Beulich wrote:
>> On 04.01.2023 19:34, Andrew Cooper wrote:
>>> On 04/01/2023 5:04 pm, Jan Beulich wrote:
>>>> On 03.01.2023 21:09, Andrew Cooper wrote:
>>>>> +    if ( sz > INT32_MAX )
>>>>> +        return -E2BIG; /* Compat guests.  2G ought to be plenty. */
>>>> While the comment here and in the public header mention compat guests,
>>>> the check is uniform. What's the deal?
>>> Well its either this, or a (comat ? INT32_MAX : INT64_MAX) check, along
>>> with the ifdefary and predicates required to make that compile.
>>>
>>> But there's not a CPU today which can actually move 2G of data (which is
>>> 4G of L1d bandwidth) without suffering the watchdog (especially as we've
>>> just read it once for strlen(), so that's 6G of bandwidth), nor do I
>>> expect this to change in the forseeable future.
>>>
>>> There's some boundary (probably far lower) beyond which we can't use the
>>> algorithm here.
>>>
>>> There wants to be some limit, and I don't feel it is necessary to make
>>> it variable on the guest type.
>> Sure. My question was merely because of the special mentioning of 32-bit /
>> compat guests. I'm fine with the universal limit, and I'd also be fine
>> with a lower (universal) bound. All I'm after is that the (to me at least)
>> confusing comments be adjusted.
> 
> How about 16k then?

Might be okay. If I was to pick a value, I'd use 64k.

Jan

