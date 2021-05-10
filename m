Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 878A3378D10
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 15:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125266.235774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg698-0003mO-On; Mon, 10 May 2021 13:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125266.235774; Mon, 10 May 2021 13:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg698-0003jD-Lg; Mon, 10 May 2021 13:40:30 +0000
Received: by outflank-mailman (input) for mailman id 125266;
 Mon, 10 May 2021 13:40:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MfTK=KF=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1lg696-0003j7-8v
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 13:40:28 +0000
Received: from mail-qt1-x836.google.com (unknown [2607:f8b0:4864:20::836])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c1d1e76-19ed-4066-bcf8-96a2905e6204;
 Mon, 10 May 2021 13:40:26 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id c10so2075590qtx.10
 for <xen-devel@lists.xenproject.org>; Mon, 10 May 2021 06:40:26 -0700 (PDT)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2])
 by smtp.gmail.com with ESMTPSA id e17sm11330734qto.59.2021.05.10.06.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 06:40:25 -0700 (PDT)
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
X-Inumbo-ID: 9c1d1e76-19ed-4066-bcf8-96a2905e6204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+w/N0fe4Cjk6fuxLse5gEZAT5DIwD13ZOaNCIfvDMSg=;
        b=GE60DNx4pDQHy5yvaQSBo4gyVY4PAPF9YGb2BUzdWky7j7oTww96aUWvxv46R3nsQi
         V4GdoCcI5s5r+aew7vJ63xrH/f+UNdgcz5x32/lK/bUkL02kiNaLUwnTNw6bPihovaEP
         W9izkqXQANHR5GeuJ0i+AIy6+DYo2hfqbVAKfWiXUrzs+b/6wXcH8hU0OMWDtIByi1Y0
         LL+OgWvfyIN2x2w2McXW5fdh4OMklLYlccisk0UbwUbJw5mEGlkG2u79sP2a/2LKczA8
         wXCkinkOaULqQYg3wAhsjS7yzxwHUte27C2y+C9qbZEjGtARvofYL4yNpeiLspVzGlGp
         ZGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+w/N0fe4Cjk6fuxLse5gEZAT5DIwD13ZOaNCIfvDMSg=;
        b=NkjEm9yUZERMgD3rAiZewx2wPVTehLSZWXuIAga9w+ehoJwArzGSWXBuRsj238A1iW
         XdQu3lHY7hE3128R/NyUOvYJZCRQSc3xP2pybuaZVb45IEorN3c/xWucQja+Hs+jT0O9
         vmn3WzGE240Z2ufSrHS24mOv0Vb3LvXnvD+1aAp/xQwcIY8sTZbYM0nkPLu9EJIJTVc0
         yGVtyTnaVY8BX1qnP5KOAttGFAOM3po4Y5BI+Tqdvq95iV8DEZc2jWj+zt/y6YbdqOBL
         THIoKIQ048W/J64U6iUORhlEBomUszgwF0E7qUUF1HuGFJOO/VSc6pEOU9T7ZK6duUQs
         iz7g==
X-Gm-Message-State: AOAM531L9IDoBsNu3yP8bWjA99Yi9lnhDZD2oxOCgd3ypcf2xFsbITRJ
	L7OwOPPIplNZCkTWlMRiRZk=
X-Google-Smtp-Source: ABdhPJx9W1tP149bkYJ77Gxvg/V6dP0u++FiwDmmsccLZ/7oRghMtTGeryIhkZns3NLa5z0McfbV/w==
X-Received: by 2002:a05:622a:11c8:: with SMTP id n8mr21253029qtk.279.1620654026378;
        Mon, 10 May 2021 06:40:26 -0700 (PDT)
Subject: Re: [PATCH v2 13/13] vtpm: Correct timeout units and command duration
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-14-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Message-ID: <e0658f24-5646-c145-c232-dbccd86cb064@gmail.com>
Date: Mon, 10 May 2021 09:40:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210506135923.161427-14-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/6/21 9:59 AM, Jason Andryuk wrote:
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
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

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
> 


