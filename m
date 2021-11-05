Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE684463A4
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 13:50:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222305.384434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyfc-0006pT-7M; Fri, 05 Nov 2021 12:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222305.384434; Fri, 05 Nov 2021 12:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyfc-0006mk-2S; Fri, 05 Nov 2021 12:50:12 +0000
Received: by outflank-mailman (input) for mailman id 222305;
 Fri, 05 Nov 2021 12:50:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miyfa-0006mV-TM
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 12:50:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8ce4933-3e36-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 13:50:09 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-Tv8zj7NjM6qpVY85X1Tnyw-1; Fri, 05 Nov 2021 13:50:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Fri, 5 Nov
 2021 12:50:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 12:50:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:20b:462::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Fri, 5 Nov 2021 12:50:05 +0000
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
X-Inumbo-ID: e8ce4933-3e36-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636116609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsmaAP8oZ7Snerm7QV7ZROMuDBqUeEqa1aL3UwUf88w=;
	b=aU8YoDZF8ZijLHOswq1jDXEwvbifGmiRVtTeRDEPWmpHENLFr3YfpQGsTFp3tbfTAMFhnk
	FTxNqOwWrcotgAGlmyQ5GhkHwEOrEZMMZ8ecn6OK+QNVIFKeL1DLWqUbuG9zeUmgthD2KL
	VAv/JdnPaRswzV1/no+PcKA/DXBDTrY=
X-MC-Unique: Tv8zj7NjM6qpVY85X1Tnyw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URAaA5MW1kY7RqthIXAi1zg4+4seI1ewllGqxdnubMDMv6NWuTOoZJwcYpAZKYEE6pH+PYDBANEMlck3V7TM8KtieYqD81mL2Fdc9yG99ccYGcu27L0UPv+GhFDCM5G/nzZhh5MMMRpNSGKJoxzMP3S8AHAEsNPKLFlR7JPC46vRa2xyWc9/ErZTqTcDPHyqyAFJ3lNhz8yed8J90KtaXirsJ+TzKSpWh+HUh+fR8qGnGVr/uCvMDHlQ7EYiar238jiYfN57Sd+rt7kePIje54v4+unm3YDYRPSVov9VlmZW+bM9H1apo35I8U8xbjbweSH3XYLkBvx3EnWgILGDoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsmaAP8oZ7Snerm7QV7ZROMuDBqUeEqa1aL3UwUf88w=;
 b=jaQ/UfoOO6mOVydyGXIv3Iln5z/uQZTGIzjbCk+jVYQ2tb3mg27xOuD2h2cbjRKwm4Hi5+PUHHu0/Wj3Tfj8sQGziF2BSQeqOXVKxA47h1tzM0H4THr4q22sPQ8HQAVJ4Aj8/ASu1cNo1+8JMpkZ435GdoBxh8W0fhDIuZDd/lp650lQH0WwEK5JOM9QNYPyAS2VvbcGx3n5kuKZd5nb/g8Zzm6ijucgCh9fXQ+YSQK61VIWQy7Lxx1PwMVMJDY7j5vusbgSoQDyBSeBUcI+/KKa99V5229+ppxis3Mv+/8FGGhK6/Wx3rkG+yLHFVKFqQ8/ZHrev7GCCW3vNducDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06be7360-0235-3773-b833-3e0d65512092@suse.com>
