Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D03534431
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 21:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337358.561921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntwdw-0007OL-Vn; Wed, 25 May 2022 19:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337358.561921; Wed, 25 May 2022 19:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntwdw-0007LE-SU; Wed, 25 May 2022 19:26:04 +0000
Received: by outflank-mailman (input) for mailman id 337358;
 Wed, 25 May 2022 19:26:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7G08=WB=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1ntwdt-000759-J7
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 19:26:02 +0000
Received: from sonic304-25.consmr.mail.gq1.yahoo.com
 (sonic304-25.consmr.mail.gq1.yahoo.com [98.137.68.206])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80d74aef-dc60-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 21:25:59 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Wed, 25 May 2022 19:25:57 +0000
Received: by hermes--canary-production-bf1-856dbf94db-flf4d (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 71f1d64437d4ce01e2d3c39def3c457f; 
 Wed, 25 May 2022 19:25:53 +0000 (UTC)
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
X-Inumbo-ID: 80d74aef-dc60-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1653506757; bh=CqSeobj0+5OSFGPYrNmN6IIV1PtHre5LbZFH1gf5kWY=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=MYrUvxfXbRz/ymusizK41DG+kcUNIndp8n+3lwgzUH5HQEdnrnGrGlcCH7VgUXyMVuqo+8z2r95iFLiqExFxTWLaJwQt0GKK9risua060H6lNvRLsBeRZXGzZxXpJsW5oftiYFjssDGdH85aCVBujiEEtsCZUonXNC2T4ZFfxV0CLR0FprYRfvP8zmxLOFO/Y0lhSP6KJZs/0u346LG0rfAnau85B6CF/+BC8iGhoXcW8XXGtxKl98OaZjeBgBFEKIS3ZePxLCi8XjH0cKnZIr4A7aTsx1h1KFDntXvuHLNJOjetG/iDGtcWQ0Pe3hMciytfsp069otjj6hLAqs28w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1653506757; bh=wZXN4K6+z3p6ahdKNw4lPDfOu4i/i67NYSfuSnzPXqK=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=ddBm+EQa5x7yx+2Dsf8D8h6rcJXoXoBJqQJ+zPYeWmqfKZGkasM3mXyci7cpLaOSjkZzG11galPEgq3Ymj2u9jNv56oiS2cM6IcgckTEe7uvl7L+jIhDWQ8XkFxcJ0MlSRVVl0wwv0Z4TZytVcu4bhFuad2S6ZGrC8t0y5rlOVaFWt3GlNK36cngcv7a9UCjXpb2GDxJ1+fP0ISSFriS/a9SCmF2UtGJBoOCAjCE7z0+A8zI9WwK9t1MAEffCHJKpiE3L4JmsocefQWnN/k7CQzdJt6bs3Jd2cCcK+KR7e+P9klNh7/bNZodedYShmA9eTO78l3xIqpsAWUAd66MWg==
X-YMail-OSG: bG1wjyQVM1kgs5ozPVs6xfKrqT7Xxx9Lwqs6A0PdCa9mHjR4sgvMH2a8gWk7lEf
 pJfMk1EoiwTwnMxEQynVYO5VOOiZdvw265ZUVeAgY3Xd3iXU9sGCx6.fsm3ZKjmgUBlHQtBoLhDZ
 M0LZ8_MepTQ__dwrxobBmoufx7qdjhcn6qlpF9mGFqvXPQMQC4u6sQII9_xf3fGPL_C0DMvnjh5y
 ImiZ94nwCEHiwTLbxAkP.qwdvyDKGN4fqigSCoz_wU9KSg9_mW44TdFlZ2L6Z9fbp9yRuhEJRouQ
 9A3pBzoXNSw9wbYM.8YcIgF8EK6gcuIfTywqRkeyClMGsKUcsk0ZHFkzqtQVW6oGaj7CAA24pIAq
 6wVyr9uckZ2uNAuaP2ccrgvVWPqQGqW7jZnRWE.UBlnCSncj56KvW7nkkxMgi.FDFy1m1xPVsh9y
 3dDxq2ox9f7oRbrVeeihuupDwZPEWh0VAL0KX5mfh4YTcBvi5oBTaJT8QAHZhicuYXDpRZ8gsJ3T
 vAVSLwy.J0D4mj7h0kYQwg6hel4ULy.pwzzPgbjd8ZkKQ4im9FWBDG8j.9HvnvOyC4ivXpQAQFvH
 mHXXQeOQP9VXkUL8kXM7bRfZQSkiV4q36BC14WLuxeDhva1h5RxNOO9z3C_3BaPc3DXmU4zPAER9
 sK2fGGLGrzhcQrXq.B2lflhPeHXVBpD7sxzSGZYzHm0YxtADqCEX3D4pFh71_3OX3Ga22PAND_9p
 WSaOorVbZqITmt6fxpQuAs2vku4nKrz_g0IpCKejbGEyCjAzqoJ0JYlorxMXTbA1fDd6k4obdGBJ
 FB8ogdTr5484.g4m8jeBoLSxFRBwP3NRKCBs4pXAPSa3sF6FEqLR7i9BBcxL_jmk_X6hH7xXcEtH
 T7RrqY4OGuIOeTU_gFclTML2pFzmk2vY6vBjKw.crk8MpBpIrNBh3sqHq3.ABRTvEFR6FudPulbB
 B3M_Vq1rmnATHcyklZgKHpiLi__VOemJDANdTX0qP.MyFSFj30u2ACGSf6qKQ_dcfMpVT7rArU7D
 ygX.0pYgB.Au46qjr5yzlTc8I9FZNkz6OS7qC_cb_xcQzMjZLMnNY_p9ztbyrMNHKIY4R6Rd04Pa
 CTIYN4CmGr7zWO4NEz62OFVdiEAHRgKCEFy5GDSwIcBi01PKZTAJdAKTfXf95EIHR.JvRkZ2L44w
 uyR_zZdo0rDx9Gk3cE4_EfZvARqXDB0NiCIW5.p7Cos_H3LjzsRHBh2PzF1cCfAJ_z9q5spzZDMl
 nKz2oJhbQuG8ct9r0.IFonDYDWSM94xWQrWTL4PchTfXRNTBnDObo_6Ool3rAwjWgK2ay_iL7cjI
 x924Gb0TNaIJHYQcdbYpg4Ar27qEBUNv48ujpQnC2H2i4XeowzOpy6puXSjbRJtZfG5jx4kIohxc
 4N3SL5pLSGVn7yMjsUKBxWsOFmczf2d8ANCb.qAmc8wT2.DBteg7P0vKzUQOg1RrPizuBR7vFapD
 XaqGEP63LcCSisysvM8f_0sfj1eMrwSUQQGqzPoIJMh4kjT4SAJUiQ7S0UWFEXUyAVKbV2VLat78
 .BcMothVtvGIYYrYn6kIyzwEjRtzrBCe52uhDDObwCebkODL1HcCVJJEFj9lgj86tKXbfdvk5H6z
 770LiPVxm.08K4AaMPKNrsvJV7DhESNx9IaXZoV7CIuHYl7MVfHcPVKvW.jRio5jWV5qGeZj0s.d
 BE_8JAEjDwrj35X.v2Y8lq1By0fXlrNoh9qBy5EM_c_rePqqYSbd3KPUX_b72SpHY1i_Rt92Uu.v
 Lo4fqZuwit9Zp3nSw1RASZgWCWvJv5xKtjlSzaYIJG0GRENiSfgHvUvAMPWyaAuDcTzsJL2eAa_Y
 htCXSKsUXTc3.IUM0EXt2s5QpHqHoVRV5w2RwqjMmKpeAQ2YbSBpsMg0AK0R2DTBvZZHyNU8O6rt
 lzhHguC_nR2Tl4ptalLpm7ks2d5mtBxyZAoQh80CdFQi_vYgPn_WAXKzs64EEbpCo3QW_wKEwl5S
 X0XO5cv8S_Kl5iB2A.J9eUoJ2pBWt4M1IkcQJM7gyKP_.atmuehdHkoXiV9kkMtzCE6ixnNTcIeX
 XqqyRudrgRz8Lo_2G46B7_kZXj3MFO2vDu2SDOpactByeIAkBpLjy7sMQ492NDDlSnx3UY4vzlEy
 mttTpT01FKuu1hXwTGrV82mKFzbJINW49gprb1.HcO2Bt948cy1f2jtANKDwCm1ZhrZMTTUFdpgD
 9y6KaJTb5.Vs-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <db84f9b6-be48-ba92-5941-b71b9ce87428@netscape.net>
Date: Wed, 25 May 2022 15:25:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Jan Beulich <jbeulich@suse.com>, regressions@lists.linux.dev,
 stable@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Juergen Gross <jgross@suse.com>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
 <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>
 <0dcb05d0-108f-6252-e768-f75b393a7f5c@suse.com>
 <77255e5b-12bf-5390-6910-dafbaff18e96@netscape.net>
 <a2e95587-418b-879f-2468-8699a6df4a6a@suse.com>
 <8b1ebea5-7820-69c4-2e2b-9866d55bc180@netscape.net>
 <c5fa3c3f-e602-ed68-d670-d59b93c012a0@netscape.net>
 <3bff3562-bb1e-04e6-6eca-8d9bc355f2eb@suse.com>
 <3ca084a9-768e-a6f5-ace4-cd347978dec7@netscape.net>
 <9af0181a-e143-4474-acda-adbe72fc6227@suse.com>
 <b2585c19-d38b-9640-64ab-d0c9be24be34@netscape.net>
 <dae4cc45-a1cd-e33f-25ef-c536df9b49e6@leemhuis.info>
 <3fc70595-3dcc-4901-0f3f-193f043b753f@netscape.net>
 <eab9fdb0-11ef-4556-bdd7-f021cc5f10b7@leemhuis.info>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <eab9fdb0-11ef-4556-bdd7-f021cc5f10b7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20225 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 5/25/2022 3:45 AM, Thorsten Leemhuis wrote:
> On 24.05.22 20:32, Chuck Zmudzinski wrote:
>> On 5/21/22 6:47 AM, Thorsten Leemhuis wrote:
>>> On 20.05.22 16:48, Chuck Zmudzinski wrote:
>>>> On 5/20/2022 10:06 AM, Jan Beulich wrote:
>>>>> On 20.05.2022 15:33, Chuck Zmudzinski wrote:
>>>>>> On 5/20/2022 5:41 AM, Jan Beulich wrote:
>>>>>>> On 20.05.2022 10:30, Chuck Zmudzinski wrote:
>>>>>>>> On 5/20/2022 2:59 AM, Chuck Zmudzinski wrote:
>>>>>>>>> On 5/20/2022 2:05 AM, Jan Beulich wrote:
>>>>>>>>>> On 20.05.2022 06:43, Chuck Zmudzinski wrote:
>>>>>>>>>>> On 5/4/22 5:14 AM, Juergen Gross wrote:
>>>>>>>>>>>> On 04.05.22 10:31, Jan Beulich wrote:
>>>>>>>>>>>>> On 03.05.2022 15:22, Juergen Gross wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> ... these uses there are several more. You say nothing on why
>>>>>>>>>>>>> those want
>>>>>>>>>>>>> leaving unaltered. When preparing my earlier patch I did
>>>>>>>>>>>>> inspect them
>>>>>>>>>>>>> and came to the conclusion that these all would also better
>>>>>>>>>>>>> observe the
>>>>>>>>>>>>> adjusted behavior (or else I couldn't have left pat_enabled()
>>>>>>>>>>>>> as the
>>>>>>>>>>>>> only predicate). In fact, as said in the description of my
>>>>>>>>>>>>> earlier
>>>>>>>>>>>>> patch, in
>>>>>>>>>>>>> my debugging I did find the use in i915_gem_object_pin_map()
>>>>>>>>>>>>> to be
>>>>>>>>>>>>> the
>>>>>>>>>>>>> problematic one, which you leave alone.
>>>>>>>>>>>> Oh, I missed that one, sorry.
>>>>>>>>>>> That is why your patch would not fix my Haswell unless
>>>>>>>>>>> it also touches i915_gem_object_pin_map() in
>>>>>>>>>>> drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>>>>>>>>>>
>>>>>>>>>>>> I wanted to be rather defensive in my changes, but I agree at
>>>>>>>>>>>> least
>>>>>>>>>>>> the
>>>>>>>>>>>> case in arch_phys_wc_add() might want to be changed, too.
>>>>>>>>>>> I think your approach needs to be more aggressive so it will fix
>>>>>>>>>>> all the known false negatives introduced by bdd8b6c98239
>>>>>>>>>>> such as the one in i915_gem_object_pin_map().
>>>>>>>>>>>
>>>>>>>>>>> I looked at Jan's approach and I think it would fix the issue
>>>>>>>>>>> with my Haswell as long as I don't use the nopat option. I
>>>>>>>>>>> really don't have a strong opinion on that question, but I
>>>>>>>>>>> think the nopat option as a Linux kernel option, as opposed
>>>>>>>>>>> to a hypervisor option, should only affect the kernel, and
>>>>>>>>>>> if the hypervisor provides the pat feature, then the kernel
>>>>>>>>>>> should not override that,
>>>>>>>>>> Hmm, why would the kernel not be allowed to override that? Such
>>>>>>>>>> an override would affect only the single domain where the
>>>>>>>>>> kernel runs; other domains could take their own decisions.
>>>>>>>>>>
>>>>>>>>>> Also, for the sake of completeness: "nopat" used when running on
>>>>>>>>>> bare metal has the same bad effect on system boot, so there
>>>>>>>>>> pretty clearly is an error cleanup issue in the i915 driver. But
>>>>>>>>>> that's orthogonal, and I expect the maintainers may not even care
>>>>>>>>>> (but tell us "don't do that then").
>>>>>>>> Actually I just did a test with the last official Debian kernel
>>>>>>>> build of Linux 5.16, that is, a kernel before bdd8b6c98239 was
>>>>>>>> applied. In fact, the nopat option does *not* break the i915 driver
>>>>>>>> in 5.16. That is, with the nopat option, the i915 driver loads
>>>>>>>> normally on both the bare metal and on the Xen hypervisor.
>>>>>>>> That means your presumption (and the presumption of
>>>>>>>> the author of bdd8b6c98239) that the "nopat" option was
>>>>>>>> being observed by the i915 driver is incorrect. Setting "nopat"
>>>>>>>> had no effect on my system with Linux 5.16. So after doing these
>>>>>>>> tests, I am against the aggressive approach of breaking the i915
>>>>>>>> driver with the "nopat" option because prior to bdd8b6c98239,
>>>>>>>> nopat did not break the i915 driver. Why break it now?
>>>>>>> Because that's, in my understanding, is the purpose of "nopat"
>>>>>>> (not breaking the driver of course - that's a driver bug -, but
>>>>>>> having an effect on the driver).
>>>>>> I wouldn't call it a driver bug, but an incorrect configuration of the
>>>>>> kernel by the user.  I presume X86_FEATURE_PAT is required by the
>>>>>> i915 driver
>>>>> The driver ought to work fine without PAT (and hence without being
>>>>> able to make WC mappings). It would use UC instead and be slow, but
>>>>> it ought to work.
>>>>>
>>>>>> and therefore the driver should refuse to disable
>>>>>> it if the user requests to disable it and instead warn the user that
>>>>>> the driver did not disable the feature, contrary to what the user
>>>>>> requested with the nopat option.
>>>>>>
>>>>>> In any case, my test did not verify that when nopat is set in Linux
>>>>>> 5.16,
>>>>>> the thread takes the same code path as when nopat is not set,
>>>>>> so I am not totally sure that the reason nopat does not break the
>>>>>> i915 driver in 5.16 is that static_cpu_has(X86_FEATURE_PAT)
>>>>>> returns true even when nopat is set. I could test it with a custom
>>>>>> log message in 5.16 if that is necessary.
>>>>>>
>>>>>> Are you saying it was wrong for static_cpu_has(X86_FEATURE_PAT)
>>>>>> to return true in 5.16 when the user requests nopat?
>>>>> No, I'm not saying that. It was wrong for this construct to be used
>>>>> in the driver, which was fixed for 5.17 (and which had caused the
>>>>> regression I did observe, leading to the patch as a hopefully least
>>>>> bad option).
>>>>>
>>>>>> I think that is
>>>>>> just permitting a bad configuration to break the driver that a
>>>>>> well-written operating system should not allow. The i915 driver
>>>>>> was, in my opinion, correctly ignoring the nopat option in 5.16
>>>>>> because that option is not compatible with the hardware the
>>>>>> i915 driver is trying to initialize and setup at boot time. At least
>>>>>> that is my understanding now, but I will need to test it on 5.16
>>>>>> to be sure I understand it correctly.
>>>>>>
>>>>>> Also, AFAICT, your patch would break the driver when the nopat
>>>>>> option is set and only fix the regression introduced by bdd8b6c98239
>>>>>> when nopat is not set on my box, so your patch would
>>>>>> introduce a regression relative to Linux 5.16 and earlier for the
>>>>>> case when nopat is set on my box. I think your point would
>>>>>> be that it is not a regression if it is an incorrect user
>>>>>> configuration.
>>>>> Again no - my view is that there's a separate, pre-existing issue
>>>>> in the driver which was uncovered by the change. This may be a
>>>>> perceived regression, but is imo different from a real one.
>>> Sorry, for you maybe, but I'm pretty sure for Linus it's not when it
>>> comes to the "no regressions rule". Just took a quick look at quotes
>>> from Linus
>>> https://www.kernel.org/doc/html/latest/process/handling-regressions.html
>>> and found this statement from Linus to back this up:
>>>
>>> ```
>>> One _particularly_ last-minute revert is the top-most commit (ignoring
>>> the version change itself) done just before the release, and while
>>> it's very annoying, it's perhaps also instructive.
>>>
>>> What's instructive about it is that I reverted a commit that wasn't
>>> actually buggy. In fact, it was doing exactly what it set out to do,
>>> and did it very well. In fact it did it _so_ well that the much
>>> improved IO patterns it caused then ended up revealing a user-visible
>>> regression due to a real bug in a completely unrelated area.
>>> ```
>>>
>>> He said that here:
>>> https://www.kernel.org/doc/html/latest/process/handling-regressions.html
>>>
>>> The situation is of course different here, but similar enough.
>>>
>>>> Since it is a regression, I think for now bdd8b6c98239 should
>>>> be reverted and the fix backported to Linux 5.17 stable until
>>>> the underlying memory subsystem can provide the i915 driver
>>>> with an updated test for the PAT feature that also meets the
>>>> requirements of the author of bdd8b6c98239 without breaking
>>>> the i915 driver.
>>> I'm not a developer and I'm don't known the details of this thread and
>>> the backstory of the regression, but it sounds like that's the approach
>>> that is needed here until someone comes up with a fix for the regression
>>> exposed by bdd8b6c98239.
>>>
>>> But if I'm wrong, please tell me.
>> You are mostly right, I think. Reverting bdd8b6c98239 fixes
>> it. There is another way to fix it, though.
> Yeah, I'm aware of it. But it seems...
>
>> The patch proposed
>> by Jan Beulich also fixes the regression on my system, so as
>> the person reporting this is a regression, I would also be satisfied
>> with Jan's patch instead of reverting bdd8b6c98239 as a fix. Jan
>> posted his proposed patch here:
>>
>> https://lore.kernel.org/lkml/9385fa60-fa5d-f559-a137-6608408f88b0@suse.com/
> ...that approach is not making any progress either?

Jan's approach does fix it on my system. There was some debate
about what the kernel nopat option should do, though. I don't
have a strong opinion on that and would accept Jan's patch
as a fix.

>
> Jan, can could provide a short status update here? I'd really like to
> get this regression fixed one way or another rather sooner than later,
> as this is taken way to long already IMHO.

I hope something is done soon also.

>
>> The only reservation I have about Jan's patch is that the commit
>> message does not clearly explain how the patch changes what
>> the nopat kernel boot option does. It doesn't affect me because
>> I don't use nopat, but it should probably be mentioned in the
>> commit message, as pointed out here:
>>
>> https://lore.kernel.org/lkml/bd9ed2c2-1337-27bb-c9da-dfc7b31d492c@netscape.net/
>>
>>
>> Whatever fix for the regression exposed by bdd8b6c98239 also
>> needs to be backported to the stable versions 5.17 and 5.18.
> Sure.
>
> BTW, as you seem to be familiar with the issue: there is another report
> about a regression WRT to Xen and i915 (that is also not making really
> progress):
> https://lore.kernel.org/lkml/Yn%2FTgj1Ehs%2FBdpHp@itl-email/
>
> It's just a wild guess, but bould this somehow be related?

It could be, but I do not run a GUI in my Xen Dom0, so I have not
seen that issue.

Best regards,

Chuck

