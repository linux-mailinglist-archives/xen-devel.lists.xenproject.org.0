Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI9uKwgwk2mI2QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:56:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E56D144DF9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234224.1537531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs00o-00025K-3s; Mon, 16 Feb 2026 14:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234224.1537531; Mon, 16 Feb 2026 14:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs00o-00022w-0z; Mon, 16 Feb 2026 14:55:46 +0000
Received: by outflank-mailman (input) for mailman id 1234224;
 Mon, 16 Feb 2026 14:55:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAgz=AU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vs00m-00022q-A1
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 14:55:44 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90697286-0b47-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 15:55:42 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB7964.namprd03.prod.outlook.com (2603:10b6:303:276::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 14:55:39 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 14:55:38 +0000
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
X-Inumbo-ID: 90697286-0b47-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fj6sEZU1M85CzMlwFpLOz0nI3W/Hu8O13VS776L7dSfT1U47j65xeHzGmotTbzf9xwPtVRuNYnhvw0emy4zrQ5vVnnLQ25rvOYK2+sAf+Qdh4T+4z8WqZSgae5HyNq8i5QFeHWhN+r3AJJ7Zadvr9Pi4vxL12C2hZvnjU8lsspG+Qt36tfa6ANptSV/JOu8KcLLm7LvgrDxGmpwlT0IV+X1vRRlhm1UxuPpFd1M46+TzQU/MfaNLD/utNIRkKblH+h6ZGXXa77ut6ZoODUe9Sg6kQhS30XAs8ZGc8EfKwZjklqutgzlN2Wq5YvA69+cuz8Di6/v4f6rVjoGxkCkK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdiIh8qmaBZhJtld4gO1x0RQW5SaTUDlQkpOAfTNx6E=;
 b=TgpD/fJ1IPQ/EkpTk3PYj+kQ4Yn6VdkLkQGXPQqY53Xt6A7prBEFn0mB53lyV5C2vi9UgTxEHnqhO/08kM0ldHyRH+K2oyEJCMAGdyTKcX8eqe0ZO21/NHndtK33OB0MokacjQNpuh7iucD2S06XqVTUR7DZLWBC292jAExt2UakoTDbApMKPRIdjX/5FoHHpY7eM5j6f+yTQefYjjon0uRJIyKVCLuRPZlEEbISVJ7nlPlgMSad8JBYtWBzO7SzFca+Us2oMx8Jz4EHDpVLaz18Imqnyiut4urQDPHRa8ssB5IOJbY8/zy74QEloj23CBxgp/c93xJZGFmUJqbW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdiIh8qmaBZhJtld4gO1x0RQW5SaTUDlQkpOAfTNx6E=;
 b=hbsnw3q1IpCGSK6uIKBRxgziJ+Tjdu6EKckl9fCS8P0P16dMl6oMUPLWPgM99XqOe7WVjixe8/zYgg/pPC0yKAmulPL6LZATSbFPU9V1tFAbtF6QH2boMoqsj8hhDKTC0ewr8erp4JSDHXT9h4ZLxl1QDVuBTX7EYuKvcbIQq7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 Feb 2026 15:55:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] symbols: don't over-align data
