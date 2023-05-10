Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D8D6FE15F
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 17:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532896.829241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwlWn-0005tx-9w; Wed, 10 May 2023 15:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532896.829241; Wed, 10 May 2023 15:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwlWn-0005rw-6M; Wed, 10 May 2023 15:14:53 +0000
Received: by outflank-mailman (input) for mailman id 532896;
 Wed, 10 May 2023 15:14:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0RdQ=A7=citrix.com=prvs=48752e3ca=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pwlWl-0005r5-UZ
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 15:14:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67731f8a-ef45-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 17:14:50 +0200 (CEST)
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
X-Inumbo-ID: 67731f8a-ef45-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683731690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gRkEOKb2Ch7qwpUDaE2Smx4JK9+4Gs1SMrGfslNo2eA=;
  b=V6lu1ajIDnI6ClE5MGL/HOWRK7co6ybQtMf2FT0FFbIrv6B+KvSKLNVr
   squLNvFPMC56UzstBIE3IQmU7pYV7LVKx+y28KapoVey1+k5ELBfS4WHJ
   vhbiSQKMfvw0s7TIDejh2umrYNn6bx5HxyajXPHVDwIhdhM8n1M4CvHBY
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108428468
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:W1WxG69kY3xRWeeognAWDrUDm36TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GEdUDuOMvaNMGGkfIxyPI+x8h9QvpWAnIJjTlc5+yA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKkT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklN1
 aMeFikmZSmNjuW18PHnc/F+osEseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0MxhbE/
 DKaoTSR7hcyK/aC9manyVKXie7OgwTGCZ0KKI/h+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8VUO/037keK0KW8ywSWHG8fVRZadccr8sQxQFQC3
 0eEhdrzCRRzsbeeTjSW8bL8kN+pEXFLdylYP3ZCFFZbpYC5++nfky4jUP5gMPGzsMTeEgj+y
 jeJnGtivq0BqcsEgvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 K3741s5CHx7ZiHCgUpLj2WZVKwXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8fAL5vzUSZCVfk6pNZTewv6+eBD+8zD7TmLGcCTI+qPi9Jym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3CvZmPy53CbWkCgGOqN57ELz/BSRjbXwAg5ANJ7Hrz8sPMD1JNsI9Npt6K9U/wPoPxruZl
 px/M2cBoGfCabT8AV3iQhhehHnHBv6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:5nPvF6mwV/PwNuTfQZGnWwVYezbpDfLa3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRcdcLW7UpVoLkmyyXcY2+cs1PKZLWvbUQiTXeZfBOnZsl7d8kTFn4Yw6U
 4jSdkaNDSZNzNHZK3BkW2F+rgboeVu8MqT9JjjJ3UGd3AVV0m3hT0JezpyESdNNXl77YJSLu
 vk2iLezQDQBEj+aK6AdwE4dtmGnfLnvrT8byULAhY2gTP+8Q9BuNbBYmOlNg51aUI0/Ysf
X-Talos-CUID: =?us-ascii?q?9a23=3AkT3WjWmTq2ZBhq7o7/q9b13PHCzXOX79k3HuOmS?=
 =?us-ascii?q?zMGhgT76lCgOp4LFAlsU7zg=3D=3D?=
X-Talos-MUID: 9a23:9eQnGQkmRoV98F6R0SGmdnp9HtpXv4aVKHsCkJQYnPTVKjRMCW6S2WE=
X-IronPort-AV: E=Sophos;i="5.99,265,1677560400"; 
   d="scan'208";a="108428468"
Date: Wed, 10 May 2023 16:14:39 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Christian Lindig <christian.lindig@cloud.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>
Subject: Re: [PATCH v4 1/3] tools: Modify single-domid callers of
 xc_domain_getinfolist()
Message-ID: <f75f5786-6b1f-47a7-ac3d-e8af79d5f750@perard>
References: <20230509160712.11685-1-alejandro.vallejo@cloud.com>
 <20230509160712.11685-2-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230509160712.11685-2-alejandro.vallejo@cloud.com>

On Tue, May 09, 2023 at 05:07:10PM +0100, Alejandro Vallejo wrote:
> xc_domain_getinfolist() internally relies on a sysctl that performs
> a linear search for the domids. Many callers of xc_domain_getinfolist()
> who require information about a precise domid are much better off calling
> xc_domain_getinfo_single() instead, that will use the getdomaininfo domctl
> instead and ensure the returned domid matches the requested one. The domtctl
> will find the domid faster too, because that uses hashed lists.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Christian Lindig <christian.lindig@cloud.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

