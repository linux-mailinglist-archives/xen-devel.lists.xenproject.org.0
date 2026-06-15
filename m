Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kmG6Nw1QMGobRQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 21:18:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305DD689683
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 21:18:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=ZIbfg5lZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338526.1599561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZCoY-0008BD-MB; Mon, 15 Jun 2026 19:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338526.1599561; Mon, 15 Jun 2026 19:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZCoY-00088V-J5; Mon, 15 Jun 2026 19:17:42 +0000
Received: by outflank-mailman (input) for mailman id 1338526;
 Mon, 15 Jun 2026 19:17:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZCoX-00088P-Qc
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 19:17:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZCoV-001jJQ-3K
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 21:17:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a304f86-5cb7-0a2a0a5109dd-0a2a450cbaf8-36
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 21:17:39 +0200
Received: from [52.101.53.36]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a304fd1-62f1-0a2a450c0019-34653524f828-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 21:17:38 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH3PR03MB7344.namprd03.prod.outlook.com (2603:10b6:610:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 19:17:36 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 19:17:36 +0000
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
 b=fzl7QNj4Yb8wEjShLT5DgdA1p7+vRcXi0szg7E3szmcXzrkehpEG0J+HDDjHsns+Hs8UNxV88NtlafENF5JTo5AjIYO6lgBBNjl4OXoxh8bvxoWbKWMrWYF8Whg0mV3EzldX1roRFnSigNDJF4eziloMKMeF8/gFforpV/xXXbp1J4ZMONHGavHrcxCR3tAMNBKALifElXnMKOOgbk1Whip5icBfUoAigoagCh5FaWOxQ1E5f/MazHTbjhqdrs+DBzGOO7wvMA9ddbUsEYTSTwwD2AWfMjPKD71ymt1Rgyz+QWSYf2d5B5ekLoENyd+4r+rd3OWLIitXjK6wg9t+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTGX1K6vuvY9CuOVd9AMvsVJoCCn9HzNjeI6FWxJaF4=;
 b=psuiKTbKHUViM4Xms9uwZVg/F9yWDZTX7VO7dXNE9xr/ROBHOI+W9pSqRqEpauzojKiiGunURM6l4hBpA/7hNVcpWe+S54ov7URS7MFhLXsQxj1t6zKJ9KbwS4+aw8B5KZe/+xsW4nf1SSbGM14AF6WnrCWsw3WcjFivk5cxxM5wEIRzuIaos3GM8EKQuiHrGPs9FLpzQCNbhCj9fteo8L7tvGqQse0CggT05DV7MS8tnnjjyWdfLOzTvBBK1DjzrHAI8qbb8zVtFcxzk/2pvF5KdUvp6v2STeFGlheSx+QqHTa2aWFO430/nwzChnae8sBDWlB0Z1eakCUkFlLGRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTGX1K6vuvY9CuOVd9AMvsVJoCCn9HzNjeI6FWxJaF4=;
 b=ZIbfg5lZF/N4rAcFobVTCcjJr1VhgYvAesN24bu702nB936BDF+pEvriWbhpDUwedCOk2DTJq9hKj/6ypN2AhQnZAESWtVBl8uCMZATFduB4J++GEzG6olsNcDpIxFGFgWXxVU8u6dBjmba6tIuVGHaNlpE7VcMU5rNSCn9SuMI=
Date: Mon, 15 Jun 2026 21:17:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Cody Zuschlag <cody.zuschlag@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4] docs/process: document AI-assisted patch tags
Message-ID: <ajBPzKlWJAePD7rW@macbook.local>
References: <20260615184348.7804-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615184348.7804-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR1P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH3PR03MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d4e5ec-cf13-4103-ab28-08decb12c229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|6133799003|3023799007|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZolL9Kxdju7w5GTCS4eE3DahcNV/qQMZNNwnLT77gBVXTOZDYjyNBT5wshQJgXJy8NCDUCsE/UZcA7VCAwJ+sZSCiGIuTnacIWBtyCNuu2S5kf39QRJsXVe5IMO0OWtzqCQy17EVuCS6KkCvPHQwn1ns9M5mg/UPVTZSosynHiuOQbnZv9jPpVeMjw58VgWz0HARQh/tcVraszWfxjy/pANoo43U9QRWAuhT+iBh5unp1Lhs1IKOiov3P6CxpPBBm7fJUQZJlnICaRqoUA6KPLdZePVOIIbvvYHl6/gt3Dsihf4Sq954JNtJsta3QdAXMRNiVRcCaxLDcivm8ktLX8f4fdGzSDXcQyk5HTwEEL6FF6dSvBjQE6ea7JcvED58YH41E8o4iMovMLAaYpfdZT3/Eic7nJn4F0N7z8RNY65GoxB1nTJNp6d4mgxzaCrG/gc73sKvKn5Rh/Hu0IYh6jKb6ukxf7jSl60EaX7h00Bi6Rbjt9UgT0IqjI80XPUKnUy90MMhKsOqXYrCEnCf4SB9b4noHdfRQnydKJlIGTaBRkpwHWmb+tr0ZZU1IRMiNK/viuku5xqJaIyULwLH+Cu/tCOxvdSjTwa0MVlIt8mkURJwl9LJlYmnaCrUR4zB+Z6RJBqrIOCHSO4+cQ9DO+BXojqHWNz/ays4Hneic3g+zBG8G9v6bXLv00qXh3LQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(3023799007)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmVBdzR1eW9Wd1dyYnVDWkpBMVZ0RW0rRnUySTIzaU1aV1NkNXdTUGpKM0ZG?=
 =?utf-8?B?cFQ2VGVzeEVhRE0wVnpPMWU2QjRZVWIrRWxaSysydHVwb3JzR1ArWVNlOW5p?=
 =?utf-8?B?b0d2VDEzdlE4bVRhUnZOMnVSL1NORWR4YTQ0NkkwWEN4Y0d5Q3FGRXBIakVT?=
 =?utf-8?B?VS9BK01OSUVBYkxXbE82dmZKSlp1SDducnJHbmltaEQrTktkcVRnQVE4dDFQ?=
 =?utf-8?B?OStoSnZ3UjJDYzNPQTFwNlZDTGV6Y1k3QVl4N0wrNlJzNzB6ZU1nL1BDUHhD?=
 =?utf-8?B?R3I2a2lRREdIeDVPN0hSUk9yRDNEU0hEekV5TzFOcDVKMnZPc1Y5d0phYXk2?=
 =?utf-8?B?YXpkN3FUaDNMTmVqQldGd25GRkZBTnYrWmViZ0Zld3cyYmxQZi9JWEU5QVRF?=
 =?utf-8?B?b0hIc3I1SDdaeXF6S2E4Q2NZWnRJT0dLdXNVb3VGMHFwQ2ZydkozWFNTTDJj?=
 =?utf-8?B?amVMc0F4VDZCSjBNY1NqQWRxSG16RWt0MU91b1pHeUp6NkNyV0pJdlN1Zzhp?=
 =?utf-8?B?dFhNMXM2VXRXc2ZJNlNhVFN0VlJaaExaVDJzVy9EeXhKZWZZYlg5cXNLUzM0?=
 =?utf-8?B?SjBxNzQxSko0dDJEUy9JUHJ4d0lTWmJhQlVncmhCSmlwa1N1K01ZQ0tGK05h?=
 =?utf-8?B?UlhvY1ZwaXVoSGJxVldEazAzRXZwSXdwZzBwcU9iZUNjU3FhNVNjektISDhQ?=
 =?utf-8?B?SVRPNytDK1dHWE9vSWhKK3pNY0luRVAyUG1GMEJ4OHBxTFhNUVlQVDlhTjRJ?=
 =?utf-8?B?dVRsRmlOcDIvM1ZjSnBKMngrS3BnNXZrdktvVWw3SlRlQTExU0FuMTRVcmY5?=
 =?utf-8?B?dXEwMHdSM1dDL1lrK3I3SmhTZVVwY3pRT2w0bUtWbnpGSkRVRVZwT051akhx?=
 =?utf-8?B?WmRiYTlGWklJTmdiTVRCeEZBaUg0SnRqOXlWMGhBemhZNXRXSDdWL2ZWb0V4?=
 =?utf-8?B?YmlaRnduazgxNlcrM2VpdzlLdFhoN3A0WDVNSmw2c2VkejR1Zm1MYlFRaXFI?=
 =?utf-8?B?aTBVRnRlUVlLc1JGbDFvOHlsdTF4T2U5SG83SnRHN1lMd2xFRXRWckdUWjZX?=
 =?utf-8?B?ckFRRlFxL3FhTUVDSE02WW03a1hFL1h5OGkybWZoTk1kZmpDSjRBeVA5QXYz?=
 =?utf-8?B?MVp0WkY3Z0RhRlUzeDRZb280TDJlWVdZL1B5Y1NjZ20zMmcwY0tRVHBXK0d1?=
 =?utf-8?B?VEM3dlFvQXYxZjVXdEhwdDNpU0dmWDgxV09HMFgzRW0yOXo5b2RMNU1JNCs0?=
 =?utf-8?B?RFF4ZzRFYVZCK2tzTnNyU1lzTEdvQXVPdzlNeVlkbUk5dnJxMkRzaHc1UkpB?=
 =?utf-8?B?SWhGazRZVnV4TEJraE9VQVJwTitpMFE4M3BtNTFBQXpQZnRMRGVRbFArWWRN?=
 =?utf-8?B?NWptMGpuRXBqNDhiWU43ZzdNK080VnEyTVNwME95QmNnUTZVaFNOUDd4ZnVt?=
 =?utf-8?B?VFFtLy9UMUlKNkR0L2ZLL1NDMFJxMjY5WjQ5TUptNmRhWTF5LzFEWlIxSUJL?=
 =?utf-8?B?TWtjeFpoRk5iOER4TEIxTE9INHB6R0o0bng1bDVUd0EwKytJOTBEcU00ZW5w?=
 =?utf-8?B?anN1WEorWWRlMDRSRjFRTWl0Q21EWWwzN29EZ0JDcldTc3FkSVN0MUVTZVM0?=
 =?utf-8?B?N1p4cnpDZmxjQzc5T2NZL1RFdkcyVklGV1pwSXdyelZTaWN6aGFSakIrTk5z?=
 =?utf-8?B?VFpPb2ZxT1pHY3I0emREOHJFQUhKc0ZHUTMrR3pCZUN4VHhKWnJUaXN2Rjc2?=
 =?utf-8?B?QUVHYnlURitteE9QdE8zZ21mUTBuNmNLcG9HZ2pMQTE5cmY4M0U0OGNjN2x4?=
 =?utf-8?B?eXFJQ0dIZG9PUnFWaFdKZ2pQYldWUkozT005Q3huTmVTMzk5Z1RacG84M04z?=
 =?utf-8?B?UHBCRWtpbkxjYS9kSUVzbDMxeCtqeUEyWGg0aU5RaDlkUnNzQUxaamJNYzF2?=
 =?utf-8?B?Nk55ekhVVDF6UGZ6S2lJRnQwTjNONFhmOEFucFBSU043akZWVEs2TlJER0Zn?=
 =?utf-8?B?azBjMDVnZ1RiNjMwc05WVFkzeTdha1VpSnMwV1lHWW1pMTdoMVMxMUY5Z0hk?=
 =?utf-8?B?MlVYbTdOZXp3Q2F3cXozLzlpcHpvWi9EdFFaSE1wS2d4VkJ5bUJYVXZwUHE2?=
 =?utf-8?B?cFRpbE15blBaWTM3S2Ztc2w2ME16Vkhxd3BQU0c1TW9uaE0wdEpnakRtZ2Vp?=
 =?utf-8?B?NEkrWmhLeUl0UGZiYzluQW5OVjlUaUYvaFgrdTVHL2ZJQTgyaGFOOUk4ZmpT?=
 =?utf-8?B?WVljZ0RhWk9YSnpKcFU1QTljajdUOW5Ca25MclNNN1pweHhDa3hkYTdTYTU3?=
 =?utf-8?B?Zy83ckUrZlFINEJIOGxJNytyWUlTcC9RMnR0dll3Z3ZGWkFKRy9jUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d4e5ec-cf13-4103-ab28-08decb12c229
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 19:17:36.2060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33J32VAVx0cTjex8PwGQVBwB7VmEoKfaXE0LC2IPfHIgmq6mRYk4N77S8W0mUWE+LDn07ew3F38DFAkv+9s7XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7344
X-purgate-ID: tlsNG-d25034/1781551059-DBD7BCF5-55F0D674/0/0
X-purgate-type: clean
X-purgate-size: 828
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:cody.zuschlag@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:codyzuschlag@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 305DD689683

On Mon, Jun 15, 2026 at 07:43:48PM +0100, Andrew Cooper wrote:
> From: Cody Zuschlag <cody.zuschlag@gmail.com>
> 
> Add documentation for the Assisted-by tag to clarify how
> AI-assisted tooling may be disclosed in Xen patches.
> 
> The guidance follows the Linux kernel documentation.
> 
> Assisted-by: ChatGPT:gpt-5.5

Really, seeing how it managed to mangle an otherwise extremely simple
patch to the point that required manual fixup to apply I would
consider removing this Assisted-by.

The wording is verbatim from Linux, and Andrew is the one that has
adjusted the chunks plus removed the inapplicable references.

> Signed-off-by: Cody Zuschlag <cody.zuschlag@gmail.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Regards, Roger.

