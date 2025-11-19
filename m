Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06BAC70914
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 19:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166249.1492838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLmYT-0003dv-9x; Wed, 19 Nov 2025 18:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166249.1492838; Wed, 19 Nov 2025 18:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLmYT-0003cO-6t; Wed, 19 Nov 2025 18:05:21 +0000
Received: by outflank-mailman (input) for mailman id 1166249;
 Wed, 19 Nov 2025 18:05:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRf7=53=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLmYR-0003bE-7s
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 18:05:19 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c6089ce-c572-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 19:05:16 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8400.namprd03.prod.outlook.com (2603:10b6:8:32a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 18:05:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 18:05:11 +0000
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
X-Inumbo-ID: 4c6089ce-c572-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFUGVTHCW7S/9Git8exkFfTpqMGEGUkN3gxaU1y77EKxas8j6hRtl6fnF1xlL6nw5JwqGvAo9jZs4hEhMaqw49467gACQL6JpsjdAp8ypkFZvLHJjun0ErFrf2xmKyhgIgTV1Cli8ILoGfmLDUsX1UmAVINTSjZUjxUUxL8A2eC1g54QvXE0u8r3AZ3DSqv/76CxcDdUWtsXJNME9wh4zlxv252C1qryYYBgndXXyFdFWsObf7YGYFT2CPbLfd9Une3I9OA7gjQA9PCrz4vxI3O91k85EjA8Al4swqlgZPm0kKK87+5SQEMv24Z5YfnlwzvkBGvCj55giIXjfmIB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhVEppCV56GwQV56edg6qmvCroVrQp54IWfXaIXJhAU=;
 b=TCTTaQqbVvVLqCnxAMFnwnYyJxjA30osGLIHxKBObcLUTvrD/ie5lLT3fl1e76BE8tkBQCJio7CrIUhK1V7VkEuQld3++3hxU9Ico9Bc/IuuYfV5EvQEKppdxA7+z7ScYwQRXtFbOeNmoB7pXLSJXR41Tamrcdwd0mEmT8T/hUtIn3fsaumPCvHnibszr+E6uJmu/Z6fWAuhOFBotoseWvvYk5TT67gjZw+nkm6S6cx4P+hL50hPv7HtyBoEquN2Y26cqGBUdvePj3K6JbX6fxPmHEqhmBHFNpvYpMq6xHYoioe1YFp7U8ijEH+NG7+3A5+PAHF12IQZAomq8S9INw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhVEppCV56GwQV56edg6qmvCroVrQp54IWfXaIXJhAU=;
 b=WM2mF4O5aJaZvf6m4NJ1s5C7ZhgIppllvESi70niFtVFD3umfff1neDIzEFFgk0MCDpQgrFqBjZrO5VK2Lu9ZPXD8QDobonlwJBU9y8SLKdUhyWPZa9YnDyEmrOwHqFOl4kc/T8ZFzJ4wI/mSTao6Rgs04DgHWS1o3ifKwPmYZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b4832205-d01c-4a54-9b1b-d4a24823f2f2@citrix.com>
Date: Wed, 19 Nov 2025 18:05:07 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen: Strip xen.efi by default
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Frediano Ziglio <freddy77@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
 <6729f3d9-618c-4dcd-93f8-d02ca7cea017@gmail.com>
 <8f8a769d-95ea-4554-8ee0-d6247f583e37@citrix.com>
 <CAHt6W4eDDm-fNUB7W1Zgj+x-bkK2fxTB50C38T4Uy0_Ofy_cww@mail.gmail.com>
 <aR3dFPTeH4Wegodd@mail-itl> <38ba402c-6920-47f6-91d3-7b499c407c36@citrix.com>
 <aR35jsEXBcV2uEFY@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aR35jsEXBcV2uEFY@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0415.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: 12558166-9c40-479f-082d-08de27962ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFRPeWJQNjZmb2swRnpKM3JBQVNvUEtyeXIwVEJDQ3hkYmVQcDA3TDF1SU1o?=
 =?utf-8?B?VWdyUXd3Yk1BQ1RlTjRkcjNsa3hoZ2NLVi9yNHE2S3hZUDY1SmIvRDNyN3N3?=
 =?utf-8?B?eEpHMXNIbjQ3TDc1SVZVbSszYzROcmZLSjhPMUE2S1oxc0pHZmVJenRlT20w?=
 =?utf-8?B?RVZIMzI2QXJzdC9jWXdJVmNCdEtodDBGQmFHTWZFZEJDV1pnTnVIUEQ4UEhM?=
 =?utf-8?B?bHhmbDBKRi9kNVRYc3VHR0lUWnJpZHJHc1oxc1JtVXVKcEsyY2RMRkF6aGo4?=
 =?utf-8?B?aEZmSzBsZ2FNR2l1S3VqQVVZanBRcEFPWGRSYVdKMHRLWG5zN3N6QndkQk15?=
 =?utf-8?B?K1I4TnptYk9CQzdHMVY2bnRpdHRvSVJMZmFWUG8yMXVGaktLUDFnc0VHWWpw?=
 =?utf-8?B?UTFDanRnVXNsdFNNamwvTUNBd01nZlcxNTM1d0lMM0RnUUFUTmQyVzZZS0U0?=
 =?utf-8?B?Y0lJUXZxRkpVZXgzZE9rMFhPellsYmEwaUJnRFRqVlJIY1JwTU9pL2c5eVFh?=
 =?utf-8?B?VEFaWTg1K0FJeEloU1NycGRQVytrNHg4TXlhQVpEVXpZNFNRUXdSaVBTelg3?=
 =?utf-8?B?alA0OFE3L0JBS1B1ZXdSbWpYRkhKL2RCbnpoRGlVT3hQYmVoNUZhU1JFcnUr?=
 =?utf-8?B?Q2ViZGE4UlF3R1dKbHN3bVQzZVRIdTJKa0NKMmppY1pncHZEajZVSmc0cFRw?=
 =?utf-8?B?c0RYUFBBb0Y2TjJYVUNSSE16ZmNId0tBa2EzTSt0V1p5NVJwVFdyWm1uTUU4?=
 =?utf-8?B?T0lZYkZQSitrWmdCNWIxNUxrN2xtSHNKUW4wbGsrbGNJUnVhOVhCbnRGdWEr?=
 =?utf-8?B?OUwwYXhscjBKcUNWY000QnA1eER3QTZya0VzakNJdnBoV0srT0syVDA0bG9C?=
 =?utf-8?B?ckw4VWU5NWVBZS9QNE9adVUwU1M4Sld5a3F2ZFZLUWswZ1hDeDVUT21OMDlp?=
 =?utf-8?B?amZiZnAyVEZGVGpJM0xiSy9DU2o3VGdqaG9KR3NJRi9CaDZoZklNdkxJeFRN?=
 =?utf-8?B?dzd4ajNKV2NENXBjTk1EZVVGZ2RTdENJdDErVmlwUWNMeW03bzUrK0tGUW5p?=
 =?utf-8?B?UERtOGt6SkFXN0xKU2c3c1JmT0VOMGxPSm5rRGZGUUs3cVlwZDJwVkI2Um94?=
 =?utf-8?B?UWMrVWxJNHc5TVFQMnFkclMxeUN5aG9mK1FZYllEc1p6ZnZuVzJLZVFaQWpZ?=
 =?utf-8?B?V2VRK1hnMk5qcjNGRjZCSkxwb3JhQ0pOUGVZVTltcTVDd2NWR1RSQko2bkxG?=
 =?utf-8?B?V0c5aDNuNVdwS1BuN1AvdGk4QWhCNzJIQVYvMm5JcWoxNGRzK2RodThyQVBC?=
 =?utf-8?B?MEIxTitGd0V2QXgwcGlBQzFGVkhCbVhsUEFpeThVNldWd3dSOXpucHJvL0xn?=
 =?utf-8?B?MmJXaFNtOWhESThPTWZZWUE4d2h1MjkzM1YrY0MxKzFyV0RvbEQzZVRUV00x?=
 =?utf-8?B?KzlOQitiTUFGckN6MjlhcFZYMHE1emhCT0crdGl1MW9keENBUnJEV2UyNU1W?=
 =?utf-8?B?MTdjdHVWZmVRWEJlUWs4dzY3THh3OVY0U2VWUFBjQVF2U2VWTDE1Sk4rOGYv?=
 =?utf-8?B?aDNxN2lMZlJmeUs4aVQrL1BJSkZlb1YzMXZONTg5dnF3SThJMzBRVlI4YVAz?=
 =?utf-8?B?R2xpZnhvSzNyUTk3YlBzeXBUaW9laHRZZFZrR2tvNmhkZHdodytobE5NRTNh?=
 =?utf-8?B?L3AxaG82bCs0NnlVT0FiWFlNZHFFL29oZ3I2ay9NeWZucVZhSHhwaTNYWkVC?=
 =?utf-8?B?MGcyNjFwNlhEaHJGVVdBZHRtcGtjaEs4L0RBZE8xMGxpejJTcXpZdXFWQlNO?=
 =?utf-8?B?VmdqdkNDdm55VGtPcWltUWtxTldEVEJ1MXcvTTZFRTR3ZjMzcitqSXd3MWVU?=
 =?utf-8?B?dktRQ05rY0FIa1lFeEtja0FNOWNVcmU3NStNY05iYXc0REFMVzJpR2lzWDhI?=
 =?utf-8?Q?d9kEUclJFvLSoxXGSHJ57ix+9yoVPdXX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXhiemFJSWFVQUE1MDNZKzhyeDM1NHUyay9qSWR3bFJEWTV1UUNkZm9hV0c1?=
 =?utf-8?B?M2d0QlFVaG14SmlaWnducGdrMDVvUnN6aForQU1lR0dzeEs5VnBTUFY1WHB5?=
 =?utf-8?B?UDVyVS9OU2VJcjAxWHdmZlRwaElEekZIb2h6N2RaSFBnR0NFZ2RXZmZ4RXpm?=
 =?utf-8?B?NngzZVZWcGo5MHp5TGVCaGJXWEpvZ3c1YzRXWVVvcnF3U2dZd1V6VHFpNFJN?=
 =?utf-8?B?OUxUTXRoVHNuN1JZMDlSbi9IWWVLK1o1aHRVNnNXN1FtMFVJMjhqM3I5TVE2?=
 =?utf-8?B?T1RJZjM5L2VJZmg4NVB3Y1RiOWxDWUxnVnNBQ3VxTmk2UGgzNnVuSkN3d25M?=
 =?utf-8?B?bUJIeGpaSUVaSjUrNTUrRWdSWE9ZbEh4Z0ltSU1ZWGZad1VQUEQ2Y2pVaVQ2?=
 =?utf-8?B?WklQOGM0cW5qNUJiQmVzVzYyVytkZHFYTE01SU1ZUUdtNTU5YkIwaSs4dnJn?=
 =?utf-8?B?UzIyeDZyWEpreDR1WDlZc0dPeSs0TGlUUnlTTG85Ymd0Mk9qa1EzN1JmaG1k?=
 =?utf-8?B?UmZPKzFpdTBHZVhOMW4zRnZ2QUZzNGwxa2x1eFY4RzB0UFJWaGFRQU1JWHRM?=
 =?utf-8?B?RHRrQ0VvL2lxQ1hBVW4vaW1uUWtXN1dIMFpKeXpLSVlJdE1Ta29LWWdHVExa?=
 =?utf-8?B?OUVTUUkrbUpVbDBqQWdqQk9wcVVQZXcvRnQ3Nk9ydDAyN2JsZTZtUXpKSTVE?=
 =?utf-8?B?bmFocTFtZERHTU9VdkgrK09adTVrRFIwWi9hdlhSMkhQUG50TXZwMnFGOWQ0?=
 =?utf-8?B?clBCMkVaVEVRMmxCKzNVOXM4Rm1xbFRORk9adEhXU1kxN1B0UkpQU0RQSlhM?=
 =?utf-8?B?aGp5SzFtZWwyOVJ2Zkt4RmY5NjFVSitJMjVCcjdNL2RJMksvbzFNNTJaN1JL?=
 =?utf-8?B?elArZ21uR1RFa0NJVmNmbUFsbTdaTCsyQkxYcnFFSmh4WEx4RDNVaWVxODg0?=
 =?utf-8?B?THQ2bzJxems5QkVrT2dkTVpXeWp2cWRLNHlTYmFxcnhKdElLT1ZoUFpQUGdJ?=
 =?utf-8?B?alZvMDhaTHEyUzhaVlFyb2dyV2xqUkRxb0RsTys0L1NhNFZSWTd0dVJ2RUdk?=
 =?utf-8?B?MjJDMUp3ZlFsQXlVeVdYRmgvdTNNc3dVcjJpSmQ3SHpQRThJMXR2VDlLL016?=
 =?utf-8?B?WUZKRmVIbUlIN2czV0V5bGNHaytoS0pna3ozNHFKUFc3dmhib1dSL2lNZjhV?=
 =?utf-8?B?K3ljeFJlY21xWkh4RkxzQ010QWpGQ1lFbUJoRHdTZzB1VFpaN2p4L3E5UlZ1?=
 =?utf-8?B?a2hlKzdFWVpJaENlcHRpTi9hWkkrVzNHQmhISC9VNEpPVHFXQld2SDBxL3Zw?=
 =?utf-8?B?MWt0Vk9TVHhQdW9VRzVhK1F3dENFTzdiZEVlTHFDUDVZSEpXMkdxa1hna215?=
 =?utf-8?B?VjIyMUJzd1luK2F6YUVKeVA5TUZ4aU92ZURPcEwyblBoSklpWFdRdjNLbTRa?=
 =?utf-8?B?KzBkWlRPRWgrVEFtejhnZ21rUnowenYrSnhMME83alRQakhVdkxRZThQeDc1?=
 =?utf-8?B?NE5lRytoTTlqWUluc2VjeExjR1J2aW13eE5oaVFVSWpqRWl1WDdySXMrY3dI?=
 =?utf-8?B?VDhVS0pHeXVaMUpPV2ZqQkJzdGE0aVEyTzV2ME9GTURSWEUyck5HQk5oS0tv?=
 =?utf-8?B?R1FJVW9HL1U5QmROL0dtM1RDVEtndkh6ZnMydnRiQ2N5dVRaZU5XWGpNVzlk?=
 =?utf-8?B?V2VyQWE3a281ajNWS0pjOGNhS0pqcWdZdDVNOFpyYjMxSXVWbGx5V1FQWVQx?=
 =?utf-8?B?b3BPMy9JNmFWN3BUN1FKNDRXMm9QRGtZL3JibmUxak9MeFlEb3gzWDJJMTRN?=
 =?utf-8?B?TTRvMFNWTldYZElHUnRiaE83MkZOMTJmU3IwYmlwK3NLTHdpUU0xbEdrYktx?=
 =?utf-8?B?WXZhaTg1YWJDMVJEd21pZ0IraFdQK08rbW9acEIwak5aT1JnVnZLNG44N00v?=
 =?utf-8?B?U2pOdnEzUjNWbm9iak4xbVVkYTlua3VxbFJWcGJhRHgrVU56SW8wcEh4WXpU?=
 =?utf-8?B?bkxWWU02cHFxMElTWCtGbnNoTVc4Vk13YTRoRy9HZmhpbDFLbkNqSFV0R1Vs?=
 =?utf-8?B?WG5CUWVWVXJiYkNCTlo2MzFZY0tON1JHeWxaTzZxUm52OC9YamQ1YWFjcTdB?=
 =?utf-8?B?cVhJWWY0c1JCS0tHZ3ZORXNXRzlTN0JYRjZyUWtEOXlNOUdTUWpzRkpmOStF?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12558166-9c40-479f-082d-08de27962ed6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 18:05:11.9080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L69jR8K5296wfE2Kedykkj9pmrWEX2CWW8I6r09YKkVdx3JtFlTU5khYJQOEuDaWkB9kPirf3eAdgmLe7lZZeNg3uhEltl7qLUbB05HR4fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8400

On 19/11/2025 5:08 pm, Marek Marczykowski-Górecki wrote:
> On Wed, Nov 19, 2025 at 04:02:30PM +0000, Andrew Cooper wrote:
>> Given it's now only 16.04 broken, how about simply excluding xen.efi
>> with these broken toolchains?
> That would mean adjusting README to say a newer binutils is required for
> xen.efi, right? Then ofc we would need to figure out which version
> specifically. FWIW Ubuntu 16.04 has 2.26 and Ubuntu 18.04 has 2.30.
> Would raising required toolchain version (for some configuration here)
> even accepted, especially if considered for backporting?
>
> Alternatively, simply disable building xen.efi in CI on 16.04, and maybe
> document as "known issue" pointing at toolchain bug? Result is very
> similar, but might be more acceptable on the process side...

xen.efi has never been part of the toolchain minimum statement.

It was introduced as unconditionally enabled, with probing of the
toolchain to decide whether it was capable or not. That's what
XEN_BUILD_EFI is doing.

~Andrew

