Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B028974959D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 08:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559606.874718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHITD-0000vs-RF; Thu, 06 Jul 2023 06:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559606.874718; Thu, 06 Jul 2023 06:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHITD-0000tC-OY; Thu, 06 Jul 2023 06:28:03 +0000
Received: by outflank-mailman (input) for mailman id 559606;
 Thu, 06 Jul 2023 06:28:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHITC-0000t6-41
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 06:28:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40b93ac2-1bc6-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 08:28:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7974.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 06:27:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 06:27:57 +0000
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
X-Inumbo-ID: 40b93ac2-1bc6-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALdsiUSRHAKg55ClmFzd9Fz5hmFRyaG99YWyG26BOEg49z0C/CsDx0n2uor/isiAJZxvivygUYQqyB48SrooG2vh8VAbwZ8O0uibrxSxsCOL9GoptBMJZLBs1b/DvjNfbn22NxBWv5793ScjKupoxnp95P4dpaY/zOUb0oCL9YEqzUAqrCINOLf6VFwXzFkjQLPjdm2ALKlgemwUAVZAcQ3TUWAWrG526nyipVCDPzg9BHmkybm/94f+c/tmwS9SqyATGsJNAak/tZrNJ3a9I6m3epXjfzegWpFzWgPlQGP5oFGaLoEr3YYn4XnFreTCRsjmI9YY04wDBY+rL7jFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeQhAvnn9t5CFGlnixpbBOKQTUVYlkm4QPRjUZao/po=;
 b=nqh2DP6SyYV4umBgYwnNpUxM+zC3TZoor18QP/Cm1vyoe3glzWgNWxUolyRdEgJkan0yzhivPz+fSQ6tZohumV9uHpHFghF68OstZtPGocYYSjuBw37s57n99eP/lZlA75t6db5KwGwtLFGciX3CuIFI7o66tUSDiVQVLWxJZ7m6nJ+sa60YB/MXf3HhFURxgGaE3847E7hAlF7JJneODVkK2rFoxFA7qd7cnWYrkr8FNKBmTYw17WmXOFtIk+UX70hDEiSYNabh5grooNjDnsgKayV8TC1JGaaq+s8FsUCrrXtSPQyJKSVefL5cRr8Z8y+iplvph4llq/90rRNteQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeQhAvnn9t5CFGlnixpbBOKQTUVYlkm4QPRjUZao/po=;
 b=RaxW5BIQTzbhiyPtzxC7HvpQt4aLi4fmcZkoXijDRg2P63WsnGhjt4+nRcWj3dR5Rm7eZt1r3y6+84w8Xy61Iw+9SqBN8MS+lwPNFAeRXTMsG4rFIoy0yV/ZHZ13U9ipoOESqUC4Qt26zDKfmtXxLKSQ7MoavB/qWA8F96m9SnTS3f4oYfOKQl88AOMOiHouCONHbDI1dI28nHV2Ryd6DoUP965pO7KUsVP0deDPNH4kNEevNvxRlnValQGpu4lfwDPnfZNCSTato/baaH/hcJHF/JXE8SOFS+zvqttiACpdQ8fRnKGGOR+GWhG5dGiZZQxy+tU/cpcOsk65Lbj8HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c7d71cb-067d-8dac-3ee4-3af42b2756f3@suse.com>
