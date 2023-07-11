Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B298474EA4A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561650.878122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9by-0003d5-J7; Tue, 11 Jul 2023 09:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561650.878122; Tue, 11 Jul 2023 09:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9by-0003bO-GD; Tue, 11 Jul 2023 09:24:46 +0000
Received: by outflank-mailman (input) for mailman id 561650;
 Tue, 11 Jul 2023 09:24:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rRYD=C5=citrix.com=prvs=54940d4e9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJ9bx-0003bI-Aa
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:24:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c387c023-1fcc-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 11:24:42 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2023 05:24:39 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5920.namprd03.prod.outlook.com (2603:10b6:a03:2d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 09:24:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:24:37 +0000
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
X-Inumbo-ID: c387c023-1fcc-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689067482;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=TJ2vuEfb9tAO1Ive6q9zAHTkikNNg5ee8eHipxfIPR8=;
  b=HQYYPJ/MI5D9ChB5GPh3ZPSOd1J7Z7GocqJBqMnMa4CFWuAML2Ssijuq
   9rIZYHEgHIT09eh1qqH1ZZgwbL8Wq2O23wQMRxuhxkvbBD/SYq1NztMIL
   AgncrhmOZEPBxMrq16KW3xhe6Z0tgEr9u5ABbBMXwRcwnpZxRsb6svpS9
   g=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 115682816
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FOrXaqr4doLFkQz1cnsh9SujbcteBmI8ZBIvgKrLsJaIsI4StFCzt
 garIBnVO/mKN2XyLYh1bd7k8xkPuMPVnYQwHgFv+ypjRSgTpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBziBNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGBWbSKDovyy+rGYbMRttPR6d9LNNpxK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKJEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtPSu3ipqc06LGV7n0CNR5NVkqEmueGp2ScfY5VN
 Fcx5gN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcpQRQ62
 1nPmMnmbRRtv6eSUmm17aqPoHW5Pi19EIMZTSoNTA9A6d+8pog210rLVow6SPLzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:TD+1aKHhPmK6U+NipLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-Talos-CUID: 9a23:3VmnaGNw+o45kO5DCHJkxk4xBMQfcV774XbiExbjEkBjV+jA
X-Talos-MUID: 9a23:OR9C6wiYfYNC+0bUY8IH/sMpJdZV4P+tGX82j6orkeuiaSZvIBKBpWHi
X-IronPort-AV: E=Sophos;i="6.01,196,1684814400"; 
   d="scan'208";a="115682816"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mhge1MEJYkuCJ19p1H1FzDebXaZjdMLd7U/y3WvMsqsKc9VBu3rRdAaiBtyDaYiGP/yI9zXY2kTKz97O5FcTOqM96N5mIEXbG8HZ8NaBtwYSB3+U5Zeb+UHOl8kCXrzs3/a4HF5A2y3C4v5h1X6EeILw5v1QKXRAkN8X+geYXzDjL/2jJT2tM3VSMDGUwOOMqPdASRQAZPNr1mBVZUG1liyEF0vnnKC+6fZMeDji8YYoyh1uhUFlEgR07m/hBV4ffNSR5jWMB8FBfBJy6mKfM68gtC74yLIwA0u+Tw8n/q6n4naNPxxHJnCYlut39TRcHIZiIq9febZsv0uOAh9uxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxySi3AYc7WCYZJHKYBqiMjANBvcoeZT761nqseVDCY=;
 b=Y4bpWIWBrTOT55zlk+1dE/6Zgtvj5dVZZXs1L9Wm1dalqgTT8S8jn74lfIYwSyP32HjYeZkmI0nZyCL8qRbb5nsIf9yi1ujy/mtuj6a2+YU+UkNdIXph7V7tEt18gA8g+U38QKvmlCY58nbWqPpmz8d/dwlEBa65/B1TzE7BlymuYY1R+2xUitXOE77kFO+JQu+okQc797y3JwUfcobkIa64l5oJoySJpfuWa7lzYH2/q/XvPCRlJSWLrPYy0rm7eXhRk97gr38O50ElxSzrWVGy0IRsv+tzFdBy5WbZc9B+JoRuqCMv/mpGrliu4g3IKa7NLdPpF2IQ8ui8EAXvTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxySi3AYc7WCYZJHKYBqiMjANBvcoeZT761nqseVDCY=;
 b=bUjcdsD7jR7s1GmciRTCQKy3TdP520VDeVYzGfILMqLOdPvsS7yfiYnZsSqMhSUNfUgT5XND9x9WCMNYBsVSa8pYMWuR4/Enlch29+PQVTuwFcKqZAxaSlMGyNroXOEfv0rwWPqv+o9AfJV121BvBDKav6BooH3lnkASne62LUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/6] lib{xc,xl}: support for guest MSR features
