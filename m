Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9CA9156B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 09:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956991.1350212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JpW-0007Xs-EY; Thu, 17 Apr 2025 07:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956991.1350212; Thu, 17 Apr 2025 07:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JpW-0007VE-BY; Thu, 17 Apr 2025 07:38:38 +0000
Received: by outflank-mailman (input) for mailman id 956991;
 Thu, 17 Apr 2025 07:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eJKL=XD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u5JpU-0007US-HE
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 07:38:36 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2418::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f598cade-1b5e-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 09:38:34 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS7PR12MB9042.namprd12.prod.outlook.com (2603:10b6:8:ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 07:38:27 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 07:38:27 +0000
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
X-Inumbo-ID: f598cade-1b5e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F97JF2PE9W34CL8HsQUelMLc6avjoig+THbrg/pHL8roxChxOmdd+GUftTZmFoOkKh/gABQbnhAsxjaiRU9Vn+6txoTfyd1na6xgPstLOnCxUmwLPsqXWrI7je5lTCQbQNjqTQDG08mJzcgwf+P93zGnqtoEHcEC7N82m8tlNf6LS+rCt2fwbM3YalwcF0wReqXLqYs8MCC+XfB6I+jorWD9CQo7KUe9r+vhFdOMmuvo407MVmXcLB72F4LF9sRlSt5cMQDcflmyO0QWOap4GqVhw+Q80DftBK0khEHizMWI+FgmcsCupFTWGxzvpiFWbxMFNzhl5qS3X3WGDprFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJ+74WHcwWC8t3dpXGqTz5XsO7XbITod2Hr1Nz9kifI=;
 b=pYt5St4r0NefohrY6f1RIkHO2t08dBT8cLi1neu0uO0Dce0TapDdiRTNVFyzmtoxEoZlObQfKcRF4/kaqWT6gdmpGT2gKhqr3zjk3awkaP4X5ay9SNhIxAqYX4RTLxKK3Gpi5JM0Lu8YZqZutgk+u790ivnlwwdFDFO5XQoFFJ5pXiJnBixVmyPe+N6+SZK9SrMOMXd7F8QcNkXXkE91RNcOVriKrvTUH1xoNNI5nRJKiEwnRhuVLm6GzX7cYEe0+RZH6x6y3AxAH5vbpn7v9kDv2jOL0NgLQ+6vx9L4GPZBT8O5oDa3815WIBsuj9kFfMl1I026PU3H4N6kyFYw8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJ+74WHcwWC8t3dpXGqTz5XsO7XbITod2Hr1Nz9kifI=;
 b=uGj1xB0d0Gk7+Ww9PnZSMAEypzTGYUcKC/o9W3Mz51zHFddu9ihce8ETuFFo0tXrHymESV8v6A2i/ynhwcKdHdCbt/FwUjpGfZ3V027q64xWKUU/T+GnvHMwXE9n3YiGcz9uMXHz/aoWoUaO2bR9hAdHaSLCqtBDU/lUZXE6m0g=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 8/8] vpci/msix: Add function to clean MSIX resources
Thread-Topic: [PATCH v2 8/8] vpci/msix: Add function to clean MSIX resources
Thread-Index: AQHbqRsh+jmpxStIakeU85xhe5CvZrOng/cAgACHCoA=
Date: Thu, 17 Apr 2025 07:38:27 +0000
Message-ID:
 <BL1PR12MB58497A2B75B2DEF3859A3888E7BC2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-9-Jiqian.Chen@amd.com>
 <bed994d7-50fe-4a82-a0ec-b986e07ca5dd@suse.com>
