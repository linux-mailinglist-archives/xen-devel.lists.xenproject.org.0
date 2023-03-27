Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0846CA96E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 17:44:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515341.798107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgp1U-0005zy-RI; Mon, 27 Mar 2023 15:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515341.798107; Mon, 27 Mar 2023 15:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgp1U-0005wc-Nh; Mon, 27 Mar 2023 15:44:40 +0000
Received: by outflank-mailman (input) for mailman id 515341;
 Mon, 27 Mar 2023 15:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pgp1S-0005vZ-Hp
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 15:44:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46a51207-ccb6-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 17:44:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9940.eurprd04.prod.outlook.com (2603:10a6:10:4c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 15:44:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.029; Mon, 27 Mar 2023
 15:44:34 +0000
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
X-Inumbo-ID: 46a51207-ccb6-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUDEn1a5YAt2dutlkrYueKqz0uWRlVLlnDurBO1aFkCKbLQqx+05w5OHZRfXbgARw0WNsHwFy+URSn82J19bfINNDKzZPQeaTpwpPBr6oRA//pXfM5TK9ZRShDtddKtBtFILp7Dexz/NCJQ1qUHKv0cPJLKAQKZxCrC35RZQtkOwfKPY3kZYzDMaZpqQAedG3ubHhIobh77cHsAz2RdSGVDafJEb+5TuVQgmFv6MNM7DhicnjJPBZl9LnAZthA5nlRQp6ZuCHKS61+WNZigqyhMt36kt94/CLmFDbK5X0qHstSoJlA6WiTDeqBVttSnxEOs02tVgWPTyjyO5d/7Kaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Hl8whAR19XTlHICuHSxgug3RMH8J2TDN9COUiVGU9g=;
 b=aEKrf80pfMqeG7b2fQ9ZJWkXBuymYYR1OyQifBgcaGsWd0BWi0b7Z9flHBI1i4ckvE9PYGB/G8y0nyK2TI2DaGz6IhD8qXiYC/pIr5vGmGEWusOqMvydVnkemPKpOd6VeI11sBG6PV0YrwdoSW2UTHfyZREU3r7yBP07qLIruVfcoS/mBogmLqBFe4QJNDZYZOxTsyxa1h6StHQX9PLNm3OZs6VPyM+rUYrSeGafZp08URTeA3SSH+JmLXBR0KGdyObcpBEQVOd/kmOIzdRXW+RcT2KsrT/RlgwmCyBQq9tnFGO4ictb2Uy9nyyfuj4JLY1C81lFjVlhqSdAqdsNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Hl8whAR19XTlHICuHSxgug3RMH8J2TDN9COUiVGU9g=;
 b=hiJfZzP0sesgVjij05SvWev+f+/k056tC5rI4npVSoy1m/RYM9cB9PEuGGf6lajtgpici9bUa0t6enz5Xz7OEvTS7kC9T79wsUJbGhsrj/0p1S5MjWinKDnAX322MPdQ7zzqo5Znl71OLh2wrO3w6hRoCtB+LSBfacX6jCdnrOfxwYCv4TuaHlohOHDEDzV9dA/tYqQv4rbQ+3HLHUE4vRRPRAEtmifXMg5fcJskS4orWfHIKsjDpBKH/Oca9ur/2MCRtetaZcy0vYeWk4GelkJL2cL0h97A45nfaVYTy4SkSsSGkIGIIG9CemDpjDBvUC5PBfH1EwF4yyo/3NCRTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f70f6136-7a4d-e77a-d73d-5b5dbbfd88da@suse.com>
Date: Mon, 27 Mar 2023 17:44:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4] x86: detect CMOS aliasing on ports other than
 0x70/0x71
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
 <ZBxm+7/ldyHclXwc@Air-de-Roger>
