Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B1C36DE52
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 19:30:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119512.226015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbo0M-0004iJ-70; Wed, 28 Apr 2021 17:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119512.226015; Wed, 28 Apr 2021 17:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbo0M-0004hu-3S; Wed, 28 Apr 2021 17:29:42 +0000
Received: by outflank-mailman (input) for mailman id 119512;
 Wed, 28 Apr 2021 17:29:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8fo=JZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbo0L-0004hp-1K
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 17:29:41 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcf63884-3125-4396-849a-e27c19f101ff;
 Wed, 28 Apr 2021 17:29:39 +0000 (UTC)
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
X-Inumbo-ID: dcf63884-3125-4396-849a-e27c19f101ff
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619630979;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HnPrBoiK4M37W+OPi5MQpi4GdfpP/ImB8aXe9ptMp1o=;
  b=HF1x+0wbyJeL/DPQp/csbjthegUVJKZLv6x3/S+zdXHqatnnRP662KWX
   fnbykNf2eBGB2010gbY11tZiNi+edNCPAEns1kCB1Vr8Jd5hned8h85Jy
   UQ7wRrqD0Wn/X36M60mVifTF3QE+/7XDuoUBZFuLvrM1L8QGa5mslUnvG
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PuFU5jf7FqKEKT3lmqSNZ2DKcXPRIePr4BbqUtZhGTAQZpvA+EbJI1h0yDHpxP3/2f6PLnjzI1
 WArNLCr1LNF9K6EMO2heaAUDatQG9e6TNG/1f1gHPxg5LHoNR1WpuFoWvEY/czjwVFwRbe+nPY
 89OkEVvDFMlo38QK3GEXHqhxitUqBXLrqxMVPnCOtBpdIgNKCfmq381Nqo1HNxEg1ky3Di985Z
 9uUcC7DysRWBuaB+LnyNHNU1FVw1iZWHuhqjWrxrVecybiAwEO0LN6Kq5/BJ0J+esbvVw6x+dw
 NEI=
X-SBRS: 5.1
X-MesageID: 44140935
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JqDUuK5v4bMlGizT7APXwTuBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3m0z/5IyKMWOqqvWxSjhXuwIOhZnO3f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7/yDNXQRhue+Vc6W5Ce2SmO2lXYCUDOpYjDp
 qb4aN81l2dUFAadN6yCHVAf8WrnaypqLvcbRQLBwEq5WC15FvF1JfAHxeVxRsYWT9UqI1SlF
 TtqADl+r6l98iy1x607QTuxq5Lk9jswMYrPr3ptuEpLFzX6zqAVcBadJCp+Bs0p+yu71hCqq
 iynz4Qe/5dxlmUUmW8oR7G0xTt3jA0+xbZuCGlqEqmm+PVbnYXDNdAmJJ4f3LimjsdleA56o
 1n9Sa4sIdaFhzJliiV3am5azha0nCajFBntMx7tQ0nbaIuLIV/gKZawWZuVLAHJy7+4JBPKp
 gSMOjsoMx4XHnfU2rUpQBUsaSRd0V2JDiqaG4YtPeY1jBH9UoJs3cw9YgkknAM+IlVceg+28
 30dqBhlLR5RsQLd65KBOAYXcutCmDWKCi8Sl6vHQ==
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208";a="44140935"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bl5cnXMdHdgDrCMDJJ1nCOk4JupLsLXGjry2jgcABjit721zKy4fxkPNB5zB46ofvaR5g0W8fi9VLUKOqV9GSnpExfatOFdQK/zY7T2BmBmHAw8BYmshJluf90qtLg4/a9rVFJWZHOc8FnYOAZFGQ3FeBR6oCFvKYpZOVIK0LH6QF9nB/2B0VadjA5TD7+o9SkAJJbSnmQ/BOEEEsCjCaR68A+X4nqFAHna1oAb0/sLwhy8c46Zg0iDOGW7AcSfso+rdTUgDkXfCnRHYv8g4U0eB6rNtGVtWIDQvPoRW2zSJhNQnacFNd6g33mjj3l5kmo0T7138J/g55bM4NJfjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCz4otgMugYERjOoAomc5RppSGjfrhSdAplMcZqRPeo=;
 b=di1RtvUf3yc8IhSRXAT54gBDtLOx2c67djpG6SFMvCDTBXTA3TAF7FADYsfDdU5Bcb7TiBSNq9DsW2DI2ryNgt6Te+YHXZOsb0SxLN9ejhtLUv4sbmLSrUfXvveWn0bVA4dhVrROvioWiTDNI6nA/S4FLQ84IEncPiRmF20VlreNwR2xynCNP7mQIsdFsWTFPSDDzUFijRvhBp6ReqCT76eCAxtQH9s/K1p9nLdgxdEpUK5VUnIbhQOCjjujoEuf19S3H2SSO+EYTZL/Ks0BfvZYQatBVZo/gRRkeOiaDkIrXLvglqlCd3/0z9QEQDUr4QnYhPeRfCVCLk9WfmGybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCz4otgMugYERjOoAomc5RppSGjfrhSdAplMcZqRPeo=;
 b=sS/islqaImj4qzYNvWVYkfe3tSc+rH2/Adogni/5yU6vvWDO3zpip40fpYyB0GmFy8KRx3aebjQaLdmnN/ZCfHqbdoAOlwplG7U8si3PuoxUMGRSZfunsO9WGrPxbB0fOlY4EEvlNKVeR2tl/xiZlOSGliC5FLCcBtB4lkJnQa4=
