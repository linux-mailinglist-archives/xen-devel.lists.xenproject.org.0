Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B07C3B5DBE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 14:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147836.272904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxq9A-0002Ku-L6; Mon, 28 Jun 2021 12:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147836.272904; Mon, 28 Jun 2021 12:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxq9A-0002Ix-H3; Mon, 28 Jun 2021 12:13:52 +0000
Received: by outflank-mailman (input) for mailman id 147836;
 Mon, 28 Jun 2021 12:13:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxq99-0002Ip-Ju
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 12:13:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62939fee-3192-4b90-8951-62f5879bad3f;
 Mon, 28 Jun 2021 12:13:50 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-BNlic1ALP-yznXHMmMB66A-1;
 Mon, 28 Jun 2021 14:13:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 12:13:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 12:13:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0213.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Mon, 28 Jun 2021 12:13:46 +0000
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
X-Inumbo-ID: 62939fee-3192-4b90-8951-62f5879bad3f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624882429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QEQ9PcYqF9WvWC4zp6yy+DyXR04ehCHa/bXmEXm0750=;
	b=hTH2ihXRGQu6o2eJjvbTio0A8tBuOmvQqMvMhR6M+lkQX/U/gz7mg6zPARnMOPWrzJtnvU
	rDr/phJoXiwrUXm6KQYcPMopqOPP+cWDYHjzWevJIvhNA5dE9NxZUbbgsn+0wLaJ8fPHzX
	VQjyo0NYztpPmCfEZIdFELWBKsEAQO0=
