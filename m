Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC04A5FC620
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 15:13:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421155.666347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oibXo-0002rZ-Jd; Wed, 12 Oct 2022 13:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421155.666347; Wed, 12 Oct 2022 13:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oibXo-0002p5-Go; Wed, 12 Oct 2022 13:13:08 +0000
Received: by outflank-mailman (input) for mailman id 421155;
 Wed, 12 Oct 2022 13:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oibXn-0002ow-Dt
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 13:13:07 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2045.outbound.protection.outlook.com [40.107.104.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b541c2a-4a2f-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 15:13:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8456.eurprd04.prod.outlook.com (2603:10a6:20b:3df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 13:13:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 13:13:02 +0000
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
X-Inumbo-ID: 9b541c2a-4a2f-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gj2AEV36PbLMFtXaxmSAvqblTg6dpQEIFzkNTQ1OrykM4YKAfU+HHpUHyT7T19JIXHhweACGDYUASav6BGqBfRBX2Is6ib941VItko/xOdECzPZE7MORWCoMtDgEKSjoipejYh/zOdEcAKRXtGn4EUmCqn5s7x/O79XgBpGdqAXbyBNwwD4pNsTFVwMGZC1MKYXdDDGCCe6YcQ0ZWFfxtNnWw6DYke9TwLY37ghMBBJ+gZ1Xp2oLdYdE6I+hngixv7G6BSzoqvdObdZW31TKUGRk6YhKxVelBnaPgf3fniPv8XGL+2eWNU3VF2NzDCJFQnXyaZfj2uBfoDSZchnaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1ZFKrD/744ZTHAWmpFvq+z8nzMaq45rAAJQQ+JwLmY=;
 b=CfIntN3W/hkyFtAmS7v+bOEBXATF067/ZIh89vbaN0hUbMBBnVVdJdeLLum6pg9bGsfSMtPZrOWJpcVa7KnapdSFAgF43soS36sqhyFGOtKG08WFUiwYpF1mJR45fJGlXk2B+O69WdpIJYlPa2N2GW+CIi5JlqeBGIgI+Ulr/QAu+fSsvwIiouTepLRquBLWlLmuoqhwbLlSmNeez/GlxK8xeDqO4a7/DH0nyOqcFbkOpC9iJiJWMZdiG9sXtHLiL2LWK/E3+yLg5caavjx7Tcbylxh+yp2ZMnxlSXWeKHT5jmv2OGAnPaILliGkb0QeN83scrrMq7jWbIUCYKoiqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1ZFKrD/744ZTHAWmpFvq+z8nzMaq45rAAJQQ+JwLmY=;
 b=uYJCm6kL0mGS6sL8vPOcZ06/6SrTj9i1VdRVRFZqrEr6nn46dVpJMaXSsZpu6Ado8Nxk69k3lx653Wa55le57REKBHwm3qqOX2l3Zg0f4Saw4iuCm4ocJNKJpvBvoHSD2UHUKJEnA10x/5nm8dMzLesZBaL1AGIlErKqFtcXJlTD9kL8PYmsRAtaYO2uOtOmfcNsl4IzuQclxWUzzCFE7XZYmTRgfVNY0hB3Yot3o33wmKqX6fSNRBT9VU9TJDaqV3ouKwOQ/GON7vlreQLf+31mXQ7X/aVuJQvG9GnWAstA4YeIC+PGOunV1jJ7gRiZxzluEITzs6FyCcWxHvJOAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c0b2e0b1-f5bb-e75a-dfc1-60eb7006cbf3@suse.com>
Date: Wed, 12 Oct 2022 15:13:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH][4.15] libxl/Arm: correct xc_shadow_control() invocation
 to fix build
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Julien Grall <julien@xen.org>, Anthony Perard
 <anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <805d66fe-e116-254f-015a-59a760639653@suse.com>
 <AS8PR08MB7991025777286F904D3FB6F192229@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991025777286F904D3FB6F192229@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0117.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::32) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 199c2824-365e-45fa-ccd8-08daac537e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QxE0UHQ4bbTjnZyStVl0UrZUieH15h3IddJO3RqbfBKnmoipubPB1+IlaiNjywx4Cu4hOmiD1yRJJjMkXfPMP7MCMTKqN5nA0oOpolePX6lBxfArOmhwbCiBfXGAVcsJzSi3aiylhriD8fd9l4LBQG48ZKoq/+6Qzwt+Tg6EA7zLwBh6s2N8gdc4Unl2bpuv5RkycTFfL++d+6hlFQ0OSvMXo25v9mrFhKN4u9VkRwqH32sBtmggV6XJXzFIIUYuT2QaTN1cpmgGSN4AyYiBSc4bokNBxDIgeAFNo8aWXUEK4OdTH293UYXPQl5mM53P+Bjm1n322YMeoRxim7/UptPyQbCZj6KT8il6eZKsXcwMzagQIYa6awpYw25LXmWQZbDHn9ugdIY++D7J+obqmA0oXi1aMu+X9ku7eFxUizHdGCIB9P9gBp5iPZ4kH+uGlNiZPqXsaZLx1j8EmVB0Zk2sRYZJxLmtCLkfUxPL79Kfs5+6MICw5Cg38uae82GNjiByL/1ngcueTdjU+WWdraJNeByBIX+Opz87A7UfTHV22KMWCd+PfIn6Wb0cN5ycUvGqDe7aX+iSa+TJVGNOZgHY9JOVHuC0WKSHN4xdDFvNW4kfBCguI0/eCzSGhKhMEwRLCcRgZhjSWmdo3LKDJkuRN9kcemyhqmCCtlAdPj/yA/GkccqwwyfbkEob3ggiqWF/rYw7KuVHtDs7wgSX/24L3p0atI5Kjg3sEfzxicRQFp1WMUWc45X73jgTgYryOjD0gVGvBOKJgknxW2bF4i2QdOiyUr8vlJXA40pOm3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(376002)(396003)(346002)(136003)(366004)(451199015)(83380400001)(2906002)(316002)(8936002)(2616005)(6512007)(6916009)(54906003)(4326008)(8676002)(6506007)(86362001)(53546011)(66476007)(66556008)(66946007)(36756003)(41300700001)(31696002)(186003)(31686004)(5660300002)(6486002)(478600001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDFhWVFNdWc2MjdPTkFEb3J3dGVWY1VxZkIrTGZqNHFweG5mVlppMU9uS2lq?=
 =?utf-8?B?Vmp5ekt2cCs0STBSMVZFbHdFcng1d2ZwVUp2WkpDVG1wRTN3cHFsTVI3cUto?=
 =?utf-8?B?akxFb1BWREJQY1o5Rk01c213QVl1WlhVbk1sampzMTA5dlVRbDJzYTByZ1Fx?=
 =?utf-8?B?dFlZRHE5a1ZSQzVnc0JRRkhrd3lhSjZvMHRMQ210WnlHSU8vanpQSDJRREFm?=
 =?utf-8?B?ZGpZS1BLZzdNK1BUdEpucXpFSnA0bCtEMTJmZ2FUYzhrakZSQ2U2MlU0bURy?=
 =?utf-8?B?TWVpNWdhQ1RrNmhmdEVJVGRsZHlZa3IvTWlCbE9MZWNVdDZ5emJ4S1EvanI1?=
 =?utf-8?B?dFppWFFKVG04Tk5KdktPSWkxQzBLVHh1UUc1bTU2YnV0Q1RaQlBORGszMmV1?=
 =?utf-8?B?QzdPNW1INmpmd0NycUJ0RWNJcXU1Y1JPUCsrZDFOYkJOSU1RV1lubE5MbUc2?=
 =?utf-8?B?Nk1abndycVUyY0s1eXduRmZabE9KdUcwNlgzaUthYUF4bXc1bE8wMXFSdHFI?=
 =?utf-8?B?eHNKblBPeXE5RWdjcCtzSFprR2d5ZkdlWngrZFhkYUJkaUR2MkRYWmVTTFor?=
 =?utf-8?B?QUFTUTYxKzlhUElkNUVra1hUeVBxeWxiTFFLcWxzRXhyaDFBVmdxNVM3M0E0?=
 =?utf-8?B?MTZieVd5UUtiS25Cc0VUTUNMeWRyYlY3WU5KZ1o2SjBpZlJ2ejh1STY5T0c4?=
 =?utf-8?B?TmlkWEZBV0txdTZIeFl3TUlUdGNieGRMT3pmckJKRFRWSmVHNUpBckl2ajJL?=
 =?utf-8?B?cVUwNnVNeXZ3VFB0L1RUSjEyNk1ucGxhY1hwNW83YzVYM053MVE4cXg4aEVW?=
 =?utf-8?B?K0FHaGV4eHlucTczS1ZQdjM1Smlqc3NiZjVGbXp3Qjdza2JGOWdsK292OWxw?=
 =?utf-8?B?b3RNY2hiWTdtVTJwYTRoRlNSYXlaMzl3YnlEYjRHUVdxSEgxcXFWVmFmKzhO?=
 =?utf-8?B?RWZqVVliMGt1aEl5UXJLOFFDditnb0FnUnN3aExBNjk5ZkRpZ0FPMVVHMGZJ?=
 =?utf-8?B?UnRFUi8wbytpL0JMdDRUTDJmQnl1MGc0NUpWZzgvdnRlSWdoNzBsOHFJbjl0?=
 =?utf-8?B?Y3J1emNucFV5T3JPWWFHUi9WOWNtUjNYaEtvaWlHTmJxT2hPb1B4bm9zazJy?=
 =?utf-8?B?ZThndFpXTDV1WWd3NHdiSkc0NEx5QVNBMHNsdUZxaCswZ3k5M0pwSDNNeWxQ?=
 =?utf-8?B?OWVaTjJEdmE5Y0l4bldIWk9NSC92NWEyWEM4QUhIUkJmWlIzTWtrYXJlSmVY?=
 =?utf-8?B?a2ErNE9pZ1U1TEdIYXQ1eEljNjZaOXFsdU8vVVV6a3J1SGFyUDMzOU9tY1VO?=
 =?utf-8?B?aHdKek9KY1ZuVjVGNlNWTXZIblhmdkt3aUFMUklCQnZ2TzlpTmZuSlR1NXd5?=
 =?utf-8?B?RjF0a21SV1BncTFHOHBKVWwzRktzSzE1MHZEVlpHdlFaWkZPUmZZNHdSWGVJ?=
 =?utf-8?B?TFRLVkd0cUhSL094S3RKN1kyMmVIVmROWkZlZHNncnVCR1pJc3pFSHRVWFdE?=
 =?utf-8?B?QmVDUVVQbDRmeEV3VnpOQ2cvL2Rsbi9Wa0lBQ3pCSzhjM212WjQ2c2RmOHVl?=
 =?utf-8?B?OHRiVDlPb0ZJRlZjRllpV24yb1FhWEwybUluL08zUVF6U1o3OUtJakJhTlAx?=
 =?utf-8?B?dHAzdHNSaWkyb3R5TS81a3FpMllMUnpIL296U1QxS2hpeFFuaDZkWXBXWW1S?=
 =?utf-8?B?VTVjTVZiZ0VyNGgwa3FENVAzdjJ4cFhlbDZ3dUpOT2NlWi8xYkdCc000U2NI?=
 =?utf-8?B?U21DajdlRXZwZlJsRzN6TCtuMjJ1WmUzYzBIUTMvdzJGbEQ0cHYyUURzeFg2?=
 =?utf-8?B?WnZVc2ZaeHY1SU1YMWRkRHRTUm0zNTF5SkI0SGVLbFVUN01PZGw5ZkZBcExB?=
 =?utf-8?B?YXg0WE1ZaGFNdGdIdlBmTjcwbU9lK2x5bFZIZWd6YkpyT0lQN3lKR3NEaVQ1?=
 =?utf-8?B?Y2VNWXJWTWF0WHEzVDBZdnplUWdQNFBycWl5ZUtyL04zeUFUMko5SW4wS2Ni?=
 =?utf-8?B?clBVSldWdDd1YmNrMEJzTlBTREN4Z0tPVjA1anhIOVRrc0JJMG0yYTRqZWdD?=
 =?utf-8?B?VUFpR2doMGhWSEd2djc1dTNIdUNPTDhJeDZFYlpLa1VCUjgyZG8xQnhXaHh0?=
 =?utf-8?B?R3ZjbUhYVHVGRHd5bVFnV01LYnpMS3BKVWlibHVVWnZMRFFpLzZPUVJ4a0pL?=
 =?utf-8?Q?YlP3jCtmKPuOANddeUzdtsiYLEmUaF4tbiZOcpW3rBQz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199c2824-365e-45fa-ccd8-08daac537e17
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 13:13:02.6285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ly0shH944h2nUCfUMtNf4DR7lSkgBye+BRXpcyxPYHpfuTT0RmF8PDz5ViKfEx6Q8CFGRJXf1hBkvpciAOsPZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8456

On 12.10.2022 15:07, Henry Wang wrote:
> I thought to send my patch for fixing this issue tomorrow, but since you are
> sending...

Well, I was hoping to get something in before the day closes.

>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Subject: [PATCH][4.15] libxl/Arm: correct xc_shadow_control() invocation to
>> fix build
>>
>> The backport didn't adapt to the earlier function prototype taking more
>> (unused here) arguments.
>>
>> Fixes: c5215044578e ("xen/arm, libxl: Implement XEN_DOMCTL_shadow_op
>> for Arm")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Also applicable to 4.14 and 4.13.
>>
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -136,7 +136,7 @@ int libxl__arch_domain_create(libxl__gc *gc,
>>
> 
> The definition of shadow_mb should also be changed to unsigned long,
> and...
> 
>>      int r = xc_shadow_control(ctx->xch, domid,
>>                                XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
>> -                              &shadow_mb, 0);
>> +                              NULL, 0, &shadow_mb, 0, NULL);
>>      if (r) {
>>          LOGED(ERROR, domid,
>>                "Failed to set %u MiB shadow allocation", shadow_mb);
> 
> ...here should be %lu.

Oh, indeed. Why did I not pay attention when looking at the reverse x86
change in 4.16? Thanks for pointing out.

Jan

