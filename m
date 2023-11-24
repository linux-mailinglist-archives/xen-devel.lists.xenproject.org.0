Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9034A7F6E6B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640233.998195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rig-0007Pq-Ve; Fri, 24 Nov 2023 08:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640233.998195; Fri, 24 Nov 2023 08:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rig-0007NN-SG; Fri, 24 Nov 2023 08:39:26 +0000
Received: by outflank-mailman (input) for mailman id 640233;
 Fri, 24 Nov 2023 08:39:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Rie-0006hT-J4
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:39:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f788340e-8aa4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 09:39:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8326.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 08:39:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:39:20 +0000
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
X-Inumbo-ID: f788340e-8aa4-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5YSit9iUYcDbeG2RNyi/5Dpokd8C7IECTBKWJJBp4+PKUURwIEz9R4TPgzsl5yUqv3vl1g1v+oA9A+2ynDm9JNFtzGDOndQohxEvN5exAlpuq+5LzuRvyso7ejWeG5/944MHh+zodIofAJ9U0MJq2DiE+IQ2HNKt0a8qkhalvi9YQWyKpn+vbboviuKso6Rc7sBGBsWM/6ivNRuApTofi1rNc/aGfKoNKrt6RRQoYJNnHPpmYfVY+VxdzDdPtgYIXuGIasTll5Az4sexm1dyATIHXqogFCqN7Gvv9zKEF4kG2nGCBte5Prthu2uBbzxR5Vvn+ZfqR2zFRx762+QYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk4G/GJfzS49frg+rcG+l0gtehLpkSIGFkMrZcweWR8=;
 b=T1psXOXk2EJlkRdTgCAD/tAzNksw8lkThI4KXylsKK08zvqB4yPCtds4LHs3g5ok7folb810UwET5f4TAblJAsfnzbam0WB4pdByd6d5A2aKCG30iJ4d3ZidD7JZdqoS3UMnUQkXQlOMPAY6PRs6TbAqfKOqUxhEMmbCYDJoGI29NWUUeNvqkjc6Jd+HilF3J27aYkZHFlooI9sTjoM5xKnWeDzAr1EVfQJXuNmcNpIaKipVBaYYXb7LvkolMaCRfKWsofoNfhibuVikowj3IXdpLxtjsk848Ok7p6UcjiVhqmn3Br9DDcxeumpZSOqIYgEcmsC4Ar0G0RWWt6Bw9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lk4G/GJfzS49frg+rcG+l0gtehLpkSIGFkMrZcweWR8=;
 b=i4W3Ph32tFpdqw91bKFiERkj/Iga084exAWcPGiXbdNWuExdfd+v4EGo1yOfVT6c4rzvd6TxMRj585s3y0jJXC9xFUduHGONab28GgErR6yOSM7Ufz6fKhaVL5Arw+/PD9M9hlAZeLbvTiOretStmMlHPNPoDJDzoXUsUHewMcwIpggj8Jr4DYbyA7Ijpx8ZDCa/Q4d1vlKSMPV5+tnDrPv/PgD7kYard1sVkuYKGVs5T44caLs9Z1Fy36+j/jBGKoL91myF9QXSiLKlrd0nRGgx7j1zNFSHWc/3bMrbOVhQFmDejmv1HAcO9jvnei68c9D8Mv4xj71pH+txnrYEKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8112f1f9-3e3a-4839-9124-9adb87f82c29@suse.com>
