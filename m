Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94EDB13A35
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 14:04:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061399.1426954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugMaq-0006UN-8U; Mon, 28 Jul 2025 12:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061399.1426954; Mon, 28 Jul 2025 12:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugMaq-0006RG-5Q; Mon, 28 Jul 2025 12:04:36 +0000
Received: by outflank-mailman (input) for mailman id 1061399;
 Mon, 28 Jul 2025 12:04:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44Jj=2J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ugMao-0006RA-6b
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 12:04:34 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05818f43-6bab-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 14:04:33 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-234bfe37cccso35513585ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 05:04:33 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-24008efc073sm29918325ad.58.2025.07.28.05.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 05:04:31 -0700 (PDT)
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
X-Inumbo-ID: 05818f43-6bab-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753704272; x=1754309072; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aEe+RarXDtfqWFe4O1b2u0OxAmjtUWMlMaogQ3LUgEs=;
        b=CjhhOlCG7PGFzHF4zR7U3JRddN6p5GrcATZsQff2N6q9kOa2m7Y60STDQcDp5Dy8vl
         52/1e6tZoEJASOx2wwZFJLD2QxukiZbv8eJk43/maMHERM+0PcYhSt+JYyPk0aEiRXAl
         vaQykF+PtdRScT4WWCRm9MaHnS9urntCBDfxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753704272; x=1754309072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aEe+RarXDtfqWFe4O1b2u0OxAmjtUWMlMaogQ3LUgEs=;
        b=Rw3FxNERRLVVnXUcgMP/DX9zfC/sVcavoKM4T+ykPmF8Pf05PCmhwT6RDHgLXLDzut
         yK4eD8mYiZ9ib0p1UdXSAa8/YxUSuNgnsCTjWBrn8Bl+W+IbzJhAJstlB2YxLq1Wagse
         C0ZlEgpHK0BJhYGSUUeP/QfTc262qhupuKXaytaYsVR6ifFM2pdx5DS0Ohw58lTYTWrT
         DEh5qWUQqqlQDMMMN/owqjrXZxB4AGqjRuqvtz0K4w2eJAdcp4Q29HVJ2Dyz8VRLPOFA
         9zX+1XBNn7bNfieBCBL18MfoJT+v0rysKr/uPfJi+ZYvJzbnnp2VCSBJmuNvDRExM4pe
         73hQ==
X-Gm-Message-State: AOJu0YzU2gXXuxjfMSPKeSQHQ0+hVB+BoOjUPtQClFh+21xBxH3zIKd+
	YtWxut/SEKkUadbn4GqKDm3iZbl+ywjnJdtdEe7MhdFKggUvV0TigicBQKLTJpzI7VE=
X-Gm-Gg: ASbGnct46T6z6UXvxxb8q17/4gcYHw7Nvvta4FfoQCDMpkRdUwfPozw3LVzDSnsIvMe
	r+j+ptFkWhAdU7GrNI3O/U//oSw5C7RL2NlZuEKYIBUGjTzQEpOpG9I5bPnSU5TV+7mcfPtTIsp
	tH06O+kTpIdoaer7MUyqD9CcwkbyNk/E5NvtdQEItcROoWSI5oAzgSZ+qJ1GRjlqDlRPR0tdOLs
	yYCAg1xS61pw+DrrpC6zucI37FD9T/gL9F1QIlnnwC25v2TXBxmRvEU2EgQw/tBPzRpDyTrzwBN
	EjRk6y0CK7v/Y+lShRECeMNpq4d1KKfDCp+j+9a+aGbIMBN6uPXaUmrkQXgDVX8CulQPoHMIb3e
	dWylg+vcEp5gxp6w9oxE7N2v+/a72y2eRNODGvwrvjnBQ+Zi4NRJe/3/p2ivPS7DWRmobZ5aVn5
	Kt
X-Google-Smtp-Source: AGHT+IFpqifVoTCsrwDMuSlo1dzbKn58XQ4zcWZr5qI473Ry2UF5rHto/KWiS9pQSrsOV2aqd7je2w==
X-Received: by 2002:a17:903:2f92:b0:23f:f074:415e with SMTP id d9443c01a7336-23ff074435dmr75070255ad.14.1753704271505;
        Mon, 28 Jul 2025 05:04:31 -0700 (PDT)
Date: Mon, 28 Jul 2025 14:04:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/HVM: fully switch emulate.c to use
 xvmalloc_array()
Message-ID: <aIdnSSJRiG7ACAVY@macbook.local>
References: <f5a056ab-006b-4bb0-ae17-528a879f661f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5a056ab-006b-4bb0-ae17-528a879f661f@suse.com>

On Mon, Jul 28, 2025 at 01:25:14PM +0200, Jan Beulich wrote:
> Use the more "modern" forms consistently, thus doing away with
> effectively open-coding xmalloc_array() at the same time. While there
> is a difference in generated code, as xmalloc_bytes() forces
> SMP_CACHE_BYTES alignment, if code really cared about such higher than
> default alignment, it should request so explicitly.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

