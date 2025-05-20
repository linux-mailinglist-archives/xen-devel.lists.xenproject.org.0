Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951E5ABD3AF
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 11:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990603.1374548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJV8-00041H-FH; Tue, 20 May 2025 09:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990603.1374548; Tue, 20 May 2025 09:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJV8-0003yB-AA; Tue, 20 May 2025 09:43:10 +0000
Received: by outflank-mailman (input) for mailman id 990603;
 Tue, 20 May 2025 09:43:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EAyu=YE=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uHJV7-0003y5-1k
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 09:43:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:2418::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d470cce7-355e-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 11:43:06 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ2PR12MB7798.namprd12.prod.outlook.com (2603:10b6:a03:4c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 09:43:01 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 09:43:01 +0000
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
X-Inumbo-ID: d470cce7-355e-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVEeh9vl9x3xppP586kl/KPYWagsVZFfKFnq0Kn4Xt4UHnLc9fxWUChzsUz9+XFcjdAi/29LCa40O4MY0QNbiiuYvMjiJbI0mGH4D1ylXpwMRCE/TZZM5Ndmnk1HXb2rzJvr65ooELWnJXzIHcKRaSFHW/WG11bpalXzd3ltfwi9Ab/hMHDjYeFZ5zmFbAhYpPte0TDg356G744VBRIRTXxkitfoCyjr7EWiRU685IO101nG4OjIpYVU4ehJ4WehxkCMSYqQlYGR/3NT9SztN/Fd7zdk4rLBELxKbOkZGsOLCXT9hi09MDcPksgs45NaivJSNIYWe23z1BJi18JIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apNLGcGF8Mv2yVbkbH//QKi7efTw3EdFgfhsFYgUfwg=;
 b=tGSStXManuW1/lexo/CHhVqxRKRccShyOadtue8QKPT12IxLiIzpQod9ZWxKXAOfk3qlOJXPiAjtQTqmB6yev13pgJi7gvJZpHMRZ1eJY07z2b8SF6pfD2GmksJMF7P6G1QygM1kIddVcz4iiYCtzARCiem9W0fhwi8FmWHUAn1IXzgvLzh66qnjQ2DJimg6NWyjL/+jxgYECwxQmmMdOux1fsFwuSN3OD1tiFC0nPyJpiuhzcwenUO0s8O03KFTVPSxEAwop+fFmvjc7fcMIpxlWoJhHJ5mm+RDDJ8ifuxFLrFWFaSlz3vXC/dBQbJWAy3iS8a0iF5k0kIEeLLvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apNLGcGF8Mv2yVbkbH//QKi7efTw3EdFgfhsFYgUfwg=;
 b=kc9+RKnvRbzPejpA8DKJu2BcbPFOSp9rfIspPtiIgNU21hMlQAWvZ3CMh7kNrFLwo9HMgN5IopAAckvMcKU3M+2i3BWIsTeQFBnL4Hy1fRLJNZ1gGWXwdnOrCpMZFO51VCDejuJ9Ci6oQ5Lv5RWbdLM2JRRe8wXeErbfOzVadcA=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Topic: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Index:
 AQHbrRCmtZ7pr/knH02upOrsNIOYE7O6sNeAgB8mXDCAAE/jgIABP6gAgAAOsICAAAdcAA==
Date: Tue, 20 May 2025 09:43:01 +0000
Message-ID:
 <DM4PR12MB8451F699E32AE79B11FF8674E19FA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-6-Penny.Zheng@amd.com>
 <57a3b2c0-d57d-46e3-b248-0e243f715423@suse.com>
 <IA1PR12MB846717BD0A9E985C9E22AEFDE19CA@IA1PR12MB8467.namprd12.prod.outlook.com>
 <0f673a09-840c-4319-bec8-62fd920a6b84@suse.com>
 <DM4PR12MB8451084DB70D19B5284E1CB8E19FA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <c3ab4e1d-83b8-47fc-a110-31d4620a156d@suse.com>
In-Reply-To: <c3ab4e1d-83b8-47fc-a110-31d4620a156d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=c6c44406-45d5-4222-9a76-2f5fdeaa9b02;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-20T09:42:42Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ2PR12MB7798:EE_
x-ms-office365-filtering-correlation-id: ffa10cd5-9426-41dc-8aa0-08dd9782b632
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TW96blpqTXcrZkpCSmJaNU92MXRqejVScUxRRmZJQ0VtYzFzazVEZFVnQU5T?=
 =?utf-8?B?Q2hoNUhNNjJyaVY2dVpicTd2cFU0V0hiVTJRMDNCYmVhc1lGdlBvYi80M1JO?=
 =?utf-8?B?a2Ezc0M4d1djaEZQdFIycUxzWk9ySW52WldiNWh3QnhzWGpEa1ppWEdVaUlM?=
 =?utf-8?B?dkVmeUtIUDRQdzM5NTZSaW95ZGpUZmNlWlBMNFY3U29kSGhNTUhnN1dsSjgv?=
 =?utf-8?B?ZWt3UWdXMENMeUFpdnErZC9qVUdtTmdNK0pnY0xzeFVvbm0wdFpObnZyMEdp?=
 =?utf-8?B?Sk5qblBpVGxOMnRKMmtJMEpPSlV4SFRVSnhrcXJtcVZaQnQybUY3YlFtcGRN?=
 =?utf-8?B?RDNaS1VubU5iWGgxRWRUTUdJU0lCNGJ2bHBDR1YzNHhORjZ0cnpKRWp3VDNK?=
 =?utf-8?B?WlFLVjhtckJJSVdKQ2V5SEFQZ0FiQTRqbXJWekNzUWxNakFIS0x0STZmQm5p?=
 =?utf-8?B?SjlDcGZHYVNvZGtyc1JVRXRqYXg2cEJHK21qbzEwWXFaVVM0U3AxaS9WYWhO?=
 =?utf-8?B?OWw3N0R4M3NTMUxGdyt3T2o5S0FKak5vOFdNVzBlMnNGTGRVZDRVT1N4NFZ3?=
 =?utf-8?B?NTlETkRFd3ZhUXFmOVV2QmZzeXBiaXU3RTdFQnVraG1ENG1XQ1RDUWxIUUhn?=
 =?utf-8?B?RzVkTkszMTNiQVZZeFdZY1ZDRFcvQlIveGdVWEp2Ung5eEFmOURvMkpPaThB?=
 =?utf-8?B?d1hYdDRkQUlGT1o3YjlXMUZ5K1NyUzhwOVo3b0hXa3VKc0ZJMWFnMTgrOHdN?=
 =?utf-8?B?V2ZtbzlnVkdNVTVMdThraTYyTUhSNmM1b2krbzVhMVFobE14L3BGMjRhSjVw?=
 =?utf-8?B?WERocVZNU1pOc0V3MmtYRXBYTmFTMmNkdXR2U1d5YUR5UE9zOW9hY20wRDl0?=
 =?utf-8?B?NENNeW41TXBhemlvVW1PdUNHVXZ4dS96U3JPaC9meTdvM1J6T2VPZThlU0lF?=
 =?utf-8?B?WVhtSi9BeHhiSnRCNEJzODdBcDNaT2dGWXhXQ3pzK1dYR0k1azBTK2FZMjV3?=
 =?utf-8?B?S09yakhUQ2tiQk9SRUljaGVJKzYyTE5PSnVZTGpva3JsK0pWOEtZbUQ1bUZ6?=
 =?utf-8?B?QXRaVlpwYzdjdGU0VUxTQzB1ZG1uV21Ja3dhZ1RIakhXemZYSTJISUpaWXRT?=
 =?utf-8?B?ZWlpbjlzanQwdUJ3WnBJTXJsWUQ5RS84VEgzRFFBR0RJN1R3OG4zeCs5d290?=
 =?utf-8?B?S3kySzlBdHFMSXVJWExuaFZ1T3BiK0ZGcXRFNUxScjlGWUROcU1TbmluTnRi?=
 =?utf-8?B?SHA0b1JKaVJjY3B5eHl0bUx0SnVXU1NBYXlHNFBmKyt6cVJSRm5TZGN4anRq?=
 =?utf-8?B?MStXbmdyQjZxOVFBNmZZUGNKTGlNTXhtWG82c3Y4SVp3MnNSMnNnQ09SanVW?=
 =?utf-8?B?MUZWTHhrYVl1V3NrbGRXRWxQQ291NGd1RjJoRFEzNnRBNFVuOUxnZzY4UUVi?=
 =?utf-8?B?ei9GVTFuVUEzcmtVcW10bHBWV2hTWVpxOWpMMHBQYlZtRjZ3eGQ0dWpVaVYx?=
 =?utf-8?B?QlBuQ2grOUhFYW5oV3ZNTkVZRFZhQUhCT0ZpRWxoMFZBaThsem9MZWVlMFR6?=
 =?utf-8?B?QTlaWUhvdW90UjFYbXdLbDZKQUYrL2JSakZBdGgrSkJ5U29EZVFpMDRUeHRx?=
 =?utf-8?B?L01VOUN4RnVBY0RRZ2lmS1dIeUJ2VUxJWWZNbUJ3S2UyUXc0Smx2Nmh2anZV?=
 =?utf-8?B?cHJrczFJMlZOeHFpWUpxbDZLLy9EYzk0RXVPU0VoSDZSZXhkcmM2KzZLb3BM?=
 =?utf-8?B?OW41Ym5FL3drV2tLUFRzME83WjRXRXhFcGR5SzRnQkpYQzFSeUg2eXBhcDhJ?=
 =?utf-8?B?S3Vtckw0YmR2YW10YjF3cGF2MG1tMWpSU01ZVXA4YlNnSDhZZlIwcTBpMnZV?=
 =?utf-8?B?YkJ2VFZaSWhxZlF4NkdHRGRudWxUZUcrVWhuRVpZTGsyQURqSGlQMWM0NVN6?=
 =?utf-8?B?RUhGbWd5NFYybUg2WFVyWWQ3blpxMXhHSnlUNzgveHJycUMxTFdubXBjUEw4?=
 =?utf-8?Q?0AUrtStDjhOuk9cOLCv53Bhnc9k/b4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akFpUUtDaGlMUjhzdGhoL0haa05jYjZHM2NKeTJxa2REUnVML294RkJ6K01q?=
 =?utf-8?B?bEFNSGlNNE1IS011czlNdlpWNjVTbHhDNmNrR2NnNGkyK1RHZmhBZDd0STRl?=
 =?utf-8?B?bFNtTklVYXJEZHdhQWdPaVdjUXlpd3JnUnBJbWxpQnZqTm1BYi9vaW53aGRx?=
 =?utf-8?B?d3VobFUvQm44QlFjWVhOOGk2K2g4Z3BNRVU1RVV0S3lsQ0cxQk51MGFuZmo4?=
 =?utf-8?B?a1NmUVF1ZERaRmxGSFI3cjFhZDNvNmVRaXdlRDVNT2IyUFRieUNWL0s2ZlNp?=
 =?utf-8?B?cEtJOEVBd2haQmdmSlhKWVJ2WWRBWmIyemhOU2NENENSNERQbEJyR0I5dVNO?=
 =?utf-8?B?YXNxSjc5T2ZjWVRhMk9aVGhndlpwcGFVdmhQTkRwY1RnSG5FVnlJVVMzMk5I?=
 =?utf-8?B?YzZQMVJTSzNaNHNuVUdDc2hYMTdicXowTGppd3c5Y0pZek45V3RoZ0ZoWXQz?=
 =?utf-8?B?M0xJZ3JBay9qeEI1MnNZRnBPd2VKYm8zNHZUYk1wc1hCMUlvY29lS0MySXRv?=
 =?utf-8?B?Y0JLS25yWndMTFJEUEgwRmFlZzJ1N0Nqa1AycFlvUnJqejZiK2czNnJWZ0F5?=
 =?utf-8?B?OG40Unp5TlNFUFZpbnM5Ym04TVRiaDdjUWx3Q082TmlRM1ZMOFRSNVpkdytr?=
 =?utf-8?B?Z3RxS1V1SEI5bkk4K2JxMVVLejArR24vM0RUN2FwRU1TTi8xYWRwUGRKV0pY?=
 =?utf-8?B?QThsWTMydTJ1b1hUSHVEVGFZMHdZdUhiQzZPdVVnMzVwUFlqV3pZd0Rmd0hY?=
 =?utf-8?B?cTRQZHBCeUxkZ0pLdmxtTUZ6SFlNZ29CeWNlT3R1UUZRVUVYbmQrMm1oUFVJ?=
 =?utf-8?B?YWNPS0pScThZVlBUKzU0aUxrMS9rd2p0V01makpjZTZ3RmFDMWJDMEFmTjR4?=
 =?utf-8?B?TVJ5TFVUdEFIaDA0cFFvTFhDcGFEOGJGZExNRW0vMGRmTE54R0NYTWN5SjlM?=
 =?utf-8?B?OHo4OWRqL0VYL05Sdk5yVFY3ZTJwTSsyOXBxbHRZZkduSVJUWXNvWXdaRWh1?=
 =?utf-8?B?MDZMYXJleThOVkkxKzAxQzV1UGw4dzdhV2pWQWlvMm9CVTZHd0VKK1M5Ukxx?=
 =?utf-8?B?SzlXS3VONmdSMGRJSDYyZ0VFOEVCa01iN2JsSTZtOTZDSUQ5eW5aZnVXZms2?=
 =?utf-8?B?QlVaZ3FsY1FvZlNzUWxxMzNTM2ZlNWI5bEtpdGloRGE0NmxrdDlPNnRhZjNT?=
 =?utf-8?B?K0dFYkpXSHFER0RNZGIxTDlvc25oT2tqK0tzTUpyQ1p3NnhEK1AwY0hTYmU5?=
 =?utf-8?B?bTFHV0F2R2VKeXNuWXJmaHhFdTBhRlB2V3lxVURVUCtWc1ZmNkJlNnhGNTNx?=
 =?utf-8?B?Nk1JY3dVbnc2ck1QMmVDcS85ZUh3YTUrN3REbjkyVFp6aDlXY0FWNi9xSDhV?=
 =?utf-8?B?TzdLVEtHSjA5OVM3L3ZrWklDSGh4Y0ZLZmUvMnRYbGNidm84YXRnZW9WdGxW?=
 =?utf-8?B?M2ZsZVZmMVpFTXdTL1l0dU9UTm5TZjVGVngxTFBxSzJzSDdOYWx6b2t3Q2FN?=
 =?utf-8?B?eWpJRkhXQ1F6VXJCeHptWEZiV0JrZUUrelpKWm5pMnRBNmVkb2ZOMWh0TGUy?=
 =?utf-8?B?cUlEZndNVjZWN0RVNXlJT0ZQblgzOWtSSmE5T1hLUnlReUxiVEdBZlI5ZDYx?=
 =?utf-8?B?NERuSndmS1MyMmJ3ekpHYVVGck43ek9FYkJESHFQTCtwMmlYd0tJRExoNTZr?=
 =?utf-8?B?K3kzeHpNQUpEelpyRmJpRFdJUEhSYjIyVk5xcTRnTHVBR2YzSU43WkdmcWVY?=
 =?utf-8?B?SUdVV1pwclp5dkN2NTdDWE9lN0txOTRTS1JUc25NcjJzUGpySjNxOFRnMER2?=
 =?utf-8?B?Rjh2L0xRSDZvYml3QmNuYWE5SkJmOUt1YUpqWi9kbi9IbzBvVWF1ZlFDTmUz?=
 =?utf-8?B?S3lpOTQ5NWNTaERvcTlZMWpGLzVGN0VYTVRiQWZybjlwRlNMK0VNMkJVSkZR?=
 =?utf-8?B?SmFNTGRLN1lmdWVpUVZLaW95VjlISWhCN0xkaVoyU1R2TzdwOC9JWWJGVEds?=
 =?utf-8?B?cW5QMDRHTUs2NnFJQTBvNGljZkNVRDRXdGNXdEVKTVZtZXg0QlhVWFRCdDhK?=
 =?utf-8?B?K3QwN1hwUitJMThDdEtOOWR0NVJNOERBRCtZbEpjZENIeDBpWGZYRGRXQVBx?=
 =?utf-8?Q?gJHY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa10cd5-9426-41dc-8aa0-08dd9782b632
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 09:43:01.4275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1rdXr84kVnqBSByTbiZT6z+hngNGZywfDZqqDHDTgLnn1F4AbAJyeTuEbbDGztoSa52WZicjzpqZ9uEKyTYiqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7798

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAyMCwgMjAyNSA1
OjE2IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENjOiBI
dWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMu
dGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdQ0KPiBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVu
LQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0
IDA1LzE1XSB4ZW4veDg2OiBpbnRyb2R1Y2UgImNwdWZyZXE9YW1kLWNwcGMiIHhlbg0KPiBjbWRs
aW5lDQo+DQo+IE9uIDIwLjA1LjIwMjUgMTA6MjgsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPiBb
UHVibGljXQ0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogTW9uZGF5LCBNYXkg
MTksIDIwMjUgOToxOSBQTQ0KPiA+PiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQu
Y29tPg0KPiA+PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29v
cGVyDQo+ID4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQNCj4g
Pj4gPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6
ZWxAYW1kLmNvbT47DQo+ID4+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQ
YXUgTW9ubsOpDQo+ID4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+ID4+IHhlbi0gZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwNS8xNV0geGVuL3g4NjogaW50
cm9kdWNlICJjcHVmcmVxPWFtZC1jcHBjIg0KPiA+PiB4ZW4gY21kbGluZQ0KPiA+Pg0KPiA+PiBP
biAxOS4wNS4yMDI1IDEwOjM2LCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4+PiBbUHVibGljXQ0K
PiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiBUdWVzZGF5LCBBcHJp
bCAyOSwgMjAyNSA4OjUyIFBNDQo+ID4+Pj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdA
YW1kLmNvbT4NCj4gPj4+PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRy
ZXcgQ29vcGVyDQo+ID4+Pj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBF
UkFSRA0KPiA+Pj4+IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6ZWwsIE1pY2hhbCA8
TWljaGFsLk9yemVsQGFtZC5jb20+Ow0KPiA+Pj4+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+OyBSb2dlciBQYXUgTW9ubsOpDQo+ID4+Pj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3Rl
ZmFubyBTdGFiZWxsaW5pDQo+ID4+Pj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiA+Pj4+
IHhlbi0gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BB
VENIIHY0IDA1LzE1XSB4ZW4veDg2OiBpbnRyb2R1Y2UgImNwdWZyZXE9YW1kLWNwcGMiDQo+ID4+
Pj4geGVuIGNtZGxpbmUNCj4gPj4+Pg0KPiA+Pj4+IE9uIDE0LjA0LjIwMjUgMDk6NDAsIFBlbm55
IFpoZW5nIHdyb3RlOg0KPiA+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hY3BpL2NwdWZyZXEvcHJv
Y2Vzc29yX3BlcmYuaA0KPiA+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS9hY3BpL2NwdWZyZXEvcHJv
Y2Vzc29yX3BlcmYuaA0KPiA+Pj4+PiBAQCAtNSw2ICs1LDkgQEANCj4gPj4+Pj4gICNpbmNsdWRl
IDxwdWJsaWMvc3lzY3RsLmg+DQo+ID4+Pj4+ICAjaW5jbHVkZSA8eGVuL2FjcGkuaD4NCj4gPj4+
Pj4NCj4gPj4+Pj4gKy8qIGFiaWxpdHkgYml0cyAqLw0KPiA+Pj4+PiArI2RlZmluZSBYRU5fUFJP
Q0VTU09SX1BNX0NQUEMgICA4DQo+ID4+Pj4NCj4gPj4+PiBUaGlzIG5lZWRzIGNvcnJlbGF0aW5n
IChhdCBsZWFzdCB2aWEgY29tbWVudGFyeSwgYmV0dGVyIGJ5DQo+ID4+Pj4gYnVpbGQtdGltZQ0K
PiA+Pj4+IGNoZWNraW5nKSB3aXRoIHRoZSBvdGhlciBYRU5fUFJPQ0VTU09SX1BNXyogdmFsdWVz
LiBPdGhlcndpc2UNCj4gPj4gc29tZW9uZQ0KPiA+Pj4+IGFkZGluZyBhIG5ldyAjZGVmaW5lIGlu
IHRoZSBwdWJsaWMgaGVhZGVyIG1heSBub3QgKGVhc2lseSkgbm90aWNlIGENCj4gPj4+PiBwb3Nz
aWJsZSBjb25mbGljdC4gV2l0aCB0aGF0IGluIG1pbmQgSSBhbHNvIHF1ZXN0aW9uIHdoZXRoZXIg
OCBpcw0KPiA+Pj4+IGFjdHVhbGx5IGEgZ29vZCBjaG9pY2U6IFRoYXQncyB0aGUgb2J2aW91cyBu
ZXh0IHZhbHVlIHRvIHVzZSBpbiB0aGUNCj4gPj4+PiBwdWJsaWMgaW50ZXJmYWNlLiBTSUZfUE1f
TUFTSyBpcyA4IGJpdHMgd2lkZSwgc28gYSBzZW5zaWJsZSB2YWx1ZQ0KPiA+Pj4+IHRvIHVzZSBo
ZXJlDQo+ID4+IHdvdWxkIGJ5IGUuZy4gMHgxMDAuDQo+ID4+Pj4NCj4gPj4+DQo+ID4+PiBJJ3Zl
IGFkZGVkIGEgcHVibGljIGZsYWcgYW5jaG9yICJYRU5fUFJPQ0VTU09SX1BNX1BVQkxJQ19FTkQi
IGluDQo+ID4+IHB1YmxpYyBoZWFkZXI6DQo+ID4+PiAgICAgICAgICAjZGVmaW5lIFhFTl9QUk9D
RVNTT1JfUE1fUFVCTElDX0VORA0KPiA+PiBYRU5fUFJPQ0VTU09SX1BNX1RYDQo+ID4+PiBhbmQg
d2lsbCBkbyB0aGUgZm9sbG93aW5nIGJ1aWxkLXRpbWUgY2hlY2tpbmc6DQo+ID4+PiAgICAgICAg
IEJVSUxEX0JVR19PTihYRU5fUFJPQ0VTU09SX1BNX0NQUEMgPD0NCj4gPj4+IFhFTl9QUk9DRVNT
T1JfUE1fUFVCTElDX0VORCk7DQo+ID4+DQo+ID4+IEkgZG9uJ3QgcmVhbGx5IHNlZSB3aHkgYW55
dGhpbmcgd291bGQgbmVlZCB0byBiZSBhZGRlZCB0byB0aGUgcHVibGljDQo+ID4+IGhlYWRlciAo
YW5kIHdlIHJlYWxseSBzaG91bGQgc3RyaXZlIHRvIGF2b2lkIHVubmVjZXNzYXJ5IGFkZGl0aW9u
cykuDQo+ID4NCj4gPiBJZiBJIHB1dCBzdWNoIGRlZmluaXRpb24NCj4gPiAiI2RlZmluZSBYRU5f
UFJPQ0VTU09SX1BNX1BVQkxJQ19FTkQgWEVOX1BST0NFU1NPUl9QTV9UWCINCj4gPiBpbiBpbnRl
cm5hbCBoZWFkZXIsIEknbSBhZnJhaWQgaXQgd29uJ3QgYmUgdXBkYXRlZCBpZiBuZXcgb25lcyBh
ZGRlZCBpbiB0aGUgcHVibGljIGluDQo+IHRoZSBmdXR1cmUuDQo+ID4gT3IgYW55IG90aGVyIHN1
Z2dlc3Rpb25zIHRvIHByb3ZpZGUgYnVpbGQtdGltZSBjaGVja2luZz8NCj4NCj4gSW1vIGl0J3Mg
c3VmZmljaWVudCB0byBjaGVjayB0aGF0IHRoZSBuZXcgI2RlZmluZSBkb2Vzbid0IG92ZXJsYXAg
d2l0aA0KPiBTSUZfUE1fTUFTSy4NCg0KVW5kZXJzdG9vZCENCg0KPg0KPiBKYW4NCg==

