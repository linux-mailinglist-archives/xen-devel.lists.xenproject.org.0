Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49603283B9
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 17:26:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91787.173181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlNi-00027e-5w; Mon, 01 Mar 2021 16:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91787.173181; Mon, 01 Mar 2021 16:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlNi-00027F-2h; Mon, 01 Mar 2021 16:26:50 +0000
Received: by outflank-mailman (input) for mailman id 91787;
 Mon, 01 Mar 2021 16:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju5b=H7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lGlNh-00027A-6U
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:26:49 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29a7500d-690f-46ef-b0bb-b8f1b6a6aed0;
 Mon, 01 Mar 2021 16:26:47 +0000 (UTC)
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
X-Inumbo-ID: 29a7500d-690f-46ef-b0bb-b8f1b6a6aed0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614616007;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sQBsmoyaJPX0GelAMgQC7RBiGk65h0W2uJ5xFsBdwzM=;
  b=bn7i23AGhEMhCwORlh12/lzxFxyWmyioD3dnyBx5ePTN1sz3UyuR18hs
   e6LGs65YiTVPJ/vHpIwaGLweNTvocHw2z1yEfxNUg29uTf9zDNZJAPr//
   jpT+TXstuYNujYYtZLjONNSXtEf9SfQwhBER6VS+1/Ky4Ndf2rLXHwLbR
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: a5vYofSjpJ5Kr8pJyeXZLGME0Aah/w/McgYx82Qqw2XJYPbyEq5UvpBADRj49I1oJcuvxT85RQ
 pR/xNyD2+rNssyJO5oOTUZcH1fO74DS5npngQe/NgsgdHyMyIjSZr1nyyCDbFt0fXM591udQcA
 8YnyPv3clOtPUItOsbooEJwh/wDj9BNlgyXABGXOgy86QSi0zMPdcIcxVOrbgOKmAZmu4jbZD/
 Ll1ql8Cqm99mPDuReDCfOA27kIcGVg7cJVBAyymP77HPQ8htuYX9118BqdSTujWsXqOtTBfoUZ
 9/A=
X-SBRS: 5.2
X-MesageID: 38446660
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38446660"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5ly2dDnpkZS+Xi0HwkPWdEs6N+j+9Yjs6Z/AsprvXgLaSoVcUYp2ARGDuVuSprg51RBip9hIIw7fyoZwnltCzKz7b9rDNwEKl01XqtApLdji278sz9oJodnw2OQI1/4c+u57Sa9aCTak3grKDVAez5Ykv2kgTYapATrw4jsHvnrnVcQXVxhOKaarpJ7TXg2X5Ylm+68/dhvqB4Q3oxpHBjG9cH0Kjvo3MOPlDDY3GuZaBosZpCPeNlZ75dEz5B5+v8yym8/7ydv3Eipb2xMf7sWKJvUVgYn7n+Sy4HrFJjWU4aAgif63mCDCYvPDZZiwjjv0ZdhowEq8XJjidpeyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=munAJo8p+PPZUKRMAFwJ9Q9tctpNjFJNpa9dCymRVNM=;
 b=XQGit4wfJMWRyzr40OKE2jzkuaWRXQhX4maEHJrjlbubzxGYnEJt4AP3640fcGBe4nqJcPzguCi1f5ANsluHgVwsVb6zF/tkN9WXrcTobsRcdKH5Vlmds/l8RBTg8TYf/C5xke8vbvf09qfRBkQjmxxC0GaA5hu21clED+ECoVrDYtc1R9DW6/As/bd9jeSVJnCaQ6ls7HRsOzSI37EWEYFhkpxkD3uI8NvaR5ealDc0Ao0TI7R9owZpWwIH76NRh2Z7XTDs1GqOFOZTWODt/6gNU+5Pb4wPWJSPHGoKNn2xt/V87nDijsjnS4A8ZrlKFcspMjLVeHXVgAAEiByCkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=munAJo8p+PPZUKRMAFwJ9Q9tctpNjFJNpa9dCymRVNM=;
 b=VpGiYvRzetxgEpB+dllWK+dENzFtCuktQDw+MrpYfVz5GN3dV8MOyMxJDsiUUSeobZFCJZLYLj8GuP1CwIO385vSzQrhzHS5/q0ko44PmrKX2uANIa/O2MZZDJy+IHwSaq5qvoW3e0bA4xgtCUO443P955P1K4R9WGlfaSXpn9k=
