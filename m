Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B112AF10B7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 11:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030823.1404491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuBI-00050W-Tc; Wed, 02 Jul 2025 09:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030823.1404491; Wed, 02 Jul 2025 09:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuBI-0004yf-QW; Wed, 02 Jul 2025 09:55:08 +0000
Received: by outflank-mailman (input) for mailman id 1030823;
 Wed, 02 Jul 2025 09:55:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9+Tq=ZP=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uWuBH-0004yZ-5w
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 09:55:07 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0877c05-572a-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 11:55:04 +0200 (CEST)
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 (2603:10a6:102:32a::16) by AM7PR03MB6625.eurprd03.prod.outlook.com
 (2603:10a6:20b:1b7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 09:55:01 +0000
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673]) by PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673%3]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 09:55:01 +0000
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
X-Inumbo-ID: a0877c05-572a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3/0HCeNSyVdcZNI0+vCp3HtA2PBEOTldaR0jM+GxRDiNdkNhkOoYGJ0p5hZyF+C7dgou6axNzvq/tI/sr9bp4IhQu72zjYCMdO54JlX4UwPcEvGP1ILxkOkKn23QwwIqMvf5AYdybjcqzKQtNosdS9y8rfkYReOUWz9Cwd+AMBWcePpNl+Lly2b5IaFGBEWipLZ4R1XztIl03dewSzDgHLiKEjiQiSdFs6yNKOv0ND8nhCrjnHoeYvCHoXn8qUZe4U6uydb2dVU0S/m/pbp6ta6dUV+LVL9K7frxsxwg5daxnzFnPCR7r+2U/sBTstX8Oc5mxn+DqBrNjgSMwRM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQKjWxgzYT7ygLGRqhhm4QAwqPOwNt5zbZ6JPFLLbd0=;
 b=DLosWPeR8pupYkHOAFKCicBwIMgUXlS1Fef+V+OmIG2hdy/7GAg9YPejn1ECHpyBOirGnlGtmRDbMx1zuRnxrL+jceLjgIY0nc1lsJhXfBPKGScyLeqCdYqRxc2IAkNO/ra2sz9cd7EkqKgCQ9c37dDWL+gWxhE6feqJ2EMDmvI2XnFySDuLz8Ew4qP/bXs/alPr5rpaYbLv0JpvxEI8SHK03dNsjYWrqI1Z6o/XiqNYrY9rWce7aPLRVkSdLsqptUCD8S7c65pxHmlxqtASs2g1bcal8CWPtajfk0isXiMusUD1gbRLCxxzHD6D1X6aS/Zr6K7R9L33AHR/tvMviw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQKjWxgzYT7ygLGRqhhm4QAwqPOwNt5zbZ6JPFLLbd0=;
 b=YYnMMdg9OdBVZ8XispLyYE8MKr1V9718KnkYcw6yyjZ/17dvH0Gu+GpszLPVz9mlBuURzFwItdbiJWbW0aZLHcJiG1mIcTDxL06a1QVwLKFRibXFPpjgMzdTqZiDNj9V0kE28Bnv3Ph3XH4+YXzJiqR/n7wRxiprovRXykP22FWVG6Pm7+qVG9xMpWkZ6FxAe2CdD4fKFq07QsxSpKwvBwW6wjolOgkGMQFIao5xx+ZDtE0BKoJPmuXqlBA7YcZb7DS2L9mbJ+tdv3mCH1f7jIBTsDhsuJantbYsu5sOxPReJgGqXHZBGlHSQ4ke4jEG7NUjNS/NScLh5Tu+seVCtA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "victorm.lira@amd.com" <victorm.lira@amd.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
Thread-Topic: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
Thread-Index: AQHb6zdYR1gSdiVnIUCrYyKDMVwLGw==
Date: Wed, 2 Jul 2025 09:55:01 +0000
Message-ID: <396917b3-b60c-46b4-b599-dd07e7fe5171@epam.com>
References:
 <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
In-Reply-To:
 <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10142:EE_|AM7PR03MB6625:EE_
