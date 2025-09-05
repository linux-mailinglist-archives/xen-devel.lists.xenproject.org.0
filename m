Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5FFB44ECA
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 09:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111367.1460092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQc0-0005FC-Nv; Fri, 05 Sep 2025 07:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111367.1460092; Fri, 05 Sep 2025 07:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQc0-0005Cj-Ko; Fri, 05 Sep 2025 07:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1111367;
 Fri, 05 Sep 2025 07:11:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4b/E=3Q=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uuQbz-0005Cd-7k
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 07:11:55 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f403:200a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93df585b-8a27-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 09:11:45 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB8293.namprd12.prod.outlook.com (2603:10b6:8:f3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.17; Fri, 5 Sep 2025 07:11:40 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Fri, 5 Sep 2025
 07:11:40 +0000
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
X-Inumbo-ID: 93df585b-8a27-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtaeE/qsWyF+Maa3tspRJP15Y+90q9EXi2ini9rfTfIwlIKIeMvW9I+XM/UeeCCJV86k2sn6XGwB84wlJvz6nfIVbMwSmOen3V23tRUfwvv0em5jE83HxBpJUsdwRfmXP1m1nLDF6acfIKYleXtJOB99u9XCep7y9/9feqNmFu7/9bXg7d4E+ctrE4AvT2fjQvD2hFxNFs1q7GCMZV0jvsfinvfOKcR6ez1M8/5ur4qMYl4eXskwK3hFyV5Bwp4I5hOwuAILxemTgPyMmcx5qo0jN6EiR1X8PC4qA3hXLtYW0evo0AQWRzmYb14Txl/eNZ7lwbGRPJ11nM/upclsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHGi6zbgHkLU1ZLPoLcYtWxoeAcJ5MGH6pc7mdfbh+k=;
 b=UdCFIZoJfOFUACbW2aPeJ4CkToqW1B8YiaFIveGwN3y9A1SwluHxYeYgij1GjRJa5MnmV7qXmeUiAbthB6ivWiDCFxdeFs1sYTd4vQOmQBAB0x0feUEj5HkFU6nS3FtocrivWJRSGuyCBtvE71i26jYdXNlWyd1GKem+AMRWoZYHAIKeJ2u016XtSlwvpByH4JID9ucoeIwmaEfuqbDgmhNhvFc5GvEyhHF/RThVcc5M9h2g1IAxUgqhqN26YFMyNP74PhduSrtap0/DrIL/ZKIF6ArQNqJbaYOUw29tiRTwOgylCOp9XYwba+PDyBhCiSrIlLxV8jmRaBRXJFzDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHGi6zbgHkLU1ZLPoLcYtWxoeAcJ5MGH6pc7mdfbh+k=;
 b=5EvlJWYkSRiwgByp6v6nT1qfZwW7+ho/GFWjqydmudRBVBxogZf2KAlHjzgPLse0V0YJI+NUDnXStc5Q918JSkBky04Pc0zhymwkKfkipBEtrR0CRouif44XWqq+pdtPWJvkdQufYqVCsxT/ss2A1z0uBJLCTyVjpATPlhO+cXc=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v9 2/8] xen/cpufreq: implement amd-cppc driver for CPPC in
 passive mode
Thread-Topic: [PATCH v9 2/8] xen/cpufreq: implement amd-cppc driver for CPPC
 in passive mode
Thread-Index: AQHcHWYoaQVmnKMmQ0CpiPNNytQ3NLSC7UgAgAEbxuCAAB1BAIAAAG6g
Date: Fri, 5 Sep 2025 07:11:40 +0000
Message-ID:
 <DM4PR12MB8451258C853C97088D399C3EE103A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-3-Penny.Zheng@amd.com>
 <7e769952-a906-4a3e-af27-26faa76f6dd4@suse.com>
 <DM4PR12MB84512B3A12E5185725F84BD7E103A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <4f2ff564-e64a-4d0e-b123-d85b81f10929@suse.com>
