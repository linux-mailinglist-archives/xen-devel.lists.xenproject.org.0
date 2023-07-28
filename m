Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987A876728F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 18:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571525.895584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPQnI-0002Lt-LA; Fri, 28 Jul 2023 16:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571525.895584; Fri, 28 Jul 2023 16:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPQnI-0002Ja-IN; Fri, 28 Jul 2023 16:58:24 +0000
Received: by outflank-mailman (input) for mailman id 571525;
 Fri, 28 Jul 2023 16:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hHC=DO=citrix.com=prvs=56653927b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qPQnG-0002JU-A8
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 16:58:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f334442a-2d67-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 18:58:19 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jul 2023 12:58:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB7029.namprd03.prod.outlook.com (2603:10b6:806:334::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 16:58:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5%4]) with mapi id 15.20.6609.032; Fri, 28 Jul 2023
 16:58:12 +0000
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
X-Inumbo-ID: f334442a-2d67-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690563499;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wpAqQfh3njU2aKSASYfszF0VddhYyQy6a6/XYA4m8tI=;
  b=J1irVYHoDY9eCtCmXWix4Iuu7hfHJWNUKybpyYi5oPq8+4/+q/Jz7taE
   YoZHJoOV6k7yGhLhFPM71nGnOd4nL7OT/5dux3n2umdLg6T33Og7iRnza
   GtFBc81jxf7KCm9bxrxtdUa8vCYmTGx3zeL04IC6VBgm3SF+IvT57KnVW
   c=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 117816575
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yuf6v6uliFB5ShHDqVwgCSd6ZOfnVPBfMUV32f8akzHdYApBsoF/q
 tZmKTqEO/uONGL9fdxwOYW18xsPuMfRmtExTAJvrHthQy4W+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5ACExyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwGjkBUjSixNyP76+1RuJHvpguFsXQBdZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60b4C9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThqa4z3gDMmwT/DjUzZV2euuuS1HLjRslyM
 mAvuSkVj5gboRnDot7VGkfQTGS/lhcYVthZFeEg70eTw67Q7gSeLmMASSNNLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRny3
 jSLoS4Wl7gVy8kR2M2T913dnyiloJSPSwcv/xjWRUqs9AY/b4mgD6SW7lzc4edFPZyuZFCLt
 3gZmOCT9OkLS5qKkUSlQu8AAbWo7PatKyDHjBhkGJxJ3yup026ue8ZX+j4WGatyGsMNeDusa
 kmDvwpUvcVXJCHzMvUxZJ+tAcM3y6SmDc7iSv3fcttJZN52aROD+yZtI0WX2ggBjXQRrE32A
 r/DGe7EMJrQIf0PIOaeLwvF7YIW+w==
IronPort-HdrOrdr: A9a23:XAi8Pq73sWqwjMPhTwPXwMzXdLJyesId70hD6qkmc20wTiX4ra
 CTdZsgviMc5Ax6ZJhCo7G90cu7Lk80rqQFhLX5VI3KNDUO3lHEEGgI1+XfKlPbdxEXWYRmpM
 BdmwQVMqySMbDa5/yKgjWFLw==
X-Talos-CUID: =?us-ascii?q?9a23=3A8p1o1WjgtaJBChkU7nibeUy7OTJuQHTR8FPxYHG?=
 =?us-ascii?q?BJntnRLa+cQOdwq9fqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3Asssz9A1E+IGfr6VFpJpO2QBN8jUjxpSoLVsfuss?=
 =?us-ascii?q?65tSfGDVcAHSetxaHa9py?=
