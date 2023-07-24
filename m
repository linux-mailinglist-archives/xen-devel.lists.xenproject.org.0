Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526EC75ED13
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 10:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568463.887785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqb5-0005hD-Uv; Mon, 24 Jul 2023 08:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568463.887785; Mon, 24 Jul 2023 08:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqb5-0005fZ-Rz; Mon, 24 Jul 2023 08:07:15 +0000
Received: by outflank-mailman (input) for mailman id 568463;
 Mon, 24 Jul 2023 08:07:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNqb4-0005fT-AQ
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 08:07:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18961389-29f9-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 10:07:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 08:07:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 08:07:10 +0000
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
X-Inumbo-ID: 18961389-29f9-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4XSLXcfag/S7nKc2pemT7zBhapZvzToGC0T+aDY9Mpzb85b5sG5HGzt5VQO4KspObMoJy5LbLUQwhghsXApQYa8DBXS7mmqQv3/sICX1LFGQ8sDyy+SQT0Pba9vGbIcCiRc+XY0GSlAESenJQxHQAZ5pKkd+mdGFFH342s3oa5QbdCnol0bT14SOsKBL/aF0lhQR01UG4qpWFYfsIjqtDlsC9L5vy3hqdR3VX05ZmEZ3mtdVplxAEN790RzNDzGjXnY4nv3jL/2HBrBkCKh5e5nJKVkDPfINVdKrm0tEjP3vzeJ/0YAcie376vsN+fUwXnoeGn6FarnEb3gL1rBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjq2VSD2h9kYXAzD8CziPuoIQGKiMFT5SRWyLFznJUk=;
 b=ZhoncAcSatT5ujTPbnMh3ZfjMelm695JrId/mREHm1l/tZk8qgd6nVmlWTeu9rB1fDh8wl5kuqZgiIT03y02al52y30t+Bl6f4icOKFBaHKjii6b2aSagfNS1gozl4T/rIOQMFMM5wMQV15Lgdg/axYQdoYToBofrUTA7xIXHQnaormPS7VpV/jTTARz1lxDR9hiTDdWkMwgDTwYBzXmKvULW+kFoQ6p9h45adwqbvi/8n+iPF0bD7y892EtcSpmeCaTIExJs43urzf/AmzM8QTqLpXtj0Xs5/id6P2by+y0QXGrJAmZuSzPYXoz8ZW/UB4IXb6p8194cmQOBaFyyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjq2VSD2h9kYXAzD8CziPuoIQGKiMFT5SRWyLFznJUk=;
 b=tPMzY1JwxFoz8Xdj0UElcwwvpskhmooqAeq/dYWD+VatA+VelRkg0SQy4vclCLXCm2wfv0ma8HIWPtQaKL2hidF2xXkNZpupnAfuqycX/j0J/+upaKQ/X0YwDzvQcwFPgBnQavh6vn4JUXabyo18QZgsHwmEHCUjzmye07FB5mV8agHNVZogVfA+wYJIiImO6j9uhOZhdfWHKMTeGP5LL2e8rRkJgBpT9BH4gH/3KYUPDt8Tibfjtb0NRNwb8P2426mn+iVLObVGsMFAeSM83s/AF1FFPVfBnwDUAqkWiF+MqA/OdOcN4slTfZb3F5fuwZE4ghgM8lk32qR+TTDlfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00ee1297-f5d5-b51b-0039-4ae10668b0e3@suse.com>
