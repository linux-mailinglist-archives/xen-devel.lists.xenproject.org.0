Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C94B23800
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 21:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079144.1440114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uluV5-0004qw-R8; Tue, 12 Aug 2025 19:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079144.1440114; Tue, 12 Aug 2025 19:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uluV5-0004no-Ny; Tue, 12 Aug 2025 19:17:35 +0000
Received: by outflank-mailman (input) for mailman id 1079144;
 Tue, 12 Aug 2025 19:17:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OTH=2Y=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uluV4-0004nW-9Q
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 19:17:34 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fec83552-77b0-11f0-a328-13f23c93f187;
 Tue, 12 Aug 2025 21:17:32 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS2PR03MB9671.eurprd03.prod.outlook.com (2603:10a6:20b:5e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 19:17:28 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 19:17:28 +0000
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
X-Inumbo-ID: fec83552-77b0-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nI+fWWqdkxgg6wPR71Ojz5A2067xg88Cyp4dqtlkXgRD6T1MBZ66D/DNEGpEe4fAu2cOC069tGfHHicJJLB8WUyg/yWg5eO3c+tONmqoZMQWXPaF6MAjfzwd+X2NYNLj25pfHmjyIat4wY4dKsh8GTXai05cTKMqANOcFz4tolufw/k+NFvtfoafNvJXQeh5rQRaERU3U54V9DFNmoMyNUEXqN0viVXOXWkl18VKho0Aoa+8C2EcnFgRSC3I/6PGd+EhGamgYHxOtdTdK64OR1meWm8TPM6zWO82wkZdxKMPejB+3/PLPrWIxG0NpdVN78VHOGVSXCS2/eBed/8ARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8qo+9Nn7D8YDP+Om+eE1Ge44AFkkk9sqUHYa6TEpKY=;
 b=Zw8xUlZBouWUlghrFbMXkkm+lDciM3OwWxHrK7EJX+6qRprRwaxT4k/sznVVVDux+NWwC7NZwQskP7C8Nd6EWFF6fbWYmN/+sF0irir2be1Pt7xWlHuGSqXKFux7ov2yKOh/SHRXR0VipaW7inAdcAbOE8mOYhy/JvZOf/ZOlJd41gh3g7eXUSJhstiT45aofAwrMmkvunEwbVdNtUSxgkxm9zhAzSCG8SeECOP5CCDckoqaLqlxwo79recuvS7tLx0c2El/KEZHgung9weg5SRFdrhiMe21BpUt1dNsfzxTUM6VsHnuDoIQ6o0fezBmjtkiogtPfTf65VyWeSQaMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8qo+9Nn7D8YDP+Om+eE1Ge44AFkkk9sqUHYa6TEpKY=;
 b=eHc/lj/o5WkhdVgUbDvW6cD1XLBtVK84nv8SZqT1beFN5O9RpxNF0q06r81QNVfFy3E5mwP+09zqC0s14xNsodZaV9vUcsTIEzmSuTAZU41PP2h1cCY7ZUfr5qB/vtcyUvgzjEHn4eyjrlhAfWcgmf05W54bqHiy6b/qxXEGTzDYQIIEMqaMTtb6uv0kKptaCVEsJAK5rzxKPzKeYGst+oAn0332PXOdA0NGYy+LRCTrOw5iieqGFYNGb50aQCH9knWoz/SRD18TjKp8Y2FLo/6M6nYEPg1PeE+OTWGQqgxeNlxBa5vSSDZUivgFao2TdKx7a5j2zmyH9Mq/8jWPhg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] efi: remove unreachable code in read_file()
Thread-Topic: [PATCH] efi: remove unreachable code in read_file()
Thread-Index: AQHcC72+MqlVxdSA/E6jjiAcMI3Ndw==
Date: Tue, 12 Aug 2025 19:17:28 +0000
Message-ID:
 <52dbb5c5c1385b3b9d8522ef308ef15248973368.1755023074.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS2PR03MB9671:EE_
