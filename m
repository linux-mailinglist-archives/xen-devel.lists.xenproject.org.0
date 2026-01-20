Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5BDD3C0C4
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 08:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208433.1520592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi6Q3-0002Fr-KQ; Tue, 20 Jan 2026 07:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208433.1520592; Tue, 20 Jan 2026 07:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi6Q3-0002EG-GW; Tue, 20 Jan 2026 07:44:55 +0000
Received: by outflank-mailman (input) for mailman id 1208433;
 Tue, 20 Jan 2026 07:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vi6Q2-0002EA-OG
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 07:44:54 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7b66342-f5d3-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 08:44:52 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so4264783f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 23:44:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569922032sm29098015f8f.8.2026.01.19.23.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 23:44:51 -0800 (PST)
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
X-Inumbo-ID: e7b66342-f5d3-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768895092; x=1769499892; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PzVQEOmqsd/5MICjHZcd3xDgzx/ha6IBOhbYlgwGARI=;
        b=RiGZCrp4cjlSkXsudwyHBOmICPfNA97w84ptsk+NmWDQQid2WSzPDGkI6/ywxXhc8c
         ZVfXw4Gw44PCeNmZWafERSIxjX04Mm1GyoFgonDY6h1vv2HguG5AjILo90B5afC/7jPw
         9eCkqS5JsAIfQUbpwMMLPFayKBOfjzfmYATHpp6H8933/vcTviWHUWpCBzZcAVpm9YvH
         xoUCUFz9B88clOQZ7ms3roJzll9Immv/KF37StXrSTIC2mFJXToqKHyjTuLoI1yoYsMz
         RDhAs+6uuCNGIRlEASQP2An0m0PXa7cTT9A05+gd5CRXoCAxBMhdQ8dsMmly1C6kqite
         7Rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768895092; x=1769499892;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzVQEOmqsd/5MICjHZcd3xDgzx/ha6IBOhbYlgwGARI=;
        b=DZ9CC0NCfO6djM95j2I3MDUnB+/eJGox3e/O54OGOBrex3qcX2CpCHWr99outoEsm4
         Z5cfWNIf9sWoaSjFPkV+wmiCZgBSua1ih2Z3NM3f8exL5MYHdT4SnYSEVyPNnGiiZALR
         u36xcjcrJt25esZJrWXd/zWnwTlltKFALYq1PTdliDMg/xisnufgyGHUzvo020zVEUuR
         1QpiMl6afaZKyvrgDOUeyafhm9ffqPrX1hrq+J74vTEPD/tuR4o+6lRMYEL2NYeQkjcl
         P07JzQs9BAdquymBggaTk95uHMFVuuX48dNTQuYBSGJMCZrzviXVfzMICh5euUbGI50f
         3A2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQQoFPe/jPqK8sRgRpdh649wFPHMJqifMHAPfp9wCMdn0VpSIgwCixo8AwW16IikY6sJe9S9xL3DI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVSOMasx3nwe0kn6WhhP5L5oqAu7jkW+0x2z6OItgjWDsX85O7
	FB3x1pW/Us9J298bbhv0PsJwvfpCdhDfEMd7Iqt9CPnK0QqypBJcrWEluO+i31Xq+A==
X-Gm-Gg: AZuq6aIHsoMBUvguAS6f0uBUolHVb8gNfFqDJNin8DEj3C9P+bc3OfLyQHGQ8V/jNjh
	xmpanmF3IOVrp0VGPoAQjtHcegBfTSGPDOF1VhIsufDkM3+LR37S/OMe0mh0zcIrEDx5T2xocRw
	PaCBXSZxc5iw0QBRQKL17WqB6X1O9TnqZ2oUPfmRy14/6qggMdgoWME1epD85wkbIvsJ/XgfEMg
	yvBGpaEVDM1rxnXWTK43+KilJJPSYoOyo5FEprUI/xd4QZImJjHHSjMD/XB3jAqvS5LSYp/Gtgs
	dpymoG4BmO7+FLjcDO/Ve8FT20EorGWWEysdKs+0Eg1rAfPdAFbgpGBhOV4EAmHGVp0ghPdQqI8
	u+SZLSaMF6qcCMTt87s4i6B5tN0qN4BWtXXuYuDwQplGnwQOQkVR0I2dsgRaCvNDBX2UUOkdn0D
	JMn76DpDipyaWdjq6bEdXwHlje4DSFqtuChIHEde3raSDosizcaJf1IrNgjC8Nqg2n9s5F4ntl3
	nr9snrogMalBA==
X-Received: by 2002:a05:6000:2303:b0:431:3a5:d9b8 with SMTP id ffacd0b85a97d-4358ff31af2mr1391230f8f.52.1768895091892;
        Mon, 19 Jan 2026 23:44:51 -0800 (PST)
Message-ID: <d8f28714-f406-4b2c-ba75-babd728c0b00@suse.com>
Date: Tue, 20 Jan 2026 08:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] INSTALL: remove unsupported XEN_CONFIG_EXPERT from
 documentation
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260120071654.640873-3-dmukhin@ford.com>
Content-Language: en-US
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
In-Reply-To: <20260120071654.640873-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.01.2026 08:16, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Remove XEN_CONFIG_EXPERT explanation and also correct information in
> the entire "Xen Hypervisor" section.
> 
> Amends: 37339ba9ef46 ("automation: Remove XEN_CONFIG_EXPERT leftovers")
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> --- a/INSTALL
> +++ b/INSTALL
> @@ -25,19 +25,12 @@ Xen Hypervisor
>  Xen itself is configured via a `kconfig' system borrowed from Linux.
>  See https://www.kernel.org/doc/html/v5.4/kbuild/.
>  
> -Note that unlike with Linux, and contrary to that document, you cannot
> -look at Kconfig files, or the default or generated config files etc.,
> -to find available configuration options.  This is because it is only
> -supported (and security supported) by the Xen Project, to change a
> -small subset of the options.  Attempts to change other options will be
> -silently overridden.  The only way to find which configuration options
> -are available is to run `make menuconfig' or the like.
> -
> -You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
> -in your environment.  However, doing this is not supported and the
> -resulting configurations do not receive security support.  If you set
> -this variable there is nothing stopping you setting dangerously
> -experimental combinations of features - not even any warnings.
> +Only a subset of options is supported or security-supported by Xen
> +Project. You can explore all available options, including unsupported
> +ones and those recommended only for expert users, by using `make

"..., e.g. by using ..."

> +menuconfig` and enabling `CONFIG_UNSUPPORTED` and/or `CONFIG_EXPERT`.
> +However, enabling these options is not supported, and configurations
> +resulting from them do not receive security support.
>  
>  Options recognized by configure
>  ===============================

Jan

