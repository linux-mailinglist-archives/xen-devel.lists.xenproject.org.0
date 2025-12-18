Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5AACCD32B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 19:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190156.1510779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWIqK-0007Tc-3i; Thu, 18 Dec 2025 18:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190156.1510779; Thu, 18 Dec 2025 18:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWIqK-0007R8-0n; Thu, 18 Dec 2025 18:35:16 +0000
Received: by outflank-mailman (input) for mailman id 1190156;
 Thu, 18 Dec 2025 18:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6E0R=6Y=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vWIqI-0007R2-OX
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 18:35:14 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 453aa748-dc40-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 19:35:06 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5803.namprd03.prod.outlook.com (2603:10b6:806:116::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 18:35:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 18:35:02 +0000
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
X-Inumbo-ID: 453aa748-dc40-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCX5zy37EZpaeZKqKC1vDsXsjqgWJ/83frrgGFdpGG+xfpcUgVKvYr20dLnvAmSjprDxBzUkFMdQpAxyZqjS77BNQrdyZZpduTCHZpd5SoaL6JOKEk49KDR3yYeXJTJgV6Bft+IRsWVn5SuR/tfnIj9t93BgG2tWE3TbVSJIwspUBIgpX4Vgq0d8+w3rXGIJZDuie87QyN0l8O6oo2NZ88mD+b7iNJ1Zra5bnyxjVYAuimxzoqRLJpb8oalod1naT1+xNCizkU5/4Z4lvI8oN+ZhIKO9MUsk4ixjm6vZrDOspSI6bNAujWt1iaFt4uAUPNGR5KqVIY7JxHeWJPjsEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4u6/yMZAyGVb2ODTm32SHrOl5NZ5ws1xt8qRPWyPuI=;
 b=hs3/Zy6QW2oqReBkFUM1mCUBV+G4ESfd3SmjX9xuvzJ6b/q78XBqB4EqJ+assoSTAJ/rOFVs2EncQBTuDQDqiLO/F3ph4i0GZ1lPKFVTB9SNwTREUsb06INNab5mCAuAjRHSxYXq4bhISpF+P8Am1f8X3qA0F55zHFkNluoyE0jvQBRwh6R2xP9Q/BGYQJiMLElDMx/KOj1p6ZExyyDXlkZHqlty751wtSjdb97SPKOwdLihVUO6Hg4JpmjH/AwgfVJI/I8E+F/ciosV8DZCn+Ga2FLCzPTsRejsio6cQekbFdhROo+ddYJBH3I5TO+raeZl2H+BfNqvD1RKeBlccQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4u6/yMZAyGVb2ODTm32SHrOl5NZ5ws1xt8qRPWyPuI=;
 b=o2ItlTzUB5tSNfkR6b0+uqf1axsmFJTBQ1ciu6a+0DbnGIedW9BhEJDHBsGSdY7PM0bkIAJHeDlLPuBIBCYUu4u+P7KGAdLuS4tUPesoTLq2JSu208iVFOp05kfvg8NuVvBEqmgRurtNRldm09dJhq79TKw+2xrw2iPY/8LtbUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <803b31e0-c696-48fc-bed6-3d62ed4563fc@citrix.com>
Date: Thu, 18 Dec 2025 18:34:57 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v2 3/4] xen: move alloc/free_vcpu_struct() to common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <099753603c18bbba0db702746d394c2e77e15a4d.1766053253.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <099753603c18bbba0db702746d394c2e77e15a4d.1766053253.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0381.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 64eee408-a4e5-42e5-f9a8-08de3e6427e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzNEd3VVSVlrUm9oVVJRRkdMK1ZscEZ0LzdEajFOanlLZGFSbXhTaGcxdWV2?=
 =?utf-8?B?eFRGZHV6Q2o3ZGNSbStqRDk0eXhTT2xRYUY2Q21TcnRGaVpvNTBlZndQV2pK?=
 =?utf-8?B?Zmg1WWZJWWJpeHkxSWRCcGJFaURWM2prZzZnbkFpMnl5aTA4K1VWU1VmU2Vs?=
 =?utf-8?B?dk9tZ0ZkZ2NJSU9pMGg1SUJRcDh2bFp4enplU0FUdmZOMVphSzBYa1ZtRXVT?=
 =?utf-8?B?d045L21uUmExV2tVc2RVV2tyTnlGZ1QwbXZRbkZiNVlOYm9NR0RlMUI5Qlhy?=
 =?utf-8?B?dHRpcFBSZXhUdkpiTldHVEc0anNXTjl6eXdUeUs3ODcrUE5LeFZ4ZTFRTmpB?=
 =?utf-8?B?K1pFMjRucVlobnZkT3RsbGRyOUMzQWh4VHNvdklOVlFRb0hSdFFpUkZTb09j?=
 =?utf-8?B?bGZ4emgzTEo3eWNJQnNibnFRRkJzWWJCWWlwQllwVWswTEkvVUQwREJvZlZR?=
 =?utf-8?B?Q2VmVndsZldiVXI2RHRxN053T3dQREY1ZmszdVZpQkpxWmp6OVkycFRjYVFl?=
 =?utf-8?B?ZE8wUmtwUGRNQVJ4UVVyOFpGYW5rS3k0N1hIR2lvTDRYeFczTDAvUUU2VGZG?=
 =?utf-8?B?OVJSMEtoU3J0SGFxR1YwRlNYbnBaNEZJdVNQajNqcFdORURQRVNRMmFxS0hZ?=
 =?utf-8?B?MDZyRmZxS3lKZ0h6cWEzdHVmUmR1WDBQKy92djk4ZGZNRDhxekRUUW4xc01v?=
 =?utf-8?B?WVFDaUhKY002dldWeFJzYjFyb3FUNFkwT3FrWWNpZ1BvMGJLVVQwc3hRNjJh?=
 =?utf-8?B?eEVFb0hVSC9sai9yd0VrRUlyMHN4djhhUkxrOU9KdTZlY05GSVVwWFlxSVk3?=
 =?utf-8?B?ZjFIMndVSHFYeTIxd3RaeHMreFFRR2laelNOZm1vRWRNcUdwYjdNZkp4VHVO?=
 =?utf-8?B?TnhzZXFNRkxEZk1tM1ZDbGlzUG9jU1RJek80T1pHcXM0b1Z2QUZPd1Q4Mkpa?=
 =?utf-8?B?QzVaa0RQL0F3ZERZb0t2Y1E0cWdMc2grZ2dlRW9FNk90V1lSbG41ZnpVSzdD?=
 =?utf-8?B?TTVUWkpkR2NsTWdLZERldVJ0ZU5uakJtWWNxK21wWFlmOVR3MGNIYzB2T2gv?=
 =?utf-8?B?NHIzczhEMkR6WVBrNGtPbzBwZ3I3THJ5UW1ZNm1jOUR5STBGMzUxNndqNDk2?=
 =?utf-8?B?U0llOWdRVWl6ZWFlRUw4K2tSemRSOWdRMDJUSytSekppUmNEaHQ3SDBtSi9s?=
 =?utf-8?B?RExUOGNrNEd0YkJzZnlVRkpOWmVsSXJLN2U1Y1ZuOUR5UHk4dFp6REd0Zlp0?=
 =?utf-8?B?SXd0NksybkdwcEpjeWlURXJIM0o4M0pkODFwQmpWdWdnWTA2NWdOd0x6Q0tE?=
 =?utf-8?B?K1pwbHREUFZKZ2NDbVpHenlKNTNSRnNVQzljaTJXZE54MVJ6OWhOdlBwNWV0?=
 =?utf-8?B?dDEwN3JScU0yeitqZTFxQW5iSTVlTHNRU2ZvUEIrSnd3aVFOeTRsRFlMV2RX?=
 =?utf-8?B?V0hURWRMaXo3Wk5FckRWK3Q3Z0h0UTh2WEwrQnl1dmJRZHZPVE9sWnE4Y0hU?=
 =?utf-8?B?djlERFBJeGJWTUdIcDk0RmNSanU0a28yNkJuQXR0NWpuaDZNMm9vMEg3WE4r?=
 =?utf-8?B?OStqdC9mdFhoZWsvRE9kRlpsckxSa2E1dVoyNEt0MnRua3pyRm9sYnczM1ly?=
 =?utf-8?B?cVlnTU5WVWRrSEVnMldOOVljT2tPOUZBK3lTZFZYeTNIbVc0OEN1VFZHWGtX?=
 =?utf-8?B?amRaUmc2czZwSmcxKzZIZWxqdjJzUkdJMllWemNBaEg2cUovVkRON1pTYkFl?=
 =?utf-8?B?djZTbkM1UkFGOXVEZ3ZjY0psUE9rTTFRUjdNSjcvQWhjT3JnUDgydEFMQzFh?=
 =?utf-8?B?bzRuZlc2c005LzhEOEhVaVozNmhxYVpZd1l0WS8rdkRyM29KT2xhbzl2d0Iw?=
 =?utf-8?B?b3JEL2JacXpzeERlK0tTUkZXSHlad2hEc2xPRmxwMTdmSGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0lnem5pN1hVVTZOdGNKYWdqMURlYjBJVDVYRFJBa25Wc0ZKdlpmT1JFQUlK?=
 =?utf-8?B?TEFEQmpwNm9IRk91dkZ1ejZVOUNPblM0Mjd1OXI3blo4OUg4M3lOYVhLTW1r?=
 =?utf-8?B?RnlYZzV0aTJvb3VPV3lEd1hnQ2hJOVdLZ3V5UjNCL0V1VTRJejZSQ2tXb0JP?=
 =?utf-8?B?MWE0MnI1S0FRMGg2TG51QnJvQUNsQVZqOUUvTjBIYlk2SXk0YVg4L2ptWlh6?=
 =?utf-8?B?aVcrTWQvVGNzTjlkdDBrYjYzTTNiZkRUa0gwOTd2R2Q2WlByZGZmeWpteWZk?=
 =?utf-8?B?aUw0Rnp5U3B3a0I0Z2hkRENka3ZxMVRFWGM0MUp4VEg2dGg4RFoxcFhybG5y?=
 =?utf-8?B?THM0aHJqVW9CNERYTWkzVVA4VkRFZVBCSk1Hb1hIdW5hc05nSk5LWkV4cEtl?=
 =?utf-8?B?RDFEbWQ3WmhERW1nMUkzSWZNZTUvMGlPSFZ1VHBNdllaV1FTVU42akR6N0lY?=
 =?utf-8?B?L2ZhbVRHTFA4V29mTGhnMzdDVVNjdmRMYnI4eUlKVTV0NDZVSy9TQU95Ukpl?=
 =?utf-8?B?M0dEcWorbnNhVHBpV3AvZU8rSkZjRk5qYlRQeVIvbFcrbERvbWJwMWtyZGor?=
 =?utf-8?B?WHkrd0lJTVNoVEdpbkZic3VuT1FPUnFWNE1KU2NhYi9Ed0VnWWdTTFpEaThJ?=
 =?utf-8?B?UitiMUF5cHNQTzh4bUkzZGljWjc0NGJ6UUt2RVhXaHgvYzRsbWhramR1cVNM?=
 =?utf-8?B?aVk2WWdNSEdJdzZoT3hmSnFJY0c3UGRhNzBIbkQ4OGcybXhScHU1Mm5WRU54?=
 =?utf-8?B?em9RSmJVbVJMTnNUNGtIb2RnSGR4V0Radi92MlV3WGZRUjZMN1lXb3NMSFR4?=
 =?utf-8?B?Vjcyd0VRM0R5L1JPYmxhSnZOdHhHYnJVYnd6d3g5ZWFTRnBOU1Jxeis4eDcr?=
 =?utf-8?B?d3JPMmY2VnR1YmcrMjdXMjN6Z253VjQrRGVtcWdlR1B6UlhIbXhuVmpJaUNP?=
 =?utf-8?B?ZmZhMXp3U1dtR0pQTE1oSUlsa2lzZXBiRDhCOTQ4U0hOOTQzWVc1WjJpS3A4?=
 =?utf-8?B?N29xMUFIUzFNRWR3eVM3WHlZYk1WNU55ZC9hT3NnTmlYdW9qeXhSR0pCeVA2?=
 =?utf-8?B?akxuTVR2MnBsZXNOaGloUnFQVU9pMHZrdmkrZklYTWZLS2R1cXdnNXI2Vldw?=
 =?utf-8?B?Y2IzTnQrejJLdTJJSHhmSEI5RWhwK0Z3VS9hd3RSNVloRmJwTWVIR3RWRXhh?=
 =?utf-8?B?MUpJSVhKNmhwaFQ0WTBjOFg1Qk1kMWpyUUxsQlM3NEdqNHBnKzVZUjdycUtq?=
 =?utf-8?B?Y2F4cXBhUlRRWEQvZGF2UlRiemZaTEFJSmxQVDJ4dStUUU50cXp4ZkZzQno0?=
 =?utf-8?B?dmU5eVhSL3ZzUm1tQ0E5bFV5MTd6OWttYythSzNKZ3pmd0R6SXZIT3NwSWVP?=
 =?utf-8?B?VDN5eVg4cEEzSk5QemFiS3VZYVhQNDNOTHZhMDVRMkN1dCtYNDYwd3o5eXV6?=
 =?utf-8?B?YnZoaVZNS0hMbmRaeTdHTy9saGVRR0hxUVhtWnM3YUl3Z2ZjUWdubmhmREh1?=
 =?utf-8?B?ZkJMK010d3NHU2RKK0hpaUpEUndjR2diVkxPWU8yajZJZ0l4STlzSHVrM1pM?=
 =?utf-8?B?Q0lGZjNVNm9rMzRuZUozeEhkUXltVzh2dVBGMllad0JrRitxSkVxempSMkpa?=
 =?utf-8?B?bWc0cjFxVjl4bzZucVFpdTF4TFdhSGRGc3NlNjZ6R2JydEhKUXp4ZzRpTGY0?=
 =?utf-8?B?WGxhMDJFUXhHUVFHMGw1S0NkMUpMOEZRKzVieThpMzdJRDdhSCtYTGJOMkdt?=
 =?utf-8?B?WG5JVnQ1dW9jNG5ZMjgwWU9kK2k3b1JoTlFZZUsrSHB5N3g3VDJVQ3Z3c0ho?=
 =?utf-8?B?eFNSK2publNpSmJXa1FNQmhTR216TWJ6eFZmaEYvRjRUSFZudTJZZi81SldG?=
 =?utf-8?B?UDVsclAyYjM1dlpXVFZGbzdwUUZ6bW84SDN3MnFEZk5EUllFYmRlZWxyVjQx?=
 =?utf-8?B?MnJqRWFRV28ycFNmUm9BWlBPS3Z0NHFMZWdCVm03VmNIMUxReGpaQjh4VVRG?=
 =?utf-8?B?dUhOL2Z4VklESk5hSXJ4ZHZiYkdidW1tWDhpODJLcjZ6Znp4d3ZDRGtwWG9H?=
 =?utf-8?B?d1kwSnlsbFV4VkZnRnRYdWY4KytXc2xRb1VIamVVMmM1MGlJUlRldzJHQTVL?=
 =?utf-8?B?WXpZWG9La1RuRGZQZ2prS3BJMmZreGpmUzBXNXFUY0t4K21kczU2Ym95WE9F?=
 =?utf-8?B?SE1UNjVZSm1pNTlGaFdvK2I5WUEvZ2NTZzk0S2FZaVdaQWU5cHdDcW9zaGJq?=
 =?utf-8?B?UG5paE9TY3UyQTAvaUQ5WVpoa1E4WGdGYXlvdFMvdWNTdHc4ZStHV0hpa0NU?=
 =?utf-8?B?WFo3TC9uaitYcnNWVkdqWjhMa1lsTTdxZTFPcHFHYWxVUnM0MW1jQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64eee408-a4e5-42e5-f9a8-08de3e6427e5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:35:02.0889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRfM4tK/4YhwpU9ODyvE5zbAtzw1Rp4X5OZEGJIsTXlc1bxtnmUKtNvq2gB1HttIyMddLPWyf4UEROCE68kl/oTDypGMZv9qCGuM0zhCcuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5803

