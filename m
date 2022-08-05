Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7299158A5DF
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 08:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380825.615210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJqms-00068p-B7; Fri, 05 Aug 2022 06:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380825.615210; Fri, 05 Aug 2022 06:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJqms-000672-8D; Fri, 05 Aug 2022 06:26:22 +0000
Received: by outflank-mailman (input) for mailman id 380825;
 Fri, 05 Aug 2022 06:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJqmq-00066w-Mx
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 06:26:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84673b6f-1487-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 08:26:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8649.eurprd04.prod.outlook.com (2603:10a6:20b:43c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 06:26:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 06:26:17 +0000
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
X-Inumbo-ID: 84673b6f-1487-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPamcx3TydxjEf7bey/oHOHOv+NuTJ1bMqLVdf6xyFz/9ododElLIrecu2tMeiZBR6Rld/rMwziJtBU1H2MZ2/2p1+/TGwNw4jdsj6CDfX7dLIvE1dYgYm1qOw8LVQlJGz+YT5HEph4Zc9YRWX/nk7K5SWaOJOkPf9b5bpWFvkdOh+Dforj/gg8Ju8HQ4uWvXkgpe7IbYzPAFjWNvcqPSpDVqANpNt5pjnC5sLPBnA4fO3fHwYRKNZi6nH/IUW6CsTopvoF8begl9wnv81evYtCFTYJaZZSmSWlGeoGQKjhi0Xub1Ytdog1CzhSzHfzy0mVcLKS7We8imbPVD/mCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edln0O7neXUIMAg00ykpAOuvx1m68fqZf3HyjeVwMZU=;
 b=jSaYoGdHWNJABJndRcPYkf5R9mexz7HXKMEFS2TLn6i2V3uwp4o6TKNGvTVXWLCYSpAiTXFBp0ll3PgBmEqI/0FL/VUu5/V/eYIDtFiA3qOOCkCMS6VHMlBW8Co8/8O/a8GPqAaZcRKj7S/PZxLfqweulAhYaHDyyQbBWlRKwNIwyXanHqHwgauKHsHDvuQgJ+I5RnaRourMp32kTuM4QBsZ0i2perqI0MYmypFmDtpwVGSU4skwHBeiNfsXvKyiaNXPMPr6v0U5tAYY4oPq5PZontmeh48GH8S47LIxzsXVO7oOQFIsxyXcu4R10Ys92gyEhMgn05T7qK7KS//wiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edln0O7neXUIMAg00ykpAOuvx1m68fqZf3HyjeVwMZU=;
 b=lNJsMl2qM4D9861neDzQtQvrNellVr4T3KK0PODpxCXt7+UxaFuJNU01/vtwPgSeK3Tq6krboXHZPVJ88kn18Zq0vdh18SasoWfiv2ZcriMK9Y14EhtIcSLRJg3tojECUiMMIKu4H7NXabMrPkEcVyr1kWWQwvX75Nc8Ust+5wwU+vU0zWqLz8738M0mXZMDx6ECS0tOeAafsVzUdQVez+20OQqwx3vIL2LFS4IO6LqM+4aaEcTunFTQ+zb1ygVpjOtKjVC8vg1x0D8joJ9nvC8uUv81x19UCaBOV8i/1ZVzk/DBtcvUCZPV/TPww7SfGF6tnGzeSFrIEjzDcpGSCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9e5d641-f530-4bd2-f9a1-aea7c1160948@suse.com>
Date: Fri, 5 Aug 2022 08:26:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] x86/kexec: Add the '.L_' prefix to is_* and call_*
 labels
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
 <20220804150424.17584-2-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220804150424.17584-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4efae768-b51d-4292-3776-08da76ab6785
