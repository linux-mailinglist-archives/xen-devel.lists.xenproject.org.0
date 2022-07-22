Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C757757E512
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 19:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373412.605617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEw9C-0005FN-FU; Fri, 22 Jul 2022 17:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373412.605617; Fri, 22 Jul 2022 17:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEw9C-0005DP-CK; Fri, 22 Jul 2022 17:09:06 +0000
Received: by outflank-mailman (input) for mailman id 373412;
 Fri, 22 Jul 2022 17:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEw9A-0005DH-Up
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 17:09:05 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc84104c-09e0-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 19:09:03 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 u14-20020a05600c00ce00b003a323062569so2836084wmm.4
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 10:09:03 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfe2c1000000b0021e491fd250sm5140518wrj.89.2022.07.22.10.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 10:09:02 -0700 (PDT)
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
X-Inumbo-ID: fc84104c-09e0-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Qe3ukPZg5wzIjZ2k3fZ/Lhr1bZPPOrRSOqV2qo6wUKA=;
        b=FldCeIrjDK+4cq0YnhVAsd2McaFQN/z//93aCJRYrIxU5VWULpxb4YWhxWQBpFYq1I
         kOhZpBQzBNFZi+wAheSAcTFEG27lZckemCYSsJ4TcjVZaqjlsQd4Bd0/Lzc9GqOr+itw
         ywGj1F0jWAE6mMgQ+HIIll/VHf8D4pJmb8kc5kdFZ8SSkyYDXu7z2vYKoQIHJh49s8G9
         dwAvSAw6Gf4jNIhrnpFjz4+ob1MJ6lO3lEpKPuyI9ypuNzRDQJD5nFKW1K3C81Qf+MhH
         0i8urKMSAyEjIppbjM2rbUtq9exUYxyMoEHXBAkPxul01kQ0uC3xCJbl0SbZTAS6ZdZI
         gWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Qe3ukPZg5wzIjZ2k3fZ/Lhr1bZPPOrRSOqV2qo6wUKA=;
        b=3xZQQCjJxjcGl1nTrNJxsnzrJKDTK86B5c9ObLCYwaSKM891ZHQKZuJCse5BZyrour
         +3TY/kfxII1X2zunu38d8E/7qJ0GIkxBvjApiu+p4tjdCnz29n6egZA7qzfJs+T6qfPG
         gQ4kuYvAPXm5Dz03uHc1mW3DYzZSjmYS3DsXwz/7fwEey8vC3lIHVJiryx3zyUrhHHaQ
         y5AkJ3M8COK0ntKETnrQD5RbXU4TngBJgE/m8WHFAvUCsNNzokR3Y2OqCyCVJzE5SfAM
         8w0CKE8EjyzSLrfn6Rp5xj+Sf93RyXe92MYpyGQksbzlYBJgmQP4j131S/K7yHA3AlCm
         Nx8A==
X-Gm-Message-State: AJIora+sA/1r755yzIYB5omzZHIIW1PyEKqY5Wx/TWSqqLPZacgSl+5B
	Qt9xvd27jdWhj2O4xGhROdU=
X-Google-Smtp-Source: AGRyM1uVUuQtVdnL4hhl9TC6r53jpVlcirM6kiUkzDWiuSrmvmdQ9EVyqhMpyh4rSYNtU8suRda+oA==
X-Received: by 2002:a05:600c:218a:b0:3a3:276b:7a17 with SMTP id e10-20020a05600c218a00b003a3276b7a17mr13072765wme.15.1658509743062;
        Fri, 22 Jul 2022 10:09:03 -0700 (PDT)
Message-ID: <23e2221d-0d17-ed9c-d1bb-9a23289d9cee@gmail.com>
Date: Fri, 22 Jul 2022 18:09:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 12/14] VT-d: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <9ccc854e-9a8b-ffed-cd68-d26e5b3347ec@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <9ccc854e-9a8b-ffed-cd68-d26e5b3347ec@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:48, Jan Beulich wrote:
> When a page table ends up with all contiguous entries (including all
> identical attributes), it can be replaced by a superpage entry at the
> next higher level. The page table itself can then be scheduled for
> freeing.
> 
> The adjustment to LEVEL_MASK is merely to avoid leaving a latent trap
> for whenever we (and obviously hardware) start supporting 512G mappings.
> 
> Note that cache sync-ing is likely more strict than necessary. This is
> both to be on the safe side as well as to maintain the pattern of all
> updates of (potentially) live tables being accompanied by a flush (if so
> needed).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

