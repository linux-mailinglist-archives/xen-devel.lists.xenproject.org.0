Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75C9ACB9C1
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 18:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003686.1383287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8Cr-0002EV-CT; Mon, 02 Jun 2025 16:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003686.1383287; Mon, 02 Jun 2025 16:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8Cr-0002CN-9i; Mon, 02 Jun 2025 16:40:13 +0000
Received: by outflank-mailman (input) for mailman id 1003686;
 Mon, 02 Jun 2025 16:40:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EKJP=YR=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uM8Cq-0002AB-CO
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 16:40:12 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2413::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 405fe94b-3fd0-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 18:40:11 +0200 (CEST)
Received: from SJ0PR03CA0126.namprd03.prod.outlook.com (2603:10b6:a03:33c::11)
 by SN7PR12MB7854.namprd12.prod.outlook.com (2603:10b6:806:32b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Mon, 2 Jun
 2025 16:40:08 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:a03:33c:cafe::7d) by SJ0PR03CA0126.outlook.office365.com
 (2603:10b6:a03:33c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Mon,
 2 Jun 2025 16:40:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Mon, 2 Jun 2025 16:40:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 11:40:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 11:40:05 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Jun 2025 11:40:05 -0500
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
X-Inumbo-ID: 405fe94b-3fd0-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXzH5qATohfJvDhwr1ER5SWkh4U0/FJ9rPGOPPZwNDrhG/6eQeLEElkeX4/Mkyyam/XdGmH8+2iHhVmPHApcMkN8QtOJaAzkjw+W8s5JhU6AnmPSb+S63+cVLei5uBmQEzJTm6ufttyDVmNiIjojqYRVwGiXbsaG9GGkMZ/Vf9spaZmsSzZ3VgDG4f/BApevczkELaRdOsvkqbnWU48KwHNS2rF3inF665WB/wZlSqEUKwSPAJFxWyo3q8Gq0lM7JV9tUnJ3blfTiLy2DDnM1Hg+8a/n5KNTE4Oyrr3QHwebsB7MS9l8XiF0xE+aYNcIkxNJHxH0AfhWv6rBRtd6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDdKz5+HTZX2WoZC+WW4sTbm2S/2Jml6w9rzHsFx4YU=;
 b=LrNHmkBmITLuI6P/qfxuZ9UFO4bZYZ06xjr9VBRZs32xF4AYF5471QnWT7KqyIRRENiibrI14EGRcRuyVlrR72MkmzKBzSS9yYqUkFC0d8Lq2PVCxDJlNBQCju8qfP0OEX0k/Mo0r44PKEInfjeVYIoZj88xyUTkO5U1a4AFqGkQ7HQh+DcN+2WNFd0igbe/L0EkSwfpLr2NHSU+nAjCq93Zxnm56owWvRj0K0u2v1Q8y9J6F0xHmyd6DENN8IWmRreJ1oxvNe6OSAK98r31PVpZhv3WtJFB/ZCr01yHbA1xstcGGNccRvcWZSGBMxQb5SmRQ1qZEGznQs+uNOr8cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDdKz5+HTZX2WoZC+WW4sTbm2S/2Jml6w9rzHsFx4YU=;
 b=ZIzMrAWg3rSGo0hswLJcluv9UhG4eutFqFWym9GRHs2mVKL2Q9vpmc2qUI5JiKM3oT5xuQeSRifVk/IslTePdiT/kItj9Jdkz2sl+jWt+9DrBT0NkuTpn5qxy5wV8ab57B/ucNDyMUdipvumVhQG00sM3uFlJ73zwax8lclvzIo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a2d67333-fe69-45e2-93c6-2f468915b225@amd.com>
Date: Mon, 2 Jun 2025 12:40:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] x86: Add missing pci_dev forward declaration in
 asm/pci.h
