Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D7A869F2B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 19:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686301.1068162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf2GC-0007d8-Tm; Tue, 27 Feb 2024 18:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686301.1068162; Tue, 27 Feb 2024 18:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf2GC-0007ba-QM; Tue, 27 Feb 2024 18:33:00 +0000
Received: by outflank-mailman (input) for mailman id 686301;
 Tue, 27 Feb 2024 18:32:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tHoq=KE=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rf2GB-0007bU-NS
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 18:32:59 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1428eea-d59e-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 19:32:58 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-412949fd224so283285e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 10:32:58 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b00411a6ce0f99sm12029549wmo.24.2024.02.27.10.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 10:32:57 -0800 (PST)
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
X-Inumbo-ID: a1428eea-d59e-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709058778; x=1709663578; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6fWIBDBkp/IOrhGUXdzpoJf5SNpN+zqrsYGJcvpSxLw=;
        b=UJt11bwYBaEZBoR4MEHLFLtiPGrvWagDyTzUTjLgcSX01kIpEjmcaPIvQV70+G1nOs
         CG39yDfArNXM2AsQ5dz8X8nlJnMxBkXrmONjgJEfRnnq/xu4sty5KBglbFClJs/+Lbpu
         612KjPSIG8CcW5vGjxexE+17qKZJX8Zox+HAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709058778; x=1709663578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fWIBDBkp/IOrhGUXdzpoJf5SNpN+zqrsYGJcvpSxLw=;
        b=JTCjxj6cAJ9XKEkZKU10ByrnjCCVhT1JH9gFrHAr3+kTZ9w8AiNCar6oOdTpgAI4mJ
         X5WmqvKmDBETLxqZ+tzY8o7+WePCzr03pcP5BkyDB/Ac7dnimr/xgh67DPQPYYaa+/iq
         J767OmOCrYeCXA1aTG6NFclAiDrnrusIMedexsVx6g9yVW7fT8B+bs8url+LL0BIvYpl
         2ktTsndLnXVDVUIpH6kFtM/BigzFc/R1eKEqZBB6eYMch3jLpqoPQltiZJS5qrJ6N4eM
         42UafyDQA5CMXbdu0rhHC4ZvSh1m1oUEu5aa3Q/TIi68VR1+efJE81vp9rM5/aVh4RH3
         NB2g==
X-Gm-Message-State: AOJu0YztmLbi1uac9glQ/JucibksznryaAmWvYhmmOV6GAQeJJ8h/HS6
	7xeAK4nqUeoZE4BJQvRizN8PXoWraJelBk6JX5vj5KoBbCoyadh150IQ/wD9dVnt2zcnjapG6HW
	b
X-Google-Smtp-Source: AGHT+IEHtPX8kRyydQMiolCNd3RZbqr3tRifZF1ZBav4F/ZeadDK0TvXLmn+/huJ05RSW3kc+PCpxA==
X-Received: by 2002:a05:600c:4f4e:b0:410:78fb:bed2 with SMTP id m14-20020a05600c4f4e00b0041078fbbed2mr152750wmq.19.1709058777781;
        Tue, 27 Feb 2024 10:32:57 -0800 (PST)
Date: Tue, 27 Feb 2024 18:32:56 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] tools/xentop: Add VBD3 support to xentop
Message-ID: <fc59e215-2aef-4e07-83df-b27a5cb79313@perard>
References: <20240227132628.2157031-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227132628.2157031-1-fouad.hilly@cloud.com>

On Tue, Feb 27, 2024 at 01:26:28PM +0000, Fouad Hilly wrote:
> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
> index cbba54aa83ee..6d82e204aad4 100644
> --- a/tools/libs/stat/xenstat_linux.c
> +++ b/tools/libs/stat/xenstat_linux.c
> @@ -390,6 +390,38 @@ void xenstat_uninit_networks(xenstat_handle * handle)
>  		fclose(priv->procnetdev);
>  }
>  
> +static int read_attributes_vbd3(char *vbd3_path, xenstat_vbd *vbd)

"const char *vbd3_path"?


