Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B4A609EBE
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 12:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428813.679340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omuOe-0005c2-Ob; Mon, 24 Oct 2022 10:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428813.679340; Mon, 24 Oct 2022 10:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omuOe-0005ZG-LJ; Mon, 24 Oct 2022 10:09:28 +0000
Received: by outflank-mailman (input) for mailman id 428813;
 Mon, 24 Oct 2022 10:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K33j=2Z=citrix.com=prvs=28997e893=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1omuOd-0005Z7-Hi
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 10:09:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efd70cb2-5383-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 12:09:26 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 06:09:21 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO6PR03MB6259.namprd03.prod.outlook.com (2603:10b6:5:359::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 10:09:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.034; Mon, 24 Oct 2022
 10:09:18 +0000
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
X-Inumbo-ID: efd70cb2-5383-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666606166;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=grys+4P5GcmRdhTc6X0D2ylf+A8Zr53c44RRir2OzAM=;
  b=Sk0OoIpqXniqCjWayTD5V+HUAROZr2Zx5DBFcVbOIaf8iPuyoNRLvY2a
   V0ok/sRnox1D+brbnI6t6DMjtgMsWE/9AIXOjeqNemcA/eEUzohL/MucD
   dVcvPu6lcstNz04IoK/nriSiLUIGme3fD2lh1aPj8ojT/zB95KG4s7CAp
   o=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 82462921
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aTtMjqAxoTXaohVW/8Diw5YqxClBgxIJ4kV8jS/XYbTApG9z3zBWy
 jQYUWyFb/mKYTf3KIogPt+08k9Q6J/VzYUxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K6u4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kqZ7AeufxoIlpu1
 r9ECGpTZBqFvuaplefTpulE3qzPLeHNFaZG4jRK626cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWIA7gvN+MLb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+toijw2LWex3qTtIQ6N7yUptpmumaq7DItMAUmc0uphfO+oxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4GOQg5AaA4qHd+QqeCy4PSTspQMc9qMY8SDgu1
 1mIt9DkHzpitPuSU3313peZqymjfxccK2AqbDUBCwAC5rHLpYA4jhvLCNF5AqOxptTwFXf7x
 DXihDgzgfAfgNAG042//EvbmHS8q57RVAk36w7LGGW/4WtEiJWNYoWp7R3R66lGJYPAFl2Z5
 iFcxo6Z8fwECoyLmGqVWuIREbq15vGDdjrBnVpoGJpn/DOok5K+Qb1tDPhFDB8BGq45lfXBO
 Sc/ZSs5CEdvAUaX
IronPort-HdrOrdr: A9a23:v+g6GarbXQuOlbQT7ZtK6S4aV5uIL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcItKLzOWwldAS7sSobcKogeQUREWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZa6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInJy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0aVjcVaKv6/VQIO0aSSAWUR4Z
 3xStAbToNOAkbqDyOISN3Wqk/dOXgVmibfIBSj8AbeSITCNU4H4ox69Mxkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pWVFZ9l/1pwKpuKuZ3IAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkcoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWuKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEnieffFmHKc7hywlbF/NLggFkPsulqSRkoeMNIbDIGmEVE0kldemrrEWHtDbMs
 zDSq5rPw==
X-IronPort-AV: E=Sophos;i="5.95,209,1661832000"; 
   d="scan'208";a="82462921"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVNtmvCm3dzWdtiTSiz5bjjd6/FqVx5kzhjgGIwKJoINKu5eaeu+UMHaw5CwPOZxcL8aNQT1PFLX3mMTRwAmey2lR690gx5l4IG1UWvZkYC4rsHn8JiYj9IvdO52iiVvYm8LrkIDiwZzQ09Bm6Fu+BYfZpGrBOqjRgIitc9yhrmx8kyojlOfgH2A5WdNQtmOc1i2Iw+Na0aDQWZ3nDNVTg/Nj/+R+miqOwtgJgg0SaO4eUTP3xQ6Rwh4CoWpX/dWXihWrCZodLO7fydNdEQFy8iGs9SFrsrv7xmFU6qRPyhT4DnNfBk/hKOWL4ZNxKvoTs41cleLSozzKR9Xjuaiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grys+4P5GcmRdhTc6X0D2ylf+A8Zr53c44RRir2OzAM=;
 b=nPzjEUDyGUObRjBuIQMV/E1zLdFZ/O9jQxmBdqp0vCSChtU8okU/3ToATKGp+nNvjxO6qkDGvCk0N3BFvvRh6RO0oxpqZYsnoqlt1DNqq3kvL1BOL9I38uCSCzun7yUs2+5HnuypaAmgzdQSCUgHdKag+hOa9sqBE3Gp663x5EOt/RULFIzbyRoJezur50pqYrZdFqMAX4yLyDUpBT3kRuec8Y+9BM6VFTPDn4m5dpnkTKJBfU1PRtjeSQmOH/vPHqn84ZCOSYOvMlgDvQZ5e7UTeIduL3dyjYLnE11Dd2IJv4RH+7Ycc+LxMwjRI2IrmwI0KEEGNdP/QZwlZlrUpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grys+4P5GcmRdhTc6X0D2ylf+A8Zr53c44RRir2OzAM=;
 b=esOvV+xeXFwoHaALAZkE9p6LkaEidGM9ukKC5ys+zX+lUEsBYFGlNxpX06pLk+qbB060RfL2+Ol2030qDHV8tpODufJzip6yWUXIb6Tyz8JT9TdVnCxp6ujPQ8s63dQzuEPa3k9qVjxILwNg/rRV3PJBlHnNtYCdPgPzmG5ytn4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Henry Wang <Henry.Wang@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [for-4.17] automation: Do not use null scheduler for boot
 cpupools test
Thread-Topic: [for-4.17] automation: Do not use null scheduler for boot
 cpupools test
Thread-Index: AQHY5W3J3NgQRSiY5kiY+kL0DoKe0q4ZGCaAgAQA44CAAD12AA==
Date: Mon, 24 Oct 2022 10:09:18 +0000
Message-ID: <0879d7fb-5908-f169-05de-650e801e89ea@citrix.com>
References: <20221021165341.7905-1-michal.orzel@amd.com>
 <b1f7c77b-6e39-85e9-074e-0e31ed9648db@citrix.com>
 <a5c6ba1b-88c1-fc0f-9d9d-2610f0fe2de2@suse.com>
In-Reply-To: <a5c6ba1b-88c1-fc0f-9d9d-2610f0fe2de2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO6PR03MB6259:EE_
x-ms-office365-filtering-correlation-id: 38ebe710-9626-4b96-703b-08dab5a7d06f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nnfH+BH/N8AjMMOdctYB1Jwm7M4j8PyGOzA6Xy97hvLI/steZ/ItaoX58RipwxrMHrkNM1s2WZYXlnSdIPVez8phJTCk+ismQpz3oe6IzVBPGihYvFNv6yIIiaZawtmI4obFFGupUhlxE8AX3Uc+03412DzOqk90zh+Snz55kK5B8WIIFYqWy7F3y1uYnnMkPliBuztCyWw4tSSxnfG3Rax6V68LZeQ783ib8ysdosKtFTxQxbhSMFm0Oj5SAGvrHtiVcMit0XAIIUuAIi9lb8+uOGBw2MYBhTo1FiENY0UVaxrdCMzo12eSSuCkxQYzVlMMhqOye3/VFNdD1bcp4jJ6oURS1N0LHshj3ZpX/BtPEeNj2htleLE6/GiXmOOjyNKcDeKeIofl/JIQsrbAdzDo0WOUE397/P/xuSbuubPMLyAJLpQQ+dVfLeO7VjwhRQYwS+j1K4T3vnQsRWpaS20tD2X/WPSxWmwmsU2XFiPffvDefM2YZOUjrr8dANDdT/livm8OP1/Z7PhWxJ4m79mCl+qhmxDFxyZcS75N5rC5WPbIehwIWng3GF+2/LEoUuE3Y7JNq2bs/OiRkH3rDYhkH9iWHP6IlyC9nw6Dl75RFvLlfMEcUSbKCfUuc1gflqOZP9cNjUc+QJ9jDnorh5C0ZuSVtB6eX5H/XTOfoXrG5x6yeQdLHZKYPdCxhY7M44GIE2orE/5Dd2xogXUy/7IuWbVJ/AcKtvDe31qy06ajO0fwivHMqHC4ePSfxhgVqaQGPPUEFdzIZw2da/U8PyWevXtu31HExT6aPN5mW+vBvxjieLHiZg9yj189UWLyqpt/hiYTl4yswmggz8xiRg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199015)(26005)(41300700001)(8936002)(5660300002)(6916009)(76116006)(54906003)(66476007)(64756008)(66946007)(66446008)(53546011)(6506007)(36756003)(4326008)(8676002)(6512007)(316002)(66556008)(91956017)(82960400001)(38070700005)(122000001)(38100700002)(2906002)(2616005)(186003)(83380400001)(31696002)(86362001)(6486002)(478600001)(31686004)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDJyZWRvaUcvRURIR0tVU3BJbWg0QjdWWVUwMThIN2tKbDJGb2tNUnJZSVZE?=
 =?utf-8?B?SjNMUFhjTzFLSFRoRUE2NmUrbjJXOWpFZytmSHVna3BWT0kzMWkycG9JSVFp?=
 =?utf-8?B?YUJoTndLQkJuZlYzY2c0L0MzdGRZQXVjNXBrR2h1TVlLV1J1MDJSTk14ckg2?=
 =?utf-8?B?Sk5vZWNKby9KQVdobEZkVEowcWo1amJET21HZUhldExkbDBFWWtjdEE5TGVu?=
 =?utf-8?B?T0ZkRUtNdnRlNkVSRDUyOHpYTmgzdmtVL1ZDeTdhR2hHbFJyaXBNRFhVTDEz?=
 =?utf-8?B?T1o4R2lCNVp5eTFDbGlTZEtSbGdveWFwci9sM21rYmxQRXpPSUxWc28yYnVu?=
 =?utf-8?B?MG00em9USkxnZWxPbzhOTTM0MWlHaXVvZEc1NXoyd20wVXBDcVc1dFV5YStD?=
 =?utf-8?B?Z2RXV1JVMFhYcGdnQ0xabDFDTDV5cDg5WjFsMFJNSWZac2hhY28vU0RvMHUv?=
 =?utf-8?B?aGZxOVc5UUcrSk1rd3YzWlpGT0hpVHRHa05qUlVEVHE0ejZjWUlXRUVQbVlP?=
 =?utf-8?B?WEJoQXJ2N0w0STJadWpVUnd1dnFRS1RpdXBNVjZWY3MrVkhsV0JuVEkxVnRC?=
 =?utf-8?B?MnprL1Q5eDVmcmRXdzN3WGJjamdURHpKbjBXZHU5RnExU3hOblZhakdPTDht?=
 =?utf-8?B?ZHJ0dGRWWThEc3kvWVBvOFlDV0c3c1FJNFNpOHpLMzh2S0JkYmJRVDZCcmgz?=
 =?utf-8?B?RTU4WTFGN2tPV2pPcGxjR3VpTXBZQlZwa2FvWExOamtWZWxESDVKL2p5ZTFP?=
 =?utf-8?B?dVdMOHNCb2E2bWpjKyszQnp2NmNkT2E1T2Z2STU4SDNicnhQWEc3N0Q2b2Jn?=
 =?utf-8?B?S1dSN3J2YVpPWlpBYTR3b0ZvL1FGTkNyVFFKTWxDN0R1ZEQrWmFjMlN1cm9K?=
 =?utf-8?B?ZE9PMXUrNmFYeVJURHcwYUJxZGp5ZTJuQXZFdkwxd0NqR1hWaG5XRVpyZyta?=
 =?utf-8?B?OS8xK3Z3eG13TkU5YUUvVCs3cTQzRzgyM200aWxxakJ2Z3J5ZGdwcCtXZktE?=
 =?utf-8?B?OHZGbkYrZU5TMC80TU9pc0I4T0VGQmgxUzcyaWNkeXZVM0RJUkIrS2hZWVpD?=
 =?utf-8?B?emRPbjl4ekdVQmp0Q1M0UFdaUEMxSlhIUzBlUEJSaldRUTNCT0ZGTDMrQmRu?=
 =?utf-8?B?NmFHRHRVK3B0bUgvMFZnL21CazZjSjhZSStZN3grWWFlWXFmZGc3ZW85TkIz?=
 =?utf-8?B?K0htRy9sTk5IUStORTlmYmdNOTdCd0VNbHNOTXNGVUpCNndQMnNFbkRWTEtH?=
 =?utf-8?B?Y29janl5LzlOc253YlU4UjlYODdGM3NVNDNWRHoySUgxTTh1WUhXb2luZHpE?=
 =?utf-8?B?QnZoYUJDOWxtSGtYN1RqcFVMSkV6Q2sxcTQ0T2RNNkgydi9RaDBXVVdHd29R?=
 =?utf-8?B?Zm9aaWlhQlZZS25yVC9uUmtTL0l2aTdWTzBEaFBHQ3hlOTQ5a0tzSHduVUxK?=
 =?utf-8?B?UnpOcnpDSU14TjFnV2Npb2pFY0Iyd21DZlcwNlZLTjJEQkVXRmxjVEFraFI0?=
 =?utf-8?B?MnFSVHRUTk5ETGNOYUVKWG9PTG42VUFJa01QTmZIMHVWKzFlcyt4Ry9icWVW?=
 =?utf-8?B?YjNhTzN1MmYyQW1mcEVVTGVzTTN6OVZ2ekN4ZVZ0NW5aaHBMWFlUOFBPRmh6?=
 =?utf-8?B?WEdPbkRKT2dJMVE5NnUva2UxeGtRWHpjQWllRDJaYVhNK20xelhvQU1YdFg2?=
 =?utf-8?B?djdYQkRsV1Vic05SRVNmQ1FXaUM0TzBrUXdid1c1NU5vWkhpVnZKRU1SVi9p?=
 =?utf-8?B?VU51amYyc0I5V3NYWlRHMjdWUk9mZTZBa25USStIYjY0ak9aUUhoUjBaSEtJ?=
 =?utf-8?B?MWJNZ1FIUk9qTnpWWlFacVlyNmlXb2U1V2kxZEpWUmZFcU9TQmMzMUQ0MjlN?=
 =?utf-8?B?emp1UDlLVE9kcCtyVThXb1k2WmdLYnRrblBYZHdvSGVzeGxoZHRXOVdwbmxY?=
 =?utf-8?B?c1V3TVo4SzRETmE0RjNDMFN5ODZLNnBQOUFFSjZvSzNBaU5keVNXZUdsVUl1?=
 =?utf-8?B?YUlrWk41YnByMlMxZ2VBMmNESnUrVmJ0b0IrRDhGMjFsR05OWXFLOVo4bDlX?=
 =?utf-8?B?NjVPMlRxMVZXZTJHQkpzUEVLdXEvb1pnc1hCT1J0enFoUUtvRWE0d2Zwc2lT?=
 =?utf-8?Q?aPC4ler9LbtarIuGEwtOIyZjf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FD87CB89D002742912518B51E91E8AB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ebe710-9626-4b96-703b-08dab5a7d06f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2022 10:09:18.6851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uFnRMTaiAYd9KzHwnrLyHo1ggT+Tp/NKVGZyvzGbvawXbqGam+Miy5iuwPms6kJKl6725b06G5xN9HGPVcyxZ+A9ql/Fk+62LxoKtoz636k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6259

