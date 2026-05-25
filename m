Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIY3CoUrFGraKQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 12:59:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C635C9899
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 12:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319172.1586885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRT0n-0002dZ-4e; Mon, 25 May 2026 10:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319172.1586885; Mon, 25 May 2026 10:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRT0n-0002bD-1K; Mon, 25 May 2026 10:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1319172;
 Mon, 25 May 2026 10:58:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wRT0l-0002ar-TZ
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 10:58:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRT0l-006QDe-5R
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 12:58:19 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a142af3-bab6-0a2a0a5309dd-0a2a450797ac-48
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 12:58:19 +0200
Received: from [52.101.52.38]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a142b49-229c-0a2a45070019-3465342661b6-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 12:58:18 +0200
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Mon, 25 May
 2026 10:58:15 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 10:58:15 +0000
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
 b=Uz0o098Vt6XVEnmbCckUTGvm51VHMXSHHSDXlcQuepx+F+yKB2salrqKtR2hxpEDyBLHwdsreuRIrxaIUDM90UjmqRPSoTdRMURHgk9aiRwlthHU7frLb0aAo9p7dN31cMNCGq1uq5bmw08lNn8uG9rL8FXdljbZ8PcnAgUQUj7ldpY4MoAX7XfWORBls4Jge55FET8XUHbT134+dP36/1xGl5AZSVz445WaQ+jUenU95B4tJCPSl4cGM5bipbAxSF8cwjqmIgraxFnxFXeljZ5ERaYnyGWUHCvTUkGhRYRJaQDkc1GyKBJTB56UqjZ/AWztHCW6wuhMMVxf4YNCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7F07p5VRviLL0HQpyMpbJ8pIPEw1CJ8aQ+kAfwfJwpk=;
 b=kl5AOLfnv4hstgfpOYwm+on/SHRpcFIscCDiYbc2XwbpVo7LbhtiIFzbvljLdc1KM61B1OGDFjkT2HKSJyCNGd+B7k0AzyAWo7usvL3y6RDuOL/eyMfqaInFe4jMwg9McnKl/O0huvCflwQ8JHdVRZ5LzuHozhyoy1tZfDXRGG1cW4Bvh5A0trcpvS+zi/HgyRniSd8G+0R4uLpeVsBMF+Aqpu31H6Rr7XCFkt+SJjkweNUGCe83A3UQWrdVr8cclieX8Kb40f8EHFuVm07QkqmO2KI9JMB5ZmTDRUnsNlZjeMCMY07VR0slTaKL9o8882jUArMB6iHJFCWfav/zHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7F07p5VRviLL0HQpyMpbJ8pIPEw1CJ8aQ+kAfwfJwpk=;
 b=Jd5JhbqOy3egNcZv2eYlAkjfnXqHtfPZXNnkakCgTst6LaM43Ylwku2vzSPsZp6cxGZb9BizSshlq8g+GWiA3sn2iGJ4MzIB/UERsrtOivojQadWFnk0c1x0V+cCjSmelwsm/ulDlC5auAtt7pFp5Uq56CGNn7+eS1xXr7A+rEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 25 May 2026 12:58:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>
Cc: xen-devel@lists.xenproject.org, dfaggioli@suse.com, jgross@suse.com,
	gwd@xenproject.org, stewart.hildebrand@amd.com, jbeulich@suse.com
Subject: Re: [PATCH] xen/sched: fix stale file path comments in common/sched
 directory
