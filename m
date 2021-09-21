Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C884412F27
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:15:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191387.341386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSZzk-0001qM-Rt; Tue, 21 Sep 2021 07:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191387.341386; Tue, 21 Sep 2021 07:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSZzk-0001nr-Oi; Tue, 21 Sep 2021 07:15:12 +0000
Received: by outflank-mailman (input) for mailman id 191387;
 Tue, 21 Sep 2021 07:15:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSZzj-0001nl-Ob
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:15:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7912a0d-1aab-11ec-b89f-12813bfff9fa;
 Tue, 21 Sep 2021 07:15:10 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-2Bzb933yMwO-WOt8yPouNw-1; Tue, 21 Sep 2021 09:15:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Tue, 21 Sep
 2021 07:15:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:15:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.7 via Frontend Transport; Tue, 21 Sep 2021 07:15:05 +0000
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
X-Inumbo-ID: a7912a0d-1aab-11ec-b89f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632208509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/tLyqZXftS9tJZQtKl3aFz3f9UuO7C+fVECXMxxqC6Q=;
	b=Ya65qKbXnaxtYDfCXltEjdM6lpQ2NeF6rKJDc9WM3dxSikIL7+sah+yM0V2yrSa5yb0/lc
	lrd68KTj/HfYpLklkp5fGAW55IbzUvUWymEfh4mRgg98UPfhKme1pJ+T7qW4GZmP5pTuNX
	NWUAu9YdaueMYP2As4caVxbiQ6/wOgM=