x-ms-office365-filtering-correlation-id: 1e609905-2c08-4628-5639-08ddd9d4e0da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BxGExv//9BSL+JNOvM0PXjRGRHiv6s36f0c2BosUlCS/Y6ZCUtlaWQ3a66?=
 =?iso-8859-1?Q?/Wx9cofsELPmDNXOJ0+gZgli9L3GDGGrgnQ/tpdkwdTc/k+FJLpFFThmJ5?=
 =?iso-8859-1?Q?9socgCHd5F66lP/pn0qwwTfACRNZ8YH0Qmo8Cykxo/LH4+r4FmBJmTXmUM?=
 =?iso-8859-1?Q?1EM4gtPH0yflC5iPhoAOfixfZBp6p5DuhAdLg2p4ezogf+cqVlIfMGp+s2?=
 =?iso-8859-1?Q?i4Aro2LfCLzMJvMDfnVRrRp4smpQQjsOmptSKdIMqWK2RBILBDyFS50ZeZ?=
 =?iso-8859-1?Q?i4zJqf3Ej8YIqyjRCauU43OYYI8HBOyHGwEqAusv24L2focHr8+ziTXx+j?=
 =?iso-8859-1?Q?fB/QO14QsR8El4AhGtjV4wCrD4wx5R4CCC4UYq/It7qN2XYx8dwg/WtkgB?=
 =?iso-8859-1?Q?GZu3nrKA4meNWGHHj9Wg5iKZB2gVdRv3zlyDiYMtbxxyMKjBAzF6DEO6k3?=
 =?iso-8859-1?Q?kSM9+FV/P4SB9Z1GecoVbCVnY6hE4ubDXwDu3pN9/M7EkHIogD5kgYX6Uc?=
 =?iso-8859-1?Q?/9j7G7XOYmpuPW3nz8v0M69M8OLp64Ekq3T8xA4XxUbgO13Q5yPMTKa0oQ?=
 =?iso-8859-1?Q?EReUe4kWww5DL6tVsh4su3avdiyQv+Qn6URZ8SwIyG1LxqKtV/EvqjbV4U?=
 =?iso-8859-1?Q?IiX43kUQqRF+/nZivqTpNhgRDCCwSX86BsbApZrSPNWnl8SLwOMlGGNRn2?=
 =?iso-8859-1?Q?X1No4TFw38R0rZCvGrzzMo4LLUbYJLgr3NKXZvDXZItqn1xRmusvRyd6YS?=
 =?iso-8859-1?Q?S1yHmOzjU3H700W4v8EJ9MLJgAPdII+s8kcTWxrgRaCrxY97Yu6tmlXQrm?=
 =?iso-8859-1?Q?uoF8+3Sf79hKG73AofR0kdh2SfZQ0Q+WmmeHSz4eZ//YtkYxagkuiWxzdM?=
 =?iso-8859-1?Q?IjduX2JsNGDflPmKzNl3mFHiOkteXjhUJ3F5RtQuWWbUlVJ7PFaAbm0rZA?=
 =?iso-8859-1?Q?qeFgv01Ybr3HEp54DN9L/Il2M3fxUru8ZEViuBFV7Y93LHa234LdymJ3ZQ?=
 =?iso-8859-1?Q?9x8iDPRFz8Ut3Uh6F4P779R0oHBSNpIlqZ1kCCoOrPesnAMxizybKeE9xW?=
 =?iso-8859-1?Q?ySkxPMz0eDPLjw07JutxwiyTiNHnj7W9dlXN1eGlo6B9OdOQ/xCBAeRhr8?=
 =?iso-8859-1?Q?Xhr0nGALk+4TrbhcRd81FTOtFHF9BjaW8AOhptGxrTwaYU1tQinGa6J816?=
 =?iso-8859-1?Q?ylURRi+IBKzXSicIdfs35W9DsKiJIxHSVInRIDDct0M9TAmXIbJjRIe0Fd?=
 =?iso-8859-1?Q?FnMTjOeTqADTi8SJyI+qDRLtexHeEqbAUfPnpI4QsBuGa05ckOtZZJv6FR?=
 =?iso-8859-1?Q?oPCBPkcQ31rB4EWfHTNraEs3AKdR4CbKP/8EGB5jkGiTVcyq+54Hl9HAzV?=
 =?iso-8859-1?Q?L3nYWTy+CjkaTmo6P7g14TZe/btDnjzwYsAqilTLyvB5oCAZ+vZagf3l4P?=
 =?iso-8859-1?Q?iEXCumfBJiIB8cgB20FtoBJuh4Zu9N3S6RmVbEtMxbpEQRU996Uza94DNl?=
 =?iso-8859-1?Q?ZxW9sPvSVqVTHQ7ivPDwVXpLEUPG5VOipAWx6CNtQBEmUxVI0X85vY8KgT?=
 =?iso-8859-1?Q?k+NiNdY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?uBbTcCr5SZMSpt8RxQLGA3OM3yh0zP47scQ1v+YTR1SpsK/YRnpCYRZwIV?=
 =?iso-8859-1?Q?8IZlB/ZvfSSH0rVHvhvWE8bQ9KFT/8zN0OWsCP1WOnovNAmC8gw631lC4q?=
 =?iso-8859-1?Q?FNoo/K9hinpMK0vB7wsCU48ib1mspGzoffUxl8Td4KI/BOlX237wM7UVqE?=
 =?iso-8859-1?Q?2DjhhnZ+cuNtKpvYGONhIKlTrfSYF5wmcrb81xff4vbn9g+YY7jl87Iosl?=
 =?iso-8859-1?Q?lhfkHA8X8GjTx3VOdnAbX8qdEXoHODa2/mo+5Korwpq4KlRCzZMAB7yZpC?=
 =?iso-8859-1?Q?0k2Di89ZXl/weuDjnTgr6qHWuzC9b3uPS7BbpdgQJajRztKSackfezHUXv?=
 =?iso-8859-1?Q?wVUQxhizcBJ5S7XAPebEB6WUk2c38C8j2Vk8TFFt7NN87EFrsZ9yNK+7gG?=
 =?iso-8859-1?Q?8Q1vGvI4gPVaRtCvgoAcoR5OGwlgCde1jYnbaZJHwOZzFe1HgBP2Jl7/MC?=
 =?iso-8859-1?Q?w+ee29IR1YHbUA8GOLEkgqoupgIgQfNWwA8U8zL+Tw9ogR91V9rk3xaFq3?=
 =?iso-8859-1?Q?qr1a+mpFANnRSqUKwOORdGz/ntrPWHPENH35VWZ5+CBhAAT24qv7Pm20am?=
 =?iso-8859-1?Q?7HBpBZMjg6RbrI/c5T1s+/tD32G7gs7dBSxJTnP2lAV1rMfnnNHJUwequj?=
 =?iso-8859-1?Q?m1Uiz3m1Kvj6NzIWw1KxomsO0bNg1ppiYkii2kMBxM6ZcDs8vqIob+juNA?=
 =?iso-8859-1?Q?/szM0lJe+RRD26duvetGtswnCsMa6rbFWDDyyJCrLuFNYnJnH4bQXR1/qX?=
 =?iso-8859-1?Q?HnjltFRhu9VrzSSXxB5PZDY7GIVZR1beV4Ok21yeBZ5WeGbcpbgMFIRCTG?=
 =?iso-8859-1?Q?sbAg2TtS2ir10RbVLfO26REu+mEG+6QTetEfeLd2jSEVJLslHfClR0XYLT?=
 =?iso-8859-1?Q?jpdXXq4Q9l3lT6DYf3abLa/vEsPjNWl6+JVbhRwQB6DNYLFuQw6KXnNzh1?=
 =?iso-8859-1?Q?fcECIeHB/3OUsCKPy8suFJJ/s0gLbO262mLaRTXHCgHRIQwi/ydhR4XG/S?=
 =?iso-8859-1?Q?6CRQRYTDlqOxdi8ESMK8fwaGu853vRS36hGvPAddG/kU2jdiXdrHN9D8rZ?=
 =?iso-8859-1?Q?vCOQ0nVF1PKzWdKXqTccOmR5PaNcRaoqg9q5aTTm/xKyuqqJ2bGQI8PWTd?=
 =?iso-8859-1?Q?60JvpiJN90Oj942EMY/Xh72lVqdgpe0FtkOpz+RcgMwWHC1b/47pRFbguV?=
 =?iso-8859-1?Q?ycJAlRnFPRjTPNziPUfrNbdcK+C/ftt39sEeItVUyzsxUBK6Jjj2M6SGI6?=
 =?iso-8859-1?Q?6Oh6Qdw6rNvURHYAVwM/U3jM0DfE2vcwtihyk5jBPIX+rWHu/hUEG7h9uH?=
 =?iso-8859-1?Q?vnLJL2ACbNoWbkwqaMLByhdBZJseD7zNXI1VK4q5yXHKPt9qXqAFdr3uOd?=
 =?iso-8859-1?Q?9mo6Gg9EWU8RoOd/dkFODJorii1G7RfCNCDxBKcJVo5JJKATfilxvrFQFt?=
 =?iso-8859-1?Q?TqVzxAmPylSqIkbRRN8NmpBLD34NWdKZJ8MTdpDwcpTXbWm+kjLg6JzfhX?=
 =?iso-8859-1?Q?mx1AY+nN+CeDY/SVdGatqOw7OnVpzlLRXcXjVzU3e9ZgCasrHBJSExhSi1?=
 =?iso-8859-1?Q?eDIrln+Pwk/KK2QkNfToT4waEmWHEEC1xY+wA/iXbKICYRWHpyZWtBtoau?=
 =?iso-8859-1?Q?pxjmfXBUNSLbyzffs4MPfAWalRN4M65p84aq9xRF4W9pOiCKbtW0gq1g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e609905-2c08-4628-5639-08ddd9d4e0da
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 19:17:28.4555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O9SdnWiGFQ3Jp1ZX++6oegkKC7WdXRKNf18Ei2ExSSfe/SJ5YuomPmbBU8Cqd9am+Hzr9AOPkUDe2eY1a/JT+fvFYDXps2kcDEdztlpNPSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9671

