Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BD9B40BCB
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 19:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107154.1457679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utUbN-00060i-0t; Tue, 02 Sep 2025 17:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107154.1457679; Tue, 02 Sep 2025 17:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utUbM-0005yu-UX; Tue, 02 Sep 2025 17:15:24 +0000
Received: by outflank-mailman (input) for mailman id 1107154;
 Tue, 02 Sep 2025 17:15:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V/Ey=3N=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utUbL-0005yo-Ie
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 17:15:23 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 664441c3-8820-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 19:15:18 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GVXPR03MB10500.eurprd03.prod.outlook.com (2603:10a6:150:149::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 17:15:15 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 17:15:15 +0000
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
X-Inumbo-ID: 664441c3-8820-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKDy0Y+8pMRV+8GHNj9s71By16TKkP9QOdKp95H2QstZvoWZTntXoqkHBHjYiQ71dE65n4ElMMEz0BQA/w+zqj1z8saXkmTV0iJPEB6LhVrF/pIvfbP6S7Xjec1yW5ibAl/UOu5ySe59nAxVVKKvyoaUWhCGYSTCczugFooRJHkp/0mEcwKC0oXpRg6LHCKsYdepqucjIVGLoxFtVlLTdXlxQEQ1kP3NB7PfQRM1wJu5uCO8C1iFHt7zU2VuVcCzKTZqBvqUra6o4sglhfgzfx8t8E64zeNJK9VTEjr5Kwl6ohmqZVSy7lW29MC86h5NQxDoQOqNqWy/cEkQl83E6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFR8q9x1RHDV2a9Df+paZY4uaImCiQgN/73ET3Qnloc=;
 b=WBsSEyXqEPZkLmqIboTgHKO1AAXUAvwkZGQTkLREet9CbCF7u4Lk15A/ooI3g9gAQ5b9GzrpMfx8y7i+uJ0kVPcOuXCivLBOV+vB91JIL8rMJiXQNJ/YCklZhZs0ZbYjN8rk399MQCc0rwP5Mx5H/pgiPZfjbprSGVamySxMpVUsDxAFSAS8qbznVjJq3i8iF/MhxkfByIHRrtQ7PBrbg8LgUFsjh1apHtCTisXTi8B+nLtrm4nEJdd6lJcKwW2FHurBZ1IslweeaQfyF2SuVl/SH6m9pwmAWc9l7WCW3GtSMvs65rb5JrjBzUwizLNctMQjy+0F+Rlp44NjTBKiWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFR8q9x1RHDV2a9Df+paZY4uaImCiQgN/73ET3Qnloc=;
 b=KWdsVxZ2g838m8OXj70I/Noa8ZPp9nmZw1Xq9WiLt0xJbzAxB8MopVawRin9IzTT0SxfhnH6MuxuCqD5247S7NwBOX6HPtie9BR5rdeDAk/YM+CThEJaL/dAGk4ccXfypO46V3ijwnsLZL8bwKIYBkDpfwjlGQ3tlLFIZjZzT9o+tgajtyW8GS1dsEztdfBrLFgUbLlL/GmMSSH5lOVRBC5bf/VTCo65ffc+TIwQVRVyi6Y/ZdJDpWvxiZbod8skH6qsvfYedxVi2e81X55GFvUvkU/2PGdEO5WCAEYYslVSoI+eedRDToNqZ0HK7kS2FLO0onlw7QQdbeSzL2kN1Q==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: Re: [PATCH v5 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Topic: [PATCH v5 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Index: AQHcGP7ji/JPLIO80UCW93TQMdVywbSAHzeAgAAJFQA=
Date: Tue, 2 Sep 2025 17:15:15 +0000
Message-ID: <30a25153-1f1f-41cf-afad-195d73ba405e@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <bd60d55fa8ffe081cee50bf8f53343e770863c3e.1756481577.git.leonid_komarianskyi@epam.com>
 <5ab75c0a-0bf6-418a-8c8f-7411a46d4189@xen.org>
In-Reply-To: <5ab75c0a-0bf6-418a-8c8f-7411a46d4189@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GVXPR03MB10500:EE_
x-ms-office365-filtering-correlation-id: 2d35538a-fde7-4578-0897-08ddea4448db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cU5LdGk4RDJTUXN1RFhkRGtKSnZLRDRjUGxkK2oydXVGdGVtbTZrdjkwN09l?=
 =?utf-8?B?bmVOUFlwd0pDZjM3S20reWthbS9YbkFIRlBhSDZ4U2J0aGpnYTFlbkpwRFZs?=
 =?utf-8?B?K2FNc1JpU2krVGR6cWQ1T2QxaEwweDFLS05mNEozak1Ubm13cjdwZmNMeGFQ?=
 =?utf-8?B?clhNRXhuU29xUWo1clBlLy9tN0pMN2hvNXFYMkJKZUN3SnpZVHMySzNlekNt?=
 =?utf-8?B?d1JNTTVDME9EZXBzNGI0MnhCbzY0c3g5Y1RSU3hnTlhDZGRKVEovdHhSMVA2?=
 =?utf-8?B?dDNOWVBXVFhST1AvN0RPMGVaYldiZmdoenF2bkFmejVhWnA5V01tV0hnaTEr?=
 =?utf-8?B?NTdxRXBBWGVnWS9BVFBxVThNU1BLWDRSbnplc2ZUa3VLc2NjT2lqVjZ1ZTkx?=
 =?utf-8?B?MUdpZ2pwYzhQcWZsVW1FS1VkRkZEVWw2QzY0ME1QRTNpcUpBWFNrL1NoY0RO?=
 =?utf-8?B?RXM3bHVPOG1nOFhaQXZESkVkZktrT2NCZnZIQ0s3SGpIRmNLL0hBckhGdDZO?=
 =?utf-8?B?bE9POHR1WXJGWTgxakxUZzZ6Q0JsU2tBakEzcTAxdUpzWDBsTVl4MUI3N0t2?=
 =?utf-8?B?YmF4cDdCTnovb05ZT3ZtMzUyZ0swNHAyRGsvWTFzOEp0VHJSNWxzTU9waHc4?=
 =?utf-8?B?dUg1bWp1VkFtYkhTSGlMNFZxZWZnZlJWNWdGZ0ZPYy9oZTliMFNZRXFIbFBa?=
 =?utf-8?B?d0REcmpDL1hYSytzYUNIdHY1cUEwVm4xSTlBcE5KS0lNdHB5MkNTSjAxaHBy?=
 =?utf-8?B?YS9xNXNYekxhUU9oQ3U1S1dXKzczQjQ4eGxvL0FVRmsxSVZ3eVFJaXY0K29E?=
 =?utf-8?B?MHJRRWl4c3BHK0pRQkcvM3p5NDdhS1N5UnYxNXJOYzYremltb2QyUVdLTHpt?=
 =?utf-8?B?eWRQeGx0aHpHck5MaUplcGdFMWxZNi9LZ0g0UjFHb2lZVFgzNDM0ZFB3S01E?=
 =?utf-8?B?a2hXdXJaZ25CaFNoa0UrWGM1TjJnNEgwcHNETnZib1hNckpHSnpSU3NDRGU1?=
 =?utf-8?B?Vm9QTnBnemRCN2FOZ0UrakJyVDQzRS96cVZTcTMxN05kaUZHTzBTRFk5ZWpP?=
 =?utf-8?B?dVFRTTRZYTFJcjk3aVNSdUF5bU1QemR3T1lCR0lNbUE2Z0pzZ3ZCMDQyUDlE?=
 =?utf-8?B?bndsTiszVHRyd3c4RlVjaFl4dDFVc2hQK2h3eWh1R0xYRWdYNE5SenVQYkt2?=
 =?utf-8?B?S3plSzdMcHAybkc2VGZtR0VadWdwL0hwd0xHZmMxaUxlOFNNUm10cDlNVFda?=
 =?utf-8?B?UUJEblZCVWlQQk91MURRQ2VLd1FvRXovRktkV3NZZFpOdkFlUlUzRk0xc0JV?=
 =?utf-8?B?bitYdS9MU2RBZjVvRkgzYjdSNjhtUjZNaVdIeFRmMUlwVVdXdURubHVvbXdx?=
 =?utf-8?B?T3UwU1Q2MXQ1U2RBMWltaFZZNjlTS0xzZWxwaHF1Y2pUR0VZVkEvWnVzR1lZ?=
 =?utf-8?B?aUdRa29PdXJlY082TUVzWEk1Q09HTzNKT0pBcXVSTit1UCsvQmxBNFNYL2Zq?=
 =?utf-8?B?RGxTUlJHc2QzdkcwaitBcTI3Tk5mTEt2Sm8xeVZHQjVUcG5pZkYvcXJsQ3c2?=
 =?utf-8?B?UFZKMGFOaDR3TUFiK3Z2eE1aejFFSlhKcjd5Mmo1L2Y5bFVFNkpIQ3VoV2Vr?=
 =?utf-8?B?cjJUdisxQVVUWitLb3VyNloxTEFPMjRQOGxGQ2tuWmI5SkxYUkFlOHNYNlhZ?=
 =?utf-8?B?eFhXSGxKdlptMi9sS254SE10bENXTlJXY0JjYUxmRXZFTk15bU5SV3VnNmk0?=
 =?utf-8?B?bE9CbWozWjZpRC8vZE8yaXlXdlduZEFhaFhhWjJVcTQ1RGl5RGFNaWptWGN3?=
 =?utf-8?B?SWlxT1JZenNlcFhwNXRFa1krYklZUHBkSnNjWXJwTkpSU2lKK29iblVvcTNV?=
 =?utf-8?B?RTFzZ3BSZVJnVUJSc2JvUnkwdk4wWVpiVld2dUVKY2JsL0ttb3JJRDVvNGpN?=
 =?utf-8?B?Ujh0TUtKMUF1cFVGdy90TGRsTFBuSUFmSDNDcXdIVGxwWkxFdkFMVW1jRU4v?=
 =?utf-8?B?cy9zcGxFcGVnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZUlVUFVhU2dEM1dYVWlCMVExdEE0VU5YM0VsTlNsU2lDeGZBU2RUcXhsbGkv?=
 =?utf-8?B?aS9DejUzcWJSYlJqOGtlRjVhUTlVNnVCRjJjRmw4ZDlsYTJFY2dqRklaZnVN?=
 =?utf-8?B?VW9sbFQ4MGtwWTh4N25BOHBRS0hpekxMZjdGU2N4b1RsTW1ib09zdmIrdFRw?=
 =?utf-8?B?Tkx0Yk9EaEJrVWpRSTFYaDZMYUI3SGpxZDFFYW54a3RJRVBLaDFiTG9ESHVz?=
 =?utf-8?B?V01YSVIzeEdRSUlKbEFSUHRDSmRPTlRLVTQvM0FTOTRSRFl3bWRxSVdtZFVw?=
 =?utf-8?B?c0ZIeUM5eUZSNlRlK1hOb2k1Q05zdTZwRTdYRDVNVzZZNlF4YlNBczgzd1Bi?=
 =?utf-8?B?S0lVR2xKQjFpcFR6WjBVZ3pMcUxhQk1aSUlWN3EwUHJLVmMzRkhMaTV6TEM4?=
 =?utf-8?B?S1JJaVA4U1JlVWhoVmFTZ2ViSHgvOEp6ZjZwS2RsMDlOYlE3dkJrb2FDM2xN?=
 =?utf-8?B?UElEYnlnQkxKZEdkbVN3aTM0MTJpaFRoMG9xRDY2Mi9MaFQzVnQ1Ni84N1ZE?=
 =?utf-8?B?MmJSUlJmM2hsS3Yva1lPUzhlYk1pc095QVg1RjNEdjQzNzB1cUkvbFBoVHBp?=
 =?utf-8?B?VTRraUFmdXY3eC9qQ0Y0UE5OMDlPRHByeVd1dTRiKzJjQW4vc0dUL0RQeW1X?=
 =?utf-8?B?T0NXeXJhUWRoNkt1SjA4cWlzdWE1NkNpZmlxSGFMTEtuOW9DdUhFWmhrekVJ?=
 =?utf-8?B?NHg2TmRBanJQRlFKNU93SjdHT3l5OHRGdlBtZXdERWxVeUJsWDhMS0Y0bHpD?=
 =?utf-8?B?NEpKRzVMT1EvY2d1NEJIckg2M3N2VXovRnJxaENGcDJHMWRLVWpZYk1UYmFG?=
 =?utf-8?B?WkZxNG5LbSs1QktOaXFDTkxTWjEzVzdQR3l6R3d0VThKdHZ4RzFMTzlUZzlt?=
 =?utf-8?B?cVJsSFVFaFNrd0x4bEc0SnlqTnF1NHJVcTVTbXNTS1BHc0piNkRJcnloMjRv?=
 =?utf-8?B?MUoyb1k3WjUzRUp3ckkrWXlpYjluR0ZTS1FDSmdKeFNyL2t6dkpTcXdwRU5s?=
 =?utf-8?B?V3ZoMVVPSVhIQlpldU53SEppRUVPMHpKRlNNRDMwdmphcG5nNFFvRENDWkNW?=
 =?utf-8?B?TkJpbnRpOWpKOWhiaHlxaVRycm9KVFFRNkMrN1loZWxaekI1SFpNbVlqNS95?=
 =?utf-8?B?eTgxQ0VwTGMrLzNvMG5VTHNRZlZScjBpdC9ycGdSNG1UT2s5RU0yd1BZL0Jm?=
 =?utf-8?B?aXRKZGl0dUh2NEdNdFRyd3NxYzhWVkJSUGRSWnJOMUl0ZVNOL0h3YnBXekh3?=
 =?utf-8?B?T3VYOEdCa25vTXc5eElLSmVXdmxRUC9KVGRBK2ZNeDd2K0dJeHJuSGVjTGtt?=
 =?utf-8?B?N1ZGNzZ1L0NBV0JzZDBoUTU5YmdUL0tUYmlOVk5tNGNadWpOZ0w4ME5sUjI0?=
 =?utf-8?B?T3BCZG9IcjhHS1ZKUWFPdXA5eDNwSW9kMHFaRTdDZ0x3K3NOQUFDWXhTb1dK?=
 =?utf-8?B?TllSYnNxeCttdkgvUHMxKzVqWWpiTGlMeStrQk9Sd2wxNWZYK1RLZXprWEpL?=
 =?utf-8?B?SGJwdjRRZUFwdGJwaEplcUc5ZTFvRlJiZEdxbGppdXo1b1hsUmtGUGFYZDBL?=
 =?utf-8?B?Y3JxUnhRU3ZxVUNMR1ZLbHk3b2VRTXpTQnprbTV1N29MU3lHejlBcERRWXlT?=
 =?utf-8?B?eW9aTGN0WUo0eldJQzMzbU9vemI3NkUzQzgzaVg2aHd3ekZ2R2h4cjRqOEpV?=
 =?utf-8?B?VnJvcTFIeUhWS1R4ZjA1QlEvVDFmR1EvVFEzVy9UeDB6R1FRQkV1VkRNRE9F?=
 =?utf-8?B?MkZmdDlYSVA5WldWbEZwclVMVmVTZEVCTW9BMEtMbFdKTWd2U2VjVVhlQW4z?=
 =?utf-8?B?MkhGenVzVkNoVUtBVlVBc3NlWTBBQjRZWGo2eDJtbzlWeTEwZ0lPQzVhRzhp?=
 =?utf-8?B?YWxIUEJrOExiS2Z6dHQyang5N09jNDlSMHovSTFCYXZkMEtHcWxFY1BIWDZq?=
 =?utf-8?B?ZTIzYmJDUFFUbU81cVhjbFpZaUVIMGY2bGVFK0pYdEZKUHd6YzdxdTc5VkJk?=
 =?utf-8?B?Tk1WL2VTc1Z6NDRiQ1FLSWIxYVlvaEE0OWlBcVVITXQ1bEMwcURndmp6Wmhr?=
 =?utf-8?B?Rk5XZFlmSm8rWTVVZEZoUUR0NGp6VE4yQUxmZitrRkFUOUdMVnhmV0tyNERX?=
 =?utf-8?B?M0UrQTVmUFg4NTVkd1JVbFZBYWRJelZRQTBRRmlqdkZ3YUxnejJvSjJ5bVFJ?=
 =?utf-8?Q?uTh7IoewaUuQg1aWFk7cybM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50CC25017D72FB45B946A0C2222EBB9E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d35538a-fde7-4578-0897-08ddea4448db
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 17:15:15.6964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cvAEzOiUtjNJfW5Sb9MYQbVS6PzpbAenyO9rBgqSzMd5brA5IO7Qgf04LxEWdvXhyA1Wl3hveVLvkAJ7rHKDyqmZ02xbW8vlGpSPA4mDfzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10500

SGkgSnVsaWVuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiAwMi4wOS4yNSAx
OTo0MiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBMZW9uaWQsDQo+IA0KPiBPbiAyOS8wOC8y
MDI1IDE3OjA2LCBMZW9uaWQgS29tYXJpYW5za3lpIHdyb3RlOg0KPj4gVGhlIERvbTAgYW5kIERv
bVVzIGxvZ2ljIGZvciB0aGUgZG9tMGxlc3MgY29uZmlndXJhdGlvbiBpbiANCj4+IGNyZWF0ZV9k
b20wKCkgYW5kDQo+PiBhcmNoX2NyZWF0ZV9kb21VcygpIGhhcyBiZWVuIHVwZGF0ZWQgdG8gYWNj
b3VudCBmb3IgZXh0ZW5kZWQgU1BJcyB3aGVuDQo+PiBzdXBwb3J0ZWQgYnkgdGhlIGhhcmR3YXJl
IGFuZCBlbmFibGVkIHdpdGggQ09ORklHX0dJQ1YzX0VTUEkuDQo+IA0KPiBTdHlsZTogV2UgZG9u
J3QgY29tbW9ubHkgdXNlIHBhc3QgdGVuc2UgdG8gZGVzY3JpYmUgdGhlIG5ldyBiZWhhdmlvci4N
Cg0KSSB3aWxsIHVwZGF0ZSBpdCBpbiBWNi4NCg0KPj4gwqAgeGVuL2FyY2gvYXJtL2RvbTBsZXNz
LWJ1aWxkLmPCoMKgIHzCoCAyICstDQo+PiDCoCB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmPC
oMKgwqDCoCB8wqAgMiArLQ0KPj4gwqAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3ZnaWMuaCB8
IDE5ICsrKysrKysrKysrKysrKysrKysNCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2RvbTBsZXNzLWJ1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tMGxlc3MtIA0KPj4gYnVpbGQuYw0K
Pj4gaW5kZXggNjliOWVhMjJjZS4uMDJkNTU1OTEwMiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9kb20wbGVzcy1idWlsZC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tMGxlc3MtYnVp
bGQuYw0KPj4gQEAgLTI4NSw3ICsyODUsNyBAQCB2b2lkIF9faW5pdCBhcmNoX2NyZWF0ZV9kb21V
cyhzdHJ1Y3QgDQo+PiBkdF9kZXZpY2Vfbm9kZSAqbm9kZSwNCj4+IMKgwqDCoMKgwqAgew0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIGludCB2cGwwMTFfdmlycSA9IEdVRVNUX1ZQTDAxMV9TUEk7DQo+
PiAtwqDCoMKgwqDCoMKgwqAgZF9jZmctPmFyY2gubnJfc3BpcyA9IFZHSUNfREVGX05SX1NQSVM7
DQo+PiArwqDCoMKgwqDCoMKgwqAgZF9jZmctPmFyY2gubnJfc3BpcyA9IHZnaWNfZGVmX25yX3Nw
aXMoKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiBUaGUgVlBMMDExIHZpcnEgaXMgR1VFU1RfVlBMMDExX1NQSSwgdW5sZXNzIGRpcmVjdC1tYXAg
aXMNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+IGluZGV4IGQ5MWE3MWFjZmQuLjM5ZWVhMGJlMDAgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+ICsrKyBiL3hlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4gQEAgLTIwNTQsNyArMjA1NCw3IEBAIHZvaWQgX19p
bml0IGNyZWF0ZV9kb20wKHZvaWQpDQo+PiDCoMKgwqDCoMKgIC8qIFRoZSB2R0lDIGZvciBET00w
IGlzIGV4YWN0bHkgZW11bGF0aW5nIHRoZSBoYXJkd2FyZSBHSUMgKi8NCj4+IMKgwqDCoMKgwqAg
ZG9tMF9jZmcuYXJjaC5naWNfdmVyc2lvbiA9IFhFTl9ET01DVExfQ09ORklHX0dJQ19OQVRJVkU7
DQo+PiAtwqDCoMKgIGRvbTBfY2ZnLmFyY2gubnJfc3BpcyA9IFZHSUNfREVGX05SX1NQSVM7DQo+
PiArwqDCoMKgIGRvbTBfY2ZnLmFyY2gubnJfc3BpcyA9IHZnaWNfZGVmX25yX3NwaXMoKTsNCj4+
IMKgwqDCoMKgwqAgZG9tMF9jZmcuYXJjaC50ZWVfdHlwZSA9IHRlZV9nZXRfdHlwZSgpOw0KPj4g
wqDCoMKgwqDCoCBkb20wX2NmZy5tYXhfdmNwdXMgPSBkb20wX21heF92Y3B1cygpOw0KPj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS92Z2ljLmggYi94ZW4vYXJjaC9hcm0v
aW5jbHVkZS8gDQo+PiBhc20vdmdpYy5oDQo+PiBpbmRleCA5MTJkNWI3Njk0Li4zYWEyMjExNGJh
IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3ZnaWMuaA0KPj4gKysr
IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3ZnaWMuaA0KPj4gQEAgLTM0Nyw2ICszNDcsMjUg
QEAgZXh0ZXJuIHZvaWQgDQo+PiB2Z2ljX2NoZWNrX2luZmxpZ2h0X2lycXNfcGVuZGluZyhzdHJ1
Y3QgdmNwdSAqdiwNCj4+IMKgIC8qIERlZmF1bHQgbnVtYmVyIG9mIHZHSUMgU1BJcy4gMzIgYXJl
IHN1YnN0cmFjdGVkIHRvIGNvdmVyIGxvY2FsIA0KPj4gSVJRcy4gKi8NCj4+IMKgICNkZWZpbmUg
VkdJQ19ERUZfTlJfU1BJUyAobWluKGdpY19udW1iZXJfbGluZXMoKSwgVkdJQ19NQVhfSVJRUykg
LSAzMik+DQo+PiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgdmdpY19kZWZfbnJfc3Bpcyh2
b2lkKQ0KPj4gK3sNCj4+ICsjaWZkZWYgQ09ORklHX0dJQ1YzX0VTUEkNCj4+ICvCoMKgwqAgLyoN
Cj4+ICvCoMKgwqDCoCAqIENoZWNrIGlmIHRoZSBoYXJkd2FyZSBzdXBwb3J0cyBleHRlbmRlZCBT
UElzIChldmVuIGlmIHRoZSANCj4+IGFwcHJvcHJpYXRlDQo+PiArwqDCoMKgwqAgKiBjb25maWcg
aXMgc2V0KS4gSWYgbm90LCB0aGUgY29tbW9uIFNQSSByYW5nZSB3aWxsIGJlIHVzZWQuIA0KPj4g
T3RoZXJ3aXNlDQo+PiArwqDCoMKgwqAgKiByZXR1cm4gdGhlIG1heGltdW0gZVNQSSBJTlRJRCwg
c3VwcG9ydGVkIGJ5IEhXIEdJQywgc3VidHJhY3RlZCANCj4+IGJ5IDMyLg0KPj4gK8KgwqDCoMKg
ICogRm9yIERvbTAgYW5kIHN0YXJ0ZWQgYXQgYm9vdCB0aW1lIERvbVVzIHdlIHdpbGwgYWRkIGJh
Y2sgdGhpcyANCj4+IHZhbHVlDQo+PiArwqDCoMKgwqAgKiBkdXJpbmcgVkdJQyBpbml0aWFsaXph
dGlvbi4gVGhpcyBlbnN1cmVzIGNvbnNpc3RlbnQgaGFuZGxpbmcgDQo+PiBmb3IgRG9tMA0KPj4g
K8KgwqDCoMKgICogYW5kIG90aGVyIGRvbWFpbnMuIEZvciB0aGUgcmVndWxhciBTUEkgcmFuZ2Ug
aW50ZXJydXB0cyBpbiANCj4+IHRoaXMgY2FzZSwNCj4+ICvCoMKgwqDCoCAqIHRoZSBtYXhpbXVt
IHZhbHVlIG9mIFZHSUNfREVGX05SX1NQSVMgd2lsbCBiZSB1c2VkLg0KPj4gK8KgwqDCoMKgICov
DQo+PiArwqDCoMKgIGlmICggZ2ljX251bWJlcl9lc3BpcygpID4gMCApDQo+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIEVTUElfQkFTRV9JTlRJRCArIG1pbihnaWNfbnVtYmVyX2VzcGlzKCksIDEw
MjRVKSAtIDMyOw0KPj4gKyNlbmRpZg0KPj4gKw0KPj4gK8KgwqDCoCByZXR1cm4gVkdJQ19ERUZf
TlJfU1BJUzsNCj4gDQo+IFRoaXMgaXMgdGhlIG9ubHkgdXNlciBvZiBWR0lDX0RFRl9OUl9TUElT
LiBUaGVyZWZvcmUsIEkgd291bGQgcHJlZmVyIGlmIA0KPiB3ZSByZW1vdmUgdGhlIGRlZmluZS4g
VGhpcyB3aWxsIGF2b2lkIGFueSBjb25mdXNpb24gYmV0d2VlbiB0aGUgaGVscGVyIA0KPiBhbmQg
dGhlIGRlZmluZS4NCj4gDQo+IENoZWVycywNCj4gDQoNCkFjdHVhbGx5LCB3ZSBuZWVkIHRoaXMg
bWFjcm8gaW4gdGhlIHByZXZpb3VzIHBhdGNoIGluIHRoZSBzZXJpZXM6DQpbMDgvMTJdIHhlbi9h
cm06IHZnaWM6IGFkZCByZXNvdXJjZSBtYW5hZ2VtZW50IGZvciBleHRlbmRlZCBTUElzDQooZG9t
YWluX3ZnaWNfaW5pdCk6DQoNCiAgICAgaWYgKCBucl9zcGlzICsgMzIgPj0gRVNQSV9CQVNFX0lO
VElEICkNCiAgICAgew0KICAgICAgICAgZC0+YXJjaC52Z2ljLm5yX2VzcGlzID0gbWluKG5yX3Nw
aXMgLSBFU1BJX0JBU0VfSU5USUQgKyAzMiwgMTAyNFUpOw0KICAgICAgICAgLyogVmVyaWZ5IGlm
IEdJQyBIVyBjYW4gaGFuZGxlIHByb3ZpZGVkIElOVElEICovDQogICAgICAgICBpZiAoIGQtPmFy
Y2gudmdpYy5ucl9lc3BpcyA+IGdpY19udW1iZXJfZXNwaXMoKSApDQogICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQogICAgICAgICAvKg0KICAgICAgICAgICogU2V0IHRoZSBtYXhpbXVtIGF2
YWlsYWJsZSBudW1iZXIgZm9yIHJlZ3VsYXINCiAgICAgICAgICAqIFNQSSB0byBwYXNzIHRoZSBu
ZXh0IGNoZWNrDQogICAgICAgICAgKi8NCiAgICAgICAgIG5yX3NwaXMgPSBWR0lDX0RFRl9OUl9T
UElTOw0KICAgICB9DQoNCkkgaGF2ZSBzZWVuIHlvdXIgY29tbWVudCByZWdhcmRpbmcgcmV3b3Jr
aW5nIHRoZSBjaGVja3MsIGJ1dCBpbiBhbnkgDQpjYXNlLCBJIHN0aWxsIG5lZWQgdGhpcyBtYWNy
byB0byBhc3NpZ24gdGhlIHZhbHVlIHRvIG5yX3NwaXMsIHNvIEkgd291bGQgDQpwcmVmZXIgdG8g
bGVhdmUgaXQuDQoNCg0KQmVzdCByZWdhcmRzLA0KTGVvbmlk

