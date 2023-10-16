Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3527E7CAD0A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617732.960647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPFp-0005OY-7q; Mon, 16 Oct 2023 15:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617732.960647; Mon, 16 Oct 2023 15:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPFp-0005Lm-59; Mon, 16 Oct 2023 15:11:37 +0000
Received: by outflank-mailman (input) for mailman id 617732;
 Mon, 16 Oct 2023 15:11:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsPFn-0005Lg-1z
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:11:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a7acfea-6c36-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 17:11:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:11:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:11:31 +0000
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
X-Inumbo-ID: 4a7acfea-6c36-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boetoW581PqXSEZ2j5XuWCbfBqoPSXzo/FSJY8fepkkEU5+xBf5Ss4um13U0/rowR9HFFveLY12wxHAzRnenbS9D7OktIItC8J/hsdgBOTPSL/o8+F0lYrk+zuchRoLcR3iNYl4WAztxWEsTXrrAS9W5BOsNHvbOBg6pEGSvnWeJITBEHzwyEa5hg6z5xC6cO4042l3PnX92MDJnmfCmZhebY4uXkqq0j8Rr6Xh2+MEU7/RfD45XlpmrA5dTUPtSZyxF4m9+3+CaK4hBFoYckgCKZhnbR3719VAJ0LV8yI/GHOMVnWXvc/YPgcYt3wyy9/ixF60UGUFwHGpC/Ysidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Urt7KL9uVQvawvoXwmOneuQfMzS8+85N5075XH5t61I=;
 b=VQhLMBSFCF5sfZYSl4k98eDMyNJIVNz0SwD5Zrxx/gt+nQG1b/KmtPLv1939LDF7DTdW33WoLZyfxQLjRXHUKeONsGobI0FuJMktY6zlH7gzUf80kqsSlIxf2qlkNHL1+fQzP/zPjxgHFAt1mq6X70JygUBTQVUYoOLXPUVPATXFGo1g0tmTHYb42Ia5URXorAov0eE+fKi5siYtPjOGw9PHM+2NVB1kE55lAp4r8REs7vT36B32ZGjAuUtO2L2LNuOYQuhHI5cdeRkbPKesmtoBJ6SEtPcIZo0cmbCbAoD9BKQrdl87dh8A3kS28Me3B3Fqk4iJdqnDa2EVf/7J1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Urt7KL9uVQvawvoXwmOneuQfMzS8+85N5075XH5t61I=;
 b=u5lsQbDQxdowIcCWKUfLBSw/Kgb0S3CwS1HWXvQlvIqYIuc8yOjDqIlU4a4bXSJmis4v68VJXvLEs6VloOUB7PtY55YF6ptvvBPfDqKS7xilQHTasXDT7DvGz7UuvKkLIw4N6snU/5FCmsL8H0Z0C3cVO/v9uU5mhBdnAoK6dMk+UnM+7TKA3orOoRf5MOifnSkFsTQ6+vF4J0EAYH78W3/BWCaWlglsl3+KuiLVWcXJ6eixAMjBdk4C5if7w/P9kVsc7Zq48zG4rCGL30FrB0+f9YqrFiRJ8ltpg/Ghu++l29A3rMWpgpIPL8wtol+yCSml4dARuqkITWckZVNI2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b8c82c3-0eeb-799e-edb2-fe7f64e77b87@suse.com>
Date: Mon, 16 Oct 2023 17:11:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] x86/paging: address a violation of MISRA C:2012 Rule
 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Henry Wang <henry.wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <5a304ffd4fbdd0d5809dc68b857410bbc02f32a0.1696252375.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310021546070.2348112@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310021546070.2348112@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d3a040-e631-4068-6f87-08dbce5a2d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J51+CNpw2Sx359k96UEBW9kf7P+4cQF77fGKyi8J0amLcscg8vkGCdNXayyjr16S9bYCybyBvja7QrHOaTFv4OzLichdr+V3E72048ji76berqTU8X5ijGhK1ZsFpcL5VdT42vJVQRgvcvwKE/Q7+mM+F3haoXGI5o5SOG4yWmkGA1WK5QJosLbExdRg0E5SMHoj25LnVK5g/LJlcWEIEyfbvbZwLpbdXOU7PHisp8HVGptrMQbFWiheAhL101vqfefSUStT+agiF/oHj2C0hFAlfDtdGxzDAbXODIM99ziSWBO+1Q8rp+2fUIAK6VJdAc/LGWURKlyIs3BTN4VHZHFGWwcGEJnJ2uEsgcwlbB2WmrFDZKpEitUVOra9QaPo28YKThWSeGZW1Ze9dotRcGsqZF1X6Z0ADGbJoNNMA2+OCXV0nUmg4qLtbY3DKum54fSvUjyMJB4swKHvEfCNpR1uu7xOOAfLdMfESGspU+XcBcsW+0R8smaAp0ZsinYtQbJllfiNYiEUVjpb5RTpkZ2Tv5xghAV024+aSkPkwaGdqVJ6x+FlZ9GDMv2gPFvVPwq0A/sqfpwZtk9JBdjGerqXdh2OGnRuAuAtZYBQpH4d0anEBHf5lrrYEHBnCpiH2ol+0dOsTi1XDOgrAHyMIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(396003)(366004)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(4744005)(41300700001)(6486002)(86362001)(478600001)(31696002)(66476007)(66556008)(36756003)(54906003)(53546011)(66946007)(6916009)(6666004)(6512007)(6506007)(316002)(8936002)(8676002)(26005)(2616005)(31686004)(4326008)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEcwR2xncFFYaCtOa2ZRYlJFTnoyREJDSCtSdTJodlRZWGRrRFUyYWhaT1N3?=
 =?utf-8?B?RXZ2WFB5eXFJTXNZM2xMSGIxLytVR3d6Vi9lNnNoWGVaZUdodTN2RmE0dHQz?=
 =?utf-8?B?MzVobk1FZVVtQU01WERuWFQzNjZmMzIrakRDQkFtZmJTVVBaUkgwaCtkLy81?=
 =?utf-8?B?LzJLZm9wbUwxK1FBTURGOVBnUE4yYXNaMkR2WVA0SmRoNWFuNGZLeXVlTmJz?=
 =?utf-8?B?SDVwY2t3ZzRsOHc5QWpoSVg4THArU0lmbG44STlJZXUwd1ErNHFaa0FPeVlG?=
 =?utf-8?B?U1NKQ2JXN0kzNk1DKy9rUVR4MDFBTXlVWjhlbVhLSVdBeUoyM1J5MExaQ1pC?=
 =?utf-8?B?TlpjU1Vjb052S3hhRWNWWVAwUmd3Q0NJaXpLN3VsQkRDV09LeVY4OTJOTzZX?=
 =?utf-8?B?Y0JzMEk1aElYUm9LOWlBUVY4M0VIdmRGM2hTN09oU2lVeURrcU9JOHpLaUJZ?=
 =?utf-8?B?RnpOeUNYU0g2dlZaVTBDZVlGUk95alpoaDRlY0ZQSGRYSVZiWURTOWJQdmE0?=
 =?utf-8?B?dnBSRzk0NFJyWTE3Y2l3bUQvcXhMRUYrRHg5M2E0S0l1ZlFidU9td3RCNity?=
 =?utf-8?B?QnR3R3o3VkplWklFMkpxdVlYSDhuUy9KNm1KbE84QlhadGVOTDJReXAwcU1E?=
 =?utf-8?B?aHlOS0F1TWJ5akZLT1NFd1VIUTlHcGp3T1RBeFAzVDVETHNFM2ZDOEdkc1VN?=
 =?utf-8?B?RlhDWkJNWnJKQlBTd0sxcVg3b1ZjdGs5VVh4UmdLTmdHZWhUK2FsdVl1aWVh?=
 =?utf-8?B?WHpyT0xmRHJqMXVTRlNnR3hlTGtsdXV4YUxLQW1iOFp5dERYV0pqdjZTOWZu?=
 =?utf-8?B?WURWTXlmbGNIcXBkOERyYUV3U2FtS3FFNTcrcjV6cS9JTHlIU0hUUDFGc1JM?=
 =?utf-8?B?SXhUOHdmbjZTc0M0bmxSNG1IdENFeVZCM3piRkNZdnExVWh5RDFMeHpBVFpT?=
 =?utf-8?B?L0NqUWtlWTNiY3hKOXF5VkV0bEc4Y24xb0NGODBDUXlxVVI2VmN5eTVRZVo2?=
 =?utf-8?B?c2x2ZXlpZXJmcGVaYWdwN2lOdnBRREpodHRiSkVtZE5uWmhlOU9DRGNKNHNE?=
 =?utf-8?B?a3BLTFRuV3hiMFo2aXVlczhtblZEc055T01Pc0k1OGFDby95dmU0RWtjT2xE?=
 =?utf-8?B?Rm8xc0swYzlmaXhsTEI4WlcvaWQ5ZWNyNGlNbE5VTDBuYmEvS1RVQkhsSnho?=
 =?utf-8?B?TTNtTnFnVHR0UzJGRDJaNzJ1eE9OcGh0eDVIdGJhd2xMejZNQjRsT1VnYXZx?=
 =?utf-8?B?cFpyTWN6blpkY1RUbHFxUlBvN2NaaVkrWEttMlVCbnZMM2N1NlBpNnBXY2RU?=
 =?utf-8?B?c00rbGdBT0dIMEQweTFWeEY1bzhnYUphK0tnTm5tWEhQSDd5Z1ZOb2l4Nmpy?=
 =?utf-8?B?aUZlZHlXR3U0eVAxckdLcG1XMFNzbVhLSXRuSHBMZmJFZWNUcG8zcHkxOW5n?=
 =?utf-8?B?eXIwckJDMnhwZUg0V3ZOd3crSUZtRml0SlJoZ056cExqSmI1MFFDaUxWbWRj?=
 =?utf-8?B?QXZvSzBBdWx6c3RoSEdRNUNiaGNDc29YaFdYTHJocFA3WFRydGdKNXArTXha?=
 =?utf-8?B?Wks4SUxEc0gwNjNLamo3U1g3STlHWFJsczQ0dEVMSkswRXV3cUZONUNWYTRV?=
 =?utf-8?B?R3FTeVZkRWJ0dkRydHBFMEVJRU5sSVpDcHdrZTloWGN6NHZrNGtuVGtxbWVi?=
 =?utf-8?B?Qm1sNnFXcDZaQUwyVzhka3RXcGs1UXJqRFlLaHNscXVmdnE1cnNWOG1ISi9J?=
 =?utf-8?B?b2FRTXdhN3hET2VMVEd2bXVyL2FLR1l0MGs3VjNuc0I1UlF4SDJWQnlXYWNV?=
 =?utf-8?B?OUtRaWt5MnZZY1FhMk5tcG41MGRPdCtLL2N0eUpxOFBHbGtMZlhUMVZ5NDVs?=
 =?utf-8?B?OStYamxpbkVwcWY5cTVUelYzdlMzK0M1ME9Zb0ZZcFVnQVB1MytIQ0U2SEw1?=
 =?utf-8?B?MmxoQVhJbG42Y0cwMnh3YmtQdlhlS2ttaDJ1bnpYQ1dFeG4zZnFUSm5DMS9y?=
 =?utf-8?B?ZHNneHN4V2h0R00wWHJMWU9VaDdLbUFRRVJwUjhiKysyblQzQzdFT3Voc3Uv?=
 =?utf-8?B?YTV0MENXeFVyd3B2Y1hMVmlYM2VEZndWd29EYjE2b3dDc29ITEZmaXhvV3Yy?=
 =?utf-8?Q?44GpEZsq1aKQQGd+BdQB5Ujt8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d3a040-e631-4068-6f87-08dbce5a2d7e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:11:31.0642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upnP8U5Jy4CGyPK0BuAGaaiLwNqOdQR2S1Gzlfv3k/NwES01UBCtjQe4Rlt9vM1vhj/s/RrA1oa5orr67zS8pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9424

On 03.10.2023 00:46, Stefano Stabellini wrote:
> On Mon, 2 Oct 2023, Federico Serafini wrote:
>> Make function declaration and definition consistent.
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


