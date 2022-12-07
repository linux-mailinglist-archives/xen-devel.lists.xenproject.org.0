Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FE16457F0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 11:35:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456178.713914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rlT-0000uY-5G; Wed, 07 Dec 2022 10:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456178.713914; Wed, 07 Dec 2022 10:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rlT-0000rm-2I; Wed, 07 Dec 2022 10:34:59 +0000
Received: by outflank-mailman (input) for mailman id 456178;
 Wed, 07 Dec 2022 10:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2rlS-0000rg-3k
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 10:34:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb250dc9-761a-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 11:34:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 7 Dec
 2022 10:34:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 10:34:55 +0000
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
X-Inumbo-ID: cb250dc9-761a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTt76jCvPt8/rkOgHytOGdIgp3k4sd16EZDqPxAjS7wVfqxDpF+NWJYwVXgYi0ppJGuWQetfvV90Fbiamcx14GZ8KaeIk3q3TBOObRcP3Vba57WJiVXGKqRYv/3Kf2X5corXeeKQRjZ0mfaA72nyVl6jRBPssb3NVI4JUG1zsmbLt4zMwCeYxnTjW2ANTvRyYULm2GuSVN8+OpUUUU8Xaiky7X8QiQqgoIB7wROJO9Y8L3kYA2hVj23789t7pADUKi1dEAElUyD3BDJ2z+wlPBWsD3MOOC7LqN3JtQVegnfW4S8yVY3DrBwx6gfCBKTzrFHwMdlviSaRg5uqWbHTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EViIsttzuBz87+5roiA9RndG9rc2ZEUOwOwQxck2v0s=;
 b=CE6xyWIxD70YGv6LBSdhSj1zoSt3iC1ctUkfdqNpY4UuSYdJas72OI7OWpjCqlvgwOEt7CHTeKZ0luzqjgO/8dI4U7thHOujzLhaWlIixtG4/xP4uxWjt7HBdHllALzV72S2dZgD53FOXPmhBLddGtS/EDfXP5nU21ecQpnmzn9zaG8mHvIOKy0isBm78xM/0CvB8IeIcM+ZcJ3NCtryJRingLjSC1Z9peyENAG5tkAlRpBovm+Rf+fUNtPukvN0kIPjcMPt1FIeiZDVPzdX9wAuoN6WnWc9jTwlTQYKht8vS9SVXF42uB7LnOwr/TGI7E0Tct6RKrEvbOoyyjbTRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EViIsttzuBz87+5roiA9RndG9rc2ZEUOwOwQxck2v0s=;
 b=hyyECrp/VGcgHCKr5BkMN1evIFC6uy/Afv/WbNvx7lorjEQOKU1oj5/Obfzzth641ya5B/M8ooI6kJi9vYnSR3qRydX04T1XOn+5qPNnt9h4aIWYIKnzY3yB0rQ02JJQlztjUISIGWa19oaTAdGSh0LzBnnGRUJh91tEkKHR8bRM0rtPvbaRZ61/gvSLGnvdHR/sMSyvwCAt2qQQnr02lSls7bYelTHAAP/uqDZbhY8qWc4SVZpIEP17w0RaDALase7upOTEZ5oqVGYEhNfifZqjyr8xYZXMExQ1+Zs8iqirxNaEiEFbByerbCoaUp5J6YvvrOPf3yyc9BAH7Ktcmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d85524d-5c97-e216-4d78-2e5ec02fe321@suse.com>
