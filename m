Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194FC79CCB7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 12:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600299.935931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0Bq-0007fm-Jy; Tue, 12 Sep 2023 10:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600299.935931; Tue, 12 Sep 2023 10:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0Bq-0007cn-H9; Tue, 12 Sep 2023 10:00:14 +0000
Received: by outflank-mailman (input) for mailman id 600299;
 Tue, 12 Sep 2023 10:00:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qg0Bo-0007ch-Jm
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 10:00:12 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20606.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28c7b381-5153-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 12:00:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7409.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 10:00:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 10:00:08 +0000
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
X-Inumbo-ID: 28c7b381-5153-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy0K/KOyn8aam4xs9AQW0X8Oo6v8wVRZBxgZmzS5nkgM1tdbqSWC3Gkz/73wH2z4lvoErkBSccPLHXH0bkkxcR1zwN+w57zagAir+RCCOeBurTUNmPY5KRfc0YhHX23nvwKYmFPLcJGLrtt1nPSbSsOmomlrbjV2cQKxLZZOI05BnEfu2VFamvK8Wy0qwXn3LT2LXEz5JttWVXCuIt5yqGHqOMPmepeMaoOwdfKan8r8a6daWgQaG3nGZkC/PuhzOpbvol7FrV6a26YZv7o9Pp+/a09I0BPym3F+1rQM/c7+weHBn7slaEK2TQWeQShelte7p1vwW/bA2m1w6M0qew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dfq6+z7cHpZGHCVA9Ojrv0NxQHhu1cDK4S/z3KgFqFI=;
 b=aA7aBH1KIOlr2vX33E7+G5kZo/97Z9kNpc1hnX3s0QyrATvJSj92Uvresucg3tKxFi35/xUgroYvjni9je+eg1meQJ09py6RFM+NOCDj0tBPvIjDLHvvQa0HbHaL9lpQzKwZ1kKHFPuTefINvDip6UgzSKlSiwZu2tD2qDNPz/IatYdQCsEHPe2m9ky+QyYZbetwgr5iQU29MwT0DzeESVAPXk6ym3U9T7za0WmWsceN3/Eq4UbhEozooAtxw7VP94ZfyaV1YQY4Li98kykEll5alaBQkrnBKoXPaAQhWppkXKbwOpZef9jHnmZ0/+ssVBpVrC7JZMOUe7n7r60o8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dfq6+z7cHpZGHCVA9Ojrv0NxQHhu1cDK4S/z3KgFqFI=;
 b=FBIkO3f9+COJT6tf/9cDJzkh9/Oh4ZkRamV4SiGxlmBDS4nME5sb+7eGX+LKUG0fWF0ZU8H3zKEpHWBx32BI+AhvPzVC0OA0gfQumtAT/D4jUrvHQIjDGC9olRKZgPqtwQXWX9LT1jmpOd7vyS7cVSAK3tQYItHVffOsMfmQcAgtEcGVjRCGtDZ9nfV34+mn2iDrHqZkZuZsTV4cbrOcdhIIxsNvxFWlTo9Dt/+mIvEKAo5Z3tGGjKfj1Wwa4dgfIT6SACd1vvhsl0/5GVweqmhlM4VDG66uy3GczD9I8O1BQKEOQVkC12L2KFwNm9mWjKk3YNYPCZR1KTReTZxJKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c1c3bfcf-42dc-809b-4763-d689ff23d15f@suse.com>
