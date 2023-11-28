Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6148F7FB7E1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:32:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642932.1002751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vNw-0007ye-8i; Tue, 28 Nov 2023 10:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642932.1002751; Tue, 28 Nov 2023 10:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vNw-0007vN-5d; Tue, 28 Nov 2023 10:32:08 +0000
Received: by outflank-mailman (input) for mailman id 642932;
 Tue, 28 Nov 2023 10:32:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vNu-0007vH-VP
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:32:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 604067de-8dd9-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 11:32:06 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 28 Nov
 2023 10:32:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 10:32:03 +0000
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
X-Inumbo-ID: 604067de-8dd9-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaaglNm59ZJt1a9BvePcC+JJ6qo7/Hg8pU9E4uw19Znm/22itgAsNQju/9ILoHCFxsQJx9x+CQrp80aHYmEKsRqd7+X8xqOnVISpck8EyOtjUznOXiPDIZlzzmNA++qjDnLQa50AwMce4c6q+mXNjQObSKRnMcxfcNjCr6bDd55cExCWR5EwwhkODkJGNRX2OBT2iQTOPdO84+WfBPhZBn9wAS1QnPoJgunkefEQj+RmS6lPjJOkgXgKuRyCutqIug+c8+nrZuHAhgznpYi6yadnlVdYnuGrPTah3JjsZPKTdmsJLZ6UjYW13OKL94PXW81cHRNU4tYmbG2Lr3KvvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZXdqutN+5/hQK5ONAjJx6f2v2m6qGbaGE+hCP22rYs=;
 b=Eq2H/eMkkj32cSFeJJx5/nPx/Oael2NxskflMSr2ID4qant/3KIxJxZedpiETJMOiCN+ecmqgex7sGEukFc3iOIOHIHpzOYPMrDLF2QjMrmIC3CcduOyPZUGoAu5Eh54kNEVnqr5vPzMQCI5IjROUxbvvONEWAyAUziFFYvzOucd0gawuW89PjUv0YgMnFx4QJ/CNea+ArFJ2JYTIU134YoD4IhQsFijVdo4snBCVo9hLvxzbRqebtOrev5Z30kn3pZ7t1A/eANV/6JVVsnlqwsncPCuum/aC8hNh7405nrItLlmWM6x6TTOEGM3BcVR7qXePk7OW2rgY1pQoD1FCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZXdqutN+5/hQK5ONAjJx6f2v2m6qGbaGE+hCP22rYs=;
 b=d7sknWosowJrfcsKRjLzvwH+q0fYTG9bBukc/8avIbeK8KYUse2G+GN2Eqs8z99to4Ll7+I8CG8pMSX1zKzH1tb/hOjHw8M2NIaprLXT5EhCgnRLgm56uQpjMv04zprSWc6tK53p2LDF9WKMT3gMIWRLs9kXAqf7r/HXfiHvcGnKUUTKfP1HuJiukNlcRayaPut196ir64wgQLgdKVU9lQ2gkrEIRxStkPZjLni8sL+h7lgEBdvBC41lnRLzyIYr4kIcBXtLIOabZcWLEg3KrKCqlBZdu1Nk03O4ZQbNtaTWUl51RRV+SZBYpOaYhMPE49h/kZwhYUkI33We/4YOTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
