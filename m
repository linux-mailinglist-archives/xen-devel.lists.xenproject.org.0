Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645E17DBD03
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625232.974322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUdu-0003bS-Ih; Mon, 30 Oct 2023 15:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625232.974322; Mon, 30 Oct 2023 15:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUdu-0003Z9-Ez; Mon, 30 Oct 2023 15:57:30 +0000
Received: by outflank-mailman (input) for mailman id 625232;
 Mon, 30 Oct 2023 15:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUds-0003J5-6e
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:57:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05f31e9f-773d-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:57:27 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8918.eurprd04.prod.outlook.com (2603:10a6:10:2e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.14; Mon, 30 Oct
 2023 15:57:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:57:22 +0000
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
X-Inumbo-ID: 05f31e9f-773d-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KibJmrLCWtIvXD79gdMTMlBz2b78Hr5sRXvpLRfwVavij9TRszNiUMXSMxYQLykM8gOdw6//0lehAT41oo3z8T545va5FBPMcKOF2ODrllsGp83d9oReDQBHiY2l1qQwruA8p61ufYtlNq3muJAeXRYdEW0YshnZaAFoP4iVyLyRskEC1TUJOO8ftZx4+aJEIx+V+5uLCP3XOqOx4B0wXsSu9Ozj+TGKVQvXixjHKJO3mBTZctnETzZ/DqKx5TLODlKjADoA+emeWSOMfaR+m8+PtkXhUDkLy5RNXlJ72H+RKD1KUSoMbMQnD8ZQtjVO1L3dOpMJdE4vuc+hGkU10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHvAXIKJXjd2kg3190fn2MFCqtoogmJbKQNVOwWpCqI=;
 b=jghoE0/WOt0MiXeMRGmuCVUnUiea/I9eFpFCrgPvRr4gAq0rJngynkpNpFUcIdURznCSuDDGuKIWzjTkirUkC6rLpsrvIpoBzWU3FeEFnZSL6f/QFAq51zXSrsAa+HAjJ48GkqrerWMBdnDS0YvL336qXUU+HRC42UTMZRDGtTfGb/unWXFzCXb/kXCH1Pp6pY6N3Q3Hwg1vFy0gQ1QxjssnCFMYjw+85Pf8zBQRiML3yC3W4Puvg8oy8oZ/ijL4LjGS7bFKM46ejsQsLkf+P6nGGKFiXfU29A5KJf2UPm3a6nA2o3Yf61ZIINVp/DtRXnW/6uw0Mg407BWNwyjixQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHvAXIKJXjd2kg3190fn2MFCqtoogmJbKQNVOwWpCqI=;
 b=wWrPCjhPlKrB7YIjrnM7sX86NLODIsVUp92NCR9MUTRujzxQU8YU6LjHOEYNsWcoYOd1ES0vYp5000XYsEDBdqLesVh46Bguozz/Og0fLWseMAY6/PBEC0jTzq0Fp/elk1blfc/DHmthHJvr0kdNy6yTDuxRqdrma6JWBLPQnRe1zxhfdoAfSKhOFB3RqEV4ib5JXYPFefpByQ7XkWt/tLEm8ToRoyqj4mj4mbP3OArlpEYJBqW9Q8FsDBVn1r+bxEdsfTjFvl/54ySpj2L7KZBrXmuLP7qaiCungLr4mU654fgOB0P06VuZQsGftfR7q82+Gj0VS2vCjPiXsfoBAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b8f46e7-c11c-80ec-d60c-8a0fdf3b2cf7@suse.com>
Date: Mon, 30 Oct 2023 16:57:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 2/8] x86/mmconfig: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698045505.git.federico.serafini@bugseng.com>
 <1ced29b83c361b390ed32e30155a603a81baab0a.1698045505.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1ced29b83c361b390ed32e30155a603a81baab0a.1698045505.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 922c91c0-e21a-4366-a123-08dbd960e70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ISRMl1qLRythXCGQ4ya/dcP02K1H/oG+Vvdj8BlZVev4VZoJ64LYHZXsHcIrlIYy5Q7eRb7MSu7viIxi35OKC77pxzuTe7YrdzPnxc0D6x3XiRnAjMh1rUY0puBJWb318nx+uwycZdaJdLRjGbRSDbSCqX43RigrVG4EhnwFgtXC4beaJayXsiv1w4sWkgt1e+Mm+1VMY9+hrsa/Tei1NLoJMHEakPGlatNHyIsRYiFC1KOD7s+hYJyCSMX1lyUxIZH1EqO2xbQyljgUDg/ZQmN6zzgwLqjz5qvFK/FmpeUSej2Hi5DZqRMJ3i0u6UJSdRXok+tsI6mNm2YxesjF1EiTdY4O/H/Q2MqQFvQEEk4oVy+0iQs7y9JnULzPGKa9+OB/BBzw08EpPb5KsFXEd2s86uoVYR+LS3hUJn4CwFhC42m7aidPJtqhKq+F/RLuVXVsvkGHAzi1wX7yaL0t8hgqb8kSFzsA+OIA7xgHAQHsc3zMhD4kbAJWF3wT4Zyhqnhs0okIXPIq+FQPc6ymYCP7iaDNOTSX+U8RU5JxjSWlwsfltcL70OgzmnNjwTSizbOTG9Xc8d/DSIua5ANqKtLaMQ2TZfyNcEv2b60diSwyQifvzivFDla6mOmc5rS84ySDJVTZ6i58RBFIceW3LA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6512007)(2616005)(26005)(53546011)(478600001)(6506007)(6486002)(2906002)(66556008)(41300700001)(66946007)(5660300002)(8936002)(66476007)(4326008)(8676002)(54906003)(6916009)(316002)(38100700002)(36756003)(31696002)(86362001)(558084003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXZvNkhSR2JvcGRUbzhBbkNtVGdzUlhOQmdmcURMSDFtQjUyS004c3RsU2Ur?=
 =?utf-8?B?dS91aDdkZVlLY3pxa3hJS2RvMU5RUm80R3pTOCttUEUxSkJ4RXl0Y2lLMDdM?=
 =?utf-8?B?RXlPdXR5MU1YRFEzeDhRemp3U3BSYTliL0NSZy91cFBjN3FVME9KUUdSYnJl?=
 =?utf-8?B?TzdYRVVSbE52OHhOMElDYnZDamQyUVlUb3FGM0JiWi9XdVp6dEtVQmgxNW1F?=
 =?utf-8?B?QllETkVMTDU0Q3J6TVdRdmxuV3g5OUZnRzNPand4MXJubWYreURzbDBYM0x2?=
 =?utf-8?B?YlBwcHlQY1M0TitLSXVNYmcyUEtUOFlLYmRvekdTMzJSNjl3RmNLMnF3QjZy?=
 =?utf-8?B?YVpyZGNkU1dDYjcxWGJTbkVMMTRTSnlrMk4zdWtXSlJ2RE5Da1ZEKzUyUk5E?=
 =?utf-8?B?ODZRTnFhelIrTlIxZWtRWUZsdzNJQ0tsSkwwNWVUOTY1cjJPd3pTQkFoMmVa?=
 =?utf-8?B?aUZWTHl4dFhVdlp1QnBLSHdDMHhSaFErM3QwMVdvTXBWUGVZcHJEN2x5eVdu?=
 =?utf-8?B?V2I3OWhCKzk3WTVNdnF5VE90NnE4N01FVTRDSDFmaWJieGlSdGlDcnJVaFRO?=
 =?utf-8?B?ZHNTRWZ2bjI2SWNmaCtFRWhrU3hBdFFiQk82QW1NUStJaG14cFN6Y1NocS8x?=
 =?utf-8?B?RHRPZEt1Q2ZJeGhPMkVWa0RLOFh4OThMYWxKQUNTU3ZaL3RoRDg4Nk55SEYw?=
 =?utf-8?B?eUVYRmFNZy85RnUxb21jWm01VTJjN3Q5elBPMjBrc3BjS0JzSW9rOE1ZSEhP?=
 =?utf-8?B?VUdDcEdRNzk0OGNqZElRZXVVVzZRQmZzOGFVSXY3NjM2aGw2NUZaTDJwU0V3?=
 =?utf-8?B?b0dFcG9ZcjJQWGJNbXduT3dkL28xTDJpSDhpdU9Va2RoYmFNQzZSdWtJdTFN?=
 =?utf-8?B?em9ZOC9Dc2NzZ0VjNFlGOXpXYmZuMlZQY3VTS2dJZlJ0MERIMkdpSjRBeXV6?=
 =?utf-8?B?T3FwSVNMdm5DQ2hxa0RraUk3d0ZUdGV3Nlk0OXlaaWRuTTF6WTQyT3ZzMkZw?=
 =?utf-8?B?cFdMM1VMSU5LMzRTVFY2ZU5GWTI1TkZZdTlJeXR2NGM5aGNrMERmaTUrMGZL?=
 =?utf-8?B?NEoraGJnampDeFBjT0I5N0tMYkdrU2UwL25xcTl3c3gxQjhvUlhKMjU3dHlF?=
 =?utf-8?B?TEFUaDUzUlQ3K3N5ZXE1Wmp3VkRzOVBlaHZZSkV6RlI0SlplVEFCUm1sdTlJ?=
 =?utf-8?B?SFN1djRUSWJJQXE2SFZERnJtN1dHL3QzQXk0dytURzlGSHpGWkRFUG1EK2pW?=
 =?utf-8?B?ZzZuc0tNTG4wSlpCRVBwL3dnejdKRFczcVBhWDgrMWZBMXNrT0UzSVF6Um5j?=
 =?utf-8?B?MjduODBDQzdjKzBMd3ZHSCsrMWNzaVluM2RFbzVtZnpCZ0xmdmlHb0FVTWQx?=
 =?utf-8?B?OG1haC91SC9kV1dJWklMMW9JbGw0NkgzejQ4QzFKY0FjaTIrSytWRk14eDlV?=
 =?utf-8?B?czJZTW11MWdZVm9WQnZ5TEhFMXNRekJnbmJveENDWFUveWVUb0VoaUZObnBW?=
 =?utf-8?B?dlRFL0hjNUIyck5iYXFYUUpEeGpuTTl1R3JES3NlWWlleHVqckVTaWdCeGRa?=
 =?utf-8?B?N3d1TTd4QTRHY1NUVFkwNnJQMENjcWl1Mld0V1NRTDczQzFvbWk2MDJDVDVJ?=
 =?utf-8?B?UThyZkFBRDRqVGxXajdEcUFqVGxQWVJrQ1dDUlprb2p5SytGdk9tcUE3alV3?=
 =?utf-8?B?M3V4K2ozbmt4ZW5PZ3M5VHJHcFJyUWg0Qmt4TGpDa2VOVitpYXNVbktLazFI?=
 =?utf-8?B?bmJRc2lNSWpmUnN4YlZlR2wzK2FKeTI0UkJKSFBhazRzdlFCN1k1OFVwQ0hs?=
 =?utf-8?B?eTAxSndLYWw0U2VoMGpKVk52dU5iNGpwaDFabzNUcHA4Nk1oZzl2NzM3K0gz?=
 =?utf-8?B?b2E1N2dGMmhSbkhJbDU4cmNQWHY3NmNvSTZUVmtLRy9zMlBKSm1HaDkwd21U?=
 =?utf-8?B?WmNOT2hQeVlZczlXcE9mYk8rcHlRbVgvV3Y2Ry81QlJpSnJ2eDg4TEI0ajZU?=
 =?utf-8?B?a1VudDBsWkozaHJmaDdDMFRPdjJGdFd4UWwwNzVSUFhpMG5FY0ZaOVA4eTJk?=
 =?utf-8?B?ZUI3bTRRUjg4bmUyRVJhZU45cU9IRFAraEVxajR3by9va1M4dnZkVlRUZlRK?=
 =?utf-8?Q?a5H8bYvHLd4auAUdKA3k0EvFG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 922c91c0-e21a-4366-a123-08dbd960e70d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:57:22.1012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFmdu6gKNO/Yno3rNRovbx6HgEzcV/03AGuvOd18KHGSlWjA1jy1i4kilbxn5Q2cr8kpn9Rfp3JGGJWOGLnR4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8918

On 23.10.2023 09:22, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



