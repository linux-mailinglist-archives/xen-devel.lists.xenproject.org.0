Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E227E3AAC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 12:00:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628757.980546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Jou-0008H2-Rv; Tue, 07 Nov 2023 11:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628757.980546; Tue, 07 Nov 2023 11:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Jou-0008FM-Nr; Tue, 07 Nov 2023 11:00:32 +0000
Received: by outflank-mailman (input) for mailman id 628757;
 Tue, 07 Nov 2023 11:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KeYz=GU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r0Jos-0008FG-Ub
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 11:00:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7d00::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc7bac1e-7d5c-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 12:00:29 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB10010.eurprd04.prod.outlook.com (2603:10a6:10:4ee::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.25; Tue, 7 Nov
 2023 11:00:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.017; Tue, 7 Nov 2023
 11:00:25 +0000
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
X-Inumbo-ID: dc7bac1e-7d5c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXWMgpb2sG1UV/1E2wgIIajMvLF8WylHk2Cbmjf48ogZaUIaiesBXLXlHTHbakNQrSwggseT4Gl6GcYyh4tbRNPsdVBs7gFZSzs4NUYniugjAl2FNBXlhw/79gFiHm5/UzLntbcx+1W0ovGqb9g+WvGqElp4K106zKf26lqX/AN3azEcxB2L8J/Be5cdqVNlZM+zkMPExktPhvRkMVcinJRNkc/8e6Rh7NevbKqrtniY4ndtPJOT/2SOINGfUkbNf4jxKmWYbgIUUlHuvvseKl3i+2NMmsYopkZQD+/qcy0nQVppQs8tdkGPwB5NESgqM9BkcjkWhG4kQ+tq9vtNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUtrHl5GZ+XbFWRlfnP4En26J6IcjoeFNeHpwOkYt0c=;
 b=NupcpqBv713dlYIVHy+DjUi0oLd3CVrKl0nvhIOBQzTX3OmpPKUx6XoHz5nnFC7LQRYAYtHfA4RMmV7a/Dxf71gEmY08m4v2fqXfdWXQTmNXknnOnez21jfyKC8fWkLrErdd+HIfGf6ymAIqo5qbnh05UrICbS+Kb6w/yp5hL+eB/W3T1OfHsmukrfKwhkRthnHC6Dez0DpvbbELQZ1bj0JIwkrSMX1n3jeOdMDR8ldEe/tuohur3sDCzzWDgomjtiTOAmYRpAwM20SiV9qQHwzn0rnMVOJF7STUul8GSjS5mbshP39JsPAHIk9Cw2Qb3JWJaMRmCvLDr0jsS2r4Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUtrHl5GZ+XbFWRlfnP4En26J6IcjoeFNeHpwOkYt0c=;
 b=P0teMr1m1LAR9O70zS6OBK9TDv575Y2en7nvLpQWGyKX0FGcKtpN0LowFOc8xxmIuOVCbeLqBdKNN2vPtA8V9cNrzlT0e2Ei+zJivmsydOtqm4seO93GDPjDsKIeFUyDQZrxHaBzC+XzvOM6vNvAlT5x91A4L18himNPWosXqDSn9njcVeACYCkT/HFSZrZW04XzNlpakfCJREFwNyRWGKHwIW8+VBUiBTYAse+3eBoQBATOse9gFGfjTMhJ2dK7+3Qk5TsMqcOH2qGKOyNORz1kI5XdFSD1jPyjz1Ry5XM7jl8HAqvWkQvDZoEsReUfBbP3F00s1km8j9X2577J6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a910f6b-4a9d-0393-363b-bc7bc319f739@suse.com>
Date: Tue, 7 Nov 2023 12:00:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [kernel-6.5-bug] with xen-4.18~rc4 on ub-24.04 noble, booting xen
 domU shows UBSAN errors in blkback & netback drivers
Content-Language: en-US
To: Pry Mar <pryorm09@gmail.com>
References: <CAHnBbQ_LT9hhpBO3=zKoxPe2uoK9OY7zvTKFhbtX+GwHfgduXw@mail.gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAHnBbQ_LT9hhpBO3=zKoxPe2uoK9OY7zvTKFhbtX+GwHfgduXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB10010:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a679d2b-d32a-4cf0-f392-08dbdf80beda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2n+MyAJUbHEQb6IqhM1ycF+t89RJDtM4hWG5ri8jOZOFxe0rXMdUQGJXILJ+NSpZs2sfsrDfsBgolLN/y7qZy7RbSWvp2unrGTDMKRrJEyKSsUmz0d6WMniTnNMuvSBclAg8N/lJO0ZJHcuidpLQq7oytpBtDNJWnU59AyS3PWF2vzRfTgno/SRVIOnuMn+T2JB6AS9RElK0NqPEuhotMuK8NtBfIoGRvIz0SQtpncpqQXAu/Un3cbk9qmP814JNHjo9HJlStM/jFLDcYGaTGy5JRpLsvlpdk+I7CxjxEQNvtPit1ZjWnUO5JYT7rQ5V6bfc54d7/ROrwUiIm4qj/CBlCPRTqQk7LbW9ptMhSFvbI4udN7swUww+6bY51f+rfQ2VXqiDPfDHpE7mJxS8s5O4hpSNkn+1qf/9AjNAJ2C9+SM0z4pOdsJEZ+7VYmbPGbqBQ3iq4nNZAckAM/hc9slyl+jOQHyxo0tTNnWFruJVlMlrTzS5gd6pVL0IAeQqTyqzq25EZCdweJ7KXYWi/u51xaRbNI4/ByiVlLWo72866ARiIsemKtuNwMxHvxMs0QLZQyZpRnIw7ZZo4P6iCGlSwG8Zp7Kt5WPt+zUi/fEHhc2nzfEzTngPmPnPYeHUB+EPdnLr3yXl6CLBfW0BjUMZW+c+KWNVLjDrgTnKEZw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(66476007)(2906002)(41300700001)(66556008)(6506007)(966005)(53546011)(86362001)(31696002)(38100700002)(2616005)(478600001)(6486002)(83380400001)(26005)(6512007)(66946007)(8936002)(4326008)(5660300002)(316002)(6916009)(36756003)(8676002)(31686004)(81973001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE5uV29Eb2NsK25qSkZZbDVkays5U0tBOERSNGVlZzd1WC9Kc0pzbktPL3dL?=
 =?utf-8?B?VHgrTk43V2JueEthZHJvMjlHYzY5SHB6SDVJRkZZY0FPbmgxL2d3Mm16V29J?=
 =?utf-8?B?ZnNZeWZaZXFPUy9lTEs4d1JrdDlpbGN5MkxITzBHeEtEaFVwMy9KdFVSUHhG?=
 =?utf-8?B?ZW0xSERvdkR3cG9ESlh1ZFpJaUJ6TW1uK2psdHBQOXhjMmJkUFVVS1VKT2dI?=
 =?utf-8?B?K1RYcHhBaFowdVBuaGt2NlJobXl4T2pUNW5NdXlzUEZBZXRKSVRCSG9NM0Fj?=
 =?utf-8?B?ekVtY01CeEI5N3JsQ1p0dGJWcUE2UkI2QngrK3R1VWZ1ZXozK21SK3Rqd01M?=
 =?utf-8?B?UVI2TFFFd01pM2RPc3BPam9ZaUpLZ2QrUFcxaEJVNHRQaWI4R1UvOEFBdEEz?=
 =?utf-8?B?ZWtjVkZQdDkwYVR3UDlnUjhZWGtxUW1pS3M3TDA4OFdLbGdjSGZOdE5PSVF1?=
 =?utf-8?B?clZISVdXZmc2cUZJSVlXdEJTemRmT1JkQkxnMUhBQmhQcTlBdW9MOEgwaDk2?=
 =?utf-8?B?UnNTenlnYWxqUFNmcmhSZW8zanJXamNFWFVQWDhCNE93ZUoySGV0NDR3NFJG?=
 =?utf-8?B?akEyTFF6SWhkQUR1ZGhkV0JoMXpDWHpMQ1lmZG9tQyt4eCtQZEdHTFp0eEJ0?=
 =?utf-8?B?VjhrblJsZHgrOHE5RTlUNjRDQndYWTVIc3JFTnFmYlhRWmVyRlJHb1U2OW9C?=
 =?utf-8?B?dFljNEJqeUtBZi9jdkd4dVQvNDI0c0VqVTFmTWFOeVl2K2hiSTBJaVNxOW9N?=
 =?utf-8?B?WW8xOUQwaDIvSnBBNmZlRmNVSzVncEhJNG1QK3orZGxnR1dtMFZwVE1Vd2p1?=
 =?utf-8?B?dTVIYStLVnh1cWxOSjJvbFhqd3AydWFmUnFjUUhXSlJIRXRYYkpxSHpORDRU?=
 =?utf-8?B?NmNKaXNXN2tIYVYxNXFMMVM5cDlVbXNwSjk0a0h3VVAyT3ZlZUh2SEZyb1JB?=
 =?utf-8?B?clQ1NkxOb1ZNR2ZZVDlSVlFjQmRPNmhUcVVsenNiN3JkaGExV00vUncxYUlj?=
 =?utf-8?B?ZDFiOTFnckdhNTc4Q0kwYjZYUitzMklMeDhMWnEwZ2hoSUE1KzNVa2doMFpY?=
 =?utf-8?B?MVlsZStzekRvNTZLYmxZTkFUYzFweG84dThlWXEyVHRDMjNudXdsYStjbmZI?=
 =?utf-8?B?NEFRRk5mNEJsSVRFRTE4QnBzendITXNNMVVBbjRaYXpCYm93NmUxUFRreXc4?=
 =?utf-8?B?R2xYNFdYRHhNYnFxdlcxYlNDUXJ0d1ZKcHNPaGlPdGJqWjJVdVhyak9PaUNs?=
 =?utf-8?B?OEwzZEtYNXloTElQZm5qKzIxNHhFemc2dkNLU2p2d2VQTjFqNDkvV2hvekxH?=
 =?utf-8?B?aVR0KzlkdnExOXVNdWlLTjN5Y0xJSGhnS2FPZDl2NWVvZjQ3RGkvZjZXSWQw?=
 =?utf-8?B?MEs0ZWNGQmVybUZYeUcrRjdaYmdBOG9wK1JzVHRyb25nR2dCMGdmcGVkV2t6?=
 =?utf-8?B?aE56Wkl3OExuZWxlNTRmc09YcWsvM3VCRzl0bEdBcFlyeFlTUmloUHNIdW9h?=
 =?utf-8?B?ejczWWxEMURxVGVhdlpPWVdrMmFMMWU2dFdNVHlKZFdjV1BFclQ4YmNCaUM1?=
 =?utf-8?B?bGgzcFpRWDdXQ1FoMk9sVFNmL3lDdXFCbERhT2VOMEhUc01sTmtqR1lpNzlE?=
 =?utf-8?B?V2V1ZGtYQytFeWRzTmFON2tKY2EvNW01bDNSZkZTb2VYMjR5Ni84NFE5NW96?=
 =?utf-8?B?eWI3S0g5QXFUTlZDYlU2bm1nMjVLaVBqd1RBS204SHNXV3ZQSkg1a1FtNVc0?=
 =?utf-8?B?SnRrWjl2RkhueGtsbG41cVdXKzZkaVVmekdEUXkzRVBvTWJFc3dhT2pvVGEw?=
 =?utf-8?B?dndSb09QQStSTTcyRUhNdUNuL3c3MXNTNXIyT3orZTNnbmZHTU03UlFOODhx?=
 =?utf-8?B?ZXp3NUdTcksrQzladm9mbUIvOFJodkxWRDBVMS9HVnIzRW9sMHZ1QU5mbTNu?=
 =?utf-8?B?Snd5MEdQZXZYRHVkaWR1aDZ5eHRidXV1VE80b0F4TWx6cnM5NWtINGhockhG?=
 =?utf-8?B?TWdsMjk0Z3N3ZzJMRm42cG5uZ3J0L3FzTTRwWGt3bTZWSnZQc1pjaW9vYjFx?=
 =?utf-8?B?SkZ0cG5ER1daQmw3UjZGVnZTcFhSbG1kMFNWekxmUmdoYisrdDZRSWRDNkFM?=
 =?utf-8?Q?+bgUSc30fRWFTC26J8rpovpup?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a679d2b-d32a-4cf0-f392-08dbdf80beda
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 11:00:25.5494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRd4Xg8ef4PiG64JIlzUkF3I4j6VN9gmxvUemv1td0wtAGpoDRtNNk0xroPXGrcHREDNhsFV0iJLiZ2Ez+SNaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10010

On 06.11.2023 20:20, Pry Mar wrote:
> These 2 errors show in dmesg late in boot process when xen domU launch:
> 1)  blkback
> UBSAN: array-index-out-of-bounds in
> /build/linux-D15vQj/linux-6.5.0/drivers/block/xen-blkback/blkback.c:1227:4
> 
> 2) netback
> [   55.209063] UBSAN: array-index-out-of-bounds in
> /build/linux-D15vQj/linux-6.5.0/drivers/net/xen-netback/netback.c:289:3
> [   55.209268] index 3 is out of range for type 'xen_netif_tx_sring_entry
> [1]'
> [   55.209401] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.5.0-9-generic
> #9-Ubuntu
> 
> The xen sources don't seem to generate these UBSAN errors and I included
> the patch from staging-4.18. It seems only the xen related kernel drivers
> are
> doing UBSAN errors.

While I have to admit that I find your report a little confusing, I kind of
guess that what you're reporting would be addressed by
https://lists.xen.org/archives/html/xen-devel/2023-07/msg01837.html (once
it was put in suitable shape to be committed, and once it was then further
pulled over into the Linux tree).

Jan

