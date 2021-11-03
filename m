Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0044443FC
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 15:57:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220945.382409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHhr-0007f2-3U; Wed, 03 Nov 2021 14:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220945.382409; Wed, 03 Nov 2021 14:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHhr-0007d8-0N; Wed, 03 Nov 2021 14:57:39 +0000
Received: by outflank-mailman (input) for mailman id 220945;
 Wed, 03 Nov 2021 14:57:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+yV=PW=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1miHhp-0007d0-9b
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 14:57:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f82f435-3cb6-11ec-9787-a32c541c8605;
 Wed, 03 Nov 2021 15:57:34 +0100 (CET)
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
X-Inumbo-ID: 5f82f435-3cb6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635951454;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=aXxmYFVR6WMQhOyw2OvFSjNOG0Yto59wwQ0MTdF3UJA=;
  b=ITYXNu1Yxy0vfprCUOCjoN5U5Z5NDTy9fB/+ymyIhxSaMSXkJa1xzZwy
   cvaTfziyn/c88TnDFrMwCaClxMElIi/8BKHGxbDmzFHVOO5f0rT8Mv4ao
   e2mUnE3lnqAozoMrR5JJ65/Wp47ELZrZAxcZmh86cpwCPjO89MRlCwwFN
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VlMNu8gYb4vcBOv7m1bS/Kss7gtLa1UbYJPFW0FjFxwEXlEqe6IsvAnJkVabidpRjM5wkuoGun
 57B+0g113T1/wynDoX/A7X6qsgIJqFEm4g2BrzVXLAYhlWC6ej3xfYdXdRT1VWZvvTieKrD5Ln
 dgjzVcJFQTiORxcvRbMYL5GShLWZRAxevH/SY9SzKwHeFLSlpV2L3k8urQZJhlYmHwxuXFqPff
 AFp3+Ic0LchqaqBU5MJxu+NKvdteOEjfFaXAknuJLCtlJvCCbxy0AxA0wcb82X+njUAeYjTSYg
 tYj3q7yxwjRSpiZ6+Uvp0Hkf
X-SBRS: 5.1
X-MesageID: 58927626
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:a1y3iqO/uBBsoOfvrR31kcFynXyQoLVcMsEvi/4bfWQNrUom3jZRx
 2EaXmmCOf7YNDH3KtggaIzjphsCvZXdztVhHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eo4w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2qoxuBO9
 N5gjp6bdixyYv3PkcsmeTANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iatIUHgm1u7ixINdDmS
 ZMkdwMoVz/nYBljYU8PA4kinM790xETdBUH8QnI9MLb+VP7wAVv3ZD3PdHSe9jMQt9a9m6aq
 XjB5H/RGQwBOZqUzj/t2nOzhMffkCXjQoUQGbaksPlwjzW7+GsXDxEHUEqhltOwgEW+RtF3J
 lQd/2wlqq1a3FewUtD3Uhm8oXiFlh0RQdxdF6s98g7l4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L3IGZCICZRsI5Z/kuo5bphDFQ8tnEaW1psboAjy2y
 DePxBXSnJ1K05RNjf/iuwma3XT8/fAlUzLZ+C2IfzuV0T9ySbWnTLODsgSL7v9vF6ywGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsIGexO
 CfuVRVtCIi/1ZdARYt+eMqPBssj1sAM/vy1B6mPPrKijnWcHTJrHR2Ch2bMgAgBc2B2yMnT3
 Kt3l+72Ux727ow9nVKLqx81i+ND+8zH7Tq7qWrH5xqmy6GCQ3WeVK0INlCDBshgsvjZ8FqFr
 Y4Fa5vVo/m6bAEYSnOJmWL0BQtSRUXX+Lis85AHHgJ9ClM+cI3eNxMh6ex4INE090ikvuzJ4
 mu8SidlJKnX3hX6xfGxQik7MtvHBM8nxVpiZHBEFQv4ihALPNf0hI9CJsRfQFXS3LE6pRKCZ
 6JeIJvo7zUmYmmvxgnxmrGm8Nc5LET33lnTV8dnCRBmF6Ndq8Xy0oaMViPk9TUUDzrxss07o
 ra60RjcT4ZFTANnZPs6otr1p79olXRCyu90QWXSJdxfJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrssBFdeEkna8a2yaXvQ8F28zNISS+2PZz3cCj/5of3we
 eVPwvjgG/Qbh1IW4ZFkGrNmwPtmtdvirrNX1Cp+G3DPYwj5A79sOCDej8JOqrdM1vlSvg7vA
 hCD/dxTOLOoPsL5EQFOeFp5P7rbjfxNw2vc9/U4Jkn+9RRbxrvfXBUAJQSIhQxcMKBxbNEvz
 9A+tZNE8Ae4kBcrbIqL13gG62SWI3UceKw7rZVGUpTzgw8mx1weM5zRDij6vMOGZ9lWaxR4J
 zaVgOzJhqhGx1qEeH02TCCf0e1YjJUImRZL0F5deAjZxoub3qc6jE9L7DA6bgVJ1REWget8N
 19iO1BxOajTrSxjg9JOXjz0FgxMbPFDFpcdF7fdeLXlcnSV
