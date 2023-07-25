Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516B2761DAC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 17:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569805.890907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKKv-0005z7-9y; Tue, 25 Jul 2023 15:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569805.890907; Tue, 25 Jul 2023 15:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKKv-0005wx-7F; Tue, 25 Jul 2023 15:52:33 +0000
Received: by outflank-mailman (input) for mailman id 569805;
 Tue, 25 Jul 2023 15:52:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Hqi=DL=citrix.com=prvs=563c090bc=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qOKKu-0005wr-Ld
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 15:52:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41cae32c-2b03-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 17:52:29 +0200 (CEST)
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
X-Inumbo-ID: 41cae32c-2b03-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690300350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y1wruseCD2zoRQ4cVTciOKpdQ3aEXElslBWGnvk5vok=;
  b=TG8BRv9W4q6gisYMbiPwkypoxZJVPjINNJEnH+BFVJ+jligFcRAys7b4
   7vKonrWc00KhMnP6a9dmMJs4jp4SuxO2ulY+7vUVhbI/cEXC8+X69eu1/
   AHsdZWOKZc4wuVgxPC+6FntQWXWR2JdFjAOSUlLty2DB8GQlQSkmzQ+IP
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117820925
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:hUD2KaIeFmHtzW0kFE+ROZUlxSXFcZb7ZxGr2PjKsXjdYENS02cGy
 2RLDDrUbP+KajbyKNh1bNu/90MOv5XXz4I2TABlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QZjPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5cJG5O9
 MEzIQstNCHchuyZkK+mSORj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJoFxB7J/
 D+uE2LRBg0dF/yllwO8tU2Q3LWQvGThaZIKPejtnhJtqALKnTFCYPEMbnOjrOW0kAi+XMNSM
 GQd4C9opq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjRMcsA8vck6Azkjz
 EaUnsjBDCZq9raSTBq16bqV6ziyNC49JHUHIyQDSGMt58Toqcc9hxTEQ9JnDYa8lNizEjb1q
 xiVqAAuirNVitQEv4258krAmCmEvYXSQ0g+4QC/dmu94xlwfoKNe42i4l+d5vFFRLt1VXHY4
 iJCwZLHqrlTU9fUznflrPgx8K+BzNOKMDzhqldUP8MQqDWj1C6+YIJd72QrTKt2CfroaQMFc
 WeK51IJvsAJZybzBUNkS9nvUpp3lMAMAfygD6mJNYQWP/CdYSfdpElTiVisM3cBeaTGuYU2I
 t+lfMmlFh724ow3nWPtF4/xPVLGrx3SJF8/prihlXxLKZLEOBaopU4taTNilNwR4qKeuxny+
 N1CLcaMwBg3eLSgM3GNq9VPfQ9WdiRT6XXKRyp/LLXrzu1OQT9JNhMs6el5J9wNc1p9y48kA
 U1RqmcHkQGi1BUr2C2Ba2x5aaOHYHqMhStTAMDYBn7xgyJLSd/2vM8im24fIeFPGBpLkaQlE
 JHouqyoXpxyd9gw021ANcat9NI4KXxGR2umZkKYXdT2RLY4LyShxzMuVlGHGPUmZsZvifYDn
 g==
IronPort-HdrOrdr: A9a23:bL3jRqNRPbuEFsBcTuqjsMiBIKoaSvp037BL7TEVdfUxSKb0qy
 nAppgmPHPP5wr5IUtQ4OxoW5PwI080l6QU3WB5B97LYOCBggWVxepZnOjfKlPbehEWwdQtsZ
 uII5IUNDQpNykAsS8h2njfLz/8+qjhzEl1v5an856yd3ARV51d
X-Talos-CUID: 9a23:yl/X8m79aJAxFebwH9ss32sbGsEYWXTm7C3hfE62JjZ0Vb+YRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AtsY89Qwk0ScyF32VFPZD//U/n2qaqKCyD2Mtq8s?=
 =?us-ascii?q?/go67CXYqZBbalgWnWqZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="117820925"
Date: Tue, 25 Jul 2023 16:52:23 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Peter Hoyes <peter.hoyes@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, <luca.fancellu@arm.com>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [PATCH v5 2/2] xl: Add escape character argument to xl console
Message-ID: <3584fc4a-7015-4a2c-9b6b-927b70affa78@perard>
References: <20230712102917.37763-1-peter.hoyes@arm.com>
 <20230712102917.37763-3-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230712102917.37763-3-peter.hoyes@arm.com>

On Wed, Jul 12, 2023 at 11:29:17AM +0100, Peter Hoyes wrote:
> @@ -1968,9 +1979,12 @@ int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
>   * guests using pygrub.
>   * If notify_fd is not -1, xenconsole will write 0x00 to it to nofity
>   * the caller that it has connected to the guest console.
> + * If escape_character is not NULL, the provided value is used to exit
> + * the guest console.
>   */
>  int libxl_primary_console_exec(libxl_ctx *ctx, uint32_t domid_vm,
> -                               int notify_fd);
> +                               int notify_fd,
> +                               char* escape_character);
>  
>  #if defined(LIBXL_API_VERSION) && LIBXL_API_VERSION < 0x040800
>  
> @@ -1989,6 +2003,25 @@ static inline int libxl_primary_console_exec_0x040700(libxl_ctx *ctx,
>  }
>  #define libxl_primary_console_exec libxl_primary_console_exec_0x040700
>  
> +#elif defined(LIBXL_API_VERSION) && LIBXL_API_VERSION < 0x041800
> +
> +static inline int libxl_console_exec_0x041800(libxl_ctx *ctx, uint32_t domid,

Is is preferred to name these compatibility function with the version of
Xen that last presented this API, so could you rename it to
"libxl_console_exec_0x041700" ?

> +                                              int cons_num,
> +                                              libxl_console_type type,
> +                                              int notify_fd)
> +{
> +    return libxl_console_exec(ctx, domid, cons_num, type, notify_fd, NULL);
> +}
> +#define libxl_console_exec libxl_console_exec_0x041800
> +
> +static inline int libxl_primary_console_exec_0x041800(libxl_ctx *ctx,

Same thing here.

> +                                                      uint32_t domid_vm,
> +                                                      int notify_fd)
> +{
> +    return libxl_primary_console_exec(ctx, domid_vm, notify_fd, NULL);
> +}
> +#define libxl_primary_console_exec libxl_primary_console_exec_0x041800
> +

Also, could you add the extra NULL argument in the function call of both
"libxl_console_exec_0x040700()" and
"libxl_primary_console_exec_0x040700()" ?

Thanks,

-- 
Anthony PERARD

