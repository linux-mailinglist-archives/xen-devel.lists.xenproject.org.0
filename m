Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED6387CFEA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 16:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693908.1082574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl9Fj-00026D-9P; Fri, 15 Mar 2024 15:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693908.1082574; Fri, 15 Mar 2024 15:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl9Fj-00023e-6X; Fri, 15 Mar 2024 15:13:47 +0000
Received: by outflank-mailman (input) for mailman id 693908;
 Fri, 15 Mar 2024 15:13:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtVl=KV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rl9Fh-00023Y-JV
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 15:13:45 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c0be137-e2de-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 16:13:43 +0100 (CET)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-7882d713f6fso96033985a.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 08:13:43 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 h3-20020ae9ec03000000b007882e204d45sm2150529qkg.37.2024.03.15.08.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 08:13:41 -0700 (PDT)
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
X-Inumbo-ID: 9c0be137-e2de-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710515622; x=1711120422; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VDrHQpeXdupsys/4qNHCU8Q1I9aBw1O7iUAfnS9FPA8=;
        b=EQ3WJ8EBBigNISTmybS/NUSyN6L9G3kz73Ky4oDuLG3jVkHrS9IV7fPasadt6hDwIS
         cydCmFOX4SMTuoL4sEylpLqaoKws6lAi1sgGyIz+tDn+bkAylDR5aLLlKnMQxvEeFqkC
         tt/vz0wLr29DYQg+4Jig6CRDt82pGWeDOIUrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710515622; x=1711120422;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDrHQpeXdupsys/4qNHCU8Q1I9aBw1O7iUAfnS9FPA8=;
        b=q4qHTqs2MkX+UOfPIHXJNjvpJXQTcjCrefyxP3hG2G+dnh7lbrzvSUOMlBdNi1CmoD
         x0lnRliBk7RrmnhetQkEiNyG3ugI2JGSmCFPDaVXIpy47LOyt6lPEOTaudtHupjek/pn
         dfnpE5fxjS2v2pdpANMVMgSJpQ9iRcJ1gnxP+thbb5SGBy6B4fSVgpFXv0HVlpUKTBkC
         2Ro4jO8UwLQaCHgsmLSlLqBaKnDelJJyclLF0jpaVbsq/9/v/PkfhNBP5M0mODMiXu9B
         RImHDqjdiklbHfSrcfmNNoG1+5S2rbfljd8ttTCb1DGnlioDbC9Ft9CKQRJF9UfJ2Gno
         ha8A==
X-Gm-Message-State: AOJu0YywA/PHLq1aH0pKrAS7O6yZoTF+3YzJYi7b+W+VsNAgc89fqtGc
	3kEChCVy4ZE/RJjwqXz6zXqzN5VJ7LhWysm89dSc1wMKvB0bTTXaTgESslCP+hg=
X-Google-Smtp-Source: AGHT+IE3gBfmUccLkJ6PqoN3LYo502VaBZkMs8nQsU3rOl0gPlQoiLfk+IHRG7gOAQ0QtNJdbtm26A==
X-Received: by 2002:a05:620a:4081:b0:789:e93a:ae88 with SMTP id f1-20020a05620a408100b00789e93aae88mr884497qko.15.1710515621813;
        Fri, 15 Mar 2024 08:13:41 -0700 (PDT)
Date: Fri, 15 Mar 2024 16:13:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/vpci: Improve code generation in mask_write()
Message-ID: <ZfRlo2mzARgue1cz@macbook>
References: <20240315121322.3300387-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315121322.3300387-1-andrew.cooper3@citrix.com>

On Fri, Mar 15, 2024 at 12:13:22PM +0000, Andrew Cooper wrote:
> The use of __clear_bit() forces dmask to be spilled to the stack, and
> interferes with the compiler heuristcs for some upcoming improvements to the
> ffs() code generation.
> 
> First, shrink dmask to just the active vectors by making out the upper bits.
> This replaces the "i < msi->vectors" part of the loop condition.
> 
> Next, use a simple while() loop with "clear bottom bit" expressed in plane C,
> which affords the optimiser a far better understanding of what the loop is
> doing.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Noticed when looking at the ffs() code gen improvements.
> 
> Any suggestion on how to test this?  test_vcpi doesn't seem to check anything
> here.  I think I've got the boundary conditions for msi->vectors right, but
> I'd be lying if I said I was certain...

There's no easy way to test this because it relies on having a PCI
device underneath.  test_vpci just checks the logic to add & remove
handlers, but doesn't get remotely close as to attempting to provide
some kind of dummy environment for pass through to be sanity tested.

I should look into it.

> 
> bloat-o-meter reports:
> 
>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-28 (-28)
>   Function                                     old     new   delta
>   mask_write                                   142     114     -28
> 
> which is a consequence of the compiler having a much better idea of what's
> going on in the loop.  There's more to come with the ffs() improvements too.
> ---
>  xen/drivers/vpci/msi.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index d3aa5df08941..30adcf7df05d 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -169,13 +169,15 @@ static void cf_check mask_write(
>  
>      if ( msi->enabled )
>      {
> -        unsigned int i;
> +        /* Skip changes to vectors which aren't enabled. */
> +        dmask &= (~0U >> (32 - msi->vectors));

Do we need to ASSERT that msi->vectors <= 32 in order to avoid
theoretical UB?

Thanks, Roger.

