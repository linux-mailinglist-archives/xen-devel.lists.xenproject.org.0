Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2A7ADB786
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 19:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017509.1394499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRDGb-0003az-Pg; Mon, 16 Jun 2025 17:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017509.1394499; Mon, 16 Jun 2025 17:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRDGb-0003ZI-Mx; Mon, 16 Jun 2025 17:05:05 +0000
Received: by outflank-mailman (input) for mailman id 1017509;
 Mon, 16 Jun 2025 17:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X1eO=Y7=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uRDGa-0003ZC-4c
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 17:05:04 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2418::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a3a283a-4ad4-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 19:05:02 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.41; Mon, 16 Jun
 2025 17:04:57 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 17:04:57 +0000
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
X-Inumbo-ID: 0a3a283a-4ad4-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcQjBorX7K52e8zXNPeLeF52xjrA+z4a+8iQrhao9OF1tYXhB6W25b1BMC/BD/tTWG/TyAV+uGfEEUDTlyYkaC5kCRgZuQuZjpkDFOCpJi2t+khQRBWdgxAJ+AXnJkNj5GyIlSANoeIt2Z2k0eV5AMgJg6eZOA0loUfsVOZxAreX08b31VYizh25e+yTz6DYnazZ4kidujhGJjrsRJy6GQ4bZPWSgvIs9Wx5n+SyNMtX7u4jsvh5FfDVgIBFQdfmug3jUl+zGA24Cju1WTE+U6iJrf9leBdIZ1KDAk5O8+lGPBtujGW+kl5UuhF2lghvYqEIFQBBAGqG/n2FRZmKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVcjEOF6eT0bBuuDqPTmFuHl+8aKiC54N6sRdkEgYsk=;
 b=Db+zzzLtcWiz+hrsDSplinPPKfj+H59tY9gU6yDM+z9Fo1OeqoiqxLvdK+XFyXZgLBll/r1aW+7m3Rwd28psjTSIS+D/D/z3jpjQFe91MW70/opKWqjlzZpc2sHcJOBNXhO1Mr7xqoPaNPoeK2f0QnazFg1Q7RMILRRdmKQBKyVOkO/ymdHCJl6kLKzh6BkgWMP4xzTWyM51auemZq46gajozxJicFVHXsSnxOTJt7XmEBxTfAM+G9XGI0snkDsBZ9FKiXVMkrPzq4nbUroqUgl7z3bVJUEdAaBE9Xe/FgLS9IKSrUqMAF8oH0yX5nvCWyJNrHpuXJgdPlx+bVBFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVcjEOF6eT0bBuuDqPTmFuHl+8aKiC54N6sRdkEgYsk=;
 b=phqevA5a2SK0G15zyFS6gjOAKpUmfVs+6Jr4J6/5kPROeMYrcskKekKw7un3VcEKNZq5xkrrwVDAndG7HCjflV+XKn8/SPOwdAE6CeVRRr1TDvHEpt8FymuWY8gD69WldDJrronpdumjip1xW9nYTr9HMQFJN7lc1X+zaGZ+DLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f1f2b60d-6998-46ab-b0dc-40bce7f39239@amd.com>
