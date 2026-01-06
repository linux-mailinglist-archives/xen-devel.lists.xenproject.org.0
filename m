Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D7ACF81BA
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 12:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196045.1513911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd5Rf-0005r3-T6; Tue, 06 Jan 2026 11:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196045.1513911; Tue, 06 Jan 2026 11:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd5Rf-0005pF-Pc; Tue, 06 Jan 2026 11:41:51 +0000
Received: by outflank-mailman (input) for mailman id 1196045;
 Tue, 06 Jan 2026 11:41:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heAF=7L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vd5Re-0005p9-FH
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 11:41:50 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aef53e98-eaf4-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 12:41:47 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5687.namprd03.prod.outlook.com (2603:10b6:510:39::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:41:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 11:41:43 +0000
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
X-Inumbo-ID: aef53e98-eaf4-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhiAvqk8lIcfxxssu1Psl0IKqCmpLroMEKcGyWfkp27z1htGfN2wCNg53inrWmE48T5d10TGAcXwLXbNek6wlvTWOpgz5IVDUatMqv9wTWQyGJ2GFXLUZD3gLj8iqSTTmVn3DJyreOYL8e52UQ4KcP7eAxrk0ftKXePnO247Qgzt9zI6HKoVAQbjEDZr/iP/nm8WGEFBQCIJkVxE3ufT62epgwXEK6aDzSa8RcIXySX3DeUpJTbuVDYkG6uhaLUCihQFlXXlVXO5vCxSullKunB4o8lp/X4Yme5CgiH6hjIPr+fG8VCCVeCRI6joDor2XdX9l+vr3gzjR95S5F1+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1VX6iq/jsPPCV+Nae6kUP/AIiuXAfJEYCYZBK32dQ8=;
 b=OM8r5iIK1GObMzacgAoCr3lcoRQnKYKEt0FoXZaepWG6hEYfg1hBWBzT/B01mbeYFy1uppCQeaIVm4ytzcbR0eocYxF2heqxMr8RvBUzqqO+KNTX+Jq/4zsN/JL9BFPk9yHtNv00UZw+BfHVJj2bfK+Ps+I0rYJuNxz26vyd+cmyM8KnkHTL888ak/qonuJvSnove3nJgdJvKId132hKnJNFBgeKzwrEmwqfAZfL2Q3r/UkO4DyM/mdYnpfI9EpxZnUevZiDnO/teRBtzWYlQYNL2ZD/afGAlv65y9CLWXGnneqbxn6oGAytYMbHa22Nd+5s/lAHmML2nSaS/X2nVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1VX6iq/jsPPCV+Nae6kUP/AIiuXAfJEYCYZBK32dQ8=;
 b=omkMl0YXijFV9NFv8RH2pqdufSLyxOl/YzJAk2EQv25b8gq+IcK+F8/L8B8oUMgmWFNJzkM0U+OLESKfQ62CZ7IZ/lweVI4alKNgi4jrO5+Y8mvBexjCqdHIBi5RUy5E1neWn6butsCsZY+TlCqxzeNyg8LcgMt2K8tWiiVTdo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d4b228f5-a02b-40b0-85a4-f505a7a3cc4d@citrix.com>
Date: Tue, 6 Jan 2026 11:41:40 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] x86/cpu-policy: enable build of fuzzing harness by
 default
