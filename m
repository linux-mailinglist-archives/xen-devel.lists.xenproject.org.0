Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19E9A1053C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871174.1282213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXf0J-0000VU-4Y; Tue, 14 Jan 2025 11:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871174.1282213; Tue, 14 Jan 2025 11:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXf0J-0000TH-1K; Tue, 14 Jan 2025 11:22:39 +0000
Received: by outflank-mailman (input) for mailman id 871174;
 Tue, 14 Jan 2025 11:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXf0H-0000TB-L2
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:22:37 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da9fc228-d269-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 12:22:35 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ab2e308a99bso168838766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:22:35 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90dc101sm626226466b.56.2025.01.14.03.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 03:22:34 -0800 (PST)
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
X-Inumbo-ID: da9fc228-d269-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736853755; x=1737458555; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FxKEzOyq7fH9j9gjempFM9FMHkugp5rbaXRrEYvWN7M=;
        b=I9jrjgf4IiBdszO8PV0Uf0E01acPEB8d1Wg98FCu+6HBfF79msLEoEQB7U9z9zPvXj
         Az7LNmCEzuUJmbJZ6jDlNeoxo0DgR3jKQKqHYn/jB6yaBz3UtvLyEyUVfSDT5XDLG0sr
         bzAWsynX9lqdkNOjS122MVfhUjKvYkZIsAtx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736853755; x=1737458555;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FxKEzOyq7fH9j9gjempFM9FMHkugp5rbaXRrEYvWN7M=;
        b=EfUIiXMl7vEKLuq0aCFttGTWom1XoNRI9pFTEHdaK1FVWasnf3T8xbectbjvYFGVxy
         JDjVp8sYmhpN+BF0qiuDgRl0ByNKv234d+to8P3TmpP3DSJP+gO6vlf0nhMcbVCqWxQN
         UVgpsxzrklVPu3RW1Vx1TsoTdHew4B9RxgtGYIWRm6IPunpgQZ1ZLne26+6weJtl3TY5
         eOTkolD/DfNi36aeUvEY6GKOzsxEbiQeLUnoDZaA+I6GwE5fK9xXqSWB1F2KwIMQXhKV
         nViuk441HgX51TbloIU5D0n0mnpwJo5isb5xSO7K0wwu7nZDwi7sBOtK5pgeLS4QOPVP
         HHxw==
X-Gm-Message-State: AOJu0Yx74k5HLaR3HbZZc7qxqWl7B8ZR5+NJbu8puE6tzOldkYG5gMRT
	5IHfNNs6ZObjgw7VOJPscN0WlntXyC3MiFrSWRj7YtbbUu6sNQZtNRW3Jf55CTw=
X-Gm-Gg: ASbGncs0vSKu6AuyFWeYIRBRktwxf1EqAEkaY4IOC6ShKXmtfEvivTFEGrXdqfKN074
	XlEVOMMB0lzV48ec7xJlhARt0gsBax7PJLke/GKyZsVbbJ9bANgvM0MgWL9AbRH2W3NDXXhAhuO
	zArkV2jL67gpKl6MgBXPLAjfgvt9ACj+2CJpYzkwVDius2mtfoBGHbdWbTOEutcqc7uegMCAsjU
	+T9p2HvP0TEhRGquuKfJuDBsKuSPfgAylT3ksuoXibImtvvvp2ySKLUShoT7KLHJlc=
X-Google-Smtp-Source: AGHT+IFWKgjRDgw1t2mS1L7ifjdj2QNq0C8y5537bY6dJes6JuS8xQP2NyTD8i147GlkFaFxXlREdg==
X-Received: by 2002:a17:907:1c23:b0:aa6:9d09:b17b with SMTP id a640c23a62f3a-ab2c3daffc0mr1615711366b.28.1736853754887;
        Tue, 14 Jan 2025 03:22:34 -0800 (PST)
Date: Tue, 14 Jan 2025 12:22:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] automation/eclair: make Misra rule 20.7 blocking
 for x86 also
Message-ID: <Z4ZI-WfUv73iQLI1@macbook.local>
References: <20241126093508.6966-1-roger.pau@citrix.com>
 <20241126093508.6966-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126093508.6966-3-roger.pau@citrix.com>

Hello Oleksii,

This is in principle ready to go in now (I'm currently running a
private Eclair scan to ensure the patch is still OK against current
staging).  I would like to ask for a release Ack.

Thanks, Roger.

On Tue, Nov 26, 2024 at 10:35:08AM +0100, Roger Pau Monne wrote:
> There are no violations left, make the rule globally blocking for both x86 and
> ARM.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 755ea3271fc9..cb4e233e838d 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -80,6 +80,7 @@ MC3R1.R20.2||
>  MC3R1.R20.3||
>  MC3R1.R20.4||
>  MC3R1.R20.6||
> +MC3R1.R20.7||
>  MC3R1.R20.9||
>  MC3R1.R20.11||
>  MC3R1.R20.12||
> @@ -116,7 +117,7 @@ if(string_equal(target,"x86_64"),
>  )
>  
>  if(string_equal(target,"arm64"),
> -    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
> +    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6"})
>  )
>  
>  -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
> -- 
> 2.46.0
> 

