Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A046D0301
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516617.801026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqMu-0005W6-22; Thu, 30 Mar 2023 11:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516617.801026; Thu, 30 Mar 2023 11:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqMt-0005Tt-TZ; Thu, 30 Mar 2023 11:22:59 +0000
Received: by outflank-mailman (input) for mailman id 516617;
 Thu, 30 Mar 2023 11:22:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqMs-0005Tl-3z
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:22:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37f22ab6-ceed-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 13:22:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8214.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 11:22:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:22:54 +0000
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
X-Inumbo-ID: 37f22ab6-ceed-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeSasK5IUGjXX2NhcIpNgUzAFWPfvHxrysBwySy8AIBdci+TQkCjm+/Y2Wmy3EgTB1C7RWG/+cfz0k7GJsz/eRf+0ElLyrl5mO4uOeKrUOId6g1U7QAwov+EaAXZpsaMIoaY0sRerfee2im9R8r0kvUyvYvgl/RHPgWcFXH5OYllJUmwqJfZU+Icbt/5AqxClKXwpouxC7oIGldrEmUgtHwSuJwhykrNP+433eluVh1NTYE+jbDMsqqWL45Y+9ZD9OGz68klsQOoZBLTNM6QAWmBgQei3LPJeVwhxx7BtVHSyC7A0JtyyPbI2nl+HxAO308UtC9a4TeFjSRBaOqcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryMbBfLypQwN7ZN7lZhfYDuGe0FsQQsKOA5UEThb2/I=;
 b=DIxnDOpKa+xjXOdPmFyo1/NEhLNsqPzZxueOq4PvoykquAuflaUnHquIZYYh1grLiEoVTJOBRXwNZZXckTEAAGqugOtvg6AyNWTFgYzWOuj/iZv7MCtYfoyn1oaRuSfoLAv2FKii/QTHGH1IXmG31ffZdtfaLV9JGEp3PSQwFO9Bou5ArkL3k+3VOVSMls5qG3Onr8XrgUc8quPvel/nvLt22/GyunZNBMK7pg1H9AO2TrS8XCXOjLmS++DvqN0aHKn5HYd1zexSySyIZrGuey5T0ICAfKmBi5amMg031gbBr8SiU46AczJoWZRmrtFx5qkf2KXoWTuBOUtLI6y2Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryMbBfLypQwN7ZN7lZhfYDuGe0FsQQsKOA5UEThb2/I=;
 b=5flajeqzCxJfClevyDmG5dahWM6ivddNaJOjU3VXXtIl9N32wofugbrqzVCF03eMQa1dAf7w03zVkWHMdbkxCKZ27sVZW6k4a90kUejBusL1gu4CaqiS9bb7HIAegiRS2q5LUYtaIjAKX8ziYn0bUffk+TeQumSO+2gzdQbstWwPeOpKvRk+VHdZq2sEHUFNxxYF2LWvP8Wy0ukdn9MGgFojjbLeZa5ZZhHlzgX1OX5samlzSzNlZjOQlkw28tpBr5c6VjIZSAB+07rVr9ZSHT0ACRF2jG0Ib74rhSyq4NMWTKkH78xdHuZ8d/0ha91wACVUhk3+DLA4lQYVfVBbvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
