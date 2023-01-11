Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED2665E3C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 15:45:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475482.737224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcLq-0004uo-HS; Wed, 11 Jan 2023 14:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475482.737224; Wed, 11 Jan 2023 14:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcLq-0004se-E8; Wed, 11 Jan 2023 14:45:14 +0000
Received: by outflank-mailman (input) for mailman id 475482;
 Wed, 11 Jan 2023 14:45:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFcGC-0001NK-ST
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 14:39:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd320209-91bd-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 15:39:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9449.eurprd04.prod.outlook.com (2603:10a6:10:36a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 11 Jan
 2023 14:39:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 14:39:20 +0000
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
X-Inumbo-ID: bd320209-91bd-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCsAl/kMOXrBQ+C84FPAsm2zEivtdtQMLY9fJE+RdP020q3F3RNI1mpJMumi1UhYOarGF+BskxCJ0WwI3d8ViT0R2/hr6x6zI7+SIr8/ytWWRquozs8Y8f90PJmuTp2QBEqVYSrn/OSuO9kKCsBDTK2cgs1yO+RwqzC7//9I3cHUOcxLQyl8d0vdAgOhe8Qm6lFdaZJ16E2ixK6YfeccAwszvzzm5kQcPMg2sjyiKcxfhR3BSKEykUYOz1EpICxGYb7xyK35/Kn7gYQOxQ7FFDKk0T+kC/+ezbBooXyAS6BJTPCtLx+F73TKcES+PDwev3udnU/JM9toIBvOQ6lURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLFn4NbS1Lo3PpETX2gDmRJejP1llNLWgrYgaeEIQ5M=;
 b=WUTbBFt8P5H/Uk2jllIuUm7SKercGaVFmCX42k9Qaf7ZjPqAog13T8ffd8BGT7F9O/g/4DT7aGIP5xODxNb0umX4Vkinl2p+TddTmiQJVWSztb++RVitPmzqOmiwXDAYdp199PUrLOYYixLD3reuzLAnce5/Y6pnQUMvKlHwLdy/jEuuN2hr3vHbvKwIIxEtVFawPxvZSTLanVbQIfwicZf9I2WN1lmVYco7KO460rOLXh7sqPwnCGKHFz39HsIkLIj7jksjxEc3CQVybDV3d6ULruAmLW7R1AJk9wI4+kJTNO+jaiPGwazib5MPTPPTbNuruHeL9BkBbhgTDlLAvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLFn4NbS1Lo3PpETX2gDmRJejP1llNLWgrYgaeEIQ5M=;
 b=dv3QEB3m+WD2w+2OpuLm1cAHtvL3P2NDDjvo/VAmrGMHN+5UIZGiaDX4KTIHAnxZuXukDG4VdwPbvwoxywVU00Qs4tkySsfGVE7GVJXetSzKDLN5dHC/V6KcQrU+zCysCBjHsXnZgggcNn1hYnTEJyGzSoGbFr8IRG+b2ymLVgOwSay1m5fkjvkwt64yfepx8GgYidX/e6jyaQaxgXJ4hfIOBqwPwiG7xHFjHnCxZud8SFfKtpZ9cNFlZbRdH4PRT0HBsb/RFpHh+Mf3zx6+ELUzZWsszZxBmJHLDYZQ44RC85y5qbi2Gn0HDuIPAeGXjKoSB2FFy9uTkdFlNxDzfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71e7227c-347e-6439-f3ab-827f2e646c24@suse.com>
Date: Wed, 11 Jan 2023 15:39:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 17/22] x86/setup: vmap heap nodes when they are outside
 the direct map
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-18-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-18-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 112d85e4-31b6-4433-edc0-08daf3e1a025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ti0cH0TOFMH7ABtn8KXml3Oh/XMP5JhK2g0NNXptnYjlkBBnvunSdHkB1HPy3eaPh8hmvxek3hZuCGrx1NAZnt2WR9OiQ3D0Gc6cZWi2ZZEs+XXj7HeNfSTHomFqENw+/dBPuPjh3E67YT/PFFe6bMFaVfKYzqaStzVi7AOSrXGXQN7F/RvDXteVl+8DAXgpeyGDWEFflq8UX2pAe8EfHRuQm5SHrBFsD5vEcmD1s5KKu8z8VaOptE9ezKMs4d14pKisX+hdxifeFf8yzs2nIlLZ/3WMmG7pUTnyEKTWlCZirihVqqOtuZjSwacrw2DMF6KV2vyHBppbRmNEl/pEfbWOs4suc3PNCtUcxKaNSdwg68DVEUEcjwcoASNd5KjpIoQcsZzY8Id3tJHKUwSkSRanKvrcV7tulAnJZV70vD2EI9xEcO1SVlRn2YO6gEetjSJOADwtBj/+vm3BtaksF9LcHaMBR1IcWj4hlAq+TbLmgLqNDmobhLb5FJm9KIodFK/wb5ipFkGTe1QCtP8Se3m5V9Q6e62AaeE32/hNsxisvo7fKMVQsJGtkwWeolgv8BzYBshLB/motfo+2IMKdgbYJ/2ojkz6OwSqgU5V55xniXeILBYMBFAFdDZzuar3RDL1GS3xWwflcHe0k9f7EUvl9h/B5ipcDl+xrzgUx3IjbYKTIOqfBE0C15PHRi9upvG426DEIGRbFGvf4eX/vX2ZGrPOkS+10vdIIxxZlyM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199015)(6506007)(2906002)(36756003)(8676002)(4326008)(6916009)(5660300002)(53546011)(8936002)(31686004)(38100700002)(6512007)(41300700001)(478600001)(6486002)(26005)(66476007)(66946007)(66556008)(186003)(86362001)(31696002)(2616005)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlV6VGcwL0t2dVVpN2JCY01iZFZpTk8xZmprN3ZTQ1c3M1oyMjhZS2wyWGdB?=
 =?utf-8?B?YnVjYmR0Q0E4UjcwNnp6RG5SQ0pFeGJBUXNpYzNOQzhEVHdLUEhRcW1aUGti?=
 =?utf-8?B?V1NKNVJOalBVbVZ0UFdQZytWNmR1eGdCLzNma3BZamYyNHNISTV2WUkvTjNh?=
 =?utf-8?B?TE1xbmxRWTRONXB6NHBrTzJvOVIwMmRNc3lKd2xpN3pUSUVTcExqMEZqR1o3?=
 =?utf-8?B?S2xWRHh6ejZGSGhWRzhVMnppdmRrRnNQNkNvRFp1K2h2K21wQXVnUnBUMEFi?=
 =?utf-8?B?bnpJUW1DMExVYm1nWWFYUUFYMTRBYjNqMWQrM2J2QmRaME8wLzBjRnhwWXJ6?=
 =?utf-8?B?MXplQ2o0dXQ2b3JrUW94WWtUSkNlZ0pSMUVnak1qTGc1QUdlWnJ0cTk0THBZ?=
 =?utf-8?B?TzBzK3AvMGp6aUtNcDRNOENrSmRBM1l5djZzUXB3ZjUzZWlXNUNJN2dTQ3pN?=
 =?utf-8?B?cXJJYnZvbE9ONEphVktNa3E5RVVEZnJpeUN1QnR6aXVGQ3ZzZDYrV3lrRTJU?=
 =?utf-8?B?cHpodUd6VCtHV0xHM242Vzd5WHA0K1JVQW5YWmxtbXJ3MHpIdzdUUC9TaWFC?=
 =?utf-8?B?TWZncENuMVo2WTNvbWlYYUw3b2gralh3TEVjS1l3dEI5R2JiWE8yODNZdS9V?=
 =?utf-8?B?RnN4bFNUQnJuTVAzQUtIdU9mZUhCR3BGd1doaDhjc21rTUR1a2h5S3VOakJD?=
 =?utf-8?B?c0NaaWNMOXFuakNsZnIvWjJhYWk1S3NrcU92bWYyUjVhWlBzMEt1NGNWcFFn?=
 =?utf-8?B?a2poUFZIWkJoZGZPVVJ6MTl5b0U0ZUgvMzZJNGlzNGIwWkZOZHpNM3BwTVRB?=
 =?utf-8?B?Tzd1SWxiR2lYeFMxN3ptRDB2YUwwT3lPMGlPcXdWS2Z0WGZ0ZzRSamJrUXlw?=
 =?utf-8?B?aGJ4NUJETGpVZjdLa2RpWUZnaGx2cExFZE1DMlk5WW1Ea0ZsSnhHS1VQenF3?=
 =?utf-8?B?a0pybU0yVEpRTENPSjAyb05VUHVZYkF2L1lnbGUyY0kwdlBGTWZ2Q21WRmtX?=
 =?utf-8?B?T3pha2Jmay9UNkFFV2RYUmpPSWZQTTF4eS9LdE9FQ2RmM3dZbXkwT3BidUp2?=
 =?utf-8?B?WjYyT1MrdXpFQUlncC9nVWRpNkwrb3FkZTlUVGduaWZseVp0TW8yUHdudkEr?=
 =?utf-8?B?a05qZlY5UlVmdnBISWE2WVVkL1U0TURJNlRLWWZLa0llbjhSVG9rNGRSY3JB?=
 =?utf-8?B?aUI3b1MveG1xeUlkUnpFVEh3T0ZEZVJCa2ZDSHZKUmpRQ3ZVTmVWYk9obm1H?=
 =?utf-8?B?OCtSNUxmZ0xuTDZHZ0lKSU9xWWZNNHdjL1pVTTlrdTZhY1RhVHFJZDEyaEJn?=
 =?utf-8?B?bUxOZ3FNNmpyZ0QzL01GOC9ZTlE1YWJZd2NFVFZDVnZqZkZTSTZRVVNnN0Z5?=
 =?utf-8?B?MTBJL2QzRmM5dlZZemc5SkNPR2VRbUlWOUo1M3ZxcG9vODVIL04vSVY1bjVH?=
 =?utf-8?B?bTRaSEFueEZIMEgvd0podWlIL2lOU014alJyRGxzZXpZRUt0ejlheUd2S1U0?=
 =?utf-8?B?WlNSMENyakRDMy9KdlVRTjhzNkR1RHZSWFJMcVNramEreEkvd3hwWFNvVGpW?=
 =?utf-8?B?Z0lQM3IyVXhWT3p4ZExZRHFuTXZ2QXpXL0VYWkRScWVXVjZ3a2Rqam1GSHlt?=
 =?utf-8?B?a2xvZEVQa0hNSjhsVUk2VXJkeDVBeE5DNytsQ1ZpaXkxb2ovemZBOG8vUmlr?=
 =?utf-8?B?NE9uMzRKNWJHMTBQY25NTTVWdzVGcEZFYU9tbWJYVWd1cWl6b2xMVFZKeWN2?=
 =?utf-8?B?S25pZnp3c3J3SWlkczB3dUc2TVR5QUdnK3NBeEVOYTZjZkNUNmhRdHYxWkdh?=
 =?utf-8?B?NTJxY0dSMnhYdkpQNnpUbUcwRUNUTVlvSjFma1B3TlNQcjcza2o0eU90aHcv?=
 =?utf-8?B?YTBTOU84M2dlc2pTUE93NHM4ZDliTXZYQXg2YXRXcDlLWUUxN1hiVVJXcGly?=
 =?utf-8?B?djZ5V0tINkNmRFpCRC9ZOFlEb2hEVmptaXo1aWduaktOdUR4YkkreEhWYjBU?=
 =?utf-8?B?enRCeHZueUFlL2NvenpZaDZpc1Y3alRWQ1VDMmRpTEVMN290Y2NrSjFmT05G?=
 =?utf-8?B?cG14SFlQU3AyR2FFYjVBTUlYZWcrZzIzME1neTBleWl0dU14VXI5N2tOUHNo?=
 =?utf-8?Q?VWRhZb9jCfnEPGhcpGANQjYmJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112d85e4-31b6-4433-edc0-08daf3e1a025
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 14:39:20.7784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3HvLfoDTDVvw1B32Mq/g9KLiQwFyAjBihDDFMNg0KJ8HDYs2ynghS0fxJbsM6sv70y7KAkYOEBEzYyhLCqlUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9449

