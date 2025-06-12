Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430D0AD75E3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 17:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013258.1391769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjo3-0004vt-BV; Thu, 12 Jun 2025 15:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013258.1391769; Thu, 12 Jun 2025 15:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjo3-0004t9-88; Thu, 12 Jun 2025 15:25:31 +0000
Received: by outflank-mailman (input) for mailman id 1013258;
 Thu, 12 Jun 2025 15:25:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy9=Y3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPjo2-0004t1-Aa
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 15:25:30 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76075314-47a1-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 17:25:24 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so9743865e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 08:25:24 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a561976805sm2233588f8f.2.2025.06.12.08.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 08:25:23 -0700 (PDT)
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
X-Inumbo-ID: 76075314-47a1-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749741924; x=1750346724; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8VlIzjthV+Ge1TJil/PnkbXbdBpQRIbWyK7zS4IxRQk=;
        b=Uemne5UjuvzggsAHjZFnqz9ccx9MIZo4z9Lxe5ChtLqyYVwXij0Yh5br7VrqwOE3vo
         xWTh9XDSFINEgZLhpUPwczk6ys8MZ5TOvgWqocPMzhZFKqQoUys9jacTqd1Cp1iVgDca
         6LFLMUlJeMCBs9PYYxoTUG6AJPN71LhLHGDRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749741924; x=1750346724;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8VlIzjthV+Ge1TJil/PnkbXbdBpQRIbWyK7zS4IxRQk=;
        b=uPBid0aouw24hpwd4Y7kONwEka3OdDixnMI/fODDAXZkApeQXCcxy7Y3yIveE2AI8h
         cS/0ox36kFlleCEM7ShhY6EnbsKFTXy0YGe0RxxhVx4Q5vpM7y/iWEoZQyEfmu0zUFi+
         nwIvnkLhwIN9i6D597nmjsngMVh8AcjBQwLi1JNrH/NR6q9kKwY01DGyXL7SlV/6togV
         NT5YVHMTNRKzCO4LUAW+TgFo+Ywd8ocFfdtPLUr+/63YSv5J080GW0uT/37VOa9/F0Cv
         Hjwv3tRP4XH/Bd9+/XnQJWH+qHODjr1Nd+HXoihgsXFSh4tNXsXEiRX+9rZ0k460O4AL
         dO7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzZojmQJZCVNP+lSIGcMz6ApmFXahAOVZLda7bOwnYAB02FEOVh+ufle1QSeCd7r5a8s2XYgc8s18=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8gD3tT7F/PK12EVCpwm0nF4mTkAMQDwsr8fzccivCwDFPYGPX
	I4YmeZR1adsViSd6rvX1QUKamoduZOT0rBSvfmbqSrNknnP9E/jtn7eE6wG763x5BVE=
X-Gm-Gg: ASbGncsn1dAaEfjiQSATB93mNXt2W2eeouR/pg7ZI7zcjbe5/KOfFn4Bx1Hat4vQ6MW
	LxHfuxYUslh7zrRpGBM1rJfDSlPe+tZzcDqQGXWUq7cYymcVjaRnwPR35oCevmsyKDGx/LOgyn0
	Q6zIAqfG9LGVOuLpcaP90SPwuvY03ObzCuHJDzs6sQZY6Q6fT09bdboqQn85EVkbIMfzJXu9pHw
	ElV9Ieho51MEOGQnAqkLpphTeSJxXI6pNdAajJZkbkmuxosycj7MkqFcH5xCeAoIjEtz7hwQdWz
	Qf4i5XxImiW9HnNI9QLOe/eKElEBHD7dSL1LYMtgRfqz6V8Oi+FrWFLEqbfLi1TEvBmC+m/A8Nu
	rzOpnA6qb76xdNFp1KSdL9MOn/7k1On86tOPwPmFGcXkfgg==
X-Google-Smtp-Source: AGHT+IEqkYP20Fn3x+Ul3bUYLqw1KrSdGqN+6znNGLUcqpftiwDL4jq4kMA2VZncCN+h6LzsZoA2Lg==
X-Received: by 2002:a05:600c:3b9f:b0:441:b3f0:e5f6 with SMTP id 5b1f17b1804b1-4533027be8amr22221675e9.25.1749741923782;
        Thu, 12 Jun 2025 08:25:23 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:25:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: Re: [PATCH v4] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR
 cache attribute
Message-ID: <aErxYm6xAo3bwoak@macbook.local>
References: <20250610162930.89055-1-roger.pau@citrix.com>
 <aEm8LuDrNBqjgaWF@l14>
 <aErqkcLYqTkykpp5@macbook.local>
 <60a346b7-82f5-46ba-84f7-82c449bc0506@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60a346b7-82f5-46ba-84f7-82c449bc0506@vates.tech>

On Thu, Jun 12, 2025 at 03:12:03PM +0000, Tu Dinh wrote:
> On 12/06/2025 16:57, Roger Pau Monné wrote:
> > On Wed, Jun 11, 2025 at 07:26:06PM +0200, Anthony PERARD wrote:
> >> On Tue, Jun 10, 2025 at 06:29:30PM +0200, Roger Pau Monne wrote:
> >>> @@ -271,6 +279,44 @@ void pci_setup(void)
> >>>               if ( bar_sz == 0 )
> >>>                   continue;
> >>>
> >>> +            if ( !xenpci_bar_uc &&
> >>> +                 ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> >>> +                   PCI_BASE_ADDRESS_SPACE_MEMORY) &&
> >>> +                 vendor_id == 0x5853 &&
> >>> +                 (device_id == 0x0001 || device_id == 0x0002) )
> >>
> >> We don't have defines for 0x5853 in the tree (and those device_id)?
> >> Maybe introduce at least one for the vendor_id:
> >>
> >> These two names are use by QEMU, OVMF, Linux, for example.
> >>
> >> #define PCI_VENDOR_ID_XEN           0x5853
> >> #define PCI_DEVICE_ID_XEN_PLATFORM  0x0001
> >>
> >> There's even PCI_DEVICE_ID_XEN_PLATFORM_XS61 in Linux
> >
> > You mean in the public headers?
> >
> > For Device IDs we have ranges allocated to downstream vendors, I'm not
> > sure we want to keep track of whatever IDs they use for their devices.
> > OTOH, not tracking those IDs here means OSes are likely to miss
> > additions of new Xen platform PCI devices?
> >
> 
> The devices starting from ID c000 are supposed to be xen_pvdevice, which
> are separate device types that work differently from Xen platform PCI
> devices. So I think you only need to check for
> PCI_DEVICE_ID_XEN_PLATFORM{,_XS61} unless another platform PCI ID gets
> defined some day.

It's not the check here, but rather what would be defined in the newly
added header what I don't know.

Even if not used here, should the other PCI device IDs be listed
together with the platform PCI device ones?

Thanks, Roger.

