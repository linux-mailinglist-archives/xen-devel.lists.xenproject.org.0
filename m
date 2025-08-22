Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F3BB32096
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 18:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090369.1447650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upUiT-000198-94; Fri, 22 Aug 2025 16:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090369.1447650; Fri, 22 Aug 2025 16:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upUiT-00016G-5B; Fri, 22 Aug 2025 16:34:13 +0000
Received: by outflank-mailman (input) for mailman id 1090369;
 Fri, 22 Aug 2025 16:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kk10=3C=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1upUiR-00016A-0L
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 16:34:11 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d22431ec-7f75-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 18:34:06 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DB3PR0302MB8920.eurprd03.prod.outlook.com (2603:10a6:10:432::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 16:34:03 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 16:34:02 +0000
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
X-Inumbo-ID: d22431ec-7f75-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpvLyL3zxS3OS1R7egnx690x8zFIa7bbfR2mPylTpVpJnwoa3D1/2qSe1N9qLGOAd4sl3jwnJKuX85qHTBEJX3D/bElApZxQRH+7Tm6CGxfDrait7nsRe1BEFyhNj+I48cF213qe8yEofwaE0UTeKwStaOSuUKf4i8MRpEKQ1A+KcCG+1L3IAjApAD8CVPLNgH2dM1/0Gn7Af510Dz0EOlggiHhzbCGvj4aILqo+ace9K/qwpgrDPlMwMLpEiYo2piigaAuR+o/xwC2n1fx1xfqWpUITvUFvGqBAh5UnCwqpid/CjK2BEYsFrfN5JZX9SwufDpwJ2v3czTN9JVcwTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Y6ODFH/756JWMtgUFfh4CRHPL1Hulj7MsTRf+uwGHg=;
 b=XJUEWwEHaUrAUxCz/sOprfHFnYJkLDUxLh+siOYGQwxhWMQXxcCoA2VBzKHqSsriI0+Ud3Jz5xF0DxfTAhiy8x/0aThXvB2NdgfLb+UXLDTs8RXEp91ul7y29N2WuuY7NqccX4PR0ZOYpFQpWjwzW641tSIw8ixr+4wIwTGmKVoYszF2dXfmEdwiar80tI1OMwFBnnSy+PdpVuYk0TxuwPG7Y44otHNo+kIneYMzsYDToV5hRkXH1VgKKNxndmWEFBcxraPl6kmyWLF1K1hpANuuqEIOaZJogPIR7p9wkuCuczzpckPwOo5TvglQJOfvZA1mwUQ1XESZB312gFA5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Y6ODFH/756JWMtgUFfh4CRHPL1Hulj7MsTRf+uwGHg=;
 b=ET4kBQZ7u18oJjzq8nhhz7AL1pl/O4jFucO3uvh7ubiafB8ICuA98KTvOLF1nmMsX6UanIGx60hYCGOzp32LQrz5UVHC05cjmjxZ9+WHN+NaP1yTbn8frj92YmdzJS13tvJP3X6xIMRL0ofvDXjyYFDtsw7N+6dJ6Sw5ZEpLNtcH14wuq053gwUoYjzY7NauasNwcAm3x3CP0/o5mBLlNsgnQWYdOdq8zW6gBEHcHHU5Fg1BsHBJhCfQH5j/4N6An8RHEix7G+rDU/NoGV571hsLdVb1uBaqF0Lf5zEg3jW39oabo8Ep7CLC0FrAsiNxXG2n9b1NXuENDruPKwMusw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: consider conversion from UL or (void*) to function
 pointer as safe
Thread-Topic: [PATCH] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Index: AQHcETrg9Y9S2hDXvUqVfYmm522krbRswSIAgAAGvACAAhrPAA==
Date: Fri, 22 Aug 2025 16:34:02 +0000
Message-ID: <6b912698-b871-4819-ac30-14325d0be146@epam.com>
References:
 <9e5e4ff2c7ba0a90a6ac403e2de9318e18949274.1755628705.git.dmytro_prokopchuk1@epam.com>
 <90fb95a3-4b32-4785-a77c-373e5b9da6ed@suse.com>
 <e1e2abdf0ef8708097aa78440eeb7147@bugseng.com>
In-Reply-To: <e1e2abdf0ef8708097aa78440eeb7147@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DB3PR0302MB8920:EE_
x-ms-office365-filtering-correlation-id: d4cc2f8e-ab47-4d26-38be-08dde199b463
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|42112799006|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VVFra0phUnBBcHY0SnZ2L2oxa3ZSeU1ydldQVTBVVWZuTVlHSHo2ZGpGZXJ1?=
 =?utf-8?B?eGhVVk5qTEhNanJ1YnAwUWtaTlB6bWVWaWxjdFJhN041RzgyVndvd0pzVExY?=
 =?utf-8?B?WHZHYUJ3dkNqRXgzS0FoaVJrZzZ1eFpoSWxMays3bkk0UFNMVXBIa0lTMmQ2?=
 =?utf-8?B?TG5OTG03OTF3Q1ZUU1RQVmN5TEZoUDJ6cDZiMWwyd1JJT3VzVVQ0M052ZjFt?=
 =?utf-8?B?UkgyRjN0L0ttTnFlQ3lObEM3L3BiR2Q2VExhQW9FMFpvVnY5eXFibEVCUW9p?=
 =?utf-8?B?VlVGVmMvcVFad0tjMWw1UWh6TkMvNFlxbEpvK0d2VkNINXh6L3VwRU02K1E3?=
 =?utf-8?B?QXU2UUZicEV5R0JCOGZuaTVqSjNZRGtwZkdrY1RqeGh3SUpKY0FxYjFiTnVu?=
 =?utf-8?B?VU4yYTdkaHhWQkIxV1lJakp1cXhZcU5IL01yVWJEckFQS1ZYakx2ZXR4aStK?=
 =?utf-8?B?Q0JSSGxZcDY4Y21NcDhXcVh6ZFFKb1JaamxDSlpoLzA4eFRLWnRHd053N1JC?=
 =?utf-8?B?NVk4Q3h3Sm0vV0I5eXU5aURMeFh3UW9FOHJVSGtMT0V0VG1Gb2czUk9BQ2M1?=
 =?utf-8?B?TytLR3VHaG9IY1FOTE1qYmxxaVdFYk1zWjNZQ1dpZE54Zyt1eWpkZm1DL2Ju?=
 =?utf-8?B?RHIyTXRRQkFYWWU0T3h2VVRucmU0OEYrbGprTnVtY3hlZVJ0U2FLd09QQWFJ?=
 =?utf-8?B?V0crUVkxbjZUdnEyelpieDYveE5XWUJRMGEzd1pxdXB0NXBKODRCNGdZRFhE?=
 =?utf-8?B?RVllK21UbktKR3BUaDNkUzAyeUJ1YUo1NWtBRGJlaE9kTUkwKzdWd1pHVGRV?=
 =?utf-8?B?M3dSVm1xckt5U0lBODFCZHRFcmtac1JEbHpzQUxOU1JqQjN3ZDF0alBpRDlI?=
 =?utf-8?B?SXBtbG1CN2c5cnJrcFluTGp2bGRoUHlYM3plVmpMNG44QUFwYjF3WkNaN0dG?=
 =?utf-8?B?SG0yaFBGaFMxM050UTFpVlFSTUVVNnFhVjJ5ZzJhUEhZOXJnd00xZkY5ZGZ0?=
 =?utf-8?B?R1kvZFF6MmVFWEhvTWhKNklpZXpoMWUwUm5vcTNUL1pDaHdlUTdzNk1hQUZF?=
 =?utf-8?B?aUZNYjdLVGV1WWFJTTlrOUp2VGJJbEdQcEVwZ3ZkRW43dE43eURtSW43Q2Er?=
 =?utf-8?B?THVGWW0xMEVyODQzSS8vN3VDWEh5NzlzaElQdlFLNkozRFdXRXFQYndjRHdB?=
 =?utf-8?B?SmtUV0ZSVWQyVXVyRFJoNmZsZ3NNZ2M4aWJhOWFCcUYzRXp2RjRsYmdvbzhT?=
 =?utf-8?B?NUtRS1pQOHh2MmlIRHNQRllNVnNsYWh1QWl0L09idlFWa01xL2dhUGdrbGR5?=
 =?utf-8?B?T3FaY0xHcnFTTEVWUlBRLzBwRzE1UXBJNVZPcWZ0bzZXLzhDNGFKVG9rZnQz?=
 =?utf-8?B?a0VHQTh4NFczTi8xVmJTVmRHeVU1NkVyZk1CRjNDVFNNM0dLQXlZVUlYWERo?=
 =?utf-8?B?RmphV29IOG8wbU9uZG91SFQxU3JaMG4rNVZHcTlhc0hMclFGT0VwbDVDL2Vr?=
 =?utf-8?B?dkNkMndsSnBkcXBZRGpXYTl6M3pQVkZ6YjJRQUhuM1l3djlwTWhMTmJjbVFV?=
 =?utf-8?B?dzR1WXpLMVMzK0lCQWVHaHhzbTJJK2EzMTRPTFlWRGdvaENkZk5IbHM1aFZo?=
 =?utf-8?B?UTUxRGozMGJsVnpvcjdHc3gvTGhGWVg0TkpxOElUMk1Pc0xMUzVnd3dGZElK?=
 =?utf-8?B?RWxqb0hiSk1OQ1pWajhyd0NmdFJUUi9LQ1Z4bTNlQkw0NGdHNGZac3l5SzI0?=
 =?utf-8?B?eHVibkJ3b1U0blBFWVFaN0ltNE9sanR0eGwrNzkrSEdqaE9SeHd6UDZDRTA0?=
 =?utf-8?B?ZFQ4V2RIcUovaHBrcVRmaVlFRkh0NTdEWnhrTHNVVXk3U0VvTGI3amFyL1Nz?=
 =?utf-8?B?MjI5eXRhdjN2SWYySW1KQkRJK1ZWVjFDS2tvMWwxZTVUSWRza0JBYmtOVzdE?=
 =?utf-8?B?OWYrNEJlVkZmTGd5OUhDbzZNQ3FROGowbFNnOUlLTWxRWXRjU25tTUtXT3lF?=
 =?utf-8?B?R1hEQ0hYSjJBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(42112799006)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkgyWktPUmVUQkVLcXMxTjkrc2J5Q25UNFkrYk95RnNuTUszcUdGTmxzYkwr?=
 =?utf-8?B?ZkEyTDViMXk4K3Y2RGdvVDlQSkk5QzlPSmZzdG00eHphaEdoVm5Ic0Rjdjd6?=
 =?utf-8?B?S3RMcHpncVVKUnl4VjU4N3pVRkkwTTc0T3VvUHorMmhrWEFuZ3dMV2VtTS90?=
 =?utf-8?B?dXdwSEg2RG5GOUdUOUhmVGMwcFNrZW9wZVJNdE1jOTJiMVhZTXl0eWd1am8w?=
 =?utf-8?B?SkU3QUU2b3NRWFpCUFhmeUZ1ek5VMExrR2h6bVNGKzNsamloR3VBZjdrbXZj?=
 =?utf-8?B?Z09nTG1TUDZnaVg0UFdENkZUNXFCajhLdWtoU0JXQVdZYTRoUUNQUWMxQ3hw?=
 =?utf-8?B?M1N6aG1pZWpWemVmSEE4N0F4M2VXc0s5RVhzRDA2YzZZbW5xN21iRmRlRHNE?=
 =?utf-8?B?QjFlMzNSL1V5UVBEQVpVQUIzMG1hZGNUYjVocDNzT3ZaNDQ1RTJOcE05dnZD?=
 =?utf-8?B?Mmg1eStXM3VOWU1jTWV0NWljQzBETU9XKy9IOWtLMjM2K0dreWFCUDEzdFlu?=
 =?utf-8?B?MnpVVlVCZkZHeGJqbFpLblhkMUZOcGVyZFgrZHErY2dhL2hiNWxoLzlBZ0NK?=
 =?utf-8?B?cmNrN3hSUXg4aGtDWFlPbDdlbTJtbGtEbGF6RXRMOXhXeWkrdUdQbElOSzVN?=
 =?utf-8?B?a0FjWEY1L2ZuRCtSYUYyVVlTTTZuUDdZSzE0U3dPK1p5YWVkQ2k5NXB3aTla?=
 =?utf-8?B?blpza1VNVkptWmcrRTQ2MkJXeDNqSUMvRENnM1RKcXN3L2ZaMVJhd2p4OGx6?=
 =?utf-8?B?ZDM3TjVLa1FGZ1kvS0hpQ0xFZndPWkZGcGRYVXltZnIxOUphVEt4Q3Y2YkVi?=
 =?utf-8?B?WjNBOGkwVXN1cGxaTUpaeFFzWFExQ3pjSFg2T3dVUXd1THlXMnQ0QUpXOFhx?=
 =?utf-8?B?UXZyTTVuUW84UGwzY3pHVkF0UmNoZ0RDQ3c5M1QxUmRFVjVST3g5dm53bEZV?=
 =?utf-8?B?RG4vMTZZMVNINksxUzdKSWFrbGVtSkV0dElTL2tzd0Z6a0NyREF6MGlUZ2s2?=
 =?utf-8?B?MkhPRjE5eW9UajdiaHpxNjA1dUZidmZaWldUUnFtamVxcU54enluVjJ6ZDh3?=
 =?utf-8?B?bXRLcnAydVM5MVhkdGNIMlFyVGsrM0RXcTFpME45ODBPNE9sblBVRnRnV1No?=
 =?utf-8?B?VjZLejRQY281eDRISU5UVmRackt6YlZDS0NYeVg0eTd1K0VQYUxRSHBmb0Rk?=
 =?utf-8?B?WXNJaTBwNFUvcVQ4aU1xaVo5UWFYWm9NZWJhRVcrZnEya2NLRURRdFFtWW5Z?=
 =?utf-8?B?K1NqdE1YS2c2a0M2Vy9UcElJRVZhSGpSTitUbVVCYlBVWFBMazk4dXpaZDNR?=
 =?utf-8?B?T3FzNkdtTGU0ZlNxSW1IakJnaE0vd2lCQmdYRjBoZHIwUjlVeSs0V3NzT294?=
 =?utf-8?B?U0VGRDFKemRhZ3FjRkoxMmxha21XYkpnaEZjT3JHMXNIdzRSdVF0UWdtOXRG?=
 =?utf-8?B?K3lveGdyMC9URXNsWlZqejBEWFc1UlhhV1RjbDNYMjNINUMwekxkSmdWeFlO?=
 =?utf-8?B?bDk0QmQ4OUUwb2YxWWhPWUtabjBjeEVNNU5nQmpQWGVTajFOd2R1ZktUYjdr?=
 =?utf-8?B?bDR5bzlGT2FJZ0xkaHhvTHZ4MW1vT29BekNWcFVYR05VUW5PcW0wajNzNG00?=
 =?utf-8?B?dE9NM0p6MWJ4cHN2WEpuZGQyTkNkUFJCaTRhajBTUTRWQ2lkazJlUnBZWDhw?=
 =?utf-8?B?UmhBOS9oSkJnNlU3NWRBWjV4NzdlTnBaS3pEY2dybXFxTTIwRDMxaS9BZFlX?=
 =?utf-8?B?Z1AxTXJidjRRQ3FkV2RLZzlNeXByTUFXNmNIREpBTjFlWEEyZ1lQamJEQkQ1?=
 =?utf-8?B?UkkveVNPUHFYYUhTTS80UlpuVTBWRmRNU2k1Yzl4UlhJOXNvd2ZKTFc3UnlS?=
 =?utf-8?B?Ui95QVZhM1dkVjVDMTBuVXI2Tk4zN3hwSE5ObUtyVU1JMEQ1Rm9DOC8vTTlr?=
 =?utf-8?B?YlE1ek5GNjNpOGRjcTF0MWlCWmpWMENHc2xoQ3pGKzh5MWZDZ2UrNnJKRlVR?=
 =?utf-8?B?dkx3eklFaTVXcWlNWHRIaTc3dmU1NENvQWc0WGtsbU52OHNib0ZIQURWVCsw?=
 =?utf-8?B?THdKaFl2NTdsdEx5ei9HMVpqVlBJZXBtd2VPUzlYNmRNRll4S1pibXhXQkVK?=
 =?utf-8?B?OWlFR0pDUjBBc3ZaaTlERTFpQ2NiMEQxMDh1T2x0c3JBR25HamxBSnJFV0Na?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7CBFDEA83DA9E4F949DC0A91D30549D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4cc2f8e-ab47-4d26-38be-08dde199b463
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 16:34:02.8788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MTyogdczAtVaGYwB00dIaJlXjjiSzZdovhyPtO37/fHKyvI0+4pqBeRXIEst7AtBfi9EO8OUNK2fUxVwJJFhOqBlhbfst1u/Bu7Bbu7j6hU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB8920

DQoNCk9uIDgvMjEvMjUgMTE6MjUsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTA4
LTIxIDEwOjAxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDE5LjA4LjIwMjUgMjA6NTUsIERt
eXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+PiBSdWxlIDExLjEgc3RhdGVzIGFzIGZvbGxvd2lu
ZzogIkNvbnZlcnNpb25zIHNoYWxsIG5vdCBiZSBwZXJmb3JtZWQNCj4+PiBiZXR3ZWVuIGEgcG9p
bnRlciB0byBhIGZ1bmN0aW9uIGFuZCBhbnkgb3RoZXIgdHlwZS4iDQo+Pj4NCj4+PiBUaGUgY29u
dmVyc2lvbiBmcm9tIHVuc2lnbmVkIGxvbmcgb3IgKHZvaWQgKikgdG8gYSBmdW5jdGlvbiBwb2lu
dGVyDQo+Pj4gaXMgc2FmZSBpbiBYZW4gYmVjYXVzZSB0aGUgYXJjaGl0ZWN0dXJlcyBpdCBzdXBw
b3J0cyAoZS5nLiwgeDg2IGFuZA0KPj4+IEFSTSkgZ3VhcmFudGVlIGNvbXBhdGlibGUgcmVwcmVz
ZW50YXRpb25zIGJldHdlZW4gdGhlc2UgdHlwZXMuDQo+Pg0KPj4gSSB0aGluayB3ZSBuZWVkIHRv
IGJlIGFzIHByZWNpc2UgYXMgcG9zc2libGUgaGVyZS4gVGhlIGFyY2hpdGVjdHVyZXMNCj4+IGd1
YXJhbnRlZSBub3RoaW5nLCB0aGV5IG9ubHkgb2ZmZXIgbmVjZXNzYXJ5IGZ1bmRhbWVudGFscy4g
SW4gdGhlDQo+PiBXaW5kb3dzIHg4NiBBQkksIGZvciBleGFtcGxlLCB5b3UgY2FuJ3QgY29udmVy
dCBwb2ludGVycyB0by9mcm9tIGxvbmdzDQo+PiB3aXRob3V0IGxvc2luZyBkYXRhLiBXaGF0IHdl
IGJ1aWxkIHVwb24gaXMgd2hhdCByZXNwZWN0aXZlIEFCSXMgc2F5LA0KPj4gcG9zc2libHkgaW4g
Y29tYmluYXRpb24gb2YgaW1wbGVtZW50YXRpb24gc3BlY2lmaWNzIGxlZnQgdG8gY29tcGlsZXJz
Lg0KPj4NCj4gDQo+ICsxLCBhIG1lbnRpb24gb2YgdGhlIGNvbXBpbGVycyBhbmQgdGFyZ2V0cyB0
aGlzIGRldmlhdGlvbiByZWxpZXMgdXBvbiBpcyANCj4gbmVlZGVkLg0KDQpNYXliZSB3aXRoIHRo
aXMgd29yZGluZzoNCg0KVGhpcyBkZXZpYXRpb24gaXMgYmFzZWQgb24gdGhlIGd1YXJhbnRlZXMg
cHJvdmlkZWQgYnkgdGhlIHNwZWNpZmljIEFCSXMNCihlLmcuLCBBUk0gQUFQQ1MpIGFuZCBjb21w
aWxlcnMgKGUuZy4sIEdDQykgc3VwcG9ydGVkIGluIFhlbi4gVGhlc2UgQUJJcw0KZ3VhcmFudGVl
IGNvbXBhdGlibGUgcmVwcmVzZW50YXRpb25zIGZvciAndm9pZCAqJywgJ3Vuc2lnbmVkIGxvbmcn
IGFuZA0KZnVuY3Rpb24gcG9pbnRlcnMgZm9yIHRoZSBzdXBwb3J0ZWQgdGFyZ2V0IHBsYXRmb3Jt
cy4gVGhpcyBiZWhhdmlvciBpcw0KYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGFuZCBtYXkgbm90IGJl
IHBvcnRhYmxlIG91dHNpZGUgb2Ygc3VwcG9ydGVkDQplbnZpcm9ubWVudHMuDQoNCj4gDQo+Pj4g
LS0tIGEvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0KPj4+ICsrKyBiL2RvY3MvbWlzcmEvZGV2
aWF0aW9ucy5yc3QNCj4+PiBAQCAtMzcwLDYgKzM3MCwxNiBAQCBEZXZpYXRpb25zIHJlbGF0ZWQg
dG8gTUlTUkEgQzoyMDEyIFJ1bGVzOg0KPj4+IMKgwqDCoMKgwqDCoMKgIHRvIHN0b3JlIGl0Lg0K
Pj4+IMKgwqDCoMKgwqAgLSBUYWdnZWQgYXMgYHNhZmVgIGZvciBFQ0xBSVIuDQo+Pj4NCj4+PiAr
wqDCoCAqIC0gUjExLjENCj4+PiArwqDCoMKgwqAgLSBUaGUgY29udmVyc2lvbiBmcm9tIHVuc2ln
bmVkIGxvbmcgb3IgKHZvaWQgXCopIHRvIGEgZnVuY3Rpb24gDQo+Pj4gcG9pbnRlciBkb2VzDQo+
Pj4gK8KgwqDCoMKgwqDCoCBub3QgbG9zZSBhbnkgaW5mb3JtYXRpb24gb3IgdmlvbGF0ZSB0eXBl
IHNhZmV0eSBhc3N1bXB0aW9ucyANCj4+PiBpZiB1bnNpZ25lZA0KPj4+ICvCoMKgwqDCoMKgwqAg
bG9uZyBvciAodm9pZCBcKikgdHlwZSBpcyBndWFyYW50ZWVkIHRvIGJlIHRoZSBzYW1lIGJpdCBz
aXplIA0KPj4+IGFzIGENCj4+PiArwqDCoMKgwqDCoMKgIGZ1bmN0aW9uIHBvaW50ZXIuIFRoaXMg
ZW5zdXJlcyB0aGF0IHRoZSBmdW5jdGlvbiBwb2ludGVyIGNhbiANCj4+PiBiZSBmdWxseQ0KPj4+
ICvCoMKgwqDCoMKgwqAgcmVwcmVzZW50ZWQgd2l0aG91dCB0cnVuY2F0aW9uIG9yIGNvcnJ1cHRp
b24uIFRoZSBtYWNybyANCj4+PiBCVUlMRF9CVUdfT04gaXMNCj4+PiArwqDCoMKgwqDCoMKgIGlu
dGVncmF0ZWQgaW50byB4ZW4vY29tbW9uL3ZlcnNpb24uYyB0byBjb25maXJtIGNvbnZlcnNpb24g
DQo+Pj4gY29tcGF0aWJpbGl0eQ0KPj4+ICvCoMKgwqDCoMKgwqAgYWNyb3NzIGFsbCB0YXJnZXQg
cGxhdGZvcm1zLg0KPj4+ICvCoMKgwqDCoCAtIFRhZ2dlZCBhcyBgc2FmZWAgZm9yIEVDTEFJUi4N
Cj4+DQo+PiBXaHkgdGhlIGVzY2FwaW5nIG9mICogaGVyZSwgd2hlbiAuLi4NCj4+DQo+Pj4gLS0t
IGEvZG9jcy9taXNyYS9ydWxlcy5yc3QNCj4+PiArKysgYi9kb2NzL21pc3JhL3J1bGVzLnJzdA0K
Pj4+IEBAIC00MzEsNyArNDMxLDEzIEBAIG1haW50YWluZXJzIGlmIHlvdSB3YW50IHRvIHN1Z2dl
c3QgYSBjaGFuZ2UuDQo+Pj4gwqDCoMKgwqDCoCAtIEFsbCBjb252ZXJzaW9ucyB0byBpbnRlZ2Vy
IHR5cGVzIGFyZSBwZXJtaXR0ZWQgaWYgdGhlIA0KPj4+IGRlc3RpbmF0aW9uDQo+Pj4gwqDCoMKg
wqDCoMKgwqAgdHlwZSBoYXMgZW5vdWdoIGJpdHMgdG8gaG9sZCB0aGUgZW50aXJlIHZhbHVlLiBD
b252ZXJzaW9ucyB0byANCj4+PiBib29sDQo+Pj4gwqDCoMKgwqDCoMKgwqAgYW5kIHZvaWQqIGFy
ZSBwZXJtaXR0ZWQuIENvbnZlcnNpb25zIGZyb20gJ3ZvaWQgbm9yZXR1cm4gKCopIA0KPj4+ICgu
Li4pJw0KPj4+IC3CoMKgwqDCoMKgwqAgdG8gJ3ZvaWQgKCopKC4uLiknIGFyZSBwZXJtaXR0ZWQu
DQo+Pj4gK8KgwqDCoMKgwqDCoCB0byAndm9pZCAoKikoLi4uKScgYXJlIHBlcm1pdHRlZC4gQ29u
dmVyc2lvbnMgZnJvbSB1bnNpZ25lZCANCj4+PiBsb25nIG9yDQo+Pj4gK8KgwqDCoMKgwqDCoCAo
dm9pZCBcKikgdG8gYSBmdW5jdGlvbiBwb2ludGVyIGFyZSBwZXJtaXR0ZWQgaWYgdGhlIHNvdXJj
ZSANCj4+PiB0eXBlIGhhcw0KPj4+ICvCoMKgwqDCoMKgwqAgZW5vdWdoIGJpdHMgdG8gcmVzdG9y
ZSBmdW5jdGlvbiBwb2ludGVyIHdpdGhvdXQgdHJ1bmNhdGlvbiBvciANCj4+PiBjb3JydXB0aW9u
Lg0KPj4+ICvCoMKgwqDCoMKgwqAgRXhhbXBsZTo6DQo+Pj4gKw0KPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1bnNpZ25lZCBsb25nIGZ1bmNfYWRkciA9ICh1bnNpZ25lZCBsb25nKSZzb21lX2Z1
bmN0aW9uOw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lkICgqcmVzdG9yZWRfZnVuYyko
dm9pZCkgPSAodm9pZCAoKikodm9pZCkpZnVuY19hZGRyOw0KPj4NCj4+IC4uLiBjb250ZXh0IGhl
cmUgc3VnZ2VzdHMgdGhleSB3b3JrIGZpbmUgdW4tZXNjYXBlZCwgYW5kIHlvdSBldmVuIGFkZCAN
Cj4+IHNvbWUgdW4tDQo+PiBlc2NhcGVkIGluc3RhbmNlcyBhcyB3ZWxsLiBQZXJoYXBzIEknbSBz
aW1wbHkgdW5hd2FyZSBvZiBzb21lIA0KPj4gcGVjdWxpYXJpdHk/DQo+Pg0KPiANCj4gVGhpcyBp
cyBhIGxpdGVyYWwgcnN0IGJsb2NrLCB3aGlsZSB0aGUgb3RoZXIgaXMgbm90ICgqIGFjdHMgYXMg
YSBidWxsZXQgDQo+IHBvaW50IGluIHJzdCBpaXJjKQ0KDQpUaGlzIGlzIGhvdyAic3BoaW54LWJ1
aWxkIiB0b29sIGludGVycHJldHMgdGhpcy4NCjEuICogaW5zaWRlIHNpbmdsZSBxdW90ZXMgJycg
LT4gbG9va3Mgbm9ybWFsLCBlLmcuIOKAmHZvaWQgKCopKOKApinigJkNCjIuICogd2l0aG91dCBx
dW90ZXMgLT4gd2FybmluZw0KZGV2aWF0aW9ucy5yc3Q6MzY5OiBXQVJOSU5HOiBJbmxpbmUgZW1w
aGFzaXMgc3RhcnQtc3RyaW5nIHdpdGhvdXQgDQplbmQtc3RyaW5nLiBbZG9jdXRpbHNdDQozLiBc
KiAtPiBsb29rcyBub3JtYWwsIGUuZy4gKHZvaWQgKikNCg0KQmVjYXVzZSB0aGF0IHdlIG5lZWQg
c3VjaCBmb3JtYXQ6IFwqDQoNCkRteXRyby4NCg0KPiANCj4+IEphbg0KPiANCg==

