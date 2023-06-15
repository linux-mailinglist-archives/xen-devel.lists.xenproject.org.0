Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D47731C5E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549687.858353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9onv-0001h7-IQ; Thu, 15 Jun 2023 15:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549687.858353; Thu, 15 Jun 2023 15:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9onv-0001eR-Fj; Thu, 15 Jun 2023 15:22:31 +0000
Received: by outflank-mailman (input) for mailman id 549687;
 Thu, 15 Jun 2023 15:22:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9onu-0001eL-6F
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:22:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70a1ab1b-0b90-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 17:22:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7631.eurprd04.prod.outlook.com (2603:10a6:102:e1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 15:22:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 15:22:26 +0000
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
X-Inumbo-ID: 70a1ab1b-0b90-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UE55xUmQRN14Lmhnax9J5XYkv+Duque4UlYqy6ZImwNfzszUWUjjdhre67zTNwI1uK28m3goISO3mwPmRvzRxpukqOpIjoHp0OcZsyLexLx9giUrIAq9upacvEw4d+MayRQAOLkWjSqIKmDgOh4kYIn6PEmpQMHUKlxHXVai1kk5yZqsyI4bEVLdndaJQm7KTr8ZIB6nzAGfOMT7ehW6cTnPMBIVdq46za8rpMl8t1sPgzrMvjnlMM4psEmI/BdzRLMSVWRc/7GKRCimTV2yIwkTi9AAHsllagYiOkGXzrkhwgfBWmHxrj5T+fqgCf19KRfPbdeevzXAd+Zx2q7e4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+h4Dzb+0kBzimTRBPa6/JxLJbWXkSXkr3y/YzngK4tI=;
 b=h2KLVjoLmaV41tNLk3iOHCum1+jB7Mu+R5TN8tBbbDvvnJae52UuETiRWY5TLeZY73LUgNH+DtTS/tBXcfiapzI81dpwLj7g9fDCXnNFkCntexJlVozlqJMJLP3MEL5MNUsII9aDIpFphBszcJMd7S83INRcaAyD8xRRsG5tgwc3e4lNH0RqHaq5neYOe0+E6rPTSTgz+UMXFg7W7/u6Omu4crkaUsHIhXqGFAlDqogwEQnbVzjyM0V3B/YYM4XA96CU9IR50aes7gSKUp2CRbwEWKAjadSP+Kgh+FwetP1NsSsm99wkPBvA8vqtHHrK9COLG05W/gezDAvg+nV2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h4Dzb+0kBzimTRBPa6/JxLJbWXkSXkr3y/YzngK4tI=;
 b=jvi4WQUp/dAOdvevBqqGFhrfo2U7ddqtGYjRib+9j4qCbDCJSLzEBpUsRO7CWrfBnmnhNlfOTEOWu1cdmOtox87RNg86GMqTyj457L58PuVZAmzt8X08al80NuChrCBytwuUJHHAQpvTPtYf/kxOh+/3S/PJSlyNYHII5xOGi0gxkOut21kPfPEasLAUdQszhXjJssFPdEfkcnhhCAEBC/7YAqC1lrG8py2PhouJKBqBdMDFHRE5DuJN85CSXDe2CxQzEph6KNbLZNVGFK7kvEOkYBDpf8LSSzye9UZXJrsiVRUBF+PlH/1APpy2Qk2sRwwTY+lHHXWVXDhR866rhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e50e36f0-0a12-8265-de4c-7cac079b4c7b@suse.com>
Date: Thu, 15 Jun 2023 17:22:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 05/15] pmstat&xenpm: Re-arrage for cpufreq union
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-6-jandryuk@gmail.com>
 <4ee7b593-6e87-25f3-83f8-6309c1cddbfc@suse.com>
 <CAKf6xpu_KtLzxANGbs5ZhdKCcSGhwnH7Xac=zP+W5vVBJ_PkNw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpu_KtLzxANGbs5ZhdKCcSGhwnH7Xac=zP+W5vVBJ_PkNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f5cc76-faba-48ac-1b7c-08db6db45372
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jt5fOHMtNxb2TlZ7JUQA1zK95seGEIGdaKIgYc0+1/7fkW3R/DYD4XWUZrVy4/08/8O0sNxK/z7kStf++/0v1dbBBREPMLIxn6MH0d2jJbJ73K6gIbeaXBkVoAD4PzR1fMd1ovx8YYM1+RJ3YB5HnOTG2l0N4tN3/X6EgsKVv7couxNZdi35apRgBFvS08dqCfTe0UYHl9izAmz16TZdr4t0bCwxMsSAPCq13LwZrddT8tHVd6O/qXHEYDc9i2EOWR3A8GUq0G3CMjQBcdEuPkdxn5vlUG5py++7qv4E2BaPPFHaCjpZAFk5atOoUKfSjGJmx0sUHHp54Aj5wgmNA5l+/temSZobdZdTHogwYQJsxbzDEXWSKXMFWGaFzCfMU1QUUFnXA04yYVs3MtkC99zP6MBNMsjKsCx/4O+xvB2JN3pC2qBYy/Y690FNKDoMVJx3wYN/JpV4WovbTC84/ymPP4KymULI4f93BRmy5V6VyZpRoR72IO+/shyR4yX95EAV9Y+HLqg4TPx1VcjxUlP+0b32PJGBgaCgvez1/U/ZLGZN/YH2f2sUolxndSmbUr3lKpeWiWlBDuoaecTiTXEwmTEpIVYZOJyAiFiw++68Gf1MazHKFJnn12bjrWtPXYK059B218mI+qm+L4BfKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199021)(31686004)(83380400001)(4326008)(316002)(41300700001)(38100700002)(6506007)(26005)(6512007)(53546011)(6486002)(66946007)(66556008)(6916009)(31696002)(66476007)(8936002)(2906002)(5660300002)(36756003)(2616005)(54906003)(478600001)(8676002)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFhpRy9aV2ZTS215MHV4bHlIcmN0T1JtZUdITmNlZnlnRStsMml4MzdGd0Fz?=
 =?utf-8?B?YUhPcFlPSkhUeFAwRTI0TVFoMTBQVnFCeXFlVE4wczYxSnI1WlJYYjRLd1Uv?=
 =?utf-8?B?VUtSd2toV3hoMDFJNUhlVTJqbGR1OGI1UHVaM2N0NzlHOE01Z1hGREZvYVVh?=
 =?utf-8?B?ai9NejdraG5wRFp3S1I2YXIrY2NOd0xNTjVMNzUvRU4wNEpxT1VLZTJyalE1?=
 =?utf-8?B?L0I1aHFSdG5iSzFvZmFhdzIvQzZYUzhFREZaank5ay9DUVI1cjVaNXhtQWNn?=
 =?utf-8?B?czhpdzN5TUFLakp4VVU2Mk9BYXZYMmFpU2I4SzZsQXpqbXNDa1NxZEJYQW5h?=
 =?utf-8?B?N3dZbWdzc2tMSTB6cXdqczNnRG5XR080TXlhNllWaGFhM200ZnZIMSt0TFA4?=
 =?utf-8?B?a01hMFMrR1laU21OM1JpaWo0UUJjb09rVEJoTU5MMmlrdHVnd2xUWCtUVzZn?=
 =?utf-8?B?ak1PbVdYejF3amgvUHNvaEVhT3dBZW0zU3NCSjVXNHNCQ0hvUXlQd0cxcE93?=
 =?utf-8?B?akg5NFFrU3BIUk9DNGhUSTdDWk5FQXhScDRkak1WZXVMN013cUdpSjhwV0FV?=
 =?utf-8?B?c0lza2FodEh6cjRwVDNpb0Nhc1ZSY3NRNmNPSmd3T2JOOCt6RmxzeWNPZzc4?=
 =?utf-8?B?aGZmZUtseWtLdDlXb0dhMkNXYkZ1SVFrNGdkMURWaFgyVUFPM3dZUHlJMWRB?=
 =?utf-8?B?VUY3eHRldzAvRzQralF1TEFFb3RJSFZHNm9OdERSMXFSd29qS3RwT2EvNjBU?=
 =?utf-8?B?VXp2MEFmUTNnNm1INHFTMWlPZnJVWCtJUEd6UmV6NXJXZW1ESktPcXRtdXRp?=
 =?utf-8?B?T3diVWV6bllxSVNmNU92UWtEZlJ6RitUdnNDYmh0NTh1WWk4RjUrWDRGMzdp?=
 =?utf-8?B?SGZiMFlPYmcvQlgzOTBSNGZPQnhtZjJvaUc2eWlyejJTait4K05DV21zMmFo?=
 =?utf-8?B?RTZKbWxiajFEOS9zd0ZwZHVlOTAzUHdTajdiZzBUb25lZXlya2pzYWRNZ2l3?=
 =?utf-8?B?SjcvanhrZElETmVjL2pYVFh3NmJGanBrL1M4Z3k2UWl2SGNiNDZzaXJMWHhM?=
 =?utf-8?B?bGZYdHlmMkgxRHRYeVQyVmpsakQ3cElET3cxZy9KSWdhaEpjTi9oQTJDMjlH?=
 =?utf-8?B?OG9qMXllaUVmY0xHUVF5MTRGZVFxV0F0bFBuc1B3ZENEcVRyKzljbFFaNlo4?=
 =?utf-8?B?VlFRVzBxYlVwWG5SQVU0elBrWkJKK1ljc0Nhc21aT1pvUXdGVmZDNzdVNkZS?=
 =?utf-8?B?UkhROFNqNGVxK2hXNHEzbUhZSVBFY3kzYndnb1pOSUR6MVdiL2dlNGs3V1hi?=
 =?utf-8?B?WUhlaW1CTzlTV0tSL0Zab3ltbFVrU0hJMDNNQTYrUnRsMDBBWTRuZTVvRGdR?=
 =?utf-8?B?a3UxQUhkMi9wUTFra0RETmVBZkt2Q0FlbEpZcGw1NmU5QU5qTTJlWmNkL1kr?=
 =?utf-8?B?YTlOTkpiQ2E2YTVzTjAxbjdBRnhFZjQzMVhMdFI5RVM1WXIzYnZaWnpYRXNW?=
 =?utf-8?B?U1NLTlJKMk84dGhJVmkxTWU0aTdaQ2s1aGlvbVpNWnBZVTcvWWJNVTVXZ0Y0?=
 =?utf-8?B?Q0xCSDd0Y3k0U2p2OC8zNk4zSk15WVNSQXVXM0RwdlgyWTJHYzBPZmp5Ky9I?=
 =?utf-8?B?alhnay9RU0FDT21ha053RUtCVUJlbXNGeFJLQlZGMkd1ckNOWi9SNzhla0Ja?=
 =?utf-8?B?SDMrdkFUMXRCY2pHVHNPUkljVjBFbjEyZEdwMkJMNzVLeWFYWjBGR3dnb2x2?=
 =?utf-8?B?WExwdEtQdzV0dEVWV2JHaGFpcVBmWElnK2RTZE1EVlh5T1FHNExSYWswcy9N?=
 =?utf-8?B?YkJGR212c1g1d0Z2RDhlZDM3YTFmT3A2VHIwdzZiaG43VDg2bGpVMGk0Vkpw?=
 =?utf-8?B?WGp5OUh3dlZWKzd4QmlsSE54d1RtaTBXb2xHKzE5YjZNQThuTTNSSmRrcTMy?=
 =?utf-8?B?VkttcWF5aVdkSDVuQ0Ixd29tZFpWRGZnZWZSZnBsUkhGRURvcDRKQnk1dlJV?=
 =?utf-8?B?K052NHlNMFU4N1BabGlNd2dtcDJHelRVQ3Vqa085S1NrUDdZMVRvR04rQzdk?=
 =?utf-8?B?V3AvT21QazYvMDlqM0dkYnNzdzlDbVV0dHQrN0EvYk1KWUU3S2lFOFZoNm9M?=
 =?utf-8?Q?6hKzuS4LxH91IAPCh/nNkqKtX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f5cc76-faba-48ac-1b7c-08db6db45372
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 15:22:26.6199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RvhfGCUbJDhsp8CTezL7MVKvcSSf/5740f5oc7lO/2HT0SGRM6rDPzmcc/Ix5003gyyummTzOjURykO1cVryg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7631

