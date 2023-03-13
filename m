Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876CF6B7A40
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 15:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509314.784845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbj5p-0008Gq-W0; Mon, 13 Mar 2023 14:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509314.784845; Mon, 13 Mar 2023 14:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbj5p-0008Ej-T0; Mon, 13 Mar 2023 14:24:05 +0000
Received: by outflank-mailman (input) for mailman id 509314;
 Mon, 13 Mar 2023 14:24:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbj5o-0008Ed-Pz
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 14:24:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6245c387-c1a6-11ed-b44f-930f4c7d94ae;
 Mon, 13 Mar 2023 14:53:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8100.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 14:23:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 14:23:46 +0000
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
X-Inumbo-ID: 6245c387-c1a6-11ed-b44f-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MA+nzixJQbPPK9gS+9hzcmhfXVGnaqdIuUwqpuVpOHX00WNbKY/P8zxc7/sNGp/cPpqb+WcpwKDtEudtzbvCUl9O6Z2uh9ZCEi4lwlGrEVDzXqXSAh3DH3jEEEvqtaaIp8O/WLEPuyo5amw1uriIUeK6X39yUYg/bonEViwOZsC1qmu9/1qxL7LocwCKkaKc855w7qebq68Bre1bmxG0F03YCvVjtO7kwyaggORpgMgVItlbIhiDwjGXpIS7lm/QJllQNZYoxL5eCExbNZniLl3tazRl95xP/30j0rojPTuhwToX7DvThCMNNh5qpmaJhQ+4yGf6e/VtBNn343ROmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xc8jSToByFxjPb8Ppsv3tXE55Pzuk5COE9TF1MPLe3g=;
 b=MKOpOLg+WYknri1lDV2SWMpE0vQtDI61h6OvhfsfiiltmoDTGdSQmYcpywhRAmwSNMJ9oSMPR5h2Pk9y2FXDq+2GcNaOF+0ee/RcPQkYi1J7/R3+cyQ/0uoO3wqDfVhtVOtrR3iTPs/QDDicjdiyXE7NXkjwoFjEW/qyTAtFqb+96mE/I8k7W2W+rW/ZVf4JllDjnMsr8rbgkI6JR8xeGEOhZ2IkRFt3/XDsXjQTPc0mUjTA7aV1ul7gWVIQHcI4hbaSIn5fxntLaRURiE0FvMQZKTyo2piAa9usZeUJcSC42W1tzEaeRDN8PBjmYt0pVxiuiE5e38GvZwQO/9YwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xc8jSToByFxjPb8Ppsv3tXE55Pzuk5COE9TF1MPLe3g=;
 b=fuAmXTaVhvCR0EnGR+t8hsz7NQNoqKniJ9STwlnantwRKhObSOqra11t8pqW6L+5gJYsFx7t+4oTgr8hcA4E5Y60UEo5Y8KmzoQ5ANfaXEZ9pZ33yuaO3X5RZAy4NBy1+RP/HTY1HIPJsZuaHrpckdF4fEn7tF1Qrbyk4NLK8ml6782ZGPd4uZLSLOOuvaWx0fv3epY5DcJNr+7foIySAzs1mrUs2o4qDm2T4ISTNNsan381ozVVI2tRhFxY0+agmSbBj7V15F/q7sieCgqQrQ+1oJHBDldE2VnhUB/Caw4oByvdr7/O7L6LWwhDb0eMYERrWfdbgHPIjy/QXWIXUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a0c48b3-d84c-d738-70e2-3c1d4ee700c0@suse.com>
