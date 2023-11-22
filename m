Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB76B7F434B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:11:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638649.995449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kCb-0008MR-5p; Wed, 22 Nov 2023 10:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638649.995449; Wed, 22 Nov 2023 10:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kCb-0008JJ-2D; Wed, 22 Nov 2023 10:11:25 +0000
Received: by outflank-mailman (input) for mailman id 638649;
 Wed, 22 Nov 2023 10:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5kCZ-0008J9-CI
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 10:11:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c79d5ba-891f-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 11:11:22 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8160.eurprd04.prod.outlook.com (2603:10a6:102:1cb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Wed, 22 Nov
 2023 10:11:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 10:11:19 +0000
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
X-Inumbo-ID: 7c79d5ba-891f-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUl71msbM4DexiATdhS7d6ZNh+gp+VuC+gzHXVJ96nVCCT2R0oRNQi5xSXBvvySavKfPP1D4dwHxyL/0FIxPWjEdbFHUCVwiJeQWbbaK5m+X/TLRiPrs4+F+LAtPwXh4tZ3CwMp7ikK4ckdbeRxaa/mphcsxltB9bnqCyoF9ROcbEXXuFlVWhvvKDHcSaOoV0syeipwvIhmcedShDR9pulFUBWM3W7YnUjhd/OcTw6kF75dbT1JckwJLTBXLt71lKDo3umzzdDG9cpUnCm23a/En0E8IVD2Jf8lQ2rXHoisQTT14RIQpPZbjcKXLNi79O7B43MOiW2kjAFvGDRQY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AfuVueQU6tpmR6J1P/Q38UrAnnQZZVz/Zcx8rFDMHI=;
 b=bnMCvwdbaOOdfKdVA1fPtHXsg8WU3CD6HPFe8f5Rd13boF2jPNTnkrxVB0DlD7naaXl65ykUY+9/lCValXjknNtnp9a07VDsjCPprDDf44HG3sHJLV244J6xsnxg3LsO6i41riu0DQt8ONId8DOvyJyKU4lV8WXTozBQsLOLEva+NyXG6YrKmtaTSn5vvPqSOlMocOugMr8eSJknROOpWsak1/jry5VbGqI1ltXVoVAfZUch6L79nTq/HucRex3aGgb80cPKJYrvmU2ckRuofeov0ZrWljGKsnhzxDewbx/ls3SzqgUkMZx+TYC5otVHZWNL77HHTvtiXlYuEjVUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AfuVueQU6tpmR6J1P/Q38UrAnnQZZVz/Zcx8rFDMHI=;
 b=oPz4p0Tx/6sMlSYEsV6M1deJKVyxyyJJHpywWgyjkjEreu8iKLtmZ713gUAxm7Uj3BuEd50VbJWR1a3QlmEUCCj/3r4whQnj7EJEPuP8xFqX4a9SUCujRpapnO/KXEkRkhKP1XQl58mAX1V9vunqIfjKcCtB2H3K1MibQvtemUdsEyMhjIw2s0EmcH8JSzNreyTqQDPa6F0hiyUVsvIVePOXLx8RpTXQGwToGBfF3MfHiDL6g6Fk1LYo3dU/jUn1kpdlbPIy4iCCWilFqqshq48+AceSfJLWJdyVW2z+gocM5QAZ/BxbXa/WNz4ul+JpjRcD6nwPrAI5kpJLpgOKwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f68bada-5db2-4b88-bf04-c77d527789f2@suse.com>
Date: Wed, 22 Nov 2023 11:11:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] x86/vPIT: check values loaded from state save
 record
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
 <584f566f-a0c9-49b5-b592-89ac4f1ecd05@suse.com>
 <804bc3be-256b-4a07-8779-06a5c2be1cef@citrix.com>
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
In-Reply-To: <804bc3be-256b-4a07-8779-06a5c2be1cef@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b1e476-3b69-41bf-9aeb-08dbeb435f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LTijSaKsVGfMi0slEGPy2PwxXAsUNXgoockfd/ta6Q8AdSwro+GV69w7er0bTqhcvhgTMiZQpymYA0NU2ytMgExZ2xXUpQ4R9fBtNJj+co17ur0+505yxkvkOI2a0Nn5kGPZQiWjz0oKE1lbdoBEelcTk5/IyvQpC8kI0zsttCk2v9xAZ/MYcveEY5CnLAqudFYHyIIK5E+B44ole+tKhp7msWOc75vz7Ew8JbevH1feg2zZSBjYPKjXJ0D8oD3tp3BCEYfrUl1SjnsaDrYQEyws4z1TZLpKkKBNAKPd51HTMBA9Zf0QTcoEb53USCx2ZO7m4+CZZrMkQxqZ/6ntV7U5ZZtojw1vuLEeE6duHwApbAgHzEOiGJ3gqJjVrotWjdPBZjgLiSeADCG/kesXjCEA69/i9IzxEZRJ84ViEu7ugqEqV765xHi89zKCPw0l+lf1il1aD14foRxGMX7EZdviJCr1JDgl3x4SRd8eiHHnM5gmdDqu3YhhHmNW3xf7Kh6I1yan9FdynvCbjlf2DDJh8n/VxNioId6v35XWKzhiNboZN4YwxknW9lna4YL7WcGJKlIWW4NyxEAo0g211q66Aq1sx+k7fuIr20p7mZSGLhdQSyWneSSeK1t73zjX0IYDk7pbHuOxYkBDbvL15w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(136003)(366004)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(53546011)(6506007)(31686004)(2616005)(26005)(6512007)(316002)(6486002)(478600001)(6916009)(66556008)(66946007)(66476007)(54906003)(4326008)(8676002)(5660300002)(38100700002)(86362001)(8936002)(2906002)(41300700001)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjNUVk5OMlpOQk05TXRMRUpSTEhYb1NqbXpQYkYraVRZekU5c21lcWp0M1RT?=
 =?utf-8?B?RkRGckZ5bCtSYzJ6YjMySi9rWmgwUVRoSzExY0pORFF1WHNwSDI5a1VHOS9v?=
 =?utf-8?B?eThuOGIxVllJREZRWWdmbnhna1VOVXhCb2V6RTB3aTc3UGorTjM0ai8vVlBw?=
 =?utf-8?B?Wlg1YkFhcDZsNk5tdVFPemlsNzhNN0lNWmdLRGJRUzlyTlZvQ243ellsUk5T?=
 =?utf-8?B?QlplUm1JVE14V1M1R1hDby9CbFdhK0tsMm44SFdUNzFXSDFsQ2dwbThUdUh2?=
 =?utf-8?B?NFVLWEx4NndKYnMwc0o3dUxpaWlBSUVRSW5WdklIQlcreUU5Z1ZvNUs5ckc5?=
 =?utf-8?B?clJxNXA5djFJOFdxdEJyY3A2L0o3MkdwMlFRNU9acmg1cWhQcDJlRWZVaHhm?=
 =?utf-8?B?YnNyK0crbmFOOVlKMFZxWHA2TzByY2ZrRXJEbGFxN2FzN0xpaUJaU3pvaFNx?=
 =?utf-8?B?cTFWR0dHK0FSYS9hWk1GTG40by9LZ29jdi9YVTN2empMbTB5UTByVUJvRm9p?=
 =?utf-8?B?Uk5XLzRLRTVIUGIwM1hCQXlRVm84eEw4dEJ1V3Y2bGZrTzA2T1VkZmIxb011?=
 =?utf-8?B?SEQ2bWJndFVQbGEyb25qMXBWTjBxK0hGNlFScEFPRDdMbHZraForV3RjM2l6?=
 =?utf-8?B?NXhLWjUreDkyYmE0cUFrK05nTFlrYU9qa0JzaGphWmc1NzdtSVlWSDRHWDdi?=
 =?utf-8?B?L0dtWi9qYzVoQ0JIZDRsc1pxekt4SWJ6WnRlNDdwdXVVazhxczAxRmNzWGRK?=
 =?utf-8?B?OHJNWGNlU2dNdWRSS2diY3lNTHZkYlNuQitHWjVDK2VrVU1JRzhXVmNhNDZy?=
 =?utf-8?B?N3lRZUVuaEZlM0dDcU1pZFdCOWFrd0czYWVSTi9RUTF2bnhFa1I4WFJJTHRz?=
 =?utf-8?B?MkJPbXRLeW42a00zNkVKbjlVY2VPd1dSeGJXNmxVNjRMQUtFM0RrL2hLQ1BO?=
 =?utf-8?B?MFNDOFFnVUZDVWhkczRuVEFKOVprVDN0ajNKUFpQNzNDVWN0OUhQM08xb1Vr?=
 =?utf-8?B?a045UFc3aUpTRWZNOHhlRzl6aVpDUkRQTzFzY1l4ZVZOSW9OVnVlYzBtSzFS?=
 =?utf-8?B?T25QcmZWNGpVV3ZzVGtuRS9TMnEzTUxqTmdMRjJwcDdwTFUxM0ZacXZwRk4y?=
 =?utf-8?B?bUtVUTd2WmdUMmNKQnJwQWNzandwNUNNVEFRNDRXcFhLVEtJQVF4SUNIcTUz?=
 =?utf-8?B?MzFlUzdHWU1Ndytoc1M5TmJaRHVUSXdNVW8veG1DaEpHZjNadFZNRkd0UzFO?=
 =?utf-8?B?Nk5sV05ORmJzMnRteEtLYlZYSE41Z3RCZklMcDR5YzRxdy9PUTBxT3ExME0v?=
 =?utf-8?B?WFIwTDVjUVd6anE0WXZGNGJuNnlEQWFCOG5pVk9pRUxpQ1lqY0JZdFF3UUR1?=
 =?utf-8?B?SUI4M3k5eWVFeDNtVVdoN0I5bHl2ME5qOGxXRTlmQmUwMUdIM3ZiVHpaYUhh?=
 =?utf-8?B?TjIvRnpFVXlMa1JZdEVFbC8wRUVidDdsblltYTcvZkxPZk9KclpYZit3cSsy?=
 =?utf-8?B?NjdPUjBYRkJFMG5DaEpVNVlxRUp6bzMrRk92T2o1RXJHajE5VUdpZElHV1px?=
 =?utf-8?B?QUZCNlQyNloxeWt0VGlFNFRSS0RDMEtFbGt1YnZlaFpoUWM3SHh6YU15dG5O?=
 =?utf-8?B?K0diYXFFOTcxVTdiS29iMkZGSWtZNVlDcDdkNktzRVNWMUk4RkNyRmJhUWZW?=
 =?utf-8?B?MlVsNXRKWGpPS3pzNG5mSVpBa0RWUEh6WGE4cFRkM2dZMWlxZ1JzSGtQOFZV?=
 =?utf-8?B?bnJQN3czcTVkeUZkZmlENXJEQ1dKQWJ2K25Kd0NFVmdSRW11cEhRRGU4MXBz?=
 =?utf-8?B?Ymtjdm1qNmJxemgxTEhMNHl3YjRiMGNmQ1NDUUhtRlA4cjdCSkxVWnViRVhY?=
 =?utf-8?B?cE5MUEs5M3FPbXZGbkNCUmZiMDdQMTdzK0xSbEpvcXBBTE9xTDBhaHMyQXFJ?=
 =?utf-8?B?SE83dGFFalF6T0o5ckxDTmYvcmhwWDZBcW84WjJVMDlaRUJOQ2hGMVN1QVB4?=
 =?utf-8?B?L1Y1THZPMWgzUVNRdWY4ZmxTTFBYZytrTWlDcVkvZTMzVTV2Nkw4emZMZm9D?=
 =?utf-8?B?SndIQ0RHK28xTHMxZ0dTeGpCT1M1eGgyNlYzNUJpWWlrWENLalVuOC9icUVx?=
 =?utf-8?Q?9XexYik/iOpT+AQ78mstrPuGK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b1e476-3b69-41bf-9aeb-08dbeb435f2d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:11:19.6650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGt4nc0l3xppMzAtGLOt+grHylkus9TPirInzzxwRcl6EZ+KN/fkLYJVv7CoiwSsV96C+HyS4UyCm0/t1yqKMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8160

