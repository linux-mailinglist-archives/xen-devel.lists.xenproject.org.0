Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BF7C349DC
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 09:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156031.1485348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGZJD-0005sH-3b; Wed, 05 Nov 2025 08:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156031.1485348; Wed, 05 Nov 2025 08:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGZJC-0005pw-VL; Wed, 05 Nov 2025 08:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1156031;
 Wed, 05 Nov 2025 08:56:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfs8=5N=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vGZJB-0005pq-T5
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 08:56:02 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40526d00-ba25-11f0-9d16-b5c5bf9af7f9;
 Wed, 05 Nov 2025 09:56:00 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS7PR03MB5496.namprd03.prod.outlook.com (2603:10b6:5:2c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 08:55:57 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 08:55:57 +0000
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
X-Inumbo-ID: 40526d00-ba25-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTh8/ACd1vnD5X6l+wGtBb47xmUhJwLrtgvGKOxferkBeZDz/kW8nYBO3CQy66HcA82N+9vYgP1TZJg5OXOtHv7JWsM6g+PKtDCFA6/rVo6QmbUazeWB3ANJLAvIHHPe96jENSqVI4kE432cFuM23pOMG1y36nN2Akr0zxBHYXhaW4in3uJWz0s9FtWdUgW3pZoUTjxJvEUryJepGMyHSXsB74A8GGirBSdrd+F4PpzRNBa4yyEsOWSsDfaxfFpgo+REsGwRqzaKZZqaU3xXVuhL0WwcNRL0tvA+koQXCPQtYKbDLrfSYl2yGMacAqbAiBzZFd+XtSXSB0tElp9lRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+EJ7c46HuD7id4kyx3j+erdX5mIJyTZ4u+bn85hcs0=;
 b=Afzl76AAvR8PjzxUakbMjsdi7PilTJaRsCy+8zZBG5g/2IkycYwGRl/mNBy0gm9epvWv0PmsN0aUu/u1sO2MBQFXZ3/hHmCLhz42BS1eL6R4gmRJ2eDutTKfo373WDYZa3TTblTn60TGLVBrfDqj3dOj8grcuFwns5gWZ2ABpJDedk4XgdxHxU1+chtQ+Kh8OnBMOwus8KNhVFomNJkk/D36kI8WJAu42lsPVeBJDOgqeQzAj3CoXvpp/r5ipHyq4Khg4BrswMQ5IzHPO8oDCLzGcu+8HHx+yfLPYrWyobtAhM40r3ojbebse+UJDO5v/q04YLWIif0Djbfx7xPaTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+EJ7c46HuD7id4kyx3j+erdX5mIJyTZ4u+bn85hcs0=;
 b=QiW/nv2Du6OSJIXRVggOoZMVg5Ia6n2HCLlqCJjQ1CkHHeJATVPOUgVBgxpuKm029e6lTr6IR6lnIXBD1R20cQUzIiCVM+xXcJwLDoVIDwFvyKbrquVGGi6VfWZjpNEwooZYs37HL+mKaDZOO7evsDcPpk5GXV1JJTbOayONA8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 5 Nov 2025 09:55:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	"michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen: Strip xen.efi by default
Message-ID: <aQsRFvjvnCTla0YB@Mac.lan>
References: <20250612100705.21988-1-frediano.ziglio@cloud.com>
 <586a66e5-4b11-485e-955a-da5fc3183737@citrix.com>
 <aN6H8dOlea2Um8y8@mail-itl>
 <1708c939-4b06-4d09-acb8-6965383d91f4@suse.com>
 <aOUiU86LtvsVFukW@mail-itl>
 <e3db4a71-336c-4039-a2fc-7997fadc81b3@suse.com>
 <aOeeMtiJEhdEiadg@mail-itl>
 <bc4df23e-58b2-4cba-b25f-e8ba2da222eb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc4df23e-58b2-4cba-b25f-e8ba2da222eb@suse.com>
X-ClientProxiedBy: MA3P292CA0017.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::8) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS7PR03MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: 8446ffae-785f-4e7d-9cd7-08de1c492098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzU1SXZYdGZkSjRURXAveUUzSHBqYWdHNS9BOWZWOGIvd1ZndEFQUjJjazhW?=
 =?utf-8?B?VVg0L0w1UFRURzFpTytKTWw5UHhHMXcrUG9UYnV6SVgyM2hEaVlkbktYWFdO?=
 =?utf-8?B?Z3lCL2Fkd2NvMTZKbDcvQzhGWHpab1RIbEpjMmhWaHpFc21Uc214WEhRWHAw?=
 =?utf-8?B?c1Q5cys4Z1ZsVWtHK1hjSHBGRlNmVjM0b2Z5d2k3ZGc0ZzhhMzFveFB1S2Jj?=
 =?utf-8?B?VERaV0RYOTBrS1EzcVpOY2VPcW9lUG42NER6Ky9rNjRYZXE0V2NpZUJRenh4?=
 =?utf-8?B?SmJGV3gwUjVOR1ErdTNhMmdaOC95cS84dFNIUXg1a3FtbVpFeWQxQTN2a3FD?=
 =?utf-8?B?dHd2RlFnODFtTVNRcmd5ZDhYa255Zk1OTk9zNktBaUF4WUcyY0xob3lUVEFL?=
 =?utf-8?B?aE5JZ0M1ZHNYMzZ5Sld5ZVVtMUl0OUVkVDhYbVQ0K09sT25nK09uemRHaVFO?=
 =?utf-8?B?TDRKM2FrY1EyT2R1TGlpVjhlV0RVS2NuV3BkNldoS29HQ01MR085S05SKy95?=
 =?utf-8?B?SDU1ZU14YVhQcXo0MnFIYXQwRWZWWW90ejFzeTZtOGIvMFdNQUdDcUNBamJM?=
 =?utf-8?B?TzBJNzFkMXQ2YlFreWdIT2lhUlpUeDA5ZXRlZEphMHdSRTRacnUyUWgyTFVS?=
 =?utf-8?B?dDlYNkUrS1hsbGpQamJtNDhCOVF1bUpJRVFyeG8vZ3gzSk9LSUpZU1AwT3Z2?=
 =?utf-8?B?MEpmWWZhK2hnaVQzdW9tQzk1T1ZkbEIyUWtnNnVKRDNkQ1lSdHludzd4eU5W?=
 =?utf-8?B?SzZUd2tqYnQ1NGgzcU5OVURBWHZNODN6c09RQ290MUlEV2FUYXFnVmc1N0hP?=
 =?utf-8?B?S2pqZzY3blBHVEJDNklYTGtOS1FRWnlQS1hIRHJTL3ZzenNWckw4bWJxdVdy?=
 =?utf-8?B?Nzk4K0RVOW5wNXpVUnhBZ01UcE1iNFdld2E4UXJOdGczbU1mM3haNVRKSm12?=
 =?utf-8?B?V3huckg2WUQ1Qlllc2xlNzl4K3YyV3hHWjEvQ1h3MXBSR29wZmFUZ3M1WEM5?=
 =?utf-8?B?QnF4eGxIc2c0ajhUVkV5WWRIWnlRZ2Y1bzFFS1Z6U1ZOSTBsanEwNnk5UGdI?=
 =?utf-8?B?WThvcnV5WGhLUHdhSmFFMkZpT3FvTGIxZzBzU2htb21BT0U4bys0VU5UOHFi?=
 =?utf-8?B?SEFSb2Q3Rit0QzQyZjhicXZYYld3Ym5wbVBRekc5MXhuQVc0b1RuczFFMzh2?=
 =?utf-8?B?UlZscjZwWHRJQlM1NFhRRDFLR0Fla1JEMU9GUURiQlAzWGM2elI3TlNIcWNy?=
 =?utf-8?B?dVpRNVJuL1BwQm41ZDVEN2ZkcS9wWCtwcERrb1ZJbkxUUUhBZkpuVUpWUjRI?=
 =?utf-8?B?YmZLTlBaaUNneFNJbDBhWjVyN25oRmNQdU1NSUdmSFoyeTNNN3YrWjFVa3V5?=
 =?utf-8?B?anF2bStwbU0wWGZMNU9sSHpEQzZ5eUNLMUZ4QmUwUjNLdEtmeGRFT2xVaWJL?=
 =?utf-8?B?ODY0SVJDUldiaE9DUERyV1habWNtcmdHZmRuUkVjRzgxL25OK1ZyZ1lBREk1?=
 =?utf-8?B?aEdRQXUvT1hDWUFoWERmVlhiemZNN2VvYUh6eFRZUW1DbEFOU1BDV3Z5UGhH?=
 =?utf-8?B?RldVUjNBVnluZUgrWlpIdHY4YXBjSDM2ZzdyTm5OMzJXVklDdm5uSFVxQ2t4?=
 =?utf-8?B?K2UrMTJ3UE50b0YxeWw3Sno5bWp1Tm51b1VCWStsR3ZSN09wUHBQSWxNMTVJ?=
 =?utf-8?B?NldhdTZySjZadkZUcWwvaUZQeXFyVjRyMm4xdUNaKy9WUUtKNFFlMHhpODJw?=
 =?utf-8?B?R2hhTlVJb2hpQi9UR0w2ZU82dHhPVVptRFp0RHNtcmF6T2g0UU53dG5aU21j?=
 =?utf-8?B?b3RsRDBPYi9TemxYWWRoQlhsNU5ESU9UaWtKdERDOHYrN2wrcDhjVk1LZVBH?=
 =?utf-8?B?TFIwTEpJamE0NEU3RTVaaE1RZ003c1RIMlF6cFZQZmEvemt4NW9XSjliSm02?=
 =?utf-8?Q?awt9odaK5Te5SqGdkHqkhYWHHSVQP2eB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUN1eHdTTFo4b3JBQUwrNVVhYWFNTmtMbjN2dDlwMysrcStDc2VqUXJva3Nk?=
 =?utf-8?B?UWg2ZDVoQnAyVkdHajhObytJcVgyUEVucjV4UDNsUEl5UitlNnp6VE5jV3pz?=
 =?utf-8?B?Z2JOeldNcSt4OVk5Vk00NEZDK09ITEhkWGVOaElxVERFbEgzWUZlSjN3MEI0?=
 =?utf-8?B?Yk9GaDFuTVlyZnR0ajlXaUZnT25YZ3JmRWV4ZDZlWkFRQVBBaFdvUEx2RG5t?=
 =?utf-8?B?amxjZ1hIQXNZQWc2TFgrays4NzJqVFMvUmVuVWJKdGNuenhOejJPNFkxSXpL?=
 =?utf-8?B?QmRCVkx6SjBMbFpaVHlVSi9CUVZTZW9IMmJ3NWRBM1ZSZ01JTlEyWEJ4RXVS?=
 =?utf-8?B?TDJQYUZGczhyM29EbmpBN0VkRjBCYVpBSlhBOEpWMzFScGRiMERyQ000cXBK?=
 =?utf-8?B?cDlLMWdJbTRJR0QwQXpzNXZCdUN0cjVIWGgzVHB2bnhhVzJKdDVLS25kRS9T?=
 =?utf-8?B?Z2dlYzZqOXRhTGFGcUR5aXJwSWY0SU9QV3Y5eTd1SC9sdjRtZ0s1aGZlTnc2?=
 =?utf-8?B?bnZJRzl5NEpadWgxQUZwajA5TUpmelR4YU0vd2J4dDdoMHYzUmhhRm0xTlRq?=
 =?utf-8?B?TzBUVERObHVCRnljdkVONTErOExZQnlWNjNSTWVQMmc3cVU1N0M0Y1dFQ0ZJ?=
 =?utf-8?B?M0ZlZlE5clltdHFseUU5eGtFTXI0bnBNYk4vM3c5bUhFK0NXQ3d1SnM2L2g0?=
 =?utf-8?B?N214T2ZJVEJwMy8yZ0xDeUpIWDBSQWZYVXNmUGV5dWZTdEY1T2FCejFxeGc1?=
 =?utf-8?B?ZytmdmZmT05JUG9KR3h5aEp0RnkvY1J0UUk5cWkxZnlaZXRpZUo5blBXK09v?=
 =?utf-8?B?SVdoZmRKeGtHOXF6Qmh6dnJkS0xlRWFWY25rSUZacE5sV2ZHaGptVFZ2ZnU3?=
 =?utf-8?B?QWFIUzhmUUZYVjY3SEgwc29tUmErYnA3TE5KM3lwcjlWMkZaZEZwMkVJaEFy?=
 =?utf-8?B?S0xLWDBvNlg5SkhIQUM1ak5Tc2RheWFjMkUzeXJaUzBjdjU5ZUZRb0RDQWU1?=
 =?utf-8?B?WndJOHh1T1pTQ3lCRjlqQ2wwNnpLdDY1bHpzZ3RrcXpydTlkeTZOQnRYMHNw?=
 =?utf-8?B?Y1k5cU9OazRuRFlab2dSZnA4MytrMDNnUi9ZQlNiK01sRDR3VEM3d0IvNFlw?=
 =?utf-8?B?VndsUzB1eFd6NjlhaStyVGlmQ0Q2bUpsVWJFQnlJaFNnbklkeXgzaWhwOTFp?=
 =?utf-8?B?eVNTUmo3VmdycXk4c2pIYlpIRHZvY2MyUWNUbUlLSS8wa0g3MXB3cHB5aUN2?=
 =?utf-8?B?THdSMnF4Q29icTV3L21wSlI0aEFCRmlzTW1adG5tckJWdUxzWE1xZStQMnRT?=
 =?utf-8?B?V3pUbkpjVWs2TlVpOWwyY2p6ZkNRRGFNWGlWQ09vOG5JYjhtbUtMRGJiQVRq?=
 =?utf-8?B?WnRUZit0K01TMG1PbFJCRE9ndzVGVTQxd05NKzhYRGF2ZHlETFN6MFRZZmRh?=
 =?utf-8?B?OXlKa3FRMUpnejRzNWdxcVVyRzVraU52ZnBnSmtrZUY4dVdpelh5NE9BV2xt?=
 =?utf-8?B?Vm41Y3ZFeE5ESHhLSFVXQ1cwaTIwZWFvdGErTmIzakMrMmFMS1dtYjVFWE9v?=
 =?utf-8?B?NnIwemhidng4M3ZCa2RmdUFBWnlMaitUcy82VGFyQUptcGJwT0U3LzlJd2tl?=
 =?utf-8?B?ZDdFMm92aEZIQVBGYWtabjIxMWpJOExqUm9nZmN0RDRJeGo2dUpYRmZ4SFpU?=
 =?utf-8?B?L3NXUE8xZXExK2l0OTdiRFNNOWd2dkkyRFBNbTRCYlUxR1Z1QnlYc2NQNklt?=
 =?utf-8?B?NzlLRVgwREgwaHlYT2hLR0RMSkQvNXIvd3NmWjZKbk4xcExHSHBBK1pkcGI4?=
 =?utf-8?B?WWJhMFpQb3gxQisyS1c5Y2pIYlVYL1ViWGdoZ01EV0pNT0NtWDIvMFkzMGU4?=
 =?utf-8?B?ZUhkb1kzWDV3eUtjYy9JZ1JNUGo5QVVKb3JjRnNzYlcxQ2w1OWlGeDRpNUJt?=
 =?utf-8?B?OHhIbHVPVG1sTDQ5aXVKd3VyQTRKL2FjenFTazRPNkQ0Sk0xbmY2cmsxQTkr?=
 =?utf-8?B?WTN5Q1dwRzlBd2NPdUVWenJpbWJva2NUS0gvMGwrcjNEUXhLRERQZVliTFZY?=
 =?utf-8?B?UXN1VDRXYVRiYWQxaW44TUxDNnBPK0REcUJaZzNwLy9UQS9GS3praHMvL1Qy?=
 =?utf-8?Q?whDTaLjDxVx9W0suzCKfHxcdL?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8446ffae-785f-4e7d-9cd7-08de1c492098
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:55:57.3182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvTZd+5sAM7aYw+k/lsxFmaWZQBLSXe+KIcdCxW7lmLXx5BjWzukLAdcALxsn+g7/azo5RXrZslwA693lnsS1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5496