Date: Tue, 28 Nov 2023 11:32:01 +0100
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/6] x86/HVM: load state checking
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc853ad-3615-4c90-09c3-08dbeffd42ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XynfCyMmLJNcbKJK9YAAzTQ8x5PzBP9ZGbtBkHTfbDbO4tJKgvmalhHxJbhm/+dp3WQkhvwU32af94dQs5ZK0FvnTiRUSWCrfJcBeWoO2LUyjrUdzF836wPV+k4AZzMt27nQq75uHsoTcbmCcXOYJCaOdDYtsrLyiseZPu96zaOzFsBMVeuQyY6Aj5K02lPCWFTvADodRGpEPwVKeoyxFnq5FcWMGhsqBBEC/trmYLF89pJOxF5p6OQd2pAK9gO9aLRP+h15m5/4m8SaDV/1xIEF4bVVX7Gv37WjAnIDvl7oUm1JqHdEx443Vry6q89beoN4hT94ueA5DG2JBrpUeVLGKkiLdEc+1smfIEqKDxkMjI/hC9Qs+edkzjXPlH5nA7gCceCajVkNSjNU2LswrmIOuSpKP0AR6USo3RIkPU9GagYN8HDvdaPjlPM0lF102RAS/nrQ8moiQRvNXsHzfcsipDSZRtzDVALVNd7FmwxUqyHj2nrKQam1gzODan/K31atqixs5lKlGxeFbtWYjJpAc6Rc0+uh3fXKuJJvuLHs847qi/oibRGsUfteQt07PhoGb7TfRq09el7dN6zVdjh5mjQxjbDyV9HSAJwKhYkb5VOVKK9R0OT4LMEr8b24fMuB964a0+JJvu6B2X8aww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2616005)(316002)(54906003)(38100700002)(36756003)(66476007)(6916009)(66946007)(66556008)(26005)(6486002)(478600001)(6512007)(6506007)(31686004)(86362001)(31696002)(2906002)(5660300002)(41300700001)(83380400001)(8936002)(4744005)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3g2UjB1WWg1Y3pWYVcxREZSalRJdnZ0dWYzMnNxVEJkMWd2ZW9tU09keU5D?=
 =?utf-8?B?ZFIvRGtBYjFzb3U1Q2xsaWgxMjF1V0ppL05rYmJwcjdVaHc0R2dmSUZaMTd2?=
 =?utf-8?B?bGhpSFBla3F5SzJpZ05OWUFVSXZCR0EvajZiRGdoSlcySzFLeldpR1paSVR1?=
 =?utf-8?B?Q1dWaVBBOVZ1aTh1UDNxb2FFdVlpVExhNlFlU01sU0dCZm5aWWhJUzM4ZThD?=
 =?utf-8?B?ZWRKRnNManZ1WDkzS0xJRkhzWlpnMk1UUXowL2FxOHJ5aExZL2lZdk9UVU92?=
 =?utf-8?B?ZDI3U2ZBbnRiUW5YSi9XUXRVeGFabzBHWEpEQ2ZocURURWVBQUtId203MlBB?=
 =?utf-8?B?UWg0YnlWb1AwK2tIU0V4emJDN01LQ21OQStCdGtZVTlhQ3l5MUNjMjVyS05D?=
 =?utf-8?B?WFJqSzZZMHBIT0hlZ21MVWNhdktMRWc3Q2NLRHNRWEtUTzFySDMvQVBXN0hh?=
 =?utf-8?B?amR2TGgrdm1DRUdZSzR6NGhZbDZnQklNUk85RFlSdGwrSDdRQUZaaWdwRWp0?=
 =?utf-8?B?WGhtOWYxQWVmNExCOWRpdnFOUzAwUFJza2lIMUtxQUF0Z0F0WU9WcTJVbzNy?=
 =?utf-8?B?c0l4ZGNwSGNGSWhqK1J1czEzRERLN2JqV21SVk1TdUxnaXpkaUxSV1daUU9n?=
 =?utf-8?B?UHo0aWY4ZW9CMFI3blZlQUZKdlpJcHVqN296MHFjMzAyRGxpbnd4emhxWVZx?=
 =?utf-8?B?MEcxUFNIcm92S3ZLblNwZlFtc2p1VHlGZGJIWTdaZ0x5WXFQa0d4aVRUTVVU?=
 =?utf-8?B?VjEyVFJScnh3ZzJHbVVPQmJEMGd1blVIRm5QaVJQZSsrMjIwSTQ5ekZjU0xO?=
 =?utf-8?B?cExOSGJQNHp6dmZpTkp5QUwyUTVxeVJzMW9iemNMWTdLeDZRd0ovcWpwQzVq?=
 =?utf-8?B?c252M2lmQldvVmxVRmVSeFFVNDI2VnN5YlRQRjJRVklNQkxMb3FmR2t5TlhQ?=
 =?utf-8?B?MHFTd0lqS056dmZHTnZHUHBsaHYvK00vZHYzNExTR2hhRnkwam1YN1RTaFV2?=
 =?utf-8?B?Nmlua2oxWFAySklNZEYxY1FhUTFLNXhoVDRyVlNFdnpNejNXTFdRdlVZZGY5?=
 =?utf-8?B?ZmFacXdERVFFaC9XcktyY2xQZlozZExyTnB2ZS9sR0dZdEVVeVltcDJzM083?=
 =?utf-8?B?M0RUOVViN3V5MytOSS9RbVZ6K1BJVmZ1Y3d6b2ZKS1FYbjlsRXF4TS9zWE9p?=
 =?utf-8?B?QmZFN1pIeGZHR2s0Ym5SeDc4bTZIR3hXc2gzSXJNc2tHS2JyamRsQTJUUGo2?=
 =?utf-8?B?b2pMR09BRkhxVlN1LzVkYndndDhIK0xXM2doM29WSk9LVkhCbEFieDhZQkti?=
 =?utf-8?B?TUxCSnlqdE5EcCs4UlUvNzJFUmlKZkFuaUZoSW9SRzdrcHQ1OFVwZEo1b3lX?=
 =?utf-8?B?L0RrTUFER3ZFVDJTUzJaZEZERVJPS0gzNkhxNXVrTzc2TFZNdDdQSXE5YTJQ?=
 =?utf-8?B?U3RUQk1jcHlsY0d5enRyMHYxMjdBRmlRa2o0cUpvMk55c0RESHVUVXRMcUY4?=
 =?utf-8?B?Ly9Zak8zYUNEZmIvNGFsQ3RxSVpIOEt4RnB4elpHbzRaVHM2R1I4QUd2Y1hS?=
 =?utf-8?B?V2JRZjJBanMxRkVpOUY4M2F3SXc4Vk5BU3BuWlo4NTdsZTJaRXV6bVF1NTYr?=
 =?utf-8?B?U2ROMnZtbjU4Q1pySTRFVXRVY3pGUUtGRi9UZ2ZhYkVNMHNjQ1l0UGJ2QUlC?=
 =?utf-8?B?cjl2ZUdnV2ZrYkRLd09iME5aQkpzNWxmUmlkcHo1S0VlRmRBWXpFUjdvN1Fq?=
 =?utf-8?B?U2VNbzA5Y1UzUFNobXpreE1XOXRDYkxWMVhLV0dsSEh3c085Y3JXblpvS1dS?=
 =?utf-8?B?QVJndGVUbXJ1cXltYkxaSnI4UUNSMFdPL05pd3lySzEyMFdndUdxaVh5RVZ0?=
 =?utf-8?B?Wm4xL1hqUC9ESW5zbG9FVC9XWlkzWjNzVUdkWU5Dd3pSMUlXaEw1M3N1T09L?=
 =?utf-8?B?QkNQUyt6Y0N3NVA0SjRENUpqUW91YnpjZ3dSTGQ1QVhZeWhzNkdEOEwwbWR2?=
 =?utf-8?B?dTEzd3I3Z1A2ZTJLb29Zd2IrRVZ2R0lRcjVRbWFibkQ4Y1VSUWdnTHRreHFw?=
 =?utf-8?B?YVorTnRXREFXLzB4Tlp3N3dJL2pvMFl1eGdWWDFiWURtVVZPQnBweUUrd3k0?=
 =?utf-8?Q?/iNjq6WWWP51FE42XzMPsLA1/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc853ad-3615-4c90-09c3-08dbeffd42ce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 10:32:03.0485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlWkBYWtdVdAuS3KD0u4wXtw8WaH0n0zbWtIIx0wX7+pmVbGFCDUra/vKzah0ZVVsRpoAVpE8VD4/VmiwHz2gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844

With the request to convert bounding to actual refusal, and then
doing so in new hooks, the two previously separate patches now
need to be in a series, with infrastructure work done first.
Clearly the checking in other load handlers could (and likely
wants to be) moved to separate check handlers as well, down the
road.

1: HVM: introduce hvm_point_entry()
2: HVM: split restore state checking from state loading
3: HVM: adjust save/restore hook registration for optional check handler
4: vPIT: check values loaded from state save record
5: vPIC: vpic_elcr_mask() master bit 2 control
6: vPIC: check values loaded from state save record

Jan

