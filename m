Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204C8A9C9DD
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 15:14:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968067.1357778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Isb-00033u-KX; Fri, 25 Apr 2025 13:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968067.1357778; Fri, 25 Apr 2025 13:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Isb-00032r-Gc; Fri, 25 Apr 2025 13:14:09 +0000
Received: by outflank-mailman (input) for mailman id 968067;
 Fri, 25 Apr 2025 13:14:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/m1g=XL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u8IsZ-00032O-TY
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 13:14:08 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2412::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25083e86-21d7-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 15:13:58 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SJ0PR12MB6903.namprd12.prod.outlook.com (2603:10b6:a03:485::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.40; Fri, 25 Apr
 2025 13:13:52 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 13:13:52 +0000
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
X-Inumbo-ID: 25083e86-21d7-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I92rCOyuKSguPXWlID950wVypLAVF/lTzd2uKUINKEuGFJMNmQBUV6wtx41PXeHOE+qgGjIi+j7lkVb6zmWf9DqRKO40nnePR8uRz2+PqMMJrlQLz2oUaBZDZ2fzFLUrpNecmZp/3XyWPYkvVuwXrieJfrOAlRmXxA6pEVAeaJfwc/8Oy0qFC/pXxU4iHx5RgaSW46HVZNO+2Mh/KE7Iq2gSEsePQ+WUN6unrOL3tQGPIaVFUS0e+vK0qtvfL6s9J9hyJrj+MCFDjzHxdgsTdW56BGd+QE0OcZTgvyTAn2cQ0iXQi6PRXNojomTfD1YMZrztktLUDOnklXWHH6lXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouD44gM6jWwqliAuSOF2WgNYF7cw/xyBBtr/xDScH5g=;
 b=mwUaUuaAsFuIOJwc8X+IsGC8ski0r+cK+BoISAbkaza/11k1P+BAVEPf1E0FE7Fw7oAqiB+i4nljYtr3LBz0iOW8ojCf0DY2quKVFZgxd987aYEoc5+H5gQHmvCXLq2YyFNgI91ZSrybW+RFDQqGe6Cvb2ld7FVD8ZmVvR5ou1wPGZlsgV7Ctsah6PIsNTieI65AP7kaUTJf8mF7A/owQpW7aoc4AIanYJbd8a7k8INQ5ECPfQUbaIkSY+uyiBJbptbbTkRD2VutWBKKJ0I+V1kplHAUXP9XfLGpZqSJLbMRon2NfRInDJRYfreA8v74fLa2yULYDclnjUd6+4/2Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouD44gM6jWwqliAuSOF2WgNYF7cw/xyBBtr/xDScH5g=;
 b=JSfoISwEsGWH06GKX/7D78kQ6ES6EebBbm2JBUKU7+BpE4w8vuXvkMeoBkQmDr1XSbC4FgYGwWUtVM+S8WpJIw+fSqPT1ihcThlIxOujUUvTuTNBTpFc8lsV9wAjRTdwP405cJepZkXXpQWKgXyVitRRzV2/a2Pr63aO9SgfbSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <612b5d62-dcbe-4d85-866a-dab5c1b68b8c@amd.com>
Date: Fri, 25 Apr 2025 14:13:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Content-Language: en-GB
To: Mark Brown <mark.brown@parrylabs.com>, Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250417155511.1854081-1-ayan.kumar.halder@amd.com>
 <306e5414-1552-4605-86d6-b23b89d00bc9@xen.org>
 <PH1P110MB14413B4A22675F4C1FD4DC109CBFA@PH1P110MB1441.NAMP110.PROD.OUTLOOK.COM>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <PH1P110MB14413B4A22675F4C1FD4DC109CBFA@PH1P110MB1441.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::19) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SJ0PR12MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: ff164985-5e53-432a-52f7-08dd83fb063f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEN6emR0VFpPWEVrM08wL1JwY3FZVUFWOFdiN3BmS2tkd3puMmU3em4zMUc5?=
 =?utf-8?B?NXNCblhuOGhEdFR5dGVIS3JJWUlpRGNROHZ1VU1rUW03bVZsN0FLWUhlNHBF?=
 =?utf-8?B?OWlHNTVRSzJiQ003eFNJNnF5YmNiZWpIRnF2TllHRVFNTG1HcWdqQTdIZGZW?=
 =?utf-8?B?bVFhUVhpT3FyajFsYWJGb1EwYnA3NU95bFFIUGNKcjJwaFpVaWJ5ckJlRVY0?=
 =?utf-8?B?eGFEb1daNmMxMkM1Qmxrc1A2a2hKZEdUb05KTjh6MS9OWnFBQnR2eTFsZ2RG?=
 =?utf-8?B?RDRBMXJ4RGI3R1lRNXA3UTNIN01wUzdQV0ovc1BnNmJYVjVmL2VzVDRZYmR4?=
 =?utf-8?B?dkZWcGZVOTdPU0RqRzJnenRWMm1RazdwdjJ0RTk5ZENuLzdPdWh0Y1AwLzM0?=
 =?utf-8?B?dDdLMVVYU1dndFJ4QlkvekphUkxWakszRDBad0FmZkVqMUdTQnlHMUZ5aWRY?=
 =?utf-8?B?YlhHUytEcG5vcVF5amNMNWxpMjY0N1RHRVkzVFBEUS83UHhvV0txdE5laDk5?=
 =?utf-8?B?YkxaRTdQQWFudmgvcCtsQVNsU1BPb2k2SUdpWWFNT1lHcGJnbmVBM2FNclps?=
 =?utf-8?B?NzZVUHN2Wkh3WGh2MGFlRE1sYTZzZ1hWNS83THk2eklzRytnRUFyNkxtSG85?=
 =?utf-8?B?ZlBjUnZVc3NHdE5wT0V6Nm5ab1V1ZEltZzhYK25mZjVRazJoY1ZnT2ptTFN4?=
 =?utf-8?B?L3V2TXlqbWxBZkNIMGZZNkpJL2RZRkhVU09POWhwS0F3SHBKYm9FQi9UcnA4?=
 =?utf-8?B?d0JaSm02dUdwaG04U2hiaXp6NUN1UFVDdzdUWW94Z3dpOVBZcmR4c3pXLzhy?=
 =?utf-8?B?dVIxWWNVaU4vb3o2dXFhaEV0bVdUcVBYalk3QlYvYUZmRXBqVzhLUGpQaE1Y?=
 =?utf-8?B?RG9TUEFsRTh3NzRsZ3Zyb1ZIWU00aXpabVFId1kzM1lHUEc2VFg5SFNuc0hq?=
 =?utf-8?B?R2pIRkZQVlJhSGxSV2lHS0ROclZGOTJDMWhlN3JZQVRXYTNKc2p0dGg0UXhl?=
 =?utf-8?B?dVMvaEZFb2pQMG1xZlNWaVpLYWJDbXlqN2ZkdEtSaTlyMS94RVdGWm0zREV6?=
 =?utf-8?B?MDhha2NVN0NtNUR6dkxrdEFBSlEyQTBkUUhoZW45UkZyUmJ2cGJ5d1gvZDFi?=
 =?utf-8?B?SENHSnowL24rTURCUzJoUjJWRXRFT3MrVEova0hodGlUR1VwdDRWOGRFMFlG?=
 =?utf-8?B?a1BDbXhGbVlQVlFZTEZoUTJrY1pmYmZ4eEZvWTZtN2QyM3hUQ3ljWVcwclZB?=
 =?utf-8?B?Qm1ZZFBRY2YrUzhVNWExTCtuQ2ptTFdySW1UYkRPcmhUd2xTbHBVa2gzdnpr?=
 =?utf-8?B?MTl1WGlWSVl4dXpPd1BZS1QzZUZpcnNLdkpTbVh1VjlpbkpSSXArejUxc2Uz?=
 =?utf-8?B?L2RGMXBnZXdmcTFXTlNONHc0YUJDd1dSc2E5K0JLVlFxRUtFdk5ZQTNjZXNo?=
 =?utf-8?B?RmVlSThXSEc1VmI3VGdERlZISkNKLysvb0ZXVzFEdk1rWkZTVDVXRDhGQjVq?=
 =?utf-8?B?SUFQbUUvZG9Pd0gwbU1kV3cxNmFIMFE5K0pjU2tkdVorUCs1bHdKSGxNMEJt?=
 =?utf-8?B?cU9kaGlWNEhIWmRrQjRvUzVMTDcyVGlNc2FBTkZOYmp5T2ltMnoxK3doVkpt?=
 =?utf-8?B?M2tHMXU5TDFReWg4RDZIczl2aWpsQ1Z2TVJDOVExQXEzMDRDeTl2YnZRZ09L?=
 =?utf-8?B?NWVPZXIvYkFlcEluM21BODhPNEg0cURXaUlOZUdNaFVXWnM3Y2ZQY2c5Q2oz?=
 =?utf-8?B?RlhjdVVKVzRWQllZa1llbHJVR3A4emNxYnZ3bGFlRjlYeFE1SUdyL05NUE9B?=
 =?utf-8?B?Y3QyTjhJaHgzRlZyVFRwSElSTDZrbUdRZnNLYU1wYkt6alplVUREeno4SEhY?=
 =?utf-8?Q?oAkXnP+a6R9J6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHlabEJ5em9XVjZYWXJ3eWkxSXYxM2F3M0FrTVZ0SUpYbk0vZFJNVHBiVVhh?=
 =?utf-8?B?U3NwUlA5Qm4zUlB5aWlPcktmeEV5aUpWQllWalRzKzAxVDNvNTNJT3pQcjFF?=
 =?utf-8?B?TzJLZFpweEdaRmtHMGxlTlRNQWQxdHdsMmVBbkpQRTRNanIzT0ZKaEQwSzB4?=
 =?utf-8?B?ZlIvQTBFVEQ0eWNzN0lsWmY2Y0JMOERqdzRRMTI5QXRJWWZSdnYvOHZ6VlJ2?=
 =?utf-8?B?R0tjcGp1SVBBV2xCR21VUHNEMEN3S3cyUHdGcWdUMUYrREVSbGVON3JqT3B6?=
 =?utf-8?B?NTNIdEEvNzd4eU10dW1JV202b2R0N1Z4RkhCNFZoRU0zdmhIWE55Z0RHajJ0?=
 =?utf-8?B?Rk5tR0hhcUdrckdVVXpKdS83Q1o2UzJqc0xXWnRHTXJRTFoxQzRpOTBxM0Jn?=
 =?utf-8?B?Z3ZyNUF1Wm5oNXE0VWJuMWp0M1NIcDl3cU5jTFM3Vm5ackkvYityekhZc2lk?=
 =?utf-8?B?OEdLU2x3d0J6YzF0Tng1cWswRk80d1daWVdFY2N3cjdqM1hjMFRLWHc2cTN0?=
 =?utf-8?B?dVVvUmdNbE5mU0NaQ1h2TlBSMEpSN2JyUFJ2emNtbmI4T2xzdU1sajdLMjRJ?=
 =?utf-8?B?cjhOeGF5Z3kvemYyK2J1eVZuTnE2bzhVMERaM0hUalhad0FPRjdiU3IxTXEr?=
 =?utf-8?B?Nkl1cTdCWEZxd3V1eXNUd21nK0NFUVA5a2s4ZXRkb2RJUTNQQ0FZYzcyS0Ru?=
 =?utf-8?B?dWRJMGllOEM0TGpVZ1hwRjlxZ3VuYVJFQjRtU0J5VGVWWVg1NnQydklBd1Nk?=
 =?utf-8?B?NmFKclRudWs0NkFKaEFJRTVZOEpVMFovcHl4NEpLTTdDTUUrb2d2TTBFdDZG?=
 =?utf-8?B?eXZ2NER0a05GcVRJWWkrMzF0M1puazVUNEJEMFVqT3RnNjBVOFBxNjgwUGxa?=
 =?utf-8?B?RlJOR0k3QVl1RFNXV2VVM21jUlBqdWxHNHE0UGE4TGhyRmt1allrL0t2dllx?=
 =?utf-8?B?ZzRnZmxENm4wWGRVT0FVSVJ1Yit6ZlhOcnlmMlV5c3cwd3YreGhWendqckZl?=
 =?utf-8?B?OGtjRUFheHJvZGw5SEZzLy9yYk5QZnFZTnV0L2RnZ0JXeTBnaDF4Q2tjUDdW?=
 =?utf-8?B?UnBVSUVLbkdqSFg5eDZOOERQOXJoSjRDVXJycFoyc1dWOFllVWpVNlRGTkFk?=
 =?utf-8?B?ZnkzLzdHTVNQSmJ4WENEZjJ6SVhtaXZ5WEZycnl3MVhyNkxXaXZNS2xuZDlS?=
 =?utf-8?B?OUROTEZRaWcyeGZtY0Z0SnNWdWI2YnNBbE1jcWlDT0s0ZStqVVBkcUxzTWdV?=
 =?utf-8?B?aDFJc3ZLSnFzVmN5TEpxbDRFZDBLZUtTV0E3SElEcThqL1F4ZUJTMWkzZ0tu?=
 =?utf-8?B?eXI3bVlSMkM1SUVvQ3Z6dGFyN3lZbFVnVGQza2RlQk9qL1MvdDNlMFhLZjk4?=
 =?utf-8?B?TEh3ai9SeVk1WThWd0p0YTZOWlRWdzFvQnVYa2hncTNmMGwvR1BKZW5zTnVi?=
 =?utf-8?B?ZTNLZE9XdGlGVWFiaXJIYnRzbndKaWp1a0FKNFZlSlppWWpuNEQ0SmdPZVor?=
 =?utf-8?B?STNmQVpWSGMxZWIrcTQzZStndnduY094a21QV0lKa2ExS2tibzl3dHRtZ2FQ?=
 =?utf-8?B?VDJCV1d2MVUrQXZyczJ2Mk84RU5jc3h5aDN5cHl2Rm9lV1VBU243ZGFlQkxU?=
 =?utf-8?B?eUhZNEpucGxMQjY2Y1VZeEwyWXJpZFVQMFBDYXJYNm1FVmd3V1ZqU3ljK0dC?=
 =?utf-8?B?bkE0ampESjN6UnpnOHpSZDBBUGt1dEZGajl4ZlZBdFo3M21VekhHS3cvSG1D?=
 =?utf-8?B?U1lkMVFCRnVzbWhKU0g1N2psUmsyVEl1K1U4dndxdGZwUHhKN1hIZGlJRExT?=
 =?utf-8?B?TjA3dkJCVUVHWXdZQ0hlaUVIZEExajlmMldpUVdmWGE1NUs2ZUJXTVU4SVB3?=
 =?utf-8?B?SFVVTW9ZZlNkdUlUV1RobDl2RW5tN3VYK0k1WTBTYXhmWmJLWktaZ05pam4y?=
 =?utf-8?B?UTBzQXpkdGk4WFRFL0ZNcXJZaUhjeHZyN0RFUStKZExPc2QxdnJ3WFdTRE5u?=
 =?utf-8?B?dDU3Q0g4WS9Bak9rVXJMZW9CdjJxL1dUa0kzVVpwQ3pDZERuTklXNUNTaCs1?=
 =?utf-8?B?VEgxMnhPZ2kyZk55TzlzSGVtMmZ1NExiOC94VjNBc1hkZWwvUHR2aFM4U25K?=
 =?utf-8?Q?5b1Ad2JOIFiBsb0GFgLTjNtNr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff164985-5e53-432a-52f7-08dd83fb063f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 13:13:52.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peqY9EB1a33WmqPWqQZejs+TH4OR1QdEMsq7w6dMPV/qDfnPl4FIQW/MKFnixyL1sih3nv0ubB9yLY8Zjuqb3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6903

