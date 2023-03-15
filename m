Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19086BB4BD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 14:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510060.787055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcRFN-0004du-8S; Wed, 15 Mar 2023 13:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510060.787055; Wed, 15 Mar 2023 13:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcRFN-0004bH-4s; Wed, 15 Mar 2023 13:32:53 +0000
Received: by outflank-mailman (input) for mailman id 510060;
 Wed, 15 Mar 2023 13:32:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcRFM-0004bB-31
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 13:32:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e10bd8e8-c335-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 14:32:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8802.eurprd04.prod.outlook.com (2603:10a6:20b:42d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 13:32:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 13:32:47 +0000
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
X-Inumbo-ID: e10bd8e8-c335-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n08l1mHMuLyCPglz2fuemHRtZFgKDdzAjsqVe36fL3D7mDqzP3QFY+jO9tzPs7xp1VUISrSKrYoWT2JwbQxl9V4gHGSqBuGS7Hb9wBg7/pbzQMyKHxbq4+cvywKBJLF3Z4SMdac+ZwbQ05MOYSoacKxf6jzHmT4LLNHdy11jZz7wPSgYlbUGIxfZ9r2q0xkDFSeYeKHLYaFO7TP7phbGrzVVRFZHH0YiyCQTPPzx+Za8S7BNrE3HtFc91GimZsnrS6Hhb2luXukLjwxzcwc9FP50puuv18jExDuj53/hat3DCRkx4u/fm+5dAwmwLpqwIXMvZrPz6T1gAjDWCkuJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAclPMKtriJj7HeddeDmW/AaZLDrldwXJXHTtf3cXVY=;
 b=PSmQSGNbjl/BjX/KjD0yNcb6PVz4EGYjRr/8ST3xr1PQ4DyZGjiWdsJBrWPODelI5QyFshbKyd7tJf7V7s6uWoK+UDRWIK5+YaNVhYAKM92liG/zctWRyJEpyqLG2uvTBrjSJuLzWbMVfvuHcVt78t4wteE9rdmdmiTT2tH712cwAlC+dd68Yi0li8hnfSAgrTRjUZk+2ssVrC6BIo0uU4By7LQa0CwwHae04lSCD6KF1aXxuHjHuMXNv8EW84VhYdOHy3MfsIDgvuD5HFftwPWlQ36zKM9GgOAuf6B+NvMvaLcxN6DVhseg4LP9003INhc6T2l+tntx8wMgdDYcgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAclPMKtriJj7HeddeDmW/AaZLDrldwXJXHTtf3cXVY=;
 b=cYHtv/Ynq0AdYgOXqrXXCLV2aEV0UItMz4273+MA+a+VnPqjlRffmO2NTu3+1sgyBoP5hYkW92rDorlX5s8HixxEU1zTmYvo4FXMN8P4u6aL6EGSSeOr28LQObftS2CHhHc0K+UzjmjVZTaJmNqjS2vFnCAzQHKkjBc1xmmPd4lUfal3BSJIJiY6kf4PvwiU4xGWrqkpA+hvxMYZW5OjqLUC0xwWHxNYSPwNrVHP3HOFdHSu+PV66SB98DcjC5L1UZt7qBXlAKVI+70odvFR2fvb70rKdxf/Dh5sTsetoQoXDhC746kpEFYgkEHvboLEoB36vGJ3EyAY7+IaIXqHQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <84cbf717-dc43-e2d8-ffc9-1f494b17b6ee@suse.com>
Date: Wed, 15 Mar 2023 14:32:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/10] xen/arm: add sve_vl_bits field to domain
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230315090558.731029-1-luca.fancellu@arm.com>
 <20230315090558.731029-3-luca.fancellu@arm.com>
 <a8dabea2-0903-6d3c-350f-127dd9f726ca@suse.com>
 <C0BF2738-9D1C-467F-A767-BEA4C914EC9D@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <C0BF2738-9D1C-467F-A767-BEA4C914EC9D@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: f329ae4e-45f9-4a65-da93-08db2559c3e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/hcYSV7i1Lt1ICjiZ0bmMPgwxEHUfSLsQxraPqxlAUoOUaQX3T0Fb4Zkur1ALtS/M4lbQZED5dbOwSMVN1jTMBhlaVnn0dKyaPVVb3RMG4BpY8z7JiMhiUh7CPRqUa4A8tjEu4Q+3TJdTphsSmkhZY9TN8kalWXwVqQR/TtRnvOY6G2mc0idgFnoUajMpC/6xkOL7SMGX8cn5QbDHUzD9X/ZNR0VlTB+PIksobgpdycz1oPtgyo2L55Zvjy0FAFwOVc9FIrJIe7bsTv5LDZA8LzljTce/pU4a1dtXQTcSDeKUDrwKD7eC5Q4y4gyn5t9MvHypvCNUhXxbwnBO2B+HNubNyjxnFvcHJSNcxrEMk5l5/Jo1xJnxtIuplncoWyKMynIsO881duKGgGLhSlsr96jnwZHYylqvK2773HwzCZO6AUwXxp/O3b6MqcttxP1TWA9NLtkhyJ50GD/eWeaGoQcOxdwy4GbS9Bfa/zsQqFvt86aCnqd2Z9YRdKF4CR16WVfkefC+/XdJ4nKctHt3Sq8dC4N9oFyCDpnWouONioLgVBAH7Alb7hj0VLHCkWcaSoUACQ9si4GRaztpgqcKB4jjjbPXUtlFgDO+GkVkW51nH4/2BgdVcT0PqEVI21+y3z5pw1/+P98o59K140hN29dMdWtEv+86da2QJEU6JmiBxYPDx78nTnp8zHoGn/c6bDm42SL/W2hPISRXUZ8BA7dSwTUqd2xBLX05rQBJ1E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199018)(7416002)(38100700002)(4326008)(316002)(86362001)(54906003)(31696002)(8936002)(6916009)(8676002)(41300700001)(66946007)(66476007)(66556008)(36756003)(2616005)(478600001)(5660300002)(2906002)(6486002)(31686004)(6506007)(186003)(6512007)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUhwRmY1M0t3TEVOM3VCcnBBcnF0b1JNU3JzSDJsdUliSHNoOWYwYU11VVBr?=
 =?utf-8?B?ZDR6TnNwcmZxam8xL1YyY3E1bUpjRElaaXpYOW91YXNHOWxnRG10aEcybzBL?=
 =?utf-8?B?YVJmb0Zlakl2WUU2YUlFdmF1NkgxRVg1TGFDa3Mvd25xR0Z0TnBmT28zeitz?=
 =?utf-8?B?eW9OeEh3bXdDcStPOTNJVm1IYWVESjN4ZkhzbGRCYjNFWWpGWDU2a0dRcjBo?=
 =?utf-8?B?V09rVlpLOXRrblNTVE0wTVJ5MFQ2MTFMWVRNVmpzV2Z0RWpTYTRYeVRsVGxF?=
 =?utf-8?B?MUQwZ1BJRVZxaVFCNjAyT1BCL09CV0ZPQ2hYeUswRnQwbVVMeVByS1BaTm9p?=
 =?utf-8?B?WVdNbmJsSGFpekFZWElNdVV0ZmdkejFpSU13ZnFzUlJjc0JWWU5LZmFQYjFT?=
 =?utf-8?B?V3N5OGV2Q29uZ2pyT0hpdTJ4aXVuOWEwQUYzSkVWaGNwekhZbEtza3hQdTFE?=
 =?utf-8?B?SEo2eWluZ0QrTUFxNnRKTTRINHMzdE1OZUMxRExhUnhTWjNMZWRXNis0cTMy?=
 =?utf-8?B?RUR4SDdWRC9xL016MEJxTDBpaFRMZGJBQWRpVjZDOTJaNlVUVysraEQrTGdI?=
 =?utf-8?B?TkFzcWhCYlIzNVVSMlJpT3A1VEZvWFhjWXpxYU1JWEUzYzd4b0s1Wlo4Wmcv?=
 =?utf-8?B?Z0hUZUh6RGI1MTRJOEhtWWowd2dYNTl5ZlRVTTZWTDhLME0vaHdBejBaT29u?=
 =?utf-8?B?WjBZRVJJKzgxbjV0TDdoZEVDWDV5T0ZXT0gvWS9uNXJlMjEvNHhFYm1zQ0I0?=
 =?utf-8?B?bGZQci9zQ1gxaVRBOVRVcVFIUkZLRmdGTFhIbjdKSGw0a2Qrb2ZNNzdjZm5s?=
 =?utf-8?B?a3lzRnV6Y2xEWW4wVm83MTIwVjlCSGlIYWVIS2FiT3FDdU5zWjVLbHNYenQy?=
 =?utf-8?B?QktEUW5iYnNUZm9ORkJRUUJ4eFgyRTN3VStuelJNR0xURThQWTBZeUpOZVpM?=
 =?utf-8?B?SDI4YUdDQ2tpRTNsc1hwVVpuNFZuY2M1SGRNdmFjZllyRU4xWnJidXQ3aFVx?=
 =?utf-8?B?bW93N2U1M1NTWmd2MDdTVmpoS3NqVjM5dFhtMGVPQUR3dS84OSs1V3V4Y0Ju?=
 =?utf-8?B?TkQ1cUtGNDRIck9QUmd5TTJRUUNkSzE5MWg2OHBUMUtERG1EcGtHQ1hidFlq?=
 =?utf-8?B?QmMxSHpKMktSak1lcEZkYllVQ3p4VUpwRWVONGtqVzF5YkhvRVBERkw3UFk2?=
 =?utf-8?B?dFo0YzRGaVdYeW9zaHBMdVk1bS9kTzgxMXpPWk9PNWd4TGNic05oNnppa1Bq?=
 =?utf-8?B?clljeEdaZjErenZsYksvVlRxRkVSWm5wVkxDZ0dVYk5ZNXNOMm5OdU9mR1hr?=
 =?utf-8?B?OHV0dU5jYU9qZHZVT2pUVzNQNEFmc3cxUSt6OWR5MkFIeHp6Y0xyNnJaUmNa?=
 =?utf-8?B?dW9tQTZscG9Sdm1aQ0t1Z0lXSTF0cTdlbjBOeDV2ZElvMkw1eldFL0wwM2VV?=
 =?utf-8?B?NkVMRzNSV0ErYTZXQ05kUnpKZmFqL3hDTE1NYWRVN2haUlNJOVlMY0FqUnJ3?=
 =?utf-8?B?b0g4RU5YZGFpVFZ6cGR1akQvUG40dEd4SUEvSWJuMFFBUEdkNDkyMUhSQlZk?=
 =?utf-8?B?eXF1RW4wa1hJd1JxNTFvQVBQRDdnbnJ4NjBOc0pJM2pLMEtsV3NOTXFhTkhx?=
 =?utf-8?B?MkM4ZVhlMk9SRnlaQ2N5c3prYUlaN1NGQ0Y2ZkszbE42NFovMHpCYVNrcEFY?=
 =?utf-8?B?Q2F1K3BWekE4SndEZXZHZjlzQVg0TER6TUV2ejE2RXNYdnIyWTBaODEyTWlI?=
 =?utf-8?B?bmtNb2RzVHNZYUFmM2RleGdkeEIwR3hvcFFsL0g5WUhqUFluUGVHVEJxZEtx?=
 =?utf-8?B?Nkhldk9mWDFPaUdCZW1yTDMxQmZrVTV4Z3plNGozTDNoTmFtcnFuNm5GdGhX?=
 =?utf-8?B?WjU3dEdVWW1DMGg3S3hnNjd1ZHVHVkJGcVh0MHNZZTFHZ2l3bXFOcUEyaStE?=
 =?utf-8?B?VG0yTWFieFhnNTNJY25zNzJjckxGeXJTa3djS3Vwd0lnYUpPcFkyaVZ2bkdO?=
 =?utf-8?B?TVhHdUp6SUx6Q2RhUXpXNG03ZDNHTEJDaTF6YXY0TVNNRWkya0tmTWtIN09L?=
 =?utf-8?B?bHVmL1VBUTJ6ck5mTVcyQlllRmdWOGxZbjhzRjd2bWt6d0tQemVDcVlnNlpG?=
 =?utf-8?Q?gbUzWiA6uj6hRoU8hEiW2f/92?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f329ae4e-45f9-4a65-da93-08db2559c3e9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 13:32:47.3819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFCm7OiXia5LYzVLk8I+YoLU17yMaS4pUwjqvoScHJIUBmBgABZVhpIN+GXlaj063YpQCu6hQzp3dsiwiVTAfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8802

