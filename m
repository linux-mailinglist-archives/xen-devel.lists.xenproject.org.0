Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7184878E6F0
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 09:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593368.926374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbbiF-0004O5-Mb; Thu, 31 Aug 2023 07:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593368.926374; Thu, 31 Aug 2023 07:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbbiF-0004MP-JV; Thu, 31 Aug 2023 07:03:31 +0000
Received: by outflank-mailman (input) for mailman id 593368;
 Thu, 31 Aug 2023 07:03:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbbiD-0004M1-Ov
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 07:03:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a18aadd-47cc-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 09:03:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8343.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 07:03:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 07:03:21 +0000
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
X-Inumbo-ID: 7a18aadd-47cc-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZbx1qtNs4eqdpzpuFgE0muX5pwIBGjXvJb4js4kaGCB3keQ26WgooMbYJoZOvQjEoKOMP2g7AnKmOqhLIwfamhtTZzsXxP9ckrVe62dvgKv3TvU8e7eRyyNrorMK9Zj6griXoX2jlq8y/mpwcEE8MH5ZzMwAyxx3S9Kn6I2MPwA15ZzkZs1Zu1MEESsvWGVCiE5CBuhSgoBBDCNhGII5csp6/PBqQ1Wd27MZaXRdFzUtHtV1kE388VrYo+RU8BiN0b12q1qoKzYHHQbwTiG3bA380Mtrgh+vEPRVYo7K0hW4XfY/TzauilMESwgwm0rRTKh0yeS1hlqjFH68lUQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buGbSCavm61uwNheimiDyUDB5DF4rjpOh/Mo+rHOuwA=;
 b=Bz7vRQ4UPcWzIabqbfq4WlQQerXi+WBQnPZoDsU53L0aIi5UostChRCp745kSgWr3NaDMySS4u/xsDtHRg9tUQ83vwtDoAwTVSE/cSf6y4pBFpfiMiSgej3prF7auu4I1G5iHRUeOnvHS+lf4UiXKQTLl8rocRAQZ8D8IMjUmJS+ipwHvVdxgjfLqZCARbS7T31jSTQkvHb/PkDYHHZqeE8LYQu8Nnf9O/szDxSDXA7ARJtUTD0Eguou5PaSpu/a96e2z+Z1ygGijnJJOY3Warcir+rC7CWJzpar3c7IMVvCDjYVYwexNB4qEv9MekuGlpAjpxyvTLXQSsXT7WxR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buGbSCavm61uwNheimiDyUDB5DF4rjpOh/Mo+rHOuwA=;
 b=0zAkzs5kx5Ed2pdr/UXre7o0dGl5MM5rWGHCMrEUX1rXBtjDJpZMHjVXB7oz3//KDmVlntSfr0I5S3emfNPCghmP+pzKNTX98uH4OCVREgEZOUMNBfru1gqp7YiIcCfM7cCCV0JN1aSF9DqI0zggCfEzJBJnr/HSYKaGeIxDHgzdCOt6OJSiOLQXJB6EyEa3h1xMWvF5NioCYXiwt5TAi+8M+QP0ACqKj7m68zSadYy9ZgZYG0wlqWKACqlSkO2fqtXNzjsxLjSCgBz9cxEbiVnlHFiNjgvr7LBexrI2s3+MSSVgdFdAjiA4cKo9jvoY7dllbIGgS9Sj++qhvFmUVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b28f42f-be2d-b826-2bfe-434b0c1742e2@suse.com>
