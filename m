Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC7F677680
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 09:41:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482688.748325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJsON-0003it-Qr; Mon, 23 Jan 2023 08:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482688.748325; Mon, 23 Jan 2023 08:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJsON-0003gJ-O8; Mon, 23 Jan 2023 08:41:27 +0000
Received: by outflank-mailman (input) for mailman id 482688;
 Mon, 23 Jan 2023 08:41:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJsOM-0003gD-Kk
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 08:41:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8195672-9af9-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 09:41:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9399.eurprd04.prod.outlook.com (2603:10a6:102:2b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Mon, 23 Jan
 2023 08:41:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 08:41:22 +0000
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
X-Inumbo-ID: b8195672-9af9-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRoso7ukkMjRvm7Q/htS97DNtL7Xdg+5cbLedE8zrypMg19Kc8zGU62wYPARZJTprb+BWHRPLrWG+ZhkSy7POrkCIHH0bekXYau+FVvvNuC7Wu1Mh3cJamYNmMRg/7Ve3+HxEgfpuveaKGKAGXrbpb3LKnRlBHet2dYMqC9GgqIxy7rbbb4sIfThLI3szw/q3mvwhmZnSzNZ5Uqu73aGBnY2sjtwTeVyhyPcJu6Vbu4KsXa4V2x/FyVMKmrKc4pwQxE3Q7sHM1cL/SBdmm2m1k4X/tjB540To8yAIouyriLg/O4jwDnHI2+5fcCaSEm1AJDo6Joy3wnu2SO2NwyLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YG1T+TYun78WSMhRDDopvvtxl8H4dbRCAs0zMaay1Rw=;
 b=SMh0mStV3SzWzkImGgwitvFIna6Ua6p0t9EJBgi7D1LMXxGg7SofFM/7lHEizQo5gH7Aob44alXIUe7EOkVpd3rB8R/eijniN4JRoHo3sr1Q1SGHH6Vs9NpvjmyV+mK/mx0Dd5K63OT+rFxngytzozJzZiQBFQuQi0TjrkyAzuF+x5w+sDTpve+oWEL4Y1Jp9T3tbDlmvQPsL/kTdlyG00l/NsDf90yAZRNhXJyzytbemMfNV9SLUhArqE+K0HykIKCyupiw9C5w5DfiGCnWdNJIz5L3GzYlrV36BEGJg4LYgS3pMTELsE7p0nab7hP18Z4qqrjRGn/4Q0ue4yWkGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG1T+TYun78WSMhRDDopvvtxl8H4dbRCAs0zMaay1Rw=;
 b=oAuEGARU/Qj1bMyMISippamv4VSBLtO9r0rFj6BiTiVVfAnl4ZesDe3raxYjw5gfbrU/AV2CWPwZJTrFegIBhlXKpVcI9vZo+tbPCIoau49ox6yliFvxZjsyCcKzSDKWqslXyKjZAz6WlASGRyRYGiWtqKAoDJnaNF1hUVrI+baa3ysUSel95QxfNVcgPLftzXBdZWz6LCqLeuOQj7FFka7qQTYNRU2bWv9u7Y/rkSwc8c/bo56CY7zx/h6KXzB6iiL3P73Stv4X5kXNObmL2HqM8OOPunjgr8zQ/yF5AZpA4uvb2NIklBQDxpn81B+hY9vt7UxBaRaFYZGFB1CeZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8ca4781-13ac-add6-1ae0-558f8d0da052@suse.com>
Date: Mon, 23 Jan 2023 09:41:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/9] x86/shadow: replace sh_reset_l3_up_pointers()
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <d91b5315-a5bb-a6ee-c9bb-58974c733a4e@suse.com>
 <CA+zSX=ZVK_7xpgraJyC3__uORqXo8F9Atj9gCF+oO7OyfRrtYg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=ZVK_7xpgraJyC3__uORqXo8F9Atj9gCF+oO7OyfRrtYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca99d1c-bbb4-4783-92d5-08dafd1d9ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8cqhio7bep0c67AtG0bAvGKsKj/KZwLXaYP+XDRSWXRlHxkW2aaCE4sUWbUjSoZNu46MNlb1q+mDEd0L8/rcYVSRxJC69e0Lrls7PBeN5SRZwIETZH8VFmI9faM9SLYmGuvf5JOiQDFG9kI8yXddXDZZ88Dfn8p3KavzVNIgWuCF9ttwXujOW9xEZz9YNXJemROY14kB50VkHl2RxDQNQKrRdLLoQXK66ve77AjQ2C4ENdRk1QZKJPeXQXc1JOcYLA6Ym+l8uEBP7/ve6pEJXTnK9/0vZOo+3xWQJtIl9bao7wf+DAWdKKhgBhl8OXY3iloFbcIfUgPvQ3cnlXsl8dCksM9C/EGAtIBsYEUjHs45oqT3rysHpAgGAd27dlLwW4IhqEbgdUHZDVQfPBuwt3FTyhZlmmlw816fReFnusrGss6v9BnaLJiyqqkIKbE4Kv7dJgEI5+yUc1xzucPutm5yh026RUbYgeOpIFSvwLGzgR+6tYxgsPNFN3JoLWUHXUU8P3XsnP2skOTQtC+2jQoyCmSpvyp5nDTzsh4yLUPvni8/unWUNhpSWCMXxkdmkoNp4cUQBhlvdJjp9WdaYy8lWnRHEI6XzhImaiXkLOu5iIWnjpOgNAxBb780r/NY1rKV2uiT+0IjkeyySWuFdrW5dpJ+VQ5P4Zt0//36T6qqmT4Iu4p6RKwPm3mHFVStTGbFFKmfXBrV144m36Qj+KgKP+o2d9dVLFd4gu9hyls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199015)(83380400001)(31686004)(86362001)(54906003)(5660300002)(6486002)(31696002)(38100700002)(8936002)(478600001)(6512007)(2616005)(41300700001)(2906002)(316002)(4326008)(6916009)(36756003)(8676002)(186003)(53546011)(66476007)(66946007)(6506007)(26005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MitpakZCS21wdVhnMGRkTkVmeVVNaUFZTkYzN3NzOHFJM3JxaFhpZzNvYnRH?=
 =?utf-8?B?dHFPdFp4R1hXaFhJN0w5SDVXWklsL1dRWDBJNzdBMVllNittQ3ZJd090VjBY?=
 =?utf-8?B?ZmhMTXlpR3VFYTdEaTJhNklPRE50YmhKL0UxalQxZ081NkJjNU5qYXVsbXc3?=
 =?utf-8?B?RTRqVDhYK3ppUnlnbHBraXlFZVltcXBQYnNSVEpzbnpaMEV6L1o1TC84Umpm?=
 =?utf-8?B?LzhSQ204VDR4TWNKSTVlWTl1Uk9BRWJQSGhGSmZvcSs0MEJxeEpiWjh3NEgx?=
 =?utf-8?B?WFNLYThpRHpkWGd6eTNZOFJGZnVlK1NCemNkbXJGRERSblVQZE5KL1lhZFpN?=
 =?utf-8?B?N1RCWENvSFdDejFJdjIrcWh3R3ByL1VYWFFxaVRqQkZUdmVQRDZwcHcycDNZ?=
 =?utf-8?B?WXZNTk0xbXJvN3dNb2RHNEFwc3hFcTFWTzlTK004QVZKVmx2NG1HMU5udU02?=
 =?utf-8?B?L3dZUzM4NytjeW9HNzBoRGltWXB0Q3BLbjZBVE1aNC9EeGs3MUJyU1JtSlRT?=
 =?utf-8?B?Zys0Y0gyWTdSOUpKVFJFaDQ1aWdteVNGZytlc01XSm05WmV0QUQ4SVJUUXJC?=
 =?utf-8?B?QVhOOEVlRkpmVnp5VmI5N2V6WXErMHl1NWVlajVuZzVEVi80YlRIRERzcTZN?=
 =?utf-8?B?aFBOQlpjOXNNS3hkbmYvQWhraDV2Zk1kMnhOWDdnb3RrcWptMEEzN1k0MHFH?=
 =?utf-8?B?QitTaklSYmNPRUZOOVd6THhCSzNjNlJZZzNiK1dXbFhNd3pUL0N6aXpmMjBB?=
 =?utf-8?B?L0h6TUdhUG1janh4bHZlS1UwOHJSd1RwM1lubXdhM2dHUjVIUTdhTWZDTFVC?=
 =?utf-8?B?d1VCL3BJeTRwdzlScUFHcjFyQ2dvbnVjejh2YVVqYTZHTVBHQTlaczIwVlVF?=
 =?utf-8?B?c3BTaDROSi9TbC92SzBUOUM2a1U1cjFIMG43S1pIWS9pRVBrelFVOGRPTFgr?=
 =?utf-8?B?N2FHMHdjUmlrMy8ycGw1eUxwT01OSUM0QVgzNjNJME5XUHc2aTVYUm8xNCtL?=
 =?utf-8?B?TEdOWk9HemtjWHhjMHQyKzc2RkVIYlM5RzVHV09nL1ZMWW5JT2Y0a1ZVRytT?=
 =?utf-8?B?M3gzQXdzZ0xlQmtFSmFQUmFTNTFTelBxSlEvaFI1VWxVZVB3U2FkQkwzNEpZ?=
 =?utf-8?B?anZqKzIydkJuL1NlTkE1L0s2NzdRUkEyazFwWFF4QXNZZzFsTThvVy9LS1Jr?=
 =?utf-8?B?NWxhTWFxR3JKNDRGZkhreTFZS3VJZ3NMVUNQS2RGZnB4UXJZV2NmSk8yTkZU?=
 =?utf-8?B?d3VoN2c3ZmhZcDBqa2R5VFhrRUx0ODVEZGRyZjVxaTZ0NXhrUGd4dEdEdVlh?=
 =?utf-8?B?Qi96QjY1M3htTnBkbXFyRkNneWIwejlrbzVNT1gyektwM2RYK2lkRVU0ZXBt?=
 =?utf-8?B?WXJraXdMODJRSk0wSUFCNHE0eFF5Z1NyV2NSNk1yZkVSbnVJdEUzSHdGd1pE?=
 =?utf-8?B?QSsyZ2pRZEwxaEY3ZVV3TlpNWXd1UnJIWExuajc3b2dLYXJ2T2pxYk0wWDlY?=
 =?utf-8?B?M3NwVGIyTlFCbzZ0aVlkeFQ5aTkrSlNmU2RSdHhtRjB3TnB2dlVSM0VPdmZu?=
 =?utf-8?B?VVpDSWdiaVY1eEptcS9KUExzV3ZPcmRIZm5kU3dwdjBvdXFVTU8raTY3WXZ2?=
 =?utf-8?B?VUxzM0FhVmtaTmVKdFFCU0FXYlhJc3R5T1drQUs2eXV5S0pnSVZoTUpCTGF4?=
 =?utf-8?B?U1EzaXNjVkFOTG1KSi9NM09pWXFnWXZhT2ZZb0RzZnJHQVBOS2VMZlcyQ0o2?=
 =?utf-8?B?VFFuOU9PQm1WN1RxdXBIcmlObnh0QlhQRTZrR0dYN3I4U25ESXh3NnVpUkc0?=
 =?utf-8?B?WGlCeTZ6K2MxUk94TFh1RDBEM2NwVWVFaHE3Tk1UeUlTUWFtNHp2WjZCakl3?=
 =?utf-8?B?S0ZlVEhWKys4ZitKaDcrT0FqcXZFNy84RGRrSTBYbE5aREJHWStWT0w0dTc1?=
 =?utf-8?B?TnUxUUVqT1V6Rm5OajVncWo1aHVqYjlJbGIzVGFUMERQTndsb1VBOGF5Z1Zp?=
 =?utf-8?B?T3RESkp0aTU1c281NkVTYU5pa0VzRG5SaEw2dERndkZNd0Ficm1pRTJNZFUv?=
 =?utf-8?B?UkhycUdKdzg2Mk56WFEyOTIrY1IxUEpyU1Y1RVhSZ0M2YmVBMVFUWFVKU0JH?=
 =?utf-8?Q?JSDVDFoO/YdsmdVFVN/60Q73g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca99d1c-bbb4-4783-92d5-08dafd1d9ab7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 08:41:21.9509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P775tVfYeSpI1QQu0KoT9LX7gnzBUd7kHDdGCbZWx+tNfRdQOPM4dKZtNfXt+lMpQAOG8EI2PoKolbFSiNWmKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9399

