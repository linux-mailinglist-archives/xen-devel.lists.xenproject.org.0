Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948BD6ABD2F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 11:47:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506892.780107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ8NQ-0006is-OU; Mon, 06 Mar 2023 10:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506892.780107; Mon, 06 Mar 2023 10:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ8NQ-0006gb-Lr; Mon, 06 Mar 2023 10:47:32 +0000
Received: by outflank-mailman (input) for mailman id 506892;
 Mon, 06 Mar 2023 10:47:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TUpM=66=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1pZ8NP-0006gV-He
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 10:47:31 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b1c27bb-bc0c-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 11:47:30 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so4901790wmq.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 02:47:30 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j39-20020a05600c48a700b003e21638c0edsm9526706wmp.45.2023.03.06.02.47.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Mar 2023 02:47:29 -0800 (PST)
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
X-Inumbo-ID: 4b1c27bb-bc0c-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1678099650;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsFBWkKDKCDs13ZOYlQBQNx45rT/3lOOoulMCyoJspM=;
        b=NZjDh8/HYHUYuBdVGrFcUQXtGo28jYY/m4mKWJw/K/O/GfK9Tvb+IpxI8PZC7Ji7HX
         o5wYi2BvudJdsnTQlz0VMeiK76AyauzXfXeTLcFU4Xkord9/yAkuhPgqtgOYW/tngtST
         3ygsWuMaincEvZDP98RmJP1pGcqT/Ebmx9Vok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678099650;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsFBWkKDKCDs13ZOYlQBQNx45rT/3lOOoulMCyoJspM=;
        b=HGYMb3G/aziupcVo6Qoz+9DD8DWt6TzD5iK/nD0QuBSy/AswNlOYjigMLL1ny2f5Kp
         EuR4FQ7grlKLGwRs5aYT9Y7EvS83a64uvcv7mY8xJcl+NUnUBKSd+IR+mApfP76Oip+j
         eN0B4ulnPISzvH90dnFQi1RABT4AeulXFD1Mvz19ExBwsfCaveHarlzS0/AjIY/2G6Hg
         l8O3U3SWFlgdXQh/ci0pUyhmvCoAEhtapQoHj8tbKISMwTzp72Xu7aRS2lMFwOs1wC4J
         4xrOo1jQBkizzP6WMKIxheLMBCjGU/a+qrwwqudn4JA0zQS2u4W4BjBRuprB18Kzk4cf
         up+Q==
X-Gm-Message-State: AO0yUKV5ub7Q22lG6mcLb3sOqrACunUwONY+z14vvO8Ws2YrjeqDy1Is
	czwmhptJ39PejWZHuEs+BsKb7w==
X-Google-Smtp-Source: AK7set+xk9ym4JDJAC93UqxY9g4tn80BmaP576098SRLQlCHLsZWK7HHoVo/rc9KuYMlIScIAWfh2w==
X-Received: by 2002:a05:600c:5110:b0:3e2:1a01:3a7c with SMTP id o16-20020a05600c511000b003e21a013a7cmr9665933wms.6.1678099649929;
        Mon, 06 Mar 2023 02:47:29 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v3 0/4] tools: use xen-tools/libs.h for common definitions
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20230306072140.28402-1-jgross@suse.com>
Date: Mon, 6 Mar 2023 10:47:28 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
Content-Transfer-Encoding: 7bit
Message-Id: <9D47146A-BAE6-42D8-BE96-A869369CC980@cloud.com>
References: <20230306072140.28402-1-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)



> On 6 Mar 2023, at 07:21, Juergen Gross <jgross@suse.com> wrote:
> 
> There are some macros defined multiple times in tools. Use only
> a single header file for defining those macros and drop the copies.
> 
> V2:
> - add patch 1 (Andrew Cooper)
> 
> V3:
> - address comments
> 
> Juergen Gross (4):
>  tools: rename xen-tools/libs.h file to common-macros.h
>  tools: add container_of() macro to xen-tools/common-macros.h
>  tools: get rid of additional min() and max() definitions
>  tools: add offsetof() to xen-tools/common-macros.h

Acked-by: Christian Lindig <christian.lindig@cloud.com>


