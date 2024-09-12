Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF578975EB6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 04:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796986.1206747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soZ96-00074O-Vt; Thu, 12 Sep 2024 02:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796986.1206747; Thu, 12 Sep 2024 02:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soZ96-00071u-T3; Thu, 12 Sep 2024 02:01:20 +0000
Received: by outflank-mailman (input) for mailman id 796986;
 Thu, 12 Sep 2024 02:01:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fPl=QK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1soZ95-00071j-Mr
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 02:01:19 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e88::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5c2ce83-70aa-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 04:01:18 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB7826.namprd12.prod.outlook.com (2603:10b6:8:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 02:01:14 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 02:01:13 +0000
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
X-Inumbo-ID: e5c2ce83-70aa-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGVb2PSeie53Rg8WCr4hSUXe0LffJIpfqKBb1SoHfc81PjEGO+ZZv0HPe9m/9QAMFZ6/Xg+NJV2J5AXBJyPY/PcjSiAOyr2OzuvN5LvMklt98EE/gMeNNjt7eAQ+C/A8uFkvAxQY1jz2tHAw25/i6SYuY/HMxpZkA0qlawQbPqAPRPDYdRZDk4G5ph0BdXSEJC+m2v/98qCgz5kSdaqXeSxVjazuyt89GQ1QhOKz0nc8kTAkGjiDR9KZ2Q5sRw2tbHjI/R4TCkg743xeTgpmNjwNE0S/PfV68Dgm5ZHqtZjSU+Vge5TkCVBNg0u8Js96beQqKPStzkBGeSfNy2E3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eG/XOykJTzFmDlbeVjKwUxdR+Vr6FvmaDNYHf5D3K6Q=;
 b=iuQYZZVETASP7GHb7V3t8uM4gkYg3hfoq9aU00H5PIhFBEprXfWqncYi0gt+TpzEqcIUjf9nDEetEX9bPr6RyAt8g9etf0fNQ9jgjrh2dLwo7KHdoBg8FlgSHwMu4nBA7qLIRQPyL+6SkcfJd+coEjWoh7bhQh9qSTFGqEZrjrt9/FTOF3NF2ZuglI406ViDz3QlBowzRruxASu/t99zcFN6qtKIbaWExzXo2BrHz8Jbq/G5CVQd3Ynt5bn/AIV17kDMceIBA9FwHjGaA4UE2aGj4NH0Whk0oiDQOW2K9tYmza+b6rvlsWcz3lY1pHlna6JixDl8LZLjQqwCrZmSMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eG/XOykJTzFmDlbeVjKwUxdR+Vr6FvmaDNYHf5D3K6Q=;
 b=Cv5r6AEd3ZyFUn0pI4ws2q4RR+QfbYt/NH48xwfVa59cgVHDPJCHRNEPjhU6K3gAZhLdkzgobwfb5UgLLl8RAsQnsIJtl+I/TnMzMSFYO6ja5dRbp7BsFsw3dTKdhWimvtmazpWK87ciTAOx320nrnTp1H6ajHHNazTcwBpixnE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Huang, Ray" <Ray.Huang@amd.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v15 3/4] tools: Add new function to get gsi from
 dev
Thread-Topic: [RFC XEN PATCH v15 3/4] tools: Add new function to get gsi from
 dev
Thread-Index: AQHbBBkohrVZJsKTNkeCOpd+VdxVurJSaGuAgAAAhICAAYJlgA==
Date: Thu, 12 Sep 2024 02:01:13 +0000
Message-ID:
 <BL1PR12MB584971419184B81F5C01E207E7642@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
 <20240911065832.1591273-4-Jiqian.Chen@amd.com>
 <9537bdef-26f7-4a86-8bb8-52c7e409f742@suse.com>
 <901ff507-1f96-43aa-a3f6-6e283719e003@suse.com>
In-Reply-To: <901ff507-1f96-43aa-a3f6-6e283719e003@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7939.015)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB7826:EE_
x-ms-office365-filtering-correlation-id: 0d7c9204-7d95-4a43-9dc4-08dcd2cec7cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VTVGQkxHZ1Y0S3B2RktON3QrVGpZSlNnZGVWRVM0OEdQYzB3dVorRWZtT20z?=
 =?utf-8?B?Q0N5QXVvaWhaTGFpSVI2d2pNTnVRR1phUXJqcHo3V01nZm9pMEphbG9yVEJN?=
 =?utf-8?B?QUFQdVF4SzV6MnV4WFNVdmpuTlp6STIrdWFmM3NNQVA0cUdON25WRXhuZUps?=
 =?utf-8?B?WHozVWVQaXlaRnN5M3o3RlJMNjRMNGZUT0FxNFYzaWg2NHpjcVRadTVPbThu?=
 =?utf-8?B?enBDSU5KbkFzd3ZoRVh2YmcrdVdOSjBhUzRlMFZycnZLeXBDZ2Q0VFpDRVVL?=
 =?utf-8?B?T1ZidVEvUmJTdlptZ1VtLzl4RjMyM0ZML21FdFh3WWJZYUFoa2w0VC8vdjgv?=
 =?utf-8?B?R2hHVlYyL1kxN3FsZFNMMVRsdVM5Qm9sTFZNTi9MVy9pS2Z5ZDdBdFJVZTVB?=
 =?utf-8?B?bXRXMFB1UUkyeDhiK0g2ZUc0MmlJblZvK21xNWJMSTk1K3ozWklUNVhPcXhk?=
 =?utf-8?B?MDFyQUozNzNmSDF2YWY0eXhpNFlOd2JqQlVSOGNwOEd5cm1YTCtoUHllZUZl?=
 =?utf-8?B?c0p1UGVSZUhqL2RJdytzc0ZITUJUQUZwNGxwQlAxbzM0ZCtBekpIaTB5ZzVv?=
 =?utf-8?B?SXRCUHV4UTZuZFFYRnN2TTFibGJ4elVjQ0FnRllzOWxwUzh3alZJTHlTZTZv?=
 =?utf-8?B?REJpUWpEN0JJaE9IUjdnQS90TEdxeFdGdmxYN3kwODRxbVphUHFRaHBXYlhE?=
 =?utf-8?B?MTBqWlZvSGs5S3g4eElESGdEQ3Nta2ZQTDNVbWVXdk1xeURYOE5PVFdNTnk5?=
 =?utf-8?B?bW1NZTV6UGk5SFBGQ3J6d0Nta2JNdS9PMDM1elgvVlA4M202a1ptMG4xRnMv?=
 =?utf-8?B?ZTNSYmxaRGdXYVluSi9VZXZoeFA0a1krSTFhbEFzWFlNbHJmOEN2NEc5cXNu?=
 =?utf-8?B?enlFaTk3UGNmMW0waTdtdGJCSUNITWFOMGlvSmRLWWZQbkdlR055UDJVb3NZ?=
 =?utf-8?B?SlpKTTlOV1RwcWFWOE85VS9IY3UvRlRtc203WXdUS1hQejdXYy9Fc0c4WmdG?=
 =?utf-8?B?NHY2WE9FdFlUamFnVHNyVnFhTGxoR0x5YVFJdUZKQkM3Y0VZQkRHTUJWcGRE?=
 =?utf-8?B?aXUrREZ3T0ExSkkzdHd6WFVCNXN4V0tYQVZJazZoUjZmeXJDekU0WjFBam12?=
 =?utf-8?B?UkpDUXpadENkd29WZ3JzRlVFRzR4Z01JajhKV0lyM1NJR0VKblJwam80UVZ1?=
 =?utf-8?B?RUV0MnlHcTFKYXFTR2NwbGZWNlNNdytSRmxiUUNMTHMvekhDNnhEZmZoQkNB?=
 =?utf-8?B?WFpINjhkTnd3eXBuZFo5TDA3TDFNelYyeWM0UDEyZGl5QnlTbGx3NDNrMWVa?=
 =?utf-8?B?UEw4SXVIRC9yUDFMdGZGMWJCK1VZdFNieW1uaXMrbDRIbFNDekRNblc3bHVU?=
 =?utf-8?B?NHA0dWUwc1g1TVRhbFBiakR6cXF3a1lGbHpUYVpVMFNxYW1JemRYVkZJZGJZ?=
 =?utf-8?B?M1k5aUlGd2FBb0hFYWtvaGJBSXpjb0hYeW5kb1pCd2IyRm5INmZ2MllxM3Va?=
 =?utf-8?B?QlRMMnlHZkxiS1ZzeCsxNWNJaWFZQythZlROeitpd2tHMTk5VlpHRXVkd0M0?=
 =?utf-8?B?ekI0azYySWJxOTRBanVsZGh0alB5cFJPaFV3bk5zMXRjT3ZNYk4vWVZ6Y2pP?=
 =?utf-8?B?aHNoTTdoTjM1eisrNTRNbEFtcXlSODFuekRRYkd0ajBhUU5LcHVnM0R4Q2ls?=
 =?utf-8?B?bi9UbTZ5OVVlcTJaOFYzRCtKUHV2eXZVR05UK3VQUlpySGt3V0xHQkx2M28z?=
 =?utf-8?B?NHppUFptK2VCZ01HLzdnRE5NTlhSekJnclU0ZFhsejlIdFdUbWNPUGcwYTFG?=
 =?utf-8?B?ZlRVU3FDUTRiQm9vSSt1MzdUdUFrZFFGdXZHRnZWZEpaQmI1YXNqLzFMTzMv?=
 =?utf-8?B?eUFEdVo4SldOZWtMeURYSWZ0MExNa3AxUlFoWW1HVWdHK3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bSsyY016Y3l0cTFRVC9jYktseUxuRE1sc0lMRHBPaFREMG14WUJwMDdDV1Vu?=
 =?utf-8?B?TVNyNnpySXhaOExmbFg5c2VVVWJHY0owRXg0K2JkU2xmaVJqbFFHL1prRFVC?=
 =?utf-8?B?Mk1QeFBHRWFYd2dtTmtKVUo3bzJkakl6NysvUXNvRnFjaXhKK0tZSVRHVjdi?=
 =?utf-8?B?M08raFhlOWxJeExjdGtTanFsT08wNktKQlZSaGs5TThWTXhacHIxNEpCRjJ4?=
 =?utf-8?B?Y1hBMWIxUmZqMnhRU0pCQ3pCdWFoNWtDeTAwUTZua1FtSUhncC9weXZyL3ow?=
 =?utf-8?B?R0VrWGFQbGRiN0NaR2N0cVVVK0hxcVdZeEpVVEI2RWdxN2FiV29MQlNmOGwv?=
 =?utf-8?B?ME9CTlV1b1NrY2tjaDFHbGU5a2diVEpxdmR5QUVvUk51U0NuVVRITkEzOWJS?=
 =?utf-8?B?Z3N5RmFmb2NnZjRSN1ZyWEh3ZUprWVZyV05HVnM2UHd6L2NFM1MxT2hQWXNl?=
 =?utf-8?B?cnZnMFNwZTF6a21HR0xhMUkzRm9EbFg0TzB4K1RRYTdwTmVEMCtSY3drcTFj?=
 =?utf-8?B?Wjg5RXdjMkxjcjJFWlZEalAyR1oweFlpQmc3V09IT0p5N1RhbUZZTzJBUkpZ?=
 =?utf-8?B?RlpGelZJZ1F4SVVlMjJoRzlYNVRlenRYSGhBU0R2L09RZmxYbWhwN2Nhbkdu?=
 =?utf-8?B?U3B4aTlCaVNyTDJxYmwwbFA4R3F6anNWMUg0WWhoeVZiUlJvQjd0RnVYVEQ0?=
 =?utf-8?B?YnVlaC95bjBDRnBOTkRtL1U1UmZ3VlhtSEhYUWkvVXJqb3BPaE5Zc3ZxMU5V?=
 =?utf-8?B?VTJKQW1PMWFDd0ZHTVNPbEczKzRzU3k4TEVsVDhaRmV4MU00OFlEOGNVTHcz?=
 =?utf-8?B?V3VFZkJnY1B2QWVWSTNzTHRRb05tOVVoZExFNE5vTThpZG11bjJGUFdlaFIz?=
 =?utf-8?B?cm5Pa3E4UjkzdVJKZnFBUjhzN3BpaktnK1haV1RpbjZxZ2pxbmlwUmdkbXVX?=
 =?utf-8?B?SzBZdzFDYkRLQkxMRDBmWmVhb0FmMVl2bVY0UUxIM0VoUzZ2ZjU1dW1uYnRC?=
 =?utf-8?B?T29VZGZ6SkF0UEtwQWJFL29KOFk1UEVDc3hUR3lUU3RpRVgzbDdabzlsZXQw?=
 =?utf-8?B?NUp0T08vNjFIa2g4UHhUOHV5UHdsTjNNczJqTjNmSnRlRUV3VFdQNVlUaU9n?=
 =?utf-8?B?UDgvc004Tzc1Q21idmc2MkIwRTVhaWgyUEkxWlZ0WHdpRnltcXdxYmUzbEY1?=
 =?utf-8?B?bDdYdWNvazdZYlFJU0hERGF2Y2Vha0RwVXBzbGM1eGNXbHVUTS81di9KTTBJ?=
 =?utf-8?B?Um5IbVZDc1lVNEM4YUtqdkZFcjgxMGh2SDJPQVBjVVVLZ2htSXNQd21ZK29m?=
 =?utf-8?B?ZzVDOFJvZmNPS3pLSnhLeTAyK3NuNWNwWmFzYU9yODc4NHdwbDFBS3huWW9l?=
 =?utf-8?B?Wi9Qek1sMWlIQXpvM0FEZEQ4aEI4cDR0YWtPcFRNbHo3OHByMWp4ZkluUk5K?=
 =?utf-8?B?MGRLa0JZMnNGWnA0ZFhDK2kza3ROWDc5VWQwRGdtRG1PaGNxemQvUVhmRjZN?=
 =?utf-8?B?dzdzUm93b3RYN0tWSUxIUnpkcUNzTXFSUkhDTjljSUpzQ2JzVUR4OUVEL3BM?=
 =?utf-8?B?aWxKVDl5WDFqd292V0R2L0RmRnlBNEp1cDI2QkUrNGo5RzZwa1BSVERBazBX?=
 =?utf-8?B?U0wrNVM5bmFjOFRpYlVIVzhYTjBrTjZlN3BNcVhlUjVXckNTNTlhZTJvUWdx?=
 =?utf-8?B?TVR3Q3BLejloVHU4QndVY1ZnejZPczcwVnA4c0VpRURxbllTRHlDOXJSOXdL?=
 =?utf-8?B?cktON1BIUFlqb0NCVHRnZTR2L04ybnloRzZya1dNejJUQVY5VlIrMlpQNUxi?=
 =?utf-8?B?dVZUSzNlaUlUVXZ0ekJtdXdVcWswbU45b1RVeitlQTcyUXBkWGQ1RTlYcEwv?=
 =?utf-8?B?MDZUSDNrbVQ3azArSTNWRE1MZG1uY2tFMkJxdzJHNUZaRFkwaENBaTd2TUQ4?=
 =?utf-8?B?WDlSQXFCQ1ltTzhZRzVWUTdJbXpqbzJkRG1WQlhUU0dMd2xNb09FdGRjMTdy?=
 =?utf-8?B?MFYxdXo2c3NUcXZ1Zkk3YzJTbjVIazMyMkdSUXBtT01nejQwNUNIbllzZExK?=
 =?utf-8?B?dVA5N0xkRVlHOFYwb0haeXhRSGYvZGwxUVdFOUtSNXB6NjhnYk5DZ0R6Y0o0?=
 =?utf-8?Q?pPNE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F3B31A9C721434CB0FF6E19A0C566AF@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7c9204-7d95-4a43-9dc4-08dcd2cec7cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 02:01:13.6640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vjm4GG5eMvfe6qaJPT0Q6PinoEST3gpgdGJSP0GVJ5uWAQ+X+t3TL9nUI053z995e6dZK7ZV+sN0RXgCSfv1Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7826

