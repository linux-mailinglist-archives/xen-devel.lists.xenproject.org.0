Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32E33CA193
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 17:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156703.289171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m43SB-00070N-GB; Thu, 15 Jul 2021 15:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156703.289171; Thu, 15 Jul 2021 15:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m43SB-0006xa-Cb; Thu, 15 Jul 2021 15:39:11 +0000
Received: by outflank-mailman (input) for mailman id 156703;
 Thu, 15 Jul 2021 15:39:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m43S9-0006xU-Rg
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 15:39:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eaddd37a-953e-4b79-bd82-c5a79a77805d;
 Thu, 15 Jul 2021 15:39:09 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-zNDRUxwSNPyNa5OasuVqpA-2; Thu, 15 Jul 2021 17:39:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 15:39:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 15:39:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0212.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 15:39:03 +0000
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
X-Inumbo-ID: eaddd37a-953e-4b79-bd82-c5a79a77805d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626363548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TQumDl358wnlOJ6NniYm7wz+OqmoJIGghw42t0U/zEo=;
	b=QUHpiClN0i+73FCL2f8GyYi4uPuUbail2IeHDyVD620ITx1+8OleSfIHkZNdd5I0pdSaDW
	ZJSbzPZOPzPXhpInnl8FsVygfQeP1UQYgb60m4usgs7O9+eiyEwYTQTLprS2FMpVdUEOVn
	9rE3Oof8xxBVyS+BaJ3iAS5r5wvZrV0=
