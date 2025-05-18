Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70BCABB016
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 13:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988999.1373352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcG2-0008VC-T0; Sun, 18 May 2025 11:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988999.1373352; Sun, 18 May 2025 11:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcG2-0008Sc-Q1; Sun, 18 May 2025 11:32:42 +0000
Received: by outflank-mailman (input) for mailman id 988999;
 Sun, 18 May 2025 11:32:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wvo5=YC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uGcG2-0008Hz-04
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 11:32:42 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce877166-33db-11f0-9eb8-5ba50f476ded;
 Sun, 18 May 2025 13:32:40 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a108684f90so2377181f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 04:32:40 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88a34sm9064017f8f.70.2025.05.18.04.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 04:32:39 -0700 (PDT)
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
X-Inumbo-ID: ce877166-33db-11f0-9eb8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747567960; x=1748172760; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DUw1+po8yRZDZl8O5oIFcz+dPtTqviLAjE8T18Oia/Y=;
        b=JdAFxvak9gCv1hqbD2T9psEk8aMbL+3z9ylBFG5vQmyYK1auvsB9Sj5jZ0KkdBxMP7
         tDMqFBwnTwSZt+XcWBdmJlZ1tBUOMVxkUveuBglnIF2tNRqsDbpJCcCs9qyxGQQfgPlv
         YHEdfnvtf59VMBIoP0RJJdgqmrpxm3UnIVFkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567960; x=1748172760;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUw1+po8yRZDZl8O5oIFcz+dPtTqviLAjE8T18Oia/Y=;
        b=KFF0dT+Rk160bMJI2uMyJmbXMN6swfU8m8fbqhqP6pNwXhTPv3/mzzV2+rDoFp8Wvq
         ABAQ5TMke8fhXrb7iAQA1atNC2FojqycqQWCfrszRD3zrQFVlkXVCkpAmDj19+3nWfF+
         PzB2FY3l+bYm7pLLnKSslkPlL7EfZ+8ixJjoiSwncKp8KRdxTO5pYWta95o8Ft/As47J
         S6/+mHs/plC5+GwDUtTgNN6B/99n4aqbZJv0SeLOYWeC8pdkGOX8BOEoIomEpXokJpcN
         5PSVXS48HJBZGzmq6Sytg5GLWizfblR+mEwyTzi0kJIoPX0ql1semEs30a3y2ox6/QTt
         39Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXkiJA+zuiWoD4yIoxuTYsEcVDyp7TOujqY9khxlMhR0B2oBaYrTYq3Bjs3C047wWtHr+NqjVJa4y8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkkyJIcMSFVGPiitxZ9/C0cnWfyYMRpQ+IuNHuiVeMtPMJGLj3
	OT6fiWDReL6CYdHp4AWTxWv4dghU+2XRKZTFggyysiCNTvJzWPqjLJPN/n09S8HXo6Q=
X-Gm-Gg: ASbGncu01F1QUOhAj62VzkBpL5mGuGYsBTcGYF9++pOVezA9SZA3FpjLFTykxls0IC+
	43VZuOtWUKjYPIEF+lJfYBfMPPz+VCJMEtWjJSIAbrLL96jZVE3lRwKSg0j1dQBg2lPfYbnZzWJ
	O2MY3Y20CIwfLsR7lu90NB/1yqG9PRhssmrorMDFzmcDZT3KGAGwp7aqIGeh8UD7i+0Lffzs7hy
	FWfNfcpGA0afnpgux3mU/fs1FyzHhqtiC003VwKwTBaKjl+1k90ENk3oR8YBZRLAdzmOeIlaoAD
	/VdyjIZiNGLLIEPbD9Q74bUnWVYEmggOh5OcJEf5e83K2WnPxIhgk9k8V6bO+Jy0CUtrWfb2Seb
	dWftDJAWYnp2uqd5Y
X-Google-Smtp-Source: AGHT+IEfbnJCpKXqrGSjr8rdMcaYTKRfTCePkPmrTfMwrk+57WfWXVk7N4tlqHcD8MJQSUgD7nqb4Q==
X-Received: by 2002:a05:6000:240a:b0:3a3:67e6:d27c with SMTP id ffacd0b85a97d-3a367e6d3d6mr3911060f8f.38.1747567959986;
        Sun, 18 May 2025 04:32:39 -0700 (PDT)
Message-ID: <ad43f878-1261-455b-9e51-8ce7fee36c82@citrix.com>
Date: Sun, 18 May 2025 12:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Request for patch to fix boot loop issue in Xen 4.17.6
To: Maximilian Engelhardt <maxi@daemonizer.de>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Cc: Ngamia Djabiri Julie <Julie.NgamiaDjabiri@student.uliege.be>,
 pkg-xen-devel@alioth-lists.debian.net
References: <DB9P250MB05235527B537774F77EB9E26A08D2@DB9P250MB0523.EURP250.PROD.OUTLOOK.COM>
 <ccfce0be-8208-4431-b93d-da0e63f3552e@suse.com>
 <2911767.Y6S9NjorxK@localhost>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2911767.Y6S9NjorxK@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/05/2025 12:24 pm, Maximilian Engelhardt wrote:
> On Montag, 12. Mai 2025 10:54:50 CEST Jan Beulich wrote:
>> On 03.05.2025 16:02, Ngamia Djabiri Julie wrote:
>>> Dear Xen developers,
>>>
>>> I would like to ask if the following fix can also be included in Xen
>>> 4.17.6 (and eventually in the Xen versions after 4.17.6 that don't have
>>> the fix) :
>>>
>>> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=dd05d265b8abda4cc
>>> 7206b29cd71b77fb46658bf
>>>
>>> This bug causes a boot loop in nested virtualization environments (for
>>> instance nested environments that use VMware Workstation), making Xen
>>> unable to start. It was introduced in version 4.17.3 and the fix has
>>> already be included in 4.19(.2) and 4.20(.0) and woud be planned to be
>>> included in Xen 4.18.6 in the coming weeks.
>>>
>>> Even though Xen 4.17 is in security-only support, this is an issue that
>>> blocks testing and usage for users and projects such as Alpine Linux.
>> I fear I don't view this severe enough an issue to break the security-only
>> status of that branch. People concerned ought to simply update to a branch
>> where the bug was fixed. Or the distro could include a backport.
> The Debian Xen team now got a request to include this fix in Xen 4.17 in 
> Debian stable:
>
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1105222
>
> We understand that Xen 4.17 is in upstream security-only support and thus this 
> patch will not land there.
>
> Debian can take the patch if it's confirmed by upstream Xen to be fine for Xen 
> 4.17 and low risk. We had problems in the past with incomplete backports of 
> patches that turned out to cause regressions, so we try to avoid backporting 
> patches without upstream Xen confirmation.

Yes, it is safe.

https://github.com/xenserver/xen.pg/blob/XS-8.4/patches/backport-dd05d265b8ab.patch
is the backport I did for XenServer's Xen 4.17.  I don't recall there
being any conflicts or problems.

~Andrew

