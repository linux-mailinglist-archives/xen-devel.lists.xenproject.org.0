Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B85EF2B2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 11:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413556.657271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqCE-0004fi-LM; Thu, 29 Sep 2022 09:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413556.657271; Thu, 29 Sep 2022 09:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqCE-0004cF-Hk; Thu, 29 Sep 2022 09:51:10 +0000
Received: by outflank-mailman (input) for mailman id 413556;
 Thu, 29 Sep 2022 09:51:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odqCC-0004c7-Iu
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 09:51:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d252d72-3fdc-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 11:51:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7209.eurprd04.prod.outlook.com (2603:10a6:102:92::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 09:51:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:51:05 +0000
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
X-Inumbo-ID: 3d252d72-3fdc-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWq67xcV4i9QBj90mg9Nu2eBsPYNCBSPVq0FKG55chfUeTGAa+u/RpOwbWasoMB/Ttp1cWti8rtPlfvMOh9xAJubTtO9gJlJCAsZqQK3O0Jq7qOGvUqqCSXPdGVEOkgpwm4zCcBtw+o2Y1EDxNWV77u9eHVe+bpoCnQT2nbTRrhQyYvB+Lcc5y+I3rX9NjUJVzYYuqIi3gOG4aQuWSO/bX+04F+ubPue/2Xp8nUf1ZzIwTNtSDLPBlStWa3JsXPWhFRVH8Uv3BHMyOswIsTau0Q8NEjBXBBngI1qPR1FT6xL0HIunNpkWTBFWc+uJLBt515WoU7mN+N+PEfm1CzFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+86ZEmgrwt0Ukv/jXJFhwGTpqrhzbbbTEia7yvF+u/0=;
 b=YhveM2T/ZRzuDMCZCZbWpNNhZLX7uw9oJPq0CrZMNtF56VIYaTa9hX+UheXZ8KBL5v8YXpt7u1aX/IFNtsCFWeSqP4gimN/XYbq0NOCc7EPPpwJHtwHTsKVbUCZfoFcAFdY11vh3/Rhrter5H0XYm7CIP7iKvuA3iHMafvqctAwr87FBXTtXk5TsfYr0givDCG90XQ+fHKuSUk6D8UWf3wYxCU/Tw5zv0TFryiafCKDZ6T7rUlTbVunAPrLaRjGmThtJfllngl/D0zzZvSu10pblqXcL5tERonUZGy7FmaSgNGtNn8f1/JA7aHtTYgy6melIuRXhnnctylrgrV8+mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+86ZEmgrwt0Ukv/jXJFhwGTpqrhzbbbTEia7yvF+u/0=;
 b=fnWa6xGQpL8utn7klNM+OykDOBexy1+lgbZHntTziy3B+rUp/nnsx2gj2TEsKph5mCmhmctwcqzR3NLxWwabPMrgT2TxjUsqWlefRst1S3fzj5Ti7fErGmCbrlFw68vkYkG7ZC6qm6epaQE8hGwR4CYttdd8UMTR9w/Knn6/OsozorTwJC9vgd7WnmV539BrvAWaDfEcnT0kt+q/BofWKWdqD4LoPnpzVUVyv9fCZ2wUonVZvEV5+YW1jVFowlANzxeSzraAOAmyfLE6S+YXfcuLg7ewEmX4WQMq19ur7ltuRMOhYeH4Yb/JEchJ9Ow5DvADeT8VCjPaNZc5NjRjmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b5c0b8f-b243-47b1-2ce9-f315d5c7138c@suse.com>
Date: Thu, 29 Sep 2022 11:51:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: [PATCH 1/2][4.17] x86: re-connect VCPUOP_send_nmi for 32-bit guests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <96adeb88-dcc4-5ca2-54a4-883058169dbb@suse.com>
In-Reply-To: <96adeb88-dcc4-5ca2-54a4-883058169dbb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0244.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0ada32-8c7a-44b0-ce0c-08daa200205a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Btkv9oXTgbuermqLg0rDUEHeAmDQTpPm7F6xHZ0gPk+QqZkHCOjGoU4b8qiLg2mcjqcjJWq6VlH2wQ6NXqRVI6cNeYQe/BaxlVPWhKxl7eFtP4wk4Sbv7nw9Xu05T92We/Y0BKbW81aq15shKu6Q0Oqx9UvyKrfAU0qZzYGgvVh0R5jSxwZqrGgtQageERjGr41HaDj/gpksyYafitFRBKwl7jtUF7QLjAmfM5Ja304AyuvGinoT9XJOkYYq3ERW/h8Ih/lxrb3ogoVrvASweR2yqIUcngQGUG2k1iBnRphvoe/btnmxwJ+nAt/lGY6r2a96k82gNri+SOUk5d9DrwTlhvc0u/TP3RQQ7wVxTYA9CbD4r/vIL+8GqIMu9lr6I2ryhCa0lkUPJKw0vvAF+k0lxcYjqUxPgkZDuaVo1BgCSiQL7nHSiIuoGJN6UkHjaxlRGSwjLutzfpRc1YRnmHPivWht9nlkVtcGd11S15S/Rv8Hdv33/5pKY7MT2CYV4ltUr8lKhOFUYW0mhjrorv5qYURkabfLaVYyFt5JfzdedkcYBrocR4mAx+ZgxP/7QGvIRjrVYz+abzq/Pscp2gw90H+3BLn5oMgJh5aObXy5wV+YZxuwPifzB6SrdeshBaxbvmWcmIWA0yGzee/I3liY/ZYHAw4lQ5IvAi971ozJO2vMTU2EqE+hcnxRq6mI8Yf7cy+6t78JB05Hudfi6I7i8d8cfMkRX5U7pAv5h90yKg1hxNdmiBvxNQaIjBzrhT0Y3xFmufrIQjRvY9zurWlatLPUQkFkDe1odumv4j0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199015)(31686004)(6486002)(316002)(54906003)(6916009)(478600001)(31696002)(36756003)(2616005)(8936002)(66946007)(4326008)(8676002)(66556008)(66476007)(38100700002)(6506007)(186003)(2906002)(26005)(4744005)(6512007)(41300700001)(5660300002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2Q5SlJYZmRpUzRCaWpkTHdFRElTL0s0Y292dnZGclhMREpYRW55eW44dktB?=
 =?utf-8?B?ajl0Z3hWUEEwdnNqMUVsMElRbjR4c2IyRDloSUdiVTMxdStXOU8rRiswREVI?=
 =?utf-8?B?U3crc1QzNm41Yk5jQXBid0dKNFNEeXdLSnZ1MTNMNWx5bzlHMWw0VjA5aGdx?=
 =?utf-8?B?dXU5d2d2a3VuUjFTeFR5b0VBbnlSMUtKKzdwRlVIaDN5NnlSZEY0NmxBK2hj?=
 =?utf-8?B?Uk9UWDBKUVR3ODBLZnhVbDRmemh6cXgvcXlXY09jTXZUUHNpNnVxTzMzSDRP?=
 =?utf-8?B?ZnRZR3lQNHJrNEQxOUdsWUd3YkczaVY1WlJqNlZCMnVOL0IvRXpKWjlpbzBa?=
 =?utf-8?B?Z1RNdHdmRlpGN1FRK3p0SEFHYWc2Y0FEZzUrRzE5VXlIOG5MZlJYckFnMFh2?=
 =?utf-8?B?aktRbk9DYi9pVEIxY1Q2UnVERGRTQ0FWY2tCZm9BcG9MN1FhaGJPdCtKK3J0?=
 =?utf-8?B?MU41UTlRVWtGRHE1UjZQTGRkSHNDVkxLZXdrZ0xMcC9YaVBwT0VmVVdraUdy?=
 =?utf-8?B?L1V0VWlxcVRGeENkME1RVFpoN3pzdUZaT1Y4Z09xdjkxRXVXWWJ2VXE2QTBL?=
 =?utf-8?B?VWsxdWVZTTJVNEc0bkV2TXh4b0YrZzViNk9vOHQ5aHJYYVNFelZ1SmE5cGJE?=
 =?utf-8?B?ZHoxbDBUMUpaVU9GSkRlK0s3aTJtK0trWnprUmxGekFHYUdiV1p0djZjMUVO?=
 =?utf-8?B?QU80VFVQMmVycGp6WWJ2eUh6cTRkZHFYbm1tNExoZWdYdncxUGV1RTYrTFR2?=
 =?utf-8?B?Q2FlamdocEF0OWx0cm54SU1rbGx0ZUlXeDRGc0Q2Z2hqZXRVNDVzb2ZyOGc5?=
 =?utf-8?B?L2NkUFpuRUdGc3ZtS3dNcDZYZEtGREhsZ0JRTXJvMHMwQlBEWCtPQ3RadHNr?=
 =?utf-8?B?L3FuNmZtZUFuUEQ3RVZxVFBRTkplVkFHLzdZb2RseEtndVVsVE1maTdObktB?=
 =?utf-8?B?dVc4aFRpdFVXZW1uMU0zMG11bzRUVHFlbXFNbHBzSDBpZUZwSm1JdWJWQU9a?=
 =?utf-8?B?Q01IRUl2RnhBeklNQytRNXBoK2NMcThodFByRExWM2tUTjRFbllhR2dsSkNm?=
 =?utf-8?B?TmZKUDE1eVhnTmdXWXU4Y2pLL2E2a3dwNkhKY1RQUWFMYXZHWWpyNy81VmJI?=
 =?utf-8?B?YkZaMmxjRWFXek1LaGI3QVM2Yk1JaTJRd0pMaG9sTmJmaTBnN3grL011Y0xD?=
 =?utf-8?B?U2pHNWRVc3IrL1N6R2hlelQ2QTF0czNvUllxdUNoaXkwK25xbGk3Q0diVTdn?=
 =?utf-8?B?UHVMUDhtSk5QQVBwdjhxMG41WXowS1BUbllBQkozMk1VM1I2b1dHcjdhWFFI?=
 =?utf-8?B?dHhkK09MY0FuTGhkK3V2V2RQa2pqcmk3QjJpRXA2ZXM4MTlmU0JCRE9zdzN6?=
 =?utf-8?B?QXk3THo1N0JycTBOWlZ3OVR1K3c5bjRveU5oTDBReks2cG5DQ0djQUp1U1Z1?=
 =?utf-8?B?dFJVZ3J3S0hRUVBIUDB6amNkUldHdC96NGViK3YxSXV0SnhJWnRvNGxEdlNF?=
 =?utf-8?B?LzlFM01NZHl4T0crN2lnYi9NTG1EL0phTGROOUprejMwQm0xckJUTlEzVHJl?=
 =?utf-8?B?dHNuMXBzRG9uaHJzNDVwZDBkRzBGN01lS04yeXdESzZMcDFGdm83bU5acHBG?=
 =?utf-8?B?QmFIL29lckZxSkpCL0MzdHlWWExMa0t5MnNKTUMvTDhkVHpHNVdJL2htSUFs?=
 =?utf-8?B?bVQ3RzFHODlJc0tZYTJSbzlVTExxVy8yaFFSMUd1UmpSYTE2VjlSakd1amtG?=
 =?utf-8?B?MzdOUVVKaGo0UE1TQ3JXYzZOaFJUY0dBbmlIbkRHVUhLbVNUTVM3Yml3Mlda?=
 =?utf-8?B?M1BFMUVKUlVWM3RwQUdYNW5YVk5ZVWFOMUFQZ3JZM3o2OHNpMVV6SjA4a1NP?=
 =?utf-8?B?N3RvNERCNFFzRWN5MFFHQ0dZTytwVllia01wUUF3UHhBNWVHR0ZUS1J1ZEFC?=
 =?utf-8?B?M3UwUFZBQ3lpKytTN2pUalkwUm1nbVExeC9ZaUZiUENXRERGaUNJUzUrZ3pL?=
 =?utf-8?B?d1ZkdG52cytpRHRkZzJPL0RTOWVud2d6c2xDNWROTVpuNWRHMGMwckpiaE5S?=
 =?utf-8?B?dGdWZjVuZ0ltV1lTaVplZzVKdFBwNVhsa0R6Nzl3dzQxNDBnb2JYSmw3ZjhL?=
 =?utf-8?Q?ENAdDyKUHY9SrDmFqTCVs73A8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0ada32-8c7a-44b0-ce0c-08daa200205a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:51:05.4586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHyX0ytwDWk84vuu7jV52GCZ4BgrDZvCqnsomZ5/FwaW+yTBBKg4/YqmOHklLc8/zCJ9754wdmyEUpKpE+rHcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7209

With the "inversion" of VCPUOP handling, processing arch-specific ones
first, the forwarding of this sub-op from the (common) compat handler to
(common) non-compat one did no longer have the intended effect. It now
needs forwarding between the arch-specific handlers.

Fixes: 8a96c0ea7999 ("xen: move do_vcpu_op() to arch specific code")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -58,6 +58,7 @@ compat_vcpu_op(int cmd, unsigned int vcp
         break;
     }
 
+    case VCPUOP_send_nmi:
     case VCPUOP_get_physid:
         rc = do_vcpu_op(cmd, vcpuid, arg);
         break;
--- a/xen/common/compat/domain.c
+++ b/xen/common/compat/domain.c
@@ -99,7 +99,6 @@ int compat_common_vcpu_op(int cmd, struc
     case VCPUOP_stop_periodic_timer:
     case VCPUOP_stop_singleshot_timer:
     case VCPUOP_register_vcpu_info:
-    case VCPUOP_send_nmi:
         rc = common_vcpu_op(cmd, v, arg);
         break;
 


