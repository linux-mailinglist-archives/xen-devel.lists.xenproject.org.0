Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783616BB6BE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 15:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510104.787190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcSYI-0003ft-Jj; Wed, 15 Mar 2023 14:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510104.787190; Wed, 15 Mar 2023 14:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcSYI-0003cu-H0; Wed, 15 Mar 2023 14:56:30 +0000
Received: by outflank-mailman (input) for mailman id 510104;
 Wed, 15 Mar 2023 14:56:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcSYG-0003co-Ux
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 14:56:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ec4ef8b-c341-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 15:56:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8387.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 14:56:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 14:56:24 +0000
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
X-Inumbo-ID: 8ec4ef8b-c341-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bb02jUtaHDrvuXBagkL4IiO6QocBiolOEziSzvdxAjQGvSOuESbaLjoJGIkl/hYlT9dTG0lTDqKvrmo5mtOzIQWzIfGqR1fueFl6xXSVfSJVhqL+N1NOyUJ4lVxUFF6jxj3/nHqEeOfL0d5bMQOXGQGRA9b6Letj9BU1VYsa6I/FUJqimjlj4EvQSRiPOxP0PxfoWav3eaSI3EwtXhkk8IZz+FgwXEB9t2ryLJZotMFI0yF2kb5aCLQs/6H3W3NL5s9IvLIgN4iYv2CgBODSNSRvSQp3219Gx/BI5t43OHqFcxlZ79caqC5NUG1M/J+fLJ4zeiwGUvc5ksNjcDezAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDPy47sNC5VH+IRcfbbFuhuXJwhwTiwBQolUW2VF7I8=;
 b=ZjMs4ApRqjC7kj0eTyVdA1B5/zObpX20xztCbIqQg1KBZlbYkrgaAxjIRbttK+MH0GfIAho6Q+J8P9bfQpcw0M+9sF7c9GNXb2IkhtOGDX2FIzb3AZGxO+zLTVARVC4TVjdOdaxe4HuaSh9UhcWA2xP0e9C9xayPIZntvJ3Aj+39Lq3r9jAj653k62Q3sT49EFe+LLcy9wYfyWSM1Eqv/pnraraYbNyloSkrYAtjs+jfub4zJ3VC+/g7pQVKVWLbvwzRPKLyaC+PHbEVD94acAfIgxD29V+IHnP3XRWwVf3S0uBgg19A+yw6q7Y0iGPPUo7YCRLdwta9hQz/PgsemQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDPy47sNC5VH+IRcfbbFuhuXJwhwTiwBQolUW2VF7I8=;
 b=we6jm8bLnN/vJ6l5YgdcrOXQ7CprUF9PeEP84d7iuSs8/3VsKkqm6QRUkd4YgqBH5kRxXqMPJQ618Lbq1lhwAbahnFG/cbZvPb5nvueDhNBhoXkJom4h1/5+cCD4jbIlBvrhihq/Zq8gD7u8a4hi/bTzilZ4bQsU3/I48ixoCzZK5YJhfdpm2JQGykfkPDRxlrtI8KmOYNBL+OWWnHoLQtRvH1iFhucAde0vl+iyS2AsiyR6ZeYhY0o6wM1MuJP1WfpPWLUqxj1/OQN2++TKXjkOXai0ad9neJzYa6ugfLTvA88/v9tJBgCaunBtgUFScZ8ZDTWyVwkOc5l+WQpW3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca9930ee-e6bf-3cf3-633c-02d5f21760f5@suse.com>
