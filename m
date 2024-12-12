Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB519EE663
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 13:11:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855956.1268730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLi2K-00076o-N6; Thu, 12 Dec 2024 12:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855956.1268730; Thu, 12 Dec 2024 12:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLi2K-00073f-Jq; Thu, 12 Dec 2024 12:11:20 +0000
Received: by outflank-mailman (input) for mailman id 855956;
 Thu, 12 Dec 2024 12:11:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLi2J-0006vx-HX
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 12:11:19 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31271e37-b882-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 13:11:18 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso653723a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 04:11:18 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d149a25ce7sm10149346a12.5.2024.12.12.04.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 04:11:17 -0800 (PST)
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
X-Inumbo-ID: 31271e37-b882-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734005478; x=1734610278; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3wtsy4PeGy3ryXQDKf3EoIlhjTLXPbh5i72ZTQs6twU=;
        b=St72Q73HKjxiOHyqOCHEi0/hTiDyuExGS8mIJm8TheQ3eZ4bavfaGTj4GvkTmpeDSq
         2Ws8H+OOi/L6eSbkHVbeNAm4yjp7Bn0lsWzfiB5xER0he9x2WKXXj/1UCnJ+NyX2Ierp
         muvwjS+xmcUR4BazFp84q6dNypG1Ah5Phedn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734005478; x=1734610278;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3wtsy4PeGy3ryXQDKf3EoIlhjTLXPbh5i72ZTQs6twU=;
        b=OVkbfMykGHo+2PNd4Xq6uixbXqoDqgdrUXUIMMgOuAZa4TWnorFH1rPNXZW/XlrfNP
         xedyozPMD5GdpkphZIz9jC8uh2RFV+lk/RSEyWpm54g5ai7JqCX6aRoCJtxUv9cKIvZJ
         VnRud33dX8FlvWZixabWrMaNak6F2WI9CA+vjPa17hkPNVIQAs7NAm2/HEyvWuCsD5gB
         IUesta5/0l9hauHPKPa365NAELrdeGTCO9295yO/Bsrzb83xahYa3Q367E2KDHaciXeH
         VW3NLELO99UgJ/40UGzvBlbwlDqpX92joUcV2lqljEaNeOu0ivw2DqR8KXLZe8oH3VQN
         yhjA==
X-Gm-Message-State: AOJu0Yx2OrIl2JjseceXorMU6eA1s0Buo4Eal2Ixu4h7s6Y63ugmjvsg
	BB1RR/Q7OEWc6CO+gJpyslwR/CbQc84YnhFWEy/JThe8+PiuNM0Ks40CgFok3po=
X-Gm-Gg: ASbGncv+z45WxvwH1W91tK/OmLpDyjsTNsre+Z2cCykwo25vcAlWRHkknOOJKHYPWxX
	WQtQMMedUtyZbIzyMbOhW7yXG2j7UCP7acOXueZO4NaktQerKMf2KeeyTM6jAnDqYftP+n5K9QD
	/B09IQOkhFF2ghwDKIvt9rhjUMJcdEfXdE4PzxJ6cwNa8+tXD10pujDm/oDvLzplpAJyCfMVz1f
	Cq0DuH40SyIX1chRCAKGprX3hq0KKEAkQTJ3LpmII8SrFhrIikF+Sa+U6O7+nAiSg==
X-Google-Smtp-Source: AGHT+IF0eXyKgv6a8A1ZKIdlnZljOZnyso8dB21we7zLuUXjdx3bIGBklSFl8WCu6qDoGaAytsatAQ==
X-Received: by 2002:a05:6402:2809:b0:5d3:da65:ff26 with SMTP id 4fb4d7f45d1cf-5d4fa1b29a2mr1840713a12.31.1734005477558;
        Thu, 12 Dec 2024 04:11:17 -0800 (PST)
Date: Thu, 12 Dec 2024 13:11:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, dmukhin@ford.com
Subject: Re: [PATCH v2 09/35] x86/domain: print emulation_flags
Message-ID: <Z1rS5CdF9NpXDmFu@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-9-e9aa923127eb@ford.com>
 <Z1mtigiI-5wkgzhK@macbook.local>
 <8fa61060-3c00-453e-be47-3a60671dc7df@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fa61060-3c00-453e-be47-3a60671dc7df@suse.com>

On Thu, Dec 12, 2024 at 12:53:45PM +0100, Jan Beulich wrote:
> On 11.12.2024 16:19, Roger Pau Monné wrote:
> > On Thu, Dec 05, 2024 at 08:41:39PM -0800, Denis Mukhin via B4 Relay wrote:
> >> --- a/xen/arch/x86/domain.c
> >> +++ b/xen/arch/x86/domain.c
> >> @@ -818,11 +818,15 @@ int arch_domain_create(struct domain *d,
> >>  
> >>      if ( !emulation_flags_ok(d, emflags) )
> >>      {
> >> -        printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
> >> +        printk(XENLOG_G_ERR "d%d: Xen does not allow %s %sdomain creation "
> > 
> > gprintk(XENLOG_ERR, "...
> > 
> > Might be more natural now that we have the macro (together with Jan's
> > suggestion to use %pd (same below).
> 
> Yet why would we want to log current here, as gprintk() does?

Right - I've forgotten that gprintk already prepends %pd.

Thanks, Roger.

