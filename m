Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845B740D763
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 12:29:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188324.337453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQod1-000565-Ek; Thu, 16 Sep 2021 10:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188324.337453; Thu, 16 Sep 2021 10:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQod1-000533-BX; Thu, 16 Sep 2021 10:28:27 +0000
Received: by outflank-mailman (input) for mailman id 188324;
 Thu, 16 Sep 2021 10:28:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQocz-00052x-Qe
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 10:28:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d26569c2-16d8-11ec-b5c1-12813bfff9fa;
 Thu, 16 Sep 2021 10:28:24 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-nAAPNTtrN1--AOH4Q7NWbA-1; Thu, 16 Sep 2021 12:28:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 16 Sep
 2021 10:28:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 10:28:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0225.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 10:28:20 +0000
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
X-Inumbo-ID: d26569c2-16d8-11ec-b5c1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631788103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NMwn1Kd0VYtqHe8kwd7LAUWfk8cZ+xmjC6aX3kutlhw=;
	b=XzJ8PTBinUb3AczQvfq3A5hHAvQLK4m0YXK3nYrh7uD5Z2AvmZ3DMUZNcaA4kZqORZ+T3b
	G2KpCuz6r2dxWSHKA0gsw0AnRei0C8pyi3gBtRVtLSqIg8wg20tDn+nlYLz97OP0asKNen
	1rYt48q/oegfqGvUlvbg1DOdRBIXyLU=
X-MC-Unique: nAAPNTtrN1--AOH4Q7NWbA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fg6qtAHj6KOqCUBcnKQMOjQPFHbv3PdPqWv1ha6naX8A0R9WR+/JKodOBI3JS2lVvPqHDObNYoFlJJQXv8IOMFYs5ANYaKHwl8iKvAvH0MePZocHBlBAwqH3IHZzkNyqDSSMod/YJ5kYUmMCBOebJ90obqF8h/4gMcwpng/RDf2fU9A2Xlri3FoF8/IfuU7Ztwc0WgeFX0TzCgx3FrvQHOEqH1uMGnbMMX2YhcxfegZDpWOY0saKly19utMXCYu4piCcvHBIDgrMSFlu9sjZjPbmvKIyGmocbR02STSm4PFz2aZk3chznR4OggYQF0TbHAZ1hCMB+X6oxHgv1DcGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NMwn1Kd0VYtqHe8kwd7LAUWfk8cZ+xmjC6aX3kutlhw=;
 b=n+fg5mkvQb8ZVWS3xULOFK5DqTBFavMuEHZw+kk0NmdB/9pkBhS6uJ3t2vLdjyre0rs+Wj9czHngLeBYRG+XmeYPbW8cZUSnv7sqKe+cOU+ZoRh9OgSR5N1nlpieaH/xgXmsC5Z+wk41rBTDDj6V90uN1Z2DlhQEpokrVrZnX1OugDik8S+wJXh2LAGCGy0d73qbxUpQ9YpBIr4msQ7hoyoS+v+MuKQNg/vGcsvFlUwZdpv4qcWJzUpkTGmP471JhqfA8VmoaWAsyxUDRamqg9IBFvYO8hmpRVeVLudVBaa8TEIdi1NtARkG/w5JbUBC1d18+E3Iu4xYRabFPid/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] tools/xl: fix autoballoon regex
