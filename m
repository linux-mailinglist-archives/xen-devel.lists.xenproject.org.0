Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77837B398B1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098079.1452204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZDq-000803-5u; Thu, 28 Aug 2025 09:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098079.1452204; Thu, 28 Aug 2025 09:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZDq-0007x7-3D; Thu, 28 Aug 2025 09:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1098079;
 Thu, 28 Aug 2025 09:47:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+YJy=3I=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1urZDo-0007x1-Ay
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:47:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f53c7eaa-83f3-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 11:47:06 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 16F5B4EE3C0D;
 Thu, 28 Aug 2025 11:47:05 +0200 (CEST)
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
X-Inumbo-ID: f53c7eaa-83f3-11f0-aeb2-fb57b961d000
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1756374425;
	b=Wk0VSLG0oladDHdTFGaNFJRuhH4/cDhTKkhK8006zxhvMN6fGnMeYQr0MLkNcDItqcdb
	 0doSXjlosZyWMrnhEURl9nmDMMbfzA7b5Ntv216QtTcLdlvGEIBnjZY3ki3Awj9+zmUI/
	 7aJesBlIB9Zh+DGFFtS/uMLjxJ5X/KWlYcgew4QaL5owU9E/mIi6lx0DrRtsaf8nmI13F
	 SWdP46iEznKokaxLeEJ/VgJL5Uqh69ZuLn9MXoCrwuqsquEHA7uupQ9LyXtNroXRWHTPY
	 P/UdUgodWIlWE6xfzj0oXIqDGG9mB/4VfsjliUqLaSt7bPpGHwC0xFqa468GkryefzBHV
	 VLVNS/fb1FvBujCbLKQ0Y/NT4B2LTNHGwAxuvgUjMrEH1+wJvSQQ0r+JS7pR0ecRBvWAW
	 /vz9yR7BpqTpxqSRmqbt0p/Qw9fdCYdIJ5aMckWWHk2dv5iN/3q/2WeVMWDrzEvBaTZ9H
	 zUisFN8EpVe36/pd0rZJIlfQ76n4WbIH3OUFzp2124+E7sWak8WRWI0/74YqqzWFlvL7n
	 1DRYB3Ff23+V7TaAAZRHbNGVJUw/DyxKTsxcljqewuxQHKznPIGeyhaxuBJhs6vz5USYR
	 g7HuZvq0ytCyZg33gb3jL6ugCVU/NSmBjKyGY2T4zZ1jhytn3joTBekjgUqWgC0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1756374425;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=k8u/y/zcCwUh/VCOQj0590vl7KVi9uYN70b/lnDcouA=;
	b=tt1Aizn1Fy44XypiylC6+lamra05MfbzLL641oV+eSXEWbBaTf0iRslCrkrVzar8VFUe
	 9qu3VxDBjOJGB7tiFf3/GqjmRgPztu3dANqJR53lDCA1iLSOc+pj4n05aPYwteg82qNtc
	 pzcMfDfwteFCRBe/cJocrnULBybRYmNisS5jpvUPQMZDIfmHlmoo++AwKeYw9VzgElfYc
	 /92wU6mJe6PX3t5bkSx4xL+l0eLlwbhwFRfwIEtyr4WOC/sNRRtkuALuffDajt1Gt3XMU
	 7k4EeMStlD1kO8s5hpV0M8M56Qo3ES99xhGVu7rk+7J2Eignl6rIPIUOOzbHBy8H2cU+A
	 AcjoaG+wNRxXjEkQUE//XpMmMp6dmzNw37P54XB1xH+fL97ETWXOVklEASPjhyOBAV8B4
	 d+NSY05rcv0C0+G/YCHAtzbNN84iQb8gTsbO8Em/WJQlbDSYLbtp1tP6T0KcQqTTkdGlh
	 P9ad+PXj0t52oOfg9zQYGDvAHSRy8XE2QvEO2c4/p1ypqFjt9njoRmyg0CFda/+FEOqJd
	 jpL644oA8dmUj+Y6Ie3xynRpxnEqkUJCClz5wpf07IGVnW5X0CFcZIkXybbnq4VX2fMFZ
	 48TTwJwFzFpgP/o6hNM3GSGabRWQSjQG5dMM8eJ+WjGFCJlCsdxLjDSFGKGXjsQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1756374425; bh=y1tW11NzB5ssqxp7Tp1PihDpVcFpHzNLhL7uXLckTvA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L1LBao0h8c76m6YtRHot3OKEwPDY2yFohPCzJV9hmSZMoOCdTtce5z75kYb3uIpEi
	 Dt5dphO5HDcuPRbY5dPOJzUyny2G1uhRpavvBhKV61+p4gdf5kGhUgmbD0n8OoVwYY
	 oIWWtz1VoCoHLavIgczLaSO82AfoaWDux6PQPPSzyLdumqxa1P6AfM7OS6AfUrO+FJ
	 XdjMmGylMOk2wGLFZM4/ZRPQVBmLbdXqaV3VdPRS7BKWOqCTyYglZPmksskDBoLKRb
	 hmMfSDu7O+fojKKkOP4BoXt3ZEDjS+ob8DYo03tGwEYfS0h421miVCyv4sKk53G8cE
	 yUyckF+jV4ggg==
MIME-Version: 1.0
Date: Thu, 28 Aug 2025 11:47:05 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
In-Reply-To: <0e562f695e5db87ab80dde69cbcc0cfa14f94b21.1756373770.git.dmytro_prokopchuk1@epam.com>
References: <0e562f695e5db87ab80dde69cbcc0cfa14f94b21.1756373770.git.dmytro_prokopchuk1@epam.com>
Message-ID: <861c88c005b041fa622310d6bef63c25@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-28 11:39, Dmytro Prokopchuk1 wrote:
> Fix an issue in the 'fail:' cleanup path of the 
> 'assign_shared_memory()'
> function where the use of an unsigned long 'i' with the condition
> '--i >= 0' caused an infinite loop. Update the loop to use 'i--',
> ensuring correct loop termination.
> 
> This change adheres to MISRA C Rule 14.3: "Controlling expressions 
> shall
> not be invariant."
> 
> Fixes: 72c5fa2208 (device-tree: Move Arm's static-shmem feature to 
> common, 2025-06-03)

The format should be

Fixes: 72c5fa220804 ("device-tree: Move Arm's static-shmem feature to 
common")

can be fixed on commit probably

> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Changes to v2:
> - added Fixes tag
> - updated the loop to use 'i--'
> - updated commit message accordingly
> 
> Link to v1:
> https://patchew.org/Xen/d7768394209c65cfef4006c3ffc0a0f5d82c4c18.1756368997.git.dmytro._5Fprokopchuk1@epam.com/
> ---
>  xen/common/device-tree/static-shmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/device-tree/static-shmem.c 
> b/xen/common/device-tree/static-shmem.c
> index 8023c0a484..79f23caa77 100644
> --- a/xen/common/device-tree/static-shmem.c
> +++ b/xen/common/device-tree/static-shmem.c
> @@ -185,7 +185,7 @@ static int __init assign_shared_memory(struct 
> domain *d, paddr_t gbase,
>      return 0;
> 
>   fail:
> -    while ( --i >= 0 )
> +    while ( i-- )
>          put_page_nr(page + i, nr_borrowers);
>      return ret;
>  }

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

