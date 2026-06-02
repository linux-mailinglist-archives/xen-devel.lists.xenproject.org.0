Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M1SBAuHSHmoHVgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:56:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4333562E327
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:56:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=dUI3myyo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1324962.1590467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOer-0000do-7j; Tue, 02 Jun 2026 12:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324962.1590467; Tue, 02 Jun 2026 12:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOer-0000c5-4t; Tue, 02 Jun 2026 12:55:49 +0000
Received: by outflank-mailman (input) for mailman id 1324962;
 Tue, 02 Jun 2026 12:55:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUOep-0000bz-FH
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:55:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOeo-00HIbh-OH
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:55:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ed2d1-bab6-0a2a0a5309dd-0a2a45069d78-6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:55:46 +0200
Received: from [40.107.200.15]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ed2d1-7371-0a2a45060019-286bc80fb526-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:55:46 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6328.namprd03.prod.outlook.com (2603:10b6:a03:395::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 12:54:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 12:54:39 +0000
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
 b=ieDvl+A2lA0ySHKUrgcnmeuyQWPkJlZGflCA1tivgPieDu4lxSv+u6fBjCJomSppzpW7NEBlZE/5Sw17Yend6hmYXaD96IFwN1/0teeML+igV5nkkSxkHkcDb30VsTv97m5BNiIvQmX7XxPFRB++/x+FXJXY6LQdLCzQ3lSjK8j+OYdG2NEu9bA0ER2/gCd72ml20HoizeKPmeabOcO7Zhk/D4r2qrvekX8EGrp2xUoeiIV7dr+qlNHxKpmOoL/GOyGqiIHE1xeiwRB9fht6pM+9FsIDzVrLWiA3B07Z+J1eDos8hVeP91nN0FYSoDIq3zluXB71nIakRM4xldrLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqbwujTX8M/R4DGpzx0GFaWiKG/+grpNJ50K49Rtsxk=;
 b=q8wiF8IC+FWtli9F56cV1nkc2YqsMAqB0A/NRwQAfFSEh11JxxxrCj58T3+oI6UsH8N4sLw8Vt2PkdavhgVerUovt8XWlQ6WMriwK12A/Es3THizwSkHFbovr7sqCHshuT1JH4P2COyo5c4Bt+/gCkSfFdsFoSFwiKMN7UpXHzEq8fdR8pPCDpjnyvj/Z36z1DR9/eEu53EwP1+x8hX7sdzW+M02vUkcmxR5VTvCuoFlrUOgyp1DfycF33mBQ5gFH1jGeRhWWAf+OPRmKWg3hmpnGnVd4MRl1o4bEjpZHLcwBTuEluglEQrBeUO/aUct6A4T+Zxljyl5T8WxPjV36A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqbwujTX8M/R4DGpzx0GFaWiKG/+grpNJ50K49Rtsxk=;
 b=dUI3myyoAKeDZ/KhIS38GNvW00zFJ4Miqg22T/o4b4FxBcxjh35xrxRHqTZp0dd9xFxvO+YBiWj8rEo6vsOAbUrOpuUMNnC4W9A1nhbwx8XpQn+TpbgffSLD4a9SzHvqunGfxm6rCZZvbD/NkDIyNyNdbXtphsVXB8xJ2j/nVww=
Message-ID: <1090e22f-f1bd-43cc-9e8b-cbb6060d805f@citrix.com>
Date: Tue, 2 Jun 2026 13:54:36 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/6] Add SBAT section to the PE binary
To: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio <freddy77@gmail.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-2-frediano.ziglio@cloud.com>
 <e6cd8fdd-97d9-4f07-b952-079c67598f32@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e6cd8fdd-97d9-4f07-b952-079c67598f32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0365.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9b069a-2978-4434-f9ca-08dec0a61bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	nERzny0lFqoU2eaU9Pa9zIu4r9SjLjqASLnMKZFlv+/AW/DGzOF4Upq008F9txkuoc+miUfjLUtxl8KHYRjyu8bnPyR3jN7esPtJ1ayrlxK8bYItsSZjc/CGuFl29TdJKjp55VViC38irk2jaUPL1kpWIblAgSiWKvSGP7FrNdSHaej2r5b08urkdj+IQlO8dt76zUSheQ4Cp9qtHYYpLb+JFr8vY6AM2KTvrhUvJV19n9ojEt2SAiRiEkBv9YJLLr2B0tLtaBbIUWbSstpqmq4ylHdtDUc2/1SfLknByI9lDOCQgVfn/V4JkbsrKDVKEjP6YGAeqtQ99MFfKKywC5IZmsWPNjsd9a0cE+ftey7+GUQs6CC0NiZtSYdSyu9JhqeyLyS94Uuz0JRhdgiWmZEySmCO3NBseajHbCK40O39r84SY+FxL9vJL0TD1SwiPm+tCIcpR5/pHDDUvPzL3v9SG8aJsoneIdnAy/2rlB/FC96iCkfpBqfGO91rmihk69jN0+0RW6gliieBty/zICS70Okd8Xm/8RQIjo9IW48gjDf7L7oBdFMF/rCRIsE+j9oHRDAUNI08bR4CYtK8a7b2n3clTPIejb5dhMKOXRaDcgJAbA2BQ7mjcheODAPEPWB7HJpbYoFME2UgimL84LmeC46h7xH8vFVHNHeqVWq5K5eQ2Yvb0gfMTBqRpbrR4W/ZVlODv1ka5VFBvUHDwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WC93N2lMRm5YdGpaT0Zrb2xqTEZGYVJHamVwam9mcTlCRHJ5eGFDOXMrZGJC?=
 =?utf-8?B?T0FsOHhaaktMcnhhdlkxUllEK0ZoWDNQanIvRXhpL2ljdUJGd29ZZ3RqOHMv?=
 =?utf-8?B?dC9PVnc1d1Fpcm9raktJMWRpdk9uSmZ4UlhVaCtrQ3FQd2RwRGxBRVlyeFZa?=
 =?utf-8?B?UWJ1L2JOUm5oR1FuRTV5YnZBWjU3OENDaHZzTFpQYVVNV0plL3IrUVpNbmRp?=
 =?utf-8?B?SnJqOHh0R1craW1hcXJPNitoVUg0dTU3WkpKUHF6VVpEbkVFeFJoMHQ0djJY?=
 =?utf-8?B?TjNTL1pRVXFIU3dXMWR5NzZ1dDZIV1JFTXRrRHU3RzA4STRyK3Nmdld4SHYz?=
 =?utf-8?B?bnhoQzNYbnEvdUgzRDlJVTRoSk9LUTBCK0N1RGpiREJJRyt5VXoxNnhkSitW?=
 =?utf-8?B?K2ExWGlwT09kUDVST3FBbSswZnhmdXpBaUowNGhTbWZlblBncHpLY2k1UHll?=
 =?utf-8?B?azFkajhQUldSWUcwdGNiTDNqbHFRU05kRURrQlVmZEJieWJpcXZvdDAxNmxZ?=
 =?utf-8?B?ay9aeHZiZWtmdEdmbGtOa0liQnhjK0NKUyswU0RFTnpRdzBNRlJEcWEwaXJr?=
 =?utf-8?B?YjBhcnR5ckNaY1BjUTlSWklzSG5uTUQ5M0xHbkJDdUNEdThXalUxVlhPZDl0?=
 =?utf-8?B?dnFZREhVYXcwM09LQ3pyTzhRWkdYZXZNNmJVcnZHbGMvYjBnZkMycFJac0xk?=
 =?utf-8?B?M2FkaDIyL3Rsc1BsQms5WXpKOUROM1hPOTN1R2cyNHpCNGh6L1lBbDkwejN3?=
 =?utf-8?B?MVF2NjMvL3JZZXZReS9LcEhFSGhMZ3V1WitKZFlydUZOckwyN2hPd3U1V3d1?=
 =?utf-8?B?MVJRYkg3QnZialF6ZUhHREQ5SllQRE9pY3Y1TnNCWU1zL0lFSUhVdGxTa0hU?=
 =?utf-8?B?LzFocHZXaDFEM2ZiQUVzR2R6UU5XTGhDSi9TR1RhWm5IUnBtRU5TT01aQ0Za?=
 =?utf-8?B?YVUyLy9MWkI1RnYwWGUwenhrRjBDKzFsNUkzSFBOSklWS29HQ3J4YnZ1UjBn?=
 =?utf-8?B?VHlMOG0vQTlweTNzRXFTeTVtNEN6SlhUVHp5MU5tNlhUaFFIZkRZRjZ0Wm1I?=
 =?utf-8?B?cXZvTmNpWG1EeGczU0kvNklZMnJGdDdBdTlqa3NvVkl2dFZVclNFd0N6R1A4?=
 =?utf-8?B?c0RmRnE3VkhHcjltU056WlZ0ZjJYVTVEdjlGWjlDRXpOU3hEWGJiclRNRUty?=
 =?utf-8?B?V1c3Y0dySWxkREkza0xCTW5ZOFBjbFRiN29TMGxlSVRsajA4b2w1TWppUGg2?=
 =?utf-8?B?RCs3b2QvSU1rUldjWDZJNFRDYzVkc24xaXB4STFSWGRxUlB4dS8wSEdNWXRn?=
 =?utf-8?B?TCt0SnBaQW84QjdpejdnbTlpdDhCYVdURDFBcUZHU2pCd3Fmc2laaEYyR1d0?=
 =?utf-8?B?U2ZvaHdlV0pKMHhvU1FLNWIrT0NyQjY1T2M4WWFNVFVUV1NDSkpPN0Z5Rjh0?=
 =?utf-8?B?QlRMdkFadXNxcWp4YmpmeEJRa25JYS9sZUkvL2Y4WWJCZmhPeS83bWZlNU9l?=
 =?utf-8?B?S0wxS01NV2k2SFZEZytScmtQWjBlQWhNNVVzMmlHajFRS0dDeUF4TnM5NDlG?=
 =?utf-8?B?OGFJNkxId1FoVDVRaHNDVmM4NnhJb0NxaUo3OUl5YWR6QTA3V3hOaGFOYldw?=
 =?utf-8?B?NWF0U01kY3lsZWx2ckZyWXN5ZmxLVURqd1NjcTdvNVNrbkI4N1NsNnEySTI1?=
 =?utf-8?B?ZVFuREhnaUwxS0NaSFFOS2pwbVlSc3FadlpZYkY1UkdXYnFXckQ0Sk9pRTRJ?=
 =?utf-8?B?YmJjcDVydnJWNERaVTl4QnpDcWY5K2xMdTZxNWlMRnJoWU5UVXQ0a1lBWnNF?=
 =?utf-8?B?VS9qNWxNWmo5NDhyUzZXclpHRVdBb1MzTmpmOHpIdjNrTSttZ1pjV0JpdlB3?=
 =?utf-8?B?NnI2NUw2ODJ2SkFxeWNNN2ZxTlF0UVZpZUNMZTI3c3hGdkJNaWpEbHZiK3Jj?=
 =?utf-8?B?bUNpbFlFc09ldzJUbEpscG10WUJrVTZ0RkNmcExHeGsxS0FEd3NVMkdKQTVy?=
 =?utf-8?B?c0ZSK0dMNkltaDBQS2tsZzBxWHdqWXN4KzFiWXcyWjE5a3BqODdVN1ZWVG1V?=
 =?utf-8?B?NUtHb0dUcEdXbzFSMlRJWHBnVW0ySkZ4bEZicmNIeGNmNVNab1hpQUducElo?=
 =?utf-8?B?dkNEK3RBZ28vN1ROblVTNExUMlFLQkE5cDdaemwrMUdiN1hVOWR1SXRmWmJi?=
 =?utf-8?B?d0hKalJkbzdTVC9nYU52M1k2UU9nNmJraDFrYlNraW90UFBaZ0lOQnRlT2Vi?=
 =?utf-8?B?Tmt2ZUNtcmJOY0FhOHBNeUEzaVVJRlRxVWg1ZVlEV0w4TGNjVDNVOURBT2pk?=
 =?utf-8?B?U2xDSjFzWXpqTEJyeGdqMHNWejhOMytRaGd6ZXZ3TTdQdWpTMVRtR01ncFdp?=
 =?utf-8?Q?4RJoKIbvMiZblWj4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9b069a-2978-4434-f9ca-08dec0a61bbd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 12:54:39.6466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFkBkE9TFkRyiZlp2l/AFa18RnruL8ueiKbTdyKWWlV3q4GN2LLy5t5GpdIgPcSMFM7hnIySXE34RO/kiW9o0u1WB1EO9f0U/U7i2fzw7/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6328