MISRA C Rule 2.1 states: "A project shall not contain unreachable code."

Function `PrintErrMesg(const CHAR16*, EFI_STATUS)` isn't intended to return
control to its caller. At the end, it calls `blexit()`, which, in turn,
invokes the `__builtin_unreachable()` function, making subsequent return
statements in `read_file()` unreachable:

    PrintErrMesg(name, ret);
    /* not reached */
    return false;

This also causes unreachability of the code meant to handle `read_file()`
errors, as seen in these examples:

In this block:
    if ( read_file(dir_handle, file_name, &cfg, NULL) )
        break;
    *tail =3D 0;
    }
    if ( !tail )
        blexit(L"No configuration file found.");

And here:
    else if ( !read_file(dir_handle, cfg_file_name, &cfg, NULL) )
        blexit(L"Configuration file not found.");

And here:
    if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )
    {
        PrintStr(L"Chained configuration file '");
        PrintStr(name.w);
        efi_bs->FreePool(name.w);
        blexit(L"'not found.");
    }

The issue arises because when an error occurs inside `read_file()`, it call=
s
`PrintErrMesg()` and does not return to the caller.

To address this the following changes are applied:
1. Remove `PrintErrMesg(name, ret);` from the `read_file()` function.
2. Replaced it with `PrintErr(name);`, which prints the file name and retur=
ns
   control to the caller.
