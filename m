Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031F25EF2FD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 12:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413585.657326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqPY-00008j-2N; Thu, 29 Sep 2022 10:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413585.657326; Thu, 29 Sep 2022 10:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqPX-00005x-V4; Thu, 29 Sep 2022 10:04:55 +0000
Received: by outflank-mailman (input) for mailman id 413585;
 Thu, 29 Sep 2022 10:04:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odqPW-00081Z-JW
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 10:04:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60084.outbound.protection.outlook.com [40.107.6.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29c4fcc2-3fde-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 12:04:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 10:04:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 10:04:52 +0000
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
X-Inumbo-ID: 29c4fcc2-3fde-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2Tn76ELU8cJn9UBT/rIjizIiKI55V3cwJNa68nHPM0iruUv3R2fjq8XVWGTAryZsmgoPBmXjnofSNptRdl5LFMdjSYbeEBaMcBvYkKSjrDVW1m1V8TAoQsDgU64AMI1PTovUUIzVsynaZR24Uztq7V18QlYGkXApNsOOfrZeqlBpKVdSa+h2DiR5i6duvn2zCG8tedB5tC4JJJGq6Zyi/9E7bFXjycHld4fQGqFV9fKMxUiKE6eJrDNUBkZntAYqcUBl7l/8DH8PmI0TbXWRot9CFgDfab43vVNAYRW/OV7Gjei9xGEbdBUfEvy2PMvTfJ+980olAqo8tOpcmGwTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWt8/wR54+6m0d8cbccRfiANwhiSiGr4J0UEGqibS/I=;
 b=dic2qwF78P09vq1QIhZqm7y8KhV98G2eww5D9cKuqP6VNvBm7+1Jhh0ROu7ZnKtn3eijKLE7MsiL5NnT/VbaUzv45U54dvYZhtk4j4/iu3X9U6EbWda/6udHrSsay1OdwFVrLu1XiuAZk+uEX89YtPV/8FFSi8Far6pHIkUsYONl+/1MlXMhki3YkuTFrTyw2SZaoJhPFubqiwwATrEp8gqH1Jb0uJWcu/BvFLGUa+7iJ5E1tSjjiYViWmYjgO6VmVgO8udiT/5xfFcK/kW44NJnUzrskMXX1+V4czOiB8PcyerqrxRMOqK2v9CrlHxnF4frGCedR41YwDon5r2irQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWt8/wR54+6m0d8cbccRfiANwhiSiGr4J0UEGqibS/I=;
 b=V/lZ2jp+sZ81bnD01IJnIOJ2nVCA5gX5GN6xWNaAHB08eQshv9JHdCqUdTa9VgPH5f3kR2HV2X7NA/Lrmmbjp8wlM4LYLrn8br4BvdDbueC7NXrl34vLr0f2j+0n6Dj7CAj4byln8t67w8CQZsHeZ2f3aWc+5dyJYiJiNHBKYS9IZeEIH5qa5jtPjb/ondGRn+9+FtayD0HOY6XniXLRnm/jd2QPjyDeCCVMMsF3+o5UhUTroyYnXWSyNZa2wv8RBya9ymZ9cOSr8OTJqecz/LbrKTrvghbrqHcaHzcrjGkwubtbN6vS7Yq78TvMeyjcrIXRmSWgbrtmeaaj4HpItg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a45b4dd3-3436-1f9f-e674-53bf1ee2f761@suse.com>
Date: Thu, 29 Sep 2022 12:04:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: [PATCH 2/2][XTF] build: silence GNU ld 2.39 warning about executable
 stacks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f4f8dd4-cfbc-e2c2-4a5c-ef31acc4162b@suse.com>
In-Reply-To: <4f4f8dd4-cfbc-e2c2-4a5c-ef31acc4162b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: db58ce86-f134-4ec7-79d7-08daa2020d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	keybxS16UmZuK0I1Y04CDth27iTEbbLPfsuBkfEIiZhHnGzT44yhhIOTyjzd6qxy0r9xkmAyNXO7SJbjB6YfvJdaXQPM3R9//WlmlJ+/2fAwSvi1vpveaQvtnrqwqGvNwi72TqnhOA2gj6mNrASApqZnwLU0hMyOapGGN3SuosH38amuWg69enfZVzslA8ZYpF+kpX5YCCfFt1Zf5pILu/R8hLngPzaJeZlYfiwg1daBkqnMfI86gYolViNKtrBpPkbU+NrH+gXk4C9JZOnN8YutxisnMpXFM4/I3pUMts1DBQYAK6ycQIvrl/KiIC/1j7fJFDmmld6AMPCtkFQ9uUKTn1Ap1m3RoWuyO52T2bgSRF43MCAT+GotMHm1tRxa9Qy64kUYP5ZxARiJkND1ErLh9xkzDrIXZg69HiZp53gjfF07+b3BqmwrAaYaO4HXSEivY79sTp6xeoIsDEEp7JZfkItJ2qWHjyuY6ConXK7omrXB/HAtrwoWiEPU/3gUjxsYY131uffbH2OumbIw5MfYtVjoOI23vONNFbavTWOLj8Yol54447BJSFF27VgZ/em4G4WxUttYaAaCK+PFMrwGg9sbQWUMyamuVjjN1YWNQ8jGXCN6qgkcv7L58wPIqk5G+2gMqZCV8ajdrqtZBjXKBxHbZsmQlEmzEdIV+48m2kRl5duVOzhDoy6RkF/xRlJbpk3UXA/gKwsSAsg/ZSfASPfVcAaeXY9Bi2ulyxpKro0lyOjst+7FZPz4iKtor5PGbTjunc68x4bfvkDj91foCZlZPkQw7bF3wHFNmT4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199015)(31686004)(6506007)(66556008)(66476007)(4326008)(8676002)(31696002)(86362001)(6916009)(38100700002)(36756003)(316002)(83380400001)(186003)(2616005)(26005)(6512007)(478600001)(6486002)(66946007)(8936002)(41300700001)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWhiaXlMQXdqellqdEU4TEZmdE50eTBZN0lZYnVoendrWnpwSk5pVkI2c3Z0?=
 =?utf-8?B?OGU1bHQ5aUhJVGJISWphS2FXWUZBV3BYZ3k5V3FKdmRtek92KzlITnJDczMx?=
 =?utf-8?B?OWhzc0kzeFoxTUI2Ukk0RGthektVWFVXQjc3ZExGTE1abE9FZzM0dzNRSENH?=
 =?utf-8?B?dmFidGlxMWVsZmJzWFJoaHQ2WjFXWWluTStLa3U5OHlpTjZwY3ZyK3ZQNXZG?=
 =?utf-8?B?R1BkVEsyVlM4Z0Y0ZzI4dEl2dVdDQ2w0bUIwUXdpV0ZYdHJha0liSFc0OUVJ?=
 =?utf-8?B?cWFPQjRrY3FkMHEwK3N4MEpDL01NUHNFK29YcVBjaG5JUHlBZCttRkNOWnQw?=
 =?utf-8?B?eVAvcCtnVFhoV3BPVGQvMVp2RHBTbzZDM1VjRkhpT3VOZ2FSeitXWVczWHVM?=
 =?utf-8?B?Ty9kcGt3eDlJSllQRnl4TW1Pcnd3aFoyWEtIRTZZcXBoblJINE45WElPSmlT?=
 =?utf-8?B?WTJMZ0NSK3dTSkx4Z0d1dEdmZkt0VzZjQlFxdnkvMGt0SllhRU1Ma3ZjRkg3?=
 =?utf-8?B?OHRqTy9LOVVaTXVzZ2lyZmVqVkRIUHo1aFR4Q3ZYUkZFeTEyY0dYRmNxSTVq?=
 =?utf-8?B?eTBVU1plMnhweU5Vb3pvVE9MSGNaMUhCUnlBT0tIb2pBeEx4MVF3YUphT1pC?=
 =?utf-8?B?bmF0OUZhOUpIYXBlajdoNWtSSjVLY2pLWGhrTzZFeFc5bENqeGovYnpNSk80?=
 =?utf-8?B?aGFKNG1Jb1dZcXhIV0JXRmtvRUhaQ0N2QXdhalo3bU16LzRmVmN0R1pxZG1F?=
 =?utf-8?B?QkN2VkFKdHVIYkhocVE5dVpoekRVUlBWRlJGMU15TzFJemJiNVpaYml3dlB3?=
 =?utf-8?B?bkc5WUZkNlVMdGNiZHl4YjBOQmNwVFZWazB6VlJwU1UweDQybjE0OGhwY0pK?=
 =?utf-8?B?ZCtydFlQUC9qSnZzK3lGOE92RjFaNlduVk9jUEJqeVMyNnpHL0hNZVU3aHc3?=
 =?utf-8?B?QTdvVmpCdTV4b2ZNN3lvUVVpb0VGUThXdEdrQnJiQXRMQ1ZoZ0VnbFh6Y3c3?=
 =?utf-8?B?a1BrRXJHeFNMbTNUZ2ZjNDM1TkFUZVIyYUEvNGNPNUJjYUhaNTljcCtWdGtE?=
 =?utf-8?B?SVFMay9aMzIwSHZ0dDdNb1ZOVktoUzZ5S1dKMnk3QkdnVlBYbDRPZ3ZwbkJY?=
 =?utf-8?B?MktqNTk1ZjV1V1g3d0g0L2ZMQXRxRUhRamV3S0lRZFMrTlY0cDRKVFBHa3BZ?=
 =?utf-8?B?YjA4YVYwcDMvamlZNStaYVgyaDZWTkRiTjJBU1oya0c1TVM4bWpCN0tkUXNZ?=
 =?utf-8?B?RlkrUE5ZQTNJVWU1eFZOTkNTWVpST2crTW1tRVY3QUpES09nM0diT0FjWkdr?=
 =?utf-8?B?dFYweE5maVo4RXdZc0loUXFZRmltWmZTZ2JKRXVCWFRBMnBOS1Jpc000VkJC?=
 =?utf-8?B?MnQ2cmJOdGpjUTZkNER3cEEzWkcvTUpRZmJNajRJNElpcjB0eS9LYllaSktE?=
 =?utf-8?B?OStPb1pEd2ZXYmtQenh2RjladC9sOXRsUkpWcy9sV0lGeStheCtFeWtYL3pJ?=
 =?utf-8?B?bWt5S01GaUF1SUdlTjlWcDRnZWxoamFvQlZLbDVna2tDcGQxcmNuL1dLWkln?=
 =?utf-8?B?SjJzVEUxWnNPQU5jRFhwWk5vUjQ2aDAwT2l3NGRLZ1d4Q1ZoV0pMY3ZFVDZp?=
 =?utf-8?B?aG9mU1owYmc1N0kvR1hZVTNVZ2xrcnFwenBxVUFwVStSM2tUQ3FqTUpWQlUz?=
 =?utf-8?B?K2p1Y0RPNE9ZL0xkbXV3aEZsSUFDOG5TdnFRaUpyaU5EZllkYW9HRzBkZkVs?=
 =?utf-8?B?dmV3aGxDMXRKSVBFRFhOSklVMWZya1VqOHM5VzIxbmRwWUNRYlFwQ2xRN2xC?=
 =?utf-8?B?TmZ1VlZyWEdnL01KMFZ5SW9SUXhQTFRKOWVFeVJnZnZkejhmcjVrY2YyZjU2?=
 =?utf-8?B?TTlHWXdkQysydjhQWDFDQU9tZW12djN3UXhwTDJzc2FxOE53bHlMWFhQa0Jh?=
 =?utf-8?B?Wkw0dUlrUS9aaXFjd2plNlp1Vk96Ujl5cVY2bEEzZFpBWHZzVk9xcW1DdHBR?=
 =?utf-8?B?enNwbUR0RHdoek44cWlVNUVSVnRTaC8rR0pmSlpkY1EyODZ5ZzNiYlhiMXBm?=
 =?utf-8?B?aXJSQ0czcTE3K0NGVzdQQW0yblh3bS9QbEtscHVmRmlnMHJrRjIrdVl3YTNC?=
 =?utf-8?Q?Ju0visi1BvYhyNjpWxvIK8tNj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db58ce86-f134-4ec7-79d7-08daa2020d18
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 10:04:52.0782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irCVrSR3xPrtNt/xfe0IB1vGKp3GmcGQK3PlnpbJAo49sA/z2RvVoHNLrxanhdQKcZhx+K2xT8XGaw7kBTOSIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

While for C files the compiler is supposed to arrange for emitting
respective information, for assembly sources we're responsible ourselves.

For the new use of cc-option to work we cannot pass -S to the compiler
anymore. We need the compiler to actually invoke the assembler, so switch
to using -c.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/build/common.mk
+++ b/build/common.mk
@@ -15,9 +15,11 @@ $(foreach env,$(HVM_ENVIRONMENTS),$(eval
 $(foreach env,$(32BIT_ENVIRONMENTS),$(eval $(env)_arch := x86_32))
 $(foreach env,$(64BIT_ENVIRONMENTS),$(eval $(env)_arch := x86_64))
 
+comma := ,
+
 COMMON_FLAGS := -pipe -I$(ROOT)/include -I$(ROOT)/arch/x86/include -MMD -MP
 
-cc-option = $(shell if [ -z "`echo 'int p=1;' | $(CC) $(1) -S -o /dev/null -x c - 2>&1`" ]; \
+cc-option = $(shell if [ -z "`echo 'int p=1;' | $(CC) $(1) -c -o /dev/null -x c - 2>&1`" ]; \
 			then echo y; else echo n; fi)
 
 ld-option = $(shell if $(LD) -v $(1) >/dev/null 2>&1; then echo y; else echo n; fi)
@@ -25,11 +27,15 @@ ld-option = $(shell if $(LD) -v $(1) >/d
 # Disable PIE, but need to check if compiler supports it
 COMMON_CFLAGS-$(call cc-option,-no-pie) += -no-pie
 
+# Arrange for assembly files to have a proper .note.GNU-stack section added,
+# to silence warnings otherwise issued by GNU ld 2.39 and newer.
+COMMON_AFLAGS-$(call cc-option,-Wa$(comma)--noexecstack) += -Wa,--noexecstack
+
 # Suppress warnings about LOAD segments with RWX permissions, as what we build
 # aren't normal user-mode executables.
 LDFLAGS-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
 
-COMMON_AFLAGS := $(COMMON_FLAGS) -D__ASSEMBLY__
+COMMON_AFLAGS := $(COMMON_FLAGS) -D__ASSEMBLY__ $(COMMON_AFLAGS-y)
 COMMON_CFLAGS := $(COMMON_FLAGS) $(COMMON_CFLAGS-y)
 COMMON_CFLAGS += -Wall -Wextra -Werror -std=gnu99 -Wstrict-prototypes -O3 -g
 COMMON_CFLAGS += -fno-common -fno-asynchronous-unwind-tables -fno-strict-aliasing


