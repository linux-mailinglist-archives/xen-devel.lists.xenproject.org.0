Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97518716A3A
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 18:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541299.843912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q42gl-0002di-Jp; Tue, 30 May 2023 16:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541299.843912; Tue, 30 May 2023 16:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q42gl-0002aZ-HB; Tue, 30 May 2023 16:59:15 +0000
Received: by outflank-mailman (input) for mailman id 541299;
 Tue, 30 May 2023 16:59:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXld=BT=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1q42gk-0001RD-CG
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 16:59:14 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d996c34-ff0b-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 18:59:13 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-64d2a613ec4so3447367b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 09:59:13 -0700 (PDT)
Received: from localhost (ec2-52-9-159-93.us-west-1.compute.amazonaws.com.
 [52.9.159.93]) by smtp.gmail.com with ESMTPSA id
 g16-20020a62e310000000b0064d74808738sm1802929pfh.214.2023.05.30.09.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 09:59:12 -0700 (PDT)
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
X-Inumbo-ID: 4d996c34-ff0b-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685465952; x=1688057952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LxaOtFfyQxSP90cwtzAnyMXl6U0rfymyfizE43djznw=;
        b=V2yt9sTyIPblISEiz+C8LF8cLyHIhxJK7OmFpU8Ep64dQH4d1+wJQW4/JUpNCpVUBG
         Uucq92Zm6BiS4tHpcFgts7ZJKRiKv+bww7NUaFKfA+b43HnXuW3+Yf/Cp1dS2oBJODxA
         FtQO+yVS45JdW2EU55FmKqLXoNhX+SoRqS25PVI0PngiG4rsYa3YZJPmYh5RZ63Pioq4
         0Irln+0nAX0hI6+wMtVy6YqDazMK4KfgGf9InaU1HtjU+aHpynx+5Felsc37BBFyI56U
         FpL8x1zRno5A7wK138xtdz4/GM+3G6rL6wz7yVM5FeOmO4sNNkLXa/iR3koTs6C+t8ne
         fkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685465952; x=1688057952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxaOtFfyQxSP90cwtzAnyMXl6U0rfymyfizE43djznw=;
        b=ksOZ5j/HGQ/vo/+2jPHeinrsLjcbc8xc/PVWacJg1ym4SmpMJocQkPbaLrm0VJ0HMB
         PosBX+odbRggmGOjbZt2NZfZ/mR9gDNLsnW3IOkrS9mxmZHsbBpsi0nKPGjFIIJaZaLt
         SICI70mD7ELgMWaxfP0qs6WYi9fUPZlwToFWbH2/Y0qw2BwCLInwq18yox48HlcQk3D/
         hZBFoXzYhXxg/p1OBbIJ/qruuj9Nrpa6NXMrtyGDfTh2IWVR6mlU5yOZa6baA8Gd8JmT
         3Gc5mO0QHxJRMO44xsK4G/zSHVQTR0sY6wKFsx/14AU8MTUhvUAueCdJXQP08D3YrXyR
         dLlg==
X-Gm-Message-State: AC+VfDyXYGnRFhBf4MZLMZV7OAQIV3xLouf9Lb478LfWKb5GkHPo+VL9
	vrXXuSUGyYJ09vHa4RBTkX9Bt13ODUbJ2gem
X-Google-Smtp-Source: ACHHUZ6YPzRF8ZyrWGjM4QgmvXHdoHIA3OtNf8Rdiz6lNZpZSNfAMi33LK5XppLPYrOBdhHMX5bq/A==
X-Received: by 2002:a05:6a20:2447:b0:111:ee3b:59b1 with SMTP id t7-20020a056a20244700b00111ee3b59b1mr3878681pzc.2.1685465952344;
        Tue, 30 May 2023 09:59:12 -0700 (PDT)
Date: Tue, 30 May 2023 09:59:15 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v9 3/5] xen/riscv: align __bss_start
Message-ID: <ZHXI8/86ibhq8FRl@bullseye>
References: <cover.1685027257.git.oleksii.kurochko@gmail.com>
 <1158df1cde660e817c4f6d6e0a46ef22bd92dc04.1685027257.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1158df1cde660e817c4f6d6e0a46ef22bd92dc04.1685027257.git.oleksii.kurochko@gmail.com>

On Thu, May 25, 2023 at 06:28:16PM +0300, Oleksii Kurochko wrote:
> bss clear cycle requires proper alignment of __bss_start.
> 
> ALIGN(PAGE_SIZE) before "*(.bss.page_aligned)" in xen.lds.S
> was removed as any contribution to "*(.bss.page_aligned)" have to
> specify proper aligntment themselves.
> 
> Fixes: cfa0409f7cbb ("xen/riscv: initialize .bss section")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in V9:
>  * Nothing changed. Only rebase.
> ---
> Changes in V8:
>  * Remove ". = ALIGN(PAGE_SIZE);" before "*(.bss.page_aligned)" in
>    vmlinux.lds.S file as any contribution to .bss.page_aligned have to specify
>    proper alignment themselves.
>  * Add "Fixes: cfa0409f7cbb ("xen/riscv: initialize .bss section")" to
>    the commit message
>  * Add "Reviewed-by: Jan Beulich <jbeulich@suse.com>" to the commit message
> ---
> Changes in V7:
>  * the patch was introduced in the current patch series.
> ---
>  xen/arch/riscv/xen.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index fe475d096d..df71d31e17 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -137,9 +137,9 @@ SECTIONS
>      __init_end = .;
>  
>      .bss : {                     /* BSS */
> +        . = ALIGN(POINTER_ALIGN);
>          __bss_start = .;
>          *(.bss.stack_aligned)
> -        . = ALIGN(PAGE_SIZE);
>          *(.bss.page_aligned)
>          . = ALIGN(PAGE_SIZE);
>          __per_cpu_start = .;
> -- 
> 2.40.1
> 
> 

Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

