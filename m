Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DDE79FD2A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 09:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602082.938451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qggen-0007Nb-Cc; Thu, 14 Sep 2023 07:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602082.938451; Thu, 14 Sep 2023 07:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qggen-0007Kl-97; Thu, 14 Sep 2023 07:20:57 +0000
Received: by outflank-mailman (input) for mailman id 602082;
 Thu, 14 Sep 2023 07:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qggel-0007Kd-Di
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 07:20:55 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20609.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dca53d7-52cf-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 09:20:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8292.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 07:20:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 07:20:51 +0000
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
X-Inumbo-ID: 3dca53d7-52cf-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNKH8y78FjDDf5MlKoJId4cyexHuBIomD6vEPTINwAU191X5u+vo5oULkxcA+rN95BWy5T6OJMl9Bzgug2MdYF+lbDDSR82Sr8iZytkLbbbF2XZ/ZNrDsTsB2hYmIVk0uE6qo6oAYrxv/k6xOiVcLKoo7iijA2Whpwbk9kvyG33N9D2Tk2Adt/hKJ/fuHGZamk5wUWauoZbbzWWaWCH0WoXu6pwhHuiKQ67M6sKlRey7I1ywWasNNGhRmeRvsVmnMpK5FHNGACIXS1CNe9rqTy5edT2RoAZ3a48oPKycIyVBtDvwUV9HjoIFYN/tyXoz4gPoHAR/L2fq6AnE0o6SSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1GIjyqJaHp0A1kx6eE6El+vsyXkNGFvUP0N1lEPVJk=;
 b=UCthDF/+cGF7+lPJ6fteHhsy+5Y5Z5MveeOJUCTWtQfp6K84Dw/VcZaDVKSwleRTqWzKElfoJHBByDqrBXUJCGBFoV7M+Oi3rYY7yRRFHkJ5hCkxurnn2ooJk/Ws7LMcaQVo6x3BVn/ime/ASvXBaTj6xzIngPP4XBEY/VrCTIadMqFAd20k8H/aCNbNn6qAVVbDyrI808dGpzu8Ih/jeQjSaGwK//QocLEJQeLz5aGbjRp9O12erqkfGI36RUdKIn34Ann1gQ/PB/JbFzTBn+OX7ubbuPhPlW5gywUtFQLLYzbthjlRrCH5xp8fGE2q+138rYFp0OYi85BNl3Q4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1GIjyqJaHp0A1kx6eE6El+vsyXkNGFvUP0N1lEPVJk=;
 b=20rupHeEFu5Tyxn/4nHXYFEuFawQvb0lwvmIxXqAhrqouGijRKScqy+C3WKWTR/HUceUS8rpXrEtBwp4eJplA8f8YIEP+hHTQ+ixEvtbr5w9UyzdRV7Z1E9eTFYRsFnfqs1aQxGvWtYqXMw0AKsvtLsijbIo5NcfxwWVTce97E9L/V4vJEuqCOJZ4adAKscWW2pvOyk5swC0mGcmALE//qoIEkMsW+R7wNB/YiD1wBDBqB+PyjZ7zqXm2kdaIAvUt133PgK2o8mIALjNjemoD7dxyBgF5EY12ijC6Ij3uKBvpcndZ8SMEEPZrptf7NBF6zN5Wvk/1a/s7leSG0wqiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b44bc6c5-338d-0e42-e516-31ba6a457914@suse.com>
Date: Thu, 14 Sep 2023 09:20:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/8] x86/spec-ctrl: Turn the remaining
 SPEC_CTRL_{ENTRY,EXIT}_* into asm macros
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230913202758.508225-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0214.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: faadb641-898c-4ac1-693a-08dbb4f3207c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Y9AowtdM5lF7F/SuRh/usoALrrxdL/cIviySby0I5X0mgEacBMzIF3+tM/26h8Whzu9ZstGBqtmJwPEu9Zpd9g3hBMOHe8c8NO6INED9Sb8W6/1zQaCIqmMDilxtNyRQsOvc9JM2Co93iJ+miOJ6zWS8MjnaYmO0wSroWpySBuR6iVAkoJ3CREOcjAkenqEhtqKoqbFty6/jkMN1jtr8PyUnPML14qJkjuUIWoWmoAfuCyNc+GZCRfuBu0O7ZMSVbEiwmcKQgA/Nt8Wehuxuke4rhFWe3DBIkeerMa34P5epHiYRbGHO9bI9uDMpn1EMlG0bHzdoD9pDbUP3WCr/y9wQc+KqE7VSczVzS2BhSYHv9d76I+L7M/nNq0V4DxyBEXLkxwlfRh1TOo2yt0vLdA7y9T/xU4CYq5c2pR8D5fqjA3qS+B/PJStvJg1u8lb+xbG0CkjY8QCgU4FSoxUiXoji6NlQL1NNy2J1VamydZKXlrm3CxZ/hHAAQZ3fXqac0VdR/nOUxE4FDRsjuuUOWFaI0OyXoK7tfGu5wrgWz02S7D2Q59EG91qYFmfZ7/tP4m2YMx96Nc4zlX3dTOi9LYMrBGX7f7tQkysLxaC4tnzaXX0bPbSPWK+kppZrOtnzaOG8ygE2iBAy0HvypGSPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(366004)(39860400002)(186009)(1800799009)(451199024)(8936002)(8676002)(4326008)(41300700001)(5660300002)(478600001)(54906003)(66476007)(66556008)(66946007)(6916009)(316002)(2616005)(26005)(53546011)(6506007)(6512007)(6486002)(2906002)(31696002)(86362001)(38100700002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHJzamhnM3lFVUVkOGJHdFNnRFhWemMrUnFNNGNMS1g2ZzdXdUFSTXJ1d0ZF?=
 =?utf-8?B?QytsNGFLc3BRSkpVc3cwRG5Mb0Mzb244N1lzWWRpTndMeXBpTUd0eGlocVNX?=
 =?utf-8?B?OHpaVW5KMnVMN2JnN1RMQlJpcW9meC9PcnFRcGJKNUpkSnpud1Z5SFpvNnE2?=
 =?utf-8?B?Z1UxT01KclZLVm1tbkdrVXE3Yy90WGxjbCs1RzBQRWNwT3paMnYyQnZNOUtt?=
 =?utf-8?B?UVNUTVU4eWpyczhSc0xvTG9sTTBnNkYwNmpwZjI3ZkpPN0JMMHFIRlJmR1JZ?=
 =?utf-8?B?L2pycHVpK1BQY3dLN0VyQXMreUl3QW9OS00rREFoZkd1RnRBSkVCR2s1THdi?=
 =?utf-8?B?QlJHWGFqcVFhVWdINGN1UDEzVGRyOFJmVTU1V20vUmJ3Rk44QlRXclpQWEcz?=
 =?utf-8?B?eEllbWgrL3EvanNSTzZ3VUxudUsrMW0yK0Q2ejVJbmF5TjZhV3dNc2cvWWE5?=
 =?utf-8?B?MXN6Zm10eVRRQnMybXRjY2U2c1pUTFhCYi85SzlsK3F5WW56eW5ITmwxVEVp?=
 =?utf-8?B?eVFWWVh4V1N2dlYxWEJ5WHNxOGNucENNNjNickVvbGRLbEQ2Y1RBQ0JYd2pU?=
 =?utf-8?B?QTA5RHNURjN4cDhtZVE1OGRIUW9JOWFJaXhBVjAzTDZZT1dyTGQxd0s4OUpW?=
 =?utf-8?B?VXZZR0pKTEM3TVZNQWZxU1ZUL2s4Wk95WmJlc0pFUk9kZHV0ZnlnTExOMW8y?=
 =?utf-8?B?TlUzYVVrQTFvYmJLNHorOTB6K0FCMkJQVGFmcCtYRVk0dXNkdEVha1hSak13?=
 =?utf-8?B?dzhCT2dGdWpNN0hWZmhxTmlIS1dpQ3kvVjhhNy9XN1F3UVNpZXFCaGs3UDlm?=
 =?utf-8?B?TjhXdG9iWGdGaVhzNEhXMlo3bzljZVU1SkI2MFIwWkllQWhvUmtVLzE2TGVh?=
 =?utf-8?B?Slp5M3Jicmd0Z21SNUJNWW9jbGZ3aTlRRStlWGJtUUVucCs1NGw1Z29aUTlv?=
 =?utf-8?B?em5kLzhmdDRhNEtlSFVJdnFLa1EyYTF2WVRJYU4vTVV4eFRkSm56a1htZDZB?=
 =?utf-8?B?MVNMa25TUGZqSFpER2VqZUNyN1lOenhJQ2ZZTUdMdWpkLzNzSTdlU09jWmVk?=
 =?utf-8?B?eWZZV2pUbVFTOExiUzM2ZWNkLzlmY3BZSFF2bmlZZURoMGdDM24rcm10MXBZ?=
 =?utf-8?B?VDlBUUhJbUw4RitMZWFhdGFSVlhKMHpaemhpZGlYb3BuREMrM2ZXamNreFQw?=
 =?utf-8?B?ek9tSXdEcVpFZ3ZSaWQrZWpEdFFjb0pCU3UxS3NjVk9BajQ2R1RUT21OMFBk?=
 =?utf-8?B?cjVqSzJzbnpXNi9Dc3N5MHpaTmw0cnJPV29HaUhaSXFRM0R6TjYxclRybFN3?=
 =?utf-8?B?bWRqZTRidXpIMDNlVDY1QnNpK0JpOW9oa0ZML3RYWVRXeVM2eVVVUitJOEJK?=
 =?utf-8?B?YzdaaFo0RlVPeGhKcE9GMUp3cllya0lsZDVoa2lmbHF1T1l5N1JjTzZJWjgy?=
 =?utf-8?B?dXhVSVVNV1RzekRzRkdJa2xvR1g3Ykxxay9MN1ROZXEvVUFhNDZCSmxtUnZJ?=
 =?utf-8?B?K3lKcnpMZGxLc0VaRDJsQlY5WEwvTVVteU43TGxqRmNKRHBxVEdrejNDUzFM?=
 =?utf-8?B?M1dST2F4N2FCcFFKbUNQMDNoanVMdW93TjhrVGFQSEo5SklCdGJJLzhjM0Ni?=
 =?utf-8?B?WDNoNDZyeWkyMFpBSVJCOFZqSUhZdy83SE0vaFV5Zm9yQnVxYWh4aGFhMVpq?=
 =?utf-8?B?TWZjQjF1UTdiT1RwUmhsSFNHL1IwbzgyY2NpaFZYS3dpQzYra2RucHYwTDdh?=
 =?utf-8?B?bFp3YlVpVFlxZFRHOE00YURic1RxeEZkYmdXSHdYVkdBUUJjK2hMQlhLK3Fa?=
 =?utf-8?B?UnhFK3dwemVMejYzMWNFT1FESkswNzgyUjAxN1hPbzNnZDNOMXpOR091YTh4?=
 =?utf-8?B?WkxEMU5FdlJER3ZUTCtsSGlNdG5XUGxYa3Fhc1htTzlKbE9SOWNGNXpyMmNY?=
 =?utf-8?B?SnZJZGFFdVFhYmUrbkxFLzh2RzNZZlV4OHBZYkErNm1ZZ0tSYm1IN2gzZnBJ?=
 =?utf-8?B?V2VhaHhxcUJ1SDJzMjRsbGJIaFV5cUplbjlJYUZkbnJtQ1p1L1VnTitIc242?=
 =?utf-8?B?Y2hPdEU5YUJZTlNXZ2xuT3p1aE9hY2JnWmNja3FvMHlPWnVrcG9aRDltT0Fh?=
 =?utf-8?Q?R8qTuVohx/XcQcy73aFt4vcy/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faadb641-898c-4ac1-693a-08dbb4f3207c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 07:20:51.9406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5qstN0/5AN5Ueb6c1XWIcflJktN53K45ZSwFXEy8ZO0MSMg/HGoSv1Mrot4WIHBvFS62hEwlwNrw6l0QH2c/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8292

On 13.09.2023 22:27, Andrew Cooper wrote:
> These have grown more complex over time, with some already having been
> converted.
> 
> Provide full Requires/Clobbers comments, otherwise missing at this level of
> indirection.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

>  /* Use when exiting to PV guest context. */
> -#define SPEC_CTRL_EXIT_TO_PV                                            \
> -    ALTERNATIVE "",                                                     \
> -        DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV;              \
> +.macro SPEC_CTRL_EXIT_TO_PV
> +/*
> + * Requires %rax=spec_ctrl, %rsp=regs/info
> + * Clobbers %rcx, %rdx
> + */
> +    ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV
> +
>      DO_SPEC_CTRL_COND_VERW
> +.endm
>  
>  /*
>   * Use in IST interrupt/exception context.  May interrupt Xen or PV context.

I'll need to carefully rebase "x86/spec-ctrl: add logic to issue IBPB on
exit to guest" over this change. In particular the use of __LINE__ there
(which probably you didn't really like anyway) won't work anymore. Yet
with just a single use of the macro per source file we ought to be able
to get away without this extra label disambiguation ...

Jan

