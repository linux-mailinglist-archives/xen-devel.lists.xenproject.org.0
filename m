Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1F74EBACF
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 08:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296046.503920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZRqu-0003ut-Os; Wed, 30 Mar 2022 06:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296046.503920; Wed, 30 Mar 2022 06:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZRqu-0003rQ-L1; Wed, 30 Mar 2022 06:30:44 +0000
Received: by outflank-mailman (input) for mailman id 296046;
 Wed, 30 Mar 2022 06:30:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZRqt-0003rK-0I
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 06:30:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb15617d-aff2-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 08:30:40 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-YAHb-VlCMwihjUxX9BgwqQ-1; Wed, 30 Mar 2022 08:30:32 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB9PR04MB8171.eurprd04.prod.outlook.com (2603:10a6:10:24f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 06:30:30 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 06:30:29 +0000
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
X-Inumbo-ID: eb15617d-aff2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648621841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ax7puGnbSWhT7PBEQveuXtJnn83phFnNpX4As+Gvgqk=;
	b=PszyfJ9vVuvAxA3Wwu/DJAEeAYv6Q2+HQR3Q2XOLCC17+R99fvyqvyol9QWk4rJrtcmKza
	AkZAm4pSsOaiviRSu4JosWJWNC2gssb+zIexgtwWPdumf3ao0vOkhkpQbv1dIzOcEOsi6K
	iOLyPIQrGQqSJ9/NO2vKO2fP0z6t1eg=
X-MC-Unique: YAHb-VlCMwihjUxX9BgwqQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d50wiogdYcWiWG5TCYS2P1z2xLExze7XELxrMFNkHfDpn01Y2s810J9nwIbxfg4f2ziApddCsg2CyrMv3vwa1L+Il8xtP1NoBsetW6Dl9BBQS6ztmqqLbLjrWsASU89UlOYQDCWWcxOlPe/hUtsr68P2MEmTOwMniz+y5hYpQjpCnicy5aZ9QSDxU9Fyia90/Rjm2rMQQhq1K4wQ73LbdBlWbSpYokP17zLooCQAr42UZpeYhKBwaIr1j7o/WUTu5HyBWr+zu1IZ1WYW6iuBklVGi9/dfv/B+yKH1crn1il6tzUTz6Hu1d7iHnH50TaXsmvHBC3cuTzvErlC0OT5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ax7puGnbSWhT7PBEQveuXtJnn83phFnNpX4As+Gvgqk=;
 b=jJk7M/c8+yGUTmSSSkdCZ37oek8UvAlvDR43ye4n77xhp0SoALTJ5GYFotL6jfkECcEo6nWFSLX7BmHBQj7bPj7V0tfSze+2W+mqdJGKzTotMQQfrauh6NFN7M+4clreOHbnYG0wxC6qoewfhns2P9rI/kzx3Oyjp2F5+9lsjmAvcIn7XMpsv22Fub4t8pThsu4faLxL9pDFmRLx9j3nt6jjH5Mg3r+ye41hCoGhkV6QJRpM+euPth21ccHNvwOwzk2Z5VxbfmWfD2YzhMx59OGxA8ndcR+E/BB6af8LW3OQSeH8m3SdnvxrSBP5u7rHYy9E0ajmbBeZRwIssgJLxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e711e8c8-5e5d-7443-fbc8-368ccdde533b@suse.com>
Date: Wed, 30 Mar 2022 08:30:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jandryuk@gmail.com>
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com>
 <7935e60e-34b1-76be-e5de-56e60f173438@suse.com>
 <a991c32d-4e45-f015-3d99-8552199e8d45@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a991c32d-4e45-f015-3d99-8552199e8d45@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0007.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::7) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08c70f65-b1c5-479f-31f7-08da1216c903
