Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6591E67DE5F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 08:17:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485307.752431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLIyL-0004Jy-Ij; Fri, 27 Jan 2023 07:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485307.752431; Fri, 27 Jan 2023 07:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLIyL-0004HN-Ff; Fri, 27 Jan 2023 07:16:29 +0000
Received: by outflank-mailman (input) for mailman id 485307;
 Fri, 27 Jan 2023 07:16:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N8iV=5Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pLIyK-0004HH-5z
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 07:16:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8178bdcd-9e12-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 08:16:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8608.eurprd04.prod.outlook.com (2603:10a6:102:21b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 07:16:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 07:16:20 +0000
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
X-Inumbo-ID: 8178bdcd-9e12-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpw84VxHUTVE1n8f/imAZkiCH97/a4Uy2H+cxOWUOlzJSquVEgu/gYaQLuQmBsGM9FEnbLM1s9B9cILISWC9kjdce6CgX9+D3uIX6KlXMhC/PljQ3cayS8mnp0mn6BabIXegzD/7xsH1gnFQ6S271awKO2pSekauBktbadYImmITgKXK/gCmfcIECsim+FlPVTSW+xJhFsErQmc5ljuMyYPIR9kHBJAXVwq3KVklrCzH9tN92hpGiJ7aas06Dp3ScmnA6/HE1OihAWsTrFSCYmCP/522bMbAEK6tJUpcfCWdN9KxCcVRG2FQD9CccDBMIWLThA3Oy6gGaPzLdxMfeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6QnBkLBpdbM7c7K2c/W//gYzIe+gH0cr7Ap2wwwbNA=;
 b=KWuVO6842/mH3zfkRM0EJToWh4FZ7vV4+ffzlH0hw5+qxmji7aa9oTkFf78/SfKnxgV8PO4tI4oa+1g8LBje0WUqCdFzVY4aG4wETR8uehZp5dRRTXK84mmMjkmmKZsiffqfUk44JxU2WD45/jld9l0s5VL8gZikbscBDNRenTk026lIYCecyeu/0v51tYieiA1NQvJB8tay29MGePag5r5lvZEneqsRd8U4mRMYs3JyOsCp2UyYqgRSC7Le8TQmrkAbH8Z2Ub+a36Ii1RpII9v4aWDuCXlgLQkgbcqAJhrVfLalSsBFmnXcBgeta85Dc8pY1u/cJ2s+lKAo5or8IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6QnBkLBpdbM7c7K2c/W//gYzIe+gH0cr7Ap2wwwbNA=;
 b=0+tvVQewipbAjocVMwrlJgQXwFkhx6HVnIrFR0bgkhT+SyqnXfpqcG0biYaSo5l0I4UYNYExUTylTBb3SDBjmnYQmp3KNOdfLvIfnQ1m62SaUfZN5qe4KQ0tnsnctzlaNKg7j0Q8lBDiHVF5OjcuKtgHx7fXIOdjqKVGGId/1WgAukjrT46Vkoyc7Vxc+4sm7UoxJ/ZoPIje9rtpWOOWxwcWsIDdYpm/c8McEKrPIjSxIrWRtEBkpRXya4ERWHLvBWhbAd7SGT3uzpvIQ1KBbj51WE0JA09p2tMiFWmfuIJuAmcrmwrwlxtbNhSWRYjwmx20v3kYmJaZmrreBJ3eVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c4eb4ba-4314-02c7-62d5-b08a3573fcc2@suse.com>
Date: Fri, 27 Jan 2023 08:16:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] xen/x86: public: add TSC defines for cpuid leaf 4
Content-Language: en-US
To: Krister Johansen <kjlx@templeofstupid.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Reaver <me@davidreaver.com>, xen-devel@lists.xenproject.org
References: <20230125184506.GE1963@templeofstupid.com>
 <77576aab-93bf-5f6a-9b04-17eaf1d84ffb@suse.com>
 <20230126180244.GB1959@templeofstupid.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230126180244.GB1959@templeofstupid.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: c283f1de-a238-47ce-f406-08db003663c7
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CzT2MWIeQOE9o901nB+nPz+Tm3/UYsXEZ88wFLwqVHhDmMagy2zWH+QlfKJxQ9vtdmgaDqLCx/qxKDZqKAiq8opBCXnvshemrSVFx/pJuXATz+VIGKlm6gwxEk5/iBs+kfteonwE/CAt1u7W/vrr1q+E1oysO4w1WoYTXm0vX3EPZ/m2+i3i06Ag7PAPx2fzR+0RePJJvfW3JWOf0qIuWGFIclWPb2S5QUWr0Mb5LKfyE7mLi45JnXBg2cgKYd9+gVQ/fMywQNgZ6qsaAHe/udXcausIFpXLLXDQryzhtRis0wDOPC5iVBEBau/FDBidJH+K5mO5ZArJzCiBcxmPsdE7CIZHQNaZc4MmbZEC7AZL2NhvfMF52GyWBrt/+r4/rTZe6KgAoIa2F6i1uhLfvHJ1loKWbi2zu0YWoTz77J3k47+e2QWM/jZwIxSRKkDN8XyCkFIHMiRmWfKTswsOHJVWPCNadJsXHEW9P9Pndb49pl/BpDEWmGsK4684ziekJJ25qp+9WRLg7Lvg5CpkP7OvsrL8eLG9rp3RKlY2Hxf288o8EnLsaoLLxQKxMKTsVUdjucKm//T9fE/YX4phacKjZgKgo+/wf7VB7wBttW5CykuyuyoXVvlehitmsgkdGkViPHfIb5NhBEr6ROhdWuPnp8O8X+CRTsm9ofiIdFhSRjuQ+HLGUP+khYjZ0OxD48vB4/KsdiuASmiI/bSUchqxSRU0xEs7CSYGOIX2bkc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199018)(31696002)(36756003)(54906003)(8676002)(6486002)(478600001)(316002)(6506007)(53546011)(66946007)(5660300002)(4326008)(2906002)(41300700001)(66476007)(6916009)(66556008)(8936002)(26005)(38100700002)(6512007)(186003)(2616005)(83380400001)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFRQZjhTSHRoMTV3RXFBaWlqZk9oaitJSW1kaHAzV3pHa2ZWUWt5VDd0U3BR?=
 =?utf-8?B?K3cyK3c3clpramJhMUE3WmVPR3JmMG9lUm05VGRLcEpkR1g1Q2M4aDJKMFpV?=
 =?utf-8?B?OVcxY1BGMEhNSzRQTlJtSGxpV2E0VXpMbEQxdGZVUzVwTWQrM3lGMFpKMXov?=
 =?utf-8?B?cnNVZ3oweEZpMXpFZUNPUjA2M25hWWtRQ2hadm1UalVFT1dwQlJrSy9XMW8z?=
 =?utf-8?B?Si83L0lVVnhGcmI1bkNEY1FvMmZaWG1lckNra3ZTYzQyTUlLL3dJUW4yRGg1?=
 =?utf-8?B?UXpWWXJiWWE4TmFYVFVNbWNYaTFmaDlCZDloVGt4K2h4cWI4ODEwK2Vrcjd6?=
 =?utf-8?B?TzRKYURxUVRua3dRSUcrRjdid0tHaVJ4K2tnZzE5Q3V0OStNMFZYdktMQlE1?=
 =?utf-8?B?bW5GZTJsWFROdEl5ZnNONU1BQWQxTFlMUUJRclFJUTBMZ3BXNWhBQmxDaUlQ?=
 =?utf-8?B?bVJkbmxPU2tBTGEwbEJsd0FtcmMvT3lFT3VFWDFIZ1JkTjFIbEI5cHFCZm9U?=
 =?utf-8?B?bjhCRjNmVlJ5TXFpSVRtVEN4VjIxKzJOZ1RoYkRRb0o4UUl6YVZEekY1bVZr?=
 =?utf-8?B?WGFBRTE4S1NNWGFlbnBmTGU4Y2kvVmI5aUJKMW1PUTA0MUUvZTVTSFBNVS95?=
 =?utf-8?B?R21zSlpTdTNmdFRPdFpGN0txS3FaZEQra1d1dEhreXY1dldJZUtCeHpuOGNK?=
 =?utf-8?B?MmxWWnZ0eEJGWEZYdWs4V21rVE8vNXB3amNXU3R5eHBCandjOFo5SkJ5aFVt?=
 =?utf-8?B?V2g1YWF0dW1NdG85bzhBQVkvbllMV2FZZ0lEMnNRdnczdE1sZlFxODJ6Q2Jj?=
 =?utf-8?B?UFFYM2Q3R1VUTndOc21PdkVrSUowWndpYUNXYU5GMUw0Uk9wMTNqMVA2OTQ2?=
 =?utf-8?B?MU9rV0IweUdMQkJoREN5b1ozQnZ1bG40ZHl6cEppUWphd09GdDk3SW9XK3Ux?=
 =?utf-8?B?WWJwdUNLcm9EZzN3MXRYM0ZkcVlmY3JyYVBldjljOThFeDFETDk0UmtZbXhi?=
 =?utf-8?B?T21kNFMzN1I2QzRscjVTL2VoSHA2amFnbW9sWTFQZVE1amhJbEFDRnNlQ3Y1?=
 =?utf-8?B?Tk82aEM0TmxRajZNVk9kQ3haZWJ5NDZncE9CMGZ2bEJhcXROYmhEWW5UYTZn?=
 =?utf-8?B?MitVRUtOc1B4Z0E1YVBYRFAvRFVrRjQ2S3pIWkxTTDl4bit3MUxJeUxPZ2dR?=
 =?utf-8?B?bm1LU2FyNUxBdW92NzZ5KytReWJQbmFJeUV5aGsrNXFGSHQvL2hWNFpKVy9i?=
 =?utf-8?B?Rk1odWdLZ0NZS0drRWw1UzQ1M01vbVVBc3RJSmZPd0ptREw1WTdLK3NKZHZt?=
 =?utf-8?B?K1hSRWp0aGVvcGV5dHJFWUxERHAvekhmcmhUUE1GWWpzQjY4SVRuR3BZV2kw?=
 =?utf-8?B?c0JGRHVXc000YjJYY1A1TFl6WjF3MUxKd0M5V3Nzc2grY0g3Skc4anBWc2lK?=
 =?utf-8?B?RjdZQTZ4SGNFZGVraS9Zc2lNdi80V3FkSlVTc0hibGN1Qk9WVHRscm1ncGFL?=
 =?utf-8?B?YjFuUVh6YThzQm5Gd0FUQWVBU3cyWVBxTWNCVWQyd0hxeG1RUHg3WlJlaHE4?=
 =?utf-8?B?ckRsbXRBd1ROMmpTa2hLaXRpZmpVQ2hVOWJHWUlxWVB2QnhENHdsT2phVzha?=
 =?utf-8?B?em1KYjhxZnE2TGlveVpIL2NOV0hHb1UvVGQ0MXpuMHg3cXJYRm02WU41bTRr?=
 =?utf-8?B?VjFsTjRSVmc4LzNOUkpPNUFISU5yMkJwZ2VPamZ1c3RMOWY2N3QyYi81OXZF?=
 =?utf-8?B?Z3k4YVB0TkVXMVdMa3N3OGFKSlA2VU1HWWZjT0NrNFI4bzBWYjBTTmZ1bW1z?=
 =?utf-8?B?eTBiWEZHOE9TWVozUVN0OHVpUW1JN3ZDR0hDQlJLQ0V1R3lMSHlzWkJ5RzY2?=
 =?utf-8?B?a0NWQXl4MndjMTlkY3cwcXhpQWxQeGlwY05QNGM2OEszTjk1MzVkZ1RDTkNq?=
 =?utf-8?B?VCtyTmpyRXVZelJQQWdmemhYcTZxblBqNTlHaTZYSk1QSE1JM2V4djhTVHc4?=
 =?utf-8?B?N2pmVWpNeHpwNDdpcEx6VDZzR3llREpFdlNCOGFFYkVqRGRtaFNyckE3Mzgx?=
 =?utf-8?B?TytyQ1NldjV5Zm4zYVBlQUJMY3A1bW1kdlFJK09TOUQ5WDh5QzZ2L0hxaWpa?=
 =?utf-8?Q?kRruhBl35FDi6xKmcwPRVHeDR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c283f1de-a238-47ce-f406-08db003663c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 07:16:20.8151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdi+R+6vBr6BIgUmmRmGqktKWUo9rmzKerOkXuWjVGWwHVYtDDpwl72+MtP6B1PymyWWMon45faBRmQTaOdxkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8608

