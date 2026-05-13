Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tlV1MjtHBGrzGgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 11:41:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8EC530D27
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 11:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307734.1579319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN64n-0000Qz-5U; Wed, 13 May 2026 09:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307734.1579319; Wed, 13 May 2026 09:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN64n-0000Of-2k; Wed, 13 May 2026 09:40:25 +0000
Received: by outflank-mailman (input) for mailman id 1307734;
 Wed, 13 May 2026 09:40:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wN64l-0000OZ-Qx
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 09:40:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN64k-006mvJ-PR
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:40:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a0446f9-5cb7-0a2a0a5109dd-0a2a4502a658-38
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 11:40:22 +0200
Received: from [52.101.72.140]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a044706-af86-0a2a45020019-3465488cbe2b-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 11:40:22 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS8PR03MB7671.eurprd03.prod.outlook.com (2603:10a6:20b:401::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 09:40:20 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 09:40:20 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6S3nud66yOErQNUBeZ7qVpZaGTHfyYv+A8Gzpb0DyuF4ogGLH6Y8/EAf5wUjC+sJBMViFY56Y774s9pmNO1Q4vB7NtB/C6QV8Y5oWTcsSr2itJD4DbsGjK3C5/oxFFNgAyVfeAA9+cXA+R5UWIFkyNGuId87T6Lyum3AJWWOtCLcslRhS4SnaDvlaxO0q/DWY0vtZm7MlPWv69DWRuWhkUudIgBKKVlCkiaPrPUZpk2eeJAZQ7ZP8ihrdL1xrukM4SVXDkMvvfl1mtddJKhvAlbMIlTatRPbp0Ejey2YftTkXi2B4EiFmVBA277RmnmiAvHN4SKf6IHfOVQAMwPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MV/sq1dch9FW6vA4MHXb6hzqxYAXOLEG0PRlqFeD7yE=;
 b=cFnYMV5baXGAWeyK1sCX7vz3HltZhAyZxcA9BVBwKTtBG0j4YmiE/Z5rFtMt2fFBw2Varb/QrKmeEh/6lJpiBaJgev7VCcEMacNIBKBkS4d2YiNMTLVbJq2ogGkGbe53MhtJm9kWi37PLAq/6TaIxnuXYHP8MKzgncpPMCTZEKddrm/Tmtf7OhlQubehPVDuuetJE56FoFPiSqt5hmnyZLUomHy9uAxNiWUEGclopsuRJkSgX7CYrRwBmx4PXtmHJavFQLkPXnwBvHdhz3vT1jvRWz8fECohMGpfBOubiWHJk+VIl21wi1d7RiVZQTmsOrLucSBnFAnzT9JJreYrtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MV/sq1dch9FW6vA4MHXb6hzqxYAXOLEG0PRlqFeD7yE=;
 b=va6MnRMMKLArUJRTbr1UrJjhIgh0RHT7JGoBZu1B2pNaxVr2vVeF8heoOqR82dxX9Un+Ow6L2WsAqMibsa0H7kgaHzXgjA2PRgnT/2iwh+rzACB5WE2nC1ORg4a5qtqSmJDvmYWaSrFgQu7jjwF43keSr07q/IHt/TIK9GrlMu1uACSUURW3sO6zfIMFaTXb9R+cX5qopM/zhnqXnhwzh48hqf/Ze8K63ujpbCAFTQ6dri1on6afOkN9UBmGm41izF9TckwZTU/Q+tINKJaOFqlH3LxQurphKsVkX3CEnxjAPh6XKobqwuAarOc/dXtO6wDD5++wjeJZl6OnhDdPmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4a9385bc-0b9f-4ea7-a015-40fbc014e4e7@epam.com>
Date: Wed, 13 May 2026 11:40:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/23] xen/arm: vIOMMU: Add cmdline boot option "viommu
 = <string>"
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <5d86efa38ca99439153822fa19064bda6843fdc2.1774918270.git.milan_djokic@epam.com>
 <4d00797b-fe24-43d6-9ada-42426bcdab30@xen.org>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <4d00797b-fe24-43d6-9ada-42426bcdab30@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::6) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS8PR03MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6d0ea8-3df3-4f1a-fa59-08deb0d3a5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|56012099003|22082099003|7136999003|11063799003;
