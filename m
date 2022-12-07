Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68337645483
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 08:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455953.713637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2okV-0001zj-Ip; Wed, 07 Dec 2022 07:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455953.713637; Wed, 07 Dec 2022 07:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2okV-0001xv-G6; Wed, 07 Dec 2022 07:21:47 +0000
Received: by outflank-mailman (input) for mailman id 455953;
 Wed, 07 Dec 2022 07:21:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2okT-0000L8-Rz
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 07:21:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd76b244-75ff-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 08:21:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Wed, 7 Dec
 2022 07:21:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 07:21:42 +0000
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
X-Inumbo-ID: cd76b244-75ff-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmvdRQZ/k4wXVOSEt/Lx6dQkcx9MfOylWz+SJL6ZFcTrZmGeOfe9IXus3EIGfDqj7MxADdAxvmI++ywzTra2F/TmjaBgnEla0M/5xgHkJCXq1LPTedqZN8rnSKOJ/cmVV/79ascVXWgWsP/O7cF8geAlzkuL/yiCzbRX1s5JA9fgzbZweeBKg1BNbHwposDjkSZAf87a8oICLFv3uomxsdTOoklFfKf1YMSoBh7vg480E11z46OTwQB+3zYjpLqV3nBRnZSqmdn5BkUl7Wok7VvGSuoMLk2Q83fLGo11ZU+gY/qZ51EH5p5c35ji7+d04YKDu170rQms0sgnhxBcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aae2oNc6SwZ7Ne852HQ9+2mfyLhFNsg/ooqdacaySck=;
 b=j1su1yBNRXFLVNQqxTgTeWSJScyt4rRmtfCFkjrUg/gfmaoUVPh1OXo26HWRcIcnliPbHApRB+HOjkz91qmwPwLfpYFnSsuIuFkCboaAlGWjTFTn+KLejQUOYVv+ThbkFHXVCKRFSTwVHYISuePszQ/Z6PkjOl6ArPM28n6AflWBbjbW0zsttj+LW6rj3sGx8VIEMWAoLF/x6O4VNxFdPEz2GZXT/rNT8ki8xYL8xHhEY5J9uDbmevVtsuQKPA9V3iQArJ0Sa9NRRcuupikxTMwA9g7uHNJ1qvTSeWkWjYAqmv8lf6E3DOdjhSJgRVCdylRdtKXrgQoqHSjN4L6Xjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aae2oNc6SwZ7Ne852HQ9+2mfyLhFNsg/ooqdacaySck=;
 b=2/ZLTEPWYQN74YjTs2sae64H7GG3JeGw7J3xf9HxnRsgzthmxO4O2h1JU9l4NG+oU1UCNPnwIbsa6unr4UqXjRQUqn0vKx8Wkb+fZ7cw/+ZeMEyDUOFxkHBqdXXz0wjGN4yeMKEGWKzV6tZB9NUNk5NZcUsH1zbDuvH29QNapmOJpeO+wC5pZMrEoG9l4Jvf7QIE8eaje46mSlGyKxDHsZEh0mnDtJU8V3LXP/fFgb9KVMu5xPksJv4LjSTZIKe9Kaox97I/CWR8unBF/a5ryX7v3YWhX4D+4V0NGVYA3QFSxlVEImGh2Mta+vyO2oLJCHGdM+pEfPdV9dvduhg7cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <606aff14-8abe-1788-6bc7-f3b279db8106@suse.com>
