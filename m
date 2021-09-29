Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F6541C075
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198801.352485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUlT-0006ky-Ka; Wed, 29 Sep 2021 08:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198801.352485; Wed, 29 Sep 2021 08:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUlT-0006il-Gx; Wed, 29 Sep 2021 08:16:31 +0000
Received: by outflank-mailman (input) for mailman id 198801;
 Wed, 29 Sep 2021 08:16:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVUlS-0006id-Jy
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:16:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47a9f5b1-c1e9-49ab-8117-2cdc21a99152;
 Wed, 29 Sep 2021 08:16:29 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-L9TdVp7hNw-jgNqo7fzfrQ-1; Wed, 29 Sep 2021 10:16:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 08:16:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 08:16:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Wed, 29 Sep 2021 08:16:24 +0000
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
X-Inumbo-ID: 47a9f5b1-c1e9-49ab-8117-2cdc21a99152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632903388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAJtOFAhDq6K0VGn51U2Rco8e5YgN526LGuD4cWCvlY=;
	b=KUdXJRpYafvwYVHdDW8fMjJ+NHUOMdzU5WuUsdhCC9PODzTeBezc8buqD0OX2GWlsmJjAl
	U0FY3vu7aZRCne42Nt5ElhH8FL6/0LhsV8EyUS5uH24rZb7scQRbabGzmXcMWoBnIDtF+w
	gC5Hfg+M4vorxsmWf/S2l19W9H14VeA=
X-MC-Unique: L9TdVp7hNw-jgNqo7fzfrQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XR2ajgrY9HG3b4lc73KiABrSI3HjgBzoW3EZgj/ZK2nRVB6hKgyr8lxvbU8uFumaCl1fFuLaaQcSFjdjXKq2OlXLHvsKmCJ+6qHDQvgOPWqUX0CT8AepYwZz8JvyR5O6oxpWXUtnSULS8nyCDMM9JcH5D9hHTSatkndfgDb2k/hR7qaPxwXEAZ1GBmjTjIYjD0BWSAYIQTA6nKdfALcqZEOsEaR5w19NQTnOECueWSkwN99POMbFy/bIFaGYvaeM1++ujrUcK9VLuyqCR1Z4xqdE68MQWc+AJ5+ZZ7HEbNtTDrdDS/F9QiTulGdfXmK80DRpy2f/l//WMnaFSmbmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kAJtOFAhDq6K0VGn51U2Rco8e5YgN526LGuD4cWCvlY=;
 b=gAY+YKyCGfSZCIqLhdPXekBMFpaBwm88ocQD0pN1DHCgj52QWclrlUEBV388MNc0dExMhYupNB7af3Agf8BvfkC0tckutEvud9vOXyF4n966KfUqc9fX0Typ6eiJVlzfwdvZ+WNj/mCFSnD9cf/yi1LZpYgiK9uHfIBc+V4nAh9/6dMn6DjM1On6PA0kaY+00BVGCK4pDM3vCPSFzeAs1lh7qtopTuoX0R9T24nU9q7AFvimC2TnEv7+JkzjlytrcqV9Yxs8RY1csoeFA/YySlBfBxPHzOuVj2alZ6UqMXegB1BdwXsbqq0DkHnjNdcSSMDhMMlhjNJP96DajX/53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 07/11] vpci/header: program p2m with guest BAR view
To: Michal Orzel <michal.orzel@arm.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-8-andr2000@gmail.com>
 <1a341bc1-f7ad-e7ae-1241-a2d5f38f368f@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f59b48fd-564e-64f8-1422-fb842957f213@suse.com>
