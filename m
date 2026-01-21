Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFo9E4WbcGlyYgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 10:25:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF3B5453E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 10:25:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209515.1521501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viUSg-0000i2-DV; Wed, 21 Jan 2026 09:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209515.1521501; Wed, 21 Jan 2026 09:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viUSg-0000fu-9g; Wed, 21 Jan 2026 09:25:14 +0000
Received: by outflank-mailman (input) for mailman id 1209515;
 Wed, 21 Jan 2026 09:25:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZBm=72=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viUSe-0000G0-JQ
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 09:25:12 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15722a0e-f6ab-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 10:25:12 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH5PR03MB7813.namprd03.prod.outlook.com (2603:10b6:610:211::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:25:08 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Wed, 21 Jan 2026
 09:25:08 +0000
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
X-Inumbo-ID: 15722a0e-f6ab-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlqGnG6NsyYX9eMkan5UlZCWuwR90AqqNTi+UPCl5bK4+plv9Oogw6qsCCVrksa4GLEJo9x7IUGOSu87bDWD9TwinrDLdVuLLtGY2zjinT7/+HuNCDpMK72D2ydJwI7H1YFMfiZIO3I00ZvGPyCHnvie25tUSlmVL1QM7rjglFTCJbXaBbKbQiyWQWWHoyXxHbY418Tk2QVrriycLxZdr8f/+aoSI1YESdXgIQS0eNbIcAI+/B9sglBH+75cdm1CsSm3XtOfhvWSjHOMXTEm7gWIAbmlF0PujJd3TylFtuAKPJWkSrNLp1fdp+H7amql4J6wJCXejlS+ONWBlRZ35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8r1lcbXfsVh1K6p3d0MIQfigTu3wxvHHlPVRDjCrEA=;
 b=t8Q1hYLGj90hktHDxYh04WFqNctF+sNzVgJ1RsJt/W8qRZIu28YA5TUMoanFLwTRV/+wFluBTKkqiGlcwB04TQCabQZXpllm7D4xQn3BzYFv+kScP3k7KOF07FI6MO/wwd8baIwZPbRhZulkyPgjKI6/UWiTOO73rYvokIuv5orXxvZ1/nx+LnytZ5maKjdTBkW2EMH/GH5yyiL4CcwvMNu5c68KWUsVP7jUbe2xy5JPFAIaRbnaHCiKnbcai/kzZoG2dLHcVzZXaPaAd8HWPRG2l1uuw33tUyHKKWyx8gWZa8gfCu8BXvZT5TohJr0u3oibds9NfAtD4TL0T8VPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8r1lcbXfsVh1K6p3d0MIQfigTu3wxvHHlPVRDjCrEA=;
 b=nV2BD7jMCqQtI0rqZrgMrnS+kqSrjElnZ76CjMB3O7TPnqMfld4vUEJHX807gOoEXDoKux33JNAN7BsLu8GxoqfMp8IfldSdtAUYXQwtWNNwOYUeDsBDA4iIOcW3/uCQZlxWVDaFhWIa75LtzEwKQerbjsTN7C8v3AT1EZ7laAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 21 Jan 2026 10:25:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [RESEND PATCH v12 3/3] vpci/msix: Implement cleanup function for
 MSI-X
Message-ID: <aXCbcbedaXpsM1HW@Mac.lan>
References: <20251208081815.3105930-1-Jiqian.Chen@amd.com>
 <20251208081815.3105930-4-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251208081815.3105930-4-Jiqian.Chen@amd.com>
X-ClientProxiedBy: MA3P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH5PR03MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4e5ba1-4ffb-4b0f-4711-08de58cef812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGwvZFNiYlNCNVhONlFDMkdJMHRuSDRMZkZrTHJ3MmV6MFhTTWFNVVByNjg0?=
 =?utf-8?B?Nis5TDYzUEJUMUllKzFiNmNTbFNuSklxa0NnbzB1VTdCeTVBNWEyN1Y5a2tn?=
 =?utf-8?B?aVpvcnI1SWdQd3h6TnJpQWhHem1WOFEzZmRTc1pQcHZXZ3hMYnJMVWpCLy96?=
 =?utf-8?B?MEh6bko1M3JlZmk5TmlUSzBpejFqbnMxanZTYXlNKzhXQytrczB1ZVpzOUc3?=
 =?utf-8?B?cE1ibWRMNWQ2NjBHQnAvTEdUbnZRRXNRekFxY0FoQW54dEljUVZCODRHQ01H?=
 =?utf-8?B?cXVCYzZOYUxnVi9Nclh6T1NSMFRBSTJ6ZFI2Y1RmYjl5WTRoakZWQTJBcHI0?=
 =?utf-8?B?Uk5BZU5mRDZjUVBjM0VGTTVxTEUwbFc3eFBDc2RwNW5qRHJVMnpKSUNtUFF4?=
 =?utf-8?B?MjJwUkQ5cHVuQWoyM04zREhCclRyUGRjL0FLR3prdTY4ZkNzbm1HVjlZZWVZ?=
 =?utf-8?B?SWhlRE5DZ29EZ3hzUGh2Y0cvZjFlV1VUNjh0UXVyMXJCREhuZHFNUkRjVEpw?=
 =?utf-8?B?eUVHdG93VVIvSGFwK2lTV014dERKYmcrUFBHT3VSY2pHMXBSNW02cllWRVMw?=
 =?utf-8?B?cVFvNlBodDE2L200R2J6TVkweTVKM3lZcGkrN3NlaXBMeFRZYzd4RnhGNy81?=
 =?utf-8?B?WDNpOEQwY1ZVUmlOMXNEclFhR2JJNVJDZHNYQVJJbUFEYmh1UXFFUW4wUExp?=
 =?utf-8?B?R0pBUngrWk1xbEhlUjlFeWNqUlhqd0NZemFrL1JUbk0wT0s4UkNaMFZWOTZX?=
 =?utf-8?B?d2tNT0dhanlXdVg0VTRjaGNZZDdVZWRWd2hWQVNYZjZEdDYvUkpaay9lOE5z?=
 =?utf-8?B?NTlKZXUyeVBxbWY2d1lHYnFQR3FlQk9LRmVvbGk0Rmp6WmZkTGI0RUxrN0Qw?=
 =?utf-8?B?QkNCUGNIVmprMzJnS3hZR0hSVlZiS283eS9iMHpzcWNEODZJVnV6elhmVnJl?=
 =?utf-8?B?NU03SzFiNGhwbEkvbHBQb0RLR2wwWUJlYjU3eE0zRk9VWmtHQ29hbHBONnRk?=
 =?utf-8?B?eUVUTUY1OVBmcmxWU053eXc4WHFUdUpaZVhaVzdiWWdacjNDY1REdVFyTXVX?=
 =?utf-8?B?ekNuQ29sS3ZMUXFQMEJJSFR5V3VwbEdpYWpkaUVVMkVDcmw4N0pXa2ZaNitX?=
 =?utf-8?B?ZVlMVW9pSlhDQXFTQUNPS1ExSG9iU3lvZVo5eHhaY0lBQWxFZmVQY1hDOTlu?=
 =?utf-8?B?OTA5Y2J0cFFYcGtpYXhvYkc3TGgxa2NMM1JvQmtNb0J0VmJTWU9VVVp2NEJv?=
 =?utf-8?B?VzJGbFE3RUhWWnFxNmg5N1R4aG5ZVzQrc29EWVhtQkVkRnE0US9xSnRhT1dm?=
 =?utf-8?B?L2YvR0JqUGlUSGR5UW9qYTF6MlFxVnBkcVRQbCtMMGtZWDE3bXdOMjROV0Qz?=
 =?utf-8?B?eVY4SUM1Mzc4SXlKMnB2cnR3UVJWQ2V6UnpLenNXSktRVkF3aWlia3dPcDQy?=
 =?utf-8?B?R01hNlY5d3lEY1FqanQ3VEVlY0tHRHJoQm53cXdlQWtIUkJIR1cvZmVlYUZa?=
 =?utf-8?B?UERUNkNvZmkzWkgvTzRmL2x4TGg3OHlFNy9FN0xyR1laSzdvOXVaN2ZOVXpT?=
 =?utf-8?B?dmJkWU4xZFNUMTlnUlQ0cndqdmhuK0dtSzZPVFNSblVkSWhNY1ZFZk8rUWxH?=
 =?utf-8?B?NTFubW1odHRWaDVHKzg1dEwrWWJkRnQ2R0RnQTQzVXhSYzZPbVJudlUyc0dY?=
 =?utf-8?B?U1N5d1BCditoYWxvRlY3N2VHTlQwOTZhTm55MUdzdlI5ZGJ3UUtVYksxbWlw?=
 =?utf-8?B?K2tvZEh6dlU3RFFZRDhBSnp6bnpVWDl5d1JTdEM4NjUxdG9kbkt5NEtCaFJS?=
 =?utf-8?B?bDEzZndkVXpOR1BRSit2bHlzYW1JU0NyQnBGMnhuUkZsRHQvL0tCREJ5a0tK?=
 =?utf-8?B?SW5IM0hTU3Y1TkVmQWZWb1ZSY3RlKzRXeHhhbTZiYklJcGJUWlRWUmhxdzF6?=
 =?utf-8?B?VEgwaEJVYk5IbkxjVkFJS3FjbE1yaWNCRnpYOU1aWGR0aWF1b21TWDhybWMx?=
 =?utf-8?B?bEs5c3VVNjJ1eUlGV01BZU9mbXdxTStsV1YxeDdxTTB3L2NSWTZmU3Z4Kzd0?=
 =?utf-8?B?MUNKZUR2NWtnemhSV01QOGlLZER2QUJINjNhdTJ0TE9DSlFzVDFyWExvL0VG?=
 =?utf-8?Q?0VaA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnV0MHUwNkhPZ0dJYVo2bHVWYnl1SkhlWkF6aEFXdmV3Q1A4Vy9obzdJS0kw?=
 =?utf-8?B?MldPWEU1Wmw1VnUzMkRmeERNUW03UllEcjl4SWNCUEdpNmFIbDAvMnJRZEJr?=
 =?utf-8?B?UklVWUVhdlh4dlhmT0kxQUVhcEJlMmtTKzROc0NIVlJoTWlYUXk3eTRpSWhv?=
 =?utf-8?B?QzZteHMwdUhURGsxTkpJVTF0dGZ0NEticlFaRzBVRlNsWm1QTHRCaUVnMnN4?=
 =?utf-8?B?WTl2YmhYMXNWeG9kMEJHdW40M2h6ZG5UV0c4MHpDU2ZtNTh4eVZNMGFZSW1v?=
 =?utf-8?B?SVNCUzdCS2R6VXNDNFhOUTVQQ2FtRzZ0a0ZrR0FCckZtVzBjUHR3TTdlZFpH?=
 =?utf-8?B?alYxQmtVTWVPeUhoQzkrcEFWOEJpRkwrb3pnb2hSL09MRXYvV3MzdmE4bGFt?=
 =?utf-8?B?QlFyZWUwYXdFdGlJSU9waUdZaFFudjBPSWVwcDZ0RWNnd1c0ZkJhbEtISE91?=
 =?utf-8?B?YlhjRU5peWEzSmduQlBKTjQ0RVkyUkxwWnFyc1RNZEQrRmYyZkhsY2ttVk9j?=
 =?utf-8?B?OEltejg3cnFLRnp0U1EzU1JSTWFVMjFCWStJb0swNm9IODk4Zm45UVFxTWxa?=
 =?utf-8?B?dGFxWXBKeDlnNmNVQXNWcWRSSFo4SXRnV090QVdveVlSZFVoeTBYa29VTTFO?=
 =?utf-8?B?OXRURGF5RVRwNWJvWVdmL1dGNHJGTFNZTmlFalBiYWtwS3EvMUlzYnI2SUJP?=
 =?utf-8?B?NVB4bS9QdkZRRmZwSTdza0ZwQml3QWtXbTlPeTRCNzN2VUQrMmJXaFNtZ1Bp?=
 =?utf-8?B?ZkthRVpoVVJ1bVFYdkFaczJ2SXlDUDMwWUJvYk1CWm1YVGhxNzlWNFR5R1g4?=
 =?utf-8?B?bkw4V013U3ljZjZzdkVFR3RIeFNFeWFMUDBqOFRBVzJKSW5IUjhnQThFMity?=
 =?utf-8?B?Vk94M0RvWURndVNtODExU0Z5eVRvU2JUK2VEMVI3SUxWOUF3YU9oL3ZuUm15?=
 =?utf-8?B?UUozb3hWM1B4ekFEM1IybjRyUFJwQ1R4WCtsdGhMYlZuaUx3TTdJakNzbmF1?=
 =?utf-8?B?aDhrZThoTTcxWnB4TTd6a0tTS3p5R0Zsc1JGUFNwZmhMMkZ3NXpHaVFNTkFW?=
 =?utf-8?B?THpkU2RtdHkvZVZvM3VjNTJDTXp3ZDg0Qms1ZERhWDBobGRkeFdKUUV6Snl2?=
 =?utf-8?B?cnJoZ3AzUmNXOXQxVFFTZVZPUTlRQ2xNaXYrd09vWFRqMTAwLzh5QXpFcGVi?=
 =?utf-8?B?eUxHSUlUU0NiTTVqSGNLRmxEYU9PZ2ExZGprUzA2UHJUZVZLRHNnTit3elJP?=
 =?utf-8?B?NURNZkxWK1A3N3lJbGdrc1pwNGZYVDJjcUdWL0t6MCtLam11ZEdjOXJqM3M2?=
 =?utf-8?B?M0M5aUZPbVBvM0dEelV2NktWSXluZ29YUVEzVU41SlBYNTZjYm0ycW1peFMx?=
 =?utf-8?B?bjZmb092MHVheFBTa1MrWllWcW5wQjd5WEJBWHZkWGZhbTk5UDl0NEVTZExo?=
 =?utf-8?B?VWYzTGVFUFpZcktXay9JK01obzJmd3BBMTRlMkFPTU9hQ05HQzBtOHAzb0lH?=
 =?utf-8?B?SU1SZVRKUGxvMUUvQndlNXcxWjVDcnJlOGEwaHcyQWhWMEEwd0ZzcUNWZFRl?=
 =?utf-8?B?MStMb0Y2VXJLYTFqNjRQY2dNVW1pU2xuNHlEZ2J2YnYvdE5EU2hjbnc0M1FT?=
 =?utf-8?B?Wm9SQjRtRWkwVThSNkJmamV6VVhXejRISnZpUEJsOEk1M0tnVVI5cHBRandu?=
 =?utf-8?B?OTVDaEVrSWdMK1RzSGdVOWVQT2RIT3VVOWEyNzlyRU5janBDcUUyS1FONVpG?=
 =?utf-8?B?eWlObDIxWFM4WHBrNkRvVldMM3JaMUNORGVGa3dIU0lhamI5Wk1OZ2phTmVB?=
 =?utf-8?B?ZVAxelNHMlVGMVAzNHRnV25kT3cvTG5BTkg4MmtKQnJXZFlVVmJZblNCOGpK?=
 =?utf-8?B?TnI2UDd2djBVWk9vdGVGRjhrTUNGOXNMWlIzc0NQa09KNUNpemUvRnhzeXVQ?=
 =?utf-8?B?ZzZGVmx6SzdyWGxYYTIvT1dyY1ZTLzhVaGJFTzRhcVN4Ty82cEMyMWJXUFRa?=
 =?utf-8?B?SUVGUmFxV256MkNSVDZDQUxIRENvcnpkSFhyc01CekRLbVdyK1BYWGhkaDdy?=
 =?utf-8?B?Ulk1bXV3TkVDOHVYRXhBZjdvQitNcFZCdzNhOTdMUmlVUWJBanJLNU85a0Rx?=
 =?utf-8?B?SWQva2VHOXQzVlVINGNFUkNScldsZ05SQlRQMndad3ZtNVY2ckQ2WFpSQUF3?=
 =?utf-8?B?OEwya1UzY1Q0emYzVElWOFRyem1wdGN5c2NxQkRpZGFPWWdNamxjdGpudWJ0?=
 =?utf-8?B?SUcvaWRTZGx2KzBCc0lMYVVHNFhLVzRXV20yVGpKWUtTRnJNUUQ0QXRmNVhL?=
 =?utf-8?B?QUZXRzdhbHFqa2lLcXpzYmdHdURmdVVFOEllVWsxRFowdDhiYVNEdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4e5ba1-4ffb-4b0f-4711-08de58cef812
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 09:25:08.3631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pv+IakyBM3zv0NYIQaATIorvmkjAK2qG3+UYAQEu3lygw3XIVm3vW7Ez0VyWlX+62F+Vw0PLHpgewiYKTG72w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7813
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Jiqian.Chen@amd.com,m:xen-devel@lists.xenproject.org,m:ray.huang@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,amd.com:email,Mac.lan:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AFF3B5453E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Dec 08, 2025 at 04:18:15PM +0800, Jiqian Chen wrote:
> When MSI-X initialization fails, vPCI hides the capability, but
> removing handlers and datas won't be performed until the device is
> deassigned. So, implement MSI-X cleanup hook that will be called
> to cleanup MSI-X related handlers and free it's associated data when
> initialization fails.
> 
> Since cleanup function of MSI-X is implemented, delete the open-code
> in vpci_deassign_device().
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v11->v12 changes:
> * In cleanup_msix(), move check "if ( !hide )" above vpci_remove_registers().
> * Remove the check "!pdev->msix_pos" since current callers already do that.
> 
> v10->v11 changes:
> * Move calling all cleanup hook in vpci_deassign_device() out of this patch.
> * Add hide parameter to cleanup_msix().
> * Check hide, if it is false, return directly instead of letting ctrl RO.
> 
> v9->v10 changes:
> * Call all cleanup hook in vpci_deassign_device() instead of cleanup_msix().
> 
> v8->v9 changes:
> * Modify commit message.
> * Call cleanup_msix() in vpci_deassign_device() to remove the open-code to cleanup msix datas.
> * In cleanup_msix(), move "list_del(&vpci->msix->next);" above for loop of iounmap msix tables.
> 
> v7->v8 changes:
> * Given the code in vpci_remove_registers() an error in the removal of
>   registers would likely imply memory corruption, at which point it's
>   best to fully disable the device. So, Rollback the last two modifications of v7.
> 
> v6->v7 changes:
> * Change the pointer parameter of cleanup_msix() to be const.
> * When vpci_remove_registers() in cleanup_msix() fails, not to return
>   directly, instead try to free msix and re-add ctrl handler.
> * Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msix in
>   init_msix() since we need that every handler realize that msix is NULL
>   when msix is freed but handlers are still in there.
> 
> v5->v6 changes:
> * Change the logic to add dummy handler when !vpci->msix in cleanup_msix().
> 
> v4->v5 changes:
> * Change definition "static void cleanup_msix" to "static int cf_check cleanup_msix"
>   since cleanup hook is changed to be int.
> * Add a read-only register for MSIX Control Register in the end of cleanup_msix().
> 
> v3->v4 changes:
> * Change function name from fini_msix() to cleanup_msix().
> * Change to use XFREE to free vpci->msix.
> * In cleanup function, change the sequence of check and remove action according to
>   init_msix().
> 
> v2->v3 changes:
> * Remove unnecessary clean operations in fini_msix().
> 
> v1->v2 changes:
> new patch.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/msix.c | 44 ++++++++++++++++++++++++++++++++++++++++-
>  xen/drivers/vpci/vpci.c |  8 --------
>  2 files changed, 43 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 032e471bb1c0..8dcf2cf9d598 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -656,6 +656,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> +static int cf_check cleanup_msix(const struct pci_dev *pdev, bool hide)
> +{
> +    int rc;
> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msix_pos = pdev->msix_pos;
> +
> +    if ( vpci->msix )
> +    {
> +        list_del(&vpci->msix->next);
> +        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
> +            if ( vpci->msix->table[i] )
> +                iounmap(vpci->msix->table[i]);
> +
> +        XFREE(vpci->msix);
> +    }
> +
> +    if ( !hide )
> +        return 0;
> +
> +    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);
> +        ASSERT_UNREACHABLE();
> +        return rc;
> +    }
> +
> +    /*
> +     * The driver may not traverse the capability list and think device
> +     * supports MSIX by default. So here let the control register of MSIX
> +     * be Read-Only is to ensure MSIX disabled.
> +     */
> +    rc = vpci_add_register(vpci, vpci_hw_read16, NULL,
> +                           msix_control_reg(msix_pos), 2, NULL);
> +    if ( rc )
> +        printk(XENLOG_ERR "%pd %pp: fail to add MSIX ctrl handler rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);

Like the previous patch, I don't think this last bit is relevant for
domUs?  Only the hardware domain needs to have the control register
explicitly handled.

I don't mind adjusting at commit if we agree.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

