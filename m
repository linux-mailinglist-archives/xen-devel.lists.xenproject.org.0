Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEEF996FD6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 17:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814846.1228541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYma-0005UX-BV; Wed, 09 Oct 2024 15:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814846.1228541; Wed, 09 Oct 2024 15:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYma-0005T0-8r; Wed, 09 Oct 2024 15:39:24 +0000
Received: by outflank-mailman (input) for mailman id 814846;
 Wed, 09 Oct 2024 15:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2hB=RF=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1syYmZ-0005Kw-Dr
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 15:39:23 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7f5cb47-8654-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 17:39:22 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c9150f9ed4so1922290a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 08:39:22 -0700 (PDT)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05eb5ebsm5792091a12.65.2024.10.09.08.39.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2024 08:39:20 -0700 (PDT)
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
X-Inumbo-ID: a7f5cb47-8654-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728488362; x=1729093162; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oct+1aXwVsVtFTgjw/Ezj7nEyzSVEMoLCGSRarY59k0=;
        b=LWLeuO+AbPWGm5iMPiNJ2+94LW20j2Sclr6SXeAqofepWMAIXFdpULhZzqORJ1EkYG
         yMUjbvt3EmEriQ9MVqlbMx94SOYvlO1DkZo2Nsq5nM/nwKzIVI4JjZhVnZvKFQNXqSgR
         TaZnJ3xRVggGUql33HBvdWhQPznfC+cK6yMwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728488362; x=1729093162;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oct+1aXwVsVtFTgjw/Ezj7nEyzSVEMoLCGSRarY59k0=;
        b=ubMhGJd/+e6na7uiiAWH1O/l9qZ3DnDxyGirQVWCO2zg3uoMsiMLPslehzXbwhj/UN
         D4Q4TAHfRd4VVJ4b4GykAD0QuIGc4aBP+extS9+Ocd1iYOfgeT9wK68+XaECY7REy6Yx
         lcZLuS9FF36m2CiBLS56nhlkEvz6z4OWNwY3MKsiT2bJGbRaQF1AGDbg66v8OelO87xH
         5BuUD1y05EnqgSReG1zGKpX1B3oG6c9KrPukirq07B8O3+IQ+MQNrXNgfd98Er/zHahU
         l+00LvcV9AXT6IH1wMDG0+i71jmt/cUDEkBX5sOJe6e0LXxo4RxdHYGh11rH5mpV9Fdx
         LJpA==
X-Gm-Message-State: AOJu0YxgOhrA7VIWisfPquVFHYYdv5nGKLuJGjZXNX4TSRkVrbQK9uHE
	QGKbkg4yGpqvXc9lkKaEId06p9JsRIRdiIaoIH91QPbgrVUSqzjJ6WRXqiStrAI=
X-Google-Smtp-Source: AGHT+IGzR+TcLBOy0qoj7Bu6LdI45IcPzMLIEspINV6bsMa6YxvWtXfIjAcIJKr96bXo+bZEvz0glw==
X-Received: by 2002:a05:6402:26d4:b0:5c8:79fa:2e4f with SMTP id 4fb4d7f45d1cf-5c91d69a2demr2495324a12.32.1728488362105;
        Wed, 09 Oct 2024 08:39:22 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v1 1/1] ocaml/libs: Remove xsd_glue_dev package, also
 install plugin_interface_v1.a
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <c9b47337615168e38fb6af2a80409f0a38ead901.1728471268.git.andrii.sultanov@cloud.com>
Date: Wed, 9 Oct 2024 16:39:08 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 Edwin Torok <edwin.torok@cloud.com>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@vates.tech>
Content-Transfer-Encoding: 7bit
Message-Id: <E49C0323-4AD0-4074-ABE5-83D917D56995@cloud.com>
References: <cover.1728471268.git.andrii.sultanov@cloud.com>
 <c9b47337615168e38fb6af2a80409f0a38ead901.1728471268.git.andrii.sultanov@cloud.com>
To: Andrii Sultanov <andrii.sultanov@cloud.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 9 Oct 2024, at 16:15, Andrii Sultanov <andrii.sultanov@cloud.com> wrote:
> 
> xsd_glue_dev packaging is inconsistent with the rest of OCaml packages
> and isn't actually necessary. .a is needed alongside compiled bytecode
> files during linking and was missed in the initial oxenstore plugin
> work.
> 
> Specify OCAMLCFLAGS along with OCAMLOPTFLAGS.
> 
> Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
> ---
> tools/ocaml/libs/xsd_glue/Makefile | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
> 

Acked-by: Christian Lindig <christian.lindig@cloud.com>