On 22.11.2023 01:37, Andrew Cooper wrote:
> On 16/11/2023 1:47 pm, Jan Beulich wrote:
>> @@ -427,6 +428,47 @@ static int cf_check pit_save(struct vcpu
>>      return rc;
>>  }
>>  
>> +static int cf_check pit_check(const struct domain *d, hvm_domain_context_t *h)
>> +{
>> +    const struct hvm_hw_pit *hw;
>> +    unsigned int i;
>> +
>> +    if ( !has_vpit(d) )
>> +        return -ENODEV;
>> +
>> +    hw = hvm_point_entry(PIT, h);
>> +    if ( !hw )
>> +        return -ENODATA;
>> +
>> +    /*
>> +     * Check to-be-loaded values are within valid range, for them to represent
>> +     * actually reachable state.  Uses of some of the values elsewhere assume
>> +     * this is the case.  Note that the channels' mode fields aren't checked;
>> +     * older Xen might save them as 0xff.
> 
> "older Xen" goes stale very quickly.  "Xen prior to 4.19", or "Xen prior
> to the time of writing (Nov 2023)" if you're planning to backport this.

Can certainly adjust. And no, I don't think I intend to backport this.

>> @@ -443,6 +485,14 @@ static int cf_check pit_load(struct doma
>>          goto out;
>>      }
>>      
>> +    for ( i = 0; i < ARRAY_SIZE(pit->hw.channels); ++i )
>> +    {
>> +        struct hvm_hw_pit_channel *ch = &pit->hw.channels[i];
>> +
>> +        if ( (ch->mode &= 7) > 5 )
>> +            ch->mode -= 4;
> 
> How does this work?  If we get in an 0xff, we'll turn it into 0xfb
> rather than 7.

Did you overlook the &= ?

>> @@ -575,7 +625,7 @@ void pit_reset(struct domain *d)
>>      for ( i = 0; i < 3; i++ )
>>      {
>>          s = &pit->hw.channels[i];
>> -        s->mode = 0xff; /* the init mode */
>> +        s->mode = 7; /* the init mode */
> 
> I think it would be helpful to modify the comment to say /* unreachable
> sentinel */ or something.

Can change, sure.

Jan

