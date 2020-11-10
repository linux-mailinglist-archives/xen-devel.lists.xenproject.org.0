Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999482AE1AC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 22:27:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23984.51014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcb9Z-0002JI-WB; Tue, 10 Nov 2020 21:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23984.51014; Tue, 10 Nov 2020 21:26:13 +0000
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
	id 1kcb9Z-0002It-Sr; Tue, 10 Nov 2020 21:26:13 +0000
Received: by outflank-mailman (input) for mailman id 23984;
 Tue, 10 Nov 2020 21:26:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5eud=EQ=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1kcb9Y-0002Im-40
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 21:26:12 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca59eb76-203d-4c95-9139-27ae57475992;
 Tue, 10 Nov 2020 21:26:11 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AALNsqL062598;
 Tue, 10 Nov 2020 21:26:08 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 34nh3ax8mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 21:26:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AALOqFA194731;
 Tue, 10 Nov 2020 21:26:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 34p5g0w6vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 21:26:07 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AALPx9D001394;
 Tue, 10 Nov 2020 21:26:01 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Nov 2020 13:25:59 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 650FC6A0109; Tue, 10 Nov 2020 16:27:51 -0500 (EST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5eud=EQ=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
	id 1kcb9Y-0002Im-40
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 21:26:12 +0000
X-Inumbo-ID: ca59eb76-203d-4c95-9139-27ae57475992
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ca59eb76-203d-4c95-9139-27ae57475992;
	Tue, 10 Nov 2020 21:26:11 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AALNsqL062598;
	Tue, 10 Nov 2020 21:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=9Nj2D+m80kZDJqrKbN/4/Is2vNJ6uqoCfmj84gGzeI0=;
 b=KQwSFc1LoGQ1VzaMRiggNXYjNGFOkFbtnIpoHJ63adZBDFwbB47VyCf6DN+tnopZ6tC+
 Ys3WhPIB7S4McHQMXEQ/TepCswb5N1BFbWjHrxa03JjMciQwnjLGGGyrlV53U9+z0dhb
 f3F77ISWqoiBoSQLLZ/m8/dJ3McQblbRZ9l/mnOEBiiEDYqqJ9Ns9zBPT1S6rci/9SBu
 QNDx37w7jRZCsXJG4ySSpIDFhgsG1sNZe/fNCo+y6IMeCl3O6VL0jWad0tcMUszF1FTg
 Ueya8AfybJ2HPRbcLnuZJBCKzrfT6slqP45OamdgZvhtcAVS1LgCt3H+vS4V2OPQqEF2 Lw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2130.oracle.com with ESMTP id 34nh3ax8mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Nov 2020 21:26:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AALOqFA194731;
	Tue, 10 Nov 2020 21:26:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3020.oracle.com with ESMTP id 34p5g0w6vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Nov 2020 21:26:07 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AALPx9D001394;
	Tue, 10 Nov 2020 21:26:01 GMT
Received: from char.us.oracle.com (/10.152.32.25)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 Nov 2020 13:25:59 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
	id 650FC6A0109; Tue, 10 Nov 2020 16:27:51 -0500 (EST)
Date: Tue, 10 Nov 2020 16:27:51 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-5.10] swiotlb: remove the tbl_dma_addr argument to
 swiotlb_tbl_map_single
Message-ID: <20201110212751.GA16458@char.us.oracle.com>
References: <20201023063309.3472987-1-hch@lst.de>
 <20201103094643.GA18936@lst.de>
 <20201104140438.GA16892@char.us.oracle.com>
 <20201110091421.GA23707@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110091421.GA23707@lst.de>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9801 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100146
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9801 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100146

On Tue, Nov 10, 2020 at 10:14:21AM +0100, Christoph Hellwig wrote:
> On Wed, Nov 04, 2020 at 09:04:38AM -0500, Konrad Rzeszutek Wilk wrote:
> > On Tue, Nov 03, 2020 at 10:46:43AM +0100, Christoph Hellwig wrote:
> > > ping?
> > 
> > Hopefully this goes through. I am in the process of testing it but ran
> > into testing issues that I believe are unrelated.
> 
> Did you manage to make any progress?  This fixes an issue with the

YES!!
> new support for systems with DMA offsets in 5.10..

OK. Sending the git pull request in a minute or two.

