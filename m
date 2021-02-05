Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F9E310BDF
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 14:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81719.151090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81Fw-0002nU-PT; Fri, 05 Feb 2021 13:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81719.151090; Fri, 05 Feb 2021 13:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81Fw-0002n5-Lv; Fri, 05 Feb 2021 13:34:40 +0000
Received: by outflank-mailman (input) for mailman id 81719;
 Fri, 05 Feb 2021 13:34:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdnZ=HH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l81Fu-0002mj-Pb
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 13:34:39 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43ac7d48-e925-4e17-9000-3a784f79ac30;
 Fri, 05 Feb 2021 13:34:32 +0000 (UTC)
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
X-Inumbo-ID: 43ac7d48-e925-4e17-9000-3a784f79ac30
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612532072;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hB0Z5Gq6YD9C3xjPLRN4+e6Oygzl2psZURV7jpWf2vM=;
  b=GIz7MAgNQ/O4YnAGY1SFpkZDxZJB1qZe6BhZ4/JdU8u07oXOESoSQykU
   Ev2IQyZaoFt47/4AJlmI1yqvFlEZU/Iptg92K1s7cwd9SCS/lj+96r6LS
   prwtiqQNet79Q5FHakDIkkpMn8jc6X7aQca7E4IPZ70SZkGuMnAELS+zd
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FCC/PQIU0BVIaRjc6Gj1k9uZuO7cMgHNuVXexHJUqqQXbZxtsXAKSHeVepDPmD4lT8U1wTb0Zy
 OykHw+K9+lu1LEgbR8RWP2RBm8y8nivzlDyUjyST5PmIXAicuv2BMRfvdfGNwyhGJAlIIXt7jv
 vmr8h2JCUBnw0HUiNuiFVLUMb1GrK3ILXI8d2b1/kUf77tZcYjhYTJDWkUokR9GFdEdvU6H0Wz
 UpAHs8plrMIjI2e6KFEQHkcfOgvwehXwyHXNiRaO4UTWGoCHks1nhq/QjYwcDVgRKW/C2C4EfV
 S/s=
X-SBRS: 5.2
X-MesageID: 36843310
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,154,1610427600"; 
   d="scan'208";a="36843310"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNJ7huA1a6nplKfgFrqt0Bl8uCiA963UseKd9q8WW9bsozKxsYh9mqqEMMOFzhhsAxoMRF0jRUSGdKxBOJ0Zf+Ag+fUMKJg2p78xXZPaCu0VaFDBw/gVhJBKa64HfiinHYAlOdRbiGqRyNLs6H2ZKr286qsL+Qufs6q50/rb8yZmejsix/XrVk1hjYI6Eru2ot88W5U2RHHv2ZU5zAidMufJn6VP6/RpfSKYocimWSt6v0Q3ZLsL6pcBzlD5Ueb66AFkTzwlxz44KkUSSxQivsB/0MdSubeJFqGEwvjsivasa6pBcC5nJ3dXsQXXILxasuNHHRNkqPgPmXUMZTPLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w39XjvvEUDGdeFK3tqqzxUK/ZTF7bkWusYkQkq/7oYY=;
 b=djwy8Uo/StcbUdwQmxgXcR9N/IcfPi13q8DvmFV2zmEWvR7TBA5a19Q/4DWOzd5B1gAtu0LFT05LGbJjFnaFm0TJkwYBUDVkyJHSkzzgLYeQoaJ+u6h2zNsezkTo6lgfxlmEAedaOb+CEWpf2UcCPCIMqfmMUQAUAl8Cm+/vFOFwxvVDqG0QlrO8qwT+5CPbL5NKAh4VfdwVCEr4GDFN7pyqwDlETkyzqjn7iG7tCcAVIXVpzrI0LNQybN8E+cRDFcnICbLHjqHzAbxDwgSSuwrl1sHsFIFHqdLRFZRZnhntmvd6t+60L/fkIdxQuUNGl9V1baHrl0DeDS7ocpzZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w39XjvvEUDGdeFK3tqqzxUK/ZTF7bkWusYkQkq/7oYY=;
 b=dR/5mXV6FKY1mDyiAIbBVDgxfxdZZFImzQ4U7sU1ydoQ5hft3gUmhZNL/vwVJBrPSOC6r7ViYqIpKrD2yZnUf1ulIjVQ297q/99JqcAv3sMspvOEHH7WFybCueT+kc+Y4kYjWbZDObGvBuj4TDL1rfBsiUSiranVexVfGdcDOB0=
