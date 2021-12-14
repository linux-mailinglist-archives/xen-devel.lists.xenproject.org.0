Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F6B474711
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 17:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246873.425763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxAGm-0008FM-Qu; Tue, 14 Dec 2021 16:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246873.425763; Tue, 14 Dec 2021 16:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxAGm-0008Cw-NZ; Tue, 14 Dec 2021 16:03:12 +0000
Received: by outflank-mailman (input) for mailman id 246873;
 Tue, 14 Dec 2021 16:03:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q7Ra=Q7=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mxAGk-0008Cq-Ss
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 16:03:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eeebe87-5cf7-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 17:03:01 +0100 (CET)
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
X-Inumbo-ID: 4eeebe87-5cf7-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639497787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=caysg20LYi0EhTAWT/KHfFYtdPiBMPQZuUXeSMnogUM=;
  b=Us8zmrah6j2/FqeCSEgfoxA9VoXurV6YdLmQZFqXevC3OE03ZYNW3pUH
   4HQAOTEyZynRefttJ41Fqc97v+caEyXE2utshDHLVVrWmBVkFomIWQmQn
   mxKsqzw5GoDl36RrISHod52si/nc118EfqlJSu8e0vDAnlMB/D6XCXPsJ
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XKX/I7FhXgjC+hJsx+R7vVltiq4NG0+XVhJkwfOqvlHQjsORA2Hg4wtEYZHbgYt6SE0VCDjgul
 XvipK2YVWDZvvCSsw7exfl3v5/P2IMnpYbwVT7jvmrmV6cuEsebP2rBXcS60tYJAmYCm641ZGo
 2hx9Z174wHhZW+EjaUpl8/LO+AMd9cnoozqJ+T9tU0dbGqNvQRQLS1T12O415GV3+WfPUQnO9n
 xca8OjK6JpqBscs+MNm0t3ZXv8tpNUJqN6IQVG4RF2M4ObPHuYiWkrmPINVGm9bhcH3g9Djhs5
 3175TgdLPK06lQ8W5cJdfgX/
X-SBRS: 5.1
X-MesageID: 60009620
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rZz4rKPRaBVDRmrvrR3QkcFynXyQoLVcMsEvi/4bfWQNrUom0mRWm
 2NJDzuPa67cZDf0fdwkO4Ww8ENT68eExt8xQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400s/w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo3LYz9Es9
 9kOjJ2XdCkTN/bhvf9GViANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgm9o3pEQR662i
 8wxOTwzcCieYSN2C3A8D7Y7u/iJqFvDSmgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSdxiCC6WmEnfLUkGXwX4d6PL+l8v9nhnWDy2pVDwcZPXOxrOOlkEe4V5RaI
 lYN5ys1haEo8QqgSdyVdyO/pHmIrxsNQe16Gucx6ByO4qfM6gPfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaES8RIGwZeT4fTSMK5tDipMc4iRenZtFnHa2uh9v5Awbs0
 iuKpygzgbYUpcMT3qD99lfC6xq2oYPDVAky5QP/V2Oj4ARiaYXjbIutgXDE6d5QIYDfSUOO1
 EXogODHsrpIV8vU0nXQHqNdR9lF+sppLhWb0A5uQqYttA2s3EONR4kLzRRlf0JQZ5NslSDSX
 GffvgZY5Zl2NXSsbLNqb4/ZN/nG3ZQMBvy+CKmKM4MmjoxZMVbeoXowPRL4M3XFyRB0yckC1
 YGnndFA5JrwIYBu13KISugUytfHLQhulDqIFfgXI/lKuIdyhUJ5q59ZYDNijchjtctoRTk5F
 f4FaKNmLD0FD4XDjtH/q9J7ELzzBSFT6WrKg8JWbPWfBQFtBXssDfTcqZt4Jdc0w/4MzrqWo
 SDtMqO99LYZrSeYQeltQio8AI4DoL4l9S5rVcDSFQjAN4cfjXaHs/5EKspfkUgP/+1/1/9kJ
 8TpiO3basmjvg/vomxHBbGk9dQKXE3y2WqmYnv9CBBiLsUIb1GYpbfZkv7HqXBm4tyf7pBl/
 dVNF2rzHPI+euiVJJqMNa/0kQru5SN1dSAbdxKgH+S/sX7EqOBCQxEdRNdtSy3VARmclDacy
 SiMBhIU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu/QVlL9UsAe7Q
 GyV/dxeNenbMc/pCgdJdgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYsadEr2
 +YsvsIS+jeTsBtyP4bUlD1Q+kSNMmcED/ctuKYFDdK5kQEs0FxDP8DRU3ek/JGVZtxQGUA2O
 TvI1rHajrFRy0eeIXo+EX/BgbhUiZgU4U0YyVYDIxKCm8bfh+9x1xpUqGxlQgNQxxRB8uRyJ
 mk0aBElefTQp29l1JpZQmShOwBdHxnIqEX+xmwAmHDdU0T1BHfGK3cwOLrV8U0Um46GkuO3I
 F1MJL7ZbAvX
