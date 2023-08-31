Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D0E78E956
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593555.926554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbduZ-0003Mk-BN; Thu, 31 Aug 2023 09:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593555.926554; Thu, 31 Aug 2023 09:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbduZ-0003KP-7v; Thu, 31 Aug 2023 09:24:23 +0000
Received: by outflank-mailman (input) for mailman id 593555;
 Thu, 31 Aug 2023 09:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbduX-0003KJ-Fw
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:24:21 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20614.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28a4d133-47e0-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 11:24:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9134.eurprd04.prod.outlook.com (2603:10a6:150:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 09:24:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 09:24:13 +0000
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
X-Inumbo-ID: 28a4d133-47e0-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRHLl6yc329zWu6VWroqRbOqWdzffccRqGAJ+bPCMRt7v3DuOAnA9KZs4CUqIrFvbnfw2eZkTaleYbt9RRYKa551VgGhJ49YokQyRYBzy9v57OZ6DNCg1jI9d5cc3Blz6ddmV1dxxdL+bgFkblxu1sNY24O3HEDofw/9H6sfse3+TkKpdO5sDzdHPYqyAzZ9EmC958eJkBZGm14ukcYikP5rxuaCOO2e3I/MAynz1QDZ8/Ey0yozp1+d+YFsSlcsqji5qn1KP4S+viDJoLqmc7W8TvVXxS+md9omQpf7HU4oybUY9mkFTq1X3ZN5390clIgY2dCX+YqtbakcKmddwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQ0PLe+WtKPy3GfzvVjreGQH1XpqazgsXE3D5NO1w0o=;
 b=oe4ZRp67ZnE/Eh+e8pAII3EnNS2YJS1cLrrSwNI9EYQCakqpcZRaf4MhxO/trrSEoSkpgPOv5/yX3pby9+jJSS7eTJUTMQT9q8fc63fw3Egbytf9i7IkXAzD+nvULl5sV20q6jrecdplocuMY5BZQOz8LZXYKUBXYVBzVDmWV4nlryjWvzbMO7e1/GATP8gaUFJ00MelaRJjGqdnLUa1LNsmkJtwSyR18G2zTx5bwPCX5S9hIO6kMCLDLazDr1dk9+RUGhpmKix+WaGY3ywBMwF7Vo/U9SFfvLPDhdl+O9RnydntM+rTbwgGWoxTbY2Wb36qUIaXQ8nPY+4rzrIS5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQ0PLe+WtKPy3GfzvVjreGQH1XpqazgsXE3D5NO1w0o=;
 b=miuIoA/xo39aNzHFEXKvPcU74/4yMjtABrza60dTbM3sdveOU99I7IqjnP80+1opZUJZZEshPWKStqyPjIwkObeoJ5kh+C3U4Pkv6NIbq2n90Pz6yKRTbOR0pvSSga2mJ6sHvAw1Y7L+k3cT5MRjI/xGoxTv0Ypx1Em/uerZJUjCf/NeEfirS2ZL26yHCANczXV5g7saBsQFtbBG2v1fLj3ogmKbVb8I4KUhoVqXAu9B3etYLVH3YM7xNVVEWFP3wU9Wc8FWQ10eyeEA6vqxzZwbv5EF/pGpwotCZ9CDn+ikhjIAM10fbZbWwz+uPsPXqqpPniAysUnxcOn/8OG1XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d41a7b04-4bc0-8c69-b310-157df6c84b27@suse.com>
Date: Thu, 31 Aug 2023 11:24:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 05/13] automation/eclair: add deviation for usercopy.c
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 nicola.vetrini@bugseng.com, Bertrand.Marquis@arm.com, Luca.Fancellu@arm.com,
 michal.orzel@amd.com
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <4039623dc4341758f383ec49228c1e55e5862b0f.1693228255.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308281512360.6458@ubuntu-linux-20-04-desktop>
 <04f03604-e788-0d76-1ae8-8bb74c6b4c7a@bugseng.com>
 <alpine.DEB.2.22.394.2308301855110.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308301855110.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 767f0ade-f593-4460-2174-08dbaa040a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ma9JA5KbOrbgDntV1RoDG/LE6BndzI1cNbl154oqJd2fXcajFGE7oCrqQHhtNw7hvhjKB5TY6AV09q2iyHJWBYnSNAIY3sRs2dWU/+68pUL7HI0fCD+aLiQs3oLBWpEPiRuyIwStfZIfCQ5sAsWhaf8VKwGw79MDu+PP1Pg5dK/NsmoN8fXh6UikuDZtoQBhhCZzo/y/Nh7ShH0mX7mEj7ybDK7iOkVaQsOkjkG81wis3oWOKuYAp68SmeiWktuQJETNK7MMhVu8Ik4O/bvXh44tWCQdvOFasZMKd2LYq34WfuOLH2lc1K9nvKwrZY0p9UQJbX8TwO4B8x4xY/qpc5AMjeXeHXmnS9f1QcZot2qMfP5gVs/ouJ1oPYsvurij2PcSsphsZU5tP6p3NKsWFtfAt1nHkd2Rs1Si27wNiEeVdV4dh50rGLRCCL7OwKyIY8EO2lfDtWpsL5Qt2buZlAG7YLg7QE/X7D6weAQY86R3VatPWzg/Rf/bGiclkCBfnuLWUbbtFWfd5iX/AFHvbx+C2LgRSE1zhxrsSzHVaHu7p1DMIDv+q9tkVwskeVXEJd9Y2w/zWypajhVJkwnBx2TPZCpKQ+FKQWfGX67HK++hUMuh5GhxlN4iJu3YdGJBRoqueccPc1UkPC3wLHBPZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(366004)(136003)(396003)(1800799009)(451199024)(186009)(41300700001)(7416002)(31696002)(86362001)(38100700002)(478600001)(83380400001)(2616005)(26005)(6512007)(6486002)(53546011)(6506007)(66556008)(66476007)(2906002)(66946007)(110136005)(316002)(36756003)(54906003)(5660300002)(31686004)(8676002)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzNBeU5JdUFpWDI0WEdsdi80UkgvNDNjU29USnQybHVpbFByakZhNXZlTHk3?=
 =?utf-8?B?cmpIUnRyWE00VmRSdGZmaGdjdU95N2lMaGlHK3ZqU0Zmenk2MDBJczY0bkR2?=
 =?utf-8?B?WE5iOW50d0RkSkw0VUFXN0FmaWUzaGhxM1ErOGpaVmRkMFBuaUk0WitMSVVz?=
 =?utf-8?B?TER6SUNMUFdMakl1OXorS21RR3R0dllLN254dG5TTHJjcWRtVDFuS1FEdnhX?=
 =?utf-8?B?Ly9RRU1sZUJnK2lJcnFTeWVwOWZOVjREMUtKbktQaGpJNlJLZlNkUE9sVDNu?=
 =?utf-8?B?UjI0QWg3WVhYVWM1VFRkMElHT291bDFXSnhIMUFDKzduMml4akdpbEVhTzdD?=
 =?utf-8?B?My9iME9HaXRuTjVPVkhHaytaUURiMEw2eGVjRVRIQ2ZjWTVNeHpXZUpleXBk?=
 =?utf-8?B?YzFPMlAwSXY1dGQwcTljdFNSbVczc2pFRGxtUW4raFpoUHJPNlhod2F1U0Iv?=
 =?utf-8?B?cUpVbWZvMnVLNThUczRDQlkyNGlWM3JRR1RIMkNHSUhJK0V3VEkraXZuRXE2?=
 =?utf-8?B?MGhGNmNFaTNFc2Q5akVIUnFja2pMMm51RXNvNVc5YWluRTZ4a0U5SlRuRmZa?=
 =?utf-8?B?QkdEQ2FpaHpCcVA5dnJjYlVPalkrRUk3c1BEY0FsMkhBdlcrRm9BWnlnZTA1?=
 =?utf-8?B?aHhpT08yd0ViN1VldEdmbkhERC92aURURVdwMTZuMjlYcHZCYjRENXdNbjJX?=
 =?utf-8?B?UW0yNlpranQyMUVOTWMxcmVNVWI1R1p5RVJCSDNKTjB1V0FYVGF6WG9xNUlH?=
 =?utf-8?B?NjZIb0NjVEppZ3FmTVpDeFZ1Nk9WSmE3dmh4OVZ6bnlUQWV5SFBQbjh3aXBE?=
 =?utf-8?B?RUhQbFRLTjNyK0t3SFJKMEM4NFRibXQrUUFQTlFLREluVUU1WVJobElGelg1?=
 =?utf-8?B?cTNRQ0Y4QWQxM0NJSTdvRllXcG9uZDM0UWZBbTh5V2J2WHIyOUtKWGdWdVpG?=
 =?utf-8?B?bnhEQkc3bDJRMmRXbW1yYis5TUlkT0tpNDNCQnJtRHliQk84SGlsemZhU3Rz?=
 =?utf-8?B?MGpPalFCZ3BLZHowRHdhYzkvdldDWEZWQUhuU1U5QllNZWNMeDR0RkpZd0FQ?=
 =?utf-8?B?MmxuM2FLQXMzd3dBTGx3NGhvRjBRMm9hdnBkeFdkN214eUJHdzdWbkorK0N4?=
 =?utf-8?B?dndxVWU2Ylg3N0krdGVYVm5mTjRPengxVUpScWVzSi9pM1RZQWlGWTFSa2t4?=
 =?utf-8?B?V3l1K0xYRjh6SHdCRnR2T1RlS1EyeVlZdTVyc1d0RzF5Z1RNS3ZQMUVwTWJ3?=
 =?utf-8?B?R3dwa01VVWNLYlNXMjQzRWgwMlcydWRyNzhYRGRnSmx3aXF3RDNXcWRSQUlh?=
 =?utf-8?B?VzByN2VSdCs5MWxFMXZ0dU0wcnUwOGZFTExtaXNkYXE2UG5Vcjc1OE1qSm1Y?=
 =?utf-8?B?Q1A4WEVZemN2dllYM2dIMUR1WnQrR0NYc21BdWovUEZWK1IvRjdlUDBGcDNX?=
 =?utf-8?B?MjNMNmpJaWJlZ2Y0UHdyUTE5NXIvM041bmVSOHdUWkpKY1FoeVJEMHhRcFBl?=
 =?utf-8?B?Uno2TEhPamY5QjkyMTdaMjRncDBqNERpU2E1OHAvZnB5QU9FMWplT0w4SU1U?=
 =?utf-8?B?cXdiOERHYlIyWm5EUm9ZMTVRMG1rNEdTWEt3K3NhNlBhWWE2L1oreG9SdzNl?=
 =?utf-8?B?blB0L0xaVit0ZG51MFo4REN2aWFmZHRoWXgyQ3BCL1pCMlhyRmZvQ3ZHOWxl?=
 =?utf-8?B?cklXWXl4SUdKVU9LOEZMNUIzRTlxbzdyRmxDTmNDeXVhSTJjaCtZcERDdnZl?=
 =?utf-8?B?UHJzY1RudVlBT1hLUmxKalNFUjNTTkFoaytJU3pvVDZqMit1K1pzeW9qQlZS?=
 =?utf-8?B?dHBRamlic1FuM0QxbmtlWXN4SGE4cWQ5OTZVOHdCU0RqUUtRODZBMHByUFZV?=
 =?utf-8?B?ZnQrSXJidldoUjZTVXc3L1k5MlpPSDl0aXVjeXpFSWp5ZkVGa2l6WEJIbmw4?=
 =?utf-8?B?bDNtZTF1Zmhja25RNTJjSlg2QlBEdVRTSjN5MGR4TjZUcE11VFUzY3Mzbnpr?=
 =?utf-8?B?MVBOb0s3UkdzWE9PaFdMeVE3YTRodmJVdTdaQzNVMFg5TnFlUE12UWdBQkc1?=
 =?utf-8?B?TWYvZ1ZqbFhnTnMyQktyQ3UwNlJTWmQzT2lwQ1V1cDVPeDhIV3Y2WDNnZnJv?=
 =?utf-8?Q?gI9x/lgy8rWdhtGuN9Zb9N8Uj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767f0ade-f593-4460-2174-08dbaa040a4a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:24:13.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urmi7R0MEy44h9vzl3hBzFsHdtqF6cFGJVZLXu+xB99RYnS33QfuPWKt1V9NKta1PL9PqTHro3ChDfJrGpi1UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9134