3. Change the `read_file()` return type from `bool` to `EFI_STATUS`, allowi=
ng
   file operation result codes to be returned to the caller.
4. Properly handle error codes returned from the `read_file()` function in =
the
   relevant areas of the code.
5. Replace `blexit()` calls with informative error codes using `PrintErrMes=
g()`
   where appropriate.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1980590118
---
 xen/common/efi/boot.c | 57 ++++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 50ff1d1bd2..ddbafb2f9c 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -132,7 +132,7 @@ struct file {
     };
 };
=20
-static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
+static EFI_STATUS read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
                       struct file *file, const char *options);
 static bool read_section(const EFI_LOADED_IMAGE *image, const CHAR16 *name=
,
                          struct file *file, const char *options);
@@ -782,7 +782,7 @@ static void __init handle_file_info(const CHAR16 *name,
     efi_arch_handle_module(file, name, options);
 }
=20
-static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
+static EFI_STATUS __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *nam=
e,
                              struct file *file, const char *options)
 {
     EFI_FILE_HANDLE FileHandle =3D NULL;
@@ -791,7 +791,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle=
, CHAR16 *name,
     const CHAR16 *what =3D NULL;
=20
     if ( !name )
-        PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
+        return EFI_INVALID_PARAMETER;
=20
     what =3D L"Open";
     if ( dir_handle )
@@ -842,7 +842,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle=
, CHAR16 *name,
=20
     efi_arch_flush_dcache_area(file->ptr, file->size);
=20
-    return true;
+    return ret;
=20
  fail:
     if ( FileHandle )
@@ -850,10 +850,9 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handl=
e, CHAR16 *name,
=20
     PrintErr(what);
     PrintErr(L" failed for ");
-    PrintErrMesg(name, ret);
+    PrintErr(name);
=20
-    /* not reached */
-    return false;
+    return ret;
 }
