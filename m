Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110F94E9836
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 15:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295442.502733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYpTh-0006H6-Cv; Mon, 28 Mar 2022 13:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295442.502733; Mon, 28 Mar 2022 13:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYpTh-0006EX-A0; Mon, 28 Mar 2022 13:32:13 +0000
Received: by outflank-mailman (input) for mailman id 295442;
 Mon, 28 Mar 2022 13:32:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nYpTf-0006ER-GK
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 13:32:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7809a283-ae9b-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 15:32:10 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-5vJr7SVPNZq2PBIJAxeHOQ-1; Mon, 28 Mar 2022 15:32:07 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB7713.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 13:32:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 13:32:06 +0000
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
X-Inumbo-ID: 7809a283-ae9b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648474329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zf8vVRD8jN9UizjcSitGFTUmWSdhWQ/t0kP0qD48EOI=;
	b=Bo8YKTZwRqUmbsGh/IWAXISEGmtkbok9cKO4sr71Fn2IblNd23orq+ue82Ip4LejmpIeJb
	WWgw3QORGCuj9GG67Obvrd+gf7P8h2+DmrPaU161S0CnBrKtfWlLu55dLqXUwFh05Z400l
	ccmAhF7l6Gxbqnpe/+DuXfgGNcB+7W8=
X-MC-Unique: 5vJr7SVPNZq2PBIJAxeHOQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6+075y1ZQaWtBoVLsT5SAfbmiECMqIT4UbcXx560WZhKwPyC0ik0FCQENOOPK97ty0/tD1R8fytNfGrKvz3Lbw21G+0Nm1PewD1k5BydqJ/aDpFkW9h1Ye9PCNlRQ4x3XtrscAVrHza2rD/MY1J4l/ymq4KvJGud8wG77Dh0y/Y7jZvuN+zxcZakbswkKT2k6mphfKRsEEDxT8ke/XYWu+oIjVs2zpZ97+9mVdpfPGlsA7CBrFefrxqQ8eilLhMZN9fGE+hFycL7bRN46K99h/f47HZJw087wBOpN2ddj03yDVtfx3dmachWiZazUCn+W/d3oMBwsgHsRN5kPGOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zf8vVRD8jN9UizjcSitGFTUmWSdhWQ/t0kP0qD48EOI=;
 b=huQ4iTspfgmP5jj4mZw9xdNUA+Cn2ikjlD816TBb/8MC+UZNxjRD0w6chM7Q3zdvSwAsrx+wniZEoM89WLZMLXwidkL1DxuomDIIOBSjkkoyydqk+B+zoRytfXtPASoxw61dvxaZZ2ENk4zFlD2BhW+JG9/fYokPbhK2FBgJ+cAlaJ9WdhhEN4TXDDc4FPpTestQPVmbBT3uni7o98cy7g2/FBaBhru3jtw/o1Q7ta3I7iV5eaKmQmhG7nhiDGlzL+AmTsmdoby2D8XLtysQq4SGtHpHeeBmh0ZAf7LQZknu3mqnrxgxldO5tfPk/SPEQcB1yLMFBvBroa6ffPWJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1df7130a-ff59-9672-c77d-14e82339c602@suse.com>
