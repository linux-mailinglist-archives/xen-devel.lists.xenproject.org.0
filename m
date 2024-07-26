Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F5593CE5E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 08:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765276.1175867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXErh-0000qj-4H; Fri, 26 Jul 2024 06:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765276.1175867; Fri, 26 Jul 2024 06:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXErh-0000nJ-1E; Fri, 26 Jul 2024 06:55:45 +0000
Received: by outflank-mailman (input) for mailman id 765276;
 Fri, 26 Jul 2024 06:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CH3=O2=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sXErf-0000n9-Mx
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 06:55:43 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2414::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 128f8b99-4b1c-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 08:55:42 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB8281.namprd12.prod.outlook.com (2603:10b6:610:128::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 06:55:39 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 06:55:38 +0000
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
X-Inumbo-ID: 128f8b99-4b1c-11ef-bbff-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mx0IeizKAABzbTN1paQ08nRuYhbcj1KAUiR5hD8Nkd9NB2XzesWWSSYO9+arJ69XYOhYyKDouK4HoI4DLjkTDaH/8LbmoF+Zv9RrcITIErvtMx8P2j7UpOl8yvxV6tOYWgvAp1gLiqeoEKODgkDM9vM1Wlk+M/DACU3LKdi2G1akSpGa2/T8XDZEQ9vhRTg1MlGQIvlD3nsp4536ZqO5dy2A/7wVVmcLUl5+4JFCSUsfSLWqpoDiunhzlV2jVtk9igfmLBuD7qAtC2CMTxZ7iiTwLxUKpQKPCl9+pGVjSS4CE3kPCd79Kb1Tf59VpY4Ebr7Q9iYaU6x0x7K+OQtOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3okgs+vnu5UpMrw79mfnD0nXqMC6u1i1DU6eXaeei8=;
 b=vPshsjBhRWenLe00zOvN46tOxV7Alq/fSneirTN26okkaI/xFirJJXPpOG8HD54q934fyX5Py8lwK0f4mxhv/xI9Lu3GoWlmqMKzBHq/sJa/Bh21MWYhkBkGoxQduumzlkuuMd6FMPMXF0NQuefvdj101TO/Z+yxcAMZWVv8fFtaJU1C/mwDvhMuuDn5qi1SczVJQiUSBVALb74HduI2Dv5FJEpGvIFRLRt44NjznBOsYsSi99Mvr6hD4SE/3b7hIsa3ItO1X97RDFb0xnB7A+BXpLlJpNQWMErEzqONfR+J62Z0Kuii+VnGsscWEo8jNjVlaAMmQIYQUbkfhKi7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3okgs+vnu5UpMrw79mfnD0nXqMC6u1i1DU6eXaeei8=;
 b=yFKgav9bZqwxWqznjaTP6z2rVkSWAzDwjjuaO8zEZb9xINU8IMJTjdSTIkwHOse/d2I+MPqP9tLVhD3ICkVsCnS1eg/rkZ4/iUqgBd8ffV5Bi6iJyAinhuPWPgyYWP3q4/IVNSGjXxojylqYSn1GUkLJdBE7tFVRsihfaWUBcps=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Daniel P . Smith" <dpsmith@apertussolutions.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Thread-Topic: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Thread-Index: AQHa0SvYL4tONjoIyEuzfSK6fk2TK7HuX7kAgBrVMQA=
Date: Fri, 26 Jul 2024 06:55:38 +0000
Message-ID:
 <BL1PR12MB58495A106E02C8225C23405DE7B42@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com>
 <e350fbb3-edfb-407d-aa69-ae995889b262@suse.com>
In-Reply-To: <e350fbb3-edfb-407d-aa69-ae995889b262@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7784.020)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB8281:EE_
x-ms-office365-filtering-correlation-id: 68c23a91-1c4b-458a-f02b-08dcad3ff532
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QUVJRWMwak5vbjdwR0p1d2p0bXQ1RTdFNGl0a2hveHl1Yk5pS1FoRXUzRVJN?=
 =?utf-8?B?L2xkRDhiSlRIWlVidXFwMmp0NzZMcE9KVlBYV21HTTIxRWsrbXJJYkc2ZU85?=
 =?utf-8?B?dWQ5Z2gzLy9DeGZWZjFXZjlHaXNVWWc0VVAzWmI0bFR5aGN0NWlVcTV5dU1B?=
 =?utf-8?B?QmhlYm5USS9hbzBVd0hkaHpPcEhuOGNWYzFjd2I2WmpLM0ptWFo0cSthN1lt?=
 =?utf-8?B?VEJvM1pQb1lPUU9zV3dBT1FKRnRibHE5T0JEbTNSdExNMlVHeEI4WkdxTXpX?=
 =?utf-8?B?TmRJVXg1bGt2S2tyRkdIOVo1M2xJYVdqUko0dVI4UFZlWGNkMHJ0VUtMeit1?=
 =?utf-8?B?cGVUcVllMGwzanNVd01oQmxYajVwZVppTCttSS8zcnBqTWpWNFNCd0lUT2VY?=
 =?utf-8?B?QkJ0aGlqY3I1TDZtS2kyNGdJQmdwdWhTU2ErV2pIN0llTFRaYXlLSTlwcVVv?=
 =?utf-8?B?ck9BV0dDQXN4OE8wOC9UYVBOVzJuN1dzZ1NBa3ZQd04yWTZkOTlwbEZldjlp?=
 =?utf-8?B?Rk9qQm9LQ3pJWU1aTVM3YlNNMjlVQnVZMzlVZ3c1NGhiSFhaY0tBU21nTDdh?=
 =?utf-8?B?c2Ftd2VmSktBYTFFN2pxWjV6SXVzL1MzUHF5UGZWRzZmNkJhQSt2MzV6eUVS?=
 =?utf-8?B?amdIUENSaWdCUmJwL3BTL21RK3IvNTVaZ0tDbnNPT0o4MWRxSXVHbmRWS3cw?=
 =?utf-8?B?MFdNWWVURGJRcTNCMzRPR2p5WSsySTRvemtzTittR2p2OEsyU1gyREZrT015?=
 =?utf-8?B?T3ZPNmxXMHVSTWFXYmY4eTBVL0tDUnlyUCtLUG5rWGQ4UE0wVUxEa3o0K241?=
 =?utf-8?B?a3lDMVpWbGV6ODYxUVIwMC9PMU01cFNlU0Nvcmw3c2U2Ym0yemlkLzBoTWxC?=
 =?utf-8?B?Uy9TSmJka3JGTEpRa2dOc2Foc29JbHBFb05kUDJkeWdqRmcreitpZ3JUNmdE?=
 =?utf-8?B?QjdWMTNHQU1qeHNYbDl1Rkt5VlpJODN0L0RVMW94VnNlYzZRbzJ0aXhnTkQ3?=
 =?utf-8?B?aTF2QWpxN1FxZFRaNXhreUZKd1lneE1lRjJaQkc1dUs0YVhGU0V3WElKbytz?=
 =?utf-8?B?WnZPeFRiYUg3Mis3K2p3Y1ppZk1LOUcra09saGorMVpnb1pmRG5mY3pyL0xy?=
 =?utf-8?B?SUpnNjU3eXNwOVdlM2liZFNVdktmclVqNlBOTTBYbnpqVUlUVmtTNXJFMEFy?=
 =?utf-8?B?ZUkvOXpUSERQekQ5ZVlZdThEVTRRZmdQODdTSUlHRUZTUG9OZ0RwOHZMYm1l?=
 =?utf-8?B?OEFiUTZ4dC9VbTFwblJwNG5VTHJaMVJwYW1MZGUwZERVS1llUkYxQThkUVZx?=
 =?utf-8?B?Q2gyL0F5RlBhNktFdmN5V1pPTmlTWEdQSW1GanRhOUlTVDBsN1VlenFzbEFZ?=
 =?utf-8?B?NHJ4U2RyVHBtQmJSL0NCUWIrRUhqVEpjcWRRS09XcDl4dURTNG9DTFlIZXdj?=
 =?utf-8?B?Uk5JTDQ5Q1d0OTVZWUttMHM4S1U2QUFuOGEzUldtSXNvT2crYlJpZGFPaGhR?=
 =?utf-8?B?amJKMXJHOWhLZ3ZyaUlpVytiRjN5TVlrcTUrRGRkUEIxeVBESlRaekI3T0VD?=
 =?utf-8?B?ckVqTDhDeW01YnpQdEpqY0Z6YUR0cWV6ZGxTSk12VHBxSTgwbGxBcXVOUFNB?=
 =?utf-8?B?TThJdS9yUGlTRUU5djFWU29IWXNKc2Npdm9IVFFTNGF5THFiUzdIdGxLNVJn?=
 =?utf-8?B?OFd1MDZxNldzL09VaEtDZ1Q4Rk5WU3IydnAvRDdDS29VZ0lXWWsvNExKN0l0?=
 =?utf-8?B?REM2Z2dvcy8vMjluTFZYWkJDTkkrcEVaRm1Vc0MyMFZQTjFIUnlmVDcvQ21t?=
 =?utf-8?B?VzFBb05SeHR0bjJRZmQrVUp2V2tVUTJTZWZHbWxNNGF0dEp2cEZMNHdTdjNE?=
 =?utf-8?B?V2Jlb3FvMnRWdzQyZmNMVzFmam1ndkwvd3IrS1lya1Y1cUE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXZ4dTNXdFhFRXpZTjZWRHJRTEViYi9HSnA4K1hROU5xbWhXVCt0a3NDdEps?=
 =?utf-8?B?cGJVV0drdFhYY1hja0NLb2diNzBZMlhwWFhKb3A1Rm9FYnN6aERkeUliZ2Ni?=
 =?utf-8?B?ODNSTFZiRktMNk9xVTMweDR2SXFEdy9jRlF1VTl6Z2tLMXVmVzNuM1BhQnhF?=
 =?utf-8?B?NHRrdDJzMllhRTBFTTVWaEZFa1YxZjBPTlorSTZyZ1ZwTWVsTWR1bmdBK3ZJ?=
 =?utf-8?B?eVhMaDk0VnJKekUrMDZjVFdSN3NjM3ZhcmxMUkQzKzRyWkNvN1lGMkc5ZGM4?=
 =?utf-8?B?dW5aQ0NHOW9qLzJTalZvYWR6OXZxN2UvWjErSUZYNGNlYjlZM2pSTHZQdDRU?=
 =?utf-8?B?VStOUUk4SUMvVkZRUzBNY1BNSmh3UnlGTHFjYUtEbkVHU1JvUWJFR2pnZk9F?=
 =?utf-8?B?WC9xakdHYnk0cWI4QkdQcGNLbGdXZzZyV3AwREhqTlZIWnZzVkwvb3BXRVJv?=
 =?utf-8?B?MVI4NDVDbE42OUdURjBkcTdyYUJoOXQzS3c4Y0lZWXYxMkxEcnlxL2prMXJh?=
 =?utf-8?B?cEpSVFJiTjlBbHlPKzRSM25hRTBJTU93eVVXbHBwdU4zc2lUckI2TVlaYUZy?=
 =?utf-8?B?RVBKaHVkVm5VWjNFYUtIT3k1a2htTE02YzNMcWtCN3g0ZWZHRkJ5RklrSmg0?=
 =?utf-8?B?MG5uWmdDMS93Z3dLdzNWVEZRaExEM1JKbWNiY240M2cwclo1UjRnakg2THY0?=
 =?utf-8?B?SHhRdE93aStjZUZMZTZFUHFaTE44Zlo2bStYamdVckpGa3c4bGtsNGtCVWtH?=
 =?utf-8?B?RUYrODMrVTJWdVlyQ2lCVktacFcvem82SkUvMGEzbVJuY1Y3aERZdHdsTjhi?=
 =?utf-8?B?RHh6WUxnSGVjRmN2M1NvWlpUeis0MmdlQWVjenZqUHBLTGRxdEdzOWpsMW1a?=
 =?utf-8?B?YjMxQkhNbnFhd1diTHZXQzdSSEdWUWpROXBjOTMxUnFpRVZ3TlhlWkdXT3pl?=
 =?utf-8?B?dzFvQUx6eTZLVVU5ZWJFWElJWW9pZVpHRkx3VWdSNUlkSnFnTTZsL1llZnBy?=
 =?utf-8?B?QWdEa2x2Wk9DWGhXRlowNDhFd1F6M2I2RUFVQm5NL24wY1RJelZraEFUdHBF?=
 =?utf-8?B?bDlUNWhVcFlpMHdRNFBDK2hyZWNoZkR0Vm5nY3V4aHhpK2tCdTdudDdBbHNv?=
 =?utf-8?B?R3ZJOGd5SE1FdVpyN0hDOFg2aCtYejVrRTF6dTVQZWoyaGZmU1JWTStFZ1Bs?=
 =?utf-8?B?c29uQWViR2ZNTkNCU3liWlJVYjBzc0JhUldYWmpVV2oyZXg5Q2kzSG9uVlZN?=
 =?utf-8?B?QUw4d09ZNzg4ZE51ay9NOU5ZaWFsUUhLbytZQWdZQzdIamZYM1QzSUdzSlhl?=
 =?utf-8?B?blZyVkZobjlmeHZSUUNmQ2pXaVR4bHl6bFBoSWVYQVJZclVLSW5VT3FOekg0?=
 =?utf-8?B?MG9kd0pkdHhhZzdmSUk1cS9LenhEM3pzSGt2NUxxWWcxMTJ0NCs3TFJLa3Mw?=
 =?utf-8?B?QUUybGlCRGt1ZGowT28vTC8vRng5aE9KditoSGZsZ25Cek1zWlFMM3Vxakhy?=
 =?utf-8?B?bzBuOGEwaUplbGdMUnoydEJpZVZQWWdOdVpCdmUwRWxmWitXQ0VwZUNENE5p?=
 =?utf-8?B?ZE11d3lQZW1uY2hRQW5mL0JwWUhVa1h4SDk3VmJhbEp1SHJaREFOdVFiTW1m?=
 =?utf-8?B?MnBWUlp5UGc0RVZFNWxmQ3JPY2tpSVZuSXhZaTVMZnYvQkJkMEw4YW12Kzlw?=
 =?utf-8?B?b1ZCa3RuZ0x0cEtVZEtGSlQ0MjF3RFJmTU1vOXNrSUpiQ0czaHJwM2JIL0pj?=
 =?utf-8?B?d08zV2FqaGNQK2xCNk55WVVFaUtlbEJYRHV0dDJjWG5UWmY5M2JmRFIzbGtp?=
 =?utf-8?B?eTk0R3hLVnpMVVRRWWhOd0w3UDloNUNQYmlTdTRzQmVaVjdmWXRxTWhSUHZL?=
 =?utf-8?B?d3JLcHpoM0hLYTNOUEg0aFE2RnZxSFRJTEVGcnhISFhWZVByS2M5SmJsMTFt?=
 =?utf-8?B?ZnFRR1BjdjNkNFBXOEV6V2xFc0RRdncrZmpIWXJhelV2M0QvQ3NsVjV4ZUVv?=
 =?utf-8?B?cHhlT24yOG8zUFVRV1VSMlczN1U3c2ZoL3R3YkZvQWlzUHAwMWtNcjkzQU5N?=
 =?utf-8?B?dDVzWW8vSURyeFRETnpWK0kvc29JK2tlcTViRTBHWEs5MHNnSWh5NC9lS29H?=
 =?utf-8?Q?iP1k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48BEAA5DFC0F1E4BAD833DED15E31C57@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c23a91-1c4b-458a-f02b-08dcad3ff532
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2024 06:55:38.7565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ipzCvDZ1eUwezliO4VYUdY00SGO4Cj1/CoWEhSs3J5lCXGF4W7nxTCZF3JBKVi4TQCtInaWbwJnHVdnU0NR7CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8281

