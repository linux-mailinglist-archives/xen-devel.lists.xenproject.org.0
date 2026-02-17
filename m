Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJJ8AFs5lGm4AgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 10:48:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5373F14A877
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 10:48:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234715.1537865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsHfl-00079j-OD; Tue, 17 Feb 2026 09:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234715.1537865; Tue, 17 Feb 2026 09:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsHfl-00076s-Kr; Tue, 17 Feb 2026 09:47:13 +0000
Received: by outflank-mailman (input) for mailman id 1234715;
 Tue, 17 Feb 2026 09:47:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CGo7=AV=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vsHfk-00076m-Iv
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 09:47:12 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1afa697-0be5-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 10:47:11 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5833.namprd03.prod.outlook.com (2603:10b6:806:114::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 09:47:07 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 09:47:06 +0000
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
X-Inumbo-ID: a1afa697-0be5-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOLU55/tXwX6osiaKaqneo+mkQ0mXUK/R4mpbMBJ2zSdBN2MhqIEVxvOqaeWf7zdauvZTaFXBYPfDneOhyKZA/chZW0hDupy4XeebJv+sdWdZhBtvRlvhuLrMKaZqT3hh+u38a20G7qz7hDRlIk/6/viZ6caDZG6hDcMWaTwY0R3F5bO8+szEPVNKhsS5BhB6oDg7j0TkBJJrFEx09oVw352CU/GfXFsyDsj6Oh8k4hVqkHQQVeJFnV2MVssFbUZDj1dH9denEo3V/9GWRNdrWdbnbbsT0Iy9Zmoa4H8gxJOxKOxMN3vWpy+eEQq+DYtz7h+wQ1o6h5eByXzj3QGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsVmCRTw0zvpjLHcOGhdoTiubLiylwQbVDOugo9wsVc=;
 b=UYHjN0JHXaGHchlWChVjUAx5cx1utXJInxIGCqtdLbjR+mtfgAnzR7prMsahflY9EH0d1rQNs3aKCseeIJa2OPzAi7SO4/zeOJ0WWap/y2PmbKlwO1Kl+MNypAp4iv1XspbJH1aJWQEyWzUqJsKr1u8qzd8gwXOfxmaYIGPberNWIK1hWNDlpp5FXbLh4Zi8OBXeVBK3duqH/ZA2gE+OiffuMunzE9ozFILxv1O0o6evENvXnwhfWf11V5NAdzYnJLLPtrJeN8lp5jQcw2EQ44HPrMcGoc5dskPp4AofyihlwaX7C5F0EqjwtVYBtmO1ypLMHvPFjelk15wNmjYRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsVmCRTw0zvpjLHcOGhdoTiubLiylwQbVDOugo9wsVc=;
 b=GSx4yJKOsmzalidPg+Zdvfz+K1qMYp8eEVv8sWxxr4zQMA1ZMan0SKuFgR5qZhuMfE+POkDusopcO1QW0osvM1pb+pLfTfxBLvJr5MD4wwofgJ4DLp1weE3fanpbPkYYSn24CE3EZU1eMl4TzkdIRrsrYHNEDbZlzLw61AOa/0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <14d94ac0-f193-4344-bb04-f4bf1061d39b@citrix.com>
Date: Tue, 17 Feb 2026 09:47:02 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] wait: drop wake_up_{all,one}()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3f1fb7a3-0abd-4df0-92b6-2bb6d78c6422@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <3f1fb7a3-0abd-4df0-92b6-2bb6d78c6422@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: 94cbaf70-ce0e-4a06-db9a-08de6e098302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWxKVTZqa1dtVldHdHRWY3VVTk5CWSt4RVcxY2hORGFoZER4ZlVQanNvalRs?=
 =?utf-8?B?ZjU5S3BmNy9DRWNQbnNNckZzZ25JMXhrR0lsOW9zY2JLcXp3dXNwQjh6d0w5?=
 =?utf-8?B?ZlRJbmxMelFHTnF2WWk1b2JyWndteksvWlhwUjdxY2VmS2ZzYUM0dTllRE41?=
 =?utf-8?B?cis1aVVHTHRxVzMzUHVWd1BmWjI3TThSYitqVnBBR3N2MnVTd0lVaEJZT1Br?=
 =?utf-8?B?TVdiM21MejJNbjVUY25xT0tVUVViVThpZ2RJWmRCM2VVZ0dtbGxzY1FvUVB4?=
 =?utf-8?B?a252UmRyQjhMZjRSQmk5b3o0UEwyUUNvbXlYTDF0dSs3bE9Sb01pdnROeXhM?=
 =?utf-8?B?RlpWeEdvVXQ4eVFvbXdtWktsRkFWdkxVeUdRMzBNbDBzdXcwVUFpU1pzRHdB?=
 =?utf-8?B?V0FyMWM0SUVvNEVUcUFBa1pBRmx2aDQrMllBdnRSRGZyR3psTDUva3JxTFVW?=
 =?utf-8?B?L0l1cVJRdHM0c2JVeGNFUFVaWEU1a3lBSDhaMGNaOS8rU25wMmdzeXY2MXJH?=
 =?utf-8?B?T2RDQVBLVm1mQ0NGSTBvczBjWlBMb1VzcmxGUXFjckoxcWIwbWlGWi9vV3I5?=
 =?utf-8?B?QmMybXBPSlNuOHgwQ2sxaHZNNWlhWU4rNTlydjYwdVUzbnoyVUFwdVpvVlpw?=
 =?utf-8?B?R1RlSEZjRDlZdkNERHk5QzY0R1pLb1A1bFIrTzh0MlkyOWVCWFBUUWtleW5u?=
 =?utf-8?B?VURHdTR4L1pMTWJrVzdyUVV3RWJmdzZTM0dJSVY2bjhVWU5tMWpubG5MbS9s?=
 =?utf-8?B?UithZWprWXlQRmxMQk9MU1VIRHlzWTJld3VveFVSb1F5QTlIOHo2MWU1dWhQ?=
 =?utf-8?B?YVZmOGFCNnFRNlg4NlAvd3RnSnZqd29MbEpkMEUvZ2haaE9SVWZsTk1uV25K?=
 =?utf-8?B?M1hsQUxLbFhFck95VEwvQlRJa3V6N0FuQncvVXlqckxMSjZGSUhudGJkZjJh?=
 =?utf-8?B?bFRpRStZeE5nU0RrWWQ5YWV4dElFQkREL3NSV0xocjExcVo1RlRva1Vzb1lm?=
 =?utf-8?B?T2EwYjhNWXU1TVYreDhJVGFCNzBWbzZ5TWVxbXVpY0VYaVNkZFhmZG96Q2ND?=
 =?utf-8?B?R3BhNjQ5ZU5wNmlsY1gxakovWUxuVDdHd3hzS3hhUW5kaGNkSmQyMUpyRkt6?=
 =?utf-8?B?Q24ydEhTdjV4cGNKM1Rxc3oxNzMzSGFRLzIvaEpPdTlVQ2FnMXJJdm9GSkFH?=
 =?utf-8?B?dTBRZkRQQXVqd2dVcU5IRU02QTRRZGx6aXlubE5VdlZ4NzV3K0tMTzFIY2NV?=
 =?utf-8?B?MUZZRHFqQk5FS1UraVVhVlQvOHJDeXpQK2N5cFdkRUlhRFF3SlN0TFpINU5P?=
 =?utf-8?B?bFhUbUZLOXpOM1dWMUNrTnkza1ZycjBaUzBLSEVOSmRxcmVlaThLYVpGT0ZD?=
 =?utf-8?B?eDQ3eFdndzBXZlYvMlcybnFoMmpRbjQyczF0VVpDdjFGUXNsTkNBdmw0enNT?=
 =?utf-8?B?VjVkd0QyUjlRb0E4MGkzZnp0WFozYjJ1b2ZLUnMyRW5vb3oyQ250Y1BYMG1P?=
 =?utf-8?B?b0xXSnpkNWYrYjQ3b1hxbTdBcDVhSWJpbGlkZm45aiswRUJSRkpNMndmblF1?=
 =?utf-8?B?cHZ2TUovQzZMOU1VTC9RVG1KZkZ6aXlWSVVqSGx6c3hBUTJXMjh4N01aZDJ0?=
 =?utf-8?B?VDdKdmJaeDExZ2psSThVUW9Idk0wRVVUejVwb1VKZkhYZDJ6dWlyaVRjVGk1?=
 =?utf-8?B?NXJIR0RCYkp4ellYenRtbFpFMTFONEc1QnQ2ZTRqVFNDVjNlU0VNQ1U1NlRV?=
 =?utf-8?B?SzdFdlpaS2M3cHo1ZUc0aWMyQzJiRExYOGY0RVJJaW45TCtvOFNXYityTFEz?=
 =?utf-8?B?clpxb2pNN2ZSSWhONHovbUFyRDExNVdQRm5vZUFkMXAySG9ZZGFCT01vdkVq?=
 =?utf-8?B?K2Jicm14RFc0cktTMGhZNkJPaUhoL25tUWVCQ1Jkbk5nUDM4TUtCekFRaXpM?=
 =?utf-8?B?UkVhMW5OUDdZMks5WUw1aTdValB4V0FoY0d2YnZ0akFpUVJzbFNwbG16ZXpY?=
 =?utf-8?B?Z0xjMWlEOGEyc3QvL0hqRXAvZTRJekRiYmdiNkE0WnFudnVTd1plVzAzUzAr?=
 =?utf-8?B?cXZxVWoxUWJHS3U5ZU5pUU1Qd3lWcmFiTEJVWXRkNlRzN2FlaXllS2xvZG55?=
 =?utf-8?Q?nytc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWRNeVhqdGsvTFdUSDE4TVZ6N1ZoaG9TV29wZFJYeUpkNlFKUnZWd29qVU5Q?=
 =?utf-8?B?NDFLVllRa2VHMGZoM1JJQWxuN2owOGwyZzBCTHo2NTBNVUhGdVZwdDBtYXlZ?=
 =?utf-8?B?UlZGSDBybGNZdjAvVkdPM2syQVdoWW91MW4xdUVDa1ArVGFQcENtR3Y1eUJU?=
 =?utf-8?B?SHNYNENNTHo2NzYzVjh3czBDRmt2bkNyNmczRmNGQ2dKMDlIb2hjWWN1QThF?=
 =?utf-8?B?NVdKQkZ0dUo3dTQ3ODd1TTh3WXhhR01Wckx6eEV1QmE1b3kyemxpSDdWMDdX?=
 =?utf-8?B?RWd5ODlmR0NKS3NjUDVvRTJ0dUkwdm1FbkVLY3RpWXRiMkdweDBnZnlDN1Fk?=
 =?utf-8?B?bm9WS1h3T0VDRENWK1BnQ1EzNkx4ZnlpTDJFbENuLy9sWTRqZXQ2VG5ZRE93?=
 =?utf-8?B?N2s5YzlXb3N1VEFkNmNVa2c0TFRXMXJBTUZiOGRkUUIvelBUcUswR09laHp2?=
 =?utf-8?B?eVpkZ1V4N3dKUEx2ckRhTWZrb21mblp4N251cWNMZWFXOHJ1bG5lN3dWY1NH?=
 =?utf-8?B?TTdOemdVUHYvN1FKdW9GTW5VYjdrRlR3bUtLY2xqY0w3WVlrbDl5eW5pcU93?=
 =?utf-8?B?UGl3KzZacUxob0V5bFQrcGNldVV3aEx6ZHdoWk9aN3FuTGJwOU8xYi92ak9T?=
 =?utf-8?B?YzJhR25Yc3NJbWg4bVJZMlB1Sk9YNlEwYmR0U1FKV0hUU3BEM1ZyOVBvTlJE?=
 =?utf-8?B?Ym5OMkc2Sm8waHVPMEV1Tm1ENTA4RHVUSHV0N3JlajlQbnkzS1JwZGpNL0Nw?=
 =?utf-8?B?a0FZOHQ2aWsxYm1SUWF6QWtnM0dndDZmQ1lVTFQ5M3JFa200aGtjSTRWK1Zn?=
 =?utf-8?B?R1M1THhBS2d4QlpacWwrUlNXYlBVdUxUUGpvVmU0eVBDN0dzYmxKMWF1OFJz?=
 =?utf-8?B?Y1NoRFFaK0Q4Y1VQcnFRbDBDN1VMb3d3dWsyZGg0RXVIKzFGazlaU2dDOUxC?=
 =?utf-8?B?R0xESDlMblRiWWRKOFo5YzJ2aVBVOERKSWJUdGNpM2wwVUNCRUppNE9pcVl6?=
 =?utf-8?B?NlV6VS9LS21wU2VPek9ER0lGcllCekszZmF2WjZNT3N6cXJCTXZNWloxVm9p?=
 =?utf-8?B?TTMweXYzQlZJOVJoR29GT1Jjcjl4Qi9MZnNNY3lFR0MyZFd4a1lTMldwSUlQ?=
 =?utf-8?B?enpGQ052SFRYb25kdFRMejh2dm5ZaVVJTS8xaCt3MzdxWStReTRrOUpzVHZE?=
 =?utf-8?B?cFE3RFJyZUhrYmc5MmFnbStMZXZQSStOL1o3VnJvT09Uc1dFQjRva2RDVFhZ?=
 =?utf-8?B?NEJUNEpsdi81TXF0ZENSeVdJZVlndURhRFlGTE1rdjZXVHExOC9BR1VxTU5Q?=
 =?utf-8?B?VnhIZzF1dlBqcDJORkJmcVgvM3ltNENVbDlPVnlKajkzOVM2YUd3djkvRFp3?=
 =?utf-8?B?Wml0TmpBNVdvd0lQcmJreThaZEJobFV4MDAvVk9xd2ZQbVEvQ2Z2STNiaFNI?=
 =?utf-8?B?Y1ZTajRZNmtVcW9HSlJLaXZoSTdQK092ZTVBSW15c01vQzhMa2habnd5SXpS?=
 =?utf-8?B?WWd5cWlMQ3AyaExMSkNmQmx2bEg4cE5CcFl4QTlqWUhCenBrSWsyTFgvMHFy?=
 =?utf-8?B?Z0RiQzByaGFnY1UxNGFmWVhnTGM1NUFwWGJZUkJSdXJTWW0yeW1GTDhtcTRN?=
 =?utf-8?B?ZTc1YUJsdHg1bFVCdEY0QTJYclIvZnJ2VGxKcXJRSXRFbGlra002MUVtTldD?=
 =?utf-8?B?dUxGK2VsSkxMcHE1VVFBS0F2bTFYWnM2eGpVRURNQ3ZQblZXYW13NTdTNWVL?=
 =?utf-8?B?UGlTVXNBb1RQSHpSV2JtclZiZVFjakdYVXlGNTMwbkZXTmUvLy9HelFUdVQy?=
 =?utf-8?B?ZzZmV0ZjRGlad3lwMHhyVWppM0JDVkF5TS9OeTFiaXNKV0t6eW8waEZsU3Er?=
 =?utf-8?B?cDEzL2QzY2UxL3dBbDZCbXIxaHhSUlNteGNZTjd0TENKSlluSFJvN09Wanhi?=
 =?utf-8?B?MFhXdkg2TnVWMXNET3hoM010WG1WRkFvZXUrWFA0VlZYL1dGU1hJVlAyWFdX?=
 =?utf-8?B?S0VYRllIa2Z5dkU2d2NUMmx5M3Q3M1dvRlNGOFU1NkZoVXhYLzg3YkJFOEEv?=
 =?utf-8?B?WHh0V0habE54VWs2eTJ0K3FXcVpkdTRhMW9Yc2w0dGoyVkpkMmE4S25WVFRM?=
 =?utf-8?B?bU9JUTdvQWk0NkhCNnhhQWFwYmpTbnF2dnF0bVYrQ1U0UWhtK2EybnNPNnJm?=
 =?utf-8?B?akxmY3hyaFVmRWFHRStpS2lFOFVUU2E1d1hJakxod2lBeWJvcjVFKzlvSEZn?=
 =?utf-8?B?ZDFmYVNhNFNQcjBqVjJCRGxxV2NwNzZyRVVIT0NLcC90eU1XeEFuZTBWMXp4?=
 =?utf-8?B?cE1YeTZIbkswd3RWbmlmbDQxWkpIbjI1NlpyamdKUDFlSThuNWpRQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cbaf70-ce0e-4a06-db9a-08de6e098302
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:47:06.6813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRxqrz2dR6JTKU2ToLrVeslE9jDcIRtq+lcbruNjB/pw74awL4OYfYtr9rxBXSQWDj+8yDhqNYsAaIgdQ2DAl2GQJy4lwX7ZGdV0dlbraNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5833
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5373F14A877
X-Rspamd-Action: no action

