Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDj1BgOVFWpSWgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2BE5D5B2A
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319820.1587260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr5Z-0004TW-Dm; Tue, 26 May 2026 12:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319820.1587260; Tue, 26 May 2026 12:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr5Z-0004Re-AF; Tue, 26 May 2026 12:40:53 +0000
Received: by outflank-mailman (input) for mailman id 1319820;
 Tue, 26 May 2026 12:40:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wRr5Y-0004RY-2F
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 12:40:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRr5X-00Gc6x-EV
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:40:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594c7-2eae-0a2a0a5409dd-0a2a450c84d0-30
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:40:51 +0200
Received: from [52.101.52.70]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594d1-62f1-0a2a450c0019-3465344673a1-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:40:50 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5048.namprd03.prod.outlook.com (2603:10b6:a03:1e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Tue, 26 May
 2026 12:40:47 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 12:40:47 +0000
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
 b=QOiudPUNLfNUpt5e/GLFW1B2+Tjahv0loJ6H+YXRoZT1Obsokf82wLS7WdbrmcYRMig495lBBxCHHasEh7kD+b554n3/63+fLe7Y+7QGkL7Rdn4qq3N9nPDfVsTBA0l9lDvt7quI2S6g/2WlnekEdLWt/fYI7cqtm3zeOcMz20DFw/Pwj2zKIghMLjsOgIe4tibFVvf6/N7hbSn1NJv7jasC3EeCvzBBwJ083oGGyne1cp68jPlUQ44urcGkQBbsd2iTvmrzw9pi42Xx60KE9+2rVZB72uhbpYCJMNyRVKBdE85jaq7ralvZmstWK9brYNqt+KuTNV4M1iooU5a5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LPpL8qm2CaoHD5JAAOiCS/z70Zutal8qNBgrsnr45I=;
 b=nil6T4ybLTVRZzSE6jMr+amqJIvbjDQF/KM4hA8S1WxBSx62fflHZGABcVRSrVCriFOU9HRer7/HsQm3TdIxb1tOdr+3ng4QeR78m3Gay5U2lfVT/dMhfDgsL/85WqdAWmd5KJh4PQmfssh0EhXsish9qvuizZcr3s+Iw5r6hbcw//rkWVCr9SyXNBlkwQNht9M6e6S4xi9MX4tbZHDaQQf1/H9ccP9mikb4RHi7E3BZf4JKFj11CerCSWHiuxO54ELajXlM+nTZhOpeqdmwVLprqAppB/6vm708+k4q1fQKCW/rP9c6Dxm9l6D0YWni72vdFQB7Ok6hPgOvftGrOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LPpL8qm2CaoHD5JAAOiCS/z70Zutal8qNBgrsnr45I=;
 b=qz9FliWhiXLK4VqJ7JPCDiVWmg8p5bRNb4Xn0kDEuqFkONTbwp1x6uLYWJtL/GAb9XZB0A3/eGpgkLeQyjIanNVqW/pDh6AV2TXXXF4tc7vy1UKQePDm5Vik6xgQ1h6q14QDqzs3sj/xe9pSlNQlsCSCmbPJLPu1XLJ54FSLsp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v1 0/6] nestedsvm: Misc fixes