In-Reply-To: <4f2ff564-e64a-4d0e-b123-d85b81f10929@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-05T07:11:34.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB8293:EE_
x-ms-office365-filtering-correlation-id: cae7acd7-9e87-4396-e55d-08ddec4b762c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WUt3MkI5aVovZmoySGFobTl1dnlFZUdneVkvYytIaXp1NGF0SGJ3KzF0b214?=
 =?utf-8?B?QjVEWkUyTGlubm9xZHNWSUE1QXdVUFhlclVuRVdtQ1l0aCtRRmRNS0FHZEJa?=
 =?utf-8?B?UzJrZ1V2SFg2NjVzYzJYVHRKczc2a2RxalNDQmZyUVhTVDd5TkZ2a0tzckV1?=
 =?utf-8?B?b0lLMVJXczliU1A5bDdRMStpZVZWSENuOER0UDA5OGNMWG5FcjI3OVVDSEhI?=
 =?utf-8?B?enRISVJXMEIvbGpoUXpueTVnMFJYK0Q2NVpuRVBlaTl4Q3JQVXdVWFp6QTM1?=
 =?utf-8?B?TWU2dXBieDgzNmRUNVpPMlNPWmhEM2ZYYlFYUVZoaTRnL3NXVlQ5RFc0dHg4?=
 =?utf-8?B?QURBaUV0bjZiSzJ1SW9CYzJTUmpPalIxZGgyNXpCNk12aWVlMXVVck51ckVP?=
 =?utf-8?B?azc3R29lSmtHQU4xT2dpRjJ3RzBzdHdvRlNFc0h3T0MzbzJwd3k1UllrYVlq?=
 =?utf-8?B?UjFPaUcrVTdtRGVIV3F1Qno4T0ZQQThCd2Vhb1NrSFBtVzNESGJhZ0t4ajdE?=
 =?utf-8?B?NzJkZmIyK0hNOURnZFViUmFDS256d3h4OU1SM2c2bGpEU1gvT2pIUk9oZEp5?=
 =?utf-8?B?UXdqN0Z2VnNETjh6NWV6UXJYZ0tYTEVzTDRMcDNYNG1ZVHVmWDBnZ1VneW5Y?=
 =?utf-8?B?SEExcC9vWHBkaXdYQjd0YTk1UDAwalExYzlkRHRHOERJY2RRY09hb2U5RXJu?=
 =?utf-8?B?L2hCUjdxVFk4UHhmc1RtdXVSVFNnYWNJZjRZNi9oODZPaUpVWEpFNXIwamZB?=
 =?utf-8?B?YlFvWHVzL3RXRTloaGIyMmp2MWY1SHhYeGlnd1YvVUJVb2w2Um9DRWxSS0pD?=
 =?utf-8?B?WlplY3NTeFFzZXJuL1R6dVhLNjJpSnovRlpUckZmWmZwUUczdE4wZ3pYQkx0?=
 =?utf-8?B?UnRRakd6ckFpYVFvN2ZjVTl5Z0hxRjNaNTV1VFoxR29uOThHRHRoVEltYU5S?=
 =?utf-8?B?OXUyZHlVWENvb2MvMGsrYzh6LzVRZloyNWNXNFJoL1ZCdmZMd0lNYnpubitL?=
 =?utf-8?B?dTZNc002Z1dDY3kweTlGZ0ZldFNtYTlmQ1JYVVVOU1Q4SVFiTStZTU1PR20x?=
 =?utf-8?B?VFVoQ2pPNWxjU1doYmRBZitNWFdqUFAxTzdNRjd5eVJxZXFHeUhIVkdrc0xk?=
 =?utf-8?B?cEp5dStCMFJPMnUva0kvK29KTlJNaEYxbzR0eVRRRzFZODhrK3VMdDRWaUV2?=
 =?utf-8?B?KzJNb1FtdlNjNDJDb0N4anFiMnFOVk5HbXQxWFZ2Q1JDSEM4WXNEa0E2aklK?=
 =?utf-8?B?TkhhL2pqM3RISnphd0pZOU1YSUZOY1hLWlhUQm9qbFhIVWxmTEdaRndoa3Js?=
 =?utf-8?B?NkVZTThsVG5TMnZDSnpCSnlIdnY1d1FKMC83eEljL1Q3bU9tQXZwYlNlMUI5?=
 =?utf-8?B?LzNXTWJmWE9vZTh5bVQ4Kyt6ZEpNb1E3VXU0KzhITndua3V6Z1RFNlFYeHRK?=
 =?utf-8?B?Y254dUxQTnJ6UktBWHBHU04wa3FLVWdNbFNDZ1NZUm5ZWENwQS9HR1pYOUNt?=
 =?utf-8?B?NjlnRDh6MGFzTVpGU3JtMUw4eTRyaVNGUDgyNlVGWGZJWHBzMVNCRmd3MnQx?=
 =?utf-8?B?MWUzbkUwYms3Vm4vYmtFaGR6VEdIMnhPZVZLVUY3YnRPSWpsVDRJb0JRYWdo?=
 =?utf-8?B?THpkZVdzOGJVWFNoNlNQU2xBM1M4Q1FnYWpiUXFaZjJ0K2kzYTN5S2VxeW0x?=
 =?utf-8?B?UFJCVUhJZGlaeUsvL09wTHB0NnhIS216c2FqamdpTklwV0RVTmlPckhoNWJK?=
 =?utf-8?B?QjJZckNDbU5YTG5HSzZTanVjOGJNWmlsdVpJNTcyREtPTVpzOVRnWkdka2pq?=
 =?utf-8?B?dW5HNGZNS0JnNWpkMkxiUG03Y05NVENVTkR3eFdaY3k2N2o0NkFLWFBwS2FC?=
 =?utf-8?B?NHN3Z0FTL1I0QU5iWHdjdmdOaVh3NkZZc3daY2JoMkRlTTAvTTByR2F3dGcz?=
 =?utf-8?B?SXgzZDh6eWJmYzhDN3Q3WWdMbXo1VmpqdXZTZlhuVUhFM3lFYW9rZDVHc2k2?=
 =?utf-8?B?d2h0T3c1ZWZRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z2t0NlFLWlE2U1lFOXdLSHJteUhoZENkZWFFVW9RZnp4M1kvYjA1aDF6dzlZ?=
 =?utf-8?B?aE03Tk5adUQwTmFFMUgwRzBlT3dXb2RZa2ZhKzMwTXpOclBHRi9zc2M5L29x?=
 =?utf-8?B?SXc1Z1Nnank4dVR6My82SmtPc3BCM0VRa1NwNFI1eHN5ZlNFbTlJdHVrdEtL?=
 =?utf-8?B?QWlQSW5ERUFvNGNRNE5vb2FTSGgwMkdXMTVVYkJnNXdWL3NKSjJza0NSSVdz?=
 =?utf-8?B?S0NiSWNrUHZSWUNibWwwTElrRnp2MDhXNFh3T1pWUGFWemFCcER6ekZzWVpu?=
 =?utf-8?B?U1o5K0kvVXd3SjBLY2RpclF0M09tRGJhRm9xSUM1V2JJMXQvQ2VjT2IrTWFB?=
 =?utf-8?B?K1pRenUyVVF2aTRKN2YybUlid1pmUW1KdlpVTDBBY3RDWjFJUW42REhDWTJj?=
 =?utf-8?B?NlFkaXgzOGlibWY3VU5VRGNQZno3TXovY2VaNCtFK2xHSVN6akR3SUhqUE5w?=
 =?utf-8?B?S3p1V05IV1JnbCtTWUdKU3g4RUxQK0lkZ1UwNnNoUmxRRFNFamJYQk50cGxn?=
 =?utf-8?B?MGdOTmkrcHVYSW1qK2hCZTJPNkJDQ2JDa0hPa3BGaEVXZTk4djZRNzZFY3ZG?=
 =?utf-8?B?MVFsMzdHVEZ5YW1pNk5Hc0hrbEJlazdBek5FUjdoL3YzZC9aYUticnRmaTFl?=
 =?utf-8?B?RzUyOHNRb1p2SURtQy90Z0RCWFVEUGRTQ2EvSGU2emNQd0lHc2xobkV5aHFD?=
 =?utf-8?B?dnlDRVFsemZxWnZ3TVgramVGRUZGQ3Z3RjNZeXlwZXJtbDh1VWpsTStkRkVn?=
 =?utf-8?B?alNFUlJVUVlHVGNJYTk0VGhoeEN2eEZZKzRxaGhGNHJpME5HY2dSTnhNUFZp?=
 =?utf-8?B?a2xRc1pPU3RNRFcrR29ObDhwbW9CbzhQMk1RYyt1bm5DbkttOGw5NSt0czdN?=
 =?utf-8?B?MUh4Z1FHaU9FMm1rdUZRanM1MncraWxwNGZMcExRZDJCamkvWkRYcGIwaUht?=
 =?utf-8?B?K1ZsNStEUUtRM3A3OGN0YWg5ZDV3dEVRN05VUzZ5UVR4UEhrRDR6SERuSG5y?=
 =?utf-8?B?N0xFRkQ0V3dLckRrNmhQVEROT3MyQm80ZjBpZnN1RVF1MXVDL09QZ0dNeGZV?=
 =?utf-8?B?cDdMc0MvV0tBUjVMNERjdzhvM0ZGd1lRNUJ3MUdxOGNGc3pYQUxqRFpPQ2xP?=
 =?utf-8?B?VGNtQk1RZTQ0ZmpFcDg4bmR3R2xwbUZZKytJZnpPY1VCc241VHcwekZaZ3hI?=
 =?utf-8?B?TzlRRU9Pd0VJMUJQWi9jV0ZBVXFSb0VXNEljcVFYdnRqTHpCMWVqQUt5c2lB?=
 =?utf-8?B?Wkg5aVlESlVXTWZITEhoSHZVV1FEWHpURkJBYloySTJXdzRvZWY4VC9hbm8w?=
 =?utf-8?B?ZGZUbDJFVXVxRFg5dDFiYjVJS1lKczVERnE2M3NweXJwcEV3aXNVOTMzVTZ4?=
 =?utf-8?B?Ry9UcVBWWi9wdjgxaTJJVU9BM3RpUjQ4Znl6ZE04Z2I5NHFPeUNyRFd3TEc3?=
 =?utf-8?B?VW5hb1ZHMTFsUGxRNERLRU5wbTd0N3o2UVppL1BnaHBLRHJLYndScHdmMytp?=
 =?utf-8?B?Mk9HL0dsQm8zbGVIVytyZndWZ1hxUjAvbnNKM2thQThsU3lnTnFHeU5xZU9F?=
 =?utf-8?B?Q05hYkFXTStaRDM1dzFla0F1K2IvQUt1WlNJYXF4c2tXUU5BWlJsdFpEVjFB?=
 =?utf-8?B?am45bHpzUk5zTTA3R2VPVlpLSUxwdExnay9YMmxrVVBVWWVSN3NiQ0Q2Y1lJ?=
 =?utf-8?B?d3hOdWtOUUZiSXI3aXYvMUdFVjhCY2I0YUQ4WjRxa1NFRHozdHRTK3RIcjlK?=
 =?utf-8?B?dGd5aW1yWWt4em9JR3l3LytXalFIUHAzdzZiSGtKVXVwTW5pYkJJQmtlQ3Nh?=
 =?utf-8?B?ZWxCU0J4TnpLY2QrSGtxUnhnOUMxQ2JraEcrQjh5dFM5ZDdKdlJpdmFMam9V?=
 =?utf-8?B?NUNab0xHRFZFY1pCdTNQWXMzWnVRcU9XZ3Z3U2VMcURMTjdPKytVT2xGeEd3?=
 =?utf-8?B?S1NvbUdOZjZRaVl1dkFxQjA0bXF1bzMrbjlMS3RHTmY5Z3NhSmtFQ01RRVF4?=
 =?utf-8?B?TTA2bFRNSDllOE1MNVpMZGRBZFFsbEpjQ2NMcU5tTmpwUSs0MmRFOStJVUxx?=
 =?utf-8?B?aUFQR1B6Z0tTdjl2c2V0THVHS3NOUkIvTFB4eXF1NFRVTkl3QmUxcEZIZnpE?=
 =?utf-8?Q?+etg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae7acd7-9e87-4396-e55d-08ddec4b762c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 07:11:40.5603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zi0gbfJDCncwHOOpTzsezX5h7BUjczDFFcuftqX/cjRwFQCHCIC+vYnYccFGbRdbrtQggi3kxvO0iUeLW+b3SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8293

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDUsIDIw
MjUgMjo0NSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBN
b25uw6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQHZhdGVzLnRlY2g+OyBPcnplbCwNCj4gTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNv
bT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSAyLzhdIHhlbi9jcHVmcmVxOiBpbXBsZW1lbnQgYW1k
LWNwcGMgZHJpdmVyIGZvciBDUFBDIGluDQo+IHBhc3NpdmUgbW9kZQ0KPg0KPiBPbiAwNS4wOS4y
MDI1IDA3OjE1LCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4g
U2VudDogVGh1cnNkYXksIFNlcHRlbWJlciA0LCAyMDI1IDg6MDQgUE0NCj4gPj4NCj4gPj4gT24g
MDQuMDkuMjAyNSAwODozNSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiArc3RhdGljIHZvaWQg
Y2ZfY2hlY2sgYW1kX2NwcGNfd3JpdGVfcmVxdWVzdF9tc3JzKHZvaWQgKmluZm8pIHsNCj4gPj4+
ICsgICAgY29uc3Qgc3RydWN0IGFtZF9jcHBjX2Rydl9kYXRhICpkYXRhID0gaW5mbzsNCj4gPj4+
ICsNCj4gPj4+ICsgICAgd3Jtc3JsKE1TUl9BTURfQ1BQQ19SRVEsIGRhdGEtPnJlcS5yYXcpOyB9
DQo+ID4+PiArDQo+ID4+PiArc3RhdGljIHZvaWQgYW1kX2NwcGNfd3JpdGVfcmVxdWVzdCh1bnNp
Z25lZCBpbnQgY3B1LA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGFtZF9jcHBjX2Rydl9kYXRhICpkYXRhLA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWludDhfdCBtaW5fcGVyZiwgdWludDhfdCBkZXNfcGVyZiwNCj4g
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgbWF4X3BlcmYs
IHVpbnQ4X3QgZXBwKSB7DQo+ID4+PiArICAgIHVpbnQ2NF90IHByZXYgPSBkYXRhLT5yZXEucmF3
Ow0KPiA+Pj4gKw0KPiA+Pj4gKyAgICBkYXRhLT5yZXEubWluX3BlcmYgPSBtaW5fcGVyZjsNCj4g
Pj4+ICsgICAgZGF0YS0+cmVxLm1heF9wZXJmID0gbWF4X3BlcmY7DQo+ID4+PiArICAgIGRhdGEt
PnJlcS5kZXNfcGVyZiA9IGRlc19wZXJmOw0KPiA+Pj4gKyAgICBkYXRhLT5yZXEuZXBwID0gZXBw
Ow0KPiA+Pj4gKw0KPiA+Pj4gKyAgICBpZiAoIHByZXYgPT0gZGF0YS0+cmVxLnJhdyApDQo+ID4+
PiArICAgICAgICByZXR1cm47DQo+ID4+PiArDQo+ID4+PiArICAgIG9uX3NlbGVjdGVkX2NwdXMo
Y3B1bWFza19vZihjcHUpLCBhbWRfY3BwY193cml0ZV9yZXF1ZXN0X21zcnMsDQo+ID4+PiArIGRh
dGEsIDEpOw0KPiA+Pg0KPiA+PiBXaXRoICJjcHUiIGNvbWluZyBmcm9tIC4uLg0KPiA+Pg0KPiA+
Pj4gK30NCj4gPj4+ICsNCj4gPj4+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGFtZF9jcHBjX2NwdWZy
ZXFfdGFyZ2V0KHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5LA0KPiA+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHRhcmdldF9m
cmVxLA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50IHJlbGF0aW9uKSB7DQo+ID4+PiArICAgIHN0cnVjdCBhbWRfY3BwY19kcnZf
ZGF0YSAqZGF0YSA9IHBvbGljeS0+dS5hbWRfY3BwYzsNCj4gPj4+ICsgICAgdWludDhfdCBkZXNf
cGVyZjsNCj4gPj4+ICsgICAgaW50IHJlczsNCj4gPj4+ICsNCj4gPj4+ICsgICAgaWYgKCB1bmxp
a2VseSghdGFyZ2V0X2ZyZXEpICkNCj4gPj4+ICsgICAgICAgIHJldHVybiAwOw0KPiA+Pj4gKw0K
PiA+Pj4gKyAgICByZXMgPSBhbWRfY3BwY19raHpfdG9fcGVyZihkYXRhLCB0YXJnZXRfZnJlcSwg
JmRlc19wZXJmKTsNCj4gPj4+ICsgICAgaWYgKCByZXMgKQ0KPiA+Pj4gKyAgICAgICAgcmV0dXJu
IHJlczsNCj4gPj4+ICsNCj4gPj4+ICsgICAgLyoNCj4gPj4+ICsgICAgICogSGF2aW5nIGEgcGVy
Zm9ybWFuY2UgbGV2ZWwgbG93ZXIgdGhhbiB0aGUgbG93ZXN0IG5vbmxpbmVhcg0KPiA+Pj4gKyAg
ICAgKiBwZXJmb3JtYW5jZSBsZXZlbCwgc3VjaCBhcywgbG93ZXN0X3BlcmYgPD0gcGVyZiA8PQ0K
PiBsb3dlc3Rfbm9ubGluZXJfcGVyZiwNCj4gPj4+ICsgICAgICogbWF5IGFjdHVhbGx5IGNhdXNl
IGFuIGVmZmljaWVuY3kgcGVuYWx0eSwgU28gd2hlbiBkZWNpZGluZyB0aGUgbWluX3BlcmYNCj4g
Pj4+ICsgICAgICogdmFsdWUsIHdlIHByZWZlciBsb3dlc3Qgbm9ubGluZWFyIHBlcmZvcm1hbmNl
IG92ZXIgbG93ZXN0IHBlcmZvcm1hbmNlLg0KPiA+Pj4gKyAgICAgKi8NCj4gPj4+ICsgICAgYW1k
X2NwcGNfd3JpdGVfcmVxdWVzdChwb2xpY3ktPmNwdSwgZGF0YSwNCj4gPj4+ICsgZGF0YS0+Y2Fw
cy5sb3dlc3Rfbm9ubGluZWFyX3BlcmYsDQo+ID4+DQo+ID4+IC4uLiBoZXJlLCBob3cgY2FuIHRo
aXMgd29yayB3aGVuIHRoaXMgcGFydGljdWxhciBDUFUgaXNuJ3Qgb25saW5lIGFueW1vcmU/DQo+
ID4NCj4gPiBPbmNlIGFueSBwcm9jZXNzb3IgaW4gdGhlIGRvbWFpbiBnZXRzIG9mZmxpbmUsIHRo
ZSBnb3Zlcm5vciB3aWxsIHN0b3AsDQo+IHRoZW4gLnRhcmdldCgpIGNvdWxkIG5vdCBiZSBpbnZv
a2VkIGFueSBtb3JlOg0KPiA+IGBgYA0KPiA+ICAgICAgICAgaWYgKCBod19hbGwgfHwgY3B1bWFz
a193ZWlnaHQoY3B1ZnJlcV9kb20tPm1hcCkgPT0gZG9tYWluX2luZm8tDQo+ID5udW1fcHJvY2Vz
c29ycyApDQo+ID4gICAgICAgICAgICAgICAgIF9fY3B1ZnJlcV9nb3Zlcm5vcihwb2xpY3ksIENQ
VUZSRVFfR09WX1NUT1ApOyBgYGANCj4NCj4gSSBjYW4ndCBicmluZyB0aGUgY29kZSBpbiBsaW5l
IHdpdGggd2hhdCB5b3Ugc2F5Lg0KDQpPbmx5IHByb2Nlc3NvcnMgaW4gdGhlIGRvbWFpbiBhcmUg
YWxsIG9ubGluZSwgdGhlIHdlaWdodCBlcXVhdGVzIHRvIHRoZSAibnVtX3Byb2Nlc3NvcnMiLiBU
aGF0IGlzLCBnb3Zlcm5vciBzdG9wcyB3aGVuIHRoZSAqZmlyc3QqIHByb2Nlc3NvciB0cmllcyB0
byBvZmZsaW5lLg0KSWYgZ292IHN0b3BzLCBjcHVmcmVxLT50YXJnZXQoKSB3aWxsIG5vdCBiZSBl
eGVjdXRlZCBhbnkgbW9yZS4NCkFsc28sIGluIF9fY3B1ZnJlcV9kcml2ZXJfdGFyZ2V0KCksIHdl
IHdpbGwgZG8gdGhlIGNwdV9vbmxpbmUocG9saWN5LT5jcHUpIGNoZWNrIHRvIGVuc3VyZSByZWdp
c3RlcmVkIGNwdSBpbiBwb2xpY3ktPmNwdSBpcyBvbmxpbmUNCg0KPg0KPiA+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGRlc19wZXJmLCBkYXRhLT5jYXBzLmhpZ2hlc3RfcGVyZiwNCj4g
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBQcmUtZGVmaW5lZCBCSU9TIHZhbHVl
IGZvciBwYXNzaXZlIG1vZGUgKi8NCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBw
ZXJfY3B1KGVwcF9pbml0LCBwb2xpY3ktPmNwdSkpOw0KPiA+Pj4gKyAgICByZXR1cm4gMDsNCj4g
Pj4+ICt9DQo+ID4+PiArDQo+ID4+PiArc3RhdGljIHZvaWQgY2ZfY2hlY2sgYW1kX2NwcGNfaW5p
dF9tc3JzKHZvaWQgKmluZm8pIHsNCj4gPj4+ICsgICAgc3RydWN0IGNwdWZyZXFfcG9saWN5ICpw
b2xpY3kgPSBpbmZvOw0KPiA+Pj4gKyAgICBzdHJ1Y3QgYW1kX2NwcGNfZHJ2X2RhdGEgKmRhdGEg
PSBwb2xpY3ktPnUuYW1kX2NwcGM7DQo+ID4+PiArICAgIHVpbnQ2NF90IHZhbDsNCj4gPj4+ICsg
ICAgdW5zaWduZWQgaW50IG1pbl9mcmVxID0gMCwgbm9taW5hbF9mcmVxID0gMCwgbWF4X2ZyZXE7
DQo+ID4+PiArDQo+ID4+PiArICAgIC8qIFBhY2thZ2UgbGV2ZWwgTVNSICovDQo+ID4+PiArICAg
IHJkbXNybChNU1JfQU1EX0NQUENfRU5BQkxFLCB2YWwpOw0KPiA+Pg0KPiA+PiBIZXJlIHlvdSBj
bGFyaWZ5IHRoZSBzY29wZSwgeWV0IHdoYXQgYWJvdXQgLi4uDQo+ID4+DQo+ID4+PiArICAgIC8q
DQo+ID4+PiArICAgICAqIE9ubHkgd2hlbiBFbmFibGUgYml0IGlzIG9uLCB0aGUgaGFyZHdhcmUg
d2lsbCBjYWxjdWxhdGUgdGhlIHByb2Nlc3NvcuKAmXMNCj4gPj4+ICsgICAgICogcGVyZm9ybWFu
Y2UgY2FwYWJpbGl0aWVzIGFuZCBpbml0aWFsaXplIHRoZSBwZXJmb3JtYW5jZSBsZXZlbCBmaWVs
ZHMgaW4NCj4gPj4+ICsgICAgICogdGhlIENQUEMgY2FwYWJpbGl0eSByZWdpc3RlcnMuDQo+ID4+
PiArICAgICAqLw0KPiA+Pj4gKyAgICBpZiAoICEodmFsICYgQU1EX0NQUENfRU5BQkxFKSApDQo+
ID4+PiArICAgIHsNCj4gPj4+ICsgICAgICAgIHZhbCB8PSBBTURfQ1BQQ19FTkFCTEU7DQo+ID4+
PiArICAgICAgICB3cm1zcmwoTVNSX0FNRF9DUFBDX0VOQUJMRSwgdmFsKTsNCj4gPj4+ICsgICAg
fQ0KPiA+Pj4gKw0KPiA+Pj4gKyAgICByZG1zcmwoTVNSX0FNRF9DUFBDX0NBUDEsIGRhdGEtPmNh
cHMucmF3KTsNCj4gPj4NCj4gPj4gLi4uIHRoaXMgYW5kIC4uLg0KPiA+Pg0KPiA+IEdPVl9HRVRB
VkcpOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAvKiBTdG9yZSBwcmUtZGVmaW5lZCBCSU9TIHZhbHVl
IGZvciBwYXNzaXZlIG1vZGUgKi8NCj4gPj4+ICsgICAgcmRtc3JsKE1TUl9BTURfQ1BQQ19SRVEs
IHZhbCk7DQo+ID4+DQo+ID4+IC4uLiB0aGlzPw0KPiA+DQo+ID4gVGhleSBhcmUgYWxsIFBlci10
aHJlYWQgTVNSLiBJJ2xsIGFkZCBkZXNjcmlwdGlvbnMuDQo+DQo+IElmIHRoZXkncmUgcGVyLXRo
cmVhZCwgY29vcmRpbmF0aW9uIHdpbGwgYmUgeWV0IG1vcmUgZGlmZmljdWx0IGlmIGFueSBkb21h
aW4gaGFkIG1vcmUNCj4gdGhhbiBvbmUgdGhyZWFkIGluIGl0LiBTbyBxdWVzdGlvbiBhZ2Fpbjog
SXMgaXQgcGVyaGFwcyBkaXNhbGxvd2VkIGJ5IHRoZSBzcGVjIGZvcg0KPiB0aGVyZSB0byBiZSBh
bnkgImRvbWFpbiIgY292ZXJpbmcgbW9yZSB0aGFuIGEgc2luZ2xlIHRocmVhZD8NCj4NCg0KSSds
bCBkb3VibGUtY2hlY2sgd2l0aCB0aGUgaGFyZHdhcmUgdGVhbSBhYm91dCBpdC4NCg0KQWxzbywg
bWF5YmUgeGVuIGN1cnJlbnQgY29kZSBpcyBhbHJlYWR5IG92ZXJpbmcgU1dfQU5ZIGNvb3JkaW5h
dGlvbi4gQXMgZm9yIFNXX0FOWSBjb29yZGluYXRpb24gdHlwZSwgdGhlIE9TIG5lZWRzIHRvIGNv
b3JkaW5hdGUgdGhlIHN0YXRlIGZvciBhbGwgcHJvY2Vzc29ycyBpbiB0aGUgZG9tYWluIGJ5IG1h
a2luZyBhIHN0YXRlIHJlcXVlc3Qgb24gdGhlIGNvbnRyb2wgaW50ZXJmYWNlIG9mICpvbmx5IG9u
ZSogcHJvY2Vzc29yIGluIHRoZSBkb21haW4uIEluIFhlbiwgaWcsIHRoZSAib25seSBvbmUiIGlz
IHRoZSBjcHUgcmVnaXN0ZXJlZCBpbiBwb2xpY3ktPmNwdS4NCkJ1dCBmb3IgIlNXX0FMTCIsIHRo
ZSBPU1BNIGNvb3JkaW5hdGVzIHRoZSBzdGF0ZSBmb3IgYWxsIHByb2Nlc3NvcnMgaW4gdGhlIGRv
bWFpbiBieSBtYWtpbmcgdGhlIHNhbWUgc3RhdGUgcmVxdWVzdCBvbiB0aGUgY29udHJvbCBpbnRl
cmZhY2Ugb2YgKmVhY2ggcHJvY2Vzc29yIiBpbiB0aGUgZG9tYWluLCBJIGhhdmVuJ3Qgc2VlIGFu
eSBjb2RlcyBjb29yZGluYXRpbmcgdGhlIHN5bmNocm9uaXphdGlvbiBpbiBYZW4NCg0KPiBKYW4N
Cg==