On 17/02/2026 8:35 am, Jan Beulich wrote:
> wake_up_one() isn't used at all, so violates Misra rule 2.1 (unreachable
> code). wake_up_all() is only used locally, yet rather than making it
> static its sole user can invoke wake_up_nr() in the intended way directly.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/wait.c
> +++ b/xen/common/wait.c
> @@ -85,11 +85,6 @@ void init_waitqueue_head(struct waitqueu
>      INIT_LIST_HEAD(&wq->list);
>  }
>  
> -void destroy_waitqueue_head(struct waitqueue_head *wq)
> -{
> -    wake_up_all(wq);
> -}
> -
>  void wake_up_nr(struct waitqueue_head *wq, unsigned int nr)
>  {
>      struct waitqueue_vcpu *wqv;
> @@ -107,12 +102,7 @@ void wake_up_nr(struct waitqueue_head *w
>      spin_unlock(&wq->lock);
>  }
>  
> -void wake_up_one(struct waitqueue_head *wq)
> -{
> -    wake_up_nr(wq, 1);
> -}
> -
> -void wake_up_all(struct waitqueue_head *wq)
> +void destroy_waitqueue_head(struct waitqueue_head *wq)
>  {
>      wake_up_nr(wq, UINT_MAX);
>  }

The diff looks wonky because you also moved destroy_waitqueue_head(),
despite wake_up_nr() not being static.

Keeping destroy_waitqueue_head() in it's old location will make the diff
smaller and more obvious.

~Andrew

