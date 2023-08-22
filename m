Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44BD7844E1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 17:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588563.920093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSs4-00029U-Jn; Tue, 22 Aug 2023 15:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588563.920093; Tue, 22 Aug 2023 15:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSs4-000271-H3; Tue, 22 Aug 2023 15:00:40 +0000
Received: by outflank-mailman (input) for mailman id 588563;
 Tue, 22 Aug 2023 15:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYSs2-00026p-Dm
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 15:00:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6880958-40fc-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 17:00:36 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DBAPR04MB7333.eurprd04.prod.outlook.com (2603:10a6:10:1b2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 15:00:34 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 15:00:34 +0000
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
X-Inumbo-ID: a6880958-40fc-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRDzgFX8QLBBv9nBkywzOn8Z2faBgaqCn7Lur3/Tywt32lsc+ZDnp2BkaVeIKqn2rI2CUX+IPfPuJ6RNr/C4DE5awIWykelY1l7EncM/HuP71o8u/x+BfWxy8Ox2gr5eYKfP3zBdS3EFSli7P0Qg3UN3VxSnEOYPlu0h5keMHYVYpV76xfD3A6bgc9oCh7FNBEimSOHl8ebcF+sthz+5c4z1FHa2ZslonrRh0Lt30gnHr5h5BOZ7Q9eqljtLFqho2pkqfPJifyWIxSIU47UR9kpP6fQnBPh7huhZMPMpV/qWO93DW8YSMhgyp7qSC16XDu8BmRnNatmnzpyB5FT/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8ltrA6vXnHwqwFuksLnw1O3/O93cqzqGv8V5sm8PRg=;
 b=jJe0miHUgJawNlOeoU5ChkgDN9Z9rFmuKEvRFA6F8GfXTT7nsP5Lqy5yegM+/euvdYKEsX9wwFSG7XhRfcoYQguhHYc+ii6wAbT6gsYGux5AjpASXAjo9cmVcFkWAVtVB17BeAjxiVoQmTsZhq3kE+0KqQBmMDLs562VB/b8w6X9/KzvhmTyzQ9CAXUuEHNYRXKCiTCODINPwqkjz+Oq1SdPrqA2c884ZfE0mhpV02uTaUD7W2Z91ktYpZlsE7WaZJzJT4KpYif+Iz2TfFDBUfuFPzh9rRLlMCLCi869cjTBHet+1ILk49y00skMrxiu2cNOiTgmfgly4DsJzzCwMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8ltrA6vXnHwqwFuksLnw1O3/O93cqzqGv8V5sm8PRg=;
 b=smHf22mJVmHaZMAKQoWjx6PCxgAr+f/8pqaKFj3N86M3Eb6mOlUAAm/Gs76Ge8e/Twae0nbuWgTD/u6/WHklajKmyWHbvRsttf/r2P3wuZvw+cAbAmZxM+eVd6yfYrnB19LuTXkgxm0YKyUks2g4gwnVb09JogrQ8/bOm+5Qn+gAQAPwmYZsFlEEKOlMbtVvha4dq+TGm502eDdoBqPna2b52Tz/TPR5ektQGXJRRsQJOVmXFxshJAq7glufZRtBBZIC0kxPK7mJPCjpqM8QQgbkp/kmoReuXF2n6Xyf058pznmxTaRYmRqLi3LUOcaWkIFDdkhtaRtXC/syuO/wvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <327ac154-3230-802c-19f3-b0da21a92dfa@suse.com>
Date: Tue, 22 Aug 2023 17:00:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] x86/AMD: extend Zenbleed check to models "good" ucode
 isn't known for
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <ec9ee16b-71d8-9142-a314-0e782b481bef@suse.com>
 <599d0304-c249-b4f7-3d11-7b40339c6bcd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <599d0304-c249-b4f7-3d11-7b40339c6bcd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DBAPR04MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb285d6-ebdd-46d3-0430-08dba320896b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tl7vsLXiS6loCuPNWa3k0gAlsHTBn+IvQuAnKTEmuDmflt13aEaBFjNeWG5KJY9XJTldIEZl0/3dftZJiCaB7K++th5k5YfLe8QntRybczhdBvdcPk1U2gTVVHtpFA2vmZqzhJaKfAwGxREqzGdYuN9peaMd3ZR7OaPzWFtZH/F6I3uPSDVZ2z/GrltVRnjF4F1hvNGWyey8y+X36dIKyJBWR+AK/8Z6V92koqmIyT/f9T+4h3vBZvYsNEjB3Yp/0ZmIXCOSOYHizN7pEZsC8KGAq2VZW/zU0edjKLzYaodsEpdjhl1uMMhwmCCqqbKaoFuiYNlI2W+HrfRIQvTkUcS8jvV0915L8Fy1Duf9vhK09bMqe1AIGGEbAj1/qBWnnoDt8GPFJ5A6aCFFIs3gu+sTZCTh/vyFL15oddrvNUkZC49kvK+9RZA6p+SeIOAD49B2KfZj2QQGFaD/dbtZ5cBMfm9kjTQEvz7H/8lP/2lem2V2FnnK0kjM+0y49ntTFNd1H3knWK5AuCbJ7mtpBw2UtxaH1tX+qmL6IPr0nTJ+Ut7NOualUSpSkgozcm/eL+cFCa+XFgsXI3zGUJ/14SxoSO1pIBYesukBzxvXFA8s6J/87QyPXDGVYkWVqAyLkTp+m5wMSpdBlhn6KAtmuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(136003)(376002)(346002)(366004)(1800799009)(186009)(451199024)(54906003)(66476007)(66556008)(6512007)(316002)(66946007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(6486002)(53546011)(6506007)(2906002)(31686004)(31696002)(86362001)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHE0R1ZXb3NqRlM2REpvSitkb203VFNEdkgwSXpqWkVRczFhaG16bzluWHcw?=
 =?utf-8?B?cXdENTBMQW14QTZFSk03N3VLd1gwQ3pRUnNwcXpBd1JONzFnemRxUFlRVGhW?=
 =?utf-8?B?S2R2em03ZzB0U3NuWWFMVVR2WXAydGVmYy9BWmZYbkx5MW5hcno0eG43UGlo?=
 =?utf-8?B?UE9yb1FJQ3RneGFRcG9sbU8zeHArTmRFVUduYXdFWVJCTWsrWk04SnFYQTJl?=
 =?utf-8?B?Mk1lTnQxYXFYZGdmT3VUQm9KUFY4aWRJaWYzU0lEVXhIcm9lK25oem1PcGc5?=
 =?utf-8?B?WXBwbmZJMk9QTUkxT0ZVMSttSURxUWg0aHduMytkRnNHaWZyZEE3REl0Zld2?=
 =?utf-8?B?NHpGQUpuL21qQTNwS3pFSDI0OUFITTU5dGFyR0ZJK2JmRHQ5U0dOamVoRzF2?=
 =?utf-8?B?VWZBbnRzMlNJNmVxaGIrMFZYWDFwUHRUVmFhZWRsSFE5LzRLZ3U0TVRyejYw?=
 =?utf-8?B?cE5FSWw1UXlnaktVSFVtS3I1eVVleWxZZkovSE9DUW1temp5RVBBblFqSUZO?=
 =?utf-8?B?RVRrVW95N2Uyc21pdWM3a29TTk55MTNTMXpLOEhlZHE0YmxHa2J3KzN4bXl0?=
 =?utf-8?B?ZDdxdkFRczdIc2pLbk0wVGd0OVp6UHh4R2NTOWxxRHpncXVwV1ByYUhzeDVy?=
 =?utf-8?B?cGtTMmFDZ0NvS2hXQWw1eXVVTldvbkVYV1BISU1CU1I0b3lsakdOa082N2Rn?=
 =?utf-8?B?M3Y0TmpSNUJlVjV5bnJyUEE3cmQxUkRaUzJmMGJjVlFENkVsRXYwYzNITGRz?=
 =?utf-8?B?enZ1bG9TS3dtdWxUdnJaN2Q0b2k2L1lMU1NvU2tMbE01RmthK200bkx3N1Ru?=
 =?utf-8?B?QWVMVU04N2Q2dlVBdEJGeEtPeTFCaWVJNG5zYlpiTGlqQ2RSQ2hMQUpjaFE2?=
 =?utf-8?B?S2tSTHRTdEUzT0UvZ3lRQW1zT01vTzVEaVZGandBOEYzY1orME9lRmVDN0FB?=
 =?utf-8?B?YlJTK2txOWNqd1N0SzZMZWliT2lBNHB1aDZrdEFyUkhtbGZuSEI3dTN2UzZk?=
 =?utf-8?B?U2pLUjEvQ2VPOXJjRXpOTTlUc0NFQnhIdFZqWXJqOGdLWUZXVm1UZVJvcGgy?=
 =?utf-8?B?MEg1S3BzNlF5aTlOR0VOb243QVZYV2JmQTZhWFBjd0REVU9qT3E1Tk1UOEZl?=
 =?utf-8?B?MGpUOXlnQXYzSFdmRHJ1aTcwVEFmbkZ2KzI2WjVsc2k2bXNyV3dCQ3FPVzgx?=
 =?utf-8?B?Y2FlRjJRK3k0OWt6WUo2c0NFQlFoUjRjVVlINnNVSG14dkg5RHVsZ1JQSHFR?=
 =?utf-8?B?UkZBTEsvU3BjOE11eHFqODRLWDMwWVo5Q3NyNnJ0VHBUalRqd3JrMUFtV2RQ?=
 =?utf-8?B?bUVLL2VxTXZRd1NrYWx4VUttcVFrYnc5YXpnWUI1VE1sS1loVTBXNGd4YTMr?=
 =?utf-8?B?UjU0UUVMMzVxVWoySVpLMzIzdHZSNjA0UFpyNzUwQ1AyeExUN2tQNmtFZ2dt?=
 =?utf-8?B?eExyeGJXQXhZMmE1OW5uU3lpRExCbEJNUTVxWU0yOFJMc21lQ0NXdU5vbkM0?=
 =?utf-8?B?UWM1UVYvUk82OUI5cXBGa2ZuUmFvSmUreUlCOSs4aVVxSU9haElKNG5MSXg2?=
 =?utf-8?B?TW1EampmS0VwQ1JXVFZPZWlBeExKdXVOUE9JbTN2L21YcDNZMFYxRi9KaFcy?=
 =?utf-8?B?NkZ2cFllN1loeUt0MjRWZksvRUZTMGR5V2F0ajJZNmwxc3dTYlBYK2xQZDJB?=
 =?utf-8?B?KzBodXNsY1FKMmRwU3ppQTFYRmY5TUFtK1lqV3Z2cWZZQW9lRTFKYjFrUnJ2?=
 =?utf-8?B?TEJ1ZTdQdHd1YjNnVXBrR2E5QVVHcElyVDZOM2lwMXc4Z2RjMm1Db244M1Rm?=
 =?utf-8?B?SDRzMmxWbWc4ZVJoSXdBc3ZWb3VmRHNNSkxNNDYrN29iZXlGMkt4dTEwZklu?=
 =?utf-8?B?N2VVc2p4d002TCtIcFhXRlRlWWFvTVpaZjNJRENDNFhycU1Oa3BObWlQLzZv?=
 =?utf-8?B?eDU4OVovZUdEYmV1bHdrbGkvTExqbjdXR1ZEeEVsei8zRW9tNUZ6ckRRZHhT?=
 =?utf-8?B?aEh3bitGQkRvZG5UdXEzN3NBMTBhVHdvQmF4Q0hrZ2V3TWJiSlRGd2FMS3dL?=
 =?utf-8?B?TVdEUU5sZEZUaG1BN3ZaeWU4SEdlbktiaDRzYWhyeXhFSFhvOXovUmxsMFZZ?=
 =?utf-8?Q?CDPD+DxgdPtkcpMF05G0FAgva?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb285d6-ebdd-46d3-0430-08dba320896b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 15:00:34.4250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YPAYkpeNqK68K1bXo5L3/2NWNLbVqR1jT72a5MBU8Yh/LbFUUeZWqwolH0lf6GQxNc/z5djKxFIwm1NltQ1Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7333

On 22.08.2023 16:53, Andrew Cooper wrote:
> On 22/08/2023 3:22 pm, Jan Beulich wrote:
>> Reportedly the AMD Custom APU 0405 found on SteamDeck, models 0x90 and
>> 0x91, (quoting the respective Linux commit) is similarly affected. Put
>> another instance of our Zen1 vs Zen2 distinction checks in
>> amd_check_zenbleed(), forcing use of the chickenbit irrespective of
>> ucode version (building upon real hardware never surfacing a version of
>> 0xffffffff).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -936,10 +936,14 @@ void amd_check_zenbleed(void)
>>  	case 0xa0 ... 0xaf: good_rev = 0x08a00008; break;
>>  	default:
>>  		/*
>> -		 * With the Fam17h check above, parts getting here are Zen1.
>> -		 * They're not affected.
>> +		 * With the Fam17h check above, most parts getting here are
>> +		 * Zen1.  They're not affected.  Assume Zen2 ones making it
>> +		 * here are affected regardless of microcode version.
> 
> It's not really "assume Zen2 are vulnerable".

But that's also not what the comment says. It says "regardless of
microcode version".

>  All Zen2 *are*
> vulnerable, but we keep on finding new CPUs that AMD did for special
> circumstances and haven't documented in their model lists.
> 
> Furthermore, there needs to be another sentence:
> 
> "Because we still don't have an correct authoritative list of Zen1 vs
> Zen2 by model number, use STIBP as a heuristic to distinguish."
> 
> Or something like this.  It is important to state that STIBP is our
> model-heuristic here.

Will add.

> With some kind of note explaining what's going on, Reviewed-by: Andrew
> Cooper <andrew.cooper3@citrix.com>

Thanks.

>>  		 */
>> -		return;
>> +		if (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
>> +			return;
>> +		good_rev = ~0u;
> 
> While I hate to review like this, someone is going to come along and
> swap this u for U for MISRA reasons.  Probably best to adjust it now.

Oh, right, will do.

Jan

