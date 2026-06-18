Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T9XpNonjM2rCHgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 14:24:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D806A0004
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 14:24:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=S9j1IX+Z;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341057.1601624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waBnJ-000335-B0; Thu, 18 Jun 2026 12:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341057.1601624; Thu, 18 Jun 2026 12:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waBnJ-00031B-7M; Thu, 18 Jun 2026 12:24:29 +0000
Received: by outflank-mailman (input) for mailman id 1341057;
 Thu, 18 Jun 2026 12:24:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waBnH-00030x-Iy
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 12:24:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waBnG-00CRdS-UD
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:24:27 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a33e375-e002-0a2a0a5209dd-0a2a4508989a-24
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:24:26 +0200
Received: from [52.101.46.29]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a33e378-9ee7-0a2a45080019-34652e1d2a76-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:24:26 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7663.namprd03.prod.outlook.com (2603:10b6:806:436::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 12:24:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 12:24:21 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmwtdGZeQrE5xqM3nYcO4H/JgZEHjVVxXIlxNFRZ1gFUw6CCCd+a+YfVD9k3+QPeRt1cgMmTBqfeXxkhsa6tjBtkr6scqkL8zvzl8AGEAHL5FxmbHMYvGr1/Vc0ySpZ1uAnpnCx8GwreUmymGVeJARoVlmE3ze9Sp3PtMyU4ivn9iWYl/4xnxxyUGHNZ5QRMsvmlyG2s9zWWtDfGp0twB/V2djVpsdPf2lI0BQdGrgEko5C3Y7/A0L1wkxjAKmzjKu2fKdPmyNFAg8RjVax+dizxHiU72SQ74RQ0d3taG5TyMwLiEbViHnfQg8+O4hKxzOLg+4hVFJnlrjKKTjGO4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79Nw2EWdqEpkK9xs0uiF+U94BnIPfVBceGnCH5ySBEk=;
 b=Y20AmVUXPSclHKo/JZT+3yTkRNXHmRMm1NHl9opFJLSfQL8ticp9HOY1t0Z+l+uqRUXG1zBwMEiXt1jWl/l0YZQZMX7goDQ4SzOf5WTsXPyqJyG2vrHM9XfgDwjViMlxUf3l5TC82axBa2hqptE4nl975SjEGC1DK5ahr19QUycVrfxooLjBRyPRDW4PvYqk/zaSVuFZWtO44AQVo47D6EYarYR0UKj0kfRmZ362ze+GaocqS4RGUTTBegxx79aD2pnTA6sMnsdFc95HXBrPvSi7AJ9yeUSz8TzN23qzhDK24Ps3C0om5tnpaOfi7UZe7MSsNRIOOWFgYjzZXVRYUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79Nw2EWdqEpkK9xs0uiF+U94BnIPfVBceGnCH5ySBEk=;
 b=S9j1IX+ZvU4WoYzl1Ruw8V3HE2jfXM224Zj9Md5XscCWtJtqoN/2XVJAxYBxVbqzTLTk1AglXucN3cOzb72/fmh0RkuNXxYLgj1MiN193864lQ1M23xO7L0LtGlwSqUtnYmegyq5rMQFIGmFNaZLPJQqDEegE6dtYoLWDLZIyCk=
Message-ID: <39d12ee5-8598-4ef6-8e39-d21aa42b62f3@citrix.com>
Date: Thu, 18 Jun 2026 13:24:17 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22] XSM: guard .sysctl() and .readconsole() hooks
To: Jan Beulich <jbeulich@suse.com>
References: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
 <8536e453-423d-45a0-bb82-38283eca4786@citrix.com>
 <0604a985-96fc-454f-b9a1-242bc6cce9b6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0604a985-96fc-454f-b9a1-242bc6cce9b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0142.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:377::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 63101721-c536-4c5c-f14f-08decd3486b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yaCaRVri/P+BiwQ3x5un9eVXESa8U2keeyJzWsogTyJjtr5IZB6SBIk/uBkgF+YH2doK5tOQSPiabi1vaCQ+JF6zf809M/Cn1j1rQLeaXN/5l5WnwjmFPw3POyU9R78lCPr8oAfs+0hEunRNOHbPWDeyBynXOm4zigAWsrmjkeMlz+ZS2g42IQ7ewWMyiUOtv/VTVKZcrLUeRgZY8lZHqIYRqubxEsBMYOFwiZXWShKY6DVV7X1HuMy11dYWGLz4A0xmty2Ey9OOojWWEZdwhva1oIsEjyHnGtL2c+QwIUEIy1TR0x7siPGUUd/RChZNug7I2xlzbyDJomp6/z0vTvUorGZeOTDFxWZzD973z/CTv3k5BmvoFaj6JcRX3VdQpSQqyPqNmaQ3G/Gn5FJaZDRKg2QWU4DZ2s5F9ejKDQXLezZfyAm4vNhjSJ+h/fNqT8CvkYAm/e3N4RPUd8O206XJtTp1FV1D5qGKEDj7zp5XCMtftaXOmPnS1zKfuVsLZInihJ5AVmdM5DokJ1i/H0fcR0/2/01tw41zb6B0h0sjt4U8dnDonoQPZg8RQbZ12NeoEL7SAbwvKPrZDhXMHE4pvoPl3vp9znBfRnLPirEBwOZzP9BrTGDxjxrTzNuzQQHxT0A9ORXbGjiDzsPbtyA0WykpnPg23Y6BnCIPSB4DGkUDiqBXRtR1txLTw3Iy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0VoZHNiY09sYjVDVGtJd2FuTUVwT1NjS3NsbmxvYWlCMVNKN3JIc2ZFcHVv?=
 =?utf-8?B?ZjVIWUl3L1ErK2l5V0xuZ1hDSERydHVXSXBHRHFjbGJ6SE1YcU1TaTk4cy83?=
 =?utf-8?B?SDVhMG44OUNVZG5lUlVDUW5mYTk0T3VlREZ1a01IdXBQeWVuaHREUFBVM29F?=
 =?utf-8?B?V0l6alFUYmNmMllDNkJDZjZsR01LS3plVExGOU9tbUJuZ1d3NURHRlBFSVl6?=
 =?utf-8?B?UTdNcGpYdEUweXo4L3hwM1VvUHJHVVd5d25ucWg0V0Z0SVF4M0NaMVNMSDcy?=
 =?utf-8?B?M0lHeFA2aTBSaFd0NHJiQ2JDVnQvdlBLdS9hN1E3WTR0RXJFOFNjdDIyS0s5?=
 =?utf-8?B?bGt5aU9odzZtbzQvVmVJbytRc3hxQUxPNlJzclZHMGNBcW5aRlNYNzJxWkhT?=
 =?utf-8?B?ZFRHVzdGWVRZalpSRE5ERGY3TnF3UjNJcXdaUTZ0QlFieklxRnNCdzNyR3Fs?=
 =?utf-8?B?ZERFcnJCOS93Z045bUNnd1hLMjRaQmE2ZUdIa09PTnlvTC81L3c0ckdmT2hm?=
 =?utf-8?B?Uk4xMlZEM2VqZ0o5SGNLTk5xVk9pRHNuSnFZVEhLaVlid0hPS2xnWGZwM2la?=
 =?utf-8?B?eENaOUNKOHBLZlF2NGlSbCsxdjVuVnArU1JQUjhIVGxEK0piTmc5QzdoU25z?=
 =?utf-8?B?MCtZWTNsSXExZk5Ma0tuYlpRclA3RnQ3aTA1VlkvWXZyVituMThDZ294b3lZ?=
 =?utf-8?B?QW1nOWtDc2lCYXVpUGhaM1BzV1RWdCtOK0NnWGNBT3FoN3F0M000aG9lY1FL?=
 =?utf-8?B?SHlvUE5NTVNWdWJpclhMUE9jYVNCdVI3eUR5a2RuVkRzRE1WOS9uZVZzL1Jm?=
 =?utf-8?B?T1RPaEgrakQveXVjeUEzRE9JMVEvQmhyaVFJQzdlRDQwUWhGcUU0RzcydERs?=
 =?utf-8?B?RkZRWjFUblRXUERsc0RsdzdrK21zdlhFOHpqcXhSOGFSRTE5d3dNRVVDTzlS?=
 =?utf-8?B?MHAwaTAxL2locktEaHc2ZU1JSzFXSHRCYzVuOWpPb2VXN0xxVy9UWGNjR2x4?=
 =?utf-8?B?Vnh2endlRCtVUjJEcUJlVWM2bE5jbVJ2bktXbFhRYXYxaEUzeGRheVBtWG9C?=
 =?utf-8?B?M050V0ZwdStuayt5d252SUtVZ1JPYzc4SDJNS3o0WEhBdVRKNk5hRmZhM2xD?=
 =?utf-8?B?cTQ4NER0bzFjVWpaRlFMcWJaLy8wYytmdGpCc3FYUWx2MVRtdmN4Qkc0MXBO?=
 =?utf-8?B?d3B0Nm5JYUNiR3Y1Y2FIVTNFWEV3QkN3OFFXa2FaeHlOWWlTbnhRU3d5Z3M3?=
 =?utf-8?B?M0cyT2szQ3BiMFNlcTYrU3lHSldsbEMxRGFuamRmWmlpTmFwdDRqN2dOQnE5?=
 =?utf-8?B?dlFaZzZaOTVkVnRWK1hUQXlJWkhsYXUvdEdNRjlwUWNzaGQ2dHRpT3VkSzk0?=
 =?utf-8?B?b0Q1YllrcGNXQ1h1Q09tQzJjc0FtdGRodk11dFhCdzhiV1hIcDhMZlFEUTZY?=
 =?utf-8?B?S09xYjlHU0k0dFFwNjZMRWlSaGhJUGEvSit1blRGQUllK3A1RzB2QnI4NDNs?=
 =?utf-8?B?QU1IeTd3ekZYREhrT0I1alY3eDNNRTBnSFNicG8zbFZzb29qVWxvVkM3NGpr?=
 =?utf-8?B?L3dHQWZlOG1GZE5RbGtuVk1BWlk0WW9KS0dkOEhBRVo2RTRnWmlTNkdvSllZ?=
 =?utf-8?B?aXN6ckZOV3dCbjN6TlBJaGR0VnBtdEd5bGRlQWhmeE5sZWhpYXdpdHZqZDlR?=
 =?utf-8?B?cGNYemx6S3E3d1VMVjRoT2k5clBLK0c3QXJFZkFscjN3TzlqMStpWWUwd1Vt?=
 =?utf-8?B?YUZzcldoUldQZGdRSDlZa2xXSnFjWENmY3dQTzIzbVFFY0Q5S2xiZEhPY3Ez?=
 =?utf-8?B?M01FM0lOMFk5UEY5Mk1VTklyeUZkeWdFUUI5dGRDbGlMbkpxTnAwZWV0L0M2?=
 =?utf-8?B?czNRR1pTWHNaVEpYZmYyNDFkVExaQWJyQ2sxakVua0dxaFA5VmVnWUt4Qnd4?=
 =?utf-8?B?YWpVcmV2MFlDaWdiQk5SVU1DbnVwa05PVXAvazFZNjhTd2UrQ255S0lGbTAw?=
 =?utf-8?B?TXNWWWpIMTFjTXBGdmRrUUM2Rk5Md25OQ1Ric2hpbkVLbEdXS1kxanVrYmVT?=
 =?utf-8?B?dkZXSmd0Vno2NXRqaERlUEVQaXhoOTB3eHhibmIxSjl0NUhseDU3VHZwb2NU?=
 =?utf-8?B?RUwyRFp0bjVnb3lKT0YwWkdROER5TWF6WEUvQ0R5NnVKVzJzZUpXU1liTE55?=
 =?utf-8?B?cE41QTB5bnBoeVlEWXZUY21Mei80bGNJcXBBVWxNWHRtZ2VGTkUrUWlzZ1lL?=
 =?utf-8?B?YWJGa0h1NE5mb3JFWDE2NnAzdVpPOTBvdjhDMlJyZFFNUVlwTGN1NGxzbEY5?=
 =?utf-8?B?OGsyT2w0eWtUZ0N2Q0FiNklJOXo5anJnOHgzd09FU1lVMzNyQ1pnOHZKdUN6?=
 =?utf-8?Q?hKgr+U/O3DOlnC28=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63101721-c536-4c5c-f14f-08decd3486b0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 12:24:21.6840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFAJt566CfrZ2xeYF1APfdbfWs/sZVu97MQpmdc6GcWtgt7s8b3GcYxN+y0thym085uUWa9omLX2Hplm5a19Il3D7NyLw7YghQI8Rhyd/XQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7663
