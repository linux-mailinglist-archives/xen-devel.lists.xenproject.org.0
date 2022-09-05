Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA80C5AD5A0
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 17:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398905.639891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVDZG-0003JY-Bc; Mon, 05 Sep 2022 14:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398905.639891; Mon, 05 Sep 2022 14:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVDZG-0003GS-7m; Mon, 05 Sep 2022 14:59:18 +0000
Received: by outflank-mailman (input) for mailman id 398905;
 Mon, 05 Sep 2022 14:59:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjDm=ZI=citrix.com=prvs=240d055ed=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oVDZE-0003GM-9p
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 14:59:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c0bb098-2d2b-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 16:59:11 +0200 (CEST)
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
X-Inumbo-ID: 4c0bb098-2d2b-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662389951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SUYhBjSo65ns5zJUnqPMv2slbVg/QCx9SuyguzqTMdk=;
  b=RYW1kIpi9CFsOCyZaZK6txvjntTwGagma3YfQpIQ/7lq7tnMRI6XsH0K
   8qbA5R1egJdIUDo5MzlyDxUUS7WfDblLO790VQsLsWsmWFmGLlwpeuKqi
   8acy9CbQffKiwDG8viBAZNq1EFMLjVdcl2NGJRmP5jS9XwbrnSJGL5ixX
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80220326
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rd93w6lb6LLuyGzOfyJm+Hro5gyIIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLCz2Fb/ncZTOhetlwOdyxoxlUuZ6DmtVrSFFspXs2RCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37ayv4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kqNI0nyNtyIFh35
 NckOB89VkG/3MSflefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+Oi1aoCNIYbULSlTth28i
 VDG/HniPgATG//FwBe9yy3y1vCayEsXX6pNTeblp5aGmma7xGYeFRkXXluTuuSihwi1XNc3A
 0cU4Cs1sa8q9EGxCMa7VBmxun2ssRsVWt4WGOo/gCmGyrDV+BqeHmgJVHhKbNU8t+ctWTUw0
 laD2dLubRRjqKaQSG6d3r6MoCmuJDMOKmsfeS4DSxBD6N7myKk3jw/QQ/5mEaWvicbyFy22y
 DePxAAhg50DgMhN0L+0lXjXjjTpqpXXQwod4gTMQnnj/g5/fJSiZYGj9R7c9/koBKyUVEWbt
 X4I3e2X9vkTDIqlnTaIBu4KGdmB5fmfNybHqUVyBJRn/DOok1adeoRX7CB7NV1eGM8Ocj/0Y
 2feoQpUopRUOROCTaJxeZP3NM0swoDpD9GjXffRBvJVeYR4fgKD+CBoZGaT0nrrnUxqlrswU
 b+ZbMKtAHAyGalhij2sSI8107AxzyQ67WrWTIL8yVKs1r/2TGWJRLkMNlzIdfww5q6ApATT8
 v5PNs+LzQUZW+r7ChQ76qZKcwpMdyJiQ8mr9YoHLYZvPzaKBkk9Av/u844kWrVcjo9phsj4x
 iCBAWlxnQ+XaWL8FemaVpxyQOqxA8wn/SlqY3JE0UWAgCZ6P9v2hEsLX95uJOR8qrQ+pRJhZ
 6NdE/hsFMijXdguF941SZDm5LJvex2w7e5lF3r0OWNvF3KMquGgxzMFQucM3HNUZsZPnZFiy
 4BMLyuCKXb5eyxsDdzNdNWkxE6rsH4WlYpaBhWWeIIKJhiwqdE1cUQda8PbxOlVcH3+Ksayj
 V7KUX/0W8GWy2PKzDU5rf/d9Nr4ewePNkFbA3Pa/d6LCMUuxUL6mNcobQp9VWqCPI8C0Pn9O
 L49IjCVGKFvoWumRKIlSeY1kP9luoOyz1KYpyw9dEj2g52QIusIChG7MQNn78WhGpcxVdOKZ
 3+y
IronPort-HdrOrdr: A9a23:mt0LdKygZ/VlHQAOtJoHKrPwLr1zdoMgy1knxilNoRw8SK2lfu
 SV7ZMmPH7P+VIssR4b9exoVJPufZqYz+8S3WBzB8bGYOCFghrKEGgK1+KLqFeMJ8S9zJ8+6U
 4JSdkGNDSaNzhHZKjBjjWFLw==
X-IronPort-AV: E=Sophos;i="5.93,291,1654574400"; 
   d="scan'208";a="80220326"
Date: Mon, 5 Sep 2022 15:59:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, "Bertrand
 Marquis" <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, "Julien
 Grall" <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Wei
 Liu" <wl@xen.org>, "Wei Liu (LSG)" <liuwe@microsoft.com>
Subject: Re: Xen 4.17 release: Current status before the feature freeze
Message-ID: <YxYOt4+D5VtkMscV@perard.uk.xensource.com>
References: <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>

On Mon, Sep 05, 2022 at 03:44:33AM +0000, Henry Wang wrote:
> ** Blocker List **:
> 2. The fix of libvirt after the virtio support in toolstack
> Status: The OSSTEST seems to work properly, apart from what Jan
> asked in IRC - the qemu and omvf OSSTEST might need a force push.
> (I am not sure if this has been fixed so I just carried this)

The build fix for libvirt have been applied to the project libvirt.

osstest needs to be updated to be able to build recent version of
libvirt. But we'll have to wait until Roger is back to update osstest
(patch for osstest are available).

Once osstest is updated, it should be able to test the recent version of
libvirt and then start to use it with other branch (qemu and ovmf).
I don't think a force push for qemu and ovmf is necessary, and fairly
soon not needed.


> ** Common **:
> 10. [XEN,v2] build: Fix x86 out-of-tree build without EFI
> https://patchwork.kernel.org/project/xen-devel/list/?series=668331
> Status: Reviewed but not merged.

I believe this should be a blocker. And the status might be that I need
to update the patch.

Cheers,

-- 
Anthony PERARD

