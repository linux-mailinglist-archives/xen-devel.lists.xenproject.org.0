Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4797083D9
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536378.834641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeTZ-0003yt-TO; Thu, 18 May 2023 14:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536378.834641; Thu, 18 May 2023 14:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeTZ-0003wV-Po; Thu, 18 May 2023 14:19:29 +0000
Received: by outflank-mailman (input) for mailman id 536378;
 Thu, 18 May 2023 14:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CvkS=BH=citrix.com=prvs=495754ba3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pzeTY-0003wP-AH
 for xen-devel@lists.xen.org; Thu, 18 May 2023 14:19:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fccd1542-f586-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 16:19:25 +0200 (CEST)
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
X-Inumbo-ID: fccd1542-f586-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684419565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s0voyg0vRlyssHFOnfAjzksRgu/GwwFTHZGGiRj/DLI=;
  b=NsngB4HShfgY78Fegjdk9pu7b5W90gc9H4w6PNxppjwo048g9DZV2Qcj
   LiisyWBlPYjIRrAyQDeGVPTgLg4NeaS8AYQF3cCFn76I5vZcd3+o0t6Rq
   BcOGEZfr1GXJbw4GrB2rxXsNyMKalIGVsUGbUbWZSXEc/kTiMJqz3WZU8
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109415103
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:/FkZN6zFkdi4Gi1qvbp6t+dnwSrEfRIJ4+MujC+fZmUNrF6WrkVTn
 2JOCG6FP/uJYzbwe9twPIu/901Sv5OGnd41SAdrpCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPKAT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUNJ+
 rs2MT4JVUDZlf+f0ImQaMB3jf12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNzxrB+
 zuepAwVBDkAPeOO7SqbokuypfaImwbVAIkzHeeno6sCbFq7mTVIVUx+uUGAiee4kEOlW5RcN
 kkd4AIqrK477kvtScPyNzWorXjBshMCVt54F+wh9BrL2qfSpQGDCQAsTDFbb8c9nNQrXjFs3
 ViM9/vrGDhuvbu9WX+bsLCOoluaJykTJmIEeWkLUAoZ/97/iIUyiBvVSZBkCqHdpsbpAzjsx
 CvPoCUgr7ILyMoKzLmgu1TGhTu2od7OVAFdzgzTU3Lj5A5/YoOoT4ip71HB6rBHNonxZlyIo
 HgFltXY9OcPF5CAjgSJQeMEBrbv7PGAWBXbhVNsBIUw7DSF9HuqfIQW6zZ7TG9kKMcHPyTiY
 E7XvQJX67dXPX2jd6gxZJi+Y+wj1aX6HM7pfuzVZNFJJJN2cWe6EDpGPBDKmTq3yQ51zP95Y
 M3AGSqxMZoEIYZgw32YXukZ6u9x1D0X1Vj4Z7ngxC3yhNJye0WpYbsCNVKPaMUw46WFvBjZ/
 r5jCiea9/lMeLagO3eKqOb/OXhPdCFmXs6u96S7Y8bZemJb9Hcd5+g9KF/LU6hshOxrm+jB5
 RlRsWcImQOk1RUrxehnA02PiY8Dv74l9RrX3gR2Zz5EPkTPhq7xhJrzj7NtIdEaGBVLlJaYt
 cUtdcSaGehoQT/a4TkbZpSVhNU8JEjw2VLTZnL5OWBXk3tcq+vhq7fZkvbHrnFSXkJbS+Nly
 1Ff6u8racVaHFkzZConQPmu00mwrRAgpQ6GZGOReoM7UBy1oOBXx9nZ0qdfzzckdU+SmVN3F
 m++XX8lmAU6i9NsoYiZ3fHV9trB/ikXNhMyIlQ3JI2ebUHylldPC6cbOApUVVgxjF/JxZg=