X-MC-Unique: BNlic1ALP-yznXHMmMB66A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5Tlf/nIEZac+eyhzBo7uFW8WwAcNXOL6Bf97KVklDJEq7kjzWiTN2NQ4+jf0tkOHfd096vkLdxKfbIaVh8x6yj2XJn0oX9C3F09DI7xVC8p3PE0A7iIxNFQrY9YabcmzRKjrzCf+WVYCJD/GzPFybpzJHcC12LpRcCNBDqwhCRPxCW2jyXirqm2FNUoYGCAB1cub49iBdzlL569SztDg7BG/jo69035rj4u0UjGAvehybKCdC9eOaKxdYVftaVvdVD6Hk04JFYVbZEFSsX/iDu42gk0pe3d2W2cIcZN3llNqesSMDnJyuFGK9rCX8uGKrSHlbLhTUG24uBRjpUqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEQ9PcYqF9WvWC4zp6yy+DyXR04ehCHa/bXmEXm0750=;
 b=AesZUVpOfFt8N5+B65Dx3O2O1xiXWyIQ22idyKn20tja6NMXjMXLSrKPCs5VMx4Wz3U8XsBZru8IsfUML3Tr3W/cvw9++6pOTAYwqSMzJJSnk4+dPPpobNsx4VFvKhOR+as4gQPuCmIy83PusyftiLQjA9twCAL41k+VTBY1TME6TcPwkS15Tnb/U2QOd05SUogoL1UKsCTqU2oAcG3hu/pSEDPHqHBjjcVghzZY0lo4qJNAuI4re66aryVoTbitmDRf0XL/pTmT/4pNDfI2DHy5WaToohh2M4vVC8mpkYkni4gd1d6jr5BhPUlKFLynbokjwzy/NFOI/csLNpZyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH v2] x86emul: de-duplicate scatters to the same linear
 address
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cf935e11-27c8-969f-9fb2-a5c0e85ccff1@suse.com>
Message-ID: <26495a3f-d250-4445-ca91-0d0aae336fe7@suse.com>
Date: Mon, 28 Jun 2021 14:13:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <cf935e11-27c8-969f-9fb2-a5c0e85ccff1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0213.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f10c7d6e-17dd-4b30-0b54-08d93a2e2e29
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70393C460332DED186F50833B3039@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2gHsqHXjjg4MCCHY0x/0WbwokszA3a0tDFbTM8wcKMncYu8imWF4CjMYHG+L0MZs2QjVrqai/qxjSzVfsBzSd4lPROViNM3RDDIueMNIpJkmcHemVN/+CIK0qCGcHZCmMq0LgMMMCM/gixn8GuZrb9Z5SgHZw/Eg883JCat6XsJy51UZIepPshQtwi+1OjugFnuEGg7PKj9Phu7CjUOswSu0tiJZGqQjzT6/EmHThpA8YpqYoZ4O2ji7Xjn8p4DOztksx45fo7IIFIwKFNVv66pP+Ipjhn9rtmUsd3VPddPtDvNosnh8hK54G55HQBvl/bqOXF3hg711pv+eCTJW+fBlnNx441/zaqdEM1kiQjP/UO5VeLsrC1JwnYNXo3ZWQMnJBZx8rF/o92QVnXBoAT8VyMjgPCHkhs235JnvTw3uHLebPMuLqELiKD/5LIqsMQOQMLwKqnBRFwKCyzOt/iF4+2q8wGpxvBk9LDRtVtspJbTi41NhPGKgrA3Yag9BcujkU0/j/k37fJuwc1wmTTpRgSWtHsE0eBADWL+ywFLIPK3gVhYFB4aeiMFatAHwhwpanuzt4ryqc1d1LOK96bsUaBh5Ztd7WJpmyI1krmsC8Puxd/0Y6BSHEu3rBxxu3aFEfiRKl2O3vMqsJZY2wjCogh99K2ck1vokYMqRGfMc6rluKhcAAD0YcbgLJITsrs0QbGHJ4/ciyT1AnWSWxhe6vybwHblNiqvNclZ2wUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(366004)(346002)(376002)(16526019)(186003)(6486002)(8676002)(83380400001)(86362001)(36756003)(5660300002)(31686004)(53546011)(66476007)(31696002)(2616005)(66556008)(110136005)(26005)(66946007)(478600001)(4326008)(2906002)(8936002)(16576012)(956004)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UklMWERnMTcxb1JKN1FzWHdYUmtsa0ozSWl0aVp0OXpDd2F3b2hNTkhDVzY0?=
 =?utf-8?B?RjJoMmZzbXFIYkpXcFZIY0g1K3BnWVV3cFNPWWF5YWozd2RNTGhaMG80TW1K?=
 =?utf-8?B?ZHV3dW1ZTW9HZ2s0Q0ViUTNSTmFLQTdIN2Z1ZzVNRDRaWDhzaWFlblRqdklE?=
 =?utf-8?B?aVh0OVdhdkg2bVBCUVRCZGVuTXUyOGVrdlhqT21yQjFGSi95aXArL1JsRFo2?=
 =?utf-8?B?QTJPQ0k0SGltZ0xqbkVFWTlXcVB6TWdpbS9Pd2lua2s0Tk5KVEhLU1B0aGNP?=
 =?utf-8?B?L2o3MXdoNWEwQlFVS0ZyVm9lb2Z4djlmZ21CbUhVczlMbnVZOEJYZEN3YUZx?=
 =?utf-8?B?TFRqYlVzeFBiTEh4MHdxbUFEMkoyaXB5TU9JRGNNVnp3YWRaZ1dsbW1UV0Jp?=
 =?utf-8?B?UUZkSWFWQkFONXRoVGNvSHE3TS9RUUVQUG5wbEQyOFljVGxYWEdJc0FDTFVu?=
 =?utf-8?B?Rk5RS29pbWQ2NWZTMW0vUFpvd0dCRnc4b1hrT3pkMzRtTktxM2lRUlFYU3Vh?=
 =?utf-8?B?TXhmRHZsSUNCZkNQbnFpdDhrZVZTT2dsemlxV2RJQVZ0ZlJXaXFjaVp4bGpH?=
 =?utf-8?B?cHhyZ3lEMEdFSFRIMGpJY0s2ZHRqMEtCRTFTbWpCdnVGanV6dnQ2QzAxL1RQ?=
 =?utf-8?B?elR6NklNcEE4ZUllQlhqRHZzOGx1WG9qU3NORVFld3FpVUZEUURFYzUvNi9Y?=
 =?utf-8?B?QlNPTDNxZDdmc0FKaFNTN2hNaVd4MnhJZUo5ZmllbU9helZFUUw5VERhcFdR?=
 =?utf-8?B?UDNwUmhzb2EzY2ZhREZuVmpFNzVyVnJkWmtQd3VQUXN3RVVQTzYzRTcvK3J1?=
 =?utf-8?B?WG1RTjRPTHpNSHdCSnFjME9XY3RXRk1HUnZVM1BzcUREZmdHNzdjUmdVeTZy?=
 =?utf-8?B?K1IyYjhtd0RSbzR2b1NzUXlaQWlUaldoQ1RYdUVJaTJlYzBqRDh1bGVpVi95?=
 =?utf-8?B?SVZGZU52cnVVK0VsNS84MjNmMnBiWVBoN3pEL3lQYW53RCtNYVE3TjVJNFgz?=
 =?utf-8?B?RktHV1FqZkxCY05VYTRmKzhhSWpqRzZlOGdhMzNYZlFSOFZKU1dIVXlhSFBU?=
 =?utf-8?B?eEQ4RDE0em8yUUFzSmtWV3BDL2h6K2kyOVlTY3NhWkRvUWVSTkxaN0dZTDQ5?=
 =?utf-8?B?TStITTR5YTdPUXovZGhDN0pzNllMZ01PT0N2L09qQlhJZzNvRkxEa2ozbHJj?=
 =?utf-8?B?WjdIdDdycEtNRmROUTRzeDRJalo3VlB5RnliTVBVYUYxamt3Ynk0S0xDWWQ3?=
 =?utf-8?B?M1RTK0xBOXZLaFVkQzNhMGdXaHJPUjg4cG1USjllMU0rQnJ0MXp3RXZWWjVY?=
 =?utf-8?B?dlF6WkJidW5lTGU4WlZTb012VklhOWgzLzUyM0ZDejZuRlh5a2tJYUwwTWNH?=
 =?utf-8?B?ZzloVkNQS0d2L1orU1NRcTRsZ1ZaSDRKRytNUGpKNFhDN2E3MWZveEFzdk84?=
 =?utf-8?B?TEdNSmhCdkk4Ry84UzhnZ0JuRWVrYlZKaVJzemF3VHgwa1NFMUdvWExUcWFi?=
 =?utf-8?B?cnhWbHFDOHJWQmV6RWVHZXJseHhKNUFFUjI1czdCSzE0UmxDcWdkY0JCWXNL?=
 =?utf-8?B?blF5SFZVN2Zac2VTNE9lTk5vclZZcFRKY3RGNTBjN01MbDlvSi9ZTzB5T3dy?=
 =?utf-8?B?VGErUGQ5aEtGeURjNmprUi9HKzkrUzNtOG9GZUtxREVsNThUemZ5aHNzQURP?=
 =?utf-8?B?QS9HVEI3ZzIrTlBZQXNlNHhHRzlHdzJ0dUovRDRwQUpxQXdvRm52bWp6b3By?=
 =?utf-8?Q?d6HBRkAMrkZPJfdQOVLOjCtl1RThyw/9tSdU9Me?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10c7d6e-17dd-4b30-0b54-08d93a2e2e29
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 12:13:46.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eNINbpQ3l9qPvpxsGycDTWlXgR12fTXth9yr2TFVX2kHzuiPKxqgOw/0O1YLDOlP9NKx3ECLHprc6gXUmxF1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 20.05.2021 15:34, Jan Beulich wrote:
> The SDM specifically allows for earlier writes to fully overlapping
> ranges to be dropped. If a guest did so, hvmemul_phys_mmio_access()
> would crash it if varying data was written to the same address. Detect
> overlaps early, as doing so in hvmemul_{linear,phys}_mmio_access() would
> be quite a bit more difficult. To maintain proper faulting behavior,
> instead of dropping earlier write instances of fully overlapping slots
> altogether, write the data of the final of these slots multiple times.
> (We also can't pull ahead the [single] write of the data of the last of
> the slots, clearing all involved slots' op_mask bits together, as this
> would yield incorrect results if there were intervening partially
> overlapping ones.)
> 
> Note that due to cache slot use being linear address based, there's no
> similar issue with multiple writes to the same physical address (mapped
> through different linear addresses).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

