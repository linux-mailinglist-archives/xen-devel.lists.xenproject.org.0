Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E86D67BC74
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 21:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484550.751169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKmFw-00012k-Pk; Wed, 25 Jan 2023 20:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484550.751169; Wed, 25 Jan 2023 20:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKmFw-00010Z-MJ; Wed, 25 Jan 2023 20:20:28 +0000
Received: by outflank-mailman (input) for mailman id 484550;
 Wed, 25 Jan 2023 20:20:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7BNa=5W=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pKmFv-00010T-Gk
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 20:20:27 +0000
Received: from sonic310-21.consmr.mail.gq1.yahoo.com
 (sonic310-21.consmr.mail.gq1.yahoo.com [98.137.69.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b23372aa-9ced-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 21:20:24 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Wed, 25 Jan 2023 20:20:22 +0000
Received: by hermes--production-ne1-746bc6c6c4-wq9r9 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 2ac2f41faba65782946ecdf6ca09df93; 
 Wed, 25 Jan 2023 20:20:16 +0000 (UTC)
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
X-Inumbo-ID: b23372aa-9ced-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1674678022; bh=wxgIj3YaWUYlS3Z+C9Gh5GQC6tw9/QqKuYdS8h0YavU=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=BKoXZc9FPFBbXIsHPBUchBdwrDvfFyWVitHSf0s2/II2w3GPgimJy/I728ueUMkMWjRw6tLPHWYErH4PyapVlouNNwS5AdbLqkFK/w1Ve0F5DsHo3q0mdroom4MsvvldC3yn3VcsgjdOvvRDapf90rwbDdZb/wqGyMN0dpAapQiOUBq9EFHe5qFgxQ+9NSr1B92CODLDxdQD/xav2ovyZ2WFuHmzjYUOOWGCntYRczD7DV5SV5xO8X9/9EBDo4LTitdkicqgMCMChS96skRa4ydrrcLYjG5sjqGSHViYvOj+tZcmJYCVVArfsWejTBAAhJc3N1dE6wcTPK1kwGbxBA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674678022; bh=3TQtTIUh0wupZImavFLQ8RVWW78DhFn+WpCO8H3vcmJ=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=OEAYP5H6DLExazYSgWVCVKJKzZY1GlZcAYK3nTctoArjEUl0p4kymL5KaM6bwwSgQBm0FS2/AVV+w6hQ4VCOXDHv4G6gzRJ2B8OohbnuH50z3JqxZ4eBf6WTlJ5xnBSJN9/mDmnjGyLdS2/Sci51Hmkf9DJEAzTux7DOj6YIIGfKP4ohJOA5DoZQRmx6v+l+PYglFJEqb70rDXPCGYuDoFvUlKx4wuX46tZtlR/QSpslFF5WNbF/OJiZhbO1RzqQYRU6FttjehOXMEMc/2BlhBLgG7YiDR46Pg/nckQFS6TSNo84+b+RYOu/XVzV8meoyz0kRbiOG7jSg9iif/c5MQ==
X-YMail-OSG: RJOOyIUVM1ntvRVshJc0ZyBGDbe9YhAAiYg0J6unhsMZkx2HGulPelIgSk_mVc2
 wl7l6En8fxXXCyBQgUt9DMVjGwRVZoY1BUq0prMOAySG2VP38.Yq6VNGO47RbGGYtT79yWG5KjEm
 z8POalhuTnVAjHtCfk.Q7LGL4FsL1AOz7SMD87xWGpAVykGRV5XJo8dFzOw8k9snOYjCGHeO6PKo
 Kr6Ykp2YPuF7bath4ltkKtQJErB1.Yx_PMUiAnU4rrrh97Wc9SOONrljoHqv6S5c61f8J9chy7RS
 Ap2fDEzNq0Ma2QjQhSN5Tc1rUBaNURBSZb9F4Tu.xq_YIXa6rMYcEoNzCj4CjZ_tfINATDGqHOPL
 GPhS7GQk4LES_cMgVY2mEAklMdZoqcuTXykXenPjpf.srgdqnq4nZeo76dB1snb7YzaygRb9kwOM
 3LjdVi5NpyFeSBsYoXs8yGWqCRazx5IUGDw7VZWlnffRuW67lf8v.duEWAQt9sJPSr.XqD3e35us
 NbTQ8ib4l2u1Ip95oAaKl.9bkSBBnwsQDRNqSQz1ppjXD6A53fQ75o2CjCrJKeCQ74RbRbfusF_X
 UcvsEr.1_N487mIk2Lhn2h7smObmUx06uATXAOd05RshIn48zrXHWc6UnmmY_ySu.LhOYSa0jJv3
 i8CbWYJtNmSiJoDmrq3vTbQdvKl2E.bEyk862dW4LwIjJFBc7kVxlzCPpxZwJB1F7VIeJ3QqvjzV
 OdkbJ9ZVgkoa1Znjd_yswtnlQn_P.s6hMGheqXQ9VC66e.bYw21X4az8vvkw26je1e3G1uwfAtIb
 qTYrJwF9SWMH0ioJgXcPrTSmM_si1k8hFa6muWis4WFgx4_bnzTHvWl4elYtRjeIwXqOPIKukHsz
 OoG.WBDq_ag7igwTd3uYxxm40kpvyS1fkk3x21GvKcmPoJU0fAZcplc8jO7OiBjtpkYd4Pa6G.JP
 30.4BE7sHFOKskNAq2Zd2FsyZhqQaFe2p.2qoDr_n6TziLtUoHb45Fe88A9D6_7PELzcr2UnP.As
 pmQJ5eG.TZllqeeLP39UXyYwoIdgYZx.nfc7i3CN0yPwdRiMu_cYzUML7WSXG8CLLgGsgicpN52x
 szP04Cldz94SnFUuazqYv4ra896JOtxTwKb02z96Z6J.jyndHd8wDWy3z9JDoMAoiVQ2CGzcJ_ow
 HDMv1oOXHZoH1EbeKjTB8jpoFtUn_dkW5ZSturdmZJwhPU1URmKwSZtwGCOQDJqgo8P9ctI3f3K5
 L9u5bqPBiI6EQKaQs73KDUhxp9pWw.uxgtJGlxuGR3ev4bo_LAtWN6GauZ7x8BQuCViRoSOoYF4T
 Rl2X0dH5U6Vp_NmGe.r0T4L6NUxn3u3FTCJd_AHS0NsDQ_QkgUlJQkRQtefHMBR1sqaq5oqQbG3z
 rr5Qmvcedw5QzwTs7xoH_.P.SUWaPuc2_Ye1.DQsXt5DyIazmvn4WllKY1Jsdd5ID4solZLt3nqs
 ybzHRT.Fx_jhSrgmHZ29fqiWP8Y1WgZ9Qi4kTHIUHZevN40dibvo9gCaAVSdzQMuq29tMAbzwFLm
 0KGSG9Prlue70gI15GUXaaBLgRPutMYPnGG9Qzqz2iaiXv2imbDN5cBz_rUl0SLzI80T2KEgFaip
 1b6HUz0sEHF_fLXM61g4k_zbkjKcKM5Q93yrpvZjvMzJ7ENABIdbIim2v5nLQVFHDt304Wlc8NNJ
 YW407Eq37spiP46AEeWsqo6JNFZidTSUGJSjzwMl1ilJqiH548BttI6kx4HvJPC9kAS3auJ0MehG
 c9z6K5ZVjwov8cNuP6CsSMHgp06XBE5jG7.BsnDbRfu7c7Ky2Okm1F65E8JNKa5QcFEW7EfCpn5a
 UV4oMMtte5vHZsRQlyCMjJhGsv6zzXyjV0BFoywG5C1oKf6qSn3DrVEp.spUNq48ZhrquoAWG4jf
 vSzwagPDmUj7P2jqjrfpiDXZTAupqvGokWy4axqwcu6CVQN6Ca6uofcvnWtrWJ5F4vX83rdxwtfB
 r4hFWn3msYZO7RqGgbLMulMZg3Pxd4dcUcNPbUguCrJHN.Mfs2vHDpy0waV7CCXMt0v46Re8EH8G
 _WgtM5btQWxKlbuJviPQHi9V0e7DI_WyZ2YRGKUOw7yE5sa0sPANhP8YfHO_zIjgo3Gd8QMErKZb
 BZh0Rt711tIQ1Q.TnKmIsLpOqf8QmPCAfq6LeKzBiMHgHAIf9xAltXyKMHQDf.U8hDv6opuEsHvD
 _E2w30fP99A--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <18d8d8e5-bb1a-8a82-622f-3c6a60b97660@aol.com>
Date: Wed, 25 Jan 2023 15:20:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH v2 0/3] Configure qemu upstream correctly by default
 for igd-passthru
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, qemu-devel@nongnu.org
References: <cover.1673300848.git.brchuckz.ref@aol.com>
 <cover.1673300848.git.brchuckz@aol.com>
 <Y9EUarVVWr223API@perard.uk.xensource.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <Y9EUarVVWr223API@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21123 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/25/2023 6:37 AM, Anthony PERARD wrote:
> On Tue, Jan 10, 2023 at 02:32:01AM -0500, Chuck Zmudzinski wrote:
> > I call attention to the commit message of the first patch which points
> > out that using the "pc" machine and adding the xen platform device on
> > the qemu upstream command line is not functionally equivalent to using
> > the "xenfv" machine which automatically adds the xen platform device
> > earlier in the guest creation process. As a result, there is a noticeable
> > reduction in the performance of the guest during startup with the "pc"
> > machne type even if the xen platform device is added via the qemu
> > command line options, although eventually both Linux and Windows guests
> > perform equally well once the guest operating system is fully loaded.
>
> There shouldn't be a difference between "xenfv" machine or using the
> "pc" machine while adding the "xen-platform" device, at least with
> regards to access to disk or network.
>
> The first patch of the series is using the "pc" machine without any
> "xen-platform" device, so we can't compare startup performance based on
> that.
>
> > Specifically, startup time is longer and neither the grub vga drivers
> > nor the windows vga drivers in early startup perform as well when the
> > xen platform device is added via the qemu command line instead of being
> > added immediately after the other emulated i440fx pci devices when the
> > "xenfv" machine type is used.
>
> The "xen-platform" device is mostly an hint to a guest that they can use
> pv-disk and pv-network devices. I don't think it would change anything
> with regards to graphics.
>
> > For example, when using the "pc" machine, which adds the xen platform
> > device using a command line option, the Linux guest could not display
> > the grub boot menu at the native resolution of the monitor, but with the
> > "xenfv" machine, the grub menu is displayed at the full 1920x1080
> > native resolution of the monitor for testing. So improved startup
> > performance is an advantage for the patch for qemu.
>
> I've just found out that when doing IGD passthrough, both machine
> "xenfv" and "pc" are much more different than I though ... :-(
> pc_xen_hvm_init_pci() in QEMU changes the pci-host device, which in
> turns copy some informations from the real host bridge.
> I guess this new host bridge help when the firmware setup the graphic
> for grub.
>
> > I also call attention to the last point of the commit message of the
> > second patch and the comments for reviewers section of the second patch.
> > This approach, as opposed to fixing this in qemu upstream, makes
> > maintaining the code in libxl__build_device_model_args_new more
> > difficult and therefore increases the chances of problems caused by
> > coding errors and typos for users of libxl. So that is another advantage
> > of the patch for qemu.
>
> We would just needs to use a different approach in libxl when generating
> the command line. We could probably avoid duplications. I was hopping to
> have patch series for libxl that would change the machine used to start
> using "pc" instead of "xenfv" for all configurations, but based on the
> point above (IGD specific change to "xenfv"), then I guess we can't
> really do anything from libxl to fix IGD passthrough.
>
> > OTOH, fixing this in qemu causes newer qemu versions to behave
> > differently than previous versions of qemu, which the qemu community
> > does not like, although they seem OK with the other patch since it only
> > affects qemu "xenfv" machine types, but they do not want the patch to
> > affect toolstacks like libvirt that do not use qemu upstream's
> > autoconfiguration options as much as libxl does, and, of course, libvirt
> > can manage qemu "xenfv" machines so exising "xenfv" guests configured
> > manually by libvirt could be adversely affected by the patch to qemu,
> > but only if those same guests are also configured for igd-passthrough,
> > which is likely a very small number of possibly affected libvirt users
> > of qemu.
> > 
> > A year or two ago I tried to configure guests for pci passthrough on xen
> > using libvirt's tool to convert a libxl xl.cfg file to libvirt xml. It
> > could not convert an xl.cfg file with a configuration item
> > pci = [ "PCI_SPEC_STRING", "PCI_SPEC_STRING", ...] for pci passthrough.
> > So it is unlikely there are any users out there using libvirt to
> > configure xen hvm guests for igd passthrough on xen, and those are the
> > only users that could be adversely affected by the simpler patch to qemu
> > to fix this.
>
> FYI, libvirt should be using libxl to create guest, I don't think there
> is another way for libvirt to create xen guests.

I have success using libvirt as a frontend to libxl for most of my xen guests,
except for HVM guests that have pci devices passed through because the
tool to convert an xl.cfg file to libvirt xml was not able to convert the
pci = ... line in xl.cfg. Perhaps newer versions of libvirt can do it (I haven't
tried it since at least a couple of years ago with an older version of libvirt).

>
>
>
> So overall, unfortunately the "pc" machine in QEMU isn't suitable to do
> IGD passthrough as the "xenfv" machine has already some workaround to
> make IGD work and just need some more.
>
> I've seen that the patch for QEMU is now reviewed, so I look at having
> it merged soonish.

Hi Anthony,

Thanks for looking at this and for also looking at the Qemu patch
to fix this. As I said earlier, I think to fix this problem for the IGD,
the qemu patch is probably better than this patch to libxl.

Regarding the rest of your comments, I think the Xen developers
need to decide what the roadmap for the future development of
Xen HVM machines on x86 is before deciding on any further
changes. I have not noticed much development in this feature
in the past few years, except for Bernhard Beschow who has been
doing some work to make the piix3 stuff more maintainable in
Qemu upstream. When that is done, it might be an opportunity to do
some work improving the "xenfv" machine in Qemu upstream.
The "pc" machine type is of course a very old machine type
to still be using as the device model for modern systems.

I noticed about four or five years ago there was a patch set
proposed to use "q35" instead of "pc" for Xen HVM guests and
Qemu upstream, but there did not seem to be any agreement
about the best way to implement that change, with some saying
more of it should be implemented outside of Qemu and by libxl
or maybe hvmloader instead. If anyone can describe if there is a
roadmap for the future of Xen HVM on x86, that would be helpful.
Thanks,

Chuck