X-MC-Unique: zNDRUxwSNPyNa5OasuVqpA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mrlvd8uUMUC9jbSTcB560LeoHQArMRxJUSabRF8Sx1KQRWoPdt8PSzPOdqxzmeLJ9CXoAU25KEj1SzAtaxYgn2x6n9kNpNp9wp4lZxTFAsKYFIX98dxdrbxiPoBcnkGpQHTwCXJ/ibU0goJoDNa70waZkR9E6BGG99jk/dkFyRvTu0q0ynQmI/jBfRonWHlkNRI2AFWlsCEnNalx5E/0p24yZmxS7LeBasnKEjL4rU0PPG0VMcy+KOQz136ENgQ5Zzlwsm+8HEV+wPPyJFgdiTmMnEnCQ7D1SmARySebhe3L7qeWuHLxauFYRbJ9o96OsM3xl7d75KFSJGw7cWz3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQumDl358wnlOJ6NniYm7wz+OqmoJIGghw42t0U/zEo=;
 b=BLsfcweAT1B+8RVrJUEpW0hJ6mNliDHS59YLt1w8O3SVeFmMqn0d12yPxUzNAuuNDkzIh22As2jpMdJeYYlfl48J1OAzIzaeLnH1Ol0alzzFqwUVO2TQ1e0abEvhi6JIi8Q7fcW6oZCTBEfQ/puu9KWCfPCSnToNCL8pBi7C2NImCevqdl0inU4Gmoz2uIa0G18Zn+QRBH23bUmAj8h88tbIg/YfR+c7V6H+WRdf5fOxoLDKsM3Y0xXzUaQwyE4xper4LTl7Z1/+MQPoUcVt6Hz753Gh7EHf4etd2lbxVZKHFndzfYPlKfeggFL0nIvfs4x4bBbEH3It4ct5GnYS7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH for-4.13] x86/tsx: Fix backport of "x86/cpuid: Rework HLE
 and RTM handling"
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210715151050.6514-1-andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a23b942f-44d6-97b6-86b9-7339a24f1a67@suse.com>
Date: Thu, 15 Jul 2021 17:39:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210715151050.6514-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0212.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 178a065e-c52d-4289-e24e-08d947a6acf2
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73603F3D6A22FBFD94BABA14B3129@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3vVM70A59iqDqzCtXEwklWJjX4CJ4XmGnTQgM3n0PSHYRoMqdm2FvvTXF359YjZgnUzE3OCpJuzIRpMmRs5DNN2saOX21VgBTpRGjc4o+3WFgn19KFW3w58zpsVMHj/31J43ZyeYuLzCa+PC5l7yiuVn3mZtJLmN+JNts5uet4mNMQZLGLqifRdAub99u7/68XA/kc4X+SJNWYi674hdzKi8QY7d1Mjn1UQXSjE1NOqbomgDCP4xVXjOXL4N5JTKu+rUiXLqMLI0JccLle71l2OhB5YSSsN4cC4jlnxE15rvh0BEbvM0Xvzrs/mIdKdgJmHI2ZMImYt3txcLYVWuyA6D8N6yrHn7YEuFWu/9sWXnJAII9vl7keo9VClzVPtTOAzD8BZA3Yw0plLbnM6SQT4Kt5QgjXc3TaIBpB79tlrsnnT9CdGgcgsXkrRvLQJlfO4H9/yug5eedZL+4gAEZ1eh+8+DrdyACFDcqRubzgNoqfanAT+Ls0LTpalcIhSo+6IxDJGOhSbCRPJVB+mtkz48ppfni8f1xtUFlug6mkCczZTV2Ue3LLUgCt+ZSv677AnUaF8xujRokZYwwL8PncBg41tW/cSZdmezC/AdhKnGNKhdBkn/rEJ2+UaM/JkDSvwqBvzvh06BGw0yuKV+IGeww0Znl9AL9AGhPE+SrWe5pXGdwTfX1IYzUhOygvpXXzt+NEuXOxVnIlfCFTfhYxy1/IRw24ar8PqCAavvy2g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8676002)(8936002)(31686004)(4744005)(2616005)(956004)(6916009)(36756003)(38100700002)(16576012)(66946007)(5660300002)(2906002)(66556008)(498600001)(53546011)(86362001)(31696002)(66476007)(186003)(26005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUN6T2VmTktwZGVUUENMWGt2SHM4Q3pGU21kOXRaS01uUXJBUUhhTExFczFP?=
 =?utf-8?B?QUtUSFVJcXd0TzVIeEZGaDJFUWFDU0F1UnFyUTk2c2lrb1Z6RnRJTVp5RnUw?=
 =?utf-8?B?Nk12MHVUWU1najZybWRjVWk5NGtlWHJqUUdrTUJvQ3Jua01ma1ZvcVJETjRB?=
 =?utf-8?B?V3I0QWc5TG1zVXAzUHFWMUxLSS9iOHlNWlZrbDJ0bFh3bG1YMEhQWjkzekl6?=
 =?utf-8?B?eWVIbXJQcWFtbUIwbzJHUGZrT0dwdDRSdDRmSUFVSW5SanJGVFg2WUJYaFZH?=
 =?utf-8?B?bmRkMU5VVlVJdHc1Y1NiWmtPd1BFUVVKOWZXYnhGOHdOcTlqK1o0Yk5EZlRt?=
 =?utf-8?B?UWpjQjIvNkQ0bG4wRkF4Y3JpZ05RL3BUeGdDNUdWaFRBYXZsSDVmTWkzbTU2?=
 =?utf-8?B?QzF5L0lDbTEwbGhxRkwvYXVlZGwzdFVlczFORlBHUHRXMXZPQksyVUhId2Y4?=
 =?utf-8?B?MGMrRHNJR3lnUUt5WWRhZEdlZk5UVVlCQTdTdkt3ZUZiWW56ZHN4eklqTDhG?=
 =?utf-8?B?MTlhekxpWmxybE55OXUrWTRHVUVaYkJwWklvaWx5Nlo0OTY5NURoRi84c2Nu?=
 =?utf-8?B?TFBEODc5VVcrU2wwcFNiUEFiL1pEeExKRmh3aDJFbS8xTVczYzhIVmtsdExU?=
 =?utf-8?B?TzlVang2c2FjZmNEOW9WenBsTFpwMEVlWmJ3YXowVEJiUmkwV1ZFTmU3YVlI?=
 =?utf-8?B?dHdWRFJNTWQwaVRVMEhRd1psT3ZjUDg1MlVwOEZBYW0zUEVFSWg5bFE1b3Zr?=
 =?utf-8?B?UnBpb09RN2loMC90Yjk5TFF3MVJmaVhLNUQxNW9GWGNlT280STM0c3NpQlMz?=
 =?utf-8?B?cmw5WmpTdUFWTVMwNVFTcXUwZGUwVGlVZlU0Q3ExbmF1emhWK0Y0bmd1ZDZt?=
 =?utf-8?B?Qk8xWThlK3ZJZk9zZUZlL3BxZTFyeCtpcU9qK0ZvUXpoamdua3NGZ1JuYU1S?=
 =?utf-8?B?elNYLzdrWmhNc25STmRNaktENHhYZWVKM2RNYzJGR2tGU1VZbXNKcnJFaVRV?=
 =?utf-8?B?L0FCS0JwUUU0dktmTC9UK2FtYmQyaExYSnMvemJsRUVEdk1KQ2RFR0RhRE1F?=
 =?utf-8?B?L1RBUEhoUjRVYUp0UE45NmppZTVrUHc2UEdQL24vZllqM09RNnVZUXljMTEx?=
 =?utf-8?B?WUZ6VVpJckdkTytRZFFkMUMvSmtyMlhKdW1sS0M4d3lWWGFjUmtxenptbmNm?=
 =?utf-8?B?QytsV0Y3RjRMcjFyaVljNXhzR2VWKzIxVHBKakpMdUhNRWlHYXZzQTdvRjlJ?=
 =?utf-8?B?NmhGbzZWM1EwMnZhV3kzVHZRVkZTczJ5QlZzRVdXNW01RmhXUXVFb1ZlOWpr?=
 =?utf-8?B?SGk0REMrSk1LU0ExQXZMMGtFd0IyOFFIMnF5azBTVGxmK0J3TTVseWpLMFZo?=
 =?utf-8?B?Z2c1T2ZSbWtDNEZkRnZua0JndWFJY1BFYlVCcXR6MzdLcmp5ZGIxQXM4SFc5?=
 =?utf-8?B?bGdDYjU3NmZsekdBUDdOODFBejB1dVRORklteUx0d1NXb053bDhnYkR3WFJG?=
 =?utf-8?B?b2s0UEJIUlV5S2ZiSjc1NTZ2Rjc3NldkTWFCSmVSM3JLWXJxdk5vN1ZuS3Q0?=
 =?utf-8?B?N2V0QkN2VlVPbSsweDQvbVpJVGtqZnVqZkI2WmNyckErK1dkYThoWUFPRWhM?=
 =?utf-8?B?Y3NJNUlNaktYVzNGcDJ6VHB4eklRUlIweFQvYi9KRitMTzhaZE82Q2xwRTdm?=
 =?utf-8?B?akxub21LeFpPWmhKb2lNTW1XNktMcHhRejJEeFp6TW9PTG1GUUszd1BPK0pH?=
 =?utf-8?Q?9k5KFQ9BglPh0FLlvOYtSsKOXW5gUjrW6XQDV7D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178a065e-c52d-4289-e24e-08d947a6acf2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 15:39:04.2207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ij9XfhGRgDFXPLvwsn9OwLc/k6CcoeK1j2MvApgDrFy7/O3Shm3iQBCCuWgf56HEUO8oReXvPCj9fQ99GuKiYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 15.07.2021 17:10, Andrew Cooper wrote:
> The backport dropped the hunk deleting the setup_clear_cpu_cap() for HLE/RTM,
> but retained the hunk adding setup_force_cpu_cap().
> 
> Calling both force and clear on the same feature elicits an error, and clear
> takes precedence,

Right, I particularly didn't pay attention to this interaction
aspect.

> which breaks the part of the bufix which makes migration
> from older versions of Xen function safely for VMs using TSX.
> 
> Fixes: f17d848c4caa ("x86/cpuid: Rework HLE and RTM handling")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Are you going to put this in, or should I?

Jan


