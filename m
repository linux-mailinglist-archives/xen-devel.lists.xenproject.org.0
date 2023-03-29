Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2236B6CD78F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516161.799841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSwj-0001J7-0i; Wed, 29 Mar 2023 10:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516161.799841; Wed, 29 Mar 2023 10:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSwi-0001Gh-TI; Wed, 29 Mar 2023 10:22:24 +0000
Received: by outflank-mailman (input) for mailman id 516161;
 Wed, 29 Mar 2023 10:22:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phSwi-0000AN-6m
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:22:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9724d3e3-ce1b-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 12:22:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 10:22:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 10:22:18 +0000
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
X-Inumbo-ID: 9724d3e3-ce1b-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5K+KTgbZKxr5BFROl5peoFRwGa2g277T6soGF8cjDZ8Ih+aVFhU2+Xw9zkpbMWCjyz4Et4Q7cpt4LUhzZhFO98zxeKHoUI+twS0MPHwWDU4WHAIa0zEUbb73lvB6Nhn6XZph7aDjfskLFBFTGj3BNC7+XaoM8aq+d7BfJtYIOxFqZqiemAqcXcDgvbrUFezUbNInmeqDGo+ozNEHuIauXl5L/Qec1eaxyvnObtf+Fzv4nF4hc6RggDpbgpXPdVxSONCxzp+ZlODvUF0xRNMu1iMqtwo1jsNwKpwySBDUJDMuJlNpBppqPxYBZRbmrynn/yZUVVEnlJ7NCCM7htFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP/pn7PcqitYNzksceXHyWQ8WFxxaZJTAXiWHpt903Y=;
 b=V/xdUZSNQXhLa5UqPESrzT5SwHeZuFrMdCLtGVMj2RDCHAPvfvIEU6UMgeiDG9Td3wRXh/+ywCNJmrzspEE8bNY+CyXAn0ASq35uEwF2+WZbOEGAj9+B8TTN9GvjSSQex1ihp5i/l6O+XMgTsQ8L6VQUEUiTk9iDB1UnLsFqbRI4WZaPj/h3a14vpeHc1ntjC4WU9hPCk0RDhqXBG4cLvpG9oZa1CJaOl9yJ6WmVToa0K7Y15TFhp5Nk5E9AT4V2w0dkOuKSYsrAX1/bP/IVTQMxHUxuvtofOWtaYiKF55GY5rBXSeQuBsrD+RyUiaEltovrhZFCfn92lB2Qd2neBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP/pn7PcqitYNzksceXHyWQ8WFxxaZJTAXiWHpt903Y=;
 b=xlYISuAgarliBTf5gW9z/Cm+SFyydo25P0pilG8OhtDJFpEZo7q5QvhIz3JiBrDdIFnwinPgwFYdBJl2RLetWEhTzZ18NHZnvV+h7OB8KKFinCWr9jxeYxDRuWYXETfB2DyDX6I4tDbmDtkhBOWq23qiIW0Yor9K/ikGeCjtbIXAXrNPYNkxKlUW5SMenMLnzdaxJ6E+SeXFqupF2z2EGUIWgYzrdg40ulECe0qOnRLakShyof+gpqvSvFqVHy83QeZInmD/aPjNqi4uJwtwpOwVl3L6jnT7eQvEPvRvmoHU+suEXtWYHOwqZNvpsoSGXmUpcMERV31BRvg+D533hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e63c6e5-11cb-9f0e-b33e-0247b17e3785@suse.com>