X-Microsoft-Antispam-Message-Info:
	Gzb8wgNyhWcpgK+f6lPLBIpEiSG7ijgLdR1SXrusHws+JWd41SVJsEiXQpZbyEg8nGFDcq8OE5F+LlftqyMfqJ1Sj56wkiCmE5VYCKlEPNBz/NEjbB0wHt18WD6FnGq/IiT4sPkJ6QqrTVLzGVntMyyEMtjjJRF5Jffss6wocHRklGejEbDE8h4BB5kz23HHX4HGvTVc4In9bPRfTEqNHq+UlXqk6mZpoXOO7WbqAKwK5BjCggigkgGYuE+4omSUrVDT8WFkHvPonVsWhHkbZ1UgJMkIdc72zNnyOOV8r44JIvFc13leN+WkbQti3/CfoxoYi5s9xnqU7BDDD40Ozx5lGIPl+DoYBb5mahPMnTFYjxtFouwSrq/Ju4T4iT2YMlb8mizOcuvLpRUVzSJiLbkCeTk40QrKuVi1Svemyv5erBGod5TXsBINObcTTvO0oS+iQnIRPpnEF9yVkjPtoAiWIOgA8s7VR7kLn8w/gyfwrLmFDROB+7aLJNVSmSDCG1dnxmQmkXSIRqmMJSWuE9VlhqL6XF2EskkvrxF69FozPCED5UV7qBl3Wz5eCwNox5287SDfxElxGJqH6DeFU8rVaWfV71y185FPByb562m93uPw7vxaX92jLgbluq0xTXWnqyqYHQDMgwRE9nlt6koxPg/9u6HprKeXbriopLPqIRvMH4tRJ0q86xjkLHsb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003)(7136999003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGNSeHROYm51Z2hZUStMY1dPRlovK0dzaWx1MG1KQ3gydEdZOUJoOUE4WEpp?=
 =?utf-8?B?UFN5Y2RvZFd3Q3FGaU42ZnNlSXhBWklpdDNPdlZEUFl4amhYZ0gyMW5xejBT?=
 =?utf-8?B?em13aE1pMFpGWVVaRkUyenRRem1OdzhFS1ZldWZYM0RMUEZZTEYxeUpCMmVV?=
 =?utf-8?B?MnJlK1pjNUc4ZUk1bDhQMWNJMjdzYmUwaGZ1U3E2cG0xQzRIY2xoeEtrTTRy?=
 =?utf-8?B?NWczS01PQUcreFhzcEVKdTBVdjhrUTlzQW5McHVwMEJMaGxUVExIL01uMUw0?=
 =?utf-8?B?SjRMOHpWZU9zZ0ZBcFFraWF3TU85NmxReWFDdmRKNVJrekg2ekdBMVF2V0ZF?=
 =?utf-8?B?T1Q2R1VDcGc4OE9VdlkrdVN4OEtmbE5HdnRxTENFdEVrNTJOMk5YMDhvK2k2?=
 =?utf-8?B?dEExdlZseGxnUXM1cEsyLyt6dFAxc2VaMVppTnlObS9RdGRlSC8zNXJMYkpO?=
 =?utf-8?B?anlXL3ZRczNGd2NQNExtbHQxUi9sZFoxc1JlVjUwcjhNcTEwN1VXYmRBLzBh?=
 =?utf-8?B?elFaOHk1bzZObFVhMDYxN2crSTJiUEJnVlJSYUdNSGhKYVNUUkN3L2RwdHZG?=
 =?utf-8?B?SmZMTVlhQ2dFaDJTRVhFYm1HZ0NDZHhGLzNrMG4yQ0dtZThGajFqalFHYWxr?=
 =?utf-8?B?VUJsMnk1Q3RaS01HSTNTeVdORWt2UWpvRVE2SUNNbk1qVFMxVUVkejNFN2FB?=
 =?utf-8?B?TlovT1d4RElEYjJxaURmbHZ2T0ZBVnJFVm5CR0dVcWdNU25Zb0s5VWJWckJH?=
 =?utf-8?B?UUZwSGFhVlZ0cDgzWk0zV3ZFT0c0bDBsVjFIdTc0RWtXRGpRSVd1QTRiUFh6?=
 =?utf-8?B?VDQ2bjBhZHZOUExxMjJ1aXBGY1l5RUJqNzUyVmJyd1gxaXJjLzdnOWc1MG5D?=
 =?utf-8?B?Nm9GblZFNnFIMktuVVlyWDVtWWwza2REYVBQRWlILzJQMFkvcWhhUkpoZEE3?=
 =?utf-8?B?MmJqckUvM3hKUFl5ZlZRMUgxcTR3ZUVkdmUxQW5ubHdpTmdQWjB0cExtMnlP?=
 =?utf-8?B?VzRtV3lZbVdKZElGZ0JqbXZuSERWV085MkNMTXFnTmdpSGVYRmpOSXB4Sk1M?=
 =?utf-8?B?MzdORUd6OWxSOFoxVXlxaythbDF2RXpmZ1Q2UEZiaVh2WFpJNGZUVGFGOVRS?=
 =?utf-8?B?LzQ3cnAxMG84UUswQ2pDYkt2TkRwVnNESHVyalF5RUI1bFdaaENOWURXYVZl?=
 =?utf-8?B?TkE1K3RXeGhtSG9RYzdrQW1BODlwU3BadzBwSDY3UXhUMHo4c2pWcy9PZFMy?=
 =?utf-8?B?V0hnUUtrVDdHRHBBK0tmWUVKc3VDcFJyeHZreE51WHByWHRyQUtFTGxiV1hj?=
 =?utf-8?B?ZXVKbkdOUVA3eWc2T2lnUDdiczJtTHdrSmZ4UDNtK09zMkc5NFZGc05GaTZn?=
 =?utf-8?B?aGhjRFFqbUdLc3Iwbit3YVd6Q3JFSElXbzJFNEdTRVovQjI4VTA0elovd1Zq?=
 =?utf-8?B?ZGo1dzhtejhEWm92RE55akpBR3BhY3hGOGRIYUs3WnJMNTdpRDcrMUJ2ZlZ2?=
 =?utf-8?B?a3pwNC9ZTlczSDJ1WVMxR3l1eW5tb01tUHg1UEFUUkVLSTFaMGQxV3VCRHFZ?=
 =?utf-8?B?aVBlTi9mUW9SY2pWY2ZWNElyT3ArN09KaW9hbmdHSFJNN2wvR2hyUXhZYmo0?=
 =?utf-8?B?YlE0N0x3ZmFRMnQwUzNwYkRFRTdrOElqU2Rvb0swWTB6YllvT3VYNHJJR3lR?=
 =?utf-8?B?aUw0U0M3d3d6cTY1ZTdhemc0WWc0UFl4YWQ5SmN4cTNmWTNldVhxREhTbzlS?=
 =?utf-8?B?QlBlQkYrZ0JLUWxPRlVCSjRmeUlZekkxU0ZSRlBSc3NBUmd6eXo1VithVmRI?=
 =?utf-8?B?akRBU01NY0xuYmRpQWpTZ2lnazA1aFBEYjJOUlhPdUg1UHptQXl0b003QmJS?=
 =?utf-8?B?WFExd1RudWtETVVhS0RPK3FPRnVMNWpzYUxPZ3RrZnZieEI0b0dqK05TaXhN?=
 =?utf-8?B?S3gvU2w5ZFArbW93SldXMHBwTThnQ2s1emRUNXY3QWJwd0pxTHVLTjFZVGlp?=
 =?utf-8?B?aDdrTE9pS0szL1lWbTBhTWVFYkZ2N2pxQUFVOUozeVdINXBCS3FSQ1NJSWVK?=
 =?utf-8?B?MVdYNm5sTUdkbDZUbmpsYzVvTnJ1dG1LdUlGOFFiY0dRekVsRVpoYUdxQkNp?=
 =?utf-8?B?NDl4bUxIM0k1Y2l6Y21XRHlDY3JkWXIvcGRCaTZkdGVTWkFVdjRJVENvUldW?=
 =?utf-8?B?VW1WSmpmNkE5VXE2ckQvK0pJc1dMVHBVcmpmYXlTUVZqK1Q3T3JCc2wwUTA0?=
 =?utf-8?B?Tkl0ZUNoTXEwQnBQOTIzS0RDN3BGdnNMS3Z0WUFzZFU0eU5qRFcrZGJoS2VV?=
 =?utf-8?B?enRBdWR1cWZzbmZXZjRNbU9GdW9wYkZIeGNUc0U5eFc2dHFia1hrUT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6d0ea8-3df3-4f1a-fa59-08deb0d3a5b8
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 09:40:20.0773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7mI6DosBp2xy0yW4qAer12wFq7z4xKp3kXlkYZfECRgHvRJxRcOna7MCUNCYRVtWLsDlkvSnCu4UfOO8RLkCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7671
X-purgate-ID: tlsNG-720697/1778665222-ABB60161-995994CC/0/0
X-purgate-type: clean
X-purgate-size: 5820
X-Rspamd-Queue-Id: 2F8EC530D27
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:mid,epam.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Julien,

On 4/14/26 09:18, Julien Grall wrote:
> Hi Milan,
> 
> On 31/03/2026 10:52, Milan Djokic wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Add cmdline boot option "viommu = <string>" to enable or disable the
>> virtual iommu support for guests on ARM (only viommu="smmuv3" supported
>> for now).
> 
> In Xen terminology, 'guests' refers to domUs. IOW, this doesn't include
> dom0. Is this what you meant? If so, how would you enable it for dom0?
> 

This boot option enables vIOMMU initialization in Xen itself and also 
enables vIOMMU for dom0. For domUs, vIOMMU is enabled via the guest 
configuration file.
The exception is dom0less mode, where setting this boot option enables 
vIOMMU for all guests.

> That said, is there any particular reason why this can't be
> automatically enabled based on the SMMUv3 discovered?
> 

This boot option was intended to provide a runtime enable/disable 
mechanism for vIOMMU even when the vIOMMU build options 
(CONFIG_VIRTUAL_IOMMU / CONFIG_VIRTUAL_ARM_SMMU_V3) are enabled.

However, this may be unnecessary, and relying on the build options for 
enabling vIOMMU seems sufficient. I will remove this commit from the 
patch series.


>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    docs/misc/xen-command-line.pandoc      |  9 +++++++++
>>    xen/arch/arm/include/asm/viommu.h      | 12 ++++++++++++
>>    xen/drivers/passthrough/arm/viommu.c   | 11 +++++++++++
>>    xen/drivers/passthrough/arm/vsmmu-v3.c |  3 +++
>>    4 files changed, 35 insertions(+)
>>
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index 6c77129732..6531c2355c 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2850,6 +2850,15 @@ The optional `keep` parameter causes Xen to continue using the vga
>>    console even after dom0 has been started.  The default behaviour is to
>>    relinquish control to dom0.
>>    
>> +### viommu (arm)
>> +> `= <string>`
>> +
>> +> Default: ``
>> +
>> +Flag to enable or disable support for the virtual IOMMU for guests. Disabled by
>> +default. Enable by specifying target IOMMU type (if supported). Only "smmuv3"
>> +IOMMU emulation supported at this point.
>> +
>>    ### viridian-spinlock-retry-count (x86)
>>    > `= <integer>`
>>    
>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
>> index 2a6742de73..ed338fe0ec 100644
>> --- a/xen/arch/arm/include/asm/viommu.h
>> +++ b/xen/arch/arm/include/asm/viommu.h
>> @@ -10,6 +10,7 @@
>>    #include <public/xen.h>
>>    
>>    extern struct list_head host_iommu_list;
>> +extern char viommu[];
>>    
>>    /* data structure for each hardware IOMMU */
>>    struct host_iommu {
>> @@ -50,6 +51,12 @@ uint16_t viommu_get_type(void);
>>    void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>>                                const struct dt_device_node *node);
>>    
>> +static always_inline bool is_viommu_enabled(void)
> 
> Regardless what Luca wrote, why do we need to force "always_inline"?
> 

I don't think it's necessary to use always_inline here, anyway this 
function will be removed.

>> +{
>> +    /* only smmuv3 emulation supported */
>> +    return !strcmp(viommu, "smmuv3");
>> +}
>> +
>>    #else
>>    
>>    static inline uint8_t viommu_get_type(void)
>> @@ -76,6 +83,11 @@ static inline void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>>        return;
>>    }
>>    
>> +static always_inline bool is_viommu_enabled(void)
>> +{
>> +    return false;
>> +}
>> +
>>    #endif /* CONFIG_ARM_VIRTUAL_IOMMU */
>>    
>>    #endif /* __ARCH_ARM_VIOMMU_H__ */
>> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
>> index 53ae46349a..5f5892fbb2 100644
>> --- a/xen/drivers/passthrough/arm/viommu.c
>> +++ b/xen/drivers/passthrough/arm/viommu.c
>> @@ -3,6 +3,7 @@
>>    #include <xen/errno.h>
>>    #include <xen/init.h>
>>    #include <xen/irq.h>
>> +#include <xen/param.h>
>>    #include <xen/types.h>
>>    
>>    #include <asm/viommu.h>
>> @@ -38,8 +39,18 @@ void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>>        list_add_tail(&iommu_data->entry, &host_iommu_list);
>>    }
>>    
>> +/* By default viommu is disabled.
>> + * If enabled, 'viommu' param indicates type (smmuv3 is only supported type atm)
>> + */
>> +char __read_mostly viommu[10] = "";
>> +string_param("viommu", viommu);
>> +
>>    int domain_viommu_init(struct domain *d, uint16_t viommu_type)
>>    {
>> +    /* Enable viommu when it has been enabled explicitly (viommu="smmuv3"). */
>> +    if ( !is_viommu_enabled() )
>   > +        return 0;> +
>>        if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>>            return 0;
>>    
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> index 6b4009e5ef..e36f200ba5 100644
>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> @@ -105,6 +105,9 @@ void __init vsmmuv3_set_type(void)
>>    {
>>        const struct viommu_desc *desc = &vsmmuv3_desc;
>>    
>> +    if ( !is_viommu_enabled() )
> 
> This is likely going to go wrong in the future if we add support for
> other vIOMMU in the future. If we decide to continue using the command
> line option (see above), you would want want an helper to return the
> selected emulation and check against SMMUv3 here.
> 

Yes, I will remove the command-line option and use the viommu_get_type() 
helper where needed to check the selected vIOMMU emulation type.

> Cheers,
> 

Best regards,
Milan


