Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BB06D7D03
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 14:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518515.805150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2gk-00057s-GT; Wed, 05 Apr 2023 12:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518515.805150; Wed, 05 Apr 2023 12:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2gk-00055A-Df; Wed, 05 Apr 2023 12:56:34 +0000
Received: by outflank-mailman (input) for mailman id 518515;
 Wed, 05 Apr 2023 12:56:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gxas=74=citrix.com=prvs=452091250=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pk2gi-00054z-Q1
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 12:56:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 485f72f6-d3b1-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 14:56:31 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Apr 2023 08:56:28 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS7PR03MB5398.namprd03.prod.outlook.com (2603:10b6:5:2c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 12:56:25 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Wed, 5 Apr 2023
 12:56:25 +0000
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
X-Inumbo-ID: 485f72f6-d3b1-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680699391;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LG+xH0EesdaTqZvUOLS0x3iH9+npzY9Dt2rpaa6Wl6A=;
  b=RhOd+GavSqcdW7huMfyp2wWEzFwg2ap/U1CHVuMwmKyKYjCPRmRBAA4K
   YHZ728Vgi1uKRn1+En8KxhzYn4elefJ6KALGQLlrMC64My5JZqtPj56JK
   kRuKoBAUu5JtxZrA9IevStpaZYwwrKzfTTAINJ+jQsqcYRu26mdNvFL7S
   o=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 104325715
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QkQl+a7WPQtj95A+iXqJlAxRtB7GchMFZxGqfqrLsTDasY5as4F+v
 mVNXjqEOa2ONjGhLoogaIq/o09Q6MSGn95jT1NrpHg8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPawT4QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 Ns1DhVcTTG/3+Od5bmibbB0usARFZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOCF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxX+gAt9NTeDQGvhCgUavlksWDi8teEqm8Nucjx7hXINRE
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQP4MudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9URX5NkcHbC4ACAEDvN/qpdhrigqVF447VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraT0gbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:B1bHBK5f43Mlpx1FOwPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.98,319,1673931600"; 
   d="scan'208";a="104325715"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+N9EI9TkQ/DhWeNlnE7Yo/sldMCNp1mdQD3T9TuoAYCwkLIviMDTeX2GbQX/ePQTzT5/Vw/6tioKm/LpY0NSMtSiWjv4VCwlDwr/SsP1cNg/3rovm5NsbRviKbUFAi83+zT39tbpu5RWLT4hoDCbqsu82xnv9/GWYG7rmnc9gg4xd7y/bAiUjvra91kWWsgmhKm3kzTVTjbff//E9R0uvEW/H/SV8Jv6eTPIQtE1O9PTArIjscS0S8I5yYpBWcBHFQn7pBQmJoLhSV3SjJExmhCI95ScR5nkOJl8HZRYtgZMNtvWwJMcL07wTvQeu4Vwo0tFaG2NRKDcX7dQM2Tyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBW7ugeVKCpkm57u3b8Y1zOQVaNuGRpQnnTXZkDDejI=;
 b=kN8R7AcTMx8DjQ5lZP2vSJmaJ1XVprwYnCJM8/2e6DhRIg2Z/ALx6HTSDoVr7u54cWRnniGV7icvIsMU9+Xxi0jk0okFVB4VE2F906lY/Ggnsar9rdl0jlHFL8T4pPMvN6RjaJEqvk2S7j21vXKUgEd27G29E6UQ+gwkjj5LEwmIo+37jEIxG+zAlCp8Edq+UyGaeiZPjTkLWrYQWNN3NGxF+4z+0lz2En0lXhT2+gcynm04x0MFdcCH+s3aiNxqYf1ie3e3pccxujVinoeyWUm7YGGFk4n2BvuSUGTWRYAlF50jM48EXd619t5a+fJ2SrbFufWGjun+bq255/cT4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBW7ugeVKCpkm57u3b8Y1zOQVaNuGRpQnnTXZkDDejI=;
 b=axbWHihRB9XMHG8McbpiQr6H1zhb6Vf4kvdmbSbk6LYSejwopISc8S1gbIysg86hqT46m/SXEn2MoKFDdHe8fKoLXROXiT7T1w6ya8hlGKZ0qp/Ank75iBJZ7D8FJOoaU0gSoWpuc3HsQ9oN1HdSoU+OYSO/Mxoic5O3wiOChuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 5 Apr 2023 14:56:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/libs/guest: Fix build following libx86 changes
Message-ID: <ZC1v85y+HQmvBAQ3@Air-de-Roger>
References: <20230405123755.1427246-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230405123755.1427246-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS7PR03MB5398:EE_
X-MS-Office365-Filtering-Correlation-Id: a79f9569-2f32-4237-b2d4-08db35d52a13
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3atwFRkU9JE+3BrAmpS3zE+v6F8oCgtVdjZBXApsWXo4kh291tRI/4EqWutxaDaJ1ihDtg/N/+uhF9A1DjptX5P2AXXcswpU9kgCiDtVW3lIhoYicmE3/7zN8JKlxNicdYEVvIXvEzckWVEgXuk0dJRKA4jAXRL0XWYLgdKOGPDomcnvRfxv/Fu4plHCmSPzcoEWuGP0EuQ5Z7s0CXDApTDQYqRRE7x6EzdNFjypsNnvIibufIL7NDLKtLA/MZQB9NQukpUWHD4XuRoHY3VQCazKsloxIgnDTxcI8kcLH2IHQv9sNsMorvLXdCtZNihY4bx+EgBjAONBRD8j7G+vQysXUoCYnRRhHex6XKdY7vuI9s8vB2Z9SzkCdBNJnUzkn8PTArB34rPtsAqiCarXLltdS7P0SrGkqo4N+bGDsQC9VRIDtrs+JcrOIiRhJU7f30H4Mrv20PtPDA/mIMtyOq7SeU3ulbdmtCyya01l9RTEBlOGXkB5i13B5VXmQoARp3+bmTOYYzE+jJ+/zEicxbaHh7qiII5jLiSACI5t0659b4xIsCHX2PYigH3aA59Ez/2CVsDD5OO5rFHsKtVTxAhucoTsMt1wdUsm+QxyFtw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199021)(5660300002)(54906003)(316002)(6636002)(6862004)(41300700001)(8936002)(2906002)(186003)(478600001)(66946007)(66556008)(4326008)(66476007)(8676002)(6486002)(107886003)(6666004)(6512007)(6506007)(26005)(9686003)(83380400001)(85182001)(38100700002)(558084003)(82960400001)(33716001)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWEwQUpMTnR6VDlPdmpKclppY2FTQnZNN0VyQ1lySWp4OFNZMFpTY1cvM3Ix?=
 =?utf-8?B?d29hOXU4WVlFbXhFV2lZU3p1OFFvUmZEYjkrSFdHTUd5dlJGUEc2RGowRzda?=
 =?utf-8?B?cGlSdjZobnk3dkJEQWI2dTlRczJoS2VwZXRUcXZPVzUyWWJGZHFCMWNSMDVn?=
 =?utf-8?B?OXU1VXlPV0VrRHhMeUNRNG9TTExNMW45NkVNSXFmWmZWN1pNU3gxWVBNanl0?=
 =?utf-8?B?QTV6VFJ4d3ZjOUUrU1VlOE5TZFhsQ1pKZER6cHhUYTB4dnQ1UzlrVml0RGlE?=
 =?utf-8?B?ZkRHZ0lDQWN5NGp6QVhpSmxOMUE2NTJsSENsNEVxSnNxTG8zZitQTDhScnZm?=
 =?utf-8?B?Vm9La3ZZREdaZG1HSlh3RWpMUmdLTTBIQmcveWhoVFg4NnB4UGZqYWNxazNP?=
 =?utf-8?B?dCtXVFdnbVRMR0NNbVo3R3Y4R3JHRkkvaGl4WWFPM2ZOWGR6bWRtS0lOb0la?=
 =?utf-8?B?RjFqRzg2RmlVVXhXWkdBbDhRRlBJVmM0aDlUb2lnaUhDc1d3R21hTXl4REhJ?=
 =?utf-8?B?c0RCWExGY2ozWDRDb2h5Vk13am9qK2VoeE5Zdzl2RDFFL25uU0w1amQrY0M5?=
 =?utf-8?B?SmI0Umk3ZUdmUW4rcWVTdDUxNjJsbEdZSmVidHRtUUlTZ2didW0ycGxqS0RL?=
 =?utf-8?B?MUFybTR6eFFrUk5UWUhaeGdlNWdYMHg2SmljQnpCRjdJUWNSUkZzem5zbHdH?=
 =?utf-8?B?ak91M3M4bDVCeDV6dENaK1d3c2tDVHNsY1kyUVBQVFJpNjVPeVJZbzhZYk5l?=
 =?utf-8?B?TVFBRWlZSzVLeG1EOGlPWnZPZTMrQ0pkSXExQWtJaEE5VlhKZ21HQlJBaTQ2?=
 =?utf-8?B?K3FpS0xYK1hrUFh5UVhET1dGNFVNV0llOXAvNjUyajlNb3RTUklCcU45eUlh?=
 =?utf-8?B?ay9aaTEwSkxCbCs5R1hrTCt5SDIvMjZXUmRLQjhOYW1HbnhvVEtqM1lQUmhE?=
 =?utf-8?B?YlFvWlJiclVQazNML0xYT3ROd0NLSmYxSmV0ZkNNNUxkQ09lTXlTMGdLSEZz?=
 =?utf-8?B?VGpYZGtKS0tYZTduZG40WUZxUjdrN2NaMDczM2FsSGZQSkkzTnN6REZ3OVJW?=
 =?utf-8?B?VGlrNWY3ZjJhTVF5VE4zeHJhYkdqc2FybTBvcE5iazdzVzltdkpnaVZGTXNi?=
 =?utf-8?B?VGU3ODFla3doUzRaY3VkbC9YOSt3QTVzOTlSV2I1bVI3QzlGVkFBU1k5bndm?=
 =?utf-8?B?QjRNTGkwZGJjNFdXQXQ5TEVXc1d4OGQxSWdjdUpwbmI3aWJzeDZGbkZ6YlVy?=
 =?utf-8?B?ZEdFeE9lSUN6aFlFQm0yV1dEMW5ndzJGY093Z1U2cVJwZFJmbHY1dW1aWjE5?=
 =?utf-8?B?S2J0czExR2g3N016N2s5THB1c2N4cEg4RUd1bEVNZHh2OGlJOHIxRWNadWVn?=
 =?utf-8?B?RjMweWl1WnNOYmhzaHFIV3JqMXpJa2VxN1ltUWlPdXQ1Uytja1dkVnpwcE04?=
 =?utf-8?B?M1FDR0FxVWdBZldPOFhEV0MyMnV2MGRyU3M4QnVTSWRTaytLNmtJQkRVTGpv?=
 =?utf-8?B?TUxLV0xObGFYSFcyWVNYYzU2T3BaenE4NTFBai9xcUJ2ZXBrbTYrUXd3MC9N?=
 =?utf-8?B?TkxtTFdsUWhMTzBJd2htZVcvL3h5WUJDZ0QrWU93RDBicThUZG1yR2lkNU5m?=
 =?utf-8?B?aDk0Vm9CQXNMMVJDeGJta0tnc0JUSEdEdnZuZDJJL2hNUHV2WG5mSkhjdDla?=
 =?utf-8?B?OHEzOWdPYlFwMktEMllKQ2VDYnFiTmViaXhwMkw0K2hxcXByTGhlNFIzYjVp?=
 =?utf-8?B?ZVhxb3MwUDM3S2hWQk1rbVE3RXRMazF6MFZHbjBMaTA1NnR4S2IxT3pqZjZr?=
 =?utf-8?B?b1g3WkxlVVVudUFsWUFMb3dPd0NTS1NrZis5OWJwN2RMcGdqcERWRWpucy9h?=
 =?utf-8?B?Sm9sV3hiV2RMNjZxQXdoMWJreE96bjNENnhXSEYzY25OTVdYLytvRHd1aVVZ?=
 =?utf-8?B?bjlaREpwTFllbTNtcG54MGpyVnFiYTZpeTJxMzBYazNlTFFCcnRZeFY5bFRX?=
 =?utf-8?B?bXV3eHY1alZWTjMzZ09sSkRxa3RJUXQrMHhXZWM5MmNWc2RaVVc1dWloNGI3?=
 =?utf-8?B?M0VjbmYxYVlQdzJjWjBqcXA0MWlXek10UmZzRXBHUGFUV0dYWk05dnVHQVFB?=
 =?utf-8?Q?7S4s1zXHYPXDQdhqCL3SjVdMY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UWraG3vZhzBUlEyzSwtwY5VqQKTWGQUD0hSUMLjGIzMxyyvJLbkDUHxdGCnHSw/+r7ASmrmeTxsPxjV7bjNbljIB+AP7abd7CTbqxKeUBN4KWZ6uHDcJHTwEt8m42Qtk6l2P3J27JJn47Uu/ZGM7Ttgw3eZoy2Jx23SUrAFAghS5qIjxxdEV1FYsazQnglue+boMMGsi1kb8Xpgy5U9DgYYMJZrcTIin4e3p/BlWDVT0wmbLuDdq9PM7vusUbxfSfGM69R7mzCRvm6FYucJ29CXv2pXOPLsEliUDuaMSjBKxuM+LuU7cuIv67/2HroUh7Vtvy/oHa5ugo6FmDDVGCF3hfUB5kWhfzpxdsPGa1WZ14ielQ6kA5YXRiDyVDnErW1oPfE3bBjUuNwHtk1TdQ8mGH/ZQtkYuFVAMPqkWJs2DohIzLx438EFicznE4nM+4ZygI4eQUaTZYI+KjnokI6F6nzGKo5l4FwCIDD4vcnnC6zKsyGjXscoYzTahDs0IfXaVfAC6VHx4/T4FJcNGCbjjr4X470UffGeLJXN6eWFWEyaVFlwi1Qv1kxpFICoxLZv9bWRK4gE4UGVSy+maMLYoE50gblWKmeZtgHmgtgjHH3iLbvXdCdWTEQge0VxoNt53JEBLAIxAg3WkQ8ylGaP+x0fKDPhZEp0YjPz695y9hvhHtLAk8hxnO4lYCO/npYjYF1tytcZj3JWSeTDeTW5yW8BUollnXMRujYvrZBqazt8oJYfuhHmUz0glWa1kZgROAyp9lqurIdmqigngIECWdu/IrgM1dzp8P5ikfP3eq3O2B9NJE1L3hX0/0CjZ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79f9569-2f32-4237-b2d4-08db35d52a13
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 12:56:25.5555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIYHNQVKdrzbaAFn7MhEN7fo3OuO9hUaEl6zuDKmwgcFHuRo4+0zu4n3JX2v3ItuEtxRIGWenhfrd5XsHey0TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5398

On Wed, Apr 05, 2023 at 01:37:55PM +0100, Andrew Cooper wrote:
> I appear to have lost this hunk somewhere...
> 
> Fixes: 1b67fccf3b02 ("libx86: Update library API for cpu_policy")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

