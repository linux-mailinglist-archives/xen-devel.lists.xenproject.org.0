Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341123F17B7
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 13:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168540.307717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGft1-0007bP-S4; Thu, 19 Aug 2021 11:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168540.307717; Thu, 19 Aug 2021 11:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGft1-0007Zc-Ov; Thu, 19 Aug 2021 11:07:03 +0000
Received: by outflank-mailman (input) for mailman id 168540;
 Thu, 19 Aug 2021 11:07:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGft0-0007ZW-Dt
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 11:07:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1d88354-c3c4-4189-a25d-4d6448a25e76;
 Thu, 19 Aug 2021 11:07:01 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-S5WzSoGvNUOz3ml3ftubKA-1; Thu, 19 Aug 2021 13:06:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 11:06:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 11:06:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P192CA0016.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 11:06:56 +0000
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
X-Inumbo-ID: c1d88354-c3c4-4189-a25d-4d6448a25e76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629371220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHgNK1P2+Qieg+5pz1vyjo5nwU/Ij1WJCnqDDxepy8Y=;
	b=cxlBaWMQkxL6A0AsIIMcMepuv4VLM7mJfzukhGwwGEECO7rg9vMfYFiH4/2DtHp+cBIsXc
	l13n3Jpw2RPjxHIo2iky7yZT53AveOSztnpEKrhGccnGJIZjlwVIUdM5yAYcLtIC+gOEni
	Sf0iK9Mp/zjgm24NEs25GGcJPH40vaQ=
X-MC-Unique: S5WzSoGvNUOz3ml3ftubKA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKba09tLGb+Vvr1Q4IB0shQ0fwgD1deVk7mAjAUX/K74pivSXI+ZSi/NLJZXjQlTj6ejloRA/kajd1MUTA5pviOsWvHGxO2BTzihIKJRluArcmOdDNN8SRNAhECupdtruo0NP90JXWJrn/8d2YrutU+BtJBFeGgBTb4KoV/11qeH7YRdsvBF2CIhTXMgjgG1nHyx0ud1k9MnSr1EBIwLQiRSnZ+9s64n+V89gm8tAVjokxI7DdJVgayhR+N1813jAy+XEwvb0NFect2lUdE0IVv3scs7xbRPHeOQU6+YdUSEh6fBO3wau83z3Jw0K207Dz6sd5tWolGtabjOtbBrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHgNK1P2+Qieg+5pz1vyjo5nwU/Ij1WJCnqDDxepy8Y=;
 b=QWS3qbqgR00B/LlFByjgrUXXYtol8HnPLsTdCVTdac2okRleACVtqogzy0q0Hh/S7SbiVgVMnb5lylYM+3Ed5AKWisUqf0d0jhijP/wUPVJU+nSYiw9miU+1PgqbPAy7/MKeaA4akjT+EDhcS8UA+npmpv+a3ZoKayFfZYLdleGijhORMAHRt1IVv0rhjcJKV9VSyNyy7hEGvsbefIrVWlOAGvRWJky3hbZky38rjruqjSo9QJmuGZ9vzZGeS32y5p0q9JC3qxZ6aN5WAwBDhebadc3Nn0t41W6I9w0n9Y4tZ61FlutEZ5heNCdFyqjUM9ubF2BHEa+WHyX/UZGLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
 <f69e5a2b-cd8c-3534-ab7b-427fb1fc1cdc@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f0e9c8ad-dfa2-77ac-b3db-02cba59e843c@suse.com>
