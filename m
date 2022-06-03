Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6666653CA37
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 14:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341489.566714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx6kf-0002Rs-L0; Fri, 03 Jun 2022 12:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341489.566714; Fri, 03 Jun 2022 12:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx6kf-0002N5-Hf; Fri, 03 Jun 2022 12:50:05 +0000
Received: by outflank-mailman (input) for mailman id 341489;
 Fri, 03 Jun 2022 12:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MD4n=WK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nx6kd-00020s-L2
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 12:50:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aedbfe11-e33b-11ec-bd2c-47488cf2e6aa;
 Fri, 03 Jun 2022 14:50:02 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-wN2GYYO6Okuko51Vraw2IQ-1; Fri, 03 Jun 2022 14:49:58 +0200
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by HE1PR0401MB2361.eurprd04.prod.outlook.com (2603:10a6:3:27::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 3 Jun
 2022 12:49:56 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b%5]) with mapi id 15.20.5314.013; Fri, 3 Jun 2022
 12:49:56 +0000
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
X-Inumbo-ID: aedbfe11-e33b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654260601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cYPWkSKycOf0YUDd120qlDhf1HGkNEEQOEaXgbeQNRA=;
	b=helhaWjp6/dS5+pb2NNRklWXc/OIpaHL0PPU2amVjP9VmbCXw7hlKdOCd8FMhl8ZRMjZ6j
	7J0TWqwVhXUKUDHs1s0Ou8pjyG1kNxjWrAcNNx2qpDDE6FEK9MkcGLJzcr+SoxUxF6OQXW
	yDrii1V/p/DP7E66EBNsJXm/3zNjF9Q=
X-MC-Unique: wN2GYYO6Okuko51Vraw2IQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHrBL/IDpwSSwB9PCfwqcKrFlgae3uWpE3d19JXcXhde4mciquMY+RHw65cD4bGDOGJMoc0ERx/wz1DIwq2O5auYqkBd5N8VeTFoG6LhBdg2DaDQGWiHXJpsNG6GMDyRmiVWmeYayW4U0z9SdoxffnK5+177NZEffIuv4SJM5/AQ2S6JvIRq3LnPOeNhaSuQo07Ic9Pe61s0+wJyyzO+aFRi7mXJ5kqtt3kpk05MOYuP+Hj+jmaBAzGhRXA1cn1ITh2+lFai3xkjzvAbn77BV5TGbo18DGgQIiSoYHxAXz2SpvWfGY7dfyQL/F3G/AcBI6/gyLks4MUceUYXimNptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enAcfvQGdHV1UXZB953itue6Ttn22yaOfRMciV9J9uQ=;
 b=bhBcLlN7nJaYiz97rfdZTTxVjR6tHypLlhbimyj4AxaW6GqK5BbyC1IXURrGsci6rAFbdo/eWVvC0q2oSbAF1906zMEt19rpEtioVSTxChcNfGxgKtuZwbdx/X0Nwhy+gjeSn765Zyahaw/QGkXt6ALjZwm/QHaR8c7M3+sVKvIcOQXmTR928LSNVJRVdKV7fXSCZ8+S16sqG99/ZvrDufEbt/lDFjnx2TVoiCDUPkUMpUe3cMSuFudxCCjBQu9ZCBpDkJ0fAZBFQ1m3NsICcRqf8JydpMami8Fi2s8LIdwsboMt1rvEeihFjxQqlE1fS2lhzIxZFmNKkaS2Eb8xZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6fa93f8c-9336-331a-75c1-7e815d96ff49@suse.com>
