Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LQRI783e2mGCQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 11:34:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DADAECF6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 11:34:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216246.1526178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlPLU-0005Dp-AE; Thu, 29 Jan 2026 10:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216246.1526178; Thu, 29 Jan 2026 10:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlPLU-0005CL-72; Thu, 29 Jan 2026 10:33:52 +0000
Received: by outflank-mailman (input) for mailman id 1216246;
 Thu, 29 Jan 2026 10:33:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEJ3=AC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlPLS-0005CF-4K
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 10:33:50 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe624af4-fcfd-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 11:33:48 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6620.namprd03.prod.outlook.com (2603:10b6:303:12b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 10:33:44 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 10:33:44 +0000
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
X-Inumbo-ID: fe624af4-fcfd-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHLHKwEkUWz9DKzc3s9SuLuo/EdHe9d4mBTin8kL8YTDTbwnVlT2mNQOA/ysza5ukYh6nmTRnkO1gkrZBQQh31VqgBJwDOCOIBlRisW59ysaXJGLLV7pdiaPQ2EgbeGlP5Kdw0M14WioZr7i7uIzTg/Y2Y+m1j8qWR3GAJImghpN40C0gasq7DsIdgsbklHc44UdKZdRDLyGd8D+mxfTGFkFn16GyevesOnzchDuvPvi0Wi0ANFAog5I6Nkd0iDat000aCy0y5n4ZtnCL5yI83/BtZPpu7CoK3bjkq+lmx79H55CN9rBq4tSKXIMLxg1/zn/3aCPiFugYPYwyNb+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjXyFMGyI1iMKVmPwb92hIK3NfqNBt9EutwiA3lqK3w=;
 b=t7Rftw5MLruXwPBjEAPNAiMoz24uDUr0Sj6Tzp11HGEizDDBDlOnyPWZ6sm0XKtyMyJi0EETlMD4rC0I4BGJ2KkEI/oPAPmtgiCdd0wu2nC/5pEJKIzJDYo8AyXWGmJq508TdVxn/Be8rWt/a7zXIUr27tRhO7+AXK6OE8t9V+I0vxCrY+m6NXtUPzc3UDLrFxMWXt5Ri5fhI/HBsZMceFqQ29qQKpxlukVGZSl36i3vabsTZeBIIC7l6XVv8JqFkGkU6L+4VAbtA99pYDJRS3X9w6up2UvCtVcIccGAiXzQu9R5XciK+aN2wmRqjr5UlgWrOXF3Z3AoJNwnIkdXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjXyFMGyI1iMKVmPwb92hIK3NfqNBt9EutwiA3lqK3w=;
 b=L0gyPlfEoUY6TXwZ/2QwOkL53OxAqFun9gh50Z9vpLtVZgS9oBELJmgYGqJe7my+bZ1DOxqb4/6MIEP/NTYGqtixhP+wad7/brYvG5G6V+++d4jhiGkN4Z6G+ZnUHLpsW0cMAMaaNyr/BdAvFNteLr6uwDLiY2oZdiRSTS3St1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jan 2026 11:33:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v2 2/4] PCI: determine whether a device has extended
 config space
Message-ID: <aXs3hNjxbbs4zKGN@Mac.lan>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <edb5eeb2-2cb2-4614-a042-7788fbb345c7@suse.com>
 <aXpMIOuRZvX8IyFK@Mac.lan>
 <2d5e017f-1675-4753-9494-2b664c4ca7fa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d5e017f-1675-4753-9494-2b664c4ca7fa@suse.com>
