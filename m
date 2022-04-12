Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3975A4FDCBC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 13:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303625.518018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neEL5-0002jQ-Pf; Tue, 12 Apr 2022 11:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303625.518018; Tue, 12 Apr 2022 11:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neEL5-0002hB-Mb; Tue, 12 Apr 2022 11:05:39 +0000
Received: by outflank-mailman (input) for mailman id 303625;
 Tue, 12 Apr 2022 11:05:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=to5A=UW=citrix.com=prvs=094341a74=roger.pau@srs-se1.protection.inumbo.net>)
 id 1neEL3-0002h5-Rn
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 11:05:37 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7964c44c-ba50-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 13:05:35 +0200 (CEST)
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
X-Inumbo-ID: 7964c44c-ba50-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649761535;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fLeE0h/jlJ2RrWdRqIQ9awMFFc5vDJaEyk2zlWllMGQ=;
  b=Z0oPwOLxAAT79JkiybvlZ4jSuj8D1joO3OVzJeD9Fz3jctIFSFVfmLlO
   XvMVko9jtsP3a2LTvpycsYsUzSHI6B4+73NrNL3Qevpc5/WN8Ew6ogtiq
   o9EFsf6A0ZEabPTWslwWxomJN9Tk24hqBdk3t8XYSyNvJACA/F7uYF8rw
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68544982
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:33vJk6J882zBa439FE+R/ZUlxSXFcZb7ZxGr2PjKsXjdYENS0mEPm
 jcYXGmDMvnfMGemfIhxYInl9BgC6JLRy4dmTABlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tcy2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NNWmLy7dVwJBK/FwLQyTQkfT310E6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glg25wSTKaED
 yYfQSJjNwvYWjdCAWsKJ8olg8OpjFqvURQN/Tp5ooJoujOOnWSdyoPFM9fLe9rMWcRcmG6Zo
 H7L+yLyBRRyHMSW1D6t4n+qwOjVkkvTWogfCbm5/f5Cm0CIyyoYDxh+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxa5UgU0AoQKVbdgsUfUl/SSs13x6nU4oiBpbscLlMQKHhwQ1
 FbRz/z3FXsz7Le7RifInluLlg+aNS8QJG4EQCYLSwoZ/tXuyL0OYgLzosVLS/Ds0ICscd3k6
 3XT9XVl2e1P5SIe///jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5XGhAztJcvU/MBofAnrNOv3jxpiGGeB6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYCr1Nf4nM9vsUZlCIU3c+TLNDK+8gj1mOMYZSeN61Hs2OR74M57FzSDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7ntW+I8nfriil07P+ePHPBa9EO5ZWHPTPrFRxP7V+239r
 ocAX/ZmPj0CCYUSlAGMqtVNRb3LRFBmba3LRzt/KrbYclU7Qjl4YxITqJt4E7FYc21uvr6g1
 lm2W1NCyUq5gnvCKA6QbWtkZq+pVpF6xU/X9wRwVbp08xDPubqS0Zo=
