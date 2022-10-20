Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75306063CC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 17:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426885.675644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olX7y-0005DL-Bj; Thu, 20 Oct 2022 15:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426885.675644; Thu, 20 Oct 2022 15:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olX7y-0005BV-8o; Thu, 20 Oct 2022 15:06:34 +0000
Received: by outflank-mailman (input) for mailman id 426885;
 Thu, 20 Oct 2022 15:06:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iaqk=2V=citrix.com=prvs=285ecbe66=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1olX7w-0005BP-JR
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 15:06:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6c640ed-5088-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 17:06:31 +0200 (CEST)
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
X-Inumbo-ID: c6c640ed-5088-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666278391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bVN7ZWAH5fn95rabhI2OjoclmsTOib16zT0YVRWBEjM=;
  b=fABZkyAKPN1JkI2n3hnN86QgR//xIOkf4kz7hR/GeOf/9zUJJyndLkRa
   4Hrr6DslNNyJ2ijig9X/yGoT/fJFOqn8CiP5AwUkXXBmhJ3zQ43TBvn+u
   ZYQarcU8SXDJ+W2GjftBZJ4TsNMQ3RsTUoTLJjLJM9J7FfBT3uhlk5ZHY
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 85696420
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:L5+ZQqz7YJOneQ45mYF6t+fVxirEfRIJ4+MujC+fZmUNrF6WrkVSx
 2caWjvSOPaMYmvyLdEgPNuxpEtSuJXQyYJqSwpkpSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtC5gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/dgoKGBK8
 aMjOGoIVDbf29ronqOmY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKFJ4LbG5kPxi50o
 Erc1WShISMdF+fG0Bnb0FaRqKzxjBzSDdd6+LqQqacx3Qz7KnYoIBwJV3OrrP+hkEm8VtlDb
 UsO9UIGsqwa5EGtCN7nUHWQgHOCpA9aZNNWHMUz8gTLwa3Riy61B2ULSXh6ddEnrsgeTCYvk
 FSOmrvBLzF1rKecT37b076OtC6zIgAcN2pEbigBJSM97sXuuscTiQPCVf5qCqvzhdrwcRngz
 jbPoCUgirE7ic8Qy7797V3BmyirpJXCUkgy/Aq/Y46+xlonPsj/PdXusAWFq6YbRGqEcrWfl
 H86xOGf6ORRNoHXkRarHLk1Qu+4+t/QZVUwnmVTN5Um8j2s/VuqcoZR/CxyKS9VDyoURdP6S
 BSN4F0Mvfe/KFPvNPYqONzpV6zG2IC6TbzYuubogs2ii3SbXCuO52lQaEGZxAgBe2B8wPhka
 f93nStBZEv26JiLLhLsGo/xMpdxnEjSIF8/oriilnyaPUK2PiL9dFv8GALmghoFxK2Fuh7J1
 N1UKtGHzR5SOMWnPHeJqNdDcQxUdiVhbXwTlyCwXrfZSjeK5Ul7U6OBqV/fU9YNc1tpehfgo
 SjmBx4wJKvXjnzbMwSaAk1ehEfUdc8n9xoTZHV0VX7xgiRLXGpaxPpGH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwTEGiYqmtAMsSmxGGgHTzy7T+z0+OeSGBXV/Zdq8bhoLcIoiOHGPEyMxeK
IronPort-HdrOrdr: A9a23:12FmS6FihngCJ35tpLqE6seALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZUgpHvJYVkqNE3I9eruBEDEewK7yXcX2/h1AV7BZniEhILAFugLhuGO/9SjIVydygc079
 YYT0EUMr3N5DZB4/rH3A==
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="85696420"
Date: Thu, 20 Oct 2022 16:06:16 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Peter Hoyes <Peter.Hoyes@arm.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, Diego Sueiro <Diego.Sueiro@arm.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [PATCH] tools/xendomains: Restrict domid pattern in LIST_GREP
Message-ID: <Y1Fj6J/iWYJ4fx8J@perard.uk.xensource.com>
References: <20221003144216.2297632-1-peter.hoyes@arm.com>
 <E63CD72F-9C98-4EB2-840C-56C46BFD7BA1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <E63CD72F-9C98-4EB2-840C-56C46BFD7BA1@arm.com>

On Tue, Oct 18, 2022 at 08:13:57AM +0000, Bertrand Marquis wrote:
> Hi,
> 
> Gentil ping on this one as it might be a suitable one for 4.17

Yeah, that might be a good bug fix to have.

> > On 3 Oct 2022, at 15:42, Peter Hoyes <Peter.Hoyes@arm.com> wrote:
> > From: Peter Hoyes <Peter.Hoyes@arm.com>
> > 
> > The xendomains script uses the output of `xl list -l` to collect the
> > id and name of each domain, which is used in the shutdown logic, amongst
> > other purposes.
> > 
> > The linked commit added a "domid" field to libxl_domain_create_info.
> > This causes the output of `xl list -l` to contain two "domid"s per
> > domain, which may not be equal. This in turn causes `xendomains stop` to
> > issue two shutdown commands per domain, one of which is to a duplicate
> > and/or invalid domid.
> > 
> > To work around this, make the LIST_GREP pattern more restrictive for
> > domid, so it only detects the domid at the top level and not the domid
> > inside c_info.
> > 
> > Fixes: 4a3a25678d92 ("libxl: allow creation of domains with a specified
> > or random domid")
> > Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>

Parsing json with bash, grep and sed, what could go wrong :-). Anyway,
patch looks fine:

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