To: Jan Beulich <jbeulich@suse.com>
References: <4a8f06b9-8210-487f-9dd7-e0221e2df9db@suse.com>
 <c3fcc1a5-6479-400b-b65d-35d7d7233b4a@suse.com>
 <5d45bb91-4ef5-48ec-b1fd-4f186f46c0ad@suse.com>
 <19ae296c-5ea0-46ce-9107-8d212c065257@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <19ae296c-5ea0-46ce-9107-8d212c065257@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0019.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed11e84-b8a6-4f58-7a59-08de4d1890cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnZaZUxuYXhncG1NU3VhSEw1aFZSNDhpdWNRZXZ6MFR6V3kwVTlTYTEybFFC?=
 =?utf-8?B?M2RUNWdVR2RJSmgwektudXZ5OWxQaVZuTWs3cFoxT0s1YzF3ZUtpa05iUmZM?=
 =?utf-8?B?THc1MUFCVGltOGRJSnZvQ0tqOU8xeHZCM0dMU3RUVE83YjZFNDBpN3h0NFQ5?=
 =?utf-8?B?RU9rWnRlT200THh1M1FvSlNqNDlDSmNiYXVyUFdwdlJVczJFRG05bmQ1YkZi?=
 =?utf-8?B?QVVMUmpMNDVRdlNNcVh1NGovTDFjSjJOa0xQM2N1OXRkU2ppeTQ4V2FHSElD?=
 =?utf-8?B?N1c4S29HZ1VzZHh2UUhxZDVqMU1GdCs4OXVYSk56OEI0eUV3dU5McUNFdWRk?=
 =?utf-8?B?eXYzTWhSTmNGTnE4VWtlakFaZlZHVThhU0ZCQTVJd3hiRFRabFZVZURuMFhv?=
 =?utf-8?B?NnpteVNPek93K0Z1Vk82elJhZitaMGMwQ21IQ0dBNmdmVnBqSGIrOGpqaUlw?=
 =?utf-8?B?U2pBUjdqTWdYVzdBT2FJSVJ3c0d4ZnZENWlWYThnRXhUZkJkblNXYnJqSHlQ?=
 =?utf-8?B?Yk1McEl3M05mUHlmN3NHVDhlbHNjWDNhbW0xU1RxQ01pZTMvb0svT2F1N3h1?=
 =?utf-8?B?YWlCa0xVWlU2VTB2d0QxTnNydXFyZFQ0Q0J4bE54ZlVnZ0p6K3FCUU5OUjl6?=
 =?utf-8?B?VzVTVHphTnpzRGMza0RwMEE3d2EyRjk1bkkwR3YySk9PcEQ2Z0FOemtTbGlz?=
 =?utf-8?B?QVZ3cCs3Ny83eGRzdkZGRnhmQWp6VitBc0xyWTJVa3lwK3pPZVB3akRjM2Fu?=
 =?utf-8?B?aXM1Mkg3N1hWeXhEQ2JXQ2VzWGNOemI4eWRLTmJBVDh2c1VmdDdXMVcrUTA2?=
 =?utf-8?B?aFN6NHF6WkdHTklpYzAvSGxKMWdWSkdqVTRXRksvVVRBeWhDelNGbU5DMW5n?=
 =?utf-8?B?MmtWT0N1Z085dU1hNks0OHcxZDVDclNTaks3KzNwdjJ4MmkwMVQrWDNOTEw4?=
 =?utf-8?B?OGVGTGQ0WmlZMU1zOHBKMFIvanZvemRyS0pWS0hhc0psamhVYlV3VVpvczhW?=
 =?utf-8?B?alZBdVlzL2xPYjV2S2VYdkVzOGRhcnZhZzR0emV2NERBanJWd3pKQnhsVlVO?=
 =?utf-8?B?eXVXQ2hoWnhsc21jNlIxRmNGRmFWSTRVMmJpbzVYVkRDbzAwSHBFYWl1OElj?=
 =?utf-8?B?R2lKWGJCRTBKdVBaQTcrN0dtaXVOcGg4LzRvNWJ3Z3NRWkF5L0s2Q1EvaWdl?=
 =?utf-8?B?TGx1SS9VMmtNUFhaOWhwODVVZ3BTRTd6cFozMU52aHl2R0dZd2VjYjd6ZlhW?=
 =?utf-8?B?MnZmWWhvY0V0aXI5WDZpK2Q2VSs0b2lIZ1VhRnJzdHNZMk9vS3hQUExRVVgv?=
 =?utf-8?B?Qk5LcktiTlZ4M3kxeGcrWms5Z091V09CTGtpSjBocDdkdXVSd2Y3RHh0R3ht?=
 =?utf-8?B?R2t3S1FwajFPU3F2NWxyYUxGRUV2TFJ4bU5SMk16dFhRdGtZWWJ3ZUVSYzkr?=
 =?utf-8?B?TDBiQ0ZiaHJsMElmTS9oVFRpWHd4Si9zZ0Z4L2JZbDhMVkxXT0JHZnRSVzFm?=
 =?utf-8?B?WTRXTzNYSCt4ZHNPSVZqMVZiSlo5d3FVcXM5T3FiaU1PYUJkT1lta2lZZkkv?=
 =?utf-8?B?c000ZkdwRFlMWkd1YW8vTi9sbVRyVjk3bHE2QTluQWxDT2lmNHZJQW1RS291?=
 =?utf-8?B?MjNHMDIxYlRoMXdtOTNIWEFlUXRHQldKQnI3T3VXcHlqdjNJUWtEUi9vZEts?=
 =?utf-8?B?Y2lOZVZ4ZmpMaFhqdFVkNlh2MWlveWJTNGMyTDVtZlpaV0VKbU5QSjAyUUg5?=
 =?utf-8?B?ZElYUFpaeXoxN3B3WGlWYzZVUDdUcWFPUUJQUlZyWGVxVVVlSE5KaytON29C?=
 =?utf-8?B?QkljbHV2OURjaGN3ZFEyTGU4cWJvR00zZlBUbGs3aVEzSXpJd1NEaTU2U2RC?=
 =?utf-8?B?cS9oNEpsMnE0Y3YwUml3WTIzTjRmKzE4VUJaa0lhYVJBbHpVQUhZdHQ4UHN1?=
 =?utf-8?Q?svWNjMgOyOLut5iK8MmDr0HdzUZOpM70?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFVyS283WGdUbjJ0bDVpY3Q5VHlQK2s3U3Ztbi9JbS9iWDlONWRaVUFabXpI?=
 =?utf-8?B?dGpGZUlCYk9wdnhxazZybWl1cEZhOVowenJzQVUxdmhpNk14dUN5MkUzcDJV?=
 =?utf-8?B?ZFNidFo5Wm9SUFNpTlpBaFhMUlgyNTNaY1R3WVhjd0ZUQzBLc01keGlXYjdG?=
 =?utf-8?B?eVNKZG15MUlUbW01OGNWVmNOZUZKTkZLNFpBT3hCc3NlM0xmN2x2RzBjMDcw?=
 =?utf-8?B?WVFGY1JGeG4vSHJ5bzhKU2RkOXlpZGV4UzNCZlZmVDZXVW9Pb01qdFhNa2RJ?=
 =?utf-8?B?YXdIYW9KOGo1VVJlQU5vcGZDZGRCaHFvR2x0bzl3OXVsOXlKcDZ0TzlYOExl?=
 =?utf-8?B?ajNJUGJla0hjdWcxMHAvbDJ0WWJ1TTdsUmJCcWdBckVoTU05Uyt0UDk0MXBJ?=
 =?utf-8?B?MGYwcjVIZDFYc0Zpb2lpSGJxT2NOVDliaktEeEdrRGtseG5pWU1JYzZXUjVa?=
 =?utf-8?B?RjU1ZnBjNzVLNHFpNHdMNy9nMEtxUGRWOHhITHZQWUFYR2xXdE85dCticHFZ?=
 =?utf-8?B?NkMyVXphTlJVNTJNMzY4NmR1NW1sYlEyeFVZdUhVVGd6MVk2LzRmTW1vejQ2?=
 =?utf-8?B?dEdEYTFWYzE0VUQ2R2xzSXFyZXU3QmVUV0s3VnZCWnpiS3ZlQTBnT3NkaE91?=
 =?utf-8?B?VDdDZFdCS21XNmh5cS9Payt6Z0x3L2dWY2pDRERQSjFZRldwYVFUZGMyOHRX?=
 =?utf-8?B?WE96c3cvV21mbUV4VFhpSmI4ZHRxRjhCRWZvblBVMlJYdlNaWEJmaE1NcTRE?=
 =?utf-8?B?K1J0OXdLdEZseVlpRWhjQ3dnWWhob0dFWG5ZNUlURkFzQjNiTzQvaUd1eG5i?=
 =?utf-8?B?bHdPNkJ1amhya1YrRi9pMVdIYU1ycVkzVDlUZkhhM2QzS2lzaWRKVmRXN2lB?=
 =?utf-8?B?QmFTanRlOEVkVDY2blRTdDRUM3diaTZyd01pMWNSTFhScnFZaDg4ZGs2anY0?=
 =?utf-8?B?cGpRRHVaVmlsb2RoSVplZ0lVUTB2VXZLcDZCcm9XMUFpT0F2QTN4U0Z2V2Fo?=
 =?utf-8?B?TlB2RzQ3ZWVwelBMN2lpd1NrYW95ZmN0dGxPUndtNG5wZjM3T1Qyd29uZU51?=
 =?utf-8?B?S2pOdGZhL3BuSC9kZnorcW9rTW1PeGZwV1NEZ1NJVC8yL09IQmZiYm9GaXpO?=
 =?utf-8?B?VU55dG9yWU8xNndSNHNVL0RXVTBtYmFDdkJZc0dVakUxcVY2aWhQdTFBdkdJ?=
 =?utf-8?B?ZWt0RUpQQlpJandhNTRIS1hyekZCbWZKb0RrYXIrUjVIZmw0VU1NaFFCWndO?=
 =?utf-8?B?NmVkOXE2YXpPYmNNcWZWN0RaanRXUHhIRDhiQmdOdmxlR3ZTWTJZN05DS0Zt?=
 =?utf-8?B?TkNhRFI1bWlLaHgzVnlWQXhhWmJ0Q1dhR3EzVmUzbXdXWGltWDR0K1lCUWlO?=
 =?utf-8?B?M2xhQ0laZTZtakc4aTFpQllyNGd3VGpNSmZyeVA5QzMxbWVyTUt4VDZTNFl6?=
 =?utf-8?B?bjdCS2Fzc1BVSjdyS2U1SXRSV2RNRTAvZVUwNi9pRkxaZXF0Y3o4VmlGZXlt?=
 =?utf-8?B?ZzBoSGxmcmtQU011ZzVnL05yMlNzWU5lUnVtSXZuQndjd05OZ0oweVBPdEhS?=
 =?utf-8?B?N1BYb1FabXErdU43cGZOd0cyeFJrRG5wMGJrZG9tTDFwQlhTaW1nclEzdWNw?=
 =?utf-8?B?aHh3b24wRWtDR3F5UGJqUGNGbmE5ay8xcU5OVWVkVEFjdUUyWTF0YUI4bElm?=
 =?utf-8?B?R0ZqeC8wL2ZWdGNlRzRwc3JVYzBKOGlaU0JKNEhRY040QVBvU1Z6VkV3ZFpp?=
 =?utf-8?B?cXJESXFIVVplSWFpVUp2MXVHUVRUNm1ONHUxUEYwOHRDSjI2NjdaeENNV2xF?=
 =?utf-8?B?L0ZXTW00UDhJVzluQXpZZXNydURLRzN1eHNwQStjQnZLVU5pVEtWSGtmSzds?=
 =?utf-8?B?YldVem5kWm5vaGd1VW1BWWRQSWdFbGZ1TnZ2WUQ4QmhHNXFqOThkMk5nY3BC?=
 =?utf-8?B?K2VCby9zaGlJTisxVXc3TitvNFd2SG1MTWFNR093SGpGTmxkT1ZpS3ZXSGVt?=
 =?utf-8?B?czIrVjM2a0V3bE1BckFEQ1MyOTQ5ajY4NjBJUHEwSCs2L0pKUHJ2STRSZkVz?=
 =?utf-8?B?SnpvbGxoLzlLcndJakNST05yT3dvcFdLYU1wajIxL0dsdVJqK3k2NHM5Q05T?=
 =?utf-8?B?Zk9JQnpjUENvLzlkU1JEOWZPNmg5SWJuc3JJS3lBT0dWRzhkTVp4SGhndUJn?=
 =?utf-8?B?Y1VVcnUwTVF5Wlo2Zzc5MlE1Y1RQQ2tmMkNjTVNyZy9udEVMdE9qZ1BKNDE0?=
 =?utf-8?B?cVl3WEZTU0J5V0FQYVhqT0VpOTg3c1VMWnJEdmRvTGVzd0UwRFBDYUpqN0tJ?=
 =?utf-8?B?UFZ3OTlrSFU3Zm53UmRaR0VpWVFKOTc0S204dkJidG9VTVNwMERwME1oUkYy?=
 =?utf-8?Q?J3JoZbWWzXbC2U4I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed11e84-b8a6-4f58-7a59-08de4d1890cd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:41:43.8621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyzZ9muzKNyIctiXvyIVNSrcI4njo5VYJ7YyPfTpT1N3brXMTlFCRw0UQyfOsFkjI+0025IIysxbNeKziPBzI9Ysdsa/NBY8dXe1cIURs4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5687