X-ClientProxiedBy: MA4P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d7c943-5a6e-4123-6fa5-08de5f21e064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2F5OFlKNDZuOGtrMTlHa2g5ZDE0SmN2a28wV3dsZXhnUmJoVmx0V216c1Nm?=
 =?utf-8?B?cFVTOVdhRVdJWk5iRFBEZHdnZ2l1RTVXTFB2UFlwVzgwY1VobjBEMEtMOFpM?=
 =?utf-8?B?amR6VVd4c0M2TDdiNXBQbTRta0xYU21QVURnTnViVXRvL3V4c3ZtMzlIWmg1?=
 =?utf-8?B?UEZ2YzNqc0pIYWxNTFBjcXRGU2ZjeG5ocEpONEQ0cnFCT1Nwc1FJVHhzTyt2?=
 =?utf-8?B?YjJ2TWJnaEVRS3RwQTVvRS9vYmNOTHpvVXRnZjFFaXVhSk9IekhNaHpSajhO?=
 =?utf-8?B?eUJGUWtJWEx1Q2ZBUVF3Vm12TEZNZk9hSXR3L1A1YTB6eVlpVUtDMjBDUS9j?=
 =?utf-8?B?Z0tVNVFZSDJ4TmpEYnY2emNLajlGSE44c1VqME5nd1hsYjArdExVNEsyWWpI?=
 =?utf-8?B?UEg1RFQ0ZU1CUnB6UHo2L2Q4OXRxbUVmb0xTYUYrR3g4NWc1d253U21oMno3?=
 =?utf-8?B?NWQ1WFBveElBVkVCMFU3aXQzclF2WTNqOVI4MnF3Y1hPNzNnR29DODU3Q2I0?=
 =?utf-8?B?dUdadU9GTlVYeGhPeHRyaEtRTUp3ckV0RHBPcGFmcDI5OHVHRk9qV05zblE4?=
 =?utf-8?B?TFRYcmI5OElPcjdHdUUwenBEUDVPeU1DTk9ySGRuS1lFd2pWSk1MSnY4Zm85?=
 =?utf-8?B?S0ptUGg4MWlDK1c2d0tsL2dQOU5JMlNEMGZ5VjJYNnZpRTMxU1dGU0c0OFdJ?=
 =?utf-8?B?Tm85STVnL0REOGF4QlJUSzk1OUxhOHRxb05kZ3hKVTgvTWU2dWFzVUtPS3Jq?=
 =?utf-8?B?SDk5YThnODk0MXJNMGJpcVM4K21yWGY0N3BmU21NTFZVbWZka1VPTllZR2N3?=
 =?utf-8?B?WU9HMnIrc1FPaXBpSUVTWVFUVy8zTER0WGVYUE1ReFh6ZnUveGY2RDNsN2NZ?=
 =?utf-8?B?Uk13RkdXUWlWVU1YM2NFbFNNM0M2TUVQYmxvWTU1TGNLaURmVGkyM1ZvRndq?=
 =?utf-8?B?RHFaV2U3RlprOU1RWjNFQVZjTzVhRkFDc2U5MHBFQjdWeXFTbXRlZ0hkWFhz?=
 =?utf-8?B?T2dMd2I3cG1TclBiMFVuYzZ0T0xhbHlMb0d5dTBtaUFXeUFJa0xOWGRSSTRm?=
 =?utf-8?B?QXVaVEMxZyttbm9pOWZ0bEJ5WkFWaUszTC9RZFlYNzVMejBmblI2S3d1cGVN?=
 =?utf-8?B?aHNreU9iVElKR3EyaWZMOWQvYUdBOTFQTW1MT0pUZTVoeGQzMXpLWk9SZTFv?=
 =?utf-8?B?azc5ZllHWTN1b1puS2lraE5tSlNCOHpOakd0cGh4LzdISlJ6ZXEyRndJWUxp?=
 =?utf-8?B?NXdqVVRQeDROdHhVL0kzekhYalNudTIyZFZjaGtsZEg5a0FsL29BckRkZ2lJ?=
 =?utf-8?B?WXBnWVVnRUxMMW53NHZITmkxMWtHbFVaUWo3cTFRbGNiNGt2VzVPY2cvRzJQ?=
 =?utf-8?B?YWljTlFlc0c2TUZNb3MxL1BkNjdqcTVib1NCaUFjYXNpR3d2ZTExRGN2cUNJ?=
 =?utf-8?B?ajVCdHdwcVk0NTRwNUxhRnV6SXQzbzJZQkN3SldYRmI4eXhJWnEvNmEzWFR4?=
 =?utf-8?B?RTNGSTdOT1FJS0JvZzZmcDBkajArOVJvbFNlYlRyTStvcGltRmJnMENCZzZp?=
 =?utf-8?B?bkxnY3QzbzRXM0dNZTB0YUVHcjJOZ3VTQis2VkpJVkk5N0NLZVpxYWhMc2V4?=
 =?utf-8?B?cWZjSUxkeE5WeVlwN1NWbFJpVElJVE53OGZJcU9YbFB5RW95RXE3dmlGUmFX?=
 =?utf-8?B?V3hrZjdaOUFKM1BpRFFpRC9sZGUydHdLbnlzRXJwZ0ZBem4wQWxacVhFblFl?=
 =?utf-8?B?a2JXZS81TFZoNW9PVkNoYmxNd0RsRVR0S2ptWnBtWE1PN3oyYVRocFkrUkZz?=
 =?utf-8?B?b0hZdWNSK2hFd0gxcEVxaDF3RUtBYmE0TUFRSHJoWEczUWd3bHhPY2E4MzRG?=
 =?utf-8?B?Z3BieGtGWEJiSkVTWE04b3JmQWRMckVLblhJN1V3dFYyeklnelFaKzJYcSt5?=
 =?utf-8?B?OTY1TlMvYnA1WUxFWHdUR1hWMS9kdVMwY2piTDByQ1lKU1ptOXJTZkZ3T1Jz?=
 =?utf-8?B?cURpcVN4VG1SdVliUndQQnpmZnJiUzlCRTVySTlsdm5SMmg2QjMrdXdwSFpD?=
 =?utf-8?B?KzRSa2JacDhONWNid0pRRGNCNTFUQnhOSVB4dVhsUndrNlVvQ2VwU0VFeWp1?=
 =?utf-8?Q?vjNU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aksrRVZ5eHZMbGEvYWJaTnNrQ3ZMMzBKUGxob3o1VE1GRjdOSW5tRGEyUGxD?=
 =?utf-8?B?VTVWb0RDOGR4SE9sZGp3elV6cVZQRVJoSE1qTGFBSlNlbGQ0M1JaZkx4dmFh?=
 =?utf-8?B?d25sRVhkL3hvenJuaU1XYXBmcGJoQndMeW12UmNnRzlkNC9zK2FTaW5jd2tD?=
 =?utf-8?B?TEVLY1RuaEpaeHZUbWZRaGovdnk0OHpDVThtUTRhU2g1MHJPNm1vbWs5M2pw?=
 =?utf-8?B?dmpNVHJSdnJhbnJXRlUvN1QyYlBUNlJnTVQyYnorejRycGNYSGF2SnQyNmlK?=
 =?utf-8?B?Z2xRSVRVN1FHbXN4RFlEMlpiNllpT3lJY1ZJMEpWMUFzQ0tVVWJVTWNNOHBN?=
 =?utf-8?B?S09uSlg1NVNiMmxZZHd2V0ZDTFBLZWRaYjYxZWdMWG5PSTVld3oyblVJTVFT?=
 =?utf-8?B?RkNnbVNaRjBYREwwZXdKNGNITG9RdlZQcCtPMDhuem9xSGZxaktGU1RaZ2F3?=
 =?utf-8?B?VFJocHhJeE0rNHo3c25PcWMzZDVHWVpSMTBIWGx1c3QxTHlFeUthbWtJdlFU?=
 =?utf-8?B?dEdyK3JKVDROcmJZMlV4dTI5b0U5N1JueUZqdXdEeWYxUlJLa0FEUXlqSmI0?=
 =?utf-8?B?TVFJS3pvMHc0a2pCcFlzbFU0dzdqQUlGeHlJLzJyMXUwMjA5cFJZMHBPVGhK?=
 =?utf-8?B?ZCtBOFdjVWFTTTNTUVlPNUtDdURkRlFjOFVhdVNscmVrRktmNzJLZzJNSmw5?=
 =?utf-8?B?VjFqSjE0MmIwemdoQlpqejV2WDQ0Tnc0Z0wrV0orRVZ5YndIdmMwa2xUc0Zp?=
 =?utf-8?B?WmJWbllzeDdoQXBpQXFsM0lCN0dSWTA3c2ZiRnl1d3pGb3pKa0JiZWRvcnZs?=
 =?utf-8?B?WlFNUVAyd2hkbzFKNHJwVlpBUUVVYVBrTWRaVnBiMWR0L0xhd09ld0hRb2hR?=
 =?utf-8?B?YWJzSnBnVmVUZHdTNWNVUnlwL3ViL0NGekxwcW9KOEE1ZFFlczcycnNXQ2cr?=
 =?utf-8?B?V3hGYTA4Vm9yVnhEam81cE9FUXBhbUdqcW9lY2NqQkxkWCtZV1hVTEt1b21t?=
 =?utf-8?B?Vy8vYmpIaVFVOWZzMjVKTjB2bWJnWDRyeTF3dEltWDRFakN6bEMxSzFXbDFL?=
 =?utf-8?B?WXJkK0ZtTGNxR1grOFA4WTFOMlk2YU5sdVRsOUg1b3ZhVFJmbldUSHg0MG5n?=
 =?utf-8?B?RzlMN0k2R0VOVWNpaEluSktxR3puSFZnYkpyUWdDQ1FHSlRvWHdvSm9sYWNw?=
 =?utf-8?B?dm94elZyTW9SdCt1QjJ2YnFYdC9VZnRQN0twSkdmRTc3dmNSYytLWTJGQ1Rv?=
 =?utf-8?B?MUxvVGwxOC80OU9Lakw2cHR5WWJreUp2Qzl6RGVCMjlUU21sK0h4UFVHTDVB?=
 =?utf-8?B?WVhkVk5YSWdJbVh2b3JmbFEzMDdqODRza1FQZTY3YW84L1JqcllhYkVjY0Z0?=
 =?utf-8?B?NEllQWF0TXgwd251em5HUnllOGdrRHVlMEwrSEVleGxObmg3SFQyZ0U2dkFm?=
 =?utf-8?B?K2g2azBQT3pmUzYzcmhHVENuZmxLNmhWY0R2K0prQVBTcU1jcTdtUzhGMFZ0?=
 =?utf-8?B?T3FQMllCNzJBeCt0eE1LYTAvZHpDb29Zdm1XQ0VndTNWWm1JYUUvYloyWHF6?=
 =?utf-8?B?cHh2VDlRemNIQ20ydzkrUnJBaHhBclhsbi9abnVleHlIbjIxSEowUVJHc01l?=
 =?utf-8?B?bHlLWVZzYnlDWjY2Q09sdnY0Z2UxUi9xTmJ1bUtJTzF5VHBJS0tPVks1cHJE?=
 =?utf-8?B?SUtiNmhuTXVnb0t1RlovQk1TTGp0blVxSG5jWURzN2diM2JqWCtGaUFwOURl?=
 =?utf-8?B?U0FRRVRIMlZQeU5CSStqdnQ1Tmx4bTRlaDUzWFAzT3hBdXB1WmtnUHg1Z0RW?=
 =?utf-8?B?YS9OVkgvMDhlZlgzVVdPZXZZbTV6YnVpNGZHViszdCtyYmxObk00MmlEMHZM?=
 =?utf-8?B?S3NwTmpLM2ErSEI3WFNsTEJFU09rMlkyWTdSUDlqeTd3RWZvcFJ2d2lhanFu?=
 =?utf-8?B?dmNnOGpnL0pKek9xMkhQckE4d2ZnYzNmYlFneUJybWErM1lsOTRqYTN0MlhV?=
 =?utf-8?B?eTBQZTRwaFVPeitMbUEwdGI4a3puZ0hza3NNUFNmWlo4VGEwcmRpNWlOaFJZ?=
 =?utf-8?B?Z1NvSkhIOXVjVm5HbklYdllUem5GUmd2MkJaZFUxS1V0YnN2b1dQTExtendI?=
 =?utf-8?B?dXJ6L280RFFmU2E1djg5aTdVNEd1eFFac2twT20rTmY2QjE2NDQ2cVBLZmd0?=
 =?utf-8?B?aVRvZlZOd09DM1JYeWV0M1o3WU1mUXZsS2N1MEtmSXh3dy9qWnFJTVJ0eExs?=
 =?utf-8?B?RTQ4Y1krT215RW1uMGhwSjR3MFVzVG1CR0YvdTRUd29XL0xqa1E2Z2JETXBn?=
 =?utf-8?B?UG1hdEpzK3NkOFVMMFJkVDJBdFB1SFNWZmxRaUxxbXRzbVREQmVIUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d7c943-5a6e-4123-6fa5-08de5f21e064
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:33:43.8748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQBTsgpnHhSSvrUsWqGdEvEF8oKh3LKJrl+E1HVERON+dyaWoB/pcFro6Dw5DRWnpGDzH/L7DC7lsPfLyxuNQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6620
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D5DADAECF6
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 09:15:30AM +0100, Jan Beulich wrote:
> On 28.01.2026 18:49, Roger Pau Monné wrote:
> > On Mon, Jan 19, 2026 at 03:46:55PM +0100, Jan Beulich wrote:
> >> Legacy PCI devices don't have any extended config space. Reading any part
> >> thereof may return all ones or other arbitrary data, e.g. in some cases
> >> base config space contents repeatedly.
> >>
> >> Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
> >> determination of device type; in particular some comments are taken
> >> verbatim from there.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> >> ---
> >> Should we skip re-evaluation when pci_mmcfg_arch_enable() takes its early
> >> exit path?
> > 
> > Possibly - we expect no change in that case.  However it would need
> > to propagate some extra information into the callers.  I could see
> > that as a followup optimization.
> 
> Okay, with Stewart also saying so I'll make this a follow-on then.
> 
> >> Note that no vPCI adjustments are done here, but they're going to be
> >> needed: Whatever requires extended capabilities will need re-
> >> evaluating / newly establishing / tearing down in case an invocation of
> >> PHYSDEVOP_pci_mmcfg_reserved alters global state.
> > 
> > Hm, you probably want to do something similar to re-scanning the
> > capability list, but avoid tearing down and re-setting the vPCI header
> > logic to prevent unneeded p2m manipulations.  We have no easy way to
> > preempt this rescanning from the context of a
> > PHYSDEVOP_pci_mmcfg_reserved call.
> 
> Yes, definitely only re-evaluation of extended capabilities. Note, however,
> that once we expose more of them, there might be a knock-on effects on the
> P2M.