Date: Thu, 30 Mar 2023 13:22:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/13] x86: assorted shadow mode adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbf8401-172f-451f-6ebe-08db31111adb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NfMv4H9fET3LEElcgYIziMcPdBBGVL/4nNy1Zu7PONA8e+Juoi7KI1PzFIRZDgOX81Ih70z2vMH4yl8XeQxJdF2S1x0lMpTMuAak5fIEcul60CpWiV4Ir3ka5OhBZUmSSlwLc4A+7sOZy4tUaeTwIghTE5/N4b6EhVsnpAaxxU5JEdlHXtesGvkxYCAPY6ym+3UyDhynHeQaib9K+8s4ESyJE4sPn06879+mQbnnVXBl5PQ5D7FYpug91cG7cJeHQ1/NtJzIMufMLsS+NUqEc0u3eFrvQYC1Zr7ANSXfkGBRHFpo5+0PREstCWmDsHtnkkkKvsR0xp1LU//cxwRkN0qisC3N5jvUgE5GSgVaMHiwOsWTMxLxnfasgapS+eZaQ1lWoWr3x9WtsZo6RQfWW0Pp8/tSZRR0SgCE/VbA5rpCuHqf7OaebKdY5+1guQQvQRuDU+Mrb6CSrBjY16JmxJgUJ1UYZFoGVijBg5HWxrFd50HaN+LHZS9pONHIlmT2bGxGV6BqViL1WwBifO16JiBg6CePyS9JvrQCCXQKL2aGItg96Kr18n0zYzKZ0A3yf/sX6PRw2ATLojMXqpXC15hGdAY3CG0a/5w0sExb98M0T7UsY6j9udbmbJW+FYZKdOKhbPIf1+0KOLoLufa8qA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199021)(2616005)(186003)(83380400001)(6486002)(478600001)(26005)(316002)(6512007)(54906003)(2906002)(6506007)(36756003)(5660300002)(6916009)(38100700002)(8936002)(66476007)(66946007)(66556008)(41300700001)(31696002)(8676002)(86362001)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHYvUTd5eUsyU0tZb0RpRlVzR0cwTE9URXRVMlEzc1BxbjZiN2huUDZNVmtw?=
 =?utf-8?B?SFRXQ0F2WE1ZNTRnUHEwL3JYSVo5TU5BUTFOYWJlY3RsTWZQRHF3eTdpVThz?=
 =?utf-8?B?akVyWUVJaXlIcnc2OEF1M0xBK0l5OXVhL0YvcFJtV2ZvNXA5eGpKTWFOUFcy?=
 =?utf-8?B?YnRMbHNLTzFHb2NsejVIc0lPNVdhRW51V1hiVW9RL0c5VGUwZGdSc0pESWs3?=
 =?utf-8?B?MUZpYk00RlhMaEdNSGsyMWVaZlJNRXRDenRaRWR3cnk1dXNUb1l5ZEI0aGNl?=
 =?utf-8?B?aUdkTDIvWml0NUNhdmViaG1iSXNoUmk3VFBqZnBoSnQvU2xaTUxGeHAzSkVp?=
 =?utf-8?B?dUxrODhMYkdIRGRpMXJTekZtWnNJRWkvb3pRYzBlUENCUlFuSUJnR01qY3hF?=
 =?utf-8?B?bXV5VHBlQ28zUFRuNU5ubkk5V1NoUm9YZ1BDOGRnOEZrM1V0WFpiUC9OYnJy?=
 =?utf-8?B?SURIdkROSWpKRlJRSVJNS3RNcGIwSjNwL3dCVUdiakN0dDZhUTdsNzF0NUdO?=
 =?utf-8?B?L2VnMU5xZE9MeUdFUWtGbEo1bk1tb25vaDJpQStDbm11UDRoYmJzSXdQV000?=
 =?utf-8?B?YkZkN0Uxb0MyOEljZkRHQklBTWhUZ3BLakJaL1prckFBckpUSHVXVEVHUnJU?=
 =?utf-8?B?RkRGN2liV2tycVVwT3JQR3lLN1ptM3dBSm1heStCbDBNNjlNRzhqVlczN3dv?=
 =?utf-8?B?VHlpRkt3djVXRVAyVG5ZcklBQlYza0t1MWpMYkpSc0ZTbExFRkhCQmpqK0lx?=
 =?utf-8?B?UXdCa1hZOUJ6clhUY1lsbzgzUlN1RXZXZlM3OEFwUWF0TzF6dGJ0Nm1MbldM?=
 =?utf-8?B?VHZ6YlI4cUNsT3hKYXd6YUlYWGJ5ZVhsNHFMU0I5NXdhMCtnVFVXZ0Z5QldR?=
 =?utf-8?B?TmNLdlVFK213RnFmTDMyc1lCeUVMRGRxYzFuZDhpVFludjhmaVhDNm1WVWc2?=
 =?utf-8?B?Mm1BeHVNb2gvMU5pVmg0WUN5RWN2OTZrVVplYXByd3lVRU1vaTNuanVkWlJM?=
 =?utf-8?B?cFdOUjRSeENJallGSXJvTHJjK0sxNnVLZCtaZFVTbWVVNGJBVnNGKzd0SlBj?=
 =?utf-8?B?ZjIrSUhlUGpvcXJTZmYyc3RnRzlmQ2s2eXZPb1pPMHE5Mmo3ckRTMUJLOXNM?=
 =?utf-8?B?YzNYd1JaMCtLWmQrZ0JxelZ0SzEyQ0hWWVR3TG9iOWdIZzZuNEpBbUZKUzZH?=
 =?utf-8?B?VjNzZU0wY2RHa0pYUGZDZnl6eG9Ick94WE10bHZiNDEySVVONGkvUVNtTHpo?=
 =?utf-8?B?SHdMTVc2RldHWGdhaW9CdGNmRmUrUHNwd2xkcjExWmVEek5wd3hSSXFPbmQy?=
 =?utf-8?B?aGYvcW04WUN2UTdpejJ4dHB6R3g3YjlBVFdVS253QnF2K2dGbWxJRDNtYTd6?=
 =?utf-8?B?a29YUFBUZWgwb0lSeS9tNkRvNXF1cWNBQ2dxRW0ydlZmS3pucGUxTXkxNDJ1?=
 =?utf-8?B?clErZjluQm4xdHR4UkJLUGlEZ1VjSkJ0djlyY01TcUNtaFhXRzNYWEkyVUYz?=
 =?utf-8?B?b1JXazZDcTk4T0FkaTRySDJQT3ZCUGFlUzdxQUg4OTBEZ1dUUW5UUFFCSVMw?=
 =?utf-8?B?am0xdFZkVnVaaEJ0WXIzQWdVNWloL0F1YmRJcjFuT0l4WUV2SENpVWlwTit6?=
 =?utf-8?B?RG5EWWVUaEJBS3JPT0w3bTdGQnRjUWRERlk2M3hFeDJwbG9pRXZFWkZkQXc4?=
 =?utf-8?B?MUcrblQwYmIwUGJSbS9JMUh4NDhsSGxkU1NEeEc5MzFMcnJmOW5FeEpKdVNC?=
 =?utf-8?B?V1dZRDF0S2tkemZDbXhtb2w4MEVRQzJ5enZNZzMxUElZMjd6c3VvREwwU0Iy?=
 =?utf-8?B?d21adjJxTVlTL0YxK0YwaGhUd04vTkJQeFFxT0NQd0l5RmhJZzRCWlB2VXBx?=
 =?utf-8?B?Y2YyTTNmSCtMZlozaCtRTCtUbjdYTWcvV2hHaC90QXNFSVZZWUlzU2hwZnBt?=
 =?utf-8?B?bWhRVTlJZjk1ZENRNysyYXFMT0JlNGhxZEw2Mnk2RFJjbHZhWW9iUU01Y0RK?=
 =?utf-8?B?NXlKVzhXdjN2d2FoUDBKSTdNcy9qTnhaczBHdXQ3MTBoQ3JFQmFpUnc3dmFj?=
 =?utf-8?B?eFhCNG5mQUJsaWlFNFRtT3l4KyttOFVpUVBTTkJCOUR1V3k4bWRvazVwbWZU?=
 =?utf-8?Q?5SaZmvZAW/59tzHNKM2rB6dlZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbf8401-172f-451f-6ebe-08db31111adb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:22:53.8974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFW+Ya/zSYRtEx9PWLBCudfHNp40rmywpaxnIgdqDYJteVdPooCC4vfXldEZJRJRfqCOq71Fm92PEWnSXLMmYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8214

This is kind of fallout from XSA-427 investigations, partly related to
there having been a more intrusive first approach.

Most patches aren't really dependent upon one another, so can probably
go in independently (as they get acked).

A few patches from v1 went in, but there are also three new patches in
v2. See individual patches for what has changed (in response to review
comments).

01: rename SHADOW_FOREACH_L<N>E() to FOREACH_PRESENT_L<N>E()
02: drop redundant present bit checks from SHADOW_FOREACH_L<N>E() "bodies"
03: reduce explicit log-dirty recording for HVM
04: call sh_update_cr3() directly from sh_page_fault()
05: don't generate bogus "domain dying" trace entry from sh_page_fault()
06: use lighter weight mode checks
07: move OOS functions to their own file
08: sh_rm_write_access_from_sl1p() is HVM-only
09: drop is_hvm_...() where easily possible
10: make monitor table create/destroy more consistent
11: vCPU-s never have "no mode"
12: "monitor table" is a HVM-only concept
13: adjust monitor table prealloc amount

Jan

