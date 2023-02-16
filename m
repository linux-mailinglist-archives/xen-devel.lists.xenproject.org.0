Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B672698E05
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 08:48:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496383.767102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSYzp-0004qX-OO; Thu, 16 Feb 2023 07:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496383.767102; Thu, 16 Feb 2023 07:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSYzp-0004nb-LT; Thu, 16 Feb 2023 07:48:01 +0000
Received: by outflank-mailman (input) for mailman id 496383;
 Thu, 16 Feb 2023 07:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSYzn-0004nV-Vo
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 07:47:59 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b22dd62-adce-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 08:47:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9445.eurprd04.prod.outlook.com (2603:10a6:102:2b4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18; Thu, 16 Feb
 2023 07:47:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 07:47:55 +0000
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
X-Inumbo-ID: 3b22dd62-adce-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpzxgHhzDda3ViUNKmamf4hGOoEY4U/9mMuOo9HJgsRAHYrhMazuyXjRwDIshkvCCGCE1b8uNhmA3oZosPQRhAo6ypu7SDrwh5cui2WjIUagqeYwgiThHf8ehZEZhzKuysisB9XShNR25eG/QRgUGcGRyVqzquvkapj/rwPMH/rWCUXr9fiiT+De+kXDdikH+BIgEhPynmbZ708DD/7YUgyh3ai6MLcogPP5+iJog76DBpYvYCoI5oCIKl/SLxhZe7unYsTmC8vJdFMh9KowjHwzOdDPx3RDjCvh0K7xJZUc5DG40e3P6PfjxxPBHhGEZfR8okToVKITzfU2cOHT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8ETtXwk3IN3tu3mdPSVaAcbxc+S7agoQVu+6VvmJRs=;
 b=ZPXqCuTSm5rwu1vl+Z/CEDmo6903TRZiBXY1VcHX5qvmoBHkOTK+yTq6uUAZUO/p4aRjvjsxAdE/NNDSKqt55A+KJDCed+LAgYu14SRPAo8TMrMB5A/+drGyIjihVAk9fhllcsJm+mFOFcONwoAb8R/yoBsEm1Dwi8hu0/DnoWMyDXXTheCKtPphSeHiSwHkb5fOHIY0McnenJXPCJa+0wK/AXgX9YqFshmpM+90k2a/qKVwlizfJ39MAJRFkxXESJcsaPDzbzoak2FRYaT6VJ8k/Q5UKnqchD9em+u3htN7iIYvd0BqtVgxULUIrNIX5+Yeneak4d4GENUdgk8OjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8ETtXwk3IN3tu3mdPSVaAcbxc+S7agoQVu+6VvmJRs=;
 b=qr9CzsN7E77s25Jp64crqgwpXjGZJA+RXxJSMUXHD9/vg1gGZ4+ykn8XGPZ376H9WPAhfey205da2p5gc+O3OpYIGTdumBsP4DPnVLonEI12fbtW9ePOZwQwu+tT5NUGX6T6stZEgoHUJJEmszv4gZcIfC1RvPEs5kek5eSgqfjQijZoxoRFhOA/VagwURR07z5/9V4vA13NezG2+CCrJv55UGFdfGcQv2/sZKvyiCSGvZTX3OqnkwqeTkblC7zKykpLRHadKs0WkH0xbn6iw3/6ltrBOvoEoNZOOqFS2mtrspqJ98HaBetEVboQz0gee0/x7hzX5mfO8R3H5Irvng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da1b0cbc-97be-e04b-d442-7206718cc37f@suse.com>
Date: Thu, 16 Feb 2023 08:47:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/6] common: move standard C fixed width type declarations
 to common header
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
 <862a1076-4be6-79ac-4243-7d690a2f88ca@suse.com>
 <7532fcc4-1e0f-7db6-9538-6dd3fc209521@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7532fcc4-1e0f-7db6-9538-6dd3fc209521@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 37bb13d2-6c27-4575-592a-08db0ff21d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1MxiS50X4ZK6+0Hmfe4avZXOv6To3XPNiyrgBIcYrIcxtDaGV0gxfdvXebxuNdFXz/WIUUYhdIu0ZQq5d4CrmeL9UzOD8OMfVio14aj5srA3KAt520GpyOzh9IdusA3ohqt/9ovyLsgbgidSsKIB25fpsl8eYrQE3W1CQtIDwpu93UB+EXP1/Bj8Jqti/p1ps9cLcd6cW9tlARQXZ3m5BrRYgWsV81HbGVcOJRM19ygfPJ8mF/xytftB2KNgluDIF1XFPDFZiDON/WzCuq7Fx8zss0JVhpBeH7vFhM6Mhvtsc5/1j/IRenWBNMlxYdQM4MqVyUIAEVdqyiyUkDeM5Xfu06xv8IstrxH/RRjSwt7sml2qXDKXe3iw52VbNM5oEBYPjfr0+km65tUic8gxbEbgZop8TdpneSyOgv9ic1H9GMcKGO/LOL825m7v5jovVVcPqXRIUdYWj///TsnRusxIR9DwZecMWapdqFvGkbbcJhzX+/uZCkUs0uhOANI3zJOJcomg5AV8IGQclWngehvVzR2a3w6Q51t3d9nGkncH4maWXJ/mqS2SjGw+9LjSlXeuS6KjqlAtPrRzlREsD4BzPuPAeD0sqkZ+Q4ZRbMxZ7JzgUIqh2ITLXqIGgK1cCzXTPva8tuR+QsYmXkeRnRsmCH0+DsZNH+Y+4KPGQYcgvN1BEhY+ofDROl6h4hiP/6ZrSROStgJq4Lg1aB7EORMkxsU2Mk5eb6TLdWm5sHc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199018)(2906002)(31696002)(36756003)(86362001)(7416002)(26005)(8936002)(2616005)(186003)(5660300002)(6506007)(6486002)(53546011)(31686004)(478600001)(6666004)(41300700001)(38100700002)(66476007)(66556008)(6512007)(4326008)(66946007)(83380400001)(54906003)(8676002)(316002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjQrUlZuSG1pRnJkc2Zlb2ZXZWRxVXhSbXc5Vy9Pdm56RnRsVytzSHV2ZXJx?=
 =?utf-8?B?M2RLdXJ1NXVWa3NDK2NDVjV3b1V4aWN4V2Z3RDB6amMvYklWS0owd3gyUEhu?=
 =?utf-8?B?Uy9LQXBUbm90VFV0cEp1SThQWjdqSm05bWxVR0hQRCtlNmtGT09UY21DOHhz?=
 =?utf-8?B?Vyt5YThHdExueWhLYjMxbUQrS2VuRUJra1FVOTVZT3gzdHUvQVJwVmt2U3I5?=
 =?utf-8?B?NDZ1TmFUWkMvaUFOMThFMkhWZHlBbHc3dUpCTEZ6cVF4QzlpU2oxblRsNm5H?=
 =?utf-8?B?d2V4Rkx5UEtYS3NpZ0p3d0NEZUFlTS9pMFlNcTdVUjEwMWoxZHJUWFlhY1Yx?=
 =?utf-8?B?aGNpaHV0clg3TU15c2Y5bCtNZFpYZFl3VXl1WElQT2c4MFZrR2JVTHlNcFBC?=
 =?utf-8?B?K3B4QTRDQXpBRW5Sd2FOVVpTdFBndU1sUEtWVlhkbmJzUzRIazEwMFZRL2xX?=
 =?utf-8?B?RldnVkNiRi9FYkZRT00yL1EwSW5PTHdITnZBQjJVWGpKTmJJOFFvc1dUVWdi?=
 =?utf-8?B?MFlQNE9YOCtjMVpEcllkVDVvQnVFb2FnRERQY0pHWGV6aVVPRVJyK1dZUjYy?=
 =?utf-8?B?UHJ1NDkwUFJBenlzMmoydjRzK0pIQkdBWi9vZEJrdlJnVVdacTBmUFQvWHZu?=
 =?utf-8?B?Qyt4WXliRjhjNFlTaWtsUFNKZFAvc0piQTF4dGtTVHZ1ZU8yUHd1c01VaXdI?=
 =?utf-8?B?cU1NMk5BenlhNDkrdXlmWkduU3Nhc1NKN0twaDZtTTNwTVF1bGlzZUYyVFNr?=
 =?utf-8?B?NUZGVUZtUlV1a2hGS0tvdmhySU1VOThRUVpnZU9sUXd4N3pvcTRYVUNxcEhh?=
 =?utf-8?B?bHBBWjRYN0ZRRFhTRTR5a01LMWV4SGJwM1A0Wm1lZHBYUDd6QkJ1Z21VajRo?=
 =?utf-8?B?b081YVRJV3pnMUdWMkh2MVF1YzNoSmQ0eTkvNU5hcUZ2T0dVTElQWk42SUh0?=
 =?utf-8?B?WEJSY21iY1JKN3FuV3NBdjZCMFNicWNRYzZhRU90RHhZOXZHeVJhUldDcEVF?=
 =?utf-8?B?QVRYajNDS3c4YnRhdURVSWU3aVF5OUdEemNZRmkvTFhLWkFCSnBvelcyaFRu?=
 =?utf-8?B?ZG1nU3lGRSsxanVhMjA5TDR1eDhFRSs5RHVSaitTNGFPV1lQelJvbWpqYjBQ?=
 =?utf-8?B?N3lYbk5MSjNIdFlNYlJPTWZhUXI1ZEQveDJmbjd6ZUZRUVlQRnFMQVkxN1JF?=
 =?utf-8?B?RVBCZkVGUjJ1Q1lSd2JFYmNDRzJIWFBjMUVMMXNuWVQrNVYxc1M1VElEekxi?=
 =?utf-8?B?N0pFOCtBczh3cGYzSlRZNEtUbldWZ3N2cXZjc0F1WnZqc3dOSzViUHdlV0g4?=
 =?utf-8?B?VjFWQmUrRU5iMHl5TUJJSmwxME9veEdtSHlFemx5eCs4dXBjT2JtanBURUNs?=
 =?utf-8?B?cjVFRFBsUVVRWXg1U0h5Mk1iNVg5aXhXdUtRb2lqVkh6OHNNSFhrTkV3Z2Js?=
 =?utf-8?B?T1ZKZE83eXNrQlRyeXpyVGVlS2p4c1FWMHN5OElWd0Fiek1HSklSL21JY3kw?=
 =?utf-8?B?Mjg5N1puaHVpbHRhUHM1eit1cnhaYWJXaStPSS9wRVdDVGcwWlZKcFpyL29q?=
 =?utf-8?B?cTdsekkzS1FFN2xLVzFENTBTaHFKS1ZWSEhURy9uMTNzK1hQazF4cnRydnVx?=
 =?utf-8?B?ZjIxVDVLZHJSa3VEaHRLZm9oZFRsRXUvUFduV25ZRUlRd3RIa21pSkNxWE1a?=
 =?utf-8?B?SlA1elJ1c3llczJkQzJuc0tSM0xGTnJldEQ4UTJ4OHIyQWNNTEhBS2EzbkIw?=
 =?utf-8?B?RDFtbHBCd2Vnb1BmbDM2MHZvVVAwNEpYTFJReGgzMmdtb0tjeTdqaHk5STlI?=
 =?utf-8?B?WFZvdVREV3B4Slo4RjJmUUdvblFJbTZCbVNINHlHczkzMmE5SlJicURnSnJP?=
 =?utf-8?B?UEp5VDBsWTVzOTd5T2ZvRzc3K2pvSnJWV1dXc0NVYkFrQkJ0eUFYWFJCL3Zn?=
 =?utf-8?B?bE1pMS9TYjRpbGMyTVozdkozSEE4Y05TdjNMSnRSNDlFLzUwNkVEZG83NVph?=
 =?utf-8?B?MDdiZ1crdE5zSjZoOWhseVFWWTBGL3NEa01PRVh2WDUySkViTC9GcmpFUEly?=
 =?utf-8?B?SXIwOHhNUEVOSWhUMitWN0x3YnBndDl2eWxNcHBvUTJtN3JiVWhhOUJBNXpx?=
 =?utf-8?Q?WwfxOJJMdRENCr7gCnwkODDLu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bb13d2-6c27-4575-592a-08db0ff21d21
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 07:47:55.0627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkT4B2x+bAtYgzt6RaIS87uNEFEZmrJi7eCi0mt1mHsdUZ8pdoalCkzy8Y9GSVrnoTuGHmjMwfenbMGkwDZETw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9445

