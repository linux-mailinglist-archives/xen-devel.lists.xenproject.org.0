Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C9B7B181F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 12:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609438.948544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlo2L-0002h4-EV; Thu, 28 Sep 2023 10:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609438.948544; Thu, 28 Sep 2023 10:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlo2L-0002eZ-BO; Thu, 28 Sep 2023 10:14:25 +0000
Received: by outflank-mailman (input) for mailman id 609438;
 Thu, 28 Sep 2023 10:14:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlo2J-0002ct-Os
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 10:14:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb0cb2f8-5de7-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 12:14:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9285.eurprd04.prod.outlook.com (2603:10a6:20b:4df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Thu, 28 Sep
 2023 10:14:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 10:14:19 +0000
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
X-Inumbo-ID: cb0cb2f8-5de7-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vc0dcChFXauKE8UcIRo/1H7GjQK/YSgU+EOIEmBI8LDG+Qz/LBGKCvE8rdSWkUeBfDNSGq7ogXdUBqteiaqWjafJlDNBleXX0/WqQ42DY2l2DVc9Fxp6m7eNCMJOtmSRRcbwUIlX0nsqNyqMIc+NoslBVqqb4CXHkgW5rrOEXe2pnGGtU+E/d622Qi3lBMoAnX6iKFko2RiOCkZSBM+Npb1fY7up6THcrlYJPFb2uuBxxHTGKO7U1CxRyQUeE6LeE5AVnzBWcZKCZX+NkbFXa1rKMiDqvd8gTl2TScMg2swgKF87hQwLv6yhtwKUXk3bxxxX3v8eWkfXh/0KmVP1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHVDb1/eJmLr2TOz/kFmxKMBsA+MXe+vOM3vKURTNRc=;
 b=E64mwH7vduWV9jPbZmbgs6xsPkce6NAFNpTYw72fd340DvKCQdSIk6kDUapw5O+vI1JcSQp/ygzaO19yTB1Al+wfYdMGLTLLq6yfgalZiojSNv5nM1J7u3xLjEL5c3W3X6GVN6yD5HyZi6f40HL3ABNRO9dRMYTvotBXTWYWeBn2UofGZDgstucDR20Akl/p9m7zGyB7zQCKEQp3mhNXOtsgZQRi+r8HkTyYHgrjL7/t7+3aA+2LPonQmEGfYaBhadGKzXzJF0EhdYUPBM/X40pMcmoFyrzzF8o6LumFOAkWblMnN1T5QLPj85sFwL7XsaLFdxx1uG+iXQz0JgaFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHVDb1/eJmLr2TOz/kFmxKMBsA+MXe+vOM3vKURTNRc=;
 b=EdS5EEGLa3+SGJcp5ZR+6ypIRXrb/hYTb9JGuWMkoun/Bi3G6xBP4P/ecHl1Mgq2YEaoFkfP8YGZe6Zx4vj14Wbpq+vptBb6/XAsOIY/x7rY0BGjt3LIhJOol1CeW6SDySEqmvLxt2xl8/SeskDmbiG4JxJWRUJ3ypGXEzLOXGs6UG97jNfsP2zouseuhJbmFwh/B9aBMEM0/BrXfcek09v7l8SoUEupMdg3RE9U9X4+TT+/EaUxo30tqaxUjbIQQ/iuAQfLnTZOpViwf2/yrBmfhTT72V8WV3Mv7IwI5pFJ96ptgjS8/DOKU02AM1Y//LE5k9AFL51294N3hbgxzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4566ffee-7e97-0309-f5ff-7ce24b050e8a@suse.com>
Date: Thu, 28 Sep 2023 12:14:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 6/9] domain: map/unmap GADDR based shared guest areas
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
 <a34cef71-d60f-43ae-f61d-13d6c846eaa4@suse.com>
 <ZRVPqiRHXMJC3Bo9@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRVPqiRHXMJC3Bo9@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be5ddd5-940d-4c7a-b17c-08dbc00bade2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LgjlEGiaRC11OdtbMtYHKh78mvaw89tYUvlgPhKjuL5FOas3IB3e9kwfrzczZBMnaBhtFH5vom+a9mzHUih2ORD1yFm6SqKmgKRtzoUsIZIJxgX/KkqJVmpVswquwVE3KhqiwaWyFJnfZZ0FVm/N8wuwTgdZtwibSewKzWjYPECkRWG5wuCUEPVp0kckus0R2eD28ZAFgjCNB/2r3tjTXhEpDBFbdNlU834/ErTp/4i1uZzUFyi2qGxBREFRVUQ1b/Kt21yLpMk2flHA1oZYfQKk1JHbsMpxaBWOadSzM4ggUNxAA40EbePhj+4uSfloiGRPGQhknsXXLhoD3Fa11aJnKELx/IBpG5mbkiw4zOIcrhS2NSOVwoQ8oX2jpDAfrLKNDd4OeBSGYabBMdU85AmsWvIKmvnGXye/dWCbxlwaVcrOkZDpmmf+ZWl2LdgCcsEhXHWR9do9g8jQ2d7Le1rSLu9quOMsRYozGkN3vFy9wdwNDNxgSBHLxKpOwdHFvNdgkA4HlpO40u5CMf28+HJT7msctT8j7QBi0BT1HauJAViN26NkTPYvFafCCPWTomXu2TxAVSCCbkenkH62xdWS+VbSYyfBuL8niy8JaBf2SOWRBXYyTr3L147yi08dexEcgJgDYiVuv/BX7ugyBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(396003)(366004)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(36756003)(31686004)(316002)(2906002)(83380400001)(6916009)(41300700001)(5660300002)(8676002)(4326008)(8936002)(2616005)(66946007)(66476007)(66556008)(86362001)(31696002)(6486002)(6506007)(53546011)(6512007)(54906003)(26005)(38100700002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1ZPN292Q2dPY05zTUY0OVhIaDdleG1rZExEcXhNR0k4VVhiUzJmZE4vblhH?=
 =?utf-8?B?c0Jqa3J2c1VCRmdKUUgrMXk5MnpYUjM3eWVYb2s3aEp5MkpJdDlpL2VQNUZD?=
 =?utf-8?B?QUFSanY5bHp1TktIREtOeEtaZWdiYkYvdmdlZ1BVajlrOHJXU294Um9HS0Rh?=
 =?utf-8?B?Y1U4a0dIOENLRXd6WjJCRHZTak9kMEN3NTFUYmx4dW5rMThIYklUa0F0V0E5?=
 =?utf-8?B?WWJQY0U4RXJOUDJjRGRReHBTQjNpdHZsRTEvd2dOeDdweWFiNVlwSXBWaGpx?=
 =?utf-8?B?dytGT0tHTHp0ajUrM3BXcHdvZHdidk82NjA3TGNXbFdRMDdMaGtKNGpTbGNH?=
 =?utf-8?B?S0l5cmxNbDRVSzhRdG1PUXVIdTVIb1EwdFp6TENZdUdLSGV3M0w3YnhNRGM3?=
 =?utf-8?B?aXhoYW1kejUvZytZaE1td0JnbWZVVmZndjdWaEVZbzQrR0FxWTdFNmJIbmZW?=
 =?utf-8?B?eE8rNm1GdmZ6aUJTYkl0MVI2NTJMUnVialRqMGVvaHEwM0I3S1h4Mm1JRU13?=
 =?utf-8?B?UEFqbmxnYUJjT2M3TkJ1SGdjUUJvclFVNTJqSldNUzlMeHdQK0VNYXMxQTA5?=
 =?utf-8?B?cGpKczBMbEs0MzJwc0xUd1A2S05FQ21vQnAxdW4rRE5rMjNNclJDYWJ1bHA4?=
 =?utf-8?B?UXJzcXlQZzF1Tm1NTFJPaVhHNVRUVDN4OHJqbFJDeHlkNDVhYmpCYVlrMnU1?=
 =?utf-8?B?blZCT2ZWS2E2K2xYc05vTzBhWWxZYVV4U0EwaFZCSFBsQjZTNmlJbVdOVVgv?=
 =?utf-8?B?VEFFMFZEUFFabm1mVWJlQW9NM1ByaFJwWGN2TGNJZEJlK1FTOE1YR0d3bnQw?=
 =?utf-8?B?NmRkT3M2RTIyanVqQjc3Y1dRWnhnMHJaK2J1eVhhbjlkbURnRDVWVDlYUzVB?=
 =?utf-8?B?UUVUbjZVZFZZeksrSFNXcmdUM3NkWGQwTVNmcGRENTBraW5vdTQrUVQ0MlN6?=
 =?utf-8?B?SDhRcXFCOXVRTFpJS0JibWFlTVJRczIyQ0tFbzFJWUltNUtqekZrN3A0eXMv?=
 =?utf-8?B?MVZaQk9xUzVlTUI3eHZlOGZ2cDZEU2Y0QW5xU0xUYmhWT2VsdVU4QnhaK1c1?=
 =?utf-8?B?OW1aTk9ZRFhpcVRXenU0N0VWZjNvZ1lzNmwxMFpZUE5JOVZDVHZCQ2JmVGNL?=
 =?utf-8?B?WVJKOVdrSDQxd3BKbXpRMG9GN1pyYWhnK2xleDJUVDVic3IyRldxZ2hwM3lM?=
 =?utf-8?B?Rm5OQlJpNGRCanBrVVN1QjlzZnRRY01CYWdkdElHNkhmUzZRODIxOHFGUitx?=
 =?utf-8?B?YlJxWDFkZ0FvS1A3NGNWL2dCbnMva2E4eDM1bGE2L00zRjBEbjgyalhEMHlm?=
 =?utf-8?B?VEZ4eWFHekg4dGc3d3BGVXFycUV0Y0FheFJqbHhISitpNUppMW9FTmthTVNr?=
 =?utf-8?B?NFVhNjgrc08zeWFBSVhIZlhyVXQwTnc0QkVwcVJKSmhGTlJXK2Z3VE5OZklI?=
 =?utf-8?B?bGZLOUxUYURaTWozdGMvd3BMOW1QVjFLUDVreVBJOUlZQkJCekJpSHhYUmFS?=
 =?utf-8?B?VGZDYWw1d00yQ1g2Z29NNHNxdjhZT2FlS0IxZG1zRUpNdXMzSlhiblFhVUZS?=
 =?utf-8?B?MUtDVzFncnd5b00zbVJCN1doTFFqY1ZDR1hjQzJFZnA3c1ZIU2VzMUNTRHBm?=
 =?utf-8?B?QlZSUFJLZURXbVR0cFZYTGlJRHoxcnJvcHFEL2pGQ0JVUm1QZ0d2ZVovdFhM?=
 =?utf-8?B?ZzJ2OXJrMDFRVE5aeUZTS2VWSFQycDhTVHovQTJXUFdxdjdTYURTekZkaEhQ?=
 =?utf-8?B?dmRzNzh2Z0d0RStpbU1xWndFQTRydGFQTFArZ29jeHBpQzVaU0xsNG9SQTBy?=
 =?utf-8?B?aHNpdDBIdjNaTU9JWmN1SkcrVHZ1WWJKcERxYnJDTHgzNUUyYWljdzkxbTNh?=
 =?utf-8?B?OWplQXJyL05Rblk3bXgraW1QdFVJVEZaaHdBVXFhZUdRZWY5c1hiNXZkWjZq?=
 =?utf-8?B?TWl3TUtmcUdudGowOE94QjBjSmM4bThVb29uZXlkc3BzYUVMbm05ek90TEZt?=
 =?utf-8?B?d2kvTXVSSVZGcjVUWEQyQ2U0Z0YvKzR5T3E2WkFpODl1RnIvaDZJTk9YN01i?=
 =?utf-8?B?aG5pQnNXQVlRZWxlR0xvcjJrQnEvRXQ2U3BUTkQ0QWhPSEl2VERzSGkvSXRY?=
 =?utf-8?Q?JBiupQemD89rgUGexLUROyhev?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be5ddd5-940d-4c7a-b17c-08dbc00bade2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 10:14:19.8771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2digPlPUEDwKGN+x/qgrxclUxGCNUpu8slrBBN1+D0q724pB4DX/sXGgCMUXz6yDpg6rOLHyZEvW5vtwPmSCaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9285

On 28.09.2023 12:04, Roger Pau Monné wrote:
> On Thu, Sep 28, 2023 at 09:16:48AM +0200, Jan Beulich wrote:
>> The registration by virtual/linear address has downsides: At least on
>> x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
>> PV domains the areas are inaccessible (and hence cannot be updated by
>> Xen) when in guest-user mode, and for HVM guests they may be
>> inaccessible when Meltdown mitigations are in place. (There are yet
>> more issues.)
>>
>> In preparation of the introduction of new vCPU operations allowing to
>> register the respective areas (one of the two is x86-specific) by
>> guest-physical address, flesh out the map/unmap functions.
>>
>> Noteworthy differences from map_vcpu_info():
>> - areas can be registered more than once (and de-registered),
>> - remote vCPU-s are paused rather than checked for being down (which in
>>   principle can change right after the check),
>> - the domain lock is taken for a much smaller region.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, but to be clear: Formally this doesn't help this patch make any
progress, aiui. I'll still need an A-b by a REST maintainer then. An R-b
from you would be different in this regard.

Jan

