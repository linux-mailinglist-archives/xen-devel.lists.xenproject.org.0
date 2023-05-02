Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFD86F47D6
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 17:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528736.822257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptsOJ-0000xO-3E; Tue, 02 May 2023 15:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528736.822257; Tue, 02 May 2023 15:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptsOI-0000uC-WB; Tue, 02 May 2023 15:58:10 +0000
Received: by outflank-mailman (input) for mailman id 528736;
 Tue, 02 May 2023 15:58:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptsOH-0000u6-Gd
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 15:58:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 201eb7ae-e902-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 17:58:07 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 11:58:04 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6498.namprd03.prod.outlook.com (2603:10b6:806:1c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 15:58:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 15:58:00 +0000
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
X-Inumbo-ID: 201eb7ae-e902-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683043087;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=VKhzaoHzMpkPI2oR0wG+B/3Pp4LdVNlAg8bUSXN0pJ0=;
  b=gwerr6cexusN8GPWctBfh5FzBp6x3ylsDBqCXFyqpwVg62oRb26kM29G
   tDEgB+KeedChZU3vGWWd+2FYNVXn6y7Y2xqi4zFkdZARku/ZF3dpaLvEi
   7dEoDd+dZDzP764j6eTTQcT+31moiYBkmAnMBCufAnJirOCWIWBkR5X5+
   E=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 108008988
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7FKgqqo7gnbY1C1D+urO8uX5ByBeBmLAZBIvgKrLsJaIsI4StFCzt
 garIBnVbvjZYDb2L9Aia9/j9UpT65bWndFlSFRsrypnQyNE8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weDzyNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABIEcCCfpPOT+6i6FOpvuOIMLNvBGapK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKNEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpCTOXop6466LGV7lIVLBoTaXuUmqSat2iwYslPK
 RRL1DV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0SiYtz
 UShhM7yCHpkt7j9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLiIY3gxHUR9BvCpmpn8b1EjH9x
 TONhCUmjrBVhskOv42y7VrAjhqvq4LPQwpz6ga/Y46+xgZwZYrga4n271HetK5ENNzAFgHHu
 2UYkc+D6uxIFYuKiCGGXOQKGveu+uqBNzrfx1VoGvHN6giQxpJqRqgIiBkWGaujGpxslePBC
 KMLhT5s2Q==
IronPort-HdrOrdr: A9a23:6xcJG6t5EXH8F1FhSsRe4IlT7skCF4Aji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YaT0EcMqyNMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPHxXgspbnmNE42igYy9LrF4sP+tCKH
 PQ3Lswm9LmEk5nHviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeF+aP3CB+R2zYZSndqza05+W
 bIvgTl7uH72svLgCP05iv21dB7idHhwtxMCIiljdUUECzljkKFdZlsQLqLuREyuaWK5EwxmN
 fBjh88N4BY6m/XfEuyvRzxsjOQmwoG2jvH8xu1kHHjqcv2SHYTDNdAv5tQdl/851A7tN9x/a
 pX1ybB3qAnRS/orWDY3ZzlRhtqnk27rT4LlvMStWVWVc87ZKVKpYIS0UtJGNMrHT786qogDO
 5yZfusrcp+QBe/VTT0r2NvyNujUjAaGQqHeFELvoiv3z1fjBlCvj4l7f1auk1F2IM2SpFC6e
 iBGL9vjqtyQsgfar84LPsdQOOsY1a9Dy7kASa3GxDKBasHM3XCp9rc+7Mu/tynf5QO0d8bhI
 nBalVFrmQ/EnieRvFm5Kc7siwlfV/NHggEkqplltpEU/zHNfbW2BS4ORETe5DKmYRbPiXZM8
 zDSq6+TcWTaVcGIrw5rjEWa6MiVkX2b/dlxOrTe2j+1v4jebeawdDzQbL0GIfHNwoCdyfWPk
 YjNQKDV/moqHrbF0PFvA==
X-Talos-CUID: 9a23:L42GzG/Zg9W9tYnDPX6Vv2wdBPA5UWz4923RfUy7N0BGSK+/bHbFrQ==
X-Talos-MUID: 9a23:YJ+q+QlxQOhbxWGimefsdnpcMuNv5piOJ3tQsqggtfCfJS4oZBmC2WE=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="108008988"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lo8U/uUvEB2ha2pgKN9vjq0+YRDvxQZVObgj6yJiMjJGwAvBarm+m9xtTOOi1JPhIUJJ/BXiNHofuaH74vKDaOKD2nB2nMN13Q+B6COn/bFnjiqCP7AtGnWdno6wWW49s72hNeRUB+0bA2bKTGTMdVWdAaA3FOVbpi39n7bGg7AlIAK9gkUHZr1Ra1ZEwAjDtcli3s9Dw5yzAE0aOD0KRL5edgUNYMDcUgU0FhsCBp7SLyalwsuxtZcfPxNH9yZnaMX8pvXEUFErg2li7Bk83SRdlc59bschA2zh2pXgPvlZZcVnsPPszxLFNCfE5hx8jPVqKT2bgbbgOd1qj/s+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QaIJbAvvaRh5Q90NiE5lmpweIBxxS9Nnf6nV7wK/SM=;
 b=d9fNLDW7+RpPR9dIp2ln/p3e6qODtN8CwUotzM3u51766kRzXux15W/oRUQm12ecxBTb8mgropqb19+xPP+HV9XEt0Y8lmCQk5ZDfFAX5GJW3HVzpgnWgRCCHKqNuMW0wZewLzABhFVGAOzq/sZwvNqEvaAp/4ReSzjA1AoCHYT/On7WFVL7aYNxskwBIxGvAwc6nNdPdVKu4SQ/Ed6lJxHkNKnE3m3/BPHGUL7NPeBxtBGCLJkZ2uOQ12c5xuavCyv3CR2L90NXnFy+aBEVae+6Wb6ueDRiNrqYOSHGXmPP4Lkvt32HDC5NDf1GRqgt3+mPnlFyO6xx00/5w/Jwyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QaIJbAvvaRh5Q90NiE5lmpweIBxxS9Nnf6nV7wK/SM=;
 b=ifWJ3IR985Qh0FmHNHWrEEvj0/y/LWC7L/bct0obu712Of20dmh8lyramXtdHWpVYw3sOpWZXhTt0XUPnrPQzh6/3ZK9T9DTBBsSVYMHLLofsXZZ86+uJr+C0p9V51r5bVlEBWggCrlWbpYG5kghW+CI0RixziqfPXN2D1kaqHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 May 2023 17:57:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com, sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com, axboe@kernel.dk
Subject: Re: [PATCH] xen/blkfront: Only check REQ_FUA for writes
Message-ID: <ZFEzAnOskzdb61O4@Air-de-Roger>
References: <20230426164005.2213139-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230426164005.2213139-1-ross.lagerwall@citrix.com>
X-ClientProxiedBy: LO4P265CA0153.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6498:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5dad1b-c9b4-4298-a16e-08db4b2600d2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G2YnfR7bHaOMhnzA5rW4sSzuvCAFc1PDplUnlznmaMEIe2j7GUFb0MeyzC+glt6Z44GPSXlyOTWpI9O2bukoSWhhfrm3uZG1jAjVKHzMi5nnGcJAq+zbEx26qgNfrjT8pelyT8kouZReq/YVz/NH3pEumwOt8cVIHbSaA9KbXM9qBhp3Yrd5i7M284ezSd/EIy61Pfeb1k6R4KTPABms9nMED4f4mJ0iQcHUTYoQJ/Wkdg45SHhpgwNH1FejZzLn0aekonK440HoP+RyLCkJ4dtpYbZlOeHXh9duLI0bg81cRLTqHkF7fGbxRMhGA1zDN3/I4zftWwTN5RZTCL3o1OlYHv119E/1IwORu42F7zPKOyEnVbYfxzUl3W3DWtK/RwBFAc5G6P2hoyR+kvnOo6Az83EHtjqkuxY4NyNomUFEK2Qt8nrRGLtAaO6sdp7+TgSllu0L8RXWdQgvKY6UnbIkq37RddzM/guEViwO/5RFNVfErT2RIHUPQQjZwlKwkJ+ea7MUk+fssnaSzIl3Z6tT1+25/35TZR1CRrbf83primg/LzlC9vlXKpKm3DGr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199021)(33716001)(83380400001)(85182001)(66946007)(66556008)(66476007)(38100700002)(41300700001)(82960400001)(4326008)(316002)(186003)(9686003)(6506007)(478600001)(6636002)(86362001)(6512007)(26005)(5660300002)(6862004)(8676002)(8936002)(2906002)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVBwS1Z6T1N4cm1lZnRvc0EyQW1hK1FpOHZJczUrVHFMRE1TbGNmbUE3aTFv?=
 =?utf-8?B?YWFUSWVCYlNsVDg4eDcrRWVkdGlyYThWdlZYcWdsTFVYRUJhRUVmNXNYektj?=
 =?utf-8?B?US9ab29tTlJUMUx0aWYxWHBwcXpsdGFsTFNGYmNzK1dueTc0Q0ovL1lCd3pT?=
 =?utf-8?B?ajRqWW9NTkQzcHc5OWYyMUE4ekEydXBaY1BKOEpaNXJnQ3c2MUhRRUJnS2RB?=
 =?utf-8?B?dHBldGZUQ0Y2dTREVm5rSjZnNUR0eGpHNmNSeTcydXdKYzU2bFdrSU9aaGZk?=
 =?utf-8?B?c09ydVdtQTlYb1Z3STl3ay9VbmVrMVRvY0JlUkJXUG1PVktpbDQvZENGNjRt?=
 =?utf-8?B?dm11eUxmVWZwRllLV0ZIVEMrcnZKaDkrSnAxYUtsaWFQQlZ4L3MyWmJHSVd0?=
 =?utf-8?B?dWIyVEUvaFlRQ0c0TXBDNjA0T0NBV2s5dVQwdnhCbTZ5L3IrVUtvcDM1Z0dq?=
 =?utf-8?B?Nk5wWW9xdk56Q01lSXE5cWJ6YW1DT08vaEs5ei9JeDZuMjBSNEhvU1hqSHd5?=
 =?utf-8?B?YTZVRmpTQmx0TDdzSXhMa2w3a2tWWm5mSmhzaVByc0gwVHU3SFZaNU5HdzNF?=
 =?utf-8?B?WnJYOElBanI2MGxvS1NHOHZHaTZlckpJZ1c3b1V6WC94ekQrTVJXK2Y0NENo?=
 =?utf-8?B?eWJqSnlIUmF4SVJubWIyamdPSGFkZTNRREZ5UXNnNUlEaTBjZWV2KzFXUnkv?=
 =?utf-8?B?dDFNSFNGeGZ6aGFZV0R0SDR4VVhjd3hNd0QyYzYycXBpdXRiY1g2MXgrYzF3?=
 =?utf-8?B?VnV0Nk5FVzBMZGowY2tSYkpMcVZXT3JyT2kxNWt5RFhUYVI0bm1LNk9xb0xG?=
 =?utf-8?B?bjE3SVlDZ1lYYXhKOXdiTk5MMmFUY2F3b1JiL2hiZG1JSG94cm51SDVMMWFj?=
 =?utf-8?B?QVFybnlmQ21qek9qS1o0N3NGTGdIRitZRWw5RzM4R1JVbERCSUtlcU1VRWpK?=
 =?utf-8?B?UldTOTkyYlZPZWg4U01CMTAxeit5MmJwUjBVUjdPZlpKK2VoWmpramRiUW8w?=
 =?utf-8?B?L2FqdTRpd2VtN2s5RnFxWWEzVTFXL2hlUFM0RExUOGFkcVgvVUhBdHR2bVBG?=
 =?utf-8?B?aVVmL3lXdllIMmVhVStKaHJOKzNoSFZ3anpBamd3cUdSRzlOTU5nMnNXQ1Zy?=
 =?utf-8?B?SDZDWldBN3k1cmNUajRYQ2pYSXhTVDVyVWJoS0lSbDY4OGk4L1NiTksyZVMy?=
 =?utf-8?B?ZytGSHgxM1hrb2ViangvR2JjeVhrc0trNFJFYXN1WkwvcTd3dWR5bzMxeEFv?=
 =?utf-8?B?S1ZkdU9nUUE2dHp6V1VUZFo1dUhBcERDZ2xHQXVlRFFWZFJUd2doYmdYSi80?=
 =?utf-8?B?NHB0dTEvOXoxUTFsQU5aakhjeU9tMXhqNlk3SUNmL1Y1anZpc1lCN0NTMVF1?=
 =?utf-8?B?QTJGUFpXbHVRelZnSDNTa3NVK240UmIvY1IvUDdGRFlaRVNKanJSc01aZTR5?=
 =?utf-8?B?Q2NiTkNaNlQ1bk5KL0lCSXBJTVNIWmpoVHZtNmhVMG9lTjdwYWhzVE1OQzVI?=
 =?utf-8?B?ckMwRFBzcGVjaVNFZDJYdUhmWEkrcXhFTU9Ra3l5bkhEUkorU0JFZzFFQWQ0?=
 =?utf-8?B?d3lRc3Z3aUNPM2Z0ZUhUQ05xR1dvVHl2S1E1NVNJSHcyeFhDclZCSTM3UlUz?=
 =?utf-8?B?TmdlNnMrQ1ZIQi9Xd016VWNLWjJkdWlqMG1JTXFtQkdlZ2FSN250TjhhY1dh?=
 =?utf-8?B?bVg1bXlidkw4N0N5SXJab2QwejkyeDdMWjVMUGVsMTlnMjhGNHFnM3NnVllu?=
 =?utf-8?B?L2VBZ1lYUjNUMTBNKzVEemIwSnJPWDNEUkF6bnZiU2ZicEJycFlBdTA1ZEhp?=
 =?utf-8?B?OG4yUXVLU3hNR1cyRndrYzI5bUxRVFBhL1Q0TmF0aDYrTXFlMk5hc3VKRVc0?=
 =?utf-8?B?RlF4c290NEpuWHpXRlNydnBLM2JuekRqSTNUUGZ6bHNRV3RvcWZGVEcwYjFC?=
 =?utf-8?B?WVA5U3o1UGJMRU5tcndmMTQ4T0ZHaDJKaDJMK2lOMEJnaTBGZjFoUnROQzlF?=
 =?utf-8?B?NTFUbnMwb3J0TEZCVTBWb0hiZ3Joc1RZWHVNSlZBcjZ6V0VWcUhVZFRuRktJ?=
 =?utf-8?B?L2cydXFaaXVqSU9yTFZ4V2pDM2Q4WXBQTVh5QjRaUy9sMXdiSEZKS25BRnoz?=
 =?utf-8?B?SURRZyttb0pDekVKSzVsdFJvNWpBVGlzc2hzeWtIeGZKZUU5ZkpDMnBjc0Zy?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vJTrFmE//FTHUYox9LJde1JcozRR+cxMuvIo6QBYlVn5CJFsplXSmgq76QSm/VRFRd71BhMoTaCKTsKRXmb6oRq6impkUxOxM6YEH8WLOmAXX34WprSGX0azqhIb2uL5XlmtJI4GmrZKw2kb5j/8ChKmyDrJu1jlyLrR0C/IqIe/eg2MxNfkHiw//Geuyq3KYc4VXJaedX5MHpJSwee+KRldiPytykx6aXBMwFs7Olhn5wiLs4wnQKfW+sNmrfuYEyDFhtBgxKFsXSBZKrA/LqI4u76s+xxpLeP6pojQ5CDlGKCkDIHiuflQju0quDyllpn772NLEF1BVf4kCYgWwhwPs24sQxl1eNdVdkcEfZK2jc5Vb2w81GJ6CtHU7h0FW4om6bFuPkOf4ZXgjO4jjy3CzoTBaYHFFM3clXf7my/SVnpLPlxEGEFYYJL+3eN4Inz4go95pRuMiS4/Dhuvf/oOCQeSCOfKhVFyGUDcrTSnjCxMESXA41ivr35WOiWuYGvNzci/dpVtHK9JfSzjQ57SQUoq5yRttaL9dmbtpGJv4b3e1Vi2Bq34G0D7gc5QJXuCGb6MQ9TqUEZB918oLivQfIhWEAfKq0jw5BqimvM1Y7nBDqzqPuFzslLxfrWmQB3urdAD3LBx19QooHfOX0LbjFEQc9rpK1GPuFnplobDJer3CV/lJUIs6l/kqNV8gj+9vbsL0LfbrNfoIBwkMo4M93ECWsEFd097T5hnBtUU7ufpbcuFRDY1dr6nmzop2UZJjOZxyKAsOYPL20Ds6q9aMWHg+ViYKjbLUlrRtinAhP8WjGRZBkSBfUkjtXK4H2eDeAF2wd0SoXmLW4p1z/Qr55VshRHWJveC6prrE7tNnY+bhO6IHnwZWOBtuyru
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5dad1b-c9b4-4298-a16e-08db4b2600d2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 15:58:00.0789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMmq9He7APaTLki7WDsWHmuS7BCyNRWf0mFhPtQLJiDzl0WDFJV7yOQzrNGeYHpol5j5ov1lEwi3ba1yaCKSzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6498

