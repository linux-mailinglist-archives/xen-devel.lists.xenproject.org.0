Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8CE97146D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 11:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794102.1202807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snb3A-0003Gy-5R; Mon, 09 Sep 2024 09:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794102.1202807; Mon, 09 Sep 2024 09:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snb3A-0003FG-2O; Mon, 09 Sep 2024 09:51:12 +0000
Received: by outflank-mailman (input) for mailman id 794102;
 Mon, 09 Sep 2024 09:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iu/=QH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1snb37-0003FA-S5
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 09:51:09 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2412::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07f68b43-6e91-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 11:51:05 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Mon, 9 Sep
 2024 09:51:01 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 09:51:00 +0000
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
X-Inumbo-ID: 07f68b43-6e91-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0hvM98KIEkkrjh/n42r59Ak7KZmgZfZksYqTy97bPmOg+hOBvqzfLeDYwlNfrFhQNsJbqHfcZd64QpoTKfM+bkLzSB7KiWg2bS3l6HiJNLmRzwx2J/BV2o2x22VuOd0rVy2lazPYXu2zUeiAdOIKDFHP1DHmJBRcXaa47rskZir+U6/9kQqXJldRXnWrOZFMj+6yP9ttlYzqsY7C5RW3vcAAhG4DHeSBrtX8Iz0dnog99M1hq9+L5uQai+vZqPLSQLau98GDtNKVRVB9VnQTy/+0R3QXrgCZA/Khe7GEEc2wgQMz3InpAJHAers1kjG/zfRc3AbMhDDD2JpxGSjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LinoPdkv3Gjk74/J1+/PkMyaZ/kqMmOPTuG9/LcszO8=;
 b=aE8IozAGiylP7WPuKbET/ZTckBAF7WJWNhHkMqaWondtlJlcXuOj/i8rUsx9hQ9MfwN8TX9utZsBNugcBclDiYG/lp0dRe2wAUV1z553bCKL5CnaFpuJFlKwL4hsnr0az4LI/8rupmom8KRmFjzqgxPDitj+9wJwbn0x8Fzc02YItWBa2yktZfB7B3xLJXY+t8HoNIpK5f3pO/phCuYq3iPKr+RyHxvv99VZ9WDV/YQCZs9dCwFnpq97MshA4nG47rCSie7g2E18Nznz5cnpFP9np+XagTlv0w6RS63JcGeUT+FwMt+WUCW3wqsheBFUdJo6H7kn+JOk6c6GVAF98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LinoPdkv3Gjk74/J1+/PkMyaZ/kqMmOPTuG9/LcszO8=;
 b=sMKdNst5qgY4ddwknrzrzID4gP4Lwps+eelpcEVVRGfGBdXlCb6WSILUni6lSTa2nsfO8gtrmzpAMAzUO9CHHK1+DCKzHxK5+DQ5XpUBQx+ew98mScPf3bbefROZh4uAGVOdaSMh0Rv+DJ3dB9Q4iP6A/nqS84QCg5OqqKmPb6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <880e0578-c27b-45d3-8ed6-91ad648fa735@amd.com>