Date: Wed, 7 Dec 2022 08:21:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/3] x86/pv-shim: don't even allow enabling GRANT_TABLE
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
 <5fd43248-225e-99c0-7bbb-65e7cf7f08d1@suse.com>
 <5c934e1d-c785-d330-f0e1-acaaef700265@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5c934e1d-c785-d330-f0e1-acaaef700265@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 0259d3e0-0cc5-4426-8dca-08dad823b0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jPWoXumFrdPlDQMIvhmmCA32aWaKYmUxvmnVJ8Yn5R+X+NYkS8zHm9YJmFfywTL1BawLmPoTo0r+zpjitSukEj7wRJc86svxRYlB8OIGMsiZQ6sZzh1t3iR/St25DV12gXvtR+GEOSQarft3suy5yL1HQITBdWUeOlJWIfp/Pr3sd9GR4pqx7DcOPoMtVIMGi8PF1Evd3q8UQpFHnUpT8WVI5OGDjTCyXGa7mVMZcEja7JBnihcjgU6v0t09NRRrnepi4S2pSTPb8zTNO/0I4pCbmRXuwCDaqsLQSyehz40qBjliERaDVoMYeLox3U/gxbVgUBbdeYBDv6rXuQFuTImExsZYmgXsNX+W2QiCllWQBrOxAEz9LzExNrfLL8bsW44A24nPheXgmz/3u+BY1RjNzs0AjGJyO4X3YaOvIJe02d3jf3gvrxfhdU8AayIJLUiWihlxkNrpeMjGJSrwN+gyPjVhBF6Bgdzo6787LtlfjsGnN0Zlie/sMPHxwZO+QOkZu3kEBgtw/Hr+GbyuaexNE5/wnqhBMr/KmeuPiS4jWqmFprnfhzSvjeayOM3oNrLMt3oqaclQKr/2oZLxsTDipKrHNEMKUEe0ZZlzDjQH1Db2LoniFQlF3RD77ywi8kffMnld0oDlbFUiOeiUYikHlpmg1Orc2Fecs/4ZQfeXVi1h0NLxz9R0NoAt88OIT707EL377HjH4OD21XeE0gXc7vbu4AJL12GzU90829w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(39860400002)(346002)(366004)(376002)(451199015)(31686004)(186003)(6486002)(6916009)(54906003)(478600001)(316002)(86362001)(31696002)(36756003)(38100700002)(6506007)(53546011)(6512007)(2616005)(26005)(4326008)(5660300002)(41300700001)(8936002)(2906002)(8676002)(66946007)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWlWcWwvSElPU1RTTzJHYXJHUkpkU1ZNLyt5T3hVclRLZ0pIZEFGWEMwV0RO?=
 =?utf-8?B?eXhWYXhsUVdZNkZiVDRuSGIzSnJnNU9zSzIyVi9NTE0ralZJWWZRYnFGZ05a?=
 =?utf-8?B?TXh2NmZxaWdOVFFVUHVoV1Zpbks4cGVSTGp1Y2pCdGZSQkpERlIrRmJTLzFl?=
 =?utf-8?B?bUowWkovdmtVbG5sQkY1R1pKVEVXeTgwZkFDWWJWbWkyY24yOGRRYWFwTGRF?=
 =?utf-8?B?UGZCUjdXSHBMV3g2ZzNaYU1ka1VLL21EcEpRV0tEVGJpQlVZazFndnpYSXZ1?=
 =?utf-8?B?ZTI4UHNWZ1hBRG0rOXp2Q0dmZmhDK290ZmQvVEJqejhZdE8vSFk5aFhTTXl6?=
 =?utf-8?B?cmM4ck0veUhNR3E0eEVIazF5SE53Y0dSS25vL1FucWdzWXMvZU5mSVdSZXFF?=
 =?utf-8?B?UXZjWWlGcXVuaCtYSm5xRVBlb0pTcHRjM254Rm40SWFQdlN1NExnZVlwZmRz?=
 =?utf-8?B?UWFxam5hZHk0YzllS1dnK1pSRFhuM1lzTkRlUGI2YzFMSmVMSU1RR3ZQTEtN?=
 =?utf-8?B?dDAzSWtUUEVHNXlKMjRQNnEramNnOFNkZm9XWkJTang2RGV5UzBlc2cwWjlE?=
 =?utf-8?B?QXRwd2I3b3VBU2tiSW1wMFB5aUxMYVZab0xvYk1pMXlHdmdDWUV0dndZRElm?=
 =?utf-8?B?dGpEeVR5YXJ4cHZ0N1I5SUJKVWVlTXFzbit3Si9td1VUK2Q3L05NMFdsTFV2?=
 =?utf-8?B?cXdNMzNVV0dvandPam5SMjd2VnlKcGtqZjBna1FqbXhnWFBhNXlDbHloTUNP?=
 =?utf-8?B?b1N6akdvVkJOOENGWE5jbjBWNzBCb2Mwc3F0YjcrUEsrc0d6UGRiL09CNVJT?=
 =?utf-8?B?NkQzdUhWRFlWdDh6NlkyZzZZbzg0VDJpNlVHcTZDUFJzUnFEUGZsWVhUMFNy?=
 =?utf-8?B?VWd3ZHlRU3BtTXdFSjh4MlpYRmlZVG1ua24wZHYyT0lJNndvRUVwbjQ2dDlq?=
 =?utf-8?B?V0dzK25Wa1N3c1I4VHlveFpPTTYwaWhPbmtldlZ1MzhZQWhXNlRGRmdXR2M1?=
 =?utf-8?B?SDNEd2JVbGM1QTBwblNWR0MrSk9CME40bnVEc2dqblRpaUM4aG1LOGJTK2hP?=
 =?utf-8?B?Si9qS21uYklMKzViZE1Ba2t0N1haenRxdE9EWk5uaU9pRVRkaWw1Mllramhl?=
 =?utf-8?B?N1BzZVU2M0pjUm16WG9yempEVVovU3V6Q1E3QjdOWFBBa3cxd1RxTTZoRzV3?=
 =?utf-8?B?VU1KZjYweVZLSG9TMGxJd1g2Mm8xTTh3Q2p6V3RZUDJYa2s5SFhPaEtVSlVp?=
 =?utf-8?B?UHF0WHBLMnZIRkRuakozUWJpbnRzejV2dHQzM1ZzRzlaM25KRS9sdGF6WjJl?=
 =?utf-8?B?MVhJQnFoL1FOUnBDV2YvOTU2cVVzMGx0Yk9rc2NycHBsSFFTVTZrNnhpa0tk?=
 =?utf-8?B?MU9vSUI4V0dUZEM5VHdqUU1YN29zTjhnNHlJZFRuS01oZm1BSS9xMWJ3ckU2?=
 =?utf-8?B?L0g4QVJ1UEQvUWtCL3lYR2lYbFJFSTgrb0hlKzNFK0VreEVNRXhXaGhtSWVX?=
 =?utf-8?B?Z1ZKOTI5bSthdlRjcXdhY3hhNDZad3JYK2RrSWtHS3A0MFk3cHY0Z2JXQnJl?=
 =?utf-8?B?enE0Nk8vdkVLL0Z0a25JckwycVNJdU9xalAvQU4xVkl0YVI0QXNicFd6Wm1L?=
 =?utf-8?B?NkRkVzhPRGo2ZFVPQ2VpYWlhdDdndXFRWk9ONkh2Q0ZSWVowOTFJNnlxL2hT?=
 =?utf-8?B?U3hvT0d0NFRNTHZ3NzFwZkE5cCtKdkdYM1ErU2llQ3VIVllqT0oxd2dNUkY2?=
 =?utf-8?B?QVBTdlNYS3p2T1ZZMEtIWVpuU09MQ3VOdmdOby9xeUhVbkN2Zk9xcVVTRE01?=
 =?utf-8?B?MmF6MGtRQmpRMU8rY3kvUVRLVzJwbGNiMzU0bk5pUWRpdnBPcm9uY3QrdWF0?=
 =?utf-8?B?citBOU1scmNpYnVOdENKOGhOSlFHUjczTVF6R05nQUY3OG5FNEFybFZ6TUk4?=
 =?utf-8?B?eS9TUHZlS0hIemxsdXpnZ3lna2V4M2hzM1U0Tm80b3lXVzRGU3crckY3aEJT?=
 =?utf-8?B?d3lCdnFJQlFQcmFkT1FzU2FhQWh3dzlTS0JYUEh2eVpJTjZ1bmNaRlRCOEVw?=
 =?utf-8?B?SThGbXJUeGY5YnFiR1RvUC9Iem9mY3duVTRTQkc1aVpUbFE3a2tTMExxa001?=
 =?utf-8?Q?D5kXqx/GuEPc5OK51xP4rncAa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0259d3e0-0cc5-4426-8dca-08dad823b0b8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 07:21:42.7936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylTKdnc51YHObrrTv0f747pRCeeapG+ojD5NeXrhJpDWgBTdMnnqptY3ckvN/nQqfcPddpoOarqT8sXeXsF8rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8585