Date: Wed, 29 Mar 2023 12:22:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 1/2] build: don't export building_out_of_srctree
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2e3c8f9d-8007-638a-c88b-21ad2783d8d3@suse.com>
In-Reply-To: <2e3c8f9d-8007-638a-c88b-21ad2783d8d3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8646:EE_
X-MS-Office365-Filtering-Correlation-Id: d8909c3f-54e9-4178-e14e-08db303f7988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N8DOJfQ7Sl6jT6pKJSKrvqzbgg9OP6wbghkH7olWoMbfLjRcUElTfX07We54Y6KOwOaxS9djNLZBQqSV4RTXLWWIkh/xecl+INLjbMRSCGvKwv3VFl7kFABcKIuyv8iifLlSoPUpDLIDq0ZHZJT2taOU0GKIqEtJ11PfnVHPQjA/Q+EFcQOjSpu/0bwzeWBSN6rFSfFCKNKYkynLBNoCqe8mAKNh76HX+0cjSFoXbFKdLi6L5grxEcIEegZEWsZEjA+zYPHa/++Jzc/P5pTb+RHNwJsBKaXtUEeMcGUDzgaShZcbidxTdmdHvN3QyPMgOh694Pn8jhEBVu1YBPQ1lKn1WpFkIkEYIRZ1UPbNssrwvFVvV5sdwecX1DtTxAmNPvTY9DonUGlizBNlqfQ+wZmAer2U6OgoV9TzuaQ+jpgg1XwrlKt9X48Gl37+fswCU79mkO9QAKAhNCwe9JgxewOTcREwZqOEIW60QKWL01N15V+sJy+NbqzamjlJmVp9oHBVVVBd+14XCGoeFLnkZBTJG4lZD1AAWKJmTWco0bUKAKabVxbiv5K/DYyKovgXgtKfV6WmtrcJ9vBp6uonLbNkv10OoCeZgYVTvRM29E2NTXl28RnRj+ahrK1tCgqMoSJ/QJ1trl5RcSpJPkblOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(6512007)(26005)(38100700002)(6486002)(2616005)(5660300002)(186003)(2906002)(8936002)(36756003)(54906003)(478600001)(6506007)(316002)(6916009)(4326008)(41300700001)(86362001)(31696002)(8676002)(66556008)(66476007)(66946007)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0dBTUtRM1lFeGJpaXF6T3JmQUJrenpMYlVKcWRRV3RVZzk4ZVhkUnlTN0hJ?=
 =?utf-8?B?NWJRWTJoeEU0YUUxeFpuYTg2Y0hGSWkrNUg2RjdTNU8zQUJ0RVNPZTF4dHF4?=
 =?utf-8?B?YkUwQWtCTjNSdy9nWDNvS2FTY1pkYVJvWmxQNUtiZzRKMVZ4eXlsWk12NDF3?=
 =?utf-8?B?YWNWM1FDalQ1RlZYTmFocFNTYmVCaE4vQ0IvY0JwUHJnd0RBTG1HMFc2d1BT?=
 =?utf-8?B?YjFXWFRkR2VqVzRHM0Z3bktpb3JZMlF0azJPcXYybzBqa0RnZVFnWG5qWU45?=
 =?utf-8?B?Zmp3YUQvQ2FITFlYOThXS0lKOCtLWTRZMTZEdTJEdG1FelJsMTJGcVc2Mi9p?=
 =?utf-8?B?ZzlWYmUyOW54Zm1CZUtyNlEzVWlWSCtLYTRaeGFpQWtWbnpNTWw0c0FXZW1L?=
 =?utf-8?B?bWo5cno5SzFTckhMN0RaYzE3d1JZdFgyTGFNUHNKMkhiTzJYZW1KMmZlZ1I1?=
 =?utf-8?B?V2JvdXBOZkUrenZ1UjYxOHc1ZjM1c1RpRWZZYlZhUjBwc2VId3BSNTI4MzRH?=
 =?utf-8?B?MTZPUDQ2SW45aGdwOTZPaWZibTgxL21Eaytoc3VaeGRDV1hMVjc5RG9XeTk1?=
 =?utf-8?B?bzBDRGxzaWtCaTRiNFQzS2xobkhmRTJMUEEwQzBkaFgxOHNrMENxVWp3ZHc3?=
 =?utf-8?B?UVlqZTFkVUlZK1NXRVZ0czI2QVorc0VJWXR0NVpnRGl6TzRmWWNYa2NNQU42?=
 =?utf-8?B?SlI1blNkVkt6bStwNW53Y1draTVVUTVmSFhDQjhoMEszRjJ6ano2M2FYVDIr?=
 =?utf-8?B?VEF4dW1ucGYwakJrMEh6dkNaNStHZjA4RHdmaHVORjBRUUZucWtNQlk5eGZO?=
 =?utf-8?B?NzgwYTdIL3FpZjhxcm84V2RPQllJekdaeXVRdzE1Qi9yN0VQVG50aURWZUM4?=
 =?utf-8?B?emkzUGhaZlYreVRFRWxFQnl5bEpIVjZQRjVmakFNR0VSVW4yMkYzZGdsZktD?=
 =?utf-8?B?ZkpndXFLOTdjK3FWOVVna1Ewd01HUGtLZUhtNkh0c2ExUHhrNEpEMGR6MmtC?=
 =?utf-8?B?ZE10N2ZkanhOVTNLK3JHVnNhSHJPUU5jTndJNjM2QlA0bU9rU3lhUlJ1VUpp?=
 =?utf-8?B?enJjUTdlUHhsN2lrbWtoNEVhZWNIbjJiSjFjWnhySWtOSmF1OGEwcWZuZ2xQ?=
 =?utf-8?B?R1BMaWYwL2pLVHk3SXVVelRoL1ZlK3p5UXUvQkl5SHVGeUIweWxCWWJndzdH?=
 =?utf-8?B?NTNpY05OK21xSm03N1dCZHZxMWJVZ05NdUwxWC9LSldYWEdaTzE0b3UyeTQ0?=
 =?utf-8?B?S3paMVdXb215Z1ZmN1BSaUkvTGdBMGk0eGxVdG5yNTZ5R3F3OVB1cnpjWmJp?=
 =?utf-8?B?eXNxRmJOUGVqREhmY2E1RHV4alB4c2dXYUFDNVgvRXZyR0xIY1dDaEF6WkpB?=
 =?utf-8?B?RE00OUZhWXh5TkFnQjkzbEtubVFwM015dFJycEtLYWxGeVpMaFNTZXl3Snox?=
 =?utf-8?B?NW9pWEhTbGxvZUsrcU9ucGJZNCs2NTFGOU5UbnpRT3BGNERSZElVWkZkdXRi?=
 =?utf-8?B?M21rc21tVFg3cS83a0tNTW1lR1F3Q2xxVnBRamZOQjV1Q0NTRnRMb3IvRkh0?=
 =?utf-8?B?UDIxZlJ3ZytEdVgxcDhtT2RFM2EvMG5VaHZHclRDYlYvRUU0ZE9LNkdVTDVR?=
 =?utf-8?B?TS8zTHBKcnpOcldmOU5xZHNKSGk3ZlJxMGRMVWUrT05Ha0U0UjhJL1NVQitY?=
 =?utf-8?B?S0RqeGlqU2RtNFpJR0Q5L2k0TTBFWm1WVExBQ1lxRjBaSjl3bnNLeWdyUWJy?=
 =?utf-8?B?UUtaL3ZkSEtXTUdvbWgrdnFNUk9nYUNJZnE0N0tlZUJUZTUxOVB5UDJxZitZ?=
 =?utf-8?B?eE5IZk1qWXdUN3dRaC9qN3lGelpMaG5Hekx3dGdMdVhZUlQyZncveUJmeStC?=
 =?utf-8?B?REQzaVZFYmh1ZS93dmNFa2R5emZkRVJLTitVTVRhRThMOTFzbFpPN0ZFbnRB?=
 =?utf-8?B?emRCNjhVUzByVTUwNUlJMUgzZUV5YTlWTjhGa3VFdXFyU2NoczlpZDZ6VitG?=
 =?utf-8?B?NHlIZ2RsSXJCa1Q3ZzZnUWM4LzJXSFVyWFlUY0R2OXlnZE1nQ1BVR25vbWZj?=
 =?utf-8?B?akgzVnRvcjVkeG5DKzJCR1loMHo5cDRpWU5icnVpQkYyZmpUd1kvTW5hZVZl?=
 =?utf-8?Q?vn1xrVHDEWvA6ctOSN8I5l9Ea?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8909c3f-54e9-4178-e14e-08db303f7988
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:22:18.4862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vB+T58nMWgh0BdqqJ2wngRqlEXmYxgE0FBEzhDp5XblOJ6Z+07w505fcJsObKKHcpOPKdzs9Jy1nMZtm/50pzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646

