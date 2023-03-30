Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED46CFFF3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 11:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516551.800845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phom2-0002Sz-2b; Thu, 30 Mar 2023 09:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516551.800845; Thu, 30 Mar 2023 09:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phom1-0002Ql-W3; Thu, 30 Mar 2023 09:40:49 +0000
Received: by outflank-mailman (input) for mailman id 516551;
 Thu, 30 Mar 2023 09:40:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phom0-0002Qf-0O
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 09:40:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f21580b9-cede-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 11:40:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB10034.eurprd04.prod.outlook.com (2603:10a6:10:4c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 09:40:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 09:40:43 +0000
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
X-Inumbo-ID: f21580b9-cede-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQuUzydJfZZJ2N4/ThDd4SxSZNI0LSphUg5YBp1SzrfbCmIQFrhcrSvTE4jG/hWGebMVBaSadY/IjxOlcIJHsBuISk/y7xf5tSvf3yQY/QD/oiRBf2ohAAx31K8h8TbVFITE4biOnu+t7xgZb2EJ0yjY6V8zhcv7kyc/huwnjjWtFHm8Q2WzOADYNgp5YCcp/HlHXsVmpCPzoNYzBwNmsr2RmLvTlJLJzAXYFE8I8Rl4PyLtSlxFb+lHA2UY6O/TkzgfhOmp64dMzDlKi97upY12f8Y4+3d+dF81kqJ2SbIRIN9bOGtIx8oiRr32vnt9/SQ5dvTqYBBGqoPSHvJO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FOF5IBTMudRrcIzMtKWAZCD5AeZFopY8mfnMr1WqLg=;
 b=ZD+Uw/emS5lRJhglhlydKOH580fWUWKFBSxcy44IjnhFRwt8K/PL4Nbz129uqJK0AAHSJj1ckzIxbrhZ4rArmY7NSxfkOUQy+i5Xx2kMR8ldZuFJJAP42ggSvcF4Qh4Cd5xoBGxUFnGNEHdVUNYJZ7Yfjf4LjJAKKYOkVqvRGl9aal4wnS+6ilgQ0uRzatnerXEToaIC537Hs5dKdn7JkRJeum7CuT5+oUJ0zC8W7sAqLfE/NsOiKkHTEi+q2EHPeavz+vc0TajsT4Jia2O+7gPT4vR4AH+eGE5qUvkZzKUY48+Nk6VLGm/6nPjw7vFieIFSxAOddFtFaP5ZKW0Wtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FOF5IBTMudRrcIzMtKWAZCD5AeZFopY8mfnMr1WqLg=;
 b=N97oMY8KVCRSryH2zn+VTqBNwEwJ2YihwJyK0/HyrSBW/d8p//5j+iFLUz/Y39wD39zPS92Aj4xxzZp1P1oW+kM4nnQf596L0kno4lX9+/n6JWKjzr5TgplK3bTbLH9oIjuyMBTSjwDvJ21VNCDanybYTzV+lWlK7AGT/QEbcK0QyGeb2M7HefTLe0jDZUJ7V70cLxlHPIYvfncF1Ko0v/QvgOpAn0r1bF03cUu3Z1pyHbZxISVfl0CW7BJGeXY7eQl2eejJF8MQzI2cwdmejA5CpzxNa3D48b4bEEhTFy6wc7T7fDbwaGJ4QHWaqY+B4uNLYPKrAHI6Xq+fCBVhrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4051f9f4-2306-204a-1ea7-5cadb6eaa175@suse.com>
Date: Thu, 30 Mar 2023 11:40:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/9] x86: Merge the system {cpuid,msr} policy objects
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230329205137.323253-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB10034:EE_
X-MS-Office365-Filtering-Correlation-Id: bca2b5df-5c66-45ac-25c6-08db3102d509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Skmxkst8HOjIB1MgAnAkCBpgfspmzFXndrjitjs9HCfX7YbRgvbbSRNn8/hq8WyXiWbW87VfyE/0aC74dAcQ0FC+jPsYX4B53EM9zUpIEKStOR7ndMPEGuDN0DqmV7BFarN1uj+lZyuu/R2po0wMnc5VFJ2zjNFW4s0TYM8jZNNoCjGdcXRXHSK4aGzZTNfoDH95fFq3LqjJKsVfPRCJXGuoDdDZbHxQKG7ZwY/1yk7mSFbM1EVCDcK8I0r9SnR5u+Jjjvqi7ObNKGghnORmGR42JJ9aims4oRS7lwS4+HB5mlYFAXP6wQkGx0SenfWjPiWCwZFcajh6Sf36O6OdMjl4YKqlydkU4LGFzUtkrXBHxpZLRJZs35Rdzb0WkuzmCcHSRoGRTtLeeEg3O79WzHF+5Hk3JT8+iVFvCBGz9MFmCLdtGwj+j7rs6QsqSclklrz9OLuWERxDtPx2CFtJ3c8zj9wjLPvrntSfGcQxDADcOawFr7O6BrWGNMvb7SA/3vdptUxzeSI9fghkDXTP5AZPD7ojDG0IV0NJE91H4gSca25i9Kg+lgZTHnTDlHF9tK/ycsKmbYW5YhPCvo86P9rCeDEsEOB5ISBCfta3+V8vQVN5zVvqCfIoGMXQOd0HFBkkJrk44XmCleFqdolbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(31686004)(38100700002)(316002)(5660300002)(2616005)(8936002)(2906002)(83380400001)(41300700001)(31696002)(54906003)(6916009)(8676002)(4326008)(66476007)(66946007)(66556008)(6512007)(86362001)(186003)(6506007)(53546011)(26005)(36756003)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUI5TmtmNWNOWHVJZnRiczNSNWxjRGxLbG5yb1oxTHl5YUJUR3dMcHEybytR?=
 =?utf-8?B?WGV2cG5TSU1Sb2ZMUVoyc0RHMXoweHltaXdJR2loOXZybFJ6QmNNcGN6RUpx?=
 =?utf-8?B?eldOV1J3cnd0SkowMU9ER3U1RzVic0o1a3ZHOW15cVhiNkhtZW1IU1JlSXJH?=
 =?utf-8?B?VTNheVVpdHBqMFFrbm9USVMzaGhUSTdObnhlWUczYmpqOXNtd2lLNXlUbVg3?=
 =?utf-8?B?cWhIZ1JsZG9CV0xEM1d6eG9GRVoxTVhGMjhVbWlCUXlrQk9xaUk5dEpHYkwx?=
 =?utf-8?B?b3NQQ2hQWHhwQ091S2JydkZ4VVJxZWRzdC91a0g5VFk0QlFBbjlnM3BtQnNl?=
 =?utf-8?B?M2ZaV2VxZzV4SE56YkV2OGZiV3dtZGs3bFRKeFlFQ0xtbGN2NGJ1eVhoUlJi?=
 =?utf-8?B?NlBpZjc1NFJ5VFp2R05KUHNLcVA3WGc5aVJLN0F1SGRXZmsyakJKNkV4by9i?=
 =?utf-8?B?bUx2cThET1lWeUlXY3A1Y3NESDdCbURjbzdUU0NwSEtqNU1vS1NjM1gvOWY5?=
 =?utf-8?B?ZnNXdnh5TkpNdkd0ZnI0OHRRTGtYM0ZMZ0RhamtDY1FkVXNGaXNSZDhBYTk1?=
 =?utf-8?B?bWpXaEJPK1lqcnQ4NHc2aGtlakVlbzJTdGc5c1BUbEJtWTJQZW82L1J1c3Bv?=
 =?utf-8?B?Q2U5NDRGNyttTklRbHJFdTI2MlVsVmpkVkxXbFNKTzZhOCtxZDh1bWgvUm9z?=
 =?utf-8?B?L3lDWER0MjdISDA4T3ZDVEVJakdybnBGck4zcXNIQVNNQVhuN3VtNXpReFpP?=
 =?utf-8?B?NEZ5MzY2K05hU2pCdEpBR3lrWVdyMnY0KysxcnJEWHdxSjU2UFplVlNkajNV?=
 =?utf-8?B?KzFlbEVKMkxic3FnR3NEaU11eGtIZGRoM0VmckFBaEhrWXhqWFU4dDhlUkdQ?=
 =?utf-8?B?RUFTdkdySG85aFFQZ2dDakFNb1gyT1d6R1F3ZGdtZjJEQ2NxTnVTUS9PdjVF?=
 =?utf-8?B?MXE3TzEzSVprVnoxSXhaMWRXaXVtNnRDcVh2a0Z4SFhNZTBYODdmTlEycU5R?=
 =?utf-8?B?WkpiWnVEUWE3NE1IeGZSckExOGdWaEhVZDhpYUI5N084dFNqcDJvS1Nmd3BL?=
 =?utf-8?B?Z3NyOHRSaC9yUnI2OUx4dUVDUjZhRzZjZ3N5c2FOOWdVWVh2eWFEWjFkWjY4?=
 =?utf-8?B?czlBSk9NZzFqTFpnQnBhay80RmdtcmRHOHp6Zld5Ly9vaHlrV3JTZ0JFUXhN?=
 =?utf-8?B?RUJZZ3p2eHV6aCt1aEhyRCtlc21nQjdFUWdMQVdnRElXR1NKeEdUOUh0bEwr?=
 =?utf-8?B?SW9XVnkxVHhpOXlDelNZaWgrTXJxeFEzaXhnMHg5ZVNNK0pjcVRGbmZUZ2Ro?=
 =?utf-8?B?aVI2OWdQS1p5UDB2UUJtV3JTaVJkZENFcUZJKzNxWEltQ3gyZE1CdEw2Wk8y?=
 =?utf-8?B?VmpwQmM2SmhkbmFDMVdCMGg0bldlRndFaENBNEdrNnZqV1hzVFpmdWJhcW5W?=
 =?utf-8?B?Zjdkc1p4YkluOE5NanpsVWpzSWRoVnF2SXU1R2ZtczNOdVNrQWE3VzdrSGg2?=
 =?utf-8?B?VDJFOFdnWmdOczhMTVc3RVl3NW9JZjRoQk14Q3NhcHNWNUFOL3FNaFpDL1ho?=
 =?utf-8?B?bnlvanlvblA5VGhtbU82cUp4alBORzFLdUdKbS9FZ25ZSGVaYTJYRnVlTHVy?=
 =?utf-8?B?NG5WR09WY1AyR250QTNKV1puTHZrRzJndVBINjNtRjJjVGE1VHA1dnpOamJF?=
 =?utf-8?B?WklHMytTLzNTMGV3S2pxQjhNYnBqMnZrSTZmQ0Rmd2lVTit3OEJrUmZBZ0l0?=
 =?utf-8?B?VFJtMjQ1dU0ySTEyTW5mZ1lSWC9NQzQ0ZnRtZlVWdnMvSHg3ZUFWQnpZMzlq?=
 =?utf-8?B?UTMvR3BqTXlRbDNSVmVmMXc5VktDekQ1dzU1QjNMT01rd1NQR1VPZzJvUzNG?=
 =?utf-8?B?MnpJeUtiSzArYTBUZWRLYnByc25hUUNRVjhicUZmSmdpZW85dU1CRjVpRnNF?=
 =?utf-8?B?YU12Q3FnQ3B0bVlzOUM2cmNpbjRva05nMU1PdEpkOEUydGhzbVdzMkV4S09l?=
 =?utf-8?B?K2RodmhWU2dzbWx5TUJ6dDRsYzNkU0tXWUx6bnNGREh5QWpPb09XTlA1MTJq?=
 =?utf-8?B?dzVBcnNvK3FwdWFJTlBsNkJJK2Vld0hSb1prUDQxVmcwWUdEcnNYbzBLTG5U?=
 =?utf-8?Q?jYQdPGqj9EwEzYDkAMzHqodCR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca2b5df-5c66-45ac-25c6-08db3102d509
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 09:40:43.8179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZqcnW20I5GSTuKrKtv9scbmKUjwA7zhGb61bHv+wUqLNi8rNb4/ZbR4Jopl5nKb0Ls8p5z6gN/+L7BHW63WJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10034

On 29.03.2023 22:51, Andrew Cooper wrote:
> Right now, they're the same underlying type, containing disjoint information.
> 
> Introduce a new cpu-policy.{h,c} to be the new location for all policy
> handling logic.  Place the combined objects in __ro_after_init, which has
> appeared since the original logic was written.
> 
> As we're trying to phase out the use of struct old_cpu_policy entirely, rework
> update_domain_cpu_policy() to not pointer-chase through system_policies[].
> 
> This in turn allows system_policies[] in sysctl.c to become static and reduced
> in scope to XEN_SYSCTL_get_cpu_policy.
> 
> No practical change, but we do half the amount of compile time space required
> for the system policies, which saves 6x almost-2k at the moment.

But what you save here is only what was introduced earlier in the series,
if I'm not mistaken (just like the "containing disjoint" further up)? Also 
do you mean "halve" in place of "half"?

> @@ -391,7 +360,19 @@ long arch_do_sysctl(
>  
>      case XEN_SYSCTL_get_cpu_policy:
>      {
> -        const struct old_cpu_policy *policy;
> +        static const struct cpu_policy *system_policies[6] = {

Another const wanted here after *?

Jan