X-purgate-ID: tlsNG-c1860d/1781785466-6725F0FA-C2904F40/0/0
X-purgate-type: clean
X-purgate-size: 1898
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,apertussolutions.com,gmail.com,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44D806A0004

On 18/06/2026 1:23 pm, Jan Beulich wrote:
> On 18.06.2026 14:13, Andrew Cooper wrote:
>> On 18/06/2026 12:32 pm, Jan Beulich wrote:
>>> Leaving the hook pointers in struct xsm_ops when !SYSCTL would lead to
>>> the BUG_ON() in xsm_fixup_ops() triggering for respectively configured
>>> hypervisors.
>>>
>>> While moving the #ifdef for the corresponding xsm_*() wrappers, also move
>>> those for xsm_page_offline() (where the hook pointer field already is
>>> suitably guarded).
>>>
>>> Fixes: c9eabaa03a68 ("xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL")
>>> Fixes: bddd9af6049f ("xen/sysctl: wrap around XEN_SYSCTL_readconsole")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Ugly.  We probably ought to see about booting the RANDCONFIG hypervisor
>> too, which should be able to spot things like this.
>>
>> This is a regression vs 4.21, so does need including.
> Aiui it's a regression vs 4.20, i.e. will want backporting to 4.21.
>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
> Thanks.
>
>>> --- a/xen/include/xsm/xsm.h
>>> +++ b/xen/include/xsm/xsm.h
>>> @@ -61,8 +61,10 @@ struct xsm_ops {
>>>  #endif
>>>      int (*set_target)(struct domain *d, struct domain *e);
>>>      int (*domctl)(struct domain *d, struct xen_domctl *op);
>>> +#ifdef CONFIG_SYSCTL
>>>      int (*sysctl)(int cmd);
>>>      int (*readconsole)(uint32_t clear);
>>> +#endif
>> ... this is now the 3rd CONFIG_SYSCTL in xsm_ops.
>>
>> I know it will grow the diff, but can we see about collecting them into
>> a single region, and in dummy_ops too?  It will shrink the overall
>> result, and the order of pointers in this ops structure is uninteresting.
> I have a far more consolidating patch in the works, which is how I actually
> noticed the issue. I'd prefer to keep things as simple as possible here.

Ok.  Fine by me.

~Andrew

