Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9ED5F3F7F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 11:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415300.659841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofeBI-0001f7-5K; Tue, 04 Oct 2022 09:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415300.659841; Tue, 04 Oct 2022 09:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofeBI-0001cv-1p; Tue, 04 Oct 2022 09:25:40 +0000
Received: by outflank-mailman (input) for mailman id 415300;
 Tue, 04 Oct 2022 09:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofeBG-0001cp-Co
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 09:25:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80043.outbound.protection.outlook.com [40.107.8.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80271bff-43c6-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 11:25:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 09:25:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 09:25:33 +0000
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
X-Inumbo-ID: 80271bff-43c6-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aF7ZegPnidQPftQ4D3frcHluTmkzNFklfLBRNDoz4r0l1+T10X8NX2m+ZQaIWUGUWZmeua5iewSLrd+qYuYVWxWM9pKDJ8+7OZCZ3DrpCjxjfAoRrWb3mx7C9tk8ug5XCViTC+oYbr3Hqmni5yyqLj4AeqmlnUvEIftjtVB+X27tejxd+s3B5EarSpySteEqd/2wCyV8OsYxXHLFtywi+2dYB6saCzCx6ylckye49thSLJGpcSEVF+WVvE2w1mEn2I8bLeIqRdciVyk+pBr8Iee1SYVHul7hPhrmsO6F0nlpZAeJbOPnOgynhHPDK0Rxj0fGhz/Rmt5fFx2PztFY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FSt/D5sfWyuRU/uxuitTFK9A0wqUJfFx/hH7DhOg6c=;
 b=SKWTuig4tl/0zXW3+xfuguN3iZZv+N+hgoXDj+vrpKXI7faAO3nlpE7N/EWGQFIC8Qzv8mWYnlTJpzqvqsmH8/bT6yRiYODYDxeEd20byo7kTsPLSdC4uFRLbVvOXdgbcHHQL/Jf2rQn5AJdD2rTF+8RWhDxuCuj0JMkd3yTKva5nCPtFWX790ctWBFhk66jSV/1nIXZLW96MAyOku1ma1bYiHFCkOV/gqnjLPYtG3mSVF5MnRV5vRGZs3sjXFO/lT0zy1Ji06uZLNiy9s/l+mSlk9GfrNVTIBN1ZH5oN0vrz35kz8K4ftqY3ML1m+RDL8kr1tv+3xdHGurSoNUgHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FSt/D5sfWyuRU/uxuitTFK9A0wqUJfFx/hH7DhOg6c=;
 b=aU+pkUHYhr73tv2XgFAA+yB62RSYvYgJ60bAxpGrKgCm0i/O4l6qVSqwzXwxQwfGjkAsLlNMU4AT3k2KylXKEBckFj087q+WuNkWqYqEs6KGdVRJWv+aTjr6A2TTtXSYUQBQF4tTM8soJG16t1E0n6kCqOUiJO2c0fNv0379kKXF5OGd5jd3o0xlnw5wmRANzjFVBzWbhCRFSdbkuxS7haCfzwOmmtx6SIPGzfDOvD1wDzcsdZLqnMDHkOtm4q6qx9iToesQ7+iKqqGT1H36x/MXQ5TDgsRNRtOxSFDswVytmDDwqH8t8fibiTOQ+ty2nORvyxt5Jk+vJEGC3VBYLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c84a70cc-ce2a-8cc4-dbcc-058cb4a9669d@suse.com>
Date: Tue, 4 Oct 2022 11:25:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: x86 NUMA error on OSSTest box
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <5dba58e7-491c-d396-ea1c-de03dc0053bd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5dba58e7-491c-d396-ea1c-de03dc0053bd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 780650c5-14a3-4c1e-e3b6-08daa5ea6371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mfabfg55x+QIQXfquaKuLhOfH53tYLa9zeRNlP4KOu1gryCQ70gIyvt8KbK8iBUAv8fx/zDLTo9u0sI9uwYrBw2Wde/TNPybT9ZaQo/D3xSvkvlRvUFNCVrIvtYz6HXINwxzYzWKW4MbM/1h/mqZWAdgjYc4I/TDPPQFBOWzamnhQdEG1qn1RbwCWvPQESo663x6YS/T0mIPOL9A4TFcAXjUCo6JY5pj8LVR6ptpdCQJFkgH610rWU4+QMXycVCZGR65MtpQ4inQxf0eBaKmSUU97UB0xNY/QLsx0MjOEleDO54HLQwXHLONbJbVKOWbM5g26g33q8uWYYG1BuHiv4sZKauAbskUV+kGRsuUicqIAszQIONCrK+1w7PKbKXCkaxPWgoDWTiZ5wGYwzgx/0F3SwOOlRTUsWxpymZ3pqP+FeMRS5WLsXSP2BQw6Pk7+OIUj/jHo8xlrFisfuoNLXlJVvnATbZq9I+Qe+07+3BX6doUMlpz1qMofgEarOb6G7LzzpY7wvHv20H0ilbdKTKMBOHdTu4x87aenXhUzGENCUymqLMbg+n3pAD7YWHwQdcLSzG+UAnYlc899buesVUH2fqBDUJa7nUlZuXfCzRM0PMWL8i3t0c7XMxaMmYY9Gz/3n9cDYAn9T4JNQaHhRI1eql5XmKokfl6dZoVWVvQH4AxJL83yUxM3izvpN/i2NH6khD1NRWMWqpdcm+hyI0yQWj1z/MU2+fhO+DsqpE7g6oYuF+4L6iips65g2WrXSZZPY/0y3w2G+96qX5oWB0oba3pmzLC3IXbeMCaClU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(366004)(376002)(39850400004)(136003)(451199015)(4326008)(66556008)(66476007)(66946007)(8676002)(38100700002)(186003)(41300700001)(2616005)(2906002)(53546011)(6506007)(36756003)(8936002)(31696002)(26005)(86362001)(5660300002)(31686004)(6512007)(54906003)(6916009)(6486002)(316002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nmdpa3VBNDBwUDU4NjBZNE85TU5VRG5uT1JUSjdjTVZuWWdzeWc2MjJOemtI?=
 =?utf-8?B?MlRMNmlFMmFUdTBhY2t6d0w3R2k2TGIxM1dNVGI4NjBuRWVGZUs5MDN0dURZ?=
 =?utf-8?B?amcxSU82U2NoTEJhQlhjRnhlQXVHZVpyRTZINlZpT2hUUVNEZ1h1UnJzcWI2?=
 =?utf-8?B?T0RCczBtaXpJc2p0SDlxbXFnOC9qcG16TWtTVnlzYnpXN3Vmdkk0ZzkwV1lk?=
 =?utf-8?B?NDVPSkpMUWVtQXhVUFYwLzd0cm9PazVodmEzWjdXVENzY2s2c0hSeDRRZ0xF?=
 =?utf-8?B?RXVEY3BGWjQ3T29DYnJ1OEJ1NndJTGhmN3c0ek5xdGY2dDN1OUpvVFpLcU9s?=
 =?utf-8?B?TVU4dGk0aFlTSnBjSkdNRHFxN0QzZVJLZ0czZHR1ODBGWXdMYmtiNDRLWkQ0?=
 =?utf-8?B?T0Nhc2dwRHFMYjFab0VyNmRlYXIxU3E0RUxGNms5ZEFhNEttNVQyTGQzM1Q1?=
 =?utf-8?B?TE5JRjFtRCtOOVhBbDJOQzlnOC9IZ0pFYjNGc0Jhcm5kbFVPQnhVcWU3NE9x?=
 =?utf-8?B?b2xPdC9uS2VoSHh4U2pEb1M1NGl3VkdMa0pFd0VRTkloMGFHUDRsdzFxMVB3?=
 =?utf-8?B?bHBFN2ZvcEJuZlp2Vm8wazdCWDl0ZXpIM2VNcWpDelFYMWJEN1RGZXIwcUNM?=
 =?utf-8?B?NURvazVHRXB3Tm4xSkZsZUZZc1dncUNjL0YyUEhHZG5zUUEyT0tyWDA4WEs3?=
 =?utf-8?B?ZDR5eDMzU0Qrd0g2dkppOVk2eVk5aXJiWVBXbFRsMTZ2RFBrZmpjZS9Da2hN?=
 =?utf-8?B?Nkh1Y1A0TFBteGczV01ld05keldPKzVLbWM2UGFNcGZVNVBlbUtwRkRNTTlK?=
 =?utf-8?B?NTJ4QXJrNnZDRkVaY2hoVi95V1laQ2s0QnhMSFduSWFUT1hVZWNWazJ6eENB?=
 =?utf-8?B?YzFzbGlGQmFlam9sdml1TndVTWpEOEJZeGRYTk1GSnVRQ09JSGgxYVZJVDIw?=
 =?utf-8?B?SnVDeFBtcnBlR0F5TmVGcTdXTW1CSmJrdVc5d0M4MDV2M28zczliYkNrL1Ax?=
 =?utf-8?B?YUlUcmljVHR0WWtBb01meFd5SDJwQ2Eybk9VeDR3ZTU4Mjh6cWFoU1hGdnN2?=
 =?utf-8?B?czFudmlZT1ZXMkl0WWloNUY5cEc0MW9Pb0tNdEliSlRYWHlMTHJPTzFxSnZK?=
 =?utf-8?B?c0VKRE9manh4cEdOTVBUZlJkUDN2Z3dmQ3A0VkpwWFpMTXV2S2VheGtJbSt4?=
 =?utf-8?B?eStIMTdsSjBreVAvcjNOTVg4SmJrcmp6aDVJVkM1WFZ4M2trMkExMUtJclk1?=
 =?utf-8?B?QWgwYzQ4U2dWL0krQUVGbjdDM0Q0V1crcWhoZENyWWs4K0Evb0VOMG1WUEg0?=
 =?utf-8?B?VC85aHRIYUJhb2hzdkkxYlNQZmJORmZ1YWZIMEFBZUdjNGU1UE9YVTNTNlZL?=
 =?utf-8?B?WlZlTGFMQkJaU24wK1pmNlAyVXJtQzh6MDcyUUszWWdkSnRNWmVaOENrQkMv?=
 =?utf-8?B?YStsUGROeHROS01CTzlDWlFFaTl5VFpBbWdlVzZMdy90aDl3cnVuaHhBd2ZE?=
 =?utf-8?B?M2JUSE04YUU0Skl2YWQ2R2lzTDVDbllBU09IOEt0QUxsZ1RNVExyMmlGZmZm?=
 =?utf-8?B?RTRRN0YvUDJROFUvbkdSRndKR253RS81NUFNWFVOeExXUjd6L1ZZb1ovNjVC?=
 =?utf-8?B?QmR1R1prcXBhU05aQkEra21XcDB3bCs0RWsyWENwTDJxWTJ2U1FSZGlOaXdQ?=
 =?utf-8?B?S1Nub1FLYkRnU0xjM3B4Uk9tMkFHTExJUnR4MUMwMk1qdDFjRTFhRjkzMVc2?=
 =?utf-8?B?VjFNM0FpcWhHb0pGVEcyRmN0cEVtOTRJZHJMUHNxcGNGZ1NWa0Zoam1FVGlv?=
 =?utf-8?B?dzg2a3MwTjJGTWo3UmhUWncvdjhBeGVGUnNGMWpKbjdwY3pZN3hVWThWeHJv?=
 =?utf-8?B?MWNyL0g4Vzg3czUvOElQcmVDZzZrWTF2VGtZM2JkaVJRZU1rOXlJSE9ncDA5?=
 =?utf-8?B?VkhTbEJ6RGNTOE0xMmxFU2FraHkxUXl0VWIzN3VEQ0tiNFRLVkVzY0Vzd0xT?=
 =?utf-8?B?Qm96dkxUbW5TYlN1VDk2SXlyYjNBdGFlSmJwWVV1K2psVVZIb2NvMmxqUnJX?=
 =?utf-8?B?a04yUVkvbC9KTXM1RUlPNWZod0sxcjhTY2M4ZnArdmN4NFdxc05BRFFHQm55?=
 =?utf-8?Q?reYRRCk8dJABDxHfyOIGP5Jwf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780650c5-14a3-4c1e-e3b6-08daa5ea6371
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 09:25:33.6622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHUnHSkVxhIYDqiWam10ldm49Kjs+LfTxtpAQF+gRXg97ykJ3pS6VPhR9UwA4E7IBYyt8Lb8cHeJ39nWC+btYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312

On 03.10.2022 23:21, Andrew Cooper wrote:
> While working on another issue, I spotted this:
> 
> (XEN) ACPI: EINJ 6CB9D638, 0150 (r1 ORACLE     X7-2 41060300 INTL        1)
> (XEN) System RAM: 32429MB (33208204kB)
> (XEN) SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
> (XEN) SRAT: Node 0 PXM 0 [0000000100000000, 000000047fffffff]
> (XEN) SRAT: Node 1 PXM 1 [0000000480000000, 000000087fffffff]
> (XEN) NUMA: Using 19 for the hash shift.
> (XEN) Your memory is not aligned you need to rebuild your hypervisor
> with a bigger NODEMAPSIZE shift=19
> (XEN) SRAT: No NUMA node hash function found. Contact maintainer
> (XEN) SRAT: SRAT not used.
> (XEN) No NUMA configuration found
> (XEN) Faking a node at 0000000000000000-0000000880000000
> (XEN) Domain heap initialised
> 
> on sabro0 in OSSTest on current staging.  I do not know if it's a recent
> regression or not.
> 
> The SRAT looks reasonable (in fact, far better than most I've seen). 
> Given no legitimate requirement for aligned memory that I'm aware of, I
> think Xen's behaviour here is buggy and wants resolving.

That's yet another off-by-1 afaics, which was not mattering until the
first off-by-1 was eliminated. I'll make a(nother) patch, but I first
want to figure out why I didn't see this issue myself (of whether I
merely overlooked it).

Jan