IronPort-HdrOrdr: A9a23:YsK3+K2lhSZj/ZFqg3urMAqjBbFxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4expOMG7IU80hqQFmrX5XI3SFzUO11HYSL2KgbGN/9SkIVyGygc/79
 YrT0EdMqyWMbESt6+TjGaF+pQbsb+6GcuT9ITjJgJWPGRXgtZbnmVE42igc3FedU1jP94UBZ
 Cc7s1Iq36JfmkWVN2yAj0oTvXOvNrCkbPheFojCwQ84AeDoDu04PqieiLokis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv+/olbg9zoz/pEHYiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3e
 XkklMFBYBe+nnRdma6rV/GwA/7ygsj7Hfk1BuxnWbjidaRfkN1N+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnzUQ1wnEbcmwtirQdTtQ0ebWItUs4SkWUtxjIRLH40JlO41GloKp
 grMCiW3ocqTbrTVQGkgkBfhPihWWkyGBCdK3JywPB9lQIm00yRhnFou/A3jzMO8okwRIJD4P
 mBOqN0lKtWRstTdq5lAvwdKPHHfFAlbCi8RF56G26XY50vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdduXQpc0zjBMWS1NkTmyq9CFmVTHDo0IVT9pJ5srrzSP7iNjCCUkknl4+lr+8ECsPWVv
 6vMNZdAuPlL2HpBYFVtjeOEqV6OD0bSokYq9w7U1WBrobCLZDrrPXSdLLJKL/kAV8fKxbC67
 s4LUrOzel7nzCWsyXD8WbsslvWCz3C1IM1FrTG9O4Oz4VIPpFQsxl9syXL2v22
X-Talos-CUID: 9a23:obdbQ2EICrT89hr8qmJF80FTNNkrdkaNlmXNCl+DIkRAU7asHAo=
X-Talos-MUID: 9a23:qkbiXQSNlYIqaBXORXT2jQ5zENd2s52wK1lKl7Ao48KlPHZvbmI=
X-IronPort-AV: E=Sophos;i="5.99,285,1677560400"; 
   d="scan'208";a="109415103"
Date: Thu, 18 May 2023 15:19:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Erik Schilling
	<erik.schilling@linaro.org>
Subject: Re: [PATCH V2 2/2] libxl: arm: Add grant_usage parameter for virtio
 devices
Message-ID: <b83fc678-d453-4eea-bdaa-59ca636059b2@perard>
References: <782a7b3f54c36a3930a031647f6778e8dd02131d.1683791298.git.viresh.kumar@linaro.org>
 <ccf5b1402fb7156be0ef33b44f7b114efbe76319.1683791298.git.viresh.kumar@linaro.org>
 <5dc217d6-ca8f-4c5f-ad7c-2ab30d6647bd@perard>
 <20230515120600.bsfw6pe3usae4sl4@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230515120600.bsfw6pe3usae4sl4@vireshk-i7>

On Mon, May 15, 2023 at 05:36:00PM +0530, Viresh Kumar wrote:
> On 12-05-23, 11:43, Anthony PERARD wrote:
> > On Thu, May 11, 2023 at 01:20:43PM +0530, Viresh Kumar wrote:
> > > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > > index 24ac92718288..0405f6efe62a 100644
> > > --- a/docs/man/xl.cfg.5.pod.in
> > > +++ b/docs/man/xl.cfg.5.pod.in
> > > @@ -1619,6 +1619,18 @@ hexadecimal format, without the "0x" prefix and all in lower case, like
> > >  Specifies the transport mechanism for the Virtio device, only "mmio" is
> > >  supported for now.
> > >  
> > > +=item B<grant_usage=STRING>
> > > +
> > > +Specifies the grant usage details for the Virtio device. This can be set to
> > > +following values:
> > > +
> > > +- "default": The default grant setting will be used, enable grants if
> > > +  backend-domid != 0.
> > 
> > I don't think this "default" setting is useful. We could just describe
> > what the default is when "grant_usage" setting is missing from the
> > configuration.
> 
> This is what I suggested earlier [1], maybe I misunderstood what
> Juergen said.

