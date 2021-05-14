Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F0380D3D
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 17:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127428.239514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhZpA-0004ko-Du; Fri, 14 May 2021 15:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127428.239514; Fri, 14 May 2021 15:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhZpA-0004iw-Ag; Fri, 14 May 2021 15:34:00 +0000
Received: by outflank-mailman (input) for mailman id 127428;
 Fri, 14 May 2021 15:33:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpaq=KJ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lhZp8-0004iq-TW
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 15:33:59 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88b2a99c-88a2-4b74-a687-4d6133737a7e;
 Fri, 14 May 2021 15:33:58 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14EFQM4e003094; Fri, 14 May 2021 15:33:55 GMT
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38gpphrqxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 15:33:55 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14EFSvtL175312;
 Fri, 14 May 2021 15:33:54 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by userp3020.oracle.com with ESMTP id 38gpphaguh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 15:33:53 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB3073.namprd10.prod.outlook.com (2603:10b6:208:32::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 14 May
 2021 15:33:52 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 15:33:51 +0000
Received: from [10.74.97.42] (160.34.89.42) by
 BY3PR05CA0058.namprd05.prod.outlook.com (2603:10b6:a03:39b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.11 via Frontend
 Transport; Fri, 14 May 2021 15:33:49 +0000
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
X-Inumbo-ID: 88b2a99c-88a2-4b74-a687-4d6133737a7e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=lXQKrwoTgPb4jcMsO6+QH5R8pHFpAUlcHmVrmYQ365E=;
 b=cHzs7qXucgjJlsqwMwVFVvW0YW4UTO79R6/Uu75FkCQAb2ogavHJk3iJISCjI7cTYazr
 oFjnUjSAqzJHVCc1VkCyCmr+nkD9TBajScOp0UTH4GlPBMpLaAaqWbGUOJErIkjz4FPf
 4NAnTYRz+H9fF7J55+q14s82DNRm8d6c5ll4/cpzF+qzZjbFyDrZWE+wsVqIpeOQ3GC3
 Hywz7RRldunqKxB+i5OCsyPVPujIbjcF8wgcUrX4R7NGF+/7P3Kr4lJzjw46w6JrzAob
 xq52yz0eALIPWWsXNApH276ioPPgUTgvH/XPk7uv6V2LNt9BOxUNxVKDNI75Cg+GUmq/ /w== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzMjXKEWorApQIg8dQae0d5Ik9/S3aU1L2JW/f+qTWtzIlifUW0nCxYOwYydxfj39Qnfb6r8g+q8r1d04cjOeGrafvtKrhvO+oBcDxrhYxvmx7CLR0kX9xlxcaTOtWOfbSqx1gHWfafnVe8gYDpfxEq0pfiQuxxzLKrqwukHVkDu7m7EJSGwrKykhLmrycpgbBcVI+ixkavrtssvuz43AosjtwrQ4iqFtWMA08YPCVNtVhRMJCcmIbQLDRA9knjd29ZRPjxsFzPfXrVaoUE10gs0VV0+azBaJY6FB9YY5AMgB4QZiRijLPTXlUt1DZt7+HmYmdF+hoNo2bw1L15kKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXQKrwoTgPb4jcMsO6+QH5R8pHFpAUlcHmVrmYQ365E=;
 b=Rkig+iBVeK1qWgv0LHy9/popSDBgSJEQaJh4vFd0r6CTYVpGP+d90xLwCsbVGAVoFzPZkgjCVBZdXvkVH2whv22wgbuXSSgenZV63zAo/DSRXvJQPVrk/K9ImjmlgvLLVp2N/hl9J5ClDGaPMtrW8xjlz4mzUDFsbfsKQYwkA9OPC89fKdl6OT16QL5ttdi2aEy2ER0RLmKdKw6fWncbuD91aswyvgTe6Jgn6I01Dm81JHByQRSXNvtMSbxFdxV/MRAnMx2ybs48rA9ZZF5II06JspntEuGXHhlYCR+Q8DZ6Bgx9/Vb5oHRHHbdFgZgNM1xQqZqBvdoJeruqvNUAVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXQKrwoTgPb4jcMsO6+QH5R8pHFpAUlcHmVrmYQ365E=;
 b=Qckm+5gpTY8lqBq+YYGvYJL4jM6q98DdIPAf4TkOIF9QDyvqzTytTkQJVL4BvDzxUFT8oiIexBBatLtyQGKF47MJW0mcevERW7CZY2H4wZ/Jk9N+305RVQlLTEEJ+7F278FV0ltcd06r/Szn7Xk+iSydaifXZkNY/w4WqXaFRUE=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH v2 3/4] usb: dbgp: Fix return values for reset prep and
 startup
To: Connor Davis <connojdavis@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Petr Mladek <pmladek@suse.com>, Sumit Garg <sumit.garg@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
References: <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620952511.git.connojdavis@gmail.com>
 <0010a6165f3560f16123a142d297276e7d6c2087.1620952511.git.connojdavis@gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <f5c8d1a5-84fa-19fc-14da-6bec1705cb5e@oracle.com>
Date: Fri, 14 May 2021 11:33:45 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <0010a6165f3560f16123a142d297276e7d6c2087.1620952511.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [160.34.89.42]
X-ClientProxiedBy: BY3PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::33) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfe49b9f-67e9-4f26-556e-08d916edad33
X-MS-TrafficTypeDiagnostic: BL0PR10MB3073:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB3073BC24CD59A6B90A9093EA8A509@BL0PR10MB3073.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E4RRGvaes3tpCtOpn0cnD8lq/dlZwOCrqdHrDaA3J0GFZXSMMpK6yC0CYmqlOmv8i0KR1qWHQhMo/GsofuuNCSUeWSd7qt8fD5uYTvfqaapIRRD25MXCNtwZq3k34oN20FnHMB0AcBn4pkBFMiDyu8XVkfp1WIeYVskz6jx3LxB4VeFgFsgHZCBuZrShFMSqtVKaURo737Nb+9Uz2T1ltW9MANT8EHWE+EDA7ldX4cSYEiWRUYSbvKj+kZVQGHon5IHE9mPtQHayQiCXzHbHLfjm9Ca/bHQo2tc9XwY3cU8GZI4xLInefGeyRKu1DY/nCCdlUH7LOAeirEQS7NOa87LwmRWEndNkVHfz7dp01WVxh3xqkCLaSRP9Pt1eS88poeSWBzytASJv1+dRuyP6AY+2sHDg/spvq4zPDkzRqjFsgqis7EiFL9xMDtomu3fgzAll2ciICJ5JD1X30fQBNm2a9K8vQRbdE0Q1hHtL8UuOxDI+h9hLbuq5buxBxepT+6l85k6nqY4F0dddfOpjQxbVCWCi+9ZUYOvTpk5hgieZ+zFmFoAr3FuVs0JpRuRVlo2VFrGry8TX/ao/iyuk99BlJbmWUMxyu4d4ai7t+bWCmvKo3LH08Ze5Vks302hpgbCKCMXlpcelm68pwXfMfOA803kTN8004Z4SAFyI8BSwcQnzNZTZzqOq1TgghvBs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(31686004)(38100700002)(8936002)(7416002)(44832011)(54906003)(5660300002)(6666004)(2616005)(316002)(16576012)(26005)(6486002)(8676002)(16526019)(956004)(31696002)(66946007)(83380400001)(478600001)(186003)(2906002)(53546011)(66556008)(66476007)(4326008)(110136005)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?U2pIUUZCSXNQeGVrbk1QOFVJRzVEZzlMbG1SV3JZM2lGTzdJTnROM1NQZ0lF?=
 =?utf-8?B?R3RzWS9NUVpIWG1Zd3lodUg4T2t1ZGl5TUUxSHRLanFvMFAzcit4RUpjZUZO?=
 =?utf-8?B?WXFCS1RyU0xtWlhURDdjR0syRXFHVTlNUnNWckdDa3RlaEJ4cXI4cWFucThl?=
 =?utf-8?B?clhpNmROVDVMRm9jZllDUkhydjRxTFBlZitkZERtS3I3V2orNzViTFdZdWJx?=
 =?utf-8?B?SURDdDNVTXdrQW8zaFI4bmQ4V3dMOXlOTUVSN2NWOTVUQXhtK0txalNXOFlv?=
 =?utf-8?B?NXBZVmhRbVVtbU9VUGFadEJ5QXB6UFZaMGtPQWJWa09EVDZIWWFqRUxDeVov?=
 =?utf-8?B?NEoyN2ZGbDNsMmt0Y0VNeG8wcWd6R2dVcUQzelV6WERaaHRWRitIclVZSE0z?=
 =?utf-8?B?Nk1Da1BsS1NkRTA5dTBzM3VaL3BLT1RmTzQrK1Z1TUIyNkIwbERTMkQ4UDdT?=
 =?utf-8?B?eUw2a21WTEpnMVJOMW1Denl6YVRYbS9GdVF2UFVQOExwZ2YwZWxlVkI2a2Jn?=
 =?utf-8?B?blNHUXNhaDZKdFZ1Y0tCK09LUlV6bitqQzJPMktySzlEMUo5MXcvN0N4VUkv?=
 =?utf-8?B?Z0U3VFlxMzk4cXNESDJOZXoyVHQ3YmpCTFBnazByT0dHVzAwWmExbXcvT3p5?=
 =?utf-8?B?a1QvZXhKUnFIeUZ2NlJ0c01IYW1MekpYSFM5M1lCQy9nQWxranZ5WGJaTjZq?=
 =?utf-8?B?ZlFwQWJYb09NQjBKc2tMSGlhUm1nM2RtVXVNTkU2eisvbVZHR2xFU3M1c1FD?=
 =?utf-8?B?dnloclRNb21seFdTSmo5anA4MENVU2t4bGxIUDBqNkd1b2lWb1cxYXdTUWp3?=
 =?utf-8?B?alByZDlhR0xCSU44NVlEcUlSQlJETmxQUFUyUzFmU1ZkNnl0aEhwMm91YUpQ?=
 =?utf-8?B?ZkVuL2JQY0ozYzNNYUkxSmlqK1BpNGJkV0wxYkVwV0VuWjdiWE5vYUtFMXNR?=
 =?utf-8?B?OS9nQzJjclA3d1RRZkgwNG5sbk1XV29ZM29paEwyUWxXU3hrOUZzSzFIdmdW?=
 =?utf-8?B?TExKWUJBTEdSU0VwUHdrNlU2Z08xQ1I5MWxianlDZWdtL0lZblI0dHh4Ym82?=
 =?utf-8?B?em5hUVlwbW9GVHJFVG1qWFdSSEJzMUozRHFzOFZ1RWl2TXcxMGtlbTRyK2Rv?=
 =?utf-8?B?SkU2MFZwMlREUko0dlZ0L1AyNDE4YmJlTTk2MStmdlZYTnoxQ1l5dHE4dTNG?=
 =?utf-8?B?ZGV5STVBOFNza20rZERGZDA0QnZHcHRzWlVHMHQ2SG9RUFZvN2JyK0RSV1Zs?=
 =?utf-8?B?Q1dReE9hV2g2NXYvZytoSlpYakswK0cwUUlDZ2hyZkhOZWd4S1lreDU5T2NE?=
 =?utf-8?B?b3JSRkFlaVh4RnM1eC85TlNqb1hjb1VpeWJIbXJFZzV6akJCbGhlWmc5Z2Jx?=
 =?utf-8?B?Z3pFNDB4WDg4bUFwbDJzaHVKWEcvRlozWis1SldPVWdEQUYwTTM4UmZSU3gr?=
 =?utf-8?B?RDVGdFc1TDNwVnBQMm1PVUJoMkhBcTM4bFl1Wk5pVUJmRGhwZ1NyMXBFMTRw?=
 =?utf-8?B?Q2FuZDJhQ2FaVTNJc0ZjSG8yazE0ZmQvVmxralltejNHaVMwVXdxYkx3MkFI?=
 =?utf-8?B?SGxjWVFsd1lRSzc1cDRkWDdOM296Um5kampmYXJReXVqaTVpVUVibk1kQTJo?=
 =?utf-8?B?b3VLck4zNkh0alYwSUFrV3Y2UVNrU3hHVW1SOXFneWRrUE1IR3FjVzZEakI0?=
 =?utf-8?B?MDA0LzljUUx2RFZib1B2YytDWCs3VHBSeGhoaVhPT2pMS0d0NnVIYWxFMTRX?=
 =?utf-8?Q?A6tQtjKSf7yUwhIaigEiVdbR4Km/GmKIY5RNMua?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe49b9f-67e9-4f26-556e-08d916edad33
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 15:33:51.9364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfy2qshqkwJh2sT6ddAdJhGcEf8rSg5pfYZOy0ULznhsSKTtTs1MO4rWjC0uAK6D6IgeWp7Z9P8LykXKexYTEsuKYivqsKQ41gD8ILICvy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3073
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9984 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105140123
X-Proofpoint-ORIG-GUID: elp2a4PUiRAdgbmB5hjZO6XK-RRfDT19
X-Proofpoint-GUID: elp2a4PUiRAdgbmB5hjZO6XK-RRfDT19


