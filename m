Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0D6D4474
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 14:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517422.802705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJMB-0003Iy-El; Mon, 03 Apr 2023 12:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517422.802705; Mon, 03 Apr 2023 12:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJMB-0003Fq-BW; Mon, 03 Apr 2023 12:32:19 +0000
Received: by outflank-mailman (input) for mailman id 517422;
 Mon, 03 Apr 2023 12:32:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjJM9-0003Fk-IY
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 12:32:17 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90bfa3f6-d21b-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 14:32:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8241.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Mon, 3 Apr
 2023 12:32:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 12:32:14 +0000
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
X-Inumbo-ID: 90bfa3f6-d21b-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhK0du4NTETNhaiN/TwaYdavWbFHxsw9tKVF8toKz/I8u9V/YiUhhvjmm3oQHlj+Sz3XsLhQ1ZCZ7MhiftzotZ3ueRwHkakoUpwjL+aNTtekj0p9MtLjNFrLLHqV4XQuMDiZ1Ee3NGU9SqhlL4r9AgOIeMUtiwqG13kTEiYcBQVwbJjT3/r1MqPLB9DYpHNl4fL9ipOVXkdWo+SCKIXaNT0DZAnpsUtVZ2SiUdxEJ335oiYjjKnCGL1onXiQjij2xjec0uVaT6HJn24S8FYa3DeiIeQqbSqZaUMY7PO0z7kyzXClJNYDKfcmJc3R+47Ka1y8qnftSfOgL8u8fxAi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T85vDg5TUrhPHf2JrkJQCK2w9XzTQ/j04O5QemxmJV8=;
 b=C7xnCkHfZJJ96+a26QG3zWITD/wL8KM9sGutj7YrjnGDNmj3L2RhI0gwr/j9vwZFZxQ2ybTR18wyexJusYMDsjbYdO6v41Z621bnxAjn93R3ubnPtxCJPtoxIl7NlHfdmF+feXnl3oQCLz42dzBJgA7u1EX+oKHMOVnAZ4vKktOkX2WAZGsa1yJxuE6w8MmUdU5fi12v2+h3ryF7J0oSVmP5EY2wGo7hQz1TSHgpToEFPcUdZmx0vzvRgA+j2Z/46E3kCeem2vHg8qf9fs/3oZ81k8dELu/rW18mUaU1ufgD/y3uFQjrvOg5FwjnbX8t3ICK3n6wgMnZiJzNB5QzPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T85vDg5TUrhPHf2JrkJQCK2w9XzTQ/j04O5QemxmJV8=;
 b=zWPNfIBFs5t1L8n19gz5XapdI1mIOaVCGyuBqh1fVofD+8k8pogW1O6SSWobBjBRpst4xClYOfmo5pcl6ThbmH4ng0b0CBraONZP4ssbbsmlscxJTSfwhLLekosGcQ+OmTux2qpTGIfdgJnzdde8hw9VJ0tHjVwRKjRpxSaMLHXUrJruVAWhkPK+x62H/i+PmAFf4uQGTOX8Q0A/DpKe61pR/drwwTdyIRTFdKhSrU9KaI8Cm4eeqKdtC5In49jWfAHAt9e1jq5F1xP7KAQxq2gzDrnOSVlpsPBkFxAKEvrS3xT6AzF7kE08vsWcQkDzlXk9uuAtSFTCXqhf/cyTQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <efe42c36-8f5a-8600-dcc7-fc1dc8980775@suse.com>
