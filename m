Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D868513911
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 17:53:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316664.535648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk6SM-0007NA-85; Thu, 28 Apr 2022 15:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316664.535648; Thu, 28 Apr 2022 15:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk6SM-0007LE-5B; Thu, 28 Apr 2022 15:53:26 +0000
Received: by outflank-mailman (input) for mailman id 316664;
 Thu, 28 Apr 2022 15:53:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nk6SK-0007L8-RR
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 15:53:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55429a5c-c70b-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 17:53:23 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-HEeXGrkwO9S8Ud3w0c6Hxg-2; Thu, 28 Apr 2022 17:53:22 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6135.eurprd04.prod.outlook.com (2603:10a6:20b:bf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 15:53:19 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 15:53:19 +0000
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
X-Inumbo-ID: 55429a5c-c70b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651161203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ld1CduOnWj6XqXB/pFD5zwrf4+DheELc0rJWhZpFBgQ=;
	b=Hv46Ao3VVqxbkC6jvtkjzFykCSdl52wJQVThFF6dvAk8JAnZOlaiX1b1rSME2vSHEOVSxs
	tqdWYRDxwN4bT06dwj3cX+B8H2rxnkjJ0BXVdVn5uJtOO1aqMghdv9C4MBztd33LolV6VW
	fQ1D2axW/wOY9fO+O6WrOCTuymVocUc=
X-MC-Unique: HEeXGrkwO9S8Ud3w0c6Hxg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhllZctf+heGjrAj0aK1pnUN04a1iNzGbYBmMHnDS8+ekKIpUxvXbjrXgVESvTMbS9hxygV3CRmI3HvVG210VjHwfyQogkmNYbp0BQ8oINAH3vqt4XcnBDROqAyqfUdpcTZJ9oXldEq3ImvB9QFxEHCz/N3wc9EMWITlEr32f+VwPOiJxEH2CZ3hBWJ5+A82Uy8K4wqBRQOQbl64tHPahTlN1xXhQ6wzEaf4602rAdLbMLA+9Bs7H0tfO0MoTCEne3gpOeIw5fBTgIAcL+9k9d4I3n77S+j2WDe3BIWY50EBfi8nWWet7/l5K6zuLO3HjwnQuZq5EzB2JdTWVPQ+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ld1CduOnWj6XqXB/pFD5zwrf4+DheELc0rJWhZpFBgQ=;
 b=jBP8zeR9MRXysRpQwJIBukw5ctpczJh/wF02N0qsK65nPm0TR3ijsG+53Mwsf6pOiWxrIRY21/nXca2L1OfENAnzrhgvZlnqV7b5EH+jsCMcpntSYB96j+p1rIYNcHawadBm52+NoTWL2DP4VF0JOacMgk2P3v9uN6Rfb+u0aBL2lzoFGGxTXXLCv1tuwHq89f0k4EQ61HZpXpZn/lT4MlCsHoA8M5K72SS7vwkLF3Y2ke3mIz6Q9cYReodsNVlTyzWwGPeMrEBoRNqEqTE2CEP9Zqvbbqt3YiHEGVeQ695hPkDyrMPIQA5vwdcu7/BJ5hZw+ztvjNjt9XAgj0yZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
Date: Thu, 28 Apr 2022 17:53:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: x86/PV: (lack of) MTRR exposure
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0204.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 512658aa-9ee7-4f54-fee4-08da292f36f9
X-MS-TrafficTypeDiagnostic: AM6PR04MB6135:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB61353D0E8F770CA47F46E48EB3FD9@AM6PR04MB6135.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qyNWVVYiUaKCU4LGOZJjBrNYdSRPWnj7PKb6PSOdzoKxGTcYlek36GzpXQEBc48l5StZpKG4WeYSTb5Ox6OTbswvCDAVagEG69RLCF/RpBTa40pbqOkeHSP+rtfAig3F3JA1bmIpJQ9She81Z7wHIHusowH0PKLjIIg9sU7Tki5Ejt2I2xXzxMdwAM87RokBw6ah9c2N4Wfjsgc7QNZmIe7kVIdMhB3R37HD+DY90glXR9Ndv8ZCiW4IBF6nJJoTYRCviKjhPaffC5SfhbxHIOvR5E0mmFTYY3JM4MefrTJZAEIMkJIpFj4NNWAapRuMJsTbmAX6W+Q1YVN8i1uCbWPxqW4fz2JG0JjCePbpkCIXZHnUHrnG+H9udEarF6Hfc5vGkM5lGmgG5zKZVvKkfgoDKxBCPJv2Szxda+bTq3uqrpK6oOEQMt1W0c0Od9h9a6ZDNvVBeqJRHKBG91FgieFHhp3aMiRuXJrigcfGsXfCHI0iOix1npTpX5ug7mPe3xR1WYtj3JVCW437G5yrwlqyVkyCUW6uXCJw5p3yAhIMstz4MGkolDB8WxKS+BcxLrqtxI+tEFuYTtQo6vCX3txlhdjo40PFbKjFpgaMFjphl9FLAMMaWEgFnEz8XGMzM+VRCcXaaz8Aqv2cML9TgS2SwgdSBNbr8gYiehHvCngKt5jqcv4vum/yysqg80mR4QxoLGNtNZdyZClq/BmpugfNFpyB0edBVFp/TxtzQnJWUJYDWZdORSTtID2fPcBMzLbigoQZaFq64OF3X0wHppKsCQp2AFoiZ1jNHpqP1XWsKzoBSJ5sasbS/2wWB7UY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(36756003)(66946007)(5660300002)(316002)(66476007)(186003)(66556008)(83380400001)(8676002)(4326008)(6916009)(8936002)(54906003)(31686004)(86362001)(2616005)(6486002)(966005)(31696002)(508600001)(38100700002)(26005)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU91ckJoMEhYU3hLQTNmM1p1bnhRQW93OG5VM0Q2L0lHNitoejRQOHQrSGNX?=
 =?utf-8?B?ZHJCcE5OS3lrb2JmQjhDaWVjdGRhb1ZobTBkSnRuK2xtTlZnU3BGYUsxMnUv?=
 =?utf-8?B?RjJJNjZPeExUemdNZmZTY2tsMGR4dDUyUE9zRFZqK0Zob1FudXd0MVRBL3J6?=
 =?utf-8?B?VEJzc0JpQzVqb3B2cTNtNkl6aGZIbUJzYkN2MkxWUEdRM2x0NlQzT01QVjNB?=
 =?utf-8?B?RTRpeVM1OXFObzM1SDN0b3l5d0pyb1RIMVovK3dwYUkrYko0UUxRenh1MjR2?=
 =?utf-8?B?U01iRVBXMzNNSU5xeVkvYWtxM1k2N3N3eWZXTERZcTcwVEI3eklkdnZMcVYx?=
 =?utf-8?B?dEZrNEdZQWhqVzVpaW5TSDNRaE85aWZYRkw0Zm9COVhLd0NrVllYRmlVYm4z?=
 =?utf-8?B?dlhqR0VUMFp6THZVMTZjTmxUT25BOWJZLytWd1VxRE14K2RhS3pYajY5ZTVV?=
 =?utf-8?B?TFdKWU1Ic2pXNmlBV1p3bFVnSDVrWDUrZEJjV2F5T1R0bGJlckcxVzZRVDJ0?=
 =?utf-8?B?R0x6QVphUmtieGg5MVNhL3VHQkNSMUJwMkRMUlgzUythWHdsYlU4SU53QVRY?=
 =?utf-8?B?RlhUb2NZUjRySVNMRFVjM3N3VDcySGJqZkxHOERKTlhUTjdRTEpGVUF2dDNV?=
 =?utf-8?B?VkZkb1J5dlZDRUZrN0xZelEwaFM1UnBIUXVtSzNhNENTVFZiY0R2dkJBVGtq?=
 =?utf-8?B?N29PYUlER00yMUFkNXAwanF0c2RnZUNYRVlMYko4d2oyWk1WNGpmNWxLYUhm?=
 =?utf-8?B?anA1Mk5BVnBubnN5VmdIZkxxN1JmN21Fd3BlS01tQnBPQ3ExVFN6VmYwdGox?=
 =?utf-8?B?c2ZYZmFPdnRZWFg5b0txTDNkNWRYYllkUC9LdE1iem9XNUtyKzR2Tk5GRk1G?=
 =?utf-8?B?SDJ4djZaV0hHaG85TUR0TjdDMEtWQlRsL3M2dlpoeSs2Z0Jid21GTC9WaEI5?=
 =?utf-8?B?dFBKd0w2Yitza0JHa3FPOVYveHdvOU9xWjhBNWl5TXh4TFFvbGhBcFJKR1VG?=
 =?utf-8?B?M2VmeUxCUTBzcTgzcHlVY1dscUdhaFRMOWU5U3M0bkpuTzQ0YTJFRVRUOEgv?=
 =?utf-8?B?Y0psK3hTclYvYkR3YUpNWVdZS1JLbnQ4eEE4VytXTlJybHcrMDVpbDVKNXM3?=
 =?utf-8?B?MHVBaS9nL1VxT0gxMDZVa0hEdWFnd3dDWmRwc2VWZDF2dWlYdXNjOGUwUWZn?=
 =?utf-8?B?Skh3NVYycXVSNm9lUUFCZmJic05OU3lRMkpKd1dDYW9UR0VjYjhVM3k1bWkx?=
 =?utf-8?B?Wnd6NzhjelNKV1RtaDlQNVJhbjNWUGpRTUFpbGVjZHVSZDRHMnFmayswUEpQ?=
 =?utf-8?B?YTA2MGFpS2JEdnlZL09ObHZQVXpWNjhxZTdUWVljMjNhUkRFOGlOcjdlaUJs?=
 =?utf-8?B?RllNNUdYMjVBUVFLSHVLSWxzUnQrMmxzbUxmbEx5OXdJV0lRN3A5Sk0rSjIx?=
 =?utf-8?B?MkZSVG9ZUGwzMjhVQmhhVFVFUU5lb0EvTUNnYXVHUDhJNE5CMS9MTU1jSGR2?=
 =?utf-8?B?RjFKczBEQ0MzaDhIZXRuTmFlckg4NzJPbE90U2t3bU9JMCtiQjlYSVNIVXVm?=
 =?utf-8?B?czBtZWk3RHJlL0ZaeVI4L0NhWmVIYlVsYzBpc0tNZG9WLzU1NmljMGJMcWRY?=
 =?utf-8?B?U29xdXJVNjRnQVB6OFM4ZUtKVTFub2NXUGV0eGx2Z0JndGtkTmJxMEV6TjZ4?=
 =?utf-8?B?VnZ2TkxlR3BTZVNjMUFzZWdPSWJHMDB6RVRDUjdGemdEQ3JLQVhNU2EvSkV1?=
 =?utf-8?B?ZVNqYlVta3pYK0pxMHFxNXZhd0tyRzkxandqMTVyZlUxN0JBYnlNYlpLRE5C?=
 =?utf-8?B?OTViZUg2WE9DSGk0aWJNUnlWVE03dkFIR0g0TVQ3SWhsTjM0NFRnU3lZVGxp?=
 =?utf-8?B?MWNyL3lESWoySjdoeHNyL1VHcmNhQTBJNktkcXE3UUpRVDJCdFlVK0FnMlNj?=
 =?utf-8?B?SWZESU5UdlkvQjAvOVIwK0pzbFBXQ3daZzE3aklzMFczNHBiY3dlZnVpTEJI?=
 =?utf-8?B?a0RJdDdOTjQ0QSs4V2NMVTcvcUthMGc5RTdVQ3MrRDRKU0xOWFZKTksrZjBj?=
 =?utf-8?B?RVdRUTc4djZOVXZUZkJEL1MvSVV4aE9NZm1QbEpKL0d0V0RSOHV5R2dEQ0wx?=
 =?utf-8?B?S0wvYXFVeDQzUEE2R3FaR3JHaDgzU1lyaXZvaVduOThtMFc3dnk1SmZWZ0hr?=
 =?utf-8?B?QmNaMjlLNzg2V2cyYm4vVVg3bzVCUndyZG85UnRTM1UwYTV2dzRlaVBLKyt3?=
 =?utf-8?B?NDBzVTNUdVBtTVhDVjIvUm9lMldkNjdyZ2QzY2tvTHhQZnNnWDVWZ0I0bGNF?=
 =?utf-8?B?WTdxcnFMSjFLKzhJSVZydndmUnlyVlNtRGNnT041dld4UXBGU0NDdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 512658aa-9ee7-4f54-fee4-08da292f36f9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 15:53:18.9995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7o7ZO8TK0UCzE+4XFLjvPmB/GQnEPNfG2j4yaNRPPaH+YUj/rbguPymsF2IhWrB7tJ/uGp3d1KWgkgyf23Esw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6135

Hello,

in the course of analyzing the i915 driver causing boot to fail in
Linux 5.18 I found that Linux, for all the years, has been running
in PV mode as if PAT was (mostly) disabled. This is a result of
them tying PAT initialization to MTRR initialization, while we
offer PAT but not MTRR in CPUID output. This was different before
our moving to CPU featuresets, and as such one could view this
behavior as a regression from that change.

The first question here is whether not exposing MTRR as a feature
was really intended, in particular also for PV Dom0. The XenoLinux
kernel and its forward ports did make use of XENPF_*_memtype to
deal with MTRRs. That's functionality which (maybe for a good
reason) never made it into the pvops kernel. Note that PVH Dom0
does have access to the original settings, as the host values are
used as initial state there.

The next question would be how we could go about improving the
situation. For the particular issue in 5.18 I've found a relatively
simple solution [1] (which also looks to help graphics performance
on other systems, according to my initial observations with using
the change), albeit its simplicity likely means it either is wrong
in some way, or might not be liked for looking hacky and/or abusive.
We can't, for example, simply turn on the MTRR bit in CPUID, as that
would implicitly lead to the kernel trying to write the PAT MSR (if,
see below, it didn't itself zap the bit). We also can't simply
ignore PAT MSR writes, as the kernel won't check whether writes
actually took effect. (All of that did work on top of old Xen
apparently only because xen_init_capabilities() itself also forces
the MTRR feature to off.)

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2022-04/msg02392.html


