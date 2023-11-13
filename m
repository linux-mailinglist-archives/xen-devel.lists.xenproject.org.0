Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1577A7E9719
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 08:38:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631330.984571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2RWF-00012v-0q; Mon, 13 Nov 2023 07:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631330.984571; Mon, 13 Nov 2023 07:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2RWE-00010q-TR; Mon, 13 Nov 2023 07:38:02 +0000
Received: by outflank-mailman (input) for mailman id 631330;
 Mon, 13 Nov 2023 07:38:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2RWD-0000yC-2O
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 07:38:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 915de5a7-81f7-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 08:37:59 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7096.eurprd04.prod.outlook.com (2603:10a6:20b:113::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.14; Mon, 13 Nov
 2023 07:37:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 07:37:56 +0000
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
X-Inumbo-ID: 915de5a7-81f7-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWkV3lsjyos/eNGhqG8WvWfZAkpH5J89lYy9+xAVy1Gl5F19O7tdOcgzPSurZQnVY90jKPCXmErZIgodOioXWhAYzKWa2x8A28bfRW+iCHT11xezYi+//fSMRrvPSqS3Cb3avnW8CE82RgRm6RtkMkbEMfSeeoNBcayeNDead8Max+w8mrRnVAV/wGF1wUOfkn/6d+zPJp159lF1h5itnWl5qJ95/c8oErDT91rGg4wZk/3+xqieMGELHBW5zqZnyMJlgjMNtUIPRD4bDpQ7OcqWozYeUGygihaOv99JhWtCY1oxjC7rLZwPzRvCQe8eFnQv5dkmPYiGhK9EtWDoJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDUeW0XPspN95vuVrFqgAsyIfEXIkSk9X62a717lfHE=;
 b=MI83sGI3vZIPr8FATsn2UXA5iNyDyIEcA0gkLr3aFv+i0fSJvYjFuZGEz7ZxcfH/LRDxrvoypvj85Nijs/825GUMhVpuQFyvYLH7UGv04opes299lanH7la19GNjGFGtwJy7PgPgw5O+TSF6DLIPA1zbgO3Ch4XJPPpXLi2aECG9z8sGSQeM3FyDXuEjZ3J90dA4YoM198/edGlA5G1qw34VWJlUkU2BDH06sDZ91IivslCfvObDfTZwJxYglLowUBFfVx7I+6fVS6CU+y5q+wA7vZUAJEwJnh04Ef7z2C3ncPYtgRdYpecF99zumuSCQUSX3uoRG/F8LH3tBqV72w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDUeW0XPspN95vuVrFqgAsyIfEXIkSk9X62a717lfHE=;
 b=4aa8dad7R6nXbYCw6iWU7qcUDn0S7q7F9aIdTytJxDtGNZc28xU01egqJshUfWempE35KSpiKlUBTBq8klmEGtCPYr/gEjGyHmZ5QhhYk2hF1b1ZoTtr92x+oCpm+Kz0bpqFRK2HIM7BOtbDPpef+e42bOXQKRo8z9ZY90czAkw5VUclIUx+dCrdAm1s6m+JSmiDRFrizQRYLV5ClpG36mRtgnFNwxRDO63JyPwr4VYCx15uPyW9NQILcjGPu2CYkznsUNr3VFHRyia6S9CC/fkbIYjUa2X381UeYAcjY+uJyxJ7kXAsm7Y61Zxda8jEwDUEGKtaO/fQnbPYFN7/ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e70d9b85-00fa-3d7e-8c0a-d463cf0e0c74@suse.com>
Date: Mon, 13 Nov 2023 08:37:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org, wl@xen.org, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com> <ZU4g0y-Y6-77sY-C@macbook.local>
 <9d75d794-a333-792a-786c-064d35910980@suse.com>
 <7265e418-6c40-47ea-97a7-bcf3c2e61cf7@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7265e418-6c40-47ea-97a7-bcf3c2e61cf7@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0433.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: e14d5072-dc56-40cd-2cc6-08dbe41b73e5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nhw1wJBWGPWAnhx78WZZoly77hoN8E+nNBmudIHg3s9ZPlRlCZrvLDurE+tSbP3/B3oqW4vlkjw6z8awKm/HatTpNH7evBrWGQcF0VXTpXZDABKFcGy+dBWnTtW3Vd8aKzmKO5hJ20keHF0p78ozeifJ0Mdn2faCMcr2R7k/R7cAXl6QfnRN6q1bCXktgXcORXe7nzEdRtT/WNXGbIKgargRj90fEYhpTnrB/1w70KImEFYUxwsYr/pUk6rCUu4bw8fsP9zi9UhdIBXFGptUfCqZBc3f7T01bC5MiHI3Zoq8cOdADxw8mm3JFFNGoqVgobqs5x3D9RHeK3+Khg21jevRiNZFDkI8m+QIhAARyTKDZozXN/CCi7YNEgJs/H1F+iL3DOsRuMvqIbqHCgnuAgKPaEjvvClcKEHBuhYI82fDT6nB57yHXRDS4Yc93dfGy/AcJO38HwlFoUN1rT5OptvciRT74yQDWOemRuWCZIjfm4Js5ukH4cb1RqSRT7WAtVB/1jkIJ/THTppGTdBVLF0gF5uq9iUtbAqC2xrDpQV/99ilUEhacrvgh4SxVDSACmw5M+8VUv+HTQUYUznFUVYciwII8ACf0Lmt3hYsDElWXhzTMIARJweTABjGIzT0OTSjwAcJ5VsJASYHfV4b0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(39850400004)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(6506007)(53546011)(478600001)(31696002)(86362001)(26005)(6916009)(2616005)(6512007)(54906003)(316002)(66556008)(66476007)(66946007)(6486002)(38100700002)(83380400001)(5660300002)(8936002)(36756003)(8676002)(4326008)(41300700001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODZGeFcxTDdxaVpNbWc2QzlQZG9lamFNU2Nwb09tSlpLNHNDdTJQa1EzZHFB?=
 =?utf-8?B?ejFpbjNUWE1JVHUvNm1TQ0JscmZLN3drZjVHUlc5U2lnTWFpdEdyUTNoKzNx?=
 =?utf-8?B?Yk9wNi90T2dZZlNUSXc4Yll3VmJYZGlCWWx5d0JKNWJRdWFXdzFZbmJpbU95?=
 =?utf-8?B?aFhEVTdmYy9LcWRUMWlNSWNab2pRUjVTWFFQT2RUcmc5bUdQOExKbzBKUXov?=
 =?utf-8?B?SnRLbkJySkExOHIvbEVnME92UWRnMkN2ZmtkSng1bmxobW5WUUczNDk0amJ4?=
 =?utf-8?B?SEk5b01zVEZSaHI5NVQ4blFKSGQvelpKeWFycW9ld0ticjNzZC8vOFRwejNP?=
 =?utf-8?B?WVlvZVV0MlBsWXpUUm1oV3JjMURndW9PTzMzb09GeE1weXRQNk5GTkU4Q1R0?=
 =?utf-8?B?eHViaGIyTS94NWJzT1Y2WnoxejdtZzNJWndCeGh4MGw3SmpBT1pORmxDTmJn?=
 =?utf-8?B?V3lBUVRJTUtzSnhreFJNdms0Qi9xb0d3R0NaaXdmZ2trYnB5dVl4NDF6a3Jr?=
 =?utf-8?B?SFNpSmJldk1oNTdrL2dSdHJDdzNLT2U1ZGtVMitQUzE1MWhuK2lHWFBESlZk?=
 =?utf-8?B?ZEZQNFBieXRWNWljRVpMa1JsTHM3dTdYRjRFM012SENNdjhwWnMvaHZBNU9w?=
 =?utf-8?B?L21jbjgvSXVmeUZLMThtejJycTAybElsalVJamZOdTNBemQ1c2ZOcXJlYWI5?=
 =?utf-8?B?S3BUT24wVi9hQmdDaElhalVFdDhPdXZabEVPbHpXSkxoWEZZTTJQZFFQU3dW?=
 =?utf-8?B?VmZVV1lvemhtQ254M0xWMDJXLy9MVE0ySWxUUHZGdTBCWDVWV2tlU0d2VXNi?=
 =?utf-8?B?VmgwcWIrTFBPV2xabzlyOHNBK1ZmQVE5R1hzQmpkK1c1T2ROd2xpdDZxTlQw?=
 =?utf-8?B?Ymh2K0E4bXhKbkpVdmgrdUJVYWZISzVwUStZa3ErZ2tieTZ1Q0xSdmpiblBp?=
 =?utf-8?B?UFBxSFl6d0dTQnJqci82UDQybUo0RmFUWXN1ZmMyUXRTTVNTODk2dXVIZWNr?=
 =?utf-8?B?NHljekNyblhHYkVvbkNKTnBDZ2N0RVE0aWx1L0V4ekJFWFcrVFl1aklXUGRB?=
 =?utf-8?B?Wlpmc1JmampsQy90NTU3SzlBKzI3SG1SbFV5UkF2aTZFVVY3MkxPczJnSzJ4?=
 =?utf-8?B?b3h6U0piL3N3TkdwQnI0SU5xbWMwWVRZajFjWDExQzhSMGRQaG1LRkRMSC9X?=
 =?utf-8?B?MXBrN2VjdTFLSldCQUdpQXRRNmRUWEZXMHZZanZoY2x6Y3hvSWZUUjRtck5k?=
 =?utf-8?B?U2VrVUR6dXZVMEs1aGg3eVI3V3hGdlNVaW5iNkdYUktXNEN3MlF6d0lVZ0Vw?=
 =?utf-8?B?VE15Q08vT243MWRpdENiRzlGc3RPaXI2bDNRSW1rVmo5c0swVlVETHlEQ2hr?=
 =?utf-8?B?OVZKOWFqNkIyNUR1RkVqbXc2WDd3U3NkTzEvMjFEbHNXWUQ0THdCOFZBMWQx?=
 =?utf-8?B?Z2M2MjUrVUFncjVJaVExa3pkRk1PcmJPZFRxNVRBTFNiNStMQnlHK3F6dHZE?=
 =?utf-8?B?aFMrT0x2S24vRG1NekdNN2Y3TmRzUzA5R2tOUDJhS3E3QkU1citEcm9XYXBQ?=
 =?utf-8?B?Tk5RV3BHMU9ST2Q2TFdLdTZBVkdCdldZYlE4SmJCelptQjJrTzFiM2ZmcllN?=
 =?utf-8?B?QVJWcU1uTmQ2bDFlaDJwdzNnNTBvYmo5UDVtS1lSQUpQUExaZ20rNHJ1VXVa?=
 =?utf-8?B?SFdwVHhJR2NqM3RwT2VBd3lXVHFFRDhzV2EyeTVTSzQwbWdETGNsQ2hBdHFa?=
 =?utf-8?B?cEZUM2toNUdtZlVzWGQwM0NlZzdrcXB2VDhJMlZiQkd2R1E2QkJ2dEtPcVZn?=
 =?utf-8?B?MUNkR1JqcGN3RURuNUpUYmVEc2tnQnpFZWdEekEvUUtia1VtMkVtV0VwcjRD?=
 =?utf-8?B?d25WZUhqNmZRR1c4K0h6THFFTVc1b1RCdEthZi9YdXZ1N0xWU0gxSkFFVTFH?=
 =?utf-8?B?K212bXQ1S1cxRGd4d3I4djVyUStIZUlZTzhTU09SMy80a3M5d1JlbWFjenJB?=
 =?utf-8?B?NTlMYnQyZFN2RHpxK3N2Y25pVkZpSUtnM3FDTDdOckFTaFNyZm84TEhZNC81?=
 =?utf-8?B?ZW5jallpREZvcEZSRENhbkRwbURtQUpaa0R1a0hGOXp5U1NxNG0zT3NzSCti?=
 =?utf-8?Q?Yj+pc/lptn91pS67Zj2lPu+Bo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e14d5072-dc56-40cd-2cc6-08dbe41b73e5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 07:37:56.4349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cABpgd7yVwCY9BnVyQSd5T/T2/zeLb/i1V3lMxbMbVmf4r8nEk87Kuok6FsFsON3f/VbIPsg5qKs9WHJ6/oX6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7096

On 10.11.2023 18:38, Julien Grall wrote:
> Hi Jan,
> 
> On 10/11/2023 12:44, Jan Beulich wrote:
>> On 10.11.2023 13:23, Roger Pau Monné wrote:
>>> On Fri, Nov 10, 2023 at 12:34:32PM +0100, Juergen Gross wrote:
>>>> Get the own domid via creation of a temporary event channel. There is
>>>> no "official" way to read the own domid in PV guests, so use the event
>>>> channel interface to get it:
>>>>
>>>> - allocate an unbound event channel specifying DOMID_SELF for the
>>>>    other end
>>>>
>>>> - read the event channel status which will contain the own domid in
>>>>    unbound.dom
>>>>
>>>> - close the event channel
>>>
>>> Should we look into introducing a way to expose the domid, so that in
>>> the future we might not need to resort to this workarounds to get the
>>> domid?
>>>
>>> Maybe in the PV-specific cpuid leaf?  It's a shame we didn't put it in
>>> a non-HVM specific leaf when it was made available to HVM for pvshim
>>> reasons.
>>
>> Couldn't we retroactively generalize the type-agnostic parts of that
>> leaf?
> 
> This would only work for x86. I think we want to have a generic 
> hypercalls so it can be used by all arch.

Hmm, yes, perhaps. Otoh it would seem desirable to me if arch-es also
provided some extension to an arch-natural way of feature detection
(which CPUID is on x86), without the need to invoke any hypercalls.

Jan

