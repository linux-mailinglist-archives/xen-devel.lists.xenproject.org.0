Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D157FD35
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 12:12:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374492.606564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFv4j-00012Y-8Y; Mon, 25 Jul 2022 10:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374492.606564; Mon, 25 Jul 2022 10:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFv4j-00010j-5Z; Mon, 25 Jul 2022 10:12:33 +0000
Received: by outflank-mailman (input) for mailman id 374492;
 Mon, 25 Jul 2022 10:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFv4g-00010c-Vi
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 10:12:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a58d402-0c02-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 12:12:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0402MB2931.eurprd04.prod.outlook.com (2603:10a6:203:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 10:12:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 10:12:26 +0000
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
X-Inumbo-ID: 4a58d402-0c02-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPqlv+TxzD4emqQUgJGFjAvVv9MNVU0T7ovGYNNMRo0v7qsS3+zFB7SDxtKD+zJO9lRIMs8L8lhke5LJ8mdqLnQ7JTjlh4JcOJ0m5ik/LRfQulyXsaOzx7QwFirmdqU20aUmkshkYHL2vlpVQM1MQeh90nXnYFRqXGyy1bpiRzOjcu2DFURXiQ0nbA+BIIRr/820If5wVio51XveRaBwXIpE2sk/M15c37BMO3XQee9AvOoXSgijf26RaRWhLrt3xdJPeMKCeeXKaBy8hMHRRltk4/86GRAsJvx0nnPa2mOn+yo6fXJfeYIRMFlvAeWSuQcpS6vnfPjq/1YRcAeJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KdE9xaqCyFWvZiVbiYAF/eDuRclX4SXpIVmBkhtA4M=;
 b=IGfGs7+F29ViYlezeco/3ZgSm8Dm7LrqA+L9AeAfcoEgDKxBckMthZ438RHmo/13MdU76WB0MpMpexCl9m3xdiRcAlTIuxx9rRL/QajJ2SRSZhczPihLmxo4iT7IsQ1Xb0/jvcqrEtF3bNgE0127nPV9m4/E2AaqEwP9TWIbk3mgAdZDJtopmRWnChGI/MEhU5jMTGJsPxIWfSlXznd3WszfWwlt817O2Gt/rUN06XXO5pz7EmbdJTTXdnUoAmj2cOjGEZNWrxWzK00D/MlX3xhJyvylEqXRyt8fgon0+oJsYFuxeLYZwaDRw0pOJ6cnLWrwEw+5JoLvV+v1QiSaSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KdE9xaqCyFWvZiVbiYAF/eDuRclX4SXpIVmBkhtA4M=;
 b=FKbA7bSeaqOkWjDIUEYygtgr7SmrVsmrHV4Ad11rp3bnmQnRUMaWnp9M1t/vg8yUk8NkUJqjscvTWTLABDNg6WnQaKbV6q0x6mxBmEt3+JrhCLHadzkrjObpyxAEkQ/kYZdsx1wWYH+vD+rgvlfEKMJtHRjluKnd9ZXRJpiXYtCSg7ZU92t/RTAJhYjCuNZQWp1pv/OB4Yrcv/k/8VlQ4vqRqf1qAdOXd6cGde4DiBifW+AseiNHI0NTFaONlMEQPMLJr7x5eTpTR/35Wrku8IqpbTlhErMVO8Z+13YDMIXfBkI1TRu/B1uV1XOlDJDVcg5CtLGnWuCkCHKrqspJYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f1949e5-665b-a153-342e-8b3482c8b9c8@suse.com>
Date: Mon, 25 Jul 2022 12:12:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm32: restore proper name of .dtb section start symbol
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0068.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::45) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 401d43e5-debf-4037-bf52-08da6e262c6c
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2931:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cn7tH9pOPJ110qRK5xva5lWcZjVwHLwzhotBoZENOTOR//mAntGSHdAFMKL/WY6OzAlUd5RJ6PZ8dhW8JA1a4LQ7FJ+izEzX1AjyWCCCWvX6KtngG/TsSBhF09ceZTQXnFOIBCTV9iA5X6Eandw4sX4xz6pGKuJNknqRXnJnQcIl3tqabATCjkmWtKI/HHldoqJtiTeHCS8sAwa7HuDHbmV4f2k66i7wjzPOuUUKvI6Voj5ycRYwWBdmbbwGeE8f6SdAUUAdV9Oc0WK7/9qoivFyldVJa2JK1GskSff14/nwEQxYwcnLTzNxYVJjnrgJmUigUnJ0JdKbWbqTnJiYJuo4INoKeCBflXlVShjas2ssviI+cEPKExqIvu9VsdG7bU3NRZyz7CtpRjTOhluHEoIMjfBgA6/UrijRXI0X+32BhGLaKXYxLkTQbHoN5+gBTyX/nXuSxmvOsuuJfGdOm51kUYkr0VqDAb54N5QJZYpYZRoqoSZ5sqf33vWQBobOzxoBvyJJhw93BTysN8XLXI5a+SmWcHiL7RooCXbCmVqG2PWKW6snaXXIwxuwwfxg106wfP4rrtezcgbG2KPYo6UBqjAbm+6CJRaC2Z9SKCvZvZJUzsaxecoocnc4S6i4WNFPF7E3XsqyoQj6/kmYshhTNJGXWy9YfID+YYRU5c0hogSWjCD752eLYZ+JrsCfvvntqSE/nymbVZxsqMtjgpuPNDXr6ekohH5DmiOFsg0FWI7Zg3v/y4fPpzcc4gohiKmaCi/53XhHFnoZMEKa9ROSsVsHIfOJQ3l+x6eo5vXc2piJehAAsonF9weNQtf5bqV1h9bLyxOseNebXrEpC+nOuRGkoMkE9jcY2JeGyK8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(346002)(396003)(39860400002)(136003)(41300700001)(26005)(6512007)(186003)(6506007)(2616005)(83380400001)(8936002)(2906002)(4744005)(31686004)(5660300002)(38100700002)(4326008)(54906003)(6486002)(66476007)(6916009)(66556008)(8676002)(316002)(66946007)(478600001)(86362001)(36756003)(31696002)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTRmZklsbVcrQ3ZjblJCeFBsSG5ISENyY2h6cDR5TVpabkJhNzdsdmV5QzRz?=
 =?utf-8?B?dFE3VWlOM1pFQ2VyVkZmek5ySEJGSGxBTUJ0WmpMOW42L2VHbFBYRE9RSUhU?=
 =?utf-8?B?cWRScm5VcGkwZW9YaXBkUDFoRWMxTUN4eldrbEt0b1lVYlBWSUFjUnRtTWIz?=
 =?utf-8?B?NXNodllVa09VcURRSHVVR2t5T0E2YzRWaEtNbzNoNTRwSDlhQjdvZmExUWhE?=
 =?utf-8?B?UExYcFBBanJTZENYWWtvYVFjcWpQUFhaM2RaZEE2UDlCVDh3WTB0dW9aVnpH?=
 =?utf-8?B?WER6RE14UGtGUXJFMFpvYlN3Y0JYWDJoNThFZEFwcjVlb0tZV0ZKaDVuRlBE?=
 =?utf-8?B?cWhzN2hMUHNOWUZRc0tFVGRGT1FrZy8wdzc2SUw5cHZ4cml3OG1oK21RMDZF?=
 =?utf-8?B?cDI3U2ZxSVlxdFRVWVFaWkZ3SFArNzA1OW1lS3dzSHUvT3FFKzg1WVMrVXla?=
 =?utf-8?B?SlFiNGdRdmxuR3EzQ2pNbkh5V3RvdVhCdXJna1ZlenRZcFhXd05yZ1p1M2pN?=
 =?utf-8?B?SFZRMUt6RFZ3RHVsNGFmZ1V5MnpQa2VKcjVxb3lYUjN0d3pSWmJvemRWWXJQ?=
 =?utf-8?B?cFpKMVlZekJBaXg2bTVlUnBCVEZGWUlQUjZoSXZ4N2E4WDlUUGk1akI2WnFi?=
 =?utf-8?B?TVM4U1RnL3VnYXNMU3ZmTWQ3UWVHdGRna3pNR3pRTUxIYnF2YXN6Y2dNQmMz?=
 =?utf-8?B?bHpmcE1MSUFpNHpSTCsxeDlQcWZmd2hnT091YzI2eWF1bkY5TWVyYkVrQzRj?=
 =?utf-8?B?WXo5eDRlOFN4TGRjUmRob0l2NUVKN1JEOTYyM2JoZWMzUjRyTi8xRC92TmxC?=
 =?utf-8?B?ekdtZ1M4a21IYnhES0h3UzlkdVNwV29wb2pvcVhFa2ZLYnNXcUpIM090THBm?=
 =?utf-8?B?OFRlR1pobzJVdjJWc01QcVdjemltN3lrbWYydERURFZ0UkxaY0E2eVMwM3hW?=
 =?utf-8?B?ZWt2eFBJNm9ZWDdlWnh1UmRYZFY1K1NkaGpQZVpsZ29HckRtdXBpTVN0T1J1?=
 =?utf-8?B?RGQrdngrNmx4WENFQzNYR29pWE93TEVwL3dHckVuRUtXNjVUejVEZFBqVlVt?=
 =?utf-8?B?MXd0bVd4RWhyRWdwOVVCZDg5aC9FR1FVYm01S005bDFwdW16a1JTK2l1djl0?=
 =?utf-8?B?UExJOHJVSkwwOGhCLy92ZGNjOGgrU25aVkJ1VUZjYWZoL0lxYUFxblFSMm9J?=
 =?utf-8?B?RUdJYkhONlM5eERnbUlqcDVGRTNtSitjU0UwTWwxR0ZYR0ltWlFKMHdRNHpN?=
 =?utf-8?B?OUVNbTE2ZThwYmZVaWsvblVkaDlucDdtQ2l2Ly9ZSkVOTHVGQlJsc0lSOUdD?=
 =?utf-8?B?NkhuZmNxY2Q5OS9nZlhNNmZaeFNBWUVPckJKdTFqbUpnUjZ5TkkxS2gzQXcx?=
 =?utf-8?B?SXA3cTJhRXZFbEE5RkZHUkh2WnJFalN3S0pmT3Y5bUVHb2ZBSUZmTW01amV6?=
 =?utf-8?B?SGRRdzY1SXNnY3VwdkhtMGxHcUM3OXhwd1duY3VSYlFsUUF2OEpWZGpmQTFH?=
 =?utf-8?B?U3I3RjQxYnlQbm1ERXlzWGRzMUpvS0lwS0lTb0dzZ0cvL2k0WmpvYVZDOVBX?=
 =?utf-8?B?bitRb0lOaVBucEVMZzNkaWx1SFloWXVkVDZtK3ByQnIyUnFIeFRtc01hTWwr?=
 =?utf-8?B?eFp3S2pHUXd6dVVCazZYdTlGL2d6SHpEdGRwaWFKd3p3dlV4WjN2UER1a2kv?=
 =?utf-8?B?dmpQY2lrZGIxWVFMa0d0S0Y0VDErQ1hQdWlsc0liRHg5VWxBQUdrZXJRbkNK?=
 =?utf-8?B?a2dmdHR1dW5Ld3RYMU5uQVRwVlpaSEwwUzVCd0ZCNmZEOFlSSWFnUHB2cU9p?=
 =?utf-8?B?c0RWUGhKNHZaZVNDa010VWpkVTgvaEVDUERWeXpzWlRlWU5jaC9tTVNMUmQ4?=
 =?utf-8?B?ckRJSlpCb2N6bkRMclJ6QnIwZjM5aW11M0N3aXA2RElvTjdJbnVwbE5BS2pn?=
 =?utf-8?B?RUpBOS9XN0pSTG52STZrQ0ExbGlXZEQ3T0ZZdUlYVlIzNTZWOFNCc0VFSXR2?=
 =?utf-8?B?akUwOHo0T1c4Z0F1SnZyZXBLcmJNQ3RlUis5ZFloeXl6UE5yVzlVOVNmOEIv?=
 =?utf-8?B?a0p3VnZwYzUzaU1qQ1h5dU5BWUhGMy9hTmg0Q2xUVkdyaFFwRUhwZWI5QVF0?=
 =?utf-8?Q?gCMqne9XwW8eWwpN0y85C9hIQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401d43e5-debf-4037-bf52-08da6e262c6c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 10:12:26.1983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jS2nCm4GDN1Pt0nVpaEpGm23oOylISl9EPmhJJZlbgh9EF6uTkTfLOsBrHgudRYUvQlKZ+IWfdj8EJoPIbGjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2931

This addresses a build failure when CONFIG_DTB_FILE evaluates to a non-
empty string.

Fixes: d07358f2dccd ("xen/arm32: head.S: Introduce a macro to load the physical address of a symbol")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course this really would be a prime candidate for avoiding the
use of linker-script-defined symbols in the first place, by using
.startof.(.dtb). If only Clang also supported that ...

--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -162,7 +162,7 @@ past_zImage:
 
         /* Using the DTB in the .dtb section? */
 .ifnes CONFIG_DTB_FILE,""
-        load_paddr r8, _stdb
+        load_paddr r8, _sdtb
 .endif
 
         /* Initialize the UART if earlyprintk has been enabled. */