Date: Mon, 16 Jun 2025 18:04:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm/mpu: Move the functions to arm64 specific
 files
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-5-ayan.kumar.halder@amd.com>
 <FB372638-8E09-4CCF-985A-25C6F0F691BC@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <FB372638-8E09-4CCF-985A-25C6F0F691BC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0054.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::31) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SJ0PR12MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a8e00e-ffd3-417d-a8a7-08ddacf7ebd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c09MMXFhNjM4SE1sdU05d2t3OXBDZ2paTEYyNmNYeVEzQU5aMW5CNUtUOExD?=
 =?utf-8?B?VC9uT2x6VHhiN05NbEkwVnNDeXJMYkRWdUhqNkNFdmdLUmpKOUY0UHBIUFdU?=
 =?utf-8?B?RmVxK2hLcUc3R1JzeFJNaTlybzhPOTY4bW9kY1ZkbEdrQ0h4K2xmMEdzM3Rm?=
 =?utf-8?B?a0ZhRHc3dlJkVW5kbDBQNTNJKzRhQW01OEJPaGVxWGYzNFZXMmlVWHR5QU9W?=
 =?utf-8?B?MEpmZnJaRHZEbjZodURXdFBFcXJxcm1hb3BMZk96eW5YSUw2Vi80eUl6SGdT?=
 =?utf-8?B?NEdjMkU0b0w5bVp6UmJtSXhSd2pRR1B6VW1wTlNpc0lML0dVOGcwYW9kNCtX?=
 =?utf-8?B?Z0VBNGJCODFJVWZhZWdLSVRuMHFia0hkdFZpZUNuVmp0VWNDaXlDamw5STU5?=
 =?utf-8?B?dmNPVCs1RnEzVXlmSkR5YmRBdGRZVE9mZWdxNmN3VU5McmdZV2s0eXhqbmoz?=
 =?utf-8?B?d2F1QTc5c1JSek1HLzFCdFZYeFVFZENPbGlWK1I4TnV4VGFCOGd5SHBTMGN5?=
 =?utf-8?B?RjZRdVM5NkhMN3BQNU9YdG5aVzV1emFkSi9jbnFmTnA5cjZkM01jTGpxWmdF?=
 =?utf-8?B?bkJZUFpWUGpPWEovSXgxcndRL0F2Q0JxWXk5S2dGTFdZTUhKb3NTcmJtS2JK?=
 =?utf-8?B?UWpTL2gvSjZFaGV1UzdwbkMrNlVQSHU3MDZKZTV5Q3dGRG5JYkc5RmpqQlJY?=
 =?utf-8?B?SytXTnlWZXhhdEhyT0EzZFNLemV2WXV1TkxkMllOYWYxazVYbDlxREdrZGFY?=
 =?utf-8?B?d1lMOTRuVHBta2V1WkdycWRZMUpPajRnYVM2M1NuYVJPWG05OXJpZnkrVXdx?=
 =?utf-8?B?aFNiUUtiY0FseTFKTzU4WjFDNHlMVGVuSFBEWmo2UnJyanoveCs2aGtJeXgx?=
 =?utf-8?B?dk1UVGVsVHlqWldjT1NUaHd4N3dkTHNpYTFwT2FuTEZ6czhMRndlTnQ0a1JC?=
 =?utf-8?B?T2dSaG1tUnV6aHh1N3NwUlZWSWNValVkSE5KcjExbVd2WlZuamExRDhkSkhB?=
 =?utf-8?B?ejUxSFdLcDNDZENJWGdPd0RTMjhsUVJta3RSdHZNTWFEU3dxd0lJc2cvRVVq?=
 =?utf-8?B?bFR5RVhFSzZwdFpCUVloOWFyTVBRTi9EejVvZFplUGRvanhPdFQya0wyK2Zs?=
 =?utf-8?B?U3liRVUzOTJ1RDk3SC9jQWVSdzltYnpNekc3WFdFcFZSTStjWENBQUowUE5j?=
 =?utf-8?B?ZWRaZ0RhTnRVN0NYSi9TNTQvcFJaYkRyS0NybTdoTkFYN21NcjJOQ2grcm1L?=
 =?utf-8?B?Q01wNjA2UHNWYU9RSkJ3c1VGbE11NnBsZkJENmZmcWgrM01hZEJTWFE2NEMw?=
 =?utf-8?B?UnlDbXAzY0RXSm1RNGZqOUR5ZVJyaWgwWGh2ekpzT2xNcFd4NStKM3pYK1lr?=
 =?utf-8?B?ZlMxbjRoUjVZYi9HVnFVcUo3YXpVY0tUYXo5Yk1udnAwNk1FNTBkcmYvamxw?=
 =?utf-8?B?dTkyOGsxeFFKUDNITktQbmVVeEp2UnlvVi9QczRNMVdqcHdVdXE3NTFRR3VZ?=
 =?utf-8?B?em44VTlvL0RaSnlOVlZCNEQ1RkJGbmsvU1JVK0twUFZrWi9VSW5tNHpUbG5O?=
 =?utf-8?B?QVpyZ1gyYys5dVdwbGxUa05hb0l5dmJMUGtiUWVFTmNaODFNNTEzakJzbDQ1?=
 =?utf-8?B?WmprcDNGMVhSZ0FBRktaN1N0VjM2dEVtK1EvM1JEck9yRmZZY3Q4K2o4cWhH?=
 =?utf-8?B?MlVRMmNkRll4bWVmNXVFVlNGT0IwNGhPVDEzL0dGMWJtQXhUS2orTHVKV1ZP?=
 =?utf-8?B?amJUc1ZBNEk1bjBubVlPbGNXYUptTGRzT0I0VlhrTTg0R29ielVwUUpUYmw5?=
 =?utf-8?B?Z3I1WnJBRUdFcjdScWY4QlZDWTdRU0lZS2wzdGcrQUlvZVpuZUh1S1JtVi9L?=
 =?utf-8?B?LzRQYy9wWXp6NWNZc29CSHlYR2J0UDJCT1N1U2tNdFB5QldrR0pGVENrRzVW?=
 =?utf-8?Q?7TpSgAaVS0k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG5oc054amhWR2pJdSs1L2lLQnhRa3dVdDhsU1UwMWFGbTl5S0tjdHZoUjkr?=
 =?utf-8?B?c0JIOGRLd25ndjRZUUZHQzFVUjdRVTVheGtIQmtrczZoano0aVNBTVVadkE2?=
 =?utf-8?B?TnN3d1hKc0VubmJ3OTBidlhCVGk4dklFR1VvWUdQZTF1WktIaVNYeU9wNytG?=
 =?utf-8?B?Vk5HWklrWjBoTzErUGdrSHlzNnEyZmRxN0F1OEdmbVVUdVpxSm9pVFBVRnAr?=
 =?utf-8?B?aU1aWk00UXpYYlJybDlQZTR2U1ZKZDd4SG1oRGhINFc3Nm9CcTVWK3dCcnpl?=
 =?utf-8?B?bUNndmNsZTZDcElaTUZlVnZpZCsyUkpFbWo1NENranFTQTFhSnlndTVpOTc1?=
 =?utf-8?B?Unlub2JIWFlYSFNhblZZVmZadUhRR1V2UHg0dVE2MnBaOG11d1lkZEQrS1U3?=
 =?utf-8?B?QlB3dWhPOG9kOXBhdEttL29MZFFsdU8ySnU1QWpJVER3a3EwVk5rNjBKVFBk?=
 =?utf-8?B?dWRRbk5xZ2p5ZzRvTjJrb0w0cG1iWkNLK1h4LzZKWnZDZE4wYkdTM1B2RjQ5?=
 =?utf-8?B?b0htVXJSUWh4OGE1K2xNeWMwZlg2NlV3dFUvelFhajVCV2lZVEZ2ME9HWHp0?=
 =?utf-8?B?OFB3RmR1c1loby9vM011NnlxenBoUWVQR2ZYZ2tTVnZXSXBIeTF2ZU9QYURq?=
 =?utf-8?B?Rm12NGdHbDlZL3ZSakRNUk1TTU44UjFHdG5tQ0lGMDRrcURJUmwwTXJCWGE5?=
 =?utf-8?B?bWFBc20rQXh0NjB4bEhVM1RGelRQWVpJMTA5LzI4dUFWaFlPZ2RhcFBXV3d3?=
 =?utf-8?B?Sys0eUU1R3J6UDlxVCtzamJ5M1V2UVh6SWQzTUZ6Vmx4dVVtY1hBeUtFbVND?=
 =?utf-8?B?Qy94ZkFFMHBERXYvQnFjM0VDaGRMV200Myt4MW52YkFFZlZ2M3U5M1JTZVFG?=
 =?utf-8?B?Um9GWHJnZC9mZ0RHamZoQU5tRHRaNU1YcE1CRWEzSzFLVUFMK1VnTzBNRy9h?=
 =?utf-8?B?OE1hcUZ2enhmMHI0UWhwTjNxUUNrOTd0L2p5MVNBeTZLVnNYYVVRZHI4OWlR?=
 =?utf-8?B?alZIZWxpWi9PZjVSTi9mZjYrZDdSSEJ6MTE1ZFZCU1ZUOUhRUzFHL1pGbU5o?=
 =?utf-8?B?b29kWmZpSDlocXJiK1hTQnBXTXhxR25PNmhEYWlVOXZkcmYyS1RlVkRJVVpw?=
 =?utf-8?B?T3pJbGU1RWxuSE9aWlhFMlFwcytEeVRvM2VFV0RaWldUeGVTbi9iVUcxZEpu?=
 =?utf-8?B?UGZib3lYcms1NHNlREJaa0FpWlB1UEFid2I1dlJ4cGRBekYrNkFXbHFYcUJ3?=
 =?utf-8?B?b3AyUU9CRUFjU3VMUDBCWldPWk9iaVJFajlSRDNWdXVwNVc5dzA0N21hUzNX?=
 =?utf-8?B?OHFOaEhyazB5NW5zaWw3NEQ4Mi8rMGdPbWl1eFJaSTFsVFZPa3hwZXo3anZ2?=
 =?utf-8?B?MWgzc1VZL09IUHE2cm02SjVLUkxkVmM1TGE4cFBoZzkvUjRlb2hRZDJ2K3lz?=
 =?utf-8?B?eitqRy9WamlwVHl4cCtmWGxkRU9yWGxUTmlVZkxTMHFwYWREbHFlZmJuOExN?=
 =?utf-8?B?M1ZmWU9CU1RwcEtpUEE5N244NnVXYkdlNWRUeEtoa3U3ZzlCaUJWcGFHY1hm?=
 =?utf-8?B?aldocGlndVpLQ3FNcGZjSDN2Vmt4ekJSRWg5WG5jcFdBZmJvMFBqOS9CQWg1?=
 =?utf-8?B?WWt3b1JGa2NsOElCZUJrci9WR3hENFpnRUplU0U0S3lscllBbUZzb3BOMXUv?=
 =?utf-8?B?MC9EWkpDaUVzaVRGSzNsbSs2RTM1VnUwV01VRTAwdml6RkRFKzZ1QlkyYW5t?=
 =?utf-8?B?WjhiY2JYN2RpcGU2NFhUb1dla1dwYzQwdlRpajNsWDBUajNCWU0xZFFlSjlN?=
 =?utf-8?B?dGd0Yk9NeXYvSmF5WXJBY1Y5WFo2dW5jeGQ1UUU4NGdVR2tIV0dZWHJIclJT?=
 =?utf-8?B?TEt2dC9KdVRPZ0ZrVStCRGhBb1l3UzdTMFAxSXpCNE4vYW5VbFZxcEFBQ1Iv?=
 =?utf-8?B?OXhVcjFIMlpiWEJiZGlpV1R4Qld4N1hLUTZGT1JkM3RhY000RUtOaEJabFRS?=
 =?utf-8?B?VWZHS3l3Z2JmbDFrak5vcU8xVjdYNjNRV0NrQWMvVld5Q05nOFo5RDJGdUxp?=
 =?utf-8?B?SkJ3d1FCQ1JrbUd5OVdjMzRQNnRtemQzRmJYZE9HVGlteC8wR2F4UnlJQXUw?=
 =?utf-8?Q?WG+0c+vbHDOyHqESQnZ0YdQrc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a8e00e-ffd3-417d-a8a7-08ddacf7ebd0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 17:04:57.3810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBF5uyRK6jrLKCR/3o6mltUXA+BbTGBTNRzeX4MmHazhuVSAHF4hXGd1XlGi/fZ4W8rt5WzMW8b81J928xnEOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808


