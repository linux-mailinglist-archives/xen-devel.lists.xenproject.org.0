Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD45775750E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 09:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564956.882763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLeqx-0006lK-PQ; Tue, 18 Jul 2023 07:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564956.882763; Tue, 18 Jul 2023 07:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLeqx-0006hz-MT; Tue, 18 Jul 2023 07:10:35 +0000
Received: by outflank-mailman (input) for mailman id 564956;
 Tue, 18 Jul 2023 07:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEr0=DE=linaro.org=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1qLeqw-0006ht-7e
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 07:10:34 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e02d076-253a-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 09:10:30 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-314313f127fso5007592f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jul 2023 00:10:30 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 n13-20020a5d4c4d000000b002c70ce264bfsm1479819wrt.76.2023.07.18.00.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 00:10:28 -0700 (PDT)
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
X-Inumbo-ID: 2e02d076-253a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689664230; x=1692256230;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAk25XI6DF+N/RPwc8jvnN7pt/+H6p4ailHynx2WFBY=;
        b=fKPp3Kjb476K4raOQMzlahVzTiPv86QitTfCXSJS1PguBUEx5dY2RlFMObVYR2CWWa
         u/dJVvkABXNAT/4KGpyFUbmcEhuV8enyNwnpO7xGB0bq7I5ddnyu7bpEEWu0PBEa5boA
         +h7buBcCM5EFSUsOW9wOl2NRfNwXe2+SW9ZFO1a9J0Vd+lJfxM/POPBFuVwWvSicDoS1
         ZjQLd5eHAcpSEm467YzdpMcEtAAgNHE1Z3OFG7DIfJJmNtc4puhdA3RA7wW95aVFtHcP
         0V5lgolFPwBmjVANX+j6bXRGHWBzdDp0sFcPuq2DSBuQ4hemCQM2MPqThSiEow3hltlO
         5GBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689664230; x=1692256230;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAk25XI6DF+N/RPwc8jvnN7pt/+H6p4ailHynx2WFBY=;
        b=D5sf5yjKErozP9ZHrzio7RHHlnOmz79CI4rqnafJ0ohsAaz0OcXxX2RyKznSXXZQn8
         Tpt+jMvxd7KGvSqBAMjSIXuSieg2etOpVTV72xaes6+bufBzIWdTGLNhCTBIhdhMWadw
         AF6mdfGKL6GGePMvAdNqkxWPmo2P3fNj6DDXUU9LSgyTz5FRrVnQFhNB9yjss11rgVh5
         +JbYGbepjbCj2GG7FB5AQiq5vAlS8QSDqjxJcJS21dsb2txFgWPnGjaqvNSPGkGuUodp
         3r1ec6p6iC/QRw1BsbRkXj3SzEiKDegcuW9Aayik2dd5hEyz5+acJaSLJT1/yEGWWluU
         3JMw==
X-Gm-Message-State: ABy/qLbaWy+iYaBBDZuIew3dWZqJUJsCbCy2PFHlTkfHCaO7FJALTx3u
	yfsb9tZd3CwwVol4dmweJ21Jig==
X-Google-Smtp-Source: APBJJlGI8sFdzt89T0UCfXf2kYOa86Emn3lFEswP9Pp2SLzE28zuWii99UdVr425OMOm2qjesP53nA==
X-Received: by 2002:a05:6000:150:b0:313:ede8:9f13 with SMTP id r16-20020a056000015000b00313ede89f13mr11735959wrx.32.1689664230189;
        Tue, 18 Jul 2023 00:10:30 -0700 (PDT)
Date: Tue, 18 Jul 2023 10:10:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: jgross@suse.com
Cc: xen-devel@lists.xenproject.org
Subject: [bug report] xen/scsifront: harden driver against malicious backend
Message-ID: <00e862be-00c9-4089-bd9c-61c72aad27d5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Juergen Gross,

This is a semi-automatic email about new static checker warnings.

The patch 6d1c2f48f3fc: "xen/scsifront: harden driver against
malicious backend" from Apr 28, 2022, leads to the following Smatch
complaint:

    drivers/scsi/xen-scsifront.c:746 scsifront_sdev_configure()
    warn: variable dereferenced before check 'info' (see line 743)

drivers/scsi/xen-scsifront.c
   738  static int scsifront_sdev_configure(struct scsi_device *sdev)
   739  {
   740          struct vscsifrnt_info *info = shost_priv(sdev->host);
   741          int err;
   742  
   743          if (info->host_active == STATE_ERROR)
                    ^^^^^^^^^^^^^^^^^
The patch assumes that shost_priv() can't return NULL

   744                  return -EIO;
   745  
   746          if (info && current == info->curr) {
                    ^^^^
But the old code assumes it can.  Probably info can't be NULL and this
check can be deleted?

   747                  err = xenbus_printf(XBT_NIL, info->dev->nodename,
   748                                info->dev_state_path, "%d", XenbusStateConnected);
   749                  if (err) {
   750                          xenbus_dev_error(info->dev, err,
   751                                  "%s: writing dev_state_path", __func__);
   752                          return err;
   753                  }
   754          }
   755  
   756          return 0;
   757  }

regards,
dan carpenter