Date: Mon, 9 Sep 2024 10:50:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add Assumption of Use (AOU)
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>
References: <20240906101318.1419954-1-ayan.kumar.halder@amd.com>
 <57632c2f-82e6-49bb-b989-e75c95070b03@xen.org>
 <46b9567e-d27c-467b-b21d-65d63b6cd1e2@amd.com>
 <5de31172-8319-4cd3-9486-a6992a5cdc22@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <5de31172-8319-4cd3-9486-a6992a5cdc22@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0312.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::20) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: cf844eca-a14e-46e7-53d9-08dcd0b4e920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVJvblhoVytudWxZODV1VndhM0hoaHBQcVhsRU02SUwrT0JrMXRwaEpUWWZ0?=
 =?utf-8?B?OWpjSVNObStYcUJwNEVUR1B1NXBuKzJVdS91RTc4WGZnS01jVXM5ZjNLOWdm?=
 =?utf-8?B?UVh2UHZxQlFmMVZyOWFSOUdQeWtNdC96dUhseko3WEtBMlVoYy82MGgrenVN?=
 =?utf-8?B?aXZvODNCTXBReUpSenVOVmFINkp6WlpQbEZ5MDZtNjF5bzZnakdpUXI0Q3NS?=
 =?utf-8?B?MzZ5ckUrUHJROG9uSzArS3JhZmxQQVVrbDh2Z1gyUU5Gc2ovWjVXVEdiVlpy?=
 =?utf-8?B?d2FaVzl2TEpIQ2ZSbE4vQnpzdUZsdEhlUmZyT0tvQzhtTHpHWm9HMGxnd0Nx?=
 =?utf-8?B?bEszYy9ZTld0bWdyVlRiU0F3S3lBWXpSa0ZiRC9PbjdPMmZXV2lDaWpRK2N1?=
 =?utf-8?B?bXVKakVCK2tnK216WnFjd0FDRzFUZlEvamV1bXNrQklpVmh6MDIxVXlZMTNJ?=
 =?utf-8?B?Z2Z3cUM2ZlYwQWd1WmFFRjNpckRQczA1K1dUbjB5Q0U3TkVhODEwSGw3TzNO?=
 =?utf-8?B?OFpucVl0WEdUdC92ZGQzS3Z2enBCRkJWQkFnRWpUa0VOUzdhaHY0aHRCVTk1?=
 =?utf-8?B?ek9JMXB0UnljOTEvSHpqOVpRYUQ1cnJCU3JjcWdYSWhPeGVPS2ZEcXovMG83?=
 =?utf-8?B?bHZtNEE2dGdzZVZQRFJ3c0hRMXNrWjU0dHFNSzNOUmhoZnRaUHJDYnRFY0Jp?=
 =?utf-8?B?L29ueHlVRjhiMkZEZi9wMHV6b1QxOGs4aExEV0k2RjNyejF3aU9QRFBGbFNo?=
 =?utf-8?B?dTBQcVR1WU9nc0o5TUtTYjVRdDV6T29jcXlXSFBrRXJrdEZPRzJqK0lmQitn?=
 =?utf-8?B?Q29YMGFkVitSeFdBUjlHVjllMW9iYVhaS0NLaVRtUnJXTmVUc3FxZDgxa3ZW?=
 =?utf-8?B?MWkvVWJremUxbEZod0s2RE5acDJvUm9CcWt1SHA4MDk4UGp5eEFQOFBmSDZs?=
 =?utf-8?B?eFExaFpVa3NuV2dqWVpTOVhLTGppWHR3bVh1cHJ4aXNUYThTU0d6bDFldTNV?=
 =?utf-8?B?d2xQU3owL3c2Z2REdkU4K0JzT0N0ZEFubC95c1Nud1N2NktXZFBXcjV2SHJL?=
 =?utf-8?B?LzRXMUtyNjgzMnErSU5iVy9aOTMxMG80V0x3Z3NsUUMwN3p0YTFSTnF6djh4?=
 =?utf-8?B?YzQ1N2JFb0U3dS9Jby9YU0Y0YUE5V2QzZ2lIbXlHTnl3NU5LTWdoQUhtT01R?=
 =?utf-8?B?ZFNrT2JtK1Mvekh0SWNhcXNKMmJ6YWNhLys0WXNvOVVXdTdza3FEN0hkenpu?=
 =?utf-8?B?NjdWdmtKb2pHMFRZVVVHcW53QnJlYVo3R0RVeXBnbWJ4MG10amI4aVdHMDlF?=
 =?utf-8?B?RkdaMWlCcGJNM25Yc3dSd2IwTXNyMG5xSm83a3NrMjFtVWt3d2RiRjN1MjZp?=
 =?utf-8?B?RmFkYjZtdlRneTBycGpyMGJQVWQ2bHdlSllxd3p4QWR6aDlrQlZtZThoVnhP?=
 =?utf-8?B?b2YvNHFpSmZjREVIamREREphREtBWDB3MnJkaVQzejBYbWxkejRaLzFJUFVV?=
 =?utf-8?B?WFgrNFlxajJRZDFsUHpJaXRKVDJzSlh6dTNaNUxESGpsSFdBODdmdDl2OEs1?=
 =?utf-8?B?VFpSakF0NURwaE5ySDhxMFdXZ3loWjJ5aWhDY0ZEYUxoRE8yWFRkN21KYllP?=
 =?utf-8?B?SHFCODFUdlFiU3NIeGgzRi9YQXUwc0FNSlpmNW5mcHpKRWhDaDk5M2Y2YVIr?=
 =?utf-8?B?ckFyOXBnNktITG1aRE5MUDIrTnlRSHNCNHhYdy9CbXpQKzVMWTIyMTVidWJS?=
 =?utf-8?Q?nCMyex7CH785yuIRqc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjZSUXA0RytnK0kreWsyRlpRbDJYcWlQNzVxMW9nbGpEbWxLWDluYzVhQ1gw?=
 =?utf-8?B?Y3pZZ0lzaXc0T0o3UXNsNi9lR01YeGdybVVzL2Jjb2N4S0tHM2JDVlpzclJN?=
 =?utf-8?B?NTdzWEpWTkVUZWFLNjRDU1FKbFhMODFsUUJaNGZmSU9xbEdCcDk4MVhzalR6?=
 =?utf-8?B?dHZsNGQvdHJxVldiWWVnS0xEMDVxTVVlTWo4MHZGMUEyYnRNTVkrRDUrZFRD?=
 =?utf-8?B?WjczZ0h1NUE4aUdyYlpUS1F0dldCdkZiR3BWNGE5dVExMnlySmpSNHlmNWE2?=
 =?utf-8?B?bGJZNFQxbE83WjVLZzhtckQyQWc2ckRNWkljcWF4SDJGRWd0eC9jeTZudXFt?=
 =?utf-8?B?UllGSG9NL3o2cWhid2p2YURLNjAxQTkwZENENDlJUGlPcFpEVmU2MzN2ditQ?=
 =?utf-8?B?N05YbDVSTk9US0xRN0grZk56SXFZRjB3L1d0SEE4c1ZQZ3ZzbUFBTmlvaC9T?=
 =?utf-8?B?MVUyTk1KYXpyWGJYaEMvQU11TVVyL1c3dmFNK2ZyMXQxc1lzRFE3cUh3RzEx?=
 =?utf-8?B?c2RLT1pSanR5VHhUSkl3NzN5OEpLRFNVd2p3WkI3eS9IbVNGZlFBY21ZVGl4?=
 =?utf-8?B?bzRpVmRvRVFVUFZibW1jMGdYZncwWFh5dnE4cWtUZ2hjZ1FvTW8vOElHTG1k?=
 =?utf-8?B?dXpJaVZsOEJoSnFzVGxlaU5mL2NPQkE2cjhxT0k3SUNiSFRxM1ZqTTExREd0?=
 =?utf-8?B?S2pyZUZoUkQ5MFRXZ0xETW5KQUplYUVOaDRNdS9qaksvZ2liTFhXNWc4MGNu?=
 =?utf-8?B?dDBoOFU3eFJkNVI4cmpyZ1pkV25TZExwZ3QwaVRLUjZDNWZNbUNnVWRtbHNG?=
 =?utf-8?B?QmNkSTh6MEpGNHRWVU1pZVJKOUFqMDlPSCtLaFV5cWQ1QTdEVVJLWlJrYzRJ?=
 =?utf-8?B?c1g1bENQR3ZvOUYxSkcrTUNDdHBrZHRPWkZnMDh4Z0FES3lkaGQzMm5sUnhu?=
 =?utf-8?B?Sk41VC94MnVNMmVxNFBHYWVtT3pTTGFWTVYrU3d1V3RQaElhdTBYcjVRTDhq?=
 =?utf-8?B?OFVIZ3VSRE12MWJ1ZGVVQVFhS1dtVm5JWW84a0QvL1Z4YzhtQzNCa0tTM0tt?=
 =?utf-8?B?WlFqYWpQQnBtMVBOOXhsUWRyLzFBWmJLKzhFT2lPZnJYZDdOaTBubUlsNGQ2?=
 =?utf-8?B?VUZZeDRFWXNGMS9KdEtrUzNjbnpqc3VwUlZKTWVvbDViUC9ZdXg3OHpEeTB2?=
 =?utf-8?B?UDdGOVI2TlF3bnM3N2NHZy9kYTBqNEFuNjYwZWxOUGpDWFgwVnF0VE5OSVNu?=
 =?utf-8?B?YlpRSkdHZkJmTkZmdVhudkhmWnUwVXZWV3FqUzZ0TjJSZUpCUThTN1JMZjlR?=
 =?utf-8?B?MmxMWEh1ZndMREZkbUhtdDk5OWVjc1dyZCtXemFsazVlUVVGNDN0SXU5UlpT?=
 =?utf-8?B?dXNBWmI5V2V5U2FmOHZydkZtTVlvck5UT08wQWUzVGcxYzMvRlVOSzBWS1JZ?=
 =?utf-8?B?d2RKd2xSK2IzRElYZUpRT0VCNHdTQXV3SlpjVVFkZElLRmZqaTZ1QUdDU0tF?=
 =?utf-8?B?b2FrNVc5NGdGL2NaY2NNVnpQdkF4RUxhRG1TZllubk5VTHJNU000R1ZFWUto?=
 =?utf-8?B?N2h1T0pXWTl0NUtuT2VTODRNQWxoOXozZnNzTHFEMldMdmJFZDU2MDZleXgz?=
 =?utf-8?B?NW5UWHUvcXh6dkl1aGlqNG1nUi9hcDZxZzlWbzdjR0M4YmxDN1YxbjR0RGU0?=
 =?utf-8?B?MHVxQW9PRlBFbmpPd01RQ3Y0cnVGQjVOM01JVUJNSXJkc0tSMG9vZXVlVW5u?=
 =?utf-8?B?c3VpajhLaFRaNHhCM1h1bnhXRnZHMDdWb3JxRythME1JWnRmRXhid3NmU2p2?=
 =?utf-8?B?R0wxb25FdGRvOVRjSHlSR2hjc3NCdzJHQ1ZXcUtnUVZobWJrUStGbnZheXF3?=
 =?utf-8?B?WFdEZVgrQnIxNWZkSFFBMVY0VTRYZVZMREtSR0hVRUpIOHhIUVZOcG1NY1Qz?=
 =?utf-8?B?czBXODVJRWY3VzlJYTFGWmJGek00TjMza0RHcUFtTklQTEVDV0FYL3lucllj?=
 =?utf-8?B?T2hqRC9VTjJZVFRBYW1JUVJqc2tsZDBRQXd0WXI1KytmQWZGcUNFbHBscE1U?=
 =?utf-8?B?UDgxcHJkcHU2NU11ZENBZS9FMlIrdDRFRmhKdVA3SU8yWjBNQkw1b2RNZ1gr?=
 =?utf-8?Q?O3L10EwPRWDDJT+sTzvOyHQwr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf844eca-a14e-46e7-53d9-08dcd0b4e920
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 09:51:00.6239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lq4439i9XwQ3qHkQoYKVJHmJAgCZUtNo249WwXBeI+cSiiPSomyhDjPsqPPA/5ONv8dQOjTDwHCmOMZZErI50w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604

