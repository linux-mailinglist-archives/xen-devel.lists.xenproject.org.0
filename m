Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF24D690D01
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492611.762240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8tN-0008VH-53; Thu, 09 Feb 2023 15:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492611.762240; Thu, 09 Feb 2023 15:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8tN-0008Sb-1n; Thu, 09 Feb 2023 15:31:21 +0000
Received: by outflank-mailman (input) for mailman id 492611;
 Thu, 09 Feb 2023 15:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ8tL-0008SK-85
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:31:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbfe292a-a88e-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 16:31:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7514.eurprd04.prod.outlook.com (2603:10a6:10:1f7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 15:31:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 15:31:15 +0000
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
X-Inumbo-ID: cbfe292a-a88e-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5h9osjiUsCy+f8LDaJCmzUibR+yU4fCyIdvHBPbyiIN5Sj8rVWwX4p955gQ3IPA/ou/kbqCj7eKXA524Wf0g5b/S4YQP5sP/nrup9bMBOjiVE1hgindYGZ9yA5ymuEwg8hxLhytVrYsMmFpbvx3S+n4wtbaA4RI+FDfpBCJQLSqqBzNAaQkL1FzNa35HGYKdgkbHggoBIGmwZLkP5y5xp4QJeR8fOqzaJiSrsMB/eyV7wU/4lzjB3fPszoUCkMsRE3sZ9lN4qnHVi8bJtaMrzvgARxFN+TzQ0XH1VzzCyWSLdot9OowwuvdXfHRKcuWMJ1Xu9sA/y4bfN2G6lZ46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5UQVFLuzt6IGlVVpfkm+LdZ1XJxsG7rq7LHpAwW1zo=;
 b=Aic3ujZtcxDCiNy0V7M9nZQ6rBa7tNCvZvlCUrVw6GjNCTku/HvSWNtEHSOujqdCLTCkBMLDSZobBA8J18R8+Z5KcJxxpvinp0CxkFWl+Y/aJlGz+ULLaavCuk0ihbWRHZY0Yx9QiimSyaD31tEtEuY3uRLCIrcUrB02mSv4N9UIKcD/HYdxIXmvsMPZPC1etTelB++904/6lZsMzU5dptp/SUfPlLmUkPJACPytwK5fRCaVZluQEs61D3MRgq/tEU8wWqkX6b2hS7SnGaFSZuFMnGaQoXhITQjZ8/u/9E1XvKl9xXaF4Z7H40B9t5Eru+QT3sg4Uw+renw/NUBImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5UQVFLuzt6IGlVVpfkm+LdZ1XJxsG7rq7LHpAwW1zo=;
 b=yzyyv2VWQAKBR18HI0soAzQg4Z/5E6awG19alUOnGzMBYvC1ZxTousNewD+YJMU3oBJaosgKbzkMjYtbbyYWNnnbJCpESuKFpf4DGJl0Tp+/hdpBu9ZR0IcJF6QNLLoap6/GtL4cmzzrB1HNPLeg/jEdOGP3Qysw33tieHQIVkrBWgEU7i7LpCExlbtU7XXAMrYbZamRlbDEx78UvCCc46X/pyvOuZWAQkCKC3Oqxo8jY6FgiTqvFLUsVY/dixlRk9+iokQopSie081MVns/UMFQgk9je+H9orutUnI/U60mExYb9cz47BKH6TCNhZ6/GYsWyn2E/+2angWbUQQqGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5f7a7c3-bd42-81d5-dd8a-e56d3ec8b6e6@suse.com>
Date: Thu, 9 Feb 2023 16:31:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] x86: convert CET tool chain feature checks to mixed
 Kconfig/Makefile model
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da27511-ed84-4f2f-df75-08db0ab2ae98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dgu4xMFjZuGl4GSF4sK+izzx+crIf73hgJPL0bKzRkiVbrdz5L5Ltrfg+wj6PmaWamIOxo86l+0DJcZkWfsVFk2qooxGwiH31TRrMvdVBzVAIs7Vk77/1Uv3F4Y5w/BusrqShOtQ5eCEROqwhIvikXx8d+RzRaerREqTkyjHbsMXxSSuoagkRZZZN2z0yExR53ckAgT7X0OanpVvat2ccFJsxRHIYTKpgyapYmkxJlHuqYsYejTE+UJHoRKxNcOqmKjyGhBIZwzPeQYukawn0xoIhkmdmqV/aaSssH3D30CeP4Snkl76V4t4Gq/HUKYjVw98QtI78vVbXV4N4lm9v+O31WNAhNNdecMUa1NNrDTD7raxEAZmy3VOopjbzJ+taXb3xuOPmEymtQPM4+yVa6YeAtiCPRF+iJSYHHWJo3g2+PG/b/ekcMs/dE1Cn4Gkgz2Jr+c4x3vjnoJ+HaPEdi+4G2jcSTS4iypmU5O5BeoR6mx0Xtvre7PzVi6s3TvBzSylpvTmgiBswwE8N8RvYUgyx1xAaPg2JSsCJ0Giia3r4VKzkDoFNt4MKQBeeTbXP2i9D8eQJIIXK9GOEXt3iSJVS78CgFWpgejz5Rej5S3mt97udS5rAJMBKpQjsCNqRBz1SrWf8qkW7dn8MyggDpACJ+8j2gqmYOApMepzbpIpWNw1dSgM8mMMTKN1rrrG0pwSyDebh3Po3WFx47lRdcVKS2sfs6imMW8Be01r9h6d+7bmlZv88rP5Xdss54fF5A34YNuyCb+79M2Kum3CxJ6KA8zQrxlJmuGjbUcd0NvfvojiHYMvCLmwK0LU1Xvv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199018)(31686004)(966005)(478600001)(6486002)(84970400001)(8936002)(6506007)(31696002)(38100700002)(86362001)(5660300002)(83380400001)(66556008)(66946007)(66476007)(41300700001)(316002)(54906003)(36756003)(6512007)(4326008)(186003)(2906002)(2616005)(26005)(8676002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUl2NUZFN0ZMZTNGV0djYTZqSmV2MGE2WUpLQTJZYjJOcEk0SjBtWEc0c2dK?=
 =?utf-8?B?UWdOUnZJa0VEZk5HZWx1cFBTRkcvZXNaRjBYSWp5NGtXM2FTeStwUFBJUmJE?=
 =?utf-8?B?R0oyV3o5UWVrOFhLaGNUUldTUTUrQkpjNUxVRVMyWUZvdEZyblc5dk8rNzVV?=
 =?utf-8?B?cVNIK1hVeFovSjYrSGpab3ZSVDlMNmFKR1RFRHFhYUZTbjh0Yk81eXA0VDBW?=
 =?utf-8?B?VVkyNkREeWljbEFjODAzeXVOa1Raems0cjArdlFML2hobGxCaXpVNEpGempX?=
 =?utf-8?B?Z2VKQ2h6c2kwNEFJNFdYbkx5ck40aEJhQVRwa1Z3VEdSaFVNbDk5Z2VqLzdI?=
 =?utf-8?B?M2xQWVhuN0RWRVZIOGFnU3FWTU91VVB1NWtYVzU5V1FYRVRuc3hxZ2g4T1ZY?=
 =?utf-8?B?YTlZUFZEa1ozaWFNSWlnb1A2QUhTRlFiTnlBa0hJU25CVmJhOWtYSk5TY3Zs?=
 =?utf-8?B?bC9LK3htSXZxeW9Vd29pV0VpNWIyaGdGWVoyWnRuc3dqNUkrSDc1UGlUZVgx?=
 =?utf-8?B?TE4wQUc2blFLQlVIc29MTWVlZW5Cc0J1NUZFaXY3L2xXci9HSTQ4MFhibTU1?=
 =?utf-8?B?d0xwaDd4RVk2WTRTc0QwcnBaaElBb1FJN1phMXAxaXNCQnJTUWdRdkpEWEQ4?=
 =?utf-8?B?V2dFK1FQOElOOGxORVd1enYrZ3AzTngzQnJDYmFocUZwTFcwMmJCNlkzakVj?=
 =?utf-8?B?eVBJVzFyUXRLcTFFUjBKOVNYcWtpM1ZGK3ljYnBHaS9teHh3d3hEdFdmMlBl?=
 =?utf-8?B?S3BPOHltTzlCbDVBN1FaRktKQjZpWGN2NmxrVk9QY0dBWFZpeEF1eHcwaFpT?=
 =?utf-8?B?VmtuZWlvdVowQkg1QjVKT3pYN3AzWjlFbHN6YlJ0ZzRNL2V5bll3MmlZb0cw?=
 =?utf-8?B?a2ZRU0FQeXo1TXdCMTl3N1FpZ1dvNEkrZk5kRW91VDF4L3F0UE5KbWhOTVZy?=
 =?utf-8?B?c2ZObHNYU1h4SVVsVU53RmluUzBrYS9yL0dyeWhGbFluYWJodDVBMCs5OFRy?=
 =?utf-8?B?TkEvR1U0SDZkbDVqaUVRaENSVG5CWGVrTisvVUoyVVBLZEtBSjZBbnpGY3hr?=
 =?utf-8?B?cEdoUFdLeGJlY3RVK0NWRDdtVHFaNCtZeWl2NkpCU1pqRXpsbTdWYXE3eCt6?=
 =?utf-8?B?a3ZIeXBXck55LzZEMis2bExMakJGZHU4SGt1V0o3VUZIUDJrc2wyUHhjVFpF?=
 =?utf-8?B?bFFMdGovYUpYQTJaRzQ5L053a1J1cnBGb2R3aDVmZTFaWmlOK1BqZnBaSE5a?=
 =?utf-8?B?cVdKK2diN0lINFpxNEVPN000SmY5Y2pvN0lkcjFkWjJ0MTJzTW5HdUJnSk9j?=
 =?utf-8?B?eWZlV0tWeWxqc01NWVFEM2RhRlVVa08xdURKZTJxZWdHTkNpNzhCS0pLcDdz?=
 =?utf-8?B?RmtPOXozNW1LRlQ5c1QzWnpYM0d2WkRDUTJDV0FUMHlMTVZ2a3NqVlV3Ylkx?=
 =?utf-8?B?SUpKalF5UjlWYjV1eE5CUzRHUkJNaGFSUGZWOGczUkVBejNZL09aVzZiRUcy?=
 =?utf-8?B?V3lEcGVuNXNlbUlHaTBCTHY0cEtMVlhBZDE2aWJKSnRFMWgrL3dycVZsdFE1?=
 =?utf-8?B?Y2JuNG1tQldRNG5XM2JETmlHelRFbk8yT2hlVzlHVUFpSjN1NXpmQWdXYTNQ?=
 =?utf-8?B?QUNSU0U4eUx0ZzhQTUhURU1Rd2FwbElkZzhuRk90NlcxZFZoUHE4Y1Jha09M?=
 =?utf-8?B?M3k2WERFR3MwZ21QZndTWlRpdHBYTVF0VDhWTldDdTFkT1ZSRWkyZEpQVTZz?=
 =?utf-8?B?SGh6cWNBWDhvWUgvNGRYSlhyT25OenFLK0NWUGYrdVA3YzVYbzFlWTdaTWFG?=
 =?utf-8?B?NFpSd2RQaElSYk9nUUcxOWx2VmVKWDQyUEVLSU8xYjR0OTZXQXNpZkhZN0Z0?=
 =?utf-8?B?S2JjQU4ycG5FMHl3RWRJU3JrSkFKekE1WUwyTkdPZUFJamVsRVRhWEdMNmRC?=
 =?utf-8?B?TFcwM2RmWExCTUlqZ0hQTWk2bksxakMzU20wMHhPY1hGTzJmNEdCdTVBc0pm?=
 =?utf-8?B?ZVNRYWtJaGR2NXRlcDFpVGtRaFpYNUpYWUNTdHhyNk1MUkl0Nm53ZFJ6Q292?=
 =?utf-8?B?blJJdHRyM0NDcjlSd0NwMW1BdlpoeGFVVjBmVVBmZUFLZmxWVmNnQ1NNdFYz?=
 =?utf-8?Q?8fu5G9xY7MdAYxSvKpRurLCN+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da27511-ed84-4f2f-df75-08db0ab2ae98
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 15:31:15.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSOsw+dF0kvyHuBI8mzVj9xULSiYptHS8PoKrpifEDolIUproO8O43ZN8ym/XkEl1c/jHYqaxvl2h0fdvbbQ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7514

To make sure user choices solely affected by tool chain capabilities
can't silently go off, convert the two Kconfig controls from
"depends on ..." to "default ...". Suggest a default matching what the
presently selected tool chain is capable of. To compensate, double check
compiler option availability as well as the assembler recognizing the
necessary insns early on when actually starting a build.

This then also allows to run the configure step with a compiler version
different from (perhaps older than) the one later used for actual
building.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Using warnings instead of errors in the Makefile-based checks for now,
despite the opposite suggestion during the design session in Cambridge.
This is primarily to avoid failing the build just in case our double-
checking is flawed. And in fact there is such a quirk right now with
the changes made here: arch.mk is included ahead of .config being
updated, so the checks are carried out with potentially stale CONFIG_*
settings. Perhaps the checks need suppressing when .config is in the
process of being updated (after which make will re-start, then doing
the checks with the correct CONFIG_* values). It's not (yet) clear to
me how to arrange for that, though, as the inclusion of arch.mk already
sits inside the !config-build section of the top-level Makefile.

For initial feedback I've modelled cc-option-check pretty closely after
cc-option-add, whereas I've tried to make as-insn-check's output more
useful while at the same time removing the need to pass both CFLAGS and
CC into the macro (if anything, HOST would now need passing if the check
was for the host compiler; we could certainly decide to drop that likely
unnecessary flexibility).

--- unstable.orig/Config.mk	2023-02-09 15:08:24.195431817 +0100
+++ unstable/Config.mk	2023-02-09 14:09:05.000000000 +0100
@@ -105,6 +105,18 @@ endef
 
 cc-options-add = $(foreach o,$(3),$(call cc-option-add,$(1),$(2),$(o)))
 
+# cc-option-check: Double-check availablility of a compiler option.
+# Usage: $(call cc-option-check CFLAGS,CC,-march=winchip-c6)
+cc-option-check = $(eval $(call cc-option-check-closure,$(1),$(2),$(3)))
+define cc-option-check-closure
+    ifeq ($$(call cc-option,$$($(2)),$(3),n),n)
+        $$(warning '$$($(2))' does not recognize '$(3)')
+    endif
+    $(1) += $(3)
+endef
+
+cc-options-check = $(foreach o,$(3),$(call cc-option-check,$(1),$(2),$(o)))
+
 # cc-ver: Check compiler against the version requirement. Return boolean 'y'/'n'.
 # Usage: ifeq ($(call cc-ver,$(CC),ge,0x030400),y)
 cc-ver = $(shell if [ $$((`$(1) -dumpversion | awk -F. \
--- unstable.orig/xen/arch/x86/Kconfig	2023-02-09 15:08:24.195431817 +0100
+++ unstable/xen/arch/x86/Kconfig	2023-02-09 11:59:29.000000000 +0100
@@ -119,9 +119,8 @@ config HVM
 
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
-	depends on HAS_AS_CET_SS
-	default y
-	---help---
+	default HAS_AS_CET_SS
+	help
 	  Control-flow Enforcement Technology (CET) is a set of features in
 	  hardware designed to combat Return-oriented Programming (ROP, also
 	  call/jump COP/JOP) attacks.  Shadow Stacks are one CET feature
@@ -133,8 +132,7 @@ config XEN_SHSTK
 
 config XEN_IBT
 	bool "Supervisor Indirect Branch Tracking"
-	depends on HAS_CC_CET_IBT
-	default y
+	default HAS_CC_CET_IBT
 	help
 	  Control-flow Enforcement Technology (CET) is a set of features in
 	  hardware designed to combat Return-oriented Programming (ROP, also
--- unstable.orig/xen/arch/x86/arch.mk	2023-02-09 15:08:24.195431817 +0100
+++ unstable/xen/arch/x86/arch.mk	2023-02-09 15:08:37.088842654 +0100
@@ -34,6 +34,10 @@ $(call as-option-add,CFLAGS,CC,\
 $(call as-option-add,CFLAGS,CC,\
     ".L1: .L2: .nops (.L2 - .L1)$$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
 
+$(call as-insn-check,XEN_IBT,,endbr64)
+$(call as-insn-check,XEN_SHSTK,,wrssq %rax$(comma)0)
+$(call as-insn-check,XEN_SHSTK,,setssbsy)
+
 CFLAGS += -mno-red-zone -fpic
 
 # Xen doesn't use MMX or SSE interally.  If the compiler supports it, also skip
@@ -51,10 +55,11 @@ CFLAGS-$(CONFIG_CC_IS_CLANG) += -mretpol
 endif
 
 ifdef CONFIG_XEN_IBT
+$(call cc-options-check,CFLAGS,CC,-fcf-protection=branch -mmanual-endbr)
 # Force -fno-jump-tables to work around
 #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104816
 #   https://github.com/llvm/llvm-project/issues/54247
-CFLAGS += -fcf-protection=branch -mmanual-endbr -fno-jump-tables
+CFLAGS += -fno-jump-tables
 $(call cc-option-add,CFLAGS,CC,-fcf-check-attribute=no)
 else
 $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
--- unstable.orig/xen/scripts/Kbuild.include	2023-02-09 15:08:24.195431817 +0100
+++ unstable/xen/scripts/Kbuild.include	2023-02-09 14:13:52.000000000 +0100
@@ -73,6 +73,18 @@ define as-option-add-closure
     endif
 endef
 
+# as-insn-check: Double-check that the assembler backing (or built into) the
+#                compiler recognizes "insn"
+# Usage: $(call as-insn-check,<config>,<tool-variant>,<insn>)
+as-insn-check = $(eval $(call as-insn-check-closure,$(1),$(2),$(3)))
+define as-insn-check-closure
+    ifeq ($$(CONFIG_$(1)),y)
+        ifneq ($$(call as-insn,$$($(2)CC) $$($(2)CFLAGS),"$$(3)",y,n),y)
+            $$(warning CONFIG_$(1)=y but assembler used by '$$($(2)CC)' doesn't recognize '$$(3)')
+        endif
+    endif
+endef
+
 # $(call if-success,<command>,<then>,<else>)
 # Return <then> if <command> exits with 0, <else> otherwise.
 if-success = $(shell { $(1); } >/dev/null 2>&1 && echo "$(2)" || echo "$(3)")

