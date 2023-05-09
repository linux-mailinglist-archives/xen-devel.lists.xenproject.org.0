Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826256FC9D7
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 17:06:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532282.828404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOuf-0000aa-Ka; Tue, 09 May 2023 15:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532282.828404; Tue, 09 May 2023 15:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOuf-0000Xp-H6; Tue, 09 May 2023 15:06:01 +0000
Received: by outflank-mailman (input) for mailman id 532282;
 Tue, 09 May 2023 15:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Biuh=A6=citrix.com=prvs=486aa7bf2=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pwOue-0000Xh-EY
 for xen-devel@lists.xen.org; Tue, 09 May 2023 15:06:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 000def68-ee7b-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 17:05:58 +0200 (CEST)
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
X-Inumbo-ID: 000def68-ee7b-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683644758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bV1tKTDmJVds5vajKV71uNrbCCoYJAfcysJpmJz6VyI=;
  b=XztEkyq1yx6NqHNW5PoAXdjKEgMkep4Fz72rAwpp8QZ/SbYBY659ymke
   Rpr53TBiEuyHDTL3y1mpqvWl0yaIYtu3nZSUT/yPDy0Jn7+XQFERScghR
   6pYkWuW4CwNrmO32ADjdRYOQ3YrNZ9V9UEBvQnG2WucT+NcEAicxZ3eU1
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110858831
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:xR9BHqAKGwAT3BVW/3jkw5YqxClBgxIJ4kV8jS/XYbTApGgm0DYPz
 2YYWTiDPK2DYDegKN4jaNnnpEIE7Z7TyNdnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A7wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwp/wmUV8Q+
 qchcgstaRPYvfy875jgc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XSFZgFzh3Bz
 o7A12/cJyg+a+ed8CKuz0L9mPHTlDmqAJ1HQdVU8dY12QbOlwT/EiY+S1qhrOK5zE2jXttFA
 0gV/CM0qu417kPDZsnwWVi0rWCJujYYWsFMCKsq5QfLzbDbiy6bCXIDVSVpc8E9uYk9QjlC/
 l2Um9LkAxR/vbvTTmiSnp+KrDW5NC4Ja2AfZDMYShct59jlqZs0yBXVQb5LC7Kvh8HyAnT8z
 i6iqzB7g7QIkdVN06S99ErAxTW2qfDhRwo49kPdU2Sj4w5RYI+jbpavr1/B4p5oKY+FTliMo
 T4cnMmE7e0UJZWMkiWXR6MGG7TBz/GBPT7HnU90H7Eu8j2s/zioeoU4yDxkJUQvKc0EeDvtY
 UnckQdQ4pZJOz2td6AfS4upBt4j16TICdXvXfeSZd1LCqWdbyfeonsoPxTJmTmwzg51y/pX1
 YqnndiEUGxLWZo5w2GPHdw91rxw/D406kmIfMWup/i46oa2aHmQQLYDFVKBaOEl8a+JyDnoH
 8Zj29iikEsGDrCnCsXD2ctKdA1RcyBnbXzjg5YPHtNvNDaKD43I5xX55bo6M7JokK1O/gsj1
 iHsAxQIoLYTaJCuFOlrVpyBQOm3NXqchShhVcDJAWtEI1B5Pe6SAF0jX5U2Z6I70+do0OR5S
 fIIE+3ZXKQUF2ueqmpCMMmtxGCHSClHeCrUZ3b1CNTBV8QIq/P1Fi/MIVK0qXhm4tufvsoiu
 bywvj7mrW44b106Vq7+Mav/p25dSFBBwIpaRVXTGNBPdS3Eqc4yQ8AHpqNtcp5kxNSq7mfy6
 jt69j9C+7Gc/9FsrYmZ7U1Gxq/we9ZD8oNhNzGzxd6L2ePypAJPHacovD60QA3g
