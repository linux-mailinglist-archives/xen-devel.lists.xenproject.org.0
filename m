Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E88802E9B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:32:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646661.1009145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Im-0006Tt-8w; Mon, 04 Dec 2023 09:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646661.1009145; Mon, 04 Dec 2023 09:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Im-0006RP-5r; Mon, 04 Dec 2023 09:31:44 +0000
Received: by outflank-mailman (input) for mailman id 646661;
 Mon, 04 Dec 2023 09:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA5Ik-0006RC-Tg
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:31:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee5b9ce7-9287-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 10:31:41 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7350.eurprd04.prod.outlook.com (2603:10a6:10:1a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 09:31:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 09:31:11 +0000
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
X-Inumbo-ID: ee5b9ce7-9287-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4rPIlecQazsSFR/gfFZzpg48eQlrtT1z46alnay6pGnSflBeceejtIL1nBCBo0DTBILyeWQSGE1THcr9N8VB012+cpsMblaixSNZXtFRDiYCt/T+zu/d6iGoRVmpS/jgioC4Xee9AqDSLIBta4WKrAybpC0LPQKIrHqx36q4Kf/KSwbFsgPD32dPZbKcb890ot8+abvaOCj0GuKgiAymVf/0UizRRWXRop3pZvMUDFOICy19UGDPNvGmhNPzgXDMhtxsDQUD+IXNbwU4IIeHdyz/zBYqQM07sbUbb0Jtqs4/49FYezHUUPKDbSA9brtzJWSpDa4cXBaX3zq3Eyd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgR7X834o8hhnR4Hhsgr7CTZhxO7yNukrRJKHb2dgoo=;
 b=g6s66HMnN1EgF/XbEbNxKD0Mx4YpuKAkLZkIm2F+73ZpIYpAWhAE5nN4fKKfmAvOGkJB430pvZ3moONN35wzct97DlBBGk2uYM34Mn9yoj1c8BSpmbPw/NQpuRfw3Fqv8Xa8pE5FUpothkJ2hdCt8uux8Cw4G/q7h0x6cbSdf1pGDEsQD0LhwGeBmpfdSK5eoc3pnh0bM500SfY/d2kwkD3oErjh/LXY5KPVp3JB0BZAtObbmE9dyYV5WEZzCMedIVrtYfaF8oZ3NK5IJRsaHNIzDeKYeou5iOJeCZNEhsRg1nsinwPF5M+tYYdTTXAZdczd6VoiLU7M8RD37y2BRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgR7X834o8hhnR4Hhsgr7CTZhxO7yNukrRJKHb2dgoo=;
 b=Xt5BY6cpthvuNa2JdfMdzoG6HQtPQ5dFahGZ1iN7iJz6ImzsEoFkOTwiVYL673uztAxx/IJmRGnvPci7HUQRZq/0NX9ljm2GhWFX1EIiw23piYiV1sfTr2PtHvEtI7CV3m/1W8SVw7sOD+MQziSDveKKmk8OoZUliKH4uhiJXyRvSv6ByrsSG7xSOw2IZfxLxMXwBWxyj8eMunxfZEwTwOa+k6BOTwfG6CZptnpCITBKB9M1FMuEopI9PpfuECk158GQ3XrP1/r09Kjx7p/TxH+DQGDrca4/16sxd6+XJ/7HCRsbRgsY0bpSrKiabYwTBYzpYFRpkYl/OS/uCza4lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc2f93f3-7a65-44b3-a25a-9383fe95b16b@suse.com>
Date: Mon, 4 Dec 2023 10:31:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Moving domain from credit2 to credit cpupool crash xen
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>,
 Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dnfWU_V9cXmbF4wNEEzLue_FUJefwMiic1J0gTnWryyEIiB3hV-h3zC_CjBeBJkcQS8ZMA5ZdkTbJBK2hf_1a1oY3GJvteqG8NqEduCjCrY=@proton.me>
 <d42fedb6-ac96-4404-8478-66783118dbd1@suse.com>
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
In-Reply-To: <d42fedb6-ac96-4404-8478-66783118dbd1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0296.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d49dadc-27a2-417c-96ae-08dbf4abc083
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xgvffp61gLudNtIUbq5UfZtbypenLRIg277cgGjzfuI2w2YqYDlwmsAsWjfJ5+9D6uXV+SQD4f9N0rtJzWRJHY0IOBsUH6rmtfr6z7Li1ml+ZthpGJmwkZ0Nm5W6QPtWOzBPYBYwa38SyCcGgoANYo2b/Bjl+kaUxZlFfI5/5ce/kEeDqQwP5QLxHtsYQfUBT30QyT0W3Kv0ugTKzr12iJvj8LfyrRs/z5TB+/LoYnXwY3PjK84Hacm00BHAYrCKqMxkV0SRda682PPDxXT1oGxn7t3Szs9z1nqyAsV9J2gdtKP4E6n3YOytz3tsGRs64yjo8hLNca6sFUr9/WjVzaaeosKq9mSpR0bLV20+tBgfXiWNE5TUA8mP5EVfxjl0D/g1bGnceP0eYIZQ0Ss1kPPwRpa4tdl267TWM0kICSs0NbFVOM5YRf336KKJEZLIn0fbVACoxukKw4vbXA6CvTsi14u9zHzRAZ+QKJyRUEIqwDaQv2sYfN14Nf9sh3KAZcA+jJvYSWxxxnmty8AwWayMolGdz5aHBPDkrc7NxbdID9frbpqri/CD8AXcIemW9KR1iPuVMlErqnWVHLfpGAzFFbt6k5jTHTyFOfKuofaXt0GHXiNVQtXAFhFFWbCZ7wYBgkvNeLXShO57QqU5Lg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(478600001)(6512007)(2616005)(8936002)(8676002)(4326008)(38100700002)(66946007)(66476007)(66556008)(110136005)(6636002)(316002)(31686004)(26005)(6486002)(6506007)(53546011)(31696002)(86362001)(5660300002)(2906002)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVJrQmluNlYzOFFYbEF3L1RyeU40MzBFdzdEM0ppdXZZUExrNHNtL2JkRkVY?=
 =?utf-8?B?NXA2WEgxWm54RFlrS01IK0NSeWJYL2paK3NxdVMrNkE1d0VLenBxemFVZ3Nx?=
 =?utf-8?B?SmU2TFJVYm8zRFE0YXErZG9vc0psMWhQd1pzaU94Zk5pM0doQUdKSkF5V1V3?=
 =?utf-8?B?Yk9mTlRjODFXVTllaDRZMjVwQ0pTblhtZGtFL3NNMUJKMklIR2Jkc0UzRlN6?=
 =?utf-8?B?UnZlT2lQYzJuUG8xS3p3TDZVTTY5VG90bVFDYkRUTTJuT21xWWVJOS9nUDBU?=
 =?utf-8?B?Z0ZFdXNEdGo0cmJsbW14T0YyTTg1aGFaQm51UEg3ZTkrZ1dUeUs0WG41YXVv?=
 =?utf-8?B?cEx5aGpaUXIzZkFDc1dFRUkvem83WlAyMmJhL0V5N0ZpWWxRNzkvMStlbmpx?=
 =?utf-8?B?U2VjWVRHQmVsOHNOTnZOdWRMZUsxN3F6YTBYVVlJUEJCaGoxdE90MmljakNj?=
 =?utf-8?B?clU0WWNnZGZlSno4dVVkemhnTzA5clh6Nys5cGVoQ0lVc29rMVJPUjMrMDFJ?=
 =?utf-8?B?MitFcmVaSjdmYTVnUExYaVI4N1dORFBQaG5Da3FPbU00cDRxK3VnaUs3VENE?=
 =?utf-8?B?M29HMjBlWGZLK2VKa1NKRkNiQnoydlk2dVFCeW5yTWFFdFF6U2tBZWovSVJa?=
 =?utf-8?B?YUo4a3J1TDV5WThDL2MzdzU5cThMWThlR2hzc3V3VHczRDczQms2bG9DMlpR?=
 =?utf-8?B?NzVPcFdQejhyRGJiQis1TTgwdzBhYUtTTGY3a0xSOGJkK2F3dVlpL3hKd3d5?=
 =?utf-8?B?SWUvNkJ5TExkSGxxYVA0OVVjRy94VkpxM1pHbWhMaktZcXM5eGpKTlg2WEQr?=
 =?utf-8?B?MHlTSDNOeGhkQ3FlUEZSV2kvTkNHVDFydW1oeWNyeXlnU1hMdjNOYnkrU1hi?=
 =?utf-8?B?TlI1R3ZXd0xGZDZwWlRoNDVoQllSTmMrSXM2S0R4b2xSc2J4cEJJV1NMOXBU?=
 =?utf-8?B?VnBBQXpmaGlBQWtsN25sNG1XWWFFSHhVQWM5MkptQjA5SUFVVUY2anlXSmZQ?=
 =?utf-8?B?VmhZVHlOS1FNaGpWY1hKSW5TakFCQTYycVJqTGd2Ui9jdEtzbmYxcHhmNGh3?=
 =?utf-8?B?UWZCSmNDSzNWbTc5Z3p1bXllS2NFbTZFdkNqWEljZktIY1hDcnlwK0dTWjll?=
 =?utf-8?B?eC93UTJmZ1FGVlhqZWl5N0VXVVVpS1Y0OURSMVBFWFFGdURoL2xhbXU5cndX?=
 =?utf-8?B?VkhjbzlMdVpVUnZXM2FCNWVpN1VoaFN1dVZEckp1WXQzTElXTHU0YU1WTTBX?=
 =?utf-8?B?eTdUczhBaDhyMWgvVW9oRVh0cUtkYkpXNTVmMDhMMG5SQ095a0JzK1FVZXhY?=
 =?utf-8?B?TUZiSU82dkozc2xTd09LNmVyRkp5T04vYzF5NTZjcTQ2ZlZ1TzBIN2lTejJL?=
 =?utf-8?B?WG9SN01vSGJ3NTc5T1AyQ0djOUhpbVBwK0FLNnZ6cGtqYnM4MzJsRDEvNXYy?=
 =?utf-8?B?dk1ta2UrT2dzWS9OcFRzLzA2RWRlN1BjT3lFL044MzVDdzFKVE5peEtXOUJF?=
 =?utf-8?B?WlZnV1pCTGRNMWRiU0ZsY25OQ2F2engzRnlYRnp1ZFJIK3BlMnVpaWlIWk5I?=
 =?utf-8?B?MHl6RkdLZmZtZnNlRXg1bk9LSjBTTitobkVkejNEQmcrQUFTMmdXUWlWWEVE?=
 =?utf-8?B?OXpTWi8rK1pabm52LzUzekl6cjlrYnhjeWNuaGF6WjJUNXFLVjVLVE44ZTZ2?=
 =?utf-8?B?bjJYSnNBM05DTWJNM212QUxXUE9xcy9GSXNEOXRLWGRDVUM1U0NkN0RjU3ZH?=
 =?utf-8?B?dU9lWDFyOTduWThJTzRiVU1MMTBUQ1ZkVHljTmMyNVRJMFcwQnFEdHIzY2hU?=
 =?utf-8?B?amVuUnp2MW90VnF5aENaN0IzeUNYNmVjQWNTaEl6dHZPOEZ5dU5KcEI5cFR1?=
 =?utf-8?B?T3BOeXNoNW9ON3Vlako1VkRGWHo5cnFPQWdWNVpWRGx5ZlVtUVpWQ01iOWZC?=
 =?utf-8?B?S0ZTeCtXNUVxdXIzSGgwTGxwT2NVclNmSTNrQkdScmd4ZWhqaFdScjJkSVli?=
 =?utf-8?B?b21CYWxBOVJ2dm5aeldDVEhxMjdRdzZZaDQ0bEVqMG1EQVV0OHNBSFJlVW85?=
 =?utf-8?B?WGVsdUlHa2IyZEFlN0kzTkwyL0gyU1dhWS8vejlpOG96V1hncXVLNmlhL3Q4?=
 =?utf-8?Q?UMeI/F9sbBoiFUWNL5Ji+w7ah?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d49dadc-27a2-417c-96ae-08dbf4abc083
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 09:31:11.4128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WI48EXE3HhYeQ7ULKOdMU/TWann7UoKiV7A8Z3HViE3do1ZeAj7LVXW0cnXeVYXxqpIAve2sj6kkrtrcx3jSHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7350

On 04.12.2023 10:23, Jan Beulich wrote:
> On 01.12.2023 21:13, René Winther Højgaard wrote:
>> When I move a domain from pool0 with credit2 to any pool with credit(1) I get the following crash.
>>
>>
>> Software: Xen-4.17.3 / Qubes OS 4.2.0-RC5
>> Firmware: Dasharo 0.9.0 - Z790P
>> Hardware: 13900K
>> (XEN) Xen BUG at common/sched/credit.c:1051(XEN) ----[ Xen-4.17.3-pre  x86_64  debug=y  Not tainted ]----
>> (XEN) CPU:    2
>> (XEN) RIP:    e008:[<ffff82d040237cfd>] credit.c#csched_free_udata+0x12/0x14
>> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v2)
>> (XEN) rax: ffff82d040237ceb   rbx: 0000000000000014   rcx: 0000000000000013
>> (XEN) rdx: ffff831087d7ffff   rsi: ffff830ad80e8da0   rdi: ffff830ad80e8da0
>> (XEN) rbp: 0000000000000000   rsp: ffff831087d7fc90   r8:  ffff830e2d6a49b0
>> (XEN) r9:  ffff831087d7fbe0   r10: ffff83107c481068   r11: 0000002cfd1c274a
>> (XEN) r12: ffff830ad80e8c80   r13: ffff83107c45bee0   r14: 0000000000000000
>> (XEN) r15: ffff82d0405a9288   cr0: 0000000080050033   cr4: 0000000000b526e0
>> (XEN) cr3: 00000009284d8000   cr2: 00007fb535181240
>> (XEN) fsb: 00007fb534c5f380   gsb: ffff8881b9d00000   gss: 0000000000000000
>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
>> (XEN) Xen code around <ffff82d040237cfd> (credit.c#csched_free_udata+0x12/0x14):
>> (XEN)  75 06 e8 19 74 ff ff c3 <0f> 0b f3 0f 1e fa 53 48 8b 5f 18 48 85 db 74 2b
>> (XEN) Xen stack trace from rsp=ffff831087d7fc90:
>> (XEN)    ffff82d040247503 0000001300002030 ffff830ad80e8bf0 ffff82d0405a9288
>> (XEN)    ffff83107f59aa80 ffff830ad80e8c80 ffff83107c45bee0 ffff830ad80e8bf0
>> (XEN)    ffff831000af1010 ffff83107c45bee0 ffff830ad80ed000 ffff83107c45bee0
>> (XEN)    0000000000000000 ffff82d04045d5d8 ffff82d0405ae680 ffff82d040235303
>> (XEN)    ffff831087d7fe20 00000000fffffffe ffff82d040236ec3 ffff830ad80ed000
>> (XEN)    0000000000000000 00007fb535230010 ffff831087d7ffff 0000000000000000
>> (XEN)    ffff82d04045d5d8 ffff82d040234763 00000000c0000102 0000000000000000
>> (XEN)    0000000000000000 00000000c0000102 0000000d00000000 ffffffff8101ede6
>> (XEN)    000000000000e033 0000000000011082 ffffc90046ebba90 000000000000e02b
>> (XEN)    5a33a1a65352beef feadf9effdf1beef 122ae2fa736bbeef 46023e9af174beef
>> (XEN)    ffff82d040227cc6 ffff831087d7fe48 0000000000000000 0000000000011082
>> (XEN)    0000000000000000 ffff831087d7ffff 0000000000000000 ffffffff8101ede4
>> (XEN)    ffff82d0403495d0 0000001500000012 0000000100000006 0000000d00000000
>> (XEN)    00007ffdf93fb3fc 0000000000431042 000000000043d990 000000000043d9b0
>> (XEN)    00007fb534eb8434 00007ffdf93fb400 0000000000000013 0000000002361838
>> (XEN)    04457fe81f7cf300 0000000002360870 ffffffffffffff80 0000000000000000
>> (XEN)    00007ffdf93fc652 000000000043d980 ffff831087d7fef8 0000000000000023
>> (XEN)    ffff83107f544000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    ffff82d0402dd07f ffff83107f544000 0000000000000000 0000000000000000
>> (XEN)    ffff82d0402012b7 0000000000000000 ffff88811abbc100 00007ffdf93fb2c0
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d040237cfd>] R credit.c#csched_free_udata+0x12/0x14
>> (XEN)    [<ffff82d040247503>] S sched_move_domain+0x5b0/0x5cc
> 
> Hmm, looks like sched_move_domain()'s calling of sched_free_udata() uses the
> new pool's scheduler, not that of the original pool. I'm puzzled though that
> there's no sign at all in the function of it caring about what the original
> pool was. IOW I'm not sure that the simple and obvious change to latch the
> original pool into a local and then use it on the "out_free" path is going
> to be enough. Jürgen (sorry, again you)?

Hmm, should have added "in the error case". Seeing there is old_ops, perhaps
simply

--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -810,7 +810,7 @@
     for ( unit = old_units; unit; )
     {
         if ( unit->priv )
-            sched_free_udata(c->sched, unit->priv);
+            sched_free_udata(ret ? c->sched : old_ops, unit->priv);
         old_unit = unit;
         unit = unit->next_in_list;
         xfree(old_unit);


(not even compile tested)?

Jan

