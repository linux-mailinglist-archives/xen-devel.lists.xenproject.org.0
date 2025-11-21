Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273E3C789DE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168700.1494756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtd-0000bb-Cn; Fri, 21 Nov 2025 11:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168700.1494756; Fri, 21 Nov 2025 11:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtc-0000O1-LM; Fri, 21 Nov 2025 11:01:44 +0000
Received: by outflank-mailman (input) for mailman id 1168700;
 Fri, 21 Nov 2025 11:01:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3Zd=55=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vMOtZ-0007WW-97
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 11:01:41 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7494813d-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 12:01:39 +0100 (CET)
Received: from DB7PR03MB4603.eurprd03.prod.outlook.com (2603:10a6:10:18::24)
 by AM9PR03MB7202.eurprd03.prod.outlook.com (2603:10a6:20b:268::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 11:01:32 +0000
Received: from DB7PR03MB4603.eurprd03.prod.outlook.com
 ([fe80::7eb2:6a9b:fddb:6365]) by DB7PR03MB4603.eurprd03.prod.outlook.com
 ([fe80::7eb2:6a9b:fddb:6365%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 11:01:32 +0000
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
X-Inumbo-ID: 7494813d-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTSuSg2P8CAwpBb/OR8+SY8qDLm3t+IGVtHnMrSoAv5097TeLUbt9tXQfYy3qrhM49D3zK1Ad/GKwZE8i02J9H9+Bh5iQSUd6X1C+Xb0/CxzVTdwN3zKiGNRwPGEj+56y84bECJzDAWyoqojDjljkivBUvAabh9zjA1WnFmZM7CSZ6b8b/+Mx/bI6D06/IYtc3jqYwtwWlQpxODSzJDsHM0h68KF9+wwuiuMgZKjARqp3P2+DtkgxvlrVzxdxcYgsqCUXX7sthyW7eORyYig+uL3WbA524yxXkDqeWXdB791otHpGgQ0K7foZ70z2t2Cx25yW80g8W5ZlKnc0CdJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmRlqcGH22KKQvpxue7mNt1tP0dZp3+DarMN7yF1FgI=;
 b=LHylaJICnWvMDEkPyVtJCXc7QgYv1lNBaljBjMuaZAKO3+w/TR7gwZZ1RS+u6A9zus2VWSpC74c/9oE30fRWiTbAwm4BEXmlsudiDBQ0rwfKRXbMAFKaKJaJW56F3CfUi0VcF9tUIh5CS1ByRhEryPxTjGrZwUOl14+MbNyv2kSB1YQCnG5haZB9+U/rJjV4hYhhazEFeziN8DK+SsbFbUnzie9wXDtKAcZ408Ax8RcNQ6veZ+9wyhnfMaRgGr5kz/1bJ6YdDUzDKM3zFdCTJAsOlfHq0IXMI8KYStcBLzRDi22f7WzTfAQHuaaATxbr+X/g1okWDQmYBpuYebfbgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmRlqcGH22KKQvpxue7mNt1tP0dZp3+DarMN7yF1FgI=;
 b=kRQSU+iNs1Z88jNenoUpnRQJdb8vgUueYtNSBLlPoTQDKtOig4jPm1nIClUDsHLwKycdxpkT33pNMv6Yo8jPA6c/xr1+uHnCJMh3zVRTNCEdsc4dfMykZWx7HY2HnNJIJ73iVYwLNCXZA3dIfAB2WG1sMy8L8RBSk8Ywy4Ujf8OZ7gPkLOOlQBHmurRfzwuhqa8LZYYhEcKu7rr7llxFtdb2tj88khF7c6ESRQ/cbbH90JfPzuPsBbShoMH5nyNk/2h2iZ3xwICw5AsAqx+ka9xvcR0unBWquFPNcfy9G+5N53Ih2KR+q/ji6yRSOlHjwxY8r+8m1HCh7su4w5/aGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <c2ffb95c-209e-437c-9a6a-a0f5563e24be@epam.com>
Date: Fri, 21 Nov 2025 13:01:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] common/libfdt: optimize usage
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20251114180130.346755-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251114180130.346755-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0366.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::13) To DB7PR03MB4603.eurprd03.prod.outlook.com
 (2603:10a6:10:18::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4603:EE_|AM9PR03MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4129d5-48e5-4d98-787a-08de28ed54c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXR4amVqZVlpc1U2UFhxcFJpcHluVDFOaUErc2lDRVZnT2dNNDdTenhGb2dp?=
 =?utf-8?B?T0NVcDNwYnU3eHo0RXBFeDF0L2Nka1p6UnNwM0JUaEZMYkxqbEw2UjByTEdX?=
 =?utf-8?B?V3Z6cTBGTllUU0NUanVYNklGdEhuWGtUeHZzVVB1N2Q4MFR6dUo4eFhTT2hU?=
 =?utf-8?B?bk9XUk5Bb3RxcDMrcFNoQkpFcmI2bDVrMmsxc2NvbGpJUEZ1OTdnajlzZVVV?=
 =?utf-8?B?MDkwbVhrZWNoU0dFWExQaG03Y24rRGVtajFCSTNUU2hCRXY2R1BXTzIxYTFJ?=
 =?utf-8?B?R1crRVV2SitFMUxzaUFodlZvQi84ZnRQWDBNZ084RmtmakNOT1JWVkVXQktl?=
 =?utf-8?B?eHRUWHQremR0VFdKdnFIT3lORCtSUnBBZmFVa0EwMVRTdVFDY3RuT3lBQW5D?=
 =?utf-8?B?UEdTcEZFSlg5N0RDMnBIUHUwZit0WUxIS1U5Z2lzYWp2czZRK1FBdjhvSGUy?=
 =?utf-8?B?SkdZMGpuNWxZVytZK3NhMzFkVXM2ZTJtMnVuc3VRUEx4SFhuRHhseVdoSzRa?=
 =?utf-8?B?NEhzN3l5dXhIbzdIcEVHQjU3OVJuNmJvUks4V3NycWdPMi9MOTV6cEtBS09G?=
 =?utf-8?B?TzBWRVlPbHU4YzhiZE5NSzdRZGZCN3pJTXBNMUI0TGNIQVRRKzJ4NGczc0hO?=
 =?utf-8?B?K1lYY0dlZU80WkhqOUNTTjVUM21QL2xyS2pGa3JvTk1vQ2I4QkJYVk9GZ2t6?=
 =?utf-8?B?dlFCT2FWTG5CT0QvNXRqOVRZUU9LTWh3Uis4bmU5bWh4MnRIT3dlWFI2Zy9s?=
 =?utf-8?B?NFlUL01jOGo4TkF6NXFKUm9ZMlY2TlNDd1FlWWFCWXNtTXBHT3MwaERNbk16?=
 =?utf-8?B?U2tPUk9hY0JOUVJJcFVGQUVxaWxZNy9zZFNlNnRVN3dMMDdHREJiSlo0Q3FG?=
 =?utf-8?B?UTQ3L3huNHp6VkRzcDd6aVV5YzhpcjF0ZnRJWFRwT1hOL0d4UGd6UXlYUDZt?=
 =?utf-8?B?Y0NFNTBQS2w1VlBVRUE2djFQdEhFbkY2UGJ3RTJEY1ZVUDlFSGF2Q2tlZkQ5?=
 =?utf-8?B?RGl3UGZydzRnY3ZhNEI3Vy9qc0FmQTcxMlFsNUV3emltc0o0eE1nUmQrSFBQ?=
 =?utf-8?B?WEFScGZiY2VqUVI0TCtWQStrL0xsYUxUZEprbTJaUkRXM3k3UGRNTVk1L1NC?=
 =?utf-8?B?UEV1MkpXSXZmVDdXR3NCVDFrZVRqL1QwdE03aVRjWmYxMHFRSU9PRzRvUVY3?=
 =?utf-8?B?S1NPQnNzUXFiTTFTSldVcWlBL1UxZXZ5TzR1VHJOVjZwbkNVYXRueXlvMy90?=
 =?utf-8?B?bDVpYWxLNWE0Z3lpTktDTURkWEVSbTc3ZFRjZk1XV2dXOGlTalpvcHNBZERX?=
 =?utf-8?B?Q21zWFVhUWo0ZW81WTNtOXF1OWVvWkJ0N0JWZ3NmdVM1SU55dUtiR3R5S2pE?=
 =?utf-8?B?RGNTWGxtekZEYzNqcWJsRDdMVXR5S3NSUldlS1hkQ1dheVErUGlTMG5zemVP?=
 =?utf-8?B?OUFaYXN2VFZ4MHI5M0hXSlY5TkFmbnRLUWh5eVBpU1pObCtJTXZsRENMYU1w?=
 =?utf-8?B?MGN0SlpDZEoxT3Jtbzkzd3JERlBZeU9BZEJKM0V3TEFFeXVVcEdjMDQrUVhX?=
 =?utf-8?B?R0hLMkltNk1OdGRCVGRvN2doM0ZpQUdvc3ZsV3dWeTFhdmJyeXZQK1kyMmpn?=
 =?utf-8?B?ZlZNUU9mb2Y0TmpzTHMzWi9sdU1SY3JFK2F3djFjc0VTdDVKMXRFbnR3VkFZ?=
 =?utf-8?B?S1VIQnE2WXlsK3lmd0N3TkJiQjgrRzBlNStNRHZSMUp3dU1KRHBwN1diZWNj?=
 =?utf-8?B?VXg1UXE3eHZ0RzFOY1BrMmIxREZjZi90UkhKc3AwS0pmZ1pPWC9Ca2dRUXo2?=
 =?utf-8?B?WjFXNi8wTmx0eTFjWUJZRmE1QU51YThFakM5Y1VieFNTdkphWU9KTGd1eHZB?=
 =?utf-8?B?OG5yYzdzNERpbmhpK1BybUNwd3drMlhNSnZDdm1mcytpeXd4Ry9QaGQ3VmVa?=
 =?utf-8?Q?4GP4DKXF3lK9JXAfCWM6vTsNfwS6XkgT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTFLMDNOVHVTSnlxbGYyOTk4KzF3T1g3Wm5OaXpJTXZLdThDUlB4RDMxTWNN?=
 =?utf-8?B?MEJGN1FlQ0hHckNIMDJjQ0Q4TzVzM1g0VkdweGZUNXF3SHBmaklsTlVJa3I0?=
 =?utf-8?B?MkI0UDlCZnJLYlU2eUh5YjZ1MkNya3c1cTZEa1hNNVR0ZmdjUTZ4ZlNRVm1j?=
 =?utf-8?B?T2dPQXQ3dXEyZnUyOTcxOE9lWU56OFJ4R01hOTR0eEpMRFJib3N3MmNtNGw5?=
 =?utf-8?B?cjk4dmh4MWMvaEwxTG1LWE9UTEZmMFc2WkhSc296ZGlGWFVRYk9zRE5IbE9x?=
 =?utf-8?B?dEw2V3NqeUdZU1pnaDdxYjJtMktVSEhHOXRyNUtYZnlWQS9HR0huY0JFYTJL?=
 =?utf-8?B?eEVFdUQ5U0tvdzg5ZTF5NDV2bkxqZ3lYZTM5eTV3TnFHREZqbWFMMjJnb3Bx?=
 =?utf-8?B?ckFpbXFoYWx1djNvaWxRNm5vSnRMbW4ydi9xTzU1UGdUV2JZWjR5S0JPaVEz?=
 =?utf-8?B?R09pMVdQdk5iMlhQMDViNWZWck40aG1VQitrTUlKaFJvT1F2aWMwbitja0Fk?=
 =?utf-8?B?M281SjIwR1NIdXEwUExLekNwRWt3a0p3RlVNbW4zbVdMUE9YNVBnOTcwNG5z?=
 =?utf-8?B?dXlRVnNrUEtpeDlhaUlKd3RlTE9kK2ZYeU5tazRwNHBlUXVGYkhHQVYxL1hz?=
 =?utf-8?B?NDhHM1N4QjdMdDRMdnlRNE5FazVOTnVhU1gyajFMWEl2WWRhdEtyTTNTc29B?=
 =?utf-8?B?dVZNZnQvTHlpZ1hieUo2bHE2SmJadlZyTFFSTG5YRDBRNTJraXNCSkxIY1k4?=
 =?utf-8?B?NFZ4ZUlQRGVVbE1vbUtlYStxeVhUcFNGekE2M1VwaUM3c2hlZVd3TjJPT1hK?=
 =?utf-8?B?RVpMT0RQOVI2bUtwSHMxMFIzQzNKYURiem5EbVRKZFJ3RWpzZmZQR1J3VE5H?=
 =?utf-8?B?OGljcy9XTHB4RG1RSklmU083ZUdBRXVNRDZBaGJtQmhIa3BwSE1vZllXcUQ5?=
 =?utf-8?B?a0lvL1FEbUR0VVhGT2h3dk1tbDI2QVNwdzY5a2hpa21UNG9QbjRPMHJsV1Vy?=
 =?utf-8?B?VXFPNWdZUDRjMVlBK0tMNUJuaGZ2dGJIVWN4S3VCYkpqaDZnajRsT3hTYnNC?=
 =?utf-8?B?R1kxT3lZbXl2MGh6RDdZTm9uTHh4UVRoMU9iTE5nSDZPa1NJWjZiNVBVc0k0?=
 =?utf-8?B?V2N0VGNKRWkwc3ZvaStIc3VnNVB1NEZ1ZDVQejUyOUxLVWJHakNicnNQeDBZ?=
 =?utf-8?B?SmlEckswUEE1OVAzUDFKb293N3hlYW5ySDB5THNTSnpjRGtOWVZIZ1lJKzQw?=
 =?utf-8?B?cStIeFM0OGdrdXptVGF1RU9NUE9YdGg0eTJ6SjZhVFhYbUlTWEFLLzFUbmRi?=
 =?utf-8?B?empmbVhpcVBaSlpkVWJxS3NpYVFSOXVocHNhM2RlZnBmeGQwQTZpNFJpVlpt?=
 =?utf-8?B?SnRHbkdlejgwMHlSWEtVbHlxVFZDck9LQTVSZVdHeENmbUZkd2xlZ2s5ajlF?=
 =?utf-8?B?YVU0cytPeDRvc3g5K0x2cEI4YnBGWXU4eXBFL2t4c3ZLOWI1ZE10QklZemlD?=
 =?utf-8?B?MDhYcE10c2xzOU44a3lrL3p2QlcyTmxCc0hIL2lIRlhzOU5yMUl5SzdiSlA3?=
 =?utf-8?B?MVllK2Nkdk5JaE4yc21HYTVZLzRqK3BsNi83Z3Q4ckhLWSt5cTFnc1AwQzgy?=
 =?utf-8?B?aHJLNWZQOTZhVUhTanRVMWZTR3JYdnF1NjJoR3p3dlVqV1RGWUVUTndRTnhW?=
 =?utf-8?B?d3hKUHlsQk9iSFdHRUFqQWVsWFdqRWVGRm1QeWFzWDFsUDFwQW9oZWxGVncy?=
 =?utf-8?B?R2MvWXdYWWV5U09LZ1F2VmxUdFk2QjlZeXkxeC8wb05WN0EzYnZickxtWkpK?=
 =?utf-8?B?R2FMMTBHcklQMlZHdGhRS2ZqUFFNL3IwaHFYNnNVT1BNYTBRR2ZGcnRCU0lK?=
 =?utf-8?B?MEkvOURubjhBdkRLR01hVS96azFYT3pNcjNwT1hXVExuM3JnRllCNHFUa0JI?=
 =?utf-8?B?NjY1bk5KbXVoUjlCQXFBRzl6WGVQbk1NS1piY1dMY0xWY2JUNkZicWFGWmJZ?=
 =?utf-8?B?RnpBRm44bmNxOUJaenhwZVJSNU9ScHp6L2hVZW9IOTVqbVc2eENmeGN6YnVD?=
 =?utf-8?B?aGNsSThiK2ErZnlYb1Q2VUpSZUR6Ulg0Ynl1bU1WazAzcS9HQmtCUnZrbHBi?=
 =?utf-8?B?bmNEWDgxd2UveGNHZVRBdklHeVIvUjlhTVNjT1hmV3kxMGt2SDNieFB4bEJ5?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4129d5-48e5-4d98-787a-08de28ed54c5
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 11:01:32.8803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfHu7/tThmCnS2/wRVKMTl9TjGEVLSwJyZNaIuodX/Za8XPp3/dUNM02XdJY6zzhnsFRsolePnNtda2z2TM4xymt8lKFg66S9IEdtpegk+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7202

Hi

On 14.11.25 20:01, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Now all libfdt features are built-it unconditionally, but...
> 
> X86: The libfdt is used on x86 only to parse Hyperlaunch/dom0less Xen
> nodes, so full libfdt is not needed in this case and minimal, RO
> configuration can be used.
> 
> ARM - situation is more complicated:
> 1) ARM reads Host DT (fdt.c RO)
> 2) ARM reads passthrough DT (RO)
> 3) ARM generates dom0/hwdom DT from Host DT (there is a mix of WIP and SW APIs)
> 4) ARM generates domU DT (there is a mix of WIP and SW APIs)
> 4) With EFI enabled - ARM needs RW API and fdt_empty_tree
> 5) With CONFIG_OVERLAY_DTB - ARM needs RW and fdt_overlay API
> 
> Hence, add possibility for optimizing libfdt usage by introducing separate
> Kconfig options for each libfdt feature and select them where needed.
> 
> Following libfdt modules are not used after this change:
>   Makefile.libfdt
>   fdt_addresses.c
>   fdt_strerror.c
>   fdt_check.c
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> Not sure about using DOMAIN_BUILD_HELPERS for selecting
> LIBFDT features, as DOMAIN_BUILD_HELPERS doesn't exactly
> says that domain's DT will be generated when selected.
> 
>   xen/arch/arm/Kconfig       |  4 ++++
>   xen/common/Kconfig         |  4 ++++
>   xen/common/libfdt/Kconfig  | 14 ++++++++++++++
>   xen/common/libfdt/Makefile | 12 +++++++++---
>   4 files changed, 31 insertions(+), 3 deletions(-)
>   create mode 100644 xen/common/libfdt/Kconfig
> 