Hi Mark,

On 18/04/2025 16:00, Mark Brown wrote:
> Hello all,
> This is my first post to xen-devel. Since I'm new, let me give a brief intro about "Why?"
Welcome :)
>
> 1. I am interested in easing the ongoing burden of repeatedly obtaining safety
> certification for Xen for eventual use in high assurance operational *systems*.
> Call this an evergreen certification effort.
>
> 2. When I read the ISO26262 and avionics cert standards, I note that there is a system
> architecture (it has its own "System V" lifecycle) that encompasses a set-of-n
> hardware items (e.g. fabricated SoC analysis and also FPGA soft IP development) and
> also a set-of-m software items (e.g., bootloader, hypervisor, guest OSes, apps, containers,
> etc.). For high assurance, we must evaluate the entire system and not just some of its items.
>
> 3. Also from the standards the govern the lifecycle and processes for developing
> high assurance systems, hardware, and software, maintaining (automated) bidirectional
> requirements identifier traceability from safety requirements "down" (i.e., through
> levels of requirements decomposition, into *-architecture level designs, into software
> unit designs, into software unit code, and into software verification tests at the unit,
> library, module / architecture, and system level. From my perspective, there's a lot
> riding on these requirements IDs. I would guess that many in this community
> would feel concerned about dumping many (hundreds?) of requirements IDs
> directly into the Xen code base, even if these were located within comments.
>
> 4. Because of 1, 2, and 3 (above), when I look to understand Xen requirements sources,
> my first pass is to remember that Xen is just one software item, and it will need to accept
> integration requirements flowing in from the system (i.e., via KConfig settings and Device
> Tree / SDT language) and also from the core types that it relies upon (i.e., scoped down
> to the operationally-deployed core types including Arm Cortex-R52 during boot,
> but extending to co-processors it uses and then to IO devices that are used, etc.)
> Finally, sometimes other software items flow requirements into Xen, e.g., when
> Linux  paravirtualization or virtio implementations are scoped-in.

Thanks for the context. This is exciting as Xen finds new use cases in 
avionics.

However I think the right way to go on this is to send a RFC (request 
for comments) patch on the coding style.

Especially on ...

>
> In summary, finding an agreeable way to embed requirements IDs into the Xen
> source code seems essential to me, so that we can achieve evergreen high
> assurance certifications for Xen.
>
> Proposal 1: Rather than start by adding many requirements IDs into comments,
> we might instead start out by using a less-impactful approach.
> I propose that we could hand-pick some C data types (CDTs) that were known to be
> critically important to Xen's high assurance, and simply (re)name these CDTs,
> for example, structs and unions.
>
> This proposal is to adopt a naming convention for handpicked safety-relevant
> CDTs, starting with the first two identified below.
>
> For example in this patch, e.g. in xen/arch/arm/include/asm/arm32/mpu.h,
> two CDT structs convey the bitfield requirements from the new MPU co-processors.
> Specifically, in the typedefs "prbar_t" and "prlar_t" no struct tag (name) is used
> for either of the bitfield struct. I propose adding struct tag names to both, and
> then leveraging these struct tag names as requirements IDs.
>
> Suggested Naming Convention:
>   (a) E.g., For prbar_t, tag its bitfield struct with the name "PRBAR_BF"
>   (b) E.g., For prlar_t, tag its bitfied struct with the name "PRLAR_BF"
>   (c) Proposed bitfield struct naming convention: <register>_BF

You can send a patch to update 
https://gitlab.com/xen-project/xen/-/blob/staging/CODING_STYLE?ref_type=heads 
with the suggested naming convention.

However, we need a rationale for the above proposal. So..

>   (d) Going forward, for bitfield structs that flow-in safety-relevant
>    requirements from the core's Technical Reference Manual (TRM)
>    and registers, to use the suffix "_BF" to identify these structs. And
>    to faithfully reuse the TRM's name for the register.  (application to structs)
> (e) Going forward, for unions that wrap "_BF" structs, to name any
>    union member name corresponding to the "_BF" as "bf" and any
>    union member name corresponding to the whole as "whole".
>    (application to unions that immediately wrap "_BF" structs)
>
> The benefits of systematically following these naming conventions will be:
> 1) Even simple tools like grep -R can find all "_BF" requirements IDs that flow from
>      hardware registers that have been handpicked due to their safety-relevance.
> 2) Any CDT-parsing tool such as Doxygen, etc., can automatically find and trace
>     all usages of "_BF" structs at several levels
>     (a) Dependent structs such as "pr_t" can be automatically traced "up" to
>     their "_BF" ancestor CDTs.
>     (b) C function argument CDTs can be automatically traced up to any
>     ancestor "_BF" CDTs, with the implication that the function may be safety-relevant
>     because it accesses one or more "_BF" CDTs.
>     (c) Simple pointer-to-CDT usages should not obscure any facts that
>     either the ".bf.*" (accessing a safety-relevant bitfield by name) or the
>    ".whole" (accessing the entire register contents by value) were accessed.

