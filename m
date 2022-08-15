Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595EB5931B9
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 17:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387618.623937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbwD-0007jQ-5C; Mon, 15 Aug 2022 15:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387618.623937; Mon, 15 Aug 2022 15:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbwD-0007hC-2D; Mon, 15 Aug 2022 15:23:33 +0000
Received: by outflank-mailman (input) for mailman id 387618;
 Mon, 15 Aug 2022 15:23:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNbwB-0007h4-A7
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 15:23:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2087.outbound.protection.outlook.com [40.107.104.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36a6038a-1cae-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 17:23:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3344.eurprd04.prod.outlook.com (2603:10a6:803:10::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Mon, 15 Aug
 2022 15:23:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 15:23:26 +0000
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
X-Inumbo-ID: 36a6038a-1cae-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUyzhvgrLjVDmJKnOpS9Kh+vsWYCG+utjqMIiVvH3kwh5yj34zeBgYAqPo/iG7tT4DKJTzXiOGkMwu1gD06VBSRHJb9q5kyHrgLFRTBJJxP7sPyvkmrLKh0SnbL8CEl4RCS6AlhpN3g880V8BxQs9IePFKBj5u8usvs/HTrnUWZ3bLZIn+Xxsao+bPSebAmB1vXvfSijQJX4bx+bQYksF+2lm4w5F4Gmggj/YIk9MNQ5u4yEeQ+p9spPwsNO63KdwL5PX3Mg9/PaX0X3Slraq09MnxsY/1QSnAdjWlRfofujuo5x0rV3O1++YgG2Q1DMsEVxpuictxSDjKQcqOqEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6DATZEZ/WLJuwqXpjASVnD/jHlyJDpbHIRntJX3p/g=;
 b=QJNBQaZaCU+Uuq8m1HCEBZ3JChWaIX51+Ijtd5tQrE+OJW+HySs9SFcf9BMc+2TNGX8y0ABYkd0WJcqcby4hTngmhQURR7B9XOAEZHGWYrGzPZ7VG57RSpl1XlY+JFAXjZXMcrIWbAn2fVTdYkwrQHpvG6XiM9JGzMdnJIX+451g14cV2Rt7wMR0N0dEl3xd+WiKhVvfXtFiYXW1xr8+y1xDUjv2CqK9yZH9AxwZAa6+8WI6cmNgpYAP22mApypfIl9pFoum56GsWW7zpj7wk33So/6MUOf7jMoZN9verrvG9L2qHce9KTGPdq7jM/06seufT5pxRV+n3l5BPti1FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6DATZEZ/WLJuwqXpjASVnD/jHlyJDpbHIRntJX3p/g=;
 b=DFHz8tlC6+/LAAqEJQ9RnAiBZ9yT4vXClmXpCQUXIl1an7TGa1S9NUGrRamDzww2W0/xD5YP7qPQJ9PjhoVovLHF/mDKp7WczXDFNSPPC8TYZeUF7oogDGuuVxCEvqoLmPBgFqwi/0M7rMTJeoUT3OGp5Gv/N+hY/l4MzUw91jDpy1KDMz0XIKBT57urMHhaFMiPYOtZRicUVlcwcwk2s9hIkAJv2TrhSIIEny7P/XOgP58eAjvoK9FQNCwk3G2TuNhgI6ZmQIE4HwTgIj3ov5Hv3Op8qMZ5Z9sgN9acAUl0AYEXB2Q+b5abvXcVtlTRXxURmAzJJOseyZgX2r3PtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0bf9d6a-5c51-352c-c773-092b5ec63130@suse.com>
Date: Mon, 15 Aug 2022 17:23:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 03/13] cpufreq: Export intel_feature_detect
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
References: <20220810192944.102135-1-jandryuk@gmail.com>
 <20220810192944.102135-4-jandryuk@gmail.com>
 <9dd6cb04-30fd-aaa3-5afa-02c4f3264f97@suse.com>
 <CAKf6xpvv8F9wuVNn2vqGo4bfO1ha9B5m1Ns-ydHESGRQD8a97g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpvv8F9wuVNn2vqGo4bfO1ha9B5m1Ns-ydHESGRQD8a97g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94bfc4b7-0b84-4019-029a-08da7ed2198e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3344:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Scl2UxP9LjXtSPh6rO+Vdb4UjBbSuM/SWNWj2Oa/zQsWeuAWxN75Wb4alK8ZI0T9HVlYccW6OCQQvkfpH6Qv94oQHBDb96cUs+HVr16hRtEVxCfg74KmDsTAFziitMwebbmLzW3BGamDWX4iOpNlh+tDcv7NnvjE1U6BICatm0YZry1Ym1pRSZLAuMz6poxGNRhysYbros37XQ+9bpLgZyPs6kvSj+BrH5CRj1uNlQCNocOTJMtVyTSu7NZra/2DJjTet8czhMBKFpx3YSrwMMRV7lDHKICCr6ius5UGN+gAxJvPMb59/2I4xW0mcR03cWnpBLQjstpiwarJLyk6TIGuWvxs7t/Ad8KnHYJUQxnGGVDMN66bKn6Q0euTGJDsoPiwCGmoWjyROzTdtn50OSelodIJFIdcfEl3Io2wX10e38JTywWkdJdhLKENBj4sx99r20PtOg7nzgoXk+pHtiCw641XmRzQv8f21ulbZigS+JLl4xx4Krfh+d0DOPKJGjf9aGtfSIX2SK8zGpuFFK6VPF4WMGmzL1aXwQ01ObrgBlviqIF1PsTFH3IRwZweFrbFuu8N/pGeh1I7/Fc6YpwW3k3rlRMt592tjqYEft0b194C6RTRvULgOq26VUsh5pbRRV/pPfAH2//ICO+aSDZmRasvyEH1AGHx0IoZGiqs5TxHmbWp6VpCsJLYYsXrmtb3SNgFG02kM6lS6kWXsCN7OBQkyz1xVgX2I5XBy7hKucVfHJfSpYx3UJt9nk5KpJxDepG8r4D7vhHafPtqEwH2NqPvUh2TUVFwi5yXPT6jJ3twugD3nBZx3Ekq+xPvH6y1AFZIjLo5YTSfN/1tkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(346002)(396003)(376002)(136003)(2906002)(8936002)(4744005)(5660300002)(316002)(31686004)(53546011)(6486002)(6916009)(54906003)(26005)(478600001)(41300700001)(6506007)(6512007)(31696002)(86362001)(83380400001)(38100700002)(4326008)(36756003)(66946007)(66476007)(66556008)(8676002)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2pVVnQ0Vzdia1RjVVRaSDhCNXZRVHJ5cnpCUE5WOGRQVmkvVVZLeDdvMFJ4?=
 =?utf-8?B?UGRVbnBjZ08wVFZ2TDErSmlzQkRpYURJaElMeC9pVS85bDZsWWE2ejUxeEUv?=
 =?utf-8?B?WUxLa2QwY0I5djAzZmVTYVpxSWFGdDFsVTRVd3YvZmlzVTBldHNJdHA2KzlJ?=
 =?utf-8?B?VHQ1U2pmdmdYMlYvS2tpRHoxTUtPTDFpMktHdlBPMERkOFJ1S0RWSUt2c01N?=
 =?utf-8?B?R2pmbnVTZVZSM21Mc2FTTGlxOU1heEFWK1RqcEZXblREN2dLSzB1eDdUd1d1?=
 =?utf-8?B?STI3UEYxeHdZZ3ZOYmF2ZitXNGtzelRDWk40TkVUa3ZGbHBkYnhkOTlZYXUw?=
 =?utf-8?B?RmMvT3pvcnJVOGMwRXljd2RlYVRYWFFzTWxpVXc4S1RvQUV6dHhhRE5tcko3?=
 =?utf-8?B?NjZLOUd6YURvYUp3WEh0ZVNPZ005ZmJwR09mQ1dKMm5zaFZaemVvOHhBSkZI?=
 =?utf-8?B?dW4wV3NNZWQxOEpwQmhaOFo4U0hHRE1LazFrTkRScUFOSUdCSmlUMXN0NGkw?=
 =?utf-8?B?TGtkT1R1cjVTKzJTeGJzanViY2N6cHJqS3ZjWDlYZm1FUTNEQ2tjb3VRRCtF?=
 =?utf-8?B?Y3JKL2xyR2doMjJRNmFWb3NDT2xyQmxuZ2htMnMxS3lhZ014M3dQZTFPVmlY?=
 =?utf-8?B?eDlwK2VDOG9GR0ZXMGxiSnZ3OWxQNjA1M1QvdnZjYStUSkEvbHN6K0VPWm0v?=
 =?utf-8?B?SXMxYnVBS3BCN2RtZ1pRVVFOdE1EM3J3RGdCTjVHNVhyOTJFdnBzVU42Kzk5?=
 =?utf-8?B?Q3FEY1Nmdmd4NGw4MHlOMjBiSjRqd2t2NitWZEx3a3Vid2pZZm41MDhHVjMw?=
 =?utf-8?B?dUk3MWNXaU85OGthZlYzTFhlWnBwRE9GemswbnlYZHpCT29PK3Jyc3c4cXYv?=
 =?utf-8?B?Uyt1ampnL2ZWSDRNY0YzNUs4YVZESjU1ckJLRXJqT2U1cUduMXpoSmt0QVcx?=
 =?utf-8?B?VGFqc1RYWDZnR1NVQWFlc3k4Y0FMaHZPUXR4WExYZHhKTjBrbXF1K3Y2b2Jt?=
 =?utf-8?B?dmluRm5tTStkUzVZVjlsY1drOWNrTEpUc25Kc1JVMkhySHBYcEZOZVRLZkli?=
 =?utf-8?B?ZWJyL01iR0dRMTZBRVkyUzNaKzhrdnpMT0hBaUdYQTA4bnNtYWZxb1RKQXRQ?=
 =?utf-8?B?a04rb1BUTjg4NTdkVjBnUkFCQzg0TXk2QkdJSUJtZlF2YldEZGdENWhUUkhT?=
 =?utf-8?B?WVRONmJad3o4ZS9FR0RScmRnTFZQR2ExeldkdTNiS3NFa1ZSQS9oa0Q3azNn?=
 =?utf-8?B?Ti9Db3d3R2V2djRMVytpdHkrNGQrdnhybGlqanNhZDh0K1VINHNNTWNSeXVV?=
 =?utf-8?B?azh3ekpvMTc1a3dzMytranNVUnllbjJRLzdxV2k5dWJ2L05vQkZkYVh3S0tK?=
 =?utf-8?B?bnhRU2tGZytEMitwU0t2WDNSMm5sdGM3NDBIQWVobGwrdm1HbGdoeXVJTGt1?=
 =?utf-8?B?Rld0THVwL1BKam1oMzAvdlZ3S3A4T0dJQkZ5cW1wR0R6RWdGNDRsT3VtSDVT?=
 =?utf-8?B?dGdnajFoR01FbGNGMWlTTHVUcnlTZXJqbHVwelpHUzgxWE9tUDZ2Nm1yWFhv?=
 =?utf-8?B?cVRXbXJ0T2IwZUlxYW1aN1E1T0FsK0dYcXA2Q1hBdW13anJLYlFJS3ozSDRX?=
 =?utf-8?B?ZkV4V3ZLU05NRXJodHB5VmhEMXpSYnFwK1o2OGV1T1VrVG1od0ZYUGF4RHl2?=
 =?utf-8?B?Rlh0RU5uRERQWEVIM1ZUSkVIdExWNlVwaFA2V2t0VzArbHR4Y0pBYmlzam51?=
 =?utf-8?B?QWJ0OExMWXpmTi9tWnRXcXZ1SDRUUVZjeUxwd2dOTEVRTktvOFZCVUIxdDZ4?=
 =?utf-8?B?cmtEMjZUVll1aE1yaG5tdW02bnA2ekF6bjNwSkRrUDVwWGpLcU1pVFRZK1Bx?=
 =?utf-8?B?VE5GbTYxQktSQzhqTmY5dE1ORi9rWGIydmJDOStlbmVVNVF2TU05SFlaVmhM?=
 =?utf-8?B?eUxEdG1sbmY1elNDSi85end4SHBZNCtpTnJQMUNPNHduOExzcDBTWDFQQTdq?=
 =?utf-8?B?bFdjMnluR2k4aUdkY3VhcmRmZVkzejFaTm1Sb1gzQ295ejZBK2tUcVR6Vk9X?=
 =?utf-8?B?cmlDUytXSUxDRHJPbVdFNmd5cDhOVHk0UGZoQ1hNMC90eFlKU1FtMG0vVzJr?=
 =?utf-8?Q?E0UvXSs3znXd1vdggryXKM8oo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bfc4b7-0b84-4019-029a-08da7ed2198e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 15:23:26.4565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCxS+6tFrQY1arlfOE/zVanIAVuITPrlE/qHvB1S5dbnz2q7a1rANMioIWHnU2uCic6svKtrX9vEmlW8a93JyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3344

On 15.08.2022 16:58, Jason Andryuk wrote:
> On Mon, Aug 15, 2022 at 10:34 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 10.08.2022 21:29, Jason Andryuk wrote:
>>> Export feature_detect as intel_feature_detect so it can be re-used by
>>> HWP.
>>>
>>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>>> ---
>>> v2
>>> export intel_feature_detect with typed pointer
>>> Move intel_feature_detect to acpi/cpufreq/cpufreq.h since the
>>> declaration now contains struct cpufreq_policy *.
>>
>> I don't mind the new placement, but I don't follow the reasoning.
> 
> v1 added
> void intel_feature_detect(void *info);
> to acpi/cpufreq/processor_perf.h
> 
> v2 adds
> void intel_feature_detect(struct cpufreq_policy *policy)
> to acpi/cpufreq/cpufreq.h, which was selected to have the type available.

But you don't need the type to be available just for a function
declaration. For such a purpose a forward decl of the struct is
sufficient. Anyway - not an issue here.

Jan