On 13/06/2025 16:08, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 11 Jun 2025, at 15:35, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> prepare_selector(), read_protection_region() and write_protection_region()
>> differ significantly between arm32 and arm64. Thus, move these functions
>> to their specific folders.
>     ^— NIT: “to sub-arch specific folder”? What do you think?
yes
>
>> GENERATE_{WRITE/READ}_PR_REG_CASE are duplicated for arm32 and arm64 so
>> as to improve the code readability.
> It reads a bit hard in this way, what about:
>
> “Also the macro GENERATE_{WRITE/READ}_PR_REG_CASE are moved, in order to
> keep them in the same file of their usage and improve readability"
yes, this reads better.
>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v1..v2 - New patch introduced in v3.
>>
>> xen/arch/arm/mpu/Makefile       |   1 +
>> xen/arch/arm/mpu/arm64/Makefile |   1 +
>> xen/arch/arm/mpu/arm64/mm.c     | 130 ++++++++++++++++++++++++++++++++
>> xen/arch/arm/mpu/mm.c           | 117 ----------------------------
>> 4 files changed, 132 insertions(+), 117 deletions(-)
>> create mode 100644 xen/arch/arm/mpu/arm64/Makefile
>> create mode 100644 xen/arch/arm/mpu/arm64/mm.c
>>
>> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
>> index 9359d79332..4963c8b550 100644
>> --- a/xen/arch/arm/mpu/Makefile
>> +++ b/xen/arch/arm/mpu/Makefile
>> @@ -1,4 +1,5 @@
>> obj-$(CONFIG_ARM_32) += arm32/
>> +obj-$(CONFIG_ARM_64) += arm64/
>> obj-y += mm.o
>> obj-y += p2m.o
>> obj-y += setup.init.o
>> diff --git a/xen/arch/arm/mpu/arm64/Makefile b/xen/arch/arm/mpu/arm64/Makefile
>> new file mode 100644
>> index 0000000000..b18cec4836
>> --- /dev/null
>> +++ b/xen/arch/arm/mpu/arm64/Makefile
>> @@ -0,0 +1 @@
>> +obj-y += mm.o
>> diff --git a/xen/arch/arm/mpu/arm64/mm.c b/xen/arch/arm/mpu/arm64/mm.c
>> new file mode 100644
>> index 0000000000..a978c1fc6e
>> --- /dev/null
>> +++ b/xen/arch/arm/mpu/arm64/mm.c
>> @@ -0,0 +1,130 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/bug.h>
>> +#include <xen/types.h>
>> +#include <asm/mpu.h>
>> +#include <asm/sysregs.h>
>> +#include <asm/system.h>
>> +
>> +/*
>> + * The following are needed for the cases: GENERATE_WRITE_PR_REG_CASE
>> + * and GENERATE_READ_PR_REG_CASE with num==0
>> + */
>> +#define PRBAR0_EL2 PRBAR_EL2
>> +#define PRLAR0_EL2 PRLAR_EL2
>> +
>> +#define PRBAR_EL2_(n)   PRBAR##n##_EL2
>> +#define PRLAR_EL2_(n)   PRLAR##n##_EL2
>> +
>> +#define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
>> +    case num:                                                               \
>> +    {                                                                       \
>> +        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2_(num));   \
>> +        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2_(num));   \
>> +        break;                                                              \
>> +    }
>> +
>> +#define GENERATE_READ_PR_REG_CASE(num, pr)                      \
>> +    case num:                                                   \
>> +    {                                                           \
>> +        pr->prbar.bits = READ_SYSREG(PRBAR_EL2_(num));          \
>> +        pr->prlar.bits = READ_SYSREG(PRLAR_EL2_(num));          \
>> +        break;                                                  \
>> +    }
>> +
>> +/*
>> + * Armv8-R supports direct access and indirect access to the MPU regions through
>> + * registers:
>> + *  - indirect access involves changing the MPU region selector, issuing an isb
>> + *    barrier and accessing the selected region through specific registers
>> + *  - direct access involves accessing specific registers that point to
>> + *    specific MPU regions, without changing the selector, avoiding the use of
>> + *    a barrier.
>> + * For Arm64 the PR{B,L}AR_ELx (for n=0) and PR{B,L}AR<n>_ELx (for n=1..15) are
>> + * used for the direct access to the regions selected by
>> + * PRSELR_EL2.REGION<7:4>:n, so 16 regions can be directly accessed when the
>> + * selector is a multiple of 16, giving access to all the supported memory
>> + * regions.
>> + */
>> +static void prepare_selector(uint8_t *sel)
>> +{
>> +    uint8_t cur_sel = *sel;
>> +
>> +    /*
>> +     * {read,write}_protection_region works using the direct access to the 0..15
>> +     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
>> +     * only when needed, so when the upper 4 bits of the selector will change.
>> +     */
>> +    cur_sel &= 0xF0U;
>> +    if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
>> +    {
>> +        WRITE_SYSREG(cur_sel, PRSELR_EL2);
>> +        isb();
>> +    }
>> +    *sel = *sel & 0xFU;
> This one is different in the original file (*sel &= 0xFU;)
Agree with all of the suggested changes.
>
> The rest looks good to me!
> With the above fixed:
>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

- Ayan


