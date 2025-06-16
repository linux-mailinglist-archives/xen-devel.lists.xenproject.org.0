Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6CBADB788
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 19:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017516.1394510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRDHo-00046f-4Q; Mon, 16 Jun 2025 17:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017516.1394510; Mon, 16 Jun 2025 17:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRDHo-00043h-1Q; Mon, 16 Jun 2025 17:06:20 +0000
Received: by outflank-mailman (input) for mailman id 1017516;
 Mon, 16 Jun 2025 17:06:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X1eO=Y7=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uRDHm-00043X-T1
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 17:06:18 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20608.outbound.protection.outlook.com
 [2a01:111:f403:2405::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3707732f-4ad4-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 19:06:17 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.41; Mon, 16 Jun
 2025 17:06:13 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 17:06:12 +0000
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
X-Inumbo-ID: 3707732f-4ad4-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJd9OVQOeZDHdgCpaxH6Gmd81XHpYfO73V/Ug+ODDxApJG4+oWXK+fIYlnkhIjPzJtdZQ+COT8zzgzsXRHv/IBuFuS2hQ1ZWzPvoqiN1co1ZSAmy6TgcSJXGihauzyvjx3btBn8vJECJrklp7fPi6hHCTyTD9QzWa1KWyzWZoF7cWbG2irYuRkQl83TelWn8+ZTy93Ipere/iuQCVCbuWaq3IHmz+6dlbGeraBEH43H85Jk8qJ76lFAfhaE8YDaIkkEXwE6JBt7AKM3wXH21Oms2t+2ry2aGVaDBdSsi40uqarIKP2FdqZxT35pPUTU4E6amJCGewo6MditaZJzKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qh4W5qI+YCSSzs+c8qrJvVQS+T+ygAHQ5/ZlpJFgCmA=;
 b=RJVz+bKizm+PWi87VAHa5vRLZeUo1XE3aJ93iG0SLgWx781EpqPJ9dx9HVSDSU5oWKxeqdG88R2r+kHjBYIIveAFIgBIihIxJV0jpj2Lhhs6rTpgGO21Vzp4B1iP4kvK0sAChIuAxrK2tg4BCtLOuI4xP+v7VmXbdYCj8IezBeDcGDAWGRrOf9/NiJEanXLSUKHhqbIHks8vtuixUNV60SGubtaiXDRQLcE4fMu9D8408xbS0V/aCc22Z4kq7JhMVFn6hjyn5HEEJZDo5qLail91SSrVzlmLl3/zi7Mb4Q8oJl0apGnsnqd5F/iISfcRxaVLnxT0s+KICHFKARR0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qh4W5qI+YCSSzs+c8qrJvVQS+T+ygAHQ5/ZlpJFgCmA=;
 b=alw82FhneLz+miLFVVK5AQwlgj2KzAb+tzpc2+pgagJ/nUKAZDJar3FIJMgRkuL11d8N0Aq98Rnjh2brkYtFaYRPlun5uXyzIUHEL1oqOVW3+b2brggweNVYO+1OoAixo804fP8wEvlHIiFjHpDb6yRGePwJemwH14XIYxSIB4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d3014f74-b56e-40fc-94e6-484813a55165@amd.com>
Date: Mon, 16 Jun 2025 18:06:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm/mpu: Define arm32 system registers
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-6-ayan.kumar.halder@amd.com>
 <n2sff6r653loabxjo3n5bkqkpfo2sfz33ugnhpzme6dxv5qko4@nsz7m43u7t2w>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <n2sff6r653loabxjo3n5bkqkpfo2sfz33ugnhpzme6dxv5qko4@nsz7m43u7t2w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0060.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::37) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SJ0PR12MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a3e589-580a-4158-00dd-08ddacf818d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3lNUUZMRWpiajhCMlNXeDVxR3BJMWV0SThtQklRY3BsMnlDbVpQS3AyN011?=
 =?utf-8?B?N2QwL2hjOGREbW1STkgvd24rZ3IyUExZUmpYZ09CNVJwcXNQc1IzMVdKZzQx?=
 =?utf-8?B?WjMzOUxDTEpTeXp0V0c0RXQydTNKRG1relRkMWd3MzBvWDRpYVI4TGlqaitH?=
 =?utf-8?B?WGVXTWZPenAvU2wrMFNGajBUZkFBNTlNQlNwU3E3blh3QjRyc2RUb0I2UWVD?=
 =?utf-8?B?WGt0Y29Ja2ZpdUJld29jOVBOdFRHaklJSjhOOXhUTUFkOUcrM3Y0NXY5azJO?=
 =?utf-8?B?ZWErbG1ScEw2SkRhbGZSNFZlYVVSOTV3NThhRVpMQSthYVFIdy9aelk5RS9S?=
 =?utf-8?B?bkhqRnE4eUduWGQwOVpPOFdydk4zVmpLMTdYV1NSNjZMR2Urc3lScE9lZ3dE?=
 =?utf-8?B?YWRob2QzNnpBSGxrQ2dpYm5hK0F6RFJaNDZzUmFNWmI5N2Y5SGRjOEphMTZR?=
 =?utf-8?B?Q3FuK1JkWU5VM1ovZWE3Kzg4THNpVU5zQkhZSmlicktwM25RdHZMNzAxT1lN?=
 =?utf-8?B?ZlZBNGpHSFRoMWNzSHBXTjNCNWNic0FWWUlENExESS83NXN4TU9SY2xSSndB?=
 =?utf-8?B?WXdrclhUTGVvd3pCUHh5eUdHemFXaVFCUE9ERkRDNEN5R3BwSHV2QnExV1Y1?=
 =?utf-8?B?OUhtQmt2SnFNZ2RaNkR4UzhSWEx6Tm5pYS9aR1o5NHNyWWREc0t2d2J0bGo5?=
 =?utf-8?B?bFRDeWVDcVEzMUVaaExWRURpZUxxb0FZeCtJSTJNd0IzVGJuUHNZbnZWRENv?=
 =?utf-8?B?dXVtMEI0eFp3Vm1VUXNKV2VaeUkzTkFONE5EK25oZE5xcDhoSHExK1BselpR?=
 =?utf-8?B?UFlRUHdVZFhxeVYwQ3JMcXJpWTZ3dEo5ZEY5SlRKQzEvMGFucG9Jb050MFFI?=
 =?utf-8?B?VjNabG84L0h4cGh0ZFJkQmRSV3VRTDVFMHhJM2hqUjBwVlhmTmpPQnFDNDU4?=
 =?utf-8?B?RTdFenFyaWs5aURHU2lYQkJlNTB6elJ2UDJyMURsSmkrMVhEVlFLTk1adFhs?=
 =?utf-8?B?V29wWW1GZDh5RDVETkREOFhjNlRsUTJCWmQzQVAyUVFnUFd3Mnp3OVIrbGlN?=
 =?utf-8?B?ZnRLYTJITDdOUGttelNYV016TGZOYzV5V0NOZXgyYnprR1cwTHZ0cEhhUXpS?=
 =?utf-8?B?L1RqQ243cnZPUS8xcnBZU1k3UGlYY1BndU1GLzJteHhLTkxIdjEyZURxb29q?=
 =?utf-8?B?NVBrbUJ6WG5iOWlhKytzSU10SVF4L0ZNRXVSTlpzVmNSRytlREhEd2IyVDBT?=
 =?utf-8?B?aU1LQXV6QXhKYS9MbVF5dGJ5emtLQ3FiWVhXTzNlV2xtazhSemhFRDZ2b1pZ?=
 =?utf-8?B?RVo0NEQ3RkZIdS9OUEdrNkw0TGQvWit1SW5kdlVWenZMcHF1czlhRVFsYjJC?=
 =?utf-8?B?QzJyb3lPT3FKV3RqaC9pdXBvVmgwdThLNkNHSk9KNUdicW9rQzdtVVpXYUtx?=
 =?utf-8?B?dFdZbE44QW96MHl0UXBpL2g0QlhjR2FRM3JRcVdmTS9yd2tGeThrUkRySlh3?=
 =?utf-8?B?ZENKYmhNTkZ3ZFVOSXprNnU2S21OMkY3K2pHRGtnNTFQV0tSN2FMeEJCRVgv?=
 =?utf-8?B?aFdVdVN1d2FGMW9paVhKMTVQU0IwVFpsK08zSDhwbEpGU3FTVHZZN29XK20x?=
 =?utf-8?B?alNCa01xYkQ0bFY5MnRVaXFqaXRWWXkrbGU0VXppZTdVekRrY2tsNFZlWk9R?=
 =?utf-8?B?ejltL0Q3QVRjMmMxcWpSSWF3bU1iUjVlNm1GQThXbzQ1emRuM1dGSy9JU054?=
 =?utf-8?B?TkNiS2haaGhuZzRKZ2pFR3ZuKzhoRFMyOERxOHBERGZPekVGb3B5WStWdVMv?=
 =?utf-8?B?N2wzUWhOelE0YUZ5a2FGRGxsemNyemtxTmRDYlpaS1hSM0pUcTg3RHI3dGdX?=
 =?utf-8?B?bzQ5dTJ5VUNIUmVGbmxBM002RHRYN2tkU2lxU0sxRzlIT2Ntcjl4cWFhOUhE?=
 =?utf-8?Q?7dE4E99BRbQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWVWaTZJeHl1ZXZ0SG95NXlUdVBtQzBwZWJlZVVLWU5xSVBBNzhJZE5HVnFB?=
 =?utf-8?B?SVNnaVY3dm9CWGYwTDl1dUhBdUlXOEppVVZuV0pDeldlTXhhMEhXT2MwZFdY?=
 =?utf-8?B?NFMvMUhPTmNCWnVTSFN5UkJQV2xvQVV4dk9DNk55L2xLV2M1LzlPWnREaUtI?=
 =?utf-8?B?YVh5RkhVVWpWT01KZ1kzaXA4dHBoTG1tMGEyVjFPcDQrZlViNG45ZHdVc0xs?=
 =?utf-8?B?VlZEMndpNXBLdlZPRXVjdDhaZTF6QVYxSFlPVHB3U2ZQVFlDR2VQRGw1WGRW?=
 =?utf-8?B?ZmxCVHdiZzBvUlk3ZUl3dUhxQkV3WEFNQlVkOXhXS2Q2YUdOdGsra01pV1V6?=
 =?utf-8?B?bE5lcnZHTTlERG4rV2R0Tm16eGlBdnMxNXdBeXF3REZ4WkNsNnhyaGNrcVZP?=
 =?utf-8?B?NHNSTG1GQ3Z6SEZ2L3h2aDNJU2NUcHAyT01DUEw2c2RNNTZDNmtJZExkaVU4?=
 =?utf-8?B?bWhXdGdSYlA2VGJacUlqVzdCelgweW1obzZBaVNuUE04MjVwcWR5UHNUdnV5?=
 =?utf-8?B?TDBnd3VkUDF0QzNQaUYrcVdVV3pFQkw0aUtlcjJuT1c4S0tRaTQ4QVZWSGYx?=
 =?utf-8?B?dUpwMlZKbWZEQkhJcEtxOFdtYjhMbVNsVFhwVEEvVlpFbjdLTVhTRzlwelJi?=
 =?utf-8?B?TlBqNTVkZEdVb2lTN083ZjJZT0w5TGZJOEZKYUdyK2lDZjl6RW9PeiszZXNZ?=
 =?utf-8?B?ejJndmlScGhNNmdqL3BhaTJLTW5oVGtpamhRLzVkWnRWa3FMT3lBdnNZQUpu?=
 =?utf-8?B?cnc4Rms4UGtBMDlLUVF3blNFUmNxcU1DQTFOeG9aTUplQitlQStYbzNSTmF4?=
 =?utf-8?B?QzZRekhoZW85emtXbDBDMjJUWUNyTENCVHZ4eXBxMkpKKzluZ2p5K3NtRU1k?=
 =?utf-8?B?RVNJU2hZQWtRYTlVN0Q5NFNwd2NPdnFSZU5hSzNxcUdSSHE5T3FZVXhsTUxY?=
 =?utf-8?B?VlRYZlA3Y1ZpVUt2NmtMVFJuZ2ZwYmdCdklPVFZwNWt4UEhaaFcvaHpWcXNX?=
 =?utf-8?B?dlU2YnJWUzBocll1VVA3Z3BOZXpHdjNOK3pRQVd2d1QvWTF5bjNoamxUZU5y?=
 =?utf-8?B?UitqTStVc1l5YzVUZkw3eEF3em9NaDJZQ2xIejhadExWVnZpVU5SMjdDbjcz?=
 =?utf-8?B?N0I5NTVJV1BVZnFUcXJoZzFaQ3FiUjlXUC9WbnNjZmJkZDlRZGtKUjJtMU54?=
 =?utf-8?B?NXRjNFpXVXJhMVZLV0dyVXFMVm9JTDkrUFMvZE9TeTZjVVBYb09oaWFna1R4?=
 =?utf-8?B?VE4wNFNDTlJOUEJOWWphOHlERmJ3aS9HbXBXWndVT0xRREpEbW53ZUVLd0d0?=
 =?utf-8?B?K0ZhYVNYcytxaFkzZzR3cEozZVlIRFFXTll6Z2MrUEZ4anFPYUw1cXQ4Z2Y3?=
 =?utf-8?B?SnloSFZuSmtYTENmMGw3L2Zic0loWElNYnNvNXQ2blNUTmg1RzVoaW5YNlVP?=
 =?utf-8?B?R25Eb2luUTZaN2xVVnE2Z1RURWNxSTBOY0lIcEdWRk9RY2VPVVhVSFI0bFkz?=
 =?utf-8?B?MnB6VVJrM0Ivb2ZUYjdhZC91ZnVEYWZYVllVekhtZ01JQmx6SnFuV0RVUndm?=
 =?utf-8?B?cHdtcHV4cjQ4d3RCYzJiQSs5Ui8wV1lmdTl5VkdaaHZIS1JodmxQaWptTG4z?=
 =?utf-8?B?LytVVGJFNDNKL243VnBCWDFrY3JWbGE3dFZmcHM2M0M5TnU1ZlhWaUQ0Um5Q?=
 =?utf-8?B?QWd6c2swMlViK1duT1loSlNwRCtDc0oxZUJtaWNLTkVMazdSVExwZUk0Nnc2?=
 =?utf-8?B?V0NKb3J2NWwvVDNOV3gvVWM5cWxUUkNIMFFoSjJ5d1dKdFpKVitORWl0NUFv?=
 =?utf-8?B?V2F0UGdmNEh5aWRGSlZ0MVVZd2NlaWNEQTcyb3QzdGY4dWlkWVVnb1NUMmc5?=
 =?utf-8?B?NVY4U3MrRDZSaWIzQ2RsMHNiN05UY2U5ZWFYYWQrTkJEMlRKcHJ0aVBiUGls?=
 =?utf-8?B?YmpnOUtNaG5IUmpWOGJMdzlMM2FyQ3pEZEg1OUVxMWc0WHNKelJ1dnBpNFYx?=
 =?utf-8?B?d3NRUkIwS3FkYk1YanpNUFBLL1FrMStJZ29QaGFqYjdndkZTYXlZajdkdnpT?=
 =?utf-8?B?NDdMTDB4dDhvNzkzdmo4dVN3TEg0WW5NVVRsVE80UXpsclQyaW9YN0d3VDE4?=
 =?utf-8?Q?2MojBw/4IZtAz+LoNK4d6PCsr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a3e589-580a-4158-00dd-08ddacf818d7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 17:06:12.8789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ded5rseh7oouwBf4lpUa9TNYh9OuzZQ3Ip3YOOEXc/XZVrRSYlC/zbQ6tXXnk4FeA2dQjNwga9wsxticZVQf/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808


On 16/06/2025 11:38, Hari Limaye wrote:
> Hi Ayan,
Hi Hari,
>
> I checked the register definitions for HPR{B,L}AR<n> against the Arm
> Architecture Reference Manual Supplement for the Armv8-R AArch32
> architecture profile (ARM DDI 0568A.c), specifically sections E2.2.3 and
> E2.2.6, and everything looks correct to me.
>
> On Wed, Jun 11, 2025 at 03:35:43PM +0000, Ayan Kumar Halder wrote:
>> Fix the definition for HPRLAR.
>> Define the base/limit address registers to access the first 32 protection
>> regions.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
> Reviewed-by: Hari Limaye <hari.limaye@arm.com>

Thanks and welcome to xen-devel. :)

- Ayan


