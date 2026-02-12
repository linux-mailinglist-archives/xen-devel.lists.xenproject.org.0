Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNqIE9nnjWkm8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA06412E7B9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229157.1535203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxp-0004is-Vw; Thu, 12 Feb 2026 14:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229157.1535203; Thu, 12 Feb 2026 14:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxp-0004fu-OJ; Thu, 12 Feb 2026 14:46:41 +0000
Received: by outflank-mailman (input) for mailman id 1229157;
 Thu, 12 Feb 2026 14:46:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hp9h=AQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqXxo-0003LH-1j
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:46:40 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a36cd323-0821-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 15:46:39 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BL1PR03MB6200.namprd03.prod.outlook.com (2603:10b6:208:319::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 14:46:36 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Thu, 12 Feb 2026
 14:46:35 +0000
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
X-Inumbo-ID: a36cd323-0821-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCmtimCwdiISnyQrMTgGs4Zett2/SiDrzt2Xw4DarOKL8e5SBJwBDRTldnauUrbDFafWUGzu0GAuR3NukcJ6yMkAs54jzjM3xaJy9P2+9NhudxWMr5KuloWA+Ud7lWqZYUmtEFd0Dwx6zDiFGiNaQcJ20iwpgcFKb2Ac58U7lHQ68bsGEOjCYVRmOkofc0Q1KdjhpoyOU91uwCJHSJheWJvPoOsgpTiFeZBQ5OYKEvKGEQ8X3TJ0PByTGTVTfJmAdwqrXWXOUf/NX9hkCy2YFEDwzQpDbqWzmMO80rSYvModiWog/0ukMg/vqP7P7kC+k6VQOEO7IWOSSv4Jq3dmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xl0n5YtzEuDOR9roRgv/CaNdsWXGPUlwSYblNz8/sOQ=;
 b=ux07suoiVIQ8TJqH5Q64tE/iiU05PaX2H7qJ5YE4/mzUCowls/UZC7SzcHpdzHxyq9zEUuGidP2KvW+zTz9F5E1NPT3F9XQSY4IscQdz5UlFE0af6n+hRFxWL4ne9JMSAMTkUkduR1HrsGTqUkifvgshUTx4DXvin70M93Eolx4rXhyuhteaqx67RMSUBoUbHuPym9Y2af86sicX/OLomm8VWjLMz682rmoyEKEfFcHMXzf3enGhHclDUNXOxfHRNZWw4SpDlIWUFTF4w4yCCh+OIap+4fUCEn/GdN5nRdfn6FxU1lV8w7CpQKIGreXz0OGtbb99kynMvWJRR3uF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xl0n5YtzEuDOR9roRgv/CaNdsWXGPUlwSYblNz8/sOQ=;
 b=vO76XArxidnmaGthgMBQ4JhQAczNo6DQHROcBm9n1csXbe+yLoDSdf5m9Qp3wmm7EtBsN0vcP26WsxwYCaCyYazrFx0hMJAhVJwIq4NoFH/vEZJlljawkzC3rQiRZmnVuzMIM6YSmer8nOwjzbeUkAueRAiBAGXn+DsqupBCx6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/5] cirrus-ci: add x86 and arm64 macOS hypervisor builds
