Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E2364D7F8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 09:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463176.721319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jtA-000545-KM; Thu, 15 Dec 2022 08:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463176.721319; Thu, 15 Dec 2022 08:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jtA-00051y-Hg; Thu, 15 Dec 2022 08:46:48 +0000
Received: by outflank-mailman (input) for mailman id 463176;
 Thu, 15 Dec 2022 08:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g8Eh=4N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5jt9-00051s-0Q
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 08:46:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2052.outbound.protection.outlook.com [40.107.8.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb6a8f65-7c54-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 09:46:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7760.eurprd04.prod.outlook.com (2603:10a6:102:c5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 08:46:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 08:46:43 +0000
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
X-Inumbo-ID: fb6a8f65-7c54-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiJIqPw3HklVsbWubzx6o/FW0S/Ls75iNsN3NtmBSluFObgETCPYCGdTuNw16TrYdqrL4ORoSCaiBlgqYQc5Xg/x0TUUkYsLN8epCaSjAdRc8bpm1MdS7yfFxSwDLLgdTxgxcYu8lXosapFQLcJfrMh3mm/tqOTyaudwe6jPtZbuLr18jU2JpmE/C5sWCRU/xsW7OYptu1fco4j0fJ5mhof8NByHdcHOc82ainQ0RTPro6OUYps9DOYxZyf3dR31ewWJiAC6BEGWiKZfvZUytkaWllLpcbbKNOF1jdeQl3oFXscricCM6UnBw2aqow9xkWsBPef0NVnwB6Pw9zv4Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaeD9LfcGhrBYh4I7awl+lPjYMNEbiEqWekCrFBz2zk=;
 b=kcG1u0kUxTB6kQgo3SPVhUKN7C47qsyGiFioGgxTk3LeTfb1VO/WRBKaM96ACAMdMsAnDyHdQhF1XAGFbNw+IgPalrYJOZkX5HOPAmj73UrWvyXteVE6PmwjFfFXcj7C0+hWSxIPfVzemUCow8hbJ5ZmYN4XXe2b6el29TZaFXTJUiK/l/CvZA0jQVn3SGeDSk+RuhdyoC8Hat1K22hFHLU1SSUPH3/USEJ2K5Zb6WIsu4ljKr1z8jLfQcc2J4KxExg3fb7dn/LAgZJFJEaWAcBCwPe6yVpigByS4t6Oju/sR6jIK6JIXp82RFl9PcAjhFgZqtvkqGMbg+JXtTvmVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaeD9LfcGhrBYh4I7awl+lPjYMNEbiEqWekCrFBz2zk=;
 b=JWsM5zGBDwE0pUqXg38Ebu4LRkvUlA0YSfW6lKeUtwi2Hvenz/wB2puE9YvUn+ZY2ztSsfOac4kONNWIMxmEz1excnmilDxXVa8rNIBaoXHD8sjovZqNzDXOmaej5jGdj7zHkccSwZYWiYoAmU4bEc5p8fTzsPuvPU/eQjwU8a8tTBCpeHWDxPbTB28IddB+/uvUIAvC0F1I4+Od4XZuhy9Z9/HkSV8CLa8rpE+Q2dIBe4501LSKjDWdaY2DAJd7TAc8NCQZavo+IeYndZ5I+Xc+csJsgA916+QLWohRzvztGXrAkADOacprRid+Ev13dPomfljQZ0OC054r6U/EaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a44afad2-4b63-a830-1ed9-2bd87e8aecde@suse.com>
Date: Thu, 15 Dec 2022 09:46:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 01/12] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671057808.git.demi@invisiblethingslab.com>
 <6a0d969d0aade0258e108009ef33ad5d2663e969.1671057808.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6a0d969d0aade0258e108009ef33ad5d2663e969.1671057808.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ea7075-1c7b-4970-6474-08dade78e453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mKEeztZnPUfZjasNP7XfaLsZEPBxIHgBSiu/Xg0Ovggd7v29OfrjYIMMOoRWMILPiuxAugvSOKhE2BvVBUy4EIzi1gaqn5MqAu3RhXZz+qHwJ2ajeqeZ3BP5oIG6mxeJuE2pXmawalk+wYMoKaODRKwVDIU3lCKGOubLjqlhquiRTyeeSl/XWdNj0ZiuQP9d2m9xHVNiiZqVSTABoKoPDjkY15C9NJPOThWId7dNYsef6IWVzwUJza1CLSd9hvdhWxl/LGOgtbQ9gUL2v20fhsE9Frpnbq5XLbhIiT6JlhPcgq0eAqKWrBKGyaz+Z8lcSWucwijAkiI8WTRG/8EhxeTJnD8fXUxv76l1QrZvLPWIgNUmNxnzdH0MJ4jM4AyGtiGQyus9cw5SxNSh/rm8Qxrtr7OeiVwsb6tLdCjmKvbM4W5WuXZUIDCfVBOIHaLhHhU7ZuxNT8tlB5kz1fVtGonXftNXrqbXJ6yg9KIbmaNaapUUS9DbW4NF8WfwJ+lat0+ZSDaoD9y25qSiQ1oQQJCN52aZf/J4K0Zhab/cl5Zi6HHlHCpW3LTwB3hS/ScGLWTbraoEHeaYTpdCeEdSW8yXI7/9IWJ1MPUrzgT0DJkILIZWpFVeHbs/2CxFR7Xi2O6sBDqWhOKjhPjIDHgQCM1n2lJVsYloFVzUVOp+mQC9kK4ULQ9SvIt7sS3DctkDOlThjy9oqMb7tT/etTY0yirT1oWCbPQU1bxKAjXsQUg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199015)(8936002)(6916009)(5660300002)(54906003)(316002)(41300700001)(186003)(66476007)(4326008)(8676002)(26005)(66946007)(53546011)(6512007)(31696002)(86362001)(7416002)(66556008)(36756003)(38100700002)(2616005)(478600001)(2906002)(6506007)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1JzcjB5UHVYRENtRGhteW1Nejg5K1VCYzVWT3FDc0JmYW0vUU1MRlRJSnpy?=
 =?utf-8?B?bURGb0NOL0F0LzAyR2Z5cjI4dWcvR0FjNzBmNmIweHFYRENvc2VBV1o5UVB3?=
 =?utf-8?B?SzI5dnpOUlFRVHROOUQrNHBadVcxb0xNSXVQOXNlcUpGOXN3UVpPS1d4czlS?=
 =?utf-8?B?OHdZRHBIcllMem5vMFY5bmlOWGhsNm1MVnhXZUh6TmVLY3kwcDBRck9yQ3BN?=
 =?utf-8?B?VGlUSEdZa3hRNGVBZWJ5bm5aL055SVFIUzlraFVGMHdKNGR6Q0JOREg4ZFVx?=
 =?utf-8?B?UkFjbHYyT2JneWVzUm81cWJoR0duNkpBenN0NWxUTGgwampSZlE5OFM2dnM0?=
 =?utf-8?B?SzJlZDdzUnlsVWxEOW9hQ1BTRk1HUHBLRnQ5Z0gya045MFFDQjdsbkhCaXNZ?=
 =?utf-8?B?K0dFbXcwenV5VGc2NDJkNnNwWnY2SjViakdZejFpVlp4RVJHQnFhSGlkOGpp?=
 =?utf-8?B?ZkRaVTlrby84MG10WnIxNGRLa3RHbGMyVGFkaFVuOUliRCtVT0RKYWtEZ3Ay?=
 =?utf-8?B?SGZkOHdrOUVBbHZTMFUyQ2Z5NlhyK1dHSzBlVEFTeEU5QTc2SnlENkRGUU5L?=
 =?utf-8?B?Rm1NMHR6TCtobUJPNUx4VkFIS1NDM000d2NtOTlYNXVaTlFCYWF4eDRJbXhn?=
 =?utf-8?B?L3dwMUxjTzFnVnNCTXIvN2ptWlJxbGl4cnFWUWJWdml2Q0VuWXJ2R0VOeHJo?=
 =?utf-8?B?WVJBdldPM2RkY1NKZXhqWlgrblVacFZUQTFhR0lGWHUwMmlRYnhOcVo5cjgx?=
 =?utf-8?B?Y0NROGNmdnpyVEQ3eldPVndKU3BBZFdGc1BCSWFISHR2Z2RmS2lRRUNkM3p2?=
 =?utf-8?B?UHA4UkVDQXRQUzY5RnY5SVFjRS9nS2xldkd5KzhqbWlFMXh3V3U2MlBub0R1?=
 =?utf-8?B?M01hd2ZBaURwbnExVUtTMlFocEQzRkp2M1N6dE1ScEExQ1RjcFhhVnJacGUw?=
 =?utf-8?B?cUVJSXk1RmtDRlR3Ym9VTXd1MUg3SndiWmUwY2tmOWtzWXRWeG9PWTJaQUVj?=
 =?utf-8?B?SWxuWHJBMjJmeWNDbW9lVkdpSktpKzB2em0xZzJiSW9LZWphSVVuNXpaYldh?=
 =?utf-8?B?eU5MSWlmNDRSS3hFZ0doS2NkckE1L1p5Y3VOYlJuREJuS2hSRzlLYW1xWEJo?=
 =?utf-8?B?aWRucktOdWxqd2tXNXBpTmltTm5EeFhTQ1RUdml2U3ZxY2lKNHZTMEpjRlVH?=
 =?utf-8?B?VktRQVl3U21uMU41N2loSnpWbkRzNXFteThMaDQybkxjZGcrbXByRml5Ullk?=
 =?utf-8?B?YlZRUEJ4SVN6RkE1RjJpOFM1RitpTm9ocGx5czZId0UyRW9UZUNtc1dHeGlt?=
 =?utf-8?B?Kys0TkttYVJ6VnJHT3h0cCtIQjhRQVZ1OU5YdTJzbWt2dWZyZjBhL20xVVBU?=
 =?utf-8?B?M1puUlNrRnNrR0FwSlQvNWNsOXo4VDY1WTF2Wk1vY0N4YXlpSGJHUjhqMEw1?=
 =?utf-8?B?QTBWSTMvRm5PVzVEeHMyMFcwZEFRdTJ5OVRYUGphemhkY2x4RzQrcTZOY1FY?=
 =?utf-8?B?RUJpUHpVaEJPRWpVRm9CRDZ0R2JRUldobThnVjk1dElndUlyRE9ZaG5MQkp5?=
 =?utf-8?B?YWtNVmZvU0Y3cjI1dXF5bDcwVTR0aXFwaWxrSFNVdnhLMzIvcWVDTmUrSFVW?=
 =?utf-8?B?VkpXVVZzSndBdGdiZlp1Y2NsTDhwVjZvZlAyZm5rcnd3TklWcENsMVpacnZm?=
 =?utf-8?B?N0gwTDFRajFzMkdONUsxK2NZUGJMOXVqL1dqeXVHOE5MMHBNUXRoU1BlNjha?=
 =?utf-8?B?N1pCWktmV3dNMVovSVNqRnlHYzh5SDlkZzZBZXNaL3ppd0xPanJWbEVQdGlo?=
 =?utf-8?B?QjBVYzNqRzhEQ29obkVPbFF0L0ZMdEdTSTdVS29pZTNORWJwd2NKeDZKK1hl?=
 =?utf-8?B?N24vMDJDUTUyZ00zb2dYZ2twZVFwQURibU01WDlMMkw0dk4xYWNMMzN4RWMv?=
 =?utf-8?B?d2F5WTU2YjdydzVaOWM0QjFGL2RjeERxQmxJVDFEaWtSbkZiaU04UHRpVWl5?=
 =?utf-8?B?MFhFZkxxakg1UHJ4bnZDRFFNdWdSekUwWXhZNkt4RTRCMk5UbnZwLzZGNk01?=
 =?utf-8?B?VjVVKzZmVFpDNVA4WmFSdHh0RGRjQ2NLMjcrUlJHRFpiRmdZYXVaQlpnb3FB?=
 =?utf-8?Q?nVAxtwXFPAicHcGcUZNQUBNKV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ea7075-1c7b-4970-6474-08dade78e453
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 08:46:43.6646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOs6EHPRSLZmfiRBbSE1jueL4FC6mON1vsevEg2YV1gmuLsJL1D0uucmQqtIz+/AqFCDRE0wWuM4DfFdFQXQqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7760