Date: Mon, 24 Jul 2023 10:07:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] efi: mechanical renaming to address MISRA C:2012 Rule
 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <4da442b03ba783b4db0e56614bed43ce882a32ae.1689953085.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4da442b03ba783b4db0e56614bed43ce882a32ae.1689953085.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: ffda5129-60a1-46c6-99bc-08db8c1cfb52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VWSN8OWYPes1c7RyZR9DpKHuSAU30TofUg06cxxlJvlIAaYmPoSFbWw/jH1sdxBD/nlQMq04kEgYRFo1qaCdyVBhGclLAxPk3WyKI4/20/NMZs8G8pY0TM/hgclahqfQPYv7EpqiAWTH14pxXZwuAR7vBQWZIk/qzoUr9HWLsWm5xNihO/8cqG7IGNl6wy5JpVAYDHMWX2SXGXELeKC6ILcTyUvFYLswsZmzz+iccIoVCmXsIsWlSv5wD5rry8dunGts4ORJIBuxtB5I9aYQX/aSO95u9dn0U39UpUtB71MDfsfYnUVL2rbIwKmBwa1qif626uewVWzvUmIHsEvRLdnbwuhgT2Mp4U+rxQ0n+748Lkq6OgMLanS3DtvGDv9uHr2V+ZzHTZv0wU0gSRQA37+U8NSmmlm+L/V5j2WQvzVmwDqYu7S9ipEO+IGejbbncfZnlZfpTVI3JMnCtK1jI4xRU/sZwvZD4EN+cexZ3oXoDfIwUVKANcQj8swPHPxF0slZZk2NZ7UkL8K0/mP5GAgntvh8QCsrsgYR1C808tWKd6koN+vR48tVTa2vPixY1d3MhNy/Vqcm5p/HO1IhSL9BLGHwgwA3rwBo6evFtQDMVwa5r2QlKnQoW3mTh5W0S/PdA8LseSolQhC32eejbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199021)(6512007)(6486002)(478600001)(186003)(53546011)(2616005)(6506007)(26005)(2906002)(316002)(41300700001)(66556008)(66476007)(6916009)(4326008)(66946007)(5660300002)(8676002)(8936002)(38100700002)(36756003)(86362001)(31696002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R09SN25SYVRJTjBNenpZODYwMmxpNnFsdGRNUTdBeHRXUTFVcXBnNjN5OFAv?=
 =?utf-8?B?bldBcnprM3FXVG5RR0pwVTdGejhVYWdTbDhnd2FUaGtoV2N4R1VMUWZUa2xm?=
 =?utf-8?B?UjZUMXVCY0VhK1U4Wktjb0FIU3FtZ0p4L3pjbE1GdEJ6a0ZFZjQ5M1UzWFBy?=
 =?utf-8?B?aDBsVXlIaFBEeUdMRGlwUUozMzVNVUt2OVpqVVpyWjBuc2gyK2tuTUljL1Ri?=
 =?utf-8?B?ZkhGWFJ5OCs5RkNva2E0YXdwNlU0ZWE5VTFGUG9JWFNRbjJERWFGMzZWazZS?=
 =?utf-8?B?ak4zcUhCdDBadW1VVkl6K2dnRHc0TkNoNlBma1IrZGRoKzV3Q2ljNUtvM3Qx?=
 =?utf-8?B?d0ZMQ2pPZHcrSFk0ZDlQa2czRFhHY0czb3NaLyt1NUVyWDVWM2IyZW5nR3Rm?=
 =?utf-8?B?SzJRL3FCZmR3TFBRSFVxVGVDTUJ1NkpzbzZrMUpqazRKZ2IvOStVaTFibjNI?=
 =?utf-8?B?UWYrQnh5TEdJTnBoa24rNGljSzR4NjNQUCswc2wwSTJ1Njc1OUYyQ0FxckpB?=
 =?utf-8?B?VzBTQ1dQNHBCeHg5dzFwVFoxVlhPRVJRQkFrNDJScXdzdG1zdWo1c0ZlMlhZ?=
 =?utf-8?B?dENqRjE1QVhwNW4vV05Xa0ZmWk1BaVlkS3I2bkhOaUczSzJlQjMrS3duWXJw?=
 =?utf-8?B?cHNjZ1lPZXAybEduTUZXRGhMUFo0UHkzdTdaa0tWREp5bElLalVYK2pYY0Rp?=
 =?utf-8?B?Zkx1UVNSdWhtdGYyVTVkbHVCZnlHcHNPK0VhZFNFWTJZemNWTm4wN0x3ZVNw?=
 =?utf-8?B?OGxLcVN6WCt1WjNmdWxTWXlIWWFRSjd2RnBFa3dpdUxoN25ZWFg3WEx2L2No?=
 =?utf-8?B?c2xhaHRpZ0plUjdUZk1Wa2ZBcHJrb3hHRmRNZTJic1BIUVNvK3pENUlYOXVh?=
 =?utf-8?B?TTVmckQwSHZaK0RYbFB1LzJKMjNhWkJ4S1pKcUhzZFlzYUIzR1BQV2ZCTTQy?=
 =?utf-8?B?c0dKeXkrOTlYd1E1SkRPOHl1Z0NubnZmSkkxamxuWERaSlhkeUcxZ3Z5OWFi?=
 =?utf-8?B?VnkxakN4T2pDQjZPMTBnZVJ6Y3VPSUFXZ2szNzZsbWYrdlVZaDVRa3dGZ0pQ?=
 =?utf-8?B?b21aVmRENkJJODRyaWlqUnhQK2Y0c29DdjNYOGYyZWM0dVhzTUxnenJUN1BC?=
 =?utf-8?B?UjBKZVFoQi9CUXlQRHBTOFFpRVR5b1R4LzlVZ1BlQmZRNHpoQUs2TitpeW5Y?=
 =?utf-8?B?b04rSXFqOGl0WmVISngydnIxUDNzYmd2Rm8wWnFaREY2ZDhhRkRvM04ycWhR?=
 =?utf-8?B?bExTSWwzbnN4c01MNDN1S0p0Y2Zzb3I4OUJDekJNVFF3aW9MNmpZT01wR1pX?=
 =?utf-8?B?aUc3ZUtOR3dqblVJTi9vbE1VR2M5WkFRaWd6VldKOXprRWlldUFWSkhNSlBW?=
 =?utf-8?B?ZE1TdzJXbnVkenlUTzIrNE5LclZOc0FYbXdiSEREYTBWeXNEbTdJS3VrOTBC?=
 =?utf-8?B?TWMvWFExR2F6K0lJV040ZHB0NnJvc0FmNmMwYU83QktBRkVwa3dzeHB1Y0NK?=
 =?utf-8?B?MmkwNEpIdktiR1hiTDNSeTVZZkQvV05lZCs5VEN1cFVqQ0NzV2w0TXZPeEl4?=
 =?utf-8?B?L2ZtMmZ1ZjdpcGJ4YlNDeUhFeHZ2aW5aWkxvWktpc1VxcUwrZUJxR1EyRkh5?=
 =?utf-8?B?WE4zRENob3h3Qnlic0tOeHZKUFVGaCtUZmNTd29BTTdaakVUbFk5K2lPcmJI?=
 =?utf-8?B?L2dpNFpqVk5DcHdTN20zaTFVZFpkRktQNXMzVzlQTUNEZ2xDYS9La2MwMkk4?=
 =?utf-8?B?a29TL0orVzByZDJSU3RpY1VvVy9TQmoweVY0SW0wUDFyU2k2eXBZa0hzZjJv?=
 =?utf-8?B?cUhmWEVtRXVvaEJYaTBIQWlLT0ppMlU0eDBtNXlreUJuTGNsSDFSaUNGWFFt?=
 =?utf-8?B?RXh0bUlrYW9uVXA0bjAwNW5Id1ZTQlhVY3hDN1NKUno4U0Jrd2F6WUpvTzFW?=
 =?utf-8?B?OVgvTWtOZ1JMS3FSdkN4eWtKVGFVNXV0bklDMS9Va3NGTEJndXpFSkxhYSty?=
 =?utf-8?B?NmhNN2NRTU5wY0dxdjJHSGxURGFoamNZZE9veFdGNGRTckZ6UnBFdkhzNEYy?=
 =?utf-8?B?SHNGdjJZMUFyanZkeTB0dXVnRGJvazJBcTZUK1IzRVBsdTdST2RjeUpqS2k3?=
 =?utf-8?Q?c4kSIskRbR09kI/m2eZKNU1nq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffda5129-60a1-46c6-99bc-08db8c1cfb52
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 08:07:10.7593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpmNVjie5nl8uxhTQHA2LXVfgqhEDEFYR8KhW1wAFemZFqVW5U5I2ATqeVir9VCvhyBj4NfEY3xNTpCwe+zEbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131

On 21.07.2023 17:26, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The function parameters renamed in this patch are hiding a variable defined
> in an enclosing scope or a function identifier.

I think this sentence should be limited to the part which actually applies.

> The following rename is made:
> - s/cfg/config/
> to distinguish from the variable 'cfg', which is hidden by the parameter inside
> the modified functions.

Hmm. I have to admit that I don't like this. The two functions in question
always have "&cfg" passed to them. So using the same name is, well, kind of
intentional. If we really need to change the code, I guess we may want to
consider dropping the parameter and always-same arguments (albeit the
choice to have this parameter was also intentional).

Another route would be to truly generalize the parameters by naming them
"file", like other functions have it.

Jan

