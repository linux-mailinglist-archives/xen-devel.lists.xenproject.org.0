Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D6234D97A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 23:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103266.197060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQzEO-0006RA-1N; Mon, 29 Mar 2021 21:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103266.197060; Mon, 29 Mar 2021 21:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQzEN-0006QV-TZ; Mon, 29 Mar 2021 21:15:27 +0000
Received: by outflank-mailman (input) for mailman id 103266;
 Mon, 29 Mar 2021 21:15:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmwh=I3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lQzEM-0006Pz-Ep
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 21:15:26 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52edc7c8-c85b-45d3-ad43-76f9ab5ebb0b;
 Mon, 29 Mar 2021 21:15:25 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12TL8u09028614;
 Mon, 29 Mar 2021 21:15:23 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 37ht7bd4gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 21:15:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12TLAkVo131526;
 Mon, 29 Mar 2021 21:15:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by aserp3020.oracle.com with ESMTP id 37jekxp8rn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 21:15:22 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4416.namprd10.prod.outlook.com (2603:10b6:a03:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 21:15:18 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 21:15:17 +0000
Received: from bostrovs-us.us.oracle.com (209.17.40.37) by
 MW4PR04CA0095.namprd04.prod.outlook.com (2603:10b6:303:83::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Mon, 29 Mar 2021 21:15:16 +0000
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
X-Inumbo-ID: 52edc7c8-c85b-45d3-ad43-76f9ab5ebb0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=g3s/RCDGEyaC3QTwLUFnQb6XJRasTN8+0afNbC6QMlw=;
 b=NVJxLNnGB77N0yexChq0RsBgXUSbhYqB5mBCvsX2EZddh1ySMdlX9NoAydmtzHhpY/j2
 Ck0gkdSAUL552tJbrbMhQFG6vC+twGyPzq8PSft8Aha5NYLgAp82I2gZ3jcVnlPYY+YY
 BJn1Z48sjnmQtJh5H5TuCkCjgCrQpoE+8d9TX2zyETVMwhNON0FbNW6C5iJo2EjllGzV
 jEVgVyR9OawIFzRW7M2wMJZGYxHTWOMl1kSdw7jYBxhZfkFJpFoiSCDgqgM4FOIuRmqr
 vR2OSWtEYJ0vSysh+MNfAUW3IhbxowCRx8q3+hh9Zq3raglH+dUr+JRDnmlRsUIIfoPh ng== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpH9daAzIyM1kOKFsvOJPb7DVkBg311L0Z4U7Yz3EthzRqyQw79hL8ihyr+WJq6gJCNTISToI6jPIsD3d1ASvxoBE8vnPMT0KWhrEKH8zmd+5ZS12DcaeSNCdkOLSYgBZzMVQ6n1GDyawkWlLvxsYRJIKZrayL9jJBzneqvq60pHjZTj0Gl/QcTq4LtUVjDv5URmolhLPFnbHDSSVniuU+TfEGstX2NG5eYYYqPi4Spt9k1rzQcbRHm/qdVPxAPgRbhMtEgOaMHkReSIwNAm0B+GDK1Kk1mODKvJkwAt0hEViV9d8K3G11pF5GwwA/jL1WpQRx/rgTp5M1j2NsElWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3s/RCDGEyaC3QTwLUFnQb6XJRasTN8+0afNbC6QMlw=;
 b=gU4ST/B5e4QQYTJD7vtz0Qq8x612XcXMv63aXFpMn1aKuunBpVNZV32YnWFNmYSgf+pvHhF1s5bQ7X+XYCW6ggLs1+Kp09rOZ6i15uBOA2xQVQsLa5nkr4AY4EPz/ilMpMOj/X9gzg/cZ+OUF5REI4sLeLU3G9jn1OrxrXgyxHlbUCyYmRbjkIobc/sWJx1uR0AaS8kGNvd1PwYsVLVn1pXRZr4w3GG0KT1xxWSj184P5Wi+pKnlRuvsut4QuESm64tTbN1zBEvUJCsQJM4+ZPtPjWQrmW3SF4Lm/xI2a/FpRl5gRIbvkCKJePfPzuD5QOO8k1m3xgfXGjxbTU7pUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3s/RCDGEyaC3QTwLUFnQb6XJRasTN8+0afNbC6QMlw=;
 b=hEYpmcFeRdvenpVVcAEHkUZMzrb9oQ1FA5SbbCa2OgbJYvZYT2TqdDtjWAYy9tA74JU6qaMpCq72o8D3Ko0jQIlZ1hk7LsFTbU9LhxMw2GV+qxqw2WjEKmQ8OuuJH+f/rk2b1isJnfX7895favJpFNlZ/dnISG0TU7NBX+tDE5A=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        wl@xen.org, boris.ostrovsky@oracle.com, stephen.s.brennan@oracle.com,
        iwj@xenproject.org
Subject: [PATCH for-4.15 v3 1/2] x86/vpt: Do not take pt_migrate rwlock in some cases
Date: Mon, 29 Mar 2021 17:15:01 -0400
Message-Id: <1617052502-14181-2-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617052502-14181-1-git-send-email-boris.ostrovsky@oracle.com>
References: <1617052502-14181-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [209.17.40.37]
X-ClientProxiedBy: MW4PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:303:83::10) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d03350d-8e52-40b6-f8d7-08d8f2f7c0bd
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB441611929E9B74A25499475D8A7E9@SJ0PR10MB4416.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gporBrCHo6zVJfZCTQfeAba5Klga78LAmzmN5W0LLP1pfRyWIaBy/+7FVeZcdIA9emHoLNnQXqYXV25HRAU7dyNtkaWSm4EAggxCpM+od4E6phtzvqf2ErzyMRXTkx+PGjUStkbkPq6tO6UPFJ5uPFAmuF0CMo8SQTCBxvM8haMlLWxI3JlSf28MerxAa9wrYEjHDLcwrd6cqxNxf0ZI+BWjPoo61MoRDSLHC+OQ5JRXlQnuhvNBQr99m/2o4bmP6RDyz8GMxQZej5BOjo7uA8fkebvV/3j273JcZFjynlasqtBVD53zkZ/NqgnIcGYIN+OzYNR7xe+kZQhANcIToW4hRjUMY86Ll0ts4J0RWhnb5IwrzBcjiRGoNYMHV1tEdMkfB1FuBv9RcGhss7ECVEfF6P/unK7DQvTsfaFiXkijssuLHdYpUrXoyPhBzFKqmVXgeIOpjwTd+/1tfiYfp03kCZ3MsJuQeS/iSANRNC8Kgjufiz9GFVbO1Lx0usNXDUw5bKWuEzLxdEHw3safvBh5kmtT79WAfUQMpDCjEE5zrVUFGK7ZenNPS4JstiDKAtlNlD5lRE6kd4rbHeXWeDyb+s34TeHw78EBOTQCfVFyJ83IbKsveO9D87U/0d6BQ4Hr3jn9HbE9o2t7cyOUMfETqWB1dCHtCibXBcfaNNY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(396003)(376002)(366004)(316002)(5660300002)(36756003)(6916009)(8936002)(6666004)(83380400001)(2906002)(16526019)(186003)(44832011)(2616005)(38100700001)(4326008)(66946007)(478600001)(6486002)(7696005)(52116002)(8676002)(956004)(26005)(66556008)(66476007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Rkx4WTRpRUEyYUFud3JRcWZzcHYwb0hxQXZnbnZwMXRLZXdVc2RNYXBIZ0tS?=
 =?utf-8?B?eDFJUENuWldIZHZ3OGUzWmZOUGhWMUJZUjdtVmpPeDhJVkRnYkc4cUNzVU9x?=
 =?utf-8?B?N0JkazJCajIxWlBmdVBoNXlJOGt6ZXhnM1p0anlXTzIvT3Z0YVNCVlFmU1Fa?=
 =?utf-8?B?WElBTHNJRk5YQ2R0TkNEQzlQY2psRFRzc3BkZ2xicUFCU0pWRWN4Slg4OENO?=
 =?utf-8?B?YnMzMmJRdFVTa05qMENHZ1BVT1ljUGdrYTlrTkpTUE5BZ3hzL0dmS0hiT2hj?=
 =?utf-8?B?cmpjdHhUcGU5eXl4VVkycjUwRlE0MkoyLzBWcWIvRVh4WDdoS25BUENUcmh2?=
 =?utf-8?B?Q0VGSllOU01pSFVJQmNXRmpGV0FMSCsyUW0rRDhIeElRTlVMakJpajRnMm1s?=
 =?utf-8?B?ZFpteEoxRnNmY3pyd2NLci9TUGtkOEczZldZTDVaamY5UlFvMVBpNDQzclp6?=
 =?utf-8?B?YWJkMkN5bFB1emp6ZjlUUTk1T3NFbjlSK3dJTGtVY0x6Z2ZqREdTWk1UZGFy?=
 =?utf-8?B?MkpQQWFRQTBlWXBMKzVzS0R4TzdHUkVzOGFFWWhoZjJ1Rkh5emJlQlU4cnky?=
 =?utf-8?B?cmduTHVCYy9HSzFCcTFiVWtxZ1NXTmRRN0F3VHR6UkRnNnlmRVZJZzNBY0x6?=
 =?utf-8?B?Nm5uek9tc3o1cXA1WEFkUGt2blI3Y2M3L1pLd09tTDZHL1NOMXJGVmRMRjMx?=
 =?utf-8?B?L0ZnbTlnR1pvR2lXcVhCSUJSdmI1THkwUHJDLzh4SUNiUHMrd1FOV3VEZVZO?=
 =?utf-8?B?d3BTYmEvSXJaZ0lhUlNpdWNHZmhQbmlVWE4zOStVMU9kL0dPM0JnYXpEUHpr?=
 =?utf-8?B?QlhYd2lrU0xCY3hHVVVBQ1BXUjd1WnVpL3RCUnZDdkVyODNwQXdOL3pQTndY?=
 =?utf-8?B?NThNNUVnRmtNa204VSs1VEc1RnZGRUJNWnRNeVdBWFV0RWgzVFJsMUNjblho?=
 =?utf-8?B?VitmUzk1bzVCdGxJanRHcFF6bEdTS0krUDRsbjRMTGNUcjlhckF4OFRiNHRx?=
 =?utf-8?B?QjJwL3k4cWMwd3cxVkcyL3lBd0lhNXVnaGlQMVRNL2RBTm1PNFhyQWdqYUdT?=
 =?utf-8?B?Z200dnBibm54R1ZDcDRheHI1YXJ5QllhVkcwQlJZeVBJNkpvQm56YTlGRU5S?=
 =?utf-8?B?UWdCcXN5clltOXN3RXBPVk0wZWtWV2orczdodU1vRmFmNEVXeER3cEdZWGdW?=
 =?utf-8?B?ZFFxT0VpbnpyQzdmdEtTZnhqbG1xcHQwb2dlTFpVaDlKaXFnSWlxZ2RMcDJh?=
 =?utf-8?B?aWRDUi9PRVVLaHRmVGxRLyt6bXdMUVB0Tk53ZzFUVXVqQ2d4UFlKZ0lZa0dR?=
 =?utf-8?B?MCtaYkU3cjNySm9EaGljbjA4SFBseHAyZjR3aDBaVjRYWEQwNUtBREFlS05E?=
 =?utf-8?B?SHVXQTZCTzF1bFN3eCtldExScEVDZHJHdnpOUWR3NUVteCt5WmhFL1BCSmFJ?=
 =?utf-8?B?VlhWNHg1cU8zWmgyb0xkamE1MVVYdTBTK0xYbU9DMTcxVHJLUGtMSmZoTHVC?=
 =?utf-8?B?YXdzWC9ndkVHOXVJNjZLSXhsSCtmYmMwUmdsR3Bpb0UrejVmKzhDNXp2dldR?=
 =?utf-8?B?OUZjUjRiSnhRdXVkRnh1ZEhtbXFSL2djSmp1Sk43UDQrMFJKNEI5R0Q4NHFq?=
 =?utf-8?B?SnRqWWkzY2d4b3Q1TjUxa0VkMUJDWUFJVm53dTZtUXdLdGdZVEwzdjV0UHB6?=
 =?utf-8?B?dXQ4S0Izb3BsOTI4aWRMWmFRK1NZY2tLRHBTSExoR1RmZkZHTUhjRkp5Vita?=
 =?utf-8?Q?J1lIO1Eij+9WwyDJi0w+Ocqoe+P08PaFuHYmUa6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d03350d-8e52-40b6-f8d7-08d8f2f7c0bd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 21:15:17.8633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+cnL/DSWQN7cfSsaYgJYzc5DpGERbRe37lYEbxUcFhE76qvy606s425YEGMUUvFgWj5+N+UQrJnv/mPXH+LrZrq9q+7JwDVqfYlTG542n0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4416
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290157
X-Proofpoint-GUID: lUVoQD8gmjRWIznPSEdIL9OorTfsgQJO
X-Proofpoint-ORIG-GUID: lUVoQD8gmjRWIznPSEdIL9OorTfsgQJO
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290157

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

1. Functions which read (maybe write) all periodic_time instances attached
to a particular vCPU. These are functions which use pt_vcpu_lock() such
as pt_restore_timer(), pt_save_timer(), etc.
2. Functions which want to modify a particular periodic_time object.
These functions lock whichever vCPU the periodic_time is attached to, but
since the vCPU could be modified without holding any lock, they are
vulnerable to XSA-336. Functions in this group use pt_lock(), such as
pt_timer_fn() or destroy_periodic_time().
3. Functions which not only want to modify the periodic_time, but also
would like to modify the =vcpu= fields. These are create_periodic_time()
or pt_adjust_vcpu(). They create XSA-336 conditions for group 2, but we
can't simply hold 2 vcpu locks due to the deadlock risk.

Roger then pointed out that group 1 functions don't really need to hold
the pt_migrate rwlock and that instead groups 2 and 3 should hold per-vcpu
lock whenever they modify per-vcpu timer lists.

Suggested-by: Stephen Brennan <stephen.s.brennan@oracle.com>
Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---

v3:
* Updated comments as proposed by Roger
* Updated commit message (Roger, Stephen)
* Added pt->vcpu==v test in pt_adjust_vcpu() (Jan)
* Use v instead of pt->vcpu as argument to locking helpers in create_periodic_time()
  and pt_adjust_vcpu() (Jan)

 xen/arch/x86/hvm/vpt.c        | 44 ++++++++++++++++++++++++++++++++++---------
 xen/include/asm-x86/hvm/vpt.h | 18 ++++++++++++------
 2 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 4c2afe2e9154..560fab9cfc60 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -153,32 +153,43 @@ static int pt_irq_masked(struct periodic_time *pt)
     return 1;
 }
 
+/*
+ * Functions which read (maybe write) all periodic_time instances
+ * attached to a particular vCPU use pt_vcpu_{un}lock locking helpers.
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
+ * use pt_{un}lock locking helpers.
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
 
+    pt_vcpu_lock(v);
     pt->on_list = 1;
     list_add(&pt->list, &v->arch.hvm.tm_list);
+    pt_vcpu_unlock(v);
 
     init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
     set_timer(&pt->timer, pt->scheduled);
@@ -580,13 +593,26 @@ static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
         return;
 
     write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
+
+    if ( pt->vcpu == v )
+        goto out;
+
+    pt_vcpu_lock(pt->vcpu);
+    if ( pt->on_list )
+        list_del(&pt->list);
+    pt_vcpu_unlock(pt->vcpu);
+
     pt->vcpu = v;
+
+    pt_vcpu_lock(v);
     if ( pt->on_list )
     {
-        list_del(&pt->list);
         list_add(&pt->list, &v->arch.hvm.tm_list);
         migrate_timer(&pt->timer, v->processor);
     }
+    pt_vcpu_unlock(v);
+
+ out:
     write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
 }
 
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
index 39d26cbda496..74c0cedd11cc 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -128,12 +128,18 @@ struct pl_time {    /* platform time */
     struct RTCState  vrtc;
     struct HPETState vhpet;
     struct PMTState  vpmt;
-    /*
-     * rwlock to prevent periodic_time vCPU migration. Take the lock in read
-     * mode in order to prevent the vcpu field of periodic_time from changing.
-     * Lock must be taken in write mode when changes to the vcpu field are
-     * performed, as it allows exclusive access to all the timers of a domain.
-     */
+     /*
+      * Functions which want to modify the vcpu field of the vpt need
+      * to hold the global lock (pt_migrate) in write mode together
+      * with the per-vcpu locks of the lists being modified. Functions
+      * that want to lock a periodic_timer that's possibly on a
+      * different vCPU list need to take the lock in read mode first in
+      * order to prevent the vcpu field of periodic_timer from
+      * changing.
+      *
+      * Note that two vcpu locks cannot be held at the same time to
+      * avoid a deadlock.
+      */
     rwlock_t pt_migrate;
     /* guest_time = Xen sys time + stime_offset */
     int64_t stime_offset;
-- 
1.8.3.1


