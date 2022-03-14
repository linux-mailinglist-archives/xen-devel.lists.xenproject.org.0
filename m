Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1F54D7F91
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 11:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290097.492009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nThgP-00021N-72; Mon, 14 Mar 2022 10:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290097.492009; Mon, 14 Mar 2022 10:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nThgP-0001y9-3E; Mon, 14 Mar 2022 10:12:09 +0000
Received: by outflank-mailman (input) for mailman id 290097;
 Mon, 14 Mar 2022 10:12:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=knG6=TZ=citrix.com=prvs=0654505ba=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nThgN-0001y3-7u
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 10:12:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31ad074e-a37f-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 11:12:05 +0100 (CET)
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
X-Inumbo-ID: 31ad074e-a37f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647252725;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zv5uAO8qzBqigJWP27coeik+Bss8ugvYoY4kO9XMijU=;
  b=NMncnTtOtXiZo7oTjZRdqQG/JJ/n84D0Edj7v7jxViJoIuDteJfdPdGG
   GuVd3BzoKuK/huwPuYwKyqD0KKtw0ke2FvTWz8+3o/TLy3O01hBZLYNCZ
   hA+PbZujm1/XToU4w+4t9T+j7hkggdaSQSlyliDctKY5rJsj+cKplMtGd
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65630459
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0kCrQakh0qnJ6RIxRTNDuWfo5gwnJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOWDqObqvcN2L9f9BzaI+z9E5T7MSByNViSwQ4+yhhESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiWl/V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYZzcwZ73wh9YhbyJpHTlRG6tG47zeGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6uAP
 JJFNGsHgBLoPCNSNlo3C8MHkOaWol/nbWZmuk+buv9ii4TU5FMoi+W8WDbPQfS0QsFSkledt
 3jx1W3zCREHN/SS0TOAtHmrg4fnhjjnUYgfELm58P9Cg1CJwGEXThoMWjOTq/SjllS3Xd4ZL
 kUO4zcvtoA77kntRd74NzW7rWCFuFgAWtNWO+w89AyJjKHT5m6xBHUCCDhIa9Uktco/bT0sy
 lKN2djuAFRHr7m9WX+bsLCOoluaKSUTaGMPeyIAZQ8E+MX45pE+iArVSdRuG7Lzicf6cRnyz
 CqNtzMWnKgIgIgA0KDT1VLahzOhoLDZQwhz4R/YNkqn5A5kYI+uZ6Sz9EPWq/1HKe6kokKp5
 SZe3ZLEtaZXUM/LxHflrPgx8K+BycacaS3gnmxTI6IQ+SyC3XijZoNJ2WQrTKt2CfosdTjsa
 U7VnApe4p5PIXenBZNKj5KN59cClva5S4m8PhzARp8XO8UqKlfblM17TRTIt10BhnTAhk3W1
 X2zVc+3RUgXBq18pNZdb7dMiOR7rszSKI66eHwa8/hF+efEDJJ2Ye1cWLdrUgzexPnYyDg5C
 /4Fa6O3J+x3CYUSmBX//48JNkwtJnMmH53woME/XrfdflU/ST57U6COmOtJl2lZc0N9zLugw
 51AchUAlAqXaYPvdG1mlUyPmJuwBM0i/BrXzAQnPEqy2mhLXGpcxPx3SnfDRpF+rLYL5actF
 5EtIpzcatwSGmWv02lMNvHV8d09HClHcCrTZkJJlhBkJMU+L+EIk/e5FjbSGN4mVXPm65Fh/
 +X+ims2g/MrHmxfMSofU9r2p3uZtnkBguNiGUzOJ9hYYkL394Z2bSf2i5cKzwskdX0vGhPyO
 96qPCol
