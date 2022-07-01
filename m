Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1EF563152
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 12:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358950.588337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7DpM-00053S-Rx; Fri, 01 Jul 2022 10:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358950.588337; Fri, 01 Jul 2022 10:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7DpM-00050y-P1; Fri, 01 Jul 2022 10:24:44 +0000
Received: by outflank-mailman (input) for mailman id 358950;
 Fri, 01 Jul 2022 10:24:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/an7=XG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o7DpL-00050s-0H
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 10:24:43 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140082.outbound.protection.outlook.com [40.107.14.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 049fb5f9-f928-11ec-bdcf-3d151da133c5;
 Fri, 01 Jul 2022 12:24:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7711.eurprd04.prod.outlook.com (2603:10a6:102:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 10:24:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 10:24:39 +0000
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
X-Inumbo-ID: 049fb5f9-f928-11ec-bdcf-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZnMBlIzesx1hzLQWYl/1hpmu9nG+Hzdwjy/XBKZrBbx3FHUlEtmhzvyFTXEY2lJwWh8iWJ9nAFhfIY7Sk1+sE36+GuVMHysR+rya9VK166apWjgp2PIpELXDy0kKuVuF2dzVPws0m2ljKqpcj2JN7PAGQU/QUW+W6h68mLTJPplgLoZxPugmrd0a9ct16jW7Ronga1DhVp+d9Vbf0BRr1ZMskYDP2g2kV2+XCWu5qfTL+HCVUEVgtY0rOwCdLShv2rWV5iLikyJ98Wq812Mqr+9sI3FLR+xQiptR8Eme4s2vjY0vbMKFcl2GO+ziqMxluJkha660Lh/BnV3eILrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYINq0ya/FtyAiI/ePiZ/8DJ7K/z5jslKI4ztS0uuoc=;
 b=Jqgx+NAV8QvRVGoVdFEVAI+f2BfPife8wimA6rlk71qCoUXvaHFPJMCrNlyvlMQ1JvIU48WDnR7KeDM8K0BKWLiu0GaCK0BdvDGGzA1fBLQ0elbdBgaMo5DZJB79HuaoJtAAoeb1khvJoqSbGthxC1Ow+e2oeXTAhzAUuKITJZtynRyG5S/YtzuOQvJp03Cr+0+1HVaEAEPR4cmmzNIekGmAYZKTsgpEWQrFxYWKmqFwGTvbO8WegErQT+0a8qo5ZL7cgZ/iw48NjZQmvS0BbMnJE3rQrmbSLmRGTbseHcMnpJP55AZM3j9zsZLdAq5kgwTHsh14/FdvIPqWdaPl4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYINq0ya/FtyAiI/ePiZ/8DJ7K/z5jslKI4ztS0uuoc=;
 b=1hoEC3i45WgbfrAG4g5yddHaewWVLg1Amz+ny8ddcR6bW4/UvLLWrpJP/yXc8Fp7ur01/MxrfEVWnnMbgEG3KEomztwEy1IlZR+6nFXF5eNiWSKURdE8YLtWT7+4MD5NxOPFrzKxeXa+5GTD/l3ZegV9jQh71xu6TFpH4sFJneLSNZddSZA7UV2ZD7mvn37qTJHrPSwpMZwRD7Cqbzyoo9MmV4mt6+oWYFCs9cmk3f5SOCQlLKfc+q0xjQKZaJ40cS7esWBPaO43euqekkdpQ1uMNX5IVt9TvfNVgfJH3nni6AsHhvnSypGJvs6yyDOMGfd2QDd4Uoc3u/JDkI3I9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <563b5d12-6eca-cfff-129f-7bffb01cd25c@suse.com>
Date: Fri, 1 Jul 2022 12:24:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v9 0/3] Adds starting the idle domain privileged
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, scott.davis@starlab.io,
 jandryuk@gmail.com, christopher.clark@starlab.io, dgdegra@tycho.nsa.gov,
 julien@xen.org, george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 dfaggioli@suse.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20220630022110.31555-1-dpsmith@apertussolutions.com>
 <alpine.DEB.2.22.394.2206301529570.4389@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2206301529570.4389@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0204.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15949aaa-25bc-429b-a4dc-08da5b4be762
X-MS-TrafficTypeDiagnostic: PA4PR04MB7711:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jb74eNHKhNx+W08lCvn9ZIVzQeX/a/RyO8OZBoUSMVIKO6DnRuVunV33kcDlbU01IGdq67PcsvWQea+AUAsOoglTM8nNYBFK+wqne94uWJ4s9w4zw+KMM5wXc0hKOwuwXBmUHLvZzm7iP2yK6dMlbPKoDvrsJjcV6tjmXGOGTahmOam4Af+7eKZkVJKV8I32Ru0ZgGH4lbIo1lSfZFLgwLPh6KLcyrRaZTT5/20DoMTP+tc0/H8UC2wjKEgg9PGk5GGq4MbpSkbXjvznLa8+LVOpWetI87Vn5PjSVI5JVRe0ast5BykVt0SUkMifll8FuybY3tyCZGppSm4b1MEMtpuO/NiDrGRhxObW9ULKFnAdQY9cXAaTA0M+yAfPKpHg8iXU8mBqL6OWcX0WByvRxq33mrGz7whPl8ty/Dnn5gLCUkIs2WvPv/u0zULk4pvZno8+nN6p82RuNk8YqIszEn+JjsxwEnW11aJkSeBN/QB5t6xdGqMUsJQSXmcba2s7ITdgQ6gl1PVytznrilRBzuCZTeNIixOeLpYOjaevVzpDrCNIBfNSoLEyvxlSk2nXlwQkM9cRR+/dvED0bJKzS1piYyxbkqToO5U1MYwijtxu5+/WEC/+uEbIHz4pP0IQI70LSQhdXDBgmJ6RgiKGAtMBQoQy3k3oKBkULxJa1PE22Glf8ly9FneZMud0BpcfUWXGRqYCzW1CVaESwTDeH98tsTnnkMqINTR8P6ZR+9Fv88b9MVIsVPTrlhj1XCrbAVOC2xtyAiyJX988YfRmGzC5QFc4yFMmJT/E/EZsPHg6TmRml8Zb4qapF6xQNoN7cYqsfil0kwg/MeDSyBVQ8a5XxSuOLy6KQ7Tq0cU5UCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(39860400002)(376002)(346002)(26005)(6512007)(53546011)(2616005)(2906002)(5660300002)(7416002)(478600001)(41300700001)(8936002)(6506007)(31696002)(186003)(86362001)(38100700002)(83380400001)(36756003)(6916009)(8676002)(316002)(31686004)(66556008)(4326008)(66946007)(66476007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDNscDNYT2JBTmRocUNUNHRiK0NqWjZRQlBPd1ArVDBPMU42TS8ySFRMcUZu?=
 =?utf-8?B?K0V3dTNXMlJvdUNGR09HbmFpZTFsQUZ2bmlYTmlVZHYwUTVRTWJNT3ZTMmJ1?=
 =?utf-8?B?Qld5Vmh6Sm11bmhYVEdWR0x2M25xRzI4ckRMcmhIenBWbGIwNTJnSCt1VTFR?=
 =?utf-8?B?LzlZVG1jVnh6VTlTNDE1S2pNUWlCZ2ZCVXNEWGUzS3dLOTRJQ0ZlTUdrdks3?=
 =?utf-8?B?Q28wdjI0OTFhaHFSbjA1YkdiVXdScVFRNkhjVmV3Z0ZWekpUWEVGQjV5R1ov?=
 =?utf-8?B?dFh2cm9BbFR3NFE5Y1NlNEJVRWxNckdOR1hLUDhETmxDcWhhMnNCSUFvREJ4?=
 =?utf-8?B?VnA1Y25KZ3doZ1hQQjl4dllWM3UwN0pLODBvMzZVNHJSRk5RVkdURHhVNk8w?=
 =?utf-8?B?K2RHa1NzbHd5OFVCekhraHd3SmtpMTFEaHdzYXN0NmxhMFRjZnNtc1N5c0xy?=
 =?utf-8?B?WDA2Qkh4RWdEWVlYeFI0WGlsZUxjalFRbjZzM1dJQnRuVnpjc1N3QWhrRmxH?=
 =?utf-8?B?ZGFxOXd3K202L0FCQ2liVEVqUFVJM2FuV3htS0c5OHBteUs4NngxMXZWcklM?=
 =?utf-8?B?K0tsa2xTTFRRTVVQQVJCTExrZkFESVNFVXlFWnBrWEVPU3p3eGFRU1hSYzdi?=
 =?utf-8?B?RjlpSWtGYTd4ZGYya0N0VGxsVEVUMndpN01mK1AxNnpYYXNHWEtYKzVkNmZy?=
 =?utf-8?B?M3JVVWg4bDRmOGRNaWNjblFQWWhqTW1LcGV2c1FWZDFWODNvSHVHdzRJVjl3?=
 =?utf-8?B?YnFDUXhBbXczVWdUWkFqb2V2OG1GUDY2ajVpZWdDd2loT0tYai82cVl4RjJm?=
 =?utf-8?B?Mk1kNHQ3OXBGbFNidFhaRWRzMlJXR1FON2VqVzBOWHBabXJobnlEWTRGYmhp?=
 =?utf-8?B?ZjRMRGxRZ0VpRUpXQnhsdERLUGFEWURZT3NBeHh0c3BKSkh2RXRyeWp3SnI3?=
 =?utf-8?B?Y2RUeUhQdXEvSHZqbzdjVFAzVjhGUXN3S094R0hUdFlNc2R6TGZDTUNpaWlX?=
 =?utf-8?B?djBTZkU3NXowYmVUYnErOWJ1a2NCdXQ0T092NXkrODZDdHh3REZhalFpUWdP?=
 =?utf-8?B?YlhjSDRUUXdGMmhEVHFsc040ajhNWEY0RFEvcFV6MGg2TEwwSEZNbTBiU2hy?=
 =?utf-8?B?UktJZTdXMkhmODJyWnJmUmNwU1hUa2xVeVhrVXpIaEpJNXgwQUZRNXA0UkV0?=
 =?utf-8?B?M2h2Z0ZjSVZzL1huM1lHbXhJVU9DYkxaTkdvNkk3djV4UjJnZDRxMTNVNGxX?=
 =?utf-8?B?ZHZSUThRS3pkRnhEeUdiNkJHYTJqeW82QUluVHRTaS9JQnpXRXRFQWhoVFZs?=
 =?utf-8?B?TkRVRWhpcUYxTDY5NnAwZGJlSEFjOXArQ1FtZi9XUEN5aUt2SC9Id0lpMFlm?=
 =?utf-8?B?VUlkRzY0N3lrSnBzNXJ0TDlpYmtycjBkUXp3aHlVclZPWlNZbW1EcGE4YzBB?=
 =?utf-8?B?SHRnUGJ1ZVpxSWhuRjBEdjdOMXFzeGNkM1RoMWVnVnVsNXd1TTRYMzgyN0Np?=
 =?utf-8?B?MGdmeUUya24zNERLVzRvRlpGVlNPWW1FTjFKUDUwZ0gzNWwvdnMwWmVVZmtj?=
 =?utf-8?B?VnkrTThKWHRidjhnWG1yQ2dReXhob0JYRXNsUnBTODV1N0tzbHIrZWJQSElZ?=
 =?utf-8?B?NmtyS2M4R3FwNWdnL0pmQStIVTZKVkR3SXBmMkFBK3paU2pMRGFkRGNNVzlt?=
 =?utf-8?B?UDJ2KzdydWJ0SzZ4TjhUdm5wajhCTGYvR0RXaGxGVGdnR0FVbjM5Zm1MUjds?=
 =?utf-8?B?N2ovdzMwdjBSOUhWOENUVkUydGtPeEM0Y01ocmRONGNEN1pQYXlIQWVFSXRr?=
 =?utf-8?B?RGhCTHZ0R2VtcGE5MXBnYlU2OE1SVzBFYm9FaEhFOUswQWR1S1lUd090bDhy?=
 =?utf-8?B?YzdlUHU4NmJUQS9Sa3NBOG01QldOZmMwYklxU3QyMEZqYm9qUG04N09PTnUz?=
 =?utf-8?B?NmpabUpmZEtpQndEaFUvT2l5WGZIdHpOVmZUZ2pzU3NVOEVPOENQMFpSK2lJ?=
 =?utf-8?B?L3hXSzhaM3JaS3VwbytNdUE2bGhFdG5lY09wVGt0V3BzTzRmMFZwWFRTcWVl?=
 =?utf-8?B?ekUrcjVKcWo4ZVRXamgxbCtCNnV6NnNnWWpLSzQvR05xZWxpVURpcFhYenk4?=
 =?utf-8?Q?L/DCBcikUogpAVYZorh8s6g98?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15949aaa-25bc-429b-a4dc-08da5b4be762
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 10:24:39.0429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yckj80V+3gumYHDnRZ3AOvhsjOBEfk1RDMKT5hUFFYH1PdbXL6NbvB4nPVJZ697DBaW7SMnogkkJaRDPeez6Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7711

On 01.07.2022 00:35, Stefano Stabellini wrote:
> On Wed, 29 Jun 2022, Daniel P. Smith wrote:
>> This series makes it so that the idle domain is started privileged under the
>> default policy, which the SILO policy inherits, and under the flask policy. It
>> then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
>> by an XSM policy to transition the idle domain to its running privilege level.
>>
>> Patch 3 is an important one, as first it addresses the issue raised under an
>> RFC late last year by Jason Andryuk regarding the awkward entanglement of
>> flask_domain_alloc_security() and flask_domain_create(). Second, it helps
>> articulate why it is that the hypervisor should go through the access control
>> checks, even when it is doing the action itself. The issue at hand is not that
>> the hypervisor could be influenced to go around these check. The issue is these
>> checks provides a configurable way to express the execution flow that the
>> hypervisor should enforce. Specifically with this change, it is now possible
>> for an owner of a dom0less or hyperlaunch system to express a policy where the
>> hypervisor will enforce that no dom0 will be constructed, regardless of what
>> boot construction details were provided to it. Likewise, an owner that does not
>> want to see dom0less or hyperlaunch to be used can enforce that the hypervisor
>> will only construct a dom0 domain. This can all be accomplished without the
>> need to rebuild the hypervisor with these features enabled or disabled.
> 
> 
> It looks like this patch series is fully acked except:
> - in theory we need an ack from Daniel for flask
> - there is a very small change to sched that would need an ack from
>   George/Dario

I don't think I've seen any R-b for the last patch.

Jan