To: Anthony PERARD <anthony.perard@citrix.com>, Elliott Mitchell
	<ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
References: <cover.1613496229.git.ehem+xen@m5p.com>
 <2e18b114fc91028459b2d6cbfd0f1204501dfde9.1613496229.git.ehem+xen@m5p.com>
 <YImXfc4oaPgWzkeT@perard>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [SUSPECTED SPAM][RESEND PATCH 1/2] tools/libxl: Mark pointer args
 of many functions constant
Message-ID: <0ba9b44b-1e3d-bf96-2b91-0d85686357b9@citrix.com>
Date: Wed, 28 Apr 2021 18:29:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YImXfc4oaPgWzkeT@perard>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0390.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b68eb0bb-d615-407c-f980-08d90a6b30c3
X-MS-TrafficTypeDiagnostic: BYAPR03MB4421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4421D39CEEBF239086E4DE78BA409@BYAPR03MB4421.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H21HDkEK5Uo130XgOnQdFiuitX3AlDcMfCvoBJo3rNKb0MnLEgHaslnciQePQB97h9arvSL4OKD+Ypph+BsmtdLLjZWp5yIXA9TWAFbEzS4sK7DniX8AWhP5v3Mc69j4tWGXji5rfrfHmiXnkkfWqbu5OTbvSbN3MvYe4lO4DpZgap31dwwXLFZ8/yEBATAAEdceiWikThWz2kpBXSwEHezKf6YXEP0Ls7fX9O1DOkV3WrAuCoUuwDOSnToUM1D47rg2F8EKYYX02mzR9SbH1kJg3q4lx4eKAakIIeYoi+kkKr/4HUqOga/n3M58JEcPWL4/ZtA5J4LfPLRcq2Dn+og5TYTe1Ok1b5BMePI27qwmnjzbw0cda4souSKYMeLCYkIpyl1DA2MbX+aGTTfnZizAagsVlRGKhLM1ecvuxQ6IkQrSCD4FYgqAgZ5KcSyDVe/4lo7qXrDq6uyogs+ST0/AaEKdCok+o54wibMFAahnfp93irFmAKwO8xOL5xVwnqW9HzjKSaZY2pykc3Z1YvPmQqTJC+tTtalqNBCC4NRIUO8EThJ0/q1zTvYfHzy1f8QQEOhMARQdq5RDp/ybXiD1XtJD/4nLY6X4kYSecRgW34AUthxJzFF9iH8MP+sowS/LiBKyw8FyMw0ojBIjwP/T9clFxZRysJbb+BM+EYE1mgukQEnSg/E6u6mwsitw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(36756003)(5660300002)(86362001)(478600001)(38100700002)(4326008)(8936002)(110136005)(316002)(54906003)(6486002)(186003)(956004)(2906002)(31686004)(53546011)(2616005)(16526019)(16576012)(83380400001)(6666004)(66946007)(8676002)(31696002)(66476007)(66556008)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QWF4RnVCemhpUDRKQklzYXB4UzNNZlJ0Qm5DODVBWXBydU5zZWtmZlppbWpp?=
 =?utf-8?B?dmk5ZHc1RXNhUnNmT2lxU3RaL2NxZUd6azRFMU5lcHNFU0ozc3dTanJQODRs?=
 =?utf-8?B?RXhWbjgvalhFNnhob3I5VFdBcWREbGw3bndxOFE4dDVBaytjUWptbWFZYlBz?=
 =?utf-8?B?K0dNdDN0dmRCQ3ErVUdDSy9ydC84Rk1rMHBZZy95WGh4V01veHJnb1I1Ryt0?=
 =?utf-8?B?ZzZ3UTZNeXhnWnIyTGcyS0dnT3ZBdzZEL21PWDZsM0I2OTlVU3FxMHN2RzZS?=
 =?utf-8?B?Q2VkZWNPQjdySEpWUWtRa05qT05wVFlIVW15eFpKM1E0RkJvUEc5aHZuQWFn?=
 =?utf-8?B?dWV5ZElTd2daUjl0ZTBqTk9vMTJPREtmVDJXdUkrNnZCeEtkcE1vdjhIcE5F?=
 =?utf-8?B?NjN4WTQwMHNzRmZIaWg4K2VmcmsrQVpSYXZBbGErZGRQVHV3RHVzRGdsRElV?=
 =?utf-8?B?SWgwbzRpRXZ4cCtnNUFEOHFtNjlxOEZhb3R0c05udkp0eEJKdVpFbVV1SmpL?=
 =?utf-8?B?emtlakMwMmJTRFMvY2p0cXB4ZnpqRzQ3ejBnVzA4dXZ6QjIrNFRWWVVaVFRN?=
 =?utf-8?B?NFNaNG9MNUJHT2NjemI3bDRsaWFKVVBKVGIwaFRpaU9vSEFzZHpXanVYOFM2?=
 =?utf-8?B?MGxhZVEvZVhOY3lwYlFRMkl3ZjJXUWF1TnowT0kzcHlOQ1pyMWVmdVNhV0kw?=
 =?utf-8?B?bEtVdUMwUWRhejJaYnI3aThXcHZxd0pSU3VlS0VFdWp5NHROSkZ2MDZpVTlv?=
 =?utf-8?B?TTJoci9NZGVoeklJUmJaY3FFSzZ1OW43RHF4dVljN3VIbnJ1K1BTTE1KQTZ4?=
 =?utf-8?B?K3RQNW80V1YreWYrSVdrOUhneHRBQmFvT2djK1o3RGVpMCtyMzZTbmRpTjk0?=
 =?utf-8?B?M2lYcWtIT3Jpdi90bUd6eDIyb1JBcmR2RldvUndnUWFqYTh0WnNSanVQdDY5?=
 =?utf-8?B?TjVlQUwvcFFmdnB2NkVXWHVxbkRFMDdER2M4VVNqazRTOGZnalhsajFzVEps?=
 =?utf-8?B?MkQyM2VidGV0Q08xNTJxb2VzTC81a1NuQXFVUFBCSGNIUWh2QzZWZ284Y0pE?=
 =?utf-8?B?N0J6cEFMSFc2RDc0R1FES1krS3Z4NFZxdXpxQUIyQ1RPc3FSMHY0ODZLc2Rs?=
 =?utf-8?B?djhOVzhrQmJNTUFtL2doTGVSdUpIcmtxNkxGcjJENCtwU3F4R2IwVVpCaC9r?=
 =?utf-8?B?bGpLRFJud0F6Y1ZDZmUvZXZJQk0rUXhLeGMwK1JreWpiNlU1N3Q0eDQ4VDh4?=
 =?utf-8?B?MFVOa2J4MVJDMWk3UGE1Ym96czY0a2poc1U0TmwxcWMwcDVxUjl6TkVQbnRR?=
 =?utf-8?B?WTA5S3hEaXE4d1lGb2RNdXZlSEhmMmg5UU84b2tKSlFMSEcxM0ZjWXRVY01K?=
 =?utf-8?B?NnBVcGVJUlZ1c015Z3E4V3FyNDVCYS9KdlF3SG1LbjBtN08ramRjSmpMUFpN?=
 =?utf-8?B?Vk1SQ0FTL2NDSWQrWUNMeG9IajBhMkFRQWJJN2VHV2ZHMTVmemNnY2ZoZWRJ?=
 =?utf-8?B?UGRCckc5MlhrZkI5L2x0Uy9ubXVNeDFVWkJ0K1RuM0FLWFhJYnFCaUNSc0Vp?=
 =?utf-8?B?VmNvNEo4ZTJ0ZVFPNzBmTDZDSGZJYmxxNk9pbXZscXNsaWdXQitnK3Z0aEFI?=
 =?utf-8?B?UWlxYlc2L3Jjekl4RHZqQS9ZUk4xbkdPU25iVmduUzBsc2FvbGEyV2poNjRO?=
 =?utf-8?B?SHo4T2RKY2hVUGV6d1JBaStibjloSUlqRmVGYnRWTGlXbFdkaVRhV3k0enR1?=
 =?utf-8?Q?swUbLDtVSzfZ3ccGqOqqr/m3HhelR6zMV2s1nHe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b68eb0bb-d615-407c-f980-08d90a6b30c3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 17:29:34.7802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5NNM0+xAy425l9DyAgQnecGbdifxdFclVk6pJJ4DKOWrh2ZsPQ+B+Les/35eXk8X0AQRwXqGb9iUy2mqRaNHpMxSuYJownOJuBkugxgGxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4421