On 15.06.2023 17:05, Jason Andryuk wrote:
> On Thu, Jun 15, 2023 at 10:38 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 14.06.2023 20:02, Jason Andryuk wrote:
>>> Move some code around now that common xen_sysctl_pm_op get_para fields
>>> are together.  In particular, the scaling governor information like
>>> scaling_available_governors is inside the union, so it is not always
>>> available.
>>>
>>> With that, gov_num may be 0, so bounce buffer handling needs
>>> to be modified.
>>>
>>> scaling_governor won't be filled for hwp, so this will simplify the
>>> change when it is introduced.
>>
>> While I think this suitably describes the tool stack side changes, ...
>>
>>> --- a/xen/drivers/acpi/pmstat.c
>>> +++ b/xen/drivers/acpi/pmstat.c
>>> @@ -239,11 +239,24 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>>>      if ( ret )
>>>          return ret;
>>>
>>> +    op->u.get_para.cpuinfo_cur_freq =
>>> +        cpufreq_driver.get ? cpufreq_driver.get(op->cpuid) : policy->cur;
>>> +    op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
>>> +    op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
>>> +    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
>>> +
>>> +    if ( cpufreq_driver.name[0] )
>>> +        strlcpy(op->u.get_para.scaling_driver,
>>> +            cpufreq_driver.name, CPUFREQ_NAME_LEN);
>>> +    else
>>> +        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>>> +
>>>      if ( !(scaling_available_governors =
>>>             xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
>>>          return -ENOMEM;
>>> -    if ( (ret = read_scaling_available_governors(scaling_available_governors,
>>> -                gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
>>> +    if ( (ret = read_scaling_available_governors(
>>> +                    scaling_available_governors,
>>> +                    gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
>>>      {
>>>          xfree(scaling_available_governors);
>>>          return ret;
>>> @@ -254,26 +267,16 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>>>      if ( ret )
>>>          return ret;
>>>
>>> -    op->u.get_para.cpuinfo_cur_freq =
>>> -        cpufreq_driver.get ? cpufreq_driver.get(op->cpuid) : policy->cur;
>>> -    op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
>>> -    op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
>>> -
>>>      op->u.get_para.u.s.scaling_cur_freq = policy->cur;
>>>      op->u.get_para.u.s.scaling_max_freq = policy->max;
>>>      op->u.get_para.u.s.scaling_min_freq = policy->min;
>>>
>>> -    if ( cpufreq_driver.name[0] )
>>> -        strlcpy(op->u.get_para.scaling_driver,
>>> -            cpufreq_driver.name, CPUFREQ_NAME_LEN);
>>> -    else
>>> -        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>>> -
>>>      if ( policy->governor->name[0] )
>>>          strlcpy(op->u.get_para.u.s.scaling_governor,
>>>              policy->governor->name, CPUFREQ_NAME_LEN);
>>>      else
>>> -        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown", CPUFREQ_NAME_LEN);
>>> +        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
>>> +                CPUFREQ_NAME_LEN);
>>>
>>>      /* governor specific para */
>>>      if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
>>> @@ -291,7 +294,6 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>>>              &op->u.get_para.u.s.u.ondemand.sampling_rate,
>>>              &op->u.get_para.u.s.u.ondemand.up_threshold);
>>>      }
>>> -    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
>>>
>>>      return ret;
>>>  }
>>
>> ... all I see on the hypervisor side is re-ordering of steps and re-formatting
>> of over-long lines. It's not clear to me why what you do is necessary for your
>> purpose.
> 
> The purpose was to move accesses to the nested struct and union
> "op->u.get_para.u.s.u" to the end of the function, and the accesses to
> common fields (e.g. op->u.get_para.turbo_enabled) earlier.  This
> simplifies the changes in "cpufreq: Export HWP parameters to userspace
> as CPPC".

Could you mention this as (part of) the purpose in the description?

> These governor fields get indented, and that needed some re-formatting.

Would it maybe make sense to split the function?

Jan