Message-ID: <ahQrQnWMiWTE1joR@macbook.local>
References: <20260525102539.27050-1-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525102539.27050-1-frn1furkan10@gmail.com>
X-ClientProxiedBy: PA7P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2de::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|MN2PR03MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f39bc1d-708f-4e89-0c49-08deba4c84b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+DwA2pzb8als+DHptwZFjnBBuIkboWIePxvasVHHdkY+Gh2yfhabsubNC4tox3pBgLHiuIm1ME59SfKkMTzaxnBTC0AJyQA3FC459mIRClbYZGmSX8donpk91n2pXYPoX967Npo5PSLlGdRvmN3DDPBqgUQwDHsuxVOuirZOkod2ZcIWhkuxJeSIipjlboXBuzAMKBvBzsq9ggl9673XDJ4cyKuF8yRc2bEU+KJceNI19G9Q45hF2Fx5GnADpby1wZvFq1IQXcSiBKXCqePI9aNIM8X3ChQevryy9aYZ68ACS63DZY6ifyJyLxXV8UICr8Umijl+SCdKHw5WcvkL6IAYC69qG/w6ohGUsN6NeUEPoWRc8ilOW3907PTjAAPhhLgCR6b4zIwm50pRvp9X2T28Rz4qWlUmj7KocTtNnf0BC61bmC7/MX12EvXGyFWLrMptZdNd+z9nijphu/RxJe/OsYEoUXRDMDBxnNdzu2C9oqudjBcxlzPiRu702X1Nv/RsG4KEg40zo1Ry2pD+hGdTFwgK4rv0KR1WAEUVaTSVlEOMkIZ4eUYmP/9RNZakpMhnFomf8NOeF9CQw9CXREPPxCU3/krKVziqMFshxLoZADH2s4BFh85X0UdM9lXZvZ8Bzc2w1yqR+PjGswtmW2HIbFayoLqIxOQnEH0YZjkS2+3kEzkXOiHRXZyY0m/j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vy9nNktXVEdxWEl2MXpNOUh2cVlKVHFiQWNDbWJwVVhXVU5ucHV1U2R0R1Zx?=
 =?utf-8?B?emU1eW1CQUxCeksrNGQ0ajgvZlAxWXlsVEp2bHNmd0hSOEVZUDJwRjNzZjZP?=
 =?utf-8?B?dXViT3V2eWUvQ1JRbDlRblY2YnlMYlZkSm51Y01YTFgzekRrNEJuaDQrSVdu?=
 =?utf-8?B?Y0M0Vm0vZmljOE8zK1Z6QytFclFMTmtXNlBlQUhOOGZzQjU2SE1hamg1R0dX?=
 =?utf-8?B?U1ltMmdSM0lwUjRpQnFzTVZmc2lQRUVCTDdMUGdnSzJxUkJiZUlNNGNJeml2?=
 =?utf-8?B?SHp3TFcwUXNCd1NDbEpIVTc1MHdlbDZQQkgyeDhBWkFodTI0RkVBVTFwTW5S?=
 =?utf-8?B?ZXJjQzJlRUxNMkVpalpQOWtoSkthYXk2aGFwbEI0ZTdWODArdlNEb1VlS01V?=
 =?utf-8?B?bE9kWmRwa296U3VhRnovWVdxMDRKTUsvVzNOeDExRkJzb0dDUWRrRnZwQ1hs?=
 =?utf-8?B?cWVqUE45d0NON1NTcnFCS0VzN3VENEpZdHlRVGROS2ptZ1JMWkxlcWJOODVy?=
 =?utf-8?B?V28xVE1wUzd6ODVvc0FUSWxvcHRjamp5OFllYmZobkl0Y1ZBU3dWMVBORk1D?=
 =?utf-8?B?dmVpaElkTXhvQXVKV3IzaXY4VXZ0c21CT05BM0lwUjRYWUU3NE1KZHQvWnVy?=
 =?utf-8?B?dTJyMEtmdVB0c0dRWUMxZ3ZKVkpjZzBmb0J2N3VPSFY3aXRNcVc4VElIcmZ2?=
 =?utf-8?B?Y0N5QVp5bzdES1pGTHdZS0VCN0FyLzVlcXMzS3cvYTY1eW5YeFFqZTRSRXZI?=
 =?utf-8?B?Q2taejRPVmoyUCtERjlOQWVQcExzSmo0R1ZxU1FYR1NyOS9RTmwwRFpWWFJy?=
 =?utf-8?B?cWVrTGZmdUtlMkdUdWZIdXIwWi9NQk5SSFRReFo2NVZPRDk5dkc5dkJhZG81?=
 =?utf-8?B?MmpnbEhFS2lHYnZXbGc5NitzNXZWZDBQSS9BeTJFSUJRZFhTNnp0MU5KVDNw?=
 =?utf-8?B?MFBuck0vd1IramdNV1JBRmdjWDJ3RjA0c2trSS9vRmM2V0UvbHpic3dCRi95?=
 =?utf-8?B?RTJYZnE1OXAzUGR0VndMV0pIRzF4YlB3TndZZGljclluRHBLSDczOEFKd2Z0?=
 =?utf-8?B?Z1VtVnA0TTUrMlRhVVJ0aFRqTmNhRUJIYStldWs2Q29RbVFtVmI4MElTM2ha?=
 =?utf-8?B?ZjZlZUw3cmY1Q0wvSnUvTytyd3o3dW1HV0tZem9XY2VycG4xV1d4Qi9jYVox?=
 =?utf-8?B?azZxS0NhU0ltMDlJUTEwczhFTzBubU5pL241QVhPL3JnZVlkV0h1a2NMRnho?=
 =?utf-8?B?NFR1TVhnUTFaT3UxbTVuSnFNN3p6bjNhVENGdUpxUlloL0liL2lJOW5uNmw0?=
 =?utf-8?B?NUZETTh2eDJFU3RkME11NkhmT3RJYW8xWTZLa09XajhKSHZSa1ljeTY3UTZI?=
 =?utf-8?B?bHZBc0JxaFg4b2NXOUdhdTN5UUhtdDBvSVIzWGNJa21JYk5kYmhJWnN2dTVr?=
 =?utf-8?B?K29oWUZTNStwTEhxQ3g3WUpBV1VFaG9ZUEtpdVRuZVJQZ0p4S0VvZTBuc1dJ?=
 =?utf-8?B?N2orYzRSNC8zcTN4T2JhdVp1RVEza2FIVkU2T1RpMkwyMG41cmFjRlVTa1Vo?=
 =?utf-8?B?NGoydWZXNzJJQ2gxOHpaSGNhM0lJdnFaQW0vZ3JLWjFFS1lWT0U3dHp2YTdR?=
 =?utf-8?B?MVpsV2k4cjhpTlZjN1VHUmFkV1NFT05ZMm1ZMnhNbWtTakFkWFFlbWZmTEJl?=
 =?utf-8?B?VXpuQUJOZmlVaytZVENIUkVBWjFUTTZTR1dyZlNHZFM0MFJZV04yYnhhV0RP?=
 =?utf-8?B?RG1FK29OR1h3eGgrYUtzYVlFOGd5OVBYQTlxQzA3N2RwN0J2UjduNytra2tl?=
 =?utf-8?B?UHR0bVZVM1JEZmN1dEhaNDYwbHRsRmZKeVpBNDhpV3crcGhqVUhhWGJKeEZT?=
 =?utf-8?B?eWpsb09sMUR1UEoxMVBNY1I3Rzl2VlBVdmJsbm1VcnFZZGQrVVorWDU5SzBG?=
 =?utf-8?B?LzROc2ZwSGJRSkVGWlVZK1VNVHVtMzVzYzQxRmZtTTlnVVROaWxCWHl5Mm9P?=
 =?utf-8?B?WEZlTy9GS1NFUjJ2QUoxb0JmSlduZHZKeTlTK25Tek9aMWlFOS9YcFpQSFZk?=
 =?utf-8?B?Q3p0cEZhMnYyMVpkRGQvN25MTXFRd0FGNEprYzRSbUo5aERxcDZ4dEFCcUpD?=
 =?utf-8?B?djlsQSt4bERqakxDNkFNR1ZJOHRHTFNvYlBLcTZGWHpYR2kyT0FqeU9uN2x4?=
 =?utf-8?B?b0s3VVJtZkN2NkpkQlB2ck05VElOcDZkNDJOTHM0em5WZENtb0JUVmlEVFZr?=
 =?utf-8?B?a0lhcGRTZlcreDVlSE1BdXFxSTg3NEFSVUViNWJBN1BCZldlUkJxd25Kb2Qy?=
 =?utf-8?B?WkpsZ21JYzR2dlBGKzBEaGhoSmN4alhINFlIR01QQUFwcmxnaU9mUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f39bc1d-708f-4e89-0c49-08deba4c84b8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 10:58:15.2409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lq2uxlDjfbExFmiQcq8ly5AAXqbaHwgCT7eA5ZAgOEvBpNOAOieqIGPPVamj01s947w8FyVVKa7rNRw5RJYj0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5328
X-purgate-ID: tlsNG-ef75cf/1779706699-21D6FC48-F3F84FAF/0/0
X-purgate-type: clean
X-purgate-size: 537
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:frn1furkan10@gmail.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:stewart.hildebrand@amd.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 91C635C9899
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 01:25:38PM +0300, Furkan Caliskan wrote:
> Commit 6cb4b01c03 ("xen/sched: move schedulers and cpupool coding to
> dedicated directory") moved the scheduler files from xen/common/ to
> xen/common/sched and renamed some of them, but did not update the
> in-file path comments at the top of each file.
> 
> Update the comments to reflect the current file locations.

FWIW, if we have to modify those lines I would just delete them, I
don't think they add anything meaningful to the file.

Thanks, Roger.

