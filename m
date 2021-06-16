Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343583A9A8B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142919.263550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltUkA-0004Cw-Je; Wed, 16 Jun 2021 12:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142919.263550; Wed, 16 Jun 2021 12:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltUkA-0004Aw-GH; Wed, 16 Jun 2021 12:34:06 +0000
Received: by outflank-mailman (input) for mailman id 142919;
 Wed, 16 Jun 2021 12:34:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOo1=LK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltUk8-0004AS-I9
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:34:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f2f0a5e-baf2-43c6-b8bf-69578b065bc0;
 Wed, 16 Jun 2021 12:34:03 +0000 (UTC)
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
X-Inumbo-ID: 6f2f0a5e-baf2-43c6-b8bf-69578b065bc0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623846842;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q6wRThENTrA6WiGjPmxl70N/Hn0Hfd0Ejyik4wKHFvU=;
  b=K2Hu57x/tGDzzp9LEGT3QypE4MMCLAe47UXz5i936lLhLDSD/Nw0Nz7c
   a9e+ak6j+nwVRsCZ1aagWsFkAGBMQ6YfTa28OQF0YWro3zpIE6GlABVLh
   53Tld9QixN7xyE7w4WMgK4LCKlosAp3GNpoPDTr1rC1sYy0wtL450NGE2
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: p7161nYTEOC4m0lgqqlWzc5pHB7ONGNQk51GvKvjnK09DFHgeou5eWTlmqwTvFIytTMIHSLySi
 ORUXQevn189nTmqjG/TFSF9qC3xZYW0jDb/NiU9rWcB9mHg+Lh8LsmAuOXIAocDGEnO3e3y0qg
 8jeYWQhcDapW7L+DQCTrdS6mh8/+yXHDNE2wNhqOwui/sMZQOXeIcI6SEHPP1MSEenJoAEF4La
 l6JEhQIPC/mAx4IL5rVz9pdnSP1w3iUTr0zNP9i8i728TzvTBCEDWci36JzfGJYMTFbM6VumbZ
 zvU=
X-SBRS: 5.1
X-MesageID: 47834587
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tG+lQa1ELjsnmHZDLX0s+wqjBV9yeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJk80hqQFn7X5Wo3SIzUO2VHYUL2KiLGC/9SOIVyEygcw79
 YYT0E6MqyMMbEYt7eJ3ODbKadZ/DDvysnB7o2yvhQdL3AfV0gj1XYeNu/yKDwEeOAsP+tdKH
 Pz3Lsim9PtQwVsUiztbUN1L9Qr6ue7267OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4DpU/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBrZgxSGqa12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsZl/IJhXA3a/pcVFZol/1awKppKuZGIMqjg7pXVt
 WGTfuspMq+SGnqKkww5QJUsYWRth1ZJGbyfqAA0vblmQS+0koJl3fw//Zv6EvowqhNAKWs19
 60RZiAq4s+B/P+TZgNSdvpEvHHRlAkf3r3QSqvyAPcZdA60jT22sXK3Ik=
