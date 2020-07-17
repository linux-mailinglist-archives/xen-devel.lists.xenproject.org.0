Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4941223628
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 09:48:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwL6E-00030z-4M; Fri, 17 Jul 2020 07:48:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybK2=A4=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jwL6C-00030u-La
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 07:48:04 +0000
X-Inumbo-ID: d837ec7a-c801-11ea-8496-bc764e2007e4
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d837ec7a-c801-11ea-8496-bc764e2007e4;
 Fri, 17 Jul 2020 07:48:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id l2so15893082wmf.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2020 00:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=q1mnJvk5nRU6AupHxotXt81TJLZlwg220QYxb1o3trc=;
 b=RKOAhZJziDDC1OKdUkiZy68Inh1a4MzvRtvUcThEGiO57ts5/oA90TXqrybPYD5t4j
 kQHAtqDw//728yqU9mvRRVq6Di3TAUMRBVX1WphsOZHl7/9VXFZnnWInQHbpFbuBF/tP
 2StN3nP7ov3XJvp8P/cWWHEo5gkeQRFn1EHJ/p2tArulsHG4eFG/SCvtcS+60yiUdI6Y
 odMJROQvIQ3cCQjBV/+Bwl3Z4E16xMeZSOZSV35eCcDk/uUfqa5XGfFigf0ZBdj84Iiq
 vvyI6PfMlRJVUAE44NsTpKTDObXpeKO1nQ8sh5/tVr/CnfFExFRfE64oAK8YzQnx6oyK
 6oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=q1mnJvk5nRU6AupHxotXt81TJLZlwg220QYxb1o3trc=;
 b=YkMhxa+vz2dzCHc1eDxzx9W5NPiVYws5Zdow3H7+RqfO8ngA397ok4sGyUZhD8sOSC
 5MLbRqKXrCi2SIsMwNWfipSfKWYQJZK2cvZbLKCTrzXtY/voI/HD7n51NORt7HJMhM3X
 rYPf64CrkdcRM8ArJyfe/Evf8DElG6XSm1t8O6S4O7UydcXARmsHx4hYxdGRnXcT6G03
 uuyCc6lQGXWNtfEXzm6Y6F6CLYd5dc95S1ZtrSmPYyJBn4i90EjPekQEs18TtnYhOSUj
 x9JdaIMaGkepcZzVvbWgu+p8kvFNKCWrW2k11l43JTzbK83UGRTRAj+wphhuYeUH+15c
 Wfew==
X-Gm-Message-State: AOAM533wycKm8wOyW6kyMsV7pIyUMSx5JV+COwK0egTaKmNYNbbkVMZB
 SIAdOwaOXyZqh7J6XnBY2C8=
X-Google-Smtp-Source: ABdhPJzgrzhwXL4HTew6EcS8j1IeB8pn7V7tO1kAxuHLqzRSTk8JTiLaMri21GPHDvVZwehINNl4IQ==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr8482009wmb.56.1594972083173; 
 Fri, 17 Jul 2020 00:48:03 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id e8sm12469612wrp.26.2020.07.17.00.48.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jul 2020 00:48:02 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Brian Marcotte'" <marcotte@panix.com>,
 "'Paul Durrant'" <xadimgnik@gmail.com>
References: <AC8105C4-6DAD-4AB0-AC3F-B4CDD151CDEB@ispire.me>
 <763e69df40604c51bb72477c706ec24b@EX13D32EUC003.ant.amazon.com>
 <20200715191705.GA20643@panix.com> <000b01d65b40$ab7fead0$027fc070$@xen.org>
 <20200716202331.GA9471@panix.com>
In-Reply-To: <20200716202331.GA9471@panix.com>
Subject: RE: [EXTERNAL] [Xen-devel] XEN Qdisk Ceph rbd support broken?
Date: Fri, 17 Jul 2020 08:48:01 +0100
Message-ID: <003401d65c0e$995bb4f0$cc131ed0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFy/a26FkUIi5mjo8XOqnAYvmCCoAJQGLlhAdA3FVkBzMgo7gIKkLk6qZJjndA=
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
> Sent: 16 July 2020 21:24
> To: Paul Durrant <xadimgnik@gmail.com>
> Cc: paul@xen.org; 'Jules' <jules@ispire.me>; xen-devel@lists.xenproject.org;
> oleksandr_grytsov@epam.com; wl@xen.org
> Subject: Re: [EXTERNAL] [Xen-devel] XEN Qdisk Ceph rbd support broken?
> 
> > Your issue stems from the auto-creation code in xen-block:
> >
> > The "aio:rbd:rbd/machine.disk0" string is generated by libxl and does
> > look a little odd and will fool the parser there, but the error you see
> > after modifying the string appears to be because QEMU's QMP block
> > device instantiation code is objecting to a missing parameter. Older
> > QEMUs circumvented that code which is almost certainly why you don't
> > see the issue with versions 2 or 3.
> 
> Xen 4.13 and 4.14 includes QEMU 4 and 5. They don't work with Ceph/RBD.
> 
> Are you saying that xl/libxl is doing the right thing and the problem
> needs to be fixed in QEMU?

Unfortunately, from what you describe, it sounds like there is a problem in both. To get something going, you could bring a domain
up paused and then try manually adding your rbd device using the QMP shell.

It would be useful if a toolstack maintainer could take a look at this issue in the near future.

  Paul

> 
> --
> - Brian


