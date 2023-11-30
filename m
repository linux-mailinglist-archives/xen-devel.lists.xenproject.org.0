Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF637FEB47
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 10:01:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644467.1005508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cuo-00038R-5d; Thu, 30 Nov 2023 09:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644467.1005508; Thu, 30 Nov 2023 09:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cuo-00033u-20; Thu, 30 Nov 2023 09:00:58 +0000
Received: by outflank-mailman (input) for mailman id 644467;
 Thu, 30 Nov 2023 09:00:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8cum-00033o-Km
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 09:00:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7e7e7f2-8f5e-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 10:00:54 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8769.eurprd04.prod.outlook.com (2603:10a6:20b:340::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Thu, 30 Nov
 2023 09:00:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 09:00:51 +0000
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
X-Inumbo-ID: f7e7e7f2-8f5e-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJHZSbkvnPTIW0DT/VzNPko8D0/RmDu+rsn2LhO0VN//uxahEQWfWaMllCaDGFpA2jaQcw+KmLxs4+WInFlfLks9LMGSWU1t8OwCNmAvt2S+b1SZ40j1cAa824ZpD0HQC7IoVQvNgJQmBVCNIGvUU3ic08K9Ntauy2IYuzg4Z0eabvz6Ry0DC0c6MKbGABwtxKg703aTynK33cOgMJQWuTaAYyXfsX+t3XOXH+UnRSJfKpfBT/3iqDlGrqxaGrDxae0g6rP9tzeeOpcBUONdf2uGVNXjyS586QG/2FulgoN6lOkKotnnbQ8qv0L+YbQM240GdpgPEcf1JIKiJ0CM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AU2G1I1s1+gVT07KJZHopwUbZDptVJWwzhTOuPFzdC4=;
 b=O9vjw/A5GHyhaJX+ZcOMD7RCtlxiOZvR2iyi2DVJX8HSmihy6NfSM8+DeCUEMhSh9MlDu/62lQCovJvE8HEDWulLcy7JhkgA87enMD1Wg2sWzTSnnL63UH3WEFdxDQeYp/EE/3KW4TVMMOFuB8LD+82Ul9071ZCjH8mj1cNrIIYRUWGSPG87kq+XceCZwSfkKuyHxCMfLeA1+NzGIOzrzgp8qZHlcsHXBJpJ192XInW1agTEEhqxAoihAoeT9Nt22nW61jzxLOQxIhXlQGx5wihZLysIsEecU8z1MlL9KUbPtfue20Es0V86kG+fUbfWNR9GMyYZu5ztdX/xJITmDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AU2G1I1s1+gVT07KJZHopwUbZDptVJWwzhTOuPFzdC4=;
 b=eUdvFZizWTD90TTIe/VFUPm6bA1fuKoLtiDLIeLYmxmH0e2XC28pXCcs+YP6TVDsgVXXMO5R7ZiMZhctB3sHRuFUHciMBN5CdUgDAvHuHNFOA7QkEQHVpW8jU5daqSL7/N4DL/YUIEBFE4CGpfinPI6AtJYmQV75PpBgLDeV45hLmwphqCyjKcIxzljiJRIg++POc2HRICzmNUHE8zLl1ZDc2uqbCR4kH+cQ2/22siTtYqai16eYBS5BEZ9gjbCbr8f1aZhG5k/wVhWAwQk3R9UmvvSq6uA/Pf1sljNrwvs8MQRjaDvCBrZ/A2RF4/WYNdRJ4pKEaLYDZXVZso6gkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d54a9e2-5363-4b7c-9902-d5523b3c54c7@suse.com>
Date: Thu, 30 Nov 2023 10:00:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH
 dom0
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "Huang, Honglei1"
 <Honglei1.Huang@amd.com>, "Zhang, Julia" <Julia.Zhang@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-3-Jiqian.Chen@amd.com>
 <fe8ee91c-7272-4cb9-b7a6-cb6ec7945bc1@suse.com>
 <BL1PR12MB5849B37472F195417B301A1EE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849B37472F195417B301A1EE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a6db83-70ee-46c4-0df6-08dbf182da6b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oqwtuVZYUlH+t1PcKNL5uls8KTv7NrgpYT5qoEB+iHaNYFSN5vkJw09hH+efcJ552L02Zb23z3GMpmgF9FJgA6E6L2K5dMZxfWmC2zYzWhDCM6vnCAfjQobv3gmB8FIFe05Q2LRpDEh09x5Q8YurLeJlVqsaKCQInLokbBuBCM5e5f/2H0FSnzxAck1dWE/gIZYZPYvpie72ylQmIWubGp3xp3qx1iAmpWU9PsQj4Qu+GTz509QE2SUWq3SrbCnt3fO4xj2NUlTKUUj+rXhLA7IqN9+eppBMyl9cbdOMGoqyCcMZhaxyZ6SrhREE2o3EW12saA8t/p59U76L8KuwbKpGydCyYGDGmdUyZw4Zwr4CwQUfTdBnVq8awGi7l4VgXVwP4g1lIFBBHJ7FKyeV0a9/LqC0CFIUoONYvO/BkdDYH5ZpRGEJUY9ZmWRGbcoejJ3Xd2gTaoxXzFRv5XwjA3LHiUUwSFO82/pDyZimaX5wZuKUg/XpiQ3pCx5GnC+iuM3iILuBFBVZcRWcu3S7GfAxUTKmRJZc6yD75N1+EL6KOvPdasfmxN0njgiJwExl0J6cjqZ6JflUS/vKtDWez3XfaHBp/wbwce8Nj/sdk5ecxziDPwQiNz32iA3Eaienls2xqZJGT/ONOojPX0GDm3xpr46NMHPI5BoD2OZpXFizMMY1IKTUcMe1Bda66CERfWgXUvC0Br05WlHS4IzbYmomR25fjvek8uQ52sj3SgE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(4326008)(6916009)(66946007)(66476007)(66556008)(8936002)(54906003)(8676002)(316002)(6506007)(53546011)(2616005)(6512007)(478600001)(6486002)(41300700001)(7416002)(36756003)(2906002)(5660300002)(31696002)(86362001)(202311291699003)(31686004)(83380400001)(38100700002)(26005)(45980500001)(43740500002)(340984004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmcwU0ZpVll6YVAwU3B4R0tBY0xLTHdYbGtHbmJWU3RNaVAzSUZFaWtrRkxL?=
 =?utf-8?B?ZVc1elM5Q3hkTCtKRTM3SjZrTzZyTEJrU2MrQTZqdTJabzNMa2tYdlN4YTho?=
 =?utf-8?B?OVJzeVBIaGdGSW5UMjVjTUZCbllQZ3FiWVBJQVNqbFhCR2tpelVERk4wS2t1?=
 =?utf-8?B?Zm9hd29qeGljVThaVjluOW8rN21xUUtzQ082NkQrUkx2dElBS3ZoYnVDemUy?=
 =?utf-8?B?ZUszTkRhcUxqNXNPKzFjdm0vNmxMNW9vODdPRlhMaHVXaW4zMlFnN3Nvdkw4?=
 =?utf-8?B?cnNFQ2wxMVJVNTFJQUZOUm92VmdVS1RxeXRickloTk5TMEJHTHJ0NkpBY09q?=
 =?utf-8?B?OUpSQjZaaTZTVktvbTFUVW5lWG1IVXhNcWkzSXdNZ1I5bnVzajFLdURSYVpq?=
 =?utf-8?B?Z3ZvcThuT0tTUEcycC9ZOG1naERrUzJRdk5kOHM3NFBILzFoa2ZjRXF6T2o2?=
 =?utf-8?B?WnNMQjZqSHNWOFdCWDA2U1hPTW96dUtHZTdRN1Jla0wzdEFZdTlVbU10NUN2?=
 =?utf-8?B?dVRwTi9Uc1h6SXpISm1ubUdxNDZOQUZmaGgxT1plOGdML0xHSVlXT0tPTk9r?=
 =?utf-8?B?Zll2T1BwdHpUUVYvZ0ZGZXpHWTFobDhRMTJmQ2tKN2tmc0tTeE9paGxDekFk?=
 =?utf-8?B?dk5vV3Z6bmdUSlVuZUhBSWFOR2QzZ21hTGpUTHV1WVhFYWc0T1lhT2pDak5m?=
 =?utf-8?B?cnRKL2ZESXFlU09kcmJmazJ4a3VydGVtZXRXb1ViQmlpVmkvZGdzbVIvZDBr?=
 =?utf-8?B?TXVtZkJIUC82TkNHN3lscm5zMkdKaHIvaFZyeEl5TUFwSERmTlVIaW43NlFG?=
 =?utf-8?B?cExvc0ZJb0FJenZFZUdkRHRwMjF1dzlPSWV4ZFFEMFJmTFRJVEFxaTdvZURp?=
 =?utf-8?B?U2htUTc4bjYxdzZKSnFpM2ZkUjhTcWZqNXhlUzhBdUI0azdXUmc4Vmk2dGxI?=
 =?utf-8?B?dDFEVDZXTTcycklZZ2d1anNqQ0FiWTJoZjExdFFmMmVzSUZ2N0MrM0NFdlVs?=
 =?utf-8?B?N2xSbHQ1dml4alA4THM3MUhKNkRWR0pKaFg0MWdLMHBpMU03MEtZc0hHdGMw?=
 =?utf-8?B?WjhLVE52L202TGRyUGNLa3VmbkNhZzdXOUt0ODFkeW9FZVdzaEF2Nk9pcHBm?=
 =?utf-8?B?VmdiNkxhbjlERFBNYXhkWEdJSVZMZURET0Zkem5JQlNsdnN0OWo0dy9CYXFF?=
 =?utf-8?B?R295bHRmT3VCcDdsY3JrWVFEQUZ0T2FFekpsTDM2emc2bFlqdm83enVrSTZh?=
 =?utf-8?B?Y2FnZ3R3L3h0QUpGYzdLVUI0V1drYU1rcHIvcXdUaWJDZWJ6ZE5BYVZ0bExo?=
 =?utf-8?B?TFRRSnpQdmZJaWNFMzlhV2lqLyt4eGQ2WHNRTWFoQlFPUS93RDFHODFKTUFm?=
 =?utf-8?B?T1VOUTdVeTBUQkNwLzlUeENwcjJqcnZZeDZDVW81K3lHei9lbkVPTDZwcFlP?=
 =?utf-8?B?N0VMZlFaNGwwL2g5UXUwdzZ4ZDRtVXdoRXgyclpJTy80N2VTTXpVMVlsUkJj?=
 =?utf-8?B?blRJZ1BrT1V1N2xjUFE2MTgwckpaeDFiZWZuWCsrYTY5TjFObDJMRW5FREtE?=
 =?utf-8?B?UFB3RnUwODJZVzI4UjVSdFZ6ZEVMZitZMHlJanVEWXJLL2xrT3dmT0MxZ1N5?=
 =?utf-8?B?aWJqcUV5QmNrMmJjOGtYZ3A0a1Z0UHlncHhMelA5UlFyWFZhd2Y2TDU5Y2dt?=
 =?utf-8?B?N050UnZjNkh3c0Y3Q3pmMU83OUx2M1kyOG1tOWZDT1pXQnUzNHFhRkVEOFRa?=
 =?utf-8?B?TktWQVBtRUpzcGRvRFI4TStzank0VUVzdVMzU0l1VEZGalhQQWhwSFplZ2lI?=
 =?utf-8?B?WFl0QTJuU3N5ci93SThJdHJJVEpqK2lOdGgxZ2E3SHUrNFVNWjFaRGxQVlVz?=
 =?utf-8?B?Q1FiMnhtcjd4MnlDWU1Sc2IyMWFRYXVYdE83UC95L2ZtSktwOG4zODAvTmt5?=
 =?utf-8?B?MjY3UEpJTXlYV1dMVHR1aUJNY0dUSmFLOXhwSGUvdloxUzFWVTR6dG1xNWQw?=
 =?utf-8?B?c2dRc0xabC85cExzTzNyejRXSXZKUTRtUGZEOW5GZUFUaWZUVzVCZndVVWJW?=
 =?utf-8?B?VjBsUGZNWVFJaC8vdjZoT2IzZ3FQanR2QXVZc2czaHRielRtYkRNMjVITmlr?=
 =?utf-8?Q?4PJXWg8jTrwr4lrm/F19nXRQS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a6db83-70ee-46c4-0df6-08dbf182da6b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 09:00:51.6704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8zmFE9lqRgE49a5fid+zhQ7asonnpANsJSL9cgPviG0TDyaFil7pezIOecgKuj550aIgi/WQw8MBvzJbsc72Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8769

On 30.11.2023 07:44, Chen, Jiqian wrote:
> On 2023/11/28 23:14, Jan Beulich wrote:
>> On 24.11.2023 11:41, Jiqian Chen wrote:
>>> --- a/xen/arch/x86/hvm/hypercall.c
>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>> @@ -74,6 +74,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>      {
>>>      case PHYSDEVOP_map_pirq:
>>>      case PHYSDEVOP_unmap_pirq:
>>> +        if (is_hardware_domain(currd))
>>> +            break;
>>>      case PHYSDEVOP_eoi:
>>>      case PHYSDEVOP_irq_status_query:
>>>      case PHYSDEVOP_get_free_pirq:
>>
>> If you wouldn't go the route suggested by Roger, I think you will need
>> to deny self-mapping requests here.
> Do you mean below?
> if (arg.domid == DOMID_SELF)
> 	return;

That's part of it, yes. You'd also need to check for the actual domain ID of
the caller domain.

>> Also note that both here and in patch 1 you will want to adjust a number
>> of style violations.
> Could you please descript in detail? This will greatly assist me in making modifications in the next version. Thank you!

Well, in the code above you're missing blanks inside the if(). Please see
./CODING_STYLE.

Jan

