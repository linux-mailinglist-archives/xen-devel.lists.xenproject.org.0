Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBB930043D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 14:34:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72783.131112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2wZc-0005en-LB; Fri, 22 Jan 2021 13:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72783.131112; Fri, 22 Jan 2021 13:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2wZc-0005eO-GG; Fri, 22 Jan 2021 13:34:00 +0000
Received: by outflank-mailman (input) for mailman id 72783;
 Fri, 22 Jan 2021 13:33:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVda=GZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2wZa-0005eJ-R7
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 13:33:58 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84854e2d-ca5d-4a16-a507-cd009ca5995d;
 Fri, 22 Jan 2021 13:33:57 +0000 (UTC)
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
X-Inumbo-ID: 84854e2d-ca5d-4a16-a507-cd009ca5995d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611322437;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YK1cRSfOeNSu05PO4CMT3INdQsvRhArerbKlpMDZyF0=;
  b=gWKUfWadj9aRRUvCSg+npfrSGV2T/Urzf8b7QPUGEOeg/qD7o3o4FoE7
   qGEJRaPJ2gGgb51fIQ1YghSbW2S3MFZyf6A2UJ02jPS3HLGVpowN2wWSn
   X1n7OQpuy9nqoy7DwooiUoYLg60tDu+mcZJarfqQSi2jMTUwrv9GEk6ec
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nrFguBrswo1N9dB4Y06rN8HrERl4VyPFcGHLa71E8NV+nfkUDJ6y61bDOCy9FcKav8YEHBQKZ6
 AJAc/2Oc1sJU+ByDYLxkdX+fB8DkL7T1osbmeORRPOEqNeoLEjlmhnyG+62frZRrDntlVtL51E
 2n+ZvJMN2PPSXY5mPRl99t+6h5+xPTYODLb1MhyNdhSZwELA7DAxhcEG2bwA5QFZn++q+BugGY
 Fshm0RU3w4MkDlgdi6VI5K8iVr5zaJNSb3su5SggHUurKc5Zkg37yJcxYJe5kLVtLTJcAGOWSV
 gEU=
X-SBRS: 5.2
X-MesageID: 36029263
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,366,1602561600"; 
   d="scan'208";a="36029263"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bl3m3J4Xhtnttv70cfzGsMA2DEizzr3XB1490QTgOxRXy/0dAP/7ymJuUJ48I7O7eav/oPiy0JNTJOG7s8sPjHcV8ecFQQUkpGjXOchcwEHLsmoW0xwjbVbuCpeFgTEJCsSkNj8ktJVG3MRnx1lUVYbaexj9FH29UF6q23lTFab//VB/7/1nq1TV1XTLRSgVXhxxIw8gJFknqYaH/GgpOTrWKmbnRN+YTA/jKBSRG4FjRQ5EtgAkr7zUJgsEA2ol8yHL4aH46mkCA3Hq+aBhi/wVHG/YCIvMpbZeeNkFeY08hrQ5BY4OsJXpszl/K0NjTp3d6gTq8pFRh9BjfSaBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXj8T+kVBe3oToXqDqgWScLsMhyhrCEkRegfCnEsnis=;
 b=HQUJFtrZFb5AL+o9ykRkttNWa4IyWwU8So113QgrHxcDBRtxokXBJm/DVzCFVJO8h7ArbBAtBDyM2aYtFSOUj9+ADgDol4U6yS3DkHRTVSb/RLsG3mGca3YQ2CJJ+xfe2wascdk1fksfrGAnbDJGG+jEeA9qfs7IxrE9olE2OjQ5Eb/IoW6plcY5G8Iwl1duhIXuvoO2ZEg3UtOyEbOU67mIw0Wj4RqlCzL9/86uVzs49ov84uNGSyY7dw235afCKJ1AbzK8axitOwQHf9Nu8ZzrNjRQ43eQBYy/khixyV9OwxmKAZ5m6uPOOmdImR+Laz3sTKu9z95YVtrMJZ05KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXj8T+kVBe3oToXqDqgWScLsMhyhrCEkRegfCnEsnis=;
 b=aiI97mW3jR/6hRypZbGieQ+z458LNrSn8Tz5yxzHOKhiL/kxAm1C1lSbOL3EkMNtL/vZEB1nx+wfgW9IH/mZpDIC/or5ZM0Z15QhNBd+aVbz8Kq/Vgav0EXGAkL799rtwa0C4mdsQuR1pdkqp+bDVNMYXzvnxQaXlhGjt98patw=
Subject: Re: [PATCH v1] xl: use proper name for bash_completion file
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <20201020123928.27099-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <391d3d0b-0c07-b3e0-47ea-e9918f591587@citrix.com>
Date: Fri, 22 Jan 2021 13:33:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20201020123928.27099-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0168.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::11) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de06bf7d-e354-4fb3-828c-08d8beda5c44
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5696:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5696E5EAFE7B2D26035805D5BAA00@SJ0PR03MB5696.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6vkZA32ZuVOjCaCByrlrWQcg8WXFYvdLkymNTL4YF9Z+r8N2GksF7bRTCpBuPUmnDZiXz/irJT+CveV3eqn1mfjRpGMKffILRb/yvt4ga86YIglNwGz39flRoz6j7aD5pOMXnTB9rUjUg9cIbrmi/BmzOZcQPAiTnSeA+iYMgk+XlUXKTZk0C+ckQ9miqPTXhwC+Ba5fb84R1JkeoCNNZRUjHWhXfB0DCFoYJZ1jr8FWwxQmUyE0fXJbhEhI+gyfWXW/e2OXJV+nhrAZNLWUDiqSiEJy1jOZnDbUPUnLNRvcn3jk98IRTpPj1tGwTXHZA/EfiAUCLHjlmYXAIGPDYYq3F45cOl+SGmYilXuZRSHbApykfGd970Pss7SCyH2J3OGOuLyliDDl/FeSLxOOc67Due8alxUQLGEojujpO6O62kYQAYTGfZsWy4ZCjRM0wNty8PK120Hy0EdecfD4WCmZdsHTshEoRh907vI4Yuw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(186003)(2906002)(4326008)(478600001)(8936002)(53546011)(54906003)(66476007)(5660300002)(36756003)(66556008)(6666004)(956004)(107886003)(31696002)(2616005)(66946007)(86362001)(316002)(31686004)(83380400001)(26005)(8676002)(16576012)(16526019)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SW16V0JGTUpiOVhHaVJGc0RWVHltOCs1aUdqbDB6NHk5M2Q2d0xleW5aRmFr?=
 =?utf-8?B?dXZPc3ZPU1ZaTlBreitMRUI0dkpGbWtoMmV3K1B2cnRoekR0UmVrMWhFdmd1?=
 =?utf-8?B?Uk1qS1NGcnFWWlBvdUUyMHRleFpGV1BDbzJscnB5T1IzYXdGcERKNjhsUFkw?=
 =?utf-8?B?R0lSOWJYMERmenQ0ZDloUGhGaGJ5QXNQU3FibGpkUENOWXA3eDFkdGNTN1ha?=
 =?utf-8?B?QmgyOFZwRW9mMlQvV0E2MmJ3SDU1bFUrK25BakF4R3gyc0pGQ2xzWlNSSlVS?=
 =?utf-8?B?TXpWdFl0eXN5Njg1cnB1Nk9qQmZGcExYcGNiYU9PeG9BTnVTeGVzZ05oTmNV?=
 =?utf-8?B?K1cyU0hxOE1pOGZNWVVqOHp0Q3JCZDRLVGdERGM3V2diVFBnTmtaTFVmR1dy?=
 =?utf-8?B?UDNkOU9pVURYMkRjTU9adzVPODRXaTB6OU9zUGM3T0UvUThrL2NYa011d3l2?=
 =?utf-8?B?R2hZT3FtNGpQMUxrQWVzN1AyT3hwZk0zc0RmYStMZ0EzWWtaYzdmNmh3UG0z?=
 =?utf-8?B?KzF6ZFJLOU1zOVZSZDFscGxFMU96eW90WS82b1hTVWNGbWQ5R1U0NCtHL3R6?=
 =?utf-8?B?SE5vak1nQklVRzF0NlFFVk14NnQyV2JLWm0rN2VMWTMzcjFWNjdhaE1rcUla?=
 =?utf-8?B?cUFmeGFhZWg0dTZabzJwRGpBOGt3TG1NS3R6dW5GSi9ScWVHSDJoRlVMYWw4?=
 =?utf-8?B?TzUxdjljMU4wTkx3QmpEMTdJRURhTzJOTG1KWURXUlppa05BYmNiSGZUWEp0?=
 =?utf-8?B?REdLSnU2VjZEdzlkMk9jUDZvTklrNUlVN1FjeVJDOHdXUUZwSElvTmdZWENH?=
 =?utf-8?B?SVRkYWJjWGFMNStSdUU0cFJ4VU9QK2VLKzVkV3FubDFld1Fxa2FONnl1cE1n?=
 =?utf-8?B?Z1dtcGdsdzlDemFZTnd5TGlTaGFqdkdjMVRhNTJKdXFnK1Jpb1JyblJrNUtC?=
 =?utf-8?B?N0F5MGpnMFA5MS8vVkFGRFMzQXQ2b0FlcVM5a0hBNTg5L0piNTZmallWay9B?=
 =?utf-8?B?TTRLWFYya1hxUFVjcTFtcGNOZlBlemZ0SW9EWFUwL3BteW5XSDhXRHN4WUJI?=
 =?utf-8?B?U1B1YWh4ejRDdkRmSko5ZmIzWkdvMVdxamZrNU1rU29tMHpwQ05BTzZTRGtU?=
 =?utf-8?B?b0d3UWUxQktkc3dQR1cyRUNDQlFrNUpMb1BBUHlYdlJGVGZGMGhpUU1NWkRs?=
 =?utf-8?B?N1huQWUxM1pLbVk3ZWUyanFQUzBxWWFsK2d5RkVwRndxMWZhYmIzTlhvNGhD?=
 =?utf-8?B?RWpOOHMySHUrVXNuSGcrVkVTQTVsZXlCVHd1LzJubW1rd2Q2VUYyR1R0enVa?=
 =?utf-8?Q?c9EGfiT/ZfZTmiWXnDc5twzb828ked78jR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de06bf7d-e354-4fb3-828c-08d8beda5c44
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 13:33:53.6255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfuBdA/Z5vq8nXcrRnLwh5rTB4RSb2iiqRcPSqUZGVzDkQkiSfU4z0esa261Vr4FIyKX5Ac7STOnNc5UZdDnu7/pyLDs6Oena/0wlAzl5hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5696
X-OriginatorOrg: citrix.com

On 20/10/2020 13:39, Olaf Hering wrote:
> Files in the bash-completion dirs should be named like the commands,
> without suffix. Without this change 'xl' will not be recognized as a
> command with completion support if BASH_COMPLETION_DIR is set to
> /usr/share/bash-completion/completions.
>
> Fixes commit 9136a919b19929ecb242ef327053d55d824397df
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This obviously fell through the cracks, but definitely matches how
systems are typically set up.

> ---
>  tools/xl/Makefile        | 4 ++--
>  tools/xl/bash-completion | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/xl/Makefile b/tools/xl/Makefile
> index bdf67c8464..656b21c7da 100644
> --- a/tools/xl/Makefile
> +++ b/tools/xl/Makefile
> @@ -45,11 +45,11 @@ install: all
>  	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
>  	$(INSTALL_DIR) $(DESTDIR)$(BASH_COMPLETION_DIR)
>  	$(INSTALL_PROG) xl $(DESTDIR)$(sbindir)
> -	$(INSTALL_DATA) bash-completion $(DESTDIR)$(BASH_COMPLETION_DIR)/xl.sh
> +	$(INSTALL_DATA) bash-completion $(DESTDIR)$(BASH_COMPLETION_DIR)/xl
>  
>  .PHONY: uninstall
>  uninstall:
> -	rm -f $(DESTDIR)$(BASH_COMPLETION_DIR)/xl.sh
> +	rm -f $(DESTDIR)$(BASH_COMPLETION_DIR)/xl
>  	rm -f $(DESTDIR)$(sbindir)/xl
>  
>  .PHONY: clean
> diff --git a/tools/xl/bash-completion b/tools/xl/bash-completion
> index b7cd6b3992..7c6ed32f88 100644
> --- a/tools/xl/bash-completion
> +++ b/tools/xl/bash-completion
> @@ -1,4 +1,4 @@
> -# Copy this file to /etc/bash_completion.d/xl.sh
> +# Copy this file to /etc/bash_completion.d/xl
>  
>  _xl()
>  {
>


