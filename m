Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469C2B0C142
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 12:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051348.1419674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnk9-0008G3-2G; Mon, 21 Jul 2025 10:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051348.1419674; Mon, 21 Jul 2025 10:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnk8-0008Cw-Vp; Mon, 21 Jul 2025 10:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1051348;
 Mon, 21 Jul 2025 10:27:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y+kr=2C=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1udnk6-0008Cq-QX
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 10:27:35 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5041ca9d-661d-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 12:27:33 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PA1PR03MB10795.eurprd03.prod.outlook.com (2603:10a6:102:487::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 10:27:31 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 10:27:31 +0000
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
X-Inumbo-ID: 5041ca9d-661d-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ds5NW0Hed9G7+deHxU/Es9ODFCmvBoVz5LelYe1a0I7eTlVEp0NwLOkzPoik6cPKUeSb4iHGYlwBl7jvf+l/BcWVrTtxvd6ylD1pFLeWe6+8U00f+o9y6FYqu4/7YgUuOao3cSAclODE801IR164Ys1wkR51YnuUEHv2WzvqqIVKPd+jxd7LtwPaQA9VvMVEt8FW25h7XNY/LbPeoowbXe34HTsd6hWFP7Df/RYlT3xEKMeAu/6LrKOkboEYeukuer8EC42VUE/iiXjecfyIpxHTSAdwvYX3nT+Q/2niOHu8viZnpeAEt04Bu3Z3glNMihoc6nNl0xwfYkIQH/CjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4Fdz6hUCMTKh8odlSfCSuXDyJaPS5D6Qt6YnJwIdV0=;
 b=mihO5VBA+jeMRUnds0Lv6OQ0u61JUj/tz6fr881vp4rW+twY/R1T01rM/KlOoxR8EZlevxqfx8XFGsdZODb+sFUa9sr5T33r0K/eswuV4Hu6Ql7LV9FReG6tqLmb18zQCmPcfFUJazodh0tJN+t6z0Ci1csCyZHL5aVIkUZYUSVOo+Jbzrm6E2musRs3FY/HxvenD8wiYbTVa3+DHyLoKusoxhy2g6yQhvDUS9a7yizG5zargLNI61kLd/6KFy6xAPLgjigelH7fL+Gz0xXddAnVYZnTL809PZzOU5l879WFl9cQfUPuneTTwA85DK/vbxvJ61UZ7sRJ1N+Mh8zfvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4Fdz6hUCMTKh8odlSfCSuXDyJaPS5D6Qt6YnJwIdV0=;
 b=tt7jmFVRFOZSRcETDvxizZ/vd3tGyW8w7ZhJyYR+MesdAimbkLY6pxM8lTucvpNwhRHuR3pw1R2feFo9xbmJEke/B0eV/8ZQ5cMFtAZ44ljTUhEcOWQqvZPlnRPj3dwKOF3pYEJbp474OYhq10SbsbgYPtaDKUZ1LyaKvk1XfQtm8P6zs/0GdcnZR39QqxZP228pRz1F8BWpX2cfQbWh/fDdaNfWvHxmyWIrFCyY6/o5GDc4RmplNTMll/gmUrnHxyck1+k7sACST5BMhPvcKlnYgzZJaVcfUwHQVGWvn9dMop5Rp88FjNL517vizge+zRo0AsogsNfv0U6DqevmlA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH] misra: add deviations of MISRA C Rule 5.5
Thread-Topic: [PATCH] misra: add deviations of MISRA C Rule 5.5
Thread-Index: AQHb9nyfKWuy2uMkq0ebdJsomrMUprQ8ZyYA
Date: Mon, 21 Jul 2025 10:27:31 +0000
Message-ID: <69b7ea65-c69a-4184-b4d1-0664282ab849@epam.com>
References:
 <7e1c381d6fab6d38bb2a5484d5fac5e863ba135f.1752689112.git.dmytro_prokopchuk1@epam.com>
In-Reply-To:
 <7e1c381d6fab6d38bb2a5484d5fac5e863ba135f.1752689112.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PA1PR03MB10795:EE_
