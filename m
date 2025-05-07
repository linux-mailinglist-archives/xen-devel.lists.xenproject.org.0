Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EECAAD7E4
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 09:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978247.1365074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZAn-0004ij-Mb; Wed, 07 May 2025 07:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978247.1365074; Wed, 07 May 2025 07:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZAn-0004hB-Jk; Wed, 07 May 2025 07:26:33 +0000
Received: by outflank-mailman (input) for mailman id 978247;
 Wed, 07 May 2025 07:26:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNVA=XX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uCZAm-0004h5-7N
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 07:26:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2009::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97ecd3ed-2b14-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 09:26:29 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL3PR12MB6404.namprd12.prod.outlook.com (2603:10b6:208:3b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 07:26:21 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 07:26:21 +0000
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
X-Inumbo-ID: 97ecd3ed-2b14-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vchyJjtoWWRTcFCuKij7AyJMRP7NrkuDMyqOQOzXKr0IwpjA4Xnu632e81Qyp+dLivWaYm5wGJXe+/rm3M8G71htcdfORUQ9HaAxol/pPceBCbhrqYBhYLZWSPtrMOYmrRnoQ9/M3xrNbhGnbnTA6S/X0kJxiY+iG48rIMj+tnBlClxIZNuPXZpkN2OLK2P4TLFO2tiUfx+m5x3BCDRzNwhQ5J6/jw5LpKIsxmP6xF93CutTrtOYUzOYMP64VvQLjldTwBsvW/HWTnmFQ6jSHTPGO5ijA0w5f5EGfZFFGI6UTPcgxHuD+QrLek/RUbMCr/VIG+gKVYaE0PkuCXEaWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zzPfcQAlF0IvpQv5qBLJEQD5SOS7tHGLQU9VaBR2xo=;
 b=S6SHHM4iBcS2tTHTuN++inJxFfzgj7rgcsMQcjKDYeVffiSyklIiyTBy30rV5Qzt/KzIlYy4XfhsjefuLHubvEEkF20VJWvM2kn73wByjDrstJbBtjxx/u2c0rCvj+mbT5Y8jU/Oi4cdZsYyUWwJcIvZZxIFjWtI9kMi2YVAxBDBKJN5OHbqGrHPsZG9xNcTA03oPKufAG5gGe2lrEs84tlgYrWGLH1rZUPQ49AiqF1hk7AtGtWAp+fmbvLnSGkWoweLPDIBZ4TO2c2TezoarMludt1FB7J2mDAA8BvveairGNDu/FhSFw9AR6yXpxpox2SCyP5v2+eB3YS4xkKQoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zzPfcQAlF0IvpQv5qBLJEQD5SOS7tHGLQU9VaBR2xo=;
 b=H7htOTIZJkI0j1XicaahjbL0f3f5ZjiDwia9fAiNnlW3GWjpePABQuEC9kQf5i9SO5br9woLMvvUVGli/NIY7BU78eVfYCMO4IbM1lENm8+0zAE5imxECGyODgGWaNiiDfe++8idO9JnNh7ZLmgS9mldbTTBtqIfnQIjVbnXteY=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 07/11] vpci: Hide extended capability when it fails to
 initialize
Thread-Topic: [PATCH v3 07/11] vpci: Hide extended capability when it fails to
 initialize
Thread-Index: AQHbsoVd9OkTHNIeNk69huFsDqzHMLPF4NaAgAGCYAA=
Date: Wed, 7 May 2025 07:26:21 +0000
Message-ID:
 <BL1PR12MB58495E4592CA4E80DA34AE04E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-8-Jiqian.Chen@amd.com> <aBo3EfiWJUyWnl_a@macbook.lan>
