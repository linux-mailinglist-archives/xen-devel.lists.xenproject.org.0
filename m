Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2563B491D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 21:09:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147386.271647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwrCg-0007sF-OM; Fri, 25 Jun 2021 19:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147386.271647; Fri, 25 Jun 2021 19:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwrCg-0007q7-LA; Fri, 25 Jun 2021 19:09:26 +0000
Received: by outflank-mailman (input) for mailman id 147386;
 Fri, 25 Jun 2021 19:09:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwrCf-0007q1-5Z
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 19:09:25 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b232197-7165-4ff2-a47c-b2bd621d9c62;
 Fri, 25 Jun 2021 19:09:24 +0000 (UTC)
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
X-Inumbo-ID: 8b232197-7165-4ff2-a47c-b2bd621d9c62
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624648164;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oYGAbKx6nYxEdmQxP42MpwAMSnLTujWNfpB4WJdDm94=;
  b=gR4C3Uqt5a2lFIV/51xIQcYQYfG+uhj3kTcmtHLgYPXKKOvBTSfSCrVm
   fJtGaxUME4q10udm3jeyEmCEHn7+XPU9BXp6yxz8Fifs5oiOQi8KVtJyl
   4SyY6UIAusyfPI3COmB8C+uWbhlTQ0oxDrfAf5e6gSFrLCkZpkgKtbsoe
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JT5X98sikgoIM5P+NMLKwMwvUvk9fb38SrX4SE7KmQdvSYj7KUspWYIJxuugYZPaTUuYFo9XbH
 oWU9DRgBhghbDL0pBQmQpmId+s2x09GbAdckndlCNScfjyQXUw+Tcm4elLx0jkHTP3TqNLBDLm
 xQaHE4/O6aXfYBrjrD5dyh7r1yGTdUQ6E8U6qXIpGsSXTndMFsQB8NJf+7LyynGOm3kexFsbd5
 vPL9qDScEuhHA2OjajHtKBPcfSXWezsDlA8NLpR1tTpU3C/DOM0pvep8AjC+4oscPdqKjkJDwK
 tQI=
X-SBRS: 5.1
X-MesageID: 46714146
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0FuVlalePM9EfoGfCTFmgbncDBjpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.83,299,1616472000"; 
   d="scan'208";a="46714146"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ja+ZmAjPcoCMx75UPeXGVYP4UwztiK52LIkc71HjjZNehtAM0Md/OHdE2UOfPTDCPm5X8RkgzHd6JEjXhbaL5xqVL3BUFl4J68eeTnOHsNcY0Cv6lrrsHcYIQ+AOpsHywWM7nETi/m3fWZR8aurC7LT0yPvZptqzlRK++n4wl3k/+vMmmWm1mJbG8oM94FrkjEioIzPrHnHaMHQD+cx6al8CdZZ0x1bUjduDBR8sVx766IG4A/Cc2slMD7tv4lzcqAZvYqR5G1v6tsa4+5m4tAA1TxWpTlerEJ6SnKICFBMmi6/dolYdeD6yi2YI11moE+VOwKMbjjoq+ytFpc1HBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYGAbKx6nYxEdmQxP42MpwAMSnLTujWNfpB4WJdDm94=;
 b=Q/BG2cqXQonj6P0QjBE3h7aU969+zJkfFN56/hJx1HXzPWueaNGp/DB3+NaLYfvyhI1WOohHXVTI5OiQ/XuTcBIDhhc9tJdksu+4QX6IBuBlNSC/8Iq/Gtdgn9Q7X5sjpZ2IKNgwAeY6MlpURj1I8PvldsGPozlnwRVRWgzOn1uvgZJOpjCfp1kyO5CNuuIllqm9t3/AFKT5hX+rSVls5yhB+Il2aY1lHsKdRME6iAPJ6aunwFuk8hjyHHxMw7EKOl8tQj1HHPQWpAhcmADV3BF8t17yQ7ahG0QXq6JNc5Bh2OSXY304FxTAkHYEK0N72g7g4NuIv16PZiUfKJfbbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYGAbKx6nYxEdmQxP42MpwAMSnLTujWNfpB4WJdDm94=;
 b=mv5ibWRRFrpXE7lnNXEYlYHdN/gqPUEvA/1RQ6px9mZUvhSF9PYVBMU603r8WKUCE1WuCwxvZ1K/lU+8rt/mtIQs2Zh9abOKFnLQ+Lsh8NRzJ+4IsABKXgxtGKGlyt2tv6xJCsdytBC11q8oBlYcX5UbY1FG5BMu2nM+sKJPH0U=
