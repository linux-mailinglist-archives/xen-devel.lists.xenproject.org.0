Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AAE58FC3F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 14:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384566.619966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM7Kd-00080n-7S; Thu, 11 Aug 2022 12:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384566.619966; Thu, 11 Aug 2022 12:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM7Kd-0007y4-4f; Thu, 11 Aug 2022 12:30:35 +0000
Received: by outflank-mailman (input) for mailman id 384566;
 Thu, 11 Aug 2022 12:30:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oM7Kb-0007xw-5d
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 12:30:33 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 627eeff7-1971-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 14:30:31 +0200 (CEST)
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
X-Inumbo-ID: 627eeff7-1971-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660221031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=enPAxJBks+qIRCJJJ1CYO/xGCjALvTeZ36w2ibudy3c=;
  b=bTUqqThYhywSeILysSVG84gHY4pzTBqlM57mjpSj8QHlhecXoJegWcmU
   WCTlK7LtuGONXWM6S1rjUut+bvtOFZRp/0V2kRYqoGVaQMa440i3Zv3GA
   kDYK8YXeJn0p5s8iBtka4qgLnSnwnlMiWVLAmws6nXkGFsQO0PwGeCSKk
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77871678
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AqsAlEq6C+KAkZ7nm1JbhdAxR2vbMJXerkicv2?=
 =?us-ascii?q?9bI5GJq3hjvcnjo/H4WJzvhRxp6nrJVcA1IXiFm0u1agP2hTJp+Q/MgYCR3R?=
 =?us-ascii?q?4OIfBmiRCwlrBHl7d7Ep9t/kQ8oo88LzXvyzw7rbNsXHEsK6DJ6TdpeZbfWp?=
 =?us-ascii?q?e5ymWeeeqCVEJyNb6h9RbHJqAKeawkva5JNGuTadgWSNidNwVtUfk8jEmHGs?=
 =?us-ascii?q?n3OqwksCxi+Djdp+tLUnwuqspgP6cfPLmZ75d73D1MVZcNLgA/5MLTOV4+li?=
 =?us-ascii?q?f0jkf1D8e6sAiZM/eGRLoRpQKvpQKHsBzNCJr7Dd1McwJ7uKCJQbUluOETfY?=
 =?us-ascii?q?8XnbAlxPtbKt/LUlCcSFdFbIScYumxn5WhH+7QeHtmRpZxl4uTX84BkSMk3v?=
 =?us-ascii?q?87M7pFYZxibEU02siZdkyE8jQrEkssie2DmdHf2zshDbFU3M+ysWKt/RZt5k?=
 =?us-ascii?q?zjiyKg9kqgY2KWRiU4e09gTWxKhnsf19SFiyALA+CtNM7kh8jqzG4H6P/ebA?=
 =?us-ascii?q?lb18gBlqlbZbBy/jGLCtj5b7zVj0px+O4qdMt8TWOgbw4/avFNNJida+R42z?=
 =?us-ascii?q?7VU4nIBMLS/11F1EW2sgEnteOZm4HivoQohHoLNuHWj3FXzrwVYXB+lGeuKN?=
 =?us-ascii?q?//h4fnK8A7WwkuwdPmSrFRH1NshZg5c7bCvvXfc5hqAH9GH0LSqoeYHBDgFf?=
 =?us-ascii?q?roTdJTJUWZOh2/DoMxwipacprPCkiLvGQ4aFNGXqKga4nykCuR0BjtkaLHjA?=
 =?us-ascii?q?ClUxkaqyMyz6ovwv0h80VvXl8uup7+BRZV5ZmpZdib5Sf1k3WY06iNwHy8qo?=
 =?us-ascii?q?vOOI5uZXD7cJB1/VW6BFACr2O0IlgDN6MolCG8eYVUGo3t40RzzKPfXRJt0d?=
 =?us-ascii?q?8NUqO3tdAEq5K0CSFO+ZN80R6qNkcHnoaGD969kwxuJjP6C5zM0lvpTXfZve?=
 =?us-ascii?q?LzSpX23ryVS4GEuZVcuWW3o2HThV0ilYbw4tplCeH5MoKzTPhKsyIgIZJEYG?=
 =?us-ascii?q?6Hejx7USnyj7WjHw4vuodEAm3CL+GU0uZJzHJ8jNjtnLKYHbhxDULoqNB5xd?=
 =?us-ascii?q?gM2o5rL5AqMfFO4RwvBRwdGUVHHpHWY1yVaoJBzVh4JmwkeYENX7IVQLmCF1?=
 =?us-ascii?q?46QeQlsGj3QuH71PKrtxhXsjVoVGE+QuIR662InaLYH8k7v0OSBK/aT6PBaJ?=
 =?us-ascii?q?3aQ5VtLF+mEDG6OebE+YUK80MXmPBLQAkZezlyEIVnQl6Iys/QL/NBmiQbv0?=
 =?us-ascii?q?5PlgX89BYkhVLySkZSnbEtAFZ0xECqlEBscP2NtMgokNX4L7Y/skLQszt5H6?=
 =?us-ascii?q?gwH2Re6MbIeEEFSkZCutYpH6In7mR8ZzK+kFNShgoAbvAwU2Cv9etiojFUhI?=
 =?us-ascii?q?nApAFiN7cpDzqOUW27em1APD4Db1tVvkZO8gRzOVoMRPio9ykEAmtdVg+qnd?=
 =?us-ascii?q?CXtIEOa3Sm5N7KRHUWeNiabuDPV6POnkq80oqp22rBTm/y0ue/Cm7Duie4Av?=
 =?us-ascii?q?1RrhSViEttNtTCjy/yGxR+MDGusJQpMn1h0crVemKW18XlD9g4mB7MOGoHFR?=
 =?us-ascii?q?Zb6FCj2h5d466sRbwHJjc3qRZUWQ4tV+MFBVlN0zK1Gr7eV8Iu7NGNnPNU3j?=
 =?us-ascii?q?YBHBVut8lJApePMQsc0OKACN2RuK8cO/crbuuHWUKrtf2FB+KxbFskrI2aHn?=
 =?us-ascii?q?zyUUEjMsnPIDpBV8c1E8U4UgE94LEBByM5DbbQQFY1m+8RcVB5U1FisMOWdk?=
 =?us-ascii?q?7kT5KOGwj+Nu987E7Yzq+gSNWCmA4x0p2h5865awZJavj2AKvsAbNlX4Pr/j?=
 =?us-ascii?q?F3Ju6oGtvaXrhE0zxX4Oz2di98QLKtMYvrRAeYVSm0UdjLzjxq0ug3TK+Axq?=
 =?us-ascii?q?3y9njr5gwT6Z+BeE1EtmXSWgwru5A1l1c8s12kTImKangJ3tpfIdTo2aSJca?=
 =?us-ascii?q?q5bH7M4/r83MNTO7LHTqnZEox4sGcjt3Czk8vM9vXPxNvXeEwMJFj944C31N?=
 =?us-ascii?q?zkT7W/Wu6Gwx1lwH3BoDgLzMJwNxW9T9+FZpJG77QQqcM0h3amDnvIcHdZef?=
 =?us-ascii?q?9ShCpWfXZDKlhhIc38BmwLOwhaqq1Z9FmZupiKjqOaNIcc7LWYGDuYdnX5n1?=
 =?us-ascii?q?BICqtFnNJqAxCZwdvV79mAs8VeFJxFy3QqdB+xyWbCbo4Zkl8wgOhwWobCMd?=
 =?us-ascii?q?PDPqkffeznKFWhCsmsflA+bCEdGj89KeUMiZ218xqdGmYYd18tQgiLMT1tXO?=
 =?us-ascii?q?ad/483mYHvN9Aj1TI6HCLQ5O7gkd5CwtIER6I+LHoq3eRISxTHjuFGi39G6Z?=
 =?us-ascii?q?lcS5XgrvhFrcPq409lQMd/LnQIy+SMfQg1x809/5z3mC1k3WDU3pch3Ost0d?=
 =?us-ascii?q?jFy9ZNHyV5TLJmvLE82oNukWqxW2pfZkxGZHNUap7NLXb//BU6tc5khU8fRu?=
 =?us-ascii?q?eOXPwyt+41s6SBMUuA1D0tokR6ahMnTRR/PtLlH/4e+0lbUJNh2QyoPJFxKl?=
 =?us-ascii?q?51h6BSP3oaxVCjH/xH7zRuqrJSEW+fhlmFNZKVF7UW07su+sG9+8e555fi4o?=
 =?us-ascii?q?+HECU77qiVWyo+fXr7SwOHh6Rffoka0Kq78mVUofHjlgjyatkzN/qlEvKY4v?=
 =?us-ascii?q?aMDTU3eyt2vHDNd4KOodH6a15r/pmi5tyeHllHN6/mjndzTasl4Ah+KCPpj2?=
 =?us-ascii?q?+MX+D1IbTX4ieZDV1kZXiaAK1YmoldkEF/KV0fbBBzAoaJmA3u1NkAe+GzUO?=
 =?us-ascii?q?htNY1Q5XB0rBK2IYIpkXjpHkVJJoLrYSHnN8mGyfH+YWozkamMoO0FfO7XsQ?=
 =?us-ascii?q?ErQayksGnjlYj56JY+6poQ9ReOpHgPtPY2yQlGSvCIVzMOpcb/ClYuDf3m4F?=
 =?us-ascii?q?0xv11M9qHDqLCN1/7QSYKNDiwIOLQk9rXVR6CsH8dg78IV5LCRSvw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="77871678"
