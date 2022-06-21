Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B687552D4D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 10:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353064.579965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3ZUG-0004p3-EE; Tue, 21 Jun 2022 08:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353064.579965; Tue, 21 Jun 2022 08:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3ZUG-0004mt-As; Tue, 21 Jun 2022 08:43:52 +0000
Received: by outflank-mailman (input) for mailman id 353064;
 Tue, 21 Jun 2022 08:43:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ORL=W4=citrix.com=prvs=164d1f6c5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o3ZUE-0004kn-DG
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 08:43:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42a138f6-f13e-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 10:43:47 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jun 2022 04:43:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5671.namprd03.prod.outlook.com (2603:10b6:510:35::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Tue, 21 Jun
 2022 08:43:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 08:43:41 +0000
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
X-Inumbo-ID: 42a138f6-f13e-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655801027;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FNrCyn8Mx/7tAkgrwEhkXNSohg3BRnwaYcikUPpOo2Q=;
  b=HRAwPfvKYFOh9e3FZjEBRMixfUJVxJIAXNEfa0RSXpMcUltXSEyMmz/b
   3diLSE72RL50J6tlMv13LWBOwcxVZr5YztbzXl1I902yMpZTlnMNnOc1G
   ZrcNyEfNOoXtL6W8OB7OS+7lQJ/jsZn0MgrZEj99uJsphO0sIRpou61YF
   k=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 74473539
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:B215lK8tcKk4BIaEdTTeDrUDsH+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GRLWTiAP/eLMzfwctonPoqx8BkBuMeGmNM1SVM4/is8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34LgW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaSLVRx4Y5Xno+I2fDB/FwonMYZmwrCSdBBTseTLp6HHW13F5qw2SW0TY8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvWMvIcItNszrpkm8fL2T
 swVczdwKj/HZAVCIAw/A5Mihua4wHL4dlW0rXrK+fZouDWInWSd1pCwEofkI9y4WPxrm3i/+
 k3X2nrdU0oVYYn3JT2ttyjEavX0tSH0QoUJD5Wj6+VnxlaUwwQ7DRwQVFyg5PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebScj0
 0KEm5X1BT1luaCRVVqQ8KzRqSK1P24SN2BqTTAAZRsI5Z/kuo5bs/7UZtNqEarwgtirHzj1m
 miOtHJn3+VVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:ed2KnKnGIQZOkInND3rKOuTONqXpDfN1iWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SEDUOy1HYVr2KirGSjAEIeheOu9K1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge6VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LHErXoBerZ8bMRiA1rkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4YkWUzxjIiLH47JlOy1GnnKp
 gdMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Uol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+93JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9N1lVnQ6dvv22y6IJyoEUHoCbQBFrYGpe4PeIsrEYHtDRXe
 q1NdZfH+LjRFGebLp04w==
X-IronPort-AV: E=Sophos;i="5.92,209,1650945600"; 
   d="scan'208";a="74473539"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVlTNc3qWhMJ2+IVzdSGMtm+jRwTiP3Ejc8RvdNu3bChdB32XTsXNdicvQ6fPD4vcdTfMsJbY9VJEvbT2pr+S6zu3uH2TJfSS2OXPfBLXtH+C4cnSR9nwCkyryhDF7e+wzYmKmVTF3J7nyQwnlXR7888btrJO6d7C+cF053KEG2VPbdrOenQ5KnP9wgzOB/3FqQoJnhzHsnyyUremVnBC+6cjpUAkRF+NSRfmZ1AVRJ1NMelhh4IokZeigqrsFPwTHRnGT7ICgQ9abDit9hR4tUPlR8cnn/NuoE5Bvnr01JrkmC61VgkVyf3I5xW3z7v2yO5c9km4xot2UWxYrQzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNrCyn8Mx/7tAkgrwEhkXNSohg3BRnwaYcikUPpOo2Q=;
 b=kVi+WNOn3gHalNykrmMeiGAKWtM6szLfElAaXQjOCbbjT98C3HdO2uBR1O1p1XA7SEqDjPIyYEcI0dIw3zzG3yFSEclwyK1Je5SuukphOP+FlQvEnEztVc4SiS2CKPCn5VQIg3K0SYDTpdWTruoUhVbwwXSnNe7CDTrr5HgJdE6HF0njrbDnmJfYijb9SDwamJfCtcriLstZvLlccRBc0zU6PYBk9pZRx/4JWEOZezen9dadkIMZRYd5hVStFSIG4/9rzuwq1ljTwHFFU4cb0h4h+bvDN6UXNpZNcEKrIkgjeKoCQRRH9ogUioIsGXlUdbrW3we03mTCiadpe5KPeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNrCyn8Mx/7tAkgrwEhkXNSohg3BRnwaYcikUPpOo2Q=;
 b=LzSHFxmDC3Iyrd84ZRufriv4EbYuOF0j4Js5MFpMcl3E0kXQrfKDycgxNDqiYHy0Zpao2oQDw6eHuG/s8yuj3toFiNAyysq5Jt3/Urj8Jsa44eZzDR7aobVc4SD6exYpVyU4Nz2DTExx+LzZfZ4hYPcNM3Fe7K0p3L3VLBrBiNo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "minios-devel@lists.xenproject.org"
	<minios-devel@lists.xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "samuel.thibault@ens-lyon.org" <samuel.thibault@ens-lyon.org>,
	"wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v3 3/4] mini-os: fix number of pages for PVH
Thread-Topic: [PATCH v3 3/4] mini-os: fix number of pages for PVH
Thread-Index: AQHYhT/O8+kLDI1LXkCy8scmU4sLua1Zi4MA
Date: Tue, 21 Jun 2022 08:43:41 +0000
Message-ID: <ec0d19c7-cc28-3c2a-05a9-0cdecd5b9f56@citrix.com>
References: <20220621072314.16382-1-jgross@suse.com>
 <20220621072314.16382-4-jgross@suse.com>
In-Reply-To: <20220621072314.16382-4-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11355091-74e2-4bc9-083c-08da536224f8
x-ms-traffictypediagnostic: PH0PR03MB5671:EE_
x-microsoft-antispam-prvs:
 <PH0PR03MB5671FA9AB2D6F5406502E857BAB39@PH0PR03MB5671.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 D4KK4Rp1sYNKtF0DTX7TrffGRWnI6a66bigD4AE7SyoviVLpx+SglTph1jNdHUuqbr1QT7NHWXVP1yyV/cM/Frm4qS/2nz65Mze4QBWHuvzZE6Any8G87d/EI+dAET8NDcC2RE6uCn3CrzNQhTPOV+G6hV3ut4g6FFXyratvfuMJzW/0wRBXdw0niqdZj5uwgkN5+av4SYQ5jW341OU+mbrXQlQxa9dj2x8Mxi1uXF2KFh//VjqFpffJnPm/0vit9gU4ByScjCvy6swiZc5IByqI9fV2E7VyMcTMfgtd8Zb1KyAmCIvzQWJl01dYYt4B6IXycVJ9yFQfN9Hd+4i/huDBEvcL5aUmdi2qbQ2qF9wqhSM/RDv73d6cXBlvkU/Wb5ZxlvDOf0j1NTOiyfzEaryNH0we0Ba9iu2fI9R8BxhUgPe41uwBeVz4t+tatpo/tp/38o6D21aTb0d+fgsGY3sjQZk/1QBPX6jlCdbuogNN1Pd2T3aiRFtGdZ+NWqDhuPitdCsZHq6pOs9HL+YO86oVmH6M9H/pUlamsDsbdzp4lHHJ9RFIETZTuzK4y94eciKmURSj+pCswVBugW+h1PgRj9ZBNzc2IZ5QbzTBE6/8lS7eEFwqrAq/hcqGX+EbTM+CcHzgDjcOBMxk9qt+8byXKZsLDI1UCU0ckfVZ4MoX82vB+0909a2NOaFgKjCeqQKNync5dWServ1SC5Kxv1m80kE4m0V4P6Klf9TUUEJ38PrUaSVwtWHIXThJ5s2tP6KvdkHnQVZNvTQBK2od6g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(316002)(4744005)(478600001)(6486002)(2906002)(54906003)(110136005)(4326008)(8936002)(71200400001)(66946007)(5660300002)(86362001)(53546011)(91956017)(26005)(64756008)(31686004)(36756003)(31696002)(2616005)(6512007)(41300700001)(66476007)(66556008)(66446008)(76116006)(8676002)(186003)(38100700002)(38070700005)(82960400001)(6506007)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2QvNzN3T0ZsWFZnc2ZTdFBsNVplVEZIS0R6UDE4S3RjbFBDRGlLMWNKcFBX?=
 =?utf-8?B?RXBJdEp0b0V1aXZSZllaKzZRcUFkYjE4VHA5dGp6NWF6RFAwOUdnSytMTG81?=
 =?utf-8?B?UXIydSt5Ujg1N3pVb2MzcmY5aTBQUzlHNkZ6RDBNQWVWakFxaGxtV3VjSFNK?=
 =?utf-8?B?QXA0ZXpYYmkrQmh0d0kydHJySFR4UDJZRU1sNll6bHZ2Ti9CajNXZjB4R1N2?=
 =?utf-8?B?aDBlQ2lQMjhObW4zcDluYkFLWUN5MXNKK0FLdmhqRzVXamVvNTU0YWZnRFpw?=
 =?utf-8?B?VWozdXVvUnhVZ0p4RmxyU1NJTjB6bTgrZUJVWkozNUZ4emJLa3ZCWEpaVDBn?=
 =?utf-8?B?RExoS0JWdHNaNTlpc1crVTdheVVpa25pZnRTeUJzVHlNK05JOG44N05RSUhq?=
 =?utf-8?B?S1haMFBpY3MxOEduZm5LYjJKSGpPOWdkRE0yZmpCSnArWFVXQmNDTEgxVGVK?=
 =?utf-8?B?cWdBVHFCMDAybHF6a00xZDMwL2g5SFNwbzZXcGRneDgzYVZSemZaeGR2ZFZp?=
 =?utf-8?B?RWx2OTA3UkdwRkRhNVhBRnVEN3h4OEdIUDFGd1IzYWliRHdidlVRWW91U3Jh?=
 =?utf-8?B?Z0FjR2RpdU9jOHJGMStzQ1VIQitnRDQ5ZmJQMDR2NlM4YlJxb3R3dU1mNWlO?=
 =?utf-8?B?SFJUdnNIdEJ6V2pKNzlPUnhVV0VuRkoyWVJRNE5JTmhTVE15TFdqY1lpTGRt?=
 =?utf-8?B?WWxsQURSSE9EK1F3UnFZNTVCODFxelJISURrQmtFRjlFQUYxZDFtMmphcEcx?=
 =?utf-8?B?aU1OalJPRlhMeTQ3ckNidGJucEFkM3VrdDZ2NVVYd3JZZWIxeU04QU1ScW1Y?=
 =?utf-8?B?S1VydStXZldDUzVLMzJTUmtyMEk0aHZOVHpvTkZtalYxL25GdzBpMWJCaUNo?=
 =?utf-8?B?NVJLQ3FKeEtDNUxTUThzMVJYaFNNKzVCZ0VCMzlHRk5wL0Z6ODFTZlFoaUhy?=
 =?utf-8?B?eUh0ZVRaSTE2RzlmZHJtMFBrM2FmT1hhSXhIdjRjZEVWSGF1dWtHMkJEeDNq?=
 =?utf-8?B?c1ZoQmRLV2tTZlRXcTc0aDZONnZ0RTBTemZyU0I1TzZweHRJaWlhNitBUDcy?=
 =?utf-8?B?ZnZiZDBtNG1kOWVXTTBoVzJRbHBpczNwak56WTJubnlXV1JjYkZTV1BqT1Q4?=
 =?utf-8?B?SWo0cjVIUnlxNCs0ZkNtRmI2QXY4LzA4ZHBZdXlieXcyaVNvY3lOZXZNdFQ3?=
 =?utf-8?B?RzZrTmZzVUkvUUpzYVFFZ3VGUjg1WjFMTnRiVzBodjVxY01GYXFMK29LaWNq?=
 =?utf-8?B?WVowQlFYWkJVMEJiRnEyVVNFWExHN25GUzhMQ1l4Q0FJd2pVVnQ2RnBvTEJM?=
 =?utf-8?B?dnJZOUxqNkpSbUNManlpVVU4MWZLcmVzM1B2akxPaDR1b3h5aHgzck96dTI0?=
 =?utf-8?B?L2lqQVM0ajArdktMekpBeEZWWnZPMmMrV0kyaHFFd2NENU1ZS0M3dVFNNTY0?=
 =?utf-8?B?VE1KaUt3RzQva0ZacDF5djRmbXhyZE1ieGRGRkxSNlE2Q1Q0UUtqL3lRUE5y?=
 =?utf-8?B?TGhGMHlJUmZzQlZKTkltcDBTMkI2NEdacGJrd2s3Y3dUc1hwQWFZZ0NkTjFB?=
 =?utf-8?B?UUlyZFIzUERoNnJaNGl3ekltd1lSdng2QjNUN2pzTGNtN3lzN2FCTTJGRXlX?=
 =?utf-8?B?NmJxS1YyTktaejNaQ2hRcms5Y1pZZGQ2cVhhdjR5dHJ6N0Fybjl1MnJxSFkz?=
 =?utf-8?B?SGhmYkVkUVpvV3k0NVZYWTRUbVNDOGY0SzNrSm9HUHJIRDNSZmQ2ampDWXVG?=
 =?utf-8?B?V1czUGpjcGVzRUM3bENKcks4SzdRMVViN0tVTk5BVWg5TVBXQmduWFVXdjRh?=
 =?utf-8?B?ejRZZnVpK3p2UVhGcUcxWGpVN3ByaHJJNW1yRWZTa3BYY1BtUDBoYkIyNUZS?=
 =?utf-8?B?R3dTYWw0ZjlCdndMd3RsdG5NQUFQVzBiVURYVDZucTJkbVJ1cW9WYkNJbVNO?=
 =?utf-8?B?aEs1UXZQYk44WElFU0F6dDBDK2NkV2xRQURWdW5LUWdjU3JIdEJsMUo0Q05H?=
 =?utf-8?B?N2ZFenZSUFdrZ0RaN0xCU25GK0hiQzFFZ1VRSTRTVUhrRHJGN0s1b215U1Iy?=
 =?utf-8?B?eDBROUQzb1QyT1NDV2JPSStaQjhLSHU3SEVVSFkwTkxQU0R2RzVTQ0dtZWdD?=
 =?utf-8?B?S2tPbGtSZ2FUSUZQME5qOTErcFFJdFlWL0FpOW9RMVhzZWZHTTFDemhVVGls?=
 =?utf-8?B?UEFzZi9jQk5xS081a0pBbU15dWlwZjY5cHo3ZTVVbFo0ZWVLU3FVaFg1c2ly?=
 =?utf-8?B?UnlhYjRFS1E1NSs2KzFHbnRyOWZCSDJOQUFWQmlMY2NyU0VKYk53SWV3cmdk?=
 =?utf-8?B?SVM5MXRsWEg5Z2RnZ28xYXhqM1V2SkYxQ3YwNVlHUlBvVmNFTll2aExBMzNQ?=
 =?utf-8?Q?mo32VNP5nD7iPbQM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB86FB817E85AA4E84C6D11FA8547F2E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11355091-74e2-4bc9-083c-08da536224f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 08:43:41.8012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8dt0ch4db4iPucSIvA2YiogfpP8YBlVt4v+uCTXsbbnlLSmfSM6+ujIay/ICXUbrG+/7z3Z86WHMVI/HwCZT5Zn9IHUhjRaTVaxsL2J7ozU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5671

T24gMjEvMDYvMjAyMiAwODoyMywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gZGlmZiAtLWdpdCBh
L2U4MjAuYyBiL2U4MjAuYw0KPiBpbmRleCBhZDkxZTAwYi4uNDliMTY4NzggMTAwNjQ0DQo+IC0t
LSBhL2U4MjAuYw0KPiArKysgYi9lODIwLmMNCj4gQEAgLTI5LDYgKzI5LDM4IEBADQo+ICAjaW5j
bHVkZSA8bWluaS1vcy9lODIwLmg+DQo+ICAjaW5jbHVkZSA8eGVuL21lbW9yeS5oPg0KPiAgDQo+
ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBlODIwX2luaXRpYWxfcmVzZXJ2ZWRfcGZuczsNCj4gKw0K
PiArdW5zaWduZWQgbG9uZyBlODIwX2dldF9jdXJyZW50X3BhZ2VzKHZvaWQpDQo+ICt7DQo+ICsg
ICAgZG9taWRfdCBkb21pZCA9IERPTUlEX1NFTEY7DQo+ICsgICAgbG9uZyByZXQ7DQo+ICsNCj4g
KyAgICByZXQgPSBIWVBFUlZJU09SX21lbW9yeV9vcChYRU5NRU1fY3VycmVudF9yZXNlcnZhdGlv
biwgJmRvbWlkKTsNCj4gKyAgICBpZiAoIHJldCA8IDAgKQ0KPiArICAgIHsNCj4gKyAgICAgICAg
eHByaW50aygiY291bGQgbm90IGdldCBtZW1vcnkgc2l6ZVxuIik7DQoNCiVsZCByZXQNCg0KQWxz
bywgeHByaW50aygpIHZzIC4uLg0KDQo+ICsgICAgICAgIGRvX2V4aXQoKTsNCj4gKyAgICB9DQo+
ICsNCj4gKyAgICByZXR1cm4gcmV0IC0gZTgyMF9pbml0aWFsX3Jlc2VydmVkX3BmbnM7DQo+ICt9
DQo+ICsNCj4gK3Vuc2lnbmVkIGxvbmcgZTgyMF9nZXRfbWF4X3BhZ2VzKHZvaWQpDQo+ICt7DQo+
ICsgICAgZG9taWRfdCBkb21pZCA9IERPTUlEX1NFTEY7DQo+ICsgICAgbG9uZyByZXQ7DQo+ICsN
Cj4gKyAgICByZXQgPSBIWVBFUlZJU09SX21lbW9yeV9vcChYRU5NRU1fbWF4aW11bV9yZXNlcnZh
dGlvbiwgJmRvbWlkKTsNCj4gKyAgICBpZiAoIHJldCA8IDAgKQ0KPiArICAgIHsNCj4gKyAgICAg
ICAgcHJpbnRrKCJDb3VsZCBub3QgZ2V0IG1heGltdW0gcGZuXG4iKTsNCg0KLi4uIHByaW50aygp
Pw0KDQpTaG91bGRuJ3QgdGhleSBib3RoIGJlIHByaW50aygpP8KgIENhbiBmaXggYm90aCBpc3N1
ZXMgb24gY29tbWl0Lg0KDQp+QW5kcmV3DQo=

