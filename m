Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427B93FEDE6
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 14:41:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177285.322627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLm0l-0004XB-JW; Thu, 02 Sep 2021 12:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177285.322627; Thu, 02 Sep 2021 12:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLm0l-0004UQ-FO; Thu, 02 Sep 2021 12:40:07 +0000
Received: by outflank-mailman (input) for mailman id 177285;
 Thu, 02 Sep 2021 12:40:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLm0k-0004TY-4t
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 12:40:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23508811-42cd-4b50-9756-2a48b320094a;
 Thu, 02 Sep 2021 12:40:04 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-DHg7L3bDPB-3bMkE29wI7w-1; Thu, 02 Sep 2021 14:40:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 12:40:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 12:40:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0148.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 12:40:00 +0000
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
X-Inumbo-ID: 23508811-42cd-4b50-9756-2a48b320094a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630586403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvglPhIv0cC1gQHqWcWdOwMhFrpQApUA2uzO4pvexEw=;
	b=nURaxN0MNYy7pATnLGepX7Dm+vdX1wk4lN8snIJYnX0aB6dVdOG/iQb5B0zDkH4xEtlr7W
	6+FwkPDuD1pbgo3KXT2RetbS1Z7FCZbicE//+2eTavZjjaaby9UkqtZOdKV22A5dBNQFB2
	bIAm7sZxWikVDGjnafzrRvEPJcpZT9c=
X-MC-Unique: DHg7L3bDPB-3bMkE29wI7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6v52/GYwaeFluSAUd4EEcyf5vIktYq0I2ZrFYAhpSENyEXK1mBBzj7bVPKcaERIQ1S2/s0wfEwdsD0/moENd1Mszb85D1Fyy3ozqaxzbKRSnZqUIOMcY+EMuwQU3zFczwUad7q8T12xxKHBmJ2O/wuJ+QY41Htecw69KVqPZDBlRzJMFTUVBU76gciafoClWIt51JuU2OHn2XBy493Ss/5d1Dqydfn6gx7HqmFFtguKji7pMn8ItepvLcLBg81poi8jKh3WagIs/pD0AZNhszyR1h1znpinNCMJbnjg6qD5ImIMmVf0d0TrrNnGqaZOd0szRQ/vUe24HU6FtqJs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HvglPhIv0cC1gQHqWcWdOwMhFrpQApUA2uzO4pvexEw=;
 b=LnsQd33BSrgFGrl4dKFyG4VcUfubkoDGGogpsNuhffHJz4D1VpHxChVV4/2zVswPJmuANp8Y1xgIh4i4PkNKMB1B78nECYFYgWoedTHFD9NLhoElCPVSEP7EkIixq8kQ5M0EA4I7ybymFRhZIpHdwzNf98gkrtTEN+u9roYP9pwWIewj18TZtQJcEUCnRNkFwCWBAZktpTGk1ukKRsRkLE+KBaI4aKaPDd2zxZd2fwc+S6kAG41IKZ2m322AFeCiJ0Wrar3yINw+o+oCyQakPIWpZOgJEEhBMYoCS9CMVG5XjzfPfrodiW/LOOcgJM6S75R7jUtry2QNA5o8LmDZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 0/6] x86/PVH: Dom0 building adjustments
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
 <2cd2d15a-01f7-6bbf-86a8-85437991da7d@suse.com>
 <ee80d3dd-86c2-9ef8-6ae3-da89e6bf8960@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <90bad8ba-d816-b449-1c1c-07617ba6147f@suse.com>
