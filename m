Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29173990AC8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 20:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810588.1223292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swmpV-0003fT-Qo; Fri, 04 Oct 2024 18:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810588.1223292; Fri, 04 Oct 2024 18:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swmpV-0003cq-Nj; Fri, 04 Oct 2024 18:15:05 +0000
Received: by outflank-mailman (input) for mailman id 810588;
 Fri, 04 Oct 2024 18:15:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=34DV=RA=bounce.vates.tech=bounce-md_30504962.670030a3.v1-6c8ce1e1cb354ef79dc5b54d7cbb15fb@srs-se1.protection.inumbo.net>)
 id 1swmpU-0003ck-4m
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 18:15:04 +0000
Received: from mail136-19.atl41.mandrillapp.com
 (mail136-19.atl41.mandrillapp.com [198.2.136.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9211b610-827c-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 20:15:02 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-19.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XKxXg6yflzRKLqCB
 for <xen-devel@lists.xenproject.org>; Fri,  4 Oct 2024 18:14:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6c8ce1e1cb354ef79dc5b54d7cbb15fb; Fri, 04 Oct 2024 18:14:59 +0000
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
X-Inumbo-ID: 9211b610-827c-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1728065700; x=1728326200;
	bh=DgaFH5bUOwvzXi7v8lQ+bUNtGFos/z7bsOhh2Pm8sHA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wzRGOxnCk64CKp8PYGTypP4xmaVAdavquAZgkRFVPgAQwreklCW7pK+1vuTtOR2Wo
	 5r9bGCTpMVrPAp0YwCFYKjRtdLpdMQeqel7y2XHkFsiFqb7gCLTSQ/+Oiw+QB05z17
	 XjE0KQFpYd48p4/z6mbmMwHzGPPLE0FFsyLA06SB/IkesFFCIxP+TTbbg7NsEbcS5C
	 qvXYAvpDVPmV/0giMcF953yAGgp829c7PEmEY9XeQwY+N8subRlQ4L8sPkS76MKsGv
	 7JgGPTnHCU6EMfvJVvK3Vz18Q4/hRiSIQ/dYbKYpIT2V2s8VMn/s2FwbBT7Oav2djH
	 uu/1wizZViEgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1728065700; x=1728326200; i=anthony.perard@vates.tech;
	bh=DgaFH5bUOwvzXi7v8lQ+bUNtGFos/z7bsOhh2Pm8sHA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QPwzgFuYVo3Fpt/88rd+CsikwK7AaQKF+Pn8Zc0s6HH/R6fQVg0L7LPEz+eH9aN3Q
	 JUEkDBMY6pxSRCpr0/7ioZvpAiWdr+wQ5StdRpQoFK76o/7QML804PwANunfub0e0F
	 S5bhVDAuWwn6YpaA2ZSWayQCkRSgJsGdFMAsqOpB3xY8mcVTg7mxma7p8IGmCpDh+R
	 xx71mWv4rCx7QXmS1BGn7rsmmyA6PUseZCID6kyV2g8Q40eP5hSxMcqvSN8UABF593
	 WQjTZdCuUAqhx9YZemZo+oTqskyq9cNH+p41WW77J5br1uTRmZ7lFJd5JDhJCB30B1
	 gt8q3lJYWSVNg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20CI:=20Fix=20builds=20following=20qemu-xen=20update?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1728065698312
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <ZwAwoSOUQuRXeNIH@l14>
References: <20241004172723.2391026-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241004172723.2391026-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6c8ce1e1cb354ef79dc5b54d7cbb15fb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241004:md
Date: Fri, 04 Oct 2024 18:14:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Oct 04, 2024 at 06:27:23PM +0100, Andrew Cooper wrote:
> A recent update to qemu-xen has bumped the build requirements, with Python 3.8
> being the new baseline but also needing the 'ensurepip' and 'tomllib/tomli'
> packages.
> 
>  * Ubuntu/Debian package 'ensurepip' separately, but it can be obtained by
>    installing the python3-venv package.
> 
>  * 'tomllib' was added to the python standard library in Python 3.11, but
>    previously it was a separate package named 'tomli'.
> 
> In terms of changes required to build QEMU:
> 
>  * Ubuntu 24.04 (Noble) has Python 3.12 so only needs python3-venv
> 
>  * Ubuntu 22.04 (Jammy) has Python 3.10 but does have a python3-tomli package
>    that QEMU is happy with.
> 
>  * FreeBSD has Python 3.9, but Python 3.11 is available.
> 
> In terms of exclusions:
> 
>  * Ubuntu 20.04 (Focal) has Python 3.8, but lacks any kind of tomli package.
> 
>  * Fedora 29 (Python 3.7), OpenSUSE Leap 15.6 (Python 3.6), and Ubuntu
>    18.04/Bionic (Python 3.6) are now too old.
> 
> Detecting tomllib/tomli is more than can fit in build's oneliner, so break it
> out into a proper script.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

The changes on the gitlab side look fine. I don't know if the changes on
the cirrus side are ok, but at least the seems to work, after looking at
the build logs. So:

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

