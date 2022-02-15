Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8954B6D4A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 14:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273172.468257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxmT-000500-L6; Tue, 15 Feb 2022 13:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273172.468257; Tue, 15 Feb 2022 13:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxmT-0004xC-Hw; Tue, 15 Feb 2022 13:22:09 +0000
Received: by outflank-mailman (input) for mailman id 273172;
 Tue, 15 Feb 2022 13:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJxmS-0004x6-0Q
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 13:22:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 453a8dbb-8e62-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 14:22:06 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-ulufjs2mP1K17xBuPp_xlQ-1; Tue, 15 Feb 2022 14:22:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7970.eurprd04.prod.outlook.com (2603:10a6:20b:24f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 13:22:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 13:22:04 +0000
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
X-Inumbo-ID: 453a8dbb-8e62-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644931326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rJBQZ+Ux1WL+WjXUaL0a6qz5XGjP6Fl33toIGOB7zvs=;
	b=NqHpjMbLaemMghPKB26MljVbgsHUaEDUJSt9k/MqZQM8mxmL8Y5rH6mME7UoWYkEhCH1zi
	bb2hWAy+Koi4vSn8Ezs3Plu3R3AAxJEPzSvc4QOlxATDMeTg8gqDLdEDMeY6L6a6FTKlU4
	lgqCMFVxzGS+KS886ydbUiDk1cj2tUY=
X-MC-Unique: ulufjs2mP1K17xBuPp_xlQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaQg8f9J6Kv31SSvoREstDRjZgBp6ETTtyqZOoMOHdpzcCWUkhCM+IpxZ4qBwueh+oPls4gC8yWF7kniCJi+Y8YpRpd3W86s90Fp6vP3U6L4n9/ZKgjRwglrX5MU3U1+hbmEH7Zlmci2tZa6Gkbpt5L5AqRPD/KOR2K7JRzRGDmmZkTwlqCDEXrtMyi4Z2XBveAXaMEXLIHU2z5Qn3ErqJNHAui1T0WyZE9T+7bdUxUfqfCgHxWgQ2b4w2vZb1Dmz+VSIUIQd0u/kwLDWV4hotXSZkPxjzYkKA2NC4ip6jL11+7t6t2JcuGBssslpEbu0sZQEEv/LJTRa87JE9b30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJBQZ+Ux1WL+WjXUaL0a6qz5XGjP6Fl33toIGOB7zvs=;
 b=mtuighdwkfAvKA1fdfNw6JBjEgF5f38oeKzUrjZyYM08kM2W/Vo/EEYQSOFIV9CQRupjSmAMvYIHaP/aEEmx9OSSjbISn8HAs+Tt9oOo9ibpHyF+6V4+CVZaBBRCeEH3SVpOY1UGYNdP+XTtbISWBVAZPzEev3cyTno5K8nttl3SP5WzUHnzSlC7Pkt1u6YDZ9NR+JOYgLSn6R3q0mcX/neiFyfAQV4ll7Q4/sWSV00sf2gHY3xKwlpqDBoiYx+S5NbCKL6afg/vZdiT5vI7Egd0ThwcPLmmaWghKiuLBOD8pegH8ZuAray6gwCwb7itQP+c2oSZzyjLbqxcWa9JEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dfc3ab95-f2ca-bf03-98c1-5d77ebcdb048@suse.com>
Date: Tue, 15 Feb 2022 14:22:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] rwlock: remove unneeded subtraction
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220215093951.97830-1-roger.pau@citrix.com>
 <7710f137-7123-ca70-3a58-3dba1981b2c2@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7710f137-7123-ca70-3a58-3dba1981b2c2@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0005.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab9f0105-3fab-4948-dffd-08d9f0862832