To me, as a user of any program, setting default to a configuration
option is when we don't select a configuration option. Like when
starting a program for the first time and let it set things up based on
the environment if that make senses. But I guess sometime when there's
multiple choice, we can select default.

Anyway, I've looked in the xl.cfg man page and there's already plenty of
example where "default" is an option, so I guess it doesn't really hurt
to have the option to choose to not choose. You still need to write in
the man page that "default" is the default option, as in the absence of
the option in the configuration the default option will be used (unless
you managed somehow to make the option mandatory, but is they a reason
for that?).

In any case, there's going to be a 3-state option between xl and libxl
which are going to be default, false, true. It doesn't matter whether a
user can write default or not.

> > > +- "enabled": The grants are always enabled.
> > > +
> > > +- "disabled": The grants are always disabled.
> > 
> > > +            if ((virtio->grant_usage == LIBXL_VIRTIO_GRANT_USAGE_ENABLED) ||
> > > +                ((virtio->grant_usage == LIBXL_VIRTIO_GRANT_USAGE_DEFAULT) &&
> > > +                 (virtio->backend_domid != LIBXL_TOOLSTACK_DOMID))) {
> > 
> > I think libxl can select what the default value should be replace with
> > before we start to setup the guest. There's a *_setdefault() phase were
> > we set the correct value when a configuration value hasn't been set and
> > thus a default value is used. I think this can be done in
> >     libxl__device_virtio_setdefault().
> > After that, virtio->grant_usage will be true or false, and that's the
> > value that should be given to the virtio backend via xenstore.
> 
> I am not great with Xen's flow of stuff and so would like to clarify a
> few things here since I am confused.
> 
> In my case, parse_virtio_config() gets called first followed by
> libxl__prepare_dtb(), where I need to use the "grant_usage" field.
> Later libxl__device_virtio_setdefault() gets called, anything done
> there isn't of much use in my case I guess.

:-(, I feel like something is missing. I would think that
libxl__prepare_dtb() would be called after any _setdefault() function.
Maybe something isn't calling setdefault for virtio devices soon enough
in libxl.

> Setting the default value of grant_usage in
> libxl__device_virtio_setdefault() doesn't work for me (since
> libxl__prepare_dtb() is already called), and I need to set this in
> parse_virtio_config() only.

I don't think that `xl` should set any default, that would be better
done in libxl. libxl could be used by another program, such as
`libvirt`.

> Currently, virtio->backend_domid is getting set via
> libxl__resolve_domid() in libxl__device_virtio_setdefault(), which is
> too late for me, but is working fine, accidentally I think, since the
> default value of the field is 0, which is same as domain id in my
> case. I would like to understand though how it works for Disk device
> for Oleksandr, since they must also face similar issues. I must be
> doing something wrong here :)

No, I think something is missing for virtio devices.

For disk, there's code in initiate_domain_create() which call
libxl__disk_devtype.set_default() for every disk, and this happen before
libxl__prepare_dtb(). I don't know how other device types are doing this
defaulting, I need to search.

There's also a special case for nic, a call of
libxl__device_nic_set_devids() does call set_default for nics.
Otherwise, I think set_default() is called whenever something calls
add().


So, for virtio devices in libxl, I think we will also want to call
set_default() early. Add a call to libxl__virtio_devtype.set_default()
in libxl__domain_config_setdefault() similar to the one done for disk.
(For disk, at the moment it is done in initiate_domain_create() but
let's use the new libxl__domain_config_setdefault() function for
virtio.)

This means that libxl__device_virtio_setdefault() would be called twice
for each device, but that shouldn't be an issue.

Would that work?

> Lastly, libxl__virtio_from_xenstore() is never called in my case.
> Should I just remove it ? I copied it from some other implementation.

I don't think from_xenstore() is normally called when creating a guest,
but if we had an `xl` command called "virtio-list", like there's
"block-list", then from_xenstore() would be use I think. It could also be
use when doing *-detach, even if virtio doesn't have the option.


Cheers,

-- 
Anthony PERARD