Date: Mon, 13 Mar 2023 15:23:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Ping: [PATCH] VT-d: constrain IGD check
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Kevin Tian <kevin.tian@intel.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <52cdcad9-cd21-1132-ca9f-ba8092d649a8@suse.com>
In-Reply-To: <52cdcad9-cd21-1132-ca9f-ba8092d649a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 050f04a2-bcd3-4ae7-4af3-08db23ce8e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JDegeVpdlq3LGlMop9nVTFj3EjDAonaHO2EfH1OcrdtddH43xnJ5KEVpZzZhK27a2IhIrniS0efSbxa/NkfTwfojoLSPndQjjAAUUfli5V7AIWcBAnHf+YMQwai/q9WcCOTyb2R3DU8LABbOSMwiMrZDmTqktGNZDggFp2Wyyy88S2TG3r1QYpaKUA9wK4OgaI5OV3ZTXrl3NEr0QM/zbtEcpzU6AK+4I1Dz7p3MhcKVkzpCxmcYc5I8QVv5rJvV2xZKpWMkay/8cszygitN2NXq99r89Vk3fmcMlCP2gbKpfyJB7p5Dk0JyFRjZrSJ8XdnxRG0fEISREp9ZnOVtEIemJq7jKAH0ZcP4e4dSE5DPBB6KlzQ2xqMic1X2mSkGHnEHNlaNkSmDlcQZFyJFaIkNfaMOWFBLHk5PKr9+w51eFayAdYFUu2fdPmJA6rr9egIWAhsz5NmQ/BGZqpzsDmb/bUjVyOUR4+WzyFlJrfH5ggkZuXzZpOTOcK0JoZVOowHi/NtOCH6++b1XRG6O9b2YK2bpR97vjfIut2h/nDDcjg5RhNNc8jUlOqMwTTy0r5VmfH138CnTU4v9Xp63VVQiXGPHsNKOXGjL2dSJ1vadDF78PyFDrnCd1lia0Sgn5Z+zarpa3y7Q++fMiYnOjqNqw5FQsETvfc1JXqi+8Si5O6q9nr4hBYhqvR2N9VA/O8FPYVwtw+8LcGSsjJJvPj3ZWpJlfim+Nau9yx5/RI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199018)(86362001)(38100700002)(31696002)(36756003)(2616005)(478600001)(66476007)(8676002)(4326008)(66556008)(6916009)(66946007)(316002)(26005)(186003)(53546011)(6512007)(6506007)(31686004)(54906003)(6486002)(2906002)(5660300002)(8936002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0V2TFlIM0ptbXJYVnlSSWZHZUJ2a1A5b0JNdm1mMlJyQXV2a2xHaVhNb1BR?=
 =?utf-8?B?bGhOaVpJei9BNW9yR00xTmN6bEtjVjV3SlBVd2xkWGpzUU9HcjBxMWlFb3Bl?=
 =?utf-8?B?dm1lQU56SU5OWTdsQ3h6cm14c1JVVDNQM21Rb2Y5QTdRK09yeGJxMDNoeFE2?=
 =?utf-8?B?L1plbGpmVm9BN0xIQWpIcGl4NjJzc2duNmRkN2lYNTAybnk2V2o2RlcveUdn?=
 =?utf-8?B?a1JWR3lERUVieVNiZlJBVEJ5V2JSTkdjYWtSVjZRNDBUU1hpcHdPcUEyZjJo?=
 =?utf-8?B?bWdUMWNCcUVLOTBsTy81c3JxOFhqUlpsTEpzcHNxNTdpZjNvTE9pSmJRc3JP?=
 =?utf-8?B?ODMvdDN3bldBaUJPTnkwMzVsZmxvSnJvS3FXMVhiYXVod05aRkQ2UGt2S1NO?=
 =?utf-8?B?ZEFiNm5NWDR5bWNHd0tSelo2M21sRzY2WExCYkE4aXU2MDlQS0VhRFhYdEtG?=
 =?utf-8?B?UDdMcmVKbzZRZlE1TmpzVTBjanZTbmtLZlIrSmlKVXJKT0pMSUZqcSthQ2FU?=
 =?utf-8?B?WE1nUzByVzJOVUxSK3FLd0RyZmJDRHUwWGwvR0JCRld2aC9KbC93eXVuUlhL?=
 =?utf-8?B?cHQwbkhPRG1aNEcyQVdBbzZJbnVTc1hFVFFnQk43YXlVYmlqOHNyYzZyVXlK?=
 =?utf-8?B?cTFRTlBkT2xTZkNzd3A2NG03NXpSVXRxU2IzVnNSN05IT1J4L1h6SklmNGRL?=
 =?utf-8?B?dDFaYkFrSmJhWGRpVFV5d3JkT0xDNzV4L1BybzV0WFNlbEdYMjJsd1V2TjNL?=
 =?utf-8?B?NThEcWFvcE1PamtQQnI4RVBndit1ekZNM0sydTgvTlRhRnNPVnFvZFYrTHpr?=
 =?utf-8?B?YU9iTk04RUxJZEVuQ2s1OGxSdWcrcjdOS2ZSKzBJa2xENXljeGdhdDdYQzRy?=
 =?utf-8?B?bmt3a3ZKb1ptVVNqNXVzM2ZCYi9aRDloQzJ5cXNlelRkVzVKaE1zUTNtemZE?=
 =?utf-8?B?bE1haWVQU1FvRVZZNXNaNEdDbDM0cEpBU0cwSEd2Z2w4dVRwRzZuVVR5TXNR?=
 =?utf-8?B?dVdoT1R5VnlSL0dsTVB3NW1OZHVyVmJ0UVNPcytwcmlTaXFzOU1ITUhwNzZR?=
 =?utf-8?B?aGs4TnJZM2tNSkdxeGt0TElVTGR0Z2ljakVrRDV2UTRmRy96b1NqekxmRy9F?=
 =?utf-8?B?TWNRcVJoQUtpNzZ0eU12RzhUVjVwVVNySTYxZUJrNDhkZkR3RUpLRDE0NmRR?=
 =?utf-8?B?aVAzTGZoTnBnMHhwYjFpSHZFZFZOLzVGNFlYVHUwbnpBcWE1djNhdVlwMmhS?=
 =?utf-8?B?TmJucVRWcmM1Mmdxdk9MYzRvSXZhWVpwT0k0c2dQaHJrZERkYUNUMDkyck5D?=
 =?utf-8?B?OXB2Y2Y1RWdSSlJUQThYaS93VkcrNnpyYmJVNllpR2RNYjZEYU1VTWlZKzJv?=
 =?utf-8?B?WGF6ZWJWQnBQWmJTeEE5TnVYWWtFUlNjSkVpOXRrNGFJMnQvL0krSSswdmZr?=
 =?utf-8?B?ckhXZ0VQejI3R1RqTkFJTVBlMVVnc1BMUWJlZzQzQ2czd2JQWUdHeURiQlFG?=
 =?utf-8?B?V3ltdThUV0VqWW40aHk1MExEVkRLa3ZOZkpZTmg4K0ovcjAzZmhVaWQzbGxm?=
 =?utf-8?B?Nzc4b0VLK2VLaFNHNGNjSERBeDIralRTcFQ5OWpVNnBIR2NDZmNIZlZYTGhD?=
 =?utf-8?B?MUFYZ1VlVXdzUW5TTlhFOUM5TDI3N2FLU2x0ZnhRb1Bzek5mVmpTOEphUUQ3?=
 =?utf-8?B?MStzdENPVzhadys2MC9VZHIwUitjN0RJdXc5U3ZtdUhTSDM1b3FCVFZlbXNH?=
 =?utf-8?B?ejBjNy96a3FPOEYxUWlMWDZDUjZIVU5FVVoya0lHbmtoS0Y4b1ZXeGVDamZl?=
 =?utf-8?B?UVRjb1RKQ2VRSTdCb0NyVkQ3L0IwOE9VN3hrWGsvRDFydmJ3YkRUeUVaUlBv?=
 =?utf-8?B?ZlF2ak1vVFVJb3lOT2pjVXZ6ekxVWDRMaWFWREc0eTAvQUZkalAxTDlSQU1U?=
 =?utf-8?B?ZzkxQ3JkUzEyMzBSVVNtV0pkbE1CaitiaFA1aHBMZTRKYUQ0NkR1dTlNMWQx?=
 =?utf-8?B?UW9rM2l0Mlh2TXR2NTZPeStYWXVBWE52RGhoK00wM0RJUit5UDZzWHd1YXVx?=
 =?utf-8?B?NGd4dHlTZmxyT2pwY1MrZzU0NzMxOUc0WnR6RnR2V3VDcjdRU0pOQ0xScVYr?=
 =?utf-8?Q?rghjcEENUv331sSOpCP74KEUO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050f04a2-bcd3-4ae7-4af3-08db23ce8e15
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 14:23:46.0333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5UjgscaxPwIDeB7aek/4Fq+ZLK3EtbQnlg5BmdYgWCuY7M8pVX2p8kBgUpBSAo4/okX/n/egzWL8Hm8ugSkfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8100

On 28.02.2023 10:51, Jan Beulich wrote:
> Marking a DRHD as controlling an IGD isn't very sensible without
> checking that at the very least it's a graphics device that lives at
> 0000:00:02.0. Re-use the reading of the class-code to control both the
> clearing of "gfx_only" and the setting of "igd_drhd_address".
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Kevin?

Thanks, Jan

> ---
> This way we also read the class code when we don't really need it, but
> I think that's tolerable, and the simpler logic is preferable. The more
> that with Marek's proposed patch, adjusted as suggested, we'd read
> vendor and device IDs unconditionally for all devices (enumerated for a
> DRHD) anyway.
> 
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -391,15 +391,12 @@ static int __init acpi_parse_dev_scope(
>  
>              if ( drhd )
>              {
> -                if ( (seg == 0) && (bus == 0) && (path->dev == 2) &&
> -                     (path->fn == 0) )
> -                    igd_drhd_address = drhd->address;
> -
> -                if ( gfx_only &&
> -                     pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
> +                if ( pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
>                                      PCI_CLASS_DEVICE + 1) != 0x03
>                                      /* PCI_BASE_CLASS_DISPLAY */ )
>                      gfx_only = false;
> +                else if ( !seg && !bus && path->dev == 2 && !path->fn )
> +                    igd_drhd_address = drhd->address;
>              }
>  
>              break;