I don't view a variable of this name as suitable for exporting, the more
that it carries entirely redundant information. The reasons for its
introduction in Linux commit 051f278e9d81 ("kbuild: replace
KBUILD_SRCTREE with boolean building_out_of_srctree") also don't apply
to us. Ditch exporting of the variable, replacing uses suitably.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.
---
For further reasons (besides the similar redundancy aspect) exporting
VPATH looks also suspicious: Its name being all uppercase makes it a
"non application private" variable, i.e. it or its (pre-existing) value
may have a purpose/use elsewhere. And exporting it looks to be easily
avoidable: Instead of setting it in xen/Makefile, it looks like it could
be set in xen/scripts/Kbuild.include. Thoughts?

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -208,7 +208,7 @@ endif
 objtree := .
 VPATH := $(srctree)
 
-export building_out_of_srctree srctree objtree VPATH
+export srctree objtree VPATH
 
 export XEN_ROOT := $(abs_srctree)/..
 
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -14,7 +14,7 @@ $(obj)/head.o: $(head-bin-objs:.o=.bin)
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
-ifdef building_out_of_srctree
+ifneq ($(abs_objtree),$(abs_srctree))
 CFLAGS_x86_32 += -I$(objtree)/include
 endif
 CFLAGS_x86_32 += -I$(srctree)/include
--- a/xen/scripts/Makefile.host
+++ b/xen/scripts/Makefile.host
@@ -88,7 +88,7 @@ _hostcxx_flags = $(HOSTCXXFLAGS) $(HOST_
                  $(HOSTCXXFLAGS_$(target-stem).o)
 
 # $(objtree)/$(obj) for including generated headers from checkin source files
-ifdef building_out_of_srctree
+ifneq ($(abs_objtree),$(abs_srctree))
 _hostc_flags   += -I $(objtree)/$(obj)
 _hostcxx_flags += -I $(objtree)/$(obj)
 endif


