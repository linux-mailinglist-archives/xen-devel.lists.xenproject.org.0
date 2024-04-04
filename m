Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4294B89846C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 11:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700778.1094434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsJl0-0005t0-Cx; Thu, 04 Apr 2024 09:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700778.1094434; Thu, 04 Apr 2024 09:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsJl0-0005r4-AE; Thu, 04 Apr 2024 09:51:42 +0000
Received: by outflank-mailman (input) for mailman id 700778;
 Thu, 04 Apr 2024 09:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0869=LJ=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rsJky-0005qy-LD
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 09:51:40 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee3fa5b0-f268-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 11:51:39 +0200 (CEST)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-22e8635899cso407941fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 02:51:38 -0700 (PDT)
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
X-Inumbo-ID: ee3fa5b0-f268-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712224297; x=1712829097; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rn3tdGpipF8aAAsAwBCQA/4bW0dr7jdjaE/WLTZQ30E=;
        b=fHa0O0Cf7HL0NPqJa/MONjIKK/WLi4NmgfwKWp6PLh6TZFJ+qcnqoUUMKjH6ULuPwD
         eH6oSAZ1DiIjMNNy9bCepPlALrQMo6nJCeg9VLWDgInh6Dev5+TyNtxqO5AtWQxUOcgO
         Pth/hHFgSMAjIQ3R2XqNR1vxGoJD4ZjUS7NWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712224297; x=1712829097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rn3tdGpipF8aAAsAwBCQA/4bW0dr7jdjaE/WLTZQ30E=;
        b=TVRwDY4JmOuOTlFICmvh3bupJCbBEZqWWoLC9mWGHPGVdXQHTOc+sClQlSMSYlhzov
         ZP6iyonxZ6qz15PEn+O8mV/79nZV0aohvMOOWqGoSBrGe3MZbazGS2qCekXPuFeV1a8e
         KqZbWZj/h4IitDgIOaOcXg2uF5sWE6HFucUUwA0JWZ3Zz5uToeR54OL4oEnziSBReiDZ
         Y5bxI0brlxFFX3pojM1GDuml4vL8yDA+scXF4qxoBhxOvIToMTs0GqA7W1+t6xj+0L5a
         fcnjcfREFpToDzkDH12ZmnGmUNbmd/d1n1BwI1yKdL775HOyUleY1R4ecDY97CId6nQX
         zU3g==
X-Gm-Message-State: AOJu0YyoPlqZnWQ+taNINIljsIEFfpj6tC6ZhaysyT1QmbknyasI7GVa
	hNHNtW2U9POglUvAiyes/VCVsXFkM/nby4mroW+mGI7zkVBFRELlyKYZWP3AhDn8quvLjR+wVWu
	9UmZNjm1EMz3EkiqkmFVkbXa0W4zeXgGFeFOg7w==
X-Google-Smtp-Source: AGHT+IHmBKhglksbujLxmWeQ2JfwnizjBCPdQkTM0m1C/uqwg6tib2FQi+JGqf8k7oD6FJqcyBQ7dlMUQlMtggKrhP8=
X-Received: by 2002:a05:6870:844d:b0:22e:9125:380b with SMTP id
 n13-20020a056870844d00b0022e9125380bmr2047445oak.7.1712224297654; Thu, 04 Apr
 2024 02:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712215939.git.federico.serafini@bugseng.com> <08c449728221c9c2b9e87f22eb9d0cffbf7ecf68.1712215939.git.federico.serafini@bugseng.com>
In-Reply-To: <08c449728221c9c2b9e87f22eb9d0cffbf7ecf68.1712215939.git.federico.serafini@bugseng.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 4 Apr 2024 10:51:26 +0100
Message-ID: <CA+zSX=by6Pf0sLHBxH3pL3=gLcrhjRFLnR+JR1oGRrBn07L48g@mail.gmail.com>
Subject: Re: [XEN PATCH v2 1/2] xen/sched: address violations of MISRA C:2012
 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
	Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 8:49=E2=80=AFAM Federico Serafini
<federico.serafini@bugseng.com> wrote:
>
> Add break statement to address a violation of MISRA C:2012 Rule 16.3
> ("An unconditional `break' statement shall terminate every
> switch-clause").
> Replace deprecated comment /* FALLTHRU */ with pseudo-keyword
> fallthrough to meet the requirements to deviate the rule.
>
> No functional change.
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: George Dunlap <george.dunlap@cloud.com>