x-ms-office365-filtering-correlation-id: e97be5bb-6c94-4e17-67a0-08ddb94e8313
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dkoveGVhUXRKNGtQeVlhMVI4a25aMER4YjNTSXNFYTQxblYxQ3RXY0NQRkxa?=
 =?utf-8?B?d3cvZG80VUd3bmdqTW9HM1loamRtcjJOMEI1WjVzcHQ2aytpVkIzcERnVTlL?=
 =?utf-8?B?TkcwekZRVWUyK1R6bStjSUVwL3JoL0FTTXBJRkJGN0lMTTVZR2NTMVJ6dTZV?=
 =?utf-8?B?NXRkNjlXVmhpeTBpWXdoUmR6ZzgvSHM0QWQxSGZpdlBRR09WcHZmeWVCbHZh?=
 =?utf-8?B?eFArUkl0ZHkyMlVWbXpkT0lWRmh4cFR5bUJNRFZWeXdnRkVRVlhocTZ5eG5M?=
 =?utf-8?B?TUpoUjhFdUxNRVRVRk9VQkQ1eDk2QlZwa29oTWtHeFFsWHRRSGhESzRSc0ht?=
 =?utf-8?B?V1Flem9uVG5QWmhNdHJKcGZ1eUVSQWRFZllIdEkyOUdqLzBBWUNGeCsrN1BY?=
 =?utf-8?B?R0J0cnBmWU4rSy9EUUJRM1dBZTFTS1RMUGx1bTAzNnlnTXZpTUZsTldlNHhP?=
 =?utf-8?B?VElRWTQvSXBnK3J1WTdIbDdUT085MW5KeW9wOHAyamk4ZEhINWpzT3RlWEVB?=
 =?utf-8?B?UHJGLzdOeGxwY0F1Y290M1l6VklSK3FKZGRXVS9VSWt1TERxWGl3dm5FcWJM?=
 =?utf-8?B?NjBmOHo4NW9TdVRabjZlQ0FWemhkZUZ1aWhRczNwc2FrMDZqbjlycUJXa1Br?=
 =?utf-8?B?dXUxTEpHZjd6Z1R3MFFsOEdHZGpNV2YwUDh2ZkVFTHpYcWt3ODh3Q292YjdO?=
 =?utf-8?B?Slc2QkRrc3lKa3BCTUVqR1dPWnVFQ3B1ZXp4djBBWkFGL0g2RUhqZnVJNHdx?=
 =?utf-8?B?WVN4OVpFZkkyK3c2T3dDMGJKV0dramUyOVY4UXBhTmtmTmU5aFNhR3VkL0xj?=
 =?utf-8?B?d0N2bmtJN2Z0UzZvZUlTWWpZaTFjWDV3cFNYTWZna3VxVkNwZFN4cVpZeGtH?=
 =?utf-8?B?dGxSZ3M1V1RaWFUwR09vL0JKelNNVlQ1SjdEZWhEWDI3MmRmOE1EY2RvU1pF?=
 =?utf-8?B?NVc0ZWpRaUxFT2F3Qkt2Y2hVN2RIY1NtaGxIZUsyaWlOdzEvRnR5ZHdYOXBO?=
 =?utf-8?B?c05pVERTcUxVSGxHbXZNU3ljWXVZRm0ySGtuN3dYYVJxekZlMit6Z1h5RnR4?=
 =?utf-8?B?NHlnbms1Z0s2akFGWjJDczVBVE10cGhtQllUcWd4UGU3UGxIb2FuRVpyc0xD?=
 =?utf-8?B?TGJrWi9PbHNrY1hWSHVpT3VydFA2T2tsWEYxcDAxQks3VkhUL3dWbm9TRjRY?=
 =?utf-8?B?K2lQUytjc2p2N05NN0RjQlc1blhkMUtyQ3NXVkg3RGRIdTdrak1HUjhqY2V4?=
 =?utf-8?B?bWZkdUhDUzhrTHdpVmZNZC8vU0R3djZqeHUxdlU1bHlDY1JTL0ZVWEdSNVlQ?=
 =?utf-8?B?dS83eHdacHBETi9iTUhDR05GdkcxMCtlbS9iUGVOWlU3anRXalZidU9kZWxq?=
 =?utf-8?B?ODFITXVFeStVZzd0bXlYa0dnVnREcmlTcXdJZWN1aFJIK1BxekRxaDBBcFlY?=
 =?utf-8?B?aUlIRVZOcE15dCtPTks1UUVjdm1xcmVjVEV4WTRmUEtTM2s0QUYzamUreHIx?=
 =?utf-8?B?bXRCT25vRU9UeFBmWkI4WFRQQXpuS09QWjhMeVdva0F2TGFPVFFvNU9xc2RN?=
 =?utf-8?B?VFByOThhS2s4R2k5bzRJNjN1VmNVWHBjL3V3aUgvSXZwcFRWejVYcTk2MUNZ?=
 =?utf-8?B?VmxIK1JQWDFsWDd5bDBoOGxyVlVnWmdpOE5pdzZqVnZRRUtrYmFDSHJGYW5H?=
 =?utf-8?B?RnRGaXhRdGdzbEVOeWNnaDAxOVBERjd6czNFSHhZL1RpaWNKS1hRVFhiVmZk?=
 =?utf-8?B?QmduRFlOV1YxNzRRU00rR0dXREV3STAxQ01SaklXNVEvd1hBbUlxdEttVEZW?=
 =?utf-8?B?QXBwNXkwQVkwQjdWWnhKVzk0cVRZMWJmdzBZRnYxdmpHVXNtTzhRYlhveTZ3?=
 =?utf-8?B?OWJwNEQreTIxRy80WmVrWjRJWUwvQXdmVU9nUkJNRXRURlNFL00yQ0h2dzRD?=
 =?utf-8?B?aGxlbVpXTGNueDhVU0xCRE5hall3aHN2cHBacU5zYlBNZS8vMVVWeVNSK0dF?=
 =?utf-8?B?aHhIOVhUd0t3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10142.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2hhUjNxVTNTMDN6NldNS0g2cENQajlEbWsrK1NOZVo0Si9Qby9ibHF0dUR4?=
 =?utf-8?B?S2x5MGROMVd1aS8zVENOb3grOTlOMWtYd1FLcUo2eUIxUDlhNE1zcitqdkxv?=
 =?utf-8?B?MzFEQi9IQk02b05iMXFCelZjVDJ5MnJQK3l6MzBLU1I1QXRiUE1LcCtSUzdz?=
 =?utf-8?B?VkI0L25uMlg5K2l4cjVpeUNpdDJnYnRJN0NYYmhmSWoxZGFLYmdBc1RSazBs?=
 =?utf-8?B?L2FZMW9vbXVCdkJnbk1ZbjNFai9QVlAzVFdXL3U5ekQwaE5tbnk2M1ZJbVht?=
 =?utf-8?B?eW14eUJxNWowMHJpaDlZWEFFQ29taEVNUjZWNjBOcUxYS1FzVHZSVGV0My9J?=
 =?utf-8?B?Y0RMemRlamx4bEI1bkNVc1ZLanNXOUQ5QW1ZSWFadDlBdFhabDNYbzVpamEx?=
 =?utf-8?B?ZXNMMkJFWEo2SGZ4ei9qb29rOEF0UExIR2cwdW9PSmVTL2lXcHRtNG4wRjJE?=
 =?utf-8?B?ZlM0V1VmeVI1bGRKNnFaZUIvY1lYcE1TN2NiT1BzWDU1QVFTZDIvS3lRUnZN?=
 =?utf-8?B?bExHRnJPcWxEUU45MUtLVjN5L2J2bG1CNjJQcGdkWldKcG9YT1B0NCtRWVVJ?=
 =?utf-8?B?L3N0OVpYeUcvNlczWlhRNUdWRDdiQ2l5VXkwVS9iOVVCTm9nUHF3amU5aU9Q?=
 =?utf-8?B?S0NFakYxaGx1ZXhPMFFWZVo1MXptS01lMkxobU5ZaFJuLy80YnNtd2FDeFN6?=
 =?utf-8?B?R2NRa1E3dW5GMDJJOTVyQ2tzaHRpUHhNTXM5cS9jeW5KY3dZM2JVdm9ka1kx?=
 =?utf-8?B?NVFVZ2t2eHo3YVAzVEJOaC9iMERnNTQ5Sk92TWNza3BUL0R4VkEvSVJ6VDFn?=
 =?utf-8?B?eDZTcWF6aW5OSWhOQWUrTzdVaE8zeTlYVkpyRkZkU3R3RnlRM29OZDczSVNG?=
 =?utf-8?B?SVBvR3FqdkZJS1BDcmdvbjMwZ1BQTHFqQjQyVjNURnpuQTFyd0FQNVVoTldy?=
 =?utf-8?B?TlMzREpOSU9RUnF3blBFelNGdmE4Uklhb3VDRUY4SlIzYjhjSTNkNy9TeEtD?=
 =?utf-8?B?dm40WHFKdXlGdW5YUStxcXhIamZXZGliOTdYQ3hTWmNkdW9SWXBYa1NUcm9X?=
 =?utf-8?B?M0YyQ1JhdGxwTUxKdDlOYVIzd0svNW13TGh0Z0J4c3JianozNlJ2dmxqM0dt?=
 =?utf-8?B?OFZjRjhneW44c2xMMFFtaUIrUXluTmVYck14R0FZS08rVlJCRkU1T3k2NUdm?=
 =?utf-8?B?UU5TWUJNenQ1RkZ5SEliWUYyUjBrSlliMmVvamdqUVJ3WTFzZDNkVE5ESnY3?=
 =?utf-8?B?NUIzdDVra25wcktLMk1JYjV4MHhHSjl0cWJpL3F2ckZnT3FRU055alhUTXN2?=
 =?utf-8?B?Y1lDMHZhZ1lCRHBNRHZFdXU0Y2x5bDB2UjhMTGh4WldycmNUanlTWnY0MjFi?=
 =?utf-8?B?bms1bU16Y3dOZlh5OXhuZ3ZxV3ZlNnFpNEw1ajhUam1KZ3ZpaUdMRTN4czlR?=
 =?utf-8?B?VUZJYXE1Q0V3TmRmMmVJSzVNWDZWSXQ5K3R1ZDFWb3hQR1g5ejhibkcyN0c0?=
 =?utf-8?B?NUlCbUZJbWlZT0RFOVlTdURTSXpuOUJyUUprNzFhem5iRVI4V1RORGFWL2Y5?=
 =?utf-8?B?SUZSbnMvRDFOM0R4Vit3akpzY1RNMHI0R1FyWHY1TXRRN1lTK0w4UWxnVmZp?=
 =?utf-8?B?MjRuOUtUS3g3WERiaXZRc0t2dkdKUFJibnozL09rNmZSR2tSelI1UFVHTE1Y?=
 =?utf-8?B?M1ZmRGsyUEg4VS92VG9QaVp6VXBFWkFOZCs1eEJGU2dCN3R1L0tOUjA5ejZ0?=
 =?utf-8?B?K3FLWGdWNTh5SFRBdjhWeFRJekdjbjBkUHJYTi9vUGgzb01ibE04SjZsaXNr?=
 =?utf-8?B?OVNBa1lnZXZYRlIxdWdLQzVJelhLeWErTmdiRnpTVnhxUUpEV0FzenFqeHZr?=
 =?utf-8?B?OG9UdWdMTXBLaWVud3pYdUE0V0t3MlVKMVdjWUlrOFVPTGVOUitSSkZLRnZZ?=
 =?utf-8?B?MFljaHlnbWlIZWNISkgrSTcyMXdmczIrZ0JXUmo0Rkw3elZkQ0xmWGR0M3Z1?=
 =?utf-8?B?N2toNkZJWXdHZkFOU2xZTzRsS1kxUjUvNFVlblRkbWl5VlRuaUdqaUcrbU9D?=
 =?utf-8?B?ZXJLK1pMQlRMbE1Ia29rR0xLMW5pcVFMZG5oclA1WVlMWlEwcUd0MVlrNUl5?=
 =?utf-8?B?QS9ZVTVPUWNiK1R2ckxkQlUwV2hua2h2QzVPUHMrZTFKT0tKTHQ2MFVWVmNK?=
 =?utf-8?B?M2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1ECB487451FCC4FA675A4B348401AC7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10142.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97be5bb-6c94-4e17-67a0-08ddb94e8313
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 09:55:01.3594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /a3vGhW1LIGW9ReuHUuFdnZoHJ36lsU/f8LLvfwOgORcVERXIU5CQQbDdMnNMY04+qtzHsD9mEgjS03Rorfz2pzn1iOtEmKIJRsau2JERTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6625

