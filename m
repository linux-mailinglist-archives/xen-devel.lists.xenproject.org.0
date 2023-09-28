Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30567B137A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 09:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609295.948295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qll2B-0003tl-4k; Thu, 28 Sep 2023 07:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609295.948295; Thu, 28 Sep 2023 07:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qll2B-0003qq-13; Thu, 28 Sep 2023 07:02:03 +0000
Received: by outflank-mailman (input) for mailman id 609295;
 Thu, 28 Sep 2023 07:02:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qll29-0003qa-C3
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 07:02:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb772a1b-5dcc-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 09:02:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8055.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 28 Sep
 2023 07:01:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 07:01:56 +0000
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
X-Inumbo-ID: eb772a1b-5dcc-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8OP2uujbZjt2hEsXLa1W7apm8GJO4oJtqTVfK+aZycEEMZ8CkGKN8lYfbds6ONfng1eyRbsNPt+bCEU3M5Bf5k5eb8B5MqEbx+ifr9JGuRKiXupWZiY+dO157MkRYMsNws9jzIpspO+Sz99mVPoKyBkUgn+L6cB0uO4HSVZgsrl5NMDV6rJJY5rHBRbb1xJ1Dk/A8kU5QsHCF2OHY597PuIAmnReNfir7qeLBllbtSvMcDWz7RTzrQP1GT9qpKySqzjXcR0cTxgrdJH+0YwI+Wmu0Vsr8B5U4IMQT0j2JcT5CGanumJ/8p/HgpiBvt0AjZJiQL6yarUTWITTMdyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oufazdANeZ9w0vDBuU2Z3ztqUcCD/UC60JbgAsH595s=;
 b=fnQEwAcdIkG/EshODfg5GrHITaUesvJiyX7YeVFq2mRziu/3KfZ3d4TCMbydFqbiYN9m8DSfHqFwqtnIjYH+wH6PAUyuBHCWY7eKXi0aMiKHxDMPRoylW5CLOzs0/mZFXQAhiFvVkTMYz5PesJhPJKOgu2vZUVKK1JqNjJfmhJnvG2WNpi72vbaRvzm4RgwnaZs+OZObQfV18icoXo5AgQur2GgVAO7wZ8DA0S1IU1eY2+RxwGiF8rMpRpAQb0Ljg9FBEmqNTaJaQ+x92tLCozPOpggr4YSh+Z6zU/icFUk2ES3CwmZRTrml0xLA9ADUf/XvD8f4g3s41VBxfR6A7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oufazdANeZ9w0vDBuU2Z3ztqUcCD/UC60JbgAsH595s=;
 b=IpV/id5KLZYwoYKkNSQ4Ip9Y2u6eRuDZ8xZGSKz0dZxv2nD31t26Y5rUdvyMtStTAGJZ6/W2Y4xHBQbNdbe5IKvuZXj+aOo8o5Oe1s+FdKSathp5O3C6s7JJdQRGzfOlBg/Gzb71ZfqRhV+kDGr6ycjBI5QNRzwuw5o2Ak7JhMKrTtbmPOLK+u/7M48SPfIgAPYBK48FVlfeF6g+JIVUxqr71lmNSdMfiBZRKW/X21PsiDehyDA49/3Gqq4GZF4bH7RdwaL1AwuaPZ6LZLq0BQfKK7CpkpFXku8RMRephKC+TiBI/JbYdVxA82tI9aJ5Dy5aXqNDKOU/92vs/URdKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <91db0bae-5485-680c-ef95-7316328583a2@suse.com>