Subject: Re: [PATCH 08/12] x86/paging: deal with log-dirty stats overflow
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <92968d22-f3e2-4eb2-59fe-b1f638c60133@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e482a0a6-3412-c3b2-a752-961a3840a6f7@citrix.com>
Date: Fri, 25 Jun 2021 20:09:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <92968d22-f3e2-4eb2-59fe-b1f638c60133@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e50b505f-1411-4ffa-1139-08d9380cba93
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5454:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB54547D0004328197B7823321BA069@SJ0PR03MB5454.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eZdeDb0OBPdJukjVaXnW1k2yzQIfqhqSwo1KOjL8iSQdVK4DDUSbtPZMK3W36ot3zgtRcszMsD0G/sJPXoazv5+LEHQE3QtNt7Eysg5QsGSvCwDPm+ryfFeNdKQYjQPGugZBZCUBZWUHTxlZUCEqemNRD56iWgs6/IVRCNsJlGEgrjnikjT1AidZFyI28183YEP1+CIwuRP3jqKDGu3a5xGfB6slX8pVRBA3fYbYxLjw8gPK4O7omdj4YmOCjRWe/GnwalLLTWX+K7f+eealgkdroo91yEMekmnuHox/7AZSGHkY1T4/0YCmHp5g/aASYO2HsA2giYRXu5/t43S7rnqgFNHn1I16rWKMyk8Nb5cK+w3QScNFtDLhj3SXO7rBsjLIxH9KRQNEcEeNHrqgEp3MzTrpNv3X2kU439aeKZxdOCqzUPAi9Oa8OP0moLj53dn36aMPl2Hf0qexy6LPwZA+SnCY9zOUHBz4kz4JqzOtvHO1NS2b9PNZ3oHhrBz+59AfwDc/057r4qlHbD9VVh29++x4oF/xXK0Ic0wvmzVx776w8PyOpTdOYAGtr2dtBTvdFJBEiPNPPms5ShSuyqJw4AZaYDHGSiIPggN2oGrnY57W8ml/XOa+uddTbmw/+Yps7hyOGw3qeNKYi8lRQVe4zaBgU8PK5CCXUO9CFkaQ2wu3vmWAaGroxiOzHCitA3n52RsL6b+NPuu4RRbYHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39850400004)(66556008)(107886003)(66946007)(66476007)(86362001)(4326008)(110136005)(2906002)(31686004)(83380400001)(16576012)(5660300002)(316002)(6486002)(54906003)(26005)(2616005)(38100700002)(6666004)(4744005)(8936002)(478600001)(956004)(8676002)(16526019)(186003)(36756003)(53546011)(31696002)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3hXYi9wRThlTGNpa1ZxMFdIMFk0a2NGK00zL1RBYU1rNEJ4cVpuYzFUejg3?=
 =?utf-8?B?SVRlNGpUQUVoNTJhSmozK0p2ekVGWisyQ0JDQXpGMkxuM3Z3bzkwVG9OeC8x?=
 =?utf-8?B?clltdEVMUCt4VDk1RFo1blVYUC8xdlVIZXdDajB4T1orWVhxWnU3MFlQN0hW?=
 =?utf-8?B?aVJQMWlSbUlIdnpVWU4xeE5pMzBHajFWT0lqY0Q4YTNsaXJ1UUhPeDM1Rndo?=
 =?utf-8?B?YS9xb213MTVQeFBHOTJYK0pWWW5TdXFhTWdVU2lGeVlFKzdpYU9hQXY0Rlgx?=
 =?utf-8?B?VHZxTTZIVU9rbGl5RFJodFRycFRNak5nK3huSlZzQTRmSGdCcVkzekFYa2k5?=
 =?utf-8?B?Q1RIODgxV2hZN2tXZk04UjFaNUg1ZXlEa2RwZXhMOXhPaGxCQVpGSWVSOCtX?=
 =?utf-8?B?ZXRGOGFwYmE1amM1dHRwSDY3REFHL1FkQ29TTmc3ZVhVT1ZwbWxhSm5lbXFl?=
 =?utf-8?B?M2U3aWdBZzMwZm5ka0tuc05uVVo2aWtkM3NhQWRFV0lFT1dqWU5aYUJWdFhx?=
 =?utf-8?B?ejdZMlRweGNzVmtQaEprbWlkSmYwZlJ6alVtelQwQVNuRFpOdHo3RHZ5RFpH?=
 =?utf-8?B?eTVxYWErSWE2SHZZUEZmVVdzVXRTWjlnMVRWZHNZMnJXUzZxcFhnOW9BSjgv?=
 =?utf-8?B?cTViVEZnV2RoaWhUVnhXcmxGbnNnNkF0T20vbGZtZVVrMmtkOHlSNUthTE9W?=
 =?utf-8?B?WjBFcUpGTjB4RXFjRUxVcjR4OXcyRmFKcnFSMXZzNUxnejlPYXhDK2pIOHBQ?=
 =?utf-8?B?dEFMV0FRRjJZVlcrN01VeHNUdFdoQ0FXYXBjdUsrWFpHN1FXUEZ2Y2IrMjdC?=
 =?utf-8?B?TFhLVCs1SUlJL1JHTGhxTnlqK3dxK0sxQ1BHcThwcGhGY1JTczlNUTdObmtP?=
 =?utf-8?B?NUJSRmtmYVR2TXgrTkR6M1B5M2UxMVo5bHBjQTUwUVdnc1UwdDhMZktJVTZj?=
 =?utf-8?B?Rk13VDc3K3JSZnVoYVRTekI4SVRrQVMrdzQrTms0VUY3ZWRsZUk2b0xlQ3Br?=
 =?utf-8?B?a2hseXh2MUxyRlB6ejEwRUF2QXZ6SWJwMnR3bVdydDh0cmwzeVdkNm9iQXdG?=
 =?utf-8?B?QUlRQ2RLeExHTlg2cUxGUGMyTHdmb2RYSXl3aHgxNzZ3bThaMW4wMHp5Q2tZ?=
 =?utf-8?B?KzJHVFlqVVJjekVUeHVoOGFOVWFBZnRBSTdCR0ZnaXMwL2hMZUV0dkxDV2F5?=
 =?utf-8?B?dG41TzArQzY4WVFqQnA5VW4vemppSkc2cEdBWTZ0ZE1HUUEwRWMyKy8rS3A0?=
 =?utf-8?B?aTl4bHBXNjZPcngxcmhsYzZ0QzBnc1FyS01YRDVpbzg3SFp2MzdNQXFlMS9K?=
 =?utf-8?B?RUw4cEo1dElmNk90bVhkYmZXN21xVkZ5Yy9SR1Q1UEM2WGErWVJoRW83ajhR?=
 =?utf-8?B?YnA0bndDeDdsdXN3aTNrQ2VST1VJS21PZ0Qwb2ZBc3BlV29ZaXpaU0FETi9v?=
 =?utf-8?B?dUVmT3l4NE9HUXJQNUpTRyt0Z0R1YVdsRkhRS3h3SkpIc0lKZWpjY3lGZEdX?=
 =?utf-8?B?Zm8zN0E0c0FMU3p0M1Q3bXdSVVYrWVRpWU0xQnV6UUgvUTBPQnVuRU9DNmZy?=
 =?utf-8?B?NDd1bng0Ym5wWHZORStiZFR2ZHhraUxrd2FTbm5xVUVPWDc1VGFIU0xzbEpw?=
 =?utf-8?B?OXIwdHJHNFRCcThmK3VzVXlPSnE1VWh1RDc3TGE2RnN1R0YyMldIeDVDV1pP?=
 =?utf-8?B?cllpa2wyUk1NUkt5TENPWlJNUE5lZWRIemY4UjRrOFJ2MjdsUktMb3BCbnZR?=
 =?utf-8?Q?X5PmNizLwbADPg1Xx1LhUGk4y38O6db+88rVbBG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e50b505f-1411-4ffa-1139-08d9380cba93
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 19:09:17.1778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIIXXTHdvKc0CdJkhTXnQ6Yxjekx4mmeikWsodxP3WcJgx1AxajMMFheSwnQ+sj4lnRfh9nz6zv6rdHiNs3yPwayvnkkyFe8YIn8gZl8y2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5454
X-OriginatorOrg: citrix.com

On 25/06/2021 14:21, Jan Beulich wrote:
> While the precise values are unlikely of interest once they exceed 4
> billion (allowing us to leave alone the domctl struct), we still
> shouldn't wrap or truncate the actual values. It is in particular
> problematic if the truncated values were zero (causing libxenguest to
> skip an iteration altogether) or a very small value (leading to
> premature exiting of the pre-copy phase).
>
> Change the internal fields to unsigned long, and suitably saturate for
> copying to guest context.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