X-MC-Unique: 2Bzb933yMwO-WOt8yPouNw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3aA2sgRvuEP1yOoaeXz3W3Qge2ftuWfDAh9jlD6Pzb5+ofn+7afOhb26pYKIBVhLQgpzKn4bUv7CjV7b6ijCKnGOr8fI3UPGrAsr3LuFxOBtYW5hrmnd0k/rKY6XPLlk0u71LpIjZhDFFVwy4ScldA25P1J0OoP4ydq+ocIpBJIWzOjbLrtld5N9CN61LXzJAkh3cm5i22B77fzyyl/R9rug7trJad9NOJE7A/Z+II8UFPcazGaM3Tfci/Wzwxqhdl8DDTB82bPaACvPiJnYGiR7Fd4Y8vt1i0/fNbTPOZwf8Mu98JLbLczmO6bwt6f9AOg9zObDwluTQEgb4tV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/tLyqZXftS9tJZQtKl3aFz3f9UuO7C+fVECXMxxqC6Q=;
 b=XbUR7dNYMYwpKCe34BopX+QvKCnU0WinPVo2a+1nsCpfXETciqjnq9cZ/pRq3kEsx20fgw8PVrKAM4R8tG5C+THkCbtzxu63NkiJkW/rFScNUcQ6vjqwsPMJL8/H0sjzQQbu+mYdCZOfBrPUo/HfKWQhQ+jtxfrGah0W/xZam9LBqNvM9lGjuygta05p5GKq5jd+FCVyWs0yXS6NJl7yTrJmVDgiodEjqzlSIQM4iZLZ0LHPwm+WnWb8xCexCnEMXaTrkXO+c4iKXUHAQZVEwOdERmQPFKZ314LP9EYZ4bwlLdzzLqTSX9c44VlhlnIM/ivWmUGSkV41vGzT1WcOMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/9] x86/PVH: Dom0 building adjustments
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Date: Tue, 21 Sep 2021 09:15:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bd167a8-45eb-43a3-0130-08d97ccf89cf
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445DD1BA69D3EC921A67629B3A19@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2OFzrQnmQi5L4qj/bSO9OkpwHpQkEGEj+KP9BofSgnDX51o2NzQHjshSZOks1Q3rVuVussMYb5irpHsOxZn5BC6W7jNqBZjxp9Md/ju7JgJ9I3R0gaA3t2goWwn0TYxs5JOvMja4EBa1xt2CPmubVkt4Wy3lUWlEUSeOMu9h7Bryi2A+mZcWGzknJZ7bbCtewUPyLgJDFF9k7sIu31GJaH5FRRKYjeil/F5VMEVahrAb558B6Jigr9Emj721uXt/CSOPkPCoQSISWDTcI/Wp2hxbk2RJWRApPY4HOrV9wzgwuufPY39Lv/D10U8o1uVcatdctz3zdIyqzB/u/+viR2MllcNiQtvWh8SWochiU6/BbgnuIpMDQ+Ek/B39+vftU4OG3xZ72km3tba61pNBVmRmVUZs9PF04qWYKoUGlzkHmjdPjSfgRHlXwQ4SDsQEwIdJw3XYYQMJcv42PtLKp/QQhGM5kKN2BKLr1JsSMk5XXc2wTOQouvftO4J3JseDZZdQVp8kAQE+nBzeTmjEdDfZTRYWniSRXXfNtAUTXhQLQzmRVUUXkzmEs3B8ZxriESyWJ8wX3ra81l9VY/th4w7f/NzndL28peTICUwolsr3A8nz+jktZmtWWNb+DqVnXCmP+lv4tAQMjImTGUt4LLEwYjs6w50Pds8RAGRLVoKa+tqFJAUn0GwpOqJVLhBAUcczYIgFHmcM2ktzr5LMkS3bEIfIP5xpQv+N4hrKwPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8676002)(186003)(54906003)(36756003)(31686004)(2906002)(16576012)(316002)(956004)(8936002)(38100700002)(2616005)(6486002)(31696002)(66556008)(66476007)(66946007)(5660300002)(4326008)(6916009)(26005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0hzZElUYmNSaTVLNTVGT2RFRXZsdGQwZzZuZVlzd1cxY0haTTlMRmlaZ3Bk?=
 =?utf-8?B?bmNueGhMQi9XNE85YlJzZ21HQmpWTWtDMHZ1Q3A2QlRHaUtrNWQwMEdHeDRk?=
 =?utf-8?B?SzZwTUIycFJVZVRjVzEzV2x0RXYyRlljRjM3Qkg2ak8xVzB4MnUxL2JCT2c4?=
 =?utf-8?B?ZnBIYS9EL3dZaVhqR3ptQnp0V25wTUtqM09KbjNVbmdqYXV4OGNFbXZpNkRa?=
 =?utf-8?B?czRac1JtQU9ROTRBbDJsbEhxNDljWXpPRXg0cm9sUlBUVXBwMWNQcjd5cVlp?=
 =?utf-8?B?bHJZN1ptQnNpZ0s3S0VTVEp4VzFQK0dvNnRPNnpzUVN2Y0pVZkxYbmgzYkx0?=
 =?utf-8?B?OW4yQ1B0eDM3TDlOc1JLNG0vMXM3Y1pIVG9vMDB2QzI2WmFnY0xQajg4WURQ?=
 =?utf-8?B?STVMWm16cWRWQWg4bWNDYlJoTmNqeUxSdE0xR0NxOUFaS1puTkkvTmVGT3BV?=
 =?utf-8?B?ZmlVcGN2cjU2TUt5NW92SzRnYzJMWWQxUnl1Z25ZR2w2N24xRE5MVWh5bGVo?=
 =?utf-8?B?UDJUNE9iQ3hGYytDQ1NsNXAwSFZOdVh3NC90ZE41STNaZXp5NDB1MXNqNjht?=
 =?utf-8?B?ZWJCeTNhaitNRHV5UUtYQ2oyMEp5bEduVFRYV2syUElOTWZ4VmZkajk4TjlL?=
 =?utf-8?B?SFNLNzV5VXdrNVVMam4rWEtyTjdJR3kzL2FCZGJsWjNpYlRtL2JUMCtWeU5Q?=
 =?utf-8?B?RkplcFBucFhSVU5KSjdodm1LbXE0YlF4UzVxenlaMjZDRVZwVTZscUlJOGJ1?=
 =?utf-8?B?TWFVT2JNRVl3OWFSTysrbHl4YytkREIrdFZQQ1ZmWXZCNitBQ3c1UDJ5c1ZY?=
 =?utf-8?B?Q0NCaEpHSzd4bHhkem45OXpGa1N6bUcrOXFhN1dvRzI0akpwMTVRQW5QNWNq?=
 =?utf-8?B?Q256RTYrYnExRVRFRDRHSitiaXFxVFcydSt5SXBEOGhudDYvc3VtbURPMFVv?=
 =?utf-8?B?eW55cHJUSGJNZ3haZ212ZkZUa2UyUVpDZ3UrWTJXVlYvYlBOc1p2VU9IN2FS?=
 =?utf-8?B?VzhPdjNmMk9TNVM2dEt5bk5DdnE5aVhFbEdacXByallBMHltZzJSRnArYmwx?=
 =?utf-8?B?cWlpVFJrNVNwQlQvTDBuY01iK2kxSEF3WFNUNnQwWml5Zy94OUZGUDNGZ0ph?=
 =?utf-8?B?S2ZndFNlcndhTmVxak9jUGZQKytmN1hvOE1BaFpkTGdyVEVGV1UvejFiQVls?=
 =?utf-8?B?aVo2WjJTTmJoa29qYlNEbytxOWI3UXovWUc5TDlaNUVoOWJETkhMWlZOSXRD?=
 =?utf-8?B?Wis1NHcrY0c4TDBLL0p6bVNqOXpVZUx5Y0J3Yk5aRGRvcE9UUzY4RGdLR2Zw?=
 =?utf-8?B?cWk3bTN0ODRSblRzTVFBNTlLajg5Ymphd09PSEpVc1lrU3VrL2pLYnR4aEJa?=
 =?utf-8?B?dDdiS1dadTlyZ25RM2l4U3RnMk9uOHk2R09KOEhzb25JL0g5bmZXVld6RGRq?=
 =?utf-8?B?K2IrTWk0WmlXNmFpdnZNc1gzaXNpcmprRWRTVXNDUXE3Y25mWXk4cUlmOTcw?=
 =?utf-8?B?ZWFXcWEyYUZYOFpVZW8vTTF3OW5rT3JVK0lRTXNiNSs4Rll6cGJzY1Z5VmVR?=
 =?utf-8?B?dEY5RVJBMXVKZFF4RjJtTm04Q2cwOVJ6RUJFZThyc25TYzk5eFlmS1IxUk9k?=
 =?utf-8?B?b0EvNktGUGI4MEtDUVVDc0U3M2VNN21Wai9rNWExZXgvK29ya2tDc1V1K2kw?=
 =?utf-8?B?bTNCbGp0bWM5NEVGY1Z3M2Q1bnJtRE9peTNDOEJVSEdQcWVOWTErK1dIVHBG?=
 =?utf-8?Q?rXAVcFcHDusMCCqGTBna5m3FFTJPDI8myHLvWnv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd167a8-45eb-43a3-0130-08d97ccf89cf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:15:06.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stekjAhzlDSFx5FqzNod9YT1TYGaRwxTjPNmr2ht3WbJhfxMho5aej17YXnqURtpXantBRyZDnO6/YVlM9IlRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

In the course of fixing XSA-378 fallout I ran into a number of
issues, which this series is trying to deal with. The majority of
the changes is pretty much independent of one another.

There was another rather basic issue to fight first (patch
was submitted separately as RFC): vPCI wasn't aware of hidden PCI
devices, hitting an ASSERT(). Obviously I couldn't afford not
having a functioning serial console.

Compared to v2 there are a number of new changes here, and a
controversial one has been moved to the end. See individual
patches for details.

1: PVH: improve Dom0 memory size calculation
2: PV: properly set shadow allocation for Dom0
3: PVH: permit more physdevop-s to be used by Dom0
4: PVH: provide VGA console info to Dom0
5: PVH: actually show Dom0's register state from debug key '0'
6: HVM: convert hvm_virtual_to_linear_addr() to be remote-capable
7: PVH: actually show Dom0's stacks from debug key '0'
8: HVM: skip offline vCPU-s when dumping VMCBs/VMCSes
9: P2M: relax permissions of PVH Dom0's MMIO entries

Jan


