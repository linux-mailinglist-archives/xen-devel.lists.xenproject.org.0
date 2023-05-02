Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ACE6F454F
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528655.822097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptqGL-0003Qt-5N; Tue, 02 May 2023 13:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528655.822097; Tue, 02 May 2023 13:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptqGL-0003P0-2F; Tue, 02 May 2023 13:41:49 +0000
Received: by outflank-mailman (input) for mailman id 528655;
 Tue, 02 May 2023 13:41:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJpR=AX=citrix.com=prvs=4790f2855=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ptqGJ-0003Oi-8Q
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:41:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 135ae9a5-e8ef-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 15:41:45 +0200 (CEST)
Received: from mail-sn1nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 09:41:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6338.namprd03.prod.outlook.com (2603:10b6:806:1b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 13:41:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 13:41:31 +0000
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
X-Inumbo-ID: 135ae9a5-e8ef-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683034905;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lKAkKK7RUMeCbc4AD2x5SGJG49S6l7oPERFgFVGQoD4=;
  b=RH3L8AKwlHjJXH3fTPrWKBfXYfMfiheB6l0IQr142o7Ef9g9W1kd9PmG
   rOpTbu6PFBZ1f0qZbwDV5bkWMqJulhCFRkuR6sKHsn16BzQH7riOCQJt9
   k7FngAeq68b8mEoC3QDcGlfQTqQAw9MMxfuLHKgqn985DmVFfedAgM42N
   M=;
X-IronPort-RemoteIP: 104.47.57.42
X-IronPort-MID: 106903496
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YLOIWq7Dtrzt9L4Xi2w/CgxRtBbGchMFZxGqfqrLsTDasY5as4F+v
 mpJCmzVafmMZ2egedx3Ydy3pB9Q6MLWx95mGgJr/ngzHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0T5geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 sYfdgBQSi+6o827kO68Suxpo+omBZy+VG8fkikIITDxK98DGcqGeIOToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0otitABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpMReXjqq806LGV7ncKDh4wDlGAm/y0q1ThWP1na
 H0MvQN7+MDe82TuFLERRSaQp3qNsDYVVsJeF+B85Azl4qje7hudB2MEZiVcc9Fgv8gzLRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2lRSWSN9mSPSxloetRWu2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNzxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:s7ax1a8e25NgaOudALVuk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-Talos-CUID: 9a23:mfuE2W3bKdM+ukjX8DFrE7xfBfoiLE2A6EjpB2C1WTpuSLiQbHGV0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3A+mq4sQ+7Oy0ZUXCSnGgQDqCQf9xx5aeIU0o2q5A?=
 =?us-ascii?q?LmtPbNgNIeAaFyx3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="106903496"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItTglMvh1w0Z5CY60gA0QjjZDMOjVDrteeoYDqDrLmOpJ498surCDr1Pn4ewDExldSXVM3/5t6nPbwDr3QwepuTG2bI76WZGptKRGFOrB4LrSVmC2RYbZG0tOu2dkCuCY+J2RfmdyH2chYtNz+QxsuOVkckI0bIEvs7RTskA7W6mD66CiXu9VH+42EG/iVB9gHSkpcnNAkToGoJQ9e85CFnKlfZZiNGyt9q6FHCyA8vJ7QutIL1UN0YjmlsnXBt1VRV19KejFyLeXcGUo8RfMONMcQ59cJ7plaJQmNIyaIlX9an8mEbOj+pdKKJYbYrvHFLBvse7F0xQBpRJGPozGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKAkKK7RUMeCbc4AD2x5SGJG49S6l7oPERFgFVGQoD4=;
 b=KB3z/f5kxLQjZY/jVvgyShsigzMcuKKHuUERMR1ddyqdec+H8e6yy/l239XYV0HciJOtHT0iPKBRkjHUR8G2eEXikjJEvQMp3fp9PWRo4AvkaXzJD3GsZsDFzuqN3OcUXn2GIi+f1rlnAw8EpL+r2dhERKmJQnhMc+JLGD/GIenAFQ1edXJc6vwnyF41g+vafdrwODwC3PeownjGdkDvAC5VDPvWGyEPSRs0H6KH2x56F2ZCkQDQYkmcyJln6ZlFYLMDNZGjFOfZzX5aFsbpCxYmlYR8dxK/YGRQj36ctKZTzi1uyWY1nqM0Ei7TvULTKlg0SNP3xzGVeCASJGdu6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKAkKK7RUMeCbc4AD2x5SGJG49S6l7oPERFgFVGQoD4=;
 b=nNE2IflHMCFcG/t+AaESVLnRct7OqRRHGH+2V9seOzGNoCN0SwV9MMFLBEopuBP0qnoTrfz/VH+0fIvcJmngFYUXWayPWrjXpVM6jxz9agsG7UlgzeWZXzbRE28pD9VHwMiyehxkGR85/oAhoFfYT8YSnX2r474sRQJyejlbXxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bb07dd8a-598a-564c-3dbd-457e982fd5d0@citrix.com>
Date: Tue, 2 May 2023 14:41:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: HAS_CC_CET_IBT misdetected
Content-Language: en-GB
To: Olaf Hering <olaf@aepfle.de>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20230502074853.7cd10ee3.olaf@aepfle.de>
 <43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
 <20230502133313.2192eb99.olaf@aepfle.de>
 <20230502140444.1dacdb33.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230502140444.1dacdb33.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0204.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4bd495-ecbb-488b-8c38-08db4b12efb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TB5yhIKEPrLF4PaxMo8jcPd/qxsI7oiYaNRuUB24yd/tLNgTy4FQzNrbI8r0qS4kSOnYqclIp8JBVLEjNlwr3csDdKytI33JOUvREPLMeSAf1x2W8djcWiZyPAo4tGGTNK+JgbUt3ym89fNpaSSzl4ERBryAg/OZYxP9Joa3O/05HowLHHGhCyBx8Vpq9+rXmTs/tXGQt+gVKx+FwYDow3fyq/+GmQzc60PoDO5WBPLwgRjvwRR0cBFQwwj61Damp7hw88SWfW+3owK4Zv2CMg2CNCKca5yeOYQycotyc95jrQEknmd1liRYsvdsuoRGyQSqTZkxcmdLypAiN+jUpjAPAYe28qTLk2wfCIKU908FhEUfzK1Fz2VQhLsocTP+ExnTQPPpXlWe5sRL7BmL5lECGAbn8rDY3YIyMnUYWYED27i0FmfvVetR9sTfdimffVQcY/WqG34dPAUCHsPLUEPPmK4FXr7abfwF60rxv0d+QDknkBL8UuHdwSiCsChoxoZy0BoVLhuy0180vZcN7O/Uhe2bEwxr0saPNBy4xFmk779gm6aG8GFzit4ys5M4uuHhRbnaIjXn2B9VF6qYXi8kYxG75P+nvGDsJFKmXZF5/OpH4kAOcxLqNL0HqH7azKR/GFvC19xQ7P/2cvJMvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199021)(66946007)(66476007)(66556008)(82960400001)(316002)(4326008)(6486002)(478600001)(31696002)(110136005)(36756003)(966005)(86362001)(186003)(6666004)(53546011)(6506007)(6512007)(26005)(4744005)(5660300002)(2616005)(31686004)(83380400001)(38100700002)(7116003)(8676002)(8936002)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlNxaXplblIzRnN3RmJVYXBwVFcyN0M3VG5XaGU4cURyd3V4b2JjMklUWEY1?=
 =?utf-8?B?NFVMVkY4QzJ2KzlyaUtmM0VuQUR3dDljLyt0RmpXSXp3VUkwL1R6V2RUSjV5?=
 =?utf-8?B?U1JiZHVKSzE2ak1mcnN5YzJ3OW1aUWgydVZNaDVjV084WTBIemlpbFg3Zmsw?=
 =?utf-8?B?NENta3FaVkkyV01TeGVaMEZpWHJTZWtycEZ6L0Y4dTgrL2VRMjQ2ZGV3NEFE?=
 =?utf-8?B?NS8rOFVsM2J4NHlOODQyQnpLNjZDWmFPL2hFYnFjUDhCVmloa0dCSGZWQ3M2?=
 =?utf-8?B?YmpuZWhIQ0FpTUlGSWVzTkJyOCsxNGFTNWpkdlZyaEZOY21jYjZHcGszWkUz?=
 =?utf-8?B?SGdUMFJFaCtwaW9HYzFTMWlpVUtLaUVLbjBzSkN3aUloeU1ReTFwakg1d1Bq?=
 =?utf-8?B?NnRrN2hDTjd3RVpXT0hnN29PMnY4VkdyNUVyYTRnSDFOaHFSLzBZai94NDhL?=
 =?utf-8?B?TjcvWkFhWjVzRXdhRzdvYjNQdFpFWmJlcnRWNjdDeVJFSi84ZGJWWmVEVWFp?=
 =?utf-8?B?R1h6TUlRR1FOZDNsMVlxNXJDSHNTMUdBckl6Rmp4NnhuOS9NMDFMbnZMbUhR?=
 =?utf-8?B?eDBKdFZuek8vaEx0Z3R2bmVDRU5QMmsrS0QzNGwzbEV1VnY3ZzVETFVrbDhh?=
 =?utf-8?B?eHhpaktFNnRtanhvYS9GNzlvMFJieitPTkpQQzZMNDlMK3hISEljeVN4VXk5?=
 =?utf-8?B?Tjh1Vk5QM0dTaTFXS1BvLzk1QlVhYmVTZ3lpUEVJbkhtdlp5aURIcUpOb2hQ?=
 =?utf-8?B?RnpsdTJvUHREdlZCZFM4RFhudlV5aE4yQ0xvTFVsNzNOVk9nOVNObW1pYUV1?=
 =?utf-8?B?Yzh4MEhkM2diaVF5KytHUGxtVFZUYnlWZ2JYMTZveUF0TndzcGRsV3dWWFds?=
 =?utf-8?B?R2hoMHVzQjVtMjVKY0NZV3lhN2lXTFBwdnBsZ0U1ZmIzbGlGT0s0QWI2SmNH?=
 =?utf-8?B?STlMRmdmTlNEb1hQeGpyMHp6N084RzFQVUdYeW5sNVZGL2N3bjgrbHFkRmNz?=
 =?utf-8?B?Y1puUGpNUmxMZDZpUDVSL1dQRC9oUWN1eFdlT2R0U0xURVlRdXNxNWFpVkJW?=
 =?utf-8?B?cXRCbS91dHh2MExxT2tYcDdYck54bGVEcDdxN0V6dHk1KzU2Z0QxYXFZamlB?=
 =?utf-8?B?aWc0eWQ2d29KOUVmSlRzSkJRK3RYYWFuaThwcm5EUmI2YldSSjhCSXBDRWx1?=
 =?utf-8?B?TlJQUWhKRGdxZysyS3pieFlEU2g0bVMxVno3QUprVTJsMjdvOXEybUI4SVph?=
 =?utf-8?B?cjM0Rm1pMnk0ejBZc3hvVDN3eXJWd0JoMW5zWWltRzAyWUd4bkxYMzRBaWhO?=
 =?utf-8?B?Q2FMek1RbEp3WTJ5alljRHRmN0E1cFgvZUZ0cWMyckYvN3hxWnNDMzYxblY1?=
 =?utf-8?B?SHc2MXpNaGNDMFNVWDlVdTFXUnM0QjVRM01VcmRMdGlsSjJ5aDdSRCt1R2JT?=
 =?utf-8?B?Y0JNZG5tQ21pYWIyY293eTVDQ0dubElCdCtFeXhoSkdqT2Z5Sm04TklvcFRC?=
 =?utf-8?B?VGEvcnpPTE9VaXBhejNoMnYwOGszWDNRMC9WSTlhSzhrOWY0clFSWHc3R0lH?=
 =?utf-8?B?cGFYdWM4TFB1SHNKSENlNUx2OTFGRzF1VWowWTJNdlFYWk5BUGpGWk5UaGpv?=
 =?utf-8?B?NE9VVitNTFpVWmtENTR6ZGtxZ1h3dGpEMWo4S2FnaHpZeVo1ZndGd0RleWZX?=
 =?utf-8?B?d1IxWG1qY1A4U3p4bS9hQ29rcmFaVHJpdTFOb21uaUl6NXo3RWpxVEdiaURz?=
 =?utf-8?B?bSs1dG4walJ0d2gzYjZiMlRjZXIxbGxYUGNiYUFtR3lQa0R6REJ1NHBxdmdl?=
 =?utf-8?B?dVVTdEtWYjZyTVNYVUJiVFZveW5JN05UTDd2S2pIZzZiejdnNEJHU0NyWW1X?=
 =?utf-8?B?MkhwNVQ5RHZuQlEvY2x1OFpvUitVbWhHK3dhM1llbnJOOFpOMXpFbnZFNktM?=
 =?utf-8?B?NHZxc0h5QzRYTW41Q293c2t0M1h4Y3Z6clV2YXY1Z0xsajFTc2R0Wm5GSUxn?=
 =?utf-8?B?SzVKc0x3NktTLzFua01ZRnVyWm5OejFRWGxxUGx1QVNuSjRYb2NwaGpDSGMz?=
 =?utf-8?B?c1VLcTlZckhFaGhBS3BzMlc4Q2hXbC9xdmloaWtOcVR3anFTMlE3V21DaGtB?=
 =?utf-8?B?VUJZeUdSb0J3RlZXOHlsRGRsMzhFQ2xORnBRV09sTDVXdnNkRW9lTkVic0l6?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uRO9EuvQYu42DO6y07pantXZN/4Azqe3rl0k9wt+YYXJFU1MosxyTvOndg+JnQ/6XpZFX3dyxn7iI6KP33JgJf4hROpgFXq+rMf+fnevTDh688wfkUTjkHQNgw3EtdZGaiNaaP+PcFGrxxpgyZUt6jSk1WHKpB/kiHY05XhYSDwfj/tFKHZ3XdUED80cmt87ixLwdYMgXkMv+tWnjdoCmwc+EmOQZqIRiLxDxY7mDImwHd3Fak8z4C4rQb6ouVdBMVVNY6nkP+R50YWQywA+OQKXvOQtRG8YClfm3Meadf91lBuH9jzTUuhnBUK27FvK8Hxtzaza7/wnAoqxlWWTLAi3zEq0JBVvKy7glNZVb/iwQ3iDknW7sGlXYBpABtcIxy1qnIMiU8odQGCQzYPmTD7tBxAoqW7CZDSf0O5NON2Y7KaTqA3mwJ3lQJRQw1/+2+pvWptTKssFw/An061C8NLuCmrn0ewhnIA0reAtkYZ8SoT/VHIQ1RZOdkEk9r0p1ud7HtRyWaCpt7XleNq7W++yBvUVhRJNQWimIj3azs+ex/Td+pLyK6zMn4iHn1c4lrC9e5PbudLNX+s9EF1TE4h2mBdH90t91d9G2JcppCgsQ8Zjp/IEx/LL3hFEz2lBkGX20SowTVlFICC/bq2IzpUsq8iHKHa0Hw6bF5JRZjfLUaikoI5k9vcFo8v1y2VfbyED2kL3I9dsFYO6Qfw+D5v2qOqPcHUj6M8hcLj+L7l6jlgF9cxqpG/siGL1uoReZfeqvjfXArZ7ZwUke91ZondP9b2C8vRrT2ykMYUrsGgO6SwGf68i/BOSNAtek/GBc0y+ngNp5hvX9Hc9SJU7iQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4bd495-ecbb-488b-8c38-08db4b12efb7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 13:41:31.0566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVRFQCzvJ4/cdJCs36ZA75p8H0Xt9j+j40Pm1HOI7wtC8cDSfoslalox+Cz/4gkIhUa9m36zFQdbI4duQGHkKa/p450civsQLzHBIzif1rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6338

On 02/05/2023 1:04 pm, Olaf Hering wrote:
> Tue, 2 May 2023 13:33:13 +0200 Olaf Hering <olaf@aepfle.de>:
>
>> I will investigate why it failed to build for me.
> This happens if one builds first with the Tumbleweed container, and later with the Leap container, without a 'git clean -dffx' in between.
>
> Is there a way to invalidate everything if the toolchain changes?

I thought we had a fix for this.  But it turns out it's still on the list.

https://lore.kernel.org/xen-devel/20230320152836.43205-1-anthony.perard@citrix.com/

Does this improve things for you?

~Andrew

