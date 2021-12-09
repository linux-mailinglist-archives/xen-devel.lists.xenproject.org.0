Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1D946E78D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 12:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242953.420157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvHYk-0007t1-12; Thu, 09 Dec 2021 11:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242953.420157; Thu, 09 Dec 2021 11:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvHYj-0007pv-U3; Thu, 09 Dec 2021 11:25:57 +0000
Received: by outflank-mailman (input) for mailman id 242953;
 Thu, 09 Dec 2021 11:25:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvHYi-0007pp-Dm
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 11:25:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c61e8660-58e2-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 12:25:55 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-Tan-l4GfPiWGABtMAICyow-1; Thu, 09 Dec 2021 12:25:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6669.eurprd04.prod.outlook.com (2603:10a6:803:125::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 11:25:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 11:25:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 11:25:50 +0000
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
X-Inumbo-ID: c61e8660-58e2-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639049155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yYqPUZG9XNvIfPJi004ntLCeF1YAfpmQ0Kw9pTrzNNE=;
	b=RNdQ/YbSHieOFn60Twx/8a9ydkLJn51MuTtWqa0v3Hssy+K12CFHqwCnbItyyeOB4qXFfz
	pVclzP/3cM01wzVRMnB5PrHDxEd/XpPqhY27b+no3f/fnCTJUieycg74MBFouOaejEqVDa
	qNpW1QARY9kp/LypA/iz6RCHTmAsKGE=
X-MC-Unique: Tan-l4GfPiWGABtMAICyow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFoi8xXDDI8cavi840vwpA9G4/w7YxFH9BFxddpc4RDajIBjUZs9wpaGRrOfrtETv3Pcsx/JI96Q7BmqhaGrphqrs2ANMahoHOytRa5Ruk8yFSPNDdRKDeU0v67EAvjbhU8lsXT+JQ7VlzudjSMjJTG5CfYsNt3zvkV9Xo6QA5ZtHgy2FCUBcZPNxLIW+fll/NHk/AU42JBe0pyDok2jTi1gabYkwC08By5fIp3dn7EkBWpNN9sBAjl93/ncTrvF3RjA01I7ENAcXG3No0fT3TSnkdvMHY+d+efswCQsFuw/0CL68imCNQh/vQZKlNsFUsmGC1bthp04Eumew7DKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYqPUZG9XNvIfPJi004ntLCeF1YAfpmQ0Kw9pTrzNNE=;
 b=YLekDiEJd4Xk1EO8muZ6sfL0LpU0O/SrJjJNFfSvIHLNtE1OQGXyiS1i5O7aCcR1XSIINzPvXsx3s0UStou2dJScump5dbH5xH5LkckO7KlNYuQ3ZtrLYnVUC8AI92pOvbMljoS+bFGkIVYxrw7yCBMqIe/PC7JZaduE3dovv0F0Gvku5V4bgXHFPY3P5LowZTtP8DE6Og5jLx4HfN1iiAolcP2B702hUI5U1Q0A8/Q6u+ANowpCeplndigWbXV5ziFJRU94yoQyjha54uO88/iRkA1bdSl3b4V6QxLQshI/H0Vzc/NeOQ66CPTEuT7JFeLEajLsIXgc779Po3lhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
Date: Thu, 9 Dec 2021 12:25:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/P2M: allow 2M superpage use for shadowed guests
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f90f8883-93f9-4724-7fac-08d9bb06a7fd
X-MS-TrafficTypeDiagnostic: VE1PR04MB6669:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6669C6D2A820671FDF468032B3709@VE1PR04MB6669.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PZtl1AWiDZxJqjqfIMLe/qfZqDIwZWktj9+be9BQJlr0X/xIC5KUtxjZJTyY27nuXSoToull1rxTc8bUwrFH2FC173VDgQmrsxCzn/uCATU34S4/dMjrdVv/jq1/SXTxvO21YpYI7eaeWPNdYx/VCE+fjbESaIQ3xORfhQdcfdh1RMm+p8ft6OPY5W3gPU+Ex7R69J6siJCGd6I1s7YKf2JkfS9zk6kULDIyRrMd1ujmUMZUDChEeH/27kL9afGNymHqQ9f8zusMISAcQ40b1U7KnB0IeF7E5OE1Umb28QDTy6oe1P64yh2uAjcN1q533/ZCta9qyTdkzCGNg+S0Z8EdH0qgIwcNk9FpBCgiu8Mwl4N/IMume0LFJeQH2yIRyijdCRXaYyYgWPsU2N1k1Xo2P3F8o5U+g2rU+sRuDW8pk8F6tGdqpSJvxEVLtX+GM/Pacqo4Y24Ww2gg9hywLP6ROD5fOgKKJ0P0LVwxkowPH4qSi/GOdObov8Yhe8EJtK0ekyDNxAc0ifCSYCBvb2vhIJjrZMYZpyA6NdSTzecJgaZU3dbVT1gHRguV0sAUjElFQSS2SNY7jUykRiibB4ZO9kR2oXWN01IyUeAG8pDxk0/xHpL56JHl9kzwpoGl7MRdOGluh+f3bcLN8Wqr76XKoYdT1lhQx6z8OvMhfAHFKu1LTENBtX+Qe/+bWsaw/Bk8TEzfsUFMQy2aSrpNsY4TIRRkPNFNxJYVdG66rIpr3YxReWUFGriZ6GJd1wKn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(66556008)(8936002)(26005)(86362001)(956004)(6916009)(66476007)(4326008)(66946007)(6486002)(31696002)(5660300002)(38100700002)(186003)(36756003)(508600001)(2616005)(316002)(8676002)(31686004)(83380400001)(16576012)(558084003)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkFTanhIUU1WdUFSYVU1VEFVcHZhUnFKNE5QaUtpNUoxSkRoQmdUWGp0cFNW?=
 =?utf-8?B?dmhhQUI5ZTdIQlV2YlpaWmxQQkFzWWcrU1JUeGpKQ3NwQjJESUNwMlJoaWRr?=
 =?utf-8?B?RXgwWkdpZERHVlFXaHI0eVZ3am5ZVEJqWFozVTJ4UzY1Nkh6OHM2QnhnUjZz?=
 =?utf-8?B?c1pNWUFkTDg5TU5aZDFKd1FUZEFVR0dsZWFRNVpMamRhMk5DWXVHOTZpYjBZ?=
 =?utf-8?B?TFdwdGNFa01CYWZ5L0d5b21vVzZINmtFR0ZOTGZ3bnNuejJqL2RsdTJQS2dD?=
 =?utf-8?B?OExQZVBLOHhFYnJuUGkvWlJnd1Z3dm9KYkdrSlRjeFlNWjdLVHJyQ041Tkdz?=
 =?utf-8?B?NW5IQ1drb3RYclM1OVdIRFZPZ2FWc0N4NTdEU09McnJwWWEwQUNQS1hvcXRW?=
 =?utf-8?B?UFFCckdEZzVQdVZydURGcUJ6RGlLT2ZLc1lMNnV2aHFuU01iNUErK3ZUb01p?=
 =?utf-8?B?VU5JVTVEM2RCYm53QVZYL1FQMkhwaUliYS8vTE8ra3dnV3ZwNjRjM2VOMWw0?=
 =?utf-8?B?U29iYlNiRTJtYlV6dVFRb3l5UlRXQW1vYktKYXpjaUN4VnJUYnFjRkp6V2Ev?=
 =?utf-8?B?cTFZUENJY1dFNXhORStQSGRCZXlXTEFacTE3NXZNV1FUZlR4MWVGS3hyd3hn?=
 =?utf-8?B?dThya09TbHJsTlRwcDFQVEp3ay9STmJyOXU3aUFUSW9uZUVITG4yMVZwNGxS?=
 =?utf-8?B?ajIrejJ1L1AwQ3ltOFh1a2hLNjRkQ2YwU1ZVeno4NlpBeVhPTk56aTNsYi9P?=
 =?utf-8?B?RVkwUldDd2xJT01WTVZ4RDZrZTFQeFFrZWw3bVN0RnRTVE5LZXdxQ2liMUVM?=
 =?utf-8?B?MUcyYmpHdllOOGxBeW5aOTdXVWd0b0VXS3ZkdzVDUTVXVDhYUEkvVnRZcURR?=
 =?utf-8?B?a1lBbnVjdVNNVXV4dTVwVWsxRE1aeStCeU9ReTJObnNMNFIvZVV6OTE4Wmcy?=
 =?utf-8?B?bU9LdlVmd2FyNVA1eklLajBIOWVWc1FEVnZEN1V6WGRZTWZZK0N1SEM0R2Jz?=
 =?utf-8?B?MTJBcnpXRHVxeWJ2OHBnY3ZjSUJHREx1ZG5kRUtTb0hRN0xjV0ZlQUdUdWZO?=
 =?utf-8?B?UE9tZnVJc2ZhbWRESG5SNUxvYnhVM0QydFdOdW9WT2lIWndncU9TVGVRRW8y?=
 =?utf-8?B?WG9OM3ZERXdNSmk2ZzJ3ckdMZHBYcGVzT2NsVDU3V1J1S2FBbldlZTE4Q2U3?=
 =?utf-8?B?Y1BxT1RJN0R3ZTFTQ0t1OEpndDVDdnVac1p0c01IMlQ3NDVFRHB6V1ZiK2hz?=
 =?utf-8?B?WDJ2cjAycUtlMThNU0FOVWpjMUVlbk9kVHhrcTB6d3g5MDRvV25LWlROYTFP?=
 =?utf-8?B?RjRGVGJHNXlFL1ZkcU9HaW5lN01Zb05TV3AzdWxYbmNkREJNUUtRR1lOMmlv?=
 =?utf-8?B?SlhTTUoza2ZXNm9BcldoZlZiWlN4RFUwUytzb1YrTGpGNGs2SmxSbFRSM2x2?=
 =?utf-8?B?R1cyaFY3S3RBcjllU3V6cmxMOFJGMXd0R1JSK0xZWFRqTzZ3dDRSZ09Gbmw4?=
 =?utf-8?B?R002eFFMczQ4YXpxN1NIQkZBam1FSThacUdMTkhNalppY1BYU2ZCYi8rMjYz?=
 =?utf-8?B?QkgxNUlkR2M2U3pGSUhwVkw4YjRXbFFyV3dVeDNoOHRSOGZIMnJkV3N0VGVI?=
 =?utf-8?B?SVdmY3BBVll4Z3hOZnZ5K1ZoTVZRUkpBUlZkU1puUHlCN3Jqd1o1aEFRc0Nk?=
 =?utf-8?B?dkFJa08xUDVaL09vL0hzMFpHYkN2a2RuRitaVy90NElaR2hpeTJiSEFaNzRh?=
 =?utf-8?B?RkQ2d29NMi91Q09sRkJ1THpvd0ZabUlPZW1nN1cwR2lCTjdZOW9Qb3pSY3Q2?=
 =?utf-8?B?RWpxZG9Pd0U1bUg1NHFSSTV5MnZvb002SUhyUHJtcVFrVE1aOHdUSTgyNkR3?=
 =?utf-8?B?Mk5odklKRDdPL2RrTHhXMzg1Vi9GYS9xSmJaT1RtWlMxakM1a1R1UkdGWlZX?=
 =?utf-8?B?SThoSUFWUVhUMDBOT2tKT3M1UkZwb2JmdHVZL2hiOUFUZmxoaFNZbUIzL2ho?=
 =?utf-8?B?QkFabDYwazlJb0RDQ0hhVTNEazJ1MU5seS9TaFpkQVdTcVgvWlpPc3lURjJ5?=
 =?utf-8?B?NlVUQWlYWjFkd3BRSGFkSTJlMWIyRFMvbzVkaUJyRnVWMXVONVRKNWRFcExX?=
 =?utf-8?B?Z0R3OGFUY25OeWw0TW80ZjVIRkxSVkt4N2gxaDhjdTFBR2ZhZUU0TG1kVEJP?=
 =?utf-8?Q?ddCaUJ5pwoUVI+2x+Pq6apA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90f8883-93f9-4724-7fac-08d9bb06a7fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 11:25:51.3921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jb4UsBJOmYb7nkOfkIRw7gEVAVKJD90FfEWpippPW1Lk4h4VUh15Z/0p+WZHxSRJRzPdD4i9o/xc2NPpp/pxbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6669

I did notice this anomaly in the context of IOMMU side work.

1: shadow: slightly consolidate sh_unshadow_for_p2m_change()
2: P2M: allow 2M superpage use for shadowed guests

Jan