On 31.08.2023 03:56, Stefano Stabellini wrote:
> On Wed, 30 Aug 2023, Simone Ballarin wrote:
>> On 29/08/23 00:27, Stefano Stabellini wrote:
>>> On Mon, 28 Aug 2023, Simone Ballarin wrote:
>>> --- a/xen/arch/x86/usercopy.c
>>> +++ b/xen/arch/x86/usercopy.c
>>> @@ -1,3 +1,4 @@
>>> +/* SAF-1-safe */
>>>   /*
>>>    * User address space access functions.
>>>    *
>>>  > Otherwise, maybe we should extend safe.json to also have an extra field
>>> with a list of paths. For instance see "files" below >
>>> {
>>>      "version": "1.0",
>>>      "content": [
>>>          {
>>>              "id": "SAF-0-safe",
>>>              "analyser": {
>>>                  "eclair": "MC3R1.R8.6",
>>>                  "coverity": "misra_c_2012_rule_8_6_violation"
>>>              },
>>>              "name": "Rule 8.6: linker script defined symbols",
>>>              "text": "It is safe to declare this symbol because it is
>>> defined in the linker script."
>>>          },
>>>          {
>>>              "id": "SAF-1-safe",
>>>              "analyser": {
>>>                  "eclair": "MC3R1.D4.10"
>>>              },
>>>              "name": "Dir 4.10: files that include themselves",
>>>              "text": "Files purposely written to include themselves are not
>>> supposed to comply with D4.10.",
>>>              "files": ["xen/arch/x86/usercopy.c"]
>>>          },
>>>          {
>>>              "id": "SAF-2-safe",
>>>              "analyser": {},
>>>              "name": "Sentinel",
>>>              "text": "Next ID to be used"
>>>          }
>>>      ]
>>> }
>>>
>> In general, I prefer the first option for such ad hoc deviation (the comment
>> at the beginning of the file): this way, anyone who touches the file will
>> immediately see the comment and think as its changes will affect the deviation
>> (is it still safe? is it still necessary?).
>>
>> To help the developer more, I think it is better to also add the "name" in the
>> comment, this is my proposal:
>>
>> /* SAF-4-safe Dir 4.10: files that include themselves*/
> 
> Yes, this is fine, it was always intended to be possible to add the
> name of the deviation or a short comment in the in-code comment

But then either the directive number wants omitting, or the Misra version
needs to also be stated.

Jan

