Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0A550DA70
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 09:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312405.529630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nitTF-00021f-E7; Mon, 25 Apr 2022 07:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312405.529630; Mon, 25 Apr 2022 07:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nitTF-0001zl-B3; Mon, 25 Apr 2022 07:49:21 +0000
Received: by outflank-mailman (input) for mailman id 312405;
 Mon, 25 Apr 2022 07:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nitTD-0001zd-Uw
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 07:49:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3619e6c7-c46c-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 09:49:18 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-qIlIct9hMmqeIvgBJT7Obg-1; Mon, 25 Apr 2022 09:49:17 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB3976.eurprd04.prod.outlook.com (2603:10a6:209:3f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 07:49:14 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 07:49:14 +0000
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
X-Inumbo-ID: 3619e6c7-c46c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650872958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0eZOK6t0NMZu8QXih3b2xtzSHrOqoaouXI0M5kS5dg=;
	b=afV/qTsuKsDg0+InsebZ5EEvKNfG4kTa6/kszWBLwafee7aBCar/XF+U3KHiCfmi5sWwzr
	T7osEDhdQbTTWkfbwTxtuwassiMscxQB0m1DiKczZPEqEPvwxq8ht6hRUjXO7e7X6pGnjK
	XAVGt4GROhIVhVcx8lS9yUDIAVkJLwE=
X-MC-Unique: qIlIct9hMmqeIvgBJT7Obg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljca6kbRjgeljQtJvqMq3szsEGuUbD3QBqkekhqGmAIVXXkzX2szg3srjQCl2m+owXNryTRJ4Aqgz9eGd+fy5CZJxfHeuhHU1l4zzajRpEwVktdy5r4Nhy2HHYE3mFeqUzaGNaPE9AoH2wMG0mWMC+5N5unu1+LGPl8qryOwbaB6DgPWv4FkLM0q83mmLGT7kRX27PowP0J8VQXQF50LCB+gpKH4ohe2ld+3c/xULl44kyQVdiGfStEgLclA2gp5YKw30Wi8hIvR2v+AwnhBqb3Kob+7M++FrRVihGYMJeWFnse8aeCHajrDxPxGogup1vanB7+zzW7EpK7Gh9TGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0eZOK6t0NMZu8QXih3b2xtzSHrOqoaouXI0M5kS5dg=;
 b=RlS+WfEyZpHWeAeviTgSApVLHrDlVBlJwjXrACDrzDDUpUkZK5SK2uKTNgzA+NcxucA/LlQUE07GlBDoADXHvSbHxMwRSvHfUGMPFTh50h3qwKbDj6yGSB+GyTjBEi2gSiSBswu/iX0lWA3TClJrV03+sFmPD5OiLEL22LNAqKkPXfVFem3ebHLNoF+gIx2kn6T+Xscs83Q2Bl1ERAS51CIFpeNv2r67Ppj6dN4mQSxQRJmw/OzPsJgQQ+9VfEX7fuLpliUKvMh1eMW65lAwUWofJ2xl4Oem1Qjig7R7zzR3AnLoGg1r0F4PCh64Gc15+bMdSLD9LwKX3h6msK3vEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <310ab91a-60bd-f4fa-aeee-28aab43aabbe@suse.com>
Date: Mon, 25 Apr 2022 09:49:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/2] x86/mem_sharing: make fork_reset more configurable
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <CABfawhki8YVxycv_zdDqDuOYvBdobdskXnjjdjiF7UND3784cg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhki8YVxycv_zdDqDuOYvBdobdskXnjjdjiF7UND3784cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0297.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::35) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5beba772-f4eb-40ec-7877-08da269017bb
X-MS-TrafficTypeDiagnostic: AM6PR04MB3976:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB39761DC5BFC49F0F89E97E05B3F89@AM6PR04MB3976.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gw1X7cIozQUlq3mRKbk9T7Bw898AHw3XPwOgTyeaXvm+Edt6tRa/IkcqPu2Z+ngsXmjFpzlhjQqmU4vSO8QZr38Bz8Ztqd9njjep1w9NgxkbncgGAHXvQqYAbyoFQMvGwgxrg+ziVEUdkdTCE/wb2ImAE8qxx35qjkgYPbX8zBikVwosclZQtEa5atJqib/M6WY3rZkxpyydbsSL/6V6pcCjznNwqtt05LLcOiwgY92jI4pfcEKKKnVa8DkHDn213rceFKoAqDSesBeQbDyQi27ApSt1V16ky2h0WxwJN1yIqojW1BIWvrG322DDIxL519F0XJrtmGujc2E3os9AgnEOZKmegrYgfPKfHL92mY3v6NJ3Ztg+zkV2jvv1CNzbsXJmzJY0I60M3IroYID9WC/47mvwFgSnQvg5Xe0As/cMO8/sueAhldJ0h1C+PpVT9+7h3E3oer29+uESE6tFlRHqx2k1vSxzdjHxeRTE5bkcICXb3zwcwPsq3gFw1A+NebVDIa0QUinlxkFcy495ti1CHiEsnAOKvVu5bL43k0gE8BNgaXxF0LrA0WhAA5Oll/SMQwT6xkLVrRZ0sdnhDVtbjEgrK/cx54UQzUUqsxsXpHvthsiiLCDi3ewa9HFf27R+/6wKz7yTTvExZwX+uy9uvpR8T8ML3KX79Dj869kCqY/V+0aAAz2gM5YDoGJW1pxAbq3zVYc0SdSmZJJTRBxvNer6rFtNtF4UrpCC/Zk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(508600001)(8936002)(5660300002)(26005)(86362001)(31696002)(6512007)(186003)(2616005)(83380400001)(7416002)(38100700002)(53546011)(2906002)(6506007)(66476007)(66946007)(54906003)(316002)(66556008)(110136005)(31686004)(36756003)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE5zUEVqenRZZFpvOGtNSHhVekVmUTJCSFczWUFlUTBwbUdsVzVOTldCNVZ6?=
 =?utf-8?B?cVB4dEFLSEFiRHlGeDF6YjMrVkNWckJKeWhKMTRSL1RhcXJNdm0zaHRHMXpN?=
 =?utf-8?B?clFLYVFHQ3JlcGQxWXJ5VmpKbjhNQnZSdnZXd1lSNXpmRFQrN1N2bU56Vm9T?=
 =?utf-8?B?QVBXRWhsOG0zbnZ6SEtqU2x4OGtCd0JjdHFMbnR3OCt5WkhydDMxMmNDdzVq?=
 =?utf-8?B?YUtPYjZiY0hTRUJrN0Q5ZG8rZnpNZTdPVE1kWlZKamJHTFA3VGZxVEJUMUZF?=
 =?utf-8?B?eXp5QllHYUkyQkUvZHY5TDQxSEk2RG43Z3FBNG5tS1pRUWtIMDdNdTZyenI5?=
 =?utf-8?B?WGRhUi8vYlpZUkJQNXAwSXBPZjBTSTdpM3lWSmdVUXBZZmlEbnorYjFyeENw?=
 =?utf-8?B?OFE5R0JKUXdYV0J4ckZCdFdGSzdrRnZEY1k1amNNOHR5alRYNE9MQzNnMDlL?=
 =?utf-8?B?V0RRUjN5K0pVdUVzQzA0aTE1dHpTa0lJOURXY1p3U2hzQ1hVcFpVeE56UHZr?=
 =?utf-8?B?YlJSaXo2QW5HVlE2NCtBcWIvbnZUcytmdEZyV0xnWVh2TUlRUWM0eU1iM1Jh?=
 =?utf-8?B?WXd1SlNTNUU4UURGVXRNaEUvRzhuSXN5WjRtdzd0YWFyMCtOU29nZDZkVjBT?=
 =?utf-8?B?WHlMSHpYUWs1emVodjR3Y296Z1BwRkwrOFgrbHpjOGRDaUM4YzZPVTQxdHNi?=
 =?utf-8?B?Y0hicUZkTTBhVEZtQWk3b2tvUW5LV2JvN1JzUHpTYmJHMzZLUEVDaE40UkZS?=
 =?utf-8?B?WnNPMzJFd2htdzBMcnFxUUtjSjd0bS9SeDUwV2Y0NTVIMk80K1hyYjJ1a0Mw?=
 =?utf-8?B?NmFqV0dXaExQWlRFWkhPWGhOTkUwUElnUWJ4Wm5yOThFdXp2amRaQlllWlpG?=
 =?utf-8?B?ckNQbTdUN2J5aTJpa2d2SG43Yk1BYjV6M2pMem96TE5PRUZoTlZUclREdy9j?=
 =?utf-8?B?eDBlcnBkSkMwTEsySW5jemRENHVWYnczdTdqbGhkdjAvMUlRRG1HblNxRHVa?=
 =?utf-8?B?NDd4VHlwRy9PN3RzSjZ2ZUlaaW9qaEJRalUwbmNkckMyZVdYWG5PanhxWXFz?=
 =?utf-8?B?U2s4L2NqS3ppTmpmR1BQSHdaZWxUSHdKeVd0cjJVTjRFQlNlSitKMHFpZVYx?=
 =?utf-8?B?Rm41QStiY0VudHdIS212dklDUlRtNGxjenhqek9aamJYb3puRHRRamMxMzRQ?=
 =?utf-8?B?amxCUDF2bFA1azd5aG5SMFNzSkVCM05xSVozSmNKOXFuRVp1b1JPcjlWTkpX?=
 =?utf-8?B?Y05jZzVrazFVa2IraGJwRFhacEJyZFhLdE9BcHN3V2ZSMnNMNUpkRTJDNEFy?=
 =?utf-8?B?YjNheXp1WkhFOGZiakVMVVBGQ3lsUnZKcUlQbG5qbS9sL0hKMVV0bWdlYjM5?=
 =?utf-8?B?aU9sRmhRNTZRRkxhdTd0OVBLUG1xSHcrL3F3RThjTm9BNCtjNUZHK1pzZ3hK?=
 =?utf-8?B?MytvS2J5Z0lBU2IyTmRVYzIwMTdwTGFhSXU1eGl1QmdaOGN5cDNObjdudlRy?=
 =?utf-8?B?TlBoR3F2c3FQdUkvY2VMRHlOZGxic1ljN09iREdLb1dBRXFCcjh3Y1RXbzB4?=
 =?utf-8?B?ZDBRQ0FRVGh2SHgzQXdYd1NiOEl1QkpZSElnTWYyalNvZG14bkFvblUrUWcy?=
 =?utf-8?B?ZGpiM3VMRklSeUFEOGJrZ0xlUlExM0orWEQwZzltYms0aEh1K3pYTnRtbExh?=
 =?utf-8?B?Q1pEZ1M4WHpOT1djRjJuVEZzZnIzdXFCeWl4MFRhOUltSWFzOGsvU3ZFUE9p?=
 =?utf-8?B?VHdPOS82V2swSkVsMTNLMUFvN1haSmpkdG9naGVpbWtSK2xxSjRRZkU0MkFJ?=
 =?utf-8?B?WCs3TU1MSjhaQUtCUG56TmhvVlFoY0NQUEZVNmdXd1JWRk1EMWU4VjRieWQz?=
 =?utf-8?B?Um5sc1NIY2dYWEdyaWxHY0RvN2FsY3BTYWo4a1BBcXlHZVMyZmNFYnV6eWZj?=
 =?utf-8?B?bktVWldLMTJVMjlobThmZWlYRzlicUVka1d6cEZ4bUpSTm5ITmxDOEFzOVB0?=
 =?utf-8?B?ZGFjMzNOZEFDRTNhKzhaSWNRMForQ3VnM0tRbklYRmFFdkQ5bjhCTGpzVXlN?=
 =?utf-8?B?ejdENFJ3bW0rVFdBUnFyLzFLQzNLbjk5RkVGSVYvMUxFUWREQzJpeGJ0NDdY?=
 =?utf-8?B?bGNNY1ZCa240Tk1pUjdTQkhlcUluL2F6SkZac1JhelNwRFdUcm8vb3hlZUwx?=
 =?utf-8?B?Q081Q0Y3YzNsRzZVeC9ReTc1MEFSYmxkckc0cW91YjA5K2ZVQnhWR3NRY2d0?=
 =?utf-8?B?RG15V2dQYmJGZWhLakpBb1V5R1VMUEJoaStKOUhuUkxqUTJOWmZjem5XRTVk?=
 =?utf-8?B?amFEZFpBWmgxSUlnK0RqVnlQOGtOMS9qL2NieXdncm1nZ3FpVXVvdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5beba772-f4eb-40ec-7877-08da269017bb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 07:49:14.3060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9m+uwFPDTMLsPSRqf/hreEYEUKqjNKPt+yw3fU2RJoDOADwfe2sdlu1+3wYJNXEwU0jLoovHFMRuI26ephn3Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB3976

On 22.04.2022 16:07, Tamas K Lengyel wrote:
> On Wed, Apr 13, 2022 at 9:43 AM Tamas K Lengyel <tamas.lengyel@intel.com> wrote:
>>
>> Allow specify distinct parts of the fork VM to be reset. This is useful when a
>> fuzzing operation involves mapping in only a handful of pages that are known
>> ahead of time. Throwing these pages away just to be re-copied immediately is
>> expensive, thus allowing to specify partial resets can speed things up.
>>
>> Also allow resetting to be initiated from vm_event responses as an
>> optimization.
>>
>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> 
> Patch ping. Could I get a Reviewed-by if there are no objections?

Hmm, this is a little difficult. I'd be willing to give an ack, but that's
meaningless for most of the code here. Besides a stylistic issue I did
point out which I'm not happy with, I'm afraid I'm not good enough at
mem-sharing and forking. Therefore I wouldn't want to offer an R-b.
Considering the VM event interaction, maybe the BitDefender guys could
take a stab?

Of course you'd then still need a tool stack side ack.

Jan


