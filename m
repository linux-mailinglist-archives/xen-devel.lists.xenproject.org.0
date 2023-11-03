Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C647E05AD
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 16:38:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627224.978145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qywFk-0003Ds-N6; Fri, 03 Nov 2023 15:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627224.978145; Fri, 03 Nov 2023 15:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qywFk-0003B6-Jj; Fri, 03 Nov 2023 15:38:32 +0000
Received: by outflank-mailman (input) for mailman id 627224;
 Fri, 03 Nov 2023 15:38:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUT0=GQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qywFi-0003Ay-UD
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 15:38:30 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 090fc829-7a5f-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 16:38:29 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32f737deedfso1300449f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 08:38:28 -0700 (PDT)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 j17-20020a056000125100b0032db4e660d9sm2128827wrx.56.2023.11.03.08.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 08:38:28 -0700 (PDT)
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
X-Inumbo-ID: 090fc829-7a5f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699025908; x=1699630708; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nvysMWqX16TnYNvJrKwt8jASZkvVS2iEjXWvVWFbwO0=;
        b=lGySgKgvgq1KNhdAxFoXD7SscQDrRcMqiopP6emMiipmhhxV/sjB0LEJqf/WvUBIpB
         8GPfV+D0/WMpwuZKxwVMWL4SAmDzP7pmU1+itX0eKNOiP7WAOxQxeZ75qQHaMQq55N3s
         2EVz6etTZcNDB8YsgYqkR18ZLD03T0k9S9XNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699025908; x=1699630708;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nvysMWqX16TnYNvJrKwt8jASZkvVS2iEjXWvVWFbwO0=;
        b=Dj2/ZVbrqVGQ8mbRPgMIWgzqG8+uyBMSDggSLcCrBYidBtZzH+6C5EI9uzyLjp24NZ
         J+5ZnVXp7Ei9dcUtYAlU/5S2FziF3gKC2W+hLzHoXMoGhUmz8jM8d/eOhJX3zD11PTbF
         6pYA03Mr+5U+ogxRgWq6fk57/0nIr+bShdkfl+H0kYgDyM3tMpMJV8tKdHvIvK3UsGVH
         Tkl+GzfykWn/YyzNEF8bVYJQB2rZ6nlaS+Bvwx9w10vhbkMVcOtgNqc9xWW80zjiG6KR
         qnDAwTlrATfFUWQ+gpk47hKaobdvxCJz5JTHBMQFYfpE+RxKo3cZ9asYAt/8JLMPyKJ+
         UEXA==
X-Gm-Message-State: AOJu0YzEVSh1P5djRyNXj2xHS+uRAXfk9x5Mu7N4gH3aqPbibZuKu6EV
	mL6GSyYh6fBrJqizMqwD1zXLvg==
X-Google-Smtp-Source: AGHT+IFY40YsKIBfXVTsaLu03cXKMDsXP2+9dxwxlRpovxJwOq8atexFF3YYLbV4Pr04Gm6fOQ22SQ==
X-Received: by 2002:a5d:64ad:0:b0:32f:7b89:2675 with SMTP id m13-20020a5d64ad000000b0032f7b892675mr19680774wrp.65.1699025908364;
        Fri, 03 Nov 2023 08:38:28 -0700 (PDT)
Date: Fri, 3 Nov 2023 16:38:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZUUT82jpICws01ZQ@macbook>
References: <20231103144537.90914-1-roger.pau@citrix.com>
 <93fc77ad-8696-4d83-b916-e47f883ac366@citrix.com>
 <ZUUS-fzShqxOs5IO@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZUUS-fzShqxOs5IO@macbook>

On Fri, Nov 03, 2023 at 04:34:17PM +0100, Roger Pau Monné wrote:
> On Fri, Nov 03, 2023 at 03:10:18PM +0000, Andrew Cooper wrote:
> > On 03/11/2023 2:45 pm, Roger Pau Monne wrote:
> > > +};
> > > +
> > >  static int cf_check update_clusterinfo(
> > >      struct notifier_block *nfb, unsigned long action, void *hcpu)
> > >  {
> > > @@ -220,38 +248,56 @@ static struct notifier_block x2apic_cpu_nfb = {
> > >  static int8_t __initdata x2apic_phys = -1;
> > >  boolean_param("x2apic_phys", x2apic_phys);
> > >  
> > > +enum {
> > > +   unset, physical, cluster, mixed
> > > +} static __initdata x2apic_mode = unset;
> > > +
> > > +static int __init parse_x2apic_mode(const char *s)
> > 
> > cf_check
> 
> I'm probably confused, but other users of custom_param() do have the
> cf_check attribute, see parse_spec_ctrl() for example.

... other users of custom_param() do _not_ have the ...

Sorry.