As indicated before, this is an issue which - afaict - would be a
security issue if introspection was security supported. As such I
find it highly irritating that this has now been pending for well
over half a year (counting from the submission of v1).

Jan

> ---
> v2: Maintain correct faulting behavior.
> 
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -10073,15 +10073,36 @@ x86_emulate(
>  
>          for ( i = 0; op_mask; ++i )
>          {
> -            long idx = b & 1 ? index.qw[i] : index.dw[i];
> +            long idx = (b & 1 ? index.qw[i]
> +                              : index.dw[i]) * (1 << state->sib_scale);
> +            unsigned long offs = truncate_ea(ea.mem.off + idx);
> +            unsigned int j, slot;
>  
>              if ( !(op_mask & (1 << i)) )
>                  continue;
>  
> -            rc = ops->write(ea.mem.seg,
> -                            truncate_ea(ea.mem.off +
> -                                        idx * (1 << state->sib_scale)),
> -                            (void *)mmvalp + i * op_bytes, op_bytes, ctxt);
> +            /*
> +             * hvmemul_linear_mmio_access() will find a cache slot based on
> +             * linear address.  hvmemul_phys_mmio_access() will crash the
> +             * domain if observing varying data getting written to the same
> +             * cache slot.  Utilize that squashing earlier writes to fully
> +             * overlapping addresses is permitted by the spec.  We can't,
> +             * however, drop the writes altogether, to maintain correct
> +             * faulting behavior.  Instead write the data from the last of
> +             * the fully overlapping slots multiple times.
> +             */
> +            for ( j = (slot = i) + 1; j < n; ++j )
> +            {
> +                long idx2 = (b & 1 ? index.qw[j]
> +                                   : index.dw[j]) * (1 << state->sib_scale);
> +
> +                if ( (op_mask & (1 << j)) &&
> +                     truncate_ea(ea.mem.off + idx2) == offs )
> +                    slot = j;
> +            }
> +
> +            rc = ops->write(ea.mem.seg, offs,
> +                            (void *)mmvalp + slot * op_bytes, op_bytes, ctxt);
>              if ( rc != X86EMUL_OKAY )
>              {
>                  /* See comment in gather emulation. */
> 