X-MS-TrafficTypeDiagnostic: DB9PR04MB8171:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB81710325FB289676D5141DC7B31F9@DB9PR04MB8171.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oS30O65Ccq5R9JJf5hN9o9t7ttfq3ksn7sWvRulcLksmx/ctE5NrsCXosdFFMnWJMp87DL1RXJb9moBlfLCegXdH7rYpVS5J9qAB/ZqCopRoj4xj6QWg64nMtu2GA+//ExJCXjZMctAsbpbm3W+e/0HMTVK88c0T8XpOLmxSL9LxBfY0E1x8gjSfG8pFn0y6Hp5zdM/kWx6Jv6Oh8d0Om7M56RLzXWg1vQB0rCQfEQcKueuAzO8Kf+p9lEY1qbjzhd+RnDiluruCW6OoLmK5J/MvIV/Ka2m6+QQP+QAAoLSBPe9VQNm7YQfAFAyDEnnXD7IRn8yWegSYRsm+/YRtQt42Ozj1JhNA8QMELwfx7ODPWMeGbnF7enbk9yOv+LJKZyK4ltTKnq9r13E0J6vgATuiMCuU2DmUx80LL43c6U27+cj9Y/QKC1QQQIE4KFaxo6iDbO0jPwIjTwBNzjOKzf3UU/6hqs/g9yC1TKmo4QVEhLcUBW1oQAfurgMWR6LN0o7tJ9s9mSZ7B9kvAC44cmLMe/aD6K3+FaadmAnbVF2fESsilrJtsr9bgmwvePWt0xvagL47jPK1TEIMpyIAqwssvRuGBZkkId3bEbYjfz4H7tf7B0ommaRufenMVMs+QGLIKnF4kE8IPMOz76ag+Ug8PvbmBJbsgAupVujeL3UuPoxB+oE1XzJ4QEOjFBERSPAR1oMow1fgachv0oZ/Nk09pQL0/k7sVAJZooghB9V6i3w58o+R+/79te8Bcguq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(66556008)(31686004)(6486002)(66946007)(66476007)(316002)(2906002)(4326008)(8676002)(36756003)(83380400001)(508600001)(186003)(26005)(7416002)(8936002)(2616005)(31696002)(86362001)(38100700002)(6916009)(54906003)(53546011)(5660300002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmI4eUo5OWJ6eUJrZUNDblBNdVAwcWxZaVpMbldsWGdDcjNueVhvSlhlNU5s?=
 =?utf-8?B?elZwOTNxaHFJNzh3REVyd01UN0FqWnE1VDFhc2hCc214Y3d5LzZQSFJqSGJz?=
 =?utf-8?B?MDdicUJ3ZHJUSDFzOEgzeGp5ejdHSXcvK1JCckRGS21TRVErWExjWTU0Q1FM?=
 =?utf-8?B?enJwbVBrb1QxdDlFMXJBck1wQThHYWg3SVBJK282Mmh0TGxvQ09TVUQ1TjlU?=
 =?utf-8?B?M1gyNm1zRFpvR0ZLWCt1M3BRL1pRcVphNTUyeWZzMzlNdk9iZlMyNkZveDRM?=
 =?utf-8?B?SEsxbE94TFhTWFp4WjFyRExjSDZxd0MyTW1XeU5iT3BBS3dUbm43UHh3dWJw?=
 =?utf-8?B?THg3V0Ewd21NTUFIdExlWnQ0L3pWRmZEL1NiOE9nL1hLQ3dqdmxURmdPdWFs?=
 =?utf-8?B?ejZjMXg1WUtRL0psRWVnZkhPaWRST1lLNEltQWFtSzJYTTkyNVN6a2FZbG5Y?=
 =?utf-8?B?cU5pTTdqcGdGQTdYWnptVGxDWEFMU2pCalIxbjRwcENmOGlEOE8yY3pxV1di?=
 =?utf-8?B?c21hOU1IZCtWd1BhWnBUbnJzVHozZTJUV3phaWdISWZ2MjRndVRnRWhZUW5P?=
 =?utf-8?B?Lzg3akVuMDJ2WTROTHFjUytweTBIVzFJSHFEWC9CdkgvK3FkcWRnNzQ0enV3?=
 =?utf-8?B?REJXM0dBS2FMQWs3Tk1CQy9DbHZWb3Z6UGtaQVFNTXBDQ1RZZlhFNXpKaC9l?=
 =?utf-8?B?ZnQ0cWZTcVBXSDNiR21hTkdkTmYrNkFaV1NaTFY5S0VoeWRTUDI4dTJZRHpX?=
 =?utf-8?B?c0hJZ2RWVlVXenNVb3lEalBacGEvdEdmYnpzTlAya2tvaXltakQwbzkybnFE?=
 =?utf-8?B?MmtqcDFMNEdvbDE1eFB6VFFoOVRBT2tCd2tQczVHVVc0ZU1Mc21TWmRyVVNj?=
 =?utf-8?B?OTJvWmRWRFlPOWtRVG8wTXJ0YmRITmRJMUhybXJEUlh6NHZSWjYremcrME12?=
 =?utf-8?B?eWVYbVJwdGU1M3RySTZCSzRVdDZOWG5xbUlVSSt5Vi8zSDlRdXVJMW4vbFIw?=
 =?utf-8?B?N1pMSWJqYXptejB5K0ZUaFBOZzhEeGlTZmVxeUxIUDJ1NnN4elhpYklBTkZ0?=
 =?utf-8?B?clJVNVp6YW5UMzFyUXNEM0lRZlp6dXJyaGxDaFNIUmxZRmxSNEFBa3F6b2dx?=
 =?utf-8?B?bTBNWDE5aHFjQkt5R09id1ZhdWNaVnBKMkYwYXNLQzNnYkJSNGtXRDM0c0s0?=
 =?utf-8?B?Ui9NVm5qbFFRTlYxNEUwQ3JVNmkyZW9qRjlncXVJLzMzVGtvQlNTOStwbmJ2?=
 =?utf-8?B?ZUprRThlQ25KWEF1ZnF1UVpQanR5OElxSWV4d2ZyNmVpZFFwOGJIcVlEczFu?=
 =?utf-8?B?ZGxrallvOTc5UWtMYVcvVS9JWlRrZThuTVBVdnFQNmVjaU1vQVBuTTRvRlB4?=
 =?utf-8?B?c0pCWEZ4ZkRBb3oyZlREY3hkM0hlZHNPT25id0wvdStMK0FRdDJ4ZTFiODBi?=
 =?utf-8?B?MHZiOU5JRzd2WDVaWHFTQ2Y3SjlOSzA4aTd4eWZrY05kcjZrMFFidEJ1Nldr?=
 =?utf-8?B?Um1xQmQzRFRDUFgzbGdMWm5RbnNMeXRuM2t1R2tPcE9sY0tnSUw0NjAwQ3pq?=
 =?utf-8?B?bWlFZ0xadFhERCtRNlFvV3lPR3puNnFuUlFMcWNvSDBjQ1BTZzhuaUsycGlP?=
 =?utf-8?B?Wng3Y0svVFhQZlJjeStvNXJ4M2h6OFFub09SbTdHdXg0MjRYMlZ4ZXJEQ3RB?=
 =?utf-8?B?bmRDblEycjRhWFU4bFdPam9QbDY5NW5UUWs3MkpDck9IWVJaeEx4UHRVc1kx?=
 =?utf-8?B?T29UZmdJMVZmdDFBeDVIUGNFQWlXNTVkRWdwOE1aS0FTR1JOcE5HcjlSaWE1?=
 =?utf-8?B?eTd6Z2dwN0xGbTNXdHNuTjJwTUFoM1dFcVJjOE1rMWFPTno3ejlSVjJ5TWNP?=
 =?utf-8?B?aGF0dTF0OGs5RjlCMnhtbEd0Ty9kaERhQU0wMFBWYmFDTlFKbC9zY3dtbmcv?=
 =?utf-8?B?RVM4MnNLdC81bUdjMThYMXNvY0M1ZVhzMWsxYURrNUJHZEtEV2pJU2lxQjJT?=
 =?utf-8?B?dzk3eWUrTG9ZazJXWFZZVTcvTkJJOUdvaW1adDhjWWNOT0hhTFY1dWJIcm9s?=
 =?utf-8?B?MlNmZmpMNURVZ2hjbzNwajNJZzFBNmIwdGtpOE5TZWpGQUlhNUJJN1dRSVdH?=
 =?utf-8?B?ZlluUmVOdUUwOVMyUzZVc1BGcW85YVVZNHZVUDIxcVQ3MzU5M3hwWFlYZ0ww?=
 =?utf-8?B?Q21rdUtwTGptdnVmK2hEQUJlWWE1R1JIejJKVmpPcGlHQ09uV1psdnpLcWd2?=
 =?utf-8?B?dWY0WFRlZHpNWEJVUGV5R3pRRVYrUUlUVVZPVDQyVGVNbFVPZDRuVndTQmpX?=
 =?utf-8?B?UWpRNkpIWFVnclZyUC9TNmxlT0YzR0IyUVJ4K0djRm9MRytubml4QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c70f65-b1c5-479f-31f7-08da1216c903
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:30:29.9074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2G+WbSSEdspvMSxRXSMgZmsv8vBUKd5zFdVYTmcUUrZP2rbD2PX7lphFW143MzHLsJoKukKQXZwCFPWHqOE0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8171

