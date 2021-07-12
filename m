Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968103C671D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 01:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154903.286085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m35bi-00036D-JY; Mon, 12 Jul 2021 23:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154903.286085; Mon, 12 Jul 2021 23:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m35bi-00034O-G1; Mon, 12 Jul 2021 23:45:02 +0000
Received: by outflank-mailman (input) for mailman id 154903;
 Mon, 12 Jul 2021 23:45:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbkG=ME=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m35bg-00034I-7L
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 23:45:00 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 679e497e-39b3-449d-a1fc-3ac381064b85;
 Mon, 12 Jul 2021 23:44:58 +0000 (UTC)
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
X-Inumbo-ID: 679e497e-39b3-449d-a1fc-3ac381064b85
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626133498;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=F82zOYAtgHECIpCZvh/BkXZhYe6/goJUX338nclORpw=;
  b=h+76dd7siBIaSVVVgm+umJCM2r83ARvNroyPUiDD0TWfeVB6RpjrDOI3
   xPdZfn3ArjgEFaoTnTc+Bb7KVU3R7Fq0tryaG7u7X29RIu+UJDBiaN6kP
   I7u5dJ01duSqNolVkl40h5vrR4NcPDm3G4tkBl3VSMOppvCR759TLlgMq
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tot671/bkt9g07MfKfalv8s6aU4YYc9ncDJQyuGHm93GQx3n4CQ/jiDz/GVLKTrJp5KjpKosYl
 a3SCuhTdDwrfIo7vBbiTl9nU4kA1zbOAd3yiFC0QB8dO2am7VsOiiSt1NaOBp+Et7MRtUzzF3f
 RKDeFww6XgzZwyp5XyYwPY609+dXk6uux6IUOcEQj3Xu9yjSHn9yWdFd9feAdrpSe6Em21eh41
 kavsN2BKt1G8+JNyuGQ3VLAHwdm25mIKMuuFYlPsNI9Lenvs+P/CGJschfCLKrkzifTjOKV0fE
 pHA=
X-SBRS: 5.1
X-MesageID: 47810340
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:73F3BaHiCW2XteSspLqFH5HXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HmBEDyewKjyXcT2/hvAV7CZnibhILMFuBfBOTZskbd8kHFh5dgPO
 JbAtVD4b7LfCtHZKTBkXGF+r8bqbHtms3Y5pa9vgJQpENRGsddBm9Ce3am+yZNNWx77PQCZf
 6hD4Z81kCdkSN9VLXLOpBJZZmOm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTsj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZuA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMTEaN69MFkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l3CzvWEpnYco/jxiuLMlGfpsRLEkjQdo+M9qJlO81GlnKp
 guMCjk3ocVTbvABEqp+FWGqbeXLwYO9hTveDlIhiXa6UkOoJlD9Tpu+CUopAZJyHsMcegx2w
 36CNUfqFhvdL5dUUsvPpZNfSOIYla9CC4kdljieWjaKA==
X-IronPort-AV: E=Sophos;i="5.84,235,1620705600"; 
   d="scan'208";a="47810340"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+mo4vP8ljWzCc+o9F3Ghdp6R4u8BxUDmlumY4A/fwXByhv9TJqq8QRrpviv/SiU1h14qCZD/RgCxw2Lox50rX+qCreCSlqnUXOhMlQNMNYZ7rmh5qkxco3+SPE47FcsSsN+sYitXe7ylAO9AeqDNqhnsVZT0Z96vtvLY2mu7fyF8wk8u+nnLL2hkw9TISuA+G2qsNo4hPGgU1G47IC4uRqJfpnSmvqE7T+vWdpURNu2SP8Ph5aimHulIFZ+aFi3+Ya8Z9LZWBjkEnOiDRHkkaafjdWqPjaj3KtieZ0e7kfXl8clG21k96doHadaBeyElaZrpEBeX8FH/Y8XMI+Kzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeEPdXEhoBd2G9OcuYNEeCOJ7z60/R4/DkbrKBc9/V8=;
 b=mVm2lfYBnNhYTcp4uKgNNCaemku53LoajQWYXa+noGy3sZqkOa6RXDoZWFJrGU+RmeLE+cFC64johnL+eQgZj8lfFUBVEle6sjsv3JRN03ckgXL1tH+GJ1P4ky4cmUAhADxp9af1MP3mRRVp5CnMWLfnyPj4IYEZxoTfvcJnTaHk3SelBz+xO8+mT40GelbeRJ+ysCwbm506p+lqoNOG3KmKNLgTxyAuLzEVqCkaMwarejPa78DpfMcNGVbyyGOKsq209XFr2XbYQEe3XXFw/uaUEHRFwr2+Xq7KCOstsX5eP4NLRp0AO4hwPpsxS/3/K7bFpeTx9ergCo3C9Xi+7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeEPdXEhoBd2G9OcuYNEeCOJ7z60/R4/DkbrKBc9/V8=;
 b=HAzqp+slxiAVfEi520YxnZGqcAWNUYiRePzPlpjjEp8v+163JXrKeOgclWLEbLENcju0z3GqIUD4K2koCRtU598ZkCWcn0vYgqG7n5aIH7bcpGrq6OCwHEzPLG8nvNljMyqJEcWmz8xD9Uzg4Fehr8b9wfCdrpgB5wqRMkugRLE=
