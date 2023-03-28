Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5486CC1EF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 16:19:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515893.799222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAAh-000860-Lc; Tue, 28 Mar 2023 14:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515893.799222; Tue, 28 Mar 2023 14:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAAh-00082Z-IG; Tue, 28 Mar 2023 14:19:35 +0000
Received: by outflank-mailman (input) for mailman id 515893;
 Tue, 28 Mar 2023 14:19:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phAAf-0007lx-Iz
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 14:19:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e2069a3-cd73-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 16:19:32 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB8117.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 14:19:29 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 14:19:28 +0000
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
X-Inumbo-ID: 8e2069a3-cd73-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7M7nk875zCxjuukrb5hp0w+WsaO2Y2XxvocLlooDLWpk3mHlLltEfDgOWoGSe9DxigfAzoejYn5J6ugUMngYq6Y2SCMyArb27NjC/KUv7jXKW2p9GetyzAvKmMtEeFnrxlYYvFjTFrEERebnqKP6eZHo5SjXwn+uFEoR8w8zoxhAMzGMZU25KVRdvnitZ6CoCgh0EhrQ+PU9XMqZyZs0BQPHsSck3hVu1oFE/AdzOBBEjOL7q5ruh/hcK7/VZ1hxviDFjg7FaZd/o14yjEOVfzYcRP7FIWZl/nXhwNy1znM+i0EgzYFZ7vU0qVOLxvwy6SMpX211cxCeBLoKaXgLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELX2Ur6gsiOCVOazo1FUIqwKgik4m20t3JWgvWETr7c=;
 b=hOdIIEdm8dVMO8uVuQIgbGWvZ9UJ8DQHywUUQVe3g1zoOkUCg7LhgkeDMlEj5cXgZd7A5byJtTB0sK18VH2jHclWBGG9kWxEJtBV5IIv9AKKaOxI6pUbgDbt+UU5oKYAF1g+FEh/4Qv7q90BkuVu0UNHgLlMJj8g6B9SrVVu2da8hS5ZKInD/4Z011+8SbbkqUg11yfKpvCGEdkZjw1n1L2Gf9+1TdYFrZo/9xy3LQuEwBJO3IphIfJ+oWK6ngEAN8aJ6enEfq/ZclgXseg/EijHKIF0ePeDM9mbdyuAaBiC1PGtM35A40hnTjNS0S27aTVRuOIXFDXqEMQfSc0Tzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELX2Ur6gsiOCVOazo1FUIqwKgik4m20t3JWgvWETr7c=;
 b=r0BsSOW819MgLaHpxBuc3NC8tlvCl/06/+lk4exZuBm8M8Iyop550xwoDBQ/PKHG7iVZGguN8gUK1koF+jJxBTngM/6DX1bNenfXCTADCgGjCwCmMSg66U4WvDx8uykGq8BQgg1JIBMjcksH1qjsCHV84v91+fp9A8TFWA9JCGDDZY0fyU2VOBkzEiQ+lSd+5YdjzFK2Joke4kK/AmH1XfIBZh8SPEFKfYya+LtX+ZgD7a2CfOtow+KykG1SNxUORwWOSMSmW03R7OxJV+PvYxmTcCYj7SM3/TEqIwceISqUuU8HlIhAN0ewKrQf4zt7/3z5vBPOg5yeunyXG+DrRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e86b93e-06c4-5998-5ec1-5543d357f960@suse.com>