This should be a part of the commit message. I would avoid adding any 
mention of requirements or req-ids in the coding style. You can put this 
in the cover letter to explain what is the long term view on this.

In short I am suggesting that the changes suggested for the coding style 
should be concise, so the maintainers can give their opinion.

Also if you can prepare a proof of concept with a sample Doxygen report, 
that might be helpful.

What might help the maintainers is to understand :-

1. What is the minimum change you are suggesting ?

Proposed bitfield struct naming convention: <register>_BF ....

2. How is it going to be helpful to the community in general (eg better 
code readability, ease of review, ease of mantainance)

"<register>_BF" can be linked to the specific section of Architecture manual within the code itself. It helps to review, mantain and update the code.

> 3) This convention will naturally allow the new "_BF" requirements IDs
> to flow into all future use / access of these safety-relevant registers, including
> future verification tests.
> 4) Also, it will naturally allow the new "<register>_BF" requirements IDs
> to be traced "up" into the TRM and automatically de-reference the semantics
> and usage and safety-relevant notes about the bitfield, the register, and the
> larger context of use for that register (e.g., at which instruction will the PMU's
> enforcement of "HPRBAR10" / "p15,4,c6,c13,0" be activated?)
> 5) The xen-devel community may find that using this naming convention
> provides an easier on-ramp to "start seeing safety and high assurance."
> This is because engineers who read any future C source code,
> or review any future patch series will see that specific lines in that C source code
> are indelibly tattooed when they refer to a safety-relevant register. Whether any
> line of code access the "_BF" register in part or in whole, that will become explicitly visible.
> The goal is to raise community awareness by flagging access / use.