IronPort-HdrOrdr: A9a23:y5nLuqwqA9V/P4gdV0LHKrPxteskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4+G7j5vZZm3m/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTvj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZrA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKffZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv7nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLUU5nghBgu/DWQZAVxIv/fKXJy+PB9kgIm0EyR9nFohfD2xRw7hdcAo5ot3Z
 WyDk0nrsALciYsV9MPOA4we7rGNoXze2O/DIuzGyWvKEhVAQOEl3bIiI9FkN1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.90,253,1643691600"; 
   d="scan'208";a="68544982"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzzC0dVa0iiDyiZ2U0wz5T2mnA+BN51o/xIpZDmHaORUsOtoF9TRYbZl9T9O+DOPBsD/kMgJd4LZAA87yJhxwAtyUnexce6RIVrgBn3Yo3wpxD/B2gD0TVPuQQ89THUoPLVoUsmvdlX8/WH4DxpZHZlbLcEi9l5mmy2AwCH+lpdmHZx1mgSpeK6z1zPy0//nehicDPVI75qg0cK4NBc7az/itHfjQeXRAsuSFg0TspXPG4jk2ZeMHrNoawjDuYT0V4vC5nJesKK0pN4sRcSZtOnMbYa6tOm+CAxq+RdZHPYy8vUtv2RnDv9FtLngQNlZsPjt39d27nREZooUdGwCCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Idj5G4HzMqeRporWfc47xozFuzLW8B0S46K7qXnsnQE=;
 b=eOHAXz9U5XfcflGIEnD64Z36AssvuhsSINP2ytmA5PggRrsvK9QTeCbrVG/UBT2LS5NlXp5qzmzBtbIUKIMwJwUQf2UDPRXkE5tk/yUgNwHrp9Uz5KAgXW0rtITwr0pSF4dN8JZKEb788FQZW4cN4IaZc2V118Q+l0uX97gi+DljxkOLtZ+csm7Z2H+5EBOu+20KbMlCypBIzs61kLMjEPin4vmssW1iTf7TNiBMwimoPdo4N7eslnaFYXRJdzEeTa0Zclr2Q4gJyuCaqo0ULjM3Z7o+17j2eYCwODGv3lRH34E8SJX9vs/zeSmja5aBHLZRksmExRgZhdGEbEsz9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Idj5G4HzMqeRporWfc47xozFuzLW8B0S46K7qXnsnQE=;
 b=N1ax8QSDx3hcTzncSv3PxUzW2uNtipxUSonn7yeqiWDHiQDh79jm797/uZ3EEdIDKkx8deBVBQyst582yyROVpDQ5TwTV1JgooAbH0dhnZh4Fgl87Olj6LM0pfNW27pVsEEXfF2BApcxqHVRVOXpN9CH2TVY4rAiDZj3faFsqIk=