Date: Fri, 24 Nov 2023 09:39:19 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 06/15] x86/HVM: improve CET-IBT pruning of ENDBR
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 9925fe6a-9bfa-48aa-d25b-08dbecc8da24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DRohmgedkpukofN0yN3ZAZDkJ0MAi7e7QJ8+9uwWTgIZhzFJTfUWj+j/8Lb0feopxXq2rOJAJ6s1S/CrBVS+HzX54r9hd4opVjiB+GTHyow4LPv+E3PKWOyHfQSbXTUFtjhCh/3P6U5Oyo3OcVCWSqfmF3fD8NarIskUBHxfh1HShSbhfeT93/aZOpiyMZKmXwHe8JEXKET/L5xgQ5YbbXUTdRoScILTFBHuvD60xYXF62RAdaxyXCD3amhPJDXj7aRp4igGEgoq3eOtVOIAox1oq46YRk6r49Hsg8RxlRzrrRCGwHtqqVAOxeDRBiowUHCPgRYf2BAFVlrxhh4KxWWNwzovxZqe0SJ3r89gh5d4Yu3TzTfA6Y9xTbokBhXgbrQPR2d8QHx0swa73Z+8SHOs5hrVdAt/PHMgHQY0G29zD32cgbBjoDBwDNHrwnf5oiooE3qVsHtWD2wThoAE4/1PLQGmZL45gfn3yo2DaGjtH45DLRuR3xrXsK0qkDR+zHMxurCnrTRKC4D2MKP0M2xOZa8ZEe7fpJ4Htye+7wjrc29pBV15tALYlP+RiZhzqIOOKr6vaN7pTnPG9MibNZLxWuaAMwHH5bI06xkzhlt75x3XXoIsy7GqQSNdb3WMH7UrRTI9WZi1mugoJNVbx1bK0CtEj3RyzVMZBu81XVs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(26005)(66946007)(6916009)(66476007)(66556008)(54906003)(38100700002)(36756003)(31696002)(86362001)(6486002)(83380400001)(2616005)(6512007)(6506007)(478600001)(4326008)(2906002)(316002)(8676002)(8936002)(5660300002)(41300700001)(87944015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEd4Ry9lZEUraW55MWpkbUlTbFdDak5PN2JyZmMweW5aWi81bkdjdm1ucmpK?=
 =?utf-8?B?Y0NGcWQ0Vzc1WkVBcThoL1VoZ1FGZlA5Uk1zWTBsWTRZRVFsZ2h5Rk9MNmVX?=
 =?utf-8?B?WXp5U1p5KzhlSDZiWWU5bUtxckdORXR5d21CTitpNHdPUW1oa3ZrNWxRMG5H?=
 =?utf-8?B?NGN1UWp5aDc0a1NheUh5OGF2Skc3S2NtOUR4cHF6cFJOVUhQVkJ6VFJGb2Jz?=
 =?utf-8?B?K3pxY3QrQUxGVitZYmF0ZmMzaDg2bHlMMTZxakkyZDJlYXB5N0Zma3d0cmpL?=
 =?utf-8?B?L0VkTVVCVjRnYWJUZjhId1l4MlhCdWg3Sk41T0Y0VkIwYjkwSnkzSnNNSlFr?=
 =?utf-8?B?SDFSY2Rtbm5tZ1VPdnpSK01pSElpeGVDTHdub0xtZ1RXelgyZnhHcitLaXJz?=
 =?utf-8?B?Wmh5djlvWXRUVGFTelNVMERSUm04TnRCcHFwdGlzZ2FKVnk1eDZ2SnE4OVhm?=
 =?utf-8?B?T0k5dTI4UkpuS0crMFFXeWZqYnV1YWVJa29VdHJhY3IwNWlBb0c2NkhBTS9a?=
 =?utf-8?B?REtzL0xxUVUwYnEzRTE1dUpoVWVDU3JoRWI4NWRPU01XSnd3YXM5Q2lPQ0Q1?=
 =?utf-8?B?bzM4WGE4TjdJMFlVNVdwcGpQNzlta3dqcVdWUW51cWpBdVRHaGYzNkJDSGNX?=
 =?utf-8?B?WUlsaENaVUpYRU9YS29GdWtkME1sV2p3SVc4SjdwK1NWeEpjQ0J5aHo0Sk51?=
 =?utf-8?B?ZTh0bmJhcHI2bkx1dFpZS2F0ZDZrYlByaWlCLzJSeThrOVJsdDMvWDFrUWxu?=
 =?utf-8?B?b0NOR1I5RitHbXlReDFHMEVWc2pGbXZvMnN3bG9aQ0V6UUhvaXBkNHN4WFRp?=
 =?utf-8?B?b1F0eWlNWHNZY2d4ZVFjZGFJMi9kRk15bExMaVMvZFZCZ1JZTW42Yy9STHgy?=
 =?utf-8?B?TnFOOHBaTlpxeUJEZjFkNE4wVkVOMXAvSUVhVTZTVmFmNnNQeHhySkFMVW84?=
 =?utf-8?B?N2Zwc0E4NU02bDMxdGVockNoQU5IM25PcWNvd1ZaZG81bU9CRmYvQkVGdUNk?=
 =?utf-8?B?aHNUanJ3Wmt1V1EyeEEwUWR2dGMrdE5XVk9ITExOWmxtV005ZklZUTcwUkVI?=
 =?utf-8?B?Nk9OUnVKK1I3SHhSS09mTjE5emlCT1FtUE1tUGhmS2lZSW1nd3NQVkphRWQr?=
 =?utf-8?B?UWRSOHpHNUNtNGF0Q3pjaGlMYkMyUGlvRVFOZ2hiSFJESWljREYyaHJWTE5s?=
 =?utf-8?B?ZUFEdFlwWk1PeEh0OVJtNWQ1RElPTE42TTA1R0dSdXFGQS9LM0RlOHQ2UTZQ?=
 =?utf-8?B?TWQ2VjlJaVRyd2VGajduejdKTzFTcjNaRFcvbDBtdmMxN3J4SlhmUDVySkhs?=
 =?utf-8?B?VUdmRU9JU3VqelFPN0ZTWVJHcHJpeVdzaEtmQXJGR3FpZlhqa3hoRjE1SWlC?=
 =?utf-8?B?NDhYNk5sMUR1Nm95MzUvSG1BeGxrTEZPLzExaHpOU3Q2Q2Q4Q0p3RWdLTWNC?=
 =?utf-8?B?aEtoYWE1YW96QjMxbkJZeDNhRjNqTnF6SzRNTjRaRVl4bmRWeFg0YzVza0FH?=
 =?utf-8?B?R1NrVXNTMEpmTU1yKzlVcWtNeXJ0VVhNMHhnTTRmN1ZUMFVaMXNvUGlJSHNq?=
 =?utf-8?B?RUpMUmlwMktPb0gzTTFzd2hWZlpHUGFXQkZ4TG1yaDlBR1J1VWh5N05Ubmh1?=
 =?utf-8?B?TUVpT1ZOVzIrM0JTUWVBVENLU0FWUExoUktsa2Jzd09TNU5rZUhwYnJxbWpk?=
 =?utf-8?B?cTBUTXIvTnNmYkJYSkx2YmJ2bDVERnNSQWNZY210ay9BRC9tWjZjT3VVUFhr?=
 =?utf-8?B?UEZ0OXB4ZktGZVk2b3dFZmNSWnhmUUhMb0t5SFdwdXh0V0IrZHk2ZHU2NzFj?=
 =?utf-8?B?S2JqTUthYVkxSXlYL3l3MWJSL1JONm1VUmY2UGRFbFVRODN6SU9BQU9KdlN1?=
 =?utf-8?B?TXpuOFNUV1RxUDh2RUpZazU2UGhyTzZpQzMraEgwWTVieGRkSG5ScDVJWnlI?=
 =?utf-8?B?Q2tYdG95bnUxUFA2b0JnSWR3RXFCOXQ1OTIwNnBFU0wweGhRYTdTa2ZCQzVn?=
 =?utf-8?B?Nk9KTmZVZklIYnFsL0xLVno0ckh5TUJPQllpdWtMTndXSVB1OUg5dUlQNVFS?=
 =?utf-8?B?NGc2TXhVaExkK3YyNzBSZkVBTzNsR29zQW1oR2ExVEVkQ2dpM2FDNFdPUXpQ?=
 =?utf-8?Q?Rqr5hVXktwUQihXfnweVCI3wJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9925fe6a-9bfa-48aa-d25b-08dbecc8da24
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:39:20.2028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPFfhS0jWYG/vXPMg8UhZ1C1bhJBv4VgrMq9mDbAS9BPaVGcFDyZ5HM23aHsIfCximY6aiqmbHa38gYA7Pu6cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8326

__init{const,data}_cf_clobber can have an effect only for pointers
actually populated in the respective tables. While not the case for SVM
right now, VMX installs a number of pointers only under certain
conditions. Hence the respective functions would have their ENDBR purged
only when those conditions are met. Invoke "pruning" functions after
having copied the respective tables, for them to install any "missing"
pointers.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is largely cosmetic for present hardware, which when supporting
CET-IBT likely also supports all of the advanced VMX features for which
hook pointers are installed conditionally. The only case this would make
a difference there is when use of respective features was suppressed via
command line option (where available). For future hooks it may end up
relevant even by default, and it also would be if AMD started supporting
CET-IBT; right now it matters only for .pi_update_irte, as iommu_intpost
continues to default to off.

Originally I had meant to put the SVM and VMX functions in presmp-
initcalls, but hvm/{svm,vmx}/built_in.o are linked into hvm/built_in.o
before hvm/hvm.o. And I don't think I want to fiddle with link order
here.
---
v2: Use cpu_has_xen_ibt in prune_{svm,vmx}().

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -161,10 +161,15 @@ static int __init cf_check hvm_enable(vo
     else if ( cpu_has_svm )
         fns = start_svm();
 
+    if ( fns )
+        hvm_funcs = *fns;
+
+    prune_vmx();
+    prune_svm();
+
     if ( fns == NULL )
         return 0;
 
-    hvm_funcs = *fns;
     hvm_enabled = 1;
 
     printk("HVM: %s enabled\n", fns->name);
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2587,6 +2587,19 @@ const struct hvm_function_table * __init
     return &svm_function_table;
 }
 
+void __init prune_svm(void)
+{
+    /*
+     * Now that svm_function_table was copied, populate all function pointers
+     * which may have been left at NULL, for __initdata_cf_clobber to have as
+     * much of an effect as possible.
+     */
+    if ( !cpu_has_xen_ibt )
+        return;
+
+    /* Nothing at present. */
+}
+
 void asmlinkage svm_vmexit_handler(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3033,6 +3033,30 @@ const struct hvm_function_table * __init
     return &vmx_function_table;
 }
 
+void __init prune_vmx(void)
+{
+    /*
+     * Now that vmx_function_table was copied, populate all function pointers
+     * which may have been left at NULL, for __initdata_cf_clobber to have as
+     * much of an effect as possible.
+     */
+    if ( !cpu_has_xen_ibt )
+        return;
+
+    vmx_function_table.set_descriptor_access_exiting =
+        vmx_set_descriptor_access_exiting;
+
+    vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
+    vmx_function_table.process_isr            = vmx_process_isr;
+    vmx_function_table.handle_eoi             = vmx_handle_eoi;
+
+    vmx_function_table.pi_update_irte = vmx_pi_update_irte;
+
+    vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
+    vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
+    vmx_function_table.test_pir            = vmx_test_pir;
+}
+
 /*
  * Not all cases receive valid value in the VM-exit instruction length field.
  * Callers must know what they're doing!
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -250,6 +250,9 @@ extern s8 hvm_port80_allowed;
 extern const struct hvm_function_table *start_svm(void);
 extern const struct hvm_function_table *start_vmx(void);
 
+void prune_svm(void);
+void prune_vmx(void);
+
 int hvm_domain_initialise(struct domain *d,
                           const struct xen_domctl_createdomain *config);
 void hvm_domain_relinquish_resources(struct domain *d);


