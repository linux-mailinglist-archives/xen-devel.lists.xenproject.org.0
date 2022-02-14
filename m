Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD314B4FF5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271482.465931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJaNj-0008PO-Lx; Mon, 14 Feb 2022 12:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271482.465931; Mon, 14 Feb 2022 12:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJaNj-0008MS-I8; Mon, 14 Feb 2022 12:23:03 +0000
Received: by outflank-mailman (input) for mailman id 271482;
 Mon, 14 Feb 2022 12:23:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oHKf=S5=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nJaNh-0008MM-6b
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:23:01 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9292226-8d90-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 13:23:00 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id d27so26534039wrc.6
 for <xen-devel@lists.xenproject.org>; Mon, 14 Feb 2022 04:23:00 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:4cbc:cb8a:e37e:c1e9?
 ([2a00:23c5:5785:9a01:4cbc:cb8a:e37e:c1e9])
 by smtp.gmail.com with ESMTPSA id g8sm12786395wrd.9.2022.02.14.04.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 04:22:59 -0800 (PST)
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
X-Inumbo-ID: d9292226-8d90-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fiR81myXrw2bWyQUuNNbFZNkEWaXxpitBbAn0xHszvI=;
        b=NsPbT/5BxrqJ5rWob5lUVp71U9g97gxwVkM6PA45jzcc5vB8nmF3sM0DlWH3iJDOEu
         mIhp/324FdCT1KNc4QtQBK2wJd835/+zKv1ZO6mJUf7ptRoJsc+yStHXzMfiC1ZoZR7F
         lrBjfFVuTbXX0VQIECXsbl7RjL5wiNxWm9j/XvUZzJuq+Xvo+CX4DzK8CGXLATFzUrmF
         Vh9kj+6gZUDr+6ntiqdm8Xo9VMC158YSNU7XFw5wLODkBMdNMytDoiSGrxU6a+WEU+I9
         3bm2zDdNGIEKNyFliFKb7Ppq5kVVT0aieqVYjcJruHmqM03MguH/NQuRkj+xqTVvQZEJ
         6VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fiR81myXrw2bWyQUuNNbFZNkEWaXxpitBbAn0xHszvI=;
        b=nVSdG/0/aSimTQOJJht6U1+o7HmAF8hn2xA7EFgGyjkHH254v9IwrP8E060r+EhG1g
         lxqP64zIR9m7aeK36t7Dkb9iy/Zm+lK2y/lJ96fd/G3LGDZlKxCJmyAIJBzPLQvcUYbQ
         9EOnpNFOyCivPJVKRYo/eKsL2DNcnC4AlGYWaYMN2U6o6g3hPWN4vEcZ+utSfjVessSx
         er6cvebKRct3UFEyxrIclLwznYNEwmb3rhHz2OvJzDYBSsau1Jmlvw+9Nx2MQ5xOTFu0
         ktPargHja9ah1zBrfA8qe9ACVsDsRujbPgj4KWUk2S9Wb4XiLqh8r3lWffKnO44aGv+P
         LMMA==
X-Gm-Message-State: AOAM532EDotILb62XyLacLrN1ANES5sTHsxGMhJ3jmzx5y4SRmA5Dc72
	qZNJz2lOqYYWCtlNMdalYmg=
X-Google-Smtp-Source: ABdhPJzQZ9mp9Ecg+Z7inJuf8PgmrHQ0P/SA34vlx3AvWu3CCoodWPGLTU1jGZ6s3qtiqT4EXmYoSA==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr2762220wrb.459.1644841379596;
        Mon, 14 Feb 2022 04:22:59 -0800 (PST)
Message-ID: <c4a107f2-db1b-ff5a-65ab-62407a360e37@gmail.com>
Date: Mon, 14 Feb 2022 12:22:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Reply-To: paul@xen.org
Subject: Re: tools: propogate MTU to vif frontends (backporting)
Content-Language: en-US
To: James Dingwall <james-xen@dingwall.me.uk>, xen-devel@lists.xenproject.org
Cc: paul@xen.org
References: <20220214104826.GA1607026@dingwall.me.uk>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220214104826.GA1607026@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/02/2022 10:48, James Dingwall wrote:
> Hi,
> 
> I've been backporting this series to xen 4.14 and everything relating to the
> backend seems to be working well.  For the frontend I can see the mtu value
> published to xenstore but it does't appear to be consumed to set the matching
> mtu in the guest.
> 
> https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00458.html
> 
> Is the expected solution a custom script running in the guest to make the
> necessary change or have I missed something in how this is supposed to
> operate?
> 

It depends on your guest. Linux happily gets the MTU from DHCP, but 
Windows does not. Hence:

https://xenbits.xen.org/gitweb/?p=pvdrivers/win/xenvif.git;a=blob;f=src/xenvif/mac.c;;hb=HEAD#l440

Cheers,

   Paul