Content-Language: en-US
In-Reply-To: <ZBxm+7/ldyHclXwc@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4fec11-52be-4f81-7371-08db2eda2a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ei+c/4xNBGRKrVQDn5zZY00yTas+YuOG4JxbW3Hcx8qvZwWF5qJLrdJtoG/JHvnf/V7t2xgtUPiJO0MWKwKfv5IC5cVwVpsCA8bKRITAmha2CgQImeVq7fLm714TuNh2J9rY17yJyv2HcIrZXdlTRw4FVHaea7qTHo3xfBkec2NsR1RmwBI92yKjKkRZf9+QL9qoJAtrZb1fIDp/AZvmOIiiaP2aPXTc8uvAmDfF8et6iMJ0hxuMHMidEBmfttITY89hyMDBPjUeAs7+mBmPQ0+XbPgUc/mmlRj+CMmrpmsQzJPvn3ndTelwykuWdPcDoCoiFzwYaArtOT/LRwPWOXTUy+DxYf6QkM96LgfAcPtdVjx980ZlSHtYlUimpUW5lqWKVlQnrL8sb9JH3PJOc5BRatYDlJ172rndAlAxieAH3IzzM6sZ4gZB6dnWssGwZU4JDSY3jlkQZWKDtk+J2tQiQphA1AsY5c6MhxgHcYKnvWYjz3v+2AcVJzJLrijcvkOd36wZwX/jQdeEFKNCD5jc7Ou7X8qxelMQgxBCaLn1wMtMSeB5JkjZWb6+/Cx95f3RKNXyFd8nkUQVSGgPwLh1NnNUSttOLaiOB63Ntsaky8jSGjsYwxY4dF7Lx6NMfjiLhgGHQHDKOfctsgXIOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(31696002)(36756003)(86362001)(38100700002)(2906002)(31686004)(478600001)(6486002)(83380400001)(2616005)(26005)(6506007)(6512007)(6916009)(66556008)(66946007)(54906003)(4326008)(316002)(8676002)(66476007)(186003)(53546011)(5660300002)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3VpS3NCVnViKzZKT3RyNGY1MkxKQUc1NHZIRGRJSDFEdlFBYm1FNC9oQWpU?=
 =?utf-8?B?VmlXS3hyUzdwa3Fra01BcU1hOEpCbEpweTRWaGNwOE1DRGUxMDd3KzgyYklt?=
 =?utf-8?B?TVgwL1BnbytBMkIzSi8yQTRYQzYxMVJWR0c0eWhoWDR0SXp1YVZIaFhUQ29n?=
 =?utf-8?B?YzMyR0VSenhhaHZudW9YeHd5U3lOclF4cTFnY0FtMjRqVDd1a3lENVh5amt1?=
 =?utf-8?B?T3oyTWp6aENsMzdtbXpZelQyQk5Jem1LZFNpcndXNHA1RWJwREo3VjkzTll0?=
 =?utf-8?B?aGpXVTI3b3Zib0Fjc2s1TWU0VTVXclR2bmVyUm1wUUtPa3ZNWjZoYzArVTk3?=
 =?utf-8?B?d3hQQ2xwSld4Y3pUc2ZXWnM0TU14Z1hRUzZCVHhBbHhTU21pTGdGYW84VEVp?=
 =?utf-8?B?ODdJdnNhUVBBSEl5eHNRQ2IvcGtiWjdqa3M5SWlqK2ZQTlhEd2FGeGo1K1h1?=
 =?utf-8?B?eG5VTGlQbnFtbytUdkh0eW1EUXJ1UU1YZDZZL3RSRWRTTGs0bnFYeVBwUGZF?=
 =?utf-8?B?MnV3c2VxYWJWdFpUYVpieG9ZNnlidDZjQnR4UWdHcDVsMWRpMlRnQ0tyeTVD?=
 =?utf-8?B?N0U2a3Z0VnRVb3h2ZG1BZWdoa0pVLytISEV1d1JucmdVc3YxZ0phRk9QanNY?=
 =?utf-8?B?Z2xBQlpOQmRmSTF2YkZ3eXJ0aURkK2tsTG5YeFNoU0JHeTVkazFNYko4K1pp?=
 =?utf-8?B?dzQwZ0VDcXZ3WU13eUU4cG1GYjExdUMxRWdycmlqQW5rMGFIQTV6cW1tUmtC?=
 =?utf-8?B?b3U3ajU1T2J1T3lobFpFRzAvL3FnRHVqQ1F1eFZIcWlLY0xmUXpEaHlJZHhI?=
 =?utf-8?B?V0Y3OGYvSFo3RmRxR3hRT3BYc0hEOC80d1pBd3lvTUhPSVdYWGsvYis0WWU3?=
 =?utf-8?B?dVZaZm16bDZLQ1JXZ01kMFlpUStTU1M3dm4rdGFnODJWczlFUGFWZ0VocXln?=
 =?utf-8?B?c2pmbnFuRmVvY25EMTI2dzBhMHFWTVZWb1d1NlYyVGhLT0d3NTlpaFZWTjF2?=
 =?utf-8?B?REV0RXFIRzcxNXJLV3RCSWJtUjBORWxVOFk3TjRacmhBSnR2dllEUTJQRDhw?=
 =?utf-8?B?UGpDSi9YRVBqYkgxdStsS3dZbUtESWNGcERzN1hxVmNlNjRTTXF5aFdsV3I1?=
 =?utf-8?B?aldMWGl1NW10ejI4bFBmV3RFUmtWK0dEalR4b01vRWpLU2p2NzZEVmFwVkRV?=
 =?utf-8?B?YzdYaTdwNlZrMzF3U3Jac2YrZVFtSndhd1Y0b2lVcWxicGh1VS9MNlM4VFBR?=
 =?utf-8?B?TktpRVF3VTdtZk5HTlc1UmtiQStEaGEzdlNlVlo4S1NHQkY4SEhuNnFSVTFk?=
 =?utf-8?B?aXBDQVpSMmUyMnVVUjRNRFJHUW82V1NaMk1OOGpIYzMrREVZQm4wRU9VbzMy?=
 =?utf-8?B?ZXRRejZhVVhGYTRxdjJmL0tjUFpYVGE2cVNsU2Z4QVp1cWVZTXlBL0l3ZjlN?=
 =?utf-8?B?SkU4L2xCV0p6TVhyOEFQc1pqYVRWMHp1bC9KR052U0JtcTZsaEp4T1pPcDBR?=
 =?utf-8?B?akRkeXMzd045b2YyMW1CSDhjcmNDTXpYblVSZHhobUxwRDVRVmYvUWdCSjZy?=
 =?utf-8?B?UHRPaUNuazg2K3J4cDk5VDBxS3VxRStLa0FpVUdFVk1vQWdaWThQL1d0bDI1?=
 =?utf-8?B?NDhKTURxWE5aMVlvbVpSalB1L2FWeWtpeUQvT3RoNkgvZ2pwNGFCMWxHa2pZ?=
 =?utf-8?B?eS9EalNKR1FHUkNYK0dEaXhiN1NDUnVZcGN0M255cHVOWVFqLzZDL0pBaFVJ?=
 =?utf-8?B?Q2d3Nm5JSm1ybEVtUzNyeDFkNUhYRHUxdWVtMDlIV3F3aW5vMXFDSkxZZWh2?=
 =?utf-8?B?Qm56THpET0hNL1UrWHhDNjAremI4cnNyTS9DUGxTazFveWluVFMyU0ZITzJn?=
 =?utf-8?B?bUl4dHdOUE00My9DajNmaVlhd2dyUmVhajZZaG16STBJYXA1c1MvRWNoRzVj?=
 =?utf-8?B?dk9MOUdVRXprQXg3dTZPem1iODY2bFBnRVErZDVSbGlLWmhya0ZUc2xob0hh?=
 =?utf-8?B?OWViV01zYVJZYlFzTkV2TGZZKzliL0dsN3R4d2NPM1dUelEyTDFmek5SMkJi?=
 =?utf-8?B?SmdqSUlESmtHZGNiVWxONCtJTTJralk3cW1YOFVVSmEzZjdOb25UZU5VTkRT?=
 =?utf-8?Q?2HseyFWou1Ek2ohseoMKhTC7r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4fec11-52be-4f81-7371-08db2eda2a27
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 15:44:34.9398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzbPXTep8m+gCRd3GvPJu0WmQWJ3D5udr6n9lwZWgWd+CP7B1Xa4t0UW3t7qVb/+JsFAT1/01FaIkohqUuhhKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9940

