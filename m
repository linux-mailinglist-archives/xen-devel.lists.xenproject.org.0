Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A1E3C722E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 16:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155419.286901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3JOa-0004Vd-A7; Tue, 13 Jul 2021 14:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155419.286901; Tue, 13 Jul 2021 14:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3JOa-0004TL-6g; Tue, 13 Jul 2021 14:28:24 +0000
Received: by outflank-mailman (input) for mailman id 155419;
 Tue, 13 Jul 2021 14:28:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3JOZ-0004TF-08
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 14:28:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92e609e9-e3e6-11eb-8766-12813bfff9fa;
 Tue, 13 Jul 2021 14:28:21 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-l4Nrf5G4MM-1BbLLU3UmOw-2; Tue, 13 Jul 2021 16:28:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.24; Tue, 13 Jul
 2021 14:28:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 14:28:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0014.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 13 Jul 2021 14:28:16 +0000
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
X-Inumbo-ID: 92e609e9-e3e6-11eb-8766-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626186501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DznpkMNqZ0ohejiR3qL3nZcQ+XKnW2f7V7/asPvb7o4=;
	b=AGw8xUlFA43DLHnRZNg7yhwQxYT7rpk/co1sX/RVSgqFcHT3GraWlS1VHSrQDv+goJEx2o
	G52GOTP+AhiKXibFeiVAhFIu5y9/ydpF0x8nt11x4iS1m29DSHeXvtTh+G0UJ2zKL+JEMY
	fI4ni5rcnNpV+4JpQwNRXIJdtfJkKPQ=
X-MC-Unique: l4Nrf5G4MM-1BbLLU3UmOw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKFOYHhtFd2sYMyppvV+mdeqO30ramvHc6fdAIQYW85WshGy3N9GmWeDWFuPvvcav7GD79Rmt5+VMmrW/tvYNKN+i7ArfiKaetM0P2tHIryO4JYrEVQyaiEZ+PktMWqphLsVO/hLfa/e0yPqS3URB/a39TyKE1tSHOlRawoygtAMFov7dDiwy3mtH0GMEMm/CDryVpuRoA4PsgrATOZmewPS5aaudOm2iAtT+eGY05iOgbf2O6QOVOjpAgZouJ1wTFWkOAo7bNQP+BXVDN9yqngNP0FN0WYnwkLVZNJW/VWFO5jGw2H4WPUOjp6J3ABL/lMb7jSko9crzGfhzZvwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DznpkMNqZ0ohejiR3qL3nZcQ+XKnW2f7V7/asPvb7o4=;
 b=YW6nQaBcG6GWMXCx3R9J3h0lykYv+6RFNXw/q/0p4OYsnB/uHaVVf/gD5uzjIP8VLFhwOGyXpZAKSCwH/zYw2YS92Q3s48zAsM6gwi+O5PbhqXbi/AVdzPiJodICCnkovML1Kd7OUxP9PpaHA9B0aLCxsNdLO76TsBoJjh3I7j8n7ZGdhJagMf7cY+3b5P6340X8fty60eMDmcO0ICQZ5BT1hZAGpMOgunVThxSLsDrawSrxYfaKVkSSlsB5LpnWHmD74bok4mrXRDw99WjqvuQsaYk64sU2ALvZqyNxinUNdzGJlJRYSXMgVyFWgTvW2cE4xCpgaAXBQpikoWDcQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Juergen Gross <jgross@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Julien Grall <julien@xen.org>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
 <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
 <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
 <69c62b4c-b46f-9eab-8dfd-742c07423424@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6ab28be1-3b75-3b17-828b-6a4c6147726e@suse.com>