Date: Thu, 31 Aug 2023 09:03:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] x86/HVM: correct hvmemul_map_linear_addr() for multi-page
 case
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5B98D7CF02000078001E7AEA@prv1-mh.provo.novell.com>
 <ZO9Sj5YDjiKIh1G-@MacBook-Air-de-Roger.local>
 <93b3e5c4-19b7-9809-e322-f0973924eef8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <93b3e5c4-19b7-9809-e322-f0973924eef8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: 7042c4c2-8629-4d91-e276-08dba9f05c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kzAULbntD9UShDYDf1DYHKrKoP3QJEk8lU4V3ygWBBec1u3pMCNtwJb3LNI76eQq6XUDjFSj7r8tWFchK16GukoMpTTzVOc1hff90zQ3rhjNdrkmIbCJ91i4d/csftq77xOVsDWEHOE4c3mwtQuQt13FqvrPnGj+ZkUWla6LFdrIveLDgTCGUWuNtYQeSKojCec4mRKYSe14xsiYLq2SJQJSNrZqSQThkPeRpGn3vdOKlAfg9YCVcu2xR+fVJf4nUMP8IweW4FYP41xMzTp+lTl8vGXYN6TQra3PAh+nwnSWYs2uT62QrLXRXINw0kcKtIz7aXrmoPe/tO23rg+jogVTQ/5p8cPskXhLr+pm/HhmVqGdkNpf9cJaH7Tq3w4sj0SiuMqkR0gRWpHYgCL3CV/9XCnsiZFMeh5EWJ5NLLaBY0DETAn/6J4E+tXCDAOzOoVgyrUh+py5Wrnz+havUE2WalctdZH5REpZA2iIjV0b98/xwCUPeHSDEHWzrogDLQlbs1yVEqdiby0MT/+mwvRtvgAKF6YL59RKg00IUxbIsbBl0QVD45ZjwwfCzqrUyYSrZ4t1/WpQsaLOM1kU3A10yHj6VlT5NCvmBEMFvWED8x9LoGtRugL0SWy0ld8JhgWYVwFL4boflF596WKH3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199024)(186009)(1800799009)(31686004)(36756003)(4326008)(83380400001)(53546011)(5660300002)(41300700001)(8676002)(31696002)(86362001)(8936002)(6666004)(6506007)(26005)(6486002)(6512007)(2616005)(66899024)(478600001)(38100700002)(2906002)(316002)(66946007)(66476007)(66556008)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azZmSUtDVUxIYVA5VFNqMncxMzlQd0h3VzE4UVYyNEJ4cnhYS2VxVkpMUnRr?=
 =?utf-8?B?TjVyOGZrOVlCZVdGNllBVnNCY0ZmTzVCNTE0eUsxOXRmdFIyL3BpVkFyOUpP?=
 =?utf-8?B?QmRkVzR4Szl3QUFKbGlVT0ltRGgxSWFGdk5QZkp0VGx5UlN1L29TeHJ5blIv?=
 =?utf-8?B?dFl2dEdiRWlidHMxeXNVU0tQMnNXZ2VZaTkxNWxoZ1VZejZpQTVMK1FncUJj?=
 =?utf-8?B?dGxQLzlzYm1Cem02dWZQR2RWSnVRRTB4UUR1UW1PL0Q3RUFwYkhRTENvZ0Jl?=
 =?utf-8?B?TUMrcWV5RVZCUnp5THI3d2x3QUNNUUE2Ykc4SW01UzBHUmNvRTFkcjNCcitF?=
 =?utf-8?B?dkozR2YwL0xCZElBc0Q4bnZuV2M4OUs1bzUzZTU5Y3MrYWFDRlBVTGp6Zzlu?=
 =?utf-8?B?VzVzYXloMmE5Tit1T2Y3RjRZbHV0d0ZKQjhYZzdTbEdwQXQ3N0RUM1pEZ1Mz?=
 =?utf-8?B?ZUtERkJ1V2NVT05Xd2JkbDdXdHkzWG11NExoMjRnSktrVHhtSG1lZnB4Zk9y?=
 =?utf-8?B?OXpwamR6RU5tVm13a2JidHJDSmVjV3JZcW5hd0RzbisrdlVRcTJsZklpTzlk?=
 =?utf-8?B?T3hMc3duOFdwWllXRHJCbG9oa0ZTZkh3UXdrRUtveFhwbmExc0ZZcUFFM2xC?=
 =?utf-8?B?MGEvL2V1WUJFUUhNMW4xNjljOWZPQWNPWlNDSWxONlBTTlpBUmRqcTQyOXdC?=
 =?utf-8?B?ZXFPY2lGQU1KWTRKMkdtTGoxRHByT3pSM1JBMUNjQ3NEVWQ1am9PRWVoZFNH?=
 =?utf-8?B?TVFWdTREbFd6RGFyMUxxcUJJbTRpY1NIN0Zhd3IzbUlodkhUZHRLQThhYzRt?=
 =?utf-8?B?dVAvNlZkR3d1OENOMUY0S0MzSVBIWjdPTk5RR1lPR3NQSTVzcGRJSzB1WVh3?=
 =?utf-8?B?OVpiK1FHcDBmRGVPVGRGdjZzQjdYeFVlUURpTGRqRGZTNlZCUVk4WHEvK0Rm?=
 =?utf-8?B?SmlneWhaRDdSK1l3OTJxS2IrUzlhaFNhWlZ3RUx5NlEzSHhhL2R1dTFWRnlh?=
 =?utf-8?B?R0paNGFSTVl4QzlxQ3p4T0xHS0ZZdHRxNm05WTJUdXRzNitGUDlRaVAxK1k4?=
 =?utf-8?B?MEQxdW45Ym5odW1nYy80ZklzVUgrb0MyWGtRVE5pSDJ1N1Y5MFFLQktxcUJI?=
 =?utf-8?B?K01odnBBdDJqN3dBMFNVT0k1eEUrdFNFck04REpyazRYa1dDUUpZSFgrL1JL?=
 =?utf-8?B?VnZNdDFpcksxUmNGYlZjb3JPYkN3OUU3dERISzlCcEJVUlpmc0ZKS3NVc1d4?=
 =?utf-8?B?THlRK3pZZHNCOUxHdVlCaGdQeUpUVUd4K3dtejhlUjJyU3owUGd6eGVSZURx?=
 =?utf-8?B?TVZQY0N1SWtMcjNJWk1ra3AzT1VjbTNEYnd3Z2UyMG1rbEx4R0ZrdFVYS0xY?=
 =?utf-8?B?ZnczQTVNNHJUTW00ZlN2QmdjT24yM1BNVUhka2RVQlBWSjVmcTBBSFFvZWN4?=
 =?utf-8?B?ZFBkbEI5SUZ2WVpPZFZqQm5HOFdaZktLUTJVcEM4aFROSWg4Q3VEMEp1dmpC?=
 =?utf-8?B?amx6MysxTFd5NDlNMkRuZWFZMnhGZ0VQUmJyUHRtRE52cXkzbXJscDR1SDlv?=
 =?utf-8?B?cG5QZGxPOWw4djNCNHhDQnZvNjBCbFVXdGs1d0VMWkVxNGNDVHdLODhTWFFr?=
 =?utf-8?B?UW5LTXQwZVpTV3ZRWkp5c2V4UmtMZlFTVkhNK3EyTEZteUErb3NyUEp0bVVp?=
 =?utf-8?B?Vy9GM09yMWIwV0dKa0w5KzVUTFprRmF1Q1l2b1RYNFc4ZEJvRHlDUkI5OGJT?=
 =?utf-8?B?alAvS0taK0VWdlh5cGg0bTZ1M1FHWUJtcTZ2V09DaS9aWkhYNFNvSXBDWk9y?=
 =?utf-8?B?RzFrdHdadytOcmsxMkJsV2JtRXExa0xqclgxcm1sMTZoZmpBcTRHb0RhSHpT?=
 =?utf-8?B?M1IzMGo3bTErMUhKbElmeStlbHBpeXBPeXVNWVhaT0d5bFRwR2JhZ1lIaG9z?=
 =?utf-8?B?aXR0TWZjbmdoM1RYQmY0bFl5NEwyYjhpa0tDc0JYNnZRODY2ZEdiU0Y1MEhJ?=
 =?utf-8?B?MG55QVA3dXJEQWNPOVVNTGNDalpPSFhMbmRBUVFlSDNwQXkybnpQYTB0VEZy?=
 =?utf-8?B?SUpFYWRRTGxtcllwRXdQVzhlSkRhVUtBemJhNlM0ZytkdndUQTEwc2hCZDhM?=
 =?utf-8?Q?o3zTR2yznrJYQ7ZXCuWzNzwkw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7042c4c2-8629-4d91-e276-08dba9f05c70
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 07:03:21.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVI7ASADRoedFyuk49N3aISM5muMDQnDdzyfFeBmf/bdDp3EyjZuZOhChYFZKkssU7grBxy1wb2tI5Fo2q9XMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8343

