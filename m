Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9287F597EDB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 09:02:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389327.626149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOZXl-00070n-HN; Thu, 18 Aug 2022 07:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389327.626149; Thu, 18 Aug 2022 07:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOZXl-0006yS-Ec; Thu, 18 Aug 2022 07:02:17 +0000
Received: by outflank-mailman (input) for mailman id 389327;
 Thu, 18 Aug 2022 07:02:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOZXk-0006yM-N0
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 07:02:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0bf1d1a-1ec3-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 09:02:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7393.eurprd04.prod.outlook.com (2603:10a6:20b:1d2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 07:02:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 07:02:13 +0000
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
X-Inumbo-ID: b0bf1d1a-1ec3-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cE8MyhorDAUUPlPj21MKfWhjNKXBbKNIbfMf5DmSbjmWz4OkKT9uVwANThRJIU+xfOtJ/X0kbdTfFWvBXIibA5a6BMnqJoASPiwMSBei6uMIedfpsrA+dJbo+DdungXQVqVfq4JNhF9qoJbWZL/tf/9AZfS+0hSdHNYelqtsU46U3X345Ss2CN7JquOlzyR2Pokok4cNZOwCPAXaL7IQQpfDM9kGL6AYAn7Rwh7hxGrVyrgtOSbyg6I4sxIX6ZXuxg8bRRh46BysZW9fjKNHBV0jy2A2Qlysrpd9lCytnfpwKbqXTiQaEDUXjjiTRSXfoG7SH29V78cssqv5ied0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrWE1RnCb0Dx7PR3hCHuJ5jBVxaFzwCovy+rvhDN4KI=;
 b=mkpbKBkxfu2slBEuVM58nRY3+rfxOggMNbXZjmdQ35U3kCP7RWsB80Ca149lHg0nRO70X2zxIYqQltQWDNJiYWkrKJwuXAHAwYGjvl9FPDPR5NRa16a8lB4dyNqoDHjcnY0QXiryWczsfsrWGuqPjN7XA+o7TgVA1tBn7nHviDYVq7K/+Su+1wXSiw/AzrHmJZTo7MT4rX+oyp3UlCuHpGOSQDPCL19+QxPjmplKfbYDgl917W7e1RK11IymCgjqgSAukGVGKrq6O65pSaRhAkHQF59cr9v6iy5MHrNSc+AJd1Q9eKzUMCcj+0lnUgkH9A4pbm8RHvccLeIziYHQfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrWE1RnCb0Dx7PR3hCHuJ5jBVxaFzwCovy+rvhDN4KI=;
 b=H0QWxqa8GIxXSGb2cexsk4Q0m+cIWjuT4857Oahl4PnGl7JXs8u54YIWPf0DZJk3OCENyGmzsXqVIgm9mp0Pt7zFWEREoUVIx9+Hbjk1oZbufbL4zpF6xeu4ae91umE/qhM06O07RKHEHHD/N+6WgwAanoLuT2JB2ORLemGZeSr5Pj7YhzZPB5Q1hb5CTYWNFvIQI+6nkSOcPaKKo6PC0PTjp6rtpKxGu/7JBeI7CmZiHgWEUT94q/auYzONz+aoIlW9fth4nBQapCmPR4Z6iMcVNL0yfRzxCrjRZCbya8Or2gsavsI6HwiMzCW9yYPyHbaBpSGmKdgwdRa9BYIq6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <499daffa-b1c6-3868-c164-65335963922c@suse.com>
Date: Thu, 18 Aug 2022 09:02:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Use direct I/O for loop devices
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <20220817204634.1886-1-demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220817204634.1886-1-demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a886a51c-0c3d-44be-025c-08da80e79402
X-MS-TrafficTypeDiagnostic: AM8PR04MB7393:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xwERNfdHSxe3oTbFIa6lYVYkRGWh2RaE+Tt4ZvuV2YDqIzegPKthtRZPbeQYK0nEJtpz+VKN91JUtzVir6DAKJjXUpVO9PWshFk1q3wBPgKyX+vbwPIxWg2OGo4oBp588TE+j/aqwmdtmIr43HzKA+eM97gBG6Ij93h2MzkvZcvWQQ5ePsStqKhUxytN/h9IWV/Ms0R+igwMUJs6gxBoICOzuv7zvHw7CAG7tazKmHM86gI4JP7yhIQSvT04/Et89GF1/8xouBJAV66t1n2tY8+XdQPrKvLuyBzHVuWIXAaUgM7uCnOYljk0fsyYsB9/d5O6AodFximiTVHeP/h22EXFY2WPByi5KZefX1TJUtuM/0kKq/UM1drmOIo5pRFmHHNQfkTsOz5fn8j1LMWDVUj5mpWbUyaKzuRRSqXBOEddurwUbHF34qVTYZRJuAvUzXaobEeQghNSBdAnMqIwWahz6KNSQR1AdoutEG6IXqxS5SSgcX3szdk6FanM3Vq9H8U3mppnJyxpOt7aDwM95Udim2+7XEBuBzrQIWU2buoxGfIZDAlTSGHwV+dsKR+LtnJcOs2RZPooDcmkgbsLJpSDFM/MKrlpL4RDfMcsc62DxgTsy+OkUg6OWOJFVc4Sv7lWxonSNbXOKnCKAvcNmNysbwddo+a7pe4Z/OS0Uj+hari/rWG0U5amI+OTTeVi9tAhEpZreKOO7yb15u3MK42EAliuCeKi5MbXDf/Cx22fQ/4xHufKsE2Ix4SR98YlulHEqBEXFtzf1/9i+EEsH/g1iyi/LFPCXF2v05reudM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(396003)(39860400002)(346002)(376002)(31686004)(53546011)(38100700002)(2906002)(6506007)(41300700001)(26005)(83380400001)(2616005)(186003)(6512007)(36756003)(4326008)(86362001)(66946007)(8676002)(66556008)(31696002)(66476007)(6916009)(316002)(54906003)(8936002)(5660300002)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVUvWFprQUJNUXlVY0RPemNsNkFIdXA1c3kxcDgxM2RNYnhSZ1JiZmZ1T3di?=
 =?utf-8?B?Z25aZWM0Q0F3UVBGaFpoc3dURUNVcVkweUpDbWpKRmEyU0FSWDZ1RFowWG84?=
 =?utf-8?B?RjBNMzIxaVNKYXRqc0NGUVJKcVVCMjhnVXNKOTJKNmZlZ2JZZWx0enVBaldz?=
 =?utf-8?B?RWVCMThYWUVwZVMxWjZ1MVpaVU45SHRkcDR2YW8rY2h1c3MvUnhwWXl1RElw?=
 =?utf-8?B?TDZ1Kzd0aW93ZVVzVnZnSDhPeWIxM2NDUVdwZVA2OE8razBqR3BaV1BSandC?=
 =?utf-8?B?YlJuYjdTUXVWUjFoTlkyL1BVTTNwKzg1TVErOHpnUUZYL2dGNjM5cjBRaExz?=
 =?utf-8?B?bkhHa296K2dvbkdIVVgrU2Y5RnMyYkQwWkJ2VGZOV01PK2hyMi8vY0NYT1ZU?=
 =?utf-8?B?WDI3RVZvTlZlRHVCRmRlSGcwMnlLZDdPcHZrMCtPVktGYXh3akpGZWZ3U3V6?=
 =?utf-8?B?M0tOVlgzSG4yT2VRNTU4bGw3WndRcUcweEdWbGZRbUNMMS9FUXhQN3hVQzdt?=
 =?utf-8?B?bE5hSlVKa3YrQW9jSUowRTJPdERQLzBIYTBvaDBaNU4zenNIUktpaksyc3pE?=
 =?utf-8?B?OVpmRkd6Y1BHQ3dRdStBRFAxWTVSWEx5ckZZU2piSnJ0ZGI5NGJhaWlIUGRB?=
 =?utf-8?B?Q2pUNHJNZGNsQm5IUll4S1poeUt2MWs2UkpxeWltajN0TC9IK25iNmVTOVZn?=
 =?utf-8?B?TWVNdXBkUDdVYmJWa01oM3dhOTV2dmtFeXB1Vm1VWnJQY3BXRlAzZUFEL1p0?=
 =?utf-8?B?aEFOWUNPQk1qQmpHNmNoR2FmWGxnSTU1Q2c1Y0FTQXN3Vmp2SjRSQ3YzK3ZX?=
 =?utf-8?B?MDBBSnhsbERGcGFjdzZob05MdzJXYm11TmxReEVwOXAySW1xOWlvMWpOUURK?=
 =?utf-8?B?M0JCWkRKTDE3bERmaVlvVlg2dFdybWlEVmd5TDBLYmpDcDNraXZab2JybUEw?=
 =?utf-8?B?NUxWSS8rWDZvMGNTeWdnbVBrd09FbjBvOG5sVjU4Y1dQRno0dUJIRmRnazNS?=
 =?utf-8?B?Y1VsM0szako5SWpDejMwUGF6MzYycTZtMTJkQ1Q0VHNmeTYrM3JXbkFIVFgw?=
 =?utf-8?B?amFRTVA3QVRudVdFZGpXc3VKMUFJRExhUmJ0bzRQVkhudGsvZHVjZkViY01u?=
 =?utf-8?B?a3VTS2VrcXFENlFWYzQvQnkzMVZoU3ZiNEZMU1duSjFDem9LNE51cW1scG0x?=
 =?utf-8?B?b0pVM0RqUjdPaGR6c0ZWQW9DRHNrSFlVM3ROTEJ6RHFlMFFqMjFaYTAvN0hB?=
 =?utf-8?B?TWJtbFJYZkNTcTRQRVRWUG9zdmE3dXVNZjZhaHRYYVBBYWQ5U1B6cVVFdXFM?=
 =?utf-8?B?aHZHekQyWXNwdlRwYVlTa2JCQzM0bUxWdERXT04xWmVQRUpUYXhGeXcvdjVU?=
 =?utf-8?B?dVIwVGM0NDExbEtqTkRwTy9OaFhNWjUrQlBKRmlnQVhMVE1kR1Fsem15dUdy?=
 =?utf-8?B?Z1Z6Qjd6QjJJOTlNUFUzT0xiSHI4WGxHMEVRU0RnVnVxU0NueGEwY1I4amtt?=
 =?utf-8?B?d3ZFUU1qdk9TYk5nSzBjNzZZZEpVRkdvanI3VjJ5cmIrN2RhYTBmVlJGdEll?=
 =?utf-8?B?aVhVbDRPeE1IMkFFNGJWNzF0eElDNnJ2ZTJxYTkySXlXeUJDWSs2ZzJSNXM3?=
 =?utf-8?B?RXZhU2hRTTYwVWRGSERQSUJMcGVpaDNhN3pNWG9HWEMwRFJNQ0Y0SHlDMUFR?=
 =?utf-8?B?S0xXK1RVTlpHdTlpSnFUMXdWQzhNOVc2YWdVMisvYzdRckdCMkRacncreElH?=
 =?utf-8?B?R2Vxb3JiSUxXQ29mS2g1VlQ0ejg1RWhVbWNQU0FFKzJ4V1FZNVorTFR5MnBr?=
 =?utf-8?B?cFFXcExmbTNrNGdLR1k0ZjhyV08rUW11OVRiSWRPRldtUmZqQ1hBZGpuaW1s?=
 =?utf-8?B?ZUpjaU1pelorOFZHTzRhRUVtY2QvWHJYUUpJK3NlME5XTXJSSXNkUldyM2V6?=
 =?utf-8?B?UlhSV3QraWIzVGcrck53dUFiV3FHeW8wb0hGZDVLLzgxVzRpYXBTRHlET1BD?=
 =?utf-8?B?bllnc2l1dmI1eE5PVXRwRVZaNVFqNjV1VzMwVWx4UlEzajVGMkVnRCtmNW02?=
 =?utf-8?B?UlNjR213SWsxa0d3ZVJYVC9GSnNsb29NUi8wRzEzSDREWFgyUmtwcUU0bkJZ?=
 =?utf-8?Q?zgnIIfdMJmRCz0XcTj5Vs+cLw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a886a51c-0c3d-44be-025c-08da80e79402
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 07:02:13.6556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lH/eiYL/LJvzjzC9fDV7IBBsuKTUAsn+LH99s9gK5RfWEKuPYnYIyEIvaux4IoqEMCs8dBzKGXLSusUJHxoJtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7393

On 17.08.2022 22:46, Demi Marie Obenour wrote:
> This is a huge performance improvement for two reasons:
> 
> 1. It uses the filesystem’s asynchronous I/O support, rather than using
>    synchronous I/O.
> 2. It bypasses the page cache, removing a redundant layer of caching and
>    associated overhead.
> ---
>  tools/hotplug/Linux/block | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/hotplug/Linux/block b/tools/hotplug/Linux/block
> index 2691b56951c9b82094471a141b9e0bed04abb929..75785f3a5422c4a5f962a4cd4f6acae5080d036d 100644
> --- a/tools/hotplug/Linux/block
> +++ b/tools/hotplug/Linux/block
> @@ -330,7 +330,7 @@ mount it read-write in a guest domain."
>          else
>            roflag=''
>          fi
> -        do_or_die losetup $roflag "$loopdev" "$file"
> +        do_or_die losetup --direct-io=on $roflag "$loopdev" "$file"

I guess you want to first check (maybe in tools/configure) that losetup
actually supports that option. The old-ish one I'm looking at doesn't,
according to its --help output at least.

Jan

