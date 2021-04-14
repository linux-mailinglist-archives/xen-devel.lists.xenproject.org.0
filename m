Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33F935FA4E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 20:12:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110799.211672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWjzB-0007bt-UJ; Wed, 14 Apr 2021 18:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110799.211672; Wed, 14 Apr 2021 18:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWjzB-0007bU-Qo; Wed, 14 Apr 2021 18:11:33 +0000
Received: by outflank-mailman (input) for mailman id 110799;
 Wed, 14 Apr 2021 18:11:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoOq=JL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lWjz9-0007bP-TH
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 18:11:32 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c040157b-a174-478f-9874-11aaaa4e1d21;
 Wed, 14 Apr 2021 18:11:30 +0000 (UTC)
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
X-Inumbo-ID: c040157b-a174-478f-9874-11aaaa4e1d21
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618423890;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vcZrNqJ9VmDj+8l2zxe5KkNojdJrNbMiA4zbm83u8lo=;
  b=ieK3f0OVoqHn57886+ZkX/LDEo1YK1RFEd/hMWWZBqbUlDHaj7dNm5j2
   YAaS7vOidTL1Z63wnv/jNHWtbjxCmymfnW9AQ2sZE7yK1guTWAE1lWMp4
   beh9qglNeuXJ3i+RbEpG5m0DagYSeLk4eYSeMuZtoNuS8apy1nYRXOZLA
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oUHz8YqNVH+nx6KaOu9U5VhmLgxVuvLZhQ/xAikp8igz/lN3vRNi4wMxyp1FNpjXRuaGV58NQ9
 32wQG18t16+zKV/scKftpHcpSneXtdLzk9o41ptIt63lZWkx+15h4AJRNDDbIZ5fsTmDXOrhHM
 MMN9fDU5Jll7DBO8JrlMbL6vMrlZClRRH88t+bhoj5GeeqGZD/romsT5z9byZ0RFe7ubI+Q8Jb
 T3Z3wJtXPX2rdUIj/LZipTp3bkc615UfDGbJ1HjlTw4ZBOtAjVon/Mq3K4oVCHPxrSQiDrSkvR
 Wag=
X-SBRS: 5.2
X-MesageID: 41991120
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ik6NZ6G80ayqPVPkpLqFOpHXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrSxrnlaJdy48XILukQU3aqHKlRbsSibfK7h/BP2nF9uBb3b
 p9aKQWMrfNJHVzkMqS2maFOvk6xt3vys6VrMP/61socg1wcaFn6G5Ce2OmO2l7XhNPC5Z8NL
 f03LslmxOadX4abtu2CxA+NoCum/TxmI/7ehlDPhY76WC15g+A0qLwEBSTw34lIlFy6IolmF
 KlryXJop+Nntv+4R/a2m/V4f1t6abc4+oGPuOgoIw4Lj3tjyyheYhuXaaT1QpF3N2H2RIRv/
 Tn5zsmIsRv+1PdF1vF3ifF6k3b/xsFr1/k1FOCjnPoraXCNUwHIvsEv611WF/9ySMbzbZB+Z
 MO5U21nd5rKCmFuyLH693BR3hR5zGJiEtnq8E/pThiS4cEAYUhy7A3zQduP7orOjn104wjGP
 kGNrCn2N9mNWmXaH3UpQBUsaWRd0V2Gh+HR34LsdCO3w5Xm2hkz1AZyNZ3pAZ5yK4A
