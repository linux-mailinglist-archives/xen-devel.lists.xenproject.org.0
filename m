Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D218772792
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:23:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578540.906089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT18t-0005ek-KL; Mon, 07 Aug 2023 14:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578540.906089; Mon, 07 Aug 2023 14:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT18t-0005d3-GX; Mon, 07 Aug 2023 14:23:31 +0000
Received: by outflank-mailman (input) for mailman id 578540;
 Mon, 07 Aug 2023 14:23:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT18s-0004Yf-FU
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:23:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa26334a-352d-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 16:23:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 14:23:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 14:23:26 +0000
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
X-Inumbo-ID: fa26334a-352d-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPGO/U7DCfxzGQWEvpKfdkQQPs5aXdBDA8qtX6VKEUTzjz5iihamchD0Walj6UTMm4Mp8LJ9qfYJALNoFnnXGjuXUM+ohHg7V682UHxYeI7jSsC8pMhJ8yPngjrj2g11tdNk9YZlb/tt/gqbnBbMuqWVg89hWoWCSiXOwl4jBxYRJXp0INAFr4HDySYfunk7uJeE+1sWaHz1Erof0fZaaEDWxqSg96ctKDPHMOnAW1d6V+1l1zIfxh1lFK9Q67u/k7hCiIiREHhAZt521+F3TJ4QBtXWEHanEsj9TOhx6tQ819CFzssyqBnxCGS8U10Pqgc/agCZ4eiE2LJl1SX43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bi96kP+sbkDN6qlYvnPoiux1MtkQDCwocjDaI8mNUdE=;
 b=YrY2fO+DUQH+qlD0NEwnPi6NckVNHbWaJO+KTu2XAcVZYVEzWD7m7axOztxQB3pvNZmJq02wbPz1yPgH1LLN56fQ4vYfkMZrLsKhmnbyQeKYnxmcAuXc4eK35MrCBvbRg+0k1y0XRtnbKQ3WSyktl+TOBd674iznqyZu/DV7DNOWqfNjyd+avftwJZkpnvsGklPK28eKZ7kTOKvBe7yBPUozL0BjG/3sEOluFBlut1RLZ3W2D+QR840lRLkPhyBr7pEoGL8GLNHFb4xGnuJSSrCqIMQMztYFLXmNXl0XBmwADkEUgWgigDojcv5k1TQKrsWajEyMi2OzsWIXUCXUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bi96kP+sbkDN6qlYvnPoiux1MtkQDCwocjDaI8mNUdE=;
 b=p/BV17e2+oWb4SlIb0m2Y1b/YHc4hFbVtUB5Nly2IjSfomJHJgvD5XPJjjkE7MC97+kgkWJACgTeOm/mZZo39wRGz+jEzSuO/vj2A8dYtlqPP5v6zSKMyqD+vkQKXzBzozSJhKRyEpanpYd57gFX2n4z9HvLnEdJXVOeOkj5ysgp3EbxtJkTM40ACDG7PbLURJrvH0SeF2C8vqj94naalrdUvEAceJqjmHWAmLK84nTOFls9v6FwjJItcNZ2S+3j3LH6eMCzjeDyOEAjD0OqMHC+7qkTvTesoyC5rWVDhYOq7BibktK+FumPsioUfZGYTTtoRsuwKr1Hu0yW+Xgf6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d2791bc-4f84-5143-2c17-55586e424da9@suse.com>
Date: Mon, 7 Aug 2023 16:23:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 04/13] x86/IOMMU: address violations of MISRA C:2012
 Rule 7.3
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <ba2605e168cb65ca7f2e4fcc6b957b5ae0b3062a.1691053438.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308031745140.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308031745140.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffa08fd-d872-4998-cb67-08db9751dd7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CcA4hgImqimBGYUSp43z3h33nVcagLvQGM/L1qTw3tMLWHf/r33I5Zj/eKv5HCIGsPgt6nA9i/bKrAka24UlCYHLtllQ4gRzsKjEkxJNR0f+PIHPPDElMeQ4H2nb9kOiQorBDsXbsOQhh7x4Zw0xmaQqKpOgJkXN+lN9TpIuaxL3DNmjaZxowSr/sbCzYARVhY+XgD0yP6DxopIFZopt6FlXyREQ4eeYhJfeK7rFfBNttTYepC74VGAmY8KbuiBr6ZyvDtjN24uOjapgvamce7xUcumuHJlpDrJBFsYDYKluTcZUXfVZ2kn1eVtPdJoDHE4DrZi9X2TGwrwsWCx1WdqP6UB9P3R2dl66yQQBWei/dHYIU7Dl2toDS/YlL3T1MxBE+B6YTLVSgh0LGEl14dd+PXc3FuShGYpvFyM9KAayAS5m1n1D34HIvKtbfCJ/lYJz/b9pjAE8aeeKaVhVhaiI/kv9OHM7V3fK+TR5KF465XjHM1n+FfPWBE8695Xg5CryqxZkuL8xUdQjz46C26e20Jx0OxVDjXO5DeeNNGoN4iujGjjTATNVOjdJS+81MkXixd+rhkDsainWur10T9bOuhywlBHNxJLh2S/5g0BsWdhYy4QxsNAOxcRiYhD+eEQuaByTAE9v7lLIqxHd+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(316002)(6916009)(86362001)(478600001)(54906003)(38100700002)(66946007)(6486002)(66556008)(66476007)(31696002)(53546011)(6506007)(41300700001)(26005)(8676002)(8936002)(4744005)(2906002)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjA5cCtCV1ZYb3czaHpYbnlhbDBBVTdTOElvUDNlRWdyZTFRakIxbmd5RlFn?=
 =?utf-8?B?QnFod0V6WjFMNTdiNDFoMmRDRHV2SzBnWGVoT2swbHFaQmltcVlQRTB2d2tM?=
 =?utf-8?B?MkxUWDhPUFg0dzZmVnplNHhOTW1aK0NaWVdOUzFBZGVFc0N0MFR5YlpDM0Rx?=
 =?utf-8?B?Y2RzMlVsV0FnYXdOV2c1RWI1R05nY1FDOWJCbFVyRTV3cGpid1R6UjkrM0ZG?=
 =?utf-8?B?ekczZlVEUUdFdlNXRGsrKzFuZ1NOanJsdmxwNmhtbXgwZHhubnFrY3FYWXI0?=
 =?utf-8?B?ZSsxZlIwaGUraVVKTEZxSkYrb2NCckdqYmY2K0IrVnRIR3FqbGVxY2JzSmE0?=
 =?utf-8?B?aHNpMm1DM0pXNjJqSFB6ZmFBRE1pSHI3amhKbGZVcUNBd091bU9nS3JSNzF1?=
 =?utf-8?B?YnNFano3dVROam9wakI5NS9PQkkwb1BtSnpmendQZGFTQmt6RVF6RlYwZmxL?=
 =?utf-8?B?S2h0Zjk1UXJVWUlDOWc3V1VNbXZZNCtQOGg2OHo2ejdpcEVGWld2Mml6VGlG?=
 =?utf-8?B?UisrYVVoME9Zc2RMN09OZVAwZzNaWVRuZkUzTmhPLzBnSkhMaHYwOFAzbG02?=
 =?utf-8?B?S2ZKeXN2dXhiZEJmTWdtZGZWTmJ3TDY5MUN2UExlR0VjQkdTdGVWVnVnYldi?=
 =?utf-8?B?WllzbFd2VDNXUGhVb0JRTDYrOUI4ODMxeUp0VXVObFJUUkhZNUFTNzlpY3Bn?=
 =?utf-8?B?R1BrZDEwZStxK1YyQVdtdnkvVU5JUmg0QTczbnhRREJia1k5RDVPMk9WZmNl?=
 =?utf-8?B?UGozSUN3bjJWKzRXaTF5UWd4RDlhZkhiaDJ0NWFqNm4rbEpFekw5Rk5QaGVZ?=
 =?utf-8?B?citWMk5WRzVvVWU2dnJBL0ZxOUlsckd1ZFZjWmdIbVc5UWliVUNhd3ZQb3Ri?=
 =?utf-8?B?eW5NNitOckY2VTNmc0lSTXA3Zm5CQmY4d3pqcURvMk1YNVYrSXRsWXl1VzRB?=
 =?utf-8?B?QUExczRwVU9BejNEOW9iVnhOZmt4UVB2MmZtQlIwZ3ZmOEtudEMyYnZFQ0c4?=
 =?utf-8?B?MVNvR1NNYTFJWWdNaTgzOGJPdjdjVDhZSEFoUWFOQlVwb0ovK1NHRjlMcjlh?=
 =?utf-8?B?V2ZqZEhTU1J1ZHNjV3JyeERybytrWW5McXBIV1VTV1ZJcGdYSW5zejRiVUM4?=
 =?utf-8?B?eUwydGNvRHdEazdDL0s2WElqYVY4dWlzVVFUNDZja2FwWldmZ0xjWmR6YW1L?=
 =?utf-8?B?NU16MlRGT0lXclplWHlvTEFtZWdZb0pQNUtCWnU4VTlRV0FDNndlZmc1Y0Vw?=
 =?utf-8?B?eGlNaHFBMkQwcmwxSStjcllFLzJNRmZ6TUpQNXZWM0ZpcXdqcXVYMWdzVU1N?=
 =?utf-8?B?bkpHUXIvcHR6OHA3S3BWRENBT05jeW1rWXBoT1c0RFZsRGoxblhueGw5Q2hK?=
 =?utf-8?B?QnU5c0NmWXJqakRJMGlSVUdWaktZN2ZxWjlLdUFGTWFZTjlxREhYTVZsK1JH?=
 =?utf-8?B?Mmt0QzhuYTFkTHJzT2QySkxmNnZjbC9EV2RFa1NvMnV5WVhnZVpYeDMwM2dF?=
 =?utf-8?B?TkUyODgyNlNkUnErUi9aWUFFL3ZpWjh4WHRiRXdwQjRvUmttVGRacE1udnh4?=
 =?utf-8?B?a3dvZUIwQ1c5UEF2c3NqY0tWTDNyVFczMm1NMHU0NEo1cytWcCt4R1NLSjdF?=
 =?utf-8?B?QzlncVVtMjFvRWs4OHVPQnBUNHB1a2hMTWUva0kvZmdNb1BSU3JDMUM0WTE1?=
 =?utf-8?B?b3FaQ1VLaDZYSXE5cGJYQUs4QWNmMWFkOUlSSWlydEdVYzdFOURsT0FOU3d6?=
 =?utf-8?B?L2M0MVZyVFdMbHJYRy9tRittdUdUYitPblcxaE4xK2ZobVlpL1NucVVHZnV6?=
 =?utf-8?B?WWczOXlKYkg5bmVNTUd2RitMVWMraC8zcXRuTWpDdzhPV1BzYUprR0NzbitT?=
 =?utf-8?B?UjVSRVFhUDJkL0Q2L0xsdlFqcWdTTVVrUWFwSW04N0NQYmpkN0FnUnNYNXhy?=
 =?utf-8?B?amlndGxXMEFpZk9rUk5FRVdvSFhKNmplbXNMYnBlSkJKY0dmaUluV0o1WHpm?=
 =?utf-8?B?aVR2YzZMamFnQzBDbHRvTmRVODFRUnRnYnAxVmJGVHB2M0pTR0puVGYySDh5?=
 =?utf-8?B?NmFpZjhxM2tPS1QwZUZJMXh0STc5dWtDeGgvVytCbUZVbVM1azdHTjZjWWI5?=
 =?utf-8?Q?vWdFd/oYBMxzq9RRplotGAtW9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffa08fd-d872-4998-cb67-08db9751dd7d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 14:23:26.8345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzwsnWSqiFo5K/1+must17yHziER5WgxBMhma9D3TfgRkagdZ1Oq7uFlZnDSjA7ZMaXD9D5ltfDG7g2MtGIgtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824

On 04.08.2023 02:45, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Simone Ballarin wrote:
>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
>> states:
>> "The lowercase character 'l' shall not be used in a literal suffix".
>>
>> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
>> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
>>
>> The changes in this patch are mechanical.
>>
>> Signed-off-by: Gianluca	Luparini <gianluca.luparini@bugseng.com>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


