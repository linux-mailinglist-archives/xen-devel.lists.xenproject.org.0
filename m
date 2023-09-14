Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B032479FB5A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 07:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602018.938362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgfHq-000285-4T; Thu, 14 Sep 2023 05:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602018.938362; Thu, 14 Sep 2023 05:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgfHq-00024j-0p; Thu, 14 Sep 2023 05:53:10 +0000
Received: by outflank-mailman (input) for mailman id 602018;
 Thu, 14 Sep 2023 05:53:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgfHo-0001sN-1v
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 05:53:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9a584f6-52c2-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 07:53:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9286.eurprd04.prod.outlook.com (2603:10a6:20b:4de::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 05:52:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 05:52:36 +0000
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
X-Inumbo-ID: f9a584f6-52c2-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUibiN2AyM8CzKvQiTIdqqtH+ivphPzYgMQlBldFEAA9RV85YLy9+5Z/U+Y6X5q61D8b7o/klKhUl37oUli/UWJXWirtfHkiaHpmzb68MrUuXuRbaQxjE3ybCe7CxyiHYkzq9pUupx6h8ye1R7J9Jpdf9AmXDZJ7hT3fzAy2vuB/75yq/1UBfSMUY/62F6O1ShRkg3AV1g/ZJQZliGUSQx7QkAHE3h18Y7OwWE1aI3420AIc/urIpLV+sS6Fu+AILgtmqTtLVSzONt0owpJ4vAbZhb4aTB/qw/sKzf9p5Vex29aBZKnlFWqf19gKER/NtxdKMyf93udBuZmjb4qx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TshV7qkK5PbQOKMr5yQOGzXQVZg3xiYFi0agUAFp6Q=;
 b=Qi40jKyd2yfnTYFhf8qH71EeQUBA0rt8vOZiTaDbq0hYCJZLo+Rm7J0a2atLPIViE973wRewfqTozEWHHPk5MkUXJ7YiGWRdg2V0GmQhwn/zExPQhyrcNfQzGuIq0wV3+Qair2r6t7hvd+M2Bt4J+f0KF5nqa9FHPjVURqqP29Ug1w7HX+Km/8OZQO0RQDikWzxrz2ucM0BHTnfirybLL/uCtmgXR4cCEMG6jvpOjqx6/WJLp9uEOZ/Ed5dciNPBIfzQ850Wp6Avo7uhkNkG5BC5BbYtxGpM3julCAdvvr+kWxCg3QBJz16UDm2JQM4GktunXJh//tmiZRCSwGEIdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TshV7qkK5PbQOKMr5yQOGzXQVZg3xiYFi0agUAFp6Q=;
 b=Yn3svyWhs8YAlRHeu2z7QtrhwCrPK4bG/+V+bbxM+EPutFqoUCfXYBPKFXsh6jXPpkvFnZzKfAQzKU19qQ0P1fsas5IJyFHQV/Rmsx9JUhDd2sf75OfQ55QalwMBLpUrNRNGGCcQfXHSDMjnKWnzhYHIvJyxdYJKqV+MeR/FAzVvlHyDFqBdHhMyt5JfY9QezlrS9j3haySg34PyjMKg4AmmzlYx/LU1GT9xR4+5mTqYShyyp4PJ5uUh++x5uX4BIe0HNklH3kdpNh61r00YXu0usBGZ9oPIHQyUA4eazG/M+POuGGF6ZZr810m3Yij7d4/MDi62Idf4FToswEMdew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2fe16de-cb08-4a0b-adfe-95da6c86ea16@suse.com>
Date: Thu, 14 Sep 2023 07:52:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/amd: do not expose HWCR.TscFreqSel to guests
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Sol=c3=a8ne_Rapenne?= <solene@openbsd.org>,
 xen-devel@lists.xenproject.org
References: <20230913145220.11334-1-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230913145220.11334-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd6b050-f440-4e09-683e-08dbb4e6cc1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hGv89SaiiXwDjJJtHjgpZNvAkmS/t0YPXUe5Ym9jRB0OqcUunZs7BGuLD0IJb/nzviZ+QqYF+aYDtyRo8uDKbGceXdRLPkpI5GLQ811CpcUdDx7aef8BuDUJJvCf/H4bwVeednetabCsGBg/gPef/nD0NrLmc7F8VeReBm7YoeGAdtzttLYcQBZXCde69u5BT0mEX/QTbyDX60I5dGep9BHKojSbC4r2Extk2d5mGDUxXN5ZLU6OU0D2b6w1hqRZalV6RArjEmudmHK0JUtQatmnifZhsJ/BJ50irzWV21NUVE8zhXMfUNVci1i4SdQxBPVb3wjvqmRux6AFg5cdpPCUCN/rsZswj8patSURasj+OgDVmoCVdHnY+/pNf3fmNoXrzfmdGS+wYQ1vxU9QlvGjrWMDADvyChVCvaA1HAd1lSHTf7FPawud7zRmNslEBa+LBEzvX3/GwFgcQpaBDioPvUezqM+UaosSsv9KSGgV7X0C6bqF2fPy62BzadklUZp1W1Kgae9/wLV4NeEm8Buomxfq7zw9A4P7WttJwBn3TJVQefjKmt8+2il/TDPf0ZyYoj282ko80meUt1p+Tx/eNYUrSwbYvOSOsxzyYbcZf6oIojBC63pnRChNqIwPm5H9ZHZksLd0SvzyCu+sYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199024)(186009)(1800799009)(38100700002)(86362001)(36756003)(31696002)(31686004)(478600001)(316002)(6666004)(6506007)(6486002)(53546011)(966005)(5660300002)(4326008)(54906003)(66556008)(6512007)(83380400001)(26005)(66946007)(66574015)(8676002)(6916009)(41300700001)(2906002)(66476007)(8936002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU81YmIvOWtlUzhjZWlXSmYzcDNoTWh2NDRiUzI2ZCtlbEtPcFZjU0c2SmtN?=
 =?utf-8?B?cWx1aS93Zys0cjhjOTFlYThQeWxUNklHTzRaaGx6ek1lVUx0M3pNQVplMUph?=
 =?utf-8?B?Wms4MjNoM3k4eldDSUlZUjlQZ0dKNHhNS2xHWkFaNHFIR1lYcDMzZ1FNN21H?=
 =?utf-8?B?UHBFUU1ZN3JCekNiR2IzY25tQWZXN1ZkZEhSZkZoZ2o1aGVsdW5iMmZydDVL?=
 =?utf-8?B?YXJrRXNwQXI3N0wwZFZacFFCZzJSQ2xrTHpvdjJLTzd6VG5Lazl4ejdpbXk1?=
 =?utf-8?B?cEtJQ1hnclhOQmVjV3V5UGp6RWNpWVBxRTJGOEZXWk1FblBLL3BmcTgyQzdD?=
 =?utf-8?B?Skc2djNFUExCSFNLUnB3N1pUeFk0a0c0TDR3VTdsc3hZOEV2Q01nb2lTRWkz?=
 =?utf-8?B?ZmlucjhjdVdKZlB5TjZaQklRV1lweHJDbGpYSVFDN2F6d0ZPbWRZbC9rQXA3?=
 =?utf-8?B?MU5uSmlrcXprYmNURTN0ZU5OazVXL1p2Z2pGMGxpODY0aXFrUzcwQUhhUU85?=
 =?utf-8?B?VTdTM015V0ZvTXRrUkxYTThWeWRGTEV2SVRDOW5JcnllMFJhcjhOU1BTSG0y?=
 =?utf-8?B?SVdNQlhMaUwwc0ZXUEFJYzRzTnV2UWw5L0xpb1ZsMDNZU2MyVWkwQmxzNG5y?=
 =?utf-8?B?ZUVFd2JlNVEvbkNxSitLQksxNFhGd2h0RHdZckhxVnVBME9uRGZCMktqNnlK?=
 =?utf-8?B?WE5hS2h6amdyTDhkOTFFMERkZS8zUkJ3ME82K0lWRDZvVnE4RWRseDNmOVNt?=
 =?utf-8?B?dEsrYmMzM3ZpY0ZEdGRKL3N4NVZQU255bVV5M08rUmlqS3Vwck9UZ1pXUTY4?=
 =?utf-8?B?dkxlRDh6L3FpVXZka2dTNkFYbEo5RkZPbkNpSHBZYUpPOUR3Vy9Yei9WKzA5?=
 =?utf-8?B?QXNlZjUxQmJWQUpUTUkyMFNESllUMlQxQXJ5UHc2MkxHcWtZM3BTbnIzU2dy?=
 =?utf-8?B?RjROVk5GU01zRy9jRHNsNzdWT1pjSC9aT2UvVTlldXV2ejVvSlBRZ21GaGpI?=
 =?utf-8?B?SGlPZ3A5cnd0eEtHOGpZUFdndnFtSnd4dG1oMzgxeTZsMVlMdStvajY5ZTVD?=
 =?utf-8?B?QUFYbG13c2NGMnd2emRKeG43T0E3dHpJejJnYXFTdkFRdWRoRXVyUWcrN0h1?=
 =?utf-8?B?YWFvQVlObDl3VmtrU3dsR1N6bzJaQW8yZEtZT08wZEVkbjJ6c3RqNHdLZkNP?=
 =?utf-8?B?MjQrdGpPODNCcFlpaEc4aWxaU09iQlR6T3NJVmlVUE8xR2xVcVZnTWRaNy8w?=
 =?utf-8?B?bVV5T0JYS0pjcWU5cUIwSkdLaHhsdERvcnNMbUdtbDJBTE1OWmQ2aDFCOEcv?=
 =?utf-8?B?MVJLRkZMb2RSYVkvYTdsaHJIdlpwdDlDV3pYVnVXNXd6K2RxeDhsa09mM2Z3?=
 =?utf-8?B?K1RvQnRCbFlzdStVam5sUmZSTVQ1TmE5eURZRUJBSHB3cnhLd0ovTWhKTDk2?=
 =?utf-8?B?eXVjVFJjcy9RNUExa3lSREVEL21VZkpVcUJyQXdFQzkycXFSZVU0K1Y0NGFn?=
 =?utf-8?B?MDZPNWhSSXdscTZmRmFJOCsrTkxOSlFIb3hzUmZBbTl1OHhlZFJ3MTRoWjd4?=
 =?utf-8?B?NVNSNVU3d1hnRFpEbG5CTUM0UlJBTnNhMXIwbEk3NkU0Mm1Fb2trL3J5dXNy?=
 =?utf-8?B?cDRYd2xDTERFbDJVV2JXQzZUaXBHR3dMOWFaV0lUTWFhdXFBdCtSd2UvMlk3?=
 =?utf-8?B?R3M3ZEQvOXhIdnQrWlZKSkFweTllVUFOdzNQYjlTcUZ4bi93ZW43NUVBOWdp?=
 =?utf-8?B?NVZTZXlmblViNWVCMHZOWUhBUGVzVTEvNWhicXRqcHRRN0RHOURDWGFkeXFz?=
 =?utf-8?B?OStiWGpmbW9Galk3TFVaZjBDQ2U1b29jYzJ1dEYvYk1BbFFaUXdiS2xkbVBx?=
 =?utf-8?B?Mmpnc3NyblZUdkZyZDJaTTNLL1c2TC9WRXkrVHZ0V0FobUlabDA5MjVKUVhl?=
 =?utf-8?B?Sm1KOWxNY1pFUG5MUWFsZWZMelpzMXZNOFVlUWJPMXk4MjNNdGZqUzJlK3Z6?=
 =?utf-8?B?dldpQk5mUzB4ajE2YVl5ZUNyQ1RYVkRVUHhkbDVDbUVMRW95SVo5MFU4bkRK?=
 =?utf-8?B?VFIyR3FhdlBPS24rd3AwRGM4eUFQNFVXSzM3MDFlMjNvdE5weDNDakxRamYx?=
 =?utf-8?Q?LGyV5boHebvamf0H8rsLUJRUP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd6b050-f440-4e09-683e-08dbb4e6cc1f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 05:52:36.4557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bd5HS95tevioJh0eP6E98PwP+vGkR/dM+nly+Q7NsuvIl1pLYy91rLGPe0osPPZKSpCaSiUT9POSrbjktmJ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9286

On 13.09.2023 16:52, Roger Pau Monne wrote:
> OpenBSD 7.3 will unconditionally access HWCR if the TSC is reported as
> Invariant, and it will then attempt to also unconditionally access PSTATE0 if
> HWCR.TscFreqSel is set (currently the case on Xen).
> 
> The relation between HWCR.TscFreqSel and PSTATE0 is not clearly written down in
> the PPR, but it's natural for OSes to attempt to fetch the P0 frequency if the
> TSC increments at the P0 frequency.
> 
> Exposing PSTATEn (PSTATE0 at least) with all zeroes is not a suitable solution
> because the PstateEn bit is read-write, and OSes could legitimately attempt to
> set PstateEn=1 which Xen couldn't handle.
> 
> In order to fix expose an empty HWCR, which is an architectural MSR and so must
> be accessible.
> 
> Note it was not safe to expose the TscFreqSel bit because it is not
> architectural, and could change meaning between models.

This imo wants (or even needs) extending to address the aspect of then
exposing, on newer families, a r/o bit with the wrong value.

> Reported-by: Solène Rapenne <solene@openbsd.org>
> Link: https://github.com/QubesOS/qubes-issues/issues/8502
> Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

As mentioned before, with this Fixes: tag I think the description
absolutely needs to mention the (changed) view on the Linux log message
that had triggered the original change. It certainly helps here that
Thomas has already signaled agreement to a Linux side change.

Jan

