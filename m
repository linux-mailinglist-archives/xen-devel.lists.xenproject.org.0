Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3762420CD43
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 10:26:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpp6u-00051F-69; Mon, 29 Jun 2020 08:25:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xxse=AK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jpp6s-000519-Bn
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 08:25:50 +0000
X-Inumbo-ID: 233d1aa2-b9e2-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 233d1aa2-b9e2-11ea-b7bb-bc764e2007e4;
 Mon, 29 Jun 2020 08:25:49 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g10so1782847wmc.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 01:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=AuJlaHKuyVu7EKYDjhJnZAYNsBzoL+I5XdtiyNwUB54=;
 b=tT/0o2b122Uo6c7myzyj7sFTEQtQ9rgp2F3Gdh6jdtfmPqpsLWalsGD0lwq8Si2sRI
 CPFHU6qDBg9Trc2OlwlH9/0tvFaaWxiaVNljQPj/+dJqUd/1MLBLZSpLmlkYrIgs5YQx
 l1EHVglLSWu91VcQCtG3sv03Gmh9yWUTznEyMM4wxakUoigdG9yCUE2Gzl//KuAukovd
 vj/VYfDBdiBepDg2KD7Xd1Mp983rlIFQMikUZlUVBsP5ms0VvDJhjM6bJJ2aI1CArr8K
 TXOv9Y7Ozjr6olxG4zD+r4IFKUkLqmgmeW39pA1JR4N3Mo7YQCEMRpTqBkxuBXA/Srnd
 1Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=AuJlaHKuyVu7EKYDjhJnZAYNsBzoL+I5XdtiyNwUB54=;
 b=e3yU/N6L+0KYxe2n3wcpVVWmiNkJRC+SFsxZN6IxFus2lYoCTune3CuNPtLXFViyEr
 C8qEvXhETUbw9tU68iESy7WI+1+hELvY/ZepzYxU9lpiLsLthlLz12hz/tnNd9bd/Ey5
 kj4f8PdrKbZAqVOZXN2CXgVdZ5l05IYnSR6Jic4ZkLsEX+FkwKMBvRLumyNjsaQ3s+d0
 bPbqTxlWe9JR8opHvCCC+QN/0outEa5ee7Gl8On3JwQwClJ0TMAF+i76ExnfVowb6yNB
 YfGfC0az4IfIrG/QsutQGOjlgi6mnxkwvRp8zi0dX2vj84CHhQCLKsX+Okh6cJ0ofZds
 x/1Q==
X-Gm-Message-State: AOAM530Bi79A7ujI+f6bUZdzVkT7SSoJalgVNl+eRBBzInAi4g5wVxEX
 GJ130+KkMFV9JLXO3/x+kBM=
X-Google-Smtp-Source: ABdhPJyg1kTuazyv0gYP9JVDRkJR66fclJil4yhXsDYiTCoujxLiWZnlwxNtnXGyZDr1BBxwQ+EKgw==
X-Received: by 2002:a1c:a304:: with SMTP id m4mr16536385wme.49.1593419148990; 
 Mon, 29 Jun 2020 01:25:48 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id g14sm14625647wrm.93.2020.06.29.01.25.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 01:25:48 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <20200626170221.28534-1-andrew.cooper3@citrix.com>
 <9822c557-655b-67cb-c513-60039dbe0d8d@suse.com>
In-Reply-To: <9822c557-655b-67cb-c513-60039dbe0d8d@suse.com>
Subject: RE: [PATCH] xsm: Drop trailing whitespace from build scripts
Date: Mon, 29 Jun 2020 09:25:47 +0100
Message-ID: <000601d64dee$e47b2840$ad7178c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIxqs/FMOzqZHKIY0/vJ+L/6kqMnQGJHYPCqCw+/UA=
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
Cc: 'Xen-devel' <xen-devel@lists.xenproject.org>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 29 June 2020 09:22
> To: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Xen-devel <xen-devel@lists.xenproject.org>; Daniel De Graaf <dgdegra@tycho.nsa.gov>
> Subject: Re: [PATCH] xsm: Drop trailing whitespace from build scripts
> 
> On 26.06.2020 19:02, Andrew Cooper wrote:
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> 
> Since we've not heard anything from Daniel in quite a while, just
> in case:
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 

This is pretty trivial cleanup so, if you want to put it in 4.14 consider it...

Release-acked-by: Paul Durrant <paul@xen.org>

> 
> Jan



