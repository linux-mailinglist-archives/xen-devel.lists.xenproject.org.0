Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0919578493
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 15:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369813.601337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRGj-00035O-Tk; Mon, 18 Jul 2022 13:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369813.601337; Mon, 18 Jul 2022 13:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRGj-00032j-Qf; Mon, 18 Jul 2022 13:58:41 +0000
Received: by outflank-mailman (input) for mailman id 369813;
 Mon, 18 Jul 2022 13:58:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4MkP=XX=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1oDRGh-0002Wp-Hp
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 13:58:39 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0125.outbound.protection.office365.us [23.103.208.125])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b928cca5-06a1-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 15:58:38 +0200 (CEST)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1323.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:182::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Mon, 18 Jul
 2022 13:58:35 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27%3]) with mapi id 15.20.5438.022; Mon, 18 Jul 2022
 13:58:35 +0000
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
X-Inumbo-ID: b928cca5-06a1-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=GAEWm03wPPeJV/jtFy2zQEwYP5hcpBdmhHC7h265Dq2/f2wHyRDuvEPPyhJKi0hKxZedkyr3X3eG3w7cBAnEeEu4pXAiMIEmrMbJEJ3ByU00sBPNze9hma3cJ6VVL5aAKgxD06ZjGUbDUQO2/Oo1Jm+Dfpawml9cFOvPyuvVMvFZjYs9DQ8nEPuHWT9chK47+UJJq+gH4ueylUM/n+EFd8EWg+PS8aMPz44MxKTqlf1u6hmqSv7O7rmqVKLrn5G+EDOuvXaTV2LqfJJTNJSVZp9fo4Gq0HlavEv3K9WRk4DX0qzPx2bSyJZJpKnhrOww6e7c8cHEB9vJX5uczu9kOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfgsxtHOgQRRggHd/sEp2IwzSm7ATQj+oNLqHdWz+lM=;
 b=o6YfVnAAFYMPlGW0Q977gEAF+QiyItBC0Nw6yFiE3wC+5+oWevM3nCs5aL2n7RtQu3nOBtcGYnvIZelA3BuYSKlBydgFqe/UPlG1t/9M+2sqZLIGPCMWiyY8gZqhZStqu2rK+6SnsTx9i5TY6KsMd+3qea53W6YcbCX5fe2hck6cSvvWDouv2t+/XZ4uggJmRU3TNbp3ztQSY/vp6TuXWPjSDDklltub+IvpyrAQpuT4XyYJc/CYZEdyx1IDiIQgBfdY9dspvdLsNEeY8D/hVL/xkgmsGY5VEKvJRAFCC4DhENwx/ciBUEAyYgN9Fa3bntogs51gG1sSo5jIZJotAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfgsxtHOgQRRggHd/sEp2IwzSm7ATQj+oNLqHdWz+lM=;
 b=BHYZPhnMvesqXTE55DhDjK5pHgG/HBTt/5aNWw8lWVUESECAOe5WoLuChmTbubihrt5zLVV1Q6VlRD+k7Q4G85Y7GjMtDC9Kv5GWpwgXstmzsuiBsFZs6oywAp0e++OTqAMS8y7R8QCqvAZrSSEKcL/eYuifx74hBHdfDvH8IlrPyeaScL8FX3Fvo/4g8RzK68OxgT0xIXLD1flWa2OLfMHMWd4ZPgl0iu+4rYzhW5fvcgtbXFgEy1gq9Y+MdnJJ8Q5TdvUAB3Mkw54Q1SfVsPC7rW5hDldgmyh7LxOy2jJJk4OFlzKDBAtwnsKg9gIuZ7BCMAId1sMlMZlC8Mv95w==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: RE: [PATCH v1 04/18] x86: refactor entrypoints to new boot info
Thread-Topic: [PATCH v1 04/18] x86: refactor entrypoints to new boot info
Thread-Index: AQHDrne88XyYXkgxTAt6TFUls0rRYAHkVRHErZp+x6A=
Date: Mon, 18 Jul 2022 13:58:35 +0000
Message-ID:
 <BN0P110MB16429A1A79CCA746EEE720F1CF8C9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-5-dpsmith@apertussolutions.com>