Date: Thu, 12 Feb 2026 15:46:17 +0100
Message-ID: <20260212144618.43200-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260212144618.43200-1-roger.pau@citrix.com>
References: <20260212144618.43200-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0170.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BL1PR03MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 2383acab-0a46-4faa-2e15-08de6a458568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkxWWXhtS0h6bHRJTEcyZlYzeTBQNGpWSjZXZE5wbHNZWUFQQnlQbDJQaVc1?=
 =?utf-8?B?NkFOSnlKL1RUVmRWMm9HVG9vZW5ld0FiQXlZVjFmd2RER3ZSN1B5UTJud1Vn?=
 =?utf-8?B?MDI2YThyNFJUaDNXbHhKa1ZtSDM5dEFQUnJsTnBiamthZHJwSmtoM2lCSkF1?=
 =?utf-8?B?OUM3V28rN1YwMXI2aFlwYVZ5NG9SR0dSNjNrUmNGUkJUck1HLzFDa3EzS3ox?=
 =?utf-8?B?M0swOW1ITWxEb2JzeW1hM0dYalJVQWFRQ0ZkNG5UMmdKalU1UnRON3l5bHlo?=
 =?utf-8?B?ZWViMU5vbFhJeWtlR2dHZVl5R2NhWWxXSjVMWnQzTGg5RWxHdXRWQVZUWENX?=
 =?utf-8?B?Zm5aNUcwVFB3RURyWUZnemtmUVVDTUZOdmNiV0hkU1NLUmRvazFwZGc3Vjc2?=
 =?utf-8?B?QXpTNDkxN2xYVm5iYk9ESGFzdkNzWHJjdWdEU21UWkdpVDhWM0J2YjBlMlJM?=
 =?utf-8?B?eFlCdzFHbFJkbXhEVnlBeHQrRktqOUtUS2FndzRJRmgyRHgwamREWDNFSUlX?=
 =?utf-8?B?dE9IS2k4VDRPNXFBcWRiRW1PZkUrckhPZ0ZvMW13RkxPcVhjZXFiS2xwdVd3?=
 =?utf-8?B?T1MrRGdzWlh1QkpYV3ZRcjdmRWhWY1AybjVvaC83TCtFMFhBMFZVNUZneVRC?=
 =?utf-8?B?ZFRwbjFxWStITnhUaVVrcE1aUTF5MzdSazlmWm5CRmxPY0V6NEJtUWQyT0tP?=
 =?utf-8?B?L1BTUnlEOWk4MXhDajBEUFZFZWpETlZySHhjZDJRWkpvSnlZTWx6cmVFdTNz?=
 =?utf-8?B?YkxIM0dMTWpGbDBocmYrdDB0aDI5OER5WmVSS01pZDB1UmZ3UW0xaS8rV0Zs?=
 =?utf-8?B?YmlHNko2M3RPbnhPanpOMWVIdytXRmt3VXFYNGE1MDg5bWJlTXV4d3BEN0Ir?=
 =?utf-8?B?dWZHdDIxWmZTRHVHT3BUVm56ZXNjK1FXVEhweTJXWDNUU3Voa3pDbW1YVTdh?=
 =?utf-8?B?ekVINk5zU0xJMEw1am9GSlF2bEFaSEJuVnRCelA1cUE0cXM2UVEycks5V2gr?=
 =?utf-8?B?dWNoYkNxOTZSVWQvOHhDNlUybnQvTm04b0FpNEF1WCtmNSt6N2ZQeHU1UERa?=
 =?utf-8?B?Si9sdUVpN3VWUDhabDZ6STh4bUUwSkVYSTFHd0JCS21NczVkbkJBTzU4K01L?=
 =?utf-8?B?dEZwdzg5ZnVGWVJ2T08wOGkxemVYdE0xTUFZbVFCV2NJT2lKeW41VklvU3lo?=
 =?utf-8?B?WWpUTzNCeXpDRms1dDdwTW05ZHlwWllpUGJvM1ZWTGhGc0cweFVCQS95TFdz?=
 =?utf-8?B?QUQxMlZvbFhDOXJmVmdiZ3duVHBaMXFYcGhRTTVLYUlWQ0tBYVU0ZDJFNVFC?=
 =?utf-8?B?ZU4xYXBzMlFtdjFXaDc4Q0Ura21uTHA1ejVvZlYwN3Z5dkJWNnNZNDhQZkk1?=
 =?utf-8?B?SGo4dTRuemFaNlpGa0pxempJNkRxNmdKU0Jzcm5FYnFZTGxwN0lmZjJzRnJJ?=
 =?utf-8?B?bDFhcmZsQ1JzamdGZUpMd056eUdwaWlEY3hCZzNySU1Hd3ArQ0w4ZzJqVFRP?=
 =?utf-8?B?elhlVXNSN3RNNHdPcE4xVEVZemROUTZFU29KOERGQWR6Mnl4djdkM1RidGJF?=
 =?utf-8?B?akcyajE4NmVTWFkyZ1MrbFVSZUpVTWFVYTdmUTBtSjNCNVBoUEYwekJYRk9S?=
 =?utf-8?B?QkJFR1FHRy9BK1ZmMEZvQnRxckIxRWhWcU5FbERua20zd3hwSktrOTN4VXRa?=
 =?utf-8?B?UkZybkFYZUNpd3QrcnFobXlwUkFqb1Y0Vnd4anRhMm15Uld1TU4rY285ZENW?=
 =?utf-8?B?YStRdG1sTGtzS2pjSTM1ZlhoWjhUVzZBdERzNy9xTzcvYlFwSGtZTWpGb2FV?=
 =?utf-8?B?VTJzSGRoamxnNGVSb3UzK28wckxrNlBjVkYySnA2UW9KcWR5SWVWMWtrY3U2?=
 =?utf-8?B?cWxwWHNyL3gxTncwS1k3a2c3WXhzM1M2MEtpTHp5QXM0YTJMREpmSkJiNFNF?=
 =?utf-8?B?N2x4d2VRVzB2STFpMHRlcUFXdWtaYkwxZDcrYzdXa1dDVUdZZ3hvb1Y4dHdN?=
 =?utf-8?B?aUhUbVVrSGlIYmliblJ5UWpIbEdML2NDRTFSVktPb0pheC9OOFRrcERRVkU4?=
 =?utf-8?Q?2NzZTO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVFjSWQ0ZHdiMVFRT3dVU0dhN0FqNDdZL1BQSnFGakRROEM3L3FhMGsrVVhv?=
 =?utf-8?B?SHl0OXpMbk93SjBZU3NpR0hsdzBCSzZPMUVtOW01clkvejNsaktUTmUvTmJQ?=
 =?utf-8?B?ZHMzeno0U3F4YXBTUlRQdXZZNTIrZ1ZKRWFMK0R6dG03c3V2RW5XMHRmakg5?=
 =?utf-8?B?cnhTcUhMdnp2SUNtS1pYbUcwNWMxU0k5T3JUZlBZMDNPTlozckpGR1FvSGln?=
 =?utf-8?B?eXI3TEMrWmZLdXJmT0YzSkZDQTU0cm96SXVmcVVUb0RJYzlwMEZXUUdCaENI?=
 =?utf-8?B?TS9hcUNkYkVMbjVMd09sa0NiT1lHZnVIWFZVZm1NUTlTQysvck5RV3BsS1Z3?=
 =?utf-8?B?VzFlTGZhOTlCTzNpNElZTkdaM2VrWUVyUHdhYVNLUnZBdCttOVZvTXdqOUlV?=
 =?utf-8?B?ME1NMzFSUnVSdGdhbktIdzFJTjNvN2t4ZEN1VHpFVVIxUFVVZlVnZk92eWpT?=
 =?utf-8?B?eEYzZEV5Tk1XUDhmNXUyNEw2TU4vYVRWVFlQZHo0RzZTU09BVW5rMysvREor?=
 =?utf-8?B?WHA2NCtxSnlkd2FVUUFJSDZvRHhMR3lCZmZnN1kzU0VPUlgzNERhMGpvZ1Zk?=
 =?utf-8?B?KytpbXUwd1BQdnRxZ3VOeXMvdUI0cndhMEVrQ3YyYThlM1V3dStqOWtXOE5u?=
 =?utf-8?B?YWZZTTZaUG9uMWw5K0ZtMHVaMEtkSkhFeDEzVGFxMURFSGRLK3Q2L0JaSmg4?=
 =?utf-8?B?a3h2RlkrdnRaSERlNWFKSzBXNkIrdjVNUytLVkc3cVBOUDk4eEp2enl4SFp6?=
 =?utf-8?B?SmVKcCtsV3pUMk5STTViS3h6UXIzWjlQU1lueFY5U1ViNllmN01CTkU4MHJV?=
 =?utf-8?B?WVFjbmNsaHZVU203V1hjcEJOV21WcW9mTnBpTVhuSjhReGRUTEhKbmd6N0li?=
 =?utf-8?B?MnI1VkIzK0lCb3pRbHJDV2V3TGNPWUpTT2VIaEVpQWpXWWd3TEhjdFJPUUR4?=
 =?utf-8?B?UkdleHVtU1RzTzFyeFFNNkhNVisxWEJMNURORzlDKzl0L05QeUd2VUNRT0lJ?=
 =?utf-8?B?L1lxS0pIY0FnOHVQejFGUE1ETjBjYmYvWmNjWk9CRktUNVEycEVjSU5OT25t?=
 =?utf-8?B?ZllnVnJQZUhobVYvT0ZzS1FWVC9XRkVmVmxrbU44bjZVMkZubm94cG1rdFQx?=
 =?utf-8?B?MFNyV0o5aDE0dWxIYzhnZU54cStXeXBjakFuZ1d2UTJqZzZwTnhwejhqQkh6?=
 =?utf-8?B?VG1BcU93S09xcUE3MlNEZlBlNnpBckYwS3plT0Z0OWdVR2lnVHdWbWZJQUtW?=
 =?utf-8?B?aWJDZUdNdnc0S3cxSmg0Z2xYZDVqUFRTTmFxTWpxeURMSlJWZ1VPMmV6QmZK?=
 =?utf-8?B?OUpjWGY0bkJMQm5YcW4xSHY5QmFDTUpjMmR4dTM4akxUSy95YkdHellLS3Jr?=
 =?utf-8?B?NUNaZlBFbDRtaSsrN1g2eG9YeVI0NzgvbkFmWDR6NDMwOExueVVhL0tnbHBo?=
 =?utf-8?B?TGU1NXUvd2tYQ0xuVlFsdzBlT1Bzejg5ckdJdHhmV3hkSmJLeThSRGFPSlpj?=
 =?utf-8?B?cWNIRVh4Z3JtRVp4L0dDc1E1TGdmaWRBbCtaZDUxeHV3MFRSZ3ZNUGJDb3Fw?=
 =?utf-8?B?cVNqZGN4eUkrbUF4bXJkQXVWRktkbzNtSU0xQ2lTRU9LbkEyVXBNUWpFNFRl?=
 =?utf-8?B?am5VOUwrWUhEdldsaG8xMHYvajV6MVBabmVNN1RodjdGTmk0UGYzalh2MEpo?=
 =?utf-8?B?bHVNbi9nRXgzc3pJOGpsQ09rRFI3blFPb1hTVmc2L1V5TnJVcWdPOGl0WUdQ?=
 =?utf-8?B?ZG9taW5rcWhvT0JiaEJ6bERqdG11S3FpKzBURkZBOEN6cCtwV1BpRDB0cXhz?=
 =?utf-8?B?cGFwTEk4UHFKak90MndDRi8wZ3F0cFBMOTJtek1rMlhLQTB3eWVSb095eHQ4?=
 =?utf-8?B?QjVMU1dKSkZhS2ZVYURyZ1d2SFhtZ2dnRmh4WFdRK295K01UNzBFSGllOFJw?=
 =?utf-8?B?bUp4VzdNSW1rVnFzQ2M0MXBsNzZaV3c0MkcvWk9xWnEyQ21hWGJnYWtoNDE3?=
 =?utf-8?B?UnZYMkdGQzh3SUY2VTJiMnJLTlpUeWNmSzRRZ3EvN1RwQWFSUzZLZ2N5ZXF3?=
 =?utf-8?B?UGV6UUp5WGdaVFhURVJHVytzeFhoZmVUWG5KR2N0YVJBaVB5SXltMzZVbUtD?=
 =?utf-8?B?bXg2bzNmYWR6NWhlNUZCdFQzRU8rdGVLbWl4UlAyS2ZaVmwzSmR0UUJTay9I?=
 =?utf-8?B?TExQejlsTEsxaUVRZEFudzY5MWtxMHplV3h4d3NWTXdjWEVVME5nL3dYNjdw?=
 =?utf-8?B?ZzFkbGVXVXBtZzBmZ1QydVVYTmRyRlJiL01FK2IyaElueUtuOEVReGZHVmcr?=
 =?utf-8?B?dHJRRWc0SGlVL2dsTzNoS2IyOHVFR1ZpTnJCcUhHNUYrcktlcVhnUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2383acab-0a46-4faa-2e15-08de6a458568
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:46:35.8518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjtllcW1++dsRKVeZrBSuiqx+/UNrusYzyUTMoGfiBSgaA4SgJ+Q3ZJwN7wao33HNcVoX7cZe9QmK3CDN3Qh0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6200
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CA06412E7B9
X-Rspamd-Action: no action