Date: Mon, 28 Mar 2022 15:32:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] x86/mem_sharing: use dom_cow as placeholder parent
 until fork is complete
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <d5d8c7bad025a4ef11bf09ad3a4b23c8b4673ff6.1647970630.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d5d8c7bad025a4ef11bf09ad3a4b23c8b4673ff6.1647970630.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0054.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::14) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 731e802a-c55a-4c93-a56e-08da10bf5a03
X-MS-TrafficTypeDiagnostic: AM9PR04MB7713:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB77133E22D171161F5C9FD69BB31D9@AM9PR04MB7713.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PN7QyjorkQ7YJ9gPw6OCtYSIBdzrxIudo8Yw5X8BSSId4Pf6CqloZ0n9ngo1ilT+hF1EbU7dYh1REVdzn2EvxaLrWYR6QXtIkhDhaJERjDf1NOlPnBw9CAo1W5k2ar0YRaVkZuHnnKN86f17VXEykcRPHfok9XUTcgokS0mZje03qSYD3clEHouYSBvEX0OABiOuzl1tXFUSbHej9YUSrTk0Ngo74Zwclmp0T6FZOrex1M00DcN2yO+dnPPmrsfzmtG7o14jv4SUGXZygwGxY3gHKJhHUbHlhQT3RJr9H8IMEMgXOeVGcNp2LRQMoFcPthvLd0lgJVPSB1eIjvskLuLG7Loh3dKP2QzSQHTe39/h3eLQQf6ulwZYpyjnr6OpPscOOCjKXUu8I3ZFo3yJuBTj3lQge8E2AF4XCQZHGSmg8o/TdPs4BWdOK4W5xgCgzExSRcIxID3tkJRuZV5v78V5sfuR742enS44NHLa/XEv7FWJYXOKw9NcPVBnhrvWopmTVQUja6iFEGnRkMXkmWhmJyzBqEm3MeOvj1ZEBFYXt0rs9T/qCVxKVow9kJH5f1HWwzubqGgMoU1NYZD4ijbt7A/ITyzeMv5ruFm46pVkgpXKf+IaKkcgESLwapjY7zO8tlfxDGVTkCbHy879YXAo+fVulYBFFvQ3xPUfMZhhzfvs0/mx36Nt7AovAUWlNBJA4xkQWFCmRIHW0KMzz+e8+C1gX16GHP4dmqJIaZ8vtY5FfdzJLdTsigqJgC3F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(5660300002)(316002)(6916009)(54906003)(66476007)(508600001)(31696002)(8936002)(66556008)(186003)(2616005)(66946007)(83380400001)(31686004)(6486002)(2906002)(8676002)(38100700002)(6512007)(6506007)(86362001)(26005)(4326008)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGdCc0wxaTQ5SXJSVk83SXl0VDV2Y1Mxamg0c3RiSXBLRGxBRnYzWnhvUUVm?=
 =?utf-8?B?c20yMXpoTzNicW5OLzd0OU9LQndaVGZFRmNJcE84OGgyOENZLzVrVzZZbnlV?=
 =?utf-8?B?WndzUVNCamlObC9hU2dpNmtTQ1g1Si9wK3diT3ZKN0YyWCtrWk9jaXAwYXNX?=
 =?utf-8?B?c1NHTW4wbjd5dnd5TjM1UHJtYUk3UUxvcFU2UnRETVBTNUdjRnNLaitZMlVy?=
 =?utf-8?B?ZE05OXVwbVBKejUxaTJ4ZGpPNWdyUHE4VkdJZEpGZHUxNk8zSTRscHNYUVlD?=
 =?utf-8?B?dFRNWjVyMjAyanVBU0ZYOFNKWXVVT3hpQ1BwRXVpeGpLaWpINFpoMS9hdG1i?=
 =?utf-8?B?RkhDL0lZbGhVZlVwUkJIY1d3YldxNXhNVGNQcXQwWnNxVUp3OVg3RnV6S2NG?=
 =?utf-8?B?clJzVm84cW1iT0JjcktPdWY1M1Z5N1JNem10RW13TDFReVd5SnY0c0MyRElG?=
 =?utf-8?B?c2cyUEJoWlQ5NTc1YlJZTWI1WWM5QXJsYVZCd1BwUUxjRUNEeENPUTZOZnd4?=
 =?utf-8?B?SmJoZk1xZDBWUmhZdkczR0dia0l3d29YUjYxYk1jdWp6aFJMblBrbERreFhS?=
 =?utf-8?B?aVl6Wmc5ZkMwZktkNGhiQ2lQbjdqVnhvQ01lYWpLTEhEcE11VmF5dCs5Tjd2?=
 =?utf-8?B?QmhqazZuYjZkbTNtQWhZaVpwLzl3TUN6STJ4SlJodUFFcjIvYksvK01MdHBN?=
 =?utf-8?B?cjdodHpTUTQyU0V5NUV0eGR3TWJqbDNyRWVMazQ1Q3FTS0dyNVVLN3pJMmlD?=
 =?utf-8?B?cWlBT2F0dm9teHQzZFVwd2MzSXdEVnZ6MnI5dkNmR1pYa3lUcXZCM2VLNjFn?=
 =?utf-8?B?WG92bXJMcFNIVGNPSVh2T090dVk3UWdhOGhnZGorOFNHaFhWOUdJQVNDZFdj?=
 =?utf-8?B?WFJOMTZyRTJQVUF1RG9pSHR0WnBkRUk0NHh3Tm52bWNJL1RuWXBTdHMvQ0JC?=
 =?utf-8?B?dkhhd0ZwRFM2Wlh5Y09sZ2M4VlV1U0RlWXlyTHI1VVFjS2JudTFMcFJ0OWVU?=
 =?utf-8?B?czI0TTh3dVpJU2tOd0hsbi9pUlJxdzgyZUNoajVrRWRhZ0IwdXBrOERmODVI?=
 =?utf-8?B?bnhaVjhCcVhLNk51NGcxaU0weFl5Qi96M0lpT1dUTlNSSkg4QU90RnZucmxC?=
 =?utf-8?B?WFNTaTROMmZhTDZXOUxOMWVGTWlkOU5qWVJncmc1YnkvVDZWcWorMDdsRzQ0?=
 =?utf-8?B?TUpNTWpJMlFmTlVOSWFacFdMSnE0WXhkaGREcXM5ME0wVlVrZlhHdmsxcDUx?=
 =?utf-8?B?TEFLbWdraHNzMGwybyt6bFhQNFdMblhUSlg5NDAvRkprV1VQVFhqSkFFMzBV?=
 =?utf-8?B?cDFpTzZCR2tRMldKZUdUTGRFMVgzNW5IR2F1MU5OSGs4ZFJSbHVObFEzRUFr?=
 =?utf-8?B?TmxVSDQzUEhTU3FLVTNJTFFzNFZEemx2MFNiUDl0cmk4emY5WFdJaHBSMWp4?=
 =?utf-8?B?MURvZGpBYzVnaEFnWVBKbG4yai9Jb3BEbER1WktVU3NBcEtLRjFkckJGT21p?=
 =?utf-8?B?bEhrcG5hYUdzTGxJUWUwVm5EcjVBdjlSNGdFaEZ4VmRlN1VVVXlCaDhrV1BH?=
 =?utf-8?B?VVZrMDl2YVZzd3NHRnZvR1NWblo4Tk1rM3lPRm1VM1BZM1RiM1I1OEc0Z2h0?=
 =?utf-8?B?K0RBVzFjalBUOUd6ZHlYeWVEWWc2aVNjemlRL2hQWWo5U2xCdEFvMW1Vb2xQ?=
 =?utf-8?B?alhCUERJZUdqL1dxZFVvd2dzM3hEajVYSUlkM0lIUGYrV3VpR1ZLaXBLaEVK?=
 =?utf-8?B?ai8weFFydElHZ1ZDYnVJOWpHSEFwU1NNMHpPVXRLWVpnOHBiWkFNREV1b2VG?=
 =?utf-8?B?QXV0VnJhK0VUSTJGYzB5RkxZSk5jNmtsQ2FkV3FoRDZTYUlYUnVkclpyUU1M?=
 =?utf-8?B?T2VUUXhXSlUzbWgwcWJDVFVLZGc3ZDE5cEMxQjcxc3AxMkR2U09pYWxDMG5H?=
 =?utf-8?B?MS8wYVdsQlNvVTJ0akRrY2ppck52TmFTNmEvVmMwT3RkQmxaNlo1azJBR2I2?=
 =?utf-8?B?M000RzZJc1J6Q3ZHVi9WUTR6RW03MENBYjlKMWFTYy9Ua1JmTW5pMEwvSzIx?=
 =?utf-8?B?Z1lId3hSZmI5SnczaEJDaGsweE5hbTEwT2RBak4ydzlRZXllU0Z5MnpxN3ZX?=
 =?utf-8?B?bUhKemcrT2hjRGxCditZdnlkb2NjUVk1TnZ5K3lmelpwOG90cHZBdUlmaTJB?=
 =?utf-8?B?eDM2U09SbnFDZC9kZVlBMWhTcFI5Z1ZJVVBlY1U5ODN0UjJUdGhPYkZhVW5U?=
 =?utf-8?B?R1RRWlAwK05tS1VqWnBtV0JsMWpqOU40d1FTZmsvZ3NRbXRIYUdRZDUwNUNW?=
 =?utf-8?B?RHIxRnRSMXVBRk1qbUxjN2JMOVYrU3pGcy9KcTJmS0RBSDg2b0twZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 731e802a-c55a-4c93-a56e-08da10bf5a03
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 13:32:06.2582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jC0muXoFascpa3zoATD46n1sIrcYTBRCcMCjO+rGR6sSFhtFc045EGTN/zH55SbT5DyfGtwK7dWthYWD2UEng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7713

