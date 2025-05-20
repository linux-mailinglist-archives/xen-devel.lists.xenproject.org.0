Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046FAABD1BE
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 10:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990509.1374448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHIFN-0005r4-VQ; Tue, 20 May 2025 08:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990509.1374448; Tue, 20 May 2025 08:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHIFN-0005nx-S2; Tue, 20 May 2025 08:22:49 +0000
Received: by outflank-mailman (input) for mailman id 990509;
 Tue, 20 May 2025 08:22:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EAyu=YE=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uHIFM-0005nS-2m
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 08:22:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:2417::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 998c0f7d-3553-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 10:22:43 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH0PR12MB7983.namprd12.prod.outlook.com (2603:10b6:510:28e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Tue, 20 May 2025 08:22:36 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 08:22:36 +0000
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
X-Inumbo-ID: 998c0f7d-3553-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrSbCukrDVJXUBMc80RytYea3j+3Y3tqQPFew5CucY3Bx/e+QTIYLsgijjbUftsNLyXxMe800dxhEzZW10LztL73Bov+i1SlkaL2DMpm7DpSb/IP+cEDh9PQVNcywPKjZ/cl2FS1fGoEVle6cGKmcZZC801ekFLpZ7KhwsDVOmbYkrUlapJkywcLEd/sy5rar/EB//DdLkqEFM7TaucZtRG0KhB10s1obTsuBg2J55XKQcLb9I/14yKEqhc8p+YytfQefDo9BwlpfXvQ6OcWhqxCskVIm7X1axvF0+iAxDC/XhXQxZmlSGAbHei12uSZGYG0EOL4zGSz10prgXkgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBlPrDocIuVJCMmtzEw8NVz7vOKMYo++HFbwBjqO98s=;
 b=sY9nNsOI+AE17Fi+rq6HyqHFYvst5l16OKwp3ylkpQtTLCXx2zDGQvQp6KhfjjQ6o8OAg93u0zQU4hzEKgpzz+N3SW1SIqTKsHr6Zd5uJ6OngseHZc1djqf0645Le1xqjiQeJ276pXcihrfIEnr0fOJQ5ro4d6CaNDJ7NsBbMnGtVvxwU2UimMk7t8mUlM7hzC8GDpwXN0R0nHVHhE6Rak7+sy53ctshzgrFUvF9827Yav3+oNEib+HNN1NaS8hNp4qNWAjMrvegSA7gE3zpU3amnlkxlEs2x1txrl9OUjGxeBAddmtT8ol0MhqHnVxBUSO2DW1bj9kR2/7d6uZd/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBlPrDocIuVJCMmtzEw8NVz7vOKMYo++HFbwBjqO98s=;
 b=iIANIJgIfxjofBGIjC0B/KjmB5onxgRcN03+FDQv5sSyFyT91P/3OlF9ZS1TNe/7cnUbkNyxWT0MFyhMj9u3wSZC6fIog+ICoNqu8UjtreHJhOdemaVNWZya5g1Xu4rnBWN5l7O8HyehKRtzt5aiEVIzrXZ4kGN0Esi9Rld2Y38=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 12/15] tools/xenpm: Print CPPC parameters for amd-cppc
 driver
Thread-Topic: [PATCH v4 12/15] tools/xenpm: Print CPPC parameters for amd-cppc
 driver
Thread-Index: AQHbrRCuBHJz/5ZpqUqHhc0gdq6hGrO8VLYAgA1zbxCABpifAIAK/PXg
Date: Tue, 20 May 2025 08:22:36 +0000
Message-ID:
 <DM4PR12MB8451E0A93F3F45229B8AD900E19FA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-13-Penny.Zheng@amd.com>
 <63b3b016-551c-4201-a3b3-db19b27ea649@suse.com>
 <DM4PR12MB8451F0794ED87DE6F9E5F2A3E18AA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <75679a60-7ca0-41da-b542-c5b9d5efdfbe@suse.com>
