Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D9B73011E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 16:03:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548847.857035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9R5l-0008Hy-9K; Wed, 14 Jun 2023 14:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548847.857035; Wed, 14 Jun 2023 14:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9R5l-0008Fd-5h; Wed, 14 Jun 2023 14:03:21 +0000
Received: by outflank-mailman (input) for mailman id 548847;
 Wed, 14 Jun 2023 14:03:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9R5k-0008FV-Dy
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 14:03:20 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36c438f1-0abc-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 16:03:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB10036.eurprd04.prod.outlook.com (2603:10a6:10:4c8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Wed, 14 Jun
 2023 14:03:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 14:03:16 +0000
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
X-Inumbo-ID: 36c438f1-0abc-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLCa4Moy9s1n8aLlg39bvH185ZsuTSwnHkhSwm8kv3Qfa2KvAxwO0wYpu/HeykojEfBb77C4jc6WlDO5LPqbjI0yJxwMJtyCDc/X+cX4cnbQZDjMdD/sBZIwTxqkKIwhYN54BdxL814wluti2JblxVuTojlHbQUjQLTqR9MkXSmaHsqy3Hk0k+6JIW/Mhw5XbMG9+Q+MVcR2cWnRrxVt2susGDbjNcR5qYFQTmrXgyu53ejwfShsW7gM5yMefQcXjArsE8uv4fzxmROTGTdomjC2YjizmZ8Iw5wPscOQyDrvP2QGHaX4L5mPT4tj5beWFLKX9aIrEB6PMgEERQhaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idzF+XoztxYgX8JO67OttnbNM4lNfBbri2Bo0G5K1pQ=;
 b=hF0EmfY819OFmR5jZ0ZsIUj5tWU/dYMInDlUG5wkPWwnLW8yvw63u5c/+XtQqqKyd6uVBhUC3Hb3Fe+O3dyoSe81yenKVlOlouMFvVAwVNVVEQEBQs1wm1hScFyTIUsZEPtVuAlNxJKs92OSdI1K/8kgMkJqy1gz/D9ZlXpS4KFmTxyuhfni3670zMwy49VSHyTinacN2jxq66Y5Hz3qbUb1WPI675v20C7oz/11IwXtz4hsKJQkajmxoHXqoj6P08RQRWs4+LO7Nsx3l8bwxiVF0vwKs235DEgMcv3sqT9kAMjbCT/k+RwZmm2eH0wdPkx+jFZHrScmsnUXnZv2yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idzF+XoztxYgX8JO67OttnbNM4lNfBbri2Bo0G5K1pQ=;
 b=Bh3Ppcg+7192flG2S/ow4ZKitdvH1mu+s80/CmMUn/hcyKIpjEqA6GLMc0fu/yRgqPJlpkj908Jz3ITtmXHbowwqcBXlSNf388rdsCN1xpOtDukunpCvNLdeMYI2yUAgG+oQUHYu09btR0Xc3vp02r2mQo5TXG8oBhDtisXIBR87soYPVOexC9Rqxp5i6RcS6ygzJeQjbPrg2mIJs/3tihmNsTA+1aTtRWXJ+zLP9ZZLmKs+Ar9PGABQE/mU6xsQgD/O0aiSkf+9DN2PttVMts9QexBDAKFYsNNrk+cSz0xJgrufYrz/LjkluGSncRGJov6+ApBaIBK3G42T4bXg2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c13ea0f-9e53-62b2-feb8-45381d4f652b@suse.com>
Date: Wed, 14 Jun 2023 16:03:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Functions _spin_lock_cb() and handle_ro_raz()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
References: <c171c21a-b19e-7edd-06e5-17f2e95e839a@bugseng.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c171c21a-b19e-7edd-06e5-17f2e95e839a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB10036:EE_
X-MS-Office365-Filtering-Correlation-Id: 910a23c7-06d2-4c6a-643b-08db6ce019e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0mUyzl4/WIg7RncbuQou5jmfWZojuEYr67ihPIB3CIfJKo5VG1B/4k2wzKQPX/aHoGwpW2HBfVul1uxZopQFXXjySHWaH2SKobYW7akinROduzR7/4eNJcLhsekEmCaHoTeg579hjlVSDav6UjWOAnMULNCA6W8NNHTIMYfMYC/iZtDw1hI3LQKSsO+gby0EkPyznDudse+GWI9nAe2iviQBkvoogeXULJLlzh1hmT6sb5W57Ykmp1QjNYFU9G1ud8pRkUEEWtYB095x622hfyGebTlb/LsmzRorbYMva1ygZPvo8bEprSrM5dFE//4PfSXLGX9d/DIMQX6ktETB1J3Fg73+qCyvyCXwRXfSZi1VkEaGkDhibuHuRctgcVHRmlkZdsjMQhjvJEUhMHL5jv4xOhDbPo5v8hCwZdDv47j4uVisRzD7YHCt1k71ZLFCxL/CDIN92GsYp9pOwEVuCVg2vfFho840EPuzXJ5ZuufnNnWvRyL8Pu8SkX3KX5jTU3JQ3upa76UdlwI3uyHG1pmOBvKjpwjllDRsxbUYi+rUaOHuDsggdzVUMSGkyboTC17C6NEheuFttgVI4sjeFGkxMb0O1VkRZs9Any0PZQvD2guxGch9bPe/iMTkwwwx3waeHQG5X0n4ETCwo3fowg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(53546011)(26005)(6506007)(6512007)(186003)(31686004)(2616005)(83380400001)(5660300002)(6486002)(8936002)(8676002)(2906002)(38100700002)(478600001)(66556008)(31696002)(66476007)(66946007)(86362001)(6916009)(41300700001)(4326008)(36756003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cytWV1ZYOVk3QUdHZnNNeHBUYzRQU3lxbDZBZ3djZ1ltTzhQYjBydGNBVG1h?=
 =?utf-8?B?aUEvUDVSaWhGdklFa2pHTWlNbTVDbytReHBsMlJIa0J0aTV4Ymw0L1lUaXdL?=
 =?utf-8?B?L3k4eGNWQXpJbVhDVXlPblZUamZLTmxoWTZjN1B5WnQ3RXlxYzJ0dTJnd0NK?=
 =?utf-8?B?aFBPUit6dHoxR0hNd0c2Z2FDSVVCRGVPSHRGYmxIblBjZEorMzU2Ym4rRk12?=
 =?utf-8?B?cFpMZHJ2NDd3bG1yWGhOMmxTWGpyejk2eENVUlR6V1ZqcHNOaEgyK214RzFG?=
 =?utf-8?B?TXR3elZtVXlyV1hERFBBeUFrYVF6emlMTjlNVGV6V1llMUpkL3I0SVdkNldy?=
 =?utf-8?B?REdCa2ZKSFhxZWp0SW9TWWVvMlZkb3NYeUdyalNNMmF0WWxGMmRoV2RXMmRo?=
 =?utf-8?B?WGJsaHhyclNrQmhIOHVJVHYwcmlneEFZNThFVk1FbEoxSEp6c0toeWtSK3pG?=
 =?utf-8?B?MzQ1Y1F1ZVArQ2xlcW8veit6ZTRSTVh6b1UzRVlMbmR4THhJWXV2dG1kWEhG?=
 =?utf-8?B?MWpjUHdaSHVYTUlLSS8wVUVSaFFxdUZ0a3BDdGJSenFFR3R3T0NnVGJYb0kz?=
 =?utf-8?B?dGVCZHVMMUxGYjdNSk5ia1NTNEp4SG1CS2tGYUJsQVpTVlowVDZqUTNGaSs5?=
 =?utf-8?B?cUdIODlCUGk1K0xOV0dBcnJJY3oyeklwbDlvUE13d0R3MmZVaTNUU2VCRHN1?=
 =?utf-8?B?M0owZWZvK0tZNDVUY1FSejZpajFoQ3VKSUJzRVJ1c2h5YnBJblF1WkNpMGpu?=
 =?utf-8?B?U1dkaGRSRUdEY1FhSXpPaGNwQmd6WTJmMFMvdjZ2QnJBcGxsaWM2QVdaQXc5?=
 =?utf-8?B?Q2x4VnFoL2FTLzV6UmpyTm0yT1VrRjJKUVpLOVhobmNBWW5wK0FITmVJMk5p?=
 =?utf-8?B?NWdSZDkzczMzNUwrMHNRZVpCTnFvTDNVQjhXSExYUzZjYVk3Mm5GaGtIWmI1?=
 =?utf-8?B?YitzRjYxeUl5RUplcGFYTDEzb1NYTjFneEEveTQ0Nk9ZVTdnWUdLa3FzK2Vu?=
 =?utf-8?B?a1ZBRHE5bEQ3RWZhL0Nkdzk0SlFiYnhPM1lLSG9zWTdmaXVReEdENXgyNHlL?=
 =?utf-8?B?eGM4ZnFjYzI1VmRsN1pPWFJ0NVd3UkNNTTdKZVQvYXFaNlc4QnlYV3doOFlh?=
 =?utf-8?B?bGx3R0RaMlZtbHdmRVdZTklBWTdzbk9nTEh0VVJuRTEySVdQSFZ0RXdmaHA4?=
 =?utf-8?B?RG8rQjhWc1cxc1k3R0ppenFnaWVZb0dOYWROaUpmeTYwNjhjNXpZOHZpVmIv?=
 =?utf-8?B?N0NyQkpTN1FBbTd3WjZtN29EQW55UHhCblVmeE41ZG9aTDAwVWpJbEIzU2wr?=
 =?utf-8?B?Kyt3Rkg2SkdMUzVzMmlyT2dsOHVLa1hGRWJjUEQzVzc4WnFPSmJ5aStkTUhV?=
 =?utf-8?B?RTFmMTRDemFaM3dPSDk5MHBNSGF6cUZYZ3BrTW5zeTlVZkcyK0xhLzdQeEla?=
 =?utf-8?B?dDdVZFFDaHp5anc2MGxvNmxWTjd4dVVkbUNoeDc4SUtjSDZWd1NGWC83NnZ5?=
 =?utf-8?B?OGpNSjFOSkIxWFZnR3JObnFDWXhMWWpsZmlRODZqNjJtT2hPMEtYQjQ3RXVT?=
 =?utf-8?B?bThQbGZNSHhTdGJsOE5WVkUyeGNsbWU4RzZYUDdYVTMvdFUraXRwbTdDN3dS?=
 =?utf-8?B?ZG1rQkFJVFNvT0FtRjlmdE5IVTNiUTMyeXoyR1RlVXZBWmdTaU05UUF5c1Vh?=
 =?utf-8?B?dTljWGo1ak13VmZRUWVQZ3lvSUxsUE85TTFLUlNRY0kwUi91RjBXejladXRN?=
 =?utf-8?B?aXBta0tqWkJManZ3eUJXdjduU0pSYVVSbGQwUFE2VEEybTJyU1VGeTJ4TzN5?=
 =?utf-8?B?YW4rckZ2ei9YRjJsci85SWZYa0FieVo4WHhxcENJODdkS2xXOTZ1eTRENWRz?=
 =?utf-8?B?aXRGL212dEJCUFVrMUhhQ3RwcGhpZ25hSzlwOXRobUNIZkxNajlTTGlwcEFr?=
 =?utf-8?B?eVBQQmlGL0N6RE1DREdlYUUrZ2F4ZVpUbElHY1BxRW52T21PSDdlTDdzVU9B?=
 =?utf-8?B?dG5MUkxadEcwTzRZd3NIVS9KaVRNZmlGWWU4dzJXRVM5UlNBYlpqYWdDQ1pI?=
 =?utf-8?B?MWlQOFFYWTVDclJMVVVJLzRnZEp2cFdFQWs3Z2RrT2RzWG5Ndk0zZFRzbVVt?=
 =?utf-8?Q?cRbHIhPU5CR7YsrEjSvnqm48c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910a23c7-06d2-4c6a-643b-08db6ce019e1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 14:03:16.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/s6bD+P9jUzzeBhkIho0tLSujHCdi8tc5zAaxrJ0y60vRSdrepTQkcjdhCKgj/McdAzXVNYNbTT3Olg4/UlSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10036

On 14.06.2023 15:08, Federico Serafini wrote:
> Hello everyone,
> 
> I am working on the violations of MISRA C:2012 Rule 8.10,
> whose headline says:
> "An inline function shall be declared with the static storage class".
> 
> For both ARM64 and X86_64 builds,
> function _spin_lock_cb() defined in spinlock.c violates the rule.
> Such function is declared in spinlock.h without
> the inline function specifier: are there any reasons to do this?

Since this function was mentioned elsewhere already, I'm afraid I
have to be a little blunt and ask back: Did you check the history
of the function. Yes, it is intentional to be that way, for the
function to be inlined into _spin_lock(), and for it to also be
available for external callers (we have just one right now, but
that could change).

> What about solving the violation by moving the function definition in
> spinlock.h and declaring it as static inline?

Did you try whether that would work at least purely mechanically?
I'm afraid you'll find that it doesn't, because of LOCK_PROFILE_*
being unavailable then. Yet we also don't want to expose all that
in the header.

In the earlier context I did suggest already to make the function
an always-inline one in spinlock.c, under a slightly altered name,
and then have _spin_lock_cb() be a trivial wrapper just like
_spin_lock() is. I guess best is going to be if I make and post a
patch ...

Jan

