Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45DDCA4FCB
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 19:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178218.1502141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vREMn-0001kx-5X; Thu, 04 Dec 2025 18:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178218.1502141; Thu, 04 Dec 2025 18:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vREMn-0001ih-2R; Thu, 04 Dec 2025 18:47:49 +0000
Received: by outflank-mailman (input) for mailman id 1178218;
 Thu, 04 Dec 2025 18:47:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYI0=6K=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vREMl-0001ib-MR
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 18:47:47 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b96bfa54-d141-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 19:47:46 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AS2PR03MB8794.eurprd03.prod.outlook.com (2603:10a6:20b:551::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 18:47:44 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 18:47:44 +0000
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
X-Inumbo-ID: b96bfa54-d141-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKPLNGMgsxNDzQZt084Q0XxY1RdRtQrozD2RaAsYn8bvY20U6BGYl1SnPaQmnd/XHc/viDceQza7nhzf4fO53byxJd7Bqk+Fze7Taw3O566+dxznY6ub7PmwRUTl74kJ9vMxf+38YyZWaJ/0IDBq1uG5BZFcHNce18d0u4p4ICDr3t5iOv+ml31NeOrLzINX6QQIfPin8w9lqtyj9oiAAPrRcQ1OPqB1I0JfZjXBzJPYYg5V6YmLAhqhF8qQ5zqbOcjoECS8uhxobk5Fr+wOgoc7aB0WVSFQ08LR2Db68guYHWdx+ftH1pM3hFwShlQbd3rN3Tn+4SCJ+vKzvi6KAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCIMsY63nvESKdY6wv1L3mIbm910UVVFoS4YF/TvM9g=;
 b=Khe7AunL6Fh7MwgkTopUtg8J9WwwdURC9dVvoHrKvvdVX+VU9ekBTSSCYamRNTYvib79bh0gTHF55OggdchTMfwHeS2hB5CXi6HD9xkFlCJLPQeH68pOxZNI1I+yT2qBapSEZtJHwzE6hpBAf3tcBF4un13Yeje0zijeOJAXLiFbxqD1Ga24tnRbXeRothjGTJyhpSybWy3Ns0p4rAWXMJwRfg2xHsrtXaQLEICJvBu0ba7H75uihcpT9bFM9t1wKseVq+eDAyLVsQyEZgVbLJGQf+/tOzBYCxD25hCj+JiD6MFWIM9xfNZ5aUoemAUjmE9Sa+YR8sxNPORfznND3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCIMsY63nvESKdY6wv1L3mIbm910UVVFoS4YF/TvM9g=;
 b=KXIbYGXrZyyjS87lIhRIIsHh/G2iVaJKeuFjWhNvmUAF+EmWQ9HHMlZidWPDL9ZhJ0VoZUx2qeJ9qNyz/Fcq6BLSc9zezRSi99GeHtIwIzrEZyBwN3dkcLsZ4r+dGuRu8RxMSCk6DQEFK+u5jOVlpL/NrNtHsfedPva75YIV/Mn0Ra7s+8QWNl8cGBQDZR8a0TXQgKcr2Hd/7lsgyYm4AucJ7DBrjPQVbyn6+GROxOryYO6l7uAFXcc5rBje+ChpAKMg8zQgPWkE8r5aVWsJol1Bydysdt/xMEId/DXECBky/P8QwEUJqhEmT+TKHmxnw/I2c6wWulVE0rF+Gd8K2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <389a5a3f-59c4-4292-847b-6c73fb9cd345@epam.com>
Date: Thu, 4 Dec 2025 20:47:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 3/4] x86: hvm: factor out COMPAT code under ifdefs
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
 <20251119192916.1009549-4-grygorii_strashko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251119192916.1009549-4-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::25) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|AS2PR03MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 79102882-d839-4cf7-889d-08de33659c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTBaWGRRemVHbm10NWEwcnkrNG1scTdHODZGbWtqTmlzRHhxZ1ZBT2FzVWdD?=
 =?utf-8?B?YnhyeHlXSHBJc0NQZ1cxZUNqRGZrWjE3NHluOHJMRXFzR01FMEZ0VjkzeG1T?=
 =?utf-8?B?ZmZPczIzYks3YkFDT3hlZmtjY0p5eHlxOEtDcFVJNnFadjNvQ09EMVNYMmc1?=
 =?utf-8?B?YnFKNlA1OTNkN0RmSm4zdzMwSTNiaE43dElHVmJGNDFsRFNucVpKMXB0RHFQ?=
 =?utf-8?B?ZG1vU3Z5dzByY3ZFWXNPV1lEZEhuaWZJZzVGYzVXUHkyempQdmJFZEkwdVVv?=
 =?utf-8?B?TDhubUhoMWJReUI5WWpDSGw4dVk1dVFncHdXaGU0UEhBWGZJQjBSbGRjWEpn?=
 =?utf-8?B?VUo3b0tkMWE3bmNJRXZIUndkTXR4bjJTR05MSHVxSFNRYjRqMm12Rmh2dnk5?=
 =?utf-8?B?TFBIMzhzN1NGbXhpdjdQUVEzZnlLZW4rY0hLMSswbE9Iek1xNVBmdWt1ZG1O?=
 =?utf-8?B?b3RManpQL2Vqc1NVekZzRU1mR05ERndXRk5pcDd4a0dFQ29tVFA5enFsa0xG?=
 =?utf-8?B?RGVaOFJ6cXdTakE3K2taT2ZOcTJTWTIzTFpNa3FXc1FTTlBORTNCV1k5dXp2?=
 =?utf-8?B?WkRnZUxua1JYS3B1M3RWZzJCaW1OT21WcjRlVU9panh4YjNIaVJLNXFweVRt?=
 =?utf-8?B?QUFaYmZwaGRPVmx4aW52c1lMN215U3VBN0E2b3JZMEc2V2M2cWRTMXdta2hC?=
 =?utf-8?B?L1pnZDhLWVdQWHBrZFFBNnRNaEZISGZidEo4dmt4NUxkaXJ5U1NTMUVEWm5u?=
 =?utf-8?B?aVRJYzFWWWlzOFdvY3J2dVN1b21MZGl3VjI0Q0h4QW9TMGlKWFNYbjF1S0px?=
 =?utf-8?B?UUtGU0MrcWdBL0VmcHZnS2pFK2tmanNJN0k1TzlQbWRQWVJOdXZNN0JNL3F3?=
 =?utf-8?B?MFBncGJVOGlKSTVzSHhMbXFUOXlaQWhZamh0Njg0dVFZNk5yekl1TWczQlIr?=
 =?utf-8?B?L2FseEVUOFYxd2JValRYODRkM2FiM2RVM2MwUTRTZkFpdDRlUFJ5bWM2Tldh?=
 =?utf-8?B?dWtmR09SNHhkSUNxNGZUNWFhTUFXRDFCcnFueVBvc1dVbk9yZWdQYzA0a3hk?=
 =?utf-8?B?Zkl5Tjh5QWpxN0F2NUFCRDhmLzhtZkVhaXJNbjhWaVlxUUc2Rm9tV1ZXQ2FG?=
 =?utf-8?B?V2lST29RUEV1L2R5OFMxZE9sRjAwRmlvbk0zQURpMTAzZjc4SVpHOE9qT0Jx?=
 =?utf-8?B?RXlDclIvbFl6ZTlyeFlDZTU1L3ZsbDFIeHRFSTVaU1h1dE1sV20yYnpoWTdP?=
 =?utf-8?B?QWQ0QmhOOGJOdnJjOVNUYnJtRVI3Y0s4MEthR2FlN1YydkhhRDlTWGdpUVRj?=
 =?utf-8?B?THd4TkNHM1RibDRKNnlFaXVyck5MbkhoNUhidWJZV2FqdThJS3hnbndvSzBy?=
 =?utf-8?B?M0V2TG93alYrYnhPT1dBQkQzWjRnZFhrb1U5QzdyWThqb2VuTlVDMHZNb0NJ?=
 =?utf-8?B?T3JOYWRWQXUxY1IweTBmcGY4Z2xrQWFHVG41Vm1CcEV1NVpPMWMraGxqdjRs?=
 =?utf-8?B?MHpDanlGL1VtRHFQU25ybXpEWW0raEFNYW5MalFyeVhiajVxeXRrSThiazd5?=
 =?utf-8?B?V243d3pQaU43bHBmY0RuU1FKd1NaNEU5RUVzaEtqeW43TWZCWkMzT2I4NlNH?=
 =?utf-8?B?aExjMkxqWFJ0RnlxNzd3N3hOeTNWNnRkMkQrZWo3dG90RitveEpzakFYRGFh?=
 =?utf-8?B?Ykl4ajFxdXlnSTJsUjlMRGN4MEFBWllxZXBDVGxFQjNJcFVNZS92R2xmSEFU?=
 =?utf-8?B?NC9ZdFFrS1R3clg3djMvWlBJeXFyVGpGMDBGSG5Pci8zSjBwczRmSTZ3REZD?=
 =?utf-8?B?dldQOTVBTVA5NHZkM08rMEFpYStOM0lFMy8xNFdNUEI1U3RmNUJkTnZlcEkw?=
 =?utf-8?B?OXlTcW9JNERHUmNtZDM3MlRCTURqdGpROHF6dlg5ZU8wRGRVREkrTjZNNjlE?=
 =?utf-8?Q?zRFbgEtUjvofOKstRjvy+2Jv1BtGlWXV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0pWN0Z1N3dET1BlYldkMXV5N0h2ZG5OMVMvR2FFb0pxZU9EREo5VHNxQ3ZV?=
 =?utf-8?B?M0NJNk9FaEZxTHlHVGcwLzVPQlY3dTZBQUN6cUtUVHNPQnhGdG8wcXp5SlNJ?=
 =?utf-8?B?OUdoTklpWi9FK0tVNElmRnVMUGFSbFRweE81WE1CMnBTcnB3WUdBNUdlSkFt?=
 =?utf-8?B?MkYrNVM2ZVUxYTlaS25IcjZzQ1hacXZLQ3VBWVFiQ1ZYVlR6WmdXRHYrU1M1?=
 =?utf-8?B?elVWNmpnTjhiS0hMRmpERXB3WFRYZEhLTHBCL0JISTBmcTRyUEd0dDdSa3I1?=
 =?utf-8?B?bmVqV1pwa0NreHh5ZHM2K3JnYlc4RkRCNWJHZUdJeVI4M3k3QncxUytlUDNH?=
 =?utf-8?B?d1hWcnJObHA3QjVUNGtRYUlpNFliRi9JMlM0WDB3S3pkSCt0alFLcmV6V1lD?=
 =?utf-8?B?azRBa1pmZDZ4eXlSc1NIS3VBODYwTXhLcCtFTVJyakRvTXNwc2tKWmd4YUl2?=
 =?utf-8?B?UmdoeW5aU1cwT1kvaDJlMmdibDhrNENyejNIaytqU2VSa2xlVmMrMFE0a0x1?=
 =?utf-8?B?aTIxTUw5R3NiMnAzeWtZcDFZQTdFOU9Yd0tUVmJDeUEyQU9xN0duK3hYMFo1?=
 =?utf-8?B?QmRCc2p2dy9FOU9QNFN4cS8vaGlhZHZaYStWV0JqYThrRXpUU3lNSTdFbjRZ?=
 =?utf-8?B?NFV2bkRvNDgrSnZMZlY3YWgrYzJyZ1N1RzlvNDRXd2tGcCtucmRwVTl0U3E5?=
 =?utf-8?B?L21vQVd0UTlFT2Q2ZW5DT0pXVTNWam9VdTRyc1FwcERkcWJmaTd4L3BZTit1?=
 =?utf-8?B?b2RtODV2Tk9BNzlqQzRmNkw2aHJ3eU5VNVY2Q2FHY2tWVHViUG5rNDdTZFBU?=
 =?utf-8?B?aXkyRUNJVmIzMHBSUC90ZC9qU2pDYVRCWStVb20xQitiK2pJTE5KbklaRzlJ?=
 =?utf-8?B?aC9QZ0VEbERPRHgwUzRsdFdXSWhPYjBTU0FRU282Zk1jYnFOWVdQNi95dU5h?=
 =?utf-8?B?cW91RWhNNzRxRWxOd1dUcjk5K2wySFpGRHlBdk56UFdkQVhTQUo4cWF2KzFS?=
 =?utf-8?B?blp3UzNpQ054ZVdsNDJKdStYbW9CUTU1TjVxN0loSDY1UjZuTmt1WExRK01v?=
 =?utf-8?B?eHhMUEN4MGZGamtQN2dxSDRUSkxHUHZmTTAxaHFSL2NKMGtiME9Jd2htSGtt?=
 =?utf-8?B?ckp5WUdtR29MOGpjUVFEamZ3cE5yU0dZMUxaYjdyU25ka0c3VXRqK2tIbDkz?=
 =?utf-8?B?aE9uUFZBZHQ2cmJyZ3RYcFpNSXJYU1dSRHJ1UnZJeUtkNDZBQ1k4Y3N2cERx?=
 =?utf-8?B?YnduRmpDaW5nL2JBUmlSNjFMTzZWVWY5MG8zUGxzSko0bFFsbzh5cVB6bEQ4?=
 =?utf-8?B?UjRpSGlvU0phUUsvOVcxbzlBV0tkOEcrY0tjbTdPWk4xUk9sTkFKMDVpMVlV?=
 =?utf-8?B?Mk16dHFGa0h5Zkltd0tGclMxQVkvQjNHSGc1Q1JHcC9BWk8rV3BBQ3R5bEdH?=
 =?utf-8?B?TzBKTUFsYzl3Q2kwSXVMa2NCU3pPZnFMRDNLdTVORDk2aWZGRDZVNzA2a09E?=
 =?utf-8?B?aTUxN2dyYU5yeGx5S1NsT2V2Y0xzVjM0TU04THlYSjlnamVxb21sbmE1cW9H?=
 =?utf-8?B?MFJXMkw2bXNqTDVOeW5EdjVHLy91VGFWRlZzYVcwdS9LVE5GMmdaTkR3NVM2?=
 =?utf-8?B?ckRiSkJBK0kxTWJqRTVORG9oTHVCbWRaWllLa29oMDZkYm1rb1lnYWtQUWVv?=
 =?utf-8?B?Wm1Ua1JZWWM1YnQ0SkNtMDJrSXE2RHhuL3pnNWVRUVl4bXB5NER0NXlzeGRx?=
 =?utf-8?B?Y055Q1JGWGZ1N1AvUjI0WFh1SzN3T0VBUGdMOFJWbGloM1NJYjkwVGVVczBC?=
 =?utf-8?B?QmVZYzJOVzJFS2Q1RFFtT242VjdGb0dzcWJ3cVdIMWJBMlVCcElDNTRmNnZu?=
 =?utf-8?B?Y2dtYmIvM0ljTy84Q1N3WlBEbzdnSW1meVRnbXhmZ3JPVmx5dXhxSUtrZm0z?=
 =?utf-8?B?WjFka1R4OUFjMksxd2xXTDNBRnl0YmVrci9PZjc2dzgzM3RGa1pEUXBzMUFk?=
 =?utf-8?B?V2dLR0dXZEYrUjAyd1NJaTZwQ0RZclR4NnBOTWxuZ0pMM21KdVp5Qk1hbjl0?=
 =?utf-8?B?bWVVVkxFdjNQNHBzanM1NDk4NmFVZU14Qy8yMTJ2N1RDZWljbnhVTFg1cnRu?=
 =?utf-8?B?V3pOeUFZckpkZ3JaTUtEWk9IU0ZxdHVjeVdxTkpVeUJib3lnUXBkcml2bnNz?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79102882-d839-4cf7-889d-08de33659c42
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:47:44.0758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hy3NBebsnXH8JdX1Sk5a2aFOljVRcW/JcNpMW4aQ7qWym817iXY1RaTPUYf1j/c28v4OisHPZWzTRaUaZuB0Vp0I37UOq0xRqW4hhqa0aW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8794