On 26.01.2023 19:02, Krister Johansen wrote:
> On Thu, Jan 26, 2023 at 10:57:01AM +0100, Jan Beulich wrote:
>> On 25.01.2023 19:45, Krister Johansen wrote:
>>> --- a/xen/include/public/arch-x86/cpuid.h
>>> +++ b/xen/include/public/arch-x86/cpuid.h
>>> @@ -72,6 +72,14 @@
>>>   * Sub-leaf 2: EAX: host tsc frequency in kHz
>>>   */
>>>  
>>> +#define XEN_CPUID_TSC_EMULATED               (1u << 0)
>>> +#define XEN_CPUID_HOST_TSC_RELIABLE          (1u << 1)
>>> +#define XEN_CPUID_RDTSCP_INSTR_AVAIL         (1u << 2)
>>> +#define XEN_CPUID_TSC_MODE_DEFAULT           (0)
>>> +#define XEN_CPUID_TSC_MODE_EMULATE           (1u)
>>> +#define XEN_CPUID_TSC_MODE_NOEMULATE         (2u)
>>> +#define XEN_CPUID_TSC_MODE_NOEMULATE_TSC_AUX (3u)
>>
>> Actually I think we'd better stick to the names found in asm/time.h
>> (and then replace their uses, dropping the #define-s there). If you
>> agree, I'd be happy to make the adjustment while committing.
> 
> Just to confirm, this would be moving these:
> 
>    #define TSC_MODE_DEFAULT          0
>    #define TSC_MODE_ALWAYS_EMULATE   1
>    #define TSC_MODE_NEVER_EMULATE    2
>    
> To cpuid.h?  I'm generally fine with this.  I don't see anything in
> Linux that's using these names.  The only question I have is whether
> we'd still want to prefix the names with XEN so that if they're pulled
> in to Linux it's clear that the define is Xen specific?  E.g. something
> like this perhaps?
> 
>    #define XEN_TSC_MODE_DEFAULT          0
>    #define XEN_TSC_MODE_ALWAYS_EMULATE   1
>    #define XEN_TSC_MODE_NEVER_EMULATE    2
> 
> That does increase the number of files we'd need to touch to make the
> change, though. (And the other defines in that file all start with
> XEN_CPUID).
> 
> Though, if you mean doing it this way:
> 
>    #define XEN_CPUID_TSC_MODE_DEFAULT          0
>    #define XEN_CPUID_TSC_MODE_ALWAYS_EMULATE   1
>    #define XEN_CPUID_TSC_MODE_NEVER_EMULATE    2
>  
> then no objection to that at all.  Apologies for overlooking the naming
> overlap when I put this together the first time.

Yes, it's the last variant you list that I was after. And I'd be okay to
leave dropping the so far private constants to a separate follow-on patch.

Jan