Subject: Re: [PATCH 1/3] tools/hvmloader: Drop machelf include as well
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
References: <20210225203010.11378-1-andrew.cooper3@citrix.com>
 <20210225203010.11378-2-andrew.cooper3@citrix.com>
 <24637.4969.80009.849868@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7ff076d2-3e73-4326-1bc8-ed5efd37c937@citrix.com>
Date: Mon, 1 Mar 2021 16:26:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <24637.4969.80009.849868@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce33a691-8d5c-4d5d-76f3-08d8dccecb18
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB55844148DCACCD119117437CBA9A9@SJ0PR03MB5584.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RPAkh4OkF/hGFDmfSYZz4QbHhWUK70EWCRCuUEDTUsIeokgidk8Md32GpUveIlIItvsSWhIevHxJid8YiGGupj77pF0wLpShysk2W++FD89U2qzDoQVpi0OxiqAGdXGvLGFuErnMDLGy4ZkckxUHjb+FAW2f+7Wzylpq0wh9NnUr6Fl3P9ZDfWBNo0OWa+HM33d4EEU4XyrhpPRGCm6Yzqo0AZQbB8UuIOHRSTmDE2Ib9uwJx582GkDiaDOfvhWiHPk73WSuXI+h8lV35wNvuT04ev5m76s/vqJ/7WQyV2GpKaFH4zl5lnPPa6c762uNcYuMVe01h2HuHS8SPnOQ3YnOLkuVNhbEmLEOY53H0DvJk2iTFSRonByqhEVZng06VXwBd9PK2WHraM84G8EIFY1G84862S5hwWEK40pEkpwVkhJBrBnQrKCVx6xPGZM25vOqANZGaFn5X8pSWlO+SM/hYAJ/uktDpDCgDGjzeuvuyhe/gXnkmgsHkTSJH/T762wlFsa8SNcvcny15EWCWndNhAxM5eA/h3TnQEoH1kRCLS96Wg38NcPtl2gwpM8yLa8pAxRKe86sYZLGxHxOP/JXkjoPk79okf3LQL0m4zY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(31696002)(2616005)(956004)(316002)(8936002)(6916009)(6486002)(54906003)(86362001)(8676002)(16576012)(2906002)(83380400001)(31686004)(4744005)(5660300002)(478600001)(16526019)(26005)(186003)(53546011)(66476007)(6666004)(66556008)(66946007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T1NCcll4MjlCcnhoYXRCWkFqREZWUTNnL21XbmdXbjNpR2NaeGxkRVRFZGhI?=
 =?utf-8?B?V3ZQb1hQVDlqK3owRE5udy8ySk5LYndUdmY1MEtGUEhpaXdzVUVCWUlXNE03?=
 =?utf-8?B?QlB1MFVLMUZ2a1RkV0xoZW11NkoybjdQbndTQ2cwV3hodjdGQzNNNXpWdU9y?=
 =?utf-8?B?WENCZjNNZDRic1VoNjRwRWFjMXE1aWhFUFFSQjN2YVBWTEMwVURwOTBsSFZ3?=
 =?utf-8?B?Q2RBOGsxZkdGUGVqbVdpeFRNaHIxVm1HK1kwUURWUGZxdDYzcDVaa3RmRUIw?=
 =?utf-8?B?dnJucTBQMEI2NDFaQTByYXVwL0M5QXhzajgxeWxCOFdqZGlxc2pGTzVtRWdF?=
 =?utf-8?B?bzExSXdTcyt0V1g5TVBqNUUzSk81WG1ndm52ZFRWSFFnMWM5V0l2bFdURmZ6?=
 =?utf-8?B?d0xBMHVLY05QTTgyby84aE5Bb3pETVE1ek8yVjBleWpySjNUbFNWaTUrekM4?=
 =?utf-8?B?Vmd6ZDFUanVSYlp5dzJQMStXeEoxWnBoVVY5YmZwMGRDSkxkY1hxTFVieDNj?=
 =?utf-8?B?c2NPZXBiRTBHT2hWTmpuNGRYN1ZqSElwS3RPZzd5SXZUVDVlczZpTjc3eUE4?=
 =?utf-8?B?amFOTTBXcm0wMndqK0FxYjVKa2k0YWhoRmVWamtEZ3JtVFVqMFdTRUh0cGdN?=
 =?utf-8?B?cVplTXFmbExiU1kyYjdLWVg0bTFIcmJmR3NmemwrbEFHS0JhMlhualRVWVJH?=
 =?utf-8?B?Q0FXVWU3WVBtSmZaNHBrZC9aZ1ZETCtUMXNGVUswaGFUWEVqRjhIOEFNUENr?=
 =?utf-8?B?WW5wTmUxZFV1K0tlaXlQUzB0ek52aklsV0JnMXFDMnBxV1ZZQWowMWw2YXZU?=
 =?utf-8?B?Z3cxZTBoTlZibEtzQUhCa2FPR0JzZ2dJd0RQclhXWkpyQzhubjZmbFBzVFBs?=
 =?utf-8?B?VVhVdHJha0I2SUdMZDhmL1QrYjAvVnIramVZQkpLTFE1VWprTG9rcUN2Z0h4?=
 =?utf-8?B?NTdZSUlVQVFGblN6UkFGZUMwRXQzQXoveWdwMUVNY3doZVFOMmExOFZZM0dr?=
 =?utf-8?B?OEhSRHJkMS82bUpnbG9xeTIvNVlhdFpkZitPd3NqSU1oWWVWbFBmSThBUEpH?=
 =?utf-8?B?U0M1cDMwR0R2eDhuMzAweXBNTjJDbnJZOHVjY2FCYUoxcng2akF6ako3UTZt?=
 =?utf-8?B?UGJRQzNvc28xWm9JOGU1Z1pmK1dZQ25uc2o3dlpSSjVFMmo2MmZNeStnZ3Br?=
 =?utf-8?B?TnpINlZENFJFY1dpYkduNFkrL3pwTGxJNHY0OU44bkE4RmFKMjF5RS9NWnpL?=
 =?utf-8?B?UVo1cGhWNWQwU3k1MTZPRyszRWlEZWtSSFZpNG5EbFNRNm5GTVlFNnU4UGZm?=
 =?utf-8?B?NXUvNk9qazliOHk4RWhVcnN2QXUvVW1FYkxxM1grU1NRSk1Ic0VXYTFuQWdi?=
 =?utf-8?B?MGJoMW1QUThVbjBHRkh0RHJyeU9XVUF5TjR5Z0R1TUVlYUcxR0V1YUVvVmVQ?=
 =?utf-8?B?WnNWb08welhWUGI4WU1HYkppc29RT1plU2lUdWgxT2dkcnZKQ0V3aE83NEUy?=
 =?utf-8?B?VFQvK2dzQ2hnbEpKSXdIY3hSaWYwRk40QUZRUFBLWnpQRFdtQTJjZ2hvV3Vx?=
 =?utf-8?B?MEZNc2Y2azJ4YUx1M0VPbzBZcXljNmdaWnBUK3BwcGdNVDFPT3VjNlJiMXhq?=
 =?utf-8?B?dE4rUlFXWlViS3V3TWlTMVdUaG5JSHFub2RrNm0zc05ZaUxpTmVoblBFcUE5?=
 =?utf-8?B?REFrSlV6azNJMVA2N0lwWWk1NmUvekRJY2F6OGxMWEpnelcyMjFCN1dXUjJW?=
 =?utf-8?Q?L5EooSdYqbo7ik6h/BvlOMoBNDDD7JaFT9M6ae4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce33a691-8d5c-4d5d-76f3-08d8dccecb18
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 16:26:40.3476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jT33Ytd5vjUkg6ZGiwyTbzf8VU9JSJZrFjzEaYfPG00K8FN39F7Di+zS45Dj32xbc1FBICCCvY9Nq7TbDmnNIzVcvCn97etNVHoHZExF7L4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5584
X-OriginatorOrg: citrix.com

On 01/03/2021 16:16, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH 1/3] tools/hvmloader: Drop machelf include as well"):
>> The logic behind switching to elfstructs applies to sun builds as well.
>>
>> Fixes: 81b2b328a2 ("hvmloader: use Xen private header for elf structs")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I would have preferred this patch to come after the one that is
> actually justified for 4.15, so that it could be held off to after
> 4.15.  After all I see no substantive reason why this should get a
> freeze exception.

It is a bugfix to a very recent patch which already already got a
release ack.

If this doesn't get an ack, then 81b2b328a2 should be reverted.  (Except
obviously that would be a bad move.)

>
> However, it looks fine based on code review and I don't want to add
> risk by asking you to transpose the two patches, so:
>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks.

~Andrew

