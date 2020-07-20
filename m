Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D4B225D83
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 13:35:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxU4N-0008QD-Kd; Mon, 20 Jul 2020 11:34:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezcM=A7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jxU4L-0008Q6-Pk
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 11:34:53 +0000
X-Inumbo-ID: 0708c574-ca7d-11ea-848b-bc764e2007e4
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0708c574-ca7d-11ea-848b-bc764e2007e4;
 Mon, 20 Jul 2020 11:34:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id j18so21924683wmi.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2020 04:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=wY/v6COBEdLlhFrSj6EK10rS7gl/yZlsTCzXbIgs50g=;
 b=uyWxZHDNJmdDF9M37Q9NvveQ8HxZpCSApk25kds1j80t8481I3oDVUzeM/TNaK1WT9
 lFERB5/sJwhRn+31k0Cmz8eVj9IZVhJm0oDaK6krUNNcSxgMBdLqKgZiZERN1il7FE7Z
 pToPJLgD7F7JzgiFLIWc1EJTUlMA7KPzcOi2LJibxOsVTI/hRE9cZig7vxZ5Xn9x1JY4
 /MMp9Zv8+l3CuekrMZZ8zcheG6+896wmvDlIuUkagZcdEz31ihozw7c/1NbnEYgLkzm0
 JP4mvRsF9LRSFxDntkJhaGq4ZIdA7xSK5yYhbmkzgYwxFbRv1euY+IAx3JvL9Qf07jlm
 bN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=wY/v6COBEdLlhFrSj6EK10rS7gl/yZlsTCzXbIgs50g=;
 b=WOYSqtDISn1y2lCiYTKN+CvpX0tlnwFqHiqJKhPQXEJn4Bs09sqYhNdioz+UyySO6M
 VNBE2IjxUKaK+yKcLP7ClVwHD5u/B69wNiQ8mnNfI2lFXxcjB66wknfodmKqjRe+UYPU
 yKocMszHLZWjWx1vB6pp9PNXHOSpviLF7KSnDnteVN10QcK79AE090kCTKQEL9lM583+
 53yOfeUQC3Mw2j2byOlF66BfRXRi4KT/nLCK0el+O/HZmL1R4s69nQGOVvXHAQcAdGtY
 XuoU5qQC2ynKTVgeqyKWyJY9wYeQm4g02BaEYqE9rrOF0WsshYmu7q8tvUBMcgpHKjSu
 5XwQ==
X-Gm-Message-State: AOAM533ZIQXMGCyvofWqM1ceDP6947SzIzFEnpi+8XKCFR7YSsiqYGy5
 oFyPLeXTp+wLDnyLL/QStRo=
X-Google-Smtp-Source: ABdhPJzFTiP70xsg3+d7aQMhPpGWQnzpYQoU1Ct20yY13yolFPvaYN3U73LFYbW1myuQ81r4o7zvHg==
X-Received: by 2002:a7b:c250:: with SMTP id b16mr21111475wmj.30.1595244892322; 
 Mon, 20 Jul 2020 04:34:52 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id u2sm29223671wml.16.2020.07.20.04.34.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jul 2020 04:34:51 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Juergen Gross'" <jgross@suse.com>
References: <20200720112137.27327-1-jgross@suse.com>
 <0463f87c-2139-7f17-02d8-94c59ea39434@suse.com>
In-Reply-To: <0463f87c-2139-7f17-02d8-94c59ea39434@suse.com>
Subject: RE: [PATCH v3] docs: specify stability of hypfs path documentation
Date: Mon, 20 Jul 2020 12:34:50 +0100
Message-ID: <002201d65e89$c84eb460$58ec1d20$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQM5wuAhs7ejpzf9sg3QCNvYrfsi+wIyFHM7pjf899A=
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 20 July 2020 12:33
> To: Juergen Gross <jgross@suse.com>; paul@xen.org
> Cc: xen-devel@lists.xenproject.org; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>;
> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH v3] docs: specify stability of hypfs path documentation
> 
> On 20.07.2020 13:21, Juergen Gross wrote:
> > In docs/misc/hypfs-paths.pandoc the supported paths in the hypervisor
> > file system are specified. Make it more clear that path availability
> > might change, e.g. due to scope widening or narrowing (e.g. being
> > limited to a specific architecture).
> >
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Release-acked-by: Paul Durrant <paul@xen.org>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Paul - should I throw this in right away, or has it now rather missed
> the train?

I guess our emails raced. Throw it in now.

  Paul

> 
> Jan


