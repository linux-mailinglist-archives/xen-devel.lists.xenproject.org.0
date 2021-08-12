Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133243EAAC7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 21:18:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166566.304014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEGDo-0005r8-2z; Thu, 12 Aug 2021 19:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166566.304014; Thu, 12 Aug 2021 19:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEGDn-0005oD-W9; Thu, 12 Aug 2021 19:18:31 +0000
Received: by outflank-mailman (input) for mailman id 166566;
 Thu, 12 Aug 2021 19:18:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rsMc=ND=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mEGDm-0005o7-Ls
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 19:18:30 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c2dedbc-c910-42ac-b137-2ee558ecfd41;
 Thu, 12 Aug 2021 19:18:28 +0000 (UTC)
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
X-Inumbo-ID: 3c2dedbc-c910-42ac-b137-2ee558ecfd41
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628795908;
  h=to:references:cc:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=E3inFrKOeHXXutYvPOd/1AyXP88D5pQ/LLnRAueGoY8=;
  b=JmyxYcT8DrVWYGeLWtHeCKIJZS01L8Xm87jOe2cshz40oQySFjN4G/Ek
   p4dApdVs22FyLXI3pbwgOxFQkPIS66lrwdUEgRbqXhhugkeSemIT1PbxO
   ALOxqXwd2MZsFAUK8GqxitRWGP9aI3vEPR8FZ9lQmPEpLdgMbz6swhjce
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ox13Jfo4lao8veH/ZLISjnxABgbNZ584dH/gSnwYjmNc7Z/U6P1bn/DSOgxmDdpTsbhCA6CUWq
 +Y9Sp0ZSw02UXiX4jKt+9MzADEC/ChF74Y6PDFuGi8MqqYltf/9yKog8GdO25JuFUS+uwwBxPl
 fjCV7zIcWWYf3WcpBjexI1DELkdTaji7yyfBgE0QsmdJ2tVm44nYLvV3mF8uYuU84f4ZaCLyTg
 x0tROonXjVcUhrKAvYqRyz5kihnyA1bK4v0DhcWY616I2GcBnRNwVTHrpmuQy7pBMKeO99XGkQ
 tm3a2U1RFMCDAh3zQm3H/Dvy
X-SBRS: 5.1
X-MesageID: 50348034
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JDSUVq+Y6QKHE7jbQdRuk+FWdb1zdoMgy1knxilNoENuGPBwxv
 rEoB1E73fJYW4qKQkdcdDpAsm9qADnhOVICOgqTP2ftWzd1VdAQ7sSibcKrwePJ8S6zJ8l6U
 4CSdkyNDSTNykcsS+S2mDVfOrIguP3lpxA7t2urEuFODsaDp2ImD0JaDpzfHcWeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlEawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontprcZrau5p+7f63+4sowwbX+0SVjbFaKv2/VX4O0aSSAR0R4a
 PxSl8bTrlOAjXqDy2ISFLWqnXd+Sdr5Hn4xVCCh3z/5cT/WTIhEsJEwZlUax3D9iMbzZhBOY
 9wrhWkXqBsfGX9deXGlqv1fgAvklDxrWspkOYVgXAaWYwCaKVJpYha+E9OCp8PEC/z9YhiSY
 BVfYrhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdzs0CmXUL8o47VvB/lq
 z5G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJK26WKUSPLtByB5sMke+D3FwR3pDbRHUl9upNpH
 3xaiIriYdpQTOQNSSn5uw7zizw