IronPort-HdrOrdr: A9a23:rCC8I6D/MuDvByrlHehCsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90c67MAnhHP9OkPIs1NKZMjUO11HYSr2KgbGSoQEIeBeOidK1t5
 0QCpSWYeeYZTMR7beYkXeF+r4bsaW6GcuT9IDjJhlWPGRXg/YK1XYFNu/XKDw/eCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8zOvcfCmp7KaQMPQ0dP0njFsRqYrJrBVzSI1BYXVD1ChZ8k7G
 j+igT8ooGuqeuyxBPw33Laq75WhNzi4N1eA9HksLlfFhzcziKTIKhxUbyLuz445Mmp9VYRid
 HJ5ywtOsxigkmhCV2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtugPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4ckWUmxjIVLH48JlO71Gh+e9
 MeT/00pcwmPG9yVkqp8FWGm7eXLzYO9hTveDl3hiXa6UkSoJlD9Tpp+CUopAZ0yHsMceg02w
 36CNUaqFg3dL5vUUtcPpZ2fSLlMB2FffrzWFjiU2gPUpt3f07wlw==
X-IronPort-AV: E=Sophos;i="5.87,206,1631592000"; 
   d="scan'208";a="58927626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XklMi+kIV/jEs+S0hqpbbjO6r02iCTYHmRYkAKzEC6oTRvtTHu/W1z2BuAAz3F4Gqerb4OlvYTQ4PkwH6l3NP13Hvpq9mhnNq3yPxh0rN7QWip2Mz2xWl6vM768TtwTVa+qBCurnp9iLKJTgpw/EzC3qiQRhMILQ7JMPQS16wI+DcBE5yW/JA9bG7yqkhq2f0/eV4hfW9MJYB03z1cCFfhKf1BOEevAGt80Ud2xOETWgeUR4vlAQCcMZcpGHlbla4piS0NX0BGSFSvB1hNJLn2voLF/PWuEvspeVk0frfolvtGn17EAetvdMT00j3dvUXSfOx33RnXLtc8dXWVg4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDHTXezlHTAeqal1gSY+gstw7qSiZFAI2pCBNaoUvZ4=;
 b=MyVreDhnPoZVsyftkwcaGZrd7bDgJR5LLjukwW4hylNZJcgxQ1bjCku8PP0n4VRp3/v8vWbAufjI6+XFSmYKwq+crhtEe7FiqIvKr8wO39rgD6MUnzRbjj+eRga4XyNtegbxiyulVKsALI6o71HlOnowpw5Q1sD/rd8wOgP9LtdPEm/zHwYQKmRh7CN013TFkdWVCN2Of/pWwLBy7WDPKsXZ+D36p60DndVPJYIdUIIX3JgDk0nuIZ/YkT9ZvrKLuUpqVUmfOjv2Y3hIWcJ945X32vf9z/dXV4Ek3SWuLNJ5rJDhXLbgmyzADYsEmLqVYDk+T3fiqpcu/T3PiP2t5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDHTXezlHTAeqal1gSY+gstw7qSiZFAI2pCBNaoUvZ4=;
 b=IyUiXq0lXeuWxFmWkrSQIQmf9YGaE6pHITh2xqp79Fc5IFzK+LXIORsGiu2P1zcBypllJx0nkXCSG/6xJfV0MmnoTu9Hijpk3ahhZju5GFaOPrLEs9hi/JzutuyTVZsA1OwKlRF1q9ctyrvRhdmBhS/Admi6yJFk5FGku3K6p/w=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.16 v5] gnttab: allow setting max version per-domain
