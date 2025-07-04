Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68194AF9BE0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 23:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033768.1407075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXniM-0006aU-M3; Fri, 04 Jul 2025 21:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033768.1407075; Fri, 04 Jul 2025 21:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXniM-0006Xg-JE; Fri, 04 Jul 2025 21:12:58 +0000
Received: by outflank-mailman (input) for mailman id 1033768;
 Fri, 04 Jul 2025 21:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSlO=ZR=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uXniK-0006XZ-HL
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 21:12:56 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6741cae-591b-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 23:12:54 +0200 (CEST)
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 (2603:10a6:102:32a::16) by VI2PR03MB10667.eurprd03.prod.outlook.com
 (2603:10a6:800:26f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Fri, 4 Jul
 2025 21:12:50 +0000
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673]) by PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673%3]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 21:12:50 +0000
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
X-Inumbo-ID: a6741cae-591b-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4BZTqiEQqvzD6mMYf8KCiUFbk/bsJo31TxV04UeqrRTyoApDp8HKjHrXzMTmKedUiVdMldfhNjUMIxd6pNANs4TJcmyaesNC9S0elfFJSau/zic5pQmKagWGtdDwnKw45j3joVbYx0TPleQMwDkAT9PfTcbI++grXjbsKyltUANvyaBonSjDZC0FDRtXIsTuby9+aLiRrxMo2mWcXRxPmUAn6tkfIm269JKX386nNLj672JuBaBewpSOohE7kPgEGTS4BHbH5Me5++x8AEseoTCcVzxYMwSUClzREpXaAf5BM+IR+l1LdYKlDwNREJ9G798GVJRTMp6rHYQTtwMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cL/WU5STyEawE7+Qu/5IBLPi+Vvk3wRDh2N2m0n3pZw=;
 b=u3vj7coHdFhA2SkizSIFDUzo1vePA274SNeymERBpOyC7yc7HHZPdygN/XmxXIByG3kT2mu22s1i6xjp4dWZRYjr2NwIsO7gZl9rlxFs/O0+dndG+D7rzFh0oiaOBYz1lvj2uolXgXE3+Csu01JZcrrf07omNQ9JQQEzQY9x9bMUXW1c6OWhrYEDhICf0syoorXBnvw23dyfKu1YsnvxAiX1QGdkeecix0JqwSCK6I9E3+nxym0hBpMSD2FyNhjR5PXa6RpZnVwkTTJAqtNKANp95llDlQU9Ib0vVhCWgiVBnt6+Fv4nQa/I8HDW7iJhtqAVWlcgzA172oLMkslOow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cL/WU5STyEawE7+Qu/5IBLPi+Vvk3wRDh2N2m0n3pZw=;
 b=TJDXlsYlAEkyXywA5zg+weXHN7seJcIw6UJsnYeSYtZGzXYhEuT3izC4nZcfcI/HC7Oi5921cXfnDbEFQ8j0tzxoxUPp7pRBbIqQ5zcSMjrmYNPdMNUivPv+xSCsqvf06c5Rm3j9v3cmBnjXTDbK9sdTau6lWfzGONrvDFAEmSxU1ywl1HOHVOa2cz0/gHXDnq6K9lt0BLFI6Sag1tqPE1/9yhKCMlHCyCrb0Ap7sBTmznyOeS2Z9H7nl8G3ofxJ5YXjaLwFW4c5T5l5TWSGKBAWM/GASfbpiRzQSwlwuM/ojDmwIcWTPxigceQMHUKohvi9VxaudGBV4g2ZsCvPVg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [XEN PATCH 0/5] address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH 0/5] address violation of MISRA C Rule 5.5
