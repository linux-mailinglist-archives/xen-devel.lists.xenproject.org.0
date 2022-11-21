Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6C7632018
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 12:15:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446536.702159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox4lL-0001Ls-97; Mon, 21 Nov 2022 11:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446536.702159; Mon, 21 Nov 2022 11:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox4lL-0001JS-6O; Mon, 21 Nov 2022 11:14:55 +0000
Received: by outflank-mailman (input) for mailman id 446536;
 Mon, 21 Nov 2022 11:14:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox4lJ-00013r-GN
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 11:14:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b804ac44-698d-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 12:14:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7858.eurprd04.prod.outlook.com (2603:10a6:20b:237::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 11:14:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 11:14:49 +0000
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
X-Inumbo-ID: b804ac44-698d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXubM4kpG2yWFsCnZKUYZ7mNVWjtZXY9wE3/mxW47cKKGuNy7wfgb7eGNIWgmbDLuFvOkLMMR/WMna1zz1N5xh08jB8Oxf9jjxQFSNzh89LYljvxJxOeHoFgMhqz9dZyWD7CWe3GBnUHpTI9fE2s8rtq2nSuBj1aaBeOaGb3hjun3clSBtJcqTWQTwv9g1RWAG6bQdE2xGyWOhAzThC3HLJL1oewrsb7dC6KrWG6uzOPtNNYyMbhxDYXUtejdm/3mdMJH52u88H0uBPPmagCAiRXPWlt3qDqDIZ+MfHwTQwjMeAIFucfkITLQWQBO0hwR4D7dOd+rrWM4VRHjCiQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uu95olh0a1stZdTCzdFwRikBa491MDOhLph4j6+HwDA=;
 b=hm1ELtZAvDCq3YEMdihPyOLgSmQ7oFZPxZjybXBo3okwXT0XFBPoXf387HqdIBoYzUKJC1tp8NM/moVFrMOftjoYlLpJPD3MoH8dswsPPm3B/HEWdmNtcdyWH8JRssQpBkB8y4aQK0EJC5yYKUBPGSHb9BR0aVuMC49kOxw6GDl8a6X0IsKu+aEkoQeKLbaEBB5t73q1W+KiGa94xGZpj1WAKTe/OttBT37KQbPJ64GqYxBgT5loVTfjUaln5K2i8OertoTBIuU4VaR78PzP2PMxooQWkVTB2HTa1vDi7w8Oe8PVzJ+TcJLRXMawWQXmVASMExb4HOTZPq1rsT4o6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uu95olh0a1stZdTCzdFwRikBa491MDOhLph4j6+HwDA=;
 b=algksr0O3NJZJywgiGElU0Kiba9b6UnKywXXhIVa2hDhe8Frx9LdQhINilCmlacZg8t0y+x94OA2CqdRpECieubV4qJFaPaZ447raDiTH7qNq2oyXV8OTqCeJWIehLrYdTt+G1jPGBOzEgwQd/adCfvC8IxDyHgnMTMME/MX/jii5CLocpSCVxLIs/YRu7k+MdSHO2Iwp9XA1b5GHjgdP3GQpMfeOCwAukiJg9h/HuN37K4hmNraMPJiFPKBN/+2Q5EdxYJMb+8EkQPwEOfmC5V+h4j7aISLU7IT4q3IU3bG8bLlis1xvQ4M0Ws031KsPWQ06ZfkFHQRG2cz9gVvxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8327e9e-b954-dcfb-3c58-6e3a4eab377a@suse.com>
Date: Mon, 21 Nov 2022 12:14:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <Y3eWISfCCW/ktjB+@Air-de-Roger>
 <3add150d-ab4d-9147-005e-3f3160ec9667@suse.com>
 <Y3tYxMSGLDtBLHVc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3tYxMSGLDtBLHVc@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dbe5277-86fb-43c2-5c39-08dacbb19af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	555UDND9o7DOM9gWBSjnP45XSN5hTNB/EtAc4IFQlZtIbJfeRq+GKFqaQICvugOeVtQPb+GHQpSwdVQUnRnshzscO0BhCrPaOFtLr5A/ixuHnTQjHjyuuGDqxHwlGZ2Y7UiA6TxW3tBFtQe/zFA/n37vdlhonfk0uUEE5YB/gTutyt+Jir8MZmJhWOKIBkTRFuDnIN4mrsq7+2xoGilh2WVjB7zWA88/fb+HjUenkyy2rlEHxLmHma42cOrbUutoMGm4BBYsIFaFrSDEumJNHNfhy3xd+ZGraWLBqCn7cfW95s27a5Vq9ZyxncqTQorHFM6PaBq4IxsxYIyHrcs6dSTfADTbVbn25stf+73g2yHO9Dl1anIPlc20CltKgN4nSulo0X3Bm8TF9BoX6V0dGdHECzoyPvykdJ9+sTEHXEGXKBTfo4h1VNNlCmBeaOdScG1yypq7JQa5+VZHLb5SIqDIMWwBcAUrwOTV8FT+mNgbYgwPPXMlN+YV+Co1pL0Owucu98Pi86LzPQhSwkUMsvcrMPslmUurWrvbpVOUXuKkVsiqDCxUU+reVSP7/6HuUAI6bpy6HF5HlhAYjw+9dvmFcbJx7oy2GIbC28pRV6NbYmEqOz4d1ggr4Gxm6dRpyiW4yxPwHwNmYwE4PutqKmH9qUGR6yWK3fP1ni/Nb18Wny0kwNOfyrnLvoZLm1oxtSFDG+Tp2QU4EtrzjNTi87ogQQ/RFZCp2poMTFTayIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199015)(86362001)(83380400001)(31696002)(38100700002)(41300700001)(4744005)(2906002)(8936002)(5660300002)(478600001)(6666004)(53546011)(2616005)(6506007)(26005)(8676002)(4326008)(66556008)(66476007)(66946007)(316002)(6486002)(6512007)(54906003)(186003)(6916009)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTlKMndHY053UmlEellhREpBempMc2lJeWZQRHlNcmhxM3lvZHZvTmRhbUtX?=
 =?utf-8?B?ZjlQeEV3ZkpIc2xhRTJTSkY4L1cxazZ6UzBGTENFK1JDYkxUeUhZaDcwZmQy?=
 =?utf-8?B?SThtRFVTc3dad3k1UmdxTDdVZ0NXUlBJeFJEcUc0Y2taYTkrY2x1M3U1SzdH?=
 =?utf-8?B?R0ovZzRsdllpSlgrU1NMc3RwQ3A4TFhMczhzbjJZZGFYT2JMR3BLV2JpRDJ3?=
 =?utf-8?B?RlIyV05wVmxqY2NQVkIrM0EwZDB6VTRsR2k3M3JNNVdOWjN2YzNnZmg2SnZS?=
 =?utf-8?B?V29VbzJ6S0JYbklBQ3N1Z2wxaXpZVEpnM1I4cG13V3orNTN4bnRXQjhoeVlW?=
 =?utf-8?B?OXFxTVJrcU02NG9laXEwRW4vWmJqZ3JvWHZGdXNpclgwVFM5RmlUZEVTNktK?=
 =?utf-8?B?clhEL2duWUs5S1pkWkNqMzlScXJzVS90L0JDamZQVHFKSjZmYXRWbE9CajJC?=
 =?utf-8?B?WkRtZTIvQUpvUy9oZmdObVRpeU1VVG9jNjZqRUxBRzZMckdpUnlQY2dsSk83?=
 =?utf-8?B?SkdrWGgzaTJwbnByK3BIVTNXR01MbHVTVzJnYWg0Q2pobEVsTHp0MERyc0V1?=
 =?utf-8?B?ZUFGTStPdDdQUEZTMEtaQjMzbWdMK05jT1ZGSVdybVhrVGRPb2NWcXdkREVF?=
 =?utf-8?B?RzJUZmozd1FuSEFMOUtBbHpTWlpSWG56emZHMUdRUTBKU0xJclBDQXdLTTQx?=
 =?utf-8?B?Y2hmWkNjWXlwSnBXT0g4ak00Wk9JTWdFTFZxcGtZVnZPazN6elBDb3NKMnJE?=
 =?utf-8?B?cHRqbmF3alUvUkQvTHhlOVAySHd6ZlYzZTRUOW9rM0VabFNSdS9yMjFxRzJN?=
 =?utf-8?B?V1hGS0tUNEhkZU8zZGxIcFJCZWpRT3FTM2hUNW92QWJwZVB1eU5NMWZYSXZS?=
 =?utf-8?B?ckNYTVY1K0haaE1IbTRRaG5Ba2JHVFVwdXhNbUlvL1pBeDRvOHE1YnlEREdw?=
 =?utf-8?B?dUZONGdhTmM1eCttOXR1MW4wNUd6QUE2M2oyOWdvWDVlNk4zSGFXTEdpN3pU?=
 =?utf-8?B?a3U3ai9hY2hyZGRUT1hiZ1ZuenZEUXFDbTFZWlAzYzMyWDZzMHZKQ0liUFE3?=
 =?utf-8?B?TmRNYzJBVUo4Nk5NcjhycUFTM1pzdGFCN3hwSlJ0VUdYbkV4eTJJSmQwcEIv?=
 =?utf-8?B?UXdOL1FSWmtmd2dnaXhNN0k5WlVqeVJscU51ZklzWnBGS3ZlMkRYUVlvOU1k?=
 =?utf-8?B?SXNKdjJMOEIxVE5jUWFBa1p0T1E5THdrTTBqNTlIczZ0c29PRlozQXM1bThR?=
 =?utf-8?B?OTlpMHNndVdVUFFtS0RQdm1QSTVqd1JlUTRIM1FoSU1vcVh1TXZKazNveWdj?=
 =?utf-8?B?UDJ5L3puaHZnNUtwYmZlaTlQZHVoS2MyeDZUZVNtU2lpS29GQzBBeHM3K2hC?=
 =?utf-8?B?b2N0Y0oyYXBXSXFYVW5EVEh1ZGZHU0pDVWNac0FGK3NPZVV5VDI5R0lOWU5D?=
 =?utf-8?B?KzIzTEZDREJFVmdlMzhlend0Ulp4d1pRTldybS9YYm1NZlErKyt6emVIcVpN?=
 =?utf-8?B?RVZZLzRLOEh0bDVBLzhXY2diWUJiQTlhWE1HbHdXN3NlWHduMG9mbmVCNmFE?=
 =?utf-8?B?S0dwdEV3U0xUR1BGcm53N1lXRlo2d3NEZFdjcnZKS21wTDBnNkx4amdiSVpJ?=
 =?utf-8?B?K1dYYTh5UGN0Qk1JS2VIV21MVldSVFFxZDVtUWQ1dzVoT3BIZTdWaDBwU2NV?=
 =?utf-8?B?OThFZEFnZmtma1BBZndsUS93K0NhM1VMbXk3VENJMGJxL1VqYk1JLzFyVVpZ?=
 =?utf-8?B?WWdQS0V6bFhVMUh1SUpoYjZQVTczQURPSnZ6d1M3Vm1IdXBWNVlNbS85eHQv?=
 =?utf-8?B?NG9tS1BDV3QreVAvV0lRRmtqTGQ1YzlWZlg0ZVBka0xFQnBKYjhGeXZxczJT?=
 =?utf-8?B?anp1dDJ6dmJwYzFHTXY5aTRFcmxobmtPVFdsMUI5ZzBNQzU2RythbFVDZ0la?=
 =?utf-8?B?OGJZYlVqaGFsTytublpibVY1UTYxOTFRaktsU3Uzc1JkNkpreEJld2NnUlQ1?=
 =?utf-8?B?MG5WWW9WU01NYmg2WXhxckJBczFNdmpWZkFMM2x3QnM5dFBTUEcvemUySWRG?=
 =?utf-8?B?Wloxa3Q4NzFPL2VRc3pKdFJLR3doVmxYVVh4NXBhbzQ3ZWdWbm0rSkRHdUJv?=
 =?utf-8?Q?6fe6VP2udT/Gd/2BY7bysoxrx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbe5277-86fb-43c2-5c39-08dacbb19af8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 11:14:49.6745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bEG9eJDEIiDj3aHx1xEUDVBdrK524tMx+90lHnxkmHRgXUsOB8s7evvnD3Z5xXQSJ610tNogY/KHtpdGUE5vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7858

On 21.11.2022 11:53, Roger Pau Monné wrote:
> On Mon, Nov 21, 2022 at 09:33:53AM +0100, Jan Beulich wrote:
>> On 18.11.2022 15:26, Roger Pau Monné wrote:
>>> Maybe best to add an ASSERT in vlapic_set_irq() to be sure the lapic is
>>> enabled, as other callers already check this before trying to inject?
>>
>> Perhaps, yes (once we've fixed paths where the check is presently
>> missing).
> 
> Another option would be to unconditionally return 0 for IRR and ISR
> reads when the LAPIC is disabled, that would avoid having to force the
> event channel injection when the LAPIC is enabled, but there could be
> more than just the event channel vector queued in that way which would
> be against the spec.

Pre-existing set IRR bits remain set when moving into disabled mode. If
we faked zeros for reads, we'd violate the spec and undermine Linux'es
checking of the bits.

Jan

