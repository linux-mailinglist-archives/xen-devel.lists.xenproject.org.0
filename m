Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKjxKMRaCmq/0AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 02:18:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93E85647E2
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 02:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311379.1581536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOlfh-0002Tn-2n; Mon, 18 May 2026 00:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311379.1581536; Mon, 18 May 2026 00:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOlfg-0002Qm-Uv; Mon, 18 May 2026 00:17:24 +0000
Received: by outflank-mailman (input) for mailman id 1311379;
 Mon, 18 May 2026 00:17:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wOlff-0002QA-Ly
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 00:17:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOlff-0016Gt-1h
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 02:17:23 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a0a59df-bab6-0a2a0a5309dd-0a2a450ad86e-34
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 02:17:22 +0200
Received: from [52.101.70.114]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a0a5a92-56b3-0a2a450a0019-34654672f868-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 02:17:22 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS1PR03MB8174.eurprd03.prod.outlook.com (2603:10a6:20b:4c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 00:17:21 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 00:17:21 +0000
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
 b=GsUpVRoMsXDDYGRBezMihzTkiGy1R8eciqUuwLc9S2xTFCLSyOOtCjfl/gFBiXlk90Vz9Q2r1Q5ODxVdd+ldIXIf1sgUvwMWCgwu9FptP0X3ZO3xOINvvKap9tF0Al1u9uMZuLxogzFupE81CBNxEUkoxyQFRgXtpr6i2JE3EUI0zJdY4+DWHVJmZsoWzzf56LGe9PV1faFsSGhBgCYlycZahxmpaK4uJUq9aJ+yIo0i/iO1V74z00yonkrP5ldDP+zu41pght0KpkEp6H6ECRjkku5TRZQcHOOr3KAbttPiw9dIMa6E8iN1p7OHW8+3SlwqkayxFO/fpAJHIrWBTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrqlGz1pKadxC9XvBOPz1xCG+Yo0D73Ex0VCjASJ+8c=;
 b=KqoZDj0Rbuh/4xquKh5QqSco2rXqrRJUIsD0+qOyzVuY2oLkfzjYNjWe9t+UX5q2etamhV7f+DZYPmwy/SZOtN+VI46//iT79wkuEXPVkb550H3ITD8m87M1uKmFQ9GV3CtTbFHWHzvRiU1nPPjbl1myZPZ999P7IxlNJVkshAIOk+Hyo0oOB54e8vs6638dJ04d0Pn91xgD01d7EyjddTXmTa/t8I3uMFAb6Y/2bnDQzoznZmKFhsgE3Y0umjuORZ6AEJxV3SXMQmxyzqqoeGuVQH6x248xzXhJxTbA/YWk88X3TZ+N/FEaU++KucTwn9YBRHcrMmsLZbiCmJBx+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrqlGz1pKadxC9XvBOPz1xCG+Yo0D73Ex0VCjASJ+8c=;
 b=qNblJMU/2v1HG2u7S+4zZuGon0J+e8phhOV77YYjJMHi8I1mU4YbGIdiPy1hX3txkKQReMO3t+VG39R22MRiCrVHDV5ME9NKWTcrKWWLZfJuJwUiOYsqbr5Cwf4m73bztAgUm21yB0dxOiwefI98Qc6mbDzv+1ytr6HQ94iiG3bWDxK1NrqcFr3x13kMEYW67hLsWnVuI0SGqnFet7OTl4Dm3mleMDXNZITULF6+BN4z86VLfdtxhhbOqVuOk2h1/BAI+xF2qgWdjPidNLu3czQevQwwr7n9fAC6H7XDRy9irJ5zRBQu5FmwtvBONTuzyYEY4xb9cg8oDd9+Z/oW6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f7e7f42c-43f1-436a-9d06-ab44619f2da0@epam.com>
Date: Mon, 18 May 2026 02:17:20 +0200
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v3 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <25adb33c4be3932c2d946cf7757c933eb042476c.1774918270.git.milan_djokic@epam.com>
 <6d1806aa-b009-407a-9a7a-476f9f4deb70@xen.org>
Content-Language: en-US
In-Reply-To: <6d1806aa-b009-407a-9a7a-476f9f4deb70@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::15) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS1PR03MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: f95340a8-03d7-4680-0383-08deb472d43c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	Z2fvjFnXWSBCHJwoIPgU4Uw7KT6eMUy8KUF98VtI5nLMHWvmjShVkWlVzb4jrpwyp3qWlY6i1YzgEqoq9ThrOGXFRPT0DWF4quTak6LsCOjPUmkdu4E2i8dVeWZM7VGLBqtR7+cNHNX/wIx67b37Xa5omlIHJRUaCdJDgLLynl1Vg+WI7LmMAUCrFOfagItj7AANNC4/KnQkUwvPmW1tHnfQR7ht3Wl1nCmCZy9qejr6ie7G1BHV7CXvthbZNPI/KkCCTUdFyyNOITA/E+eDv9X18znC6qhqbTR00NlHUC6obNwOs4XW/+G/qDsgfBI+q2VJqb4+8SLrqVkjt9WusWCob7yewMpVQ9JMOu45Afr1a34X+NHRkQb9c/GBNtkvPNSjG7TQSSZ3E+Nn1Zp6qVmHhXHRF/A3FBy7jre1Sv1QCBGRUH3Der2OIO7Ve1yVA2ntYinltsBPyyObkjdSzzpmUBrywI8vRO2/f7NUT0HtLE9ZnqXwYnb48QBCAR5rB9T8KBQcQSKxn/BfxNCSbnXppBwlJVeYQobiXRRt1RDqaxhfkA4yO2f/+bw7d8kvu4qF/H9LO1tHHMYlK+droSDs7DDjJZJfW9o9NzGVq5YyEcqmRS7oGpnP7lyy271jvd4RqDCM3JnEyctnmhw6Lvs3kbaz3Ydvffaan+A3jqFnNpkpXjQcBQV8deMVZtK/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(11063799003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmJCekUzVW5SK2k3Z3hmS0FlTHlGZm9uQjN0N3RLeXNZd01FLzVPMFlHR0hR?=
 =?utf-8?B?dGRSY1RRbXROdEZ2YmUyQUNaT296RzdtS25CV3l6WFhXYjNMZS9hV1J4Q1JQ?=
 =?utf-8?B?NjdZU1pTRjNnM1dBZVBVM25mSXZlSlYzZ2dMM1NSTUpFYTc2Y0p4NXBFaExw?=
 =?utf-8?B?cEV0L1YvZ2QxcVFvYmVCYlNzekppV1BDTkt2Tml2bEFHRXRkTnFNM3Yya1VW?=
 =?utf-8?B?SmZRT2lNYWpWZjBzRDlSUDErdmpLb1J0cDA4ZXoxT3kwY0g3MU1pRGRMTTkz?=
 =?utf-8?B?aVF0NFZqQ092R0M0R21LN3hDSE5GZG9uN2o0MS95MkpmQnIwNHROd2dZdVpo?=
 =?utf-8?B?YXZQRWtPdlpZTEVvNUNBb0tSaGNKVitkMW9tKzA2Si81Sks2M1VPTEJCcnNB?=
 =?utf-8?B?YURaN2U5am53dGkxbnFLNnR6UGhmc09CQ3YzZ1VqL2RSTWFyU2ZKa3dabkti?=
 =?utf-8?B?ZHpJRkNkS09kYXQ4L0VlU2V2S1E4UEEzdFBuWEFvM0hYbUJaNXFBTDg4NnNh?=
 =?utf-8?B?RlU0aVExNS9obEtxSzVCYmVEaGV3K0JCWVFEUEVNNGlCOVIwTklRbXlUSFh5?=
 =?utf-8?B?aGVycS9vdEVzV0JmZTdJZ3VrKzM0RTVLcUVweEcwcjFlekU2NUZrb3NIbkZU?=
 =?utf-8?B?QW9zSDJsZWtoQnRtQk9EU3hMNjRpdGpJY3lJaFBKTlo4cXpoQnpydi8ySVVJ?=
 =?utf-8?B?USt6OUdlK0M1endNRjJPUllDeWZZRVpQL09SVkM5bENJaWQ4SzBoaEtnUkEx?=
 =?utf-8?B?eDdQdmxUWkF6NEZ6dHh6eEdBRWEyWUtVTjNLanVadVlsWHJLSkZKeDlSTjk0?=
 =?utf-8?B?SlpGM09yTUozU0QrY3gzRUtEV1pRNFFFWUowU2QvZnpGZnRBYUcvQzlyaTBk?=
 =?utf-8?B?ekFoRDJuem55ZTB0cGhQSGdJaFduVDVBd3QweHRjY0lkdUJoRHlIaFNDbncy?=
 =?utf-8?B?dllNNUVtTFFTRkl2S0tjTlplcFhBa1N2SHFJeXhCbXRabldyS0ZORnJOa1pv?=
 =?utf-8?B?UHR2aFRzUForSWJselFxWlUyaDYrT05tNGFScUpzcHU1RktxTW1TUXpJN0M3?=
 =?utf-8?B?ZGVjYUJ5TDFzYlhtWitoMUZIZzdwbHJOVkdPZkJQR0R0TC9GRVRBT2tKWXA4?=
 =?utf-8?B?bzIwUUc0eTEraFZYQjVZUFo3Ym92QXFlcXZDUmJuNE4vM2dEeFJ3NGNYbWpr?=
 =?utf-8?B?aFVqdk5TU3RsRENqdEJVckRsWTVmN0tSYnpjcm5IZDNEWm1oQkpIandKaWx6?=
 =?utf-8?B?MW5QM3ZXT29HcVdGU2dHNktKYTd0V2h6RWhYNmVtdGFlR0JOQ0IzYnF0ODhG?=
 =?utf-8?B?bmduNkM4TmRBN2UrMWtDUmlraHlFcjUzdkc4RjZRUHUrZkpSMmh4bHFkNk5U?=
 =?utf-8?B?M1IrUGw3R2RvOE1zL01JWlJEUjJ5R2FKR2JkK3JpcER2ZnZJeTk2YWlGVFN5?=
 =?utf-8?B?RXc3OFJxdCthY3Y4U2dWZmpzcU5KRUs4VU05a21rTTVLc3JDZklON3I3blZC?=
 =?utf-8?B?aE1YZ0o3V2dMaHV4Rlg0ciswVjhJT0xLTzVvdU8xSWovcDRGK0FKQjVqRjAw?=
 =?utf-8?B?S0Fpb3hCZUlWL1Q4cCtzR2NoK1UrMk5yWUxSVndIZFYyQXpVNXIxSFlPNW9K?=
 =?utf-8?B?OTVwMU5SRlJPOWxXb0xUb0U0OEswUmtUTjZpZTA5TER5eHFvRVgrRlRLSDFH?=
 =?utf-8?B?TTNSR3V1TWdXTW0xSnN6K2JMc2FabmRGQ2o0dlBiY2dYUS8vcFNLbUw3MjZk?=
 =?utf-8?B?T2kwbmJhdllwTlRlaTBsb0ltOE56OE9UclBvU2RaSjBna3BVbHpjVUN5T0xv?=
 =?utf-8?B?VzhoYzJpbGQwdWdpdzZ1cDB1b2hmRnpLY0cvNXpIOHNGMVR6NlNZcEpDdzUr?=
 =?utf-8?B?MUlkRmFTbDc1Nnhwd3Y4d0NuUi8rV1YzcDFDbmFGS3ZZQnJhdkg4S29QM3VS?=
 =?utf-8?B?WVVPN3VoaFVJMmYrMUZSSWhlNzJsQVE0N21RZXM4ZTJvMHR1QjVNRkRQRGl0?=
 =?utf-8?B?SEZreWowWkEyVTc4YW5aVWVzWmRCczRVSTR6Zm9EQkpWaDhwSHQ0b3R2TWc3?=
 =?utf-8?B?YUE3RnA3S203aXpUdkVXNGxxRWlhZFF0UDRsVGw1WTRvQ2lKRlRUbU1tRmRp?=
 =?utf-8?B?a0R4NDErVWt1VjVTVS8vRXdVN2NLU0Z4TFJkaHVpMmtDVEo5NThiSjA1T0RP?=
 =?utf-8?B?eXZxUGU3ZkdOdUtYYmxRbjRLbHNtVFdRYXJmcWdLNTlZWUJhcFRjS3YzSGg1?=
 =?utf-8?B?RmI2ZVdYL0FHeUdwd2VFa0V2aGhOV0hLNHFwc0NQY3RTc0JGVm54MzhrQTRO?=
 =?utf-8?B?aHhFQ2FNOVZFeGRMd1pHWHlUaVF4Sk5sVUlncW5OcWoxUXVqTWhnZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f95340a8-03d7-4680-0383-08deb472d43c
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 00:17:21.4063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbHputbP4OTs0Flaa/fMIKc3+k3u3K0MmPIbPHvwVfVL3WdN2Hf6B/fY39NAGhNBTN4MjaIB55EQqc5xnJVaBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR03MB8174
X-purgate-ID: tlsNG-4011c0/1779063442-70F618B7-760BD7E7/0/0
X-purgate-type: clean
X-purgate-size: 19399
X-Rspamd-Queue-Id: D93E85647E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,epam.com:email,epam.com:mid,epam.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Julien,

On 4/14/26 10:10, Julien Grall wrote:
> Hi Milan,
> 
> On 31/03/2026 10:52, Milan Djokic wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Add initial support for various emulated registers for virtual SMMUv3
>> for guests and also add support for virtual cmdq and eventq.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/drivers/passthrough/arm/smmu-v3.h  |   6 +
>>    xen/drivers/passthrough/arm/vsmmu-v3.c | 286 +++++++++++++++++++++++++
>>    2 files changed, 292 insertions(+)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
>> index 3fb13b7e21..fab4fd5a26 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.h
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
>> @@ -60,6 +60,12 @@
>>    #define IDR5_VAX			GENMASK(11, 10)
>>    #define IDR5_VAX_52_BIT			1
>>    
>> +#define ARM_SMMU_IIDR			0x18
>> +#define IIDR_PRODUCTID			GENMASK(31, 20)
>> +#define IIDR_VARIANT			GENMASK(19, 16)
>> +#define IIDR_REVISION			GENMASK(15, 12)
>> +#define IIDR_IMPLEMENTER		GENMASK(11, 0)
>> +
>>    #define ARM_SMMU_CR0			0x20
>>    #define CR0_ATSCHK			(1 << 4)
>>    #define CR0_CMDQEN			(1 << 3)
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> index e36f200ba5..3ae1e62a50 100644
>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> @@ -3,25 +3,307 @@
>>    #include <xen/param.h>
>>    #include <xen/sched.h>
>>    #include <asm/mmio.h>
>> +#include <asm/vgic-emul.h>
> 
> vgic-emul.h is intended to only be used in the vGIC code. I am fine if
> you want to use it in vsmmu-v3.c but it needs to be renamed. Maybe to
> vdev-emul.h.
> 

Sure, I'll rename it

>>    #include <asm/viommu.h>
>> +#include <asm/vreg.h>
>> +
>> +#include "smmu-v3.h"
>> +
>> +/* Register Definition */
>> +#define ARM_SMMU_IDR2       0x8
>> +#define ARM_SMMU_IDR3       0xc
>> +#define ARM_SMMU_IDR4       0x10
>> +#define IDR0_TERM_MODEL     (1 << 26)
>> +#define IDR3_RIL            (1 << 10)
>> +#define CR0_RESERVED        0xFFFFFC20
> 
> AFAIU, this is covering all the bits defined by the SMMU spec. But some
> of them are optional. Does this mean we will expose those optional features?
> 

Right now only mandatory features are supported (SMMU_EN, CMDQ, EVTQ). 
Most of the optional features are not advertised in the IDR registers, 
so guests are not expected to enable or use them via CR0.


>> +#define SMMU_IDR1_SIDSIZE   16
>> +#define SMMU_CMDQS          19
> 
> Can you add some details how you decided the size of the command and ...
> 
>> +#define SMMU_EVTQS          19
> 
> ... even queues?
> 

The CMDQ/EVTQ sizes are currently set to the architectural maximum. 
Since there is no direct dependency on the underlying hardware queue 
sizes, using the maximum supported value seemed like the simplest option.

>> +#define DWORDS_BYTES        8
>> +#define ARM_SMMU_IIDR_VAL   0x12
> 
> I am not sure which implementer this is referring to. But how do you
> plan to handle errata? Are we sure they can always be handled by Xen?
> 

This is currently a dummy value used to avoid triggering guest driver 
errata/quirk paths. I will replace it with a more meaningful value. 
Using the Arm implementer ID with the remaining fields cleared should be 
sufficient.

My expectation is that errata handling should remain in Xen rather than 
the guest. Exposing real implementer/product IDs could cause the guest 
driver to enable errata workarounds that may not apply correctly due to 
the vSMMU emulation layer. For the current implementation this seems 
sufficient, although there might be some updates in the future in this 
regard.


>>    
>>    /* Struct to hold the vIOMMU ops and vIOMMU type */
>>    extern const struct viommu_desc __read_mostly *cur_viommu;
>>    
>> +/* virtual smmu queue */
>> +struct arm_vsmmu_queue {
>> +    uint64_t    q_base; /* base register */
>> +    uint32_t    prod;
>> +    uint32_t    cons;
>> +    uint8_t     ent_size;
>> +    uint8_t     max_n_shift;
>> +};
>> +
>>    struct virt_smmu {
>>        struct      domain *d;
>>        struct      list_head viommu_list;
>> +    uint8_t     sid_split;
>> +    uint32_t    features;
>> +    uint32_t    cr[3];
>> +    uint32_t    cr0ack;
>> +    uint32_t    gerror;
>> +    uint32_t    gerrorn;
>> +    uint32_t    strtab_base_cfg;
>> +    uint64_t    strtab_base;
>> +    uint32_t    irq_ctrl;
>> +    uint64_t    gerror_irq_cfg0;
>> +    uint64_t    evtq_irq_cfg0;
>> +    struct      arm_vsmmu_queue evtq, cmdq;
>>    };
>>    
>>    static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>>                                  register_t r, void *priv)
>>    {
>> +    struct virt_smmu *smmu = priv;
>> +    uint64_t reg;
>> +    uint32_t reg32;
> 
> Looking at this helper and the read one, I am bit surprised there is no
> lock taken nor we check the access size.  Can you explain why?
> 
> For instance, we should not allow 64-bit access on 32-bit register. The
> rest of the size (8-bit and 16-bit) is IMP DEFINED so it may be easier
> just not allow them.
> 

Most of the configuration registers are expected to be accessed in a 
serialized manner by the guest driver, during driver initialization. So 
I think that only queue and error reporting registers should be 
protected. Only command queue handling is protected currently. I will do 
the same for the event queue and gerror, this is missing.
As for the access size checks, yes, this needs to be implemented. I will 
add it.


>> +
>> +    switch ( info->gpa & 0xffff )
>> +    {
>> +    case VREG32(ARM_SMMU_CR0):
>   > +        reg32 = smmu->cr[0];> +        vreg_reg32_update(&reg32, r,
> info);
>> +        smmu->cr[0] = reg32;
>> +        smmu->cr0ack = reg32 & ~CR0_RESERVED;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CR1):
>> +        reg32 = smmu->cr[1];
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->cr[1] = reg32;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CR2):
>> +        reg32 = smmu->cr[2];
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->cr[2] = reg32;
>> +        break;
>> +
>> +    case VREG64(ARM_SMMU_STRTAB_BASE):
> 
> Looking at the SMMU spec (6.3.24 in ARM IHI 0070 H.a), the behavior of
> writing to the register is constrained unpredictable before SMMUv3.2,
> but after it should be ignored if SMMU_CR0.SMMUEN == 1.
> 
> So this implementation would not be valid for SMMUv3.2 and later. For
> convenience it would be best to just ignore the write (which is also
> valid for SMMUv3.1 and ealier).
> 
>> +        reg = smmu->strtab_base;
>> +        vreg_reg64_update(&reg, r, info);
>> +        smmu->strtab_base = reg;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
> 
> Similar to above, there are some conditions when this field can be
> written (see 6.3.25).
> 