In-Reply-To: <bed994d7-50fe-4a82-a0ec-b986e07ca5dd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8655.018)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS7PR12MB9042:EE_
x-ms-office365-filtering-correlation-id: 2cd1ff61-9b45-4493-f6f7-08dd7d82d7cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cFpFVDQxZlNxbk1pclFQYTlWUFVhZ2Y0VkRILzZsTWs5V1o3NG5TTWMybXYv?=
 =?utf-8?B?bDZoWWRkVUdYZXdKaXp1TVltQ0dnZFc4U29rWmQ0Vkl4NHAvQzlvZGJ3OXhV?=
 =?utf-8?B?SjNHZG4xalpSemxSUE5ESTFlbkZCUTB6dmN5Nm5vQ050d1RvYVhkMmFFelRO?=
 =?utf-8?B?ZlVXaFpMUUU2dkszblZLTU5uQkNPY0trczIrWDFQMUw2MlFDWitYelV5bG16?=
 =?utf-8?B?UXFWK3V4WmJrMExrME9FOUh5L0VneGlUNFNTZ21qUmp4cUFvQmJtVjN3ZlBN?=
 =?utf-8?B?YTgrWGdCTm12Z3A3RnBCenV4QmxvekdJeDhrcnA2cUVNYWgwTS8yMk5xRTJh?=
 =?utf-8?B?NFN5YS9Xc01lQll1NDZETGQ1QVB4SUtRZjBzYTBSRDFPc2lhRVJiZHNPbXZK?=
 =?utf-8?B?TExEOU1HSEJieVI5YjhiL0hYSEZtcUtQdzM0dDVrTjdTcWR0UjgveWJSZktS?=
 =?utf-8?B?ODRGODliM09YY25pTVVjQWJiTFdPRDNHdmplaFRkUklqM3M5dkRtQVZXd25X?=
 =?utf-8?B?MlV5UElzVWM5MURRd3V1bVpzTERsRnY2UkJTM2pGL2xVRE5OZzErWm9oRWdk?=
 =?utf-8?B?cUZHMWFiSG1DbUdmczFFSTdKdTkwZWVMZkY0NTloZmptODY2ZHRxb2h5dEFU?=
 =?utf-8?B?bjJiaXJBNERncVdkSUVjZXR1UExjTGF2U2tPekM5ckFhb0NicUFnYnNGV3pv?=
 =?utf-8?B?NzcvWFpQUk1Jd2hDWUd5Qm1WTHhQWkcwa3BvSUs5eWF1b3dOOHFpRFFRUDhw?=
 =?utf-8?B?b0s0OCtIYU5mNGNqN1lqQnB1QXRocmM1NUE0RDlPRUtFcW9TSDN3TWw0Z3J2?=
 =?utf-8?B?MFByU2V4OTNIRExaZVJqMGQrc2pKbERvRFZaQmFnTmtEREYvMUlPZHI0UzJW?=
 =?utf-8?B?TkVYbGU1Qi85YmZEMkdYMDlxYk55L2tUemxod05sTjkyOXJaRHE4Q0dHTU8x?=
 =?utf-8?B?T2hqTWpLSXcwWWlOVFdlemZYSC9xOWQyOEhFMG8zVUhUbDQzTUE5N1JhS0tT?=
 =?utf-8?B?bDZXSEd0aU9ZZ2oreG9JcHpycW5VUzZMMy9KdnBaNDQvYnN5U0xTUHF2WDdP?=
 =?utf-8?B?N0FWY1d6SjNZRjdIcFBoaWp1dDVxcDk3SE9vNlVXemloOXM2MDBhTTIyeDho?=
 =?utf-8?B?K3ZLUno0czNwdmM3VklPVStBbithdTdOaTRXQ2pOTDk5OFlzVWtLQW9qb09K?=
 =?utf-8?B?UmEza294TjJBN09VaWRmQTJEc016VmJOV005UGF2WVFqUkdIRU5aVlJBQktl?=
 =?utf-8?B?cFVIUHpnbnpNeFJyT2hTQ1VZVE1Ca2dZSGhnL0ZFQVY1bS9WQXBWczBVV2NP?=
 =?utf-8?B?TzZ4NDQ5M011TmhZdTdVdGUrSStFT1ZyeTZSNjRZdll2Z3JPKzV2T21Sb1NL?=
 =?utf-8?B?enVTb0t5SURTd3VqV3piT2w0dit4b0FQWTZnMzVRL3VCblVicjJwR2NLZUNL?=
 =?utf-8?B?dUJYTE9HSW9DVUJRVnl5VXhqTDQwUUJ2cjgybUN3bmF1THg4V2JEQkwzQ3di?=
 =?utf-8?B?cVJGM3R0WmppVVYvbm12WVhHSUt1Z3M1cERJWEQyYmlvMDl2emdhOHltb1U5?=
 =?utf-8?B?dGNGdER3cnJqbWFMUU55UjAxNEU3dGRkT1hHeHpSNXY4OHM2U1RXUUY0a0xq?=
 =?utf-8?B?aXMrSlFZV0xudmV0eUYrNlovemhKa3hFWmZ6akY3cXk1NW4zeTJJS1JqckVQ?=
 =?utf-8?B?ZGRyM0VhMFEzeWNqVk0yNHFuRS9oR2Q5aG5GL2RuOEM3NHpQSlUySXFDUkV6?=
 =?utf-8?B?ZjV4N1hRSjVlaTdQNkQxeTJpYlluVXExRVF1dU4rZ1EzYjVzUmNQcmNZZThh?=
 =?utf-8?B?Q0d0NGNPejVxbHJFYmFIajVMTVU2YmFFWUZqRkYyelRndkhaUGgzNVhLcGtF?=
 =?utf-8?B?TWtXVndyQnd2ZjdzaHR5Yit5NkxmZXNaNGJ3NWFERjFsRUhrWWtoWUx4VWhH?=
 =?utf-8?B?ZWVlWmVEOEtWWmx5eHhwMlNreVAvT01XNkFUb1hDV2dyWUIzcDhwd2xoY25z?=
 =?utf-8?Q?Pq9+QiJxg2DGGVto2TEMXe71uyuq4c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTZORTFLLzdFV2pMQUVyWjhnNkl0eDQzcW4vMFMvc2NES2RGV0JQRlovS0V6?=
 =?utf-8?B?c2t5MnFFNG16RTJocTNMUFZBWFE4cG8zSVE0TVZxKzgxZFpKN2VQazRMY2hs?=
 =?utf-8?B?YVdjYkZEdTVKWXdJYWFaSS9BWTlBNnVoV2d6VFFvbjNpbzVuNmE3cXAyZjVO?=
 =?utf-8?B?dlNpYllaSWhWR1VHaDFSbTUvUVg2SXBwd0xhbmc2ZGtiQzJxT29XYmNpY3pT?=
 =?utf-8?B?dUI4aS9IK2o1em1DU3pkU0pwS2I0T3Jzb3dWTXMvcVVNbGJOeXFqSEJJbnJF?=
 =?utf-8?B?MEczNm5GZHhYczhSZ2ZiMXpLMXZRTmV1aHI1MUQvbnhscXRadHorc0sxbk42?=
 =?utf-8?B?UWNmMnVMYWZvdXpsYjNwbmFZMkFqcDBPYk9TbjdaeGl5SVBoWlU2QW8xZTBx?=
 =?utf-8?B?WTRxK2tvR2k5WGFzTEVna2xiajJ1UURlVXlHYUNuYnlnVzFidmRBd2Fpc2xn?=
 =?utf-8?B?ZXJYYnNxdTdGMkR5ZEgvaEVrWTJuT1VDT28rWFBoSWJwOUNSUUFoMkt5Titw?=
 =?utf-8?B?OGhsd3AwK0VET1UxRXB4ajBVWGJRWGNDQyt4Q0dwTjNjM1Z0SHZ2VVp6MkVj?=
 =?utf-8?B?WERLZ3VvMGxsUmZHWVJEeWY3YjNwZGcvaU9OM0oyWjVEMXh3aGNXai9aMS9t?=
 =?utf-8?B?NEFiTG44RjBqQzN6aURPSGg3bVlsSlNCREV5SXdlNkY5UjR0QTZQZ1FzazUr?=
 =?utf-8?B?QmRCZUpyREpDakdjQXpweFFsZGVpUUtvVVhNbjlzMGdYY1oybVVOMElySitm?=
 =?utf-8?B?OGtrSXpxK3kveWl0dnJhUFpseGZWTS9Za1lmb3ZDNzdqenBOdUEzZkt0RThz?=
 =?utf-8?B?VlFJdnVoOEIzMThGWXVRQTZXSHlwWlJIZ1Z5d3ZEZnBackpMWkQ5UUw2cEN3?=
 =?utf-8?B?TklOYndaUXAzc1hlbW1BMXRzYVljZHVSVUVZOWUxNVhTWlhOUjBiV2czL0pa?=
 =?utf-8?B?SUtSQzJKbEh6Vk1zRllyMEZuNkFMdFJMbW40UzNPMUt6VWpHRzAzK1JjUE1G?=
 =?utf-8?B?bFM5dUN4eHhwZFkydCt5MlhibmxMQ1Q5T0NxQng3RnlBZ1Z1WXN4NU96cmhQ?=
 =?utf-8?B?OU11WEdlRUFWamtPdlAvbHZwSG84YVFFQXJzT0kxYUVQOXJmSE1tVnUvVURD?=
 =?utf-8?B?OW9zckxmT25kOFo1USttRmRZR3FYcGlpSXI5TGdycDJPTDNJSXdLaWJsRTFG?=
 =?utf-8?B?TnlLaTJUeHRkamh3WXozZVNuN0pnUmgwWlM4QWlHNUpOakkydEI0OTczc09O?=
 =?utf-8?B?cEovV3crVnFVUWhEOWx0MjVqVXVHd1hMTnlHdVBYTzJCdnZzckhvNXhibVhM?=
 =?utf-8?B?NmplRlBFdXZrS1NpRGovMHNja3VtNHRlQ2pKS3FpcFlmTU5wSldIZjFqa0Rt?=
 =?utf-8?B?eEVxK2lnbFhJd3kyRExzSWV5NFMvVDFmbVpzdGhzbHVQVGdweVJMUHpVVG55?=
 =?utf-8?B?cTM2TUMrMVpZRFZVdlpWMXNHNXpmREdZNWtCcXZIMDBJMm5CekJET0FhbVZI?=
 =?utf-8?B?UDZTdHlMcUlTVjZsT1ZuQzBWRkVtbjBLc2V0aDNBMzZkYlF4UjNldjJvMURP?=
 =?utf-8?B?MHZWNW1kWE44WC9zNUgvaFpFZXVZQWNHNDVhYXptZDVlV0VKM1dHOCtCTzg4?=
 =?utf-8?B?L3JkOEQwMG93RWFJUGlrVEZDQis2TEF2WFFwUGRoanBRbU93KytXQWx4WDdJ?=
 =?utf-8?B?YmR3eG1IclFLWHRvSm8zZ3VncXp1SGRMNEhuWmRIdWlqclMzQnZnbzk4d2NV?=
 =?utf-8?B?SzNYd0kxYk5hK2pvYkRoeXJKQko2WHR2V0tDNDBMb1JxWWVKbzZPQVlrNjZI?=
 =?utf-8?B?eTJmNjhsWktCcm9SekF2Z25TRTI4WjgwN2NJVFVsK0QyY0pxN3o2WTMzSklF?=
 =?utf-8?B?ZlV0UkkvUTBxTkd4QVNGdk1WaFRaSHdnamxTVUh6VldySkFYUytJU2RnTE5s?=
 =?utf-8?B?Vm1hZERxeU5SemMrby80OVg0dG9McERkR2hoTkdSS2RkT2RkejRUM2JFZk5w?=
 =?utf-8?B?c2dBRmxXSnVGTWROanVwRjRIc2NYdDdSV0Q1U2VET01SQnNWMUpIQk9XN0pS?=
 =?utf-8?B?TGxEazBzdUJ5Wi9lQUVEV1Vsc29uZUVHOUl6eWtPUklBRUJvZ1hUSkVrL3hu?=
 =?utf-8?Q?YQ0M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1321EB9EC3E2F74AB3D5ABA8B54B029D@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd1ff61-9b45-4493-f6f7-08dd7d82d7cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 07:38:27.5871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ph1Xb+WJS+1488YNsAnoT1+hSzlWzeXe6y25B8Xe+wR0QRp2m53TKp8pIEcSkK9N3LYv0Ch6Lg3d3F5Oiqagdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9042

