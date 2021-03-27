Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E986934B39D
	for <lists+xen-devel@lfdr.de>; Sat, 27 Mar 2021 02:52:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.102133.195669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPy6x-00082e-2P; Sat, 27 Mar 2021 01:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102133.195669; Sat, 27 Mar 2021 01:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPy6w-00082Q-Tu; Sat, 27 Mar 2021 01:51:34 +0000
Received: by outflank-mailman (input) for mailman id 102133;
 Sat, 27 Mar 2021 01:51:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6KrD=IZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lPy6u-00082L-Jt
 for xen-devel@lists.xenproject.org; Sat, 27 Mar 2021 01:51:32 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2e761f3-19bd-40e2-853f-b2836982b48a;
 Sat, 27 Mar 2021 01:51:31 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12R1o8Jn070414;
 Sat, 27 Mar 2021 01:51:28 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 37h13ruq0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 27 Mar 2021 01:51:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12R1oM0u092347;
 Sat, 27 Mar 2021 01:51:27 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 by userp3020.oracle.com with ESMTP id 37h14hvtrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 27 Mar 2021 01:51:27 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB2470.namprd10.prod.outlook.com (2603:10b6:a02:ae::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Sat, 27 Mar
 2021 01:51:25 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.025; Sat, 27 Mar 2021
 01:51:25 +0000
Received: from bostrovs-us.us.oracle.com (209.17.40.37) by
 SJ0PR13CA0228.namprd13.prod.outlook.com (2603:10b6:a03:2c1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Sat, 27 Mar 2021 01:51:24 +0000
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
X-Inumbo-ID: a2e761f3-19bd-40e2-853f-b2836982b48a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=+j7ZPwO82JAZbbAqWXdxwkE793Vt87O8eQKF+FoLSks=;
 b=HmqSIvU4u6oFQWeBiQ7vn46tlrNU7lSkLMH1B0ywrI0VuAjnHYZtN4cuCsEJphU7z7iQ
 xKft1nla8Ir3BcLLoGphR12i8wtWUF03F1dWgFi6POGlxHc+ui/1m5hwD8MVoqQM8/n9
 GmI9KKeAUwaZnzUPxeP38eTOe7MbJf0VQizfzFehb/Y8oPNsJhfWUI2buKz7ER7PT3Uc
 V+B/Hy2O9AUuIk8nsjYLlMw5OkQCCCFKpS6JIk6jU0DKi2c7Mdp2EoBScnd2N5DHlSJB
 nYL4JfXEwqQ2XASJ23ZcT1wfM2Q7SLVU99vOqAOhEhwSgLRA6JlKTXLLdShzUwtrgQpj qA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3gffv7s2/20/xUbNoVx9ItFC78RJ0/C1nkwNZ72i11gsZlLAsFpj3tHy4tce5whoJK9qykZb4G1CEdVNoUU/n70GRQc+/tdaadZ6sjB2r5MVQ29x6Rj71s6IgjFwec5HIvm3SQ68GsQWaEnrEEEF3EaaeQGoc0TdjuNc2Rhda7ht4NjgCjiH/N5vOO1IGklgRGyms4KUY18a12zt7Tj1LJKV2jjEUU7bywt1YIhlOwjHzw2VjWpBm0RuVTYlhDarZZ30kRRKO6HikNU8LHUWVQuIy2qlzCk/BaTNPqVU5n+TJXJ8E6ise0MgofgHJgePcbqHgSk0M3cly+nqJrFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j7ZPwO82JAZbbAqWXdxwkE793Vt87O8eQKF+FoLSks=;
 b=RAYBbbtFxQdnGZ8gCvYzldIQ/EMFdgI9MXnTODAi3s6Ov286FNTpfAzbhkujGkaOHyxJLZEqNTuC+Y6bM/6Lzfn4kMPZvwjd0UNX4zMaVH3BNgtRoQjNeAeWVbTPUntahddNUK90O1sNBetMeRG2h+9pcZ3k3rSEd5Ti/hRKlM8QR4vetQu+5g02gBSxQnPfFUiEZmyEQWEbxpDIQ/TSr0kq5QEG392H/Dfnrx78bKIamF/RaDzCVoqu3XHwOv3ZXHM5OXyGQeN0oXPWAC+QT0opgiAVa3fy6VgUnKu87rc/cCDcbvy8KUgauWSOxEyGX55xJ976d3YhojrYyr1pWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j7ZPwO82JAZbbAqWXdxwkE793Vt87O8eQKF+FoLSks=;
 b=ln/7UHXxwA1KD+PQcGsGWziMeOTpEtPzJos7bkLSur230S4qWI9lltwT3qhXH1lrmPcrwOgTDlnsp3X6mUPSNLalkxAszizaAWTZ499AOa946QE7SQxfJLWYXSLjrId+2U/l/Up6RUQ+AjJnuB0aD53+7SCLH8YF0dc8MrDBigs=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        wl@xen.org, boris.ostrovsky@oracle.com, stephen.s.brennan@oracle.com,
        iwj@xenproject.org
Subject: [PATCH v2] x86/vpt: Do not take pt_migrate rwlock in some cases
Date: Fri, 26 Mar 2021 21:51:06 -0400
Message-Id: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [209.17.40.37]
X-ClientProxiedBy: SJ0PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::23) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df004bcc-70f0-48f9-a367-08d8f0c2d46c
X-MS-TrafficTypeDiagnostic: BYAPR10MB2470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB2470594B505A7B58D2F726738A609@BYAPR10MB2470.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hi1g0M6YenUqq3GYqH5xLuoEwabiJnyQyIZiz/ZVg8ncBlirzYjgflehP+3Vw1SSvaT11afUklFW6KfAGuYy68M4j88B0RGGGj8lX08pMGDzPQfh6OyTkem5o2oDfY4JXAUnh640O4BhMa5tBcwaAPZ6XZdDorKcmgpbPa68ojP6FCIRbpPItNZaxkaLfgjUrPRrMEv4RccCkZYjXOMyJM/5te/Zyao9etRxqjOXlTevwb9jJz+gu0pVc0bOhz1Q212qp6LcxBFzc729CQMKVHU9B9Qq13BJaV2imYome9DZE6GNZeNTl8VYE1EbgqR3/K2NVC2wWnoI9+swOp/qR6+22cKeeAWQ4MdkuWnuShlt+ItSnFNuKHPjn3jYfhmDnxFKJapMK1dF6y7KQKy6I7SxJnZhFs92tfHaB9/NnQiTOxtFwd6cP+BNPDxjFvb4z2GZxt9isLyyyYQNsV84GW/JTC5FDGvOF+DQMKQkx+B3PlFSFNS6/BJ1sLp8XqOmaI0sDXkHeWqxrgnqcAV0XBe2T4jVeXgl7ZVivmJI2BupxNyMPk4OfmHRuk0PVAyit3V2kyDgZONeHe9yMrRfig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39860400002)(346002)(366004)(396003)(38100700001)(4326008)(83380400001)(86362001)(36756003)(44832011)(2906002)(6486002)(66946007)(2616005)(6666004)(26005)(186003)(5660300002)(316002)(16526019)(52116002)(66556008)(7696005)(478600001)(8676002)(6916009)(66476007)(8936002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MVFkNENUY1JueGI1UmhWTHFpeTNpaXl6UXFwNHVzRTJxN1hmeU4vL0grbFRs?=
 =?utf-8?B?UHFOVDZhVmhVbnowZytiZVRzNkZvS0I0OUkvMW1uRlV5Y1NTM1ZLNUh4N0Vp?=
 =?utf-8?B?WTZxYTk3bjJ3aHNRbWk1YXI4ci8rZ3B2ODMxQXE0blh4eG1HUFdDOERRRlRk?=
 =?utf-8?B?QTJWQTMyTGlmcFVmQU43dzZBZHdYY0o0WFdMTXJtUmViSEZvek4zMzNvcUY3?=
 =?utf-8?B?TDUwNmJybFdUcndOQVdyZ2xobjRxZDJwWjBOQnphV2YxRVlUNmlHSnl5RjMz?=
 =?utf-8?B?SzFsc21raTFzaGEwdExIL0pqOG9jeGRYUm41aG5lT3BRMTd4ZkVyTGVtRE5k?=
 =?utf-8?B?MVZNc080NUZxMU5FS1ZObEtRTmQ3aEVNeDNlZkNjWmdDRmQzdXR2RXA3VVBR?=
 =?utf-8?B?dXJwM3I2SjQ0anVnUjV3SUJLMFlndXpUZEhIUG1ybFhYVzZCV2tWajBUQzRz?=
 =?utf-8?B?aU9kRFYxOFhoSXR1M1R0dzVSQ0JEMDNJVkhuaGhudEc2ZXhVTkU3SDRyVDli?=
 =?utf-8?B?eHhleVJ0bk5MQjR4N28zWTVpTjB6NnNWZk9aOXRWdURLTFVJM09EblZRSURI?=
 =?utf-8?B?eUxTNGJaSzBBNWdKa0xJdG1XNmc1UFNndmtwYm4wK0poYnZHSEprYWp3ejU0?=
 =?utf-8?B?QUNheThoZDkxTHJsWUUzekltYW8ybHoxSnFyWUZTNnhlMmxvMTNOMnNWc2Fz?=
 =?utf-8?B?RnRjR0F6a2xFNUJQSkNNZlN2R0UvWE9ncFh4dVo2eDRVb3BJVCtiYjFianhn?=
 =?utf-8?B?ak9NV1ZkUWVtdzNlZWFnS0RxbTdxNDh4eTFINEVzTkpkdWRrUGVPQ2VJdzNP?=
 =?utf-8?B?Z1UvRVF1VDNpOERDRnJhZ1h3eG1LaVozdkxJTCtGQ3FBZkRkTVg1dXNudHVG?=
 =?utf-8?B?NGtMb2tiZU4zMEZvQ1FBaG8vdkpCMlM1OFFkcndkb1NESzVjNlZ5ZndFSlpn?=
 =?utf-8?B?S0VEL2xHMWhJdU1GMDlCSVpKSlJiZHZYVklKSVdFY1MrZkxRTWh1QVRtdTVD?=
 =?utf-8?B?ZzRpRDVEOE9tRm91QWNZc2JrUkJQejAwdEl0WjYvSkZJVS9kQkJaSk1HQjZt?=
 =?utf-8?B?bFFGVzRiOGxEcGR5aUp6T09FbWlJUXFlM1A2dlZndUROTGdsdkJSY1dmdHB1?=
 =?utf-8?B?bE1aSk5WT0dGUTJtSHBOM3JBTEZWNFFBSVkxbmVIRG9NU3pXV05ZaHYvVjVR?=
 =?utf-8?B?a0JnU1lCRHJtdE5IUzNVNkZwaDd5TlZUU0hKR2ltTGRaSWF5ME5qcnVVV0FU?=
 =?utf-8?B?TXA0RDVKWVlZOE1FUTBocE1id2lYbStRYUhZeTVVU3pRMmxoTkx2N1FBR2tN?=
 =?utf-8?B?cEJEKzRRZFk3RDNTUlJCRjRHMC9haGpneHNWTnN2a2ZMaE9UWERTTGNVcVM4?=
 =?utf-8?B?a3laakdiSTd4NEtLVnZXQVNPQnUwNjZydGRmRDJNaTgwWHJSRzlDanZacmZu?=
 =?utf-8?B?ZXRJNzN4ZXFzWUVrRi9HWTJYNmRuNWFoMGlCcm5CSzRoWlZOSjYwVzVadEhq?=
 =?utf-8?B?dGdtWDV4RGhkTUYyWmp0c1doQUs4VVZ1YUNSYU56S2hnWUhIVUlKdWRTa0Fw?=
 =?utf-8?B?THNXckVZcXVSSjJPRzk1MDJybmFmUjJ5K0lTalhNcUwvR3VoWE1qSWVSUDZh?=
 =?utf-8?B?WGs3aTNxTjBsSTR6a1YzVk9MRUZFMUJHNW51dU9OdnE3ZHZ6VktUckx4c2xF?=
 =?utf-8?B?S3FYSTdIK1UzbHpiUURFRCtvNnJFc1l6NUFrcEVYWVIwcjdIZmFIb3AxV2Mw?=
 =?utf-8?Q?DAb4elIZrhXQZnt4wfkgyAD30IAufPdRMrlJni2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df004bcc-70f0-48f9-a367-08d8f0c2d46c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2021 01:51:25.2185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7vOjcAxvu2OUL7qQ2qevK5ciRiQhgrjXx6H5xxoWabpwW0bHVgcQbnvwLo8VmNpcb13bCqZvnZl1O/aBMq79YWc6nBzkFbALhKYUEJU+cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2470
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103270012
X-Proofpoint-ORIG-GUID: pvBoUtRQNmagLdNqBhn5B0MIFIuXqhRu
X-Proofpoint-GUID: pvBoUtRQNmagLdNqBhn5B0MIFIuXqhRu
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103270012

Commit 8e76aef72820 ("x86/vpt: fix race when migrating timers between
vCPUs") addressed XSA-336 by introducing a per-domain rwlock that was
intended to protect periodic timer during VCPU migration. Since such
migration is an infrequent event no performance impact was expected.

Unfortunately this turned out not to be the case: on a fairly large
guest (92 VCPUs) we've observed as much as 40% TPCC performance
regression with some guest kernels. Further investigation pointed to
pt_migrate read lock taken in pt_update_irq() as the largest contributor
to this regression. With large number of VCPUs and large number of VMEXITs
(from where pt_update_irq() is always called) the update of an atomic in
read_lock() is thought to be the main cause.

Stephen Brennan analyzed locking pattern and classified lock users as
follows:

1. Functions which read (maybe write) all periodic_time instances
attached to a particular vCPU. These are functions which use pt_vcpu_lock()
after the commit, such as pt_restore_timer(), pt_save_timer(), etc.
2. Functions which want to modify a particular periodic_time object.
These guys lock whichever vCPU the periodic_time is attached to, but
since the vCPU could be modified without holding any lock, they are
vulnerable to the bug. Functions in this group use pt_lock(), such as
pt_timer_fn() or destroy_periodic_time().
3. Functions which not only want to modify the periodic_time, but also
would like to modify the =vcpu= fields. These are create_periodic_time()
or pt_adjust_vcpu(). They create the locking imbalance bug for group 2,
but we can't simply hold 2 vcpu locks due to the deadlock risk.

Roger Monné then pointed out that group 1 functions don't really need
to hold the pt_migrate rwlock and that group 3 should be hardened by
holding appropriate vcpu's tm_lock when adding or deleting a timer
from its list.

Suggested-by: Stephen Brennan <stephen.s.brennan@oracle.com>
Suggested-by: Roger Pau Monne <roger.pau@citrix.com>
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
v2: Drop per-periodic_time spinlock and keep pt_migrate rwlock (and thus
    change patch subject)

 xen/arch/x86/hvm/vpt.c        | 40 +++++++++++++++++++++++++++++++---------
 xen/include/asm-x86/hvm/vpt.h |  8 ++++----
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 4c2afe2e9154..893641f20e1c 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -153,32 +153,43 @@ static int pt_irq_masked(struct periodic_time *pt)
     return 1;
 }
 
+/*
+ * Functions which read (maybe write) all periodic_time instances
+ * attached to a particular vCPU use these locking helpers.
+ *
+ * Such users are explicitly forbidden from changing the value of the
+ * pt->vcpu field, because another thread holding the pt_migrate lock
+ * may already be spinning waiting for your vcpu lock.
+ */
 static void pt_vcpu_lock(struct vcpu *v)
 {
-    read_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
     spin_lock(&v->arch.hvm.tm_lock);
 }
 
 static void pt_vcpu_unlock(struct vcpu *v)
 {
     spin_unlock(&v->arch.hvm.tm_lock);
-    read_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
 }
 
+/*
+ * Functions which want to modify a particular periodic_time object
+ * use these locking helpers.
+ *
+ * These users lock whichever vCPU the periodic_time is attached to,
+ * but since the vCPU could be modified without holding any lock, they
+ * need to take an additional lock that protects against pt->vcpu
+ * changing.
+ */
 static void pt_lock(struct periodic_time *pt)
 {
-    /*
-     * We cannot use pt_vcpu_lock here, because we need to acquire the
-     * per-domain lock first and then (re-)fetch the value of pt->vcpu, or
-     * else we might be using a stale value of pt->vcpu.
-     */
     read_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
     spin_lock(&pt->vcpu->arch.hvm.tm_lock);
 }
 
 static void pt_unlock(struct periodic_time *pt)
 {
-    pt_vcpu_unlock(pt->vcpu);
+    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
+    read_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
 }
 
 static void pt_process_missed_ticks(struct periodic_time *pt)
@@ -543,8 +554,10 @@ void create_periodic_time(
     pt->cb = cb;
     pt->priv = data;
 
+    pt_vcpu_lock(pt->vcpu);
     pt->on_list = 1;
     list_add(&pt->list, &v->arch.hvm.tm_list);
+    pt_vcpu_unlock(pt->vcpu);
 
     init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
     set_timer(&pt->timer, pt->scheduled);
@@ -580,13 +593,22 @@ static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
         return;
 
     write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
+
+    pt_vcpu_lock(pt->vcpu);
+    if ( pt->on_list )
+        list_del(&pt->list);
+    pt_vcpu_unlock(pt->vcpu);
+
     pt->vcpu = v;
+
+    pt_vcpu_lock(pt->vcpu);
     if ( pt->on_list )
     {
-        list_del(&pt->list);
         list_add(&pt->list, &v->arch.hvm.tm_list);
         migrate_timer(&pt->timer, v->processor);
     }
+    pt_vcpu_unlock(pt->vcpu);
+
     write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
 }
 
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
index 39d26cbda496..f3c2a439630a 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -129,10 +129,10 @@ struct pl_time {    /* platform time */
     struct HPETState vhpet;
     struct PMTState  vpmt;
     /*
-     * rwlock to prevent periodic_time vCPU migration. Take the lock in read
-     * mode in order to prevent the vcpu field of periodic_time from changing.
-     * Lock must be taken in write mode when changes to the vcpu field are
-     * performed, as it allows exclusive access to all the timers of a domain.
+     * Functions which want to modify the vcpu field of the vpt need to
+     * hold the global lock (pt_migrate) in write mode together with the
+     * per-vcpu locks of the lists being modified. Note that two vcpu
+     * locks cannot be held at the same time to avoid a deadlock.
      */
     rwlock_t pt_migrate;
     /* guest_time = Xen sys time + stime_offset */
-- 
1.8.3.1