Thread-Index: AQHb7SO8zwZmOLgOOUWjtzVlzh0I7rQidoKA
Date: Fri, 4 Jul 2025 21:12:50 +0000
Message-ID: <64908e5f-4f9f-4080-af0f-6b48adca99fa@epam.com>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10142:EE_|VI2PR03MB10667:EE_
x-ms-office365-filtering-correlation-id: b2b15c8d-ba2a-4cda-1556-08ddbb3f886e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGZiVTJxUk9vK3lBZ0UwTUg5bkJCdy91L080NCtkNzVoVEVZN2Y2S1hjQkQ1?=
 =?utf-8?B?bVF3cUFmL1hzOHI0ak10WDhid0tEZUpJRUlocThlb0pvOUdnL1ZtY0p1OUZX?=
 =?utf-8?B?U0h1Z1JBbzZKOG5WdUJ6azZTL3VtSlRMSTVFTlhGYy96Y0ZEMDlIZnczZmlS?=
 =?utf-8?B?YlNCTU9jVXdyNTA0OCtJNEo1VGxsVjl2K3BaekZNNkswdU9KMlpmbE1Gak5Y?=
 =?utf-8?B?WjBLSEpyVXdCRHFnVUxra0lreUVEYzIwNFlwRTQ4OVpIMDc1Ry92YzBYRHVS?=
 =?utf-8?B?MVAzaFhXNXVUVmVLclhmUVRseEVxVmVud0dXcXdNOFJrTStzMU8yY2FnUkNW?=
 =?utf-8?B?NXMxWWp4V1REQld5VTdxdEhFcjlzbkh6SU9ZREErY0V5dVJUVm93aENtaFd4?=
 =?utf-8?B?cHRXM0VOVzUxd0J6SnNSbTNobk5aWUd6VHIrLzFiNzRVcytiUmd5cGRIc05Q?=
 =?utf-8?B?dndGait2dHBJOWRadVd1OVpkN1BPbjNYbWtkWmNLWlQzNVV5RC9zaTFDZkZU?=
 =?utf-8?B?TFNQMUI4UmtzNDBPRFEyOG8rYkFtQ1lwSXhydm9jWTFMOCtXb2pXK3BsQ2Jq?=
 =?utf-8?B?dCtYakYwOGRKeVE4TjU5bDRodFNESE5vOVZuWVdGdjZDR3VpZVoxM21FbnNp?=
 =?utf-8?B?R1VndGFJWkVLbmdPUkpEcVdtb2xnOWZWUTNXU25IRDU0b0lzT3dnY2Z2YVd4?=
 =?utf-8?B?czZDWVlHTDlMT0svRjhUMy9VMHQ3Z3U4UXE4TkJ5VzhSd3paSnRQZnArVmJs?=
 =?utf-8?B?cUlteCtZWVJJVmFkMTYxSG1HTml3U1pwdFRTV2JGK3NUdUtmYUZOelAwQ2Zm?=
 =?utf-8?B?TS9RZ0JvZUpqV1NZcXEvcmRtZEQvQXFJR2I3bUZEdTVsYmNlVFpzZzFER3pj?=
 =?utf-8?B?aDFGdnFEdzhlZlFXV1U5U2k0T2V4TXRtV2FrUUd3eXozdjNiRjF5L2FsTWNW?=
 =?utf-8?B?THpXWTNzSTVNSDJXeGVEbzVNcHFFems3S0ZWV2UyTGpITC9xa0dVL1N0US9X?=
 =?utf-8?B?UHdlZDFyME1yWTVqd25tRHE4LzBnZCs2c0dWanpEYm9IWFYwU0t1aGZzWnlD?=
 =?utf-8?B?ZkNQNlhTd0lNNmpDd2svbFhPR3NkRFdaN1lPZnovKzhMOXBraVJJdE5sUzJv?=
 =?utf-8?B?Q2tXaHpCc3BTNHo2U3RnOG8yWVpXOTY4Zks2V0FjNGNTZXJ2L3Faak1SQjVY?=
 =?utf-8?B?V1V1WTZVeHlFNjdBQlRLUFNnbVFYVi9BVlBHdlZ6SGRwY2pxQWxTTnB1QWxy?=
 =?utf-8?B?TVl4V1hBZVdVa2t5YXFkSUlyNUVmQ0RYUWNFTjNjSGZsdzJVeUtTYVg4WVBE?=
 =?utf-8?B?bjk0OHhIdHkzWDg3MEZqVWdzZTRiOTFHNXh3NkoxanBESExONDNxUFRjSDl3?=
 =?utf-8?B?SzVnbDBDZmNYT1dQcjdCMytZL0NoRGNCZ042VjQwbDRFUFdUMUR1QlRYMzVU?=
 =?utf-8?B?TUdjVHVhZGE0NjhXbVFFRlJMYm5tSXh4a1dTWTVJT2lTeUVudGFRR1E2Zml6?=
 =?utf-8?B?c3dhS1RYbXhFOWFESk5vSnJQUW9mK3dNelV3K1NsUWNTWlZPcGQ0L0kzanF6?=
 =?utf-8?B?bUtJR1JtOWxxeXI1YTlOTGgzWFhmOTE1VlRMWHJPMFFzb2IzcXJ4K3VqRERs?=
 =?utf-8?B?cEdqZzFZdjdHcTgvT0VDT0FGTFlDSndVdVpOMHdIWTQ1WVJyLy91U1NDdStH?=
 =?utf-8?B?QU03V3gxV1p5VGUwWlZBWHBwZkF3ZVJEamxsMTYwT2w0eUZQUFdMRXJwejJq?=
 =?utf-8?B?MHVFSVc4VUF3Q09EY0pSKzRvdmd0ZXU5WURRVTMrTnpVdEkvc2VmR1pSRUtX?=
 =?utf-8?B?S0JpcEpZREVmZkZtM1VVWVd1RGNRVjc5cU5YejJKbXVCMHkzMXdwRzZLbEJJ?=
 =?utf-8?B?cnNzaThjU3h4L0pIa3B3Zmc1ckJ3U2pCSmNVU2dSRjcyNTdkWG1wM0t5K3JW?=
 =?utf-8?B?WmRHblFuWXdQV0Q0eC90QzJqd3RsTHl0dVhmNmp1WEc0TzBjTjgxeG9FcTYy?=
 =?utf-8?Q?si9B+u1nezAFmhAJRMN2Q+pB+ZXP8Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10142.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ti9qcThMcDREK2Vmdk54akhZQ1NBMnFTRUd3WVJNOEUyT1VPb2tranJTbmlk?=
 =?utf-8?B?VWlxbDRRVW5LMFRQYXBSaTRLRmxJR3RaUFlYZmZLN0NXWTdET0xqSW1FdFZU?=
 =?utf-8?B?MlBscUxoVGZBK3hqZSs0UzRMU29seTVaeVc1eDQxRHl2aGdwbUJkUVVEZXJI?=
 =?utf-8?B?K3FVZ2pVQnk1WEQrQWhYS1FLcCtzRFhDc3hCMHZ3TWxDZFNIempaeXV1WFgw?=
 =?utf-8?B?UVJsNlI5MUlHR1pxazVqbzJSSTFRK0tNT1hOWlJ4LzNrVkdKeTlaK3lyL3dJ?=
 =?utf-8?B?Z1NBREdmcnFYUTdIRFZIbVhUbVJLYWlzdmJUbTNwTm5VWXFGbU1GUGdLZkpu?=
 =?utf-8?B?L21McjBpakVUb0hUNFpkQ0ppR0U5K0xHT1pGYVVrZU5EcWdGdWpYcFVseDBq?=
 =?utf-8?B?VlNpaVJoMDV1ZE11b0kyM0ZFb3NWQ3BPOHRJaXNRaVJaM2VHc09QTXNjVkpU?=
 =?utf-8?B?Y0ZnMXVadmdiUGhUNmprNGdSU3N6NHdrZ3QwNDhDQi9aM0tYeG9kNzJqSE1I?=
 =?utf-8?B?UDk4empEQ05pdklDeVhEOEZ2SmpJUDhZemM3MHVaYU4xRVZTVHVJN2c3V0tS?=
 =?utf-8?B?OVVDYVkzdnlRbUtiR1ZwNnYwdml3TC9CZldlQXlSRzBlWThLa3JuWkRaa1Ni?=
 =?utf-8?B?M0tFclFRVWFSN09pcitHMnFKQyt5Z1ZhZ2FNM2pxNmtMcXBDSjlacEtSUnln?=
 =?utf-8?B?Y25PQ0I2Y2VvWDU2d2YrMDFEWXhYZEdYZlRaWXVsVU11MmFIOXNIMTFwRjEv?=
 =?utf-8?B?d21wNjZrTXZnVi9SS3ZWNmhmR0p3cDNPOUJTaFlwTlFtNGJHajJqQjJERUZV?=
 =?utf-8?B?ZHJ3TDE0QlFIVy9NVlVaR0RWRFNGelFyeGw0MTg5M0piRU5lVFpkZkQyRk16?=
 =?utf-8?B?Y25qTDhmdU85K2ROQWJZZVVJNTY4L2UxUzJUbUVEUHltODZvclF5MGg0UWx3?=
 =?utf-8?B?TjJvd29UYjBoRFF1SG5RdHdPYk9pditlQlhYZm5lT2pVZlA5NFluaEdpaTFK?=
 =?utf-8?B?NnlzS1pZanBxa2FIckRERXpHS1pxZkZjeW4rYkM4RWF5YnVXbjR1anJYYlVH?=
 =?utf-8?B?NlBsWmlkZG1KVEpRK2ZDYWpjcE8ydktHak9jZk5ldVhaU2tSY09TdEg0bmN6?=
 =?utf-8?B?NFV5TGw0b3krbkJ5VXIwdkY3VzhWU1hJd2RoaDRaL0dYRXlUSW1scGtTMERR?=
 =?utf-8?B?MlUwelVEbjQwTSsxL2s0Zk10SHF6U1cxN2c3Y0djUTRkNWJ4dHZDQzMxd2Nh?=
 =?utf-8?B?NXZ6K21aajk3d0lrQnRRTXM0em1rMGE3ekYzWHo4MnVDcmxtdEduUGJVTGlS?=
 =?utf-8?B?dVN4LzlIWmtGaXlPUndCa2RST21PMFdZdEpJZEZ3VGhqSSs2c2tGUWh2cVdo?=
 =?utf-8?B?V1RpNTlLNGhVbXlPd3lyVkxtaXg4TW84WndsNDhBNkVPc2dkQTFORnRvNTRk?=
 =?utf-8?B?ZE5VbzdqZHd6TGIyTlhXSlhYT24rQ0VLT3ZPSEFJdFFKd29HZTVlYlp6QWE4?=
 =?utf-8?B?NkxEdDFobFBoSURQRXhETUxYVUQzZTdSQ2w2bFNxcUNDTEhremQxaEJ1TTVR?=
 =?utf-8?B?RVczM3VYMDI5Q1IzL3NMUkFIT2dHUjUzNmR5V0ZCTDFiNG5LNHJBa0lpcjE2?=
 =?utf-8?B?TWM4eXR2QU1OTFZXeGs3ZDJPR2dPblViZ2UzaFN3VHNxdFB6cytXdm9aeU1T?=
 =?utf-8?B?TVMyR1hkQXFOdnFEdkNKSGZKSEZhUW00Q3dzMDBxRkpqQlphSmFDRi9SWXpk?=
 =?utf-8?B?UFJnNWtuYm5oZFduL1d2NUxPSithODVUSks2cFZ2MTZnODB4VnhybFR6aFIv?=
 =?utf-8?B?OW8yWit6aHVUZ0JwZGxhZDhKSndSUjVoMlcwVm9iUWFpV1JVeFBJMlk4N1Bz?=
 =?utf-8?B?VVlIdVdFdVR1NlVFZTQvNUgwQ2JMdFJid2JsejI0aTNPMkVOZG41TUtVRDhs?=
 =?utf-8?B?M2d4dGZhOVFlbDNCbzJJVGRRY0N1WVZUUFlDU3UxWjZnWFJ1UkFxWitLYU9G?=
 =?utf-8?B?bDJ4UmkwcE03OU1NdHVaZkxMUlRzc1c0eDhJUHlSTzgwdzlmeGNpU3YxdU9G?=
 =?utf-8?B?eHFtdVZERXV6RWNYRlh1VER5NXpnZktUNjFYMW5OYmRoTVk1eFgvNWFiUnJM?=
 =?utf-8?B?aVIvczhYQzNOWTdWTmN6SkpIRGRoOG1UUkJvNlY4eHp2elVZbEFEakJwTXdM?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4ECA5FB6BF387449395659049523641@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10142.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b15c8d-ba2a-4cda-1556-08ddbb3f886e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 21:12:50.2607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FDpe1KyhCoupflLXvCEpoyBgdNum9cIcKXtN36UONwFomej/eacIFeIpNdtgFrPow3Vs8lzp0JJcfy2yUYi7hiyj6f/iM0KyD1P3Mtcbho4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10667