In-Reply-To: <aBo3EfiWJUyWnl_a@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8699.005)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL3PR12MB6404:EE_
x-ms-office365-filtering-correlation-id: 1fa55f8e-5892-4cf6-0ec2-08dd8d387761
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eDJDR2ZZQVZidU9TVnJPK3k5UTg3dGJuMk04QS8zdmZmZ1FrbDRWQXNEN2Iv?=
 =?utf-8?B?SnYzMjJnOXJFdktyZnc5Tk83QW00aU14MkZJY2ZBUHNIbytZSTBwNTJ5elAy?=
 =?utf-8?B?dk5KUjhYOTZoMjR1YkFzc1dMVE14eEhibHc3eTNtTUIrZ3dENHkvVE1mdXdz?=
 =?utf-8?B?STU3d3lFNUw0THhweDZYeHpUblhJUUhOc2VVZTFaU3NSOWV3UGFTUDFxSE1C?=
 =?utf-8?B?R21jRWR0WVU5V3ZHYUhuTWlYR0I1N3dPa0JvMG9JYUNkcHJJZ200V1NZTEp2?=
 =?utf-8?B?UUx6azRURWMvODVFVmFaVnRKV1RVUkRwM0RKSDV2bHhjYWI1aWlpUjVTMmp2?=
 =?utf-8?B?NkZ4cTFMamRRcTkzdk81cHhEUk5VSGVMMElXWnBxRGU2Q1g5b3VBbDkvTm94?=
 =?utf-8?B?RXJsLzdMWE4raGxhOVI4RmJEMjhKK3g0UmpWWlR2Z3I1bmR5UFlERGx2Qk9C?=
 =?utf-8?B?S01DREEyOVVKQmR4a1dQQjNMWGZRalZmQy9vdmlHbERvKzFBdEZScitrcGtN?=
 =?utf-8?B?OU8xYnRkNXJjZ041ekZWYktzVFJBSVhXb3V0eUthd1h0cGFORXlXVmhuYWVV?=
 =?utf-8?B?QXVUTnovUUkxTnNuY0piZENVWE5KUlVGenlsU2ZhOUx1d2o2ekZKUS9BVTV2?=
 =?utf-8?B?MFoxUXY3ODc4RitxTG9oN2Z1djRxMmhvZ2R6RzJ4MUdXVnV2UVFXc0xTYTND?=
 =?utf-8?B?WEpOcVk2aUtsR1pIWVE1enN5dXpqSFF4RlQ2UUdxemRaUmV4a3ZKWXh1YmR5?=
 =?utf-8?B?ZXcrNTM1ZWtlRUhtallncDE4anZuY21BT0VHeWxjcFVqNU9aV2RJazZTVkJL?=
 =?utf-8?B?UEY2ckF4OFRrVFU2Vms4SlVHckFkUGRZQ0lGTnNLd2JhSkFRY25taUlBYWVJ?=
 =?utf-8?B?aVI0U0x5d254bjBwUmN0aXdVSTNYWnZ0YmlJWmVnUXA3eGdkR1A3ZlpxN3lM?=
 =?utf-8?B?dld3aWsrdDkzelhFTTJQcVE2WHJEc3NzNTFyR1hFR0dtaHU0SEJTeDBoU1Nr?=
 =?utf-8?B?TndRU2N0L2NZRjJGR01kYXFHbSthaG5PQlEwNTBYV0FIMU8yek5LVEtJY2JK?=
 =?utf-8?B?VzVYSXlkMVk4WmNHU0pJcWRuSWVoZ0kvazJ2OE9tcFlFUGRscGhaYkZQNjE1?=
 =?utf-8?B?TXFvUVhJSGJuWXNZUXRlWHNENWdiMDNVK1IyU2JrUm0rU3Bmb1QxWmRmR0ho?=
 =?utf-8?B?RGREY3RjNFc3NUxmRitDQ0pwT0lyKzdFMnpLbXJjT0hMdVYxNnk4cytXQytH?=
 =?utf-8?B?RnZWN2VUKzdCSUN2NndKVmdPWGxBWGdFZDFFNWlBL1VDaHVRM1p5Zk1IWHo5?=
 =?utf-8?B?UlhkZ2wrMjk4NWI1cnNRNlh5SUtyTnRaSWphcFAyVTJFVTAzUnZHMGJqSUpm?=
 =?utf-8?B?Z05YU29tbUN3S1Jjd0E1SFgxdmRMdFRkZ3pzekJKdWlES3JQcGdwbFRodTFp?=
 =?utf-8?B?bnV2Y1V1Y2J1OVdNTWVZYlZMY1V2V0NDVVdqSkRidHdsQVpvUm9EQ3h3b1px?=
 =?utf-8?B?Y0RyeWVCcGlDdmlMOERBbjZLMlBFVEw4eUQwdmwzaGsrYlRVZUxiRzk5U0lR?=
 =?utf-8?B?STRVVlUveFg1NVRaR2RXcDJKaiszdC82cWhqM1RTK0p1bExLb1VybG9SRFVZ?=
 =?utf-8?B?TXBBNDlTUWdSVXVpbXh5TGpDTFBKN3BBQlNKL1ZrSzN0RlpqaVViRGt4UVRW?=
 =?utf-8?B?bkZPZSswVlRGalV5NnMzWVBpelpkUTlZcUVoU2h4QldabWo1aUVhMllvTjNy?=
 =?utf-8?B?YTRjNm44SmVFR1lNblMzcWVKU1ZTdTd1S0tCVHVlSHdOVUt1Mi9ZeVRJb0dY?=
 =?utf-8?B?RnEvcC9jYkdGS1hNVk1ncHc1NXozUld4TWRDVDh0NFRtNGxyS2RpSGUwQXN3?=
 =?utf-8?B?bjRNRVRBTnh1QmV5TFV4MityVHNxMGQ0ODF1WHJOZm1URm5UdEdlMVpTdlQx?=
 =?utf-8?B?Y2YrcXBoUjZ6SEpyRElJNzdsc2N1WmkrdGw0RkRBVUg3Z2tsOTFiL2h2aWg5?=
 =?utf-8?B?SFNnRDZIeUFnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SnljdGNlNzNlYkZlUHdRMlhDOHc2aEtCaGZnRWRHRnBkNDhydytKUVlvMmlj?=
 =?utf-8?B?RzEyYXdaV2toSEM4KzhWQ3FJSXNVK2FqbEVSTktaYmdFbkZobUdWYWNaMWly?=
 =?utf-8?B?dVYvSWFGdjJoaXJBREx0a0EvZUVJZXEwVjYwMUlYQWFNS2RacnIwTDd6QmFM?=
 =?utf-8?B?ZWh3allKWE9qYUlvbEkrdmptaGp2SndCRkx3OHRhOHhjZGRoTWNRTzAwd05E?=
 =?utf-8?B?RHZ3QTJsQ29iZmR4bFZ4dmx2S3VoSEdKN2o3cHZrancwNzVHTHJETVBFaGtp?=
 =?utf-8?B?K21JK1B4Q2x0dU5DV0QzUmVzcjI1T3dWM2NHcDdTb0NkTUhaQkNTT1ExZ3dW?=
 =?utf-8?B?cFRjZ0hFeTYvNTBMNmlFWkNvY1V6Wk1ZYzNEMlpKelRnUGp6QlVpc0xzUzdq?=
 =?utf-8?B?VUp1c3lkbGZtZG05Z0NOVDBVdzRncng1ZWRCYll4YWVYbVZjSUU0WU9NVlh5?=
 =?utf-8?B?akR0NGJSUWxJcDFNYSt4bDUyQUQrSjZTNDJhZmtITm9jSk9HSmtWblpIejZW?=
 =?utf-8?B?WlJjZU9jeFRlQ1dULzQwdjlsT3k0TFZOL1ZUcmV1aWk2M2JjVjhaMzc1cnVV?=
 =?utf-8?B?WkxPMWs3a0VpS2pPdlhOL0FLV1luMWhLck42WTFNQW5nWVJRTFhxaE1TbXFG?=
 =?utf-8?B?blZwaWQ3Z0xyeFpjV1M0Q05uVlA0TzJUc2F2QUpNL3pHRyt5TzZRQms2eTZy?=
 =?utf-8?B?UDNRMUlNSzFDZVJkb096cWltNnRmaTZhWXFoNnFjbHhhTmNIcFJyNXVxa1R1?=
 =?utf-8?B?ODhkR2U0R25HVkF6T1VpK1VwRjJXZS9VUmVtREYyUk5CSDUzTHVsT0ZHOEN2?=
 =?utf-8?B?SHdINjJPYkpyRjEyd3Q5Y0NmdVpzcnUwVlZWSTFPZ001YTljSjd2VW00Rjh1?=
 =?utf-8?B?aUhqWFd1UVMrTmx3YXFKSjNZWFUrWFFZSzZsQ2FOSGxIR3pSbi9qTSs4NUwx?=
 =?utf-8?B?aTQ0OUdnSFU1QlVJOHBJQzRvdG5pVnV0eW9Vbnd4YU1HNTcwajdzem92ekxX?=
 =?utf-8?B?anpUTTVJV2JlMWVLdHJMOFRTamdseE55MVhVNHRTTTBHWTRjaWdITFk3SGFP?=
 =?utf-8?B?VGQrRXRVQXF3NmVDNUtlMVB3YWpoVWVtbDFnc041MEJ0aEV1V3pIOVlVdEsz?=
 =?utf-8?B?b2xpMWR1a2JheSs2RVdtMk5xbkJlTmF6VUZOZGE2WC9Rd2dyeVJLcVN1THZn?=
 =?utf-8?B?WWM4bVNhTjcrOGNyL0xVMCtVMzErV0ErYzRLZnZjY1c5Rk54K3dpdEFYb0s3?=
 =?utf-8?B?T2tFVGExWXRmR0FYNnNMakY0ZjJrQUY2M0l3UkNRVFNjMGhxR0xCWnUwNTE2?=
 =?utf-8?B?cjEvNmNKOFppMWd6elJRNUI4dWV3RnE1bHB4UFpmNytwZnVJTkdSOXRBRTdj?=
 =?utf-8?B?VzgybmtZOXBZTzdlYWdjNzJTc3lDTzFEWGwwdWdjQWpEakdVeXpSK3ZsTGxB?=
 =?utf-8?B?Z3hxYitnQkpQOFlMYmJoZ0tXNUYyYXVxazNUMFNzR2RoN2VBWnJBdU1IOUQz?=
 =?utf-8?B?MHBSYlIzZ3g5K1hEc1hqUXpYYUlGMmVkSGZnSFNYazRicGlMMGl1YmdOUXlu?=
 =?utf-8?B?M25zQ1o0K2FSRzJVb0RaQ1FLSFhzT25xTmFXWkVtam1tUnpRaUM1b3BhK2xJ?=
 =?utf-8?B?MVFvMHZTSk9KQVlrK0toOFo2RHBuR1V1WXEyd0lFVGFVbGV4cHptSXk1S0pV?=
 =?utf-8?B?TExEYzhhQUxSSjM5VUdwMjNkcGJvUkd6aEhzWDRaWE0wSWp6MVB1bU1rVG1J?=
 =?utf-8?B?Sjg4V2JleWVaZDl0OFduejN5RVgwbG9SS3BHS0x3bFNUSnVoQk9NZVZsam4z?=
 =?utf-8?B?N2hiUGprZkp2Syt0WXhsbGFteXJmVzgwbzcyeEJPMDVUMWxwN1NpRU5YVGJP?=
 =?utf-8?B?YjdlK0NxTk1LSzhGSGw2ampqeVptOG5WY1FicUZWcFlUR2FLMDhTV1Byd08w?=
 =?utf-8?B?NXE5cFJ5TDZmWmhYRXh6TG0walpPdVQ2L1Z4akJZTDQxVlZtTWk4bHc3S2lW?=
 =?utf-8?B?M3JXRm50bXNJZGZCQkI2NlZaRzVLRjR3eW4yU05xeCt1blpzbVdhM0V5RnJj?=
 =?utf-8?B?UEpTeVZreURXNzRzNVVHK3lFTEV2VFFmTnNBQXZjV3dPYzBoRkkrWTRjL2w0?=
 =?utf-8?Q?nGoI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0D21677A0554C4DA71174D477B561D9@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa55f8e-5892-4cf6-0ec2-08dd8d387761
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 07:26:21.6951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KrOdW+Pd6BRQEgmGPqdL+D1SYqBVDOAkQO5xtbtWK4a7g7KOHNeG3+iXU3qhCC3gRp2VHlAqU4yjyL1XS6V7Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6404

