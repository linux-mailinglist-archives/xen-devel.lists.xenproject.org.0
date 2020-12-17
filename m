Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9990D2DD289
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 15:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55936.97591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kptqC-0002ax-Nu; Thu, 17 Dec 2020 14:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55936.97591; Thu, 17 Dec 2020 14:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kptqC-0002aY-Jw; Thu, 17 Dec 2020 14:01:12 +0000
Received: by outflank-mailman (input) for mailman id 55936;
 Thu, 17 Dec 2020 14:01:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=852C=FV=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1kptqA-0002aT-Rj
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 14:01:11 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.102]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f544834-821c-4fdb-9cc9-69e7789bcf94;
 Thu, 17 Dec 2020 14:01:06 +0000 (UTC)
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Thu, 17 Dec
 2020 14:01:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 14:01:05 +0000
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR06CA0089.eurprd06.prod.outlook.com (2603:10a6:208:fa::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 14:01:04 +0000
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
X-Inumbo-ID: 4f544834-821c-4fdb-9cc9-69e7789bcf94
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMAGZInbdk2Hru95/QMExIdpX8OzG69oehlLcl2cc1KkhGgnb6o6Ve02XgOwD/jdNwR2SIoC2YcyVbx4QH5YENW23OEor4BCqdi0KtYvx34hUxWwzV2nYLNUN0VjTDfpFQcd04stEuZTFmntsu0MRHKy3Y1PAMOW3JUTBrDBXxwV2JKwVkzubX4cM7lYYdTEU5XU4sRWLnSqnIInzWy1SWJ+crurAczRE5JsayJxltV5QXg4+dzc19BKz73VDSDIFGCRD7U9qrxlCJC808sJyTm+sIL0WpL/qcFprtL93vh7Qu6efQlGuuO1bWeqZNQJKcFqrMMjX7HZcJW/Chwy6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO4nCuCyX73aaYqdOq4oxM1ZPe9FqdWAsp0oFeIBq2g=;
 b=Xu3/FIpd5Uuq4jcrALsi+KOTiqmF8JIJuh2uwOHOsqPYphsvwO9acnuh4x+eanu/Pe/V/mc2RBjAd7m1CrWynmotEy6bvzgTu1EpMwvBB1GCEVYmnDEmDwFncQIpavVljcdktVhSmPxRa20A2DuzJax6N94LAeXNfJblAVFS1ZLdJuqC5KMyLV+61pbaTUJ/vu9hc47LP5t9eBnaFUmV6H2KyxevGEdUv+cypeWm4TMtFAU7Iphp4JfitdsW1TISnHdH1DWgG/j2ljHyDAae6lspNNJOD6coG5mijEpHbEp9C9thQZ7fq38ygXrohCuPj8+23CvLJUtx7H2v0T5cFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO4nCuCyX73aaYqdOq4oxM1ZPe9FqdWAsp0oFeIBq2g=;
 b=WiTxmDWDLW8avJU6t00WZ+/3mHPPB0sVOfK9iSdt28xe1Zh+4cvuIQX0XIdMmIx6c7vzg0zbICauRwVYwAynYgZWNrU+LO+5fInyzltIicWI+5iYaq0fxomTspfuXctvz5IOTEvWGQ+vzPY27v4Bk/S3Eo4WGVBdngjJuapCuWs=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=virtuozzo.com;
Subject: Re: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
To: Kevin Wolf <kwolf@redhat.com>
Cc: Sergio Lopez <slp@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
 <20201215172337.w7vcn2woze2ejgco@mhamilton>
 <20201216123514.GD7548@merkur.fritz.box>
 <20201216145502.yiejsw47q5pfbzio@mhamilton>
 <20201216183102.GH7548@merkur.fritz.box>
 <20201217093744.tg6ik73o45nidcs4@mhamilton>
 <20201217105830.GA12328@merkur.fritz.box>
 <d7c1ee7f-4171-1407-3a71-a7e45708cc4a@virtuozzo.com>
 <20201217130602.GB12328@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <84380429-388c-f8c3-d318-788eda550c97@virtuozzo.com>
Date: Thu, 17 Dec 2020 17:01:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201217130602.GB12328@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR06CA0089.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7a67be9-9a09-4319-25fc-08d8a29431fe
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB5944F2BEC381BEA81910DC13C1C40@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zKD4Hd47SKkjtLbHHKlaM/C2vhOfTZElmjvrxSH/ur+DsEq6eXQvACbbsXT5heL79zWUclkce5+K0XZhGA8VZLf3cLLrEDSuNg11+FhxAt8er8gBVROXr71k/8F3MPqOFExxeLKuRkvJ+b0kRP0VT1Icc9NKAjkQ8ZzZKb3fxZrxZujuj+5aCagrmZN/Y6BEg/512GHHvqW8GsozsWCedUDOo696iQ1SwopyYvVpWg5/KSn+JN5mGyetJvrblIb85/QKH6qOReqNuGZJM0FdEf8dK0e4QxoUWpYlLoPxy8Y4/zW9nMa0+gdxOMfifmx4hiHjj7IKyQnndklKAN3stBIcQyD0vZsYQVAuCp7ZD0+edv8T5uBm7wDmB4Smu5ffyvpelYCGo0zwT95kK2AwAfb0mRD2V42dp07yXV5KH0I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5494.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39830400003)(376002)(7416002)(478600001)(66946007)(6486002)(6916009)(36756003)(316002)(66556008)(8936002)(16526019)(16576012)(66476007)(5660300002)(31696002)(54906003)(186003)(8676002)(2616005)(956004)(4326008)(31686004)(83380400001)(86362001)(2906002)(52116002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?MDVZUzVJZHJ2blNjT0hJbEtDcTFaeEs5OUhreE9pSC92UXE2ZS85M3ZQQi9C?=
 =?utf-8?B?VlNHbm9WN3RTeHhoTEFiT0pvem9ndXYvYU1xQWJ1V1NBT3RBQzFqZGRBMDFJ?=
 =?utf-8?B?YVc3bG5kTUFjdkkrY0ZaN0hORGFhSmJIMDNLUTFhcDhjd0hTV0x2d2RBYlZw?=
 =?utf-8?B?NUtGdVMxZ1Mva1Nhdmc2djBYTERQMG1UR0RCZm9LcWtHcWZWSmlHbzhiamlG?=
 =?utf-8?B?NE81alV5bGJKSldDWnBndXg5WEpZQ2ZVR2NoRXNkdTR1cm0xRjVkV0pYbXFn?=
 =?utf-8?B?TCtUeGk2N2NINGNvUkJndmU1WmdTN1RoS01FQ1IweEcyMXFSNk5Qc2tXR2Nj?=
 =?utf-8?B?aTlKVmtRQ1VSSVdnZGdqT2hNOWdneTFyV2psZ2tWUHdBVGUyOTc0d2JpNVE2?=
 =?utf-8?B?SGxRbmsxNFE2OVMvbEllMW5UQjllR0NlSGZpRU1LdFlXS2JrNEo0ZExZVUVT?=
 =?utf-8?B?dDRjQ1VEM1psM2s2dTFQck1OV2hrRzZtYkl4QkdrNWZmeDFzd1ByOTZNalFG?=
 =?utf-8?B?SFFmMzFrN3QxSSsxS2d3MTVNSnNnWXdUU2g1WUlUUnBicmZFNEJoak5XcERy?=
 =?utf-8?B?TGpOY1hCMU1kWFBqVmxWOEdZQ0dsalhsM1drcmp2bnpkd3pJaDBuY3lNcVUw?=
 =?utf-8?B?SkZ4UTQyVVhCNGUvdHBab3V5RE9DTWxIbFFZWnVjWDdpKzBQR2ZmdFVSNFpB?=
 =?utf-8?B?MmNuSDJrVFFvalJZUXRhK21uc2xiVVpxaHFuRm5vQUN0TE8zZlZqWFIrbkJw?=
 =?utf-8?B?MU9DdCtkLzJGOW5IbTYraEJyRzRHYWxEdHlwTGlnRWxNdWFUR1A5czU4ZHY3?=
 =?utf-8?B?TldQVXlnWHJCQnhWWGVuQm1uZVk2SXE0RWRHNlNHMFVjeEhBVXpuRFIvQzFL?=
 =?utf-8?B?bU1OenI2RExsaVFoTytjY1BzTjIrdFNkWlp1MkhQSFZuaVBvZTlEZU9KRVZG?=
 =?utf-8?B?RXNYMnI5RW5nYUNINnpydDdUM1dVbXVSQ1k3c0ZzM0JkRlU0ZTZIOHNRWXhT?=
 =?utf-8?B?c0dLUjJTOGZUVW1BbnN6aCs2L2JRdWIrWlBST0gzWmRSKzNPYll2d0Z6R2JM?=
 =?utf-8?B?VkdDNmFrcUVQTVc2Nll3aU9BNmtRRTJsY1pVek00SU5MWCs2Vjc1YjM1aHFa?=
 =?utf-8?B?OUVpOFltSWhyTktpRmRBcTZrQWdqelB5WWVoR1RKK3FHNFhjVzFvb0l2bWxq?=
 =?utf-8?B?Q2pnOVhYYUh5eFN0SHRWaVVsNnowSGhucWFEdTFWTW9MV3NObjJ1dXJWTXkx?=
 =?utf-8?B?eFNheEdrUnRqZ2hvMFRPQ2x3bFlyNmZEckYvb0FEVUZzaCtyZE5rc0FqMHlM?=
 =?utf-8?Q?/1cS4y2Fn92Ofo4MGTRK3lYsBfTaPNK50g?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 14:01:04.9916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a67be9-9a09-4319-25fc-08d8a29431fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRzVLTntScyIFkZhiAbvnTglALE6I5m9iN58xbIuONPDSJTvxm8SM51jkBuHkTE2y/AdczRjsJGJQa+oBxyCXHu85UGFTxd08liuxyhtnbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944

17.12.2020 16:06, Kevin Wolf wrote:
> Am 17.12.2020 um 13:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 17.12.2020 13:58, Kevin Wolf wrote:
>>> Am 17.12.2020 um 10:37 hat Sergio Lopez geschrieben:
>>>> On Wed, Dec 16, 2020 at 07:31:02PM +0100, Kevin Wolf wrote:
>>>>> Am 16.12.2020 um 15:55 hat Sergio Lopez geschrieben:
>>>>>> On Wed, Dec 16, 2020 at 01:35:14PM +0100, Kevin Wolf wrote:
>>>>>>> Anyway, trying to reconstruct the block graph with BdrvChild pointers
>>>>>>> annotated at the edges:
>>>>>>>
>>>>>>> BlockBackend
>>>>>>>         |
>>>>>>>         v
>>>>>>>     backup-top ------------------------+
>>>>>>>         |   |                          |
>>>>>>>         |   +-----------------------+  |
>>>>>>>         |            0x5655068b8510 |  | 0x565505e3c450
>>>>>>>         |                           |  |
>>>>>>>         | 0x565505e42090            |  |
>>>>>>>         v                           |  |
>>>>>>>       qcow2 ---------------------+  |  |
>>>>>>>         |                        |  |  |
>>>>>>>         | 0x565505e52060         |  |  | ??? [1]
>>>>>>>         |                        |  |  |  |
>>>>>>>         v         0x5655066a34d0 |  |  |  | 0x565505fc7aa0
>>>>>>>       file                       v  v  v  v
>>>>>>>                                qcow2 (backing)
>>>>>>>                                       |
>>>>>>>                                       | 0x565505e41d20
>>>>>>>                                       v
>>>>>>>                                     file
>>>>>>>
>>>>>>> [1] This seems to be a BdrvChild with a non-BDS parent. Probably a
>>>>>>>       BdrvChild directly owned by the backup job.
>>>>>>>
>>>>>>>> So it seems this is happening:
>>>>>>>>
>>>>>>>> backup-top (5e48030) <---------| (5)
>>>>>>>>      |    |                      |
>>>>>>>>      |    | (6) ------------> qcow2 (5fbf660)
>>>>>>>>      |                           ^    |
>>>>>>>>      |                       (3) |    | (4)
>>>>>>>>      |-> (1) qcow2 (5e5d420) -----    |-> file (6bc0c00)
>>>>>>>>      |
>>>>>>>>      |-> (2) file (5e52060)
>>>>>>>>
>>>>>>>> backup-top (5e48030), the BDS that was passed as argument in the first
>>>>>>>> bdrv_set_aio_context_ignore() call, is re-entered when qcow2 (5fbf660)
>>>>>>>> is processing its parents, and the latter is also re-entered when the
>>>>>>>> first one starts processing its children again.
>>>>>>>
>>>>>>> Yes, but look at the BdrvChild pointers, it is through different edges
>>>>>>> that we come back to the same node. No BdrvChild is used twice.
>>>>>>>
>>>>>>> If backup-top had added all of its children to the ignore list before
>>>>>>> calling into the overlay qcow2, the backing qcow2 wouldn't eventually
>>>>>>> have called back into backup-top.
>>>>>>
>>>>>> I've tested a patch that first adds every child to the ignore list,
>>>>>> and then processes those that weren't there before, as you suggested
>>>>>> on a previous email. With that, the offending qcow2 is not re-entered,
>>>>>> so we avoid the crash, but backup-top is still entered twice:
>>>>>
>>>>> I think we also need to every parent to the ignore list before calling
>>>>> callbacks, though it doesn't look like this is the problem you're
>>>>> currently seeing.
>>>>
>>>> I agree.
>>>>
>>>>>> bs=0x560db0e3b030 (backup-top) enter
>>>>>> bs=0x560db0e3b030 (backup-top) processing children
>>>>>> bs=0x560db0e3b030 (backup-top) calling bsaci child=0x560db0e2f450 (child->bs=0x560db0fb2660)
>>>>>> bs=0x560db0fb2660 (qcow2) enter
>>>>>> bs=0x560db0fb2660 (qcow2) processing children
>>>>>> bs=0x560db0fb2660 (qcow2) calling bsaci child=0x560db0e34d20 (child->bs=0x560db1bb3c00)
>>>>>> bs=0x560db1bb3c00 (file) enter
>>>>>> bs=0x560db1bb3c00 (file) processing children
>>>>>> bs=0x560db1bb3c00 (file) processing parents
>>>>>> bs=0x560db1bb3c00 (file) processing itself
>>>>>> bs=0x560db0fb2660 (qcow2) calling bsaci child=0x560db16964d0 (child->bs=0x560db0e50420)
>>>>>> bs=0x560db0e50420 (qcow2) enter
>>>>>> bs=0x560db0e50420 (qcow2) processing children
>>>>>> bs=0x560db0e50420 (qcow2) calling bsaci child=0x560db0e34ea0 (child->bs=0x560db0e45060)
>>>>>> bs=0x560db0e45060 (file) enter
>>>>>> bs=0x560db0e45060 (file) processing children
>>>>>> bs=0x560db0e45060 (file) processing parents
>>>>>> bs=0x560db0e45060 (file) processing itself
>>>>>> bs=0x560db0e50420 (qcow2) processing parents
>>>>>> bs=0x560db0e50420 (qcow2) processing itself
>>>>>> bs=0x560db0fb2660 (qcow2) processing parents
>>>>>> bs=0x560db0fb2660 (qcow2) calling set_aio_ctx child=0x560db1672860
>>>>>> bs=0x560db0fb2660 (qcow2) calling set_aio_ctx child=0x560db1b14a20
>>>>>> bs=0x560db0e3b030 (backup-top) enter
>>>>>> bs=0x560db0e3b030 (backup-top) processing children
>>>>>> bs=0x560db0e3b030 (backup-top) processing parents
>>>>>> bs=0x560db0e3b030 (backup-top) calling set_aio_ctx child=0x560db0e332d0
>>>>>> bs=0x560db0e3b030 (backup-top) processing itself
>>>>>> bs=0x560db0fb2660 (qcow2) processing itself
>>>>>> bs=0x560db0e3b030 (backup-top) calling bsaci child=0x560db0e35090 (child->bs=0x560db0e50420)
>>>>>> bs=0x560db0e50420 (qcow2) enter
>>>>>> bs=0x560db0e3b030 (backup-top) processing parents
>>>>>> bs=0x560db0e3b030 (backup-top) processing itself
>>>>>>
>>>>>> I see that "blk_do_set_aio_context()" passes "blk->root" to
>>>>>> "bdrv_child_try_set_aio_context()" so it's already in the ignore list,
>>>>>> so I'm not sure what's happening here. Is backup-top is referenced
>>>>>> from two different BdrvChild or is "blk->root" not pointing to
>>>>>> backup-top's BDS?
>>>>>
>>>>> The second time that backup-top is entered, it is not as the BDS of
>>>>> blk->root, but as the parent node of the overlay qcow2. Which is
>>>>> interesting, because last time it was still the backing qcow2, so the
>>>>> change did have _some_ effect.
>>>>>
>>>>> The part that I don't understand is why you still get the line with
>>>>> child=0x560db1b14a20, because when you add all children to the ignore
>>>>> list first, that should have been put into the ignore list as one of the
>>>>> first things in the whole process (when backup-top was first entered).
>>>>>
>>>>> Is 0x560db1b14a20 a BdrvChild that has backup-top as its opaque value,
>>>>> but isn't actually present in backup-top's bs->children?
>>>>
>>>> Exactly, that line corresponds to this chunk of code:
>>>>
>>>> <---- begin ---->
>>>>       QLIST_FOREACH(child, &bs->parents, next_parent) {
>>>>           if (g_slist_find(*ignore, child)) {
>>>>               continue;
>>>>           }
>>>>           assert(child->klass->set_aio_ctx);
>>>>           *ignore = g_slist_prepend(*ignore, child);
>>>>           fprintf(stderr, "bs=%p (%s) calling set_aio_ctx child=%p\n", bs, bs->drv->format_name, child);
>>>>           child->klass->set_aio_ctx(child, new_context, ignore);
>>>>       }
>>>> <---- end ---->
>>>>
>>>> Do you think it's safe to re-enter backup-top, or should we look for a
>>>> way to avoid this?
>>>
>>> I think it should be avoided, but I don't understand why putting all
>>> children of backup-top into the ignore list doesn't already avoid it. If
>>> backup-top is in the parents list of qcow2, then qcow2 should be in the
>>> children list of backup-top and therefore the BdrvChild should already
>>> be in the ignore list.
>>>
>>> The only way I can explain this is that backup-top and qcow2 have
>>> different ideas about which BdrvChild objects exist that connect them.
>>> Or that the graph changes between both places, but I don't see how that
>>> could happen in bdrv_set_aio_context_ignore().
>>>
>>
>> bdrv_set_aio_context_ignore() do bdrv_drained_begin().. As I reported
>> recently, nothing prevents some job finish and do graph modification
>> during some another drained section. It may be the case.
> 
> Good point, this might be the same bug then.
> 
> If everything worked correctly, a job completion could only happen on
> the outer bdrv_set_aio_context_ignore(). But after that, we are already
> in a drain section, so the job should be quiesced and a second drain
> shouldn't cause any additional graph changes.
> 
> I would have to go back to the other discussion, but I think it was
> related to block jobs that are already in the completion process and
> keep moving forward even though they are supposed to be quiesced.
> 
> If I remember correctly, actually pausing them at this point looked
> difficult. Maybe what we should then do is letting .drained_poll return
> true until they have actually fully completed?
> 
> Ah, but was this something that would deadlock because the job
> completion callbacks use drain sections themselves?

Hmm..  I've recently sent good example of dead-lock in email "aio-poll dead-lock"..

I don't have better idea than moving all graph modifications (together with
corresponding drained sections) into coroutines and protect by global coroutine
mutex.

> 
>> If backup-top involved, I can suppose that graph modification is in
>> backup_clean, when we remove the filter.. Who is making
>> set_aio_context in the issue? I mean, what is the backtrace of
>> bdrv_set_aio_context_ignore()?
> 
> Sergio, can you provide the backtrace and also test if the theory with a
> job completion in the middle of the process is what you actually hit?
> 
> Kevin
> 


-- 
Best regards,
Vladimir

