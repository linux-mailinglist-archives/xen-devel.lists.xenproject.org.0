Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB5761FB37
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 18:25:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439540.693557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os5rc-0002ks-Ih; Mon, 07 Nov 2022 17:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439540.693557; Mon, 07 Nov 2022 17:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os5rc-0002in-Fz; Mon, 07 Nov 2022 17:24:48 +0000
Received: by outflank-mailman (input) for mailman id 439540;
 Mon, 07 Nov 2022 17:24:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yoMc=3H=citrix.com=prvs=30380d06f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1os5ra-0002ih-Oo
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 17:24:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10b7ea26-5ec1-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 18:24:44 +0100 (CET)
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
X-Inumbo-ID: 10b7ea26-5ec1-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667841884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=16IPYLBbQfIYc3xLH61tqI20N+/WsksmfwDZh78tSvE=;
  b=dCY2wV1iqlzfPDBXa/UkMIdd3xG9FHWGNvsuGvWMA19LKmT8J2SP+Mvw
   bzFKA0xzzlrK/rfZc2HqTH9Ysp9vBVQYfURZ/eyqVbt4+qiP/CNkhbClO
   sWO4Y37UrnbRqR/CDq25xDL11cyt2bYe3wcOIK3b3GFwH0eS5nb0Rod5v
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84342471
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fYMAGaIKoiE4shmLFE+R2JUlxSXFcZb7ZxGr2PjKsXjdYENSgTAHy
 mRKWTjTM6qJYDajKdhyPdux8UxV7JKAxoBgTwVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wRhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c56KHlW1
 e4YBgkNdzG+jey44a2ybbJF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUozWHpkPwhnBz
 o7A10rkORYACdiC8H2u1GyBtu2Qw3zQeqtHQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3C
 0ES4DtokqE0+2SiVNy7VBq9yFaGsQQbQMF4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhqgGqy89G3of3JPdClbOHFCHVBtD8TfTJ8bgzvXVvZxEICMjsTUJDv+z
 RGVpQ9lruBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWW4C
 KMwkVkLjHO2AJdNRf4fXm5JI552pZUM7Py8Ph0UB/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnFLpnxXChEVfk6k1JaotvxNpdymEgDKZ77H8inn3xLL5LDDJJqdVv1GATXNb1ohE91iA7U7
 8xeJ6O3J+Z3CYXDj+i+2dB7EG3m2lBiX8mo+p0PLL/cSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 xlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:ogXfgK/UiyG1VpMcfm5uk+DaI+orL9Y04lQ7vn2YSXRuE/Bws/
 re+8jztCWE7Ar5N0tNpTntAsa9qDbnhPhICOoqTNKftWvdyQiVxehZhOOIqVDd8m/Fh4xgPM
 9bAtFD4bbLbWSS4/yV3DWF
X-IronPort-AV: E=Sophos;i="5.96,145,1665460800"; 
   d="scan'208";a="84342471"
Date: Mon, 7 Nov 2022 17:24:37 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [PATCH-for-4.17] tools/hotplug: fix systemd unit dependencies
Message-ID: <Y2k/VQEJT4jIYtvB@perard.uk.xensource.com>
References: <20221106061517.15602-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221106061517.15602-1-jgross@suse.com>

On Sun, Nov 06, 2022 at 07:15:17AM +0100, Juergen Gross wrote:
> Commit 1283af6465cd ("tools/xenstore: remove XEN_LIB_STORED and
> XENSTORED_ROOTDIR") removed the systemd file var-lib-xenstored.mount
> without removing dependencies to this file.
> 
> Fixes: 1283af6465cd ("tools/xenstore: remove XEN_LIB_STORED and XENSTORED_ROOTDIR")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

