Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB7C437631
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 13:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215026.373948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdt49-0000rS-4o; Fri, 22 Oct 2021 11:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215026.373948; Fri, 22 Oct 2021 11:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdt49-0000p0-1B; Fri, 22 Oct 2021 11:50:29 +0000
Received: by outflank-mailman (input) for mailman id 215026;
 Fri, 22 Oct 2021 11:50:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBiv=PK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mdt47-0000ou-7D
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 11:50:27 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7eee51b-f5d0-4eff-b76b-64f2bbedd4c1;
 Fri, 22 Oct 2021 11:50:25 +0000 (UTC)
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
X-Inumbo-ID: f7eee51b-f5d0-4eff-b76b-64f2bbedd4c1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634903425;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=H9bfAxHq9C4djbYaVFzfI7/T3GJLqJyrIdorviNKW4s=;
  b=KuhDQT3dsSoawAdhZQxkYiv4VzzgYsDid7nrsm1+ICi5HYd5JLgijvxV
   1e2bAn7sCYZbrXuqfeMPFiWOctFqDhCHJQOfZ6jjcFHVit7bhZqhONo+f
   lhRIaz/afb+PjvVCDn35o4j5uL7XllrM9oa7AFNu1vE4BZQ0uPQ0Ln7os
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZQYD7joum40Hn9lLF8T0+iBYNKsH2NoTsbMUjvT1NCjzlctiHZidO1H5B4ph+Kkc2NlRVikgcF
 7pDICL3R74D72WBIbzLgRGuCPhXiN+pclvRAXFmNcY6mVDfwRb2u73v9/JdsEe6/4EjSQeBAZW
 ZF3PLV3rpBkEIFrYRgqnDfXVnCRed5aGDUEtWBMkHhX/dhsYNbjNTv0lbBleqqyeCOHbSv8UBQ
 cpCSkKlv9f7M95wRzyNeDzHvxBbaL2Xo0j0YYp0w6sjYfXXwYDqSsNiNCwXj0SsHsy3I0FNl/d
 9loWuYF+f/rGTcE9g/yz23Z5
X-SBRS: 5.1
X-MesageID: 55846986
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9CLL0K/Zbcwtzqa96d02DrUDjXiTJUtcMsCJ2f8bNWPcYEJGY0x3y
 mQWC2HVPviJNGv3fIoiYIq08k0O7JaHydViHQs+rS88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrZj2NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhg6
 YoSvLPrbD4YL73BtfQtAjkFLwBxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0TTaqAN
 ppHAdZpRArvTh5qBkxGNMI/l+Sx3Uf5az4E8U3A8MLb5ECMlVcsgdABKuH9e8OIbdVYmF6Co
 WDL9Hi/BQsVXPSdwzeY9nOnhsfUgDj2HokVEdWQ+uZxhVyPxkQaEBAMSUaguv69l1K/XNREb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6VCWQJQSRIQMA3v88xAzox3
 xmGmM2BLQJotLqZWHeM7IC+pDm5OTUWBWIabCpCRgwAi/H8pKkjgxSJScxseIaulcH8Ezz0x
 zGMrQA9iq8VgMpN0L+0lXjFnjatq57hXgMzoALNUQqN7QR/foepIZOp7Vvz6uxJJ4KUCFKGu
 RA5d9O2tb5US8vXzWrUHbtLTOrBC+u53CP0kH8wQJAOrBGUym+zcK1A0GBeeXtIPZNREdP2W
 3P7tQRU7Z5VGXKla65rfo68Y/gXIbjc+cfNDa+MMIIfCnRlXErepns2PB/Pt4z4uBF0yflXB
 HuNTSq74Z/244xcxz2qW/xV77Yvwi0vrY84bcGml0r5uVZyiXj8dFvkDLdsRrxmhE9niF+Mm
 zq6Cyds408DOAEZSnKPmbP/1XhQcRAG6Wne8qS7jNKrLAt8A30GAPTM274ncIENt/0LzbuYo
 ijiChcDlQuXaZj7xeOiMCwLhFTHBs4XkJ7GFXZ0YQbAN4YLMe5DE5vzh7NoJOJ6pYSPPNZ/T
 uUfetXoPxi8Ym+vxtjpVrGk9NYKXE3y3WqmZnP5CBBiL88Ib1GYobfMI1qwnBTi+wLq7KPSV
 ZX7jViFKXfCLiw/ZPvrhAWHlgLo4yJFwb8qAyMl4LB7IS3RzWSjEASo5tcfKMAQMxTTgDyc0
 gedGxADoufR5YQy9bH0aWqs9u9FysNyQRhXGXf197GzOXWI92av29YYAu2JYSrcRCX//6D7P
 bdZyPT1MfsmmldWstUjT+Y3nPxmv9a/9aVHyglEHWnQawj5AL1XPXTbj9JEsbdAx+EFtFLuC
 F6P4NRTJZ6AJNjhTAwKPAMgY+najaMUlzDe4O4bOkL/4CMrrrOLXV8LZ0uHiTBHLaszO4Qgm
 L9ztMkT4g25qxwrLtfZ0XwEqzXSdiQNCvx1uIsbDYnnjhsQ5mtDOZGMWDXr5JyvaslXNhV4K
 DGjm6ef1a9XwVDPciRvGCGVj/Zdn5kHpDtD0EQGewaSgtPAi/I6gE9R/DAwQlgHxxlLybsua
 G1iNkkzLqSS5TZ4wsNEWjn0SQ1GARSY/G33ykcIyzKFHxX5CDSVIT1vI/uJ8WAY73lYL2pS8
 7yvwWr4VSrnIZPq1SwoVE858/HuQLSdLOEZdBxLyyhdI6QHXA==
