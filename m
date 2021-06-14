Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F573A6958
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 16:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141591.261488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsnvW-0006Jf-TS; Mon, 14 Jun 2021 14:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141591.261488; Mon, 14 Jun 2021 14:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsnvW-0006Hm-Ps; Mon, 14 Jun 2021 14:50:58 +0000
Received: by outflank-mailman (input) for mailman id 141591;
 Mon, 14 Jun 2021 14:50:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGyB=LI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lsnvV-0006Hg-Co
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 14:50:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 503f24a6-ec72-4646-9020-06c07d29851b;
 Mon, 14 Jun 2021 14:50:56 +0000 (UTC)
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
X-Inumbo-ID: 503f24a6-ec72-4646-9020-06c07d29851b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623682256;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BXTLdtgZmTJZhikHG+hPyfuGtfTuNiaZX596X8Tminc=;
  b=LViZ42bufbBSQtR81aUjysdQhwZjOKLXGSz9iK/WA8XOHCp55P4rVbub
   XOOrx94Gms3Bwtmjvvd7eVB+UbNM3qNQ9bGHNcyRg0WNow+TKU8oxXPkD
   ERHyuPEdpPeADqhlPYl9bPRZhhRX7/k2tarfIP5rMGGbocSFEYL0O8Qms
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9jIiICgrOBnigWMMlTpt9IplAMl7Sm7q+EGeXutXRt0kv3t74FZUfCJ38CQywAjet/c8lJRAY8
 7gYuhgqrpRIfFyVtVbIHC7Av7OoflPv2sQm9TxrfqLU5gQhM8MAkppSLMZLG6XBJPeDD/kQSL3
 vrVbkvRFVwxENm/6G/u+oGbyZTridSx8rub8uLnPCiFyKktEX4YBBpOWtqeRz8iqXMLrNcKuQ/
 wgBBZlEI3ZRwwNpDDcNI/lF1ifyLWylJaQbPI8vtwqNDEqLpAX4dk2UJQZP+1MgXKHYxYzvxLj
 iRM=
X-SBRS: 5.1
X-MesageID: 47650475
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:16Ct8q36w/3SI4Fs2T+1yQqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJE80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YGT0E6MqyLMbEYt7eI3ODbKadY/DDvysnB7o2/vhQdOD2CKZsQizuRYjzrYnGeLzM2Y6bReq
 DshPav6wDQAkj+Oa+Adwg4tqX41pL2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTopOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpMCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvErf2UIUh6bD3wXklV6vpREnBmcYa+a
 hVfYHhDc9tABanhyuzhBg3/DTENU5DbCtvQSA5y4aoOnZt7ShEJ+Zx/r1Xop46zuNLd3Bz3Z
 WODk1ZrsA7ciYoV9MKOA4ge7r7NoWfe2OBDIqtSW6XXJ3vbEi91aIfpo9Fv92XRA==
X-IronPort-AV: E=Sophos;i="5.83,273,1616472000"; 
   d="scan'208";a="47650475"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4DQNCWzI9ZBd7bi+vZgjJA0/Z61pq4fn+VNb3wIei9qIN0VYzOgUfSDUYXPzhHNPggXfoPP7eAXr9L0kmgpwRHv2btwSaoV4+8A8bo8C+7NRyMl5WcIivXNly866M2/RtQkfJxTPmDTgDbkmjmZfIcno8AIFwZWzxSZEUctoOLdLEns+pAOm1+hrYamipSoU7YlNgzB7MCoDJex0BfNy5RUq5ZqFzd1y0qoFhMQCCpr6bV9NWZBQLTdY0+GEa5AhW80DbL9dfjq2Ubjdwshhrnp46DILH21vIT/nA+KdCriMx6s0w/nIvvTSQPZmaAlyCsdQIqRr7+Sw8Hf6z3Ilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/mfLfjGPmj7/MqpHaqFZy/eLTzP7lPftkwFZLmgMqI=;
 b=Y1LYIo+7PSr4dg+LgvJpn+KabPIzM6m9Ox2/nvrBIOnktIB0+JsEHJoNtfphsVzUSCQjb8ZUAQX8zB/6UMXNUC/8Ozzi6SLpjgTxeEgrWmsHOzkvVbgsmgCnvy7rp69hY3anETB1eYcJBDBiEC6vtZZ/97aITFJmLpevlzBjEkE+ggODSVYph5kRgJGjLvb8Z11ddZ7EpONG9XqU2bE07NE1zPsG0HcIV8C/r+nnuu6GLXWZZwjrzI2wSXWZ/anpIn6cekCk8UqDi59MsVnZXg7mInvlBy+XYYFUOfvxuK79RrvW+WX0OWeJTCEyOri/kxuxPvtsxC3kbawbu2+wEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/mfLfjGPmj7/MqpHaqFZy/eLTzP7lPftkwFZLmgMqI=;
 b=Bk2YIsIwg06stOTkMXtUD9wdMwqED2c6Lso5veap92bSmeIa198OhUYvEvJlGid+fkScLjYIzMne4cFtpAq3gBEJdSJeVnE6b8zP+BReVXQaYsTeOgsiTsFelbf3jrkzQQ5lcF87WjOwoHjvjh6PByjjrq5DMYbx5CcHeGH7sSE=