X-IronPort-AV: E=Sophos;i="5.83,278,1616472000"; 
   d="scan'208";a="47834587"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftQkgq9o/ElLvgTX7wIuuAwiMzSDaY29tsItiD3eiJ9Jd0zT2O8ud492cRsplk2J5wAHHBv76i8RusQ9dxMOd/oOx2EUin1XzwtblmZ4UrXwYYIlgUE6xEHsDEaIWhpsqOps1HSyzMKBnIZNXEtpCUUya4pZnwcKHQVD7Y1N2/edaZLVFnjbs4oLyU/9DN/KcT7P6mCd/QWPcEwjNFQZA8Ou7qsXu5LhTh5yk+Ha2xAtaO9nQkNdP2DkHlFnW4jhWgpo/+nUb/8zr/GC1qGBRcEKRe2RhI2N/3j7QegMy8qZfoa3D35AioHgpmRSymO2tAedTBBT6Qmkdib+7akjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYxgsDO0MXLgHa8Lpb26RFkwNjpPFEK7vJHhmqcMMcE=;
 b=fOBTcUN2IJF1CEzApJy27UpZbwbIx8VuSHAasZcF4+vUGkYGPsFWjyQPaAghcubS3+XZrnkbiAS3S7dZ5+8sV2nFIIuwTW2xZcVWekvnSGW56+BFh2OiOIfT7c6Qh6OyuyVNEnp9AK+U67h5J0iZ9EWYbxqVQA6g8s6WNEqlI7clB2m0ASerYckWKsi9BfCfzrkonEMmnpwchPxa7WBVmQDmcUD+ko9D0/L1cuk5tseeOj1cCxZdRYkRRs294XfpmWxaixq6YCEIcaW1TGPVx4rQjCzybLUGxk8GW9ax6on2NKoYFVtzGcOrGoyAFM+JVhLDFQYBGtfadkGdoIHNng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYxgsDO0MXLgHa8Lpb26RFkwNjpPFEK7vJHhmqcMMcE=;
 b=qzKKimd85OPiHjxGkaHcGjcYHbwFq6iCerzk6p7+VRfUYtyqTmES2ywMSJFUlPvik8mbdh4lQm8CiIHLxwxozSkemlH31tgi6679wIhkCiLpPnm24PkKxng/uuYq+iMZ5tAfe39AZA1WZK7NxRc+CYspvQ0PLh7idSlW2IdWvo4=
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC11
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210615212613.6270-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b78ccdf3-9898-c903-4d9f-4d25bd27182e@citrix.com>
Date: Wed, 16 Jun 2021 13:33:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210615212613.6270-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1485aab1-7e3e-4688-c789-08d930c3034a
X-MS-TrafficTypeDiagnostic: BYAPR03MB3989:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3989D43AA7292677E7FC5210BA0F9@BYAPR03MB3989.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:312;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vXbCiQZ1Z4VhD0diI+DMOMCNuNhL0bL6KmJWyNWbpR6vw5fP72t+pFMdWDVJUz7IbJ2QVX8G7eYZCOtgXM+Z38xjM0NpMU6byCAVIv40yiYjZGYuSJxkmz46Q7OyDhHLAM4eou9i4Qg5M6M3axGRxM5acapBNmiqj1LtwlX8RIraVSddO8Qm36cJYkf2cDy9ZU4hq9B/LNiZ96p+70+2NX7qVjJ7Bf+DxBX9mR5Qw0NpEc7fFh9IqQvDHSbQsyv+azlWsDPh6KECCHncTNbrOzyFNw1RSTQk3iBRAOW/dR4ZWRgah1JOP/jfivffmNyh+cyoHzHKJjh2ijpCn9t2bcjat7Xoqqsecjts7VUwAgFXa2Fdij6NaXFhYj90ZphjbKFzi2oLSsEG76eohHwJ/XYfQptUt7tnKthzi+Ra2B+UbA1bUz2czkmxbpuhfnXM4rVbtheENihdn8Sk4/kcEoBIhpp/VuS+sF4j102n5zIRr+I23F7MtU/FiZOByY2llODE7ZpE5rVUHpOmVfHe9yI6/t5MnyWXsnqNSSWSK4M80qtFPpxnfsC70mMD2gaDiBfBijFFh+dFnEcA8lQBBVRktJ9JkwEN3cYutAXcl26E2HtacN14EhyZlUnIYDOvuk4KzqAHCcW61WEBMu6KgGOHPrfSP9Dz0PEvsf3Gufr89exEOq62COGUobrY+PfKO2CyoodEY+8w3Bqt479yqXBn/snilXWuwWNUiwpyygo/tYA1VPsF0MpIOQ74yJBkSCmS9/vt/2iDkEHqhf8Ip21RDGTbnkcrTaEebbjToV5hxXMTpymi1k23H3RytZ3B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(186003)(5660300002)(16576012)(8676002)(16526019)(6486002)(53546011)(54906003)(956004)(2616005)(66556008)(316002)(8936002)(15650500001)(66476007)(31696002)(66946007)(86362001)(36756003)(26005)(478600001)(2906002)(966005)(38100700002)(4326008)(83380400001)(6666004)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGV5QWZWNXh1N2lKR29Xam9RK3lIbjlMWEhnMXN2MTBzSGxvOXBMbFBENkZp?=
 =?utf-8?B?TU5XWExwZTkrN2ppc1dWdi9VMHl0bzNHTlZpRDVnSlVjalI3a0xPa0x5RTYr?=
 =?utf-8?B?RWs1SG9Hc0t0cTlRU1o2VkQ2N1VZM0hNNWRSRjRrcGZ5M2xnNGJ0aGZXaFNj?=
 =?utf-8?B?Y3E5QXhPSkZ6WktUTDJLUFlQVi9OTUxIbHdvNWJ3dUZsSU56S3FwQWlzcXRn?=
 =?utf-8?B?Vk9wZnp2a0MrdUI5SGVHRDBEZXpuQ0RqdEJJKzl6QW5LTVhNVUNKSmJrZU1u?=
 =?utf-8?B?OW50aWhUTi9saEIrU0cvdEk4aXBxUDNGeVIxQktKSEg5UUpHeXZCOVFpS2xa?=
 =?utf-8?B?SXUxZGVsekVyV2hTaGdneUZaQU52V2JjWWdOVklNU1NWRGZtRGVodURvZWJW?=
 =?utf-8?B?My9vQjlTTUJZekM2Yk1JbjRVcmRkM2Q0VFlWdFVIYTY4VHB5QVFDc2F3cVhW?=
 =?utf-8?B?cDVSZDZKSGxaSG9hb2pOTFZoR3JJakJtaWVCUHJEbTE0aWxUSWN2cUI2OE9L?=
 =?utf-8?B?aXZvUlRpVFh0KzI4TDJ1Nk5ZeVV0ZzhhSG1WMjEybC9peHVlejdVdUMweHVC?=
 =?utf-8?B?QUhuS2hLcVZFRU9FRGNITUliOFFGRVZVSHR2S3phZHdEaGV6SHVXRDZqNmpn?=
 =?utf-8?B?OGZLRDVaVC9YcFhXczhzSk0zZTFraklGc3QzVG0wRE9QNFN1bUpUbFdRSkRW?=
 =?utf-8?B?Y2VBa0svZEZ2RlRBcDJtZmplK09yYTBOQ3EzWVFPWGNuNVlrMmtvQVgwWFlO?=
 =?utf-8?B?L21hMTJCNlhCaHlwbDhyVUVDdXYxZmZhN3hpK1dTZlZvNUhKL0JPazZmZUky?=
 =?utf-8?B?aUlKakJPNytuK2JRKy9xeVFuRzllY3FqcHJNaUlKWkJxZXpLUVFrQWdvSnI1?=
 =?utf-8?B?N2llcGowQWtpSFBITXJSWUVuT01zZ3NqM2oycEpLZk42LzZYVU5ZTytrQlpB?=
 =?utf-8?B?MXZWYlZQbDgzNVhqT2xGeFdDWGxha25XT2NJRU9XZXdNYkYvOU1pS2k1a2tr?=
 =?utf-8?B?NnY5SWZ4RGNOand1eWk1WFpVa285NWIvamdWUUI0N2hpMG9IcndkYzd0NXps?=
 =?utf-8?B?Y3NZdFlvS1ZEckFNcXkrbHNKRUo3WWx5aEtvN1FJNXNWeTdUbjI5QTcwckF6?=
 =?utf-8?B?dGFuWWIwZzNCWUlpZHdCdDV3b1RxSlFQaVhKWEEyUHpiTEZoUnVVL0FRNDg2?=
 =?utf-8?B?VVE3K2dDTG8rOVQwZ3MveU03TUhGdDV0N2h2MENNbWw0VXlkQkM0cXRtUWpD?=
 =?utf-8?B?RFZQd0kwZ21BMXk4QVBNeHNKY2hmZys2NEFyb0k3UWpodnYwRUxoTEdtNEJn?=
 =?utf-8?B?ZUhxOHN3OUN1Z01GVkhCR3BCTUJIVWNzdVI3bWd2VmdYSUJISVNKN3dPYk5a?=
 =?utf-8?B?dXZNeHgwOU1zeUsweG9xK1ZlSkxKdUh2c3lPQk1mRWtKTTg3T0RuMlYwa1Rq?=
 =?utf-8?B?ZkFVamc1b2ZnVERJMmYvSS80MWZlb2Z3bGdhWkFRN0JOZ1BuOWhiZi9kMjlT?=
 =?utf-8?B?UW9kcm9sQ3dXZmdVYTlhZXBRQlNaMExmZUhIT2xIMGV5VnR3RFFSSmU1Y2Ry?=
 =?utf-8?B?UHJjaVNBYnZka01Wcm4yUE9KbmV6S2dwUlVBR3dEOXE5MUp5c29wV2hXR00y?=
 =?utf-8?B?RTBvQU1RMWdxTzJIcFh6enlMMS9sMnFqTWduVzFGQklPQWo1TUllSE50Sm1R?=
 =?utf-8?B?V0dCUFBZY2Z5Z1MwbFU5TGRHTDJ1NzhNRkl1UXdUc01uMFVHUUFUWHNXdWZW?=
 =?utf-8?Q?bPK95vcZMr3NzWkXdhJMquq8An1GaaE4h7Onzv2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1485aab1-7e3e-4688-c789-08d930c3034a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 12:33:58.4402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXxwQloa2I3saMSj5m+S6aVoPPsGkhZ4xbcwq9wVrhXkTPDmcda+B1H6n+m47AW+KqIz7bNRzADPQvJaMH0Gc0zZd9HNJWNtYKlS8P653pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3989