IronPort-HdrOrdr: A9a23:fsDzPqqHVYYzd/XqvSxb+rwaV5oGeYIsimQD101hICG9E/bo7f
 xG+c5xvyMc5wx8ZJheo6HkBEDtex7hHOdOkO0s1O6ZLW7bUQiTXfpfBPXZrQEIcheWntK1s5
 0QC5SWYOeAdGSS5vyU3ODXKbcdKM7uytHKuQ6n9RdQpPZRGsNdBzESMHf8LnFL
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="55846986"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gtv+TO+hW8jL2ZjnDuHKXGaLKDIopgkoLfYgZnMc5wr3BiJQKuSrdj9OTA+eqvMJ5jE0Aj0y7ll7WTwoMmixnoBin2EnKlKdfSIlV7WAknHDzARmFZuA1cgxEt+o7jLdTc7tMK98F2yU1+ZgHAV8PBTukg7y+f9JcBWXRu+O6KZDl88AtFuoieWenZGRR07HoJ9i46C3lMhCD450X9Qw/RbIgIZ47RLH6+T+oSFiz45sogh12SI9VpEHBS2hfd9IOFNnSZEOcXXo8dmsqhAuqIiFt04Sgm5tFvgf+F+1U4EEK15nUT1M/BC3z0ghKs6gFxqGQEQfIRs05puWj6aCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9bfAxHq9C4djbYaVFzfI7/T3GJLqJyrIdorviNKW4s=;
 b=CrdN8ryuUEAAUSs3lM43jqmOSM7UTx9H5d8Y6vddYh6sHDbEsR3bL+2XKf/0rIC7B+sNSwzxU1rAauhpEm3bpPX4sV0O8ilVW//GpZ7cz3cNk8Q8oKYkBYimzI+6PvHwtAdApOKFVDIBaBwrjFeRFScthWghq/opRJ8Y5/0DqpjfIQ78bqEn+Vh80X+h9AFGPwNTEgqiKvJs/yMsaRbDNNeKN0wV8t7jbD2E8NZNRCnYwISmixBw47xkdJlhHThtG1vuFWZQK+UPp3XQ/DKku/ZwzUP2+LSaIpTjf0VuBIUvU4c8vQ+FIKpOdqCxbCqTT/CRHzTuDJmjwwFX4yyLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9bfAxHq9C4djbYaVFzfI7/T3GJLqJyrIdorviNKW4s=;
 b=hgf4riJRltQ6YAHmH3G0Ylszx4ByY5pq9PH/B+GY3LWCloQUqQhxWuZ7wcAN0RPQ4i/BWsspeykvxj9ihJLV3NMlLUUy7cJfHCli34mpwC7tgd8rmjj0pdxYjvz6Zm6UgXmUtFynvlItvEhx0zB5AprEj0TyWxwrLmSqi3f7vY4=