On 15.03.2023 11:09, Luca Fancellu wrote:
>> On 15 Mar 2023, at 09:27, Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.03.2023 10:05, Luca Fancellu wrote:
>>> --- a/xen/include/public/arch-arm.h
>>> +++ b/xen/include/public/arch-arm.h
>>> @@ -304,6 +304,9 @@ struct xen_arch_domainconfig {
>>>     uint16_t tee_type;
>>>     /* IN */
>>>     uint32_t nr_spis;
>>> +    /* IN */
>>> +    uint16_t sve_vl_bits;
>>> +    uint16_t _pad1;
>>
>> Can register sizes be a non-power-of-2 in size?

From logic in later patches I infer the answer is "yes" here.

>> If not, by representing
>> the value here as log2(bits) the existing 8-bit padding field could be
>> used instead. Sadly, because of it not having been checked to be zero,
>> that wouldn't avoid ...
>>
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -21,7 +21,7 @@
>>> #include "hvm/save.h"
>>> #include "memory.h"
>>>
>>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
>>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
>>
>> ... the need for the bump here. Yet you want to avoid repeating that
>> mistake and hence check that the new padding field you introduce (if
>> the value needs to remain 16 bits wide) is zero on input.
> 
> Hi Jan,
> 
> Thank you for your suggestion, just to be sure we are on the same page:
> 
> I can store the vector length as VL/128, doing that I can use just 8 bits, so
> I can do this:
> 
> struct xen_arch_domainconfig {
> /* IN/OUT */
> uint8_t gic_version;
> /* IN */
> uint16_t tee_type;
> /* IN */
> uint8_t sve_vl_bits_enc;
> /* IN */
> uint32_t nr_spis;
> [...]
> 
> To take advantage of the existing not explicit padding.
> 
> Is that what you meant? 

Almost:

struct xen_arch_domainconfig {
/* IN/OUT */
uint8_t gic_version;
/* IN */
uint8_t sve_vl_bits_enc;
/* IN */
uint16_t tee_type;
/* IN */
uint32_t nr_spis;
[...]

I'm inclined to suggest to name the new field "sve_vl" only, with the
comment extended to clarify in what units the value is.

Jan

