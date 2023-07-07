Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE6C74AC6B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 10:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560245.876008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHgOU-0000Hq-9S; Fri, 07 Jul 2023 08:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560245.876008; Fri, 07 Jul 2023 08:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHgOU-0000Er-6U; Fri, 07 Jul 2023 08:00:46 +0000
Received: by outflank-mailman (input) for mailman id 560245;
 Fri, 07 Jul 2023 08:00:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHgOT-0000El-6J
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 08:00:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ea851ea-1c9c-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 10:00:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7438.eurprd04.prod.outlook.com (2603:10a6:800:1a0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 08:00:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 08:00:39 +0000
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
X-Inumbo-ID: 5ea851ea-1c9c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLnp8pQ3REuO4We5Ov7TyzO6a2v6eTOW5OyMnhMSDaACeSa+wEDS3HGGVV2FXaTge8anCtLYLOdBD0SbXq+yBUMIMlY/Dsl1Jf4fMRLPlsiHRsXMl3skF38d8Z0Jr0MySUgRiW4fUgM/KkLRW2atDN8w81m3BFNxLQuY0x61ikRUzEYT7eUELX5n1de7nGPEWaQfYB8rChHudDjhA2QFA2z2RCiPn6ulI3YIrogU1L0rXvxIyMStxg7jKLhbu6XDIh+zKrwgSrOkkUdeb3Ko344PIGknv2yVhc+CmxGOF/dxrwYHQf8ZnLv7c2wS6Pq5WoM8pw4kgoIeT+7H2/Pcnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZt9J95B1jLLg0VPXssmA4UNBei3fffftqFrh1L7WPQ=;
 b=IgZmkc6FTHFCS7SVdnSWr3zWt/D5cm7/+Gdt7h3IQ9nVi9Y8jumZUkXwDZVffkaXZ/zZgARmhueXsR0oDo2ST+kHeq/t9PcwiLgrE2Ww6tXqJObXquWxUIFH0si4n3p/E9WrFQYGxNts/duD0A2GYGPhlsUNwgAQI7aCn4AZiKK0WCLm/UZSBwZ/iWq6iW2Xo/r3sP2xeKcU4LJTT5lDXCydNHbZlgtcdpUuyfM/iJiGDROwgJzKB3XnyZGpo8VBm1Ux/WL/5qXSny2Vdvb1VLXfm0qgq3BasY887ASIgWEByYMe2gbUlLB3fRvQG9402NkK0Bj4biFZ8YSmx12Czg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZt9J95B1jLLg0VPXssmA4UNBei3fffftqFrh1L7WPQ=;
 b=b+VggsGLOC7Vg+t6wj6jse037np2QEXEo4AlKsKDsjeuEkXPcjC2/ZJ5WYtGHKWl4nsleN3TBCBiA411nf69kZu/lhmCFly+QJC5krYzZWmBwcvR+wS1i5RuXeUKZZW906ZpEJIqkhbgtBgSRPWF4+AC0J4F2oUdn6oju4HTFwwY6b9mtlSUdwo3j1IU/YXDIWkLG21DK1D3ICaHbzgUQxetOhwGUNRQwxTaZw6/tascmgNSBZizTFY/Wq5q++3EPFdoxI38qzJsYQizt6Dr+Fq3i2CGF5uHNuEBLRA2OSAQlwK/ZgDt+UkKOxEq1WeSpYxkZX+VpQDqcJBfm1ZLhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27a3e6a2-b150-1d75-c86f-dfa2b906b298@suse.com>
Date: Fri, 7 Jul 2023 10:00:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Detecting whether dom0 is in a VM
Content-Language: en-US
To: zithro <slack@rabbit.lu>
Cc: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
 <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu>
 <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com>
 <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6b1e43-c68d-4c22-4437-08db7ec0411c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lkqJ24nnLVnIWEjrr+mOMcLDDZH33Df7l1dY4wIiEsVfd5FhWFsfQoOXSaUOxF4cNULJmxQMpI9b1HZeMB4twMOCYyPX8FjmEErOD96b+8cMCz5fUmdfM37rM2VCGTXH0sIaJUsDQ6ewltXhz+7HTwSKZcqDXuDL+hKHXwGWeXnyaHxuEC64wpO0VO3yOjNVWM3Zr9GW2+qV2kc0sO3ilW46kymnVeLol0VVqjGZRNp6VhhDJpRvkwqftG4SQ8vZQHZgxq2WXYUvBLHybF9wAFP7+JD1kyt01wNXwcq8dl5MgaYDi51/SlBcyRN4syXwaw9jgkYVgtHiovn3ngMoXPbZFq1L/4togSVDYwA+aH643dB7/EDA3XUfmTFIzcdTj8i1n1SlgJKG8Hqnsarz3/+cmNYZtAgGI0FvsUujPAnu2zOEXsqwJ0j9Fp9v83kHgM0TEb+fnC/97I7cnKrsGxyeoCoN9asNsN0qQqTpP2obybOu7dWTuvgOZIcUU7Qe1KOujNB2cUuJ2J0juwO97i2RwFt7p0bLX7mymOGYYa9YoHYMBFcnmfH6QHTfInLLAYZpLkxr8WN2H/bWVHOUFNO13FzAdeqgSQKxY1PMSKW8MZ+jgDCCQMox+QWM8DaDoIN07mXW8frQ2VJCTro8bQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199021)(41300700001)(966005)(6512007)(478600001)(31696002)(86362001)(38100700002)(6486002)(36756003)(66946007)(4326008)(83380400001)(6916009)(316002)(66476007)(2616005)(2906002)(8936002)(8676002)(5660300002)(66556008)(31686004)(186003)(6506007)(26005)(66899021)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUgwcnZNNGR0amMzc2ZvYzh4ZFB6OTMwdTZJWG9Gb2cvNVFaQ3ZZaGZGUXAy?=
 =?utf-8?B?U1dBOXR3TVFTUjF5aVg2WjlxeVRFSEh6dWI4K1g1K2dhRy9YUEZrQ292ckJh?=
 =?utf-8?B?Vm1nazVlK0F0blYyV2tURzdERHZiR3dUMElYOFpxeDB5S2xMY3paWm85K1pm?=
 =?utf-8?B?UE9PcUhqTy9RRWFpMHM0anNHaHNDSGFsTUZhKzJiVnFGZ1k4SHBLVkNoU240?=
 =?utf-8?B?c1RkQ2RvcU9TRTNKUFRkK3RCNi95bGxIT1ZOdWpiWXlIRUVua0VNYm9GejB1?=
 =?utf-8?B?S1Q5b0Y1TmhPZXJaM2hqN2VDOHA3UEszUm1aKzdSUHhPcXl1RmYzSnRWNDMy?=
 =?utf-8?B?NVJNMGliNnJRTXBMNlZvTDhIVndiL1NGaWJrSUNEZU11Q1Y0NFg1OFJGVVN5?=
 =?utf-8?B?L3BIRkVDbFFCZlp0b0Z3cVc4YzQ3WHcyM2F2YTJPM0ZaVjlMQTY1OWtCekhB?=
 =?utf-8?B?YlBtNjdSUVpVckljMG5MS2lLTisvRlNmU0I1Ny92WTZwektTdGpjWFlXYlVn?=
 =?utf-8?B?c0YrZldqY093TnZldE5Ja3hLbGoxVlRLdE9sV2gwbENxcklXZEkydHZMNmZl?=
 =?utf-8?B?U0NIZWcxRE54dDRtNXdKZlBKSVc4UnYzTlBuU2wzM2hWSC9DdXA0SVJaM1VU?=
 =?utf-8?B?Ry9kOEh4aHZIUHA3d0laVnpGR2tjdXA3SzhmanVSVE9WSEJYa1g1dmkyM0hj?=
 =?utf-8?B?ZmZTZW9DeUhQRWhUNXdQYktpYTQxczYvSzFzSG54YnJwZkJrZWJxZEZCU3hp?=
 =?utf-8?B?ZWM4SStRUWFrVlRhWXVyS3hIMVF1RjFTbW9XU1R4L21uNTZZSG8rL2tMbEF5?=
 =?utf-8?B?RWZrc1hyYzl4R0wrNUhPYm5kakVpMkF1U2RpZmdJdkNIcGlMdDZhOVBncjNT?=
 =?utf-8?B?QTJ1WGp0ZmQxeFVTeXZRQUtlYVFGdjZtaldUZ1dDZ29JOGp5eE5LVUNkQlNz?=
 =?utf-8?B?cWRVTk9laG5nMlhFOG1hNkRRVmZVQ2VSTHp2US9RdEZ4dWRNL2diTUViTWwx?=
 =?utf-8?B?cEJhYzZSRXFBdjd1VlhsWHRLMTMvOGxROTJOTzFwMytRc3AybjFEb24zV3JF?=
 =?utf-8?B?anp6RUpyTjl4QUNOZEZtZExTQnlTUTBkVktKNjEvbzliMUFPWW9ZZTU1ajYv?=
 =?utf-8?B?UDV4ZUp3bWpDU0NPeXBuU2pIc1owVGRLN1V5M3liTWVla3pqZ1E0RlpoQ2pn?=
 =?utf-8?B?OTlsbVcrZzhEWHEzSWN3UmFIWjlpS3JKMzJKejNqUUo3RVVGc2FMdXZ3dzFi?=
 =?utf-8?B?d3lVaWI0QnBieTJSek1zMEsxY1prRGtjZXlHNXRGZCsvY21VSGtGTTVmaEZH?=
 =?utf-8?B?aWdPZ1VERENPbXlpN0pyVGZqUXlEMWovNE9abHdzREdlTDh6TUNqNUZJdWVs?=
 =?utf-8?B?TjZndlRSVWgvbHRBcm9BemhwMUkvY2RUcHBlVHd1STBOSmZvK24zdndtRmNE?=
 =?utf-8?B?T20wVU4vbjZXTkVvTnZGZVVTYXl1c2hOWllUdTAzbjZudFdkRGxqckJRdEll?=
 =?utf-8?B?VjNoek5WS2tQNU9sSmhESTVOQVRmMmcvK0Fqb3pDaGlsQnpuVmdKWnFHTktT?=
 =?utf-8?B?aFdvZVBSNmJEZmIzM3J1U1RBZkZPYXJNS3BxbFVTaXM3ZUNXOEtiTDg4OW55?=
 =?utf-8?B?bkltV1VlTU9TM2FKbjhxUVQyYk5Ud2g5bVpJMVI5cWxnMWZkMGFGL0swd3ls?=
 =?utf-8?B?bGZNbjBNWFhEcDBLVXFhL3dwWEtvMUdzMlVESXl3ZTBJeVBUT1hQUURZYlJm?=
 =?utf-8?B?bTg1NE8xa3hLalNqZTVHVGtYV20rbUJFMzVvQVZESjNaQTZDZkcvVUxlak9j?=
 =?utf-8?B?c0VtNG80aEFVcXB4VUx0MnNyT2piRGhPSVJ6cUZjRlFQT2YvZnJjUURJSjdj?=
 =?utf-8?B?bHA2dmprcVZvZk0vNFlkeEYwTDEzV05VWlprMFZ3RTNnd2NZMnFYYVVhc0Ex?=
 =?utf-8?B?Qk9WQkZKc0FqNFdnanlUc2ZpeC84SEtRSDVuUCtkUDRoaUhlcjIzeGZBZmxC?=
 =?utf-8?B?azlDUlQ5QWhWaUM2NS8wYTB3Nll0Mi9KdTl6Q0U2UDE0Z2ZoSndYdG9EQWJT?=
 =?utf-8?B?clNwYU5UcW10aTlVQ2VYMHA3NDJ2ZXBqTTdxWlJrMDhnRlplV0RMWEc5TXRq?=
 =?utf-8?Q?kaPIR6PhLetWCgP0nUs3F1/nu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6b1e43-c68d-4c22-4437-08db7ec0411c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 08:00:39.5170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPvwiDxa2mirZPWNzBB6os+RYgTS8QeFsQhlc7R9U1cIfmtWJfGyByYdRKEZI90FMvRuWtAU+Qk77V7w88e2Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7438

