Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFF23A19E9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 17:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139449.257836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr0F9-0001nk-GX; Wed, 09 Jun 2021 15:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139449.257836; Wed, 09 Jun 2021 15:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr0F9-0001lP-DH; Wed, 09 Jun 2021 15:35:47 +0000
Received: by outflank-mailman (input) for mailman id 139449;
 Wed, 09 Jun 2021 15:35:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YCjx=LD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lr0F7-0001lJ-Sn
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 15:35:46 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b589b9fa-90c2-4678-acee-8134c2867c40;
 Wed, 09 Jun 2021 15:35:44 +0000 (UTC)
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
X-Inumbo-ID: b589b9fa-90c2-4678-acee-8134c2867c40
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623252944;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ApYU524JYYCvOXZMsb2y7UfVqOgfoq8wLQAUB5ZTHJ8=;
  b=Z+Mfk9ktKhRIRbLWnCdS+vHplu69mFnlUEIxUn5qNeartEyEXYNQA7S7
   +mHvLgOqZza1V9YXx4AiG2RdtQFDhC3NYwL9UEoy9nnTGkT7qgi82Jiol
   eyre4q04dQAtLX9hqnUk0EURDRzYwX0xUwoazRqCQT3RAD5hGK/i5EIIR
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ub/3hJS9C74d5+z06jTbN0064RRUmyK8p6f93ElGWDwWkzJ5AdVkXFWXcQ6Ch9/CvgfhFkYi6i
 VOiV1IbcfpGLcdanEXiK3Jhrp9Unq6FTpRPfmqlk5HpZvpCuK/Vy9HDrV0NBlnO+uJktx83PGX
 Sl/pmsUd+KdQhxg/HH2FaRPbvdOIaLs627N7gZ4x3vUV7poE319K2/iLu0wtEsFZf45/GL0u7P
 Gw6JuFcfm7vVYw328HMTDJpCMGCzPn+Q1Y5zoT5en26oPUBEQeONl0AW0Ka0DOrUpyPZ5gG7xf
 1AY=
X-SBRS: 5.1
X-MesageID: 47323016
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:xCkUn6r4s2SNwbpnPqEQmqsaV5vvL9V00zEX/kB9WHVpm5Sj5r
 iTdPRy73/JYUUqKQodcLG7SeK9qBbnn6KdjrNhWYtKMDOJhILsFvAa0WKA+UyrJ8SdzJ876U
 4IScEXY7CdYmSSz/yKhjVQeOxQo+VvhZrY4Ns2uE0dLz2CBZsA0y5JTiKgVmFmTghPApQ0UL
 CG4NBcmjamcXMLKuymG3gsRYH41pH2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8F
 LCjxfy6syYwr6GI17npiHuBqZt6ZvcI+h4dY+xYw8uW3fRYzOTFcVcsnu5zXUISa+UmRIXeZ
 L30m0d1oxImg7slyeO0FbQ8jil6S0p7XD6z1+enD/MnezVLQhKTPZptMZhaR3e5FMnvNZglI
 Rx/0zcmaZ2IHr77WLADhzzJkhXfwOP0AYfuP9WgHpFXYQEbrhN6YQZ4UNOCZ8FWDn38YY9DY
 BVfYjhDdttACSnhkrizx9SKR2XLwYO9xy9MwA/UwyuokxrdVVCvjglLeAk7wY9HaMGOux5Dr
 7/Q9pVfZl1P78rhIxGdZg8ffc=
X-IronPort-AV: E=Sophos;i="5.83,261,1616472000"; 
   d="scan'208";a="47323016"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7mtJtcU2Lhj8ptOAH6Kr0cgLJCPRF568CV8I+EPeO3mr7niDPvuJ5f6Ju4ALJYcRUuTMoOp0sUV8J6qVWAcB4npjK2LQOUK0TzXiElU0h55CgX4+i+PVDFRuHisptpNmwgQ7/asYKMWN9SHeYjZnwUzvb9hrTFOzpwam0zT3rGt7npCkDetj/a3dAB9fIs2ffesqInDs2WjkQhl9gDtzqrltcHb7T5LJKZSJJe7k6DLyudkPEHdfblNvA7YSAWfcRSCxO5GAq1mhFtbeYJaT/C8z2wMD785PwAnMJwAyxV1kPE2B2V0lMvK5wCqGJxzdVfFmxxiLKFx3ZKrO9It6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApYU524JYYCvOXZMsb2y7UfVqOgfoq8wLQAUB5ZTHJ8=;
 b=ZmQJctTCB1qZjo5C+kD0JLIuLtdzyWbsU/cpaNVHaUHGbNhGjHHbZxGOiN6J/+gy+VKrn19jWv5APuFSVuRq3OoHSH79REGvhnTMQkX20vcGyYDNsrUJezO8pzjJ0ujQ18seuzgyHVC+WoUYcn1rNFH9WihPQmLZOOH9cQRB+/gHtz8kyeo+9jrSjaoVyV51fWKeHSgo9DuwMMTBV5ar0tlz0rySsmi90qg0ZU52yybRZVivpq/Buf5NSsQPSTp7JIHXHNVyJ7LItihOl/82Wc7eMDuqugokmNlLEc1JOuo6mHRjDWpYJdgGzLreytpsESMWCa4QmIX5YHwJ0CC+6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApYU524JYYCvOXZMsb2y7UfVqOgfoq8wLQAUB5ZTHJ8=;
 b=MZFggs2PrN/NOV9U2lHdMVNoommNz5KhVB3wP/iOzalINHk3xDr3O5W+GkzL6dHT8t03h238EuPB8vJgUoq29W9HtKFvOWQ2NLWtedAChIEhaJ24tYnbOCVgPSUqCKsc2yPCPR4OPYtl6ZI6GbF/LDK+wTadSb1GVAdaUZOEAl0=
