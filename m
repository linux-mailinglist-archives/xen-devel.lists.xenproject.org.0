Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AC476B5EC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 15:33:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574190.899415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpVH-0003sK-7a; Tue, 01 Aug 2023 13:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574190.899415; Tue, 01 Aug 2023 13:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpVH-0003q3-4k; Tue, 01 Aug 2023 13:33:35 +0000
Received: by outflank-mailman (input) for mailman id 574190;
 Tue, 01 Aug 2023 13:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQpVF-0003pt-EZ
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 13:33:33 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00f46d3b-3070-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 15:33:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB8020.eurprd04.prod.outlook.com (2603:10a6:20b:244::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 13:33:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 13:33:27 +0000
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
X-Inumbo-ID: 00f46d3b-3070-11ee-b25c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UM/lJX48GUWKCW8Y2aWAcRG3fkp4/taLadsBo9C1g6QVOJDY18MzEdu6Mkr9s2NO72/P5M8lpFOaJjs0lMA5GRax8AOzcp7b7m+RIl2IiPmpFtB0pgJRHJ178veJJlzv0qAJ3XRmxG3oJOqiVnK09XJwmlH8c3hyVkkp7sCVyST1Su53tXrZ/I3yUxWvAvUzfde0XiN8Tj0irxxuBfA4N1uGIGxNBqwpMQzEXgmUo9FEYvrDEcDwnmeIKVAMa5LmcniF82ceeXPerGgY4Gi+plLqL2NCAROj4Qubln6PG6lNbXv++SfH1OWzVxOJwuDxMZVc2cgXh4W6eA7J+HXOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6jcdQMXOD+ZH52n5pvz4Gz3DBFJrho+rSxakIkbNSo=;
 b=U15iLV6otr9Jd3kvqjuRK/p+KPxWVqxLyvfF3VL9GF0eKvvnSCL2HnMuaenm8ijAwZLLibSd+k7ivqY79eRJMHGOJBh89Xppaz1nra9Jeu5H7xJhdkSYf9KUM6Xke5NpAVlx1EyZW29BcGEvDNlKS2M9W8NVrQN8R8M3jlJWXAozDQMv/FKGCCXRVY0RJ/uErbbIEK1q/3nhLTpmpbQTS2B75Wlv9rq37YvP+wFTibexHacJQQJA2dR9FHWek13tp/eD4n0KgPi37bd9edpf5MWteHKKOP6JHvFwO4T92QszjKWCFqi/gcuffZzxDduhDszc5CNyhDJkISzJeNmg8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6jcdQMXOD+ZH52n5pvz4Gz3DBFJrho+rSxakIkbNSo=;
 b=5uFnTsYxRiUA+DGUUXlRzMRXf16mGm/9SScn7jj4ZrUOMFbrDmXyd+TAZelO50jU6o5cCSDD1+U/E/iWbIKtH/WzrHmXqu6voXmkxkm+8xR6TD4j/SjgNGW253NOccfMXbVVL0T1MchcDOuwtVMm/lX9S7ch4zljeoElaOKNUWW8Tn1vp3FNvNupGjR1xrysD3Q514ptXjBFZFBbxB5wEDKJXHtoPQREuSE6N3aP6JAWpGGuLs2hONY5NnoCyFsWZ4uCdZmmJN0UMo4DWvCAY2IfwTPB1+G9jOJD2Yj+qFxMGzoGCwagK4W6aL9LUyQGxwASuUogR3NsLTGCTseUxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c29439b-cfb8-68d0-8677-91ba897f5e7e@suse.com>
Date: Tue, 1 Aug 2023 15:33:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v2 1/3] xen/common: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690893696.git.nicola.vetrini@bugseng.com>
 <a2ec33d23fbc956d6b84e3736ff7f09549ab85b6.1690893696.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a2ec33d23fbc956d6b84e3736ff7f09549ab85b6.1690893696.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: f297f3f5-759f-4f67-05fc-08db9293e33f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	en6Q2rEHdFgbD1APINTKPQIcIJkhftBoWWKtYyEOG9VERcVNtOzJec9llZrlx9Jg9wWQNcKbUFuc1Qlm/gpjIslMX230vT7t3+MU1PvNxZtUlco+14hfvw9vBYTUBPdc6x71ws58f0U5hRnWP4M5FuvjmeQmGDnpkbA+CTHQcyy70TQx6tJjM/B+23VYkDCNcA0IzGCpEPuqoShke80dpPiUBYIwxBdXBv25YGHlEkLBfPvaK3g/nY8bJ18OQdQLgOj4ERbmM+Iu0HjLX9yZf6rUBtM66g5RUYKuaBgrkR6t7w/6Jq5lzfyml4x5npoIvb7BXrFJgvvyjjucnl+MVG5Ow3valsA4kHeCVEc+CZzPpYJaE7NRT7RDrLfPbHyNVh9BoV8hNEsolwgtmBj2cLa1v9YMWuD/MkJt0TbXzRKo1PecC5psotzo87GazCRHbm8O/ACj+yScVatj8buY8A3+hHQCwD3pZioZZHFVsLwzoxdrNykd10+KITawj5sOMKHX3RbiAm3A1bZ5j+jigNJLvxHaZTo27szDHgJXaUd2d9k2SEpkraLK2z9YLAkD6JF+yUUbZ4jT24KIjRYzDQA2M6zDn8yomM7a9OKLs3ttZ4L5LesiNDsBcfOzCBFj3ClDRASq/YpAFZ6l5NNpFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(6512007)(6486002)(36756003)(53546011)(2616005)(186003)(6506007)(26005)(83380400001)(66946007)(66556008)(7416002)(54906003)(4326008)(38100700002)(86362001)(66476007)(31696002)(41300700001)(316002)(6916009)(8936002)(8676002)(5660300002)(31686004)(2906002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N01OSzBjVjZuU3lHcFg3OFZDbTJhejBZNXlRN252aXBIeC9KRFBKUUtUcWg1?=
 =?utf-8?B?alFuU25rNEVSMkl2ZkNxMTNRRmsrZkkyekVLQnlpQXluSnZTL1YxcVN0MWFG?=
 =?utf-8?B?Ky8wcGFOeEpDRUtnbWNnUXFqdE03SUpxSEx0QWttcUhKWG5zaEMxZ1NmWVlM?=
 =?utf-8?B?bmVpZkc1emFlaFJCYTV1eUN1dmpoMUNJWFZVK1V5RFhpbklINHAzRUtLQ0U2?=
 =?utf-8?B?YlVrcldUMTRvZ2pVYi9tWXBGSkJsU1NIS2theGRMT0IzL3NOZVhxVXdCRFp0?=
 =?utf-8?B?Q1l5SjVjdnBybUc5aERjcDFvS2F2MmVkaGhqK0c1MmlOYVdTdVZ2ZWdEbjBp?=
 =?utf-8?B?dVBpM3ovb01pNktjN3BYOXRvVG9wYkJEUk9kQlRVWW5abUFMWlpQeThOMHdq?=
 =?utf-8?B?ZSs0Q1VPZldXSmY1YTlNbFlsQkdRb3ZGVk5VVitXWWVnWk5rTThLTm1tZzYy?=
 =?utf-8?B?b2RZVm9YcnBtSnZ0TzlJdDBOVzJuY3hiQ2ViQXREODExS1hOdmNnSEdMK2p5?=
 =?utf-8?B?cjZ4S0t4dEk1Y3dDQ0xLbWxwV2YwbnBObXFYRm5qM3lWbWJzaVQwT1BCR2Qr?=
 =?utf-8?B?bXJNWUgvZU0wUmhSMHFCcGNjMXlZREpYb2RQUUl2WlhnZ3ZpUW5taUR5OFAz?=
 =?utf-8?B?S3JGQWhkNDc0aGtpdXNNUU11YkI3YkRqZGdwUUtac2FXMW13NWMrcnFOVllD?=
 =?utf-8?B?dUt6NDVmeFpEZ3owRGUvV0daUStabGxVelU0THc4YmF5RG1RWllOeVpBYXJk?=
 =?utf-8?B?a21YaUxJUE92c0tLOGFtQXJkTjR1cW5YcGFWZnB5MU5FRGtZRXExbXJpU1h6?=
 =?utf-8?B?RFRnd25NODFwWnJmNUhEWUpKQXR0bGZRb0hZajljS1d0MnFiaU45bzBYT0Qw?=
 =?utf-8?B?T05PRzg4SHJBcFgwTW42cjZWWjZZU1hhUlZxcUo3d09XZ1hTa3dpWmk3a2JQ?=
 =?utf-8?B?WHNKUXNHVlV5UUhZeXQ4M0kwNUlaQTQ4MUlaZGR6Q3ZCeDgwOGRJbTZlVHM3?=
 =?utf-8?B?aGVra09mUHpuSGE4MWUycDNpMXhnM09rc3ZDdzNzZVFhc1B5ZjRTLzBXTnhP?=
 =?utf-8?B?NXo0ckcweUhQbWJCdmtLQXd2aXJmaVF5d0VCaEN2SmVJZDduTURIWU5kbGMw?=
 =?utf-8?B?MTB6cGZTS2VUS01UdndVbzkyUUtTMkF3WXVFK2RCMWpTaUswRHcwRFRkSmk4?=
 =?utf-8?B?UlphSzhVV25tUjU2ZlFtSXZEa0tXSlFNSndPSWIydmptYU9yVitzRFBETzJ2?=
 =?utf-8?B?S2NwKzEvRjFjekdmSzIvaFZ3d1grNGs0MFBDK1FPN2xjTGIyRDJQRVpwVWU5?=
 =?utf-8?B?M0JaV0xqdm41M09hc1U2a3RjalNLQjByd1FQNnVSdmpVRUVaaE5OOXlkSEZr?=
 =?utf-8?B?cHFhSmZPNWJ0MWxGZ0NhSjFaZGJSS2Y3WVY4dmRiWDRqbmZKNVVtc3R3L0FQ?=
 =?utf-8?B?eHNSWk9MZnAwNXgxenJFVHplbkwxczQ3RGE0VG10WDFaN1crcXZRNWJBMTNk?=
 =?utf-8?B?ZCs0eWN5S1F1SmxqZEVCbGxuOFQ0aTYyNG92UmVOaE9ibFFGT3o0Ny91RDFD?=
 =?utf-8?B?T2hJRi9hK0VBZFNOZndLZmZIMWZSdFNpNk9TTWl1d3hUSUZTSW84UDlaMWNI?=
 =?utf-8?B?YUoxTy90M00xQnk5VlhjaC81M0NxNzBGYlZrWld3TXdjWDg1NjMvSXYrWVpQ?=
 =?utf-8?B?MFp4akp6VXJzOFNJV25DV003WS91VDZYa21QS2RURDJIVTRnRHVDMjFSWFhr?=
 =?utf-8?B?QnNNVXUrc1J2amEvTXFzaDQzQnhHd0JVSEZ2Mm9vM05lQVNjcnYxR0JWdW50?=
 =?utf-8?B?c2lwa0tNaXdXSHJhcTZzT0dVRFFwdkhqT2ZIZnRZbWdQalEwUkhuc3pzUkZi?=
 =?utf-8?B?QnMyYUF4RUNwOGpNUVRVZUoxOWpGcnl4Y1ZMbVRicU9uc1VjanZoNWtJUkhW?=
 =?utf-8?B?KzZXOTErUDVDOXQ2eFJXSkIwdWJkSG8yS0pLaXYyN0lyVDY0WllOaWhkcDFt?=
 =?utf-8?B?cVd0RSsyaXFMMTJQSGpBUXVtODVjYnY3cjJJL1VLemR2ek1IN0JZbklHcWpy?=
 =?utf-8?B?Nzlwc09FSGJ1RlNLR1FMajJQcUZrTGVMSnB4THhqNTJEQjJTTTJSRXFOeUJG?=
 =?utf-8?Q?y4/ff0J003kj7gpfikdCeVBX5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f297f3f5-759f-4f67-05fc-08db9293e33f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 13:33:27.4298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hie37q/eIz2LOO4xNP1Z1+tzZcp/4lL0HI8TltP8CrJGJlyV03sjRA3aqI4zjpj2S7eGxGPKqf+RsNf/k7pRVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8020

On 01.08.2023 14:47, Nicola Vetrini wrote:
> --- a/xen/common/compat/memory.c
> +++ b/xen/common/compat/memory.c
> @@ -81,6 +81,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>              struct compat_memory_exchange xchg;
>              struct compat_add_to_physmap atp;
>              struct compat_add_to_physmap_batch atpb;
> +            struct compat_remove_from_physmap rmfp;
>              struct compat_vnuma_topology_info vnuma;
>              struct compat_mem_access_op mao;
>              struct compat_mem_acquire_resource mar;
> @@ -321,12 +322,10 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>  
>          case XENMEM_remove_from_physmap:
>          {
> -            struct compat_remove_from_physmap cmp;
> -
> -            if ( copy_from_guest(&cmp, compat, 1) )
> +            if ( copy_from_guest(&cmp.rmfp, compat, 1) )
>                  return -EFAULT;
>  
> -            XLAT_remove_from_physmap(nat.xrfp, &cmp);
> +            XLAT_remove_from_physmap(nat.xrfp, &cmp.rmfp);

Is there a reason not to use the same name in the compat union as is
used in the native one, like all other members do?

Preferably with consistent naming (which I'd be okay switching to
while committing)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