To: Jan Beulich <jbeulich@suse.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210611163627.4878-6-andrew.cooper3@citrix.com>
 <20210614104716.23405-1-andrew.cooper3@citrix.com>
 <9257fd40-65cb-8b08-7639-00b15dd0aba4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1.1 5/5] tests: Introduce a TSX test
Message-ID: <cecc837c-e261-17d8-a77e-044256d8bc0b@citrix.com>
Date: Mon, 14 Jun 2021 15:50:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9257fd40-65cb-8b08-7639-00b15dd0aba4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f75b76c-2b0b-48c3-6f27-08d92f43cdd1
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5774:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5774C72B6C78E0A162A73E7FBA319@SJ0PR03MB5774.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FrjCaOiUp3+zndS/+KcMfkCWEu2rupBNsBv2MmgDbtKOA/7h2x2p8nEWy9NEAin2z2fhyvh3b0qmedIbtzkRoRCqYrpQdae4u3Soz5wLMy77iQugxa0sTp/d+TLCV6OAv0Ya+EmO5XKr6Dy7C8M5SicjSjL0bOp0gCybWh+TtI9VoOJCsf+HEaM8/K+sJTmMmhoTI9YVV3w0HdZXt5p2W4oQkMTw4t2snJOct6V+hq3J9p2rCLtT4CxAQNhMzNYqtaSLmKwstC1brmzsXeeDpFuxsOyn2wvJO7Um+jQOtzLocGPka/nU/yoqLK4OMdxT2tU6pFtJF07n0rYBbYG6DQ3PnDrBqnBf6G76FXv2PIhF69Sw/mLElx5OogSqBOQXVZZG1sqsEQygPKUs0oyftjhJGhoXoYeWeixgmPe1dgna654tuuMOTROQhaKlZ5N8fqFrSRQkty21JYr0gaZyZmNbEzWg8v5jbVhAZZ2o5ZF/f364/wBdXdufjzOzoAOKNt5lWpqvBsJaEkkNlyKG4u7zuj87KmTIyHgWJZKeYvuCkMLEUxM4iRGcYYNzgSfAtZeauHKPHMCfSdL7jbwQMiZxgZ83unao8IjO3IiwFXyr0cK57ZgAvpw3aKJKMtqsvowCPy0ZT4G+BnheFZ7HBdkInwU4G89H4Dry3Iqs4Xkmm/oNPcLsfGzHlJ8srAXV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(4326008)(38100700002)(66946007)(956004)(31696002)(66556008)(66476007)(8936002)(54906003)(2616005)(6486002)(36756003)(86362001)(316002)(16576012)(26005)(53546011)(83380400001)(6916009)(16526019)(186003)(5660300002)(31686004)(6666004)(478600001)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2hPTkhTUUYvWmtyZ2N2aTVrSGZYTXNnVTNWc2dmRXovNWRab3ZzQW5ldHpt?=
 =?utf-8?B?dkZjOFMzMGtkdklXYnNHZUducVFSbm5uVEdUL1RRenZ5OUtYZFhtaUhCL1lk?=
 =?utf-8?B?UmJQQml2TXBGOVBvQkpsdG12dGtaYmlHUzVoNXhPQVdGUHdSbjZ1L2d1dUdX?=
 =?utf-8?B?alFVVEVtS2tWdmhXY1RabUFHMmJpcFNGd3ZqdU1ZZ0NpbzJmbE05Um9QblBq?=
 =?utf-8?B?b1ZVVkRYT2w3S20rVnNLQktDTlViMXhaRmh0T0tpV2s3d0Rjc1dMYUdTaXFS?=
 =?utf-8?B?aWdIeFExYVBHdjczaW5ONjIwTS9vM3RINDBYR2M4WFNUYWFFZjkyemhoU3k1?=
 =?utf-8?B?c0ZwM044c1RYOVBTL1hzYjI4WDJsc292VnpyakFCN1U1RGQvS2FlVnRQWmQw?=
 =?utf-8?B?djh2UjN1NkJPc2Z1RVAwY0tTQWEzZ1hOa1RKdnhhc0ZDb2ZwTFE1UTUwdllD?=
 =?utf-8?B?NXkyOTF3RTVOMnhuZktEN2NvV0M2S1N1T2RHQTB0WnBHejArYmFRZWNzNlow?=
 =?utf-8?B?NzRtQXV6Tk1qV0tpWEtEY1BPMlFKenZzbXhVRThWVWtNcVBwOStYeEoxTEN4?=
 =?utf-8?B?QnVQTlREQ2F1TXpJcFRXUEJVb2xEYzhxMmVLc0p5ajVNS3hsTWxnbWwxNTZv?=
 =?utf-8?B?dWxtWWxoekVHb3o0M0RoOTMzUC9VOFRDeWZ2UXE4bzdxQ2I4Qmd0bTlteldB?=
 =?utf-8?B?WTlyWnVJUyt2ZXc2OTA0NUpXYzg2SlAwbC9OMUpLNXFwSmNLM3d3U1hKWkNx?=
 =?utf-8?B?bDlOb0hLbytmSk5heTErK1E0SUg2SGFYMHNRbVFTaXk5akhnL0NmWVlCdEZi?=
 =?utf-8?B?K1hTWVBmTVIwRjAyUWVsRlNpS3VSOU01K0tmeDVUNlhQOU4ybTBGdDR4QWt2?=
 =?utf-8?B?N2c0RzJJcjRXNjlYUmxrL2VOTnhRS3p2ZWhDNWUxSlNWbzdBOXh0RzdaQ1hn?=
 =?utf-8?B?dHRTMUtXRllpMUV2NmJGZU5mV3NoQ0xjQWZpT3RoMHhnd251RUw1R2xxM2w1?=
 =?utf-8?B?cUdDRmJldXJVbSt2ZmJpZjlFY3oxTE9uUTlheHAwYzRyTzUwMTh2MkFLZERw?=
 =?utf-8?B?UXMxZWgvaERZcjRrb01QM3pOeVdOOXl2MFFkcmJrUzVuRk9adkc3QnBuWDRw?=
 =?utf-8?B?TlJhQ3JOYjltS0RXcm9IOUxGUGg1bWZRcVpWTjZjYkthdEJnSzhFWFJEQ1NP?=
 =?utf-8?B?WDFFOTVYR0hSczRJOVJlTjVnU0RaODJ3T2g3K1VUQ01aWWtyNThUY3pFVFVY?=
 =?utf-8?B?aUZJdDRabC9KSCtiazhPbHllRlJGd3hKOXI1WlUvdjZQZjA3ZTBzcVVySGtE?=
 =?utf-8?B?WmtJR1hrZWxBcEV2ZUZWdUJqbWZ5b0x4SFhkTkgxVzVRTkpDRFVLWktoa0ho?=
 =?utf-8?B?NlNURG9YbzBpOUtlakJ4RlZHR2krY0dlZGRFa0FTZCs5V0dJbi9HanArNktF?=
 =?utf-8?B?SzJBV24xZTZ6TUM0Z1BEb0ZDMnhteUo0WlJvTVZqSDJqdit4NUxObnFHNUNP?=
 =?utf-8?B?REo2NWliTmNBWm9CdENKcERzaG0wYnVlclk2RnhJV3pzbldJa3RhQUwvSUY2?=
 =?utf-8?B?TUN1MW5qZ2k2VDlCbmg4NjFJNEdlNm10YXA5dUYyV2hHQkx3UWVmSGVXZFVy?=
 =?utf-8?B?VkxKR0RzcksvYnpTWHN0TzZkQ1lpZk1TMHMwaE95YlhPZ0RtZytnZ2N3aTc0?=
 =?utf-8?B?WDIyZ2kwQ0N5ZFJTNWxuYm5aTmc5R3IxeUNJMm5mZXlVTnhaenFxRHNWcDd5?=
 =?utf-8?Q?9Fb6MvKZwsnJilLFFFikAjX9uLilVovxwjP3ozV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f75b76c-2b0b-48c3-6f27-08d92f43cdd1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 14:50:51.5972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1u1OYaLXedUTIBR9Qhlx8IF3hbRvOpyFqE2HyW5LUnp0GcB/izqGb2PxbgwoaQ6koh+hEAFFf6W1eeUe0Qu8hBiryUPaCB0o9kfphNYvQ1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5774