Before continue Kconfig related discussion...

I've been thinking what if we use libfdt as a library (.a)?
We'd get the same result as linker can do optimization basing
on obj granularity while linking with library (.a).

OK. I've started experimenting - obvious choice is to use "lib-y" and
build system will do the rest. But in this case we'll lose ".init" and
libfdt will be built-in.

I've tried to preserve exiting behavior when libfdt is moved in ".init", but,
honestly got lost a bit in Xen build system.

Below diff is what I've came up with - probably no exactly right.

Does it make sense?

diff --git a/xen/Makefile b/xen/Makefile
index a4d53526bd0b..3fb77ab19853 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -464,6 +464,7 @@ ALL_OBJS-y                += arch/$(SRCARCH)/built_in.o
  ALL_OBJS-$(CONFIG_CRYPTO) += crypto/built_in.o
  
  ALL_LIBS-y                := lib/lib.a
+ALL_LIBS-$(CONFIG_LIBFDT) += common/libfdt/libfdt.a
  
  include $(srctree)/arch/$(SRCARCH)/arch.mk
  
  $(obj-y) $(obj-bin-y) $(extra-y) $(lib-y): _c_flags += $(cov-cflags-y)

diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 6ce679f98f47..e315252c88eb 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -1,21 +1,28 @@
-include $(src)/Makefile.libfdt
  
  SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
  
