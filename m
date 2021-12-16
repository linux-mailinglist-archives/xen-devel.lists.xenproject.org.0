Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64F847799D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 17:49:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248113.427945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtw2-0007kc-Ry; Thu, 16 Dec 2021 16:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248113.427945; Thu, 16 Dec 2021 16:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtw2-0007in-Ou; Thu, 16 Dec 2021 16:48:50 +0000
Received: by outflank-mailman (input) for mailman id 248113;
 Thu, 16 Dec 2021 16:48:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxtw1-0007iE-LL
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 16:48:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09b5d842-5e90-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 17:48:47 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-_iyWVJgFOFqjq_uviesjcA-2; Thu, 16 Dec 2021 17:48:46 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4787.eurprd04.prod.outlook.com (2603:10a6:208:c8::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 16:48:45 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015%7]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 16:48:45 +0000
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
X-Inumbo-ID: 09b5d842-5e90-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639673327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TqfQa9/wCrVuMkcpcsVM8531BUDQnVWVKZxdU3YhBW4=;
	b=XcCf59XG+eoGxrQ3grJbsqfWJO3LkYe6ml587Yhl15jHSeaZK5CjzyqzVomJl++iKqckaj
	FPhq1TKOx5wNOhoi0gRBmz+CqFWGsdFbdPza4Del9VMO06w/GpGJY07yhgFxevcIcDqPxv
	oe/HxcZQ+B02wAPpOzpQvWxHBKNj6eI=
X-MC-Unique: _iyWVJgFOFqjq_uviesjcA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHpE1GTRSj8cH4AH9tM3bZJZPq2xxJ1k7krHw/nQtL6ia/21V53eILK7EopM55VPCzq7LbtAxDI1GJqsVLFLA3QPVTs+kJr+WVNIBVR19N1FeFx+OSYeinAPCbe1u/9B1rkA/09jvxt1SpbQZW+hnEpLr1Rg0NPBn5jdgA4wPwAEhtP/hA9L8PebDcUb+5ZNMDQfTZwOTByjWkeFIIMll6hbu0b02hBD7mznttfzP0heZ+9rqtetZBuA6Dfx8BcXlHziJx03x1mVTZvqrOmxPugBBjXh3Z+QuT3spYInBff+lmOUX6UXmWcHqUiFbzYtz8vHay+O3cFL/bAruIlFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqfQa9/wCrVuMkcpcsVM8531BUDQnVWVKZxdU3YhBW4=;
 b=B+bfYG4tTvzBZJR5I8cQnJFQ86Ax6wnIIgSj4Sjh3GyhJ8TCUSBBUU5mvjTA+g3okLfcQtMHa9w0jrHM0DvOnAuxiK7+IUyopeaKsf6mmz73ylQDd+jNxsFBFwNNMe0Gdi6s52KWIZZ0mb/IaM4I8j77QzmOMwm1I14+mOPodcPITmI6vQySFZIHPyclQ7/DOeMWC8BEZr0ER53ftCpzrk+WBiA39ieioFw4scTkA+ITl2/ETnyNs5r0nuwTs0GGQ9JWRKSKE0MnaUZCwUM0LiT+pSPZ2LLwwbD8NCAcaui+SfIj4oOoleEUcX3li/X1h4HWNk1VRtWYCAH1tHEJFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa22681b-4cd8-4cc2-109b-53fda66c4946@suse.com>
Date: Thu, 16 Dec 2021 17:48:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/4] x86/cpuid: Advertise SERIALIZE by default to
 guests
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
 <20211215222115.6829-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211215222115.6829-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0103.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::44) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86159d57-8d0b-4c85-0282-08d9c0b3ec71
