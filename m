Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192D7A49891
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 12:52:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898671.1307186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnyuG-0008Vd-EG; Fri, 28 Feb 2025 11:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898671.1307186; Fri, 28 Feb 2025 11:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnyuG-0008Te-An; Fri, 28 Feb 2025 11:51:52 +0000
Received: by outflank-mailman (input) for mailman id 898671;
 Fri, 28 Feb 2025 11:51:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3SU=VT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tnyuF-0008TF-Di
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 11:51:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2416::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61c70a85-f5ca-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 12:51:46 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH3PR12MB7618.namprd12.prod.outlook.com (2603:10b6:610:14c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 11:51:42 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 11:51:41 +0000
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
X-Inumbo-ID: 61c70a85-f5ca-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHXj5PGOwcRhrotrCjiJliaPaK8h5XMqFy6wx6yedWmmZR5+BvxQXjBWG1m2zh5IfewoVgW0MAaURHSt+Za83etW29P06SmgDT68UKsammehD6P/ZNYMmsQhywpvZ+0vmGn+1ipN8znxM7E6rBTNVW5veK40W2YNUWGk2UF3ZrDCAlTKHKLfpifYgiw9nd+Gcb8H7f4WCMTLWTPV7xJKcYgU4fS+PASToWqJo9+ghPnB0nyDookIHGfDaRz/PUD4YaDs8bxR9CAKCS6hPs6AVMjSEp5LgTg6OdXV0wx4ZYmJgUQQ68+h9G56Zkq+o6CFMV0myMfeObG/ibAcpPVU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs9bp+2I4ehPz+2540Tqe3/zX2wPsCl1d2fyZfdxzig=;
 b=cxs5tZhSBHQGhOS4AvK6irBMYj3ZSnCsEBt2TeDTZtObJlHY7dFexMeEtFKCleNWsW8K8/y8VhSvKPQtH34/IP9Bwmpmy7lT9J/Df7R9qIRYbhWb9ZcHE4fKKaqIecmaeDh2BHXHJGWYjy6QrosfkEehmcWjyd7sgLXjw2JOrVZBYI+pFO+7lx/tgDGHFvdUC1pnxOANaPmBsgrYJp2h+n19E3/ZvcWIk8Aowyci2as/2H4l0g5kfWG9ghcqVP9Z2IBJy4woU21TPD/FBYD/gzoy5vQYpXSNc2Q+0H33DDoa7h6GycBJmSVYnpAA2lLjqjNB/DSLWZdNhxuzqsA6nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vs9bp+2I4ehPz+2540Tqe3/zX2wPsCl1d2fyZfdxzig=;
 b=y67saoutPS510p+9+iT0+lyvGSvq64DrQjp6e5/aPE0auwutnQa2wHgLWkBx8EVAEwTF2vN7zSB597S3e5qvcRo/yaFbL/z6Fbcx2M+YsRbg2yTaQN1YjVY1ZdgGUgIOJ5UduLxhA20e1TwlSNRlLj4q7AGpFVm6bDyRxX6DM4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e1509155-5910-4c79-9046-7497da9f626e@amd.com>
Date: Fri, 28 Feb 2025 11:51:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
 <9e52cffd-6286-442b-88d7-06eb07de3213@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <9e52cffd-6286-442b-88d7-06eb07de3213@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JNAP275CA0038.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::9)
 To PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH3PR12MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: ab3b7c2a-137f-43e2-0a6c-08dd57ee4432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEVmYWFILzNmUHJuUE04dFdYSmRqL04rUzI3Sk43NWRqMTQrbW0wbHJxWVNU?=
 =?utf-8?B?Wjhxc09FTWVFZlJ2Q3VpMFgxTTI0Q1l6N25xa1R6Rjg3WG5vNWZ3OUJpeUht?=
 =?utf-8?B?aFpZR3hsTEpqRGZ6bzI5dkJma0haQ0FxZk5TSlNYSHpsNUVQZUM1UlRZRWdw?=
 =?utf-8?B?dE9tTUxtalMzV0I4ZDNUMTVLZE5WQjhHUDRPR1M4MFVtUUlNN1RhNHl2eWRs?=
 =?utf-8?B?L3lpWkU2azA1cUhmY2dGdlBoL01XUmdKM0xuaXJ4eWxyN2NkeHRveVVQYys3?=
 =?utf-8?B?dHVKVzFObysrT1g5ZGxTemRtSUxUQUhiSDBtT2oySS90R05DVjlaV1ZZTC9v?=
 =?utf-8?B?ZUdPTWVIMDk3dG5ybDBHWHlYZGo5T2I5MHJxTHlXalMvb3FFRXNySDNGdWxo?=
 =?utf-8?B?N1VUQVhrekUzK0cxcHBJUWdMdXd2Tm9SUkptZllBQWN6ZUdJYWpNMnNEeDVk?=
 =?utf-8?B?UThPYTFhM1JuMzZJMXBGYmFadmIxZFZiNG1YSDRia0d6RGdhMDRJWGgwRUt4?=
 =?utf-8?B?eWNMdHRWc0IyVFFFbmRPVFRHcnBWN20rZzF0UGg0QU9CcnlOYUZQQnZTZGtB?=
 =?utf-8?B?QVM3bnh1aVA5NGo3eUhuOXJkZ3BNWklWaXBIZG9wVVcrTklJQ2lVNmJvQXIy?=
 =?utf-8?B?UENGb053c05FYVYzNmFWTW4yOFBod3ZoU0NHanlKSlZhcmpEdHM1YSs1TUJu?=
 =?utf-8?B?bkxmdVA3eWdHRWU1bUdJUEoxR0piZUR3R3ByY29YM3ZsS3I0dzBidmFQajRD?=
 =?utf-8?B?dGdGWnlzaGVTbW44RTZ0ZVVHQ3pzNDdGR1EvaEdNSjR1TXEwUkJmMzMycm9B?=
 =?utf-8?B?U1lFMWc3UnRkVGMySWJtQXUyR21RRWQrUDZ6MEYyZEQ3WUlBVU1JbVA1bXU4?=
 =?utf-8?B?SXIwcFNJcGVVRFJCYjIveEdsMC82V2xTUjhLbXdEOE9oK1ZLNVYybHpLNnln?=
 =?utf-8?B?MUhBNDhKeHBFYVBDcFhKOW5qaE5yR3g0ZUdsWTRuUC94Q1ZreU5UR2lvTDhQ?=
 =?utf-8?B?U3ZzUEhtVCthNjVIamNmNDFDVG45QWFjbVUxNHAzWTJyOXY5cFc3L3JZWDhV?=
 =?utf-8?B?L0VaU09MdG1aVTN3S3pYVjgxZ0dnVnY0NitUOXhkREpmSGZvdHVLNlBrMkp0?=
 =?utf-8?B?eTUzeDNEUnJRSzByYjcvVW5EMkttdXRTREtWZVJxL0IrV3lSTnNJbEMrRkNY?=
 =?utf-8?B?UHpXaWlKemFob215eUlnOWs2eEJ3djlPOFVrbmM0UnhsWDJkcHFYTldGU01j?=
 =?utf-8?B?OU43VFRYNGZtMEt3VVRBZnVhY0krRSt1NHZNejBlM09TcmVjOTIxSFRyQnJU?=
 =?utf-8?B?cGo2ajloczJpVzM2YUlOWC9BQSsrS2RQUThheEdVUXVEa2dyMElTWVMzZzJS?=
 =?utf-8?B?VWRabVY0b1ZLQlV6OElPSXIvNmJLU3FYU3lKUGc0RVR2M1BJaTU1SXVaR1JI?=
 =?utf-8?B?dGJseS95bzN1ZE5xMkRlWklaYTQwTDE0ZmJlTWI0VzlnWEdsWU5sQUFKanZ4?=
 =?utf-8?B?cTVaSUJ0UU5RR2hLTDJxWjJ2YkRIeUpqNHFSSE41TnB6cHc5WjdFQU9PdC9W?=
 =?utf-8?B?Ly9lQXdscVdyYWErMzNFdGtGdVlOSDIvaytza1dFM3plMGhUUGYvdW90N20z?=
 =?utf-8?B?WmdRUmtsWlFVWkJyR2JkWlVob0p3dDI5aHI4ZnVKak1jOXQveFRDSzA5bVlY?=
 =?utf-8?B?aHBIajRHNmtYaXJUNG5qQW10Um9oVGsxVEo0MHpyamZuTU1KazViRDdQUjA4?=
 =?utf-8?B?d09mcFQ4dDhJbDE2YkNFWWFRYVR1QVJocEdSek1zUU52dFBMUUMwaDdqQ21Y?=
 =?utf-8?B?RDA4a1dMQTlRZ0YzcnBpZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmZFakp0QVRnbHUxa09zNHZoeEpqMUROYkljdjAxZEFyN0g1Z0NNL05QcDlF?=
 =?utf-8?B?dElLZUd0a0FKNnRNUjFwUCtzTDBzb1hwbHlkYjZ3RHBSTndTa2laY2twR0tu?=
 =?utf-8?B?TGhnQlp6MkFuYXFEeW5PS3RBbjdWejNnbjVmWFBtajZ6ZzZMbmdBZUhObUR4?=
 =?utf-8?B?amM0cVpTcWt2MHRPMFhpSHlQSE82RGZyUGViblI5YVpQeDYwMW1WRzloUHdP?=
 =?utf-8?B?Um1HU29ocFBKTWRyeDJublhkWlJmT0tESGIraGIzSE9yNWhyaHNoS09PNjZm?=
 =?utf-8?B?VEJjaDZaZi81N2U3RG9leVQ0YUtIMVprRTRuVGMyTjQxdGdXWGxXd1Fkc0lI?=
 =?utf-8?B?RXk3QmZWRHliNitGbFRUSmtqbTRnNXBveVByV3NWRzdLZldBendFOGdEQnIw?=
 =?utf-8?B?ckRaVWd6MnVDb0NLSDZKck5DS3VpUVNqN3R2TnFRVXdSWmtvTzFRV3p1ZlBt?=
 =?utf-8?B?b1dHbXoxK1diTTNBLytXd0NWckFNZVNsMkdxdWhlQ2taUzUyVk9jV3ZsMUtn?=
 =?utf-8?B?K2FwaVZ1UkJ3WlRROWk3VVAwN1R5OUJ5MFlOMGNoR1c5N2wybEN4QWZaUjRy?=
 =?utf-8?B?dmZLV2dOd0RVS1YwUkxoQmdmRmxjR21jZWJNWHg3R05BSE0ycC9TN29NZnpM?=
 =?utf-8?B?Qi94cjN2UWJ0ZDlOTlNCeTFJZW1acC9Hd0xMQ1p6Y20rRXEvci9tZGpSQkxS?=
 =?utf-8?B?eFFtbjBiSTFvdndzbnM3KzZxdHJ5VGN5WEQvVXlCdjRqMzBxVGZ1dnhFVTRE?=
 =?utf-8?B?T01JTGpRd211dk1IVElVdGswVU1HOEI0aUE5QjBrb0c0YUloaHZDamtzWUFk?=
 =?utf-8?B?RS94UDBXNXF3ZXM1d0NSNFhXT3ZwQzVLUXR2NWNtK21pdW5JaDFRN1I4L28x?=
 =?utf-8?B?L0xzNE1teHdEdVBuSnBHNWdyK1hKdENFWTRIZlFKY2RIYjBpTDd6UGpXd1lE?=
 =?utf-8?B?YTRMQW9kK256bkx6QUdSNmtXVjNiZmgvbkhwdmFmWXU3WDFmd01QK1RQTVJt?=
 =?utf-8?B?aDl0bmJ3bnQreGFYb29MOC90UHF2RnVUQ3ZpMUNtMURudmpOTlJjZ0EzNy83?=
 =?utf-8?B?WWhvTjBQbmtTdHZmSGhzRUdDQ0VyTStCVmZOZkw1Q0JhWDN4YkM0RFd2ZHFB?=
 =?utf-8?B?dFd0a29MeU01Z05NYllmWUhjM3VWSlZlV3p3NDBlbk1yM2U1SzV4cUw4L1ZW?=
 =?utf-8?B?ZUxjZWpJa1NrMGc2eDRTcEtOcjdZM216dmkydTdrcGxhOGpOeGVOZGVna2tC?=
 =?utf-8?B?bXhxTnd0amJqMU5CdHAxek9KNlpSOTBEUjlyYUx6YnNLbDR5bnNEQUlQTEhs?=
 =?utf-8?B?UTFoeitZOXdvVnNRVzZXNDFkWHdPQzJEZ0YyWFJaMlJlM3RwbExTSkV4ZGlG?=
 =?utf-8?B?SmNRaEZ0aHJtdWlDYVgvbDJqdkc1VGdsWjk0dlZnOFMzcWZrdnJ1aHZVdTZK?=
 =?utf-8?B?cFU1ZzJZc0NNZERudTdyZXFLYjFsbWJ4cEhlOVRIdUo5Q3c1Zm83QUlaRy85?=
 =?utf-8?B?cldOdTExZ2tFcFkwV0ZiZ3dYSTNHTThubSsrSkhydVRhTzkxMkFLRUtJTDdk?=
 =?utf-8?B?eWlKRDl0d1IzOGxYajU0SkRhckVVNmhESklQQ1UwVW4zeXUwNVVPbFAwTlEx?=
 =?utf-8?B?b1BpeWlHN0VkMy9mNk1aR0ZoNVlyUTZUMjdlSUY0OEcvajNzTnR4Y2Y5RFRX?=
 =?utf-8?B?MzVOS08vWXpYcDczbUhGZlBLdUJIU1ZvWHl6ZS9ySlBkNUtoaTdSYXE0OVk5?=
 =?utf-8?B?TkwxNVJKS015Zk5WU2s3eFR4a1BZTnQ5MVZJZXRTNVpNc1FHaFMrNDhjbHg3?=
 =?utf-8?B?cDErSVlQMUtTT0JpSk5YcWVvMnRhZ2RSWWMyTHRWZHR2Z3JVY0FrYUg4dmVv?=
 =?utf-8?B?cXBJTkxzbDZOdHozaEViMlFLYS9Cb1duVURnZFVrNnk3bUJPY0xXRHBPRjZ5?=
 =?utf-8?B?eWxCbzNZTTZzZ0tRcXU1Nno2NGpVRTZ3Ykl6M0dWQTZaem1XVDJLU1pacFhL?=
 =?utf-8?B?U0tOMEVHb3BZZDV6SCtEYWdjM0NnTndKMk9aT3VrbzdxaytLK3poNGtJY3pC?=
 =?utf-8?B?bFo3cCt3T2MwVE8vR3FleU8wbG1TWlI2dmpUN1RXWVhNcmZwV3o0UTIvaGFl?=
 =?utf-8?Q?Jl7WoUrTujoo/EBPZXX/6x4Y2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3b7c2a-137f-43e2-0a6c-08dd57ee4432
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 11:51:41.8349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6Xvh4C8/Ren6qSpDUnkZ8F+1blfQKdEHBJsb19nzRuo+kxOpaFtXOA+6p/yBkVEECQepDC7mdUWXPW6S8gscw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7618