Date: Thu, 2 Sep 2021 14:39:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ee80d3dd-86c2-9ef8-6ae3-da89e6bf8960@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0148.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c310b6bc-7534-44b0-a76d-08d96e0ec792
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73608108F11006B3F20B610CB3CE9@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rdCB8OrH2mk+bEkctaZ9M6Vri1CfEFipjt+/LnlU2n42tVjQPdwOOu/baiIA4LO0wn4SeLQr/ZKeq0NhzRM/AVnH8zX7b5aehCB6qG9Y8kLjxACw1syY4QJTaiUzalO+ScNlYiGsNFF5g5uzL9/wRGDFzYEBAKjvL03FDi7iGOA2MFc09yznWPeoA+t34wrgeYpk1uUfV8s9PjdxM5vJYiEU+VznJF5JD3X5xT6Einz7gys0LdZpHSjq89Tr65ObEODQpv32PwPrSxaiZKrl4dQ2YerrCpc3mMNzRuXhoKvMfXbdDIAHECtksJTGY56WcK2vHjK9VUBh0dh1RakFmSZ8Zjtpiy8kOr2Ax7Eoo8LE6w7OiMkJ6JWHmY+xfeZhXSNZCN2pr4fb1dXXpsDKvtJBFWxZpN7TzMa8MvG7Un85HZ0gMSsGrndpCciO0oJ0VcOCiPE7M3644kS0hphiRQhiNHv3VCc0O6//skbeW4otNRPXYDblOTq//YSQBYbBj6SVttPPBBFwQasWDHWO1DlFlZ9FhDXO5p1MhheyKb07dKrq5KySTTAzwpUcBJrZbPk5FvteFqLxdhRJjTqNV+Gw3bSIjrRTCs0u36kis8uiIh1ONlqalfkSi9jALlaIYqJXYl5//kyR3VFhaNG5Hv8Kg5FFpyBUXsm3ZrPODIA+AbP+kgq6EFHvNAmtDPfk8QX6Ghvnf3wdqi1l4Dre9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(346002)(376002)(39860400002)(26005)(186003)(2616005)(4326008)(6862004)(956004)(6636002)(6486002)(54906003)(5660300002)(31686004)(37006003)(38100700002)(66946007)(8936002)(16576012)(8676002)(31696002)(316002)(66556008)(66476007)(36756003)(53546011)(478600001)(2906002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFRZdmF3MjNyR1ZsSmtac0JJTDVoREFYSUlIb0xtNStRNzQwQ1ZPTlFiVnpF?=
 =?utf-8?B?aDFtVXpFdmFFMnBmcVc5VklCUUhzRHRoSnlDQ0tFYXErbk5pNi9PS2IwNWhS?=
 =?utf-8?B?K3VsaTVYQnUybDd0cHF4c1lkOXpiNFh4QXgzbTJlY0d5a2NnbHE3QmdrWERk?=
 =?utf-8?B?SHNza3RMUEFYM0JQQVlMUy80WmpxMm1tbnBvSVcxQk5sMlhPOGhIaFhwVC9z?=
 =?utf-8?B?OWZsTkpRa1RySG9yb2tzMDFIdlY2SEdXenBjK2VxdGVtSEY4OTB5cXhIV1lx?=
 =?utf-8?B?L3ZVbVBwaXM1UE5iTVZQVzBMckFVM2xkcGlNbTdXN2tyUGcza05LTW42dytw?=
 =?utf-8?B?Wmc2TTRMTWZmVFpsd055RDdNS1lNc0tlcVNsMzRWWEtwWTBjVHZNUzRwaXIr?=
 =?utf-8?B?QXlPUGZLc1laRDd0OWRjNmhWd2lFbkd4dHVlbmtEWVlORER0YjRVWFdXRnpG?=
 =?utf-8?B?c3k0L011NG5XdDdiaEFlaWYvUTRITWI2TDA2NUl4RmJOL2lmL2U0Q1lUK1NU?=
 =?utf-8?B?bHRCRkUra0tja0FXMmFXOGNmTkExUE05TlpQWHFUWndBbUJibUxLNjNocGxC?=
 =?utf-8?B?WjdLQWQrZW5rVEo1bHJZcVBHNTJieE1DeEx1aXVSK0E0MmcrRHJXVCsxVU5n?=
 =?utf-8?B?UE5HK2U0NTFEN3djTjFZVzNyZVpmM2tKTHFLRS8zQWZnZm8xQ3pNaEd3eXpP?=
 =?utf-8?B?ZG45ejI0ZDRvamlSTnh1aFhhNjZlUjU1clF1NDdISmZLUXlLZ0hWS0M4bzdP?=
 =?utf-8?B?RDNGMHhjVUp4OWxUbTYzUlJ5SU01aFk0K0d0b3l3L1hGMXdRR1lSaXE0Y2Vq?=
 =?utf-8?B?b2NBQmlkSjhRWmdLdm9QTTdxVk4xUnp2dTNBUHNzazU0cTgvdS9LWDgrWmVv?=
 =?utf-8?B?K0tLT0taVlNZY3I1a2NqOHVCN0EzS2xoQzRpNUE2NGNYSktMSmljbm9NaHcx?=
 =?utf-8?B?TDZXT0N1RUY2VXp4bmlLejJJQlU2SW9oYkNGVUxEbUF5NFBmcEVBOVdwbDJs?=
 =?utf-8?B?blVSaUovK1Q1VFNJaHgvU1p0blA5YnMrQ2U3ZERMMlRrVVRqd3E1MGNmMUNF?=
 =?utf-8?B?Q2NxRWZGeTlzVEczYVdqdkxWa3dWa1hGbElNOUxRYkk5YzNHWmhQYW9Mb2Z6?=
 =?utf-8?B?ZFM5QnlFakFFanRtbXpDS2RoR21zcDc4eWVkMTBaMEw5NUhRNWlVMHYwVk9u?=
 =?utf-8?B?TlpldVFhRFZld2ZvNmVjUnVJOENzYms2YmtVSEVpUFVvVExUSWUwQndsL3hu?=
 =?utf-8?B?OFBXMVl0ZWwwODFSZEF1L1FUSmFQcGhkOHQwWGdQWFpBMmhVdmJseVFZNGRF?=
 =?utf-8?B?YndZVldudXc4RmlpR2owR09oemRrT213dmFuTnBaNjNaVVBrWXJsMldqY0NK?=
 =?utf-8?B?NmgzN1draXo4UEI4QVYxUFN3VnkwT1o1RDhPaE5tU2dML1I5K3VqakxmdXJI?=
 =?utf-8?B?QlpYMXlQSFZBRy9jVDg2dHNXU0xHMkI3SUM4SHZPRnRoOUxpUWdnVW0rR2Jy?=
 =?utf-8?B?VlF1TTJnRnFpOTcwanUxK2p4WGdxV0hTS3k0UkpyMCtlWWNEL2xEVHYyQjJL?=
 =?utf-8?B?VTdMSG9WYXhCMVgzeHdybkhabkIvclh0SlZVeVJnRzlpSjVNSTRFdGhJWUoy?=
 =?utf-8?B?S3VNRkdvd0ZpNHVISFRCZXNiYk1hSXlmckZadDR1VlhXVFFOMjAxYU1uUnBV?=
 =?utf-8?B?a3hBVVAxNDJmOGt2elA1QkUxYjNDK3gxY3M2YTJkMjhtblVSSlFvcWYyK3Bv?=
 =?utf-8?Q?hkESyDZF/1hBomtz2sDsD2gRTSDKtg026Jzltu/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c310b6bc-7534-44b0-a76d-08d96e0ec792
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 12:40:00.7959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poM49VxOng+SzLWmdmziG3BY1ouHjLlrPZ3iv9Hit9WrU0E7Cb+llGzdC6Zgmol0mMubuakT7RLvLJg6nH5VdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 02.09.2021 14:15, Juergen Gross wrote:
> On 02.09.21 13:42, Jan Beulich wrote:
>> On 02.09.2021 10:30, Jan Beulich wrote:
>>> The code building PVH Dom0 made use of sequences of P2M changes
>>> which are disallowed as of XSA-378. First of all population of the
>>> first Mb of memory needs to be redone. Then, largely as a
>>> workaround, checking introduced by XSA-378 needs to be slightly
>>> relaxed.
>>>
>>> Note that with these adjustments I get Dom0 to start booting on my
>>> development system, but the Dom0 kernel then gets stuck. Since it
>>> was the first time for me to try PVH Dom0 in this context (see
>>> below for why I was hesitant), I cannot tell yet whether this is
>>> due further fallout from the XSA, or some further unrelated
>>> problem. Dom0's BSP makes it all the way through to entering the
>>> idle loop while all APs are still in VPF_down.
>>
>> This last part of the mystery is now solved: By cloning from my PV
>> .config, I've inherited the X86_X2APIC=n that I have there. Yet
>> ACPI's MADT gets populated with only x2APIC entries when building
>> Dom0, which such a kernel would mostly ignore (except for logging).
>> IOW in a way this was indeed a missing select, except that what's
>> needed wouldn't quite work yet:
>>
>> --- a/arch/x86/xen/Kconfig
>> +++ b/arch/x86/xen/Kconfig
>> @@ -83,6 +83,6 @@ config XEN_PVH
>>   	bool "Xen PVH guest support"
>>   	depends on XEN && XEN_PVHVM && ACPI
>>   	select PVH
>> -	def_bool n
>> +	select X86_X2APIC if XEN_DOM0
>>   	help
>>   	  Support for running as a Xen PVH guest.
>>
>> This is because, as mentioned, XEN_DOM0 gets turned off when XEN_PV
>> is off. Whereas x2APIC isn't strictly needed for DomU afaics
>> (MADT gets populated with LAPIC entries only), so the "select" also
>> shouldn't be unconditional.
> 
> Correct.
> 
> We should rename XEN_DOM0 to XEN_DOM0_PV, and add a "real" XEN_DOM0.

Actually, as I have just found, the lack of XEN_DOM0 _is_ a problem:
xen_initial_domain() gets hardcoded to 0 without it. I'll have to
make a(nother) patch along the lines of what you suggest; hvc-xen
and "earlyprintk=xen" also don't really work together, because the
first thing xenboot_write_console() does is a !xen_pv_domain() check.

Jan


