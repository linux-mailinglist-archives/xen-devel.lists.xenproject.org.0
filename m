Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B326B6BA6
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 22:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509078.784245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbSpf-0002my-9F; Sun, 12 Mar 2023 21:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509078.784245; Sun, 12 Mar 2023 21:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbSpf-0002kq-66; Sun, 12 Mar 2023 21:02:19 +0000
Received: by outflank-mailman (input) for mailman id 509078;
 Sun, 12 Mar 2023 21:02:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7r4C=7E=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pbSpd-0002kk-M1
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 21:02:18 +0000
Received: from sonic307-55.consmr.mail.gq1.yahoo.com
 (sonic307-55.consmr.mail.gq1.yahoo.com [98.137.64.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28058e2e-c119-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 22:02:13 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Sun, 12 Mar 2023 21:02:10 +0000
Received: by hermes--production-ne1-759c9b8c64-zjkt7 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 50719ea2e9e3029d04401e70cab7486e; 
 Sun, 12 Mar 2023 21:02:04 +0000 (UTC)
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
X-Inumbo-ID: 28058e2e-c119-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678654930; bh=10uFrio+ZV1PPfNVBx2C+yggwyttoaF67wqTYTO+Sv4=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=l9Bwt99MgtYoBNlIxi8tAITpK+d1Kqp6IWjeCDJnIlKmDUc6xsSg8gvA1Kofe1LMZzbhxXSGy+aEN9x/9RgkjucJkOUk3oG9yYP/kktv1gC+9msTT43fSyzOvTTCYi9iLpHfQYHtccFpsILKI6hv932MpxLiILagu09XkM5dDK92tH0xdDVgDL+W7VgME4KDYpaLCY/vA0/2krF+WslfXLqyLX6JaB8opd+rfeb9hFaE5TI48mxO+HUmazSMK3RKDAAJCKP6IOPnNE06lxZvCCINm4RaAPYbjfWHf5m0Ke7DZ5RQ/Vw8HBdTnpPGTyP0ULL9HM4qyMb0ZxQpCRNo5g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678654930; bh=QodLCJXPBuRvFzrK28JbkT1bLowJgJrckrFnETZkjS3=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=bJSbyqVL2zq1iptCkawo2o1UvB+AtrkqrNUdYxZ3YZF4cjeeWKThlnPlRo3/0vxzAUbiqHwsNq+nE8apckm58gwKPL5TpTwFfGx//p/ZPZLgbTpvpECyc2tiYSo1elm3DVhBUlf9N9RXxuF48S44+qIqCORiki3gI2Ij1apLKwqTJ8tazcZFzovrpMqf9fMqXInPQwGG6AkuOErC5IDz10j8bby9d6ryTWx+RUczdauQK8YAmaHbJwBsRwxzh66y+RehWt+RtWz+AFyMXfeVFGHMXMGTyrIvXx7CwhqqNoNI61x8aKvRJRsHN4izeUbVwtgh94YN8kxa1pMTTny1zA==
X-YMail-OSG: xZyTDwEVM1nvE7uWhf.lxMsopZbdcD6ffRigCPpIGBz2HMap2TV87H6wSjo_AeG
 M5rkVPnLjrVIuSBgJ1A1NsggsUTwiH7xfh1Kqsw4EC_Nz0jyu9zZ0Of5AtQlP4rdu7JdktbE8GUN
 lBQnjDiKZDd2jpN8.hJjLSuGeh2ftu0yDHWZ0HkQO5vcYc1V3BtssIKvthvxoalwPdHXBRIGV34i
 zm4EsOCA4exrYiZ_7QT.ERH660Ipcm1qRRkFAEtXYMV3A7UbHLTsoI7XPyRYRzL01mT1VuH24iEA
 yCzFsUQSfmxs8EE2ZXuMHZIW9Ch3SopgT9DO4wsp6vixNxjd9DXG_RAXYuSjOWuVqNeYm0vhLfPV
 Tkg8IW6xiLd4uffgje5uSWatNFX0oiwk_vnAYQ3y.6hs9r.mSezhIkbXoYKeMvzoDr0MIihPZulB
 JJl.LbKTx8a1EM1wLXMxVOP7xhs_.FcyUubYHo43G1YvCV7zUQ7nmkbMgCq_pPCzRSvXAcxnlQJ_
 3S_XVkeicvvBqWZx_w5mfPy6RbyEy7akEa1G0D2CD9u8pROjo6tBTAMPiMKvzooZk8LU7MaZ4lWE
 PvO08tpxoH2EM600G5C7mEi3cenvso6P5BWoROPkwFktT4CV5Ie7krjYrAG_0YJ3c42VQ3Iy7mM.
 l830QwusZx7r07JUXfKFquuU0P_Mohw1AAKRfylqd2MKpuuYJmapLiyPDWRwn_5WK_0Nv0xr7XGV
 JK2H56Egeu55.eGj5VNffgtkxnf6.EhmmO31DX9pTfdebeMcCc3vtd35zMJ9hHso1K2GR1gO75.N
 uiLTEoTjwkTvjMnxQTAfVnucQSQsKRdsk5SAZZCDCM4r03JRi2LwkHHhXhm4GUjfotJ38YuiJiLS
 1tMf1ga2oACF99MdJnYfHmWKhjo5YBgM5zg5uf7HFqyRd_9KVZEzn16tSRhPvVPv4VpdTbedszl4
 cWC.B4wbpg5z2vSDvAJDkPioc8.7ruMfeelV3_cFCssDHAkVzzRoOrxNEhJ9aTjEPigySZFK1AGy
 aW2_4uu.4OR0Z8gwQJb9_pHuhRH3wTNd5aZJXnr5nfe6X6cEXRcrtMkD6KPbItYpEf4WCJtgLEtr
 3xr6OaPMDG5aGpu23BuSHHNWIFrvOb1ee0p7o9oe7sNQpPM5WLbJusc0iiRjJ_6cmmjHmMt2Kuqs
 ZCZbsZsdPSekG9w7froKJraXEEGAXWmQbZA9mOiXQtxTPSUmhtRUgItRKLKLVPKSEDCfOTUsw2W1
 UyLnAH24QfBz_6wc9W7.WkdU2hnixuiK_2USxcmj7fEHn5nA8JiH6vgMLY088fB6nThEbSujqHGh
 u628tRLBt.oN_InL8iv9WXqTSlWJwKAT5y98TDJ4Q78OPy5wGBoe4xoyvpzXPkEZmTo9spWC6FaA
 bFizsDqwsekeplwglLeBMPEp.._2ImFnRyqs8ySxVgFEeK8p58dmJO0LowD00IUfveJ1Qd6aLVAJ
 UvzMlpdHCWaFetSz4QSdKiihNUCua3h2o_o.ArIHoS7UFpm0BBsE9zw5XJRhoIKwHClw8JRzQqa8
 M_TYm2V37wqlTDl4qbOtpRS4G0ac1U3oFXYI4gGxYezwLmFBi1okeMOCrHz2qQ9iZREyv4UlVBKt
 a9ljkS5.s8TZ0l3VwuKqZNtwaZJ2xcgTVkjpZyFr1z4k89o40tHTt9RIb3gMR4k_WR5FX0UxoZsJ
 WTlQcyio2NU5iWg.qUe3sq23_54Tlm2q6slNjvDAKv.pHtNfv26eqrOvOWxpBMNEdXwaSM.qj_A0
 F.Tz4UHikhPJeYESY65Ew1WTIwxwVEUPLgWqTIue4mYJcP034wGcmwTKJ82NL05oQxwaK_N7n1ro
 3bu4YNARa5xBmWCcsAx3p6mkEpHsllXfDirdYRhzaX2tP0ETvWciAok5PjE1BzWuouPntO5P1hkl
 jWLlp3Q0AAWXA0PdEqISyn8k.ENXxmjZtO5wUgLi.FqsbwJJwMhxfzyGS2M.HF1C_ahmE50dE7TX
 P6pJhLKU6JaPhnYBzgYY9XEOKNhjzeIAETKLGbz0FRWv_LLNcAMz3ly8tvAXaRM6DrgYE3onoa7l
 vBnmxYP7bPxH6HWB7k5dJe07taWlF5hdk8h7.KyiJbwUj11JERerN6xlcjElIBY82nZNBaHQwzEt
 LSZ1THGu927BwrgBamOlwI59Uiv_JtmDuRspBz1iE16e6_1WYjjXrt4vzWJWmNbzOP6dbBsOEvQq
 swcownTIipeHK5xT2QA--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <e79db0b0-8d35-91b7-1d60-8670c6594ef7@aol.com>
Date: Sun, 12 Mar 2023 17:02:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
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
 <c20b7056-037d-67ff-0b2d-ea931d501bac@aol.com>
 <FD7FF486-D06D-4CC1-8618-13B4138596B2@gmail.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <FD7FF486-D06D-4CC1-8618-13B4138596B2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21284 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/12/23 5:22 AM, Bernhard Beschow wrote:
> 
> 
> Am 11. März 2023 22:20:29 UTC schrieb Chuck Zmudzinski <brchuckz@aol.com>:
>>On 2/9/2023 4:53 PM, Bernhard Beschow wrote:
>>> Am 1. Februar 2023 08:11:10 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>> >
>>> >
>>> >Am 24. Januar 2023 17:07:30 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>> >>
>>> >>
>>> >>Am 24. Januar 2023 16:11:47 UTC schrieb Anthony PERARD <anthony.perard@citrix.com>:
>>> >>>On Wed, Jan 18, 2023 at 05:13:03AM -0500, Michael S. Tsirkin wrote:
>>> >>>> On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
>>> >>>> > This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally removes
>>> >>>> > it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in the PC
>>> >>>> > machine agnostic to the precise southbridge being used. 2/ will become
>>> >>>> > particularily interesting once PIIX4 becomes usable in the PC machine, avoiding
>>> >>>> > the "Frankenstein" use of PIIX4_ACPI in PIIX3.
>>> >>>> 
>>> >>>> Looks ok to me.
>>> >>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>> >>>> 
>>> >>>> Feel free to merge through Xen tree.
>>> >>>
>>> >>>Hi Bernhard,
>>> >>
>>> >>Hi Anthony,
>>> >>
>>> >>>The series currently doesn't apply on master. And a quick try at
>>> >>>applying the series it is based on also failed. Could you rebase it , or
>>> >>>maybe you would prefer to wait until the other series "Consolidate
>>> >>>PIIX..." is fully applied?
>>> >>
>>> >>Thanks for looking into it!
>>> >>
>>> >>You can get the compilable series from https://patchew.org/QEMU/20230104144437.27479-1-shentey@gmail.com/ . If it doesn't work for you let me know, then I can rebase onto master. All necessary dependencies for the series are upstreamed meanwhile.
>>> >
>>> >Ping
>>>
>>> Ping^2
>>
>>Hi Bernhard,
> 
> Hi Chuck,
> 
>>I took a look at this today to see why it cannot be applied.
> 
> Thanks for looking at it!
> 
>>I can see clearly that
>>all the prerequisite patches have *not* been applied to master yet, so I can
>>understand why Anthony cannot pull this up yet. Specifically, the series that
>>consolidates PIIX3 and PIIX4 south bridges is not yet applied, and that is one of
>>the prerequisites. I think you said it was reviewed, but it apparently never got
>>pulled up into master.
> 
> Correct, the PIIX consolidation series isn't merged yet. This series currently depends on it to avoid merge conflicts but doesn't need it otherwise. Back then I anticipated that the consolidation series would land in master soon since it was fully reviewed before this one. But that turned out not to be the case.
> 
> This series depends on some necessary refactoring [1] which I did in the context of PIIX consolidation which is already in master. So this series can easily be rebased onto master and it even simplifies the consolidation series a bit. I'll take this route now and I'll post a v3.

Thanks for posting v3, I was at a loss trying to figure out how to merge the 30-patch piix
consolidation series into the master branch. I just tested your recent v3 (all 6 patches)
on top of the current master branch and it works well on my Xen guests, so you can keep my
Tested-by tag on that patch series!

Kind regards,

Chuck

