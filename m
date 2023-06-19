Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C820735590
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 13:15:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551008.860282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBCqG-0005IO-M1; Mon, 19 Jun 2023 11:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551008.860282; Mon, 19 Jun 2023 11:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBCqG-0005Ff-JB; Mon, 19 Jun 2023 11:14:40 +0000
Received: by outflank-mailman (input) for mailman id 551008;
 Mon, 19 Jun 2023 11:14:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/FHF=CH=citrix.com=prvs=5274193ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBCqE-0005FZ-IE
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 11:14:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7828d8c2-0e92-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 13:14:35 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2023 07:14:32 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7003.namprd03.prod.outlook.com (2603:10b6:510:12e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 19 Jun
 2023 11:14:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 11:14:27 +0000
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
X-Inumbo-ID: 7828d8c2-0e92-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687173275;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NC3+4ERoCeGeZFeRZRsHuufbfSn5sgel0X9jz/QabYM=;
  b=LdlLj8fsCTHYjc50nac/1NT6xO4TVuLD4JwSqcks7tsq8QocSlUy7mja
   7/Y3xcSAQIVBhcWelw+Mq+Vkno4pnbZ9vR0fWeW6wUzqOWKlj1bqlZvZp
   /YTjpcVISaZfcX+YTJryRmpJ451seCLZnZNXS14UZanfzU+UvVibDRddd
   s=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 113722317
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/8UYkKNT8fiX3TrvrR12lsFynXyQoLVcMsEvi/4bfWQNrUon1zYGy
 2UfX2iDOf/bNjDxe95wa46x8UkDvcTcyYVmTQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5w1mPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vhUXDxys
 vYXEw02ZDSzn7i68uyyU/Y506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujeIpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxHikAthJTeLQGvhC333D2Tw9BzovSgWF/Ke1yVSbS4x9N
 BlBksYphe1onKCxdfH6WxS2iHeJphAYVpxcHoUS5wyK0KXZpQqEAGwNVhZKbNs7uIk9QjlC/
 l2Dks7tBDdvmKaIUn/b/bCRxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdMTP/2
 TeRtwAlmq4ey8UM0s2GEUvvhjutot3DSF4z7wCOBGa9tFomP8iiepCi7kXd4bBYNoGFQ1Kdv
 X8C3c+D8OQJCpLLnyuIKAkQIIyUCz++GGW0qTZS81MJrlxBJ1bLkVhs3QxD
IronPort-HdrOrdr: A9a23:zOBiQq/OG7aneWR67FNuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: =?us-ascii?q?9a23=3Az+5EY2vt9Z3kNOVG1fZzDa4p6Is7USCA8DDaLHS?=
 =?us-ascii?q?FMmxNeKXPRW3O8bp7xp8=3D?=
X-Talos-MUID: 9a23:MHmpHwtv9ZYUMB2lGc2n2xEyK5dG7IOXFx4zzMsK+NOhJXJSJGLI
X-IronPort-AV: E=Sophos;i="6.00,254,1681185600"; 
   d="scan'208";a="113722317"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIcyUx9vOVqgxMzdUCx9CuCCueXqCaYAk+hgIIWPs5Pw+oCLG+XWcCgZhBheeWTIMmJxbFjxu7ZVKvZJcnQOKxziAvl+J6HsTjIU/PMqiEt5QAByzeDUVuVCTd+9tRZmPC5FRZlw6OKmbKMc1Kum7fBOXSjDorZZnlxeT54TR2nXjN1g81LmyFQSrU0fMT4ZV5ggbMOfEcH3rmoaChCzZuHthx6ijM3SXT3HQCY9WIL6aPYGWEi/B+M3hDq8rJCrF6qRRYgeX6yVK5gxoRVsbTht6M5jWsEYkFrJAEFcv8o9muBP5uIMU4RHA43PfR126tAx0RxDnSLAIz9hPGZ4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NC3+4ERoCeGeZFeRZRsHuufbfSn5sgel0X9jz/QabYM=;
 b=MogKuRQFNumHypap1Mucfv1sbbI75QNagetOP0/zsuWB+jmCiUVwZlVLsTeA0iNZSVE0/dBVK3rIY4f3RDLRIfmlCTYuSLz1VTTAGdeBONbrzbibSvWgCr6/D4cP/lBpH4uR9aGEjigU26rJ/HdZTcweI3Yh3jG6tomndFXPasIrh7OvKEM4HIFKRNhHM3BRH+C1kxKuJ8NeTnde3AMjNpDBA+EkFfGn47hWaD+HnGNBybnWUb8vxZoqiiMzbfo0u7PLiczXjr3z6yOxQH65W9ihniF7AXUj3s+gkGsZHjBdqqu35ZUybNINnYyIGvXTZ9CdMzFFzojwq8bmjZGT9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NC3+4ERoCeGeZFeRZRsHuufbfSn5sgel0X9jz/QabYM=;
 b=OTol5aZXwgku+AZB8fxNfLTmKPNZ5cpidHlqMliwj7Js/FeWe2L8Mr1y975sWirQ29BsGfTuUDLCxxPD/0TMEvZzHBzb/uOB1xwb7/4tflPbGqaGwAcUA2ibtMVAkjmMCHnMO5ELXp7vRgxUuZEIr+sRUTfAq2hbiFG4zy7b6Aw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <945c096b-05b2-d891-9888-5053f75a319d@citrix.com>
Date: Mon, 19 Jun 2023 12:14:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: xentrace buffer size, maxcpus and online cpus
Content-Language: en-GB
To: Olaf Hering <olaf@aepfle.de>
Cc: George Dunlap <george.dunlap@cloud.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20230530095859.60a3e4ea.olaf@aepfle.de>
 <578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
 <20230530220613.4c4da5cc.olaf@aepfle.de>
 <1b99e58d-338c-02af-eeab-00d691337d00@suse.com>
 <20230616134708.6b3c6964.olaf@aepfle.de>
 <b50a8e23-f3fc-bdb9-5a76-780d2a4a7aa3@suse.com>
 <CA+zSX=Y6yrkA0RM0FAM7Cjv2f-UP8FvMUsoRXbMAxP+fNNC79g@mail.gmail.com>
 <20230616173717.3f264151.olaf@aepfle.de>
 <cab85336-c49f-8993-89ae-a7132c46c0d6@citrix.com>
 <20230619121636.672c8cdd.olaf@aepfle.de>
In-Reply-To: <20230619121636.672c8cdd.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0537.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b48746-424f-428b-1125-08db70b65824
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zykL2dDS2rwFVA1Yn3r9EdR6HfExnfAYdHUNw1HEubrvQu99tzE9uCFlAenIVTVFz0XZmXJQRlOFqorVi4wCMuhAkvOYVA9udnRXfwZrkHVd1I8y3gStEINCltU8mUjIfRuHR6cazPgrujgCsh7OszQYWJ5umCRYpjUk+pnZCJZY2wymqDbLhTPDJrcyhcSjkqKaH2ijJ8Q/SHLy5WHD7nS6NNUmPg3TVSiTCY5aca0CR2K8psGM3gVDQBei6ycPQgkVjt2ounHTsa9B1UxC00ZOd+aBg2VA440UHTzKH7KDMhSUTz+2VBTda0FBmrCxmmHX9tLChxdZLlPJymWishL1aDeppmc8PRekVjJuLoVj5bFYLihFJlTHTyKo2btnsNHgq/I9IX/UlIgQYYiIYexkCplsRN9kwkYCysLrukvro2xM/RfvYx4KXGHMBEfU1oGvdcbdZUTEXROHBBCxQGg4wW5t9NCFebhHkrr4MJi5V6op+w3DDZ34X+LcS8iKLWZFTD+yH6nkEoCJ2uBY0DjLYd5IC4ZD2fW74RZ9ifYW4zO8zE2HKtPLVbJdnPhAo+dUZeaHP1DiN0tyIhAtHd0Tn7xkhXIvo20FRXJCvBrxgrhG5bIeBJJMBCAQcom3o9Z8aZWqaNaPl4cCo13tVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(8676002)(66476007)(66946007)(54906003)(4326008)(478600001)(8936002)(5660300002)(36756003)(6666004)(66556008)(6916009)(31686004)(316002)(41300700001)(6486002)(38100700002)(82960400001)(6506007)(53546011)(86362001)(186003)(26005)(4744005)(2906002)(31696002)(107886003)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjNBK0p2VnBDZnM1MmVqbHYrWW1mcXZBUU11K3RiZGlOTThhVlVic1M3SC8y?=
 =?utf-8?B?OGV6UkF6NXg0MEJKUGtybTBUSVkwaDhoZFFPZ1hiMGgvNWVKQ3VxZ3ZPa1RL?=
 =?utf-8?B?M2NsUG5pOExXM1RqQmdkV2dNQ2FvSDlIcWplMHZDdWNCZ3J0d3ZzdXpHTCtp?=
 =?utf-8?B?WS9hZFNVNEoyQW5BN2pGc29TckIvcmpBckNkNm9yM0RtMnhVNmlBeVA3UlNJ?=
 =?utf-8?B?dGRQUENJenl5Umo4ZWFxQy9vaU1uQ25qWGJ6a1VMZHhmSDY1S0ZFd0l5VnJn?=
 =?utf-8?B?aWRrYkVRMTY2S0RxRXl5Slh0eHRBaHNIeWxxZWFwYzNHamNFRFQyRXJJN2w4?=
 =?utf-8?B?RExZMXFYTEJvMzZmOXhEcmRieFdpK3V3bS9qZCtZa0xIQXVEYXVKblF2TVc3?=
 =?utf-8?B?YmhTMDBwOFRmekhuaHFPT2JyQWtMSXBqUS84MCs4WUU3UHl5OUV5R0hBV3pz?=
 =?utf-8?B?dHZaZ2ZtV0FxZTdXZ3QyZlVQNFVLQnl3WkZvWTk1NEVLYTZRd1RaS3U2ekQr?=
 =?utf-8?B?QU9qVHUveDF4TTMwcEU4WWRKbEE4QlVYOGxqSDRvYW5FMTdqOHlPYVI5Tkxs?=
 =?utf-8?B?bmVacHU5VnNxYmIvUHRHVWVoekExUm1JbGpxWG9ZbVlLQWxBVzEzTjBtTFBS?=
 =?utf-8?B?alNzb29pZ05salUrTkZoU2JBVTZLUHpQRU93Sm5RU0IxdkJrWk4rUy9RWlp0?=
 =?utf-8?B?b054dUN3b1RXa2NzVEhldEpRcE1nL2JCdFd3SmpIT0Q5WG5Oc1VHWE53VUlL?=
 =?utf-8?B?VWwvSVFlT0xZNC9JUkZDYkVTZktFNmZvN29OL2JWd2w4ZEwvelZ0UVZSZlhI?=
 =?utf-8?B?alZBWCtJRlhxbnN6eEVvZys1MGthYllJejg0UXhobUxzMHJjRlI4SUJkcm1B?=
 =?utf-8?B?ME5LZ3B3S0paWkgyMVU2aWpxanRTbUlURnBROXI2bzU3c0cwMjRNcUgxZXZZ?=
 =?utf-8?B?eExwZ3d3bldRRy9NUTRyQnBtQ0VEeU9UT01mem9GVy9CRFUzNGp1QWtsOHpI?=
 =?utf-8?B?dW15U2pnUXQ2Yk9sVnlZcDFJOVkrWGlkV2p3clNMU0hTUy9zNC9Pb1JBZm84?=
 =?utf-8?B?QUxjYnhrK3BVYitQRDVPcGhCYjZ2UDVXQWx1VTJidDBqc2VKbjVTbHY1cjdx?=
 =?utf-8?B?aU0rMzN5UHdVUUJOaFpyQkR2UWtUQkZkaUViODA3dWcvK2lFL2Q0V3FwQ281?=
 =?utf-8?B?UzNiTk5RMVJxeXhQcXJvQTkxTVYzRnZNSHV2eWhMbngyU2kySHNobC9IYUgy?=
 =?utf-8?B?STVZMkpOdWZRd2pPbXltNEVuUUpIaC9Na24xZU9aMytmT0NhRCtacFAyb3pq?=
 =?utf-8?B?aFkzN3FFYVBOR29ZYjNRMWJZTmxOVWxQTnpXS2dzK0lhOE1vbldZWnBrNTQy?=
 =?utf-8?B?aXlJeWZzZ3orNHNjRHRVZ2tIcUZTMklOTVVVZlZxeVFjOWwvT3owNTJBS1Br?=
 =?utf-8?B?dWlweW9DZ3JVUmhmU0FDT0V2Q3pJa2VjRWlZRlJ5S0xhbVV4a1VTaElXWVQ4?=
 =?utf-8?B?ejRtNXJJSUNCVEVrTnQwM0x6QXY5MFJlM2lRcHM3dmk0Z2Z2b0FtUEFWWjJL?=
 =?utf-8?B?YUFJQVArUlRTQXR4VE5HemRyTTBMT0RlMzgzQnJ6Wm5FdzZZYXM4MkF3Mm5a?=
 =?utf-8?B?QUVwOUpFRXRCM24wdk14ZDFIQTdSN3JQeEFvV0w1WnFpUHpBN0R6YnAyQzkw?=
 =?utf-8?B?ZklDSFJsa3VuREhLU2NmUWw3TEhzOXlVdXdHZXB3QlVoRkl4YkI2eGpBVGZq?=
 =?utf-8?B?MUNjV1ViZG9PUVNyckVET2NWdGFzTHNVU1lwNHJaMzNLS1JlOG42V0FtelAy?=
 =?utf-8?B?eFdyOFZrUXN5bUNZOVoyOXliQVVsaVpFbkNKMkl2cUpUWERkeis5bUJmbXlP?=
 =?utf-8?B?b3I2M0xKdll6ZFVHLy9yN1Zjd0gxZzN3QUJ0SElKRm83aXdwTlZTa2V1R1Rq?=
 =?utf-8?B?YVZvREorSDV4Ri9NckpNcUZsTW8wbmh3dFFkWGszaHBXdkdKQlVpSzFaSlpz?=
 =?utf-8?B?dFJ3WVUxeXVjMG9NVk5MVUZhWmd4QWRBcUVydkZaVFlaSldTeHh3bVB0ejJD?=
 =?utf-8?B?SlRIcklrRmpINzNYcGZGVFArNmhab3pGNkFUVkVDeXl1NmhEbW0yNHNSMThD?=
 =?utf-8?B?R0lSVVVVdTJSNXFWUlhwa0d3Ykc3N1U1cVY0RDcvQWcreFVuR0I2MU5iQUEy?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3T+hU1bi+IM/sjjtLjPqhSBAIb4TSmfQMeuhh3p4I3SHDX/HZGY0psjyQMwxW6D9MXDwZ9sHXeHQZi2gAkIaN9E9UBITfuDgEZh2oR2lrbuynos9SWEzhgrplLk40lkq+7GhVQeNer1T0QKdzLuVkRzH41bHGavG5PysZ4DJIiJp97UnQ57CdSZFEO/WffJ4DgdxnPyVq7UsclI4eK086UgyfWA/7hrYgGKTgA9nkvtfA4zgXLeIoQ+k5vyg4/uU9fW+GjjV6rAzg0SGTEO3s7r8kV2ukAZIFwDPHlRiPTaqNVUcq/SZPV62lFBPzzPJXfHCT9WZenzJ91vsD+FaHjRmQ/HoWOE06YPw9/W5wj2rjQWvEpo0N4f17MNDTTRlMkvwBhyP7qWIAaEx9gAWX9BtVU0dTXXk4ZqSxQ0Wpahd1USCs8E4td13dGzfP7j1X9XIK7aaDQ5CzwhXz3G6CJUvwTxEpF+yW8unuoq0//vQckGf8vCDbqhQtFhzSjvJQs15g36GnTQthSO07uVG1cX6glrzqN1byh1HgQ0ocBKesLoybaktQRX9nZFerD7f8CZAIBIFlg2WqfKTQfTnBlSBd7hvrdHPJySfKvb8VMwWHjoM/DIqt8KtKEMn16z/V/0N7HEdnU9Qa6qAri1o0X8Pj4Rk2dEnCNu95Tbc/jehvUCbXdSUYpEpGts3dDw1k7L6gPt9BPg1ivGboheHU4FrVxoQol/LaF/ZVlLe0xMxiGK7hkMsWni7CPBx9eoVmaz0WM76e+O3HbTSt7UqvnAFSpiDVhI+pOr5ErJdKZa15hMywtiPdBkD+jbQ2864tcE0FFFarorgHcMdTb4k4xpCEcOxoJJ3mr8LhZE59Pk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b48746-424f-428b-1125-08db70b65824
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 11:14:27.0823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rW9KU9eF1W0SONbtt2Cox1dLqlUJx22nyVB9t/DES4jIzjy1GM7PKH4nUVXV1rmpMZbc/JEGizdTxme079wINDuF2cxYYJOsS7SGjJHT0x4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7003

On 19/06/2023 11:16 am, Olaf Hering wrote:
> Fri, 16 Jun 2023 17:08:25 +0100 Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> XENMEM_acquire_resource is a new mapping interface with far more sane
>> semantics which, amongst other things, will work in PVH guests too.
> Does that indicate xentrace will not work in a PVH dom0?

To the best of my knowledge, it does not right now.

I seem to recall that ARM did some bodge to make it work for them, as
all guests are effectively PVH, but I don't recall exactly what that was.

> I will have a look how XENMEM_acquire_resource is used in other places.
> The resulting change will likely be too intrusive for 4.18.

It shouldn't be too bad IMO, but it's not the end of the world if it
falls into 4.19.

~Andrew