IronPort-HdrOrdr: A9a23:+K0bd6mX85AttVytnd4M7/PIxZDpDfIu3DAbv31ZSRFFG/Fxl6
 iV/cjz8SWE7wr5OUtQ/exoV5PtfZqxz/FICMwqTNGftWrdyQ6VxeNZnOjfKlTbckWUnINgPO
 VbAspD4bXLfCFHZK3BgDVQfexP/OW6
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="60009620"
Date: Tue, 14 Dec 2021 16:03:00 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
Message-ID: <YbjANCjAUGe4BAar@perard>
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-2-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1638982784-14390-2-git-send-email-olekstysh@gmail.com>

On Wed, Dec 08, 2021 at 06:59:43PM +0200, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch adds basic support for configuring and assisting virtio-disk
> backend (emualator) which is intended to run out of Qemu and could be
> run in any domain.
> Although the Virtio block device is quite different from traditional
> Xen PV block device (vbd) from the toolstack point of view:
>  - as the frontend is virtio-blk which is not a Xenbus driver, nothing
>    written to Xenstore are fetched by the frontend (the vdev is not
>    passed to the frontend)
>  - the ring-ref/event-channel are not used for the backend<->frontend
>    communication, the proposed IPC for Virtio is IOREQ/DM
> it is still a "block device" and ought to be integrated in existing
> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
> logic to deal with Virtio devices as well.

How backend are intended to be created? Is there something listening on
xenstore?

You mention QEMU as been the backend, do you intend to have QEMU
listening on xenstore to create a virtio backend? Or maybe it is on the
command line? There is QMP as well, but it's probably a lot more
complicated as I think libxl needs refactoring for that.

> Besides introducing new disk backend type (LIBXL_DISK_BACKEND_VIRTIO)
> introduce new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
> one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model.
> 
> In order to inform the toolstack that Virtio disk needs to be used
> extend "disk" configuration by introducing new "virtio" flag.
> An example of domain configuration:
> disk = [ 'backend=DomD, phy:/dev/mmcblk1p3, xvda1, rw, virtio' ]

This new "virtio" flags feels strange. Would having something like
"backendtype=virtio" works?

> Please note, this patch is not enough for virtio-disk to work
> on Xen (Arm), as for every Virtio device (including disk) we need
> to allocate Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree. The subsequent
> patch will add these missing bits. For the current patch,
> the default "irq" and "base" are just written to the Xenstore.

This feels like the patches are in the wrong order. I don't think it is
a good idea to allow to create broken configuration until a follow-up
patch fixes things.

> diff --git a/tools/xl/xl_block.c b/tools/xl/xl_block.c
> index 70eed43..50a4d45 100644
> --- a/tools/xl/xl_block.c
> +++ b/tools/xl/xl_block.c
> @@ -50,6 +50,11 @@ int main_blockattach(int argc, char **argv)
>          return 0;
>      }
>  
> +    if (disk.virtio) {
> +        fprintf(stderr, "block-attach is not supported for Virtio device\n");
> +        return 1;
> +    }

This might not be the right place. libxl might want to prevent hotplug
instead.

Thanks,

-- 
Anthony PERARD

