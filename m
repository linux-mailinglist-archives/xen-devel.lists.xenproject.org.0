Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C573B48C07A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 09:56:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256396.439944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZQc-0007yY-8z; Wed, 12 Jan 2022 08:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256396.439944; Wed, 12 Jan 2022 08:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZQc-0007wC-5s; Wed, 12 Jan 2022 08:56:22 +0000
Received: by outflank-mailman (input) for mailman id 256396;
 Wed, 12 Jan 2022 08:56:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7ZQa-0007w0-Nk
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 08:56:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 819810c0-7385-11ec-81c1-a30af7de8005;
 Wed, 12 Jan 2022 09:56:18 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-p82mavivOleOJj7mYFiXnQ-1; Wed, 12 Jan 2022 09:56:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5167.eurprd04.prod.outlook.com (2603:10a6:803:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 08:56:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 08:56:14 +0000
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
X-Inumbo-ID: 819810c0-7385-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641977778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gaTdc3QeNtdfPvaqCygV/XiXFfQlC7iAK7RBUOO8E4A=;
	b=WQzO68eqf45OKRKFfzI5xLTKx2foZ/9c6d4i/pZzAR2q4GkM9T3LaSMNSm1tpqzIr+uLYk
	RVf1rZdMQFVlAbZ2qmg8r6w83QQbXccl04jxLULkRhELcWDTepuqLZICKfm1kk78qIiOQI
	Sj6s9JapgB/3+KxtGoAw4nMy0CuZmR0=
X-MC-Unique: p82mavivOleOJj7mYFiXnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSu5wwu85WB6OGmOTOFh2QdNYJUPPulcSE+GJJizoReuemDQ9grSWezEg+xr4d+xFpO1qW19AnJjUOmFTSDoX9ynOOMrn6veOO4QIoREQslQCS/ESS/+UhTr3Ea9o04hGkIR1bOm1uD3J9PapHTnu1fZf8MlWJZf23ER5+DEEKuoesBt6XUAY/ZbnMHXEAulQ/5buYzRgnzVo6rZlSMnLRTFimNrIQaJG9W/6vIy+8uuyUJBX3wEJyhkIDxBodFV38goY5gqVGTLC2agsLqNubTl353JWdvsBNIDiNnGojtNaWwgdMzPb1hRmh6VKjdjzb0bG30uViYaplJNTliIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrmwLre874s9XIXxDVJv2DhxFGuz4XuU3it6eTatltY=;
 b=gKV6mR8F211AHdHy9m9IWMBiutM22Yo2/gCZXBj/WmrpD1rnpEhlqKl3UpN8rJzROopVNwOzUNl26L4nqbBBmXtcyq0yjmmi2J+cv4uCeNY00CcOaHGNAfW4EEAucjSeW3+UJGTrVwKtAybrUMmfogruL578cyc5Lq2nhwSsiYBaUNoz7MxiDOm79Ykn9XDr/nCK/M0RngjlAOJmeWKhn1QeGmDQVyY5AN01Oyk9Myt9vwir8p/48S6enOXHCxCj19Tn25stLJLBMTq7X+ioB/6e4gKwkl6SWhwZ+/GfktEaVAEBTMVNVcJVYjll0TyRtbUsZ2q6VOFUo45S23woIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85939a58-ab7f-31ea-1014-91cabe746046@suse.com>
Date: Wed, 12 Jan 2022 09:56:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH 2/2] x86/time: improve TSC / CPU freq calibration accuracy
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <595b3447-0eba-dfc8-fa24-6bb8b964a137@suse.com>
In-Reply-To: <595b3447-0eba-dfc8-fa24-6bb8b964a137@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR02CA0020.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4362bd33-7722-4b6a-147f-08d9d5a96360
X-MS-TrafficTypeDiagnostic: VI1PR04MB5167:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51673BE02E69FDD3CA6BB8D3B3529@VI1PR04MB5167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	owatKwgEyiBtNdCyDPDrRAQAV/REuZpsAE966cAji0RMaMvRwE/dMEo1TEUxSeSY3RxJw4wkaaQ2eRVmYNzoYw8UJV9lAgKWSd5NMd322ImaS84Od99b7WdB1hGPGx6q8V/I/GJXtXuqIxSmXZ0Gb8kVMKObakqMwhNQUDeCbOCw/R/NxUqKwpFfzFey/mQH+PzTB3zOh0ju8GyYD6xAa1AdtOVACJB4oycePJgAZF2t4IKFnF/3o+eMT6cvdgWuIXqVOEuv1leKKfeZgVw2KhxCLQc4JjhBTbg5AwYsli4MiT1E01K3dgJqnlSd0+jqr43NkzV3RKbR/b0bWHlkfls/IuF2Ol2oUK75CpF3rFIa/vdEX24ST3/jmkA0wIN+pHKcq1MpwSFjcYnAphTYr335csnPDB0js6ra3PX2xm2UPgw5asS224rZZA/WpOfBTubTThvCR6WRayyh82DmrD7GjbsrK9N3KDDgEBwYp5ZQXR7aT6AV2r/MB074Wr8t+RpDpN2xk+5JhQeq4V/oh31LYoQS9kazpB8XDwM4nYf48cd3pY/S+rB2EDSx2oDoMQgIiSLy+MPz1GbkZWFtSoXOVONWTQkO/UGNLUfhKSpN4l0Ce6XkiOaFT3YyAHrAGG/jqA5ICA8wT27YoK4VDVjQwl7KAd7IFjbVfDOHfKIuNS6NaYDbCuC2ZswfhhhgusDvlLnQ3ATzHa7akyX821eolZemZPA56O8VOfJOFFqr/HhqMSILXx78bbc5LAG9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(26005)(316002)(36756003)(31696002)(6506007)(186003)(5660300002)(2906002)(86362001)(2616005)(6486002)(8676002)(83380400001)(4326008)(6512007)(66476007)(54906003)(6916009)(31686004)(66556008)(66946007)(508600001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lo+RVx5dFUtjEPN//JsCtB/QWB81TUhzKk7T5reFlCpytbJHc/DKjTyoW3b1?=
 =?us-ascii?Q?keIbhyP5r/6/YN9t2zVpg+gsRJcmtOyMU3yeTQSxnqiX2gbkE9ewGU6+XcSh?=
 =?us-ascii?Q?7kiF1Q6Y5RLE8ZEZX67R7/hBsxWuPmmYBcfQBXD4rLs9GUm3dCHKoSpA8jLu?=
 =?us-ascii?Q?q1eXbFEdvh8Snu8IMuslZ0jnDaOcefD/BYIwm+IQUFmXZUz25RCwMCzP5huT?=
 =?us-ascii?Q?52TNkJIjAyqlt+AX+kdXfhDYZdCMbS1N9ZfQpqTwvr0KwzF5PnANZLX2SCrb?=
 =?us-ascii?Q?Tpb0vk60fLzXyhvOjD3lK3bQiaCLZmo+Sm1gizyDZIKZsyATkUvA6bW2Raqn?=
 =?us-ascii?Q?qJMWWWX5F9C0D4HFYwcLYAOWdQ3qY+Bfsqgr2YxmZoBeFLhj6K2zK0pQYJD6?=
 =?us-ascii?Q?7XbGNO+gTs7/MMezcJiF1CCsbIZnGYBCL/0JBnetD524lsUKVvM7uP8iFRYL?=
 =?us-ascii?Q?aUYu1gu9XoXS+Yncf/qCFZiEUgnkGrlCmnVByXxnlGKTrhtm3Yh1xIRQLPsE?=
 =?us-ascii?Q?A7jjZMjrYVffR955oSgFKsRrjV0aZxIqPd9UtGMsCrb/m40qYJMdedTHk5Lx?=
 =?us-ascii?Q?X0Qpb+mvxaGwrQxZhgsR7wYS0ctrX6psS9JgzntPhvrcc1oz+8kceKIr9EGJ?=
 =?us-ascii?Q?4RTK1Z8qAKYxoCX55WGsIVYx0nbUdFceQ+UPn0xW8hLZz4FIquaWh7XXMhYt?=
 =?us-ascii?Q?s0p1m5pURtCOWWc30LBJE7AIUVsbqdKOKqwvoGNquJphGFFS/TiQNKN/yYFc?=
 =?us-ascii?Q?dtzrl46aQ+VUtLbHwUcfYlufSe1UuandjPcxolU9DsmixawEo6qyaEVh4avd?=
 =?us-ascii?Q?b6sDNW3itqPJu1avs/cQAWkn2Ye5Je58J/I/9CSvF9Mf6PrsDPh0uPgAEbc4?=
 =?us-ascii?Q?UNgg5yl2dsmwPaRTYm7MHE7/21UsOzK2MfbLMiVSfqs8U3rhXk09TEJmU3b0?=
 =?us-ascii?Q?vG/E2PadMzNcoKsFYKvAsllP10saWad3Qofh1pMG1gwA7Bv0dZ2AROXFpgbG?=
 =?us-ascii?Q?IuF9Z5sOxOPTAhcHLwVFlmdi9G0qirkgDhJfJAWrzNeUJRNOknnwqqA3Tpqm?=
 =?us-ascii?Q?+mEMUkyhgiSAWTFtc9zKWNSERcO2Gj+UHVzyJoi5LyE4xF+V9aFib/7emnFr?=
 =?us-ascii?Q?+nO+m2I/G8GF3yk4HED0JTY+mRbaYcIGCUhDUZGc+P+mL+J0qf+vtp/7Tb2E?=
 =?us-ascii?Q?/C1LCEynoTK4GIfDYGwlvGpRFnCzN/R6/68ELl9CVc5SCCxkv5wlKMg3rda7?=
 =?us-ascii?Q?uPWVn/zYHTEph8vLn8Q08jlt/UwYP4aWOQDLoFb+ztugJdxzuYwWRf+pwzVt?=
 =?us-ascii?Q?o6N6EoBDnggCeEZS3VrjsSLxBVxJSMEF8juejhpzF54p3/HHnrnWI8Ccs1am?=
 =?us-ascii?Q?yzLPm9J+U3JXGSuScSdZuymA+pvYfRSp270KtYUx4i8cqPe+Ayx7+9+EQAZ9?=
 =?us-ascii?Q?rdViCxifv9RxB0jcGOvRlutsMVWFrKTehwzAvYu+6wkirLZGUTrot46H7MOK?=
 =?us-ascii?Q?z1207qrnQ13EXFthD8/aHaYLVj67xPEhxkaypJbws2y+L1sFKBAwWUu+9Tz2?=
 =?us-ascii?Q?RbUsYvMslAi4KZCMlxVohqmK+/K3DayI9BsyIfYdtcrWGzSdbNn38MJCHBkx?=
 =?us-ascii?Q?uS3rcWWn/TgPCM4h2nNjwo8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4362bd33-7722-4b6a-147f-08d9d5a96360
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 08:56:14.4415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuJVm1vhOhb4wDjYoP5SfL82/ecbb/88TLeWJkkjhHTD9/BAL9MzNqwRjiteDEBWPqNy5NO+IIF+kSXPXZ24gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5167

While the problem report was for extreme errors, even smaller ones would
better be avoided: The calculated period to run calibration loops over
can (and usually will) be shorter than the actual time elapsed between
first and last platform timer and TSC reads. Adjust values returned from
the init functions accordingly.

On a Skylake system I've tested this on accuracy (using HPET) went from
detecting in some cases more than 220kHz too high a value to about
=C2=B12kHz. On other systems (or on this system, but with PMTMR) the origin=
al
error range was much smaller, with less (in some cases only very little)
improvement.

Reported-by: James Dingwall <james-xen@dingwall.me.uk>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There's still a time window for the issue to occur between the final
HPET/PMTMR read and the following TSC read. Improving this will be the
subject of yet another patch.

TBD: Accuracy could be slightly further improved by using a (to be
     introduced) rounding variant of muldiv64().
TBD: I'm not entirely sure how useful the conditional is - there
     shouldn't be any inaccuracy from the division when actual equals
     target (upon entry to the conditional), as then the divisor is
     what the original value was just multiplied by. And as per the
     logic in the callers actual can't be smaller than target.
TBD: I'm also no longer sure that the helper function is warranted
     anymore. It started out with more contents, but is now
     effectively only the [conditional] muldiv64() invocation.

I'm afraid I don't see a way to deal with the same issue in init_pit().
In particular the (multiple) specs I have to hand don't make clear
whether the counter would continue counting after having reached zero.
Obviously it wouldn't help to check this on a few systems, as their
behavior could still be implementation specific.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -287,6 +287,23 @@ static char *freq_string(u64 freq)
     return s;
 }
