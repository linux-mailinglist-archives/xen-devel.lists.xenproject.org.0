Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BDF43592C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 05:44:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214147.372610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdOzU-0002Uv-8h; Thu, 21 Oct 2021 03:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214147.372610; Thu, 21 Oct 2021 03:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdOzU-0002TB-5Y; Thu, 21 Oct 2021 03:43:40 +0000
Received: by outflank-mailman (input) for mailman id 214147;
 Thu, 21 Oct 2021 03:43:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fl1r=PJ=oracle.com=martin.petersen@srs-us1.protection.inumbo.net>)
 id 1mdOzS-0002T5-Nv
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 03:43:38 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12d18a28-3221-11ec-8367-12813bfff9fa;
 Thu, 21 Oct 2021 03:43:37 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19L345vU029738; 
 Thu, 21 Oct 2021 03:43:10 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3btkwj3wvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 03:43:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19L3etve078225;
 Thu, 21 Oct 2021 03:43:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 3bqmshem6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 03:43:08 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 19L3gu8A082116;
 Thu, 21 Oct 2021 03:43:07 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by aserp3030.oracle.com with ESMTP id 3bqmshekyd-13;
 Thu, 21 Oct 2021 03:43:07 +0000
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
X-Inumbo-ID: 12d18a28-3221-11ec-8367-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=BSjTWby1MMCLQUchrOSGc4QoXnzcMZ91l35lRX12C+A=;
 b=s10GXTgGaX78Zmg+DOSDrfc0P0mwy8l94S/NZcyOPTkKyIMY2Y0KlCwxCAx31besDrcr
 gXfw3fEKtGCdejoVtEWUD00kuevcL/euKQ1b4LL0nm4E8CV6SIOFqCYP0rxj7RC74EVk
 e1PqokwRndi0pkrqAVruOVLwEN5l5viuqDFrINzci/HP18Znfe79FD5iVhadUThPY2uw
 odRGpVz8brO185YsW3tTaXuLihuEjMaflid8MLFI6u/8vn+luvxy/mDr7zofRsdPscVh
 mNLR9sg3Koj94WqKMhqpn6d0kreDZqZeu97CD8yHp5SK3EUYUYKj0bD7U5PsVZFWhw4s kA== 
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: zhuyifei1999@gmail.com, thehajime@gmail.com, hare@suse.de,
        jinpu.wang@ionos.com, jgross@suse.com, johannes.berg@intel.com,
        geert@linux-m68k.org, linux-mtd@lists.infradead.org,
        miquel.raynal@bootlin.com, axboe@kernel.dk,
        Luis Chamberlain <mcgrof@kernel.org>, jdike@addtoit.com,
        kent.overstreet@gmail.com, richard@nod.at, colyli@suse.de,
        agk@redhat.com, haris.iqbal@ionos.com, krisman@collabora.com,
        roger.pau@citrix.com, anton.ivanov@cambridgegreys.com,
        sstabellini@kernel.org, ulf.hansson@linaro.org, vigneshr@ti.com,
        chris.obbard@collabora.com, jejb@linux.ibm.com,
        boris.ostrovsky@oracle.com, tj@kernel.org, snitzer@redhat.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-um@lists.infradead.org, linux-block@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        dm-devel@redhat.com, linux-bcache@vger.kernel.org
Subject: Re: [PATCH 0/9] block: reviewed add_disk() error handling set
Date: Wed, 20 Oct 2021 23:42:44 -0400
Message-Id: <163478764105.7011.9400354892813636458.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211015233028.2167651-1-mcgrof@kernel.org>
References: <20211015233028.2167651-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BAR8nzodBeKYX4DEPTjC7SU079lshTb2
X-Proofpoint-GUID: BAR8nzodBeKYX4DEPTjC7SU079lshTb2

On Fri, 15 Oct 2021 16:30:19 -0700, Luis Chamberlain wrote:

> Jens,
> 
> I had last split up patches into 7 groups, but at this point now
> most changes are merged except a few more drivers. Instead of creating
> a new patch set for each of the 7 groups I'm creating 3 new groups of
> patches now:
> 
> [...]

Applied to 5.16/scsi-queue, thanks!

[1/9] scsi/sd: add error handling support for add_disk()
      https://git.kernel.org/mkp/scsi/c/2a7a891f4c40
[2/9] scsi/sr: add error handling support for add_disk()
      https://git.kernel.org/mkp/scsi/c/e9d658c2175b

-- 
Martin K. Petersen	Oracle Linux Engineering

