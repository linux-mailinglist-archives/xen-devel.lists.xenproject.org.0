Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926A197CEB4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 23:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800932.1210925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srOLf-0004nF-Oi; Thu, 19 Sep 2024 21:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800932.1210925; Thu, 19 Sep 2024 21:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srOLf-0004k9-LU; Thu, 19 Sep 2024 21:05:59 +0000
Received: by outflank-mailman (input) for mailman id 800932;
 Thu, 19 Sep 2024 21:05:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R1jh=QR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1srOLe-0004k3-Ap
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 21:05:58 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f56c35c3-76ca-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 23:05:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CC116828732E;
 Thu, 19 Sep 2024 16:05:53 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rVcLhjt6dAd5; Thu, 19 Sep 2024 16:05:53 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E777D8287ABE;
 Thu, 19 Sep 2024 16:05:52 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zIX6HYs1kcSE; Thu, 19 Sep 2024 16:05:52 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 4D916828732E;
 Thu, 19 Sep 2024 16:05:52 -0500 (CDT)
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
X-Inumbo-ID: f56c35c3-76ca-11ef-a0b8-8be0dac302b0
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E777D8287ABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1726779952; bh=/A2X4/IeCK/jQWXsnwr876B+oyQlr6xBv/sDtR1IuQ4=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=FN1TZ87nKVc2xCsD0FHnGlf4gvFyMZS6jeMkUr5tu8p+Repdk3/lnsPYx+kf+npAX
	 +djsuioUzfJC/D6JnLrom7eWzYCnnEWq9m+So9/QoIMlL0sbRS4FzVIMcNq2Bs1eD/
	 JoFdkN0+FgmgPgbSbKCcnsVKJhV29PAE0Ny6o2yQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <c7670e45-30dd-4cba-a226-a5130412a96c@raptorengineering.com>
Date: Thu, 19 Sep 2024 16:05:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] xen: define ACPI and DT device info sections
 macros
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
 <3049dd691f79c688751abaae63c0ccdc36680fbb.1726579819.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <3049dd691f79c688751abaae63c0ccdc36680fbb.1726579819.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 9/17/24 11:15 AM, Oleksii Kurochko wrote:
> Introduce conditional macros to define device
> information sections based on the configuration of ACPI
> or device tree support. These sections are required for
> common code of device initialization and getting an information
> about a device.
> 
> These macros are expected to be used across different
> architectures (Arm, PPC, RISC-V), so they are moved to
> the common xen/xen.lds.h, based on their original definition
> in Arm.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>  - New patch.
> ---
>  xen/include/xen/xen.lds.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index a17810bb28..aa7301139d 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -114,6 +114,21 @@
>  
>  /* List of constructs other than *_SECTIONS in alphabetical order. */
>  
> +#define USE_DECL_SECTION(x) DECL_SECTION(x)
> +
> +#define NOUSE_DECL_SECTION(x) x :
> +
> +#ifdef CONFIG_ACPI
> +#define ACPI_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)  \
> +    DECL_SECTION_MACROS_NAME(secname) {                     \
> +      _asdevice = .;                                        \
> +      *(secname)                                            \
> +      _aedevice = .;                                        \
> +    } :text
> +#else
> +#define ACPI_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)
> +#endif /* CONFIG_ACPI */

This works, but is there a reason you didn't just define the actual
entries themselves in the macro, like is done for most of the other
macros in this file (including BUFRAMES right below this)? Something
like:

#define ADEV_INFO     \
    _asdevice = .;    \
    *(secname)        \
    _aedevice = .;    \

Parameterizing the section name seems pointless since there are other
parts of the code that rely on them, and parameterizing the macro for
declaring a section adds unnecessary boilerplate for non-ppc/x86
architectures (the NOUSE_DECL_SECTION no-op).

> +
>  #define BUGFRAMES                               \
>      __start_bug_frames_0 = .;                   \
>      *(.bug_frames.0)                            \
> @@ -131,6 +146,17 @@
>      *(.bug_frames.3)                            \
>      __stop_bug_frames_3 = .;
>  
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +#define DT_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)  \
> +    DECL_SECTION_MACROS_NAME(secname) {                     \
> +      _sdevice = .;                                         \
> +      *(secname)                                            \
> +      _edevice = .;                                         \
> +    } :text
> +#else
> +#define DECL_DT_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)
> +#endif /* CONFIG_HAS_DEVICE_TREE */

Ditto. Also, if you go with the approach I mentioned, then you wouldn't
need to guard these on CONFIG_HAS_DEVICE_TREE/CONFIG_ACPI since that
would be done in the linker scripts themselves.

Thanks,
Shawn

