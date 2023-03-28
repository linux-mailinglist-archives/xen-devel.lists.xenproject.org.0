Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7366CBC4C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 12:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515627.798691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6M4-0004h2-GX; Tue, 28 Mar 2023 10:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515627.798691; Tue, 28 Mar 2023 10:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6M4-0004eX-DF; Tue, 28 Mar 2023 10:15:04 +0000
Received: by outflank-mailman (input) for mailman id 515627;
 Tue, 28 Mar 2023 10:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph6M2-0004e9-1u
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 10:15:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 660e4a6d-cd51-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 12:15:01 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAWPR04MB9743.eurprd04.prod.outlook.com (2603:10a6:102:384::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 10:14:58 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 10:14:58 +0000
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
X-Inumbo-ID: 660e4a6d-cd51-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpD16FrxGofH2NKJuvEIFtS8Otx8MBjco/h/tgvYzfJ68x+rjo2sNvhV/YUAEVB8i0QiRR3HzW4+zHFactxzHVL26Ew+8pAyPgfR1bMkZtJ0sYYrrCVOjTUGjdxtO3r2I1S5BDUhPrY0PTgpOgEMSW8RJtwBUxG71XvpHGphI1D6hQsWTebayfEnrBAZBnaEOmcCm+9RwaluX0n7Ne9ASCdzFon6apxdBGqgd71MYKE8zGiNfS3XZygFmF/v1dXnq/bL+r/pF7lp2CmSKAlIum390o6xkWV/vkeMvrVZrEkQ6+fE9b7jpw9SMPjC8Bb7Flu7cmQWsPR6YhiJ+Sm9xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhSDwoQ4kqHBumKlLoGgNQ2DGi7mV2osGT+cRRBdg+M=;
 b=MoQcSk3b3NzJWcI9zS8CRYzTCfLeYbhbW4yQKRnglxKCWYnL2CSA09foX+vLsO14JVQq8w3RTUwwmBkgWMU8jypdiX4awgvo1GLaPbfh/trOPmp0381EAoGZyRzltz9fkXMwGNxJE3K8dsLRXK6mzOW5vc4Lr1mqAeiuxj5A+mNdLeFBbWXCF0oTGCQSBoy/43BOoFVVaZl2kX2TMZf4At1ajtmgyjt9pjbXOQISFe5f7Ny8/RDjbC31ZbPyOZwCksbzucB++H13/mr1GsJPdm3cxHl71O+wSFoiDjGWW20U0RSIdWRPBedjMxJPlW7lizRQdfIwf0io8TeciK1bwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhSDwoQ4kqHBumKlLoGgNQ2DGi7mV2osGT+cRRBdg+M=;
 b=xnnwi5NX5WtSkthtisi6I6qKGOkOWR08nuqFbYGVbXgEFkJ+frY8pLzyN1qnMxOqV9pZYAq3R6gCcoIvpw3Yhst0Y1w8GPTiv7JR/pVVf0R7R2dZunm7Yn42xb+fd1JZYyG7mTJkvu750HGBDl/73heFwKkvDvgo+PqBOqiUk8vDQUGSo7FG3nZUTb4aJBA28d/cQA1GcYBVkVAW9Kr/x9oe99p7qGaFn5bvJ+QXpcWoBA9h63M118n7KNVC8Qs2jVKYgfPSauLG8ziCkDQfr76zhRsfYI43GlDv4pJnyIgT5lilGL2f39gZ1psf0sq0pM2Yx9+ic5S0rsOT9WnTNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5411b23-2c2a-b771-c2c6-00b0f2a7a033@suse.com>
Date: Tue, 28 Mar 2023 12:14:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 08/12] xen/physinfo: encode Arm SVE vector length in
 arch_capabilities
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-9-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230327105944.1360856-9-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::7) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAWPR04MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c75164-afd1-48db-a247-08db2f75488c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9miS//vl2TQiQmec3V2KBKEjJjIzT6fT1XvxsgyQbuaiczI9rEsPujEHS23GUHYQP7dk1W1QSdMjp3ARqpleGhV87UH+0NUOsQL2D2DnYc9sT/QgZ9MJ/M5p2UFsCEUZKw+mSbsjo+WXQyxUH3mCFeudnA29nJQmBTd2FgotGY24+cJlsO1pNeDrfsveDkrg6rKBeV9e7kiKynZZXJYG6iXtkXyohc70HrDmY41R7ypZl7X9pfK8XGmEdNkRMiKKGDOFgpt1jQgMZGJOaee3G6E4ksO+i9F47CsWr0RaCbjTfK8vDTGIkvFx1Rz1T0pAEQKnQWmmiP9LP9gbeMGujSgOfmsvqGmAslH5sS4Bh9aq/nfonVkbYR0QmfWfO4nmqPOSWinkRt8a0L8hHKmdUtOiuT9+TyjEPPch7EJssUyF6U0shaM0dqlkJvSWSVRh7sz0Ww/jWbAOr0VFIeflObOJhF8eIOdBuZQkWDZdZdSyK9b8FAmam6xawWOTWbQWVKxfBgBWk40ONNTcNT/+ADj/ce8/W8wR8nTpLs+i7NL1v0sSiNoW23gQ/8csKqLvwNhHNXbOaOQEx/Bf3A6bbY9jTkagsJlUF5F1iogoJ7P1cPbg6CB9s0iYOsnFAZ+VXvZhDQicvtq0Z2Kao8oUAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(26005)(6506007)(6512007)(53546011)(6486002)(6916009)(31686004)(316002)(54906003)(478600001)(186003)(66556008)(66476007)(66946007)(8676002)(2616005)(41300700001)(8936002)(4326008)(7416002)(5660300002)(2906002)(38100700002)(86362001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWp2UVZoSmoxUitYd2FhWGowTXdLOUdxSFR5N2gySklzYjk3ZWdOaGRNVllt?=
 =?utf-8?B?eXNJakVmSE5jaG51UU12MUlUWmhYSUVORU9HWW9ncVFIZ1V4Z3hTZ0JlY09t?=
 =?utf-8?B?VmM2azQ5dENqVlFFeFdUNEl3cU5zckRxaHErdDhCQlJRcjJEVC9sd0hCQmNU?=
 =?utf-8?B?QW1jT0xkWmRvay94dkR0MVNBZWJ3TklGU3hFMXJ0ZkhRbzNERVl1aVVGSXZv?=
 =?utf-8?B?a1l5cXZhbDhMakhOQ2xKK205c21OQ0wxelFvY0NBL0lGR3dyY2t0cnlaWlRJ?=
 =?utf-8?B?Q2lSS1YwZzN4MWFNWVNXdk9iOWg4RGNHNk54ZUxGdUNtUDNKZDR6ZmFnSGEy?=
 =?utf-8?B?dVBVQ1B3eGs2NnZiTFhtYjJZbFZJeEIxanErWkw2dUlsR0dsNEFkR2VZUkgy?=
 =?utf-8?B?cThPUVhpTTVHcTlaR1ZSVTFmNjBwMzBrRFBpcUE2Wi80ZjFLdkRPbDN2emFE?=
 =?utf-8?B?QVVJeDNldTN5NE1makxGK2NKK0hjY0pJTmFKekc0MjdxUUY4SmMyS0hDMVQx?=
 =?utf-8?B?aGJCSlRBOGhMUUhBMVhmS05SY1FlZi9oMVlob2JmazNXNVRRYTR4bE5SdE1t?=
 =?utf-8?B?REd5RG1JLzlUOVFMQkh0RUZJOTZzdEpNWXAveUZQRnA4emRTZWhHekxWZjND?=
 =?utf-8?B?VWZ2SzZBRnN3RUJDZnhyVFhTaGsrb1JYcjhWc3g3cmhBb1NCMU1jYUMvYmcv?=
 =?utf-8?B?d09LM0pZOW40N2o4VkZrWEVBL1pBK0E3WWNhQVNyN1NOMW5EazM5RXpnTkZO?=
 =?utf-8?B?U3dtVDJKeFJMblV0OTA5SkVJQzhETmFNeXBabm1tUGdrODhXWWhaMVk2bTFy?=
 =?utf-8?B?bk56LzBJdGt1Y1Avb3JTR0lxVmptWWZ4Vnhqc2dQbWE2aEd0cTVYeHBVT0tL?=
 =?utf-8?B?bXQzQ2x1Q3JWUEI4Q0E3c3dvZnFkYVVVSFl1Qk0wRFBoMCtGR3J3aVlzM0Qx?=
 =?utf-8?B?UlZSSTlPMWdhY3NldXZERm1FcVRVL1dxZGd1MkdqdGtCRTJpblNhUnZISHZa?=
 =?utf-8?B?MjR1UVp4TSs3Y1dpN0FrWG9WMUk1NHo0dXpLaERxa2txVHRtMkFtVWduQ1Jr?=
 =?utf-8?B?RTJwQXFCK01kSzNEL3RnME1VWWFPV2hrVU5BUTU3SlBSUmFhUHJBSGZlMjkz?=
 =?utf-8?B?bnN4SDN3U0luamJLOVdndDA3dFBYZUo0YVJpaThLek9Mem9ERHhwQ1pOZC9L?=
 =?utf-8?B?M3dNTW9YSXlNUXZyMldRbXFkZWl1M1ovV3lQenNnZGlVR2ttM2Zjb1JaTUJQ?=
 =?utf-8?B?NE9HcGgwUzk0MmFwQnNtaE05UGtzMWlxUE51N3pGZ2hDbVNYeW94OU15eFh6?=
 =?utf-8?B?SnpqOVNuai9yRUJzTmxaNUFvMWZyb2tzVXpXLzVyRUFEeDJaQzlzMktaZ2JD?=
 =?utf-8?B?Y3FRZjJGUldSRkJGaXpjTWpZZmZrUEdYUHh1ejYzbkxGMnZmWU00bFNpNWxS?=
 =?utf-8?B?VnlTWWY2dDJTWUtENkVxS0dUbGRsT0ZJVU5wdXgvRE94dWJ6bys2WW15Y1Rr?=
 =?utf-8?B?bUg2M2lNNW5mT3NXdU14dzlLR0k2STZHS1B5TWR4OUJxT2Y2bWl2Y21lSCty?=
 =?utf-8?B?Tk8rZFBuMlJNR09ReWsyd3hWeTN3SW1wNGQ1WXV4UUd1dnFwZWdSMFZxVUFq?=
 =?utf-8?B?cENYb3pCZFA1KzR0c1FvWlNEenJPYjRaL05McDR6Q1pueWxUcVpmUWZwSVEz?=
 =?utf-8?B?V0hLTW56QUJaR1Rib25Tei96d3hneE0wNEZWL0ttd2QreGFKRUhtcFA2MG5a?=
 =?utf-8?B?dzJWYzdsSDU5OEdkdUl5bkxyUnc0eFdvRFl1UzFCNXZzZGlBSHBxMXdwenlx?=
 =?utf-8?B?YldCSlFYam9aK3dkczZZUWxPWWpndzQ5TEplSnhvRWpBRzQ3NkRVM2o0OTlk?=
 =?utf-8?B?TjRHL1hVdGt4dGhHellUQWREckNyOG9qK2xDU2FtVkVKeWZvQXpBem1MS3Mz?=
 =?utf-8?B?TzBpak1ObDNDTDFJelRDb1l0aXY1cWxxVEtDNWtWTi9DUWFnckxlMDF1RlZN?=
 =?utf-8?B?VnFjUElQRTg4dzlmOXpmT0NQNE1pY08wRGNDTE1EQ3VwYjhZeVVwYVFNbDkr?=
 =?utf-8?B?c3hFT1lvRmU4ekw5ZHdmTTVRN1pwak55T21IVnZtODliWk5SQkdsbWJEOUU4?=
 =?utf-8?Q?SP4IVbWia/I93e3ev4cJsGkBn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c75164-afd1-48db-a247-08db2f75488c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 10:14:58.1760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2DR1tA9B5qZWY20fYTiavTil5Z8ZD5DcTbkF1KBFr5oaQ9K4yYQEr2JPjx/ljc1vZhdwYS+j20k9ukRC03YOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9743