On 06.07.2023 17:35, zithro wrote:
> On 06 Jul 2023 09:02, Jan Beulich wrote:
>> On 05.07.2023 18:20, zithro wrote:
>>> So I'm wondering, isn't that path enough for correct detection ?
>>> I mean, if "/sys/class/dmi/id/sys_vendor" reports Xen (or KVM, or any
>>> other known hypervisor), it's nested, otherwise it's on hardware ?
>>>
>>> Is that really mandatory to use CPUID leaves ?
>>
>> Let me ask the other way around: In user mode code under a non-nested
>> vs nested Xen, what would you be able to derive from CPUID? The
>> "hypervisor" bit is going to be set in both cases. (All assuming you
>> run on new enough hardware+Xen such that CPUID would be intercepted
>> even for PV.)
> 
> I'm a bit clueless about CPUID stuff, but if I understand correctly, 
> you're essentially saying that using CPUID may not be the perfect way ?
> Also, I don't get why the cpuid command returns two different values, 
> depending on the -k switch :
> # cpuid -l 0x40000000
> hypervisor_id (0x40000000) = "\0\0\0\0\0\0\0\0\0\0\0\0"
> # cpuid -k -l 0x40000000
> hypervisor_id (0x40000000) = "XenVMMXenVMM"

I'm afraid I can't comment on this without knowing what tool you're
taking about. Neither of the two systems I checked have one of this
name.

>> Yet relying on DMI is fragile, too: Along the lines of
>> https://lists.xen.org/archives/html/xen-devel/2022-01/msg00604.html
>> basically any value in there could be "inherited" from the host (i.e.
>> from the layer below, to be precise).
> 
> So using "/sys/class/dmi/id/sys_vendor", or simply doing "dmesg | grep 
> DMI:" is also not perfect, as values can be inherited/spoofed by 
> underneath hypervisor ?

That's my understanding, yes.

>> The only way to be reasonably
>> certain is to ask Xen about its view. The raw or host featuresets
>> should give you this information, in the "mirror" of said respective
>> CPUID leave's "hypervisor" bit. 
> 
> As said above, I'm clueless, can you expand please ?

Xen's public interface offers access to the featuresets known / found /
used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessible
via xc_get_cpu_featureset().

Jan

