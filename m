Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1926B2207A9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 10:43:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvd0s-00067Z-Om; Wed, 15 Jul 2020 08:43:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvd0q-00067S-Kd
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 08:43:36 +0000
X-Inumbo-ID: 450ad31c-c677-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 450ad31c-c677-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 08:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594802615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LtIovrDRKRVQOx6LezTe8u0WyCRzFKL+6oJm1gZCxU0=;
 b=fsgq+PqwrldIJ8oOfRPrzUX66l9vbAsADJQ208PA0WeEfxLgfjWxihtP
 weCC9Z6r0MBib7MV73EujBYK1/G6HuyiTcvuSKR382fTYGRZuNpHGIivX
 3e2lx+PjGubpB9bwQ73ShRVTUMFostofH0Xz9sKEkfPiSdRczPpMwukvA A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6gD07dbHdMmGsBeraAY5oSVSybiFjz4OED5sAvK0ArctRRDcgo/R5JaboNEOi0zNP8XgSRZt+6
 S9IN2PIMYvgcY0mxOkkoMwqTvrVS9AVvOxLfKXRvrF58MTIwROtPzgIy8SNoGGYm+oH1EwiqVv
 Z1Zz9er2TP7gCUXrODa63in3hKS+fK+rw0Woy7DOxTUe/DbwpmpNT+7vbNJcyneGDJYjo7pyLZ
 euhxalbUYHx2vKzPIPkCUlVmtz51AhZbiMHBl7z4jcg9OZ5OnBkmLCCTOYBk0+c1/WwdcDRuWq
 Htw=
X-SBRS: 2.7
X-MesageID: 22408004
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,354,1589256000"; d="scan'208";a="22408004"
Date: Wed, 15 Jul 2020 10:43:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 1/7] x86: fix compat header generation
Message-ID: <20200715084325.GT7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <a8139d0e-f332-b877-dea8-3ce8a6869285@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8139d0e-f332-b877-dea8-3ce8a6869285@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 01, 2020 at 12:25:15PM +0200, Jan Beulich wrote:
> As was pointed out by 0e2e54966af5 ("mm: fix public declaration of
> struct xen_mem_acquire_resource"), we're not currently handling structs
> correctly that have uint64_aligned_t fields. #pragma pack(4) suppresses
> the necessary alignment even if the type did properly survive (which
> it also didn't) in the process of generating the headers. Overall,
> with the above mentioned change applied, there's only a latent issue
> here afaict, i.e. no other of our interface structs is currently
> affected.
> 
> As a result it is clear that using #pragma pack(4) is not an option.
> Drop all uses from compat header generation. Make sure
> {,u}int64_aligned_t actually survives, such that explicitly aligned
> fields will remain aligned. Arrange for {,u}int64_t to be transformed
> into a type that's 64 bits wide and 4-byte aligned, by utilizing that
> in typedef-s the "aligned" attribute can be used to reduce alignment.
> Additionally, for the cases where native structures get re-used,
> enforce suitable alignment via typedef-s (which allow alignment to be
> reduced).
> 
> This use of typedef-s makes necessary changes to CHECK_*() macro
> generation: Previously get-fields.sh relied on finding struct/union
> keywords when other compound types were used. We now need to use the
> typedef-s (guaranteeing suitable alignment) now, and hence the script
> has to recognize those cases, too. (Unfortunately there are a few
> special cases to be dealt with, but this is really not much different
> from e.g. the pre-existing compat_domain_handle_t special case.)
> 
> This need to use typedef-s is certainly somewhat fragile going forward,
> as in similar future cases it is imperative to also use typedef-s, or
> else the CHECK_*() macros won't check what they're supposed to check. I
> don't currently see any means to avoid this fragility, though.
> 
> There's one change to generated code according to my observations: In
> arch_compat_vcpu_op() the runstate area "area" variable would previously
> have been put in a just 4-byte aligned stack slot (despite being 8 bytes
> in size), whereas now it gets put in an 8-byte aligned location.
> 
> There also results some curious inconsistency in struct xen_mc from
> these changes - I intend to clean this up later on. Otherwise unrelated
> code would also need adjustment right here.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

