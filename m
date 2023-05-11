Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FED6FF1DA
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:50:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533366.829963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5jX-0001bj-Go; Thu, 11 May 2023 12:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533366.829963; Thu, 11 May 2023 12:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5jX-0001a3-E3; Thu, 11 May 2023 12:49:23 +0000
Received: by outflank-mailman (input) for mailman id 533366;
 Thu, 11 May 2023 12:49:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px5jV-0001Zx-Rf
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:49:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f519024-effa-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 14:49:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8549.eurprd04.prod.outlook.com (2603:10a6:10:2d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 12:49:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 12:49:18 +0000
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
X-Inumbo-ID: 3f519024-effa-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2+81VKc7/LcpK5BjKBRNN9DH0YIygbDezTzyJ5pIWX4NC7QqdfpchBgM0whqe/Rm1XWc1l2Z/ACoFIW3o11AyqDblk4BBCB1MVqd9wmWrpjcK+1b4k24+MK88HDPdo5mXnb8ltCH8/lkGRNNWuYncgebw38Bt9JZZfHrHns+aXbCvxNsEotTcxnlCyZnbS7Zefu5mzKM3zaU2tI7CsIUMDa3bctK1YT8m5avVK8xOEVqq0aMuSW45wjhNZK6Dm3j43AO8WAZcvQF4ZvIhvIon2pt+XkFrqVe2AOwNTe7M5+fHqh8J1JyREUX4bPUSpTdNT1WsLMAtFdEuNm+X5IVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQr4reaGCJlX4uKI3hEcVgTD1SfoXUe/v5PK4yMw4vI=;
 b=P5qrgFAGO7s35CdEIx9Syac03d/Ueg87iTe1AoDQKuJr6fYljg7D1TjDVLYl1VyfBcYaxOp5nciJGacl/MQ1h5rlSjAxRS0E7fgRgUePUoklUVo/3rS17lL2GYnRFgRoeo+QS8yiMfEC1+ec/bAhW+Rk8uejfDlDHiLelIbttGZyXNBIfih1OUcv8qFB5qBAuv/kwIZeyVLfljkksDILZli7HtKeidxHebHIfvT4sUKzts0WbsYWH+LX2PzV7aszV2meHoKQBCJCn/ZYZlf1t2HaICQyWD4CUtLRhg6NLojpI2Rx21xlwicjvgnKhP2fOfOKukRQHn+GqNXn9fplGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQr4reaGCJlX4uKI3hEcVgTD1SfoXUe/v5PK4yMw4vI=;
 b=XjDZU71abTj9I4zhOTgbOaagkkzSl+CyzpnkAeZVHX0IOdeOAG+yeNzOsBd/9wB8coEbCVg8xDSIb4Tpz5dwhAT3VWj/l2rhm2SzClu4ivASTdPxW8tDgdZGS83Z/Fp+1TEVk05UVjPcPJUKfQbfHWcF/GW+NFCxiP9rxVuPl08pOJ6D3rx4c9WhOXiTKs4xRA0q2hqnlro7u+60Zg5g3L7rG8474PVfRRgwId4l3Kgr7DO7exP5JJO4Ps2qkK18BX0vsSg8dm5PY3PuCfcGm9rYm1NzQoI9WmxuW3xd/CLkeeL9gjxCC7kGa4zuIZRUOGvsQ8A7HneU7jRHsI6sKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c2cfb758-4055-d25a-2971-10da82439b27@suse.com>
Date: Thu, 11 May 2023 14:49:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/3] x86: Add support for CpuidUserDis
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
 <20230509164336.12523-4-alejandro.vallejo@cloud.com>
 <1489425d-7627-30c6-bb0a-ca1145107f42@suse.com>
 <645cdb9a.5d0a0220.d3a29.e895@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <645cdb9a.5d0a0220.d3a29.e895@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e879e44-8ee0-4034-49ea-08db521e2235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+AZkjRQD65YNB5HUyywi4HXw/lpQhYtUI1JPjwe8+X1CN9+24GDNcbCIr183LPKno4k7rOlPBMGYAxxJVQeEExP5x6XRbBJACb8WBBpXV1swe+wNrJ6kNz9V+Oa5geNr7jyhs/1pvDtJo/9XSxWnD+t2rp3VpjJSpTMRQzjIDyGAWj3cSm41p/+4kYnFBTDyK65fYrWfxtte5rkJCiUEQ8anawzmwfFd25qoALhvL2rkomUJk3YJIHHXTSOhRgaZFBz/abO0soJFwYh+ZeNhOURwuNvEsuv4dclsjhz+BJogwNDbBe8OeKekHVOhfzzkffU9S6/tx+1H5Kdd7xz8fVb5M1sVi5VJXKsNq11iKY4DPeClp9cAbwr8eERtvB6lM8iTXYlQCdgxgSO9KqUa2a48TKvuI9G5ek9/+xOyekd1WpL/jq6RdF7g9+pj3Hpi/lRV1bxmrIvecvPQ98K/GnrXVkaT0UYk9oPvDFgZQlxfxpz8k6jnjGSSvM3Ylcg7Sy/cy6rmoht9twxCFn/+Y5iXPgt388D9tAPXMKR2rK1UQ7z5eO1d30ZJjdM85Uta7cnnDK6wMEhfxvo9NxZOIh4U9hy6ygS/KHVwZEQyHUubZe5pzAw/NQCHKCGuhQ90WDDwYUUNVmUR0NuhhTknYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(66946007)(316002)(66476007)(4326008)(66556008)(110136005)(54906003)(6486002)(86362001)(31696002)(36756003)(6666004)(186003)(478600001)(26005)(6512007)(6506007)(53546011)(2906002)(5660300002)(31686004)(83380400001)(8936002)(8676002)(38100700002)(41300700001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk1rcC9aeHdsZGpZcFZ6bUZuRGpVZTg3OFJhVjlYbVBmUHlqNmJqeWlNeXA1?=
 =?utf-8?B?eDlnSnNTT0EzcktlRnV5b1BwaUtickJHZVVNcEcxdVFmQUFVcTlHMVhXWFVl?=
 =?utf-8?B?cjBCSW9POWtYYXJ0R3dkMXlibmJlc1JCZUpFNGRuYkxXQUFBSXczM0lvdGJt?=
 =?utf-8?B?S21wZi85WEVDZXNtUHZGSnN0VUh5b3ljL21ISUNXM2tNT3MrQjVhRlJoeTYy?=
 =?utf-8?B?c2JDUWVDQ01mbUUzUkFRdzAzTmFEdlBlQWN6aWwyRldYczhUQWh3VTBXcnRn?=
 =?utf-8?B?S1RPM3ovVW5KTXpNR2hOUzd2OFB4aEVSWHp0ZXA1dUhSMDBvSWlSaE05a1Z1?=
 =?utf-8?B?eWMyQ2UyU1BNRzBIOW5ncU16YVYxYjU2VjQ1RVlTUXA3TDVKMUJoVml6U1Zo?=
 =?utf-8?B?NjRIWmpqZjE1dHNTeWhoM2NFdEhuK2cydWhXd3piV3pRQmxZU0JzZXh0b3Vz?=
 =?utf-8?B?ZGpxaEtkbm5MRTkyejU2L0FoQ21xOTFHVFRQNWlRc1hJdW9uOThycHZPdGpY?=
 =?utf-8?B?blFFMTczQVc5ZFBISlJhQUIzYVBkMWxMYnJxbnZ4Q1dWZTE4WlhyTHNaWG9j?=
 =?utf-8?B?eVBHSHJQT2J1cFhoZmI0aXlpdkkzSEVGMkdRU0tKMENjMzVML2FydGZKNDJS?=
 =?utf-8?B?dVYwV2hQUFIxcnNGdC9OcCs5ZXJaa3lMNFExazJXcjBJNkpqblFSbWVCTnJW?=
 =?utf-8?B?eS9hMjY3WmlvcjBCNkUvNXV4T0lOVVE0cWF1K2Era0I4L3RiTWkrOEhHeDBT?=
 =?utf-8?B?KzhBRm13a2ZKWlZRWEVwSzFRbnJmNndVVUZHaVpxR05HQ2x5Z2EyUjBGMnYv?=
 =?utf-8?B?WHZ5WkdkdG5WWGpkSkxZU1pzeGRpZ3ExY2ZrRzM4TEdGVk5wUUNESUx4TTZY?=
 =?utf-8?B?Ym9wQThsb0JySjdQcFJkQXZIcmh0YTA4Z0ZabXpkL2w2UEpVanNnVHJzVXlE?=
 =?utf-8?B?cG5PWThCUUQxQm1rcDgxS1NwdDVMcDgrd1dCNWp2MnhKZjBKdW5iNG4yUkZp?=
 =?utf-8?B?cmxTTWxYTGpCMS9Qa0xTSnUyV01VUWZVaDhrbGNveGVhVEtuZ05vSXZjYy9G?=
 =?utf-8?B?cTNPZ2JOcGVIQ1ExNmREcXRYdGFkeXNaYjhyN0ZQdVVqQ2IrcTlCa0lzZS9N?=
 =?utf-8?B?NEw1RjJVS0tkQ0xIWWdEYkkvTHBzUTVpN21XcFE5TW9mL05ZNHpZaFZpZzJh?=
 =?utf-8?B?bjEwbGRETU0yMTNIcjUxZ1NjbTNwWTRodjdLWlFNNzVaSjdJSjJYbVhOZ1dm?=
 =?utf-8?B?S0FkK0szVE1VSEEvRHp4cjdTK0xraVQrK3NDc2Q2bUdwZnlDMFprdWhsM1U3?=
 =?utf-8?B?WjFrK3NKQnU0bDV5emIvbmFVZ09kKzNZKzVoRHRyYXM3V3hzODFNTUFrZlZH?=
 =?utf-8?B?azF5YW5KRktQOHB3VXRxb0k4TktZUTYxMnhUVXV6ODU1Qnd4ZWtDV0NrWnRY?=
 =?utf-8?B?SEQyZUdBMi9LalZHVThtQ0NyZXBRcGp5RmdLdXJtdE1wdGZ1bmx2bTk2Z29I?=
 =?utf-8?B?VXQyZkVORFB4V3RLUU5vdGVxMVVJNVlnMUs2WmgzVDFhQUtvOXIzaC8yTGUy?=
 =?utf-8?B?VzB0NU1rVkNndWd5a0k2UHo5MWVmM1NvTlk2NmVzTldFaVhmdEhXZ1Q0d3pn?=
 =?utf-8?B?VmxySG5qbnNDV2Iyd3Rrak5EQmFWQ0ZoQ1ZzRUhVS2dKSGNXVVZwLzZPSENl?=
 =?utf-8?B?UWtDRXVHcWZ0WVNkVEdHdkdNbTdpRlNQNkpVTW1MTlVRaTY4Q09FZjhOdnFk?=
 =?utf-8?B?eEVpdVZEVG1HcjNuMC9qRHNDT0xzV0RCZVdlSU1QdVA2WDFMMjFnalhhS2V0?=
 =?utf-8?B?QlhaalllSjFENmdvZ2huMERxcHFDWUN4M0xZcHdodDd6SEZiL2tXVjVCV1dD?=
 =?utf-8?B?SU4yUXZwWGJuN2FFRlI0Q01yNTFleEZiMXhNeWw2ZDBmdEkvQ25XMDFOZklm?=
 =?utf-8?B?NVlkbUU0MS8vSnBEQUI5QUFWcjRFUXNuSU5tY2hjbjA5dU02VWRJRXpFSklQ?=
 =?utf-8?B?aXlPRE51ZTMyY01rMmJPM1V3aU4yOVpBNFJFSDM5QnpOTXNtTDNoMkZkVHgv?=
 =?utf-8?B?cWYzWWpPNUNKYkpGNDJpZExGN3ZsMzNHTmNWR3BnR2hYZVJHKzJtOWhxdDM2?=
 =?utf-8?Q?+SjJPVhUKPfpg506yx2q/DEM+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e879e44-8ee0-4034-49ea-08db521e2235
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 12:49:18.1649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uq81c9B1LzSofryAV8XZqzH+X3eMzjWa7PlI17hGZnwWRfJL4f0yIzTC5z8vCutHiyQLeOLUeITnVhZ0xPT6fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8549

On 11.05.2023 14:12, Alejandro Vallejo wrote:
> On Thu, May 11, 2023 at 01:05:42PM +0200, Jan Beulich wrote:
>>> --- a/xen/arch/x86/cpu/amd.c
>>> +++ b/xen/arch/x86/cpu/amd.c
>>> @@ -279,8 +279,12 @@ static void __init noinline amd_init_levelling(void)
>>>  	 * that can only be present when Xen is itself virtualized (because
>>>  	 * it can be emulated)
>>>  	 */
>>> -	if (cpu_has_hypervisor && probe_cpuid_faulting())
>>> +	if ((cpu_has_hypervisor && probe_cpuid_faulting()) ||
>>> +	    boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)) {
>>
>> ... imo the probe_cpuid_faulting() call would better be avoided when
>> the CPUID bit is set.
> 
> I wrote it like that originally. However, it felt wrong to leave
> raw_policy.platform_info unset, as it's set inside probe_cpuid_faulting().
> While it's highly unlikely a real AMD machine will have CPUID faulting
> support, Xen might see both if it's itself virtualized under Xen.
> 
> The crux of the matter here is whether we want the raw policy to be an
> accurate representation of _all_ the features of the machine (real or
> virtual) or we're ok with it not having features we don't intend to use in
> practice. It certainly can be argued either way. CpuidUserDis naturally
> gets to the policy through CPUID leaf enumeration, so that's done
> regardless.
> 
> My .02 is that raw means uncooked and as such should have the actual
> physical features reported by the machine, but I could be persuaded either
> way.

I think I would be okay if that was (in perhaps slightly abridged form)
made part of the description (or if the code comment there said so, then
also preventing someone [like me] coming and re-ordering the conditional).

Nevertheless having raw_policy populated like this seems a little fragile
in the first place. Andrew - any particular thoughts from you in this
regard?

Jan

