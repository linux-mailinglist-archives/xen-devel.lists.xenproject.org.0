Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902ABBA10C6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 20:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130727.1470151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1qqN-0001wY-Mq; Thu, 25 Sep 2025 18:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130727.1470151; Thu, 25 Sep 2025 18:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1qqN-0001uY-JQ; Thu, 25 Sep 2025 18:37:27 +0000
Received: by outflank-mailman (input) for mailman id 1130727;
 Thu, 25 Sep 2025 18:37:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6d5F=4E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1v1qqL-0001uR-LZ
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 18:37:25 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ada2731e-9a3e-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 20:37:24 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS4PR03MB8698.eurprd03.prod.outlook.com (2603:10a6:20b:58d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 18:37:22 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 18:37:22 +0000
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
X-Inumbo-ID: ada2731e-9a3e-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+5HYgaRbNz9sFCJq58tEMH0T4M2pOgq04OV2T/ApPVrmbFT5D20MD8PKJJm8NGU3pjCDOpReHsXKtR0zaYUlSc1zRUCVK7Ah7y9TFR+9gg6+IK9bGmb3hSSKM94dXhWyKydJ9HZUHfx4CCUSs12dsvalVh4GdRkuBFU2jysOLJ14PWDqM87LX+4/vokXqMr90DV+4cXQL4NhrgsAirJoH5O5wfaZHhmx2u9aKknZu46EKcteUPli98UHr1MSxS7eIJu87FWnIkIhvdicToUaxir4FFbcZ7RU9EIhPV7dbE5fi9uNwZweFMRq1nFRJU2CQNg6T6l6DEDArWthbTKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFghAQKEJC3l/KiXFTMy1qzVHRKCyUkDxx/3I9yy3Yc=;
 b=pC/aN7ZeM9Kbz6OlD1MyjttG1EQGNa+HGM4NCw74qntAbaIGgEaqhXV/M2IBpUsUmlQUYPSWdIW7AgWVPIw1W+sF4X0OzWZoy4QiEgOzQEAtU70bTV9CRNA1lpTWIc+Zf/Rq2uB276x48+DN+QVMPJEJxUMuK1Wt2+ed1bCUqQ1FRxLAPULJdjRX/MIUWFG5eOSdjWmZ4UM0eG9dhEB2FkyFHBs9tD2/43SYxIOKiStflIlwVmlbJtrnKkIXIs2zhr9dGFTcTCRp8XFFALrm2ZZcN6i8Ea/xhqeQg8gFlHGQUDDaVHA3Bs4gu5X0qw4oDBwZhf2PywHn0Dy74CTnqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFghAQKEJC3l/KiXFTMy1qzVHRKCyUkDxx/3I9yy3Yc=;
 b=M0mCNTlA0y16woNgzpdrMZS23PLp8RBAIHHNhT2V46MZ0/9uQCSt6xSimJ3p51edaJ3H6nFBaNS3gS+Eq9m+7uYnJ9FY8XiGj+h3GJU5s/f72b1iW+AfT2N7MPtPCfg7+1IWGgXDzr+9tlkTaSrH/YgtHctNzJOsrYZJ9nkZaWjKtqYQuhfHzw1YIKfB5Zi85EZTD/Ln8BNmlHvQZL+QQmJc9w1MCOtNbsehxc42z0DXa+IyHHzOiiE1Y55WczB/IjME/8QPrzMoxzAsKPVWLOnof/fXwLV30onUH9cwO8UFSnh+XYmXgYoYTnwsZVBCmcWAXKIUCWY/M+jBqLxHDA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Topic: [PATCH v2] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Index: AQHcLfLzOeq7/eyxK0Kcj9l07Fl9X7Sj4/SAgABXAYA=
Date: Thu, 25 Sep 2025 18:37:21 +0000
Message-ID: <d3b71d3f-77fd-4763-bd01-bc6212cd80f1@epam.com>
References:
 <b0f269822312a442e87ab02c8deff028b6b040a9.1758787340.git.dmytro_prokopchuk1@epam.com>
 <ae0ecbfc-cee0-4035-ba03-e9f9ba2661e4@suse.com>
In-Reply-To: <ae0ecbfc-cee0-4035-ba03-e9f9ba2661e4@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS4PR03MB8698:EE_
x-ms-office365-filtering-correlation-id: acccd588-84fb-458f-1d08-08ddfc629090
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VnVtdDJUTExPZDJEYkthZThzQ2xsNHo4bFRNWTRwS21ZVU4vdW0zQndPZmg1?=
 =?utf-8?B?RXMzZmZmS29McHp0U0pNemRTbVZ2NVJQaG5hRmFIQWw5ODhyUlZSSlVIUTlD?=
 =?utf-8?B?cnF4OUZvbXhFeUsvN0w3S0hMZTA5a2hNbFI3M3JIVU9peXN6M3Fackk0clg5?=
 =?utf-8?B?ZG5oa3pEOUVqejZkbExPcjJBdlZsNDByK0Jhbm1WWUREZ2J4TUhsQnJlWmlq?=
 =?utf-8?B?aUhxNEdwcmlOYVB6WFFNVmFNL3dBMGZ6dGRIMFB2d1ArZDJhbEtBajA5enhG?=
 =?utf-8?B?THFXL0R2S1ZDN0RRdzNoVWN5Ky80ck0vRDRKOUxDTC9TQzdWT1ltTUJpS0JJ?=
 =?utf-8?B?Skt6ZDU0c083d1Y5SUJpeUNCZkZVMkVpdmtUZnpWWis1STFSalZuZjVPdHZ3?=
 =?utf-8?B?MTFLSE1IOG1LVndKSTAyQnFKYUd1UnhhZ3Bic1l1TW1wbjV4VlNRdmZpSVVV?=
 =?utf-8?B?b0RyRFJRd01OK2N1ayt1WUxaWXBQeGVyRUpIRXhxQ09yaW5GV1pnS1hqV1NW?=
 =?utf-8?B?RHd6VmpmQ2hKT2hpOCsraXNnYjBRcXpTM0kvbTdZV2FacHNYYTdiY0NYbzl6?=
 =?utf-8?B?UXZPSk9aUXkzYjlqdnYveWZmUjJ2ellpakJNM2FSTnAwcEdpbTgyU2IzTnBW?=
 =?utf-8?B?ejViWGIxaUg0Vy9pTldCNllOTHgwcHEybDI2Q2d0dFRkemFNN2Z0YzlLRFE1?=
 =?utf-8?B?c1NVSEtWYVRqbHdZU2hrWjE1bWcrYXJuOGhUTUo2V3lLMk9mSlhMV1JKNkpr?=
 =?utf-8?B?Y28ydGJxbVl6UzJrUjJrMWpaS3hVblNCTXU2UWZtUDZWQkkvZG9tYndyZnMy?=
 =?utf-8?B?UkE3U0owYURpUEcxVHNkakZ4dXU5QkxVNFRNeXVTK3YvNnBJV3ptK1hETVY1?=
 =?utf-8?B?L0tCcFA2QmE4azlBK2owN216dTFaRHkzZzRKc3d4SXlTVFg5cUt0RTlGbm0x?=
 =?utf-8?B?TnpvdXlQeUJiQ0hLKzRramQwM29raEtaeFJVdFcxR04yTVRQOEJDTzAwLzNy?=
 =?utf-8?B?L09lZjVRNndGRUFlMDRLYkZhYmJzUGwrUUV4OEFnQkdyUW5sbGEyMm5FYUJt?=
 =?utf-8?B?dTFRNWc5Y1o3NCtJUmcrOU1KN0NpY0VDUzI2cTl6OVg1YVJGZDBZQ2FYUXor?=
 =?utf-8?B?RDRYSVBwT2dKRU5KMXNyNDZHM1o0MC9vWTg4Zmw0MUVTWUwvN2FVZDZZZ0Fw?=
 =?utf-8?B?WndhV0ZDM3BNY3RsQ3dzcGRib0E2aE9SMkM2ZHJhcWp0VU9TYlFqMHJ3Y3dB?=
 =?utf-8?B?VjdIdU85bTlOSXNXOVNJNnNYTUpMVjFKZVZMcGwrcmRvNlo0Mm5kVFFiTzRp?=
 =?utf-8?B?Ujl3ZmVBeDhiL3BIaFB2Z1MxeWFNNmt0alhMNUR5SDJlb21zeS9VSXBjcnBH?=
 =?utf-8?B?Vk9OVVBaM0RyS2k4UTdaQW0rUk9vZ1BLN1BSZU5mZGZzbWIrU2ZxTkk0dkdk?=
 =?utf-8?B?TkNTTDhPNlVTSElYU3NrNE5MMnRtM0V5SWJaU08xTEZST2x4bUJiMEVNZ3hl?=
 =?utf-8?B?UVF1cjNCcHJEbjZVQTFzNzJISHRvTnNyL1EyQ0JOSEJxdmFvYUh3TU5GaWRt?=
 =?utf-8?B?NEhEQ211b203UDhRN1Q0TWtMMklxWjdEMnQ0NGN3cUs5V3ZnZ200d0xUb3JX?=
 =?utf-8?B?Q29SeE9PdXY1U1U0UkFkVXR0ZnIyRkthWHAvTThtSEExQk5RVmV0Vjh2MUty?=
 =?utf-8?B?Wm9ja1N0SlgrRVdjclRneUhWa3FCamhsODFOWlpUTXJVSGxRaTc1bUt3K2hT?=
 =?utf-8?B?bXYyUmd5NDBQcTVXMlIyUHp2YnJITVFoa1Jmd05PcDdiMTBJa1Y2UFdHZFRy?=
 =?utf-8?B?d0UyV2hLMmE2cU1FVEtoblFzRUsrZWRVZmsxdHBzY2JXakF3SFpoRGQ4QUoy?=
 =?utf-8?B?OEtYZXNNVUVMa3l1WitvRnNPYVRVYTBydWdsNFo1U28xYmFuTDBkckc0aXhs?=
 =?utf-8?B?TjJTcWxaT1QvVEpRaHBwaTJ3cmJRZFRzenBGQitUTHJJblM1dTdDazNJL01K?=
 =?utf-8?Q?t0JOfSkQkyCPqWga+a0DjQ9FNAP9Iw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXZSeVVVUVJVdTE4MDV0b3Nod21nQUluS29xbWhnU1FBSmJnN3liaEk3Ung4?=
 =?utf-8?B?c3d0R2tnanpIb0k1R3YyaFhGTUN5VFMwWXZibHZxekZHM1lnUHlPZFlvYnlq?=
 =?utf-8?B?dXpKK3dOZzBHem0vakFEZ0EvUmUrbmtLRlFaNVowM08wSnNKUWpMRnY5cU0w?=
 =?utf-8?B?UDNEelI1dVFtTXVLSUFZSnFDV1R3amYzWWY3SFdZQkhWcmN0SjF0bmRNdU1x?=
 =?utf-8?B?WW8xZnZJRmZuRVI3VUFFcmtaWDZXVis3aFREaFpzR25vNmhoRURZTTBmRnlV?=
 =?utf-8?B?Q1BxZGViZVpHTXJ5QnJyck5TZWJ1elFJYTNSTllWNUt2MXBJOTZnazNtd0s4?=
 =?utf-8?B?Wm5ydEpySEJMdUtjc2o5NVpBd2VTN0c1ck4wcWlIOFlxVDNBdWJUdWFoYmd3?=
 =?utf-8?B?QVlFVHFoTGpibGJqQ1VOMFd5TE51eDUrY3VBMU1uOGI4WFo5V20yUFQ1WCs4?=
 =?utf-8?B?alZlcEd3dVA4dWs0MFlTMkFnblpTQkZiaXBJMVY1cVRzbkJOWXY1a21kSjR1?=
 =?utf-8?B?TFVzU210TjBXc3Fhckx3aFlCZVBOSWZJRnVLbTB5eWxlUEx3ekxwVllESG1C?=
 =?utf-8?B?Tzl5UGVuNFZFSEJUbC96RzFBcmNrTUtZNjdXMzVPaHhhYU1PZUhkRDFzZWNH?=
 =?utf-8?B?ZXZWMW95bEVUNHdjMFQ3TXdvNjVybVlFcFdQU01SSmJ1ZUx1NmpYWGZvUFph?=
 =?utf-8?B?QzZ0VUNNZTdOSkI3ZnRxVjFmekRJc2ZpNU8xVnBKOVNzbnVQYXhwM2tSeVBq?=
 =?utf-8?B?N29jMVcrZ0Y0Q0I4ZExFcXd2R0o2T1FEZzZiTFVtTDcyWlg3SGd6KytlL0xa?=
 =?utf-8?B?VlNLTkk0UUNCWnEvUG9hcEF1ZEJsa29RTmVESmlxa2ROVDZpVW1vdjJaOTVi?=
 =?utf-8?B?d204ZFc0SHhRR0VpaTlRWWltalJHZXJLSVFrRDl1TkordXg2RE5MZjVsM0NH?=
 =?utf-8?B?eldhSjFVQWpwRnhSZXhBeDRUTkpkMU43bnBVbEFzR3o4TFFPYmhJYkZHRmw2?=
 =?utf-8?B?d0R0VCtTMlh4V2czQk1wTFVlakUwZTN6M20vVVV0WXlrL2FlOW13Q1l0OVJQ?=
 =?utf-8?B?eTlQOERjdVNFNG9FM1M5bVlyVVFMSURvcTZuWnhZUGZDUlQ0c0ZXUFY3ZGFz?=
 =?utf-8?B?bVVkNHpmdEVZZWlqWWdSSjhkQUkzK0diVW9OVE1VOXhQWHhPYlhHaEFnN2Fz?=
 =?utf-8?B?aXZTU0d1a0ZRN3pEVExXS2J1SzZ5UU93TTZEN0NnWml5RHZDMkxHRFhVbU5t?=
 =?utf-8?B?N1lnWFdsaEZmOUJzck93cFVKQUgxczZRVlNYQjc0bHBHcEhUdHp6b3cvV2VB?=
 =?utf-8?B?OVFRSXFHSkFTc3lXVTVmMDlXZmdrNUxpa2d2TXQ3Ym1STTlYZi9Hb0d1bStR?=
 =?utf-8?B?eGQ1MFZBcDN4L2l4SXd3Z1I1WHdrbXFuNmM2MXdYZVhvWUM3aHVTQjAzclg0?=
 =?utf-8?B?NmMyUHBoSWJtdXdpaGNPblAwWnE4Z0FEL1NMQUkvcEVHNmxMRmsyZUxmZ3FR?=
 =?utf-8?B?cElpeVNBOW01b3NrYXJhZ0ZnamdaUnBTNjg2WHRQWE9FTUtkdDl2SHpZSDBj?=
 =?utf-8?B?SHJOWW1hcUFsbm5GNUFGc3Jld2wvd3BZZVV2VjRwVjZJZU1zQm1IZU9pcVRj?=
 =?utf-8?B?dVM4aDFuUVdzemlNcUl1U29MemZIWjJTV2NvQ2xxYWZZa0hIV082VW55Sm9q?=
 =?utf-8?B?Sm9kbGtPb0diWEliUDZ4S1VUdExndnBqSS9HNzRpeDRuMENqckVNanBKOWI1?=
 =?utf-8?B?SG9xczNBd2crd0tua25qRkg4SEphejRjYnVkQnl5Kzd5aCtBYSsva29XS04w?=
 =?utf-8?B?S0JwYVhBZE9BMFJFdHB0VlF1QWZQMkNlNEZ4QVBXSEFmVDJnUloraXh6VE9W?=
 =?utf-8?B?b1R4V0l3bTZLM2o4WUFCRlFCdnFWZGRJcWRwL2QzYitkQmlFMDY4MkJkVFho?=
 =?utf-8?B?Q2plc0doVkI1eGF0OXRGLzMvVHh6Q2RieEZSeGdvdzAvcXVmYUhyNFZzcVc5?=
 =?utf-8?B?alE3My8zSXZ5UEwrMHhGTUNwRXd5L0Izd3d6SjZ6VlE5eHdyaC90T054SVlh?=
 =?utf-8?B?YjE3TFJjbkFiWThUaXVuTXk5QTlsRUgvcnhoVldUT0RTbWo2ZXRuZ3A4MmNQ?=
 =?utf-8?B?eEx6RE40MVBHL1JoMUN2L1pPVmhKZWg1VlgzeUVEOTIrbzNIeXh6dHBWVkVx?=
 =?utf-8?B?M1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8362069BFE8F124A9B438E24D7A0ADD3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acccd588-84fb-458f-1d08-08ddfc629090
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 18:37:21.8807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kA2jqHlWqmoHKa6jgJjdoCwOBx3R4vnpFRIE60ihKGnxag5HqarV9bU8S7mwkPY88/GXuvRSl3r+5uvpNacJzIVHcdC/m7lN/dHt6pPCFZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8698

DQoNCk9uIDkvMjUvMjUgMTY6MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wOS4yMDI1
IDEwOjA0LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS9kb2NzL21pc3JhL2Rl
dmlhdGlvbnMucnN0DQo+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiBAQCAt
MzY2LDExICszNjYsMjIgQEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxl
czoNCj4+ICAgICAgICAtIFRhZ2dlZCBhcyBgc2FmZWAgZm9yIEVDTEFJUi4NCj4+ICAgDQo+PiAg
ICAgICogLSBSMTEuMQ0KPj4gLSAgICAgLSBUaGUgY29udmVyc2lvbiBmcm9tIGEgZnVuY3Rpb24g
cG9pbnRlciB0byB1bnNpZ25lZCBsb25nIG9yICh2b2lkIFwqKSBkb2VzDQo+PiArICAgICAtIFRo
ZSBjb252ZXJzaW9uIGZyb20gYSBmdW5jdGlvbiBwb2ludGVyIHRvIHVuc2lnbmVkIGxvbmcgb3Ig
Jyh2b2lkICopJyBkb2VzDQo+PiAgICAgICAgICBub3QgbG9zZSBhbnkgaW5mb3JtYXRpb24sIHBy
b3ZpZGVkIHRoYXQgdGhlIHRhcmdldCB0eXBlIGhhcyBlbm91Z2ggYml0cw0KPj4gICAgICAgICAg
dG8gc3RvcmUgaXQuDQo+PiAgICAgICAgLSBUYWdnZWQgYXMgYHNhZmVgIGZvciBFQ0xBSVIuDQo+
PiAgIA0KPj4gKyAgICogLSBSMTEuMQ0KPj4gKyAgICAgLSBUaGUgY29udmVyc2lvbiBmcm9tIHVu
c2lnbmVkIGxvbmcgb3IgJyh2b2lkICopJyB0byBhIGZ1bmN0aW9uIHBvaW50ZXIgaXMNCj4+ICsg
ICAgICAgc2FmZSBiZWNhdXNlIGl0IHJlbGllcyBvbiBib3RoIEFCSSBkZWZpbml0aW9ucyBhbmQg
Y29tcGlsZXIgaW1wbGVtZW50YXRpb25zDQo+PiArICAgICAgIHN1cHBvcnRlZCBieSBYZW4gd2hp
Y2ggZGVmaW5lIGNvbnNpc3RlbnQgYW5kIGNvbXBhdGlibGUgcmVwcmVzZW50YXRpb25zDQo+PiAr
ICAgICAgIChpLmUuLCBoYXZpbmcgdGhlIHNhbWUgc2l6ZSBhbmQgbWVtb3J5IGxheW91dCkgZm9y
ICcodm9pZCAqKScsIHVuc2lnbmVkDQo+PiArICAgICAgIGxvbmcsIGFuZCBmdW5jdGlvbiBwb2lu
dGVycywgZW5hYmxpbmcgc2FmZSBjb252ZXJzaW9ucyBiZXR3ZWVuIHRoZXNlIHR5cGVzDQo+PiAr
ICAgICAgIHdpdGhvdXQgZGF0YSBsb3NzIG9yIGNvcnJ1cHRpb24uIFRoZSBjb21waWxlLXRpbWUg
YXNzZXJ0aW9ucyAoQlVJTERfQlVHX09ODQo+PiArICAgICAgIG1hY3JvKSBpcyBpbnRlZ3JhdGVk
IGludG8gJ3hlbi9jb21tb24vdmVyc2lvbi5jJyB0byBjb25maXJtIGNvbnZlcnNpb25zDQo+PiAr
ICAgICAgIGNvbXBhdGliaWxpdHkgYWNyb3NzIGFsbCB0YXJnZXQgcGxhdGZvcm1zLg0KPiANCj4g
QXMgeW91IHVzZSAoYW5kIG1lYW4pIHBsdXJhbCwgcy9pcy9hcmUvID8gSSBhbHNvIHRoaW5rIHRo
ZSAiVGhlIiBhdCB0aGUgc3RhcnQNCj4gb2YgdGhlIHNlbnRlbmNlIHdhbnRzIGRyb3BwaW5nLg0K
T2suDQoNCj4gDQo+IEZ1cnRoZXIsIHdoeSB0aGlzIHZlcnkgZGlzc2ltaWxhciB3b3JkaW5nIGNv
bXBhcmVkIHRvIHdoYXQncyBzYWlkIGFib3V0DQo+IGNvbnZlcnNpb25zIF9mcm9tXyBmdW5jdGlv
biBwb2ludGVyIHR5cGVzPw0KRG8geW91IG1lYW4gdGhlIGZvbGxvd2luZyB3b3JkaW5nIHNob3Vs
ZCBiZSBwbGFjZWQgaW5zdGVhZCAodG8gYmUgDQpzaW1pbGFyIHdpdGggcHJldmlvdXMgb25lKT8N
Cg0KIkNvbnZlcnNpb25zIGZyb20gdW5zaWduZWQgbG9uZyBvciAodm9pZCAqKSB0byBhIGZ1bmN0
aW9uIHBvaW50ZXIgZG8gbm90IA0KbG9zZSBhbnkgaW5mb3JtYXRpb24sIHByb3ZpZGVkIHRoYXQg
dGhlIHNvdXJjZSB0eXBlIGhhcyBlbm91Z2ggYml0cyB0byANCnJlc3RvcmUgaXQuIg0KDQpBbmQg
d29yZGluZyBhYm91dCAiQUJJLCBjb21waWxlci4uLiIgc2hvdWxkIGJlIG9ubHkgaW4gY29tbWl0
IG1lc3NhZ2U/DQoNCj4gDQo+IEFuZCB0aGVuIC4uLg0KPiANCj4+IC0tLSBhL3hlbi9jb21tb24v
dmVyc2lvbi5jDQo+PiArKysgYi94ZW4vY29tbW9uL3ZlcnNpb24uYw0KPj4gQEAgLTIxNyw2ICsy
MTcsMTcgQEAgdm9pZCBfX2luaXQgeGVuX2J1aWxkX2luaXQodm9pZCkNCj4+ICAgI2VuZGlmIC8q
IENPTkZJR19YODYgKi8NCj4+ICAgfQ0KPj4gICAjZW5kaWYgLyogQlVJTERfSUQgKi8NCj4+ICsN
Cj4+ICtzdGF0aWMgdm9pZCBfX2luaXQgX19tYXliZV91bnVzZWQgYnVpbGRfYXNzZXJ0aW9ucyh2
b2lkKQ0KPj4gK3sNCj4+ICsgICAgLyoNCj4+ICsgICAgICogVG8gY29uZmlybSBjb252ZXJzaW9u
IGNvbXBhdGliaWxpdHkgYmV0d2VlbiB1bnNpZ25lZCBsb25nLCAodm9pZCAqKQ0KPj4gKyAgICAg
KiBhbmQgZnVuY3Rpb24gcG9pbnRlcnMgZm9yIGFsbCBzdXBwb3J0ZWQgYXJjaGl0ZWN0dXJlcy4N
Cj4+ICsgICAgICovDQo+PiArICAgIEJVSUxEX0JVR19PTihzaXplb2YodW5zaWduZWQgbG9uZykg
IT0gc2l6ZW9mKHZvaWQgKCopKHZvaWQpKSk7DQo+PiArICAgIEJVSUxEX0JVR19PTihzaXplb2Yo
dm9pZCAqKSAhPSBzaXplb2Yodm9pZCAoKikodm9pZCkpKTsNCj4+ICt9DQo+IA0KPiAuLi4gSSdt
IHVuY29udmluY2VkIGNoZWNraW5nIG1lcmVseSB0aGUgc2l6ZXMgaXMgc3VmZmljaWVudC4gT24g
YXJjaGl0ZWN0dXJlcw0KPiBpbnZvbHZpbmcgZnVuY3Rpb24gZGVzY3JpcHRvcnMgKGUuZy4gaWE2
NCkgY29udmVydGluZyBpbiB0aGlzIGRpcmVjdGlvbiBpcw0KPiBzYWZlIG9ubHkgaWYgZWFybGll
ciBvbiB0aGUgdmFsdWUgd2FzIG9idGFpbmVkIGFzIHRoZSByZXN1bHQgb2YgYSBjb252ZXJzaW9u
DQo+IGluIHRoZSBvcHBvc2l0ZSBkaXJlY3Rpb24gKGFuZCBhbGwgb2YgdGhpcyB3aXRoaW4gYSBz
aW5nbGUgY29tcG9uZW50LCB3aGljaA0KPiBvZiBjb3Vyc2UgaXMgZ3VhcmFudGVlZCBmb3IgWGVu
KS4NCkFzIEkga25vdyBtYWlubGluZSBYZW4gZG9lc24ndCBzdXBwb3J0IElBLTY0IGN1cnJlbnRs
eSAodGhpcyBzdXBwb3J0IHdhcyANCmRyb3BwZWQpLg0KV2h5IHdlIHN0aWxsIG5lZWQgdG8gbWVu
dGlvbiBhYm91dCBJQS02NCBoZXJlPw0KDQpBbnl3YXkuLi4NClllcywgdGhpcyBkZXZpYXRpb24g
d291bGRuJ3Qgd29yayB3aXRoIGFyY2hpdGVjdHVyZXMgd2hlcmUgdGhlIA0KcmVwcmVzZW50YXRp
b24gb2YgYSBmdW5jdGlvbiBpbnZvbHZlcyBtb3JlIHRoYW4ganVzdCBpdHMgYWRkcmVzcyAoZS5n
LiANCklBLTY0KS4gSWYgbm90IHByb3ZlZCB0aGF0IHN1Y2ggY29udmVyc2lvbiBpcyBzeW1tZXRy
aWMuDQoNClByb2JhYmx5LCBhZGRpdGlvbmFsIGd1YXJkIG1heSBiZSBhZGRlZCBiZWxvdyB0byBl
eGNsdWRlIHN1Y2ggDQphcmNoaXRlY3R1cmVzIChlLmcuIElBLTY0KToNCg0Kc3RhdGljIHZvaWQg
X19pbml0IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fzc2VydGlvbnModm9pZCkNCnsNCiNpZiBkZWZp
bmVkIChfX0lBNjRfXykgfHwgZGVmaW5lZCAoX19pYTY0X18pDQojZXJyb3IgIkNvbnZlcnNpb25z
IHRvIGZ1bmN0aW9uIHBvaW50ZXIgaXNuJ3Qgc2FmZSAtICBhcmNoaXRlY3R1cmUgdXNlcyANCmZ1
bmN0aW9uIGRlc2NyaXB0b3JzLiINCiNlbmRpZg0KDQogICAgIEJVSUxEX0JVR19PTihzaXplb2Yo
dW5zaWduZWQgbG9uZykgIT0gc2l6ZW9mKHZvaWQgKCopKHZvaWQpKSk7DQogICAgIEJVSUxEX0JV
R19PTihzaXplb2Yodm9pZCAqKSAhPSBzaXplb2Yodm9pZCAoKikodm9pZCkpKTsNCn0NCg0KQnV0
IGlmIHNvbWVvbmUgcmVhbGx5IHdpbGwgdHJ5IHRvIHJ1biBYZW4gb24gc3VjaCBwbGF0Zm9ybSwg
dGhlIGJ1aWxkIA0Kd2lsbCBmYWlsLg0KDQpPciBqdXN0IG1lbnRpb24gZXhwbGljaXRseSB0aGF0
IG90aGVyIGFyY2hpdGVjdHVyZXMgKGUuZy4sIElBLTY0KSBtaWdodCANCm5vdCBiZSBzYWZlIGZv
ciBzdWNoIGNvbnZlcnNpb25zPw0KDQpEbXl0cm8uPg0KPiBKYW4NCg==

