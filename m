Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIETETBmHWqwaAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 13:00:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8BD61E04F
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 12:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323827.1589496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0N5-0007wN-8K; Mon, 01 Jun 2026 10:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323827.1589496; Mon, 01 Jun 2026 10:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0N5-0007tb-5T; Mon, 01 Jun 2026 10:59:51 +0000
Received: by outflank-mailman (input) for mailman id 1323827;
 Mon, 01 Jun 2026 10:59:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wU0N3-0007tR-LJ
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 10:59:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU0N3-008Hoq-1q
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 12:59:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1d6617-2eae-0a2a0a5409dd-0a2a450bd44e-40
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 12:59:49 +0200
Received: from [40.93.196.16]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1d6621-212f-0a2a450b0019-285dc4105ee1-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 12:59:46 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB989311.namprd03.prod.outlook.com (2603:10b6:8:396::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Mon, 1 Jun 2026
 10:59:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 10:59:43 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUp3PdSmXfQtny/g/HaWM5xdqQIE87tbDhl6Xld99UAXk5cKa5LNIINbl1I//RSKDCcaKK41ijZG582OV9klLxvtgwvuaP65wWw1LVGummSPEETR5PDp+18qXidDoEMiDTLuar5y3TGDI+6AVFCRKNZCB/QcANV93pJvk8LXXN9borLjfTafPtKL3ujVMg4daOQhXaGkYru8z123UElI3s6Lj91MLLh+Q3zFdQfE/N4HGKh1wRyOB19u30dby3IyBQs3RoH18kdE9tfUbEBqzP+JvYsvfVVuZCBiW7fnux2p9IAnXF9IxdXNA9ZsJXDma2xOgk8soufy74w1QFSVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tv+mQOrLZIObajfffP+O2abT3gcfd8oQuugRsFHhw8=;
 b=drmrcHNmjW5BDCwbSGpD4i9DrIf/lnqKOQl+8UqwsWtv5/3Y94HTVsjY7F+e2ybB5BGhwAqNZsntBRWXzFcDqNWX4pPL6so9oxcXe0JKvW0u7P5ujw1MTkIC87ID/iqk5HI3gG+xF5tE5OiF72k7QT22oscpyzu5LaI65U/1JW5hJuQv31LesWqp3vhAyzikleG1j/oF6AoSnokGs+VaABHMMWOI5ieQ35yUoEOMKrwOEd98yWJnX10HUDX6+tq0wU6aaHmx4EU079YrU9i0qEziaMli2YJabPHTMNRRxyAxN/yE9lRR2S2G7krdG+GOOsWrXpwKvmXAMyQz/aX6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tv+mQOrLZIObajfffP+O2abT3gcfd8oQuugRsFHhw8=;
 b=Js2yATJkJgSUUqCid/+PjtJh16foF7NpkOwH5B3yDrcP4m4+CXR8niZJ56Cm1rpYFZYSez6HVPWUwn0eV5gZN5e0iOSp1H03rgCQggxnOXqNL2ELtkNWG/H/smNEBA6nGwh/l7oDRBGwphT2bU0IMgfw1gevY6YHaKhcBPwEsdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9aaf1e53-c671-464e-a1f4-c5883b3c7620@citrix.com>
Date: Mon, 1 Jun 2026 11:59:39 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, anthony.perard@vates.tech,
 michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH 0/3] docs: fix minor typos and duplicated words