IronPort-HdrOrdr: A9a23:4kXOe65YIXmTMCHw1QPXwVGBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVdUiz9bUN1KtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmHp6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcEIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.90,180,1643691600"; 
   d="scan'208";a="65630459"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XE5aaaZk3nY1rLF9adNvXsDpnkDCVDz810POPLMEllTXJAOZc2LMcQtdaLBlwONDIfwRpUB3vxVn2J23JVORHd5RF/4bsQ/hFRJBa+Vc5TbBlleOTtiVSQB3sBzgPP+UnhUd1I1bi6oH4+Ng31OzY60KEISWGPmgG+eFARifjLZ36Ktu+QSLbo/yIgNkX3amDrHZVVWIX/VD6Z1PBwKRX2G07r9WSml2jPNMZVSst+ukxEhMtPHVXAArKKPoZARrb1qIplxcTARiFEc40HqowGi7wg0a83uJEhMt5rMJ29hkZmfIIbaQbcQn1csNqSl9Utfwg5IXvYgymsNUOPL0JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Jb21lfm/wSqQ5efYaylQA2Z6Zyxhioh8co7CAx/ljE=;
 b=eCGohDRowWqTcMj6zcB3rofZGy5VzH9cB3jnGQTPoGsKvPBWZq42tXW6sS56YGRoDFY/EQ99QoFv59aGQZCBtFS4ubQpicDqusXmumlRH5fgyw83ySuBrHyVZdoAUHvEcRrCj3i8eR7iD3hPHdQixyJeAsar7yiBdTOg7JhX3hghe+QqrExDO8D6eiozQJ6s+yiXcBtG8xI6zQiXjSEpyfBTdX4EN/4ZeY/Ig8Ftfj666RpM4WqlDOICZxTOY9SBnsmg44zdkxo4U0fS1uDNSlI7n+5ZSgfcYHE3AH1aqRPaHqpG8bFVYTFRkXA1TkYxChlTl39ImPaNoN7p4U2HmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Jb21lfm/wSqQ5efYaylQA2Z6Zyxhioh8co7CAx/ljE=;
 b=hag3Q4pr83rM0fDkm9HKxKO4Ml17t1lEzftXI6Yf4iKz/8ZBaDzf08na9H9WoSJDpWXQnScW8lHpXu/r1FH/fvcUndfx0xxXZZpMvRg/d5PyhDJTU49sivHK4Y+yZBxdMKv4VzkAEsXRjqFravtKs6NW18npGwQpJL1wNOkYmyE=
Date: Mon, 14 Mar 2022 11:11:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v7 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <Yi8U565Ghg5qomFh@Air-de-Roger>
References: <20220311152107.2918-1-jane.malalane@citrix.com>
 <20220311152107.2918-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220311152107.2918-2-jane.malalane@citrix.com>