T24gMjAyNS81LzcgMDA6MjEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgQXBy
IDIxLCAyMDI1IGF0IDAyOjE4OjU5UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gV2hl
biB2cGNpIGZhaWxzIHRvIGluaXRpYWxpemUgYSBleHRlbmRlZCBjYXBhYmlsaXR5IG9mIGRldmlj
ZSBmb3IgZG9tMCwNCj4+IGl0IGp1c3QgcmV0dXJuIGVycm9yIGluc3RlYWQgb2YgY2F0Y2hpbmcg
YW5kIHByb2Nlc3NpbmcgZXhjZXB0aW9uLiBUaGF0DQo+PiBtYWtlcyB0aGUgZW50aXJlIGRldmlj
ZSB1bnVzYWJsZS4NCj4+DQo+PiBTbywgYWRkIG5ldyBhIGZ1bmN0aW9uIHRvIGhpZGUgZXh0ZW5k
ZWQgY2FwYWJpbGl0eSB3aGVuIGluaXRpYWxpemF0aW9uDQo+PiBmYWlscy4gQW5kIHJlbW92ZSB0
aGUgZmFpbGVkIGV4dGVuZGVkIGNhcGFiaWxpdHkgaGFuZGxlciBmcm9tIHZwY2kNCj4+IGV4dGVu
ZGVkIGNhcGFiaWxpdHkgbGlzdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8
SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+IC0tLQ0KPj4gY2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8
cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IHYyLT52MyBjaGFuZ2VzOg0KPj4gKiBT
ZXBhcmF0ZWQgZnJvbSB0aGUgbGFzdCB2ZXJzaW9uIHBhdGNoICJ2cGNpOiBIaWRlIGNhcGFiaWxp
dHkgd2hlbiBpdCBmYWlscyB0byBpbml0aWFsaXplIi4NCj4+ICogV2hvbGUgaW1wbGVtZW50YXRp
b24gY2hhbmdlZCBiZWNhdXNlIGxhc3QgdmVyc2lvbiBpcyB3cm9uZy4NCj4+ICAgVGhpcyB2ZXJz
aW9uIGdldHMgdGFyZ2V0IGhhbmRsZXIgYW5kIHByZXZpb3VzIGhhbmRsZXIgZnJvbSB2cGNpLT5o
YW5kbGVycywgdGhlbiByZW1vdmUgdGhlIHRhcmdldC4NCj4+ICogTm90ZTogYSBjYXNlIGluIGZ1
bmN0aW9uIHZwY2lfZXh0X2NhcGFiaWxpdHlfbWFzaygpIG5lZWRzIHRvIGJlIGRpc2N1c3NlZCwN
Cj4+ICAgYmVjYXVzZSBpdCBtYXkgY2hhbmdlIHRoZSBvZmZzZXQgb2YgbmV4dCBjYXBhYmlsaXR5
IHdoZW4gdGhlIG9mZnNldCBvZiB0YXJnZXQNCj4+ICAgY2FwYWJpbGl0eSBpcyAweDEwMFUodGhl
IGZpcnN0IGV4dGVuZGVkIGNhcGFiaWxpdHkpLCBteSBpbXBsZW1lbnRhdGlvbiBpcyBqdXN0IHRv
DQo+PiAgIGlnbm9yZSBhbmQgbGV0IGhhcmR3YXJlIHRvIGhhbmRsZSB0aGUgdGFyZ2V0IGNhcGFi
aWxpdHkuDQo+Pg0KPj4gdjEtPnYyIGNoYW5nZXM6DQo+PiAqIFJlbW92ZWQgdGhlICJwcmlvcml0
aWVzIiBvZiBpbml0aWFsaXppbmcgY2FwYWJpbGl0aWVzIHNpbmNlIGl0IGlzbid0IHVzZWQgYW55
bW9yZS4NCj4+ICogQWRkZWQgbmV3IGZ1bmN0aW9uIHZwY2lfY2FwYWJpbGl0eV9tYXNrKCkgYW5k
IHZwY2lfZXh0X2NhcGFiaWxpdHlfbWFzaygpIHRvDQo+PiAgIHJlbW92ZSBmYWlsZWQgY2FwYWJp
bGl0eSBmcm9tIGxpc3QuDQo+PiAqIENhbGxlZCB2cGNpX21ha2VfbXNpeF9ob2xlKCkgaW4gdGhl
IGVuZCBvZiBpbml0X21zaXgoKS4NCj4+DQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiBKaXFpYW4gQ2hl
bi4NCj4+IC0tLQ0KPj4gIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgIHwgNzkgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICB4ZW4vaW5jbHVkZS94ZW4vcGNpX3Jl
Z3MuaCB8ICAxICsNCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKykNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgYi94ZW4vZHJpdmVycy92cGNp
L3ZwY2kuYw0KPj4gaW5kZXggZjk3YzdjYzQ2MGEwLi44ZmY1MTY5YmRkMTggMTAwNjQ0DQo+PiAt
LS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS92
cGNpLmMNCj4+IEBAIC0xODMsNiArMTgzLDgzIEBAIHN0YXRpYyB2b2lkIHZwY2lfY2FwYWJpbGl0
eV9tYXNrKHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4gICAgICB4ZnJlZShuZXh0X3IpOw0KPj4g
IH0NCj4+ICANCj4+ICtzdGF0aWMgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnZwY2lfZ2V0X3ByZXZp
b3VzX2V4dF9jYXBfcmVnaXN0ZXINCj4+ICsgICAgICAgICAgICAgICAgKHN0cnVjdCB2cGNpICp2
cGNpLCBjb25zdCB1bnNpZ25lZCBpbnQgb2Zmc2V0KQ0KPj4gK3sNCj4+ICsgICAgdWludDMyX3Qg
aGVhZGVyOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgcG9zID0gUENJX0NGR19TUEFDRV9TSVpFOw0K
Pj4gKyAgICBzdHJ1Y3QgdnBjaV9yZWdpc3RlciAqcjsNCj4+ICsNCj4+ICsgICAgaWYgKCBvZmZz
ZXQgPD0gUENJX0NGR19TUEFDRV9TSVpFICkNCj4+ICsgICAgICAgIHJldHVybiBOVUxMOw0KPj4g
Kw0KPj4gKyAgICByID0gdnBjaV9nZXRfcmVnaXN0ZXIodnBjaSwgcG9zLCA0KTsNCj4+ICsgICAg
QVNTRVJUKHIpOw0KPj4gKw0KPj4gKyAgICBoZWFkZXIgPSAodWludDMyX3QpKHVpbnRwdHJfdCly
LT5wcml2YXRlOw0KPj4gKyAgICBwb3MgPSBQQ0lfRVhUX0NBUF9ORVhUKGhlYWRlcik7DQo+PiAr
ICAgIHdoaWxlICggcG9zID4gUENJX0NGR19TUEFDRV9TSVpFICYmIHBvcyAhPSBvZmZzZXQgKQ0K
Pj4gKyAgICB7DQo+PiArICAgICAgICByID0gdnBjaV9nZXRfcmVnaXN0ZXIodnBjaSwgcG9zLCA0
KTsNCj4+ICsgICAgICAgIEFTU0VSVChyKTsNCj4+ICsgICAgICAgIGhlYWRlciA9ICh1aW50MzJf
dCkodWludHB0cl90KXItPnByaXZhdGU7DQo+PiArICAgICAgICBwb3MgPSBQQ0lfRVhUX0NBUF9O
RVhUKGhlYWRlcik7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaWYgKCBwb3MgPD0gUENJX0NG
R19TUEFDRV9TSVpFICkNCj4+ICsgICAgICAgIHJldHVybiBOVUxMOw0KPj4gKw0KPj4gKyAgICBy
ZXR1cm4gcjsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgdnBjaV9leHRfY2FwYWJpbGl0
eV9tYXNrKHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgY2FwKQ0KPj4gK3sNCj4+ICsgICAgY29u
c3QgdW5zaWduZWQgaW50IG9mZnNldCA9IHBjaV9maW5kX2V4dF9jYXBhYmlsaXR5KHBkZXYtPnNi
ZGYsIGNhcCk7DQo+PiArICAgIHN0cnVjdCB2cGNpX3JlZ2lzdGVyICpybSwgKnByZXZfcjsNCj4+
ICsgICAgc3RydWN0IHZwY2kgKnZwY2kgPSBwZGV2LT52cGNpOw0KPj4gKyAgICB1aW50MzJfdCBo
ZWFkZXIsIHByZV9oZWFkZXI7DQo+IA0KPiBNYXliZSBzYW5pdHkgY2hlY2sgdGhhdCBvZmZzZXQg
aXMgY29ycmVjdD8NCldoYXQgZG8geW91IG1lYW4gc2FuaXR5IGNoZWNrPw0KRG8gSSBuZWVkIHRv
IGFkZCBzb21ldGhpbmc/DQoNCj4gDQo+PiArICAgIHNwaW5fbG9jaygmdnBjaS0+bG9jayk7DQo+
PiArICAgIHJtID0gdnBjaV9nZXRfcmVnaXN0ZXIodnBjaSwgb2Zmc2V0LCA0KTsNCj4+ICsgICAg
aWYgKCAhcm0gKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBzcGluX3VubG9jaygmdnBjaS0+bG9j
ayk7DQo+PiArICAgICAgICByZXR1cm47DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaGVhZGVy
ID0gKHVpbnQzMl90KSh1aW50cHRyX3Qpcm0tPnByaXZhdGU7DQo+PiArICAgIGlmICggb2Zmc2V0
ID09IFBDSV9DRkdfU1BBQ0VfU0laRSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGlmICggUENJ
X0VYVF9DQVBfTkVYVChoZWFkZXIpIDw9IFBDSV9DRkdfU1BBQ0VfU0laRSApDQo+PiArICAgICAg
ICAgICAgcm0tPnByaXZhdGUgPSAodm9pZCAqKSh1aW50cHRyX3QpMDsNCj4+ICsgICAgICAgIGVs
c2UNCj4+ICsgICAgICAgICAgICAvKg0KPj4gKyAgICAgICAgICAgICAqIEVsc2UgY2FzZSBuZWVk
cyB0byByZW1vdmUgdGhlIGNhcGFiaWxpdHkgaW4gcG9zaXRpb24gMHgxMDBVIGFuZA0KPj4gKyAg
ICAgICAgICAgICAqIG1vdmVzIHRoZSBuZXh0IGNhcGFiaWxpdHkgdG8gYmUgaW4gcG9zaXRpb24g
MHgxMDBVLCB0aGF0IHdvdWxkDQo+PiArICAgICAgICAgICAgICogY2F1c2UgdGhlIG9mZnNldCBv
ZiBuZXh0IGNhcGFiaWxpdHkgaW4gdnBjaSBkaWZmZXJlbnQgZnJvbSB0aGUNCj4+ICsgICAgICAg
ICAgICAgKiBoYXJkd2FyZSwgdGhlbiBjYXVzZSBlcnJvciBhY2Nlc3Nlcywgc28ganVzdCBpZ25v
cmUgaXQgaGVyZSBhbmQNCj4+ICsgICAgICAgICAgICAgKiBob3BlIGhhcmR3YXJlIHdvdWxkIGhh
bmRsZSB0aGUgY2FwYWJpbGl0eSB3ZWxsLg0KPj4gKyAgICAgICAgICAgICovDQo+PiArICAgICAg
ICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIiVwZCAlcHA6IGV4dCBjYXAgJXUgaXMgZmlyc3QgY2Fw
LCBjYW4ndCBtYXNrIGl0XG4iLA0KPj4gKyAgICAgICAgICAgICAgICAgICBwZGV2LT5kb21haW4s
ICZwZGV2LT5zYmRmLCBjYXApOw0KPiANCj4gSW4gdGhpcyBjYXNlLCBjb3VsZCB5b3UgbWF5YmUg
cmVwbGFjZSBqdXN0IHRoZSBjYXBhYmlsaXR5IElEIHBhcnQgb2YNCj4gdGhlIGhlYWRlciB0byBy
ZXR1cm4gMD8gIFRoYXQgd2lsbCBsaWtlbHkgY2F1c2UgdGhlIE9TIHRvIGNvbnRpbnVlDQo+IHNj
YW5uaW5nIHRoZSBsaXN0LCB3aGlsZSBJRCAwIHdvbid0IG1hdGNoIHdoaWNoIGFueSBrbm93bg0K
PiBjYXBhYmlsaXR5Lg0KT0ssIHdpbGwgZG8gaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiBUaGFu
a3MsIFJvZ2VyLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