To: Lin Liu <lin.liu@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <cover.1634897942.git.lin.liu@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 0/7] Implement byteswap and update references
Message-ID: <c72a5a4c-62ca-4d3b-d5c0-ce6122f924bd@citrix.com>
Date: Fri, 22 Oct 2021 12:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <cover.1634897942.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eee86203-e873-4d86-2101-08d995522070
X-MS-TrafficTypeDiagnostic: BY5PR03MB5220:
X-Microsoft-Antispam-PRVS: <BY5PR03MB522056462E1BDF48A782D0CEBA809@BY5PR03MB5220.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fiiZZgDWJlRr2ftCtVaRbcqQrCUmSzmn2gUNE9W/0q5xW7RWopTMDYewGshC632lI/k/3n6fYBnBZavNbYbGuMzfJED6q3M2vJsztbARS1l99yo4+Pzd2xfM/L26XQGvOD8VAGQ7KqT1Yz8C/SkHup9ev1vO3qH3sxGT2RcCw9BgRmro1th7zqhszVpBhvQz4WHOeYYzecdfyD1aPN1aw6pMxrMXOft2ApKLf5BsGhxHGE4JQi4NZR9Dpmx2KNUy2KReYTgIda5UNg4v4psnFIEBT+gWJf6hxs93PyQdecn7s/wynmx1ND2ALGdnQDM5nd0oyNUO+SvSZ1igh+zmGzsadb1EdOjg4sEK0zByoDKePEPycG1zu8Xdvf9ooBayvxN3xghziQXhGTRX6aIuhC+D8yNaTB9MEBRq8da3Yfxhi0DqaORnCmQcOkeeXzhVGLQdNJ4VFAGkCGHPMzrPfbc2DBMYmMyYjiLlYDKfk+e1JYb8Pz7dbmBRFf4uq74AY4pSkBWTu+1MxPL2Q1DBEuI4Te+MJ96tqkn8Vtc8tKnZJb5EgvDVwbg+ey0RDMYf3FFV6PSGYkMH4dAZR9eGXum5ldXUV27oYNboqTChEBHtHNGR3BvHfSaRyezgitfBkv5zcKO96RkrW816Tx9KbX49le0JkyPaZHqzXvbziT/RFEAA6HahE3Y4i1lcx5DROw/c/3ZIahMaGiPLqmS87f80IsgO3gs119fNN2YUdfg1bzEQbonCoe/csJtPU55J
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(956004)(2616005)(38100700002)(6486002)(26005)(66946007)(86362001)(82960400001)(508600001)(4326008)(83380400001)(2906002)(8936002)(5660300002)(316002)(8676002)(6666004)(36756003)(53546011)(16576012)(66556008)(7416002)(186003)(66476007)(15650500001)(54906003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFFjWUI0ckxVNUFlY1MyUUJCK2owR1ZCMWdLdzh4KzZqclRWanNpY2FSQm92?=
 =?utf-8?B?QlFxTDJlaWQrMGM5L3E2WHJrSXBNOFZadDQ4eUoxcjgzSFN1UzNDVFdUc0I2?=
 =?utf-8?B?dFYzVWJwQllvcFN1MVdSdHdsQUZyVGR2akYxaStrRWM2djlwMGJsTFpva3pG?=
 =?utf-8?B?Tmx1aFNLZ25BMU5lS3lkSUVrcXJqSjI5empqUEtkYlBraVI5US8xS2ZqdXVQ?=
 =?utf-8?B?ZE5RWURPb2FqQmFkaHpVaUJSUlNtYjU5a1BiUmFmL0x5TmZpK1JacVJyZW9P?=
 =?utf-8?B?eFJTbkpLVUw1eE45UURhQ2sxd21zYTdyUm96cTVjUHN2aDZWc084K29lRlZi?=
 =?utf-8?B?MGRVenp6bkNLbXUvSm16VDFGR2VHWGFyQloxRWU4anpYU2xwbFNLaFZLdU1M?=
 =?utf-8?B?WkdRQ1k0N1k0K0RaN05rdHhiVnRCNjdoZFd1TmRROTF0QjE4aWJPWk05N25Y?=
 =?utf-8?B?amUrYXhZa1Z5bGdITm5LMWlwVDV4dUp2SFVZLzNoY1ZBZDZJUGc3cHRZYmE5?=
 =?utf-8?B?RGdVODZmTG1lbktldUllYkw0dXlkeWk1SzM3cUJOZWN3Z0VWYTQxelBPMWRE?=
 =?utf-8?B?ZGg4ZDZsaUFUcHFBdUd0QkwvYmYwTjZnWWRyNnRCQ2VtOFZRTWhVbldpRk93?=
 =?utf-8?B?WG5BRzFNRGtmbkF0OG8ybGc0Rzc1allDUHV3YzczT2ZJUUpvakhSMGRVdjFw?=
 =?utf-8?B?MUpJRS9DWldYS2NoUjJ4NGpBdTZ1SmtZOGYxL0xOOW5OZDBCY25tV05pODhV?=
 =?utf-8?B?elh5UkNhTTJBQkYrRlJuK0cwMEs0TnVhaUxIOElGMTJaQlcxWUFHZHd6Zk9k?=
 =?utf-8?B?Y2pzY3BvRmc0M3NFQS9kbzQ2RjdmZU9HZXRZVDBaVitXek81MDZwMVhNTHV3?=
 =?utf-8?B?bUlUaG5yWkNybUNJNzNlVGVnZkxhMDZua1k1L0hyenYwMjFBVCs2SUkwTjF6?=
 =?utf-8?B?MVBESGtkdWdDYUF2NnZSOWhaYTF3MkxxK0Zoa21EVXRlK2twZUh6K0gwVDc0?=
 =?utf-8?B?M1hXcGRZYVJwbmxPKy8rVnBLcE8xY05ETi9UQWtpUWV0MnAyYnlCc2NkL1E3?=
 =?utf-8?B?VG1TdXlhUHhpVlhWZ3ZsZGpnNm9UcGxnVU9Za3gxWk1Kdm1la21KRWVpOGdn?=
 =?utf-8?B?MlRPd3RGWkNZYnJ4eENCbDNGbkpJY1AxNVJveTNzWmJLUjg0Zlp0NDQzQmtS?=
 =?utf-8?B?dnVuRTJPTWM5Y2VUK2JuZGdZa1ZIMTZZc0V3VUdPKzRDTlltbEJJRUhPWS9G?=
 =?utf-8?B?c2xETHZVT29rNm53MWxoOVNoTFhmeVUxSHVjclNWbEJJZ3FQVk5KMU1mSGhY?=
 =?utf-8?B?clQrVGFlWFZQdVltZ2lkQ3VrT0ZpRkEwZ1VyRTZnSFB0NjIzeWV6RVI1aDdZ?=
 =?utf-8?B?ZUNadU5TUTFsZlpua1pUMmx6NDJodnhxNlpjdlg3aUdIS3h4dXA3eVArdHNG?=
 =?utf-8?B?TVBRd3AycXM2TU9pMTNpR3BRaEF4NUlTZnFSajBjdXl2eUJMMEhBd3hKWGlL?=
 =?utf-8?B?ZDU4RGpvamdrYWxjTVJKa0pWOUJQbWU5MWxxamlOc2ZZMmgyWk1tYXhkZXdh?=
 =?utf-8?B?ZmRKWmRWamRxbk1DeTFnNzFDclpSd0ZMSm9yWE1tQnBzRjdlcnovYXhYQVJN?=
 =?utf-8?B?SXlkWXN0N3I0alo2RmpPem5FVGhVNmtuMUJSalk5WFloZmlOUGVURnZSemZF?=
 =?utf-8?B?aGNVbEkvcFpJeGcybUlsL25LSTV2S0hVL3BYYTBLZ2RZUGVxQlk0LzM1QUls?=
 =?utf-8?B?MVJCeDJZT3IycHkybXAwQ0JRT2dDUHBaOFN6dkRaZmRpb3cvSC9UVVpkK3h5?=
 =?utf-8?B?ckl3MkhaZDAveVJweGFucHJYUGVNaElzbGQ1UFkyVE9YK1dNODJwYWNTQkdG?=
 =?utf-8?B?S3RkS3NIa1dSb0tPVjY3N2NuZ3NUYkZxVkhGYjgzWkhQalJKTmkrQ0tmYld6?=
 =?utf-8?Q?yGJv6nZgfaqtgRKRbmWXeLvOcw3V7VrU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eee86203-e873-4d86-2101-08d995522070
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 11:50:21.4781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: andrew.cooper3@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5220
X-OriginatorOrg: citrix.com

T24gMjIvMTAvMjAyMSAxMTo0NywgTGluIExpdSB3cm90ZToKPiBUaGUgc3dhYigpIGlzIG1hc3Np
dmVseSBvdmVyIGNvbXBsaWNhdGVkCj4gU2ltcGxpZnkgaXQgd2l0aCBjb21waWxlciBidWlsdGlu
cyBhbmQgZmFsbGJhY2sgdG8gcGxhaW4gQyBmdW5jdGlvbgo+IGlmIHVuZGVmaW5lZC4KPiBVcGRh
dGUgY29tcG9uZW50cyB0byBzd2l0Y2ggdG8gdGhpcyBuZXcgc3dhcCBieXRlcy4KPgo+IDxzbmlw
Pgo+ICAzNCBmaWxlcyBjaGFuZ2VkLCAxNTAgaW5zZXJ0aW9ucygrKSwgNjQ2IGRlbGV0aW9ucygt
KQoKSXQgaXMgd29ydGggc2F5aW5nIGEgY291cGxlIG9mIHRoaW5ncy4KCng4NidzIF9fX2FyY2hf
X3N3YWI2NCBpcyB3cm9uZy7CoCBXZWxsIC0gaXQgd2FzIG1vc3RseSBvayBmb3IgMzJiaXQKYnVp
bGRzIG9mIFhlbiwgYW5kIGlzIG5vdCBvayBmb3IgNjRiaXQgYnVpbGRzLsKgIEFzIGEgY29uc2Vx
dWVuY2UsIHRoaXMKc2VyaWVzIG5ldHMgYW4gaW1wcm92ZW1lbnQgb2Y6CgokIC4uL3NjcmlwdHMv
YmxvYXQtby1tZXRlciB4ZW4tc3ltcy1iZWZvcmUgeGVuLXN5bXMtYWZ0ZXIKYWRkL3JlbW92ZTog
MC8wIGdyb3cvc2hyaW5rOiAwLzIgdXAvZG93bjogMC8tNTQgKC01NCkKRnVuY3Rpb27CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgb2xkwqDCoMKgwqAgbmV3wqDCoCBkZWx0YQplbGZfYWNjZXNzX3Vuc2lnbmVkwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTczwqDCoMKg
wqAgMTUxwqDCoMKgwqAgLTIyCnVubHpvwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMTI4wqDCoMKgIDEw
OTbCoMKgwqDCoCAtMzIKVG90YWw6IEJlZm9yZT0zODAzMzI4LCBBZnRlcj0zODAzMjc0LCBjaGcg
LTAuMDAlCgpiZWNhdXNlIHRoZSBjb2RlIGdlbmVyYXRpb24gZm9yIGJzd2FwNjQgZ29lcyBmcm9t
OgoKZmZmZjgyZDA0MDIwNTliMCA8X2Jzd2FwNjQ+OgpmZmZmODJkMDQwMjA1OWIwOsKgwqDCoCA0
OCA4OSBmOMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDCoCAlcmRpLCVy
YXgKZmZmZjgyZDA0MDIwNTliMzrCoMKgwqAgNDggYzEgZTggMjDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzaHLCoMKgwqAgJDB4MjAsJXJheApmZmZmODJkMDQwMjA1OWI3OsKgwqDCoCAwZiBj
ZsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJzd2FwwqAgJWVkaQpmZmZm
ODJkMDQwMjA1OWI5OsKgwqDCoCAwZiBjOMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJzd2FwwqAgJWVheApmZmZmODJkMDQwMjA1OWJiOsKgwqDCoCA5N8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhjaGfCoMKgICVlYXgsJWVkaQpmZmZm
ODJkMDQwMjA1OWJjOsKgwqDCoCA0OCA4OSBjMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG1vdsKgwqDCoCAlcmF4LCVyZHgKZmZmZjgyZDA0MDIwNTliZjrCoMKgwqAgODkgZjjCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtb3bCoMKgwqAgJWVkaSwlZWF4CmZm
ZmY4MmQwNDAyMDU5YzE6wqDCoMKgIDQ4IGMxIGUyIDIwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc2hswqDCoMKgICQweDIwLCVyZHgKZmZmZjgyZDA0MDIwNTljNTrCoMKgwqAgNDggMDkgZDDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvcsKgwqDCoMKgICVyZHgsJXJheApmZmZm
ODJkMDQwMjA1OWM4OsKgwqDCoCBjM8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHHCoAoKdG8KCmZmZmY4MmQwNDAyMDU5YjAgPF9ic3dhcDY0PjoKZmZmZjgy
ZDA0MDIwNTliMDrCoMKgwqAgNDggODkgZjjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBtb3bCoMKgwqAgJXJkaSwlcmF4CmZmZmY4MmQwNDAyMDU5YjM6wqDCoMKgIDQ4IDBmIGM4wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnN3YXDCoCAlcmF4CmZmZmY4MmQwNDAyMDU5
YjY6wqDCoMKgIGMzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0ccKgCgpBbG1vc3QgYWxsIGJ5dGVzd2FwcGluZyBpcyBkb25lIG9uIDMyYml0IHF1YW50aXRp
ZXMsIG5vdCA2NCwgd2hpY2ggaXMKd2h5IHRoZSBkZWx0YSBpcyBzbyBzbWFsbC4KCkhvd2V2ZXIs
IGl0IGFsc28gZHJvcHMgNTAwIGxpbmVzIG9mIGNvZGUsIHdoaWNoIGlzIGEgZGVtb25zdHJhdGlv
biBvZgpob3cgc2lsbHkgdGhlIHN3YWIoKSBpbmZyYXN0cnVjdHVyZSB3YXMuwqAgSXQgYWxzbyBy
ZW1vdmVzIHRoZSBuZWVkIGZvcgpwZXItYXJjaCBjb2RlIHRvIGRvIGFueSBvZiB0aGlzLgoKSSdk
IHNheSBpdHMgc2FmZSB0byBnbyBpbnRvIDQuMTYsIGJ1dCBJJ2xsIHVuZGVyc3RhbmQgaWYgb3Ro
ZXJzIHdhbnQgdG8KcHVzaCBiYWNrIG9uIHRoYXQgYXQgdGhpcyBwb2ludCBpbiB0aGUgcmVsZWFz
ZS4KCn5BbmRyZXcK

