Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CA669A79A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 09:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496948.767873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSwYy-0006qN-GA; Fri, 17 Feb 2023 08:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496948.767873; Fri, 17 Feb 2023 08:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSwYy-0006oU-DL; Fri, 17 Feb 2023 08:57:52 +0000
Received: by outflank-mailman (input) for mailman id 496948;
 Fri, 17 Feb 2023 08:57:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSwYw-0006o5-Ox
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 08:57:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26dbabc0-aea1-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 09:57:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9556.eurprd04.prod.outlook.com (2603:10a6:10:304::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Fri, 17 Feb
 2023 08:57:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 08:57:46 +0000
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
X-Inumbo-ID: 26dbabc0-aea1-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuDX9lBAIrtbnsa58RQ83HJH8C6R69hPRi3wpcVxhfMOdHjgKPoQY8pTdGkssTxYEUZU/cLdF5bbFNHlNOSqK0Q5WtTH7P8X2zN+KfiBSaMnBMjrr6NeUE9IuMN1DrARVXDh8VK8Bf0Sa2MmoLT6lrqsn3OaX9WMjJJ7+fd2G5wO21fHA5A9dJtiPRkJxk3Q0VBBzjkBPiuqjTuIb7ftUzGJHqa7/szhSdR7/xGGuHdCy7NU1M1c4BDCzj22snUEMPQZ32025zQ5OBio+2KmfW7oEdWuMDzs1ohPgB50j5fBEAUzk3jkq1OEDUG2HCXcEFbIgdWfvt9hVOdGfDPV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwoR/UPX9x/FK3UXbiXBuRvvhf393KNzvKkZK4rY6yw=;
 b=E1mT5tSlFlSNZsGgwjKLxn2bGhw6aLPmu/4ew6scQ56WGLeX1hmi7WHg8AmutUF4upPL9bssXnIiKtPwJ12FU4LfFXI2/epksNGOQDjl5Yh9Hru5xA5Q9nLBIpS+QPxip1UJbbYvGHR9XyrRRNtUmmmr6PrT55md06JcGlv16WpHqrENnspUfRKgIf9CMfJFwahrMYA934AcUI7MazRJd6K4SgERSzrrUMy0w8+0+9e9vQxix18kszuut9JXYtf3Vs56gorwKqkEQ0PDj90SVBj+w58U21HJexZLQ4wrutT4eOSntCvIZT0/FP4VtLh8BqTuWi1oeJghyn0UcVXkOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwoR/UPX9x/FK3UXbiXBuRvvhf393KNzvKkZK4rY6yw=;
 b=ba/Iqr6mjMJ5eVwCHcj4VYY5hXEdgubtpNE9m83+6V2PNRnBdp5wx3W9RhfHADusQzyrLmg617S+ohzMI904fJYhYEy7xbdJs9Shhl3rMos5eQLu2ofas5/F1aEbdTD4TvkMZxOZcgAM1rRiioARYYGvi3vWfrLMKj8YLrc3tcz5LdZaoyRyrqtWqYLSfeI/X4YCwxzVbDrgjdKeohJ0lvTx4a38w388nS+VBrScG2BasihxMgQ3PT5GFtCxwBOTJbrHh8IopFwV0VoHxI3QEGwzqkNkHELzoZUibM9e4b35kNAS+gjgguUM7JO0aPT+OlD3pKM0rXLP4oWT48Ko9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e79d20d-0922-565a-e46d-e3366c0bcfb4@suse.com>
Date: Fri, 17 Feb 2023 09:57:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
 <3aa736d3-b833-0c6c-2a41-71cc4b953aae@suse.com>
 <20230217085006.GA2281468@horizon>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230217085006.GA2281468@horizon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9556:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd3b942-cc38-436e-f7b1-08db10c509c4
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U8uuXyceVSfdS/09h5Vx166Qas8KPPqYZO474x7twbGT7s6TTfXjoMb0NDDVNx5nMVru7UuHvZvNFxwssiIqELY2SU6f2svH67X174xvbdZH5/0yf2aE2CfTVxc3zceLBkC6O/C12iWY53qwVtXRs4gHQRPKHFtcrs/Bd6fruzz/T+tz9IVFTOFd/kmGow3EwQ1/Esp9T9CGSOi1fRYOtWqk91poFp1Jyu3IUgouZBqkj8lEgxs7CLnh/tY4SZ6/ve0eiq9VDErhEZI1OH+4/ydomKYVnalbpipu0cUUOxZNN8VwunyFfwBotZJsY/sPl54ASgAW0qfD5A31pizcFakNeBsOSVV6FItC0ub4KG+dOVAlFefFTfk3Ga8yHUjGNG+fZx1M1Lc4Rch/gPGJlyYiEkz1mEan4okjWC9fFWBYs399lKqLKSpKBkhdSIDBollNLmREY8UOQYznSvTYtO9mCop2mW5tERd5oGHHITH4lcFkrB4PyTOOBd25qcg7mhWmBkpFlYiYCDDKlcGGATeyXTgZB1CRKdiFTXErEzuoMItOXFH2qIbZjo7YBOXDbOHChK1jYIZkcwdfY6dp3fuQlObn6IT2DDXHTY0nVDn0xhLp8VHdwRkIx0z56UGFA5koSIPqH9o1Ij41sMUb2rF6ooMXokIITNqOb0/pq/iLWPTrkkVEPAhDSvzOgY30r3MP5exXwwkuvNBJCOtnoLVRqE+lg4840BiKQfR4K9Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199018)(31686004)(6916009)(66556008)(86362001)(54906003)(6486002)(31696002)(41300700001)(5660300002)(66946007)(8936002)(66476007)(8676002)(36756003)(6506007)(2906002)(6512007)(316002)(26005)(53546011)(186003)(478600001)(4326008)(6666004)(2616005)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkpqS0ExSFV3RjBMa2VMVEkzUDRhUTIwYW12dCtFb05ZNnA5a3g4ZzVtb0NQ?=
 =?utf-8?B?T1VEeDJoSHJSUStmY01kWnVNSjFYYXZtRkY2UkxReTB1L0xZOWNOb0dJSVJW?=
 =?utf-8?B?b2dEQWVkRVdrcGVnUGo5NDhUN00xcUwyVU80TVdDdmMwZFRQc0kwQ3BzNXll?=
 =?utf-8?B?eTBQMXV6ck5NV2NXSXFpY2NNc0tSN0hkbWNqL3hpVGR1TWJkeGVLcHVQN1dw?=
 =?utf-8?B?ZHNHQXBNRGVrZHFNVk1HMXZmcUhrVlgyU1VFNzkzd2dmSkY1ZXh2R0hkN2lz?=
 =?utf-8?B?Wjduc0xPa2ZYcndqWUpuVDA1MHhIc1lQK3g0MDd5alh5YUFRSU43czhlRURm?=
 =?utf-8?B?NmVhWG9odzhjV3RvYlZUZU1qdWZwL2NZSkpsRUsybWxHV1Z3ZEpXN0lGa21X?=
 =?utf-8?B?anNjY2hwZ3BGOXN5NGpMY2x2eEh4UWtVKzVqQXU3akcyNXBFVW52MjU0SlEw?=
 =?utf-8?B?RVpSK0F0ZUczZUdyQU5qeEE3UnlvSEk4NTk2cEV5aE80cjVxcUxSZnhYckVz?=
 =?utf-8?B?N0FZQ2ZuNGg2N3QwWXc3cFp3TkczMzhMK3BuSGFrR25WSlJzcWEvQ3haQWJv?=
 =?utf-8?B?akZhNkpxdklabjU5UkN0UmRTRTZvTG1Fam8xZnpyN3puSjYveWwzdTBnUU9o?=
 =?utf-8?B?cHBaMVlSdlJjZ1ZIUEthMnBURDgrM21UQmUzOGJ4dmk0WHc0cWl3a2hOWHF1?=
 =?utf-8?B?MGNlYzZSUUtXMGhmblhpbHVVVFpibGJBMitUQnBMQWJhKzBkT3pjOG9XdXdm?=
 =?utf-8?B?YVJ4aXJuSFVId0R4bm5MYWl5TEE2MTZhNThwYjBkaDcwZ21qWXV5enpTOVgw?=
 =?utf-8?B?L3d2d3pSeUpoZjlneHFnYzRURDcrVUxhTUxnSVJCRjdBMEM2RksrMDgyU21o?=
 =?utf-8?B?NVhZRXJOeGM1SEtqQlU3T1RvblJFWTBxZElTcHlkL3NtcDRDSG45dU1XOGRq?=
 =?utf-8?B?M3VsQ1JUV1QrSHFmSDJKcVg2bDI1TExZQUk3dXNnYjBBUzNXclZSV2xNTCsy?=
 =?utf-8?B?bHJqdzE2eGRZSHFsU2xQVzdBNkhLbFBGRTJiL0tUc014dSt0a21rWWcweTdh?=
 =?utf-8?B?N0luaFdSbXI0bXphTFczWmhXRUFoTGxadUh5L0E4R2FzYXR1RkhacWEwaHZO?=
 =?utf-8?B?K2Q2NFhQT0JXSDdqVEtiM2RvbEhWZ2FiY0lpeklqeitQaVprbEJ2OUtSMndN?=
 =?utf-8?B?SFArUDQrWlo4ZGxLM3VqZlNndU1iSmtOUldRZ3RscHRGMFJrUVhEa21IMGFF?=
 =?utf-8?B?ZUl5YWpkOVJDVWl5MHNGU3lvSGdHTHc2V0d4YktmZTlyMGJ0NCtxNHhyWm10?=
 =?utf-8?B?VlhVTlBCN1FEY1ZIWTN4MjFRa2tjOSs1SVJRRGNnNHkraXpPd1EwdGdqMGdm?=
 =?utf-8?B?VGR5em1YRzNKRDFZZFFCdjFGZlA1UFVtZG5vZS9XOG1CbllJczZCSTFvU2Jq?=
 =?utf-8?B?UjdUSHB1RHVvVitON2RoZU5aQi82VVpqV1Y2WWJGUEd5Z2UvOHp2d2FyVDMy?=
 =?utf-8?B?d1JmcERjNGFKVjN0QjNiWFJjOTJvL1huWXBJcCs1MFk4RWZsU2xaTFhOM0JP?=
 =?utf-8?B?eGM3eWlBRW0zOWQ5R2R2SWdPTnV4ZE1UQWJrdmRhZ0dsdnBvN1RneFVtN3h1?=
 =?utf-8?B?MzBhYXJrZjdSY3djYTRPbDhRUlZLOWgybTlCZ1ROTG1VSmd1NStkbk43TWhU?=
 =?utf-8?B?Sm1uWWx1VHNwV0ZyVW0vZk1vODMrUUFCSk5UTTBaK0ZPUW9jRWNFZldiK1Ey?=
 =?utf-8?B?NlBHa0thcm13b1J0SXY0bTVxRUdaZTNkSnFMTDBBdnp2dkM1NzhrOEh1b1VB?=
 =?utf-8?B?cnF5dlJBanl5ZWlGcjFOQllwOGoxTUtJYjFoSnU1a3d2WDR5bXJ4ZnFTaFdh?=
 =?utf-8?B?QXNtWW5Ia1RkbjlzMWhhYXhXdjFEQ2FSWmx0L2ZLZVJlQzByOSs0V1FhSmF1?=
 =?utf-8?B?VkN1aVVhdTZVOFY0cnRjNmlzN0loNFgxN25EaDFYck95QXF3SFlvRVd3eXJJ?=
 =?utf-8?B?RHVvdXN0eG1LcGJxWFg3NitzRlNKaHp3QmJmZHY4M1BiUnZ1dGJSZEZ0RnN4?=
 =?utf-8?B?U3VwZlhlMzh5bUplN3RIN2drSWR0ZkptdnBRRmo3ZGhIOXhaOUVkdzBnd2Ev?=
 =?utf-8?Q?HgzKVR4D+qAqan/FkpgkKB/ct?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd3b942-cc38-436e-f7b1-08db10c509c4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 08:57:46.2812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeS34tWMUhg20jOjI049pPC8QdBnJspFoB618VJjgy0cNh/RAr+GWA9OTxfIrO6ipX5Ugj9UOUmUE/eChxCONw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9556