X-IronPort-AV: E=Sophos;i="5.84,316,1620705600"; 
   d="scan'208";a="50348034"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ0HCDpBsiAj9WQ4axrAXaaq2HJd8TQEt1kTNktqpyMjHzKJecs0iNzWB4Z8HntxXMJY/eR01l8UnfGThWCsOjnAlLOjiRPyRZd1B2U8iigJwP/eSSjky+Wos5h3pCv7/CQGtb7FUZULx4J6MPlkHvCBJ+r9IYXoTG43/hhVT7GFY9CWzSHnAtvcou2gu4RX6ujcr02bDLIZ+9i/aLhxCZFt9mX5KFTIwXoeNE6Bz85L5tf8TAHZBYnNeFQ5GKcjtCXncT/24VJi50sI/u6qHQ07GS4aL8y55Z0T+9zHedNRS4+ZkPXQo84j9EudUNJSH00RTOr+oZcs7BT9DtF0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkmZLF6b+epKsmv6mrPF6MxaDlvZ75ZCJBjXBq06Rew=;
 b=bA0qpLfoJG33j74MhJBaAOC8PUyUGxfirtseE33w9hh3uhHULh45xz/fxwndcMc3Ugat26U5XwkD7aLEQMA/trtTruOrOb17dguHhpV/cL0NEDJmZtFWbvMSSzC5gvAIwF6Dn5kqAqDXoLBn09VfmTJtiSSY21NmTGhYT0NjVwS4ZoIqKc8Obaej5QO41A4+7ircyt1i2ZrzcFR5NYdvl9A3my4ztECAdE9b00nqjxN4l4yUpFee0dXhQlo/QD+m+JPbVlGugeZnIZu+HGAJo1Lijo05M1a8gIHgdkk52WqZhfpuMznKaCX/VmapstsZEJe2r4oHkZEBjYRTVYBW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkmZLF6b+epKsmv6mrPF6MxaDlvZ75ZCJBjXBq06Rew=;
 b=gdbKxwnLwkO3A9OTtpAo2WSgLRZRk6KlooNq6CbyKMskJfBEDpa5H5inaDbg38UeJ5n231HliMjYUGhcMT0ynKlAsT3sm4KtTE46OVIbGwlT08R+9AXtZWN27i/9ivrJRqCD3+wSNJJ4fdMinh5cjAuBsShkIpdNSKJm/KQEun0=
To: <xen-devel@lists.xenproject.org>
References: <CAKf6xpuFEhyrhk8N3mDP=F4jmpN=EHxw47e+PPAuJ15+XZL7xw@mail.gmail.com>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, Andrei LUTAS
	<vlutas@bitdefender.com>, =?UTF-8?Q?Mihai_Don=c8=9bu?=
	<mdontu@bitdefender.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Issue with waitqueues and Intel CET-SS
