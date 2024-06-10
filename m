Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A515D9026D3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 18:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737460.1143783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhzZ-0002iL-1I; Mon, 10 Jun 2024 16:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737460.1143783; Mon, 10 Jun 2024 16:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhzY-0002gM-UQ; Mon, 10 Jun 2024 16:35:32 +0000
Received: by outflank-mailman (input) for mailman id 737460;
 Mon, 10 Jun 2024 16:35:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OhkP=NM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sGhzX-0002fx-8t
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 16:35:31 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72b5b869-2747-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 18:35:29 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ebd95f136bso1419821fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 09:35:29 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c71885170sm4080400a12.2.2024.06.10.09.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 09:35:28 -0700 (PDT)
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
X-Inumbo-ID: 72b5b869-2747-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718037329; x=1718642129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NCZM3ue1C5jtbs037YDqPxE+Szl/qajvIkmTEBbSwnE=;
        b=OIZ4ydt2vbvperIRsOknXV49Zm3BCu+O5tWRn7BVTZL7jhvAzvtb1TcU2Q/Hog00j3
         H4OXA1H0N+Qps1OorTA+jtHbQHUOBYocxXoJpy/xqoGs67VpeqCgpv+44LTyx1i9CRsM
         c96qjDObHzBV6bAMR4h7hYBIEOIyqOGiAwPJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718037329; x=1718642129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCZM3ue1C5jtbs037YDqPxE+Szl/qajvIkmTEBbSwnE=;
        b=i3RWdtEncO81zB/NrjU8USmdWShVa8wd680CxXv+gchrM4d394xhnPlKLB7xWYV2m2
         VgWh3u/MDhZs11kL3905NSD8PehCEnfhrx3/keWS2jDbvYXQ3KCRZYMgIrgSYmDGMiaB
         aDsAqQ9127K3LYVgvlbJ5RIh0eHy1EU0odfxf3qMffJ0vDXGEqDHUdBPOVL6g+jJwnP2
         3E2o3IUF9HhHwsxUubqKGkQwN+B+xzuUgjxAhTTtOinBGba5MVaaLzb0tt3bY6/9NRhO
         ZS2wSPF+IH9KAXcJSe12rytKyNB9IXA6yORFPDbklILrYdbNSlNei0wpvcKMwRbpZAJR
         N0EA==
X-Forwarded-Encrypted: i=1; AJvYcCUKgQoGL8dgKbYcGdZTR0WH6/uOlDRDyaixq8hcN7EbXxVKuIqFzDHZsl34GhIft4lGjQ2lbsx7qG57BTaC6yjAEPwlnBjctPn5skTgz94=
X-Gm-Message-State: AOJu0YzyWVjdYrlQqSDAPBjzo4skz8JwIzNKhARLSfyCbABozCSmvXEi
	nLNl9htH7YuFwmhgQId7KGIXfPweU4qyzzvm7EKyID5FC+FPlTp+Dnc0CUkAlZI=
X-Google-Smtp-Source: AGHT+IFqrzWFifI6gn01+bvvf3cEa5rqFIdVvKQgZL0ctW1EzjgiwrKlw5S3/smCaExwp07elO/EIw==
X-Received: by 2002:a2e:8e88:0:b0:2eb:cdae:6791 with SMTP id 38308e7fff4ca-2ebcdae691bmr36605701fa.45.1718037328677;
        Mon, 10 Jun 2024 09:35:28 -0700 (PDT)
Message-ID: <d3f5e8a0-ee98-4574-95ac-2fd315ee9a45@citrix.com>
Date: Mon, 10 Jun 2024 17:35:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] x86/intel: optional build of TSX support
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240606110448.2540261-1-Sergiy_Kibrik@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240606110448.2540261-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/06/2024 12:04 pm, Sergiy Kibrik wrote:
> Transactional Synchronization Extensions are available for certain Intel's
> CPUs only, hence can be put under CONFIG_INTEL build option.

Careful with "available" vs "supported".

They're only supported on certain Intel CPUs, but suffice it to say that
c0dd53b8cb was discovered because of Xen's TSX unit testing.

>
> The whole TSX support, even if supported by CPU, may need to be disabled via
> options, by microcode or through spec-ctrl, depending on a set of specific
> conditions. To make sure nothing gets accidentally rutime-broken all

runtime

> modifications of global TSX configuration variables is secured by #ifdef's,
> while variables themselves redefined to 0, so that ones can't mistakenly be
> written to.
>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  xen/arch/x86/Makefile                | 2 +-
>  xen/arch/x86/include/asm/processor.h | 8 ++++++++
>  xen/arch/x86/spec_ctrl.c             | 4 ++++
>  3 files changed, 13 insertions(+), 1 deletion(-)

This needs a command line adjustment too.

diff --git a/docs/misc/xen-command-line.pandoc
b/docs/misc/xen-command-line.pandoc
index 1dea7431fab6..c8d32c13bbaa 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2584,10 +2584,11 @@ pages) must also be specified via the tbuf_size
parameter.
 ### tsx
     = <bool>
 
-    Applicability: x86
+    Applicability: x86 with CONFIG_INTEL active
     Default: false on parts vulnerable to TAA, true otherwise
 
-Controls for the use of Transactional Synchronization eXtensions.
+Controls for the use of Transactional Synchronization eXtensions,
available if
+Xen was compiled with `CONFIG_INTEL` active.
 
 Several microcode updates are relevant:
 


> diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
> index c26ef9090c..8b12627ab0 100644
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -503,9 +503,17 @@ static inline uint8_t get_cpu_family(uint32_t raw, uint8_t *model,
>      return fam;
>  }
>  
> +#ifdef CONFIG_INTEL
>  extern int8_t opt_tsx;
>  extern bool rtm_disabled;
>  void tsx_init(void);
> +#else
> +#define opt_tsx      0     /* explicitly indicate TSX is off */
> +#define rtm_disabled false /* RTM was not force-disabled */
> +static inline void tsx_init(void)
> +{
> +}

For trivial things like this, we allow

static inline void tsx_init(void) {}

All can be fixed on commit, but none of this is tagged for 4.19 and is
4.20 material IMO.

~Andrew

