Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBEA57E485
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 18:37:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373351.605506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvdq-0004DW-It; Fri, 22 Jul 2022 16:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373351.605506; Fri, 22 Jul 2022 16:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvdq-0004BF-Fq; Fri, 22 Jul 2022 16:36:42 +0000
Received: by outflank-mailman (input) for mailman id 373351;
 Fri, 22 Jul 2022 16:36:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEvdo-0004B9-Tj
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 16:36:40 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75bd2908-09dc-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 18:36:39 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id bu1so7217549wrb.9
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 09:36:39 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600012c400b0021e4829d359sm4999224wrx.39.2022.07.22.09.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 09:36:38 -0700 (PDT)
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
X-Inumbo-ID: 75bd2908-09dc-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1/GIfOsmvCDNYzoGrWM27SqOzkUgoHSo67253yQixbM=;
        b=U0G+1rJ18wtbbUtZ8gkcUS+t7Cdjj4AMGJbDbABVknPvwpRK1F8YBuASd/n7c/2ljw
         S8OO0B/UmHodet1uod+/gTvBnsO+kcrF7BPIbmspXVY/j3/jCv4+/vCp8OziqlrJF9qT
         tRVs0T0qqny6NUhEf1SFkKypvH3EnZXFyXZvppYNuEmiEs7gOyEtuZyN+gyTARYcHerm
         uX+wAjY2zB1tTjC7gBbuZFa73Ehu1/TMGVGfGq0q2Nx5fqbYSQlwKDx8N7OJhXwCvHP4
         RC5gOXBkERPZL5SGUjPYSOIpJqCuURqsLSXaYSp9HqerQh0ND6hMYL3qQl02XNWbYjGz
         P3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1/GIfOsmvCDNYzoGrWM27SqOzkUgoHSo67253yQixbM=;
        b=sYcz4MmqtGFjTx4YysS3EXMQZ0w4ixrGqFn+VgcD6vFUSvZSaNSKrPPqHoE3oQSsO3
         bhACc/d9gLXRVVHI+8EqOhdM5gONpVx65TtYJydT4In8ZO3rY+4P62iUMMMcxCdJBXS9
         t++El9hS0AHrIvjvky8t7Z12C2UxTIGhHeL2UzDUQOJ+ohuScHuC3YuvamKXchT5RaE5
         RDwpMJG1h6MwoS7/znFdG8xS7j6Wbgbp9j39UE8J3uosBCJzcpJDgAM3KWGy8WQGJON7
         8h8IE28W5Go7EsWyVIGzcOY4JyxbnmVkVQfeRB63p6PMVC1BCt58pD0UnX7oWtkVcVkP
         DZOQ==
X-Gm-Message-State: AJIora8OQErTICneXzJzWMCxz2YtcxYRXXoD4efnoQ3MukExRJxk2Qmr
	8g2jG39yHBZ7AKcOUBkgjzw=
X-Google-Smtp-Source: AGRyM1tGyI8GcBZgrLrUq7b+FTc1OoBrmfq5SaIUp6dPXYg8afuo56R7z9blGkuczpCFGD+BiXyyDg==
X-Received: by 2002:a05:6000:1888:b0:21d:beeb:7873 with SMTP id a8-20020a056000188800b0021dbeeb7873mr492082wri.393.1658507799249;
        Fri, 22 Jul 2022 09:36:39 -0700 (PDT)
Message-ID: <23730379-9a06-00a5-1ea1-6ffe880814a7@gmail.com>
Date: Fri, 22 Jul 2022 17:36:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 02/14] IOMMU/x86: perform PV Dom0 mappings in batches
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <1adca369-c911-e126-6b94-b26859a01e5f@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <1adca369-c911-e126-6b94-b26859a01e5f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2022 13:44, Jan Beulich wrote:
> For large page mappings to be easily usable (i.e. in particular without
> un-shattering of smaller page mappings) and for mapping operations to
> then also be more efficient, pass batches of Dom0 memory to iommu_map().
> In dom0_construct_pv() and its helpers (covering strict mode) this
> additionally requires establishing the type of those pages (albeit with
> zero type references).
> 
> The earlier establishing of PGT_writable_page | PGT_validated requires
> the existing places where this gets done (through get_page_and_type())
> to be updated: For pages which actually have a mapping, the type
> refcount needs to be 1.
> 
> There is actually a related bug that gets fixed here as a side effect:
> Typically the last L1 table would get marked as such only after
> get_page_and_type(..., PGT_writable_page). While this is fine as far as
> refcounting goes, the page did remain mapped in the IOMMU in this case
> (when "iommu=dom0-strict").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