On 18/12/2025 5:28 pm, Oleksii Kurochko wrote:
> alloc_vcpu_struct() and free_vcpu_struct() contain little
> architecture-specific logic and are suitable for sharing across
> architectures. Move both helpers to common code.
>
> To support the remaining architectural differences, introduce
> arch_vcpu_struct_memflags(), allowing architectures to override the
> memory flags passed to alloc_xenheap_pages(). This is currently needed
> by x86, which may require MEMF_bits(32) for HVM guests using shadow
> paging.
>
> The ARM implementation of alloc/free_vcpu_struct() is removed and
> replaced by the common version. Stub implementations are also dropped
> from PPC and RISC-V.
>
> Finally, make alloc_vcpu_struct() and free_vcpu_struct() static to
> common/domain.c, as they are no longer used outside common code.
>
> No functional changes.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>  - Rework alloc/free_vcpu_struct() to work with only one page.
>  - Return back the comment about the restriction inside x86's
>    arch_vcpu_struct_memflags().
>  - Drop MAX_PAGES_PER_VCPU.
> ---
>  xen/arch/arm/domain.c             | 17 -----------------
>  xen/arch/ppc/stubs.c              | 10 ----------
>  xen/arch/riscv/stubs.c            | 10 ----------
>  xen/arch/x86/domain.c             | 17 ++---------------
>  xen/arch/x86/include/asm/domain.h |  3 +++
>  xen/common/domain.c               | 20 ++++++++++++++++++++
>  xen/include/xen/domain.h          |  4 ----
>  7 files changed, 25 insertions(+), 56 deletions(-)