Date: Thu, 19 Aug 2021 13:06:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <f69e5a2b-cd8c-3534-ab7b-427fb1fc1cdc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0016.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b432521d-3de7-4c2c-b34b-08d96301758d
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6863E553E73C3C69ACCA51A3B3C09@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w7GOHhwKtn1ap+bXCSFK1kUxIBR3cDAZG5460d+weTEoydmvsmZPBKzLjLjAeY+ZZd/KCBVKw1VVBeFkqWkLnwotHPNtR9s6CkGtjjtFfyZJ+WMZEENfM2YCN5OLrhuKayb2/U9YYR+BAuz/WqLS7Y7U/PGdrNGI6oCUneto85+sHcFA8UIPxKsDWNDxDj5kCTJMiJEs4jIyLs7rStQa+ba6i8Xbu5WOi/J9/ygi+CuZ45XJq/MQBvhWvbDyu3/fEBwLveBIOuX9CmSa19qL5eo68GJzTFfj8NXiXp0zZv74IHLAxaQHcxGaWOilnnULLRJW34mISMQUJal7FE4wzhochuVwee4NyRfvT5yKXSO6rk1qbh+MJKBubOvq68sokxz1TMxmTsJIv/XjMHhHCz5hWyLpJAhDyzBUGApJNmoIsrOt9WjGSPvP5VzLsHXYnNuZERrPZHvwXwGUYvWyJbFXooOwNltmmIwF2vPe1GiUS5/CM50fIYyqVmmPwIEo4Ap8R4i0mvSVGt3KlJHife0MaO0J7V5Tq/DSK2DPRFZ3DqdQF7ulbcqf5RurBu0qeywldjnKJSmUbGBkCRftzUX2OSz0VG+HjFMKCBQORqsBxqBbGaxiJHAfNy5AshJFad8iBMhAxdRzyRh2kBsb6aN2IrTk5PAbNtbaYMlrDHTQMDFMNVyAiBu/Z3W/J4bPK2/55fZzVOW8BD7wk2DQidLOjfE/9z71VZf9qERtq2GhvyW8Zo2dFLbSgz1aIaMy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(39860400002)(346002)(366004)(8676002)(8936002)(6636002)(26005)(2906002)(316002)(16576012)(86362001)(31696002)(2616005)(956004)(38100700002)(83380400001)(53546011)(37006003)(4326008)(31686004)(54906003)(5660300002)(36756003)(6862004)(478600001)(6486002)(66946007)(186003)(66556008)(66476007)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVVoZUc0R3ZkV1JoRmJhMEROT1JQcmN1VmJSQjlHWG1RdlpJSlo1cFdTMXhH?=
 =?utf-8?B?R0RwTjNzZWk2MTZrdE9QVENqWVFGekVrSjdrL1NtbFg5RzFkM21xS0MxZ1lj?=
 =?utf-8?B?aXZ4NkEvMTJCSEx2ZnRVT0VERnRNSzRJMllwR1FRSVNuSUxxTlRVa3dqSmpB?=
 =?utf-8?B?cll0U3dwZy9RTThmUTZBdkpoRnVLSnc0eU1kRkVwRGdYN0hWQ0U3MWpveWxM?=
 =?utf-8?B?YnFHdEhocWhWcWpuUkdPU05YQU03c0FoWDBQazh0ZWtabGxQSHVZY1l0L0I0?=
 =?utf-8?B?a2JsWGNpN3JRR3l0dlcyVlgyS3h4UGRHYjlpc2xXdkJOdFFzN3Z1RFkvUHpH?=
 =?utf-8?B?YTVSS0srRlR2NW84cTBFTE03R1BuQ0RFdFdtQTF5M2NYRW9VYkduNG9wOHFj?=
 =?utf-8?B?KzFiSzNTaktBZTZlcmNQT3RWOHV6d1kvR3FsK3hyVTcxdFB2R2gzK29qVGJ0?=
 =?utf-8?B?cTY0T1prWTIxR3E5Y2N5eTFSaVAyQm4rVE8yNE9TeEo2ajhIVXdBOFdneDAr?=
 =?utf-8?B?cnBFbEhlNWpnMVRGNm5Bci82ZUVyVHJ0ZWNXcEpBY2V6UEo4M2o2MkRzVGVj?=
 =?utf-8?B?S3F0ME02bGRScWJXRS9kdzFMYlNkenVqUE45aEdsY3pJb0JhU0ZTMWZtbnNV?=
 =?utf-8?B?MnpoYkpFSytMRGpwV0VNbGpxbzBaS2ZEZEZYK0xibkV6TUQ5V1NBWlMrcTBT?=
 =?utf-8?B?a1BhcFVkUWhPYk1LQVdFN3lXRzNTS3EweU9TNnRsbnNsaGhCS1RkRTNhY2tG?=
 =?utf-8?B?YWcweVVrZ1ZCUDJqaU0wZEpiL0dQR3NJb3ZRaTRRMjRjZkY4a0FVY20vN1RV?=
 =?utf-8?B?U2UrWXlrVkJicVpWQkxpbEYrQXgxOHV3UjA3ZWdDQWdqWXdhVHFpeVJkMTFu?=
 =?utf-8?B?ek5NUU54bUVmSmVsYXlndmhZMTdOZ2pMQzBsTnpxNSs2QWZMWFlXalp0S1NM?=
 =?utf-8?B?NWFpaVJKVkhQbjhMS1FJNnlHNzdDbHBBeHBQemZjbjJXMStuU2hzYTA0YUht?=
 =?utf-8?B?K3pxZTF3Mkt2TTU4bGFVZlVwUENDWnpTTkNoamRDM2tZYStUU1Q3VGJCeGRu?=
 =?utf-8?B?RmcxL0hzbkRFUitGdTlZQjJObDdJVWZVNVVSaldMc1hOcGtkeHZXWjB0aWtF?=
 =?utf-8?B?cmlxdHRNR09PV0YzN2FKajQxUmdMZ1l4cW1VV29jL09hSU42czNCM2h4UVlM?=
 =?utf-8?B?aXhsaEdLTjVYd0NKM2ZIWnBLOTVTRDJxWmNJKzhmQStqTVMweVJheEorUWFN?=
 =?utf-8?B?TzIzMjlKQTJLN0s3MndJM1Y0NXc1RkQvTWdZcXU4ZWF4Q3pKMWhqTXNycnYy?=
 =?utf-8?B?Yjh1Y2F0NmJQRnlFUGx0aWs5NnJlUkpmRGtTeEdBUjFZdW1sT0c3aFh0Z3Zw?=
 =?utf-8?B?Tk1qYUpVMXU1QjhON1dhUldoWDJIUW1pME1vYkhoNTcxOUdGVWZuSU80YkJL?=
 =?utf-8?B?Yno4VWV2VGRaZkdsYUMxMEhYd25RYTBXaklwZDRUR0gyRjdXRU1NdldyVity?=
 =?utf-8?B?QnNSeEhHellvTEQxUDNEdVZNQnYyQ1JtS2V4MG1hcnVLVUxRMWxNYWU1cjlo?=
 =?utf-8?B?eGpSNHFlaVBZZjR4SmM3WHhOcWZGNHUyTkM1Vy9lMkR1TTFva0NITDFSWlRy?=
 =?utf-8?B?UXZORXZmR29ZRWpiSXZ1MjZWbEgzR2lWZnpsTW1wWFdQSXhFZkQxamdnQkhL?=
 =?utf-8?B?Wmd4cHR6ZkVqTTdpd0t1Rzl3V1F0c3JvcmFsc1Z0SThGejF5WkY4L1E5MzlF?=
 =?utf-8?Q?1xWXVRplZNYAHoWUeyMgOBF6QTPBYS9R6TurbFc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b432521d-3de7-4c2c-b34b-08d96301758d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 11:06:56.8993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Atr3vZeh4n0HXaTNn2pB5jfHP9pPx0WugSSXGk6Rvj1zQtsvyZWfL7Q/0M4k8yD1HcmJz2zkjYICheuyteAiHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 19.08.2021 12:20, Juergen Gross wrote:
> On 05.07.21 17:13, Jan Beulich wrote:
>> In send_memory_live() the precise value the dirty_count struct field
>> gets initialized to doesn't matter much (apart from the triggering of
>> the log message in send_dirty_pages(), see below), but it is important
>> that it not be zero on the first iteration (or else send_dirty_pages()
>> won't get called at all). Saturate the initializer value at the maximum
>> value the field can hold.
>>
>> While there also initialize struct precopy_stats' respective field to a
>> more sane value: We don't really know how many dirty pages there are at
>> that point.
>>
>> In suspend_and_send_dirty() and verify_frames() the local variables
>> don't need initializing at all, as they're only an output from the
>> hypercall which gets invoked first thing.
>>
>> In send_checkpoint_dirty_pfn_list() the local variable can be dropped
>> altogether: It's optional to xc_logdirty_control() and not used anywhere
>> else.
>>
>> Note that in case the clipping actually takes effect, the "Bitmap
>> contained more entries than expected..." log message will trigger. This
>> being just an informational message, I don't think this is overly
>> concerning.
> 
> Is there any real reason why the width of the stats fields can't be
> expanded to avoid clipping? This could avoid the need to set the
> initial value to -1, which seems one of the more controversial changes.

While not impossible, it comes with a price tag, as we'd either need
to decouple xc_shadow_op_stats_t from struct xen_domctl_shadow_op_stats
or alter the underlying domctl. Neither of which looked either
appealing or necessary to me; instead I'm still struggling with
Andrew's comments, yet I didn't receive any clarification of further
explanation. Plus I continue to think that statistics output like this
shouldn't be assumed to be precise anyway, and for practical purposes
I don't think it really matters how large the counts actually are once
they've moved into the billions.

Jan