Subject: Re: [PATCH v2 04/10] xsm: convert xsm_ops hook calls to alternative
 call
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-5-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <be7899b7-aa4b-91f5-76ff-416f25f16d68@citrix.com>
Date: Tue, 13 Jul 2021 00:44:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210712203233.20289-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0142.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d813f579-5d16-4994-5b42-08d9458f0d25
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5454:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB545465F9DF1CE5C598241421BA159@SJ0PR03MB5454.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L0ViihyEW4YiAXxpBjgRd+1y/WXZb7C8atDkhbQSXHb1il3/JzUlYHFbjNUjtTLzWBogfSB2zW7u1cZ3NJtyI5isscbbXvf0YdvWwQVGfCCdkKvFbDrx81Zb4regosi8zuQ8V9hN0oZnXhdgVxedI75SWtcAAG0UGVx7wjjJgTZijXuQcHDQnTntHzrf8ntGdYVms8iXxwZYHOWAwvq5fJRuHLZz/1kI/YZaiYnI3TRQYhUfgctspq5ekGT9EumSoSrt4Zpo+0UC1I0IxoHJgLI9KqJQy00QVn4LSroULZRsDadfUnbf7yu+J9is5O1h4lvr5ff99ZMl7Pt8vooK/LEtb7TFpkuHBUbJ7cM6t2OaWKu1eSF1B9COoqoHNiEAHDHuLc9gzC57E7a5ICSKo0XrMUYj1ufiBX8HSleC/xrN125tieNRGQMliZtgHMHmz/z5+2V6QDo93kE3v4NbSTWWLKr8GrXIQZeb6/4HbEG8NhbBXF9u5/+k4mDWSt7fQ/pamIReRkYbQpdKMx3VBEvb3LiIGvvlec2OmAuJjvs2Guhh4Chs3XpFbI0lqoCVlsZJqCJM0K870VQbgmw+yX28P2wEmvp3Q9paelGdj1K27CI5HZBqWGhz8effhIwD+lEYXMtTC8JlmSG3CSA1PXkwM00L0goA8Gx4qLYgFVzO6nIgrFkDhSmkQyU/S3oqiy7eBDn29JQ3a9VHm1MCUnxiGbFmH3dP4zQVc4d9YTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(83380400001)(8676002)(4326008)(5660300002)(38100700002)(478600001)(2616005)(86362001)(6666004)(31686004)(31696002)(53546011)(26005)(2906002)(66476007)(66556008)(186003)(4744005)(316002)(8936002)(16576012)(6486002)(66946007)(956004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2owMVY0bCtINVE3YVcwaXZleWFrb0JFZXhQRXZEUmEyb3ovK0VHa29WbzV3?=
 =?utf-8?B?bmhBTWVCREpUbGkreW5kM3VXMm5HM2pFcDVha3J4ZVl1enhZYm5tVnRkYnFw?=
 =?utf-8?B?RGtMUHlBU1NqaW5WVUcyN2hUZEZJSVNtM08rSE9JV0o0eWdjOEVEdXF4UU1C?=
 =?utf-8?B?YkZEV3lVWnRLN2tCWi9KcjVHa3BNZXBvcDVuak9jeXVGdW9wazJTS1piR1ow?=
 =?utf-8?B?ZmE4V2YvUXlVOVJVRCtrK1dkNnpLWFc3NlpHbmZnYTBkVzR6V3ZDeGVYcTZt?=
 =?utf-8?B?dHVYcUc5NnYrMUhvVDFDbzNTcmF4SDJ4cXdtZGw2WUFFUEoxd3JKcEcxWmJN?=
 =?utf-8?B?VHVTMUIvbGRwdnY3VjdiTWFqSkp5RGd2enNreXV0ejRtTTM5N1BJdG1qUThL?=
 =?utf-8?B?cEZJaFYyZEsrcEVnM00wK0o4UGZUcVJZUlB5eVovbE5lVFhlejAyQ3RJd21Z?=
 =?utf-8?B?R1pvZnY5YXMrV0JrekRMSnF6Y2taK25GWVFJejV2b0wyRFpRR0owaUdzTVlv?=
 =?utf-8?B?SUY2Ymtsa0Z1OTFtZ2x0VXZKV3lsRE9vVDBlU1UyRmdBdzI4QitDWkxiRUx1?=
 =?utf-8?B?NWdMYTJtalorV0JweitJbHZjcHJLZXdKYVRNbUdDa283M3NyRS8zd1BWMGow?=
 =?utf-8?B?WXZXOFlPcW8zMkN5d1NINHpBZGhycnJnMGU2YjlGYWZuVjg3M3VJVUE3ck85?=
 =?utf-8?B?d01KeGxWbnVQUHdidUQ4NW5vQitsYnNqcEdwNkpXU0N4QkRNSW5zQUdwV28z?=
 =?utf-8?B?Rk9zcFFKUmQ0MUk5RHlkVjVTejVzcSs1SmRuV1NzSjQ4UEw3K3FndmNndEVw?=
 =?utf-8?B?YldDQzU1U0hYVXM0VFNBSWRNRVBvMDZZY3ZuazMxRFBDQnlTdjJCMHFmaE82?=
 =?utf-8?B?N2UwQmlHZkI1cWd5N1BPQ2tpQzNIbW5HTDBLWFFKMmgyNmUxQmxIL2Z1S0pE?=
 =?utf-8?B?dEVTVVBSK2V2d3Z0RE51elo5QnNVb3h1aXAwaHVEdjVxNG5xMEtreUFNME5p?=
 =?utf-8?B?NjRyTmxVTThoblhhM05yRjlUTnowVlRnbkZnNGE2dTdBVUNqY1FrZmVQNnJk?=
 =?utf-8?B?ZkdubHlBUmJjNlREMzFuRVE5aTZZWklOaXdpTk9vS3RLa0Y4cFhGbVBSWkNp?=
 =?utf-8?B?WG9kRHYwdEpBbFBTWjZVWmxENFBCbkhhQXlLUVJJeU5lY2hSd05MMmR3eDQw?=
 =?utf-8?B?TzBQVWpDR2U4SzlGcUphNnNYT1ZJTGVkUTh0NGNRY3JjTzdYNkg3NTBNdkUx?=
 =?utf-8?B?Q3dJUklDOWVqTXp2eVNTSnEyRnZkcm9SYTFnR3ZxY2FZSEQvZThGWkJPRld1?=
 =?utf-8?B?SGNyYm1uNXNWZHpScnU4OGMvbGlZUEZ4amU1NE40R2xSVkdYQ3NMYmc4eDF2?=
 =?utf-8?B?OGtHcnF5eGp4WEFPeFZtaUxIbUtIa1FtZXpGYjNMZXY0bVh2UHF1WHJZSXhy?=
 =?utf-8?B?dkhOMm5OMjFwcHE0MjZNTDNpV1hHQ3N5dlI1R2RuMHhmSFJuUUlQUVB1NFhv?=
 =?utf-8?B?L1NDdC8wYlNNc3FxaHNPdGE0MUpPYzNUYjRySEw1bDFyUFZZbXpqWDluV1VC?=
 =?utf-8?B?c0dYQUtORERpSmd4b0R1UU1Hcm52S2llMERFZ2ZrdTV2M25rUHlnck91eXNG?=
 =?utf-8?B?YmJnckFBTW16SlVjQ0l2bkVjWnQ4Ti96cEd0SWpuYjI1cjRmZHBYSWNTTTdJ?=
 =?utf-8?B?WXZkbEdRSWV4UElMblpPNGJqTXB1RlAxb2NoQ1lHRmRma1ZkTll6WDNDRHRM?=
 =?utf-8?Q?4pAEjW6Ef/+ZeWZv8PqSSlfPt1SpQqYP80ii7CM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d813f579-5d16-4994-5b42-08d9458f0d25
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 23:44:55.5016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WmvIDXFVZzDF21zeyO7osWkY2omsbJDnUbx1HBrT+SapahMg4eIY3XV6ENAeF27ZKCC/oqGIrSy7Ssla63cLPnslJ8zhZmJ3Staatx5+UE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5454
X-OriginatorOrg: citrix.com

On 12/07/2021 21:32, Daniel P. Smith wrote:
> To reduce retpolines convert all the pointer function calls of the
> xsm_ops hooks over to the alternative_call infrastructure.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/include/xsm/xsm.h | 195 +++++++++++++++++++++---------------------
>  1 file changed, 99 insertions(+), 96 deletions(-)
>
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index a8805f514b..a39b5dc42f 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -15,6 +15,9 @@
>  #ifndef __XSM_H__
>  #define __XSM_H__
>  
> +#ifdef CONFIG_XSM
> +#include <xen/alternative-call.h>
> +#endif

This guard needs dropping to fix the build on ARM.

Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

