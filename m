Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1C77639A3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 16:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570526.892370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOfuB-0004Sz-Iu; Wed, 26 Jul 2023 14:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570526.892370; Wed, 26 Jul 2023 14:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOfuB-0004Qp-GB; Wed, 26 Jul 2023 14:54:23 +0000
Received: by outflank-mailman (input) for mailman id 570526;
 Wed, 26 Jul 2023 14:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOfu9-0004Qf-Sn
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 14:54:21 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe02::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d210cc2-2bc4-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 16:54:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8100.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 14:54:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 14:54:17 +0000
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
X-Inumbo-ID: 4d210cc2-2bc4-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeXBo3hfv9kAUVSDoph9MWQC8X2cfQyniLkBOv2usn0EiBw5aXKgW6te/t32si4TywBQwrT8udYMx2kDzeAR2U1uI4NtYsO/kH9lvv/ANsUFnASi36B+CDxQ6jViE0lUhF1c+mNQQDO5LWytYjdxqDGZGl9WnfbbowDBO5t4uVqCFH1zjbtOW+behGRuxMeXWvQh/VzaWaKQEM1F12JCnU0QwzyMFScDAF/EP4devOhuvUAmfjtNm9U/ucvQipAxAq80PFl0PMn9n6T1ASzUNLBvQfVAmrBTcpHbt+9NZ5baiFinJx16OWJYDyCgZNcuqgvFDTSzPH/wH6gJcpuuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqAYqWtayfuq+5rHXVM/D4d7b6c8HBXRhH9aHqA1pwk=;
 b=Qp42XLSIOzxC3Yw6T6U1Kgv+maS3Ro0vwFVKori5WFbKfd2uk7vC9Rk493fH7GWeFTBbcMl0TQ8bayxXfdbS0DoZmwkCMkkD1RREj+zfD0x4VQhz8WFT2d8uXgdn/ydJOkh8EGUgmlbGyJvthfH0Z1DhXkTuFUOj9IG6epJUwjrx2DuAnV1pImrJ/NNr2fToQcWrElaI+0QmHXrYCEkSsMKeZ2Nfyp0TQlAZGQOiVjJRrJvN1BERimoMGtM/F5GDntAwAraVNgfoA5ksm5bZUlDdyki0DP04ItKFdkgmU2E/kAIyYtHL+UHq90XcWnvsru3pQZS63g9CvLs0CeLVDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqAYqWtayfuq+5rHXVM/D4d7b6c8HBXRhH9aHqA1pwk=;
 b=RpmjsqGaFIa6Uuamn4RV1GRcHdMfnl7XVmTmE1iPbYXNApqsRyPs4Sx/1dX0l7WJBWd8S1irZCJgEzC8pH5bmHK4z0EMN94yWyTFVkqO18IDFiA+V3/+K5BDTEhKy8N8m6TQhTwfZ/3uL3BqMdiik0lNZONlV0gUogVuCIB6QkkfpTniTjLDISE5fSVnJrQ6mUKqMUkcI0C7sc3x8GuV4HA2G5ujpBTdq/j9o+1XG7najz2RzszNe6+MGaEHPJNbF0WiR09ueTSCt375OQP0reV6YCMeRCDbuBo7Srx/kgZibFWXbdhg7rdgV9aok2DFXzHVFN5D0fKDS5iB8OfbZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c998690c-2891-d65d-575f-ced52daaa8c0@suse.com>
