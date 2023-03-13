Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C36B776E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 13:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509251.784678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbhGo-0003DS-7b; Mon, 13 Mar 2023 12:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509251.784678; Mon, 13 Mar 2023 12:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbhGo-0003B3-4c; Mon, 13 Mar 2023 12:27:18 +0000
Received: by outflank-mailman (input) for mailman id 509251;
 Mon, 13 Mar 2023 12:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=koCJ=7F=citrix.com=prvs=42903c55b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pbhGm-0003Ax-RX
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 12:27:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6229b5bb-c19a-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 13:27:15 +0100 (CET)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 08:27:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6024.namprd03.prod.outlook.com (2603:10b6:208:316::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25; Mon, 13 Mar
 2023 12:27:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 12:27:09 +0000
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
X-Inumbo-ID: 6229b5bb-c19a-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678710435;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TII/Ubu+t4CsnA6FCYs5Sl8c453IDpuoZ21wnpi9bVw=;
  b=EessVTUAYltUssRKol/VelS5YLSV4eewrgVZ7dZ9eGHduA9JPEDDYAqa
   1fHYhezCaeUeTJHtWleFHIIxYfZkDEznb/B50YrZ6myKzKD1f6jPwnhAW
   3MFyQqgGilcRWU2KQP3qqWNOv7wsOl8ImQknCk/AbrAocoA3XLf69DkH5
   Q=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 100600917
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+oX4XayxPaC2pG3rQgN6t+c2xirEfRIJ4+MujC+fZmUNrF6WrkVSz
 WVMXmrUaa6INGCmfNwka9+z9ElXvZSEz9VjGwps+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPKsT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVpK9
 ewBBQEIVAiSiMiO8b+qRflrpMt2eaEHPKtH0p1h5RfwKK98BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvTaVkFwZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjANxKTOzhqZaGhnW292cOAQw7c2GghvqEjmu4YvxfN
 WILr39GQa8asRbDosPGdwexsTiEoxcaVPJZFuF84waIooLW6QuEAmkPThZadccr8sQxQFQCz
 USVltnkAThutry9Sn+H8LqQ6zSoNkA9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 xiDqCUujrMfgNRN26im9lDKmRqlo5SPRQkwji3cXnik9R94bYjjZIul71nUxf9FIMCSSVzpl
 EMYlteX9vxILZCJmCGHWuwLEJmg4vrDOzrZ6XZlAoMz/jCq93m8dKhf5Th/IAFiNcNsUT/uZ
 kDXtAIIop9ONX2lRaZyb8S6DMFC5ar9EdXsEOLUZ9xBSpF0eEmM+yQGTWyRxmHklg4Hkaw5E
 Z6efYCnCnNyIYRqyiCnAdgU17ADzzo7g2jUQPjGIw+P1LOfYDuQVu0DOV7XNOQhtvvY8EPS7
 spVMNaMx1NHSuribyLL8IkVa1cXMXw8ApOwoMtSHgKeHjdb9KgaI6e56dscl0ZNxsy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:SCkT0a65f6b5DvDy9APXwKfXdLJyesId70hD6qkXc3xom62j9v
 xG88516faZslsssRIb8+xoUZPoKRjhHPVOj7X5U43PYDXb
X-IronPort-AV: E=Sophos;i="5.98,256,1673931600"; 
   d="scan'208";a="100600917"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWtDmQPay4QdhkOzEACnxTuB6Tqvka4FDSaWLTVQlGQbKUxwygCJtDw27L7gEESAnaz8VFGJB+YLOeZIRngQ1VqQKK/+x48CAPigWh6/wUDcWGHoLDavE/A3N2o1nIoLDChddC+ferTHHNuvX9pRjs9r0z/vxx4pn5Lp+GfG0gI/2XB9VUvYw4JvT7eYwC0QSR9Lc0AwofewuKdi1j3nEfFc34VE6An3mokd3ssCwLWrAUJCH8VyR9H/gM6Vxt6xI0dqDhrnflDZncndwr4/gppmoPye6M92DVb5rrF1hxoCCyCKI8ZWAx6VNUxmo3lwuxnTcF77flI7SXEuFhyPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TII/Ubu+t4CsnA6FCYs5Sl8c453IDpuoZ21wnpi9bVw=;
 b=fi30N3DS12Aa7f491ZsbtDtALL7phvPARIZuQRTqUK+9XT1rE3mEID0mIXsZysztDksxTUrlZYFhS9kM1tWuwxdG21dryXpziXfsY6L0SHnuqnMBe4e12nj0E/xmCc4tn5ZM5S6sYzgTsdKqUnW16tWJ+DQpTqAyJQkVX0rRgranNR6MGWPMierbsm0XOIEcRKzQdg/LTKy5dJxCMXI4/X9XSxcSnbyy8frM5mmu1NHIQYZU/y6IaGwpl0vCfYuYCLdNaZ7ay0mxuHlg0ipz2kj4F+yQDlF3hC5cyz8fajCKf4waD0659fFg+w6AbOD+jx6SY19hFnCl4r1MDISAOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TII/Ubu+t4CsnA6FCYs5Sl8c453IDpuoZ21wnpi9bVw=;
 b=Wwhg1Cf6gHOq8x0XxT5kKW97iCybxdCQTpIiDmNaffWoWMwk2lVU5HLtQZSILF29ro89VUTWGLrtvVSlxdlqp8Mv7y0MH9WguKNXKhfWiHfO+XgAbZ/t6oYTDYUmU3v6k/rJvsSTjL2s2yl7/F4BN5nImBLtXpiwTv1bDucLl7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <93b735ba-ac00-0190-f8aa-0d85af3b8c13@citrix.com>
Date: Mon, 13 Mar 2023 12:27:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC XEN PATCH 1/6] x86/pvh: report ACPI VFCT table to dom0 if
 present
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Huang Rui <ray.huang@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Henry Wang <Henry.Wang@arm.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-2-ray.huang@amd.com>
 <682beaa7-736e-432a-3525-1368891641c6@citrix.com>
 <ZA8VNkfHUMjvtUnR@Air-de-Roger>
