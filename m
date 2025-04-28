Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C831A9EAA5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 10:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970285.1359012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Jk4-0001jk-FV; Mon, 28 Apr 2025 08:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970285.1359012; Mon, 28 Apr 2025 08:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Jk4-0001iF-Cb; Mon, 28 Apr 2025 08:21:32 +0000
Received: by outflank-mailman (input) for mailman id 970285;
 Mon, 28 Apr 2025 08:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVu+=XO=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9Jk3-0001i9-N9
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 08:21:31 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20605.outbound.protection.outlook.com
 [2a01:111:f403:2606::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c92b4945-2409-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 10:21:29 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM7PR03MB6167.eurprd03.prod.outlook.com
 (2603:10a6:20b:139::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 08:21:23 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8678.027; Mon, 28 Apr 2025
 08:21:22 +0000
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
X-Inumbo-ID: c92b4945-2409-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnwkVUTh3CdmJqem8fCowdYhXL7OWFY+fsD/9an+K1jsvJvrjljMsjo1jO3JYTDfkFXADiXjWI6jltVxASk0qH132MN3mDQrLzlu4GfTC76gNO5+jP5RlfpVY8OpPHCN3QYq3bysTUmfK9zkwAFlmS89RUlg0dge0Kux1UIs8kU2BNQkWUgPSOcSoBVEnE0xJ/QJnjmSz1jTJb0NfYObita430GavBnbf2/zHBV5onNfLvbn2mvAWhPbrnbITmFZrILzNzk/QPH4O6x45CtYjX17g6PGHqxbEPNjO0y3gRFX8E8L3JUGG3swKAx2X31/GgqqH5OcU2b6hvDfYDK2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLFjJXWNZROyJttk8awDXM7dPrlSy432qPpUh0s+Av8=;
 b=ZR5Ao6OoOg4RpQUnfAntFCh0ksVxB/n5HxmKvzJB8vrb7gUmRo9VKRwvuIZtXo32eG9rAT7ZqhP94Pd5dZ9g3cfNS8wb3d6kTfhw7WZhGOYGbjh0RClWCm0iI12mpf0u+LdlE0A4MYcwgGjgDqP85N6lwZUF6/oSI9OXSF6LdqV2UuBFsxIohhDj46UWc3VGIowgHDtgoHNArq9F2Gr52CBXDW7LUeKxAL4zt80VC/U/EqVGZHB6on2kdfviBmgip3vfgcnNDLhb+QHoEK1nJij6Y6fbDsfqIylYSwknKcKQ8v0jzcXhPDdDuQhVJozUPwXWxbdrZKjVrIfD2ppmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLFjJXWNZROyJttk8awDXM7dPrlSy432qPpUh0s+Av8=;
 b=DCjJRYytiPmqSQuXBILk0OKRiajvHFW4YI7JQMXhPFPpZdyfpVkJ8b4cIGh+sS+TO7t0EoEqFc9mTZm0Nr82HqOKDQikssyfBXkqBGl/nP9DTfI0+lkOlFZ3DbcA5TWYQZ93/aczaIzsdCWlnvs82hpJrgGi6hVxyzPtKu3+G1yK3guw5h9CHbZBkEQ5cZ+EQlZAk8afgvGtoSlV7JW2oQRs4cRVkeSze5Wa6KrH+KKn17gjoF2V1DXGUGdOFPT/kbDRfkAEQN6kUF+Uv84CQ19w5fU2XPIhQ1853PqxoHOceLMcGC40h+JT22+G6QPCuC6PiG62+qbpAN0yHp1JSQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHblOXdxbIbbkNtn0WSg/9tW2OJ47N3cuWAgEGQWoA=
Date: Mon, 28 Apr 2025 08:21:22 +0000
Message-ID: <c33b906f-f9cb-45e5-ac84-28dc687a6f7a@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7fa0bde7-3aa9-48f4-a0ed-d03216edcc4e@suse.com>
In-Reply-To: <7fa0bde7-3aa9-48f4-a0ed-d03216edcc4e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM7PR03MB6167:EE_
x-ms-office365-filtering-correlation-id: bf923264-8ea4-4110-628f-08dd862da93e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cU42TGovT2FScXUwdVVWckVYb1diVDFER3RWcVdOcVdWZ2dWbGdZeXRKbFAw?=
 =?utf-8?B?VjRDSlRLVWFKNHQ5Y0lDMXV5RWJFeng0a3JCeTNETWVWV1F5S25mTmVWTXB6?=
 =?utf-8?B?NzVHcG1WL2pWcThaRWZhMHhnZE1UWC9jY3poTTJmcHFhUHFUcWQ2QkwzV2VZ?=
 =?utf-8?B?bDJabm9aSHpzZ21DcnNGNktWWmdIRm83RzdadXZPUmlpYmU4MmtOY1JRVmts?=
 =?utf-8?B?bCtZb1o0bXhHLzBuSUFYcElWMzZjSWpEa0hLRllvMTlqdXVHV0dSdHM1RzZH?=
 =?utf-8?B?ajNPQlhCY1piaHgzQkdMNzFEZ2JnZ0pZZ3ZKd3BRVitwQlh5WndNYURqZ3JJ?=
 =?utf-8?B?VXlWcUlJMVhkTUE5cUR6Q2ZOREZVQzZLci9aeDFGVDgvTkUwcmVWSVZTbDhO?=
 =?utf-8?B?T1JPYkczYUJDaWl2cEpnK0x4V2xHTzFpSTBBQlZQWEEyQUFxa0ZZMk90VzVS?=
 =?utf-8?B?M2hWbnNSUUVNMnB6QVRCQkNZaFdvcWtxeFREZ0FGcjlUejJQRVFNN2FhRHZI?=
 =?utf-8?B?V1VqOGQvZ1ZMV0hpazJoN0VYdmFzVnlMZ0tJd256TUoxVXdOWXg4ZDF2eS9W?=
 =?utf-8?B?UHcxS1drZG41clRFTmV6YVdNc2FMQmtQMjIxSjlUNEZ4NENNVE5vcytDZGVt?=
 =?utf-8?B?T2xGSVFpZkxURW5Wb2Zycld1b2NEekM3L2gwcXNzWXpuNmZhamhKZjR0K29S?=
 =?utf-8?B?Q2taeVpHVUIrYUtFS0FNOWVUV3duSW1oVU45cSthQkRwSWdubmttclBpajdl?=
 =?utf-8?B?b2hzamdINFpjaDJOUnlHWWZMNWFTWDNrZWJ2b0FZbzJUMTRRYmw4VEgxenB1?=
 =?utf-8?B?TFdZWENwM1FPZGZvdFBOVW1OZXkza1lkbU44bDlZT3QxdlVIb1RvY0gxZU96?=
 =?utf-8?B?U1U2K29HU2VycUF5UmhUVFFmNHNpNlBMWVgwNkFLY2tRNVJpOEl2N3VDWkVn?=
 =?utf-8?B?YlNoQzZsTWZTU0RIQ0tmUk5KOGVLak1SR3NzWGdtc1B3ci84VGtEclVwNWZo?=
 =?utf-8?B?cVhHUE1QOFBrS2t5eEtvNzNzYURTcHV3V3JLOWhxV08yZmtRU29EVXU3c3kr?=
 =?utf-8?B?SlpWS1JwVFhtVUh5WTgyeUE0Z0FpTmpIS29RdjZ0NXNvTnV5Uzd6ZGFpUUtH?=
 =?utf-8?B?QUVuUFNpQlozYUlLVnd0TjUxSnVtZy9nSjhlS3JMK0Rsamd5L2h4WDlmUDU1?=
 =?utf-8?B?cldDTzJiZGl1em10Y3JWeTBEWmw4TmNSWm1lMm4rcmVESWlnZU5tMERCUzJF?=
 =?utf-8?B?MWMwYk1uRzl5Rm5OQ1JQRCtMQlM2Tm9lWTFRRlV5U2QyemRUcEIvNG44UU42?=
 =?utf-8?B?YmRMb3hYeHNMdzFhZjJMRFJoMGR1T0w2cEZmSkdFclZZL3YrYkdTSXd5N0Zu?=
 =?utf-8?B?Ym9reExFSVE4MC9aQWR2Kzl6U2pINk9iTFl3Z2RyN2wxb0l0Wk9OYTRTWGdq?=
 =?utf-8?B?emVlMmZPYXpELzdqcDU2MHkrdG5SL2NpTzAvMWE2NnFuN25tWE9ydlROVjRZ?=
 =?utf-8?B?OE1RbHYzMmd0STNMYjJpVWN1NERSbndkYWhVTkRJODFoVVlNSWhyYVkyZ1FX?=
 =?utf-8?B?VXFXWnQzYTJOM2dieWU4OExWL1pYcWY0Y0Z6VXhJeCtsUzcyRXgwdHVMOHIy?=
 =?utf-8?B?MStET3RNZEhSNFBObzI0dnRJL3RRbjJaRjZYRFdWTHI4RXVackFBU3ordHlr?=
 =?utf-8?B?ZlVSWS9QelpFSEpaVkwyZVVNdXBuSThmcEU0RGJLZytRZ0YrQVA0bS9ES2RR?=
 =?utf-8?B?SmVMdEZvMUlRdkIzc2JpbWpSeDhJUmNzQjh0OGhQVE5wZ0hQejF1UitvMW5m?=
 =?utf-8?B?SHhRTzVzZW03R0c2ZTQ3bHAwU3NFVUlEeUU1bFQwS0lNdExscFdhVjNqZHF3?=
 =?utf-8?B?R0gyMk9DdDV5UDRIL0JEWnJsdVpIVmFuSEFRVWRDTWoyQm81eDZUNTdXUXNk?=
 =?utf-8?B?MGp0RVo2T25nTnpOcU93S3dFVXlNNGRkaGc3dGdZTERwR3BITnU0T0ZpcXk4?=
 =?utf-8?B?T2VkZC9zb2R3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3Z2SE8xalpUeGJNVHJzQUFkYzlueVhmdEdsRklWK0QvTUZqeHRnUTlTK2d2?=
 =?utf-8?B?bHVIajhKaHZYK2wwdEY4ZG5jY0V3RklnRHVDVTJ4V0ZEdDBseTcvV2V4dHl6?=
 =?utf-8?B?YStaUzVFMno4Z0xIRWpwMUQvVkR0MUlCYVpEWDNVeVJ5SE5nQU4rdlEwWnpU?=
 =?utf-8?B?S3cremtaT0FqaVhKckxHdTFzVDN4amVyem15NzJoRlFKazR0MU1VcXY0czhn?=
 =?utf-8?B?cmo4amtVaG8vbHNXMVUxV0Z0bGZXUHBSSkdqM0dJVnVqek1UbkwxNWtCYko1?=
 =?utf-8?B?Ym9CdVJTUzU3MXBmUkw3cWRFSXAxM0htVWQ1MEo3bzB0KzVSTENwK1JVdDlG?=
 =?utf-8?B?aU5OMis4aEloTUFmQnVjY1hyUHR6Vks1SGpHdGIvUXZTMUowdnJ5NDI3Y3V1?=
 =?utf-8?B?TFhtYnMwVldJTkFVcnNTN2VuaXgyb3JZWUxjblpoOWIxUmFSZnZ0TVBTcWRU?=
 =?utf-8?B?c21HTGtLR2RPQk83Y3A4eStoSllXZjI2ZmpGMlJRNDJvODUvMTgyRTdVbSs2?=
 =?utf-8?B?SU1OeG14UENEc2IwYUdhUFFoMnB3bHRpOUtBWGNoVFNZdEJZZjlobWt6WXNo?=
 =?utf-8?B?bjFVdEdWbzEzZDE2S2NSalcyQnVoSUlIUTBXbnJjRklvZk90QUlYcFMvV0RI?=
 =?utf-8?B?THVLYU5Ccm1IQXRDTk5DUDNhYTFwT3IzdURMY0ZGZm1RdVliaXdzeVIyQlRz?=
 =?utf-8?B?ckVucjJMejllNHJHT3hhdU1rQUdkOVVjbEovclcyM005ckpnc3BjLytpRHJm?=
 =?utf-8?B?QzVaUEFjdG1HbW5HTTVRbDkzZFNiM1BDQmlmbTNLSEtvODUxYUtxOTdnOEV6?=
 =?utf-8?B?emVLSXdTeldFTVJqamxLUk1OcXVsL2lvQUFXcGlxVmNadXNpSVc5TjVmeHFZ?=
 =?utf-8?B?aUk4RExaNGV0NzVOQmpSNi95OFRsU0pjZ1hPZDNiQk1idStQMHpMQU04ZnNt?=
 =?utf-8?B?d2dNSU1URlp4WmtoV1JIb3BEa29odU53aENNUVozTlB2WnpzZ1FmQXp5OTlm?=
 =?utf-8?B?REp0cDRhUVB0N05FS3ZYYkd5end2QXRLUVFjV01HQ25TaFdRWW9QalZTQlNu?=
 =?utf-8?B?VFlreFFNSnJ1MFdlcWdyQWRlY3d3SjZVYklFT3Q0aWtJY1lrbGRmN3hsNHYx?=
 =?utf-8?B?ZGZjd0xITmlod1pMZE5mU0hjWUQ4ZUZrMmRKOGErNVdIQ1AzK0ZoaXRmWkc5?=
 =?utf-8?B?WEtMOEVNMkFkZ2lsWnZoRXJVZ0hMenFJSmIrSm85V1czb1lpQmRZZ0hTbnZV?=
 =?utf-8?B?YlVLN0dqR2pqRlhST1YzazJoQlVGa1I1eHJQNG12eDVWcndDKzAyRHMyVDRN?=
 =?utf-8?B?WjJOMU1HYlJvV2RyTy8vUytVaW8xRUxNci9VOGFWdlJBQVlma3RoQnRuZ2lr?=
 =?utf-8?B?ZEhOYmFDb3AvWm16YVh0TEVoL0srYURhaEFLaXJFMmppbHVxdUZMNTh0dW11?=
 =?utf-8?B?ZXZRN080K1czTFJJV25PNmtjd1EvNUthWDd3aXhubGJVbjBRR1VSYzVkTWtJ?=
 =?utf-8?B?ZGY4UTVReFgzNmwvcVdVQmR5dFEyY3pUbnBieUNRWkllb25HNlhKUnVsTzlt?=
 =?utf-8?B?Y01ldEVMMDVhYlNLSVNzNnpsTU1WUnkwYWExWEpoc01pOGhFbUlnajJLaXFE?=
 =?utf-8?B?bGxJRU82Q09ERnZMUDdGMWhBRkNGZm5Bcm4vQ3E5YklpcThhS2Q4VkRVdFVB?=
 =?utf-8?B?VkdVWkMrWEhiM2JhSlp6TlhFTjJ0VXRLRkxGN1UxSWZ5SjF3TDNrTWkrd0Qr?=
 =?utf-8?B?RHdJZnNTR1NTZ21kdzNQd2lCRWpSVzBZc2ZmWWJMYjg4bE54Tm1pTVVWNVFO?=
 =?utf-8?B?T0ltci9LWTkvZXNPeC9ZejJzU2ZFcm1KWTFaUmRleE1oYVBpMHhXUnMrUkpB?=
 =?utf-8?B?dWxqTHNLR0Q1RWZKeDdYQ1dOM2l6aUtUaEJEYytoclJIdlEySTIvSFR3U0ZD?=
 =?utf-8?B?UlFTb3gzQUNNVU8wOEZsQnczQUZQNlNTczZyNzZEOXZrUXBaNVhJemp1ZS82?=
 =?utf-8?B?T1J3LzV3TldyT3dyQjJMakN0VGZkSG94bmMvL2V1d2hNaVJqUkcxbEVtUElx?=
 =?utf-8?B?YzBQd0hjZjBoN25DZW9IWUV5bm9TejJHRjdLSmtrQXRYZHRsYzF1RDR3a0lu?=
 =?utf-8?B?aldMN0ZQRkpLR25uQStoMW9EMkJjS3p2YWVseFE5cnhYOExMT0ppaDZ0VzFy?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D1B1EA721D45345B8BC6DC6AD181B8B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf923264-8ea4-4110-628f-08dd862da93e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 08:21:22.6844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jw/qrFB5l6bbElteBlkDnlKU8zXDlAGwP+4zO1sEmn/+SVocVM+uXMplOkJFfhbO/ayBjQOA6Bm1a3nGZUDJGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6167

T24gMTcuMDMuMjUgMTc6MDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4wMy4yMDI1IDE0
OjM0LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9wY2kvcGNp
LmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9wY2kvcGNpLmMNCj4+IEBAIC0xNiw5ICsxNiwxOCBA
QA0KPj4gICAjaW5jbHVkZSA8eGVuL2RldmljZV90cmVlLmg+DQo+PiAgICNpbmNsdWRlIDx4ZW4v
ZXJybm8uaD4NCj4+ICAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+PiArI2luY2x1ZGUgPHhlbi9p
b21tdS5oPg0KPj4gICAjaW5jbHVkZSA8eGVuL3BhcmFtLmg+DQo+PiAgICNpbmNsdWRlIDx4ZW4v
cGNpLmg+DQo+PiAgIA0KPj4gK2Jvb2wgaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQoYm9vbCBk
b20wKQ0KPj4gK3sNCj4+ICsgICAgaWYgKCBkb20wICkNCj4+ICsgICAgICAgIHJldHVybiBwY2lf
cGFzc3Rocm91Z2hfZW5hYmxlZCB8fCBpb21tdV9lbmFibGVkOw0KPiANCj4gQXMgSSB0aGluayBJ
IHNhaWQgYmVmb3JlIC0gdGhlIGZ1bmN0aW9uJ3MgbmFtZSBub3cgbm8gbG9uZ2VyIGV4cHJlc3Nl
cw0KPiB3aGF0IGl0IHJlYWxseSBjaGVja3MuIFRoYXQgKGltbyBoZWF2aWx5KSBtaXNsZWFkaW5n
IGF0IHRoZSB1c2Ugc2l0ZXMNCj4gb2YgdGhpcyBmdW5jdGlvbi4NCg0KSGkgSmFuLA0KDQpJJ3Zl
IHNwZW50IHNvbWUgbW9yZSB0aW1lIHRoaW5raW5nIGFib3V0IGhvdyB0byBiZXR0ZXIgZGVhbCB3
aXRoIHRoaXMuIA0KSW4gdGhlIGVuZCwgSSB0aGluayB5b3VyIGVhcmxpZXIgc3VnZ2VzdGlvbiBh
Ym91dCBpbnRyb2R1Y2luZyBhIG5ldyBhcmNoIA0Kc3BlY2lmaWMgZnVuY3Rpb24gaXMgdGhlIGJl
c3QgYXBwcm9hY2gsIGJ1dCBJIHdhbnQgdG8gYWdyZWUgb24gdGhlIA0KbmFtaW5nIGJlZm9yZSBz
ZW5kaW5nIG5ldyBwYXRjaGVzLiBXb3VsZCAiYXJjaF9yZXF1aXJlc19wY2lfcGh5c2RldiIgYmUg
DQphbiBhcHByb3ByaWF0ZSBuYW1lIGluIHlvdXIgb3Bpbmlvbj8NCg0KQXQgdGhlIGNhbGwgc2l0
ZXMgaXQgd2lsbCBsb29rIGxpa2UgdGhpczoNCiAgICAgY2FzZSBQSFlTREVWT1BfcGNpX2Rldmlj
ZV9yZW1vdmU6IHsNCiAgICAgICAgIHN0cnVjdCBwaHlzZGV2X3BjaV9kZXZpY2UgZGV2Ow0KDQog
ICAgICAgICBpZiAoICFpc19wY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCgpICYmICFhcmNoX3JlcXVp
cmVzX3BjaV9waHlzZGV2KCkpDQogICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KDQoN
Ci0tIA0KTXlreXRh

