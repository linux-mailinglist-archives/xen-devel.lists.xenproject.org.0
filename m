Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2A37D4768
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 08:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621684.968390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvApo-0004dS-Qq; Tue, 24 Oct 2023 06:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621684.968390; Tue, 24 Oct 2023 06:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvApo-0004aw-Nv; Tue, 24 Oct 2023 06:24:12 +0000
Received: by outflank-mailman (input) for mailman id 621684;
 Tue, 24 Oct 2023 06:24:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvApn-0004aq-8H
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 06:24:11 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f055c1a0-7235-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 08:24:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8204.eurprd04.prod.outlook.com (2603:10a6:10:240::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Tue, 24 Oct
 2023 06:24:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 06:24:05 +0000
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
X-Inumbo-ID: f055c1a0-7235-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbcXEVcwlI9fxTSRva19OyJH+0xPprl81U+lsr0cXzbtadHAiU43lj8Iz6UpdeFOxv0YvP56Jri1a85HPHqx64Wn446zA41+rjH4ijKkApfviIV1XKQosjmCp/J93mj3LhKfAB1A150kzu493g9KEkQTgsMgn8Hd360EkTalneN0jn8aK6At0pyx4n9Q7082ko3Kiaw0Tck97v4s6tbwHi9pI3sLD2RplDNprtGnskrgOaTC9d49ZbrxptfyXRFwBLJJj5o2CNmMwpi5MWAtgAZm2H8Qqt+Zd+VCwhJCxGdAFCwAizsf4PmscJvbaG8RDkZGUF2w05LLaNXhpjizSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gbi3bygsySLmMIR0bcT6nV7Uhwyr+6lW+HdNN7uD0gQ=;
 b=fuaVV8yIiILNol1XJ+rhLaS3dlPH8B+nD2FxxywrITYDCSB2nP7FdF2gDMXdNFWv7QdW5XsXdsk6S9o+3MnSR/yKIujQ9jvkxIPAiA/Ejsdunwr76UqyWgDngSGYlnOsOj+bHvEDFVWzoaBYdROWnSOtf9FXJl94UqAi8c8RK5/646jfePSz4/N2jvF+KhpqBhG1OlJOw85f5C+/hQl5CaLo5gs72xwpEV69k85e3zb3n6tdxSBZgPLinWhVYCmE9KqYVyCeeGH+TnOpy4DLPUQdc1kaEilbq6D54P9afRybtkcqrneODqyXbGTaIOClmZ/7YhkMvh/+bbCCGTR5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gbi3bygsySLmMIR0bcT6nV7Uhwyr+6lW+HdNN7uD0gQ=;
 b=bTuEKZyKf9wlkrc6iud+h4UDg3h+o7IdvkmwphMk7f/diAMFq9p700Cnmbb9ZZ3rHgpNzonmrScvNJ4NmbG0E8hcZTCgywGYOkUEACpw3FY5df5KPe4E4s0rzXAedBBwcBoUUGtiiP03/nx604s3rVJvbEEPtQWTisUsFJcF7rCQD/bLaGoRDyIrkbxPsIaI3ggj21xL8D+tWd9u8Wuoi6E6Ro0936K+JCMS+yNgPwsI5VAUZnkcs9zm32sfXHVSJIyffhWT62puYDmUMN38gKWUdesIxv2saE9NwkVPQDWBZBd4VBQ/ebZG+Cq7e7u80iOLjmodmyb6IFEvwjLPVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f8141e2-c55c-2e58-a078-d5d8764a02df@suse.com>
Date: Tue, 24 Oct 2023 08:24:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 3/4] xen/include: add pure and const attributes
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <fd5421162a00aa782e0776324ff6497193c1e3d3.1697638210.git.simone.ballarin@bugseng.com>
 <89778285-5cba-8fb5-70bc-710b6dd30a10@suse.com>
 <0032186f-80c7-4dba-b46e-10d4a8e2a8cb@bugseng.com>
 <e8bf9817-fd54-9bf4-4302-dcee682f9172@suse.com>
 <alpine.DEB.2.22.394.2310231417260.3516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310231417260.3516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0376.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e5d4ed-7240-44be-2da8-08dbd459d2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C0g6WD9lTJKNxIA7+oydOAdM7KwFh0Foy0Aax81h5DGkl0PEF9Jq4I62d7AXZOVrTFoUhSFNwLHqB4qm7vxjr1H+kNeyHNlMInRRt58lgedTVkEnA/VICtPxtPu8zpM8uHw+IKAVW+HBb/emMDZG1UbksAIv7zoOVJ1k6HjR9FnJN0tDq4TYUKxDk/fl9d/NjSE+o6uhW+aQLNwnvOVQYN3eU/hSW8sjs2MP+MO8EBF+nuvNV9bCv4nE0M5aNY7iW9jhpgGuOkQIf/47t/WO9s3wAZ+S1f3KJshAf0AG5idq3DPbkmzBNv1JahbhS/3gkhtMF8GwzNNSpVN2ae/27aU7pb13KM2YOXZFMM2fKgamQ3qBagHlAZG6BWvK7W5C+mB0v4BFsO0G8jNMdGdXHbm5/sgmgT1IPPPu7ezfkVcp+HXIcU2RZSsSj/bwjWPLM5eTx8c8ach/h2WV3GJ5wVhgAmRSp9vo+gzYA95/KZ3WhG45BgNmg4sRdF9ck4d/BYKNNccm8DVJYzUdOdJ/MWVn45AJmk7A+Y7Ku2gQlqbDEU15k2RHVqKCmPblGtnX544jkt4Pjr8oqjDEcmtrAq0Bvbc5NanKYAThuQRFAGt9hv9C+cDo7jUSwyH5YDXYJIU7y9xSEOND2om8SGvj1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(39860400002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(86362001)(31696002)(36756003)(38100700002)(5660300002)(66556008)(316002)(6916009)(66946007)(8676002)(66476007)(54906003)(8936002)(478600001)(6486002)(4326008)(2906002)(6512007)(53546011)(83380400001)(2616005)(6506007)(41300700001)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ti9kS2ErN3NKakZnMFJKZDdnaHk0VittOGt4ZmRlY2JUM2JBVStDS3RRcTRR?=
 =?utf-8?B?elVWTDZaRlozdGdNTjJYMy9kbVFFeUt6WEZzM2N4bVBLOUtuQzFoQnl6SHhL?=
 =?utf-8?B?MFBBN3dzNTdEWHRaQjZZWCtSTTAzOHFjRXJxUkNvR3NYTG9ib0lQR1NlYnF0?=
 =?utf-8?B?Z0xZbjM5bkxreEpOWkVhTFpNcnRLTjFRejI5aGNNa2JneWh3ZW1oOHFIWHlY?=
 =?utf-8?B?M015d3hEaVQzTDBnanFZb0ZFSkpJZzJ0Mm9QTzI1aldERHphK1o4clF2ZVlL?=
 =?utf-8?B?NTRVNnJ2enZ5YnBUQTJIS2JEeDBaTG9QWmJIUkJSbUw3OFFOWDI5TmhERE5l?=
 =?utf-8?B?VzVWSTh6VWt0L0l4dHlXNzhOY0VQUWlIMnNnWG1aRDUxUmhkTDBLdVpUT00r?=
 =?utf-8?B?QXE2WU4yME1FNkNGL251ZDkvMTJhSklDWlBEUlZwNkpSak1nQVRQYm9Ra2dC?=
 =?utf-8?B?Y0tZVTNQVzk5dmhWeWF0NllUSk5ieWtIVDd5aEE3SUpRSExaQUdab1ZsWTg5?=
 =?utf-8?B?bEJvTWxWRTEvYkZYVENBS2dtRi9XcFRUazdWU0pJMFk4emlMcnlXeXlzNHd0?=
 =?utf-8?B?L0lneU0xdHo4c2E4YUZEbTJFekhCQVBOWStacE9zRXZkc0g2NytOZndsWXN2?=
 =?utf-8?B?cDdtV3JoWm5TUnVJMjR1UE9INzJnSURGTGV1RllSQ2dBZy9vL3B2R2UzdFZM?=
 =?utf-8?B?V1hUSW50YjBSelZVb0l4WlJmVVFMOGhEYTBXeXZ3MHo5RjZKYllsaC9RbCtH?=
 =?utf-8?B?b0JXZDBUdGlncUtiVG9VS3o1T0lLSG5idlVqbXlVa2pCKytSNTBIOCszdWNX?=
 =?utf-8?B?RTZFMk11REFlWTdKVUFUS2lVam5zRUNmdWJnaVQ4WUJkakd6b3VPMHdUays5?=
 =?utf-8?B?cmFKYndsOE1ZK2xPMDVkM2hlangydlQxblBhWTBkMjVoUlpIS3ZqLzIvb0Ns?=
 =?utf-8?B?WmFqUGxMN0g2RGdIbTBPQi8rL1NHSWRqVUs1a1hmamFPV1RHTGpEaVZuZGR1?=
 =?utf-8?B?K3l4dlViVVF1WUNpRG80anNSWmpvNjNydXJPY0s0YmljN3ZuanhxendXMEVS?=
 =?utf-8?B?cDVPd1c3R085SVZORXJOaFN4cUMyRkl6QUQzTk5IeXhxTGpXMFFqNkdMVkNY?=
 =?utf-8?B?QzNYRG5yVGY1akdFMUNaczQ3ZVI1LzhDcmhVMThRZGhwU2lOYlpmdmUvVnpr?=
 =?utf-8?B?ejVYdGxKZVhGVW85WnVWZ2dXWURMTFNtRkNQSk50YWw5ZThZWGJrQjVQdFIy?=
 =?utf-8?B?bkVKTlZ1SEVOZG8zKzIxVzdGTjByb1cxYnBML2ZvZ0hKa0R6SVNudnliTEF3?=
 =?utf-8?B?RHBUZjBVSzg3alhzREdEZHBlNGdtUklqeW5pN25nRGRuWlZ6YXNTVFdLYVd6?=
 =?utf-8?B?NGJIbEMzRTNJS2FjVlRJQkMyNlRlTWtxWDYwWGZPcTdoaEdOVXRPY3ozSmpO?=
 =?utf-8?B?RElVT0FZa1phR2YxQmxXbkkzOUdIdUkzQWdnUDJkTDE4M1RLZDlRM25UVUVl?=
 =?utf-8?B?YVlYbFU5RkQ1LzQvK0lIaWxoSFhQUWJ6dzYyNU5wZTI1NE5CYWR2N04yUkNj?=
 =?utf-8?B?UzFWTjdCRGRBemhZYmJrd3R4VlI1bnZBWkJXemwzMGFSY0M3QW9YWU9sbUVB?=
 =?utf-8?B?ZmpJTzhzTmNPKzJaR0xVWjdtbUw0OG9aandiTnNoZHFXK3I4cmY0ZlA0Z2JO?=
 =?utf-8?B?UytscWVENi9oSmd4bzZWRVhjTlkxSW1lYUtXVS9udGJqZmlDeGF5eXlDZWF2?=
 =?utf-8?B?Y1ptY0ZTMElFNDQ5MWFFVGtDUmxpODJJNHZyU21GMExtV3VlZk5mK2pKb08x?=
 =?utf-8?B?eE9hYk9CaWd5L0RDNUlGUzBqa0xpdEY2VUp3WXZPWXl2WnVQSzZDbDhxM2t4?=
 =?utf-8?B?TG5SdjBvZzBwNkJvbWp4QkJkMmZsMGd0RXgrSGVrdjBjTzh5Z3N0Q09RQmNL?=
 =?utf-8?B?YVV0Yk9oVmNuQkJxTGRjSU90UVNRYzN3dkh2WGk5OUFTQlp5cDEwcWduM1NC?=
 =?utf-8?B?SDdEQXB0WkJPbjdHRmJicmlveVRqZ05vYXhFZmgzMEUwNXZwZThNQ09qVmFu?=
 =?utf-8?B?TXdEY2dUR2ZhUmdselNDaW1jemtsallZck9QZmo5djFtUCs4OVZqS3J5NXp3?=
 =?utf-8?Q?KW8ixDbnErtg7xoy6dFPhdqq9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e5d4ed-7240-44be-2da8-08dbd459d2ba
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 06:24:05.6784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFDaWR1/l8BF4FMkTvaKVeKsNW4GPrqpnmxwM2Iz9lyWjkOw/e4cVV0rgGNV14IN6b4oYJ0tHeoSFiuXjRkOkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8204

On 24.10.2023 00:05, Stefano Stabellini wrote:
> On Mon, 23 Oct 2023, Jan Beulich wrote:
>> On 23.10.2023 17:23, Simone Ballarin wrote:
>>> On 23/10/23 15:34, Jan Beulich wrote:
>>>> On 18.10.2023 16:18, Simone Ballarin wrote:
>>>>> --- a/xen/include/xen/pdx.h
>>>>> +++ b/xen/include/xen/pdx.h
>>>>> @@ -164,7 +164,7 @@ static inline unsigned long pfn_to_pdx(unsigned long pfn)
>>>>>    * @param pdx Page index
>>>>>    * @return Obtained pfn after decompressing the pdx
>>>>>    */
>>>>> -static inline unsigned long pdx_to_pfn(unsigned long pdx)
>>>>> +static inline __attribute_pure__ unsigned long pdx_to_pfn(unsigned long pdx)
>>>>>   {
>>>>>       return (pdx & pfn_pdx_bottom_mask) |
>>>>>              ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
>>>>
>>>> Taking this as an example for what I've said above: The compiler can't
>>>> know that the globals used by the functions won't change value. Even
>>>> within Xen it is only by convention that these variables are assigned
>>>> their values during boot, and then aren't changed anymore. Which makes
>>>> me wonder: Did you check carefully that around the time the variables
>>>> have their values established, no calls to the functions exist (which
>>>> might then be subject to folding)?
>>>
>>> There is no need to check that, the GCC documentation explicitly says:
>>>
>>> However, functions declared with the pure attribute *can safely read any 
>>> non-volatile objects*, and modify the value of objects in a way that 
>>> does not affect their return value or the observable state of the program.
>>
>> I did quote this same text in response to what Andrew has said, but I also
>> did note there that this needs to be taken with a grain of salt: The
>> compiler generally assumes a single-threaded environment, i.e. no changes
>> to globals behind the back of the code it is processing.
> 
> Let's start from the beginning. The reason for Simone to add
> __attribute_pure__ to pdx_to_pfn and other functions is for
> documentation purposes. It is OK if it doesn't serve any purpose other
> than documentation.
> 
> Andrew, for sure we do not want to lie to the compiler and introduce
> undefined behavior. If we think there is a risk of it, we should not do
> it.
> 
> So, what do we want to document? We want to document that the function
> does not have side effects according to MISRA's definition of it, which
> might subtly differ from GCC's definition.
> 
> Looking at GCC's definition of __attribute_pure__, with the
> clarification statement copy/pasted above by both Simone and Jan, it
> seems that __attribute_pure__ matches MISRA's definition of a function
> without side effects. It also seems that pdx_to_pfn abides to that
> definition.
> 
> Jan has a point that GCC might be making other assumptions
> (single-thread execution) that might not hold true in our case. Given
> the way the GCC statement is written I think this is low risk. But maybe
> not all GCC versions we want to support in the project might have the
> same definition of __attribute_pure__. So we could end up using
> __attribute_pure__ correctly for the GCC version used for safety (GCC
> 12.1, see docs/misra/C-language-toolchain.rst) but it might actually
> break an older GCC version.
> 
> 
> So Option#1 is to use __attribute_pure__ taking the risk that a GCC or
> Clang version might interpret __attribute_pure__ differently and
> potentially misbehave.
> 
> Option#2 is to avoid this risk, by not using __attribute_pure__.
> Instead, we can use SAF-xx-safe or deviations.rst to document that
> pdx_to_pfn and other functions like it are without side effects
> according to MISRA's definition.
> 
> 
> Both options have pros and cons. To me the most important factor is how
> many GCC versions come with the statement "pure attribute can safely
> read any non-volatile objects, and modify the value of objects in a way
> that does not affect their return value or the observable state of the
> program".
> 
> I checked and these are the results:
> - gcc 4.0.2: no statement
> - gcc 5.1.0: no statement
> - gcc 6.1.0: no statement
> - gcc 7.1.0: no statement
> - gcc 8.1.0: alternative statement "The pure attribute imposes similar
>   but looser restrictions on a function’s definition than the const
>   attribute: it allows the function to read global variables."
> - gcc 9.1.0: yes statement
> 
> 
> So based on the above, __attribute_pure__ comes with its current
> definition only from gcc 9 onward. I don't know if as a Xen community we
> clearly declare a range of supported compilers, but I would imagine we
> would still want to support gcc versions older than 9? (Not to mention
> clang, which I haven't checked.)
> 
> It doesn't seem to me that __attribute_pure__ could be correctly used on
> pdx_to_pfn with GCC 7.1.0 for example.

The absence of documentation doesn't mean the attribute had different
(or even undefined) meaning in earlier versions. Instead it means one
would need to consult other places (source code?) to figure out whether
there was any behavioral difference (I don't think there was).

That said, ...

> So in conclusion, I think it is better to avoid __attribute_pure__ and
> use SAF-xx-safe or an alternative approach instead.

... I agree here. We just don't want to take chances.

Jan