On 15.12.2022 00:11, Demi Marie Obenour wrote:
> get_page_from_l1e() relied on Xen's choice of PAT, which is brittle in
> the face of future PAT changes.  Use the proper _PAGE_* constants
> instead.  Also, treat the two unused cases as if they are cacheable, as
> future changes may make them cacheable.

This still does not cover ...

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -959,14 +959,19 @@ get_page_from_l1e(
>              flip = _PAGE_RW;
>          }
>  
> +        /* Force cacheable memtypes to UC */
>          switch ( l1f & PAGE_CACHE_ATTRS )
>          {
> -        case 0: /* WB */
> -            flip |= _PAGE_PWT | _PAGE_PCD;
> +        case _PAGE_UC:
> +        case _PAGE_UCM:
> +        case _PAGE_WC:
> +            /* not cached */
>              break;
> -        case _PAGE_PWT: /* WT */
> -        case _PAGE_PWT | _PAGE_PAT: /* WP */
> -            flip |= _PAGE_PCD | (l1f & _PAGE_PAT);
> +        case _PAGE_WB:
> +        case _PAGE_WT:
> +        case _PAGE_WP:
> +        default:
> +            flip |= (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC;
>              break;

... the three cases here assuming certain properties wrt the flipping of
_PAGE_UC. As said before - going from one kind of assumption to another
_may_ be a good thing to do, but needs justifying as actually being an
improvement. Alternatively such assumptions could be checked by suitable
BUILD_BUG_ON(), which then at the same serve as documentation thereof.

Jan