Date: Mon, 3 Apr 2023 14:32:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/emul: Fix test harness build with blk.c moved out of
 x86_emulate.c
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230403122535.724250-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230403122535.724250-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 729229be-f0d1-4914-e799-08db343f742c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7dOPxVcOMXHPaO4ZObhVfOLrJT9V5rehAiwRJCyd0y5TbCtnz0MSLGE/rW2ymvl99oAGBESsKxb/k4h3yvpULMIgzzFxJ1jFhZsiHuUYOOdYAc7Se97rzSZyiUJXvPxOzW3CptCwDlAMnPPR3+Fvh2U/laIh5UpmDk6CsoWp2OxXnZzXuAJutw2hm+bW1ndjjLJgDIyv3K97WOuSx3o6fLJV/+mIsb1kK3z+VheKxKBH0Wl0fy9t80i+J4fj0T7MYPYIhkAC+TkHg3/aOMQC+V6Ma2Fibty/3kaFQjiVagyieswq6qmUuoWdqYgFjW3BSbrQsbyqTkxfIyOvpmsKPtmmCp4Hzo5EuCWOy5rF1eWW0v04jRIiz2SDme107TM68zfY8mRhdYL9OjnVz4f5eqKyI8PMh0mKKDS2VrO4sz94e9sSNFDbKqpO2ZJ2BEp725+6qek4m0UhqyTppz2uQ+LEnvRdrEQLhqYExUC2/SmOHyUzvB4osRUHyFgkH5QqUMZqm3cj/mRDHF7x9LAb2/3Tt6bZw3PRK6+UNQvBUk9vBAqY3CbCDE91ESBseTHK6GdaHCKprLTlLRgJcdAn96U1VsNkdV/AEPPZoK+HhFM4rE+i7QlcgvhpPgWMD03Ub/jHlT52wIXz0GGePVV+qA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(31686004)(6486002)(26005)(8676002)(66476007)(6916009)(66946007)(54906003)(4326008)(66556008)(6512007)(316002)(36756003)(53546011)(6506007)(6666004)(38100700002)(2616005)(186003)(2906002)(8936002)(5660300002)(478600001)(41300700001)(31696002)(86362001)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U09nVFI1bEJNRzhaTDlWV1lzYmdRWUgzcFdDYStoOGVpNzhaTWsySTcrVGZR?=
 =?utf-8?B?V3dGRHl2MEZyNGxDNStTbTd1OStINkpPNTk3dlNmOFpSa0ZPQ2JNOVZlS3hl?=
 =?utf-8?B?TkpPRlBjRUJZZ3ZaS2lZdmNSUk9JU1I4VEs2a2RoUlAwTmk1WUtiVHU4RmZJ?=
 =?utf-8?B?SXpRRTl5d0lLQ1VWNkg1bmQxVVRPeXJ2SUw0dkdSOGY5RzVaSzFRKzZuQjhC?=
 =?utf-8?B?cTlFaUNiYWlrN0RTTW0wRFIxMWM3UkRIaWdmVzErUU5DS2ZCUTVLamM5bTZs?=
 =?utf-8?B?SlRINmxwNGNHeVYvZ1JLdXNCOFErNCtnc3Ztb3FpUytNeHE5dEY1ZE9LZGJD?=
 =?utf-8?B?bEltcHFObFRhUWxhQmR4K3ZVV1RpcVpEMHo4Y0hhQUlXcU5MSm9vTjNFNGZM?=
 =?utf-8?B?TS9YQ0RMZWhCZktjVk1rWjMzN05iZzJTWXNsc0dLNjZDbDFtZ05FYytQZjk1?=
 =?utf-8?B?NnhlTm5QSjdYWTBaUHdhbWE3akdVbFlkVzJMTFkwSmZRcUs3QUVMT2tOQWZH?=
 =?utf-8?B?citmdVFvZi9iNGtXMHhSc3R5SFJ4bUtzSTFRbEJuSWhFdk9jRWJOZkNUejR6?=
 =?utf-8?B?SE5EekcwSnV6ODFTMVc5QU5vQVRSaUVDVlFZOFM3RUwwNElwQ2RyUkhhYlVp?=
 =?utf-8?B?c1J3cVNmWVhVNTh5RnRWUmlhaXhUdXZsK095N2kzSUNzTW5vVEo5cy9YZE43?=
 =?utf-8?B?T1lwRUtxS2tpTGlneXRibVRDR3g5ZFJrRFhjc1h3YXJ0U3NTN3R5aDhpTktN?=
 =?utf-8?B?TWN1U3FSTmhNTTVQVGNHMy9OVVQzZExhVGZNMjg3ajg3ZmV6TGdHSE5hL3Nj?=
 =?utf-8?B?RHlMQncwNW9GOGVSVWJOY3kyZmFobVcxSzd6RGkzVnpKQkFiTkYzS3RTZlRv?=
 =?utf-8?B?dVBybmI5UkV5YTZEelQ4cG82WDZXYnlyL1Q4d3V2dGxOSjZEcG5tQ0lkUjlp?=
 =?utf-8?B?ZnVXbXh5ZGVoWW1ZUmY1eExYbTYwbG1qWUhKMFlLSDFpek9NMHM4dkdUN3Jw?=
 =?utf-8?B?cTFQeWRkRnFhV29zbUVVUWIwUHo5M0s2R2FXZWQxVUFabHRIUEZyR2krb05q?=
 =?utf-8?B?VnAweDU4L0dxVGNhMFR6UktqSDFEMGl5Qm5qZjJPZHc3QjlhVDBYK1JYZktF?=
 =?utf-8?B?M3pDZlpYM1krYU52UUJhcUM1YTB4MEs2SnZSVkJPVlkwU2R3THBFMlNqZmRs?=
 =?utf-8?B?eHdLbS9jQVV2UW5VZWllOFhkWDUxUnMrWjFKczJrTEdxOVZ1V01IYUx0K2NC?=
 =?utf-8?B?SllVaTJkVGNQTXQ0SXhETmhGY0krSkNLWnc4SjlsQmVOMS9PcFNpZi9oRmNM?=
 =?utf-8?B?cTh2UVdac3RVS01vd0R1dWFIQTA3VHJZU1pVNFpmZ0MyUFgrSEJob1E1RExh?=
 =?utf-8?B?TnJ5WWZYNitDTzRud3JLTkp5VWVnMFJtQ3dQdFVnblBLUDNaODlFVUJqYVRo?=
 =?utf-8?B?bEV5QzZ4UnVvNDBkbjE1aURlVXZ2c2pCNzI0STB5VW1JQTc2ZHdhTVBlRnhs?=
 =?utf-8?B?VXowTEN3c0xKSHphcmF3b2JTT2RrVFJVV1JpSVduZW43TUtMKzV6SEVKZHFO?=
 =?utf-8?B?cklpbjNzWlMxZ1NmNWoxRURGOG9SQXZPaGx6aVJJakttaDlqM2s1S2RteXNn?=
 =?utf-8?B?QXMxSXE3SVQvODh1L1R3NG91MW5XWENLWEsybitsU3FHcmJQMG84b1lCVFZH?=
 =?utf-8?B?YkM5YkN6VDh5ZkU0dlRCMkRFS3hPRk41ZXFNUW5mZmpndzl1SE9nRGZIMkVm?=
 =?utf-8?B?Q2ZzNW1HY1BMSldtRnRnaTRlV2oyNFNNQVlLVzdBcTlZNXAxVzQxcVRMOU9I?=
 =?utf-8?B?UFQwRGlMS1kyV2JVTkJSeGt3UFdmNytCUVBOQkhNeU5mOFdiZE8raHkzVUs2?=
 =?utf-8?B?S3lRQzFCZDhpbzAyWFZua0VXNHIvNXp3S2hneFpRaDVRMWplNnpDTndGL21x?=
 =?utf-8?B?Uncxcm95eTVRZGMzWDZ0dmN6cUJIN3FPSTYwY2lOMjVzbU1ERnBoeTVSOHJL?=
 =?utf-8?B?am9JZFdZb0xHWGRwUlVwWTNSOFZHeFNIZmF5dWU5bjhpZlJRbFh5UFRYTUJ3?=
 =?utf-8?B?OHUxN0xGa000K1lpa1kvdkZsRy9IZTV5ODUydDhEYm5ZbUloVk9mU0VJWFNB?=
 =?utf-8?Q?rMKUwt/g4YdiISEPWO+Hf9JlE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729229be-f0d1-4914-e799-08db343f742c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 12:32:14.0724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PILZt4P8qTgiY8fRyso//prdafEPV17MYrqV3dRrBnRGd7uadUsSEFqsjLHWU1iDWieB6IVhfdK0aBMuq07Vzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8241

On 03.04.2023 14:25, Andrew Cooper wrote:
> Trying to build the test harness fails with:
> 
>   x86_emulate/blk.c: In function 'x86_emul_blk':
>   x86_emulate/blk.c:74:15: error: expected ':' or ')' before 'ASM_FLAG_OUT'
>      74 |               ASM_FLAG_OUT(, "; setz %[zf]")
>         |               ^~~~~~~~~~~~
> 
> This is because ASM_FLAG_OUT() is still local to x86_emulate.c.  Move it into
> x86-emulate.h instead so it ends up in all files including private.h.  The
> main Xen build gets this macro from compiler.h.
> 
> Fixes: c80243f94386 ("x86emul: move x86_emul_blk() to separate source file")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Locally I actually have this exact same change, but in the MCOMMIT patch
(which predates the splitting work by quite a bit).

Jan