On 5/13/21 8:56 PM, Connor Davis wrote:
> Callers of dbgp_reset_prep treat a 0 return value as "stop using
> the debug port", which means they don't make any subsequent calls to
> dbgp_reset_prep or dbgp_external_startup.
>
> To ensure the callers' interpretation is correct, first return -EPERM
> from xen_dbgp_op if !xen_initial_domain(). This ensures that
> both xen_dbgp_reset_prep and xen_dbgp_external_startup return 0
> iff the PHYSDEVOP_DBGP_RESET_{PREPARE,DONE} hypercalls succeed. Also
> update xen_dbgp_reset_prep and xen_dbgp_external_startup to return
> -EPERM when !CONFIG_XEN_DOM0 for consistency.
>
> Next, return nonzero from dbgp_reset_prep if xen_dbgp_reset_prep returns
> 0. The nonzero value ensures that callers of dbgp_reset_prep will
> subsequently call dbgp_external_startup when it is safe to do so.
>
> Also invert the return values from dbgp_external_startup for
> consistency with dbgp_reset_prep (this inversion has no functional
> change since no callers actually check the value).
>
> Signed-off-by: Connor Davis <connojdavis@gmail.com>


For Xen bits:


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


For the rest it seems to me that error code passing could be improved: if it's 0 or 1 it should be bool. Or pass actual error code, with zero for no-error case, such as ...


