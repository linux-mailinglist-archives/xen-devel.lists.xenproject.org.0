Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0693F1557
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 10:42:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168438.307533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGdbo-0001Yn-R3; Thu, 19 Aug 2021 08:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168438.307533; Thu, 19 Aug 2021 08:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGdbo-0001X0-N3; Thu, 19 Aug 2021 08:41:08 +0000
Received: by outflank-mailman (input) for mailman id 168438;
 Thu, 19 Aug 2021 08:41:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGdbn-0001Wu-7v
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 08:41:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b322cac5-ff35-4919-bca1-1172dae35718;
 Thu, 19 Aug 2021 08:41:02 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-mSusH6ISPBaQexj4GHp1lQ-1;
 Thu, 19 Aug 2021 10:41:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.24; Thu, 19 Aug
 2021 08:40:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 08:40:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0059.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Thu, 19 Aug 2021 08:40:58 +0000
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
X-Inumbo-ID: b322cac5-ff35-4919-bca1-1172dae35718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629362461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHc1P45rKhX774XIVn0LWerIFDBzZCMg8qeekOXhV/w=;
	b=bCmOQg596hvzMg/L+yeVFni3rMDcM4IEpuSstTdNEtXiJahI/Sy820m71QBIwXdWu4THJo
	eH0jyld2haULN3ZeteccmO93JX9ZjPAiEZCI1FbtrIzeN6jB80Ki5Zw2msGuI2AZZyk+RJ
	UUhdBG5qaFCDlZ6yHgiFDwzGCTbSGWQ=
X-MC-Unique: mSusH6ISPBaQexj4GHp1lQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DA1izVwZjbA6X/88lVeYWXblsHQXelx+N8bREZTKN2XHA1+bJtqqyl99otVQs8NLmXLD2atHRFUG/dBCNqzZ39xBbMZU34YDRczlomJoNGKbLmqi5N7Ap0IwJgpLH6dPf9s2AsoA4wp/Bsf5Joz3OoWF89+s31H8NFhfw32B136WM0NpFPDbCEj6/fVu7nzIKInWG0bVl6WKMYddIl6+fPIpYlT2ug+KLdEO/ksQyigPsxel1W18Y+Mo0q2IquYPsnKcyjsZa3Id3qNJMF4BCVSrfXQZguzrg+Jjcxkh3IlUPHNuolUeOyWDhJaSQC1olVbaaAK+dFKZ0CncJTFEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHc1P45rKhX774XIVn0LWerIFDBzZCMg8qeekOXhV/w=;
 b=kmJW05bWT8FUivlIBZWQA2abvjNJt8726SrDQGQ+ZeNPIrou871vZ01Rwy7EdupFkCzWWUJt7IRmk8jtYvd9WLqRFRtpybJWfa3wAHTaG+VoIVBmmW5rXz+QHuNEkQvM+lLdeGW426lRgE8PFfUOQ4i9q4MFUhYsxt7euNiLJ1Zl3iRu9jXnj9eNpQ10IGVaBQzS+NGssy4c80/MvuRtewawshKynk1ZjlLOY3pVJ/PPW8h6lOhVGNFykPj4YeMncYhPIKeg1ulY2ODNI7Nfp28Yem5yEzV4dKR4ad4bEXeaJz6LXYure9ize0UQEQxI+SFA7oQGkM5Lsp/S69L4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: Xen 4.16: Proposed release manager and schedule
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, George Dunlap <George.Dunlap@citrix.com>,
 committers@xenproject.org
