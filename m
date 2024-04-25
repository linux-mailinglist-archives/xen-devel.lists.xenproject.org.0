Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD058B242B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 16:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712121.1112549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s00AC-0005iu-G4; Thu, 25 Apr 2024 14:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712121.1112549; Thu, 25 Apr 2024 14:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s00AC-0005gY-DY; Thu, 25 Apr 2024 14:33:28 +0000
Received: by outflank-mailman (input) for mailman id 712121;
 Thu, 25 Apr 2024 14:33:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s/ki=L6=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1s00AA-0005gQ-Ok
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 14:33:26 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5ef376a-0310-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 16:33:25 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2adce8f7814so994023a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 07:33:25 -0700 (PDT)
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
X-Inumbo-ID: c5ef376a-0310-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714055604; x=1714660404; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1KYqNI7VPqpZ3BqtkH7ZdJcK7SD9Cx9kd8stgkWiZI=;
        b=TYcah792DfvUkqYw14zQgD5VhsiiEkKs0eR9fMFrufARxeSO2g/1aMrWFmsoBv6PT+
         tE0+A5e1zXL+rU1U6RP6bzqbuSk7hljLJd49XaUc343iIlkyoYxgxtMKxq75MdkSbyDL
         gdzT3S7Gkn5qEgjSweFQYfUrZKb0BmPLB8VVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714055604; x=1714660404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1KYqNI7VPqpZ3BqtkH7ZdJcK7SD9Cx9kd8stgkWiZI=;
        b=C9rlht51d2UKmKyPZXBj5SsVEi8Hl1RusEN6Pr58d0VZ03SSwLLQtAoagaF4j7mZ79
         sRB+JSoLSKTB5cGQlyr8k6BmwiA+P7g8yyY2uTbz+G8FWW/Fy7LGMFdKe4Wa7vcGX7Fs
         Hzk2PwsKhIDelG674jHQdWqrHzAUYzGWKZMqbjw8tXDn4nQnVymeAcFTcX0HaEpA0n+0
         KIhPZRc/BKCRUPrS8kXyaOeeLN0YfGvUQ0VlomtEo3PkAS6C67/YZuAgaZe8PnkxRxgz
         lJjf4MkHrl181ZV+cA0Zm9wibJx1A5L5UmcwytVYVVylAFMbeXtUqcDwOcLf2evXP6OZ
         VnYg==
X-Gm-Message-State: AOJu0Yy3JBgrcgzCasdMW94g3fNVW3SjZx5Jsx+GfsAZ6oeYbRmxJO6f
	jro65fJ5keAkIPIICdOOGDfB/nsKJxItpCGLtGB2IMLqbjbyMfn1ZZvPf5HQgGfpkJiYORPiOnO
	ubkHVcC2eQ4zx6fxP9t9Zct90G9A3QM+D+f5J
X-Google-Smtp-Source: AGHT+IETEYcw99vs8Xx9B7RotNiGnpVlyrxIRTIoU+rFQMl4vIvElVmq87zrKwWvslAi81WUx33AAHhpy+90NAxsk64=
X-Received: by 2002:a17:90b:4a8e:b0:2ab:9819:64bc with SMTP id
 lp14-20020a17090b4a8e00b002ab981964bcmr5337802pjb.32.1714055604050; Thu, 25
 Apr 2024 07:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240424081957.34326-1-roger.pau@citrix.com> <20240424081957.34326-2-roger.pau@citrix.com>
In-Reply-To: <20240424081957.34326-2-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 25 Apr 2024 15:33:13 +0100
Message-ID: <CAG7k0EpdQvxksoXG5hRBRMkCWKicmXkfpJPVzbZTU5VpfzgQTQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] xen-livepatch: fix parameter name parsing
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 9:20=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> It's incorrect to restrict strncmp to the length of the command line inpu=
t
> parameter, as then a user passing a rune like:
>
> % xen-livepatch up foo.livepatch
>
> Would match against the "upload" command, because the string comparison h=
as
> been truncated to the length of the input argument.  Use strcmp instead w=
hich
> doesn't truncate.  Otherwise in order to keep using strncmp we would need=
 to
> also check strings are of the same length before doing the comparison.
>

I had previously assumed that this was intentional as a way of allowing
abbreviated syntax. Regardless of the original intent, I'm OK with this
change.

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

