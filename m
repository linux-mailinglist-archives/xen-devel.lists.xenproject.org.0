Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F398680350
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 01:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486459.753789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMIBj-0006HN-LK; Mon, 30 Jan 2023 00:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486459.753789; Mon, 30 Jan 2023 00:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMIBj-0006F4-IP; Mon, 30 Jan 2023 00:38:23 +0000
Received: by outflank-mailman (input) for mailman id 486459;
 Mon, 30 Jan 2023 00:38:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jy0V=53=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pMIBi-0006Ey-It
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 00:38:22 +0000
Received: from sonic313-20.consmr.mail.gq1.yahoo.com
 (sonic313-20.consmr.mail.gq1.yahoo.com [98.137.65.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62a345e5-a036-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 01:38:18 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Mon, 30 Jan 2023 00:38:15 +0000
Received: by hermes--production-ne1-746bc6c6c4-b28lr (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 11cce946b55ddb623c33b98cbbbc1855; 
 Mon, 30 Jan 2023 00:38:12 +0000 (UTC)
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
X-Inumbo-ID: 62a345e5-a036-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1675039095; bh=Z1YRfJ9MJzzbL2OT5tKmtYqA6tEeZV38Lqsc4gptOkU=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=NdgdCxF0fWZVVAXJ+rJz41cFjS0SOrQrlts3tXMdpa6lv+QvW3h/PWbD5ZgO0m5Ya4oa6VXA9AOfAMzEW+3e/dU0RVXw/zk3zvU+AYJaw9WtZfFeGxcsAkos/T/f9tYC/v+H8rzHgkHt29khg6S90M2igYXHaXA+pg7VW8X23ZJkRNyW5yLno1v6I7yoEAGUp2dO52sZcsOynVG13ieGo8H3CoRP3nqMyYqA3h/4CQhuGqZna0wnpA3Py/oHVyAyaWTy5ei3BRjxa2RHgJRN9+oG/TeIm4WOzyPmOKr83vWbWRXqdcbo65ZEIXPe2O1oZVIXy/PfOOUR79ec40LiZw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1675039095; bh=Roxfhryd3dMDVMT8R0d19nWF/nLhCq/9FObQ2+MU/Q8=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=LQJaPe77AMWV27Mz715x5yQrCq0+qjCIiR0x0B7dv+mDl0IFc8WffYd/bDWzmnTS/eB8xYzpe2ozlwQd5Q4r6WKz/a5taPRhjTtTQGZmgOXIY3YAE1DmnX1l0CsvMRkHn0ZiQ75G0uhZ/TGWFjkXKa+1qkd1emk7xNB04eAA68nPwRaOMpFr7DqKqpV7H2o3caV+3yqo+ExX4uZnVhGcMCVaO5i1JnIqbxL/08anUNiVpGFZY48/2l6HKLESuQVkR6MgluivtMKX5zBHwr8X57QiPOYE8hhuiYZ2jsV6J3PR9u6XfpYIgXZt0dfJ4svDhft1wGLr2gah3tISC4wACw==
X-YMail-OSG: 5z.wZlwVM1mKgr02M6._W7BcirUxhI6bnZMsEsVl4RMQPFWvo.rRNaIstk4gqbX
 NbZcsw7dHOqz_CDBnEbTGJy4xwrsdjdLnDxDebTI4kdPSTH9vD.9oj8mkp1XirohHKYw5okuxL1w
 KYQUtLWKhKTQ_l8EzVWqJx7aUqiLIjlIVFDRqW7i2k3hybZLjlSIey7_4oAo4RTwwE4w_IAaNVxk
 UymJ7k.SgF5909ca6H3PRPWYf58pVmPalMv5db2Bal3SA3Ns7oEmKttc8jTmEN1h33qywEAGkh4t
 D0EHgm7JG.HiWBJaubNhfcLnUY5O8AK.co59IC6rLRcKjzxWa3GWuiBmGZMwFlVUnEXGwLbmfxCL
 p3hXcr6mOBTOg_Szt_lLHh93d748e3RXb2TVWC6tOHjNud.Gd92wF532rV6GRSq4W_UYpFfAt8hJ
 SdMn3ViJg0uOu5uF..La_0deNkZoFCcAQoqNi5DoSvBRLdCuYeIWnCdvE0Gz9yezv66EidGRzya2
 _dlmJpnItacoMS3NJCzukqlLH7LpZJq97LHRsxu07MaDEsgf5GYsta6hWY3v8ScdUKbYOk2WMP7h
 Kk49E29e8KcV1vXkAhNZneANf15wbrouD1uJp33QSa93IuQwXk_wsoCQhbBcO_DvYkRNWaLpzivk
 3WoEZiPxZ.4EsLk466jTy5Blq0GH_IEAnzCtzji.jl.XvX.kM8iVPbQ2Gf7ZHIcKKBlwVofz.JWU
 0YIwwFhKfsVc5ApSlGMx_JonuzgnR4lG71uH9K39XXAxkHRoYxDioYJZpkhNAi1WQFKkoWJ4pOu_
 2flv9XLpNYm8thk12FdFn6r7fwuc4MTZivABSbPyOFaKh50JXTPuSD1PBKbTQudtkbclNAi62KId
 qyJiKwC.j7jPae5l.NmjdjWix9riPWdonQN63t7yNiB89t9aLJww5d82Fkfe4yphZpbH9VT3YSLr
 29FBXu_iIFYk4DDtFTH1zOsRFR1hJofoxMDi22WjqRaQALT_ErX_.9NHW6S5m_BEuPPZjk6sdND3
 t2tNKlK.tuHcy350j4MZ.Grswp_fnJzCtuMMelUNHy712TLSuNJkthb2rh4d4SUWfmiCQlC3DFN5
 .03y4eX15p3NKCPQOcclRSmOSCgiBmBi3n4nMG.PPnY5FNZbGLXk6BIsPltXbfJx9MnIde90t1RV
 9nP6n5Z8zqxJq1j9c3Q6xTyLXzMdpbHoqd0pERTkHJg5SCMtB5LfBQLg2eUiqy2ARguKGFhOYkFu
 M36nzAjmJ3ymRPAHjOeEV2obyUpGimj_diaHxHDoWB0kHc4CuY5yvX11Dqh6jQFJUI0fetCEaJHG
 IqIrtMFEuqOXz7QBLMjqpjmQoEEqDdtcYtR6TCCkeKWmELaBMVmuAEjT3ClBgf_VIdDnetNnNFRS
 txg0ew5VNZNYMqXeoE4empQBlEvHw_chFS7sAe3lDou6wA2uTX7sB0IHJjtPE7S8wOCL1GdpgQjo
 uz3hPnUPP3WvxH1CG3AMqBnmdbR4rouDpS_OBACM1HFxCk3AwGGiSxV5q4WVlUXp5XUC_jt0_hEi
 QaRfJYiWzDphe4AsLngmZa8NGEJ9QLHNpjfT2yD4pdF758nZWq0qWDEHfMLI.Ps92QJuIdKpHDlO
 xs461BUzr6M2iUXhZ.ceCGyL2QPJwflfxHhzW866qDRFT90xppvJYrrePpN5eAN5_c9nISK1Ru0v
 JoQaufkNSlZnMbjx_j.qOfgFThdXELzAtxuUyA27kXK..del0T47St0dA8wmKRn7SJIHfNlZnxlM
 hkQOc3TKGNe3eXpRMkSIAk1gbfWjUkC3SmJEAMbSMz.gR30YZh8OXCMtzes3uoCCCpO3y9wZzUXv
 UJfw33PTWiL7sQHpjPJu9hhamvAZqIkmIlDIdV8.Eg.cMy8xOD4h.U001hL419eMxR8CR6xpEquR
 RLX1_r6O6MeGq.MXV8pFu3kS0TL2ydFKq0X0my79Vr85ZKHn.R4GyfK6cwETU2_.0zv6HcweJZ4o
 QHjDQ2x2axFBQ4wSO_hqwwMqmQv27JEqgZpop3tJnlAupUPPfADkYsdEIjg.24am7LDfDp7rXPpC
 qOOaKdMNOLW9QFuG15BWSIwGCmoWtBsInIR3GppZ1mU.fSt7dYgJW0Bqj9l_fhBt_clajoaCkefy
 aKuiHaKUBrTEQEwJRqFm.71wer6ToZot7.Gs0hLT9SSoqP7F3dUilzY_lVb9HRa_TakHe1omn6bf
 7pA8z.bY-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <a2a927bd-a764-8676-68c9-4c53cb86af3e@aol.com>
Date: Sun, 29 Jan 2023 19:38:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH v2 0/3] Configure qemu upstream correctly by default
 for igd-passthru
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, qemu-devel@nongnu.org
References: <cover.1673300848.git.brchuckz.ref@aol.com>
 <cover.1673300848.git.brchuckz@aol.com>
 <Y9EUarVVWr223API@perard.uk.xensource.com>
 <de3a3992-8f56-086a-e19e-bac9233d4265@aol.com>
In-Reply-To: <de3a3992-8f56-086a-e19e-bac9233d4265@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21123 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/25/23 6:19 PM, Chuck Zmudzinski wrote:
> On 1/25/2023 6:37 AM, Anthony PERARD wrote:
>> On Tue, Jan 10, 2023 at 02:32:01AM -0500, Chuck Zmudzinski wrote:
>> > I call attention to the commit message of the first patch which points
>> > out that using the "pc" machine and adding the xen platform device on
>> > the qemu upstream command line is not functionally equivalent to using
>> > the "xenfv" machine which automatically adds the xen platform device
>> > earlier in the guest creation process. As a result, there is a noticeable
>> > reduction in the performance of the guest during startup with the "pc"
>> > machne type even if the xen platform device is added via the qemu
>> > command line options, although eventually both Linux and Windows guests
>> > perform equally well once the guest operating system is fully loaded.
>>
>> There shouldn't be a difference between "xenfv" machine or using the
>> "pc" machine while adding the "xen-platform" device, at least with
>> regards to access to disk or network.
>>
>> The first patch of the series is using the "pc" machine without any
>> "xen-platform" device, so we can't compare startup performance based on
>> that.
>>
>> > Specifically, startup time is longer and neither the grub vga drivers
>> > nor the windows vga drivers in early startup perform as well when the
>> > xen platform device is added via the qemu command line instead of being
>> > added immediately after the other emulated i440fx pci devices when the
>> > "xenfv" machine type is used.
>>
>> The "xen-platform" device is mostly an hint to a guest that they can use
>> pv-disk and pv-network devices. I don't think it would change anything
>> with regards to graphics.
>>
>> > For example, when using the "pc" machine, which adds the xen platform
>> > device using a command line option, the Linux guest could not display
>> > the grub boot menu at the native resolution of the monitor, but with the
>> > "xenfv" machine, the grub menu is displayed at the full 1920x1080
>> > native resolution of the monitor for testing. So improved startup
>> > performance is an advantage for the patch for qemu.
>>
>> I've just found out that when doing IGD passthrough, both machine
>> "xenfv" and "pc" are much more different than I though ... :-(
>> pc_xen_hvm_init_pci() in QEMU changes the pci-host device, which in
>> turns copy some informations from the real host bridge.
>> I guess this new host bridge help when the firmware setup the graphic
>> for grub.

Yes, it is needed - see below for the very simple patch to Qemu
upstream that fixes it for the "pc" machine!

> 
> I am surprised it works at all with the "pc" machine, that is, without the
> TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE that is used in the "xenfv"
> machine. This only seems to affect the legacy grub vga driver and the legacy
> Windows vga driver during early boot. Still, I much prefer keeping the "xenfv"
> machine for Intel IGD than this workaround of patching libxl to use the "pc"
> machine.
> 
>>
>> > I also call attention to the last point of the commit message of the
>> > second patch and the comments for reviewers section of the second patch.
>> > This approach, as opposed to fixing this in qemu upstream, makes
>> > maintaining the code in libxl__build_device_model_args_new more
>> > difficult and therefore increases the chances of problems caused by
>> > coding errors and typos for users of libxl. So that is another advantage
>> > of the patch for qemu.
>>
>> We would just needs to use a different approach in libxl when generating
>> the command line. We could probably avoid duplications.

I was thinking we could also either write a test to verify the correctness
of the second patch to ensure it generates the correct Qemu command line
or take the time to verify the second patch's accuracy before committing it.

>> I was hopping to
>> have patch series for libxl that would change the machine used to start
>> using "pc" instead of "xenfv" for all configurations, but based on the
>> point above (IGD specific change to "xenfv"), then I guess we can't
>> really do anything from libxl to fix IGD passthrough.
> 
> We could switch to the "pc" machine, but we would need to patch
> qemu also so the "pc" machine uses the special device the "xenfv"
> machine uses (TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE).
> ...

I just tested a very simple patch to Qemu upstream to fix the
difference between the upstream Qemu "pc" machine and the upstream
Qemu "xenfv" machine:

--- a/hw/i386/pc_piix.c	2023-01-28 13:22:15.714595514 -0500
+++ b/hw/i386/pc_piix.c	2023-01-29 18:08:34.668491593 -0500
@@ -434,6 +434,8 @@
             compat(machine); \
         } \
         pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, \
+                 xen_igd_gfx_pt_enabled() ? \
+                 TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE : \
                  TYPE_I440FX_PCI_DEVICE); \
     } \
     DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn)