IronPort-HdrOrdr: A9a23:bl58iK5ZPUvELCcRqQPXwDjXdLJyesId70hD6qkQc3Fom62j5q
 STdZEgvyMc5wx/ZJhNo7690cq7MBbhHPxOkOos1N6ZNWGLhILPFuBfBOPZqAEIcBeOlNK1u5
 0BT0EEMqyWMbB75/yKnDVREbwbsaa6GHbDv5ah859vJzsaGp2J921Ce2Cm+tUdfng9OXI+fq
 Dsn/Zvln6bVlk8SN+0PXUBV/irnay3qHq3CSR2fyLO8WO1/EiV1II=
X-Talos-CUID: =?us-ascii?q?9a23=3ASHTWDWgKKd7Vly9BiBnTpWdz5jJuL2eMnEmOLBS?=
 =?us-ascii?q?BU11JT77Oc0Ga14k/qp87?=
X-Talos-MUID: 9a23:9Y4SvAZze7XwM+BTvBrJvRU9D8VR+4+TOBETj4kPoZjcKnkl
X-IronPort-AV: E=Sophos;i="5.99,262,1677560400"; 
   d="scan'208";a="110858831"
Date: Tue, 9 May 2023 16:05:45 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Erik Schilling
	<erik.schilling@linaro.org>
Subject: Re: [PATCH] libxl: arm: Allow grant mappings for backends running on
 Dom0
Message-ID: <e6b10450-50c2-468c-88ba-36e0274b5970@perard>
References: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
 <92c7f972-f617-40fc-bc5d-582c8154d03c@perard>
 <20230505093835.jcbwo6zjk5hcjvsm@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230505093835.jcbwo6zjk5hcjvsm@vireshk-i7>

On Fri, May 05, 2023 at 03:08:35PM +0530, Viresh Kumar wrote:
> Hi Anthony,
> 
> On 02-05-23, 15:44, Anthony PERARD wrote:
> > > diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
> > > index faada49e184e..e1f15344ef97 100644
> > > --- a/tools/libs/light/libxl_virtio.c
> > > +++ b/tools/libs/light/libxl_virtio.c
> > > @@ -48,11 +48,13 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
> > >      flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio->base));
> > >      flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
> > >      flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
> > > +    flexarray_append_pair(back, "forced_grant", GCSPRINTF("%u", virtio->forced_grant));
> > >  
> > >      flexarray_append_pair(front, "irq", GCSPRINTF("%u", virtio->irq));
> > >      flexarray_append_pair(front, "base", GCSPRINTF("%#"PRIx64, virtio->base));
> > >      flexarray_append_pair(front, "type", GCSPRINTF("%s", virtio->type));
> > >      flexarray_append_pair(front, "transport", GCSPRINTF("%s", transport));
> > > +    flexarray_append_pair(front, "forced_grant", GCSPRINTF("%u", virtio->forced_grant));
> > 
> > This "forced_grant" feels weird to me in the protocol, I feel like this
> > use of grant or not could be handled by the backend. For example in
> > "blkif" protocol, there's plenty of "feature-*" which allows both
> > front-end and back-end to advertise which feature they can or want to
> > use.
> > But maybe the fact that the device tree needs to be modified to be able
> > to accommodate grant mapping means that libxl needs to ask the backend to
> > use grant or not, and the frontend needs to now if it needs to use
> > grant.
> 
> I am not sure if I fully understand what you are suggesting here.

I guess the way virtio devices are implemented in libxl suggest to me
that the are just Xen PV devices. So I guess some documentation in the
tree would be useful, maybe some comments in libxl_virtio.c.

> The eventual fronend drivers (like drivers/i2c/busses/i2c-virtio.c)
> aren't Xen aware and the respective virtio protocol doesn't talk about
> how memory is mapped for the guest. The guest kernel allows both
> memory mapping models and the decision is made based on the presence
> or absence of the iommu node in the DT.

So, virtio's frontend don't know about xenstore? In this case, there's
no need to have all those nodes in xenstore under the frontend path.

I guess the nodes for the backends are at least somewhat useful for
libxl to reload the configuration of the virtio device. But even that
isn't probably useful if we can't hot-plug or hot-unplug virtio devices.

Are the xenstore node for the backend actually been used by a virtio
backend?

Cheers,

-- 
Anthony PERARD

