Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D2BACDECB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 15:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005547.1385003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMny4-0007PN-OB; Wed, 04 Jun 2025 13:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005547.1385003; Wed, 04 Jun 2025 13:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMny4-0007Ns-LP; Wed, 04 Jun 2025 13:15:44 +0000
Received: by outflank-mailman (input) for mailman id 1005547;
 Wed, 04 Jun 2025 13:15:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xa+O=YT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uMny2-0007Nm-Hd
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 13:15:42 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03188d55-4146-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 15:15:40 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so1407946f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 06:15:40 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4efe5b8f0sm21462296f8f.6.2025.06.04.06.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 06:15:39 -0700 (PDT)
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
X-Inumbo-ID: 03188d55-4146-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749042940; x=1749647740; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dE60K0Jg5UXM6f6JnTQ2Tr/PstGbb+8CXQfQV1ZFOHo=;
        b=ONYirIvmqUZrzq7ra7e2CiA28yf4dWXF5F8sbWsdYNJycHuxunsRTUDZZRyq7lM+Df
         7d40Iga+GpE5PK7l7SKatYMbi/ub4f1vJ2P1JJ51VB17Jx1cFDFBug9g0qfOlw5z2oYN
         nl1SjMk9sgS1TlUr0wbUTm0sEyUInBBWi4JzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042940; x=1749647740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dE60K0Jg5UXM6f6JnTQ2Tr/PstGbb+8CXQfQV1ZFOHo=;
        b=RIv9FC9MyG7bKAUd1hJGBfZPZk9yui//qW98B39SnCyqdG2y0aFN+BQbPiQqI4CJXc
         +3yXivbmMSAOZcGKIATGa0+Hi2bgOo3zkfMwUII89yAtSuLYlWQTxA1/Ujaijk7aGqNK
         D0wUBw5uARDy6ukFXE8pGPw4oMuD1ycsOppgeiM74gqaNIExs1NAnzpMpl0dHlYusi8O
         MNrIZLSauBBLZuuqai2UNJz61ezoL5FaZEwpbptlwEgYNbIQ1U6+iIHJ246dvE592I4b
         td9+Wy33iKv/XFRIikN+QEmr5j/oVDAnH0qSDY64FAuaCYOvc4XOhxeM8Pcep6wzIIRH
         iVDw==
X-Gm-Message-State: AOJu0YzoQ2jegUMts+690YYmZrC9EE0c1oTSO0FDleWwjohgNgqod9Gs
	O1uY8hvaf/veRnIVXQAjp9HWmvUZOX43y47ch1O4zntzdcWJj7zxf2I9dVt98hB5eT4=
X-Gm-Gg: ASbGncskkBuupcFadzy1+4Qg2EmlV2c2VdhxnZ8bfUt5hxDGeW1x9sDLUcBPdOQBzaf
	TCNffPy3aI+s+uPKkDKueWYZqCP3S10yEc1mtuf4bkvnGlmEgIiKh+ToO3SOjKyGHS++FOGwq17
	sTn70ouftSG2jh2QtFtidkLYGOnWrzQgmaDkRzxub2bZgg1XTvUcthF/W90xu5GkATaVSPjs7jU
	sSujdV/7t28nVOcw0jpPeJInQX501nC95dOrwjdMaJgRF3tuDgTujjH6mkeUJ343hIGtSrTB6dx
	IwB1YOYxxXAIfvTXwSJJ6Ay/BrYOS1oIxIMkkAqpUYflDurJOFbZc/Oh/pMNIwM0Hj9+DwDCpgO
	at3BsefU2/F3EQ1z/s8pwvx5a
X-Google-Smtp-Source: AGHT+IEznKm/nzynKwvMDtBIyUza3TBGYRFkzHVycvjYrPqiRsH9MEfpwQaNcoSdl15hQ+8jtIr7OA==
X-Received: by 2002:a05:6000:2388:b0:3a4:f7af:b41 with SMTP id ffacd0b85a97d-3a51d91d9abmr2553077f8f.15.1749042939930;
        Wed, 04 Jun 2025 06:15:39 -0700 (PDT)
Date: Wed, 4 Jun 2025 15:15:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Aidan Allen <aidan.allen1@cloud.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/hvm: Process pending softirqs while dumping VMC[SB]s
Message-ID: <aEBG-oo4quaRZFRo@macbook.local>
References: <20250604130253.2805053-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604130253.2805053-1-andrew.cooper3@citrix.com>

On Wed, Jun 04, 2025 at 02:02:53PM +0100, Andrew Cooper wrote:
> 24 guests with 8 vcpus each is sufficient to hit a 5 second watchdog.
> 
> Drop a piece of trailing whitespace while here.
> 
> Reported-by: Aidan Allen <aidan.allen1@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