Introduce two new build that run on macOS Cirrus-CI instances.  Those build
the hypervisor using the elf cross-toolchain from Homebrew for both x86 and
arm64.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I haven't added any randconfig jobs, we can consider adding those later on
if the builds are stable.
---
 .cirrus.yml | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 7bbb4f1c5c6c..b9608e71cca7 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -1,3 +1,5 @@
+## FreeBSD Build Jobs
+
 # https://cirrus-ci.org/guide/tips-and-tricks/#sharing-configuration-between-tasks
 freebsd_versions: &FREEBSD_VERSIONS
   env:
@@ -122,7 +124,41 @@ task:
     path: xtf/tests/selftest/test-*-selftest
     type: application/octet-stream
 
-# Test jobs
+## macOS Build Jobs
+
+task:
+  name: 'macOS: hypervisor build'
+
+  env:
+    matrix:
+      ARCH: x86_64
+      ARCH: aarch64
+
+  alias: macos-$ARCH
+  macos_instance:
+    image: ghcr.io/cirruslabs/macos-runner:sonoma
+
+  environment:
+    CIRRUS_CLONE_DEPTH: 1
+    CIRRUS_LOG_TIMESTAMP: true
+
+  install_script:
+    - brew install $ARCH-elf-gcc $ARCH-elf-binutils
+
+  build_script:
+    - make -j`sysctl -n hw.ncpu`
+           XEN_TARGET_ARCH=`echo $ARCH | sed -e s/aarch64/arm64/`
+           CROSS_COMPILE=$ARCH-elf- HOSTCC=clang -C xen
+
+  xen_artifacts:
+    path: xen/xen
+    type: application/octet-stream
+
+  debug_artifacts:
+    path: xen/xen-syms
+    type: application/octet-stream
+
+## Test Jobs
 
 task:
   name: 'FreeBSD: XTF selftest'
-- 
2.51.0


