Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F1F6F9FCC
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 08:24:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531250.826807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvuI6-0000M3-K4; Mon, 08 May 2023 06:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531250.826807; Mon, 08 May 2023 06:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvuI6-0000Is-H8; Mon, 08 May 2023 06:24:10 +0000
Received: by outflank-mailman (input) for mailman id 531250;
 Mon, 08 May 2023 06:24:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvuI4-0000Im-PA
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 06:24:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eedcf41e-ed68-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 08:24:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Mon, 8 May
 2023 06:24:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 06:24:02 +0000
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
X-Inumbo-ID: eedcf41e-ed68-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/aV0V46Qv1TyEFYvvoOt/ek8QU/netFTfHpRhbqrfXwQ238f4iCNjWY7wEchUlOzfFaT3JR+A3Sa9A1Q7XOcPvmFhgtY3TXfa77sQsHj1XmLfYVnJ6DKLcajFWhw2BNUBBGLcn4zBfhHLHtzXDYSXk9yfSbVZPyZ2eZc6tGyBuqcqoTA+VFMdIf4s3yFBiIWqPEG+CWUEgdUYL9+ASCsyoI4DHAyBK4QmPG2JmRQAUHrDAObMfl4cltc6I4Zb7bKvw4228azL3c5DDim3izJz7fgoZDsa7cjxWUKKBqe5+g/W4SjORPjwq/QrtUgbq4phhGRTLqfMNB5EXmOGXJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JB9+/PxeRHja8l0ODby24uhpNc/UoW2s+UreyHmDFow=;
 b=g3mr+DdHUyu1CVOxwRFaYVHD6Mot7lga4g4pal5aRZxzPVfQ+TGEZu3BOqXOrbN9dG4oEEVfpSEoPTI9kilvKF0LHlxNsSLU43a9T8KJSxCyHBUGi+MoDF0ZP/FodXBKWd4SH7TLz4c+iF3l+StNZAW/CChHjNFlFKw1prqEXQcQ6kD+NCCin4d6cA9QYQx4xlNF7HuFGjx0MnS5k31ZmLFEznwSHbqpJL9f1Ls26+YJOrMfW81Ch/OwjHHnttHGyOeVYyzCq9db0P2o0Oqo/k3VRLISYPL5EV+qxvvB4ISR60mPDLMgERkKd+OquWMMVBX2nEtTnv4fKo+BfOCWIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JB9+/PxeRHja8l0ODby24uhpNc/UoW2s+UreyHmDFow=;
 b=GlMtKBdmCW3UqGm72FyAclReVidKOeqmxOA5lmLbwxgZBBLOGVa+NgRzMr7DnoP0wZ+Z+RzhBG8tgeTsRQTag6ld9EFiKOt2X8pEh/40ZrZF6NE6lSRnHY316IbBhiwPw0gqJnW9vrb3Jh52F8n6ViFq259xDtEtADbjKb8wxnNd4Zs0flGxn864+mh5dj6HXEKSQ6RGzR5Ge90HiJs4tFMmXKlJxPKHNjukoFuJNeuqD/bU2Dc8BSkjQ0gNwThlsBJF9IgqTBTRmRi2KqyOtxaiu90tBEvSB085Sxqz0CsKjns0q65p7OGmO4BTjIeNnyz/TV5FwWiAVCq3XtpAaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c9f8fd2-b60b-5540-00be-87351fec656e@suse.com>
