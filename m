Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91D743773A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 14:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215053.374004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdtow-0006Jv-SE; Fri, 22 Oct 2021 12:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215053.374004; Fri, 22 Oct 2021 12:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdtow-0006Gr-MD; Fri, 22 Oct 2021 12:38:50 +0000
Received: by outflank-mailman (input) for mailman id 215053;
 Fri, 22 Oct 2021 12:38:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VW94=PK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mdtou-0006Ge-Mg
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 12:38:48 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1fa3e5d-a85a-4501-8542-3602e35cf11e;
 Fri, 22 Oct 2021 12:38:47 +0000 (UTC)
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
X-Inumbo-ID: f1fa3e5d-a85a-4501-8542-3602e35cf11e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634906327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z1Z6jhG085EWMEuZmmZShBtKDLuvFWfIQSNlH7YyHrM=;
  b=PuxSRd0eBfKoGHC2sdp0xC2vQXJzBYA7kXxdJ4kv6xawrhTvZm9ntmyg
   E+kU04RX3f08jp2VJlyoOriGFYgzQcta2cDzxP7uCnYw7FjWLW5M0oIKf
   mC5UBfPrfwz6qQ90vlDIilZMCN+95ztEl16NRegTbuJG87vlMJrc0UFhR
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vujeZf3sLv9TngPJZkTuCI2jzewJYBrjtb0NPTiY035Js9sPZBeRDjI2EljOJnwA8kgSg+sUYJ
 4pn5DBpQdIId1aoCcMvhzIQqJZsU5HOZdCMFzw12djZIju6RZZuYhSprvu8xXbjKbbEjPo/B37
 X7JUzZ7pIbI+2EVPDzh4bNbEBm+cT5uwC9f+TtE2OIz5QuHfbZ/od+XzbrZN//i/7UzERkfBnx
 d0CFVc6o+tAXfN0zFHhY0PS3tGjzai+kIFJUaoaXc0OvRmzpmOythY1Fh8bSqPZvxQHvFdd+p2
 mLw4dmokHUNKAWhjIBWwmSEw
X-SBRS: 5.1
X-MesageID: 56216652
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RPgdPqkJ+YrAZwtDG8VB4fno5gwTIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWXm/UMvnbZWv0etpyOYW1pxwBsMWGnIJhG1Q4rys0QSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2tQy2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I9D5brvWysbB5PdqfYzVBIIDxhDEoQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKiEP
 pRHNGAHgBLocQROIlUQGcICtvqsuWakfzwDrXuqjP9ii4TU5FMoi+W8WDbPQfSBTN9ZmUuwr
 Wvc82P0RBodMbS31j6t4n+qwOjVkkvTQ54fGrS+8bhxnFSZy2gXCRsXfUu6pfi/mgi1XNc3A
 1cP5iMkoKw29UqqZtrwRRu1pDiDpBF0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 TehnszrLSxitqWPTnCQ/avSqim9URX5NkdbO3VCF1FcpYC+/sdj1XojU+qPDobvgI3TRiPc8
 Qm0vRksqbIY3dIy6oqSqAWvby2XmrDFSQs85wPyV22j7x9kaIPNW7FE+WQ3/t4bc97HFgjpU
 Gws3pHEtrhXXM7leDmlGb1VRNmUC+C53CowaLKFN6Iq8Cix4DaddIRU7SAWyKxBY5tcJ2GBj
 KM+v2psCH5v0JmCMfAfj2GZUZ1CIU3c+TLNDKy8gj1mOcAZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlGje93n39unTiOFPgXKihLN5LEOBZ5rp9eaDOzgh0RtvvY8G05D
 f4PXyd19/mveLKnOXSGmWLiBVsLMWI6FfjLRz9/LYa+zv5dMDh5UZf5mOp5E6Q8xvg9vrqYr
 xmVBx4DoHKi1CKvFOl/Qi06AF8Zdc0k9ixT0O1FFQvA5kXPlq72vf5BLcNuIOF7nAGhpNYtJ
 8Q4lwy7KqwnYlz6F/41NPERdaRuK0amgxygJS2gbGRtdpJsXVWRqNTlYhHu5G8FCS/u7Zkyp
 Lip1wX6R5sfRls9UJaKOaz3l17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK3d99WpHuJyE1B0BW7e6brqZyDW8nD6md1LUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozvoK9qaVbwwJoGGTwQ26qUr4wcGOb2cRvt7FWwuMLswWBR
 U/SqMJRPq+EOZ25HQdJdhYldOmKydodhiLWsaYuOEz/6SJ6oOiHXEFVM0XegSBRNuIoYoYsw
 ONns88K8Q2vzBEtN4/e3CxT8m2NKF0GUrkm6c5GUNO61FJzxwEQe4HYBw/3/IqLOodFPUQdK
 zOJgLbP2uZHzU3YfntvTXXA0IKxX3jVVMymGLPaG2m0pw==
IronPort-HdrOrdr: A9a23:3z+pua8fZUaDIbhbZkFuk+DaI+orL9Y04lQ7vn2YSXRuE/Bws/
 re+8jztCWE7Ar5N0tNpTntAsa9qDbnhPhICOoqTNKftWvdyQiVxehZhOOIqVDd8m/Fh4xgPM
 9bAtFD4bbLbWSS4/yV3DWF
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="56216652"
Date: Fri, 22 Oct 2021 13:38:42 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>,
	<cardoe@cardoe.com>, <wl@xen.org>, <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
Message-ID: <YXKw0jfDkJ5RrvXX@perard>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-2-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211021230839.10794-2-sstabellini@kernel.org>

On Thu, Oct 21, 2021 at 04:08:38PM -0700, Stefano Stabellini wrote:
> diff --git a/automation/tests-artifacts/kernel/5.10.74.dockerfile b/automation/tests-artifacts/kernel/5.10.74.dockerfile
> new file mode 100644
> index 0000000000..f2dbbecf74
> --- /dev/null
> +++ b/automation/tests-artifacts/kernel/5.10.74.dockerfile
> @@ -0,0 +1,38 @@
> +FROM debian:unstable
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV LINUX_VERSION=5.10.74
> +ENV USER root
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# build depends
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        build-essential \
> +        libssl-dev \
> +        bc \
> +        curl \
> +        flex \
> +        bison \
> +        libelf-dev \
> +        && \
> +    \
> +    # Build the kernel

You could start a new docker "RUN" step to build the kernel.

> +    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
> +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> +    cd linux-"$LINUX_VERSION" && \
> +    make defconfig && \
> +    make xen.config && \
> +    cp .config .config.orig && \
> +    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \

This command line could be replaced by:
    sed -i '/XEN/s/=m$/=y/' .config
But I guess Kconfig don't mind duplicated symbols.

> +    make -j$(nproc) bzImage && \
> +    cp arch/x86/boot/bzImage / && \
> +    cd /build && \
> +    rm -rf linux-"$LINUX_VERSION"* && \


> +    apt-get autoremove -y && \
> +    apt-get clean && \
> +    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*

This apt cleaning stuff should be done right after `apt install`, and
thus before starting to build the kernel, I think.

Any any case:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