On 23.03.2023 15:49, Roger Pau Monné wrote:
> On Mon, Mar 20, 2023 at 09:32:26AM +0100, Jan Beulich wrote:
>> @@ -1249,6 +1252,80 @@ static unsigned long get_cmos_time(void)
>>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
>>  }
>>  
>> +static unsigned int __ro_after_init cmos_alias_mask;
>> +
>> +static int __init cf_check probe_cmos_alias(void)
>> +{
>> +    unsigned int i, offs;
>> +
>> +    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
>> +        return 0;
>> +
>> +    for ( offs = 2; offs < 8; offs <<= 1 )
>> +    {
>> +        bool read = true;
> 
> You can limit the scope of i to the inner for loop.
> 
>> +
>> +        for ( i = RTC_REG_D + 1; i < 0x80; ++i )
>> +        {
>> +            uint8_t normal, alt;
>> +            unsigned long flags;
>> +
>> +            if ( i == acpi_gbl_FADT.century )
>> +                continue;
>> +
>> +            spin_lock_irqsave(&rtc_lock, flags);
>> +
>> +            normal = CMOS_READ(i);
>> +            if ( inb(RTC_PORT(offs)) != i )
>> +                read = false;
>> +
>> +            alt = inb(RTC_PORT(offs + 1));
>> +
>> +            spin_unlock_irqrestore(&rtc_lock, flags);
>> +
>> +            if ( normal != alt )
>> +                break;
>> +
>> +            process_pending_softirqs();
> 
> You adding a call to process pending softirqs for every loop
> iteration makes me wonder how long is each of those accesses expected
> to take, since we could be performing a lot of them (0x80 * 3).
> 
> I don't think so, but there can not be any side effects from reading
> from the CMOS RAM I would assume, even for cases where the CMOS ports
> are not aliases?
> 
> I would assume ports to be either aliased to the CMOS, or otherwise
> reserved.  What makes me wonder if it wouldn't be simpler to just
> passthough accesses to all the possible CMOS alias ports.

I'm afraid this assumption doesn't hold, as can be seen from the ICH10
datasheet that I did point you at the other day. There ports 72/73
serve a purpose different from ports 70/71 (and their aliases at 74/75).
Unless (as the datasheet calls it) U128E is clear (wherever that bit
lives), in which case 72/73 (and 76/77) will also be aliases of 70/71.
So we won't get away without probing, and if we deem probing too risky,
then all I can do is drop this patch.

Jan

