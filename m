Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2357920CE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 09:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595412.928970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQlv-0007Rf-0A; Tue, 05 Sep 2023 07:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595412.928970; Tue, 05 Sep 2023 07:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQlu-0007On-Sa; Tue, 05 Sep 2023 07:46:50 +0000
Received: by outflank-mailman (input) for mailman id 595412;
 Tue, 05 Sep 2023 07:46:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdQlt-0007OK-DB
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 07:46:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5db481a6-4bc0-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 09:46:47 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9317.eurprd04.prod.outlook.com (2603:10a6:102:2a4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 07:46:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 07:46:44 +0000
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
X-Inumbo-ID: 5db481a6-4bc0-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Za0oOFaL2eWkz7nP+lOjH62gOPUyiDot1o8vtYwsa7TRaPNEGvryjNZAvC3/0AhlMxYqqbbdoXW6NKIz8C0tgvwDVEMjbjKZNYDyUFzNOOoriojuygfrXRKfzUD2Th8u3hdkAVS8EfmzbZZGZRuel2KGizSKAtY+OXrreS4UmoUSoFwsPlFUyM0S1R9p75Wj4BctVGhrgixqKABxuxdEk1RKV+5r52haDxy+fvLe9ZWbP9gZ088fIDpZ5ep2wDNWXLb2mS9QmNpY9pHwLOT4AD+VCcXVdtR8NA1s//+hPGoPNdNWwZ/KUQOzH7VUj2WILd8zd50ldBA+xx9tFAoLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arVjiqzRKuqF+U74p69xaqT0ApN91zlmkQkNxIWjppo=;
 b=X1ron+kZoN4zyyaJytoT+GiXPBBLewVO73r7bLGuRJAPJbx9+M/13R0LMqpTSI/ZxHhI0WXqajs+eHmaztTmJLbEqbPmA7puKyIaDNhYvx2drQyvUEE/6kFx//d+QDHIyBX4r5TVP67Z5U1qDxBu/EN9ERGAaDPe9CCt5QazhzMTBoccd8eU0PbJ68GrswR/5eIcFU2K9NiLCOoJ1amcyVg1R8nWRdrFPlK+Y5wnlVVud9w26yXWJ8n1uxI+n6z1TLrLbmnA7U39ESD9o35wVP8NCT/PYciocpxcsYyeTOg07giztxV3yNtAASPqfhZ8f5QbRiIBKxv/8pIVtW1/yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arVjiqzRKuqF+U74p69xaqT0ApN91zlmkQkNxIWjppo=;
 b=aBlTy9ChM7LwkkktbFDqCDyz7/pyzkTb+I3cwFiBKFmM6T8lGiKp6z4x+bxCiGft6zimjpao7zTsMcgGpboDrSviZdSOB0h33NsWLLJ8PzyUZtCTnZSGVoN/cgzVc2riK03nGZQkHEwMNBMo9NDjmwfBHX59lpdssfcCaAR7HH61DeCcJVI7RF4pmuarXT6a3ev95/Y+e2OwKbP+affN4pJChefuyLc617DW3mm3+6Qgs3mg6azzlR/HJad1r41qR8rvG3CVOhgYosSFIBVV6SYcFgqGS2CkZ1Ivg2JHSdomxilWiOe+03M54gWxULoVDBaD9EcKe67Pc2h/PzP/Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
Date: Tue, 5 Sep 2023 09:46:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9317:EE_
X-MS-Office365-Filtering-Correlation-Id: e62f9755-6695-4202-9fab-08dbade43ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gquMebQXUi+0EYUJ12Ekwm1gCyyKpxPsIKUGuaaHIBYqkixiNDSt768PKHNkyxiCPytGTitRRoN5z5d2g+i+mY7i1m+fyncqfzfLNTo7uEYxJnXo6ZBOMKl9GcNG7+qalM4BEQwLklQKSufQ+IvcJW36+tJeU1qsfoE364KEDk0p7N5NLFvBFgIpfbVxFIXCGwyRg+dE4nx8aLhZr+VkLzZwm2/M6EOkyqb5hzZUtL6YOTD/uTLzOcjfObKX5CzpdGiXnUIE+7jEi3M0mGLfgyZgElSc0tD63Jwx85DCjVVv1+vt3wX6zUDLTbwW0xxvj8Yau3KK3MYyrX0NxwKSrXA/bUi/Z64YrrnYROdAX2YjQYwqjsWA5lp+qZM4U6Am+lCCt8OKlXXkWy3uDwfhtHozcR2rSigXBCddmdqSYVeqPqYxMYDQJQFGO3zVuxgfXSuV/a+lWmaqHnFI8YL4eOnYaoJP0GbtSJAL+e4OGEq6fIbzsD+zEbsOD6A9joxrS7kh54ToyKIsCiGRqupV0NhEDeyShW+ahmpGVDatcs9HJQGWdqhvrNvfMJBrIhi0BGMKqMLQRqTLYW/K7UIXZR9pAK/SF2JJs5y8HgQyOP+dHK6G0p5OnmNW1tubTuY2il/SQFKHPVEAkfGtbIH2PA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199024)(1800799009)(186009)(53546011)(6486002)(6506007)(41300700001)(6512007)(66556008)(66476007)(66946007)(6666004)(316002)(54906003)(6916009)(26005)(2616005)(5660300002)(86362001)(31696002)(478600001)(8936002)(8676002)(4326008)(31686004)(36756003)(83380400001)(7416002)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajRPOHRQOHRhdnRsNWxXTVdldlN6VjBJbTBNSk1nY3lvUjhZNkw4eVM4Sjdw?=
 =?utf-8?B?TkJXY3h2Mlc5OUVDQjFwT2l3ZGpkL2JkRmtYNlkrYnFVbG55Qnh1RFRRenJL?=
 =?utf-8?B?TkZid3MyOUNNOVBBTFZrZ2dOTHh5a2pVSlpEZUtqRnRTSzc1YkRsYWZHemJV?=
 =?utf-8?B?dCtDYkRJVWpFQ2xhSWhzNTBHUlhvYVc2cnFDQzFQa25BSW44bkUxSHVrdWFy?=
 =?utf-8?B?dHFLTkhRcjdnWlNRMXhRT1BFTkdidXQ4M2VxemgxcDA5U3BsbjZ4WU9tcnBP?=
 =?utf-8?B?VUJWLzlpM3Jia2VXQldydzRSdytHYTJVY2FuZ2F0ZnlvbUhkdjhwQ24vZzNv?=
 =?utf-8?B?eDlvbDlHOEJZWFBjQW1WcU9CZElFMVZIc3A3alo5VjZoSUVHcE9zVzBEQ3Zo?=
 =?utf-8?B?b3BPRkV5UjJMVjNYVXZ0ZDhZUDhob3JDM1YyOElITWJpVkZjRSs2RUR5ZStK?=
 =?utf-8?B?V0xkWG10OEpJT3JET2kvRjlacGR0dEN1YmdCYTRHZGVVdzBDK1grNmVKWVdt?=
 =?utf-8?B?cW94bjlNU1prdnJFQzYwU1ZDYURSbVlibTdjWlhBR2N6c0ljaStqZmwyN2la?=
 =?utf-8?B?ZTUyRnQ5SEV2UzVUTTRFN2xaN0dlSk1WWGprQnREYkNESDgySWdwZG9yTFNX?=
 =?utf-8?B?TGJKM0piaTIrZXNpNjVKbnpSdnBudi90SjlhWmluOGRmMHhxM29DSUNRZmI1?=
 =?utf-8?B?TkNmK1hQb3VwY3BQYWxXcUQyZWVvSjhiN2VJOVVOVHpqY0htbFBMOXo1OEZJ?=
 =?utf-8?B?ekhubjlsLzVaam1XczVCS3pjcThFcnhoU1F3U1NPQUtrRVg4aWdDbVV6cGhx?=
 =?utf-8?B?QXg0ZElxbTcrcUd6endQUDBYelFCTHhIL20zN05BcUN2UDFTeW1TMVIvd0FX?=
 =?utf-8?B?V3hTSnRaa1JQc0h0enVqbXFDeEFrc3BHbkVvU1VDYTF4MnN1amszaTIweTJ3?=
 =?utf-8?B?bndYc1dvU1plQWFhbFp5aDFQV0c5VDhqUTVZVHl3eVkwMm9EUmt4dllNQWZr?=
 =?utf-8?B?M1BJM3Qwck4zTEcwT3hjc0VzWEhJMkRGMGhTNk1Ud0tCRGlUNGdkVHpVVEFI?=
 =?utf-8?B?YXZDdHNEM253ZnVONHd2U0NHM083WUFDanVBdzhsYnpweDByTTN0YTFYNmR0?=
 =?utf-8?B?U0hTOGJ2STBzd3k3Tmd4NWVKVDQyYWRGSmxnVU1Demp1MEk4a2ZHU1dUSzdy?=
 =?utf-8?B?dU9aV0k4OVJCYWIwVjJnVjZtbnNneHB3Qlk0blB0NS9tN1grZE9GVVlLdHpJ?=
 =?utf-8?B?Sk40N0pUQkR5anBKRXZ3RmRSZSt4M2ZmckpIWlZzT21OWGdoQjZMaHFqODF0?=
 =?utf-8?B?RGN0RDRrTkVzejRhR21meVVwaVF5SE9qdEZPbEo4RTZEb0ZUUmJlcXg3ZUlM?=
 =?utf-8?B?eFlEWXFvdFhVaGl1OUxlbGRKWkRYMVNoQVZFZkhZK0lHL1U5UmcySzR6Y1ZX?=
 =?utf-8?B?MlcwVEJWV3hTbkVoQ1VFbnQyZUtnSDk1TWtxaUViQTJ3R001YXR0LzN4amZn?=
 =?utf-8?B?a1JYOGdLZUZWcEgwNnd3L0tvcTQwNS94YzAzR2h6YS9OOUkzSDlIbmRET3hx?=
 =?utf-8?B?THJubDZzMmtDZ216VEVMSjRiSS9Vc0V4R1FaR1owTmUyR0hEeUtXVVRGSFAz?=
 =?utf-8?B?czBKRCtaQmFubWlPUXFzS05xcW8rdXFFNXRGd0xTRjlPUFpqRzRnL0FCTi9m?=
 =?utf-8?B?ejZSTDZvWStOek1DUzN1YXZsR0dYTzkyK0J1dmhVMDBZdWtJaWJNbE5kSGdm?=
 =?utf-8?B?amx6bGR4aFRMSlBYV1FIUzdEYi9RSzFvdHY2WVNFb2V6bmJ4SUFsbnBFblpj?=
 =?utf-8?B?MWczMnZ2MjJyMVgwK2VONGVMd3FsM28vL0tJR0g1S2FHNmFVYTZ3V2QxNU15?=
 =?utf-8?B?TENXbWNCaDFaQWdTWHk3cUwrTDVOandVOUo3ZkM3UldhbWFkUXhXNkpURFVK?=
 =?utf-8?B?NjVUWmZka3ltRmNteUNhUWFVTDFjb2Fka0dYdXpkSnh4MkhhWThPZ3RRV1hs?=
 =?utf-8?B?RnBTdDZFNzRWZlNLaFUzY0M1MjVubmVzY0FUWGJxRHV1eFZVK3VwRkJReDA5?=
 =?utf-8?B?akZZaXZiV3J6NndJNTZ0YXhMeFhUY1BKWm1BcStaMUVTL0YyVzhhVXJsbExs?=
 =?utf-8?Q?McVvl1t1CjONu3qcJWXefkyv2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62f9755-6695-4202-9fab-08dbade43ff1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 07:46:44.1482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoIZdTLwq2Pdb2OMaSW7sQdkthS90+iqBl0olraOuoXpYMGJ4etBk3omRFFzjPs/VI6HjRxBazAifBztt9bBEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9317

On 05.09.2023 09:31, Nicola Vetrini wrote:
> Given its use in the declaration
> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
> 'bits' has essential type 'enum iommu_feature', which is not
> allowed by the Rule as an operand to the addition operator.
> Given that its value can be represented by a signed integer,
> the explicit cast resolves the violation.

Wait - why would this lead to a change to BITS_TO_LONGS()? And if that
was to be changed, why plain int? I don't think negative input makes
sense there, and in principle I'd expect values beyond 4 billion to
also be permissible (even if likely no such use will ever appear in a
DECLARE_BITMAP(), but elsewhere it may make sense). Even going to
"unsigned long" may be too limiting ...

> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -23,7 +23,7 @@ typedef signed long ssize_t;
>  typedef __PTRDIFF_TYPE__ ptrdiff_t;
>  
>  #define BITS_TO_LONGS(bits) \
> -    (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
> +    (((int)(bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
>  #define DECLARE_BITMAP(name,bits) \
>      unsigned long name[BITS_TO_LONGS(bits)]
>  

Furthermore, as always - if this was to be touched, please take care
of style violations (numerous missing blanks) at this occasion.

Jan