Hi Julien,

On 09/09/2024 10:11, Julien Grall wrote:
>
>
> On 09/09/2024 09:56, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 08/09/2024 23:05, Julien Grall wrote:
>>>
>>>
>>> Hi Ayan,
>>>
>>> On 06/09/2024 11:13, Ayan Kumar Halder wrote:
>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>
>>>> AOU are the assumptions Xen relies on other components (eg 
>>>> platform, domains)
>>>
>>> Searching online, I think the abbrevition is AoU rather than AOU. This
>>> would also match how we abbreviate in Xen (IOW if we use a lower case
>>> letter from the expanded name, then the letter in the acronym is also
>>> lower case).
>>>
>>>> to fulfill its requirements. In our case, platform means a 
>>>> combination of
>>>> hardware, firmware and bootloader.
>>>>
>>>> We have defined AOU in the intro.rst and added AOU for the generic 
>>>> timer.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>>    .../reqs/design-reqs/arm64/generic-timer.rst  | 19 
>>>> +++++++++++++++++++
>>>>    docs/fusa/reqs/intro.rst                      | 10 ++++++++++
>>>>    2 files changed, 29 insertions(+)
>>>>
>>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst 
>>>> b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>> index f2a0cd7fb8..9df87cf4e0 100644
>>>> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>> @@ -116,6 +116,25 @@ Rationale:
>>>>
>>>>    Comments:
>>>>
>>>> +Covers:
>>>> + - `XenProd~emulated_timer~1`
>>>> +
>>>> +Assumption of Use on the Platform
>>>> +=================================
>>>> +
>>>> +Expose system timer frequency via register
>>>> +------------------------------------------
>>>> +
>>>> +`XenSwdgn~arm64_generic_timer_pf_program_cntfrq_el0~1`
>>>> +
>>>> +Description:
>>>> +Underlying platform shall ensure that CNTFRQ_EL0 register contains 
>>>> the system
>>>> +timer frequency.
>>>
>>> The wording in [1] (not yet merged) implies that CNTFRQ_EL0 may be
>> It is merged:
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=51ad2c57a2d21b583a5944a0dc21c709af022f3c 
>>
>>
>>> invalid. This seems to contradict the Assumption of Use. Can you 
>>> explain
>>> the difference?
>> The requirement you refer to is written from a domain perspective and 
>> is about Xen exposing the frequency
>> to domains via CNTFRQ and/or dt property. In case of a presence of dt 
>> property in the host dtb, Xen could for instance decide
>> to emulate CNTFRQ instead of relying on the domain to parse the dt at 
>> runtime.
>
> AFAICT, you can't trap CNTFRQ access. So what you suggest would not work.
>
>>
>> The AoU on the platform (hw/firmware/bootloader) is written from Xen 
>> perspective and is about the platform
>> exposing the correct frequency via register. This is Xen expected 
>> behavior on the platform. In other words, the platform should
>> expose the correct frequency via register.
>
> Xen is able to deal with broken CNTFRQ_EL0. 
Yes, this is correct if the user provides "clock-frequency" dt property.
> So I don't understand why we we would want to make an assumption that 
> it shall not be broken. What do you gain?

Refer 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml

```

Use of this property is strongly discouraged; fix your firmware unless 
absolutely impossible.

```

We wish to put the onus on the platform/firmware provider to program the 
register correctly. Otherwise, we will have to document it somewhere 
(may be safety manual) that User needs to provide the "clock-frequency" 
dt property.

We wish to put as little responsibility on the user as 
possible(especially when the dt documentation discourages it as well).

>
>
>>
>>
>>
>>>
>>>> +
>>>> +Rationale:
>>>
>>> This seems to be a bit odd to have an empty section. Can you explain 
>>> why?
>> That's the format we decided to go with. It's been documented in 
>> docs/fusa/reqs/intro.rst.
>> While AFAICT it is not strictly required for OFT, in the future we 
>> can decide to write our own parser to
>> present the requirements in a nicer form that OFT exporter. Then, it 
>> will be easier for use if each
>> requirement defines the same fields (I agree it's a matter of opinion 
>> but that's what we decided to use).
>
> So this is explaining why you decided to add a section "Rationale", 
> but this doesn't explain why you left it empty. Surely, if you write 
> an assumption, you want to explain why.

Agreed.

If you are fine with my rationale (explained before), I can put the 
exact same words.

- Ayan