X-OriginatorOrg: citrix.com

On 14/06/2021 14:31, Jan Beulich wrote:
> On 14.06.2021 12:47, Andrew Cooper wrote:
>> +.PHONY: distclean
>> +distclean: clean
>> +	$(RM) -f -- *~
>> +
>> +.PHONY: install
>> +install: all
>> +
>> +.PHONY: uninstall
>> +uninstall:
>> +
>> +CFLAGS +=3D -Werror -std=3Dgnu11
> Is this strictly necessary?

Appears not.=C2=A0 Dropped.

>
>> +            return RTM_OK;
>> +        }
>> +        else if ( status =3D=3D XBEGIN_UD )
>> +            return RTM_UD;
>> +    }
>> +
>> +    return RTM_ABORT;
>> +}
>> +
>> +static struct sigaction old_sigill;
>> +
>> +static void sigill_handler(int signo, siginfo_t *info, void *extra)
>> +{
>> +    extern char xbegin_label[] asm(".Lxbegin");
> Perhaps add const? I'm also not sure about .L names used for extern-s.

Well - they work perfectly fine even with the Clang integrated assembler.

>
>> +    if ( info->si_addr =3D=3D xbegin_label ||
>> +         memcmp(info->si_addr, "\xc7\xf8\x00\x00\x00\x00", 6) =3D=3D 0 =
)
> Why the || here? I could see you use && if you really wanted to be on
> the safe side, but the way you have it I don't understand the
> intentions.

That should have been &&, but I also appear to have lost a noclone
attribute too.

>
>> +    {
>> +        ucontext_t *context =3D extra;
>> +
>> +        /*
>> +         * Found the XBEGIN instruction.  Step over it, and update `sta=
tus` to
>> +         * signal #UD.
>> +         */
>> +#ifdef __x86_64__
>> +        context->uc_mcontext.gregs[REG_RIP] +=3D 6;
>> +        context->uc_mcontext.gregs[REG_RAX] =3D XBEGIN_UD;
>> +#else
>> +        context->uc_mcontext.gregs[REG_EIP] +=3D 6;
>> +        context->uc_mcontext.gregs[REG_EAX] =3D XBEGIN_UD;
>> +#endif
> At the very least for this, don't you need to constrain the test to
> just Linux?

I guess it was too much to hope that this would be compatible across the
BSDs too.

And the FreeBSD CI did notice it, but apparently didn't email me...

I'll try to make it BSD compatible.

>
>> +static void test_tsx(void)
>> +{
>> +    int rc;
>> +
>> +    /* Read all policies except raw. */
>> +    for ( int i =3D XEN_SYSCTL_cpu_policy_host;
> To avoid having this as bad precedent, even though it's "just" testing
> code: unsigned int? (I've first spotted this here, but later I've
> found more places elsewhere.)

Well - I question if it even is "bad" precedent.

For array bounds which are constants, the compiler can (and does) do
better than anything we can write in C here, as it is arch-dependent
whether signed or unsigned is better to use.

Beyond that, it's just code volume.

~Andrew