X-purgate-ID: tlsNG-16d1c6/1780404946-8757ED75-22F3CFA0/0/0
X-purgate-type: clean
X-purgate-size: 2795
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:gerald.elder-vass@cloud.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@cloud.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[suse.com,gmail.com];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:email,citrix.com:mid,citrix.com:from_mime,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4333562E327

On 02/06/2026 1:06 pm, Jan Beulich wrote:
> On 29.05.2026 17:35, Frediano Ziglio wrote:
>> From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
>>
>> The SBAT section provides a way for the binary to declare a generation
>> id for its upstream source and any vendor changes applied. A compatible
>> loader can then revoke vulnerable binaries by generation, using the
>> binary's declared generation id(s) to determine if it is safe to load.
>>
>> More information about SBAT is available here:
>> https://github.com/rhboot/shim/blob/main/SBAT.md
>>
>> Populate the SBAT section in the Xen binary by using the information
>> in xen/arch/x86/sbat.csv.
>>
>> On XenServer, the version and release fields are populated by the spec
>> file during the build process.
>>
>> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>> ---
>>  xen/arch/x86/Makefile     | 4 ++++
>>  xen/arch/x86/xen.lds.S    | 2 ++
>>  xen/include/xen/xen.lds.h | 3 ++-
>>  3 files changed, 8 insertions(+), 1 deletion(-)
> This gives the impression of being an entirely new patch, when really the
> (standalone) patch was already at v4, and my comment there wasn't addressed
> (perhaps merely by extending the description some). It also feels like there
> were other pending comments, or else why would this not have gone in long
> ago?

