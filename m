Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB44609A4
	for <lists+xen-devel@lfdr.de>; Sun, 28 Nov 2021 21:21:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234199.406486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrQfk-0001Xq-SC; Sun, 28 Nov 2021 20:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234199.406486; Sun, 28 Nov 2021 20:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrQfk-0001Vr-Oz; Sun, 28 Nov 2021 20:21:16 +0000
Received: by outflank-mailman (input) for mailman id 234199;
 Sun, 28 Nov 2021 20:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FL9v=QP=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mrQfj-0001Vl-AY
 for xen-devel@lists.xenproject.org; Sun, 28 Nov 2021 20:21:15 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb89bdd3-5088-11ec-b941-1df2895da90e;
 Sun, 28 Nov 2021 21:21:14 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id m24so10360993pls.10
 for <xen-devel@lists.xenproject.org>; Sun, 28 Nov 2021 12:21:14 -0800 (PST)
Received: from [10.11.22.27] (wsip-24-120-54-60.lv.lv.cox.net. [24.120.54.60])
 by smtp.gmail.com with ESMTPSA id
 d17sm13421956pfo.40.2021.11.28.12.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 12:21:12 -0800 (PST)
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
X-Inumbo-ID: bb89bdd3-5088-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U1whNi9SAc6ScOh1I9KuK0DsXkCOcS/Kb99p7Pdd+AY=;
        b=el7LWb3/CvYkqOLrnV7/DGKGrT3cFN9MP37fC1rniZGORCOcF+ynzbGWuiDwueUFns
         wYX9JgJ+UR1cmX+InTmBm0Fq1vXxvek/HD2JKRAcEwA9cmTR36DUH8Ew3ZcZ4YT+8QhK
         gdeHHSZcajcZ52vSatI7aWeQPLyvCGSNuJpbRQ6VHvF36pQUPmo+L26AV1xTX+4XLCmA
         mZBCthixy2xPCJkVasEvC9aA8wma3VWAVWiuxRKNF+TRJ511BO/389waO11dTzn6liBu
         ZhL/JRlDwzVRZ6ElmhOkxgqlA9W7ySoBW4klanMgJ3d85ct2p/8j3DwPwzjikx1S1Mdv
         JZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U1whNi9SAc6ScOh1I9KuK0DsXkCOcS/Kb99p7Pdd+AY=;
        b=WoafkqNcMaHlMsOsmxaTI4/rx5vphPSrvkVPKTGIltu2NGOKcmBJREy6SkzH22a2K8
         ibW+Gzi1H7lygsyTTT/LSFfcJobAGZiJhqfaP9E4FC+HvZsa6qTi+AeekArKvbkh7XMW
         WzJZwwMutTspk+qApDwEa027OqOZ75MTKpqrolg/cpPfbFSSJ+fdrv3Somumkmncid8r
         PDT0W6CixedzyPdofex1VSqjZLPJ7r7UCI5UqUt5R7pjpb9/Cg+J3cuabD9cW/mKYfND
         XOoDYkxZglKjL0hvmS7HWfe3uX2G5a8GnIpZ7W8V10AL9nSz3I+1xkGb86Fq4XFxGvpJ
         YLbw==
X-Gm-Message-State: AOAM533D6Qoa2iLvLWP5p/LjIPu9b607dgfGCzRzkapwdi1FaGKPw48z
	8zD12KZStqlSLrvj1jnqM8E=
X-Google-Smtp-Source: ABdhPJzglQTz56SHO3HBrpGJOjfbTAtP5t59UU+qc21TXhbd7fLW6rI8AoDz10WgFRiHyznrmYARkA==
X-Received: by 2002:a17:902:f092:b0:141:ccb6:897 with SMTP id p18-20020a170902f09200b00141ccb60897mr54885424pla.89.1638130872844;
        Sun, 28 Nov 2021 12:21:12 -0800 (PST)
Message-ID: <66a71ffe-7a05-76d4-a3a1-cbf8a1c68006@gmail.com>
Date: Sun, 28 Nov 2021 12:21:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Reply-To: paul@xen.org
Subject: Re: [PATCH] public: add RING_NR_UNCONSUMED_*() macros to ring.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>, Paul Durrant <paul@xen.org>
References: <20211126065547.22644-1-jgross@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20211126065547.22644-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2021 22:55, Juergen Gross wrote:
> Today RING_HAS_UNCONSUMED_*() macros are returning the number of
> unconsumed requests or responses instead of a boolean as the name of
> the macros would imply.
> 
> As this "feature" is already being used, rename the macros to
> RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
> by using the new RING_NR_UNCONSUMED_*() macros. In order to avoid
> future misuse let RING_HAS_UNCONSUMED_*() really return a boolean.
> 
> Note that the known misuses need to be switched to the new
> RING_NR_UNCONSUMED_*() macros when using this version of ring.h.
> 
> Cc: Roger Pau Monne <roger.pau@citrix.com>
> Cc: Manuel Bouyer <bouyer@antioche.eu.org>
> Cc: Simon Kuenzer <simon.kuenzer@neclab.eu>
> Cc: Paul Durrant <paul@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> I have checked Xen, Mini-OS, qemu, grub2, OVMF and Linux kernel for
> misuses of the RING_HAS_UNCONSUMED_*() macros. There is currently only
> one instance in the Linux kernel netback driver. The BSDs, UNIKRAFT
> and Windows PV drivers should be checked for misuse, too.

I don't think there will be any problem with Windows.

   Paul