X-OriginatorOrg: citrix.com

On 28/04/2021 18:12, Anthony PERARD wrote:
> On Fri, Dec 18, 2020 at 01:37:44PM -0800, Elliott Mitchell wrote:
>> --- a/tools/libs/light/libxl_internal.h
>> +++ b/tools/libs/light/libxl_internal.h
>> @@ -2073,9 +2073,9 @@ struct libxl__xen_console_reader {
>>  /* parse the string @s as a sequence of 6 colon separated bytes in to @=
mac */
>>  _hidden int libxl__parse_mac(const char *s, libxl_mac mac);
>>  /* compare mac address @a and @b. 0 if the same, -ve if a<b and +ve if =
a>b */
>> -_hidden int libxl__compare_macs(libxl_mac *a, libxl_mac *b);
>> +_hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac *b)=
;
>>  /* return true if mac address is all zero (the default value) */
>> -_hidden int libxl__mac_is_default(libxl_mac *mac);
>> +_hidden int libxl__mac_is_default(const libxl_mac *mac);
> It turns out that older version of gcc complains about the const of
> libxl_mac:
>
>
>     libxl_nic.c: In function 'libxl_mac_to_device_nic':
>     libxl_nic.c:40:9: error: passing argument 1 of 'libxl__compare_macs' =
from incompatible pointer type [-Werror]
>              if (!libxl__compare_macs(&mac_n, &nics[i].mac)) {
>              ^
>     In file included from libxl_nic.c:18:0:
>     libxl_internal.h:2076:13: note: expected 'const uint8_t (*)[6]' but a=
rgument is of type 'uint8_t (*)[6]'
>      _hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac =
*b);
>                  ^
>     libxl_nic.c:40:9: error: passing argument 2 of 'libxl__compare_macs' =
from incompatible pointer type [-Werror]
>              if (!libxl__compare_macs(&mac_n, &nics[i].mac)) {
>              ^
>     In file included from libxl_nic.c:18:0:
>     libxl_internal.h:2076:13: note: expected 'const uint8_t (*)[6]' but a=
rgument is of type 'uint8_t (*)[6]'
>      _hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac =
*b);
>                  ^
>     libxl_nic.c: In function 'libxl__device_nic_setdefault':
>     libxl_nic.c:69:5: error: passing argument 1 of 'libxl__mac_is_default=
' from incompatible pointer type [-Werror]
>          if (libxl__mac_is_default(&nic->mac)) {
>          ^
>     In file included from libxl_nic.c:18:0:
>     libxl_internal.h:2078:13: note: expected 'const uint8_t (*)[6]' but a=
rgument is of type 'uint8_t (*)[6]'
>      _hidden int libxl__mac_is_default(const libxl_mac *mac);
>                  ^
>     cc1: all warnings being treated as errors

That's because the typedef for libxl_mac violates one of the well known
C beginner mistakes, by being a plain array behind the scenes.

A prototype of 'const libxl_mac mac[]' might fair better, except it
makes the code even more confusing to follow.

~Andrew


