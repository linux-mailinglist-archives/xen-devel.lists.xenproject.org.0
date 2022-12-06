Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C20A644238
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454718.712253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WEP-0002YL-NP; Tue, 06 Dec 2022 11:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454718.712253; Tue, 06 Dec 2022 11:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WEP-0002Ve-Iq; Tue, 06 Dec 2022 11:35:25 +0000
Received: by outflank-mailman (input) for mailman id 454718;
 Tue, 06 Dec 2022 11:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2WEO-0002VX-C8
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:35:24 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10cb1380-755a-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 12:35:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7408.eurprd04.prod.outlook.com (2603:10a6:800:1b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 6 Dec
 2022 11:35:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:35:20 +0000
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
X-Inumbo-ID: 10cb1380-755a-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TN88ulWReG57cIBdspCxfZmZ4nsNR3hfALw+iJ0uI0GcIo93fspzYg7fmWS1rmCzwPOernbW7f3y6dhZCWzAGRm/VzO3ih3UF1Gm1WJbH1C1z1bh0ZNLEUST+1jPW735eKk05m/5ZH2M0odKYn6dAQb4sl3zI6DGeH7F0RHWxGMRGKrFsn/KOtSAf/xIi087NclPh0v7rZRufPIyz3YZrtkY5XfWSKP6sF5nf4D+vnDxjr0GKG0LTr8uxxMPquhHDKQNA+g9ijpD4+bKMkNyXo3ht21XmRL3mUtJnq6iVZsxsJQcqy1bh/QSz2XRlPp+3eMHFAD6rMRE4E49R1JK1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnVwvD+eJz1Fx52kASVUIyFemFrwo6Ora9AstzYyLPM=;
 b=QTZG5CyfHYpAlfyEw/JvdZhNQ3vLLhlplDxjPI53/jPq5BHLld3ZYHQtOimXkgZSLGOLuaOn8q3dVntVc8fBsMAyhS/xrVrMrH7eAcr4MlLBQ2kDESZFCwLvUTzpyofPRNDKydLkoyT4PC0lDr+rFQO15wUtv4Qg4bhgTH2QWQjn3g6HBmzbFnnvWUWp/vUpmYFATAiiVtvGrdpiBAQx4up5JktakSnQAlxks4CpjRF5V3aJnca17vXs23XVOFKB2UbcstHFHsAXpQFI7S40TzvTvl5wINYsrHgBfY3HK6hccw1sUeY7L07Uj/BTdtHlDsQwhlk/8DGlkSFaEQ0pig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnVwvD+eJz1Fx52kASVUIyFemFrwo6Ora9AstzYyLPM=;
 b=x9ea2ErdVwqAzaa3ZloKlNAhlv/pCJq9qAI1AD8AfgkUn4YDdNhjs0lXPTEyNMbYF+6ID2Vq6lQLkyODPnMq/piK0POjbZCW685dj8Iwc+u2sZ6jL/ntMyxtmncqhCvUDrRugR2Ty6Vcqg//TCG7mlDReVqyv2TIvhLSXOtbixlaj14ED9YaF9VQXITPHqpnNX+U93Q9sQEOL1IjEPVQvz2CcAB5epG2r1Y08ayZChidWFb31JJuQ/U6ReWxfavrCNwBEK7YsJwQyoEdhKjJd8XnB0CqrBCSuvJhNATAqMZxDSSg/qaCwEkOgZgGiQv3AwtS0v5HyBxY9GAwWo/rqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a06b44f-533b-1975-93ce-60937f19f8d2@suse.com>
Date: Tue, 6 Dec 2022 12:35:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 6/8] x86: Derive XEN_MSR_PAT from its individual entries
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <5ddd32a453b098f277f2d4aa9e044a40183d4bff.1670300446.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5ddd32a453b098f277f2d4aa9e044a40183d4bff.1670300446.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3eaf93-d48a-4b35-6122-08dad77df4d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2asHdungWvVKMlC1VIYkJv1bJtfRwohZIxNmwH1aykNxCNpz5cEQ3aU60yHZb5tM6wwqIrNF6+26S7ZPUXXr7WXRZ1rscj11kLX249I7+7F7QXhVi573+OaZDckeiaBCuQ6qywAypxuOAwiNy+YL3tOSBYjbUUB1/1mJdy5uwDjbgL8B+Z76bIymPYsnzPazLAbiVxA4dS47IVb+YdTt5xewufAcicedpMv+Z8bVAcVRuQlIrfTM/OR5/QIwnHrEyNgxwFcJ5IcK1RnMLDQ7QCqvrjv+1zW5tlRl9pYVCSWAECEtqzWM/cIjsWCqJ8o6s114W0v1fdb9+kAalz6y0mcSrf54zusa95WgC9vyn0jirH12eQqLzNeHRIwk4RuGWHDO0y1AWGP61CjDR3xzX1tKJtgir8Vc792olyhhIyDj5OL/CmrxvRNkBEGf/Ok6yuk88J1zRbd+w5JCPjW0A+I7QTY4bkcKgQxl+uYiJeCCqOSIhMZAGoh74djSN8G513Zo2B+bcprkKJPn9KyT4KqNEvacPOMQ7B2hxB1HOzw1Xpi5N6rw7beK8VOgJso+DSHXrL9t20r8CWwMFQCTHBqC8Ng5bspYAuCrmKPU9/WskI662Z7Y04pbL6vLa431cEWFjwJAC8f9FLPuu9oO/7ZNTV/QKV+9KzbPToYutsZpqx4OjngDVSiYLC4mVXPoSbSdRXCB+OfZHuawlNloKkRRfx8/H62VcWKARKklq3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199015)(86362001)(31696002)(6486002)(53546011)(478600001)(6506007)(36756003)(6512007)(26005)(5660300002)(41300700001)(8936002)(54906003)(2906002)(6916009)(66556008)(66476007)(66946007)(8676002)(316002)(4326008)(186003)(38100700002)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUgvMzBXWnZpaEREVW0rM1BZSTFVbU5NTENWL1htdlR3WWZSZ2JaZHp2N09H?=
 =?utf-8?B?Q2pzUEtsNzNXMlU5T2FSWWlycGJqd2NUdSswZ3p6UDUwK01WRFQwSWFPWkhK?=
 =?utf-8?B?UFFvMEJiQi9HWmRUbnFmbWZOZjJNako5aGs1WmcxcC9BNVRlZXF4dzh1eUhj?=
 =?utf-8?B?MXpmK2NpV0xXMnZsOFRSYWNaM05EaEVZUUliZmpMSHcxUUUyMzFoWnlFU1lh?=
 =?utf-8?B?YzBYTkIyN0FFQllBckh3dmgwNVFWSzlKTWhwYk9OUFFCbzJFcmt2ZWVXUGtC?=
 =?utf-8?B?cHFQVDNFek5uRTJmNlZ0SkxzUk92dGxUbTdkVW1WUWdjRGJZTUFXMHpoNG1m?=
 =?utf-8?B?L0l0TWYxVnRPMkJ1dlFtc2d3M3hZV3BLRkNwNCswZjR1NGZDbksxNkhWUDhX?=
 =?utf-8?B?RFdCSFB6NDJSbmo0WDZyUGtZb0pZeW9iRGFSanB6S0dYN0JqajFCTlB4QzhN?=
 =?utf-8?B?Mi9rcWUrZEFYSVAybE43enN2R3g0bmNtWlR0dDNGK0hWZFhUYkVQZnNKZWlE?=
 =?utf-8?B?aW1SN042WCtUUzM4YVZma1dlWUVvL3BSNDZTRG94TmR1YTlRYWEwdTBURFJL?=
 =?utf-8?B?L0c5MFNsQ1QwakN2TThWVHhXTUJRQ0pGVVBOTitMQjdZL09BRG1Ca3puOG1n?=
 =?utf-8?B?MGU5QkdrcFJaT3FsMGs1b1hZczNGWEswZk9WT1A2N2ZOOW53aXFwMFBpMnBw?=
 =?utf-8?B?TzlIdFlDUkRFdnY4STBvdWwvM1dlU041NWRWSExsajlYVkhnU1RzOFJTMHo1?=
 =?utf-8?B?MjBFTnQ0bHlMWGVxbWVUWFJhYjlLSDUzQUpsTlNkZ0V2Q0NBcnpRWkNjNnNK?=
 =?utf-8?B?YVhJR3A4UnlEZFZJSjkrTzVqV05TQWliOElnZmhneGhFV2lYNjF1cW1idWN2?=
 =?utf-8?B?Q3ZBMDJxdWZUdGZCd3NXZFNvQk12NE1xa0RhR0hVSHZlWitzOUc4cXFRME1Y?=
 =?utf-8?B?cVhSUTRqSXErL3E4WnFVS0NuRDBxSktYbU1BSWVWNkk5VGhpazZrYWxYN3J5?=
 =?utf-8?B?T2JXRjJ6TW1xTEFyQ2MzUE5WcmVQb29Rd1VEN2ZZSk1VczNrQUgxZ2ozSUw0?=
 =?utf-8?B?MFp6R1hDZmRscjFYRGhpNnBmcGFHTGdqME9vYjU4U2JjeklMVkRDemNoU25k?=
 =?utf-8?B?L2lud1ZHOHdBWGdHbkhla0JlMmRkUzRmQXcvLy9ncTJiZldUMFRyMUNWVUJx?=
 =?utf-8?B?dlJVdW5EZ2JPaWJvSG1MN25zSitwNjZUS0g0WUhsNTE0STdLY3lPR2wxSCtC?=
 =?utf-8?B?dEhkQjZnaHFJc1Fkc0ZocnYvd2VXaDNmeUZGRTdtVVNQQUUwcHozTkNqektS?=
 =?utf-8?B?YVBjUnFQVndhcXE1dGtGcTVPdTlJSnBWQk5Na3phRllpbncxN3Y2d3lvVTlX?=
 =?utf-8?B?QUtyc2dzc3o1WHdtbm91Ky9kVTczNVBEaHRkeDBaemdiSGNnTmxBeFlNY1RO?=
 =?utf-8?B?b2swNXd4NnRRRDFLUlZ3YlZ0TUUrbmNQeWRQN0VVZk1JYmxNaktUM3c2L0p5?=
 =?utf-8?B?NGRHSUxQR293QjUvL1VFVmlVd1NRbmE5R2NlT3pSUFNLY1E5L1gxREhtZHhL?=
 =?utf-8?B?T1VETGNMZnk1N3FsSlF1R1d1UzYyNzhUNmg4a1RobERqYVYwL01qdUk3czdq?=
 =?utf-8?B?a1YwVlpONkRzbFA3QTRTd0wwODFaWG5HUVhZMU9mRW9lU1c4WFZVWjcwbSta?=
 =?utf-8?B?ZytURVJ2MHNjOVR4bXFQYmFrbXZBRVp6SUFtNHd3bldaWTFMaUdRZGNCN3pM?=
 =?utf-8?B?Q2doR1QwYTlRcnNSMUNIOFUwb1h3S3JPZkwrV0JZc3U0UWFlNmk2ZXBTb3dw?=
 =?utf-8?B?M2hBeUlLY2Zmd2pkTUFnRmdJQThWaVZVSy80cUlHeXEyL01QeWxGeFlZT2tq?=
 =?utf-8?B?RWtISlUxSklNT0g5VDNGZVBZMFpiRVhmQlZJM2ZIcmQvczJ3QnB1NUQ4eGh6?=
 =?utf-8?B?TDdJWXpCVC92YmZEOGhzOHJxRWpsVzJZQit2Z0Q0ajFlL20wRzNMb2lVUXBO?=
 =?utf-8?B?aFpoT2RtSGx6SUMyTmk3THhQNWxtL25CT2I1TkJkVm1ic2tZZkZFbTVlcnBh?=
 =?utf-8?B?R3drbXlCd25tNTJkTzEzT2dCNEFZdzc1L2p2Y0ZDVTA5aEs3SGR4Ykowa2Zm?=
 =?utf-8?Q?uugnlVka/HaHcxCiAge23jSEc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3eaf93-d48a-4b35-6122-08dad77df4d0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 11:35:20.6246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6M/+lI9Jyj7/3fk3eMduwhhG933TUvoVPVCVoL+/vzb1jx1Qt71yHuOBzTKhSsJQHjI3B5BIvJYfavdiAecETA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7408

