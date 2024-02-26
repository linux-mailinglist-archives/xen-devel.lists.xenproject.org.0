Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C5786781C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 15:23:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685564.1066471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rebsV-00088F-D7; Mon, 26 Feb 2024 14:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685564.1066471; Mon, 26 Feb 2024 14:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rebsV-00086B-AB; Mon, 26 Feb 2024 14:22:47 +0000
Received: by outflank-mailman (input) for mailman id 685564;
 Mon, 26 Feb 2024 14:22:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rebsT-00085k-89
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 14:22:45 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 810fbf38-d4b2-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 15:22:43 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-565a3910f86so2917582a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 06:22:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ds2-20020a0564021cc200b005644221a3desm2427671edb.3.2024.02.26.06.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 06:22:41 -0800 (PST)
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
X-Inumbo-ID: 810fbf38-d4b2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708957362; x=1709562162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzmLMSoqyq0ghO6dm13h0DHUVXokODno9z9BT+KWu24=;
        b=NWuv7ZLS/Dj6rPaBBRdqjUn6s2wNs/wbEyA70qshRfCRsXLfMwnc11Smh1VjtSYgYM
         fRgoL5dVHYN8lMrkd8m+UirUL8Nf6tZ1qHvFx5T7yJAZ9+AovsjQfiGnMMj+Eeta+Hu0
         iECqRrzw3/gTXHBIItYaqR6s/tQc6cwJZnn65mpeJh5JJAcwPQ/862IFssEYnasADYGo
         vCIoqNPHysffUe3QRHIMV9KoiNsb7tMSH8IACy9in6RU9UExVK7m2jcCxwL7IFinHDjA
         1qK7iV0C8IONLuPxAR670NEI3Bv3tIvMZhP0s5LRUO9EY1oFSN/KuK6tNZRNEe/n1fWJ
         ybIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708957363; x=1709562163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzmLMSoqyq0ghO6dm13h0DHUVXokODno9z9BT+KWu24=;
        b=uezvyr1SdrAghWV2u1PkkXZGVg7tB6ZPGSjjmN9ZRS7uCZHSxMFBw+jf4xg82zmUR1
         KsecO9U1weFg0CuYP/Oy/LAZtoAZBRUFgRP1BlFrFNDglLoqqOknyHp/sH9+sF74nnNU
         RtLsbVDY1MUvy/ql7wuRgTzbIGF8/AQ6tjR+npNvgiVLUPPUrI9HWZHsA5iIFSFt/DvR
         ip0CZ9DDc+XLPPMh0cTVkspGjPn3hJ87bpGiAhPARlW14EainVMWNLfTH59cqu7qReMa
         lGtPaKxkmdV2rAaTBBjb8zNQlvRJKAUzD/iQt/14WgYm0SJlN+3MoIgQUkINgwNyq3KC
         xXFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXnN5PVW+yP1SjSfsGCyGKcyRXdK5lZrAP3zKns1PFMbiyFYjstI1U+IiDrBgvqe16huZu9jQjRh0rWuOxCg2IFo9LCgz+yoc+z2wJDt8=
X-Gm-Message-State: AOJu0YwVwLxj8i4gZB7zx7QZiyTPSIlH4Ndp0U9zEM+qDQG5SuH/DTeL
	6cdCig86lq4sdgC0xdo5aelXE8vVyZcgqNPy8yjdpmgwMTPS+Jydx7/F3g3EWQ==
X-Google-Smtp-Source: AGHT+IEgIv8Pa4H43yAeQkzvGskGLPhUvNljA//VLZFovPGlViWWCnn1SbbmhJokUAjRpaLIp9+XuA==
X-Received: by 2002:aa7:d5d5:0:b0:564:3392:e9db with SMTP id d21-20020aa7d5d5000000b005643392e9dbmr4353551eds.33.1708957362611;
        Mon, 26 Feb 2024 06:22:42 -0800 (PST)
Message-ID: <9468ccd8-44c3-4b50-b200-5a4ae1cca8ff@suse.com>
Date: Mon, 26 Feb 2024 15:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xentop: Add VBD3 support to xentop
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240226141211.1416866-1-fouad.hilly@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240226141211.1416866-1-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 15:12, Fouad Hilly wrote:
> From: Pritha Srivastava <pritha.srivastava@citrix.com>
> 
> xl now knows how to drive tapdisk, so modified libxenstat to
> understand vbd3 statistics.
> 
> Signed-off-by: Jorge Martin <jorge.martin@citrix.com>
> Signed-off-by: Pritha Srivastava <pritha.srivastava@citrix.com>