> ---
>  drivers/usb/early/ehci-dbgp.c |  9 ++++++---
>  drivers/xen/dbgp.c            |  2 +-
>  include/linux/usb/ehci-dbgp.h | 14 +++++++++-----
>  3 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/usb/early/ehci-dbgp.c b/drivers/usb/early/ehci-dbgp.c
> index 45b42d8f6453..ff993d330c01 100644
> --- a/drivers/usb/early/ehci-dbgp.c
> +++ b/drivers/usb/early/ehci-dbgp.c
> @@ -970,8 +970,8 @@ int dbgp_reset_prep(struct usb_hcd *hcd)
>  	int ret = xen_dbgp_reset_prep(hcd);
>  	u32 ctrl;
>  
> -	if (ret)
> -		return ret;
> +	if (!ret)
> +		return 1;


... here or ...


>  
>  	dbgp_not_safe = 1;
>  	if (!ehci_debug)
> @@ -995,7 +995,10 @@ EXPORT_SYMBOL_GPL(dbgp_reset_prep);
>  
>  int dbgp_external_startup(struct usb_hcd *hcd)
>  {
> -	return xen_dbgp_external_startup(hcd) ?: _dbgp_external_startup();
> +	if (!xen_dbgp_external_startup(hcd))
> +		return 1;


... here.


-boris



