Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF95A914828
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 13:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746516.1153596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLhap-000470-BF; Mon, 24 Jun 2024 11:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746516.1153596; Mon, 24 Jun 2024 11:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLhap-00045V-8B; Mon, 24 Jun 2024 11:10:39 +0000
Received: by outflank-mailman (input) for mailman id 746516;
 Mon, 24 Jun 2024 11:10:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLHn=N2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sLhan-00045N-Ni
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 11:10:37 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 611fa791-321a-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 13:10:35 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7960454db4fso298693085a.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 04:10:35 -0700 (PDT)
Received: from ?IPV6:2a00:23ee:1630:2367:7a43:4e50:dd73:6d7e?
 ([2a00:23ee:1630:2367:7a43:4e50:dd73:6d7e])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b546709673sm12739576d6.37.2024.06.24.04.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 04:10:33 -0700 (PDT)
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
X-Inumbo-ID: 611fa791-321a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719227435; x=1719832235; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0CAn4rvUqH0DXyr9yWg9CotOfQ5WDHHhm2sLzdc0xcA=;
        b=EgMeWN+IhKpJe9ajYuteSdUs2HmtmjIi6b2vTZamuQO8y0gXftY7RvrXwu4DdxqQsv
         IBm4kMqCTm+X1fXYlTTszCIfaylyxeVUb5BbQt2xlRtoo6BVbuKlYZRhMGGV9bLpezhx
         dI2jo1GUc/9JWsMDB5d6SQQgw5N1VepHtZNs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719227435; x=1719832235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CAn4rvUqH0DXyr9yWg9CotOfQ5WDHHhm2sLzdc0xcA=;
        b=rJ8PgwL/RIBqgiwqVK7kd7y+sBkMOQM2mSCfG4Xz1dmQxqrxLWpkKhPVt/K1na6/NW
         QKIIrbZnvzZoXFDgx4WhE91YbChTRImO0b/p7YDWfQu9CdFf3Y084HdPPJq5lif523qC
         wgWyZnsWFbmuKMRJCw5ONqa9A2VL+0c6iZS4X+6gX/FdbO7lBBDxZAhOwQXrAeMM0keu
         z0PobCL6qE7/PgJo+EXqLeevMu5xq5T+VKUjKUavY5wWB/46tQWrOv/TjW6yXrasrLo3
         NauOlXDAoSSwAroywfWtNqnChMoKbx8e8+kFnIQKqQwqJg/Jhrzor4huCCgrgwFkV29F
         FrSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvsztyOi+Vp7261EBAfoPuwC02ucWFM30EFIf0I0D1D+7kPsgaD+gHHKld//UfzQ4GaFCXADOqUrys57Y5xSN3NbvOCFFA2neyaSKeyG4=
X-Gm-Message-State: AOJu0YwpPF35akjUeEWL0lXfDhM9gQk3819zxxrr7AqgVv0nqwoO8N6f
	g3WUVrZeZHvS+yW8LmsQ4fb1eL7Cf6aPGcNrYRtxesMXY+o1ezoWraoJzLgJu3s=
X-Google-Smtp-Source: AGHT+IE62tYq3hJRY9J7nxXAW7yV1uDYrrvuf/IVwHJK97s3w3yipm5B3zSl63p96vzEWOpk4fR+Ew==
X-Received: by 2002:ad4:4429:0:b0:6af:69c0:e559 with SMTP id 6a1803df08f44-6b5364f7398mr47099046d6.50.1719227434684;
        Mon, 24 Jun 2024 04:10:34 -0700 (PDT)
Message-ID: <ea121cba-3657-4eb1-9c20-7bd23fe76f92@citrix.com>
Date: Mon, 24 Jun 2024 12:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] tools/xenalyze: Remove argp_program_bug_address
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240624104930.1951521-1-george.dunlap@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240624104930.1951521-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2024 11:49 am, George Dunlap wrote:
> xenalyze sets argp_program_bug_address to my old Citrix address.  This
> was done before xenalyze was in the xen.git tree; and it's the only
> program in the tree which does so.
>
> Now that xenalyze is part of the normal Xen distribution, it should be
> obvious where to report bugs.
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