On 15.02.2023 19:54, Andrew Cooper wrote:
> On 09/02/2023 10:38 am, Jan Beulich wrote:
>> Have these in one place, for all architectures to use. Also use the C99
>> types as the "original" ones, and derive the Linux compatible ones
>> (which we're trying to phase out). For __s<N>, seeing that no uses exist
>> anymore, move them to a new Linux compatibility header (as an act of
>> precaution - we don't have any uses of these types right now).
>>
>> Modern compilers supply __{,U}INT<n>_TYPE__ - use those if available.
>> Otherwise fall back to using "mode" attributes, but this can be relied
>> upon only when bytes are 8 bits wide. Should there ever be a port to an
>> architecture not matching this, it would need to define the fixed width
>> types locally by some other means.
> 
> These types were added in GCC 4.5.  It is 12 years old.  We even use a
> newer C standard than this compiler...

A newer C standard? We're using C99, don't we? And Xen, at this point,
continues to build fine with gcc 4.3. Furthermore I for one didn't
check when Clang gained support for these pre-defs ...

> At this point, it is an unreasonable burden to be continuing to support
> compilers this obsolete, not to mention that the mode attributes are
> unreadable to anyone who isn't a GCC developer and clearly unnecessary
> to begin with.

I disagree about the rant regarding mode attributes, but that's secondary.
What I'm really unhappy about is for this work to grow a dependency on the
long-standing question of what to update our tool chain baseline to. This
has been discussed many times, but there was never a concrete proposal on
a policy that we could use not only now, but also going forward. As it
stands I can't help the impression that this is going to remain unresolved
for an extended period of time. But there not being an appropriate
solution to that other issue shouldn't block the work here. Once that one
is resolved (and provided it's then acceptable also on the Clang side),
we could easily drop the mode attribute fallbacks again.

Jan

