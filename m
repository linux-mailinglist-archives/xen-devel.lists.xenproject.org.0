Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0738685352C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 16:52:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680038.1057873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZv4s-00008A-9Z; Tue, 13 Feb 2024 15:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680038.1057873; Tue, 13 Feb 2024 15:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZv4s-00006T-6u; Tue, 13 Feb 2024 15:52:10 +0000
Received: by outflank-mailman (input) for mailman id 680038;
 Tue, 13 Feb 2024 15:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gnrE=JW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZv4q-0008Ou-UM
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 15:52:08 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d77a4329-ca87-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 16:52:08 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33b2960ff60so3179737f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 07:52:08 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k23-20020a5d5257000000b0033b444a39a9sm9812280wrc.54.2024.02.13.07.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 07:52:07 -0800 (PST)
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
X-Inumbo-ID: d77a4329-ca87-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707839527; x=1708444327; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gn/Nq45doFN+kZvWV6FkvFrv+P+quhq51iNM/ndYjPQ=;
        b=QVzWV9VYDxBX2EahYst3dLjP71x3k0JmyDfceba2rTLbJ8W4pmm8uL1n6c73jhx8rS
         HEgScyzGtxi0n0kemTb3DtLO52DUMiiF+c32nr6tY8qtH77yAI8hnwUxdB5u3BgoKC/Y
         Cuf10X+vG9+0oYgli7x/J74X4rj9SydGFqwUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707839527; x=1708444327;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gn/Nq45doFN+kZvWV6FkvFrv+P+quhq51iNM/ndYjPQ=;
        b=JJ9SYYpoIZICdl/qbpD/fGtJjtgHDiwr4zLqKbxwa29RUH+LyOPBk5WQErB6RRKIKg
         ddVnnNx4shstBQhAoPgQya+07zuqiIH6R+xh9BiSDxYQymIAby0ApH0z2WK8mqzU/jPF
         8RRJBrTl3G0g3DUU5NS4jvj/v9VU1I/bNVXXDB0pz+Yq2g1zEj0QufKMRY/IwHL9I/CN
         2VxgkgTmi/tND0TXQofdNlwXN/ugO9BhD26IvsSwwCaz3U0C8DGoejpLtD34QaAJm8hH
         00FLTCrNLQBqZty08zdToe5AuspnlBVtTbkXX/tjElKiqa6gVmw4W8c1wh4wP/yXUEbp
         Jplg==
X-Gm-Message-State: AOJu0YxQlbY+bVo6FDz/NzooHJjeAJL0+AVhST9owL4Nr5VP9px/bt73
	Z9AfXDLEju37c2hpmHXDVvhRoPoXqZNYnbIiSRucuw+pRkCw5hgIbc3EbgRG8EhMRZx7OeuKntI
	P
X-Google-Smtp-Source: AGHT+IGlLEezUnFM7ZXj8c0YYVImsOl706OxW525doLLnWSi59JwpxLpMdyDbFIG/25gDMymh48KHQ==
X-Received: by 2002:adf:b351:0:b0:33c:e310:8e3e with SMTP id k17-20020adfb351000000b0033ce3108e3emr476390wrd.10.1707839527490;
        Tue, 13 Feb 2024 07:52:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWi1FFZhYHgXC6bdcEAvAkjbfKbFImdnyldR4WZsJx9BNo8nH0yFNlyHqFxJl5U9W7UZr9Y81a0S+BL
Date: Tue, 13 Feb 2024 15:52:06 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: zithro / Cyril =?iso-8859-1?Q?R=E9bert?= <slack@rabbit.lu>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] tools/xentop: add option to display dom0 first
Message-ID: <7c4a7031-828a-4d4a-bb85-a5250cf2545e@perard>
References: <92ef4d230e05970e1d685b03125fce44adc55010.1707331801.git.slack@rabbit.lu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92ef4d230e05970e1d685b03125fce44adc55010.1707331801.git.slack@rabbit.lu>

On Wed, Feb 07, 2024 at 08:02:00PM +0100, zithro / Cyril Rébert wrote:
> From: Cyril Rébert <slack@rabbit.lu>
> 
> Add a command line option to xentop to be able to display dom0 first, on top of the list.
> This is unconditional, so sorting domains with the S option will also ignore dom0.
> 
> Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