UGlwZWxpbmU6DQpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2RpbWFwcmtw
NGsveGVuLy0vcGlwZWxpbmVzLzE5MDcxODg5ODkNCg0KT24gNy80LzI1IDIzOjM5LCBEbXl0cm8g
UHJva29wY2h1azEgd3JvdGU6DQo+IFRoaXMgcGF0Y2ggc2VyaWVzIGZ1bGx5IGVsaW1pbmF0ZXMg
TUlTUkEgQyBSdWxlIDUuNQ0KPiB2aW9sYXRpb25zIGZvciBBUk02NC4NCj4NCj4gVGhlIHByZXZp
b3VzIHRocmVhZCBpcyBoZXJlOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwv
NDhjNzgzMDkzMWE5OGIyYmY3MGVmMTUwOWYzMDliMjYyYjllNTc5Mi4xNzQ1NDI3NzcwLmdpdC52
aWN0b3JtLmxpcmFAYW1kLmNvbS8NCj4gd2hlcmUgdGhhdCB2aW9sYXRpb24gd2FzIHByb3Bvc2Vk
IHRvIGJlIGRldmlhdGVkLg0KPg0KPiBEbXl0cm8gUHJva29wY2h1ayAoNSk6DQo+ICAgIGdudHRh
YjogYWRkcmVzcyB2aW9sYXRpb24gb2YgTUlTUkEgQyBSdWxlIDUuNQ0KPiAgICBpb21tdTogYWRk
cmVzcyB2aW9sYXRpb24gb2YgTUlTUkEgQyBSdWxlIDUuNQ0KPiAgICB4ODYvaXJxOiBhZGRyZXNz
IHZpb2xhdGlvbiBvZiBNSVNSQSBDIFJ1bGUgNS41DQo+ICAgIGRldmljZS10cmVlOiBhZGRyZXNz
IHZpb2xhdGlvbiBvZiBNSVNSQSBDIFJ1bGUgNS41DQo+ICAgIHhlbi9iaXRvcHM6IGFkZHJlc3Mg
dmlvbGF0aW9uIG9mIE1JU1JBIEMgUnVsZSA1LjUNCj4NCj4gICB4ZW4vYXJjaC94ODYvaXJxLmMg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4gICB4ZW4vY29tbW9uL2RldmljZS10cmVlL2Rv
bWFpbi1idWlsZC5jIHwgIDkgKysrKy0tLS0tDQo+ICAgeGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
ICAgICAgICAgICAgICB8IDIyICsrKysrKysrKysrKystLS0tLS0tLS0NCj4gICB4ZW4vaW5jbHVk
ZS94ZW4vYml0b3BzLmggICAgICAgICAgICAgIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0t
DQo+ICAgeGVuL2luY2x1ZGUveGVuL2ZkdC1kb21haW4tYnVpbGQuaCAgICB8ICA0ICsrLS0NCj4g
ICB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICAgICAgICAgIHwgIDUgKystLS0NCj4gICB4
ZW4vaW5jbHVkZS94ZW4vaXJxLmggICAgICAgICAgICAgICAgIHwgIDQgKystLQ0KPiAgIDcgZmls
ZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pDQo+DQo=

