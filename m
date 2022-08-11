Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9C858FBF4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 14:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384518.619903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM73j-00037D-Fl; Thu, 11 Aug 2022 12:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384518.619903; Thu, 11 Aug 2022 12:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM73j-00035R-Cl; Thu, 11 Aug 2022 12:13:07 +0000
Received: by outflank-mailman (input) for mailman id 384518;
 Thu, 11 Aug 2022 12:13:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM73h-00033l-Da
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 12:13:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e877c597-196e-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 14:12:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4855.eurprd04.prod.outlook.com (2603:10a6:20b:6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.23; Thu, 11 Aug
 2022 12:12:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 12:12:58 +0000
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
X-Inumbo-ID: e877c597-196e-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njAWftEpHUuO8oh7JK0ep3Z54qBl8nNgPNQ5sXjQeILzdjkOicqckV3tTr4Q1l3nC4ZSKrXXQAbSz+UtNSaIVuFqsofnA/7VXOaWs4ZaTjaPiiLqPAkxOuUh4TTnPZbtVULozNJTvxy8t1AZonQjCbHTex/UMd3HPjg4poVtwLb6Yf9bM0mVJfAZq60cz9ZNs/RnS01bQVzOOKWrIJc4Nm3bOwul5eoTjl7houwwXr3j7RVkkIM9eCXFmWTo+ZKPmgNBJBVezSN7Mm4QFSy5YBarxQyRuyUDJIVaz2q4ycKlUBGpWCJ1P2n+AWU4fR1lD6NcVx3BAVeFcP0Ki9pHtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htI3QdfpY1q136MRu9rJ1V3L6ZgoTZTIELuLwA7EY14=;
 b=I6LOz6a146Lj/HqaqN0TjNMuBQDDSoNEBzyNcuwoRUrKi4H6F0HnhLq5qKpsp6NqnATy8sUDnYOgj8maevGBh261PMOP5i6VoFrrJ7Zgu8nn3AgrUYSOCEE5ZDb/8LJXT7SRL3L5dBw8+ixu/H0PvXA2w/2/UqrENWddJm+FryVf9VTbND40Sar6TLMBVSOAnCt46h+PaC75f87c/ERyRBI0Wp0OahJ6iALWWRx754G7LmFHdFWwuPmxnzTbXuFd0LhwZZ407+syT30I7RO+5+7vlmB+i8/sijHQ5mYm57d0EXoBxVIjYLwMdxo3I8TCBmUXMBjtbaclo78a8P2N8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htI3QdfpY1q136MRu9rJ1V3L6ZgoTZTIELuLwA7EY14=;
 b=yMI2CwxqeMH5+a5HZOvhjZiIzXLhL2nvsoFjatYiPnihoym0D2WHWnPxH5Ch10YFeTvqQJmRZvq6GEM81yy5UDR4U+1ncuGrnwRLtpQgTNlZJzFPx7GlfHFcV5Z6kNpG2bzsZUMQexG58NRgqCM0rytIcBd9cuoJTwHL5xaWOhrT81I1HL3BZcp0nqRHGkKdbZwFDrJrBlvz+6gEBR5aua6GgBwUvazQ4nPQoGoiXRWzltUo1Cirs4YzGdUnj87wIvVwMzm0wdji/V7STAwAozPrztTsOp2nkFJfW7jMPftQHGdikyoICS5zO4hWBvVJAIAMIjKTvOhV/ngPXDxdzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98c7b73e-0ef2-05ff-e150-cfc2f5506bd2@suse.com>
Date: Thu, 11 Aug 2022 14:12:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build/x86: suppress GNU ld 2.39 warning about RWX load
 segments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::39) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdd8bc57-5e15-4798-87d3-08da7b92d46c
