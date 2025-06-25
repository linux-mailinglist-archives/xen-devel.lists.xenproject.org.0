Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32C0AE779D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 08:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024360.1400251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUK4g-0008W5-AT; Wed, 25 Jun 2025 06:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024360.1400251; Wed, 25 Jun 2025 06:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUK4g-0008Te-6x; Wed, 25 Jun 2025 06:57:38 +0000
Received: by outflank-mailman (input) for mailman id 1024360;
 Wed, 25 Jun 2025 06:57:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxbR=ZI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uUK4e-0008TY-J1
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 06:57:36 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab9b36c3-5191-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 08:57:35 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB8361.namprd12.prod.outlook.com (2603:10b6:930:7b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 06:57:31 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 06:57:31 +0000
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
X-Inumbo-ID: ab9b36c3-5191-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHaxt0EsBnzpROHa5YK41CoaPP1MgtuwpbyOtKUGkrr4sck6kPgjJurzmDDGxXA1I451lrfQf0qL/ZjmK18of1cD++fvpuWV2f7XykgFp5KZMJGMain2lemIr1kF5EkXHhqE50BVpAViupPj6iaWqfgqksE9ahw8ndVq92qDTriOSO0ONh+am1Xum3JNqcke5qTTcLN1mHlmlgfu6MulD4IMlvlgrhh6QCJUqMmZkWZjf9pyR9FUCUCsLWu7Ex8bA6b7tRFLYhhbJK/qmCtWSUkGbxushylXVUPotQLzK7EzOrrQnXNGTwUdpKgfFsFBz8ykViYDJyay1GqyM9sPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvYenQp3ahDHYQWfOgVudhzSrs6/DFyVHKXFxpepVEE=;
 b=CIJmQUHOrxJknVMp6m80iheg7zHcqEGyHVUR85PXazyyWAS3DRbVXBMvwxqlkKEpLMn4ISweXh/So3hhCXOBJcQ/6e/N64Xfa6Xb04/LqvBdRr4qKSZfxtQkKcKAq0W38l9m019HhBzblwNG6FfaquMM/Jsf4Jsq4HdCNbrzaE12feJC96IUB63U6grOxNdqyi1ASHCXryaFTqjejiZPI8tSAe74PDW7gzxdgxQGcPpNz2tQsMal6B3AOddeKsSujCBwKxT8ta2Fba13ESHHK75RJcYhwjFRZvVFOWgGm/5qKXUdMqMStuSR/O+6LzBLC+pvt+krrjRHd2WRKtWoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvYenQp3ahDHYQWfOgVudhzSrs6/DFyVHKXFxpepVEE=;
 b=W2YmZDPiVhO46sR8QdXJy7GzilBm7LbKIPGHfFkhI9bMXEP64OLumX3muZ5h32nrDAHmDNRQEHXlltadtPO0KWCaDkuJzqABX1/RNTZVR+xHUhwiNGe9IcfaQ4MYeTAJ+3Z6LBSF3Xx9i/aTuFa3IeRobo1BVgYno5D6Ij1JBEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c88b9817-3976-4fb2-9f7b-d69092ce181d@amd.com>
Date: Wed, 25 Jun 2025 08:57:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/16] arm/vpl011: move DT node parsing to PL011
 emulator code
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-3-dmukhin@ford.com>
 <c0b76bb4-9330-4f54-8314-fa2c2efa8ee8@amd.com> <aFsfCuh9Xrkgxmml@kraken>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <aFsfCuh9Xrkgxmml@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c3de32-b126-4dcb-1f0e-08ddb3b58e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1hCd1lxK2ZXbzhQemszaVVKQ1ZaYXVreWxpTjFIbDAxQ0NYU0VWUzhiZGtj?=
 =?utf-8?B?SjNRWTJBZlREK3Njb3hQaUhwOGlXRHI5WnQwYk5HcWl6VTA0YStqaEtsRDdQ?=
 =?utf-8?B?Vklad3dzY1I0UzJ1SDF0Q0x3YzkrMUFnemFZRGRhTHExb1hDMEZZRGVydXgy?=
 =?utf-8?B?TEN1bjZnd1FSVkE1dktzVTlHcFVnYUVUM0d4VnVzWWYxcXB2MU9kYUVVTEp0?=
 =?utf-8?B?VVpaWldFL0dqektoTndYdTdWTVUzckhYTjR3WDk3MWE1R3lJQ2tMVWZiTEtU?=
 =?utf-8?B?eW1VdjI1bEd5VEN2Vi9zcFdGdDgzWk93c2hOVWNmRUJLTW5mVFZDak1OT3A4?=
 =?utf-8?B?R3J2a1RjUC8rK21VcUFWeGpuV2RxOUhMbzIxRmhyM0xFcVhuQko0OGlNMDhM?=
 =?utf-8?B?dG5DWXdVVlJBTFQ3cThETGRvRTRkK1BxTjAzTVROQURFVDJhWTJQV3lPNE9w?=
 =?utf-8?B?d3hCWmt0eDhBLyt3NG9wWndqV1AvWnp4REdsK0UyYU8xdm42Q1B5WVRHWm1l?=
 =?utf-8?B?YUxBL2tnRG5hRWdZZU9ybW9WRmJWK0FpOXdiZFdpNWdUejV2RGtJakgrUlF5?=
 =?utf-8?B?T1dFMzNtckw5R1kzaHBOOUFKOU5OaVU2WjlwNzUvbHNnMUV3bDZ1eGZZNHRD?=
 =?utf-8?B?QW5CMERHZWUxTXhBdXdHQzFCZWF5WStuZVYzS2ZKNTduU3F0R1dYVjJSSGxj?=
 =?utf-8?B?eWZabzJqZHlUNVZNRisvcDh4V3BwbTZ2SFYyVktKUVdaYVh4OEJLVXBjeXNs?=
 =?utf-8?B?M0xxNHNEemxRTmwrUUhMQldJeFhVOGJCOFcxUkJtNDFpaDBoTDQvQVRhSENa?=
 =?utf-8?B?RU4vdTVpSU5sNElLazd3TmdLSGFNRzY5M3ZqOFdnZ2dHNXRHcXVhUDMwWFU5?=
 =?utf-8?B?UG5KNXBESStEVjVqeHpaV2FnT2o1Q0gvaGxGb2RDaFBlUWVKL0JhejczZVlz?=
 =?utf-8?B?UnY2djNvemdGY1ZBOXA1d2dMUWM4SHBMbkpBUHdEK0lGNGdlV1F0UEZnOFVa?=
 =?utf-8?B?eVl3bCtIbm9oOHlTWGhWdXRJR1NneHAwdUJVeGF4TFRYRVNyMEI4Zm1EQVBC?=
 =?utf-8?B?bXE0ZDQ0a0o0Wm9XU0pnNVcyZnVEd0VMVWZiZzI0cjcxTzhQZDk4U2FRRnZk?=
 =?utf-8?B?T3JzRmNteC9LcnlrOSt5ZHJ4ZFN2bk1GSklLY2g4Qm54aGNDdlhlK0xZOFN1?=
 =?utf-8?B?RmkzRUtKK2ZrOFUrajF5VUdacWhmMXRwaDlldkZFeXdnQjVkWktDanhqZEFI?=
 =?utf-8?B?bHd4Rytva2FhL0J5bDU0UmhUZ29OYTVNMFNhSy83bFJFb0ZvV20zRGRPWG5G?=
 =?utf-8?B?UXlKTTdPY0NrbWJTL283TWRvWkFSYkVvNWgwKzR6UjFxRG9mVWpMRnk5UmhD?=
 =?utf-8?B?WTNzUThlbEh6YU50UDdjYjVHWnVERDNHUU5KUWx6RlM5MXJGWU95aWNqenBB?=
 =?utf-8?B?MFNWeVFpYnBwYXl3bkYweE5lMVFhVEtvYTk1UDFQTjBEZDgyZ2RZcXR2VG15?=
 =?utf-8?B?N2ovenFKeVhwMmxSQ0wwNWFCdVRWa2dUc1ppa1p6NXRDenBzRkU2UmNJOUNK?=
 =?utf-8?B?OHZQdFZhQStYelprenBqdjZXMnR0QXIyWWVTaFBPVmJ0bXMvRTFQaFY3b3Jw?=
 =?utf-8?B?MGxwaFFHTHJjemcrVmc2ZnI5SFh5M043RlBhRWtyN2dWdmZwU3p1ekZKV1FF?=
 =?utf-8?B?cVU0NERjU2hzL3cwY1ltSmdMa1gyNWNpRHZEaGFBcWdvSTU3NDNEakk3dkJ0?=
 =?utf-8?B?bG0ybW5aYnQzejJLbFplci9mZXBwcjNKbE02OWdpM1RHSFNJNEhnUWFENTZ5?=
 =?utf-8?B?OTUvMW5jM0FCMVNhUG9TK3dPY0hzMisrS0Q4NUE1TEdpbllDS2krVDE5YkJF?=
 =?utf-8?B?T1pWcVBBbDdRakNNbUdyNDFoRm44d0FZeXBxcFJsM0JHREE5bUk3VlhMRFNN?=
 =?utf-8?Q?ZfZ9xidLFD0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mjk0QXFibXAxWlZYb0xnZXM0YVhIN3p3MnN1dkUxWkkvK0YyMkRvaTU2MHVj?=
 =?utf-8?B?Z0s0dEo2WHQ2MU52MW1xY3BBb1VzTnhHblVaa3FxY0p5UDlWNUd3aVlWS0hH?=
 =?utf-8?B?QThzM3pSTnZTMTRHN2t5SlVSeDh1MnhKRzlGZnN6Y21LYjR3OHgvVmdzMzFX?=
 =?utf-8?B?MDdXSkpCMUYyRGoveHVReDdieUd2aGNuUFFhaXFEQmQ0aFVFVjhLTTVOWHdv?=
 =?utf-8?B?bCtMSTBxMk5IZFpTZlRuRHJNVkF0UjdQUzJSQUJCbVlqTFhidGNIT3ljSy9p?=
 =?utf-8?B?MDZsczhKWUNqS1ZLTmd1NjYvdWxKT241QXdKQkJES1lMbmhsWUppTkJPeHM1?=
 =?utf-8?B?TE0rMHFWUE5kVkV4WUN2Z09GOS9WVGFyb1lrYWJzOEdCbFZyVmw3MWhXeWE4?=
 =?utf-8?B?LzlRNUEzR1lZV2lOc1N6d2xvV3ZPQ0x0aDkya1puNHJBekNQVzJnVENLcWVs?=
 =?utf-8?B?WmNMSlAzZjZLMkt5aXpEcTdXQ29pL3lQdWdrb25iM2JHWSt6cFdMV0xzMmh0?=
 =?utf-8?B?TUtTeXFuVGNaNWUvM28rSURyT1RjUENrNm50M0QzTEFCcFU3MmlIa1JSMVI4?=
 =?utf-8?B?MFZ1QjlEVW9DM1RhYUZuUHUvWkdUaDliTlAyb0dickw0WGI4bloyWU9SaWx6?=
 =?utf-8?B?NlkrbnBJZUJXQW1vaFhCb2IydXFTa0hiNUVjYXZTdS82Nkcva3RGa0Njdk5r?=
 =?utf-8?B?Zmw5WHhWRFo2dWI2NHB4ZWJLUHJOT2ZlSW1nRmk0MzVveDBJZU9URU1zOUZJ?=
 =?utf-8?B?MWx2TDdnUGVEeXVZaGppRk1JM3U2dmF0OStXRUkwWFMrZ3M1RjBzai9mWVZV?=
 =?utf-8?B?cVkzNUlNa3JYYWVzVlpFN1dleW5uWVlvdkNFa0dPa1BsS0tkZU1qeHQ2UVJz?=
 =?utf-8?B?Z1c3VXFLc0FYTU9SLzdTeGlmWWhJRUFETFJiV1dzQStMK2taZHJVOVBQNzI2?=
 =?utf-8?B?TCtpdTNGUVBSNGFQVHBmUi9GZ1VHcXJYNmprMFFpV0dQMmJlbll3UDQ1eXRx?=
 =?utf-8?B?OTBLNmhwRHV4OERTVWZLUFVXZEtqYVpFMk1kRElZUUFQNzhyMFBGeVVCcEpB?=
 =?utf-8?B?UDc0K3ZaVlk0YjB2ZW41K1Ywc3V2ZUFyY1VDODlKb3BhVzlXYW5JQTM4MUs0?=
 =?utf-8?B?S0Yvb0lvUFpnMkFXNDZxRERxM29IYnU0Ym5XaEFEV3pMMS9ZcytQNE9acjlR?=
 =?utf-8?B?dlVHYzVxNzFkc0VKekJuNUczbnZMSmR0SHFvSk9YRHNycEJFWEN6a1dNTVJJ?=
 =?utf-8?B?ZTdyS3NxN2Z6Si8zOHZGWHk1d1hVV25BTFoxWURnbEYwVlZSdmwrSmRtWGpJ?=
 =?utf-8?B?U0x2RDZBU2pTOXYzZDZldFZDbGFNbytwRTMvMUE2ZE93K3dtVXRVMm9aTHI0?=
 =?utf-8?B?ZXMxYVFvT1BjaWVQZ1lmWVBNZWE0NVpyNStlYXg2a3AxWHhycWFxV3NzU1U0?=
 =?utf-8?B?QlFCeGlwbUI2V2hHV2FYbnVDUlR1OG4wVU9DOVVIbVZEUzc1bDR1cUIrYjg5?=
 =?utf-8?B?QklJYWIyYTNZUWhSNHJ4cFZFYkhjcy8xVHdvb2JoOXBCT2NDTGZoQWlrUmgw?=
 =?utf-8?B?VS9hcU5ZTVNmR004cDBXZkZ3cFFiR1c1STBiNWpSbzIxbDdsZVc0ZFphbjNG?=
 =?utf-8?B?cGJidHc0dFNEaXZwdnd3VjZRQ3YzcVhTMk9ldGxQVUNsNldYQlRuRG4vT1hR?=
 =?utf-8?B?cmE4UGx1STYrK2RiUlZmaFRCY2dNU2xRU28vbTI4blo4ZERjL1VXSjRyVHNI?=
 =?utf-8?B?NkxrSkFjMVg5SzRMcGJtSkYzQlN4azducHA4eFpHSERBTkNGZndRK2xYUEU2?=
 =?utf-8?B?NHBGZjgxUUNyL0NQTjBJcFFQY0NodWlIV3NreUUzTExLb0t2Qm1iclIyMDMz?=
 =?utf-8?B?YjMzaStlek9GUGk0YzlrNlRiRTdGd1huN0pvME9OeGJCalRQdTdqSmVhc0xh?=
 =?utf-8?B?MWg1N1hoek1vVDA3Z2VxU0NqUkVhQUhUUkZlKzBBNnRTUVdSSFl4dGlNeWk0?=
 =?utf-8?B?NnFGQVNCWGx3d0RFSjlOVWlMZG8wVHlaL21PaUo2NXdUc0IyT3BiU2lDSnlm?=
 =?utf-8?B?OGlsZ24yaFNCV2dOTEZpSVcvdVFEYWczK3pGZkhmZWRuTWNZanF4a24yTndZ?=
 =?utf-8?Q?CFV1wTC3mcwnOB/ioiN83wDGo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c3de32-b126-4dcb-1f0e-08ddb3b58e1c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:57:31.5291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJ135IyMoYvlZBv1NKZcOBvdexM1mYPXzfFIfxPKvWUcHQ4qGKLJBR/NRKhmWYhT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8361



On 24/06/2025 23:56, dmkhn@proton.me wrote:
> On Tue, Jun 24, 2025 at 09:49:39AM +0200, Orzel, Michal wrote:
>>
>>
>> On 24/06/2025 05:55, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Move vpl011 DT node parsing from common Arm code to PL011 emulator code.
>> It's not parsing, it's DT node generation.
> 
> Oh, that's right, overlooked.
> Thanks, will update.
> 
>>
>> We usually keep all the DT node generation functions in one place. I'm not sure
>> if we want to move them to respective drivers (i.e. vpl011 to vpl011.c, gicv3 to
>> gicv3.c, etc.). Not sure what other maintainers think.
>>
>>>
>>> While doing it pick the generic name vuart_add_fwnode() for DT parser function
>> What 'fw' stands for? Firmware? This function creates DT node for domU, so it
>> should better be sth like vuart_add_dt_node().
> 
> 'fw' stands for 'firmware'.
> 
> It should be some generic name because the function will be used on x86 to
> generate to generate the guest ACPI tables.
I see but maybe vuart_add_node() would be a better choice here.

~Michal


