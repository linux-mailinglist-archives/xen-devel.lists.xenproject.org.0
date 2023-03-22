Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685506C44FF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 09:33:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513177.793802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petu1-0002IH-Be; Wed, 22 Mar 2023 08:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513177.793802; Wed, 22 Mar 2023 08:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petu1-0002GU-8l; Wed, 22 Mar 2023 08:33:01 +0000
Received: by outflank-mailman (input) for mailman id 513177;
 Wed, 22 Mar 2023 08:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pettz-0002GO-UZ
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 08:32:59 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 259e2c3c-c88c-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 09:32:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:32:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 08:32:55 +0000
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
X-Inumbo-ID: 259e2c3c-c88c-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxKMWscBeKNbao5edbGtQliVlDq6v2uiMwGfKkm095Nk0+uHFYjMo264oZET7h9LkwB4sBLrIDJHrfoyhHcSY00gTppO6Gaw3kLNR7Z8yyfHO0kGYcFTdMqnoSjBKL5Qa46R1Zfh6XUde2XxwgFLZiPX+99Yeewx/kPc/qexarmhfTCwaB6ufUbgoJsCYIUnjMf05vsiuScWzMnSXxoA/p0B7Y/GVUMQHg6Uv3KuGWv0iTcPctRvsIKc+KhhgKgfY4olzskN8KTUmMwoa7WU89F9IwS00cj9pdWgiEm4JiYiJcC68mK4t85e3SioGeK+TYauWpkmsH1RRwlRbHwA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHyXxuU1Rhypu2bnUFIt+NLA3tWX8vHS5GOBOKlaYgQ=;
 b=n1Q3sTKNmbP7RtIytf2wxQdKLHESdNu5NjCMovKQFj0htWLDfdZnRJ8nl8Oyn+K9rD+LHbmz3HUlHRB+y7L2ZmzCqQt5p6MKrTFo3+JK8lhvVu+iPx8YDU7xrj7tVvPfi6cSKLMtM9pIecd8Ajm4AWPuZyOtEYw9e0rzfgq8srhxCEhidP6Pn8dU5qv6DiF4YARV65R6AJ7W4XTaZkOjytzHJijM4XzkNp5ysYuV7JlJeqFYaFHiGyX+k+9xid+L4lbMGy4GpWzPhhD1CtIvq9etjh9UYaC3439MA0nIdc/map4pK9W7IpuzuJzYtE4kwCWppLvI4t+X7UfdYM0GDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHyXxuU1Rhypu2bnUFIt+NLA3tWX8vHS5GOBOKlaYgQ=;
 b=Jr4Ww8qsNxu9mQ/5s7ejz0Q23eFTTVUFZcfuLMu5UwhVwnA7jUYmPjr3+OKGzbibASy4qReHpr/zaq7bkcz2+9N9WhQ6XchPLJRPmMVepUB7JtVjdIiRmRkfuRemiPYlquBTCya7EkhOXqdIdvRTeRyL6t/BxN+mNTq2dYIZDRA5fRGvX9s71zLFYWoce7/u3GTpPSW/ItTKNNWLipDoq5TkFj5m3PnzEB5P0BGMP9yHxJ/zmOn1hzTOxfpj0oKAry06xd1q9OXi+RpKfRQIhpZgMkBETmbb/fDMrDvTAx0GuRBGtlN1I5CfnvKqqtQxJ+ahxd2s847Em0dNfQO7qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0806d3d3-ebb1-f9cf-2746-4619ac1b125c@suse.com>
