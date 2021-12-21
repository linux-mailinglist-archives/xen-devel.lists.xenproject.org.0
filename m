Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D2047C8DA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 22:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250612.431645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzmr3-00056M-BK; Tue, 21 Dec 2021 21:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250612.431645; Tue, 21 Dec 2021 21:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzmr3-000546-8J; Tue, 21 Dec 2021 21:39:29 +0000
Received: by outflank-mailman (input) for mailman id 250612;
 Tue, 21 Dec 2021 21:39:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNu3=RG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mzmr1-000540-NE
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 21:39:27 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77989d3d-62a6-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 22:39:25 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF34EB817E6;
 Tue, 21 Dec 2021 21:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0945FC36AE9;
 Tue, 21 Dec 2021 21:39:21 +0000 (UTC)
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
X-Inumbo-ID: 77989d3d-62a6-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640122762;
	bh=eY3zV6xgSLXE3r037M1tp0F6xSMSmlF0V0wfDBlBEt4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qnc8h031Hlv/ytK+CyjKZXBApan/qvbp2FB8FYiV76SkKwV7K3ao+L8Ecz5QHPmXo
	 wzcbKxNDokum/qBtGtn12mZ4XTw7XctPXdlAABWrZa6NsttTeCn9KOr9M9DfUnAgDi
	 lZcE+E0d7/KvdGOP8+Hetkg/kV1lJOHQ4dEECGqaU/ihi6B3wm3wHX8cZdbYQJwibw
	 rgKpwAWk6KEmqDI3wzz+HxVNnre0zUPmkuURKlbdjF29fyrT3+EjqZCbsaO8LlNbtI
	 pGwVDlViG6LHc10HrwC3yx1lbGpvEAkfNeAV0G7+N37+lW5DEcGd3iObZzRbs7gd7F
	 Ds0xtAvr+hB8Q==
Date: Tue, 21 Dec 2021 13:39:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
    Oleksandr <olekstysh@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
In-Reply-To: <YcHol8ads22asXGF@perard>
Message-ID: <alpine.DEB.2.22.394.2112211330310.2060010@ubuntu-linux-20-04-desktop>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com> <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com> <b1c27f70-309d-bb36-3228-32836063fd16@gmail.com> <20211217121524.GA4021162@EPUAKYIW015D>
 <YcHol8ads22asXGF@perard>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-303666308-1640122251=:2060010"
Content-ID: <alpine.DEB.2.22.394.2112211331110.2060010@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-303666308-1640122251=:2060010
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2112211331111.2060010@ubuntu-linux-20-04-desktop>

On Tue, 21 Dec 2021, Anthony PERARD wrote:
> On Fri, Dec 17, 2021 at 12:15:25PM +0000, Oleksii Moisieiev wrote:
> > > On 14.12.21 11:34, Oleksii Moisieiev wrote:
> > > > @@ -1817,17 +1858,24 @@ static void libxl__add_dtdevs(libxl__egc *egc, libxl__ao *ao, uint32_t domid,
> > > >   {
> > > >       AO_GC;
> > > >       libxl__ao_device *aodev = libxl__multidev_prepare(multidev);
> > > > -    int i, rc = 0;
> > > > +    int i, rc = 0, rc_sci = 0;
> > > >       for (i = 0; i < d_config->num_dtdevs; i++) {
> > > >           const libxl_device_dtdev *dtdev = &d_config->dtdevs[i];
> > > >           LOGD(DEBUG, domid, "Assign device \"%s\" to domain", dtdev->path);
> > > >           rc = xc_assign_dt_device(CTX->xch, domid, dtdev->path);
> > > > -        if (rc < 0) {
> > > > -            LOGD(ERROR, domid, "xc_assign_dtdevice failed: %d", rc);
> > > > +        rc_sci = xc_domain_add_sci_device(CTX->xch, domid, dtdev->path);
> > > > +
> > > > +        if ((rc < 0) && (rc_sci < 0)) {
> > > > +            LOGD(ERROR, domid, "xc_assign_dt_device failed: %d; "
> > > > +                 "xc_domain_add_sci_device failed: %d",
> > > > +                 rc, rc_sci);
> > > >               goto out;
> > > >           }
> > > > +
> > > > +        if (rc)
> > > > +            rc = rc_sci;
> > > 
> > > 
> > > If I get this code right, it sounds like the dom.cfg's dtdev property is
> > > reused to describe sci devices as well, but the libxl__add_dtdevs() does not
> > > (and can not) differentiate them. So it has no option but to send two
> > > domctls for each device in dtdevs[] hoping to at least one domctl to
> > > succeeded. Or I really missed something?
> > > 
> > > It feels to me that:
> > >  - either new dom.cfg's property could be introduced (scidev?) to describe
> > > sci devices together with new parsing logic/management code, so you will end
> > > up having new libxl__add_scidevs() to invoke XEN_DOMCTL_add_sci_device,
> > > so no mixing things.
> > >  - or indeed dtdev logic could be *completely* reused including extending
> > > XEN_DOMCTL_assign_device to cover your use-case, although sounds generic, it
> > > is used to describe devices for the passthrough (to configure an IOMMU for
> > > the device), in that case you wouldn't need an extra
> > > XEN_DOMCTL_add_sci_device introduced by current patch.

I realize I did my review before reading Oleksandr's comments. I fully
agree with his feedback. Having seen how difficult is for users to setup
a domU configuration correctly today, I would advise to try to reuse the
existing dtdev property instead of adding yet one new property to make
the life of our users easier.



> > > Personally I would use the first option as I am not sure that second option
> > > is conceptually correct && possible. I would leave this for the maintainers
> > > to clarify.
> > > 
> > 
> > Thank you for the point. I agree that reusing XEN_DOMCTL_assign_device
> > seems not to be conceptually correct. Introducing new dom.cfg property
> > seems to be the only way to avoid extra Domctl calls.
> > I will handle this in v2 if there will be no complains from Maintainers.
> 
> I don't know if there will be a complains in v2 or not :-), but using
> something different from dtdev sound good.
> 
> If I understand correctly, dtdev seems to be about passing through an
> existing device to a guest, and this new sci device seems to be about having Xen
> "emulating" an sci device which the guest will use. So introducing
> something new (scidev or other name) sounds good.

Users already have to provide 4 properties (dtdev, iomem, irqs,
device_tree) to setup device assignment. I think that making it 5
properties would not be a step forward :-)

To me dtdev and XEN_DOMCTL_assign_device are appropriate because they
signify device assignment of one or more devices. We are not adding any
additional "meaning" to them. It is just that we'll automatically detect
and generate any SCMI configurations based on the list of assigned
devices. Because if SCMI is enabled and a device is assigned to the
guest, then I think we want to add the device to the SCMI list of
devices automatically.

If we really want to introduce a new list of devices, please make it
optional so that most times the user can skip it unless really required.
--8323329-303666308-1640122251=:2060010--

