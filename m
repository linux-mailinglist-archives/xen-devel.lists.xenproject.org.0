Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F3B3FD4EE
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 10:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176075.320490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLLIk-0006Uu-HZ; Wed, 01 Sep 2021 08:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176075.320490; Wed, 01 Sep 2021 08:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLLIk-0006SJ-EJ; Wed, 01 Sep 2021 08:08:54 +0000
Received: by outflank-mailman (input) for mailman id 176075;
 Wed, 01 Sep 2021 08:08:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLLIi-0006SD-Gd
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 08:08:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6da4e3e-0afb-11ec-adb6-12813bfff9fa;
 Wed, 01 Sep 2021 08:08:50 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-1ZAPm3CeNW-nITZxRMk4-A-1; Wed, 01 Sep 2021 10:08:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 08:08:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 08:08:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0P190CA0019.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 08:08:46 +0000
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
X-Inumbo-ID: d6da4e3e-0afb-11ec-adb6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630483729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Br8yhggrtkI50zpoT8ExDWcF1KSQhL1o7JlLr+hMIpo=;
	b=DGttOVKjp+4XjuuNSpPjOTAQxrvA+KmbR3umxmOdD1UuMPKuMzY6SSuYoqYVW/7WYojkVt
	iRM2EWJf4a//bUT7jyFfAA0nliIaomYoQSbY3IIgy/2N4KVjGTFEEIpRjKNbccUx11lPdG
	SO1SQp0wGbKN+PfXcFQvUoaWaHN0zRc=
X-MC-Unique: 1ZAPm3CeNW-nITZxRMk4-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XK0kMNcnc8IIDbFp4NSqXfEuVXtBJbqr/l3V38eAN/6vjabGZfaA9x/ag1T1ffaYMp0oy6FZdsCU6tBFrURqL4pBAy/6AUimlcx8QGRpNCNwID2xgOLb4eDaExFETZsMRD6AzUa0wgbTeByrzmZAHlFGZrignhoYoXCjcKtYH8lOVkMpUkw9gEgxdfi4u3sCos84cJw3hc8N30ABhI3RhQso+t6X3Qg1eK2Ob1UrmymdPahs+vmvv+NweA13sz5Y/K7E/k8vwZIc/LqSG/OiukZiutaXRPt/n60HeNLevVwU7B3s0kvrfIqTFpTo5vPzZThRM68wnUtdu/wbpoIr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Br8yhggrtkI50zpoT8ExDWcF1KSQhL1o7JlLr+hMIpo=;
 b=PmhZhWD3JJ7+0BKLmeRO0TmzNX6ZRSbgKvQWMhMoe39WeH93upKIRYG7BMdccfF6kLYEj822vqtAZ/5r/SLzgLUvWcLGaFpymfKcoiUf3Hj3K6MLmvfqfjTy3TJEK2XwKtqis3U1TNs3Mb4qNetzvvPuh5MgbdcbHNqoGj/hyM+mkvyeGDSK9lFMsfsotZLalkT0jvmurKg/pJWRglGLIVgcKlNG7p+OybW1QA9xqYX4VQrh9WXiAmXs030nCK5XhqPLD0yhqqZXlhnL6ODtASPSW8yqmY/7oR+ibRxjmSOl98i2TWcuRKuD706f2IDyImfvjxVTBd5828ti8j0oug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
 <ad1e33b5-d729-2680-7f9f-aa875c2d9cfa@citrix.com>
 <f684e203-9967-8653-d59f-ad11f5070aef@suse.com>
 <7f56c625-eee6-31c4-2d6f-bd7334867d83@citrix.com>
 <5d69d4c0-7a04-c3da-f971-616363c6d63d@suse.com>