Date: Wed, 29 Sep 2021 10:16:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1a341bc1-f7ad-e7ae-1241-a2d5f38f368f@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c89c0ea1-9437-492f-bcd0-08d983216dee
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2333BD0807F1D0420198ACCDB3A99@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u2u2ug+yY/0cNZV3e/zHNJJgI+EG4x6xzLOdoqjhhclAgpGPXNGjLvRDhi8kEPIpoJaLzEnWkHcJUylsVIbzSINhsdlfIBaVSrFe86q06s7vnT4thjaeUZxL906bSyCqwmjYq/0cYLhFGUQX4T0DuW+Gdo8ub9VamchSi5kbQrEJwphNt6WAzVs5Zn8nZkk9G0J7tAsyvcmtJE32gNGYqmR+FLFNRNix1QaGNp+E3bbOZYNQQzbwXEWC41GH7fj3U2W8HP7M+wJIs5wkzqFw9+9vWyFxVhoGoEMctL87VTDjQLJB8HVDIbmZptkrqtfTfg6EW3qTMgBE3bi3yuLWfsWTchzcvOIlZ02rhJjgxVeOZSNUSfLgKMpEL4P4Q4QznmGvBZXqc8F7ShFt/9gUdBS2H8Hw9oImLG28sQe+SeycDY4ThywiNLUAFeeIFm30JrBM8XVtNUgE1h4xjCGo12FcV3g+wnqRXS4fslMGRD2G/r3VzbUrwEmhhRiJGz3iUIZ5Natuv1QBOTpNafb7EdlU0Y4WmoFgc/nVLo//fOON0LuSDQkS/oS4nnL0YV5YQw+aj7BK3K0b8KIfzYw7jd4qEGXE8KHRx1WONmMXMQAg7zBoDAbGZtAuSi4EAa974eaIb+SBeE9lv02oOVAMEXhGJ4xYP1w0GN9jEOlAwlRANh6105wyehP2CelfNe+UiHxr8ZhaJ27UEjUkloquO/PpgS6anw6N2pAYEXiscDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(26005)(508600001)(38100700002)(4744005)(4326008)(53546011)(8676002)(5660300002)(956004)(2616005)(31686004)(86362001)(16576012)(66556008)(66476007)(66946007)(8936002)(110136005)(316002)(6486002)(7416002)(31696002)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODV6NVhxM09FRTN4TzJhY3d3VFBtb0J2bzJJZVNHQ1RObXhTRklvVzM5SDNU?=
 =?utf-8?B?SWtrRS9ndFhicWtadk1lR1VtWFBJR2lldzBFbWU5QW9zWHZ6bkdtTEM2Qisx?=
 =?utf-8?B?SVlWd0lYVVlHdGQ0T3NsVzZOMEw5c1V6N1NLVEowT1NFVmNUcWZ5OHdVSm1H?=
 =?utf-8?B?SVlEOFY5VEtibWFmNHRpbzVTVGRWTTBuREJaYjBscTlxRUJxTGROSXFEWWFY?=
 =?utf-8?B?dGJJNllhWHRTWU4vKzdXRS9uTTloajNhYTJ4bzRvcGN6eWhFR1FNUDA3KzBX?=
 =?utf-8?B?WjhWUTFXRTNCbUFuNDVocy9GcERHcFRPUGM5RlA1ZDg0NFk4OVRrREdTblJU?=
 =?utf-8?B?SXVVQ1o4aTZDUmkzMXdzeVVzUzJEVkVLWXM0VGNUMDZjSWhSOTZiU01OVGdR?=
 =?utf-8?B?U2lRUTB2azA4d2E4RlNoK2kxRVQwNlB1ckQyREp3ZGJGeTdyMzgxTk50eDVp?=
 =?utf-8?B?TUpNTk1VR01vYlIyT09nYnk2QkswWHg0SlZLWW5LRm51UVdvWG9qVnlEYlhY?=
 =?utf-8?B?d01kOWczWTUrall6OUVZT2x2eTFJUFA3bnE5SUYvV1d5THl3S2hzMkJiRnZ6?=
 =?utf-8?B?Q2RVcldtSzFrTFBKUU00VTdPNDcybWZ6R3N2V0pqTTBzMjdOcGV6UEx2Z2ZM?=
 =?utf-8?B?M0lMTk1ONHlWNG44c1pUcGppa2lkbkhhWUJaaTV1cmNGQTl1VkdwMUo2RzJx?=
 =?utf-8?B?OXJaUEtoT2VTcmJNaENzcm50WGFWNjY1VDFDaVlOb2dWY3gxanE1NDBBbmtU?=
 =?utf-8?B?OVdISjNvQ2VuVGx1Y1FqZlo3K01wYTlHRzBiL0lLNmJWQ2pMZVhmdVFnZ01B?=
 =?utf-8?B?TlRQQ0RVR3BkWGpvWE1YUy8rUytpNDlMWTNSa1hISFA5RjFXUkRlaUhMTGNo?=
 =?utf-8?B?a250RjcyaVhIdi9DRENuUG1FQ25oaFc4Ni9BbktSK2RycGR1WjRTWEFKQ2FR?=
 =?utf-8?B?cHQxcUVGMEl1S2t1bmp3U0NYUjZIMnBtcUFsNXMzNU5vcThXL2d3TVh4Qmhx?=
 =?utf-8?B?T2tEWW1aenhXcHE0RmdPNGNBMGtUc3F3QnBuT3loUHdSNFBnVzNETDV4WTZR?=
 =?utf-8?B?RkY4RHR1WUs4ak10cnhaK0JQamFNRGdqOVZTWEYwaS9LQjdJbkh2aHRVTnI1?=
 =?utf-8?B?RjlxQ2t1TU83VkxFT2E0dEJXNERBSmtHSEpsOExtc0M0MEUxTnhsNHFpdjFp?=
 =?utf-8?B?aFgxQXpxaEZ4R2ZDYUVkb0llQlhUc01FTWlkMlFQUUdVOHh1dzhwSjBUd1Bl?=
 =?utf-8?B?Yk9xZld0bXdUbjBnTXFFMHovejBkQmRiTHhhMDBiRTBKa2h0anhKbjRzZkxW?=
 =?utf-8?B?bzY0WWRvUUY3OTFyK2RvMzEvMFZYWkJDZjNnK3NGK09zemcwZ2YzOG1KWk9o?=
 =?utf-8?B?aDZ1dVo0dTB5VTV6YlNwVTNBeUNOTVU0NFNSVEU4RGRjdVB0V1l5QXNSelBP?=
 =?utf-8?B?bnVFNzBCejIzTFVaZXg2Y2U1ajRVMDVQRnhhNElKNjh1eUlwZnpPYWVlelpj?=
 =?utf-8?B?b2NFRmhpaXZyUUtmcTBPV2NWQk9SdVhQS2w5TzRrdElqZ0FMNWIra3M1a29q?=
 =?utf-8?B?L2FIUUVxMFNvZTJXT2dpRittbnQxWTFaSmNPVTJlZ3Zna080cVVhRGZmTDJ4?=
 =?utf-8?B?WGNvc2tnKzU2clpjQ2NpUEgvWllJcGc1RFVDWUhDb2lVSEtWbSttMWlOUSt5?=
 =?utf-8?B?WkpkZnkyQkRLcnlLVm15WGJndU51NHdIaVg2RXVPSzNEZUxXOXhSSkZCVDVQ?=
 =?utf-8?Q?cosPIev/vSbvXfafJXtSFXYau+0yD8QLlvy+XoS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89c0ea1-9437-492f-bcd0-08d983216dee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 08:16:25.2147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqP4RaQCQRGucRIqrojXu7ix1iHpG+PqdmqzglQk9Kk1ki6vuwXj6RyHEp2T8/bzh0gjHv2Td663Nn1aCp6XCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 29.09.2021 10:13, Michal Orzel wrote:
> On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
>> @@ -149,6 +172,10 @@ bool vpci_process_pending(struct vcpu *v)
>>              if ( !bar->mem )
>>                  continue;
>>  
>> +            data.start_gfn = is_hardware_domain(v->vpci.pdev->domain) ?
>> +                _gfn(PFN_DOWN(bar->addr)) :
>> +                _gfn(PFN_DOWN(bar->guest_addr));
> I believe this would look better with the following alignment:
> data.start_gfn = is_hardware_domain(v->vpci.pdev->domain)
>                  ? _gfn(PFN_DOWN(bar->addr))
>                  : _gfn(PFN_DOWN(bar->guest_addr));

FWIW I agree, yet personally I think the conditional operator here
even wants to move inside the _gfn(PFN_DOWN()).

Jan


