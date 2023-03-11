Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFFB6B6173
	for <lists+xen-devel@lfdr.de>; Sat, 11 Mar 2023 23:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508820.783647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pb7a1-0002GA-7p; Sat, 11 Mar 2023 22:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508820.783647; Sat, 11 Mar 2023 22:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pb7a1-0002Dy-4S; Sat, 11 Mar 2023 22:20:45 +0000
Received: by outflank-mailman (input) for mailman id 508820;
 Sat, 11 Mar 2023 22:20:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=377f=7D=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pb7Zz-0002Ds-Cl
 for xen-devel@lists.xenproject.org; Sat, 11 Mar 2023 22:20:43 +0000
Received: from sonic312-24.consmr.mail.gq1.yahoo.com
 (sonic312-24.consmr.mail.gq1.yahoo.com [98.137.69.205])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2e7d4f4-c05a-11ed-956e-85ef70e17bfa;
 Sat, 11 Mar 2023 23:20:39 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Sat, 11 Mar 2023 22:20:36 +0000
Received: by hermes--production-ne1-759c9b8c64-gbrwf (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID eb77c033143cbf2c05ee25f23f1eb10c; 
 Sat, 11 Mar 2023 22:20:31 +0000 (UTC)
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
X-Inumbo-ID: f2e7d4f4-c05a-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678573236; bh=qSs36eFlHmP8zhiAjsOMUGuV2ONkBkq0KY4mlkxHMZA=; h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=ez0nxzTQDcdN1ILsHwp59RZGq6eqrd28ETTl1z08hw00nOWiVfSlVbX3ZUdfSPOnT/ajeQveotTjzPYPxvVf/xQG49kLyedpCb63jMTZIEpwOa+2mad+K8RkXUeWUdcwzpnpwCHGTdcKy53p6R7kaC2ULssAY8I75/ewWRLqSMSSPqmvmPPZILwdSx+K6+efFW1LFCoPq7555Kw9pYZ5WS8aGYIL+TZaxXkMoud+k2cej12GXcEICcZTVz2ftC2+FJEgS8GMJQ0g2oWvkltOcz/fWgTbpabZVdiO2nl6x8BXyU3srXOR4s11sjRFYZFRHSUF2XK35DHEb4l7zTqOtA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678573236; bh=snNRfoY63+RvjRWPUMnZFf5pOzpzpf/Sg1cPi5khqZf=; h=X-Sonic-MF:Date:From:Subject:To:From:Subject; b=FlOOczTrKJqyFlQg9PRRB6pZ5tmvGV9XrMCfJxUJSt3QApsbxfDnUMQ6HwoLF1WDShx0sPTlWpiEPZx4CqUM26sHidcfmHEmuLRVLU5J9ycAdCY+J2XKof3WCxb4hwYp2gFtdhXAn+5gz8C36Mm5S5dPl9QAQrV89Lb+rYEZb2WGc7P9rwtEazWsWkzFrqXO2+74fyRb3MG5LjNTJdTG5fUVm8ew6JtlufWfMDLLVupi+jIXdzLSTPD7XC8fd2Jcc8ifO1q8nneV4GgxDOEmVG5DxSv8jEd/3ZiE8GtX5YsDPMN8NvOcwdtCd3hVfOIUsKC4GEnjXX/TWFD4b7tgyA==
X-YMail-OSG: FaqhF0AVM1nF3IhLQO0VU.lnDaPalMv43J2I7_GUXGMZdq34kABMoCfZcaB_.YW
 pQBcqGLNdBcqa.2N8OMRPQzNQBFSHiuCRNY94O2WegdOJEhLvRW3Ua2RUA3Hq.I2MX0k84fWsiDn
 PY7vUlw84JtrRSgIFwqRRlfPteZ3v9aLyRALds47OfBWCXVW7FHWkCKOaOl3OpHtBoyF3t3kbhtB
 bmwHufPLnnojzYjIeDbot6eTkTJng7EOtG.437MKNmxpctncDsbC4zd7I58Bh5dXO26VmN5oObpj
 TkkqEyJ6EnbhbdA.ycKIQvD2zW6Oe1aVSd7UQI3MYzgH5lZNdj3fDftlrEJQpp3E1bYPPvkQI7g7
 fhPecgn.yCEv51h7nBOb44DEGC6HPY80SngEgjfoQNZG_NBAkrun6OLGnCRtJKojmsvfEuNvfRwt
 moD6nO6tbv3xOojQwHNBUkcJQs6To1Lo3gGXJAYnSTX8TQme1N1tTgMwsVY.xDo5mZClQRWhK90U
 zOEaROZh0Cljd2RjPeMfBKN0jcsX6UnOkTdnQs2aWRJCwPwfa77j.fc6HYh8hvgLnnV8xMpMuL6q
 SpIWwUbVWEX2MXtDaZu69K1U0ID03oe4K6IgGVT5oc6sZPJNxjFMa9ililZmuyIzZz8vAJ65GBy9
 UB48HK1JWB4Cml4Iw2eVzoNPgFpIHSnPb3Kdcezf0qAK2D36bmDQQdeJmIVR087qlllEeS8LGv2E
 YOnZWYXSJTXnB4OTz.naOVXd9QXf_j_pHNL9KnFcjxWjPDMWyapFGRtDNlLOxGhTLsDLRlj212vq
 LvmpaImbeFfkre6oNz1ROeMtxpLJW29Nb9SUyI11pbszWfqbBsZOIRnxkl3w2R2._c48m7zuPNfw
 5QTYSGJcAs1m6RHVKsaADdIx.6rl_11p3Kvcw_Ms231xT9_NKXgB7zrgdehL5ZdUu7xqtTx2MqlE
 IStbE4uOsusTZCLvFLgi3ZfyI4WHldg.1UpRQc0ATJhvkxettVgvTPQSCkr4rprBrF1uah6F6sOX
 ZCN0LGZhF4dw3xzWWozRqGFhMdoP7eOzbIJvt0aMdr060HcHYs0Dfsui9ehFf1mMRiclvYY2pTRH
 r2Xt0ZY._YjPDYn.9rjHy4oZQphcPwUiqVTSzmXUNhqx3PMxBlBQJox0Sb4drbwgdl48xYEnTkj3
 5snkOr0shSAGYzRdBiOh8NSmhLH8C019PY3w9kFqgIe7jMKdaD19sRj9amH9kXwtvTSLXHcZ5ynd
 afnqXISkOdtGCyYtWk3HK3yVrwlv.2lQuyKjksFrOKJKj8W2T_qUMwXuDCTaKf4DyCS_0DM9SrRN
 4RGScRX5_XXewMaG1v71SBfSToQjVk4GmdGIM88LWCKW.UqzVKqyM9yh3tDQpbjykZHueCq1TN2j
 O.bFFtmhwY7SH6DerdZcJxT9gSxY9LIR5zs7L1wsu9ppov0dGDr5gt0CG6QJYKiHWtYrzg.xlzXX
 U5LVSfotC9g9gV7210mnz2dkJWrX.MBzkqbWW7oAmLpxfxRx8Zpx6wQJivcXtuEIr4ajUlxIrGs_
 nj0YD1NYlFMCPpiZRzJQRrB_RKpVtdLYHSLDkvuTMGA2Ywo_DYBogEmPmXDoZf0zR3H07XZKr6Ru
 0Jzw7bW8u0f2vXVp_6lCP4jfBDPtUX8j8E9VXQu8BkO7c.9SpUoECFG6LMmOJIZTrimTMETfC1nb
 QYg.tY9Iin8v0pljI73.GakftO8rSUv_MoPtUr8WdIDr8nX7qNEgr0S3IwBp6XXQfiVrOWDpW70K
 ehuK0Bav78OJRA5O3hnlaxH6IbANcfuPW3Ymcod6aL4xkBYwn0ulpkPYMZbv1szdBW2V3_..aoNG
 mHACzj5BK7mM_3FY1faud3vGVXEZMOTQDAjHjp.U3Xp5bcez__eNHTy1B4ru9bX43xZJGGcgYx3W
 Dp5oyoN62Fnr3PyvlynOH6B7labzC5I..Ckg1MdtcHSZoHSUv73A167A_1Ew2FkSXejcGwhd0AFp
 dCIRKCLY.BRSlzeK5H139BGy5wUijLBEd6HAEBAxhMjhFXBSRvkM8aWa20tGCFvADJbQx6TGGMcg
 YfXFDyoYUVfJMUsgxYRtrVR965i_uA7NBSJpzhC5Kw3QFQ6tevD.Dc2P6ysqAb6fWGjEMiRwUhiY
 T_ef3m3VAiLqng1.xULs4boao4llMSK1HssWO8.fTXn3UkKRwCI0Aifxo_3R2SEmoMh_ahbMxgLo
 9Tvgcal_V
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <c20b7056-037d-67ff-0b2d-ea931d501bac@aol.com>
Date: Sat, 11 Mar 2023 17:20:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Chuck Zmudzinski <brchuckz@aol.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230118051230-mutt-send-email-mst@kernel.org>
 <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com>
 <0C2B1FE4-BB48-4C38-9161-6569BA1D6226@gmail.com>
 <96A4863B-D6BA-48B5-B5E4-54DD103FEBAA@gmail.com>
 <6C8AA4D4-FF57-4E43-A464-7F64C576ED5B@gmail.com>
Content-Language: en-US
In-Reply-To: <6C8AA4D4-FF57-4E43-A464-7F64C576ED5B@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21284 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 2/9/2023 4:53 PM, Bernhard Beschow wrote:
> Am 1. Februar 2023 08:11:10 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >
> >
> >Am 24. Januar 2023 17:07:30 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >>
> >>
> >>Am 24. Januar 2023 16:11:47 UTC schrieb Anthony PERARD <anthony.perard@citrix.com>:
> >>>On Wed, Jan 18, 2023 at 05:13:03AM -0500, Michael S. Tsirkin wrote:
> >>>> On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
> >>>> > This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally removes
> >>>> > it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in the PC
> >>>> > machine agnostic to the precise southbridge being used. 2/ will become
> >>>> > particularily interesting once PIIX4 becomes usable in the PC machine, avoiding
> >>>> > the "Frankenstein" use of PIIX4_ACPI in PIIX3.
> >>>> 
> >>>> Looks ok to me.
> >>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >>>> 
> >>>> Feel free to merge through Xen tree.
> >>>
> >>>Hi Bernhard,
> >>
> >>Hi Anthony,
> >>
> >>>The series currently doesn't apply on master. And a quick try at
> >>>applying the series it is based on also failed. Could you rebase it , or
> >>>maybe you would prefer to wait until the other series "Consolidate
> >>>PIIX..." is fully applied?
> >>
> >>Thanks for looking into it!
> >>
> >>You can get the compilable series from https://patchew.org/QEMU/20230104144437.27479-1-shentey@gmail.com/ . If it doesn't work for you let me know, then I can rebase onto master. All necessary dependencies for the series are upstreamed meanwhile.
> >
> >Ping
>
> Ping^2

Hi Bernhard,

I took a look at this today to see why it cannot be applied. I can see clearly that
all the prerequisite patches have *not* been applied to master yet, so I can
understand why Anthony cannot pull this up yet. Specifically, the series that
consolidates PIIX3 and PIIX4 south bridges is not yet applied, and that is one of
the prerequisites. I think you said it was reviewed, but it apparently never got
pulled up into master.

For reference, here is the link to the prerequisite patch set I tested with
this patch set:

https://lore.kernel.org/qemu-devel/20221221170003.2929-1-shentey@gmail.com/

The patch set I tested is a 30-patch series, and I don't know if it has
been partially applied. The title of that patch set is:

This series consolidates the implementations of the PIIX3 and PIIX4 south

So before this patch set to resolve the TYPE_PIIX3_XEN_DEVICE can be
applied, the patch set to consolidate the PIIX3 and PIIX4 south bridges
needs to be applied.

I don't know if the feature freeze means these patches that do not add any
new features still need to wait until the next development cycle.

Kind regards,

Chuck

> >
> >>
> >>Thanks,
> >>Bernhard
> >>>
> >>>Thanks.
> >>>
> >>>> > Testing done:
> >>>> > None, because I don't know how to conduct this properly :(
> >>>> > 
> >>>> > Based-on: <20221221170003.2929-1-shentey@gmail.com>
> >>>> >           "[PATCH v4 00/30] Consolidate PIIX south bridges"
> >>>


