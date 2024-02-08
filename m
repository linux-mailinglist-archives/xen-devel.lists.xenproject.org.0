Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D1584D755
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 01:57:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677941.1054880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsj7-0001kD-Rd; Thu, 08 Feb 2024 00:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677941.1054880; Thu, 08 Feb 2024 00:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsj7-0001hU-Nz; Thu, 08 Feb 2024 00:57:17 +0000
Received: by outflank-mailman (input) for mailman id 677941;
 Thu, 08 Feb 2024 00:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jwf=JR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rXsj6-0001hO-8g
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 00:57:16 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff734226-c61c-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 01:57:14 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-560e9c7a094so1113448a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 16:57:14 -0800 (PST)
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
X-Inumbo-ID: ff734226-c61c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707353834; x=1707958634; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIb7EFybyD98WhmBqTwsfmtz56jlmQb0fYOwTFmQv5I=;
        b=nluBvMzaH5iei34gicA2Slkj6xUfAe6XOWrSOHKodoG9F2aXkcWZPqcmzuMkowIzVc
         WZn9xfmrjlxjv6DjrZKYAt/BRl5Ea3nP0MzDago/xBdMtres5oWMxB3hEnc2KiDkhKOU
         /VEphiD454sXLA5Q1F0NwREMxmqqCoj0FXpIbXr53HUrCG6mfqM6JL2IVdu9BGfcxj7H
         7TuUkiQ3xjEigccbdyLN7M1Hk5kum5KcW4cCOmFA3gW67niV6YuNsMfrWt0QkX4cHuR0
         wM5znN+1VGN2Zdr+HOWfP00bMrvNHtLOvbI+8LzvPkRXUY2283sb5DQj/O0ly+F8sCDt
         yPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707353834; x=1707958634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIb7EFybyD98WhmBqTwsfmtz56jlmQb0fYOwTFmQv5I=;
        b=UkTqdd7BpJQlUQYASshib6FFPdQEDbvF7D2s+g7CY7UU9ZFSmiUunhNWaB3UVAKMqd
         HxsYMRqaXcAHnkRKN5vk+047PmobVWAPd6XwQ5QVjnuWXf1ZFOSBtY2ufn6Fs2g6VOpU
         v0/4UfDYhveyQLSAqTGXcSOWFm4+0c6qn8Ta4n7w8oMktmNzh+8VZXbyjEDQjD835WQz
         QCFOagleQQ/ZWlDtz4FVaCaZ/R9cuk93gLiFId1eLrqxNJ5wGXy+0Z6rBNHeiPauu13o
         z12T2re+Du5WYLZYwJlG5p0Zp3yHgpzXO3CGrMIhdkuD4KMQFU7RNE0HeRwYO+5pAaWL
         Ht1g==
X-Gm-Message-State: AOJu0YxOCTtEB3oKwu+u+cMvf7+YFTzvscBHeg9MpMHaFDtX7Vg9S6hY
	lFLChodI29b50/D1d8GNPx3uKLB24o4UGqp9oPJghFkqVf9i1KniuX6pHeWC7FnRRsJYYQ8AMw8
	uWPHK02lOQzZUbjNQwq5LqK1b2s8=
X-Google-Smtp-Source: AGHT+IF0FdJgtz5j29b0bEQhmoSqOqR4Oo26lLd6QN2ZRfLiNF3pezvmQ2S46al7Mhz8xI0s5WesOAskt70+A+xO2ww=
X-Received: by 2002:a05:6402:695:b0:55c:d503:764c with SMTP id
 f21-20020a056402069500b0055cd503764cmr4663889edy.22.1707353833795; Wed, 07
 Feb 2024 16:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20240205105001.24171-1-jgross@suse.com> <20240205105001.24171-11-jgross@suse.com>
In-Reply-To: <20240205105001.24171-11-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 7 Feb 2024 19:57:01 -0500
Message-ID: <CAKf6xpuU8wF2Mpy0uDAMDXR7uVNWyJ8d7aDJxTJ3h9SdV=unDA@mail.gmail.com>
Subject: Re: [PATCH v4 10/32] tools/xen-9pfsd: add 9pfs clunk request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 5:58=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the clunk request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

