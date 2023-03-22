Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54B6C466E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513211.793895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peun3-0004wq-V3; Wed, 22 Mar 2023 09:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513211.793895; Wed, 22 Mar 2023 09:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peun3-0004uu-Rq; Wed, 22 Mar 2023 09:29:53 +0000
Received: by outflank-mailman (input) for mailman id 513211;
 Wed, 22 Mar 2023 09:29:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peun3-0004un-0O
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:29:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1903eb87-c894-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 10:29:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9360.eurprd04.prod.outlook.com (2603:10a6:20b:4da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:29:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:29:50 +0000
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
X-Inumbo-ID: 1903eb87-c894-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Np8B34yAAi+uCh28eL8aUv+zYOLC4DV203h6mIYXSuXbZT3b+5sAs3Cndcf6tpvKH5SKZAtx45+ec5vUxeOKNh/XQMB/EBEo+zVg0brQBsHVgsz0CJxboqYoWVifCzEJ2i+f5Zqseizs5fzcWjVMY4rv3szybc+w0TJFlb6SGU33zYT7yfiah4KE6b8h/ZOGDV10ALNJkCEiL+IBYHjE19WNUpFxWtZiH4htfEYScZB8yQhQDtZtQp6zBC4OQi3vOAPdLB9sMLBvfExt0fTbnOfKnusb7tT09+ACHTcUSbKy+T0elYO7jri7PeD9/ea1e5UGRBpn3dZYQKaPwpxxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4LWW46rODj4dfG2ddfXP6R321VQnvo+mPhbiTw0dTo=;
 b=G9G47C2NYomvuPvJDEPCAPLwugsj4ZMw/pizXaondFXntH5F7/S/RKopRulVtctgW3V2gUndlulu81fJBAn6pBQ6nj4qw9vowaabhBNM3MMG5XlCyiyCut9pc0HIRVD1/YC57eT5DxoE3OiPavRavrAXaOofcfS5WY7xscM0caPjPFlvMfdfet2jCcFu2r+HFhHm2l34C9reFv/FFwg6uQL6Ymgoec26nrFkifV/T/XUknrphPB8DmFqdLINa5iIZ5aDLPDiafx7srJEiTmbrNud9xIn1QfHJHgGdK9/i7sufatVFQlQ9HXW0bJ4yxqQP4QbA2TelM7C9m5spRTSjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4LWW46rODj4dfG2ddfXP6R321VQnvo+mPhbiTw0dTo=;
 b=3j+kGm2VNPGDMaQ8AbqtqaIyj+T5wR0mS8V/P5EeyuuiQwzl5NySwHOeXAo1+cF2ieRWZzvFS2rByu+MdMNggJFgkxpIhdNUUlw/PzU7aMUzc8ucjoRyq3b4VgmKzeWOqjafOFhySI5ESbYsE6bvuUyan+h/V7nuhIMzQ+O+DgDhfpM2t23P9pM+SCBRSkbsrx9nmrlWo6nC4HyBql5kjSx9FwZxSnj4mqN2cbBo5uZ2f3JohRdmY7Xj9PgV8uzjnlBjnods6RhSNYHl/vucvCFLfcQPPy9WR5tWt5Ghon8GGklvx0sOhpQ2nTOZvV+YoL6y40gXuYfRVVzjp+e0xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <290c9058-9907-4c6d-3fe8-987868a3a843@suse.com>
Date: Wed, 22 Mar 2023 10:29:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 01/16] x86/shadow: fix and improve
 sh_page_has_multiple_shadows()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9360:EE_