Date: Wed,  3 Nov 2021 15:57:19 +0100
Message-ID: <20211103145719.96162-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8445e4e5-2aa9-4279-1c2a-08d99eda40ab
X-MS-TrafficTypeDiagnostic: DM5PR03MB3212:
X-Microsoft-Antispam-PRVS: <DM5PR03MB32121A706B733867F66C43B28F8C9@DM5PR03MB3212.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lY8Q09gARzEl7EH11NuOXEY/KD+XfTo195hvFpyHtdhkoSssvjtD2+8itfkV2ytb0ucoPvEzGzlxvM0jQDIPaXCICza6mkdrC4YeXtRgKptMITJ4VtUimTCaQYykX1toiWvtpNoC4od0gqi67ZFHCPRGLeJ1fUhYR0aU1TQu8UbhHELx5ynEJRrobWDFSr1oSBCn6FUN44zg6lX7RZqUdAZofyKWZHLljYtXepeCZ3NDAT1YwOeVXg6rv3i0CFIsQSOckaD97DfA935r4ztjKeSWPggMkONW/jSvY5ZzbxCU1tS2CfDq3k6pXJ/F/YoTxRFh/jUDGlXgo9tkN2/qBeJspUjfELDxptFsxw5ZLirLEIQ2PCUST234ySPB9wzURiC1X3D2/JrEtpVqcVBhfGLmVxh7lR6E/Iqa8VZJiaDbR8FlXWagi0yFoNqH/AJsFH2zybKZ5qvuhiR7zk1EOBFIcOR1sVOR3D29Zlh5Ig0E9ExZkfGpd6xNllLPd3Zniz9RNMmS0RO5y8popcDLU4pxojGaC1sfKhw2G2lqTymdYmmXhOXEx5+2Mh8ZT+eBpxAf4ay4GZK9XaljnCN8pJ9DT11RRioV0g9WzwXVSOo6N97JsNI7kHIcbb3o848MdiKA4DpoJp4X9bKJheBAdFRSumzRlxtUNhMbHyhZdteNN1FYvretNFEtviJTEP2AsdP+di09O7WNCoDzx0yzkbukUp5FeoYNDIYHtrpRPlE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6496006)(30864003)(5660300002)(8936002)(4326008)(66476007)(66556008)(38100700002)(2616005)(82960400001)(66946007)(1076003)(956004)(6486002)(36756003)(86362001)(2906002)(8676002)(26005)(508600001)(186003)(966005)(6666004)(6916009)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3A1WDIvZDdNV2duWTNKU3Y1ZzNPQ2Z6dDBvalgweFJvbFhVQllzak5LV3FZ?=
 =?utf-8?B?ckNSMUR4YjJ5TGpjemljSlJJK3lPcU5vaDgrNkd1R3lhTVIvdDg0SVA2UmZr?=
 =?utf-8?B?eWlrWDYvRlFqWGVoNDh0dzBkbVpDVmRSZ2VYcE55UTVDSDNmWHFRWnBXaDRu?=
 =?utf-8?B?enFIVWEvaFJxL0NvT21TbzZ0RUtQdHZZS2ZOMjlhTUNaczlONEZRMFYrUk9Z?=
 =?utf-8?B?Nzg4Q05wa0JDNWRmVlM0WHRaUWdaYjgwUytrSzJuNjBLbGJMaVdLbXBGd2pB?=
 =?utf-8?B?ZjYyeWZjaDJhRGoyQ080ei96RDJuenllSURZbXBMYzBLbTFJYWlGQVpCbGFp?=
 =?utf-8?B?N0p1UHFUVjZLL0pIbVozNTI4dW5wb0NXTStKM2VFSzRjZVc3dDVGeEx2LzdO?=
 =?utf-8?B?d0t4S0hJY0Y0bmlSVzVOUFZEVjdYenN1ZVU0Y1R1UmdVRFlkVENOd1BOd2l6?=
 =?utf-8?B?N2dVMnUrb3RzT201Y1M1Rklvb0tLUVZUdnAwRXF0aVNaMzlSR2NvQnVPbllx?=
 =?utf-8?B?VThDa1JDQ3VzOFZCKzQ3T09iQk9qNW5zZS91TDZhYVVZbXdSWWZGSFZhbHNE?=
 =?utf-8?B?cks5aHdLbm1XenZuZk9GVHdkM0FNallkeGFkbjhmdTJqRlFGbDZOZFpWYnNT?=
 =?utf-8?B?MG03SFRvSGUvak9Rb1dka2ZaelVtTHIreHJRTnF5TERoVWVWemR3eThEalYv?=
 =?utf-8?B?Z2t5QlZvcUl0eXJMQ0pnYXFMT1k0UWNyZE5EM3k2RXJjTnQ3cnMxbW9QYjM1?=
 =?utf-8?B?eS85V2pwUXduendRelcvUWtveTRLWGpiQVJPUHdaU0RuRWYrRzJLblRBYVFD?=
 =?utf-8?B?N3p6bG9HRk4wQk5kVVVxWDRkSTNtdGpMdHlhZjN0b3FXaWdPbGRRMEZqSkRK?=
 =?utf-8?B?a3V3c1FENkdXcXNXTE81ejlHSmJpanVxYXNnNStGUjRCRVNnYmhSQWRDNU1C?=
 =?utf-8?B?OVVYaHY0RS8ydXlJSGg3MmdZM3NnKzhNT3MwNG1pRlZsVzRPR2F5RjVOOE90?=
 =?utf-8?B?cUpDRmYwQWZXbmJFT1NEemJFSFQyZXVxWFI0UTJvL1BDRDRwS3pKTEZ2OTIx?=
 =?utf-8?B?WXIzTTlOTUhUZDdONTl1SE80Ykl2WjdNR2k2UFg2U1FGQ0dkOHFFWnl4WUJp?=
 =?utf-8?B?TllNZkUwYTQxMzBOQmRPS2FuZTdtSE1zYTlWR3lSKzdhUjlHb28rYzl2K3pj?=
 =?utf-8?B?SjV0S0tSQnBEQ01HNERza0xLS3pLMk95TDdWNzhZQ3U4bmh0MVFwcDl0V054?=
 =?utf-8?B?ZkgvZk82SmJRdmVRdzVoa3hjcXdubXoyZDhwQXNQclZCWUhzM2JyMkQ3ZjdG?=
 =?utf-8?B?cURnLzFmdjZJSG9LODdkemgyNGdURmUwWTQ1ajYwRWVTSHV2RDQ2cnpuMUwr?=
 =?utf-8?B?QWlRT1Nxd0cyM3hhcHVEb0pxaFNyMC8ycHNBSTBETzdETnpDLzBwSHVoemZP?=
 =?utf-8?B?c21HaXFIOWxhcEtyK1E0U3FpTW4rd2s0TTY2WmVqVnFRVmRRWkl3Tnl6ODQw?=
 =?utf-8?B?WjRYL3ozSktPek5sdGxxTExvbHo1YWdmUmFQNVZ1R3JYbjhQajhOKzFiQllz?=
 =?utf-8?B?WmlPTWVXNDlCVHRGT25lYUw5dEJRVlVER0JLUHpTdVBRblU0SGt6b3VTRjBV?=
 =?utf-8?B?MVVVbUcrek13TC9QM05GdUJnUjdNN2k0OE1qL1ZCQy9NbTB3Q1Jrc2VZTFJB?=
 =?utf-8?B?RTJQdE92ODZQbVBRNE9pOWFSUFFMdjYvUXFwaWxPMGpWNVg1bzllZzdFU0VO?=
 =?utf-8?B?cmIrZlN1VFJVUVBZVXdkc3pMVmZGMmZoMnE2RjlwMmtKMngvOERnT3lIQjBZ?=
 =?utf-8?B?OFBPeWJBTnFVUnhZa1NyelRYa2t5bHhSYmxmSGNYaXhCWHl2M3NrZDgzd2E3?=
 =?utf-8?B?WUFNREZnTEdualNzNjNyenZwc1JNOW9oWTE3ZndFZHJoS1piUERNcURXWmRo?=
 =?utf-8?B?azdseGhZQ1F6M3BsWWFJTFl6Tjc0dzE4aG0zaU56ckU4REp6QVVDOUhZZWZ5?=
 =?utf-8?B?NGlZYkhkYTVwVVhpV3BiNG1LNW9CZHJQSHFMOVpRSE1mSFBXRCtwT3FuMDR4?=
 =?utf-8?B?SjZ2RUVGODQ4Y1Z6T085T2hRYlFLSnlncUU1YVk4SHdnTEp0SXVOS3FCZkNz?=
 =?utf-8?B?WVdtdWFGVE80M2NHVkVldXFmbWRMblRjWm5PbmNDNGJlTGlNekh4cHdYaWF3?=
 =?utf-8?Q?1yTyfotlGMTsLdq0WvwW3FA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8445e4e5-2aa9-4279-1c2a-08d99eda40ab
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 14:57:27.6681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxgFQFVFbOFCH6E5RqcXWA4JU9xCq/M60OqY6qoYuUo+vFazHvaszmC3P3vNAhGb841XVjonfa3U8u7Ua5lw2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3212
X-OriginatorOrg: citrix.com

