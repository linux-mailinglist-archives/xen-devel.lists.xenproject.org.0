Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DBA3F5FFB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171408.312788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXB3-0001ln-WA; Tue, 24 Aug 2021 14:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171408.312788; Tue, 24 Aug 2021 14:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXB3-0001ib-Ra; Tue, 24 Aug 2021 14:13:21 +0000
Received: by outflank-mailman (input) for mailman id 171408;
 Tue, 24 Aug 2021 14:13:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXB1-0001iV-VY
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:13:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac4552d6-c69b-4f6d-8d0b-6dbd74ef2e30;
 Tue, 24 Aug 2021 14:13:18 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-35E5CE1qMWKdR_JmCNVeOQ-1; Tue, 24 Aug 2021 16:13:16 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:13:15 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:13:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:208:122::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 14:13:14 +0000
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
X-Inumbo-ID: ac4552d6-c69b-4f6d-8d0b-6dbd74ef2e30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629814397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=INvKfHnSFTrWHcdhqekvBkLiMlVdJQWgnA/tlvJxk+w=;
	b=EamrYWWnBuC41tn7Cc9BuwGjyacXUi+gM7bz0k8tmWVrai1a8WHUp9hFhQzZ9fL+3a64SA
	cVxfkHD4J52gLOyrP8ZpLXIpWkAFBeTxdk5eG4g56obTxmRREhcTtfcURfidsV4Kb4oyry
	5mFHvO2pEf7HsKwgHAzFauNzT6tVmZI=
