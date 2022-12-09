Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D274648357
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 15:05:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457922.715853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3dzy-000302-GS; Fri, 09 Dec 2022 14:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457922.715853; Fri, 09 Dec 2022 14:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3dzy-0002yH-Dn; Fri, 09 Dec 2022 14:05:10 +0000
Received: by outflank-mailman (input) for mailman id 457922;
 Fri, 09 Dec 2022 14:05:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nv8v=4H=citrix.com=prvs=3352c5006=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p3dzx-0002yB-8e
 for xen-devel@lists.xen.org; Fri, 09 Dec 2022 14:05:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b469067-77ca-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 15:05:07 +0100 (CET)
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
X-Inumbo-ID: 7b469067-77ca-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670594707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+apzwZeekKNIH448nSTGPvDEHZyOsinV+UJtOdYphaw=;
  b=gfxfnDnh9VZZS/XdLsmEQpLOfcUc0NMKfl15UQG8RTsEpgzpuZcsRl3g
   6bB5XuTaCzC+eiSDjRBht7A8WT2EqWWmF3QU2Aq+KznzZQ4H27OWE8gJU
   7JozqJn4XrAChu2Po60VKJwFFDwyzOM0u6amlz6b1hJpK+IE2SJkO5Vc1
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87949434
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:spcoEaobx+bAdN4APFDaV+OKVDleBmJwYhIvgKrLsJaIsI4StFCzt
 garIBnSOauDYmunLYhxYYq3/BlXuJ/cxoUxGgBo/ilnE3wVoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzyhNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADJSM1ffneaK+rDlVMdhxcV/Be77bIxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw9
 j2XozWlWU1y2Nq3kDWX2V6Kirf1gzL5VKQsCaaa0s9zqQjGroAUIEJPDgbqyRWjsWa7Us5fK
 kEJvDIprLIz+VaDStj7Vge/5nWDu3Y0QMZdHeQ870eW1qPe7gKdB24FZi5AbN0gpIk9QjlC/
 laNksOvDzFptrCYYXac8L6OqnW1Iyd9BXAGTT8JS00C+daLiIY3gxHUUsd4EIa6i9T0HXf7x
 DXihC0/hLhVjckP0qig1VTGhTu2od7OVAFdzgfYRGW+9StieZWoIYev7DDz/ftGaYqUUFSFl
 HwFgNSFqvADC9eKjiPlaPsMBryy57CGLTjVm3ZrHp8o7TPr/GSsFahL/Ct3OEByd8oJZxfue
 ArXuBhN/9lXPX2jd6gxZJi+Y+w0zK7rGNL5EP/Jb8ZSZYRZcA6B9TtpI0mK0AjFklUokKw5E
 YeWd4CrF3lyNEh85GPoHaFHi+Ztn31ggzOILXzm8/i5+bjBOTnJU7M5ClnQcM40r6LYiSLFo
 9kKYqNm1C5jeOH5ZyDW96saIlYLMWU3CPjKliBHSgKQClE4QT98Upc91ZtkItU4xPoNyo8k6
 1nnAidlJEzDaWorwOlgQlRqc/vRUJl2thrX1gR8bA/zixDPjWtChZrzlqfbn5F9rISPLtYuF
 ZHpnvls5dwRIgkrAxxHMfHAQHVKLXxHfz6mMSu/eyQYdJV9XQHP8dKMVlKxq3FTVHbr7Zpk+
 OTIOubnrX0rHlUKMSorQKj3kwPZUYY1x4qeoHck0vEMIR6xoeCG2gT6j+MtItFkFPkw7mLy6
 upiOj9B/bOli9ZsoLH0aVWs89/B/x1WQhALQAE2LN+eaUHnw4ZU6dMZCr7TJ2CHDjicFWfLT
 bw98swQ+cYvxD5i27eQ2Z4xpU7iz7MDf4Nn8zk=
IronPort-HdrOrdr: A9a23:OlK+/KuqEoXjsjEt2WMLytxi7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.96,230,1665460800"; 
   d="scan'208";a="87949434"
Date: Fri, 9 Dec 2022 14:04:49 +0000
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
Message-ID: <Y5NAgZsG15LuUCd6@perard.uk.xensource.com>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <73663851c5223b99ed0f23a163a0d44cba0ebe29.1667906228.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <73663851c5223b99ed0f23a163a0d44cba0ebe29.1667906228.git.viresh.kumar@linaro.org>

On Tue, Nov 08, 2022 at 04:53:59PM +0530, Viresh Kumar wrote:
> diff --git a/tools/ocaml/libs/xl/genwrap.py b/tools/ocaml/libs/xl/genwrap.py
> index 7bf26bdcd831..b188104299b1 100644
> --- a/tools/ocaml/libs/xl/genwrap.py
> +++ b/tools/ocaml/libs/xl/genwrap.py
> @@ -36,6 +36,7 @@ DEVICE_LIST =      [ ("list",           ["ctx", "domid", "t list"]),
>  functions = { # ( name , [type1,type2,....] )
>      "device_vfb":     DEVICE_FUNCTIONS,
>      "device_vkb":     DEVICE_FUNCTIONS,
> +    "device_virtio":     DEVICE_FUNCTIONS,
>      "device_disk":    DEVICE_FUNCTIONS + DEVICE_LIST +
>                        [ ("insert",         ["ctx", "t", "domid", "?async:'a", "unit", "unit"]),
>                          ("of_vdev",        ["ctx", "domid", "string", "t"]),
> diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
> index 45b8af61c74a..8e54f95da7c7 100644
> --- a/tools/ocaml/libs/xl/xenlight_stubs.c
> +++ b/tools/ocaml/libs/xl/xenlight_stubs.c
> @@ -707,6 +707,7 @@ DEVICE_ADDREMOVE(disk)
>  DEVICE_ADDREMOVE(nic)
>  DEVICE_ADDREMOVE(vfb)
>  DEVICE_ADDREMOVE(vkb)
> +DEVICE_ADDREMOVE(virtio)
>  DEVICE_ADDREMOVE(pci)
>  _DEVICE_ADDREMOVE(disk, cdrom, insert)

I don't think these ocaml changes are necessary, because they don't
build. I'm guessing those adds the ability to hotplug devices which
virtio device don't have, so function for that are missing.

> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 1b5381cef033..c6f35c069d2a 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2309,8 +2390,10 @@ void parse_config_data(const char *config_source,
>  
>      d_config->num_vfbs = 0;
>      d_config->num_vkbs = 0;
> +    d_config->num_virtios = 0;
>      d_config->vfbs = NULL;
>      d_config->vkbs = NULL;
> +    d_config->virtios = NULL;

These look a bit out of place, I think it would be fine to set
num_virtios and virtios just before calling parse_virtio_list(), as
array are usually initialised just before parsing the associated config
option in parse_config_data().

>      if (!xlu_cfg_get_list (config, "vfb", &cvfbs, 0, 0)) {
>          while ((buf = xlu_cfg_get_listitem (cvfbs, d_config->num_vfbs)) != NULL) {
> @@ -2752,6 +2835,7 @@ void parse_config_data(const char *config_source,
>      }
>  
>      parse_vkb_list(config, d_config);
> +    parse_virtio_list(config, d_config);
>  
>      xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
>                          &c_info->xend_suspend_evtchn_compat, 0);

Thanks,

-- 
Anthony PERARD