On 29.03.2022 20:57, Daniel P. Smith wrote:
> On 3/29/22 02:43, Jan Beulich wrote:
>> On 28.03.2022 22:36, Daniel P. Smith wrote:
>>> During domain construction under dom0less and hyperlaunch it is necessary to
>>> allocate at least the event channel for xenstore and potentially the event
>>> channel for the core console. When dom0less and hyperlaunch are doing their
>>> construction logic they are executing under the idle domain context. The idle
>>> domain is not a privileged domain, it is not the target domain, and as a result
>>> under the current default XSM policy is not allowed to allocate the event
>>> channel.
>>
>> I appreciate the change is only needed there right now, but it feels
>> inconsistent. _If_ it is to remain that way, at least a comment needs
>> to be put in xsm_evtchn_unbound() making clear why this is a special
>> case, and hence clarifying to people what the approximate conditions
>> are to have such also put elsewhere. But imo it would be better to
>> make the adjustment right in xsm_default_action(), without touching
>> event_channel.c at all. Iirc altering xsm_default_action() was
>> discussed before, but I don't recall particular reasons speaking
>> against that approach.
> 
> By inconsistent, I take it you mean this is first place within an XSM
> hook where an access decision is based on the current domain being a
> system domain?

Well - yes and no. Even if further instances appeared, overall state
would still end up inconsistent.

