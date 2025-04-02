Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845AA791CB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 17:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935929.1337292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzzdr-0006nT-4b; Wed, 02 Apr 2025 15:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935929.1337292; Wed, 02 Apr 2025 15:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzzdr-0006lp-1r; Wed, 02 Apr 2025 15:04:35 +0000
Received: by outflank-mailman (input) for mailman id 935929;
 Wed, 02 Apr 2025 15:04:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zyr3=WU=edera.dev=alexander@srs-se1.protection.inumbo.net>)
 id 1tzzdp-0006lT-Rw
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 15:04:33 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7a9bdcf-0fd3-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 17:04:31 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7c56a3def84so672510985a.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 08:04:31 -0700 (PDT)
Received: from localhost ([64.201.234.99]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c5f77650desm798848385a.79.2025.04.02.08.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 08:04:30 -0700 (PDT)
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
X-Inumbo-ID: c7a9bdcf-0fd3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1743606270; x=1744211070; darn=lists.xenproject.org;
        h=content-transfer-encoding:organization:message-id:references
         :in-reply-to:subject:cc:to:from:date:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S9XoP9pFh+bHUVre2EMojdhOPftzHzM1XqMVPhqiZ7g=;
        b=ew7k4VixXUNMynvCKYZYETd2jnclqh3BwT+5xL3yVtUh0K/ufIB4z682/HKY+66NRg
         394I+2gKe9QdBuPqXHpIhw42yaPlDqCEhrxFoxbvDNH90s4H4OaL6jLm6y1AdePxy4My
         QrClAX4Q/0CFXcs2OmdbTEZR4c9KerTSazpIqwMm8ERFBWz26qxtfkH3vkJFn1HFfmuo
         eR1EvljBPUEX1GIUPEiW8YqYkpi+plF7LnD3YRA57+B1zLCl7Q6eguwCRaX6WGj1fl5S
         oVQo4LNWN16OejLCNa6B98yDpYtybt1+hcU+/e7jbz3iERSoT9C5hNgEZO6hbyjNRZKx
         06Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606270; x=1744211070;
        h=content-transfer-encoding:organization:message-id:references
         :in-reply-to:subject:cc:to:from:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9XoP9pFh+bHUVre2EMojdhOPftzHzM1XqMVPhqiZ7g=;
        b=LbWfJks22wd0MMok93Te4JxPGKWV5rXXxyS64vPV+IeDgfrwhfjGc5eCpgUCoUq+cT
         5XirOYrsP2WcCgEclBr7GEEajjPfpq1RjpeD8YisHlH9GXpbCiMBaEieml05ui1uB4Lo
         tpTL8pebfCVJlG73KO6rcwLDoPm9/6gi3iAHzwvoxEksVl9YgCnXBD4bq9MHuiVWODdF
         eCR87+C0tyCTdXt447Nb7atBSRNYHNcoFFZUcxXOUAwYkBtZ42yJqVctBqdD30iFSsXV
         QAc2GfaFI+EN22jYwLjIPY00nKjun9uXhVL9CJcvNcak5ufS9qpIkRxJK4oNiRH8SdL3
         z8Wg==
X-Gm-Message-State: AOJu0Yw9CFEufI06JgJuMGQRcps5lbJ8clCcpY9BdAhuInGOZmqtTbWZ
	EbglbqqfYcAG55KmUhhQFaX9AO77XLPIvmZ1k0gfd+7hkmUG2X9kZ4sdoG1Oul0=
X-Gm-Gg: ASbGnctybgEEzYHk+To0bVZ9RoSd+UFkVOVHQncnVApv+dbrXb2bAoluqBqgKewUOHG
	ieLyG3pKcgbr/lcGtFKOiGKLBqvWv7nOJOkkFi0jXpq1oV3FliGqBC3Ha3NQgUIAyawCg2qbcnp
	bZdD9hq9BgEYDjvQ0tUBK+oKkg+WpmjSrttr3ZIjixvX3YnvU8znVplWiGMxsASce+XGoVfKrVF
	iXyj+YHviknjLVgiYE4P5My0jtpjSJkWB8TzqK+t9Tth7D7QEuh9+3Y3rqoBMus6OiB2w053AQI
	xMrIBncfNnCBi7p5QRZeoA/X+kDyeKdcIm/5wkqS3uh6ItzncsI=
X-Google-Smtp-Source: AGHT+IFAFQA3tjy5BAduDPmdO5IlBp7dX054sr8O25yIC3amtZPTDyKqSezRYHnrvyAcm0lXWASlzA==
X-Received: by 2002:a05:620a:430f:b0:7c5:57b2:2cb9 with SMTP id af79cd13be357-7c766455557mr365882985a.26.1743606270560;
        Wed, 02 Apr 2025 08:04:30 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 02 Apr 2025 11:04:28 -0400
From: Alexander Merritt <alexander@edera.dev>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 1/1] xen/x86: drop wrappers of SVM instructions
In-Reply-To: <70d8d88d-63e1-4622-8b30-09ff2f0eff87@citrix.com>
References: <cover.1743601241.git.alexander@edera.dev>
 <034a5518e8dfde9ac707b494f5d863d78efec84e.1743601241.git.alexander@edera.dev>
 <70d8d88d-63e1-4622-8b30-09ff2f0eff87@citrix.com>
Message-ID: <6e4cddefb40c953a684b7c4f343da225@edera.dev>
X-Sender: alexander@edera.dev
Organization: Edera
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-02 10:56, Andrew Cooper wrote:
> On 02/04/2025 3:54 pm, Alexander M. Merritt wrote:

> I can fix both on commit if you're happy?
> 
> ~Andrew

Noted for future updates. Yes please go ahead.

-Alex