Introduce a new domain create field so that toolstack can specify the
maximum grant table version usable by the domain. This is plumbed into
xl and settable by the user as max_grant_version.

Previously this was only settable on a per host basis using the
gnttab command line option.

Note the version is specified using 4 bits, which leaves room to
specify up to grant table version 15. Given that we only have 2 grant
table versions right now, and a new version is unlikely in the near
future using 4 bits seems more than enough.

xenstored stubdomains are limited to grant table v1 because the
current MiniOS code used to build them only has support for grants v1.
There are existing limits set for xenstored stubdomains at creation
time that already match the defaults in MiniOS.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
This needs to be applied on top of Andrew's:

xen: Report grant table v1/v2 capabilities to the toolstack
https://lore.kernel.org/xen-devel/20211029173813.23002-1-andrew.cooper3@citrix.com/

NB: the stubdom max grant version is cloned from the domain one. Not
sure whether long term we might want to use different options for the
stubdom and the domain. In any case the attack surface will always be
max(stubdom, domain), so maybe it's just pointless to allow more fine
grained settings.
---
Changes since v4:
 - Remove the check for 16TB: there's no check currently, and there's
   some discussion about how to implement it properly for all guest
   types.
 - Place the logic to pick the default version in the toolstack, so
   the create domain domctl will always specify a grant table version.
   Such version will also be part of the migration stream.

