Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF47E599911
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 11:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390183.627468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOylF-0006wi-Sa; Fri, 19 Aug 2022 09:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390183.627468; Fri, 19 Aug 2022 09:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOylF-0006tZ-PG; Fri, 19 Aug 2022 09:57:53 +0000
Received: by outflank-mailman (input) for mailman id 390183;
 Fri, 19 Aug 2022 09:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wa9Z=YX=citrix.com=prvs=223f339b3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oOylE-0006tT-5V
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 09:57:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61a702c2-1fa5-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 11:57:50 +0200 (CEST)
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
X-Inumbo-ID: 61a702c2-1fa5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660903070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3UX244bnja2K5yF8+nlGJXPyNsgo4YFbgICV28eW0WA=;
  b=VZ4D1/ydVyzlaMmNWPbTTPRlZc2MrXjfDJM55f/19uykM+sjs9m/+ADA
   E5XHKzD7dgSCLkpUpIt+TPyETjyZV+QwsQlf4F8SIlJA7qr+y1XjBJzU0
   PLdpn/TGeMLoxtZPW+wKXw1xcEmF6cos+8BQsVMMNTrW0wndb7kqH+0QJ
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77684626
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6iwOEqllIxHs8hBa4M3QKj7o5gy5JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeXjyFM6nbajGmKot3O4iw8kMPu8Tcx9dkSFE//3phESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37K2i4GhwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kpF4E34v00H1pg/
 MMJJj1QNw+AveKplefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+OeyboqJJIbULSlTtn2+i
 CHq4TrGPi4lFse66xW9zWOrg/CayEsXX6pNTeblp5aGmma7wm0ZFhwMEF+6uuWRkEOyW9tDb
 UcT/0IGqqw/91eiSNXnaAGpu36PvhMaWN14HvUz7UeGza+8ywSEAmkJSBZRZdpgs9U5LRQvz
 kWIgdT7AxR1vbGVQG7b/bCRxRu1PSUWNnMTfi8sQg4M4t2lq4Y25jrfQ9AmHKOrg9ndHTDr3
 yvMvCU4n68Uj8MAy+O851+vvt63jsGXFEhvvFyRBz/7qFMiDGK4W2C2wUfx4dlYN8WHdXeIg
 2kKlpXH8+M0DY7YwURhX94x8KGVC+etaWOC2Q4wQ8BxqVxB6Fb4I9kOvWgWyFNBd59dJGS3O
 BK7VRZ5vsc7AZe8UUNgj2td4ewOxLOoK9nqX+u8gjFmMskoL1/vEM2DiCetM4HRfKsEy/hX1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+TGNCLKFuZZbgvVBgzc0E9jiFS9z
 jqiH5HSl0U3vBPWOUE7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJVzN/8T5mOp5E6Q4zvs9qws91
 iviMqOu4Aag2CavxMTjQiwLVY4Dqr4m/SxjYHxyZgrzs5XhCK72hJoim1IMVeFP3IReITRcF
 pHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:V5mYtKA9SlUdBDPlHemU55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG+85rsyMc6QxhPE3I9urtBEDtexzhHNtOkPAs1NSZLWzbUQmTXeJfBOLZqlWKcUDDH6xmpM
 VdmsBFeaXN5DNB7foSjjPXL+od
X-IronPort-AV: E=Sophos;i="5.93,247,1654574400"; 
   d="scan'208";a="77684626"
Date: Fri, 19 Aug 2022 10:57:41 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Michal =?iso-8859-1?B?UHLtdm96bu1r?= <mprivozn@redhat.com>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>, <libvir-list@redhat.com>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Julien Grall <julien@xen.org>
Subject: Re: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type
Message-ID: <Yv9elYoCbkUP0pzX@perard.uk.xensource.com>
References: <20220729155024.3327364-1-olekstysh@gmail.com>
 <d29b2ad1-fa32-4897-a113-c8a0864c6630@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d29b2ad1-fa32-4897-a113-c8a0864c6630@redhat.com>

On Mon, Aug 01, 2022 at 10:23:48AM +0200, Michal Prívozník wrote:
> Ah, I couldn't find the commit in master, and it's simply because it's
> not there yet. It's in staging:
> 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;f=tools/libs/light/libxl_types.idl;h=66dd1c62b2a3c707bd5c55750d10a8223fbd577f
> 
> The patch looks correct. Do you have any estimate when it can be merged
> into master? I'm not sure what our, libvirt, rules about xen staging
> are, but for qemu we require master (even unreleased yet).

Hi Michal,

Now that the commit is "master", do you think this libvirt patch could
be committed?

Thanks,

-- 
Anthony PERARD