On 20.01.2023 18:02, George Dunlap wrote:
> On Wed, Jan 11, 2023 at 1:52 PM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> Rather than doing a separate hash walk (and then even using the vCPU
>> variant, which is to go away), do the up-pointer-clearing right in
>> sh_unpin(), as an alternative to the (now further limited) enlisting on
>> a "free floating" list fragment. This utilizes the fact that such list
>> fragments are traversed only for multi-page shadows (in shadow_free()).
>> Furthermore sh_terminate_list() is a safe guard only anyway, which isn't
>> in use in the common case (it actually does anything only for BIGMEM
>> configurations).
> 
> One thing that seems strange about this patch is that you're essentially
> adding a field to the domain shadow struct in lieu of adding another
> another argument to sh_unpin() (unless the bit is referenced elsewhere in
> subsequent patches, which I haven't reviewed, in part because about half of
> them don't apply cleanly to the current tree).

Well, to me adding another parameter to sh_unpin() would have looked odd;
the new field looks slightly cleaner to me. But changing that is merely a
matter of taste, so if you and e.g. Andrew think that approach was better,
I could switch to that. And no, I don't foresee further uses of the field.

As to half of the patches not applying: Some where already applied out of
order, and others therefore need re-basing slightly. Till now I saw no
reason to re-send the remaining patches just for that.

Jan