Date: Thu, 28 Sep 2023 09:01:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: [PATCH v4 1/9] x86/shim: zap runstate and time area handles during
 shutdown
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
In-Reply-To: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e029f9-ed97-408c-69a5-08dbbff0cd32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RYqK8H6rY6EzbPVxVvqpyqnyHuSytJvO4Mir0baMGr6All2k0KTFc5nxAzDcqEcxK75vCcqa+bGWbDuttcibrwL39+ZUr8FEhZuNl5/FQ7GT+15gAhGwyWLziZDCZPwwBA0Q75vWUH6zI43orgYdzfIVFtA2Ty0zmblee7IWbV22RhCzPE+/bI1slTqFlMug554Qh2Besn4mdFmPQnTtSAlF7qZWBUWPz6CsEquHFPCvX8TsmqbnedhSdbIES2s/Damk7/icFCLFCmcIMOenf8nvJdjyUjg4NDoL70p2r70fUhGYaRxVc3iQB9KZxl5rU6+JbSdJ1GvN1WCtwN5+K6df7Nnv/VGzkJnpTO8TJ4RDcE4kXvIt9ux4Ahhm7sdssOTLv/IH8p+im1y8iC/O9cY911kJIHO5a/MXw9y3eLUiKGyM0z8Jk+zge7+Ozezm93VUoJsiakeNkSGTQ1hlGr5s9U2VdNmTxY6+GTTvG4mbYrdL9iY51eKAIwehK1j1lTxUUFaRlTu+c5lGFXMvsfToJpLi151A+R2pt9i4l1X07eUVfXg3v72cM1/UNd27T+KnBoSj4X3DW7umPCneX/8Uz2zS+jDLcqXlW/97ZyjVi9SUoxeTivPneLRA0THj0lk7z0Njb+c4qzKSlfhDVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6512007)(8676002)(5660300002)(4744005)(83380400001)(36756003)(6666004)(38100700002)(8936002)(66946007)(66556008)(41300700001)(6916009)(54906003)(316002)(86362001)(31696002)(6506007)(6486002)(478600001)(66476007)(4326008)(31686004)(2906002)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3ZJU081MVlIS250YkxwZjJLU1BKWUFBSktqV3RTeXphM3NDd1JYclpHOU8y?=
 =?utf-8?B?NzNxSXcyMTlnS1NGNDQrTmVtTDg4MWp3SlpvOFVCdDRwbXA2ZUJjaGVFM1pF?=
 =?utf-8?B?NmFBdzVkUW5yZ3h1ZFd4TkdNZ0xNRnlMWFczZGF6aGJseXpuTW82YUlIaGtq?=
 =?utf-8?B?NmxNRGV6RU1qeGxlN2doNHMzcGYxNEFuMVhMQnhsYWM1OGNQczdaaXVqVGpT?=
 =?utf-8?B?WE5zdTZnSUhGZlJRditTeG1LbmZDamQxSC9KRFgzVkFva09nODUwb3k0UkRw?=
 =?utf-8?B?NnM5d3IvKytJb3FQTVlLRzBDclMwelVzZmRtUGlNUWR3ZElpRmFOMysyamhj?=
 =?utf-8?B?VEJMQVZTMU5PeXMvcnZsZ29KS3FPRGNPZnhXNU5rK3NLYzgvb3JWZUZBQmpZ?=
 =?utf-8?B?amtSZktGcDZNd1RUQTJvSmdJZEgyRkRDblBuZWp3M0t4SVR6V2hQL3NtNmNu?=
 =?utf-8?B?R1BVSjl6V3NXaXJaKzZNL1lrWjJTbEcwbDhvdWpGeHRQbFdNUWNRWm8rOXpo?=
 =?utf-8?B?US9IVmxTNnpuUG1ZdDIzYmcxYUs2QmlLTHAzUVlRamdod3BZWmhSUGtBemx4?=
 =?utf-8?B?alhQemYramVzb1BzMS9Ua0tVeFlYSkprbzNzanJCWlFLajNzU1JqKy9qUlBt?=
 =?utf-8?B?WExveWdGODFSZEowaFlrSkh0VWhKOVI1MzJLV1I5WE1hTlJYc0JOa285dDl4?=
 =?utf-8?B?dXpwdU1ZYzZmUVVxWWFqcXlSNDF6eUg3ZWFsOW9xajR4Q0lURXpKNFNzRjNH?=
 =?utf-8?B?M2FSRmpnYUZpSWMyY01BcnFjTzJRekVZcW9VK2k5RjU5ME81VkhjZkNlZWU5?=
 =?utf-8?B?dXorL04ySThTMDRQaEVCOVk0Y0FhWHZlQkVmSGVKSHdKOXkvSGNlZ2Noc3pU?=
 =?utf-8?B?a2RQaG5RWS9iKzFLbWdVd3VWaTllWGt2c2lYS3hveDM1MllHajFSME9walBV?=
 =?utf-8?B?eUR5Z1RTdjgrSjVOdFJHMjgrRFVKZ09FMzlaYk5jRHA2ZnRRQ256UVNLblJM?=
 =?utf-8?B?UUxKaUFjSTlRTXRWNURSeUZrWDMwT1h1UnN2dXozWi9OL1Q2NVE4UGUvNFJi?=
 =?utf-8?B?enlEckRKeHhPUVlYbVhWeGpOUWFwMlFQdGxubllsWjA4T1NKYlF4MUVCMEtS?=
 =?utf-8?B?VWxaSU1xdTJESy9yTmlGdEF1Y2RobXREdnM4T2trRjJ6QVZoOFJtc1lQKzd1?=
 =?utf-8?B?VExSZ3ZibFo1aEVUdlJoUEdTUGR3clFYc0dKc0V6L2VlYi93bDI2dm51ZlA4?=
 =?utf-8?B?TzN5T0JXV0ZwTXFrY1BSYTI4QXlQT1c4dDhYWmsrRVJYR0lVVm5DQnhwaXVC?=
 =?utf-8?B?aEUxQXJZclB2bGN0Q3pYSUxaazJZR1ZUa1VrZDM3M1lxMk13dURiYkhJQlp6?=
 =?utf-8?B?cUpUMnV4SUNMNC9oWFZJUWllSzNFcUJNbVZYNnhzSlp3RENtYkJqMzdROU5i?=
 =?utf-8?B?ejh0WW43Y0s5bDVDWllnWmVCd1JlL0F0bzlHNGQzbmoySmd6a2hodTFtdFRl?=
 =?utf-8?B?eWNNTmlUMnlMWXlrb2RBRWhacGJRRGhTSTJUdUM0SUM5djB0bmhRWnNUcHNM?=
 =?utf-8?B?RUFyc0tMdkF0S0ZrSVpubUc1YUlXVWJrd3FJQVJoWndaaTRZQ3Jpd091aUFz?=
 =?utf-8?B?eVZBOGF0SG1YYnF2QW9URXlUYUdLODN5TFA3Mnlna0RuRXBaL2M4TFJ0STNX?=
 =?utf-8?B?WGc3d1VTQksvczFZdjZxbEgyNyt6TGxLcDNDZ3FMT3d6Y0Z3K3pBQk5GNmpU?=
 =?utf-8?B?SjJPelgxMjJRRURDOVd5ZVdzUXBrNTNXM3J1Smc3VWllRGptakNFTHN0dFlm?=
 =?utf-8?B?K3Nudmo1Zk51Y3NWUGxiV2FvbHZoYlB2WVc5Q1BhNSt5SnZKTDZZdFI4aHBY?=
 =?utf-8?B?VFdTYnFNb04rSWR6SXFvemhNclJqNFV2STZIbG44UU84L21vdzNMc2JLT3Qw?=
 =?utf-8?B?WnpRNThHZWM5MUNOUldyVnRRcFZDNHdBdjcxYzk0NDRlQmZUZzVLaS9xSzd2?=
 =?utf-8?B?RUxxMFJKOFVwTi9iWW5Oek1qUVN6OFFENnR0amNVU3krbDVxdk5iRXdSaG5q?=
 =?utf-8?B?akRnMWtpKzlCSkhNQXhnRitmV2RLS2FYZEVPb3d6SnplbDk2OHdGN01MOGJo?=
 =?utf-8?Q?pTwGS3wyNmuAtq4dguDp5b18z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e029f9-ed97-408c-69a5-08dbbff0cd32
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 07:01:55.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vla3gW6qXsUybVXOSVathxtW092U7TdCTTC0XvghvES5JMaRzMSMGj0wyqlad+J71Dx0DMnGdVqRRoslHg+tnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8055

While likely the guest would just re-register the same areas after
a possible resume, let's not take this for granted and avoid the risk of
otherwise corrupting guest memory.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -385,6 +385,10 @@ int pv_shim_shutdown(uint8_t reason)
         /* Unmap guest vcpu_info pages. */
         unmap_vcpu_info(v);
 
+        /* Zap runstate and time area handles. */
+        set_xen_guest_handle(runstate_guest(v), NULL);
+        set_xen_guest_handle(v->arch.time_info_guest, NULL);
+
         /* Reset the periodic timer to the default value. */
         vcpu_set_periodic_timer(v, MILLISECS(10));
         /* Stop the singleshot timer. */


