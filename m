Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC5734D77D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 20:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103221.196975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQwnu-0006HJ-0k; Mon, 29 Mar 2021 18:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103221.196975; Mon, 29 Mar 2021 18:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQwnt-0006Gu-Tc; Mon, 29 Mar 2021 18:39:57 +0000
Received: by outflank-mailman (input) for mailman id 103221;
 Mon, 29 Mar 2021 17:44:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPlO=I3=oracle.com=stephen.s.brennan@srs-us1.protection.inumbo.net>)
 id 1lQvwB-00012R-Bn
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 17:44:27 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 766603ff-70fb-4de9-9459-cb31296f9047;
 Mon, 29 Mar 2021 17:44:26 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12THexoj038154;
 Mon, 29 Mar 2021 17:44:24 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 37ht7bch1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 17:44:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12THfPYi152457;
 Mon, 29 Mar 2021 17:44:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3030.oracle.com with ESMTP id 37jemw1t5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 17:44:22 +0000
Received: from BYAPR10MB2823.namprd10.prod.outlook.com (2603:10b6:a03:87::15)
 by BY5PR10MB3908.namprd10.prod.outlook.com (2603:10b6:a03:1b0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 17:44:20 +0000
Received: from BYAPR10MB2823.namprd10.prod.outlook.com
 ([fe80::e83b:92af:c9d7:2fe9]) by BYAPR10MB2823.namprd10.prod.outlook.com
 ([fe80::e83b:92af:c9d7:2fe9%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 17:44:20 +0000
Received: from localhost (2606:b400:8301:1041::12) by
 MWHPR01CA0046.prod.exchangelabs.com (2603:10b6:300:101::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Mon, 29 Mar 2021 17:44:20 +0000
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
X-Inumbo-ID: 766603ff-70fb-4de9-9459-cb31296f9047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=PtXV0/bToqyou5eFX7zCGcIeiZT1aBWAi2oubKwRKUw=;
 b=GUQNx6el+xelnBEIMQ6B5IoKnXXEXl4RrNNrDRo/LR4RDjiZ1021vLYnODNvINR8jqfh
 bgSZEfK+92gczYNqGl39rE38UUchci/1Y0PF+uP0Fbjz3r4x3+XvKaxIe/powI+k1nTV
 CZbewIhjvZfbh87wt3j1Ifm7cAwpvLBuboTOUR/xpDkdCZXagLzPXbQMJQ/Tt77jMOnN
 ahSZ/duz9R5XaubRrzrFrK7lSXdeCyw0Jf6U/irNiF1JZ7ZMDXhNtjn16aEw7q2vcgWK
 3IbAGtDHzG6TRV6HhuSCYAinGo0Qtvvbo1HhjMl5Xh2zK8u1T19tNzkGKHZdgMHUTe2X wQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ET2cpyscQnbGrM8euLPXDev2xhsqLIGBei891D5b8Wlfud88L34bjDgWiAuy3LkiB0qUY188ORA0PbdIbJQ8yBwysQHfzexpANDIsZNT8idXqlqsLJcw5G1YviI2GgeqONkbJGQ0hGheO09sVapawrgPBKpA+n0U/EujgRik9ofMqOvi8lhV4r5dO33D90+lIn4pWO4wGzMR4+fPZutC+zc6icL8ixOAZsEsjPwZp4xq0uCE0g7r2ifmzn1lKz6vOZDpZJQI3lsKFLRkGlnCVZdYX9+gyreoI8peYJmaYEJa9zjI62+DgZdjrWFJn9Yu+apPm+m+K3ioug9AWXQ6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtXV0/bToqyou5eFX7zCGcIeiZT1aBWAi2oubKwRKUw=;
 b=HRa0oT7KZ4u1JBqVnkqVOQxoAyZkIHO66PJ/1GLaED24RgEmx1A1hjy2+v6WeL8kkX12dL0aNjwqOJdOOy7p3FYhP2rx7JKsdlFn6i08wCxUQRkmGHkgLK7ayMOdyG4Zq7IwKbwRUPTSCcnx62OhDuwtjIf4MaUTxskXkuKGYQfGOK8j1RCq67t33a4gvITmQxxqtBgP5grs2W26H58GxPJiApMfxVMQ40f10iOrytb9lFnZJYwdE//h3mhxa6BqgGZIyiY/PAs+/ecVOuiTYgiKLudgpIkEHP8eNW7mZar6+XVhN6A5gnZtvW2CtpmaW/BtJgRQVgKE874/YqPOnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtXV0/bToqyou5eFX7zCGcIeiZT1aBWAi2oubKwRKUw=;
 b=Ey7BPQn4EF7U2fnNPmN0QP1kO1ZPijxJBeG0sPmPy+J5ijKP+IYMz7aAmFFf4gzb4QbuOZCnHahYyXg6/jmVunn68eMfNj/CQhMWYvt6NyLOwVXJ1EW310xrfy1wwOzUe56Y40EZYdGqKieYTq2moqy+i7UVsZJuO0sASJsN5q8=
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        wl@xen.org, boris.ostrovsky@oracle.com, iwj@xenproject.org
Subject: Re: [PATCH v2] x86/vpt: Do not take pt_migrate rwlock in some cases
In-Reply-To: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
References: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
Date: Mon, 29 Mar 2021 10:44:17 -0700
Message-ID: <87h7ktetxq.fsf@stepbren-lnx.us.oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2606:b400:8301:1041::12]
X-ClientProxiedBy: MWHPR01CA0046.prod.exchangelabs.com (2603:10b6:300:101::32)
 To BYAPR10MB2823.namprd10.prod.outlook.com (2603:10b6:a03:87::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93595c72-5d6b-4486-cdfe-08d8f2da4882
X-MS-TrafficTypeDiagnostic: BY5PR10MB3908:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB390898C746C40C023A6A92BEDB7E9@BY5PR10MB3908.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IpWjTxm4RnIhy6PoNvUZ25mg5aIFOacEaKs3aZyBcWdxlRiHCWt4qmyZ/m9SV5kes7KeSSNmZU33gaxpo4z9oaFBiBAJcSndG2VTUQRHWvsnd+zr6ZMWozYBy45w27E7N2Kj+e41m435q3LyHi9oa8pJ/RMWAelWPuCNx/XKS4imo0DKN5tqo15i/ToZebTlyfvocjzMVgScbb9sncijjyI4zlEz6VYpYEWpDBh9B6JuMxbNYKa7vzl/cviAlgGrFQobkDhGGT3Cpl/zQ7UvaR9QjmRlTKLJ1tms8Zm/VNiW/CmOVmfxdi1Ueik2jTqhRwthPGcdD8DNtHmylCUHwSnD+DDYcmfHqDwRxpFkWrnB3NALxLa+Djsfne8CIJldvdbf+xGb9FNWw+y93IqLR9ajl6p7Q/hCEkKCcRMq+woHElWBKJ9hpBUXFb0Z+zmn4HH+ir3EBi1GAWwsCm/P4sErrldrbZd+UfdzkCgR+xfngYnwzvPOFMcq3KdvZTK+ymOmdlSlZZTLQF+uRVmdkaQzcUqf2sI5AgiRSwvQzW4MZMoZrRT0hKRYUfFZkmEtReuudjhePne6iQR7aesXOEt70CtT6HqcJAE6Oq/29gmCz/e9Gp+M4fHKvv0nbNWKIDulpCILHawkunt6XH0YZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2823.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(396003)(366004)(39860400002)(86362001)(6486002)(4326008)(6666004)(38100700001)(6496006)(66556008)(66946007)(66476007)(316002)(8676002)(8936002)(5660300002)(83380400001)(16526019)(478600001)(52116002)(186003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZGZNem14N2I0QUtaMDd0L2JUQVhpbUU2RlFhR25STlhhSGFuS3hpeVpEelNC?=
 =?utf-8?B?QTlvLzFpL1Zjc3R6N1FBVk42Y1ovb2NVcU5ZRnFydlQ2ZHplK3ovVzVuSm91?=
 =?utf-8?B?ajhnN3c3WVoxTkVhWk10Z0QrRFZPZU1SbTlHWHJKLy96dXR5d2tKL2F2MllY?=
 =?utf-8?B?YmkwUDVGUE4zNTViWFg5TFlsbDlHL3VHNWI4VXhabGJrMlgrWmlaQVhkVGh4?=
 =?utf-8?B?OU9HcGxrRE9uWVNuUGs3QS9ucUswVXhzejd0eStLbEFaYVRlV2x5SWlhazRh?=
 =?utf-8?B?NGtoQmRkYUdZSW1MYUMrc0pJYjcyWEJ3UkNSMHFkaXBaRXI1SzBGTXZ3OC9D?=
 =?utf-8?B?ZVRUbU5ScDBSREVJaVVFRmtaWXhuQnRMOTdPdVlhaVN0Z3lrKyttQ0FSbHZ0?=
 =?utf-8?B?L3Bta3lqMXQ1ZzB3SGtPUTdOR3g0YVNsTCtiM1ZJMCtKMlE4VlRaMEtMclBJ?=
 =?utf-8?B?blVYN2FPUkZhbWFnMWpoSWhIUStlTE1kR0l6L0x3OXI4S0RMeXcycUFwMDN1?=
 =?utf-8?B?aHBJd3ZaVnZyYUpVbXdlQ2dXTVpkSFNFdHZDM1RUenpwcHZzWVNqR0hHbExH?=
 =?utf-8?B?bXNrSzFzMksyT1Nidklmeis4bi9zUWJvQlFHLzkwb2kyMVhyUTVhSGptMXAx?=
 =?utf-8?B?SWtJenltS3JmMDRmS25rYU9oTTA0K1NWVHphYTNoYzJjTlV5WXA2M0NrN0tC?=
 =?utf-8?B?WDN4NkNDLy9YNHpHT2I5Ry9vQXl3dksrN3J6ZGZJbXlMZ2w2dE56MXVaRVJ1?=
 =?utf-8?B?ME9VTlhLWFFLdlJheHh2MHFjMVcxYlNIQ3EwdXlBQ2JFL2ZYMmZ3c1VEc0N4?=
 =?utf-8?B?RUxFMWd5U0U5MGxzeEZMdWVlRHJnWmMvanlQdUtta05NRmE0bFRxeFRqSHJK?=
 =?utf-8?B?M1VLV2o0L1NuMy9pci93Y0NPdFpIWTN6ZTdvN3NzZVpObWpUcXRnQXp6TDY2?=
 =?utf-8?B?bndJc2wzTjUyOW96cS9DUkVCN2UvaXljaUN4TkNYN1dER3hObzBGRDlZVTZN?=
 =?utf-8?B?QkRsQ3V3OHZLbkd6SDMvREhlekNmdFdTVm84T0ExVFh6eVpxbitiNWNzOWdZ?=
 =?utf-8?B?ZFordmVKT0luZ0NWTDJKNGNJK2FVN1EwRzNFcGdHYkxUMmxtYVFNakxZNGxG?=
 =?utf-8?B?ZFliMG0vSTZwM202UFJwY09oL24rK3UrYVhNYTlqUkpEdDkrK3R4QlEwMU5Q?=
 =?utf-8?B?dXMwaDZvOCtyM2NnRVVxcGdmQ1hlazQ4cVQ4ZGIwQTJQbXA1Umg3elA5R3ky?=
 =?utf-8?B?QXN3Z25jeE94eElrdEhjazRqZXRxRmY0dFA1V1VFS2hOSjRkWHNLQW14VFc2?=
 =?utf-8?B?TmZnQUhxQUF1TFZGQkxFektiS3I3Y1UxcFlBNEJFeEt4eWRuWHFmbzZvOTlh?=
 =?utf-8?B?QlZGRmJ5bVg0Uk0veVcxYmxuQ3lBbm9DQUZ4ZnQ2YnJVWEVYSDlvWnBOMWY5?=
 =?utf-8?B?S29CNmRMNkd0djZBSElBTjZ3SjlPVVRaYVVyMlN1aHZxektDWG1yMkgzbVY1?=
 =?utf-8?B?QVdteUNmaE9hR2g2dHN5elQ0ZmdPV0lEMENBVVdVM2EyeFdjZTh0KzNONjkx?=
 =?utf-8?B?d29GZWpjaEZiSWJwcmlRRHUzVmlPSUZNNGdXaUo3UG54eisvRllNVGwwb3Nt?=
 =?utf-8?B?d3NScTA0UWN3ZDJOUTA0TVE0dWZNQ1pQOVhqek9ueDNZMHRFckdGWFNONEJQ?=
 =?utf-8?B?eXd2dzN3ZktNUXBqaVJkRDBqcG5VWDlNVWFlS1NUR0pPN09iTEhrQUlJY2ZU?=
 =?utf-8?B?cGVBTi95ZkxTZDNub3pNOGxJMk0wY1FVY0t6WDd0ZmVWbzFyRFFDbWp0QzN1?=
 =?utf-8?B?Vm1UdGpXbGR3TkZIeGJjQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93595c72-5d6b-4486-cdfe-08d8f2da4882
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2823.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 17:44:20.7588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHrFudbDevfpiQCK4Lb3pSrDbQGZGcTxISHFI9dbzkF9n/h0DKtYx6MxyJmu/aJEP8XVuw7sUCZrPwHL+JqAkvsFYNK2cQNrKzHCo9CtLmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3908
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290131
X-Proofpoint-GUID: JRQ1n_MvO_GFhI9td4bfIVyYDri2FVuS
X-Proofpoint-ORIG-GUID: JRQ1n_MvO_GFhI9td4bfIVyYDri2FVuS
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1011 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290131

Boris Ostrovsky <boris.ostrovsky@oracle.com> writes:

> Commit 8e76aef72820 ("x86/vpt: fix race when migrating timers between
> vCPUs") addressed XSA-336 by introducing a per-domain rwlock that was
> intended to protect periodic timer during VCPU migration. Since such
> migration is an infrequent event no performance impact was expected.
>
> Unfortunately this turned out not to be the case: on a fairly large
> guest (92 VCPUs) we've observed as much as 40% TPCC performance
> regression with some guest kernels. Further investigation pointed to
> pt_migrate read lock taken in pt_update_irq() as the largest contributor
> to this regression. With large number of VCPUs and large number of VMEXIT=
s
> (from where pt_update_irq() is always called) the update of an atomic in
> read_lock() is thought to be the main cause.
>
> Stephen Brennan analyzed locking pattern and classified lock users as
> follows:
>
> 1. Functions which read (maybe write) all periodic_time instances
> attached to a particular vCPU. These are functions which use pt_vcpu_lock=
()
> after the commit, such as pt_restore_timer(), pt_save_timer(), etc.

I think "the commit" is now a bit ambiguous, it was intended to refer to
8e76aef72820, the fix for XSA-336. Maybe it would be easier to simply
drop the phrase "after the commit" since we're discussing the state of
the code prior to this patch.

> 2. Functions which want to modify a particular periodic_time object.
> These guys lock whichever vCPU the periodic_time is attached to, but
> since the vCPU could be modified without holding any lock, they are
> vulnerable to the bug. Functions in this group use pt_lock(), such as

s/the bug/XSA-336/ may make more sense in this context? Just to
distinguish from the performance issue.

Code changes look good.

Reviewed-by: Stephen Brennan <stephen.s.brennan@oracle.com>

> pt_timer_fn() or destroy_periodic_time().
> 3. Functions which not only want to modify the periodic_time, but also
> would like to modify the =3Dvcpu=3D fields. These are create_periodic_tim=
e()
> or pt_adjust_vcpu(). They create the locking imbalance bug for group 2,
> but we can't simply hold 2 vcpu locks due to the deadlock risk.
>
> Roger Monn=C3=A9 then pointed out that group 1 functions don't really nee=
d
> to hold the pt_migrate rwlock and that group 3 should be hardened by
> holding appropriate vcpu's tm_lock when adding or deleting a timer
> from its list.
>
> Suggested-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> Suggested-by: Roger Pau Monne <roger.pau@citrix.com>
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> ---
> v2: Drop per-periodic_time spinlock and keep pt_migrate rwlock (and thus
>     change patch subject)
>
>  xen/arch/x86/hvm/vpt.c        | 40 +++++++++++++++++++++++++++++++------=
---
>  xen/include/asm-x86/hvm/vpt.h |  8 ++++----
>  2 files changed, 35 insertions(+), 13 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
> index 4c2afe2e9154..893641f20e1c 100644
> --- a/xen/arch/x86/hvm/vpt.c
> +++ b/xen/arch/x86/hvm/vpt.c
> @@ -153,32 +153,43 @@ static int pt_irq_masked(struct periodic_time *pt)
>      return 1;
>  }
> =20
> +/*
> + * Functions which read (maybe write) all periodic_time instances
> + * attached to a particular vCPU use these locking helpers.
> + *
> + * Such users are explicitly forbidden from changing the value of the
> + * pt->vcpu field, because another thread holding the pt_migrate lock
> + * may already be spinning waiting for your vcpu lock.
> + */
>  static void pt_vcpu_lock(struct vcpu *v)
>  {
> -    read_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
>      spin_lock(&v->arch.hvm.tm_lock);
>  }
> =20
>  static void pt_vcpu_unlock(struct vcpu *v)
>  {
>      spin_unlock(&v->arch.hvm.tm_lock);
> -    read_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
>  }
> =20
> +/*
> + * Functions which want to modify a particular periodic_time object
> + * use these locking helpers.
> + *
> + * These users lock whichever vCPU the periodic_time is attached to,
> + * but since the vCPU could be modified without holding any lock, they
> + * need to take an additional lock that protects against pt->vcpu
> + * changing.
> + */
>  static void pt_lock(struct periodic_time *pt)
>  {
> -    /*
> -     * We cannot use pt_vcpu_lock here, because we need to acquire the
> -     * per-domain lock first and then (re-)fetch the value of pt->vcpu, =
or
> -     * else we might be using a stale value of pt->vcpu.
> -     */
>      read_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>      spin_lock(&pt->vcpu->arch.hvm.tm_lock);
>  }
> =20
>  static void pt_unlock(struct periodic_time *pt)
>  {
> -    pt_vcpu_unlock(pt->vcpu);
> +    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
> +    read_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>  }
> =20
>  static void pt_process_missed_ticks(struct periodic_time *pt)
> @@ -543,8 +554,10 @@ void create_periodic_time(
>      pt->cb =3D cb;
>      pt->priv =3D data;
> =20
> +    pt_vcpu_lock(pt->vcpu);
>      pt->on_list =3D 1;
>      list_add(&pt->list, &v->arch.hvm.tm_list);
> +    pt_vcpu_unlock(pt->vcpu);
> =20
>      init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
>      set_timer(&pt->timer, pt->scheduled);
> @@ -580,13 +593,22 @@ static void pt_adjust_vcpu(struct periodic_time *pt=
, struct vcpu *v)
>          return;
> =20
>      write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
> +
> +    pt_vcpu_lock(pt->vcpu);
> +    if ( pt->on_list )
> +        list_del(&pt->list);
> +    pt_vcpu_unlock(pt->vcpu);
> +
>      pt->vcpu =3D v;
> +
> +    pt_vcpu_lock(pt->vcpu);
>      if ( pt->on_list )
>      {
> -        list_del(&pt->list);
>          list_add(&pt->list, &v->arch.hvm.tm_list);
>          migrate_timer(&pt->timer, v->processor);
>      }
> +    pt_vcpu_unlock(pt->vcpu);
> +
>      write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>  }
> =20
> diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.=
h
> index 39d26cbda496..f3c2a439630a 100644
> --- a/xen/include/asm-x86/hvm/vpt.h
> +++ b/xen/include/asm-x86/hvm/vpt.h
> @@ -129,10 +129,10 @@ struct pl_time {    /* platform time */
>      struct HPETState vhpet;
>      struct PMTState  vpmt;
>      /*
> -     * rwlock to prevent periodic_time vCPU migration. Take the lock in =
read
> -     * mode in order to prevent the vcpu field of periodic_time from cha=
nging.
> -     * Lock must be taken in write mode when changes to the vcpu field a=
re
> -     * performed, as it allows exclusive access to all the timers of a d=
omain.
> +     * Functions which want to modify the vcpu field of the vpt need to
> +     * hold the global lock (pt_migrate) in write mode together with the
> +     * per-vcpu locks of the lists being modified. Note that two vcpu
> +     * locks cannot be held at the same time to avoid a deadlock.
>       */
>      rwlock_t pt_migrate;
>      /* guest_time =3D Xen sys time + stime_offset */
> --=20
> 1.8.3.1

