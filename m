Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C819547798C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 17:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248104.427923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtuL-0006XU-8L; Thu, 16 Dec 2021 16:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248104.427923; Thu, 16 Dec 2021 16:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtuL-0006V1-5G; Thu, 16 Dec 2021 16:47:05 +0000
Received: by outflank-mailman (input) for mailman id 248104;
 Thu, 16 Dec 2021 16:47:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxtuJ-0006RG-Kb
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 16:47:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb6b4168-5e8f-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 17:47:02 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-JRrC9mYbPKu7vpmq7wFx4Q-1; Thu, 16 Dec 2021 17:47:01 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4787.eurprd04.prod.outlook.com (2603:10a6:208:c8::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 16:47:00 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015%7]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 16:47:00 +0000
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
X-Inumbo-ID: cb6b4168-5e8f-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639673222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KnGlSChn3FCFh2+3l9wve+HBR/UW9dbN+wRydJsB8ok=;
	b=AKSHXZYpyRFTOkORMZJZ5jgkGAf0/VIswmNNezUwBlkRrVtn3vce4X/k+pCM8q39EjRMLk
	+Fe20VRMacxt/YqOyI6P2o9zeFsDmCePdfJMds5ne3WG0xCW7RndiYcvh1GtuS9fc/WOy+
	IOq8h+HM12ZZeOH/qyJo8DA7fgHYytI=
X-MC-Unique: JRrC9mYbPKu7vpmq7wFx4Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImaCDlMh3m7Ma2W/QKo9chBl8TbLMnk4aWrS5H2oVzIhRMPN9B5D7Sr5FJ7jZrh7NoZpC0Ych7wgPgFZ5ZIF3/+BfLO71RXxxcE4DAWzBeQ91/Vqwbnyw6fdkt4D4/UAI9uAwtPUMY+DRbOJwkbF5XxPsG7IergnzQmJA81SZLHTgly1aTWq26BKOJQkAE5VFfthaQOaahF0syrbO/+AEBbVrzC9oE05KFXIstwTAJi1VtsaNksRj9bO1UuLMfJEat6enBgMKNFMcmY+1crroSikuf02rA9vXnC7bHfo5kR6CzyubUOxbG/uwdhz5pmAjJTTe5lMWwEDUofLmgXLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGpcZsPmfXm7FS1GQnBbqGFm0AnbIrTeSIAIwCWe9R0=;
 b=fTpp3cjfvc/ttDe78wghCuz/vutErA3Sw08I+dLFqn5xEWUoeHte0UqZl3RCodNN5vaGqiZRCDCTE2IEt0GV8cWfg+QuSgbhO9yJJvwRh7jB4zwsI6xL0loTCTffOhLG3iOE9UF9mvvkeDpI6nepe6mAwKQeAZSo5eQOmtea3jak15vj1PphrQ9wRcNhQSbR5jfnBaY9cLogbOg3/ehJB1jvMat/Ma+WCPSxRVJXwoT+kQgucUJnWDYOHV4iU86RHtfAyF1ZxB5+RrK6Z8BHc+/jIHlnr4zLyrRwg40b0kT0o0ogoMIRCLLLiORPZEAJEFu5wPNX8hItkWqeNWqXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a37ac95c-6756-7ac5-48a0-be7228eb4376@suse.com>
Date: Thu, 16 Dec 2021 17:46:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 3/4] x86/cpuid: Introduce dom0-cpuid command line
 option
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
 <20211215222115.6829-4-andrew.cooper3@citrix.com>
 <948d4e68-5c8d-77c7-7ec1-56908248b185@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <948d4e68-5c8d-77c7-7ec1-56908248b185@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::11) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d226f10-632d-4c4e-0bac-08d9c0b3ae3e
