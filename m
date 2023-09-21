Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5167A9229
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 09:38:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606128.943877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjEFF-0006hf-9N; Thu, 21 Sep 2023 07:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606128.943877; Thu, 21 Sep 2023 07:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjEFF-0006eX-6S; Thu, 21 Sep 2023 07:37:05 +0000
Received: by outflank-mailman (input) for mailman id 606128;
 Thu, 21 Sep 2023 07:37:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qjEFD-0006eR-5X
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 07:37:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a75f45e3-5851-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 09:37:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6927.eurprd04.prod.outlook.com (2603:10a6:803:139::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Thu, 21 Sep
 2023 07:36:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 07:36:31 +0000
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
X-Inumbo-ID: a75f45e3-5851-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdWf4BHieZ2OqOT2kzFKIaOex5bYKJA3vxYKvA49c90aNz+9WHpiBoo2cpYPQJe8g/n/3l8P20D2imIPs6y3Mcxn/V2h2gIQDPHi3NdBVXf/HLlUwXTEEhl4lN72Shsu8Gc9go2wu01lbBZazmAvw0UH8es0eaj45rrAB6ufzMH2meGXi/9ad0b2PrOh8HCYBI9D97Epy6ioqGMTEWbW1wgMRxBLMyptB9Q/+JLpXnA/jlNmt4AiF80IOyyAH2Nh6Vn/gvVzUE7tzZEroaSek5BLjaKlU9q8Etr1nbWlD8gGszmuwfy86YRPPpem0dqyrL1dBAroJ0Jg4KOigPtWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU1qO2VbaqWuw6po3P6mtmQRTlrEIuuh7T5grhPhVw4=;
 b=lTg3iJJ3vWUJs/LTorayJMMvIHfGFrgBYj3/SLczJo88sGN+ldUqRleD+x1Ti/m9dxNONcppxjlXWkwx5UNuSPDgWdL4BAZdOwimrktpFRTvZ6KlnjhT4u0WRJdJzd97NTJSwf+01Q+GMBuET497d2FYrojoFivGK2j+GYkYl9yxCaVXrDpiH53/Lg/MGKYigebnmC/EGbwiESzknIXiZQoYj+kXYTra8MA5enFdRUwvDMjBK39W+DCmETSb17G1e6S0dJNsCrMoP9GRoNI0+gzxEcLSez3LlE8orem5hTGDWeb8XkCNkbWIvUnA38vJh7+lCKwhTovi9LnNpU6Rxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU1qO2VbaqWuw6po3P6mtmQRTlrEIuuh7T5grhPhVw4=;
 b=YanMeMl03CSyie55Df4BRA1HKLaNr86DOuCXZoJJGGP3970SZx6wL2hxs0ji/nEuNEab+1LVkn91WULyNykoOe0EYnj43zSzBil8UW9qasjGjGw6dciq3T3sFjYUEKNtyzRLGC9akeZjiG3S+SW7bs8UHPSC2AoXDBPcd7NMFGqzAknUTbKKlcKXra9IosykUb2RBm4WDu61SoAFZxE0ALlV88OhPc+dx9Jf7QKlyl4yE3hp0z6DL3lLgY7hacvTzZ6FNb/ooW8rXfZrS5gFPdpsqwBQk2Pg2Bo2xwPQd8cCXi+ud5m69sY/9pbJkkDxyZRWHJVP1JXF3H6hJB1/LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1fa2ff17-08a7-42ec-375e-783efd2a71c8@suse.com>
Date: Thu, 21 Sep 2023 09:36:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 0/4] ppc: Enable full Xen build
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 xen-devel@lists.xenproject.org,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1694717278.git.sanastasio@raptorengineering.com>
 <d3f04552-28d3-8745-3def-b7c341f8b76b@suse.com>
 <daaff015-6da1-8daa-d8b3-3618c89bc799@raptorengineering.com>
 <CA+zSX=a6U5Ox-uS8EO7A2c4QPF06Ua007hCkyimwU-nKdsnxbQ@mail.gmail.com>
 <CA+zSX=arnS5deiNgHcV2SpGRB9B+nQy8eE040YmxUAotSJ-=iQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=arnS5deiNgHcV2SpGRB9B+nQy8eE040YmxUAotSJ-=iQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b2a7fae-74d9-4053-d7d7-08dbba75793e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AftPAOSVvnR67eGF5/Y++KKKvzK8l3YK7Pedm8w8HeV1SwmWxC1y02CnhrR3lsNZbRlWgN/iEj3e+5XfxGhKqUDFfJsYRJktG1yvOA5cCPC+HT3FJG6Ktx6XeTkR8Fyrc6d3hCGRUYWhzk9vA8NU6EGy/A5GuiOG0Za33o47/OGdykibtyTwWpHfeYq/kHk24Rxg89JelU9o59qJdFdMsoLKSViqWn5SxB32tfuP/l9+phLogquxsHpLON8MbC7AMSd4kEmF7H6Wo1a/wbnf+wC24ILP8ImW2S6eUNRT6GVFI+CR+ZpvT0nYTseFqVKxAopLo+2GlqOlhXcPG0AP7axDO9Xsct0hP3Fy2NXDD8j+UGqURGWN/49YPzX5nTIRaAJxr5269fTr83iXmVPY7+k+dnI+ZW0iaJw4TPRjnxXkOiRxeed+JnSRLRTqktBuc4R6hTPW6gbZA07jIKhRbvrGNN/WDOtELvCk3Iogfh7yFOKnE7NKlVO3Wcv2R6eoYfjv5IFH/mKgC7clZeLaa24bECPGF13l4mw9/sb8ctrjI48dmwTLeP3ioao8qylx5AdHpmkmaaSFyqwyNsgZsM8YRZ6Poz+nrSXU/OcO6ddZ0LhS+4oBynMx6zsOjJ5fvIBC3IApvCTKDoC4ENoJrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199024)(186009)(1800799009)(31686004)(6666004)(53546011)(6506007)(6486002)(38100700002)(86362001)(31696002)(36756003)(26005)(2616005)(83380400001)(478600001)(5660300002)(8676002)(316002)(66476007)(7416002)(41300700001)(8936002)(6916009)(6512007)(2906002)(4326008)(54906003)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wi9YMVJBZW1wZnYwUEtFeStsSWdZRVZSWFJVRkhJd0oxeFZsdWdiN3FkQnY3?=
 =?utf-8?B?cHI3dVplUS82dHpSeGZXR3pVUFhmOW9CSTB2aThGWXBQY3VYZFN3RDdIbGFL?=
 =?utf-8?B?ZHQ2ZkFQajFIcnNlZ3lGeEtWWW5FbFExazY1eDRvL3AwaHpBeTl6RzVqTDJD?=
 =?utf-8?B?cUpaT3lRWXFCOXk0eVhZVEJjZ0VoWEt0bUhOY1UwRkRFRUU4aFl4dVltTlVQ?=
 =?utf-8?B?M1g4L3J3N2ZtNkh1Z3M0NXRMZ2JWWFRmNkQzY0ZBZ2I5dk9uM2pzV0xrWEJ4?=
 =?utf-8?B?bG8yZ1RDTWJ2aDF6bGpYanRvb1N4Z0pmQUxjLzdsYjRSTXRVR0daQTQybmVT?=
 =?utf-8?B?ams3aExJa3VSZ1k2dVpjNHNnYUtoWTVUQjZGVVBheXIxNEVUdmlzbFJvMnZl?=
 =?utf-8?B?ZDMxVUhPQVFLa252a1RON1hJeFVnWEJHdmVKMzJVZzZjK2k4N0xrMkhMRjls?=
 =?utf-8?B?NStvK2c4QWZGQ01BSlNjSzk1Q1FqUUpMQU1pYmZwVllheGJZUTc3ODREUnE2?=
 =?utf-8?B?K0V0VWNFOUVQMUtyWjIzM3pHY00vaSsvd3F4VS8ydFVMZm5nKzJ2V1ByQXN0?=
 =?utf-8?B?OEhkZGw3Z0dSUHFoWlRsbnZWRFdua3JzSnZuWjhwa2tyeEdLUFpoMnZJendy?=
 =?utf-8?B?ZGpEVjNHR1doSE1TZXZSMmhmV1ZjVDV5eXlxVUl1bVhhb2F1Z2p3QW1hVFZp?=
 =?utf-8?B?dHJHMjFmWWtFRXl0WkVCWWwzSjhQbGFvbTRyTTlhWUFIcmRLZ0dvTzRzTDBR?=
 =?utf-8?B?U2EzVnh6RHNPRGpERXhiamZIbkxqN1A0cDRIcitFd0NwckcvRk55RFBpUnc5?=
 =?utf-8?B?S0ZQek5YZ3FaUk1VZE5YclJYS0dZUDcvN0hEWEdpeHV1VGcyNFYxeUordnpw?=
 =?utf-8?B?dGFPc1l0OVB4UmdQZ1JYUlBlVTRMWWF2cmhRRXA4UWoveHh6VE01aGdzN2lF?=
 =?utf-8?B?dVhOU2RRclJxWmhZcmVEVmozWEZuNk5mRThkMVF2VmpobjVvOGZiMGp4a3k2?=
 =?utf-8?B?QTBKQkhxblB5ZzVDL2lSa3J2K3R1dE5iY3BVdkRmUFpULzVHc2h2YUp2V0pY?=
 =?utf-8?B?dzNUeWc4WjRpU3ZjRVYwTzBiZnZ2cW43RW0rR2VDUFA3eTN5U3JFQVRCbE5h?=
 =?utf-8?B?NnlweVZPR3ZGUGNIWTRqbjFsTzJSYTJ6eVBsT1VVSDZGZ1VTb3JWTHBRTGxR?=
 =?utf-8?B?MFlXSkVlSEdxZEFGVCtIQ0N4ODlOUFg2cm1UbWJrYW8zMDNxRktXS1VwclAz?=
 =?utf-8?B?ZjRwTFhjcWhDc0RZZWVBYVliSDR4RSt3bXU4RjJpcHpDZWhUZHZoTzc2WWZn?=
 =?utf-8?B?YmZoeXdGREFCdzNIcXRXeHFuaEMvaWNES25aY1M1U0JheWRKeVpyaDdSR21C?=
 =?utf-8?B?bnFRUWlDNE9ZaU1jcTJyRjQ1Z01vVTFGZXI4QzJwZHNsM0tqbFY5MCtraEtM?=
 =?utf-8?B?VmN5YldvYjMyb1RHYlVNOVhwNFArS1drM2U0Rnl5L2xUZTRhMjNiT0FZamZu?=
 =?utf-8?B?a2drMkMvUk53cmxLaWUzUDVBVkJZb2J1Wm5MaFVzOXdWaXhvdE1peTZFejBZ?=
 =?utf-8?B?SVRIYmZtUmE4RUR2bDAyN1FLY2x1WXh2Q1pKUTUwUmpJcWU3bkFnTDlUUTd6?=
 =?utf-8?B?VjRMbFlEQ2RHa1plRlJhSmVac0U1dkZDT2tjNmZ5VDc4YlNyVXkwOE1DQm5T?=
 =?utf-8?B?dG81UGYzb1JrTEVJajdjSlJoZ294Q21hblEyYmpLL1U5MGUrYjhsUmF4clhB?=
 =?utf-8?B?SjhKTHhySXdoSjJZSVorNyt3S1RtWnd4emw1alQrellzWVlDTHdYRXJLTUJ2?=
 =?utf-8?B?M3hLSHpHeTFENW5QTXRMWlRlQUNMTll1WFJ5UlpKWDNncVhnQmdxM3ZvOHRH?=
 =?utf-8?B?S1ZDS3J0citBZHhVMy9KZ0J6RDg0a0ZhY2p1Y05DdU5Id2daMGhCMklVZjFN?=
 =?utf-8?B?MEpuU0RDZHI5WUk4Nms3UXZyWW9zVzg3VG1XUkdXL3dCencvWnhTVkNGWkpx?=
 =?utf-8?B?VVhuQU50K0RzR3h4WWhLcjZWQTcwL2syWnpFem1ld3JVZ1RwNHBVRU41dlkr?=
 =?utf-8?B?bEFIOTdjYzRTWXUxLyswUnFLOEdFVytIZHpPVXNLejRvZ1dTV3c5K1BkdmdT?=
 =?utf-8?Q?/SZEVDBsY9ZFcv8YzPM3r6aNn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2a7fae-74d9-4053-d7d7-08dbba75793e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 07:36:31.2952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aa7aftCSENB1eCu0biOfAGqgNYMTYoBVDql6Tqdf1MNRjSc/oSsXkzqZvXwwKYHeHsIMU/EDrNVWBkr+ha2ARA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6927

On 20.09.2023 13:04, George Dunlap wrote:
> On Wed, Sep 20, 2023 at 11:59 AM George Dunlap <george.dunlap@cloud.com> wrote:
>>
>> On Mon, Sep 18, 2023 at 6:27 PM Shawn Anastasio
>> <sanastasio@raptorengineering.com> wrote:
>>>
>>> On 9/18/23 8:19 AM, Jan Beulich wrote:
>>>> On 14.09.2023 21:03, Shawn Anastasio wrote:
>>>>> Shawn Anastasio (4):
>>>>>   xen/ppc: Implement bitops.h
>>>>>   xen/ppc: Define minimal stub headers required for full build
>>>>
>>>> Compilation fails after applying this.
>>>>
>>>>>   xen/ppc: Add stub function and symbol definitions
>>>>
>>>> Continuing nevertheless, linking fails after this.
>>>>
>>>>>   xen/ppc: Enable full Xen build
>>>>
>>>> Things build okay for me when the full series is applied. Generally we
>>>> wouldn't deliberately break the build between any two patches; doing so
>>>> may be okay here (except I guest CI's build-each-commit would be upset),
>>>> but I'll do so only upon explicit request (and with no-one else objecting).
>>>>
>>>
>>> Sorry about that. Going forward I'll take more care to ensure that
>>> partially-applied series still build correctly. For this series though,
>>> if you could make an exception it would be appreciated.
>>
>> What would be the reason for the exception?
>>
>> We don't want to follow the rules just for the rules' sake, but the
>> rule is there for a reason: primarily to keep bisection working.  Not
>> sure of osstest is testing the PPC build yet, but if it were, then
>> this sort of thing would make it more difficult for the automatic
>> bisector to find regressions in other parts of the code.  Having
>> non-building patches can also confuse "archaeologists" -- people a few
>> years hence who are trying to understand what the code does.
>>
>> Is there a reason that this series would be particularly difficult to
>> reorganize in a way that would keep it building?  (Haven't looked at
>> it in detail.)
> 
> Sorry, didn't notice that Jan had said it "might be okay here".  Jan,
> don't count this as an objection.

Just to mention it (besides the fact that I did the commits already
before your reply) - at this stage I'm not sure bisection of PPC alone
is particularly important, yet. Hence why I said "might be okay".

Jan