Date: Tue, 12 Apr 2022 13:05:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/8] IOMMU/x86: drop locking from quarantine_init() hooks
Message-ID: <YlVc9shnBYKShLiP@Air-de-Roger>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <3430b8fa-6700-b5ec-a160-2e7609dd38a3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3430b8fa-6700-b5ec-a160-2e7609dd38a3@suse.com>
X-ClientProxiedBy: LO4P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0132d274-285c-43a0-87ae-08da1c745bb2
X-MS-TrafficTypeDiagnostic: BN9PR03MB5978:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <BN9PR03MB59783A550F59BB212B7A4E2A8FED9@BN9PR03MB5978.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+DGcLBOXmVl3cExmg5rRBawNlTNJ4XpRVdtGdua4nEuabjOSwG78clfVMb+YaTLoQY8lKHrJKbpzqeG3T2Uzs8CKDu+j2qBtxetPkXbD76H5zawBpzerxDSBHBSnOai6HK8VtUxtCBUqeZ8utfzAP4BeoZnWLsKXEm2Fy7flFgyFC2c0dQXbT1fpfA0RLdP+142chHp1hievZ7asLZihr9V53iWTYmsBU8Dv6ZEyd1/Y/eG3a5ZxNaLTwOB1WQiAOEqWcrLAtatjv8BEapQBLmnsUwZRo3VN8u2RW4PoC+HtvBzMKEYlIZf+W9WbI+Wl+RNPGCL9st5YobuZurtn9ASifrUHWOY9GjLLI9/elPwGkza45e3gkjIqVEFNGoWRj4kaT5zU5SV6HRWAkTXgy2zpuBNSHIFDfjYv2oZESP3/+cI1ZUm4xUNI/jMxv5jAczlAjp+/HGMySpw9Ihn3QWhfGqjtenP6Qh8YVKv2htu+NfJWaXbt+fiaI76uzgNKVlIcknmBdIaYYRbzd+83w5yuQLfMp9bhe6Tm/fGRTOuzZmi8LCzt71E5tVPm6bFnIMcwLiG1T5KtfhPS9IfuoSqILSCZMckgllfb3uexl5Gu/mfbgCbgXKSMZ0ILhmQEKfgwi67iy7Fb6C/ReJweA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(8936002)(85182001)(107886003)(6666004)(86362001)(6486002)(4326008)(66556008)(8676002)(33716001)(66476007)(5660300002)(66946007)(6512007)(316002)(82960400001)(54906003)(2906002)(6916009)(508600001)(186003)(38100700002)(26005)(9686003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXE5eGM2NytkNFRUSnFLeHhKb0Z0RXFPdEN1cnd4WUhzRzdRQSt6L09kSjVL?=
 =?utf-8?B?RVo2QW1PYzdkQWFvWXArUks4SmRIdFI4bGNhSVkrU0Voc2ZodXJ3blNWR1hY?=
 =?utf-8?B?U25VS0ovOVFSMVg5bm81VG4xVkk2ZkRHYTc2QTNuMDZ5bS9oV3ExSjJFZkRI?=
 =?utf-8?B?eWRHWlhQdDhEN2Yyem9oSG5SQmVENDFGNWp6WjVTZ0diSlFKNVNmSUFzWVM0?=
 =?utf-8?B?R2lwdmIvVU1tZHZudnpxd3AyR3pDbndmdUwxcUlReXpHQ3hSSE1GN1JZVGFw?=
 =?utf-8?B?Y1ZvTTBRbk93OUlEQXlqcVFpNmNzL3YrNnlTWXZYRTZOWGZDZE1tSlIrZ3Bo?=
 =?utf-8?B?R29VRzJ6TkdJU1hhbDRHWitiKzdHbVhYTG9SV05LQlhoNW9VV3lPWFFld1Br?=
 =?utf-8?B?a1NzVkVsWEYxbHQvQzN3cFc2SkxKWi9sRkg0Qmd0a1pqZzN4ejNLZlA5RG5M?=
 =?utf-8?B?VTJxZGdzOGUvRnZGWThKM0ZLZDl4MFBNQWZUZ3lmQktNdGtIMzBTdFBHelRE?=
 =?utf-8?B?SjJZa0M0UnVQcU5GZDFHNncvZ1QrRllHZjBhTnlYdWM4ays5VENLYlc3MDhX?=
 =?utf-8?B?T1FMWGZoTkRBTkdhYXpQYUdITjRHWkdKSk5pN3Y5UUk5WCt6ZkFuVVkwcDJQ?=
 =?utf-8?B?WDBTaGpJeDJJQVJGaUtnQnpkaXpORnZRaEJUcmdFNXltSWl5N2VlM2UvZGZt?=
 =?utf-8?B?TktNVWp5MHNHaWg2UUdWRTl1cnI0cHYrcGlZL1QwV2pSVGdqQzFFZGJJZUFr?=
 =?utf-8?B?ZzgvbFovMy9EUlh5Z2NuZVZOZG81eEJoZWMrUFdQZFl6US9MbFlJdUdNZHp5?=
 =?utf-8?B?Q3R2bGpXdVhadDlmQ3h6dGx0SllFemlBWlNrd2JsVng3MloxVk9hSEpTZDQr?=
 =?utf-8?B?UWlTT0I1WkwyOTh2RDQ0VG1QQ05HNGJRaVQ0RnR4a3RQOTRPQTZuY2tCU1B3?=
 =?utf-8?B?bWI4OE5tYnZBTG1MYkVZblNobEROSDVIRXY5NHRlYS9MTzFrVDVWV0hnNlBh?=
 =?utf-8?B?V0FtMlUra2lCbzlEMHZ3bmVIN2dDRGdsU3l2RURxc1FUeHh5S0lZdlA3QzJ4?=
 =?utf-8?B?LzFsQ2tLc005alk5bkZ5N1o4OU5wY3d0OXl3c1dCWlplVytvdzdBQVJ6WXpr?=
 =?utf-8?B?TWZxeHhJVlpxMHYrVWtmQ3E3MEJJRXlVNUQ2UXhQelVOVVg4Q0tyNEVUK2NN?=
 =?utf-8?B?QkM0cEszRmNWMWlHR2kyblJFdHpCZ2JlZmF1TUlrempRUG9UU0ltZ0FCZitn?=
 =?utf-8?B?ZUFySk5SZFhZeGNvUDJPdDZQdDhjYlVHSmJLNGh1UlJ1azQ2THBsbTlHUCtB?=
 =?utf-8?B?ejJPRk14SWlCVHBVbkN2aVF0NGU3WUdDR0hFZnp2dXQ0eDY1cCsvUVVpWDBO?=
 =?utf-8?B?ZnI5NjM3YUZyWVBEVkd5dDdURFNvc3QvY2hmOWNvaGY1dGo5TkFXQVhDL2ox?=
 =?utf-8?B?aFNuVnlIWFpsKzFHc1BSRlp6ajdjMVdNbU5nZkt4T1ZjRU1OTzY4OWo4MGhn?=
 =?utf-8?B?MUI5V3h5TzFibHBBUUVaYmJDUm9PMm1HSnBLejFaUmxFNkYramsvY0xjNDRX?=
 =?utf-8?B?RmlWRHlrT0F0Q1R0dnV4ckxGNHRWREtPcnNkc0ZtTE9vYWNZWFJ3NjZGZkZa?=
 =?utf-8?B?Q1Y3dnU3Z3hvb0lhUW81ZXBYdXRwNVpRa1B5eFFJSFpRSmF2azFUZlZHZ3NU?=
 =?utf-8?B?UUM2d1JrSEVYMzhjTnlXZHloRVZGYzBKZUpnKzMrNTBSTmpOYVE2dG1mSWpU?=
 =?utf-8?B?bXBhUUFwQ2FlcjZtcHF5WENIRm5BQUVTenh5ek96KzZnbUVLdS9xcXh2Q1dm?=
 =?utf-8?B?RVVXTWZ6bWlvcVVwcTNBMWFXTUFQUVN3aXhQeHRSM051QUQyR3JGMzcyQkhZ?=
 =?utf-8?B?UFN4WjFnU2ZjZHoxZjRaNVFlT2twdlRoQTdCS3hWZGRxQ0JMbXJtVktSRkJM?=
 =?utf-8?B?TXE4cml4K09wRWkwNWx3RUdHRldkdDhhOWo3NUZnck5LdWljQTkyeTZIajVY?=
 =?utf-8?B?YnlBamhWYWZTMHc3OUFkYWl3a2g0NTNTT2h2ZTM4Ulhoa1ZQeGs5ZkJTNWMv?=
 =?utf-8?B?NmFvRVNyYzY2TjFhN0FWNnh3TzZ1SzNPVWp1NDlvRkhaRy8xblNpNU8wLzBG?=
 =?utf-8?B?RGd4ZWI1VnQwUGplOUVyN1IyWFhVeDFWSlZxM1hPUHpScWpucXBmREpvTlRs?=
 =?utf-8?B?Q1kwQkJPbUVpQVg5NU5KUTE5V01KajNOTTZPekl2UFZPZ2RQVFJnTE5KVmdE?=
 =?utf-8?B?OFZDZ1VVWDUzRUlBU3F2NWdaNXRVcTZLYkVlbEhxaTBuUndEbUp6aEovc2tF?=
 =?utf-8?B?T0FZQWlqSFBuVmFHSlgxVnkvZkZIYlE4UFZIbzdTT2hFQjAxd2JKRGhkQ05z?=
 =?utf-8?Q?T2m/ZK3CE1YCmrEU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0132d274-285c-43a0-87ae-08da1c745bb2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 11:05:30.7338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHmaCylaiV1xx8bHpsFHWbB0hdztg5+pjexmyYFTUm1cLf72RUWeGFYBAUELJ0L3gha+unlHcxoBWkNIRIwfaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5978
X-OriginatorOrg: citrix.com

On Mon, Apr 11, 2022 at 11:35:54AM +0200, Jan Beulich wrote:
> Prior extension of these functions to enable per-device quarantine page
> tables already didn't add more locking there, but merely left in place
> what had been there before. But really locking is unnecessary here:
> We're running with pcidevs_lock held (i.e. multiple invocations of the
> same function [or their teardown equivalents] are impossible, and hence
> there are no "local" races), while all consuming of the data being
> populated here can't race anyway due to happening sequentially
> afterwards. See also the comment in struct arch_pci_dev.

I would explicitly say that none of the code in the locked region
touches any data in the domain_iommu struct, so taking the
mapping_lock is unneeded.

Long term we might wish to implemented a per-device lock that could be
used here, instead of relying on the pcidevs lock.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

