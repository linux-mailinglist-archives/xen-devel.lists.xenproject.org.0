Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D6570FD69
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 20:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539189.839828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1sp3-00030M-JJ; Wed, 24 May 2023 18:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539189.839828; Wed, 24 May 2023 18:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1sp3-0002ym-G8; Wed, 24 May 2023 18:02:53 +0000
Received: by outflank-mailman (input) for mailman id 539189;
 Wed, 24 May 2023 18:02:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1sp2-0002yg-1G
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 18:02:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 307917fa-fa5d-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 20:02:48 +0200 (CEST)
Received: from mail-sn1nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2023 14:02:37 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5455.namprd03.prod.outlook.com (2603:10b6:a03:27b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 18:02:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 18:02:34 +0000
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
X-Inumbo-ID: 307917fa-fa5d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684951369;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xDsCvtKw1mTi6RlMB4xNQopAra+GhXeWUpQjfMJbFYs=;
  b=iAr5De+iXvBeYd1yD1X05Jb8mT6b8rvzle+oE+KQ+JcnFXH+hQmVyjoO
   Ni/C1rGg3h8kFKdtwQgLMg5L77NbXqAvA9CWiPA/WCNQXezbDbMh+Bbpt
   q9sgc0E4ZV1cpQLbOOfEoBbeHYfiB9kq3olFYpLSIrhEQTqGzKH0CzKgx
   c=;
X-IronPort-RemoteIP: 104.47.57.48
X-IronPort-MID: 112734452
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VgcPz6qs3dLOvwQj1Mmnox1cO/peBmI1ZBIvgKrLsJaIsI4StFCzt
 garIBmHO6yONGLxeop3YYu/pExXsZPRn9RmQQM9/ClmFC8U+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzSVNUPrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACk0VRG/hPKS+pKEdNcvnJUNdMz7bIxK7xmMzRmBZRonabbqZv2QoOR+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeerbIq9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThrKEx3AHOnAT/DjUvWFeYqOayoHWzXukFB
 34JpRUL/KctoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2lRSWSN9mSPSxloetRWG2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNzBJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:gIrHjK5Bl4cWMO+D6APXwB3XdLJyesId70hD6qkRc202TiX8ra
 vCoB1173PJYVoqN03I4OrwRpVoIkmslqKdg7NxAV74ZniChILAFugLh7cKqAeBJ8SRzIBgPK
 1bAs9D4PqZNykC/L6Km3jDL/8QhPqi+KCsify29QYQcegTUdAc0++mYjzrdHGffGF9dOUE/T
 Gnl7t6Tn6bCBAqUvg=
X-Talos-CUID: 9a23:uXmTrmFaBvU/UteFqmJ+zXUVJsM1Vkf980nuYFXpJz5sWO2aHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AnTSmKw8niZ1qlR7Pn+cLvoaQf/5l74enF0snqpg?=
 =?us-ascii?q?DgJOoBzEvBBLMgyviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,190,1681185600"; 
   d="scan'208";a="112734452"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B45wa7jpv+U7e5znz1+nU4KjcxHEQYxyW+wQX+nD3kUfIANTbBS/FQk0tZvKCVV3ETzPBGTYp2D6V6ctFQeI7yjaVcv8mjnHAiUd6ZOR1tZ8TBozKzks/ZhDKEAv1sOvHKbc/psXiq0RRaSI/Fv9s1Jj1W8cDoZqG8SZ0GzIpb8W4U7omZM0DzK/F3xZEZHp6EkkgcSf2ss96FvM3e/c4HTCRTnf9OFczgxtwf/y2I4K62EF6Dr6ME77HLrpNJTD0oj57eY75jGVI0EJ3kBeWE5eB1q82/GQoXJ5qkhSF6Z/sPmN14ImUkI/SgoVeRWxH6iEqrAwRWRWbZ5D4ktsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSiAbTh2PNbUv+gThcrq3U54/n6URbmXwcG5TAo5UDg=;
 b=Ep+I2cZOcHZEBa0rP5n9jdFl66fRLvIkgOvFRSEXAnXLFA8HW0m+85dEYOEWRVGThqU54yArzS/zFUHkSxWdCzuqUlqWkW0IuZ11T6yNYjYAmM825I/rCL1N/7JU3xBlEsOK7klXgR8L0vzMBVg3JV1AS11p1hvzb9VdDjbHKgumpYvUlZwM3ubP+WSV4sW0vScFowEr5Q3H91Tq/s8VUkPXodaPOOzJsXPsVvrOibWNat9dzBrsiyC6KCDFGsCp9dkyC8VSDhUgHOtKn1vUy5lVUMtY2mwCevAN/wBdf+xSX38Yh+jA6oLKyKFh1RmGBSLTQ7HoT7taVAwqmIoqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSiAbTh2PNbUv+gThcrq3U54/n6URbmXwcG5TAo5UDg=;
 b=mM0ZSrOoT7ROmslesC9xvY8DNmMxjzCsltXn71Rv579XYv7YJI9ukUq1oMom88tmsUeP/8eee/KEMXIpnILNacVNaD4xOwI4fAILzu15ek5Dq3sU4uZbSvf0s4r2AT53lkA7C4pQGencY44xR0EDkTKaeJm7PsvB/xot5jhsgmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b321009e-db23-19eb-e94f-41eea8ec3bc8@citrix.com>
Date: Wed, 24 May 2023 19:02:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 03/10] x86/cpu-policy: Infrastructure for MSR_ARCH_CAPS
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
 <20230524112526.3475200-4-andrew.cooper3@citrix.com>
 <c144bf13-9e65-483a-6887-9bd8645f25b8@suse.com>
