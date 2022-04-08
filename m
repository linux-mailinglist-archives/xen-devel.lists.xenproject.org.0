Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E14F8EFB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 09:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301139.513893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncicR-0001Ew-K5; Fri, 08 Apr 2022 07:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301139.513893; Fri, 08 Apr 2022 07:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncicR-0001Cc-GI; Fri, 08 Apr 2022 07:01:19 +0000
Received: by outflank-mailman (input) for mailman id 301139;
 Fri, 08 Apr 2022 07:01:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncicQ-0001CW-KD
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 07:01:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afb8a5ce-b709-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 09:01:17 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-YEft6iqqP2SVmIY70AmwnA-1; Fri, 08 Apr 2022 09:01:15 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by DB6PR0401MB2293.eurprd04.prod.outlook.com (2603:10a6:4:47::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 07:01:14 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 07:01:14 +0000
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
X-Inumbo-ID: afb8a5ce-b709-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649401277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i8Tb+DZM38MOHgaL9OtsGqtYxTFRI9YuIADuuOOfexg=;
	b=O3a/xhi4+GYnlA6vZzCkd5EYrb1WvQPuzOZy4mY1TZpa2xOCo8C9g/6tCmpH+9SdzfGLtJ
	xr7Zvp3hvHO1THcIaAVd7VA/8Fk3f5J38DCc+j8ADiPLOsGWKm+BBnFK1L8t7IXFjTPQTU
	uLJKyN6F3YSsx20/q3zaDtyy0PIczeA=
X-MC-Unique: YEft6iqqP2SVmIY70AmwnA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbbYKXju7PB/yxDZFy68yaq163WcTCacLvHNZywln16OqrjWmmr26Grfi51nUdxi5awfEXnTLdurluyms4Xr6OKHk4KWRWzCrMtSyYOe2C1DKW7A0vWP/ql+D9qfXarxYZ+63PeKLdS4+5URokBsc7cc93htG3X8O9vOSdwV36apjeLVGLA0ytZAvwq+92xAFuGIJULxfd3Qh7W7dvhgFKLHTmIgZvxhFDU7/AOLhsUy0ND9yEWSa+7/okTeGJ67Na1BaOL6G7kHzOhN+qPmiy0Fx4P1kDAbVR857/lEH93MNdGl4SA9mGZ9QikAXFzCIXedO7cp2mtpDHe51oh6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8Tb+DZM38MOHgaL9OtsGqtYxTFRI9YuIADuuOOfexg=;
 b=boeT9/4BFWEWyMy8+mVVa1ZZGjymEwRLfhoO/Z4ypai0jKk9ho0JSINk20Zc52595CK67XvoXcR5a78l8cVD1p4j07XLuOgUFBjQIt0uWpx5rDaYc0nTaUaQBb7ZofpQcxvVlj7yu2Af2M7lZop3PEEuKSfm+DzsJ1SzmD3neBFT2kMydAdpyGZ4V6xq0Dx6mDWfxwWNcqgu7EEhUh4XeiJnYu8TkvKz7EB448xp4FG1cgdDtYKy9zuohOEdFKA8pOuVaPw03+YVKmjLvmwvxYXqTteYRsGH3+or9pFp8jnKuBjboChLFT4CF/0rczUmsnT1jR5l1ub8SqVG8ui70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
Date: Fri, 8 Apr 2022 09:01:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <osstest-169199-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-169199-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0071.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::48) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50da6413-af27-47a4-f97f-08da192d91d5
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2293:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2293960BF3ECBF6773B24B87B3E99@DB6PR0401MB2293.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Whid7LvLiNCFf2XrSASZcXKivn9YUJF3Z2omiRrugcQaAjuOjakBKgVZooXKKJuaaVyjz7lakyXFDz4FWMJyHRqMouVmWqwVn8y35UMBl3ZUMGuhGkEQPqpqOWAfu3dErLSdfJ2Z9A/FaiBUsTH027Kthywpfsr1m3al1zexqv2hitK49KyY2YxJTBTiuz3S1XQAvFXSLvPS/s8ulzICxEN222tf862pxoYtFpPgLhIzAacVS51Dp4+TN6nA3ZdQViwHUx/ruqMrzzVBv4myWTRBEO3lcJ1BAOoHMt1vjgPZDQCBkKCszjz749cCCzVBPg0OcN7y0rzgCeJXGwL1T3O+O+5kE+y4By6sAAI7/tDtGrZhkq4vcQhA14amfmhDK+vcHIxppKWQXwlM97s+UaKFimYc+uktk4Xps/FPmztKHb1epIL9KCSTtLx24I2cgvWa30eVEjRS5oKUMWtORWyC/IBt877Q3sWbLTAOEoeqhPFH5Bog9t8bnafsHNV6Yq2RmfiYD88tH4vPyN/dvpi8hHzr+8QlxJmmbEqLL9giocTWNIfzaVlJtxF8EuVo+NYOb8g8xOhaN4yXVUs3rSag9uozrcKtN1yiaW84Cme6Ji/iBkKC0b8JhgXSqNbhd4giz/w1sHcXTS1eR0GMmgkV+/965KzqQHr9wKL2N67wFf6TV1vJ5upxvq+fy1kSFb1wtbnZCw6p6DUk6P7Sk48Hp9amGQwR258l70vE0o3zVzsqiAleLhumrt8Mo6Iz7ityI0ch+QxH+XnsWElHtEYblMAmiOGqeoDlzUSH9z7VDWIwAqt7xjAP/cdVEhJb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(38100700002)(5660300002)(66556008)(66476007)(8936002)(966005)(186003)(6486002)(31696002)(6512007)(86362001)(2616005)(83380400001)(107886003)(26005)(53546011)(6506007)(6666004)(2906002)(36756003)(316002)(54906003)(6916009)(66946007)(31686004)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MURxRzkrb2xtVlIzbmdiYUd1UFBvWFdNMU5Zak03aldaZkpmMWNwbVRmNFI4?=
 =?utf-8?B?eDRwYmRzVzBZeEpGbkxmanVUNkdESmlMNkplT21ZZCtXSzc5Vk13ZU5INTZT?=
 =?utf-8?B?WDN2eXFnRnFDZ1c0NzhHUFd1YnJ6bnBMVGlyZmtCd1ZHaU5NREc2Ykt0SU90?=
 =?utf-8?B?ZSt3S1ZRL0RCTjVuNjRpVEpNUmhxOVRpRkw4YWtXT0t6SElwK29WK1M5eGVW?=
 =?utf-8?B?SmRobHNOTUdVWnZwdHBjcENaVWs4Q2JwUHdORC9rRXZveHNYTXZ4aUhSdU1q?=
 =?utf-8?B?ZHd3WXUvUWs3V3IwMTE4QWErbTBhYXN3a1RGcS8wU0ZHZDVPa0Q3ekpYcEcy?=
 =?utf-8?B?TGtwdXJjYTh2Y2UvWUZDdFU1T0dkMDV2amNncEN1Y2M4dU0zTXN5VXJ2bXYz?=
 =?utf-8?B?c2k4d3BjeTJmM2pubkZwejRQZ3VXS3RzN2FMT1ZPN3Y0UHVvNzFvdGxXR3VR?=
 =?utf-8?B?dFBpNlV3L1JCU0dCNVkrMlY1MWNkcU13ODNucklxODdDZXZPVm13RmdZUnl6?=
 =?utf-8?B?Sms2dENFemwyY2RYQVJkdkxtMThqZ1F1bnpDdkUxZmVnMW95RFFiQmd0RnVD?=
 =?utf-8?B?aGZDODFabUhoN2VuWHJLYzl4VEJKYzNwK3hpT1hXazJ5QVZ3N040NkQ0WERL?=
 =?utf-8?B?OEVOa1BBdml1Z1BFK3AvMzFKWUtnM0tHMzRuWmgrVS9RNkFXTmdwaG5SQnJO?=
 =?utf-8?B?dmxuVHE5ZWtId0hEa0s3ZE5lK0RxRGVrNWExako2Mlc2dXZRa1VPd3hQZTFS?=
 =?utf-8?B?T3FXcTd2Wm04eXBKYnZuUFZoVk1ESTBkeVRJZjkrMDI2N0dkdDV4Y1hROEVz?=
 =?utf-8?B?N2xNNmhwcFZ6YnRvQmhxMWRWakJiWlFWS3NhMHprTy80eDR0bVdoVktYOFdi?=
 =?utf-8?B?TGlBTi9VTm0rOVhnU3BPL3d0enVYNVRWdkl5TWZZWnNOUTlQcWw2ZWM5ODZV?=
 =?utf-8?B?ZEhITVl2T3pIR0FiU0o0MUxObFhCV1hhQ1RqMFkvWDdVS0ZGTEsybTFDWGN2?=
 =?utf-8?B?djJzZmlrUmliczQrVUJNaEhYR29WUFJIYjNlQXVscTZnSjRuZjErcEoxVmpN?=
 =?utf-8?B?aEpwSU8waHB0RWZKSXNzR1Fhbjl4c2xpa1RTQitvTVJLT3lCS0ZmdEs2Y0d1?=
 =?utf-8?B?dnlpMElobkVFR2VhaGkzbzdncCt2OWRodUlWUldIMkEraE55TldLeURHb3p4?=
 =?utf-8?B?a0pkK01HTk1ZbkUzTFNSdlRvK3FHSGprN0EvMTYyTkhTKzRxV3NnUHRLMXJx?=
 =?utf-8?B?bUFBRmVQY3ZHakU2NVZ1b3lzWXBXRTJtRDNuRHZxdWdGR2tGMlYrZGlBVFVM?=
 =?utf-8?B?Tmd3blRWaVF1VFg0WW9Fa3E3a2hOSkErTTVpa3ROdlhjeHM2OElMWWNsem5N?=
 =?utf-8?B?aVFaV0VxTUFsNThRL2YxT0pnUFl5eGlGdndYNExPRW9Cb3VHeWd5ZFFtOUE4?=
 =?utf-8?B?b1E1dThxWXpFa3RCN2ZnSGpVSFZxM3BqQ0dnT2Z6dmNEYUVDVVVUZmxHQWFZ?=
 =?utf-8?B?RlNFaXN0TWRUWVllc2Y2U0hTQkVFN21kVTRUQy9WVXJJcDFpc2JqTVNZang4?=
 =?utf-8?B?bHRENUh6MzFBb0cxWS9IMnp0UTB1QVluMi9nZkViZFVFVlhMbDBoeVpjZUtH?=
 =?utf-8?B?QVFzQ2ZCc1lUZDNTYjF0bnl1eHlNSE5PQ1d0NlVCV3cxZlk3WE5rNWJWTXFV?=
 =?utf-8?B?QUhKUm85MXY1SURuZzZNV29tenI3MmxZWDdLREJTOUNtR2F6dWVoYjF4NDJq?=
 =?utf-8?B?Z0hYQm1DU0NIUFJjd0ZRWWphMlFnZ2M0d1NhZ2VINHZLbHZ2UWx0WDZlWXMz?=
 =?utf-8?B?c05PVW1pYlc1KzROT1kwZG5DZlduMjYrTlh6S2ZGcmNXcXVRUFF3QWZiUEZM?=
 =?utf-8?B?UUVSVXhHNEFMWXVsOVR3M3NQOHVYeEFRRno5WGkxM2s5d2h0dWVDVU1qKzha?=
 =?utf-8?B?MTc4eVUyRFJEUmt0V1ZjczFzL0dTOU05M3FrWmg1QzgzSUVDRjExSmM2bHdi?=
 =?utf-8?B?NEt2QU9vNk9JKzJZTEpUcmphdkp1eisvV2tieDAweXZ3Q3RqT1h2WWpxcnJi?=
 =?utf-8?B?aTBNT1J1SG9EaFhsMnJSaU02KzdqcE9oR1IrdWpIdGxsL0tvOTljZ3czSXJO?=
 =?utf-8?B?SkpRZGdJUGVRME01MU5UdTFBeVpHR2U1MEF3bUtNYXdNenlLNDRDRndUZGp4?=
 =?utf-8?B?TWdITmNFWEo1cXpZalp3QlMxMWRDMU9VSjJ0a1NKRm5iOWFxYnR4dU5PVzFE?=
 =?utf-8?B?dnhoRk1Ea0FuSHVoRkluTW9tUUUrbWlENDVOVTJtSDViRmNrMERmOXlOdTZ4?=
 =?utf-8?B?S3E5bVJnUkVYdzhHVnJqdXBXUTV5OERBVCtPSERQTFo0QzBMNllydz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50da6413-af27-47a4-f97f-08da192d91d5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 07:01:13.9006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfRSRN18Fnsonfi61MmHpwBAevU50tNMia8CzEtdD/lJccAcZ/9Ku1q8LpleZepWy+y6rjtCOijHqLwcYFrrxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2293