Message-ID: <c48dd5c9-bd88-9ae8-856b-4049e26bc099@suse.com>
Date: Wed, 1 Sep 2021 10:08:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5d69d4c0-7a04-c3da-f971-616363c6d63d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88028a76-1fa9-4d90-1d36-08d96d1fb945
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7149A284F0F1FD5E77EA6B85B3CD9@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JlH//v+JTrd3af7F/8tMwKHhQacrJPN3kOQTbRdlylOu55HDqpqysai6Ybzaa6lf5Vv8hjFuW9XoSf26lVEv0O2Osrwt5QxyLuRRflMwR7GG2ZTxSo37cBHOjKTkaEbpfzsX94jzjt2+MeqkNgqYXRqHZuJBF+TpPrDAi7OaFrKvYTC3xjK2BeOJ+Qy4sPP3i7iDoOEJHIxzNIuk1plsrXypDHMwtJQNdAsqfOjsY2e1FVRFCksKbEdHMIbPl4tz5shnA58gwcUUSbH/I5dcp6HZBNTUfg2BMzuzmbdKmwx+w8l/jPaaQu0eah8gkbRriLs8qUWyvcjlaKJ1UnQcQKKP+d0hQbTAweSwJnbFxqjii/w1L4Bp9ZpAo16gPtH631/NtX5P2j/24Ll4QyrjTqjC8ExqhrfM/qh680s4OyMXsWkQ61PN2Aavfz3guhCKkIau3Uog5YASwuzREWLRj4nyPgJmlrA4gb8ntwSr8qC1FTGGbgp5CJkmDQ0VFGeYDYFGXnfOt2urC6SwBGGKMXNv5p1CtY1X7vactlE5L0nRsqRJ7WkaEjD8re+4Nb/3N9gP+uJqZjefbfhXy9MIWNjf13jEbl8MikzJSqlMbquU8mNh9qsUwPR+k9siA3vyH3J9P/PUxZP7+ylx+GRcyCXm/e+wbtB1QKniMFG3X10EvwjQoXneC7QbiM236uJTVPiabvnfPb88ujeFV5NtUZcdsYTfmup1XVCgkBdB5c8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(83380400001)(8936002)(66946007)(26005)(186003)(53546011)(316002)(16576012)(508600001)(6916009)(4326008)(2906002)(5660300002)(36756003)(2616005)(956004)(86362001)(6486002)(54906003)(31696002)(31686004)(8676002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0xIU0k3WDNUdU1ETi92bW40U2hJZFduKy9Zc2R6QVk1ajd4UmQyWFV0UEhK?=
 =?utf-8?B?MnZGVWRLblRjMUM3bGxuMUlYeU53SFllbnMwWFVsNjI2NjR1bmsveFp3b3Mv?=
 =?utf-8?B?bS9MYzlUS2krZzFuVlJGZlJybC81bHBTWHBtS01weVNOLzdvMDlJNWMramFW?=
 =?utf-8?B?OFFWR0FrZ0o0b1lqZWNWK1M4OVRCa0VzYWxFV0ZCQ0pNRjF4L1pPZGoxWnY0?=
 =?utf-8?B?VGNNSlFwYUJVTThKN0NtVzNDeUZZa2RRN3pFK3MwNis1aGovYnlFcjJVMGZS?=
 =?utf-8?B?YS96bHBqUlRGV0dnNlpFMm9vVEVmMDZhaWYxb0VadTFydmN6a0t6VVN5N1Vi?=
 =?utf-8?B?ZDRvaEM2bmt1RU9OclhMb2JTWkFsUGxLN0JtTittNTZ4WEF2dE5YWlBoQUpR?=
 =?utf-8?B?bTVzUWZBNVViWXZUTmQzb2xoMUN6b1IwNzVVeUR4aHkvMTd2N2RRVTZXYlhI?=
 =?utf-8?B?MzJjbmlINkd6Z2FhOWVEbkZSKzhxRW85YTBkM3ZTYzF1cDFteFd2aFlQaGxE?=
 =?utf-8?B?K1l0eGp2aEowMllVbVZzMDZjMkVKNkFnSjdrUGV1aEdaaTVNNFJHVGxZOE00?=
 =?utf-8?B?dWtQWDgxNzNMSjh2UTN6K2srdG9ZUFFEK1NRUU1zcWJ3TjNXa1gzeVlMV0g0?=
 =?utf-8?B?S3VRSm90RWlSU0swRGQxdTJBZGtzb01odjk1WTFKRWZETnUrNVBydUhhKzNH?=
 =?utf-8?B?VEZVMzk3NzV6ZktIQlBIWDhFMVdVV3BiOEhyNGV5WGpzbURTN0RJQU80Y3NF?=
 =?utf-8?B?MHRuMVhybEpNLzNZUlBPbzRYMmdSWnpOUmJ3UUZMdTMvK0NDZ013RW4wVHV6?=
 =?utf-8?B?SnUxSnZGeTZMQmtSVnhYS2pnTTkxaEg5SEJaRzU3b3hLR0RRampZTW5GUWZj?=
 =?utf-8?B?SXFwR2VrbDhRaERiazJuSGdMUjNrR1JDQmRjTG9PWFkwdVhuWnBSRmd0b0Ru?=
 =?utf-8?B?Qnh5akJNMEhLQTRBdkRla1RFL05IMUcwM0Y1ZEg1cUxnN0ZFVHQ3ZnMwMmhR?=
 =?utf-8?B?VEFRbHAyeUdHTzlERTVMMmJHaTJyZGE5Tk1YTmhlNTFQajlJNVpWaGhWUjJ4?=
 =?utf-8?B?QWxGbnd2Z292N0xVWG9qeEZ3Z0dicWNCaTZkZy9Wa01pcmw0NStoVERTSVlC?=
 =?utf-8?B?c3d6UGgvYmw2cjZ4MFZzWTkzc2V6clVuRlJZdmNPR2ovaGxwdzdlejZzQW4r?=
 =?utf-8?B?aDFEdXZUNWZvaitZZU5KcFNTRGFmZnNNU1hETTNnaTRjTmM5VHdqRFpJdnNY?=
 =?utf-8?B?WmNYZTQwY0dTL2Mzb1NSa2lHUTdwUUhJcFNFY3M1VkZTczcrTDllWlMzNTJF?=
 =?utf-8?B?Nko5SjJmYm51VVZPTm5mRUVuUkU5WnAxSFEra01MeGVYYkJsU0hkNnVQZ1FW?=
 =?utf-8?B?K05oc3pkZUkvMWRCK3RHNDZIOXQ5ZWh6cEhlalpXdTE2amJmOXBrbThDSTdw?=
 =?utf-8?B?aEVIaFdwZDB4SG9ZRm9LQkh5SUxRNWdaTWZVV3NsRVlqOVNFWW1hVnU5VE1I?=
 =?utf-8?B?YW9sM2hIakZBc2dMdnNEYmxiVkNCS25yUEc0cTR1cStMa2ZKbE1MNldxeXpG?=
 =?utf-8?B?a1lwODRnOVN6aUZTZEZSaCtXcXFTUm5IbXc2MnBlMExIYnd2NmdyT1A3cmlR?=
 =?utf-8?B?QXBPdVpXZmV4QSt5Sldxdm0yRzR1TTA2L3VVQWRQdDZQRWRiYURNSW9RYzJS?=
 =?utf-8?B?UzlBdXRyUlN3N24xNHRLQVNoaE1EU0Vhd1VTYXVUZWI0ME8yMTM0Y01wYzdr?=
 =?utf-8?Q?d6vt6pny/6sHE7GH6ytvCtHIofq/vrN9mPT2M4x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88028a76-1fa9-4d90-1d36-08d96d1fb945
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 08:08:47.1462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H07kQ+VnfEDTR9YzU6avt6aMhjdjt8l2aBaze/323buka/D6ZHbk3v/s4sdqad2cXJih/Z32rQxVLZdyghRR5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 31.08.2021 17:38, Jan Beulich wrote:
> On 31.08.2021 17:25, Andrew Cooper wrote:
>> On 31/08/2021 14:26, Jan Beulich wrote:
>>> On 31.08.2021 15:16, Andrew Cooper wrote:
>>>> On 30/08/2021 14:02, Jan Beulich wrote:
>>>>> Further permit "access" to differ in the "executable" attribute. While
>>>>> ideally only ROM regions would get mapped with X set, getting there is
>>>>> quite a bit of work. Therefore, as a temporary measure, permit X to
>>>>> vary. For Dom0 the more permissive of the types will be used, while for
>>>>> DomU it'll be the more restrictive one.
>>>> Split behaviour between dom0 and domU based on types alone cannot
>>>> possibly be correct.
>>> True, but what do you do.
>>>
>>>> DomU's need to execute ROMs too, and this looks like will malfunction if
>>>> a ROM ends up in the region that HVMLoader relocated RAM from.
>>>>
>>>> As this is a temporary bodge emergency bugfix, don't try to be clever -
>>>> just take the latest access.
>>> And how do we know that that's what is going to work?
>>
>> Because it's the pre-existing behaviour.
> 
> Valid point. But for the DomU case there simply has not been any
> pre-existing behavior. Hence my desire to be restrictive initially
> there.

Further to this: Using the last-value-set approach also puts us at
risk of running into a similar issue again when the ordering of
some operations changes elsewhere.

Jan