Date: Fri, 3 Jun 2022 14:49:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/3] x86/vmx: implement Notify VM Exit
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220526111157.24479-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0050.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::27) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a43c38d-3c65-4745-1473-08da455f8fc5
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2361:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB23615DA6AAFA8FB7F0BE068BB3A19@HE1PR0401MB2361.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TWXQXYAAuQM/GjHq+EJJaLEb4UU+dgvSsOnEI8AXoyBsBPAg6HBO4mCyqje4IlynNmu8SZ79rchdootNLo8vhrg8HUVoueutinKAU5PEKslAW3i3pI58luLJ+pmtbKB5U0h75+l3aS5pIF9isvFXn1VuIqBL/YU8yFE5kVm8Gjv+8EVAP1m7Dhzl9o04JReCDYPHMgEOqeMDREWeCgy3OoxmnWig/ublZeEB082TzJ5Ee6cxbYoSVBIZz9eI3We6nM1LwWmZsmM+aZ0GdhhQlRlxhzP3NRPv2qwwL42OJ+4jdMO6l/BuwoGVo1VDOSnViqtsoDEBBtGWIGf6yJu/XXnsDGuSkAqoCOuWdPlucNDfPM2Q/QARqlJgxLDLl093VB1WlWUhP3k8uK6PHszKpxVq/9AyUXW+9LlTxhHbGD0cCJiOwsmg9Rn4/cYuZ0NhU7sNAOOx700Y2AbYTjFZEWsgk/Q9h6lzyGcr6CMyrXWky0/j9fQS2P/2GjYF41dAMJxgsLuk7AnCqL3pY6iP9lBteaZtvsLOfGeqRUQ0A8TEUkZ0X4phKdTq7hxAEdcMXn71lEQQMoYJq7ngkAR8ap+zFltZWN4GUMOQv/ML2BOM07maTsN9PyhewGC5fqHKx9P9R0wvw3e+2kcd27IKqtEf2HBNiwVo0M8fin7S2CdmJrTX+R8+iBGZW1h655Tr2elryf6Haw1H3CQG7mtTbDnchLSq6b8u0URqKXG9To4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(26005)(6512007)(5660300002)(66476007)(508600001)(8936002)(2906002)(6506007)(83380400001)(2616005)(86362001)(31696002)(186003)(6486002)(54906003)(6916009)(38100700002)(66946007)(4326008)(316002)(31686004)(36756003)(8676002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gXnrO4i1PLuMq4ePOG2jvzAsIC1IJoLAZPecy4AdQpOzX9vY/yBAMC4FRyZh?=
 =?us-ascii?Q?/mtBE8hHzI9g+gjqDMe1wraa4AwajKKFZTMHg7wRyiXgnRPXbQFodK8bcTRl?=
 =?us-ascii?Q?pRacHv5L3N007pFme7vEsayBGniHvIDmjyyJzAYNT1t6IZyiQUxqOdMZhV/1?=
 =?us-ascii?Q?EMbyCghh1OJ1hLdhgI+njL7DS5WSTtE4asPu2cJtod2FbHdBTrXndMTgr7nB?=
 =?us-ascii?Q?p+IkXe3UGNRNZI+az8OInamkvClirsy6EB+87mUtrx+S9z1EKxOulAiml0VY?=
 =?us-ascii?Q?99UbFUo/LbAILQ3spOLbb/MOgkfIw6aDn+wvSMhUBxnPROe/VdDfMiFVK7dP?=
 =?us-ascii?Q?HyibClGr+UYzEDnTrToxaKjOKSY4lFP8a1BsUVrU3vA5PpazGp47p82Tl88o?=
 =?us-ascii?Q?mRfYb33fm7QN+f2gbFCqTtYKBpWKDiS5pGMjHqL7Wy4YPprkieGFRFuD8OQ5?=
 =?us-ascii?Q?QbJwVc+Wq4r/DSxGFnx5gnozj1tfd2MaHaTyBykEnylkD+VwpuvA+GwIpiSH?=
 =?us-ascii?Q?gTh0oRWlgXQ5GWXEZ2N/h6vzl/sskN9JW/x5c4Ec1i7odM2OoVtzCnjD8XF1?=
 =?us-ascii?Q?5c2ZLYvcWPIz0hTIYr9To68tCH3zgoitx33GhNU32pVN/IqrV43p+7vNhP/8?=
 =?us-ascii?Q?1OeZmbJeR+nZ9FpcXGqaapIIEvf5PaQYnTbzrLc6LXlVSbscq5LsQpjyquDW?=
 =?us-ascii?Q?IS/4lcAZYDPFZD+oH0ciSZPCaopEYLs4zkaDwb/Zfc0CkYeLtHN6enacFZSZ?=
 =?us-ascii?Q?o0//MzalighQHFmYX8s4pfZdjjMjAVVuJuiwtKtbnQbu0f6IMvyTxG1FDLBe?=
 =?us-ascii?Q?QxSRLPtUzVBfKgtGpvKRY4eRGfN/1IxA7TBuZtdDN05yVNbg2NG8e6lACfTd?=
 =?us-ascii?Q?Zo2jkMmYETwadM7EdCWVwBpYlDL9fjLXVswKlMUYYT4GhcWDyCUZssQ9C5eC?=
 =?us-ascii?Q?Sod4KNRQ4UtG0sgz9r5NY9MbucCrfmnWjdB1TKXvpi2QCxqt/6SdwlJtNS1Y?=
 =?us-ascii?Q?zoSVx+5fj66m7vKKWRXqUenv1hKvAZbA9DTS1jOhTHh0XsNuuDTZ2HTyQ19X?=
 =?us-ascii?Q?ivoXS840aBKeWwnHGrUU9yvjVQQ0cVKrwU/mfVd5JBgdpK+fdw/U2k4hd3yu?=
 =?us-ascii?Q?SzMZ4LrM4IO+Q/TIdROhnn1aQBCq+XE1nI3buQx2iTqQLah3xzqFzFwfg4LK?=
 =?us-ascii?Q?wl8SYaOwjDfx6fMeji2zPXxXehH0zWCxWalRU0Oa/BISM5sCXfOvsqLGzFT5?=
 =?us-ascii?Q?b3S7Ghsxu0tejEqWPwsg636FDx9Pkxd4U9X9+SyqRp76LMy84rDnGirgoq3z?=
 =?us-ascii?Q?vpuxhVU3himN3Kfu0KmfiFPKmTJXmRs9r3m+4KUnp8XA+OfMMUv01J6OTZvb?=
 =?us-ascii?Q?egIIV2laJH978SvPr81zjk4/iG9Mu4UsmC7mztEabKp8pze0tAumISDgEq0R?=
 =?us-ascii?Q?7P5xGBgBVn4CF1tne4lU+2daRsOT+C1VGm77HhovVkT52prK8UB1Rt4pzQzk?=
 =?us-ascii?Q?nSV8uHWbxw420PU7QwiBJqzRq2lxP5BzW4eVqM6FWxsUFc7UueXWkQuoobuh?=
 =?us-ascii?Q?BE47DR0qyWibGAHuirtBsHlGyJrg14dRfihag6hzIwxxLPG+m3Khe7NLyMSq?=
 =?us-ascii?Q?4jJW/79RSwW7SdXaJW2DGQjE9o4rW0sutiXC+CVpKqrJzVIVMLk0j4Xfduf8?=
 =?us-ascii?Q?+lbOmOtZI9FkO5zgZ4mOilxAQuuIDfQC1G5IwmwsZp8OOmA0sjtcl4bCmT2n?=
 =?us-ascii?Q?0eaDlCP1PA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a43c38d-3c65-4745-1473-08da455f8fc5
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 12:49:56.3551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZUozTMvu95uVG7gVjxoYr5E5kFgn3QAx7WS3SW/g0XcDUeUQrg7OCDRugRu1VOseJC3YAPKqWvwHWRunMJH3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2361

On 26.05.2022 13:11, Roger Pau Monne wrote:
> Under certain conditions guests can get the CPU stuck in an unbounded
> loop without the possibility of an interrupt window to occur on
> instruction boundary.  This was the case with the scenarios described
> in XSA-156.
>=20
> Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
> if no interrupt window occurs for a specified amount of time.  Note
> that using the Notify VM Exit avoids having to trap #AC and #DB
> exceptions, as Xen is guaranteed to get a VM Exit even if the guest
> puts the CPU in a loop without an interrupt window, as such disable
> the intercepts if the feature is available and enabled.
>=20
> Setting the notify VM exit window to 0 is safe because there's a
> threshold added by the hardware in order to have a sane window value.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Properly update debug state when using notify VM exit.
>  - Reword commit message.
> ---
> This change enables the notify VM exit by default, KVM however doesn't
> seem to enable it by default, and there's the following note in the
> commit message:
>=20
> "- There's a possibility, however small, that a notify VM exit happens
>    with VM_CONTEXT_INVALID set in exit qualification. In this case, the
>    vcpu can no longer run. To avoid killing a well-behaved guest, set
>    notify window as -1 to disable this feature by default."
>=20
> It's not obviously clear to me whether the comment was meant to be:
> "There's a possibility, however small, that a notify VM exit _wrongly_
> happens with VM_CONTEXT_INVALID".
>=20
> It's also not clear whether such wrong hardware behavior only affects
> a specific set of hardware, in a way that we could avoid enabling
> notify VM exit there.
>=20
> There's a discussion in one of the Linux patches that 128K might be
> the safer value in order to prevent false positives, but I have no
> formal confirmation about this.  Maybe our Intel maintainers can
> provide some more feedback on a suitable notify VM exit window
> value.

This certainly wants sorting one way or another before I, for one,
would consider giving an R-b here.

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -67,6 +67,9 @@ integer_param("ple_gap", ple_gap);
>  static unsigned int __read_mostly ple_window =3D 4096;
>  integer_param("ple_window", ple_window);
> =20
> +static unsigned int __ro_after_init vm_notify_window;
> +integer_param("vm-notify-window", vm_notify_window);

Could even be a runtime param, I guess. Albeit I realize this would
complicate things further down.

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -1419,10 +1419,19 @@ static void cf_check vmx_update_host_cr3(struct v=
cpu *v)
> =20
>  void vmx_update_debug_state(struct vcpu *v)
>  {
> +    unsigned int mask =3D 1u << TRAP_int3;
> +
> +    if ( !cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )

I'm puzzled by the lack of symmetry between this and ...

> +        /*
> +         * Only allow toggling TRAP_debug if notify VM exit is enabled, =
as
> +         * unconditionally setting TRAP_debug is part of the XSA-156 fix=
.
> +         */
> +        mask |=3D 1u << TRAP_debug;
> +
>      if ( v->arch.hvm.debug_state_latch )
> -        v->arch.hvm.vmx.exception_bitmap |=3D 1U << TRAP_int3;
> +        v->arch.hvm.vmx.exception_bitmap |=3D mask;
>      else
> -        v->arch.hvm.vmx.exception_bitmap &=3D ~(1U << TRAP_int3);
> +        v->arch.hvm.vmx.exception_bitmap &=3D ~mask;
> =20
>      vmx_vmcs_enter(v);
>      vmx_update_exception_bitmap(v);
> @@ -4155,6 +4164,9 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>          switch ( vector )
>          {
>          case TRAP_debug:
> +            if ( cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exit=
ing )
> +                goto exit_and_crash;

... this condition. Shouldn't one be the inverse of the other (and
then it's the one down here which wants adjusting)?

> @@ -126,5 +126,6 @@ PERFCOUNTER(realmode_exits,      "vmexits from realmo=
de")
>  PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
> =20
>  PERFCOUNTER(buslock, "Bus Locks Detected")
> +PERFCOUNTER(vmnotify_crash, "domains crashed by Notify VM Exit")

I think the text is not entirely correct and would want to be
"domain crashes by ...". Multiple vCPU-s of a single domain can
experience this in parallel (granted this would require "good"
timing).

Jan