Date: Fri, 5 Nov 2021 13:50:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: xen 4.11.4 incorrect (~3x) cpu frequency reported
Content-Language: en-US
To: James Dingwall <james@dingwall.me.uk>
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210726123332.GA3844057@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0024.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e1812c4-399b-4907-371b-08d9a05acb04
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB667126F133CEC99145EDBF57B38E9@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6u47DoH9iMnw7JHORyD86vg7pRTMVMgul5cG+VM/xhbuGpcHDa2T/bSeKAHKdZMh2kWS3CFzb0hcyq1EnSxeo3fuRZvM/AbgjWwAYIzb/7Z1WFkVrCWPQQ4DHpEawJTivs2+BCkTDNG5Ga8tfei0Str49yHXNxq8LS/IVyCSoDG/tp3iwM5Nf2vNXc8uV2simB7l2akDEeF8Nx5bxSldsB1dSPc0VapPHScwaN/1eC0PrNcYfS+YxwSB5x2Vq46jkZ9W+c3VBRNPF/4z7AyXMJKbEB1BuSp3iESRlo65n3DwmIWqzqExakRXp4b3xAGz+N8Fqv64fITKADXFfGZTwfRTBEmhhmTvEFve5yJVLAU/hbBvelupNXbGTu4sJIAKQvXsuJKwvvSx9CFT2/BRLruYZ1V0N8y9FO/6n1ZaJXOPqqiPd1zjdwEqodA/yZV/bIAUfwRLBpGzb2TibCgjjDYWNj1AM909cWTbhpLNYbNRwPGuAJYzbH2SCnoNhyf26ws8SAGBSRBIqmdinBpyM9IBzexm/bmtMCe8/lSF0jfNLTIGaqfrUDHWrTzy/1UgN6ElCyY5HJyCYH6dW20lZ0gV7ghUHCFRNNL/nC56arz3u4aCOdbVONpYRQ9E9Rd8DkxZ/NXv4qpI0et2DowzDqt5b6daKT5QE5CtJ5T4Etgiflof97V0+Mvs1fPsEj6soT8KhhwtckqQOPsLKN4jb65pVPCaPAF7p/7F1APWnoI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(83380400001)(66556008)(2906002)(6916009)(8676002)(5660300002)(31686004)(53546011)(31696002)(8936002)(6486002)(2616005)(316002)(26005)(86362001)(66476007)(66946007)(16576012)(38100700002)(4326008)(956004)(508600001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWlhL0d3ZDB5VCtacEtkd0tPNUh4N2t6K3d1dkxidVh0RVVhQXZkUzQvNTJW?=
 =?utf-8?B?TkorR0pCOVJvNWlMWTlMOGo5U2VtclJrb3Y2cXBMYlZzblVBeUltODRlVFZF?=
 =?utf-8?B?YTlzTDd4ditPdW9qbjJ4UDdPTVY3TkEyRzA0MzltVlVoc3lzRE82amdoWDRR?=
 =?utf-8?B?bDZGTDFlZ0pIMU83OGF5OXRuZEJ0cmZVYXJSSWpqcUhyM1hLNXlRNVFpV3I1?=
 =?utf-8?B?dkVISllNdmY1VjY0Zmc4SkhIYWNzVTNqT2lHQjRrQWFld0VLVnZsMGwvM0tp?=
 =?utf-8?B?Q00wWXlXdnZoTXhnM1M5T0lGbUpVNzB0d2FwOEF2SlluLzBSc3Z4MlAwWllV?=
 =?utf-8?B?YW9ZYnI0MUNGcHVrQjUwOVJ5WDB0TzRMSW5rVFRubFFIN0c2T2pTeDRyanlG?=
 =?utf-8?B?MThTWFNSMlZLakhEbmo4VTZsL2RzTmt4WVZkUU5aaFgraFZFQ0wzOXJ3Vno1?=
 =?utf-8?B?QU1Za09oZEJ2YjEvUll5MjhQMDN2NHpXQTBFbFZxanp6NW1iZVRURmNUS0RX?=
 =?utf-8?B?ZnlmL0pRdDV6bFVOSE85dU1QUkpmS0ZJM1V4RHBpMVo5Y0hWaHMrd1Vtc25L?=
 =?utf-8?B?V1dRMm5vL3B4UEpqNm9sZWV3Znd3NlhGellpMWx2SGZXY2Y3QU1QdHlTc3NP?=
 =?utf-8?B?R0paenFOcjRLSXJMSG0zM3F5TXNkY2Z0TzRSZEFpb29lb245VzZvcFI5RTQx?=
 =?utf-8?B?dGI1YzNVVUhTdHB2ZnE0dTgyRE9TSkp6bGxuT1B4QXdRcmJyekVIbERvam1X?=
 =?utf-8?B?UWttQ0ZOT0lpZm0vVURQNkRYSHU5Y1ZJYy8zY1UxaTJORnFNbHE1MWRnTGRC?=
 =?utf-8?B?Q2s2UGwrVFM0R1FTbFBnNUQvUlNQNG9QTXkwL2VweDlIeFNQQndVODh4MzBj?=
 =?utf-8?B?YU56QmRtbXovSVN6T2tSaW12NU1zWGE5NzU3SWRGTkFDNTVOOVlDVlo5eHI0?=
 =?utf-8?B?VVFaVHhNcFZHK0d3NHVzbmd5Ynd6N1FOUlUrWGZIdlAyY3JlVnNkWUg1S0I3?=
 =?utf-8?B?ZUt6NmJNTDh2dlNUOWExUm1KaGxVYVdEcjhUT3h4bFZmR0xYOFZZVVQyQ0lE?=
 =?utf-8?B?VDkwQ1Q4WWErU1Z5UkcxZ3FsSHFTVlBtRXE5MzViZFkxVWJWTHFncWlYOWFZ?=
 =?utf-8?B?NDRvVnMzdXV2YXB5VmZUODFyTjY5U0xmWVU3cXFOdEc3eGhhRGNmKzNLQkho?=
 =?utf-8?B?WVRLZFFmb1VLbTNFdkx3bGt1clV4c1drOExZbnFpUC9SaGQ0d1AyVkxjeWVj?=
 =?utf-8?B?UXRKa3VWTEZidXJaUHoyaGcycHNXdnhLMTZjZk5VeGZwV0pMMVNJbjVzaEcv?=
 =?utf-8?B?RzJXMUNFNW16V0lxMUVhbWlwSGZDWlZVdjdxaEVaZ1AwdWovcWRFRDliRWtu?=
 =?utf-8?B?UzI0MENCbEVncUJHd3N5RnduYktZZWxmYllIUlhGb1dHRG1zSHpQRmFXWEFx?=
 =?utf-8?B?TDBtemZldkYyalMyNTVpcjBYOFNBQ1JRRU1vL0VkUlZDYzM0UDQ0clpjUi8x?=
 =?utf-8?B?dXhleVArV1NuVTg3dEF4NWdlbHVrTS9FZXFIR3h1QlI2S1lRcGZ6N1FxTEM2?=
 =?utf-8?B?MWkySHRweUdXOUViN1F0VVRRMW5aVjM1SEhRbEF5VkhmTmJNTXFFRVVGaDBv?=
 =?utf-8?B?MWVRQWdxOW00RHg0UlZwOWtzUDN2R0xLOXNMNjVyazJCSHNFMVFuc3RTd1ZB?=
 =?utf-8?B?czJBQ0E3cUs1SG5vN1ljdkdSRm9Jb0RHd3IrcURFaGlGUUVPaE1sU1p4NGxX?=
 =?utf-8?B?c1RHQ3BTdDNVU0lVL2c5cFVSMUhIRGNWRjEyMENvTHRjQk0vTTZzcjFiSDRz?=
 =?utf-8?B?MmgzNURpK1pScEx1RFY0cVJkZnN0b2FwSnM1bHRSRFRWNnZLeFFxbkY2RG5U?=
 =?utf-8?B?SXdxMU5qVS9TWTZ1K044QWtodGVXUHRsYVFoV1UxTVQ4U3A0WjdDMS9yb1dY?=
 =?utf-8?B?QTBheUxJMWZDeGpZaHdnQ2FsTnkrbVBFTTBzQkdsRFVwL2wvbEJ3ZUZucWFz?=
 =?utf-8?B?VFEzR25MNmh4R1pUUUdGVFpDNHY5RUR1dmhEMStsVWdKdy9vTVpnd1EwWEpt?=
 =?utf-8?B?ZlVFNGZJWGlwbmlJL1FYV0JLRkxIYTd4TUxZbHJVZWZUREVERnBHNWZFa1Y3?=
 =?utf-8?B?YWJJOURsUE5hbGFDVnBPN3hLZWpJOUhQUlpnTUgxb1hXTmhSL2lNSTRXbTB5?=
 =?utf-8?Q?jWIbrl3cBF/m6AoWOzN5RY8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1812c4-399b-4907-371b-08d9a05acb04
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:50:06.4796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpb7m1VTFubqColbJKOVf5ylN4B5RAm6xYS0UrnbXgrwi1MxlVvQ/1n1yaQ/FQsmOG1fUB2atvSZuGeFxdKL3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

On 26.07.2021 14:33, James Dingwall wrote:
> Hi Jan,
> 
> Thank you for taking the time to reply.
> 
> On Wed, Jul 21, 2021 at 12:59:11PM +0200, Jan Beulich wrote:
>> On 21.07.2021 11:29, James Dingwall wrote:
>>> We have a system which intermittently starts up and reports an incorrect cpu frequency:
>>>
>>> # grep -i mhz /var/log/kern.log 
>>> Jul 14 17:47:47 dom0 kernel: [    0.000475] tsc: Detected 2194.846 MHz processor
>>> Jul 14 22:03:37 dom0 kernel: [    0.000476] tsc: Detected 2194.878 MHz processor
>>> Jul 14 23:05:13 dom0 kernel: [    0.000478] tsc: Detected 2194.848 MHz processor
>>> Jul 14 23:20:47 dom0 kernel: [    0.000474] tsc: Detected 2194.856 MHz processor
>>> Jul 14 23:57:39 dom0 kernel: [    0.000476] tsc: Detected 2194.906 MHz processor
>>> Jul 15 01:04:09 dom0 kernel: [    0.000476] tsc: Detected 2194.858 MHz processor
>>> Jul 15 01:27:15 dom0 kernel: [    0.000482] tsc: Detected 2194.870 MHz processor
>>> Jul 15 02:00:13 dom0 kernel: [    0.000481] tsc: Detected 2194.924 MHz processor
>>> Jul 15 03:09:23 dom0 kernel: [    0.000475] tsc: Detected 2194.892 MHz processor
>>> Jul 15 03:32:50 dom0 kernel: [    0.000482] tsc: Detected 2194.856 MHz processor
>>> Jul 15 04:05:27 dom0 kernel: [    0.000480] tsc: Detected 2194.886 MHz processor
>>> Jul 15 05:00:38 dom0 kernel: [    0.000473] tsc: Detected 2194.914 MHz processor
>>> Jul 15 05:59:33 dom0 kernel: [    0.000480] tsc: Detected 2194.924 MHz processor
>>> Jul 15 06:22:31 dom0 kernel: [    0.000474] tsc: Detected 2194.910 MHz processor
>>> Jul 15 17:52:57 dom0 kernel: [    0.000474] tsc: Detected 2194.854 MHz processor
>>> Jul 15 18:51:36 dom0 kernel: [    0.000474] tsc: Detected 2194.900 MHz processor
>>> Jul 15 19:07:26 dom0 kernel: [    0.000478] tsc: Detected 2194.902 MHz processor
>>> Jul 15 19:43:56 dom0 kernel: [    0.000154] tsc: Detected 6895.384 MHz processor
>>
>> Well, this is output from Dom0. What we'd need to see (in addition)
>> is the corresponding hypervisor log at maximum verbosity (loglvl=all).
> 
> This was just to illustrate that the dom0 usually reports the correct speed.  I'll update the xen boot options with loglvl=all and try to collect the boot messages for each case.
> 
>>
>>> The xen 's' debug output:
>>>
>>> (XEN) TSC marked as reliable, warp = 0 (count=4)
>>> (XEN) dom1: mode=0,ofs=0x1d1ac8bf8e,khz=6895385,inc=1
>>> (XEN) dom2: mode=0,ofs=0x28bc24c746,khz=6895385,inc=1
>>> (XEN) dom3: mode=0,ofs=0x345696b138,khz=6895385,inc=1
>>> (XEN) dom4: mode=0,ofs=0x34f2635f31,khz=6895385,inc=1
>>> (XEN) dom5: mode=0,ofs=0x3581618a7d,khz=6895385,inc=1
>>> (XEN) dom6: mode=0,ofs=0x3627ca68b2,khz=6895385,inc=1
>>> (XEN) dom7: mode=0,ofs=0x36dd491860,khz=6895385,inc=1
>>> (XEN) dom8: mode=0,ofs=0x377a57ea1a,khz=6895385,inc=1
>>> (XEN) dom9: mode=0,ofs=0x381eb175ce,khz=6895385,inc=1
>>> (XEN) dom10: mode=0,ofs=0x38cab2e260,khz=6895385,inc=1
>>> (XEN) dom11: mode=0,ofs=0x397fc47387,khz=6895385,inc=1
>>> (XEN) dom12: mode=0,ofs=0x3a552762a0,khz=6895385,inc=1
>>>
>>> A processor from /proc/cpuinfo in dom0:
>>>
>>> processor       : 3
>>> vendor_id       : GenuineIntel
>>> cpu family      : 6
>>> model           : 85
>>> model name      : Intel(R) Xeon(R) D-2123IT CPU @ 2.20GHz
>>> stepping        : 4
>>> microcode       : 0x2000065
>>> cpu MHz         : 6895.384
>>> [...]
>>>
>>> Xen has been built at 310ab79875cb705cc2c7daddff412b5a4899f8c9 from the stable-4.12 branch.
>>
>> While this contradicts the title, both 4.11 and 4.12 are out of general
>> support. Hence it would be more helpful if you could obtain respective
>> logs with a more modern version of Xen - ideally from the master branch,
>> or else the most recent stable one (4.15). Provided of course the issue
>> continues to exist there in the first place.
> 
> That was my error, I meant the stable-4.11 branch.  We have a development environment based around 4.14.2 which I can test.

I'm sorry to ask, but have you got around to actually doing that? Or
else is resolving this no longer of interest?

Jan