X-ClientProxiedBy: MR1P264CA0139.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0c6464c-41f8-44e8-9bf0-08da05a312d0
X-MS-TrafficTypeDiagnostic: BN6PR03MB2578:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR03MB2578D1B574FD5A63D6EB92088F0F9@BN6PR03MB2578.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDFGQ89Zk6I+ZGqF2zdeKM44HjnTExJtXunkaOQPMfJM+EEUJtHePsuwfzwEYMXMPfGhw5+ChisN0xr742PFo7BjgUkRqJUyy8mCObqlFtqDFyH6CpO/XWChKlMQiYYH6dbBf8BJv7dgokPJ31Peq2DJXfY9fKL1POHN+IGB4Z9gW/5cCRXHgOiEiYthRpFmq/cUTQQ2y35v4g0KeMQ1UDBodUsBJGPZg+jclspfi+f1yoVwvbPXkyUPmsrsFbJKKLOhytW+Br3U4HZGqABC47z5jk9kGgsNmAvKMQlbuln1VwAArWi27pZaZI+qfZo3yN0TAT5bri3Uk3BsoMBGzNlmt7zsftIWGHfkl1jE6W2tm+6CQY+2/yegQSNoma6HeGdH7ovqfWFleslxOh+sKWGVSZAo+DVgb6grYvTcdCvLu5q+ZsiDdXw0Vv49LqN1stjWFtavYG201/GAAE9Mo8min+ilRO45jVq/99Rn6U4eLUr4x1LLpgV4bTLMeKxcb1xOVzY07JSC6cMkZ9+YUw/uacdqLN7Sb6gymguDtbGnNnbXZz1lsgZwGn7gM11cPSpm7+iaPJWYHc05lR8jjwt+ZXo+UcivMJxlc/mctlIAwtIuKiBYFgZQem5Xn2foRx7kTdVhI+cHJrnUUrwzLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(26005)(6862004)(186003)(8676002)(4326008)(82960400001)(66476007)(66556008)(38100700002)(66946007)(6666004)(6486002)(6636002)(54906003)(8936002)(508600001)(86362001)(6506007)(316002)(6512007)(9686003)(5660300002)(85182001)(33716001)(7416002)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHZHSy9ZUG9UbUZrbjFhekxSMXg4WjVablg0TUlOVHRaV0hnWlo2OEIwQnRD?=
 =?utf-8?B?NXFjUHBTODBZdXphSU1RWldwNmcySmtxTVBobVd6RVNpMXJzeXZYSG5TSmlZ?=
 =?utf-8?B?UnlUR1RYNmtmV2dOcTByWFdZMEUyWW1ZRFNvQXlwMWJHcmdENXhwcG84L09C?=
 =?utf-8?B?TEJWSmIwdjBxcHphemg0QTJ5L0tZR0pyeU5JaldWbFZvQ1E2Z01WZ1NJMSsr?=
 =?utf-8?B?K1JrdUhTakxpNE1CY2Zidm13bnZmdGRrMVI1eGdRRFZHVFlVTGdJSDFUVFFo?=
 =?utf-8?B?djZRZ3F5d3BPL1hjb0FlcE5uVXAwTUhya3VMQkNhSk5sS3BPOE1hbmdBZFEw?=
 =?utf-8?B?SzlMWmdaODZRdVFSSTJhZmx2STJ2TVdXK3AralMyRzNRUjFIeGg1cFVNUXp1?=
 =?utf-8?B?RjJuc1NwRUo3dXNqWXR5VkNyMVhSSVlkNDB2dHIvc1MwM2FtcU05bUJoaGcr?=
 =?utf-8?B?cmdqbkxCWitmbkNNcVA4dEZNUDYzci9LYVhzMEttVkpBaGNLTEFOc3JmUnBh?=
 =?utf-8?B?Z2s1UEdTL0hPOUExeldtVW5CVmxmdU00cDVVcWVIVW0zNjM0TE1ndlgwUytk?=
 =?utf-8?B?bE1pSHoxNVpGSU1UYk1vZlNxMVBPbWdCamF0c3dMcXVxNWtqcjkrK0JsKzJr?=
 =?utf-8?B?dnlkTERUOTJ4Yi82OXdVT04zbzFVK3c3SjJIUEYxaC82SW00YkIwcXh0RDI2?=
 =?utf-8?B?SWNQSUd4cDBSL2ZJNWkzay9TS04ybElDZ2xYOTdNbW54S24wZWRtS0tlUG5p?=
 =?utf-8?B?bjhOZC9XcEdMSlJFdDNxUmxqbmR5SU5VOHZWeFZoR2pXSjAyd3hTTDBrZENk?=
 =?utf-8?B?N1h5NU9KQk1MakFOYlVITnhWcEdnUENBNkw5UmNqb0FHZU1HdXdPZkVqRHg1?=
 =?utf-8?B?VkRLa0xvYVgxMk5SSlJma2Z1WUNzMG04QVUrTWovSnNyYkVQMmZPWkJOVDVt?=
 =?utf-8?B?dE9IMU0vdnNvbmR2MEgrVEJveGFLeUs1dms4RjVhbnZrZUVISi9IcC9Ud21E?=
 =?utf-8?B?TkJNNmdkOHB3R3RVNGJITGx2YkpxNW93UmhpOVRUcnpacWkrYkh0Ky9PeUFX?=
 =?utf-8?B?U1hjYWpVbHdJNzNNejlvM2NJUFlNU201OUFGdEhtaVBBeGlSMk1QOWpianlV?=
 =?utf-8?B?OWt2RlUzOHlDTVg0bTZzZHVPZDZWQzdvdWtZbVZrbWRRNnVtNWhkNHhnNWt5?=
 =?utf-8?B?WlpVNjY0T3ZCUjM3Uzk3OXI3bGw1SVJWVGRvbzZ2VHExbnJGWFF6K1paeEhL?=
 =?utf-8?B?aEZDRjRBclpReHQ3QVBMQWcxd3dtOTl2RmJMRGswS3p2bDdYQnpVV3k0Y3RP?=
 =?utf-8?B?b1JuRU4vZUV6cHFId3RORzYyYWhJeThTTzdLVklnZUlWZVFseFl0T0dpditv?=
 =?utf-8?B?Qi9NWjBGcVEzVi91eFYwSzRKV0NSUUVKdGlOWjJaVEQ3QUNrSHdhbnVIc3Zr?=
 =?utf-8?B?Q2tzeDVHUzZPK09hSXV4am4zZkZ4VmhwRkxBbEt2U3NLclBQeVJ0OE9mRjNm?=
 =?utf-8?B?T08rUFJTYUIxekNkZEJjakJMSlJ2UTNrSjlVMG9hbjVrY0YrOEVqdHR4bVVP?=
 =?utf-8?B?VUdHZ3lIZVlQWlNOblpVWlA5T3RiWC9rOVB0aHNOcWdrRnlqbzFKVEhSUXFN?=
 =?utf-8?B?MkJ6Y0lia2xMQU82ZlAzWmxST0tybTNsbjViMWovTk9oS1NGZzNjZGltbklj?=
 =?utf-8?B?dFJuazVhdmpVQWY5U2lLSEprbmNUTDYvRmtkWGRpZ1lpcDJuVS9melJLTGwz?=
 =?utf-8?B?K2crSTRZN3AxdHdaY21CeFhFR3NUTzRncGRxVVZGMHcvTmVIaGJ2cjRLa1RX?=
 =?utf-8?B?aEVYUjI1S2Q1eTI4TEdHRHZOUUVnUVBzZ0hsYUJHaDJ2NHFXTk55M1VGUDJO?=
 =?utf-8?B?YXlPa3ErV2UvTHFGYzdUelNQVDNDQ0U0ZkdKaTlSeXFVNTVSbWlXODh4QU1G?=
 =?utf-8?B?aDNsak0ydlVmTm5YTVZiRjVPdlBYMzltdEVER3c4U0tlTWx3RU16eGlMMGUx?=
 =?utf-8?B?clkvd2ZYa0RnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c6464c-41f8-44e8-9bf0-08da05a312d0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 10:11:58.1846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2ufmq1+IfnCDLtBu6aGvwB77xWr/o9NYzfEIrgBX2jysYfNEYCFGKvuLrci8JKbfWXGO83XamTuzBK/cs4Iwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2578
X-OriginatorOrg: citrix.com

On Fri, Mar 11, 2022 at 03:21:06PM +0000, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC and
> XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC to report accelerated xapic
> and x2apic, on x86 hardware.
> No such features are currently implemented on AMD hardware.
> 
> HW assisted xAPIC virtualization will be reported if HW, at the
> minimum, supports virtualize_apic_accesses as this feature alone means
> that an access to the APIC page will cause an APIC-access VM exit. An
> APIC-access VM exit provides a VMM with information about the access
> causing the VM exit, unlike a regular EPT fault, thus simplifying some
> internal handling.
> 
> HW assisted x2APIC virtualization will be reported if HW supports
> virtualize_x2apic_mode and, at least, either apic_reg_virt or
> virtual_intr_delivery. This also means that
> sysctl follows the conditionals in vmx_vlapic_msr_changed().
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Note that this interface is intended to be compatible with AMD so that
> AVIC support can be introduced in a future patch. Unlike Intel that
> has multiple controls for APIC Virtualization, AMD has one global
> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
> control cannot be done on a common interface.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Given the request by Kevin, I think you should at least add a comment
in the commit message that exposing the feature is a pre-requisite in
order to make it a per-domain settable, which is the end goal here.

Thanks, Roger.