Changes since v3:
 - Expand commit message re xenstored stubdomains.

Changes since v2:
 - Drop XEN_DOMCTLGRANT_MAX - it's unused.
 - Rename max_grant_version field to max_version in the grant table
   struct.
 - Print domain on log messages.
 - Print a message if host has more than 16Tb of RAM and grant v2 is
   disabled.
 - Add a TB macro.

Changes since v1:
 - Introduce a grant_opts field and use the low 4 bits to specify the
   version. Remaining bits will be used for other purposes.
---
Cc: Ian Jackson <iwj@xenproject.org>
---
Posting this patch alone as I think allowing to control transient
grants on a per-domain basis will require a bit more of work.

Release rationale:

We have had a bunch of security issues involving grant table v2 (382,
379, 268, 255) which could have been avoided by limiting the grant
table version available to guests. This can be currently done using a
global host parameter, but it's certainly more helpful to be able to
do it on a per domain basis from the toolstack.

Changes to the hypervisor by this patch are fairly minimal, as there
are already checks for the max grant table version allowed, so the
main change there is moving the max grant table version limit inside
the domain struct and plumbing it through the toolstrack.

I think the risk here is quite low for libxl/xl, because it's
extensively tested by osstest, so the main risk would be breaking the
Ocaml stubs, which could go unnoticed as those are not actually tested
by osstest.
---
 docs/man/xl.cfg.5.pod.in             |  6 ++++++
 docs/man/xl.conf.5.pod.in            |  6 ++++++
 tools/helpers/init-xenstore-domain.c |  2 ++
 tools/include/libxl.h                |  7 +++++++
 tools/libs/light/libxl_create.c      | 23 +++++++++++++++++++++++
 tools/libs/light/libxl_dm.c          |  1 +
 tools/libs/light/libxl_types.idl     |  1 +
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  |  5 ++++-
 tools/xl/xl.c                        |  8 ++++++++
 tools/xl/xl.h                        |  1 +
 tools/xl/xl_parse.c                  |  9 +++++++++
 xen/arch/arm/domain_build.c          |  2 ++
 xen/arch/x86/setup.c                 |  1 +
 xen/common/domain.c                  |  3 ++-
 xen/common/grant_table.c             | 21 +++++++++++++++++++--
 xen/include/public/domctl.h          |  5 +++++
 xen/include/xen/grant_table.h        |  5 +++--
 19 files changed, 102 insertions(+), 6 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 55c4881205..21a39adb70 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -580,6 +580,12 @@ to have. This value controls how many pages of foreign domains can be accessed
 via the grant mechanism by this domain. The default value is settable via
 L<xl.conf(5)>.
 
