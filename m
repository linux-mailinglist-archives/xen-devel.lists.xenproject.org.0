Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A658D6A40B3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:34:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502411.774184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWblU-0002Fo-QJ; Mon, 27 Feb 2023 11:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502411.774184; Mon, 27 Feb 2023 11:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWblU-0002Cp-N7; Mon, 27 Feb 2023 11:33:56 +0000
Received: by outflank-mailman (input) for mailman id 502411;
 Mon, 27 Feb 2023 11:33:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWblT-0002Cj-0H
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:33:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9af6d54b-b692-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 12:33:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8848.eurprd04.prod.outlook.com (2603:10a6:102:20f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 11:33:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 11:33:47 +0000
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
X-Inumbo-ID: 9af6d54b-b692-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFivdKEJZ5AFlxfR8F6almcCFbw91Zxhd3iDeyFVKUlDdfDlfDWalutR/GLAJZeqgFd7xMKl4FD8IdnrRrez5rwMnuvRufKmGGTr//W9UmaSsArkRyXUQzWxtkXhxESWEEyDoRtJd+ub3C4StGCFaZ57nQHc/5dce//li+F0BJytNH1JLduCc+vb2FaiqemCSZSzgWAQyOwYeC2GTynLByBSdyA9S7UWQy8j1gniXDOPAOZrH7NsaGfsuCeHcNV5N/CC77QbG4gEQYVn0M0adKvbYdIvfU47X7FfAYezg+23npZtCwOpo46hpN6T6+/O9FgiXjG6jhHtOXE9eRf5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+bNr4gg661ozvSa8Wp8fouuL/YidAmxpC494vqn6nI=;
 b=TvJ/GeEp14RlneJmeyDAyuaZhzUwIE187+Iz0MCRqLyiBQMD0lwnl/tDP1Mbe23y7+/mPafF1jQFEO4hUUC2xv24R2Sh0Vs4D6+5Oo2j8B9+SSyycUuCPbXDK3h+hjNUNzZ0/0q6qoT9k/7q0UYLXW7ls3vFgrrdtcoo6etyjgWFQ43TIFmnmUv12cIttZCXcwZ6VS0brZ9v+mwe5h4Bycs/dlnptw6R3AeTSYFUITzApNagQ8/9IRbyawpGwfePCr5kE+AzphVVRz1zooMtjGl9mWn7roo88Mz1fvFzzR2rvGlcIDJx24citNPC00VhAYoZ5N4ZarGVZ3B3AFSeIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+bNr4gg661ozvSa8Wp8fouuL/YidAmxpC494vqn6nI=;
 b=EOGQTcjAGmh0VvY1oW2n+TWPyDOVGXYyqAmrcLpvm3H5TiCz97wngwfcjiBNaNAFGp6jjkQwi0iPKccnImE3xa1y1hMd6pHKDB0Pd9NbrvhJa5Ga3Dy4U/zU+mwinDAZKQAsWOdKMLdBGk6J1HhQuox8KSV+mrLrZpi3JcqErHpgkdvsmB4PSE0VnUXHCfpwVAzMdox2/jSM5ekXraE0Tmo4Zu81TdaEbCVjmwCffu6ojGEj7VzSHGA4jhoPyeNXLs7jJIQ4HmfAk1+Kwcfu5CrlEs7ymwkIZdTGlH4Rkl9u5b8MtEjV9qemb4jkn2kspEtP6+6G9dSgY8Kko+9oTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5e623eaa-ce32-e3ac-2089-68bf8125b5db@suse.com>
Date: Mon, 27 Feb 2023 12:33:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
 <8745c599-bf9f-1eec-739f-3d42920dc546@gmail.com>
 <989903f7-4ea0-a1d8-923f-efb84c70ba21@citrix.com>
 <aa326f9a-94ca-75b9-6d4a-ab6fdf992c29@suse.com>
 <2fec6c39-f73c-719b-7bc9-02e1ec3f195b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2fec6c39-f73c-719b-7bc9-02e1ec3f195b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: abe70091-2a3a-446c-3846-08db18b67dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y/tL+WfHZ26acMI2sUK6scazHfXXg/9Cqqetg4eD4XqjUi/L00wquMJn3qFvRQ5NulEd6PZaaIgCKEO5Qid8b+skdFGcuGlSsyNT3Ofls6Xcqft6cZRt5WnpZa6KiG20HeuTYg2utQRRSVDd7aVzp4oMdaXqK24kFcfE7aplfZ5quf8XTT1z8AmBXntZGlkr1MG+lO4mz1ZAW5gCfaOEJPBzz5JvrR296/4WkCO5S3NcLre4VD2I/ZocSUvg279v/vdxhJG9bCNOy35JM12GJ1xD66luXBgon3x2ntWR+DUIk7gv95Zul3jjXATOP3iCEcl0cS/oxmque1W5EK74ZusOpilhj2fgmFA7dwg9Zy8A3PZXWHZdyaQuMvje0oG/LjE/X2WLMYQreMVfoCvR68QX6IXLIQELWD0zGLpIPs+3fFt1dU1ZRl32+ZJLDw9GMVrr6Fe+4rwyplSwj52EkxirVtNq+4y5AQHTunkpKQv92U8xNXV6vPwao8BcGDdhEJSPiuN03c3fBMINWnCmjJKaivAE2TnfFUeF+dvOjmFhXQGYU9sPCXbBVJcBfl59jWaWFNNGQBtqFHDoTYXYWhABJYpWmLtPW/0jM16eX7HI+NF/v7iNPGyNteOtwlbEjDLn/UsjidEq8fLHJCdFbsucrP2OMHZxXudnY0B2SYVY2ntuM2V3KQMwdMGdRULIHFRIu9yWcFMc1xRXsBXxQTze/IRM9YtGtPt+tYkPYPA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199018)(5660300002)(36756003)(86362001)(31696002)(8936002)(478600001)(2616005)(6486002)(186003)(8676002)(53546011)(6506007)(6512007)(66946007)(26005)(66476007)(38100700002)(66556008)(41300700001)(4326008)(6916009)(54906003)(316002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVBreU1obzJsM0NzOTRLdFFqWHpZaldzL3JGdnZMNk12QTNiVUxOeTNONFRL?=
 =?utf-8?B?TVN0UVRDZkRVbjE2aDhNMTNVelJmTWZpNk1ZUEZMaW1zN2hpUWd3Y1phME82?=
 =?utf-8?B?QkNnb21IUzlzY3JuQUhNdkFnQVBvUEFML2drenJia2NjU09XR2xoU2tiblRU?=
 =?utf-8?B?OVVHd3ZyN1lUT054Nk9uNUpOUDhnLzhLVytSNVN1U1A2VmZ4UkVyS2pMampE?=
 =?utf-8?B?Z1NHOEFCdWVseUFzNGI1SmRHTjNqT0dHY3l6Smhuc2JqNVlBanBFT2R5WXR3?=
 =?utf-8?B?Q0FoU2NUaUlNdHdqcWxsWmc4emtzalZCTWc5emUvWVYyc3NWa2ZXdkszV3A0?=
 =?utf-8?B?d01SQ3h2SnBsK2JmbDFaNjg2ZDRjR1ROQkppMFRFT0puYnlnVmF5bnJSL2hH?=
 =?utf-8?B?bGpRaUd2YzBtVEF5c2U3L0plWFN6eVhCekx4cVJ1MElubzh1TFJvTlNTOERm?=
 =?utf-8?B?QUhDQitTdElSVGozekVuSzFWSjN5VVc3NitqdzN5clBEMjY4NXFSZituWGov?=
 =?utf-8?B?TkFSNjJLT2lEOG9FUGdCRzN0WjAvbkJPUzFySFVTY1k5SVIxa1pqU3dFUEd4?=
 =?utf-8?B?VXVlZTN4alQ5R3VqOFpaRUxHYTBKQ3hlT3JHMFJGd2EzSGozeUZaRUJOOC9i?=
 =?utf-8?B?MmlGRm1CM3pyVGU0cXJyZGhWSEFDTXkvL0FCbUdvSExDNEJFNklPdFJWVnZV?=
 =?utf-8?B?Q0FVSzh5b3VJRXRJUWl5clBCNHlTMlZrTElWblB4M0F3RDVFNTMvRlRHS0Jv?=
 =?utf-8?B?MWhKcThpM29CK3M0L1FUR3RIeEZNbU91NU8zNldKOWFURU1qVkdYZzB2Wm9k?=
 =?utf-8?B?THFyU3ZwZElNRHB0WUViOEFlalFoa1FKUUpNMTJHbS80TVovcW9scEEwbm8z?=
 =?utf-8?B?NFpoaitNYzRHQWF1N1IyTGN2Uml5MDFtNlVZK3lVMlJUMUxKYW02M2pkbkFD?=
 =?utf-8?B?MHBJUDhDNDVpTjRvUFpzeEpZVExmMm9ySEZiREkzZThvUHRGQXkzZU8vTVZw?=
 =?utf-8?B?WmhYU3JTS2xWbFUyblYwcnMxbjAxeFpjLzNJdFFQRTlrZkpuWDAxODQ4bXlJ?=
 =?utf-8?B?OEhYKzlYRytia21MVHpQcTlnR2l2SlhuMFJDOXRCYVZxczhCRnV2UGNDMVdL?=
 =?utf-8?B?cjMwQTNIaHRPdjgyQ3dpbU1jRU1YcWpGVE0vakxnbDZ2OTZSeUg2WXBDR3RO?=
 =?utf-8?B?bGc4ZE1KSWNMK1IxNFk3Uml4SFNxTG52WGIzaml1dnVMZ3NwUGNvZ0dRd1lC?=
 =?utf-8?B?ZmRMWjVDV1lMNGxVdFR1dGFtQTN1NUhETExVMXRHeE5KT1pvMWJkLzBCcEU0?=
 =?utf-8?B?bi8yMmR0YmJwQ1pxeWlCS1N2bXFVb09waVVWUU5MK3FOMFdUUTNHcE5jT0Y4?=
 =?utf-8?B?SlF0dVFYZTZsK0tweU5oL29ha1R5ZGRDS1pyT2xUOVJKSUVwdGIyMUJWbUlo?=
 =?utf-8?B?SzhxUXhyelJKVkIxeVZVVlVtM2JocXo2d0dYK3VldG1sRTBBaWo1dmQwdDR6?=
 =?utf-8?B?NGp0WmhlZDJPRW5RSFhsVmRwZDh6bTlaaEFjZmtab29HUTErYmQ3QSswYW9m?=
 =?utf-8?B?akNpb0VacUpTQ05rOW9pbldyOHhXamllU1JwTk5maXVlOXRManYrZlR2T3lv?=
 =?utf-8?B?Mko3YUhLL3pHdGtVeUFuMzdQeENySzJwYzExU1VTVVl1NXJsU2tZZVovZjZ4?=
 =?utf-8?B?UHdqZXZQVkF0NWw2SWF5Tk5vaURqOGNRT2NHelp4NGhGZG1rK2JYTGpMQkUr?=
 =?utf-8?B?QkdCdGJXdEFUcVA3eWIybkNFTmhvWTRSaWhCREZLL2dPZVV1c0NjTVlvTXhp?=
 =?utf-8?B?TlJvZnhVdFd0NjZNTEI2NjJsK05pSE5IUTV5RDZ3TWIvRkxDVU1ZR2tuV1U4?=
 =?utf-8?B?bUNNNmJBSG11K1lkL2JkWDVBcHJ6U2lRRUVLWWo3NTU0YlU2OFRDUkV4ZGdC?=
 =?utf-8?B?bG05YzNCaVpwdWxCSmhPczZuOU5lV3gzc1JFRHVMZDZLRTJlYWR0WTAraEpq?=
 =?utf-8?B?NEhuUitjdWNBQTNvdWZKSFdBM3lIVzdteGtQNFpPSlVnZCtvektrRW0wZ0JL?=
 =?utf-8?B?ZkxjbGRETE1UUGxsTVZZRHN4YUpxYjRHV1ZrR2J3RFVZUFppeG56eitXZXRy?=
 =?utf-8?Q?gv5KbqaOOWyEuvXapMva1XejW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe70091-2a3a-446c-3846-08db18b67dd5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 11:33:47.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heF+t5wt70c1ARvAuLkEMrBP9lYrygXTbVPEa97mxk+xEF1Aahe1e+Nspp15IbY/h90fzSBu4Tv1Knfa8NYf+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8848

On 27.02.2023 12:15, Andrew Cooper wrote:
> On 27/02/2023 10:46 am, Jan Beulich wrote:
>> On 24.02.2023 22:33, Andrew Cooper wrote:
>>> But I think we want to change tact slightly at this point, so I'm not
>>> going to do any further tweaking on commit.
>>>
>>> Next, I think we want to rename asm/hvm/svm/svm.h to asm/hvm/svm.h,
>>> updating the non-SVM include paths as we go.  Probably best to
>>> chain-include the other svm/hvm/svm/*.h headers temporarily, so we've
>>> only got one tree-wide cleanup of the external include paths.
>>>
>>> Quick tangent - I will be making all of that cpu_has_svm_*
>>> infrastructure disappear by moving it into the normal CPUID handling,
>>> but I've not had sufficient time to finish that yet.
>>>
>>> Next, hvm/svm/nestedsvm.h can merge straight into hvm/svm.h, and
>>> disappear (after my decoupling patch has gone in).
>> Why would you want to fold hvm/svm/nestedsvm.h into hvm/svm/svm.h?
>> The latter doesn't use anything from the former, does it?
> 
> It's about what else uses them.
> 
> hvm_vcpu needs both svm_vcpu and nestedsvm, so both headers are always
> included in tandem.

Well, yes, that's how things are today. But can you explain to me why
hvm_vcpu has to know nestedsvm's layout? If the field was a pointer,
a forward decl of that struct would suffice, and any entity in the
rest of Xen not caring about struct nestedsvm would no longer see it
(and hence also no longer be re-built if a change is made there).

> nestedsvm is literally just one struct now, and no subsystem ought to
> have multiple headers when one will do.

When one will do, yes. Removing build dependencies is a good reason
to have separate headers, though.

Jan

