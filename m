Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D817F32EC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 16:58:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637937.994054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5T8r-0006Xk-Lk; Tue, 21 Nov 2023 15:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637937.994054; Tue, 21 Nov 2023 15:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5T8r-0006Uy-Ic; Tue, 21 Nov 2023 15:58:25 +0000
Received: by outflank-mailman (input) for mailman id 637937;
 Tue, 21 Nov 2023 15:58:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5T8q-0006Dc-9J
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 15:58:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc09dd03-8886-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 16:58:22 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7396.eurprd04.prod.outlook.com (2603:10a6:20b:1da::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 15:57:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 15:57:53 +0000
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
X-Inumbo-ID: cc09dd03-8886-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h57DdFgUJGcNHlCxPHgOjFiHb/Kdev8/4Ld0edC/+PTTA4iRH8KadbqELQ5LtqUGQUbUXsy6lmyGDBv9JoL1/KF3P27KrKtDDc+21EQaQOmfnSQwv7i2AaRcUvsTxkF0WU/2nwknuxx9/K958sC8rZUfi7mRtNJsHdVFg9+8t4+krbhZCWWY1kihAysF/X2ZQrR7WQAI55HQL2o3FEXWSbDXQMn4voc1i8Xi0o3ATTM0DU7wbxs12VA3o7j5fLWbLmroPgkD9uo0zo7Pwd6asbb9KFKWqlhm3UtnRvci/54rVJ+lsL1OiXdlSqMhRCUkUQHdodHArNEcYsJ4Svv6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CKHwxVd/ZzegVYOeez9p5sKEfobBTc7HBLaaeUE/OY=;
 b=gmT8LmvKIVEqj/j7b7GlHqK3c0+Y8GnuKm3MNzbefm2Htx1mtXEFdLPJKYe8q7rYobjdbs3YQCDrYwQDtjgBxOcSlbb7UMCnk1TI31Xr7FvxbSswDXfNhJ4SwlGaHC7bNOoXtFiIRsQDhe4Hqzz9ojk81NNthGBMCQ6tB21bk4MI4iDs6JC/cfYgoFESisSWmXCWTfUbZTu72gKZqFumHbClht3mcJXkgUj3xGH9dVtXSauXGG1VqSNMAwPcU2yOWg/E+yedKqP4E9uxDuesTzBmNKt2pfYGixlh7VAMt+MjZ8WjSpWhx4IY+d2hsZW2vMweQpIyAesNg4NqNALoRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CKHwxVd/ZzegVYOeez9p5sKEfobBTc7HBLaaeUE/OY=;
 b=a3o4RqTwyjbo84jOXlpR+/dCuD5riHeBcMsEHPN0xsyDRmISiPrDsL5PuVozJuo16s9fqQYrml0sDgmUUYPYnkvAT5DTDt28jf6sCuqG/k/N3ARLTTHrKOkKZg8OJWfZX0BfNda4BQkxQM8N6vUjxFpTLsJEQz/BMNRhLRuPywl+xZ2x3JfSCg+ZFTKJ85l6uYmp1dcJEPWsw9MARR/JZANxGF4GN3MCohdaDYmbfdpbE0ueQVflftB4zQUsXN2JW8i4LcFPSuj1/DhGP+hPRSZjEQh4/QHKTKnLVe/J9pn8S9CEODhnzn3vrMy5h3w7sKbUvBiofVx1MdHe2Jw73A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b41fb02-e2be-456f-a9e8-9c5dbb8890d6@suse.com>
Date: Tue, 21 Nov 2023 16:57:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] xen/asm-generic: introduce generalized hardirq.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <3e5334809f5efa78eebe8e8ff342f10851f107f9.1700221559.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3e5334809f5efa78eebe8e8ff342f10851f107f9.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 200bb42b-56a4-4034-18bf-08dbeaaa9ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jM/1XAZ9FpfTDMWC2hFdfkLIZ87BhnQGnYTqQGeMzXcV03aOIuJEs5KiwwxE71ALmvmVOistxAWDkfnaiSbFhQ3973FzaJ5HIjt2AUFRZCxRmjIlb0jDrVR5gVoBWjmX4KN3aX2v1NS7p2uXjumhqzV9iwPhVWzrZY4M+AdwlR6aQuACfbykUhqaNpxju1hKig3F9oXyFJECpqhExDinHjK666v9iok5XM/JtYkTvRxCAUyxOWyYrLp8Mlhk+e4STpJERGS+IytbCh6Q64aAdm2+YymhTLUMMN1l6EpDbagdWuAfnhXnjXkpHenU+oeqkbo04JNd7NTZeaa6eLoevXxbcoVkUoyM0WxHLufugCYZtZuZQfGWcqGxGdzwCIgpIdVIRI2IMjrk/7yHJrkkZijHLJr8a3vP6Y7ymAFdKIIIvsAQGh3SNlaoAiKvf+UTUH3InEs9XynPi7/GbfQO9TvYPVjrsa7YAPoikd+u9CPfTBHGd2SlmqX82dm2ltuiRFMCXcseKVov5gLdyuAJ7Lwwi+xENGqcspLxAz0X6oef0YoQGruuZHuYoS2Qr9oHbVoLUxDsMpHP4/X6lk2ZhbuhZ4S8bZ2zphzeW/gfbmgbujxsq+Mn1a15DEcuewnA4uFrNkoUTljr/KEmuhX9CwFajt9RR8arLCTx5oJ5FIY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(366004)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(26005)(41300700001)(36756003)(86362001)(5660300002)(4744005)(31696002)(7416002)(2906002)(6512007)(31686004)(6486002)(478600001)(6506007)(4326008)(53546011)(8936002)(38100700002)(66946007)(316002)(8676002)(6916009)(66476007)(54906003)(66556008)(2616005)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHJOVHZCUFEwTWZWVExYN2V4Q3dHUWNkZEMvWEkwMnY2R3ZzWWRPMWFFeHVt?=
 =?utf-8?B?S2RXcHhRSWxZZzZDMVVicjN0OUphcFNsZzN3V2huK203MU1UdzRwTkw2NVhy?=
 =?utf-8?B?Y1A3KzZRSjlLQkV2V3Z3alkzbEZGM0JxSm5oRkh4ak1lcG1DYUpoc0xlUHNt?=
 =?utf-8?B?ekJWdlN2R05OenVYQmFDSHRnMmhrek82M2hqdGhHMDZZTklSZWI5dEJYOENS?=
 =?utf-8?B?UGljbGlpaHgwa3dtcnpmWFo4cEYxM09HSmpnR2dLWEFwRXZaenNPNENWU0du?=
 =?utf-8?B?UDNLVm9xOUNkWXd0YVZOQjd6Z05xTml1dFc5RkNsR2FZOThiMW91YU9JY093?=
 =?utf-8?B?N1pPOWt0MTRnU1M4NUl0MWlmY0FJRnlMaCtKNHdsMzF3WVo0OHVCZ0JGbms1?=
 =?utf-8?B?THZtbGZDL01WdElEYVlPcXpyUEZaRWFHQUNyOTd4MXJuRjRxM1VoRkdsWG5P?=
 =?utf-8?B?Wk9qaW5nTFY4SmNleW5HU0ZtYVFqNnhoRWkrekZCRXlxVEtQVVYwVXFhTzhz?=
 =?utf-8?B?UGJQcE54VjdtYmJHbzVIWklXcDNaZGppSjBxcVBFUWxvanA3Vk0zcmtQVFJp?=
 =?utf-8?B?SDJWajY2U2wwdWdUeWw1YU5TbFR4QTJRbU54eTFxR3V4RHZ3b0JBTG1KcUdZ?=
 =?utf-8?B?KzA2S21ISkpaeHV0U0wyTjNRRkFZOHJnOElBV01TSlZwSElIUHRZQVVOb3FD?=
 =?utf-8?B?djV5NTY3VFZqWlQ0a3h4cVh5enJIaXBqNmZxcDVaZTcwb2ZHT0FYdXN2eUcy?=
 =?utf-8?B?dENpTEN0VGdBRC9GRllpT0FjZnJ1YmtodlBzQ05aVnQ2RU5kRDFRZWxwY29x?=
 =?utf-8?B?cUloNVZNaWh2NXFvMXFpTk9YSDcvWHo2eUgyb0laVTRsQTM0dVYxVUFrVmsx?=
 =?utf-8?B?QjlCYkFtZDNVb3IyMkIxRjZ4WHRxN2s0NnlLRUp0TmFPZ0YrakUvRE5nRmhJ?=
 =?utf-8?B?SzF2UkRlMUh6OXdiTXFNbXpPN1JrSlBVM3o2bHBzWnVqUDdLWEI5OXV5QTc1?=
 =?utf-8?B?YTRTRjNvKzdOeDV3ZzFMV0xWWUNFbHU1MFh3TzdqY3hIM0FpQ2hPZ2tuYm9L?=
 =?utf-8?B?QVczaGJWeWgrTzZHMGREbklMK0hjcEJKcGp6Zklhc0hEM0JFWmtkMW9UTkh2?=
 =?utf-8?B?NUJ5eXc4RlVqNmM0d3RrVDNtTlhMT1AzYTc0MHBpc0VpaS9yNnJITGFXbkhw?=
 =?utf-8?B?NWpTSFF4bDVWbDZnNm11b25MVjM1T2FWM2pmV3JXb0ZqbWVkT0hURzNzN1Z3?=
 =?utf-8?B?SXdyZm44R3lmSUlnNUtGNHRQYmtwY1lPcmZ4VDl2TFY0V3k5K1FQS0dDanI0?=
 =?utf-8?B?YytKRW53WlpUWVpOcUZPTm5hVmlSYTA0N1V6Q3BKb0xyMVVhb3JBV0NuNW1O?=
 =?utf-8?B?M1E4b09rQ0FCZ2dhZVBEdm5PcHBMUWpDOEZLYWFDV2lKWmJtOWZXU0s0VUZO?=
 =?utf-8?B?eTdRdVNZaklyenNZYk1BN0dHZkc3dHlBM0oyazF6Y05YMXpiRWtzL21PZ1BP?=
 =?utf-8?B?cE5NSVozTGFvdk9LZnZuRHdHV29oYjFENzBXZ0ZNVTBlRyt1OU9xQVFuTnE2?=
 =?utf-8?B?WFBWYnQvSUltM0dlN0hEMGEzUXNUVnlGVGI1VFYvRHZPZEVVdFA0WmNlM2tn?=
 =?utf-8?B?aVRqUXpxU1BFbS9kQ01LbjFFOVZQam4wN1RYUEcrQWpxZ0JSa3hleENyNWxM?=
 =?utf-8?B?THJIWE93V0NseTM4MGlJV0dPVjd0OUZzWjJEWUtwTUkzdFBMaGpZVzU1Q2px?=
 =?utf-8?B?YkdJUVViMjMyYmY0dUpYRmtPYzJOTU5jWmY3eWNNYzRSVEJLdnUvS2xqMndi?=
 =?utf-8?B?ei9JRFRjbHZHQmhGcXY5SEpZVTVtWTk1MUV5VXpkWFZIWTNRY0FXVFMzOTBO?=
 =?utf-8?B?d2s0T3R3a3c5MGdDS3Y5ZUtvemFRUGVSY3ZwVnpzN2FCYnUvYVQ1U3dKOS9h?=
 =?utf-8?B?SDJUYXd2QlFSb1Z3Z2l4VUlCZkw2SFlDYzRrN3N1anlHT0kxQ3BGMEM3YmlT?=
 =?utf-8?B?RDB1b2xBL29jM1FUVEs2SmdYYkxWY1Q3cGZxTEYwR3EyVmlPdTRrZGNMbXB3?=
 =?utf-8?B?RnZXb2VBZnBoL1VSOGRLejBlb3Z2a3hQR01nS1kvdDRubHFYalI3WjZxRUF5?=
 =?utf-8?Q?knj6GelSO/rMScTkm9n2Ij5VA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200bb42b-56a4-4034-18bf-08dbeaaa9ef7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 15:57:53.6425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7gKUhf/5pSR1DuVH69+4U2YvFX6cCnR5EN7X4AEvIBiY6SVP6CueLLylU9OFGVMch7OUL6iZxs15frnVBvVjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7396

On 17.11.2023 13:24, Oleksii Kurochko wrote:
> <asm/hardirq.h> is common through archs thereby it is moved
> to asm-generic.
> 
> Arm and PPC were switched to asm generic verstion of hardirq.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