X-OriginatorOrg: citrix.com

On 15/06/2021 22:26, Olaf Hering wrote:
> Use a snapshot which includes commit
> f3f568e382a5f19824b3bfc6081cde39eee661e8 ("[crypto] Add
> memory output constraints for big-integer inline assembly"),
> which fixes build with gcc11.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  tools/firmware/etherboot/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherboot/Makefile
> index ed9e11305f..23b3f6ca9d 100644
> --- a/tools/firmware/etherboot/Makefile
> +++ b/tools/firmware/etherboot/Makefile
> @@ -10,7 +10,8 @@ else
>  IPXE_GIT_URL ?= git://git.ipxe.org/ipxe.git
>  endif
>  
> -IPXE_GIT_TAG := 988d2c13cdf0f0b4140685af35ced70ac5b3283c
> +# put an updated tar.gz on xenbits after changes to this variable
> +IPXE_GIT_TAG := bf4ccd4265ac614fbfa38bf168b6eeaf4c17d51e

CI says no.

Gitlab CI is currently fairly red because of a clang build fix which
hasn't made its way into master yet, but this job:

  https://gitlab.com/xen-project/patchew/xen/-/jobs/1349871230

shows a real failure on CentOS 7.

...
  [VERSION] bin/version.rtl8139.rom.o
  [AR] bin/blib.a
ar: creating bin/blib.a
objcopy: invalid option -- 'D'
Usage: objcopy [option(s)] in-file [out-file]
...

~Andrew