On Wed, Apr 26, 2023 at 05:40:05PM +0100, Ross Lagerwall wrote:
> The existing code silently converts read operations with the
> REQ_FUA bit set into write-barrier operations. This results in data
> loss as the backend scribbles zeroes over the data instead of returning
> it.
> 
> While the REQ_FUA bit doesn't make sense on a read operation, at least
> one well-known out-of-tree kernel module does set it and since it
> results in data loss, let's be safe here and only look at REQ_FUA for
> writes.

Do we know what's the intention of the out-of-tree kernel module with
it's usage of FUA for reads?

Should this maybe be translated to a pair of flush cache and read
requests?

> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  drivers/block/xen-blkfront.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 23ed258b57f0..c1890c8a9f6e 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -780,7 +780,8 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
>  		ring_req->u.rw.handle = info->handle;
>  		ring_req->operation = rq_data_dir(req) ?
>  			BLKIF_OP_WRITE : BLKIF_OP_READ;
> -		if (req_op(req) == REQ_OP_FLUSH || req->cmd_flags & REQ_FUA) {
> +		if (req_op(req) == REQ_OP_FLUSH ||
> +		    (req_op(req) == REQ_OP_WRITE && (req->cmd_flags & REQ_FUA))) {

Should we print some kind of warning maybe once that we have received
a READ request with the FUA flag set, and the FUA flag will have no
effect?

Thanks, Roger.

