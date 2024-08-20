Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8979588C7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780477.1190091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPdn-0003nE-US; Tue, 20 Aug 2024 14:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780477.1190091; Tue, 20 Aug 2024 14:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPdn-0003k3-RR; Tue, 20 Aug 2024 14:15:19 +0000
Received: by outflank-mailman (input) for mailman id 780477;
 Tue, 20 Aug 2024 14:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0MZ=PT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sgPdm-0003ju-Kk
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:15:18 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a04fe85c-5efe-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 16:15:17 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53345604960so377397e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:15:17 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53343326861sm146422e87.71.2024.08.20.07.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:15:16 -0700 (PDT)
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
X-Inumbo-ID: a04fe85c-5efe-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724163317; x=1724768117; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uzWAAfLKFbsQQ05t2qG5hZcgvC6eXvnDrAFcILhFgM0=;
        b=ZLjvqpsWzOTuwBnpwORU9hN2THkOHNjhgmj4qiNaawtL1h4sN+VqONZlhE2Tm2yYBj
         OadB6WJPWrEjNXRQDTpFgDNr+Mk8ZUrzwTA4V/DvNP75FLuo7HO0W6Ch71KWbf6p6H7j
         DUIHyJeXhWfpHNZ3pa++rvqGhTlNH7AWst0vgiirxYXM11uvbWEBXQtc+KyJs/WCdsc8
         XGP0QN3oDvWXXPUZy1uqJYS+FIssmPpKmX79U0T5AOX886Vb7WPcpJnHe0cThFrOAtd/
         mY2FvIOHNW8L5xi1e3DZA8tq7ZX7EZuNsz/N6flqUbHw0XupbdsH25SylA0suZ90Jcet
         W4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724163317; x=1724768117;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzWAAfLKFbsQQ05t2qG5hZcgvC6eXvnDrAFcILhFgM0=;
        b=ubLOVQ17mTPDiREzeDQohWsaXAy1cysl+6q3AVCur0wSyaK/dR/iMpaNoOM9/yOABm
         4SlKiAikhoLygmWXa1Ss0+mWhe33CvD963U8Gz6lVNqIGGsIb7x7dRlvfwrY4i0oqaxt
         58vRQomSdN47Li2slF+bXaHQdkfYWCL1GvTvw2s+peIVYA++1VRIb+KpEqRA+TXBQfRW
         3jwtw3pZFqtPyeC+tvxOvjaKv1avDz77of1n33+Nix10ZV3r2SAQ7q/WmIbiR17BhJEk
         oNG5k30/6Le2BzVGxxinjAGGgUhYASzAJ07wRk3hoqkOcvHDQlKDmaao1YgIzhNyAa8l
         AuAg==
X-Forwarded-Encrypted: i=1; AJvYcCWUjHiOovk+xYu1aToUQd9oG62C4rZDMg1azDgVzjBm4tOKekJ17NvjJSMbke8iDxLxojFFJ+iVp7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyAGSHde/X88t3o8z/LFsrUaXRUnfF1l4W2iobsMJFrxGaH6CX
	eV5sR9PTDbDrka3hF/NR6IAJZmdu2sS+IEQZdeAnO1vdPuPYSnxO
X-Google-Smtp-Source: AGHT+IEe3yVfE6cA6k05poEWhZk2WuanYNHRUetMh6XSFY7+ktOx1N7GIt9TCztFNrT5A5Szt/e8rg==
X-Received: by 2002:a05:6512:1086:b0:52e:bf53:1c2b with SMTP id 2adb3069b0e04-5331c692d51mr9954183e87.12.1724163316319;
        Tue, 20 Aug 2024 07:15:16 -0700 (PDT)
Message-ID: <0cd14d64dbaccc75f76c85b1ee248c80bf60d224.camel@gmail.com>
Subject: Re: [XEN PATCH v13 1/6] xen/pci: Add hypercall to support reset of
 pcidev
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,  Michal Orzel
 <michal.orzel@amd.com>, Rahul Singh <Rahul.Singh@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>,  Anthony PERARD
 <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P .
 Smith" <dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
 <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Tue, 20 Aug 2024 16:15:15 +0200
In-Reply-To: <1e0eee6c-0dcd-4ed4-970f-3d7e569cec09@suse.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
	 <20240816110820.75672-2-Jiqian.Chen@amd.com>
	 <50717151-3098-491f-9dfb-71ebaff4b684@suse.com>
	 <BL1PR12MB58498DC98719ED77DA950478E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
	 <1e0eee6c-0dcd-4ed4-970f-3d7e569cec09@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-20 at 09:01 +0200, Jan Beulich wrote:
> I further question the related part of [2]: Why did the stub need
> moving?
The following stub could be return to Arm's asm/pci.h:
```
static inline bool is_pci_passthrough_enabled(void)
{
    return false;
}
```
As at the moment it used only by common code in physdev.c which is
enabled only in case when CONFIG_HAS_PCI=3Dy so
is_pci_passthrough_enabled() will be anyway defined in arch specific
files when CONFIG_HAS_PCI=3Dy.

The reason why this stub here is that when  CONFIG_HAS_PCI=3Dn then my
understanding is that is_pci_passthrough_enabled can't return any value
except false and not to generate the same stub for each newly
introduced architecture but there are architecture which are using this
stub. As for example, in Arm this stub is used even if CONFIG_HAS_PCI=3Dn
and it will start to fail compilation as <asm/pci.h> is not included by
xen/pci.h anymore.

> I'm not even sure that part of the change fell under the Suggested-
> by:
> there, but I also can't exclude it (I didn't bother trying to find
> where
> the suggestion was made).
IIRC and it is really matters now then Suggested-by: was added because
it was suggested by you to use just ifdef-ing asm/pci.h instead of
arch-specific header or a header in asm-generic.

~ Oleksii


