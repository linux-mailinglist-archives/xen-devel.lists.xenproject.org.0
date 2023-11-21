Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 506B97F3296
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 16:43:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637914.993993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Su8-0000O5-VN; Tue, 21 Nov 2023 15:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637914.993993; Tue, 21 Nov 2023 15:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Su8-0000MF-Se; Tue, 21 Nov 2023 15:43:12 +0000
Received: by outflank-mailman (input) for mailman id 637914;
 Tue, 21 Nov 2023 15:43:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5Su7-0000M9-H9
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 15:43:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abadbf7b-8884-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 16:43:09 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7509.eurprd04.prod.outlook.com (2603:10a6:20b:23e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 15:43:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 15:43:07 +0000
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
X-Inumbo-ID: abadbf7b-8884-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D17z74/kHrt51xUSjNLRdIgmiVqYkHli1r/CK+KXesMbV1UcHbKdN1hB0Z7Hy84Tzr5GvOBFPVn6YCMb91iHkwV1Uh5BTAKUI28WZGvKp9bilKIk7Ys67LaTpSiNLCFPs9zUhmes6NDsp+LcgvEsA+GkXWuAleaB25NsNMCmb3IEoqn+AimgvsLjijbOWogalirf3oeM8n1nIf0Nuz/TocXoduIXAWVcYpDJ15o88C6JiUyTnk2xJ/ntQAeY0143KvqdPArZohjNPN2URI1xzte6kNgbEsC3Fwh/rQPyP8Lz7fSg0X+H8JmlSVi/0Q9ZCW6c20U4ULaqXIv4kcmmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Fvw6HrU4euVNGuATkzRPVFzf1X0Aq9HS4z9az5eUsM=;
 b=Br3AWfppBJwCwcOKexMhj2stJqznBpttn/iASAaiQwig5PLKkdmHJ6vSsF0kaq9jV1N69PAahklOiq2/JNYEOnCQGPAoj7n3eBMU4RJsCh7OgUh3c1pcrSqlIQvA/vgK2wW+ZikZdL0HgPJh63i6msrCOu+Rnp5721st3uwG0BFHmB8bkJBjVwvhA1JDRbMsBaxqs9vhmIumk/DYjaSt9LtZHmH0Utav6RLaNKWKVKV9zpUK3XllWi5iQuiE0i1JWx09Bzh3bdZ9QoSz+z6/hJw86driRQ/oYJgBgVHYQetJ9R4Q04mHN/nPNZSvK37UO73gjdmeyli0jOQZC0k2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Fvw6HrU4euVNGuATkzRPVFzf1X0Aq9HS4z9az5eUsM=;
 b=OYW+znKmagcqT0L7yfEw+dzjF2xN9dhtpjOurkvM3ABHyZiPYtvcTT6ZmoCBYoxNgu4ZrRquES+NEVoKRQi7SGpUEQ0tM0azjkGiv96/YuQUeXRBc/Wh6ibomE79/b4P5cdtw2W2PJieauz3oyoSTJNxuUb+/YwkLPuErkEhsfJyExOvVX/QYLajr78r+uGfIvRwWvfPVWhOZAUkNuCFdJp/4sanyIAWk6XRKxNkGU5visvQwl/oxY8Fe1Gz8ETN/qffbdSWTtfKhz1d+FNy410v5wbwiq2khT3FAnaSMrnksn9Sb+RQTc8iRKsBxvfqN1Xx8KcSHS/ttMfRryBbQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f2fc40bc-15b7-4810-b3da-f7ef64b6e798@suse.com>
Date: Tue, 21 Nov 2023 16:43:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] xen/asm-generic: introduce generic device.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <65b267137539704df7f22b37e3b0a9b372a82b33.1700221559.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <65b267137539704df7f22b37e3b0a9b372a82b33.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7695de-6235-45c2-8fb2-08dbeaa88ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qZNuh4InyenkIPVZGgA7YwefPFNDl47Vo5szGbbBdB3V7UutNX+B3BLmUabQsVA2erW3HcDOGg/TqaQv3bBbnO3ZR1GeC9QjcuZiw0NjONl/cRjmirRFut5+xNqlEtvvAVEijhiT6AZMVQDZRunMD7Ex8XoZzetvIdoTtvgmYHi4uGLdHdtoV7HaRnYzlZC2UMeNLf7LpmnP3DkOfsQDnbFiaPEDIqsgMvAxctqoyE9PsWU6IN3PVlvP+Qkh1NyWm/MtIU1tSkvMv3CNICnnGkkeK8v/K1RvuxnD3Nn0+qZScLkSCO2GDD8y23Oq8nE5Xc0MHmXlM5tfRQXjVuPRF0LpYwDMIoyOXsG74dIDD2Ulsa/VqkwJT9J2loz3dEhY3rLqqA7bVmBO6lgxeyyKKEu5lf7BNR67VVuF6kNPm1L2NcpkzEwR83AbzEpvE3RQbO2vx9deKN4mRxt3JRt1hi3TMk1DL26p0r1GkU8yAPqceM6siIek7xlJCEzFX1r1mGTVoUnAZBEKE55kw57T2T1w7pT9srHyasUpxNQn1Lxts+DrmG0tiqw9y+aSaBX+9cgWJccE62ABteNgXP9gHgVyv3Hfccimw32amvg4sIKNZ2vz6W6dqIvDaNw4dZ3bKddsdinHjxHEhUPj8m61VNlr1FKwFHe7c2uMQ8cVY/k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(376002)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(6512007)(83380400001)(6486002)(2616005)(53546011)(31686004)(6506007)(26005)(54906003)(316002)(66946007)(66556008)(66476007)(6916009)(86362001)(31696002)(2906002)(41300700001)(5660300002)(38100700002)(36756003)(8676002)(4326008)(8936002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0JNN1JUSzlranVOLzVTaWNEa01RNnByeUhiT0NmOXY2TU42a0h2R0pvZzVt?=
 =?utf-8?B?Vk1ORDI1M2o1NVpyQzhXKzV6TTlzL0dNWlJ2UzZhbm1RNkFZUlQ1R09yUWJz?=
 =?utf-8?B?WENYN09kOWJZaW9IcVJsVkY3QWxIK0xHRzZJOC9pNHVWai9kTS9ySDF2NmZY?=
 =?utf-8?B?UmpMU2NXUWpoc203VEtqSVh1cjJ6aGZISVRNa2VWWmJ6V3VWU3hzb2lFZlVL?=
 =?utf-8?B?NVpMbXR1eWhwVnl4ODVxY1RiR0d6ODA5T0t6c1R6ZXpuT041dmRmZ2JKRVZW?=
 =?utf-8?B?cnU0RklMRHRYQUhEc3VtUkdOckRQZmg0NW41Ulg1K25jUFFqdzkvbE5NT0Rt?=
 =?utf-8?B?V2ltd2ZGWVFUUUFkKzVnQVV2MUg3SEJ4QnpSTnBuNTdrVlduV2RZdzNXWWhi?=
 =?utf-8?B?dU4yNXlldEhkZ1A5OXFGWSt4UjF0M00wQXNMRkpQRUh2bGl5SGRSaHRIMFpi?=
 =?utf-8?B?UDJPbmpNZlR1VFV5Vmg1dkUvU1JrSHlKcG9nM01EUkRSSnByQjJIcFBVc3Jk?=
 =?utf-8?B?MzVHSDVjd3d3UG05QVM4aEZuVWxDYW1zcGVTTllUd3BlN2VZei9rWFgxd3lE?=
 =?utf-8?B?cTZnSFJxbkF1VEhWSS8wRHZsbTk5WlFTcjUzQ3lZeTQ2cXBkYnBhd3FOT0Ri?=
 =?utf-8?B?MUZKanJMdjk1MTcxTkZjcU4xYjhPeGt2c1Z2VlpJbG1rdnVEVnQycGpWWDMy?=
 =?utf-8?B?dkpWaEF5VDYveS9SMk9PYmI1WFM4YnVQTFE5YTFOTWVDb0FCUjVqYXBTbUlI?=
 =?utf-8?B?eFNLUll4dHhkQ05waUlXTWx2MzNtcjhLa0R3cHg1Z0Foc0JYTnBmUG5qNllD?=
 =?utf-8?B?RVJzK0ZkZXZObHZ3emxHRUozMlRYVzg1cjRDWjJRRGdWUVJLZzd4WE9NRXFi?=
 =?utf-8?B?TlpZQkRROEhMdDV5c1pybWpoM1VPSENYWGx2K004eVNmNll6UDJWQU9SUjhr?=
 =?utf-8?B?QjJKTGVaMTFiNGs4eE1lMHhIVHBQbldTRDQ5S3dJd1hGSzdDZGQ4blZpcGc3?=
 =?utf-8?B?QUp3dTQ2WmNjbWVwUGlHaFRqQXVCb1diS09GZWs3SU1ZclhkQ0ZSOHhGRi9O?=
 =?utf-8?B?VFU1WVl1RktzYUVBUE1pNDE0dmF1N2hCaWlJTUtNanMxTSsyVnlLcnhvcG5q?=
 =?utf-8?B?b1lGUFhBY0RDa2xiL0p1bTNlZGZ5bnJpNlFENUFDUzltMnlLZnc4akU0M0N3?=
 =?utf-8?B?YU5lbTdzM2FhNWQvc1BEY0h4TEhVV095U01TaGVIN2RFVGFIcUZBdGk4am1a?=
 =?utf-8?B?dHFxM0NuSXYvVTZkVE1jeVovcG9HVEZTdVcveUxNb3dFUW9BT2hnNzNTeUx1?=
 =?utf-8?B?cGZKY2QyYlhONWh0RWVyamFYcDRiQ2UxZHR6cVh4K3ZmSWw2cnlyd0pySVBk?=
 =?utf-8?B?YndpNmQrRlJ4dWFzM3Z1VXdIVHg2dHlXSFk1T1Y0VjYycVdLYnZiK0lFQVNO?=
 =?utf-8?B?Q1VzeWF2WU9pSE9nT0M1WS91ekR1WkVwVDJRbWVKNVBaSHdxdHhNaGkvTTBa?=
 =?utf-8?B?cWFvOXVJMlhjcW1Md2hOb3VyRjhlZFNmQmlQN2NiQVRnVXgwaVh4QmZlaFJV?=
 =?utf-8?B?dTlubzBucHRaL2dROTVVN2Q1Uk54K3V3OE1raE1ZdVFyYnI4U2RHdzkxNWZO?=
 =?utf-8?B?L0J4aDJzOExHbW04aHJOZXhjNmZZRmhqdW53Nis4M01URWU4cnU5eWlIVjdY?=
 =?utf-8?B?S1hoaDRDSWo5VmIxMmdOT290V0ZycVRyWWppMTUrVjlFVkVSTWlCZ0IyVzU4?=
 =?utf-8?B?bzJVTnBPb1VSc2w1ZGs1c3piU2pIdjhVcStFZjAxbXJMZEIzWE94SHpTWUJH?=
 =?utf-8?B?YVdzQ1kvQnM3WXVHdStRQ3FuemhmOG1HMzRLTmhSQ0hDMkJzYzZ0b0t4dHA2?=
 =?utf-8?B?WElTa2pCSzRDZ2owL0pxamJmZG9jbFJZd1BHQVpDRHdYT1NmbnJWVTlPRzVt?=
 =?utf-8?B?V254Zys0YkhVSWJHWVBoWmw2b21LQzlVRXVyMk01RmNQdkQ4NnNOeGRkT0Nv?=
 =?utf-8?B?L0xjYk5YczA2WHpLckFpQjYxSUx4QTZ2YjI0dEhtcXdaZmJyTkllTXdyN0J3?=
 =?utf-8?B?RDVOcURrZnArR1hNUE82MVhvd1RyZS85MUdIcm1xTmpKbTNxL2dPOXNLNkFp?=
 =?utf-8?Q?H4qb48o6y+jp5CpynfIMPpVcq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7695de-6235-45c2-8fb2-08dbeaa88ea3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 15:43:07.2785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVqVlR0BOqZGo2rLkB0PKrXVI85VO/WmJVn0uv6yeJs3R/Rk2PBpeBtrjAlMJvNQymOz5VyDTKanb+xYsa9EIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7509

On 17.11.2023 13:24, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/device.h
> @@ -0,0 +1,147 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_DEVICE_H__
> +#define __ASM_GENERIC_DEVICE_H__
> +
> +enum device_type
> +{
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    DEV_DT,
> +#endif
> +
> +#ifdef HAS_PCI

CONFIG_HAS_PCI?

> +    DEV_PCI,
> +#endif
> +};
> +
> +struct dev_archdata {
> +    void *iommu;    /* IOMMU private data */

#ifdef CONFIG_HAS_PASSTHROUGH around this field?

> +};
> +
> +/* struct device - The basic device structure */
> +struct device
> +{
> +    enum device_type type;
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
> +#endif
> +    struct dev_archdata archdata;
> +    struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */

Same here then?

> +};
> +
> +typedef struct device device_t;
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +#include <xen/device_tree.h>
> +#endif
> +
> +#ifdef HAS_PCI
> +#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
> +#endif
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
> +#endif
> +
> +enum device_class
> +{
> +    DEVICE_SERIAL,
> +    DEVICE_IOMMU,
> +    DEVICE_IC,

What is IC here? (And thus: Is this generic enough to live here?)

> +#ifdef HAS_PCI
> +    DEVICE_PCI_HOSTBRIDGE,
> +#endif
> +    /* Use for error */
> +    DEVICE_UNKNOWN,
> +};
> +
> +struct device_desc {
> +    /* Device name */
> +    const char *name;
> +    /* Device class */
> +    enum device_class class;
> +    /* List of devices supported by this driver */
> +    const struct dt_device_match *dt_match;

This and ...

> +    /*
> +     * Device initialization.
> +     *
> +     * -EAGAIN is used to indicate that device probing is deferred.
> +     */
> +    int (*init)(struct dt_device_node *dev, const void *data);

... this look to be DT-specific.

> +};
> +
> +#ifdef CONFIG_ACPI
> +
> +struct acpi_device_desc {
> +    /* Device name */
> +    const char *name;
> +    /* Device class */
> +    enum device_class class;
> +    /* type of device supported by the driver */
> +    const int class_type;
> +    /* Device initialization */
> +    int (*init)(const void *data);
> +};
> +
> +/**
> + *  acpi_device_init - Initialize a device
> + *  @class: class of the device (serial, network...)
> + *  @data: specific data for initializing the device
> + *
> + *  Return 0 on success.
> + */
> +int acpi_device_init(enum device_class class,
> +                     const void *data, int class_type);
> +
> +#endif /* CONFIG_ACPI */
> +
> +/**
> + *  device_init - Initialize a device
> + *  @dev: device to initialize
> + *  @class: class of the device (serial, network...)
> + *  @data: specific data for initializing the device
> + *
> + *  Return 0 on success.
> + */
> +int device_init(struct dt_device_node *dev, enum device_class class,
> +                const void *data);

As is this, simply from its first parameter's type.

> +/**
> + * device_get_type - Get the type of the device
> + * @dev: device to match
> + *
> + * Return the device type on success or DEVICE_ANY on failure
> + */
> +enum device_class device_get_class(const struct dt_device_node *dev);
> +
> +#define DT_DEVICE_START(_name, _namestr, _class)                    \
> +static const struct device_desc __dev_desc_##_name __used           \
> +__section(".dev.info") = {                                          \
> +    .name = _namestr,                                               \
> +    .class = _class,                                                \
> +
> +#define DT_DEVICE_END                                               \
> +};

And all of these.

Jan

