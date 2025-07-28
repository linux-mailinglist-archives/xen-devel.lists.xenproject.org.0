Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377F4B13A39
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 14:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061405.1426964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugMcB-0006xt-H7; Mon, 28 Jul 2025 12:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061405.1426964; Mon, 28 Jul 2025 12:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugMcB-0006wB-E2; Mon, 28 Jul 2025 12:05:59 +0000
Received: by outflank-mailman (input) for mailman id 1061405;
 Mon, 28 Jul 2025 12:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44Jj=2J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ugMc9-0006w3-VN
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 12:05:57 +0000
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36b9b4cc-6bab-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 14:05:55 +0200 (CEST)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-747e41d5469so4659097b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 05:05:55 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-31e663a71fbsm9436482a91.35.2025.07.28.05.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 05:05:53 -0700 (PDT)
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
X-Inumbo-ID: 36b9b4cc-6bab-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753704354; x=1754309154; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FxDg0SU8WcJihRWbL365yl0ltVDEnWn9rjFySo19hw0=;
        b=G9am+e68sPzKm447K6r6LSK4vxuAqrLMDG8FY81fgskAW7sfhZfF9Q4+j2L+G85LR5
         3yfAaIkh4IvlMYkJa4tib/6AFdNzg/YTq6Ol2xGhY24PHpq9P5yBmM+zutQMrgdNJvgT
         GFJEx4q5Z+CVY/WKF2RANZSj24NupUMvtN8SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753704354; x=1754309154;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FxDg0SU8WcJihRWbL365yl0ltVDEnWn9rjFySo19hw0=;
        b=euKQv+ghRXTuf9sG5K7z4cJLbtDrouvELPGFL+KJ5zL8zx8R8wbwElFp54UaBE83qw
         TiRCHbhlZ2qmBvuBx4JmXP3yhmgkokrDDMRNbgxEwlJW05C23oj4ThA+LszH6kGT6sQC
         4pKgl8AdOEqdLio/4wo7IqXf5P9P+jD4f/2hqSZ9znFNeLbhkSOmWdu8qC5yF9G8WgtN
         I1qeHsB5Kde0TIOzQ6EjGr9KLF9k3FPHgL8MY5F2otWdpolWueMMlCSf0Vpc2BTqWdhr
         wPVn5bW7jb0kqaIu/0XyQdtqu1mMskXIEi86IBxpHYmela/ZqXlRfCt3Z0EBChpaUwG7
         MQ2Q==
X-Gm-Message-State: AOJu0Yx7f1JmalPZQ7akHt3tX+Bn22sSLgY0hOZuguHMv15Qc/JgNgxL
	L8WPd9dP5g0vFqOMIXgRPE8Ird8L3ve2ef7OjtC19aRel7BvJ4jwSPro+GvHYBAA7fk=
X-Gm-Gg: ASbGncvGra6dUkNymLOu/WS1lXmg4lFQjOxPEEWBtXLyExT8CA0rNY35j+ATScxYODB
	9wUXovDzZAzc9XRlMikQZXa0noqMyGbuSL3gmJ2rRtSJtlx1uSNdKUWnI+8N5PnwIXVOLeuZsJx
	xQU/dSdHEXnLI2MJ0RMNUzZZQrwtjtdpxeBx3FmvSyV/wZptItb1toaGsHLWpLR7Q7cSmt9T2ts
	L4vIQM8Ottwvw87vtG+3l+jeZ4WXGSIRe+J7afckw7JrEubyzfwtrRfhsfco+KBnHUurckKvoGY
	RtRpnUF/7tnlBIlNTrOXZ0ECURo+oU+WSARd3j0+z8k0F+sIjooFxLGLQEBjVVIztf6eHx6cWfs
	JC/XrA87v8gdd5gBn1ib8Er+gu3hu6uzYHlUdtChlABvJJ93BNxLkmetuA7fyl7GZuvSwhqLA0j
	E2
X-Google-Smtp-Source: AGHT+IGzuWQFPNbK+9Vy10WgbkKY2/IioR98/0Jb/3C30O2TkmeLVsjAcaEKMhTw+LGAwgs2OYM8SA==
X-Received: by 2002:a17:903:22c1:b0:240:2610:a057 with SMTP id d9443c01a7336-2402610a284mr42601065ad.0.1753704354086;
        Mon, 28 Jul 2025 05:05:54 -0700 (PDT)
Date: Mon, 28 Jul 2025 14:05:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/oprofile: switch to xv[mz]alloc_array()
Message-ID: <aIdnnIIlUFPRPqu-@macbook.local>
References: <c9e21aa4-5267-4fa7-b304-1d8c1ff32472@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9e21aa4-5267-4fa7-b304-1d8c1ff32472@suse.com>

On Mon, Jul 28, 2025 at 01:27:48PM +0200, Jan Beulich wrote:
> Use the more "modern" forms, thus doing away with effectively open-
> coding xmalloc_array() at the same time. While there is a difference in
> generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
> code really cared about such higher than default alignment, it should
> request so explicitly.
> 
> While at it also use XVFREE() instead of open-coding it, or instead of
> leaving a dangling pointer, and change loop induction variable types.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@cloud.com>

Thanks, Roger.