X-IronPort-AV: E=Sophos;i="6.01,238,1684814400"; 
   d="scan'208";a="117816575"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxWL0zZbynMXFLCVa4WN1eXR6aJM2VLzjIEuL3DFRetwifsXXnDIN4HhYAQxhQ5fcPPKurCy/jzQvSb2abMBVQCTc7CpPOZy30f2f2j3SAa2SDLKR08luv2kXyrWj4RSsJZit/hn55eiebqv/xbZT4kmQlD/yE+MuGfeeVZLSs6SliMM0z6oULw84YUU5omFV4xVCdP4ffYSNQ+A4tHvr5SudenxmNQAb2jUFX2mfkFwbaehmDMtyyQ+IhaQGWFH4oSLx86NrDeOOqLozmNp4KszPDnNkyIuMKqBdQIgr/QuD5Nacac4mxsD7o3RaNzTkHQQ9N98kW6fA8x1gMq6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sG2xeXvda2IyP8areTnFv8MwtRgz9w+sOfGHrPK3V/4=;
 b=CmpSA+LojpMwoiCkz5juAFw66Fo7u/yL4R9Gx6PDBR/kjwkCozOLKV7d3BjXg91H8mfKi16re+nlDzreSbpq5mKNJuZ4t7say66/6ZfqCnMyC2GDiF0Uxh7U7lmH60fQ7C795bP1ctvGV8Ai1rp+6NcyyGzShU9R8nP/b5Sw4iF+nsoCX+dB1QTr6SakZ5x47X8GJyYM/cHZeiyvMheJFB/ojPpbP1CF+GhBSykd7HwjXMettJnGv5biVdlHmvqTIohwAT/QPTm/v24L6tRujVFHkEFtlhJYOa8GZlqngGybjaIp9oApJLhbLLXXQkeHf7GLpGUAfdhw0dhzqZvZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sG2xeXvda2IyP8areTnFv8MwtRgz9w+sOfGHrPK3V/4=;
 b=s71s+WxUl1cMJP8fbNVZ+TLW4O3VjLAy9iDe7eD000aPm8cm90HfO2ZNeDQan+UDX/3IM/Ow/ZcAvJ3LkVI+1DBBUjTHQtvQ6YhhEpUMpwXZv1ZP87ltzKNjmwiio+KBv2cKpQqXu2xnniaxUb4Ir0NAnK8dU7Q2HHrB2AHlXcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3470bc26-3cbc-e0de-53ae-203449493b51@citrix.com>
Date: Fri, 28 Jul 2023 17:58:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-6-alejandro.vallejo@cloud.com>
 <9f0b7ab4-090f-21ea-2cf8-6ecdc7c02225@citrix.com>