On 22.03.2022 18:41, Tamas K Lengyel wrote:
> For the duration of the fork memop set dom_cow as a placeholder parent. This
> gets updated to the real parent when the fork operation completes, or to NULL
> in case the fork failed.

I am concerned of this, in particular because the state may last across
perhaps a long series of preemptions. Furthermore ...

> --- a/xen/arch/x86/include/asm/mem_sharing.h
> +++ b/xen/arch/x86/include/asm/mem_sharing.h
> @@ -79,7 +79,7 @@ static inline int mem_sharing_unshare_page(struct domain *d,
>  
>  static inline bool mem_sharing_is_fork(const struct domain *d)
>  {
> -    return d->parent;
> +    return d->parent && d->parent != dom_cow;
>  }

... this now makes the function "lie" (the domain is a fork already
while being constructed). Hence at the very least a comment would want
to appear here explaining why this is wanted despite not really being
correct. This "lying" for example means a partly set up fork would be
skipped by domain_relinquish_resources(), in case the tool stack
decided to kill the domain instead of waiting for its creation to
finish.

> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1850,7 +1850,9 @@ static int fork(struct domain *cd, struct domain *d, uint16_t flags)
>          *cd->arch.cpuid = *d->arch.cpuid;
>          *cd->arch.msr = *d->arch.msr;
>          cd->vmtrace_size = d->vmtrace_size;
> -        cd->parent = d;
> +
> +        /* use dom_cow as a placeholder until we are all done */

Nit: As per ./CODING_STYLE you want to at least start the comment with
a capital letter.

Jan