On 06/01/2026 9:49 am, Jan Beulich wrote:
> On 06.01.2026 10:36, Jan Beulich wrote:
>> On 22.12.2025 17:53, Jan Beulich wrote:
>>> ... on x86, to make sure its bit-rotting can be limited at least a little.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/tools/fuzz/Makefile
>>> +++ b/tools/fuzz/Makefile
>>> @@ -4,6 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
>>>  SUBDIRS-y :=
>>>  SUBDIRS-y += libelf
>>>  SUBDIRS-y += x86_instruction_emulator
>>> +SUBDIRS-$(CONFIG_X86_64) += cpu-policy
>>>  
>>>  .PHONY: all clean distclean install uninstall
>>>  all clean distclean install uninstall: %: subdirs-%
>>>
>> As it turns out this causes build failures on Ubuntu (and only there, and only
>> with gcc, which I don't understand):
>>
>> afl-policy-fuzzer.c: In function 'main':
>> afl-policy-fuzzer.c:153:9: error: ignoring return value of 'fread', declared with attribute warn_unused_result [-Werror=unused-result]
>>          fread(cp, sizeof(*cp), 1, fp);
>>          ^
>> cc1: all warnings being treated as errors
>>
>> Given how the code uses calloc() up front I don't really see why evaluating
>> the return value would actually be meaningful here, so I'm inclined to add a
>> cast to void (provided that would make a difference, which I have yet to
>> check). Opinions?
> Simply casting doesn't work. Hence what I'm intending to do is
>
> --- a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
> +++ b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
> @@ -133,6 +133,7 @@ int main(int argc, char **argv)
>  #endif
>      {
>          struct cpu_policy *cp = NULL;
> +        size_t size;
>  
>          if ( fp != stdin )
>          {
> @@ -150,9 +151,9 @@ int main(int argc, char **argv)
>          if ( !cp )
>              goto skip;
>  
> -        fread(cp, sizeof(*cp), 1, fp);
> +        size = fread(cp, sizeof(*cp), 1, fp);
>  
> -        if ( !feof(fp) )
> +        if ( !size || !feof(fp) )
>              goto skip;
>  
>          check_policy(cp);
>
> along with amending the description:
>
> "Since on Ubuntu fread()'s return value needs evaluating, adjust the code
>  there to also skip the test when there's no data at all."
>
> May I keep your ack with that adjustment?

Yes.  This is just harness code, so whatever compiles.

~Andrew