On Thu, Oct 09, 2025 at 01:48:01PM +0200, Jan Beulich wrote:
> On 09.10.2025 13:36, Marek Marczykowski-Górecki wrote:
> > On Tue, Oct 07, 2025 at 04:46:17PM +0200, Jan Beulich wrote:
> >> On 07.10.2025 16:23, Marek Marczykowski-Górecki wrote:
> >>> On Tue, Oct 07, 2025 at 04:12:13PM +0200, Jan Beulich wrote:
> >>>> On 02.10.2025 16:10, Marek Marczykowski-Górecki wrote:
> >>>>> On Thu, Oct 02, 2025 at 02:05:56PM +0100, Andrew Cooper wrote:
> >>>>>> On 12/06/2025 11:07 am, Frediano Ziglio wrote:
> >>>>>>> For xen.gz file we strip all symbols and have an additional
> >>>>>>> xen-syms file version with all symbols.
> >>>>>>> Make xen.efi more coherent stripping all symbols too.
> >>>>>>> xen.efi.elf can be used for debugging.
> >>>>>>>
> >>>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>>>>
> >>>>> Generally,
> >>>>> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> >>>>
> >>>> Just to double check: You offer this after having read (and discarded) my
> >>>> comments on v1, which v2 left largely unaddressed? 
> >>>
> >>> You mean the one about objcopy result used for debugging? I didn't see
> >>> that before, since I wasn't in cc on v1... 
> >>>
> >>> Anyway, are you aware of some specific objcopy issue. Or in other words:
> >>> would xen.efi.elf _currently_ be broken (as in - unusable for
> >>> debugging/disassembly)?
> >>
> >> I can't tell. I've seen fair parts of the code in the course of addressing
> >> various issues, and I would be very surprised if all of that was working
> >> correctly.
> >>
> >>> If not, then I take that relevant part of your
> >>> objection is mostly about inconsistent naming (xen.gz -> xen-syms, vs
> >>> xen.efi -> xen.efi.elf). Would xen-syms.efi.elf be better?
> >>
> >> Plus the one asking to strip only debug info, but not the symbol table.
> >> (And no, none of the suggested names look really nice to me.)
> >>
> >> Plus the one indicating that the change better wouldn't be made in the
> >> first place. As said, to deal with size issues we already have machinery
> >> in place. Not very nice machinery, but it's apparently functioning.
> > 
> > I'm of the opinion that defaults matter. Just having ability to build a
> > binary that works on more systems is not sufficient, if you'd need to
> > spend a day (or more...) on debugging obscure error message to figure
> > out which hidden option to use to get there. And while one could argue
> > that CONFIG_DEBUG=y builds are only for people familiar with details to
> > deal with such issues, IMO just CONFIG_DEBUG_INFO=y shouldn't need
> > arcane knowledge to get it working... And since that's a common option
> > to enable in distribution packages, person hitting the issue might not
> > even be the one doing the build (and thus controlling the build
> > options).
> > 
> > As for the details how to get there, I'm more flexible. Based on earlier
> > comments, it seems that (not stripped) xen.efi isn't very useful for
> > debugging directly, an ELF version of it is. So IMO it makes sense to
> > have the debug binary already converted. But if you say you have use for
> > xen.efi with all debug info too, I'm okay with keeping it too, maybe as
> > xen-syms.efi. It's a bit of more space (to have both efi and elf version
> > with debug info), but since it doesn't apply to the installed version,
> > only the one kept in the build directory, not a big issue IMO.
> 
> Hmm, yes, having xen-syms.efi (unstripped) plus xen.efi (with debug info
> stripped but symbol table retained, including file symbols) might indeed
> be a reasonable approach. (And then no xen-syms.efi at all when we pass
> --strip-debug to the linker anyway. For this to result in somewhat
> manageable Makefile logic, we may need to first split the linking rule
> into multiple steps, as iirc has been the plan for quite some time.)

It's my understanding that there's consensus now between Marek and Jan
about how to progress this forward, and it will require some changes
to the original patch posted by Frediano.

This has been marked as a blocker for 4.21, and hence needs to be
progressed quickly or else it will miss the release.

Thanks, Roger.

