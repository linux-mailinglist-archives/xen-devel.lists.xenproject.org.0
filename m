Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FB470E26F
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538625.838737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VCa-0008JB-OZ; Tue, 23 May 2023 16:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538625.838737; Tue, 23 May 2023 16:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VCa-0008HN-LP; Tue, 23 May 2023 16:49:36 +0000
Received: by outflank-mailman (input) for mailman id 538625;
 Tue, 23 May 2023 16:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1VCY-0008HF-NS
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:49:34 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca612a8c-f989-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 18:49:33 +0200 (CEST)
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
X-Inumbo-ID: ca612a8c-f989-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684860573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zl9vTPqi6RVZJGxKRYtGaBAPuiSWpOT0k2k62r7HVqA=;
  b=D1J7JO5QicrFAlF3DMcgfTEGyNXyzFOihlD1TVqYGILwR52NpYtvfRNo
   pXtQsfICzEgq45U/sBDEmnDpSGAIxLRRnJkE50EbnEnl1j/qGUmVnzCMH
   Gwa//OcQSJ4eiKSO5bJzsPSHsqKQYCPeL6gtk0l3hhFUI72MuclXu8oKF
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112569755
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:wq/fba82syAfjNCismedDrUDcn6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mIYDD+DPavYNmv2fYojao6y9kNT78Lcz9dmTQFo/no8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmOKoQ5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkJz
 dtGCwocRCyyvLiMzOmqddRKu548eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0MxxzF+
 DOZojmR7hcyJeSE6See81SVi+7dwDrCVbg3TbTi36s/6LGU7jNKU0BHPbehmtG9l0W3HdxWL
 UcZ/i4zhaEo8QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOvsIsWSYj0
 FPPmtrzHCFuq5WcU3fb/bCRxRutNClTJm8PYwcNVw5D6N7myKksijrfQ9AlF7S65vXvHir62
 TeNry4WiLAajMpN3KK+lXjFjCirvYPhVRMu60PcWWfNxgphaZSsfYCA9VnR5vEGJ4GcJmRtp
 1BdxZLYtrpXS8jQymrUGr5l8KyVC+itdwX7331VDrMdxg/3wXL4bL9txgwkOxI8WiobQgPBb
 EjWsAJXwZZcOnq2cKN6C76M59QWIbvIToq8CK2NBjZaSt0oLVLconkyDaKF9zq1+HXAh53TL
 ntynSyEKX8BQZpqwzOtLwv2+e96n3turY8/qH2S8vhG7VZ8TCTNIVvmGAHUBgzc0E9jiFu9z
 jqnH5HWoyizqcWnCsUtzaYdLEoRMV8wDo3spspce4are1Q2RD5xU6OKkOp5J+SJepi5cc+Rp
 BmAtrJwkgKj1RUr1y3RApycVF8fdckm9i9qVcDdFV2px2Iice6S0UvrTLNuJeNP3LU6nZZJo
 wwtJ53o7gJnFm6WpFzwrPDV8ORfSfhcrVnWZXv6P2BvLsIIqs6g0oaMQzYDPRImVkKf3fbSa
 ZX8vu8HafLvnzhfMfs=
IronPort-HdrOrdr: A9a23:SbtdiK+F2cX3G2cF9yVuk+C7I+orL9Y04lQ7vn2ZKCY0TiX8ra
 uTdZsguCMc5Ax6ZJhCo7G90de7Lk80nKQdibX5Vo3PYOCJggWVEL0=
X-Talos-CUID: 9a23:u2WO9WF9kvMiHHYaqmIgzGlKOfo0WEHs9y3qLxSpNltPdeeKHAo=
X-Talos-MUID: 9a23:T9n1swaaPIPIauBTpgf3pCx5NeFR7qW8VVk0nK8j4sDeHHkl
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="112569755"
Date: Tue, 23 May 2023 17:49:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH v7 10/12] xen/tools: add sve parameter in XL configuration
Message-ID: <1c32737f-771a-4172-84ef-65d24a42e8d4@perard>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-11-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230523074326.3035745-11-luca.fancellu@arm.com>

On Tue, May 23, 2023 at 08:43:24AM +0100, Luca Fancellu wrote:
> Add sve parameter in XL configuration to allow guests to use
> SVE feature.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

