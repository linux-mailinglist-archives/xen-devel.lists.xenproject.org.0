Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314E4B3BD72
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 16:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101510.1454556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us01i-0007gG-JN; Fri, 29 Aug 2025 14:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101510.1454556; Fri, 29 Aug 2025 14:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us01i-0007dQ-G7; Fri, 29 Aug 2025 14:24:26 +0000
Received: by outflank-mailman (input) for mailman id 1101510;
 Fri, 29 Aug 2025 14:24:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1us01h-0007dK-B0
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 14:24:25 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc54ee24-84e3-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 16:24:24 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45b84367affso194635e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 07:24:24 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b732671b7sm49329625e9.3.2025.08.29.07.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 07:24:22 -0700 (PDT)
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
X-Inumbo-ID: dc54ee24-84e3-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756477463; x=1757082263; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSY4lFCPLQwuYqlpLNgxvukBPjKyjCSieNIik9azPXg=;
        b=ptV5a2h6zIxYT4+OZagyH3y5OcN85LcGApQaW50DhYtWQZ1yswHcTcOS6HM9LLYPUH
         geczecJJ5jFp0z6Rwl88uDqi/Ya3pE2RiqIUczpYguCD+YBla8YtDBTXa5K8fVyiCpIR
         7m/cZAV8p7mBQ7aPr845ivfT1DP8B0DVcBLMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756477463; x=1757082263;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSY4lFCPLQwuYqlpLNgxvukBPjKyjCSieNIik9azPXg=;
        b=BwmJU0sqzyLpLrSUtzaFlafa6MeY9hlQLjiympu7i3ifnf4BrDnJcvJIHhDzFC3rs/
         QhxFrR8IjbSn24SwqF7wBvsCKbtBgAeKbvJx1PERDD5iHrE3wFWzL5e5FostC5o5wkhk
         roOBVnzyyHIpMUYutmPjx49k1I/X+Arqios/LAYMmtk9MRRiwKEvSRg8WLwkCbt7TKL5
         +NTQUCFgwD/p+yE/xX76Z+Qp4n4Wpq21OHKrxDBMXDOKd8fWB7w3x0nQscbc7Q/sCOOz
         Wdea9FX82I4tOuShcI6zUl+qWlrZbGGKvggIGmnTFzdZTvYyyzar8oEteTziax0pLm/4
         k0yw==
X-Gm-Message-State: AOJu0Yz4cSUkUyq7YEgyD4mGnJHYxKynRxKRIDULUpJjCrYfZHqflHqu
	a2F0MUvFdygK9L0cG7JTthlYhAW6Pl+kaxmB7A91xQVHjv8FWKLeJJTTTg2/yTxs4Xw=
X-Gm-Gg: ASbGncuJ4FiuDnxiJ8SYjCoO/xf2KcQVKyTIiCQU4x86wqrs2uARIdCelUu+P0MdJz1
	+VbOizSk8TVqeekx61seP6fLCFipEzvPbplRxDhcXYmj9PYwofo8DxxuuRv5HIAfH6u8E6pc/KG
	a2PJt313/IVHFS7sm3jka/TSYcpryZjlQxowBCC3ZiODEMVaqnAFaFrDsJLJUaMquXpNipzXeQa
	vHhpNRPDt+6a1FbiHxSXVeoON3jfycScwkiG9UDeVmUXagULx7N4s9vSvMxeL1EkcVonPV9FLs6
	rgyT/lGLR0N7etP/nLxk8ukh/Pb+mT8PQMCHo3+dWuKOB/kmrg+D9h/wbmZQpR9UFf9jk5Go8aT
	aZcENlJAg5f14CgwCWTKMinVDBUiZbqW4S+y4JyQG0LbK13icL43itjFCVBoWizmtGWU7NyNHln
	5U
X-Google-Smtp-Source: AGHT+IE2rBHKdeb/VlJKYtnwtd6k+CXnt413B65xP25iFOHMuiA4QIU7qkPFl0TeNBrCQlSs14w8Vg==
X-Received: by 2002:a05:600c:4f44:b0:45b:7f6d:1271 with SMTP id 5b1f17b1804b1-45b7f6d1419mr25090895e9.15.1756477463312;
        Fri, 29 Aug 2025 07:24:23 -0700 (PDT)
Date: Fri, 29 Aug 2025 16:24:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 1/5] symbols: add minimal self-test
Message-ID: <aLG4FdcHSLW6oaVA@Mac.lan>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <879646dd-b55e-4b42-b637-d3b14570b880@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <879646dd-b55e-4b42-b637-d3b14570b880@suse.com>

On Wed, Apr 02, 2025 at 03:57:57PM +0200, Jan Beulich wrote:
> ... before making changes to the involved logic.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> While Andrew validly suggests cf_check isn't a requirement for selecting
> which function(s) to use (with the non-upstream gcc patch that we're
> using in CI), that's only because of how the non-upstream patch works.
> Going function-pointer -> unsigned long -> function-pointer without it
> being diagnosed that the cf_check is missing is a shortcoming there, and
> might conceivably be fixed at some point. (Imo any address-taking on a
> function should require it to be cf_check.) Hence I'd like to stick to
> using cf_check functions only for passing to test_lookup().
> 
> With this FAST_SYMBOL_LOOKUP may make sense to permit enabling even
> when LIVEPATCH=n. Thoughts? (In this case "symbols: centralize and re-
> arrange $(all_symbols) calculation" would want pulling ahead.)
> 
> --- a/xen/common/symbols.c
> +++ b/xen/common/symbols.c
> @@ -260,6 +260,41 @@ unsigned long symbols_lookup_by_name(con
>      return 0;
>  }
>  
> +#ifdef CONFIG_SELF_TESTS
> +
> +static void __init test_lookup(unsigned long addr, const char *expected)
> +{
> +    char buf[KSYM_NAME_LEN + 1];
> +    const char *name, *symname;
> +    unsigned long size, offs;
> +
> +    name = symbols_lookup(addr, &size, &offs, buf);
> +    if ( !name )
> +        panic("%s: address not found\n", expected);
> +    if ( offs )
> +        panic("%s: non-zero offset (%#lx) unexpected\n", expected, offs);

If there's a non-zero offset returned, could you also print the
returned name? (so use %s+%#lx) there's a change the returned name
doesn't match what we expect if there's a non-zero offset.

The rest LGTM:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

