Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239B420367B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 14:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnLGL-000057-Ss; Mon, 22 Jun 2020 12:09:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnLGK-00004x-DX
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 12:09:20 +0000
X-Inumbo-ID: 32ff2a36-b481-11ea-be80-12813bfff9fa
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.60]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32ff2a36-b481-11ea-be80-12813bfff9fa;
 Mon, 22 Jun 2020 12:09:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhQhe6VOQ8v3XFZqzMKWrw8dKFoDlTqeu35cR+cEU0NkXpXAE1LMzMPpkEVNxeaJ0tEJAvf5bHaDAUlZMWWpPoKMjzq50nP6hV5xVRklFDfTtIomCST8PyimeaIMUK1MpibR8nAfdcDwNll0Ix7etPZP4e3utKcG6IcLR4ey51Olo2GtEQ0AW36OebKbzDHc5DiS83RHguU/Jd8F5ioDOqAQpCw81sFXYF4+dqzYtEM+i228p05+JIfn2CmZsgOEfZRoXFZ1WGh7T14F/UJf2y5OZdEPwK6LJV6CTjPsa8acxl1mLi9KjRqjkgNVXoziD22QYQWOFBBioPInxy2t0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2QBB9clr1SHHh3MBypsBjTwJY1i/ptJALFqpBUTIKI=;
 b=PzWYmjEvZIf5DMeSDMkfExzbGjNXvYxUtwtSluqHqUnfl+8aAnJSWMQ/zb9dGsxnAmTqs1QqPo/YqxNluTQzmwtwT/v9JkGEc36iDPp3KkTErTkoWxPwTPDwe5LgqIh2RkVclAxf8uRpp93BSOpJ1Qr6wJoEBm8mb5QhwbtA75+6kEi/uWTbchwgQfrJtnU5VdVm1IQ3u9kb8FjJSkfBVelxRx9sJkqvu2AkFEsh7TIPb8G2fHlPDHNmkNjF42TnETid5TcE8CeXrqcpN4k5MfUUgwRyr0fwd0Tz4P5JSErXLeMpgaUn/oLJtEBmueChf9eGJnOttmfl/81gUzEyvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2QBB9clr1SHHh3MBypsBjTwJY1i/ptJALFqpBUTIKI=;
 b=N9CV9sMJtoE36cjNjLP0lJcne4bLDpxBw55yeHnP1Ao4mw0NijpGPtQ47DrleILANhZ59cvDnQLH/egb0B4jFUop1gTQE2nJpNCfh1KvgwDmfm3K6l9hk6bopv9lCP4piFMUPtfI4yD6y50AyVBapLFM+BNxHBAL7JRyOSgmd2h6EzUtqh8UyRMJHeeFINrOSQWj02NLbF1y+BJ3RGj5vM8e60UmCTkn9IEzRDPRm3f9JmJMvIEJBLxu98MhwbPmkZRd6/a8F+Ff//SMOfD7nxJfk607z0r8JLNm9fJWz0Eu3a9BZ8W8pVN3oYMrVr1BdfhwIKC9Y6VBy11Yt5e7pA==
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 12:09:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 12:09:17 +0000
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPUID: fill all fields in x86_cpuid_policy_fill_native()
Message-ID: <41177396-9944-0bbd-66d2-8b4f2bd063f0@suse.com>
Date: Mon, 22 Jun 2020 14:09:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0103.eurprd03.prod.outlook.com
 (2603:10a6:208:69::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM0PR03CA0103.eurprd03.prod.outlook.com (2603:10a6:208:69::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.21 via Frontend Transport; Mon, 22 Jun 2020 12:09:16 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6299d30b-cb81-48f3-fe5e-08d816a51639
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS: <VI1PR04MB329380464FF4564AE769CF21B3970@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jmnREIui+5CvL4mXRW8yTydA52W/lpy/K3/7fTZrl6Yt5CdcwyRz4oMTWb0fns/hDFYskUKqOlhV6j9KrIGlZIvmQIP0FW734D22i65sEndcQmhoANHlrCGLjyKkG77b/b7+LBXfh27R3JBRatTVkWd548tzTW/k4RAfntMSKOIPKRqZDavvNKGuMaho6Vldh5YIO8aSzvV0Q3SisFqkthcCVPcFJelsGdZWIXJHpL6c9pjbsUpTdiOoBzzBntC9ZUgD+kAjDD2LcyKXQLcET7QG5O1fiRFcgB4+XlQmvq29FMaoJ2TLgecbcY50O96ItKOa7Ecq1NYeo8vi07JJDO+E1fXvtyBQlzABdyfMVubKznHuOftSCmWX4uw+ShyA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(136003)(39860400002)(366004)(376002)(346002)(6666004)(956004)(2616005)(6916009)(31696002)(16526019)(186003)(83380400001)(86362001)(4744005)(5660300002)(26005)(66946007)(31686004)(66476007)(66556008)(478600001)(2906002)(16576012)(4326008)(54906003)(52116002)(8936002)(316002)(6486002)(8676002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: q3X7VrizBm7u+QN6xJuNtzFEiFCr6cL0VdSHjaDGh4D+3z7joZfYFUqQLcLDwCijr5b343OmYj2A362xR3tV+eAC8jQlVR3Tizk66lQ7OlX8ZhIPG6MJMtx/bsRZ2w2V3kMZNmaFavkQUJlcsGTS3GsaRH7SzHZP9NAz6s2ncn7h+UTZkgoo6R3lIGPSuHrDNzyAdl+DeA0kKxSJAG9CRwJHW9iZmd6ILX574iy2TJq45PYxF9disRpORoHcK5Vl/anaSMVyObS8pCRRqxeYSNqt1souDVXs3X+r91ZgBOJFJ0KzGT0PlActrSZXCoKORC7yWEgCKnQcJtYwcZv0HlqAlzFx3CRI+ckCkrSwq8BWT9/qpqRwhRVEMbOS5BDOahsmsGQbKer6ZdiBsMa4y8d7wc2OGy9ez/sMC7XC16bxFdx+EQLxBKciHNkf7arICnxNucEgLh7FY0AnTcAroZoOVbGrTJl6zpZOidNndIo=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6299d30b-cb81-48f3-fe5e-08d816a51639
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 12:09:17.1959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dl5bloqmc64EKMXUkSEfWxAUuPzNbEajVLFJ0UP109DVbhrPJAYtP1SD3PGisOuBukRNaIThxDqPsUnCz4HFpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Coverity validly complains that the new call from
tools/tests/cpu-policy/test-cpu-policy.c:test_cpuid_current() leaves
two fields uninitialized, yet they get then consumed by
x86_cpuid_copy_to_buffer(). (All other present callers of the function
pass a pointer to a static - and hence initialized - buffer.)

Coverity-ID: 1464809
Fixes: c22ced93e167 ("tests/cpu-policy: Confirm that CPUID serialisation is sorted")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -176,6 +176,10 @@ void x86_cpuid_policy_fill_native(struct
                           ARRAY_SIZE(p->extd.raw) - 1); ++i )
         cpuid_leaf(0x80000000 + i, &p->extd.raw[i]);
 
+    /* Don't report leaves from possible lower level hypervisor. */
+    p->hv_limit = 0;
+    p->hv2_limit = 0;
+
     x86_cpuid_policy_recalc_synth(p);
 }
 