Date: Tue, 13 Jul 2021 16:28:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <69c62b4c-b46f-9eab-8dfd-742c07423424@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0014.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46a0a21a-d274-4e3e-4990-08d9460a74ab
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5469B162A21CB18719966B3DB3149@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z6h51ViBCZvIlVPJFdGCjC61zaYxs/PpOhytMehW1dyGBircMVJ43T3QnA2ECGTnw361jhLWuBqs8EaVwZE1BM30iDGlxl9gCHWnM735vW7xbkI6gyTdicXl8PE8QMTZh8Rq69omsqeKEokS2JmVVz50iFDQ7OK1Smfw2opqS2Of0INNgwdQSRaSEGrqZYgauKZa9b2YJ8M0O3w3ULO3sLTySm4Iti1tzmZrMO+L5EifwvU3KmPjgspm4VY3WQAH12xE7EoZ8uHh1aoVmnwgDdi51SJ3IzhWSxn7o93PHpecd+g/owmQ5z6OmwHYeWKBsDdD4GfOfb1uTcu5ZqW4k8OBaNQTxkDiigPgUMRC3dvSZ36fm4U6cwWTQRY4W6Yz+B4vNqYgNiSL/m57PTVWWvJFt22qJ5fS3vPj5vGG9DaoyoWdyETBepR6U6ChSneXhDOH2b2N/+F5d+5hKH28gGNeY6iG9090hECzBOWkiLnysq9/wcYXsRFO0dPeEkeMY+8YsIHjx6MKNu4EKG4E2PyRKvsBjqEdK7mgsB6oV0EHSdK9jM8ocLxFMjOofBErSwv1X+ZTsONcFEohO79G6CnyhhfzzPct8/DAUL+26jTAoJ1cBaWFzvRyMRXoTBsEg5nMUJ9eFGd+X9ugPH5N6nVdMjY+edydGuERRGtNFZEjYCN3pbqa5j4wihJSwVDWw8688AW1OTgamkLGNQqlWQH1BoMgdXUmspmxUrFa9YaFL6wMJmr/oOPsqIq94BxOoewREO4wF7Jt8HSpJsgTPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(366004)(346002)(376002)(396003)(31696002)(83380400001)(53546011)(36756003)(86362001)(186003)(37006003)(2906002)(4326008)(478600001)(38100700002)(6862004)(31686004)(956004)(6486002)(66946007)(26005)(66476007)(8936002)(66556008)(8676002)(6636002)(16576012)(316002)(54906003)(2616005)(5660300002)(98903001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHNyT1lPNUpCaEtkcWVsbXBnaDJXZUVoQkpReWRlNmRQWkRaOUVQQ2ZpbEFD?=
 =?utf-8?B?aHlHbVdZZjdkNGMwQ0dpR2lwUkdTc3RyOUVGcGNNc21BY0ZoSWZ2b0JDeHND?=
 =?utf-8?B?T213YW9EVjJ0YzlUQ05rZTByeDFFWkRBMDAxdER3OUI0bURKOGFmSnp1SWJZ?=
 =?utf-8?B?cll5MitLTVQzcE9paFI3WnZ0ODlVdVdSZTRyOWJISHdudDYvenU0aWdlb25v?=
 =?utf-8?B?NnY5dkhDdW14c1ZnSWxsZWhrL2Foc0g1NjdGT214OUZlR0svdjVPVjBTVXNQ?=
 =?utf-8?B?d0VBRFJHSE50T1ZWdEtIME1kQXl1OGlFa3dPUGtNUjJVVWN5S0RrY09UOTAv?=
 =?utf-8?B?eGY1b3dyMEhoSEFyMGprQ3orMk1raEtoalZ0ZGFKdWlsZmJ6bFNpN2dlVzlG?=
 =?utf-8?B?UGxaSURQZFdGdDdaT0FQVFZRTktyUmZsUFp6VjdFYzh1U3FKMWwwN0xBekVC?=
 =?utf-8?B?UFlRZFpaNzFFWFJuazQxM2Q0M1VPa2ZvdXV2K09OQ3d2MU5za24yVXFGeTdw?=
 =?utf-8?B?RFNoMWJ6WU1vdFBQa3FBQVNxSFIxK0lXaEFDQUJDMldWM3Q5Wm8wM1BhQ2M2?=
 =?utf-8?B?SG56WE1nR1VFR3Y2TFBhRFBlZ2lDNTNrMzIxSSs2UlhxSEhSSXVqKzNFMHFC?=
 =?utf-8?B?dUIwYjJXS3h3dWRscVBGOHBwRlJJWTF1TDBadnl6THZ0ZE5iY2ZCMzFMeHo2?=
 =?utf-8?B?UnUzODN2dHNpc3FMbDlVOXF3MlJWcnNYRWRQTnA3cHlSZ0JDc0xZbkdYTElu?=
 =?utf-8?B?aDZvVks3R3dGVWRsbVZSblJJa0c1NWZxR0JOQndtNU1mcUo0NkM0N1BGWE9t?=
 =?utf-8?B?T2JZcmhpRUFVTXcrc2MvRkpscDhXMFYyOEdjWlRUWFUzWmIwSEREMzZ3akY1?=
 =?utf-8?B?M1FWdkpRbXcrM3o3MHo1MVFOVzdiU1E5eFdwRWdDdUJEeHN2OUc2ZzNMeEVo?=
 =?utf-8?B?UXcrZlgwc285R0tCM0NNOU8rRnZVd21mNVhQbys3TktHbWJYNUtDSlFvTlhR?=
 =?utf-8?B?NnZjZ09jQ21yWEQ3TWVBREY4YW9MMXV0T3lZNDNHMVZCaDN6UWJsa3RCSEZQ?=
 =?utf-8?B?ZlFQRHVMTmNsSE85b2t2Q0RsbGdlUWEwNHpvTUZ3VjlER1A4bzVpYW1lcUUw?=
 =?utf-8?B?MWhLMVU1OC83TWQxV3ZXUWRVUFZvd0RxMk8yWlNnMDVXUUFUcjlvN29mQmdj?=
 =?utf-8?B?N1FBL3hYWlc5dEhqQ0ZDQ0FGd3B3aHIxbWhQZjhQVzVobThVd0ZySTJMV2M0?=
 =?utf-8?B?ZTdjaWQ1VjBudGxXY3BNRGxOelk4YmRCZm4ydFE0bTBHVzlYOHVtQzJKclRo?=
 =?utf-8?B?WEtXRXl3Rmt2QUdhSTV3cnNHbnNLR2ZvM2o1YVByVmpuaGlnbHV4ek9vNVp5?=
 =?utf-8?B?NEtkVERHcEJGdnFBaG15by9sREl2RTI3NGdhVGF5aFBiWGZMVDFSTmo1M2dG?=
 =?utf-8?B?MjVmdlNwQ0FieFUzdE94TU5odS8vUkZjLzZna1BsT1JPaGVWRWFoUlhUNVFx?=
 =?utf-8?B?NmpEOFlmRWN0bkVRcFVCZkMzN3FMY1AyRU9kd0NFdVc4NnFEMitHSlREN1Fx?=
 =?utf-8?B?N1lnYm1pTEo2dDVMU1Q0dG95VkxxbkJLaURoS3FBUkx4SGtmdW1oSnluTWt6?=
 =?utf-8?B?bkdQYlRvRjEyeDBtM3hpZ0VvNXE4eHVXLzhDejBUODVoZ1h5Y3REK1lKNDFR?=
 =?utf-8?B?SHJhSWx0S1pxVUdZbUIwblF5ZFB0eDVoMi9mQWNJb0N0MjF5cmV1V0Fjbm5x?=
 =?utf-8?Q?8SciPp4isw2X72wd04G2PzfllOnSPsozQaQ3HaM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a0a21a-d274-4e3e-4990-08d9460a74ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 14:28:17.1805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNgH1zjxDbyw/JOOTi8DkXTK/8/pQsRe+S2z9R8Fgvt/SUM6pMVbxqCZwthWwHDnxUpWx879rD5Y/y3XEM0W7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

On 13.07.2021 16:23, Juergen Gross wrote:
> On 13.07.21 16:19, Julien Grall wrote:
>> On 13/07/2021 15:14, Jan Beulich wrote:
>>>> And I don't think it should be named XC_PAGE_*, but rather XEN_PAGE_*.
>>>
>>> Even that doesn't seem right to me, at least in principle. There 
>>> shouldn't
>>> be a build time setting when it may vary at runtime. IOW on Arm I think a
>>> runtime query to the hypervisor would be needed instead.
>>
>> Yes, we want to be able to use the same userspace/OS without rebuilding 
>> to a specific hypervisor page size.
> 
> This define is used for accessing data of other domains. See the define
> for XEN_PAGE_SIZE in xen/include/public/io/ring.h
> 
> So it should be a constant (minimal) page size for all hypervisors and
> guests of an architecture.

But that's only because of limitations baked into ring.h. For example,
a grant shouldn't be (address,attributes), but (address,order,attributes).
A frontend running in an OS with 16k page size could then still announce
a single ring "page", and a backend running in an OS with 4k page size
would still have no trouble mapping that ring. (The other way around
would of course get more interesting.)

Jan


