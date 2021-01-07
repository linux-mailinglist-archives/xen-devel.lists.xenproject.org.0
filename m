Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3C12EE703
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 21:37:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63110.112051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxc1x-0002n5-Uw; Thu, 07 Jan 2021 20:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63110.112051; Thu, 07 Jan 2021 20:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxc1x-0002mg-Ra; Thu, 07 Jan 2021 20:37:13 +0000
Received: by outflank-mailman (input) for mailman id 63110;
 Thu, 07 Jan 2021 20:37:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2pyT=GK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kxc1w-0002mZ-7O
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 20:37:12 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13aa0c5b-892b-4c87-bc8c-a2353e722c94;
 Thu, 07 Jan 2021 20:37:11 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107KZChT103388;
 Thu, 7 Jan 2021 20:37:08 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35wepme7he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 07 Jan 2021 20:37:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107KPSuX184448;
 Thu, 7 Jan 2021 20:35:08 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 35w3g39gah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jan 2021 20:35:07 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 107KZ6wG010963;
 Thu, 7 Jan 2021 20:35:06 GMT
Received: from ovs104.us.oracle.com (/10.149.224.204)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Jan 2021 20:35:06 +0000
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
X-Inumbo-ID: 13aa0c5b-892b-4c87-bc8c-a2353e722c94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=YdUZlATkoOSCXxs7th/uydFcD7CVzj1ymOLdm4LTSH4=;
 b=sj2xqtN3vmTG8b9eCZpF8RWJC0s8ChgaXAlJ175+H9Cw8JvY87a25zBvoLbf53vy6FNB
 sEBcXzEk04H9DsKojXLQcSFztdQV5huou3JavW/F27zDE0WSeKLeW+9dR/tAj4LkwChs
 kzmjPWJd2eDhBhenu4fHDBkcED/w7UpVHic5Qd3d9VCEKOmZITtx/dvYmwvufYtLCEsA
 E+c/b9Aveq/GWpsHF6B/7ZwWXxMudqdqetly7nw9iL3bIHCEDtOrg2vlyG3FXbKafMnK
 JaOJ0eTeFe9Am5tYeze4saSn4k0MneNty8NCqZl8AfScepcO4YZ7KFgz/9zrTXmLOGJf XA== 
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        boris.ostrvsky@oracle.com
Subject: [PATCH 0/4] Permit fault-less access to non-emulated MSRs
Date: Thu,  7 Jan 2021 15:34:54 -0500
Message-Id: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070119
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070120


Disallowing accesses to MSRs that are not explicitly handled (done by
commit 84e848fd7a16 ("x86/hvm: disallow access to unknown MSRs")) caused
regression for Solaris guests who access MSR_RAPL_POWER_UNIT assuming
it's always there.

We can add special handling for this and other RAPL registers (and that's
what should happen for pre-4.14 releases) but a more general solution is to
provide an option to allow accesses to unhandled registers to proceed.

The new option is "ignore_msrs" and it can take three values
    never:   Issue a warning to the log and #GP to the guest. This is default.
    silent:  MSR reads return 0, MSR writes are ignored. No warnings to the log.
    verbose: Similar to silent but a warning is written.


Boris Ostrovsky (4):
  xl: Add support for ignore_msrs option
  x86: Introduce MSR_UNHANDLED
  x86: Allow non-faulting accesses to non-emulated MSRs if policy
    permits this
  tools/libs: Apply MSR policy to a guest

 docs/man/xl.cfg.5.pod.in          |  20 ++++++-
 tools/include/xenctrl.h           |   2 +
 tools/libs/guest/Makefile         |   1 +
 tools/libs/guest/xg_msrs_x86.c    | 110 ++++++++++++++++++++++++++++++++++++++
 tools/libs/light/libxl_dom.c      |   5 +-
 tools/libs/light/libxl_internal.h |   2 +
 tools/libs/light/libxl_types.idl  |   7 +++
 tools/libs/light/libxl_x86.c      |   7 +++
 tools/xl/xl_parse.c               |   7 +++
 xen/arch/x86/hvm/svm/svm.c        |  10 ++--
 xen/arch/x86/hvm/vmx/vmx.c        |  10 ++--
 xen/arch/x86/msr.c                |  20 +++++++
 xen/arch/x86/pv/emul-priv-op.c    |   8 +--
 xen/include/asm-x86/msr.h         |   3 +-
 xen/include/xen/lib/x86/msr.h     |  17 +++++-
 xen/lib/x86/msr.c                 |  16 +++---
 16 files changed, 217 insertions(+), 28 deletions(-)
 create mode 100644 tools/libs/guest/xg_msrs_x86.c

-- 
1.8.3.1