Subject: Re: [PATCH v2 5/6] tools/libs: move xc_core* from libxenctrl to
 libxenguest
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210604060214.14924-1-jgross@suse.com>
 <20210604060214.14924-6-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <33925e6a-b416-75e8-421c-f46b7eed5d00@citrix.com>
Date: Wed, 9 Jun 2021 16:35:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210604060214.14924-6-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f34d4eff-1261-4818-8055-08d92b5c3c3c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4614:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4614425C4F3E1FCE25163147BA369@BYAPR03MB4614.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kj71fsZx8LkA5qDL48gS75vsAj8E+KT6wjR/MY0QysimDZ4nrirE/nqhatwBjpuZfbPZRoLrbwQh5JySkSNgqK2pjD40HjRmhv4TCXklv0cSU4lzz/yMJzmGvWsReLhPm2W5qdY3PcijiuV+W8jx6Bqf1r2Z5UwgGw2Fp6kQCqnLpsndis6QBPgZUk4EABVbYmZAXktFAQZAmvMeJygZBOtokW/xkutBMvfOL6QPayVeShKONO6cSqVVb3dw65JEX6Rpbb842CdcutRuITZXI1E/23GwZUbmH89BCZ113rMhFsD4tWSjShvVyM7B80GrYn/rOghUSt2Ymd2NI3jSbGMGi8M8L99zMmzZhjI0PKeyhPdZX3ZWImgbRd/TFFR9mMnIIjqwdKQJ315606xe9d5oTGFoN6QgGzkdCU1lOKQ5uq7I9f4V9xnePsxCufDS5VLwD5FM6vA66LhRRt1kcpwuYv/8wLqHMgDYaR4B5UbBKyus+A8ZGVLcOHKWX2L6pKwZ8zYxTRyhp8w/yAb/4IcPrIbhL9dIuWWMi95Bw6LRA3vVpFoOgBX6pvr2h1l+6nIZ4wEi696NRs6TEw6QDTilYfndgsZK8L09ePMlZjtCg4/DvjWv6VQNwDir+Lw5fHJ7cuR8u+SRpZDDbauQ6lruB58sc+ky3mxFeLMLj//DyAVFofmXuzZ0ubvNr6Tu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(5660300002)(6486002)(31686004)(66946007)(478600001)(38100700002)(8936002)(8676002)(6666004)(4326008)(31696002)(316002)(16576012)(86362001)(26005)(54906003)(16526019)(186003)(66476007)(66556008)(956004)(2616005)(53546011)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0xEcGxzWW9nbDc0QjdqeHdXYmtyZEdmSzdoVHFmTjdCWlJXRTBJR1p3SEs3?=
 =?utf-8?B?VWZiMlgrWnVHM1dXd2RhTHJIblpnTjJQUFg1QnAvaG0yWkxJV2JqSmREWndh?=
 =?utf-8?B?VTRSU0dWaUs0akhpSGtodERHbnJEelZTeEJJQVQwa3JUV24vS2tVYnNhcW41?=
 =?utf-8?B?ajR5a0RMM1E4OFE0cUFrVHd5ZTJpditUVHpNQkpsakhnemdYczl5allFakRj?=
 =?utf-8?B?TEFSRnI3VE9OYk9xK0RIOHQ0WS9QVWJVQURHL2hFOG41NVJqL1JHTytDUS9M?=
 =?utf-8?B?c0ZVK055eStRVllXU1NOV2dtdFRaWUZqRE9VTFM3ZVdxQSsrdUMxckZPQi9D?=
 =?utf-8?B?ZDJ2bmViQUs4anNRUTloS291YTMyYUhiVG5VY20wV1IrZGMrMVlPK3RFMzBx?=
 =?utf-8?B?RDgzUFpaMnFIWmNLWnVuTlJTcGlNN2FUNzNiZUU0WDRIdXpUVkg4Z1U4a2Jl?=
 =?utf-8?B?eWlDb292RVZJUllqZkk5NkNQYUN2b3YvR0NrWmNvelVGY202MTg0VVFreTF2?=
 =?utf-8?B?NjJybHVRWHZyd1RwRVlEcHM4QURWNUxrZE1ZQ2VFTUxIYlZtcUVPUUtadGdX?=
 =?utf-8?B?WDNJS0ROUGhPVTNjTE5RMHlzNkM5QlYzdGdIdThFaDFOV3QwTWJVNjFhbnZY?=
 =?utf-8?B?VXUxY0IrWFdqQkRiWTlmZVNPcVFyMFU2VEhIN3hCd201RDBrcjJjT2E2VEVj?=
 =?utf-8?B?cGRRa1JoMVVDSWQ2VVVPQWprTUlISkR5QTN4R1VrTjdYQUpEd3BRVzNrZVZW?=
 =?utf-8?B?czhYZWcxUmZlTk1zTlVBeWQ2a2JaZFhTY09TWjRlSmU5NUlVb1llb0loK1lB?=
 =?utf-8?B?eWxUeENpc3JsRm1SR0hMblJDT0R2V01JYkFKeUFGQWFBY0lsdzlWYnRMSUJT?=
 =?utf-8?B?cUhVNUtka1RKYUEzNlRBd3k5eCt5dVN6MndVRDFHV0dVWjhzUlV4Tlo2VjA1?=
 =?utf-8?B?Zi9ZODNuVVR1VGtIUjRKWVpya1lLcHl1dDNKb2NpQ3BYRHh5YWI5MVNUK1NQ?=
 =?utf-8?B?VkYvZERoaFlTZGIwZUJUNGE0NFhtUjRIRzhQRTBiaWdwaTVUS29KTy9NMmha?=
 =?utf-8?B?N0NscHZsY3F1Wm5HUTlxRndVVXJhUldaSFF3QVdiN0hmUGFTamFINEwrZi9o?=
 =?utf-8?B?SFc0ejArNm44OWJ1d2RENzFRMTFQdktFTVVYbmprekttNHNWNDBpdGxZdVBk?=
 =?utf-8?B?cHJDc2xENlNmMSttcE9QTmc5S2N5SGtpVHN6aTNmMDBKdnJSWno4VGIrWGpj?=
 =?utf-8?B?bUcvNGlFOEhRc1pLOUhibDF3S1UzajRKSUYvbDNNaFFHd1VTdVcwakR6aEZD?=
 =?utf-8?B?TTYxYkFDOTRVc1RMQytZYlpDWkRhdlZsd1BZVFkwRUhtTytkdGFyTnh5cXRN?=
 =?utf-8?B?WStLeUN2MHRTK1VQQ2dLMkdkcXo4V2pWcE44MWZaTUh6Y29PMlF2NjRERFFx?=
 =?utf-8?B?eTBYMWRCM1VIUHNQVnBMQzZ3cUl2L1JEb1V3MEhreG5zWUNVdW9ncHMzOFlZ?=
 =?utf-8?B?eHNUcE8xSDI3dkhBdjlUeWpNTTRJMTVwUy9tdlNzRVFNR0tzcjN3cDd6RC9u?=
 =?utf-8?B?TVZxMWk0RVNVQXNSMlRIN3FOVHNyV3VKTWIrTGVJZVdEZm9QdHY2OFNHdFh5?=
 =?utf-8?B?b0dGc0NPL1ArdjBUaWExTklNVzJEQzJMV0V5dW5jTGttaHBJMkNrYzd1Wk9j?=
 =?utf-8?B?cDViVGoyWFNSR3pjNTBtRUZ2cGNIWVVKbVhSL0c4R2F0SDI5bUwyeUpiUHMv?=
 =?utf-8?Q?0mZGdYDra8RU6yGVlL1NcaGGILnAcTAbTXvGOHT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f34d4eff-1261-4818-8055-08d92b5c3c3c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 15:35:40.0267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqCXSEdYFkG6begcHZ3lx4TPiAAfONcGpQjELelizK9mjtV1Whbntuzf80rOsgCfjuVklq+0AkqaDL76YZZP8DYCnPv7A3XKHngglSvgXWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4614