In-Reply-To: <75679a60-7ca0-41da-b542-c5b9d5efdfbe@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=d4103086-8679-476b-bb5f-44c149482b68;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-20T08:21:12Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH0PR12MB7983:EE_
x-ms-office365-filtering-correlation-id: 4c233735-e727-485f-f2b6-08dd97777a5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N2JiS2xsMktRRmlkWGRoUHJkdEtBeDdKRThsNHRsakdrVGlBZkJZMGxGUDl2?=
 =?utf-8?B?elhDOC9NTVdWeXdaS09FbW92T0ZQYUpkUWpUUlArYTJWbiswYmd2aEhEZHlz?=
 =?utf-8?B?WTlMVFAwVHlQeXNBY3EvRHJQMjUyWHlwYUsveWMxMGx4UGNVSllXK3E1Vys4?=
 =?utf-8?B?bTRBU2IxdStNODhOaEhyOVc3QWNFYmFzaHdNZVdIcEoxMnRKRnFVYVZhV3NW?=
 =?utf-8?B?TjRzZVpmNXRpeDdoY254Z1pSTmwrUDdRVVg5VE1UdlhFYjBsMDVpc0VpUHFG?=
 =?utf-8?B?aFJZeEZ6dTdkMThheUx2RTYvR1VnMzNhVC9SQ3M3SW1DOVpDSnFhNUpCTDVu?=
 =?utf-8?B?ZG4vSDhxbE42Q3hQS1RzMzV0UXl5TU9MWjZ5NVhybHduOU51T2hVQ3NRTlQv?=
 =?utf-8?B?WWxERmsvSzFXSHhWUHNNaGhJbWJKWnFSRFBHRndRYUhUSzUrSjJFRkF6eGNk?=
 =?utf-8?B?dS9tV1EyTGp0UWlmUnh6R0UvbGQxUWY2WGMrazBOV3Z2YUxVa0dlU2tCTWQx?=
 =?utf-8?B?YlMyTTZ5MHZLRVhuVThVbHNkbEx4eS9xZzN0M3pHL3cwV0MvQ0tBL2RYb1lF?=
 =?utf-8?B?b3VtaVE1RFZ0NEk0L1oxc1pLMTY1TGZxMnJUV2NKQWtYbzZqSGk0elhSb01q?=
 =?utf-8?B?Ykh5MXhyV2xKaFF3TGpZNVV5VktGL3RvUnhPUmNVZU9qdzFnaXpZYU84c29Y?=
 =?utf-8?B?cWxaU0R4S0RpMUhvTzFpV0FpOGYrQm91Y1JWZDZlRzFLSEpBS1o2YUc3bmdj?=
 =?utf-8?B?bTZWWi9jR1hrSk45QWhUN0FkVVNlM3hVdWRQT05xSFNzQkRzY3VacW1OLzFF?=
 =?utf-8?B?L3Y4S3ZlOFBQSUM2OEx1clJYYTdFVFhUSEh5SGhVS0VaNkdZbnNTdHVCSG1B?=
 =?utf-8?B?OGxxVTNQMmY5eGVYUGdOaVNOdFhtWWJQMzVLcVBVeW1vSGprRDRqYkVidGpp?=
 =?utf-8?B?MFJTRTlaL0FSMDNHQlJNMnFVVENIbnIzQ0NTN1JyRHZzMzNRQU1NdG9MckNQ?=
 =?utf-8?B?OUZoMjBDWVdjdU03ck54RlU5aHRBZ21jTmNnNWRYeG0rK0xMTmdnWlBpYmRr?=
 =?utf-8?B?RWFKVFEzajJOdExUcC9rUjM3N29NRit6VzNTbjlzdU42dU9UbkI5bEo0dWdM?=
 =?utf-8?B?QzZmVGR3SGdWWDBOWWo4OHpUK2NOb3VHeHJ6Vys5eGlHT2w2M3o3WTVQTi9u?=
 =?utf-8?B?eDBvSDFqTjRxaUNZcDVIZDlrTGVmcHhOR2xocXF4dUlpK3Q3YVJQZFNqWGo0?=
 =?utf-8?B?SlZlTndoNGhBWXd4QlZxWmlySE5QTVY4MldJc2pVRElLMjcva2RzNVVXSDZJ?=
 =?utf-8?B?d0tzYWM3anduZXhWTm9hT2VWelBXTElDNnh6T2R0c3VwZWNsaUl2VnBycE5B?=
 =?utf-8?B?MU5CZ0I3OGdXbGdFeU1TMytqbGNZR0lqbGUvd1hSbXg0OXlhbnR4SjUwK1dt?=
 =?utf-8?B?OGZCWTMzc2d1RTIxeS9YSGVLeTZwZ3IyV1UzL1U4dG8rdGwzY2ZZV2lTTVJi?=
 =?utf-8?B?YWl5anUvSXVJU1VlUXBrS3ZQSGhKcGtUcGMzanhVK2Y1bzkreThqMFVUYmkz?=
 =?utf-8?B?eEZvT1FnVmo2dm12eFV5VWE5UUJsN0VBMDU5eEVNVGpIRUhKSWxqYnlUS2Zk?=
 =?utf-8?B?T2ZkeUYyQWFLdUdhdU5KcHgvWlJpQW91RlJLMk5IYk0zS1Z3M3UrUi9JTDFi?=
 =?utf-8?B?MStCYStQemxLMnRGTEtFbE0xL2dIdklJVnJHdGxRajRhaTVBcXpJZXhWbVdx?=
 =?utf-8?B?dnhmWE5SNUtaai9JdmR1TDRkRVcza1BaSW04UTYwTko4bS9WRlpjV1M5RTN3?=
 =?utf-8?B?MURWOHQyOWIyUHA3OFRTTkhrRzU3Nlgya0J3cHZzOXUwYWMwUTZVM1R4NlZx?=
 =?utf-8?B?SFVic2FGWXkzT0NlL05JRFVYZXhtcUJjOW4zK2s5YTJYWjBZeThneUNhbE9a?=
 =?utf-8?B?SERiMlB6emh4d3c0SnVsTyt3ek5MeHhVK2RFVXhUQVhld01lajV6dmZBZlQr?=
 =?utf-8?Q?e6Esfwb8znCaBmuDMcUAItj78yEScc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnpGUkhNaVc0NDJabDgrTGt1RTI4YmlJWkJ5SGUyUU5vbGZ0RXc4ZXVKc3ZC?=
 =?utf-8?B?VFB3NjNXTmtTRlZ0d0ZyYUF0T3FSZmRoQUpUTE00NWREZnVtUVdacUc3QUNQ?=
 =?utf-8?B?cGtIWjdpQWcxY0lRTGQwWlZkRzRVaWpFNXc0NWtDenlHWXlsTmYvNlphOG0v?=
 =?utf-8?B?MFFUSGIrZEQzcnpWcFAzM0JYTENLQU9LQ2lxdU9BWStlUmVRR3R0M2gyQTZx?=
 =?utf-8?B?Q1Y0OC9MTmhUc0JqVS8vbWxyaVRaQVBrblVCSkdaVEJZc3FINmNhNHlneDdP?=
 =?utf-8?B?UENXOE4wNndYRFkvMW9va0Y5ZjVKQklZRzFuNVBMWmE3c1NFcTJVeGRYSFNh?=
 =?utf-8?B?c1ZER1lTN2JrVGlVTTQ3UzhPQStUandVNW90QUlYZU1FQTdFNTdzR3p3bGY2?=
 =?utf-8?B?eVliQUExV2VrZEFuMG5ybjZNdVl2ZTc1RDJ4SHg3SW5tTk9aaGhRUTR3YnhR?=
 =?utf-8?B?QU5XcGo0WFlFS1FLUkpjTGFyaW5BKzVhZEV2a3dRSHBucTdHampzVklNSStH?=
 =?utf-8?B?SVQxRHNocW9pQjJIejdQc0k0Y04rTWN6dDFiSW5rckFwNVBpZW8zalhBd1kw?=
 =?utf-8?B?WEhrUXkrOENHd3I3WWNWNzlqRnQvQWJrbjZ1MTFXS0xFUnF0OGJrbWE2ZFFp?=
 =?utf-8?B?cE5KSU41S2pnanJ3YlBaYmEyUWZhUi9icXhpdmxSNDRIeVYzTnpSOXhwdzQw?=
 =?utf-8?B?ZytuOTI1ZnJkVEJGNFd2WVczZS9ONnJCN0hidG00KzFLbUhWbFhaTHRpVk9Y?=
 =?utf-8?B?RWNYZVdac2dVKzQ2Tlh0UHUwUWZZTHE0WDljNTdwRjZpK3pmYUtHbWYvcnJE?=
 =?utf-8?B?VHVRZ3R5Nnh6VC9RMDZwNnVpM3JsWHIyV00vU0twVGtuRDhVSVpoQTVwSkJL?=
 =?utf-8?B?VngxTWx6Smh1ZGJ4ZjByVmkvKzI3TkZ0WUQ3Y0JYK3U3OXMxQzRhQ2ljRWZX?=
 =?utf-8?B?M2pnS3p6V24rMjJST3ZyejM1ZmdGZ3lBWXNDcWlnMFpEaE9NdUE1NFlNWXMw?=
 =?utf-8?B?UGVlMGwxWFdoMEhGZ0pJWVZ0K3VJYkJ0eUlOR1JyY3J3MUhISXEwWitwVWFs?=
 =?utf-8?B?THVhT1RFNis5VFM1d0ZuMG5hL3FldVpPbk00Z0pnNVo1NXA4VVZwNFk5aWlT?=
 =?utf-8?B?WlU0RURPNmUwYlNOT0dOYlJEeXNKVzJueUsyN2NDUU1BR1Z0czlmcVQzMitC?=
 =?utf-8?B?SkdnQkcxcFB4NmxKM050ODZFTSt5Q0U2Q2F5T3Jza0hPcmlIbndXWWxVRmFi?=
 =?utf-8?B?NldPUjI0RndSaUhjSmFYZG5BdE9qUm5ab2FhTEdDd01pMGlrREJ3OEdVQlRB?=
 =?utf-8?B?TFVZK3AvRmVrRkxVWHVKMzJKcmQ3ZmhmakFyL3JHUEpQRTQ5OWhETXZ4RkdB?=
 =?utf-8?B?UmlLT2xzRTJlRTRQY3RsMHVoMmN6akQyc2gzMDg2UnRMRDh2ZDFhNjVBa0Vz?=
 =?utf-8?B?WmVHMGFOSDVzMW41TDBvZGhCWEttMmJSUlVFaVhzSjFXSTRkYnVnaHo3em9C?=
 =?utf-8?B?NjdnU3IzcW85TVlxQzFyUTQ5WnBNanNNNkZxcW0xVEVIT205T2U0ZmNnNUxU?=
 =?utf-8?B?VURvL3lWcm5LUXJyZUpaM2ZBSGtWZmpWTG1zTy9EQmt0VFdkWGdYeWdxVGlR?=
 =?utf-8?B?UVJZU2tUZ2lkOWduQmNua3ErWURYVUJlQzlLT2sxSVV1U0VYdjBPM0FNV2tJ?=
 =?utf-8?B?YVpLaHhIVnhSdW1sOE5zVW9QaktrMjJWR1ZINzFueGVMV2dURWM0S0J0ai8y?=
 =?utf-8?B?TEpzTXNNWGk0dENpNUNwc2xkaWdBRmxFVGFKOU5QN1ZkcE9KVDlpdnYzcjVl?=
 =?utf-8?B?eTBuSGRaQzR4WnZOWVV3cUpoMUxLSmVXelkzVXM0SThWV3dJaTlSM2R5VWFl?=
 =?utf-8?B?dC9DUmR5RExweGlFOHRmVG53UTl3WDJNTVlMSWQ5TzNlbUk1K0ZDQ0pWSnJv?=
 =?utf-8?B?QysxRHFxVnV6c05zKzhMenUvM1BSdEJ4SU1XQXMrQXFaU1hpVmpUWGJXL3Jm?=
 =?utf-8?B?UjVSbVVmNHptcXBSRFQ0dXJLRXVzQkhnaHBCcTZ0c3pkVFBYa0RURC9MNlE1?=
 =?utf-8?B?N01wbWtOQWlPUkFxLzFLSFJMWDcyazdMbEN1MCtwWVcxY1RrZHU4YTgzcFFR?=
 =?utf-8?Q?ExZI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c233735-e727-485f-f2b6-08dd97777a5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 08:22:36.5751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uSx7ItL9w4PprOysHFSC5xws9Es/RTjd6NJrIGgqHLKZs1FODtArTlLIm3gor9PD57GLJGaCwNpmWsTGuD1eSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7983

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAxMywgMjAyNSA0
OjAzIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENjOiBI
dWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFudGhvbnkgUEVSQVJEDQo+IDxhbnRob255
LnBlcmFyZEB2YXRlcy50ZWNoPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMTIvMTVdIHRvb2xzL3hlbnBtOiBQcmludCBDUFBDIHBhcmFt
ZXRlcnMgZm9yIGFtZC1jcHBjDQo+IGRyaXZlcg0KPg0KPiBPbiAwOS4wNS4yMDI1IDA4OjM2LCBQ
ZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogV2VkbmVz
ZGF5LCBBcHJpbCAzMCwgMjAyNSA5OjU1IFBNDQo+ID4+DQo+ID4+IE9uIDE0LjA0LjIwMjUgMDk6
NDAsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gSFdQLCBhbWQtY3BwYywgYW1kLWNwcGMtZXBw
IGFyZSBhbGwgdGhlIGltcGxlbWVudGF0aW9uIG9mIEFDUEkgQ1BQQw0KPiA+Pj4gKENvbGxhYm9y
YXRpdmUgUHJvY2Vzc29yIFBlcmZvcm1hY2UgQ29udHJvbCksIHNvIHdlIGludHJvZHVjZQ0KPiA+
Pj4gY3BwY19tb2RlIGZsYWcgdG8gcHJpbnQgQ1BQQy1yZWxhdGVkIHBhcmEuDQo+ID4+Pg0KPiA+
Pj4gQW5kIEhXUCBhbmQgYW1kLWNwcGMtZXBwIGFyZSBib3RoIGdvdmVybm9yLWxlc3MgZHJpdmVy
LCBzbyB3ZQ0KPiA+Pj4gaW50cm9kdWNlIGh3X2F1dG8gZmxhZyB0byBieXBhc3MgZ292ZXJub3It
cmVsYXRlZCBwcmludC4NCj4gPj4NCj4gPj4gQnV0IGluIHRoZSBFUFAgZHJpdmVyIHlvdSB1c2Ug
dGhlIGluZm9ybWF0aW9uIHdoaWNoIGdvdmVybm9yIGlzIGFjdGl2ZS4NCj4gPg0KPiA+IFdlIHdh
bnQgdG8gaGF2ZSBhIG9uZS1vbmUgbWFwcGluZyBiZXR3ZWVuIGdvdmVybm9yIGFuZCBlcHAgdmFs
dWUsIHN1Y2gNCj4gPiBhcywgSWYgdXNlcnMgY2hvb3NlIHBlcmZvcm1hbmNlIGdvdmVybm9yLCBu
byBtYXR0ZXIgdmlhICJ4ZW5wbSIgb3INCj4gPiBjbWRsaW5lLCB1c2VycyB3YW50IG1heGltdW0g
cGVyZm9ybWFuY2UsIFdlIHNldCBlcHAgd2l0aCAwIHRvIG1lZXQgdGhlDQo+IGV4cGVjdGF0aW9u
Lg0KPiA+IEFuZCBpZiB1c2VycyBjaG9vc2UgcG93ZXJzYXZlIGdvdmVybm9yLCB1c2VycyB3YW50
IHRoZSBsZWFzdCBwb3dlcg0KPiA+IGNvbnN1bXB0aW9uLCB0aGVuIHdlIHNoYWxsIHNldCBlcHAg
d2l0aCAyNTUgdG8gbWVldCB0aGUgZXhwZWN0YXRpb24uDQo+DQo+IFRoYXQncyBhbGwgZmluZSwg
YnV0IGNvbXBsZXRlbHkgbWlzc2VzIHRoZSBwb2ludCBvZiBteSBxdWVzdGlvbjogSWYgdGhlIGdv
dmVybm9yIGlzDQo+IHJlbGV2YW50LCB3aHkgd291bGQgeW91IGJ5cGFzcyByZXNwZWN0aXZlIHBy
aW50aW5nPw0KPg0KDQpUaGUgb25seSB1c2VmdWwgaW5mbyBpbiBnb3Zlcm5vciBmb3IgZXBwIG1v
ZGUsIElNTywgaXMgaXRzIG5hbWUuDQpJIGRlZHVjZSB3aGljaCBwZXJmb3JtYW5jZSBwb2xpY3kg
dXNlciB3YW50cyB0byBhcHBseSB0aHJvdWdoIHdoaWNoIGdvdmVybm9yIHRoZXkgY2hvb3NlLg0K
SWYgdXNlciBjaG9vc2VzIHBlcmZvcm1hbmNlIGdvdmVybm9yLCB0aGV5IHdhbnQgbWF4aW11bSBw
ZXJmb3JtYW5jZS4NCklmIHVzZXIgY2hvb3NlcyBwb3dlcnNhdmUgZ292ZXJub3IsIHRoZXkgd2Fu
dCB0aGUgbGVhc3QgcG93ZXIgY29uc3VtcHRpb24NCkkgY291bGQgb25seSBwcm92aWRlIGFwcHJv
cHJpYXRlIGVwcCB2YWx1ZSBpbiBhYm92ZSB0d28gc2NlbmFyaW9zLg0Kb25kZW1hbmQgYW5kIHVz
ZXJzcGFjZSBhcmUgZm9yYmlkZGVuIGNob2ljZXMsIGFuZCBpZiB1c2VycyBzcGVjaWZ5IHN1Y2gg
b3B0aW9ucyBpbiBjbWRsaW5lLA0KSSBzaGFsbCBnaXZlIHdhcm5pbmcgbWVzc2FnZSB0byBzYXkg
IHRoYXQgYW1kLWNwcGMgaW4gYWN0aXZlIG1vZGUgaXMgZ292ZXJub3ItbGVzcywgYW5kIHVzZXJz
IGNvdWxkDQpzZXQgZXBwIHZhbHVlcyBvbiBydW50aW1lIHRvIHNwZWNpZnkgYmlhcyB0b3dhcmRz
IHBlcmZvcm1hbmNlIG9yIGVmZmljaWVuY3kuDQoNCklmIGFib3ZlIGlzIG1lc3N5LCBJIGNvdWxk
IGFsc28gdG90YWxseSBmb3JiaWQgZ292ZXJub3IgdGhpbmcgZm9yIGFjdGl2ZSBtb2RlLi4uIHdk
eXQ/DQoNCg0KPiA+IE9uZGVtYW5kIGlzIGEgdHJpY2t5IHBhcnQsIGhtbW1tLCBJIGRvbid0IGtu
b3cgd2hpY2ggdmFsdWUgaXMgc3VpdGFibGUNCj4gPiBmb3IgaXQsIHRoZSBtZWRpdW0gb25lPyBT
byBJIG5lZ2xlY3QgaXQgaW4gdGhlIGZpcnN0IHBsYWNlDQo+DQo+IE1lZGl1bSBvbmUgbWF5IGJl
IG9rYXktaXNoLCBidXQgaXQncyBub3QgcmVhbGx5IGFuIGFwcHJvcHJpYXRlIGZpdC4gV2UgbWF5
IHdhbnQgdG8NCj4gYXQgbGVhc3QgY29uc2lkZXIgcmVqZWN0aW5nIHRoZSB1c2Ugb2Ygb25kZW1h
bmQgd2l0aCB0aGUgRVBQIGRyaXZlci4NCj4gVGhhdCwgaG93ZXZlciwgaGVhdmlseSBkZXBlbmRz
IG9uIGhvdyBoYXJkd2FyZSB3b3VsZCBiZWhhdmUgd2hlbiB1c2luZyB0aGUNCj4gbWVkaXVtIHZh
bHVlLg0KPg0KPiA+Pj4gLS0tIGEvdG9vbHMvbWlzYy94ZW5wbS5jDQo+ID4+PiArKysgYi90b29s
cy9taXNjL3hlbnBtLmMNCj4gPj4+IEBAIC03OTAsOSArNzkwLDE4IEBAIHN0YXRpYyB1bnNpZ25l
ZCBpbnQNCj4gPj4+IGNhbGN1bGF0ZV9hY3Rpdml0eV93aW5kb3coY29uc3QgeGNfY3BwY19wYXJh
X3QgKmNwcGMsDQo+ID4+PiAgLyogcHJpbnQgb3V0IHBhcmFtZXRlcnMgYWJvdXQgY3B1IGZyZXF1
ZW5jeSAqLyAgc3RhdGljIHZvaWQNCj4gPj4+IHByaW50X2NwdWZyZXFfcGFyYShpbnQgY3B1aWQs
IHN0cnVjdCB4Y19nZXRfY3B1ZnJlcV9wYXJhICpwX2NwdWZyZXEpDQo+ID4+PiB7DQo+ID4+PiAt
ICAgIGJvb2wgaHdwID0gc3RyY21wKHBfY3B1ZnJlcS0+c2NhbGluZ19kcml2ZXIsDQo+IFhFTl9I
V1BfRFJJVkVSX05BTUUpDQo+ID4+ID09IDA7DQo+ID4+PiArICAgIGJvb2wgY3BwY19tb2RlID0g
ZmFsc2UsIGh3X2F1dG8gPSBmYWxzZTsNCj4gPj4+ICAgICAgaW50IGk7DQo+ID4+Pg0KPiA+Pj4g
KyAgICBpZiAoICFzdHJjbXAocF9jcHVmcmVxLT5zY2FsaW5nX2RyaXZlciwgWEVOX0hXUF9EUklW
RVJfTkFNRSkgfHwNCj4gPj4+ICsgICAgICAgICAhc3RyY21wKHBfY3B1ZnJlcS0+c2NhbGluZ19k
cml2ZXIsDQo+IFhFTl9BTURfQ1BQQ19EUklWRVJfTkFNRSkgfHwNCj4gPj4+ICsgICAgICAgICAh
c3RyY21wKHBfY3B1ZnJlcS0+c2NhbGluZ19kcml2ZXIsDQo+ID4+IFhFTl9BTURfQ1BQQ19FUFBf
RFJJVkVSX05BTUUpICkNCj4gPj4+ICsgICAgICAgIGNwcGNfbW9kZSA9IHRydWU7DQo+ID4+PiAr
DQo+ID4+PiArICAgIGlmICggIXN0cmNtcChwX2NwdWZyZXEtPnNjYWxpbmdfZHJpdmVyLCBYRU5f
SFdQX0RSSVZFUl9OQU1FKSB8fA0KPiA+Pj4gKyAgICAgICAgICFzdHJjbXAocF9jcHVmcmVxLT5z
Y2FsaW5nX2RyaXZlciwNCj4gPj4gWEVOX0FNRF9DUFBDX0VQUF9EUklWRVJfTkFNRSkgKQ0KPiA+
Pj4gKyAgICAgICAgaHdfYXV0byA9IHRydWU7DQo+ID4+DQo+ID4+IFBsZWFzZSBhdm9pZCBkb2lu
ZyB0aGUgc2FtZSBzdHJjbXAoKXMgdHdpY2UuIFRoZXJlIGFyZSBzZXZlcmFsIHdheXMNCj4gPj4g
aG93IHRvLCBzbyBJJ20gbm90IGdvaW5nIHRvIG1ha2UgYSBwYXJ0aWN1bGFyIHN1Z2dlc3Rpb24u
DQo+ID4NCj4gPiBNYXliZSB3ZSBzaGFsbCB1c2Ugc3dpdGNoLWNhc2UoKSB0byByZXBsYWNlIHRo
ZSBzYW1lIHN0cmNtcCgpcyBTaW5jZQ0KPiA+IGl0J3Mgbm90IGVhc3kgdG8gc3dpdGNoLWNhc2Uo
KSBzdHJpbmcgdmFsdWUsIEkgaGFkIGEgZHJhZnQgaWRlYSB0bw0KPiA+IGluY2x1ZGUgYW4gbmV3
IGVudHJ5IGluICJzdHJ1Y3QgeGVuX2NwcGNfcGFyYSIsDQo+ID4gU2VlOg0KPiA+IGBgYA0KPiA+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggYi94ZW4vaW5jbHVkZS9w
dWJsaWMvc3lzY3RsLmgNCj4gPiBpbmRleCBmYTQzMWZkOTgzLi5iODcyZjFiNjZhIDEwMDY0NA0K
PiA+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaA0KPiA+ICsrKyBiL3hlbi9pbmNs
dWRlL3B1YmxpYy9zeXNjdGwuaA0KPiA+IEBAIC0zMDgsNiArMzA4LDEwIEBAIHN0cnVjdCB4ZW5f
b25kZW1hbmQgew0KPiA+DQo+ID4gIHN0cnVjdCB4ZW5fY3BwY19wYXJhIHsNCj4gPiAgICAgIC8q
IE9VVCAqLw0KPiA+ICsjZGVmaW5lIFhFTl9TWVNDVExfQ1BQQ19WRU5ET1JfSFdQICAgICAgMQ0K
PiA+ICsjZGVmaW5lIFhFTl9TWVNDVExfQ1BQQ19WRU5ET1JfQU1EICAgICAgMg0KPiA+ICsjZGVm
aW5lIFhFTl9TWVNDVExfQ1BQQ19WRU5ET1JfQU1EX0VQUCAgMw0KPiA+ICsgICAgdWludDhfdCB2
ZW5kb3I7DQo+ID4gICAgICAvKiBhY3Rpdml0eV93aW5kb3cgc3VwcG9ydGVkIGlmIHNldCAqLyAg
I2RlZmluZQ0KPiA+IFhFTl9TWVNDVExfQ1BQQ19GRUFUX0FDVF9XSU5ET1cgICgxIDw8IDApDQo+
ID4gICAgICB1aW50MzJfdCBmZWF0dXJlczsgLyogYml0IGZsYWdzIGZvciBmZWF0dXJlcyAqLw0K
PiA+DQo+ID4gYGBgDQo+ID4gQSBuZXcgdmVuZG9yIGZpbGVkIGluIHN0cnVjdCB4ZW5fY3BwY19w
YXJhIGNvdWxkIGhlbHAgdXMgZGlmZmVyIHRoZSB1bmRlcmx5aW5nDQo+IGltcGxlbWVudGF0aW9u
Lg0KPiA+IE9yIGFueSBiZXR0ZXIgc3VnZ2VzdGlvbnM/DQo+DQo+IFdlbGwsIGlmIHlvdSBzZXQg
aHdfYXV0byBmaXJzdCwgdGhlbiB5b3UgY2FuIHVzZSB0aGF0IHZhcmlhYmxlIHBsdXMgb25lIG1v
cmUgc3RyY21wKCkNCj4gdG8gc2V0IGNwcGNfbW9kZS4NCj4NCj4gSmFuDQo=