In-Reply-To: <20220706210454.30096-5-dpsmith@apertussolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21e352e3-6f05-4355-2339-08da68c59bac
x-ms-traffictypediagnostic: BN0P110MB1323:EE_
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cOdVEyIGcE5DsJomLy8FuojyDW5Y9WHN5EQvVmBtj7VfrcVJ8EAzLXfuqtm5BGhFkm5/hv00Y1BGp/b1h942I+0CIQcBz6UIcHi8t8R62l6jzyx7OXlprqVsylB9cAdRjar0r/PIyR4C7uquAFnbDhpkyTd7IZ9D5LETVZclt7Q8JnHG7tgFuHIPiW5WjajTgmfVcNcoSBavIOJ8gJCrh2iAIUWv7PYNrea2fRgL1W0O7VtpAd3fo47V6MObzKtNrmwW6/RHxFocSDh83d4Yey+yqm8AC0tgErWXOHbfbYF319YIN1OxukZaR3/2JQOd0+YlrBScJFfRg5U1r15s8AlGggFqXxduI1bWVXN6bBjkCSmvE5e0mQRXnwbUHdWC88N26TltNxIyqPwoVkm8gohicIlEsu3lOqtYA1ukQ/z32S8j/fTiQYc6zMlo5Kuw3jg7tNHJjIkDvjNWI50N1OIHW6w/S2S1ymDq9WAX9gULhB7epegv0OrR+uHkBODFFtRquZhYR5p1yzThpnEp3/wUDyMz3vJ96nC+oWbPFbFx6WjEYmvQF2u25sciqpB7+Sy/m3MaOmptizX264VHnpokJI/v7WW47uI3rHTPFMuciIeAUGZgqBZrSP1lXVPoRN2d2O5FBr8yy8j1JkX3mbuyx8HTJlKxkGWg6PUYZoGWQFE2fHKw9dqNmtMVSZaSC8S0akp1bWIUB9flV8Y5AQO/0TrA/VC6NokVFlUrqMKaYWrqZNgb3NHSfAm22Tdu
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(99936003)(64756008)(2906002)(76116006)(66476007)(33656002)(66946007)(52536014)(4326008)(8936002)(9686003)(66556008)(110136005)(66446008)(8676002)(5660300002)(71200400001)(6506007)(54906003)(86362001)(7696005)(498600001)(55016003)(82960400001)(122000001)(45080400002)(38100700002)(38070700005)(186003)(83380400001)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 b1YkxT8rxHNJZJBPMgcfiUs/w/LOtrMoBwZ05emJbaT5Ev9DXzUVBuvMtVx45UFYEOi8vhoU2U2YPVdiXr5zfZcEAHoHF1QS3w99/Wyfk3BAeSVUEWar56eA91CiytezmyPLNSxMMEiQ0h31VS8aSdIHxhF86kPnL2ab5dAX6dynsEfW0EnFg/xL6Vw2XY7kDluILO//lITfMwRr/ThjRfwlkCnukUgFArxt3XuN/izytOFDR5VB0cNmbH/wTQ34oOtKFeh3+i5Lr3IL/8a6tSzF7H1NjC9JwYlOaZ3fAF5F4Fo90ZMqyoRi1EN2HaFuuI108VRNtmxGuV1cIwdk7vnGK80xAbC6VNZD4Jjyvd7e8ZVcCnaCn1Tg4bWsxr1afSWhrWLx2cz9wgld22gLpndd9UMOYE8g+theV7RTeLN099bwuKcIjpGEsrSxphMOi2Fy6UO4iOqtYfHekiotsLDMx0WWwVzPBxTw9ZhCl0o=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0077_01D89A8C.F110D220"
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e352e3-6f05-4355-2339-08da68c59bac
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 13:58:35.5785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1323

------=_NextPart_000_0077_01D89A8C.F110D220
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Daniel,

I hope outlook gets this reply right.

> -----Original Message-----
> Subject: [PATCH v1 04/18] x86: refactor entrypoints to new boot info

> diff --git a/xen/arch/x86/guest/xen/pvh-boot.c
> b/xen/arch/x86/guest/xen/pvh-boot.c
> index 834b1ad16b..28cf5df0a3 100644
> --- a/xen/arch/x86/guest/xen/pvh-boot.c
> +++ b/xen/arch/x86/guest/xen/pvh-boot.c

> @@ -99,13 +118,16 @@ static void __init get_memory_map(void)
>      sanitize_e820_map(e820_raw.map, &e820_raw.nr_map);
>  }
>
> -void __init pvh_init(multiboot_info_t **mbi, module_t **mod)
> +void __init pvh_init(struct boot_info **bi)
>  {
> -    convert_pvh_info(mbi, mod);
> +    *bi = init_pvh_info();
> +    convert_pvh_info(*bi);
>
>      hypervisor_probe();
>      ASSERT(xen_guest);
>
> +    (*bi)->arch->xen_guest = xen_guest;

I think you may have a typo/missed refactoring here?
I changed this line to "(*bi)->arch->xenguest = xen_guest;" to get the 
patchset to build.

The arch_boot_info struct in boot_info32.h has a field 'xen_guest' but the 
same field in asm/bootinfo.h was re-named from 'xen_guest' to 'xenguest' in 
the 'x86: adopt new boot info structures' commit.

What was your intent?

> +
>      get_memory_map();
>  }
>

