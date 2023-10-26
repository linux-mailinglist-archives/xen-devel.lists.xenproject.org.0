Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A07D7D11
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 08:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623494.971373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuEj-0004my-CA; Thu, 26 Oct 2023 06:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623494.971373; Thu, 26 Oct 2023 06:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuEj-0004l7-9K; Thu, 26 Oct 2023 06:52:57 +0000
Received: by outflank-mailman (input) for mailman id 623494;
 Thu, 26 Oct 2023 06:52:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvuEi-0004l1-1n
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 06:52:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a1263fd-73cc-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 08:52:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9373.eurprd04.prod.outlook.com (2603:10a6:102:2b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.8; Thu, 26 Oct
 2023 06:52:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 06:52:51 +0000
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
X-Inumbo-ID: 4a1263fd-73cc-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFMrNc0soOdyGZEG3UKln3zHvGlciKQ6PQYopr9vBKzhNEcPf7Oape9IzkmRsKFKL5aOatCSEFn/qN+D24ryOWJ8N1eHbZsVsFiDoSZgxfHvOHU3kyewjoKTfV5V5Uw+czXfzwPHXyPTQOGv528ODW0s51z4tZfjLF4UUcxJrPzsbGQRi8umwgiyUv4/w8A5O5dxprzQUPXmlbKdesmIscmdLJoQiAJ935BhDw/G1Dbg2/Kp6mzPpF4YQly2di5uOeWsouSYW5ERv9s1wGAIP0TGD/8iya3KYyS2ESenb9amMjOVAITlxExOikH2BrYPcmJ0teUWfWuoQceacy0LrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcaqsFmdUh6Pz6g89a+kS9NqhCSDftwj2y9r0SAFVXg=;
 b=cMDSCm1YIRhbsYIvMBgQXrdgbUkxWi8ikCGL4apPjb5CNarvj2SAXJV+kWsP/I2VR5JYmShdV3wNZjDX4K40lx5TDxkwitqvsO0lHxo+uao1zh4uZjePTK6juCj4VemejzDg5Cm8gYn9qAkpuGqGeYqc1li6yyC34aIF5zeYYdXqs6fdC6R89HzCBS7WMce5ZfmUR2d1DeAR5owBG6eP4/8oHMY5MEiTLoRe6w0Nyp1YDlasZnBZL+sQUuyMAxxf+9HvVxvAX2iH09lMzlDz/zBEvroBXsflO/6Dyyo0uFyVXo+6DpkqskSox8lnh7FS8dD/4mthszFfqpC9vAe8Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcaqsFmdUh6Pz6g89a+kS9NqhCSDftwj2y9r0SAFVXg=;
 b=Sb/FPuSSRcJazPFVCvNopo8/53RIYNUGZlOJniPfIEoXl8Vk2efAsSLJxHZfIQjB/CCqHyvsXBkuzVRlisywUaTSviY3scBku6r7bC0b6GSRpnCyZfRG3z7Y1AtFudIYFCPtg/bWWj1MaYo+RH6sTImuAn0rwOZ8oVP/S2qxJwTuOzpXagek1noxXeeq34VGQKylZK5QZo5VVUs4zIYkBowaUQSnZVsJ9RWIGoHZF9jJhnzw40Edw9hptYx0526Fnj1TTDCA38+KlON7jtR3rVWxTlvEOnrLg07ubCI5slW7kG5Uww6C+pmCfDFp/rSzhSdqojlQJAnBjwtZO0wZrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3cc22b2d-fbcf-899e-1d7d-036a53bd0f7f@suse.com>
Date: Thu, 26 Oct 2023 08:52:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen/include: add macro LOWEST_BIT
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697815135.git.nicola.vetrini@bugseng.com>
 <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com>
 <f504772a-68b4-fbfa-e7d4-8d22992c7944@suse.com>
 <f23a1f95916bd61ddcd5002428d8876c@bugseng.com>
 <6d113a237846c7a41aa083e806f172e7@bugseng.com>
 <5475d9e5-ec1c-7f71-ee77-59ec2e6ee01e@suse.com>
 <alpine.DEB.2.22.394.2310231340320.3516@ubuntu-linux-20-04-desktop>
 <dd33e92f-03aa-cf3c-23d7-dcf9cce23c8e@suse.com>
 <2f88afb2383b5fdecf83d311ebe69bb4@bugseng.com>
 <96dd7efb-c214-2155-c5d1-3b9a47c10d33@suse.com>
 <alpine.DEB.2.22.394.2310251537460.271731@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310251537460.271731@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9373:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad92ba0-3f68-410f-9ff2-08dbd5f02c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	piy5NqmIDyNM0VGmiHJNyTacf/kYoR7L9EYdoC25UwPVtC+dkE0LttbXTuTRAdkcSsmV6JCeGTTiFFO+GS4DbmGzy0cGEm2qJQEP74mM7ATBhPwiT4dUYT3fbVKAP0h2W3Ned8Y0sGhOl+9p1gNdTFXHieBTJeUC2cCMIYPVuJtw/HzU4AiETLzdBItZ5mHgkNAvNf+5OHHbvVYVLsh09WXhP6fDc0XoPJ265JfcEBUWT6odWY7Z83FgA8XydX5r5zieFuOdUwoBKadTStqanFI8MwtF2Qqcn82Y8XVLkqFzeJoaJu7Vc+woXYEcPtNhPthketePDvV55sCCTUk3EUzRE0qWVT3lsWPyUYgkFd+0G1shLmawTYUWFzhLm/NBwARcygRciGtIav23c2gS22IV1DXCKN3CAi7qUEkBFX1cMSL9bo8eCU0PI6efvOkLDonWBjdzXZbZti/4B+3+CtsQ+/aTvzRb4yNWfL7FAxE0pUI3MN9SdW/Qx3T3BeeTLPMv+BOF/Z72NffauUD/5pOpgsyDZjaIG+yLbLKyUUtCNKVjgxnR+pgc8/KQjQixCS0j3G76rDzPbJ4qJIb5Sg0lRcvca/rLcA3n0IZJTjOpvNg/f0YStANxEENSrCnIAyU1ecHSToWKPRCRbkRb2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(39860400002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2616005)(6512007)(41300700001)(5660300002)(26005)(6486002)(8676002)(4326008)(8936002)(478600001)(6916009)(66946007)(54906003)(66476007)(66556008)(316002)(36756003)(6506007)(53546011)(6666004)(86362001)(31686004)(38100700002)(2906002)(31696002)(83380400001)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1R3UkhGNU4rMkdsK3ZIRTZZamhtYnRWZ2s3MTBxbW85WU1TR0dhYlRDWktX?=
 =?utf-8?B?YTdjeFhCdERPK2tJL1JJUGNpM1Uya2cyb3ZYMmM0VDVqREdhVnlvQU95dUFu?=
 =?utf-8?B?SXdNeHJGckdIUnhHZ3NYc0YwT1pscGVKUHhmM0dIdjhWQllXMU11cnRZbTFz?=
 =?utf-8?B?NHEwSElDMjRFZVlYZnlGaDhmcnl6dTNINldhSS9BUjhOUysyY3dJR1JQckFZ?=
 =?utf-8?B?Yk1aVlNsaVo3eE1jaE1FUDJIaFoyRVNGTjN0aFZvTExuTWppNVp6M2d6RWlR?=
 =?utf-8?B?MXU5YjMxK0NPSnpQcUhTNmRuZTVXRFliYndFV2Y1N2dKYnYxWGE3WVk5ZUlT?=
 =?utf-8?B?cE9ERnV3S0dwUkMrQlNXaDhXSXR5N08vVFBiTWJ5WDBpYTFENEwzcmJYVDlu?=
 =?utf-8?B?SXJpYW5oayt1ODJxN3NZYms3T3UxSUV5bnRlM0lXY2RFRXBLY0Y0dWlybmFF?=
 =?utf-8?B?YUhCdGhFWTRLV3B4bkdnLytyUlBqbmw1bml1L1Juc3JMUHJMUnVtcDFpQSt3?=
 =?utf-8?B?R3hrT3NaZTVFZlRtcTlPM1VkRzFyRTJ3VUJ5cjkxaE5qSkErdXY1MWJXSGRP?=
 =?utf-8?B?RkxTSEs3aXMxakZrQkJ4RGtleFBudGdRNVIxcUU2c2c3bmhZYWNNektGb1dh?=
 =?utf-8?B?eWNuNjE5WnBIdGhCa1hxV1lLbitMRm4xSmJQYkhFKzkwbnJGdFZJelhyRzJL?=
 =?utf-8?B?R05WNFVDQVV1alIySmtLUldVdEFyc1ExK0pKcTJjd2p2TFNHYTRTaDFhTWNX?=
 =?utf-8?B?bDRTWnJzUkEyL3V4U3dyUFBYUWdJbTJRVUJya1hEQmtWTUVjdzdvVTJ5dVpW?=
 =?utf-8?B?SndsWWtCNDkzK1MyR3p0dG5YR05YNFhvSjQxVEpZKzRoSmwvaDFPNml1MXVK?=
 =?utf-8?B?SW5xOEdYTHdUemk2aEkxMENFeG9GdStrQWZpdlFkN3BEdzZQRDA2OE1Lb0pD?=
 =?utf-8?B?c3FSN0M2NHdiZlZ3VWN3dDBvYjBUamZsME04Um5TR3JOUE5QZ0RQdmc0UUpw?=
 =?utf-8?B?QVZ2T1F2ci9wSy9sRlNpQWpRd2hyc3dlQ2VSOU5PeVRFcDYwcUVvQWtLdFNz?=
 =?utf-8?B?TXpPaFVQenkwWU5KQW8rVEdja1Bya0VqdzBDRnE1ZzdLZWp6OCt1QXhTSW82?=
 =?utf-8?B?TDJUOUZoc2pIbzl5UzQ2dXhUV05XWHExakxFQmJhZ2JvaGZ4ZUxleGdTa3NC?=
 =?utf-8?B?TnBCWkc4ZTRqZEN1NERLdWJkMk1JYUJIYVErS0FJQ1hhemp0anFuNEgxenlK?=
 =?utf-8?B?ZXBHRlExZE1weDRDNW16NUVMR3hoN0lNNndlVGs3ekZEdWJ5OTRWRmFnYk1Y?=
 =?utf-8?B?a0ZsNzk2djZKUTlkZndxRytQMnVrODBsRlN5VC9tNzc2VHpmV2xZTE5xK0hJ?=
 =?utf-8?B?Y0hWeXF1a0wra0tKd3BZMVl5MEE5RzBFUkN5S2VBWlRYTEtEd2dtV2FsTHVj?=
 =?utf-8?B?S2k1N01HWCtLS3pjWVJsbVFSWFVocTVkN2RQdzVHUmNNNkNzcmV5aDZBamd3?=
 =?utf-8?B?d0xhVVVibE9zVmJYdFhWS2czQ3ptTnkwdWtlYXhtQXhSVTcxOURGT1Q2QkRO?=
 =?utf-8?B?YS90Qm1kSjIxdGZmcGdYQWVTUitYT1BtbldSemgzZFZraitsVFlOb2l3c1hv?=
 =?utf-8?B?K2YxWVNHSE1xdk9UTUxmdnVRMjNVN1dSa2FZZzUyYUtmaVB0eWdzWXljNlJW?=
 =?utf-8?B?TG5XUTV4a0RxUHRHVFhmbWloalF1Rlp2ZXlBS0hlRzZ4bERlMm5WREFGbThH?=
 =?utf-8?B?MTN4aTk1c0J3T0ZmOGxoeFBTYXhXaDVDOXY5VHBlSXk0NXgxcFNLUGtLNlp4?=
 =?utf-8?B?QU9XVFJLdTJWK2ZSYnR3ZUZNM0tTNGN2eGRqMXVFQmR2UlZFQUN2NkhtbkNs?=
 =?utf-8?B?TFUxc1NhM0ZCTHNGYTdXUjBEMXZQcFBzMXlENHdKTmk0ZGlVUGdVd2hXcjlk?=
 =?utf-8?B?a1BndWpkYTB0OGdjbTQ5dW1Na0tMVTBvMmRtTHVSWTBNZ0o1VEFkQzJEcVE3?=
 =?utf-8?B?WnE4SWlMMERsVmZZK2hUL3ZMTHhBK0JDVjh1M1RGeXp2ZHcxdzJ1MC9TQXNN?=
 =?utf-8?B?QXN0SW9ZRW45Q0NkeEhBa1M1TGp3Q2FIM0pnNSthSFNqRVZqOWJ6Ujl5NGt3?=
 =?utf-8?Q?12j3mECrwubrUqIeGXzMMA6qU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad92ba0-3f68-410f-9ff2-08dbd5f02c3c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 06:52:51.5391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UTS2O7b56yklpF3Qp8nfBjcGO86hrpNTbvgYtGuHPi/AR75KvXHcYd1Iefd15A0VTS+EATywmNH1k8u+rDK7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9373

On 26.10.2023 00:38, Stefano Stabellini wrote:
> On Wed, 25 Oct 2023, Jan Beulich wrote:
>> On 25.10.2023 16:50, Nicola Vetrini wrote:
>>> Ok, I'll send a revised version using MASK_LOWEST_BIT, taking into 
>>> account also the
>>> other comments about the explanation on the macro definition
>>> (which some IDEs even show when hovering on its usage, which could 
>>> partially address
>>> the latter concern).
>>
>> You're of course free to do so, but since - as indicated before -
>> MASK_LOWEST_BIT() imo isn't a better name than LOWEST_BIT(), I'll
>> continue to object.
> 
> Jan if you are OK with that I'll ask Julien to break the tie and pick
> the name to use. Julien can you please help us move forward?

Hmm, I'm having trouble seeing us at the point of breaking ties yet.
First we need naming suggestions which actually unambiguously
describe what's being done by the macro. I gave one suggestion which
I think fulfills this property, but is a little too long for my
taste. I gave another suggestion with a far-off but shorter name,
which I can appreciate isn't liked. I've not seen other suggestions
fulfilling this base criteria.

Jan