X-MS-TrafficTypeDiagnostic: AM6PR04MB4855:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oY81fQIdcwHD0r3rqbrW5VdaUyQimoDarN825wBkau2Py3GslCIgmwBmO8ZICykAwQKt2egFUxtkGd0ULedYevFmIFkaIU2bmdRSOy1pcaiuOrRvAhppkg2dj+6+/Qeyj8EfFuHEnS0da6CGNZUSr36p3TMHYeUwCGwomJHK6Mjd3UaL5DMqqKRgijlfxAptks2fwthC4nNhbOETppCyI2CkbXsjrxSe1S8BbeavKy15dnEPCITyUJM45sCWE4ICrS10PCdDkPVxKTRmuZpT1kE4gQQjbtaQNHUPKv+2zPgJQzSFqpAvCK5tXlUfoLbVnjtdZobTQAaluv9Wp9nYdMY7hq9Ftu0QlIOHFmVjP/O1/WNXxI/7MiwhPUOlhdRJ0W2+EM/ccENvyD+/y5TRSpAw/uxSDabjMm9B7F9zTfRoXw3jdHDi2cALq/EgEV+F5VfIlPf1htQsL+1G2rNdVB7ZALdAXpXLUK76/hYBhecXt14YtBKchbNd+Hb4bcNHIW0Tp9PZfCQB/PQJEBd6LLXbAqBt1GvoaUPsEgfIrEkMoUTqFmjwmVKMwOfP3jyfBWC5QGMb94YfhEJ+c7i5+DAuvVDS8NkVjJ1Wt9kyx4xmcRjUV/IuD5SyHDQdzHMMsqPY/1hJE6hgXPT5p7mPzIGc4BDYYHJpOBNLUQgpVGsmkLgnaNpDRlNoAXoIdV339C2fuUAzT42LkMkKqUg3gNRvaReIipnDCt34FTEPVp/RV5QQsGGeIU5qJwqXS13lfbxB2EjA9Z2pvs6o8MAQC5h2QZf9PyCe0mlbmB9bUPX+Ib7Bcf4KzK67OhKsTRDfRx/1G4A9YAZ0ql5Cmpmb6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(376002)(366004)(346002)(316002)(83380400001)(54906003)(6916009)(6486002)(41300700001)(8676002)(478600001)(2906002)(4326008)(8936002)(66476007)(66556008)(5660300002)(66946007)(38100700002)(36756003)(186003)(2616005)(6506007)(26005)(31696002)(86362001)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmpyMVVCQnR3cmcwSHFhSHBRMWpCSXoxbXF0Z2NJMmFKOEtZSzBPTG8rWlZY?=
 =?utf-8?B?VzRuUFBucWtQS0w4VXVaRmhKczg0a01aV0piRzE5RkdDT2x0SXdHNUlTT0h4?=
 =?utf-8?B?Y0Z1RGViVFE4Y3BxYk81ZUM1Y25pZjBVR21keDBhV0ppYjl2Zi9jRXNFa2pw?=
 =?utf-8?B?WHFRa3o4ajUybjRCUm94YnE5eVVqd3hwZDBVa1gxNVJUMnhXTzgwL0dyRytt?=
 =?utf-8?B?Y2kya2xaa0Q5YVZKTWxhUU1FNE91S3hRUWVzVStGVy9CYnFBWjFHVEZHYlVD?=
 =?utf-8?B?UjNTSTVLeW10ak5mSk8vRnFmMXpJci91b3pTNHl5blJ5ckFXNWgvcFFreWsz?=
 =?utf-8?B?SVVuc09oQ0ZhK1QrR3VXQTFwMHB5S3hyNm10YWdZSDVSbkxZQ1FQU3JXUGlj?=
 =?utf-8?B?NWZGc2d5cE9qWXF0YmRmOFhCMThOVWZMZlZwc25uVkpmTytmTjZCc3A4bzJy?=
 =?utf-8?B?ZklXT3ZXTUt0THBueVVWRXNUTzRsamtWYURBWEFHZFc3ejFxbmF1RGtVZ2wv?=
 =?utf-8?B?VTVZNHZuZzYxeC9qREhDeEoyc2ljelVHSEdFYTlXQWJYM2UxUXVIcVhWbHVv?=
 =?utf-8?B?VlEvOU9GVHVHZTFFLzIwM0hzSEhjS0U1emJxS2tWNmR2VllER2Y2WHE1RmI1?=
 =?utf-8?B?Ri9WOUxZMFZCVTBQUno1NGFIUU5jdk5IZ0lCU2RZeGFGeW9UQVVTYjdSR1JI?=
 =?utf-8?B?NytTNGgwT1FFL3NCN2xzMkVLUTkreldqRkVtbERqUVRMLzZXeW1pbEVmVzJa?=
 =?utf-8?B?UERMWDV2RGpiRHpEcmdkbG1jOHM4a0wwMTVhQVNhUTNPR0xOaGpScEE4SW5u?=
 =?utf-8?B?ak4xSjRPSGZmV2lkNjNiSWwzU3RHdlc1c2RkTFUrZzBRZ0gybDdZMmNuZjRp?=
 =?utf-8?B?Yk1XUDhCdnQrYkZJcWFwMmlLKzBaUUMzQWQrdVBnS2VoUUJXVjBtV1BsTDdN?=
 =?utf-8?B?RW9ERXVUM3UxYmFFWWhyTTFjdkZPRnZDMDVnRityc3lYY1V5cDdjSmlheUFa?=
 =?utf-8?B?SG5nc1J4cjFSbWhMZzROSk8rL3BQQUh4YWUvalNTOHpuTGIxekMvSGpZSFdG?=
 =?utf-8?B?K0pTNkt2OE94YmVLWVd5RHRQVG5EUEV2djBRekRTK2owSi9ucDgxWk5sMW0y?=
 =?utf-8?B?RUVxbjk5TG1nMkdpRFc4NDZsdHIxL2lmK2NjL0Vjaks3TU1kd0MyN1dVZXZG?=
 =?utf-8?B?Tk5rUk1RVG04QWh0K1dzQzlsazZzNEErT1RJYllUWW1ublJWRWxoZ1RRMzEy?=
 =?utf-8?B?b1hjZ2ZzQ2s3Qko3OUtTUlVicmY2djVDNm1xNnE0ZGpuRG1CMVZ4YUJZb2JB?=
 =?utf-8?B?dVYxTzFWbGFFVFRUZDZRWDR3ZjdURE1FMFZaYWZuVWxWcmw2T1ZOemhjUWlk?=
 =?utf-8?B?S2xsNy9qMytMT0N1NVYvQWFKVHh2SEF5R0FRanJJNWc5WVVoQkFETWdFcGp2?=
 =?utf-8?B?YUpwM0xqaDMyb3RmczN1cm1DZ25WQ3g3U2xHVG8xZVR0bjAwd1d2OE5uVnd5?=
 =?utf-8?B?dmp3VTNIQWNvdmxTeFM4cytML2FTeG1UcFIwOHhIMUM4UjdRd1phMFNEd0pW?=
 =?utf-8?B?QS9Lc210MytybU4zb2dPRSthbjJWVU9INCtIem5yNVF1aEczTVFYMml5Sy9D?=
 =?utf-8?B?RGlPeW5XdFhZSGtETUFsVjJxUnFhU3hJdmdUOHFVT21qWjM5bmhhVndKOGpX?=
 =?utf-8?B?ZWFJQ0F4ZEIxUW4rYmlnYjVTbGVnVmtDRVplSk9KcEY3bmh1K0l3SnBDWUt1?=
 =?utf-8?B?YTdBSzl5ck5GM2VHVXdlYXpuM0tIVVU4YkowZnpkTzZ6TkdoRzdLVHNDbEkw?=
 =?utf-8?B?bWdOYjIveDJ2MGZxQ3lLNU1JbS9maVpmT3VFQmdxZnNqYytpNjgxemhMelI4?=
 =?utf-8?B?Ym1POGRxelFyTjVZOHN6c0wyMUpQUjl6UE1uREhPbXVxZkNLUG1NU0dYTnV3?=
 =?utf-8?B?QnBjQlBMZEdRdFI1K25iWlI3ZU9DWi9BN0s1Zk1VV204OXVVRDZ2dnVYMDNq?=
 =?utf-8?B?cFRJNTgzMEJXSE13d2hyVmZIYXlIMmI2cjR5Nm9QRUFJL09YQmxHdW1TaEV3?=
 =?utf-8?B?MWdVNnNiZ3hqSEVQNXJhK0tNMmJZb2dnK1BzRzZmRHpMUGJVWG9rYTNuMXRh?=
 =?utf-8?Q?gCSwTA8AfSMnc+rn4Jj3dXTTY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd8bc57-5e15-4798-87d3-08da7b92d46c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 12:12:58.7076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbSGFbTMSZHCeowt8xbTjILlXUKtG8UOqSZBh30VyXZKSPyCKTLI60gDGavyBL37ZGXdIfrhhPuuGqCCnj5hmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4855

Commit 68f5aac012b9 ("build: suppress future GNU ld warning about RWX
load segments") didn't quite cover all the cases: Apparently I missed
ones in the building of 32-bit helper objects because of only looking at
incremental builds (where those wouldn't normally be re-built). Clone
the workaround there to the specific Makefile in question.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Because of the use of LDFLAGS_DIRECT (coming directly from the Config.mk
helpers in config/) having a central place to set this once isn't very
easy: An option might be to introduce XEN_LDFLAGS_DIRECT and export that
from where the other XEN_*FLAGS are also exported. The way it's done
here is the less intrusive variant, though.

--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -24,6 +24,9 @@ CFLAGS_x86_32 += -I$(srctree)/include
 $(head-srcs:.S=.o): CFLAGS_stack_boundary :=
 $(head-srcs:.S=.o): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 
+LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
+LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
+
 $(head-srcs): %.S: %.bin
 	(od -v -t x $< | tr -s ' ' | awk 'NR > 1 {print s} {s=$$0}' | \
 	sed 's/ /,0x/g' | sed 's/,0x$$//' | sed 's/^[0-9]*,/ .long /') >$@