SGkgRGFuaWVsLA0KDQpPbiAyMDI0LzcvOSAyMTowOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9u
IDA4LjA3LjIwMjQgMTM6NDEsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gU29tZSB0eXBlIG9mIGRv
bWFpbnMgZG9uJ3QgaGF2ZSBQSVJRcywgbGlrZSBQVkgsIGl0IGRvZXNuJ3QgZG8NCj4+IFBIWVNE
RVZPUF9tYXBfcGlycSBmb3IgZWFjaCBnc2kuIFdoZW4gcGFzc3Rocm91Z2ggYSBkZXZpY2UNCj4+
IHRvIGd1ZXN0IGJhc2Ugb24gUFZIIGRvbTAsIGNhbGxzdGFjaw0KPj4gcGNpX2FkZF9kbV9kb25l
LT5YRU5fRE9NQ1RMX2lycV9wZXJtaXNzaW9uIHdpbGwgZmFpbCBhdCBmdW5jdGlvbg0KPj4gZG9t
YWluX3BpcnFfdG9faXJxLCBiZWNhdXNlIFBWSCBoYXMgbm8gbWFwcGluZyBvZiBnc2ksIHBpcnEg
YW5kDQo+PiBpcnEgb24gWGVuIHNpZGUuDQo+PiBXaGF0J3MgbW9yZSwgY3VycmVudCBoeXBlcmNh
bGwgWEVOX0RPTUNUTF9pcnFfcGVybWlzc2lvbiByZXF1aXJlcw0KPj4gcGFzc2luZyBpbiBwaXJx
IHRvIHNldCB0aGUgYWNjZXNzIG9mIGlycSwgaXQgaXMgbm90IHN1aXRhYmxlIGZvcg0KPj4gZG9t
MCB0aGF0IGRvZXNuJ3QgaGF2ZSBQSVJRcy4NCj4+DQo+PiBTbywgYWRkIGEgbmV3IGh5cGVyY2Fs
bCBYRU5fRE9NQ1RMX2dzaV9wZXJtaXNzaW9uIHRvIGdyYW50L2RlbnkNCj4+IHRoZSBwZXJtaXNz
aW9uIG9mIGlycSh0cmFuc2xhdGUgZnJvbSB4ODYgZ3NpKSB0byBkdW1VIHdoZW4gZG9tMA0KPj4g
aGFzIG5vIFBJUlFzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4u
Q2hlbkBhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1k
LmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29t
Pg0KPj4gLS0tDQo+PiBDQzogRGFuaWVsIFAgLiBTbWl0aCA8ZHBzbWl0aEBhcGVydHVzc29sdXRp
b25zLmNvbT4NCj4+IFJlbWFpbmluZyBjb21tZW50IEBEYW5pZWwgUCAuIFNtaXRoOg0KPj4gKyAg
ICAgICAgcmV0ID0gLUVQRVJNOw0KPj4gKyAgICAgICAgaWYgKCAhaXJxX2FjY2Vzc19wZXJtaXR0
ZWQoY3VycmQsIGlycSkgfHwNCj4+ICsgICAgICAgICAgICAgeHNtX2lycV9wZXJtaXNzaW9uKFhT
TV9IT09LLCBkLCBpcnEsIGFjY2Vzc19mbGFnKSApDQo+PiArICAgICAgICAgICAgZ290byBnc2lf
cGVybWlzc2lvbl9vdXQ7DQo+PiBJcyBpdCBva2F5IHRvIGlzc3VlIHRoZSBYU00gY2hlY2sgdXNp
bmcgdGhlIHRyYW5zbGF0ZWQgdmFsdWUsIA0KPj4gbm90IHRoZSBvbmUgdGhhdCB3YXMgb3JpZ2lu
YWxseSBwYXNzZWQgaW50byB0aGUgaHlwZXJjYWxsPw0KDQpOZWVkIHlvdXIgaW5wdXQuDQoNCj4g
DQo+IEFzIGxvbmcgYXMgdGhlIGFuc3dlciB0byB0aGlzIGlzIGdvaW5nIHRvIGJlICJZZXMiOg0K
PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCj4gRGFu
aWVsLCBhd2FpdGluZyB5b3VyIGlucHV0Lg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRz
LA0KSmlxaWFuIENoZW4uDQo=

