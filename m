Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFF4CD0DCD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 17:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190863.1511109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWdJ6-0007Zb-4Z; Fri, 19 Dec 2025 16:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190863.1511109; Fri, 19 Dec 2025 16:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWdJ6-0007XM-1E; Fri, 19 Dec 2025 16:26:20 +0000
Received: by outflank-mailman (input) for mailman id 1190863;
 Fri, 19 Dec 2025 16:26:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wC3r=6Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vWdJ4-0007XG-He
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 16:26:18 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7113945d-dcf7-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 17:26:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6452.namprd03.prod.outlook.com (2603:10b6:806:1c3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 16:26:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:26:12 +0000
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
X-Inumbo-ID: 7113945d-dcf7-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNjXOg59bgcoVE4G5Fztjhzyn6x+96UEEs6mPQ2ZHgrFW/Qwa/O2LIKXLG1sQimio8jA9yKimwWpIE1L8AB0tAYUYcO4ImJRDV2MXXr9jWPnFu7aGEl2hyXmBIci5KbZVEto11QX/MTJqf2m+dUa0i9Za8boyELhyOBYsShacSTUZSDMe6ofx9d5PGVqd4nW4YhdzdTkRNXSHvoAVs3TWEdDIa7eqIQMyO1Q51yG1yuHX988GgO/udfTU0VoSeYYh2bTmWFpKznMVRfwTwA7R4cq5Kne6gqb4n/ThPjDGFnGhv2jbPss4UXA9084yrF3SIvVpz5uIzAXdcNEPDTq+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDsF8Xu9xsyj7dZCtHwBGEEK7+pNe90yIC5FmhpDiR4=;
 b=dLRKxAJIZ8ls1Y+UJsKz05m7dLvYoCDrakhkIi9TC8IZt9+uQAZRFTJGygfiQl2jvcApv1Kx1YTiqKlhLp0rG97HdHP3kH/dUC/sla+Y2Fr8EuQrBtneEuPb7IhbfIzw1HugV712aKhgbX8WppRvmwMUJ2NjLOuSkjkpHktTEPdlh61UZTpS2q+7xxAqhvWs+JH95IgJHMbEJGhivYGSLvDMkli0vGRk9baILIKeKKxdCDYCK1F4Z0rZaJIRHZzjllsB9WnJHTUDBbVHcO+J7WduLO0aUB/sax1paksht4my2VJVc2qOwlJ6tVh0y6tkGHt69U+Iun7O6XBVMRS5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDsF8Xu9xsyj7dZCtHwBGEEK7+pNe90yIC5FmhpDiR4=;
 b=wXZgzcq1GGbg8+h6iV+kfs7y9kINNTw95ByLJI2Qh/KaDCUZesBZffvCQdJ6jOgEnN+jFcWmXOmRRVtg0FKLKL3Bi+Vr5zpKKKpjGX9qdmpLndmREtEphmjx4Q4xqd6AJSrwe0Q4XUXYXpZiIzXBN2V6Um7jYlsfsb8DYGZieZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e2632ad6-6721-4697-a923-53b5bb0c9f0f@citrix.com>
Date: Fri, 19 Dec 2025 16:26:07 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ariadne Conill <ariadne@ariadne.space>, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com, darwi@linutronix.de, sandipan.das@amd.com,
 kai.huang@intel.com, me@mixaill.net, yazen.ghannam@amd.com,
 riel@surriel.com, peterz@infradead.org, hpa@zytor.com, x86@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
 xen-devel@lists.xenproject.org, stable@vger.kernel.org
Subject: Re: [PATCH] x86/CPU/AMD: avoid printing reset reasons on Xen domU
To: Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>
References: <20251219010131.12659-1-ariadne@ariadne.space>
 <7C6C14C2-ABF8-4A94-B110-7FFBE9D2ED79@alien8.de>
 <aUV4u0r44V5zHV5f@google.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aUV4u0r44V5zHV5f@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0490.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: da5c88e4-f490-485b-38ca-08de3f1b5317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUtpYU81OHJnNzZ3bmJUS2F2VDlwOXlkTW9hcHJBTzdQbXlXd3JqNzNtK3pN?=
 =?utf-8?B?cFhxRFppTTVsZ0VQbk5GaHZHWW5LOWw2eGlkR2RiQUNvR0ZNaGcyVVNqQk5I?=
 =?utf-8?B?d04yMTl3bEhOZW9QNzRQSWJleWZ6U3dEQ3g4Yi9meFliaWNnL0NsSjIxSXdL?=
 =?utf-8?B?eXo1UGhBbjJIcXZ6ZDNsRWFUaVQ0ck05YUx1a2RWN1ZNc0dqUjVZa2xJdGo5?=
 =?utf-8?B?dnpiZlZtZGJzTTZpZkZETjduZjhNb2ZRS2w1QUx1dWVXWWdTZVl4Z2NXZlJO?=
 =?utf-8?B?Q0lhT3hQVmY4SVBrZWdqUVQxQUNWOVgrQy9HS2I2aFZRRjJnMUZ5d1BFTmxo?=
 =?utf-8?B?VnlsaUMyUWpoMFhsTmJNQXdOYUtiOTB6cGZ0b3k1NnFheFpKQkxzc2hVS05S?=
 =?utf-8?B?anRnNVVOMnExakxsaTlBK281T0R3WVVFaFJZWWF2Y2E4bWNzYmZmMGM4WG5h?=
 =?utf-8?B?NTJLK3IwaHpJd0Q3WnVvdi84T3l5VzZXNWJZVExFcTNtaitjbmw2MytCYmtV?=
 =?utf-8?B?MWZPbEdZb1pWbmpLSERtUW5hNE5OL2Y1ajA4aHpFSFkvWFpsKy91VXlSaU1r?=
 =?utf-8?B?YlVwQytMd3BzSGtybE9iNmM1cnY0WUFid2RicTY2ODFSWFpIblNlelE1eVVB?=
 =?utf-8?B?YnBOdk9MWXZRcjd0R1A2dHFBczhTSktMdHQ0U0gwU0tFWCt4OHJ6UkErS21x?=
 =?utf-8?B?WXV4SFJXMDVzRUZmMW45YVJTbmY3dlpRbHpEKzg3SVh2WkVnQi9VLzBkSzNw?=
 =?utf-8?B?b1V0RmxVUVJsdlZDL0hIeFhHdGZMaS9DTGlLZTNFelpJMThwbWYzYjZZbFoz?=
 =?utf-8?B?M215bVkyYmFZU1J6ZmtOS1ZtblpvSWd0OUhPUCtKOWpTRUM3V3dRdTJkdmFq?=
 =?utf-8?B?N1J1R2R3SU82R0pPT3VlNTladnBEUmRDbHBoQm1vclA3WFFldktwUlNVaHZG?=
 =?utf-8?B?UmFzRGhlbStGU1EvOXZPS0tUTDlhTXluRDdUaW90dDFGNDhkYnFmdlNEbmRX?=
 =?utf-8?B?REcrdkxJRG1aYWRoRzZpazFIZkh6bVVPMjNhRExJcVdNSTdTTzQzQVpNUUVq?=
 =?utf-8?B?SXZiNzdhVXFFdE1iMGN1RWViN0VxdDNqcnlWMHRPVHF3ai9xVkwvWEp4dHZq?=
 =?utf-8?B?SjBnK1VSTjdsdjlycnlvb3J0UjE3djZlVVQxVjhIZTdrVVN5b0YwSU95SEpo?=
 =?utf-8?B?R3VRSFBwR2JiZGhoY0N5TlBMWFFjSGpCbm1pME1pSDBwVW1UMExYajMzaWtI?=
 =?utf-8?B?TUI5emhrbGRaZmlKaXJTbm93MUZUZ1ZGcDVEMlR5L09WOHUvblh6ak5wS0JW?=
 =?utf-8?B?WHNTK1Q2NGhOUnRlUU9IeUdLdDF1TWc0Vk9IVWVNa2xVbytFaFROOVR5TWkz?=
 =?utf-8?B?SmlETFA1aXQ0RWs2d1lGQzJxeVJsYmZDRmZBSHNGdWd5d1NyWVBpTkpidnhO?=
 =?utf-8?B?ODAvODAvQUtNSnE0YXZOZ1RnbVZjNkpabTFIak95WDNPVlFWZjFua2g5WHZY?=
 =?utf-8?B?VStZOU9IVmZMOWNKYnhKVlpTZWsxazdlWGhJR1prVGlQTjF2S25DV1RHOXFV?=
 =?utf-8?B?SG1RaGRJSmJqanFPcUtYQklrWDJyWWh4bzlEWjFaUHFROStNbnZneW1BL0p2?=
 =?utf-8?B?QzMxSTJFWTRmUlBpUmV2ZjBIK0IzME9KL2JGdzRrc3h5YVpDZEJFaDVSMHZw?=
 =?utf-8?B?MTRjUGRBK1E4Sm1GQk1zdXp1Z3RyUTFPQnRFRytidjRLQXRFQXRDZ3d0VWhw?=
 =?utf-8?B?c29ZNzEyQlZ6TjZZVEh1ZHVEYXJsVkQ4VWlnV0tDa2R4TkdaU0g1TUVLekp2?=
 =?utf-8?B?STNqYmJ1cnVVWFBMTUtVWlQ3Qm41SHk0Smx5bXozMy92cElYcldac3VlWjB6?=
 =?utf-8?B?TlpEN1YwdHRiSHVzS1dhODNTdWRiRnlkUXJwMUw3WjlVZ0lIYWRYS09GUWxU?=
 =?utf-8?Q?cVoqPtu//dmumZpROFrkMgjk/5DilBVp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjBMcE5IWXM1MUlXUWRsTUN5OUc1c3hjKzBMRmgxcTFwNEZmQTJFYUhIUmh3?=
 =?utf-8?B?OFNKa3dCMm1OKzBsenY2dkpCVWtobXlBY0M3NTl0QWNEcitwcjE3cEZLMnly?=
 =?utf-8?B?bEI0Nm1Va2lTTlJJK1hzVFk5M0JZS3lFWVVONVB5em11eng0Q1podVQxYTll?=
 =?utf-8?B?T1J4akVSck9XQUoxNFYxQ283WmQwaERuYjZzVW1La2h0bGQ0UXZSR3cxdXhC?=
 =?utf-8?B?V292bzdhU1JCdk5EVW1QZHNLc1hRUTlGdnVFQ0FWNVlsR2VYbFpBYkxZaU41?=
 =?utf-8?B?WUU5eVZsWlZoc3RJZWl4TGFRYmRFQzZoUUVyb2xkM1JMOERPS1V2dWR4WEZO?=
 =?utf-8?B?ZmxQK0RuMkVyaERIL3RuSUZ4VTRneUhzZGtIZ1ZzQkRickFlT3lwQnV5ek5C?=
 =?utf-8?B?WUFHa3I4UE9JQkQycFlEeGpycnJINGFqVm5hSU4wSjNVb29tV2lXcmZNU1o5?=
 =?utf-8?B?dk0yRDBBUjNtZVlQMGZ2RWsvQTJMMkVCbWdqYnFJb1ZmU3NpTXZqVUpncUo4?=
 =?utf-8?B?SzQvd2NnZ2drM2k1c2tvY3RlNkRSbkJ0MUdJOGptUDBZZUdrUW93UGUvMGlm?=
 =?utf-8?B?RnJvbE83Q2E2eDQ2c0RmKytHSU9XZ3lwR2hKejgvRDFmMm0wc095WmtVdEN3?=
 =?utf-8?B?cXpiVFRaalpFTkR6YUdFa1FIQ1N5SUp3c0kvb1dUdGx2N3FPSEhpSVlMZjdN?=
 =?utf-8?B?cE9jeUlGNnpYMWdneER0UDk2TE9tYituUWNtMWtpK3ZGZ3VlTWxLQUFyb1ox?=
 =?utf-8?B?YkQzbGJHbC9SSHZtZEVNU0wrbCtzU0Q3UHUzcUNkT25IT0dlQzlTakJDOElH?=
 =?utf-8?B?NUFTZGkyTDJhNEJaWkowQ3VwbG0vYVpJN0lEOFdZQnQ1Nk12SVZCdkJMaUIv?=
 =?utf-8?B?QmMxVG83Qi9rbXlickFMWTI5bHduOFJONzRvT3duUEFFWnhxa2ZSelE3QTFJ?=
 =?utf-8?B?S2szT29wRkczLy9ZSTJJTzE3YUJtaGdEWkVpTlJoRmZQT01DRXNuYWsvbHZL?=
 =?utf-8?B?U0plT2YwZzU5MFZWNmttWURGOHp0RkJKck00cUtjbVBKeXdNR2JBRFJTL0oy?=
 =?utf-8?B?Mys0Y0NJWHoxekp5T25LdkdIRHlzM3RJNTk0Ujk4alFRYzN2RWRuNWZ1amp6?=
 =?utf-8?B?amtDYWQ0dTZCdjhVRThRUVY3TjRmbzJXTUJKWW55MFV6VE11VEJVRXo5V2lU?=
 =?utf-8?B?eHc0V09LbFd5WENSTWlHZ2E5V3JVT2hLODU0c2pYNDg3bHhwckhneWdtZmUw?=
 =?utf-8?B?aVJlU3dmRDlYZDhzbE15MVY4NnVGV0p0ekMvS2RzR3kvMEJqaVRxY0ViT3Bz?=
 =?utf-8?B?ZUNTNTIvWUNudmJxZFdlVnIwbkRyOVdZZmV4Skk4cDVRYk1GV0lqYW91OVo0?=
 =?utf-8?B?MEtNYWF2TkJkN0Y4VkNrekpNTHAwaEx4WVEvRUJsS3ZpYTdCYSsxU09tV3Qz?=
 =?utf-8?B?bVpvOEhVSlRaQXZlUm16NmZJejVabDgxanl1STVWUU5CWHAxK3NaOG1Hb29u?=
 =?utf-8?B?WDNPQWxGUGN5bWZMVTZDMlpxN3lzSjdQTU1QVjZKaW9ZUUt5VmRYSnU0MG03?=
 =?utf-8?B?cFlnV29FUjhOTkNxZ0lFVTk3bG4vS3gycENOa3dKTGs2NHVjTjIvbFBjMmZ2?=
 =?utf-8?B?MjZYNm1FSURKQ0xxWCs2U3JHNFJZRlNSbWJ0a0dlei9LZlZIRXYxSmlkU0FW?=
 =?utf-8?B?bGhscTZMQkN4akxSUmpVNU9xS01HSG9LRUdNbUdBTzhsYmZzVnBrSkR5a1VR?=
 =?utf-8?B?UzNBMzBZKzQ3TWFrLzFvTEVDK3JNY0htQ0dNbHUraTR2bVA4UkVlSEtnVDBO?=
 =?utf-8?B?bi9uZUVFbkFxVUlPZjNPVzN0eGhiTXNFM2FUMXlvbkJ4STNwTjY5NTBNUjNZ?=
 =?utf-8?B?STA1ZzRPaUd4ejN6SDNnSFhMcCtZaFdGYnJmTmhIaUMyT1N5RFhIZTBRYjQr?=
 =?utf-8?B?Q0NRQlFGbEprZHowZ1ZzNlVkd0NDZFhKb1hHbHkxSkUyU0xMbDBac2hKd0ls?=
 =?utf-8?B?VmRQQ25rOHgxUnBUTk9TK0JyTjRaQUhweUpiQVUzTWJITzhRS285dnYrSjhW?=
 =?utf-8?B?YlRtRFBCK2U4V0JtbUdXczE5eldTc0VUOUFCb0M3SHpTdE9WYktVYnJraEdr?=
 =?utf-8?B?alQ1QThnWHB6L3craHlnK0JXRGpidktnQjUyMUhZV1lhYXQyamp0YVdCNmcr?=
 =?utf-8?B?VjEyOGpCaGlJNnhBazkwYkNKTmllYTFvYTBRN0x1cGVqUEZaUkw1anVUV1Qw?=
 =?utf-8?B?Ti9xT1NYUG5FS0VLMXp5bnYyRGNBTWdXUjVTVmVkV2ZxTGtxcE91TjVCbVU0?=
 =?utf-8?B?RlN2QnJvL1dGM2RaSTJtaW5vbXdpWCszQ1BhYjBnMnIyTnV2UXFGQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5c88e4-f490-485b-38ca-08de3f1b5317
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:26:12.4540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t704DWbjOPljgtdQTfedmqkt431+iO6Vo1oCTfOPbfd0FfCdql7VykL4XWMmcm2GsKMPkKioprZ4+f8NSn4UoAeUUI+LiY3yekuGinfLcvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6452

On 19/12/2025 4:09 pm, Sean Christopherson wrote:
> On Fri, Dec 19, 2025, Borislav Petkov wrote:
>> On December 19, 2025 1:01:31 AM UTC, Ariadne Conill <ariadne@ariadne.space> wrote:
>>> Xen domU cannot access the given MMIO address for security reasons,
>>> resulting in a failed hypercall in ioremap() due to permissions.
> Why does that matter though?  Ah, because set_pte() assumes success, and so
> presumably the failed hypercall goes unnoticed and trying to access the MMIO
> #PFs due to !PRESENT mapping.
>
>>> Fixes: ab8131028710 ("x86/CPU/AMD: Print the reason for the last reset")
>>> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
>>> Cc: xen-devel@lists.xenproject.org
>>> Cc: stable@vger.kernel.org
>>> ---
>>> arch/x86/kernel/cpu/amd.c | 6 ++++++
>>> 1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
>>> index a6f88ca1a6b4..99308fba4d7d 100644
>>> --- a/arch/x86/kernel/cpu/amd.c
>>> +++ b/arch/x86/kernel/cpu/amd.c
>>> @@ -29,6 +29,8 @@
>>> # include <asm/mmconfig.h>
>>> #endif
>>>
>>> +#include <xen/xen.h>
>>> +
>>> #include "cpu.h"
>>>
>>> u16 invlpgb_count_max __ro_after_init = 1;
>>> @@ -1333,6 +1335,10 @@ static __init int print_s5_reset_status_mmio(void)
>>> 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
>>> 		return 0;
>>>
>>> +	/* Xen PV domU cannot access hardware directly, so bail for domU case */
> Heh, Xen on Zen crime.
>
>>> +	if (cpu_feature_enabled(X86_FEATURE_XENPV) && !xen_initial_domain())
>>> +		return 0;
>>> +
>>> 	addr = ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
>>> 	if (!addr)
>>> 		return 0;
>> Sean, looka here. The other hypervisor wants other checks.
>>
>> Time to whip out the X86_FEATURE_HYPERVISOR check.
> LOL, Ariadne, be honest, how much did Boris pay you?  :-D
>
> Jokes aside, I suppose I'm fine adding a HYPERVISOR check, but at the same time,
> how is this not a Xen bug?  Refusing to create a mapping because the VM doesn't
> have a device defined at a given GPA is pretty hostile behavior for a hypervisor.
>

This is a Xen PV guest.  No SVM/VT-x.

A PV Guest (by it's contract with Xen) cannot create mappings to host
physical addresses it doesn't own.  Xen rejects the attempt, and Linux
is ignoring the failure in this case.  This has been ABI for 25 years.

From a more practical point of view, because guests can read their own
pagetables, Xen can't swap the requested PTE for safe alternative to
trap the MMIO access, because that violates Linux's model of what's
mapped in this position.

~Andrew

