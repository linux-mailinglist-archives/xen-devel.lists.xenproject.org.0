Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF882565A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 16:09:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662202.1032172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLlpF-0002be-Hy; Fri, 05 Jan 2024 15:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662202.1032172; Fri, 05 Jan 2024 15:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLlpF-0002ZC-F7; Fri, 05 Jan 2024 15:09:33 +0000
Received: by outflank-mailman (input) for mailman id 662202;
 Fri, 05 Jan 2024 15:09:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qw3+=IP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rLlpD-0002Z4-WE
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 15:09:32 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d55c8cc-abdc-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 16:09:31 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5569472f775so1987507a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2024 07:09:31 -0800 (PST)
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
X-Inumbo-ID: 6d55c8cc-abdc-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704467371; x=1705072171; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCKIIRz+q3qlePX03YNB6mmvSBt8cIGmgNPfE7a813c=;
        b=g+g09bpldCgFxzQYdDcqhokiu73BJ6GCrehNtmAK7xnl4fIkoBLZxp4EYveNFUH7m+
         E1Vs8lUtSbQLYUZ21fKVI5R7tyKnv3q/4WZOMHYXGhxua70bW6PrXGO0BysaCd9NOewB
         bSCft2iKD4FgG6mriTkntaS6Q4zDxtlwQseW0MAya67VF5Qv3F4P27rWojrL/ur0kEF5
         65thT2bIOuNTBvtOUmMHOfK7sTLKWhPzBagSG2JOsPr9kCyPkcj0hSV3F9c/20CHSR7M
         6RIE2Ki2GIJSRRCrIV141/NptWqjIDJbyKgN6XR5CjwFUBP1iYpE2/fTBpG5GB8o0e6r
         kFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704467371; x=1705072171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCKIIRz+q3qlePX03YNB6mmvSBt8cIGmgNPfE7a813c=;
        b=AyWpA9SfQEgTOL+0E57y2tw7RnKi/yU43ljx+2p985r9gjQB2i1WqbX6dhbM9vOn1f
         F0ijnWIdfAJI2OL+eYeZ+VkU/5XZHNwpKBALMw7y+aGX2nHNFsfWfQcImfAMondq3/DT
         enI0UIscuUJnI/ch46kZIoRWCD+JzPbuTK3BfiFKXAN6wK+9C1H/DDb7Z0j/0Q0iuEu2
         CUbYdJ4RDmuVt5qUxjAZTHFVtmR7gihFkHpoIgVwlM4IpMQxUKOEPUjWFAq3JS+f25BA
         Jlyw2VfZ4uQ5oXmutmQCfrMWGrOCBlTKjQuG9IDapGtwmQvivg89eRLpfzg/9OyyVsof
         ZFSg==
X-Gm-Message-State: AOJu0YwsYgNFkTLEly2bHsROsPGEipj/TeLn4UZ56aXa1qPHe+3SfM2H
	wU+1R6qj/ta1JO5P4ScGHtA3OYaVHYx9E2cTDWwz+XZO
X-Google-Smtp-Source: AGHT+IFQmsBFGDDtfqS889GQwoeuTlNoiXi4phkdbkfA/8yWE/TvN5vSNoipbBYsNfViKkSuQ16i3l1ti3HpAQ87Zxs=
X-Received: by 2002:a50:8751:0:b0:54c:4837:8b80 with SMTP id
 17-20020a508751000000b0054c48378b80mr1239250edv.78.1704467370671; Fri, 05 Jan
 2024 07:09:30 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-8-jgross@suse.com>
In-Reply-To: <20240104090055.27323-8-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 5 Jan 2024 10:09:18 -0500
Message-ID: <CAKf6xptKi_+gCvdR8CPw-2XSk_9hMxsFyjDr0kLfMbbkBVBLSQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/33] tools/xenlogd: add 9pfs version request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:01=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the version request of the 9pfs protocol. For the version use the
> "9P2000.u" variant, as it is supported by Mini-OS and Linux.
>
> For the request parsing add all format items needed even in future in
> order to avoid code churn for those additions later.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

