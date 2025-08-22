Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E525B30FFB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 09:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089594.1447119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upLtQ-0003d8-PU; Fri, 22 Aug 2025 07:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089594.1447119; Fri, 22 Aug 2025 07:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upLtQ-0003aj-Mr; Fri, 22 Aug 2025 07:08:56 +0000
Received: by outflank-mailman (input) for mailman id 1089594;
 Fri, 22 Aug 2025 07:08:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jNg=3C=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1upLtP-0003ad-8p
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 07:08:55 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc289575-7f26-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 09:08:53 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU0PR03MB9104.eurprd03.prod.outlook.com (2603:10a6:10:467::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 07:08:50 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 07:08:50 +0000
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
X-Inumbo-ID: dc289575-7f26-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4JpGX0+ox4NfQoy6srFMm+cr9a2t3mAB4OnJl9hlqHceC6H5Q9i2RQUWjH0zEcHvddw6JsKVpU4ZHil61A2xmYu5xMfTbdPA3fGCM7B7yJxyVtuu2TjCSDuPLKwuwY/vh6tzJ/s/JCHsdvFqEyVIiJ5najUuRzpj2GbsZN+lZDGjPWl/ZYX6JPVqeT2uM8TF9Bu9yUtZ0HpDCKqImxXkIkzVZxxnIlX1yY+VHo3jsjGtchXabWr8al+mkOASQ+/IyTQHrfyB+M5bIwkthspiA+KdYqo6mCJTiOf2hL+eXB6Xla4X3/eoq3FEbroofHXQMnFl3CgbdO5/Y2DFjPTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72fKAUjmvNlRtc/KOPe3i3cFF2lgU3oNZ/4aH5s44QE=;
 b=i7+/UiFNiv2zcaVKomJgTMrNX4Xp9ti6qxj09XrRQzvvkV/NhHjJW60Jhra57swwvN/kRgMMQ/FNH6xv1spJGw6oN8N4ynl2vyehEFmjQdYsJIDv4XBwxQRFlQ5jBcdJSUlrY94RSicC1L4zk6oOnwFeDYnKTKWjgz6xHDj2YNEqYGwG/k8zWdjycQ/EaXatLR/FDvJVPmLZbGah+WeFN+wvND/2nWYzFZ7rKpR6X4PgPLCSdlIFcEw8Mq0e9TQlN1LCuROEJg4aMuFauF2Hs1Qj7Xep9EdxVHOoWO4f7rtZUy0dYSOzdiCBfgBp79fkRxtMIAX/a9X3w6nVZmEWTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72fKAUjmvNlRtc/KOPe3i3cFF2lgU3oNZ/4aH5s44QE=;
 b=klXHMtezBeoudNyrc4pD/OdhkuQgoQvGHWZmdThJlg5qB9gPDJT6I41fyailFzhEc9uNaPmSS6zQ/lCjUwyq2BlL9TlhqAGbQRu8ba5gHBmcevASHS4AD3B6tlGehjAoqDpHJ/Qshkn7RYn6GvcKj9y1O4smBfbylN+MfqWP5e1xs105KAjYhnSYPivUdF2EjbexRvl6OON1ClkBL7HGQix7zsot/CDmMyRySIM5Ijhs28eKe0YmmaHZJhsNfaFPcgcfvd3NZ4/b2AKvXnnSiGaVRpdh65Ybn94MgZbvqbwgwgKD4Bh5N8IgqdcHxDnPAGTZ/ZumTBE6RnRqdE5jfw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling
 to support eSPIs
Thread-Topic: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling
 to support eSPIs
Thread-Index: AQHcB5d9D2bB2ytT+0KvuTkMlpIiH7RuWAiA
Date: Fri, 22 Aug 2025 07:08:50 +0000
Message-ID: <93cd9406-030c-4915-b180-1cc90109b7d3@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <abba685916e6637eedbd831352bed2e968eeb7dc.1754568795.git.leonid_komarianskyi@epam.com>
 <87o6s8d3m1.fsf@epam.com>
In-Reply-To: <87o6s8d3m1.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU0PR03MB9104:EE_
x-ms-office365-filtering-correlation-id: 70f0838d-1120-41f2-dfa9-08dde14abee4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WERSVnNSNktpSkwxelJhejcxcGxENVdiOE9IM2NaUmQ3cUFvWTZzaEExL1k1?=
 =?utf-8?B?eWhKYTBRNUFNNGZudUQ2K2ZORjhOcHVKR3drdmYyQWZQQlFjVmkySU9qWmVL?=
 =?utf-8?B?OHBLaGd4NSs2cjlVOXduWHZUQnJxRW4vR1JuNjhkTENjNVkxcnVJSXlMWW41?=
 =?utf-8?B?K1V5QnhPVUZCZkZIdWZjL1NaMEVOcy9CSDA4SHZuMzBTMzJzc0k5TGNjOWtw?=
 =?utf-8?B?dkZtMVJYdHltb2p6QjlCY3hTbUFYV3d5cG5MUm1pUkVJdDYxRDdaL0xOZVRF?=
 =?utf-8?B?VWFyc2RVZ3hnV0FUQmRuSlpuR3lZTTllRkZuK3FhOW1mMUJQK2NtM05aSlM4?=
 =?utf-8?B?WW83UWpaUkRXYjhlWlVjTDJvZ081QnFYenpHSTI0NTd2cXoyVHJtTGdNTGZn?=
 =?utf-8?B?dHZ2VFBXN2ZRanhvcjZpaWFWZFFMaDhjOHpPWENoUTd2NUxldjFyelRjOHNl?=
 =?utf-8?B?cnlmQ2kyaDFPRDBIUW9QYVZRUkxva1VFYjNMUDJUUW1xNWdRT3pGVDFrQ09O?=
 =?utf-8?B?Wmx0UVhCVUlRNFNRc0tiN29ETStSYktLa2dsUkRzZDg3ODZwZFhNT2JYY0I4?=
 =?utf-8?B?T1RRRUZKV2ZSQnpORWxZTnl3WExIdENENGgyY3NsR2NraHJrS21idnAyOHdk?=
 =?utf-8?B?c3MvZ1NUU21nVEh0Z3hOOFBvZngyZ28zTG1XTkRENXdiT28zN0JsS0RCVFZ3?=
 =?utf-8?B?TUtSMnB1Tkk1ZnhXMnZNZXRLN044Ulcyc05pV2F1SC9xM3JNL1BPdVRFTnlW?=
 =?utf-8?B?WGhhUktYc01BTHVham9LVGMwSFZ4SmJ3cFBMOWRuaXZLWHQ3UitLL1M0MHRQ?=
 =?utf-8?B?ZmVBV29EQVpoVnBJVnhEREpPeEJ3cnp5a2RtVmlQT2NzQmx4QlEyL3NOTWpI?=
 =?utf-8?B?ZkNPa09LRGthejBjWWFEbHdKdUhkTm90Qi8vaXU4U2ZZYkN0bXNVT2owTzls?=
 =?utf-8?B?aTFnMHFYV3F2T0s2Rkd5VG5QWGhyN3lZYXFrUExoWmJVTWFvQXhieXNHNG9p?=
 =?utf-8?B?bU5GRHFxNDZoUzVmRU95TTZISkF1T1pNRnJNTTk5MmkzRlAxSkE5aHY2MVJ2?=
 =?utf-8?B?Kzl2Z3EyblBDLzVuWVVzZE95VUp0S2M5aXJJaHBHS1A5NVBqOHhsQjVxSTgr?=
 =?utf-8?B?TlpJNXJiejEzWFBXKzA2cmlpeE85WlgrS3QxSnBheksyZFhOdlRTTitBMHkw?=
 =?utf-8?B?QXQ5VDdMQlJIckNyYWJucTcrbFBmdDJPdUZnSkdHbHFSY1lvNTJNMENaYWhQ?=
 =?utf-8?B?VWtUMlNCeFBvQldVSHV2NGJHdFkzVGRKeEViSE5CaUxqKy9ORnlvL0FmMXFp?=
 =?utf-8?B?OVZ6MnAzMEQ1WTQyaXhyVmthaUNIZ1BSOG9ucC9UN0tXOFFvVVJ0NC9XUm45?=
 =?utf-8?B?Z1BNSG5xMysxaW5KWTRJZ3pIOTFEYXQzRWlubTVQTDEvWEhvWFJaNWdETGxO?=
 =?utf-8?B?VGRqUzRoZUd2WGVzU1k2M0hER2EzRXU3RVEzdkNkVkJCT1plQzRoSjFJc0Qz?=
 =?utf-8?B?TjFTOHYxVDRkNXIrMmhzeGhFRHYxYStTQ2ZwWUUzTHJWelNQRnQxUDlOeWtx?=
 =?utf-8?B?K2N3Y3lEWXJKa2FkeTVUYWZZbWl4Qm1OWnhOaU92c3ErdXl2ays0WWRrY3RR?=
 =?utf-8?B?U3BlUFV5eElQbVpPN3F5QWMxVHVJTnZsdUxHTUVKaDBLcC9UQ1N1eWFHb3ds?=
 =?utf-8?B?dmlZLzExT3dkQTRqeDdSajJuNHlQelVHTy9sLzZ4Vk5kQXlTUlFxdWVnc0lO?=
 =?utf-8?B?bXVVUEN0YTJvVTVRczdWamQ0VDFrVXJxckZlSTA2a0dJVWRlNisvbWRKaE9x?=
 =?utf-8?B?OW5oamZkM3NzcGJMTDU2eVNQRG5LNWxPeVlxQWJ0ejlLWFp4NG03b3RZQjRx?=
 =?utf-8?B?c0VoZndrYzN4cHVLSGVKUTFJVXN4MTZwSnBwc2FveHkwZ0xneUhxM0NLYnNJ?=
 =?utf-8?B?QVl4Vk0vcDFJU0xKWmg2SG1iL3BOT3dweEVvQTdRdGRYUnlwUXltTEhqNEov?=
 =?utf-8?B?c3RpUlczL0pnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHhwY1FVYXgyMzhFSmJLZTVoUjZ4QS9BQmNzLzBrOG9ucFZPZFV4UzZPTGln?=
 =?utf-8?B?SlJwNTlDaFo0cEpCMURpN0lESm0ySUhpVGdaeHhOTUo3NzBuc0FRODBCbVI4?=
 =?utf-8?B?THR5K0hTMHVSRjFoL244M1ZVQjJOdXVzVVlCeXBUN3A4amtZRnY5OWFqNlJB?=
 =?utf-8?B?UDMrbXRpbTV1V1BRNFVTRXJLekY2emFMeTZrZDJZTndIR25mVnVBU1ljQzBS?=
 =?utf-8?B?ME9FcTY0Ym9FTDdHV2NUTC90VXUrTFZrWU5jSHhKQlc0enlKckhwK1hyS2ZY?=
 =?utf-8?B?YkE3aGlQWnF1T1NpNUlmMzErM29MWTc1UkRMYnVpMnBob1Q2aHZDQTIwL2dx?=
 =?utf-8?B?KzhhdVY1WTlIZTFkcVFINThUMld2YVhJVmhBRUlBWk5pUWhrRFlZTVh4cXpl?=
 =?utf-8?B?L1QzK2ZwTkJwaDdyY3prN2tqZlZHRERmK1h6czBKVnF3REZDbk4yNkt6M1ly?=
 =?utf-8?B?d0hYaThRZHU2czFVanZ2YUV3andsb0tVbUMrOVcvRlNrbmZYTVBjQjVDTW5S?=
 =?utf-8?B?RjFnbjFydkE3ODRXV3pyaTNpZVhsMGNvbk4rQXhLYnBDNVlnZjhkTnVxWFFT?=
 =?utf-8?B?MmE4SXBqTjZ2QzlHZmdDUlN6UnVSei9RVjBwTHozMWduR092WWQwdFRHUldN?=
 =?utf-8?B?dXpzcFNZQXZjdTJwTFUvRlU2OHVQM3lpSGp6Z1RORVkwT1VrZ0ZVaGdDVkNK?=
 =?utf-8?B?dXRhWUZYU3hqc1BESytaeXU4L2QyUHdBV1dxVlpsMk1KSjZnZS9DcWxjY0lr?=
 =?utf-8?B?bXp2NytJcDdyeGt6dzFaTHZXLzBXM0RqUVZZZEtFOEthaEo4Ly9rMjIvZ3dk?=
 =?utf-8?B?enRoZGhuZnZXVFB6YlVXeS9HM2grYzd2bVVhSmFhU3RTdnJFL09qSE92U1FZ?=
 =?utf-8?B?K2owd1lHQk1qOW9KazRscG9wa3RRelVRNTdvV3FnWlBNMUVyQ095ZUNvVzFF?=
 =?utf-8?B?RkMxMlhCSjVPMzh2eFpJd21OUjZKVmp2aFd6aitQUU40N1JycUg3Y3ZMQTB1?=
 =?utf-8?B?MUM2Wkx3KzBwbE5CMkFWaFZPQ2dRL2ZoWkQ4blRNVmcrSGlUQ3JicVpnVFZL?=
 =?utf-8?B?NEZHZjQrRlFTTE42aWw0NFdJRHhtUTliY09kM1l3cEpKbnJ1SmhZYVlheTVz?=
 =?utf-8?B?b2pLMFdhVmdsRitvMTF6WDdzN0JNbFhGWUN2VnpzY2lncUo1SEQ0K045bEh6?=
 =?utf-8?B?UEl5VzVyWThNQldoOUZJZWM2OEFnaGNrQ0IrNGt5ckswaG5LclBETEE5QnFI?=
 =?utf-8?B?cnZEZXQvMUpDZXgwRW9sUm1wN3o5STZZaSsyUlJQTmZQZFBTMU1UQlVTTzJB?=
 =?utf-8?B?NEc3QWFKVHo2d20weHhMWU02TzQ1aUNvQ1J6MkNqRndWb29pODVCWDl6eENI?=
 =?utf-8?B?NzdheUYyTW9EZVdpd3JLODQyYzNyZWFKaENnYzJIUDhsL1VZaG0xdUVXVktr?=
 =?utf-8?B?bWZPNmdkMzg4WmxvY0hSVW53ejNZVFd5L3Z5MjIwd3psWGpCMU1zQzZOMldu?=
 =?utf-8?B?VEZoejE3cVI2Z3Q0NlBvNHJBK2V3cjdPUytjTmNrSjBpSzN4a0lVdUx3MmtG?=
 =?utf-8?B?clNBQzU3RWYxQmFwY1dkZTJRMndRZXVjZ0NPZG5NT2hJZVkxdWVWamJTTjlP?=
 =?utf-8?B?R29TSEp3VDhzL1lOYTBFb21NSmlvM2dmbFRvVkdmWk5jNHFLZlRYMlNWL2Vt?=
 =?utf-8?B?bC9BSnZtSGI3dVJCQjI1VEtUSEc0TXpWQS9iMFkyckJPZkhIQWRMaUd4MVpP?=
 =?utf-8?B?R1V3YisxVGJ4OWRIZEQ0UlNERDBjaUdVdnYwWHJRejF6MHFMVmRpMVlyWCtw?=
 =?utf-8?B?cGdDVXU4UFMxREVZV3RsWnl1bVFHMWdXV054RXliTTFGTHVoRllhQWRrSW1G?=
 =?utf-8?B?V2gzN1FzSDM5bG10TnpSOEJIWmgvTHdWYUhUZ2hXUnRoUklMcXhUa2JsUEp2?=
 =?utf-8?B?Y1ZPeCtUWDBUYm0vaUJNNHpmK3ZRN2pKMkNvM0RPWjEzV3Q4Q1lhQU9TdTk5?=
 =?utf-8?B?cW5SQitLRFZxdlpXV2s1T09MbDZndXBQYUx5UzZhNzRrV0F3RXVZMEpLQnQ1?=
 =?utf-8?B?VEJTSFlCblQvZTJNeWVpdytBenh3KzlhenB5TjJTVHdaOE5UWUJ5NDNpaWw0?=
 =?utf-8?B?N3JqU3VOcFhmTlppVTRyd21MTGtoQW12NHYzbEpIVmpQRXo0Nis0VGJKTkQx?=
 =?utf-8?Q?sdRyYt7xXSyJYO4E0MQljcQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FDCA9C1FF439B4691F3A5D80570519E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f0838d-1120-41f2-dfa9-08dde14abee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 07:08:50.2492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjJ4/qvGgo/H/NcpIw/eMK/CBeePiyTc1GZfcKkAw3Ur/1TUxhBkOpQZFKIWnMqXaLGvT5+Zu0gArvl0QfUAq+tKObRUKcdhyfLh065Syxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9104

SGkgVm9sb2R5bXlyLA0KDQpPbiAyMS4wOC4yNSAxOTo0NiwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6DQo+IA0KPiANCj4gDQo+IExlb25pZCBLb21hcmlhbnNreWkgPExlb25pZF9Lb21hcmlhbnNr
eWlAZXBhbS5jb20+IHdyaXRlczoNCj4gDQo+PiBUaGUgRG9tMCBjb25maWd1cmF0aW9uIGxvZ2lj
IGluIGNyZWF0ZV9kb20wKCkgaGFzIGJlZW4gdXBkYXRlZA0KPj4gdG8gYWNjb3VudCBmb3IgZXh0
ZW5kZWQgU1BJcyB3aGVuIHN1cHBvcnRlZCBieSB0aGUgaGFyZHdhcmUgYW5kDQo+PiBlbmFibGVk
IHdpdGggQ09ORklHX0dJQ1YzX0VTUEkuIFRoZXNlIGNoYW5nZXMgZW5zdXJlIHRoZSBwcm9wZXIN
Cj4+IGNhbGN1bGF0aW9uIG9mIHRoZSBtYXhpbXVtIG51bWJlciBvZiBTUElzIGFuZCBlU1BJcyBh
dmFpbGFibGUgZm9yIERvbTAuDQo+Pg0KPj4gV2hlbiBlU1BJcyBhcmUgc3VwcG9ydGVkIGJ5IHRo
ZSBoYXJkd2FyZSBhbmQgQ09ORklHX0dJQ1YzX0VTUEkgaXMNCj4+IGVuYWJsZWQsIHRoZSBtYXhp
bXVtIG51bWJlciBvZiBlU1BJIGludGVycnVwdHMgaXMgY2FsY3VsYXRlZCB1c2luZw0KPj4gdGhl
IEVTUElfQkFTRV9JTlRJRCBvZmZzZXQgKDQwOTYpIGFuZCBsaW1pdGVkIGF0IDEwMjQsIHdpdGgg
MzIgSVJRcw0KPj4gc3VidHJhY3RlZC4gVG8gZW5zdXJlIGNvbXBhdGliaWxpdHkgd2l0aCBub24t
RG9tMCBkb21haW5zLCB0aGlzDQo+PiBhZGp1c3RtZW50IGlzIGFwcGxpZWQgYnkgdGhlIHRvb2xz
dGFjayBkdXJpbmcgZG9tYWluIGNyZWF0aW9uLCB3aGlsZQ0KPj4gZm9yIERvbTAgaXQgaXMgaGFu
ZGxlZCBkaXJlY3RseSBkdXJpbmcgVkdJQyBpbml0aWFsaXphdGlvbi4gSWYgZVNQSXMNCj4+IGFy
ZSBub3Qgc3VwcG9ydGVkLCB0aGUgY2FsY3VsYXRpb24gZGVmYXVsdHMgdG8gdXNpbmcgdGhlIHN0
YW5kYXJkIFNQSQ0KPj4gcmFuZ2UsIHdpdGggYSBtYXhpbXVtIHZhbHVlIG9mIDk5MiBpbnRlcnJ1
cHQgbGluZXMgYXMgaXQgd29ya3Mgbm93Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IExlb25pZCBL
b21hcmlhbnNreWkgPGxlb25pZF9rb21hcmlhbnNreWlAZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+
PiBDaGFuZ2VzIGluIFYyOg0KPj4gLSBubyBjaGFuZ2VzDQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jICAgICB8IDEwICsrKysrKysrKysNCj4+ICAgeGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL3ZnaWMuaCB8IDExICsrKysrKysrKysrDQo+PiAgIDIgZmlsZXMgY2hhbmdl
ZCwgMjEgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+IGluZGV4IGQ5MWE3
MWFjZmQuLmZhNWFiZjJkZmIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4gQEAgLTIwNTUs
NiArMjA1NSwxNiBAQCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tMCh2b2lkKQ0KPj4gICAgICAgLyog
VGhlIHZHSUMgZm9yIERPTTAgaXMgZXhhY3RseSBlbXVsYXRpbmcgdGhlIGhhcmR3YXJlIEdJQyAq
Lw0KPj4gICAgICAgZG9tMF9jZmcuYXJjaC5naWNfdmVyc2lvbiA9IFhFTl9ET01DVExfQ09ORklH
X0dJQ19OQVRJVkU7DQo+PiAgICAgICBkb20wX2NmZy5hcmNoLm5yX3NwaXMgPSBWR0lDX0RFRl9O
Ul9TUElTOw0KPj4gKyNpZmRlZiBDT05GSUdfR0lDVjNfRVNQSQ0KPj4gKyAgICAvKg0KPj4gKyAg
ICAgKiBDaGVjayBpZiB0aGUgaGFyZHdhcmUgc3VwcG9ydHMgZXh0ZW5kZWQgU1BJcyAoZXZlbiBp
ZiB0aGUgYXBwcm9wcmlhdGUgY29uZmlnIGlzIHNldCkuDQo+PiArICAgICAqIElmIG5vdCwgdGhl
IGNvbW1vbiBTUEkgcmFuZ2Ugd2lsbCBiZSB1c2VkLiBPdGhlcndpc2Ugb3ZlcndyaXRlIHRoZSBu
cl9zcGlzIHdpdGggdGhlDQo+PiArICAgICAqIG1heGltdW0gYXZhaWxhYmxlIElOVElEIGZyb20g
ZVNQSSByYW5nZS4gSW4gdGhhdCBjYXNlLCB0aGUgbnVtYmVyIG9mIHJlZ3VsYXIgU1BJcyB3aWxs
DQo+PiArICAgICAqIGJlIGFkanVzdGVkIHRvIHRoZSBtYXhpbXVtIHZhbHVlIGR1cmluZyB2R0lD
IGluaXRpYWxpemF0aW9uLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKCBnaWNfbnVtYmVyX2Vz
cGlzKCkgPiAwICkNCj4+ICsgICAgICAgIGRvbTBfY2ZnLmFyY2gubnJfc3BpcyA9IFZHSUNfREVG
X05SX0VTUElTOw0KPj4gKyNlbmRpZg0KPj4gICAgICAgZG9tMF9jZmcuYXJjaC50ZWVfdHlwZSA9
IHRlZV9nZXRfdHlwZSgpOw0KPj4gICAgICAgZG9tMF9jZmcubWF4X3ZjcHVzID0gZG9tMF9tYXhf
dmNwdXMoKTsNCj4+ICAgDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L3ZnaWMuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS92Z2ljLmgNCj4+IGluZGV4IDlmYTQ1
MjMwMTguLjExN2IzYWE5MmMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vdmdpYy5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vdmdpYy5oDQo+PiBA
QCAtMzUzLDYgKzM1MywxNyBAQCBleHRlcm4gdm9pZCB2Z2ljX2NoZWNrX2luZmxpZ2h0X2lycXNf
cGVuZGluZyhzdHJ1Y3QgdmNwdSAqdiwNCj4+ICAgLyogRGVmYXVsdCBudW1iZXIgb2YgdkdJQyBT
UElzLiAzMiBhcmUgc3Vic3RyYWN0ZWQgdG8gY292ZXIgbG9jYWwgSVJRcy4gKi8NCj4+ICAgI2Rl
ZmluZSBWR0lDX0RFRl9OUl9TUElTIChtaW4oZ2ljX251bWJlcl9saW5lcygpLCBWR0lDX01BWF9J
UlFTKSAtIDMyKQ0KPj4gICANCj4+ICsjaWZkZWYgQ09ORklHX0dJQ1YzX0VTUEkNCj4+ICsvKg0K
Pj4gKyAqIFJldHVybnMgdGhlIG1heGltdW0gZVNQSSBJTlRJRCBzdWJ0cmFjdGVkIGJ5IDMyLiBG
b3Igbm9uLURvbTAgZG9tYWlucywgdGhlDQo+PiArICogdG9vbHN0YWNrIGFwcGxpZXMgdGhlIHNh
bWUgYWRqdXN0bWVudCB0byBjb3ZlciBsb2NhbCBJUlFzLiBXZSB3aWxsIGFkZCBiYWNrDQo+PiAr
ICogdGhpcyB2YWx1ZSBkdXJpbmcgVkdJQyBpbml0aWFsaXphdGlvbi4gVGhpcyBlbnN1cmVzIGNv
bnNpc3RlbnQgaGFuZGxpbmcgZm9yIERvbTANCj4+ICsgKiBhbmQgb3RoZXIgZG9tYWlucy4gRm9y
IHRoZSByZWd1bGFyIFNQSSByYW5nZSBpbnRlcnJ1cHRzIGluIHRoaXMgY2FzZSwgdGhlIG1heGlt
dW0NCj4+ICsgKiB2YWx1ZSBvZiBWR0lDX0RFRl9OUl9TUElTIHdpbGwgYmUgdXNlZC4NCj4+ICsg
Ki8NCj4+ICsjZGVmaW5lIFZHSUNfREVGX05SX0VTUElTIChFU1BJX0JBU0VfSU5USUQgKyBtaW4o
Z2ljX251bWJlcl9lc3BpcygpLCAxMDI0VSkgLSAzMikNCj4gTmFtZSBvZiB0aGUgZGVmaW5lIGlz
IHdyb25nLCBhcyBpdCBpcyBub3QgbnVtYmVyIG9mIGVTUElzLiBBY3R1YWxseSwgdGhpcyBpcw0K
PiBtYXhpbXVtIFNQSSAoaW5jbHVkaW5nIGVTUElzKSBudW1iZXIuDQoNCg0KVGhhbmsgeW91IGZv
ciB5b3VyIHJldmlldy4NCldvdWxkIGl0IGJlIG9rYXkgaWYgSSByZW5hbWUgdGhpcyBtYWNybyB0
byBWR0lDX0RFRl9NQVhfU1BJPw0KDQo+IA0KPj4gKyNlbmRpZg0KPj4gKw0KPj4gICBleHRlcm4g
Ym9vbCB2Z2ljX2lzX3ZhbGlkX2lycShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgdmly
cSk7DQo+PiAgIA0KPj4gICBzdGF0aWMgaW5saW5lIGJvb2wgdmdpY19pc19zaGFyZWRfaXJxKHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCB2aXJxKQ0KPiANCg0KQmVzdCByZWdhcmRzLA0K
TGVvbmlkDQo=

