Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA766FAF8E
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 14:00:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531471.827178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzXH-00070c-N6; Mon, 08 May 2023 12:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531471.827178; Mon, 08 May 2023 12:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzXH-0006y3-JZ; Mon, 08 May 2023 12:00:11 +0000
Received: by outflank-mailman (input) for mailman id 531471;
 Mon, 08 May 2023 12:00:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvzXG-0006xr-0b
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 12:00:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0c40356-ed97-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 14:00:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8509.eurprd04.prod.outlook.com (2603:10a6:102:210::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 12:00:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 12:00:06 +0000
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
X-Inumbo-ID: e0c40356-ed97-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWaarnc7WHtr7skPNu0spU4YFksv3ExLcY+5q1UpCD5HsHzSq1OND2FxcjKoOiONeLy7syofS8W3bUWLafkpnbTANhDXzLJTDont1K8hlEF4RafyBE2Cef227MbJSsG/OhGmCJmg2u6K9B8bOSrN9KYMYjZ+cCuK4uVTi9njNKtQKYoYIu4Lu5VV8b7hGcIfqYodSqGbyGGqkJCcMS/gWRqyn+Xb6m6uDdNjoM+sdnJADEnV/kBIEKW2PrF1h9Qxpkjd+x9sXIO1JHiYGc3yy6ek5TTBfAyuqeCWVbd9qKJst3wBK8OIk8OWU8RaOz7P9GYetnrqF7jhwS2a4sxnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4M0gQIPPWYu6lNbkmP6JNCTOctzFQmfMgVZacHhWJYc=;
 b=YKUJ8BH9tHGliB0FlMrj0Pi/THqin9aP7QmmEJ62WgI2viDyyjVEH6Gj5WSFsjBXwpN5bo5g9Os5IsnDTlWLygqHw62p3zeifiMbWaPB+0ZqTsqJPl8VjHGN/3H3rFJziq6acbXuV8bFmbKnrD/1/qz39kK7VqkD0ul5LKphCPDBgmmBzShqcQXqnlZgzQ34x+ofbvGIPE86Qg1+FLK0fh6GLDZ7z80krkptmNu3s1/ZGfARIxs9eQODJv/16DPh5sMntS97Clx1x3+Q1zVljnaH8OnGpQoBB8q7HKOyt8sgynxJ0eQsylfR53/X9rvaxhTvrcIYJbcQ61PCs1XGcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4M0gQIPPWYu6lNbkmP6JNCTOctzFQmfMgVZacHhWJYc=;
 b=sY7bmbQ1RYJqjvbxdVPK14hVVbewwh67RX5CQTeTRL5xs77xOQETlRntXIyeKYnj18+7D2cID4InxqCr8LYYXSmViiSdT3F4jf2UfT8ne4N2EvVhZBRRPgGa4nFl1h2cdkllYihDQsrk0j9bFR5vriV/qxu7xJ53LB+8fqf3S2HKPce9tmIYoNsUVysEx1/GEVCtzWIAyB12PrpRg7z+A2JTDiFECSrIgjwy/8LWxMVfwGwWZGO0X3GlLeBcelxHbSCfqtAyh45gqPisEDILk1nyHGs4KeQIeWjgfyFXKHYpEY2g/z42oXA/hu2XvQr8lFFNDh/RPuOqpgLc/dAZpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f0d8b88-7c5a-670a-c966-2fd7d764f2fd@suse.com>
Date: Mon, 8 May 2023 14:00:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 13/14 RESEND] xenpm: Add set-cpufreq-hwp subcommand
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-14-jandryuk@gmail.com>
 <46c46e0b-0fba-2f3f-6289-f68737a3d8d9@suse.com>