On 06.12.2022 21:26, Andrew Cooper wrote:
> On 06/12/2022 14:30, Jan Beulich wrote:
>> Grant table code is unused in shim mode, so there's no point in
>> building it in the first place for shim-exclusive mode.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> nack.
> 
> This is bogus, as is every other "depends on !PV_SHIM_EXCLUSIVE".

But why? Doing things like this in Kconfig is exactly ...

> The only reason I haven't reverting the others so `make allyesconfig`
> doesn't disable CONFIG_HVM, is because I haven't had time.  This change
> further breaks allyesconfig by disabling GRANT_TABLE too.
> 
> PV_SHIM_EXCLUSIVE is a simple option for a bit of dead code
> elimination.  It is not valid to be used like this.

... for the purpose of dead code elimination. By nack-ing a change like
this (and by having voiced opposition to earlier ones) you simply call
for yet more entirely unhelpful #ifdef-ary. See the last paragraph of
the description of patch 1, half of which this change rectifies. The
solution on the evtchn side, unfortunately, looks to be #ifdef-ary,
short of there being a suitable Kconfig option.

Furthermore Kconfig, in my view, is specifically intended to allow to
prevent the user from selecting entirely bogus option combinations
(and even more so suggest entirely bogus configurations by bogus
default settings). If you disagree, then I'm afraid we have a 2nd
Kconfig usage topic which we need to settle on in a project-wide
manner. If only we ever made any progress on such ...

As to allyesconfig - I can see your point there, but then arrangements
need to be invented to avoid this kind of unhelpful behavior.

Which raises two questions then: Would you view

 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
 	default y if !PV_SHIM_EXCLUSIVE

as acceptable? I could accept this as a (perhaps) temporary compromise,
until the general aspect was settled. And what about the different kind
of change in patch 3, where allyesconfig isn't affected (afaict)?

Also, as a wider scope remark: In general - and this particularly
applies to cases where you feel like nack-ing things - comments on
patches want to be constructive (and thus actionable, pointing out
possible ways for the author to re-work things such they would become
acceptable while achieving the same goal; see the first of the two
questions above for a possible example). There's nothing constructive
in your response here, nor was there ever (afair) in earlier nacks that
I received from you.

Jan