Date: Tue, 11 Jul 2023 11:22:24 +0200
Message-ID: <20230711092230.15408-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0495.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4311af-481c-448f-075d-08db81f0a5a4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3akRgaS4AAfByyCZzhjt4CS51ZSWWiQPiZNDrb6i1eboAyRL2PCYQGPQQpBVWmaFrMAg/T/sBVENWoPtV2xI2AHvJRHzi+3898k6/wafeV7OTEt6D5x06ygAtYIZLYDrPL8y8EoRuuFxu1IsCRQ2SsRZvOcdtpmydodMiCqvDL6I/+S8nSfZCFn6F+aVyrcJWhBSA8c+3oRmi6L81NOIxTTDX1fa7UBbbAZTTK5yB9eCPiXrPrh0t7YWZjebcG/5Ptrg27VP5AeNlNE3A4h+9+rEcHU7YpcutkbHepQAVUVX64vxo/Nr1CxS64hkPPRvBM+MhoBU6pSTuSorQKoR+sLq6zTh6wfqEFGm6xqut1FVESbhvRV76gfq0uRVK1Kab/ohEFMuDbvlnBMIxYY8yuuswh4ClBM4hsw+xbrt9HTWQ1FwQGiU2GGKTWQ7azdk9qpjnwkfWwroHAPxY1sYQz04XpDJis5Xmjd+g5k81gyv1vynrxT71yxTSAlP5oStNG7q8qguHDWkaxa+hdc38Snpnbs/l/dRrwc6XBpwQYz1Jb+NmJQQyhwPYL3cgzw1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(54906003)(6486002)(6666004)(478600001)(26005)(6506007)(1076003)(6512007)(66946007)(186003)(2906002)(6916009)(66556008)(41300700001)(66476007)(5660300002)(316002)(4326008)(8936002)(8676002)(82960400001)(38100700002)(86362001)(36756003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEFqeWVVV3lRaWtnSmdQMjN0YzVobyt1U3NKcC9pd082dVB5N0grVjdpa3N5?=
 =?utf-8?B?Vm1qdzA2cCtPK1hDbTFoMFBjWUVaYjVkZGZKUmZYbUQ4UEZMVGl4dTRxa0hB?=
 =?utf-8?B?TVZObWdKQ3E4elRFUWw3WjVlcXkwMTRVaFFxQnRUNzR6V21vUzRSTERDVzFI?=
 =?utf-8?B?OHhzQjl4ZXM1RUpVQXBIUENFTzVhbDFndW42Y1VHeEJ0Q2R1bURhbUVvdlRD?=
 =?utf-8?B?OTdnbUVSc091a0VsR1hhUDJXWU05SDljZThuczVJN0s1eEhCUGtCQW55U3gz?=
 =?utf-8?B?SjU1SkdsdVc1STRRczV1NHY1N21UczRObGZVbjNUSzFLa21CWVlVT2Q4cmN1?=
 =?utf-8?B?NGxTZ3NKWUZ0MDQrd0o3b3ZNeCtJbUhteHNvRVk4ZjBHa0I5aXpNeUhvS25h?=
 =?utf-8?B?ekR3bFN4dElxZGlnVW9mczdDbzRFdjNOcEYxaUtNV216VWI0ZUY4ZHA2U3I4?=
 =?utf-8?B?R2g4Ukc4WlYrdEg2ZUdBVjh6Vml0Uk4rb2dCdlRud1grdGdBTllBZXJYeUhn?=
 =?utf-8?B?MGE1SmE1azJsckZjdE9laWNvVGNmMGxDRHQ1S1JnMSs5ZVV4NStBb0lmN2lk?=
 =?utf-8?B?RWRybTQ2bmVtN0xKTE1hMm0wNmlrbHpJdEYzSjBaZEwzV2VtQ0p3b1IrNmNH?=
 =?utf-8?B?WldaM0JFZ0RLd0U2NVgyS1Q5Y08xYnJPRW10N0NERXdzdUNKNnBkUHg2c242?=
 =?utf-8?B?RGhZYTNGUkRHd0RUMENuL2ZhOHVONEgzWGFOU1hNeXdFajJ6Njl6Wk1LUE42?=
 =?utf-8?B?Rit2engwcm5ROTAwTUM4VzJNWExQWVNUeSt5bGlxRTlMU3g0cWZyUFIyVHZG?=
 =?utf-8?B?QUg1VEdPM1hJWk1LbUphdFB4dmhOd28zekd6Q09LSVhPMHpZOWZhdzdRbjhE?=
 =?utf-8?B?QlZ3THo1MGNOQ1QrNUp3VGdEbThhWVNZOGFBVURVUUFHYm5iU0pWZzFDYURt?=
 =?utf-8?B?SUx0WmZESkJxNUdhaVR3ZzFvWVJVTk9IQkVmQS9FVC8xVzJjTkFtOFRJSGI5?=
 =?utf-8?B?eWlrQUw3YThkUW93Qjk2TVRFU0I1aEdSN3FYRHQzdUpabkg0RnoyQ3pSamZw?=
 =?utf-8?B?Q0RzZzJ1TWRkRjZVbXQ1RkExdlA2UTNrdEt0TlZHc0dWa3BXbVVDYkVMMHhr?=
 =?utf-8?B?dXM4KzZIenRsMDFkOW9IZ3Q1N3pxK1VVWFRKaDB4MmZvWGFDYk1sRVo2b1pI?=
 =?utf-8?B?cDZPQ0puWmxxbFBZMGo0eEFXUlR3RHU4bzd6bW81YTVUSHFVWjdEYys4OTVq?=
 =?utf-8?B?aEJQM1k5SGZRZGtTZlduY1paMFNUaFBHVUI1TjZHZ3FBOE0reDhsaXMxbDB0?=
 =?utf-8?B?M0ZneVprNEh0S2FQYXBZYUk5YUtGUWU2eWxMNHEwNWZHNlQvZVR5TGxEak9t?=
 =?utf-8?B?K1hhUEZiTHM0NU9VUW41RDlXclU3N29ZVzcxZXB2UkFvVUF4VXFXUUtiRzdC?=
 =?utf-8?B?NmtuTERrT2VpbEJWQmh3S1plY1Axd2N5elZCQ0kzWmhrWHh6ZElzbWUxQndF?=
 =?utf-8?B?R3RheDRtU1BZQkZUTzZvQ01yWC90UFpqRXRxUzNSRDA0SjQ2MG00REVZZUpL?=
 =?utf-8?B?aEgvRkd5NkxvVkFIdFZsMHYzTFFZMW5aeWpvZGlqSkJKRE1iZXNkVG9HVnY2?=
 =?utf-8?B?UkprajluVEtheENadGdtL0RtWHBscDBYaEZWSE1XcStVclBBSWxmeTVVYzk5?=
 =?utf-8?B?ZDhGazNQMVhaK2JrUXdjRVdtcUZ4RFUvTGcrMFRzVm9ySDhuUk5ORmtxNjRZ?=
 =?utf-8?B?Q0lSZEtna0Q4K2w3WXl2WXV3SkhzTTN2ODFoR1RLSnRkbTQzM2k2U29nRGl1?=
 =?utf-8?B?UlNRRTBHTVUrek5oN2kwWG9OblJXMXQ3RFI2ZGxFWGRURHpTUjErR1l1YXNM?=
 =?utf-8?B?Y3h5aUtVTCs2UWxQWWNrSURBbk44M1ZhMHVUc0p3a0M3ZmpLVzNnS3RoZllw?=
 =?utf-8?B?Vmd1U240eGdORFArVGZXY05jSmNXTGlicTYwNVFOK1Yvei93RUZNUnNRWE5q?=
 =?utf-8?B?a0hxc1lsbmhjK0Vkczd2UGdmK3VzR29sQjVHcGlYeFVJUllLSWVjenJCanRW?=
 =?utf-8?B?UHZZd3FJd2Q4NVNKRVMwRjFNUk16cUt0U3k2V1VzZWpGU3F4S3lRSXB6V3d5?=
 =?utf-8?Q?N27wxss2hLc/arzJRgJQ2BC6k?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	knTW3GObwH/xQyL/pGllyCjFDDTy7SQl/7QrJjB1+vTyzQ6ecaLQUnlqiDqZ81llxwHfaUt7Ncldujj/PC6Lfy4/oHHtzbwXSXmGIFgvlk+uPKD6IpPn/glKQlNr6yZ1WffOJ4yO+NSlkU+iVafglZG/zkvmJaKCarCV7iKjg5mBEnBBqtYoQ82urw49D1duJvm84ncUkSNpDPaUt+9QLTtCp0JON88Jyrd6GHvvRV6NgBCwo2yggXv48IugygWl8/k0sgBDmwosJK0AQlgpKb6cKtfB4Cs12FvMSP7OsmWYbwNlqMfXJXPSrgBBHQsV1ENl9GAFzmtBlZ6LjF/OclKz2jGe8B6AghoSrpvfF69TIfH04FxVx+JlUNftzM6Tsvzo1wvBn1Q1/pgGpkwGsO19koipdiqmr9UAkIA2aVh8X8x1z7yK16ua+/bqCJgWK9Mtx9qy6T6q7K/l3tZ0ZcaXNQM1DTSAgCB2rsHLZMBYNN6amtYzuucgtxbz5QAiWOaBXFT0QcqBPqVX3PgqCAE796hiAuPV0DuQaOBnYMjFC7BPUB44i6rpIY30IYJ1wy3zJu1v7DuJR7/ggZDKT521Xuk7i2/gTVyovt8YmkSn/57yW6+Zwkyy+Y9znqEF87hD+MciypgccU3hxrujkw8jEXx6cQRQSzfRJmoMXN/ZLjcSuzjx8dE2bOMU5LJLhX1XOx5v6fGGVvB/TKnnmpVHiYYYgkCfnZljFfz37yDov1x1yl8Tgq0XHhy7uiV3NFUoOUrZRcTtwsbWD1JDbFSqeBTTneDFUybGvBh7JMicg3i7inDoqv38Ga207DeD
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4311af-481c-448f-075d-08db81f0a5a4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:24:37.5190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/bFddXszMz/fH+rGEJg2rJc/ijXtrZMcE3kqUUzvvCfwYrqNAZ7oHRXLKasfyRpbxplrLeR57yU8JxmiugftA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5920

Hello,

The following series adds support for handling guest MSR features as
defined in arch-x86/cpufeatureset.h.

The end result is the user being able to use such features with the
xl.cfg(5) cpuid option.  This also involves adding support to all the
underlying layers, so both libxl and libxc also get new functionality in
order to properly parse those.

Thanks, Roger.

Roger Pau Monne (6):
  libs/guest: introduce support for setting guest MSRs
  libxl: change the type of libxl_cpuid_policy_list
  libxl: introduce MSR data in libxl_cpuid_policy
  libxl: split logic to parse user provided CPUID features
  libxl: use the cpuid feature names from cpufeatureset.h
  libxl: add support for parsing MSR features

 docs/man/xl.cfg.5.pod.in          |  24 +-
 tools/include/libxl.h             |   8 +-
 tools/include/xenctrl.h           |  21 +-
 tools/libs/guest/xg_cpuid_x86.c   | 168 +++++++++-
 tools/libs/light/libxl_cpuid.c    | 527 ++++++++++++++++--------------
 tools/libs/light/libxl_internal.h |   5 +
 tools/xl/xl_parse.c               |   3 +
 7 files changed, 479 insertions(+), 277 deletions(-)

-- 
2.41.0