In-Reply-To: <9f0b7ab4-090f-21ea-2cf8-6ecdc7c02225@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0216.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 9651620b-da3f-4d52-484e-08db8f8bd3d3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D3Vs/tfdM3Oy3deVUMnnz2I0nWEqj/SfRhQSqa0lu3WhUMsfEmCvU4B8n505QCvB0HZZ4WCQb4vFt0o+CXrt96eX3VNFSXE9p/IDo5Et6xyn6fRwN5H/CSyoCh+XtH2kdld2FFPCLMH45Buj+jegSPhCLPKMT+19I1I+C37tUzpbqFy6sscgdEzI3msYjEnvHUfyAQD0vNLjvnn3d9JRHnsMsOR++xQLYxv152SA6qyyT5/mqNjfQvwhtWQ5thRvNWu1rBsGyuepKbDfFyMaDuYrzMHGmYhfvfuP3EOQUrJ5y6WiHN8jaraYk2gmL80X80oBFH0wCKwGaeVFeod8zlz/DI8wIXmdxh9/huXOR/lTRhCIhIXwXi7ysbMuIfc/Kg3cj/lq03ohB2Mmv+NPR7zpDmvm0ExSnLhy44WFhoABY2jpoKWt8wC/LIokzqtLg86O/WglC6ZLg8iPQtN9hlXk9EuKT1npRU9N3rxGUmwOoRkpDHMYpEmfa714Ni3zAt5oCdEikOVQ7dJ7EnDp0CV9MtzPVOC37HmHCOJj/A24Ft27WPIZgTRfTU68EKf9LFChfsqOk4idyDe+7/TMNlzz2TltrAO36O0bsDpdVd79N8ObdrrRkiZBTLXkR7Dj3w/0+erg/nWsFfLsAwufXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(2906002)(316002)(8676002)(8936002)(5660300002)(86362001)(7416002)(41300700001)(36756003)(31696002)(53546011)(6512007)(6506007)(107886003)(26005)(6486002)(478600001)(82960400001)(6666004)(186003)(31686004)(2616005)(4326008)(38100700002)(66476007)(66946007)(66556008)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUNVc2pNcWtkZlRBZWdUR1Mva1BCb2dxc2RjeUR3Q3VxSE93UjkwVGo1Q1p6?=
 =?utf-8?B?a25uaXA4U0tYbFkyd2xGeTM1WERKdFBMNlk5OHRwVnd3VlZBTnZCK1JjRE45?=
 =?utf-8?B?K3hQY21rdFp2cmFnbHY4SFZuZVlRSHg5WC9pMFFFb3NRRFRDWTRrZm9SZzRJ?=
 =?utf-8?B?dXIrcFhqSlNDdS9WbTQyTFNqanl0dGVXcDNnZVdSYjlCOVNyVGRIYWlPVTFN?=
 =?utf-8?B?YTBCQTFmZUg3VVFMaE1OajYwdW8wbEFIdE5lU1ZZMkJBRVE5L3hVdDYvYzBZ?=
 =?utf-8?B?TUIxc0ltcHFCRGZSNmFqTk4ycWVTeWV0Z0RySXBDdjN5aTJhek4wRW85R1cr?=
 =?utf-8?B?OExqY3QwNnpYM3ZjaFdWclU4N3JCMkZCQWJIM0wwdmlSYm1jWjQyWWx6RXE5?=
 =?utf-8?B?SU1mUy9CbGJpdy9ybUg5UnQ3RWFnVUx1TExRMTZ4S2lEVlk4dGVjb1dCYXc3?=
 =?utf-8?B?SmhBTFhDeTh2TEtFVXFaNmRUaVgwWWt3Z3RBSXF6SEtvTFRpM0dxNEZXdlJv?=
 =?utf-8?B?Mmd2anpoNG1xS1dtYTAreFZ3QVZEZ3pyN1k5WFFRUGFNQTFWMkhndS93bjBW?=
 =?utf-8?B?bG5FbE9PK2dIVXg5ZERlSEVuR2VyRkoyclRKamROR1gwMDBLZFBNS1kzUlc4?=
 =?utf-8?B?TG4yRll2cG1USnVPWHh2ZGJaMVhlb2dpZzdwT3AvMDlwRWx5cEpPKzVrT0p4?=
 =?utf-8?B?TFR0RkhSN0V4SDFCdzRIejdvNWo5OGU0SVFmZ3AzS2Vib3JRbmRwMjNYOFZr?=
 =?utf-8?B?TENSUFg2UDZLUnRON2liUEtPM0gxRVZsZFU4Nlh1RkRieFlwbTM5eUV2YU9k?=
 =?utf-8?B?REdXWVYvd3RuV2RIMU56VVB4ZUtka3NRVnJKV1BGZHhhN0NRRW40dlczd2Uv?=
 =?utf-8?B?eHVLMkhycmZ5bWd3TlprcW1INGFiOUZGbS83dmh3dEdCamVERWtrQ2Qzcjlp?=
 =?utf-8?B?cFdOcEVpaEJxU1duOEwyMzYrRUhBYm03MEhLZ091bzFpVi95MXJLOUMyekVn?=
 =?utf-8?B?c2VJanhhOHZqVHFOajRWWnhid1YvQkdlVW5Qa2hCZktDRDRtNkVYZGJwRTRG?=
 =?utf-8?B?aFU5MEVEZW9CTTgrN0UwL1BLaTllY1ZmUWFlNDhzTVZoR09iUll0QkpGd2VP?=
 =?utf-8?B?NTdISXVTbG5yeWs2MjY2NGJOY2hDOUtIUHl4dW1oVlE2dXlhTklOWVZEc0tB?=
 =?utf-8?B?bElYeGxFMzJ3dklEYzFwakRSdHdLNC9MaUNtK0Z4N2hBSk54QXZHeE5EQUdH?=
 =?utf-8?B?UVhhM2NmdkZzSVJ3K3ZmcHBsMFpScHFSOHQ3L1U4UGNHUWdRS2VpSG9TdGl3?=
 =?utf-8?B?QXB6UDFUZ0tWcGEwUFFWbVNtQzBBUGxaWFBOMmtJbDZoNHN1aVROZXh4RFZn?=
 =?utf-8?B?SWViRFZqOU52aGxTcVFURnV3d3VrcjFMZVBmbVZ3TU5lMnFKRGJNSjY5ZWJY?=
 =?utf-8?B?Y3NnbkJ3Q2EvQVhHK1NhdE54cG1IejFBd096WVdtTHdKVUNjcS80VmFIZTVu?=
 =?utf-8?B?U3YyTmpqRnRjOCttVHJmYmMwVmFZRFhoZzBUMU5MaGd5SmZPRm5KSm9iM1p3?=
 =?utf-8?B?NFk5NTRteHdKM0V4dncvRk5IbGxIMGlIRmtpdkF4NlFkWk9lVkxIQlNXdVRx?=
 =?utf-8?B?M1BSUllyT2dJUWxBck84WmRkcU9iNUNnTmlTVWpDaWtmbi9qSCtKUVNPK21i?=
 =?utf-8?B?SWYrRlVwQ1JlQmJjdHBzcjNnMjNqV0xaSjRUQjd4YVJUelNkNVdBL1lUYk5M?=
 =?utf-8?B?MnFMdFNtMVlNNmFkdW1qZEduV0x0NmRJcWI3MGJvMVRIVlZtRGt3MWpCTGp0?=
 =?utf-8?B?S3FsL1pTMk93TjQ0TVNpckxZWk5VTm8vMGpxTXZGYURwWkErd3E1SWtSbmFk?=
 =?utf-8?B?RjBSSEhBWm9MTy9PZVMxM2pvSk9wVC9BTm51ZWJsRU9EL3hnNWVIVHphN20v?=
 =?utf-8?B?ZXlKU2NXcm5sTzRlQjl5am1FZEhFNDc3MnB6RnY4QktQMkIvVmh2b3dBamJX?=
 =?utf-8?B?QjF1RUhWakExZmdLd2IyejJkSU1zQ2o4SUNpVmJKOGhQUVcwSWJOS2JLTjM5?=
 =?utf-8?B?aWdMdkRyL0J0Q2RieEhFYzU0WkNna1ZpOThtTlAvU1h2K2htbURMS3FHYUZq?=
 =?utf-8?B?Q25hczRQYUJ4a2xEYjVCVUZsV1JXZTF0UU1xbStDVVF6WHFCazA4QUdqOEdy?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Rhuli6rFoCUy2A8fdv0HXWzZIQlZjm7Ds+CV4U11xTeBPByJjBo+gA2Pozd2ByAlxN4JIkOQQWslqS6JEnljIV66b6Khc55B+KLC+ZRUs2RE++Y+dMSAg57BWrm8nyJMtKrTH2iWOZdprcOfakOqLsJ6N9ff1ve45uxS74bmbuTazcTdCRJ1WwzgQy8PjI+e4i9DUCAlXK0MOxmjulSxSWlMUmC3VTm7ZXQT+JXZdv5lY2cSyTFgowKaqotbjs/G/AAnY7V2GELJOYPVSC6XUduZtrQIXGcFS/RyHUCgcwm5FPFJ4LPgaflNsXy7YAoi2hNNXdiIHdEjDI43gi8hBOfLEDxzNy3v92JOBo23m/nPjmjZHoV4aOv9yoH9iLGXeNLdsc8YJMjDx6Kt10yVQuZIHRMp4PfjPR431RX6wpjoOGHy1DB75ARidUPnlMjHla9alAL+HUEtX53vjVDP5Nu0STUswR6ujYrcdh7QXj7TSw7ajLjgipGBAenVmnkbB46qwIf0sQtaQwF7d7+vS/8FsjEsJqS/kYdpbpciG6rjt9VQp9wLkfziYHS65AU+pdbkCw+M2c0D4gdVSqr+4tG3Tn1F5VWkRrcIY/4GVK2PJBCwdoO8/jKhA/ErUwlyESkfxjeLZwTuvzThUNgqLR7q8Kx79bmlJ7cXsmOqpY78ibFtqbcpQ2ciQ4McW23n6Ncig9Ynw3DdQAZc28Pq+/HHq91Av6+MeP/X/2a95TWcfdVlvAil8d1WnyP3S8rmKrpXIFnwwmTNosDfAaz1jDrfJgjMcY/4VPvRnXmViZGzZV6N/Hi0VxygAQiR3VAk5Znx5jRSoGDqKqWOWyt44dWU0091WICIFzFNnin3UYc19ko8InVrB929JA1OPibFkFfSmltbYklRdu8kq0xpzWiurV7yAh7eGlmIwC2YV4Y=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9651620b-da3f-4d52-484e-08db8f8bd3d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 16:58:12.2557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPeEhJHzOxbMfA6xNYq9sbL5SFnsEZFjWN449fkxj1V4pQQwa0CDRStdfyF11w25Rf/BdWNdhX4fLL6JfFwezY/2Gf9wLwRGvPGEYLb4mZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7029

On 28/07/2023 5:36 pm, Andrew Cooper wrote:
> On 28/07/2023 8:59 am, Alejandro Vallejo wrote:
>> Adds a new compile-time flag to allow disabling pdx compression and
>> compiles out compression-related code/data. It also shorts the pdx<->pfn
>> conversion macros and creates stubs for masking fucntions.
>>
>> While at it, removes the old arch-defined CONFIG_HAS_PDX flag, as it was
>> not removable in practice.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>> v2:
>>   * Merged v1/patch2: Removal of CONFIG_HAS_PDX here (Jan)
> This series is now looking fine, except for the Kconfig aspect.
>
> This is not something any user or developer should ever be queried
> about.  The feedback on the documentation patches alone show that it's
> not understood well by the maintainers, even if the principle is accepted.
>
> There is never any reason to have this active on x86.  Indeed, Julien's
> quick metric shows how much performance we waste by having it enabled.

Further to this, bloat-o-meter says net -30k of code and there are
plenty of fastpaths getting a several cacheline reduction from this.

~Andrew

