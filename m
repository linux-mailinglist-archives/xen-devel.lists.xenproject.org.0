Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB208C7A0D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 18:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723515.1128435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dcL-0000nb-Om; Thu, 16 May 2024 16:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723515.1128435; Thu, 16 May 2024 16:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dcL-0000ku-LG; Thu, 16 May 2024 16:06:05 +0000
Received: by outflank-mailman (input) for mailman id 723515;
 Thu, 16 May 2024 16:06:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hAQ=MT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7dcK-0000kk-L0
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 16:06:04 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 316caaf5-139e-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 18:06:02 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-51f12ccff5eso1256187e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 09:06:02 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d2bb6sm3035910e87.249.2024.05.16.09.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 09:06:01 -0700 (PDT)
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
X-Inumbo-ID: 316caaf5-139e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715875562; x=1716480362; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l9pJ8URzD8F8P9KTJjOC5G7YdujGU97mixlcEmZ8O5s=;
        b=DdUzhPIivJXEAZcbcJ565zWHrB6Tie9DbGPPLNifffsXRqKnY5XkwdjBWUNtgm+R7p
         2Kbdhk79RaF1IqIj6U5pzP+vr3x7W7DL2P0O8Hs5GMSdC1zPOp4RA8mzAS+p1WnGmtY1
         E8foDvCSinUuAT7V2Z+s8/bM5s12pnQx445aV/dvody+f1dh2HHeUi1DdkdzD9h23+3h
         eo59fFfYk4Zs6qh65x6cBTwvak9zSI1FTiovOHuoK2yXhMxSQuiLKLru8Jf7r3xsHjyK
         NXAa7OOwGgp0wxxEZMpDh8QcwNIetDhGEFDk4bunnf861DkuGfcqlfKZN1pOB5g00hqx
         gvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715875562; x=1716480362;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9pJ8URzD8F8P9KTJjOC5G7YdujGU97mixlcEmZ8O5s=;
        b=XslHSKfPar0z3VwVoTXVzjrFg/USXaindlLFEdpbFCRLDdQu1h/VU2lt2mAbd2wxX/
         Xv5I0Q5JCsAJyQsSaCqq+VZqsz2Ju76XNlodNN3JnopEFd9hlD3+BRJqDfedWDvva+4s
         W5QAfYi4WESNCVlG0WUbP+ehBrGmO4YP68NyolbqSopW0vwEZKJzvsFKxkv5N7LKQ6BU
         tnTrKLjzcDYckZLKQD2kvom3wFobZRfNLVexBhtYkG3pw9uqJ6IMV+SaG3mMoKgifUYe
         IsUiR13I+fF+zb4bqrmAjhxsl4BGY06zD3rWZ+wdsQXckNb1BdVthy1oeqBBWsTj4IR6
         woHA==
X-Forwarded-Encrypted: i=1; AJvYcCVpDr8o4yWesnVXXQgOHcAQvPo2S6NNRq/UvM6TUO/sFKb10GW19x6q/aKrz2/qPSTUm/cSX5GJfhRC5slKZutQuN15eMf0tVLlt0VpA4c=
X-Gm-Message-State: AOJu0YzUw16vX+HFB1Ff311iLACYouR/4rJ0cMDlWa5jIqOSYdIE8eZp
	a6hZwSnD3HF5k5mLopltJLC+POkha5drgGB4O79Kod9oGr37Br0H
X-Google-Smtp-Source: AGHT+IFEtxYj6Zwn+npuIJRp9SGh+e1xPPr+S+TIoa2CN+pxTpwTlZ1qsapC1meDfsdvnG6gVynAwA==
X-Received: by 2002:a05:6512:398a:b0:520:b0fe:6548 with SMTP id 2adb3069b0e04-52210584babmr16202300e87.64.1715875562040;
        Thu, 16 May 2024 09:06:02 -0700 (PDT)
Message-ID: <36c070d3d22da67c77c0d4752d6fc74faf85fbe5.camel@gmail.com>
Subject: Re: [PATCH for-4.19?] xen/x86: pretty print interrupt CPU affinity
 masks
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Date: Thu, 16 May 2024 18:06:01 +0200
In-Reply-To: <c897b41d-2fa5-4db6-b591-60e15b646d6d@citrix.com>
References: <20240515152925.77197-1-roger.pau@citrix.com>
	 <c897b41d-2fa5-4db6-b591-60e15b646d6d@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-15 at 16:30 +0100, Andrew Cooper wrote:
> On 15/05/2024 4:29 pm, Roger Pau Monne wrote:
> > Print the CPU affinity masks as numeric ranges instead of plain
> > hexadecimal
> > bitfields.
> >=20
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Ha - I was going to write exactly the same patch, but you beat me to
> it.
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Looks good to me for having in Xen 4.19 release.

Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