On 30.08.2023 20:09, Andrew Cooper wrote:
> On 30/08/2023 3:30 pm, Roger Pau Monné wrote:
>> On Wed, Sep 12, 2018 at 03:09:35AM -0600, Jan Beulich wrote:
>>> The function does two translations in one go for a single guest access.
>>> Any failure of the first translation step (guest linear -> guest
>>> physical), resulting in #PF, ought to take precedence over any failure
>>> of the second step (guest physical -> host physical).
> 
> Erm... No?
> 
> There are up to 25 translations steps, assuming a memory operand
> contained entirely within a cache-line.
> 
> They intermix between gla->gpa and gpa->spa in a strict order.

But we're talking about an access crossing a page boundary here.

> There not a point where the error is ambiguous, nor is there ever a
> point where a pagewalk continues beyond a faulting condition.
> 
> Hardware certainly isn't wasting transistors to hold state just to see
> could try to progress further in order to hand back a different error...
> 
> 
> When the pipeline needs to split an access, it has to generate multiple
> adjacent memory accesses, because the unit of memory access is a cache line.
> 
> There is a total order of accesses in the memory queue, so any faults
> from first byte of the access will be delivered before any fault from
> the first byte to move into the next cache line.

Looks like we're fundamentally disagreeing on what we try to emulate in
Xen. My view is that the goal ought to be to match, as closely as
possible, how code would behave on bare metal. IOW no considerations of
of the GPA -> MA translation steps. Of course in a fully virtualized
environment these necessarily have to occur for the page table accesses
themselves, before the the actual memory access can be carried out. But
that's different for the leaf access itself. (In fact I'm not even sure
the architecture guarantees that the two split accesses, or their
associated page walks, always occur in [address] order.)