----- snip -------

With this simple two-line patch to upstream Qemu, we can use the "pc"
machine without any regressions such as the startup performance
degradation I observed without this small patch to fix the "pc" machine
with igd passthru!

The "pc" machine maintainers for upstream Qemu would need to accept
this small patch to Qemu upstream. They might prefer this to the
other Qemu patch that reserves slot 2 for the Qemu upstream "xenfv"
machine when the guest is configured for igd passthru.

>>
>> ...
>>
>> So overall, unfortunately the "pc" machine in QEMU isn't suitable to do
>> IGD passthrough as the "xenfv" machine has already some workaround to
>> make IGD work and just need some more.

Well, the little patch to upstream shown above fixes the "pc" machine
with IGD so maybe this approach of patching libxl to use the "pc" machine
will be a viable fix for the IGD.

>>
>> I've seen that the patch for QEMU is now reviewed, so I look at having
>> it merged soonish.
>>
>> Thanks,
>>
> 

I just added the bit of information above to help you decide which
approach to use to improve the support for the igd passthru feature
with Xen and Qemu upstream. I think the test of the small patch to
Qemu to fix the "pc" machine with igd passthru makes this patch to
libxl a viable alternative to the other patch to Qemu upstream that
reserves slot 2 when using the "xenfv" machine and igd passthru.

Thanks,

Chuck

