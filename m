Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69556405BB8
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 19:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183432.331609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONSv-0001Ub-PP; Thu, 09 Sep 2021 17:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183432.331609; Thu, 09 Sep 2021 17:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONSv-0001SA-MC; Thu, 09 Sep 2021 17:03:57 +0000
Received: by outflank-mailman (input) for mailman id 183432;
 Thu, 09 Sep 2021 17:03:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYjb=N7=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mONSt-0001S4-GU
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 17:03:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 689a7643-5b64-4972-bb69-be7388a6cca5;
 Thu, 09 Sep 2021 17:03:54 +0000 (UTC)
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
X-Inumbo-ID: 689a7643-5b64-4972-bb69-be7388a6cca5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631207034;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3aARRyjjI0EjxYyqpL6Ioai4rZieo2Y1y2K/3KUz/Z8=;
  b=T6nU1qG/JHIibj+YBdW5V05Y2Y4kdvC5hcHGi/uTo55Ibi8eY5z5xh/Q
   5tQYKRtLgF/83vLyusmf7U/mu8acyXu3h7Sq7A7AeCqs1nZxPhJ7aDJ0R
   U4fppKk54LkPkamnIMMpmFX+QDRCyeN/jHe3559/HK/2ihsnL6e/p0BRu
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: POJUicAwHf6ZMjosqRR4nOMTtTvVOnUmgQN2qLVIb0hoJzK4xNj4gurq4No581Vbi/cNoaBmNV
 CjVEnoiOCpSqHELjkUKAGHqyZxPANOhOpB0+5otUYbokj1hwNekOF4qnHw3fBzHbprRybzSTxz
 BF1vzxW4Fe7hexxeIvmY9K619kj2t5jOFJtAJoCweijD0BS6vLwnCa4EOjFCn93i7uPF3/FvQQ
 X3gyBfpyz1OaaKe3dS0zZxs0NsejOg86XF6VCn8jnVFABBCLxXnJpa11UZwcTFi6ER/vs0fZpA
 5Nh30JLqs5xBt5FIyQvODLVa
X-SBRS: 5.1
X-MesageID: 52784178
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ewR4WK/kVWEjlO/IvkFuk+FPdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Scy9qADnhOFICO4qTMuftWjdyRaVxeRZg7cKrAeQYxEWmtQtsp
 uINpIOcuEYbmIK/foSgjPIaurIqePvmMvD5Za8vgRQpENRGsVdBm9Ce3em+yZNNW977PQCZf
 ihD4Z81kGdkSN9VLXEOpBJZZmOm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTsj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZuA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQPZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv2nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLbU5nghBgr/DWQZAV2Iv/fKXJy/fB9kgIm3UyR9nFohvD2xRw7hdQAo5ot3Z
 WNDk0nrsAWcie6BZgNc9vpevHHf1Aldyi8eV56EW6XZp3vBEi936IfwI9Frt1CK6Z4gafbpv
 z6ISVlXCgJChrTNfE=
X-IronPort-AV: E=Sophos;i="5.85,280,1624334400"; 
   d="scan'208";a="52784178"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/OSEbZ5B4g8Yv4wmKDU+zXx/q/++1FpqTY2vmG3q6+W8hOSO3ocwyY3fLngqBeCds5nzW/jtRZ/+ckBF+blxjjBvx79RIulfUifdhiosqzhQ8izVQsIHXzJ8b5v4Wo0tsLvddK93aNRhjscT4P6Fim86hpd+dWMWlp1Rj49hb8icJiUMac9qcQkXDnwhouO8hIUQyrumD9uGAnFICoRlI35XhlOIMnbBRWm8iQru0ySp4X5jjEsaGDVKmaiXCkgfKCO/yJfaYWjmClMPTNhbEfRpk3FG6E/Mc03B+7Wo1q/B4R/3PELAuY5bnvWRLjcnZ0CBoymBNR3TT+KQ1dqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3aARRyjjI0EjxYyqpL6Ioai4rZieo2Y1y2K/3KUz/Z8=;
 b=nuxoUclUFf+RRNWW0e1sYFbYvgxEdw91WKJOeAU+ubw/QM0Li51MOxS+PtUsvW5iRibK9DpdCZ2EWw+XC6ohCl47rS7c/AtQVk7cUXwVRfZC7rpUGuzYZr6YoGb/WO+bvPmPNQJmj1QYm+Mj1bkVmjPi5JSA3wZMhjDqZHgW50jf/91L1B73Y7Adg7+ALWdfpqdEMi5FOk9H635M9+sgIVIWlN7puStPwgxYyN4mfJV9D3fXqsJlVPME6559shR8Kwa9cd8m3T+hpgG/dPaLCTqZqQvrcdPWxK23zUKPRT39OwCyLnDeJEWCSFB/BO45gOs410jLHrgbM18y9GxZkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aARRyjjI0EjxYyqpL6Ioai4rZieo2Y1y2K/3KUz/Z8=;
 b=Jo9huMSK3yoY9ZjhWl28YCOdeZEG7S4fjwPO34MDkiOors5sv5GedO3sVfQSCYAz9VpvDp4dp/dHjKj/F80mJ9ezV/xT4tleegiQkDziPvGTePbZ7C0mvy9MgDJlrlpwd+fJtgl5+srI48IDN2VMw+BJ2oAjSWMaCwiKo3Qjfok=
