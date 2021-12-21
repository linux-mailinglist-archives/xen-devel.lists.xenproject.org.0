Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD11A47C1CC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 15:46:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250479.431430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzgOt-0000rl-Sl; Tue, 21 Dec 2021 14:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250479.431430; Tue, 21 Dec 2021 14:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzgOt-0000pi-PB; Tue, 21 Dec 2021 14:45:59 +0000
Received: by outflank-mailman (input) for mailman id 250479;
 Tue, 21 Dec 2021 14:45:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mzgOs-0000pc-Nv
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 14:45:58 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b32006c5-626c-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 15:45:56 +0100 (CET)
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
X-Inumbo-ID: b32006c5-626c-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640097956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=b2yeN3TQ1uPcAA39PbjC095xO72qFP6zoaalMdV7SSA=;
  b=CPVhCyoN1Yhj5EhCMna8rCLu4Jb/dLreC49IA7Il6ZQKTGYWsHempzPt
   n/HNUetyOkqibXPuRwHLrMW8mYND5xeY4m9HkCf8q4wioMcWjVQr1R6Bp
   X57NEUjpjNK1Z9IqHp36WGBNimpoew2woPQvM4yNUB6vBdblQ513x9C1g
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CIZ8eXrEGww16Jr7fx4BmvlCwz2SpSMB4YSlv7YC8gyAmQZXIY4cmJCHl9z+biBcVH7M4cGDWb
 kAXB/WaTQh+ipt1fVQs1Xpt8X02K7DuRq1vte7EolI7HZwCrfo5z0pz9kGp72wptaN5D5s76b0
 OdmxN2FO8EJ220Fx3RNYwTD0WFIlL3/bn9622Cp9jlivjlmJJEVMtOtiOgnplM/JJ9YFhuKCJO
 o8LuOMXizZBgzk+Zg2jnUn/xM247xUkfH3op+LkKrZLJN4/0r981i78070K5UfxOAfA9+Ob4ZO
 Fv8ecpniRdGY8TBNUltRH16B
X-SBRS: 5.1
X-MesageID: 60507523
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EdKaB6wP3zCBWqp9h6Z6t+dawCrEfRIJ4+MujC+fZmUNrF6WrkVSz
 zMcUT+Gb//fY2H1ftAiO4Wxo0tTvpXRxtM2QVNkrSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500s6wbRg2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9dV5
 dRJtIC7cFdqB6HUhc8MeBl5PAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JgTRamDP
 ZFxhTxHNhPseh5JC3EtBZcdosb5iXmmS2J1kQfAzUYwyzeKl1EguFT3C/LXZ9iLSMN9jkue4
 GXc8AzRABsXKdiewjqt6W+3i6nEmiaTcJkJCLSy+/pugVuS7m8eEhsbUR28u/bRokSzQc5FI
 koYvC8nt7Ev9VeDR8P4GRa/pRasgBkYXNZBFvwg3yuEwKHU/gWxC3ANS3hKb9lOnMgySD8xy
 k6Sn/vmADVutPueTnf13pCQoDCpOCkiCGgDfi4JTAYby9T7qYR1hRXKJv5zHajwgtDrFDXYx
 zGRsDN4l7gVldQM1aiw4RbAmT3EjprGVAku/S3MQ3moqAh+YeaNeIiA+VXdq/FaI+6kokKp5
 SZe3ZLEtaZXUM/LxHflrPgx8K+B4NKoMTndnVVWT9oY+yyw0G+IfaF/yWQrTKt2CfosdTjsa
 U7VnApe4p5PIXenBZNKj5KN59cClva5S4m8PhzARp8XO8UqKlfblM17TRfIhziFraQ6rU0o1
 X53m+6IBG1SN6loxSHeqww1ge5ynXBWKY8+qPnGI/WbPVi2OC/9pVQtagLmggUFAEWs+l29H
 zF3bZTi9vmneLeiChQ7CKZKRbzwEVA1BIrtt+tcffOZLwxtFQkJUqGNmet7JtM5xf0OzI8kG
 01RvGcCkDITYlWddm23ho1LMuuzDf6TU1pmVcDTAbpY8yd6Otv+hEvuX5A2YaMm5IReIQ1cF
 JE4lzG7Kq0XEFzvom1FBbGk9dAKXEn71GqmYnv+CBBiLsEIeuA80oK9FucZ3HJVVXTfWApXi
 +DI6z43trJfHVk/V5iPN6r0p75z1FBE8N9Ps4LzCoE7UC3RHEJCckQdV9c7fJMBLwvt3Dyf2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3TfhZtPu6RBy6V3owyzX
 k7TqNBWNa/QYJHuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB0XUPIqF0PYUpx
 fYalPQXswHv2AA3NtumjzxP8zjeJHI3TKh65IoRB5Xmi1R3xwgaM4DcECL//LqGd85IbhsxO
 jaRiafP2+Zcy07FfyZhHHTBx7MA15EHuRQMx14ePVWZ3NHCg6ZvjhFW9D02SCVTzwlGjL0va
 jQ6aRUtKPXc5SpsiehCQ3uoSlNICxCu80Dsz0cEyT/CRE6yW22RdGAwNI5hJqzCH76wqtSDw
 Iyl9Q==
