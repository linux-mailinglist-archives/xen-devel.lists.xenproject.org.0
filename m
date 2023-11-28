Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 638E27FB480
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 09:43:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642790.1002505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7tgL-0003LM-BA; Tue, 28 Nov 2023 08:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642790.1002505; Tue, 28 Nov 2023 08:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7tgL-0003J4-8E; Tue, 28 Nov 2023 08:43:01 +0000
Received: by outflank-mailman (input) for mailman id 642790;
 Tue, 28 Nov 2023 08:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7tgK-0003Iy-8u
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 08:43:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21faec17-8dca-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 09:42:59 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8935.eurprd04.prod.outlook.com (2603:10a6:10:2e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 08:42:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 08:42:56 +0000
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
X-Inumbo-ID: 21faec17-8dca-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zx2hOlrh++NtZExKfH1HtXPSyGvtKu1EC0QKg2pyXnDc5kgHGQ/keQroHV8qM5laixAuIu8rQzVSJM31gpl+r86l5+6G7f8xbx+ojVp66wFJcgvj4Hz2uF5wfT18zYctf7/qSVXabRlcCNbGioNLr/fRscb47DezBmnkSOxRn4lELJJ5vKl+a82mDRglIfcdpE71Uf4fafwYCs3SYSYyN7BscRS+gcMGOiOxHsLLIfr7rUNYafIVUribttnwFzvWXhPss72PfIbcWbTBYJDDPkImujEtGteUHW2wpnzPlMv8HXJf2L15QG6t0SxxFb5HMIKnTas8BU2rwe3XSG+4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSs067g/U8AUue32uACe19Uy8ZzzBUjW5ZDCoo9/bFI=;
 b=c9V57QXOTj6GIWfrgTvC65ONI3Jd2cryiFyk3BYRcUlOY6gRom/tqMjjbg2daBwK3ZhmMQpKCwMu27PEn2ngEYh4EhWsYk0FYBxcGiZZobB9ItHV/SfHNEnQiQkK5aWhMj1P2Ulm03RbJDg46E0NbIfx2XftSP4pHSCpbHXCin8Bj6FtOmWTgEJuAq91C0ZYs6r3h84/YzIbm8cZlyxzFDgfjWIy3PJ4bd2tk23PtHLf6HkSQhBD29kKr+08e6kmzU5egzO1lUSEVMG+pCY5gvC8urzYc1i8CyRcjaB6jw+wXU9lD0ghGeFhifm1NWFulyVoIPMDXID9J8uxXdbqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSs067g/U8AUue32uACe19Uy8ZzzBUjW5ZDCoo9/bFI=;
 b=U/EiD2HDBvPr2NrDw4GGoFIq2DFlHnFCIYz3T0qx+H9UMC5mrW3I98juCCSDTZRW/BwHCinkQb2boK37ZFVX8TfEXlfa7Zqwj5OTkGCJojyZqrjkKCHhNfzdfr4U2pRhJ9g+5eynj51ypXkV987/vC0O8Ir7CwlbeyD3Zo+LetnQTyzHRrIoJBdQXnBEy0IzLTFsoUabSktfit33Z4zzl5o5qPTh12Bx5E79P3jNEH+AzSOlsS1vcVztTBFAD3RtXtrRDTI75jk0Sf3+o08ERMtlqEWuRICiW9PLUB/qcQ5vdFhd8stK8DoQ9xln4ysHVLNRzEdCMUT6Rnq5xXbosw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12b2d92d-f9b7-491d-affc-0c04708d950a@suse.com>
Date: Tue, 28 Nov 2023 09:42:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] xen/arm: add SAF deviation for debugging and
 logging effects
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1700844359.git.simone.ballarin@bugseng.com>
 <761ce615438312ca5d37fb8829a0ba903375392f.1700844359.git.simone.ballarin@bugseng.com>
 <ec587cf6-088b-4142-8067-4d9d67fc58c1@suse.com>
 <59744708-c2fb-488c-9e6b-e47faf7a8007@bugseng.com>
 <497617b3-6a86-46bf-99ea-2b2f1bdf9d97@suse.com>
 <89847582-ff70-4ba2-9cc7-e45ea2b691e3@bugseng.com>
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
In-Reply-To: <89847582-ff70-4ba2-9cc7-e45ea2b691e3@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: 79924c65-b0c5-416f-12de-08dbefee04ae
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CVfaX/sBFQJvRn5NJw/sJSmJ8V1HOSCjPYNC2whuPTz64Wuv17yqDQIC6BMMPDxQw3314gpWn9OgR2iIMx0DwL7OVktltHRTe9OAArNbeDzAtYKe/NZWR0QRx/JZrbf2tEhk9USPVxXrXsF2y09cLQokp9bLvUMUaJ9VWYCCi9rQJQnkgHcYohsO5WCJpp76qX7/FtKdzu2rSrbbBKFdkf0nklir7g5TiJobtXz0Senik4s7de1ZmsRM1+6YJzsjEgNkcE+3dfXy6MdUPG94FOCUo+t+/Zz69ggF/vQ+VbnLVf/mepZhNRVVIZgOpa4lKcawwy//XZw0KJSE0Ze5e3hNSOFc+tLMpMqjwX6PwtyL1HGSg55rpdjLAWFy7QDa1X+k54TgL//KOrxXRV8E8XZYMXUl/ECk1u+qsyIIArz3xnCSyna15UPEa8hetVeZM3KyvISdQXwlaPcHvRitPphvFCcuXDkEHqYy9AkzD0lqSso1AswVDu2I2fQ+QVOUiBuAjBzBJSBt2tCTs6IfLhDPCEB70VOs2VHpvYojdLpoArZVXNM9nmhmBOIlOdj/PFttfX17N1/jyQFc5Dhmta1/XaHyn1EAOivHk+z8owcrqXKaeeWqmtXYTBOyUeKa+dS2mOtF5nzmloW2+sr5YA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(31686004)(5660300002)(7416002)(478600001)(31696002)(86362001)(2906002)(2616005)(26005)(83380400001)(53546011)(6506007)(6512007)(38100700002)(36756003)(41300700001)(8936002)(54906003)(8676002)(66556008)(66476007)(6916009)(66946007)(316002)(4326008)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1pzd05QSVdrV3ZDY2pXeHhIZS80bVRCTEhsVDhPaExnUGljbW85UDA4MWV6?=
 =?utf-8?B?ZjR5dldCVytDaW9JYTdSUUNZV0k2a1QyZjFxSEdqWXBzTmI0SzN3d3dGbmtD?=
 =?utf-8?B?d0d4NGxaQ3hnYzNNTUlIaWhhQUE1Q2lTMGlzUi9za0tvWW9xVEpsRVRHSWZF?=
 =?utf-8?B?cTR4MHNXbVhHTWJSanZWQytCN1owTStOSkJjMWlqbGh2N2R1cE1Ib3pSL002?=
 =?utf-8?B?VWZsZnBBc2V6N2xGeVR2bkwvN2wzcmlFV1YzTHcwNUR6bnRCQk5aZmFyK0I2?=
 =?utf-8?B?djRvNkRQN2w1VThobk42czUveGF6L0xPMWowNDV3YXZhWmJhckNSTWtCY3dZ?=
 =?utf-8?B?L1ZiTUxENHJvNDlOMEJSUEc4V2dlYmIvQzZNMHFZZ0wwYk92MHJuUE1jd09r?=
 =?utf-8?B?M0tZQVh0VFFpU3pnNlV0d2FzMHJTeVA5TGJSWWRsS3NRV2dBYzlrb3RITEdY?=
 =?utf-8?B?ZlpPQStBWDl6dGkxU0YyVXVoZFA0blhRenkwTlZaaDQ4dDhyV2R4aFFSM3Az?=
 =?utf-8?B?L2t1SEpUdk5TSHNmZ1BmaWRzTXVTN1RDYThIczlrakw1L3R0NEs0NzdpSW9K?=
 =?utf-8?B?K3NmbU5jUWRkUmI0cmhBVVRhSVN1VWM0ZUlTc1RhMlFDOTU0eldoT0x6WTRO?=
 =?utf-8?B?NGU4Q0p2cXdwSFRsYXRhbUtTSGE3V0lKV0thZDNZQ1AraENLMkJUNkZhbkhZ?=
 =?utf-8?B?b1Vxd29YSlVkYmhqVS9oV0tHVUhoSEdGY3k2QXQxQnR6UDdUSTlCV2h5MThI?=
 =?utf-8?B?QnNpSGNxSjRkVStYMzlOeXp1Q2pKYWFqZjVCY3diSDA1aHg2Qm5LUmkvUmpD?=
 =?utf-8?B?L044VERMR3dmeHA1dzUrUU9xb01iRkJiODF0bW9oTmpWd01yWnM4UVZFWUcr?=
 =?utf-8?B?RGo3ODU4S1FzOHFkNmU3Vjh5WWVzeitDYUxBc1hRTkxIMTMwRXhaWDBncmRK?=
 =?utf-8?B?UDVvaTlYa2hJUzhmZEYwckpISE5GaGpocDVhLzFqeWp0TFFOV3ZrYnNFcUI4?=
 =?utf-8?B?a0FZOUFHQzB6VnRCeXhVNzdrNjJCTjdNZy9ud2UzcE9aRW01cGxDTExzejd4?=
 =?utf-8?B?a0hrd3BTWGRQWlNNMHBTZXZSSzljNStFZ2VmVzZqSU9HQStGN2dpUnZZNGVW?=
 =?utf-8?B?T0FqOVZSSXdibEFDc2RHaUlaSE9JV0hibjZ0S2tCZnh0cHVwTExpb3dmYyt2?=
 =?utf-8?B?bmo0QTh6SFZvNUxDN0VEQ1d6MW5YMmhRUzdUS2xwT09RNE5UN2ZGZW9BZ3M4?=
 =?utf-8?B?QXE4OXVrYStXVzBRb09yMXdsQkQyNnVRUmEwQXl2aEVqL1MybjQ1blVFODE1?=
 =?utf-8?B?TjZoY0xHSjcrL29KbWpmNll1aHZPK1V5WlpmeGpVVGdtMkY4Z0t4cVBMU3di?=
 =?utf-8?B?RjU3R0RqN0JSQndXR3FjWjlORExJMTNtZ3pla1Z1WlZNM2l0eml3YWlNczlP?=
 =?utf-8?B?MXRnbTdyT0JjWXl6SkdnbHE2RHM5RDFwNUY3b2lNUENYWUJiV0pBWXRCUjM2?=
 =?utf-8?B?SmsvZG95M1FQLytkUVgrYy9TZEt0cklIb2svZEllZDJzdG1BaUhhRDNnUE9H?=
 =?utf-8?B?VlJTbkp3SVJjdTF2aFVMYTU0SWJHZ2IxaGxwaWc2dVJJbFcvS2ZRVk5UWDFL?=
 =?utf-8?B?amVtZ3lQMHVjcy94TGlFUWp1MUMrV0cydDIrUjdLb1JyV0lSN3YwNGxlUnBi?=
 =?utf-8?B?aldxRWVhMTRvTENyekwvY0hYbm0zalpTbHVYKzNZc3ZOOFA0SkxwdTdRNmsv?=
 =?utf-8?B?SGVmenVDYTBCdWZocXoyTlFNaTVscVRPS1orcUY5ejNvQlFVaFRKRU5QZ2hX?=
 =?utf-8?B?RFMxblJ1Sk84cHBpWlJJa0VMOCtGT2NqdUxwVGFRU0REZWNqL1FvbWZYMkRF?=
 =?utf-8?B?V2tBOW9rNzBiK1FJRWtjNnE4eTl3MDFyQ2ZTMGZmOHVJVGlFZzdrc2JNdktu?=
 =?utf-8?B?Z2tJUC84aFBBS3VHaURyNnpEcUNRZWw2VFJVekNPRytqL2JkaDlBcWlrOWxL?=
 =?utf-8?B?RExYZ3RseDZsRktZMTNzRkVNZ1ZkWG05WFdGdW9TdjR6d0RWV1pkelVyQjhk?=
 =?utf-8?B?SnU0QVdCcGNMR09ucnRnOWxoUWhwZjNEUUQwZmVaVnNRSVNLM1FacFYybzcw?=
 =?utf-8?Q?blKPeeITr939Sse99+e3xsAFt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79924c65-b0c5-416f-12de-08dbefee04ae
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 08:42:56.4399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnkHT4w7uIIxcsJSJ3kKK/t7H6HM8pCdzrYZDE9aCOPe0ex3JfZGfguIfNZ1Xwg3fFEWwhlA61+j31hvW6VNsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8935

On 27.11.2023 18:34, Simone Ballarin wrote:
> On 27/11/23 16:09, Jan Beulich wrote:
>> On 27.11.2023 15:35, Simone Ballarin wrote:
>>> On 27/11/23 11:46, Jan Beulich wrote:
>>>> On 24.11.2023 18:29, Simone Ballarin wrote:
>>>>> --- a/docs/misra/safe.json
>>>>> +++ b/docs/misra/safe.json
>>>>> @@ -28,6 +28,22 @@
>>>>>            },
>>>>>            {
>>>>>                "id": "SAF-3-safe",
>>>>> +            "analyser": {
>>>>> +                "eclair": "MC3R1.R13.1"
>>>>> +            },
>>>>> +            "name": "MC3R1.R13.1: effects for debugging and logging",
>>>>> +            "text": "Effects for debugging and loggings reasons that crash execution or produce logs are allowed in initializer lists. The evaluation order in abnormal conditions is not relevant."
>>>>> +        },
>>>>
>>>> I'm wary of this statement. Order may not matter much anymore _after_ an
>>>> abnormal condition was encountered, but in the course of determining whether
>>>> an abnormal condition might have been reached it may very well still matter.
>>>
>>> Do you object to the deviation in general? Or just to the wording?
>>
>> Primarily the wording. Yet the need to adjust the wording also hints at there
>> needing to be care when actually making use of this deviation. Which it turn
>> I'm not convinced is in the spirit of Misra
> 
> The rule is really strict, but imho the only real dangerous situation is
> when an entry performs a persistent side effect that can change the
> behavior of another entry. I.e.:
> 
> int y = 0;
> int x[2] =
> {
>    y=1, /* first element will be always 1 */
>    y    /* second element can be either 0 or 1 */
> };
> 
> Above we have a dependency between the first entry and the second.
> 
> Now let's consider logging effects:
> 
> #define LOG(x) printf("LOG: %s", x);
> 
> int x[2] =
> {
>    ({ LOG("1"); 1; }),
>    ({ LOG("2"); 2; })
> };
> 
> 
> Here the execution can print:
> "LOG: 1LOG: 2" or
> "LOG: 2LOG: 1".
> 
> Do we agree that the evaluation order of prints caused by logging
> functions/macros do not normally cause dependencies between the
> entries? The execution is still non-deterministic, but does it really
> matter?.
> 
> In the case of function that crash execution, no dependencies can exist
> since no further entries will be evaluated.
> 
> In conclusion, I propose the following rewording:
> 
> "text": "Effects that crash execution or produce logs are allowed in 
> initializer lists. Logging effects do not affect the evaluation of 
> subsequent entries. Crash effects are allowed as they represent the
> end of the execution.

Let's assume we have a BUG_ON() (as the "crash effect") the condition of
which depends on where in the sequence of operations it actually executes,
i.e. (potentially) dependent upon another part of the initializer. I hope
we agree that's not something that should be deviated? Yet even the re-
worded statement would - according to my reading - permit doing so.

I guess I should try to remember to bring this up on this afternoon's call.

>>>>> --- a/xen/arch/arm/guestcopy.c
>>>>> +++ b/xen/arch/arm/guestcopy.c
>>>>> @@ -110,18 +110,21 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>>>>>    unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>>>>>    {
>>>>>        return copy_guest((void *)from, (vaddr_t)to, len,
>>>>> +                      /* SAF-4-safe No persistent side effects */
>>>>>                          GVA_INFO(current), COPY_to_guest | COPY_linear);
>>>>>    }
>>>>>    
>>>>>    unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
>>>>>                                                 unsigned int len)
>>>>>    {
>>>>> +    /* SAF-4-safe No persistent side effects */
>>>>>        return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
>>>>>                          COPY_to_guest | COPY_flush_dcache | COPY_linear);
>>>>>    }
>>>>>    
>>>>>    unsigned long raw_clear_guest(void *to, unsigned int len)
>>>>>    {
>>>>> +    /* SAF-4-safe No persistent side effects */
>>>>>        return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
>>>>>                          COPY_to_guest | COPY_linear);
>>>>>    }
>>>>> @@ -129,6 +132,7 @@ unsigned long raw_clear_guest(void *to, unsigned int len)
>>>>>    unsigned long raw_copy_from_guest(void *to, const void __user *from,
>>>>>                                      unsigned int len)
>>>>>    {
>>>>> +    /* SAF-4-safe No persistent side effects */
>>>>>        return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
>>>>>                          COPY_from_guest | COPY_linear);
>>>>>    }
>>>>
>>>> I can only guess that in all four of these it's the use of "current" which
>>>> requires the comment. Yet imo that either needs making explicit, or such a
>>>> comment shouldn't go on use sites of "current", but on its definition site.
>>>>
>>>
>>> "current" does not contain any violation of R13.1. Its expansion
>>> produces a side-effect, but this is not a problem in itself. The real
>>> problem is that GVA_INFO expands it in an initializer list:
>>> #define GVA_INFO(vcpu) ((copy_info_t) { .gva = { vcpu } })
>>
>> But an initializer list doesn't itself constitute a side effect, does it?
> 
> The side effect should be inside the initializer list. { .gva = 1 } is 
> not a violation.

I'm afraid I don't see what would be constituting a violation here.

Jan