X-MS-TrafficTypeDiagnostic: AM8PR04MB7970:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7970AD5F73E74166F79A9D63B3349@AM8PR04MB7970.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vQSKqPtDeQryHDajZ2mhWxvBsv+H/yppL8865R+5JgjK9jJ6dH/lX/jhzvbXR/bbRbVH9HJYEKMwNXV3Wb3tnZhezy2fPFoSEtSGsntxd8rrL47Lpqx68thYTc3DypmvlSTdt553WL8K/YvcpSdZ8ynMCsFCymCHf5lfFnEYO0azNSC88sVojJCw9zgvH1SKrJgLBPVhj1qVnGQ5Fp5RgDFHD/Xv2cS6XQty2RVQtvOrmLPiOPTVukThfdIof01pXQEvzFy1t2ggow9CONMhsiSp0591RscDsHGvBPhuWOd+85me3Z4xcVmW+l56AnTu3ppXW+SLK9t+D7F/mNe3Fs9O7pAXV0GnmVAxIYAz9yaDf169FFYzxAn9TN82b/67a/BdZx9UmC7Mg5ztGcJt2hJDjTp1W4Dv8j9OKcgggNrU8/wAgvjJK9yNOTThjOcUwa4QZyXkPxE+rPUVIFPs6i55pgaHzSVWOTLC9xpbTkHuYixBzqWDAcqYS23eQJFDLA28GtvE9U4h7KeSjiN1ecinuOqhSR60VhTVvo4Dqx6H40Ir7SCnKU8ioXNnSSQy5reL00qBBfgiGl/OG5Iu8/SWtjZDoNaaJ2ywPd+oSE2r9MmDJbKc7pSTeXp7HzRanElB7Lox+KarmBMYH9q7w7il97+jwqv4IjUaNwJstKYjPZ9TnSBhUeDWjpI/Ah47R7ftGae3Vey9ZCcxjug5F1VHvr1zQcbx6RjZ10htXLs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(186003)(36756003)(53546011)(2906002)(83380400001)(2616005)(6512007)(31686004)(8936002)(31696002)(86362001)(5660300002)(110136005)(6486002)(54906003)(66946007)(66556008)(66476007)(508600001)(26005)(8676002)(38100700002)(316002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXZoQ0NJdzIrU2l6K0FlZ1Y4UU9iTVMrN0txL1N4RmJKRnRWb3pLUGp2c3Fz?=
 =?utf-8?B?S0Y4ZG44bzE5V1JNaExQSGh1ZWp5clNxS2R0MEFFbG40cDNlb0pzMG5UT0t4?=
 =?utf-8?B?a0FoSTdoNkgrOTZramd5VVQ0U2JlSzZPNTdlVkp0SHR3Y3oydjRPa1hjaGJu?=
 =?utf-8?B?YkxNQ3JWUzdKQmx4WWxQL1dvTHZXSzRvcVRFbVBGelFOTDFvRUJSczFsZWRn?=
 =?utf-8?B?aW9SQjhKd0I2aHNLUGJaRHBacnFqdnVhY29WZkFGcThWRCtISU5yaFc0UUhD?=
 =?utf-8?B?OW5TTVphbTlmVnk0WUxjVlRMY2pLZ0w0MmY2UitmcTJOUXFLZ0NGS05uNmFT?=
 =?utf-8?B?dDZjRlZ1RXhvSkd3VHJHczZ3c1RlaW9lN3JWK3ZYa1g4REhHSFREelJBVWJ2?=
 =?utf-8?B?R3hOWUtyU2Q5NGNWUVFJNllZRkZqVkE5WE9BUUF4TjEyZUxFQWlWOFdvZ0FI?=
 =?utf-8?B?SDMzdmo5WjIySVVXY2dtUTJFT3lUQk9BK1dvNUtCMGNBRTJxempQOW85TWUr?=
 =?utf-8?B?UDBMbmJta0pxMGJBR2pnMHZLTy9WUWxGRC9ZN3BuQk9BeCtDeUJrb25FUW56?=
 =?utf-8?B?Zk1oeUUxcXUrZTNlWHZyTFlmZkZyb0lUbUpKdmU5MW1rM1dpTUJEaE95aHF2?=
 =?utf-8?B?eFU4cUR5UXdDRVVoa1hoWmxodkhjbEZxVDFvUy8rblN5SEZtcktIaUM5eVpu?=
 =?utf-8?B?WUhMK2VMTUNJUUVycGJZVm12d0NUeXF3VXZaakpiR3FGRkN5RE1kZkpiL1R2?=
 =?utf-8?B?YVFzTjJSaGhZSkEyTmFhNzN6MUNUS1FOMUZ3elhiZVMvQjVIc1NHM0JtTW1K?=
 =?utf-8?B?Z050WWpWRjJLcUlERVJrREVOdFc5NVFwamVZR2Z6QU5LZDN1aGhSRWtsOGFp?=
 =?utf-8?B?cEhQMHEyZzhpZnBIcm8yT08xcVU2cDdpQkRJdXVJOHNVN0tad2IweG4vRVBt?=
 =?utf-8?B?RGhsLzNUdi9ndFBkOTk4S2R1TmJzVjVjNWJYZGZWOWo2bi9NaHhqRmhraG9K?=
 =?utf-8?B?TXJWcTFMWUVFNmphSFU5TDVvRnFMZ2Q3SGcvVVY3S3RXY0VHTXJMVkxwVjZL?=
 =?utf-8?B?TVpDZkhxTjUrSFVJT0plK0dGaHJiYTNIWTJsT0VEWk9uR3ZGS0h4aGYyeVdO?=
 =?utf-8?B?ZS8wakFwWmJ3dkFVTVhralkrN3ZHOTBtNlpzMHBtWHVoSUJHS0dqRldjZFdx?=
 =?utf-8?B?R3ViU1hOU2VFY2FhSmJxM2pkUWI0U01adng5b1dUQTR5YjgvNHNaSFVGWkg5?=
 =?utf-8?B?OGs4ZjdmL21XcDhhNElNTHhLMmd0dUVwbzJPcXFhaVdyT3htbDFCNEJZR0o3?=
 =?utf-8?B?M0JHL3h4Qzc1NFVKMEcwRzMyTG5Ma1laN21rcnEzbmlUY05OdDBJczdPUVJa?=
 =?utf-8?B?WXNaQW5ycmo5bmhTOE04TU40TG83c0dYVzdoTFpZS1FESTdXNm9vbnlSdEZP?=
 =?utf-8?B?V0piQUxxamhycWpXajB1akQwdVNSNDRUMTAveS9uZzJDU3QzWnArSVg4Tjk5?=
 =?utf-8?B?Y0ZBWVhLSnJVamZPQ0gvb1dDUUVoNmlHbDdhb3U2dlRMaG1zTjFYM01XdERN?=
 =?utf-8?B?dTh5NU9NVEdCVGdyUDZtMmk4Mjd6Wi9Xd2hsMVJ5UVR5a09wN2V5TVAvTVFI?=
 =?utf-8?B?c2lvckRsRXZnSEdpTnRualJKbmQvdzU2dTlGZkxITVdTYkFyM212STUreDNL?=
 =?utf-8?B?Z3didTRFTzA2SnVzT3lXcDNuOG01MVFwTGFnU1ZIa202Nk1BdTRpbFlvK2t6?=
 =?utf-8?B?Nkl0TU12OVBRRUZ4T3VXQ1ZZZjlZV3pLeVhteXdLNTRHVzdhZkZBK1JuTDho?=
 =?utf-8?B?YkdkRVpteVBONS9yM2VuZEdkblIwWHdPL3dQSDAwUVBRWnBaK3JaM1BscDdW?=
 =?utf-8?B?OG5meXhNS25wOS9ZR1BvaEFvTGdBemlSVzFFb2F4VzJtajZDN0lZQWVaNjc1?=
 =?utf-8?B?L2g0Q3hlMHNnNXA0RlRtaWZ0UjVnQi9zbXlqOUV2L2FnS1pYUjJzVHUyUUM4?=
 =?utf-8?B?WHpkY291d0MrbzEybURld3ZaT0FJRTNMOTRDNzRsZXNNNXJCbS9TWm80V3Vi?=
 =?utf-8?B?aFNDdDlnNlluWWpYS01SdUQyTWlPbXUwRXVtMHdnVGJYUkJWcHgzYk5RbCtp?=
 =?utf-8?B?aDJWYWZwU3lmSGlhZEhCTFhzdTY4MTJEV28wcTF6cnRna3RzSlJzMnl5M3hi?=
 =?utf-8?Q?W/a5SVkldMlCijQQ523Zk1I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9f0105-3fab-4948-dffd-08d9f0862832
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 13:22:04.1748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yu4l1ydUhOWAOccaSWoFFlESMrFmaNG41iXPGk8FD7jEIReKiuC+rl6vXoB3X0AyJ/ssJuygd4YbErxIRWngHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7970

On 15.02.2022 14:13, Julien Grall wrote:
> On 15/02/2022 09:39, Roger Pau Monne wrote:
>> There's no need to subtract _QR_BIAS from the lock value for storing
>> in the local cnts variable in the read lock slow path: the users of
>> the value in cnts only care about the writer-related bits and use a
>> mask to get the value.
>>
>> Note that further setting of cnts in rspin_until_writer_unlock already
>> do not subtract _QR_BIAS.
> 
> The rwlock is a copy of the Linux implementation. So I looked at the 
> history to find out why _QR_BIAS was substracted.
> 
> It looks like this was done to get better assembly on x86:
> 
> commit f9852b74bec0117b888da39d070c323ea1cb7f4c
> Author: Peter Zijlstra <peterz@infradead.org>
> Date:   Mon Apr 18 01:27:03 2016 +0200
> 
>      locking/atomic, arch/qrwlock: Employ atomic_fetch_add_acquire()
> 
>      The only reason for the current code is to make GCC emit only the
>      "LOCK XADD" instruction on x86 (and not do a pointless extra ADD on
>      the result), do so nicer.
> 
>      Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>      Acked-by: Waiman Long <waiman.long@hpe.com>
>      Cc: Andrew Morton <akpm@linux-foundation.org>
>      Cc: Linus Torvalds <torvalds@linux-foundation.org>
>      Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>      Cc: Peter Zijlstra <peterz@infradead.org>
>      Cc: Thomas Gleixner <tglx@linutronix.de>
>      Cc: linux-arch@vger.kernel.org
>      Cc: linux-kernel@vger.kernel.org
>      Signed-off-by: Ingo Molnar <mingo@kernel.org>
> 
> diff --git a/kernel/locking/qrwlock.c b/kernel/locking/qrwlock.c
> index fec082338668..19248ddf37ce 100644
> --- a/kernel/locking/qrwlock.c
> +++ b/kernel/locking/qrwlock.c
> @@ -93,7 +93,7 @@ void queued_read_lock_slowpath(struct qrwlock *lock, 
> u32 cnts)
>           * that accesses can't leak upwards out of our subsequent critical
>           * section in the case that the lock is currently held for write.
>           */
> -       cnts = atomic_add_return_acquire(_QR_BIAS, &lock->cnts) - _QR_BIAS;
> +       cnts = atomic_fetch_add_acquire(_QR_BIAS, &lock->cnts);
>          rspin_until_writer_unlock(lock, cnts);
> 
>          /*
> 
> This is a slowpath, so probably not a concern. But I thought I would 
> double check whether the x86 folks are still happy to proceed with that 
> in mind.

Hmm, that's an interesting observation. Roger - did you inspect the
generated code? At the very least the description may want amending.

Jan