References: <24861.8902.217023.673705@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5198b3ce-8a7c-a5b1-4ddd-f2052e1d4181@suse.com>
Date: Thu, 19 Aug 2021 10:40:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <24861.8902.217023.673705@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0059.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 819bd508-0a21-4dab-3112-08d962ed119f
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6176ECE1C33A10B27EB87144B3C09@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7DUOIVxxaqgBwRZo1C6Kg00IiYkW/J3KtOSDd/MBGu7hxHv2ka51mYT0GUps1lfiYvhXSSSTe+G2QaWp1idRZk3ayxXJ7pR16pYnahNdM3o7tDohawN41t4GB/lw3LZgX4ik2SFbDbIn/lE047gZd4fWZhmY7wm2yigFTFNcmb1MN4hVsZ8iwhRbiIXHPUZ8yxXoV8XrxK6G25TEmu5BWnogROLu4FiiTAzKL8X39V8liVTdDY9IpmnU1roSzcz3oBUEEKPdukJnTKU2dhLGgE4Ev0HWHcKTOzLoHAxOc0AL12QiNvy5vxQ+u6QcTCcZnN/RqifD9QMFtpOBACsB4qp/O5F93NyYIwReyewVHxeiQa+2q3JEEV9kF/B7DnImfakQcd9ibTcoMNZzViihan/8hD1kEe/Cs8PQeWheJk99dgovlPaV7vnpUlEBbbiLEov87EFizqtG+uz1rfGjQ8MQIH++JcVLLYX5+11H2LU6gSI1BflONOFnVcQ9vV6uwto/UxYM26x9UPzxt2m2rTIty7N8mNyHekZxbvIZYYYm2RDpU22GBe4c9P6OD8b8+MjrNM2m9zIedDbWAtJ2hEpqR1dr3fTkKu6VY2OJ7axXrfA/IFB5qV2YlTrlRfuU+RgmHeQeqcOLsHIQu8iihpsPQppo6ySFx973BEcFSPVj1SHoBNo6sG66hYXrb1uQ0Ji7AGbkPGT/D29VtcaM3luHXhP8mc/kiNASMZvH13k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(346002)(39850400004)(376002)(66556008)(66946007)(53546011)(66476007)(6916009)(4326008)(478600001)(186003)(31696002)(5660300002)(2616005)(956004)(26005)(316002)(8676002)(83380400001)(8936002)(16576012)(2906002)(36756003)(38100700002)(31686004)(6486002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2h4d0NxVUFLZDJCVE5KbXoyVzJZbVIzbDdIMFB4a2RMQTFoSy9EaE9xSThG?=
 =?utf-8?B?aUxPNGJVNnprYXhtb2E0SnFPZ1lTbk1ZVEpsZ0gyYk50ZS9samNtZTU1dVJU?=
 =?utf-8?B?WVRKR2hwQjc5K0dWVHBaT2VaQXoyMkRabE1tQlN1VkFCdGZSbmtrQU1xcjRQ?=
 =?utf-8?B?aFpKY2Ivc2Y5QTIwVkRTVzJPcUFoK3N3dEhQVTZwTjdhWGV3V1FRbWxWVThP?=
 =?utf-8?B?TXZENGx0SWs1OUFVNW01eHJHLzkrSlU1eC8zU1ZXb1I5cGpPNytKMVRabVpn?=
 =?utf-8?B?QU1yOGNIdkFIWndMYzhDRW1TQm9nSGNxcktnK3FLU0c4NmJGWlh4RVpza2hD?=
 =?utf-8?B?OVRvMHlqdzBRR01WWkV0WVlnQitrWlcxMDlKK0RGTGI1cjJMdUI2SEF4cmh2?=
 =?utf-8?B?amhFTytNMGdsc1VqTWI3blNMbDlpd1IvOFJZUTk1MzBmYm10Z2NuaDBzcGkr?=
 =?utf-8?B?Rm85a2xVL3NFaURkUkxESkI4QThBMUxHb3RRWnpaOVB4ck9vYjNud2xyZlh6?=
 =?utf-8?B?b3VjY2lHVlAzeXdzOEhEakQrcndFQmQ2dmJkV0VXQndzR3lwWEhjVjZUbVdw?=
 =?utf-8?B?eFlYeUgwRXBTZ2RsWnRDQ3dEZ0llV0pScDh1THlxcjV4azkwdnpmb056c0sz?=
 =?utf-8?B?ekZ1R0N6ZGhQZkpSMFhXWFZQemZacG5vblFHUmZROVZoYVB4ZmQ5Y05Ca0o1?=
 =?utf-8?B?WjFGZlF4L2RGWE1XUGhPMlZMb21XYmYrWW16NnpYQnl2dlVqYzdaOCs5RTdS?=
 =?utf-8?B?U3dubTB0VEcvaSs0MzZWWStjODNFSnVFZHMxNnBFbnlYQUthbWN6d2tIbk8y?=
 =?utf-8?B?RG5SZjA0Q0YzbDAxNE1jSG9uL0tkaUdsZUVwQjg5M2tZRTJRbEJldjNNbENw?=
 =?utf-8?B?YUJzMjUzVWFGYzZaWnBGeGVzMUp4MjFIRWZMV0ZtZThpYlZ1bEZuTlUwbDhI?=
 =?utf-8?B?N1NqN0pHNUNldG94OHh5NzNRTzczYWhDZGJENUJuWE5aVlVLVGh2REt0enVU?=
 =?utf-8?B?Wm90cElsKzF2TUhUbmIzeTVKRTAzYUZrSy80eCt5dmIwaXFMRGQvQzcrcXZy?=
 =?utf-8?B?V1dUYUFHZHIxSThJVG85aVg3T0JYbFExUmZaYzJEcHl1bTdqYnlIR0VwMHd2?=
 =?utf-8?B?bzRIaEZ0bGhWSG5HNnh3YURvME14Qk0rdkF1ajFDd203cHo0QUEwQzRHdnFC?=
 =?utf-8?B?RXcwQ3pJcTRSMUY1UkEvaE12N1J0Umd2Tm5lLzYwRjlxM1YrdEV0UjZ3Nkkw?=
 =?utf-8?B?cVRvQkJ1SnU1UEZXY2VhZy9SSWdzQ1pyZEpiY0dlYjBXejROYi96enlkRVpp?=
 =?utf-8?B?cnB6QmMyNGRMRlJnUmkxNUZQZlJoNVVpOEpvODlaMWxBUVZNbTRWMVFHNGxL?=
 =?utf-8?B?c1lDZkoyS09Pb1lLL21jMVRuMWxxVXdPR3VFc2kra09tUUlGcmppN0FJc3Rz?=
 =?utf-8?B?eEtVVEdYUzNGR2w5L1RlOFYrK0Q4S0kzdjRIRjVmU2l5ZXM2ZVYxbUVXc2R3?=
 =?utf-8?B?a01PZnlodmh1OG9kd1RQOUJPK28wSUJMOE5ZVGY4bEJJN2QwdDNmV0xtSk5U?=
 =?utf-8?B?clVJbVdVS2ViM0NNenduTmRtdXlhMkZpNCtLWmxtcGxDMWtuclVaSDlsUHNX?=
 =?utf-8?B?SFUzaW05bGJtbFRFK2VmN2RTOElLM2xUTXRueHNXWUpTdFl5cUdRN0t4Vjgy?=
 =?utf-8?B?WERNMExkakg1Uk51RE5Wd2lEN1Y3ZlBzeERHVVoyK2NWWTVhSnA5KzFTdVFw?=
 =?utf-8?Q?/K7CfpcHxT//Gi1unPoWcsiLqgfAACWTO77oLRq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 819bd508-0a21-4dab-3112-08d962ed119f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 08:40:59.3411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cLFUJPexs7DX1fI7c6U3Ye9IHA9ZHYh7hTr5hTobG7YPyZnxZAaSUjlpsKkmRABY5ZGUBi9SWhJusl8SgNnTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 18.08.2021 17:09, Ian Jackson wrote:
> We haven't formally appointed a release manager for Xen 4.16.
> I was approached and asked if I would do the job, and said yes,
> but I think things got stuck there.  Taking this as a prima
> faciae indication of community confidence, I hereby volunteer to
> take on this role.
> 
> And, I would like to tentatively propose the following schedule and
> policies for Xen 4.16.  This is based on the 4.15 schedule with some
> tweaks, and is intended to align the ultimate date roughly with the
> 4.10 and 4.13 releases, which were also in early/mid December.
> 
> I suggest we use the Lazy Consensus procedure to decide on the Release
> Manager appointment, starting now (since we're already rather late).
> In particular, if you feel someone else would make a better release
> manager, please say so right away.
> 
> For the release schedule, assuming I'm the RM, please send comments
> ASAP and in any case by noon UTC on Wednesday the 25th of August.  I
> hope to finalise the schedule then.
> 
> ** DRAFT **
> 
>   Friday 17th September                 Last posting date
> 
>     Patches adding new features should be posted to the mailing list
>     by this cate, although perhaps not in their final version.
>     (3 weeks)

Without meaning this to express any opposition to the proposed schedule,
I'd like to point out that as of mid July there's been unusually little
changes getting committed. The above leaves less than a month (plus the
3 weeks of until feature freeze); at the present rate this would mean
about no further (larger) changes.

> If as a feature proponent you feel your feature is at risk and there
> is something the Xen Project could do to help, please consult me or
> ask here on xen-devel.  In such situations please reach out earlier
> rather than later.  I will try to put you in touch with people who may
> be able to help.

Code review looks to be even more of a bottleneck than it already used
to be. Some of the series I did post long ago (and hence would never
have thought could be at risk to miss the next release) are still
blocked on not getting reviewed, or having got partially reviewed and
then things ended up stalled. Since even pings didn't lead anywhere,
I'm afraid I'm out of ideas, and I will admit that for some items I've
simply not seen any point anymore in pinging. For a few patches I
didn't even think there was any point posting them in the first place
for this very reason. Examples (totaling to about 70 pending patches,
and not naming any further individual ones):

xvmalloc() / x86 xstate area / x86 CPUID / AMX+XFD
x86: memcpy() / memset() (non-)ERMS flavors plus fallout
x86: more or less log-dirty related improvements
x86/mm: large parts of P2M code and struct p2m_domain are HVM-only
x86emul: a few small steps towards disintegration

(I also have almost 20 patches submission of which is blocked by the
presently pending batch of XSAs. Their handling may also get tight
at the current rate of progress.)

Jan


