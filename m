Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EA457E4EB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 18:58:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373393.605585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvyY-0002JU-0A; Fri, 22 Jul 2022 16:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373393.605585; Fri, 22 Jul 2022 16:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvyX-0002FZ-Sj; Fri, 22 Jul 2022 16:58:05 +0000
Received: by outflank-mailman (input) for mailman id 373393;
 Fri, 22 Jul 2022 16:58:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEvyW-0002FT-Et
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 16:58:04 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72e243f7-09df-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 18:58:03 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id bu1so7292449wrb.9
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 09:58:03 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c48a600b003a2f6367049sm5098110wmp.48.2022.07.22.09.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 09:58:02 -0700 (PDT)
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
X-Inumbo-ID: 72e243f7-09df-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vACh0L6pvmXIZw/x+RdnP68YD9pUSN3ZhhaRo9VbPZs=;
        b=mEKwJmL7mY+I23Hym0BPvLNPulC2HRHwSHocY7odvIDnGwp5lswEvsr4aq5OVk9s7n
         Jvda2DG9LXQqbAjfJXhQcWIvya4Jz+C3ZybKhczOn6XLQbG7jR2+SjZNQWMsi/xCJA79
         8s/ZABzGFVyl5lzuT2BGurV1lRkum+k2YpqTzPp5Iiw/SemAWftxvCRkgFZ6gaF/YqqJ
         ObxOCLHuA+Q9byKYyll+o0byRQaTa3NXuSb9p6kRmubI1Jde5PrLsbxHM6XCnbwPHcAI
         qz+i4jnGPvbTsFmYto4SxTf9PKr93KRPMmPJNTk16JRgllVsD9VusChJXN/kvlj8uOaK
         nJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vACh0L6pvmXIZw/x+RdnP68YD9pUSN3ZhhaRo9VbPZs=;
        b=eixP1n0Y73sQOLljRM/zCgtHEFLuNuM9mHUjIAivfGUcf2ZuOkR4PZYgWsesO+0Zpg
         gEHTslz8RjW70pIj2jGszebGTKyz9eIR4+CnFPJiexUUjB36PFIsC/cpYq0qTrBFlJ02
         Z/fxQIb4cXFU242kgWoWJaarXMT+MeLMZchgXdaLvHnBHLiEpl2hAkrKxBeOP1PHyAU4
         R5vosA5kOEk2Scg/lIqoOOdMoxkSNQHTdCcp2eRevIzxpmuUeHF4coy6m3RvesEfbM/F
         FrqTRjL5CTIQVTxiO+guQyEerRLaLaYIOE3VwAGknP2eBBGc4J0TWI5oBw2j2UFLf5P2
         MReA==
X-Gm-Message-State: AJIora9eRHF5XFnkrfwf152Sd+o/cyL6A7rGBb/mVAOTsDVjDCYlaP9e
	7hYuPfbVBRGaPomigTdybP4=
X-Google-Smtp-Source: AGRyM1tO4mq5fA2zvdxk7UkCnawvsPMRD9yS4jlEdxM4xk4Wg2JOCQryzwQ0sNj45/5RKLEP2isD+w==
X-Received: by 2002:a5d:4304:0:b0:21e:3161:4aa2 with SMTP id h4-20020a5d4304000000b0021e31614aa2mr531730wrq.581.1658509082727;
        Fri, 22 Jul 2022 09:58:02 -0700 (PDT)
Message-ID: <3ae54e6c-7e16-36fc-6b2b-afd2cad7e8f8@gmail.com>
Date: Fri, 22 Jul 2022 17:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 09/14] AMD/IOMMU: free all-empty page tables
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <8b375834-5f36-c1d5-f13d-dc9bb7b53134@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <8b375834-5f36-c1d5-f13d-dc9bb7b53134@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:47, Jan Beulich wrote:
> When a page table ends up with no present entries left, it can be
> replaced by a non-present entry at the next higher level. The page table
> itself can then be scheduled for freeing.
> 
> Note that while its output isn't used there yet,
> pt_update_contig_markers() right away needs to be called in all places
> where entries get updated, not just the one where entries get cleared.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