Date: Tue, 12 Sep 2023 12:00:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 06/10] x86/EFI: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <eced0ebcd8f96d87ccab0e4008e0f752121273de.1694510856.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <eced0ebcd8f96d87ccab0e4008e0f752121273de.1694510856.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: d27f5e7a-2274-4be0-971e-08dbb3770bcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aM/XPd1I+39xfjD0+ScC7iyzBf4nfWR1IalAyjIEu6HQCELL5rcdWVQnAtzFHUo+6LJoP8vA9QGYGLbMeQu/htrglFFV8qxJ99aV0jrvBQBYOjT3X0zm3Z95vi/dl4QOxNdk1bNjyjr6tZ2qZChSMS4Rzr0i+6GfL9Xaoq75jxySy9/15WpbOOd0c3Jy9aoHAmWIn2xGzzq8ucvtR6vLxDKLnibBIfruQKro6w6LvQPJNvIRhZoZw4KH3m6DODG1MhIGlBUP32Qa3KCc+bpKMdw/yolgk9e9NeRk+jM0L7IXadCHyZMzr9lWUAIhuSlR4bLFIoj5L799xj+umncMRqoHRmeItxr60mGOu+/QtrcBQQu3TsK1q+QzPbLdeesCrqrfBFJwltL0WHwPXqVo2icbgBld1v66xyGgBOqPA/3dozVDxlqAcjPvsvC+7P69IZSxCQYT/nYt22mhYTB2AovFMz09rW6mzt6a7xlY+LfqHIOlU1m8RsY6DRCbh3rtNjqSGMvH7fiCfrBsZ86KD6j72waFEnaJzcSOaq2lTpgrl1fJYyIPbFbuerRHUtXh8MeEerRUwqL/AqexnE9WtOe9DOMiU1DoSdtHXZFyO1n1TKQx9mxdRZNw5U1Z4/XHfTgRDwS4DijZO5se7PjhtA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(396003)(346002)(376002)(186009)(451199024)(1800799009)(6916009)(41300700001)(316002)(26005)(31686004)(2906002)(8676002)(66556008)(66476007)(54906003)(4326008)(66946007)(8936002)(5660300002)(478600001)(6666004)(6486002)(53546011)(6506007)(6512007)(36756003)(2616005)(83380400001)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckxnQXYwdjJOZzhuWVhpMVQvdnBBNWpKdlhNUk5TS1Z0UXJwdHZmTVQwOGVC?=
 =?utf-8?B?aHlFOFJ0VzhnQ3dWTk9vREMrekQ4N3JnR1ZLUHRsT2lVWlVMQlVEaUVQblky?=
 =?utf-8?B?WkltaEhTdTlMbUFJNEszRFBSK3VnazMzNzVWclpiTWMwOXdtTWFEMGs1ZHB5?=
 =?utf-8?B?a29FanZrcUxQamh5YjNJb3VzY3RGN2k5ZUhxQXRYeExsVTR6RWtYNFJwd0FS?=
 =?utf-8?B?L2JDY2NQSzhFL1Yvc3pkbTJGb1pOdmxjVktUNkdMcHRmdGRpUS9xbFNoYzI3?=
 =?utf-8?B?Nm1nbEhiSTFwM2t4T1o2RFdJTHZTNzBaQ1NBVnF3TnBPQ2RRSzgwRWlTOWw2?=
 =?utf-8?B?VXJIaVgrTmN3MUhNanRMTURlOVhyRmRCR1pwdjlzUXBSM0dsY0hTa1ZMRFZO?=
 =?utf-8?B?L3BMalJUenRiUnB1WGQveGpxZzdqY3FCc1RsT2NPYmF4Tks3TzVGWjV1c2xj?=
 =?utf-8?B?dWUwc1R5bFBBQjE2TkxKVEZjVEpCaE9WUGhEVGFENGlSUk9hZ28yR2ExQ0ti?=
 =?utf-8?B?ZldyUkdYenZJUUM1WlRxbjVmTm96dGk1bVBiZzRGQlFOWmhyaTJMa3NEczRp?=
 =?utf-8?B?NGpsbWViSkhERGl2WFpvSVBydlhpRTFNRGxtc2djems1TkoyZG9GSTRkbk80?=
 =?utf-8?B?TDRTd0tReWkyck9qeTJpY0pPZ0cwMTJtcFZXMzVPRkRjWm1pT2hoUWpPRmpp?=
 =?utf-8?B?V2hFZXlubnIyVmMrM0xLaURtY0hlNWxGU0lUaThnZSsvUW43a09pNGZEV3B2?=
 =?utf-8?B?Qk4xL05zcWlmZUk1TTJUSERwL2N5bksvc0RlQzR1RnV2L2U3azZyVERRSVNC?=
 =?utf-8?B?NCt6b2dWVmZiSi93VkdJRTVUWTNuTEprbENRSUswKzVQY0QzcXUzNjE4L09q?=
 =?utf-8?B?OUxDaldMWURJejh5cjFiSko2YTlBUXZMZGtDYlNWRlRqdTRNaEFNWForQzh3?=
 =?utf-8?B?RlhTYzFVOWVwbGdqNTlzdFBoMVpWZmx1a2dwZVBwdE00WkNGYnZaNU5BdnFy?=
 =?utf-8?B?OEJlcTY2MlVZdFFJK3JSZ1F1YnU4Z3BPUXVRVGROdUJCdEdsaXd3TE4wM0Vs?=
 =?utf-8?B?Slk5Nmk0T1U5RlMvUzZaUERCaDR2RHlPYmRTSVhjSmN3bndaSUtDZTVRdXh2?=
 =?utf-8?B?czRiTGpzQXgzck04UkhHSnNmbzQ5cVk4SnNobTNvVDJiUFNOQTR3MmRNSi9Y?=
 =?utf-8?B?c21UdGVjclRKRlpXSC9yNnlMdkVwSElobjlHOWI5SDJ2ZXFrSDlRQ0dnTmVs?=
 =?utf-8?B?Mm16WmN3YlUrdUVoY1hxZGdBMEhOaHpXMlkyaXArUmRlUzlJVmZiTHlucisw?=
 =?utf-8?B?b08wc2twb0Q1S043U2VrY3BOeThHMTkxYkpGN3U4ZmJzVnBDN0hzM0pIeVRa?=
 =?utf-8?B?RjZmR3lOcFRsZkRoMld1WE5UZy8zY0d1cnF0TUQrM1ZLTXdPazg2T3Z1cEdr?=
 =?utf-8?B?SjUvTTczS09NN0VoM2tkZGxDRG4yY0VoSFZ2Y0V4SkpqRnRXclAxLzlTZ29a?=
 =?utf-8?B?WVNKRk9yN2dhWEZ6QTNtMUFiMktBMjE1U1JzcngvbkROYTBFeGhwcjRJakk0?=
 =?utf-8?B?bW44ZS9iNFRJV1VSTHhBN1dKUFNyZWp2RFFVNnpMMTViL0R5ZkRTUzlpbW55?=
 =?utf-8?B?dVlsR2xHUnU3UEsxdjdRN3dFay9zVnJFMHo2aG1yQk1kSXJqYjBTWFU1VmRY?=
 =?utf-8?B?dUtESEI2R0NFbjlvTjRaRURIalduWElVdGZCRTJaZEptdWZrenRKdEZVQmxs?=
 =?utf-8?B?azdMcnZwRmJudEhKSHRYZ1NZRHUyczk0SEtFNTFoOURCVXFObENZcy95ejhB?=
 =?utf-8?B?bjQvNVdteVlvVUtlRWxmcEkyODhQMGZJN0NvelRxTElqOVlSN05HV09Lb2hY?=
 =?utf-8?B?dXpPZVlCV0xVMGZKVlhYNFhCaWpWUjI3cFNmRDRKNWoxTjdkcDhpRCt6TEdY?=
 =?utf-8?B?aUdpdjk0MnVlTENmdlc3SzZYUG9lclNwdDhRV1hUR3pPVmhyRlhuakpvRDlx?=
 =?utf-8?B?ckJ4Q1ViMktXc1gxOVNwY1lvNTVqMDdVYS9KZHFlUEI4MUtiQmdFUzZoT2VI?=
 =?utf-8?B?ZmNOZmxhRCtqMFdhTmlGaG5YNDRZdFdPUDdYTktMSy9Ddy8zcGRtZHEzNUE4?=
 =?utf-8?Q?M3IGX1a6q78Gv+p0bih9WQPmp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d27f5e7a-2274-4be0-971e-08dbb3770bcc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 10:00:08.4670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOR+pr7AyWlNQ4HAFd9j98y7d5o5Ezra4cTtzlEs61wErCfSC+uua4jQaOgczPCTigA9VSfpioOrenQCSF0rng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7409

On 12.09.2023 11:36, Simone Ballarin wrote:
> --- a/xen/arch/x86/efi/runtime.h
> +++ b/xen/arch/x86/efi/runtime.h
> @@ -1,3 +1,6 @@
> +#ifndef __X86_EFI_RUNTIME_H__
> +#define __X86_EFI_RUNTIME_H__
> +
>  #include <xen/domain_page.h>
>  #include <xen/mm.h>
>  #include <asm/atomic.h>
> @@ -17,3 +20,5 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e)
>      }
>  }
>  #endif
> +
> +#endif /* __X86_EFI_RUNTIME_H__ */

Leaving aside that I remain unconvinced of the usefulness of these in
(at least some) private headers, I think there's a naming issue to be
solved first: How do we distinguish guards of headers in xen/include/
and xen/arch/*/include/ from ones living elsewhere? If we don't set
forth a rule, the guard above might be re-used in a hypothetical
xen/arch/x86/include/asm/efi/runtime.h, with potentially interesting
effects. At a first glance it might work to simply omit "component"
identifiers, i.e. just use __RUNTIME_H__ here. Provided suitable
prefixes are used in all non-private headers. But I may of course be
overlooking pitfalls ...

Jan

