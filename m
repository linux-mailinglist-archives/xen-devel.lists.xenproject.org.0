Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1229E4CC0
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 04:36:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848805.1263601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ2dr-0001uq-8f; Thu, 05 Dec 2024 03:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848805.1263601; Thu, 05 Dec 2024 03:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ2dr-0001t3-5u; Thu, 05 Dec 2024 03:35:03 +0000
Received: by outflank-mailman (input) for mailman id 848805;
 Thu, 05 Dec 2024 03:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/zN=S6=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tJ2dq-0001sx-5J
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 03:35:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2612::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e70fbffa-b2b9-11ef-99a3-01e77a169b0f;
 Thu, 05 Dec 2024 04:34:59 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM7PR03MB6417.eurprd03.prod.outlook.com
 (2603:10a6:20b:1bd::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 5 Dec
 2024 03:34:54 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 03:34:54 +0000
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
X-Inumbo-ID: e70fbffa-b2b9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8YGHhnVzx2Z/DKT9KMizrBdj1nPKn+LalrtmZqrJWNMVLcrVCgDIHTkQesUo2T8o/n8OCBr/J5aMHNSCoDb/mj/TSTWTYrGW68AixTVQtqpJERMdcc1zjVRKC0K5OgnyKiGv4pmCxpBN8stTl3bw5/aOws6SNEihyzZ/blMnL/FA0v0DA4Ly7+1hfT1o1QT66xi0HsNTeR9K6CF+hzi6UzwMTiy8SYplF4Gme3uNk7+LXKYBZKJngIThMysOw9ExuLW0VSu5YwcyHz/D9Cf/gU6R7MtuuXjWFWYDzMhO0akXRTPRiKi9Nk9M2fOgkOnGbXdoxnNkQTkPhMQWlXB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrsBh4e8GRaB9i/ixGAlg5QXPFJibfasQBHxP1XHJcU=;
 b=YjvyrZ7vYXrlpXTE5MxHu9RyeHK+NbRXj7QXl0dc/2/gFW9GIPDqKb8XbGFNbZ3NLSrWM5LgY210eMclDWjsEaz5lgSgOfn1pFHliJgYeNlKtzd1M5X+4Od/Mktrg2xbGxwQjG7tESZGAK5so39Lz/VamwteenxeioJdTeqcMt5X+C/74T3SHdU6isGvSRcKAwd3jfll1U5fTZZpbA5IXA2d9NFB9WGWTM0szypVYSETW59icg7Gk8yWJQX3TXbzm+nJSRHVz4mpqZ7t6STlChHwTtUoKB+Nd2KUfTbudfdSemOz+qjrSCysvLvI9jXrxMuHpC4sYuVa3eSUnPA39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrsBh4e8GRaB9i/ixGAlg5QXPFJibfasQBHxP1XHJcU=;
 b=JnfXQz7SOATspFCcc8wAGpIK3usG6bLDlx9dcQC6GHYlNJQYHqCkPa/BTH7odlzC2pUb9V0Z/oqONM3GjBbymeSz1BqcK8sqW2sYCxbpDXkRLjRbc8kwwVTSw1sd6XoxojU4ZyU9UtE/CA/R4z/qnTLP/Yy8vvV5EPebJ6dq+5b6qsWPO6qk0GXySprdSoTIgq+SwehG0aqadFr50325pNGP4KfMbCSmMKgwy4tka/JvoZAbbArdswnEHSW+j6A44/quWlKbNxv3cghFukAnrGDDPjftHgs7+LdhWBiE7ZH456D12FD6/3avrnU5PBJhNITaf1cqDi7Gx/bke9K4ag==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/4] xen: common: add ability to enable stack protector
Thread-Topic: [PATCH v2 2/4] xen: common: add ability to enable stack
 protector
