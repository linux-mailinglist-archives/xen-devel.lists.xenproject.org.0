Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2E16A568D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 11:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503216.775411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxA4-00042z-OE; Tue, 28 Feb 2023 10:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503216.775411; Tue, 28 Feb 2023 10:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxA4-0003zu-LR; Tue, 28 Feb 2023 10:24:44 +0000
Received: by outflank-mailman (input) for mailman id 503216;
 Tue, 28 Feb 2023 10:24:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJ3u=6Y=citrix.com=prvs=4169be7e0=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pWxA4-0003zo-23
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 10:24:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c1e1017-b752-11ed-9693-2f268f93b82a;
 Tue, 28 Feb 2023 11:24:42 +0100 (CET)
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
X-Inumbo-ID: 1c1e1017-b752-11ed-9693-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677579881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9XvZtlxH5GfF+AFGiSjc3odNHkgkPlPvaXMY6RXprKo=;
  b=NAPBx4T9o5SFQmQTnyv+u/gRoWSDNn3WTZsiVe/71OGBL7VihOBOc4qe
   kKDpk6KNkMb8vlgZXKuXwNnxlBl+yO4I4u6ycA/xrJbbs4UsnCmlM/z1+
   YjB2GXBqg5mB+grWFPJnlDrz2rjAlJIXBiF7PF3NTpUngWJ0RUm2JaxXv
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98730083
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:vSojrK/lzSnbegvQ8RLyDrUDTH6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 mIXWWmBO67YZTb2Kttxa9jn9kpXuJ6En99hHFY/+Xg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmP6ob5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklk0
 NkRdGs2YCzaiti/7IO+RsdBl5saeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0EzhnD/
 jqWpAwVBDk7btGYkTOG+U6R3NDIliLDAqEAS7eno6sCbFq7mTVIVUx+uUGAifuzh1O6WtlfA
 1cJ4Sdopq83nGSpSdS7XRy+iHmetxUYVpxbFOhSwAuK0KvPpQGCGnIDUCVCefQhrsY9QTFs3
 ViM9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiIgrgwjGVNpLDK+/hdqzEjb1q
 w1mtwBn2e9V15RSkfzmoxae2WnESoX1ohAdzCDyVz7+1Q1FPYOfbqCZ7FT1wOcfFdPMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gA2QcR4n9i50zv6JN0LvmkiTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONl1HszDaJz9zq3+KTJrU3YE
 cbzTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDKFupfagrWMrFlvctoRTk5F
 P4FaqO3J+h3CrWiMkE7D6ZIRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIuRYc1Buvr6Qp
 BmVAxYIoGcTcFWbcW1mnFg/MuKwNXu+xFpnVRER0aGAgCF6MN31t/dCJvPav9APrYRe8BK9d
 NFdE+3oPxiFYm2vF+g1BXUlkLFfSQ==
IronPort-HdrOrdr: A9a23:1znaP6/06VvgkLQlYzduk+D6I+orL9Y04lQ7vn2ZKCY7TiX8ra
 uTdZsgpHrJYVoqNE3I5+rhBEDwex3hHPdOiOF9AV7hZniEhIKGFvAE0WKI+Vzd8kPFh4xg/J
 tBN45jFdb3EV92tsri5hKkeuxQuOVviJrY4ds31B1WPGdXgkxbnn5E4o33KCdLeDU=
X-IronPort-AV: E=Sophos;i="5.98,221,1673931600"; 
   d="scan'208";a="98730083"
Date: Tue, 28 Feb 2023 10:24:35 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Joe Jin <joe.jin@oracle.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, <xen-devel@lists.xenproject.org>
Subject: Re: Is xl vcpu-set broken
Message-ID: <Y/3WYxg9GiJXNyuQ@perard>
References: <792d9693-7bb1-9143-064a-d3687b78415f@oracle.com>
 <467c21e0-e41f-3d52-f5e0-8bcc70bfc923@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <467c21e0-e41f-3d52-f5e0-8bcc70bfc923@suse.com>

On Tue, Feb 28, 2023 at 10:37:00AM +0100, Jan Beulich wrote:
> On 28.02.2023 07:44, Joe Jin wrote:
> > We encountered a vcpu-set issue on old xen, when I tried to confirm
> > if xen upstream xen has the same issue I find neither my upstream build
> > nor ubuntu 22.04 xen-hypervisor-4.16 work.
> > 
> > I can add vcpus(8->16) to my guest but I can not reduce vcpu number:
> > 
> > root@ubuntu2204:~/vm# xl list
> > Name                                        ID   Mem VCPUs    State    Time(s)
> > Domain-0                                     0 255424    32     r-----     991.9
> > testvm                                       1   4088    16     -b----      94.6
> > root@ubuntu2204:~/vm# xl vcpu-set testvm 8
> > root@ubuntu2204:~/vm# xl list
> > Name                                        ID   Mem VCPUs    State    Time(s)
> > Domain-0                                     0 255424    32     r-----     998.5
> > testvm                                       1   4088    16     -b----      97.3
> > 
> > After xl vcpu-set, xenstore showed online cpu number reduced to 8:
[...]
> > 
> > But guest did not received any offline events at all.
> > 
> > From source code my understand is for cpu online, libxl will
> > send device_add to qemu to trigger vcpu add, for cpu offline,
> > it still rely on xenstore, is this correct?
> 
> Judging from the DSDT we provide, offlining looks to also be intended to
> go the ACPI way. Whereas libxl only ever sends "device_add" commands to
> qemu, afaics (or "cpu-add" for older qemu). Anthony - do you have any
> insight what the intentions here are?

The intention is to one day implement cpu offline in QEMU upstream for
HVM guest, I don't think that's ever been done so far.

As we use device_add for cpu hotplug, we would probably do device_del
for hot-unplug, so qemu would still have to send the appropriate even to
the guest.

Someone will have to figure out if "device_del" works with a Xen guest,
doc here:
    https://www.qemu.org/docs/master/system/cpu-hotplug.html#vcpu-hot-unplug

Cheers,

-- 
Anthony PERARD

