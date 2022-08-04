Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85750589C64
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 15:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380363.614486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJagr-0005XI-L4; Thu, 04 Aug 2022 13:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380363.614486; Thu, 04 Aug 2022 13:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJagr-0005Uk-HC; Thu, 04 Aug 2022 13:15:05 +0000
Received: by outflank-mailman (input) for mailman id 380363;
 Thu, 04 Aug 2022 13:15:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJagp-0005Uc-P5
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 13:15:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 730ab79c-13f7-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 15:15:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4483.eurprd04.prod.outlook.com (2603:10a6:208:77::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Thu, 4 Aug
 2022 13:15:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 13:15:01 +0000
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
X-Inumbo-ID: 730ab79c-13f7-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAFTfVN+9N7X897Si5ljtR5Re+SvYRexwhbRU9UfxdOfXizyEwsxze4J2y2LtoPEXGzFkzW/AaZW+8zITMzP24skcIFqk5Jk7XaJ5FwN+T0T8I5MKHn4dUyUG2R/KndF4h482MRdtPXN5Q6m1B9HKSYLVsCD0kI9lt/wPVsezCmSp8aB2TML/HakfRg0s2FfiZwSf/dG+OjPmQbxXzCJzF/MNz5AAtjok2uBzeV2PFZAQqJ3PHeZ1bSe5f0SSry8a8uJfombt08Ljb7oV2iXMuKDTe5IvW65RwTL1vaVSqIbne0Sxym92CYD4EjpfdTUQmBTcawTzUPzUoUz68Mfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0leG3UnOELAsabB3Mi2rMLHzKjvgX7rE/0+yWX2OcA=;
 b=SdzGnonuYsJrk24y7lQsfg8kAiJa3yZ8R8sux1BRF1+s+3H/1mtxHUF65/kHZMbF5H1pVFfkO6a8O12rSQWwKwXUfV+eeNObw0go9EFCbmeOOuEUOa8Ght4hUGEOOsxWTL97KsuFdXuyF630No5tkjT0480TYIBqJNHOXSxmAJx7paBXtg+s+ix2lcVcq5gkRPaxVlXHN457wfJvqtgHbfI6XHXWSH5YTow+mEym2uOWis8HwUUbaGxkThzJTDvc0k8LWKNDKRuLmtRCrekk/Nb3pzWco/WiPtnOyZ09HwfsAcPf9fFn4rtHFtxcudjbbHP5hQvoe4kkK61+sA0FCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0leG3UnOELAsabB3Mi2rMLHzKjvgX7rE/0+yWX2OcA=;
 b=zhJkLXBlQVEqThMFMtEcz6YpGrUU2K4q69w0GC6uSEnipNCvt50GIAWHdiDTodE+fqHupSXd81KS4WBZSGJMjqMwNJSaC3duR7O4CH2Py0/nJ4vul2CZ1qiRUFsKnOeuS7cDxcH0L9QrYUv7Y4PZWTbq4UajlvETFLPJcfKC7+spbsXaafufGewZEtHXpvaE4PzXpESnitGqmvwFIKQhh2DA+CyhLFSj9cWdy92cpsFLPZ8rx19ecdCAmq2UGAOFV+zOc0p9xR9ZDCHoRRlb2WfiQ1772o+So/w9S8Y3tyWD/CnRlEgFss4fp2IDmbhiT5uVlCDDqH/99jfOFKxGjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0993a2e2-df98-2983-cf7d-1a20cb138c71@suse.com>
Date: Thu, 4 Aug 2022 15:14:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 02/10] drivers/char: reset XHCI ports when initializing
 dbc
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <0f26cc3299e340f7cea58aa59fcd462abd3215da.1658804819.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0f26cc3299e340f7cea58aa59fcd462abd3215da.1658804819.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4551f17c-bf38-4a52-1e87-08da761b55f7
X-MS-TrafficTypeDiagnostic: AM0PR04MB4483:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gdi3cI5yp/JUlYLn1XIjVGbdMoNmogY/L53s4VCBvZxCK3VDl0CwrIz3BicclPFccj1Vj9W+cjYF8P6tM2WWp+1JJp+A46/5uPKaI0eq1ZfaedptmQwkWCRYYXS+MVrMwdzWfUGKwGlWpkEBqFP9DWagjXHqajxQSLMW0XLlpKY4CYbEeL/qSc+fggexveyyDfoZsvlZ/L9fn3yPKpD9yyh3UFxlsVaVZKtKz6lyVqh3cjdbZAI0mhIOXQLTd5UmnRRXrrhiAF0+5KlGKKv1pkmlpQpExNO/rP04Q/3MPsSpvGlm44DUF7qCrqSXze+Lgz50lHoYIBSgJS7nrdBGah7aNitZ3zsJ2OuupyPs72xro7aY0UL14pzj0agtaTHBKmfsoAWtai38TRPh33siBwrP3g7idOq6a4z33KNviS880uBVtfqqyI9hijzWY8M+l8OvYM1QZSLdyPTP1p8tAV3GJ2BHE9fP6C5Fovur907CZFGBKVCLp48ey2qkCMKRE9Xk7JeH3zbDygex0P3n6GLShZiSb7kIn6ZeskI66247SZU0SiVF2XOjv1ptxJpnLJLqUu5aMBZVquazhr3cWTr75esl9UAEwKApf39TOAUf/K3DCzIJWUcA7AUozTibZIvDtapbdEB6WLLIykGN793PtURnSK+f6/2dd+0A2uIQU6vXmy1ujRx+KrW7Diy+tE1AKSWz9upIFq1AyideBl8tEmI0gBC7FwU3LY+yymI3Vel4dnEoodk7QxR/YB0hNCEBuEt8pZJUOLUj2P8u6CfXEFHbUH0V6Am8IWWtCsecViz6jUE/62XMnVboDeZCMLAWXlBGuUL2mEVEeXn/dA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(39860400002)(366004)(396003)(478600001)(53546011)(86362001)(6512007)(26005)(6506007)(6486002)(2906002)(5660300002)(41300700001)(4744005)(8936002)(6666004)(31696002)(186003)(38100700002)(36756003)(31686004)(8676002)(66946007)(66556008)(66476007)(6916009)(2616005)(54906003)(316002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnVheUpJRHFXVjJUNUg3MXd0QkQzZEdlQnNudlNab1VFdFltWFA5Umxzb1ZI?=
 =?utf-8?B?L1dEbm5CeEd3bWxJelVJQnRQWGNkbytvT0x6ekFxbEk5RGN5dzJ3MnVNRVFS?=
 =?utf-8?B?OExQWTlmbktzcWo5aFBDUnh6T001NnBSNHgyY1d6Yjhock9sblFTMlFQME9W?=
 =?utf-8?B?WUc4bjhpa3A2WXpvSyt4b3JPck91aHpKM2kyTUhGelh5dnRDUFgyL05kWjBt?=
 =?utf-8?B?TEJOYTAzOG1DanRrMTlHS0tUa3BaV1RxZjZISDBKQjkxZlNoTHNudVhPTjZU?=
 =?utf-8?B?QnlxeEprS0dOTnJhWEhkL3NnbU4yYUJJcXdEYUszZEx6dXFYY0lNS2FUODdx?=
 =?utf-8?B?Y3pCR0dwU2tJUFF6ek5mazI1UWlWWDdIbm0zalVwOUlIL0tZV3VJWThxRGpS?=
 =?utf-8?B?c1dDVHRpclQ0UDJNcnI1dDJoU1c1c3NGOEh0dW9iTWR3NHFkdDVUeGZWaldS?=
 =?utf-8?B?cEE0SGpkVmZwZWR0QzE0ZDVYMGhUazhTbmRDaGVqRkhDZmthd044S0hLWGht?=
 =?utf-8?B?cmJ6MTJHNEt1RmNLdm9XRUlnYTlyb29WaVphN2hFYWZZQjdWSVh4S2NRblVY?=
 =?utf-8?B?RmxjSlJPSkh4akp5UEdFY1psc0VxWGRWRHpSUktnZW0zRWR6UUpDZ3BodmVN?=
 =?utf-8?B?dzBUZUFhZ0Jzc1JoRHBIWFRCU1lsNHJGUlh0NStud290YTNoL3FLVFhwZ05I?=
 =?utf-8?B?Lys2T1IwSWl2eTdsYTdpZ0g4eHV4d3dDdkZxNTEwTms0RlZUam5CLzRhaHo4?=
 =?utf-8?B?OStmNGVQWXNtR1hpM04rdmY4OHZPbzY4cjFxVUFZZCsvaFVHUzRhY1VUckIv?=
 =?utf-8?B?SkRnWjB0bVJsZ3NLdytUQ1JjVEVkWjd1YmppT01yYmV3a2tXays4cUQyVEpY?=
 =?utf-8?B?QjMxT1NjbEMvblRVd1d6VFFOU2Y5OVdQdi9xNFZWbk41enBHYllSUzE1eE9I?=
 =?utf-8?B?Q08zUWFLWmZQSTN3dXpzdlB3NUVkbFQwT3VXWXdRemlMVmNZYlhsaUJVZnFU?=
 =?utf-8?B?VmJma2twcDlET1dYRGc4OGRkbXpjZm9oSlduSDM4UVpSeFNDbWp3TnhBMEJ0?=
 =?utf-8?B?eFNSTXYySTVZRDdacWRnQUJJZ0hCRkVXOUVoL1lUamw3TjhIaVlsVUNEKy9B?=
 =?utf-8?B?dGNQVjJrMzR5eEwyTGl4cTZsNjFhV0xZaEdTYlJYbkhmdjFsRTJZdnlsU3lF?=
 =?utf-8?B?TlRtMlRVZmowS2VtYWl1Mm5BeDh4SnVmOGN3QjIwazU0ODllSDBRR3BMdStr?=
 =?utf-8?B?bUlXYnY5RWJTSHlnZS9BcmdPcHYwRGkyZEh5cDNWOWN6WE5VUGxoTWtlcHRF?=
 =?utf-8?B?ckM5NTQ4S1Y0Z1p3T1dWZlBEVHVpc0wyZE5BQUIreFF4S01sRm8vaWQwckFt?=
 =?utf-8?B?QjNtOHJ6bUpwbk81RndxUEVuTUNQNWVjRHhJZWgxcXJXc3M0UytpZFVpSkxi?=
 =?utf-8?B?TFVtWHhTcHZHeGg2STFKbGhPMTJTYkZvSjJ6ODVhampMcTJRWXI3d1VWanBJ?=
 =?utf-8?B?bGdiNWZvYUR2ODV0M04wNVErc1EwS0lKTWF3L0tyVG52ZGFDZkJ3N2xMdkJ5?=
 =?utf-8?B?WlJQenZuMlV2OEFYRU43MXZ2WW4yUGZkUDlrVWlaakl4TGRWeUppL0Yva0Vk?=
 =?utf-8?B?N3dtSWVXQStkaUt2SEVoMDBPeDhjYkxrYXVrbUNjMjZGcnlEbVBHSmxCb3Y2?=
 =?utf-8?B?ZnlUTTg2RmV2ajNubVI2VXJONGs0LzBiTld6WG90b3JQL09TMHYyVnBLQVpH?=
 =?utf-8?B?bzlOMngrUFpxTWw4aExnd05nQnRGUkprK1dIWURDRVV6TkdCS2ZlM0hIekR6?=
 =?utf-8?B?elUyM1oxMUVRdVJGTms0WXdHbDFmY0tFRm5LYmlGdiszVkIzSXBCQndjdGF1?=
 =?utf-8?B?dzhBMk5xWlFvT3JKbEhHT2lRWCtEMHE5VERhWHAwY0pvcXRjTDRTS2lYUzRJ?=
 =?utf-8?B?NnUxS043Rk5mSE5nUkNpYUtvUjh4ZjhzekhTZnZMK2VoSUhMMk1scDhVSncz?=
 =?utf-8?B?bWxiWndzY0hRK05rcHRNTkJLcGFEazN2OXlxMml6TUF2VWc4a0ZxWUd0c2lU?=
 =?utf-8?B?RGZCOGg0Z1Z5WWk3U0NRUVp0YVFNczU1bDNsUWdqeHB0SHVVYzMvbDNBcmZS?=
 =?utf-8?Q?WKP6UsX9HjUOybOGLJ3jb1kjg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4551f17c-bf38-4a52-1e87-08da761b55f7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 13:15:01.2299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+7SIXnGPpm11upw18XA51/uRuxzDRgPXc7ap7fsAd3Al2ilI23jrxRs7Fd/4E5LUNbPbE5rItyYZA0jtTiHzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4483

On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
> Reset ports, to force host system to re-enumerate devices. Otheriwse it
> will require the cable to be re-plugged, or will wait in the
> "configuring" state indefinitely.
> 
> Trick and code copied from Linux:
> drivers/usb/early/xhci-dbc.c:xdbc_start()->xdbc_reset_debug_port()
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