I'd also like to expand on the "we're": Considering the two R-b I got
already back at the time, both apparently agreed with my way of looking
at things. With Roger's reply that you've responded to here, I'm
getting the impression that he also shares that view.

Of course that still doesn't mean we're right and you're wrong, but if
you think that's the case, it'll take you actually supplying arguments
supporting your view. And since we're talking of an abstract concept
here, resorting to how CPUs actually deal with the same situation
isn't enough. It wouldn't be the first time that they got things
wrong. Plus it may also require you potentially accepting that
different views are possible, without either being strictly wrong and
the other strictly right.

> I'm not necessarily saying that Xen's behaviour in
> hvmemul_map_linear_addr() is correct in all cases, but it looks a hell
> of a lot more correct in it's current form than what this patch presents.
> 
> Or do you have a concrete example where you think
> hvmemul_map_linear_addr() behaves incorrectly?

I may not have observed one (the patch has been pending for too long
now for me to still recall in the context of what unrelated work I
noticed there being an issue here; certainly it was a case where I was
at least suspecting this being the possible cause, and I do recall it
was related to some specific observation with Windows guests), but the
description makes clear enough that any split access crossing a (guest
view) non-faulting/faulting boundary is going to be affected, if the
former access would instead cause some 2nd-stage translation issue on
the leaf access.

In fact I think one can even see a guest security aspect here (not an
active issue, but defense-in-depth like): If there's any chance to have
the guest kernel take corrective action, that should be preferred over
Xen potentially taking fatal (to the guest) action (because of whatever
2nd stage translation issue on the lower part of the access). From
that angle the change may even not go far enough, yet (thinking e.g.
of a PoD out-of-memory condition on the first part of the access; in
such an event hvm_translate_get_page() unconditionally using
P2M_UNSHARE, and hence implicitly P2M_ALLOC, is also getting in the
way).

Jan

