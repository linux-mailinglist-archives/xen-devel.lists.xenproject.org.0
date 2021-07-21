Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D007E3D0A70
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 10:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159197.292851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m67UB-00031l-B3; Wed, 21 Jul 2021 08:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159197.292851; Wed, 21 Jul 2021 08:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m67UB-0002yV-76; Wed, 21 Jul 2021 08:21:47 +0000
Received: by outflank-mailman (input) for mailman id 159197;
 Wed, 21 Jul 2021 08:21:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m67UA-0002yP-0y
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 08:21:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m67U6-0006l0-FX; Wed, 21 Jul 2021 08:21:42 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m67U6-0000gi-91; Wed, 21 Jul 2021 08:21:42 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=qEouP/ccFNLfZH4tgENX/8+4RbNodN0ejUTtAt/CWVU=; b=agwVisZksSDq+Ix1a/WMPr6JHp
	DWJLzXiiCY+WQbkIBx7gfa+fbVPchqXEBdQyWFz17DfNFyjkrOJzcw3YihswY/5TPxMrqQFc6Ae2O
	XGNefwzhpt1hZvWxkWB6OcEByZekFFLeK8uAwQfCKACh7RY+djnbny6R+ZMe1HEYZJP4=;
Subject: Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg
To: Scott Davis <scottwd@gmail.com>, xen-devel@lists.xenproject.org
Cc: Scott Davis <scott.davis@starlab.io>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <6562806d7430431dc154af2c6e4a5232725fc136.1626800539.git.scott.davis@starlab.io>
From: Julien Grall <julien@xen.org>
Message-ID: <c8a1120b-0a4e-60ef-66c0-5c33ab988a54@xen.org>
Date: Wed, 21 Jul 2021 09:21:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6562806d7430431dc154af2c6e4a5232725fc136.1626800539.git.scott.davis@starlab.io>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Scott,

On 20/07/2021 18:56, Scott Davis wrote:
> This adds an option to the xl domain configuration file syntax for specifying
> a kernel command line for device-model stubdomains. It is intended for use with
> Linux-based stubdomains.

May I ask why embedding the command line in the kernel would not be a 
solution? Do you expect it to change from stubdom to stubdom?

> Signed-off-by: Scott Davis <scott.davis@starlab.io>
> ---
>   docs/man/xl.cfg.5.pod.in             | 4 ++++
>   tools/golang/xenlight/helpers.gen.go | 3 +++
>   tools/golang/xenlight/types.gen.go   | 1 +
>   tools/libs/light/libxl_dm.c          | 1 +
>   tools/libs/light/libxl_types.idl     | 1 +
>   tools/xl/xl_parse.c                  | 2 ++
>   6 files changed, 12 insertions(+)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 56370a37db..6c777cad5c 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2742,6 +2742,10 @@ In case of B<qemu-xen-traditional> it is expected to be MiniOS-based stubdomain
>   image, in case of B<qemu-xen> it is expected to be Linux-based stubdomain
>   kernel.
>   
> +=item B<stubdomain_cmdline="STRING">
> +
> +Append B<STRING> to the device-model stubdomain kernel command line.
> +
>   =item B<stubdomain_ramdisk="PATH">
>   
>   Override the path to the ramdisk image used as device-model stubdomain.
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index db82537b42..bfc1e7f312 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1018,6 +1018,7 @@ return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
>   }
>   x.StubdomainMemkb = uint64(xc.stubdomain_memkb)
>   x.StubdomainKernel = C.GoString(xc.stubdomain_kernel)
> +x.StubdomainCmdline = C.GoString(xc.stubdomain_cmdline)
>   x.StubdomainRamdisk = C.GoString(xc.stubdomain_ramdisk)
>   x.DeviceModel = C.GoString(xc.device_model)
>   x.DeviceModelSsidref = uint32(xc.device_model_ssidref)
> @@ -1344,6 +1345,8 @@ return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
>   xc.stubdomain_memkb = C.uint64_t(x.StubdomainMemkb)
>   if x.StubdomainKernel != "" {
>   xc.stubdomain_kernel = C.CString(x.StubdomainKernel)}
> +if x.StubdomainCmdline != "" {
> +xc.stubdomain_cmdline = C.CString(x.StubdomainCmdline)}
>   if x.StubdomainRamdisk != "" {
>   xc.stubdomain_ramdisk = C.CString(x.StubdomainRamdisk)}
>   if x.DeviceModel != "" {
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index a214dd9df6..09a3bb67e2 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -483,6 +483,7 @@ DeviceModelVersion DeviceModelVersion
>   DeviceModelStubdomain Defbool
>   StubdomainMemkb uint64
>   StubdomainKernel string
> +StubdomainCmdline string
>   StubdomainRamdisk string
>   DeviceModel string
>   DeviceModelSsidref uint32
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index dbd3c7f278..2d54596834 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -2373,6 +2373,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
>       }
>   
>       stubdom_state->pv_kernel.path = guest_config->b_info.stubdomain_kernel;
> +    stubdom_state->pv_cmdline = guest_config->b_info.stubdomain_cmdline;
>       stubdom_state->pv_ramdisk.path = guest_config->b_info.stubdomain_ramdisk;
>   
>       /* fixme: this function can leak the stubdom if it fails */
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index f45adddab0..e782e15cf2 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -523,6 +523,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>       ("device_model_stubdomain", libxl_defbool),
>       ("stubdomain_memkb",   MemKB),
>       ("stubdomain_kernel",  string),
> +    ("stubdomain_cmdline", string),

Please add a LIBXL_HAVE_... in include/libxl.h. This is used by external 
toolstack (e.g. libvirt) to know whether a given version of libxl 
provide the field.

>       ("stubdomain_ramdisk", string),
>       # if you set device_model you must set device_model_version too
>       ("device_model",     string),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 9fb0791429..17dddb4cd5 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2533,6 +2533,8 @@ skip_usbdev:
>   
>       xlu_cfg_replace_string (config, "stubdomain_kernel",
>                               &b_info->stubdomain_kernel, 0);
> +    xlu_cfg_replace_string (config, "stubdomain_cmdline",
> +                            &b_info->stubdomain_cmdline, 0);
>       xlu_cfg_replace_string (config, "stubdomain_ramdisk",
>                               &b_info->stubdomain_ramdisk, 0);
>       if (!xlu_cfg_get_long (config, "stubdomain_memory", &l, 0))
> 

Cheers,

-- 
Julien Grall