The content of the SBAT table is still pending the security document,
and in particular the decision over whether upstream Xen maintains a
global revision or not.

Although the global revision could be appended later.

>  Additionally, ...
>
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -71,6 +71,7 @@ obj-$(CONFIG_TBOOT) += tboot.o
>>  obj-y += hpet.o
>>  obj-$(CONFIG_VM_EVENT) += vm_event.o
>>  obj-y += xstate.o
>> +obj-y += sbat_data.o
> ... like elsewhere: New files' names should prefer dashes over underscores.
> Question of course is why this isn't simply sbat.o in the first place.

Also sorted.

>
>> @@ -275,6 +276,9 @@ $(obj)/efi.lds: AFLAGS-y += -DEFI
>>  $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
>>  	$(call if_changed_dep,cpp_lds_S)
>>  
>> +$(obj)/sbat_data.o: $(src)/sbat.csv
>> +	$(OBJCOPY) -I binary -O elf64-x86-64 --rename-section .data=.sbat,readonly,data,contents --add-section .note.GNU-stack=/dev/null $(srcdir)/sbat.csv $@
> That'll be an SHT_PROGBITS .note.GNU-stack, won't it? When it really wants to
> be SHT_NOTE at least for bleeding edge GNU binutils (see relatively recent
> changes there).

That was my addition to prevent there being a warning about RWX stacks
cascade all the way up the build.

Maybe a better option is to have sbat.S with an .incbin sbat.csv ?

~Andrew