Date: Wed, 26 Jul 2023 16:54:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] vpci: add permission checks to map_range()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20230726140132.80151-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230726140132.80151-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: c418683d-95c9-4791-b329-08db8de82fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gz4IWGPx2lnSfZphCFMcgw7EC0yW0zCTdskkMhfjqkjfo9J/6RZqHfA6m27pCqXmlAqTVvqcmaOirVRDHyxhEg0gMuJkAol6Nt2ve+45jx7NMYG9JnX9UceWM58XQJgPzWEygxtfK3i1Bjbv8YSXHOybn1sh0XxggvUv8r08fC+h0JwML9nWalZgCOvfxDFviQljCR+ZBZdX9uqHBEaMNtlmeiGKiELeMkUJmRaSgMH/n0cOYbC0VS2ayIRGtuo8l2pzLKtFgfSiRk3I3dNjxFvBMPE00Hwpwb9y+8A0edYtUiceHvepuaTe8lMBuVojtlQDSXCornHj2UJw0t26SSf2iH9DWmGYqTZ09JDQZN3MAkoxn18dPArSYXOd3ehPwFxWjf6sXtGSf+Z1jrcYaOVXd4d6aJwVRHXXxTJfMXmKKS1SHvSje6GpXgGYJeZEb/B7zpl+xjuStwNmhurw7SC76QTw2tiR8m1qvlDRvEW41qM2TKoF7tutNBy9oLlFi6j58BSRmu4w7AG2DiAZ3VBs7y/6eKkfEc9jsSbtDTPT/ueL8ApIPG0lvaOrnxzFZkzieAmoil81kkI+jNHebESEIdGutdbLbWfLg0V3WVnCDVuWdNhAF5wBOiyBFj6z7VzZZcQRJBKkiqp04vl/XQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199021)(86362001)(316002)(31696002)(8936002)(8676002)(2616005)(41300700001)(5660300002)(4744005)(2906002)(4326008)(66946007)(186003)(66556008)(66476007)(6916009)(54906003)(31686004)(38100700002)(36756003)(6506007)(26005)(53546011)(478600001)(6486002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlZVSytFVDRDWXJZTEV3dlQvTUJkUENtc2JXdDkvTm5hNTJ2RlJ5d3ErL2Ny?=
 =?utf-8?B?UUxvMm9LNUVkc0VnZGthdXdhM1czZDZrOS9sRDN5eTcrdE5OZlBhNE9lSkIy?=
 =?utf-8?B?ZGJ3bzJZNHJpeVgvOW9rOHRhbHUrLzB2Q284aWx1VVM0Wm1JNEplZWVpVDRC?=
 =?utf-8?B?bHpRM3pGNzJBeG1QVXp4TzdpV3VmaS81Rm5sUzg4Rzl0ajhlOFRBNmRPRXN2?=
 =?utf-8?B?aW05WUM4ekJBbEZuc2ZHdy9tZ3o5NmVPMUpJN3AwSEpiMEVJR2t6VFJDSnlO?=
 =?utf-8?B?b003VWZmWFpGWU9jRndYd3ZWQ1VWaFZRTUdkR2FzU1Fyd1FXTFA1YjMrRnFp?=
 =?utf-8?B?eHpaV0RFQU0rRHM1TTE1Qm9IMnRXZ3JRdGRlSC9TMm90aFM5ZnBlSXk2WUc1?=
 =?utf-8?B?Y0JnY3gwRkhGRXppYUpXalZqbkVNdVNaOU1ZdUtwaVVscTdzTUs2UU9Wa1Uz?=
 =?utf-8?B?RDBSejYyMHJBRjA2alIzaWNvbm5YeDEvd0FNazM0dFZSd0s2Y3VpelFiN2ly?=
 =?utf-8?B?SGJyNVA0a1lxZkcwdmI2U2xJRHM5NGVwMFBzdUE3bkVNQ0R1N0E3eEpmRDlX?=
 =?utf-8?B?NkpnRkVlVFRlRzJjOSsvSERiWUVxTERTRTg2SjEyM3ZQY3RjYmVhZklXNTJu?=
 =?utf-8?B?Y1ExNnNaMVhmSGVrcjlhdEpVV2FFa1Q0WWw2UTB4YTc5Y2NxYmRmSldlNGFS?=
 =?utf-8?B?dVpBNUxPODVSdGFWT25tdjhQTzBuc2loOXZGOXlVL1ErK0VxZ3hpREYwdjlZ?=
 =?utf-8?B?YlBUcWZOM0xEcWJKSFNDVFIwNzdiM3JJaHczcWw2ekZrY0pKNXdDWC9KM1hM?=
 =?utf-8?B?Rjh1T2dqTHgyM0tVT3FKYUtGMU1ZdEErdDByVFpaenp2NytDVEVTRkFiVzVt?=
 =?utf-8?B?WkswRTVTeWdpeHVwdjRoWGV3SEt6VS9ZZHMySEdza0tFY0JHZXpBb2tzMkEy?=
 =?utf-8?B?WmNaZ2o5eEoydmJGb2sxcnNaWnlTTm5RMVUxbndnNW1Hb0RZK3M0bnEycFpa?=
 =?utf-8?B?dS90OUwvRnEzS3hoMEJCVGpPRzd0L3JBeXRlbm53cmI0aHpWd3V0bzM3Zncr?=
 =?utf-8?B?L2pmUmkrUU4ybzNTUGxYYjhVYjdWZVcrbXRVSkxJZllBMzdTM09CU3VDSWk1?=
 =?utf-8?B?Y1A5MmVuVjV4ZGhXRFIxM2l2cnJUdmFUVXVyTlZyTi8za1dILzM0N0JqL0N5?=
 =?utf-8?B?cXJydWh2S2FnTEJlWS9Vd2Rtd2xXQnZreWpEem43WWVFRXJML210SkVIV29N?=
 =?utf-8?B?Vlg4dk95ZGFZdG1PdkdiajZZQ1JieGprSzNJMXV0MnFJSzFJMDVyQUo4S1Nv?=
 =?utf-8?B?SnptQnpRbUVTTktKY3VmN1RuQ2xFU2owZkpKL0o2OWt5YnBldmQydUpHcGhL?=
 =?utf-8?B?UW9IWWFOLytSMm1HRVVJWk9OeWhER2NIdHhVekxQNkRYQnBhRVRIRVdWN0VU?=
 =?utf-8?B?OGxRY3pZQUZ3MVVUelNEc3k0T0U0bkNxeWhqZXJIZTBlU2tNSG1taEpGTURI?=
 =?utf-8?B?NzRCY3A5TjJMK2xwczd2ZHpuTEVHd3ljbkNjVTkxSngvbFpnZzc5NFcrYlN6?=
 =?utf-8?B?OFhuQmRzZjBRSUdoYWZqV0ZkTjN4T2pqK3h4dElkYlc2WU15MmZONUorSDJq?=
 =?utf-8?B?NWRlTHZKalV6UDU0WkF6UWVTVW8yNFROTW4vR0NJdnE5dzJXekZHdHZ2bFVk?=
 =?utf-8?B?RUx3NjQxeWR2K2YrU296azkrenVGemZZc1NkWkdOSFhKWWRXSFdpT0o5NDdV?=
 =?utf-8?B?MUR0dFROZzJBUTFqMW02NEVQN1ZGMmV4VGJqSlZOczcxWUVuWURIRmNOdkFX?=
 =?utf-8?B?dGptVUxqVU5Ca21wYUhxWG5SN2pseTZyQ2drbHVnelh4MmJoN3JqOXdBMEhs?=
 =?utf-8?B?UE5iUWxXVmoxb1Iwa3hWdFh2M1p2TU5WT2tVOUVCZndGbE1oaUZaYkVsNXpZ?=
 =?utf-8?B?NkhDVmMyakxSdG1KMWczN2N2SzQ4NWhaZzZWeHZRbUEyUVQ1TWppSW1hcS8v?=
 =?utf-8?B?Q2dNeFpqTjFHdjFrZ2xGWUhkeFVvenFzbWlrYlgwbWtraklPM0hTMEM5M0l4?=
 =?utf-8?B?V2IyclV6d3NYclkrRkpQVUIrNVV3WGJ0RkV4VUlhcmNBT2hsSzBPcjVQSFFn?=
 =?utf-8?Q?KuE3uT30goB95jV3+HoKvZaBD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c418683d-95c9-4791-b329-08db8de82fbd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 14:54:17.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ux18UCxU/nL+r1MjSOpF6/OFkD9y6dEfzgAfpl44uZmyA9n52ze4Labr/QL3xDtOysYOUVnMlIGw2P8Sb3VRtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8100

On 26.07.2023 16:01, Roger Pau Monne wrote:
> Just like it's done for the XEN_DOMCTL_memory_mapping hypercall, add
> the permissions checks to vPCI map_range(), which is used to map the
> BARs into the domain p2m.
> 
> Adding those checks requires that for x86 PVH hardware domain builder
> the permissions are set before initializing the IOMMU, or else
> attempts to initialize vPCI done as part of IOMMU device setup will
> fail due to missing permissions to create the BAR mappings.
> 
> While moving the call to dom0_setup_permissions() convert the panic()
> used for error handling to a printk, the caller will already panic if
> required.
> 
> Fixes: 9c244fdef7e7 ('vpci: add header handlers')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