X-MC-Unique: 35E5CE1qMWKdR_JmCNVeOQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAL5pMCfTWRNsoYPwy94a2y6BlCRk8wrzgEKckUzfHSSEybB81bIRaMjyfqQvjw3nMJMGWG/0sRy4ujrP2xiIKLbF0ff0JquLGIY6pzBR8dx870CtYzmlpRA2VgyjNBXSiOM97mw/f/l+h8SZ6xxBiXhX1GV6hc0ad389yOk0xxkJ0WDrCLcN0YQLWVguwXvxIQKbdBy2s4s2LR8lEhZGp3aeIC0vq00ZPuQS4DrOvpX7pfu9gGDXARqHWPLVzb/L0047YISb6v0e6daY5LgyK+mRKyiZuUY7I0qTsr0WDuRePyugprXEYVL65EBA2imq3a/GoD3GS6Ma2C0vGo77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INvKfHnSFTrWHcdhqekvBkLiMlVdJQWgnA/tlvJxk+w=;
 b=A821RM/ti6olUNUwnGdCdljmSNkasME05qsuQ51/Daumv0dUtoaUk31JNx0L2tQq2cOA5m4kiKU5mzpsQgV+5/xE7BpNXB1dk3MW/p6BhBa6LjWtlFbaSBE+ARGebws9NIDvicz7tR40WI+EAgCjG4uRn80LhQezCKl+6D+PC9FjdQHdMc9NnPnQk9cfCtVqURQP0uIA7yMt8I3RIZKpDvuyn7D5DAMzey6wde4ixX/1LXEW6OJZjgHagvq7lE2DfHm/tBAvpv2gwZv+K8h2DGkeQ5Ect6wDC9bGgHsnnuz2R8MDvAR3GUlTvGwUfhvUFMLS8qA7jcpNPlyyjOUfMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/17] IOMMU: superpage support when not sharing pagetables
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Date: Tue, 24 Aug 2021 16:13:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:208:122::31) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99a1abb1-79b9-496a-5bf7-08d967095060
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB81793D870D81575F0EFFAD7AB3C59@AM9PR04MB8179.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9sV2ZgwwX84GQx9f1a+QWT6tkEEBG2dCMFoonBsCrvfb/sAPGNsjA5ZZz2f2B8iIEunqh3VVM0oC6kfqFLVzmtG06XrIgzIKTTk8Bdd1+u/M7worI+UynxUcYde2wszxPJB2xNCK8ywFqwLnkTWu+mQbgitFfl57mRYfN35A0tXV4yRnZxF3IxoxNvCwmHyn9hXx4vzQs4+PDC7VLhezECODJs4Mo349fqSwvOnCkl6zMnwBaOc2eBaHhI+viXRQIHVT/UoealGYfsW0R8u85DIlxq7xZYC3+w1fhLrH+57B3JmIT9RM5W3ToSS4qQK01vczWGzj4mBZqWwYXm74gbaDtNElIgnplbxNM9KWCAiix3vaLqZYDwnIUdTvsw+vxOz6GF0mviMR62ww52ty/foprobMbULZ7PhXWwWXDTAK8Cf0yQdzBgPWT5xX4AFsQ1OvUNKLLEg6QZn8BJ+O9h6oqe/TTGoNURrblPzgIL336m9doE4A1QCiQp9Eb4iR1/sIqGvicWWvc0Isk/qWfl76oazcfWkFBHsSU9iJtQVEbwrIVw8EGExv3QmpleXPsKlJYFr7R3nG09sbQevXt/cwPjnCpfM/zWMWw9HEFddG42BW/wKEA8ga4HT1GAL6bJdknf5+8muu/gbGv1Tt9ZGeZj3h5xU7W/kU2/OoymNCzy6MAQ3sQMjeqFI4G6nPKBf5SS3UJ1odAaTqjMW/ckkLnWQXSaDO+VFMmOhV3qOYt7lc+tGTPv1evucNqeegkygbgEadbA6kLdigSWIptS/LHXJCa8O6g29dRWub9yazXsd/TNxE+1RKBY9khh67
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(346002)(366004)(136003)(316002)(54906003)(16576012)(6486002)(86362001)(2906002)(38100700002)(4326008)(8676002)(186003)(31696002)(2616005)(956004)(31686004)(66556008)(8936002)(5660300002)(66946007)(66476007)(26005)(478600001)(83380400001)(36756003)(966005)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U25CeloyMWxpbmRGUUhlczFDb2Fhc3FTVGZTNkdDNGt4K1JoWUZhcXNqczha?=
 =?utf-8?B?cGxjUGh6Si8rMmhwbFpMY2tUUUM5VVM2dEgyeW9MUktPbllnbVpUTjlGSzkr?=
 =?utf-8?B?b012M2diTTNZV09LV3NBS0J5Q2dQVXh5MUFqOHdtdjB2N0U1amRIWHp6TklC?=
 =?utf-8?B?TnBxeHltYlB1U3o3VWxrc21KbnA2S2pOOU9oem92SDJZd0FzWHBUYzZXUWRa?=
 =?utf-8?B?WE1OUTEvNXNzbnJua1pkSHJpM2VPSlZzaDdJMThDMmhtOWFEMXk0Yzh4WURV?=
 =?utf-8?B?aG5MRmlIVC9yc1loZGhDYW1aSGZ6clFmb2NISnFFd0M4WGo5Wk9MWGxaeHpa?=
 =?utf-8?B?SkZGRTVLeHJBMVFhb0NaakRsZkxUaFQwVVI5cHJHTDNTV3lydTFVZ3FZeVh1?=
 =?utf-8?B?ZjN4MUE3ZkNMVnJDNlJZTEZvQTMzdzFEd1BBL1BnbW1oY0VHSSt5Tk5mY1FB?=
 =?utf-8?B?V3ZvZjd6ZTRzbmZWYUNhZ1NFcml5c0xMUnBtdERlYXpEbGUvdGY5N296MFhG?=
 =?utf-8?B?UXpvODNTWDViUUpXT2llUVBkU0Z0aUVOOER0YVA0N0o5Snc3SVd3UGlLQkJV?=
 =?utf-8?B?QUhjOC9ROHdUek9SalBIQm12eWZLaDRmSTBGNG5jbUlUbGtma2VrMXFWWEF1?=
 =?utf-8?B?dDJadnAxN2U4dEk5aU9PMEtNU3R1WU9CTS9hb2NFMWFEZzhWT2lVS3RvOURi?=
 =?utf-8?B?cTV4Y2J3QmdGTVVYa3FoVjg0THVTb1ZCMysvMGFSdnRCRmQxcVBmMzBMMEsw?=
 =?utf-8?B?ZlM0bFhSZ1FMWnRWSlNOaFZqOE1ZM25qRFJEY3V3Q0dzMlRpQU1hYXJtL0kz?=
 =?utf-8?B?RUNrNWJPdVJ1cVpsS0lzZ1VXem1ZVjErOU9kaUxzelliZGhSbyswTEtQT2lD?=
 =?utf-8?B?QzZBRTdTSUdPMlVuYWI0ZnR2Nmpkd1lsckZHbC9QK3krK2wyYTU1STZIa3Nl?=
 =?utf-8?B?aWU1elRCUWg0RVp6bWR0V3VrN2dIdE1IWkJtdkVueTFLR255MEVxVUR3VVdl?=
 =?utf-8?B?UzhRRnhmcXIrMDR0WG9GdnUzTEtiVnhYZHIrNlJaMUZmaFF1ams4TmlYU0d1?=
 =?utf-8?B?RTR5L2l6VXVmYk1xOWdWMVhFV3QzUGhqMXRqQ1g3ZVQ0NHFLNEVySzV2Mmha?=
 =?utf-8?B?TFhaWUtPOUlrWVJabE9CQzBwYlpnZEptWmpOd0JENmVpTlJ0c1FiMEU1ZVRM?=
 =?utf-8?B?QlpsQW1GZzB4aFF5TDc1dllxTmU3NmYrbXVuVkNXN25VRUpIOVJsZUxYY1VU?=
 =?utf-8?B?RzQ5bThJTWhqZGMrQnVhc0pReUt2a0VvamNoWUU3QkxaOVZxNjAybU9OK2lu?=
 =?utf-8?B?d0w0YVd0bCtXdnlaTTdqNko1cURtRk9HenhvUVl2djVlZ3I0YXBCbHpOR1ZC?=
 =?utf-8?B?RVU1bC9HTndhcVJjbURzclZaZE9LcDhHUzVKYVJsWThFaVQvditFbTRrbW9F?=
 =?utf-8?B?NmI3MFJoQTBNSm5ldnZZWWNVUGxZRW9SQThIb0RkczVMbDkxc2IxdXRZbS9y?=
 =?utf-8?B?SlhMRUxOTmprWjlxS2VCeTQxSEZGZ1ZoM0NoVndCUmM2NDBIREVVTjgzbG5D?=
 =?utf-8?B?L08zYnQwOWZlalFBQkRPekRmSFNnRENMWFhGN1lYT0JMbm1uTVI3dVdyaGhF?=
 =?utf-8?B?dFNKdHhHSUZHZnNPRnk3SkdFYzlzQUdvQ1MvNFFwOTZ5Si9Hd0FBUEFDOHdY?=
 =?utf-8?B?TE1wUHpPWUNpZ2dOd0k1UUx6blUzWFVVaEtuSzRKNEppL3owU3NnS2w0M2Na?=
 =?utf-8?Q?NesHDCHrggVBpt8Rdwj9m4oYAwZSUYFROkFAx7j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a1abb1-79b9-496a-5bf7-08d967095060
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:13:15.1444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wQZH8pzhVxlgV0Ikna6qU/IPfMYhLGpcgZOfTDHc6ktK8dfkSRfKY760RujOCrKb7GZQZOjaPubYk2N8CpqCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8179