X-MS-TrafficTypeDiagnostic: AM0PR04MB4787:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB478737C76D8D64CE6D097900B3779@AM0PR04MB4787.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IccCePtwVg6sMImpmPF3of+Q17SxMyAM6t3vO8LgpWjMG9nh7FbNYeibysxJN9LIevvOdmQ3NcBAGV2gLnIWTWdkPp3UW0eSERYjl4Bv1EXpzviHfSSZwDY1NRvBCiq5Zm2zjHdzjWpEOAQXSof3nHiVk3YsSMLjUcWaR3+qjGU5otJWGRE4wEtGQbWdtg+XT0HTLfQJlK04ZJXyUAgQToFaszKmJ8YsPqAKGEXJ85qCnUIcPARoahF7jKOFNxrzrsjc9ebkUav7LClNG4HXPxWQ2MAaoA60iD6kSmBAMKm5qnGuvfyR0Jc+IIaTCEYBGKGMgWvkzO1UbgTKPBRm0AAcLNodp2P7z5jzUzOW7ryH2+ldZ45J8dmZonkxMxGfFQtpFy45/U4rnfa3AipwueuPDd2gu5sHvI4NHKTa18CIZ6LZuEFUhkEKjAr6wRYtj2SQopHO/SOvcO0P0ci3/HDkYSg9dqC7350wqS+4YxEdap07e9fCgjrzyh67GxWOhQdIFXTj5rlOh/BbzmNMCiXphKDtI9L72bYdjVo23aLCxlpCccoZCFaOwh47Rvx9+ThoaxXDe8AnRs7Q/7ybb0ni3bIVeUB5g+sT5yTODzDdp/mzbEqMYC/zXAi10t6CX8yLxc6zOVaceD1BDzmbrYsserXq6s4rnMMgT43AFnK5BIGp6DqzOm23jynb335EpIIVgnF0TdNHdGTGo7uP/vNa/2rbBD5FodvNjZPFVJ2+OAcRH6OitB7/YBncLcs3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(2906002)(66556008)(316002)(31686004)(31696002)(38100700002)(6916009)(54906003)(6506007)(53546011)(86362001)(6486002)(4326008)(83380400001)(8676002)(36756003)(508600001)(5660300002)(186003)(2616005)(66946007)(6512007)(26005)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFBBV3k2TFZtdHE3YnB2dEp2YVVYeU8wTm5OTlZuUEc0T2VFNGgzOWxuRVU4?=
 =?utf-8?B?VDdXWHY5K01id0dHblNYZ01JMXZacEptK2ExTlEyN29MOFA3VjN3eVhvaWd4?=
 =?utf-8?B?QVhuSGlPU3NUNWwxQTJNZUFxeTJTRkp3K2Z6a1NzcUR6ZUJrdE44TGJNclhq?=
 =?utf-8?B?dUdBNU9raDE5ditEaHdHL0R3bStDWi9NSjI3SytjbGtzeHI5TUVNbUsxdWRE?=
 =?utf-8?B?QmxKaGJlWXdDejZyODN6d0hNcktBLzVaUC9RdUE3N1pXa3hhNlE2WjMwUUp5?=
 =?utf-8?B?ZEhaak9IZVhrVGZ6MG5Sc2cyaHJXQWpPdktGdWlaUmdubUd5UjZZb1FGRGpW?=
 =?utf-8?B?YmJwMktHMmZhcFQ3c3ptaTV2Y3lEY0pRa0hYVDRLeUpUNTA3U3czM0dqSWpK?=
 =?utf-8?B?WEh2Z0xjMldpMFU4N1VqS0cxUTIyMDc1UmRTWk1RS3ZyTlNTZFhXSkpPT1ZF?=
 =?utf-8?B?QnpWdVgxdUY0b2Z4RzhzTlJueDZVMVYwTTVESE1LcFRxbzlLcEFEd2xkajNM?=
 =?utf-8?B?VWdHbFZxNHNMbVZZQWdpMTJ3Z3MxVVRINzUzaThJeDdvMDBLako1ZzdtVUlV?=
 =?utf-8?B?aTJCOFRodE1adHlNaHZPOWtOLzZ3OHd0ZlgrTGdhWCtpajJ4Z0grVUhqUVBV?=
 =?utf-8?B?Z0VYcUJsZndudStGdGJvUnlyWTBLVUgxM0ZMZU9zTUk4MHJEU0lnajRxVzJu?=
 =?utf-8?B?czUzajQveTF3VHV2RkQvQ1NoSG1ENllJV3ZUbUxkc3RtdFZBRVd5WkFGcDhy?=
 =?utf-8?B?Z29IWDAzMi9TdjhzZXJoWXpCb1VwWHJCUlZyQ3Vmem5yeVp2cFlPZlNhWlBK?=
 =?utf-8?B?eWlMV1hXV3B4WGtvc2dFQmVBdldIUUVOYm1tcis4ZW4vMkRoK3VrT0tzVnQ0?=
 =?utf-8?B?cG93blQwYVNIMCs5akdGQ2FQR0dxdVk1OFdwRzN5ekkrTjNBVTJJNk5KOEpk?=
 =?utf-8?B?WWRtWVZxWFkrY0NCbnplT0NTT0JWRDk2MVVUTzRscG41SzQ0aTU4VGx1M3JP?=
 =?utf-8?B?cWphemtvUzFDRkFYc0JCdGtqZkFiVUQ1ekJmcmMydU1QZnZQb2FKbmpqMWJz?=
 =?utf-8?B?Wktzdnp2bGc4ckZORFpSTEYyT1U3TW9GVXUxRWNNU0VtN3ZQU1pEeFNFMnQ2?=
 =?utf-8?B?Q3JCNytGa2owMUJ1UkZTSGtIaDVjQlpIWDd2U3dxNng5Qk9zS3F0WGU1V1kw?=
 =?utf-8?B?QnVKOVFpWGdkb05NTEpVNWVaRTNoZXdOZ2NRQzU4T3Y2a1lnb0YxV2lMc3Ro?=
 =?utf-8?B?L3l0UGg2T2xTWFBjKzFqYUxnMElqZGYyY1ptVEI2TUFPYXRlOXR3MkQ2eHZ0?=
 =?utf-8?B?cThIY0UrOU5Qb01UZExYQ1V3alZzbjh1YzFyZU1EeUdtZXdGTW01WkJhMjVC?=
 =?utf-8?B?UDg2N1RYbjNkSExENmxyVVZNSFRHMDZoNS9RbGxQTWRlMVl4QlJEYjlpNURN?=
 =?utf-8?B?amQzTis3UXZQUHozVjV5bXFzZ0E3akpKbWlJblk1OExoQzM0bVQ2OEhOVkht?=
 =?utf-8?B?dFFZV2czRTcvMVEwVUk4YTF4aEFYenZadjlJY1RyNTF5Vkhmdld4K292Nkty?=
 =?utf-8?B?RTdMMEFTVVpaV1IyVDZ2d3MxRnlaZUF3enIxalhDMGNmYkF4Um04RmRvNlA0?=
 =?utf-8?B?UEtxYW45Ui9sZmtkZ0J4MGVuNkx6eHk3UjYxYUdjNGhjRENGSWpmZjJhTGlC?=
 =?utf-8?B?WEhoQk1HY0UxZ1VsejFHRVV3akl6OXFzd1NjeXRLWWwxdnhyakQreU9OR2V0?=
 =?utf-8?B?UlRBRENPUmJRRFREVmZTcXgvZ09PclZmdVhVb01JMTRwUFpmalJ2TnhpOUFI?=
 =?utf-8?B?Rys5M2xMMnNtLzFwMGhwbHVqeVY4bVFjK3R4R3UrNzVqdGcxNkZSSlNSMStz?=
 =?utf-8?B?WE10SlRaN2krdDYrRERFR3J3ZGs2djZ6Rys2Q0R0S3NoV1dFZE5RUnNHSmNh?=
 =?utf-8?B?bkg1ZE0vY1BnZFFBZG9TODZnUUw2OHFvbENqeGpPcnBYZDlhMUg0N2tJRDlj?=
 =?utf-8?B?UC9YL095SHNKMkkrOGJ3MVpsWTRWRjRwandJNmFQWGZGVnZzVEpkSDZqbS9X?=
 =?utf-8?B?a0RhM0oxMHNPaWlGSkZKMXhBQ0FNOG9HSU9yVE5zZ3NYQ1FLUENwcUV1a2FR?=
 =?utf-8?B?NzlhYUg5M3JpakpLZVhEZCtqeklCOFhsaVVVa2lIcVNZUlQwMVc3STRLZExH?=
 =?utf-8?Q?730/coRflTq9CZo2d77l/3s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86159d57-8d0b-4c85-0282-08d9c0b3ec71
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 16:48:44.9237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cx2s1cDFutFKKX7avH6Cpm5szMGzHm9A+eO7pXl8PakUoBnwR5ddLpGWy9KjPXtCK3phMPibMQ5SqkbatkQMSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4787

On 15.12.2021 23:21, Andrew Cooper wrote:
> I've played with SERIALIZE, TSXLDTRK, MOVDIRI and MOVDIR64 on real hardware,
> and they all seem fine, including emulation support.
> 
> SERIALIZE exists specifically to have a userspace usable serialising operation
> without other side effects.  (The only other two choices are CPUID which is a
> VMExit under virt and clobbers 4 registers, and IRET-to-self which very slow
> and consumes content from the stack.)
> 
> TSXLDTRK is a niche TSX feature, and TSX itself is niche outside of demos of
> speculative sidechannels.  Leave the feature opt-in until a usecase is found,
> in an effort to preempt the multiple person years of effort it has taken to
> mop up TSX issues impacting every processor line.
> 
> MOVDIRI and MOVDIR64 are harder to judge.  They're architectural building
> blocks towards ENQCMD{,S} without obvious usecases on their own.  They're of
> no use to domains without PCI devices, so leave them opt-in for now.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


