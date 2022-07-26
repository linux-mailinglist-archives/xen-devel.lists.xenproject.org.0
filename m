Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7506258167E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375459.607859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMYU-0006FL-EK; Tue, 26 Jul 2022 15:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375459.607859; Tue, 26 Jul 2022 15:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMYU-0006Cn-BV; Tue, 26 Jul 2022 15:33:06 +0000
Received: by outflank-mailman (input) for mailman id 375459;
 Tue, 26 Jul 2022 15:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGMYS-0006Cc-Qr
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:33:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d259b04-0cf8-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 17:33:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB3PR0402MB3706.eurprd04.prod.outlook.com (2603:10a6:8:5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 15:33:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 15:33:02 +0000
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
X-Inumbo-ID: 3d259b04-0cf8-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LV4URFKUZWpJVpX32TVEFqsK7jp/GHnB2LDcR4h8eFoGeYskvyGG54M2Ht1RyLq0wwDrZifuOQPrMVC1PKqd7Ra/on80elIgLNIYXQXYIId3PQCQGB2hySZvAAf096LwRaAwTBBD9XIniWfjI4Mi9KmREbq7HFYf3ySPqbDyEj98GBb1KVZinoc1Zwz2ndQ5oqcn/byXcZNSnm0MbcfCoRRfHZIX33ILvfmPtmdWFzkPgPoHIYwzaNgEFpF9R47KYPgOhc03hdQg9BhVuzI2UIqnLbqR9hpAmv2KbRcwbEd76ojYcMaZWy/s7l5NOo3VDk30rw0n5x6XAYVDJ7oMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jznMdVRgf2kH4jvT2e7CgJ2TFLUs6FjzqKhnCeI0niw=;
 b=Jgp3J7AsJ5F9T1sNpwSU3S86oUX7Z5FIkaJe0cZbFXsPm6Xavfe0eA6L3W6IAMxtEJiYIKR5/RfYDQEpwDlEIcdSSn1n7MAXilv8cL2imsbcx+D++aKYJkhsX/qBKZOhtD9yw4gWlVeEkMhMiuXfjVv3YjE4oO4q2mga9eZ6DRanOcs1lwBUUEWFq4YM9WRYPoFSWc55Bmi6LKyuE5PwGJHojFL1FwotE5Y+gijTQaiUebs7t1Z3mYtNjhTUzra30nSad84HcSOm/4hnCHVmTDXtvLoMJ2SHDzYiQ+pkdNhkU9iIwCctCl37z7qYlwMow3Vbb9HC3280iVKoi6X07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jznMdVRgf2kH4jvT2e7CgJ2TFLUs6FjzqKhnCeI0niw=;
 b=d/GyYrfbG+UV7eOGyomgEESs4gqDnbwn/+Bhl/DkCBkv4Uq6fGL7n90Azi5PwFwO/2WgDyMNzZGFVdzQZs8lEjxagJXsMgK1Qw2obDov6jMccGyZ/4zR3x/O+7B2N259b3Bh51fZ6BdYP0l2Jeg9iNwZmyR8QSwo6MjxBz+fk35G6kUQ7rUFqjm4V+nPhB0EIQVIR7nmcszHsBM/83JM9nzxxu7WUB9+dqovXqHxmlcE90elGocUSA/+qq4R0USiWVUsUNz2m5oY1sA464jaNbthFEHjNm1v22txigCMo6mEpLJLtXDd8lgKiosAbsa/8xA0noTD+YHknRFivMnQFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e5ceee7-533b-1cae-262e-b05b5b22692b@suse.com>
Date: Tue, 26 Jul 2022 17:33:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] x86/msr: fix X2APIC_LAST
Content-Language: en-US
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <f22ea4c14d8be5672c036076ecd5818c6ca1d06a.1658849010.git.edvin.torok@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f22ea4c14d8be5672c036076ecd5818c6ca1d06a.1658849010.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0006.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 110c5926-e53e-4baa-6d8b-08da6f1c2074
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3706:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GfWAxqmwUpxqwFlk4IvEItKfsg6ELiDwcaeg17cO8EWjY6TVA5+ingN4qdI1XiMD+vRE5xH3OvtxYhIOY4HPZR4zFHPE5LVKN2qK2Hp81XkAQ0un1s7RQ2Z+kfJMpU7E+Wn9sK9uHi3PMt+P5Juk4ol7dRp7wLw99G55UOUAgazluKUwUkWWLfslOsrk/L27GX0R0DSCmyaaAnYVESPgKinynU858rih89craCWS9qvyTHNIKPiFqbfOFmnj0jmSZ+f2INpPMA3Y3kNUCVHmceiULShXKmwlk1QWCPj9MVwxsfjWdiqXkFW8P9AzjFrMKG+tZqSQS0Gud6Ur/rUA2NYFT9aSqZ3zpLP5WnwYg1PlIfA9p1gczk5XPwY8AmKcBcGxEPynIMs3dQToTjvEnVbszlrmpPBKchWhDZWA0siB4RoCUQvvxugNrNI1o6Ql581nH+kzl2chIEeyDvPKZg+ThbV5czYgfVFzlCl5VqYK8Xvh8kDGPtUOD8BjRZG/7djdi2/XnEcd0MR6HaT5a6ObdI7NzD+ACZ9qvkvKqOigY6hR+GMZOaqtOG1IKDYfBaTYimYjPI3lpVgYLPePYCtZD+NsK+68/XiMTtdLb4jJkRwEA41DVTP2Mt8YywKdoHrUb/5IyG9haqklgHVLhdVWCART7o/NBrvS7w+QGl3jUi1b1fENGWNYAJR9imez1npCef9bKp6iGJry/Et9FqierW7DFFnYPd0//P0Ym/rw9AOjUFAjEZvolbCEJtlqGpZ29Qm8hBaVBlBomMoTt9CwMylHrOZv9PsQuNX7+a3WL+k5npkyvnF033GgG+tU/Rhsn+NHQGa6zeeS45+atg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(366004)(39860400002)(346002)(376002)(2906002)(4744005)(41300700001)(478600001)(36756003)(66476007)(66946007)(86362001)(8936002)(6486002)(66556008)(6916009)(31696002)(54906003)(6512007)(186003)(2616005)(316002)(38100700002)(26005)(4326008)(5660300002)(53546011)(31686004)(6506007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHlzYWMwcUY5ekNXekxtcGY0RlJmeXo1THpibWJ5NGQ5UFZ0MXZ5VWwzeFFz?=
 =?utf-8?B?QXN2WGw0amZhT2RQZE1tdjdReXpzSjlJalVGRlZjSWhscVZuYlJXTkpqcTFi?=
 =?utf-8?B?V0dOTkNvZHlmaURKOUlJN2hkd0dLNmNoeWNyc2pGWGdmYlU3QmJCTXo0bTN4?=
 =?utf-8?B?Sm9hMGhwNGZPVXZFNVhyU1RFWDFldWhBN2I0WGliOVlER01UaTdkaTlOQnNn?=
 =?utf-8?B?eitPcFppQ1dyd0xvaU1LMGV5SFZxWlFXVGRUM0xkZG5xUEJ4a3ByUGNFUy8y?=
 =?utf-8?B?dHVTLy9mMWNzY0h3bHZUUzJ2QXQ1d0w3S3M4clBRYmZkTjdMNDVoK0Vib21t?=
 =?utf-8?B?VDFYT2crQmV5bE5kTHBNMUtITmZmQWJjTVhYRHBDODgxNFBCSlg5V1VSZEw3?=
 =?utf-8?B?ZTRzRVk4ampjRDgzdmNSS0x1TXBvNkZBTWRMbFdMN1ZDVFBFQTRubVpJYUxs?=
 =?utf-8?B?U2tkY0xVbDRNZDdyVW1WeXpEaFZqYzBYUWtmNDVxcllsVnZyby82V0ppNzA0?=
 =?utf-8?B?NXgyRU9XNjg1R0pteUwrT0d4L3ZneEkyTmJDT1BxKy9VVkxDeUI1bGFMT1hC?=
 =?utf-8?B?dUQ5UnQ5Vk1kRlY0UkM2SVZwRElNV0RqaE5BQWxybE81VVJIZlZ6WU4vbDNJ?=
 =?utf-8?B?OGRVNS9zSUU5Q0w5UVVWYWpOZjdBOFNvWUdBZXBxd3lkQ1Fna1QxV0RtT3cw?=
 =?utf-8?B?VGZFRE9XK1VRQjZGcENSWWJHc2JkVUJabGFFbWV1amNpMkxZZkZOMC9CZ01h?=
 =?utf-8?B?K0lJWjE5eXNGaEJ0RmFJdzJ2QTB2ZExNZWJiZ1Q3c0x6QWFDSkswZU81QWRp?=
 =?utf-8?B?WWphNG9NYUppMGJoMmpSTEdUa21QeDBUeCtUdElWcmVCUFF5RENzWG5HMFhK?=
 =?utf-8?B?Q05kSFo0bEx5d2htQ0JzbHlpWVhONHpuWmhPVzRKejJTWVJoNHlyYTZKeGV2?=
 =?utf-8?B?VTk2VFpTcGtSMG9sVDF3ald5VlErOE5tVFhqSkhudjN5SVdYQUkyVmtrc3FV?=
 =?utf-8?B?RVBueEpyVy85MkVoT0xLQ3BMU1crZjFzckhUR3hGakpVZlZVZWZpTUNaNEpm?=
 =?utf-8?B?V1d5c1A3a29SbDBmb2c3OGtvQmRBaHlRUjMyYWxhZXFrdUtQWHNOWTlvRDV3?=
 =?utf-8?B?UU5vVExuNDhtVEhxRzVRRGJzMWhtWTBCV0FXcVBZdDdWejM5U05xVkc3SW1U?=
 =?utf-8?B?WU9JK3h5bDNqbmZEbXowYmtmTzhuYllCVUdiRHI0a05oQld2aEhDSERremYy?=
 =?utf-8?B?QWRlcC80V0JSRDVYOXFlZ1Zac3J0K1VZMUFRT24xcnhHWStsellyanZzRGsy?=
 =?utf-8?B?alk5aEVFakpnVk1iYUNSTWNFWUVDQk1oWUVReUN3RlVxUkRTNWtiQkJVUXoz?=
 =?utf-8?B?R2tzMktOQVVTeVQvNEczMXpacjBXVmIxWTEzc0pXQUhaUEpYSVA1eFYrSG80?=
 =?utf-8?B?RGdDWmlDc0lTb2ljaVM3NWVFTDUzcWxzRjdYbVRTV2Y3R0pJa09XMVNTUVJY?=
 =?utf-8?B?dko5WXVrYU96QlJldm50a280OUxYczByV2JHbVVOaU91aEora0JzS3NNSVBj?=
 =?utf-8?B?R0RHRXJxN2lxUlV1ZjJiR3pGdDN4Q2d5cXNXYnJvYWpDaWVLcEF2N3NMb0JS?=
 =?utf-8?B?aklYZ3ZQSUQrSGxaVXB4NUNTbGwrdGpna1Z5TGRlYWxNU0pXcGpia2hNRmFD?=
 =?utf-8?B?YllFWk9pWVR0bVdxNk0rVStWMnJQektLdkhlSmZabzBob3dFWHRmOElpZVYr?=
 =?utf-8?B?MkpRQXFmRXJXcUUyMThNQUZudC9naXNnYVF3cmpjMW5FT2NmRm5hcHhWTFJ4?=
 =?utf-8?B?bThuYTFaenBFajFZNnBOUFpxTW5UdXVwRnJVR3JXQmdUcUZpV0FqMjg3eVU0?=
 =?utf-8?B?a2ptWUdQNWxLTW5FdlBFaERETnNxbGJ0d0FRRUhhb1pzaVl1TGRPUFpuVCtm?=
 =?utf-8?B?ZFgweHpadFRpdlJHYy9VcHZ2NVlQNThtZW1GMFkrcjBmK0dmeU13dEdVbGUz?=
 =?utf-8?B?L3NDY2lpT2xDYzhXS1FaM1d4M1hUT1FVZlFTVDI3ZG9KTFg3MEZTSm1nbVg2?=
 =?utf-8?B?cmlUb0Y0OE44VThrWDJ6MGZaN2p1YXI5dzgveU01S2I1cEc1dndETElEbk5z?=
 =?utf-8?Q?DJ+KvbDA1PACdXlXJTeVHccja?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110c5926-e53e-4baa-6d8b-08da6f1c2074
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 15:33:02.1864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdESBOod1vzTbAJeo0Kp1CNgN3qwzF0dj/YZ40cd2PiH0Mbj9SoBrJ7IEorrnTIjcTmrwD613aw1yacPCvHQoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3706

On 26.07.2022 17:28, Edwin Török wrote:
> The latest Intel manual now says the X2APIC reserved range is only
> 0x800 to 0x8ff (NOT 0xbff).
> This changed between SDM 68 (Nov 2018) and SDM 69 (Jan 2019).
> The AMD manual documents 0x800-0x8ff too.
> 
> There are non-X2APIC MSRs in the 0x900-0xbff range now:
> e.g. 0x981 is IA32_TME_CAPABILITY, an architectural MSR.
> 
> The new MSR in this range appears to have been introduced in Icelake,
> so this commit should be backported to Xen versions supporting Icelake.
> 
> Backport: 4.13+

FAOD nevertheless it'll be applied only back to 4.15.

> Signed-off-by: Edwin Török <edvin.torok@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