For a long time we've been rather inefficient with IOMMU page table
management when not sharing page tables, i.e. in particular for PV (and
further specifically also for PV Dom0) and AMD (where nowadays we never
share page tables). While up to about 2.5 years ago AMD code had logic
to un-shatter page mappings, that logic was ripped out for being buggy
(XSA-275 plus follow-on).

This series enables use of large pages in AMD and Intel (VT-d) code;
Arm is presently not in need of any enabling as pagetables are always
shared there. It also augments PV Dom0 creation with suitable explicit
IOMMU mapping calls to facilitate use of large pages there without
getting into the business of un-shattering page mappings just yet.
Depending on the amount of memory handed to Dom0 this improves booting
time (latency until Dom0 actually starts) quite a bit; subsequent
shattering of some of the large pages may of course consume some of the
saved time.

Parts of this series functionally depend on the previously submitted
"VT-d: fix caching mode IOTLB flushing".

Known fallout has been spelled out here:
https://lists.xen.org/archives/html/xen-devel/2021-08/msg00781.html

I'm inclined to say "of course" there are also various seemingly
unrelated changes included here, which I just came to consider necessary
or at least desirable (in part for having been in need of adjustment for
a long time) along the way. Some of these changes are likely independent
of the bulk of the work here, and hence may be fine to go in ahead of
earlier patches.

While, as said above, un-shattering of mappings isn't an immediate goal,
I intend to at least arrange for freeing page tables which have ended up
all empty. But that's not part of this v1 of the series.

01: AMD/IOMMU: avoid recording each level's MFN when walking page table
02: AMD/IOMMU: have callers specify the target level for page table walks
03: VT-d: have callers specify the target level for page table walks
04: IOMMU: have vendor code announce supported page sizes
05: IOMMU: add order parameter to ->{,un}map_page() hooks
06: IOMMU: have iommu_{,un}map() split requests into largest possible chunks
07: IOMMU/x86: restrict IO-APIC mappings for PV Dom0
08: IOMMU/x86: perform PV Dom0 mappings in batches
09: IOMMU/x86: support freeing of pagetables
10: AMD/IOMMU: drop stray TLB flush
11: AMD/IOMMU: walk trees upon page fault
12: AMD/IOMMU: return old PTE from {set,clear}_iommu_pte_present()
13: AMD/IOMMU: allow use of superpage mappings
14: VT-d: allow use of superpage mappings
15: IOMMU: page table dumping adjustments
16: VT-d: show permissions during page table walks
17: IOMMU/x86: drop pointless NULL checks

While not directly related (except that making this mode work properly
here was a fair part of the overall work), at this occasion I'd also
like to renew my proposal to make "iommu=dom0-strict" the default going
forward. It already is not only the default, but the only possible mode
for PVH Dom0.

Jan