Date: Thu, 6 Jul 2023 08:27:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2] x86: make function declarations consistent with
 definitions
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <1b2d5be30c0e4f335e59dce6e7c001cb0805d702.1688465215.git.federico.serafini@bugseng.com>
 <a16cdb60-1307-636e-1473-e5388e8f79d9@suse.com>
 <alpine.DEB.2.22.394.2307051604380.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307051604380.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: d42a1a72-a5e4-4615-fb6d-08db7dea23af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XJwUDHJdxHXNp0EUdTntc6986Rvw5Smdhd4yL8u74GY4MVnoVu1lwptGGb64Z/NPog86pzfoRw8ry+x0qjnPcTp+1e9KeMSytkhrBLh0qj7hp2IQyta3i7ztX3tshL+g/Wi6vUee3He3ko82JBXiN2F4ZK/LxgxVu01VV852rztTMv8jFwpcLnbIpOMezdfhemGaSc34NEnYbS9cYRoz+SLCyYWTDLmOYpEV2ljbsFWw9EuU0fmB0rw4hfpuInwmksMRGXZ+TIBhykZTTdLClWzZikJo1NtegEA/e/flHIG3WlFuMNp/3exK768qFeLseOcfA8jxnc3ODbKBhjKIiL7MSLLJHDxiPxn66ofRS2THvon7ydURrTg6JMCOH+YeAu2EuUsWLqRpALHWnxp5TfE/MkY3CifTRk2D7H2Ct0vELnqhLDPi9MRnzePs3espJp0x2Qpm3398itLMSJa5lu1tV9c0iCXFTb7t9lMlOC5FwEvI+QXAds40dWStPbIle6RQkJ+vIK5lhrJr34mucaLmB0ofXpzdeyLYQzadWihQ7FZfR/PTIJkzVGBMtDeZSpJRJ7x7DDY2RnhCK3+nrftI0JRrSQcwK6ZKBQErKIVuNp6V6jjDG1ckg78sx3MTCO4Psog+gEB8hwCjn1+i3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(5660300002)(8936002)(8676002)(7416002)(316002)(2906002)(83380400001)(31686004)(41300700001)(6506007)(2616005)(4326008)(6916009)(38100700002)(66476007)(66556008)(66946007)(86362001)(186003)(53546011)(54906003)(26005)(6512007)(36756003)(6486002)(31696002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmlaK3RoTmFsODRTMDMwRi9TMU5zYVlOak03djlXU0FMbngvOVFvTXM5b3h3?=
 =?utf-8?B?OWFzNUNRby90c093MHBQVFVYRll4OUkwRElUODYrNEo1ZGtxdlhOK2Z1VlVu?=
 =?utf-8?B?d1R6Q3F5K0QyZVlhQmRLYnp2ek56eTF4RGxEM05ZblI2TEhTZ0Z0b1NwK0xn?=
 =?utf-8?B?eTFRMHVrWHNvWkMwYVI0RGVWQ3gzYjhRTFVnM1krQ3NjV0RpQlJob2MzUVo2?=
 =?utf-8?B?MytWZnJ3b3BPdCt2b2lrWTRxLzVFWUg2anhJT2dGNHU2T1BXQnMxTFZFa1dQ?=
 =?utf-8?B?NGZkeEtiQVVVbHNhOHZSMFlVR2pET2w5Uk5DcW02R01tSWN6bG51QVJyT1ll?=
 =?utf-8?B?a0hwQ1hWS2xMRFowczZ6RE1NdVFFTkc1R1VZL0FRb1h4NTM0ci9QMzY2cHR0?=
 =?utf-8?B?dldTZEFRTkFDajNtazQ1SW1XeTNML0FXcXJXeTVaSWdnTXY0ZFhwMXB4VHNw?=
 =?utf-8?B?ZlVqQ1pGS01MNXFRcDRXTmwvUTVGMW0wMmFqQ1hQcjk2QWdIUm54bmxyRUli?=
 =?utf-8?B?aDhTYzNFaHBLZDBXdDk5MzZybEovRlExVHNFajBPQjJkYVBZL3pqL3ZiUkVs?=
 =?utf-8?B?VFQ5S0xweVB4UDlQcE5qMkRsZFNTSWNkRmsydCt1MDRQTXhYNlZXNVJCeVVo?=
 =?utf-8?B?blRLZ2dvZXNENXBtL0Ywb1JBVlpIcHJycEx3R1FES2Z0VlZEaC9KdHRhangw?=
 =?utf-8?B?R1VJTlVra0t0T08rOXV0cmE1VjlhSkNmK3Z1Z1NjT08wMkI0bXdNMDkvRjY1?=
 =?utf-8?B?MGd1dlE2ZytneVNmQldlajlLZEV0eld1TDRSMWVNekExVnVTaGpyTGFYVG1Y?=
 =?utf-8?B?T0tQelVYNHcxMkxDTWZYdnBQVm1kbGRDL3B4MFN5Q3BKcHErckZjcmp6R0hs?=
 =?utf-8?B?bk9vS2hnNExmNXQwWXJic3lYVHNpeEd1L002RlMwY1pSWlJxbG5veFc2bmtk?=
 =?utf-8?B?c0pnS3FydmpuS25qQkNERTN5YjlYVmJXNDl5NTlhMCswZEFBZzVMbTFKSkMx?=
 =?utf-8?B?YTY5dUN1bkRQZmVuOFBNUDdKbkUyMTU0YkpmY2VlbitRbjM2TGh1NmdnOGNN?=
 =?utf-8?B?dmxLMXFyUXo2RDM0YjFLTHE1YUdidlNwT0JqOGUwa3pEZ1V1c3Q5WkVkeXY0?=
 =?utf-8?B?RU1KdmFoQlRMQlplZkxHUlgvM1pmemlraGJVVWE0SjRQdUphK0RuWnZsR3Zq?=
 =?utf-8?B?TDFsSDBFYXU1L28vTzRGQmJPcGdxTldqM1k4ZnAxalgvL3BISVlUbTJCSkpx?=
 =?utf-8?B?ZUplS1EwOUNhbEJIeW0vdzJlbHdmUk0yeDRwNlNmc1ZML1RpeHdYNjBkWThz?=
 =?utf-8?B?ZFNYNGxrMVBFSGhQWm9qVEpVeDN3STNlY3NJM0hxeVluVEdIT3FYMW40RDM1?=
 =?utf-8?B?NDgwQUo2RGtEZ1QwR05tSzdyTnNudTRTR2pXMVVwN3ZKd2xBdkFhaEF3R0l4?=
 =?utf-8?B?c25EbkFZQzVSM1dtbnJVRUFWNHFUeXNqZGZPYUlqazJuY1lESGxrTStUMGsz?=
 =?utf-8?B?VzFheUpnRndNMVpNK05nbnQ1RjVlR0tSTmdWL21SOFc2NFJNL3NMYWNhVXBx?=
 =?utf-8?B?T29jM2RUV2JOSDhURHd0dHM3NnB4Tkk1QWNod1hiWUtQWHpta1hPZmZJNnhq?=
 =?utf-8?B?UFd6Q3BjVGdreERkc3FSY0srUU1uQzJCRlFIUlZDYUYzYmE0cHB0ZVcwajlM?=
 =?utf-8?B?dlBoM1U4OTV0UXhiajlKeXBoR1JmUUlvNDVqUDJSZVovVWFVQmVKSFdlV3pM?=
 =?utf-8?B?K09JSWErelZpN1Noc2cwcFE2M3VOd2hQdlJNR255ZWdiRHVSQUZoZFVEYnlV?=
 =?utf-8?B?NTFuSFZTaFc4T2swdVV4bklCSTdZbUhMMmQyM1JGMU5nSWRLK2owTitidjdU?=
 =?utf-8?B?c2twc2pnT2ZTN3VSTUhkaFA1ZStGTlZWaWFnUzN0aklnQ1ZiUWZHSmU0bkZF?=
 =?utf-8?B?dnVEdmhDamwxMm1FbEVydmhKZUpUZU05TisrVEQwbTFSTWU2NnpVVEFMT3Rs?=
 =?utf-8?B?YWMwSFpwOThUMDZwWFdXZWx1UjVMOWxPRnFDbEFyZTZtNlpSK0FxaTQzTU5t?=
 =?utf-8?B?a1VxU3NUTTFoYmZJc25RWFQ5dHRtQ1Rib0pmNWhCa2VEME9Kclpjd3FvUGx6?=
 =?utf-8?Q?LIsM28qEGAJAZp6OUHne87Vr6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d42a1a72-a5e4-4615-fb6d-08db7dea23af
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 06:27:57.8895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKyY9KU5J7QIRTeU+2yNM10mdQPG+BZmGsVXtnDeZgZF1vL5Ec08EoNZ/4sVXoWAO7ezfeAGNKagDDMY/eYyCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7974

On 06.07.2023 01:22, Stefano Stabellini wrote:
> On Tue, 4 Jul 2023, Jan Beulich wrote:
>> On 04.07.2023 12:23, Federico Serafini wrote:
>>> Change mechanically the parameter names and types of function
>>> declarations to be consistent with the ones used in the corresponding
>>> definitions so as to fix violations of MISRA C:2012 Rule 8.3 ("All
>>> declarations of an object or function shall use the same names and type
>>> qualifiers") and MISRA C:2012 Rule 8.2 ("Function types shall be in
>>> prototype form with named parameters").
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>
>> On top of my earlier remark (when this was part of a series):
> 
> I am not addressing specifically this comment. I am trying to build a
> common understanding on how to do things so that we can go faster in the
> future.
> 
> In general, as discussed at Xen Summit, in order to successfully merge
> large numbers of changes in the coming weeks we should try to keep
> mechanical changes mechanical. Separate non-mechanical changes into
> different patches.
> 
> This patch is large but mechanical. If I understand you correctly, you
> are asking:
> 1) to split the patch into smaller patches
> 2) make a couple of non-mechanical changes described below
> 
> 
> For 1), in my opinion it is not necessary as long as all changes remain
> mechanical. If some changes are not mechanical they should be split out.
> So if you are asking non-mechanical changes in 2), then 2) should be
> split out but everything else could stay in the same patch.
> 
> If you'd still like the patch to be split, OK but then you might want to
> suggest exactly how it should be split because it is not obvious: all
> changes are similar, local, and mechanical. I for one wouldn't know how
> you would like this patch to be split.

So I gave a clear reason and guideline how to split: To reduce the Cc
list of (because of requiring fewer acks for) individual patches, and
to separate (possibly) controversial from non-controversial changes.
This then allows "easy" changes to go in quickly.

I realize that what may be controversial may not always be obvious,
but if in doubt this can be addressed in a v2 by simply omitting such
changes after a respective comment was given (see also below).

> For 2), I would encourage you to consider the advantage of keeping the
> changes as-is in this patch, then send out a patch on top the way you
> prefer. That is because it costs you more time to describe how you
> would like these lines to be changed in English and review the full
> patch a second time, than change them yourself and anyone could ack them
> (feel free to CC me).
> 
> For clarity: I think it is totally fine that you have better suggestions
> on parameter names. I am only pointing out that providing those
> suggestions as feedback in an email reply is not a very efficient way to
> get it done.

What you suggest results in the same code being touched twice to
achieve the overall goal (satisfy Misra while at the same time not
making the code any worse than it already is). I'd like to avoid this
whenever possible, so my preference would be that if the English
description isn't clear, then the respective change would best be
omitted (and left to be addressed separately). (I hope it is obvious
enough why [largely needlessly] touching the same code twice isn't
nice.)

Jan

