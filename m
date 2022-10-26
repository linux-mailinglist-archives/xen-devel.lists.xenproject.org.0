Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6329860DFF4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 13:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430483.682216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onete-0002N8-TN; Wed, 26 Oct 2022 11:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430483.682216; Wed, 26 Oct 2022 11:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onete-0002Kj-Qa; Wed, 26 Oct 2022 11:48:34 +0000
Received: by outflank-mailman (input) for mailman id 430483;
 Wed, 26 Oct 2022 11:48:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onetc-0002Kd-Vr
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 11:48:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d24fb6b-5524-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 13:48:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7476.eurprd04.prod.outlook.com (2603:10a6:20b:1d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 11:48:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 11:48:29 +0000
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
X-Inumbo-ID: 1d24fb6b-5524-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHuLUVp2y8HHbl6bGOwpjCK79ft20WmXV3rRJPqHqQD9nQoRAHRjNCz/7H2poEzzK5jT9ASpBoHeC7/VGXn1KrfuY6Y1I0MSvyB0Yk2ME2zuMS+ZEGRugVXxZ8gMYeO5uGeu9Qnnx7w2XaKq0PuabEfMga2S0z78j/axirnnKUvx1GQkJzwBg5ITGxYpBpjCFTIDb+AQU8zAafu5sEkg2zung5Xq1kux3dbDSOJBBIeDu28dOHBioKfCd3TLJYkxEhVo95WSWzQXcrqLE6IDfncIAddCi9oGoo9XTdvS5/ZK3JsN/CfJ/MIivCVSYYKXvUqDi+BHzLULwCQ9FCse+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDMMaTAp4EGr2Zc5Zpmc5NR5QgXKacEiNe6VHnlr6Os=;
 b=f9suORdRji2SS/6/+d3Grrbs0VABmLn91Gh8/a1ZOrXyW5F2+kuW6UzvPF6ShzsM08SBJGJLdidAomLK2M26wYKVur3NkcCteL4jX1pCLt+twrzx83HciE0S/mFdcJ1+ubsctqiTtukh3pYKggL+51sAIhLcM30Xh8PkOOZE9PEyOD/Tt+HNcxgcjaNlwFPlOpe70zlPeO6/WRSjXpCDvPZKh5vaYu8fHtcv1bxZvOct5mj+MdOsfAicodIaFngwHwaKuhXtzVGQEiklb963Y4w+xfRY0uB5JxQemSN9z7uL3oKjaQ/18KFZl+3uzwuOvSRTq+IEoeeQcIuvnLDwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDMMaTAp4EGr2Zc5Zpmc5NR5QgXKacEiNe6VHnlr6Os=;
 b=cyUZCB+Xz/+RrDZ/diAiAVmzHLjDVuOGwJEQZ1IGlpDzx8R0a4TEQRbjp2nhF2NMJS1KMMuGZpQtKBfYULFW/m6fQ/97aU52blQWFTaYLNCxBa8ogq5KdzierW9AbKEES80bWThgfwWVVDfJrU5sNAp/CYIf3/4E2k2i1wuKVL/UODXrztYL946sENUsVHtXQB+Ejia9EgjzGz3a+EKf1UIj9AttDBfALYYQPnmJc+8T3tf7Fx/3rPzA2MSc7mWq+TcNJH0jfbzw5lqG+fQXXNlwZkRBxbU2AE5My+vaZ31+bazx4fhXaoSzb+UD1/IdFxJlw2MZImmDuZcqTLRAyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5673a0a-853e-fa2c-2f4c-e76b7b7aba87@suse.com>
Date: Wed, 26 Oct 2022 13:48:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] xen/x86: Make XEN_DOMCTL_get_vcpu_msrs more configurable
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <854cdedcdd2bfff08ea45a3c13367c610d710aaf.1666630317.git.tamas.lengyel@intel.com>
 <0c7ca888-3142-1719-13c2-4f006ecdf683@citrix.com>
 <CABfawh=RXrPgj+MA-4QGogM0o3Oo4GEJ3ipbqHKE0TV4GHdCTg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawh=RXrPgj+MA-4QGogM0o3Oo4GEJ3ipbqHKE0TV4GHdCTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 719579dd-7c41-454f-ce0f-08dab747ffa0
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ShfEva4IcQ7ERPjq+0FOC72Cy+iSyd8favNQR9hGGRtoIc9HEtpRRMmPMfUV6YZOfy8yD70StOVCCe5gR9kQx9UBb463PZMV9xkLcAvFTAFgcxcAPjTyNAjvGxjvPtqiKWJeBOXGz8uj1KDMZ6z+gLaLNUdWbCe6OrAVZhgR+C0HZAaWV7sfSOvjfAZYccz4583DSWVO9DA4eRiDZ46Hs4xxgUL+oDi7xbYxxo4BU2rY9+0mwmqGJzPL3GQ4delOvCPmX1dJEOlHCYJLT5fPeWcOyYvWcfoGbgUwkMW32/9rTpug+7At747S0lCZ0OpqApwntAms5hksTHs4975AIQMj0rKMslKHZAt/9ktK3ZQNYK4sjRyGhw8UrHs+GT3L/fyChk+xKeSaGs8VOsvwMtG4bOMarU6Ik+T/dzFHVldLzVk1IETP54H+N3xIQnPrc2fheY4VZSxuvi7XTUpVYN7hp0q3v2M2mdZnet1bzK/GylNpgNK5buhfZTJh8QSdTqoVxZ8Ilf+gUWnFpTnDFLz3gDT2CWhkB0fpsm0GuAComCt6I0rHCo211UPRpO+q4Tm/lR1+C+2I9QtLCVsVTOoHhjy1wmHTLxorcgKtsgyKfvZuHTCC+pMlCYUzjSb48Ys3PenuqLKbOaN3VdmWk3iYt/8jzwcnLbptQ/MDMIRvKOtNPmRRuLfCY8+vJJrs72Lg7hBb2zgHKghI8kWf8l9z/6r54qAyqyX5gtXzRjbvS8HC4P48b062M3C6WabJyeCf6jBZ8AvThwsnUW1C7lY6xWSzg5zPTbk+B+g1A3k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(478600001)(6512007)(38100700002)(66946007)(316002)(66556008)(66476007)(86362001)(54906003)(6916009)(36756003)(31696002)(53546011)(6506007)(8676002)(4326008)(26005)(41300700001)(6486002)(186003)(2906002)(5660300002)(2616005)(31686004)(83380400001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2VFZ1NKZlVuVktIbE1NU1hDSW0zUFAyR3duTzVpMXA1d055QTdpdUc4ancx?=
 =?utf-8?B?L3ovdkFvL1V3eFFuWUdYaGtmYmNscWZZMSt2cWJPNytWMWNVUVZpMFRCYkZU?=
 =?utf-8?B?ZFU4OXhSRFFQSUU4S2F0MkpNU2piT1drQ1ZobEVvRDd5enFtQTZUaEkrc1hy?=
 =?utf-8?B?cGFHQkowV1hXTithdnRwcFJQeHA1L3BNVUpRYWF2akhrOFRuRmtnM2oyaFdu?=
 =?utf-8?B?Vm82eWZDVjUvVnFBVi9sZXJTS2N3VllSQ0RyOVc3WCswL3dvczllMUt2amFh?=
 =?utf-8?B?UUpFeUN6KzNyK3pidnBGOVdzT1FibWJtN1BmVW5GcGE1elAyTG9uU1FKQzl0?=
 =?utf-8?B?NFppam82bkg2bThlSW9wZ0Ftc0VWMHl1Y1BHVWUvK2VxL05MWmRUWWh1ckpD?=
 =?utf-8?B?Y3Z0NTJzSUJySUw0dWdwVkgvNjU2aU91bTl3VG4rb1U3MFI1Y05CVHFEZ21W?=
 =?utf-8?B?NENTQmZkcVJNbSt0KzNMd04wQnZNSXVPemQwd2YydHduZytqTExzTzhsbjM4?=
 =?utf-8?B?Znc3a1BZK2MvdVRZeEJ6UkhONytqa3JLVkF3ZDBzQ1V0MG5jWlkza0tHTkYv?=
 =?utf-8?B?VnNPT0lWNFVpZDcyOFRKOFBFR21uL2crZ3dBMEZ5MzU4dmF5M21Xc0g2VEds?=
 =?utf-8?B?M0RaUnVFOUEvb1g4SjlidVdZUnlZN0JidjFkaDVSdFNjRmIwQTI5S0Y5bEpr?=
 =?utf-8?B?dG1kc2FjZmY0VldVcEs2K04xRzFaNDJuRnhnQ2JCV1JHV3ZLVmNqTFI1MGxm?=
 =?utf-8?B?SHZubmVBb1JOUEFKZWI0Q3lyci9yN01BdktEaGpwbzhsVHRJUG84VWRMOHdP?=
 =?utf-8?B?b3hhcE1MYkRDcy9mT0tsMmZ2Vm1UYTJKWS9FOU5QdmYzYytOaGszMS82U2o5?=
 =?utf-8?B?ODhNU0xVbnB5am5kd0VZUEZub0pGQVlQZXRxaTdncXltM1BQZFJwZDJLQThW?=
 =?utf-8?B?dHFTUjNiZUtZZlFPR1hLaWNLdWVKSzh3MHNRVGpLRlFrYlo2L2dhMHFnZDcw?=
 =?utf-8?B?bHl5QVQyZk9FV3huOW14dGh2MmptQTlpZzNKRDAxZDVCOHhHZXhZclhIL1I4?=
 =?utf-8?B?WW9aeC9tdlYvalJZSzhkMkxlZ0hJakU1cThLQXZBbW84NjcxVDB4TjZyU3Qw?=
 =?utf-8?B?V25UbVpkdEIwd01sZ1E4RjBlNlpRbXZ5dFdYdVIzSUdPYUZQS1B4eVdnQXht?=
 =?utf-8?B?OHVxU00vQnlEM0s3eGZCYUp0ZXFVNEIzdTdLa29GemhMekx1VTg2L044a0Va?=
 =?utf-8?B?SjhPbXJ1aElqY2pMQjZWZFBDZnQvbGx4bklpZkxiRHlkU2ZzYXpCL1gvWmVZ?=
 =?utf-8?B?ZlRabkxVN2tNblkwT1d3Z0tFSWFTOUpDR2ZiL255a1A2NmxUSFhTVGgwUnY5?=
 =?utf-8?B?dTFUVDZ5elIvdzhGcnhvNkpseWhjc25udUttbXptUlhvVXJ3SUhtU3M2UlJZ?=
 =?utf-8?B?TkZGYVpuSk11R0tyVWJBM3FyRmR4T0V5ZFE1ZU1uZGhod3Q2UGxjbUNvcWZp?=
 =?utf-8?B?K1l2Rmx4MURGZ2xkU0Z4engycnhTNGJJUEhMWGFsd1FqTGMzcjVLbUVXM09Y?=
 =?utf-8?B?aHNQNEhiNWtSK2pFWnV5NFN0RmFES2VSQ0JiU0lGcDJhdmI0OVo3cUJUb2FZ?=
 =?utf-8?B?TzkyNW11ME9BNVZpemlXS3FNazdCR1VPaGYzdVh1NE8zeHNtSzE1ZE9va1Bi?=
 =?utf-8?B?ckEyR3R4OVAxWlJvZS9pSjZvZ2FJb2JlZm9IRE14VmhUUGlCYjBDVVFpUGZm?=
 =?utf-8?B?YjZ6SlBmSjErQk5nY0NiZHYwWnRveVVEV1FBRitoNGhmMndSV3NYNmljT2pI?=
 =?utf-8?B?a0lDOWI5dUpzTnBvT1ZDR3hjVVhSSExHVXlrUU1WWjVaRXozRTlWSXhKamZR?=
 =?utf-8?B?eEJJQmk3RWhhOWZDSUxKYjl6ZEg4SnBvMEZUYWFBMGR4R29TU1lQY3ZBbGx3?=
 =?utf-8?B?NlBEYzdFTFAzZ3VWcjFINHB5UzVSNStqampqd3lpM2d1MU1yVjJ0aGxRUTBO?=
 =?utf-8?B?a200NGh4VnFJdTh6R3o5TjdhSkJ1MXJIUFYxNk5MeGNUV1hUTW9JWlhOTTIw?=
 =?utf-8?B?Y3FYQXV2cE5SS004REFSdGdjWHlUWUQ4cSt0bUMvOG1wOE5RcUwzak1PYjFi?=
 =?utf-8?Q?sJ7kAFNkA/x+mtEK8yYJi13rv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719579dd-7c41-454f-ce0f-08dab747ffa0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 11:48:29.5947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fS564FO7z5/wbaYOXe3KBDoTMBswwMRIJqqQtJw3jGceC3hD0JoXTdMFm2bVdEWZNU+n2hGFu+Vw6yiWuMYCHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7476

On 26.10.2022 13:34, Tamas K Lengyel wrote:
> On Wed, Oct 26, 2022, 7:06 AM Andrew Cooper <Andrew.Cooper3@citrix.com>
> wrote:
> 
>> On 24/10/2022 17:58, Tamas K Lengyel wrote:
>>> Currently the XEN_DOMCTL_get_vcpu_msrs is only capable of gathering a
>> handful
>>> of predetermined vcpu MSRs. In our use-case gathering the vPMU MSRs by an
>>> external privileged tool is necessary, thus we extend the domctl to
>> allow for
>>> querying for any guest MSRs. To remain compatible with the existing
>> setup if
>>> no specific MSR is requested via the domctl the default list is returned.
>>>
>>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>>
>> Naming aside, XEN_DOMCTL_{get,set}_vcpu_msrs is supposed to be "get me
>> all MSRs needed to migrate a vCPU".  (I do intend to retire the
>> hypercall as part of fixing the Xen side of migration, but that's ages
>> away)
>>
>> It seems like what you want is something more like
>> XEN_DOMCTL_{rd,wr}msr_list  (convenient timing, given the recent ISE
>> update).  I think those would be better as a separate pair of
>> hypercalls, rather than trying to repurpose an existing hypercall.
>>
>>
>> As for actually getting the values, please fix up guest_{rd,wr}msr() to
>> access the perf MSRs safely.  I know the vpmu MSR handling is in a
>> tragic state, but this new get_msr subop is making the problem even more
>> tangled.
>>
> 
> Adding a separate hypercall is fine.

Which will then also avoid altering the behavior of the existing hypercall:
You can't just assume e.g. input fields to be zeroed (or otherwise
suitably set) by existing callers, when those were previously output only.

Jan