X-IronPort-AV: E=Sophos;i="5.82,223,1613451600"; 
   d="scan'208";a="41991120"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZEStFxAinZbUmLcL0MSdpoeb0pNmKWLihrDGmV4BUacFyJBkVcQlxdhipUkETLdzRWZ5AREV3MuMe6qq1xzk7Hx0Go7z94aSTjnke9EaQM+QLwXwPHEpGQU/lcDs7FgXXkyTwlkd64CPAG01ZtZ0gCquSt+HpTBnrbhq4BumRb5Bs3GZAo3c3HHNPc9xhUSqJ39IhqmcaZ+18B1WF4tk3jxWAUFGLVEhDTKH6k5AZp6SJO2tJGNbkgU+mcuEGrF/fbo6TOlIXyzmnJPMbN6v7xYAtsSDuS3wpE+JUKLVhP6doGru58Ohd+roo65PBnc+12bT2WtAIYRbquRitey1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcZrNqJ9VmDj+8l2zxe5KkNojdJrNbMiA4zbm83u8lo=;
 b=CMCSjx4NGw3+4NOsQ/c4t6SMvh0ELhx9/4eegHP8Z+lg3yJKlFbHR1XiIUiUvgZv2w9EhiLGsoVf2u9fJUeVQONMdp6fZTrfPUeSSw5Jy9XePwj+p25yWUA3mjgHVdxoMCgZZEs/kVaCwoXzstPsqpwD06E9+jasXge7p2sC+z2sCUa++uVaZLPPGcLEp4N77wRhk2r0IyHpLNfy1uNL7R8BbwIcwWrfk6dcVL4xe7hxk5vxlpIrhQguRtEw94ijWUvBXWZ7JddzpYYerWB4HksLohwfBrxbgVe4AojOCuyjOX76ss9mSt6PaGQqQoVEk9BVQ9I81dP4pwcBPpMjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcZrNqJ9VmDj+8l2zxe5KkNojdJrNbMiA4zbm83u8lo=;
 b=oC/nES7YZXf3BIsoyLE/dmjW0Yow9x5HNdzr7T00t2KqtztZnelDK17oQA+cCMEHYiirtBhvlvUXgsv16ddsMkcqb5YYMY6b+YxJOJ0JtwcGIzVrOyr9exK39n3cRhdjubrN04gwnPl+6B9XCY0kkNS4DNARALj4v0YQrhfsUHY=
Subject: =?UTF-8?Q?Re=3a_A_KernelShark_plugin_for_Xen_traces_analysis_?=
 =?UTF-8?B?4oCL?=
To: Dario Faggioli <dfaggioli@suse.com>, Giuseppe Eletto
	<giuseppe.eletto@edu.unito.it>, <linux-trace-devel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: Enrico Bini <enrico.bini@unito.it>
References: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
 <f33b39a5-9bbd-934f-a9cd-c536a0ba7416@citrix.com>
 <eefc512b8c1ac26c4eaae81e79ee0243901a3de2.camel@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7184a7d7-6bca-4106-d70e-8cf9d5b227fb@citrix.com>
