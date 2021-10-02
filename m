Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121CE41F8B9
	for <lists+xen-devel@lfdr.de>; Sat,  2 Oct 2021 02:34:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200873.355437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWSyh-0004I4-K3; Sat, 02 Oct 2021 00:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200873.355437; Sat, 02 Oct 2021 00:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWSyh-0004GH-H3; Sat, 02 Oct 2021 00:34:11 +0000
Received: by outflank-mailman (input) for mailman id 200873;
 Sat, 02 Oct 2021 00:34:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zBmR=OW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mWSyg-0004Ed-5w
 for xen-devel@lists.xenproject.org; Sat, 02 Oct 2021 00:34:10 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5693e26b-53ea-4a43-b5e4-50c86a46635e;
 Sat, 02 Oct 2021 00:34:07 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191NcfNj015729; 
 Sat, 2 Oct 2021 00:34:05 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3be440kdh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 02 Oct 2021 00:34:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1920VMTD140459;
 Sat, 2 Oct 2021 00:34:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by aserp3030.oracle.com with ESMTP id 3bd5wdcpff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 02 Oct 2021 00:34:04 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB3443.namprd10.prod.outlook.com (2603:10b6:208:74::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Sat, 2 Oct
 2021 00:34:02 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4566.019; Sat, 2 Oct 2021
 00:34:02 +0000
Received: from [10.74.98.147] (160.34.88.147) by
 SN7PR04CA0173.namprd04.prod.outlook.com (2603:10b6:806:125::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Sat, 2 Oct 2021 00:34:01 +0000
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
X-Inumbo-ID: 5693e26b-53ea-4a43-b5e4-50c86a46635e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Il7X1neTcjDAsgJXlsMa3DeMdWggDdEomMiTzBSgJRc=;
 b=FXjGROCV3bOH+ACz655PhqADcoOAGQwSy3AsCE4zCqi7YoeIoX/kDLah3ikudpL9sWlj
 2xKXyOW6Ic82+BmEWwWl2bGtsRIkwB32j5f74GICYlJB0d1ITHIAdOWCRpkVKYe4riR+
 GJbOVGO46vgEEGUM6dFL/UigVR/es7XW8jAYpUL+K5ZKcNKzbPJKbtQv2DqYXWa5oF3x
 JFyhmfWouPu/3D7F+enRuqShUm9MGUysU77aLkR9yV928ZyUtGCYwo3gDH/Ay2phYRGH
 ZIdZtq1DT+5morcgfLbaAkb5mryIZyZRaSLZcXqvgjWzGo7wKpJdi0esdUBQniEv0btl Pg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxGQ1+uDLGEAL5uwt/NG4Vkq/mB+XXmJokTqLKyoL9HeQlOTXGiJGuw6Zv5lVP8HVz3yvGTuyy/PD+G9FRrSRTynfX9N9L833n03RNfTWH3Lk7XKCiTDW2eOl35BAurAxQfs109759LOm1zfHFX0LZQikXbj4iqYFGXnTlQ+WqYSK4cICPuMKUg9bMHS87EMRx415eF35CUw1xh133hqjNfo3KCvHw3O1yhnjf9MJPQzAu8+ksdDlETMsW51EpnVekBQtEahse61FvxaWRulEnYp4x4fT89kbVfWGKQVXBTs1eYvDYOpEf1STph/egZTxUXvc7brrIeuv6FmsenQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Il7X1neTcjDAsgJXlsMa3DeMdWggDdEomMiTzBSgJRc=;
 b=j8LgZR5agCSqYXbKc9Tl5iwbB37K3QyriQjwWJ0Ux1NGKRzW0RnN9OERzAEAG5Rt64/HDFbsJIutqASP1krsncc8g4Ecm/nL3L5jXa5bC7xptEcUeNbGtdX6MHkH1wWY0G0JmQ1/X6/E1feSaiuFP6HxN6vcPnSychdRGCauvkQa/8nS+zLQ4rACdQrpXyYLn29zNvfKZHzSY6IZV65Bmo/MXQOEDu6sY9W3MtbP9668CggYVHXitBFFovHooGTUgjh2HwipqyQd9ZpMv5mTxEQUqs3mnVYGJZ/guKgMFUaPPwAo6BAeOq/ku+OXrfOC8XxQEIzYOTJKp2a9F12X/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Il7X1neTcjDAsgJXlsMa3DeMdWggDdEomMiTzBSgJRc=;
 b=CAISp9nWcYaQuu1ebMqltZammNQ+8OmfgxwlOKy3E8ESzOErypzeUYBENcL+X4MQUbdNpRe/ovfbmNtPvTsvef1dEvVX66J+XHCXjU6c7I4rNe4x8nPA9FothskBl3mZ+YNJpEeG/DIAvconf4BZC8kkoYJmLODqYiMocSEA5rM=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH 0/6] xen/x86: PV boot speedup
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <9f49ecdb-26d3-c38d-56a4-8425a567bf0d@oracle.com>
Date: Fri, 1 Oct 2021 20:33:58 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SN7PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:806:125::28) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5c4f0f2-ed71-4f91-2388-08d9853c5504
X-MS-TrafficTypeDiagnostic: BL0PR10MB3443:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB34433E0FF0FD37CD12A8A29A8AAC9@BL0PR10MB3443.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lJqn8tVqEuRpvueDBVRI4RJlLtZrnwH2ejGbtLim8pdQm0M70KrpIPQeFerjG0loNpi02OAgIYOoadw1SQ0cwRQl9qMa3VOqzh7acPlwCj+V7FYtp7QrU9DfuR0Owyrg5brZZrNJbhFPc0Y8Xy/DqxnOWLgDWO9jWvuAuSIHtNSMfQRxYm8V82d4F5U5E5pzwe6tkNyAxQDp+08iiVqAKolxxQ7U76/XXdJRaDHxdaagmKBWrxSD1J+w8c8tudA+JHdBC0XYnKd4Qxsi4ZIzBpJaooIPpDkpHGXz7mIUDC/S4SQ7jrgUuEkIWpV7cWnsIHs8r/X6zNRV/qGzf24lkynYr36MRetZF5C1IjbDBtfxNaSmNS2J+H0xMEi8d/fNaD4FDy0UZm8JfsaRIK7qLxMB7ArXDaYXLec0+dzIgQPIz7i4vkqgXx5SeQau3ZKHe1PfOcJuBKK3ZesQTF6pG7FqKhJ2ABOAdC+JyEj2750jl8sczHSPw1Pf4D6zA6KZmpArMTt+r4wh8CUDqUpjdxqwUOcsCqCY5gsh5a6AEUKJmypp8/sV62oHD4YaSF5IfaOOTd/Vu4OrdWZHcivciI+stmTlk1vlpcnUOsKobUNZcgLAXPi7bz46sKthY3p10kXQ/2BifHSCuIiURYqZTS7Gbsk/n7jcc3152j7IX2MQtkiZ/6RP43Ea4jcYmTNYjZ2wdrGh6GAsFujn5MDQ9KX/wZUWBRHnKtde7NEqiwU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(66556008)(8676002)(66476007)(66946007)(186003)(508600001)(86362001)(6666004)(4744005)(4326008)(26005)(54906003)(110136005)(36756003)(16576012)(8936002)(5660300002)(83380400001)(2906002)(316002)(53546011)(2616005)(956004)(38100700002)(31696002)(44832011)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWJDenUzY2U4Q1FOQ0pBVjVHeG9hQUhLYU9qa2h2UGxwZHZsRWFIaUN5RzdL?=
 =?utf-8?B?aG9oQm9zanQvSHVjblluaHJjMTdmdEpsWXdvL1gxVCtjMjlHUTd0eTNiazB1?=
 =?utf-8?B?TklPdHJoUktucWpUQ2Vab0tmN2dwRk1Db2VLSnB1SHRHMXloUkh5NGlxc2No?=
 =?utf-8?B?amR6c3Ivdk03MzVYcStDS0hYemE5K0krdkRMbzBDNklVSllVNWU1Y0JUKzdS?=
 =?utf-8?B?U2paNTB3cUNsSnpGN3N6T2wreFdCUldnTWVOcVhreW11L3VHaVE4T21pdmdM?=
 =?utf-8?B?VFZWQm9JVXA0VXM1R1VXSFE4ZWFQNmYzeDV5bllqcno0cnovYjNOZ2hJTlNZ?=
 =?utf-8?B?Y1IzQ0FteW9GRjZNMXB2bHZ6NUVJdDA4M0ljYTFNb0xlOExTSEhjVUIzVlk0?=
 =?utf-8?B?cDdpOXNKL0crNFBndHE2SmE3d1cxTHhBN0lCMEkvVHdVbFJMQXVLQ3A5VHNa?=
 =?utf-8?B?VjhEcE9yUm9BMlVGcGVseEtqaTRXbytEdWZ1Yi8rMWlFTkxiR2RBdnArc05h?=
 =?utf-8?B?ZU43aVBQNWtEZEdreDBRY1BDU0plV29Bd1Y4T2hhZnptcVBEU0JtM1I3anB1?=
 =?utf-8?B?OGVzb1NaTVBUV2pOYW9zb2ZMVnZJTWRGb2RKa0EzczRybHFFbzQxaER4dkFC?=
 =?utf-8?B?YStVNTdDelp5ejdxcDA2aDlPVlFWUnVPTElTZHkwNFpIZ0hJYk42d0Q1TndZ?=
 =?utf-8?B?TG81c0hydytTSlJtdkc5UnNsOVZyeFQyUGc4MWhhSTdzRnlGZmdMNjdiVEFM?=
 =?utf-8?B?ZEVPV2VTYjYvNk8rNDBXNWNYWHpsSDVMOCtydFEwR3JzVEQrTmRtYS9FMzZX?=
 =?utf-8?B?WitlcFM2RnFtdHVBNnZ6VFI0ZHpxVmJHM1VVNWErMVV2UFIwQ05zZW9hOTVn?=
 =?utf-8?B?cWl6TTNzUFo1Z3hESHhwY2lwRUlxU3NSZ0t2MUxTc1VOakdJRWxVUzJ0TXhO?=
 =?utf-8?B?L3NYVElERXJZall1YWVqWEQ2U042YlBVV0FCcHFORFJGYWJGOXpiMnJHRnoz?=
 =?utf-8?B?NDhpS2xabUJvMDRyWDZJK3dXZmJCemNONEg5S0ZJa3R2dTJPMnp6dnRaQVFz?=
 =?utf-8?B?UjhWZk1JWGhhaUNXSEhuMlcxakxTSkN4cncyekljWDFhU1VWR05SeUlqS2Fr?=
 =?utf-8?B?eTF3U3kwYlFwS0tmRlhHMU1RK0c3YWlSRzZoaWtvdjUxbWdJVktLaUtDUk41?=
 =?utf-8?B?T1ZyWHNtT1QvL3M5TG5uRnlmZjNFY0xGRjBQWFo1WktLWi93cUFmOVZoRHVo?=
 =?utf-8?B?aTg3K3gyTE93dEdnSkdVZ0I3bFZPZTcvcGdwZjB6M2p3MzBsK0RDNUdUZmFU?=
 =?utf-8?B?QkJJNUpuU2xuZ2FoUWhKMXZ1ZVBhVDMzN2V0S3pkWVk1R0J5YnplTjl3L3Zu?=
 =?utf-8?B?MGYrMloxZ1BaWDE5a1RCbnFiV01kUVlMYTUrOFhhV0Q1ZTJSMHkwMFlKSk50?=
 =?utf-8?B?bU5qSFQ0cE5FSFN1NmRmUmJkdk5qeEVuYUQ0bDVOMlJVVDRrbGFMbmRLWXVm?=
 =?utf-8?B?NEp3TGVrZnBkOEFGM2N3dE9rZlpOQmtveFl3WXIzdjdBNjNkNDFQdHpJbGQ0?=
 =?utf-8?B?MUFBdGloSHJySFBZWVhLUG0vdnRUcXNReEZHUy9jOTRCT2FGekhUOGVzclVh?=
 =?utf-8?B?Ym1XZ21PMGlNZVJVY2N3dVU1T2hKYlMwTDUvSmFWYlUyUU1zMHhrWmxzR3BM?=
 =?utf-8?B?ZHZ0SlZ2MHRSY1NyRVVzbFVZNjVyZVA4alp2S2ZSaTF4aWh4Z3M3ZlhUbnlw?=
 =?utf-8?Q?AJBaEqVJcN0JctzioJVFkwmonYSDEu17OA+Z4pF?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c4f0f2-ed71-4f91-2388-08d9853c5504
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2021 00:34:02.2414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYe+sSBSRPnhQHGXObjEvBujmY0RVJiHWgBUdMJr+/Z5oCc8a0/QI/zQgFOcj8S3Nu89DHjlGemQEoLEmejK2zCFKYyQ5SyE1cTm4Wq6B90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3443
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10124 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110020000
X-Proofpoint-ORIG-GUID: Gz9AbWBCSqxz8FxFYc1rCVUBPlNW0MQy
X-Proofpoint-GUID: Gz9AbWBCSqxz8FxFYc1rCVUBPlNW0MQy


On 9/30/21 8:33 AM, Jan Beulich wrote:
> The observed (by the human eye) performance difference of early boot
> between native and PV-on-Xen was just too large to not look into. As
> it turns out, gaining performance back wasn't all that difficult.
>
> While the series (re)introduces a small number of PTWR emulations on
> the boot path (from phys_pte_init()), there has been a much larger
> number of them post-boot. Hence I think if this was of concern, the
> post-boot instances would want eliminating first.
>
> Some of the later changes aren'r directly related to the main goal of
> the series; these address aspects noticed while doing the investigation.
>
> 1: streamline set_pte_mfn()
> 2: restore (fix) xen_set_pte_init() behavior
> 3: adjust xen_set_fixmap()
> 4: adjust handling of the L3 user vsyscall special page table
> 5: there's no highmem anymore in PV mode
> 6: restrict PV Dom0 identity mapping



For the series:


Reviewed-by: Boris Ostrovsky <boris.ostrovksy@oracle.com>


