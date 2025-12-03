Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFCAC9FA5B
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 16:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176901.1501351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQp4V-0000li-83; Wed, 03 Dec 2025 15:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176901.1501351; Wed, 03 Dec 2025 15:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQp4V-0000k7-5E; Wed, 03 Dec 2025 15:47:15 +0000
Received: by outflank-mailman (input) for mailman id 1176901;
 Wed, 03 Dec 2025 15:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybfj=6J=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vQp4T-0000k1-Aj
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 15:47:13 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5445aee6-d05f-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 16:47:10 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by DU4PR03MB10790.eurprd03.prod.outlook.com (2603:10a6:10:581::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 15:47:07 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 15:47:06 +0000
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
X-Inumbo-ID: 5445aee6-d05f-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=My/fBeAHxuneSnqJLrdRgN8norGm0oOqbCoonUIHe+4nQosx7J7lXvanrSzoFeGB1Ht3R0hrs0GvvJhmmG4F1PTXfwvHNc/um4faZFJukjYokb5EQDYetM7xpCAsfRNDpkbM5/ax7gKOwJcguyNil+kjAXNUpcfNqEzZmMdXXibePyKPTyexkPkpVZCigzuJHLhgYKoqg+Ni+pAF1pFCWffJBYHD8FuLvOov3UXoW/uatVnzLajQ1JDSPr4x/o5ycTn1u6PHHzXPRcPHgmILpSJR142264xo7PxmMs03rF8xkpbbWT+q7OJ49GI257gMyDjVog3nfNa18jPQ0vWLCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFGrzGtLPPmLrMXllGtxZJge1JQG65AnI2RWLpvahHI=;
 b=LGUTD+OeqQdJJjObilOui/tXvMBxkbcqhXDqp3J1O1eN/Xy7S1HTuPQL47A/ass1QoGR/OXKzVC+5T3vg8WV5fd2Zmq6rCkEi53oNP5istLIjtCG1rCuC7TX7gLKmPgy3oIFgDPz9stG/b6uW3r6wUzM8m/vcSByMIPRnFJHw6voIh+KEjFN2xXtjwrrNNveWxT6aInqW7cEZzFVxaddxtkKrp/+2r51Dxxpq7KZMDFPHJx0HpOhT2tLGTnwstIRdQDzii3YvkDR3Oh/+82kbExxzkM7UDlyUkE7jEPTsZ3oRT0P151vKa3M3qPYBPqYYNGGuN8E+08Z5+XYBlNf2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFGrzGtLPPmLrMXllGtxZJge1JQG65AnI2RWLpvahHI=;
 b=I6ByLeWj92QrEjpy0C0GmxpuOHKpO7fALDAJIwIjXqaZ3ZbZV+eznK9B0ZefTs1AKWu3VWf60U7MKxouihnYmmdtG/oVO7aYSRQEG6zQwGw0DKxLn/eJrzGjgB6rBgDXCud04xNma5L4A2MVJ+38dOy5H/rqoX47lYCzGmj1uSsksPq5HqGvxGZ0GOBOZ2jK0bRagCnie4ePhLL3/sX5kES21K6QLNiGLGJdqeBzXr3vVxCTGv1R+yQA2ykdrJ0ThLOBf7YjMzXPqgfc5P428JKu37QkrBtyqtyRALjPJod/u8s2Ec3xE5j89DHwRn8AgI4ANsm5pmCPcHHc11uS5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <9c07b1b6-4543-41ba-b58e-1494654a0425@epam.com>
Date: Wed, 3 Dec 2025 16:47:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
To: Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Nick Rosbrook
 <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
 <12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
 <b1f79b84-d0c4-4807-87a7-1cf94e58ecee@xen.org>
 <a5943713-85fa-48ad-86fe-5698604ed8c9@epam.com> <87v7m93bo0.fsf@epam.com>
 <6c80a929-8139-4461-b11c-e6ac67c3d2e4@epam.com> <875xe6ytyk.fsf@epam.com>
 <65727710-0a88-4fff-bb5b-9cf34106833c@epam.com>
 <5df30dbf-17a2-446f-83f9-0e4468622917@epam.com>
 <485a8166-5079-4c0e-a6bf-f6aee8af991d@xen.org>
 <c776c308-cda6-412f-b03c-a4b691b69d33@epam.com>
 <2d07bef7-a7a1-4458-9da6-43bf2956d7d8@xen.org>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <2d07bef7-a7a1-4458-9da6-43bf2956d7d8@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0092.eurprd04.prod.outlook.com
 (2603:10a6:803:64::27) To AS8PR03MB8322.eurprd03.prod.outlook.com
 (2603:10a6:20b:509::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB8322:EE_|DU4PR03MB10790:EE_
X-MS-Office365-Filtering-Correlation-Id: 74fb3025-8cac-42cd-fbbc-08de3283365f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3hOcGcwRGxQRXpxVTFpT2lvSFRKQ3VOeEtaZXdmMDFFR0I4MDhKK3FKcFFS?=
 =?utf-8?B?eEpxMXlhcmdpeTlDTHlsRE9EdFNIZ0svbTJLcnJWUW9XQkdiZlZXT3ZVYXVW?=
 =?utf-8?B?RW9SWjJrVW5McXNmOTFJZndPR2hjakUxVjJNaGl5VWJQOVRLb05ITVFaa3Vn?=
 =?utf-8?B?ZWJzTTZQTldSTkVVVWEyOVhFL1h0QWJYYVNsWW1NM3pZeGVkTXREMFZNZk1t?=
 =?utf-8?B?YTcxMDVvMzM0V0FrRmRBU1Z3Ky9qT2VQd0dFUjhaYURoSjZsblIvZTZFcTN4?=
 =?utf-8?B?aE9GT2hvN0NUT05MU3JHRUlGaG5kSUp4SGg1OVZDVjVHZ0ZaKzRFZlZ0QnlP?=
 =?utf-8?B?MEdLNjgweWhWNm1VSjQrV0h1NWxiemtYNUpYV3ArK203MUtPWnlqSmptSFdi?=
 =?utf-8?B?TFppWEJQeXNXbThMbUt3Mml6T25QU1ZUNDBtQVVyK3EyNkVyRlNycmxrNGFi?=
 =?utf-8?B?MjAvbzN6a1JuTTFzZWZPajlkazhUbWtkclFvNGEwL2gyY1RtK3JsZEVhSkVG?=
 =?utf-8?B?eEpIQVIxZ21uK3ErZVR5WHM3WFArNkdpU1czalhtZWZqZEk4T0hYampPeWNL?=
 =?utf-8?B?Q284UE1HUFI4SjFKendZOGxlS2RrYTRVVWZIejlhRkdrQk1ua2M2bENwazFU?=
 =?utf-8?B?UUl5THlaemNaczFQYXBhdFZMK1Z5R3NLOXdxRHV5RlhVWFA2SGhyWXJYMnlE?=
 =?utf-8?B?VjJ0U1pqNk9aaVVleHZ2TXNlL2FDZVVRbTZmVWJiQ1FZdS9sTWlIN0FMakhF?=
 =?utf-8?B?UXNkdURoQ1JZZ2pPajJCbTlaZzNabUY0VUFrbjUwbUw0MmV0TWh4K2NrNkpq?=
 =?utf-8?B?RHRUMjlQZ1lpN29VQnZ4NFUzMmd5RHBoKy9PeWhnME1ndFlKSjZBZWZVRWpt?=
 =?utf-8?B?QUFmQjZMSy9IMkFxaDArRitaYTkvL3p1WEdId2FjR09xeU1ZNENnNUYzcURU?=
 =?utf-8?B?NnVndXhNQm50SE1vWUhoMXZXZHo2aVdCdUQzbXYzaTEyM1A4LzRtOS9ERU5v?=
 =?utf-8?B?cEFpMjNya0owdDcyd0dwc1hCVEwyK0Mrc0U1aldnREN2WW5OMnliUjB4eldj?=
 =?utf-8?B?UVhDT04xRkdkUXdHdlVzajU5OUg5bi82Rk1uaFBTaFllUTVEd2cvM29PcDlV?=
 =?utf-8?B?bEU2Yk9BZE1KTFZkYk9lUVp2aCszdzhvVElPTXRyMGZtank4TG4vdVJVRFI5?=
 =?utf-8?B?VVp1VTJISStqdlNubVBlZm9tb2FCNjExU1hCNVhVMStmdjVZYURieW54R05Q?=
 =?utf-8?B?UXdvbVl0aWozYXVIdDBlRE5vaUczZVIrbC9vN1h5R0E4SG9nUVBNTHNCZkdB?=
 =?utf-8?B?VGo2MHd3eHZUQmZVbmNHNHR2L3pOVk5aUm85ak92UEJvV245c1gwRWtrSVlj?=
 =?utf-8?B?eWlhcFU5dTBiL2R1WFNMYVJaLzV1YTRRWGpTbG5zejRNYjJUSHRtdVVDNWxm?=
 =?utf-8?B?VnY1OFpLQ0lnNnBZaHRVWjNBNEUyYnF2QjZrYk1iUXNjQXpjbzIxUHU1M3p4?=
 =?utf-8?B?dFJJYldpUHVDOVRzVmhVeEU2RVVOaE5UTS9WYjdJN253UlVhUW9FY1JiZW53?=
 =?utf-8?B?YkhoWk8wdnEwcUx1YSs1MTZkRGhLNFBsSjR6bTI1KzBCdVF3Wi90NERKeUI4?=
 =?utf-8?B?NDJ4NHBYeXhaaXZ1QTRJb1g1eFZxek9ROFhpd3ZmY2dTZy9HZHd0ZXlJRUFN?=
 =?utf-8?B?cVl6MVlNZEt4Qm02T3JHdzRuN3RVM0xqWTVtMTdZVStVeitCKyswTFR5SEdi?=
 =?utf-8?B?dGJCNWJUZWpNNk9MZnNsKytZaDlHUWF2VGhuc3Z5c2ROdEhpWEs5UnNneWR6?=
 =?utf-8?B?ck1GbkFUdnBHOHo0UE4yQmlmWDc1TkM5dC9udGw0Z29Va05McGpwa1RFY1dJ?=
 =?utf-8?B?aVg3NnhNTUMrWVU4U2pac0doRFA1NVU1ZkcyeDNXODRERjBGWWtIa2RLN3N5?=
 =?utf-8?Q?9YULASw25z0D8+F70c6oKShXsd/hUQwb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDVNMFhnclUxcUpQRzV4cXRKcGc3MUlTY3llQm5oOXl3elk4VWlYMVRzRFRK?=
 =?utf-8?B?UDFFZXhodDM5TE1WNEd4T3F2bEJIdWtGSVZqdkxaR3Ezb3A3dHlTbDl0cTBo?=
 =?utf-8?B?VThzNThBdVJFeVl3YmdWNlZIdWtsV0Q4OG1sb3R6ZDdLYjN3K1krZDl5NUNU?=
 =?utf-8?B?YlEwYzhTV0d6eFBYV3VFcEtUNmFLRlhHZElRN1kzeGNmZjhzdFlRVy9sc1Ez?=
 =?utf-8?B?MmVPR1pVa0FhOWJVZ3pLY2NwREk0NUZFVUdUR2xCS2NPZzB4QVYxVlV2amp2?=
 =?utf-8?B?VWpPYURQVVpydVJseXlSc0M0YnZGL3hlNHc2bmtmSDRjdVJSNmlrS3Q2ZTlz?=
 =?utf-8?B?d3VoVGZlaWx0TjZwNk1tNmlDTEtqQTJwN3R3Yk0xZXFkMUlIbkhwK3hqT0NN?=
 =?utf-8?B?UnlBTSs3cGZYQ1psWlU5ak1FKzlMQ2VQekhDd0JBYVNBL09xemtBU3l0ZitB?=
 =?utf-8?B?V1RZSmx3VlYvdG5kdmUwd2lnczJiOC9ZUE1LS0k0SE1XSzlYWlE1K2o4WlN3?=
 =?utf-8?B?eUlCOGYrTmNUV3lqNjRwMWVnZnM0V2NqeGY1eFJtZXgwS2tEYlNJKzcxemdi?=
 =?utf-8?B?dHdyS1VpV2ZqSHlvakJNV1A0NFgxdmwvNjBncksvQlNXNjhYK1gyNHdvOGNt?=
 =?utf-8?B?cmovSTByVC9uL0d3RzlYeEVZU29SbU1ZSHd4dEZlN2loeHVOME1XNHEyWmgz?=
 =?utf-8?B?Zmk2Q0JzWUdEMDBLdEQ0TktXekhUVTBaSUkrdTZQUFNSWGhVSmF2d2hlTWdX?=
 =?utf-8?B?VzNtQ0w4UHB4M2pGdXhURlFsZ2lQNDh4TGl5MlFTZjhKdE81M00rZjdMc2Ix?=
 =?utf-8?B?dGNxSngzSVpFWlZ4T3FsQ2VGNktzM1FvbkxXbms3WkZWYWJQQ2pHdzZKOWxs?=
 =?utf-8?B?ZTdGbnZxMkdpbGVsNEtLWmh5S0VJOWJCWllpNGNUVmRra1lLVEJBdUI4UFhq?=
 =?utf-8?B?TndCanJOZ3VjUldwdnpLY1loYkROM2pXaEZUNmhUK0cvV1dlMk9xWXFRYjkr?=
 =?utf-8?B?dExnbWMrcTJJQk1CbDE1TUQ2ZS9idE5iSjFzaUR0UlpKQ1B2blB4bFNvVDM4?=
 =?utf-8?B?VnpNNWNoTWVlMEtkUG1wd2N3TWJFTzhYTXhTdGpMQ0VzdFpuMklha3kzMVJn?=
 =?utf-8?B?cUZYMHVLSTAzVEdTejFudWNtVUhwTExybWlVV1JFdkJVQVF0dE8vV0Q3L2Vm?=
 =?utf-8?B?alBadjBZaHZPcVVpai9wQUNOdzk1UkRFOE5ZVVNQdHdFOFYwemNUSzRabEQ0?=
 =?utf-8?B?VGZSby93NEpTZjBMSzBpclZkRzlkSlh3ak5laS84K2NtQjYwbm9Xc0VXTENP?=
 =?utf-8?B?TyttdHBVdjU5UmV5T04yM3RiOWlRVDAvQXRrdFJxWkR6cjEzOWJjK0JwOThk?=
 =?utf-8?B?S0hBQmo0TTh2OXppbVFUSWdBdWMreTQ4MlZvU29uaDBtYXEvL1Jvd1FoZ1ZE?=
 =?utf-8?B?cFF3WjdrMWM5YkdRYitXbnNubFJ6TGFCMFRpbTl3RjU0dkhVb0ZsbTMrTzlx?=
 =?utf-8?B?Um9UNExUOG1LVGpGSFd4TGZKRG1kOGlDd1JoeU5xcGlQVUNhamkzc01ZOVZn?=
 =?utf-8?B?d1lnc0pxUExXRGNaUGJhWk1GVWJxSnRVcDRLU3RERmQ0Y3JKVXkvWXlRRVRt?=
 =?utf-8?B?aG9SdHRyMzZRUUN5SlM1U0QvdVg3b1dMTENIRkZPZ1pXZ2tJU1ViVVpmYldW?=
 =?utf-8?B?NVp2MUwvNkpkTWJGQXdrOUFBTmdLYTREWjZUOGRYcWpWQ0ViTDkvN1ZpRjlH?=
 =?utf-8?B?UlBOYTUvNHBHL21FN1BuUVh6eDlMYzd3Z2MzaEhRbi94WjE3MHdjZ0U0YzZ0?=
 =?utf-8?B?NmYxZlhnckFOVnFmL0Z5c3JqRzV4ZlBYNXpsWU5CTG45SWkxTXJRaStqMllO?=
 =?utf-8?B?VFFrWU56WEtLMnZ2djBvcnpiOXMxVWNrRkl3VTRBZmFWTVhBVmsrWlhrRXZw?=
 =?utf-8?B?QlJPVDZ4SU01czkyT0t3ZVJhN1Mxcmxsd20zZlRYK2psUjZieCtkYVZjM2cy?=
 =?utf-8?B?dTcrV1lMaFl6NDB3WlZORVVUcWNhdCtGMkVlZTZTeTdETzVVYmR2RHJXc0Ux?=
 =?utf-8?B?cm0xd1dYeGt1bzc4Qkd1bnQrMkpGOGRjT2xnemYzTjFOZFFYdlIwb1FvT0xt?=
 =?utf-8?Q?bnmKUv0DAyZkCTkyEudOOWc5n?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fb3025-8cac-42cd-fbbc-08de3283365f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 15:47:06.9219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iruQEfiyes1XwVMjuJ3DvrVmJxYS4QA9Ang23n0gwn0YuPyq+yKFWANp4/rjDGeGef7AdDPPVXPFnes5vdEjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10790

Hi Julien,
On 12/3/25 11:32, Julien Grall wrote:
> Hi,
> 
> On 02/12/2025 22:08, Milan Djokic wrote:
>> Hi Julien,
>>
>> On 11/27/25 11:22, Julien Grall wrote:
>>>> We have changed vIOMMU design from 1-N to N-N mapping between vIOMMU and
>>>> pIOMMU. Considering single vIOMMU model limitation pointed out by
>>>> Volodymyr (SID overlaps), vIOMMU-per-pIOMMU model turned out to be the
>>>> only proper solution.
>>
>>   > Does this means in your solution you will end up with multiple
>>   > vPCI as well and then map pBDF == vBDF? (this because the SID have to be
>>   > fixed at boot)
>>   >
>>
>> To answer your question, yes we will have multiple vPCI nodes with this
>> model, establishing 1-1 vSID-pSID mapping (same iommu-map range between
>> pPCI-vPCI).
>> For pBDF to vBDF 1-1 mapping, I'm not sure if this is necessary. My
>> understanding is that vBDF->pBDF mapping does not affect vSID->pSID
>> mapping. Am I wrong here?
> 
>   From my understanding, the mapping between a vBDF and vSID is setup at
> domain creation (as this is described in ACPI/Device-Tree). As PCI
> devices can be hotplug, if you want to enforce vSID == pSID, then you
> indirectly need to enforce vBDF == pBDF.
> 

I was not aware of that. I will have to do a detailed analysis on this 
and come back with a solution. Right now I'm not sure how and if 
enumeration will work with multi vIOMMU/vPCI model. If that's not 
possible, we will have to introduce a mapping layer for vSID->pSID and 
go back to single vPCI/vIOMMU model.

> [...]
> 
>>>> - **Runtime Configuration**: Introduces a `viommu` boot parameter for
>>>> dynamic enablement.
>>>>
>>>> Separate vIOMMU device is exposed to guest for every physical IOMMU in
>>>> the system.
>>>> vIOMMU feature is designed in a way to provide a generic vIOMMU
>>>> framework and a backend implementation
>>>> for target IOMMU as separate components.
>>>> Backend implementation contains specific IOMMU structure and commands
>>>> handling (only SMMUv3 currently supported).
>>>> This structure allows potential reuse of stage-1 feature for other IOMMU
>>>> types.
>>>>
>>>> Security Considerations
>>>> =======================
>>>>
>>>> **viommu security benefits:**
>>>>
>>>> - Stage-1 translation ensures guest devices cannot perform unauthorized
>>>> DMA (device I/O address mapping managed by guest).
>>>> - Emulated IOMMU removes guest direct dependency on IOMMU hardware,
>>>> while maintaining domains isolation.
>>>
>>> Sorry, I don't follow this argument. Are you saying that it would be
>>> possible to emulate a SMMUv3 vIOMMU on top of the IPMMU?
>>>
>>
>> No, this would not work. Emulated IOMMU has to match with the pIOMMU type.
>> The argument only points out that we are emulating IOMMU, so the guest
>> does not need direct HW interface for IOMMU functions.
> 
> Sorry, but I am still missing how this is a security benefits.
> 

Yes, this is a mistake. This should be in the design section.

> [...]
> 
> 
>>>>
>>>> 2. Observation:
>>>> ---------------
>>>> Guests can now invalidate Stage-1 caches; invalidation needs forwarding
>>>> to SMMUv3 hardware to maintain coherence.
>>>>
>>>> **Risk:**
>>>> Failing to propagate cache invalidation could allow stale mappings,
>>>> enabling access to old mappings and possibly
>>>> data leakage or misrouting.
>>>
>>> You are referring to data leakage/misrouting between two devices own by
>>> the same guest, right? Xen would still be in charge of flush when the
>>> stage-2 is updated.
>>>
>>
>> Yes, this risk could affect only guests, not xen.
> 
> But it would affect a single guest right? IOW, it is not possible for
> guest A to leak data to guest B even if we don't properly invalidate
> stage-1. Correct?
> 

Correct. I don't see any possible scenario for data leakage between 
different guests, just between 2 devices assigned to the same guest.
I will elaborate on this risk to make it clearer.

>>>>
>>>> 4. Observation:
>>>> ---------------
>>>> The code includes transformations to handle nested translation versus
>>>> standard modes and uses guest-configured
>>>> command queues (e.g., `CMD_CFGI_STE`) and event notifications.
>>>>
>>>> **Risk:**
>>>> Malicious or malformed queue commands from guests could bypass
>>>> validation, manipulate SMMUv3 state,
>>>> or cause system instability.
>>>>
>>>> **Mitigation:** *(Handled by design)*
>>>> Built-in validation of command queue entries and sanitization mechanisms
>>>> ensure only permitted configurations
>>>> are applied.
>>>
>>> This is true as long as we didn't make an mistake in the
>>> configurations ;).
>>>
>>
>> Yes, but I don’t see anything we can do to prevent configuration mistakes.
> 
> There is nothing really preventing it. Same for ...
>>
>>>
>>>> This is supported via additions in `vsmmuv3` and `cmdqueue`
>>>> handling code.
>>>>
>>>> 5. Observation:
>>>> ---------------
>>>> Device Tree modifications enable device assignment and configuration
>>>> through guest DT fragments (e.g., `iommus`)
>>>> are added via `libxl`.
>>>>
>>>> **Risk:**
>>>> Erroneous or malicious Device Tree injection could result in device
>>>> misbinding or guest access to unauthorized
>>>> hardware.
>>>
>>> The DT fragment are not security support and will never be at least
>>> until you have can a libfdt that is able to detect malformed Device-Tree
>>> (I haven't checked if this has changed recently).
>>>
>>
>> But this should still be considered a risk? Similar to the previous
>> observation, system integrator should ensure that DT fragments are correct.
> 
> ... this one. I agree they are risks, but they don't provide much input
> in the design of the vIOMMU.
> 

I get your point. I can remove them if considered to be overhead in this 
context.

> I am a lot more concerned for the scheduling part because the resources
> are shared.
> 
>>> My understanding is there is only a single physical event queue. Xen
>>> would be responsible to handle the events in the queue and forward to
>>> the respective guests. If so, it is not clear what you mean by "disable
>>> event queue".
>>>
>>
>> I was referring to emulated IOMMU event queue. The idea is to make it
>> optional for guests. When disabled, events won't be propagated to the
>> guest.
> 
> But Xen will still receive the events, correct? If so, how does it make
> it better?
> 

You are correct, Xen will still receive events and handle them in pIOMMU 
driver. This is only a mitigation for the part introduced by vIOMMU 
design (events emulation), not the complete solution. This risk has more 
general context and could be related to stage-2 only guests also (e.g. 
guests that perform DMA to an address they are not allowed to access, 
causing translation faults).
But imo mitigation for the physical event queue flooding should be part 
of the pIOMMU driver design

Best regards,
Milan


