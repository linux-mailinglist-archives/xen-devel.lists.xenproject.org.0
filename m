Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575DC46BA0F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 12:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240955.417768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYaP-0002fp-S2; Tue, 07 Dec 2021 11:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240955.417768; Tue, 07 Dec 2021 11:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYaP-0002dd-Nx; Tue, 07 Dec 2021 11:24:41 +0000
Received: by outflank-mailman (input) for mailman id 240955;
 Tue, 07 Dec 2021 11:24:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muYaO-000268-3X
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 11:24:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4405bdb9-5750-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 12:24:39 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-0JTHJWq4McSBtX8HgSJoIw-1; Tue, 07 Dec 2021 12:24:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5744.eurprd04.prod.outlook.com (2603:10a6:803:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Tue, 7 Dec
 2021 11:24:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 11:24:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0058.eurprd05.prod.outlook.com (2603:10a6:20b:489::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Tue, 7 Dec 2021 11:24:35 +0000
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
X-Inumbo-ID: 4405bdb9-5750-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638876279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AV4SpssrYaGyn0sCUuJtrY1jLEs20ZCGEia+x8rkXlI=;
	b=Zi0t8i/DzfIWJ1/VGLXNqPe2hkK513BdBkuVBoNxWXCF7PZijagHF2OH3Y6Sv38QiVLMg2
	Zc8mwNdX8K9xswwmDAJAz2ETMGdvxquH75VM+s+lO4xJyhS8T391GtoHwyr7VaXCFpGEw0
	UwXT73CLn4gIj6t/mN/OCqzuWG9yBa4=
X-MC-Unique: 0JTHJWq4McSBtX8HgSJoIw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpZ4bMP2bMN0ApBx17sYgzlbBQCHFainUrfkEM48oVn4KHdNxCxZBYcoqXiFPxw7R8K6U/gLgj10qYWlweBO8To3r6+R8+pZyG36//dRtunC3T2Cyy4FJzbBpaOpH3E9qa3bxn3WtMBSBK59jDVaBqCZBjQBP779XtKeKECCQHYDO0h/UG1+VT+SHtmtipgBw0RiOmrW1OAXwufT2GXANso32CmS6wfN4uZiAVvLH6wmZx7ogRUVPHX61fLswN8N2JG4TakNmnbmm4cBaKc1TsaHO64+KeuyMBkQerIZestjr51X4p0/BDdq/vQiETQ0YNIKsE4mKAIIWquk3y2DUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV4SpssrYaGyn0sCUuJtrY1jLEs20ZCGEia+x8rkXlI=;
 b=euzjQm29jaNEjkEnvlC4290ed8A1deEEkPy+pD225n7+hAkhflvPCUFyu8LydbU4d3i0g4QXexsulii4f2I1XoOoNiTz32N5WJ3r5BHeqvr+CjUA/48/Xlf7J00BvFHtwM7OicwADdwwbgmjqQ0T/bjCB/CiMqHit1nrYoDgJV/EJnKU2OzEFaJSqf3vOtbig6rJH29phrWw8K+Cya5BF4p8W9cogBn6bPV0n3eqkqIztXFW/jZpagH0daF0wshwvNzKW5AhZZzbBuzJrJ8PE1vEnVzBS0OaXFmzyaiQRl0kHsdcddlPVDkTHVjdHUNFTfBGrjJs6HmMkZgGse7Syg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e86a1d1b-0935-63c9-1de6-36fe28f06b77@suse.com>
Date: Tue, 7 Dec 2021 12:24:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH v8 04/47] build: set XEN_BUILD_EFI earlier
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-5-anthony.perard@citrix.com>
 <2bffd73c-ce1b-40cf-73b7-f988e69c4f07@suse.com> <Ya8/2Dc5yEp/ovf/@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ya8/2Dc5yEp/ovf/@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0058.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c451bcc-6ea8-4752-b3c3-08d9b974266d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5744:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57448494874E6B75765922B4B36E9@VI1PR04MB5744.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NPjvX1mqui0FV1ZISEm7YMXyRC7o82PnDDFIt5ZoLuo5NQuoZifn4NXaQSaH7GkE2odGNqeTQOhiL8kUgqkXTfVJNtqNn9k7mnYLkvkOKT3gWSowaHCJ4NWHqH8Qu9o5LIOsFmK4o97N4sgxdP9hGlVISPkVTJm3/ToNiRMAhiEdhEsPqV3wj7lkiC219FFVRiUfFFa+YpWeu3wo4YhlDvYcQEl6B+ujfu+mZbx7i7Y4pXgdQxT/i953N1BPgvlXzIHhieoTEzSyEUDjg9B0s6l5hH76tKy514VkHcU0lc2K+bo25ttgy8CkXZWBffQzzrhAizBi9wlJclejn/T4PxuTzaA/0e1RS/yM30oXIzGDrMlIpje4vpAel99j4U/bdtRM9KpHTORNUOPE+7kg8+EOP6w+Jvqq7dc251w4FAGzyuBe43FJWlEmWrUhNxJvkBAzv55gEspHK1JJVQfy2714TzTKD6DlC5pJ9TYzUtoRl/dQahWTTp5sAKm0rVFTf9DuRF4dgeOy0FFTs8x7quEW8I8msQEbWU8g/3mhRuDOD8T3m/DkirIqUPJgE4up5BZuMrWH8Fw4hcZ3nv1Td2hW5tg6+UsYF+Frj36zGcCctN9EUZtowGH+kNGxSyVv1jj0YgYuRI0SH0TiVAPrDZ5ltUkF1r2SrzHAiy4BxM07egYKK4wun9amyyiLcoZSODSkRvwxFG65kSef2u772qJ+bsZchcoHBToqRLF85s+Jt2idniC+3P1w2CaOzDgQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(26005)(6916009)(8936002)(53546011)(956004)(508600001)(2616005)(54906003)(6486002)(4326008)(8676002)(2906002)(316002)(4744005)(66556008)(31696002)(31686004)(36756003)(186003)(38100700002)(16576012)(66946007)(66476007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzdPR3dFa1lhTENzVytVT2d4NFMxSXFsa3gyYjZYZU14dDduTnFDTEFEQWx4?=
 =?utf-8?B?T0VldDBXemtpK3ZWNHpsWkVUV3F6dVFXYUlYTDdaR3VoT0loK0RDbTFITHlh?=
 =?utf-8?B?djBBeTg2bVBYTzRsTmE1Tm5HS0I2QXdQOThONXVIdmxxSWRQQ3RRN1o3VWhZ?=
 =?utf-8?B?NzJ3bnpPWmtmUTlObWgvaUl2bGJUamxjeS9CaGZORk5pN3BmTHRKV1FuREdY?=
 =?utf-8?B?b2pTZmRqOFcwWDNwaHFaU2RPV24rYlhiaXJqUFY2SFdwUklvL3FYUFlyZ0do?=
 =?utf-8?B?REh2VU5Ma1hyeFNSR2VheG9TVDFGNjZnZnRQY1g0VDlDTmFWaHBGMXJtYlRv?=
 =?utf-8?B?T1p0VUhrQkJaRGp2TGc1endYaUNlanNwcjNoSitkOUZVaG5HdCszSTZNb3Rj?=
 =?utf-8?B?bGdYRDNLK0ptLzBMSlVXeWh2Mm5kRVFvaElHTWhoSmFtenlUeEMwMlJ2WWhJ?=
 =?utf-8?B?QS9NbFhVbGhwMVpJZHppdTA4VEp5bkJOd2MwTXBZOXEyRXBnWk1WV3Nsd0M0?=
 =?utf-8?B?MGhVMDRHMjdYT2JYcEhZM1hxa2Z3SlZVOXpKdkx2bzNPWjFUV0VsRzQwdEJi?=
 =?utf-8?B?T2NxaG96cDF1alBzUnZrYVI4dUhDWU94azFob3AxWHNmeUdTR1N6TDVWVngz?=
 =?utf-8?B?R0V1S3ZodFFEd1E2T3dmaHQvL3ZBM2xPL0YzUnFmWkpCZ1dTME8ralFkR0NY?=
 =?utf-8?B?SnBPeHdmQTBXd1R1UGZYNHl0VEFyZmE4WWZTcVRadHhYMWh3dzBqU3NQb3hK?=
 =?utf-8?B?djEyNHBpSGdGV21PSWpyN2RmWlVoNFplcTl6MVFDTFpVTGpiUFpkM2R3clkz?=
 =?utf-8?B?QzYreEpReXlOQXh0UW9UK2FhZGZVZkRSSzh5K1FzYmsyeUpwL3lYRHJEWUFF?=
 =?utf-8?B?N1IvaU9oeU1SZzZWenBMWFVsQitsWW1tdlVMUjBvaGtTODM3RlNZS0xtR2th?=
 =?utf-8?B?VW5keC9EVnFMQ2QreWt2QTZkQlRmMmxSS1NFa2NTZ2JlaEd3Tk5NYitPWmhB?=
 =?utf-8?B?TGZ6VG02d3lKSjlrODdha0Vhbm4wMmkxK0xuaWllb2pDWXhtM2tYeHBrTWdz?=
 =?utf-8?B?M21IVVBJY2hNY3FVT1g3bHdOTldFWTl0OXdPZDFlMm1hU1BTNVlRRk55UE1S?=
 =?utf-8?B?dzVkQzYwUjc5cDc2UHU5QlZ5NkJPMUFiMU1OcEJpUnF6RFZJTXc3TUhpaGtV?=
 =?utf-8?B?aDdvQzRpa2FZVXAxZW1pNzhJRFIwMWVDRWkxSXdEcDhqR3FsSXROTjdaanhO?=
 =?utf-8?B?Z1NHTy9MV3hpSXlWcWdJNFNyL3pqUkt0ZGdid1N2bnNaY1R4Zm0vOUFwakxz?=
 =?utf-8?B?QVg2aFZieUEydzRRRU1hYVZqd0RrUnpBT3RiYXE5SEJpL3VWdlMySFRuSjUx?=
 =?utf-8?B?NXRtbmJKZlkzMFRzWFZCeUd5VG01eGpReGtwNldRb04zbmtTVGNtWFhaWXhs?=
 =?utf-8?B?VDl4R0VrM2U0Tit6eStoRjZ2Z0hTVFFvOHRyUG4rdmVhZDFBUFpDWWJDU1Z6?=
 =?utf-8?B?U1FXWDRwNmY0LzQ0ZFpXWkdBcVpPb3BLdUxzTmU5UXQzMVI2bVBKVlQveE9H?=
 =?utf-8?B?eWV1Q2pOaisrWUgxV3dUK2ZCclhzNHdkczlnZFRwZDkrdGVxNUtMdlA2Zndi?=
 =?utf-8?B?TzNmelpxOHJTVFJqT3NSeXZENkVoeFhhOXlBYWZUaWZsQ3FYM0pSK0orYmEr?=
 =?utf-8?B?QUlQU1ViRVJEWGM1WFY1dy9SNDlOQnZVNEhvOG00ZkxFU0d0L2YzeDJrSU1N?=
 =?utf-8?B?OTcxUXJqWVN6dm9UYmZJOFN2YVFzQ282bVJrSFY1SjB0V1E0a2NlNXhxbEM5?=
 =?utf-8?B?MWdPU2xvMkhBZGdjYzZIeUFSQllzOCsyamtnMVRKTnpLWmEzYzBLSm9GMnU4?=
 =?utf-8?B?RFRQanluTGlYdkRjeEJVQ3ZTSjQwSHFPSElST2RSZ2ZkOFRUMVg2R2NTNHNR?=
 =?utf-8?B?b3g4aXRKZlc1UExYejRRblRwMG1RR3pHTldJL092MkJMWnJKSUJsaXpSK1JG?=
 =?utf-8?B?cWN0cXFMWE9lNnYxQlVLZjdTR3hnNk1wTlVzT3ljRHRDanE3YnRObXIzZnZV?=
 =?utf-8?B?OVFMN050M2tML1g1d1lqUmFvMUZTc2V5cVdFT2tSZHp6SDd3QytQOE9zVENF?=
 =?utf-8?B?NTRiM2RYb3ZFSUN1NHMzK0ZxWk02SXYxajBzbVhWSjR5c0NVYjJld2dyZ2pD?=
 =?utf-8?Q?Bqw+fQtiMTDDWXpZ4VBSE3c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c451bcc-6ea8-4752-b3c3-08d9b974266d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 11:24:36.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIStp4umCN/dvCkHnfQQS1+yOsbLho5wdLMMSdJOBc6Mm+9kYnODUrpeHrWl6i8Jhd88qtyCZzMAwxp7VEbTLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5744

On 07.12.2021 12:04, Anthony PERARD wrote:
> On Thu, Dec 02, 2021 at 03:06:54PM +0100, Jan Beulich wrote:
>> On 25.11.2021 14:39, Anthony PERARD wrote:
>>> +export XEN_BUILD_EFI XEN_BUILD_PE MKRELOC
>>> +export EFI_LDFLAGS
>>> +endif
>>
>> Exporting MKRELOC in particular isn't very nice. I wonder whether there
>> wouldn't be a way to keep it local to xen/Makefile.
> 
> I don't think that's possible. The value of MKRELOC depends on a call
> with OBJDUMP which depends on call with LD which depends on a call with
> CC. And the call with CC is the one I'm trying to move.

Like suggested for another variable elsewhere, besides moving the definition
(which I agree looks difficult to achieve) there's also the option of passing
it on the command line to (presumably) just the single sub-make which
actually means to consume it. It's only the final linking step where it's
needed afaict.

Jan