You can mention this as part of the commit message.

Also it will be helpful if you can pick up an existing file (eg anything 
arch/arm64/mmu ) to explain the concept. As the new code is in flux, so 
it make things easier to understand the proposed coding style changes in 
the existing code.

You can take a look at 
https://lists.xen.org/archives/html/xen-devel/2022-05/msg01995.html to 
understand how we propose new changes to the coding style.

Hope this helps.

- Ayan

>
> Thank you!
>
> Sincerely,
> --mark
>
> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Julien Grall
> Sent: Thursday, April 17, 2025 11:55 PM
> To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>; xen-devel@lists.xenproject.org
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Bertrand Marquis <bertrand.marquis@arm.com>; Michal Orzel <michal.orzel@amd.com>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Subject: Re: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
>
> [You don't often get email from julien@xen.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
> Hi Ayan,
>
> On 18/04/2025 00:55, Ayan Kumar Halder wrote:
>> Add the definitions for HPRBAR<0..31>, HPRLAR<0..31> and HPRENR.
>> The definitions are taken from ARM DDI 0568A.c ID110520, E2.2.3
>> HPRBAR<n>,
>> E2.2.4 HPRENR and E2.2.6 HPRLAR<n>.
>>
>> Introduce pr_t typedef which is a structure having the prbar and prlar
>> members, each being structured as the registers of the AArch32-V8R architecture.
>> This is the arm32 equivalent of
>> "arm/mpu: Introduce MPU memory region map structure".
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> This patch should be applied after
>> "[PATCH v3 0/7] First chunk for Arm R82 and MPU support" in order to
>> enable compilation for AArch32.
>>
>>    xen/arch/arm/include/asm/arm32/mpu.h  |  59 +++++++++++
>>    xen/arch/arm/include/asm/mpu.h        |   4 +
>>    xen/arch/arm/include/asm/mpu/cpregs.h | 135 ++++++++++++++++++++++++++
>>    3 files changed, 198 insertions(+)
>>    create mode 100644 xen/arch/arm/include/asm/arm32/mpu.h
>>
>> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h
>> b/xen/arch/arm/include/asm/arm32/mpu.h
>> new file mode 100644
>> index 0000000000..4aabd93479
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
>> @@ -0,0 +1,59 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * mpu.h: Arm Memory Protection Unit definitions for aarch64.
>> + */
>> +
>> +#ifndef __ARM_ARM32_MPU_H
>> +#define __ARM_ARM32_MPU_H
>> +
>> +#define XN_EL2_ENABLED  0x1
> I understand the define is introduced in Luca's patch, but this a bit non-descriptive... Can we find a better name? Maybe by adding the name of the register and some documentation?
>
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +/* Hypervisor Protection Region Base Address Register */ typedef
>> +union {
>> +    struct {
>> +        unsigned int xn:1;       /* Execute-Never */
>> +        unsigned int ap:2;       /* Acess Permission */
>> +        unsigned int sh:2;       /* Sharebility */
>> +        unsigned int res0:1;     /* Reserved as 0 */
>> +        unsigned int base:26;    /* Base Address */
>> +    } reg;
>> +    uint32_t bits;
>> +} prbar_t;
>> +
>> +/* Hypervisor Protection Region Limit Address Register */ typedef
>> +union {
>> +    struct {
>> +        unsigned int en:1;     /* Region enable */
>> +        unsigned int ai:3;     /* Memory Attribute Index */
>> +        /*
>> +         * There is no actual ns bit in hardware. It is used here for
>> +         * compatibility with Armr64 code. Thus, we are reusing a res0 bit for ns.
> typo: Arm64.
>
>> +         */
> Hmmmm, this would mean someone may mistakenly set the bit to 0 by mistake. If the field is always meant to be 0 on arm64, then I would consider to name is res0 on arm64 with an explanation.
>
> This would make clear the bit is not supposed to have a value other than 0.
>
>> +        unsigned int ns:1;     /* Reserved 0 by hardware */
>> +        unsigned int res0:1;   /* Reserved 0 by hardware */
>> +        unsigned int limit:26;  /* Limit Address */
> NIT: Can we align the comments?
>
>> +    } reg;
>> +    uint32_t bits;
>> +} prlar_t;
>> +
>> +/* Protection Region */
>> +typedef struct {
>> +    prbar_t prbar;
>> +    prlar_t prlar;
>> +    uint64_t p2m_type;          /* Used to store p2m types. */
>> +} pr_t;
> This looks to be common with arm64. If so, I would prefer if the structure is in a common header.
>
>> +
>> +#endif /* __ASSEMBLY__ */
>> +
>> +#endif /* __ARM_ARM32_MPU_H */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/include/asm/mpu.h
>> b/xen/arch/arm/include/asm/mpu.h index 77d0566f97..67127149c0 100644
>> --- a/xen/arch/arm/include/asm/mpu.h
>> +++ b/xen/arch/arm/include/asm/mpu.h
>> @@ -8,8 +8,12 @@
>>
>>    #if defined(CONFIG_ARM_64)
>>    # include <asm/arm64/mpu.h>
>> +#elif defined(CONFIG_ARM_32)
>> +# include <asm/arm32/mpu.h>
>>    #endif
>>
>> +#define PRENR_MASK  GENMASK(31, 0)
>> +
>>    #define MPU_REGION_SHIFT  6
>>    #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>>    #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
>> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h
>> b/xen/arch/arm/include/asm/mpu/cpregs.h
>> index d5cd0e04d5..7cf52aa09a 100644
>> --- a/xen/arch/arm/include/asm/mpu/cpregs.h
>> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
>> @@ -6,18 +6,153 @@
>>    /* CP15 CR0: MPU Type Register */
>>    #define HMPUIR          p15,4,c0,c0,4
>>
>> +/* CP15 CR6: Protection Region Enable Register */
>> +#define HPRENR          p15,4,c6,c1,1
>> +
>>    /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
>>    #define HPRSELR         p15,4,c6,c2,1
>>    #define HPRBAR          p15,4,c6,c3,0
>>    #define HPRLAR          p15,4,c6,c8,1
>>
>> +/* CP15 CR6: MPU Protection Region Base/Limit Address Register */
>> +#define HPRBAR0         p15,4,c6,c8,0
>> +#define HPRLAR0         p15,4,c6,c8,1
>> +#define HPRBAR1         p15,4,c6,c8,4
>> +#define HPRLAR1         p15,4,c6,c8,5
>> +#define HPRBAR2         p15,4,c6,c9,0
>> +#define HPRLAR2         p15,4,c6,c9,1
>> +#define HPRBAR3         p15,4,c6,c9,4
>> +#define HPRLAR3         p15,4,c6,c9,5
>> +#define HPRBAR4         p15,4,c6,c10,0
>> +#define HPRLAR4         p15,4,c6,c10,1
>> +#define HPRBAR5         p15,4,c6,c10,4
>> +#define HPRLAR5         p15,4,c6,c10,5
>> +#define HPRBAR6         p15,4,c6,c11,0
>> +#define HPRLAR6         p15,4,c6,c11,1
>> +#define HPRBAR7         p15,4,c6,c11,4
>> +#define HPRLAR7         p15,4,c6,c11,5
>> +#define HPRBAR8         p15,4,c6,c12,0
>> +#define HPRLAR8         p15,4,c6,c12,1
>> +#define HPRBAR9         p15,4,c6,c12,4
>> +#define HPRLAR9         p15,4,c6,c12,5
>> +#define HPRBAR10        p15,4,c6,c13,0
>> +#define HPRLAR10        p15,4,c6,c13,1
>> +#define HPRBAR11        p15,4,c6,c13,4
>> +#define HPRLAR11        p15,4,c6,c13,5
>> +#define HPRBAR12        p15,4,c6,c14,0
>> +#define HPRLAR12        p15,4,c6,c14,1
>> +#define HPRBAR13        p15,4,c6,c14,4
>> +#define HPRLAR13        p15,4,c6,c14,5
>> +#define HPRBAR14        p15,4,c6,c15,0
>> +#define HPRLAR14        p15,4,c6,c15,1
>> +#define HPRBAR15        p15,4,c6,c15,4
>> +#define HPRLAR15        p15,4,c6,c15,5
>> +#define HPRBAR16        p15,5,c6,c8,0
>> +#define HPRLAR16        p15,5,c6,c8,1
>> +#define HPRBAR17        p15,5,c6,c8,4
>> +#define HPRLAR17        p15,5,c6,c8,5
>> +#define HPRBAR18        p15,5,c6,c9,0
>> +#define HPRLAR18        p15,5,c6,c9,1
>> +#define HPRBAR19        p15,5,c6,c9,4
>> +#define HPRLAR19        p15,5,c6,c9,5
>> +#define HPRBAR20        p15,5,c6,c10,0
>> +#define HPRLAR20        p15,5,c6,c10,1
>> +#define HPRBAR21        p15,5,c6,c10,4
>> +#define HPRLAR21        p15,5,c6,c10,5
>> +#define HPRBAR22        p15,5,c6,c11,0
>> +#define HPRLAR22        p15,5,c6,c11,1
>> +#define HPRBAR23        p15,5,c6,c11,4
>> +#define HPRLAR23        p15,5,c6,c11,5
>> +#define HPRBAR24        p15,5,c6,c12,0
>> +#define HPRLAR24        p15,5,c6,c12,1
>> +#define HPRBAR25        p15,5,c6,c12,4
>> +#define HPRLAR25        p15,5,c6,c12,5
>> +#define HPRBAR26        p15,5,c6,c13,0
>> +#define HPRLAR26        p15,5,c6,c13,1
>> +#define HPRBAR27        p15,5,c6,c13,4
>> +#define HPRLAR27        p15,5,c6,c13,5
>> +#define HPRBAR28        p15,5,c6,c14,0
>> +#define HPRLAR28        p15,5,c6,c14,1
>> +#define HPRBAR29        p15,5,c6,c14,4
>> +#define HPRLAR29        p15,5,c6,c14,5
>> +#define HPRBAR30        p15,5,c6,c15,0
>> +#define HPRLAR30        p15,5,c6,c15,1
>> +#define HPRBAR31        p15,5,c6,c15,4
>> +#define HPRLAR31        p15,5,c6,c15,5
> NIT: Is there any way we could generate the values using macros?
>
>> +
>>    /* Aliases of AArch64 names for use in common code */
>>    #ifdef CONFIG_ARM_32
>>    /* Alphabetically... */
>>    #define MPUIR_EL2       HMPUIR
>>    #define PRBAR_EL2       HPRBAR
>> +#define PRBAR0_EL2      HPRBAR0
> AFAIU, the alias will be mainly used in the macro generate the switch. Rather than open-coding all the PR*AR_EL2, can we provide two macros PR{B, L}AR_N that will be implemented as HPR{B,L}AR##n for arm32 and PR{B,L}AR##n for arm64?
>
>>    #define PRSELR_EL2      HPRSELR
>> +
>>    #endif /* CONFIG_ARM_32 */
>>
>>    #endif /* __ARM_MPU_CPREGS_H */
> Cheers,
>
> --
> Julien Grall
>
>
> ________________________________
> The information contained in this e-mail and any attachments from Parry Labs may contain confidential and/or proprietary information, and is intended only for the named recipient to whom it was originally addressed. If you are not the intended recipient, any disclosure, distribution, or copying of this e-mail or its attachments is strictly prohibited.   If you have received this e-mail in error, please notify the sender immediately by return e-mail and permanently delete the e-mail and any attachments.

