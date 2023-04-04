Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB596D5C98
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 12:05:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517792.803623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdX3-0007ao-5Y; Tue, 04 Apr 2023 10:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517792.803623; Tue, 04 Apr 2023 10:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdX3-0007Yj-1u; Tue, 04 Apr 2023 10:04:53 +0000
Received: by outflank-mailman (input) for mailman id 517792;
 Tue, 04 Apr 2023 10:04:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6be=73=citrix.com=prvs=4510202f8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjdX1-0007Yd-Iw
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 10:04:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21e6e2bd-d2d0-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 12:04:49 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 06:04:29 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6924.namprd03.prod.outlook.com (2603:10b6:303:1bb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 10:04:26 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Tue, 4 Apr 2023
 10:04:26 +0000
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
X-Inumbo-ID: 21e6e2bd-d2d0-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680602690;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Ok66YB07IDcQouChuZxEPNj7oZ/Qz8j2cCPSknr1tlo=;
  b=F0QEIX8BP3zk7NZk9Im7hYet8FOiAT+NLlI32ZEOobCN/qM7eUXl6yBE
   /Py5mtSxbHdpyTy/yBFEo7LXvL+8s+KGsXACw2V9QVW4DdurCF8wdaL+7
   IIeQapm/GdMXRMD3mVTeakVXVBDw4iSzcBvNo/o0ncfJdDIZI3pyqGjBX
   4=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 103613987
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4L8JBq4rgJJCZCjKFrxnNAxRtBnGchMFZxGqfqrLsTDasY5as4F+v
 mMZCzyOPvmDYWf3c9Egb46zoxsH6pLcm9JkSwNprnoyHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPawT4AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 80/CGgtfAy5mLyI452WFvBvo+4zI5y+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojumF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXilAdlDROLQGvhCqkO83FdJKyYtd0qJ/NW2lBGif+p6E
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACAEDs9/qpdhqigqVF4gyVqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraT0tDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:npkDy6N7m60jLsBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="103613987"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fP30eJHQi8VKXJe0tPnSekRi/t+MnesKJZwzkFusYT6vl30Zn5uhhD7b0PX+Zk6kisWYCuSvG8rpuxfoFxC1JrEqpzNx2xDzXFgZzuNGf9OIper592uKSKvoeSmN13Mr+sn1c0u4LakFKLJ4kT0pEy4lpxgks95/enTYSp9YhjQy1DEP+qrzMe1eQZDq6znMTfoeEwCbrP6dX1UfbHKD43HA3UiMXts9BxFXcanYR1w3NO8SFYeYSaRY7KaASxglEE9gMf6QFF59224FIwjPVwXvl0q64seyv1Yi5PtB6+V2WN8Jqa5hsO8UDTbvQd9sdjoHTjWb0GRn4NQhOibz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PevfhuB9Pt0w/l3GtYOJ6zG/k37g0KxbE8D4sxkY1qE=;
 b=OSDS5bsm90d9YFNJLl2qwRi6LdWbDOAGkDNjbVJM14Pb2Uca2u5HDXoaM8YC0Azsh/sfJQFgBO4IHuiqrhiYZrVIIr8GUtyL1MG1CqwLwK5MyvIwfia4R37bBvNQOkyRKQYtGuIfPFmhnAGvA5qJMbz5oKwPJHqD+rQFdDP2TVc2Ep/jLrO5XNff3mBV1oQ/4c8PakM8EMKzhasj5GplkEt5kJgJHVthQZlObU1vIH6PrQF7HxNslWbD8GpjP6oE5A1HKVjqdiixTMg+ZNK/+k+Q1soD0qsHZxYM32UVKYDwZYjiX8A27uUJP+6z1dMHlnOVKMLo3BaGzWtZuexGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PevfhuB9Pt0w/l3GtYOJ6zG/k37g0KxbE8D4sxkY1qE=;
 b=hQ3MNP477Zn1a/AjqZq1kOCIZ4/IbbWL5EqAcCoPQEU2Gh929RmfPGy5nRF+WuTfZ5ER5GalC3jBPLiqL4Jv8LtErOaR3luFcLbhmoTHMpMYA0O58n2zXMxttrKfKTFoDyumZ39ODLuCBhhRsG2HrDLc68daGzZGhi6xMMKIl3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Apr 2023 12:04:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/PV: ignore PAE_MODE ELF note for 64-bit Dom0
Message-ID: <ZCv2JR74mi0Gfqs/@Air-de-Roger>
References: <f52befc9-f19c-12fb-b0db-b6c4219999b2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f52befc9-f19c-12fb-b0db-b6c4219999b2@suse.com>
X-ClientProxiedBy: LO4P302CA0001.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 766ad71d-d05c-4f1b-6aef-08db34f3f92f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nKJQqF89Hhdxl26J+mlEYZNnDz5aL+8pIQBG+VyLkgtFdIxvk8kvXxo4p78DVZgSUdSalDfWBmX2Zg2nCPA+IXyzhH94L7Cw/fHgD/6+yx+c0wl+i4lUnYCmvcni+b5v39sdY/YKUqWoo7tVKXdwrY1CkJKgTttAow37q0VmXRL6pG/T9E56CH7X4RMyR3i5BDTlaotNAqk0m3aGepUbvLxXvjiIrLrY6N8TAPwZ8AUKW8Fb6Z+20r43djPEtiHUhchkCUjG30D1H9KwndlPNK2AucAzzXkj8hOxEdZpZubpsaKKwrxaxnLtCoKwGhm9YMLmctTmxG1X0uKsk0CMX3rwELR1uPE9Qhhvv1hlgzzWQYCMh2pww3z3SUQDrekzRugg3EE5kBD4+FN4XzSmul6wBZVazEW+f/+sHY+OH32f+pZghKS0DvjNlS5dgb91T+PqR7XGCz4NYAMKIEsX1ifqsksRkF/MF6JF+7wO39WO82yCPZwQaEQDloFWenJUg11sO+du2qHHWgdCjM9KYrTi/9UVnqfegWQQGV5HEqtGRWpVkg7SawLJhXkSBmcd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199021)(86362001)(66946007)(41300700001)(4326008)(8676002)(66476007)(66556008)(6916009)(316002)(6486002)(83380400001)(85182001)(6666004)(478600001)(33716001)(54906003)(2906002)(38100700002)(5660300002)(8936002)(186003)(6512007)(6506007)(9686003)(26005)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHMvTGFrcWcrVmEvWFJjems4d1RWNDZOOFBUUExmYmY0b0tya1ByMDJxQlJM?=
 =?utf-8?B?dUNLUXFGVFAySWNQSFJGMmw0NlhROFoyaGRSQWRqT3RFZDRERk9aRW1SOXpx?=
 =?utf-8?B?MGhBcWw3VHMyN1lMdUk2SUtjTEtUZ2NsOXVESmhzdTlsRTV3OXV1RFZaRy9y?=
 =?utf-8?B?eWp6ak5TYy9JSTZWbGErc1dZS0FaY2FRWHpkSXlwZ2srVTRId2JhQkdhTVlq?=
 =?utf-8?B?aWtQU2M2RXFSUytRQm42SWN2QSs4Znd6aVIwZDMyYkd1Smw1TWl3VXQvOEZx?=
 =?utf-8?B?VEd5V1JPQ2VNZkhOYitCWHRqRGt4WVBMN3BPTzhnYXFZVnV4Wm1rZFJQVUlm?=
 =?utf-8?B?THhtS3JsMUh4MU95UXY0dDcrZzBNc2dLMWlzaTBqTlp6RStZMXVrZDRvcFdZ?=
 =?utf-8?B?aTZVM2pEVkNkNlJ6TFIwQXd6VVdDNWttdVYwQzBPUlVYK3ZuTm1nbnZJcnFG?=
 =?utf-8?B?eGkzRnNiSFRxTHk5VkorZlZWWjRsajVTVnZqazB6WFhlc0hoSUYrVTFCQkRm?=
 =?utf-8?B?LzRuYXBiSnE4RzBiOTN5NEE5amtrY0F0UnRJQWZoaVhEOGY1WkZIODQxalNG?=
 =?utf-8?B?U2hmaXV0UWkvTzBWd0hqNVVYY0p0THRiY1B3UGxxdUNZUkxEK25NNUpEMkxW?=
 =?utf-8?B?dEQydkIxbEh1VGtFOFRlcXJaeWZOUDJRVTlEZTZaZk9PbU4wSGM2dnRZeEh5?=
 =?utf-8?B?QS9MbXk5dVZYYjRZdGN6ZmVlRkdORzdBc1BaSGhzeWJ3bVRLdWxwZGMzUXI1?=
 =?utf-8?B?UTJFZFVzS3dBTGdiZlAwQ2xDeUU5bWpreGQ4c3NNYTNzazNPRFprNm9vSGpm?=
 =?utf-8?B?eHlTZGt1Njd2MGVRWnM4RHhLTEhXdHRvVDhDRG1Za1kvcloydUhtZ2s0eXlR?=
 =?utf-8?B?TXNLZGpEbEZ0cU1CdGpuamZwbUJBcGxGNnd4M3pOcmw1TnJzVmI3c2JoYVZZ?=
 =?utf-8?B?QUVBU1BzdG5jbWhFSzJ4N2tBMGNPQ045Z3JDdTdOdjBjSFVFdjBxbi9SY2N4?=
 =?utf-8?B?VnlpM3VTRERjQmJGM0xSNFhwR3JkT0dCZkQxSUZlRXhPUXRYWlM3UVdCZmpE?=
 =?utf-8?B?enIxcTBuaVdyM0E5YzZZdlBSR0RtMjlteHRZbDdwbGQ4cWJ5ajNlbllmeHdT?=
 =?utf-8?B?TVlNM2NJYkpLQ0ZjcnZxOW9jd1RKVWtSTzRMUnIxZVdVSzJ6MTdHK2FBZTFS?=
 =?utf-8?B?ZG9QU0lUQ0RHYWMrdVhhV0tDNnFzcUpIQzVRakJIbTJtS0lMczgwaFBJZU1W?=
 =?utf-8?B?VS9BWjNZaG1MREtadG1Udjh2YkR0REFGQ1I2RmlUYmxPNjB3ZkRJN2wxZ3pV?=
 =?utf-8?B?K2xzRzJjVVhWZlpjcnJqRFQrcGlGdHd1RDdoalh4ZnB3bVpaaVhKN2pPMjM2?=
 =?utf-8?B?UDNQQm9UNjJIQmdDdkNyRlJrS0JqTmtJNW5KV0hhLys1L21Wc1EzTjlGa1Z5?=
 =?utf-8?B?MGZnUjVzdGpjOVhpUDE2Qm5xeHRxc2N6YS9OeXBGTjdZVFRJNnBPb3h1VUpv?=
 =?utf-8?B?dk1kaDdZZnhJK3lYblF2NWludFJSeE52WUIzSEJlcXg1RU9mdDN4RFJFWnRN?=
 =?utf-8?B?SFAvRWp2dkIrVXRYSWpTRzAybDd4VFp6em03aFEwaWNoSkdadmgrSy9BTGpG?=
 =?utf-8?B?M0VHTDV1T3ovQ2Q4b3BvNzJXbnlGSExYWG1LVC9Da3pKTXZkeHJxelRWTmxQ?=
 =?utf-8?B?SGFTOVduRUNOWVBRS2NkMk1OV0tiaEZsUmUxOHFCMjhqaXE5dU0xd0pyMjBj?=
 =?utf-8?B?akpEbUEzWUNIRkNBVWw2ZWFNU2tlTEozaEhOV0ZPVHpIL1VGVXE5UHRrVFVw?=
 =?utf-8?B?di9ZNTBLNVdqYkFuNG9sK21BMHpWME1uUS9nM1ZoUlhwVUlGdzA4bEpxN3RJ?=
 =?utf-8?B?MWxrbUhOeDRkWVpQSjNLMGZ6bThxVEV1UnNLRStSdjBhWEVKODI3UUR6T2Vj?=
 =?utf-8?B?cU1DK0VkZldDWldqSDg4T2VLbUw5d1B2OEw3clFiVEZrZHYxTmhMNlNCRENw?=
 =?utf-8?B?RTQrRTBHMUk1TVJIK1lJRjRiRkZrTG9ldWxtMWdLY3dYYm1UK1lYODNEUHgw?=
 =?utf-8?B?WVVKZnEwWldMMjloU2prTHV0bEdpYnVJSGxxRDlzTlRKL2FyQ0JPWXhQbDly?=
 =?utf-8?B?bDYxQ3l0LzJ0QjBwWG9KYmxzYTY3VGxKanFBekcySVBZbkxrVmtzL1J3bktR?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZH/1KQtAM0OjJLSuoJgE3HYP3c9n3ZyPAhPvrdnQdPNwVPhed2QhDDzLGlN+NZweFg+LJ5XQ7id5JyJou3sCkja/fXnhFoABVNR9IBSJ7FGWxqE85uOqohQ4ikHFkxfXwUd0GJZhr81jhEADZAMljADrymIQ0M8zAPXwbQoki2N54d6roesiEgupY4MSIo1EKzziHvNVN/Lx6zAvY3/OPuMhcgemxM8VlGe0AIJAZuPo3Faxm89ePbo9YHuyi17C3zdfZkpOT/BidVjR2lyWT1/YX+0Z7jz6V0q5ipUwIPpZBQNS98ApQPx4o80Pu02EvRO+B9v3nJhWKA8Tt8+GQBXLFmpCGh2Vni3TutLPdws4L9ofkhMkvd9cYYzmlfeH70WKbxWAlmuQyQXnEifGupDJ93XZor7iw8L8NoRYaOuv+DJVxm43a0vddIQyGYWCRVoEeJ1JQrG/i8MMp7drtwEJ4sBl9Ho+YPw4pxdUvQOcj2NHjY33iMUjjndmHwSKO/frqxWnooUyYhYsT9deiF6UdMmKHhTqeZ/tDW6ra76P4QK9TkoovTxNBXWWBZ6uygNfOd3OXMjVuS0wmbAoCEDWMRJOJkFi5+6x6tysN3axthm0MmwH1qytuhpUJLFgC1J0MNG3VzlEWhuTmxIZw6s+75GZJIY3wJL0YHq4ACgdQYhqcRxH/mkOHauQdSe44WkRo/vu1qn1GcEhCO2PZ8TdbnVWT3t7Enff2teRxOttBUQv8AM66hn8qpMGuMwckclus8R+iIO6eHGg6p7bWnohmkC1sKWbF6Jkxt+AAqRLvOgCeJKpQglfmXpCDZet
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766ad71d-d05c-4f1b-6aef-08db34f3f92f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 10:04:26.6749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAov9yYDQGiSrqY7surtFpGMNMINFytH1pFpVooB4mwoySgSwiJIYSmHNIYbsWNK002qT79R6yd0gJZcMA1ymw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6924

On Tue, Apr 04, 2023 at 11:19:08AM +0200, Jan Beulich wrote:
> Besides a printk() the main effect is slight corruption of the start
> info magic: While that's meant to be xen-3.0-x86_64, it wrongly ended
> up as xen-3.0-x86_64p.
> 
> Note that no known users exist that would have developed a dependency on
> the bogus magic string. In particular Linux, NetBSD, and mini-os have
> been checked.
> 
> Fixes: 460060f83d41 ("libelf: use for x86 dom0 builder")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> RFC: While Linux works fine with the adjustment, I'm not entirely
>      certain of external tools (crash?) having grown a dependency. It
>      may be worth noting that XenoLinux and its forward ports never had
>      this ELF note in 64-bit kernels, so in principle it may be
>      reasonable to expect that no such dependency exists anywhere.
> 
> Prior to "x86/PV32: restore PAE-extended-CR3 logic" that (meaningless
> for 64-bit domains) VM-assist could also be engaged, based on the ELF
> note's value. I expect that change to go in first, at which point the
> description here is going to be correct (in not mentioning this VM-
> assist aspect).

Will look at it now.

Thanks, Roger.

