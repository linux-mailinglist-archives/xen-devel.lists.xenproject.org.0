Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377C364836B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 15:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457929.715863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3e1l-0003aL-Ra; Fri, 09 Dec 2022 14:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457929.715863; Fri, 09 Dec 2022 14:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3e1l-0003Y9-Ox; Fri, 09 Dec 2022 14:07:01 +0000
Received: by outflank-mailman (input) for mailman id 457929;
 Fri, 09 Dec 2022 14:07:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nv8v=4H=citrix.com=prvs=3352c5006=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p3e1k-0003Y2-3Y
 for xen-devel@lists.xen.org; Fri, 09 Dec 2022 14:07:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdb85b37-77ca-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 15:06:58 +0100 (CET)
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
X-Inumbo-ID: bdb85b37-77ca-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670594818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VnjmZ/o56GxZraB6qaXGj2IARs/JoPyltyk5Ud7pIAs=;
  b=WtTEeYxGHcdtl5QblL6TzJCE8zHZpMce8GE7gSXYHqTOL4gTCaCHXaPL
   qt36gSEHeMnzY8S8P88JLgGTXTPbglaJUND5fO97UoHGhSmS9+a/C5Nwb
   0wiX5je3ENbKWRL+EqUK5D/23rCnuHaoBnG0MWWJZE7SF34B6Nmd5lzzu
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87554853
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DuBX9qKMUMQv4MikFE+RuZIlxSXFcZb7ZxGr2PjKsXjdYENS3zUBy
 GsYW22EbvmCajT0eIsiaoi38R8FuJLVxt9gGwFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5ARvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5pG0MJ3
 /0+LAspdz2tq8PvmLyaRNFV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUozVGJgJzhvDz
 o7A11zrWRAmN4GG8x+czX2wqL72rGCqW7tHQdVU8dY12QbOlwT/EiY+UFKnofi0lwimXNNFK
 kEO0i4vq6Eo8wqgSdyVdwakrXCNuBlaQMZZGeA+7ACLy4LE4gKYAHhCRTlEAPQvsMImAzYn0
 FmEkvvtBDpmqrrTTmiSnp+LqRuiNC5TKnUNDQcDSQYG+MXyu4EbgRfGT9IlG6mw5vXwGDL9h
 TCNqC0znJ0XjMgCzaL9+krI6xquqYLOVRUd/RjMUySu6QYRTJ6oYcmk5EbW6d5ELZ2FVR+Rs
 X5CnNKRhMgQDIuAjyzLQ/gIFauB4/eDOSfbx1l1EPEJ7Ci38mKkZsVc7S9WI18sNscfZSSvZ
 E7VsBlWophJMxOCc65xaI+3F4Il0Kn8CdP5fvTVaNNUZd52bgDv1CNzYU+d2Uj9nU5qlrswU
 ap3au71UyxcU/4+imPrGaFNitfH2xzS20vNX7K85RWB1YG6fVO7ZZZcaFWvYNgAufbsTBruz
 /5TMM6DyhN6WeL4YzXK/YN7EW3mPUTXFrit9ZUJK7frzh5OXTh4VqSPme9Jl5lNxfw9qwvew
 p2qtqa0InLbjGaPFwiFY2sLhFjHDccm9iJT0cDB0D+VN5kfjWSHtv93m3gfJ+NPGAlfIRlcE
 ZE4lz2oWKgnd9g+0211gWPBhIJjbg+3ogmFIjCoZjMyF7Y5GVORp4W4IlO+rnJXZsZSiSfZi
 +Txvj43vLJZH1gyZCooQK3HI6yNUYg1x7spAhqgzih7c0Tw6ol6QxEdfdduS/zg3S7rn2PAv
 y7PWEdwmAU4i9NtmDU/rfze/tjB/ioXNhYyIlQ3Gp7qbHOCpTDzm9UbOAtKFBiEPF7JFGyZT
 b0955nB3DcvxT6mb6IU/25X8J8D
IronPort-HdrOrdr: A9a23:iaA2+6q7hqWtX9ETIQYiGjwaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.96,230,1665460800"; 
   d="scan'208";a="87554853"
Date: Fri, 9 Dec 2022 14:06:52 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH V6 2/3] xl: Add support to parse generic virtio device
Message-ID: <Y5NA/I5Ye46LXL0J@perard.uk.xensource.com>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <73663851c5223b99ed0f23a163a0d44cba0ebe29.1667906228.git.viresh.kumar@linaro.org>
 <Y5NAgZsG15LuUCd6@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y5NAgZsG15LuUCd6@perard.uk.xensource.com>

Sorry, I've replied to the wrong version, but those comment apply to V7.

Cheers,

-- 
Anthony PERARD