In-Reply-To: <ZA8VNkfHUMjvtUnR@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0175.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a03d1f-409d-4ccd-6623-08db23be43c7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ExX77Cm1RltyolNLCouEoYTcpgjCSXuVeGra1qXfHHzAMx7Q2rbQV0PzDOdtOwKHbfMQAXpc5m+dLuQsI9KMFlURF9MwCVZ5D0hLJopkVz7ziEoepJLfX3BvWl4WjUNxhEsez2rJXkem+INM3BRw1tM9mDMvQQL6nUg+x2Bdd2rFXiWdeonWwijEJq8f5X9BT4YkxoyzkEhPYnyyZKB5PTnGqU6Id+8qCvVg0i0WUqrMyZ4gX0NbRBjmbnZ70cISVPWv+wWRYzJLTbesPowg463FToqNh3iwc6udGzth9psYq8sfu0aBUbVP6HI8q30zaf3zRgSwHHBiIzpRKgLZRp28l7Ul8ZpucP9osI/sTiV6v4aNf1Dkiw+mHgyydVr9B5qf1HzIxz41sm0fCN+kQYull0FPfpy2gfewxj1vEB9kuL9dITL5gQJrEF/L+f6Xgu/hyAb2cYtSb0QxfvFMNxXCp24cWriIla7s/cXeYIUkvbOOpO7+xH3q5teNbUxMyqkHurNkxkF8nwMfJrfn/fNNwiHxG+7OHaDw0KGncnmV8stKfnjgVvKc9Lbo8ObkGglRLhKt4ifaLlXPiMPHUuZ9v2vBeZ4D6fa6uERQpFE5Tuz94c8KOAV+LAprHk3TDnCtOw5WACCr2Rzt/fEnaXxbxNHMaOkr2zYI9owPZF5hukqSSEOWeAxkIUwyb2/VhjoM3Si0W2EpuiYCzJAmh+LRJZ7EYQDFuBNu3MTZPEQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199018)(5660300002)(7416002)(36756003)(83380400001)(186003)(478600001)(6512007)(26005)(6666004)(6506007)(6486002)(2616005)(53546011)(8676002)(66476007)(6862004)(66946007)(66556008)(4326008)(41300700001)(8936002)(86362001)(31696002)(54906003)(37006003)(316002)(6636002)(38100700002)(82960400001)(66899018)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVRKMzZhejMyU0xYTHk1TzBic3d2YjlSdFhHR3FZVjFLZW9Pd3JZeFNzQ2dX?=
 =?utf-8?B?S0xyejZOcnR3TUpLQ3crUmJjdlh5d2tMRlRNKy9rUGZzOXZOdGlDMkY2NHVM?=
 =?utf-8?B?a09kNG5RT083Z21naWgvMW93eEpBaTl6RVV0M2lIYjlTU3M2aEhGL25rWllY?=
 =?utf-8?B?NGIybHJHSTJ1cEw2a3FGeGZPREczaHpqOFRTMlNyVkxETldhRGp0WDNyOGRV?=
 =?utf-8?B?SGx0c0NENit2eHpFbzU2bWJYVVFtdnlNaG94RS9IR25CZXVHaW9hZ0R1MFZE?=
 =?utf-8?B?emRrc1BVVEZsYzg0U2lydE9jRjJCaUxvSjBjT3phOWZ1Zy9PTk9oaHdiM29p?=
 =?utf-8?B?QkUzOVVYbmFZRVlzWHRnZVNLZmlCWFdiRVJuaytjdGdSNWZUQlg1SkdPNnc4?=
 =?utf-8?B?cUZ6cVpENk45UkV2b2xFY0hCTTliVHA5S0JYNUtaQlVCSUZRSjE3Q0diaFVs?=
 =?utf-8?B?MnBZUmpIR2RWTmNoRW8xTzJ2NUlvYTM3NGU0dXI3d3NRTXRUMkVyUzlabk9n?=
 =?utf-8?B?WGZHMVdVZE50Q3ZoNmw3SUhnSHcrazZGdFZTdjVzMEczNjhENGs0em56RHpl?=
 =?utf-8?B?ak1qanc0U2FDZHZURTFOVlZsZXRjS1h2NVdUZjZNcEJyMy9BaFpHUEZma0o0?=
 =?utf-8?B?RDNPV2VDRWFYVlhURitKMHUwSWJNSkNETTdtL3dxM0dXbjdEejBCdC9QSDJv?=
 =?utf-8?B?VitGUXdZOFNLUi9wNVRzdTJxK20rU3ZSV3RCUnRBU3pyVHZxRkNVOEk5VUpE?=
 =?utf-8?B?R0RjTFBmQVYza3Z1OEcvano0dUw2MEtXdTJxZFIwZVJpWDM2dGRvaTkyVllE?=
 =?utf-8?B?bWpCamtmOWxVSDJ6SHc4VGh1TWZXQy8zWkltblJZNWZiME5TMjZBYVE1VGd2?=
 =?utf-8?B?ZXEvcm0zUFQ2OVN3WCtkeW9oT21lT0Vadmc5OVhSbnRHVE13RTlLbVZ0R3NZ?=
 =?utf-8?B?SkF6cVpuWDJMR3lKMHhUY1V4YXFDdStoVHg2bjJZR1pHYmJ6eDVBOWxiTmNh?=
 =?utf-8?B?V29mL0FpdlRINFEvZFJqZ0NMY1g3Qnp1QXd6UHluYnNZVTNNWkYydVlkRmRk?=
 =?utf-8?B?SDZSVkF0Q09Xcm9Uc3hCRW1RWisyVzI2NkRaQjY5aDZCK2wvTEJ5KzBoV1da?=
 =?utf-8?B?WE5jRGZMZFBocHpKWnBQTmdKNTZrUzRHUk5VcExQUXlVMWZnYjAxUGJOa29L?=
 =?utf-8?B?ZzdWZTVET09FT3JGTTMyMC95cWorY3NkdkZvOTBBbDJqbWM2QktqWkU0SDRm?=
 =?utf-8?B?MWZ2SGdEbEkrUW15cGtJM3NxeUp1b3EwaHlZc2NZWC9jQkthZVBlVjY2TDQ2?=
 =?utf-8?B?cnQyMTJtemFmZG1seENVdFhxQUFLSDJRZEZhT05iS2FMTFdhSTQvR25UR0sw?=
 =?utf-8?B?bFJBdklXMU1qU0pqM2xGVEE2OXhZSG9Hc05OMnFGYTRvYTdsRng5bUh5cnh6?=
 =?utf-8?B?NzVXbVJKbnh0OXJzWjdVWm5uM2xERHVGRjUzRk9vVWNDNzBOdXpXUVIwZGdT?=
 =?utf-8?B?eGVpbzdCUUJvYVdaNzFrRUowSXREa043OVkxaWhVdUJoRlVUcCtPL0lmUEdJ?=
 =?utf-8?B?VVF4WWxXNmlhdTZzN21kemJFSXFGMWdDMTNOTUJMVmE2R0RsS25DcmNnWDlr?=
 =?utf-8?B?dUxpcjZ1NzlIOXR4R2RiS2xPVzJ6d09rYVozc3habXAyTFBVdWRoMzMzYkRp?=
 =?utf-8?B?SXZwUnVHUWxjNFFlKzNKRkJhaVE1TjVzSkFMNzVYTGpzR25ZTzhuVzZwWDFP?=
 =?utf-8?B?RnE5NHJNbCtRUGxsYy9xUVNBTG90RE9lRjRPY0tVQjd4YjUweHRnbDlyTWpP?=
 =?utf-8?B?UkpOYlIySnplQjY4ckVJMHU3MnRWYzl1OFlHY1F6ZTNBdnY4YTdsT0dNYXA5?=
 =?utf-8?B?TnNTMEZZNkZCanpGMUh4V1FZdFBDMUZmRHhGNDRNY2l6a21ocEx3S1RZbFJ0?=
 =?utf-8?B?Q0tVSWFENWtOYm1JcmRlbGxkMVliZndUeHRWTTBvOE1TUWoveW1SUnlXaWNZ?=
 =?utf-8?B?ZkFWSkloM1NIbWhwMnVhc0RNNG9ONGZ1V29NWmdoSENUTnpPcHVrTEpwVmdX?=
 =?utf-8?B?TE4wWG1aZC93bklZcjFnVXA1OEJWN1FDWVRoSEhlNmFRYXliMENyUCtGVFNX?=
 =?utf-8?B?eVJha01FZTZCTFJlZU1GUjdNRkkvdVcyMStkbXg4elJHcnJlcVVqaVR0V2dH?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qss8w3AKofikWGeUZaRlP2WZy9etdYt6xCo1PIh20ZGXuNV4GoZa+debXJHOOHqrbNmwwROCSfBu9625ucEaBIJ2kag46IxWrvaPO/zBExKFw7caXPeaHVDn1v9X5YkopdlaJrkFbE+5r7mpTjycTvCaDzZEcsv9H0PXfnIU6VED0zPbL/7TTRcQEAo7tEaf2NSukrgt/RcQha8f5HpU5JOA8+nkujDhC4LESuo1jMh48rjmzjSQjjaLLIoalPrPVgoC0EW9FIgf3SZJhndjF3iWMq6xZXziFU/6P55Qel6CYXCAk4NlTQmmlnMULwVCCWGDmRan7D+dg2BocgKxQ/V2oXJ6fG5rFVA+owy30+pLFWFxGYAnNwZNM+NuPCW4NVTdmSrlA7T4sPmL5ZhTiu0qCAe8cXdoJc2PuaKY7z1ZRfbVX//q5htNUcjSMll3Dz6KrVu18HyyRCxL/9G3a6Z7i5K6b8XkvJ/5j7RHbQgdxeaar/byMhyus40UppPc+pq3rYZ4a1QRAD1EiOV2G7nGhUO8affbeJ5nPHZDwJqBjJ+QHV45PzlcrknWPVNGoD31i1Tdd5RCXrw606JfRxtjwVl9PZdAguj/m5hqbCU2cLbOyIMe1AsUA17XVHbDr3nTt00gsk59mH8H7Z7CQ6iqNckYldFMzCtBY0pcjMq8T1b5l04y2cKbH9DomnAkrb8EzLQPRigXPuCBuxtGN6B5LrKzzovoGAER8TtP3q1sEJROXAu1DT/3UjII2QJ1Dz68UwAZ2VS4IgqQgdLYKKntv6VwZiydleAH+uFA35OQKX3WuqkqUGZcZ6Z7rg64v+E7FBh5uo6jvOmvq7i7jsY2XdXE/oEiaYfvZkxthKgZdCfXz6dTewqv0wcS/CifXZTxOm9OTYPO6FUwpgsZ4Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a03d1f-409d-4ccd-6623-08db23be43c7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 12:27:09.3769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4R1Qm/Nw8rJq5MxaPtbHdL+vuWjkmtbxeImvU6RQVeeMtVp8/oKNTE0I1hgs5PsSDuzWNnpEN6Ys2hcp4R9qOtxM5An4zePWdww88WiujU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6024

On 13/03/2023 12:21 pm, Roger Pau Monné wrote:
> On Mon, Mar 13, 2023 at 11:55:56AM +0000, Andrew Cooper wrote:
>> On 12/03/2023 7:54 am, Huang Rui wrote:
>>> From: Roger Pau Monne <roger.pau@citrix.com>
>>>
>>> The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
>>> from the firmware instead of doing it on the PCI ROM on the physical
>>> device.
>>>
>>> As such, this needs to be available for PVH dom0 to access, or else
>>> the GPU won't work.
>>>
>>> Reported-by: Huang Rui <ray.huang@amd.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Acked-and-Tested-by: Huang Rui <ray.huang@amd.com>
>>> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>> Huh...  Despite the release ack, this didn't get committed for 4.17.
> There was a pending query from Jan as to where was this table
> signature documented or at least registered, as it's not in the ACPI
> spec or any related files.
>
> I don't oppose to the change, as it's already used by Linux, so I
> think it's impossible for the table signature to be reused, even if
> not properly documented (it would cause havoc).
>
> It's however not ideal to set this kind of precedents.

It's not great, but this exists in real systems, for several generations
it seems.

Making things work for users trumps any idealistic beliefs about
firmware actually conforming to spec.

~Andrew

