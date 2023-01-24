Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DC1679E4E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 17:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483617.749878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKLtw-0002Jj-7H; Tue, 24 Jan 2023 16:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483617.749878; Tue, 24 Jan 2023 16:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKLtw-0002H9-4g; Tue, 24 Jan 2023 16:12:00 +0000
Received: by outflank-mailman (input) for mailman id 483617;
 Tue, 24 Jan 2023 16:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zJtm=5V=citrix.com=prvs=3811cd0e8=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pKLtu-0002H1-IG
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 16:11:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1925d5b-9c01-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 17:11:56 +0100 (CET)
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
X-Inumbo-ID: d1925d5b-9c01-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674576716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aJZjbVq4jKQ0w0wngtXqyqo/hwzFxt75DZOtebZQHFs=;
  b=fNQYr6Hz6NABRj0rWUnd9aY2lZJzpVn0JWJq8l3D1dFaa5AAFG5xHJI8
   k3leCbo6LnjvFAAnhb9jbQRY/jJhjgpujBhSCbCDZHcQje3JREvDkQCjG
   d4ZZ/Wht0wgSI1NFvOswF4bzFlnAkroD5K6tvtOvGOw+RjgxfndIWDWoF
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94058108
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:GxeXy6+4c9v4OCAQ99JqDrUDnnmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 moWWm6CMvjfNGTyed9zPNnj9UtUvJ/SyoNgTlBkqyw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKoX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkley
 fomdh5RaSmdrP/u8OKge6pIiNQ8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0Ewh7F9
 juerwwVBDkbBvGm4gSk6E6lg8TBjQGhBo85F4OBo6sCbFq7mTVIVUx+uUGAifS1l0ekV9V3K
 0Ue+S01se40+VDDZsH3WBuqoXiFlgQRV9pZD6sx7wTl4q/d+Q2UAi4NVjBMbNYvqcoeSjkj1
 1vPlNTsbRR3sLyRTH618raSpCm1fy8PIgcqbDcJVwIf7/H/oYs4iVTESdMLOKuukvXvFD3wy
 izMpy87750Zl8ULyq6473jOhDbqrZ/MJiYt7xjTdnKo6EV+foHNT5ap4ljS9/oGLIufQlSbp
 38Cs8yf6ukUCteKjiPlaPwAGazs6/ubPTn0h1lpEJ88sTO39BaLZoBd5i1zNW9mN88FfXniZ
 0q7kRhK+JZZMX+ubKl2S4G8EcInye7nD9uNfvnJdNdKY5V3XAaa5ixqPhTW2W3x+GAsiaYiI
 oyad+62AH8RFaN8ij2sSI81wbItgywz227XbZT61Ai8l6qTYmaPTrUIO0fIafo2hJ5ouy2Mr
 YwZbZHTjUwCDqunOHK/HZMvwU4iPUQ9O87Y98tuaMWeejo2A1BiL/HB3uZ0E2B6pJh9muDN9
 3C7f0ZXzlvjmHHKQTm3hmBfhKDHBsgm8y9iVcA4FRPxgiV4P97zhEsKX8FvFYTL4tCP2hKdo
 xMtX8ybSspCRT3ck9j2Rcms9dcyHPhHaO/nAsZEXNTdV8Q4L+Aq0oW+FucKyMXpJnTfiCfGi
 +f8vj43uLJaL+iYMO7Yaei003S6tmUHleR5UiPge4cMJBm9oNgzdnKh35fbxv3gzj2allOnO
 /u+W09E9YEhXadrmDU2uUx0h9jwSLYvdqarN2La8ay3JUHnEpmLmOd9vBKzVWmFDgvcofzyD
 di5OtmgaJXran4W6dsje1uqpIpij+bSS0hylFQ5RCqbNwn7VtuN4BCuhKFyi0GE/ZcB0SPeZ
 65F0oUy1WmhUC89LGMsGQ==
IronPort-HdrOrdr: A9a23:3iT3NKpzngz3fMBqiuncRfQaV5v5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssRAb6La90cy7LU80mqQFhbX5UY3SPjUO21HYT72Kj7GSugEIcheWnoEytZ
 uIG5IOcOEYZmIK6voSjjPIdurI9OP3i5xAyN2uvEtFfEVPUeVN/g15AgGUHglfQxRHP4MwEN
 656tBcrzStVHwLZoDjb0N1KtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 zukhD/5I+kr/anoyWspVP73tBzop/M29FDDMuDhow8LSjtsB+hYMBbV7iLrFkO0Z+SAAJBqr
 jxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oOTiLQhKQfZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIbRd3jUC5yEBS2tL7t0YvHLf2VYUh5LD3vXklZqvoJRiKn7zPxd
 MeRP01555tACynhj7izyVSKeeXLwgO9ye9MzU/U/OuokJrdVBCvjolLZ8k7wc9HdQGOu1529
 g=
X-IronPort-AV: E=Sophos;i="5.97,242,1669093200"; 
   d="scan'208";a="94058108"
Date: Tue, 24 Jan 2023 16:11:47 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, =?iso-8859-1?Q?Herv=E9?= Poussineau
	<hpoussin@reactos.org>, Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant
	<paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Chuck Zmudzinski
	<brchuckz@aol.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Message-ID: <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230118051230-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230118051230-mutt-send-email-mst@kernel.org>

On Wed, Jan 18, 2023 at 05:13:03AM -0500, Michael S. Tsirkin wrote:
> On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
> > This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally removes
> > it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in the PC
> > machine agnostic to the precise southbridge being used. 2/ will become
> > particularily interesting once PIIX4 becomes usable in the PC machine, avoiding
> > the "Frankenstein" use of PIIX4_ACPI in PIIX3.
> 
> Looks ok to me.
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Feel free to merge through Xen tree.

Hi Bernhard,

The series currently doesn't apply on master. And a quick try at
applying the series it is based on also failed. Could you rebase it , or
maybe you would prefer to wait until the other series "Consolidate
PIIX..." is fully applied?

Thanks.

> > Testing done:
> > None, because I don't know how to conduct this properly :(
> > 
> > Based-on: <20221221170003.2929-1-shentey@gmail.com>
> >           "[PATCH v4 00/30] Consolidate PIIX south bridges"

-- 
Anthony PERARD