T24gMjAyNC85LzExIDE4OjUxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTEuMDkuMjAyNCAx
Mjo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxMS4wOS4yMDI0IDA4OjU4LCBKaXFpYW4g
Q2hlbiB3cm90ZToNCj4+PiBPbiBQVkggZG9tMCwgd2hlbiBwYXNzdGhyb3VnaCBhIGRldmljZSB0
byBkb21VLCBRRU1VIGFuZCB4bCB0b29scw0KPj4+IHdhbnQgdG8gdXNlIGdzaSBudW1iZXIgdG8g
ZG8gcGlycSBtYXBwaW5nLCBzZWUgUUVNVSBjb2RlDQo+Pj4geGVuX3B0X3JlYWxpemUtPnhjX3Bo
eXNkZXZfbWFwX3BpcnEsIGFuZCB4bCBjb2RlDQo+Pj4gcGNpX2FkZF9kbV9kb25lLT54Y19waHlz
ZGV2X21hcF9waXJxLCBidXQgaW4gY3VycmVudCBjb2RlcywgdGhlIGdzaQ0KPj4+IG51bWJlciBp
cyBnb3QgZnJvbSBmaWxlIC9zeXMvYnVzL3BjaS9kZXZpY2VzLzxzYmRmPi9pcnEsIHRoYXQgaXMN
Cj4+PiB3cm9uZywgYmVjYXVzZSBpcnEgaXMgbm90IGVxdWFsIHdpdGggZ3NpLCB0aGV5IGFyZSBp
biBkaWZmZXJlbnQNCj4+PiBzcGFjZXMsIHNvIHBpcnEgbWFwcGluZyBmYWlscy4NCj4+Pg0KPj4+
IEFuZCBpbiBjdXJyZW50IGNvZGVzLCB0aGVyZSBpcyBubyBtZXRob2QgdG8gZ2V0IGdzaSBmb3Ig
dXNlcnNwYWNlLg0KPj4+IEZvciBhYm92ZSBwdXJwb3NlLCBhZGQgbmV3IGZ1bmN0aW9uIHRvIGdl
dCBnc2ksIGFuZCB0aGUNCj4+PiBjb3JyZXNwb25kaW5nIGlvY3RsIGlzIGltcGxlbWVudGVkIG9u
IGxpbnV4IGtlcm5lbCBzaWRlLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4g
PEppcWlhbi5DaGVuQGFtZC5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXku
aHVhbmdAYW1kLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGVuIEppcWlhbiA8SmlxaWFuLkNo
ZW5AYW1kLmNvbT4NCj4+PiBSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQHZhdGVzLnRlY2g+DQo+Pj4gLS0tDQo+Pj4gUkZDOiBpdCBuZWVkcyB0byB3YWl0IGZvciB0
aGUgY29ycmVzcG9uZGluZyB0aGlyZCBwYXRjaCBvbiBsaW51eCBrZXJuZWwgc2lkZSB0byBiZSBt
ZXJnZWQuDQo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjQwNjA3MDc1
MTA5LjEyNjI3Ny00LUppcWlhbi5DaGVuQGFtZC5jb20vDQo+Pg0KPj4gSSdtIGFmcmFpZCBJIGRv
bid0IHVuZGVyc3RhbmQgdGhpcyByZW1hcms6IFRoZSBjaGFuZ2UgaGVyZSAoYW5kIHNpbWlsYXJs
eQ0KPj4gcGF0Y2ggNCkgb3VnaHQgdG8gYmUgaW5kZXBlbmRlbnQgb2Ygd2hlbiB0aGUga2VybmVs
IGNoYW5nZSBnb2VzIGluLiBBZnRlcg0KPj4gYWxsIHRoZSBsaWJyYXJpZXMgbmVlZCB0byB3b3Jr
IG9uIG9sZGVyIExpbnV4IGFzIHdlbGwuIFBsZWFzZSBjbGFyaWZ5Lg0KPiANCj4gSG1tLCBtYXli
ZSBmb3IgdGhpcyBwYXRjaCB0aGUgZGVwZW5kZW5jeSBpcyBmb3IgdGhlIG5ldyBJT0NUTCBhcyBh
bg0KPiBpbnRlcmZhY2UgdG8gYmUgYWNjZXB0ZWQuIFRoYXQncyBmaW5lIGEgZGVwZW5kZW5jeSBv
ZiBjb3Vyc2UuIFlldCB0aGVuDQo+IHdoeSB0aGUgc2FtZSByZW1hcmsgaW4gcGF0Y2ggND8NClll
cywgcGF0Y2gjMyBkZXBlbmRzIG9uIHRoZSBuZXcgSU9DVEwgb24gdGhlIGtlcm5lbCBzaWRlLg0K
UGF0Y2gjNCB1c2VzIHRoZSBuZXcgZnVuY3Rpb24gb2YgcGF0Y2gjMyBhbmQgbmV3IGh5cGVyY2Fs
bCBvZiBwYXRjaCMyLCBpdCBkZXBlbmRzIG9uIHBhdGNoIzIvMywgc28gcGF0Y2gjNCBhbHNvIGRl
cGVuZHMgb24gdGhlIHBhdGNoZXMgb24gdGhlIGtlcm5lbCBzaWRlLg0KQW5kIHRoZSBrZXJuZWwg
cGF0Y2hlcyBhcmUgdG9vIG9sZCwgSSB3aWxsIHNlbmQgYSBuZXcgdmVyc2lvbiB0aGlzIHdlZWsu
DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