On 06.12.2022 05:33, Demi Marie Obenour wrote:
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -92,13 +92,33 @@
>                            X86_EFLAGS_NT|X86_EFLAGS_DF|X86_EFLAGS_IF|    \
>                            X86_EFLAGS_TF)
>  
> +/* Individual entries in IA32_CR_PAT */
> +#define MSR_PAT_UC  _AC(0x00, ULL)
> +#define MSR_PAT_WC  _AC(0x01, ULL)
> +#define MSR_PAT_RESERVED_1  _AC(0x02, ULL)
> +#define MSR_PAT_RESERVED_2  _AC(0x03, ULL)
> +#define MSR_PAT_WT  _AC(0x04, ULL)
> +#define MSR_PAT_WP  _AC(0x05, ULL)
> +#define MSR_PAT_WB  _AC(0x06, ULL)
> +#define MSR_PAT_UCM _AC(0x07, ULL)

This would be the at least 4th instance of these constants in our tree
(see xen/arch/x86/include/asm/mtrr.h, xen/include/public/domctl.h, and
xen/include/public/hvm/dm_op.h). Since they're part of the public
interface, I'm inclined to suggest to use those. If that faces
opposition, the next best approach would apparently be to move mtrr.h's
into x86-defns.h (including the largely identical MTRR values), thus
then also allowing hvmloader sources (which currently open-code the
MTRR values in cacheattr.c).

