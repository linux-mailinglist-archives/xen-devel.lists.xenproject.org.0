Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AAB7EF1EB
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 12:38:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635070.990798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xAE-0002g1-4L; Fri, 17 Nov 2023 11:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635070.990798; Fri, 17 Nov 2023 11:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xAE-0002dR-0R; Fri, 17 Nov 2023 11:37:34 +0000
Received: by outflank-mailman (input) for mailman id 635070;
 Fri, 17 Nov 2023 11:37:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3xAC-0002dL-PP
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 11:37:32 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe12::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0c4453e-853d-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 12:37:30 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7825.eurprd04.prod.outlook.com (2603:10a6:20b:24f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Fri, 17 Nov
 2023 11:37:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.010; Fri, 17 Nov 2023
 11:37:28 +0000
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
X-Inumbo-ID: b0c4453e-853d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rum8oQOR3iQGk0IZvzRFHipmz/psfcMRMupdeLlkIuB9CogMyAlRMCInTuU7I0LWg/2AKe6uoM3mi97IHkJoOM6u9b/GXdpiC5x1nGSnPoYxgTsKxs/wFz+sAq+uAd0ILPqsJe8OtNuY4X2ylRNX+lR3yiYcCVdwSmHw74Eje1u9xRfr0+twhboujFxBdXIGPpMU12XilVi0BpHA3zSb2ESFOKEvU8HxLDNDsYG2tyKymVXekfOCZsClWW2p38bEcB8DSZg9/7wh9Em7IKqfE3fXPVKM2ehfNga1ai+Kye46NkHRBeLYsi0TaxHL69zouSmDAnxX6+qmOPGdM9agAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQZcb6yG9pa+bTxdicrPmRUOINb/8fuu25Jzm2t3d90=;
 b=anMfFziYshURe1t73O0mkvKrtjHATTDkM2jKhXqkk5dOc75AbzGZ04+UAsh3DXl6AfVwSOX32e+Jh686cT6o2OuakX3w7xT3CRamDqi7bgcLobVp7I3tYzX3a6IeG2id8zts8DqRVeBXEln4/mG06nJx8em0ToH3rJMkqQd3mpFj4+yYpw3XU5YfaLFhLWtUTl+Vza/XpMyppy2vhb3/73Zt6zU5AQK3mGXXPqXpKLybMy6skKURfNscFQnOLWfxWAMr5AlRU6WhZNC+elDfOq6aHt/LCwqgwKfJYLTFnJLrfGDNvTw1JuemRFMUgTUVYzpmyqex56IHIanKY29KWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQZcb6yG9pa+bTxdicrPmRUOINb/8fuu25Jzm2t3d90=;
 b=j4kfwJQFWRizksWMK8WnmLGVOjrb5ekmUHUUF/Ibo7Cehv7s9rjjWhziS6WyqNe/HNILrtx+zctsohfE33vxD/16734KnPi0HMTBxZTZoQAeQ+go/P3BOCvQSyiTJalNl+Gx6ulBQ/7FzGwf9pzvQVP0GyQmwzCc3rwkF4l1NN8KA+t9wtjYZcXO6Clkxkcyk7chgGyxZEysvT2xLGJJn1t3XGLv7HeBA4OX6Km5A+Q0bLAbeg2hhEgMwAjrSuG+C3DRyF8gZCPkobLgtJHSTsaCVHWYQxsEqzHP3Iae/HGdHLh1Yzg+l0H9oa46mB8V00ziDqw4LFJZlVM8qEK9oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35dad5d2-7ad5-40e6-916c-c421b1db5669@suse.com>
Date: Fri, 17 Nov 2023 12:37:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Devise macros to encapsulate (x & -x)
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen Devel <xen-devel@lists.xenproject.org>,
 Consulting <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Roger Pau <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com>
 <ddb70b8e-e014-4389-9572-8d5272a73ec3@citrix.com>
 <7f4563916d287a461c7ae0378d97ecb0@bugseng.com>
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
In-Reply-To: <7f4563916d287a461c7ae0378d97ecb0@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0239.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 8620a5d3-a6d0-418a-4ef2-08dbe76193a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D/U/JSnZizQrKrMZZgVTAchVJUamlJCbganpVQFy63WmAs5B/2tIb2P6JqbpH/YmekeUYKtV+QDxOeChcnV68Yl0spv9+3wOMVuKW2xojd4ie+5OM9kYNocRufVI77eH98H/B9rTe8QcXROV32jPM2tdvbxMSahguHtrUghzj4QqIY0EwvrOZljn6ldF2pmH4u6ZDUOL65VIHWET+HfroLhyxT4+J63fVoEEiH6mtwUcK2MJRJQzMZ6eKUwZUroZZpASltpu5Pds5WISKWOoqhsuBQl6Um/Id0Wbf8prH8DNcIc85cvMQ8I8BJamhP1kcbbZmr2Om79+M+U2LPLje7otCO5FeInwYb9mYSc8wdgJTbI9ywrwWB9GN6DlisLQdHIswmnk8IMtqnafHqpmh8M13DPfNXuOF8s/x45Hxx2p97Ov+3+erXhneTkXFKzy68CqDpSp/p/Jcgi+dNjrmgkXS9kv1AB/7BoapNFKjlW8svuuRn+mAKtgUe/iDgF/Ftx8nHlKkq8VVvkjZ0f82Pps+bCyIJbbgUsYep0NuOs6iDBWOTIRwotounfNIVC4U0yjf1VgKqRSbdxau7PEacU1QIXG5zj3taG09k6IyaGFYM73iMF+uYtkPcxLW0pRrSY/yPkgNFRTPhY7hKsHTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(83380400001)(53546011)(6512007)(26005)(6506007)(6666004)(2616005)(316002)(66476007)(54906003)(66556008)(110136005)(66946007)(8676002)(38100700002)(4326008)(36756003)(8936002)(2906002)(4001150100001)(41300700001)(5660300002)(31696002)(7416002)(31686004)(6486002)(86362001)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0YvMU9KVWw3cDZOMEN4aXo2T0tDaXBmQ1JVR3BwdEM4d2VMV3pIeGJYbDJy?=
 =?utf-8?B?U2VJSnVpQzkyZmtRdHo0UEZUS1JuTXQvd0ZFcWRGeTB3bTBkN1RBVFZuMFRm?=
 =?utf-8?B?eUk1Yk9KNEdvZzU0eVhrWjNvc0I5MENmYXp0eWdsdldVdlM0alU3eDFST0Rr?=
 =?utf-8?B?bHlmRjVocGd6QmtnOTFqSVIrTGJXOEZTVkJIV1J1emU1ZnN0VkJyeEk5cTBV?=
 =?utf-8?B?UHZQekVqZ3NUcEhnMnV6Sjg0ZFdDZHVZWkF3WlBuODFtL05UY3BxbHFuOXhk?=
 =?utf-8?B?OTBvVWw0N2Z5aTNVeExJc0trWXNPTGgyUjVxd1A5SzVOWVRVWXpKR3FnQmc0?=
 =?utf-8?B?ZXJVVjdyUVE4aUdMOTV2dFMwaVZwK0dvU3NnbURPbEVBQUFocTRqa3pUcHlK?=
 =?utf-8?B?R2x1ZVJtakZKRTNTVm9tYjhibE55VVZib2N2OEpzNXgrK0sraHV1OUJndGtR?=
 =?utf-8?B?WlFLekNRM1pxTzgycmZmN1ZaUUZXekhITG15bzYyMFZrb1ZsT0diSjBOZHVK?=
 =?utf-8?B?MHpwNVZBd2hMcEl5c3VpUVpSbHVSK0ZqUTlOVnBKV2o4S29LRjVqUTJxSENq?=
 =?utf-8?B?MVVnK2V0K2tvTkU0bVFRUFU2dytpZ0xWWWlXU0EwZmR5bGRLWVdCQTJKOC9W?=
 =?utf-8?B?aFExS3JPNmlieG5xUXBNUmcxWk90cUpmSlo5MmMzc1VlMmRVQmJLNit2eS9z?=
 =?utf-8?B?MHV5SlFVbStDaDBJd2RxNXZPWndmdnEwc1UwOU1TM0U1MG9sWkkyc2VTQXlW?=
 =?utf-8?B?eWcxelJyajIrcFF3VFNORkZLMXBZUm9oYW1keGN2TTRaUm9SQk56UngxM0ha?=
 =?utf-8?B?eVNWcDhDelF6eUtYazdhdnBBa1YxVE9mZW9EVFkycXY3aWNGVHhKU1dHYkdY?=
 =?utf-8?B?a2M4SUFkUWFtSEs5VFZnNE50SDNIeER1eVIrdDhBcmVlaG56OWtBcVh3cHVC?=
 =?utf-8?B?ejJydnBsQmlkb2Q3WVVjdXB4dTBPU3ZvVEZCcFFReEoxMm95ZC9kVGNLQ3ls?=
 =?utf-8?B?Y3lQZGVNRzFLR3gzT2NiVkZtS0ZWRnpWeXQ2V29YZXUwRnU3S3c3TXNlaWsw?=
 =?utf-8?B?Y1lzaUtGcUo4UXRQM2NsWHhiKzZvSGUva0pVT0VONzZycmdWWHQyQXJwZmcr?=
 =?utf-8?B?dzN2cmt4NFFCWlpSb0tGNjZuT1dOVjVDdjNCNmtOcjEya0pxVEVETDJTdnNm?=
 =?utf-8?B?NzVrRkdUWFNhcWIremVuUUhyVUEzMy83SFJEOEpudndabU5NeXFnWUJSVHJM?=
 =?utf-8?B?cDBvYm1RVURsOHlpS0hkcUJyeTRrL1I0bzA3V1B5Z3NLVVExaElnYUxvemt5?=
 =?utf-8?B?VWFtQloyQkxJRlpyU1gzSDRyZTRrL0RYYTBpbVZyNFlzeVJSQnRWTEgvdTI2?=
 =?utf-8?B?TUFiRFdwTXdCeFZuQjBpdkpTNEFTdGZuTlM5MlNuSVFBQUhsTXM5cjE3YzF1?=
 =?utf-8?B?eFlYUHRPZVRWYUFhcVZLV2Nib0gwUnF5NHJqRUpsZ3JmendJbFQxK1lmN3du?=
 =?utf-8?B?NlNmbzQrM1E1YzdOb29CbWFZUzlBZGplNHhnZ1dwZ2czclJWY3FaSVpUMDc4?=
 =?utf-8?B?clpBa0hjNmRyMFlxbjBkL05hZGJPbjZtMHFqYktwd0hOVDJ0SGVHUWRFM2Mv?=
 =?utf-8?B?UUl3UUFmUGt3aGJBUkE3cGJnbFNFTGhDN3NScmFWM2E4dUhNcC8rUk1pYnNu?=
 =?utf-8?B?NFFyUk1IQ1REY1VlQno0eG5UTWVucTVYRFlDbXd1T1IwZW1hSHE1MWpaQWt6?=
 =?utf-8?B?ckJyNkUxNnAvQXg2a1d2dHlrSWtwYzFKdWhTSi9OakttaS81ZitNL1NiemQr?=
 =?utf-8?B?VU1JdE9jVit4N2dtTVlVRFhNcy80TmFSbW1hQnM0WklsTEl4WlV3VVlwMTh6?=
 =?utf-8?B?TnJVdmM4V0N6NzBkOUJoZDJqc3o0cXFEdDlRU2JQQmtUSWJpVnRReWIzRTFP?=
 =?utf-8?B?SlAzb3JtNzZwcDNlM0IzSjl2aXJMZm5ZTG5MRHpMbWcwSWtWMkV4UnJRYXg3?=
 =?utf-8?B?NncwWlNtSWl3TmVZemF6T3hvWmV4M3J6WHQ1K0tmSXJWeGtTQU9pcW9qTFh6?=
 =?utf-8?B?eVZPZXVHL1l0WndFTmNQcnFwTzU2eUFsZmRKS3h5N01IenA5U2x6N2g4a1lT?=
 =?utf-8?Q?MnviLlXFl2zfLGOsGKEMAgSj/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8620a5d3-a6d0-418a-4ef2-08dbe76193a7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 11:37:27.9568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2gZstRTpw2zczQ4hA8kndoqfdRtUDqYXIiz4Fp7uy7GX1+EGO7GAuw3RE++uSMiN6Vv/ZsqLLit5KHawMtNxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7825

On 17.11.2023 12:15, Nicola Vetrini wrote:
> On 2023-11-17 12:04, Andrew Cooper wrote:
>> On 17/11/2023 10:17 am, Nicola Vetrini wrote:
>>> Hi all,
>>>
>>> As discussed in this thread [1], which is about complying with MISRA C
>>> Rule 10.1,
>>> a macro was introduced to encapsulate a well-known construct:
>>>
>>> /*
>>>  * Given an unsigned integer argument, expands to a mask where just
>>> the least
>>>  * significant nonzero bit of the argument is set, or 0 if no bits are
>>> set.
>>>  */
>>> #define ISOLATE_LSB(x) ((x) & -(x))
>>>
>>> This macro has a gained some calls in the subsequent patches in that
>>> thread, but concerns were raised around the fact that it would be
>>> better to devise a macro that evaluates its argument only once. A
>>> proposed solution is this (thanks to Jan Beulich):
>>>
>>> #define ISOLATE_LSB(x) ({ \
>>>      typeof(x) x_ = (x); \
>>>      x_ & -x_; \
>>> })
>>
>> Of course this was going to explode.
>>
>> This isn't even the first time an unwise attempt to do 
>> single-evaluation
>> has needed to be reverted because it doesn't work with Integer Constant
>> Expressions.
>>
>> Switch it back to the first form.  It's obviously a macro to begin 
>> with,
>> and not likely to be used in cases that have side effects.

I guess Nicola's original mail was lacking some pieces. After the issue
with the statement expression form was pointed out, I never asked to
replace the existing (already committed, ...

> Actually no usages of either forms are yet committed, just the 
> definition of the first form, so nothing needs to be reverted.

... with actual uses in MASK_EXTR() and MASK_INSR()) macro. Instead I
was suggesting to have a _second_ macro for use wherever Integer Constant
Expressions aren't the limiting factor. E.g. isolate_lsb(), deliberately
lower-case to look more like a function (and thus communicating that its
argument indeed is going to be evaluated only once, as would be the case
if the whole thing was a function).

Jan