> I do agree and would add a comment to the change in the
> XSM hook in a non-RFC version of the patch.
> 
> As to moving the check down into xsm_default_action(), the concern I
> have with doing so is that this would then make every XSM check succeed
> if `current->domain` is a system domain. Doing so would require a review
> of every function which has an XSM hoook to evaluate every invocation of
> those functions that,
>   1. is there ever a time when current->domain may be a system domain
>   2. if so,
>     a. is the invocation on behalf of the system domain
>     b. or is the invocation on behalf of a non-system domain
> 
> If there is any instance of 2b, then an inadvertent privilege escalation
> can occur on that path. For evtchn_alloc_unbound() I verified the only
> place, besides the new hyperlaunch calls, it is invoked is in the evtchn
> hypercall handler, where current should be pointing at the domain that
> made the hypercall.

Such an audit shouldn't be overly difficult, as the majority of XSM hook
invocations sit clearly visible on hypercall paths, where it is clear
that current->domain is not a system one.

>>> This patch only addresses the event channel situation by adjust the default XSM
>>> policy for xsm_evtchn_unbound to explicitly allow system domains to be able to
>>> make the allocation call.
>>
>> Indeed I'm having trouble seeing how your change would work for SILO
>> mode, albeit Stefano having tested this would make me assume he did
>> so in SILO mode, as that's the default on Arm iirc. Afaict
>> silo_mode_dom_check() should return false in the described situation.
> 
> Correct, this patch only addressed the default policy. If an equivalent
> change for SILO is desired, then it would be placed in
> silo_evtchn_unbound() and not in silo_mode_dom_check() for the same
> reasons I would be hesitant to place it in xsm_default_action().
> 
>> Similarly I don't see how things would work transparently with a
>> Flask policy in place. Regardless of you mentioning the restriction,
>> I think this wants resolving before the patch can go in.
> 
> To enable the equivalent in flask would require no hypervisor code
> changes. Instead that would be handled by adding the necessary rules to
> the appropriate flask policy file(s).

Of course this can be dealt with by adjusting policy file(s), but until
people do so they'd end up with a perceived regression and/or unexplained
difference in behavior from running in dummy (or SILO, once also taken
care of) mode.

Jan