To: Alejandro Vallejo <agarciav@amd.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-3-agarciav@amd.com>
 <9b5a1599-d8dc-423d-b144-90bfe33cdae9@amd.com>
 <DAC3CVFT8BOJ.14O7AZHYMIEQE@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <DAC3CVFT8BOJ.14O7AZHYMIEQE@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|SN7PR12MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: e8578d7c-26d3-4947-9240-08dda1f42204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTEvTEd3UG1Vc2NlZ2FycGhLLzBwNHVSckwxalJwTzRuWUlDQmlCRHhYWkk1?=
 =?utf-8?B?RFA1VG1lK3ZSUE5LdkhCaWkxMFBqK3FXa0lCR2tlZTMwcjFIRDh4bW9XN216?=
 =?utf-8?B?QStvVGF5d1VhaFh3YUlOU05tQ0M4c3hEZDRteDUyaXlPeVg1N0UrK0g0S3ZH?=
 =?utf-8?B?VGMvNGFWUHJEQm4yNHhrVXZLaXZ3ZmxmUFplWnB6S3Nwd2xPeHg2bk1DWUpY?=
 =?utf-8?B?TDNqU3FhRGJNYzVqQWgwMFpub2o0SXorb2tvYUhzUk5IdTcrSG95RE1LVm1W?=
 =?utf-8?B?Tml2MXNMVHBQQ2xTKzd1ZHdiQ3dROWU3STFzNGlkaitaN1pucFRiajFCTm9Y?=
 =?utf-8?B?ajdMYTVuOVRzYzgvRGlvbDhBNmtUNnlTcFo4SVh5YVJ4ZlJFVHRJNUxjQ2dD?=
 =?utf-8?B?SC9wTVMvQWlBeURrY3c2ZU9FRXBzSkFuaGgzOG50SlhFaEZadWcrZHBnYjA2?=
 =?utf-8?B?akZDRFhaYm4reEF0VkFENVd1VklnWXZTSGV0Tzh2WjN5UWhETWR3MXQ4NDdI?=
 =?utf-8?B?N1JpRFEyekQ3WE5yUUtxNUhQWEVsejhkL2dMNktsMElkcDJzS2h5Vks3Zkdo?=
 =?utf-8?B?SWlwMzdpeXNZMldjdmdWY0RJOWpaTWYrY01SNTlycFRoUVYwNEdzRHpKc2U0?=
 =?utf-8?B?bG5JM2VhSzVtZU1EK0k5TDhYaC9GWHNXalNNNzZwSjNsOXQ1eTdkdTJuRHZ4?=
 =?utf-8?B?NGxQVU1BeCtpR3hCQVY2cFcvNnBmcXVnTUJneU05Y3BPWTdCOC9OWDdXODZm?=
 =?utf-8?B?UnhUb2FjMVBnNWVwNWt5NTVBSVFYUVN5dkpaa1A3SWk0VTFYendxdURHZFhW?=
 =?utf-8?B?Y2l0VXJ5QnBaOHVPVW5iSGlnWE9YQ0V3dXltN3ZLWUc0QXo2UndqNS9TNzNK?=
 =?utf-8?B?NHFJT1JlVjZFSkFnUDM5Qy9wbnV2bXZmaEZud0hTZGI5YUI0ZzBqczBQaHZv?=
 =?utf-8?B?dlA4SEdLamQ4TXlrY1NkWis3RjYrM2J5azlpdUJyTjAreG85WjcrOXdpSURL?=
 =?utf-8?B?TUxJSnVLcDBxUk1TV2VLaFZuSWczZzNodG4ydDFtZER6emlEaUd0Zk0xSUxk?=
 =?utf-8?B?UUdPUDhVbmhnQ2xUNjdBMUtiUnpIWGdEMnFjWXZCbTlYdnVaRXpIdVh5WnlC?=
 =?utf-8?B?emQ5NUtjNlFSTDhtTWJIL2VvNUhTUHJEazh2TGsxMlBSMm0zSzR4aW1JQnBN?=
 =?utf-8?B?NGpwd0tma29ZTnU1eWJlOG9mZ3VIQ0xKdm1yTHlQK09TRDVmYnVqeEJXYXJw?=
 =?utf-8?B?QXBYbzdEWVZPYmhjbDltbU1naWtiZy9Mb1hSSE1RY0hFR2JTNnhOS3RpeEpM?=
 =?utf-8?B?ZHpwMUdrYzFhQndiWjhuQ1Yxc0ZNdkZHT3hoa2ZsS2lodEYrSHg1Tk1qWjk5?=
 =?utf-8?B?NUIrN3ZHVG1DWmZMK24rMEREYnN6Z3EvM2swTU9pelNSbHNLYzVGMGlDd1dV?=
 =?utf-8?B?NHc4RU92RGVORlZkT2lOcXlBOFdHQ1hjWXNUb0U1NTVPS2ZtcllmN2lNLzl4?=
 =?utf-8?B?Y20vNHZmZDhxQkR0UDJpbXpELzJ3aWRjUnlJWlluTWRJTHgrK2N0N1pFdTBT?=
 =?utf-8?B?bldBV25FV2tyY2dseWFSeVBGb2MxRnY1dkRGa2tuRmFtWHdkZkZ2Lzh1Z3Q3?=
 =?utf-8?B?Y3A4VzBxdFhwS29VbnRHSkRURGdVQkNBL09uL0VBbFdHUGRVanZlNjYrcDRz?=
 =?utf-8?B?U09Nc21pL0E5b3NhbTlCcXkzMlgvOUpMUi9Gd0dXWWlQdEgyQWhLbFY4VjRh?=
 =?utf-8?B?N05zOXpYTVd0dm13R3F0Zmw4Z29pQ1p3dFdES2tUV2dVeGZLQVk0SC8zekJ1?=
 =?utf-8?B?MVd2Y3RzL0V2TWRKeExsbmNIV0ZsckNVMFlRUWhUTEdhQmlrVTU5QVFrRFdu?=
 =?utf-8?B?ajdVQmM0MjlqK1NtOXNtcU9acUdmUER1alVtZ2oyd01jNG5UNDdOYVlHekRV?=
 =?utf-8?B?NktMQzFtOURzVHBHb0ZGaUllREdQQTZQVHZQak02a2NMSHhwWkR6VTlXRU4w?=
 =?utf-8?B?RU85eGZZeXlrMVFFTzhqaTNDaWhNcERoRkJOSkp0bUt5SjJwK2VjeVdtSlVr?=
 =?utf-8?Q?QvK0me?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 16:40:06.9827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8578d7c-26d3-4947-9240-08dda1f42204
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7854