Date: Mon, 8 May 2023 08:23:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH RFC] build: respect top-level .config also for out-of-tree
 hypervisor builds
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <beace0ce-e90b-eb79-4419-03de45ea7360@suse.com>
 <a08f3650-0c81-4873-ae10-f5200f8b7613@perard>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a08f3650-0c81-4873-ae10-f5200f8b7613@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 057f1c76-042e-49ad-7cea-08db4f8cd10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uIbJH/qmN0hxsQdD4g7cCk9cmhSTFCVePkDzprjbXAkvq8WJ7r2nH/PNR5kC24wsVrJaGOrbtu+I0VUrCeb9uJeWYGY8HugJ1PJKsEyV1A0b/PZpPaFXd6EUSIkj+oJylXGS/G6DNFMD/JxLONHJKx1OXfOLohAvBzFKmAanW/X8cPCFRvcM1dnuUt52FEk9WQ36+lCDOEHUnjYDOSclvArt0FNKo914gmOrPMwbRlb0NTB5mF597AmyoEdPMiUGbokUYYEjJq5vRi1jmVzyN61xLtu0REOpfpYRhr2LPff5yYrThDlfLZmEw1obA6Bdb9+bM0Bo5mxlYmIZLoit3EPe/z+X4wD4koUq9qBqhCNuiucyU/VCKXsxMDj5idYdI60EDsfwwkbtmB9WINMNP2vPBAuqmJPJ/GpIB1j6YeSnNjUT7OMoffkvg4rxrbGQoNfIpBz3h7pVUBiH+Fcv4ek0vYPTJ1z23L1OTlitpXj+/wENVsCWWPfBqfObpUkwskNDyj4xVHBv+4Q5aZQBbaz0hqKfbS9RoiRM6CMDnB/eiHWKWr4FRA3tAe/FrG+6t7SSb04hXSjpG2Fu+APuuXuZJt/flyG/ol2h3lGYh2/QCmw9W+Kt1DFqPCAoNpaToitpqXorSt+dvtl01isGuTH60tKIVsYuXoigTBbys7PFjyYLl684jE7uVbGLPalU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(366004)(136003)(346002)(396003)(376002)(451199021)(316002)(2906002)(53546011)(41300700001)(6512007)(66556008)(186003)(6666004)(31696002)(86362001)(66946007)(26005)(6506007)(6916009)(66476007)(36756003)(4326008)(6486002)(31686004)(54906003)(2616005)(478600001)(5660300002)(8936002)(8676002)(38100700002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUttRFNSaG10VjhiY2VHUnYxdDF0TFJIMzQyZjFhNEg0WE1vaTdVY1NtRzYy?=
 =?utf-8?B?WGNBb3NGSU9WZXptQVp2OFpvTzRhNktDaWxPM3MwbHZyWlV5ekswb3I5U0xJ?=
 =?utf-8?B?bktVTnJlRjhxZ3lJV1pmWUVkYlBWWnEyaXg4cENWU3M1SUd0S3lJaCtvY2VY?=
 =?utf-8?B?cGw4aHlCSDFCU05CVllxNC9JYlphZFBMelFKNyt4NFpUU0ZLSHBMcnJlVnVm?=
 =?utf-8?B?MEZqbVp5bUVHdW8xdVhkK09mbU4wdFNYRGo0VDlxQ0xoYzZSa29BM2p3Qi9I?=
 =?utf-8?B?NWVMRjd3eTlvajRtcS9oVmcvOGltWlh4TGN6WmlLMGZTL2QrZFdOakpidWhk?=
 =?utf-8?B?R2NiSFAvL29oL2lPc3psZ1BIeEx0bkVkWnNmYTljK3lIL2kyZXluMEF4Y2J6?=
 =?utf-8?B?YW9XNSt3TVRPMzJkQlVKaitmYnhVWjBXdWRTVlUyd2haZDlGMjFnSVEwRitJ?=
 =?utf-8?B?WHNEcnh5eTVHQ1NkOE9FUUVwcStFeEI3b3ovMUtzamhkcC9kUzdZQXVXT1RO?=
 =?utf-8?B?KytpV2xGSStMbnZGNS80cy9ydEhxVHBjay9yc3o3TVBPczNYMklPaDVBcXc0?=
 =?utf-8?B?YWkxdEl6NWF3ZzdwY0k2VWZCNEJzS0tZczJsQzhXckFhYjczMG1ZaC9GSHZH?=
 =?utf-8?B?SWtnNS9qUmtkZmtDdTJIeE1jOERUWVlzY2MrbGJlVHE5bms1Rm0rcm1nSGwr?=
 =?utf-8?B?NVJmRTBQOWQxYWV2S2g0UHpyU3dhUUh0bmx3Nis3YzNidk15dVg2NHFaMDF6?=
 =?utf-8?B?aEZLeDFUdEYvdGNvdUlWTnNZZHd3end5TUVodnliZlJYeXJmZ0ZRV05jbUty?=
 =?utf-8?B?SUtHTlpiSUlhWk1wNXRMdHh2R3ZwVmJmd1cyZ0kzQ2p0S3BTVUtXbXl0ZW9w?=
 =?utf-8?B?YXFlNEhHN1hraFNxRHZuZmpOZVVvMEtPNGhBbmRGandqanZSYmlhUXRKQnpH?=
 =?utf-8?B?U3dnLzRiVnNXL3I5MFZUUnVLbXgvQlFWNUlvL2xuTjV6WVhIOWpIZll1cWtV?=
 =?utf-8?B?SS9JTG5uRXZyOTdDY0ZTc0ZFSG9pZmZjbXM0bzZTTmVZc0tUYzJ4blZzUHZI?=
 =?utf-8?B?K0pRRlR1cnJZK2RLMTdVUGN4NXlYMHozemRrTmNaeXhETGtjK01hTlh2NTN3?=
 =?utf-8?B?TkczRlpnNGk0K2NHUi9QdlJDZ0EzSDVPdUUwZCs5SGRHNVorbk9JcVl2d2tM?=
 =?utf-8?B?THMvMlBFQjM3L0RCaHVhYmpka0VYdzVnemhwZmFWdlBDK2h4cWcxUU9wMGpr?=
 =?utf-8?B?eW5tZVNKS2h4cVIyc2luZnp4bWxRTUY2UUNmZ20yYU9sTE1IeDE3UlRJYzF3?=
 =?utf-8?B?eVhlTHZmYW5tUTBvdE5MY2F1Q3h2T3Jsc2NjRnM0SmtNR0ZtaDRPQkpRS09S?=
 =?utf-8?B?UW1zem1yRFFMSXBVNnF1eHg4VDNiYW9CbmNzUDFENHJzdHMwRHliSUpGcWhi?=
 =?utf-8?B?by9PUVlRZGlRNGlTWEFJSXl3anNJM3F5K0hOVFNkVis0Ky90OStweCtYOWZ6?=
 =?utf-8?B?SjNQdm04QUJiRG9qeVJWMnpUbE5GZjhoa1ZkQUJranlkT1ZPcG1abHJRVEN2?=
 =?utf-8?B?c2NrY1hubS9nQjIvT1NscFV6dGtTTFQvWjI5aUNJTit6UncwV09sOXZUWEtB?=
 =?utf-8?B?bG5EbHhjYldMaUtYM2I4cjM4Wmw4V200T0wweEllbHhHSXE3RW9JcWIrL0pF?=
 =?utf-8?B?LzNqb29SbFhQMVg0OGYxaURMMFJRT01kdjlIMGNKdHZpZkNlZ2dvVVZNWFIz?=
 =?utf-8?B?N2Z0RUlGdmp1M0lDa3RGT240NldON3YyWlhvWkU0dXFNWnpIL0N6Tm1XSVJM?=
 =?utf-8?B?L2xZc0Q5YUgva09aaGhXTmJWcXRNcVBYYm9jWHd1THp2dnpBRElkZzZ2Z0JS?=
 =?utf-8?B?YkVDd0FabzIzL2JzREpXRk9ab0dDMGNvZ3FxbTA0VEJCV0RWYjRaSUd5M1NF?=
 =?utf-8?B?L1oyc1pEUHhOMVpGY2tzVUVVS0FXTGM0dXFYRTYxUkp3bHh3Yk1TM2RQMXdR?=
 =?utf-8?B?VWs4MTJZSFkrZXNDV2J3bHgrUnRDYUF2OHZabDFFQzZ0MFJ4Tk9Uay9Uck5x?=
 =?utf-8?B?MmpUaEF5K0JmaThwSk5HNVdDZG9NRkdhblpzNW1HWWwvT1oxdWVRbFNrNUhr?=
 =?utf-8?Q?rxqvYBnXSpfVb8jE9XDzRwjPF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057f1c76-042e-49ad-7cea-08db4f8cd10e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 06:24:02.6943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V91gJRFgwlJGW3w/h8jfgC0/wtlGz7NaYYrDfziSLMS7BCTn658Z+xVxII8ZL6Vy+W4uGHt9t2wyBEFh9GXOLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 05.05.2023 18:08, Anthony PERARD wrote:
> On Wed, Mar 15, 2023 at 03:58:59PM +0100, Jan Beulich wrote:
>> With in-tree builds Config.mk includes a .config file (if present) from
>> the top-level directory. Similar functionality is wanted with out-of-
>> tree builds. Yet the concept of "top-level directory" becomes fuzzy in
>> that case, because there is not really a requirement to have identical
>> top-level directory structure in the output tree; in fact there's no
>> need for anything top-level-ish there. Look for such a .config, but only
>> if the tree layout matches (read: if the directory we're building in is
>> named "xen").
> 
> Well, as long as the "xen/" part of the repository is the only build
> system to be able to build out-of-srctree, there isn't going to be a
> top-level .config possible in the build tree, as such .config will be
> outside of the build tree. Reading outside of the build tree or source
> tree might be problematic.
> 
> It's a possibility that some project might want to just build the
> hypervisor, and they happened to name the build tree "xen", but they
> also have a ".config" use for something else. Kconfig is using ".config"
> for other reason for example, like we do to build Xen.

Right, that's what my first RFC remark is about.

> It might be better to have a different name instead of ".config", and
> putting it in the build tree rather than the parent directory. Maybe
> ".xenbuild-config" ?

Using a less ambiguous name is clearly an option. Putting the file in
the (Xen) build directory, otoh, imo isn't: In the hope that further
sub-trees would be enabled to build out-of-tree (qemu for instance in
principle can already, and I guess at least some of stubdom's sub-
packages also can), the present functionality of the top-level
.config (or whatever its new name) also controlling those builds would
better be retained.

> I've been using the optional makefile named "xen-version" to adjust
> variable of the build system, with content like:
> 
>     export XEN_TARGET_ARCH=arm64
>     export CROSS_COMPILE=aarch64-linux-gnu-
> 
> so that I can have multiple build tree for different arch, and not have
> to do anything other than running make and do the expected build. Maybe
> that's not possible because for some reason, the build system still
> reconfigure some variable when entering a sub-directory, but that's a
> start.

Hmm, interesting idea. I could (ab)use this at least in the short
term. Yet even then the file would further need including from
Rules.mk. Requiring all variables defined there to be exported isn't
a good idea, imo. Iirc not all make variables can usefully be
exported. For example, I have a local extension to CROSS_COMPILE in
place, which uses a variable with a dash in its name.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: The directory name based heuristic of course isn't nice. But I
>>      couldn't think of anything better. Suggestions?
> 
> I can only thing of looking at a file that is in the build-tree rather
> than outside of it. A file named ".xenbuild-config" proposed early for
> example.
> 
>> RFC: There also being a .config in the top-level source dir would be a
>>      little problematic: It would be included _after_ the one in the
>>      object tree. Yet if such a scenario is to be expected/supported at
>>      all, it makes more sense the other way around.
> 
> Well, that would mean teaching Config.mk about out-of-tree build that
> part of the repository is capable of, or better would be to stop trying
> to read ".config" from Config.mk, and handle the file in the different
> sub-build systems.

Hmm, is that a viable option? Or put differently: Wouldn't this mean doing
away with ./Config.mk altogether? Which in turn would mean no central
place anymore where XEN_TARGET_ARCH and friends could be overridden. (I
view this as a capability that we want to retain, if nothing else then for
the - see above - future option of allowing more than just xen/ to be
built out-of-tree.)

> Or just let people writing ".config" files to handle
> the cases in those .config files.

I'm afraid I don't see what you mean here.

>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -236,8 +236,17 @@ endif
>>  
>>  include scripts/Kbuild.include
>>  
>> -# Don't break if the build process wasn't called from the top level
>> -# we need XEN_TARGET_ARCH to generate the proper config
>> +# Don't break if the build process wasn't called from the top level.  We need
>> +# XEN_TARGET_ARCH to generate the proper config.  If building outside of the
>> +# source tree also check whether we need to include a "top-level" .config:
>> +# Config.mk, using $(XEN_ROOT)/.config, would look only in the source tree.
>> +ifeq ($(building_out_of_srctree),1)
>> +# Try to avoid including a random unrelated .config: Assume our parent dir
>> +# is a "top-level" one only when the objtree is .../xen.
>> +ifeq ($(patsubst %/xen,,$(abs_objtree)),)
>> +-include ../.config
>> +endif
>> +endif
>>  include $(XEN_ROOT)/Config.mk
>>  
>>  # Set ARCH/SUBARCH appropriately.
>> --- a/xen/Rules.mk
>> +++ b/xen/Rules.mk
>> @@ -17,6 +17,13 @@ __build:
>>  
>>  -include $(objtree)/include/config/auto.conf
>>  
>> +# See commentary around the similar contruct in Makefile.
>> +ifneq ($(abs_objtree),$(abs_srctree))
>> +ifeq ($(patsubst %/xen,,$(abs_objtree)),)
>> +../.config: ;
>> +-include ../.config
>> +endif
>> +endif
>>  include $(XEN_ROOT)/Config.mk
>>  include $(srctree)/scripts/Kbuild.include
> 
> There's another makefile, "scripts/Makefile.clean", doesn't this would
> need to be change as well?

In theory - maybe. But in practice: What override might there be that one
needs to put in place to run "clean". XEN_TARGET_ARCH, for example, better
wouldn't be needed for cleaning. Furthermore the top-level .config hasn't
been included there either, afaict.

Jan