Date: Wed, 15 Mar 2023 15:56:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: omit "source" symlink when building hypervisor in-tree
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8387:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f17a94-6724-4744-09f1-08db25657212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tarx3vht+jLZkVaR8QQ0YdICOip6Uy1e5iKWuY7rx8Kg3yEuljuZzrOQfAB6xMQPCe99VlzYi1lJ0pM7RyMIR8XKp8+36vd/MZu4wk373xDzvt1lKiEwQp4PnsdcPDTNYWcYlLFhdBTYoVW8ydM66QfhVWfWc9ZMXT0C1w5SSEZ+TMLPkwwJFvmi1qWvEn7EhewTp3aKWqb+Q7wWupCJswQOmW/gLGkQKmg9tPDbBSHKOVYaLQf3d6Ma5ww9nxVLdtmkYhiVn4EC41n1fm0sG4TxJSWCcwNiDXtEdNOgz2wWr56QXliT/C6lroYL8VgfmwtXdvc8NHH7NylT/71CttsnzECT9OBjKEJz+fURCC88X3f+0DXW4/xcShCen+LeLfao1//SgqIedEvXPhj64TQxUhOUgh8WbrO+WWKVI3lJsBjMVqHhAESBKw+Eg5MJi/+NVhGi6qn/kQLjbXd8WUpZL7ZofWjXJfJP5iTlB2gKgQrtHkyBS89EzHD8cx16mA7OlLenmzTiOMk0ig6LfK+EfBgahhii0kx/G0cAPLWydnvOpmW2izUo1S/l4FFEXX+9ajCdEd0ZlrmGeRCcy1khz6R30BtjGAlaQOsJwlwDo/eQZi+LCD+6D+sw25XRRhFi9kM5Rkpj+DfQJF3Vq2DsTOLvtNqobHxeLGsEoaIaOu4biNL4pf0vfBUO/av7zZP37xHAItfyAQxrw8B8I1Y3CYDSVCdOEupGnhmiOVw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199018)(31686004)(8936002)(36756003)(41300700001)(5660300002)(4326008)(2906002)(31696002)(86362001)(38100700002)(6666004)(66476007)(66556008)(8676002)(6486002)(478600001)(66946007)(6916009)(316002)(54906003)(2616005)(6512007)(26005)(186003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEt3UFIwczFPa1ZqWGdMblJnWWkyemhwNmdzczB5NGVyY005WXpuK0VwNXpE?=
 =?utf-8?B?RWlzYlZ6dDdUbS9LQitFOUNjS2cwWFBYc2tRSGRvMjMwUXJIMllVUVlOM095?=
 =?utf-8?B?M3RSc3FuMXBiNDlqNlc5TENJZUlVZGlWRU1xcE9vRlJLMm5IeVRid2h2MSty?=
 =?utf-8?B?L21vcmxGWEY0eW5xdnFZWmtldDhSZXIwYS9wWDQ3ZUkzbEZRZ3JwOTNldnZ5?=
 =?utf-8?B?WnpGQ254NWptUERnRnM2NG0zTGhNMTArdjRlelBMcEV0Tit2MFpORlB6ai9i?=
 =?utf-8?B?czVWTmZLanIvZTFneGVrczV2NnNMTzZKZUZGRjZ4aWxjMWxwc3RtVzQzeXl6?=
 =?utf-8?B?QjlkRDdrMlJKVlRZL0djUEhpdWZhQjUzU2Y1cFJQcXFkRTlud1dRa25MSjhh?=
 =?utf-8?B?blFzSDRiODBxY09yVzV2aElNbmxHM2ZxRHcyVnkwZGRXaHlYSHRsVCtMUWp5?=
 =?utf-8?B?NXduVjgyZXgvT0RlMmcyQm05SkF6RnZVdmhSTkZkUi92SCtOSGRQaEhrbGZw?=
 =?utf-8?B?RUhLQ1oxT3FxRC9pNVBDSUpnQ0U5cHR0MjZ5KzgvMWhSYWRjVEtZSW1iVitS?=
 =?utf-8?B?WkRwZlBTdDdHang2MnBkd0E3dWhhc2dKcUFWdUtQYW9HUjhUOFBWRDZEbkVU?=
 =?utf-8?B?TXF3dEtieXFONXVCRmVwdWxESjNRSmx5dnBhSmpWV3RYUkg4SkdyWlRhcDYw?=
 =?utf-8?B?NUlEWDJvbkJWMUxjZU96TTVMZnVaTnY1K0NaR3lDQ1h0ZkR6TUJQbGNvRGx2?=
 =?utf-8?B?QmxDTjhnbUdvQjJhamRVdFY2Q25xY04yVXNORHdjUm1IRzVSU2ovUlNrd2NW?=
 =?utf-8?B?NXNOWGZHbDM0dytNUStLRjhGcVRiazMvYkdOUzZOdzdsbFo3dkZJQWFIbnQ3?=
 =?utf-8?B?U2ZuU1pCMllaOFk0bjRFM1J2TlRqbXBpallnQTBibHpIOUF6Y0hzSzBMSlB6?=
 =?utf-8?B?MHdVMmVVWUs5TmhxZHZYd245SHJnK1JXcDVhSWhsQXVFS2xhMWcxV3JVbUZT?=
 =?utf-8?B?dFBmKzJvWTRCNDYrbTJuNnBQZkV4OXdwUTBhWlkwM0YvOW1PKzk1ZG1kbVlv?=
 =?utf-8?B?UitGZUNxeGR5bW5Ib2xwdVNlUS9TUDhNTXFjNEZHSjFId0VRMmNrV3pnWTdw?=
 =?utf-8?B?ZHg2ajMva20vQU1NTngwTE1neWg5S3UzckRUNWloUGEyT2o2dmJrWFBZb3Mz?=
 =?utf-8?B?OGUvUlRQOXdVRDZPbEN1NlFyUWowMklnWnQzMUM1WjJMY1lVeHppbmd0SFBE?=
 =?utf-8?B?STk3RXJPS1l6cjZaOUVNQk5FVC9SSDdZVTVVOG9nRDk2QWZ0TExyTkNVd1RQ?=
 =?utf-8?B?ZHFxSTVaL0hMM2t6YmVYSFJMQjN0SHNjcjVwY2JCUmFlL1Y0QTZzemtRQktJ?=
 =?utf-8?B?OVNLczFtN2N5YTlPbnZjRkkwSU1JRm9iWSsvMWd0QzFKanFITzkyODBLVlVY?=
 =?utf-8?B?amh5RGhld0IyeS9oWUIxN0J6WncxZXhZdkw1RUU0akhLbWVoaElkTjFhR2ln?=
 =?utf-8?B?ajBSVmRNZ2FPV3V3VVZKYnNxdjlDRG9zMWk2dDAwcW5FLzhKclBWb0V2U0xU?=
 =?utf-8?B?eDVFb2NTTzI5K0RUNWFnTVNnQUFXWUhVNWc5WEVIZXB0Mk8rVkwvL2p1ci9Y?=
 =?utf-8?B?T2ZDWWMxWjdhNnc1VVhJamxiUmpZcHQ2OU1XN0NDVDBmSXB3R0xMNW94UmRB?=
 =?utf-8?B?b3N3cVR0cENYLzFWRFBSZEJENTNQYkFpcGE0d0VRaGdwbkxtamFlazVpV3cy?=
 =?utf-8?B?Y1haeUExYUpOYW55bVF6UmZ6QXRBSk1KUjFlS1Z6UnZJSkRZaWFNakl5azJv?=
 =?utf-8?B?anExL3JGK2d2U1Yrb1U0NlE4QXpTdEhENUpldDVHSUNXYXpCeVlQZFBFMXJR?=
 =?utf-8?B?WTRwTnZEc3FXU1FFdlBDeXNrV2FFcUFSTUc0Mm5HZ2JFYThCS1RNUFpsWUNv?=
 =?utf-8?B?KzFUcnErc2xxK0pvRUpQZlFWT3BINEh1YnZaVXJyTDcwODVhUWxUUFNVM21q?=
 =?utf-8?B?Y09tQVIrTGdLM3U1SVg3ZlpUVEVjZkFYemFVTzlMNVdOODZiSU5SZkNjRyt3?=
 =?utf-8?B?YmQrVW15Nkt1ZmwzNVd6N3I3ZVRnazNnZVhXdlJybkQ3RUdjSmVOWjV5MEts?=
 =?utf-8?Q?10+Co8qlTVOaegCHFmdFiLMcg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f17a94-6724-4744-09f1-08db25657212
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 14:56:24.0172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFE5tivNcqH6ny34gPtqzNUQ866KIdKuHaJTZR/VabpI41iUvPfivgA1nGABAFXsM2eExqEKkuOAlFbGDi0rPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8387