>  static int read_attributes_vbd(const char *vbd_directory, const char *what, char *ret, int cap)
>  {
>  	static char file_name[80];
> @@ -438,7 +470,7 @@ int xenstat_collect_vbds(xenstat_node * node)
>  		int ret;
>  		char buf[256];
>  
> -		ret = sscanf(dp->d_name, "%3s-%u-%u", buf, &domid, &vbd.dev);
> +		ret = sscanf(dp->d_name, "%255[^-]-%u-%u", buf, &domid, &vbd.dev);

255 is overly ambitious, but it match the size of buf, so I guess it's
kind of ok, even if unnecessary.

>  		if (ret != 3)
>  			continue;
>  		if (!(strstr(buf, "vbd")) && !(strstr(buf, "tap")))
> @@ -448,6 +480,8 @@ int xenstat_collect_vbds(xenstat_node * node)
>  			vbd.back_type = 1;
>  		else if (strcmp(buf,"tap") == 0)
>  			vbd.back_type = 2;
> +		else if (strcmp(buf,"vbd3") == 0)
> +			vbd.back_type = 3;

Yay for magic number... Do you think you could introduce an enum or
define to replace this "3" by a meaningful? Maybe something like
XENSTAT_VBD_TYPE_VBD3, (name derived from the existing function
xenstat_vbd_type()).

I'd like at least to replace the "3". But if you feel like having
another patch to replace the "2" and "1", that would be a plus.

>  		else
>  			vbd.back_type = 0;
>  
> @@ -479,6 +513,35 @@ int xenstat_collect_vbds(xenstat_node * node)
>  				vbd.error = 1;
>  			}
>  		}
> +		else if (vbd.back_type == 3)
> +		{
> +			char *td3_pid;
> +			char *path;
> +
> +			vbd.back_type = 3;

`back_type` should already be 3 ;-).

> +			vbd.error = 0;
> +
> +			if (asprintf(&path, "/local/domain/0/backend/vbd3/%u/%u/kthread-pid", domid, vbd.dev) < 0)
> +				continue;
> +
> +			td3_pid = xs_read(node->handle->xshandle, XBT_NULL, path, NULL);
> +
> +			free(path);
> +
> +			if (td3_pid == NULL)
> +				continue;
> +
> +			if (asprintf(&path, "/dev/shm/td3-%s/vbd-%u-%u", td3_pid, domid, vbd.dev) < 0) {
> +				free(td3_pid);
> +				continue;
> +			}
> +
> +			if (read_attributes_vbd3(path, &vbd) < 0)
> +				vbd.error = 1;

Why sometime we do "continue" and sometime we do "vbd.error=1"?

> +
> +			free(td3_pid);
> +			free(path);
> +		}
>  		else
>  		{
>  			vbd.error = 1;
> diff --git a/tools/libs/stat/xenstat_priv.h b/tools/libs/stat/xenstat_priv.h
> index 4eb44a8ebb84..c3a9635240e9 100644
> --- a/tools/libs/stat/xenstat_priv.h
> +++ b/tools/libs/stat/xenstat_priv.h
> @@ -98,6 +98,22 @@ struct xenstat_vbd {
>  	unsigned long long wr_sects;
>  };
>  
> +struct vbd3_stats {
> +	uint32_t version;
> +	uint32_t __pad;
> +	uint64_t oo_reqs;
> +	uint64_t read_reqs_submitted;
> +	uint64_t read_reqs_completed;
> +	uint64_t read_sectors;
> +	uint64_t read_total_ticks;
> +	uint64_t write_reqs_submitted;
> +	uint64_t write_reqs_completed;
> +	uint64_t write_sectors;
> +	uint64_t write_total_ticks;
> +	uint64_t io_errors;
> +	uint64_t flags;
> +};

Is that a binary interface for an external project? I'm asking because
`__pad` would seems useless otherwise.
If it is part of an interface, please add a comment about it, add a link
to the project/source where this interface is described, and where is
the canonical location? Also, is there an header we could maybe just
use if it's in the system or an header we could import into the
repository?

Thanks,

-- 
Anthony PERARD