X-MS-Office365-Filtering-Correlation-Id: f24f22e1-3492-4fba-f9ce-08db2ab7fc63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RezDjNVPMA9VCbN4A4doSODlSAbH5K/g09ZJbQ4Mn4Ih+vzdLpOjJ1vFmrhzGFfdKp90gMYEer19G+OCROaHx6emmOqFqoNt0sLCffq8UXDLAu+QNsckcSIubQD2yvKfHkvkJX3rxJl8Pk5kkkhZvKcgfoAIhnsdc+NXU8NCDcS5RnlEwrXw6zHZqAl+aYoENELHahMiTzEJHwBF54u2ZdYpI3uJQ09Rmd47p1W7cTAUPJOeuWeBpPv3TX4tFCOc2/jPHlbbSoDzLNgEAVH5Lpcdu24MyoNiZQ4tyNjX+yYQWbK2G3TkNng084ZYZ+l0gnHfMVLFWOeOr3bUlCf5KdiF+HVh1MBJG0NdkmkFOX+nBt79wzattCoCEkU+wyZxv/B2qlDqM04BNcyOSRndBd9oWGM4kANd7isgdolfFJ443NACUJ45DviRAP0C8W+vG6oGlf3mRufZTwQsV+gOeKniX3nee257LJE9Omx7A5jPDUATlx3Msg3WIE2L5D31pQa7ky3+0A8s20DuVtn7xoUyV11MCdeuJq5TzpRDzrU58GjdI8CcCgs9//hFRer53/7QkOPQxRF5mVieEU0Jq1+dc0SNHK9ya2/PL9AxeHbJGtG1BL1+gqDTe8UKs6rfieftPk//RoYQq4A9ml6yh9UzhZFfqU8V2p/kI8g3nT7sdobJ2jmtXd/TKqIRdGCtP8TnjUOnj7KLpzUAy5u5pIh9XYOp4uOTwl46kHZMKIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199018)(5660300002)(41300700001)(8936002)(4326008)(186003)(36756003)(31696002)(86362001)(38100700002)(2906002)(6916009)(6506007)(6486002)(6512007)(478600001)(2616005)(26005)(31686004)(66946007)(316002)(54906003)(66476007)(66556008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmtTVlJzbkN4d3lvQzZvUkFWV3hYd1pUbk9UbzRqQ1NRUFJUbFNrTG14clZT?=
 =?utf-8?B?YWhOMDVTU0xvNlpwd0VES3Vna0ZiNnhleXJGQjZjbWQ2ZVVGQjNWcU1WbzJj?=
 =?utf-8?B?WUgwanJmcFFCM2JJWG5nZ1lsbmNYVHM4bCsyNzNwcEQ4TDhmUUVEcFRHNWZw?=
 =?utf-8?B?SVVWamNzUHJXL3VvSnZhTzlEd3ZkZlBMaVNRSjdRTFpob2Zjd1diVklZYjVz?=
 =?utf-8?B?bXZEcG5oWjBNSEJGbHRyY1VJM3FramFoa0o2TDFpMVNoY1FsMHhRQnVaa2x5?=
 =?utf-8?B?eThBTTFDMWMvR2txNStmcWR0emw2c1ZBbHBSZ0ljODlLNHdNTVl0S3N4cEFQ?=
 =?utf-8?B?TEpoR1V3Tk1MWXlHSU1hU2I2VnpOb1ZBcVBPVkhwakQrWXNwZklFRjEyQjZq?=
 =?utf-8?B?czhISTE5bncwZm4zOHZlSDgyNS8zMy9FM1c1czA1WDhpaUtHRXBSeVhIakRI?=
 =?utf-8?B?Sy9tTVBSK2YyVzRDOVJkRnp2ZFAxaEJLeWlINXhYbDI0MHhaaFJNeUdGZUE2?=
 =?utf-8?B?bi91SnFYVlQvMDJsVTdEN2piUWo3Z21mMzgvL1d3aG5DaTdrLzRKYWphclh6?=
 =?utf-8?B?WFpKeFM0TE9DVFoyQ0xGbmhqTGdVSkxmS0ZpMmtsdlJ2ekVDd2FIQ0tVaXFN?=
 =?utf-8?B?Qk1vaTFpT29wdmk2bXpVWmJKUVhLeHBHQ2dOSnozZ3M5dmNRQk14cE5IRkJB?=
 =?utf-8?B?VWw1dUFLWG1TQ1Ava25WblJ6K0ZmenVucWRPYXJlcUVPS0kyY2F4Qk1QL1FR?=
 =?utf-8?B?dWVJcy9BRzJSMGtTVDJYNlBVdmg0MktCeWYrZDVVaXZUeFo0TXFhVFFnZGl2?=
 =?utf-8?B?NUN3azQreWN4cVZuK0dWMGJUWThLdlBpWlhMYUI5OVp0ZzZrUjdUTEpGWXBt?=
 =?utf-8?B?MUJHYUZNSCsvTHovVDNnbmRTNlJEaHVlZlR2SUpjS09uWXlWUHQ3YXlxd1dl?=
 =?utf-8?B?dkVXWDVIZURIYjJBaGRSbUVuTE5QcVpsQXRCdWN1WVBXS2x6ZExlMWJLUEQw?=
 =?utf-8?B?NW9VaWNVSjhlYVpkRnZ4R252ZEF5Um9Ed2diT0ptdjIvVVdrTGQwZStRbGtk?=
 =?utf-8?B?UmI5Tk5jZ0RxNEI4SWtnUFFFUUFiZVdrY2RNS2h1VDNOblpvK0toM3NoaklL?=
 =?utf-8?B?elhxVkpaQVUrTWowNGp6V3g0V053MFFidEFtQ3BuSStaRTZPbEdEMzJOL2ND?=
 =?utf-8?B?cGJoSG9pSFpaUmo4NkFyQUZ1ZHhKV0ZCYWFHbnFablpJRHF1KzhDV0ZpT05u?=
 =?utf-8?B?WU1hZ1Zmb3NsaEZCV2tha1o5aGUvQkVIUEI5MjBxMUR3TzNXY1NyNk82NFlH?=
 =?utf-8?B?S2VVeHBIUXh3YnR3WFNiUHJ2cUdCZ1pBMjQxbzdpbHRLUHIvZEo5czBkczVs?=
 =?utf-8?B?b2NiWXJodjBSRjhwYVZuKzBMMyt3N1cvajRqSTJIVnYzMmhsb1d2akw5YzRy?=
 =?utf-8?B?c2xxaVdBK2p5UFJTYzVibURCd0FXY0dRTUtQc3dZYVN5TDFod3k4NjFYbUt5?=
 =?utf-8?B?OERzYU50T0dPazhoOEhONjFzZDdxMGNGaGlWSFFOeUxKZThyV2dMVnVUUVhh?=
 =?utf-8?B?NnBpb3RCcHd5YVlIZWJLUisvOVlib2lTRk54UXk0emd2RVJ2SHBydkIzOGp0?=
 =?utf-8?B?WjVVZGU4Vk5MQnNnV3pqWFRJbEJIdmZzbnhBNDZpK29hVUxsdzZiemY1cWVT?=
 =?utf-8?B?cEpKd3hMUGxYVlMwcStVOWR1NUliYUtCQmtneDU4d0F2UTVDTThlVklHU3oy?=
 =?utf-8?B?anFnRmJSOEtGUGJKK2dvVXNjOUtXSUlvTjZpbE9xYk5rV0lkbG1xOE9NRng4?=
 =?utf-8?B?QXlxOUFJZ0RuNHN3VGdNZWs0aVlHNGVPUG5iVU1ZUDNTWTJyeWVXSXNWR0pz?=
 =?utf-8?B?Qkt4a0d6dVBnWGoxRmNJdVl6aytFaXpYQ2pTZkl0amtjS1VWN0ZzdzB4RUxa?=
 =?utf-8?B?M2ZYdFJOTHpsazA4UnpDVHgvV1hJWEhKWDBxelpKRFlWYTUvcXFUdyt1WjRQ?=
 =?utf-8?B?UitYbEhQalBpK1h5YzZJMDF0Q1hJMHdzeWRaUFBFLzNWY3F1cTlHdStSK0ZX?=
 =?utf-8?B?WUFkSG4xSFowQnFmemZRL0l0VmxaYTJvd1BqbGl0NmVtTUpCOENSQ00zcXow?=
 =?utf-8?Q?h+Y/DtXU8H0ch/sv8bmK2L8Sk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f24f22e1-3492-4fba-f9ce-08db2ab7fc63
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:29:50.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lj9jBZMbTGZlKrCTaKMQLUPOFyEx3NarKYLBkGXrlvMcB/mPU0aQEVsSSf07b5kYllmatL9jaobK/quoDbQ6rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9360

While no caller currently invokes the function without first making sure
there is at least one shadow [1], we'd better eliminate UB here:
find_first_set_bit() requires input to be non-zero to return a well-
defined result.

Further, using find_first_set_bit() isn't very efficient in the first
place for the intended purpose.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] The function has exactly two uses, and both are from OOS code, which
    is HVM-only. For HVM (but not for PV) sh_mfn_is_a_page_table(),
    guarding the call to sh_unsync(), guarantees at least one shadow.
    Hence even if sh_page_has_multiple_shadows() returned a bogus value
    when invoked for a PV domain, the subsequent is_hvm_vcpu() and
    oos_active checks (the former being redundant with the latter) will
    compensate. (Arguably that oos_active check should come first, for
    both clarity and efficiency reasons.)
---
Considering present uses, ASSERT(shadows) might be an option as well,
instead of making the null check part of the return value expression.

--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -332,7 +332,7 @@ static inline int sh_page_has_multiple_s
         return 0;
     shadows = pg->shadow_flags & SHF_page_type_mask;
     /* More than one type bit set in shadow-flags? */
-    return ( (shadows & ~(1UL << find_first_set_bit(shadows))) != 0 );
+    return shadows && (shadows & (shadows - 1));
 }
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)