This symlink is getting in the way of using e.g. "find" on the xen/
subtree, and it isn't really needed when not building out-of-tree:
the one use that there was can easily be avoided.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/.gitignore
+++ b/.gitignore
@@ -295,7 +295,6 @@ xen/include/xen/*.new
 xen/include/xen/compile.h
 xen/include/xen/hypercall-defs.h
 xen/include/xen/lib/x86/cpuid-autogen.h
-xen/source
 xen/test/livepatch/config.h
 xen/test/livepatch/expect_config.h
 xen/test/livepatch/*.livepatch
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -310,7 +310,6 @@ cmd_makefile = { \
     } > Makefile
 
 outputmakefile:
-	$(Q)ln -fsn $(srctree) source
 ifdef building_out_of_srctree
 	$(Q)if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
@@ -321,6 +320,7 @@ ifdef building_out_of_srctree
 		echo >&2 "***"; \
 		false; \
 	fi
+	$(Q)ln -fsn $(srctree) source
 	$(call cmd,makefile)
 	$(Q)test -e .gitignore || \
 	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
--- a/xen/common/efi/efi-common.mk
+++ b/xen/common/efi/efi-common.mk
@@ -5,11 +5,16 @@ CFLAGS-y += -fshort-wchar
 CFLAGS-y += -iquote $(srctree)/common/efi
 CFLAGS-y += -iquote $(srcdir)
 
+source :=
+ifneq ($(abs_objtree),$(abs_srctree))
+source := source/
+endif
+
 # Part of the command line transforms $(obj)
 # e.g.: It transforms "dir/foo/bar" into successively
 #       "dir foo bar", ".. .. ..", "../../.."
 $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
-	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
+	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/$(source)common/efi/$(<F) $@
 
 clean-files += $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
 clean-files += common-stub.c