X-MS-TrafficTypeDiagnostic: AM9PR04MB8649:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bzeL13v23TFyFpZmza5M+a1DLyJV5P6l6wTpg4qA26M+NcH2FcC3LvSTkOqHToNnt9fJct4JrXO9Mrbh0//Rb4WV8JLy+8Hbou8qkyX6UmXqd8PCxq7z+dOI36hOtk0iUAFpWbCt73pweaO5yuyRQa2h4dfDIQLCerZ9B/iAUb4p0WhqrQwperJwZw1qxjA3GNNhBR/+rIS/kGAq8tJjOnQIUuFtAJL36P4BAP9nau0pNCzunOkn+pYbcvB0xqZUe8d7WhWSc0UHmmNUkkx4KPQRzDfn9ymeUJ2PlR1QqaKHALJeYpcbrhzhCkgEgm2Jm1A7QD4So+Cu8r9ISJT7nVP0FicZgB7PvW/0oiauMDyNzPYaylR6tdl4KBH0AqJakpyi45j/xLiCAagWHHdnEGuimEjs6Xxo6RsFoob6eLwOUt1TQFSK/nVwmFHjAcAJyjQK1S1GI/PyT2aODKzZFnnjs+UaTbIIa2PNPattKgp20zzziQmtkazXFS4eU6oR6aIJQZT3x5BEeYcBPs2KL7AlKm2HjddyVQ3iu1X6EiuLbm2GRsnBfDKqUyP5keKbgg/FDyrMdKp4sFZpQe474PM2L34kgG01fuQtdlqjJYLUXhCMZzWWKWljk82ilFQAQkKQvJOn+HKF73ov4y/pWHl5yXnLBDbSPDdxsWKNsAHii/3EosfFQA0MEgvlSMmmJLX1cxJnvMYQRMBjCx3MUWUhvgssj9/ZMnBEsesQsWgZObamqH7x3/kMWIWdPdnPYu4/UleZL+qKAKQI3k+244YbKnhBqEneCgnBq84A5lFhm03GxTamgHYvXb6o/dkS1kskq5l8mO80VUQpNzGVUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(39860400002)(346002)(136003)(396003)(186003)(6916009)(54906003)(6512007)(8936002)(66946007)(66556008)(316002)(8676002)(66476007)(4326008)(2906002)(2616005)(31696002)(86362001)(6506007)(36756003)(31686004)(478600001)(6486002)(53546011)(38100700002)(4744005)(41300700001)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlZObjlRejhuRkJhdzRUcmhUVnRLU0l4aGRkRk8zTlJ1VkJGekJlYVFZYlpQ?=
 =?utf-8?B?ZG9BWmNMMlpXajBqUitIZ3FIbnhXZW0xZ3RwZVI0dVVBVGRsa09Ka3RHeGRa?=
 =?utf-8?B?WTh2RnBtU0x0c2YvM050bWtOYjNGS2orSzc3L3BJUHNWTHozZ1c0UTVKdjBL?=
 =?utf-8?B?bmw4cDhRVXl3YUg2RmtSY01pUHhNblhOdzdRb1lsbWpuRkZOek13UU1xMnZJ?=
 =?utf-8?B?dnpZVjMzdlM0bkZ0bEdpRTdnR1RsTFJnMXpELytrOWNBRnVFT21tZm91TWt6?=
 =?utf-8?B?bUJla0lGemZMbGZvb085L0lCelFPTWZnMUxWSmpQWTRyZlF6MkF3NHRsVEor?=
 =?utf-8?B?d1NNWlNyS3pOMGUwMTFTajUxOTljbzRVbDJEeDlucUdBVTFBK05TQ3hZa0Va?=
 =?utf-8?B?WVhWU2NlRFI5S0tjNGJmeG1qZE9ndUlVVE1pVGZYcTRCQ29tSmMrQVlwb28r?=
 =?utf-8?B?ZXFnWCtOdWlodldraWhEOUxUaktCeVd2bGxQcDJOeVdNSUhZcVNVVnVyZ2ZP?=
 =?utf-8?B?Q0JqQjI2WVdmY01lZmlxZUE0aU1McEE5NUtqU0FIdTJ5M2UzTktDNFlBeHhu?=
 =?utf-8?B?SWtQMm1Kd0p6eDB6TnlueEx5ZHpZVTNRN0RWc2hwR2VrTDR0VnRtaStkZmo2?=
 =?utf-8?B?WG9YbGd1a3hlOUxiUFVLV3A0RndSSHpTSS9TeEtESk5LWkRtb1ZpS0x5TEx3?=
 =?utf-8?B?ZmNza3diUXhMNGVWNEZwYkFCKzg3ZDB6V21hVnQvVldkR0NDclVhRkYrYVNu?=
 =?utf-8?B?VlJlc3BFWFl4cEdUajA1akVjVTFydXFBaHdObi94VHJIV3VZdmYvV2FjQVd6?=
 =?utf-8?B?Q1RmZ1dDTVlWLzBVSzNBYlUza0tsSElHZUJxVE1QN1g2NGQwdC94SE14N2lm?=
 =?utf-8?B?dS9pY1l4WFErVkxIakxMOTRxSHVINTZtR2EwT25KRXdXQVlxMS8xbUdQSHdP?=
 =?utf-8?B?aExLQlJNRXVJaVFyZ21qKzJtR1EvNVRtclhEYm5ORG5HUzFXOFJMSUorOUI3?=
 =?utf-8?B?bTBwNXhxU3BVMVBZMHVwcDVQcStlM0VkbjRBRzI5SE54ZkVMZjdmeUNKWDhJ?=
 =?utf-8?B?bmg5Yy8zTUxodUJtSEVPUWFvYzk4M3E3SDE5S1dHVXM0OFlWblo0THkyOVYx?=
 =?utf-8?B?WFJhNGZBZFBRTFp4WngwRjE1bEgxbzY2NnMvbm9icHlQM2o0a3M2ME00c2I3?=
 =?utf-8?B?ei9pb1NnUm0vcjJ0SVZaakxRK3JwUllJelh4bHFFdG4rQ0tkWEUrSnBVZXRJ?=
 =?utf-8?B?YUdHYkw4Sk84anQ4dUx6VVB0UHN2ajR4UlhmZmlzYmxhN015R2xRYVFXWVIz?=
 =?utf-8?B?RU5zcHhCUEVPT3VsV2ZiRS9NNTBVUEIvb2pHbEFKUjFZczlXbFV0OWZ3QitY?=
 =?utf-8?B?NWpIbW5GT2lkYnBXdGR5TWJRUkswbUVramw5SzJldGdpV0RPSXlxSzA3QWdx?=
 =?utf-8?B?RWxSRXY0NnlTMDRRSXcxZlZneDV1L3ZXUE5DZUMxaXVQZTdHNVhjaWVvR2JH?=
 =?utf-8?B?NmZPR2RoVFZzMFRFSVh0Zi9CNEM2SjdXaGtkdWxSN3ZhZW5mMkJFRDE1Sit5?=
 =?utf-8?B?TUNyZWlKbUwzRGF0VU4rcW5xK3lSNkJnbUV6Vi92Ti9MSDdsM1pzWHBJSHp1?=
 =?utf-8?B?Y0hsL2JyQS9OTjRrb3JUWk1WSllZMlFENFEybFZsbGxFMXIwdkNaVkMyMHly?=
 =?utf-8?B?N3FBQUlVWW8wY0lvZW5qUVdEblV6VTBFMnB0UjcxU2hzY0xzb3BpdkphUjNX?=
 =?utf-8?B?OVJRZzVGeWNhTVFzWkpuNzlnbFZaa2k3N212aHh6enhpQnBvWWxXc0tuaHZx?=
 =?utf-8?B?L1ZCdWhnbHh1R2t5RTFGL3FEV3RXSzZHOEJSeG41Mm5QeDZzVFlIalNydU40?=
 =?utf-8?B?aDM3U0RZdlphOWRLVG9KcU9sODJ6RCtPQkk3ZUpBUHk4a0M5ZjhPQnVRekFE?=
 =?utf-8?B?VjI3OTQwV1VqajhzeTl4djZieUtCemFBblF0NmJ4QXVKWFZkbE1BYUxvQXBF?=
 =?utf-8?B?UHoyTk1jdTVwcGIreTVWcE9GSHJST0YrWnY1MFdaMVVxM3FLLytNQWNZd1NG?=
 =?utf-8?B?cGFDYXhJMGF6dm9pNUpCcTZ3bGtKSVNZLy82djZGcFhYbS9XTFV0NHpGRU5v?=
 =?utf-8?Q?eCIfWFDkJF1ptbLgLFbQXweL4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efae768-b51d-4292-3776-08da76ab6785
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 06:26:17.5709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dk0oMyFb1jBrxscgn/kLdRRjMPFtqrNgXSxRth2EKxcQZtTunjtCh5MW4ZNSpCr0y4Dw6rF0/FCGEYv+ZiZo2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8649

On 04.08.2022 17:04, Jane Malalane wrote:
> These are local symbols and shouldn't be externally visible.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

albeit I have to admit I'm not overly happy with the underscores you
add. I think we use .L not followed by an underscore about everywhere
else, on the basis (afaic) that the L being upper case already makes
prefix and actual name sufficiently separated. But yes, in some more
recent work from Andrew there are a few cases of .L_ ...

Jan