Date: Tue, 28 Mar 2023 16:19:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/5] x86/ucode: Cache results in microcode_scan_module()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230327194126.3573997-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f29cc27-8c9c-4eaf-140f-08db2f97711d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NrqAtJJHWqqG46rsfdGqQHo6Gco82eYiz2Cj53rJk94DRSPJJ2hC0pXtdCZ5ekxIH8fAuxFdMCb+Psc41fl7x/DBW1Ms5g+nJqWGvst8Rv+jKmvx24exipEW229l0v7RwzQPWBFFkklMT/CA3bk/vSzH3RjFQh9XbABYp8wSuFnTG/520tvK52Ar7JX8F3gA73GNvU7uavQDbGC5B8GA/pNUY9k1FnfluaaN9C9PSoe1+XhnxjTRDKrDZgJuFiwiPK3sKOe4ZCGyaS8QW5mIsD8XDFxNYgcZW/x/XRj/1Jc97FX5IBsZjZ69U+2Ffx501+juU7k28OLzyRtlXBy4HWh6hXmsxYsBtRUEjSkC2XkX916GTxavufaFaxVtAs0/arUrLOFSDupMkUOo/+HeXSTclQ35WkgjBPSgMpDpRGiAWYqPldCvVLptwAgU0Ecrn9pVOCOyV1qffqJw+D2WTTzlghWh+gI9bURzDkSa/RNTVq3y4xqSqpnxeoCcV93nTRUAvsOHrfBZKaShMgm6AqVAPrhnRD2AnMJh0KACQhm3EGdTYCz/U0LdLh7DNBKLVaoIFKFvrqleBRzxhR97HUWE5CQWuXu0vok1RhyJvbPBS7SFZeRVOMOIf4hMrl3XCASlVIQnBzHi+b/gqBs1Eg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(31686004)(36756003)(53546011)(6506007)(26005)(6512007)(186003)(66899021)(2616005)(8936002)(66556008)(41300700001)(4326008)(66476007)(6916009)(66946007)(5660300002)(478600001)(316002)(8676002)(54906003)(4744005)(38100700002)(2906002)(6486002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0l2YzlicWlBcHNhVkVOcFluNmx5RjVZU0Nua1luL2JBbGpuMGZCdHZuYzg5?=
 =?utf-8?B?YzFjM0J6Ulg1OUx5d1FmUVlMN0dZekoxWi9TQWptSHVGUlpzdWlVRDEveEx4?=
 =?utf-8?B?S25qV2hiNDdXWUhGRElUdUxYNW9FL0p1TTUrR0htcHRndW02TlJ3LzN6bXZ0?=
 =?utf-8?B?aUVVVmp1RmpFeTh3aDRiaEEzQUh6cklKeVlXTWVHMnV5RmZGVkJrdjBac0l6?=
 =?utf-8?B?emVRSXlENzNYb3dMVThuRDhzbVdGRXY2T0RGTGZSVitOdis1Szh3T1VRUmkv?=
 =?utf-8?B?cXdUT2wyWWc4NWtubTdHZ2NjWndTVm5HTldualFtOFBUeVp0VGlnU3ptcU02?=
 =?utf-8?B?MFc1ZkpyU2szaEs3QkxsMm4yWEtJQm1pSmFJajdnR1dZbXUvUXRLRjRJbE5U?=
 =?utf-8?B?bktTMFY5cXV3UGorQm9nSDZrSjZ4ZS9vTlRVRjdrNXUrRytoTDIyUTE1ejVq?=
 =?utf-8?B?cFFpRXB1L05GOU8xSzdDTFkyT3R4ZnlZTCtsTm1wb3hSczhEUjBldU1qZjN1?=
 =?utf-8?B?UkZjeDR4cktZWUVUSWFPbG9uczBCSStqa000NlhHSGkyTk0xQ1hTZnlpMzBh?=
 =?utf-8?B?cHFHdmdZT3UvQlRSYWZzOHlxL25CTHZqMjd4WGJLaEJnZzJWbkxaRVJ6SVNq?=
 =?utf-8?B?TUJMZG9xZVhJN2EwZTFYcmpyOUhPRk9VMnhDRWYwY3JwUmJiVng0ay8yQ09q?=
 =?utf-8?B?dThRc3MxQTNmeTFrTC8xaGJiYnFUZFBoQUZ2K0phTWdBYkRaQ2dSYStGU3BV?=
 =?utf-8?B?M2gxVWM5MUswY0tzQ1VheVhhSVlPSlZjRyt1bDJMRVNNYXhBc0tiSXdLUHAx?=
 =?utf-8?B?dkhHRmYySHJTS3QyYm9oWkdJNHMvTExEN05XanJVeUllZERoYlZPcmVmVXN3?=
 =?utf-8?B?SFFheitJaXlibUdvY09yRlZNdzdCUXVaNTBKaGtUdWhUT1NhZnhkOHRzUFZ3?=
 =?utf-8?B?bVhvRG93SnlzcWdndEU3QXdvUkFsUzMwYW9MK1hpV0wrLzFVenpkV0ppY2xL?=
 =?utf-8?B?NHB6OXdXVUVyQUt6MzlIeGliaDVHaU92ejgrREtjT0FmcDk5NkdhbExRZFBn?=
 =?utf-8?B?dkJaQVF1WGRlODRGTW83WHVSelkrTmt6cHc0UXV3ejdyYUs3WnUvNXcxRHlU?=
 =?utf-8?B?RlRVSkhxam9WTkJYeS83a012UWlSK1JuZkxXSXV5cjVZaDErbVgxQmF4cDJP?=
 =?utf-8?B?TlM5NDFxL2xZeHFVS2xEUWhITHIxVFVKTklnSWN5U3l6L3BBWkxYdmZDV0E4?=
 =?utf-8?B?Q2FQNXU4cStwZk5uRjhUaDRGNXg0WlMwL3JaOURYaDFOS3dlVWhFOTlxaXpX?=
 =?utf-8?B?T2dzRWFYSFVtcERjOEJkeFQwK0RiRDNSZTRCSjdVRnlyWFJrOGxXWkQrakh3?=
 =?utf-8?B?QUI0OXlaNWpxZ0xCTjZmTjVUUStncG9ZWGlnYy93WXZmVU5aN0EvT0RFNHpC?=
 =?utf-8?B?VmdsS1gvb0JmT1BxQ0tKa3YxMHpzeUc3N2MxR095a1F4SDV5NmtWdWpLTjF5?=
 =?utf-8?B?M1ZIZ0pLcTZwb3FDbHZPZXh3aExKUS9YZmtNWjJYVHRuMWpjNEtLMWVpWXg3?=
 =?utf-8?B?NHRPZURlUlZMZ0R4VHdsMDIvNEhPdTdKMmVjUXpySDBxYVBCb2VYT2RBbTdy?=
 =?utf-8?B?enN6NDdZSmhDRjJGYVNHcGM0clJwNjdXVDRMdGZ3bUVWTWhwdWVxakNhWlUz?=
 =?utf-8?B?NnJyYk9BbUN3eE52QzhKVUVjWHRkR2NNejFuWStyalBuWVNWaWlHK1lwTjNX?=
 =?utf-8?B?eE84aWRqZnhTM0diZ3Y4UUdQTElnQzB5N3MvZkl0aTNVRWM4UXgweGxYdXJJ?=
 =?utf-8?B?MDlIOGlWdlRIcTdRSkdlQk9wdTVJa3J5NDRNaDdnUHFMQzBDcFh3YzV3Nitk?=
 =?utf-8?B?aC9rcmJyNWUzMC9KcThhWHBodUxDNHFRbW11dXllZGlBdHlTSjV6OHBDRFZT?=
 =?utf-8?B?d1h1WXRLbUVDQ0FOSlVLbCtkNkowMmhjYzVlMXRURTVGdk5ueHh4UklEUXgr?=
 =?utf-8?B?YTdJZWxHeThHQTdWSmdnMTVKU01JemQ5eThHVExGUkxUV1JuNDdBQzNrdjlS?=
 =?utf-8?B?UGdpNTMxNmRUcTczZnNTK05vTTg5QW5VY2VUYXlWRDVOUmNNb1FQbEZBU001?=
 =?utf-8?Q?gd+atoMXkZbpwez24f5EpnROq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f29cc27-8c9c-4eaf-140f-08db2f97711d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 14:19:28.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +28RakD2xPM9LBTqbby6onOgMieZW2czhlCCj83loK0Da2bv/yjjfePse8nuNh5lucDwg8fHTlQ3DyV7oAU8iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8117

On 27.03.2023 21:41, Andrew Cooper wrote:
> When microcode_scan_module() is used, it's used twice.
> 
> The caching of the bootstrap_map() pointer in ucode_blob.data is buggy for
> multiple reasons and is going to be removed.

As before I'm not convinced of "buggy".

> Right now, the boot flow depends on the second pass over
> bootstrap_map()/find_cpio_data() altering ucode_blob.data to use the directmap
> alias of the CPIO module, where previously it caches the early boostrap
> mapping.
> 
> If the scan is successful, it will be successful the second time too, but
> there's no point repeating the work.  Cache the module index, offset and size
> to short circuit things the second time around.

If the scan failed, it will fail the 2nd time too. Maybe deal with
this case as well, e.g. by clearing ucode_scan at the end of
microcode_scan_module() when nothing was found?

Jan