In-Reply-To: <c144bf13-9e65-483a-6887-9bd8645f25b8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ca9afb-5f12-4c3e-6861-08db5c810ce6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	77G0BGBTPqYHOsUNL9cXDuoPPN3iUN47zgQocsq2PQxR16bKmdDcyUEyYPwBZoQTE1/Xin7sDION0L3P7oEh1JTCsrz74dnvbqfLqJFc6Sihw0pIOpFxc07bVW/B6aC7ElXLED4Nsk7S3ozFJ+gYsFKXPhVrJ9XvFz9o2+vMXep8HDSZLnt2/ufZS9FYuhaFHIKVVfgf/Y7ObEiwJVHIOKl+M/J42qHuTyO1zO8A6ySLtjPDozWvsCdxlBsAB+BjpMugJquCNKztaHAnEkXoAti4M/venPCsYiwfqL1/8y7k+qWOD5l7KEx3jvYCVdado45FuebKfM26hH/cnWjn7+Ox69zo6ZOnq9M6ibHQYsTLuNdCgzdkT3wXUjL/1+L/JwmKtZn/316IivVu4ITPmGOHPK/LP15NwUzWnhLvQiZrwOSo6iiWxU9b2qaKx9RSr4XGNK15+p8aeUHu4aAp1Gu9CQ+gfWvAFm43JPZGj3SlPz9P/oYh6B2BX0ubizLcNlFaupkXJlMf1g6Mb0KQvLrDQVdkMfyaFKukKMXBfDlt+o9X+gPP3hYKCj4fWe2gZyzwaSx3iQgYiBL7ztRepP736NwZHS6l4fOIOb1pEGE1LRGvERT9uB3H5S2HTV+vSQWZLLV8x3GR4SKzuRlndQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(82960400001)(6512007)(6506007)(26005)(186003)(53546011)(38100700002)(2616005)(36756003)(83380400001)(2906002)(6486002)(41300700001)(54906003)(316002)(6666004)(31696002)(31686004)(66476007)(66556008)(66946007)(6916009)(4326008)(86362001)(8676002)(8936002)(5660300002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djBVTVNQMlF3Ukk0OEdKMWsxaUx3U3lXQXhMSXNHUVMwa21HWEtSKzZWR1RG?=
 =?utf-8?B?Snk1eVFrcG45WWRubTlXZ3hFOHUvTTdFZ2ZkVE02Ym5VenFLdmJiWXVXT015?=
 =?utf-8?B?bEhwck80Yzd6a3M0MG5xRDZ2Q0lpaE5FOWdGbXp0cHM5aUlyeTVpdVZmUkxX?=
 =?utf-8?B?YWNPQlZaSXo4N2dBZGk0TVZaS3ArV3JyMTFjenJzVGlWQXAvSng2VkdXMytN?=
 =?utf-8?B?T3ZzS2Fldy9GaEo4OEgrM1pMcGhBVC9qakd3M2Q3L2xDNmcvcGdMWlV0akVh?=
 =?utf-8?B?M0VxVkgxNW5pc29RaXNIdU43azROUlhNMHEwNlhMUnBMRFRKdWhRc2NHWldl?=
 =?utf-8?B?RnVldVdPMXRzQ3hOQkRicTBzbVVzZ3I2TVZyUTRyYmdueUFnZSt0OWNjaWwx?=
 =?utf-8?B?b0lvRkllZ1VwcXhkYkFaVEhxZHhyNnljZFJEZWFKN1BUVXZaVVZjY1FBT2FM?=
 =?utf-8?B?TVRQMS96S3hqMldoM3VlTk42em1pMnVEbUVHTmg4SlJVdnlsTFpLK1VhM282?=
 =?utf-8?B?T0lPRVZsMXFUVVNhRUJ3RTV4WkdTUk9KUGg1cTN1OHlTT3p4SDd2RkdBRHlR?=
 =?utf-8?B?ZmRtYjdmUGVQRkk5TldMT2tneTQ4eXJRUTk5YkVYT2VVOVBLTzFSY2JRaHNH?=
 =?utf-8?B?bDI1azArSm0xcXI4RlJlQlpuRy9OOHM4QlZuNk5sNjBNZlkzenM3VFA5czJP?=
 =?utf-8?B?UHFGTVc0VjM1SEdsMXM4NDNla0JxZHdzL2pKYllQbEI3dVAvV1ByQ00rNkRj?=
 =?utf-8?B?d3o0bmNlNU9ZL0NnOGtSRnI5YTN4R0MzanhzRWFVdnhzbEpBaW0vY0l3QXRr?=
 =?utf-8?B?ZExtQytGTVA3a004NDdzUkJwM1RCcktCOU9WV1ByandFNEhDdmErZ0ZtYTNs?=
 =?utf-8?B?bEFHL3J3aU93RHh0ZW5HbTlNYi9LQlJTbThRWTVid0dReExxdzRUVFRzaGJV?=
 =?utf-8?B?YkIxaWlFMnVaWjVyWXRSaFBmSGgrTHBWcnZPcU9FMk1meERBeWJkbUxvS0hs?=
 =?utf-8?B?T2JzR2k2d2xkOUI1cVhFdUQyaCtTdklkZStNZHlSbGRTTVJDYUFjQkU1MjJs?=
 =?utf-8?B?dlNRbEorUDE2aXdYUmVBcGVQWHltaEQyYnNMVnBGeDJzZGJZSU9wWitBU0RS?=
 =?utf-8?B?Z1NuS1RpL3FlNGYzNzhmc0h3Q2tEZ1Q1SU41bG43QTZkbDdBZUhmOW5JMFZw?=
 =?utf-8?B?bHhkcG1tbGlUeGJTZGVsMzJKYzdPaE04dGV3ckhYUGpuTlVaWGpESDZaSVdM?=
 =?utf-8?B?dTBwSjlvZkdlQm42emh1RHBVT1lUWjE5RXNXeDRIZU1yN1RkSFkrVkZML0hF?=
 =?utf-8?B?dVUreGlCWHY2UkZDbXJLYUFJUnVHWm9xQjVhU1o3OXBUa003S252T3lYM2I5?=
 =?utf-8?B?R3FLYTVVUUcwOUVWOW8wVU5hbDJyYjhrTHpVSG03L3Y3cGwxdWxVYlRPdWtQ?=
 =?utf-8?B?WWF3RWFWcEN5MVhnU29RU3ZNOGtQRWNhZkh1UmdRMUxoQXlyRU95Y0RHRHcv?=
 =?utf-8?B?MjB3TDFWY1JKWS9PR2VFQUFzdnhBS2VDbUdxbzd6Tk9jcHhINHJjYWVmeXk4?=
 =?utf-8?B?c2NpL0E1cnMxUWh6NXBYaG0wRjNXVDBSQ2lubFd5N1dwUmJ6NjJxZndHZWlK?=
 =?utf-8?B?bTRvVjdXdFJ2SGx1MGttSnVEZ0xOT1EwWGQ0OUhVcWFuejY1UlF3cFRuLzEv?=
 =?utf-8?B?L0pZY003YytsOFBiV3NOTUFMQVNTaUt3eFlkd3g0S2t4RzYveVFYMHR2cThq?=
 =?utf-8?B?eXF5L1BtQ3lEbXNwNWNiekEwNUdjUkUyVU5Db0tpeGtER2tHRXJpYjJ0SUFK?=
 =?utf-8?B?TXNsZG1BUmVpRVduSEhaZnhyWno3bkdleWFEMHpHVXFYVjFZd25KMVFhc0xz?=
 =?utf-8?B?N1FmclYwSDlMUENxR2Fzb0VlRGVndVFQek9TL2c3ZjA4eWppdWhGT1FjanN6?=
 =?utf-8?B?NkJSeTJkUWZhMHV0QnArL0JCNndHMmJyTDdvY0RKNVlCK3M2WG5GNk1GNjdi?=
 =?utf-8?B?WU5YWExlakFHR05xeG9YMUplcVVJRWlvQWpDTVlOaVNyNjZrM1NsR1AwSjVr?=
 =?utf-8?B?SUROWU0wdWdMWTd1bHFSVXJMbFR1dkxHUjJCL29NeTFqU2JtM2xFc0tGN3Vo?=
 =?utf-8?B?SlpvTGpuZ3RpQUhyM041ZU9IYUdiaFoyMEQvZGRBZHc3NEx6WHEvc2NuVm9w?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ef+VB/ZO5nPVFtc+Y/sBvtY0M6EbwrfzBa2UQ05NL/PChp/vh7wpoKRAfIJCnn7/1ngOfC6cKLKWtm4d61duyUkDaPH7gGJUPE0vIbBt78dAbwL/uXIazKJ8OjTO8KqINIdgUYw/PcVOUV2KnPjoSTYgAP1Bx2WRMFLXkARm32g1GnU9iQF+9JGP4VqPiwQSaWNDURktJnbFAdk3dJ6FO73ve/tnKLUYCnz01AKP/jzLdXhO8W9G6DjYSno0FGxITGLl84aNU0hclwF78J351ITQukN9CAlu5vEe07yeEpfdsVY7IVeqkb1p72ffnxiEiB1OGO+UnuIcA/PMGgXvbj32qENHr8kXL1EZ7u/pEPl6M0LkXq4S8sZV8ddaXa9j+dbSEsXCjZPEdB5I4h9aJ1vScZWrXfzhoFnpy7s/L2OPYk+6Y2WsvVJERqYckhcvaR7rz+DUpTt8SR4OHBDmFlYCi1Xkqelml+PB37rjgxQQWst+As3NCR6owU0IP6FEa7j6uoIUj9pXUA2Y2khvo+4zijZe3Razr+1J3dw0ZAf04U1gNaUfrOGBFBPD3oOydVXP6OIaqjESQ4smD+4NWx3HTjo393kks8Qv64IT0h+I901VKkVMmDaMrJBx+pZrbevYAJ/zHmUFTjjz7rb3Ge/K3q4x+iZIJqQXWgoI40JFdintHl9+1D10ItztKqL3KUH5Hi80HnTbNZdDVZjCIfQ074saI1z0TPnBJ2Objdbid1BM07wN63b6/4GevBwnSoUCzt/P5KidsBCQLqC9gvM8hSNF39k4lBECOWiRiJF/urp1F4Px9JAVQHHkKsax
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ca9afb-5f12-4c3e-6861-08db5c810ce6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 18:02:34.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sdb7ZQCdgGlSEEEHPMjxL+YteYzwYIxJcs635BXiqQ57iUcIX4GDn1Uayz2+1DXzUWx8NJq0Sj5wWkEVXuLDX82QON0OMk4+BFjgScfUZsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5455

On 24/05/2023 3:53 pm, Jan Beulich wrote:
> On 24.05.2023 13:25, Andrew Cooper wrote:
>> Bits through 24 are already defined, meaning that we're not far off needing
>> the second word.  Put both in right away.
>>
>> As both halves are present now, the arch_caps field is full width.  Adjust the
>> unit test, which notices.
>>
>> The bool bitfield names in the arch_caps union are unused, and somewhat out of
>> date.  They'll shortly be automatically generated.
>>
>> Add CPUID and MSR prefixes to the ./xen-cpuid verbose output, now that there
>> are a mix of the two.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks,

> albeit ...
>
>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -226,31 +226,41 @@ static const char *const str_7d2[32] =
>>      [ 4] = "bhi-ctrl",      [ 5] = "mcdt-no",
>>  };
>>  
>> +static const char *const str_10Al[32] =
>> +{
>> +};
>> +
>> +static const char *const str_10Ah[32] =
>> +{
>> +};
>> +
>>  static const struct {
>>      const char *name;
>>      const char *abbr;
>>      const char *const *strs;
>>  } decodes[] =
>>  {
>> -    { "0x00000001.edx",   "1d",  str_1d },
>> -    { "0x00000001.ecx",   "1c",  str_1c },
>> -    { "0x80000001.edx",   "e1d", str_e1d },
>> -    { "0x80000001.ecx",   "e1c", str_e1c },
>> -    { "0x0000000d:1.eax", "Da1", str_Da1 },
>> -    { "0x00000007:0.ebx", "7b0", str_7b0 },
>> -    { "0x00000007:0.ecx", "7c0", str_7c0 },
>> -    { "0x80000007.edx",   "e7d", str_e7d },
>> -    { "0x80000008.ebx",   "e8b", str_e8b },
>> -    { "0x00000007:0.edx", "7d0", str_7d0 },
>> -    { "0x00000007:1.eax", "7a1", str_7a1 },
>> -    { "0x80000021.eax",  "e21a", str_e21a },
>> -    { "0x00000007:1.ebx", "7b1", str_7b1 },
>> -    { "0x00000007:2.edx", "7d2", str_7d2 },
>> -    { "0x00000007:1.ecx", "7c1", str_7c1 },
>> -    { "0x00000007:1.edx", "7d1", str_7d1 },
>> +    { "CPUID 0x00000001.edx",        "1d", str_1d },
>> +    { "CPUID 0x00000001.ecx",        "1c", str_1c },
>> +    { "CPUID 0x80000001.edx",       "e1d", str_e1d },
>> +    { "CPUID 0x80000001.ecx",       "e1c", str_e1c },
>> +    { "CPUID 0x0000000d:1.eax",     "Da1", str_Da1 },
>> +    { "CPUID 0x00000007:0.ebx",     "7b0", str_7b0 },
>> +    { "CPUID 0x00000007:0.ecx",     "7c0", str_7c0 },
>> +    { "CPUID 0x80000007.edx",       "e7d", str_e7d },
>> +    { "CPUID 0x80000008.ebx",       "e8b", str_e8b },
>> +    { "CPUID 0x00000007:0.edx",     "7d0", str_7d0 },
>> +    { "CPUID 0x00000007:1.eax",     "7a1", str_7a1 },
>> +    { "CPUID 0x80000021.eax",      "e21a", str_e21a },
>> +    { "CPUID 0x00000007:1.ebx",     "7b1", str_7b1 },
>> +    { "CPUID 0x00000007:2.edx",     "7d2", str_7d2 },
>> +    { "CPUID 0x00000007:1.ecx",     "7c1", str_7c1 },
>> +    { "CPUID 0x00000007:1.edx",     "7d1", str_7d1 },
> ... I'm not really happy about this added verbosity. In a tool of this
> name, I think it's pretty clear that unadorned names are CPUID stuff.

You might make the connection, but it's unreasonable to expect the same
of everyone else.  This is used by end users.

If nothing else, the name of the binary is made stale by this change.

>> +    { "MSR   0x0000010a.lo",      "m10Al", str_10Al },
>> +    { "MSR   0x0000010a.hi",      "m10Ah", str_10Ah },
> Once we gain a few more MSRs, I'm afraid the raw numbers aren't going
> to be very useful. As vaguely suggested before, how about
>
>     { "MSR_ARCH_CAPS.lo",      "m10Al", str_10Al },
>     { "MSR_ARCH_CAPS.hi",      "m10Ah", str_10Ah },
>
> ?

I've done this.  I remain to be convinced, but it probably is nicer for
people who don't know the MSR indices like I do.

~Andrew

