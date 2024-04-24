Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF968B0A4A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 15:01:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711437.1111412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzcFK-0004ji-DH; Wed, 24 Apr 2024 13:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711437.1111412; Wed, 24 Apr 2024 13:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzcFK-0004h5-9t; Wed, 24 Apr 2024 13:01:10 +0000
Received: by outflank-mailman (input) for mailman id 711437;
 Wed, 24 Apr 2024 13:01:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RmhA=L5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzcFI-0004gt-SI
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 13:01:08 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6ebf509-023a-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 15:01:08 +0200 (CEST)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5aa4204bacdso4018253eaf.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 06:01:08 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 i6-20020ac87646000000b004377f87147bsm6015666qtr.69.2024.04.24.06.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 06:01:06 -0700 (PDT)
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
X-Inumbo-ID: b6ebf509-023a-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713963666; x=1714568466; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JNddJ5SL36xynIazkoX3Jrx5SgGYvPv5TYSv+gHNmFg=;
        b=cAPrxdSBzJH72FIIty1sMml8GoTbczHIhAtHmFyVBBifE1KO2bky7mA3/Vfd6dGF6N
         FEe9Q6gNWKEIOkVDsQry0S2ubnG0rnMTlElh7zSPVo/cerjv2O/3zDGQBQ+JCI+F8OMv
         VEpj3zW3Rgvf6koG6UG6bMB4Uj+c4cZb+GcvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713963666; x=1714568466;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNddJ5SL36xynIazkoX3Jrx5SgGYvPv5TYSv+gHNmFg=;
        b=BdveUhUDzysh0jYFu+QuxOJzm3PQBWXS6z1NtJ9wui7r+N7o2hw9C29kEwEH2IbBLX
         Nqw2uBy+z63L+TvRe6/wdxJNbyl4zfD74s2XcpRk66ODClr7UYRnHzc9zqvRKwi8NppY
         ylWEI34IMA242x8eNoJS57YZR963/hm7CYk5jLV3buKtI6NRNxJ9EQz0pWnDaGHEAvCU
         866wJK0RvnNWlEYhpoUoFUKvIV+Abs/iY3JBsEGTAge1sXBE5UuGXF1qNHJL++FV57gY
         IDpgIO1Z5lqdRr8phDokau6PQlz12vDEhoWisSTnRqLsvfJU6Mu/N4pKgCFssTP7mygs
         rWgA==
X-Gm-Message-State: AOJu0YzcEhVi1q/dUQMHud2j57dnaDHodq/W3naEZ8PUqCoFzhqffdWN
	KysRab/PjDRnCB5JRNtly3i/OEHDhqIAo0qXJP+HWckcR5f3MF5bkFL6vGISPW0=
X-Google-Smtp-Source: AGHT+IHkk0aIEvSsII2USdraviI9Pop/uTbRrizdoV6nyR+voBubUNZAMCDLUh2hcPjcg4JsolnXWQ==
X-Received: by 2002:a05:6358:4b02:b0:17f:5ef7:15cc with SMTP id kr2-20020a0563584b0200b0017f5ef715ccmr2582221rwc.3.1713963666571;
        Wed, 24 Apr 2024 06:01:06 -0700 (PDT)
Date: Wed, 24 Apr 2024 15:01:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 3/4] x86/paging: vCPU host mode is always set
Message-ID: <ZikCkB3l--p5bORk@macbook>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
 <67805c1f-7187-446c-a5c4-14be8f170f11@suse.com>
 <ZijSFzOAeo1SfSrb@macbook>
 <ea6c1806-e8c3-4c0a-b3ad-a7550b66ba59@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea6c1806-e8c3-4c0a-b3ad-a7550b66ba59@suse.com>

On Wed, Apr 24, 2024 at 01:41:25PM +0200, Jan Beulich wrote:
> On 24.04.2024 11:34, Roger Pau Monné wrote:
> > On Tue, Apr 23, 2024 at 04:32:32PM +0200, Jan Beulich wrote:
> >> ... thanks to paging_vcpu_init() being part of vCPU creation. Further
> >> if paging is enabled on a domain, it's also guaranteed to be either HAP
> >> or shadow. Drop respective unnecessary (parts of) conditionals.
> > 
> > Is there some commit that changed when arch.paging.mode gets set, so
> > that this is actually safe to do now, but not when the code in
> > paging_dump_vcpu_info() was introduced?
> > 
> > I get the feeling we want to reference some change here in order to
> > explain why is now always guaranteed to be set.
> 
> I was indeed meaning to, but when I found the same even in 3.2, I stopped
> searching further.

Fair enough :).

Thanks, Roger.

