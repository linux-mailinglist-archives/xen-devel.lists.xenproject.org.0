Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C3096B47D
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 10:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789909.1199578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sllMx-0005Rg-5N; Wed, 04 Sep 2024 08:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789909.1199578; Wed, 04 Sep 2024 08:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sllMx-0005PA-2g; Wed, 04 Sep 2024 08:28:03 +0000
Received: by outflank-mailman (input) for mailman id 789909;
 Wed, 04 Sep 2024 08:28:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w5/8=QC=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1sllMv-0005Ou-Mw
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 08:28:01 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9849a5d8-6a97-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 10:28:00 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c0aa376e15so3517798a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 01:28:00 -0700 (PDT)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c243054c26sm5225688a12.15.2024.09.04.01.27.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Sep 2024 01:27:58 -0700 (PDT)
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
X-Inumbo-ID: 9849a5d8-6a97-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725438479; x=1726043279; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoLY1q0i9KuEyX2otJQpTxO+cA4z6hRMRi4vw+cvJ8s=;
        b=j9KnR7iT+f4Jz2mpBL40JI94PUrzxbsi9ns8Xw/22VluboCaQyjGvMN7lwytXzAau3
         mCJbdkUvUtKgSFXzbw1JVxbKfMNmosN721elMu/m7ug8DwLVNl5y/MLP1Zypj8AIu0Yy
         7B7Efo9p02BoHjQy+nMMuSwp6OoG5NIR6dqww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725438479; x=1726043279;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GoLY1q0i9KuEyX2otJQpTxO+cA4z6hRMRi4vw+cvJ8s=;
        b=uarfgZ2bNzCJjdZs5vCcDunR96kG2GmoJhyNa/IsMBXbxw27b3ETDSdPng/8VDWis0
         qEwzN/LcFg+SipCZjUQ+4io/4qYHmfXMLRhCIxEBhD4w3z8i48DH2Ans15HZxaniNlE0
         93YZrxyZjul2g5nSrm05ALLMW/Dbtd0tIc0cn3/jlQDh3/gCwsNa13iP7OOy26zLeh2v
         8NFHKrEZUhQojR9CpWQnvU7bXlj+r/7HiT48/Kt/Is4ab9t2O+xnowwH7ffgPaWEGYv4
         3TJMPowkybXnAolZc6PuqAA9Lrq+UHqX28vVlQp4/pIScyCazS7fbneD+FyQdvp7AWst
         I5lw==
X-Forwarded-Encrypted: i=1; AJvYcCXBcKUZQGeTYvzNusmkPep6gVwgc7xialYd7UqZn/Xq8XFRONSUIRTRqVxn+xhAek9VgG8ZQnWaHHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZjgz0y7Qp2ugR+WRxgnR/n5DvAR3w7IiCvVAhehIuPL1fihbG
	f0/gDN3oEMzvIp2RPj4ZzXpIw38LrOLyeiN18vmmUBzRsh7H/3Bedu+zQxOVb1w=
X-Google-Smtp-Source: AGHT+IGYdjRDYE8wenyHiEwzMQQV8xDCx5B/jlDfTzDge5gFhU+GSu/SOWHMisymYWQzrPeuI9Zt6Q==
X-Received: by 2002:a05:6402:1d55:b0:5c2:6311:c9d1 with SMTP id 4fb4d7f45d1cf-5c26311cb25mr6963948a12.22.1725438478751;
        Wed, 04 Sep 2024 01:27:58 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v2 1/3] tools/ocaml: Build infrastructure for OCaml
 dynamic libraries
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <2b75d9e3-f50d-4685-a09d-c1b4f3dd4c4c@citrix.com>
Date: Wed, 4 Sep 2024 09:27:46 +0100
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@vates.tech>
Content-Transfer-Encoding: 7bit
Message-Id: <C666DD5A-6956-452E-AB98-39FA689F3E79@cloud.com>
References: <cover.1725363427.git.andrii.sultanov@cloud.com>
 <36a9b5cbaba9bfffe261b824388ee81bb3c0a260.1725363427.git.andrii.sultanov@cloud.com>
 <2b75d9e3-f50d-4685-a09d-c1b4f3dd4c4c@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 3 Sep 2024, at 17:40, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> 
> On 03/09/2024 12:44 pm, Andrii Sultanov wrote:
>> Dynamic libraries in OCaml require an additional compilation step on top
>> of the already specified steps for static libraries. Add an appropriate
>> template to Makefile.rules.
>> 
>> Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>


