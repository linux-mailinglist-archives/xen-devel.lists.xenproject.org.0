Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B55FB7E7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 18:05:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420401.665243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiHkJ-0001St-Qr; Tue, 11 Oct 2022 16:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420401.665243; Tue, 11 Oct 2022 16:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiHkJ-0001Pn-Km; Tue, 11 Oct 2022 16:04:43 +0000
Received: by outflank-mailman (input) for mailman id 420401;
 Tue, 11 Oct 2022 16:04:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHIK=2M=citrix.com=prvs=2762267ab=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiHkI-0000OR-JZ
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 16:04:42 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 680249ba-497e-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 18:04:39 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Oct 2022 12:04:26 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6378.namprd03.prod.outlook.com (2603:10b6:303:11d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 11 Oct
 2022 16:04:23 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 16:04:23 +0000
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
X-Inumbo-ID: 680249ba-497e-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665504279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=meTjvBewTlHBs7LRXzpVInwurZ2rXlIRYOO2HPDbQdU=;
  b=cpSLawyXFBFYvGSd+2Owa0ryMJwIwHwAImGyP0Men5dENAIcmuyscsbT
   7fvqalKheWFldAV8VHhToguQcx/UcUKhQGi/5Q0luCiY9O76G9B4tMs60
   wLiG/1FqMbHi+WgaRVrBM7Qh6HqZ7YS5Rukk6/OO/xDXq20h/yOlMaU5J
   s=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 82116872
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nuWw4a40B1cA5X/4Q3DuywxRtA/GchMFZxGqfqrLsTDasY5as4F+v
 mIcUWGCbK3YMWD2Kdkkb4y+9RgFu8TUxtVqSgdl+C9kHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5gVnPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c57MT9h7
 cMWIgsyZwKhu86nmJiHb+5z05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGNnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iL237aRzXyhMG4UPJ6Br/tKhFua/WoeDRQKaF27kPChpHfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAkQzhbeZoZvck5bTUw0
 xmCmNaBLT5lvaCRSHmd3qyJtj70Mi8QRUcdYQcUQA1D5MPsyLzflTrKR9dnVaSz3tv8HGiqx
 yjQ9XZvwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBe8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:aNVeeqDF1ZIEZg3lHeg3sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwO080lKQFmrX5WI3PYOCIghrNEGgP1+vfKnjbalTDH41mpN
 hdmtZFebrN5DFB5K6VgTVQUexQuOVvmJrY+ds2pE0dKD2CBZsQjDuQXW2gYzBLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 529lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ5o+a87bWzHAb0cYa
 hT5Jm23ocXTbraVQGSgoBX+q3iYpxpdS32AXTruaSuokprdT5CvgklLfck7wc9HaIGOud5Dt
 v/Q9VVfcl1P6krhIJGdZM8qJiMexvwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.95,176,1661832000"; 
   d="scan'208";a="82116872"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIlRJ08G0I0wiTd+qD6Th+7eJGiBY6yDNDzALXLPbDWiSTAu37Lj8zUiNyYmv9qKzYov/yqSfgqN024/yKQ/GKTSeQEx76tss0/K72ceEz2uX/peXuRIBiuBz0GMbpu/8cxr/rxlsFq2BFOGE2/x5ITrFtZZMKBP+cG7ijEiJAQtl0ixZjYu6EMEdR2GKSPDqV1EHqsuJXsrJyGxT7RrK+WA59yXPVpdafzrX2toczlxTVU6JkT/xBVbXpv4Qf9GuukWV1YgZGgAThRB6Mwm71VaZtofS4HqEjH2lRsmssa8s051VSG1h1TwfGuhzYGgj8OTGQXSMBE/v/bjijU7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAuwn7S5ftuN5uITAlZ8x3DI+7/sASR3Tb63nr2Rm4w=;
 b=c3kuLMxMJEL19KqMsiVIhY38Tqr10qZUYhvjIwO1oGQk6cx+Ldo1aszyh/FjX7BxSKN9ILxGQzeHyj8yRmQDi2NTc0MAQ5IA/jW6B5WEFRbArYsx5j0nCWTZz6WefOi6UhjqXHc1BwvKZU5CBXqHUQhQR3y6bZzL0yoZ7sEDovocbvU92f4Vy3aOKtt3UJUqTgRV4HyQ48U5uEHCg9Vuwz7BWqp7vQc5iQk85w2JPSCkDsAnIymC7CUAJG+h7krZvO9SZaibCc+TZXvfFJu5wpE5I9bBY/Q5Ckzx0Cnm2/CVNjaZjpal7TeLvDWAN5zU258IIvyNGoNcS4E/9yRAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAuwn7S5ftuN5uITAlZ8x3DI+7/sASR3Tb63nr2Rm4w=;
 b=pYAu3gsdv206AH9vo3Lv5rwnFn75CGgB7XGzkd686JpfKfgbeZjwdEpYil/0t1NCX030kE32mz8P/lj+H8yN50Yokj/0qaMdBLMDVS7pO9F6BBbAX4DOxrQGT8P5WcUlvgQ8Rd8OiGWGg+xPObfS3/ZLfkz3rRPPpBvqEgrXZQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 4/4] amd/virt_ssbd: add to max HVM policy when SSB_NO is available
