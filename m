Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F214B9DD8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 11:59:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274643.470183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeVZ-0004Ub-T3; Thu, 17 Feb 2022 10:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274643.470183; Thu, 17 Feb 2022 10:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeVZ-0004Rh-P2; Thu, 17 Feb 2022 10:59:33 +0000
Received: by outflank-mailman (input) for mailman id 274643;
 Thu, 17 Feb 2022 10:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzVd=TA=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nKeVY-0004RX-4O
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 10:59:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id add93785-8fe0-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 11:59:30 +0100 (CET)
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
X-Inumbo-ID: add93785-8fe0-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645095570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZqAs0fk/xAXnllDiy4SxZ+MynxdNz0fhyVsASs+4ueE=;
  b=WeAfbFhJA/O0eJ2kmz/lK6dR8XpPOGHiRxSDopEvsLzNaSW18WRn0lO5
   VRSwZQNlhm0D6EvOdJs95nQGOQUe9CBH6q7KGJ+WytqTr+UzieVoqvimv
   HKS4WHxMK61iu3Xy+HGdbCPwObx8PELx96N/QaByekDVaK+82wo3duGJt
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7qEhOOmzBirL7zEWWSfRAI0CARMbfh9qq72ADa3HIVeBGKnFyg9kcv4zZeIhOejXq4B1Tyi9gN
 cAMykRcBzIk/VoXFqpvBYRKXMznxLlZeN42izYAiw+6B43+Mq0SpqNc8gwnMUFQzqmCbAkYeUo
 vFlNJBIuBJJDLwrs08S1Y0vN5yimTstSolWhmxt2YdUgeaiWUBv3bXbAkbrkJBBUSLfGMiwHgY
 p2fAbHCzGQTWqC0EjxUgNoAuT/Al67Uip5HMOtdi/wH7uWdJlvxw9NUELF+SPUMRBVUtz9qWlS
 0/b5lhUnUyciMrl61aNdpnOw
X-SBRS: 5.1
X-MesageID: 64421317
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OqRltK9fNOlZNH6C9upEDrUDXXmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 jFMDW7TPv+KYDCkKIx/bIzlo0lXu8PSz9dhSwFlpCk8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhO8
 I8SjZWAbjsPFYnAmcMXaB5GMXtXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4SQayHP
 JNGAdZpRDDvXxtFeXg2MbB9jfqGv1zzKB9DlU3A8MLb5ECMlVcsgdABKuH9eNOQQt5Otl2Fv
 W+A9GP8ajkYPtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIxqYAi+UrtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEA7dmQeUNUWk/MQbhgm1
 3iDpNT3J2ZG5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A70JZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CRV8yR9xLpXZX1oqMBraL9SdF1Oz6zYWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuMILZyT0MfIsPN/Z5yEWIU7IT4uNuhf8NIcmX3SMXFXfoHEGibC4hAgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eRD+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe8J0NKbDdc1E3QwnMyZb5mNscRmCspIwN/s+gw
 513chYwJIPXiSKVJAOURGpkbb+zD59zoWhiZX4nPEqy2mhlaoGqtf9Ne5wydLgh1epi0f8rE
 KVVJ5TeWqxCGmbd5jAQTZjht4g+Jh6lsh2DYni+az8lcp8+GwGQoo34fhHi/TUlBzassZdsu
 KWp0w7WGMJRRwlrAMvMRuioyle94SoUlO5oBhOaKdhPYkT8toNtLnWp3PMwJsgNLzTFxyebi
 FnKUUtJ+7GVrtZsotfThK2Co4O4KMdEHxJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbiquMIzglgG3mXPV2nBqk5fyuD1MhL8KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+OvVWEpfCBCAlShBIeYnK4gi2
 +og5JYb5gHXZsDG6TpaYvS4L1ixE0E=
IronPort-HdrOrdr: A9a23:be8HHKHOuOmvfmuzpLqE1seALOsnbusQ8zAXPidKOHtom62j5q
 STdZsgpH3JYVoqOE3I+urgBEDjewK7yXcd2+B4V9rPYOCPghrQEGgI1/qG/9SPIVycygd179
 YZT0AgY+eaMbEBt6jHCaODYq0dKaK8n5yVuQ==
X-IronPort-AV: E=Sophos;i="5.88,375,1635220800"; 
   d="scan'208";a="64421317"
Date: Thu, 17 Feb 2022 10:59:24 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] tools/libxl: don't allow IOMMU usage with PoD
Message-ID: <Yg4qjERzoki2Lpi/@perard.uk.xensource.com>
References: <20220203143211.18967-1-roger.pau@citrix.com>
 <YgvB5UtyC29m8zbo@perard.uk.xensource.com>
 <Ygy/4zk8Eo78ECi5@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ygy/4zk8Eo78ECi5@Air-de-Roger>

On Wed, Feb 16, 2022 at 10:12:03AM +0100, Roger Pau Monné wrote:
> On Tue, Feb 15, 2022 at 03:08:21PM +0000, Anthony PERARD wrote:
> > On Thu, Feb 03, 2022 at 03:32:11PM +0100, Roger Pau Monne wrote:
> > >      if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
> > > -        d_config->num_pcidevs && pod_enabled) {
> > > +        d_config->c_info.passthrough != LIBXL_PASSTHROUGH_DISABLED &&
> > > +        pod_enabled) {
> > >          ret = ERROR_INVAL;
> > > -        LOGD(ERROR, domid,
> > > -             "PCI device assignment for HVM guest failed due to PoD enabled");
> > > +        LOGD(ERROR, domid, "IOMMU not supported together with PoD");
> > 
> > I'm not sure that this new error message is going to be good enough to
> > point out configuration issue for the guest.
> > 
> > One is going to set 'pci=["foo"]' or 'dtdev=["bar"]', which will enable
> > passthrough. Then they may get en error about IOMMU or PoD.
> > Should we maybe write something like this instead?
> > 
> >    "IOMMU or device passthrough not supported together with PoD"
> 
> The "or" seems weird to me: IOMMU is mandatory for device passthrough.
> Maybe:
> 
> "IOMMU required for device passthrough but not support together with PoD"

                                                 ^ supported ?
> Would that be OK?

Sound good, with that new error message: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