T24gMjQvMTAvMjAyMiAwNzoyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIxLjEwLjIwMjIg
MTk6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMS8xMC8yMDIyIDE3OjUzLCBNaWNo
YWwgT3J6ZWwgd3JvdGU6DQo+Pj4gTnVsbCBzY2hlZHVsZXIgaXMgbm90IGVuYWJsZWQgb24gbm9u
LWRlYnVnIFhlbiBidWlsZHMgc28gdGhlIGN1cnJlbnQNCj4+PiB0ZXN0IGNhbiBsZWFkIHRvIGEg
ZmFpbHVyZSBvbiBzdWNoIGpvYnMuIFdlIHN0aWxsIHdhbnQgdG8gdGVzdCB0aGF0IHdlDQo+Pj4g
Y2FuIGFzc2lnbiB0aGUgY3B1cG9vbCB0byBhIGRvbVUgd2l0aCBhIGRpZmZlcmVudCBzY2hlZHVs
ZXIgdGhhbiBkZWZhdWx0DQo+Pj4gb25lIChjcmVkaXQyKS4gU3dpdGNoIHRvIGNyZWRpdCBhcyBp
dCBpcyBlbmFibGVkIGJ5IGRlZmF1bHQuDQo+Pj4NCj4+PiBGaXhlczogMzZlM2Y0MTU4Nzc4ICgi
YXV0b21hdGlvbjogQWRkIGEgbmV3IGpvYiBmb3IgdGVzdGluZyBib290IHRpbWUgY3B1cG9vbHMg
b24gYXJtNjQiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVs
QGFtZC5jb20+DQo+PiAvc2lnaCAtIEknbSBzdXJlIEkgbmFja2VkIHRoYXQgc3R1cGlkaXR5IHRv
IGJlZ2luIHdpdGguwqAgYXBwYXJlbnRseSBub3QuLi4NCj4+DQo+PiBJdCBpcyB0b3RhbGx5IGJv
Z3VzIGZvciBDT05GSUdfREVCVUcgdG8gaW5mbHVlbmNlIGxvZ2ljYWwgY2h1bmtzIG9mDQo+PiBm
dW5jdGlvbmFsaXR5IGxpa2UgdGhpcy7CoCBUaGUgQ0kgc2NyaXB0IGlzIGdvb2QgaW4gaXRzIGN1
cnJlbnQgZm9ybS4NCj4gQXNzdW1pbmcgeW91IG1lYW4gZGVmYXVsdHMgb2Ygc2V0dGluZ3MsIEkn
bSBhZnJhaWQgSSBzZWUgbm90aGluZyBib2d1cw0KPiB0aGVyZSBhdCBhbGwuDQoNCkl0J3MgYSBj
b21wbGV0ZSB2aW9sYXRpb24gb2YgYW55IHJlYXNvbmFibGUgaW50ZXJwcmV0YXRpb24gb2YgREVC
VUcuDQoNCkFwYXJ0IGZyb20gY3JlYXRpbmcgdGhlIGJ1ZyBhdCB0aGUgY2VudHJlIG9mIHRoaXMg
dGhyZWFkLCBvbmUgZG9lcyBub3QNCnR1cm4gb24gREVCVUcgdG8gZ2V0IGF0IHRoaXMgZnVuY3Rp
b25hbGl0eSBpbiB0aGUgZmlyc3QgcGxhY2UsIHNvIHRoZQ0Kb3B0aW9ucyBzaG91bGQgbm90IGJl
IGludGVybGlua2VkLg0KDQo+PiBSVERTIGFuZCBBUklOQyBzaG91bGQgYmUgZGVmYXVsdCBuLg0K
Pj4NCj4+IE5VTEwgaXMgbW9yZSB0cmlja3kuwqAgUFZfU0hJTSBpcyBleHBsaWNpdGx5IHNlY3Vy
aXR5IHN1cHBvcnRlZCwgYW5kIGhhcw0KPj4gYmVlbiBmb3IgeWVhcnMsIHNvIHRoZSAiVU5TVVBQ
T1JURUQiIGlzIGJvZ3VzLCB3aGF0ZXZlciB0aGUgZGVmYXVsdCBpcy4NCj4+DQo+PiBBcyBOVUxM
IGlzIGV4cGxpY2l0bHkgdGVzdGVkIGluIENJLCBpdCdzIGNsZWFybHkgc3VwcG9ydGVkLCBhbmQg
cHJvYmFibHkNCj4+IG91Z2h0IHRvIGJlIG9uIGRlZmF1bHQuDQo+IC4uLiB0aGUgc3RhdGUgb2Yg
dGhlIE5VTEwgc2NoZWR1bGVyIHdydCBpdHMgdXNlIGJ5IHRoZSBzaGltIGhhcyBiZWVuDQo+IHB1
enpsaW5nIG1lIGJlZm9yZS4NCg0KTlVMTCBpcyBleGFjdGx5IHdoYXQgdGhlIHNoaW0gd2FudHMs
IGFuZCBpdCBnZXRzIHRob3JvdWdoIHRlc3RpbmcuDQoNClRoZSBvbmx5IHJlbWFpbmluZyBwcm9i
bGVtIGlzIHRoZSBwYXBlcndvcmsuwqAgTlVMTCBpcyBhbHJlYWR5ICJzZWN1cml0eQ0Kc3VwcG9y
dGVkIGluIHB2IHNoaW0iLCBoZW5jZSB0aGUgdW5zdXBwb3J0ZWQgdGFnIGlzIGJvZ3VzLg0KDQp+
QW5kcmV3DQo=