On 28/02/2025 08:56, Julien Grall wrote:
> Hi,
Hi Julien/Bertrand,
>
> On 27/02/2025 15:09, Ayan Kumar Halder wrote:
>> In the current patch, we have defined the requirements which are 
>> common for
>> all the commands.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does 
>> not return
>> 0 for success in all the cases.
>> 2. Reworded the requirements so as to write them from Xen's 
>> perspective (not
>> domain's perspective).
>>
>>   .../fusa/reqs/design-reqs/arm64/hypercall.rst | 55 +++++++++++++++++
>>   docs/fusa/reqs/index.rst                      |  2 +
>>   docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
>>   .../reqs/product-reqs/version_hypercall.rst   | 61 +++++++++++++++++++
>>   4 files changed, 134 insertions(+)
>>   create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>   create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>>
>> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst 
>> b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> new file mode 100644
>> index 0000000000..ffd883260c
>> --- /dev/null
>> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> @@ -0,0 +1,55 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Hypercall
>> +=========
>> +
>> +Instruction
>> +-----------
>> +
>> +`XenSwdgn~arm64_hyp_instr~1`
>> +
>> +Description:
>> +Xen shall treat domain hypercall exception as hypercall requests.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Hypercall is one of the communication mechanism between Xen and 
>> domains.
>> +Domains use hypercalls for various requests to Xen.
>> +Domains use 'hvc' instruction to invoke hypercalls.
>
> Are you trying to describe any hypercalls (e.g. SMCCC, Xen...) or just 
> the Xen one? If the latter, only "hvc #0xEA1" will be used for Xen 
> hypercalls. Other immediate/space will be used for something different 
> (i.e. #0 is used for SMCCC).
Yes, only the Xen one. I will mention "hvc #0xEA1".
>
> > +> +Covers:
>> + - `XenProd~version_hyp_first_param~1`
>> + - `XenProd~version_hyp_second_param~1`
>> +
>> +Parameters
>> +----------
>> +
>> +`XenSwdgn~arm64_hyp_param~1`
>> +
>> +Description:
>> +Xen shall use x0 to read the first parameter, x1 for second 
>> parameter and so
>> +on, for domain hypercall requests.
>
> This implies we are supporting a large number of parameters. However, 
> Xen is only support 5 arguments. So I would just list all the registers.

Xen shall use the first five cpu core registers to obtain the arguments 
for domain hypercall requests. Xen shall read the first register for the 
first argument, second register for the second argument and so on.

@Bertrand :- Does this look ok to you ? I deliberately changed from x0 
to first register so that this can be valid for both arm64 and arm32. 
Please comment.

>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_first_param~1`
>> + - `XenProd~version_hyp_second_param~1`
>> +
>
> You don't seem to describe how the hypercall number is passed. Is this 
> intended?

Good catch. I will add a requirement.

Xen shall read x16 to obtain the hypercall number.

Xen shall read r12 to obtain the hypercall number.

>
>> +Return value
>> +------------
>> +
>> +`XenSwdgn~arm64_ret_val~1`
>> +
>> +Description:
>> +Xen shall store the return value in x0 register.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_ret_val~1`
>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>> index 1088a51d52..d8683edce7 100644
>> --- a/docs/fusa/reqs/index.rst
>> +++ b/docs/fusa/reqs/index.rst
>> @@ -10,5 +10,7 @@ Requirements documentation
>>      market-reqs/reqs
>>      product-reqs/reqs
>>      product-reqs/arm64/reqs
>> +   product-reqs/version_hypercall
>>      design-reqs/arm64/generic-timer
>>      design-reqs/arm64/sbsa-uart
>> +   design-reqs/arm64/hypercall
>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst 
>> b/docs/fusa/reqs/market-reqs/reqs.rst
>> index 2d297ecc13..0e29fe5362 100644
>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>> @@ -79,3 +79,19 @@ Comments:
>>     Needs:
>>    - XenProd
>> +
>> +Version hypercall
>> +-----------------
>> +
>> +`XenMkt~version_hypercall~1`
>> +
>> +Description:
>> +Xen shall provide an interface for the domains to retrieve Xen's 
>> version, type
>> +and compilation information.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Needs:
>> + - XenProd
>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst 
>> b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> new file mode 100644
>> index 0000000000..03221f70c3
>> --- /dev/null
>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> @@ -0,0 +1,61 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Version hypercall
>> +=================
>> +
>> +First Parameter
>> +---------------
>> +
>> +`XenProd~version_hyp_first_param~1`
>> +
>> +Description:
>> +Xen shall treat the first argument (as an integer) to denote the 
>> command number
>> +for the hypercall.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Second Parameter
>> +----------------
>> +
>> +`XenProd~version_hyp_second_param~1`
>> +
>> +Description:
>> +Xen shall treat the second argument as a virtual address to buffer 
>> in domain's
>> +memory.
>
> We don't support any VA. The VA will need to be mapped with specifc 
> attributes (see include/public/arch-arm.h). Should this be mentioned 
> in the requirement?

....as a virtual address (mapped as Normal Inner Write-Back Outer 
Write-Back Inner-Shareable) to buffer in domain's ....

- Ayan

>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Return Value
>> +------------
>> +
>> +`XenProd~version_hyp_ret_val~1`
>> +
>> +Description:
>> +In case the hypercall fails, Xen shall return one of the error codes 
>> defined
>> +in 
>> http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/errno.h.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> \ No newline at end of file
>