Thanks,
Jackson Smith

------=_NextPart_000_0077_01D89A8C.F110D220
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

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
PUJSTy1EUzAyKDcpLENOPUJSTy1DQTAxLENOPUNEUCxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNl
cyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXJyaS11c2EsREM9b3JnP2NlcnRpZmlj
YXRlUmV2b2NhdGlvbkxpc3Q/YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRpb25Qb2ludIY0
aHR0cDovL2NybC5yaXZlcnNpZGVyZXNlYXJjaC5vcmcvY3JsL0JSTy1EUzAyKDcpLmNybDCCARMG
CCsGAQUFBwEBBIIBBTCCAQEwgacGCCsGAQUFBzAChoGabGRhcDovLy9DTj1CUk8tRFMwMixDTj1B
SUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlv
bixEQz1ycmktdXNhLERDPW9yZz9jQUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlm
aWNhdGlvbkF1dGhvcml0eTBVBggrBgEFBQcwAoZJaHR0cDovL2NybC5yaXZlcnNpZGVyZXNlYXJj
aC5vcmcvY3JsL0JSTy1DQTAxLnJyaS11c2Eub3JnX0JSTy1EUzAyKDcpLmNydDBVBgNVHREETjBM
oCwGCisGAQQBgjcUAgOgHgwccnNtaXRoQHJpdmVyc2lkZXJlc2VhcmNoLm9yZ4EccnNtaXRoQFJp
dmVyc2lkZVJlc2VhcmNoLm9yZzBPBgkrBgEEAYI3GQIEQjBAoD4GCisGAQQBgjcZAgGgMAQuUy0x
LTUtMjEtMzE1MzczODEzMi0zNDMzOTAxMTAzLTQxMTc4ODYyMi00MDQ1NTANBgkqhkiG9w0BAQsF
AAOCAQEAYaBBvBGuhKlhJ2O6JBtcYRW7CYREO4+CAep40ordLIS0gvnKuE7A3a+4YzJpqKvfSbQd
+dQzeaZNz3kTpwJlZh5fJb/Bo7zQWlvDU1p/rr7a2tAnWNqSVlgQrvAk35TLqlGAmwo8tgQ1jxc/
JAkWg5Pqks6IKyO8CwKuIEOqL7vxN/THcEvpJvLnhRxm/ARosCDW1x0XTwivA8tS1AVvxxcpQAXS
uo/q3WNG/XDC8oO6oJLZfnpl9LiDBrsHEzDaR3Ct3XCR6rJ4ezjwFjH4SEOWCWeWsLhk+uoOgAx5
4cKlGpprXf5oje+0nSz1bAw5kaGD8k83rXL75YVcIuRTlDGCAskwggLFAgEBMFgwQTETMBEGCgmS
JomT8ixkARkWA29yZzEXMBUGCgmSJomT8ixkARkWB3JyaS11c2ExETAPBgNVBAMTCEJSTy1EUzAy
AhMsAARwT/LbBVtfmneXAAcABHBPMAkGBSsOAwIaBQCgggHHMBgGCSqGSIb3DQEJAzELBgkqhkiG
9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIyMDcxODEzNTgzM1owIwYJKoZIhvcNAQkEMRYEFEJrZzwY
BJiQgw8BvVhV8FPByQX/MGcGCSsGAQQBgjcQBDFaMFgwQTETMBEGCgmSJomT8ixkARkWA29yZzEX
MBUGCgmSJomT8ixkARkWB3JyaS11c2ExETAPBgNVBAMTCEJSTy1EUzAyAhMsAARwT/LbBVtfmneX
AAcABHBPMGkGCyqGSIb3DQEJEAILMVqgWDBBMRMwEQYKCZImiZPyLGQBGRYDb3JnMRcwFQYKCZIm
iZPyLGQBGRYHcnJpLXVzYTERMA8GA1UEAxMIQlJPLURTMDICEywABHBP8tsFW1+ad5cABwAEcE8w
gZMGCSqGSIb3DQEJDzGBhTCBgjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqGSIb3DQMH
MAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAhowCwYJ
YIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEgYB4h328
rJ4q8rg5L8sVKv49pcH8YhEQ+5/TKKoEcc7F6AqAPpm7F9w4gVxtPqkNWmfApdG7Rfb7Z98mz0Av
ri9DOkYkzvI7uP6wvy56yKuj0aaYeCoUhytR9E2/p9WO8WQC52Jg8KuYnLtGsLXETmmRbBGHqBls
YNKyovrXqDS4EwAAAAAAAA==

------=_NextPart_000_0077_01D89A8C.F110D220--

