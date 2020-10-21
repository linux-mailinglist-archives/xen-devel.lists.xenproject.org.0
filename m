Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5956294B78
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 12:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10005.26372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVBhU-00008M-S2; Wed, 21 Oct 2020 10:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10005.26372; Wed, 21 Oct 2020 10:50:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVBhU-00007x-OZ; Wed, 21 Oct 2020 10:50:36 +0000
Received: by outflank-mailman (input) for mailman id 10005;
 Wed, 21 Oct 2020 10:50:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlF9=D4=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1kVBhT-00007s-Lw
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:50:35 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92612200-8ffd-42b9-b227-3b7bdcd63073;
 Wed, 21 Oct 2020 10:50:35 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09LAoH74062157;
 Wed, 21 Oct 2020 10:50:32 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 34ak16g412-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Oct 2020 10:50:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09LAo67G104855;
 Wed, 21 Oct 2020 10:50:31 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 348a6p9udr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Oct 2020 10:50:31 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09LAoU9k032054;
 Wed, 21 Oct 2020 10:50:30 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Oct 2020 03:50:28 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FlF9=D4=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
	id 1kVBhT-00007s-Lw
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:50:35 +0000
X-Inumbo-ID: 92612200-8ffd-42b9-b227-3b7bdcd63073
Received: from userp2120.oracle.com (unknown [156.151.31.85])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 92612200-8ffd-42b9-b227-3b7bdcd63073;
	Wed, 21 Oct 2020 10:50:35 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09LAoH74062157;
	Wed, 21 Oct 2020 10:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=6ZnmW0Uwc1tXoKg5slRMLYnB9wb7dyA7I4QxcQLbwpU=;
 b=hxeV/6KFBAJ1sEJfVxTqRLdiaGd1QkeMsv4RkFCu2Iu8VqG7SBLvPetL7CAjd3bydmy/
 DsEs7Jbbh+AUMVo6rabylweFTKEqBKBE1Ooka9PC9N3m8HpaOpkdv8joQ69J2fzDbEq/
 XaIwH9Psl6Y4drYS3zGdFqpK9BR+dE7AgHO7QeC8GvqWBkPgOpMv3ttgbyXzFJKXu7fL
 7bI9/rkqpDZ+ozt6GQtsRZDQogm4KacNOCb/NtosRjc440B2eZmTtJXkb5uO7MyNIBbZ
 /yW6xWRcFWwMwX3f5wnxB2TM+nVbfKo+3QOZd6qxcwdgRf//TV9IAPpTxFw8oQ4GdJ2c sA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 34ak16g412-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Oct 2020 10:50:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09LAo67G104855;
	Wed, 21 Oct 2020 10:50:31 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3030.oracle.com with ESMTP id 348a6p9udr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Oct 2020 10:50:31 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09LAoU9k032054;
	Wed, 21 Oct 2020 10:50:30 GMT
Received: from mwanda (/41.57.98.10)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 21 Oct 2020 03:50:28 -0700
Date: Wed, 21 Oct 2020 13:50:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: oleksandr_andrushchenko@epam.com
Cc: xen-devel@lists.xenproject.org
Subject: [bug report] ALSA: xen-front: Use Xen common shared buffer
 implementation
Message-ID: <20201021105023.GA957589@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=750
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=11 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010210085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=761
 suspectscore=11 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010210085

Hello Oleksandr Andrushchenko,

The patch 58f9d806d16a: "ALSA: xen-front: Use Xen common shared
buffer implementation" from Nov 30, 2018, leads to the following
static checker warning:

    sound/xen/xen_snd_front_alsa.c:495 alsa_hw_params()
    warn: 'stream->shbuf.directory' double freed
    sound/xen/xen_snd_front_alsa.c:495 alsa_hw_params()
    warn: 'stream->shbuf.grefs' double freed

sound/xen/xen_snd_front_alsa.c
   461  static int alsa_hw_params(struct snd_pcm_substream *substream,
   462                            struct snd_pcm_hw_params *params)
   463  {
   464          struct xen_snd_front_pcm_stream_info *stream = stream_get(substream);
   465          struct xen_snd_front_info *front_info = stream->front_info;
   466          struct xen_front_pgdir_shbuf_cfg buf_cfg;
   467          int ret;
   468  
   469          /*
   470           * This callback may be called multiple times,
   471           * so free the previously allocated shared buffer if any.
   472           */
   473          stream_free(stream);
                ^^^^^^^^^^^^^^^^^^^
This is freed here.

   474          ret = shbuf_setup_backstore(stream, params_buffer_bytes(params));
   475          if (ret < 0)
   476                  goto fail;
                        ^^^^^^^^^^
This leads to some double frees.  Probably more double frees than Smatch
is detecting.

   477  
   478          memset(&buf_cfg, 0, sizeof(buf_cfg));
   479          buf_cfg.xb_dev = front_info->xb_dev;
   480          buf_cfg.pgdir = &stream->shbuf;
   481          buf_cfg.num_pages = stream->num_pages;
   482          buf_cfg.pages = stream->pages;
   483  
   484          ret = xen_front_pgdir_shbuf_alloc(&buf_cfg);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is where "stream->shbuf.directory" is re-allocated on the success
path.

   485          if (ret < 0)
   486                  goto fail;
   487  
   488          ret = xen_front_pgdir_shbuf_map(&stream->shbuf);
   489          if (ret < 0)
   490                  goto fail;
   491  
   492          return 0;
   493  
   494  fail:
   495          stream_free(stream);
                ^^^^^^^^^^^^^^^^^^^^
Double free.

   496          dev_err(&front_info->xb_dev->dev,
   497                  "Failed to allocate buffers for stream with index %d\n",
   498                  stream->index);
   499          return ret;
   500  }

regards,
dan carpenter

