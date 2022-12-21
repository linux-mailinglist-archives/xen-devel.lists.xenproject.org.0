Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17973653036
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 12:25:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467817.726870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7xDq-0005wD-0R; Wed, 21 Dec 2022 11:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467817.726870; Wed, 21 Dec 2022 11:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7xDp-0005uO-Tj; Wed, 21 Dec 2022 11:25:17 +0000
Received: by outflank-mailman (input) for mailman id 467817;
 Wed, 21 Dec 2022 11:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7xDn-0005uI-RH
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 11:25:15 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2058.outbound.protection.outlook.com [40.107.14.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 238a6ce3-8122-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 12:25:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7844.eurprd04.prod.outlook.com (2603:10a6:20b:236::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 11:25:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 11:25:12 +0000
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
X-Inumbo-ID: 238a6ce3-8122-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7Gk8of0G1nPxLDkp16pqSsh164XmzgAEyUgCGh61jr8ge0GbDayN+gXaZlyAmnCyTnHrvJyRt+LuWN1MMonfPz92/Afb86dBE7xeOgqjzr3dCzWUMW7b43fnppncmEEzapUfkzK9soj7P0J9354nGU9Kw3XFVSiqlhCT+6fmqp4TjUs2B8W5bmpCe8m1RvHt3TjJFC8wlCJzmCDvKo1jJ4Ap4WHa+VNUHS+mkuNvaedCUNXv1hnVDvKXZ6ff4oQuID0Xx3Sf6oD4WKymcDy3aTiRP78/ZrugwGkoixVJPJ+0ueqGYnVQpVh4EdIflDdx7NXSG76cNimmruHX1pMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXGRyDtm6s8XqtjWXzwMgwRFBKRvXm/6uCkIXpW+Y54=;
 b=gKg2JCDHC4QjNnQDaBTYoqLHptXb1Dp5Wmrw/5qePKyeJW9dd+ZLisvYg7HlklBRjcefGK/8Jz1jn6dZwp5GUbT8Q6Ti+1zd54bCBx5NZDpQvzWQMxlaZG8oIaXk9+iMVKAC2gtUqJ3xFnMWtdCwlpl1fvLHUEzIW6cVch0Jtud5yJ2/RRptMZbD3Y9+jvCayOciIdnbTfONGUiK+lTLPiyu5I9ih+I0bjardxqaunmugIqXsPmF3siEPHL38uzC26S/z13v18tDSw+1m6ESPSLEtXPWeawmAGgdnRitidcMAQdymwkxcIHSGQiw2daPKI+kjd0otqbikXsCwarRXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXGRyDtm6s8XqtjWXzwMgwRFBKRvXm/6uCkIXpW+Y54=;
 b=RRZAjjxX0jHCJ14ulPwiuPDboeHYVUY4Gq0h0owhZseACJYXRLkQsQV49gdB/ZrKGNWxmqMsZXUBaT7Dtf8L8p9wyFi7z7i35feijq6lHyoqxMR1GViTcB/P4fLT2zpblWmMlCeefGNCVMlY/EqzDU42sznKU9E60xaiCTnBj12MadhFC6a1hpbPQDec8XM6FZ/xF9GgveJSW8j1Jhvr0gSuUX6zgY/p8FsDgf3A6fHhNxEhOM+8a3tJujU+59Orjtlw8Z0fB3b4J+oPj+5kmQOgui/SiLHFo5SdQPVGaAcCCDjxbhgsmbXaB6ZzehL2LQrecjTS8MSFWDTcPXbiAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5950f84-21fb-61a8-5722-fa545d0e6217@suse.com>
Date: Wed, 21 Dec 2022 12:25:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC 6/7] x86/iommu: call pi_update_irte through an hvm_function
 callback
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Kevin Tian <kevin.tian@intel.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-7-burzalodowa@gmail.com>
 <d7f12b04-1077-cfc9-25a9-0eba37dde753@suse.com>
 <30a7a4c5-4a5c-7610-e535-98cf8d95fc72@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <30a7a4c5-4a5c-7610-e535-98cf8d95fc72@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a2d735-626e-4df4-5316-08dae34606b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jq84VQk1WoM4tQe/m80O4KUKcWaJGFyXxqVZMGJ6DwEjQsA+cDAY3x9nxZIWlXuJuSAti7YMuCrl4PvTDv1ptaawEYUJ9afosrqcXbsvmirx5COcofHF8W/CLeYSTfKvLze2/dO1kRuklwBTAYSZ1SZt0R4YbZa/x46v31arW2jD4K/fWeMMt+tpMSDhVr0nJOyYENd2i+tsPYUIPPXcgFm1pmz80qwRwPCCntBJoNIst7je4bJbpaz2lia/9DsXg1qHr5GzoRHh6l7W4dADIe3ydAgomLcKofXXh4AKbHfIPg3fzJ/DtklBYjErTjEsMCvw528kfkJdAAifcfvKZJM/Xh/09rKfCa3Cjutnkiq2m09DkvefAYbdWhVt6ylCHSJ7CmZPSGLFDHHiMgI7R2Koy7vcMkomN2jfAYbWbugiorxUutNpiqcVhglbMAxbUEf6iJ1s+v48+DeQli+lkTAbaTM5RAfOMU7Z+ueGyTlbEo1sdddmXOWhxvLPjjwSTtIR8/H5+0FasRKVDDV6X52d+WlS7nB88yXqQ1GF0pkiBF9Qi7LhsV23uphyUKBQFf/3tbhCqMnRHB4LPkSnZkXOF6+abLRTsHUf666Ia2PzrwusndzZ1u0+h5vXl3ukUidmotC7WKpSEVcA6rlNYbo/VkeXltPY7voUcN/vHCwhbDz8MZ56JYFXDxShUAiDkaRvGrLyRLrmqxiWBuGN/s4oBKClzmlkMAvDP3ies1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199015)(186003)(26005)(6512007)(316002)(110136005)(54906003)(6486002)(4326008)(66946007)(8676002)(2616005)(66476007)(53546011)(31686004)(478600001)(66556008)(6506007)(5660300002)(8936002)(4744005)(2906002)(41300700001)(36756003)(38100700002)(83380400001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2dOZkNsS2Y2ZytBZUcxREdoaG52dFZTa1BZVjZBa1NTZ0ZLNjdjemxVMXh1?=
 =?utf-8?B?NmFDVXE4V1dNM0s4bnJTSGhxaXBWblR5Z29rbTFKSjBIaUdWK0hYY3BremV1?=
 =?utf-8?B?MDRuLzlENExZNU1ERllQUlljcTBBTU10TGdsZitwbklmRnQ1UlNFUC82NnhL?=
 =?utf-8?B?aUFVYUVwVEZwaWc3VGcxUXI1V1B6Y2d2TFAxVjZNU01mM3RLSWt1aEJIQTBH?=
 =?utf-8?B?T2xhWXd4T01vUk1OeXpzU0oydW84bEZES0ZZRnB3VEZlazE2bENDYkhIaU95?=
 =?utf-8?B?RXNOWVd6VUZ3QWdJUGxoV3d1YkUxMlJEUnBHS01VK0tOYmw0UGlOZDJHMmxE?=
 =?utf-8?B?YmFHeEtYUHJleHM3elZLTXNWOWhrUGROcWhCSGg4aHBUVFJCczlZYy90bG9M?=
 =?utf-8?B?d0p2bEZXS2l1ckRHWVZJZURIOWZ6NDJtbVZsaHBqRFY2Mmw3NTdOdk15akx0?=
 =?utf-8?B?bTlydWhsa004UVdvd0VhbFg2TTlyby9uMzZhRTJIRWk4NjIreUI2ZmFXVXk0?=
 =?utf-8?B?YndER2Y5aHhyUVc2dmw2cDNIeXluMEkwa2U5b05LSU5Uc3Y0VVFtMXBSQ3Iw?=
 =?utf-8?B?RkNiVFkwNGppUHl2SWtRZGlaYWJQeEVXQXpVeVJWdjZyVjcvQ3MxNC9HTmwv?=
 =?utf-8?B?VkpsQm9JOElqeHJ5Z2ZJd1g1OE1VVlh0dFBuaTYyZDZZcGJ2a3R4Wlh1dUlQ?=
 =?utf-8?B?amFYSmpiTzZMQWpTK003OVBVVk84S1U2UkwvUDM2ZE9EQURHTmI2NlMvczhl?=
 =?utf-8?B?bW1JelpMcGU0UjI5L3RrcXlObGI1cU9uTU5lc01zY0JOaTFZV0x5WVZmeW1Y?=
 =?utf-8?B?Y2JQMHpaRmtTdXArZFA4aEtCdkI4K2RiN3RobGFEZ21XTGEycWdMWmN1WEt0?=
 =?utf-8?B?WTdzcUlmdVZKc3V4aHpmRVMrbGNFb1hxbE1NZVZObG9xMS9sVTlkUjJ5b3JO?=
 =?utf-8?B?NStqdkoxblZwZk5OV1ZxSUNmZ0ZJS0pkKzh6Nm9ScStOc25MUTZEcU1NMjY4?=
 =?utf-8?B?SDZIMVpIQUtVWTlBektMZVNvQzE2SjZ3R2w3a3h6dUMzRlB1WTRsMmtLVzVB?=
 =?utf-8?B?YUVneHVBYjRGOXhVWTJrTFFkSWJpaUpocUxDSzZObG1sSGhCbUtjYWJBdjZG?=
 =?utf-8?B?aUM1Y3Y1akd6cGxOaUJTazBXVkRaR2ZUcU5JN0Znc3lOM2ttZkFlNUYzZS8r?=
 =?utf-8?B?WEZFYkRlN09UM21sQTIzVS9HRTFOV2haUFV1cXRrT2NrUnMwODZ2dFhFWEQ2?=
 =?utf-8?B?MVhGNll6dndseXJnWlovUVJzZ1g4cWVLa0xjeXBxN21aKzNvZFNjUTF6bXds?=
 =?utf-8?B?Z0NCd3lDTGUyVDFnQkpKaG9CK3hqaFd6T0w1NkpKYlE5bis5TmtMQ282alRS?=
 =?utf-8?B?NThsYVpweXQ1MVhyT1VxSTR1VkVZTGEraC9qcFZ2bkdVa2ZyTzU5dyt6Mk9Z?=
 =?utf-8?B?K1JKYzdFWnYwL2NYOEEyQzhZNi9PQ3JNZ29LQzU3WThCNjNMNEpSTVZLUEFI?=
 =?utf-8?B?ZEpHY1pTc2QycnRPTTBHM2F0Z3ZkRzVyT2hwcnVOMGFqMEpneEU5b1ZSWHp1?=
 =?utf-8?B?R01abVRmRk0rSXBreEw0cFcyb3EzMDlaKzAwSk9menhVWWppdE5GME5VQU5J?=
 =?utf-8?B?UWQ1MDkvY2JIZjJlUGFSUWlWZHNrSGErVFJxSGkrSmQ0OTdQOEt2R2Jzb1Jy?=
 =?utf-8?B?YnpLUmxYMGsyNlhTTWhvd0tlVjg3QXF0KzNMSkpHck9MNnNwME5ka2FXc2Fn?=
 =?utf-8?B?TE1PSlorUkR1SEsrWGhEZVJlU1I2cGxVUkZjZGNDOHR4UmdEUHB3My9BdnBG?=
 =?utf-8?B?THRmSlhRUUVRMW5PZTZINDZBaXZySkJZeUlRK3JuTkp5cFJzZ1grdS9ncjN5?=
 =?utf-8?B?MEU2R015YzdWTGV3NVErZlUwUkhZbytlaUxKUU5ZczJMVlNmTDdXMU9GT0JL?=
 =?utf-8?B?S2p5T1h2TVQwcGFnQ3MzdGFUVXhCMTBXRnR6eVRxUVpiMDJIenZXakFEM3l4?=
 =?utf-8?B?eHRqMkpiK0VrdS9Vc25EUHN1eWp4V01idzRiem5PbERUNGN6UkR3QnhOQTd5?=
 =?utf-8?B?WWZLbFBpYkozWlVlenVBQXBGVGhsa1ZSOG4zc2JxT3BMV1d4aWl6TFNCT3c2?=
 =?utf-8?Q?k6rmw+j8Ng8nDiOwq7+V90meR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a2d735-626e-4df4-5316-08dae34606b2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 11:25:12.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+oMCHZsARwinxEmIlHs/VjXBE7AvVlGPfUSO6aI6Z1C2Nu6fjH2UuRZHpe8H8Xalv0dy0yYp7a3pvSk1+YcrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7844

On 21.12.2022 12:09, Xenia Ragiadakou wrote:
> 
> On 12/21/22 12:13, Jan Beulich wrote:
>> On 19.12.2022 07:34, Xenia Ragiadakou wrote:
>>> @@ -774,6 +779,16 @@ static inline void hvm_set_nonreg_state(struct vcpu *v,
>>>           alternative_vcall(hvm_funcs.set_nonreg_state, v, nrs);
>>>   }
>>>   
>>> +static inline int hvm_pi_update_irte(const struct vcpu *v,
>>> +                                     const struct pirq *pirq, uint8_t gvec)
>>
>> Why "int" as return type when both call sites ignore the return value?
> 
> Because the original function returned int.

Hmm, indeed - looking more closely there can actually be errors, and
those shouldn't really be ignored in all cases. At the very least an
assertion would seem on order.

> I 'm not sure though why the returned value is ignored.

Kevin, thoughts?

Jan