X-OriginatorOrg: citrix.com

On 04/06/2021 07:02, Juergen Gross wrote:
> The functionality in xc_core* should be part of libxenguest instead
> of libxenctrl. Users are already either in libxenguest, or in xl.
> There is one single exception: xc_core_arch_auto_translated_physmap()
> is being used by xc_domain_memory_mapping(), which is used by qemu.
> So leave the xc_core_arch_auto_translated_physmap() functionality in
> libxenctrl.
>
> This will make it easier to merge common functionality of xc_core*
> and xg_sr_save*.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Wei Liu <wl@xen.org>

This change is incomplete.

$ git grep xc_core\\.h
.gitignore:131:tools/libs/guest/xc_core.h
docs/misc/dump-core-format.txt:144:The note descriptors are defined in
tools/libxc/xc_core.h
tools/libs/guest/xg_core.c:40: *  |    and descriptors are defined in
xc_core.h.           |
xen/include/public/elfnote.h:244: * See tools/libxc/xc_core.h for more
information.
xen/include/public/elfnote.h:252: * See tools/libxc/xc_core.h for more
information.
xen/include/public/elfnote.h:261: * See tools/libxc/xc_core.h for more
information.
xen/include/public/elfnote.h:269: * See tools/libxc/xc_core.h for more
information.

Lots of stale references now.

~Andrew

