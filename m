Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3537FF430
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 16:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645027.1006784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jRG-0002vV-Kt; Thu, 30 Nov 2023 15:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645027.1006784; Thu, 30 Nov 2023 15:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jRG-0002od-G7; Thu, 30 Nov 2023 15:58:54 +0000
Received: by outflank-mailman (input) for mailman id 645027;
 Thu, 30 Nov 2023 15:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8jRF-0002lr-HJ
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 15:58:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b93d6aa-8f99-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 16:58:52 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7310.eurprd04.prod.outlook.com (2603:10a6:800:1a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8; Thu, 30 Nov
 2023 15:58:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 15:58:43 +0000
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
X-Inumbo-ID: 5b93d6aa-8f99-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaETe2P/6zo+JF7iNIqhmld3pVwjaKzpCe3P4+pWw4qorbsqw9qLnWzdvdkI+ylq6Das40nRHL1M1h7/7tiBtfgrosO13U6+XHK5sAUrCZKbcIp2WmxyyFWhIdxL2tn3aeQ4Sj4XW51BT2DtEQ0JpeDQoAq9jPMZv+nMpVd+ua6S3U3yu5eHRa5cgUjrM5R8+agJUVoawn7tX6ede2Bx9sxvUtN7vHM565d12O/CpkIE+wiYys9KkI438/DDAspozjE3I420gTQteMySvHi1hlBBoCDfqZo1uB20WtUCL5XlffEml+0gkmO4QxRllPZ8b2X9JbdPV+BX7LJpaa9npw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPAnAkPuF+r9vh72RFbq6quMYRHsEkj7B9nvnGNJ3Js=;
 b=Pj+5wvHLzNy4UTpz4g5M9PDLZoc7A47+h21IxZbOuZx86h4roO8OUZugQlx99belINNH5I0CeoVML1kucVu0dNAbFEwdPp+zlZelYh5gklaFVnh2J/LViccdduEBZujWSlumciHJeQxYEJq5WFX5aOigN/BEujy69De86F77F57jJ0Aj0YNBJVaC8uE0kf0eN2ANaox3In+qV69+8FmTXnPBVJ1b7hhxHWoBIcOW/uMZdRVNQxoiagMM+Ep6cwDWw7CFdNQWDkGeJnCwfckpDvRHiv8Wy5a4p1KaRkYnA1S6vrRVmQuaFGsZQjfy9L0YdYjNcrIHRlM0mcCDjJzJ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPAnAkPuF+r9vh72RFbq6quMYRHsEkj7B9nvnGNJ3Js=;
 b=KvNJy4hQPHzpG4PngQF2844nFPD092S2JF/QGjdlWPiunUjRY/65ZXFU4DiU+DGboppPQshmvIkVnx9cReA5IaSjNjllrf5sCVmjNxqVKCX780PetwcbO6/SBYE9LvF4nPsBWs2qoAcLJYhhf9whUk5fXH8xoqN7azG7daihZ+UcoAHoUJDrAOn6PTvzl7AY1ALGZ3s8epuIR0+kWV+1jw8e9DxDIpy1zZeuj5++vCbxZxERhSFUmKZEDAFY+qKFIItyHOeMb1Y7r/Us1PPuDK1dQx8/plXic0wiZ1txB03Jf7sArG8xUzKZmOh9bVWfjw9rh7hb/GVRmUEDdWmMeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4b28528-6929-4b90-a9a3-f5dd090b89db@suse.com>
Date: Thu, 30 Nov 2023 16:58:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 06/11] xen/notifier: address violations of MISRA
 C:2012 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700832962.git.federico.serafini@bugseng.com>
 <cdd613a0570b9376eee058e399e4e0cc08ed7df2.1700832962.git.federico.serafini@bugseng.com>
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
In-Reply-To: <cdd613a0570b9376eee058e399e4e0cc08ed7df2.1700832962.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0437.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e9d975-d844-49ea-2167-08dbf1bd3a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I7FcUwWQPzo29KgFRNKcITYINCYiOvIVBfN/bqJdapr3qARkeALD/aVnIEuXi+01jDs258ngZizmo+vCNUcHZUpqeG2aRt1ozs5l8Vtcq9VRV6I076lTWSWi81Dzy8IlkIeOd7sFK2/ayoBPXQn5GHgM6WYogDGbKTVtd6EC7/smvOd3xYp7FFxqjzSN4dWYpvWFym2d1hjU0PSgAkPEZiLe6I/PLLyV/InMiPaw3pILpHvX3jfGgdFG+A3Fa6t66jldtacADKpuayvSuVDkrqEm+4kukT4q13UBvlfsoahmgj/zAYjTc2+9VARDJt53lT0WoFuLKnZoR9ykQnECYjm24CjFTS+vabZxxXnG2MjcrBSgs7dQOiN7xPGJACL9cL1HdiDBhenvk7+RftxG8bQqOhBmUfztfjP0GnYm68ENdPlw+Dlyw9SHZKsiTOWAqkJm68Q46PdfQGf2r9tGEtAbOxPZU2z/sTsgir2nrs3yELTir9WIlQXQlvEla/gMZq7vl+hTwI6r9zzsG6Ymr8UON+ROi3FQqMlFv/T4CGFD4XzI7pQN3hG8aQAXQkEh9LHl/NCdBlW7hvaqhZRxoUXWmJ7tiLnAtzk2MPC/foUGIuc/4NImKp+z4iozzG0XFKvS1SdrIJz6xcNBtsR7SA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(8936002)(31696002)(86362001)(316002)(558084003)(4326008)(5660300002)(36756003)(66556008)(6916009)(66946007)(66476007)(54906003)(31686004)(8676002)(6506007)(38100700002)(2906002)(478600001)(6486002)(53546011)(6512007)(2616005)(41300700001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjlrZDlJcFVIdEltVlJNOXdJWkwyV01BN0VlVk5TMDN0UThPK0pLZ3p0VTF6?=
 =?utf-8?B?aXoyQ2lLamQycHJnRG9vdUs2MTgxVEdQOEs1UFlqSjlFREVwOURZSUpqbnQv?=
 =?utf-8?B?Y3dhNDRidGdmY1gwZzVJUFRiT0NYTDVjelVBTHFIU0VYZXVuQzVIcC83VVp6?=
 =?utf-8?B?Yzc2R0NOQXAvT085ZVBQL09xbTBoTVFsWHlSR1ZTbktsSUhRWFhlazhBTGVz?=
 =?utf-8?B?V3pNd1JUR1dnQkMra1piVWQzYXFDQU83Yno3NmtIV1NoU29sRHYxdHlORTUw?=
 =?utf-8?B?UlZFdG5RelRxM0QzMVdSS28xZHFwVnltcHpiQUtPU2ZZckNyMkFhYSs1Yjla?=
 =?utf-8?B?N09sMGlQMUQvTEM4SmxuTFM4YzlJb2ZEeUk1dEd5YXpnaU96LzNmRVhhNC9w?=
 =?utf-8?B?TUxTWXN3RlYzNUJQa2F5VWJTR2NCNHRiVTBMT0FMMXI3VmhiZUFQenlQcHA4?=
 =?utf-8?B?Q081eG9qd1orS1k5SHBnd25XK2FSTGhuZHIzZzlpSVJBa3pDODNldlh6WDhU?=
 =?utf-8?B?ZE55TjkwU0gvOGpmZHZtd2p4VlZhZTZSQU5tOWl5cXJldEUvZnhpaW8xV1NQ?=
 =?utf-8?B?d3JweHp6SThxOGlkek1aaTh1WndnNFpiRmdCUXBEdnYvd2l2VGFuSmhER1dL?=
 =?utf-8?B?K0R0VFdZSlExNlVnbWdmbUJuVDJuck5ucDBDRytKWGYwSlVIYmxsN0VCRlJU?=
 =?utf-8?B?NDh5VXExbjh3c0ZHWkZ4N2gwcWNISW82ZkFIV2RWMUFQN2Qwd01XVm5xSE53?=
 =?utf-8?B?WGpnUEk2alBOaWo1S1k2Z1l3TE1UMnNTKzNUL0dtVGt2d0pwcW5ScFEyK1Ir?=
 =?utf-8?B?OE5pWXI2V09sMzc1dklSS3czcjNZc2VSdmF1M0NsTGxYUDVWL08xbm5BSmxr?=
 =?utf-8?B?V3MxdktUTVZTRlJpRmoxZTBiN3dOY25yTlUwMTlCYVFpVm4wUldQRWtiZmhs?=
 =?utf-8?B?ZmM2eWV1TUhWZ2l2QjRscXlKZ01QVzFFV09SZlkxSVN1QWE1eEgwZlVqRFZV?=
 =?utf-8?B?Qk1QbldzUVprV1B0UnFtT0tqMUlNdHp5by8zY2xtemdTNnQ0SlNQMmk5bDRp?=
 =?utf-8?B?QUNTTU1HZVUvcFdXTjR6YVYwTk4wQWZDSm1jaUJ3TmN2OEgyY2NwWGlLeWVp?=
 =?utf-8?B?cHhLOVBJY1NkVmhjbGEvYmxtUnpHK1hVM2lHQUU1WXljamtTUnlBZ3BHQVpJ?=
 =?utf-8?B?a3R5L2I1V2RiOERHTFFhRjdwajZ0aVlkaEJHUlYvYm5FdmdnVGtpeE9vT1lL?=
 =?utf-8?B?OGhqOE5lRWhpVStVQ0M1eGNKTlhFZ1hBNlovMzd6QU55RW9nVFhPUCtMNUhu?=
 =?utf-8?B?NGdlcWlaQitOcHIyNUZBU240U3MzSmpPRmhCT3h3VndtRmIwaEZBR2c5NUVF?=
 =?utf-8?B?UEpQd3p3TTRJQWNQQWUwK2gzUmJUbHJlc3dlei9uY1U0MGZZTzVkK1g2YzI0?=
 =?utf-8?B?RjVtcFEwcGlhTDJUMUsxSGhuQ05FR0l5M1hZZnZCTDJ0ZnJnSnpVRkhOZ3ZX?=
 =?utf-8?B?WlRNRUlpTTI4VkFzZUhkRUczcm90RDRnQms3UDFFUk1lZmptUVVyV3hvQVB3?=
 =?utf-8?B?OTdCWkFuYXdoejlncytCVERDaitYS0F5alB1RVBRSTNqZDRTa29hYU5NTjEy?=
 =?utf-8?B?UnROK1VETTdhZFIwZTVZbTlrY1crd0tmMUtVY3Zwc202QXlKTDlsQTE5VkJo?=
 =?utf-8?B?N3VDSmVPWGM5YkNkQTE2V1pYdWNjZDRUTHhYS3FYUWFTbDBWczZHRTFYQVBT?=
 =?utf-8?B?am9SbUZsUFF0WkUwRlNsOXkzOFdWM3diSUo3dnJGNUFhVXQ1dXNHVTZ2T2xp?=
 =?utf-8?B?M0taWmM4SVVzNFpKYkxQV3VHbEMxOXltTG9FVkdhRk96V3hpcDBxejR1eWdU?=
 =?utf-8?B?R3NkK3RNWGRpOWtCMnpxb0NaV3NUQXAyMk1xR0hpNzdER3FKZ0srNTRNVktO?=
 =?utf-8?B?MWpzM0tRUWVPYnJHWi9CYkZBVWtxY0NycXFJaWxkV00rV0RjanZ0YXEzazZB?=
 =?utf-8?B?RGxsSWsvSkFUVC9QYVNoNkxXY2dNelFHNXJBNkF3Y3pXUjRUK2pjY0JURm5v?=
 =?utf-8?B?eG52bUk0SUFnMHlTanlhbkUvSXZFOHc2SUdpdmExZFprTEplL0orTG05WXB2?=
 =?utf-8?Q?AvfzZvUKC5u2KU/ucW59HqtdY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e9d975-d844-49ea-2167-08dbf1bd3a65
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 15:58:43.5044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjMSvmHXTdqWYqhMr9jjGD3hoieOQ54o4wX9rfxG4d5ljDv5CVnWAGm554fNoUXkTXyTCr1BvDQBEYXA73qHHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7310

On 24.11.2023 15:03, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