To: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <6be4aba579bda042bef4cf0991a92444d0c3f05e.1631781599.git.isaikin-dmitry@yandex.ru>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8cfdc5f0-9139-c474-c60a-2495d4069cf7@suse.com>
Date: Thu, 16 Sep 2021 12:28:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6be4aba579bda042bef4cf0991a92444d0c3f05e.1631781599.git.isaikin-dmitry@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0225.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea049a5d-c4cd-4383-defc-08d978fcb4e3
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7375DC62E7E0932437E640EDB3DC9@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kjGvSW5JruD9QH6b0oS0kYwVxMwIdS4TL3NHSNuirUiBBrjO+ToneF9pFj04b3q3AmBTTTOOLrEF2ZApdqGbN/9hD6Cpgm0fk+ro+Ae/6SAT5CAucVu+9Xm3B5Wiy8QzEyGMuJi1NTkFhETCHJboH2+1UjLwzhOZ6hC6eh7blgmZ1Y92rPLgYleLi4nPuz5daALBbA20rO4185mpLzmZ+zwG1BcvDV/LiwwEhm/dBzs1V1luOGTcPw0nmU3ugTbC5dQigl8IoU8ek/CsGZJKv/dh6hilv5Qky2tPkI8huML9pU4FzxXqthkVMkIfsxY7SiZE8elgxahzTPYQrEuAeHxGr+fQ2FVDoAu2l11ucG5B8whzWDIonVfUQjDIz6be9exoB9tkUynvvvZ4P5Vlp/hSZSGZ86ttsJQpyGXFMReAeinsWiK0dSDMmVpDO7HX3AuKWDM0dXaRZjAKXvY+dTGEfSpU6N62jOa6Hek2OvY61BXRh5bmWU0qR9jNUPJ3ew4hAF3P+edeUKCvpFX+sZtPkg8Kshg4pdczrw6ogbfRKZuaBoLkQatpp9jyo6O7bvIIBu/o1rDcmgGfNT8s4tvN4hk+9xquhfErXpftpwrgBW9UWdCxeXJNZdtqCjyx7JM62QXxKBptTlN0RAgU+mLOyB1R1dFGK6mFFJ2ibJLIcLUl+1kmqSlK+VbTnwA79eI4JF2Z/I7q6F0f+3PzK4EwVdS5s7UdWmUtE5C36xs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(6486002)(66556008)(2616005)(86362001)(31696002)(2906002)(66946007)(4326008)(956004)(8676002)(5660300002)(186003)(36756003)(54906003)(26005)(38100700002)(53546011)(8936002)(316002)(6916009)(4744005)(31686004)(508600001)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHNMRUxMRG5ESXFBRDNON1RvcWo3R0dLMDhyRGlnSEpwU2lJaEtxdU1JWUlt?=
 =?utf-8?B?V0xrQWQrQythaTBFSlVpRWtZWk5VY2J6Y3NpNmw5QUpCeXM5K0FkZXNTaytH?=
 =?utf-8?B?NFJmMytNRUduellGZEpBSWxETzRxd1dwdCtWcVlHN2ZzTWFzY0EwbHBqbmtZ?=
 =?utf-8?B?YVhPM1lGQ3ZQZjdIVHpRM3JlcFpNT3I3ZFBhbHIxQjJYaHd6M3RpeVdCdllD?=
 =?utf-8?B?cis4VE43SE1qeUxsV2VWQzNySmZyaldQWStWNE1hdHRvaUJUWW40REVaS3Bi?=
 =?utf-8?B?aWlWLy8rNTNJb0hTUk5iRnhyWkppd2pBb1hXeGVtckVsQ0I3T2pwcE8waFli?=
 =?utf-8?B?SkZlRm1TREtMYXhIZXNaUHdvSzVlQnJZNlJDZjB5cFdremNuODg3OEZUYlgr?=
 =?utf-8?B?V2tVbzVEQ0JjaHRNallEbmlJYmpLTnNMZnlmK0V6T01Qbk8vWFNNMDdvOXVt?=
 =?utf-8?B?SWxHZk92Q2FmWE16OTVLWXd6TSthZWc1Sm9Qck42QVJXbWw3NkVZYTlocDk0?=
 =?utf-8?B?d3BDdFlaeCtKRFJ6Y29tUE5EdllEM0pTTHFFOUFSL2FTTDZFanl5QWZTWGYz?=
 =?utf-8?B?R2MrVDI5QVYyb0NQaFowcjNyY2puaW5wQU9hYWdlQXQ0eUhoN0NtYXlYVGdi?=
 =?utf-8?B?T3dGQ1RJbDZZdmNrUW1HZmtWaDZNZ0xHbzAxendrei9vUzlQN2drZTdVQnNB?=
 =?utf-8?B?dWpzVktEMjdnTEtqa2dCeVFQMGtIR3dkZGpSUlA0TVJWemdZL3ZkMmhtMUpE?=
 =?utf-8?B?ZFZOcjI4K1FjcUc1V1VOSzV0ZzZuQm96NWJwSzU5TlQrQ0ZtMjVzVlJiUUpy?=
 =?utf-8?B?L1g0ZEkrUlB2RjE5NU5zcWlLR2l6N29mbXVQMnJyMHNhUldFNVBTMTA1clFl?=
 =?utf-8?B?NjMwaklpV3hPV3ZZL093YXdzMHh1MUw3dkFHVWwrRUhiRnBNblVPbSthUEcv?=
 =?utf-8?B?SFZJYnBkb0ZCVFJoMFNyWHcxY05TdGIwNWdiK21qVzluWWFta1IzUWxjTDRM?=
 =?utf-8?B?eDlWa0hNOUx3ZU1Qa1VVSDVRV0E5MTUxcStKUkF3MnhyN2RBWkRwdjV4Tnc2?=
 =?utf-8?B?eDNGc0ZWd0w4bE9VOWpnMm1OZjZEL1M3Tm5qVEd5b2ovV3VGUzNIYlZrSU9p?=
 =?utf-8?B?NUpmZGVUQzU3OEVLM3ptV2JhWEpXVzRrVlNzU0hDZ0VvZEp2UU1Bcm50UC9G?=
 =?utf-8?B?MWZhZjE4d3dxZXBOam1RWEk3RW5uMUlMUE1FM1pZTmdiMmkxcXU3WE50aFVs?=
 =?utf-8?B?VXFSWTcxWlhrWFBJWmdQVlMvemttcXp2VjA5Y01wZ0wzVjlzdHZGOFlqRXMv?=
 =?utf-8?B?Mm9zZ01KdXZOV3V5c0RZWUQ3T2h0QnZZMUQ2RGIvUDdpdkVRSFJIYWFjZkkx?=
 =?utf-8?B?dU5zV016R1JiYzhOc0VRTVkwMHVobWlaZy82UHJPbkozbnptSGh6U1pQcld4?=
 =?utf-8?B?TWVqcitKT3ZzbmpOTWhGQWwvKzk5OVZvWUo0Sk56YVFZa0hMemJqb0tqY0Jh?=
 =?utf-8?B?c1lJRzlvOXBvTjM1SFJuZHRvWXkzMW5nMHh1KzduVm1xRFlGRHpPRElYSnJi?=
 =?utf-8?B?ekc3bzhFUEZ6M0hVd04yOWRwZWEwQVZuU3pXemxlc1RVR3FaeVZ1R1V3NWxU?=
 =?utf-8?B?cG9BendLcThJOGtzenMrT3RwUi9mR0p6QzhXeXorSkpIdVNUMEgxRlRpMkNW?=
 =?utf-8?B?bU5hclVEWnE0cGZEUTczZzhaNnI3SjR2MUVxUmlrdGNFN0psNjlLWGUyemNF?=
 =?utf-8?Q?37y0FGaF20oNMQIr0LmCiCKElgXqm1JwfXqzvOK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea049a5d-c4cd-4383-defc-08d978fcb4e3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 10:28:21.3209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSB986MJhQ9KchxLYBPZtoGuq+zcIlZQNPofFKh8rROe8iahPfx4rxb3K60Dbe/otBSiv11PMXH+UT3vgX1w7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 16.09.2021 11:34, Dmitry Isaikin wrote:
> --- a/tools/xl/xl.c
> +++ b/tools/xl/xl.c
> @@ -81,7 +81,7 @@ static int auto_autoballoon(void)
>          return 1; /* default to on */
>  
>      ret = regcomp(&regex,
> -                  "(^| )dom0_mem=((|min:|max:)[0-9]+[bBkKmMgG]?,?)+($| )",
> +                  "(^| )dom0_mem=((|min:|max:)-?[0-9]+[bBkKmMgG]?,?)+($| )",

Wouldn't this be a good opportunity to also add [tT] to the list
of permitted granularity suffixes? The hypervisor's
parse_size_and_unit() has been supporting this for quite some
time ...

Jan


