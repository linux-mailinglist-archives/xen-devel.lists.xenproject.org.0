Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0A1BA427
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 15:00:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT3N2-00088f-Hm; Mon, 27 Apr 2020 13:00:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R4Dr=6L=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jT3N0-00088Q-D1
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 13:00:22 +0000
X-Inumbo-ID: 0d2d80da-8887-11ea-977f-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d2d80da-8887-11ea-977f-12813bfff9fa;
 Mon, 27 Apr 2020 13:00:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r26so20370247wmh.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 06:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LnUbjfdhnW2cQzPGXLw/I6yVbj5MKutvg/n8jzalU2I=;
 b=sYBNMB7eg3kL1WanWgjrQLQXbjzGZgC/XJTsnTFeq4u1Eht06XU4wDjuYSidvJIOup
 KOBVqo59a7zau3An/WjXn7h+u+IaffwSyVdTlnLZpj84MedoR6lKxBLc8TJ0Z+BhIdp8
 AiXtGbVhVFfMlu8iJ1HbXlvc84iLLj+xgQqeyz2wXU3Kf0eDrDjbSuRNI9fQBpRu6up+
 XyWXfRxrPX5fAmu/ZBeN2fDWXKvnJiIu69IQTWPUkzkCqQ1W+D+RMBi0F25YqYCxKEe9
 Fw4TMpZ+cjMxaMsQe6p7fQUI6pAkrjBh859fAlzSqNwiZly7LUySQ7No48wRNdEjjNjD
 in7A==
X-Gm-Message-State: AGi0PubWBgrs+u3Wk80YsaYJAaSK2X605GaxeEAZHN1hnmrnV1XY9EHT
 IH0cAntbtfCh8z5py6icUrU=
X-Google-Smtp-Source: APiQypIabbyAMng5fSK2vjnfXexnB1Afetfm/uNn9kexjA2b7LMEfmHv4wnIxGxjBJKvnDSS7rruBA==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr25144368wmi.98.1587992420782; 
 Mon, 27 Apr 2020 06:00:20 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id l15sm15083570wmi.48.2020.04.27.06.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 06:00:20 -0700 (PDT)
Date: Mon, 27 Apr 2020 13:00:18 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pvh: Override opt_console_xen earlier
Message-ID: <20200427130018.une7jgupa7zggsok@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200427121944.1443-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427121944.1443-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 27, 2020 at 01:19:44PM +0100, Andrew Cooper wrote:
> This allows printk() to work from the start of day, and backtraces from as
> early as the IDT is set up.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Wei Liu <wl@xen.org>

