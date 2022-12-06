Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8759C644AB3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 18:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455422.712884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cDw-0001IO-Ls; Tue, 06 Dec 2022 17:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455422.712884; Tue, 06 Dec 2022 17:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cDw-0001G1-Iz; Tue, 06 Dec 2022 17:59:20 +0000
Received: by outflank-mailman (input) for mailman id 455422;
 Tue, 06 Dec 2022 17:59:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJTX=4E=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1p2cDv-0001Fv-0T
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 17:59:19 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3de6486-758f-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 18:59:18 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id f18so24625739wrj.5
 for <xen-devel@lists.xenproject.org>; Tue, 06 Dec 2022 09:59:17 -0800 (PST)
Received: from [192.168.30.135] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c511100b003cfa3a12660sm4008834wms.1.2022.12.06.09.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 09:59:16 -0800 (PST)
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
X-Inumbo-ID: b3de6486-758f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUzDM7H2KDEIFFscK9MDxEBIqDsEuT+fHTKG9361m/k=;
        b=MAUOeA0fDttWfrGwU016toCJeuAAXGrA0SbQX84v+xWUxxijIE6pybxUiZ8SHC4O5C
         ndXjDEzZCcg4WhWRZuFoBerjpaTBLUhvYAeL34h5simPe3vX/Jzk1qJyp2GD8/9NTfe+
         I3rG5yGlpafJmO5c1fPAhTUVW74fKVwiuwF1YWL0YJE5fkRF1elftHCvBAk1Z9fyHWCJ
         KbfJgu7NxnNKyjHec+M4GeU2p59sdKEWRtjYICho34gIhIuihBLhXeH9fTVwN805k5HN
         rXm5EIAYZE7B6fzi6x5l0L8aMW39IJcj2fN24Nj5+F4HXNy1JD/FBVagdjac4OMdccTj
         K4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUzDM7H2KDEIFFscK9MDxEBIqDsEuT+fHTKG9361m/k=;
        b=PnOOgGzcjNE0HHuG5JaUU0S2s6qLy7v7lYQZ6lj/GVz5VqIO83STzRiBdbVGBz3rsq
         m9FklgDEuC3B9lVXituNzYv8crPqESng9Z2IcFL7VCymcHUntFmJVsGIFcW+ZrKavWQN
         un18wbIsfrQyqwygffcEKW6tIfM4wZK1mXO7Cykw5v3VtoIfLYGeLdP5JtlhANnvSHI7
         N824POrYA7qvlmdVVFhMttqgtPbdBNsFtvT0OXvqE0CTWSJ8HtK0rdZjZEq/mYf7tX8a
         DtPQ9KICUQGMyJcoLzA581fP5dW1T9beyE3ivSNqWoLZzM3KDrCN/LMRiKTE6L7Z01vN
         g/rA==
X-Gm-Message-State: ANoB5pkH0icIy/xikiW+7HMDOAHd5zWytZh90TD2P2Qxi436FrYt+fuR
	7vRotZCXbKz0rtnqezF9cPuVBAcjMky79w==
X-Google-Smtp-Source: AA0mqf5/Ux85+FCN0VFdr1yyra8tA0QhuIvaawPQgCNeP3pooLEd2d6HfeFuhlig3K2P0hUvEKTmfQ==
X-Received: by 2002:adf:f946:0:b0:242:24a7:c7eb with SMTP id q6-20020adff946000000b0024224a7c7ebmr20294062wrr.150.1670349557235;
        Tue, 06 Dec 2022 09:59:17 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <1cde2d10-fa86-bab7-d1dd-9b94bdad5fe2@xen.org>
Date: Tue, 6 Dec 2022 17:59:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] ioreq_broadcast(): accept partial broadcast success
Content-Language: en-US
To: Per Bilse <per.bilse@citrix.com>, xen-devel@lists.xenproject.org
References: <9cc56d01a09fcf6e1e3e9d48e60420f435fa34c3.1670348481.git.per.bilse@citrix.com>
Organization: Xen Project
In-Reply-To: <9cc56d01a09fcf6e1e3e9d48e60420f435fa34c3.1670348481.git.per.bilse@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2022 17:52, Per Bilse wrote:
> Avoid incorrectly triggering an error when a broadcast buffered ioreq
> is not handled by all registered clients, as long as the failure is
> strictly because the client doesn't handle buffered ioreqs.
> 
> Signed-off-by: Per Bilse <per.bilse@citrix.com>
> ---
> v2: Complete rethink with better information. A lot of simplicity was added.
> ---

Reviewed-by: Paul Durrant <paul@xen.org>


