Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A73102DD1B5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 13:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55914.97525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpsk9-0003mM-Ja; Thu, 17 Dec 2020 12:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55914.97525; Thu, 17 Dec 2020 12:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpsk9-0003lz-GJ; Thu, 17 Dec 2020 12:50:53 +0000
Received: by outflank-mailman (input) for mailman id 55914;
 Thu, 17 Dec 2020 12:50:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=852C=FV=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1kpsk8-0003lu-9a
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 12:50:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.109]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10e7a55d-be59-482f-a101-00d372d363be;
 Thu, 17 Dec 2020 12:50:49 +0000 (UTC)
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6152.eurprd08.prod.outlook.com (2603:10a6:20b:298::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.26; Thu, 17 Dec
 2020 12:50:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 12:50:48 +0000
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR02CA0107.eurprd02.prod.outlook.com (2603:10a6:208:154::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 17 Dec 2020 12:50:47 +0000
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
X-Inumbo-ID: 10e7a55d-be59-482f-a101-00d372d363be
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIiCdlhBsNn+vZ5AYmKITysRiryLC14M/1jjaHM38ME4SZvCcaAA2+1aQLFw61UHQJfhECreyx42turaDz7X2MRcXEheq3SInpyC/qyAHChX4Z7c4zmcIeB2lLoGNRGmyeMzsfFprXQx3Bkw/ZCKFP4JB1F4w6/EvnDcV4aV+TrNg0tZfLw8YoxjEdaZsU4X+xuzY8LdB8h3DEJAGHIqAugGgycNnXZJRsYnsGXvwyg/S26ivf3OHCR6+hmfh2dU9D3OqrNGiZ29XcYTCFNml+MpTcj8ivNESIBl+i3VDx7RK7/aMU4kurH50s7EF8lshl0mwgZzJLClg4RV76U3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8g828gnbvP1DL+ouvCbDDCfpOXOeIAKu/9EbpQKk5aY=;
 b=kvbgSbGDoAA8rAQblGI5L3YKAIZwApmzwUmdfcdc+qo8bm6OVzQdprmT2lNXEcWHfZrVb3tZvG10LlO+kDCXhv19s1xpLosy7MiKU5jV2YbFH5BDEA+w+6AzKba5/5+BpthG2K+RFvoEwJe/JxpxfKV/lBqtv2pc0Ut0YvgLRJTJ/Ir5FBr0GQVqwqcuavYAVqK0kK/xV54BXNVOWuzs2GPZLbR34tfQDH6gKBCSpCjdYICoHUe3Fzrt+VOSZbXoCvo6acTmGt0863xl4No9YHWzrJvOhNxdakx5vn0UVajsQtSfNs9YtlLFgRbGndSZZrwDzjABAyWUgxRLsj5NqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8g828gnbvP1DL+ouvCbDDCfpOXOeIAKu/9EbpQKk5aY=;
 b=K3KarMMgNXKJV3SUCBvPRD3tt1AJjdTtcWXVB/17ldb+ZZ3lPHpJRRlw9k4j8yuEVgawCBmbJ21zk4zTssuPimevfKR5ogoxK2dE6trOwqxJfurephNBwV+1BhWym/v2mvAdvSdy0LmunnUknXZ9ZxJqt7MsvfgUWvAq65/K+9c=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=virtuozzo.com;
Subject: Re: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
To: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-3-slp@redhat.com>
 <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
 <20201215172337.w7vcn2woze2ejgco@mhamilton>
 <20201216123514.GD7548@merkur.fritz.box>
 <20201216145502.yiejsw47q5pfbzio@mhamilton>
 <20201216183102.GH7548@merkur.fritz.box>
 <20201217093744.tg6ik73o45nidcs4@mhamilton>
 <20201217105830.GA12328@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d7c1ee7f-4171-1407-3a71-a7e45708cc4a@virtuozzo.com>
Date: Thu, 17 Dec 2020 15:50:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201217105830.GA12328@merkur.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR02CA0107.eurprd02.prod.outlook.com
 (2603:10a6:208:154::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1ccdb98-6293-4112-c685-08d8a28a608f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6152:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB615264F26C176D9EB1BC82EDC1C40@AS8PR08MB6152.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	maSiBUjHN9+MXbTXT+/8FxSs48oIErhGbQdKJxoM66LdaVJtVLgaiyyWke5vajHlCwAm9n16g4MWslx+6i3aOzHTVzMEXk+TVtbHQ2rh6ZcOIzi1i+OGhpKTLsnsJBCRtmGdZTqDh0mSJCA94XlKY6DF6+xvNaVdyAFmYqPP13InL/unooNAIAiDV5oKGb6VQg6RrtlLW/5YhfFslGDuZ32o1EY4KO0zK4QXzF8wNLFWzXIkBUBx6Armra3wKzhGmF2xRMVB+GTrpDGaljDC3ZkeluS/r0QGxogjsImYhq2v96i/gZTXrUYA7S6nTyEbsgElMJZHbdV6m7dCIbImd+s/luO7uNdsvjNRKck3iwjyGaQAXvoFjuMteRnZAFuaw+qYQmv6ClF5ikqVhEIhSX8nqnaN0goW6ZZu30MEJA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5494.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(366004)(136003)(396003)(376002)(346002)(8936002)(186003)(26005)(31686004)(66946007)(86362001)(36756003)(52116002)(66556008)(83380400001)(66476007)(110136005)(8676002)(7416002)(54906003)(478600001)(6486002)(956004)(16526019)(30864003)(2616005)(5660300002)(31696002)(2906002)(316002)(16576012)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	=?Windows-1252?Q?elqVAOEva7sdNeiNpUP3H20KyWA3kSg2UhigopzkXzuWuSnvJtu4ahtK?=
 =?Windows-1252?Q?6uioe1XSIHEHzR4D9R0paq0NCxfYKI8u9u3qxmiFAUkCd3IRVzw/ckXt?=
 =?Windows-1252?Q?vF+D5UKFGcp193RRQe12Ve1vOY+XSeBzbyodwLALP2HYpLc3abew37vp?=
 =?Windows-1252?Q?jHpC0ZfU6tIFDKxfFVcG21U7ST2XavOT7ZU9GQ2bwtVfhgL9Q5NcbJRO?=
 =?Windows-1252?Q?0jhznpwxmQuTpVFVX/pdzCZv+72W/PoYm7WyAEHaDUHogpHHGWvEUZqn?=
 =?Windows-1252?Q?kZzV8gKHdEOeftT8V1Vpzm6OQRSnIUOKf4vkIWzBtBNlQ9WUdKtynLEJ?=
 =?Windows-1252?Q?mLpuBvJyuhBZKCaJCxvWdqyot5yOBfe4f7JVb704GR0uhBrY9A97CeC5?=
 =?Windows-1252?Q?j13GTLSRY/Ym9BmQ/k7JZUKZIwwckskNirdMKd2FC1Y/GReHcLZpS70B?=
 =?Windows-1252?Q?qxgQQuAnPf0osGeZXkHm+AvbbIGWbCLVTWUgvvvz43DAgIi2+npKeO+O?=
 =?Windows-1252?Q?Oz18l/bx+q5UjjlHE5rguDqXUHbTzcxY6lddr6w42mdjWRXQtICqThp2?=
 =?Windows-1252?Q?L6hqXrd7/EdRWjKtS3C0Ev6umGAlzQMBZcNWNr42Bsv6dkqfcd7v169f?=
 =?Windows-1252?Q?CTmlWnmpyXozmjlWq/LrNkUTKnIwHjYJzznpidfxmRGLdio5IhsGndhY?=
 =?Windows-1252?Q?K06pNw2hC1qJJWFPPKSYBPqgFkUgiAoLRTZ1xJARKXgCa076vQFR48WB?=
 =?Windows-1252?Q?HzKmKLKYbleUYJN4Rm+gTQMDF/S45H1EkeV0mN4qateMRnOA4YXzjiV6?=
 =?Windows-1252?Q?yz2nK1TZdv8pbpP9VddOPx7pAOwmHuVOb1B2YYpw5eugGbo9po8Ni7cA?=
 =?Windows-1252?Q?2L+gNMxHYiS2dZfaGjIPwcYfDDNtbajah+vz8ToZgI7q8xSCbngh4swj?=
 =?Windows-1252?Q?vzST60pqBDu7zmC5NQ1uLhs+1782l+yOy0MMors1ZkqX7JC8Tg6RjZo9?=
 =?Windows-1252?Q?n8qM/CncjBlS+GRuvYIeXv74+eYkw2hSwaV7Wd4B6mvcokUdt2pqYjCN?=
 =?Windows-1252?Q?YXYr2X03AHT6Qeu4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 12:50:48.0952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ccdb98-6293-4112-c685-08d8a28a608f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGIaMMHKCg55quve8Q4tFYhw5cguUPaG8UPiu+qrJ9gTCxPyiDriPH55Ce7c0u5egMys/EABMJlox47tX9xUuogLNexRdlRfI8dECHSwgfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6152

17.12.2020 13:58, Kevin Wolf wrote:
> Am 17.12.2020 um 10:37 hat Sergio Lopez geschrieben:
>> On Wed, Dec 16, 2020 at 07:31:02PM +0100, Kevin Wolf wrote:
>>> Am 16.12.2020 um 15:55 hat Sergio Lopez geschrieben:
>>>> On Wed, Dec 16, 2020 at 01:35:14PM +0100, Kevin Wolf wrote:
>>>>> Am 15.12.2020 um 18:23 hat Sergio Lopez geschrieben:
>>>>>> On Tue, Dec 15, 2020 at 04:01:19PM +0100, Kevin Wolf wrote:
>>>>>>> Am 15.12.2020 um 14:15 hat Sergio Lopez geschrieben:
>>>>>>>> On Tue, Dec 15, 2020 at 01:12:33PM +0100, Kevin Wolf wrote:
>>>>>>>>> Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
>>>>>>>>>> While processing the parents of a BDS, one of the parents may process
>>>>>>>>>> the child that's doing the tail recursion, which leads to a BDS being
>>>>>>>>>> processed twice. This is especially problematic for the aio_notifiers,
>>>>>>>>>> as they might attempt to work on both the old and the new AIO
>>>>>>>>>> contexts.
>>>>>>>>>>
>>>>>>>>>> To avoid this, add the BDS pointer to the ignore list, and check the
>>>>>>>>>> child BDS pointer while iterating over the children.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>>>>>>>>>
>>>>>>>>> Ugh, so we get a mixed list of BdrvChild and BlockDriverState? :-/
>>>>>>>>
>>>>>>>> I know, it's effective but quite ugly...
>>>>>>>>
>>>>>>>>> What is the specific scenario where you saw this breaking? Did you have
>>>>>>>>> multiple BdrvChild connections between two nodes so that we would go to
>>>>>>>>> the parent node through one and then come back to the child node through
>>>>>>>>> the other?
>>>>>>>>
>>>>>>>> I don't think this is a corner case. If the graph is walked top->down,
>>>>>>>> there's no problem since children are added to the ignore list before
>>>>>>>> getting processed, and siblings don't process each other. But, if the
>>>>>>>> graph is walked bottom->up, a BDS will start processing its parents
>>>>>>>> without adding itself to the ignore list, so there's nothing
>>>>>>>> preventing them from processing it again.
>>>>>>>
>>>>>>> I don't understand. child is added to ignore before calling the parent
>>>>>>> callback on it, so how can we come back through the same BdrvChild?
>>>>>>>
>>>>>>>      QLIST_FOREACH(child, &bs->parents, next_parent) {
>>>>>>>          if (g_slist_find(*ignore, child)) {
>>>>>>>              continue;
>>>>>>>          }
>>>>>>>          assert(child->klass->set_aio_ctx);
>>>>>>>          *ignore = g_slist_prepend(*ignore, child);
>>>>>>>          child->klass->set_aio_ctx(child, new_context, ignore);
>>>>>>>      }
>>>>>>
>>>>>> Perhaps I'm missing something, but the way I understand it, that loop
>>>>>> is adding the BdrvChild pointer of each of its parents, but not the
>>>>>> BdrvChild pointer of the BDS that was passed as an argument to
>>>>>> b_s_a_c_i.
>>>>>
>>>>> Generally, the caller has already done that.
>>>>>
>>>>> In the theoretical case that it was the outermost call in the recursion
>>>>> and it hasn't (I couldn't find any such case), I think we should still
>>>>> call the callback for the passed BdrvChild like we currently do.
>>>>>
>>>>>>> You didn't dump the BdrvChild here. I think that would add some
>>>>>>> information on why we re-entered 0x555ee2fbf660. Maybe you can also add
>>>>>>> bs->drv->format_name for each node to make the scenario less abstract?
>>>>>>
>>>>>> I've generated another trace with more data:
>>>>>>
>>>>>> bs=0x565505e48030 (backup-top) enter
>>>>>> bs=0x565505e48030 (backup-top) processing children
>>>>>> bs=0x565505e48030 (backup-top) calling bsaci child=0x565505e42090 (child->bs=0x565505e5d420)
>>>>>> bs=0x565505e5d420 (qcow2) enter
>>>>>> bs=0x565505e5d420 (qcow2) processing children
>>>>>> bs=0x565505e5d420 (qcow2) calling bsaci child=0x565505e41ea0 (child->bs=0x565505e52060)
>>>>>> bs=0x565505e52060 (file) enter
>>>>>> bs=0x565505e52060 (file) processing children
>>>>>> bs=0x565505e52060 (file) processing parents
>>>>>> bs=0x565505e52060 (file) processing itself
>>>>>> bs=0x565505e5d420 (qcow2) processing parents
>>>>>> bs=0x565505e5d420 (qcow2) calling set_aio_ctx child=0x5655066a34d0
>>>>>> bs=0x565505fbf660 (qcow2) enter
>>>>>> bs=0x565505fbf660 (qcow2) processing children
>>>>>> bs=0x565505fbf660 (qcow2) calling bsaci child=0x565505e41d20 (child->bs=0x565506bc0c00)
>>>>>> bs=0x565506bc0c00 (file) enter
>>>>>> bs=0x565506bc0c00 (file) processing children
>>>>>> bs=0x565506bc0c00 (file) processing parents
>>>>>> bs=0x565506bc0c00 (file) processing itself
>>>>>> bs=0x565505fbf660 (qcow2) processing parents
>>>>>> bs=0x565505fbf660 (qcow2) calling set_aio_ctx child=0x565505fc7aa0
>>>>>> bs=0x565505fbf660 (qcow2) calling set_aio_ctx child=0x5655068b8510
>>>>>> bs=0x565505e48030 (backup-top) enter
>>>>>> bs=0x565505e48030 (backup-top) processing children
>>>>>> bs=0x565505e48030 (backup-top) calling bsaci child=0x565505e3c450 (child->bs=0x565505fbf660)
>>>>>> bs=0x565505fbf660 (qcow2) enter
>>>>>> bs=0x565505fbf660 (qcow2) processing children
>>>>>> bs=0x565505fbf660 (qcow2) processing parents
>>>>>> bs=0x565505fbf660 (qcow2) processing itself
>>>>>> bs=0x565505e48030 (backup-top) processing parents
>>>>>> bs=0x565505e48030 (backup-top) calling set_aio_ctx child=0x565505e402d0
>>>>>> bs=0x565505e48030 (backup-top) processing itself
>>>>>> bs=0x565505fbf660 (qcow2) processing itself
>>>>>
>>>>> Hm, is this complete? Is see no "processing itself" for
>>>>> bs=0x565505e5d420. Or is this because it crashed before getting there?
>>>>
>>>> Yes, it crashes there. I forgot to mention that, sorry.
>>>>
>>>>> Anyway, trying to reconstruct the block graph with BdrvChild pointers
>>>>> annotated at the edges:
>>>>>
>>>>> BlockBackend
>>>>>        |
>>>>>        v
>>>>>    backup-top ------------------------+
>>>>>        |   |                          |
>>>>>        |   +-----------------------+  |
>>>>>        |            0x5655068b8510 |  | 0x565505e3c450
>>>>>        |                           |  |
>>>>>        | 0x565505e42090            |  |
>>>>>        v                           |  |
>>>>>      qcow2 ---------------------+  |  |
>>>>>        |                        |  |  |
>>>>>        | 0x565505e52060         |  |  | ??? [1]
>>>>>        |                        |  |  |  |
>>>>>        v         0x5655066a34d0 |  |  |  | 0x565505fc7aa0
>>>>>      file                       v  v  v  v
>>>>>                               qcow2 (backing)
>>>>>                                      |
>>>>>                                      | 0x565505e41d20
>>>>>                                      v
>>>>>                                    file
>>>>>
>>>>> [1] This seems to be a BdrvChild with a non-BDS parent. Probably a
>>>>>      BdrvChild directly owned by the backup job.
>>>>>
>>>>>> So it seems this is happening:
>>>>>>
>>>>>> backup-top (5e48030) <---------| (5)
>>>>>>     |    |                      |
>>>>>>     |    | (6) ------------> qcow2 (5fbf660)
>>>>>>     |                           ^    |
>>>>>>     |                       (3) |    | (4)
>>>>>>     |-> (1) qcow2 (5e5d420) -----    |-> file (6bc0c00)
>>>>>>     |
>>>>>>     |-> (2) file (5e52060)
>>>>>>
>>>>>> backup-top (5e48030), the BDS that was passed as argument in the first
>>>>>> bdrv_set_aio_context_ignore() call, is re-entered when qcow2 (5fbf660)
>>>>>> is processing its parents, and the latter is also re-entered when the
>>>>>> first one starts processing its children again.
>>>>>
>>>>> Yes, but look at the BdrvChild pointers, it is through different edges
>>>>> that we come back to the same node. No BdrvChild is used twice.
>>>>>
>>>>> If backup-top had added all of its children to the ignore list before
>>>>> calling into the overlay qcow2, the backing qcow2 wouldn't eventually
>>>>> have called back into backup-top.
>>>>
>>>> I've tested a patch that first adds every child to the ignore list,
>>>> and then processes those that weren't there before, as you suggested
>>>> on a previous email. With that, the offending qcow2 is not re-entered,
>>>> so we avoid the crash, but backup-top is still entered twice:
>>>
>>> I think we also need to every parent to the ignore list before calling
>>> callbacks, though it doesn't look like this is the problem you're
>>> currently seeing.
>>
>> I agree.
>>
>>>> bs=0x560db0e3b030 (backup-top) enter
>>>> bs=0x560db0e3b030 (backup-top) processing children
>>>> bs=0x560db0e3b030 (backup-top) calling bsaci child=0x560db0e2f450 (child->bs=0x560db0fb2660)
>>>> bs=0x560db0fb2660 (qcow2) enter
>>>> bs=0x560db0fb2660 (qcow2) processing children
>>>> bs=0x560db0fb2660 (qcow2) calling bsaci child=0x560db0e34d20 (child->bs=0x560db1bb3c00)
>>>> bs=0x560db1bb3c00 (file) enter
>>>> bs=0x560db1bb3c00 (file) processing children
>>>> bs=0x560db1bb3c00 (file) processing parents
>>>> bs=0x560db1bb3c00 (file) processing itself
>>>> bs=0x560db0fb2660 (qcow2) calling bsaci child=0x560db16964d0 (child->bs=0x560db0e50420)
>>>> bs=0x560db0e50420 (qcow2) enter
>>>> bs=0x560db0e50420 (qcow2) processing children
>>>> bs=0x560db0e50420 (qcow2) calling bsaci child=0x560db0e34ea0 (child->bs=0x560db0e45060)
>>>> bs=0x560db0e45060 (file) enter
>>>> bs=0x560db0e45060 (file) processing children
>>>> bs=0x560db0e45060 (file) processing parents
>>>> bs=0x560db0e45060 (file) processing itself
>>>> bs=0x560db0e50420 (qcow2) processing parents
>>>> bs=0x560db0e50420 (qcow2) processing itself
>>>> bs=0x560db0fb2660 (qcow2) processing parents
>>>> bs=0x560db0fb2660 (qcow2) calling set_aio_ctx child=0x560db1672860
>>>> bs=0x560db0fb2660 (qcow2) calling set_aio_ctx child=0x560db1b14a20
>>>> bs=0x560db0e3b030 (backup-top) enter
>>>> bs=0x560db0e3b030 (backup-top) processing children
>>>> bs=0x560db0e3b030 (backup-top) processing parents
>>>> bs=0x560db0e3b030 (backup-top) calling set_aio_ctx child=0x560db0e332d0
>>>> bs=0x560db0e3b030 (backup-top) processing itself
>>>> bs=0x560db0fb2660 (qcow2) processing itself
>>>> bs=0x560db0e3b030 (backup-top) calling bsaci child=0x560db0e35090 (child->bs=0x560db0e50420)
>>>> bs=0x560db0e50420 (qcow2) enter
>>>> bs=0x560db0e3b030 (backup-top) processing parents
>>>> bs=0x560db0e3b030 (backup-top) processing itself
>>>>
>>>> I see that "blk_do_set_aio_context()" passes "blk->root" to
>>>> "bdrv_child_try_set_aio_context()" so it's already in the ignore list,
>>>> so I'm not sure what's happening here. Is backup-top is referenced
>>>> from two different BdrvChild or is "blk->root" not pointing to
>>>> backup-top's BDS?
>>>
>>> The second time that backup-top is entered, it is not as the BDS of
>>> blk->root, but as the parent node of the overlay qcow2. Which is
>>> interesting, because last time it was still the backing qcow2, so the
>>> change did have _some_ effect.
>>>
>>> The part that I don't understand is why you still get the line with
>>> child=0x560db1b14a20, because when you add all children to the ignore
>>> list first, that should have been put into the ignore list as one of the
>>> first things in the whole process (when backup-top was first entered).
>>>
>>> Is 0x560db1b14a20 a BdrvChild that has backup-top as its opaque value,
>>> but isn't actually present in backup-top's bs->children?
>>
>> Exactly, that line corresponds to this chunk of code:
>>
>> <---- begin ---->
>>      QLIST_FOREACH(child, &bs->parents, next_parent) {
>>          if (g_slist_find(*ignore, child)) {
>>              continue;
>>          }
>>          assert(child->klass->set_aio_ctx);
>>          *ignore = g_slist_prepend(*ignore, child);
>>          fprintf(stderr, "bs=%p (%s) calling set_aio_ctx child=%p\n", bs, bs->drv->format_name, child);
>>          child->klass->set_aio_ctx(child, new_context, ignore);
>>      }
>> <---- end ---->
>>
>> Do you think it's safe to re-enter backup-top, or should we look for a
>> way to avoid this?
> 
> I think it should be avoided, but I don't understand why putting all
> children of backup-top into the ignore list doesn't already avoid it. If
> backup-top is in the parents list of qcow2, then qcow2 should be in the
> children list of backup-top and therefore the BdrvChild should already
> be in the ignore list.
> 
> The only way I can explain this is that backup-top and qcow2 have
> different ideas about which BdrvChild objects exist that connect them.
> Or that the graph changes between both places, but I don't see how that
> could happen in bdrv_set_aio_context_ignore().
> 

bdrv_set_aio_context_ignore() do bdrv_drained_begin().. As I reported recently, nothing prevents some job finish and do graph modification during some another drained section. It may be the case.

If backup-top involved, I can suppose that graph modification is in backup_clean, when we remove the filter.. Who is making set_aio_context in the issue? I mean, what is the backtrace of bdrv_set_aio_context_ignore()?


-- 
Best regards,
Vladimir

