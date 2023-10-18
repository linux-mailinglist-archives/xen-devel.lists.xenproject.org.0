Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D26A7CE0FC
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 17:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618677.962634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8KD-00022N-Pv; Wed, 18 Oct 2023 15:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618677.962634; Wed, 18 Oct 2023 15:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8KD-00020P-N7; Wed, 18 Oct 2023 15:19:09 +0000
Received: by outflank-mailman (input) for mailman id 618677;
 Wed, 18 Oct 2023 15:19:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt8KB-00020J-Mx
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 15:19:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acf13638-6dc9-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 17:19:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6933.eurprd04.prod.outlook.com (2603:10a6:20b:10d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 15:19:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:19:03 +0000
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
X-Inumbo-ID: acf13638-6dc9-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WK6Zmgw59gAF9M9mpqn5ZrPvRZBw+do2+G4g6xALToVvedMvdaQnZJtCytjbLT58SL7xYsCkuhJKTBMTahAfRBADB7TQN+Imb016Uxlah994K1PdWPesOmtXEaCDBgMpryKNiaGBS9yHQsw9lCmIArevBJ4tUpAVd3leJp/c8DF/AFRqcCvDv6QmK0x6Qx/p21uv5tEJdgLr8byc/9rrvKKeEYCNgfGB/bjkU78I9TlOXLIdrxxUryqIF5xjc99+KNFS+9zSr7ZkxiZFsuRBe1huOxXwrBHqvrN5CEN1O9ta240IBTlmp2jsqs1/RR4h+XQWFueNcEkkhxEJpGNnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xOcxw5jChZOZtOPT0VwNiHO+ohxXpx3N1Jwp+GTT0E=;
 b=F2iBU+D/TnN2JrvqkUadNicTtj4iqyXKSo5xA9UVw4sMA0BFo3Bb2Ust1wetgBdEAP8SuyO4OoaEKyVwILDeFwiqDRUg0LnYPNZxVfQT3sOh2z0CXJLrswRiNkb2OvO5EACHTdQwD54I4LuCou3O4ew/Pd8DzNe4rWGLROfiY3jPUWxj4HSBDgykjkca4StAlvmV059IBAxJNI2HR8i//mS8SwpcAosoUUF0ernzSQ5sHDljWXINN6TUtrxCSOxYf++BZTkYLIqdz0WQho+6RQ/bFA4RL4xuG5easY9BRrBCMzjewK9jUftcBin1nDCAwauk521PVSCKyI9uljI4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xOcxw5jChZOZtOPT0VwNiHO+ohxXpx3N1Jwp+GTT0E=;
 b=5T+hapM3NN04Yj0rQqZcI4P21a9JOstv9QNyM9gNhjfEHudqI3ei+zIv0zYTDhw2/HwDU7NPf66JbTIynX3cY9J2vagr8Z29AaK2yASmfEIWEy73f9ANQXK/2f+cGv82BVKkPgnwhj3DS8YghEVWMfGP8yJ1vszy9PZDm/XxvQxBu4+G/VoWBo/Fzqqh8j1JVC0oU/RwUAHO7RBKfZxq7vuAgmBU0Bt/LcHdcCTQHW+AggTb93i+hEyiqKPLDMccTxrTisUhz94Bv5elBaOZO5UzgghGRcIqOx6kJUZI63qFIgz80pxJKIeeAO8XpGjzDcgTYdUiDBoERA8gQSH7Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c1ffe2f-eeb0-98d6-b061-c7bfcea427af@suse.com>
Date: Wed, 18 Oct 2023 17:19:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v3] xen: address violations of Rule 11.9
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <d760ef0c088dc15ecc411b83640735123444f887.1697636446.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d760ef0c088dc15ecc411b83640735123444f887.1697636446.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d11cb6f-ee03-48e7-fbba-08dbcfed8fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nADXy46QWyCwr8EegQTNMkrlzv40hKt2bM/CDrGBkmCfMr5ztZHIgYnmpDtubanKdj/GZ9jzuvnnfMB/a/93sHLWu9EZOnU2LIUoq0FwdV3K8NrDLzmmosd0ME6TWjtCTH4S//g81HKzcrbTA9NKwOfdoe5jpJsXC96NpTQ1GS6XrD0iq47Fe4DSt22QvYD6shJMLtA85lgDpdNz9W0VbSaV0dLwOVEHhWzlYh1KnExXzI0aV1Ed/tXuAriT6DKPrqfszs/5uxM45f6F2dufOG4m2ZhxU33loerv2a0/N2+StFV26N2A7Bf81m8JLsCIMUuKnlncJ/eoLaiWiz+u8xTdA0TeHV03/c9aN4KmHynP0CzF5ujpO+eaeaZPF+JVuCQlNbAXK/6Edx5p4rnIa4h4RIuI42T75pzhcdgDtJhbqDeScEoe/SUIOtj7Wry1daNdnW8sT7HPDnzDt9cEcR9EQSOkzcyeLhJvQ24IiQZY98v5yL2HQh3rNnjg6uDWAwKo3AURZsTnnNRdcAh0KgMX579twkNDbTP3qWIKY2lMKCI5eQNEZOx6LIdH8+wHCcK8dPnur9N1N6dOsM4VrpLgM9en9nY64gjL/6nddZYMnlIgQ1lwVRnC5B+FziBVNo3OthVsowiwzwBQGOgcmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(31686004)(36756003)(6506007)(53546011)(6512007)(478600001)(6486002)(66946007)(6916009)(316002)(66476007)(26005)(83380400001)(66556008)(54906003)(2616005)(41300700001)(38100700002)(5660300002)(4744005)(7416002)(8676002)(8936002)(4326008)(2906002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2IyeW96RlhlVkJLSUlFSi9FUktDUjN2M3dNVGtNT2poODJZVTZ5Y2JnUFly?=
 =?utf-8?B?TjhYRlZhcktwK3VpeDd2OElIeHRrbmwrb1QwRjR0ZVdDYzVkZ3Vjb2prcS9R?=
 =?utf-8?B?RDhqWkxjZEcxUlh0bXEwNTBJZGt1Vm1oWHgyOGlWT2kzQ0Q3M1ZXZk9HeWp3?=
 =?utf-8?B?ZGtOcER2UGJ0OTdnY3lROThzeGJjN3NvTFBJTzdQMmQ3dmh4dE9LaGNsVmtX?=
 =?utf-8?B?VTNtdzUyTUtOUkFsRm5CSm1XMnlYYms1NEFvWnhXQVRiSUxJbTMvbGRhVjBN?=
 =?utf-8?B?RDZQckVURE1hbGpTOTFocURqWGdjRHBxcS9iWkIwdmwya0ozUW9XNnJBTzNW?=
 =?utf-8?B?SFczM1VwMnBtTms4RU1DY3BvQkQxTit0aXNEVWtlT1pFUysxcUdhay9NaFBC?=
 =?utf-8?B?OTdvOGk3R2RnRUs1V0JLZStiUWxJQzY0TFFVSE1PL29uZUc5NlJvVnVEWFV2?=
 =?utf-8?B?Vmcwd2wwVTlpS2NBSVFtc3Qvei9jdHA5bXR2OUpPajMvdktXMDlWMVJlOWhB?=
 =?utf-8?B?UVNOSlBDRThHeVlTUzdYS0Jmd3JNN3FjQ3ZrMGlBUHNIZUt3TzZ0QnE2UjQw?=
 =?utf-8?B?Wi95cUUvbzR2eldmNUtESXNHUXR6QjI2dy9ROUplYURsSlJMQXlqZDZPVlo3?=
 =?utf-8?B?RjFHaFdzZHNicWVLZ05DNE9tS1BVYzJoZitZbStpYS9WN040cTVhK2ZoeGpT?=
 =?utf-8?B?VkhYcFNGMUdtOExKcWMzY3FKWUtLcUxJYitrKzJJMldaMjVJZ1RzQTRsWmNo?=
 =?utf-8?B?a1ZSR0xSbjNHRXI1WW1odGJtNGVnbG5nQ3hNdk1DTUVsWDRSOTNwOVQ2TG5r?=
 =?utf-8?B?dzNSclQ4WDZkNlVNTnh0R1hRZHZBcFc3U3RXeHR1K0VDVEN4c2ZzR0lobEVD?=
 =?utf-8?B?UEoxbUJVNVgwMnllUkNRUkRyWkJ0UTUyWVRlQ2h6Z05wRXBFcFl6VUhxcTVT?=
 =?utf-8?B?OTNRZmNrWDR2NlFDcFNHNDdEV3h4Mk9kRWkyNGx1L3d1eVNFYmJMbkl2aVRv?=
 =?utf-8?B?cG5wa2l3UXBNL0NaekJ3TkttcEo0S1RtUElJSUtITXZZQzJYNHRZWlpleVN5?=
 =?utf-8?B?Z1JNMXF6T1UxVjVITnJzRmZPeENZZ3dEZ3hRUmsvS1NWS1J0VVh5RlBhTFdy?=
 =?utf-8?B?L2k1T0hUaFlzZ1ZVNWpmT01yckxHemlEbjVjNlFkVzN2S0d6SkEwcHpDZ25m?=
 =?utf-8?B?d1pUcWJjTlQ1QkFUNS9KUm9qeERtai84QlVUcmJ5a0phbXVEVDRDd29aN2xo?=
 =?utf-8?B?ZkluTTFBT0cwWFVraE9hYWxPZEhJdFVkM084STVENjVETnZKQ0FUTm5mMjIx?=
 =?utf-8?B?bmltaVh2UkVQZUhKSlZCbjVyRmZiZzN4dXdqL2RqNmQvR2NJVzhUdzZFVlFN?=
 =?utf-8?B?cFM1dWhlcmRCSktESExaQnRlNGRTSExQWHo1VlNRR1dwR0trSkN6K2RHUGNW?=
 =?utf-8?B?aENINVVYMm05NHhsM3YwancxZ3QyL082Rm9FRHhJV0ZvM1BiVnQvMGFYOHNK?=
 =?utf-8?B?ZWJDVW5xQWVTMTNXbmxhOVFNMHZMUTZPMkVCeDFFM29RalBxbUdWeUZrbTVy?=
 =?utf-8?B?RWZ6ZkloVnZvRHNIR21NdGFZZDB6N29DUGVQU3AwNE5WN2JkSjNrSnJkQW9u?=
 =?utf-8?B?bjd2RHlnVDEwQUkvcjExc2JQS002OWlEYUZrVWR0Y3MwUWt4ZnBjN1kxeUMv?=
 =?utf-8?B?SVRtL3hwTkl4LzE1dXBNMElHM2ZLNmZmZEN2UVhSdDFmdGRyUy9Md1Y0VmRa?=
 =?utf-8?B?dGRJWXJNMUViSG0rY1ptMitmREd3WStvZXA2WDg5S0RBdzBhNlFOT3EzYVJh?=
 =?utf-8?B?OG9lWFI2YnRFbVVSZjQ0bk5lRjNjYXJEUjI5dHYwTE5wRGhWbnV3UVpuUnNJ?=
 =?utf-8?B?cVJ1RHFnWnR5dndzSlk1enkvbjUxdk1henhkcXZMamJiNnRYQkZWZHZ4d3NO?=
 =?utf-8?B?SHduUzhTM01mS2tmaWFJOFEwOWxjNjg4N2p1TTgyTXlkbi9BNlV5UGVlQ2lz?=
 =?utf-8?B?SGVWM0UxbkxVcVNWU2V6cFhIYm50OUd0VWdWN2Q3ZkRYT3pNa0FjSzU3cGY1?=
 =?utf-8?B?YWJmTy9INXJtcDFOMEc0ejFURytESzdzTGtwaFNoUC9XbWFZM29nODREelB2?=
 =?utf-8?Q?qzw47dblY+x92bIfjWHkEdxB2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d11cb6f-ee03-48e7-fbba-08dbcfed8fe2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:19:03.2315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmtWZcdS2+YzworxlegaYStFMg+yEY5FngUjn6Je5pDi/3i1rnzqtn2gLaIRvF8XRlClTdGZywaSQl0HmHbRBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6933

On 18.10.2023 15:42, Nicola Vetrini wrote:
> The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
> compile-time check to detect non-scalar types; its usage for this
> purpose is deviated.
> 
> Furthermore, the 'typeof_field' macro is introduced as a general way
> to access the type of a struct member without declaring a variable
> of struct type. Both this macro and 'sizeof_field' are moved to
> 'xen/macros.h'.
> 
> No functional change intended.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