X-MS-TrafficTypeDiagnostic: AM0PR04MB4787:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4787D000B5C0ACD01CE0BB78B3779@AM0PR04MB4787.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FUZvKPg9I2DYH0Ax71n3gLrfKaVwxkzrlC6x3CA8Tg3gTImYLgqPuE+SDP+tMVaASy1ik3CsztEI00rkLV0iOVerK3fHZ+G6ZrlhyQ/a4EAjfGLbEh/ZEtQ0yI3nCuCpMoeNPpeSQMv32mDcSWlvBvqkot9B4dQoLZu650iRrwJ0301xjD3UdQdR2/N1IlRsP61jXwev6ISEnU/dZDNERbYFOEOGUUyp9AqbSbwITy07rzJVTKnRRaFbaZVyqXh1gviTfYo5TrcIiPsinsdbWxzR6B7a4j3qHgb2WmhC9WAohXvwMTeMPnth7pSRdWd+W4+5+1H66MUTlBvuRUWIQYn0BZoTKJS4jOJ0cUbsO2/0/UA4ubp9nWoTbqrh3M0oYaJx+woXoXn4e2uByHRRF7zDTo/P52tggZsLBW3ScFMhAyAneBqbQlZC+QehfbrUzVGocZr3qqBudz4ezS/SbZTpOvpwPlgzVq/kgzuYE+0+IoSqOz90yyMOqhRpAlnR/jPLEITZnD7ZTVXwtf5cFFYK6hJgw8evL1Q1Q5QO7ynhgYPWJh11h+/FN22/ab4aQR8uww/zqc6L26fwzpYgTmB/6PznNJ8PpaAIDks1q6YUsaFvW3MYCGgLAvtCarAWuJwinsQjhE+jJkQ+kiXaWpf7GXW9PeFBvRJ20OYUy1muOxOj49831JuuFf0vuqItibmtRB7HJ5eg5awhDV3tsi5k97QBmjHISPh+crsf2UqfeiX/eNFHxNQfhuLmn7+Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(2906002)(66556008)(316002)(31686004)(31696002)(38100700002)(54906003)(6506007)(53546011)(110136005)(86362001)(6486002)(4326008)(8676002)(36756003)(508600001)(5660300002)(186003)(2616005)(66946007)(6512007)(26005)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LAaMpZOOXooD1bVnAkYbdMwHmwn5tYNrJdoKinRWTMydsdP+E6SlE5h6+nfo?=
 =?us-ascii?Q?qGO3EOspR6TH/jeQwVEOVgV9+wSKNG50d+SYrZPD66F2LCXu3IJX7mXEGtus?=
 =?us-ascii?Q?KQVUfxv0OhFTxt0Fh+0tGoh8I+UIz6CtLFeo+O5pT6Y3S33ouSecGf4pUG45?=
 =?us-ascii?Q?+dcwV/RO/C3cttN7s+rapHZqDSBQX51aSA9cNie+VGEJ+dumBtb/mOPitd7a?=
 =?us-ascii?Q?8iw6kmuBEgaNgMlHnulBSsSix5BaDTtnBj5XS0dKeI2q2TYKcYQPEVYTId+z?=
 =?us-ascii?Q?fQwxdhc4srMSYUX/tss9ye5I9Pxf7prjBRWbTgL28bmTcf5HTlrqp3RLEEpl?=
 =?us-ascii?Q?SuTne4U32kgYkwva5PTWFx1AQtm1iV28lCHcPJzhglVFOjV+vEUCFrBa12ZN?=
 =?us-ascii?Q?WxM3qXBdsjZP/iTCBvLuJHQOh/MyMO0Lb3roSiJSc2N9b7z9rTE4crqZ5yxn?=
 =?us-ascii?Q?xZlLVCVzxCy1Ixe5Rnt05HoZErbPjIBxFpdfdz2P8j8y8E7OoWO0jj4gaQVG?=
 =?us-ascii?Q?gwnD23chGPQxYqEyhqQXIFBm4+OB7bsM08qq5j+HPv5CIhwkFXt2piSYEIIu?=
 =?us-ascii?Q?o6In/mbilV4XNW5zZhPPBE84HhhghoC9hdWgDtPdUT3zgM2xSuTqMrDTaca2?=
 =?us-ascii?Q?L5DmA5kSGbcjmJKCNBmsCzFY6orcdktCsHXQ0GzwfkR5btY3gnUQ43ywgnYo?=
 =?us-ascii?Q?10hi7070mHTm2sLqUBQbH0raJXO0nVFMPQftYmcW20ImAfi5Cn7xWIwbFKDl?=
 =?us-ascii?Q?vIoOzrhUibpK4+/slsTOIRxSdxZ2MnJOtu8XSqspL/rro6zzIFkTw9Lxsvxh?=
 =?us-ascii?Q?XB93hN9CKGpygJH1H1c8iZUrgO0/+kjss3FXJD7WZe7VxSzmdmH+C5kEO/6m?=
 =?us-ascii?Q?gp5DzJB58xjK1qbQFlsMNvCSntvUS7vi3XxhoYDLwM5tJZsp6N9FYtiK/vWJ?=
 =?us-ascii?Q?C42i+7NKDwt/qvWm/Qkph4YKpIRNeC2vH9XPE5w9BSfM/z3+TJ8lDnoN7HpV?=
 =?us-ascii?Q?PKFOMzVnA3maFXL1iRJoGbGgLAnL0uqzUIl6KN//U9Qqd0bRd2IknqxMs8e2?=
 =?us-ascii?Q?kAJg562WcRYQDHSt/akCh2AxHIyN2sJ54F8KR6nXYqjgMGSsWZm1gQKjFkZm?=
 =?us-ascii?Q?AZca0I/RqAHB5H3kdAb8IAIaDfEzBlPq3tXJ5eOddeFG8ezg57R/EMSpO3RY?=
 =?us-ascii?Q?7agR2V2edzD5AHZ85VC0V+WuOMrL4rcjumDdtj4BWthhNwUA17XthU1EjY5r?=
 =?us-ascii?Q?zK2SoZLkG62y407asyVJ0x+4H7LuzQSwyneSd2acxJV6L2qYw3TAQaGBMxIN?=
 =?us-ascii?Q?Sn36ooSNB+dyFlj7iKB4R7pxMt6bVo0tR5SZBGt4X9UEmceTDT5PBW9eXku2?=
 =?us-ascii?Q?yB1Vg2FX1TUakPArZ4wFR4Qo4xXbCzD4tuZ+IRFxPRCHMCH5BIESGFhbuGEn?=
 =?us-ascii?Q?+TNlSW2FVNJZN5aXIKw8K0lNnzH+/m9Kk56Mdl1liR3Q4eLEUEXbGuAHOQGQ?=
 =?us-ascii?Q?ljQqBc8SyhxW34gGyQGPLj4uebyAS+ojaZQKo/Pj7C/W9SSXFsMlos5dPwHu?=
 =?us-ascii?Q?1pCbEqMIwI9ZqbzZePHq4RoIccCEYoivpACpPT35ju9y09nD0VKnuXRqLZ/R?=
 =?us-ascii?Q?Tx+2j+dOphCNCw8PZp6hP1A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d226f10-632d-4c4e-0bac-08d9c0b3ae3e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 16:47:00.5710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWjTaXKc7ZLImMygwDGnFcjr4JJwBdCJOsFnXTpZas5h5p7azOtanjAjO4SOSlDI+M7IVeDKt0GeaEvEc9TycA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4787