Much nicer.

> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 7632d5e2d6..68c7503eda 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -493,28 +493,15 @@ unsigned int arch_domain_struct_memflags(void)
>      return MEMF_bits(bits);
>  }
>  
> -struct vcpu *alloc_vcpu_struct(const struct domain *d)
> +unsigned int arch_vcpu_struct_memflags(const struct domain *d)
>  {
> -    struct vcpu *v;
>      /*
>       * This structure contains embedded PAE PDPTEs, used when an HVM guest
>       * runs on shadow pagetables outside of 64-bit mode. In this case the CPU
>       * may require that the shadow CR3 points below 4GB, and hence the whole
>       * structure must satisfy this restriction. Thus we specify MEMF_bits(32).
>       */
> -    unsigned int memflags =
> -        (is_hvm_domain(d) && paging_mode_shadow(d)) ? MEMF_bits(32) : 0;
> -
> -    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
> -    v = alloc_xenheap_pages(0, memflags);
> -    if ( v != NULL )
> -        clear_page(v);
> -    return v;
> -}
> -
> -void free_vcpu_struct(struct vcpu *v)
> -{
> -    free_xenheap_page(v);
> +    return (is_hvm_domain(d) && paging_mode_shadow(d)) ? MEMF_bits(32) : 0;
>  }
>  
>  /* Initialise various registers to their architectural INIT/RESET state. */
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 7e5cbd11a4..576f9202b4 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -15,6 +15,9 @@
>  unsigned int arch_domain_struct_memflags(void);
>  #define arch_domain_struct_memflags arch_domain_struct_memflags
>  
> +unsigned int arch_vcpu_struct_memflags(const struct domain *d);
> +#define arch_vcpu_struct_memflags arch_vcpu_struct_memflags
> +

Given the single caller and simplicity, this would be better as a static
inline, except it can't yet for header reasons.  So, instead, I'd
suggest simply:

/*
 * $COMMENT
 */
#define arch_vcpu_struct_memflags(d) \
(is_hvm_domain(d) && paging_mode_shadow(d) ? MEMF_bits(32) : 0)

This form does double expand 'd'.  The more complex form would be to
match
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=c37bcb35f928c81cbeea7c05f86b6779f8a2b8c4
with a local variable.

> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 93c71bc766..92fc0684fc 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -392,6 +392,26 @@ static int vcpu_teardown(struct vcpu *v)
>      return 0;
>  }
>  
> +static struct vcpu *alloc_vcpu_struct(const struct domain *d)
> +{
> +#ifndef arch_vcpu_struct_memflags
> +# define arch_vcpu_struct_memflags(d) 0

((void)d, 0)

~Andrew

