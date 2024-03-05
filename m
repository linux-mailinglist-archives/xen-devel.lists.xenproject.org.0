Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD36D8720AF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 14:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688803.1073422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhV85-0001kc-7B; Tue, 05 Mar 2024 13:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688803.1073422; Tue, 05 Mar 2024 13:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhV85-0001hs-4b; Tue, 05 Mar 2024 13:46:49 +0000
Received: by outflank-mailman (input) for mailman id 688803;
 Tue, 05 Mar 2024 13:46:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXiD=KL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rhV83-0001hm-TG
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 13:46:47 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceeee53e-daf6-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 14:46:47 +0100 (CET)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-7882e94d408so139098085a.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 05:46:46 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 a15-20020a05620a066f00b00787cb0062cdsm1508702qkh.35.2024.03.05.05.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 05:46:45 -0800 (PST)
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
X-Inumbo-ID: ceeee53e-daf6-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709646406; x=1710251206; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vb190brPG5Rw20LTXSZPBr7sl3VdbGvfGp/atN9FAjI=;
        b=BJXui+BjUGdUx/qfR4o5nl1gBue+lP/xpoxioMDcl+jfwxsmDl7xTnOhTKR6+7cupt
         6VQ/csG8iw+QFOlfMgbMgf8Ax/pFJRGTvOYYmHFKKEjpUZt0/LKHdzzEq25+AFbSLUmv
         ICLT0/VDbgOjJfJnMjUN+FvHoovIjd7Ngsamw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709646406; x=1710251206;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vb190brPG5Rw20LTXSZPBr7sl3VdbGvfGp/atN9FAjI=;
        b=SYmUuj/YxN/UTrkDQasQugsIClUrxdeUU5AuAAe1isjFQ9NIki2Ga5bVQaZmhdDlFo
         7l2jcmZjhBrEWweYhnVGd+UCokH+T0XFPbwQ5lvXUvHO4Q1OzMrba5b/eNqGs5TTnGMe
         4W6mJihyvvSYXlIltU9Zueez2IfYEP5mnscOQyjQJYh31kYDB4j2eMGBkqk2/+47DuP7
         ctJhV/0A/IMUu36QmQluZgB2RQM43barSlkZYtvggGwTmGmVccCSvtY8xCdP72ADyutY
         fnKcemdehqNQet2/Nj5W/N51K9a65Ue6QPWzLuTzzzgiwLi+7ffFGPm9BqQ77xQXnH8t
         A+yg==
X-Gm-Message-State: AOJu0Yy95bu5MpgYjLRa644u8pq/T1/QlYarBpa3XvJfflaTM/kih56y
	2qLCZLLv1iPiOKPwia9/8nvZIAxnn6cDjoafny5YqFjZuHiGtuwTOapWwOMU8vE=
X-Google-Smtp-Source: AGHT+IF4IoBCHdBHpxQxgqenhqQ1Jp1gJpkiljRLSgGwS3+j6jLW19NamgBv0+cKHwfwyCWSL10IHQ==
X-Received: by 2002:a05:620a:40d0:b0:788:2ee8:5e2e with SMTP id g16-20020a05620a40d000b007882ee85e2emr2425818qko.66.1709646405761;
        Tue, 05 Mar 2024 05:46:45 -0800 (PST)
Date: Tue, 5 Mar 2024 14:46:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] xen/virtual-region: Include rodata pointers
Message-ID: <ZeciQ1BazYfuf2Yu@macbook>
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
 <20240305121121.3527944-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305121121.3527944-3-andrew.cooper3@citrix.com>

On Tue, Mar 05, 2024 at 12:11:20PM +0000, Andrew Cooper wrote:
> These are optional.  .init doesn't distinguish types of data like this, and
> livepatches don't necesserily have any .rodata either.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