+obj-libfdt-y := fdt.o fdt_ro.o
+obj-libfdt-y += fdt_wip.o
+obj-libfdt-y += fdt_sw.o
+obj-libfdt-y += fdt_rw.o
+obj-libfdt-y += fdt_empty_tree.o
+obj-libfdt-y += fdt_overlay.o
+
  # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during runtime.
  ifneq ($(CONFIG_OVERLAY_DTB),y)
  OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
-nocov-y += libfdt.o
+nocov-y += $(obj-libfdt-y)
  endif
  
-obj-y += libfdt.o
-
  CFLAGS-y += -I$(srctree)/include/xen/libfdt/
  
-$(obj)/libfdt.o: $(obj)/libfdt-temp.o FORCE
-       $(call if_changed,objcopy)
+#lib-y += $(obj-libfdt-y)
  
-$(obj)/libfdt-temp.o: $(addprefix $(obj)/,$(LIBFDT_OBJS)) FORCE
-       $(call if_changed,ld)
+$(obj)/libfdt-temp.a: $(addprefix $(obj)/,$(obj-libfdt-y)) FORCE
+       $(call if_changed,ar)
+
+$(obj)/libfdt.a: $(obj)/libfdt-temp.a FORCE
+       $(call if_changed,objcopy)
  
-targets += libfdt-temp.o $(LIBFDT_OBJS)
+extra-y += libfdt.a $(obj-libfdt-y)
+targets += libfdt-temp.a $(obj-libfdt-y)

-- 
Best regards,
-grygorii