Preemption in that case will be complicated, as we would have to defer
p2m operations from multiple devices in the context of an hypercall.
I guess we will cross that bridge when we get there.

> >> Linux also has CONFIG_PCI_QUIRKS, allowing to compile out the slightly
> >> risky code (as reads may in principle have side effects). Should we gain
> >> such, too?
> > 
> > I would be fine with just a command line to disable the newly added
> > behavior in case it causes issues.
> 
> Can do. Will need to get creative as to the name of such an option.

pci=check-ext-cfg=<bool>?  Kind of a mouthful.

> >> --- a/xen/arch/x86/physdev.c
> >> +++ b/xen/arch/x86/physdev.c
> >> @@ -22,6 +22,8 @@ int physdev_map_pirq(struct domain *d, i
> >>                       struct msi_info *msi);
> >>  int physdev_unmap_pirq(struct domain *d, int pirq);
> >>  
> >> +int cf_check physdev_check_pci_extcfg(struct pci_dev *pdev, void *arg);
> > 
> > I'm not sure why you need the forward declaration here, the function
> > (in this patch) is just used after it's already defined.
> 
> Well, this is needed for the same reason that the two decls just above are:
> The file is also used for the COMPAT variant of the hypercall, and hence
> the declaration needs to be visible there, while ...
> 
> >> @@ -160,6 +162,17 @@ int physdev_unmap_pirq(struct domain *d,
> >>  
> >>      return ret;
> >>  }
> >> +
> >> +int cf_check physdev_check_pci_extcfg(struct pci_dev *pdev, void *arg)
> > 
> > You can make this static I think?
> 
> ... the definition doesn't need building a 2nd time (which hence also
> can't be static).