Date: Thu, 11 Aug 2022 13:30:25 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 2/2] tools/libxl: Replace deprecated -soundhw on QEMU
 command line
Message-ID: <YvT2YQQmaKyiKMAK@perard.uk.xensource.com>
References: <20220808110545.62886-1-anthony.perard@citrix.com>
 <20220808110545.62886-3-anthony.perard@citrix.com>
 <CAKf6xpuyK-5-UH4JOVDHidVgE+GBsS8a947LyAOVNORQRpsfew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKf6xpuyK-5-UH4JOVDHidVgE+GBsS8a947LyAOVNORQRpsfew@mail.gmail.com>

On Tue, Aug 09, 2022 at 08:17:49AM -0400, Jason Andryuk wrote:
> On Mon, Aug 8, 2022 at 7:06 AM Anthony PERARD <anthony.perard@citrix.com> wrote:
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index 6d98d73d76..b2901e04cf 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -2555,9 +2555,9 @@ The form serial=DEVICE is also accepted for backwards compatibility.
> >
> >  =item B<soundhw="DEVICE">
> >
> > -Select the virtual sound card to expose to the guest. The valid
> > -devices are defined by the device model configuration, please see the
> > -B<qemu(1)> manpage for details. The default is not to export any sound
> > +Select the virtual sound card to expose to the guest. The valid devices are
> > +B<hda>, B<ac97>, B<es1370>, B<adlib>, B<cs4231a>, B<gus>, B<sb16> if there are
> > +available with the device model QEMU. The default is not to export any sound
> >  device.
> 
> Is it worth mentioning driver support?  I think Windows 7 and later
> only have a built-in driver for hda.  Windows 7 definitely doesn't
> have a built-in driver for ac97.  I think all the other devices are
> even older, so I doubt Windows has drivers for those, but I have not
> checked.

No, I don't think we can mention drivers support, we don't test any, it
would be incomplete, and we can't do anything if a driver is broken.
I've put "hda" first on the list in the hope that if someone wants a
sound card but don't know which one to use, they will try this one
first.

Thanks,

-- 
Anthony PERARD