Date: Tue, 26 May 2026 13:40:21 +0100
Message-ID: <20260526124027.573412-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0049.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::27) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: bf051d13-2888-4b55-9f5a-08debb2402d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|5023799004|11063799006|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XT/DcSBxzVVVHQE1dLkT6K3OqYGwKpfk1hyozTVzb9sEhXx3jT01DNcLmJ+H85p6IDqTBoqQkvTo/1lWae9whl5f6nFvkFpJHhMXPqGGBMISeMNGOK/QEZ1q+Z7NDUa5GQk3ZSZYsl5Nkn9rVy3eMd6OxnCSvflQNbMRcI3yk606Kkz2aLhCJhrsQaD6nMA01/T94gPriRQA0yiEyU5WVr/TFbLjtmDYnMK4c6yLTS2uMfro/JudnepnCFvgdxR6nqTckOTyiS14QnM6Dfc5xUiltSs9B1qPe9/NrstbExMUU83EmiPE9wLqKi3+zA+iZkTqeRzNeekq2xp/LMAD5I5uc4HWxZEQkeKAaJ1ORBD7M73hIr/8NTKyL0VUG3BAT/HnWCrAaO/CZ5kNsOb6Jg5/P6hYcAciSxPJnrNSwmdYA354Jy+T4a/bSPpirH9BkBsM+Aw5yIHZXVe704TGD6kBXDh5D45MhjqC9k3gVdoG4GaCwqvwqNMws3WbLa0zI44yJekQPvN6jYboqhxomXrXjiRTar5XEMiGtQ0+exEA07ZqBxouij3qa97jMX0N8FkK45Ml++IqZIv3R0uioASXhOgKoT2l4q8RFudg8rlS1ac9Ee4z5NpzFCMukzdp5uSvMPDBa9JT6/FS7U/6p6CLq7B1YDf+TeLCzAHbNolnR0mR19mQjr1MSLiersUh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(5023799004)(11063799006)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Btm985LDyge8l8W2tdUbYyehn/hHO5v7A29hpdhEP3aPqPJynexzJ3Ug8geu?=
 =?us-ascii?Q?63lcwQDxKypW/mcaM4LslzT65pB3OiAwWZjSPitU8+Oz1yDcL+TAKfHhU5p2?=
 =?us-ascii?Q?RDzm1yXmAPAmyZ6ofMKJ8NrK3pr5FfpDxKU9bf9zQc7P35HEBvIIH96wTrzG?=
 =?us-ascii?Q?AgfGwKt777r0Ov7119A2GEdZd1a54NpcQdK0I2DUQpjq1xhKeyJ4MQ3DjBtM?=
 =?us-ascii?Q?QW5ufPtHexVKLOusBknrTbEVpPUrN5ygp+EycmoOLBB8ydxUJkmXZaHN/75t?=
 =?us-ascii?Q?sO1pCT2aAnMRoCDXDBjykcc2c/sfNrf+HKHXqYm6Li89vrtfWgw/Kl7C8Hfl?=
 =?us-ascii?Q?HNN3Mi8Ih52sMjtHq+qlxi2wvze89R0j9p9pskpREy4xXUClG4YB/1i8MPQf?=
 =?us-ascii?Q?KcMAard94F7uOezAZFfSayMUsae6YN20svfcNSj6REF2Xnmpg/IE8nr8ucSY?=
 =?us-ascii?Q?tFgmR0KKEfgfMkol838cCYYiQE7e3ApKU2UCwWQfaTzqBSiWv4Nu3365X1uj?=
 =?us-ascii?Q?w8D2le8QLKqhVcqLr6EexGL1hrv5kAe52qgd9iNcN5hdn8S4NTIjzdFk7LRN?=
 =?us-ascii?Q?EO/Tlw0GOaMA/hCxxR0UrAaf3uwM9jN2/8mZDDdCxqOrVHlTRee+yU/GxL/O?=
 =?us-ascii?Q?GSCbcp9d90x+uped3FOsryAhSNvvlrogeW+78WTcquR66DJZZjVlHKECo04J?=
 =?us-ascii?Q?wApQvio83Wq1OzAIhi7TekY9asXbVQVUdQDach+fhGybGA/IxwcX+EO8ujeD?=
 =?us-ascii?Q?roxnyFC+m5tnLj5O8dSrJmWsz2cMtubgj/jtZBnhKuy6HntX9P39I6HkXUaY?=
 =?us-ascii?Q?fmnyngldIE+fupj28+hMNaNMIqoYiraJeR3gtLQKq2Cd0gGUxLkXDLiK0GLR?=
 =?us-ascii?Q?c7q8bheGzD141i+Prxb1sPYZlo1YLEJhJmuXBQFLdVv7ezzIQWnEw/Tx/JIr?=
 =?us-ascii?Q?U95F8Ta1CUTI1glHydEkqttiaX2v4xT57ddA/c7FWch+p35GW/+7iM0a00xW?=
 =?us-ascii?Q?wwDHFWbK4tBOWb12yEXJQntVvx074+VsoTardGG5sW8ek2Tw0GX5ZO9tekVK?=
 =?us-ascii?Q?CJXbsXkd9E3yDM3eI4o6luVQBThPt2aryqEWjEPTaief+w7jpyoARAachOjZ?=
 =?us-ascii?Q?eBFlcIulciuDgpBnmObYKaRcQ6UAnjcmCsRn+aV19QHWElsd2Z5A0zvGQ0it?=
 =?us-ascii?Q?65NBOpTsvxBh6QgLiY2nmbeyBvda7GzoitKHLpgK9XjHhAIz/fzi6TqROfDC?=
 =?us-ascii?Q?mPJHX7RgVUGl0p+jROiMinY/DLirkM/mKfKFHU55A4S8psn73Bz+staoZ7qi?=
 =?us-ascii?Q?Gm0bhmPGiOqAAcyPcbkzHKoS5gBJ++6aquP32WZT0/U2Kec0yC/UO6nqdRV4?=
 =?us-ascii?Q?lYKnRxbP++R5G6jasTIxCXe07WDpLtnorqSFw3RrhR6ZVx/PDHJ1UXUzN+bZ?=
 =?us-ascii?Q?eWifgdUC6KzZROh6n2KBb2QURSM5fa58CM1UqjE480aJekfBI57Eygex0Nyb?=
 =?us-ascii?Q?//9xoqhUVQvS9wwTkaTlQ0DiUwKw4Zgs3Isydkbf6MsjIke2v5C7nkerkevc?=
 =?us-ascii?Q?y4irqDL4xCF6NkahEOBO9q2+u1Lesih/QDE29GKNx59pBMsSSibdS1VXDEbT?=
 =?us-ascii?Q?LYkDtmtobmS9wD7jAUkqHuy7ndINIKdO3wNMpNlhBjhUrg8cUsdHS3GCC6wm?=
 =?us-ascii?Q?Ka8mEnCz2iwZBfs/wM2LcwtI744eb1raEfkjMRgLtmStVkYXVpBzBsgG6f2C?=
 =?us-ascii?Q?VYvyE2BC7WrClE8wglJvS+woBCmneXc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf051d13-2888-4b55-9f5a-08debb2402d1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:40:47.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3J+GGBtVi79NLja9D/oXx3Yrg7IjmKFGyqj1BeYwcWW12G3Ou3fhzM4qdlio5zkjN6Vi7Rb9v2MfywUn77YrLyOwfrWatSu/46RqG07zrMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048