On 07.04.2022 10:45, osstest service owner wrote:
> flight 169199 xen-4.12-testing real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/169199/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 168480

While the subsequent flight passed, I thought I'd still look into
the logs here since the earlier flight had failed too. The state of
the machine when the debug keys were issued is somewhat odd (and
similar to the earlier failure's): 11 of the 56 CPUs try to
acquire (apparently) Dom0's event lock, from evtchn_move_pirqs().
All other CPUs are idle. The test failed because the sole guest
didn't reboot in time. Whether the failure is actually connected to
this apparent lock contention is unclear, though.

One can further see that really all about 70 ECS_PIRQ ports are
bound to vCPU 0 (which makes me wonder about lack of balancing
inside Dom0 itself, but that's unrelated). This means that all
other vCPU-s have nothing at all to do in evtchn_move_pirqs().
Since this moving of pIRQ-s is an optimization (the value of which
has been put under question in the past, iirc), I wonder whether we
shouldn't add a check to the function for the list being empty
prior to actually acquiring the lock. I guess I'll make a patch and
post it as RFC.

And of course in a mostly idle system the other aspect here (again)
is: Why are vCPU-s moved across pCPU-s in the first place? I've
observed (and reported) such seemingly over-aggressive vCPU
migration before, most recently in the context of putting together
'x86: make "dom0_nodes=" work with credit2'. Is there anything that
can be done about this in credit2?

A final, osstest-related question is: Does it make sense to run Dom0
on 56 vCPU-s, one each per pCPU? The bigger a system, the less
useful it looks to me to actually also have a Dom0 as big, when the
purpose of the system is to run guests, not meaningful other
workloads in Dom0. While this is Xen's default (i.e. in the absence
of command line options restricting Dom0), I don't think it's
representing typical use of Xen in the field.

Jan