SGVsbG8sIE5pY29sYSENCg0KV291bGQgeW91IG1pbmQgaWYgSSB0YWtlIHBhcnQgb2YgeW91ciBw
YXRjaCAocmVsYXRlZCB0byBNSVNSQSBDIFJ1bGUgDQoyMS4xKSBhbmQgdXBzdHJlYW0gaXQ/DQoN
CkJSLCBEbXl0cm8uDQoNCk9uIDQvMjMvMjUgMjA6NTQsIHZpY3Rvcm0ubGlyYUBhbWQuY29tIHdy
b3RlOg0KPiBGcm9tOiBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20+
DQo+IA0KPiBNSVNSQSBDIFJ1bGVzIDIxLjEgKCIjZGVmaW5lIGFuZCAjdW5kZWYgc2hhbGwgbm90
IGJlIHVzZWQgb24gYQ0KPiByZXNlcnZlZCBpZGVudGlmaWVyIG9yIHJlc2VydmVkIG1hY3JvIG5h
bWUiKSBhbmQgUjIxLjIgKCJBIHJlc2VydmVkDQo+IGlkZW50aWZpZXIgb3IgcmVzZXJ2ZWQgbWFj
cm8gbmFtZSBzaGFsbCBub3QgYmUgZGVjbGFyZWQiKSB2aW9sYXRpb25zDQo+IGFyZSBub3QgcHJv
YmxlbWF0aWMgZm9yIFhlbiwgYXMgaXQgZG9lcyBub3QgdXNlIHRoZSBDIG9yIFBPU0lYDQo+IGxp
YnJhcmllcy4NCj4gDQo+IFhlbiB1c2VzIC1mbm8tYnVpbHRpbiBhbmQgLW5vc3RkaW5jIHRvIGVu
c3VyZSB0aGlzLCBidXQgdGhlcmUgYXJlIHN0aWxsDQo+IF9fYnVpbHRpbl8qIGZ1bmN0aW9ucyBm
cm9tIHRoZSBjb21waWxlciB0aGF0IGFyZSBhdmFpbGFibGUgc28NCj4gYSBkZXZpYXRpb24gaXMg
Zm9ybXVsYXRlZCBmb3IgYWxsIGlkZW50aWZpZXJzIG5vdCBzdGFydGluZyB3aXRoDQo+ICJfX2J1
aWx0aW5fIi4NCj4gDQo+IFRoZSBtaXNzaW5nIHRleHQgb2YgYSBkZXZpYXRpb24gZm9yIFJ1bGUg
MjEuMiBpcyBhZGRlZCB0bw0KPiBkb2NzL21pc3JhL2RldmlhdGlvbnMucnN0Lg0KPiANCj4gVG8g
YXZvaWQgcmVncmVzc2lvbnMsIHRhZyBib3RoIHJ1bGVzIGFzIGNsZWFuIGFuZCBhZGQgdGhlbSB0
byB0aGUNCj4gbW9uaXRvcmVkIHNldC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pY29sYSBWZXRy
aW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRmVkZXJp
Y28gU2VyYWZpbmkgPGZlZGVyaWNvLnNlcmFmaW5pQGJ1Z3NlbmcuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBWaWN0b3IgTGlyYSA8dmljdG9ybS5saXJhQGFtZC5jb20+DQo+IC0tLQ0KPiBDYzogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gQ2M6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPg0KPiBDYzogTWljaGFsIE9yemVsIDxtaWNo
YWwub3J6ZWxAYW1kLmNvbT4NCj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IENjOiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gQ2M6IE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0cmlu
aUBidWdzZW5nLmNvbT4NCj4gQ2M6IEZlZGVyaWNvIFNlcmFmaW5pIDxmZWRlcmljby5zZXJhZmlu
aUBidWdzZW5nLmNvbT4NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNA
YXJtLmNvbT4NCj4gLS0tDQo+ICAgLi4uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9u
cy5lY2wgICAgIHwgIDkgKysrKysrLQ0KPiAgIC4uLi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL21v
bml0b3JlZC5lY2wgICAgICB8ICAyICsrDQo+ICAgYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMv
RUNMQUlSL3RhZ2dpbmcuZWNsIHwgIDIgKysNCj4gICBkb2NzL21pc3JhL2RldmlhdGlvbnMucnN0
ICAgICAgICAgICAgICAgICAgICAgfCAyNiArKysrKysrKysrKysrKysrKystDQo+ICAgNCBmaWxl
cyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbCBi
L2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPiBpbmRl
eCAyYzhmYjkyNzEzLi5mZmEyM2I1M2I3IDEwMDY0NA0KPiAtLS0gYS9hdXRvbWF0aW9uL2VjbGFp
cl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4gKysrIGIvYXV0b21hdGlvbi9lY2xh
aXJfYW5hbHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsDQo+IEBAIC02MzksOCArNjM5LDE1IEBA
IGluIHRoZSBleHBhbnNpb24uIg0KPiAgICMgU2VyaWVzIDIxLg0KPiAgICMNCj4gDQo+ICstZG9j
X2JlZ2luPSJYZW4gZG9lcyBub3QgdXNlIEMgYW5kIFBPU0lYIGxpYnJhcmllczoNCj4gK2lkZW50
aWZpZXJzIHJlc2VydmVkIGJ5IHRoZXNlIGxpYnJhcmllcyBjYW4gYmUgdXNlZCBzYWZlbHksIGV4
Y2VwdCBmb3IgdGhvc2UNCj4gK2JlZ2lubmluZyB3aXRoICdfX2J1aWx0aW5fJy4iDQo+ICstY29u
ZmlnPU1DM0EyLlIyMS4xLG1hY3Jvcz17c2FmZSwgIiFeX19idWlsdGluXy4qJCJ9DQo+ICstY29u
ZmlnPU1DM0EyLlIyMS4yLGRlY2xhcmF0aW9ucz17c2FmZSwgIiFeX19idWlsdGluXy4qJCJ9DQo+
ICstZG9jX2VuZA0KPiArDQo+ICAgLWRvY19iZWdpbj0ib3IsIGFuZCBhbmQgeG9yIGFyZSByZXNl
cnZlZCBpZGVudGlmaWVycyBiZWNhdXNlIHRoZXkgY29uc3RpdHV0ZSBhbHRlcm5hdGUNCj4gLXNw
ZWxsaW5ncyBmb3IgdGhlIGNvcnJlc3BvbmRpbmcgb3BlcmF0b3JzICh0aGV5IGFyZSBkZWZpbmVk
IGFzIG1hY3JvcyBieSBpc282NDYuaCkuDQo+ICtzcGVsbGluZ3MgZm9yIHRoZSBjb3JyZXNwb25k
aW5nIGxvZ2ljYWwgb3BlcmF0b3JzIChhcyBkZWZpbmVkIGluIGhlYWRlciAnaXNvNjQ2LmgnKS4N
Cj4gICBIb3dldmVyLCBYZW4gZG9lc24ndCB1c2Ugc3RhbmRhcmQgbGlicmFyeSBoZWFkZXJzLCBz
byB0aGVyZSBpcyBubyByaXNrIG9mIG92ZXJsYXAuIg0KPiAgIC1jb25maWc9TUMzQTIuUjIxLjIs
cmVwb3J0cys9e3NhZmUsICJhbnlfYXJlYShzdG10KHJlZihraW5kKGxhYmVsKSYmXihvcnxhbmR8
eG9yfG5vdCkkKSkpIn0NCj4gICAtZG9jX2VuZA0KPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9l
Y2xhaXJfYW5hbHlzaXMvRUNMQUlSL21vbml0b3JlZC5lY2wgYi9hdXRvbWF0aW9uL2VjbGFpcl9h
bmFseXNpcy9FQ0xBSVIvbW9uaXRvcmVkLmVjbA0KPiBpbmRleCA4MzUxOTk2ZWM4Li5kYTIyOWEw
ZDg0IDEwMDY0NA0KPiAtLS0gYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvbW9u
aXRvcmVkLmVjbA0KPiArKysgYi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvbW9u
aXRvcmVkLmVjbA0KPiBAQCAtNzksNiArNzksOCBAQA0KPiAgIC1lbmFibGU9TUMzQTIuUjIwLjEy
DQo+ICAgLWVuYWJsZT1NQzNBMi5SMjAuMTMNCj4gICAtZW5hYmxlPU1DM0EyLlIyMC4xNA0KPiAr
LWVuYWJsZT1NQzNBMi5SMjEuMQ0KPiArLWVuYWJsZT1NQzNBMi5SMjEuMg0KPiAgIC1lbmFibGU9
TUMzQTIuUjIxLjMNCj4gICAtZW5hYmxlPU1DM0EyLlIyMS40DQo+ICAgLWVuYWJsZT1NQzNBMi5S
MjEuNQ0KPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL3Rh
Z2dpbmcuZWNsIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL3RhZ2dpbmcuZWNs
DQo+IGluZGV4IDFkMDc4ZDg5MDUuLjMyOTJiZjc1MWUgMTAwNjQ0DQo+IC0tLSBhL2F1dG9tYXRp
b24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi90YWdnaW5nLmVjbA0KPiArKysgYi9hdXRvbWF0aW9u
L2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvdGFnZ2luZy5lY2wNCj4gQEAgLTg4LDYgKzg4LDggQEAg
TUMzQTIuUjIwLjExfHwNCj4gICBNQzNBMi5SMjAuMTJ8fA0KPiAgIE1DM0EyLlIyMC4xM3x8DQo+
ICAgTUMzQTIuUjIwLjE0fHwNCj4gK01DM0EyLlIyMS4xfHwNCj4gK01DM0EyLlIyMS4yfHwNCj4g
ICBNQzNBMi5SMjEuM3x8DQo+ICAgTUMzQTIuUjIxLjR8fA0KPiAgIE1DM0EyLlIyMS41fHwNCj4g
ZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QgYi9kb2NzL21pc3JhL2Rldmlh
dGlvbnMucnN0DQo+IGluZGV4IGZlMGIxZTEwYTIuLjg4MzI4ZWFhOGEgMTAwNjQ0DQo+IC0tLSBh
L2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4gKysrIGIvZG9jcy9taXNyYS9kZXZpYXRpb25z
LnJzdA0KPiBAQCAtNTg3LDcgKzU4NywzMSBAQCBEZXZpYXRpb25zIHJlbGF0ZWQgdG8gTUlTUkEg
QzoyMDEyIFJ1bGVzOg0KPiAgICAgICAgICBjb25zdHJ1Y3QgaXMgZGV2aWF0ZWQgb25seSBpbiBU
cmFuc2xhdGlvbiBVbml0cyB0aGF0IHByZXNlbnQgYSB2aW9sYXRpb24NCj4gICAgICAgICAgb2Yg
dGhlIFJ1bGUgZHVlIHRvIHVzZXMgb2YgdGhpcyBtYWNyby4NCj4gICAgICAgIC0gVGFnZ2VkIGFz
IGBkZWxpYmVyYXRlYCBmb3IgRUNMQUlSLg0KPiAtDQo+ICsNCj4gKyAgICogLSBSMjEuMQ0KPiAr
ICAgICAtIFJ1bGUgMjEuMSByZXBvcnRzIGlkZW50aWZpZXJzIHJlc2VydmVkIGZvciB0aGUgQyBh
bmQgUE9TSVggc3RhbmRhcmQNCj4gKyAgICAgICBsaWJyYXJpZXMuIFhlbiBkb2VzIG5vdCB1c2Ug
c3VjaCBsaWJyYXJpZXMgYW5kIGFsbCB0cmFuc2xhdGlvbiB1bml0cw0KPiArICAgICAgIGFyZSBj
b21waWxlZCB3aXRoIG9wdGlvbiAnLW5vc3RkaW5jJywgdGhlcmVmb3JlIHRoZXJlIGlzIG5vIHJl
YXNvbiB0bw0KPiArICAgICAgIGF2b2lkIHRvIHVzZSBgI2RlZmluZWAgb3IgYCN1bmRlZmAgb24g
c3VjaCBpZGVudGlmaWVycyBleGNlcHQgZm9yIHRob3NlDQo+ICsgICAgICAgYmVnaW5uaW5nIHdp
dGggYF9fYnVpbHRpbl9gIGZvciB3aGljaCBjb21waWxlcnMgbWF5IHBlcmZvcm0gKHdyb25nKQ0K
PiArICAgICAgIG9wdGltaXphdGlvbnMuDQo+ICsgICAgIC0gVGFnZ2VkIGFzIGBzYWZlYCBmb3Ig
RUNMQUlSLg0KPiArDQo+ICsgICAqIC0gUjIxLjINCj4gKyAgICAgLSBSdWxlIDIxLjIgcmVwb3J0
cyBpZGVudGlmaWVycyByZXNlcnZlZCBmb3IgdGhlIEMgYW5kIFBPU0lYIHN0YW5kYXJkDQo+ICsg
ICAgICAgbGlicmFyaWVzLiBYZW4gZG9lcyBub3QgdXNlIHN1Y2ggbGlicmFyaWVzIGFuZCBhbGwg
dHJhbnNsYXRpb24gdW5pdHMNCj4gKyAgICAgICBhcmUgY29tcGlsZWQgd2l0aCBvcHRpb24gJy1u
b3N0ZGluYycsIHRoZXJlZm9yZSB0aGVyZSBpcyBubyByZWFzb24gdG8NCj4gKyAgICAgICBhdm9p
ZCBkZWNsYXJpbmcgc3VjaCBpZGVudGlmaWVycyBleGNlcHQgZm9yIHRob3NlIGJlZ2lubmluZyB3
aXRoDQo+ICsgICAgICAgYF9fYnVpbHRpbl9gIGZvciB3aGljaCBjb21waWxlcnMgbWF5IHBlcmZv
cm0gKHdyb25nKSBvcHRpbWl6YXRpb25zLg0KPiArICAgICAtIFRhZ2dlZCBhcyBgc2FmZWAgZm9y
IEVDTEFJUi4NCj4gKw0KPiArICAgKiAtIFIyMS4yDQo+ICsgICAgIC0gYG9yYCwgYGFuZGAgYW5k
IGB4b3JgIGFyZSByZXNlcnZlZCBpZGVudGlmaWVycyBiZWNhdXNlIHRoZXkgY29uc3RpdHV0ZQ0K
PiArICAgICAgIGFsdGVybmF0ZSBzcGVsbGluZ3MgZm9yIHRoZSBjb3JyZXNwb25kaW5nIGxvZ2lj
YWwgb3BlcmF0b3JzDQo+ICsgICAgICAgKGFzIGRlZmluZWQgaW4gU3RhbmRhcmQgTGlicmFyeSBo
ZWFkZXIgYFw8aXNvNjQ2LmhcPmApLiBYZW4gZG9lcyBub3QgdXNlDQo+ICsgICAgICAgU3RhbmRh
cmQgbGlicmFyeSBoZWFkZXJzLCBzbyB0aGVyZSBpcyBubyByaXNrIG9mIG92ZXJsYXAuDQo+ICsg
ICAgIC0gVGFnZ2VkIGFzIGBzYWZlYCBmb3IgRUNMQUlSLg0KPiArDQo+ICAgICAgKiAtIFIyMS45
DQo+ICAgICAgICAtIFhlbiBkb2VzIG5vdCB1c2UgdGhlIGBic2VhcmNoYCBhbmQgYHFzb3J0YCBm
dW5jdGlvbnMgcHJvdmlkZWQgYnkgdGhlIEMNCj4gICAgICAgICAgU3RhbmRhcmQgTGlicmFyeSwg
YnV0IHByb3ZpZGVzIGluIHNvdXJjZSBmb3JtIGl0cyBvd24gaW1wbGVtZW50YXRpb24sDQo+IC0t
DQo+IDIuNDcuMA0KPiANCj4gDQo=

