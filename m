Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705A9ED34A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855065.1268100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQQ8-0005d1-6t; Wed, 11 Dec 2024 17:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855065.1268100; Wed, 11 Dec 2024 17:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQQ8-0005af-45; Wed, 11 Dec 2024 17:22:44 +0000
Received: by outflank-mailman (input) for mailman id 855065;
 Wed, 11 Dec 2024 17:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTIw=TE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLQQ6-0005ZQ-An
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:22:42 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86b0b3e3-b7e4-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 18:22:41 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso1356936266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 09:22:41 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6552b29a3sm712459166b.86.2024.12.11.09.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 09:22:40 -0800 (PST)
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
X-Inumbo-ID: 86b0b3e3-b7e4-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733937761; x=1734542561; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/ibFxfCI8ItX4HxT3HM8aX31ulpCqJOz4MjteRnl5E=;
        b=Te1i54JoRoCFbDi0XzORCUTRD4ABsEe+dLhp4LH3Kutqkqzu2G5QmFGA82bJBFlNVG
         j2p3/SvJ0YJnv4VTndS9B43ig+UGSr1MZSzbt2fE3GtSHmenIyyJI+6UoddPcHweS6Hk
         5vseD3CgUmVPOh8/16xV76jJzqSpUG30QhJpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733937761; x=1734542561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/ibFxfCI8ItX4HxT3HM8aX31ulpCqJOz4MjteRnl5E=;
        b=bGDtjj8HoTtCyfEW3CsaJM+PXlSAgj5kPISPUcomIBOuxLRSdG9Az8lRsZM46rS4Gq
         ACMdO1jqe9Vfk4lx7dAQgU6vVtjEh6yYwjTpXDf+jogrH49dbGkw8cXX92t3mzqt8l7g
         TixE+1rGkP5IGwwj7bXJFzL7iqeaLNZAGqn0weFjGWjMoJSmsI8iHGJNI9gWoeva1KsP
         tRQlCJ884M3v8lcokrt54tSyF0Vixg2E8D5uY1IyOa3/LCZX6Ehhvbh7J5bgdUabRlxh
         YYpNg1ZgKMKYm76W+ZenAZpLUDs8bKCuuadx1yVPlmZ9syLhklSFQtar48ZTzLdn1LcY
         AQjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2Va5nUNeCySoUVBGqYmKz/W9Val67L88PY5WqZwNHsDlHxbB12PeA6xD2+pdbqaqC46Ls/Hz+dE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLVI8342OaXHLGX+pkNZArXIZpMZlXtbhsQXYpO6Y+CXsp/G4G
	I2WYO2G0sK9DHEI1gDIQlCg2/tIgutafIpSmZjOrtCnDJ+8KkWUh11KjRRA837mNCyj51m8pTAd
	G
X-Gm-Gg: ASbGncuqRlB1/HKfTS37pRyEiROuOJADzjzLqL8JanWkb+HerY7z2VzmUpALjY+FkEL
	UpVBslqvzwjl9LS3fsMKk1UUj0f3R3oKY+nS6qtTuD9pgXY9hUFqq4EsPSXauQlPUp+bORIQTP8
	0phkMvPn8Lp+3PIQQ4S9cjSWJQqOILAFZo6c3cPJXGOOnCCJ1UNcwgaEPJijs2SPOlKDAhEOWTm
	fgcHQXmgZmzd9XLBTursNTsA3zCg1k0ZB5w97OhoH59le9V16FkzezcP/5HCSc=
X-Google-Smtp-Source: AGHT+IHwvH7L4iy2TVu65RLplBi4Hr2pEAGDXexUlBnnRJ7XTmjGXXRIWHe01qhdpSmxDPQ8bMdQew==
X-Received: by 2002:a17:907:84d4:b0:aa6:7107:db00 with SMTP id a640c23a62f3a-aa6b13f8044mr290918666b.50.1733937760805;
        Wed, 11 Dec 2024 09:22:40 -0800 (PST)
Date: Wed, 11 Dec 2024 18:22:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 14/35] xen/console: rename switch_serial_input() to
 console_find_owner()
Message-ID: <Z1nKX2oK6-nIh2XH@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-14-e9aa923127eb@ford.com>
 <eb9246cc-059d-4dca-aca8-e75976537206@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb9246cc-059d-4dca-aca8-e75976537206@suse.com>

On Tue, Dec 10, 2024 at 03:13:20PM +0100, Jan Beulich wrote:
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > Updated the name to highlight the logic of selection the physical console
> > owner: existing code does not switch only serial console, it also switches
> > video console and debugging console (debug I/O port and console hypercall).
> 
> I'm especially surprised you mention "video console" here. Afaics all of
> this is only about console _input_, and no input comes from a video device.
> Arguably "serial" in the original name is too narrow now. Yet "input"
> continues to be quite appropriate.

switch_console_input() maybe? switch_console_input_target() even?

I think the switch is also relevant, as it shuffles the input around,
console_find_owner() doesn't seem to convey that meaning.

Thanks, Roger.

