Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066D13FC7FF
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175714.320002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3cs-000827-Pe; Tue, 31 Aug 2021 13:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175714.320002; Tue, 31 Aug 2021 13:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3cs-0007zF-La; Tue, 31 Aug 2021 13:16:30 +0000
Received: by outflank-mailman (input) for mailman id 175714;
 Tue, 31 Aug 2021 13:16:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mL3cr-0007z9-3q
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:16:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a60d8b66-0a5d-11ec-ad36-12813bfff9fa;
 Tue, 31 Aug 2021 13:16:28 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-nJv2LhRlPiKAe46VFFzEyQ-1; Tue, 31 Aug 2021 15:16:26 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6914.eurprd04.prod.outlook.com (2603:10a6:208:189::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 13:16:23 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:16:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0195.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 13:16:23 +0000
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
X-Inumbo-ID: a60d8b66-0a5d-11ec-ad36-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630415787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VOCakBQ237jmym/DcN2vwm4c7ns3zoEHzkpfEm1onUM=;
	b=OOR4JQx/o6SXVTjZw0tRAPHVb6a7JHaoNDT5GiCzH7cflSRJzeFOagJ04xJdoGpNb0mOG7
	l6hNlmY2l0CXHPxZ6uikDXaGyARQdf37cVAyapJyC9JoD1m/mowLa6bTE30KUbkfwBwFFl
	0HNY260DDLJbCKXCxykjaRQ9M1Hquwc=
X-MC-Unique: nJv2LhRlPiKAe46VFFzEyQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQacvW45w35QYBs88Uur7vYxf52jknnHGA+PAJVhmA4PMTolejLEkm91MbfhNc0KBfSrhn5N7BF4/Hl2d/JclEDuAEHMgqjB9Qkq0Tz9ci8Omaz3ufSPbIzeDN3lQJuC9jbL2OyucTzRlJPF9RfieJncqExboGcCOWr9dJsHT/G3Cl3paUo1r1DoyeVhvcys8LXbN6BDRJGTty1fI3wiOn0QE1r4aTjSacFWf1GGULAUjkmpUTnI20AQoI+nHQVBQHRrAXCZ277HHh5mQ9umBHk83Q6/rX8watG30yMIcKGwE6wuO0xn39vg83NzcGpZzxqLuS9Gwe9XSxMFucXABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOCakBQ237jmym/DcN2vwm4c7ns3zoEHzkpfEm1onUM=;
 b=VauR62PaVwQqqMFzXikJYAeqW6y4PAt0tNeYl6p9uTcJlR+nigP/+QWfHox+VjQZM8u9XvA7Sg7r6vzePmvC1d1oIW7hsRWqigt19uE3nT9fsmk1IzwMUv4igZELesjB7nOwxjrbYz9E9RBr0snFiMbwvfuO7rhUXpWK8yOG/I/rlm92V4RO4sBIWsxibZjgR+1Recw1dosn8ZSLuik4TdX7OZAMca7+YTB4jRUOZaekrWji4kRW4WohTp31aK4T/Qh2fYXzAnz9RpoLloDbShy+EBTHdEd0TMLjlJoezVqjgqHR/07qfKYdx4ODg4z8VxtkW7lgKxnQCmk9Ar0TAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
Message-ID: <212ac248-1249-3e4c-9800-27c0e8e4c77a@suse.com>
Date: Tue, 31 Aug 2021 15:16:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0195.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::15) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebb145c6-95a9-4cdb-f8b7-08d96c8187eb
X-MS-TrafficTypeDiagnostic: AM0PR04MB6914:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6914ABFDD18A03E170B322DAB3CC9@AM0PR04MB6914.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LA38Rnr0i1Wuo4zIjj7T8V4ycuYCJ+4WM574zH3eMsTvInXzyH0dcaAUFV2PKUJTp+wxg35LD0D5sfv4EggSIFtS8I80iaIK1UnKjnBNqbQg9BsVgOBNAEWubais0BzlFNM6Xm6LNlUcVidKngrI0lbsFnmbuzN11TCiv18jih+LfgO+A02Jjl/nra905COJ8gT44VHbip728fgC6B/xnQOcoYx1vl5bSDKzcLLaOoPkGRaN51pBO/ysvY52YVKbUdJBVPL0AOGWfuugjwC+wuAPf8FX2BybhwZUNpa2m1x/Jz9rL7H34KQjKdJbDFRlIT0qAsqr2tundKZ/ChzoIU7ILMxXksYiRs60woR+gIOL4614zLjKkHKPGlmLZFvPrEycWXb3ei7i64ONhh6LtdsFwzKUywxscKp13i+UdehHEmK8yODT2j6+sCIakCqGcpXtHPKByAwZ3fjmEw372Jcw+bufeGFF1mTXlkEyOh2cSt7ZXEkwO//ltkP8piGqbqUrx5d58OSo6SC71cKNmf/PNpHgiYljttCaFDgJUIEjQWJVrQnLuEehGJkhRU31jmDviCLwvWqXvPD5BE0zg79XZzwYbGteinPvHh+Vdd3N5EgZtjvvKIZD5HM6wZmMmDBiWywJaorHE5ED802ZG2Ks5s2i+OL+bm2WXEpP1/Zm/CuBl9fUu1/qvSJfXLwwJoiT32WVW/jBMk9LuFnzU3IJvrGSbqSpvqQgXuKhBeI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(39850400004)(346002)(366004)(136003)(6916009)(956004)(66476007)(316002)(83380400001)(2616005)(16576012)(8676002)(54906003)(5660300002)(8936002)(66556008)(66946007)(478600001)(4326008)(36756003)(186003)(2906002)(26005)(53546011)(86362001)(31696002)(31686004)(38100700002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTVBNmVMdDczb29Wc1VacG5pbC9KanM3eVRBZDBSNEh6Z3RJUnFwRVVNVmFJ?=
 =?utf-8?B?bmtaTnZxeGQxbkpRc0dsaWFpQ09kMjNUUnp1VTNYMlR3NFd2MjZXY2hvWjA5?=
 =?utf-8?B?ZjVvaU1OY0VoVTNDbUVWSEpOYnBKNy9VdnY4bFBjYzNML2lTRU81VTAwVitI?=
 =?utf-8?B?YTU4cHpIS2N3UXFWbmJ4K0xUeXFZaUtnVE1tUGd3MDY1c0kyVjdpQk85Mmhy?=
 =?utf-8?B?L2l3L1FBZU5HdkJBMHZsSHdlY0g2S2ErYzA3clgzSWpyYVc1ZHVVdVI3Sk5B?=
 =?utf-8?B?VW1xSGFlRTVuSGlrazZjZ3Q5NnlKeDJwcE5mbDZCMmtjWUw1WjNzSHVlaG9t?=
 =?utf-8?B?eW1IM0tvbW5odXY2NHUzNXRUS01YSUU5SUZrdnRmQVZNamZZMmFPRnphWWRL?=
 =?utf-8?B?NE1MdTdnTmEyRjhNcXl2bFZvcXMvVmxDQjl4QUdRV3Z4YUJIdlVjaURJSXVN?=
 =?utf-8?B?bmdraUo4OVpRKzcyZXVGeUVtNHk0MXJuQWpUT1I0SnlyUnRuQkJ2MWtqaUF5?=
 =?utf-8?B?NERDeUl4ek9FalJROEVLWmpPa3R1WHRqanc2VFZwdElUYW93T0l0ZmQ0N1Ns?=
 =?utf-8?B?MXJBSGhsRGx2VkFlMEJZMS9TSnJ6WnU5T1pOMkRKMnd6eFhTWW1ZR0lvRTVv?=
 =?utf-8?B?VnF6ZzdsR1FUWWVvMGdZSHVaTFVDY2FBNnZwQUxCbngvcjdEcDBGWVMxbU0w?=
 =?utf-8?B?Qm9kOFArazU0b3FDeHA3bDVhZWJTQTdlMmRpUWRBdTJRdm5ROFFoMHdNKzI5?=
 =?utf-8?B?RFErTm8rYll4Q3JzR00wRmg4VFJmaWFmSUpLSS82anRnTGNZOEZBMmloWUtN?=
 =?utf-8?B?WUtGeVplck81VnkwQ2M0Mk9SSytKNkFmTUZxNjk5TnRpb0xWb0JWYWR0NExI?=
 =?utf-8?B?bWdRSUJpaEpybFFpTHdXWEIvR0ZMV0IrVzloSXFub1VRZkVreFByWmlFUTFW?=
 =?utf-8?B?R0NtWllnTm9DYXZDdFhqNzY5enBRckJyNFV0WEhIR0VIcjRwK0ZQUjVhajdt?=
 =?utf-8?B?eEJqUTdCNU1WZkpQdjVEdHBLTVZobG15TFcvV3lRb3FuYnlWMmJOd2VjcDV5?=
 =?utf-8?B?VXorc2ZjVFJUbk5sNnZWM21pUXEvV1ZidS94dGtWWlYwY0JjUjh2N0JUYndR?=
 =?utf-8?B?TXkxTU9nd2k4eEFjMVI0WTZJcnBTd2g2MmdSS2NDN1BTUVZ4WjlOekp2UWJz?=
 =?utf-8?B?MGpSZ0M5Z2Z0VXMwcUgrdWJZNzJaZjJDdEJ6SzJSQjI0bzUvMGVGOFYxTy9i?=
 =?utf-8?B?a0ozbFlCUkhXdmdyTXpid2M2OFdtYXhscEVBVjlpYkJLRXNLdjViQ0ZzdG9U?=
 =?utf-8?B?WnNXYlpidjdHTWxCV2EzSmpQaHFEZDRRdEEyTHFDaFV0WW0ybWljM3VHTSts?=
 =?utf-8?B?TWRDNkhQRDJUSjljdGRvK0Q1TlhONFV6WWlXd1Y0MExIQ1FtSVhXa253TjBn?=
 =?utf-8?B?S3lXNU5TZ0RoZm9WZ0NzTG4zNUU0dHFtMlJTemRQeU9JaXIyRDhGZVAwN3pZ?=
 =?utf-8?B?cldOVjA5blhHNGlodWdxcm9rQU9ZR2VTcCswVkZSQVJoVkRIZWdOV1Q0RWJF?=
 =?utf-8?B?TE9WOTBPT2ZjcU4vaTdnTTAzOUFQdVpaTHRFNnVqcEE0ZUlzQk14cHhuc1Jl?=
 =?utf-8?B?V2VaczZOVDE5c3dWTk9iTEtHYnQ5ZW15UDdaZFk1dWtmbkdpNy9EUFhEeEtC?=
 =?utf-8?B?ejRtcU01QnFVMlRUK09XU3J0a2pDQnFFVWRxajhWNmIwaUNUMGlGKzNRd003?=
 =?utf-8?Q?2KFWnNzSdGqcn9NQO/JV4Fpo5y6Hy0jGjG5x/9u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb145c6-95a9-4cdb-f8b7-08d96c8187eb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:16:23.8074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYzVZ1zm4nWMVW1QbTSFCd+MzOc0nJ/YAJ/TihD2Pt8Hsl6YJp8NX1L7u8mc2NtAVh5vFcLQG6xbFEbRlFwf+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6914

On 30.08.2021 15:02, Jan Beulich wrote:
> One of the changes comprising the fixes for XSA-378 disallows replacing
> MMIO mappings by unintended (for this purpose) code paths. At least in
> the case of PVH Dom0 hitting an RMRR covered by an E820 ACPI region,
> this is too strict. Generally short-circuit requests establishing the
> same kind of mapping that's already in place.
> 
> Further permit "access" to differ in the "executable" attribute. While
> ideally only ROM regions would get mapped with X set, getting there is
> quite a bit of work. Therefore, as a temporary measure, permit X to
> vary. For Dom0 the more permissive of the types will be used, while for
> DomU it'll be the more restrictive one.
> 
> While there, also add a log message to the other domain_crash()
> invocation that did prevent PVH Dom0 from coming up after the XSA-378
> changes.
> 
> Fixes: 753cb68e6530 ("x86/p2m: guard (in particular) identity mapping entries")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Btw, I had meant to have this post-commit-message remark here:

TBD: This could be generalized to all of R, W, and X. Dealing with just X
     is merely the minimum I found is immediately necessary.

Jan