=20
 static bool __init read_section(const EFI_LOADED_IMAGE *image,
@@ -1433,18 +1432,20 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
             while ( (tail =3D point_tail(file_name)) !=3D NULL )
             {
                 wstrcpy(tail, L".cfg");
-                if ( read_file(dir_handle, file_name, &cfg, NULL) )
+                if ( (status =3D read_file(dir_handle, file_name,
+                                         &cfg, NULL)) =3D=3D EFI_SUCCESS )
                     break;
                 *tail =3D 0;
             }
             if ( !tail )
-                blexit(L"No configuration file found.");
+                PrintErrMesg(L"Configuration file failure.", status);
             PrintStr(L"Using configuration file '");
             PrintStr(file_name);
             PrintStr(L"'\r\n");
         }
-        else if ( !read_file(dir_handle, cfg_file_name, &cfg, NULL) )
-            blexit(L"Configuration file not found.");
+        else if ( (status =3D read_file(dir_handle, cfg_file_name,
+                                      &cfg, NULL)) !=3D EFI_SUCCESS )
+            PrintErrMesg(L"Configuration file failure.", status);
         pre_parse(&cfg);
=20
         if ( section.w )
@@ -1465,12 +1466,13 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
                 efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
                 cfg.need_to_free =3D false;
             }
-            if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )
+            if ( (status =3D read_file(dir_handle, s2w(&name),
+                                     &cfg, NULL)) !=3D EFI_SUCCESS )
             {
-                PrintStr(L"Chained configuration file '");
+                PrintStr(L"Configuration file '");
                 PrintStr(name.w);
                 efi_bs->FreePool(name.w);
-                blexit(L"'not found.");
+                PrintErrMesg(L"'failure.", status);
             }
             pre_parse(&cfg);
             efi_bs->FreePool(name.w);
@@ -1483,7 +1485,14 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Ima=
geHandle,
         if ( !read_section(loaded_image, L"kernel", &kernel, option_str) &=
&
              name.s )
         {
-            read_file(dir_handle, s2w(&name), &kernel, option_str);
+            status =3D read_file(dir_handle, s2w(&name), &kernel, option_s=
tr);
+            if ( status !=3D EFI_SUCCESS )
+            {
+                PrintStr(L"Configuration file '");
+                PrintStr(name.w);
+                efi_bs->FreePool(name.w);
+                PrintErrMesg(L"'failure.", status);
+            }
             efi_bs->FreePool(name.w);
         }
         else
@@ -1497,7 +1506,14 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Ima=
geHandle,
             name.s =3D get_value(&cfg, section.s, "ramdisk");
             if ( name.s )
             {
-                read_file(dir_handle, s2w(&name), &ramdisk, NULL);
+                status =3D read_file(dir_handle, s2w(&name), &ramdisk, NUL=
L);
+                if ( status !=3D EFI_SUCCESS )
+                {
+                    PrintStr(L"Configuration file '");
+                    PrintStr(name.w);
+                    efi_bs->FreePool(name.w);
+                    PrintErrMesg(L"'failure.", status);
+                }
                 efi_bs->FreePool(name.w);
             }
         }
@@ -1507,7 +1523,14 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Ima=
geHandle,
             name.s =3D get_value(&cfg, section.s, "xsm");
             if ( name.s )
             {
-                read_file(dir_handle, s2w(&name), &xsm, NULL);
+                status =3D read_file(dir_handle, s2w(&name), &xsm, NULL);
+                if ( status !=3D EFI_SUCCESS )
+                {
+                    PrintStr(L"Configuration file '");
+                    PrintStr(name.w);
+                    efi_bs->FreePool(name.w);
+                    PrintErrMesg(L"'failure.", status);
+                }
                 efi_bs->FreePool(name.w);
             }
         }
--=20
2.43.0

