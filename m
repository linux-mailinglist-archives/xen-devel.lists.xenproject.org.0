Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1C457E4F0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 19:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373399.605595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEw1H-0003k8-Dx; Fri, 22 Jul 2022 17:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373399.605595; Fri, 22 Jul 2022 17:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEw1H-0003gy-Ah; Fri, 22 Jul 2022 17:00:55 +0000
Received: by outflank-mailman (input) for mailman id 373399;
 Fri, 22 Jul 2022 17:00:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEw1F-0003go-Fa
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 17:00:53 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7b66267-09df-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 19:00:52 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 h206-20020a1c21d7000000b003a2fa488efdso2979615wmh.4
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 10:00:52 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a5d548d000000b0021d8b1656dfsm5000160wrv.93.2022.07.22.10.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 10:00:51 -0700 (PDT)
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
X-Inumbo-ID: d7b66267-09df-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ybomNOJkP9mYTlFH/CeNcETmX8OuO8axxo3LlgQXCSs=;
        b=LnHSpk0wlCrHGbs/3CB706PvBjgqWdASaC96xsMyjrnq0QwZL5pEiy/iy+cX5I78rm
         KE0fTOT11fUxGLZZK5GC/vUGJ+WUKo/tYkc5Mv5O8hKLysDZ0XohhQAg1UTVg4fcgGLy
         7WSv/SZoutpmg8Q1waV6V5i7kvilOGwFU8AWoKJs6D4wAUFym2IfS3WMe/d+OEcwcI86
         FR2RBw4MFp96+l5dMsWvQ9TyJXP33eQND5O9llu7tQslWF0w5kxApPc6Dn32fFKU3q2p
         tclzy0IzFWQnSRc5rlo4Ga1FgsupbVC70DhB4xaFvq8zHISweh9qox23Ipggha+mvQfc
         3TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ybomNOJkP9mYTlFH/CeNcETmX8OuO8axxo3LlgQXCSs=;
        b=pEM1Alk2PNBapdlBLP3DVhjzbcCTQKWrFhdnj4ehNnXhmOz1HXlL84qJWnYC7s5+i2
         PgK1AFB59z4Y007d2rJNGeYiCHiYn7wwJtLFEDR9dDvSmjmu7imn1KnisxLCq4Ue1FrH
         LycikAtlaFyOAA93CU9sT8J3fgDAUNMBc1dDjHIhDlfuSJaiibwaptYZNiec1/Ap9aMu
         SX99nZh5oTM2Dej2peqCT7zcJ0pctzGXZQzHtq6yP805vQ9sRbT4TiAdLKfjC5D57/e4
         9GgAzUOthbyKNCw+NYyewQhQxnp18CXdZcRU2RtYibaHLeHxi0SeYUr4sT0C09wKVpKF
         q/cg==
X-Gm-Message-State: AJIora9gD/ePRx3KHFdzSX5ysa2o/oUQ7IPOVZ3Pw7fnwgzmE5E8PdZw
	/nocasDSNzPBnBheKzPCXdM=
X-Google-Smtp-Source: AGRyM1trvXqK+BtxPRYA2QKuonRK8srXHf0OUgsGDlb0GQ2cVcQoQ9Kv9b1zfpyu7DWnvh1UtKISSA==
X-Received: by 2002:a05:600c:35c7:b0:3a3:2612:f823 with SMTP id r7-20020a05600c35c700b003a32612f823mr466880wmq.33.1658509251793;
        Fri, 22 Jul 2022 10:00:51 -0700 (PDT)
Message-ID: <a623ebf9-c21c-9a6e-25f1-efe69a09adaf@gmail.com>
Date: Fri, 22 Jul 2022 18:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 10/14] VT-d: free all-empty page tables
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <28b6c824-683c-6a15-d891-651f79d99300@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <28b6c824-683c-6a15-d891-651f79d99300@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:48, Jan Beulich wrote:
> When a page table ends up with no present entries left, it can be
> replaced by a non-present entry at the next higher level. The page table
> itself can then be scheduled for freeing.
> 
> Note that while its output isn't used there yet,
> pt_update_contig_markers() right away needs to be called in all places
> where entries get updated, not just the one where entries get cleared.
> 
> Note further that while pt_update_contig_markers() updates perhaps
> several PTEs within the table, since these are changes to "avail" bits
> only I do not think that cache flushing would be needed afterwards. Such
> cache flushing (of entire pages, unless adding yet more logic to me more
> selective) would be quite noticable performance-wise (very prominent
> during Dom0 boot).
> 
> Also note that cache sync-ing is likely more strict than necessary. This
> is both to be on the safe side as well as to maintain the pattern of all
> updates of (potentially) live tables being accompanied by a flush (if so
> needed).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

