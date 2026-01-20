Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDLJGTa8b2kOMQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 18:32:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE837489B5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 18:32:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209236.1521331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viFa9-0002n9-SB; Tue, 20 Jan 2026 17:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209236.1521331; Tue, 20 Jan 2026 17:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viFa9-0002ku-Mo; Tue, 20 Jan 2026 17:31:57 +0000
Received: by outflank-mailman (input) for mailman id 1209236;
 Tue, 20 Jan 2026 17:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h83G=7Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viFa8-0002Vt-RU
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 17:31:56 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8d29e9e-f625-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 18:31:53 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5309.namprd03.prod.outlook.com (2603:10b6:208:1eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 17:31:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:31:49 +0000
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
X-Inumbo-ID: e8d29e9e-f625-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uc9bEBvbhKa+h93JzJ2A0T+dD/JdJNQ6Hg8hlQrjYRONWxoaWxKBWg/QpqXkmEnJ9gBBNUlEDYqEXWNWAmA6MnM5/UJfLYAai/IS1oLdaZOKa2m6oGUK4pz5DIqCKuIa1JBqWRPT0mHkvUPV+n4J4eQ/EXG6FvgQz2ZjEbM2u65f5wgg33Py13Wve7eaUpT2DTw3VNIla8y2oGG3b9EWlHOtWi1exgcNjml/vbOyYX0X3Nre9DDEwdiOsaPKcjmdEzzEPRa5HwY3Rk1325ptwLYRT+PZbxsRf/ek7HwaP3OvSvIxX+GL8ekagaot6tl0NMxgBK88wqg2fsY6t1NV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mx6myohIm13VyIszTbrMs5hKisSzjFDtROryRvQaC9o=;
 b=wTNgGp19Yevi7o1GUiwGGsAI4+Ugpp0M4HZDFFm9dfmKhnE3eQC1kssUhceilPH3lzNmP9tKMOKpCXrkFEZhz68nmfVBKk4y6kNnc1GU+94ALB+7ElkeSDW+UrU+ic7eQqinARtTVGkwYc7nhCJOJG1VTQ63WjJ9FCZJfkDxWiF3HJ/+B4tnZkFjKXAUCOUQm+t86gQrpyxzL2m/IYS18RqTad2vJW6rdHoCYfVcs84/aWIwbTXGM4sDoEQZkph22XUzU33JKQl7N6IJRsmc7ogls0y78iJ9iPFsvAecG1+wYHHbRutTAp54Z9Uxv2+8qiKUx7XtMELIQCByC8XqfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mx6myohIm13VyIszTbrMs5hKisSzjFDtROryRvQaC9o=;
 b=C7CMV3y7gSoyooSCmLXKrFSlsd6O6/nQ1KVLjWXBGeP4pVSbhYmnUkNkpHe7RXmYBkL/u+aWgTGKtNxUJVVbmDLWO1FQrcEz9utpTnBGFjr8V4ZRIOOxwnjAwvtGkqmBVlL8lF96Cv0z/KX4vfbCUjE194wfeshePTH1CNiAPs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9085b5dd-af68-42c3-bd8d-ddbecd8ad7db@citrix.com>
Date: Tue, 20 Jan 2026 17:31:45 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jbeulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v4 4/5] docs/misra: Remove earlycpio.c from the Eclair
 exclusion list.
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-5-alejandro.garciavallejo@amd.com>
 <1d374226e3f91ab3bbc05c3354c8f8fe@bugseng.com>
 <DFTDPKJN6EHE.3LH3Z9WEO0AGW@amd.com>
 <bd95ae24c9b9767467938dcd42a93a6d@bugseng.com>
 <DFTE7R78R78U.2T09MMJU7F0CF@amd.com> <DFTELY2QHKPN.P7317UWE8QZR@amd.com>
 <0a6eca6eb344e9829ed9e0b381f26e95@bugseng.com>
 <d07d6040-cc6b-4634-b4ac-041bb903d6fa@citrix.com>
 <a5a217974ec7c6c0aa96610bbbe48dd5@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <a5a217974ec7c6c0aa96610bbbe48dd5@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0200.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f06b1d-9602-4888-4b0b-08de5849caaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUpwYlVwT0M2a3U5TlMyOUtlVSsyMEVkc0tldkxqWmpOdXIxdUNadHlxWlRG?=
 =?utf-8?B?UmtHVFlORXoySTNSL2RFVXZWb3hQNXRjR0hyNDVkLzZkWFZIVXl4dE52Rmp3?=
 =?utf-8?B?aVhoOVVLeStlemp5YWJPN2h2L3NNZ2FGc2hQSHlMOHVwZk9Zd0JUU3R0RWtv?=
 =?utf-8?B?QlhtTmJJOFdtb1Zha0J0Q3ErMndQMGx1WDRYTElaY3NGYWNRdnJtd2dVN1Rr?=
 =?utf-8?B?QnY3N1krTnVmd3Z6UVZ1ak5PbTZ1YmhVTGhMc2NCZ1VDZmk4M2JCdVc5M1o0?=
 =?utf-8?B?dERYc1daTlpPVmtTQTUvYVQ4TWZZSSsvNWdaaWxwZUVKNFBmdFh3UjhSTk9x?=
 =?utf-8?B?ODlIdmFTeW5lMnQ4Rm5sZVpCcjZCYkdhellaQUdJRG9BVU1SWkJhUCs4cndt?=
 =?utf-8?B?K0VFdE1XeEszV1c4NlRZNkRESUUxQ0VuUUc2b0U3NmFSbHhpWkdaVUw1YVFk?=
 =?utf-8?B?UFFYZTRLNkxYcnBXRE5icjU1ditETnlReTF4VjcyY0Q4aGZLdkhkWUN1aWp5?=
 =?utf-8?B?N2pPWld4ZFBUUjhDQVlhZFlxYjR0R1REMTh6RFp1SURSeDd5YWN6d2tTb3Fa?=
 =?utf-8?B?UzcxQ2FJN0hzbVgwbFM4cUs1UHgvdjFjYW1mV1FtSEoxWHlJMG14UngrdWI2?=
 =?utf-8?B?V2FnTVF0YlE3Z1hOS3grZEJPeXJGNUttdEVVTzhlQjd0U0xwcDFOaE5rczZm?=
 =?utf-8?B?STRjOE9sdHdqdVZyTlFPbzJpUko0b3YwVVZ5YWg0RmNyRnl1empadWlTVnlF?=
 =?utf-8?B?M0k3QnZ1amhseWphM3NlMlI2MlppZmh3cmEwZ25JQ0ZKSjNXVG1nZk90UENp?=
 =?utf-8?B?aXhpbE1XZE9vUUFSQnFQTkdSazFYM0IwQkJwakdMbDkzdG9kdWtHbkJvc21v?=
 =?utf-8?B?Mk0vZTZIUFlzbmowU3RweHNxYmxoNHJQOElnMjJWWE9pVHV2YjQrcEVBNGYy?=
 =?utf-8?B?cEpVK2FXb0JjUmFzN0NKb3R0cFdiYXlJRGJWYlVZYXBhVGFQUVN6NzVGR3JG?=
 =?utf-8?B?NnZKT2s1MzRXNE9lbHhuWnZsWWpxcmJRUzJ3L2Q1cDJvN21rUmRzVnBuU2dY?=
 =?utf-8?B?SGh1ekh5ekxCMllFWllIUGp5MkthQklENlQ5eC9Jd0t2ekVMMTM0c1MwVFFa?=
 =?utf-8?B?ODJHTDEyMmF3Wmthc2hMbVovc2hwdmxUVUg5NXFFWWpVMnJvQUdxWjJEZ1Jk?=
 =?utf-8?B?UWZqL2YyWFY1clNLR3BqRWVWTGpmbkRjdFV2aWFWNlBaWFQ2aVhtWUlnK0tX?=
 =?utf-8?B?UzFFcVkwMExsZWhRbmJjYkVycytZN055SC9UVFNrTllhTmIxOFJLN1FZdG50?=
 =?utf-8?B?eUtFKzhOVWpHTmthREphNGowV2RndUJtUlUrbVdnWGlHRzlmVUREbFcvRnY1?=
 =?utf-8?B?N1RnYVN0eU9oNW9VTWNlWTFaNlZnUjczZUd5MC9EUy9ITGhlaFY1MVRaVlBW?=
 =?utf-8?B?Wnl0dCtiWGkvVTlhSHBFdUl5VVJibmNweG1Ea2ZUT0RMZXVEOERTN0ZNU3hQ?=
 =?utf-8?B?WE9sc1ZhZnI5MFc2SXhUV01YcnNhM3FBa1hiYStSclp2c0VjME5MeDFmMGJr?=
 =?utf-8?B?bGJBNXJCUkRMN09DRDBXMXZuVUlFSGpHa2RsK0xJcDBKZWZNdmc4NjVsWVlK?=
 =?utf-8?B?SUJVdStEdUhCYXlpREE1eU1GTkdRQUtyUmlZVmV6c2Njb3NWZXppTk8xNjFn?=
 =?utf-8?B?eUJBVEdoVU9RdU80R1IramdhdjVSK2RYTG5VRS93S1hJRnRJa3daVFhTdVdu?=
 =?utf-8?B?Z3FjWHM1UTB3RGhzV2dQNEtvSXRQMlpVc0h0Yy9iQnd2dzB1M3BNYWY0YkR3?=
 =?utf-8?B?N1V1NzByMFRXaFJjSmtBTDZxVG1KVW5zR0lSYXVVdVpyWngzaE13QllveXVr?=
 =?utf-8?B?cS9TQ25QNjZ4WS85Uzk5VWM4azVrOVFzbElVYU5iUU5sbFduTzRTUzRwbVB0?=
 =?utf-8?B?SnNjQlcyK2lCbEpvUnArZ1BYcVpHeGR5Z1hmRVFCd2RXREFPUjh1ck1UWHNR?=
 =?utf-8?B?U2VzWGhpaWRpMHNxQVd6Um5ySnVWT2x6ZmMyckVadm1zL0pDbzBpS1pZcXk1?=
 =?utf-8?Q?E606dg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUw4Q0laM2hOT1VvRHdRb3ZrY0Q0ODBBMDRGV1VER2xqUHpoc1JXNEhLZGhE?=
 =?utf-8?B?VTh1Qk10dVZjVm5POGJlRitUcnJ3eWo5dWlMdk9oRDRlUHVyZXoxejF0UEw4?=
 =?utf-8?B?bFF4Q0IxckZzemRTckQ0OXhtQWhCZWRlaitVWGRPcURXVC9RTEU5RVdqQmwz?=
 =?utf-8?B?VWVmeGZSSzV6Z0tEM2dJVm1vb3NBUHN5NWdmN3B2RGFpTmxpVVR5eHQ0ZjFL?=
 =?utf-8?B?WTNkQnd0MVcxb24vZGV0WExOZEFkQm1oVlJyTUlwQ1ZzNUR6ekRteVpzZmFG?=
 =?utf-8?B?S251Uk9XdXEvL3gvNEh3OGxzVjJBaURWbmsyT2QrY1Y1VlpCOE1UR1NObHgx?=
 =?utf-8?B?cFhJZjUvSWx6THJBY2ZrYTYzS0ZsNkVKbFcvSW9BZzNNYUduTE52elA1RDZY?=
 =?utf-8?B?NTRYY2p4SWJxS3FpaG1RdFl3c3lXMkRSWFBjbUUvYXNkcUNxdW1ISmJaMGYw?=
 =?utf-8?B?VjdYSDViQ0hDZ1o4MmdNdVVtZUVJWkx4Mk9vV0FtY1MrdUY3c0VpUUJ5eFUx?=
 =?utf-8?B?NnpuNnEvc1hLS0hYRndieXN6ZHhxU2lFWUpNNDZlNEMxbG1qR05XSDhsNERq?=
 =?utf-8?B?dnBnRjlEZEViYlB4cnVQWGluQXpTWUxLMjZkenp0Qlg1YXdKcXRNVlpFMEZH?=
 =?utf-8?B?WitUTkVDcE8ySklJakFPNlNPSGZsSVF4Mm1iY1hRblF2aG1mNnRUSWRIM1dM?=
 =?utf-8?B?ZmsxR1Fpanh0K3JGVzJOamlYbzBwMlkrOFcydGhvNlR1S0poelZqcm1pUXRB?=
 =?utf-8?B?TmpBazVCODI3VTdzNG9NYzUydjAvK3FFVU40NXV2VmZ6STdMRXFpdE1wV3dS?=
 =?utf-8?B?TGo3KzdDeFFYSnV4UWV3U1MwWWtpZHRBQk5jYi9xTERqVmhSdTFPaUlOMTQw?=
 =?utf-8?B?S0RFMldKTm4xb1ZxdWJZRGRCbkQ1VFZ3R1FacmJzMmxjTE95NFc1Y0l2RnlC?=
 =?utf-8?B?a1UvTWEwRmhPWDRGaGR3R0JJcUxvUmI5TXVlald5RzNkcy83MXkwaTIyT3VB?=
 =?utf-8?B?Q3VFaGtvcGZEVGlvQkhMc0hHOXltUXh4djFGeFFPdVhtcG5ScVprQmtRNU90?=
 =?utf-8?B?UUtPZitlNWhwUHNwcmdKdWMxR2hwY095MlJXR1RVaXNERVIwWW9FMkpDRjd2?=
 =?utf-8?B?VFVpclp0SHhrK3ZPMXBLSVl3eUE0TFhSV3U2M0p5Rm1YRytSQlE2RUxsb3Iv?=
 =?utf-8?B?TmxCQ2tqOXhMTU9UZE5YZUJkYTRCYkd2N25SWVBtOXFUaFQ4V0drWU5hcXR6?=
 =?utf-8?B?OVFpYnJkWnErdUxkOUdvVjBNamNQSTdoWHRDNWJsRVBKN3pxU3AwRFBWbHRC?=
 =?utf-8?B?ZmRuaHpBYXRGOWlVdUpXd2x0dHh5YlNoUTFMdWh3cStudVdiMWIzZTlQZ1FN?=
 =?utf-8?B?aFhOMU4yU3lPV0NCVUdFb0pjZloveWVwRWJZNnRXT2k1K3l4SG5qVnRUUVll?=
 =?utf-8?B?Y1FEbjNDZmdEempobkpId3JnS05FUHkzYVYrc0hFMEV1ejNmTDdsZHBSZEZ2?=
 =?utf-8?B?MTdlTXJxcUpxaDR4SURHY2pKSFc5MGQ1Y1IwY2g1dnMzREZZQUZ2S2FpVFZD?=
 =?utf-8?B?ZCttRStMamc1enVCaWdXNTF6SHB6U0x4R09sVFRHVjUvdTNUZEo3bmtmVXFx?=
 =?utf-8?B?dlU5dUdWbkc0aFZZelhHbnhPMTl4UWU0QndnOTYxYjdJZzhvQzlLMEk5Unp6?=
 =?utf-8?B?RHBZOEhaR1N4NEhDQ24rNWtmWVNQVVlLYnF2V0tpMjI4MFVjMzQrSVhWQ2Ft?=
 =?utf-8?B?cjFHcUpWU2FzTW1UcTR6Rzc0OXNocjBpdExxbkM1MnZrU1V0ekRqRFVhZ21W?=
 =?utf-8?B?cldxSkVhTlBIRjlrOTUzQVhKa2IvNXV6cWJuOHk0b1d2NjBVc3BrOFdSQlps?=
 =?utf-8?B?OFNWZEY1eFpkR3NRemVmOUUva0l3c0Z1c0RiN3ZOcGxxRlZrWHhwSmlQaEx1?=
 =?utf-8?B?NmFja2Y3ZmNjYXNTOTJTY0oxL05tMEo2cVEwSUZIKzl5QlBMcjl2TTNCaVp4?=
 =?utf-8?B?L2RFWVY1NUlLbzc0RDV5ZmNpK1hoSlBHRWRXeUFONnNaNU56WHRVMHdxc2RM?=
 =?utf-8?B?UDNRWk9naE42a213a0I2SG1qUzd3dXR4ZnVoYytkSDNqSjNvMmcxNTMwLzJN?=
 =?utf-8?B?Z0ZQdC9lRXRMN001WFNhWFZkTjZKZE1BKyt0NXI0WVhXbTR0cXpQOGQ3a0xj?=
 =?utf-8?B?WHhYUVozOGw1YkhBSi9ZVFU0WEUxbWlEbzM1THhzN3Q0eFZhbzdCd2p4c0hk?=
 =?utf-8?B?blFUNEdjR3FkQzdRTC9kN0xNQzY3TVZmdGtObkhJc3o3SENMalFYbU5YSFph?=
 =?utf-8?B?b1ZmaHZwVDJBUmFCNUZLZlAyOGY4d3ZjdDU1eDdIKy9vdThXbjZMN1lmVzQ2?=
 =?utf-8?Q?eGd59PHwOnAGRXh4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f06b1d-9602-4888-4b0b-08de5849caaa
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:31:49.0100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGr2kRhNyfn+aP7cBwLwsTYqPFlOMoJZSmE3KI+9G5hi5MBVcA3hswmpmXYNkNMMOyWPjqPTF2qVTG3G596An/XQFOTs0S36reERPqQfWE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5309
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,xenproject.org:url,citrix.com:mid,citrix.com:dkim,gitlab.com:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel-bounces@lists.xenproject.org,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BE837489B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 3:25 pm, Nicola Vetrini wrote:
> On 2026-01-20 16:14, Andrew Cooper wrote:
>> On 20/01/2026 2:20 pm, Nicola Vetrini wrote:
>>> On 2026-01-20 13:09, Alejandro Vallejo wrote:
>>>> On Tue Jan 20, 2026 at 12:51 PM CET, Alejandro Vallejo wrote:
>>>>> On Tue Jan 20, 2026 at 12:41 PM CET, Nicola Vetrini wrote:
>>>>>> On 2026-01-20 12:27, Alejandro Vallejo wrote:
>>>>>>> On Tue Jan 20, 2026 at 12:21 PM CET, Nicola Vetrini wrote:
>>>>>>>> On 2026-01-20 10:38, Alejandro Vallejo wrote:
>>>>>>>>> It's clean.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Alejandro Vallejo
>>>>>>>>> <alejandro.garciavallejo@amd.com>
>>>>>>>>> ---
>>>>>>>>>  docs/misra/exclude-list.json | 4 ----
>>>>>>>>>  1 file changed, 4 deletions(-)
>>>>>>>>>
>>>>>>>>
>>>>>>>> Hi. Do you have a link to a pipeline?
>>>>>>>
>>>>>>> In the cover letter. I only run it on allcode.
>>>>>>>
>>>>>>
>>>>>> I see. I can spot these additional violations from earlycpio.c. It
>>>>>> does
>>>>>> not result in a failure, but only because x86_64-allcode has also
>>>>>> other
>>>>>> non-clean guidelines and is thus allowed to fail. Ideally in some
>>>>>> copious free time I'd send a patch to create a subset of clean
>>>>>> guidelines for the *-allcode analysis that is failing, so that the
>>>>>> "allow_fail: true" can be removed.
>>>>>>
>>>>>> https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/xen-project/people/agvallejo/xen/ECLAIR_normal/ucode-disable_v4/X86_64/12771570090/PROJECT.ecd;/by_main_file/xen/lib/earlycpio.c.html
>>>>>>
>>>>>>
>>>>>
>>>>> The web interface doesn't allow to search?! Sigh... thanks for the
>>>>> pointer.
>>>>
>>>> It's your usual mess of miscasting, enum-as-int, etc.
>>>>
>>>> Would you rather keep the exclusion and deal with it later or let it
>>>> pile up?
>>>> I just don't have the time to go into it myself.
>>>>
>>>
>>> Well, including more stuff in the scan doesn't hurt and it's only a
>>> handful of reports that could be fixed, but the maintainers will have
>>> the final say. This file is not really inside my area as a reviewer,
>>> but if it helps:
>>>
>>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>
>> I'm not seeing anything in that report that's on the clean and blocking
>> list.  But to double check, I've started
>>
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2274001675
>>
>>
>> which is this patch in isolation to see if anything shows up in the
>> *-amd runs.
>>
>
> https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/xen-project/people/agvallejo/xen/ECLAIR_normal/ucode-disable_v4/X86_64/12771570090/PROJECT.ecd;/by_main_file/xen/lib/earlycpio.c.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":1,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"clean","inputs":[{"enabled":true,"text":"added"}]},{"enabled":true,"negated":true,"kind":0,"domain":"kind","inputs":[{"enabled":true,"text":"caution"}]}]}}}
>
>
> Looks ugly, but it's a direct view into the clean:added selection:
> R10.2, R20.7, R7.1 in short.
>

And to follow up:

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/12783298989

So, earlycpio.c is not clean to the clean-subset for the AMD target build.


In terms of ordering the series, patches 1 and 5 want to go in first, to
get ucode disabled in the AMD target build.

This patch wants merging into 3 for bisectibility reasons, but the
justification wanted is "so it's included in the *-allcode" analysis.

~Andrew

