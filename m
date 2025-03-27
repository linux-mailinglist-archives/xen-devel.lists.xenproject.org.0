Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB5A730F6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 12:52:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929127.1331749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlmM-0000DP-Jh; Thu, 27 Mar 2025 11:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929127.1331749; Thu, 27 Mar 2025 11:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlmM-0000Av-GL; Thu, 27 Mar 2025 11:52:10 +0000
Received: by outflank-mailman (input) for mailman id 929127;
 Thu, 27 Mar 2025 11:52:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txleu-0003v3-Da
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 11:44:28 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3b1ec96-0b00-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 12:44:23 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2243803b776so28039125ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 04:44:23 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73905fab1bbsm14528907b3a.17.2025.03.27.04.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 04:44:21 -0700 (PDT)
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
X-Inumbo-ID: d3b1ec96-0b00-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743075862; x=1743680662; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uU/A+L9dsiDTikhueZRE5xiAXJ92adxcVVEhQD5XonU=;
        b=jop5z0tLvCqm8fhY3gi0CdIYuQzvRjFSROO+Ml8zc7UmS1dJzZ+HGnLo12CVd58k+m
         YIjuYrq8fYUsLuJwRp5OcRlnkmmnLyqma8bu3vcnQoXDbbwmyoEzPcNaPwi5ajr8I/l7
         QV5ie/ylDiRskK6Jr1+BEayjz+PnyCXhi78II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075862; x=1743680662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uU/A+L9dsiDTikhueZRE5xiAXJ92adxcVVEhQD5XonU=;
        b=u0Qk18Ib8ZEf3GqhsR8h1pMcMcU4TEiQPu0Sk+l49gShM98Y8ioUXINOyb3xp8UpIm
         ULTlpIvnNMb/qTDVxVyhhpiGRLydz10nT7tEOVkPKBZxDr2pKx5QVKvqi0Qp3dajq5Ne
         8UDxr+0IUZf4SywNhNEk6wXQ2SURUN9xD8Xsiuv7X7FUpEuCj240TRRA1XN8NbtdsDzp
         B6vv4mfyiFuRsKAKrQO8u8H9hG5/E6dxO/yMI667qf0zwUxzkPzgNuQr133/86rIH8en
         Y78xXS02fNYejyr83LCBb/BN7rS0zJERuwgyLrTS+WODuKCFsNKaWJFkKXGdmsK6gYwW
         yIng==
X-Gm-Message-State: AOJu0YwSs3h1zN5520tNzApxStpdsxV0K+nhEc5Fu0chPu6HStfrjuYW
	zWiz/aqpgGsjUmL5Im7T4cBbbxggAu6trNk+f/yKzhQei3yJRx+++dPcw4FVVeo=
X-Gm-Gg: ASbGncsQutjh1097AJDLAZf/cfV455qZAj7Kwv4dRaKgntqEMvfdDDn8uyjA0IuLNjC
	J/JX9QQ88KGwi+YxaG561sNfWB65YOww/v091bj8wicbor62vcj0l1ApHurt7ulBwuShdRZYN++
	+5Fcl5LCHMklTIqPVWUGmuf+2GJMfXtOwyuEX5OIUtQHobXJyXGd86stw4oTSjDgzOIGNJIcGoI
	UrigUO8XsQVXKz9aHVekpJqT9kb8c9jMX3bdMMd2/FrdbqXJ7f+2c9tWJyVgutyctWAi194is7/
	uiu0uAUciw6O3Vy/LKBqHC0mMIBHGTSZu3+1o1kVv+7qbZ39S0/7qAt6hAh5
X-Google-Smtp-Source: AGHT+IF1zh5CzP+2sB19YkVPwCooBw5Ad6DNVqCKSBM9muR1Lopu3bJbq4PNTNEJB+MOTee3AXkyow==
X-Received: by 2002:a05:6a21:700f:b0:1f5:7007:9ea5 with SMTP id adf61e73a8af0-1fea2d480eemr2731418637.2.1743075862103;
        Thu, 27 Mar 2025 04:44:22 -0700 (PDT)
Date: Thu, 27 Mar 2025 12:44:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/P2M: synchronize fast and slow paths of
 p2m_get_page_from_gfn()
Message-ID: <Z-U6EdAN_dnDnD3J@macbook.local>
References: <b590b590-764a-4dfe-9e13-975122790329@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b590b590-764a-4dfe-9e13-975122790329@suse.com>

On Tue, Mar 25, 2025 at 08:17:04AM +0100, Jan Beulich wrote:
> Handling of both grants and foreign pages was different between the two
> paths.
> 
> While permitting access to grants would be desirable, doing so would
> require more involved handling; undo that for the time being. In
> particular the page reference obtained would prevent the owning domain
> from changing e.g. the page's type (after the grantee has released the
> last reference of the grant). Instead perhaps another reference on the
> grant would need obtaining. Which in turn would require determining
> which grant that was.
> 
> Foreign pages in any event need permitting on both paths.
> 
> Introduce a helper function to be used on both paths, such that
> respective checking differs in just the extra "to be unshared" condition
> on the fast path.
> 
> While there adjust the sanity check for foreign pages: Don't leak the
> reference on release builds when on a debug build the assertion would
> have triggered. (Thanks to Roger for the suggestion.)
> 
> Fixes: 80ea7af17269 ("x86/mm: Introduce get_page_from_gfn()")
> Fixes: 50fe6e737059 ("pvh dom0: add and remove foreign pages")
> Fixes: cbbca7be4aaa ("x86/p2m: make p2m_get_page_from_gfn() handle grant case correctly")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