Message-ID: <aZMv5pdaPPTNadtZ@Mac.lan>
References: <e220ea61-5483-4a91-a8b5-ac8fa387d9ab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e220ea61-5483-4a91-a8b5-ac8fa387d9ab@suse.com>
X-ClientProxiedBy: MA3P292CA0031.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf44bda-8d2c-4e42-bc73-08de6d6b724f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHpmZk5Vd3RoaUk5elRvQzFDcVo5cDF3eVE4K1Jna240cklGbGlTZ2dPQk1k?=
 =?utf-8?B?dCtRZjZCTHRkUUJmdm1PTWhmeHBpNi83WXdxU0FINkMxdHVaRE1ER1VNV2Z4?=
 =?utf-8?B?UTlBTi93OEkrRmMyYlY5dGZtYmR4dWJwdXo0OXZGT0JwdFBNZWs1V3BxRWRh?=
 =?utf-8?B?RFJodE9LTE1kZ2crdFJsOUlTVElBc3IrV2lJbVpJVkRxeXl3bkcyT2FCQUVG?=
 =?utf-8?B?bzQvWE91ZkIrQXVnNFZHdmIyZ0VrdU5aOGQ2OUU2OHYyaVRTMGp0MDBQKzlq?=
 =?utf-8?B?R3dpd1ZxWDVDYWdIM3IvYmdJK0VEaEYwODc4aWx6RWZXZGpHdzgyalRabmVR?=
 =?utf-8?B?QTZ6STRrNHBNaFprMkpBY2xQTW5aN290WmxjUEhRem5TZ1ZMYlRiSnZLNWUr?=
 =?utf-8?B?eE4zbERWcDY3WWRvY1pHZjRubDJlaHVsMEV5WW1ZazlXN0I0dTY0a2Iwa29j?=
 =?utf-8?B?MXJvTjhSSnpHZnljbG0vbVR2NkVoRHN5S2VVRVhoYW1LazJvc3ltQWJHSE1L?=
 =?utf-8?B?bHNOa05LTGZrLzkvODJienpsTXhUMG9nWW1WTVZhTngrZ3JBZTFKMFdyMXpw?=
 =?utf-8?B?S3NRK0VNVHRvdmVGU2wxV0dVWDFGaGJvQnVFVkZUa1lzck9pakNwVS9jeUVF?=
 =?utf-8?B?MnlTdHh5Lyt3WnNUTTFYS3R2clNQeWhzZ2k1MWVwaDNoZ3RVQWZBVFZUb094?=
 =?utf-8?B?a2F4RTZwQjk1TGpscis1aUkvTWtIbzZaRG1XVHJiaWtpeWZqekVjMWdQNzdJ?=
 =?utf-8?B?YllLTkQ3VDY0d3NWek5vVW4yNGJVRFpXMzVYNHlwOTI5Um9nTm9VVmpuNXJG?=
 =?utf-8?B?WW9NTVFFYkZnQ1hhTWV0TnU2bGFDZUZ3Z2JOdFhEQ0IwNDlEUUZaQ2IrRWZY?=
 =?utf-8?B?MnFTMEdZNjVyK3ZkbTNTODlnMHRFTmI4aU5kZVNVK2NqU3g3eFNXRmZ1RUtV?=
 =?utf-8?B?VlU3Z01NRmtaWDQraWlSZFpGaXhZT09TYXltMkV2RGRtbnArWG0rTjhsL0g0?=
 =?utf-8?B?SkppOXdqQ1A3K0xDdURvcCsxRzBKc2dmekpZb08zb2FISkRmaEdpWmQrRXl2?=
 =?utf-8?B?d29SVVlVZ3RCNUJNUWxxdG42WTl4dW1GZzd1L29HSmxKcjZlcWxzREI5cHZz?=
 =?utf-8?B?UWExaDFUdExTNE54N1c5YTlSMnF2VVVjcjdwSThVYXozZ2VGOEV5OUZBdjJa?=
 =?utf-8?B?d1kzUWZCNUZlMlpkWk1yVlh4a2VZN3NCVGdUT0Rlckp3NzJIUVJwS2kxUWZy?=
 =?utf-8?B?a1JzRVI1bTNCL1M1Z0grRlVzUllHYWhVN3lkck1Fb0pSTDBrQ0U2bjhzcGVC?=
 =?utf-8?B?dnMzOC9jOFV3eWMwR1BJN3haQUNVSGNESU5zTzFKZkJMRFpxSGxzdzJRNlRp?=
 =?utf-8?B?Y1dtT0pzRUJoUGl6M3JpNDVsV2l6dUR1bmVtUjBEMkVQbTlYZDdRZUtoWUh2?=
 =?utf-8?B?MXBtOWd5UDQxZGZKV0QrbytadnBDeUoyK21pcGE0WG1OUnk1bThuMXhnWXZ3?=
 =?utf-8?B?RE8rNndFS0kzbWw2L2NXRk9CL2dYQ0xLc3J2dytuYklRMlJ2cWVkVnBUR2ow?=
 =?utf-8?B?N0w0SFg5TllDT1BPOHA2cENiM2FYbEFnS09rems1ZXo4Q1JZbU1NZXcvUXZH?=
 =?utf-8?B?T2NLcWdlS1A2b1B5Ykt0akVYNFc4d2ExdGN4M1lHeXpjbDV2RFEvd0Eva2Nu?=
 =?utf-8?B?dk5VREp1MWtTZlc2LytPR0c4RElFZnZjN1g2Z0swWnhkczJWbWtmSUsvMDZQ?=
 =?utf-8?B?bEptOUI0MzQ0em1aZ243RXBRVlN4eFRQSGVEYWFWUlo4MlowL0pmQi9KWlhN?=
 =?utf-8?B?RWtCWlNqak1aL3FLWGEvWGZKd05IZlRlQmU5dTF3akhjUFR3di80dTZ0Ulgx?=
 =?utf-8?B?SnNWQWNHODBQTndtalFaejRIb0FLSFp4dGEvU2llN1VMcU5SalFXWjFMeXBF?=
 =?utf-8?B?K2UvSGdqNHdJZXJUUTRJaE9FY2I3ZW16TFRlZ1ZZbTN3NjdJdE9uWWpCTnli?=
 =?utf-8?B?ZEl5MTdTRjZpcmNxcHdtSTBZQzR0bFlpWEhqQVozNjMxK0dGUXROdC9vK0xU?=
 =?utf-8?B?RUpiMVg2N012QzU3K1hTT20vbWJST1NHTWdsUFYzVnBPbDdGckxoNWt4Y1Iy?=
 =?utf-8?Q?oyM4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEo4WGhmdGdRVW1OTzBReUp5emhGNmRMTXlrUHd6S1F1czNQMThNd1NjVVlW?=
 =?utf-8?B?eDFjYW9seTUvbG1jUitaVXhJR1RhRXNGMERjZ2FLZHl2STM0YXpYUHpzK0c4?=
 =?utf-8?B?TzB0N3NKT21qc2puOVBMN2ZGaE5DemFvbWUvSmtTWEpZaVFKeVZ2SUkzbXU2?=
 =?utf-8?B?NERhZEJOK0doV0VJMDhBbTRkTmVDVmZsZlFjeVlmK0VaMDIrYmZZWitacDZo?=
 =?utf-8?B?VzJ5QkZGdVRUby9oY2F0SlFwZGp6Nm5oMUxjTU1uWXFJMURLUTRYS3BndlJs?=
 =?utf-8?B?UUJ4VmFaalBzaU80UWUvRVdJczBxcVBYay90YW40LzY3d2dUb0FCQUVWblVF?=
 =?utf-8?B?Z1ZZMWdLVklGV05YTEc1UnM3YXlsZVdSSndGTXROaThPT1RaU2FmL01PQkdB?=
 =?utf-8?B?d2t1ZitRRTVYcW1DMmRFK3pvWlYvQUVhOFVOOGFDbFBTdWhnWDh4dEVvMExX?=
 =?utf-8?B?eitUekJPRmhxMzVKNlE2Qm5Gb0x2K2QwOXhJclQvZk5WTzBXSVRyaHJiaFg2?=
 =?utf-8?B?M1FmWDhEMmtaU2p4aGpoeDduSFRnT2xZWEJJNFd4aHRCYUlFTURHUFpnNVFq?=
 =?utf-8?B?ejlhZFNIS1pFbjg1TGNyYkxSc0NOTG1EQnFxV2o4RG5TcllIc0dxRE9NNWVZ?=
 =?utf-8?B?ZjFMbzlFMWpGYTAvcGFIWkEzeStiSWdoNmdIYkRsTjdZTUxDL09WMnovU3pP?=
 =?utf-8?B?NkQ4cmJlUmFjemtnSWNmOHdRUlJFeTJ0UG12dXRNRnkxK25nWnErUVpzWjNM?=
 =?utf-8?B?MjBhb3kyZzRNRk4yQTkraTNGbSt3QTcvMzYzeG4vdm1BTGdrbHpkWjllcHVB?=
 =?utf-8?B?K1lGS2RGbUtoSkFwOTlNY3I3MnJ4WlFIT2VwQkgreVFEM0Q1aVYvTXpzZXE1?=
 =?utf-8?B?Z01Sd2VwTkZNOUV1SVJ3YmVsd2kvR01HTVZhYms4eUh2UEZneVZRMGtSODd1?=
 =?utf-8?B?d0tvZTBKNXVvQUhobUg2TGRUdDMrd3M0MkR5SGtnZ3RLc0xRWmhWQjkyMnE0?=
 =?utf-8?B?Zmsyb0FGWGoyYmE0bjlKaEFqeHJheGNJVGtDZ2F3djB0LzY4TnlzMzZMTW5N?=
 =?utf-8?B?TWswbGlwejhWYlVGSDdJOFBieW9BMzVpNTdPNEFBa0hKSk9kN0hXSUVDdkdL?=
 =?utf-8?B?cmh6ZXFMZW5mY0loWk03dy9LREtCU2VkSXNtK2p2ckxpOW1FenVoZlVyTEFx?=
 =?utf-8?B?ckNqQ3FYeCtLM05aZ0FQaHY3VDVXdVl5UytFMys0NFpwajNIMmc0NGQwSkdZ?=
 =?utf-8?B?UldsRXRHbkJLdVFaZEJkZDdMZ0g2QWJ0L2FGZmMxOUp0dU5qZlRuTm44ZmQ1?=
 =?utf-8?B?cWFvYU9ybWN3ZU1SVk8yVm1VSmZLMzFud3dGSXdKdUFZbEpqOGRDcHNNZTFo?=
 =?utf-8?B?S2svRDlwVUxKTllwWUpZckVucGtTWXNlamxuZ2FjZjRxT3hmMyswTitVcVVm?=
 =?utf-8?B?anJvU2dtSDZnWW1kQXBkVDd3enc3UGh2TUR2WmxRMHN6bGtSZTYveXpQdXBM?=
 =?utf-8?B?dzlQcEMrcksxeXY5VWJQeVhrWDdHcEFKNDVRQXF1V2kxVCsxOFdvcE5PYmxj?=
 =?utf-8?B?bjY0aGhLK2Y5akwyQ3dqSGpYZ0laY2RGZlFlcnZ0Q0Q2YlVyK1l0OXlzS3pL?=
 =?utf-8?B?SXdodjJFaE5ybmVNN3hWTHE0Q045U2ZteVlOVmNlV1A5TDk3aTlSbEl1L2di?=
 =?utf-8?B?aHRnVDJkd2owdzJUVmtuSWxlc2RoZnpXdzBTbEdUYmxFcCtyamNaalNleVdu?=
 =?utf-8?B?RHhRMEtrNHF0aGV4VThvdHQySUhSb0h6aUdNRDgySGlqL0QzVmw2dUdqNHFT?=
 =?utf-8?B?TzNiTHRha21LMlpBckV0VndZemh0SjhLeVBWUndnN1NHSWhpT0djYkxLOHpJ?=
 =?utf-8?B?WVZDZExsMG1GRDVXUVBPSFBaS0czdEZ3VFlvdWtQTGM5YUV2YjRYNG5LY2VK?=
 =?utf-8?B?NXJ6ejR3RzBBMG5CRzNMZXVHTnJkMERRVm1Qbmc2c3ZFWlduUmE3Qkxmb0Ju?=
 =?utf-8?B?dEZuR1plMktDRTlyZGR6RTZvakR5a2liWGhxeXNhY0VlTjlkV3hjTEtaeEt1?=
 =?utf-8?B?Znd3N3JMOGJmUUVzemZlaDNBWEdWSzBHYkZTR0o3MjFVanNnczhmYzFWZUU0?=
 =?utf-8?B?dDhyOFpyRFNFNVl5UTBYTHRVc0pwUmFHckhIS2E1NG1lTHptRDRVSFFMM0R6?=
 =?utf-8?B?UW9qUy9IWE4zd25Vb01aTGxsdWxhMzNEVFRDbTBtS3EvOVBHV05vbGhuaUZR?=
 =?utf-8?B?NURPYzBPT28xUmRWVXgweXl3YkkzYUpGSFM4VWRBdHEvWFRQTVhyQ3dwZVpK?=
 =?utf-8?B?VGVVczJ6dFUvS2MrZXBFemVqTk5VVHlhUnBrdDhTRElkak9pMFlNdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf44bda-8d2c-4e42-bc73-08de6d6b724f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 14:55:38.2079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqOZe0tcmkhx7MG9E1KH1lUSWlMuADZNNmrwgeQ915rYXVeDhfWusmXawzaxLbUHTN0le8Ryx85uhSNEzDhbZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7964
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,suse.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0E56D144DF9
X-Rspamd-Action: no action

On Thu, Nov 13, 2025 at 11:58:49AM +0100, Jan Beulich wrote:
> Arrays of .byte or .short don't really need aligning better than 1 or 2
> bytes respectively. Arrays of .long also don't need aligning to 8 bytes
> (which would have happened when BITS_PER_LONG is 64 and SYMBOLS_ORIGIN is
> not defined).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

