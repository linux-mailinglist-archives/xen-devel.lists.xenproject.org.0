Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B90D90FE44
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 10:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744265.1151277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKCnC-0000XV-10; Thu, 20 Jun 2024 08:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744265.1151277; Thu, 20 Jun 2024 08:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKCnB-0000VF-U7; Thu, 20 Jun 2024 08:05:13 +0000
Received: by outflank-mailman (input) for mailman id 744265;
 Thu, 20 Jun 2024 08:05:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mlza=NW=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1sKCnA-0000V9-Ec
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 08:05:12 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d018337b-2edb-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 10:05:11 +0200 (CEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2c6e94131cfso538755a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 01:05:10 -0700 (PDT)
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
X-Inumbo-ID: d018337b-2edb-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718870709; x=1719475509; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Os5+Tn4OGFjzYOGTIdvgLFIxPe6fwG22RT0aaAUWWW0=;
        b=lIthSLMIAMPscun4O/2//qNGQEMHvwjqn/zn2fgkDabuVKBUCPi8UaaJ5DP9+x89oY
         +xcl6vp1rm2IYTNT57dbZMMFmjizL6OEckXnr9JtzaPLKh0EBNQKWRMy+83eL359CNb9
         IuZDSTfJ1v9ZrmcHD7VbvkgLrhGT8bXrzvPPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718870709; x=1719475509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Os5+Tn4OGFjzYOGTIdvgLFIxPe6fwG22RT0aaAUWWW0=;
        b=ifxchLR7aqYOQEmAjGJDM+l1p4sypMbH5ld9lH1ipAS1aQFRCSrwqO3sx8aoGuaZBA
         ARJr2Uwhl0LTVPe4NwUFy3PBVd91i0zrbW7cED/EMtVSNLCjRQ0uJoWdrp6CdxxfLJk/
         rd8hUrfE1EI0Loi/6rMsIx3FM8+C25AFO6eMifKA847p1UAkl8moo04102TADhihBL4W
         US0hwlO6N1dWJj8MdiJkqlTWpIL5q0qGD01K4K9YIHkvaGsP44PiqWOC8UWr2Y8qJy1C
         UYakClclgwXX9K/q4/ag7IFseRAXT6fIK1OOEyAoYbYDdeRBmnKtwekodEkPMGXSv4ps
         P27w==
X-Gm-Message-State: AOJu0Yy6QoHq+MQe36NZiUYl8JaOTLuWq6Fd+tIoHC/WVAvtiEpcWQF0
	uziycu55KyLpCFRxn+Cz82188Uz0pM6ck85TceQOXhwaIE44Lr9nTt8yd7U+gRFh8orWi/TcUpU
	D3WEkL95KSalebOKcvObSHhE6NxVvHBmEA/sx
X-Google-Smtp-Source: AGHT+IGCcoEuh5evsnukS934Yv8tuj7w0ZQ7i0Q5RBmthgzjmEzm+sjixTa55qhPGL8oWf3SwbyzPane+J3xEHU/0TE=
X-Received: by 2002:a17:90a:9c6:b0:2c7:aba6:d32f with SMTP id
 98e67ed59e1d1-2c7b5c8a1b1mr4677364a91.22.1718870708921; Thu, 20 Jun 2024
 01:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <a4d780fd-90c2-405e-be21-c323a22a78c6@suse.com>
In-Reply-To: <a4d780fd-90c2-405e-be21-c323a22a78c6@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 20 Jun 2024 09:04:57 +0100
Message-ID: <CAG7k0ErGHynwYmxWuftUT=yFF0Zrttx0JEAjh3bDzPVzM_MgzA@mail.gmail.com>
Subject: Re: [PATCH for-4.19] livepatch: use appropriate type for buffer
 offset variables
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 8:16=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> As was made noticeable by the last of the commits referenced below,
> using a fixed-size type for such purposes is not only against
> ./CODING_STYLE, but can lead to actual issues. Switch to using size_t
> instead, thus also allowing calculations to be lighter-weight in 32-bit
> builds.
>
> No functional change for 64-bit builds.
>
> Link: https://gitlab.com/xen-project/xen/-/jobs/7136417308
> Fixes: b145b4a39c13 ("livepatch: Handle arbitrary size names with the lis=
t operation")
> Fixes: 5083e0ff939d ("livepatch: Add metadata runtime retrieval mechanism=
")
> Fixes: 43d5c5d5f70b ("xen: avoid UB in guest handle arithmetic")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks

