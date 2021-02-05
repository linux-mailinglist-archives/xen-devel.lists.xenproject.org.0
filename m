Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E540C311090
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 20:00:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81893.151438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l86KN-0005PV-MI; Fri, 05 Feb 2021 18:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81893.151438; Fri, 05 Feb 2021 18:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l86KN-0005P5-Ih; Fri, 05 Feb 2021 18:59:35 +0000
Received: by outflank-mailman (input) for mailman id 81893;
 Fri, 05 Feb 2021 18:59:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdnZ=HH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l86KM-0005P0-Dp
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 18:59:34 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9cc5e97-6171-4570-8f38-ad1fb7751700;
 Fri, 05 Feb 2021 18:59:33 +0000 (UTC)
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
X-Inumbo-ID: d9cc5e97-6171-4570-8f38-ad1fb7751700
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612551573;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PRQQ6KLTb47sJDxnltJs4SuWH9tSjTDlWyRnGyBKr/A=;
  b=EoKYoSfJGmucWLKCAOCtbK/Ge5DsUD9SCKou55Z6ch0Y0w+r9yL1IcGm
   8B42j/jsZnqgyCQ3RK8s2UTagJap9FUjSBy17MTyManqfkhaRtBzJ2XOf
   NkCKvv/02EXBWxy1jCLP4vsI7+2QY+40NxKngUXZZpokIc98g5y4vsydn
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zi4v/2zyY0YU2RkStvzV6+kGgUegRmgfkQljhiK2VrM3FvgKwaaN3+vRCVHvFf8/v7l/u8mqdy
 tgTSLgCQLXc+6nQ3WENKiAq1fN2oWh+ZVYBmtnX8JWR902BiMW7c7WNjwEn6Jg2Y9iEkmcWovb
 zedVgsGo/EYkYIYhEwGy1LQsi1mbahkhgNS0+IqLTrOTdx2olvLkJluEWR8U5a1k9HhzN8Jyti
 Qs+iKuOIIfWO+70ciryOuiOY3UEwB7S3JvfU9QwgTnE5wVBZWvXsQetOteSKN4cypv/1eWdpF/
 gaU=
X-SBRS: 5.2
X-MesageID: 37041521
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,155,1610427600"; 
   d="scan'208";a="37041521"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJeMFi/M5MnROJCcs6IqMrTaCtSw0L9bTxwFPplONvJE9RRNkyIDNAX/LHe4JpdvUqlzYykT1LSQaQZs6Cp03Bs4kkdB3QyziLUa7qZq4rFc2JWPfPwEU0ARAO5YM/PEy5kMNeRysdiFDxArfXh2B0SRQAGLT7ca2dCmJFJZUgTpt1ufWFlkR6Iv0YT9DoYVtLg5ux/Z7D1lPsaP8daO00i5zAneKqyxpuiXigBiifZyFSJ2Pa+QcFVstrm4kpSllR0xJvxSo8Ud62PM9RB1V9njMEcYINdGF/f6PhMzAjupXW8+Zgl6rYoWWJ4TqDpoNLgl7aW2K5YP/JM06KAh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ho9WuhTbVpwK/VfA1t6b1i2htzxQfFJD+14VX5n/ZJY=;
 b=LQF6pGJCRrL/QbU5BuGQrgqiU/FS/xMuh8KoCsCAAurZbzeYUW14C9M40dVGxes6sp6YUaG8Ye9Ik2JtH2PGNFfhiHyYTlP9E85crH1nJ0XhnXc51I6j65ilOdN92L73jJrM/lzZBkPWvzXbVO3vmDLWo1lqtn7VgtjPh/5Tb3IAWmMN3bKjqx5Kx99vSrOJkYnKUbViar1DsSEKKodqdwsSTuW6GOo6XpHjgvam1T3YPxkbKuRW/Y+PUvLmdclbDBWtHNLVPZHJBAq2kFClZcjN8OCePZJQzkjvCEx6qgxDiJOUaFVU43ZI/w9OM3bZrY+41bg3t+JLgdVtUM5Wuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ho9WuhTbVpwK/VfA1t6b1i2htzxQfFJD+14VX5n/ZJY=;
 b=Ni4xZryKVMii4EO+XQdh1cjuVJzxKf19/QbdTJ2ldWpsEnHG4NVBGFl+5pWiUWI+TMgixax8V0amUbu+2xV2bVCg0frsMppwgJsN7TVoqOHvv8I+B/3lAfb4zdN6y24DVYwbC/Y0i6TB23nn7Ey3EjcpFhkU/XC+0Lq6ndL+k1s=
Subject: Re: [PATCH v2 2/2] tools/libxl: only set viridian flags on new
 domains
To: Ian Jackson <iwj@xenproject.org>, Igor Druzhinin
	<igor.druzhinin@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <tamas.k.lengyel@gmail.com>
References: <1612382824-20232-1-git-send-email-igor.druzhinin@citrix.com>
 <1612382824-20232-2-git-send-email-igor.druzhinin@citrix.com>
 <24605.37516.737667.412159@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ecdd0986-bf35-4bc8-71a4-3fc23e42d163@citrix.com>
Date: Fri, 5 Feb 2021 18:59:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24605.37516.737667.412159@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0133.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::12) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c225ee5-74ad-448d-bda1-08d8ca082a01
X-MS-TrafficTypeDiagnostic: BYAPR03MB3544:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB354491B26EC4C8F43FE6EBCDBAB29@BYAPR03MB3544.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f/YHhq+ByFHpr7qdVrYl5OjqS6ck+Ng09sSoowCFYDQXHFw/y+aIdAlcA1icQt6mx4PiIT0wf7bbJRcpQ4jfW/TBFJRGiHcSoz+EafMubcE2sZaMVmwWzHewZk+UQ46slFJyuppePggUXMHOwbRfZXhxmZCPe/U6zlGacnAEda16MIn8R/ZKzSP33uY8ca1Snz19iAy57SfDPejzUny0XEfg3rooUro2oc2Lc7ujnF9ezfgAbfIgVPv/bUFBIrKPFDBiTcoTYCEqULQkyrKiZdrsNG4oY5mlSqQh4vz1rpUksKfott+FOmO6yOzB6FxXQhYt+8WpC8rYyBVhkBCUDCUlsELrs/q0I3UCjH3WjCmqpsxvtMw8QDojTQPI9B9na+4evvMmmeSdXQ4V6IksZpQ83Eda1AK/l0g296tgo6w/0b3v9+meaQ/c/W79IZxiAmgMmb0+7YCW5z93bLOYKjGPFKqycSYpg7GGBYrb+MrNSIsAWT1mY5bO2T+lRcsjUySRoOruYtupshA2IrGdcB9GhkVloicP083IUjLo0bHaV1BevWDn3byjqBlumuDB8yJViF8+OwWM8wtB5rI5zjUMpxFy5YmLI6waOiANhqI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(8936002)(83380400001)(316002)(2616005)(8676002)(956004)(53546011)(16526019)(26005)(66946007)(6666004)(110136005)(186003)(66476007)(4326008)(16576012)(6636002)(5660300002)(36756003)(31686004)(478600001)(31696002)(86362001)(6486002)(2906002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WDQ1akVsK3lwTlV4NjZpWkkwaHg5NW9DUWUwR0JrWXBCU21IaWxPNFBpRm9F?=
 =?utf-8?B?TTdYY001eE9hVkM0SWU0VEl2L0ZvNmVSTjB3Z01DRTI1eUNMRlQ4Y2srV0JU?=
 =?utf-8?B?ME9QYUlxQmtHQVNWMTJLTkt3azZTV3BTTTQ1WkVxN01keXlqMm00YWkxUmt2?=
 =?utf-8?B?bTd1Z1QzanRoUXhKOEFLMFFsL1cyRlpUazJTSVNaMkQ4VXNZeXhoa3dqUzZ4?=
 =?utf-8?B?TThCbEx5a3c2aGdqQjE4eHVTSmJVV2VVMWNPZStnNkVXQkh4Q2RoVlRGYXAz?=
 =?utf-8?B?cHh4MjlPZ294UWtQVitnMVlEdFg1NE9PaXN2OGE4MlBPcHdxaXA3a21zbXJI?=
 =?utf-8?B?anhYVHJEeWhEYk1lbDhiVFdOanYxclp0RWQwVHRUVUFMOSs2clJTbWI2WVE0?=
 =?utf-8?B?M09EdjdxbzZHU0xJMi84TWhudUN3bkFibVFrcEpxU2J1cWUyK1hpOWxLTmhE?=
 =?utf-8?B?c3dRajFJbUlkOGZHK0E2YlNHbUpXSW5SbkxKSVZ3NFVNallqUFdCYjV6cHpS?=
 =?utf-8?B?M3gzL2FyWm9PK080c3ZPZVpFMG5teHNSS0tOKzZqL3pwWXdBK25uRnQvQnNU?=
 =?utf-8?B?UUFZSkVIQ1JiazloRVBDUlQ0Mi9UVjErWk1sTFc2NU0wYmMrQ0Qrb08zZ3cw?=
 =?utf-8?B?b0NaMkRNK2NiRmlvdmhaekdUSlg1UTBIWTk3WnZSYVlFQTBXWFpCWW9xZXpk?=
 =?utf-8?B?a2hjbElmYUM3VWl5anVCcHAxYUFrSm9Ka2kvOVRWS3hObm8vcnZZN1JvbklX?=
 =?utf-8?B?cW5BRkRvTFBvdTRMK3dDd2tVU29pQmtqNmx6eW5WWmVKMnR1b0hzVzl6bmVu?=
 =?utf-8?B?OWh0TGMra2lCaGUzSTQwZFRKWXVLSk4vN2tJejFDeEJQSTdEbXZ0Mis5YVRV?=
 =?utf-8?B?TEhtaXQ0enNaa0phN1RKelBwODVtZE5KazFTN2NCMnVSdWxIQUZEVzU1OThY?=
 =?utf-8?B?VzJhbHNFNkpXZ1hESzRvYUVTV3FLbTJ4bzVvVXdjWVl2RytlOEdOT3V6YlQr?=
 =?utf-8?B?YjZHTmRIdWhPRE8xekhpQW5ZVUJxY3czRzZCVmhRUEVHQU52ZlJUZ2JsdmFO?=
 =?utf-8?B?dnRvWEsyb3ZVZUJ4OGR2VTBlTlk4VVI1UUhpeVdLS21COUZQa3d6Z3RvYzNZ?=
 =?utf-8?B?ekZEWE1DajA2a3BKR1R0aldkUGNlb1pSVFJDdUFZUDdtdkJNWk55M1NYeTk4?=
 =?utf-8?B?L0h0RGZpMjZscDFIeFVSS3lNZ0pCb0ZTbWdlblFGNTZVa3NCK29PdERTWUpa?=
 =?utf-8?B?d2hTSHVVMnVYanZxM0FBYmptRk9EK0o2eW5Ba3VZSFpWS3c0VkZKY1RFZ09r?=
 =?utf-8?B?Nm1maTcvaDlFYUJlWklNVFVUMWg1SWZ0aEg1c2xhRzh5dUZ6ME9jNVdQVWl6?=
 =?utf-8?B?K0Y1MkszZWg5cDErQk83Z0tPQ3haY3cvMUhZTWd4Ulg2TlBQelNDWEdzOE95?=
 =?utf-8?B?U083UUhad1VxQ0VzT2dmNC9kbUNMeG13K2NNUnBCb0RpYmFlQ3lHdTMwTGdx?=
 =?utf-8?B?U09sM25vaXAxMGYrTHljVW5jUFlUeWtGbi9JQzF3RjdFcnJESWoyOTkxMkN4?=
 =?utf-8?B?L2I5WTNHOGZZQmJVT3ppbXBrWTNBSURqSjV6dVY2Uno3azVZTWZGTm51bldX?=
 =?utf-8?B?OEowc3AzNVliRnV6M0xCRE4zMElIUnl5VnlBVm5GaXdLd3JseTlBSXNCTEND?=
 =?utf-8?B?Q3dHUlV1UXhRWmlFZ0xaTVg1SWhpRXp0Sm9kUGhVM0ZCbm5ubUgyWGViajJM?=
 =?utf-8?Q?Y8kMKQ9ZnxGXlj8VN8eqd7dAX+Pr+l2PPlkKq0c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c225ee5-74ad-448d-bda1-08d8ca082a01
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 18:59:28.8889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5v8JyPzZCKpDH9lRpYHloFPKyWLw6BDHsBUlUW0IzMYu2RfMQAD1vPnH9OoK1aw+Sdw0cpW1RC7Om8GPLc9AHz/8+qSSsS4FgNn4orkfcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3544
X-OriginatorOrg: citrix.com

On 05/02/2021 18:46, Ian Jackson wrote:
> Igor Druzhinin writes ("[PATCH v2 2/2] tools/libxl: only set viridian flags on new domains"):
>> Domains migrating or restoring should have viridian HVM param key in
>> the migration stream already and setting that twice results in Xen
>> returing -EEXIST on the second attempt later (during migration stream parsing)
>> in case the values don't match. That causes migration/restore operation
>> to fail at destination side.
>>
>> That issue is now resurfaced by the latest commits (983524671 and 7e5cffcd1e)
>> extending default viridian feature set making the values from the previous
>> migration streams and those set at domain construction different.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Thanks for splitting this up.
>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
>
> Andy, I think from irc that this meets with your approval but can I
> have a formal R-b ?  If so please put my tools maintainer ack on it
> too.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

