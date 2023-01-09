Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A09A66201C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 09:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473364.733912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEndA-0004FV-OU; Mon, 09 Jan 2023 08:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473364.733912; Mon, 09 Jan 2023 08:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEndA-0004Dj-LN; Mon, 09 Jan 2023 08:35:44 +0000
Received: by outflank-mailman (input) for mailman id 473364;
 Mon, 09 Jan 2023 08:35:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEnd9-0004Dd-RW
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 08:35:43 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2072.outbound.protection.outlook.com [40.107.247.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a5b8adc-8ff8-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 09:35:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7093.eurprd04.prod.outlook.com (2603:10a6:20b:11d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 08:35:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 08:35:41 +0000
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
X-Inumbo-ID: 9a5b8adc-8ff8-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKzkWlUEBDcGqylYuWi/2iZl0ad3xGYBVOo2l62UWVFAiP1jTWP2FRv1b1m+1CcW2EbkdEUflZY/VQf7GizW3UIxD7VKedWUvcJvTwkuR8H7I0ZrauD4Qzpuw4M9Vzmz/U0GczMSKn5t0ikVcvyHQ8AQuUIHLWXbirCY6I8vwCWFNtRGxcYAgQkkZ8cfdAqWE8t/0YksClSFls5cTfY/1CX0RVkm52rgDJ8sErvr6yb5Fl0JtvZQdgx+a3fVAAMPuDPDTD9hAmogevz3FXWE+5zTD7Ih4aCIErdhbtUtXc5kX7ANJw6rrW+JsgHNUmfkSbX+vTx5jlEdANTTjnGI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcNPlZgRTW3qxOdChmYcm+u8tTQMcr/GLd+WO/WmLE4=;
 b=RGvVYL38Gylr4KLhV3ztUWtSPI0J98WiR8IIDP480w1gni/dcTyqxq09XrG+ZkntCv8q39KlcLpjGzHUsxIXgybD3FYg/lU1Fw7XfyMR91E55UTBxjphCMhlPoKDTympWNDapfTiApzA7fuKPeb5afcLRHv4sAABSiFWwTm55RfNHj67ObSCOhBV/EZ8pAlJiNj/bAerpX2XGCxWV0PEBvuy3YeF/rVYS/gRHdHLZwy1oyyUpxrS/MiA0XO50AmyS/Vq1A98lKe7tsdujNDPiMb2KUqbhJ3GcQ2Tq/4owT1rL/CTk+lD8dzh4HWFdJri6tPuAUk5xa/PRrlylpdieA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcNPlZgRTW3qxOdChmYcm+u8tTQMcr/GLd+WO/WmLE4=;
 b=OGdka1zdhgF47qMwR7HmfcvrDipyzkXWtI5/X4bpQOzlIuIR4/P18rksJyi/ZmN3JABVoaEYFWquFxhp6TH5jpRTFgwKN69+X6LgbQWJZnUBwutdis3UfC+wPP7YR1mKVwW3scXQ4m7A/A7xedWkXP8OePSsqRzoxsrrfA9+lPo6M4XM0AnT5ePD/CRbn/e/cOig1r4GOnUSKvSMoznUOyFL4+XJE+TnTiSLA8TIvnbadb8v6t2KOykUzXG3ZWFD2Iw8PDDqcN9Uv6frp7A6fxF2O8hK6iZuXX8vkV8OYmjJm1yGkcvdN68IE7yBJnPGWJ4D6DuC0VwngWVbYCYsag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <694bdf12-ab8f-9896-30b3-3b2d7bc3d892@suse.com>
Date: Mon, 9 Jan 2023 09:35:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/11] x86/shadow: replace sh_reset_l3_up_pointers()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
 <03ae5a1a-4417-0aa0-27d8-833ade20cc0b@suse.com>
 <e8bdffdf-d5ea-4320-3e84-b6654ac83002@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e8bdffdf-d5ea-4320-3e84-b6654ac83002@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e48e0b-6108-4028-1a5a-08daf21c7dca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l5r7Fh+Z2N16tMShuJ6ZY2BZCLnnU64v0LfSa4iHDGg52SOOtTBNIcjQiNJ9r8ITG2svKxDtt7XwA2jdiJVzgeGtkgDeAiDltKLibDgmpl9kjztXx1K7ylln8NZ5YhDIoy02iWu9ennjapLhP6Ff0aeeyylmC+/MlFGjwjjWRXQrDf5ZKDv3NGZ/24JaGG69XakTLzVYjvZP+MBKm5VTr9rfXo0/4gkPUm8gDmF5T54VEfLa00CaHNpO62QLIyKb/zGLDjflo/AUOJJ7LVRQZVFzEcr4uy5k76QBy7xp1Myt1p7qmjklgFwEIivLna4ekvgpTHRtx6x9Klaa1xHXvSRtCpeEl0f071FLWKeZMYrFUUm7FlxQJo8jr3UHFgXBjux02pSlmwA/MWQ/CzWPblaRVJviSSE9vAlJOsQnmm2Otds1Mg2HvN0yFeTXs17mBvp+XwZC7F8TgOCSr0I+Tn6aCUEsGL+nBbXFjdARpBdfPUZdWuk4w1iJ2hNjgh0QrhY3oH1Uz/dLO35lbEIAwHvo5qcMwhJ+qqxG5wMiZ8BB/6e6y136SprHtuSHoRsdbHRm74SApVTQBRYX/2MsI8lxSd/24KBLoDAXF8IzhtSmo1K/k6c8vUv1JepvJce4cwPSK06O497m6Kvkb+x3rQXK7PUaB7fZQHGj3/4qItcSP+LMpNhbCZ2KHXwST0bsjWRMLXb4WKMtxfZ2elRrtEANktlFm4k3T49+wSv03Oc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(376002)(346002)(396003)(39850400004)(451199015)(8936002)(2906002)(5660300002)(41300700001)(66556008)(66476007)(4326008)(6916009)(8676002)(316002)(66946007)(54906003)(186003)(26005)(6512007)(2616005)(38100700002)(31686004)(31696002)(83380400001)(86362001)(36756003)(6506007)(478600001)(6486002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkpEVEJ2N2g1WUlFWHh5Uy9PeThXUnFiRCtrZnI0ZnJpYVhJWDNuS1NCWk0r?=
 =?utf-8?B?MVdtRW14Q09lODBIOTlNVEVrOEtURkhWWXY4NGhNTUR1UjZUSGFSWlpEaVV2?=
 =?utf-8?B?U0RlYjdjQ29JZnJiVkdmblZScElxUGFvK0d2VUx3Rk8wYitmTzhPT2VIUTZ6?=
 =?utf-8?B?VEY5Ty9aZ0RzNVJUQmVVRkZFNDJTYnRHSGxqekI5Z1M2RVJGR3RGTVB0VE9V?=
 =?utf-8?B?OW1YQzRMZ0FTaUhoempWR2NLSUZxYlBRaUp5bmVpWW5STTloeE1kMlo1b3gv?=
 =?utf-8?B?TkFtak1jbEZoS3FsNmQxMEFnbFZ5V3cxL2Fxc0U2NkYvRE5MQlY0aEtKZkNP?=
 =?utf-8?B?bXZPaWxadGlhNkhONmpuSzFpVkM3Z0lrREVtWE01NXc4RmgxNWRUamFHOWhV?=
 =?utf-8?B?dzlCdXd6UW9rTzk4K0x5TDBibDVuT2F1Ym9wQzVZRHFFRjdxUWE3aGpJM0xM?=
 =?utf-8?B?Yk03QjU5NXkvYUFSR0c2Zm1pT0pmRWV4eVVRYmNsQWhiRHI5dVBGcjFkWHNO?=
 =?utf-8?B?aGpBQldKS1RQTy9qV1RvTWZpdjkvRmhQS3Zxb1RkOUd6VVdrRFV3N0hsZ3JF?=
 =?utf-8?B?Lzhhd2lER3RIcG1MTTdqM3V4ZEVoT1RpTTJWWFJiZnRoU1BtOXZKRDhTa1NZ?=
 =?utf-8?B?bVNSTWx4eFd2MnN6NEpTMnhycTlUNS9iWml2bDFqaEZLL1Fydmh5M2hScUR2?=
 =?utf-8?B?cE1VSU04MkhHS1NQZTJGVmhCcXhZRFlSTUZhY09kd1JNNU5JTEROZUxqMXBm?=
 =?utf-8?B?aHpqQjJQOXRKdTQ0bklyWGtKZjNoN040VnpFaURXYjVFWTBZZmhyd2FyUWpI?=
 =?utf-8?B?Q2d5cVB6S0x0Ulc4eGlXajR6cnNnMmdjZlJpaHc2bUF4OTBuN0RjQ2NHbmlS?=
 =?utf-8?B?OGticFRmbUdTalljUVNHN1pOcTgrZ1lhU1ZnM2l0MUF3NVhySG1sTURYTEF5?=
 =?utf-8?B?cFhTQXpWWkdYc0NMNDBxQTQ2QVVwN2JyS1AxZUJzWTZMVnRoblhXNzlyVWZQ?=
 =?utf-8?B?VVljS0FBSmUzSnd5VVVuZ05DVzBvQk5ZdWpmUWFvODlNWGV0Y2ZhcFUxZ2NL?=
 =?utf-8?B?SVB1Z2dvREZhaGtRWmg1NkpEVkxFRzNmbjIvdWJ5SUNKY2JlUTkzbVpwQmVk?=
 =?utf-8?B?Y21tZno0eTEvL0lBdFp2c1dlTnNaTzc1Vndwcy9rdmVwTVVNbUtFMzAvV3V1?=
 =?utf-8?B?Q2FuKzNLVEdNZ1U1ZHh3MDQ0QmpLUU11YlhVT3FpVDNKcG5tQWhhbTZPZ01j?=
 =?utf-8?B?MFNGMnFDMHVDbENOYkJ3dzFzdEk0ZkdUL1FidU80Sm91SFZPL1FzOE12RURC?=
 =?utf-8?B?NEZvcHdtWGNjMCt0WWUrTnQvV0pRaDZFdXM0b1JWTGpxVGJ6SDd2alNTblRV?=
 =?utf-8?B?RnY1cUpMNXJFVUF6d1AzR3hoYWcyR0lFZDAxZzN1c3FKNU11cUhVZlhaT1ZW?=
 =?utf-8?B?ejBiTHkvSkdMOVdBbmF6VEVSeHNOL1kvMURRRE9FNENzUHFNNGdPNklFR1RF?=
 =?utf-8?B?cUdCcUdaQjVseXFaWUtsOThrT3BMODV3NXVMSkJqVk5NNjZldUk4NWFFT21a?=
 =?utf-8?B?RXh4MTY1VUhtcU8vT0FqMmtwY0FhMVpocDY0ZVNETUZJemp5eXNvWUhyUEYr?=
 =?utf-8?B?anFZYlZ4MFJaOWdtTkxsN2lrMGxUeTAxOEY3Nit3cVVXZ3BYUlVhZi9uNzhZ?=
 =?utf-8?B?UjFrZklId1lhVC8yditiNS9RWXN1elRFSVlBa3l0UWNuU0IyaUU1VlVHR3hN?=
 =?utf-8?B?YlR5MnRoTUZkUWxrcGpYUlJRYm5VWnRmWUQxYS9RbjZ2Qlpma3doMHlibmFH?=
 =?utf-8?B?ZWxHa1JNajlNbUlZV0poZFZuS25memd0c2F4VFZGSGZpTFRvWW9RRURwVVZK?=
 =?utf-8?B?K0tyR0NVREdnczJNcngwVVFkWkl4UldzdFpFenZ2blJFeW9GTlgrVWhtWWhW?=
 =?utf-8?B?bmJFczNpNFhSVUNibVFLejVMdnlCZmdoY045YjZGR2c1dk42dDBWRXlTcVRN?=
 =?utf-8?B?RkxjMUdVWkwvaVZTTEJONmhUZjJmMldyRGVnVkVLT1M5UXl3R1J3MFIvai9B?=
 =?utf-8?B?SkNucmRYK0Jmc1JhTTdadGlEVjBkWEx3cHkwbm9nRUJIY0EycXhLNEw1Y3Rn?=
 =?utf-8?Q?pw3VqbaMl36YV85u8t2WtKIoa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e48e0b-6108-4028-1a5a-08daf21c7dca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 08:35:41.0999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yV4JwE7l3dsEB8w6YWaHS5iquKftg+WFLYxvsv3hRKE+Hpt6YKKWQxAzx4o4cjVLhOePV/ecbj/2TKlecIwJ2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7093

On 06.01.2023 01:55, Andrew Cooper wrote:
> On 05/01/2023 3:59 pm, Jan Beulich wrote:
>> Rather than doing a separate hash walk (and then even using the vCPU
>> variant, which is to go away), do the up-pointer-clearing right in
>> sh_unpin(), as an alternative to the (now further limited) enlisting on
>> a "free floating" list fragment. This utilizes the fact that such list
>> fragments are traversed only for multi-page shadows (in shadow_free()).
>> Furthermore sh_terminate_list() is a safe guard only anyway, which isn't
>> in use in the common case (it actually does anything only for BIGMEM
>> configurations).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> I think.  The reasoning seems plausible, but it would probably benefit
> from someone else double checking.

Okay, I'll wait some to see whether Tim or George may voice a view. Perhaps
until the end of this week, committing early next week if no contrary
indications appear. The "good" thing here is that all modern 64-bit guests
undergo this transition aiui, so the code is / will be properly exercised.

Jan

