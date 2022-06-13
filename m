Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FA4548005
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 09:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347769.574092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0e7h-0001kn-Gs; Mon, 13 Jun 2022 07:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347769.574092; Mon, 13 Jun 2022 07:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0e7h-0001hm-E0; Mon, 13 Jun 2022 07:04:29 +0000
Received: by outflank-mailman (input) for mailman id 347769;
 Mon, 13 Jun 2022 07:04:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o0e7f-0001hg-NU
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 07:04:27 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe05::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fbedd62-eae7-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 09:04:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB3611.eurprd04.prod.outlook.com (2603:10a6:7:87::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Mon, 13 Jun
 2022 07:04:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 07:04:23 +0000
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
X-Inumbo-ID: 0fbedd62-eae7-11ec-8901-93a377f238d6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSUjFW+Dgl7GdLDG/L95oXLVr5abz9yD6y7oiiwXr+jar74F5U5nJldN0fLWah5S2rOMuxe5ghbAwBChpg9IXTxVh7/acZO8mhfBmQhHqXWgaiLnvkMJHFvWymG2FjZJ/uMvAjGUgyt2UQh0eUjdGM0J8B8IZwf5+1ZTDbdaB0jGb8axK35mrcGDIydtOi69FOx800mWYjm7g5eyi9tfn9q2FJAsKj2AMUWUbMVNCMxwY4feS1vV7JLG9ij2rYHZX4QWbcmFI8qMBSCWCqZWcXvGHHB7XWq/m0HmGxmX7+xK78L69r24gi0rIsd525XFHYgM9yQILi4oNPyEHYETUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szkmJEdVyBE6hyeBpHT+9SbE+OaQlTpnUNFdqDV7kXM=;
 b=OsqdZvp7VTNfy4nN9EGbqueEJ/NnVj+AvMsQB+cUXSA7Vlt7ll494ddpiteuX7+or3agTD4vXFMPSWTFCYjQAjXkCT99aHc/kBH+3BqMKILmkMYUPU+DNBFJR3WTS1b6NUVAj7C1mmN35FHzi9JXI7dz/3gMNQDfQY3JzLMtHMwM3wmuJVUvqPkjnVzd7Abxd0OOA2D8Iu60/3qL5lEqeFYQ2f7aTUjToH+NNKEcZzZIFnIMFl3xQ4CRqMUWHFXAV77VV9bF1Q2QY9sf2LsC+TpwuOMWCAAinbDtqbSt/sNtH/CeWlHAC6hUjg/GKmg9DajEL6t5m26rNZ/wEhAJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szkmJEdVyBE6hyeBpHT+9SbE+OaQlTpnUNFdqDV7kXM=;
 b=qxIXJOwe3WrntSeLfjivvwsGEFM6Wa3g43SQOdVY3kDjUp8yNT+OQ1fri/1eksjlJxGm7oSrtdS+d/dgLpL15vppE+HhduVCZJMuN0TP8/9N5PFPUKGQ3UiFuWGlOUO/Asm6zNPBe/Ky9TGMxuipbK83GI2B5+toQI0AyrzkbuvtZtE4KDRtYgKXAoU+VAplozDC0CN2qBlSVAnzqabltOr21gO+9jGqBqLexF0EMqpuv7fdKk+3ixuSS2BpEkyhJ7llkyUjtAcknECaHolwjv4OCsvuhQijWSeIlf0FeObZdXbs1Fcp3IsleGhwcz1dEAE2IlqBqj0h9lwJnvrYjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <406ff587-8faf-f233-c06b-b581b0fe9161@suse.com>
Date: Mon, 13 Jun 2022 09:04:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] add more MISRA C rules to docs/misra/rules.rst
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: George.Dunlap@citrix.com, roger.pau@citrix.com, Artem_Mygaiev@epam.com,
 Andrew.Cooper3@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2206091748210.756493@ubuntu-linux-20-04-desktop>
 <c61f607b-bfdd-3162-7b26-b4681b4cce59@suse.com>
 <alpine.DEB.2.22.394.2206101420290.756493@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2206101420290.756493@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0011.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46feb95a-2c39-4a21-4db1-08da4d0af1f2
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3611:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB3611042F44882476F313D7E8B3AB9@HE1PR0402MB3611.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cZu3mkIIzQoOX4G5vIFR4Dfi10Fkcr8eR4lu3LH9b6QZzpzFy7a5QO9lbaJNNLr1kWeV+r54+B4t6VEetS7A9SwLtsRJipzZQSTJB23Hv/tT5J6OwJU7pwRI2CBGDV4ntO0Z543cFg/Qq6Z8NGVJu0Gi4hCvP6E1Cd3zSZSTpfFjzwL3f3E65izgXRUP3NsPpmOvI7E1VVal2y094Zh79allxSNDtpsvAXsdJqU48kVgPgeRIro10xpM+Bnsp5ulxuTBx8lMqQZtAEU+aPRDnlpaf2a70ldjrFyB/Be1D8xHGoTP5KdhSGjg1QrapPnd/7W2kCNZP87XAXUR82La5nw/C9rQM0ELo/hdjsLc16s+A3g7iMpyX3ZC0o9Z4uXPY+oncbGMnF0owJ1rdSTByT4h8VhhcZRy93eOqyhHIqoIoKRIgxd0nlUxZV6qkjwaNNlDFWMiYmPfo8k5Ais+SutyXlNjsF3YjM30uzX5Pygw+TxRFdQhNMZ7dnjkbQDT4HiT5qf/J+DpogY+v6dCt8n2yYqIQLlxjuRG/M1GqAjDZD3WxPU0vcXryBHHHoe2/2RKzXAUateZmOIuz8EE849kdnQ56D+mTOEjadSB10aXrNASiroQoQsA4h+3MFYgWeHYH14L/1wp9uNWqIdLyEfEA9ys/ZFfiWeehH/pedApUWsQiVfKhienwlE+d3NP6pgutpWXRJOa3RXOcXOQkX1344uTvL7ABiNwk+etjdp76DZ8/z620c4SCADkGUTp8oHWgBup4sN99o2Zw1BAWFgAwbue/JLY03coJk8HkpZ8GwtKgw2VcZ97I8lLEsa0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(38100700002)(6512007)(26005)(6916009)(53546011)(86362001)(186003)(2616005)(8936002)(66556008)(83380400001)(66476007)(5660300002)(66946007)(316002)(31696002)(4326008)(31686004)(8676002)(36756003)(2906002)(4744005)(508600001)(6506007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UC8rSWQrTyt6OE1laWFKYTRmbGpnRHJ4UXBHMFVkMW1MUmtrczJ6TjFDRU9w?=
 =?utf-8?B?RmVqK1JqWXpzdWZtTjJXeitReGFlSFNwOFJrZFhycDNoRU54Q2lyNjJOZVRJ?=
 =?utf-8?B?T2JmOVZyckhsSHQrV2V3S0RHYWdTNDhGT1E1ZEtya3FYTzZoVVlOTEFsTTlT?=
 =?utf-8?B?VGdicGlXcmxkZDd5blZvbmVxb0FnWTRIamxsNFZvdUxKOHMvbUxrWmdMY2Vv?=
 =?utf-8?B?MHdESGFhYy9OS1BkeWsvSjdlSjZHbHd2NHk1YU9SSU5uUGFFMmRuRk83eTQz?=
 =?utf-8?B?dEJRd0g5VVUxbWhJamRVeUY1YnZFM1doL1BPMlUyck1CSiswTVdGcldSeXBz?=
 =?utf-8?B?dGxVQm5OdHJZc1hVQnRsYkRoYzNlQnY2VEdUaldaaTBqWGNDTk5pODBGbG1Y?=
 =?utf-8?B?aWR5UVQ1L2VMYlR3akEvSkY5U01xdmNVMkh4emRpMkNXZDVJRGEwV2xyNTRj?=
 =?utf-8?B?cHpleGJCRVlpM3ZuVFNWbVJFeVJqbGZsTDJVZnMxbThnaUlCaEROMElJVWpC?=
 =?utf-8?B?L1NwNEtOU3hNS2g3VDIrSW9LOHBuaWVjL3lyNllSQms1M2NWSFlWNGpXZTd5?=
 =?utf-8?B?bkx4L3YzRUhsMDZPQkRJaDZHM3NpdHUxMWYyRFAxSjdDRzNpUk1nNVhqQWVS?=
 =?utf-8?B?dUx5U1BmUExGS25hRFFEd0NSODVzK2x4T0F6YWxPYmJFNUdrUU1xZVkrS2Ir?=
 =?utf-8?B?VnArdTBsUGdlTHozTmdkSEhPajYrREN3MC9MdHJjK29wNW5XdzExRFVsOFUr?=
 =?utf-8?B?MG1ndTlORlFIUjROZ2ZBUENMSWcyOGpGNlBHOFVvM0pYNU1DTWVndW0vbWRz?=
 =?utf-8?B?WnFxa2owVWlQejJ5UVV4OUtDNTQrWFNDRkQyeGVUcXpONzh3VTcyeVZpcUpE?=
 =?utf-8?B?M3hvUnVrNWpkNnJnVHh2bFJHVllCb2xVem5SYnVsRFluL1F6blVHUGlzK3NM?=
 =?utf-8?B?UEVEWGFsdkNpNVRQNk1OTXhLcDExMi85NW1RZTBqMjlLdHhKWGZNTi9DK2lL?=
 =?utf-8?B?ODJPeVJ4K01vQTdhelV3MFc3QVB2UjNDN0pmay9YR2JHNC9ieS9OWHFqaXo1?=
 =?utf-8?B?SDhsU1RDeUVFTlFzTjFhQ0tMNnJ5SU1tOW16ck5HWGtGTHB6NVRXNGszTXBZ?=
 =?utf-8?B?MURYSXpSQ09GR0Z2a2JoOGI5MWFEVDgyZnZYbG1oRHI5ZisvQVdyWkluVktE?=
 =?utf-8?B?cElyLzJjY21Ka1Y0U0NOeGR1VWRKN3cvbXRpamxoVDZyY0VGWEErMlpZcnZr?=
 =?utf-8?B?WDNPSW9VNm1hdFg5QitoQXVhaUQzUGRMZm4reXVUN0w5OGc5TjRUbnFHTks5?=
 =?utf-8?B?aUcxRVJ4TTJVWmpHdzk4bVBNQzlMOWhzZ01XUjFXL1lGMlBHWmo3R3NhZCsv?=
 =?utf-8?B?Q1RRUkRSOWZEMVZQdkNmQVNray84cHZlV0w0eS9mQ2xmUzlKU3M0RHFwWStL?=
 =?utf-8?B?NVRaZUdtM1o0VllrWm5UVGx1RWxFazAwY2xKcTN4V0Qxc2JkSTJyK3dDK1dP?=
 =?utf-8?B?dHE4QUJEMjltRHVQdmRiOXNqZm9kNWZldk8vdnRMTUp3MEg0SW5lTjdzM3Vp?=
 =?utf-8?B?cU13dWVQMzVrY1N2NldYbHVCRzNLazRuSStYK09WOFJsOWNPWUZ3eVRzV2lO?=
 =?utf-8?B?RDUxOUpDZytkOXBTYnpKTmYzbHdDaGtTMEVhOXRqdXdhSngzeWluY2pGeDlu?=
 =?utf-8?B?eU1EdENJaDk0WE8wR0MxMnpUSWZJTkV0Q3FpMmppZk9wQUR5TmtlUlRNRUUz?=
 =?utf-8?B?eXdVMGZ3SldCQXBkd2g5VldRUm9VMjdnR0p2b3FtM0FtMHN4SU1Ecy9rRHlY?=
 =?utf-8?B?ekU3REtYWjhUeGxOQ2V4SFcvSWpTemU1bTk1Q2haNC9SMU55MXRZc2N6QUVh?=
 =?utf-8?B?NDFlVWRFTTJsNllYbzlvUXNIRlhzRWFJejVjM1Z4RkJLblZ6QmkyeTNZaHFM?=
 =?utf-8?B?RUUrdXE4UWRyOUtWWnJvb1Q0bTAvTEhVTnR1ZFFBWmNSc20wbHptRGkxQytm?=
 =?utf-8?B?SHk3b1QxQkFZZEVNZXFoREh6dEs2WDl2b3dveXE0TzkzN0NUbHo1WFZlL1hy?=
 =?utf-8?B?dzE1SThpSUxPNTVyOE5XVVhoRzRsTDI4SG5lQTZzTG4rdWtTL3JFZE05RFF3?=
 =?utf-8?B?VXEzeUI4NVA2OUZYWHBxRHZyOFpaTGhxcmxUVEUvdEgzbWxSenBwam94ekpx?=
 =?utf-8?B?bS80WXBGMHJTZ3J4dUU2M2xnQ0tPbFVFRElRWFlxM3JhQjB0REF6TnVGYXBE?=
 =?utf-8?B?VkROY1FPMHZZbm92QmJvN2IvRUpXNjJvRTBLOUl5NkZFdWJGQ3BYdkJtR1Yx?=
 =?utf-8?B?d2ovUzUvR0xTVVpNNVVUdUlVM0ViUVgyUFNCNTNXdGJwQms4T3U3QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46feb95a-2c39-4a21-4db1-08da4d0af1f2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 07:04:23.2421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TQ/HnVj4KknzsR8nCJCnHUtjE918+mF3/RvYFVPpdu9VImears5XyOvxb+BUmfCwPtxvNdk2Kxb27ZhFBdXmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3611

On 10.06.2022 23:24, Stefano Stabellini wrote:
> On Fri, 10 Jun 2022, Jan Beulich wrote:
>> On 10.06.2022 02:48, Stefano Stabellini wrote:
>>> +   * - `Rule 14.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_01.c>`_
>>> +     - Required
>>> +     - A loop counter shall not have essentially floating type
>>
>> This looks to be missing "point"?
> 
> I am not sure what you mean. Do you mean "floating-point" instead of
> "floating" ?
> 
> This is the actual headline for Rule 14.1. MISRA defines "Essential
> types" (8.10.2), so in this case it is referring to the type
> "essentially floating", which includes float, double and long double.

Yes, I mean "floating-point". But now that I look more closely I actually
notice that the C standard also uses the term "floating type" in a number
of instances. So perhaps it's just me who considers this odd.

Jan