Yes, both writes should be guarded by SMMU_CR0.SMMUEN. I will add this.

>> +        reg32 = smmu->strtab_base_cfg;
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->strtab_base_cfg = reg32;
>> +
>> +        smmu->sid_split = FIELD_GET(STRTAB_BASE_CFG_SPLIT, reg32);
> 
> The information for sid_split is already stored in
> ``smmu->strtab_base_cfg``. So why do we need to store it differently?
> 

No specific need for a separate structure field, I will remove it and 
extract the SID split from ``smmu->strtab_base_cfg``

>> +        smmu->features |= STRTAB_BASE_CFG_FMT_2LVL;
> 
> I haven't checked the rest of the code yet. But from the name, I would
> assume it indicates whether 2-level stream table is supported. From my
> understanding of the specification, this is selectable by the guest OS.
> So why is this unconditionally set?
> 

I think this is a leftover from the initial implementation where the 
value was hardcoded. I will fix this and derive the field from the 
guest-provided configuration instead.

>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CMDQ_BASE):
> 
> Similar to above, there are some condition when this field is RO.
> 
>> +        reg = smmu->cmdq.q_base;
>> +        vreg_reg64_update(&reg, r, info);
>> +        smmu->cmdq.q_base = reg;
>> +        smmu->cmdq.max_n_shift = FIELD_GET(Q_BASE_LOG2SIZE, smmu->cmdq.q_base);
>> +        if ( smmu->cmdq.max_n_shift > SMMU_CMDQS )
>> +            smmu->cmdq.max_n_shift = SMMU_CMDQS;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CMDQ_PROD):
>> +        reg32 = smmu->cmdq.prod;
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->cmdq.prod = reg32;
> 
> AFAIU, this implementation is not yet complete. If so, it would be good
> to mark it as such with a comment of BUG_ON("Not yet implemented"). Same
> for everywhere in this file and the rest of the series.
> 
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CMDQ_CONS):
>> +        reg32 = smmu->cmdq.cons;
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->cmdq.cons = reg32;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_EVTQ_BASE):
>> +        reg = smmu->evtq.q_base;
>> +        vreg_reg64_update(&reg, r, info);
>> +        smmu->evtq.q_base = reg;
>> +        smmu->evtq.max_n_shift = FIELD_GET(Q_BASE_LOG2SIZE, smmu->evtq.q_base);
>> +        if ( smmu->cmdq.max_n_shift > SMMU_EVTQS )
>> +            smmu->cmdq.max_n_shift = SMMU_EVTQS;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_EVTQ_PROD):
>> +        reg32 = smmu->evtq.prod;
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->evtq.prod = reg32;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_EVTQ_CONS):
>> +        reg32 = smmu->evtq.cons;
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->evtq.cons = reg32;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_IRQ_CTRL):
>> +        reg32 = smmu->irq_ctrl;
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->irq_ctrl = reg32;
>> +        break;
>> +
>> +    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
>> +        reg = smmu->gerror_irq_cfg0;
>> +        vreg_reg64_update(&reg, r, info);
>> +        smmu->gerror_irq_cfg0 = reg;
>> +        break;
>> +
>> +    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
>> +        reg = smmu->evtq_irq_cfg0;
>> +        vreg_reg64_update(&reg, r, info);
>> +        smmu->evtq_irq_cfg0 = reg;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_GERRORN):
>> +        reg = smmu->gerrorn;
>> +        vreg_reg64_update(&reg, r, info);
>> +        smmu->gerrorn = reg;
>> +        break;
>> +
>> +    default:
>> +        printk(XENLOG_G_ERR
>> +               "%pv: vSMMUv3: unhandled write r%d offset %"PRIpaddr"\n",
> 
> NIT: The vIOMMU is per-domain so it is sufficient to print "%pd".
> 
>> +               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
>> +        return IO_ABORT;
> 
> Per section 6 of the SMMU:
> 
> "
> For all pages except Page 1, undefined register locations are RES0. For
> Page 1, access to undefined/Reserved
> register locations is CONSTRAINED UNPREDICTABLE and an implementation
> has one of the following behaviors:
> [...]
> "
> 
> Here you seem to implement page0 so the default case should be write
> ignore and therefore IO_HANDLED should be returned. BTW, you don't seem
> to handle page1. Is this going to be handled later on?
> 

   From page1, right now only EVTQ registers are emulated. PRI is not 
supported, but might be needed in the future for the PCI support (PRI 
queue registers also belong to page1, but not emulated atm)
So I think that page1 will be handled when PCI support is completed.

>> +    }
>> +
>>        return IO_HANDLED;
>>    }
>>    
>>    static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
>>                                 register_t *r, void *priv)
>>    {
>> +    struct virt_smmu *smmu = priv;
>> +    uint64_t reg;
>> +
>> +    switch ( info->gpa & 0xffff )
>> +    {
>> +    case VREG32(ARM_SMMU_IDR0):
>> +        reg  = FIELD_PREP(IDR0_S1P, 1) | FIELD_PREP(IDR0_TTF, 2) |
> 
> As the page-table will be used by the HW, shouldn't TTF reflect what the
> HW supports? This would allow the vIOMMU to work for 32-bit domains.
> 

If my understanding is correct, Xen SMMU driver only supports AArch64 
table format, so I think that we can't advertise 32-bit table format in 
the emulation layer even if the hardware supports it.

>> +            FIELD_PREP(IDR0_COHACC, 0) | FIELD_PREP(IDR0_ASID16, 1) |
> 
> Here you set COHACC to 0 which means the guest OS will have to clean the
> cache every time. This is safe everywhere, but it will have an impact on
> performance. I am not asking to allow COHACC when the HW supports it,
> but I think a TODO would be worth.
> 

Sure, I will add comments for this.

> For ASID16, shouldn't the value be based on the HW?
> 

Yes, this is wrong since it could advertise it when not supported.
I'll update this.

> As an aside, I guess we don't allow BTM because we only expose a single
> vSMMU?
> 

Yes, since only a single instance is exposed, BTM support does not make 
much sense.

>> +            FIELD_PREP(IDR0_TTENDIAN, 0) | FIELD_PREP(IDR0_STALL_MODEL, 1) |
> 
> For TTENDIAN, it is the same as above.
> 

> For STALL_MODEL, I think 1 is ok.
> 
>> +            FIELD_PREP(IDR0_ST_LVL, 1) | FIELD_PREP(IDR0_TERM_MODEL, 1);
> 
> Overall, it feels the value set in IDR0 and IDR1 (below) needs some comment.
> 
>> +        *r = vreg_reg32_extract(reg, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_IDR1):
>> +        reg  = FIELD_PREP(IDR1_SIDSIZE, SMMU_IDR1_SIDSIZE) |
>> +            FIELD_PREP(IDR1_CMDQS, SMMU_CMDQS) |
>> +            FIELD_PREP(IDR1_EVTQS, SMMU_EVTQS);
>> +        *r = vreg_reg32_extract(reg, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_IDR2):
>> +        goto read_reserved;
>> +
>> +    case VREG32(ARM_SMMU_IDR3):
>> +        reg  = FIELD_PREP(IDR3_RIL, 0);
> 
> I am not sure why we explicitely need to set RIL but not the other fields?
> 

This is not necessary. I will update this with the regsiter cleared to 0 
only.

>   > +        *r = vreg_reg32_extract(reg, info);> +        break;
>> +
>> +    case VREG32(ARM_SMMU_IDR4):
>> +        goto read_impl_defined;
>> +
>> +    case VREG32(ARM_SMMU_IDR5):
>> +        reg  = FIELD_PREP(IDR5_GRAN4K, 1) | FIELD_PREP(IDR5_GRAN16K, 1) |
>> +            FIELD_PREP(IDR5_GRAN64K, 1) | FIELD_PREP(IDR5_OAS, IDR5_OAS_48_BIT);
> 
> Similar to the other fields in IDR0, isn't this based on what the HW
> supports?	
> 

Yes, this definitely needs to reflect the underlying hardware support. 
I'll update it.

To summarize for the IDR registers, the intention was to preset the 
capabilities to a common configuration matching the features currently 
supported by the emulation layer. I will revisit the hardcoded fields 
and derive the values from the underlying hardware where appropriate. 
Thank you for the comments and insights on this.

>> +        *r = vreg_reg32_extract(reg, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_IIDR):
>> +        *r = vreg_reg32_extract(ARM_SMMU_IIDR_VAL, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CR0):
>> +        *r = vreg_reg32_extract(smmu->cr[0], info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CR0ACK):
>> +        *r = vreg_reg32_extract(smmu->cr0ack, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CR1):
>> +        *r = vreg_reg32_extract(smmu->cr[1], info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CR2):
>> +        *r = vreg_reg32_extract(smmu->cr[2], info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_STRTAB_BASE):
>> +        *r = vreg_reg64_extract(smmu->strtab_base, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
>> +        *r = vreg_reg32_extract(smmu->strtab_base_cfg, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CMDQ_BASE):
>> +        *r = vreg_reg64_extract(smmu->cmdq.q_base, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CMDQ_PROD):
>> +        *r = vreg_reg32_extract(smmu->cmdq.prod, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CMDQ_CONS):
>> +        *r = vreg_reg32_extract(smmu->cmdq.cons, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_EVTQ_BASE):
>> +        *r = vreg_reg64_extract(smmu->evtq.q_base, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_EVTQ_PROD):
>> +        *r = vreg_reg32_extract(smmu->evtq.prod, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_EVTQ_CONS):
>> +        *r = vreg_reg32_extract(smmu->evtq.cons, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_IRQ_CTRL):
>> +    case VREG32(ARM_SMMU_IRQ_CTRLACK):
>> +        *r = vreg_reg32_extract(smmu->irq_ctrl, info);
>> +        break;
>> +
>> +    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
>> +        *r = vreg_reg64_extract(smmu->gerror_irq_cfg0, info);
>> +        break;
>> +
>> +    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
>> +        *r = vreg_reg64_extract(smmu->evtq_irq_cfg0, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_GERROR):
>> +        *r = vreg_reg64_extract(smmu->gerror, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_GERRORN):
>> +        *r = vreg_reg64_extract(smmu->gerrorn, info);
>> +        break;
>> +
>> +    default:
>> +        printk(XENLOG_G_ERR
>> +               "%pv: vSMMUv3: unhandled read r%d offset %"PRIpaddr"\n",
>> +               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
>> +        return IO_ABORT;
>> +    }
>> +
>> +    return IO_HANDLED;
>> +
>> + read_impl_defined:
>> +    printk(XENLOG_G_DEBUG
>> +           "%pv: vSMMUv3: RAZ on implementation defined register offset %"PRIpaddr"\n",
>> +           v, info->gpa & 0xffff);
>> +    *r = 0;
>> +    return IO_HANDLED;
>> +
>> + read_reserved:
>> +    printk(XENLOG_G_DEBUG
>> +           "%pv: vSMMUv3: RAZ on reserved register offset %"PRIpaddr"\n",
>> +           v, info->gpa & 0xffff);
>> +    *r = 0;
>>        return IO_HANDLED;
>>    }
>>    
>> @@ -39,6 +321,10 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
>>            return -ENOMEM;
>>    
>>        smmu->d = d;
>> +    smmu->cmdq.q_base = FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
>> +    smmu->cmdq.ent_size = CMDQ_ENT_DWORDS * DWORDS_BYTES;
>> +    smmu->evtq.q_base = FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
>> +    smmu->evtq.ent_size = EVTQ_ENT_DWORDS * DWORDS_BYTES;
> 
> I understand why we initialize ent_size. But I am not sure to understand
> why we need to initialize q_base. Can you clarify?
> 

Actually there's no need to initialize q_base fields, these will be set 
during configuration. I will remove this.

>>    
>>        register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
>>    
> 
> Cheers,
> 

Best regards,
Milan