Date: Tue, 11 Oct 2022 18:02:45 +0200
Message-Id: <20221011160245.56735-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011160245.56735-1-roger.pau@citrix.com>
References: <20221011160245.56735-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 65229b3a-f6c5-4209-189b-08daaba24380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+WZT989eOuc2Ww9o8kyCAsCm3zOEE+1tilKOU3yp2zQv1w/UPlvjX6NxnuXVecG30qIyOp3SG9K0Y5EL1B2fz6/6uCuNYWw8T3AkNEjA4C+zGGiIRQjq8V9X6XOPL+QLh0sfI/nMGaYLOdW5LqeAryQEaIZOqwBO7vAt0cWiToPo7Lx8FqiGlqKktRf2OFN3QBgfGxmJgFcrpTvz/jz2Muugqr+TlNU9IJJorfOpKC0+2ePFHhElLBhxt8oAYV/D3OG6ns48NahkR7ezNpibwbMpsD/deGHSwweGVVdb0X9gmZZhGAnwAZAJ7WR+jhxPoPEx1MTOqZ+tXgEVOx4Wg5E9gQ6x4oZiMO/53puU9d0Y7xiOWJSVhk2MpEw+NhjexXserPbvXeUmcYzrEp/yVOz4u12HCvlsTcvmFJnlFp4xYaw3LA0b/g98bcm1SdA7tdh+BHaKcI6quOwP7dhpmOoJ55tetnXIN5OZemHvdUyeQvVqPgBNZJv0bwpTY/7beyCt0NnvtSVXQZ+LYFvNcGN/zg207ItP2efIW1IULg9Bi0bnfR/WOkn/x7gm62uBkVBXQLoMg0w9kemKLnPAhjoT6NwFjS5PlzBckC4av+Aa6L/AqM9/HwWtS0PSh78JBLblQPuKq0mzqFMgJ8Tk6dy5ENxK5kdDobcFHLtsXTyvBg+Lr8GVm4AMCLIFGwfRANsGkFE2ADm640bGg39iKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199015)(8676002)(6506007)(41300700001)(6486002)(36756003)(38100700002)(2616005)(1076003)(8936002)(66476007)(186003)(86362001)(26005)(54906003)(478600001)(83380400001)(6916009)(2906002)(6666004)(4326008)(5660300002)(66946007)(82960400001)(6512007)(316002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnQ3UXhFcGFSd09IY0FlQkp0eHhJSkFhbkJ3d2t5dmVDQlBXOVltcjVMOFlN?=
 =?utf-8?B?VnhuV3crMjdNbWYzNXczS210R0MrVjFxbVk2c0d3YVBSR0xpYWJsaVpFTExB?=
 =?utf-8?B?MmdxZzFNZ1d1QUV3Yk9QbDZXbVJhRXlqVkxkM1N2TzRkcExnV21mdTFFWnZR?=
 =?utf-8?B?MTMvb2lZb3EvTFZ6bjZRZ296YUxlNDlHSGlKRmR1eW1wOXpEdFpCZlZ2a1N2?=
 =?utf-8?B?WG02bm5XdnlpYUpiK2xhaTkxTm1QNVBQR2ZaVGUxVEQyR3VKWlNVRmloSkI0?=
 =?utf-8?B?akZnOHZULzRHTExJaHN2Ny9uRlh5enBoc2x2ZGxhbzhZbVlVVFNhVVVLc1Nm?=
 =?utf-8?B?d2NPUCtYUFJkRXp5NFhMQXNuaThOb0Qwcy9nSnk5M3dxdUM1cEV5RTVKcG8x?=
 =?utf-8?B?M2NmY0hZU2dIUTVhVXY4WmpmajZIcDhSV2J6QzIyczYrTldjY1N3TTRSWUg0?=
 =?utf-8?B?ZGsyRlhCYlZyc0JBbmJRQ093OW9iZlY3dkRVNjZjQjlWRHR6ZXFzUzhvWmsz?=
 =?utf-8?B?ZHl1c0wyOUhRMzZjSmJ6NndnL21wVDlPa3hlYlpRWlk2VWE4SHg4eGpNcmJu?=
 =?utf-8?B?Mkp4RXpjWkxPakNpdFg4VUJrUmxoN1Z2clZ0YjcwWkI1M084Q0ZQWUZLdDFW?=
 =?utf-8?B?SXZRUmlZTmZyYWpxSi9QT3ZrRVpRZVplTTRjZXNJWWd4TE9WQ0hEZVp6Rm9h?=
 =?utf-8?B?cklVUTlqTTVsbW5rQjJJRHdGTExoSFludXltaWx3K3lBNHJrdFZiQm9sVncw?=
 =?utf-8?B?b0xsRE5mQnZzU01hcWthN3ZNbm91RVdDYTdQNDQvK2J5MDk2bURmL1gzbTNU?=
 =?utf-8?B?WFo1MEZxOFhoeUV2b280aS8vcXEwYWlWbGs5bDZMbHhIRzdaa1p6L05nOUZI?=
 =?utf-8?B?V0NzdGxaRmpOdEtEUmVOTnI0R01sMXBNUy9xYmRIUlVOV3VuNzB2UjVzUXhs?=
 =?utf-8?B?UmhpSWtJNFM1QWN3SVRQQVo2RkMzeWtNa0FndzlXdTJIMm5TMVVwY0NvY1B6?=
 =?utf-8?B?VGtpeEplbHZoT1FiY3VxaCszZSsySEN3QmUrNzhvUWlCRmxDS1VybWRGbUpi?=
 =?utf-8?B?R2xQd2I2YXJaT0c1RWN6VnBUNDc3TDMzQzhrbFlXWnovejBSZGJTbVRYM213?=
 =?utf-8?B?dUNTZWdtNWxQdk9WNTRUeWtVQi9xUUw5b3RNNEZac1IwU0NiR1J5VlpUUFFK?=
 =?utf-8?B?TGUvZFdVcDVWakdyTmZMWEN5d0l0cDJuTmc0bG1IVUNSM1VPSHdlYng4dHpC?=
 =?utf-8?B?Rit1dVZFNDRLeUhaUGc0WjhMY3JzWmNlWnF6ZjQvOWhGaVBzVGNYZTVVb3V0?=
 =?utf-8?B?N01OR1A3SlJTamNkL1YydGdXWkhRZTZCQXZqR1JIVk4zbUhFNW5jKzhSRVpu?=
 =?utf-8?B?b3k0MnduVlVKWUZlYUM4ZHYzc3NnUC9qc1dWWkNocTVBT1dWWXNsOTJaaUMr?=
 =?utf-8?B?QVlEamI5STMzNHBhRWFZWVdDNFIwcURzNklYS2dobXVOV1NsaDJVVDQ0d2RL?=
 =?utf-8?B?U3l1U3BNZ0c5bGwzYXFpQzZPU3NiM05mRTQ5SE0yYUFqWHZYd0d1Y2ZmcThN?=
 =?utf-8?B?V1BERSsxd1dISHUyYVRVeFpsRmw1UkZHMFBFaldzTElqOWp1dXQ0WlExc3dl?=
 =?utf-8?B?QjlNYkVjZk5RakVFOGdYS1JybHczL2wxODdrV2xKOHZDZnBGa0ZialBDNkt0?=
 =?utf-8?B?eDRycUExdUxGemRndkhrUkRLZHF3L1ZKZmltTTcyblJzUWE3Mzh1NkdoTkRv?=
 =?utf-8?B?Sy90VHRnZWxUWU9KdDg5blVsTUVUSlNXSmE0cnZISU1GTHoyeGZta1VvUDFt?=
 =?utf-8?B?UGw2NUJDU1lpOUY3N0U2V3V2ZUtYRWh2WDRIL0hsN01RR0ZHSHFYRFRsRzVh?=
 =?utf-8?B?V3JGRTVHU0oxSERPTjFiNjVyQW9UOHF3OTlEbENPSytPMlU3YTlCaUYrWjF4?=
 =?utf-8?B?bkozdDJJSlBOTENMZk9vWDZmdTMzRGRic2h0SEJDWjRlWTlmYVcvTmxIU25G?=
 =?utf-8?B?bit3S09LckFIZXgxOTZWaEljZ3VnT2NqMkhOTEZ3VG5qVkpBbUpyVmtiaVdB?=
 =?utf-8?B?ZWxsYjFVdjBVYUpLRnFVRWJBd2xabXlvR3B0N0tIc2xScGdpZTFTY1BOOG1U?=
 =?utf-8?Q?t0mRQtwWmyuBxiJ/eHpLXPza0?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65229b3a-f6c5-4209-189b-08daaba24380
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 16:04:23.5615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcIz4EBYZxpUIdCucKI0eQEwFO5xaX9S3+EesBqwDtC3Ouj0r5/glpTV1O3IsLzDUm/JpmIplSjGY6q/9Sl6fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6378

Hardware that exposes SSB_NO can implement the setting of SSBD as a
no-op because it's not affected by SSB.

Take advantage of that and allow exposing VIRT_SPEC_CTRL.SSBD to guest
running on hadrware that has SSB_NO.  Only set VIRT_SSBD on the max
policy though, as the feature is only intended to be used for
migration compatibility.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
As there's no hardware with SSB_NO so far the patch is untested.  Post
it for reference if there's hardware with the bit set.
---
 xen/arch/x86/cpu/amd.c | 4 +++-
 xen/arch/x86/cpuid.c   | 7 ++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index cfeb8d1daf..74cfeffc29 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -814,7 +814,9 @@ void amd_set_ssbd(bool enable)
 		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
 	else if ( amd_legacy_ssbd )
 		core_set_legacy_ssbd(enable);
-	else
+	else if ( cpu_has_ssb_no ) {
+		/* Nothing to do. */
+	} else
 		ASSERT_UNREACHABLE();
 }
 
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index acc2f606ce..e394dbe669 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -558,11 +558,16 @@ static void __init calculate_hvm_max_policy(void)
         __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
         __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
     }
-    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
+    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) ||
+              boot_cpu_has(X86_FEATURE_SSB_NO) )
         /*
          * If SPEC_CTRL.SSBD is available VIRT_SPEC_CTRL.SSBD can be exposed
          * and implemented using the former. Expose in the max policy only as
          * the preference is for guests to use SPEC_CTRL.SSBD if available.
+         *
+         * Allow VIRT_SSBD in the max policy if SSB_NO is exposed for migration
+         * compatibility reasons.  If SSB_NO is present setting
+         * VIRT_SPEC_CTRL.SSBD is a no-op.
          */
         __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
-- 
2.37.3