=20
+static uint64_t adjust_elapsed(uint64_t elapsed, uint32_t actual,
+                               uint32_t target)
+{
+    if ( likely(actual > target) )
+    {
+        /*
+         * A (perhaps significant) delay before the last timer read (e.g. =
due
+         * to a SMI or NMI) can lead to (perhaps severe) inaccuracy if not
+         * accounting for the time elapsed beyond the originally calculate=
d
+         * duration of the calibration interval.
+         */
+        elapsed =3D muldiv64(elapsed, target, actual);
+    }
+
+    return elapsed * CALIBRATE_FRAC;
+}
+
 /************************************************************
  * PLATFORM TIMER 1: PROGRAMMABLE INTERVAL TIMER (LEGACY PIT)
  */
@@ -455,7 +472,7 @@ static int64_t __init init_hpet(struct p
     while ( (elapsed =3D hpet_read32(HPET_COUNTER) - count) < target )
         continue;
=20
-    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
+    return adjust_elapsed(rdtsc_ordered() - start, elapsed, target);
 }
=20
 static void resume_hpet(struct platform_timesource *pts)
@@ -505,7 +522,7 @@ static s64 __init init_pmtimer(struct pl
     while ( (elapsed =3D (inl(pmtmr_ioport) & mask) - count) < target )
         continue;
=20
-    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
+    return adjust_elapsed(rdtsc_ordered() - start, elapsed, target);
 }
=20
 static struct platform_timesource __initdata plt_pmtimer =3D


