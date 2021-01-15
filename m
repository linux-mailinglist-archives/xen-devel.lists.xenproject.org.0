Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0182F7E78
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:45:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68193.122049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QLh-0003t2-7Z; Fri, 15 Jan 2021 14:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68193.122049; Fri, 15 Jan 2021 14:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QLh-0003sd-3l; Fri, 15 Jan 2021 14:45:13 +0000
Received: by outflank-mailman (input) for mailman id 68193;
 Fri, 15 Jan 2021 14:45:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0QLf-0003sX-CS
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:45:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c758c4ed-fbe0-4602-981b-ccf349fae047;
 Fri, 15 Jan 2021 14:45:10 +0000 (UTC)
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
X-Inumbo-ID: c758c4ed-fbe0-4602-981b-ccf349fae047
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610721910;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7vEQenzw/Z/8c2SyDnitGfXrmZmxzaVyyfdMqR5qfLI=;
  b=MyaQI6X2Z8GASD0R9aMm6evLre8eOObJ+Cu1utaJxUiMw7XltaaZQyOe
   DT8rdfzqLTXavQ17ReC1XgdJXg1A+EqGTl8juMuXZFg2q/7GmbndRnmEO
   xx6mfl5qFMI41Vf2AgtJTlWAj2b6d3SLSBacvvjjKiDEP19IMH3o1UVIY
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aLbfK7uBhS3tmIgDdelH0TMK/WkE5N7JDkpgFAbKS8XlCw63mDvJ6LkdTKwIUEHmzS1m5ZTsrW
 LC6TfYmRqVZptU2vUgCluofCO9NcT5XLm+QfZ7d67DMqbkHwm0pBRrleLhFV+PlRtm//n+IuHy
 Tn5IjqDgv6oDdvE4zjoPyCWaquVfml3SsHcy3Q+eDa3RbOuDf9G6C1VIpKWUBBbgDB76Z/j189
 /QDxHV43nOxaeSZ0B72i/0DOv1mpsBh4ks9d3SUOqdHblu8/eqw7xjoYvczi5LGJDYoqhfLRoN
 kmA=
X-SBRS: 5.2
X-MesageID: 35394672
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35394672"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxrqvfFmd29mRT3MRaFCF3xkXj7Sm5Y8haV1fz59582MfAVDo6Uge2XekrHW8FKmsGeQxX7WAE+Yy8gsbBLpTiCzf9Z5gpWP1rlk35z3bOoRvPfqC7Oboy+2Z5SZ2CbQFyE4IaV9ju/oPajgWKMz1NPMC0EpyIeFXtkmzuNw0ngVJOocwqVhyRiUF/fam3nAs6T4ph56Cl9GixHlq8zCfezIIoQ3gs1pFp31JJkEuO1SvsRF9zt37oeYGAWMYS6TodRDDedhXA3USDUs2waJsAU6o+Zo8cHoIpAzEhJ2p4oVsY3Vep3WIoIVdmtMMculy2Y9PsEjF23ZqDHu1Psuaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+VNrWUUJrfI88YjQ6QPzYKtCui8xfuEz+DxE+Q95Dc=;
 b=Qizs5/qJzdzGdsSWn251I4i3Zqp789VGDomd2zlgXDMzvNB7yUAY0WePs5Zyj8EdK3JqoE6ek1Xmj8CUYGaws9zE4cAn/iFH9/PUloRWkPUSNmh5/b3ff2xG0XLycJrAWLv5N5kWwjpV6OYtZ5xjvOVMTsB/bubyIV6QT9cAj1pcvK30vi+H7yNj85Ost7GMxn5Jcru8NFyg46JVn1e48ed12r+QLcmnQZQxkJw3de7IhuUV2lFAxvCxI52jnrAvkQxZpweOkQl0wrZ43t1FbOuDA4sgEQqYDtkYR3qV4ConT+h/ZxlZA+PSjQWgGOOHtOxJWpw5WpjkKudr8NcYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+VNrWUUJrfI88YjQ6QPzYKtCui8xfuEz+DxE+Q95Dc=;
 b=DD1GWk9aobBYLyaAu87h+gboqlhTHYCKExG7cM71vAC2DkSoQ+tuFMJ4i9Gmmf27AuZo3qPNvOvFs3Z62ff8NWr7NFnE67TnMCAza32/HrexmLpDUog14uAaWZ7QZdSo330wm/NrwkyzZAGWur0tR1/snJ5fuc4oNsn53AyDFjM=
