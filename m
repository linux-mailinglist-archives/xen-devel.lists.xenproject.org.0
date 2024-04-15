Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF8C8A52D0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 16:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706256.1103351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwN6U-0007pH-1N; Mon, 15 Apr 2024 14:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706256.1103351; Mon, 15 Apr 2024 14:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwN6T-0007mg-Ug; Mon, 15 Apr 2024 14:14:37 +0000
Received: by outflank-mailman (input) for mailman id 706256;
 Mon, 15 Apr 2024 14:14:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F4OO=LU=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rwN6S-0007h5-2x
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 14:14:36 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c12eb69-fb32-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 16:14:35 +0200 (CEST)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-233e41de0caso1064799fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 07:14:35 -0700 (PDT)
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
X-Inumbo-ID: 7c12eb69-fb32-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713190474; x=1713795274; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JOburCHu9kch6m9gG6B4FMA/OeCpeP2fonuLbMeGMsM=;
        b=iHWYtURsI7FLDpEMhiHjRfKhYwrHO7QamK5THZT2+A7I6pYubO1UsLWYl5LEHk5Skf
         lhUwjpFbFQ2+CjdEDS+HXFlu4yUOEdzSPdgBWXETAdnm0ChMRY36xMOQW+C6ZitdgQok
         sudKB+udFmPmVt/BZs1NJ+B1qHOq99R1EHQko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713190474; x=1713795274;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JOburCHu9kch6m9gG6B4FMA/OeCpeP2fonuLbMeGMsM=;
        b=wK9q7E+Fj0PDrzKQf4/gxsd7PXCiQKQ5KRqMN9R1B42rmd8b5OsXL3pxsdNCqWR40A
         bd+QwDaq45UKL56+QSUjIOj4d+2StUF4S/1aWuWA8tVxi6SYTU86MEOFQks1JfF9H/Uu
         vAxYyxmsUrP5BsADaBUqIPhweaW3X/8VuG6GT3DAuzT7H+OZpt+X9mjlJDhkfNEQasuH
         HZCUz1Ff//Y7vU+0ekcOnOsylwnurXIlB8eRoi5B2vpn46seJEMAskhiBWgi+eRMwj7v
         l6s4dfUEJ0hCf5xPkc5vxYFRFP3kicvTTJzHAkN/b5N8Ok89ZgP7/jZxsCjm5+tcmXwR
         VO3w==
X-Gm-Message-State: AOJu0YyLUvEHrBXF3kZZzKyquwek1wvHYm07wcYOeHXcCuvviJk4U0OK
	4foMOLAhNNeMUIkIW9RcSlyP19GfI2twMVgOrnwZY58BY/FktgoxJ0biJn81T4FY9PDrdpT0cP/
	3H26ld1eXJsnNQk8XLtequUhEtlrS8nICZEFH94xvGv1FK4MDvLs=
X-Google-Smtp-Source: AGHT+IEB14YSngaVGDsP2B2HIrGHQwg8iy7nkddBWDr2TuzaFqgVr70lMoLulV+TCS8UJOtFaLJ/1dBGUXPVSznt6/4=
X-Received: by 2002:a05:6870:6586:b0:221:9013:d783 with SMTP id
 fp6-20020a056870658600b002219013d783mr11892425oab.34.1713190473814; Mon, 15
 Apr 2024 07:14:33 -0700 (PDT)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 15 Apr 2024 15:14:23 +0100
Message-ID: <CA+zSX=a_-_QpwbE2_aG6jFFozaCAAZd_PQ-iOfaFygyxmd=cJQ@mail.gmail.com>
Subject: Rewritten XSA status page, xsa.json
To: Xen-devel <xen-devel@lists.xenproject.org>, xen-announce@lists.xenproject.org, 
	xen-users@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hey all,

Some of you may have noticed that xenbis.xenproject.org/xsa/ doesn't
currently list XSA-456.  This has prompted me to rewrite the perl code
which generates that area of the webpage into golang, which is much
easier for the current security team to understand and modify.  The
draft replacement is here:

https://xenbits.xenproject.org/people/gdunlap/xsa-draft/

In particular, if you use `xsa.json` for any purpose, let me know if
you have any issues.  If I don't hear any objections I'll replace the
website generation code on Wednesday.

Thanks,
 -George

