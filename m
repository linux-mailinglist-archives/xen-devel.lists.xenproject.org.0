Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF55AE5FEE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023443.1399437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzOA-0003Ck-1Z; Tue, 24 Jun 2025 08:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023443.1399437; Tue, 24 Jun 2025 08:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzO9-0003BJ-Tq; Tue, 24 Jun 2025 08:52:21 +0000
Received: by outflank-mailman (input) for mailman id 1023443;
 Tue, 24 Jun 2025 08:52:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vj6t=ZH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uTzO8-0003BD-AF
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:52:20 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20620.outbound.protection.outlook.com
 [2a01:111:f403:200a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87ab8023-50d8-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 10:52:18 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB7185.namprd12.prod.outlook.com (2603:10b6:510:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 08:52:13 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Tue, 24 Jun 2025
 08:52:13 +0000
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
X-Inumbo-ID: 87ab8023-50d8-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nauSEY333JvqL4pO1Kg6Ee5k6dyLIEOKjTWHOczITyDeWDXM6dMA+sxchmEvCCLB2JQTJG7PeT5xx3Gmv5oc8bspiIcpMz+uLUJggK52e9T4xNMBqFnXfA7Z2z64IuXvkTXOMqDqF6xvJFN/hmoFqGuhCSHK7nsmMnbeiHWjqgSUlB5ahWFqGpJnn68d1bn7d40BenLjdqC3p7wcoveBiPApu8rCryOboc2vCO5V7kynaeP2K8zlGMz6c9lQr/y7QMxCUMZgWVVGt4kTflDIcKLGcJCQ/n8d+HPInJGg315XfQ+TlVchnih1RzSgOvh7GQGHg7bS1Cg7gE+9lDHd6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anh8iK1q/gVgSyi4qKPGIGy6eJIAgvOPHumV1o/VByg=;
 b=qeg+Ixswo+Yi5SELplG96rWQosCfjlbRpZOhi1OPqLsRbX05pwjORrwFoixmLpola5iq/JTWqK5Nv8SjkzXFLO11Js7XJIEOIQ/wsyCJ9+RpbYPrVbj8SlpeS57muM6sx5icI8sCBqOsKnAYQJqUnBdpUdsEWy6ufOmgWpggnTtF4ju51nC/ynMh4qwl7+Ao1AOHz4CHrIhkRZ5UfS3C5+ZQSl19XWXQksk+cFkmuLGetjDNFhqUZZplFW2OZkOep6z01XLVASBIOFszqozEoJCbcMKMl9xzCmVAMndw5nXdLchnxFGPeAsZfc1cAfjSYdIx4xeyXICj6cl/M5e6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anh8iK1q/gVgSyi4qKPGIGy6eJIAgvOPHumV1o/VByg=;
 b=25MSVGbdgns5Yc57myUO+1BX7TUa9vdr/nc014BYVMLjuf5/w8TSvVT+X2LuH8MV3skNHPu6BHjexmnqb5r5lKdo4SQui42aV5td5EB4uKmwbMNpiG40XH7Cwesb0h/YFMrj2ITL5e2+bO6LAKxJZdCAwY3cEs01biT/O66pPmw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHb23yakGdVC9XxvEWnYcnp8zrTt7QJBRKAgAGLVICAARN8gIAG6YaA//98XQCAAIcUAP//fCSAgACGWwD//342AAAQ9MYA
Date: Tue, 24 Jun 2025 08:52:12 +0000
Message-ID:
 <BL1PR12MB584985FF4343A76886D764F3E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <1634c18d-e54e-4105-8b30-6f3085bace22@suse.com>
 <BL1PR12MB5849F7A08629FA6E2555B05FE77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <23293ec5-7466-400c-87a4-1482577b91fa@suse.com>
 <BL1PR12MB5849CE947DEEBB7B7F6C70D3E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <0cf4679d-ee86-4666-adae-63a3f9b9b8f7@suse.com>
 <BL1PR12MB5849672813202821C57EAD5CE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <3eaaa6c8-d696-4eca-913e-6e6fd9e618d3@suse.com>
 <BL1PR12MB58497F436C3E127CB9014BFDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1ea09a95-5f13-4af4-bad1-e7081bf065fc@suse.com>
In-Reply-To: <1ea09a95-5f13-4af4-bad1-e7081bf065fc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB7185:EE_
x-ms-office365-filtering-correlation-id: 2de5b82f-8d6e-4e26-148c-08ddb2fc6998
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K3BrN2lHTTJ4SkR2L01uTkdhQkZMN0tBMVNLeGV0b2R2L29Pdmt1VDZKbGNK?=
 =?utf-8?B?MERBSm1xQm8yNFpqUlBPTVpTNEZ3UVFzWlF5aDNJemRZQUxPTWw5cWpqeXZk?=
 =?utf-8?B?TzRxQjU2TXd6WTNvUVZmK0FuZDVPaXpnVk4wb1lQbU91SERlUnlvTDkvY3pF?=
 =?utf-8?B?N3hUOG1wN1o3WUlYdmE5NEZLSWJWTE9mSTNhd1EwRVdFaGRUZTNVc2N5OUR5?=
 =?utf-8?B?TUxVTXFqaFhzVnd3ZFJpTDF3UHRMMDlMYVp6V21uNlhiK0Q0eWIwZ2h4MG1x?=
 =?utf-8?B?OGNFQkVwSXlicnZxc3hzUWhuekFtbGFPa1NvWWlab0h4UDkxblVFV05WcFJR?=
 =?utf-8?B?OVJEWXZoREJPNmVaeFFlUHE4K2FYS1kwdFAzMU5sM1Rjb2xPSXFSWFc1a0ZX?=
 =?utf-8?B?VHptSGx4VVFNejhvTml3Um9qVlFTcWxyN1BpVmZwaERieXY1TTZIYVhIbDVl?=
 =?utf-8?B?MVBob3BkajM1QUNrQmNaTmhvNVlSSkxHclNHNU0zSEcrMXc4MER2VHVUWXVi?=
 =?utf-8?B?UTlWTDgrVUkzOThFaDFLVDVRd3QzNTM4R1F3TVZZRmJkT1B6WFNMZjI1TDlx?=
 =?utf-8?B?TDljT2Y5T3ZHZG5oTGZGUWFFMTVHSDU3V1haRjN0M3NrNGtmZkF4dDh0cTdp?=
 =?utf-8?B?YVV6V21IbFpGQmhjYnA2OGRXTXpSOWtaTVR0aGRhenUvQlNLRVRvNmg5cVZY?=
 =?utf-8?B?ZW1pbTBRbUErREV1QmxiYUZjWDNhaXdoVkJNdHVjaUw2NnhYZ3cvZlNQZzhV?=
 =?utf-8?B?V1lsUWhvNVBFdXFqZEFDUUdXV1RMTkRCaVN1OFVIZHQ4cUtFNmJhWitXNS9R?=
 =?utf-8?B?UXBlZlVMcjM2V1ZLOVp5b1Z4OVY3T0pCRFl1eWc0L2w0MEpzeWZQTzlUOTVw?=
 =?utf-8?B?dVNHZlRXc05GMXBrZ01HbzIvMVA0VnB1LzBPK1g0d2F0NzVxOUJCZVZ4aFk5?=
 =?utf-8?B?UkhoUDlFMGdkdk1Lajg4R2o5OUtUQnNDOXV3Tm9nd3l1NUlzcWNFaHVZMm50?=
 =?utf-8?B?cmYvay90S3NjYi9XNU9sK2FCZ2lZamZQeHl1Nmdhc1Y0eHNnUjhOem1iWDdH?=
 =?utf-8?B?dS9ERGZjdkFIRkxsb3h6SmxVVnRJeWRpWDBOK29DMkhxS2d3L0F0V283eEhH?=
 =?utf-8?B?STlwZzZTdDVXaUhEU2JMeGFUaHNwZTRVUFlKbCtIcXBtSjlxRHJuNHJRbGFJ?=
 =?utf-8?B?dVlUNzAwUzNSZkllODQ0RHdWS0pENGNZaDNzak9wY0s4MXVTNnlSZ09ianBk?=
 =?utf-8?B?YVl2V2pQdDNqaHFQVHRXUktzcHAzV0xjY2pjSExYNWxZQTc4cE5LSDlCSkFZ?=
 =?utf-8?B?ZzlsSjB3bE5DYUs5UXNBUHd4cklPQ1NnaDVPM2h1azF2VWgya0pMbXVFNjNT?=
 =?utf-8?B?Vmo0QWh0b3BDTHBUR0hERE9XSTFkZ3dRWWhmUHR4c1VOazdJS2xlWm1GYjRL?=
 =?utf-8?B?L0dSNTFxdWpKcUVFVThzUXBlb3lKbGVPMlZlYkhhOHJBMCtPRVpJYWQ2ZjUy?=
 =?utf-8?B?MUN5dlRaSGFoWEtJSjhjMFBiS3RUWUdpUUdkSTY3NnFJR1RDSVNsN1hKRkdm?=
 =?utf-8?B?ZUxGaWJsUGc2YmpiMjhrM2FzZXpIYytrdDJnVzNPK1p2bVYwQWFtYVpHaC9F?=
 =?utf-8?B?d0o3UTVCY2dWMllPbHF1ZE5YZU9RVmFFa2wvQ2VxSkVBcHlJTGpXM3hTTTFG?=
 =?utf-8?B?KzlYaU45QW04V1JFbkFLaWFram1YSVdjVC9mS2E0WFFBQ1htRE9qQWVmU1Z6?=
 =?utf-8?B?QWhRRWZQZHhsZGROMHZsUW16aXVyRzl1VzNQeG9zeWJlcEJaeENCdURzSVd5?=
 =?utf-8?B?Q3ZpMlBrd0V5ZHA5SkJTbEJVTjgxdWROdlp2L1ViaE1KSjVtcWxvNWY2V051?=
 =?utf-8?B?blI0bmFoOUVQT3prd2FsRXlOdUVuZEo1N0VRdG1rYXBLUDdPWnBRL3dLZnEx?=
 =?utf-8?B?OTA4QzhuaG52SkZWQWw3eHlkeldGcWY5SmpaTkFHbUVVLzlQWjVEcDFGTUM1?=
 =?utf-8?Q?YR8GZVZ6nEYhs+wRdgIjzwirVc4sYk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXZHaW1KbS9rNUdZNzB3WW9adVpGdzZnckZlQ1FwbUhtbVMycys1ZXFSOEJ3?=
 =?utf-8?B?YVdMZ2lyY1VFWVN1NmgwT2FEZExBdzNjWlRRVDY4NzNtRndrNnBIajcwbEw5?=
 =?utf-8?B?VU5GWUJoS3p4MEtQWk83dEMxMVBzU04zNnJ6b3FoMXQzMTRlT3NaMFJ5S1Bx?=
 =?utf-8?B?RFJuZzlyWWlCMC9aTmxmdlZPem9hUnRjN0svbk8zQWhHSHdjUERacUYrRmUx?=
 =?utf-8?B?ZWR3TzBDL2NFRFpJejhrMWgwajhTUlFLTURwM1U2T05NVFFHdTFEWHJEOFVD?=
 =?utf-8?B?RHNwQ2VTSFJ3TVFwM3lPdDlKcjJzU2Y5YjdJTHBUOFdlZktkTWRadmw1Tmo0?=
 =?utf-8?B?aldBNjlZdlBrSzhDRzRDbTMrelNndW9zZEZ2UUtpbVJJWEV2YmwyMWpsd0lX?=
 =?utf-8?B?eHdteWQxR0ZhMzNwb3pGWURUcTlNWGJBR2V4VktsMEJtV0lVdlc1RENPb2pG?=
 =?utf-8?B?cXRPaGNTaHNIYXova2tUcFJHT3J3WGMvT2hrc043RmNNQTR6MCtQWHRobTl3?=
 =?utf-8?B?aXcweFNqN2V5U3lBTmVmUDR3M01waDhjSmxyTDZsRld5ZndRc3AyMElrUHBz?=
 =?utf-8?B?U3lwNllxNUVDeGhVQUtYMCs0Rk5sWU4rWmJsaWx5SHJWS1NlN2w5dnF6YWxu?=
 =?utf-8?B?dENRNnN3a3EyWmloSUlPVzA3ODRlV25lTDd6aGpKcGhvNXpvUGZuU3ZzVzYr?=
 =?utf-8?B?ZGFFdTR2alQyMDc0MCtXMjNZczFDOFdFNEhRMk1HR1djVndsdkl1RWkxc2c2?=
 =?utf-8?B?djkxcDc1ZGlZdEdHV3lGMTUzZUxWcVF4bW5NWVU5V0ZNVEY5NnJsdEd5VzJD?=
 =?utf-8?B?OU5UL2FVMEM1TFZoQ0JmWXJuZllYR3M3SWx2TFBsYmxBek43Y2xveE9DMzhQ?=
 =?utf-8?B?WHQ4VkZ4MnNaSzhsYXVXWnU5NVNNMXQ3dVByYmZYazcyQWNWVFBJZlJsU1V0?=
 =?utf-8?B?NmRNZGNhZytqV3RVeDQ0M1Q5d09zQzFKeTRyZmE1SmdiRXZzN1pvdnowbVpX?=
 =?utf-8?B?ZmZYc2hQS09hT2RnQUlrQzMxOWprbXUxbEhsdEVMSW5WOVRwTVhXc0dkMWFC?=
 =?utf-8?B?aldiM2JpNzdFZ1FycytQanhhdWUzUVFaRXJqSUQ5RndudHJGSU83TXZsMFhz?=
 =?utf-8?B?VEdBS1VSeHQ5SmQwTndDTDJJbVVwMzcvOWt2ZGJxKzhBU2tBREQ3YzJkalJZ?=
 =?utf-8?B?NUhWT2xMZXdac3o5UlVTWGdHeTBVT3oxb2draUUyMm81TlJockVGbWNDbElx?=
 =?utf-8?B?cDJnNm1CNURHbG1tQ3VkTDRnS0VGRld3M0kvYW9PMitHRmdUSm01ZGZSR3lC?=
 =?utf-8?B?bXI0Yk1mYSs1ZW5BT0dtUUxCb2RxL3EwanBoQjhiaGtuRDlENExSMHd5R2RR?=
 =?utf-8?B?KzJsWU9GSnFBWXBqUjhPL0UzWlptL1VIaTVUbFJkeS9pV1ZlRjVHQjA1R0hK?=
 =?utf-8?B?TG9VNEZvbS9xejhyK3NZK2NrL1hZbVFYRVIvWEZTaDRxOWtHNWk5UFdTMzl1?=
 =?utf-8?B?ZGVucGs1b2FpdGV4ZnBsYTJXR3VqOWxZcGxtdktBOGcxeERPS0pIQ3lKOGM1?=
 =?utf-8?B?Y1lzeFVQQk9EOUt0Nk5PTWlVczBjUjVLZllxY3VIZlI2b3FwZlFVcHdmbzhC?=
 =?utf-8?B?akkwN2YyRUN2S3FxL1dDcUIzbmFVRlJ3eFFrNGZGRkJXaUdMNTc3cmlDRUtL?=
 =?utf-8?B?eWVBbGpZc0Z2aTdTaUgrZllkMDdVQXVsb1M1ZkFkaTdzN2NjZEQwRDhZSHI5?=
 =?utf-8?B?QklaMlJneWNLVE1sOGgwaUsrL28zZDd4OXdrTysvQkErZmVaRjhzT3VLcHc5?=
 =?utf-8?B?Rk9rUlFJeE1hK1B1UklPZEhXdUNSRGZqY2ExdmxlM1lXZUZwWDFRcGdGbTBa?=
 =?utf-8?B?em9hZmhmcXM5djZtc242NG05SHRXVkxrR3VsUCt5eTdpd1VOTzNPVm81YjFv?=
 =?utf-8?B?R1cyeHh1cWt5TWRFRDdCSjc2RXYrMjcvbkk4eGhKdHZUUXhjSHI4c1I4WTUy?=
 =?utf-8?B?Q2xuT0dqb0E0YTNxWVFrUlJrSk1XenJjT29zUllISlBXQ1VWMnBhRWhhM0p4?=
 =?utf-8?B?OXhrb0dFQWFkNWdsa3pBUm1LVS9NR2NnUWxrbW5wdXl0N0MrNE5jSlBDTmtY?=
 =?utf-8?Q?50vU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70E18A3668564248981FC452DD64BBFA@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de5b82f-8d6e-4e26-148c-08ddb2fc6998
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 08:52:12.9450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yH+0Md7OccAwhanT6XLSHvVQ9z4rsCdm424JtacA6YtRZF3X+aPdVF5u24jrpN0b8/AtiLYSOAjZfrSx/9ZSLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7185

T24gMjAyNS82LzI0IDE2OjQ0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjQuMDYuMjAyNSAx
MDozMiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzI0IDE2OjI4LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyNC4wNi4yMDI1IDEwOjI2LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjUvNi8yNCAxNjoxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAy
NC4wNi4yMDI1IDEwOjEyLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNS82LzIw
IDE0OjM0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMTkuMDYuMjAyNSAwODoxNCwg
Q2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMjAyNS82LzE4IDIyOjMzLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+Pj4+PiBPbiAxMi4wNi4yMDI1IDExOjI5LCBKaXFpYW4gQ2hlbiB3
cm90ZToNCj4+Pj4+Pj4+Pj4gK30gdnBjaV9jYXBhYmlsaXR5X3Q7DQo+Pj4+Pj4+Pj4NCj4+Pj4+
Pj4+PiBBcyB5b3UgaGF2ZSBpdCBoZXJlLCAuLi4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBAQCAt
MjksOSArMzAsMjIgQEAgdHlwZWRlZiBpbnQgdnBjaV9yZWdpc3Rlcl9pbml0X3Qoc3RydWN0IHBj
aV9kZXYgKmRldik7DQo+Pj4+Pj4+Pj4+ICAgKi8NCj4+Pj4+Pj4+Pj4gICNkZWZpbmUgVlBDSV9N
QVhfVklSVF9ERVYgICAgICAgKFBDSV9TTE9UKH4wKSArIDEpDQo+Pj4+Pj4+Pj4+ICANCj4+Pj4+
Pj4+Pj4gLSNkZWZpbmUgUkVHSVNURVJfVlBDSV9JTklUKHgsIHApICAgICAgICAgICAgICAgIFwN
Cj4+Pj4+Pj4+Pj4gLSAgc3RhdGljIHZwY2lfcmVnaXN0ZXJfaW5pdF90ICpjb25zdCB4IyNfZW50
cnkgIFwNCj4+Pj4+Pj4+Pj4gLSAgICAgICAgICAgICAgIF9fdXNlZF9zZWN0aW9uKCIuZGF0YS52
cGNpLiIgcCkgPSAoeCkNCj4+Pj4+Pj4+Pj4gKyNkZWZpbmUgUkVHSVNURVJfVlBDSV9DQVBBQklM
SVRZKGNhcCwgZmluaXQsIGZjbGVhbiwgZXh0KSBcDQo+Pj4+Pj4+Pj4+ICsgICAgc3RhdGljIGNv
bnN0IHZwY2lfY2FwYWJpbGl0eV90IGZpbml0IyNfdCA9IHsgXA0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+
Pj4gLi4uIF90IHN1ZmZpeGVzIGdlbmVyYWxseSBkZXNpZ25hdGUgdHlwZXMuIEkgZG9uJ3QgdGhp
bmsgd2Ugc2hvdWxkIGFidXNlDQo+Pj4+Pj4+Pj4gdGhhdCBzdWZmaXggZm9yIGFuIGlkZW50aWZp
ZXIgb2YgYSB2YXJpYWJsZS4NCj4+Pj4+Pj4+IFdoYXQgZG8geW91IHRoaW5rIEkgc2hvdWxkIGNo
YW5nZSB0bz8NCj4+Pj4+Pj4NCj4+Pj4+Pj4gV2VsbCwgaWYgeW91IHRha2UgbXkgb3RoZXIgYWR2
aWNlLCB0aGlzIHF1ZXN0aW9uIHdvbid0IG5lZWQgYW5zd2VyaW5nLCBhcw0KPj4+Pj4+PiB0aGVu
IHlvdSBvbmx5IG5lZWQgdGhlIC4uLl9lbnRyeSBvbmUuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEJ0dywg
bm90aWNpbmcgb25seSBub3cgLSB3aHkgaXMgaXQgZmluaXQgdGhhdCdzIHVzZWQgdG8gZGVyaXZl
IHRoZSBpZGVudGlmaWVyPw0KPj4+Pj4+PiBXaXRoIHRoYXQsIGl0IGNvdWxkIGFzIHdlbGwgYmUg
ZmNsZWFuIChsZWF2aW5nIGFzaWRlIHRoZSBmYWN0IHRoYXQgdGhhdCdzDQo+Pj4+Pj4+IG9wdGlv
bmFsKS4gSW1vIHRoZSBuYW1lIHdvdWxkIGJldHRlciBiZSBkZXJpdmVkIGZyb20gY2FwLCBhbmQg
aXQgd291bGQgYmV0dGVyDQo+Pj4+Pj4+IGFsc28gcmVmbGVjdCB0aGUgcHVycG9zZSBvZiB0aGUg
dmFyaWFibGUuDQo+Pj4+Pj4gSSBjb25zaWRlcmVkIHRoaXMuDQo+Pj4+Pj4gSSB0aGluayBpdCBp
cyBlYXNpZXIgdG8gdXNlIGZpbml0LCBhbmQgZmluaXQgY29udGFpbnMgdGhlIGNhcCB0eXBlLCBh
bmQgdGhlIG1haW4gcHVycG9zZSBvZiB0aGlzIHN0cnVjdCBpcyB0byBpbml0aWFsaXplIHRoZSBj
YXAuDQo+Pj4+Pg0KPj4+Pj4gWWV0IGlkZW50aWZpZXIgbmFtZXMgc2hvdWxkIG1ha2Ugc2Vuc2Ug
Zm9yIHRoZSBvYmplY3QgdGhleSBuYW1lLg0KPj4+PiBPSy4gV2hhdCdzIHlvdXIgc3VnZ2VzdGlv
biBhYm91dCBuYW1pbmcgdGhlIGVudHJ5Pw0KPj4+DQo+Pj4gY2FwIyNfaW5pdCBvciBfIyNjYXAj
I19pbml0IGZvciBleGFtcGxlLg0KPj4gSWYgc28sIEkgbmVlZCB0byBleHRlbmQgdGhlIHBhcmFt
ZXRlciBvZiBSRUdJU1RFUl9WUENJX0NBUEFCSUxJVFkgc2luY2UgY3VycmVudCBjYXAgaXMgbnVt
YmVyLCBub3Qgc3RyaW5nLg0KPj4gTWF5YmU6DQo+PiBSRUdJU1RFUl9WUENJX0NBUEFCSUxJVFkg
KGNhcCwgY2FwX2lkLCBmaW5pdCwgZmNsZWFuLCBleHQpDQo+IA0KPiBXZWxsLCB5ZXMsIGluIHRo
ZSBoZWxwZXIgbWFjcm8geW91IG1heSBuZWVkIHRvIHRha2UgcHJlY2F1dGlvbnMuIEhvd2V2ZXIs
IEkgd2FzDQo+IHdvbmRlcmluZyBhbnl3YXkgd2h5DQo+IA0KPiBSRUdJU1RFUl9WUENJX0NBUChQ
Q0lfQ0FQX0lEX01TSSwgaW5pdF9tc2ksIE5VTEwpOw0KPiANCj4gd291bGQgYmUgbmVjZXNzYXJ5
LCB3aGVuDQo+IA0KPiBSRUdJU1RFUl9WUENJX0NBUChNU0ksIGluaXRfbXNpLCBOVUxMKTsNCj4g
DQo+IGNvdWxkIGRvLCB1c2luZyBlLmcuDQo+IA0KPiAjZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfQ0FQ
KGNhcCwgZmluaXQsIGZjbGVhbikgXA0KPiAgICAgUkVHSVNURVJfVlBDSV9DQVBBQklMSVRZKFBD
SV9DQVBfSURfIyNjYXAsIGZpbml0LCBmY2xlYW4sIGZhbHNlKQ0KPiAjZGVmaW5lIFJFR0lTVEVS
X1ZQQ0lfRVhUQ0FQKGNhcCwgZmluaXQsIGZjbGVhbikgXA0KPiAgICAgUkVHSVNURVJfVlBDSV9D
QVBBQklMSVRZKFBDSV9FWFRfQ0FQX0lEXyMjY2FwLCBmaW5pdCwgZmNsZWFuLCB0cnVlKQ0KPiAN
Cj4gKG90aGVyIHZhcmlhdGlvbnMgYXJlIHBvc3NpYmxlLCBvZiBjb3Vyc2UpLiBUaGVuIHlvdSBj
b3VsZCBlYXNpbHkgZGVyaXZlIHRoZQ0KPiBpZGVudGlmaWVyIHdhbnRlZCAocmVxdWlyaW5nIGFu
b3RoZXIgcGFyYW1ldGVyIHRvIFJFR0lTVEVSX1ZQQ0lfQ0FQQUJJTElUWSgpLA0KPiB5ZXMpLg0K
U2VlbXMgYmV0dGVyLg0KVGhhbmsgeW91IHZlcnkgbXVjaCENCg0KPiANCj4gSmFuDQoNCi0tIA0K
QmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

