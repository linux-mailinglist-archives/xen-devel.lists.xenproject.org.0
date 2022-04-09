Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EC14FA615
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 10:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302080.515625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd6s7-0003Zd-97; Sat, 09 Apr 2022 08:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302080.515625; Sat, 09 Apr 2022 08:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd6s7-0003Xk-4u; Sat, 09 Apr 2022 08:55:07 +0000
Received: by outflank-mailman (input) for mailman id 302080;
 Sat, 09 Apr 2022 08:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FhEE=UT=linbit.com=christoph.boehmwalder@srs-se1.protection.inumbo.net>)
 id 1nd6Fv-0006k9-7L
 for xen-devel@lists.xenproject.org; Sat, 09 Apr 2022 08:15:39 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cad9668-b7dd-11ec-a405-831a346695d4;
 Sat, 09 Apr 2022 10:15:37 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id w4so15979226wrg.12
 for <xen-devel@lists.xenproject.org>; Sat, 09 Apr 2022 01:15:37 -0700 (PDT)
Received: from [192.168.169.127] (178.115.52.210.wireless.dyn.drei.com.
 [178.115.52.210]) by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c4f5400b0038b5162260csm16809052wmq.23.2022.04.09.01.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 01:15:36 -0700 (PDT)
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
X-Inumbo-ID: 3cad9668-b7dd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sw+fQbvS6SFTnotjqrxbhqCVHIPsenv7yxMzOYGId1I=;
        b=swx5mkkbJNix1TPl46oJjK+Fw0+J2z/XHhCyUPh+dcKkTNBekj88xkgZeDCIEgfzZd
         +FA0t7ckuNM4K4OwCilxgo/M+WNIfDm8hTC88nPXmxm39Wp7Y3PlmqfYEyysUU8hQUUf
         QcFmQYaxbOUrhMO1omCXZ8F/Rog5zixS+JPWEUQR0KkNkX4orlWG0JIiavrTh9qI4888
         PfuJYdextltFDNT3Q+47ZPQuPkokUbAa0jhifptu2z1GSQMaUF7eHMsw0ukFDymbedqA
         fJT7coHgReWy+GC/y+kW2UJS/DziuPPZTxFTP9KzlhdtF9p6DIhUJyZVoMiIdhtFkJM+
         cESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sw+fQbvS6SFTnotjqrxbhqCVHIPsenv7yxMzOYGId1I=;
        b=C4PmZqSjwSK3qYqITpTIG5EjddfB2BorJWWVYDb8uWIVcpUgjf7g+SM5+x6CELTyEd
         jFUwDap5i/hj5itkoIgogMDYDuzBG0/xvvDRRbpnoIsY3lx1UJwE7KpWbU61VW4Vm2iH
         FS2L1NY92fhKW7HE2lwWQ2sn7cI/tzp52NRfiIaznslwBmqLn6zYtdYnhKNFT/DL2lK0
         qoDM44Ow1t7mluekTq3DxXaDsKjmKDzS5wCEmiWX3ZMmej6+45I/8yA5I5N0Rq41KUjq
         1qToD7OEk1vz3xYqw2eUpxcZYN73OWbYLSiC3x8NmXC/Zx5khGQwQljkF6cdTjFQTX/M
         4w8Q==
X-Gm-Message-State: AOAM533l9GPoXvyXDlRUOH4HPjNgYrf4Li13blahsc59PErAF0iZNGh1
	X53VNTEBML64Wl5uKpgJXc7p7g==
X-Google-Smtp-Source: ABdhPJzQQyyFsXyXf3Tt03078VjcrkSv2k98fwj9oToPATRHlAVDyH773lIm4bEik17KjObuot5lIg==
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id r11-20020a5d6c6b000000b001ea77eadde8mr17920640wrz.690.1649492137216;
        Sat, 09 Apr 2022 01:15:37 -0700 (PDT)
Message-ID: <72e9bd34-3380-e305-65f0-a17306f5bd08@linbit.com>
Date: Sat, 9 Apr 2022 10:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 24/27] block: remove QUEUE_FLAG_DISCARD
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: dm-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Jens Axboe <axboe@kernel.dk>, linux-bcache@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
 linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, Coly Li <colyli@suse.de>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-25-hch@lst.de>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220409045043.23593-25-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.04.22 06:50, Christoph Hellwig wrote:
> Just use a non-zero max_discard_sectors as an indicator for discard
> support, similar to what is done for write zeroes.
> 
> The only places where needs special attention is the RAID5 driver,
> which must clear discard support for security reasons by default,
> even if the default stacking rules would allow for it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com> [btrfs]

I think you may have a typo there: my ACK was for drbd, not btrfs.

> Acked-by: Coly Li <colyli@suse.de> [bcache]
> ---
>   arch/um/drivers/ubd_kern.c          |  2 --
>   block/blk-core.c                    |  2 +-