T24gMjAyNS80LzE3IDE1OjM0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDQuMjAyNSAw
ODo0NSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2ludGVy
Y2VwdC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2ludGVyY2VwdC5jDQo+PiBAQCAtMjc2
LDYgKzI3Niw1MCBAQCB2b2lkIHJlZ2lzdGVyX21taW9faGFuZGxlcihzdHJ1Y3QgZG9tYWluICpk
LA0KPj4gICAgICBoYW5kbGVyLT5tbWlvLm9wcyA9IG9wczsNCj4+ICB9DQo+PiAgDQo+PiArdm9p
ZCB1bnJlZ2lzdGVyX21taW9faGFuZGxlcihzdHJ1Y3QgZG9tYWluICpkLA0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGh2bV9tbWlvX29wcyAqb3BzKQ0KPj4g
K3sNCj4+ICsgICAgdW5zaWduZWQgaW50IGksIGNvdW50ID0gZC0+YXJjaC5odm0uaW9faGFuZGxl
cl9jb3VudDsNCj4+ICsNCj4+ICsgICAgQVNTRVJUKGQtPmFyY2guaHZtLmlvX2hhbmRsZXIpOw0K
Pj4gKw0KPj4gKyAgICBpZiAoICFjb3VudCApDQo+PiArICAgICAgICByZXR1cm47DQo+PiArDQo+
PiArICAgIGZvciAoIGkgPSAwOyBpIDwgY291bnQ7IGkrKyApDQo+PiArICAgICAgICBpZiAoIGQt
PmFyY2guaHZtLmlvX2hhbmRsZXJbaV0udHlwZSA9PSBJT1JFUV9UWVBFX0NPUFkgJiYNCj4+ICsg
ICAgICAgICAgICAgZC0+YXJjaC5odm0uaW9faGFuZGxlcltpXS5tbWlvLm9wcyA9PSBvcHMgKQ0K
Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAgICBpZiAoIGkgPT0gY291bnQgKQ0K
Pj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKw0KPj4gKyAgICBmb3IgKCA7IGkgPCBjb3VudCAtIDE7
IGkrKyApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHN0cnVjdCBodm1faW9faGFuZGxlciAqY3Vy
ciA9ICZkLT5hcmNoLmh2bS5pb19oYW5kbGVyW2ldOw0KPj4gKyAgICAgICAgc3RydWN0IGh2bV9p
b19oYW5kbGVyICpuZXh0ID0gJmQtPmFyY2guaHZtLmlvX2hhbmRsZXJbaSArIDFdOw0KPj4gKw0K
Pj4gKyAgICAgICAgY3Vyci0+dHlwZSA9IG5leHQtPnR5cGU7DQo+PiArICAgICAgICBjdXJyLT5v
cHMgPSBuZXh0LT5vcHM7DQo+PiArICAgICAgICBpZiAoIG5leHQtPnR5cGUgPT0gSU9SRVFfVFlQ
RV9DT1BZICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBjdXJyLT5wb3J0aW8ucG9y
dCA9IDA7DQo+PiArICAgICAgICAgICAgY3Vyci0+cG9ydGlvLnNpemUgPSAwOw0KPj4gKyAgICAg
ICAgICAgIGN1cnItPnBvcnRpby5hY3Rpb24gPSAwOw0KPj4gKyAgICAgICAgICAgIGN1cnItPm1t
aW8ub3BzID0gbmV4dC0+bW1pby5vcHM7DQo+PiArICAgICAgICB9DQo+PiArICAgICAgICBlbHNl
DQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgY3Vyci0+bW1pby5vcHMgPSAwOw0KPj4g
KyAgICAgICAgICAgIGN1cnItPnBvcnRpby5wb3J0ID0gbmV4dC0+cG9ydGlvLnBvcnQ7DQo+PiAr
ICAgICAgICAgICAgY3Vyci0+cG9ydGlvLnNpemUgPSBuZXh0LT5wb3J0aW8uc2l6ZTsNCj4+ICsg
ICAgICAgICAgICBjdXJyLT5wb3J0aW8uYWN0aW9uID0gbmV4dC0+cG9ydGlvLmFjdGlvbjsNCj4+
ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBkLT5hcmNoLmh2bS5pb19oYW5k
bGVyX2NvdW50LS07DQo+PiArfQ0KPiANCj4gVG8gYWRkIG9uIHdoYXQgUm9nZXIgc2FpZDogVGhp
cyBpcyBpbmhlcmVudGx5IG5vbi1hdG9taWMsIHNvIHRoZSBkb21haW4NCj4gd291bGQgbmVlZCBw
YXVzaW5nIHRvIGRvIHN1Y2ggcmVtb3ZhbCBpbiBhIHJhY2UtZnJlZSB3YXkuIEhlbmNlIHdoeSB3
ZQ0KPiBkZWxpYmVyYXRlbHkgZGlkbid0IGhhdmUgc3VjaCBhIGZ1bmN0aW9uIHNvIGZhciwgYWl1
aS4gKFRoZSByZW1vdmFsIG1heQ0KPiBiZSBzYWZlIGluIHRoZSBzcGVjaWZpYyBjYXNlIHlvdSB1
c2UgaXQgaGVsb3csIGJ1dCB0aGVyZSdzIG5vdGhpbmcgaGVyZQ0KPiBwcmV2ZW50aW5nIGl0IGZy
b20gYmVpbmcgdXNlZCBlbHNld2hlcmUsIHdpdGhvdXQgcGF5aW5nIGF0dGVudGlvbiB0bw0KPiB0
aGUgcmFjaW5lc3MuKQ0KTWFrZSBzZW5zZSwgdGhhbmtzIGZvciB5b3VyIGRldGFpbGVkIGlucHV0
cy4NCkkgd2lsbCBkZWxldGUgdGhpcyBwYXJ0IGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gSmFu
DQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

