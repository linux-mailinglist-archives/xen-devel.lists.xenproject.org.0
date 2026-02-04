Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEieMsqAg2lHowMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 18:24:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30777EAF66
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 18:24:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221067.1529442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vngbF-0007WF-H3; Wed, 04 Feb 2026 17:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221067.1529442; Wed, 04 Feb 2026 17:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vngbF-0007Tc-Dr; Wed, 04 Feb 2026 17:23:33 +0000
Received: by outflank-mailman (input) for mailman id 1221067;
 Wed, 04 Feb 2026 17:23:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hC1S=AI=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vngbD-0007TW-QP
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 17:23:31 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38de4cc0-01ee-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 18:23:30 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5878.namprd03.prod.outlook.com (2603:10b6:510:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 17:23:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 17:23:26 +0000
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
X-Inumbo-ID: 38de4cc0-01ee-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZR2CCPf/OAXhoT7MymVnSiysu4EEBaF4pO2XFSrRWPZxEz420TDmfOZzKUw9CYResHBej3XlwJzZolIGrgZAcjPld7y3VF8y4uidSsZ9hwZ2NpR941J3KxmWVFgGnRk5lgOUyvhNC9oteMbusN0BfG9grK/LvDxd+1SygCgsEGyp2rN2ob/q1XIEao7L6qaRhczautV6RAhY94hpuFPP1YH6naVMrVPQjgbfvV4Y7nFdI56SjqfaBRPM7K3Ay5ESw2WNQCntfidtGnUU0jaun048MUehUXelez8jQ2Pf3MkaukicOJ2iRmSUEDJu7Ux3/Y8MvNnSXHn6j8LuRjzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BXqlLev5WPVpXjcTa/gCM6XN2IquK6h45/0g8cQeAE=;
 b=BuLe8hdGvDmpAtfF8/NgJgQdo76FcGrVV24uW/PXbFGzxnWm8OPZPKiCwQagIeE8t8skh5LCjaLfKE0HLH0wvbUossPOn8yW6YzBCIqChIMGnsQPBJpx5EZvPMZASBBoYsyiLTPMq2DpDN2FnyylU1srTBVAEY6eSpl8eHgN0cBjiKBsOeVpJiqbzBhujxycI5fpwhvWDy9HySGEou0UueiAUC2/MJQv7lpcU6kgWZ9CAOqfr4+6URjMOqYLKqGnF9YfNoCmNVmLNU1jfnfMxGRcLzXRPlYRciHcPxBAV1mPq+iBn0X0/7TATm5dgbyp9k+hy4/163CPPgddqJC5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BXqlLev5WPVpXjcTa/gCM6XN2IquK6h45/0g8cQeAE=;
 b=EpmN/UyzqHel2KEwkI1RXeIAp0HtbqlHV6iBQLX/mkhCRuyCm94ySXeB2jMYyx4U+wb7trgu3S9AGKNe47uAFs3CwWddc4OYLmili/0RJVz+aSROzgNcptIjDSR9u5FMVOz5uVXAyuEWuLIbqwI8OgelOkyGyThNVL5PbxpiwhE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3c3d3309-956e-463d-ba03-2e557e79fbab@citrix.com>
Date: Wed, 4 Feb 2026 17:23:21 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <cc8f0f84-fd5e-401c-ad71-ab5a10f21fa8@citrix.com> <aYNfVDgSgKCYd929@Mac.lan>
 <764e6a9f-8def-4f6e-8311-ef91b6c3886e@citrix.com>
 <a7ba4cfd-d452-48f4-99c8-a7c283facfd2@suse.com> <aYN54n8b1gYXYiTq@Mac.lan>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aYN54n8b1gYXYiTq@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: 88207535-59df-41ee-73d4-08de64121b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTBGL1Y3Nno4YjJ1V2M4OHI0NDdid1F3eVk3eEJDY0xRR0ZWWEtOSGJFbEVD?=
 =?utf-8?B?a2lOT2Jtb3NVQ2RqWE93MzgwOU5DK2dCb1psUXBrbmkxcE1iZEpWVkRtNE9P?=
 =?utf-8?B?TGNySTVVcWdxbTRXS0lXcGlnaER3UmR2cTJjYTJ6UkRlVkdBV3VxcjFDNGVv?=
 =?utf-8?B?RE1SZFcxR3ZJNXFLaFJzSzRwWmlMS1J3enZ4SW5rOE01L2toZDFPd1RpQ0Jq?=
 =?utf-8?B?dkdRZ281Qml1ZG8yUFVNdHVTdGtJb3pUR2UrRERmNTJHdklTMEZaM1QwTkY1?=
 =?utf-8?B?V0xkNUVKSkhDOHpYWmFIeFppb2pkNnpUYWFuL0l3N2ZrSmtDYWE3NlR3aUQ2?=
 =?utf-8?B?VnNOVEh2WUVGSTdGTUp5V3g3aHVheGgrN3hnclN6THdzZ0RIY1pUaGg1Nk5w?=
 =?utf-8?B?S1o3N3VwbGxRcXEwSmhUeDdjUmtWYzVkMHp4bStaZXM0ZS96RkZxaXRuL1VH?=
 =?utf-8?B?Ukd0d1lISCt5VWpWSVMvOGVDUTVpbmhUTDltM0tKNm5jUWxPcEYzY3pmeE9Q?=
 =?utf-8?B?ajc4cDBlVW92SFFEUXdCTXBKQ1I4K3R1ajRUZG12K2RqMDBhOHovUVl3bUJI?=
 =?utf-8?B?dFY4NEtiS3FmVzArT0ZyOUNxVEEvT0wzSVN6UU5TbXQxaVpOTE9zL2NraWVG?=
 =?utf-8?B?Y1p0N0xvQWgxb3JXcFE1WXhSV1dTcFBybHRTVnhuN2VHeVBjajFhaDRSdlBu?=
 =?utf-8?B?Q3REUlJ2TXdZcytqdkkxRGVHeEpDSGdSa1AzK0NpcXZGTTAvNHd2VWhKTlpF?=
 =?utf-8?B?SXd6ZFRNY2ZwUE1hbUJBTXJRdnJHb3N4TW1oM0dUY0o4b1lEREZ5ckphNU1L?=
 =?utf-8?B?eDNVNzJaQURwaEs4UDA3Y1E0SzR2bzBqMXI0K21vRkdpbDZVSEUyZDkwUkFv?=
 =?utf-8?B?VW14MUxlRDJyNXl4OFpqZHVzYkNyYkVibFV0NTFHNVpMK2pZNTJBK3lrQWJD?=
 =?utf-8?B?VDVlSnVhRFRFN1dQMUdBcTRNL2tyZTY1eGJBY2d5WG9ZQXJST21lRkR6dVVy?=
 =?utf-8?B?eGZGMUNCRWNpaVFMOERoTng2RVJpSGNYQTd5azhuSm90U0h4RWIvUGRKR1B0?=
 =?utf-8?B?M2VGMXdLN1FlM0FZQXFNTDYvU0RsZEJJd0tOb0RkRW83RnZLUVdFWGJEM1Nn?=
 =?utf-8?B?VXVyQThZSzFqVVZkRWpKUnY5WFpBZlFzSEpReHRibUxFeWRJZi9GeGZURWR1?=
 =?utf-8?B?eFZiNVcxQkdDWDc1c0hjYlp4L2hYbGFMeGNiNVVwSHc4MThSYndIaHAyWUY5?=
 =?utf-8?B?MkJlYm1paEp3REFWL1g1dk9IcjZxM2h5d0VpMjVsR29KbDRWZlphNEs3OWVP?=
 =?utf-8?B?dkp0dThTU1N5c0I2ZlBPMVRGS2ZUMFlwUkhNckxoTkU5cXBZRis5dmtTd29B?=
 =?utf-8?B?TzNJTWFMbGJCcjBod1kyQmdjQlRVaDY2SFVUTEJqK2x0cWNVSHhSdXZDUng5?=
 =?utf-8?B?WnpLd2hORkNDdlNGei9HUytjeWdza1hUL2VHUjBkV0FJTnIyUmFPeWR4K0Fy?=
 =?utf-8?B?TWFBTUNmUXhNanpQcGVZelU1UnJ0R3dYcVhoV25JS1NJdkdTRk1xcTVCckx0?=
 =?utf-8?B?NzRJb091N3FEdWV5K25PTlJndEV4SW9VbGd1bkpmaHhtTFJvSXl6WFhUQldo?=
 =?utf-8?B?VXhXOGxiS3ZJRWczaVkvWkNleFZPaSs4b1RBTmVXSGRDdXlSTmxOT0dKSEEv?=
 =?utf-8?B?QVdrMHE1SEE2cEFxRDJkSlpPZER5OGxWOWl6TDRkWEYyQklFMkg1Qm5lVmdq?=
 =?utf-8?B?cFlYQm5aRWdFaDNiVzVXK0t3M2lEU21GZ1Z3MnNlaGF4U3NSYzdqTTJmRm0y?=
 =?utf-8?B?VGxHMzhYUkxHWXgyOFVkdW90VEkvRjcrUGRkR0d0ZW1WUmdEK2VUZ2RKZ2Ri?=
 =?utf-8?B?L200NVY2VDJUUVNibE9ROVA2R3FpaUNScW9iZFc3c3lxc2IvMGpwZ3V2Zml4?=
 =?utf-8?B?RmJZU3h3OVBOYTVWZTdySUpSS3ZhY0NiaytVR2p6azErUUsvVUlCbjV6V1lm?=
 =?utf-8?B?KzJtbzU2TFYybkhjdTJ0cnRQYVIvWlIxWE9iQUtyTFRZZHRrcU5IcFNuMXV2?=
 =?utf-8?B?NW9LcU9UL2xzUW5vQ0JMR0hjdG5yRFJYN2dhenNRTzNoZThYM2tSaHFGMDNU?=
 =?utf-8?Q?QY8Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjZxWm14ejQ2QlJnVjNnbEJRc1lxRThZWEFLV3hmQmt1Tk5iRTNOemQwQmVU?=
 =?utf-8?B?NnhEUmZqaEtTajUvTXplZzRaTlVpRGgrWFp6ZVY5UUtyWU9SNWZwUE5Qbk9m?=
 =?utf-8?B?K2hxL2ZCTjh4WnFjT2VTSW1reDVBRHhEc0dGd3YyVGxkWVZ1U0hPOTZJd3Uv?=
 =?utf-8?B?NDl6Y3g5WGJ5MzNXaHNLcXl6OEsydFhRTG52dVovbGZNOG1oRkFhUjI0WlRW?=
 =?utf-8?B?YVNnQkViK2ZLNnRlTmp2WkZlRXRsaUozcUpCRHJ6bEdaOG04TEQvRGpRY2xo?=
 =?utf-8?B?eGdtcnI0aUVpNHFLZDY3N2RzSmNrWS9kMnhjQml4aElnenY2TkpUUEg4YnpQ?=
 =?utf-8?B?MXlHTnBNTDZ0djRYejlKTm1jemV5K1BuSFZ6MW12RjdXV3JLeEJhWFdpMExn?=
 =?utf-8?B?TnR3dUZCbXdZN1RiZ0ZsYTNDakRsS0lsRjFjOXdJMlBoTlZveCsvUTRNUlFT?=
 =?utf-8?B?eTExclNvMmV3Z0VBTFhPVE84Nnc4Qmd3TjJ5eG9aU2lkRkg4bWFjenhwL0x2?=
 =?utf-8?B?Y2YxV0RLR2VOaUUxQ2lrVXJyRW5OUVpGVCtXL2RlSVArMEV5V1lOaVBJbHBT?=
 =?utf-8?B?ci9JcHdEU3hHRm9wRDJEWnhZRVRkQjhHY1J4WGpHWENIbnBJUDRJQjBMTzN1?=
 =?utf-8?B?R1pNMWphZDVVaWFHcG1tZmljK3ZJbzMzMElxN1JlbFV4UDNSZWwvTEtTT2Vu?=
 =?utf-8?B?a3ZjQVNycnhJcXI3WHo2cE9Tc2p3QjFnazJOM3hHMmNZOEtCRjFUL3JUODRS?=
 =?utf-8?B?TC96alpqNWgyZFdJa25UWm1OVWhaZ1YyT0FZblZkRTN6SU5VSmdqL0ltdnhl?=
 =?utf-8?B?QUNpSmk1ZWF3bktEZkNBL0ZzY1RwVFd0WVdOYzh0dUFoZDEyNGczOUc0S0kz?=
 =?utf-8?B?THA0WktwMEM1TEd1bkptNkpBYVNLZUY0SDRtdEVjOE9yTjBzc3NCR0hjdXRZ?=
 =?utf-8?B?OFB6TkxlYmZTQ1FGaGlDU2JpVjBOSUo4b3ZuVks5RHl4OVVDR1B0K05Cdy9n?=
 =?utf-8?B?R3dhOTdPY0lqb1RmVGxqNzNwNDlRYURVK0JCY0h6a2ZDcXMzU0dGd2gyeGZP?=
 =?utf-8?B?WHIreG5FdHBZejYzRnJCTTlSL0oxbTFyWGRlZ2YrN2ZCampGakJxTXJLQm5o?=
 =?utf-8?B?QnBiNzlTcVNYa29WYys2K0NWc04yVVRRbzVsUUk2VE4rVUYxVXpzYVphNnlh?=
 =?utf-8?B?UnVWWHlUa1BCcnFtbjA4NXlxZ1ZTclhuRjhaaG9vbEdWYVdDdUVVTTZtZDJH?=
 =?utf-8?B?aW9LdWM4bUk5QU9VejJYaFZRa1JqUStOY1Vremp1YlVLUGkrbzBmcXRMSnJW?=
 =?utf-8?B?MXhLcnZyWTFldk9pWEJyM3oyU0RZcG01VVFYM0pBeDArWFZOQkc2UFUxR3Ft?=
 =?utf-8?B?WkFCZ1FzYUJoZXQxSXBObUdoTm03WmdyNWdJUG9yQjJlWVFNT0ZiMjJZd0VX?=
 =?utf-8?B?Z3VjdlNyS0hhUVpuY2Z2cG5oMFZpd3doMGFxWXNFR21mOXFPbUNiTytWbGw2?=
 =?utf-8?B?Si9oT3JOcnJvSkNqVnNPSXozaTd3ZEMxdjEyWnRMTEgvT2FqUjNwcEttWUtZ?=
 =?utf-8?B?anhlL2lHOXBxRUc3RktWR2J2TEFsTGU0VlJ3ZEk5Rk5sK2JmcFA1Y0dab3lC?=
 =?utf-8?B?MVhRc2FEM2IvTWRLcEcrakZUaGhTQVFCYk1UaEtpbldpZndqNm1LQ0I0Qk9j?=
 =?utf-8?B?YklwbklUeitSa1p6YlJCaDRFc3BFLzVROFYrOVhJRHA0TWdEM0ZISTRGWmZn?=
 =?utf-8?B?aTJYWUQ3N0x4L0pzRnlsMUc0SXI3TnhDSkxLa3hlaStscWkzcGpNR1VaUkN0?=
 =?utf-8?B?OGtMeTdjVWphWG9SY2E1K09sbm1RSkgvQ3lqbW5Edy9YeFd1WmNTQTlxQWJM?=
 =?utf-8?B?cUdEcEdSSHZ4czdCL0FMZk0wZHlpMitScWV3Qi9FMk5vMEltVE1Wcmx2M2xw?=
 =?utf-8?B?cXF3TllVUXZ6NzFPUmVCOVl5dnltSWVjeWdyN3lWUkRLSndWL0p2NGhHUmcx?=
 =?utf-8?B?WGhKSUpweHpzVUsyNm1yVkw3YS9KY25MYnluWmZhSkZCQmMwVEZOSHhUQnVB?=
 =?utf-8?B?WnU3cE12VmVSc2pTb081L1hLU2pRSVp0ZzNPcnZONVcya0l0Y240ODlzWVdk?=
 =?utf-8?B?ajYwZjhsS0c2YzNwNThsMGxPeVphbitsWUVDWjNjZjc2NFYxM3dhSGZ5Vmt6?=
 =?utf-8?B?a2tnR3dCMFYvL2VzRC82UGd5cnk0ZnFSK25LZVJobGpiYXRRRGI0RmFhZ0Y3?=
 =?utf-8?B?dXRzUy9UNmF3M0w0ZG5ZeU5nNzNlQ1ovNXVCUHlLWWR1eWk0MDJCVTI5V1pk?=
 =?utf-8?B?UWV3SmRMSTRiM2h2a0JZaXMxRituZXMwdjd5UWZVTUttUHBmK3p2Q2lwalIy?=
 =?utf-8?Q?GoJBtLBH6xvDo44T/4XX5mrtQ8eUMJASlW+v3M4B0HK9z?=
X-MS-Exchange-AntiSpam-MessageData-1: x5q7qdERypvKHMjaZTFIXaL3n+OJXNF+Ihk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88207535-59df-41ee-73d4-08de64121b65
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 17:23:26.5822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBug2ZtsEq6/lvop4LgMzMs/lqHhiiSPYNwF5cPtqPg1bK2lhS1kcNsRjXGGdh5IaE2NNmhM6k+MSKFmyZPjc5Z6I/ridPP83I7lxhTl17o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5878
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
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 30777EAF66
X-Rspamd-Action: no action

On 04/02/2026 4:54 pm, Roger Pau Monné wrote:
> On Wed, Feb 04, 2026 at 04:32:25PM +0100, Jan Beulich wrote:
>> On 04.02.2026 16:12, Andrew Cooper wrote:
>>> On 04/02/2026 3:01 pm, Roger Pau Monné wrote:
>>>>>> +        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
>>>>>> +        /* Ensure all references to the old shared_info page are dropped. */
>>>>>> +        for_each_vcpu( d, v )
>>>>>> +            vcpu_info_reset(v);
>>>>> switch_compat() can only occur on a domain with no memory.  How can we
>>>>> have outstanding references?
>>>> As Jan pointed out, it's not references, but stashed pointers to the
>>>> previous shared_info page.  I've used the wrong wording here.
>>> Yes, I saw that thread, but my question still stands.
>>>
>>> How can there be any this early in the domain's lifecycle?
>> Can't (aren't) vCPU-s added ahead of adding memory?
> At least on x86 when using xl/libxl the call to
> XEN_DOMCTL_set_address_size happens after the call to
> XEN_DOMCTL_max_vcpus, and the later calls vcpu_create() which sets the
> pointer into the shared_info page for legacy (< 32) vCPUs.

Geez, that disaster of an interface still has spike traps we're falling
foul of.

Please extend the comment to note the first 32 vcpu compatibility case.

But, combined with the format change (clear vs copy page), doesn't it
mean there's an existing bug here?

Even without moving the shared_info page, aren't the cached pointers
made wrong by switch_compat() ?

This is one area where we've got no XTF testing at all, and I probably
ought to see about fixing that.

~Andrew

