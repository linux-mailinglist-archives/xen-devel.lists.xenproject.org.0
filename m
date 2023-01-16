Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADCF66CE32
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 19:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478916.742426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHTnG-0005b2-2h; Mon, 16 Jan 2023 18:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478916.742426; Mon, 16 Jan 2023 18:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHTnF-0005Xz-Vu; Mon, 16 Jan 2023 18:01:13 +0000
Received: by outflank-mailman (input) for mailman id 478916;
 Mon, 16 Jan 2023 18:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qEJY=5N=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pHTnD-0005Xt-W4
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 18:01:12 +0000
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb70bc0e-95c7-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 19:01:01 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Mon, 16 Jan 2023 18:00:58 +0000
Received: by hermes--production-ne1-5648bd7666-6sqtt (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b5a3654a4a17fc5e6bbb86087b8d1b15; 
 Mon, 16 Jan 2023 18:00:55 +0000 (UTC)
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
X-Inumbo-ID: bb70bc0e-95c7-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1673892058; bh=quuGlmQoUYU2Da08/Oab2pCw2jCrmaGkCeJHfrrqCMw=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=l1v2tfn0ZVlt1DBgdi2Vm59qXVqQ6mYolWog+DFgej5vyjkf76866PCIEDZmJStXxxHXLd0s0t0Qv90uPzmbeM3YK5a8AJahjoEjb5Eo/l/jOCNPmex0Wdrn6VnoKrR6jPW2/WV98YoD99a/ceI9RwLygGFZJyX8CSitv9gNA048QWMoo7WkutfAKdUYtAHJGOu161H0FYTCWtpb4+WKWwk9DGZPofMORoTrvMI03+WQoUQOmUdJRX1qNNJOsoYuTfEEcytOruqute+ci8AGvnCLnYGzHwwyfzo7cJlpyPtXI2g7BHe4dJBO8XuH57Vi1BB9gMCwGFE5yACkKNraug==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673892058; bh=5RFQ6OFnIsbnY1yBI5QaVWdT1fCtbI9NM9A1AlrANEZ=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=MOeTQ0hMge0V3yb4nNAOf//CljYrDYVVc+DcjTHQLrEDa8QJDJc+y+Htkiy2L6GxPMAC1fNpJrumhRDRnMXI/9C2bWM9QyZCg2aa3K5x0O6G9YOxNRwVnw08bi6ycr4UrmcZK9vxx+FNuQSyLyFvppNId8MsnftNhDMpty1glpKjKEZs6HSv+NMeeVMuvYJPTCmvQrvrMLdCdUVJ6ppVI1yO4ayltI0ou6pw5Z/SIeV/L2l061nyqKNNMX0sQ2xWH4u40oqPykPh6pnxQrSEQLxeW1Pci4IWvcd5VzNTZCNe4BZwOrz16Yn/TijJJiadeTbNyN0vrmRpGpP1zcxBxQ==
X-YMail-OSG: JQ6OTrQVM1lFPBUbQmhSvV7AorbG7EtFTXBG_1t9E9LK51w5GweQxlPvfHFYzmb
 gvIl5L4Z7HnAfbIoaA6is0YnuTZqa.uYHNCBRAP7r0DjV4IDfMZCpt5oWPBQuC3m5x5cIlobx05X
 GB2HI6YeQftvGwh3uFs_eIZUuS1bCDHsY3JTR9ta_y0l4mSNMHh_nsuCbzA_kIAOQ1bOunwuM1EF
 17nt3YqrwZ6.5mB9BTB0RgDJ3qImJ8XRJytF4jTeAeBQquy5nz9AFaYz._fgEugPzoY5aFwvaaTH
 0IDROHFys3PhwbE7iKKTUcHuPKCkhL_e1QoQ_X4BjvTsXzRW60np4gK0Age.znk4QnoCu5O7glEp
 vcfHws7yJAWGW2TH.zvLYacPKV.guaNS06KtqhZlIOPHp.ENRe83Dh1l85khrohGzWtRITRK3s1n
 .oN0z3BdrTjlho7Hcd027rAPuxqxdPYwSxPXXACnU2Z2cOwQkdztZHNtdtYQ6JIBes00_sMBeKiL
 LR7MERbQ_yMTaKhxxGGgMi.GyBL9WJSa4a79mJp8S2cNxAYp_jaeuQwXyskyRDr02LJodvsr_Mws
 6UK4lO._hcnQZC_gOgvlB6pQhCNaSZjvOkbJrVMUZ1UrsPX1zBnP1qtMp.0kN5J.GddYyKni1igv
 d1V1OM480V9doRIIZXcw8crRx0fxExtqypwaIn5PoVdxdxRlicByGO4Bg_c1pqrIR7YMZ8BmkJOl
 SdanhLBMyPbH7I5YEOK9Hxlr.fPP15jCswerangJP2bMyhj8Ui5fJcyBmaxnYDwjjEoUX_I0fzct
 F5OZU6dLP45jFpj0.OotQic3FbF1vowim6564sHgzW9wP4pYCRYlqzRlgG5vS5o1azeyv9gvL2TF
 sv1vfRbmY_lO_IMTrG_UKetezef6Tjqu2jKcgmk.XS3P2CGYnxYfusgjQvegZV3pbLcnuXU_qghD
 hoZSUv5hCAE_4vWz14PE3SsL_pbux8I1Y.AhMprr7VJj9a3PL_kKGG3aXIkCxohRK.OhShxOYwdi
 K9LaFEq3WTDVlHBDcQPSzedk0bYzwxEGDfiKTRpAZqkEjRVkMiWvzO8ZXtDt_mAuAem6bWcCTJXn
 groWXlf25Xjdjm5lbWFGg8o34tSu54DW0TxREYHUEM4bfHTEEuLCRPXvTQWnlre6GKCRA0xU1ezK
 prnl2BTrO.1NGg.mgUkUHVuotyJoOwS4JGugkqRFEnbpaw5vRincnJK06rZiy7rMAZxQVad9Osld
 PJTEYd7Yuaqppa_gXpbhclqD7wtVhEsfrb79T9SzBHwhXbBumm.Ep_u.qXNh.WpqQEaMgrH403yp
 FL6V8.EFSs3pOGYRCOJpIHblASavl1mfQYwomsakuxPjJ8spZs521ywrMkrW8ljhimCly..dr.KW
 28Doic4D.UFjqIeLzmV_Xwt3eMcun2qRzOQGjcUlP9yeGV1tgGZ.SCnQUZQ5eHbKfB3bZT6CaJ8K
 9_vsKAYsQBoT71TzwCQq_JQx2Es.C.r_huXv6mwEERH2MCOzA2ZTkUtkA6G1GO31HLjIzu2uUZ8j
 aWqNAh57SgGD.4dth.WuwUU8xb_5FkUKR3cKVx4fjm6nHzGjw28R_oe.1xPnHC_KQfSyNM9R9zOh
 Is.9VbC5pgzLZ.bt8nQyuEoP.AKs4LLL7s6KxXSTlaarDrprwOtc2fnQxD_8IBtnG.Mzg2.6grWP
 SjVxIZK5lJYtn1rqwMtzp.yO.x3LW6rM04IlCyX7bC5QpRmsgsjT7KJJuzZtVy_40nLBUdNJPHIR
 6pXHJjHLdH1pV5A3kpYUnra2NRupmj8HXc82gfknNz0eX219Fo2mFOmOJ7WHLknUJuwBxIAP_YnI
 pxLk8MHh6X_kBLtJOpgv3mAoAYmYqptQLgr3SSU5hCvz7kibTtqZmQtxMN1aQ0rcjfSbIMhcZUPM
 0W_au3oedj8ti5SwfJSKmMI9XiNqC_rW63sNXE3h9P0gmZ4uzmNtmaezfyn6Mim2PaIKIXbnCHKO
 0Z1zsiyeY3Y5LftTiSipMHS7Qhp_ZRJ1Io.ZwgIE.Wlef0M9ayQUdfnPH0j.fGLFUHlhGiIrp.SK
 vloBWYJVTbF_Scw_Z6pd__EVpH5ZZmx_nwDp4eO7.z9qc8upKovImWsjBMI0ZnbCiASrMfW_xGjr
 N1mGoA4ASVm6RjRbTYtclMsWTCoqcaCazHvf7LbTJt7Hl8qTbQJCi5YnKke98hWLbc3NHn5XTBLv
 ckUy8gFhwMWRT23ZvNnRF_4B.
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <fce262ea-e0d5-d670-787c-62d91b040739@netscape.net>
Date: Mon, 16 Jan 2023 13:00:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Anthony Perard <anthony.perard@citrix.com>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
 <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
 <20230110030331-mutt-send-email-mst@kernel.org>
 <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
 <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
 <9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
 <7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
 <20230112180314-mutt-send-email-mst@kernel.org>
 <128d8ee2-8ee9-0a76-10de-af4c1b364179@aol.com>
 <20230113103310.3da703ab@imammedo.users.ipa.redhat.com>
 <88af50cb-4ebd-7995-70cf-f23ac33c5e45@aol.com>
 <20230116163342.467039a0@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <20230116163342.467039a0@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21062 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/16/23 10:33, Igor Mammedov wrote:
> On Fri, 13 Jan 2023 16:31:26 -0500
> Chuck Zmudzinski <brchuckz@aol.com> wrote:
> 
>> On 1/13/23 4:33 AM, Igor Mammedov wrote:
>> > On Thu, 12 Jan 2023 23:14:26 -0500
>> > Chuck Zmudzinski <brchuckz@aol.com> wrote:
>> >   
>> >> On 1/12/23 6:03 PM, Michael S. Tsirkin wrote:  
>> >> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote:    
>> >> >> I think the change Michael suggests is very minimalistic: Move the if
>> >> >> condition around xen_igd_reserve_slot() into the function itself and
>> >> >> always call it there unconditionally -- basically turning three lines
>> >> >> into one. Since xen_igd_reserve_slot() seems very problem specific,
>> >> >> Michael further suggests to rename it to something more general. All
>> >> >> in all no big changes required.    
>> >> > 
>> >> > yes, exactly.
>> >> >     
>> >> 
>> >> OK, got it. I can do that along with the other suggestions.  
>> > 
>> > have you considered instead of reservation, putting a slot check in device model
>> > and if it's intel igd being passed through, fail at realize time  if it can't take
>> > required slot (with a error directing user to fix command line)?  
>> 
>> Yes, but the core pci code currently already fails at realize time
>> with a useful error message if the user tries to use slot 2 for the
>> igd, because of the xen platform device which has slot 2. The user
>> can fix this without patching qemu, but having the user fix it on
>> the command line is not the best way to solve the problem, primarily
>> because the user would need to hotplug the xen platform device via a
>> command line option instead of having the xen platform device added by
>> pc_xen_hvm_init functions almost immediately after creating the pci
>> bus, and that delay in adding the xen platform device degrades
>> startup performance of the guest.
>> 
>> > That could be less complicated than dealing with slot reservations at the cost of
>> > being less convenient.  
>> 
>> And also a cost of reduced startup performance
> 
> Could you clarify how it affects performance (and how much).
> (as I see, setup done at board_init time is roughly the same
> as with '-device foo' CLI options, modulo time needed to parse
> options which should be negligible. and both ways are done before
> guest runs)

I preface my answer by saying there is a v9, but you don't
need to look at that. I will answer all your questions here.

I am going by what I observe on the main HDMI display with the
different approaches. With the approach of not patching Qemu
to fix this, which requires adding the Xen platform device a
little later, the length of time it takes to fully load the
guest is increased. I also noticed with Linux guests that use
the grub bootoader, the grub vga driver cannot display the
grub boot menu at the native resolution of the display, which
in the tested case is 1920x1080, when the Xen platform device
is added via a command line option instead of by the
pc_xen_hvm_init_pci fucntion in pc_piix.c, but with this patch
to Qemu, the grub menu is displayed at the full, 1920x1080
native resolution of the display. Once the guest fully loads,
there is no noticeable difference in performance. It is mainly
a degradation in startup performance, not performance once
the guest OS is fully loaded.

> 
>> However, the performance hit can be prevented by assigning slot
>> 3 instead of slot 2 for the xen platform device if igd passthrough
>> is configured on the command line instead of doing slot reservation,
>> but there would still be less convenience and, for libxl users, an
>> inability to easily configure the command line so that the igd can
>> still have slot 2 without a hacky and error-prone patch to libxl to
>> deal with this problem.
> libvirt manages to get it right on management side without quirks on
> QEMU side.

I think the reason libvirt/kvm gets it right is simply because the
code implementing the libvirt/kvm approach got more attention and testing
than the code that implements the libxl/Xen approach. This patch
really represents what should have been done when support for the
igd-passthru=on option for xenfv machines was added seven years ago,
but the code was apparently added without much testing and is stale now
and needs this fix which is entirely implemented in either files maintained
by Xen maintainers or, in the case of the small patch to pc_piix.c,
entirely within a section guarded by #ifdef CONFIG_XEN. Not much
maintenance burden for hw/i386 maintainers.

> 
>> I did post a patch on xen-devel to fix this using libxl, but so far
>> it has not yet been reviewed and I mentioned in that patch that the
>> approach of patching qemu so qemu reserves slot 2 for the igd is less
>> prone to coding errors and is easier to maintain than the patch that
>> would be required to implement the fix in libxl.
> 
> the patch is not trivial, and adds maintenance on QEMU.

For all practical purposes, the only additional maintenance would
be handled by Xen maintainers, and the Xen maintainer of the Xen
files being patched gave a Reviewed-by to an earlier iteration of
this patch. So I think the decision about the maintenance cost of
this patch should be made by the Xen maintainers. In fact, if I
were a Xen maintainer, I think this patch to Qemu would be much
easier for the Xen maintainers to maintain than the proposed patch
to libxl to fix this. So ultimately, I think it makes sense for
the Xen maintainers to decide on the maintenance cost. So far
they have not weighed in since the Reviewed-by that Anthony
gave to an earlier iteration of this patch. So far, they have
not responded to my patch to libxl, and I don't blame them because
that would be more difficult for them to maintain than this patch
to some of the Xen-specific code within Qemu.

For reference, the patch for libxl that fixes this is here:

https://lore.kernel.org/qemu-devel/20230110073201.mdUvSjy1vKtxPriqMQuWAxIjQzf1eAqIlZgal1u3GBI@z/

> Though I don't object to it as long as it's constrained to xen only
> code

It already is constrained to Xen only code - the small patch to
pc_piix.c is entirely guarded by #ifdef CONFIG_XEN.

and doesn't spill into generic PCI.

In comments on an earlier iteration of this patch, Michael indicated
he would not object a patch to core pci if it added some useful
functionality.

Michael, do I misunderstand you?

I have already proposed a patch that does that, which, if accepted,
would address the objection that unconditionally reserving the slot
during initialization is not desirable. He pointed out that a patch
to core pci could fix that, and I have proposed such a patch,
independent of this patch, here:

https://lore.kernel.org/qemu-devel/ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com/

> All I wanted is just point out there are other approach to problem
> (i.e. do force user to user to provide correct configuration instead
> of adding quirks whenever it's possible).
> 

I disagree that the default configuration should configure the hardware
in a way that does not conform to the requirements of the device and thereby
force users to add non-default settings to configure the machine correctly.
That is simply not being friendly to Xen users of Qemu, and that,
unfortunately is what Qemu code currently does and has done for the
past seven years as regards the configuration by Qemu of igd passthru on
Xen. IMO, it is unreasonable to not fix this, and since the fix can be
implemented in entirely Xen-specific code, I hope and expect that
eventually the Xen maintainers will fix this. I hope they are just waiting
until I implement the fixes that you and Michael have requested which
are mostly reasonable and admittedly, not completed yet.

Perhaps this approach is what you call a "quirk" because of the limitations
of how slot_reserved_mask works. That can be fixed by patching core pci.
That, IMO, is the best and most maintainable way to fix this.

So my plan is to wait and see how my proposed patch to core pci is received.
If it gets accepted, I will do a v10 of this patch which will use the
improved management capability added by the patch to core pci that addresses
the concerns that this patch will interfere with the libvirt/kvm approach
of manually assigning the slots by causing the slot_reserved_mask to
only take effect when the device being added is configured for auto
assignment of the slot address. When libvirt adds a pci device to a xenfv
machine configured for igd-patthru, my proposed v10, with the patch to core
pci as a prerequisite, will not introduce any change to how Qemu configures
the machine in response to a libvirt configuration that manually assigns the
slot addresses.

I do accept that v8/v9 of the patch is stalled, and I am working to address
all the concerns being raised here. Thanks for your comments!

Kind regards,

Chuck

