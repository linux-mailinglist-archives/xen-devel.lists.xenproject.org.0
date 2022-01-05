Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C7748501D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 10:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253537.434699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n52ii-0000UN-Cy; Wed, 05 Jan 2022 09:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253537.434699; Wed, 05 Jan 2022 09:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n52ii-0000SW-A0; Wed, 05 Jan 2022 09:36:36 +0000
Received: by outflank-mailman (input) for mailman id 253537;
 Wed, 05 Jan 2022 09:36:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMgQ=RV=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n52ig-0000SQ-5I
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 09:36:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6766351-6e0a-11ec-81c0-a30af7de8005;
 Wed, 05 Jan 2022 10:36:32 +0100 (CET)
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
X-Inumbo-ID: f6766351-6e0a-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641375392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TCZo8mto1tKnx4E7hcCkJsjhsktSVHA9oiz4KykoHRk=;
  b=b62SM+YAXkW9Rs0QoZKCUG8seCjkyqWA5gQkyGio9VmY5i2T/b5ji+z6
   pCk3koECMoXvwQCKq1ai9bmBnFoxXfRzDFbY1TuVa68Zx5aafrw6DyoUm
   htvM81EdeWfbjV4IeFUKPKeRahtz69axj5C0IoclwcIU6CayZCNuFIR6f
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IM0Ix+kE8cxTPn4xFUazzeKhtHFZkco0grOYgpIB9bc6Ilgb7UO7zPohS51OzZKK1NCLV5CIHr
 LgMn0TAUctPtTgazenOweMbonGrWVB6rbzN3RFYQOG0uaDJj3fj1c9a6Xh0oHKjRewSLQ2hDjJ
 V0iK0QY6LGqFFAsbywCCFZSPq+VISz84nFVtVdiEDmfI40qpfnoZxSxECYlwqwBHb8mi7Pdwf3
 CeJzESr1OYVuasOP6OVM2sygIUjaThKIMftds7Q1dONs3lPZt5bqluBnBBZawmlMrGLmuHaWRz
 ciqfhkQgf7t3XiGihUoPSGAb
X-SBRS: 5.1
X-MesageID: 61746116
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yKOktqtqeMEU0Sbx+j/+i77UaOfnVGtZMUV32f8akzHdYApBsoF/q
 tZmKWuOP/jcN2P1fYwkad+x90sP6MWAztNkSws9rCE3FS8V+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx2YXhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl64OCSjYzNf33tKcSU0ZiExtZF4xk9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AP
 pVFN2M2MnwsZTVxB1YaMMI5hduj3CT7XjRy72ONvKMOtj27IAtZj+G2bYu9lsaxbcdahEGDv
 Urd4n/0RBodMbS32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPGjQC+7kWSP7iUwGNVQTNc60ian64jbtlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqO7K8Gra1Tw9aDZbOHRaFVdtD8zL/dlbs/7Zcjp0/EdZZPXRECq4/
 T2FpTNWa1473Z9SjPXTEbwqbluRSnn1ouwdulW/soGNtFoRiGuZi2qAsgazARFodtzxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd9rm/3oi76I9oMvlmSwXuF1O5fJ1cFh
 2eJ4mtsCGJ7ZiP2PcebnarsYyjV8UQQPYu8Da2FBja/SpNwaBWG7ElTib24hAjQfLwXufhnY
 /+zKJ/0ZV5DUPgP5GfmFo81jO5wrghjlDy7eHwO50n+uVZoTCXOEult3ZrnRr1R0Z5oVy2Jq
 YsCbJXTlE0EOAA8CwGOmbMuwZkxBSBTLfjLRwZ/LYZv+yJqRzMsDeH/27Qkd9A3lqhZjL6Qr
 Hq8RlVZ2Bz0gniecVeGbXVqabXOW5djrC1kYXxwbAjwg3VzM5yy6Ko/docseeV1/uJU0vMpH
 eIOfN+NA6oTR22fqSgdd5T0sKdraA+v2VCVJyOgbTVmJ8xgSgXF98XKZAzq8CVSXCO7udFn+
 ++r1x/BQIpFTANnVZ6EZPWqxlK3nH4chOMtABeYfogNIB3hqdE4JTbwg/k7J9A3BS/CnjbKh
 RyLBRo4pPXWp9Nn+tf+mq3Z/ZyiFPFzHxQGEjCDv6q2LyTT4kGq3ZREDLSTZTnYWW75pPeia
 OFSw62uOfELhg8X4Y91ErItxqMi/dr/4bRdy108TnnMal2qDJJmI2WHgpYT5vEcmOcBtFvkQ
 F+L9/lbJa6NaZHsH1MmLQY4aviOiKMPkT7I4PVpeEj36UebJlZcvZm+6/VUtBFgEQ==
IronPort-HdrOrdr: A9a23:uuizeKGTSbmPldRSpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.88,263,1635220800"; 
   d="scan'208";a="61746116"
Date: Wed, 5 Jan 2022 09:36:26 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH] tools/libxc: Drop copy-in in xc_physinfo()
Message-ID: <YdVmmqK8f/h8/taU@perard>
References: <20211223162244.16198-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211223162244.16198-1-andrew.cooper3@citrix.com>

On Thu, Dec 23, 2021 at 04:22:44PM +0000, Andrew Cooper wrote:
> The first thing XEN_SYSCTL_physinfo does is zero op->u.physinfo.
> 
> Do not copy-in.  It's pointless, and most callers don't initialise their
> xc_physinfo_t buffer to begin with.  Remove the pointless zeroing from the
> remaining callers.
> 
> Spotted by Coverity.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