Oh, I see.

> >> @@ -718,6 +721,11 @@ int pci_add_device(u16 seg, u8 bus, u8 d
> >>  
> >>                  list_add(&pdev->vf_list, &pf_pdev->vf_list);
> >>              }
> >> +
> >> +            if ( !pdev->ext_cfg )
> >> +                printk(XENLOG_WARNING
> >> +                       "%pp: VF without extended config space?\n",
> >> +                       &pdev->sbdf);
> > 
> > You possibly also want to check that the PF (pf_pdev in this context I
> > think) also has ext_cfg == true.
> 
> I don't think so. No extended config space on a PF means no PF in that sense
> in the first place, for then there not being any SR-IOV capability.

Right, but won't it be possible for Xen to not be aware of the
ECAM region for that device, yet the hardware domain somehow managed
to enable SR-IOV it and request to register a VF?

I'm not saying it's common, but it might be a useful sanity check.

> >> @@ -1041,6 +1049,75 @@ enum pdev_type pdev_type(u16 seg, u8 bus
> >>      return pos ? DEV_TYPE_PCIe_ENDPOINT : DEV_TYPE_PCI;
> >>  }
> >>  
> >> +void pci_check_extcfg(struct pci_dev *pdev)
> >> +{
> >> +    unsigned int pos, sig;
> >> +
> >> +    pdev->ext_cfg = false;
> > 
> > I think I would prefer if the ext_cfg field is only modified once Xen
> > know the correct value to put there.
> 
> Well, my main point of doing it this way is that the code ends up being a
> little easier to follow. Especially without the optimization talked about
> near the top, there inevitably will be a window in time where what the
> field says is wrong. With the optimization there'll be two main cases:
> - MCFG becoming newly available: The field starts out false in this case,
>   i.e. the write above is a no-op.
> - MCFG disappearing (largely hypothetical, I think): The field may start
>   out true in this case, but will go false unless we have another access
>   mechanism for extended config space. It then can as well be set to
>   false as early as possible.

Yes, with the optimization to not re-parse existing MMCFGs there's no
transient windows where the filed is wrongly set.

I also think the registering of MMCFG ares with Xen should be done
ahead of the OS attempting to access the config space, and hence it's
not possible for there to be in-flight accesses that could see
transient invalid pdev->ext_cfg values.

> >  It would also be nice to detect
> > cases where the device has pdev->ext_cfg == true but a new scan makes
> > it switch to false.  Which would signal something has likely gone very
> > wrong, and we should print a warning.
> 
> Why "very wrong"? If Dom0 tells us that MCFG shouldn't be used, there's
> nothing "very wrong" with that. It's simply what firmware / ACPI are
> telling us.

There's also a message printed by `pci_mmcfg_arch_disable()` when the
MMCFG is disabled, so likely we don't need a message printed by each
device.

> >> +    /*
> >> +     * PCI Express to PCI/PCI-X Bridge Specification, rev 1.0, 4.1.4 says that
> >> +     * when forwarding a type1 configuration request the bridge must check
> >> +     * that the extended register address field is zero.  The bridge is not
> >> +     * permitted to forward the transactions and must handle it as an
> >> +     * Unsupported Request.  Some bridges do not follow this rule and simply
> >> +     * drop the extended register bits, resulting in the standard config space
> >> +     * being aliased, every 256 bytes across the entire configuration space.
> >> +     * Test for this condition by comparing the first dword of each potential
> >> +     * alias to the vendor/device ID.
> >> +     * Known offenders:
> >> +     *   ASM1083/1085 PCIe-to-PCI Reversible Bridge (1b21:1080, rev 01 & 03)
> >> +     *   AMD/ATI SBx00 PCI to PCI Bridge (1002:4384, rev 40)
> >> +     */
> >> +    sig = pci_conf_read32(pdev->sbdf, PCI_VENDOR_ID);
> >> +    for ( pos = PCI_CFG_SPACE_SIZE;
> >> +          pos < PCI_CFG_SPACE_EXP_SIZE; pos += PCI_CFG_SPACE_SIZE )
> >> +        if ( pci_conf_read32(pdev->sbdf, pos) != sig )
> >> +            break;
> >> +
> >> +    if ( pos >= PCI_CFG_SPACE_EXP_SIZE )
> >> +    {
> >> +        printk(XENLOG_WARNING "%pp: extended config space aliases base one\n",
> >> +               &pdev->sbdf);
> > 
> > Hm, I think this shouldn't be very common as it seems limited to a
> > short list of bridges.  However every device under such bridge would
> > be affected and repeatedly print the message.  I wonder whether we
> > should make this XENLOG_DEBUG instead, there isn't much the user can
> > do to fix it.  More a rant than a request though.
> 
> XENLOG_DEBUG feels too weak for indicating a potential problem with a device.
> I also don't see us marking bridges to limit the verbosity here, as the
> issue may or may not be due to a bridge in between. Imo we can defer thinking
> about limiting verbosity here until we see reports of this actually getting
> overly verbose.

OK, let's try with the current level then.

Thanks, Roger.