On 2025-06-02 09:45, Alejandro Vallejo wrote:
> On Fri May 30, 2025 at 11:04 PM CEST, Jason Andryuk wrote:
>> On 2025-05-30 08:02, Alejandro Vallejo wrote:
>>> Not a functional change.
>>>
>>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>>
>> Some sort of reason would be good in the commit message.
>>
>> "struct pci_dev is used in function prototypes within the header.  This
>> is in preparation for including (transitively) in device tree"?
> 
>>
>> ... I'm guessing that is why.  Stating  it would be better.
> 
> Yes, but I'm not sure the second part of that explanation is relevant. Unless
> specifically noted in the header, they are meant to stand by themselves when
> possible and not require preinclusion of something else (in this case, xen/pci.h).
> 
> This patch would still be relevant (imo) even if I wasn't using the header for
> anything.

Yes, this could be made as a totally independent clean up, and that 
would be fine.  If this is a prerequisite for some later change, I think 
it is useful to highlight it.  It would not otherwise be evident when 
looking at the history.  Because I haven't gotten farther into the 
series, I don't know if this patch is an independent cleanup or a 
prerequisite.

>>
>> With a suitable reason:
>>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Thanks,
> 
> Does this sound reasonable?
> 
>    struct pci_dev is used in function prototypes within the header, so it must
>    be forward declared for asm/pci.h not to depend on xen/pci.h being included
>    first.

Sure.  Or just:
struct pci_dev is used in function prototypes within the header, so this 
forward declaration makes it standalone.

My point is: we should explicitly state what the patch is trying to 
achieve.  It helps reviewers and future git history readers.

Regards,
Jason