On 27.03.2023 12:59, Luca Fancellu wrote:
> --- a/xen/arch/arm/arm64/sve.c
> +++ b/xen/arch/arm/arm64/sve.c
> @@ -124,3 +124,15 @@ int __init sve_parse_dom0_param(const char *str_begin, const char *str_end)
>  {
>      return parse_integer("sve", str_begin, str_end, (int*)&opt_dom0_sve);
>  }
> +
> +void sve_arch_cap_physinfo(uint32_t *arch_capabilities)
> +{
> +    if ( cpu_has_sve )
> +    {
> +        /* Vector length is divided by 128 to save some space */
> +        uint32_t sve_vl = MASK_INSR(sve_encode_vl(get_sys_vl_len()),
> +                                    XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
> +
> +        *arch_capabilities |= sve_vl;
> +    }
> +}

I'm again wondering why a separate function is needed, when everything
that's needed is ...

> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -11,11 +11,14 @@
>  #include <xen/lib.h>
>  #include <xen/errno.h>
>  #include <xen/hypercall.h>
> +#include <asm/arm64/sve.h>

... becoming available here for use ...

>  #include <public/sysctl.h>
>  
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
>      pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
> +
> +    sve_arch_cap_physinfo(&pi->arch_capabilities);

... here. That would be even more so if, like suggested before,
get_sys_vl_len() returned 0 when !cpu_has_sve.

Jan