Date: Wed, 7 Dec 2022 11:34:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] x86/platform: Protect XENPF_get_dom0_console if
 CONFIG_VIDEO not set
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221207102909.17794-1-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221207102909.17794-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: a87f4bde-5c04-4433-09e3-08dad83eae87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	41YTbUzX3VVgNnTn+V+Z3TL18sf7Ly3LDXawQIb1u9vnsrQ997lN/OVifbMwP6F831+ryKa4RuCUW9vL+ROlyZ90aVBCATHSUUpo9fgujsO4UfFyGWmpMMkN/WyZzHFlsFai7+DEvMPG6CjODlyhAUcdPsEPf+Lz0BFDALXm6eZ0pi+4GIb+JPOOlSM3/vUwziAHuYcXLFhxO4ggC1I1QJxxUqFPqqmtuimpOjgL46KlMc5daz30Bb55Le2HNvhopYTQrCpSNEHS2O8AA67ppl326F/ff6uIC0A1non+SN3/6xDQqWFczQiUaUwlD3RzESsdmm3G+ngz2uRFofbolOkU13b2flpQJhGXC/3cmjuaOzgDuR2QjpxOupVfbFTo2ai6ERUHfYHezgK83zJgECR7bpy06WOSNPg2VGhQ5yMgREH4xM8YWsoNq4lL2KB7ERGH/lJ4WRpVEyx1ajypP38SW1fUsJ3Fh+/qNpoJ+VYitN3GGJ7AAaLUBcLXedZaPEZ5jVo2xpsxpaqJKX+0i4zdAEPMpcUJlSfuX9KEsN45nRWMtOEglLPX+Tm0rvVhWOQ16QQl+gsEB6sltxNNGqJj24dmhnfc+sYDJoc11DT7Porp2WX/cErzLTdR3vp3JZQK5OuYnOHQ+gE7IpTd+hbJ8fxJRW9YvGI/7Kqe37J0Ewa3LXxDWr6Wb9ahUUtGQKDqoJdTnMOi8I+qhY30pzrgnNar3iKmqrAjCeUWHsg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199015)(6486002)(86362001)(38100700002)(41300700001)(31696002)(2906002)(4744005)(83380400001)(6916009)(5660300002)(6512007)(6506007)(53546011)(4326008)(26005)(186003)(66476007)(54906003)(2616005)(316002)(478600001)(66946007)(66556008)(8936002)(8676002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk12ekJsSEk2cnI4VXVEYmtsa1lkVVR4ZG5TQ3Q0RjlPZ3RpdVduQXBIN2w4?=
 =?utf-8?B?cnNTRDBLa1pJOGJsZEhBdE9Wd05UTjQ1TFAzMlFjMDhGWXRKVEZCSzc3cGNP?=
 =?utf-8?B?cnFDOGg0WTBTdWZVYkhQaytwaE02ZkdaVXkzMk9qU3haU2tjVVZjTW1hbTQ0?=
 =?utf-8?B?MVp6enZTTzJxQ2xLZ1ZxZS85b2o5emVWWmNKV1VJdkhsbXczTUdrL3hBU1ZK?=
 =?utf-8?B?N0xLTXdkRlVIT3c3YjZRL3laWEFoK1A4WUoyUy9kTFMvSi9hcmVUMVZMNUxT?=
 =?utf-8?B?WHlIWUJmNzIyNXVSSThoc1NLODBBbFpJaHdlZ2hyYkpvNEZEOXB6eUVudm50?=
 =?utf-8?B?S3c0ekhYRWtuWlJvUXoyMnBJYzF3TFVUcjRZM1dVWkhCVkJ4OE5Nd3VJRVpN?=
 =?utf-8?B?YWJQeEpDKzF3RkRIaGVERUd1V0VoOFh2WHRLZTI2RGlFRG0vQlhaYk1HKzgv?=
 =?utf-8?B?RW55M0U0dm54bzNXeUUxNFRTM3pGMTFXTlh2OUNSYTA3dzBtbWFJRzlMNHlM?=
 =?utf-8?B?TmtkKzVML1VPY0hLQUhRTSt6eEZtd29vcCtYdlVQKzNlRTlEdmozdFRHSk5m?=
 =?utf-8?B?NWNkS2F6d3ljRk1INVpLWXlPbEIzWXNadk1EMWg3c2ZNTi9wK3JHQnZWcDI4?=
 =?utf-8?B?R0lwdXU1cU9EQTdvMmNxMVJ5WC91Y0hPTVZ0YkVGZk02Tk1yZFpjRHFIRmx6?=
 =?utf-8?B?V2Z4QU9vbU5GZnN3cnA5TUxTT1cyV0JmNTd0QXhVN1l4MTFuemlYUWNXWm5L?=
 =?utf-8?B?NkFBajZWZUhaR2ljSThUaXNTbDhnanVnQWdPZWR0NVRGNllWQVRYYnEyY256?=
 =?utf-8?B?MjBkaVFIVlBNVDlBWmhhcGFTaFJVcG95UjdqcjJKUmN6WG9IbU9HajBiTTRu?=
 =?utf-8?B?Zno1blNWT044MmJTZlpudEgxV05aLzNxUWFGY2xBUm5HWE0vM1Mzc1lkcmYz?=
 =?utf-8?B?blJacmNtellpdGVvZVlmWHFWMXhxY0xXNk1vSkY5Z1U5L00ydWdWVmk5RitU?=
 =?utf-8?B?ZUx3N1VqZzRmVjZXZTZYMjBiMGFVd0g3UmlmbWJXQWliOEE5dEFydzVhaTdx?=
 =?utf-8?B?aWJqVWhkVVJjY3AyaGtsNWhCUjc3Rk80RVdlNW5MaXBxTFRobkVIazJzWEZs?=
 =?utf-8?B?VjNjRGUxT1ZUbmhtMDI0ME9nYlhvZElENmZOdUtzMm9qRWo3T3NBMk4wQmZH?=
 =?utf-8?B?Tk5ybGdUL2N0K2QyM05URnhobGd6a3hMNzF2MkdWYjJ3T2VibUVPakJjaXBK?=
 =?utf-8?B?YzlUR3REWmkxbVVhWWpKNW54Ynl1OWsrbHJpdXArS3NHZkdXcHlVVXZQVWE0?=
 =?utf-8?B?My9hZXZtRXNDb1YwNmVWVy9lN3p6a2pmL2pwNkw0YzNCMnFIQVFUOURSdklZ?=
 =?utf-8?B?NTlka3FNL1pUck1waWttZEZ4YldYL0x3R3VVWUU0Q2IyVDAwcEJTelBTdkxn?=
 =?utf-8?B?NWJqditmNTYyN0Y1MVZmWXQ3Q1I2dEJFMVhTYTVTSkZORjFveG5VdzVFUElP?=
 =?utf-8?B?SFdIcTNKQnNmNHNmZGtkU2k3dFFwaW1RM2gzZGo5SzZCc3JEZ2dhS2diOEpx?=
 =?utf-8?B?Yk9jUXRJZmE1TzlDVUF5SWdzZU90TnRpOERhVnkyRGg1WFMvM1pEMTVlWVZK?=
 =?utf-8?B?NThzU3QxaWx1dElyTVQxbUFZR3ZTTFc1c2xMeG9CbG1wRmJDWGJ2RVZFVnNm?=
 =?utf-8?B?L0wwVzF0SWVLRXJ1bGtvQVJzYWx3elV4VTVOREoraVVhWEZtL2swTDFnTXhX?=
 =?utf-8?B?cVhHRENJWUI4enNxeE9MVmVCSU9FdDhwM3hWVWh4VVJEbjh0cXlGNnp5Mmhi?=
 =?utf-8?B?VEtPS0pDSDNxWXM4Q2JoYTU4cGxKem51U3R4QmczenhqWG4vaHNOTkFKeW42?=
 =?utf-8?B?UlEycEZjTTFRWVJQWE1XTUM5anlUUXRsY2FEUUhZMS9Oa1JpcHNkUVlCVnRC?=
 =?utf-8?B?cDVQeVRTbDlVVW5qVFg0ZGZMQmZrL09BTHpzU3F4Nmdmb2ZKRTQ3dWwwRUdt?=
 =?utf-8?B?YUFQMC9MNkgzaWNWZmlGbFh6M0NOL1R1ZCtibEpoZVVMT0liUE1kQzkzV0ZF?=
 =?utf-8?B?VHFGczdsSVpqZmdvL0o3ZVBOeXorRi9JMTlNa092UzB4ZytzaHQ5eS9keUpL?=
 =?utf-8?Q?YiK2mXXz9QiquDbGpCDwQt099?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87f4bde-5c04-4433-09e3-08dad83eae87
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 10:34:55.5566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWBG6dUNy/MV37N89+wXA/v6+TrrJyt92pkMaj4jyzM+zeXqrTbeHQ6cypvdmjG8rN01HER8i0paC5RS5YqG4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7500

On 07.12.2022 11:29, Michal Orzel wrote:
> A build failure [1] is observed if CONFIG_VGA (and thus CONFIG_VIDEO) is
> not set. This is because XENPF_get_dom0_console cmd of platform hypercall
> makes a call to fill_console_start_info, which is defined in video/vga.c
> and built only if CONFIG_VGA is set.

Which means to use ...

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -839,6 +839,7 @@ ret_t do_platform_op(
>      }
>      break;
>  
> +#ifdef CONFIG_VIDEO

... CONFIG_VGA here, unless fill_console_start_info() was moved to a file
that's built dependent upon CONFIG_VIDEO.

Jan