Message-ID: <352fb0bc-ce16-f167-da8d-99424228445b@citrix.com>
Date: Thu, 12 Aug 2021 20:18:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAKf6xpuFEhyrhk8N3mDP=F4jmpN=EHxw47e+PPAuJ15+XZL7xw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85b27d9a-57af-4f94-3e13-08d95dc5f3f5
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB58540B6FECBE06EF51488819BAF99@SJ0PR03MB5854.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wTCzwfo5KGkThzPOXoqaRwSj9tSXqDcatkgWZZv7/xOy6iweTvwcJwJeREpQP7+z0TpzryFijuE1hU+ONgQNWkeH5jehxjUFwm/HmcsZ83hanoe6/w2MCkpYKbehFPVyf8dHgX74uTJgqZMcSjD+p6a9xYoLXmqMzc0V4ScgLojZwqbqsMxkJy8Dq6DxnBrXIee6128LBthjvtODK43bJ8p15kSTaHPY3YOuiiPHV+QsrEhhQWA+/oDEXWpjPmw1W0QgJ5FphWygGwWZWbph490RzDG8S4p4/K6YcfTlQ/WOirrXeAoOgkbMSPQwmJzuKKelQU40IQdcSHiEvTIZjgd7txoGwES0aWbi+KR3fE4MBhPH0lXVXuyfWGAcMB7uKq67eDMrn2h5yJlklrq10mMQtirCS0GzdeYAFksQun8pPVqWoZ659iAweZYkrzinDb9KgkMFMzJvQNj8hNCZOaElJ2WCBEZ24h+90+brXfZTGf4axFSqIL/e+ldJMCsL99GaSpcpen+YWAzPiRbG6YyQ9nvNg1HfDvwn2md84MTRQon+joszJQ/J0wQt+mRITG2gT0G7WDj3kcyTNf/F/Hhs2wQglQT+PS/M11SLnpZjMjRpfdzxv6ca5WrksOVPDqCz/WPMxDmJy3HO0ogOJ+lFYiF964OHpuymvZLeK8UR48i0hVWLUWSQfOF8mDHMmKd84pNIcUEl3J23G+CCwzD0bPBIVnq7OucbMxQKB6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(4326008)(6666004)(31696002)(16576012)(38100700002)(316002)(83380400001)(66556008)(54906003)(36756003)(66476007)(2906002)(8936002)(66946007)(186003)(7416002)(2616005)(26005)(478600001)(5660300002)(31686004)(6486002)(966005)(53546011)(956004)(6916009)(8676002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW9ZM2Y0ckhvNnJGSHhTbGNFUThPcHJLREJoOWpXWjNsMUJDME14ZlNIT3pR?=
 =?utf-8?B?NWNuck1ub0xXVkF6cVBERjhMYlVWamoycE5XNVpIdTZLQ2RFMVhNeUQ3eGFC?=
 =?utf-8?B?eWdoRnZJa2pMVVhoQW1pOHh5YjRQdXRQcmJjRGFLSjhlYkpudlB2SGlLR2Er?=
 =?utf-8?B?YU5SeVJpN2RIVkhMeW5hZXpETkhGVnF2VUVxVjVPYS9iM0tLYkxIc2MvVFVQ?=
 =?utf-8?B?SGUzZUdGdis5dlNnQmVkSVRRM0luZzBuZ0FYM0xCeUNNWDdlaDluT1A1R2dy?=
 =?utf-8?B?Q2NvRi9lMG92NG5aTE9vdS9mcm56VnFhSXBvNG55WEcvNEdSS2EzUGN5d2ZY?=
 =?utf-8?B?YXdjVitaNWpkTmx1MlB0R2IyUHplWVZ3V2F3ZFdmRmg1eU1xeXZCTjNUeks4?=
 =?utf-8?B?cjJlYzJNRlRKRlJ5ejlWdUNnQXd2Ry94NzJrRlV3dlcyeDlBN1VpRzEwMVBm?=
 =?utf-8?B?Y3p2cEtoeXVHckFZRHZyWVBLaEp6TnU4MTRwczRmNldWYXJSeFZUbGRmcmRa?=
 =?utf-8?B?R2I4NnNjSDRydzNhWENKSFoyTG5hRHZZYjdxNk02L2xxTlJlZlZLaUNnVkR5?=
 =?utf-8?B?aHJYUmlEL1Q4ZUg3c0F4OUdHMVJIUkQvbVlRV2FsMUlHTk9sWGR3NTVUc04v?=
 =?utf-8?B?VGpZenFFRzZua3d1MEs4Mkg1Q1JMWXY2VW9GdXZyNjdkWDN1TnQzUVc4ZlUy?=
 =?utf-8?B?QzBWZDNJUk03SEo2dFhGR0YwcjNoWkZSL2xWVTd1RHVIUEEweFg0d0RzRHJk?=
 =?utf-8?B?eGFRK1JVbzl6YzhXRGhtbFY3aXJ6eUM2UDdxeXNzU2lDdi9PemdiQjZXRjdn?=
 =?utf-8?B?VEc4ZVkwcGsyS3Z6WXBqMnZHSmwzSzJ3emsxc1lqdXh1L05SYTk2WHF0SmF5?=
 =?utf-8?B?bXk2c3Z1OGVmblhTaXptOFBpYlcwOWhzay9kcGxDNXFFYzJoNm93N2gwVkFn?=
 =?utf-8?B?WHQ4ZEJrQ0svVmh0bGdpcllXNGo4NmY5VzR4THNlSEdybXh4UkFyazl3c2NV?=
 =?utf-8?B?VTM0cWVuK1ZVai9kczBaa0ZDZUZyRlpJd0VkNzBiN2lMbWlyYTZjWDhWMnRk?=
 =?utf-8?B?d3UxVStEM0cxYTZ5WFVZcmNGeUs2VFVSdlIzTW8zbG01ZjdVdTQ4dnhyZjZ1?=
 =?utf-8?B?c28xdUFQS0M1WWl4Nm1yYndtV1k3VDdaVGhNdyt4cXo3eTdrR3Iwemk1R0JE?=
 =?utf-8?B?WUMvdVRPVlh0cHpBeXpwVnl3dUI5WHRMK245UkFFcm5BRTRuS3o0SSs1ODM3?=
 =?utf-8?B?NzNBbUNVbXF0RXM1RVR3ZHNGcHV6NGZ3SkdqbG5oTjFUNWRrZm9qN2Z1SDh5?=
 =?utf-8?B?OWpVMGtES1QrdERMZ0dVVWkwZzJYcXJaSGJWTzhhQXN1SXZGS2tUeXhoTGc4?=
 =?utf-8?B?Zmg4ZkJhTWtOTFkzRG9IQ1Y4MGVPWHM1UjUwbGttY216bnpVRWNVUzNnM0w5?=
 =?utf-8?B?WDVqRzlhY2gza3hNOXVtVVEyVHJrbFVxVEtadVIyb09uTDBZZTlBUGVUTk5W?=
 =?utf-8?B?blJvZUhXWk5RdlZaYTN6aW1pVVNuWlFmMFdCZkovTFI4SEtSWG42cmUrdldI?=
 =?utf-8?B?SjF5QkZBUk9TM0hQMXdoSU1UQmlOdnIrMFF3WHFTOC82TTRmZXZtWE55WFBG?=
 =?utf-8?B?dUJLdDBZenlhK3QzV24rUkk3Ni9BR2dOYlBpYXN4NFVyVEVLNVlNK0psSTE2?=
 =?utf-8?B?TEdzSlBucmZrQ1BhS1RZb3M4eGl5NlUyb3hMVU42YURoWlg4U0dhR01RSGtD?=
 =?utf-8?Q?LDiXV8zLzb9mBHTwf3noEA0kqkY0GKhvB9hhNdG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b27d9a-57af-4f94-3e13-08d95dc5f3f5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 19:18:23.4750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buLD9PIpBSRxRb31OjUgI+//V6I24iFPt3ioFvL1N81Bivg4kTm/7r11nWJXCrtw4x9PaA/oPV4rrMxR+YgBT503NbphTfe2by8KjDEDeSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5854
X-OriginatorOrg: citrix.com

On 12/08/2021 19:20, Jason Andryuk wrote:
> Hi,
>
> I was reviewing xen/common/wait.c:__prepare_to_wait() and I think I've
> identified an incompatibility with shadow stacks like Intel CET-SS.
>
> The inline asm does:
>
>         "call 1f;"
>         "1: addq $2f-1b,(%%rsp);"
>         "sub %%esp,%%ecx;"
>         "cmp %3,%%ecx;"
>         "ja 3f;"
>         "mov %%rsp,%%rsi;"
>
>         /* check_wakeup_from_wait() longjmp()'s to this point. */
>         "2: rep movsb;"
>         "mov %%rsp,%%rsi;"
>         "3: pop %%rax;"
>
> `call 1f` gets the address of the code, but the address is popped off
> without ret.  This will leave the shadow stack out-of-sync which will
> trigger the protection.  Is my analysis correct?

There is a shadow stack bug here, but it isn't this.

A CALL with 0 displacement explicitly doesn't push a return address onto
the shadow stack, because CALL; POP is a common technique used in 32bit
PIC logic.=C2=A0 Similarly, 0-displacement calls don't enter the RSB/RAS
branch predictor (and why the safety of retpoline depends on using
non-zero displacements).

However, the fact we copy the regular stack sideways and totally skip
the shadow stack is a problem.=C2=A0 We'll survive the setjmp(), but the
longjmp() will explode because of trying to use the old context's shstk
with the new context's regular stack.

There is no credible way to make the waitqueue infrastructure compatible
with shadow stacks.

Furthermore, the infrastructure is an eyesore and we've discussed how to
go about deleting it several times in the past - it is only needed
because of an shortcut taken in the monitor/sharing/paging ring handling
with dom0.

In the short term, we should have logic to perform a boot-time disable
of monitor/sharing/paging if CET is wanted, which works in exactly the
same way as opt_pv32.=C2=A0 This will prevent Xen from exploding on a CET
system when you first try to introspect a VM with more than 7(?) vcpus,
and will let the user choose between "working introspection" and
"working CET".

As a tangent, if we know that waitqueues aren't in use, then it is safe
to turn off HVM RSB stuffing, which is enough of a perf win to actively
chase.=C2=A0 I already have some work in progress for disabling PV RSB
stuffing, and the raw perf numbers are
https://paste.debian.net/hidden/0d59b024/ for anyone interested.


As for monitor/sharing/paging, their dependence on the waitqueue
infrastructure is easy to remove, now that we've got the
acquire_resource infrastructure.

The problem is that, given a 4k ring shared between all vcpus, Xen may
need to wait for space on the ring in the middle of a logical action,
necessitating scheduling the vcpu out while retaining the interim state
which isn't at a clean return-to-guest boundary.=C2=A0 The problem is
exasperated by the fact that monitor in particular allows for sync or
async notifications, meaning that one single vcpu could consume all room
in the ring in very short order.

The fix is also easy.=C2=A0 For the sync interface, switch to a slot-per-vc=
pu
model exactly like the IOREQ interface.=C2=A0 This simplifies Xen and the
userspace agent, and improves performance because you don't need to
marshal data in and out of the ring.=C2=A0 Also offers an opportunity to
switch to evtchn-per-vcpu rather than having to scan all vcpus on every
interrupt.

For the async ring, we can either delete that functionality (it is
unclear whether it is actually used at all) or we can implement a
multi-page ring similar to the vmtrace buffer (actually easier, because
there is no requirement to be physically contiguous).

As long as the ring is at least big enough for one entry per vcpu, we
can rearrange the logic to never need to sleep before putting an entry
into the ring.=C2=A0 Specifically, pause the current vCPU after writing the
entry if the remaining space is smaller than $N * d->max_vcpus, after
which we can return to the scheduler like all other operations which
pause a vCPU, and the waitqueue logic loses its only caller.


If anyone has time to address any parts of this, I'll happily provide as
much guidance as I can.

~Andrew