On 16.12.2021 12:56, Andrew Cooper wrote:
> On 15/12/2021 22:21, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
>> index e11f5a3c9a6b..83a80ba6de70 100644
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -116,6 +116,23 @@ static int __init parse_xen_cpuid(const char *s)
>>  }
>>  custom_param("cpuid", parse_xen_cpuid);
>> =20
>> +static bool __initdata dom0_cpuid_cmdline;
>> +static uint32_t __initdata dom0_enable_feat[FSCAPINTS];
>> +static uint32_t __initdata dom0_disable_feat[FSCAPINTS];
>> +
>> +static void __init _parse_dom0_cpuid(unsigned int feat, bool val)
>> +{
>> +    __set_bit(feat, val ? dom0_enable_feat : dom0_disable_feat);
>=20
> Based on Jan's observation in v1, I've folded this delta in:
>=20
> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> index 83a80ba6de70..39baeae9a6cd 100644
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -122,7 +122,8 @@ static uint32_t __initdata dom0_disable_feat[FSCAPINT=
S];
> =C2=A0
> =C2=A0static void __init _parse_dom0_cpuid(unsigned int feat, bool val)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0 __set_bit(feat, val ? dom0_enable_feat : dom0_disable=
_feat);
> +=C2=A0=C2=A0=C2=A0 __set_bit=C2=A0 (feat, val ? dom0_enable_feat=C2=A0 :=
 dom0_disable_feat);
> +=C2=A0=C2=A0=C2=A0 __clear_bit(feat, val ? dom0_disable_feat : dom0_enab=
le_feat );
> =C2=A0}

FAOD my R-b applies with this included; I had meant to reply here
but then replied to the original patch.

Jan


