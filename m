Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D299A7591D7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 11:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565706.884097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3iq-00022r-LZ; Wed, 19 Jul 2023 09:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565706.884097; Wed, 19 Jul 2023 09:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3iq-00020u-Ic; Wed, 19 Jul 2023 09:43:52 +0000
Received: by outflank-mailman (input) for mailman id 565706;
 Wed, 19 Jul 2023 09:43:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM3io-00020n-JY
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 09:43:50 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c36ec5bf-2618-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 11:43:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6794.eurprd04.prod.outlook.com (2603:10a6:10:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 09:43:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 09:43:48 +0000
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
X-Inumbo-ID: c36ec5bf-2618-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gj0dCoej+ia+2mBWKbvdq2P/GuVb74PigAfecpC1r4t99+8R7WOoqj2Ll2qHvEaFvDFiUzSYL9KJY3RARyyH0K+Lo789GkAj0275ETW6k3JJmFemQhebBKqlr5N8WQl9JuYGSz6iijwP6asMpYCGUopCdTwbNqiun8lOo75VUtNP+DxI0nLbjgwcVJsm7W8h1oq9k49XILis7bJBOBEearAvkDyS+E9iBlPhvpyHqAq7mlFrsY4OKxujAWAhG7+S1p3PqA4UrDJJc9ITAhWazlVyG5VB3rLwNHU0fpbBinjxMch0Bhl2KqqR4wPiRyPgOPr2/TRKfJtoSZ6sjkZlyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z83+4fe8wofcAMxwXz+EOVByzKrzaNqIk9SWCUEUwCk=;
 b=Nd0eiKBVRluNQKj9i0Z9ZGs4DI6BPUlrPxuLGsHcpeYFUUsQBVPrBtPhCzCFPgejVFus6R1iiAQ3bS4WitDrqDSqjKn5TwpqcwNwrBx2HbX0fCi6GsPgPgp3NuUCYkE8H61jiDI3RjFeX/F28OuXR3A/+8088GscdtKSuOlLOS+hQMlkBMNWH1FCjAcpyOmPiSuBknnIBObGHNLSCl7FlufqgJrN66FC9OpkQj3O3JcGjnejT2uPTvj3TDxVPlJp58itGul+l1IIPGImBBxZm3/HEsereID1nFukZYYsHLR3baOQM+jInLnKD/zdSNKaO2GfnhfKCxMaGU++/Lfa9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z83+4fe8wofcAMxwXz+EOVByzKrzaNqIk9SWCUEUwCk=;
 b=OsHBDF/gbeQHQGvQzCDB309RPIGNrrrjwPc/SJyEP473RKghpR/k4lBuk24sG3mF+rYmZR61I9VMxBeAYbMFidhgHymsHSabkGd2jxNx3y52UXXYP1ph3aGnWqv0Ji6Tp0LONHP+fXdhldU6scj+VXj0L7BkDE6nZtVHDcn6MFIRqHoq6Js/2ljMwe/wwMwUwDhWbxeYoOhz2504osUYqjislX2cVH+14x5Nn09MWJZ4cch7FKJGjeXB+H6+94cKu9JONqGQytoajW1wVOunA2Wr/OZ7iuocUL4H34t6Hk84aAYlkR6wa2M5+K26FDpA2eW6AHmFxx5cN4CBvOsXog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2c0b9ce-7919-8571-cee5-5ee68b7db63c@suse.com>
Date: Wed, 19 Jul 2023 11:43:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v2 1/4] build: make cc-option properly deal with unrecognized
 sub-options
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
In-Reply-To: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 6120a6f5-af45-464e-a427-08db883ca6e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XbF75OcSS6tIuDaGpq2ryEJKWCBtsDGjxNbWiTvllQwSMwA0S0P6z6qYbZkGNtTjodLNsZDDFKzXKaMTpVZOB7sbWYWcElY1TlxWutrhe4Fr5AzldlnNaoMa+4J5lTAupAmBUiQNAJOkilddryeXunNXs03SepEn3ZGJn4u91uKgqvgvD1qOUrCJW5ADiJSpfswT+76CzSd9ATgjGelHrqHEiwliPJ557gZKtgFl/vOUdAOHXoY971zb+h5uOX1Ki2HwaQVeTD9nmbs2sKD1a1ZIRYkyKd02ZRkuf8tBSKImkFOvbA6eQ5yABkQeWCO4Y6QKtZNFYussv3DH/VzgKy4Ct+sFd143tBntHTnqzVSKF5D5hmk1DBp/zkOIq2BB0GTZqme5K/I4bAF5cuB4qskTth7UW2pR8PAa/tCNsdNrua6daJDB3duchcCSaDNUsyOiaPoBWBrdkKJxphqQf5t+RSuLe7XgwHfBCBJ9Kvuh49K7bZ0p8Ey0lhU3I0kLAFBekRZtNuqI9F55Hr4SmCf9XOFKPhmrckh1Sz3gdhGoiidj3TVPvMnqnVeZRYP8Oq/6oOrlZh3iWoJ+1Xy84D6IujMXE9N5JtvUAQf79DMEo89/3usnFNHwYQN3VUFjdIR6IHSbwg+pG7uqBvWePw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(5660300002)(4326008)(6916009)(66476007)(66556008)(66946007)(41300700001)(8676002)(8936002)(316002)(31696002)(86362001)(36756003)(2906002)(6486002)(478600001)(31686004)(186003)(26005)(6506007)(6512007)(2616005)(54906003)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVN1alAwZklJNDIrZktieUphaDlPT0trajZNM3RVYWtxS0Z1QWQ5ZnhxN2t6?=
 =?utf-8?B?TW9WbUJpbGZFZWovU0ZvT2JJM0lSSmNwdnAzUUhUZ3AycStmQXo5T1R6b3B4?=
 =?utf-8?B?Tjh5akg5WE9HZit0VTVXeXlmMERuR1k0U2RDNjY5K2RTaldTNEp5Q0NCWVFo?=
 =?utf-8?B?Zkp0NEFBTDE5ZHAyS3l2amJvYVZzbTMyQXBEVGlRbU0rV3BpWE5wTGU5bnBX?=
 =?utf-8?B?aGMrQ2NhWTNQN01GMmdaaHArTkszT2RVZTVUQkNiZU4zUnQ1U0lnOVpBaVpj?=
 =?utf-8?B?bFB5bmNQODlUbER3SUpzemJGMG5uLzY4eHkvUmowV2FudVFydFFjUjQvY1hC?=
 =?utf-8?B?TTEwczhpRnpUaUo0cVRlajZJb2N3K2k0MGxWVVFtQzVFdEh4ZzlBR21jTEpr?=
 =?utf-8?B?d01jN2JKczQxTFN4ejBPSTZ4MGhjYlRyWXhZMThXVGc0aFV0cHhsZWFmRXY4?=
 =?utf-8?B?Z0lLbzNqKys1VkxWMFlFYlJBNkFGSTJ5VmhvN0pRQjQyZEtKSUJTQSs1MFFh?=
 =?utf-8?B?NjZiMEhhOXhUQnlDcVZwdWJwV0tZR1JmSFVaYVpPNzJZQTlxSkhPdUFxbjNw?=
 =?utf-8?B?Q1QxMllwY3Q1TStkT3F4U3pLK0Y4SlR4OXBHdTRlVy93R1l0dUdaWW1vekdj?=
 =?utf-8?B?eGF0L2FBR0JXY0VOcGRFaWVPdlJ3cW1xcUo0UW5MWW8vYkF1WlhlWHQrNUc4?=
 =?utf-8?B?aXo5OU82Q3lXNXVWWkZyNytuak9iTGxGK2ZDL0VtMkpGcjNzMVZQQXM5aTg3?=
 =?utf-8?B?VmlUUzdMYzlOYkxGV3lwN25NcWpETlJBaTRxRUwzak4vS1hNN09nZWx5VmlC?=
 =?utf-8?B?R0ZkNGM3N2dIZ2V3TXJYTmI3R1I5aDZ4Z3ExU1liZ0hlb2dUSkR4WnFvSlBK?=
 =?utf-8?B?ZXQzbFQxZHdCZElodG9nTlZQZ05SOEY1MVlzOUY4UGVKb1RMRDV4OWkxZnkw?=
 =?utf-8?B?U3R4NnJ4aTBXUzhVRXNEc3JHajVXdG5NeG1Gem14L0xZdkJwallPK055Smk0?=
 =?utf-8?B?Rjc2VG1CZDFCZWZkVEdqVWFjUGMxQUc3ZU1QUkFqVnBvQ2pXYVY5NnZ0M0c4?=
 =?utf-8?B?c1NJQ2FIUGZEdWx2S0FmOThsV0UyUm1ySmxzR0VCOHRtdFNJSEVrVHB3MlJK?=
 =?utf-8?B?VVJ0VzE4aUxJSmNFNTVjRmN4NERVcWZJZytoZzNmRlpSNUVKM1VmNjcrdjJP?=
 =?utf-8?B?VHNhUVdUd1I0YndDWjdpSGsybG15VTB5U2MzT2hwWXNwWlQxdTZMdmJZRGps?=
 =?utf-8?B?aS9nSWlXa2srWDFhZTE0OEltS0NnMVhNcGF6dVJJMU8vS3RYR2NNbHJqMkNl?=
 =?utf-8?B?SENzK0o4WEhiZXRrTEljWnluWUVpWFgxMlA3S2VaOC9odEcyZnRiMGQya3BZ?=
 =?utf-8?B?eU0xYytIalROMnVodUJmQ09CVCtWbWV6WEZ4MG9QYWVqWWlrNzBPM0JJMmdD?=
 =?utf-8?B?M0VmbFRRbm9Qam1vVnBXQS9meXZpMTRBSGJRMnptTWsxQ1BsdURweHRaMUpO?=
 =?utf-8?B?VS80b1g4d3RpZ2hIZWo0Y05DazE1M2k2SkRzVG1lb2JQWGNZb1UrRHc1WnND?=
 =?utf-8?B?Qzdod1pjZDdSY1FLa2llTHptTmM4QzFTSXN4S0NienZiMjJnRlM0UGhuQnl2?=
 =?utf-8?B?Nm5pRVNVTXFjaXQvZlFxcEd2aVorRXd2RTFOSmhvUmJWVUJlVUJWWSt0YnBU?=
 =?utf-8?B?cmpXNWtaNGt2Mnh0WXdZdFNUWk1rNU82Rm9lcDBiU0xsTGN1QmczK1A5cEg0?=
 =?utf-8?B?VDZJdVdCWHdRY1pHNWVXdmo5RXhla2JzUVFsN25UWlorY1h0WGpsME5CNGRT?=
 =?utf-8?B?ck9mZDNkcHEzMEFQY2ROYWdiMlVHMVBnUWI1bnArcExFdUFudkpUdVBNWDhQ?=
 =?utf-8?B?WXZCRWVXNU1tT1hFLzAxSW1QaUd1RlVjenN1Zms5RW9PbzhLRHM4bXJ3VDNu?=
 =?utf-8?B?eTNZUU5Pbkhod0svVWw4WGFvUkRzY1JBQVozT3hXSFpNWGpUQ2RtTTE4b0tP?=
 =?utf-8?B?R2J5UStpUUd6eGFyRWFUMk9NZDhGRG5hR2VtcEZlUTVtRmprelZ4MnlhRDcz?=
 =?utf-8?B?WVRpRnZGZlRxaU5UZ0xVTGZCUWNvWDRUaUNKVENmVkY2dHZPVWdCOU9tcTBj?=
 =?utf-8?Q?ADjlx0MCIPoOlUUQqeKFpUclm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6120a6f5-af45-464e-a427-08db883ca6e0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:43:48.3209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZZwoADdSmskgi8gXOPs3pEDvooWCc36JHr0remVm6P2BRA1lPHAX7GO6OepSJi4erF6IPDpGnYZKqBBk68EUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6794

