Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E070508C
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 16:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535237.832906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyvcK-0001Wr-2J; Tue, 16 May 2023 14:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535237.832906; Tue, 16 May 2023 14:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyvcJ-0001Uf-Vw; Tue, 16 May 2023 14:25:31 +0000
Received: by outflank-mailman (input) for mailman id 535237;
 Tue, 16 May 2023 14:25:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0wm=BF=citrix.com=prvs=4936e02c6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pyvcI-0001UF-Jj
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 14:25:30 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80a5b2fc-f3f5-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 16:25:28 +0200 (CEST)
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
X-Inumbo-ID: 80a5b2fc-f3f5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684247128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aGmtyziSnn1Gib25HiVVWwKSGRKb01gX2nE2o8MoFMc=;
  b=iNkb4Ng+Cn/SUg8qr8dTxuzVkv2AnLODQZ6hB8y/MP2vfUOUy+N7FIeK
   UxlxuWbqloaOeVMFIV6SxVRjfIHwJYd4NlEVJ4WAzSSOR7ZhBrJnsVm3o
   xrPf2+/dXssA9I9ggt2dh45h+JJce+3mGQ3fry1KPPISI94iy6c+TNo1q
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107984133
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:WUeaxazOHDDjFqrAnGB6t+fkwCrEfRIJ4+MujC+fZmUNrF6WrkVSx
 mMbC2mAO/ePY2GmKtlzPt7i9x4D7JKAyodrSgptqSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPK4T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVtW8
 aQDJSJUV0C8he+U6umpTbVVnMt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNwRfI+
 judpAwVBDkTL/CG8Xm70UijqeHuohjlYpMxFuGno6sCbFq7mTVIVUx+uUGAieKlh0C3XdJWA
 1YZ9ionse4580nDZtf0WjW1vWaEuRhaXddMe8Ug6gaLx7H8+QuVBmEYCDVGbbQOrdI3QyAn0
 lahhd7lBTVz9raSTBq1+7qPtTSpODQ9N2IOZSYYCwAC5rHLsIw1yx7CUNtnOKq0lcHuXyH9x
 SiQqyozjKlVitQEv4254EvaijaEvJXFTgcpoA7QWwqN5A5jfoejaIGA81XX7f9cao2eSzGpp
 HgFn82SxOQPC5iXk2qKWuplNKqm7uyXOSfRqURiE5ko63Km/HvLVY1c/ThkKEBBMs8Oejjyf
 AnVtB85zLRUPXG7K59qS420AsUui6PnELzNWu/RcYBmY55/bgaL8ShiI0mK0AjFikknkaglN
 dGbfMCgAGwBDqJPyDuwTv0al7gxyUgWwGrJTp3/iR2/37eabneITJ8KNVKPaqYy66bsiB7O7
 99VOs+OyhNeeO7zeC/a9cgUN19iBWA2GZ3su+RNe+KDKxYgE2YkY9fVzLQrYYV+t75YmufB4
 je2XUow4F/kmVXdJAmKY2wlY7TqNb5np3U9Ly0qPH6y1nQjaJrp56AaH7M0Yr4j+sR5wPJ0R
 uVDcMKFatxfSznW/DISb5jVpp1+eRiigwmDeSGiZVAXZIFIWAHI/tnpYhmp+CRmJjKzncg3p
 qXm2g6zaYIKWgBKHMvQLvW1wDuZpHUYhad4W0zDIfFVf0Pj9pUsLDb+5tcyLsEQIFPKzyGHj
 V6+DhIRpO2LqIgwmPHTgqaCroqyGut6FEdAEEHU6L+3MW/R+W/L6ZZNVfvNcT3DWWfc/qKka
 uNIifbmP5UvnExHspZuO6xmwaI3+53koLoy5g18EW/CdViDFrJqKX7A1s5K3pCh3ZcA51HwA
 BjWvIAHZ/PQYpiN/EMtyBQNVPyHjeoZiGDrvcs3LWfQvz1woIOdXhAHV/WTsxB1ILxwOYIj5
 O4uvs8K9gCy4iYX3sa6YjN8rDrVcCFZO0kzntRDWdKw1FJ3or1XScaEYhIa9q1jfDml3qMCB
 jaPzJTPiL1HrqYpWypiTCOdtQaxaHlnhfyr8LPgDw7R8jYmrqVttPG0zdjQZlo98/m/+7gvU
 lWHzmUsTUl0wx9mhdJYQ0enEBxbCRuS9yTZkgVZyDSGEhf5DzCSdgXR3NphG2hIm1+wgxABp
 O3IoIobeWyCkD7NMtsaBhc+9q2LoS1Z/QzegsG3d/m4820BSWO92MeGPDNYwyYL9Ott3CUrU
 8E2prcvAUA6XAZMy5AG536yi+RPFUDYezUZKRyjlYtQdVzhlPiJ8WDmAyiMlgllfpQmLWfQ5
 xRSG/9y
IronPort-HdrOrdr: A9a23:oCFmuKHvnrN7vG7mpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: 9a23:eNez+mDXUuJzIJD6ExN/8BYPF9J8Sy3iznryCRSqDjpQUrLAHA==
X-Talos-MUID: 9a23:4bn87gqMVqthFqrvv+Yezzh5GN5QoJqNMk8in7Q5gNe+JA9yZyjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="107984133"
Date: Tue, 16 May 2023 15:25:09 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: <qemu-devel@nongnu.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>, <qemu-block@nongnu.org>, Paul Durrant
	<paul@xen.org>, Peter Lieven <pl@kamp.de>, Stefan Weil <sw@weilnetz.de>, Xie
 Yongji <xieyongji@bytedance.com>, Kevin Wolf <kwolf@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>, Hanna Reitz
	<hreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>, David Woodhouse
	<dwmw2@infradead.org>, Coiby Xu <Coiby.Xu@gmail.com>, Eduardo Habkost
	<eduardo@habkost.net>, Stefano Garzarella <sgarzare@redhat.com>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Daniel
 =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, Julia Suvorova
	<jusual@redhat.com>, <xen-devel@lists.xenproject.org>, <eesposit@redhat.com>,
	Juan Quintela <quintela@redhat.com>, "Richard W.M. Jones"
	<rjones@redhat.com>, Fam Zheng <fam@euphon.net>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v5 13/21] hw/xen: do not set is_external=true on evtchn
 fds
Message-ID: <dec567c6-5850-48b5-89f9-676c0160389b@perard>
References: <20230504195327.695107-1-stefanha@redhat.com>
 <20230504195327.695107-14-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230504195327.695107-14-stefanha@redhat.com>

On Thu, May 04, 2023 at 03:53:19PM -0400, Stefan Hajnoczi wrote:
> is_external=true suspends fd handlers between aio_disable_external() and
> aio_enable_external(). The block layer's drain operation uses this
> mechanism to prevent new I/O from sneaking in between
> bdrv_drained_begin() and bdrv_drained_end().
> 
> The previous commit converted the xen-block device to use BlockDevOps
> .drained_begin/end() callbacks. It no longer relies on is_external=true
> so it is safe to pass is_external=false.
> 
> This is part of ongoing work to remove the aio_disable_external() API.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

