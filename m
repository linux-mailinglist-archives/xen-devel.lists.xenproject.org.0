Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA116A22A4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 20:59:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501536.773332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVeDv-0004aY-QI; Fri, 24 Feb 2023 19:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501536.773332; Fri, 24 Feb 2023 19:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVeDv-0004Xx-NT; Fri, 24 Feb 2023 19:59:19 +0000
Received: by outflank-mailman (input) for mailman id 501536;
 Fri, 24 Feb 2023 19:59:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVeDu-0004UE-C3
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 19:59:18 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b884456e-b47d-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 20:59:17 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id da10so1797819edb.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 11:59:17 -0800 (PST)
Received: from [192.168.1.93] (adsl-185.109.242.138.tellas.gr.
 [109.242.138.185]) by smtp.gmail.com with ESMTPSA id
 z26-20020a1709064e1a00b008b95c1fe636sm8930929eju.207.2023.02.24.11.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 11:59:17 -0800 (PST)
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
X-Inumbo-ID: b884456e-b47d-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umiL4hWI5T7jCbJChxD9By9qs5yCMLRWtMXBcLNgMbg=;
        b=eoXIqOX1Tp528EJL8BYyXxvXXez/Jwm8W674ViFrImYNAWo+hb9SYs5opSNEYMgtLy
         96MNZw09OntnsZQb6cDTrPWrMX1bdNuA4uO/0AHA09Lp0r2pBj2Gnl8+GNhES6KWqUB+
         l7wKgZb7NJPQkq9v6H68xkzrZseIi37jWbwth+vbFbPBUuoSw3/PVPHsd0k8yeKe+hOK
         BU6dUkFdonZiRVHz0Hg4YrumLFn7tXZqq220O2TX6ivmLnSzrp0Gh5LgbgLT81LauZN8
         OZSXFZIHkQCak/4j37IfRwAbPkn7Jfr3Rqs6lRHvOHp8leEX2xYtm5qhv7Zbwevx+0jD
         /9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umiL4hWI5T7jCbJChxD9By9qs5yCMLRWtMXBcLNgMbg=;
        b=INfwazJusZMm2JGxLoC+hdfrflpYK6uU8Nd3tiLEH2iczYiVkBM2SzpV8K6vFnq8A5
         Ry5FG5wrOuF6PrlbYm/fFsNEpJBHDOQDlc/GRroiYnkJfkE1CBFxY2lBCYsJxlYys916
         bV3n+AIQQCHrVq/KDSO5y5Q9Xq/dyHOeYp7HT4zFkIOQPjYgGfcPrrbYPXsV/oxdyiVa
         5k/XdK7W9lr8621hlBTK1hZaZGjsspJYbNIC5tdEe461tFxmSKybYrQMyhKyX2fAhwPR
         RKkB0xRy/MT/JirPJdGO0ln+NqlQVwYZpVbz5Kdh03/cGVp2f3V/xF0btTkJ2/eLBG7n
         2PfQ==
X-Gm-Message-State: AO0yUKUY/dDMkyeYQ18KJvKq7G1NP7W5c8AG+f5gSIf6sZaeLdOZCNPx
	LhDvzKhmoVbGK2ukgIx671jVIP0NvFY=
X-Google-Smtp-Source: AK7set9VZPxXqralMuGYw7MVFxT5q7INWTjtbS+TYcA9EZsqPuo+Qkp/pb58YtNeSldgeOIE0WKueg==
X-Received: by 2002:a17:906:4550:b0:8b1:7ae8:ba6f with SMTP id s16-20020a170906455000b008b17ae8ba6fmr27622054ejq.16.1677268757295;
        Fri, 24 Feb 2023 11:59:17 -0800 (PST)
Message-ID: <515d438b-0638-060d-d0c3-229f47f65762@gmail.com>
Date: Fri, 24 Feb 2023 21:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 02/14 - ALT] x86/svm: Remove the asm/hvm/svm/asid.h
 header
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230224185010.3692754-3-burzalodowa@gmail.com>
 <20230224194230.2758210-1-andrew.cooper3@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20230224194230.2758210-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/24/23 21:42, Andrew Cooper wrote:
> Fold svm_asid_g_invlpg() into its single caller, deleting the #if 0 which has
> been present for the entire 16 years this helper has existed: c/s 322a078ab140
> "[HVM][SVM] Reintroduce ASIDs."
> 
> Move the two remaining prototypes into the private svm.h, forward declaring
> cpuinfo_x86 in preference to including asm/processor.h
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Xenia Ragiadakou <burzalodowa@gmail.com>