Subject: Re: [PATCH] x86/vmx: Remove IO bitmap from minimal VMX requirements
To: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
	<xen-devel@lists.xenproject.org>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <570e73b83c18cce4dbe4c70cc14b6df7c33f0502.1610720991.git.hubert.jasudowicz@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9f0e30ea-62eb-fd04-2727-94739604e0f2@citrix.com>
Date: Fri, 15 Jan 2021 14:44:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <570e73b83c18cce4dbe4c70cc14b6df7c33f0502.1610720991.git.hubert.jasudowicz@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0093.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::8) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 166f5ad9-bd5a-49e7-eecb-08d8b9642453
X-MS-TrafficTypeDiagnostic: BYAPR03MB4583:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB45837A678026AD9622D738E2BAA70@BYAPR03MB4583.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A2zTVoeSEGW7HfrXt8ijvJj+kFgDjpgTETu0jNqzHrRm+3wR+9SztQtO6wUq1ceHDQJdHTA1QH7XYtMqmGaO5NNIszICnSiQD2FhG9CW3e0AGVeb6PT1tyKGHD/T0iXgJ9oukkxgb8WmKnF+khMmlh0zkwTrIFnT83GBXKJ2/rpTVEDE3YTPD80oR4Zb/8YWJ9aRGdk1B1c4dApTdRXfIHPtitq3bc2ytOgZqwi9rkwMrhOlNegu9e2goW0L+/rc0IfpGHoh8ZkM4mkD+UAmHInXHtcg2vRqE5pfn+RKAWXLuonYQA4nr7vBSquFIfvjLTmp6yWXj1q1B+j6A/hp15DgrIgFoI9KgtQ0J8ZmunKGQNCYeX/NUaZw9gHbcLhall+l7ZAoJBNbjS+ObyU0WDpA537TgZbrBDM8nmc+KVq5+HM0gEThpEY/mkQ6tSk1u12o2L1anacPDUeAj9FIutpR/zSD8lxA1uJ9lLo2vHqZZ1F3q2SAsyB+0MeyRZfMqhvKv4YXzosd0fo3GcaIzg9tMhy/rVO3XWUS54rUpgjBrJiC0tPp76BpIlmx8rKKFQtEKKpUeUDbZbprTH4sRb19JHRASgAcxgCCC5V+6LV8hug9zT5QJKiaSqajw7Wpz0jM8yO9KkKkiwFzV2FZ721nDMQBMzcwIZjcFvWk8UeEdEjhKEAG4lBxNHXq3olQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(8936002)(53546011)(186003)(83380400001)(6666004)(86362001)(31686004)(2616005)(4326008)(316002)(956004)(36756003)(66946007)(26005)(966005)(8676002)(66556008)(66476007)(478600001)(16576012)(54906003)(5660300002)(16526019)(6486002)(2906002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?THlXcHJWa29BRkkyL3NWYU5VZm1Kc2pjWkhxM2pLeUlIeDJFdFdaaEV2ZmZ6?=
 =?utf-8?B?Q3RTMVdKcWlhK2F6bUp6T3N1M1N0UmpFK2NVQXk4ZTlOL2Nnb3hzdUVnSDJV?=
 =?utf-8?B?eXZWNTArOGtkSSs1aENBanJZTXIrbXFLWlVCcXRCdTNsTG83d3hHb1pvWGlj?=
 =?utf-8?B?QlhCY3dVbEpMSWVMUHBrNVdYUU02NnpQNmRTK2tvbm05a3ViUjZXV3BDUVJm?=
 =?utf-8?B?Y3pJMHRVOWhpT2M2Y0pUeDVEd2orWjFMaExuSHkwelFiVGhUSWpzS001QjZv?=
 =?utf-8?B?VHdUaDhsZ0tqTkZiUUI3OGEyMkZDRWZvWWVnMkZlT3lWMi96czVQQkE1WFlU?=
 =?utf-8?B?aGdaQVRJYzZZb3BpaXJ5OEhJOEdHaXJYVi9TRkhOZkZFam81SU8zdlIrS1VW?=
 =?utf-8?B?OGpIdjBIZlRDS1VlU2pOUEhsQmU0QXZVVGVRcituOStXeTlLbWpFdldNYnVG?=
 =?utf-8?B?SXZWcmlmNjdJOGxORWhGQ0RWZHFnWkNia3kvYnlFcm5KZUFZQnZyM3FIRUh1?=
 =?utf-8?B?Mlk4Mkhaa2pEZ1hsYnZmdTlGSUQ1T1cwS0YzKzVYenU5MHJWVngrb25SbUpS?=
 =?utf-8?B?NDFndmdyNU9NMkgrV2FwOXJjK3pCcTZDZjlSRkprc0VJWGNEUktSY2J3aGxN?=
 =?utf-8?B?QzRyVGp6b1FKLzV4YllWY2hKSm1YRGhKVSsxeVVUZkhRQlBwUnZiNktjOXJ2?=
 =?utf-8?B?eG95b2lpNmZsaEZIc3Z6NWlHQWhKMVJFKzFkQnhmZTdEZVljYThtOGZsODU5?=
 =?utf-8?B?YWxiR0RCcUFqVFlPVkZyTWMzN2YwUXIyd2pUelVCcVdXY0FvaHZKZXY1TURW?=
 =?utf-8?B?bHJqY2hsR0pMWm1wTWtQSHdmWUhwVFRoSERwZnNpNzc1NXdxUCtXZVk3Z3Yy?=
 =?utf-8?B?MW1qVi9VcmJNaGZKRHFaSDVNOVlrTXZkWEdIZWZNUHJKbUI0Qk9HUlF3cG1D?=
 =?utf-8?B?Z1FENjFYMlMrcmtpN3FzcnhHZlFxMVAwL2tudDlZYVROTXNKUVFCK1hWWlkv?=
 =?utf-8?B?b1kwd1k0TDZNL3BoVkNtdE4vV2ZPTHpIenF0VkNkWkVjTk9TMWZvQTgwUEdP?=
 =?utf-8?B?ZVFzRWt1WW9aOFRKd0ptZTI3dnpXT1BMQXl4QVZ5NzlmZjVjRjhXVkdyZUZ0?=
 =?utf-8?B?YXRkSkp1WWN1SVQxOGgybFpiandCMkx4Q2FBaW02dUlOYTMrVzNHc0ljSGdD?=
 =?utf-8?B?U2dmSmtpNGxuRlhJeUh3R0dHZzZuTmJOTnJHQ1U2dkloTm9sOUwzZkxYQUln?=
 =?utf-8?B?b3RLSWFLNXhzY3VxQ0hYNmdlSW15bTE0UnJ6NjFNSGwzWEVCWUowT2JNaGFF?=
 =?utf-8?Q?etNMWUZeB78511Jp8zEszB8hyP3tGr9O0W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 166f5ad9-bd5a-49e7-eecb-08d8b9642453
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 14:45:03.3371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ni8fL5U9mAKQVLp4OYyve5NP6rxrNMrxvvFtFi5Y4HqOpo4UQ6PUJEtIy+9+fhR94ARWIUkulbbtivpQigKvl7hBZJA7P558ZkoTxGrW9u4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4583
X-OriginatorOrg: citrix.com

On 15/01/2021 14:30, Hubert Jasudowicz wrote:
> This patch is a result of a downstream bug report[1]. Xen fails to
> create a HVM domain while running under VMware Fusion 12.1.0 on
> a modern Intel Core i9 CPU:
>
> (XEN) VMX: CPU0 has insufficient CPU-Based Exec Control (b5b9fffe; requires 2299968c)
> (XEN) VMX: failed to initialise.
>
> It seems that Apple hypervisor API doesn't support this feature[2].
>
> Move this bit from minimal required features to optional.
>
> [1] https://github.com/CERT-Polska/drakvuf-sandbox/issues/418
> [2] https://developer.apple.com/documentation/hypervisor/cpu_based_io_bitmaps
>
> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>

For others reviewing, this was my suggestion to fix it.

The IO port bitmap is only used as a performance optimisation for legacy
BIOS code using port 0x80/0xed for IO delays, which isn't a good enough
reason for the feature to be mandatory.

Nested virt like this is primarily used for ease of development.  The
VMExit IO path should DTRT, even for a PVH dom0.

> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index 164535f8f0..bad4d6e206 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -1168,8 +1168,10 @@ static int construct_vmcs(struct vcpu *v)
>      }
>  
>      /* I/O access bitmap. */
> -    __vmwrite(IO_BITMAP_A, __pa(d->arch.hvm.io_bitmap));
> -    __vmwrite(IO_BITMAP_B, __pa(d->arch.hvm.io_bitmap) + PAGE_SIZE);
> +    if ( cpu_has_vmx_io_bitmap ) {

Brace on newline.  Can be fixed on commit - no need to resend just for this.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew

> +        __vmwrite(IO_BITMAP_A, __pa(d->arch.hvm.io_bitmap));
> +        __vmwrite(IO_BITMAP_B, __pa(d->arch.hvm.io_bitmap) + PAGE_SIZE);
> +    }
>  
>      if ( cpu_has_vmx_virtual_intr_delivery )
>      {
>