Thread-Index: AQHbQsSdkWILXIuO706XPyPrUU1cAA==
Date: Thu, 5 Dec 2024 03:34:54 +0000
Message-ID: <87o71q4xb7.fsf@epam.com>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
	<20241130010954.36057-3-volodymyr_babchuk@epam.com>
	<4f2f949b-a53e-4a79-8084-d374cabc109e@citrix.com>
In-Reply-To: <4f2f949b-a53e-4a79-8084-d374cabc109e@citrix.com> (Andrew
	Cooper's message of "Tue, 3 Dec 2024 20:33:07 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM7PR03MB6417:EE_
x-ms-office365-filtering-correlation-id: d7be533d-b0a3-479b-2a92-08dd14ddc898
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UnhmMFBad29sT2hlVmtGTzJjWnRBWUk4SkczZHdSK0VlM2FUMktjdUxhMXBT?=
 =?utf-8?B?cEI4L0tmWjI0OTlZRHJsK0wyQWJvSE5lbzh3bmM5eU5BWXo3K2pScEFyL3VV?=
 =?utf-8?B?TFd1emdYOUUvWUpjUldpRXA0bUNLcGR0d3JpdnNoL2FLcTZENjZiWkhKSlU1?=
 =?utf-8?B?ZmxGc1owQ0d0bDNadnpnYzlWSmlZRW8zSG5GOUZvVUp0RGh1bGR0Zjk5TGIr?=
 =?utf-8?B?dEpqdGkxNTRnbWRBVVZSVElmSG5NcXl4NFU0bFV3MXNBdC8vZWhuNG0yZEhz?=
 =?utf-8?B?cWRralY5UHlTcVRicTRCKzN4RnZtK0dqUmZsTmQ2NHFoVWYxYktQcDYxaCth?=
 =?utf-8?B?bHYzMnI2ZzVBL2dzMG5oMlVaNWhET3BTeVVWZVM3dHd5V1ZKR1V6cVo4VUlF?=
 =?utf-8?B?ZSt0T0FsUHh3RG54MkwzalpjaGZkTXprYVZvTDhBcGxXL0NtV0kwN2R0N01j?=
 =?utf-8?B?dlpPLzVSV0NMdmFqemZpbmRKSklmcDFYL3dTSmhZS2FZTENQT3ZhanU5emRT?=
 =?utf-8?B?TXVmOFFkRTlPZTMzcWlCUWQrckkxejNIQlNFU2dFT1I4UXp3ZEx0MnkvR3B0?=
 =?utf-8?B?Qk5nZmFxWExKbExGczk1Uy9kSG9XUFdkTllwOG1lZUNOWHRwWHN1eSs4aEd6?=
 =?utf-8?B?aDdQYTNSZUNOSHNxazdLRjNrN3JVc281cGhDZ1c3MVFUemlBWFhLc3l1d0xN?=
 =?utf-8?B?RDZ5K0U1UUVMa2xIM0xnMU5SelFWa2Y2QWxubDRrVGtielFPSFNWU3NiTjJn?=
 =?utf-8?B?TkQ4cG05T1RXdytPRndTWEw4VmtOL255TnRGSVpoU2ZNeEQ5amxTRm5mT3M5?=
 =?utf-8?B?Q2R2S1FhNzBVZVBtTHpQVXAvajUwVVZDYUpYa01ON3Q3a1RGQ25kVDZkWitS?=
 =?utf-8?B?bGFGZVhrZWlUWnFNcVdVK1p1aXpJYld5WDFTNXo5Q1ltNUJncVY3TjVCc2ZI?=
 =?utf-8?B?R3hzRWoxN2orUWxhdldISlA1RmRiaFF4OUQrWkJGZ2RvQUF5T3R1TkorZ3Ny?=
 =?utf-8?B?T3BnQThnM2s2NTNyUTMzekxBbG1vTGxSZnpMV0Z3OHArZ0lOQi8wb3pXaFZS?=
 =?utf-8?B?RGFFaE5TbWlIRHdLS1pEL0VuZlZhUTB6RWhLQWVGTkpoSVQ0Q0ppNUUrNnBx?=
 =?utf-8?B?MFMxbzVGbWFtMHNkSVo5WC9Eb2c5RmJZRE5GT0lLUFdTSkRZKytTYnVRV2dp?=
 =?utf-8?B?NHltbXNuZG92Wmg0aGpacW92U2dERkZ6UDdLVENiTVJjMjJZZGYvdVhXL3FG?=
 =?utf-8?B?Y1FHRGx3azRnNWpRMlN4L2k1QUJxQk5BNzFpNXAwbWdzZGhvOW9OcGZVZGhp?=
 =?utf-8?B?ZDh2b2ROQVE2eVNxb2pnVlZoL01vS0FjT1ppMjNDY3pmVW5xWVdhWGpsQTRU?=
 =?utf-8?B?NTZWZStSamgwWSswNFozaXQ5cnJUZ09TZ2V0aTNwU1l2OXdCNyswcElaNWM5?=
 =?utf-8?B?eXdPOUtvbjRNM3pmMStjenpWbjhuQWlJL002RUNyTVgwTU12NVZEalk5ZmI3?=
 =?utf-8?B?Y20xTE56aE9qK1JYS3liN0UzeXhHbmdKVGY5VndnUnhXUlliQWVGUVdKVFRu?=
 =?utf-8?B?djNXUy9CSUgyVHNkbUhhZVhlb0lPbk5IUlE2MEc0UnBLQnJUZUlZdWxVMTRO?=
 =?utf-8?B?VFBXYnFHUXdGZ3M4UVVVdTNFaC90ZHlYK1B5eGVTdm1Vb2YyU1oxdFNSZFZh?=
 =?utf-8?B?SlREYVVMSXc2MCtUUlg1MUtDTU5PRXNmekFFMWREYmtRczlBbm52blFqTzhk?=
 =?utf-8?B?OGM0TnZIQ28vV0RxWGxQQ3IvQ1E0Uno3SGlCangvMDRleFBKS0V3alAxYk1v?=
 =?utf-8?B?eEJOZ1NsOENDWnVvY0cvUSt6TVQ0QWc4RnZaNjJhTzc5TENKQmdkZGVwejJ3?=
 =?utf-8?B?WG9EQUV6cEVRYkUzQm1LM3hRZE0zaDBNT3hsZFlPZG5DT2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZW5FZDZGWDhnZlRSdVpNRm5LOGNKa1pOYXkvNncyN3JBVk9ubFNleStqZ0NH?=
 =?utf-8?B?T0x1U2FqRW5Xb1JBSEZZZnZxam9iaXdvS2ZMdEZOaXJuSmh1aVdWQXF0TElZ?=
 =?utf-8?B?WjhuYS9BQ2syT3V0K0hVclZEZjZaMTNJbWJpQkp2dGx3WXo0RFJSVHBwYjRP?=
 =?utf-8?B?WDhudEVCUW9DeFVOYk43bWlsMnIrVllWemxxQkJpakl2YmJtUFBJUUFzUGti?=
 =?utf-8?B?Y1laNDdBVDM5VGZXa25QYS8yTzRrWFZoZUx4d1lObytGbzRoQThxSEZpS29y?=
 =?utf-8?B?aU95UzdpVTBDMTZRL2REQWh1bUpHb0ZJWU04bGNkY0l4ZmprN0toKzc3M3ZJ?=
 =?utf-8?B?ZGQvc01lRTcwTnRqczdxMWN4WXU2SXdnNjNCdzhFVlJHVFllREtMTy83VTVh?=
 =?utf-8?B?dmowNXZyMHhHSzVTQkN5aThXeGxOeGZsaXlqcFQ3cHVWZU9yS2txUTlpUEkr?=
 =?utf-8?B?WmR2VlJ6MUJicnhBU3hrZmdiZWJNdzU3VDhPRlVrdjgxTmVDeWorN3lIZ1Yz?=
 =?utf-8?B?TTE4YTB4cVdMTHdWY29PRzJ4NEVZd0lYQTkzYXFFcEVjaCtYRE1pTVdoaXFu?=
 =?utf-8?B?eFJmUjduTGJWZUJlSzJ6TkFtNHdsdTNrRjliaFZrdlgrRkVFUXdSVlZyK3hX?=
 =?utf-8?B?aXM2RmFKN3VWZEV3cXVvWnRXcDhJWkppdmp3U2haOW5LT1dsRUdaK2R3OXRD?=
 =?utf-8?B?WUY3WWVNbVVsQnJmbW40a0E2YThTOWtDSW56Y2llVkU5RzhaRUJpaWRGcExz?=
 =?utf-8?B?NGpudkxDVS8xazM4M2RxSXhMdTA3U09zZWJ4ZXZjaGZ5YjJYci95ZFlJV3NB?=
 =?utf-8?B?L2FJQVBMUjUzcG9zVlA5UmhQZ2FXS2xZQUVsejdNTnNRRFY5dzMrUThsUWZx?=
 =?utf-8?B?Z1R4OGswZFZpL1FGUnJ1MnJYOGZSQm9RL3pzSjM4b004K2ErdktUMHd3eWM2?=
 =?utf-8?B?S0NvL3ZFVkpraU9VUkVSQ2g2OWhLY093TGFhQytGWlZ2WmNDVUV5WUVVZlZR?=
 =?utf-8?B?L0FxWGIvSjZPcDdJbjAwTkYxbjNvbklpMTl1OUszNmJlS0pJUy9jQXk4dWF3?=
 =?utf-8?B?Ti8xTFdFODMwOU1kaUg2RXlXRXpoL2R3Z2Z1SVdBQ0FoeEJ6TEJ3d2lqMndX?=
 =?utf-8?B?YytsSTUwOC9JZncwa0I4dmpsb2R5WERCSi9ieDJEaDRsV2UrM1NXWGNVaUl5?=
 =?utf-8?B?MnBEZ2FMZGtXOCsrWEFQWUJ6ajNjMzgxQjBNY2VHb0JyNXN3NEdnbnR0dktz?=
 =?utf-8?B?Qk1Jbkdkd0xKS0hEL3NsNUhucEZlQ0M3SFpOUXFqTFVqTHU4UzJKaUkvNThZ?=
 =?utf-8?B?cXZVOWJzcEpLZ0d5bjcxajNJa3JRSklwVEFZMDJsRmJPVmUzRzdHbENPWVZI?=
 =?utf-8?B?Yy8wMnE3WDNSSzkrY0k3UWJnMzJYdlQ5ZzdkU280YVFYVy9aRXMyeURUdXV5?=
 =?utf-8?B?Z3RKUmlrVHh4Rm5GUktLU0owTUJjam5xcndHOVU5VmF0ZGsvd3FCN0QyWk90?=
 =?utf-8?B?ZExjVExwdktzYkdZS09hdklQTFU0L3YvaEs3UDZQSUduMDJhK0g3UVl4aWg1?=
 =?utf-8?B?N0hpVjk3MmhzUkF1d2lSSU1HSnVjeUFEd0F3bXdWNFN6amp0SDNCdkdpVkt1?=
 =?utf-8?B?c0RwN3VsVERJai9HN2hIVVo4ZHNVcGlaNlphSThPVnpQSjcvOTR5MUhBcUty?=
 =?utf-8?B?MjFxeFhHaTBoWVY2cVhEQnBBTDd1R3lNTmE0V1FzdlRvZDlyeWdjN3Ywb1BN?=
 =?utf-8?B?dGY5dDFUU0dyUC9XRFlCVHorenpWbXlhbkNYWWxRMzVtWWV2bTAwN24wT25N?=
 =?utf-8?B?RFlpQzUvV0I3Rlo1cU94c2pmK29hY1VvYXJoSElnZW50RFdFcFJvY0NLcHJE?=
 =?utf-8?B?OG43R25FZzFmNWo0eTJNaDdWc1lHekl4TStyQXFJNHlOMFdDbmpaNUF6NkhZ?=
 =?utf-8?B?SVBFNDAxektkNC84c2FhcVFJZGVGY1ZTc2ZLVzc1ZGQvWS9NaUNzSGREWlB2?=
 =?utf-8?B?SzdoZjFpVjF1dCtQNGsvUTUzZ2FqKzRGUHpWQmI5VjJWRE1XcTR4Ui85TzJm?=
 =?utf-8?B?UWFXU081MXVwbnlMa1dpZ2paM3VWVWtadE9ES1FQTXJsWm9vTFVQYUdEZENm?=
 =?utf-8?B?M0dOM2NHY1RSejNLQmhObkZUeFZDTTJ4STBhSnpGblZjbzROQVVFTVBqUGRa?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <16B932742FFC9F46A5D8AB0E0E8EE830@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7be533d-b0a3-479b-2a92-08dd14ddc898
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 03:34:54.2172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wrXSjj9q+2TL7lkGMp3SIj0lEfjqRwRGvX61qh1iGeCyU9RnbBS1X2fOpM9YqGLbxLgumY1ILMVP8Y8KYSGpa7Dcq35M1ibfeMBXPn1MP0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6417

DQpIaSBBbmRyZXcsDQoNCkkgYWRkcmVzc2VkIGFsbW9zdCBhbGwgeW91ciBjb21tZW50cywgYnV0
IGRpZG4ndCBnZXQgdGhpcyBvbmU6DQoNCkFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+IHdyaXRlczoNCg0KPiBPbiAzMC8xMS8yMDI0IDE6MTAgYW0sIFZvbG9keW15ciBC
YWJjaHVrIHdyb3RlOg0KDQpbLi4uXQ0KDQoNCj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3N0
YWNrLXByb3RlY3Rvci5jIGIveGVuL2NvbW1vbi9zdGFjay1wcm90ZWN0b3IuYw0KPj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAuLmIyNTg1OTBkM2ENCj4+IC0tLSAv
ZGV2L251bGwNCj4+ICsrKyBiL3hlbi9jb21tb24vc3RhY2stcHJvdGVjdG9yLmMNCj4+IEBAIC0w
LDAgKzEsMTAgQEANCj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
DQo+PiArI2luY2x1ZGUgPHhlbi9saWIuaD4NCj4+ICsjaW5jbHVkZSA8eGVuL3JhbmRvbS5oPg0K
Pj4gKw0KPj4gK3Vuc2lnbmVkIGxvbmcgX19yb19hZnRlcl9pbml0IF9fc3RhY2tfY2hrX2d1YXJk
Ow0KPj4gKw0KPj4gK3ZvaWQgX19zdGFja19jaGtfZmFpbCh2b2lkKQ0KPg0KPiBhc21saW5rYWdl
LsKgIFRoaXMgTUlTUkEgY2hlY2sgaXMgbm93IGJsb2NraW5nIGluIEVjbGFpci4NCg0KSSBjYW4g
c2VlIHdoYXQgd2UgbWlnaHQgd2FudCB0byBtYXJrIGl0IGFzICJub3JldHVybiIsIGJ1dCBJIGRv
bid0DQp1bmRlcnN0YW5kIHdoeSB5b3Ugd2FudCB0byB1c2UgYXNtbGlua2FnZS4gSXQgaXMgbm90
IGNhbGxlZCBmcm9tDQphc3NlbWJseS4NCg0KDQotLSANCldCUiwgVm9sb2R5bXly