To: Kevin Stefanov <kevin.stefanov@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>
References: <20210909163441.44418-1-kevin.stefanov@citrix.com>
 <20210909163441.44418-2-kevin.stefanov@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] tools/libacpi: Use 64-byte alignment for FACS
Message-ID: <bbde0f13-a1a5-53ed-82eb-704cd5d43178@citrix.com>
Date: Thu, 9 Sep 2021 18:03:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210909163441.44418-2-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0483.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::20) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 486b3e85-393e-42ed-b3fc-08d973b3c81b
X-MS-TrafficTypeDiagnostic: BN8PR03MB4947:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB49475B9CDED52562E5EF72D0BAD59@BN8PR03MB4947.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TwFA/1jy7r4+46bHOnvAIBUSUfm68O6C+4U9/IFYpDqjkzgiJAQWPm0FZrj6K37Q36O2jUIxDu8GCYGMh14pMxIOEkc3hwPw35pVZjrNE/AQkwFHIqv3gy2KJbSDFPd3vmERYczzxYigQSlZ0ekkpPQs/FbrLIvhm8CpJDiDRBKjhl8n6GeXne5fs2Lwnob3JWwNzBrVZELE+0Fmm6JvpaQWAOwPsr+gOS7pVLOVzBEL7ht7Y/pCyHW/Wlf4grlaiAsgmZxfUFIgqgNxtyb0UxrkSaBOy0RGPdb4qjUIK9vNtmtwHN7In79203XUX0+tPC9KKdD5z+w+S40T3sNO5o3Sp4eUzJ2YKGF8WlJbIbaiqahEPMoXW0PQKlhzX5cXNR5NrwZIfe53mlq3jspcB9UxtYR3T/nb9tqEAofLbmfDeqP4+WL1VLaDMTTgHCkRQsvhybZdaQSsXXtTScDkLqbqT0uVROUASMWxCY2MSR5xAdSxsFx1wNePJAsxfj795jHFCRwAcyPbMkGE+Layu2dyoAsj54c7bFHcwQhaf0H+OCFkEJ1b7mUxwi+x64coAzSsVTa//nNjsVnvJZ9TU2+K5j+BEQLEbINUArd9h0qo2SiT/NwQ2uIDGZPJOFtgDXSTCsP/dCKzN2zmqLyVSDhQJPmmuedPPA50mqLGTKJnNZtlkQyJzg9lVmBlPfB58EoOrqGxU62zUBQBUqKM/AlxrJt3C5PgVAXE6EvlNTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(66946007)(478600001)(66476007)(66556008)(8936002)(55236004)(31686004)(6666004)(8676002)(6486002)(31696002)(38100700002)(186003)(26005)(956004)(86362001)(2616005)(5660300002)(16576012)(110136005)(83380400001)(36756003)(316002)(53546011)(2906002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVRYSDJYTVR3UHprSmF0MThSYVpJajBwRk5LNXpSN3pkYXR5ekJCV1NoZmNK?=
 =?utf-8?B?Y1VFTjlOYU51dkowU0loV1UvZC9sWEpleWlnaW1XVlpneGEvOElDWUx3NjNl?=
 =?utf-8?B?UHdYL1h5aW1wR2ovdmhqUW5hTzhnVW5XL0NMYTFwM1VxV1YyV2dBdDhnWko5?=
 =?utf-8?B?Z0NXVDBKWUFKeFNSSzE1T1Z5TFNLU25NeEpjbzVLMTRzbEZKTzE5ZisybzF6?=
 =?utf-8?B?M1pPU0RCdDJWSlJwTGVzMnRYa3Ntd3MzWVN2cWYwcWcrUlNpVlFTMXhaVFRE?=
 =?utf-8?B?S2pESXU4NExpR2Jsc1V6amVONklmcnlkaUsyeTJ3UEJnYnFiMGdpYk5vRzRi?=
 =?utf-8?B?YTVXcm9xU0FORk5sSmhVM1VHOHY5UVdnSHRiZXczOWthbEJmQTRTM3JTNk5x?=
 =?utf-8?B?T25rYkRaZkovWDhYMmVvT0dJa2tBd0tJWVFGL1FNYmsrM0RGcWNQUDhnS1hw?=
 =?utf-8?B?eUNhd3NVR3BITHlKRFVPa3N6UTBIV2wyYjUxRkRQOFVwaGdPZkM3eldSK1lE?=
 =?utf-8?B?cU44Sy9oRW9ickZRM08zSFFSbzQzeUw2REZPZUhCRUpxd0thazI3cko3NjQ0?=
 =?utf-8?B?Y25tR3FuRFFVUFJJSmc4Z0MvMU5ucXlNUnVCOVB0VGp4ZmhBbFM1c21IWmZN?=
 =?utf-8?B?VzNQMUI2QytFN1pSc0lZeHR1WDJmTDhzRTR1eXErdzNJc0U2OUhSc3haUkdp?=
 =?utf-8?B?elNia250bnZrRVhwMFEwUHpxQmZiWHJSemZUL2ZmbWlmczM0dzk2VEl5T3ZW?=
 =?utf-8?B?aVVWZThTVnByTmRwRUZtQXRaQllyWVY1amR5cFRSa1VlZVloRVVIZExMUTVl?=
 =?utf-8?B?ZnR3OGo2OWtzd1Nadmk2NG9hYmhUZy9PTGVPcXZPQUVjTzdOOVFqREFGUTJy?=
 =?utf-8?B?YUZ2ZzV2bTR2NUV4NCt0MC9RamNoM1BrQlpLbzVXS1F6bDQ3ZkV1MzhYYkJy?=
 =?utf-8?B?cGZNZGhzTHdCWkxmK2ttdG1RTklMOVFOdHgyZ3Q0d3dGRHZUNGJCcGt2aHJP?=
 =?utf-8?B?UlE3ZEJYaWVVL3J4dDVCR1VFakNLcW8yUGU1RmxCR2pRSTc3Q2F1VVdlY0gx?=
 =?utf-8?B?OGI3SGFpN3J1bDZMcGN2MytLWHhVd01VdnJyYlBFTm51NW5DSVgzNGFpanI5?=
 =?utf-8?B?SngwSFBNZlFCTEJocGtKci9LK2IrNVZBL1VmaWMrYmRqWlRST3d4RlB4cC93?=
 =?utf-8?B?M3c2Y0h0SURzWTlsVmMvd040YlJ1L21uOWM4bXVHSUtQRGxERW5udXhLR2RJ?=
 =?utf-8?B?S1FnRFRGUjNXOFo4by9aZ252NCtUdDdad2x5RnpqN1ZxUG9GdEx4THNGVERj?=
 =?utf-8?B?dWVPamd2bzZ6enpSSEhCZ1lVL2hRS0FMZ1BQbzQ1bHpXdEpzQVFrNGVOb2lw?=
 =?utf-8?B?dC9RT25DR21RMDZmQlRHOFFxeFptWTk0MXlhSUo0ZGExM0RUNnVxZWdxQW9p?=
 =?utf-8?B?cVZaYUFsY2xEbVBCaWxqNjVWNUEvZXZJdWtQeHh4M2ZvaVhOQldVQktuSlRB?=
 =?utf-8?B?NklZNGtwTWJ3RHU4OG5hTDZ6Z25yT29GYWlGelpQM2hlajdBOTk1QWtxNjJ4?=
 =?utf-8?B?bWJCMzEwMUZGL3QrVE1Pa0FRUys0MG1yeUhpdGU3ak5DOSsycUprSzdHWk9s?=
 =?utf-8?B?RHQ3RG0zcXM3eEI0Yzc3MXBybXY4SmpMQ21mY3M3L1ZjMUg3Y1VZTWlDdDF6?=
 =?utf-8?B?MTR0WkdXQzllUTZHK1JIQkVoenRsUTNXaUl3anFmU1p6STVvVDZIaW54OHlp?=
 =?utf-8?Q?b/ZjtS8pZlfcH/TguXUzqocBZbreaG0pCk4COmz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 486b3e85-393e-42ed-b3fc-08d973b3c81b
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 17:03:44.6343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3l9BTpUq1uXp6z8pK2m/TbEq33amSw0NlNGC4qGqxqowDAGTuP5WTvNO7xHxSbrfB2ezgmVsoITOQ5+jG/D+Yy0fyBfZQOgOlRCqNoPHMJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4947
X-OriginatorOrg: citrix.com

On 09/09/2021 17:34, Kevin Stefanov wrote:
> The spec requires 64-byte alignment, not 16.
>
> Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Note: This does not fix the FACS alignment inside guests yet. See next
> patch.

The history here is complex.

c/s 938cee9d41d3 in 2006 deleted a comment saying

// FACS: should be 64-bit alignment
// so it is put at the start of buffer
// as the buffer is 64 bit alignment

Clearly it means byte rather than bit, but the change also introduced
logic to the effect of buf +=3D ROUNDUP(sizeof(facs), 16).

This (incorrect) alignment survived several morphs of the logic and was
moved from hvmloader into libacpi by c/s 73b72736e6ca.

The current code is clearly wrong, but happens to work correctly in
hvmloader because FACS is the first table written and it starts on a
page boundary.=C2=A0 The logic does not work correctly when libxl passes a
buffer which doesn't start on a page boundary.

As a consequence, I'm not sure what to suggest as a Fixes tag here,
except "the logic has been wrong for 15 years - patch everything".

~Andrew


