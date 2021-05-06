Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08124377287
	for <lists+xen-devel@lfdr.de>; Sat,  8 May 2021 17:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124347.234671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfOeZ-0000pZ-99; Sat, 08 May 2021 15:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124347.234671; Sat, 08 May 2021 15:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfOeZ-0000mc-5I; Sat, 08 May 2021 15:14:03 +0000
Received: by outflank-mailman (input) for mailman id 124347;
 Sat, 08 May 2021 15:14:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0wEz=KD=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1lfOeY-0000Ee-Bk
 for xen-devel@lists.xenproject.org; Sat, 08 May 2021 15:14:02 +0000
Received: from sonata.ens-lyon.org (unknown [140.77.166.138])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5773dd27-4c3e-4e59-87f2-31da74938602;
 Sat, 08 May 2021 15:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 1E524201AA;
 Sat,  8 May 2021 13:35:08 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4VFAkahei4v; Sat,  8 May 2021 13:35:08 +0200 (CEST)
Received: from begin (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr [90.50.148.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id F0853201A9;
 Sat,  8 May 2021 13:35:07 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lfLEh-00BM8c-CP; Sat, 08 May 2021 13:35:07 +0200
Resent-From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Resent-Date: Sat, 8 May 2021 13:35:07 +0200
Resent-Message-ID: <20210508113507.vama7kfpk2u33xcj@begin>
Resent-To: jandryuk@gmail.com, xen-devel@lists.xenproject.org,
 iwj@xenproject.org, wl@xen.org
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
X-Inumbo-ID: 5773dd27-4c3e-4e59-87f2-31da74938602
Date: Thu, 6 May 2021 23:52:55 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 13/13] vtpm: Correct timeout units and command duration
Message-ID: <20210506215255.yftnedauoz4e3bga@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-14-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210506135923.161427-14-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jason Andryuk, le jeu. 06 mai 2021 09:59:23 -0400, a ecrit:
> Add two patches:
> vtpm-microsecond-duration.patch fixes the units for timeouts and command
> durations.
> vtpm-command-duration.patch increases the timeout linux uses to allow
> commands to succeed.
> 
> Linux works around low timeouts, but not low durations.  The second
> patch allows commands to complete that often timeout with the lower
> command durations.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/Makefile                        |  2 +
>  stubdom/vtpm-command-duration.patch     | 52 +++++++++++++++++++++++++
>  stubdom/vtpm-microsecond-duration.patch | 52 +++++++++++++++++++++++++
>  3 files changed, 106 insertions(+)
>  create mode 100644 stubdom/vtpm-command-duration.patch
>  create mode 100644 stubdom/vtpm-microsecond-duration.patch
> 
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index c6de5f68ae..06aa69d8bc 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -239,6 +239,8 @@ tpm_emulator-$(XEN_TARGET_ARCH): tpm_emulator-$(TPMEMU_VERSION).tar.gz
>  	patch -d $@ -p1 < vtpm-implicit-fallthrough.patch
>  	patch -d $@ -p1 < vtpm_TPM_ChangeAuthAsymFinish.patch
>  	patch -d $@ -p1 < vtpm_extern.patch
> +	patch -d $@ -p1 < vtpm-microsecond-duration.patch
> +	patch -d $@ -p1 < vtpm-command-duration.patch
>  	mkdir $@/build
>  	cd $@/build; CC=${CC} $(CMAKE) .. -DCMAKE_C_FLAGS:STRING="-std=c99 -DTPM_NO_EXTERN $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) -Wno-declaration-after-statement"
>  	touch $@
> diff --git a/stubdom/vtpm-command-duration.patch b/stubdom/vtpm-command-duration.patch
> new file mode 100644
> index 0000000000..6fdf2fc9be
> --- /dev/null
> +++ b/stubdom/vtpm-command-duration.patch
> @@ -0,0 +1,52 @@
> +From e7c976b5864e7d2649292d90ea60d5aea091a990 Mon Sep 17 00:00:00 2001
> +From: Jason Andryuk <jandryuk@gmail.com>
> +Date: Sun, 14 Mar 2021 12:46:34 -0400
> +Subject: [PATCH 2/2] Increase command durations
> +
> +Wth Linux 5.4 xen-tpmfront and a Xen vtpm-stubdom, xen-tpmfront was
> +failing commands with -ETIME:
> +tpm tpm0: tpm_try_transmit: send(): error-62
> +
> +The vtpm was returning the data, but it was after the duration timeout
> +in vtpm_send.  Linux may have started being more stringent about timing?
> +
> +The vtpm-stubdom has a little delay since it writes its disk before
> +returning the response.
> +
> +Anyway, the durations are rather low.  When they were 1/10/1000 before
> +converting to microseconds, Linux showed all three durations rounded to
> +10000.  Update them with values from a physical TPM1.2.  These were
> +taken from a WEC which was software downgraded from a TPM2 to a TPM1.2.
> +They might be excessive, but I'd rather have a command succeed than
> +return -ETIME.
> +
> +An IFX physical TPM1.2 uses:
> +1000000
> +1500000
> +150000000
> +
> +Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> +---
> + tpm/tpm_data.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/tpm/tpm_data.c b/tpm/tpm_data.c
> +index bebaf10..844afca 100644
> +--- a/tpm/tpm_data.c
> ++++ b/tpm/tpm_data.c
> +@@ -71,9 +71,9 @@ static void init_timeouts(void)
> +   tpmData.permanent.data.tis_timeouts[1] = 2000000;
> +   tpmData.permanent.data.tis_timeouts[2] = 750000;
> +   tpmData.permanent.data.tis_timeouts[3] = 750000;
> +-  tpmData.permanent.data.cmd_durations[0] = 1000;
> +-  tpmData.permanent.data.cmd_durations[1] = 10000;
> +-  tpmData.permanent.data.cmd_durations[2] = 1000000;
> ++  tpmData.permanent.data.cmd_durations[0] = 3000000;
> ++  tpmData.permanent.data.cmd_durations[1] = 3000000;
> ++  tpmData.permanent.data.cmd_durations[2] = 600000000;
> + }
> + 
> + void tpm_init_data(void)
> +-- 
> +2.30.2
> +
> diff --git a/stubdom/vtpm-microsecond-duration.patch b/stubdom/vtpm-microsecond-duration.patch
> new file mode 100644
> index 0000000000..7a906e72c5
> --- /dev/null
> +++ b/stubdom/vtpm-microsecond-duration.patch
> @@ -0,0 +1,52 @@
> +From 5a510e0afd7c288e3f0fb3523ec749ba1366ad61 Mon Sep 17 00:00:00 2001
> +From: Jason Andryuk <jandryuk@gmail.com>
> +Date: Sun, 14 Mar 2021 12:42:10 -0400
> +Subject: [PATCH 1/2] Use microseconds for timeouts and durations
> +
> +The timeout and duration fields should be in microseconds according to
> +the spec.
> +
> +TPM_CAP_PROP_TIS_TIMEOUT:
> +A 4 element array of UINT32 values each denoting the timeout value in
> +microseconds for the following in this order:
> +
> +TPM_CAP_PROP_DURATION:
> +A 3 element array of UINT32 values each denoting the duration value in
> +microseconds of the duration of the three classes of commands:
> +
> +Linux will scale the timeouts up by 1000, but not the durations.  Change
> +the units for both sets as appropriate.
> +
> +Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> +---
> + tpm/tpm_data.c | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/tpm/tpm_data.c b/tpm/tpm_data.c
> +index a3a79ef..bebaf10 100644
> +--- a/tpm/tpm_data.c
> ++++ b/tpm/tpm_data.c
> +@@ -67,13 +67,13 @@ static void init_nv_storage(void)
> + static void init_timeouts(void)
> + {
> +   /* for the timeouts we use the PC platform defaults */
> +-  tpmData.permanent.data.tis_timeouts[0] = 750;
> +-  tpmData.permanent.data.tis_timeouts[1] = 2000;
> +-  tpmData.permanent.data.tis_timeouts[2] = 750;
> +-  tpmData.permanent.data.tis_timeouts[3] = 750;
> +-  tpmData.permanent.data.cmd_durations[0] = 1;
> +-  tpmData.permanent.data.cmd_durations[1] = 10;
> +-  tpmData.permanent.data.cmd_durations[2] = 1000;
> ++  tpmData.permanent.data.tis_timeouts[0] = 750000;
> ++  tpmData.permanent.data.tis_timeouts[1] = 2000000;
> ++  tpmData.permanent.data.tis_timeouts[2] = 750000;
> ++  tpmData.permanent.data.tis_timeouts[3] = 750000;
> ++  tpmData.permanent.data.cmd_durations[0] = 1000;
> ++  tpmData.permanent.data.cmd_durations[1] = 10000;
> ++  tpmData.permanent.data.cmd_durations[2] = 1000000;
> + }
> + 
> + void tpm_init_data(void)
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
> 

-- 
Samuel
Pour un père, autant mourir que de faire plein de calculs et pas s'occuper
de son fils
 -+- y sur #ens-mim - sombres histoires de zombies -+-

