Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69C565C90F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 22:50:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470769.730387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCpAt-00033f-6u; Tue, 03 Jan 2023 21:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470769.730387; Tue, 03 Jan 2023 21:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCpAt-00031A-3t; Tue, 03 Jan 2023 21:50:23 +0000
Received: by outflank-mailman (input) for mailman id 470769;
 Tue, 03 Jan 2023 21:50:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Awo3=5A=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pCpAr-000314-QI
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 21:50:22 +0000
Received: from sonic314-20.consmr.mail.gq1.yahoo.com
 (sonic314-20.consmr.mail.gq1.yahoo.com [98.137.69.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c5d08b8-8bb0-11ed-b8d0-410ff93cb8f0;
 Tue, 03 Jan 2023 22:50:18 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Tue, 3 Jan 2023 21:50:15 +0000
Received: by hermes--production-ne1-7b69748c4d-gv5kc (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 81c81d8f73da6f85953acc29cd3f8c46; 
 Tue, 03 Jan 2023 21:50:11 +0000 (UTC)
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
X-Inumbo-ID: 9c5d08b8-8bb0-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672782615; bh=MuT9WQEKaC6d5FTK4Spmmmji5WG4CNUMm8s9sH9M3Ko=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=fZ9+7V+JUVWcviXErNxRBhy7rIrayNLgYtb2o+MyMD2fHbuRDCVfiWvQzSfYWfm41mRh5HU2GZgkYMTar+g3iJUKlGRiJx2mag5njYkyVWAYDeowegtR9gthrV8DbSomjSTQaSg+4vjn2D0ia6+XTUnXlPbxd7pv5zG6EAgT3awW0wAZz/0rzNc2eDDCr5PHxe8pV984CeU9GJEN9X2Y+Vftn/l2AzLWZGY74g2wZchKo2woUpKP+5Shx9leyB5uMI2hK0+GutgSBWWNeWPLzN+P5O9eiI7zK32SHX2ceXrVjiPOMIYgnBRrxiZKoVYd/eCA9zhakpxfE9YQgKKM8A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672782615; bh=fsWlUl+B0IEOHQXXH6HoSZbHVIhMRyVbJAlb1IU7XRr=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=YS6wTKRBBk9kNivnCoUIkmrdr8N+uvWDCZ43eCWLk0jpXMjwilt41nZVpGns/GRMnsmP3kRbVoH0u0BLDwL9PWcDOAbHvdBKqVNPwFUfc+rLby38rtEdc/Mi79wEwoRElc3fOxq0A/pXVVPdvBVXh9CwnCp7cOcWlKFArPBaoVV/D2P1oMDG+dk+zjGMORCJKbewxBEpFikkt0ceu0uX6NZAu1gLNVa9lpj6hPDaWOAnKXJOSWMKI5YaaqhXMMD6IZdgtunuTVCmc/nOzLeacEvZ9zBbUDeBk6Sh53H2rm07bivVIFIF+FN37ZOLzyM3Yl5uQXIjvmni+4dlv4QSgg==
X-YMail-OSG: p_yAS9UVM1m2RvDl.g5.yw1FtsPTQHp_HScHPKTHjXDGTAUveyFVf5JiUggVOcV
 5TZ_yEVYvttCTnxMxCqadl5HOrUs1YQyUF6UUw3Y2AacQMzj5JUURRijKz1aeX99WCFC5JnTT8qL
 SxGDMGFQz2rfimKdqEp3XD1wJD9OB3JneX.UWFOBr2DdTfERdg6wREgPSbge3GCvrPZcJbEqeyB4
 sv_1Kk11J0GiOWEv5n6JC_YFa0Ten1ko_o01uP79FwcbZT5XutDnIFtNw8bW7MLTO3oQDa3zkveD
 mJagKcsW8B2.D9R_KprjvIyc39EgkcX94rB1HgPcmR5EUCskxY3sni82aew0nzJZs02ZfyEW.P1C
 8gYiXwDnJDRgeq64uRNHDR7w5ScI_SKpfmitL9o9_Zfy8g.5CMcMPDtt0O.YJ_o8VBlCdmPOE0Av
 INdLtOcKw.DrfeudB5zL8sfefuM2PEeYzEa54rqzc_.7eAnX69e9LzCF14hYc7nbxYlSbTwbxhdb
 EeCtf17WVSDWclH1Cnf2KfptnucTlNhperWrRb0yLBf3rU_RAhrO2pjiE6tuOd9L2gP_LVN3WRNj
 mRnVZHacflHnjfRuzN5QQvfrjicBr6OYjKVEUIPmK_cb7urm9MYIyHYj55soEVza4eWwMzZFuHWg
 UintR8uIw74oL.ua29ABtW2B_tOca57qC00p6mcj50JOy7PgkQal12S1x_Hhfxf2gQH8QmT4_dWJ
 SmYXfqXDVGt02aSLYiygdIM43aWzR0T6gmkqTiCglq8NbBNrOge5MeURR9mQbKF40a51v.K.fdwB
 Yc.kyC17Gu2Y4mI.l7tjDzFcfW86bGhIq9B3uJkmyM88IJNvjvBKpj9EAaeAZv2nGTz5SWZZuoaX
 iENfaIZWQXw.VmT4H8BfJytM1gtmWHzY1igSJvOTVlb5mhmVn0vWpU7egiVgIxdgRnJO5_nEVHMV
 GuNEvd729eVy66lgKhhsQHRfwn1EiOlWUVO4C45AAhGvrHeWwyk2QeEGOYzathi3zimHuVYd9kPS
 THogexzZiJGD5XXkrEy9ujpud_tlGFcTON1TuZYIM_cdyHExGxZG19_qZT8VhLjkhF6fxAqlJWYx
 fJffKY44sYLH2PY6GDVI_iIWUD7J8OuwS3hWI.3kIojwK1zW5JfXqj0WPTzkaPbdh1VqN3zwbmXp
 pm3gcPc1Mlg8kT2vBIZ1V58rNdQ2D_aLrMTkfvbbU6FMtWNP6vi4FknpYpl8J6Uepk6G.Y0urE_7
 eFU8KvZTRpfW8TnXOc.Lg5XY85fjduxZfH8reslwY5C9SHYGlji1Rla7JQwtgjqUZaPcJ1sPOfcW
 Qxd61FD9_3mysXPIsSVia90gCrRoEMfGYJCqaur4ObYdhSwNfxXQzhdl_lum2Fn8hrOqZjrqRruJ
 K52CWG0mWjaXtpDdvo.9tb..WrpgqnFHu5.bmcpm_ze7Gbejve3m4XYf08CSfLCl75g5Fikfmm_g
 uvgLQOng0qUvfyZPXv_arPa.GeJNfRqv2_wPjxNNqzDiNUI70ZlI9ENodqz4bTlVBlTyl7SGvPhM
 lmJQfnnOaZb4dHaOE_LszPdY_OQHC1XPrQEiJ_1l4FfkgsbCt7jXCh0i6m3G9qvkh0gXK0nYV6NQ
 Rgx3rUrSl5HI3D4JBGBjznbj6qE9WS_UihYta83.eAzwg66q7jovqm6nw7vDLzVHgjFcae6DZGw2
 0LHK8Ci3JyfGSkZzXUlfE33iiAUATiF0TJ14ExwIR0iojgaoLi.s00KpkyMq.1cX4no6PQUw7JCb
 vgjpijzgHx2hrVCl7Hinugio3keN.4kk3t_rVaO49wDNH2G6uNebb8xX7gjgGAo0TvwDS3zTD6o8
 ecjgVDTpVhxNCKKpsMZlc.NfLLfHBce3syV3w0D10360EMnaz8kLm_Lj8c7DodkZrQ_6cVDGRQl2
 SAhfHS7lZW6iaEbBdni1QRD7TopKEo5P4TLMRD1cZGWAEz1e6E0z6k6p68wCSqPaD1yNM5s34Uw2
 erVz4HXwjK84aCpXrqb5envrdJVWxxWRWzAUARXU4gnwyBPLSNftlj2vgzmCVtPLhYo1s.KlbGHl
 X2EAu_BOdlw.3rE.SdMfRtcTLIiOrk8umNvQhGk2A1xriRpRnMCTsyPPkdcF.P2zQE02LoIU1xOT
 ozU6p4hmKxHp7ChXY9HXBsP9fH9oFLARfdNVVBizBdg6QHUiNUW2eVq4jKPn99HDu4uR6hCskX0f
 0xH_sUVP2JNfUyqEZChU-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <cbfdcafc-383e-aea3-d04d-38388fab202f@aol.com>
Date: Tue, 3 Jan 2023 16:50:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <20230102124605-mutt-send-email-mst@kernel.org>
 <c21e933f-0539-9ffb-b2f8-f8e1a279b16f@netscape.net>
 <20230103081456.1d676b8e.alex.williamson@redhat.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230103081456.1d676b8e.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/3/2023 10:14 AM, Alex Williamson wrote:
> On Mon, 2 Jan 2023 18:10:24 -0500
> Chuck Zmudzinski <brchuckz@netscape.net> wrote:
>
> > On 1/2/23 12:46 PM, Michael S. Tsirkin wrote:
> > > On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:  
> > > > Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> > > > as noted in docs/igd-assign.txt in the Qemu source code.
> > > > ... 
> > > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>  
> > >
> > > I'm not sure why is the issue xen specific. Can you explain?
> > > Doesn't it affect kvm too?  
> > 
> > Recall from docs/igd-assign.txt that there are two modes for
> > igd passthrough: legacy and upt, and the igd needs to be
> > at slot 2 only when using legacy mode which gives one
> > single guest exclusive access to the Intel igd.
> > 
> > It's only xen specific insofar as xen does not have support
> > for the upt mode so xen must use legacy mode which
> > requires the igd to be at slot 2. I am not an expert with
>
> UPT mode never fully materialized for direct assignment, the folks at
> Intel championing this scenario left.

Thanks for clarifying that for me.

>
> > kvm, but if I understand correctly, with kvm one can use
> > the upt mode with the Intel i915 kvmgt kernel module
> > and in that case the guest will see a virtual Intel gpu
> > that can be at any arbitrary slot when using kvmgt, and
> > also, in that case, more than one guest can access the
> > igd through the kvmgt kernel module.
>
> This is true, IIRC an Intel vGPU does not need to be in slot 2.
>
> > Again, I am not an expert and do not have as much
> > experience with kvm, but if I understand correctly it is
> > possible to use the legacy mode with kvm and I think you
> > are correct that if one uses kvm in legacy mode and without
> > using the Intel i915 kvmgt kernel module, then it would be
> > necessary to reserve slot 2 for the igd on kvm.
>
> It's necessary to configure the assigned IGD at slot 2 to make it
> functional, yes, but I don't really understand this notion of
> "reserving" slot 2.  If something occupies address 00:02.0 in the
> config, it's the user's or management tool's responsibility to move it
> to make this configuration functional.  Why does QEMU need to play a
> part in reserving this bus address.  IGD devices are not generally
> hot-pluggable either, so it doesn't seem we need to reserve an address
> in case an IGD device is added dynamically later.

As I said in earlier message in this thread, the xenlight toolstack (libxl) that is
provided as the default toolstack for building xen guests with pci passthrough
is not the most flexible management tool, and that is why, in the case of xen,
it is simpler to reserve slot 2 while qemu assigns the slot addresses of the
qemu emulated pci devices so that the igd can use slot 2. IIRC, In hw/pci/pci.c,
once the slot value is assigned, it is constant and cannot be changed later on
by a management tool.

>  
> > Your question makes me curious, and I have not been able
> > to determine if anyone has tried igd passthrough using
> > legacy mode on kvm with recent versions of linux and qemu.
>
> Yes, it works.
>
> > I will try reproducing the problem on kvm in legacy mode with
> > current versions of linux and qemu and report my findings.
> > With kvm, there might be enough flexibility to specify the
> > slot number for every pci device in the guest. Such a
>
> I think this is always the recommendation, libvirt will do this by
> default in order to make sure the configuration is reproducible.  This
> is what we generally rely on for kvm/vfio IGD assignment to place the
> GPU at the correct address.
>
> > capability is not available using the xenlight toolstack
> > for managing xen guests, so I have been using this patch
> > to ensure that the Intel igd is at slot 2 with xen guests
> > created by the xenlight toolstack.
>
> Seems like a deficiency in xenlight.  I'm not sure why QEMU should take
> on this burden to support support tool stacks that lack such basic
> features.

So you would prefer to patch xenlight (libxl) to make it flexible enough to properly
handle this case of legacy igd passthrough.

>  
> > The patch as is will only fix the problem on xen, so if the
> > problem exists on kvm also, I agree that the patch should
> > be modified to also fix it on kvm.
>
> AFAICT, it's not a problem on kvm/vfio because we generally make use of
> invocations that specify bus addresses for each device by default,
> making this a configuration requirement for the user or management tool
> stack.  Thanks,

Unfortunately, and as I mentioned in an earlier message on this thread,
the xenlight management tool stack (libxl) is not so flexible and does not
make it so easy for the administrator to specify the bus address of each
device, and that is why either this patch is needed for igd legacy passtrhough
on xen, or the libxl management tool needs to be patched so it is flexible
enough to enable the slot addresses to be assigned correctly using
that tool instead of relying on qemu to reserve slot 2 for the igd.

If there is a consensus that this should be fixed in libxl instead of in qemu,
I will work on a patch to libxl, but I will wait a while for some feedback from
the xen people before I do that.

Thanks for your feedback,

Chuck