>  /*
>   * Host IA32_CR_PAT value to cover all memory types.  This is not the default
>   * MSR_PAT value, and is an ABI with PV guests.
>   */
> -#define XEN_MSR_PAT _AC(0x050100070406, ULL)
> +#define XEN_MSR_PAT (MSR_PAT_WB  << 0x00 | \
> +                     MSR_PAT_WT  << 0x08 | \
> +                     MSR_PAT_UCM << 0x10 | \
> +                     MSR_PAT_UC  << 0x18 | \
> +                     MSR_PAT_WC  << 0x20 | \
> +                     MSR_PAT_WP  << 0x28 | \
> +                     MSR_PAT_UC  << 0x30 | \
> +                     MSR_PAT_UC  << 0x38 | \
> +                     0)
>  
>  #ifndef __ASSEMBLY__
> +_Static_assert(XEN_MSR_PAT == 0x050100070406ULL,
> +               "wrong XEN_MSR_PAT breaks PV guests");

I'm afraid this won't compile on all gcc versions we support; see
xen/include/xen/lib.h's conditional use thereof for BUILD_BUG_ON().
You really want to use BUILD_BUG_ON() here instead of partly open-
coding it. (Yes, it requires to be put where a statement can be
put, not just a declaration, but the check doesn't strictly need
to live in a header file, so that's reasonably easy to accommodate
for.)

Jan