x-ms-office365-filtering-correlation-id: f632cd9a-fad0-49d8-0c1e-08ddc8413331
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q1BGY1QvZUdweXZpK0hlQmdqbVVvOCt5aktaY0ttdFRWdzh3UXptcVVkV011?=
 =?utf-8?B?L2RRaFk5N1dDZHpCdG0ySU94WXA1cDhiZkd3OWFCRlBucFdsN3h2RUorUCtP?=
 =?utf-8?B?N09qUVVOUVZRSGtKWHJMbklIYzdUMmphMkR4S3F5b2JNZ1c3bTd0NEZGaWJQ?=
 =?utf-8?B?ZndLQThmamFFYWx5dEV5ZVJtVUxlakIyZTd4anZ1ZnJleWt5bnFESFhkdzZO?=
 =?utf-8?B?OUxySGxSYldGemhnODl3Qkp0ckxSa1VtTTlXcmNmZnlHVTltbGVUSzcyT0hL?=
 =?utf-8?B?VUhObHF1b2xxRVJtclhhR2pLLzZmZUxNb0t1VGpsaEh5SHdrVjRnaTBmUFVE?=
 =?utf-8?B?TUgwYVdzUUhBbytGZjJmUVcwQWFvTnIydzZsYk9GaytQNitVK1UvK3N5bi95?=
 =?utf-8?B?NW0yU3NtKzVzMDRPbmJMbWlMN05GYVI3SVYrUll1WlFrT3J4OVBaaUlrODM5?=
 =?utf-8?B?TDFKbWdPVU1KdEUrT3U3cE9CVTByQVhBQmJTR3VCcmNiVGtTdDlWakZVcGU3?=
 =?utf-8?B?ODg3MkJ1NFlUTUNaeHVTUnYzckxLWk9HMHMyZGpORmlXNUs4YUt2S0I3WGF4?=
 =?utf-8?B?RVc1QVRjSDNUVjkzWDM0aTFERWVldnhsMVhCM0xpQ2ZrRDI4b2hqTEQ5ZFQ0?=
 =?utf-8?B?SEdVK29pV25xOHpYZUZBZk0vUHNKTXM4Q016dERJMzdmaklRN3M5VnhCUGRZ?=
 =?utf-8?B?VERsWmJiMkNtNTJlU2VuWitmQlpQTEJsMFZPS3UxL01NVVpNMUV5T0RsaWUw?=
 =?utf-8?B?WXp5dHRsRFNKcUdkN3k2cDJvMmdycUtwWnp3anlCY2k2WEsrRmRISWtpWkpP?=
 =?utf-8?B?eGtDNEZnQmVHUU95VU0zOG5aOEg1WUFKSnd2NUhaUDZRMEFoN2hiMjVpZytl?=
 =?utf-8?B?c01VVFdvRlFXUEw4S25lRGk0STRCellPQnJMN013SXBnR3M2R0tyYTFza0N1?=
 =?utf-8?B?bi8vNmg3eE5SVzNEUFp2UGFvQmtOekF1KzNURm5xNlNsdm11Y2J5K2VoekNq?=
 =?utf-8?B?c2Myc05TelhPamVVK0ltY2ZZWGxYRnlFMHA1SUVTSGgzQkM3OWd5NlNseEty?=
 =?utf-8?B?NEZLVnczMmRtMjRaYk9JeGgxRmZNR0ZDQWM2Q2FWRkh4QW42aUx5RFdoaTlj?=
 =?utf-8?B?WUFWbFdlRmFybG9ybWVJK3ZaSXJuaG0xREVGSGl2d1hHSWpKTHVyZVpvNG9a?=
 =?utf-8?B?b2ZXWk5VRHZUMThmblhaMjBwNU5GVzdqVVRQZnVnQTQ2bElJeWFBM2x0VHpX?=
 =?utf-8?B?NXlpQzJ4OHlEcmlRc1BINWRIOXBDZ3NVaDZzckVMRVNodFZ4bE9haVp5NnVW?=
 =?utf-8?B?M1J1WllzLy9wWFJVMVBQb0E4Y2NzWTN6RzlTUEhIcGhyMEdjblV3TFZXVGxR?=
 =?utf-8?B?MzdDcTN3Nlpqbm1ZZnBKRWQxUlJWbVVRcGRoRFRJZTFpV3pxYXUrQUIxckw5?=
 =?utf-8?B?eEhyRzNiZnRBS2ttTHJwV2puVUR3Zm85M2J0NGtlMkt4akVBUm83bEpOVW9w?=
 =?utf-8?B?U2ZvS0VNbU5DcCtHVHJKemplU2pQLzd5dVQxKzRpR2Nvc3BoNmM4TStDdzN2?=
 =?utf-8?B?QXAvdU5XNzhxVDZab29SVXFOVS9weFRjZUV0eVducmtseEdHYWNtbkpMUUZM?=
 =?utf-8?B?c0c2aFRJa0dXS3NDZm5KcmxHd1Q5VVF6SE44eFU2VG1HZHA0TXNackZPSnZr?=
 =?utf-8?B?dVc1N0kxMEx0WUI3dTlrcFVhNFdaZDlsZU5KR2w5V1d6K3dvOTkxT0Q5cVhs?=
 =?utf-8?B?K3BXclJXMFk1QkVNdnRwbTNCSERoVStiak5JVXVuajRQMFZERWxjaGgxWXIx?=
 =?utf-8?B?SzU4OGY1YXFCajNtclR0aWtEbUx3SWMxNjU1NjVQdEFtUjJHbXpJNTlkdWN6?=
 =?utf-8?B?OHFQT2QxUGo2TktyL3VUS01LM3JLdW1ZcVd5K0RhSmRFQXQ5a2drR01zSkdY?=
 =?utf-8?Q?XeDk5zVy1Vs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aU41UjN5bEdCYlkyNlVrcFUxU2lXamMycDE0VGd3MHppKzI5ZG5JYm02T1Rl?=
 =?utf-8?B?bnN4Z2N0S3pSVUhGV1krYWxiSnRLYTBha3BBcmFCYXAxcmh0dlVuNlM5MDE2?=
 =?utf-8?B?MlYwdjBROVhmR0xLbERPbWJoeWtsazdNdi9zaHBROUFwUjJoM3RtSGNELzR5?=
 =?utf-8?B?aittVTRsMUh5TnZGc2kvUHhJUG5XT1Zxemtya3pmdWNab25UTDVsMlBLaExJ?=
 =?utf-8?B?d0NNWnNHNVVDcmp4ZlR0NklrWmZFZW15cWl2MlA3WldyZnVtWW1YZWJ2a3pP?=
 =?utf-8?B?a3hHdjkralFwYUhXQVhiUXNtT3I4NnlyL2pJUlNJMHgwWDQzdWJ2L0RCbWZl?=
 =?utf-8?B?eHV6S1VQUUswYlhBSm5oSlE2SkEyT2YwZU02dWFzRGNmK2xlaVQ4WjM1VU1m?=
 =?utf-8?B?eXkrVTNZQUVSUHp5aXVPVTVDcTdzOUdBa2crS1hhNThYZGgzbnNndElMQm1H?=
 =?utf-8?B?R05hTlVXQnVEVlAzdUQ5Z2w3VXd3aENwbjR0cmVLSnY4WTY4MlRNOFdIdEpI?=
 =?utf-8?B?bXNwb3VneVMzVGFqOXg2QXR0MDJtU3M3SThabnNPUnlQVVhiaU1tTWIyekxh?=
 =?utf-8?B?VW53b0x2QVRoaHhsTDBvWWpVNTlwTlNMcks4Qk1RNnJVeDVMZ0VEdzVLQkpn?=
 =?utf-8?B?Wi9PQ0NkNTNYOVdhN2JsM1ZYSDl6Sm5HeFpCTjR2ZHpZOHVuOVJlRTFGM2o4?=
 =?utf-8?B?K3BxTXNOTGtSQWprOWx6MjdCQ2FyRjZFSk8veXZsRWVlMEVZeWdCMDR6QlpZ?=
 =?utf-8?B?eW1iWGhPNTk3V0czRmN4MGVDVkdrUjZlbTQ4UGRObG82ay9oR2wyRyt2YVc5?=
 =?utf-8?B?QUFSdXpnK2J3aEFpeU9pZDhFNEl4UzNzQkhwMzNKd1psTW1UY2VDUE91R2JF?=
 =?utf-8?B?clhTOHVkMFhteVVIaElMMUllQ01ZMXlTVDhBQ2E3SXlvZUlZYmN0VmVPcTdq?=
 =?utf-8?B?VHlUZHpkQWRiQ1lNZkpya1gwZmZ3c0QwMHZXYTgxeDdrRWhLSXpvcC9kTE1k?=
 =?utf-8?B?ZlZQaGMyempHR1U3V3V3NTVDUG5QSnMzU3RkNVdqNUNLZzBVTTg3bTVrZElH?=
 =?utf-8?B?RkFXdVdKUEhjckdVQ2ZJNk1hbSt5N2tObXlvRE4zWVd0MnROY2pKMXJQc1Jl?=
 =?utf-8?B?aUYyZUJnY2lBZGt6Z25OUlA1NFpIelc1WUxMZGlzTVVxTUFocXdkVFF3eEYr?=
 =?utf-8?B?bVJ5elZpUGF4VEZPUWx1MnVQSHhDaE5ORG5uV2dPUDNyZWZoNHBrbVV6TlNp?=
 =?utf-8?B?cTZyOU40K3d2aS9sVld3RjJrZ2k2SFRNSW9uejhNS1NDOWxJaDhldWdZOUI2?=
 =?utf-8?B?UktYMkJBS21WQU5uV1l6bHhEdStVTDVTRlA1TXdmVkM5ZVBVRnhZY0NTZElX?=
 =?utf-8?B?Z3ErZzBQNFdzNlV6TmRMRmpPRUp0dERURWtCVzh6M0xleHAvQmkxM3h4dWRH?=
 =?utf-8?B?VGR3eTFZb3FZSFpFYXRKVFE2TXRvdXo5bjAxdjFFWGtGQUxuNnlEZGpHY0Ro?=
 =?utf-8?B?Wng3NEFOWU5lNnpHKzhUQ0pYL2swckh1QkFxbCtVbDMvU1FrVWI1VE9nd25X?=
 =?utf-8?B?MjBSdWREQXc4UDBrdXBDamdiUHh3WEZ2cnpnWXlRbC9oWUJjL0doK3RPbm8v?=
 =?utf-8?B?TCtvV0F5Unp0WXdtdUtHN3crcUYzUVRmNWN0Y1JRMEZZRHpPOUU4VTlGVGhr?=
 =?utf-8?B?Z29FZ0FsNXEwOUN0cFptbmdKVHZwNmRXTmloUnV5MkZoTzdpUEpIS3pFeVpY?=
 =?utf-8?B?Q1pRb245SE5aTCtoMGlXVDdZenpmSVppYjJmeXBTMEYwaTIva1pjQ3NtUlRB?=
 =?utf-8?B?cjc0c3FRV29xSDI3QjdSUGhHVnpRa1J6R1lUb2t6YWQvZ0wyNWtmZUVHdnRh?=
 =?utf-8?B?QmdPS3BCQWFrM2VKdlRqaS9Bb3JCbGVwa3NFdXF1ZGhibkRvWWdWUG53RHFR?=
 =?utf-8?B?Mi9zei9kaEVjUXM3N01UN09zQ0JmWkJIbXN2L0pkajJIbTdSb08zcGtidmNJ?=
 =?utf-8?B?THZJMWgrSFA2SURqSjZDUnh5L2VCS0l0bFVONnBQQ2lsYnBiUUZmSzViMkxp?=
 =?utf-8?B?dDdtUEpEOHRtSzdacDF2MU1iMjh2anM4NjU1UHBWL2xHclp3UEltMk1Sb1Fi?=
 =?utf-8?B?UVVEUUtieGFmWVc0MHVEZ0tLS2MvZSsxYkV0WGRCWjhiK3l5MnE4ZnJXZjhn?=
 =?utf-8?B?M1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B87FE8E1131104DB984908A0D7CB15F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f632cd9a-fad0-49d8-0c1e-08ddc8413331
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 10:27:31.2951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H41dEo7LuzTac5ypZbGiOGZiQ5e7MuxeTuZQzZKHYT2BvleckxGn34dmpuWLpf+9ZE0/91i8y3gvuCpFH182ZSi7XqTLpwW1A49YqqQhQ6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10795