In-Reply-To: <46c46e0b-0fba-2f3f-6289-f68737a3d8d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 7272546f-c7b2-4185-2bb9-08db4fbbc3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vk+B0341oYyBOx0QAsfOSVU0i/sLt1hsazBr8PObYvW+QCO23wpXfJDhjUnPJztldkczpyg9rs+s5ilwtUsM+oDOxmY6H+pA1RGxZjOakU9NBXzCIYChlHzp2TtsQsyJjBk8KfVr8tYVLI+CPfWn+Tqr+Qo8ub+t2xtpwK65SzpTwreDpJai0mtAG7dAxUK5CwGkAgPsT0KuQbpYQw6fxEpVXOslrGnClGx4/sqS4i5EmYTiUgADCDCM9ldoC5v+hOAGL02jL3FGazMTGrAAQEN+XUor54FkMbEESyV8kjWxQ+QV7ShhnfoO9Mle0VS4J40xrRtv9n6TX4O0UczxtkjhwNQ/Vujxc2R0358NEyfvYiZUlGScDokqby1ddycZI6dTKAIJ+T9ilop9MpTuUnIRJ3GdRoyKhz0Af74esrjqU8e81W1tL43yzqXA312v4nZKU9Zf7QCqcZuL8dbvht7xHq6Z4I6ocTsObKC08GUNi5mFc2PNIBNlqLSnVYbt03nNgRwlfMembtt2XLzDpTiA2GwbPl6m6ZilJnTU8JjoBTM1GXJbOc6hOXuY+DF//seTFCA3Cl0oVDdPx9bYKytH/b+Qrnvn00vnLBpKwsZqcs92KxhbGM1gr45V2NAQ/yc4FbZVPGyIJujYqszQrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199021)(6512007)(53546011)(26005)(6506007)(6486002)(36756003)(2616005)(38100700002)(86362001)(31696002)(186003)(41300700001)(2906002)(54906003)(31686004)(4744005)(5660300002)(6916009)(4326008)(66476007)(66556008)(316002)(8936002)(8676002)(478600001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEZLenRpd0J3cWt6cVdyQ3JDbHVIaFBnMkFkOFRReExId2JIMVlBaGd3b0pN?=
 =?utf-8?B?T1EzUnFFclExZWY0K2lBRlJBQ1Y0RjZYbmpYaUJKYTlyU2JXTTJ6VFo1QTVN?=
 =?utf-8?B?WDd6S1hwdXFtaEsxVFd5UlYyVCsrQi9OY0RJVUN0aGJQVEh6WFNjWHpsNHhT?=
 =?utf-8?B?c3NFQ2VnZWh5MHFiWFY2aWw0NG9MLzhTZmRUSm5yeXREaWxXdm01aFY2MVBx?=
 =?utf-8?B?Mk9Ja3dqRjJmeWdBNVNZZDMwdDZGVmpPVkNHU2NUSXdVRmthMjBaK2l0R0o1?=
 =?utf-8?B?eUVsZUFYZytVZHRYbHN4QXF4dUxUbnU2UktScysvdGxuYnkyaHlWN1dKN1FX?=
 =?utf-8?B?MEgvRGQ3cHVQT2doK3l0emMxc04zYmMxdWRpalpPTHlHWFhEM2xURzhyY1Ux?=
 =?utf-8?B?WFZjOExQb2pxVkRHRXhPWGNJc2huUklNc0tnSXc3eSsyWmk0amlaZTg3ZlQ2?=
 =?utf-8?B?b1JVZnBWSHJUZVloRlp4RHNGQVA1aXJkYm1jVG1PNm1NMVdJL2VncHB0TTRm?=
 =?utf-8?B?WFJGQU5YNTdhNGlIK2RZSDZud25KYnI1aDNSRWhsSmNxV0Q1U3NwTWtMKzVr?=
 =?utf-8?B?RVJvOUFHRFJ0YXJMNThZNVorSUJJMTFNUGZRT0dHeUZIWXNNSHR3RVU1eno1?=
 =?utf-8?B?MVRQdzhpb0RVZ29xaEY2M1lPK0NjOTQ0ZnArbTFmTVcwcFVKcnF4QVNiTEhh?=
 =?utf-8?B?bUhydnYzaWZuVVI5S3lKN1JTazUrR0tFSmtqYVlLUUF1YzBpMGtFVkxzeU9t?=
 =?utf-8?B?am5BV0I5bWQ4N0wzMnpGOUowSUgxa0NmdTRjZVpoOTMvY3lQazBWTGdIYjVv?=
 =?utf-8?B?Q1BldnFLNHpHWG1PSWI0MGFidTl5UTlheVh4anBpZWRibitiN01zcFQzdzFz?=
 =?utf-8?B?TkpHQVN5MTB6NjNMckxEMXh5R3YvZjd6czh0MGRZSjhHMXpPVGZibHhMQXdQ?=
 =?utf-8?B?em9vL2s1RVpkSnJtNzJRZnEyS0lucWlTd0c4ZEVlY0NrRS9FdHZONm9QcEQ4?=
 =?utf-8?B?bGEyT1d1SEdWOCtZcWI5azBTTXJFZjcrczlsNlJYb2tOK3R4U0t6NjY4YXdi?=
 =?utf-8?B?SUZnUDZWNnhmT0pJOEdaY1lzYVZjRE5Wb253SXpuMUpkekdZMVVrbkZvaUQ0?=
 =?utf-8?B?K29lazVmV1RVY2pZTExlVndJay8vM1NTQ1pWMnRSYUNtWkNxZjBvd0hYSTJn?=
 =?utf-8?B?bDlkNnYwWGs0NzVVK3FmVXIvOU1vM3pGOFc3NTl6R0ZwUFBsb252TFVOWnBJ?=
 =?utf-8?B?UCt0KzExbHVLa0pKbFo4TzEyM2FLcFdoSnpLNG5LVk5mdjhaQ2FWTEVQTFJl?=
 =?utf-8?B?QmtDckxtZXhHMVFmdGRpTys2UC9SOEozeFM0bTc0aC9Zem9GaG9lK3I1Zm5R?=
 =?utf-8?B?ZGRBUktWMjB0RlNRWUZxOVBuOFRYOFBYTDhCL1JQcVc1TFlYSVdiTmdwcjVZ?=
 =?utf-8?B?KzVGZ1NmdVdOSFJpUzJNVjFFSnFvZVNwdisrZU16T2k3bHZNZ3Q4b1JxMkZJ?=
 =?utf-8?B?U0NFTXg4dVVrUGNhejA4OGhDU1RnemVERENVd3NLVVpYTFpNNGtaamNDOExS?=
 =?utf-8?B?Q3liRWNHVVA4bVFmenhzL3pLQzdrbWRlZG9ydXlpSk1TSGc1SjVvczVObk8z?=
 =?utf-8?B?UDkyanI1WGhHbFJTeDRUSTdvczRWbXE4T0Y0aHhTTmxHUms2Q2F2bkUreGoz?=
 =?utf-8?B?QVcwdzZIYVNScXhyZytCK29UZHd6b29aYk1SZDdtOU13UGs0QlFEbzd0TU9j?=
 =?utf-8?B?QXJOSXd2U2dKMVJuWUtmRG45SUl3NnIvZmpDSHB6ZVVlekNrMCtCSWN1b3cz?=
 =?utf-8?B?WnJDeXcrL1NwTGtHKzJTRjRvdUdhMGlycTVRZlN3QmJNc09jVG1XNStyUnJT?=
 =?utf-8?B?cU1BWDVjZDUyaFAvSGh0czAxNk0xUmFpTFBHdW13RmJnQ1JVdnhXNis2c3Zn?=
 =?utf-8?B?MlgrWml0NTF5QlVTaEhtcmVyV09zRjVvVGtyb1FjVVg3SWYvdHA5dzNmcWFJ?=
 =?utf-8?B?eENEaVdUOVF2WU5nTFVjRjNqa0o0RUliMExBWnlqazFBcFZlTS9TaFREV0JC?=
 =?utf-8?B?U1ZlbjFmUUdyc2ZaYy81cExZdTl2T0dRSkU4bG93UFJBM1A2K3BaZ1NqNkYy?=
 =?utf-8?Q?eNVF4LA/RJ85OomU8rwdr8zuB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7272546f-c7b2-4185-2bb9-08db4fbbc3ef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 12:00:06.9052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kerhk2eflNk7jvrzRSOBQIs2NbuhSlSSNr193ww4zNRLKVCRl/hY31WR9obtxsqmeOeZe6sE305zLJtDeC7Fzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8509

On 08.05.2023 13:56, Jan Beulich wrote:
> On 01.05.2023 21:30, Jason Andryuk wrote:
>> +static int parse_hwp_opts(xc_set_hwp_para_t *set_hwp, int *cpuid,
>> +                          int argc, char *argv[])
>> +{
>> +    int i = 0;
>> +
>> +    if ( argc < 1 ) {
>> +        fprintf(stderr, "Missing arguments\n");
>> +        return -1;
>> +    }
>> +
>> +    if ( parse_cpuid_non_fatal(argv[i], cpuid) == 0 )
>> +    {
>> +        i++;
>> +    }
> 
> I don't think you need the earlier patch and the separate helper:
> Whether a CPU number is present can be told by checking
> isdigit(argv[i][0]).

Hmm, yes, there is "all", but your help text doesn't mention it and
since you're handling a variable number of arguments anyway, there's
not need for anyone to say "all" - they can simply omit the optional
argument.

Jan

