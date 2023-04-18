Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4D66E5CBB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 11:02:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522668.812166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohDw-0006bn-TP; Tue, 18 Apr 2023 09:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522668.812166; Tue, 18 Apr 2023 09:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohDw-0006ZR-QM; Tue, 18 Apr 2023 09:02:04 +0000
Received: by outflank-mailman (input) for mailman id 522668;
 Tue, 18 Apr 2023 09:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pohDv-0006ZL-1R
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 09:02:03 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adbffd0a-ddc7-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 11:02:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8552.eurprd04.prod.outlook.com (2603:10a6:10:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 09:01:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 09:01:58 +0000
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
X-Inumbo-ID: adbffd0a-ddc7-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqD4VoL7IHP1uMgSCQOWJMJsb8Khu6q+ENDnsX2PxMlc2AepawVJQSxXLoDJ7sedBIQmD7mDHL00+D0rmHrHL4db9A4B7aQqvIqMi/OWFTCCRCkIjGOZdv+pSxJHlxULDJ3paM4T4W598I7hZf97GBCD68jt8C6B0JmkUHLDq1EwNRxK3GOtScE4LYG4QQx+fApdInJ70Lia/k8FIphKL4onFddKo/wsiimmEk+vPHlS1UAc+bsPOWlAh/MEZgNNAbjZefi/WBlz25ThelFgmA3lZD/f31qo/mMSMRwFcJVGOwgH4USmbVDZ5ESQtG5yc9G4tzxz4TStr/XcDoP89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WC6NPOv3EGhsLoDwn9NgnDDiknxDb2PVRIFkn58wZow=;
 b=TBmRgoi4/AE/jnoDOST2wo/ppaIGR0u7V5fG1f7MKPxqXc5iczCr6wNwnmCDIFYlAoPf+GgYHqhpTAMi5MIdzk2Csepka9aYbjiSBlEdIaRAk2vxbu7O3YStEpCVRsGxy6aoZ++qCZDUvh8+8Blr8tK545cg1hr+rSEkcl8E4PmxMalxHC0INGiYu+b1/+RGuBVdbMZ2W+BGC7UEaAChI1c9I+IFvKOADGbbKxmYYNgp/85GXS96/QeceOK9wjmZKo5+uGELK2iASKrr9Sn9NjUaIIPHcAUbUsR9kQN3fK0LxPXX0lEcNdnEDJzEEidlbyF4YvY7H4cOAO1vjv8HsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WC6NPOv3EGhsLoDwn9NgnDDiknxDb2PVRIFkn58wZow=;
 b=1NqKRg2UucopCnnAFvcH0UzOKfWrIfIrc2KgTHg6z+3vypxnNu4o0M+0bBg2qrgDFsx4T2KSpU1qiOIupbMGQwMeocgwTV8FgCoacMc5rvKhHYvwi/pwfr8SxmfFdOTfceV/dXQ6tTou1ZFk4Qquwetgc0ZybpzfXr/Y6DoXBxaiQenT9Bv3GiGaqHW3Ovjp2EB3nFILhPS6RUve24NDBGyC/W1qjfyIWOkelAwgVGfc19lDeE3xYgcb9QFnlNLweQqszUo6rFommjFuhOYQS3xVJ7MHiPwrQSsWMwI2ojqQWiHyI+8xxKYXz2g6/s/GiIdjkajHypUV8mmNp2Rckw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <80a02af5-9154-8289-4e92-6016c0948a61@suse.com>
Date: Tue, 18 Apr 2023 11:01:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tests/cpu-policy: fix "run" goal
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ef0179-acf7-4cfd-5fa0-08db3feb909b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iDOXXHhipWsN4nyAYg1232DB5L3way2hn6a1s7GKs7eBz5uUpzz9CLrYrEb/+R6HkcfFncko/zHNnZtXMZivPAz8LfX08rWvG/KceQU1rPx0NknVZSOd0yhigKh7x7d6xHLmmQJ9WG3np7HTk5d0EKaoezvwRyfdjgx+uwsiqt8sVg6av37As/ZUscIQjuSXG2rO4wSJC1UEeViiUkWyCeX3wcGh2S6i2BXXqjhgQWPipmQFoUvwn4I6AAMjGI1jkJvvCn0bJp/q+dzPxGdHmvWE2Kvq86GWETx36xGAYhQmrVnDPEk8+ar0bPshGnq/vh0kOkmIMdQjB2JWpNxt2zysSBSD2JYmsOULP52QLrQxXBLsVftuu59dTsGbJEqYtnW7H6igMWzOVkYfzSVagmIWEkL8bRZLYk3zRNporfTiuXIQ/FOYXvtE+cav/qxqNoP3u6V1L2cqT/CymCoULrqEmXtjbKT9RHGlfElf5CpOzVIuEsNpbWPHD6OpHBAi9UJZM/NdYaYB4DY0LmRgcCOZCy4OUrmG4VOyKCIl50gFFQsPqPlGt+VxFTnzsfj1uFlw8Y7hvrhXGi5EZrJDboO95e2A4vbT6PiyTi2S3U4lO4+x/rhZnrXpFQtW0/GIaLxu7AsYYLNq8o3kQolM6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6486002)(478600001)(86362001)(31696002)(2616005)(36756003)(26005)(6512007)(6506007)(186003)(38100700002)(66556008)(66946007)(66476007)(4744005)(316002)(2906002)(4326008)(6916009)(8936002)(5660300002)(8676002)(31686004)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWRScFFzSm1pbXY1VkJqcjRvVmV6Q095aVFveHJaaW5VcWZra3pXU1dDcXdJ?=
 =?utf-8?B?OFRiN0hZVnRIMTg0V29kZnFhN01QRTFxRkxvUlU2eVVJa1I5STVYRVZmaFNr?=
 =?utf-8?B?dFIvZVhrbWZzS2YweEw4azBxQU54S1BHWFJGbURwRnU5YnJBTXpLQU1nVmpp?=
 =?utf-8?B?UW1pbjVwY09mTUZMYXdydHZWcnBDcGIzNmpLVmdabldOckhncVVoRWUrTkk2?=
 =?utf-8?B?bXkrSll5R3ZXRUNtcGxRcmh4YUc1WmdJTFp2Q0tUWFF2V1pvcElQSGJUMEpp?=
 =?utf-8?B?WWU0N0RVN0NWdHF2UHF6dC9McTlMeFBRRVJONnI1ODE1d1Uvdnc0bHdYdzRS?=
 =?utf-8?B?b3NoaitLbnZSMXBNSmtPT0pjWkU2SjZkdFJkMzV2YkhWaGMySmZodWpwa3dp?=
 =?utf-8?B?Y0drT0E0UzljVXEvSDEvRHo0WjdMNEJFL0JaMnhudnQ5OEJXcUFNbXNCcWU5?=
 =?utf-8?B?L2hOQlByVGpNNlRFdDAybEM5azNTb2s4MnZkZG56Y3hxREIzZ3o1OG54YkYv?=
 =?utf-8?B?KzErVFcxd2k3enQra0ZZWmtlY2kvUXozeHVwMnI5K2JUb2dwQldjRWYxZCty?=
 =?utf-8?B?QnJQRXNOR1duYytWeS9HWWdraWc0SVhoWHdkYzMyd1J3S2ZHMitzTk9WNzFI?=
 =?utf-8?B?RE5GS0FsbTZwZ24rcnBhTCt4SzRhdExWN0JuQzRtK3hvSjJBNUliVk1BZWtp?=
 =?utf-8?B?Ync5MGFUNXZjQnZwQ0pZM09jSFByWVRTdkxic1FvOUpVdFFRMzlkc3FUK1hz?=
 =?utf-8?B?Mmtlb0dud3lnWkpHcTFOQTVKcUVnMFIyMjJYTUFJRFJFZkRMWDV4RGQ2cmJJ?=
 =?utf-8?B?cnpjRSs0Zm9oVTFKMmo1T2x2cWFhM0NSUTlmTEczTlZXaStNRDlqWnIwTFNt?=
 =?utf-8?B?WTIwR1FEZ3c3SDlyV3RMTURxZmw1SjNxd1J0SkFCK3BlaUc0U2VJdXpJa2tm?=
 =?utf-8?B?Vk9Ecm90Zk5zRDk1aVpGNC9aenoxd2dDSTd6UWJucVZHMVh0SnN2WG1Nd1Rs?=
 =?utf-8?B?UFh4MEFIT21ReFdDS1FaYy90aDNYL3VmeUcwdmlBVEg1bzUwci9uR3hXV3Jn?=
 =?utf-8?B?TDUyZWhhcVVkSGdEcW0vNHU2NUw2TWk5dmhDUmRFdHVjdE56emQ2eml4QzlP?=
 =?utf-8?B?d2p1TEQzV0M0V3RLdEJTb2RVeGZBQkhtdXkwUUhHeE9tblJYdnY0TWRuNVVO?=
 =?utf-8?B?c1h4NTdEMnptckFkK0lma29UWmFPaTg0c3VBUlNJWlozY0EzVjRLTUdudkFH?=
 =?utf-8?B?RXN6bndselF4NEYvVTdEL2JXRHhEWnpiZEN5NjNaa0M0bVQwZk1kMC9hVlBu?=
 =?utf-8?B?bGdWVUUxbWxBMVpnTkdLNnhvSVl2V1p0Y04rZ01iMU80VDlQbkRQVENtVlQv?=
 =?utf-8?B?dHV3WGYrSTJTdGRReWMyUENwYUJuL2lXM1JhamJEY0s2L3JlU0ZMMCtLQ1lh?=
 =?utf-8?B?WWcwVjVTOUwwRnVxT2VVMS8wVW9MV1FPZjlBZUxuT3AxWTdTT0RJWSs3UlZk?=
 =?utf-8?B?MUpZZ0EveEJWakgwUFpZS1pIVVFsR2FFNVR1anUxR3JSNjUzRnUwWXBmUGRl?=
 =?utf-8?B?ZkMvTnhXa240VjRjUk9lUkxSOE9sRUdmOFJTSm0wUk5FRGk0OVhCNFhlckE3?=
 =?utf-8?B?K0YwdU01dVA3cVJEem1EWE85cE16bDZJZC9LM2E5V0dnYUNBU1ljZzdCNXc0?=
 =?utf-8?B?R3B0d20rYmEzTlNad2pWMkJRd25DOWxBbEhMMlI3eHdQYkY4NnN6NldqV0Rr?=
 =?utf-8?B?MGYxOWxJYmJ6dzRyUE5nanVMeFV0cnMyV0FiUW1qQWxOWUt0VW9pNW4waXlq?=
 =?utf-8?B?VU5za1ZqekczR1Jxa3dmMUxoUnFMZmdJUHM0YndZZW5JcFI5ZSt4ZjdDNS9o?=
 =?utf-8?B?ZG1VOHZnczBaZWFVeWdicHBudWYxMW5kaFBPY1ZXT0dZOFlzUWt2eDlqb3g0?=
 =?utf-8?B?bGRPeGJ3cEFOT1lVck5qbHI2UWk2ZEJRdnlaVk02MkpGOG11WUZqKzVBelpZ?=
 =?utf-8?B?Ukh0MDhOaGM5ZVY2RmNTN2NVVktQUDVSYk8vZE9sRTR2VmN1d0JVTVB6WDVN?=
 =?utf-8?B?ZmVobzNIQVNlOEdINnRQS2FuQVNKMXJKbi8zL2VhSnF0aE9JQlZDL2N0Tmg4?=
 =?utf-8?Q?QBklDllgR6p6eyY4qzM5GX+0i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ef0179-acf7-4cfd-5fa0-08db3feb909b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 09:01:58.0855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtRATYqo8HKTqrU+d12/w7qMoGh+i3/QNfE9KNx4AlAhqDGQjrtiV/HIZXMSZ0Qi0n7BG1qmucIL6tv5hRWXZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8552

An earlier change converted TARGET-y to TARGETS, but failed to replace
all references. Convert run's dependency, but use $< in the command to
avoid the leading blank that += inserts.

Fixes: 6a9f5477637a ("tests/cpu-policy: Rework Makefile")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -16,8 +16,8 @@ endif
 all: $(TARGETS)
 
 .PHONY: run
-run: $(TARGET-y)
-	./$(TARGET-y)
+run: $(TARGETS)
+	./$<
 
 .PHONY: clean
 clean:

