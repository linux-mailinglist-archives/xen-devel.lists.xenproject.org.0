Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D21E5AF701
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400116.641761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHj-0007Cg-Pq; Tue, 06 Sep 2022 21:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400116.641761; Tue, 06 Sep 2022 21:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHj-0007A5-Ko; Tue, 06 Sep 2022 21:39:07 +0000
Received: by outflank-mailman (input) for mailman id 400116;
 Tue, 06 Sep 2022 21:39:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgGt-0000Cs-1Y
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:15 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00043.outbound.protection.outlook.com [40.107.0.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d05d552-2dfb-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 17:50:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB3356.eurprd04.prod.outlook.com (2603:10a6:7:8a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 15:50:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 15:50:18 +0000
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
X-Inumbo-ID: 9d05d552-2dfb-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIwv1472R+qR0mhXPVS4RGnUZn0onvYqV4ZO7E7Cf9fssVWklImcJgh7ciacrH6nnK3/BeREG8TsK5Q4EP/x8wWrihJf2zWr1NQOJ3gEkMoDxFKTpyr03XTTdomx5RixvcpN91taYyREJUmSD2GrdrlhFj8RPt6A1SQuX0khdFcWgqbzwD6KEeXZUD9KU7Niw5VW6CtVLUzyYhppPNY9zUltExJq7Sxkzv9OPBECiLMUB2Rx8j0xVhaoNIZIt1BtnGaBf2TBIxwGepv9HolVWRCCn/z1qnW+D7Szf1Hv3FXwbs8obPWnzTh5HzIbhlkR62DaHX+QoBNlvcmpG2705g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vB4j2pxCH2RTjllMuol6WACmZJs5T0m0lZfjkdgonzw=;
 b=ZzF8LffjX9dQGqGmwDT5ZDTcEpL4YkWsAr+vXZ1yIgihGnsQXUhjNAEt5G87E+9N6NfquXPH7OQAP2OlHu7iFe5hab7VUhV338KfMlf0YbNZZquLa7111ZmOxtv04R3PwZVXGdXJVr+RURfAxZyfRYdBUWOPW4et+ehTItXVV0rL8Kc5sImEetnVcz1+q44iDYpaXm42xzg2ljfhLZvVkGwqlu43z8E6lz7/U4D4djoGe+xNKyV1oRuzrP7YgGh+mbIocPKhIDCn70TBKn58ECrCyjRbhzLgyv0x6DDyP8+e/kPzlyOjWDekkANQpGZ5UAi8/6zVDLtVIozzR6u/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vB4j2pxCH2RTjllMuol6WACmZJs5T0m0lZfjkdgonzw=;
 b=C3pTykEAfZ6+RcJulIrEUHpjyPb68eqfjG/mMas1127Kg0nVCX+dF/lb/fxW0ehr2/QhqznsWXyXLdapBPEgZoyxvt4GEAwbHahdrpqwFnWCOnYzOcDqOEOvGdPjin5iKo7zZ05DHNflthegNUsLZJtYlvvDEKPxIiKf1Q6y87+l28gqulW4W7+uFJBAUfXyAnTOVlV8oa29ygkRW9DvwXbsPLJA0lLttK+th2MefxhpGKRFAOfJ8cbKMbFmQ0cCYejU3f7sbdjSIGr7zV5Hx8KYuW+E0pTiqUS1gjNoNcxTL2VSshw4LB4+juNutF15vNSw8j7eK4jMITdnMT7M2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c4a01c6a-38d9-3025-62ad-3dc31f1e7544@suse.com>
Date: Tue, 6 Sep 2022 17:50:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/timer: don't migrate timers away from cpus during
 suspend
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20220906124135.12998-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220906124135.12998-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0402.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d28384f-19fc-4026-39c2-08da901f7f2a
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3356:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fDuL1bf7P6Mjj2kLQwQrgVPWBe5wYmqhSw/6+hZYsxilqghQjJZ93ufmREVEkpjWkIyp1GdKQEmkMXsAJuratUf4mUxq3Y/UphnE/PXmF5+EfOJRt3DD5zbKyT7yXU4vEaeLf9UYdf2fkZtIPrC4eWbTvjAh2jrG1XzeUD3S0Yz7IIRTPj9HhLwM1WcN/3/bdVI5vkDezfd0z19SRDmYGQTFVoVC/d7ve+SCDNN5MobkW18NpxuA4zgyLMLtTo/wuzdRe+Ecq/sk2S1U3XBEU5CUU0jo2f31j8ymaKoTiLzueWE07jc06BIEcJA7shl3m5vJKPMavb8Xm7WJidfVgT5fQmCvyiBmucdbqN1D74CIt1I9AESvtG69iLhZbeZXTuzE+80/T87zmo+KJczrgauOB7QFLlQAfySiMr9yajG0ZbgLbL/uDDd6+7yRFPHk4O3ARd5QIsdac9+WRifI2xxOn6G69xjoyzcow2qCf/Hb0Vm7CeWBurhtPbaUG6WheWFQ5ryJEjsQ4jtz9AqMny9cHQYsXWtVVuZ8B1MLDon3IluoYCeNqBwQ4zqmN03kQb2ysHll3ddP3/gAy4E60MozZRJjXnknoL+TlsB9S3C6A1Q/AZXigiMo7xJ3OrtZg5312ssptwk2BhJVhWUrIYldDUrh/LL1brB9rjVSv/m5P7HknGkshA4aB9m+IGKbUSP+bHDiNjxlrVZfEgZBitGXt6vH+N199xDp3cFU0mdA8zSDIXzZp66R87S7NxqEcHbpPNMGWdSUrLCko/bYZup7XXlKpp1k19GptCEVqb8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(376002)(346002)(366004)(31686004)(53546011)(6666004)(26005)(6512007)(6506007)(41300700001)(2906002)(83380400001)(15650500001)(478600001)(38100700002)(6486002)(36756003)(66556008)(66946007)(37006003)(54906003)(6636002)(316002)(5660300002)(8676002)(6862004)(66476007)(31696002)(86362001)(8936002)(186003)(4326008)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG4rRERyaFN1WGFTRVhTc2pMa2dVdVMwMlNIWjFNQ010UEFCTk84UmZFcWlm?=
 =?utf-8?B?azlvZmM5SG1tMjVZK1ozT3NTZVh6NWErYVRNZHJPanljYWRJdThXZjdzeFcv?=
 =?utf-8?B?dzNwV3dQZDFpL0t5L0lGTEljZEZUYXpTTE5zY1k5REx0dS9GZGhsUXordDhC?=
 =?utf-8?B?NmQrY0JYM3I4RTdpZGUyejY4UmFXbVp0ZHhQdkUxWHRaT2U5WGdkQlpydEJR?=
 =?utf-8?B?RWg1MFlLV3k2SzhUVDdQR1NoTG1aN1ZxU0tpL00zdjhvc0wwQkJVb1pLQTkx?=
 =?utf-8?B?M2RsTGZ6Qytzd0NjbkViRVZFbmFRcXA5Y1A4aWtER3g4Y3ZibnExVHJmaHNi?=
 =?utf-8?B?MGViQWFWV3pjTGhzeHpwSWVkcWRjRGRwRW9zVmh4di9hK0dwRU1rWTUxVElI?=
 =?utf-8?B?UW9TMFI5L2NQb0JWWjduYWhKYWJoWG9Ic09OMnRYK3k2RmVrVnptWjJ0K2hN?=
 =?utf-8?B?RVliUWhBSWs0RElmVEM1KzFHcGdjbkxmcFJoZUN1R0VBVm1kcDlRcmZBYWFm?=
 =?utf-8?B?REpjMXIvQXFHWTFhRkZvTjhhWXRodThLVVpjaEdrVHJHdnpoZVJ2eU9jYkVI?=
 =?utf-8?B?bHl2S3BmcnpRQVMwTUxrTUd2QXAxSW5UYU9zdnM2dUhoMXRZb2ZMMzlWbUtn?=
 =?utf-8?B?N0ZnV3gvQUlvbzh3TG54K2RaNHRMUkJRVlRRSkUwY1dPTmtmWXBzODJLbHVF?=
 =?utf-8?B?elh3WEVCcSsyR1pnQzl2cllaTGZrMlVVY1RoRkRyeGE0NDdVamtZM3JWSjBy?=
 =?utf-8?B?bEpjS1RUNlhXWmRQSEpUV3JaY0U4aS9rUlJMUEJzRVhSc3VvOFVjb3drWUtz?=
 =?utf-8?B?N0ZaTWR2T1RvRXdySzRzNzh1djQ4TnVNUmljazQ1Q2t5S2FPdXk4dWp3V3Ev?=
 =?utf-8?B?WGxpRVErbU5SWjcxWkg0c3laa0t1eWZYTXdwUlhBRmxqVU4wVkV4bXdtamZs?=
 =?utf-8?B?TU5tSjZmM0h4M0dGckRuSjZENUwrc1RWRXRPMEE4TnVxMjQ1SnY4NE9NZTha?=
 =?utf-8?B?WU9NWVA1QmVHTFdrMzlvOFRBZEs3SWo1dUp0UmF5S05WWUFqNGpOMkZybzdw?=
 =?utf-8?B?Z2ZqbldlaVk5aGtTMW03eWpQSENmL2xQRUZJYjIxUVdEdWtsdlM3YzZLU09o?=
 =?utf-8?B?bUpDR0NrUUxiZUUzL1VHbkx3cjd4ZWExWDM5VlBkOWNNOTdkUnhJUzFxMWVm?=
 =?utf-8?B?MVFTV0p1cWc2dDRzR2hZcjJDeFRPaGRwR2dOZVlqcTk1T2dUTFRuazNxMXVZ?=
 =?utf-8?B?NzMzU0JFb3JuYlFxR2t1TjFtaXArTndBc2xLS3pRWHdsbEt2ZGtYdXpyQ0th?=
 =?utf-8?B?dFBob3lCWmZjZlgyeGUyWDVCdFFLcmNuMExRdEs4R2dwa0ZVZDh4MitPWm1W?=
 =?utf-8?B?dGdyQUpXMW9iNHJjaEJha2lNaEdQSjlpTC9HQVJSaXp4cEYxNElreVEzbTBB?=
 =?utf-8?B?TEd0WWxXK3FXUERDMzM0Z05rR1hTN3NBRGFPcndGeml0UGxhZXVad1UvU2FL?=
 =?utf-8?B?MEowZHIwRTZLdUUwMndZdytQMytHUGtkeHJjN2JheGJTQ2VWaEVoZHFHK3pR?=
 =?utf-8?B?RXA2ZlZkeldGQ25sRmMvRlBuYllvYTFpQS9mQVdWRW5GT0N5Ulp0dVA4d0Rx?=
 =?utf-8?B?S09Oa2lEWFgvSzU0M010VG5veVZodHdHQXQxTkF3alQ0RmdsVC9OSktscWZ0?=
 =?utf-8?B?ZWNpQmQ2a0lScGozRHRGRkwydXhBdGN2L21wTlg4Nm1rbldxd1NMR2xOdWta?=
 =?utf-8?B?UklqSGdjaGpwQWQvVzhmT2psRzVrN2YreFhLZE1Sb0dqNXphNDZYbXZ5NUtF?=
 =?utf-8?B?d0pPVFRyZVFNQnEwT2ZxMlQ0RTJhNDRHQkcxOXVjc1g5YUFhcnQrZzZTdkk3?=
 =?utf-8?B?TVUwanZEUDJOcGFwZUFqaTBnY0k3VDRmRUhFSEFJUjhhYTBuUS81RzZtRTBz?=
 =?utf-8?B?anlQdlVxZWNRL0VVMXdjUzBDOG5qQWxvZzhGQWVZNzZvYk0waHcrcDQyZnB2?=
 =?utf-8?B?QlJBMWRNR2p5Vlh6RGd2cGRWYVE2MlRhMVFaVFI1Y3F1aFVLU0dQWjlKUkNP?=
 =?utf-8?B?eW5EYVl5L2FzUHRSZEtwZnNVSmZWVm9OV1BlMTcwcWNrMnlIV1A0eTlsejNS?=
 =?utf-8?Q?78IwbUFCnqOzqUaPC2Pk1EHSL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d28384f-19fc-4026-39c2-08da901f7f2a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 15:50:17.9299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XD2ufk48oBKJvARsiZSsZVMDzYyMtJOaPfIvyw3lEXKvhk8svamA15nwbsLkl5urGgAsSTbk27Ni4Hn7y1ts1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3356

On 06.09.2022 14:41, Juergen Gross wrote:
> During a suspend/resume cycle timers on all cpus but cpu 0 will be
> migrated to cpu 0, as the other cpus are taken down.
> 
> This is problematic in case such a timer is related to a specific vcpu,
> as the vcpus are not migrated to another cpu during suspend (migrating
> them would break cpupools and core scheduling).
> 
> In order to avoid the problems just try to keep the timers on their
> cpus. Only migrate them away in case resume failed. Doing so isn't
> problematic, as any vcpu on a cpu not coming back to life would be
> migrated away, too.

The description fails to make clear what the problem is with a timer
which "is related to a specific vcpu". In principle there's no issue
with such a timer running on an arbitrary CPU. An example of a case
where a problem exists may help. This might then also clarify whether
it wouldn't be better to remove such assumptions from the (few?)
cases where they are made. Plus this might then also clarify why
this appears to be a credit1-specific issue.

Also to me "just try to keep" reads like "best effort", which isn't
what the patch does. I'd like to suggest to drop "just try to" and
maybe further insert "CPU" before "resume".

As to this not being a problem - if there are assumptions on the CPU
a timer runs on, why would this not be the case after resume? Timers
are migrated to random CPUs, and hence it's not very likely that the
vCPU would end up on the same CPU the timer was migrated to. IOW to
me it looks as if this would work only if _all_ APs failed to come
back up, and the system would continue with just the BSP.

Jan

