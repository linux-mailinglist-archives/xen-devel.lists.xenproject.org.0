Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DF9A17B23
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875251.1285694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBGt-0001gz-A6; Tue, 21 Jan 2025 10:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875251.1285694; Tue, 21 Jan 2025 10:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBGt-0001f0-7S; Tue, 21 Jan 2025 10:14:11 +0000
Received: by outflank-mailman (input) for mailman id 875251;
 Tue, 21 Jan 2025 10:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abyW=UN=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1taBGs-00019Q-21
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:14:10 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73cd04df-d7e0-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 11:14:09 +0100 (CET)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-2a8690dcb35so1790274fac.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 02:14:09 -0800 (PST)
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
X-Inumbo-ID: 73cd04df-d7e0-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737454448; x=1738059248; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrwCgFpGhvioWbjjmWesN6tqEnMoFZb0MgDSm3GqrOw=;
        b=gXU06Q5g3CVJL9sDbJPgpqJ8L/SRWQOwZleHiR6eykYr8/tCirV41hjHnb3esInHr/
         iObuWfqqwVSIY5Us3spZwBDl/XCw/v9B30Bm2dZTtbJM1Y9uoeJcA0E3TiazbVPZ+b1G
         ZqkyBMMIcTQospWXKu1Sl7RHsMmokK58pOtpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737454448; x=1738059248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrwCgFpGhvioWbjjmWesN6tqEnMoFZb0MgDSm3GqrOw=;
        b=TTW1kR55SpKLKucnzR7YFzjzmnj0CZ8WA5M9Uwz6Nj3Haw9GcXsNOytZxdmODJyVZ2
         mXo5/kVe78O0+9f7Dd6YiapaX/6mrKuAgXELoHXpT8HYGYAlAEPgojVwZTOfhIcKB5Su
         2yPx61DXMRUeBUzj5hhCy7wEljIzm8TrmRBIOuM82Qb7kVsaLmleobH0lJa8BVHLRh/q
         kgaMckqwNjE62lBrlD8AnZjjo2hYBLCR/fG18RcS9MhD/lsP+6G7knwJM+UcxZemiLSq
         epo7YcdM98q/av1bkGuph0hw9NqF+KPTHhbVDcWejlXGZFKOdGphKObroQBm5xcJtpn5
         xY4g==
X-Gm-Message-State: AOJu0YzcgUOUPBjEVB4PXLztc2qZFa7P1E39pssFF637HeEv+/kFmF+h
	LIaAMt4/RhzUgK11U/ifj9WVXlfvLw7Gw/YUZNWc29YO4n5UzZAW+hzPlM96Dlp43v0tBEgQm5v
	Wbf5GT1oo+nkxV866S5Ffq9nwMu8VoV3oAIUJ
X-Gm-Gg: ASbGncvX0zt/L8vCgJFYjpVqA0JvutixFpyHeqY8BIpAC/VchqT7bq72Z6bGMV4NNEB
	3KkWVgeL+OYnPG15Wq79TY4OhNt/Vu40/mQhBEejNUxS2ZHaY7A==
X-Google-Smtp-Source: AGHT+IGI3+dV2kc5H5TBxUN/oFa5UzTmoLuTgpUYKclPHbvqgj3pdBRh/G5gqwka4Q1OMeC7xlmviwpc9QfrMnFiGaQ=
X-Received: by 2002:a05:6870:4f0b:b0:29e:7dd8:92b1 with SMTP id
 586e51a60fabf-2b1c0c01e40mr8642567fac.24.1737454448172; Tue, 21 Jan 2025
 02:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20250116175214.83742-1-roger.pau@citrix.com>
In-Reply-To: <20250116175214.83742-1-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 21 Jan 2025 10:13:56 +0000
X-Gm-Features: AbW1kvb9nfCQoAe19QxR8uhgZBe2FEwWEaoeQD6hc-nUmn819CVSrekFHO2fJew
Message-ID: <CAG7k0EqE2HrZabEqA741cDT+nMGttwGZ2jssLLwOzxp+ZYE85w@mail.gmail.com>
Subject: Re: [PATCH 0/7] livepatch-build-tools: fixes for handling .cold and
 .hot sections
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 5:52=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> Hello,
>
> Fixes picked from kpatch to deal with .cold and .hot sub-functions
> sections generated by gcc.
>
> Thanks, Roger.
>
> Artem Savkov (7):
>   create-diff-object: ignore .cold.* suffixes in is_bundleable()
>   create-diff-object: add symbol relations
>   create-diff-object: propagate child symbol changes
>   create-diff-object: allow changing subsections
>   create-diff-object: add .text.hot to the list of bundleable functions
>   create-diff-object: propagate ignore.functions to children
>   create-build-diff: support for .cold functions with no id suffix
>

For all patches,

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks

