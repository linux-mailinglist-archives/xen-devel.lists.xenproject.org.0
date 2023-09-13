Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A2379E943
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 15:27:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601307.937307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgPtv-0005x2-RE; Wed, 13 Sep 2023 13:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601307.937307; Wed, 13 Sep 2023 13:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgPtv-0005uY-Nu; Wed, 13 Sep 2023 13:27:27 +0000
Received: by outflank-mailman (input) for mailman id 601307;
 Wed, 13 Sep 2023 13:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgPtt-0005uI-QV
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 13:27:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 469eb0f9-5239-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 15:27:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9816.eurprd04.prod.outlook.com (2603:10a6:102:390::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Wed, 13 Sep
 2023 13:27:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 13:27:21 +0000
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
X-Inumbo-ID: 469eb0f9-5239-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXRK4msRwUY6NWQEnBuQN9hT+zXfqHb+FwPOHZOmZFR17JpV1hUTahxOUuhzMMZ+Hqiw5DlwZO/8W6wpmRDTE2YoU3PdyL3pMALa+ojQFsJdv2rrfN8FN41lCaz2FXZihalrk/m1+/1f/2vf06LXOUS139RDf6yc8F1t9UCxVkGrTSoF5bmO6AMPSfkyAp49+76UbeMupQ+ch4kzsEbf9dKUma6MaP8V9keQNPzF6WD2au8/E8XcLTeaOL+y40HNNdtAzcYKftGY8cj2WdvDZyQZJmmNFY1w7A48PIn/eUyOV7TvAxssWLTYCRA3zbvPW5WpkmPFaZrGsknRV+BmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TNZRgQvr+4DsHfLUgK9M8OPsPc8fdmIgsCjCS6OwqA=;
 b=fVOLvUE2pj4TUvS91YvE46dfrqzyCn3ls0jP98LrMfsJ7dEaiTCnvfskF48f0cHc2Iz3C0S3sqLPnEycOxQwAcou7SLj8kJoKjLWuSs3oCl0pKtqDvPRYbwhgh2PvqbcOUCHUP2a9ph6wq+GLIaL5rkbHPYoGpOd1eV6hpulWR5SXxxslIyWfYHxxPBCVhfzLU3JKETx3bI2ivqAHQOOPl4Wse9ESPVUdwjMcJrpyabCzlq+WpBNoRoH2av0OLkRaPPK5CVwdlOUwFkuUDFlFh+kJ0QZbtsr8DRRgNTmstN/SnbB8NtE05AR/DPZOGm/X2jCqPX/ccEATDdrSt40kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TNZRgQvr+4DsHfLUgK9M8OPsPc8fdmIgsCjCS6OwqA=;
 b=pFUfuMEx60Kyihgg396wqsbKqtM73xm9OoeM3x3neCPkGL86ZU3Oj1f2id4A8AZ6DzrCBtdsxsVgJ9GOue8w9HfIEdXQIYhOvOQeyFDtPy/owodXhGT4fE28vnEjZHKVXOmU3HBQ2ooVDrrecreiHJIOrllOo8fih9+TQ1SYo15mDnFpmQ7ettr/vjnKsuLbi2uSAoizYwtA4/CsmYOZiyOSKmmiEO65L7fHF66NsCuOIc8Z4oMlRCf0JKDzduenwmB6RngiXBZqqDYiqA1r/0kHhZj+dCkooDGLXna2bSqaOwQ8ZZLo5rVMaRiastlyMScYvLDHSLu8/qAWkc8+jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f79e397-2571-0c26-beb7-b329dbd715b3@suse.com>
Date: Wed, 13 Sep 2023 15:27:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, solene@openbsd.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
 <ZQFpr5nIZtRLPNhp@MacBook-MacBook-Pro-de-Roger.local>
 <4b3138ce-8605-6c9b-0cd2-d7dfc8b04b07@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4b3138ce-8605-6c9b-0cd2-d7dfc8b04b07@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9816:EE_
X-MS-Office365-Filtering-Correlation-Id: 546d3b2b-eb0a-4882-4302-08dbb45d28e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yueh7cHGZleY260nbp5FSiLXaddr+ylRQy3gTdwK6hW364/vdNOSzqhSS8aUq6BxB3HufGrDYWWElwbASKCZE1aa+R6YxmxIVRWx8Gy1zsAB/AUNO6aaYtuykNhidA1tmn3JMfpyDnkTE/2woH94sUlu/cRkuUejQF8UylPLTxxN12EH03CfW3aebE6/v6p7rYMUh2p8YvJnuERSGuyks4nHh9TfbdPNMT0X/JsTahoxGSCGoC6t2BH4G18p4q8OE0Irdt6aaCn2If242KaMvO5Eo8Fk0/fZbAwk75xZjM9o1Wl9Z60nAjSI8rQW2LQMWDnLUbwWJzAW3/9ZiYHD0Nn1B+vejXife/V9Gd86B5opXOKBbXjYotDpfhQnF94uoCJCFPMrvKYPgJZEi1wg/GlD7ODXW/gzCbHiv62x+pUPrevTHSDMdKqjZ6NfJq03bc0xxEEgovp7R5DG2OG6bREmnBaSg0AxPuEAMTctD49otWXNX89z+RAJlak44s6+DGn1k5NGzSI8qU4VV+0fQ/O+2Yb14ATN+pim9FOX/tY81TtKZ8A9DbePUZCGeQs6vt23PMpUiRABo8YYIkxC9349fY/VXRtYYiIM/dX8ZQe/BMsCSP1YDOTaxy9nj2wjLKVv1TqEu07bRdbGqD3B5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199024)(186009)(1800799009)(38100700002)(83380400001)(8676002)(31686004)(2616005)(5660300002)(54906003)(316002)(66556008)(41300700001)(66476007)(53546011)(6506007)(66946007)(26005)(6486002)(478600001)(4326008)(8936002)(6916009)(2906002)(4744005)(31696002)(36756003)(86362001)(6666004)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzVvZkwrcmxyK3pyb3lsMDRURk8wMWtaWTI5ZnBzSWhxY0l1d3JMdWdub05H?=
 =?utf-8?B?UGVNSmZsL3NyZUpwSEFoVi8wSnBiempuQmc2anA5M1IxcHZwb2RVQ1dORnZH?=
 =?utf-8?B?SWdGWHBNOWovSUIzTzN2RjViUmJPZHVyNlJ5ZzdpSGMxZVpiYXN6aHZ5bFM3?=
 =?utf-8?B?eFl1OG4yVFYrN0F5YlpzU3lxdlhsSTN3WmJvWFd5SWtCQVIwRW5vLzYwbjJz?=
 =?utf-8?B?cHhoNVJVT3VMcXlxV2RZKzRuYXFXaG1sS0FkREV5dVorTGtISGNleTBMaFRV?=
 =?utf-8?B?bHUxNUVtRlQ0QW41UCthTDNZUzZqUUlGZjFUS2tiMjMvSFhKRDViZ1hhY2xm?=
 =?utf-8?B?MXJaRmZGTThDZmlDNUIyR0JpMHhMakl2RWhETUNRVlk0RXFlOHVCL3B1a0Uv?=
 =?utf-8?B?WUZLbWJRbmVvSzlwTVdrdHhpWFVPTHJvUS9IanB0ZXRrSVU4RVRDb1BRWWgz?=
 =?utf-8?B?eVpJTEVFWkJjQ3d1Vyt2QXl6MUxtRXR3c295MFJoZk13YkZ2YVNwTDQrSzhI?=
 =?utf-8?B?T09iazdzcHovMXVCbzJmY0dOZThYRWxxU3lRbmV0WlVMVkJUdFdRSGYwS0FX?=
 =?utf-8?B?SWRPY3lISkt5d0w3ajR1QldMVEFhODh4amwxdU5ra3piY1AvNFQrY0pDcVlG?=
 =?utf-8?B?blRsQXdXblN5VDYrZU53YVhtcVNndkhQcU9od2JUaGNWWlBjVXJpdEpKQW1Y?=
 =?utf-8?B?UktjT0ZTZjVrN1RXd2NWOFRjUjU2R01TMWpCcERPNk5ET25TLzROODZ4cWJW?=
 =?utf-8?B?UUkyVDc4bnVIQmNTT2JYdDRRVzl5ZVRXQ3FFL0VPTERwMWJwK2VQcTRGa0Np?=
 =?utf-8?B?WmNxVU81THJEQStCN0tieU1mQmpFR1BRM2N1YnlxT2FLQnNZVVRjQkFYNGEr?=
 =?utf-8?B?T21BNmJGOVVvRWdvYndvdk8yeURRRzFOZktsclBldlM4ejJWWkNNc0pPaUM3?=
 =?utf-8?B?N01WUEhTTElSb1E3K2pwekR0L08zWXk3cm9kTWNTL2lablVyU1QvV1orSXFv?=
 =?utf-8?B?bVVaS0lpUGVYT2MvbmlmaVZ2SEltcHVrNUlsK2VnbWcyT3B0L0ZEd3VDK2Y4?=
 =?utf-8?B?clZYTUFyVUViUkpwTWZ6Vkd3QTUzVzZZYW4wWnRhamFvUm9PdXNCb0w1dVJx?=
 =?utf-8?B?a0tmRVd1dkd6VmxEdmFXRjFqSGdQWElnTENLTTh2cVkwTmJMaG8vL0Q3Y1hR?=
 =?utf-8?B?RUYyVzRmSUZFU2p5dnhLZ1VJd3FGUVFvSVpjVXlncU93NUdKeUwrYnhxVkpB?=
 =?utf-8?B?QjExa0IyWXl4QW9PaDBpeEJGKytoZThqSU9TbnZtYmVZZldmTStkWU1YTjVI?=
 =?utf-8?B?bFNMSVF5QmMzV3gzK3JmYWdIRVVVWVZTeG4wTGdqL1dyNXl2NWd0OVc4QnJI?=
 =?utf-8?B?aExzV090RTR2cnNIRVVGRkt0disxUnZGdG1jZE9GYll3cVlKTERFQXhlNm1W?=
 =?utf-8?B?eHlkYzhmazNrUWlYVk5hSHI0dFlkdmdHQUp4azh4QnBKbkl3R2NpYmpBOGU1?=
 =?utf-8?B?K3pwZUJzME43VVNnUXpUSStRVHA1RW1xc1FXdFNFMzkvVEppVzRGdmpjNHV1?=
 =?utf-8?B?OU1vd2V2VmtDWGR5NGV6bUp1Y3BjVGE5ekw4OXl2dTF5VjBvMnBIN3RMRVNZ?=
 =?utf-8?B?QjBtVnFvUjcxTWNnRWRQR2tSMlk5SVcwOHFiMk5Dcm5HaGYvMm5jRERoMVd5?=
 =?utf-8?B?eHFXVVdudlU2bTl6ZVVOcmxOSFFKY2NnaWRjK3drc3cxR2NHM1dsbG1FdXhz?=
 =?utf-8?B?RTVsV29yUUFrVXkxdGVocXMvN0VEcmdkSHh2M0VETHZxTW5QSjlTU2Y5NFM0?=
 =?utf-8?B?ZFNIWHZMQ2dzWXFoWEJMeEQ0WTNWQ0pSSkJYRCszeERVU3Q2R3lsUGJuUEFZ?=
 =?utf-8?B?NTd2dEh4ZFQrYkxKek5nMDJLTEpJUSsxSWdVM3hubi8vdDNjZzR5TFpGS2lE?=
 =?utf-8?B?M3VzZEpwWFVtTFE2MlIwanZWN2lMeVVPR0M2S3c5bmpjbzZWQitad0YrdXJm?=
 =?utf-8?B?ak1KVk9OblhpZkIrUkNuNE9IbmF4bFhIR2xQZ0FoeFg4QzVqNDA2MWVlTklS?=
 =?utf-8?B?WnRwYStoR0ZOS3RWNWhZUXRDZ3MyR2RKUHA5ZWllenNNeGhOeWRuaDFwN28v?=
 =?utf-8?Q?RUSEEOuc81O04s+ckIRDIlSNf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546d3b2b-eb0a-4882-4302-08dbb45d28e1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:27:21.5296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EG0wtdeBU+4SBkXZDE5M5PJ1bttq9b8d/stgzZjNfki9jO0UlBRVs4T6SHre3GL1sDIFuBqmjgxnrQ93zHhCuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9816

On 13.09.2023 12:50, Andrew Cooper wrote:
> On 13/09/2023 8:50 am, Roger Pau Monné wrote:
>> Hm, there's no written down note that TSC_FREQ_SEL implies PSTATE0 to
>> be available (and PSTATE0 is not an architectural MSR), but I can see
>> how a guest can expect to fetch the P0 frequency if it sees
>> TSC_FREQ_SEL.
> 
> The PPR is a reference of mostly autogenerated details and misc notes,
> put together in a non- hand-write way, unlike the older BKWGs.
> 
> Lots of the information elided from public and partner-NDA versions is
> "see TICKET/LINK for rational" type comments.
> 
> It is not a spec - it is a reference (the clue is even in the name)
> aimed at people already familiar with the area.  Do not fall into the
> trap of thinking it it can be read as a spec.

But then where is it written down that the bit set implies the PSTATEn
MSRs to exist?

Jan