DQoNCk9uIDcvMTYvMjUgMjE6MDgsIERteXRybyBQcm9rb3BjaHVrIHdyb3RlOg0KPiBNSVNSQSBD
IFJ1bGUgNS41IHN0YXRlcyB0aGF0OiAiSWRlbnRpZmllcnMgc2hhbGwNCj4gYmUgZGlzdGluY3Qg
ZnJvbSBtYWNybyBuYW1lcyIuDQo+IA0KPiBVcGRhdGUgRUNMQUlSIGNvbmZpZ3VyYXRpb24gdG8g
ZGV2aWF0ZToNCj4gLSBjbGFzaGVzIGluICd4ZW4vaW5jbHVkZS94ZW4vYml0b3BzLmgnOw0KPiAt
IGNsYXNoZXMgaW4gJ3hlbi9pbmNsdWRlL3hlbi9pcnEuaCc7DQo+IC0gY2xhc2hlcyBpbiAneGVu
L2NvbW1vbi9ncmFudF90YWJsZS5jJy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9r
b3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+IC0tLQ0KPiBUaGlzIHBhdGNo
IG1ha2VzIE1JU1JBIFJ1bGUgNS41ICJjbGVhbiIgZm9yIEFSTSBvbmx5Lg0KPiANCj4gV2FzIGFn
cmVlZCB0byBuYXJyb3cgZGV2aWF0aW9uOg0KPiBodHRwczovL3BhdGNoZXcub3JnL1hlbi9jb3Zl
ci4xNzUyMDk2MjYzLmdpdC5kbXl0cm8uXzVGcHJva29wY2h1azFAZXBhbS5jb20vZTQ3ZDA4ZTQ0
NjVmOTEzZjAzMzQ4ODMwOTU0ZTgwMGY0MjBjNjUyZC4xNzUyMDk2MjYzLmdpdC5kbXl0cm8uXzVG
cHJva29wY2h1azFAZXBhbS5jb20vDQo+IA0KPiBDSToNCj4gaHR0cHM6Ly9lY2xhaXItYW5hbHlz
aXMtbG9ncy54ZW5wcm9qZWN0Lm9yZy9mcy92YXIvbG9jYWwvZWNsYWlyL3hlbi1wcm9qZWN0LmVj
ZGYveGVuLXByb2plY3QvcGVvcGxlL2RpbWFwcmtwNGsveGVuL0VDTEFJUl9ub3JtYWwvcnVsZV81
LjVfZGV2aWF0aW9uX2ZpbmFsL0FSTTY0LzEwNzA2NDU3NTk1L1BST0pFQ1QuZWNkOy9ieV9zZXJ2
aWNlLmh0bWwjc2VydmljZSZraW5kDQo+IC0tLQ0KPiAgIGF1dG9tYXRpb24vZWNsYWlyX2FuYWx5
c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbCB8IDcgKysrKysrKw0KPiAgIGRvY3MvbWlzcmEvZGV2
aWF0aW9ucy5yc3QgICAgICAgICAgICAgICAgICAgICAgICB8IDcgKysrKysrKw0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2F1dG9tYXRp
b24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbCBiL2F1dG9tYXRpb24vZWNs
YWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPiBpbmRleCA4NTA0ZTg1MGMxLi4z
ODk1MTQ4NDYwIDEwMDY0NA0KPiAtLS0gYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xB
SVIvZGV2aWF0aW9ucy5lY2wNCj4gKysrIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNM
QUlSL2RldmlhdGlvbnMuZWNsDQo+IEBAIC0xMTcsNiArMTE3LDEzIEBAIGl0IGRlZmluZXMgd291
bGQgKGluIHRoZSBjb21tb24gY2FzZSkgYmUgYWxyZWFkeSBkZWZpbmVkLiBQZWVyIHJldmlld2Vk
IGJ5IHRoZSBjDQo+ICAgLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAi
YW55X2FyZWEoZGVjbChraW5kKGZ1bmN0aW9uKSl8fGFueV9sb2MobWFjcm8obmFtZShtZW1jcHl8
fG1lbXNldHx8bWVtbW92ZSkpKSkmJmFueV9hcmVhKGFueV9sb2MoZmlsZSheeGVuL2NvbW1vbi9s
aWJlbGYvbGliZWxmLXByaXZhdGVcXC5oJCkpKSJ9DQo+ICAgLWRvY19lbmQNCj4gICANCj4gKy1k
b2NfYmVnaW49IkNsYXNoZXMgYmV0d2VlbiBmdW5jdGlvbiBuYW1lcyBhbmQgbWFjcm9zIGFyZSBk
ZWxpYmVyYXRlIGFuZCBuZWVkZWQgdG8gaGF2ZSBhIGZ1bmN0aW9uLWxpa2UgbWFjcm8gdGhhdCBh
Y3RzIGFzIGEgd3JhcHBlciBmb3IgdGhlIGZ1bmN0aW9uIHRvIGJlIGNhbGxlZC4NCj4gK0JlZm9y
ZSBjYWxsaW5nIHRoZSBmdW5jdGlvbiwgdGhlIG1hY3JvIGFkZHMgYWRkaXRpb25hbCBjaGVja3Mg
b3IgYWRqdXN0cyB0aGUgbnVtYmVyIG9mIHBhcmFtZXRlcnMgZGVwZW5kaW5nIG9uIHRoZSBjb25m
aWd1cmF0aW9uLiINCj4gKy1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwg
ImFueV9hcmVhKGFsbF9sb2MoZmlsZSheeGVuL2luY2x1ZGUveGVuL2JpdG9wc1xcLmgkKSkgJiYg
bWFjcm8obmFtZShfX3Rlc3RfYW5kX3NldF9iaXR8fF9fdGVzdF9hbmRfY2xlYXJfYml0fHxfX3Rl
c3RfYW5kX2NoYW5nZV9iaXR8fHRlc3RfYml0KSkpIn0NCj4gKy1jb25maWc9TUMzQTIuUjUuNSxy
ZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFueV9hcmVhKGFsbF9sb2MoZmlsZSheeGVuL2NvbW1vbi9n
cmFudF90YWJsZVxcLmMkKSkmJm1hY3JvKG5hbWUodXBkYXRlX2dudHRhYl9wYXJ8fHBhcnNlX2du
dHRhYl9saW1pdCkpKSJ9DQo+ICstY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJh
dGUsICJhbnlfYXJlYShhbGxfbG9jKGZpbGUoXnhlbi9pbmNsdWRlL3hlbi9pcnFcXC5oJCkpJiZt
YWNybyhuYW1lKHBpcnFfY2xlYW51cF9jaGVjaykpKSJ9DQo+ICstZG9jX2VuZA0KPiArDQo+ICAg
LWRvY19iZWdpbj0iVGhlIHR5cGUgXCJyZXRfdFwiIGlzIGRlbGliZXJhdGVseSBkZWZpbmVkIG11
bHRpcGxlIHRpbWVzLA0KPiAgIGRlcGVuZGluZyBvbiB0aGUgZ3Vlc3QuIg0KPiAgIC1jb25maWc9
TUMzQTIuUjUuNixyZXBvcnRzKz17ZGVsaWJlcmF0ZSwiYW55X2FyZWEoYW55X2xvYyh0ZXh0KF4u
KnJldF90LiokKSkpIn0NCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3Qg
Yi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+IGluZGV4IDYyMGU5N2YwYmQuLjg0YmM5MzNj
YmYgMTAwNjQ0DQo+IC0tLSBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4gKysrIGIvZG9j
cy9taXNyYS9kZXZpYXRpb25zLnJzdA0KPiBAQCAtMTQyLDYgKzE0MiwxMyBAQCBEZXZpYXRpb25z
IHJlbGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVzOg0KPiAgICAgICAgICBtZW1tb3ZlLg0KPiAg
ICAgICAgLSBUYWdnZWQgYXMgYGRlbGliZXJhdGVgIGZvciBFQ0xBSVIuDQo+ICAgDQo+ICsgICAq
IC0gUjUuNQ0KPiArICAgICAtIENsYXNoZXMgYmV0d2VlbiBmdW5jdGlvbiBuYW1lcyBhbmQgbWFj
cm9zIGFyZSBkZWxpYmVyYXRlIGFuZCBuZWVkZWQNCj4gKyAgICAgICB0byBoYXZlIGEgZnVuY3Rp
b24tbGlrZSBtYWNybyB0aGF0IGFjdHMgYXMgYSB3cmFwcGVyIGZvciB0aGUgZnVuY3Rpb24gdG8g
YmUNCj4gKyAgICAgICBjYWxsZWQuIEJlZm9yZSBjYWxsaW5nIHRoZSBmdW5jdGlvbiwgdGhlIG1h
Y3JvIGFkZHMgYWRkaXRpb25hbCBjaGVja3Mgb3INCj4gKyAgICAgICBhZGp1c3RzIHRoZSBudW1i
ZXIgb2YgcGFyYW1ldGVycyBkZXBlbmRpbmcgb24gdGhlIGNvbmZpZ3VyYXRpb24uDQo+ICsgICAg
IC0gVGFnZ2VkIGFzIGBkZWxpYmVyYXRlYCBmb3IgRUNMQUlSLg0KPiArDQo+ICAgICAgKiAtIFI1
LjYNCj4gICAgICAgIC0gVGhlIHR5cGUgcmV0X3QgaXMgZGVsaWJlcmF0ZWx5IGRlZmluZWQgbXVs
dGlwbGUgdGltZXMgZGVwZW5kaW5nIG9uIHRoZQ0KPiAgICAgICAgICB0eXBlIG9mIGd1ZXN0IHRv
IHNlcnZpY2UuDQoNCkhpIEphbi4NCg0KQ291bGQgeW91IHJldmlldyB0aGlzIHBhdGNoPw0KDQpE
bXl0cm8u

