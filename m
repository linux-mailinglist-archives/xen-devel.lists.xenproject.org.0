Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFAA5BE162
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 11:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409241.652207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZDi-0002FB-6Q; Tue, 20 Sep 2022 09:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409241.652207; Tue, 20 Sep 2022 09:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZDi-0002Ca-3e; Tue, 20 Sep 2022 09:07:10 +0000
Received: by outflank-mailman (input) for mailman id 409241;
 Tue, 20 Sep 2022 09:07:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaZDg-0002CU-In
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 09:07:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99c5bd9e-38c3-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 11:07:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8203.eurprd04.prod.outlook.com (2603:10a6:10:242::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 09:07:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 09:07:05 +0000
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
X-Inumbo-ID: 99c5bd9e-38c3-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuZ74EOo7YzVFADJLFGxSVuNa/c0ft1HXBVTslWIYoC6CeAdOD8r6TTmFYRQpLamsG6GSGY+gwfbS1LzAnDKTDVBVu2QeQvCFDvyO5FJRMOtfqxLyHO20TD2kWl0rBRrXy6bKwkwQgyGQJ4+Y6WIojQzuhBpDX6zyJkbFEm320CHOMEIZvKYMDTvtE8xJGO815IQvWD4TscLAs8pbkVDfc119KB8RU7k2d8+1yPR+muPJOSEc+CpZwV2sUolD8O/bVxygnwqHrdk24Ntu0QZQiFiPEf1jdTp9XW9N1P5WBCa7dxEstlYWmImXO3fW4Uqomp+mnlc9xvw9XyOGHJ5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qAbSEm/Qjj9jInCq6Is7HEVCi/CM2NsVKwGUyl4Gd4=;
 b=b38WTEUxrgNyz9R6pZuavjftw6plLYfVCBqyrnpCT+9ji6fdFU/8FNGrk0+w9yiwHEbEXJHL9N1LImigyctwINUs2a5uEFZQIvUVvv8I6v9LEqf1WkYhYx0/gKbwW/1qn6WXIfNI1LY3VpHDh1RG2FfKHrzJXUK+TLs11ZwcU0zG8BcGAYNEWB7TMChDaT/Mz/k44t0XBa8cFykJ61idXxgftYoJb7M7+YWUM2VipcnYmgeheaoB3nD+rS0DHzCs8kCtGxBn3FkCf3/S4pA1Qyt2ddGUckIkJu2LjmHAOoDfhCV64ByIzEQC/ekMcPf/OPP75JTJnNLXzqPXUBp/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qAbSEm/Qjj9jInCq6Is7HEVCi/CM2NsVKwGUyl4Gd4=;
 b=pVOxzn/E2EE7036WOub3H8ZxhYdQaragkEubS6QR3QC822ZOPGPj9okm2se1wRdKdhuC3O7N16x5YFATwSpdGqL2CRG6kxwK0dovLgS3sRo2ptey/U3K94B10H/3duSrbvIYM+IoM5VwHoV9bpXY+wlgkNqST/QFPNqDf3yNgu0KWDDyc0IjyFwiNwYPFv/fP4uCATrTLvBMPPVOoQJGXno5u0aZNRdvmBsmq5OSwmPngijILbLreev3oi1yk36K3QWL6lB+BWwZOsTSZHS7+H0Zc+5g95/ck8J9i94NLuN1V1Ae09vqhJR+Fhs8QbIk6ITKMhqdQVt/1OChS/2GzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a0f02ef8-d93e-6083-a0b7-c8dae8905ada@suse.com>
Date: Tue, 20 Sep 2022 11:06:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] xen: credit2: respect credit2_runqueue=all when arranging
 runqueues
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220919150927.30081-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220919150927.30081-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0639.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a47c5b9-7289-4f7b-35cd-08da9ae77cd3
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EvQg2w/6uh9ECFcRSSlE3uqdvztH+rassFrKUroh3534Rb5GL9jxTUbhz6riZr0JHX520DtDzs/8wL+/fxq5D/NgSnKcXMQ5jnupxMs9XbQ32jYH5QnymzOPbsw6tdHmtRpfoEwOCAUgRgod7bC2bo+RtUsmXr5K+CYDPIB2AOraepwMzvV4sC6TZqv7xeQsVGCsqt3K/BVgYcM2bJHiAKFzjU1fJenVENfCb/CssqnifhhiAWdBz/cLKU9mug/+ODS5/ExlZdvw3qdQjXEEs6Az5jOcrowMfiwbWkoIhmuRfD5qnH47//9yqlnhm/6apvapVdy+vCIgn2dmaT9zYLGqoC4vzXYNBnDC4hdTpzpfMvJi2XSbYCK8LzkuYLA5dCnxHR+rdPuJxtRV0Kd/sivULqsUH48gP1vzHGM9FhH53XxrGjVJEhjBHaRjWZGq8G5Ss8KpQLDH90U+yeMY1mg7hJ8MYpUthOlQERjViX0IlwY1UroTDL3kX4aXerjnmhLGAbBTOigpazlnOYKxSQbC2lUYDA1j/KiAwoHYFtg6B1rqtVFZCA+lWpBYFN5tjZfyZ/jJ4Z6EZ2uWUhKTui9RjUV7JsnjJjmh0mtjprzkTaNk80KpjNXkpDmGMSN8LavyinjWtl57xNGu8bPLMoXyn60OV6SwQd4c5rq6LxmiICg1Fa0aL/+cwqqWanhm1LNb5QK3yHWd6wkEURZLq0S0A2MsS03UpKnNSGoAZn0T8VWSUwG+TFs+SrX9lQ8wkddrXkUmgS0NIJ/KzxZuLX8q9y+hD2ID8oBsi/IK5rw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(396003)(39860400002)(376002)(136003)(451199015)(31686004)(36756003)(4744005)(2906002)(54906003)(316002)(66574015)(8676002)(38100700002)(4326008)(66476007)(5660300002)(66556008)(66946007)(31696002)(6916009)(8936002)(86362001)(186003)(478600001)(2616005)(26005)(6512007)(41300700001)(6666004)(6506007)(53546011)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlFLRmxZNTlDMmdHUjRmVURBdjVaanJjckFSNEo3OU1qOGl1VmhhMkQvMzB1?=
 =?utf-8?B?ZHJZaFdWR21WWFFwRldZTTJqaFJRcW52eGJOVnRIeEtUeng4ZVhiVksreSsx?=
 =?utf-8?B?Nytva091NzdkdzRDRWwyNVVBNm1MVEZxWmNYSW1uczFuWTRWWlAzaHIvZXNU?=
 =?utf-8?B?czFEVHZBUVdSMzNOZXZUa01vNWowZ09yZGhzTlVBZk5sRGJNV2E0T09ucWdD?=
 =?utf-8?B?dXN4cTF4OE40YkFRRU1oWjN4ZlJ6M2wvb1RUNDVoQ2Fwck0xYWFyMUlxY0l2?=
 =?utf-8?B?eGdMUWtFS2dUeDlsTktFUlVxUm4yYUtHN1JUZkExS041R3F0RXdZcUZ4YWVB?=
 =?utf-8?B?WDg1YlZVU0h0U1NsVFFEbnMrKzNOLzFkb21uODVnRFZnTUlreVEra1doWUUz?=
 =?utf-8?B?U09peEsrQVNZVG9wSnUyMVJuZXRGVTc3MFV2Y1U2M3RUMXg0MjN1R0lFTFli?=
 =?utf-8?B?ZlM3dSs0SVBpRzA4cVpTNkhBNUVnWm5kT0djVkJJWkVNc1dIdjR0MWVTMDF5?=
 =?utf-8?B?NTJ5VVpTUGJMb1FudVViVnoyMVlJanNjY2JLZFZEZWFJbU5RRXU3ZUkxaEtF?=
 =?utf-8?B?cDlGcGRyOU1DUlY1anB4RkNqUWplazZYdTJoNUJ4V2xVd1A1NktyM3cvdGZW?=
 =?utf-8?B?OTdSQXNOR2RkejY5U0dzWEYrQi94WkpEUEVuQ3dkMnI4clRWQ01uRDdzWlFu?=
 =?utf-8?B?VWtJOTdoSWJuanBSdGpxZ2xKKzFxemcwblJGZEtzOE1TRmcrbEpNcEpKMmxq?=
 =?utf-8?B?NHhmMDRKOTByR0piSEltOVNDNnhkYzRmcEVlbjNxN2tuejIzYmoxNUV0cVZK?=
 =?utf-8?B?OWRuMFAxVVVwek1EVW1OUmk1RktrL3ExQTNVdHJ5YjE4L0hHVk83VjB1czBN?=
 =?utf-8?B?bnVwcnZSd1RDTVlXZ1N6eUdnSWVINGNsNnEzZ1hhb2FCaUMwaUZmZW9vWUJr?=
 =?utf-8?B?elQzNHdqS1YycnoxZ0lBU2phTEdQYy9UVUZ3d2ptaE1jZ2Z4Q0szQUJtV3JF?=
 =?utf-8?B?bUxLR3RUdVhYcmZ2Q3BOeDIycFJDU1dJZTJ5YVdJL204cnZsSjJZODk4MzJL?=
 =?utf-8?B?NUhJaWZnY2tET2dQcDh5S2VTRjVBVlJJUzg1WVovcHRUSHMycWE4MWl5RjNB?=
 =?utf-8?B?ZWlCaGFjbS9mVXE4dEJCc1E0TmR4aHZMYVFRSFoyMmplTFdxT0tnWkd6Y3JI?=
 =?utf-8?B?ang2ZGxaekh4NXJFaCt3RzlCckNjUXFGZjVpN3RabE1Kckp0LzEyMnhpOTNv?=
 =?utf-8?B?VG42OGY5VDRBbHhLbGh6STgxRmc3eXVLSVMxM0ptUXJ4dGI4d0dhc2g3TmU5?=
 =?utf-8?B?MGpEcm93ekFwYm1qd1V0QloyNmhKSDNSNE5IQUVHbmRXSFFmSzNiRE1SZ0Jl?=
 =?utf-8?B?UXRGTXR0c01seWJoc29kb3RMUjZtM3hnREM5WHRGSnM0MnoxNlBibTd4bHZv?=
 =?utf-8?B?U3hUTnBOM3Z5bGJmZndvTkk4aVR1VHRPa2tUSG5YQWFDbDZBRndtSkpCdnNY?=
 =?utf-8?B?ZjhiWkRianRSZVRVTDBuZzRhNytYUk5neDhDSng3UHRUbTZwd3ZXcllTS0E5?=
 =?utf-8?B?K1VrUyt0K2NtZ0h4S2RTZ3BDQm1lWDlFTGNJT0psNmREWU5lKzNMMHNBZ3VT?=
 =?utf-8?B?UmhpTXJ4dkZJVFc4aU81d2R4eE9jcWxNVXB3dFFBSUhSaXMrdVFoYVdDenVw?=
 =?utf-8?B?U0NiWDVaQlk4RTlmUTd5bzVyQWNzRnU3QWh0ZkNrRFNqU3NScHI3UjZ4WG8w?=
 =?utf-8?B?ZEpKaUExYmNZa3VESmxYUXZFRkdkTUFERXRIdlVJR1R4anN3Tlp1b1p1cUVr?=
 =?utf-8?B?b2lxZ0hRWjlZRU9yUDJBTHUweEU2VXNUV2RyeUM0amVibHRKY3BMbzBKWml2?=
 =?utf-8?B?S2tUWHV6NTBiUHlqWm5WT1AwNC9YVnBZelRrOGF5dlQwR082akhvRzIrVlI3?=
 =?utf-8?B?eEhtVkhxdFA0WE9Ja3A5VDZjSmNUZmNFbitKTmwwdVRDejN3bExuSFJnUEE1?=
 =?utf-8?B?dm1HYVdxd200Y25yblZlaDIyQ2duUUhtU2JqT09TdVpBNmdXWmVWM0VYdVhQ?=
 =?utf-8?B?NFFhWmRPcGF6YjJrajM5a2JmTHIva05oQUV3bndCVE01UjY4ZEwzbGJlckJI?=
 =?utf-8?Q?RDrVUSCvqfSeExcvcEm8gCD2p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a47c5b9-7289-4f7b-35cd-08da9ae77cd3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 09:07:05.0560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bmFd7TiMhHEZJMPMkTD4ykJ7Kj8jWI2lJZlJuaKATcvFnCpktPSWhG9DeYTgZLOHo46lIYoqcXEDPMrpkCgoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203

On 19.09.2022 17:09, Marek Marczykowski-Górecki wrote:
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -996,9 +996,13 @@ cpu_add_to_runqueue(const struct scheduler *ops, unsigned int cpu)
>               *
>               * Otherwise, let's try to make sure that siblings stay in the
>               * same runqueue, pretty much under any cinrcumnstances.
> +             *
> +             * Furthermore, try to respect credit2_runqueue=all, as long as
> +             * max_cpus_runq isn't violated.

This last part is questionable, partly because the command line doc is
ambiguous as to which of the two options is intended to "win". I guess
one needs to know the original intentions to resolve this.

>               */
>              if ( rqd->refcnt < max_cpus_runq && (ops->cpupool->gran != SCHED_GRAN_cpu ||
> -                  cpu_runqueue_siblings_match(rqd, cpu, max_cpus_runq)) )
> +                  cpu_runqueue_siblings_match(rqd, cpu, max_cpus_runq) ||
> +                  opt_runqueue == OPT_RUNQUEUE_ALL) )

Indentation was already broken here. As you're touching it, may I ask
that you correct that aspect?

Jan

