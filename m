Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ACDC89744
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 12:10:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172528.1497588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vODPN-0002HT-K0; Wed, 26 Nov 2025 11:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172528.1497588; Wed, 26 Nov 2025 11:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vODPN-0002FK-GH; Wed, 26 Nov 2025 11:10:01 +0000
Received: by outflank-mailman (input) for mailman id 1172528;
 Wed, 26 Nov 2025 11:10:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSqE=6C=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vODPL-0002FE-Sf
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 11:09:59 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f125696-cab8-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 12:09:54 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5809.namprd03.prod.outlook.com (2603:10b6:303:6e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 11:09:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 11:09:51 +0000
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
X-Inumbo-ID: 6f125696-cab8-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uslhlsluc4DT54IxEJSKMcU38WHey9FRyZ/R+k+jFegUoW9gmBP0lcup8GWEIh7W0SsXnqrlLswcobfmEjBRtWt33LzVXSAgVuR/SUqTuc96E5Dhyp742hLHwngu5wxHOkOwjXIevek2CSiyPZ1fy617iWH73vMcXLQgkrSfVssU7yPCR4SjlX1Arky41dmW/On9tRJGDUIqk5e2yrT8Z7hM7BZNgRRyZejT/7sRAltepTBzgMQJd3aq4uMO3KImo8oS6bRBoMtGsYEPzURhaygCtlQArz4DYtH01sjiQ/5TEaz+lYjxhICURg3MhwAx38qf6CzEYoVPwlZe/nl40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRnrKSlf1pDoETxfuuM9KyGVSvKeS01dXGHvW0X8Tbg=;
 b=rN052pVqHddHXduZEHyC5m1lduF31uotTFl4Tow8L0iD/5V/SKG0hhg+p0DWD6IQ3df7alxnUs5lP3os0pd7mwJjLkAKyWc28/GU/n2v6yxvpdbmrNGKnykqZZvh8tfPNvxWjpMEF5r7PEE2p4ZWWVsGB5vTKxavWQ/aojd3+oNKJfpJpYZeOf9AjLz/uj1KXPYwxm6PsO49bx/gIzLaKB2ra5xQJBplP1nzsUkontESL8NUMIDt8lkUi4wDe8fApmEQmz263CufzDvt3YqxAXt1Oo4zFHIsH7dN10CYGcd8DqNMQIP5QN2AfTkgiJ8eFKzxtId+Ddp+znJW8qeGwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRnrKSlf1pDoETxfuuM9KyGVSvKeS01dXGHvW0X8Tbg=;
 b=NsDL88RN8Ehe6fo6IkATwnwjN2AtL7PrZmQuZFNhrhBkpo3sPbRs6dGXaDdGkVrWYHN7vYnJmTvcpoR9Du6tr2xuHsweElCDZtv8DREfMopEZYQI7to+UirUlmWp4kQ4Mfi/TFI1YgQmxYvGiSsQqNXn0H92zI3unhtFjv2PHbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <54ea162a-4de1-478b-afb8-c566d828dd03@citrix.com>
Date: Wed, 26 Nov 2025 11:09:47 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: add barrier in vcpu_create()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <bea22906-5805-4fad-b73a-fb2e3a8da807@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <bea22906-5805-4fad-b73a-fb2e3a8da807@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0001.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 949d926b-c5c9-42bd-810c-08de2cdc51f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2lIRGU3cHQyYUIwNXJVNnN5TEZNOUsxdzZBL3hEUXlNTVJ5bVh2dVpaRGNB?=
 =?utf-8?B?b0JOcmRZcFlKUmRLanFJdmZBbnI3akw4TzcvM3lMN042QTNxOTJIVTluZFRO?=
 =?utf-8?B?aTRSM2VldGR5T1pBU2RBeE9BS0hGVDlHTjNzdktOUHVOVFRwMWxCeUdzaEd1?=
 =?utf-8?B?T1g0K1dqNTRZNEp5TkVldzd6YVdJVEtKQVVaQTlhbXl1UzZ4MzRlWTVEODkv?=
 =?utf-8?B?dWhCMkZybHlPUnRldjlLYkF3aTAySWtMNUcwQlVXL2FTTERuN2JrUjdFOFB2?=
 =?utf-8?B?Y25hK3Bab0NyWlZkRkRnMWJLZDg1TW41K1VnM0xORGI4VUNhNkdSUEcrckpE?=
 =?utf-8?B?SmQwM0wrQ1QvUjRPOW03N2d3MzZSdVk0NkY2S25PWUJVUlB5aDNUaUtyN09M?=
 =?utf-8?B?ZEtkOW42NGsxQlRHMS9SQm5QVktFZFdYaVRXanZ2RzZQN1R6UGFPNjkyUHBz?=
 =?utf-8?B?NXBOWmk0ZkhnNDgxUG1YbVhuQWI2OC8wN3NjK2RGQkkrR0lhWjBtWjdFQmtW?=
 =?utf-8?B?KzZLZmJMRUIrWjVaL3Z4ajZtOTFhMEczM0JlV2laM0d6amd0MkdnYjViZ0pN?=
 =?utf-8?B?WThmcFFYc2Fkcjdrc0JjR1F2aTMyVDBsdTBBcDRmMEppa2NWMzNBZkdFSWh6?=
 =?utf-8?B?dWVoYVFMVjVjWTVQN3R6TzhTNVBsV3ZXZk1DN1BDaDAzOG8xQ3pOcmpqaXRT?=
 =?utf-8?B?N3ZFMzhIc1BsSVpYQVhuUDljckErMGxWVUF5cXFUV0Z2MSt3VlZETzlmKy9T?=
 =?utf-8?B?Z0RCcTRUS0RlblpzeWNLYVl1UndsTUo1VGMvSDJORlBWemE2eEtKVWlZUVJp?=
 =?utf-8?B?R0V5TnpMOUVYNXlYczM5citMc3hqWVJCL2U4ZjJmRDNzeGUwNWxLNldYZkFu?=
 =?utf-8?B?WVpINEtOYkZWVDZHNE9jNjJ1Q2Y5TVp5c3E1cGYvMERSMS9peTREMmpSbW9R?=
 =?utf-8?B?cFVXWG5YTWZDWitSK1piRXJrVWdwT1dHaGpqaVl5Y1ppSCtMejdaUk9xNUNs?=
 =?utf-8?B?SEtPMFNwL0EyMVN5Y000OWFyKzcxeHVCZWduMzhCNkZJQWZLQ1ZvQ1VxaUt6?=
 =?utf-8?B?eE0rZ296cnhiTFBCbkJ3Vlh0aTBDclhuRzdaQWFZSWtFS0twOTYvM2Ftakk1?=
 =?utf-8?B?Wk5kd1p6V3Vmd1lPNndNK2t1SmpZYmxyZkVsTnYzL2JBUFYxb3c3d2NVRVZk?=
 =?utf-8?B?eEJBcDZzZEpLKzlaQkFLNk5qaHNWb3o5ZjRqL1N2Yng0VU1hcE1JdU1hblNL?=
 =?utf-8?B?WVB0STY2c29MTGtwajJIMHF2cUdER3k0cTVDRGdoNk93ZzRhV3A5MVgxUjl0?=
 =?utf-8?B?NzliZmgvbWhtM2pCT2ZuM0xKZFFET1VvVnhPSnlPMURiSVZwbE05Mmp2dHVF?=
 =?utf-8?B?TTlyd0YyQjR3QjY1L0I3a24yaDNXUkJFMjVzSUlSOUtBTU9rMjZNQStwSFZD?=
 =?utf-8?B?UXZMODJ3OGVRY0tWNXVFVkxlT2tVeloyeTJ0TVNJZFVYbnBTMnl2MGdTbmZj?=
 =?utf-8?B?bmNvNGUwNlppY1BqSDMyMkNSRHRvTy95TVdnVzV2dzdjd1p1OTNkTTArZlFi?=
 =?utf-8?B?VDMwcXJ3U25mZ3QwSHc4OFQwUzh0dTluMURTZ3Y1dWJhR2l5TUdrRi9QcTBz?=
 =?utf-8?B?ekNiZlpzOEkzc281bUswRXdHQTdINmxiSUFpdHJBNWNSWXRodVE0dGxkQzAv?=
 =?utf-8?B?RXE0OVFvREpVZkpNRFlUQ0FCY2sxUXgrUHNaUXYyd201STFlLzhoSURQOE4w?=
 =?utf-8?B?cTdwWXZXLzdOeGlLTmllYzVjNExjRkZET09DVlE1Yjd6Y0ExUFUzeEt4ZVIz?=
 =?utf-8?B?RHRqZGNlTTZVUE9YakJUNDFqSGNEOEhNd0xWVWV2aUlvNXkyQmhoVXNqNnBW?=
 =?utf-8?B?WGNZelJabUc3a3BxM1hJTEU2KzBaNUxKRnhZS2tMS0JNK0hUalNZOWFFb3F6?=
 =?utf-8?Q?iJ1e5qgepAjIgnuF2B+asbL+Pucq8Y4k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzdwbTlhb2VYM2t0SDJ4OHN6UjgxWVJ6Z3QreXMvdTU0KzE5NWJVOVZmMkxz?=
 =?utf-8?B?TG85blZOcXdMcmovL0pNa1J0M2FaY0RDMHJHMzZwaTgzeDRzUWphYUUzY0dS?=
 =?utf-8?B?Y0pCK0FHR3JVbkhReU5yQjB1R3pPQVRBYnc3T2VraHNhRWx6enZQTHlhOGo5?=
 =?utf-8?B?VVk2NjlvM1VJZ3VYV0FFS1Vla3FlcXBYbXFna0RNalRsbkkvYU0wNUtnRDNs?=
 =?utf-8?B?RjIvRTdhd1g2T2xWaHh3MUhXeHdPNXhHdVRKcWNRRlptVlBHcFR5MVpLVFNT?=
 =?utf-8?B?SWJIZko3a0RXb1ZHSUNISkxKeDhoZ1J0K1IzTWdrdlNRdHc1QmZGZFVoL0FU?=
 =?utf-8?B?RnNPQ284bXFTTDd1K1dmdm9YLy9mdkpSSSs4cGZkVmZjUDVGczBrdkhvcWNB?=
 =?utf-8?B?WjdTVmlWbTRwKzV3bGl0YnZ5K2dGQmw4eFQ4SlA3L0VPYVZ6MEFtUEVZMHUw?=
 =?utf-8?B?b1YyK01Wbmt3UGVoVGkwMVVJVkJzdVh2YnQ3ejVHY1g3MmxDZlFCazdwWXU4?=
 =?utf-8?B?RERXWTFhaUJ6RGp0NERwN290Q09JVldheVVDWlZkT3UzaTRBNU00S3lNWmxl?=
 =?utf-8?B?S3pxck9xNFFKeFBRM0FyV0RodTZmOHUyem9kSHFBdmp0L0RQMkQ3ZEJTek41?=
 =?utf-8?B?RUpBUXlvcWM2Z1I0NnkxUkxNUklYdXVEWUVqT3F2bmI2dEkwQkllOXpkY0JY?=
 =?utf-8?B?SW9ad01HVXRLekcvNk5PUmJ2VGZkL1BoaTNDa0puSlNzTy9ablVXZWVLMFlV?=
 =?utf-8?B?ZldQZmJiSlFiWEFwY1A5U2p0VUYwQWtKV3JBMSs5aGFFbjc0MmRLM1VaV3Jq?=
 =?utf-8?B?ZWVHUzFROGZkSmwrUDVSV1dMUUEyL0hXS0lPWTMyV1B5dFFjWHRQdlZnZE5v?=
 =?utf-8?B?ejJsZjdMaVpNY2tHRlh6c3RrNFVUVmw2VUR3TEtBTFI0bVQzN2RuN012RFUz?=
 =?utf-8?B?Y3JpMXJ4Y3JNMGJoRjlqV1VoU3RjZnhWYlhkSmdLUTNxWWRCL3dMdzNZYXhi?=
 =?utf-8?B?dnlsL0xhZU82eFFBMmJJNmMzdkdQYkdtYVB6T0dsQko3dVpTWno5anBuWFVV?=
 =?utf-8?B?djl0bG1RZmVjOFZHZDNLaVpOeUdsUHVzYVJuaDI4cis3enRDcCtZUVBqSDFY?=
 =?utf-8?B?VkNMT25KUzBTM1E0dDZjMHU1Mk1pdE5sckZ0Vk9OcmFqQm91TXlDMTVnWS9w?=
 =?utf-8?B?ZXF5dWluQnNVVmN2S0Rlem8va3ZNUStqVVFrdHdBdU9ndmhuazROWWYwUFFs?=
 =?utf-8?B?MG5hK1pDUUx3aTI0c3RMT3dTKzhrTWZUNFM1OHFMV0RycEJoS28vMFo5SVZH?=
 =?utf-8?B?Q3Z3TEJpWW1Yb0c3WGZJVisxWitxU1hyMXlxcDhpbE5VS0Exa3l2ek5lc2Ey?=
 =?utf-8?B?bXBwU29tOGx1VjNIeFlMYmVaMXYxOGFnQjlYTjBsdVhFLzNvb2Y1MTRQSlpE?=
 =?utf-8?B?THZVb2VoSmdnWWhueXJyd2ltaFJaby9vUlUzNnIrZjRId29Da0JiNmRUb3lm?=
 =?utf-8?B?YkUxc3Bma3duc1J4aUUwS2tFVTBNTThUSHk2SE9udlRubmJGRG15dTg2MVNk?=
 =?utf-8?B?eXFnN2k1VkVhejM1VktBTnZXMmFzc1ZsL2FRVDVBZnRqWjlkK29rdzFUZUJZ?=
 =?utf-8?B?dm1mUUZ2K1JIekduNEFkaTVpZ1IzbDUva2NwdDRqKzdOWVQwWnM2SnFzR0tw?=
 =?utf-8?B?S3FuV3JETE5RN3Z5UmJ3R3lzL3NmckluYjlyVnZMdlpma01IcEVTdnNKL1gx?=
 =?utf-8?B?Nmd4MnUwd3RXVDBjNmFka0VLSmhZbGtyQ1lBd0gyaU1zblBuL0c0NG5NT0ZC?=
 =?utf-8?B?UGdVanM5cms2SnF4cUZLTVdTTGFYN2FDU2RWQVlObVFNVFIyaEtoWStMb0xR?=
 =?utf-8?B?RjNsWE9tcHdFbnpwNm8vN0RObnlyWE85cWhLR0R6TWErRmhYUEsrSWRmSDl4?=
 =?utf-8?B?Ym9RQzlIdmxGUk9zQkNxN1E1Z3ZyQ1NRS0ZoZWVIamt0c3k3UDIxdEJkMHlM?=
 =?utf-8?B?ZkRZbGJlaEdpL0RZSTM3YnA1dityeU1ZOFlWRWVzSjZia3hZcytRWDZ0NVRN?=
 =?utf-8?B?R2dWNlBFaEpHNWZqMi9PSVB3NldIRkNoUlpsVkJIOXpxNnM0eGRQZHVjTUR4?=
 =?utf-8?B?RHhUeVdsRWlBTzFpeWtwcTkyWUx3L2o1V3VaUTB0VHNDOEQ4K2laM2dYRGJl?=
 =?utf-8?B?ZXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949d926b-c5c9-42bd-810c-08de2cdc51f2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 11:09:51.3991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nGCl8e9SElRiTYBnLg0aCoY9krrL/GEDwLWBzhOLol2yTUY95gwB8cp6hOEq7H0PnQ9zyxlH3d1XXigjs2Ua3bfFPuYKR6cjhIQQJOiMy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5809

On 26/11/2025 10:13 am, Jan Beulich wrote:
> The lock-less list updating isn't safe against racing for_each_vcpu(),
> unless done (by hardware) in exactly the order written.
>
> Fixes: 3037c5a2cb82 ("arm: domain")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The Fixes: tag is pretty arbitrary; the issue was becoming non-latent when
> Arm support was added. (Strictly speaking IA-64 and PPC would have been
> affected too afaict, just that now that doesn't matter anymore [or, for
> PPC, not yet, seeing that its support is being re-built from scratch].)
>
> I'm not quite happy about prev_id being plain int, but changing it to
> unsigned (with suitable other adjustments) actually makes gcc15 generate
> worse code on x86.
>
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -464,6 +464,7 @@ struct vcpu *vcpu_create(struct domain *
>              prev_id--;
>          BUG_ON(prev_id < 0);
>          v->next_in_list = d->vcpu[prev_id]->next_in_list;
> +        smp_wmb();
>          d->vcpu[prev_id]->next_in_list = v;
>      }
>  

Where's the matching smp_rmb()?  There needs to be one for this
smp_wmb() to be correct.

It's rather rhetorical, because clearly the smp_rmb() needs to be in
for_each_vcpu() given your commit message, but we obviously don't want
to do that.

This list can only be changed once during a VM's lifecycle, and even
then it only gets appended to.  i.e. this particular piece of logic to
splice a vCPU into the middle of a single linked list can be simplified
to the second assignment, as the first is always copying NULL.

~Andrew