To: Eduardo Marinho <eduardomarinho@pm.me>, xen-devel@lists.xenproject.org
References: <20260601103905.20982-1-eduardomarinho@pm.me>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260601103905.20982-1-eduardomarinho@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0518.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3db::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB989311:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ca3a33-80e9-4f49-12d4-08debfcce308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0Npo39Ofu6EfcgzqFZ7kiejDV/vj+bsjw8PTqhlRDAVvyZBBwVq9C9nurLM/RSb7OJ7WJPvZJRQkexcMhaG+WZIDKJS+mCXiZYbBMBOXIpjegE4UmiACqvCPz/FnsV7Cl7yOsLlT3LbF31oJRIQKXfXWEIduGz2vca4bGTyAvIdKr7lyyUYL18epEnbeoHMd0MYGOFVEh90XqdI6jEyzHuxQibSpQ0a5jxF6cLwS6RLt7/ErQBecLMm2S/Gtr5Z653oXKR3XP1aQM7bsgAJuTsXVJiYjsf9hA5OKmKSPeRl5l24neuTbEam71uWfLgEE5eArl4oB94wndIMf6zan+Pg8bYLgqPSZp266WrEtS4jIcoE8PJcTtX2c9YQikWKkAhda68MbHavQLMhLIRiWay9/byiqPJ9YFjdshIuBGzKXMIeQDKohYQ26nvRmHZOdwnDBJrShxGB7WVXnOdl8HSjTAyKmeNgZxXC3lspmhGKXT+XD+qgfBWqLCI9R8jp8SBk2KReV01nEzvT5Y8rCDMJQzU+K95i2nDSUwC3pewXGcxvc6iiy8l5r2BTfo4fTsf6YVLzS3sLygv+1gpebKLW2viwSqWmHir2KV77w8XefSZCG9doveNQ8VkPIIGfXFz17zvJW4DihHQ9NgimBejXd4b8s2qXuNc8rVFZ2GhvVRuC8OjnQ/wDxrxoG5CTb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z05KSFNyTmpVMGN3dFdpY3hCSmdEVEd1cWpsdGtCMzR1THdmeGcyVVBLSVps?=
 =?utf-8?B?dTVIbk1XRTllY2d4N0lZNmZJSzgrVFFpL09lQzJtc2Z3ZHovSmphQ3EvalJ0?=
 =?utf-8?B?bnRYWFpKcUQrcFNNUC9lN1k3aTZmcUdxSFg4N0hXMlVFaWQ0RVBXZkJlYkRl?=
 =?utf-8?B?Q3REY01mdDh6d2owKzVmY1hRZWJuL28rRzAxZzNsTHo4OGtLNHdFT1VmaG5p?=
 =?utf-8?B?Unk4ZjlEa3hTNG9QUVF1bEJucENwcUJUbTEwUjNQb0JabEVOTTNPVklOMHpR?=
 =?utf-8?B?U3hYZWZBeHlCZmlGckZTU3BBdWFtbTVML0NIdVJNMmQveW5tK1phRUlMTVZC?=
 =?utf-8?B?ekZ2TE1HT0tYV1dYY24rcms1N3BwbTQweGU3aUVSbXBlVXd0WHFPNVdJN1Ix?=
 =?utf-8?B?a1lHeE5rL0IyNDl3T1lWVWtrdzJXRllUblNlcjVrc3hYSmlWOEI3UDZMUHNB?=
 =?utf-8?B?NmJNbTdhL0JaQ3dtdmRzcHpLZGVmTG5zZ1VuY0dWOStKYkNqTlVhWTlZdDha?=
 =?utf-8?B?aFAralVOb1pLUmw3TEYxZy9MS1oyTlpVYmtyVWluUkhFVENsK1F4Nm9GbnFF?=
 =?utf-8?B?NDVLOFVYOWpKZ2hTNXB1bWxVTHF3Qk9XWjJTVG5PMVhONE5TaGR6MjYvditI?=
 =?utf-8?B?SWM2Q1dBQThaVUdvMGRWczhiWXJDUkxCUVliTU9hcjFnVVNFNnlrb3dwT2dX?=
 =?utf-8?B?aWYxbUJPd2hGdFlZRFJpQ1plK1VNUjBmUkxCbnQrdDREbW5pV1UvKzFrcFQ0?=
 =?utf-8?B?T1VTV1lSUERRSnd3MHZIVFpYQjJ3RDZqanZscUIzM0hkNG96Tjgyc0xneVhw?=
 =?utf-8?B?aXc5aklKRllYOER6UVVRbDIxTCtvWjYzbFVhTzg1RUZ4a3JpSFdERFArb254?=
 =?utf-8?B?a1NhUUVRV3lNc2hKa2Z0aGg2UGRwdytvZUdVODVFcHozbnJJaUIrRWRBR3p5?=
 =?utf-8?B?eWpRb09KVzM1anIwTEVpVzlGMVRFWHRvR0MzWkpnSXNJVXgwdlQwcCtrSzg2?=
 =?utf-8?B?dVA1SzdBN3dPd0ZYaUVFZmxTWFpqUjdLZmZaZlRObk9qZVpML3g3UGhBMHA3?=
 =?utf-8?B?NnV5dHVRd3dRNTJNcFl6eFBBY1FtdlEzMWQxZUQ5eW9JUFlkU2RnR3paeGtF?=
 =?utf-8?B?THZoaHJsbUNpRTFsMmowME8yU3BSNmF5aEdYM1lVK21CNXRKKzZVSkV4aWR2?=
 =?utf-8?B?WXltU21mc2IrNno0bGlUNzZjRzFoVmNlNFZvLzQ3dUtSVWhDRVdad0hNbVY2?=
 =?utf-8?B?b2IxVkZDU0JNU2NmR28vY2JDSndDbVNveXAxTUcxQ0NobEpBSzdjU1VkTDRs?=
 =?utf-8?B?a012bWRPbHhacjg5TnFuVVBZbHVHVndTcWJ1STFXTmNQRE5aWGVTRUF1bWRI?=
 =?utf-8?B?UU5yNzkvTzZzM0Z0TWppcG8xaEhyNCs5VHZBVE5vU1lqbkQrWVBpaXhpc2dv?=
 =?utf-8?B?U09laHBIMVBJOEtvM0lkYnIvTGdYbGl2bXNvMTFBSjFURWRLVm5sWHhDTWQ5?=
 =?utf-8?B?N1YycFF3WWliMStCMUtIL001bFdpZ2pOTHhJN1M3bEhOQUFLM3JTV0VLSkIz?=
 =?utf-8?B?Z3pLU21ETG1zR0ltNEtFYUF4eXdOVHNTYXJHck9penBzMDgxQlBnUlA2Ti96?=
 =?utf-8?B?WjJKbFN1bU9EQllkN05nRzJIN2xFR0dqbzFpME95UnA1Vk5McHNtRm9YVW5r?=
 =?utf-8?B?cGFFRFRuUXl0ZUo0UlBlb01RYmNzNmxRSExqTkM4dW1LakhXbTBXSTZmejNn?=
 =?utf-8?B?RWt4eTZNUk5pZ043OWhTck11bXVCYTJUZlhQSDNyeS9NblgvaE5WRTUvTG4v?=
 =?utf-8?B?NVFuTDFSSUxqNFMxcTM1Z3NlQkU4bjArTXM0NWlwYUxoTjBrZUZmYWlTUnQw?=
 =?utf-8?B?T2xVeTcwQWV6VVlwVnNBRnlrdDZuZ3g5UjVVc0FQMHJFcVU4dXJZK3hNQmV6?=
 =?utf-8?B?MEhmTXVVRDI4RnBXUERLWGViRVRsb0NIV3pXdzlvSlgwcmUyL2dzRGc5TEFN?=
 =?utf-8?B?RVlKM0RUdUxEMHd0R1l2dkg2ZnJvcWV3aTdrNGdTd3JYYWYyVStaUVR6eHFC?=
 =?utf-8?B?bS9BZVRzOXVMVXZGMVpKeWtaWCtjZlpGaFliY04yUHR5NjNLbURabzdXNXE2?=
 =?utf-8?B?Y2Q3dGh3amRhUGkrbXVJU05iWmZzTEZkWEVjN0NsamdGc3pwcjJXR3N6Z01o?=
 =?utf-8?B?SVdCWVJ3R2JFU1o1aVFVdEFOUVRoV3JjdHJxcDFJMnlIN21YdW10UnZFVHZ0?=
 =?utf-8?B?QjZkSlFiM1dkT1lWdnNHd3hIcXZ2Z044TWs5WVhuWmVNSUkzZU1KNm9ZY2Fw?=
 =?utf-8?B?c3ZhZVRSOFNSYTloYStTM0NINnRacS8xdm9NMzlxOEkzZkV0TExHVWV3bXg3?=
 =?utf-8?Q?UhROuid269aSv7cI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ca3a33-80e9-4f49-12d4-08debfcce308
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 10:59:43.7399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmMBjPB8/ThJQD7VtB/g3BV/ldanR0vnHScVVMDX5lhMn9BwwQ6vNqKLilwfOwoovQaXPWu8yIqIsLD9AuC1PM2ivTjKNseMnyo8J9ubIIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989311
X-purgate-ID: tlsNG-42698a/1780311587-1A971F3B-FDA31396/0/0
X-purgate-type: clean
X-purgate-size: 689
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:eduardomarinho@pm.me,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9D8BD61E04F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 11:39 am, Eduardo Marinho wrote:
> This series corrects a few minor typos and duplicated words found across
> the general documentation, the admin guide, and the libxl specifications.
>
> Eduardo Marinho (3):
>   docs: fix spelling of 'necessarily' in index.rst
>   docs/admin-guide: drop duplicated word in microcode-loading.rst
>   docs/specs: drop duplicated word in libxl-migration-stream.pandoc
>
>  docs/admin-guide/microcode-loading.rst   | 2 +-
>  docs/index.rst                           | 2 +-
>  docs/specs/libxl-migration-stream.pandoc | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