+=item B<max_grant_version=NUMBER>
+
+Specify the maximum grant table version the domain is allowed to use. Current
+supported versions are 1 and 2. The default value is settable via
+L<xl.conf(5)>.
+
 =item B<nomigrate=BOOLEAN>
 
 Disable migration of this domain.  This enables certain other features
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index b48e99131a..df20c08137 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -101,6 +101,12 @@ Sets the default value for the C<max_maptrack_frames> domain config value.
 Default: value of Xen command line B<gnttab_max_maptrack_frames>
 parameter (or its default value if unspecified).
 
+=item B<max_grant_version=NUMBER>
+
+Sets the default value for the C<max_grant_version> domain config value.
+
+Default: maximum grant version supported by the hypervisor.
+
 =item B<vif.default.script="PATH">
 
 Configures the default hotplug script used by virtual network devices.
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 6836002f0b..41a7c38ada 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -85,9 +85,11 @@ static int build(xc_interface *xch)
          * 1 grant frame is enough: we don't need many grants.
          * Mini-OS doesn't like less than 4, though, so use 4.
          * 128 maptrack frames: 256 entries per frame, enough for 32768 domains.
+         * Currently Mini-OS only supports grant v1.
          */
         .max_grant_frames = 4,
         .max_maptrack_frames = 128,
+        .grant_opts = 1,
     };
 
     xs_fd = open("/dev/xen/xenbus_backend", O_RDWR);
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 54c10f6efe..2bbbd21f0b 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -520,6 +520,13 @@
  */
 #define LIBXL_HAVE_PHYSINFO_CAP_GNTTAB 1
 
+/*
+ * LIBXL_HAVE_MAX_GRANT_VERSION indicates libxl_domain_build_info has a
+ * max_grant_version field for setting the max grant table version per
+ * domain.
+ */
+#define LIBXL_HAVE_MAX_GRANT_VERSION 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 5a61d01722..b6855c7b46 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -454,6 +454,28 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         libxl_defbool_setdefault(&b_info->nested_hvm,               false);
     }
 
+    if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
+        libxl_physinfo info;
+
+        rc = libxl_get_physinfo(CTX, &info);
+        if (rc) {
+            LOG(ERROR, "failed to get hypervisor info");
+            return rc;
+        }
+
+        if (info.cap_gnttab_v2)
+            b_info->max_grant_version = 2;
+        else if (info.cap_gnttab_v1)
+            b_info->max_grant_version = 1;
+        else
+            /* No grant table support reported */
+            b_info->max_grant_version = 0;
+    } else if (b_info->max_grant_version & ~XEN_DOMCTL_GRANT_version_mask) {
+        LOG(ERROR, "max grant version %d out of range",
+            b_info->max_grant_version);
+        return -ERROR_INVAL;
+    }
+
     return 0;
 }
 