In options like -march=, it may be only the sub-option which is
unrecognized by the compiler. In such an event the error message often
splits option and argument, typically saying something like "bad value
'<argument>' for '<option>'. Extend the grep invocation accordingly,
also accounting for Clang to not mention e.g. -march at all when an
incorrect argument was given for it.

To keep things halfway readable, re-wrap and re-indent the entire
construct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In principle -e "$$pat" could now be omitted from the grep invocation,
since if that matches, both $$opt and $$arg will, too. But I thought I'd
leave it for completeness.
---
v2: Further relax grep patterns for clang, which doesn't mention -march
    when complaining about an invalid argument to it.

--- a/Config.mk
+++ b/Config.mk
@@ -90,9 +90,14 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)
 # of which would indicate an "unrecognized command-line option" warning/error.
 #
 # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
-cc-option = $(shell if test -z "`echo 'void*p=1;' | \
-              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
-              then echo "$(2)"; else echo "$(3)"; fi ;)
+cc-option = $(shell pat='$(2:-Wa$(comma)%=%)'; \
+                    opt="$${pat%%=*}" arg="$${pat\#*=}"; \
+                    if test -z "`echo 'void*p=1;' | \
+                                 $(1) $(2) -c -o /dev/null -x c - 2>&1 | \
+                                 grep -e "$$pat" -e "$$opt" -e "$$arg" -`"; \
+                    then echo "$(2)"; \
+                    else echo "$(3)"; \
+                    fi;)
 
 # cc-option-add: Add an option to compilation flags, but only if supported.
 # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)