On 16.12.2022 12:48, Julien Grall wrote:
> @@ -597,22 +598,43 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
>          needed = 0;
>      }
>      else if ( *use_tail && nr >= needed &&
> -              arch_mfns_in_directmap(mfn + nr - needed, needed) &&
>                (!xenheap_bits ||
>                 !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>      {
> -        _heap[node] = mfn_to_virt(mfn + nr - needed);
> -        avail[node] = mfn_to_virt(mfn + nr - 1) +
> -                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> -    }
> -    else if ( nr >= needed &&

By replacing these two well-formed lines with ...

> -              arch_mfns_in_directmap(mfn, needed) &&
> +        if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
> +        {
> +            _heap[node] = mfn_to_virt(mfn + nr - needed);
> +            avail[node] = mfn_to_virt(mfn + nr - 1) +
> +                          PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> +        }
> +        else
> +        {
> +            mfn_t needed_start = _mfn(mfn + nr - needed);
> +
> +            _heap[node] = vmap_contig_pages(needed_start, needed);
> +            BUG_ON(!_heap[node]);
> +            avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
> +                          sizeof(**avail) * NR_ZONES;
> +        }
> +    } else if ( nr >= needed &&

... this, you're not only violating style here, but you also ...

>                (!xenheap_bits ||
>                 !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )

... break indentation for these two lines.

Jan

