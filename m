Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFE29A6C11
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 16:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823570.1237580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tLy-0008Jv-D9; Mon, 21 Oct 2024 14:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823570.1237580; Mon, 21 Oct 2024 14:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tLy-0008Hu-AQ; Mon, 21 Oct 2024 14:25:50 +0000
Received: by outflank-mailman (input) for mailman id 823570;
 Mon, 21 Oct 2024 14:25:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAaI=RR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t2tLx-0008Ho-7g
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 14:25:49 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d18d305-8fb8-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 16:25:47 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cb15b84544so2080708a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 07:25:47 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912f7c32sm211668766b.90.2024.10.21.07.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 07:25:46 -0700 (PDT)
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
X-Inumbo-ID: 5d18d305-8fb8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729520746; x=1730125546; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KQiv2mi6w4LufEOH2Qle69NnXyOCRRsXOXRfDUrCXCs=;
        b=a0Qjm5Rko4BykZcP51tcTkzTNhRlCi1M/0hC79z94QKwCo5xCaDGU6+pWoPqz+pSrg
         tioaBvWQleS+FjdZdQad9sq0oszWEtdV+4FVPGnj+Kt7QJOcfDEFj9iepOqoYPpQQDvh
         bfsyUoW52mfGJqOzg1YYXdQbkyl7dBw8wtS+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729520746; x=1730125546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQiv2mi6w4LufEOH2Qle69NnXyOCRRsXOXRfDUrCXCs=;
        b=dboWvVfh36nXAFJIdbqXlGuFPiSoZZ3gSyLBCGr96Ue7y90j4EsVgLHUuBdlrY5/0e
         Bnr7/kwpEc+uP7zgZSFDbTcHd54W75026RqOwuyZQs/CyTXRYwsryIz75k/fMWR2bmQw
         267e2Nxg6dgYdmJNaz+EU8H9ZA2VdPHfWLTYzVe/kMxd+yVOC+menOFWQZ3hRX1+cJEh
         +x6drgEkB8rhqN1ChB6GZLZ5Uj9j8ZNLApL4PI0ZiNecXMDcF4+w/MFRcO/LvKbjeVE1
         DZOvGtC3cUnGafJXaZ8qfXh7y0yklHV4IGxC8KLp7+gymikiqkRS64iHEidxxRbi5xCb
         pL7g==
X-Forwarded-Encrypted: i=1; AJvYcCVSXS62bjPWYRcIEZqDn2A2t0zPYPmSAYnV5V5PwTPp4Zd0XHK6vH9pOJFNtEeNzwDRIYT8lQ3y1q4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzb6QhsB63k33+4D5UEdlicNhAhDXgzPSX17RT8Ru6TOTzyKngr
	PVnmeZKF4rDMTVUtp7eLl1h72j86F2QJ0gyI/62f50PBaoC6Vg/wpbH0CUoDel0=
X-Google-Smtp-Source: AGHT+IHWbqdLylwPt9I2wy63SX58gNceCwtaE5hkJA3tgnlkgIIcZRkEwXM3Os735xLI5CA8OvvP/A==
X-Received: by 2002:a17:906:f589:b0:a9a:4aa3:728b with SMTP id a640c23a62f3a-a9a69ca0575mr1126149466b.53.1729520746513;
        Mon, 21 Oct 2024 07:25:46 -0700 (PDT)
Date: Mon, 21 Oct 2024 16:25:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Willi Junga <xenproject@ymy.be>
Subject: Re: [EXTERNAL] [PATCH] x86/io-apic: fix directed EOI when using
 AMd-Vi interrupt remapping
Message-ID: <ZxZkaTzN4d4E-__H@macbook.local>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
 <0f3a9c97-3903-414c-b076-5012e6bc9350@citrix.com>
 <f64650fb455c1d33d7ec3898eb5423a930624998.camel@infradead.org>
 <3a92bbe3-d58f-4a33-82db-ead6214ecc00@citrix.com>
 <9d988ea013f294356bda62253ad43cd24c2048e9.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9d988ea013f294356bda62253ad43cd24c2048e9.camel@infradead.org>

On Mon, Oct 21, 2024 at 01:02:31PM +0100, David Woodhouse wrote:
> On Mon, 2024-10-21 at 12:53 +0100, Andrew Cooper wrote:
> > 
> > > I don't quite follow how you need a sentinel value. How could you ever
> > > *not* know it, given that you have to write it to the RTE?
> > > 
> > > (And you should *also* just use the pin# like Linux does, as I said).
> > 
> > Because Xen is insane and, for non-x2APIC cases, sets the system up
> > normally and the turns the IOMMU on late.
> > 
> > This really does need deleting, and everything merging into the early path.
> 
> Don't you still have to mask the interrupts when enabling the IOMMU and
> then re-enable them by writing the new values to the RTE once remapping
> is turned on? So at any given moment, surely it's still the case that
> you know what was written to the RTE?
> 
> But OK, i don't really want to know... :)

It's possible that __io_apic_eoi() gets called before the EOI handler
array is allocated, as part of clear_IO_APIC_pin() that is done ahead
setup_IO_APIC() (so with apic_pin_eoi == NULL).

Whether Xen can get into __io_apic_eoi() with the EOI handler array
allocated but some entries not initialized, it's not clear to me.
However I prefer to act on the safe side and allow the fallback of
fetching the field from the RTE itself.  This is a swamp I don't want
to drain right now (as I'm busy with other stuff).

Thanks, Roger.