On 17.02.2023 09:50, Matias Ezequiel Vara Larsen wrote:
> On Wed, Dec 14, 2022 at 08:56:57AM +0100, Jan Beulich wrote:
>> On 14.12.2022 08:29, Jan Beulich wrote:
>>> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
>>>> +static int stats_vcpu_alloc_mfn(struct domain *d)
>>>> +{
>>>> +    struct page_info *pg;
>>>> +
>>>> +    pg = alloc_domheap_page(d, MEMF_no_refcount);
>>>
>>> The ioreq and vmtrace resources are also allocated this way, but they're
>>> HVM-specific. The one here being supposed to be VM-type independent, I'm
>>> afraid such pages will be accessible by an "owning" PV domain (it'll
>>> need to guess the MFN, but that's no excuse).
>>
>> Which might be tolerable if it then can't write to the page. That would
>> require "locking" the page r/o (from guest pov), which ought to be
>> possible by leveraging a variant of what share_xen_page_with_guest()
>> does: It marks pages PGT_none with a single type ref. This would mean
>> ...
>>
>>>> +    if ( !pg )
>>>> +        return -ENOMEM;
>>>> +
>>>> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
>>
>> ... using PGT_none here. Afaict this _should_ work, but we have no
>> precedent of doing so in the tree, and I may be overlooking something
>> which prevents that from working.
>>
> 
> I do not fully understand this. I checked share_xen_page_with_guest() and I
> think you're talking about doing something like this for each allocated page to
> set them ro from a pv guest pov:
> 
> pg->u.inuse.type_info = PGT_none;
> pg->u.inuse.type_info |= PGT_validated | 1;
> page_set_owner(page, d); // not sure if this is needed
> 
> Then, I should use PGT_none instead of PGT_writable_page in
> get_page_and_type(). Am I right?

No, if at all possible you should avoid open-coding anything. As said,
simply passing PGT_none to get_page_and_type() ought to work (again, as
said, unless I'm overlooking something). share_xen_page_with_guest()
can do what it does because the page isn't owned yet. For a page with
owner you may not fiddle with type_info in such an open-coded manner.

Jan