Subject: Re: [PATCH for-4.15] tools/configure: add bison as mandatory
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210205115327.4086-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bd9d86ef-485d-fc93-f402-0a97acd9d2dd@citrix.com>
Date: Fri, 5 Feb 2021 13:34:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210205115327.4086-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::34) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 348496f2-8791-4a10-f7f8-08d8c9dac168
X-MS-TrafficTypeDiagnostic: BYAPR03MB4663:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4663A1031F3FAFB4F9AD1472BAB29@BYAPR03MB4663.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n3OPDCvbPlOzWy+eE+pPb/nJAhzIxOSAGcgiSTFxpSNNPBr3o9jr5U3wwdujkYOBngeXFOIOOo3O6QOCGrxbFIdkRPIzsRsuqn0vT2TFhTFtzYn7quR+RF17D9GxTgPFRuflHRjCYxIVDqYalQK3HlADBSW5CNVpCPHf2UATcPUipVXc1aMgTUkG3GsfrF798TTyJPXVsw7OTZgDcDDPUgmNd27j43BF2sG0r2yHvElh8olbF5yY+TfQcUsX4ldCwvNWTrz/+vFniQ2oMSJwS00q3tidTlf0L93uM1tK80N6TfJBgtfKpBgVmiijZP32Jtrfhqrg3r17JCy2RL7+SBL5hXSE6kR0lLhP5oEJ1N3A0uCXAmiXMMsAQrxqB7bPDxves2/bHh46bnBsJ0Uk2MGFdiVvVijIsIHQvRYwAZ43P31WujUilC90e9mc9H4v9WDkKvM0RMgUBm6KHqMzVsP09s59hPkVJo43mNS7TkD4ZRH69BFh91Mf38xOB7nF3TIoql5pEnbrIy/UNAdLPAQWb/7m9ocpp/AQq6XOOM9CuI8RyPvEnX3Jla7LExM6VJKRF2NkugXsNVr70q5zjI9dM3m193IMu/k9FIyrt5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(186003)(8936002)(5660300002)(66476007)(478600001)(86362001)(66556008)(8676002)(2906002)(6666004)(16526019)(66946007)(31686004)(16576012)(316002)(53546011)(31696002)(2616005)(54906003)(956004)(36756003)(4326008)(6486002)(83380400001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?clVTblo5aWcyd0I2djhoWlRRSXl3Mm9uY1RjYWt4eHFRREtYOWtJZEdtLzls?=
 =?utf-8?B?ZjgrVDR6djcwU0o4OTIzemdFZ3BKZ3lERkdRZTE2WWtPNjJUd0czQWNnUFBG?=
 =?utf-8?B?bjMwcU5DNStDUWtvWTdpZkVXdWU2emRyNGpZWDB1N09ydUdYdlMzZlprK3lk?=
 =?utf-8?B?ZHpjaEY4R1J4NW5rUm9HRVpXQWZGRXM1V1FnVzZnUUJJM2tRTzRxTUlhV2dx?=
 =?utf-8?B?K2NUWmxCNGFVMnM1N3FRUXo1cERKWXZLdW1WSVlLem5LYVEzREZwNWU2SE9o?=
 =?utf-8?B?OGdxK1h3dG8xVTJ2VjRud1ZGaVhRSU90YnJqUndNNlREeDlHeVZVb3FEZS90?=
 =?utf-8?B?SzdvQkdLOFlZZGVXR1pVSDVRbjd0SkVvS2ZLTUVsOGZlQTg0aE5TdHpHVm9X?=
 =?utf-8?B?dS9DVzBFa1JMTFdNMjdjem1TOERCUVFlMW8xSmdCV0NnL3htSzd1OTg5QzAw?=
 =?utf-8?B?czV0TFRhNnVJemg2OWU2WjkwV3BFQnRBTEdQRW1oSk5aOWJpTUs5cUNNejRm?=
 =?utf-8?B?YXlBYnZPOC9OM2piTGQrbklRYUVDOFNRNXhKZW9LZzA4UHFleGRnUlBGNHVz?=
 =?utf-8?B?ZS9ud0txN3lmSHp3djNWdWh6TTdTYStNNFBzemVNVHJHYU5PejVlVHBqc0Rl?=
 =?utf-8?B?WmZiNkozd0xjRFI2QWp3bThkNDlBL3pGbnJWd3NWYjZMNU1LUHNCbmx6R05F?=
 =?utf-8?B?bXRWMDlWb2E1WjNEZkxJOVJwdU9IQkdrUS9hMEUyd3hyZmVTblVzNTR1TElj?=
 =?utf-8?B?WS9HWGxYcno4dzRzQS9mS2FjUTdzVDFIeTIyZHFVbEhIek8xYy9kaWxlczZU?=
 =?utf-8?B?TmNHcGI5WVFtRVV1N1I5bktWVy84R2JHRm1EdFE4ckN0U29FM3BSUllYNlNv?=
 =?utf-8?B?TmE1M0ZOdkVMeUN1VWRaNklVQ2pjSHdoTWFHMmhUbTEySStDRnlUY0xaNktT?=
 =?utf-8?B?cVdPeWZxem9hMzlOOFZkbk1WOTB2L1IxRXgrNjFlZ2xnQnlYVWFPZ0FtZ2ta?=
 =?utf-8?B?QjNBdlF4cGlYbUpMczhTY3J0bDFlK01xRlV6TVdMajAzS2JPOHVDcW5aNU9D?=
 =?utf-8?B?dGE2cnY5UzZXdnRQQytlZXErbXJVUlErZUV3TnNSSCtxZTFsdVFxOTRvRDJD?=
 =?utf-8?B?K3Z2aGQ4amtJcm4zYkgwZ0xrNHJFU21MSnN1R2d1ZG96cXI5Ti8vRlJkN3d4?=
 =?utf-8?B?WndZTHBtc1lxUVo3UmhxOEFqYTZGdlhoN1JwYUZDWjI4TWxyVEEwKzZQYWlS?=
 =?utf-8?B?bERrV0NzU2x3aFdtVXZaQlVpWE81L1N1ZnVjMXNUdXZ5MUY2RDlYZFB0SHhs?=
 =?utf-8?B?MVgzcUJqZ2M1YjVDM2hUM1FzMDVFMVlRdHF5cGtlbnh2bjdkb1dpQjl2SUVq?=
 =?utf-8?B?SS93QnFPNGRyQXgwcGU4bFJndGxabGVUZUxCVWdjMkJHTVEwdWZzSmN2OTVV?=
 =?utf-8?B?Tkp6d3dOL0pFd3o0bWw1OWJSS0tmYVlnb3J2SnN2RGpTL3BUeUpnWWZKanZS?=
 =?utf-8?B?cVBiblU0T1g3cDVPOE5WVTRwa2hGVU9tT0lWZGpxWTFVa3VucVdzUm5oKzQ0?=
 =?utf-8?B?OHI5bmtYeGwyT2tIWVZ1cGxYMTRmZzJPOXNOc043dzZha3JUYlFyV2E2eUpV?=
 =?utf-8?B?eWlnU25QUWJZVy9DWlhJaGpaUCtSRWozOWFkWDI0dXlzNDRhSE9wTXJPY2Fp?=
 =?utf-8?B?UHA0c0tvajNZR1dXNFVvUmZxRjJLcFdmWGZSTkZCMmw3TGc1NGRzNW9NRyt3?=
 =?utf-8?Q?JelZouB1hMOqR+m+XMd0x2lddJOAKjvFh7WLirA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 348496f2-8791-4a10-f7f8-08d8c9dac168
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 13:34:25.9749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvMZFNrU5A2u8nn5qEDkhqUyXXo7P8pusjBjfuDm6DPNFy0jJNgTF3Tg0MhnL+bFP6gamqbXk+lhElpAuwNYhYUPzPbZqDJJPdTmyEGG/I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4663
X-OriginatorOrg: citrix.com

On 05/02/2021 11:53, Roger Pau Monne wrote:
> Bison is now mandatory when the pvshim build is enabled in order to
> generate the Kconfig.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Please re-run autogen.sh after applying.
>
> Fallout from this patch can lead to broken configure script being
> generated or bison not detected correctly, but those will be cached
> quite quickly by the automated testing.

I think this can be simpler.  Both flex and bison are mandatory libxlutil.

i.e. they should both simply to convert to _OR_FAIL variants in place.

~Andrew

> ---
>  tools/configure.ac | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/tools/configure.ac b/tools/configure.ac
> index 5b328700e0..f4e3fccdb0 100644
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -308,7 +308,6 @@ AC_ARG_VAR([AWK], [Path to awk tool])
>  AC_PROG_CC
>  AC_PROG_MAKE_SET
>  AC_PROG_INSTALL
> -AC_PATH_PROG([BISON], [bison])
>  AC_PATH_PROG([FLEX], [flex])
>  AX_PATH_PROG_OR_FAIL([PERL], [perl])
>  AX_PATH_PROG_OR_FAIL([AWK], [awk])
> @@ -516,5 +515,10 @@ AC_ARG_ENABLE([pvshim],
>      esac
>  ])
>  AC_SUBST(pvshim)
> +AS_IF([test "x$pvshim" = "xy"], [
> +    AX_PATH_PROG_OR_FAIL([BISON], [bison])
> +], [
> +    AC_PATH_PROG([BISON], [bison])
> +])
>  
>  AC_OUTPUT()