IronPort-HdrOrdr: A9a23:445hea5aaoif16nq3gPXwPDXdLJyesId70hD6qhwISY1TiW9rb
 HIoB19726TtN9xYgBFpTnuAsW9qB/nmqKdpLNhRItKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdWSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.88,223,1635220800"; 
   d="scan'208";a="60507523"
Date: Tue, 21 Dec 2021 14:45:43 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
CC: Oleksandr <olekstysh@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Message-ID: <YcHol8ads22asXGF@perard>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
 <b1c27f70-309d-bb36-3228-32836063fd16@gmail.com>
 <20211217121524.GA4021162@EPUAKYIW015D>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211217121524.GA4021162@EPUAKYIW015D>

On Fri, Dec 17, 2021 at 12:15:25PM +0000, Oleksii Moisieiev wrote:
> > On 14.12.21 11:34, Oleksii Moisieiev wrote:
> > > @@ -1817,17 +1858,24 @@ static void libxl__add_dtdevs(libxl__egc *egc, libxl__ao *ao, uint32_t domid,
> > >   {
> > >       AO_GC;
> > >       libxl__ao_device *aodev = libxl__multidev_prepare(multidev);
> > > -    int i, rc = 0;
> > > +    int i, rc = 0, rc_sci = 0;
> > >       for (i = 0; i < d_config->num_dtdevs; i++) {
> > >           const libxl_device_dtdev *dtdev = &d_config->dtdevs[i];
> > >           LOGD(DEBUG, domid, "Assign device \"%s\" to domain", dtdev->path);
> > >           rc = xc_assign_dt_device(CTX->xch, domid, dtdev->path);
> > > -        if (rc < 0) {
> > > -            LOGD(ERROR, domid, "xc_assign_dtdevice failed: %d", rc);
> > > +        rc_sci = xc_domain_add_sci_device(CTX->xch, domid, dtdev->path);
> > > +
> > > +        if ((rc < 0) && (rc_sci < 0)) {
> > > +            LOGD(ERROR, domid, "xc_assign_dt_device failed: %d; "
> > > +                 "xc_domain_add_sci_device failed: %d",
> > > +                 rc, rc_sci);
> > >               goto out;
> > >           }
> > > +
> > > +        if (rc)
> > > +            rc = rc_sci;
> > 
> > 
> > If I get this code right, it sounds like the dom.cfg's dtdev property is
> > reused to describe sci devices as well, but the libxl__add_dtdevs() does not
> > (and can not) differentiate them. So it has no option but to send two
> > domctls for each device in dtdevs[] hoping to at least one domctl to
> > succeeded. Or I really missed something?
> > 
> > It feels to me that:
> >  - either new dom.cfg's property could be introduced (scidev?) to describe
> > sci devices together with new parsing logic/management code, so you will end
> > up having new libxl__add_scidevs() to invoke XEN_DOMCTL_add_sci_device,
> > so no mixing things.
> >  - or indeed dtdev logic could be *completely* reused including extending
> > XEN_DOMCTL_assign_device to cover your use-case, although sounds generic, it
> > is used to describe devices for the passthrough (to configure an IOMMU for
> > the device), in that case you wouldn't need an extra
> > XEN_DOMCTL_add_sci_device introduced by current patch.
> > 
> > Personally I would use the first option as I am not sure that second option
> > is conceptually correct && possible. I would leave this for the maintainers
> > to clarify.
> > 
> 
> Thank you for the point. I agree that reusing XEN_DOMCTL_assign_device
> seems not to be conceptually correct. Introducing new dom.cfg property
> seems to be the only way to avoid extra Domctl calls.
> I will handle this in v2 if there will be no complains from Maintainers.

I don't know if there will be a complains in v2 or not :-), but using
something different from dtdev sound good.

If I understand correctly, dtdev seems to be about passing through an
existing device to a guest, and this new sci device seems to be about having Xen
"emulating" an sci device which the guest will use. So introducing
something new (scidev or other name) sounds good.

Thanks,

-- 
Anthony PERARD