Date: Wed, 22 Mar 2023 09:32:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/5] Use HTTPS for all xenbits.xen.org Git repos
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.1679412247.git.demi@invisiblethingslab.com>
 <69fdc220c4cf7cd571e60a9e5bc89150cfb52017.1679412247.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <69fdc220c4cf7cd571e60a9e5bc89150cfb52017.1679412247.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bcacb2c-4ba3-46a6-c05a-08db2ab0087d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jc4rc36x3mDCNQPpcdfEpNb9ygh7WG57XT/tfsPvWHD2yMeTgybkb2tgs6nAnBLPAa9w9Fgjb4knqpLc4Wo/ulkC1mkZcUiM91XbrZpo4/llUOJD+akw5qo0NZVzAkCMYUVkmf0fgUb05r1xrM5gFtQ1KQ8ZBlvS/b0uN5CcxCxD3GPf4kIm+sRSPiaJandQkqs3ZJMc/Q1kSDXdSylATSZ/E5QBaxXxZo2QQcT2k5gweImEfagKQPFlOgpFAIX6Q3cbKcQNqgBSSXw0F5E5cewpc4Wxidc6IZYh5GXc9HRuP+ua+f2EcxU95gAflFq6bf8Szly7Ns3e4LEDpRYnJxLanxKrw+yQ2rbcL3wRiKRn9wI9ehe6iP5yQHh/yxOnkDzaf7gCbmJQdnBCyVuwBqOELMoRf77FUD1cjT38a0R99NibFfHX0UBNIg4ksmXGLv2HptmJm1+fxXDo3FvXyk6ytAUtD6HDLAnqfAE4ZLg40YIggex+fy8wvuE2ejFhFFhuyiy/ey6pmG7/U9258sDhcFOllw81UXJE7hF+wHgNNo65OEuc5VduhNrVF3pz31zXm/hPA7CfbpgwlGoiSh+87sq8gMjannFJlxgOeEvAMM65A20aDeJiQv/sywNCm/Z8pHsSwfqNHvJ84J5jJAstA/QoFktaQpEvgOSgaIsZMO6FcaOBo6QyTHHThurSzPptliEhJBhj3cRSZNV0GLUyggIMNcE6DbKVzAjeBLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(136003)(346002)(39850400004)(376002)(451199018)(8936002)(5660300002)(4744005)(7416002)(31696002)(86362001)(38100700002)(2906002)(36756003)(4326008)(6486002)(478600001)(2616005)(6512007)(41300700001)(186003)(26005)(6506007)(31686004)(54906003)(53546011)(316002)(8676002)(66556008)(66946007)(66476007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVZEMWlNcGNlNmYrR2lWMHlDcFIrcE1FODc3NElicXF6aWd2czIzM2pzYm11?=
 =?utf-8?B?dEZhbm14anoxQjZMNVphbUE3dm03Y3FUNU13c1hJbU92b3JaeDExbXpYbFpB?=
 =?utf-8?B?UXo1bGx5ZW9WWUg2NGNCeThSMmFjN2tQWFU2Vmk2Q1ZCUGlTbmZ3U1RINDhG?=
 =?utf-8?B?V3RlTzRlMnk5T2xCODArL3k2aW9hUTF4ZGZGanJSZWJmOEx5L2hFaWpUREdj?=
 =?utf-8?B?NEJnZUREQTRjK3IwNndTUVlFOUR5My91Z0FOUW4rSTNNNU5weFFFNDYyKzIx?=
 =?utf-8?B?Y092amFCWVV6WXJzK0QrVlM2VE5RalhFUVMvQ00zZzNuZnhHUEJ6TDMvbUNC?=
 =?utf-8?B?dncraC9IOURaWklQSlQ4V3owTS80OXpLZHoxTlBJWEJaK0JCRzhaWGRzUUVH?=
 =?utf-8?B?NWEyOHcrME8yYlpVL01oN1FQZ2hEUFVGck5EenRWM2hXL1h6a3Y3NXhYRWd1?=
 =?utf-8?B?YVdMQWo2ejhGUy9IYkNaT0htN1lpeGMvY1dpcVJFVmxkbStFTHdSbzdjbEk1?=
 =?utf-8?B?djFvelY0eFVQa1FjWSsyMm81YzNxQzRRbE5HeDdma2hYZEw0enhQOG5QaERZ?=
 =?utf-8?B?ZFlNNUd2SjZIRkFGYlVCMis0MTd6bXR6U0FRWlVGeVIrSm1iaEc1M3lGMUtu?=
 =?utf-8?B?ZFM2MmFBODdLRmE1ZWk2VlpFVW14ZkxpVTJtdG82TXA1M2Nub3U2UnhWdUds?=
 =?utf-8?B?S2xkaytnT2RxbXBlSFUwUDBFL2wzaUwxS1U1TU9ycVJhOUtpY0ZYVExBUWVR?=
 =?utf-8?B?LzQ2djNOVDFidEdXSjdQTGs2VTZUYzBIbDZFS3FUZUIydXBNak9HMktFbFdl?=
 =?utf-8?B?MEhtcTRnQXhYN090blEwdkYwVS8zalptZ0Mvc250Zlk1OGdFRVA2eHR5Z2Mz?=
 =?utf-8?B?L25jS0VjTDRoNkhpaG00U1lWV04vM1dSVmNjZ2VJQTU3cmZlQXhhZ09SUVdn?=
 =?utf-8?B?bEQ0Z0dxU21tajduRUVzTkUzK3ZrQ1VQQmxxV3k5TnFwSlo4ZEhDTE9YY0Ri?=
 =?utf-8?B?M1pESnIvbFUwS1R1ekZYbVlNUGYwT2g1Q0IxdFZYY0ppM3R1YThZajNXOHd4?=
 =?utf-8?B?WFpjZmliYkxncm92OHk3OTRMc2Z3RkVxQ0ZwOEc3TFk0MXYrMzRnMkpnTWlq?=
 =?utf-8?B?Q2xycEY0ZWFtOGhHdy9lQ1B4K3NXQUJMell5NzVtcmwwOHlEOE9Pcjl1Z1F3?=
 =?utf-8?B?UlV6NFlNMFRWK1hTRUhzODJvdFduS2M4QXpJdGRRMS9qbGhsVS8zZkdJZFhy?=
 =?utf-8?B?cDRGQVM4ZUNxbHA4V3pjU3lVZDlUNGMvVkxVdDQ0Wm44NmZ6cmIrd3F1NzM2?=
 =?utf-8?B?NzlsTHVmUGFLU2Q4VmxLaWkwUUFvRkVqVlBVS2tpMGV6UUV2c0d4TmVwOGxW?=
 =?utf-8?B?RHlnQnM3YzdxZ2ZFQzlVSk1rSzZ5UTU1TCt1cUlxcGN2dWR1OTlrbjhpMDl4?=
 =?utf-8?B?am1qNnBsb0hnUWVNem5sNFhXZnJFL1dQNEFSbHlvOXc2NTFUNkw4ZXQ2azl4?=
 =?utf-8?B?Uy9hWUNoY1cwS0lsb1NVejNnQUUvMzRDYTJaSURvdURzRlQyRDRQK240UXZi?=
 =?utf-8?B?MG1ZbzhwcmJmSng4RjVnNVc1Y1JKUmVtVEptNDRwVXhVSlN6MVRIck9vd1px?=
 =?utf-8?B?aUF3K2lMMDQ1Mm0xc20wV1RyZU0yaGQxNnJMQW1lZDhmK29DK01INUdCNlFQ?=
 =?utf-8?B?WVlRR1FvNFJwd2VmemtCdk9sVG5UNWpmUlcwTnllZFdBVWdoeDJzcUZabzhE?=
 =?utf-8?B?VzROYXFjMy9PM1ZyUG5ZN09mcjVXZTJpQTZlZUhVNzFJS2lEeDNOSGVVWkNF?=
 =?utf-8?B?cjhIU1MzamVyNW5WVm9oL2NCYVRaajA3R0FhVXpudXRIQmR4OHkwc1VCaktQ?=
 =?utf-8?B?ZDRka1lrOTNQaDhHV2RKbUJaZERFSkFhYVgyTGExNCtjUjRiYzFPVWMzR1d4?=
 =?utf-8?B?WUhYdEpIbms3ZWZzU00xWStwa2tQUnNGZC9obDBLLzd2YzlnZE9adm1EUVJl?=
 =?utf-8?B?SU9rdzhMNlVzNHllMlpKTG9yOVV6a3pBaC91eTRkV2FoSTVEbWh3STVKUGhE?=
 =?utf-8?B?a0FPaFVwUWNwbVcxanIrdW5oWnZDbkdBVXJZQzFLTForcVZDd3ZjTmh3Q2Iy?=
 =?utf-8?Q?PBfMN631zt2WU9OKGHBMI9hwE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcacb2c-4ba3-46a6-c05a-08db2ab0087d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 08:32:54.9689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgFER/xk4sw2w7Lyawh5ssYIQJQM5lZOBknQNoomvBM8bWLojcxjUGo3QsBMv8D0DhLxxl3ujhUnxMEALwP/AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776

On 21.03.2023 18:33, Demi Marie Obenour wrote:
> Obtaining code over an insecure transport is a terrible idea for
> blatently obvious reasons.  Even for non-executable data, insecure
> transports are considered deprecated.
> 
> This patch enforces the use of secure transports for all xenbits.xen.org
> Git repositories.  It was generated with the following shell script:
> 
>     git ls-files -z |
>     xargs -0 -- sed -Ei -- 's@(git://xenbits\.xen\.org|http://xenbits\.xen\.org/git-http)/@https://xenbits.xen.org/git-http/@g'

I thought I had asked already, but looking through earlier conversation
it looks like I only meant to: Why not git+ssh:// instead? Iirc there
are efficiency differences between http and git protocols.

Jan

