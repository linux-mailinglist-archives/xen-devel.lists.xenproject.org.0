Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02C85712E0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 09:13:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365511.595714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBA51-0008Ts-0r; Tue, 12 Jul 2022 07:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365511.595714; Tue, 12 Jul 2022 07:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBA50-0008Rj-U4; Tue, 12 Jul 2022 07:13:10 +0000
Received: by outflank-mailman (input) for mailman id 365511;
 Tue, 12 Jul 2022 07:13:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBA4z-0008Rd-1f
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 07:13:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80050.outbound.protection.outlook.com [40.107.8.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13be7d2d-01b2-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 09:13:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 07:13:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 07:13:04 +0000
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
X-Inumbo-ID: 13be7d2d-01b2-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mb3HT/krS0fky7nKCS20tEzpbz0DmQgvJpFQwOEOSc4sV1eldQcuRnacja6wt/n69yi9Np619MNp9juHOGnDAfo8Zoq61D/n0tDYLoTDhDCbQks4Z0z/N3uQl+pLbQyWm89PEzA/ZAc88TrMjN1O4A76tQNOwMmd0ghuAsGpJa1CdmUfQmrtuhf+VFBVW9fQdNnmHTpARzOfzQzS4wKEFcH6fa51uP1jF+Zo5B5/XdEPVMC3VLCGHq0RlI+aXOVzSTh1uh+zt2R7zYw8yHjAZArPFjudQ/ZPRk+yrKuFK6wRfR09958Y9fntGh1YKXjOX9i8rnvaj2m6Nbp1k5ljjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8McykcUCx+s9xCR2wAzSKd9o9NIkFb6FJOtPF3Smhk=;
 b=kMGUYeglPcSseN6+BATuVw7LlCnhAaGcpo/QGe+MS31Wequ2ZJLFL5QBf1diaVwzuLC6ClNdNeSCzG3wLia6Mtnppp53wIe9d90H9w0mzrK81zuRbVvfAtBwb5se+hyhXf1693BjnvO0j1vtYvNUDyBGYRrI1VRNp8w6SX6I0+wfqd2/e87QFCb6oaXiheyKrsKXqhJA3UNBuZMzIW1k4TpSiyOZYVbpQ/4M4eY+jXmKsLXTKXbH8/5NPVmkTFJBEtL4J/GMleH8g776oUIbf1PYlRuSbozn+EGNvpFwgVs0r5Am0YdytPtKT/+e/lTJ4YNwOXD7D6pOn/CjV9THZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8McykcUCx+s9xCR2wAzSKd9o9NIkFb6FJOtPF3Smhk=;
 b=vZK/C3k6zagR52RmI8mwakDRaPM9GVSBcyoIIyF79spdE0e0k446gqG6s10dtoWeV42OsO/Mw5cVbYwv2ZwSjAGmqFX+ASeHybPYgYF8GctGhcQcDr6O9CUxJ7ai01+oKOpuYgznxZFpe+/9IJAVIs8hNMb9ygfndt6NwPS98iStqLYersb5EwLxeTSdAcsIXfUV4HMMjoIiUmcrkMUGaA6g9g9ESUr04Sdi/z81JfC7DU6jpUpo32n4cVusl722LwPgSsml+ON57JBwE5DKWp6xWpV77JQ6QVnZf+OJ8fp0lkArh2WV/yanf/+7P9xv/lDWN9r5lmGIj7Lb338fXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <afe527d0-c05d-dcbb-5917-f45aeeb6a951@suse.com>
Date: Tue, 12 Jul 2022 09:13:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xl: relax freemem()'s retry calculation
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <55556c13-dbaa-3eb7-9f3a-9e448a0324aa@suse.com>
 <YsxOBUfIl47N+E+u@perard.uk.xensource.com>
 <2b06e97e-1c39-9889-8d04-f1a063b403d6@suse.com>
In-Reply-To: <2b06e97e-1c39-9889-8d04-f1a063b403d6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::44) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 551202c4-c48a-4b44-05f6-08da63d5f6bf
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DArazlXR1ArIMI5pfi2vf175aQ6vjDRin0DqpBFxTgKhCS2V/0dHipvOhyR1qhppkziLB6dATqGoJYjKGW4I3HdTv+qxNTgxoYq10mBln9+WzbUuqzf39sJuPcUZs1sJJpRYbGkEvXCGbVlDXCpxHLkHit7p7YNVEW69Td5JnnfDr7gVKg6HuSPxMWNHu3pkvk1ZWQsEBVLwlyJCXGpI0cbguKnGM6aKJzjW7eevHq39OKzBilrbtvctF8lsDMPFFG2tZrFMIVN+lyZjgZyGXzhQStMFo2yQI0H4nP1+xCNrQgzv4Dkf3I5CY4ScCCffOIAa8xTxMzFRVLhcCuTTy6PfUHPzsowcDyTWW9l2wBWL2uwBrB/o/YMQL6+eS3revBB/lZbfY3yMN/JGNFim+f0ixUZy9QMzL2mlXYIG99018Bkj6fiV/b2JNM4rha8/oMnInQKyLBBGGMHhvl4dlV3Hiiq2RYcXspJu2EamRWwWlE4mFLwCrUJRB4PJmX4zLML/npPrwohT+3wNf1h/qetzgliVXVmJUgyZnpreryAOSiGHrH6M4jVVvCDBObNn+IdGYXOW357rUUIosoBfYkhylElI89lMSbk9XGLZOfMpexvBLkhYRwGPOhZMdBuSwAbRm6a5Fc2FdmL7555N5FXo4wZJ8qQFstFr22keYKfinXvtvpmmL80yIGPKzn+kTFBf6IDOi78VG49f/zZ4xxXNYhb6trwul7v2mtWoYk3AvHQ+NGhVpVGbPj4XI80CI5niRuNOBe9pYd5PlzIImuLrlAKsQeozbVKiuJK1OrTscNMKktEqOYWt/qC19cS3FNkNP5q4NAxM1OIz8cneqWqBMPiW7Nt74OulcwhKlMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(396003)(39860400002)(376002)(478600001)(83380400001)(86362001)(6506007)(2616005)(6486002)(316002)(31696002)(6666004)(41300700001)(53546011)(6916009)(5660300002)(26005)(6512007)(66946007)(66556008)(31686004)(66476007)(36756003)(8936002)(186003)(38100700002)(54906003)(2906002)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1ptV2tmck40UGdZQmxzdmI3azZOWWdZc3FUOTdjSXQ1a204RjFQRlV1RW51?=
 =?utf-8?B?QlRPV0E0REZTdEVwTEsyRTByRS9xUGcvVjJVNWo5dStuTjVUQVB3RGxuc2tl?=
 =?utf-8?B?cUpmRmVpUlFvSFJBZXJYWjl6MFh2cUtUbVNkOUtrOEFYdkpHcjZYa1hxN2Rr?=
 =?utf-8?B?VTNxUyt4UWRTR0hRcG9qUktNKzUyaWh4RjdUVGdFYjJrbmh0cUF2YzhMTjRq?=
 =?utf-8?B?YldwaDF0eVQ1RW9nR2c3bWhodkQzK2JadzlVaUVXVHNncklIaVRwLy9ablQ1?=
 =?utf-8?B?YlA2NW5zcThkRENqYlpuSGRudTVpLzBmNThaTnJKVm0vSy9XTElmZEtwSUFN?=
 =?utf-8?B?QjRPZENOek8yaUZRYlp3MnJSQ25sMmM2K3JOZFdqZ1RxU3lJZ29Rc2h3N1Bq?=
 =?utf-8?B?ZjY4L0xKU0lUMnJrdXgyVmpoWnFNQmNNbmlZV1RkSU5nVHZPY05MSXY1aXRu?=
 =?utf-8?B?NWdDU29nSkF5MFFFUS9MNVNWUXlreEhjV3VBUWhYMkkzWiswejN5RmZ6NEZl?=
 =?utf-8?B?S1ZGSW1PQ3JlY3dIYzBTUTJNL2JjNlpXSnZ4dGRKcUpxcGJrZnBkWEZWaXY4?=
 =?utf-8?B?UU9CK0hONXFodGdzTWRlTEw5dk9GeFR3aStyS25CUEFzQ2hPRW5pYlhGd01K?=
 =?utf-8?B?K3FIbU1lcVdSTDlwQlNvWlBPQ0ZOR2sxWmEvVFhoanlNaCtFZVFOUmk1cUtW?=
 =?utf-8?B?QXFPU3cxTlVZVUdlMW1IOXh6M0t2TnhHaWlUNzg0NWdWNXhlSVF0eVdlZDgv?=
 =?utf-8?B?OG1CeDhuN2FoOGc0dFJZSjBOeExKbFltUE9naXE1aWtmMFdJSjRGTEo2VGQr?=
 =?utf-8?B?UDdtMmlka0xUTElHYUhzV3NWRkRuZW9ocmlPck1kSkErT0VpKzZRcmJWWTM4?=
 =?utf-8?B?dS9jalFTL2pPaTE1SVJHc2x6cDNWb1QxdzBiTThheVhZeFlRYk9iL2k1eG9V?=
 =?utf-8?B?eWpNbStEVDM1UnpxbDFma3ZKRHByRG9QNHRlTFErN1hDS3BDaldiWklXbDFL?=
 =?utf-8?B?WEJ2RVNkOHR6NXhYUUxxOWhsazh0U0Q3NWJzdFRPUHQ0dmxMbysvc1RYWGRq?=
 =?utf-8?B?a2RuTWw0Y3hoNWp2bUs2YkRuN1NWZjVJL1laaW1zTXNtdXNSQk5NOEtTRjA1?=
 =?utf-8?B?UDVZSkV0Umh3T0pWTkhSWC9PV2FkL1pKb1RyZjNEWGFzYXNTN0p2YnF3VWNz?=
 =?utf-8?B?UWpaS0Z2dVJPQXBzUGNHVE5hOUtQVXdUcWhlRG9ZWk5hdVkyRUFvVXpnZkI0?=
 =?utf-8?B?cW8yTlJrNzYyZzJlRDM1d2RWRUdSUmI3SHBjeDJITzhFMUxsbXhtaDA2eTRi?=
 =?utf-8?B?d3lIMnVjTUZnc2l5c3c3cGcyUkE0Z00vTFNjSHBVRWdMQ1J6NUk1YUZNMGZa?=
 =?utf-8?B?L3p4RmNSNElWaW5SOGNqZ3U4aU9TTXBzNGg1bXA3QmIwMXFNcmFmaUx0a0Nw?=
 =?utf-8?B?c0dnTmJxaGRiVlFqMjlIcUpPaGFJUklGOWc2TVNIWTJMK3V1OGVPc2QzU0lM?=
 =?utf-8?B?aUpvTGgrL1YwTzhrdk9lTzBsSFoxckFiOHZmcG8wc29mRXFQVHVDcnMrUUpB?=
 =?utf-8?B?cmRpWC9UaDY2aWVxL0F6K2VVYUYzQWoxNzBmSlI3S2cvcnpDeEdQRy9QWml2?=
 =?utf-8?B?VEU2RGY0MXBIOXdQdTRBOW5jbGd1VjNOMUJZNk9EUS85MzBhQ3FGbXQ4Qk5w?=
 =?utf-8?B?aUl1SFRieFVDMG1VY3ZieENJdHlXR1FMWE5DWEt2YzBzS0tqaDMvZjJKWUlm?=
 =?utf-8?B?KzNmcTVjaWV5VEFiTWZHSzVjcVRSN1p5YlB0ZEMvaWwzNmluUHpFUlZPMmhm?=
 =?utf-8?B?TDhITEJpY3VuTE9rbVpYZGNDa0RLQnhvVE5PT1hPLzNqNGNld3JGVXVpNjkv?=
 =?utf-8?B?NGRKUzY4ZmZMOTRaQmpoa2xpTFdEVjF0OXVoUFpmWnhNOUZrZHp4MUtveFhK?=
 =?utf-8?B?eXBrcEwvN3Q3WEFZT0ZjdjhLcXZjREJtekZrYnl2VzhlOVFxVm1rbEs5MGMy?=
 =?utf-8?B?cXlBOXVNMzB1SHNYaHNVaEl3cUtPOFEwbEwrT3d0elBaM0NVUTNlY0pZbGcw?=
 =?utf-8?B?VkxxZzMvVnBoQ28rcGY2K0dzWnVTVzhkSHpRU1pYU0xCM2ZaSzNyTzg0blZK?=
 =?utf-8?Q?ObumOa6LVdWo2MCtJesbIfjKV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551202c4-c48a-4b44-05f6-08da63d5f6bf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 07:13:04.6494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: le3QpFve2glb6qltgFTP2NPiPnQvJ4pFtDSnUCjM6h50NN28QCUJgjBObog6WtPBv1oO/jNwa2em/4eDit5d6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 12.07.2022 09:01, Jan Beulich wrote:
> On 11.07.2022 18:21, Anthony PERARD wrote:
>> On Fri, Jul 08, 2022 at 03:39:38PM +0200, Jan Beulich wrote:
>>> While in principle possible also under other conditions as long as other
>>> parallel operations potentially consuming memory aren't "locked out", in
>>> particular with IOMMU large page mappings used in Dom0 (for PV when in
>>> strict mode; for PVH when not sharing page tables with HAP) ballooning
>>> out of individual pages can actually lead to less free memory available
>>> afterwards. This is because to split a large page, one or more page
>>> table pages are necessary (one per level that is split).
>>>
>>> When rebooting a guest I've observed freemem() to fail: A single page
>>> was required to be ballooned out (presumably because of heap
>>> fragmentation in the hypervisor). This ballooning out of a single page
>>> of course went fast, but freemem() then found that it would require to
>>> balloon out another page. This repeating just another time leads to the
>>> function to signal failure to the caller - without having come anywhere
>>> near the designated 30s that the whole process is allowed to not make
>>> any progress at all.
>>>
>>> Convert from a simple retry count to actually calculating elapsed time,
>>> subtracting from an initial credit of 30s. Don't go as far as limiting
>>> the "wait_secs" value passed to libxl_wait_for_memory_target(), though.
>>> While this leads to the overall process now possibly taking longer (if
>>> the previous iteration ended very close to the intended 30s), this
>>> compensates to some degree for the value passed really meaning "allowed
>>> to run for this long without making progress".
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> I further wonder whether the "credit expired" loop exit wouldn't better
>>> be moved to the middle of the loop, immediately after "return true".
>>> That way having reached the goal on the last iteration would be reported
>>> as success to the caller, rather than as "timed out".
>>
>> That would sound like a good improvement to the patch.
> 
> Oh. I would have made it a separate one, if deemed sensible. Order
> shouldn't matter as I'd consider both backporting candidates.

Except, of course, if the change here is controversial or needs a lot
of further refinement, in which case the other one may better go first.
Please let me know ...

Jan

