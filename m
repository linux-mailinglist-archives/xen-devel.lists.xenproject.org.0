Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047C2221D15
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 09:14:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvy5g-0005fx-Mq; Thu, 16 Jul 2020 07:14:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjZN=A3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jvy5e-0005fs-TU
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 07:13:59 +0000
X-Inumbo-ID: ea522dd6-c733-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea522dd6-c733-11ea-bca7-bc764e2007e4;
 Thu, 16 Jul 2020 07:13:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f139so10150246wmf.5
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2020 00:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=dEiJpr7zg7TDzM405ehbGQSkS7c2TKgEhMD8ZWgg1Xo=;
 b=hxtuhfsgnJKRloI2z4b4Rzj/9LxrQXkw0VpnwH1zRwL+f0psgQftH0hWiTuY4mmGgP
 VB1+2egDQmZMBgnllDz/v9qTP8q0zf+JgQpzxBowA8TeSoTn6gPeKyBU+zYVfgBwWtt7
 CEIEb7ljhE0jdlaKHECA32vddg4GWT294C4QjRam8A/dQafJ9B9M0ra0hpE7b2wI9MS1
 Z7uWFa/hvDUtH4KmWpkVhSToOteMfzBFX3x04jz3LbU6OiRZGqqsV7n5l5RF00usZXo6
 yybUMRC0oT4Ws+o48uQ9CJtHKjr9aXr9N8xspL1YOGK2ZkzMjffOzIVS2+gyn5NkquOV
 pNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=dEiJpr7zg7TDzM405ehbGQSkS7c2TKgEhMD8ZWgg1Xo=;
 b=Syho+Rc/T2UcTUWvY/+XTBoB673jebe5d1bkqg6WGpCxhN+iFa7/pQT7wkHC83c8pp
 dn5GWm92UZToo0sxWEekxzRMLqe7dLFhqP5J81X299oNYwyZ+twn2cDh5xNSHK6QdjiR
 ztzPtcAaTHBUeQOk2Pk5mz9EnBGjuvULHyYp43Q0e7ixYKVkG4WrGVTjfmznuka5mo7A
 u22sKxqPse+wuregZzsnFb9gEVx43VCKBreoNnEJiCdmsCbBbQRkH46QN/tHiikgapLT
 bXPkk8JElt0v7nIdLQSBDtEjV7YYQ1A4JiO4ZGMSbqG9pnZzOmb1OnnmAOcTXHiUqpwa
 m6mg==
X-Gm-Message-State: AOAM531/i6+3CE8iewnWRIZkAb5pnBrrGt+WJPuKXSN7mttkt8SdHWtw
 3run2utWItBi4Btdoxyx2u4=
X-Google-Smtp-Source: ABdhPJxo4Rz9/UkYjPcqrQ4s++x6iRZZnU2rCw5Vot9RAuAW4aWaa3P3egs9IqGBWenZBs3NUsa9IQ==
X-Received: by 2002:a1c:59c2:: with SMTP id n185mr3154727wmb.104.1594883637255; 
 Thu, 16 Jul 2020 00:13:57 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v9sm7678998wri.3.2020.07.16.00.13.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Jul 2020 00:13:56 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Brian Marcotte'" <marcotte@panix.com>
References: <AC8105C4-6DAD-4AB0-AC3F-B4CDD151CDEB@ispire.me>
 <763e69df40604c51bb72477c706ec24b@EX13D32EUC003.ant.amazon.com>
 <20200715191705.GA20643@panix.com>
In-Reply-To: <20200715191705.GA20643@panix.com>
Subject: RE: [EXTERNAL] [Xen-devel] XEN Qdisk Ceph rbd support broken?
Date: Thu, 16 Jul 2020 08:13:55 +0100
Message-ID: <000b01d65b40$ab7fead0$027fc070$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHWWtzrZblaFdJFoUym9DWZsRt33akJySvg
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
Reply-To: paul@xen.org
Cc: 'Jules' <jules@ispire.me>, xen-devel@lists.xenproject.org,
 oleksandr_grytsov@epam.com, wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Brian Marcotte <marcotte@panix.com>
> Sent: 15 July 2020 20:17
> To: Durrant, Paul <pdurrant@amazon.co.uk>
> Cc: Jules <jules@ispire.me>; xen-devel@lists.xenproject.org; oleksandr_grytsov@epam.com; wl@xen.org
> Subject: RE: [EXTERNAL] [Xen-devel] XEN Qdisk Ceph rbd support broken?
> 
> CAUTION: This email originated from outside of the organization. Do not click links or open
> attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> This issue with Xen 4.13 and Ceph/RBD was last discussed back in February.
> 
> > Remote network Ceph image works fine with Xen 4.12.x ...
> >
> > In Xen 4.13.0 which I have tested recently it blames with the error
> > message "no such file or directory" as it would try accessing the image
> > over filesystem instead of remote network image.
> > ---
> >
> > I doubt the issue is in xl/libxl; sounds more likely to be in QEMU. The
> > PV block backend infrastructure in QEMU was changed between the 4.12
> > and 4.13 releases. Have you tried using an older QEMU with 4.13?
> 
> I'm also encountering the problem:
> 
>     failed to create drive: Could not open 'rbd:rbd/machine.disk0': No such file or directory
> 
> Xenstore has "params" like this:
> 
>     aio:rbd:rbd/machine.disk0
> 
> If I set it to "rbd:rbd/machine.disk0", I get a different message:
> 
>   failed to create drive: Parameter 'pool' is missing
> 
> Using upstream QEMU versions 2 or 3 works fine.
> 
> The interesting thing is that access by the virtual BIOS works fine. So,
> for a PVHVM domain, GRUB loads which loads a kernel, but the kernel can't
> access the disks.

Brian,

  That's not entirely surprising as the BIOS is likely to be using an emulated device rather than a PV interface. Your issue stems
from the auto-creation code in xen-block:

https://git.qemu.org/?p=qemu.git;a=blob;f=hw/block/xen-block.c;hb=HEAD#l723

  The "aio:rbd:rbd/machine.disk0" string is generated by libxl and does look a little odd and will fool the parser there, but the
error you see after modifying the string appears to be because QEMU's QMP block device instantiation code is objecting to a missing
parameter. Older QEMUs circumvented that code which is almost certainly why you don't see the issue with versions 2 or 3.

  Paul





> 
> --
> - Brian


