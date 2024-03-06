Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68C6874472
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 00:38:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689576.1074725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri0pt-00046V-7Q; Wed, 06 Mar 2024 23:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689576.1074725; Wed, 06 Mar 2024 23:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri0pt-000447-40; Wed, 06 Mar 2024 23:38:09 +0000
Received: by outflank-mailman (input) for mailman id 689576;
 Wed, 06 Mar 2024 23:38:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rsyy=KM=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1ri0pr-00043v-GD
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 23:38:07 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95331f6a-dc12-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 00:38:06 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-568107a9ff2so271722a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 15:38:06 -0800 (PST)
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
X-Inumbo-ID: 95331f6a-dc12-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709768286; x=1710373086; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rs435nhAJhDlf8VEGEp55iddRE0N5vlG0qIaHENxohA=;
        b=BDO62eFra8Ol3PDh/lUipnh3R89dNR/CYMVaxp8eFhs84SPq5PNAbbEFY8IHRg6IT2
         9OrsYStfukNyFJzR5ArYYlCkkMb7iBhWtklPDc7GbUUf9bYQABdmfjP3XVAyaBXg6QaB
         v7PDwYRJ5iqKf/1RDRZW03zcKLH82hMBZ5zYWxxtl7uAAJzhhg+1aL8TDjDuFmuqQXv2
         6ZCl7eerA/wALxvcrRRBdBiqonkp5iugDa1XPIkkBzal9AojuvqEf9/I9C34XT8exFUz
         Eqlj9WZo4+iAi0OigQfgLxraCTkIq2SUXot4pd5P5uhMCJGnge6WOoIbDDuoMUz3bnUY
         guIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709768286; x=1710373086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs435nhAJhDlf8VEGEp55iddRE0N5vlG0qIaHENxohA=;
        b=DS35WgrfsIhvbPFdMubUjWRv82K2XkuUjE4RL/CD0qxUb7sgx/PcjKO/lXl2+ebXos
         SOU2yktLhuDEGdw+h2hzhasIjIUly5w+pNXYfjbEOz3QzGOBIViJu0jYvzX8lBOsO8CU
         MWSdI40DuWOs0adTtXJLXwp7FNkPwPEF/bbiA1A3rAzhHNKPwc2uuR85NDcNaLeP3LFj
         bOqzs8qf6LIsI2s031iNC7MY+epV4nXy/wY1X6//J968D8zoAN5YCfx24hMa4wiqM0jB
         3FAExNLk2j3V7JG0i+YVV68y5IZaA2AL2N6VguOwj9kgElRhyWlftcZx/XZfBHuptPcc
         pOrQ==
X-Gm-Message-State: AOJu0YwiZPWDhdZkBkxjbawd4yDDJ4Pa/l0+TDC/aty6ALSCSYdxy7l1
	CwU6GaZjtaHXq4XQ6N3CgwEI5zIJ4GbYPsJxzdTNtxpTorqfe1ZwNHqBc66BVU4btn/9FE8xxsJ
	YAG+LZnA+pO6UcDHeWqONy7u4riMRzSXqH20=
X-Google-Smtp-Source: AGHT+IF0uNmyNEI5H5qVpmLPkty3e5IOpkliyi+fP3fsHr8AmB81uFXT59GhqPxEgOMXdBsBx/6ycmrxTPxJXAd9XgU=
X-Received: by 2002:a50:c90d:0:b0:565:e610:c358 with SMTP id
 o13-20020a50c90d000000b00565e610c358mr10526624edh.38.1709768286040; Wed, 06
 Mar 2024 15:38:06 -0800 (PST)
MIME-Version: 1.0
References: <79ed633d-b0bd-4a7d-a0c6-37a034e1ee96@suse.com> <0374516c-b5fa-4880-a07a-0b788f491e9a@xen.org>
In-Reply-To: <0374516c-b5fa-4880-a07a-0b788f491e9a@xen.org>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 6 Mar 2024 15:37:53 -0800
Message-ID: <CACMJ4Gaw86kR0QAgWYNtu9JtU5TT=pEN_MBNwn1MB7FLb7pjRw@mail.gmail.com>
Subject: Re: [PATCH v2] Argo: don't obtain excess page references
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, openxt <openxt@googlegroups.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 18, 2024 at 10:01=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Jan,
>
> On 14/02/2024 10:12, Jan Beulich wrote:
> > find_ring_mfn() already holds a page reference when trying to obtain a
> > writable type reference. We shouldn't make assumptions on the general
> > reference count limit being effectively "infinity". Obtain merely a typ=
e
> > ref, re-using the general ref by only dropping the previously acquired
> > one in the case of an error.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
>
> > ---
> > I further question the log-dirty check there: The present P2M type of a
> > page doesn't really matter for writing to the page (plus it's stale by
> > the time it is looked at). Instead I think every write to such a page
> > needs to be accompanied by a call to paging_mark_dirty().
>
> I agree with that.

Adding OpenXT mailing list as I have found that I have not had the
time available that I had hoped for to spend on reviewing this Argo
change, and to provide opportunity for downstream feedback.

Link to the posted patch (start of this thread):
https://lists.xenproject.org/archives/html/xen-devel/2024-02/msg00858.html

Christopher

>
> Cheers,
>
> --
> Julien Grall

