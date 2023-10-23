Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB38D7D3915
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 16:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621505.968039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvjX-0008Ou-PZ; Mon, 23 Oct 2023 14:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621505.968039; Mon, 23 Oct 2023 14:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvjX-0008Mj-MV; Mon, 23 Oct 2023 14:16:43 +0000
Received: by outflank-mailman (input) for mailman id 621505;
 Mon, 23 Oct 2023 14:16:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quvjW-0008MZ-4b
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 14:16:42 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8b06691-71ae-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 16:16:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7049.eurprd04.prod.outlook.com (2603:10a6:10:fc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 14:16:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 14:16:38 +0000
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
X-Inumbo-ID: c8b06691-71ae-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbIEQ8+O7YJf6F5klUbanl75kraXfM2oHe9Nl4kz7XvLGloZWO7H0l0PCj4SKasiZQhyDjru+YbEtdxi7J2Fwaz+3GTWrn/gCIHjOpzJO50XrZbTUwsEMKdk6NsZFKIx7JOUEz+v5XKKGGg5VJnD5GIezzICXDBnyLyroKWXqGdSSEZype5Gdkb+QWdD7YtTfCZQklpFSo3DtZ9/0Mi1ssLcvMOT7c3SnNJoOQfdJp0EMBVqxc/WrPHF4J7Rn1Ax0EAmJDSvOCbfkJBYpnGZJnyzl6uQOyfY+DAFVaFTyfyCYeJCG7MtDqo068XgvhjM946wu1ktPhTXXwIHcnXmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7w+nHvHM7guzDttZ/Og/8NVY9jNe0OnmBbU6cf5UEw4=;
 b=Bkv2aQEbyyVa1iFiLPSP5quqInlyIcxzTfUUwIuGT0bSYXpS+nEPYyVc97vf2sixp7eQ9oke9UWPHG6E1O4WReFnHQao7EgC5Ie6kgMJZ72s9Kv7J4SLJmStKi41BZpiuoQcYoD7jaGHQ92y9fEHJX6cytyGUCtG9IpRb/TEwHG+DA6nON4u9cWLwiYJi4t5Xe3tLIn8y8z04R6ih921ZW+eIwsGA7aoxwZOSvkZjZFjo8pKQZBG4wjoilnfajL+IZyL/p882ZOTk1Qf0wyxK6zEGrv59H5v4R4fRdDd3skCKadkfo/jf73XZ8GlqndqKzHtFOUAl7rprtOYkcQ4jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7w+nHvHM7guzDttZ/Og/8NVY9jNe0OnmBbU6cf5UEw4=;
 b=e10jHUc2ktcs6jYAClr3eGcJvXnbJMdzfPov93GiA5lpTnTG70pR9Ji6QrlLUPoBKj+5drzhOQ25uPlOp5EF1J+wNpL7CC0v0o05G7NJsVg3GUCJJq4gO+MwcOgurb5aj1B9yFf4+XEFsPpUGQlujJfiHDUXKGSXSoKZgnwcIYuwwVY9ms7zXDH0tWbVlMJsiWsGT5GHjXuPKaV+1gz+DIYZAME45B2OK7elieOJ7y2iyFKYtChIMqFWDfkQZQKuAx52TsDLJ8hoa8vIPYlg/pB9yupqRtoCuyA3jggzqJ7kcRj2M5ZnQCKFN6lrUdy4/9nqgWeSOPXtt+KUwFA90w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d5340fe6-f824-9afb-21c4-2ae46250fe27@suse.com>
Date: Mon, 23 Oct 2023 16:16:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 5/7] x86/mcaction: address a violation of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638486.git.federico.serafini@bugseng.com>
 <80b8eee23c265708dab569b513da9fbfc81febb9.1697638486.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <80b8eee23c265708dab569b513da9fbfc81febb9.1697638486.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8c0776-31eb-4494-af17-08dbd3d2abe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TeVT14gkj7fMN8rJ2DEes6iTy/FifHMGFXHXNSsliyfSIPX860tG6Ns9O2FubdcEHWkYvxKKeKeLlDXAyjyHshm/URU5lDNLCZh5Cy/0E2tH1BtavaUNChJ5jjrUoxQczrKwizM3v6IYg0kKkBhUNFldZp9KMtmKhbhn1DeRF2OD2Rz4WMMLIIq4OHXB3kb00znz0YyS10lsULlrIuMXpjYi36tb95Eth+EcM8UN87ihuirma3Bswaprs/485waaXu5B6wC2EhdQx3gLyqN3uGE0AVqzVj7E+u5U5WTKnWRI9/6oN15w4d8k/YZHRzrXaz78ZGR67hcb9qvTVcrJg6zvZM+3Q9Sho0Yv/cR7I8I2npDXmuPenPG564fFJeAjZmKA/kbxY1k7hzfoKXg+7XnOTDeOxvChZZ3aZdmG4gtxyeb32gB830xFAGCYm92wte78UStEhd1itFuKBW3A9bSq/czgSoX6lkPIdCY43TF1gzhCK3hsXqTgA8wABEUikd0gCSPwcgZ+hT4KZspG+2O2+JZMRLL0gIM/wAeU+6VUcjcQxBgeZ+uBIHENvSbBi0BAndKGOZJAOU8r1GkwKgWHsjK3iq+q2Bx6/Pjgzsm1bgrHJdQw6oFPf+Qq0LQEwbPhARRaMiRj/qgzMJgqrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(26005)(31686004)(41300700001)(38100700002)(2906002)(4744005)(86362001)(31696002)(5660300002)(36756003)(8676002)(8936002)(4326008)(2616005)(6506007)(478600001)(54906003)(66476007)(66556008)(316002)(6916009)(66946007)(6486002)(6512007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVowdjVTbHo3azlXQ25BOFRWMmRkUVlsdTllcG9KK3pVQ0lmNFRCLzlQclVo?=
 =?utf-8?B?dStpKzJtdjBUaVk1RXVNVEVjWXhEWVE1ajN2ZGJHdGtrd2orV3l5YUZhdGJJ?=
 =?utf-8?B?Y2FDbWp1aWdDenY5L0thNUJiZElHbWR2RVJMV1cvcjQ0M2lsbVMwSVhWcHpy?=
 =?utf-8?B?ZWJlbkFRSFlENXhJRTdoNGRJZHRZREQ0eTZ1dy9HNDRFOWJJeHlqYlJtYzhD?=
 =?utf-8?B?Z2c4cTg3MXpVYUozbHQxcXg4UWJMbzhIUG5IeEU2L01PaGlGWEVUYkZYRzk2?=
 =?utf-8?B?TDhLZ2FQL2hmUEthc1ZIM3djOXU3OXVSRGtmdzY0NTN4cmdHcEY3aXl0WTJs?=
 =?utf-8?B?OXFaZitaUjFKREl5MElxaXhOdGhnM005ajBDNUlBS3ZGQVNZWXJQVVB5bGc0?=
 =?utf-8?B?a1BXc3ZtTkZDSTRpVjgySSthckxRcWxBVXRtU2pPTzltZDJ6Y1FPR0NWZ1JW?=
 =?utf-8?B?Y1pWaUI0OFNXbkNmeUtSQ1FaV1FvVi9LcjA0TE9xUmZLR2ovSjBOMFd5UGhO?=
 =?utf-8?B?Ni81dENMc1VhdW5nMFMwdk9pdkZDdlpEMWlPL2pxdXppcEI4MEgzSkpxTWo3?=
 =?utf-8?B?QXhieHBnSFcrNHpvM1FMSDRCTHJOTzB0RFF3bjRuVFo5V0JqQm5CTTIrU3p4?=
 =?utf-8?B?ZzJqQTRqYlV2eU05TUFLSmNoWTk3T0FBR3VqYUthOUtxQTRDMklVWkdyMnI4?=
 =?utf-8?B?SUhmMi95SFNHd2hIVzJKakJXeWUrZzZmb2o3Mjh5a0lXQnZtZDVEcVZlQUVI?=
 =?utf-8?B?em5lN3pwMEtyQnUvODJleW9MQzZOREg5WTJscDBqYU1IbTF6RnI5MDFGcVc4?=
 =?utf-8?B?TUxPTEZLUG5tYk1ZWmRGMWJGSGdBNnZCR252eXM3eHF5TnB4YzlYQS94OWR5?=
 =?utf-8?B?Vy9RdVc2d3FDazdIK0FCdncyUzNpeC91VzlldDI3R254Mm9oK3REV21Kblgw?=
 =?utf-8?B?NzFXOERVWW9yVmc0UmczcEx4YTRQc1BSTjBMSE9uMFdBYmYwTlNvZ1NzeUcx?=
 =?utf-8?B?QXFBOUhLVXZ3ejNyTUtMWGdDVXNheFdCNllvM3VzZnZPT3VkUnFoeGZIZEY5?=
 =?utf-8?B?bHhnOEpWWXBxMHI3aW5VbVlTd0I3T0ZxakFMTUpzcXZETTd6ZE5SNWZ5T2k4?=
 =?utf-8?B?TEhUTWxINkw1ZXRncDRvV2c3VTBmQnJjc2ZRZGY5UnpneENaWlFBbUZvc2U1?=
 =?utf-8?B?Ti9LQ2YwNVNhWkJGUDFjb2FLM1NLdTZWVzZ4aWxXTmc1d1VFRWVmQjJOZEFZ?=
 =?utf-8?B?Y3VQZkVxVmRINXNTSW9PN3VyU0dldFk0ZGkyZW9UR2hTNngzT0NKQ2ZqbjRS?=
 =?utf-8?B?R0MzRmVzSzg1SjJXaEJBMVovSy9ZTzltUVNPeElHenZUMDZuclAwSWdVTDdj?=
 =?utf-8?B?aEVGY2JIdmhlZEZZT0paZVFoYkVOMCtVV0k1ZDNtY0hwNHRMMm4xdFg5UkRM?=
 =?utf-8?B?WkF4MTVwbVJGZ2tDUWdrOE9HbGE4MWlIM1BOa2M3SW1Bd1ZERHAyV2I4cHZG?=
 =?utf-8?B?RHVGbmJEZjR5aTdxZVU4aVhmT0UrZnRqWTU1WGdTckttS0hKNmpmSnR1MG5N?=
 =?utf-8?B?UkgrNzhxSlk1bjVZMFdPNENlV1VQQWdyeXE4ekJlbHBmeENxTmJlT0JpMW5P?=
 =?utf-8?B?R1lhbUxha21FY1o0dkJMb1FuS0k3MW5mRTR0RkFORmlEak5lYmptZkZONmFY?=
 =?utf-8?B?Y2toeWIycU9FNWttOEdScjdUeGorVkJaNE1mckR3bXR6RE9YR3ZuYVhlWnd3?=
 =?utf-8?B?bStmQ2hLMmxKLzBxSnhicTZJTHlVMkZBTlZBS25wbjFEOHZjWTlvN00xbzYz?=
 =?utf-8?B?elREeXVsdjM4dGozU1k2NW9xRzZ2M0lNUWUrZFIvdUtlR3FnSDNiM2xCQWhP?=
 =?utf-8?B?VDZXZXU4Vk1pVnIyZzhZakI4NVVWMUlnaGRMRkhPVlpsK1FMckFKZmJIQlRW?=
 =?utf-8?B?elVaeEtHOFJHV0hXdmw4SWlnOGp0d0pVc0FvZEhTVUthYkxMUmlIQU5TSDlT?=
 =?utf-8?B?UWhhQXRzaWUyK3plY3RSdHhLQUxsSHZWWW9oTnNVYVRITWFYZk4yNEtwb0pt?=
 =?utf-8?B?djFuaTFTRCtLOWF5bHhTQ011NldSanVOVjV0ODhCN01PT0doOGV2VVVlaTlL?=
 =?utf-8?Q?+UKxSxvXsVNA+CvxvvbuIn5d9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8c0776-31eb-4494-af17-08dbd3d2abe9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 14:16:38.5358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEQHaRCIyQ6AME01lV6bPw7eJMjHq52+XWhyqYx3ttIBUvP/SJucz/BT6tlnpwuV6LHXuiSxKxBLXrukHJ4n3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7049

On 18.10.2023 16:25, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit I think that this would best be folded with patch 1, using
"x86/mce: " as the component prefix.

Jan