@@ -607,6 +629,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
+            .grant_opts = b_info->max_grant_version,
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
         };
 
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9d93056b5c..9a8ddbe188 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2320,6 +2320,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     dm_config->b_info.max_grant_frames = guest_config->b_info.max_grant_frames;
     dm_config->b_info.max_maptrack_frames = guest_config->b_info.max_maptrack_frames;
+    dm_config->b_info.max_grant_version = guest_config->b_info.max_grant_version;
 
     dm_config->b_info.u.pv.features = "";
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 573bba68ee..2a42da2f7d 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -519,6 +519,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("max_grant_frames",    uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
     ("max_maptrack_frames", uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
+    ("max_grant_version",   integer, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
     
     ("device_model_version", libxl_device_model_version),
     ("device_model_stubdomain", libxl_defbool),
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index ed2924a2b3..7503031d8f 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -84,6 +84,7 @@ type domctl_create_config =
 	max_evtchn_port: int;
 	max_grant_frames: int;
 	max_maptrack_frames: int;
+	max_grant_version: int;
 	arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index d20dc0108d..d1d9c9247a 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -76,6 +76,7 @@ type domctl_create_config = {
   max_evtchn_port: int;
   max_grant_frames: int;
   max_maptrack_frames: int;
+  max_grant_version: int;
   arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index ad953d36bd..eca0b8b334 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -188,7 +188,8 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 #define VAL_MAX_EVTCHN_PORT     Field(config, 5)
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
-#define VAL_ARCH                Field(config, 8)
+#define VAL_MAX_GRANT_VERSION   Field(config, 8)
+#define VAL_ARCH                Field(config, 9)
 
 	uint32_t domid = Int_val(wanted_domid);
 	int result;
@@ -198,6 +199,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 		.max_evtchn_port = Int_val(VAL_MAX_EVTCHN_PORT),
 		.max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
+		.grant_opts = Int_val(VAL_MAX_GRANT_VERSION),
 	};
 
 	domain_handle_of_uuid_string(cfg.handle, String_val(VAL_HANDLE));
@@ -251,6 +253,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 	}
 
 #undef VAL_ARCH
+#undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
 #undef VAL_MAX_EVTCHN_PORT
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index f422f9fed5..2d1ec18ea3 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -55,6 +55,7 @@ bool progress_use_cr = 0;
 bool timestamps = 0;
 int max_grant_frames = -1;
 int max_maptrack_frames = -1;
+int max_grant_version = LIBXL_MAX_GRANT_DEFAULT;
 libxl_domid domid_policy = INVALID_DOMID;
 
 xentoollog_level minmsglevel = minmsglevel_default;
@@ -219,6 +220,13 @@ static void parse_global_config(const char *configfile,
     else if (e != ESRCH)
         exit(1);
 
+    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
+                                  INT_MAX, &l, 1);
+    if (!e)
+        max_grant_version = l;
+    else if (e != ESRCH)
+        exit(1);
+
     libxl_cpu_bitmap_alloc(ctx, &global_vm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_hvm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_pv_affinity_mask, 0);
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7e23f30192..cf12c79a9b 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -282,6 +282,7 @@ extern char *default_colo_proxy_script;
 extern char *blkdev_start;
 extern int max_grant_frames;
 extern int max_maptrack_frames;
+extern int max_grant_version;
 extern libxl_bitmap global_vm_affinity_mask;
 extern libxl_bitmap global_hvm_affinity_mask;
 extern libxl_bitmap global_pv_affinity_mask;
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index c503b9be00..117fcdcb2b 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1431,6 +1431,15 @@ void parse_config_data(const char *config_source,
     else
         exit(1);
 
+    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
+                                  INT_MAX, &l, 1);
+    if (e == ESRCH) /* not specified */
+        b_info->max_grant_version = max_grant_version;
+    else if (!e)
+        b_info->max_grant_version = l;
+    else
+        exit(1);
+
     libxl_defbool_set(&b_info->claim_mode, claim_mode);
 
     if (xlu_cfg_get_string (config, "on_poweroff", &buf, 0))
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 0167731ab0..9e92b640cd 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2967,6 +2967,7 @@ void __init create_domUs(void)
             .max_evtchn_port = -1,
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
+            .grant_opts = opt_gnttab_max_version,
         };
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
@@ -3074,6 +3075,7 @@ void __init create_dom0(void)
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
+        .grant_opts = opt_gnttab_max_version,
     };
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b101565f14..26fee5d9fb 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -750,6 +750,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
+        .grant_opts = opt_gnttab_max_version,
         .max_vcpus = dom0_max_vcpus(),
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8b53c49d1e..0c7052c770 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -678,7 +678,8 @@ struct domain *domain_create(domid_t domid,
         init_status |= INIT_evtchn;
 
         if ( (err = grant_table_init(d, config->max_grant_frames,
-                                     config->max_maptrack_frames)) != 0 )
+                                     config->max_maptrack_frames,
+                                     config->grant_opts)) != 0 )
             goto fail;
         init_status |= INIT_gnttab;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index a20319b22a..8b322b51c0 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -53,6 +53,7 @@ struct grant_table {
     percpu_rwlock_t       lock;
     /* Lock protecting the maptrack limit */
     spinlock_t            maptrack_lock;
+    unsigned int          max_version;
     /*
      * Defaults to v1.  May be changed with GNTTABOP_set_version.  All other
      * values are invalid.
@@ -1917,11 +1918,26 @@ active_alloc_failed:
 }
 
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames)
+                     int max_maptrack_frames, unsigned int options)
 {
     struct grant_table *gt;
+    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
     int ret = -ENOMEM;
 
+    if ( !max_grant_version )
+    {
+        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
+                d);
+        return -EINVAL;
+    }
+    if ( max_grant_version > opt_gnttab_max_version )
+    {
+        dprintk(XENLOG_INFO,
+                "%pd: requested grant version (%u) greater than supported (%u)\n",
+                d, max_grant_version, opt_gnttab_max_version);
+        return -EINVAL;
+    }
+
     /* Default to maximum value if no value was specified */
     if ( max_grant_frames < 0 )
         max_grant_frames = opt_max_grant_frames;
@@ -1947,6 +1963,7 @@ int grant_table_init(struct domain *d, int max_grant_frames,
     gt->gt_version = 1;
     gt->max_grant_frames = max_grant_frames;
     gt->max_maptrack_frames = max_maptrack_frames;
+    gt->max_version = max_grant_version;
 
     /* Install the structure early to simplify the error path. */
     gt->domain = d;
@@ -3076,7 +3093,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
         goto out;
 
     res = -ENOSYS;
-    if ( op.version == 2 && opt_gnttab_max_version == 1 )
+    if ( op.version == 2 && gt->max_version == 1 )
         goto out; /* Behave as before set_version was introduced. */
 
     res = 0;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 51017b47bc..1c21d4dc75 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -97,6 +97,11 @@ struct xen_domctl_createdomain {
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
 
+/* Grant version, use low 4 bits. */
+#define XEN_DOMCTL_GRANT_version_mask    0xf
+
+    uint32_t grant_opts;
+
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;
 
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 9ee830cfd0..f79c866bd9 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -37,7 +37,7 @@ extern unsigned int opt_max_grant_frames;
 
 /* Create/destroy per-domain grant table context. */
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames);
+                     int max_maptrack_frames, unsigned int options);
 void grant_table_destroy(
     struct domain *d);
 void grant_table_init_vcpu(struct vcpu *v);
@@ -69,7 +69,8 @@ int gnttab_acquire_resource(
 
 static inline int grant_table_init(struct domain *d,
                                    int max_grant_frames,
-                                   int max_maptrack_frames)
+                                   int max_maptrack_frames,
+                                   unsigned int options)
 {
     return 0;
 }
-- 
2.33.0