Hi Jürgen,

Would it be possible for you to take a look at hypercall-defs.c changes?

On 19.11.25 21:30, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Factor out COMPAT HVM code under ifdefs in preparation for making HVM
> COMPAT code optional.
> 
> - hypercall-defs.c updated to always provide compat declaration for:
> physdev_op, grant_table_op, grant_table_op. This reduces number of COMPAT
> ifdefs in HVM code and lets compiler DCE do the job.
> 
> - Only 64-bit shinfo is supported with COMPAT=n, so struct
> arch_domain->has_32bit_shinfo field is moved under COMPAT ifdef and
> has_32bit_shinfo() is updated to account for COMPAT=n.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v2:
> - update hypercall-defs.c to always provide compat declaration for:
>    physdev_op, grant_table_op, grant_table_op
> - move struct arch_domain->has_32bit_shinfo is moved under COMPAT ifdef
> - return hvm_hypercall()
> - use ASSERT_UNREACHABLE() in hvm_do_multicall_call()
> - constify has_32bit_shinfo() for COMPAT=n
> 
>   xen/arch/x86/hvm/hvm.c            | 16 ++++++++++++++++
>   xen/arch/x86/hvm/hypercall.c      | 13 +++++++++++++
>   xen/arch/x86/include/asm/domain.h |  9 +++++++--
>   xen/include/hypercall-defs.c      |  9 +++++++--
>   4 files changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 0fd3f95b6e0e..19524cb7a914 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -69,7 +69,9 @@
>   #include <public/version.h>
>   #include <public/vm_event.h>
>   
> +#ifdef CONFIG_COMPAT
>   #include <compat/hvm/hvm_op.h>
> +#endif
>   
>   bool __read_mostly hvm_enabled;
>   
> @@ -1255,6 +1257,7 @@ static int cf_check hvm_save_cpu_xsave_states(
>       return 0;
>   }
>   
> +#ifdef CONFIG_COMPAT
>   /*
>    * Structure layout conformity checks, documenting correctness of the cast in
>    * the invocation of validate_xstate() below.
> @@ -1267,6 +1270,7 @@ CHECK_FIELD_(struct, xsave_hdr, xcomp_bv);
>   CHECK_FIELD_(struct, xsave_hdr, reserved);
>   #undef compat_xsave_hdr
>   #undef xen_xsave_hdr
> +#endif /* CONFIG_COMPAT */
>   
>   static int cf_check hvm_load_cpu_xsave_states(
>       struct domain *d, hvm_domain_context_t *h)
> @@ -3991,8 +3995,14 @@ static void hvm_latch_shinfo_size(struct domain *d)
>        */
>       if ( current->domain == d )
>       {
> +#ifdef CONFIG_COMPAT
> +        /*
> +         * Only 64-bit shinfo is supported when COMPAT 32-bit hypercalls
> +         * interface is disabled
> +         */
>           d->arch.has_32bit_shinfo =
>               hvm_guest_x86_mode(current) != X86_MODE_64BIT;
> +#endif
>   
>           /*
>            * Make sure that the timebase in the shared info structure is correct.
> @@ -4965,6 +4975,7 @@ static int do_altp2m_op(
>   #endif /* CONFIG_ALTP2M */
>   }
>   
> +#ifdef CONFIG_COMPAT
>   DEFINE_XEN_GUEST_HANDLE(compat_hvm_altp2m_op_t);
>   
>   /*
> @@ -4992,10 +5003,12 @@ DEFINE_XEN_GUEST_HANDLE(compat_hvm_altp2m_op_t);
>   
>   CHECK_hvm_altp2m_op;
>   CHECK_hvm_altp2m_set_mem_access_multi;
> +#endif /* CONFIG_COMPAT */
>   
>   static int compat_altp2m_op(
>       XEN_GUEST_HANDLE_PARAM(void) arg)
>   {
> +#ifdef CONFIG_COMPAT
>       int rc = 0;
>       struct compat_hvm_altp2m_op a;
>       union
> @@ -5063,6 +5076,9 @@ static int compat_altp2m_op(
>       }
>   
>       return rc;
> +#else
> +    return -EOPNOTSUPP;
> +#endif /* CONFIG_COMPAT */
>   }
>   
>   static int hvmop_get_mem_type(
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 52cae1d15312..1ee0193b69af 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -170,6 +170,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>           HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%x, %x, %x, %x, %x)", eax,
>                       regs->ebx, regs->ecx, regs->edx, regs->esi, regs->edi);
>   
> +#ifdef CONFIG_COMPAT
>           curr->hcall_compat = true;
>           call_handlers_hvm32(eax, regs->eax, regs->ebx, regs->ecx, regs->edx,
>                               regs->esi, regs->edi);
> @@ -177,6 +178,9 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>   
>           if ( !curr->hcall_preempted && regs->eax != -ENOSYS )
>               clobber_regs(regs, eax, hvm, 32);
> +#else
> +        regs->eax = -ENOSYS;
> +#endif
>       }
>   
>       hvmemul_cache_restore(curr, token);
> @@ -207,10 +211,19 @@ enum mc_disposition hvm_do_multicall_call(struct mc_state *state)
>       }
>       else
>       {
> +#ifdef CONFIG_COMPAT
>           struct compat_multicall_entry *call = &state->compat_call;
>   
>           call_handlers_hvm32(call->op, call->result, call->args[0], call->args[1],
>                               call->args[2], call->args[3], call->args[4]);
> +#else
> +        /*
> +         * code should never reach here in case !CONFIG_COMPAT as any
> +         * 32-bit hypercall should bail out earlier from hvm_hypercall()
> +         * with -EOPNOTSUPP
> +         */
> +        ASSERT_UNREACHABLE();
> +#endif
>       }
>   
>       return !hvm_get_cpl(curr) ? mc_continue : mc_preempt;
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 5df8c7825333..0005f4450931 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -12,8 +12,11 @@
>   #include <public/vcpu.h>
>   #include <public/hvm/hvm_info_table.h>
>   
> -#define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
> -
> +#ifdef CONFIG_COMPAT
> +#define has_32bit_shinfo(d) ((d)->arch.has_32bit_shinfo)
> +#else
> +#define has_32bit_shinfo(d) ((void)(d), false)
> +#endif
>   /*
>    * Set to true if either the global vector-type callback or per-vCPU
>    * LAPIC vectors are used. Assume all vCPUs will use
> @@ -365,8 +368,10 @@ struct arch_domain
>       /* NB. protected by d->event_lock and by irq_desc[irq].lock */
>       struct radix_tree_root irq_pirq;
>   
> +#ifdef CONFIG_COMPAT
>       /* Is shared-info page in 32-bit format? */
>       bool has_32bit_shinfo;
> +#endif
>   
>       /* Is PHYSDEVOP_eoi to automatically unmask the event channel? */
>       bool auto_unmask;
> diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
> index cef08eeec1b8..08c01153ac56 100644
> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -80,6 +80,8 @@ rettype: compat int
>   #define PREFIX_compat
>   #endif
>   
> +#define PREFIX_compat_always compat
> +
>   #ifdef CONFIG_ARM
>   #define PREFIX_dep dep
>   #define PREFIX_do_arm do_arm
> @@ -104,10 +106,10 @@ defhandle: trap_info_compat_t
>   defhandle: physdev_op_compat_t
>   #endif
>   
> -prefix: do PREFIX_hvm PREFIX_compat PREFIX_do_arm
> +prefix: do PREFIX_hvm PREFIX_compat_always PREFIX_do_arm
>   physdev_op(int cmd, void *arg)
>   
> -prefix: do PREFIX_hvm PREFIX_compat
> +prefix: do PREFIX_hvm PREFIX_compat_always
>   #if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
>   grant_table_op(unsigned int cmd, void *uop, unsigned int count)
>   #endif
> @@ -156,6 +158,9 @@ platform_op(compat_platform_op_t *u_xenpf_op)
>   #ifdef CONFIG_KEXEC
>   kexec_op(unsigned int op, void *uarg)
>   #endif
> +#else /* CONFIG_COMPAT */
> +prefix: PREFIX_compat_always
> +memory_op(unsigned int cmd, void *arg)
>   #endif /* CONFIG_COMPAT */
>   
>   #if defined(CONFIG_PV) || defined(CONFIG_ARM)

-- 
Best regards,
-grygorii


