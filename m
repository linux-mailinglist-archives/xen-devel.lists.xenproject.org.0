Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9733E94BE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 17:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166144.303413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDqKv-0004sx-L7; Wed, 11 Aug 2021 15:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166144.303413; Wed, 11 Aug 2021 15:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDqKv-0004r2-HS; Wed, 11 Aug 2021 15:40:09 +0000
Received: by outflank-mailman (input) for mailman id 166144;
 Wed, 11 Aug 2021 15:40:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDqKt-0004qw-Th
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 15:40:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2003b13f-c280-4ab1-985b-1a767809a0ec;
 Wed, 11 Aug 2021 15:40:06 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-eM4lIozTOHmKbdTvhdiJrw-1; Wed, 11 Aug 2021 17:40:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6303.eurprd04.prod.outlook.com (2603:10a6:803:f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 15:40:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 15:40:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0065.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 15:40:01 +0000
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
X-Inumbo-ID: 2003b13f-c280-4ab1-985b-1a767809a0ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628696405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vex7xXiURIoZrr3tbOgfQTP5BlYPm1n/DRPu02KIjvg=;
	b=SEH0T84733q6wRzCvsihIHunPLxiIwcdqyuyCpYX8oS0spausx6y9ZREYnAmO9tw8B85S8
	1jUyo8O3cU9YNwL9zacjGX+snHaTInXgt03bDOWg+afreMrfbu0etmL/GxswEmvmG+HB5+
	0P0T2Ei65Ygs07PWAwghz6srDX6oZS4=
X-MC-Unique: eM4lIozTOHmKbdTvhdiJrw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRYYPnaf6z1qNRczi+PvoINT7BJumtW2phC4Ke77ItAgdK47GYT0SPdGuq2RnxU+l9oEDRTqBlBoz16Dh+UkOKpWGvit1qcHFrw+lMNkPDJAITuBsVJZlBc1TGn4z37768ySBQcnkqI8CFiVTO1qZ+yf2AskTuBfHX+ifpza0e5ezc99gqDGpLHIRrg5cVxXpXq2eciMwGaZu32jKOt6i73tFzh5Mbvmf83/OA5WZ+25nyiqCMT8whnyeZKhdczpm658HnqNcJMksgucOPaXE8xjAgTRiUkRA7KzmVBO9Iyz7HW8dDfKGoDD4OgHKZ28AUnWWLme1V3ITNODPH7TAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vex7xXiURIoZrr3tbOgfQTP5BlYPm1n/DRPu02KIjvg=;
 b=UHCHIdfdvTCA5mnqDysYS+QF91M2bj7QN+o1HsZWWmhxNh/8cfOQ9OXQoRqUMPuLnbwa1M22t2LAau2kyTuXGuQxN5yoPvpdxLaXX9wur181bUaohfhhtK86trpE6GF80nRtye+s5v9JNd2YcXKsGdYVtotR8zHejqDpqPgOuSPhy+DVNPzAPrrTm33pvddly1BC08u7HtC4wqz/BUZduCM8hlgQXV/VIOC+9jawcwBBqLaYa3choJH1ac3c3sM0czkQTEwiPw7mR+CdB/z7wYKuR1ad/pN6SWUydgPO5h3mI2u6uWH+6wi7z2fV1dc/0Bpg4HfGGj7yXe6OfTK/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] xen/bitmap: Don't open code DIV_ROUND_UP()
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210811152055.22962-1-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fafa45b2-10a1-e5fb-3fa7-755300f14651@suse.com>
Date: Wed, 11 Aug 2021 17:39:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210811152055.22962-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33596bed-eefa-49ac-2697-08d95cde4875
X-MS-TrafficTypeDiagnostic: VI1PR04MB6303:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6303CC6A07501821ED5D1A28B3F89@VI1PR04MB6303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E30dFULhALbucYfAyA49nYBeRig0b/9OaVumyi7KOxJFyuCC1fYc+LOUaKg0RJkBdiecXjEcs2UiZ0lY+HSMlDYSmePITqCKj+xrhxxUMKLg/q/WMGhGLs0yxaqFCk2GWxo4Xhlbferw9/DVmyzhEUWgRPa7w5LptAMcOpJryRRGUrse7GvRSqZrTwjauxLWZFW1BavIDnmP+EATeLmNBXw9J5NSiNMGwcn1+3wPqDOOtcV38/5WavkLFIB/J31NTw9mBdNgErlO2bGkMIsLcBEPxC9+TsuBSgdcvsTWsOdxfEKLqcQ6aV1qCNFdJW2VqHHOKbR/Apg8lox/4n4HTtX0NEODzt5X5RypW9gmyUDaSzaMQepJgQDOZcb1GMH/O6Kbkhx036aptGNU8gPEQj35SwfsmGPAobQ4jkTul5pv5Ig9/qkoxmP9t/52P+XkJQKHnNbkfa+pmV+BHFxFGsMblwNSevpw5BZw75sBUdVwFdhrVZMIaHTS3upPU0/AitLCgYlxDL5DzKEQOWHl8DJmYt+VHk2yv4zsa0vMLmrEGkcswT98p0ODCDD/pclN/7MTY6k8KAvuv61s5e+pyPP4w2nI/lOIPmK0p8ipmL1dxeNpdM+UGnXWK+fvlOhZHavnWOp3UGSK55RdG4X4LSidHmZS0UPWhdM+8a2wVxQR+2URS1GT6YTfRog6d5RGHd1/exFurCqEKsvSQYFpZvCreHXkiPpo0ODNPv37Zb0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(5660300002)(8676002)(4326008)(36756003)(86362001)(2616005)(26005)(956004)(66946007)(38100700002)(2906002)(186003)(31686004)(83380400001)(16576012)(53546011)(6916009)(508600001)(6486002)(54906003)(31696002)(66476007)(316002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFE2OWk4QUZWTk52SmNYNUw5eUNqdU5QdlhwekVhVk9IOFdWMFlJdUNvUFBG?=
 =?utf-8?B?bVhGSmN3dXBPSVNRQUVwazBHUWIva0dDTU45TFdaMWFzaHhaZW5YQW5uUkFF?=
 =?utf-8?B?RWV1T1ZQYW5HZTNRbXRvYXhiMUVzWDhKUm0wMlZUeXRLSTBJN0N2QXJSV1BD?=
 =?utf-8?B?VHllZ3ZNanU1dEtnd1BSNnpZT2g1ZnhkUmU1U21RYWpMUXB6VE5OWGM3T1Q0?=
 =?utf-8?B?TjQxd293NzNyU1BhSXRFTnJza01tTVFmWWxUc3ZsdCt6L3gzbVJ3QU5kVzZv?=
 =?utf-8?B?SHh0U29oS2QyaTlSd3hlVEZuQ3VTNEpnT3RFakxXenFjZ1NYMnlCN2NyZlhB?=
 =?utf-8?B?dVNGdUF5dUU1cFY1QWl0MkVTcnp4QVMya2xmUmZ0cmY4ZmozT2tnclFEN09r?=
 =?utf-8?B?QUdHN2ViOGtKazJXNkxtQ0YzTnF4UnROMlJOQWZxMkxuQlBrWC8xRWUyditW?=
 =?utf-8?B?SUo3YjZ1MmZZcXhGSE9PdHRRN3ZnS3FFYUY5SDE5allKNDg3R0RyUjBsMkxw?=
 =?utf-8?B?d2F4VmkwK1J6WENIYzJNeEp5WGd6VnUydXFKaG9wcll1OWN4NFBKZXkvckw2?=
 =?utf-8?B?Y2FIZGVoMVYvQno5SjlZb1VLQTZiUjlMRVdmT3lFbmw0VmEvYjZ0TCs0Uzdv?=
 =?utf-8?B?aW9PMEh6UDJ0UzRrQm1vNksyTk5STm9HdEV3MEU3MEhXcnBkUHdnb0I1RDJB?=
 =?utf-8?B?cjJ5ZmJiMGFaVW13cittZzVVc0JpelVFdjhLcmpFNkg5V3JQdFFieTVHOUhk?=
 =?utf-8?B?MkJuN0VCeG04d3VHd0FxYkJnTElJcTZIaWVGYUZzN0V3cWhTWXE0WEl6bmt6?=
 =?utf-8?B?TDBiMDRBbDlRaFFqSGVqRVNCQzEyaW1pVzhFS3NteStMUGxkVWg4SElVYzQ1?=
 =?utf-8?B?Vkl2d1JySVV4NnlTM3lkdjFtVGdpN3NwSTk5SWhrRXhPcXN4Q0ovQW95VGRm?=
 =?utf-8?B?aWlTd1lwYmI1L2xUZ3BGODhwTHBFNWJ5NW13a05CQmhRN2tSZHd5Y3dXelcx?=
 =?utf-8?B?V1VFV1RpNkRPMVp3ZGd5Yk9tWG92SEJrRzhubmx6VEJ1KzVUMUN5QzZJZElz?=
 =?utf-8?B?Q3NoWmRCN1ZQNm5WOGJSUS9EQzh6UWVtcjc4ZlNFa1pRZENJR1JxWnVMd1hi?=
 =?utf-8?B?cW5jelVLVU1vK3VMalgyZVp1UWYvdmpEaHpJMmxqZ3BqbDdydUVCdmhoK0Nu?=
 =?utf-8?B?WGxLMzl1VkdyT0ZRL1pWbWJqeVQ3Z3g1UUp2ZEdqSm1BRjJ4OTZUcDRmdUw0?=
 =?utf-8?B?NzhhdERleXQ4U2JBWDl1Z1ZjUlVuWEZnQlpmd2EySmZNeTB1NzZCZFNYYWl2?=
 =?utf-8?B?Y1VOaWd3QmFWM0owS3VNUWxsRHVRRFBqK3FNOGxYSFdHRGlZZmRkbWtEY20y?=
 =?utf-8?B?ZWlXZi84aDhtUHI2b0tocnRkTk5tUkh2TnBXbjZBVFZ5NTFZbXE0NmNYOU9s?=
 =?utf-8?B?N1BZU1hsUFJOWndmVTdkRGwzekJTTnVHZlJkNWNYN2FSc1UzZmNlemRhcDFp?=
 =?utf-8?B?NG5QVzdmQUtCeUxObHNQcFM0M2x4Yk0wNmhid2phWVR0TldyRit6bFZNczdy?=
 =?utf-8?B?V3dhNFVDd2FIUDdhNXpISHF1a2JyL09jcVVjanhoMGhVNU5jVFBUT1gxR0Rs?=
 =?utf-8?B?bE5McDFuM1pFS2dGWWh6ZTk2U20xMExiV1VOVHVzOGNnVkFmRjZmTDJ4VFh1?=
 =?utf-8?B?akdyYlNYSFd5QWlOajE5UDB6V1ZCZW45ZDVTZ3dGdHBWR2toT1F4eWZVbTZO?=
 =?utf-8?Q?i3MzWPgFt8jcwqbi/Xk/8G2fgzK7/pqQJ9KMy2B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33596bed-eefa-49ac-2697-08d95cde4875
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 15:40:01.9097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEKqLSoF+q7yOcHpsR+UmcSxMst0HEbCC29QL+c/mTtc6GKUGLbUjY2gSZtGKKBo9ONA0G03nxwHp3nNE7xkQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6303

On 11.08.2021 17:20, Jane Malalane wrote:
> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -10,6 +10,7 @@
>  #include <xen/bitmap.h>
>  #include <xen/bitops.h>
>  #include <xen/cpumask.h>
> +#include <xen/lib.h>
>  #include <xen/guest_access.h>
>  #include <asm/byteorder.h>

I'm curious how you've chosen this insertion point. While the first
two #include-s (just out of context) are still unsorted, the rest
currently matches our goal of alphabetical sorting (within the
sub-groups, i.e. xen/, asm/, and public/), unless there's an actual
reason to violate this pattern. Hence please don't violate this
partial sorting and move the insertion one line down.

> @@ -338,7 +339,7 @@ EXPORT_SYMBOL(bitmap_allocate_region);
>  
>  #ifdef __BIG_ENDIAN
>  
> -static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits)
> +static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, unsigned int nbits)

This now exceeds 80 chars, which is the limit per line. Please wrap
accordingly.

With these taken care of
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