Just a formal question (I'm not really qualified to review this change):
With the above two S-o-b and the earlier From: - who is the original
author of this patch? The general expectation is for the 1st S-o-b to
be the author's.

Jan

> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> ---
>  tools/libs/stat/xenstat_linux.c | 69 ++++++++++++++++++++++++++++++++-
>  tools/libs/stat/xenstat_priv.h  | 16 ++++++++
>  tools/xentop/xentop.c           |  1 +
>  3 files changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
> index cbba54aa83ee..5a4a03634182 100644
> --- a/tools/libs/stat/xenstat_linux.c
> +++ b/tools/libs/stat/xenstat_linux.c
> @@ -390,6 +390,39 @@ void xenstat_uninit_networks(xenstat_handle * handle)
>  		fclose(priv->procnetdev);
>  }
>  
> +static int read_attributes_vbd3(char *vbd3_path, xenstat_vbd *vbd)
> +{
> +	FILE *fp;
> +	struct vbd3_stats vbd3_stats;
> +
> +	fp = fopen(vbd3_path, "rb");
> +
> +	if (fp == NULL)
> +	{
> +		return -1;
> +	}
> +
> +	if (fread(&vbd3_stats, sizeof(struct vbd3_stats), 1, fp) != 1) {
> +		fclose(fp);
> +		return -1;
> +	}
> +
> +	if (vbd3_stats.version != 1) {
> +		fclose(fp);
> +		return -1;
> +	}
> +
> +	vbd->oo_reqs = vbd3_stats.oo_reqs;
> +	vbd->rd_reqs = vbd3_stats.read_reqs_submitted;
> +	vbd->rd_sects = vbd3_stats.read_sectors;
> +	vbd->wr_reqs = vbd3_stats.write_reqs_submitted;
> +	vbd->wr_sects = vbd3_stats.write_sectors;
> +
> +	fclose(fp);
> +
> +	return 0;
> +}
> +
>  static int read_attributes_vbd(const char *vbd_directory, const char *what, char *ret, int cap)
>  {
>  	static char file_name[80];
> @@ -438,7 +471,7 @@ int xenstat_collect_vbds(xenstat_node * node)
>  		int ret;
>  		char buf[256];
>  
> -		ret = sscanf(dp->d_name, "%3s-%u-%u", buf, &domid, &vbd.dev);
> +		ret = sscanf(dp->d_name, "%255[^-]-%u-%u", buf, &domid, &vbd.dev);
>  		if (ret != 3)
>  			continue;
>  		if (!(strstr(buf, "vbd")) && !(strstr(buf, "tap")))
> @@ -448,6 +481,8 @@ int xenstat_collect_vbds(xenstat_node * node)
>  			vbd.back_type = 1;
>  		else if (strcmp(buf,"tap") == 0)
>  			vbd.back_type = 2;
> +		else if (strcmp(buf,"vbd3") == 0)
> +			vbd.back_type = 3;
>  		else
>  			vbd.back_type = 0;
>  
> @@ -479,6 +514,38 @@ int xenstat_collect_vbds(xenstat_node * node)
>  				vbd.error = 1;
>  			}
>  		}
> +		else if (vbd.back_type == 3)
> +		{
> +
> +			char *td3_pid;
> +			char *path;
> +
> +			vbd.back_type = 3;
> +			vbd.error = 0;
> +
> +			if (asprintf(&path, "/local/domain/0/backend/vbd3/%u/%u/kthread-pid", domid, vbd.dev) < 0)
> +				continue;
> +
> +			td3_pid = xs_read(node->handle->xshandle, XBT_NULL, path, NULL);
> +
> +			if (td3_pid == NULL) {
> +				free(path);
> +				continue;
> +			}
> +
> +			free(path);
> +
> +			if (asprintf(&path, "/dev/shm/td3-%s/vbd-%u-%u", td3_pid, domid, vbd.dev) < 0) {
> +				free(td3_pid);
> +				continue;
> +			}
> +
> +			if (read_attributes_vbd3(path, &vbd) < 0)
> +				vbd.error = 1;
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
> +
>  extern int xenstat_collect_networks(xenstat_node * node);
>  extern void xenstat_uninit_networks(xenstat_handle * handle);
>  extern int xenstat_collect_vbds(xenstat_node * node);
> diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
> index 0a2fab7f15a3..f5a456fd4dfd 100644
> --- a/tools/xentop/xentop.c
> +++ b/tools/xentop/xentop.c
> @@ -1124,6 +1124,7 @@ void do_vbd(xenstat_domain *domain)
>  		"Unidentified",           /* number 0 */
>  		"BlkBack",           /* number 1 */
>  		"BlkTap",            /* number 2 */
> +		"Tapdisk3"           /* number 3 */
>  	};
>  
>  	num_vbds = xenstat_domain_num_vbds(domain);


