Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE7E77F6F7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 14:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585415.916525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcaM-0005gk-9f; Thu, 17 Aug 2023 12:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585415.916525; Thu, 17 Aug 2023 12:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcaM-0005fN-6X; Thu, 17 Aug 2023 12:58:46 +0000
Received: by outflank-mailman (input) for mailman id 585415;
 Thu, 17 Aug 2023 12:58:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+2S=EC=citrix.com=prvs=586922e9e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWcaK-0005TE-Fl
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 12:58:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9be9462-3cfd-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 14:58:42 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Aug 2023 08:58:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5411.namprd03.prod.outlook.com (2603:10b6:208:29e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 12:58:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 12:58:34 +0000
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
X-Inumbo-ID: c9be9462-3cfd-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692277122;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uIMG2pq51Ki4wpnbCrSGV1mVt0seOygKCZAFBbfZZBQ=;
  b=Omki69xLD7mQz+vRvb2dRO3LdRy06Rv6KR/n8H8XHEzyqSKNgyEoqlXt
   aBLIeuzq3pNPjPpFr7iICObebId4Ul6u7vX+NIGgLRjxg4A3xa8yRHnHT
   anQyF0lYDBmytqb0Ech35+gJT0s4xR5ZmwKHnEMxBjy20pxRgSb9d1rYf
   I=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 119787189
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CGWihKCHXBiMExVW/wTiw5YqxClBgxIJ4kV8jS/XYbTApG4ngTcBy
 DRJUTiBMvvZYTH2L4t0aN+y9UlV78fRm9Q1QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GNB4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw1KFUKDtl1
 cQjBWoQdgufm++H/7+XVbw57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvDS7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWzHyrB9tCRdVU8NZXjny23G4jECdJbmT4naeCsmnleMxmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBQQ5b5dDm+ds3lkiWEYolF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:etU/GqGR2TTqr7G2pLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-Talos-CUID: 9a23:Y2tWFWy/lm9MVLmGhrqxBgU6XeMMKFb99Ez9eVKgEnp1RYyqRHOPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A/B7/pQ5cWBk74yIylOgHr9NHxoxV7YWLEkI9ia9?=
 =?us-ascii?q?ZgPbHCXJLAxDGryqOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="119787189"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLvneLdyFDRoApD7b+dN/3CsIwkRbEiemNgSSJE9gVyClQ68KulY2PyuDgqs3GIxOT4nzmFPIztOfmqcMwd1SonRLs69YnWe5apau7kNau/74VlMp0cUvNlYKxrfl0ZfpJx5geJD12mwQ1HihNL+HWb3v/HM2nteFFeKciyaQEc7EV1s67atMRr10oyWrTHtaTTIc00mmyWMt33BxRXTYoZ+wIkjltUbYFKefOUWbOC8uNnxxt79QSN+51u4UJ1WIFT/3zQjzulGVNwVApiaAE/O9dAZrfNYrXccFjYM0PXEUm+nuLCb1yhWs08qP3I0cvHQRSuHh04IQIRwXwkPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIMG2pq51Ki4wpnbCrSGV1mVt0seOygKCZAFBbfZZBQ=;
 b=XAxKWlrPiUZheh5PSJBbeVL4Cnioaqf7LAGZT7QysWJZIjFwo7lr/h1OzGdh3MF4VAY6DYfnjoNXkWyvaL0bB0QiuPNszoZcja+H85c6YQ2wSskk+/R3q69ov4YUEWa8rYjwUKVkDB/PM/N/x6ZWEej9VL5ACFdMp3ZLuhLN1+9AAV4sDRC/vl0BrI4cfU0pxyLN0hSHHqpmMWBrZZ6kr2CQn6GegFeq26B9rxfQeWt5YKfWvApo1Y0whIg6mHR/vpf3Jx6L/8s6ZK4oaHeQ0IMuXMWebhKasG+rtucLqzcw75fHHvGeqzYasNmsCEAKXjiavowvAnMkY4lXCI9WNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIMG2pq51Ki4wpnbCrSGV1mVt0seOygKCZAFBbfZZBQ=;
 b=IqK3ZrQJMp1dIkNPySLkYtNOEc0ploBqClNZVjICGdQfwupjwS262q26iC0AHIdPrh4e6I4s/H1esTXFH2ZtNGpmykO/N4o+nnKO2SExymPvo60cgz0U3xgsvNhs8R3IepdOkmwURqpXVL1lLZ9V13Q9a3joj+ak3u6yTUgl8jM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <defbf6e0-28ee-4276-7535-0ed2e23ededa@citrix.com>
Date: Thu, 17 Aug 2023 13:58:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: rework wrapping of libc functions in test and
 fuzzing harnesses
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <a67c2fa3-ba1c-3783-c3ee-250aff6903d5@suse.com>
In-Reply-To: <a67c2fa3-ba1c-3783-c3ee-250aff6903d5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5411:EE_
X-MS-Office365-Filtering-Correlation-Id: a8526588-6529-46d6-470d-08db9f21aa54
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w9vOdrBYBwVjXqb5GkWxdcB2xlnJaxZelyO3Ex5ukDCSPy96k/Tw3zuatXKFTtovX+j3e1Akl1NMV+jZL8nN0gnqKng+P571Osh74M30w0U+RoL3LtBKUpU4TTT7x34o8DRpwE+c9IPivKUwf7FiKLtGjRWYx62dOSlVzl+lKWvC5D+4oycJvSMbVvX3xdrq+5zPSeklEijkowHkJ5aYotxyuyWoyquWy5igEyxA/VqeG8NPDtR3rW8SbHdks9oQfVjxmxvPtiLbOq2TgOZvZh1qlFFNspFVb8dc6Shd0uu39QCXMHgv27zzBbseQNqSQm4apwWJr3W1TpAc4kgN0hRhFh58VOIXTR59oEuDk0I+VOtphatHc8gee2KXM0H34/7vNRCRPzuZjvEb6o3D704d8gfQTecN2a8r7qjyKKZqBsFf3dkzpNp3d3ukkEB+vkiG8dpxGlgfWVt7DR0eva3sPxEb5gRiGYqGl5JxcRHreKRD87Icp3VVa/cml+VQzRYgHkn4/qXRdT7tH2A+NqckrJ4Lk16oarX7wzjLUOM3XvCU00g4kbx8CtOpYxodP0WxbAYtNDRxscgkgk4rJ5lpg42RD17LYOfZBAxTxQIodMy9uV3H6ryJm+/GfJJt3z6IwDECC0V1sYy/D+zv5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(31686004)(31696002)(86362001)(36756003)(38100700002)(82960400001)(5660300002)(2616005)(107886003)(110136005)(66946007)(66476007)(478600001)(66556008)(316002)(6666004)(53546011)(6506007)(54906003)(6486002)(26005)(6512007)(41300700001)(4326008)(8936002)(8676002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEg1T0E4bDVDclM5Q1hWTUZNeEhhbmNMN3h1dDNDbkhYeGc3R1JsRHAxVGdj?=
 =?utf-8?B?WUt0cWQzeEZnNHhjV0lIQjFrSk0vUWdUUWI3bFp0SHBUNUVTdEJEa1BCWnpK?=
 =?utf-8?B?a2VXbTZtRkROSkZ2U2lhLzJnSWN3d1M5QjRkQVpCbjNsaDlsMVNCMkVzY0pG?=
 =?utf-8?B?WlNaN0FsWGREempGWmgrUjNIdllFL2VBRHBYOTdNR08rUUhFVjhkK0Nvems0?=
 =?utf-8?B?N1JqN2hTMDVpaHdGQVRObnJUdFE2OXZOM2FNRWlYbTlhcWI0Q3ZIZmxVZDFY?=
 =?utf-8?B?d3RzNm43bC9MVGxUakVhTWJWK2pwNTkyNkpCc003ZGZGeGcyZkZWSEo0TDhQ?=
 =?utf-8?B?ZytITVZxN2JyWHFmWFFzb2J2WDM1bWhUbUhkYlpkVldRc0JtUlpjM3AvSHND?=
 =?utf-8?B?T3lYZ2k5UVpTL3FCaFcrMlVnTWxTL051M3Z1aEpRZGNIa05pcjF0VktXZzdP?=
 =?utf-8?B?ZDlYbk5NMUtCUkZMbm12b3gxNFRjNXRsWHNiZDV2azRsbXFQS3lpeHMzNlVq?=
 =?utf-8?B?WGtoVzVZVThjWFpiYldWRXdwM1JpcDBTTEduWFprN21sNkhsM0xNb3orNHRR?=
 =?utf-8?B?S2pieStGSUNqOEs4YXNGSjBCaHdPZWNEb0FCNFN0RVRTRVpNdUpNMXczcytq?=
 =?utf-8?B?UytXQm1QUHozSURrdWZ3OEdva1hOcVZVNlVURjVMdVB0WXJXVmFUWWQrMTdG?=
 =?utf-8?B?c1lsU1JndlVqTFYwWSs3dzRpTzZ6ZGltMnd2eFYwTU4vNzNIdlovR0RETjFw?=
 =?utf-8?B?dHJxY0FqbEYvNDBBVlZzZ3ZTQkVDMzRrV2hoc2ZKQWIrUlhMb0VrdUd1NHdG?=
 =?utf-8?B?MldoQU5EekJwUXd1SUZOdVVVV1BwWGp3bmJNMzJLSjNMVk5LRDZKVjJSL3R3?=
 =?utf-8?B?N1dNalQ1bTJlQ2c1SXlZdi9NcUdXMDVjaG9QQ0oyQ3prc2xVa3creUpjOVk1?=
 =?utf-8?B?RWIzK2ZzK0lPSmltZmJvMzJFSVAyOUFCa2ljSDdQdUtZaHRLRjZWT01QKzUw?=
 =?utf-8?B?MnZTeldFUENJY0NrVGNMdUplMU5KRFZHczVvYm5tUFR5d0ZkaGdUcm0xRktE?=
 =?utf-8?B?UUVpMXplWlMxNlZGUzZlclBDU2ZoVE83RStGUkdKN1N3UE5NWHVEbmdNNVpE?=
 =?utf-8?B?ZGRicDN5ZmJiR1UwdDJaUHpRK3FCbjNkb25Xb1h2anV4MDVrUFNaN1J4ZFM3?=
 =?utf-8?B?cXJ1N1JoWkpEcFo1ODlQZHFyWXNoNnQ4NUlQOFk5S2N3NjdJczhENzJEKy9Q?=
 =?utf-8?B?czFqa0JXVCtvZTRWTHdNcEdKelJIVHhnSGhidEhaQzIrN3kvaDFWdUlsMzV5?=
 =?utf-8?B?d2RhcU0zV1lvMDN6dnVDVlFWZ3Y1aStsVGM3MlNCY3IwVUNHZXppTEcwNndY?=
 =?utf-8?B?amJjWUtSVHZtUHdOUlB4NGY4bzZvbUsxbktxL3NKaTJrKzBlYkRRN1hqbyti?=
 =?utf-8?B?NzgzMEVLS0doUGErRmZENllFMi9ia2EveUVNKzRMbGV3Mk5mQVNFS3dLWlV3?=
 =?utf-8?B?S1RTa2RPU0IyYkJnZkg1SnorR1I1SGVadFpVcTAxSlRZZ3ZUenY3ci9hTFhs?=
 =?utf-8?B?VXdnMGZ3a1k3a2xrZUZ6QUtvMHp2VUo1NG1pMkxZVGZ0VU5oMVVDajFLQ2M5?=
 =?utf-8?B?dEw5K0ZXMDFkbnJNWG9CMXQ2SWpJa0NxMWJaSjFkeFNGWDhXb2xUdlVDRDFY?=
 =?utf-8?B?MkgwU3VwSnFHWTZRWklIamN5Z3ZvQUk5N3I5a3N5MEpxOWpZTVR0TzZUbmcz?=
 =?utf-8?B?SytOM2pWbGtQN3hrR21oOUNpbGpLSlM0SjBKQjVKZlJCbXVpaDBqdlNLbkls?=
 =?utf-8?B?VlpXY0VpN0pIWXkrVGRqb0l1ZDVFUjBUNEk0QmFGZUlncnVZK1pqL2JlRllv?=
 =?utf-8?B?cWJzZjBLTFRhaTY5L0RIS2psOWhranpOaFFQWmJmdFBocjNTTXVZazE0Y2lm?=
 =?utf-8?B?MEt4UG45cDNiSHRZSGl5VEp3TDNQMjFUbHJETTE0YUt5dlFDMW9scmlsQVZZ?=
 =?utf-8?B?dWlSWnJ2ODM0Q0x3N05WWlY1blNBT0RpdzRyMWw4SzdkQWpUMzZpcDZ6cVFH?=
 =?utf-8?B?dnNkYS9GWUhKTnhvM2xwUXE2c1NnUUtVUWN5a1psaGxlYzdEajFXbFlqVjFu?=
 =?utf-8?B?UFBtSUNvVkFpR3hQMVo1NXJRNkZ0QmxQemdnZDFaSVlWOGNzM1F3ZktKQXVB?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vn7QEvfXa5r8sgDgOw0PIyAVx3ZPm1hdx9VBHOFUmNLtUA/jb2kdIlGFBMu7uEsHQKVT/BFt2ubbgP6jNg1Dwj/EB8HCysbBCA3NXseBKgksN3wtXkcGxiaq+ostWm770LFZAY6SIOknvTqAWJvtRb44Jlp18gJzfn0Nv7Y+hLQ5egxMqKadKojSxYl0Txb2PYUCx3rRYLAeA5oeKs1pBn5xjA1rPVDH/IvKvthgVxzcZPvjTTk6hbv6DrOwqmPMJ/+pYBEnjJUIdzPsudbG2vb7GWfu3j1DRwNko6PqX4x0WN6wxJKIyUDPkpslYVzlsmqWSZfINxRS7YseiXMs4Wn5aM+hPhvz9qEdt/iBaLxfsOoCjAcem/tf7/YTLxP1Q6GDzEaHWHJKC60A3ycEhAPO1yDea0j3O/ECXswxSdnjDeXqgGeN0lDI9oP2NGAh7WH4DVR2+I/HPudINyTONk4mgb+AADzthK1S0gj2Vpfz+SC4iEQOzjLFLWDAjVOTGaHm+KvUs1gACue6+CrvAggNzb772rADRplZCvAG9ex/hLLrN1cC74KU/HZJOE/wPNajtaLNE3ppUXUbBkdc3q77IfBHr8PTsHOJu2IYzx8UfJm+8lGu7aAHUwx8hIO+lL/6XLpvfcENkbI6v19S0q+XloCZaNBCUttKmBTSS2PvLMl049PbSlC8GSuuiXZpChRbRGQ8FKpV3LiqiwbxaDzVjveL0scXkrVqCrYvkuHX/EIXYcgpnGU/5vNb3L9DwAwmlmY4INpGRmvfT56iiKZzr0xL3UTlcWdNRa03n+ZSzf1TXHsxuKn0yAx2nwj9g0/ra9kpXrs/DUwhc1HVUQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8526588-6529-46d6-470d-08db9f21aa54
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:58:34.6006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlCDOuCfaMKQpDZY7lIO3m0II+CNFawUZdphAUMc2wws4nOCGqVshCQVe7dr9gYlIRDlPnnFBpPNSQlHLRdLE4td8RRkWU4kofZdZfB8ap4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5411

On 17/08/2023 12:47 pm, Jan Beulich wrote:
> Our present approach is working fully behind the compiler's back. This
> was found to not work with LTO. Employ ld's --wrap= option instead. Note
> that while this makes the build work at least with new enough gcc (it
> doesn't with gcc7, for example, due to tool chain side issues afaict),
> according to my testing things still won't work when building the
> fuzzing harness with afl-cc: While with the gcc7 tool chain I see afl-as
> getting invoked, this does not happen with gcc13. Yet without using that
> assembler wrapper the resulting binary will look uninstrumented to
> afl-fuzz.
>
> While checking the resulting binaries I noticed that we've gained uses
> of snprintf() and strstr(), which only just so happen to not cause any
> problems. Add a wrappers for them as well.
>
> Since we don't have any actual uses of v{,sn}printf(), no definitions of
> their wrappers appear (just yet). But I think we want
> __wrap_{,sn}printf() to properly use __real_v{,sn}printf() right away,
> which means we need delarations of the latter.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This does resolve the build issue.  I do get a binary out of the end, so
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>.  I presume that
you've smoke tested the resulting binary?

However, I do see something else in the logs which is concerning. 
Likely unrelated.

make[6]: Entering directory
'/builddir/build/BUILD/xen-4.18.0/tools/tests/x86_emulator'
gcc -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall
-Wstrict-prototypes -Wdeclaration-after-statement
-Wno-unused-but-set-variable -Wno-unused-local-typedefs -g3 -Werror -Og
-fno-omit-frame-pointer
-D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -mno-tls-direct-seg-refs
-fno-pie -fno-stack-protector -fno-exceptions
-fno-asynchronous-unwind-tables -fno-builtin -g0 -D_64f2 -mavx512fp16
-ffixed-xmm0 -Os -DVEC_SIZE=64 -DFLOAT_SIZE=2 -c avx512fp16.c
make[6]: Leaving directory
'/builddir/build/BUILD/xen-4.18.0/tools/tests/x86_emulator'
/tmp/ccrznrqa.s: Assembler messages:
/tmp/ccrznrqa.s:98: Error: no such instruction: `vmovw .LC0,%xmm3'
/tmp/ccrznrqa.s:99: Error: no such instruction: `vmovw %xmm3,58(%esp)'
/tmp/ccrznrqa.s:105: Error: no such instruction: `vcvtsi2shl
%eax,%xmm1,%xmm1'
/tmp/ccrznrqa.s:106: Error: no such instruction: `vmovw
%xmm3,382(%esp,%eax,2)'
/tmp/ccrznrqa.s:107: Error: no such instruction: `vmovw
%xmm1,-2(%edx,%eax,2)'
/tmp/ccrznrqa.s:108: Error: no such instruction: `vcvtsi2shl
%ecx,%xmm1,%xmm1'
/tmp/ccrznrqa.s:109: Error: no such instruction: `vmovw
%xmm1,318(%esp,%eax,2)'
/tmp/ccrznrqa.s:113: Error: no such instruction: `vaddph
256(%esp),%zmm7,%zmm5'
<snip many>
simd-fma.c:208: Error: no such instruction: `vfmaddsub231ph
60(%esp){1to32},%zmm6,%zmm5'
simd-fma.c:209: Error: no such instruction: `vfmaddsub231ph
60(%esp){1to32},%zmm6,%zmm1'

GCC is 12.2.1, binutils is 2.37

AVX512_FP16 was added in bintuils 2.38 so I understand the simd-fma.c
complains, but ccrznrqa.s suggest that there's a bad -m passed.  I
haven't figured out which source file it logically associated with.

~Andrew