Date: Wed, 14 Apr 2021 19:11:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <eefc512b8c1ac26c4eaae81e79ee0243901a3de2.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0075.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9ef0f8d-0787-4f56-275b-08d8ff70b7d6
X-MS-TrafficTypeDiagnostic: BYAPR03MB4118:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4118CDCA01209FB87AF5FE6CBA4E9@BYAPR03MB4118.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oLaHpoZpTyEulUwHUkMdgonrMhYTrGdVmFVYdCVl1hJ0p5aRsF6PjLAjXiLPDSRkJTmMFLb6uhnltN0CLHkYlwNn32Fx+BdQDxYXsG0yhPhnpqhtV+dx4QWAHNnG+dRNFWexy2I+r2odzlqUPGBMmcfWBoGtp60pS8YyHhzswVNV3qwWJ8t+WDQ37slwiGb2Z9UE9oEa/XVBAU5OD+tmpbLuwqe85lMHwGOaWo0stS6s06ks1rflUvEXicUtogdyLA/E9XqwAHdh5R22wMi5RXrquh2Ro3bxGX3fYRjl1yCKrL8V4JzzISWDKmlo8l1+usnH7Q5diZ6Nu/ad7eNQOCPXCxZzlbzUlI4C9VLsAm2dLI0Pwb4HavKhIm95eEN3Mj0PlJtswDiC7uAvKWWIFjNBUjm2bjaUCWGXi2WnTrPCn71DDmiEqmWx3c8BnOnQnkPx6rgnvMi8wInNxaM2KvbyCLxCqoObLZidnnHDSiV8MPezSiDlzcCux9FF/h4u4JBig3f0IAdpk2OQSBhMzQvAf0p5EihMitbx0SvRbmfmYWK5M/Avv4taBvforvSAeQycn8JY9OFl8uXiPTRsRu3S14jof4TAgMhUekAPFDGrf9LHhK7Tv5A/IM7GWzvSBXYgAHBTndUvvoG9XPkLjZBP1jZgrl1ZKCFLJ4FcGJZ1vBAyxZkadpZxJmAA7Jl5C8/Dav9aT438eJY7Of0mrPrd8+8mePMk+gu5SxbTzcirunL+qPnxLKNiF6/xVZopA+Xsi+A0BcWyKXuoSyyTTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(186003)(4326008)(86362001)(16526019)(956004)(2906002)(26005)(5660300002)(66476007)(53546011)(478600001)(38100700002)(31696002)(2616005)(66556008)(66574015)(316002)(66946007)(16576012)(6666004)(966005)(83380400001)(6486002)(31686004)(36756003)(8936002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RkoxN0J1dUpnVTZiRFZnRWpWZkRtM2FObDBmNE5Xcm02N0lVRjFaVjd4NTVM?=
 =?utf-8?B?a2dDRHFVWk1JMytzNCtKT21FVTlXSDZ4Q2QySXJHUktOT0RzK2EyUlRuTWtZ?=
 =?utf-8?B?aTFkNjMzQXQrVm1vd2NRdWdwUEMxaDBwM25Ec0krZGJjaGVYS2FFenNLMXJR?=
 =?utf-8?B?SjFmZ29BbmFHcGJjdGZsMEdVQm56L2w2MVZDUjJOUC9ReWU1T3FrOXk4SUdZ?=
 =?utf-8?B?NGcvbVlzYU5VK1V5VlJoSmlpaHFWZGJkWStPRC8xQjNLVDQzdExBUk05eGNq?=
 =?utf-8?B?NDJ4TGl6RlhmcnBSaTRzVUlWRkllcTlHL2J3SVV4VllkVXJ2WEpSeU5zbEZU?=
 =?utf-8?B?QndBN2FiNG1oVDhKRnpPM3d1YVE3bGp6Z3BhVkFMcUc5Sko3L1kyS3MrQWNK?=
 =?utf-8?B?VEszRDRwTkFNbXdUWXFlT2F5dXFIRDJKaWlpNjVIS3M0Q1drUmpjeUlVRE5l?=
 =?utf-8?B?YkNacFM5cHUzZmdqVXZ5SXVGVHJyaHZ6blZXc0R5SEFTUERMMUw0aGdnM3Na?=
 =?utf-8?B?dHpiUk95OGRtdmxkRE9NRVNUMkI5NUkxTjdCem9zSXZrR1REZlpDdnNTbk1r?=
 =?utf-8?B?bHhWOHA5WmpxMkxiVm5SS1BvNWRTT1ZyM1R5Qk40ZjRIYld4VEhueTIrR0lr?=
 =?utf-8?B?akZIMHlxYk1jdktjWEZMODRuNVBiRXBrMjAxSXArZDZ5U0NNWEZpOUZPbTBV?=
 =?utf-8?B?RVRLTzJHa3RUTURSN3JHTHk3OEpwSzI4bjgzT2RHQ1cvMEx3N1AxcXBBbEEw?=
 =?utf-8?B?RlkvRHNSK1hNSENNY0VJYXB1ZlZNbFVtZlJFMWh0TXlSUGpObzZ4SkJYMGt3?=
 =?utf-8?B?d3NtZnRpaDR2QmxVNFUrQ2RmZ1dLUVY1b0ZtR014OWpzcm5wUWd1MENHOGVp?=
 =?utf-8?B?MGw2bWNwWmRsOExFa2FwRGpYVVh3YjNjcmpTRWJqZEZOYlQ5WnFGNkdTM0dC?=
 =?utf-8?B?a1hBNEkrQmlIcjJ2TWp6ZHBXTDdKSVlycGtYMHIzTWhMbUxaY1FFKytPbEFi?=
 =?utf-8?B?QVpnV3RtOW5qcEdHcytTRkEwbzFjeE0rd29qcCtZaFZDTkFLSGtKOVROQXFY?=
 =?utf-8?B?dmxnSEtGaGNzRnF3L29GUGlVK21PM0pyTDN1UjBUQ3NLUWtqbHdobGhwVW9i?=
 =?utf-8?B?MFBQdmtGUHFNRjM0WWRudG1mYmg3YWlEMms2Rk1ZeVEyVENENVFmMzBkS2N4?=
 =?utf-8?B?eCtZRmNXbWxqWW1PVkUxMGUzcGpMMlVCbWtoNENUL1FvRDIzdDZNTHFmRlVl?=
 =?utf-8?B?OE9JVzVwR3BOUkw5VHlSWjl1bmo2MTVrVGovYm9NU3dtSU5jczBlVUc0cDN5?=
 =?utf-8?B?UkpseHZlTXJWRGFZMFJYa0d4ZWJRRVlmWnh1dElvRWI1dlMzL011SzkxdllS?=
 =?utf-8?B?Wk5aaXNaeW9NRWtwdVJpM2lBWGc2YlMxZUFOZU1wMHlFTkpabkVnQ3MwZENz?=
 =?utf-8?B?TUJUeFlMYVp2cHhHdkIrWVpWTHdFOU9aeEkzQUM3ZjFaeUl3RDRLSkZFUU0z?=
 =?utf-8?B?SzlzWFgrNlRFMlNOZ0xOUnQ4dW53SGFrVFpwekR0aTZDWnplVWI5bzM3NXV4?=
 =?utf-8?B?dGZPV3k4MTVwVkg4RWVNRW9xVmFQMFlsYW5BeCtrMGlWZzE2K1V1ajVWeklx?=
 =?utf-8?B?STY2Uyt4VjhmSFhEcmlvZHZaYWo5d2w4SFZvV2VCeE5DckZ1a1ZUOVR3b0NF?=
 =?utf-8?B?ZmRTY2JUdWx0TlNDTzdqYmd0V1hiSWxQSFlodk04dXVLeEJVMzFYYzhFMm1a?=
 =?utf-8?Q?GO6EqqoIK9jygKxnHvXkvmJaPUCMUnzSJ9OHC7p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ef0f8d-0787-4f56-275b-08d8ff70b7d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 18:11:26.0169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYsLhDg7sZBNObpXNsqEJJs6hVmOZBSteEc0aOOSE9/I9E9MwA15LrUTifJiQHSIkR4qz5sRYUUUaqSgR0D4DKvHJm/RPDTT3P3XM1fLS+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4118
X-OriginatorOrg: citrix.com

On 14/04/2021 18:31, Dario Faggioli wrote:
> On Tue, 2021-04-13 at 16:33 +0100, Andrew Cooper wrote:
>> On 13/04/2021 15:28, Giuseppe Eletto wrote:
>>> You will need the development version of KernelShark, available
>>> here:
>>> https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git
>>>
>>> A screenshot of the plugin in action is available here:
>>> https://github.com/giuseppe998e/kernelshark-xentrace-plugin/raw/master/.github/img/ks-xentrace.png
>>>
>>> I'm happy to receive whatever feedback you may have about it,
>>> and to answer any question.
>> Very nice.
>>
>> A couple of questions.  Which Xen libraries do you currently use map
>> the
>> frames?
>>
> Err... If I understood the question none, as the plugin loads and
> parses a file, as it is produced by `xentrace`. :-)
>
> But maybe I didn't understand the question?

Ah no - that answer's my question.  I'd blindly assumed that the plugin
was talking directly to Xen to obtain the tracebuffer.

>> For the screenshot, there are a lot of examples where you have a
>> dom:vcpu pair, and a number rendered in hex.  Throughout the
>> hypervisor,
>> we're standardising on d$v$ as a format, and e.g. d[IDLE]v$ for some
>> of
>> the magic domid's (0x7ff0 ... 0x7fff).
>>
> Yes, the content of the "info" column is currently a bit "raw". I
> believe it should be made more similar to what `xenalyze --dump-all`
> looks like, rather than to what xentrace_format` does (just to make and
> example that people that have used these two tools can understand).
>
> This is just due to the fact that we wanted to let the Xen and
> KernelShark communities know about this work as soon as Giuseppe got it
> working properly and reliably, to gather any kind of feedback, decide
> where this should live, in the long run, (in Xen? In KS? In its own
> project?), etc. :-)

Where the plugin (ought to) live depends heavily on whether we consider
the trace format a stable ABI or not.

~Andrew