X-purgate-ID: tlsNG-d25034/1779799251-E3F7ACF5-3D774158/0/0
X-purgate-type: clean
X-purgate-size: 1096
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BC2BE5D5B2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Before this series, running Linux on Xen on Xen on a modern AMD
processor would lock up L1 shortly after L2 reached the bootloader.
Furthermore, L1's domain could not be destroyed.

After this series, repeating the same results in L2 crashing shortly
after it reaches the Linux kernel but L1 survives and its domain can be
properly destroyed. This is not great but is at least some small amount
of progress.

Thanks,
Ross

Ross Lagerwall (6):
  nestedsvm: Fix CR3 MBZ check
  nestedsvm: Adjust L2's DR intercept when adjusting L1
  nestedsvm: Use the correct VMCB for vGIF
  nestedsvm: Set GIF during VMRUN if vGIF is enabled
  nestedsvm: Fix deferred event injection
  nestedsvm: Allow destroying the domain fully

 xen/arch/x86/hvm/svm/intr.c      |  4 +--
 xen/arch/x86/hvm/svm/nestedhvm.h |  1 +
 xen/arch/x86/hvm/svm/nestedsvm.c | 60 ++++++++++++++++++++++++--------
 xen/arch/x86/hvm/svm/svm.c       |  3 ++
 xen/arch/x86/hvm/svm/svm.h       |  3 ++
 xen/arch/x86/hvm/svm/vmcb.c      |  6 ++--
 6 files changed, 57 insertions(+), 20 deletions(-)

-- 
2.53.0


