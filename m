Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE0C51182C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315022.533342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhWe-0002Vo-F8; Wed, 27 Apr 2022 13:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315022.533342; Wed, 27 Apr 2022 13:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhWe-0002T2-CA; Wed, 27 Apr 2022 13:16:12 +0000
Received: by outflank-mailman (input) for mailman id 315022;
 Wed, 27 Apr 2022 13:16:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8dk3=VF=citrix.com=prvs=109ad7ccf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1njhWd-0002Sw-2e
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:16:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30ffde25-c62c-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 15:16:06 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 09:16:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN7PR03MB4532.namprd03.prod.outlook.com (2603:10b6:408:3f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Wed, 27 Apr
 2022 13:16:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 13:16:03 +0000
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
X-Inumbo-ID: 30ffde25-c62c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651065369;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CJoWPejBExPDOKG9sp5p2i6RGq9VkJy0n8vU+7Ak5ec=;
  b=U5aff2LxcORwF0Jui0iMDDPVF5hAbug65ELX88dQRf4PKUtE1kHonPCF
   79YaCJ6AN3y7UaFejySydwVZr3NPeqmgctRgdQn8kGjV1SScaPHpFyTAC
   a3dzQjLUQpOJPYcBjVKfTBBSKUZFy0WnUA6kWDaBLDizMZwYcxYKhM+tz
   M=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 69439457
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Zq7zoaidJ09lE3m2iLPgcL35X161HREKZh0ujC45NGQN5FlHY01je
 htvWjrXOPzcamv3ctEiYdnn80IF65fRn4cxGwBr/noxEXkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nS4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YT0oDq7AwKcZbwV7EnFsfoFYoebIBXfq5KR/z2WeG5ft69NHKRhseKE9pKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuI4ehWhu7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJpsjSInVAsj9ABNvLHR4eQaepflHyig
 Uz83m2iUh5BHsymnG/tHnWEw7WncTnAcIAYGaC89/VqqEaO3WFVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgYVRt54A+A8rgaXxcLpDx2xA2EFSntNbYIgvcpvHzgyj
 AbWwZXuGCBlt6CTRTSF7LCIoDiuOC8Ta2gfeSsDSghD6N7myG0usi/yoh9YOPbdprXI9fvYm
 FhmcABWa20vsPM2
IronPort-HdrOrdr: A9a23:3m9LNq4dMrBaYGf6xAPXwZGCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+843WBjB8bZYOCAghrmEGgC1/qu/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXerIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonis2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlaQkEyzzYJriJaYfy+Azdk9vfr2rCV+
 O85SvICv4Drk85uFvF+CcFlTOQiArGoEWStGNwyUGT3fARAghKSvapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jRiuKYlGclsRLYkjQpo+VY7bVDHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TpE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZeo6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z44HSKyGG4fIyQZ0Wc9igF3ekJhlTVfsuZDQSTDFYzjsCnv/ITRsXGRv
 fbAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="69439457"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFD05PsyJNpB1bsIIKIV/+gUHeZJPNCKtlvEqmRY80unAv90pEZDDi+LGNjY7Sd9tvPN6CA/O6KI+adPUbxLehJRZGJDJPBvW00h59iaFEMRpn8y/V4NfcFxA6FjvUBuLN7nZgXCoOJdrpc9efvVBDZpbeaeLGQpHQlA5dcNGCdmfln3L/zYD3bpML1fJVxHig4B7w15KYs1Kzt5tkIWE/wgmjKd1CfGklXc0O7xtmNhO2GOFFnkVEcPQ6Q6TfYhwK6ibVWad87RVPjarlb3d5ksL+kh1ag8lJGSp4WIT5B9lQR26JLLwhmL8LA/cznlDQaOIZn/aQrMHIIkPCOK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJoWPejBExPDOKG9sp5p2i6RGq9VkJy0n8vU+7Ak5ec=;
 b=eqV/c78DPE7HoBF3s2NH9Ea62oNFONc4eyuA18KQyE+PDpwyZ/cNgGmoY0b6avjsWmK2sG0kNxl1o8BFAF5if8OZTtaUjsBijKqeWGTWGTB6K9m0qkYLlKDT0BoHAd6QUdkHMKKNMtV2kCCsQ3Z7xOiYohtAV1dN6AuHhjxcFgi6/ygYNcDBQWoL72AeXydJNG0oVGuCFCSakP902cqttY9k+GA2iKCyuhrT5+OoP48i00FyCAwHhx1c9IYhXCiga8LCWJ/61YjfpBV0egfUnSDZm51ln7SQlsPf8n7uT30ShHmOaG7OMG6K0H6rVD2v3mPrj2+Smh9bYxrRVpxMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJoWPejBExPDOKG9sp5p2i6RGq9VkJy0n8vU+7Ak5ec=;
 b=iDqHTZbwMzsiCipfWuugXvhA9I2czrkbYOmY5ye6GSM6rsU1rG1envlA9kNZxRQcOBaQCx8DzKOol+Pi3A84C7Db77P8pDWXPc3veScWTQtuH4APazWEGWHRq7DtixQORIaE9kOAC02L3eeqap1kAwfSO3x0aZdaB5rROYKU28A=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v4 02/21] IOMMU: simplify unmap-on-error in iommu_map()
Thread-Topic: [PATCH v4 02/21] IOMMU: simplify unmap-on-error in iommu_map()
Thread-Index: AQHYWH75zDdGe3+po0S/evA91QmE7q0DwOQA
Date: Wed, 27 Apr 2022 13:16:02 +0000
Message-ID: <f61ce2f9-ef08-6f50-29b4-e7e09e7059a6@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <cc4323b2-e074-f86f-eea0-9cd6a802bed8@suse.com>
In-Reply-To: <cc4323b2-e074-f86f-eea0-9cd6a802bed8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b83b1842-c3c6-44ef-825d-08da2850144f
x-ms-traffictypediagnostic: BN7PR03MB4532:EE_
x-microsoft-antispam-prvs:
 <BN7PR03MB4532FD07BFCF275C07A69A95BAFA9@BN7PR03MB4532.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 o8wHua1KhtmuT8lR5jNUGqXPOfRLrGsBmlTWDw4w6upNOtNY7WaikyCn4LFtJvTxRnnqK7fmJmFWTevfkkGenjcyB2uoIaDuWCMTsYvDK0ZInWXyvQkr9alJUWzl4I89FA08sli+1pmrRNorLKeY2Ii/eKSBb2/TxjzX/ShBD1Ujy5Xrz+/eVe0AcSjnL/EOgVhrC7xv1FV7qb2uszSeDGX0pxwTCkMc85nC9Lg9oJb1Uc7poI+KnEXOsf7AAtGpW8chvkdgwzvPFV3tcUbYkO64dHG8rXKbud6wc4x0Di7IGwrY0tCWkSu0qIcPu5TKLr+tOX0NrJmV70CTGitHElPfQ8xAGL49JiCaPNVvx6Rd2KBgr4bU/tllgqoNOM4yCBhMnWEctQQkPQqGfF+rNlg1HlSq0YO8PdwxF1XtuExPTAJRtSRgIzMamxtXWtU6FubN6/140WP1CstCU0oY/DcY+OrEWxVXQPx3yWbpwbEw6JyDigPq30q2FOhkNhb2wsUJNN/KYrHu7+MEOWhQP6Tr83HmoTp1bVXSmVjm+R9pcBQtbUFsWKbmH43kTnI6LcM5R1rZeszX6SwHvIidNPZy5Oi1QRSrmzdfemagVOFJjxY6UoyQ1r64wmIlbXV+AhJgdfRa+By6Kvo4evDo6dWNwXhyN5XSsRcY1zqsr4XreB0l+eYV/In1ehHeNcW9Q7RX6nAAcYfCAHQ9pF3Us5UxxVToEWY6heTd+mxcKD/TviW1HmB/yLgey/YUOHiyhHUn87x/1L8E/mCTeCEOew==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(5660300002)(53546011)(82960400001)(38100700002)(122000001)(316002)(6506007)(71200400001)(6512007)(26005)(38070700005)(110136005)(54906003)(508600001)(186003)(6486002)(2906002)(8936002)(2616005)(4326008)(36756003)(66946007)(107886003)(91956017)(8676002)(66556008)(66446008)(64756008)(66476007)(76116006)(31686004)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M3hob2lZcERPbXkrSWszeFlwL1dJeEhRYWVMWktwU1g5Z25jalpYTWJxd0JN?=
 =?utf-8?B?bTQwaUh2Y3B4N0R3b3JGNEZvazlZZzJXamVXMWN0WDJUeE5FblE0Q3JMOUVv?=
 =?utf-8?B?aVoxeFZMeG1BazJQRTAvRUdnUkZFUW4zZkdvdVQ0WWhSU2lkU3NwODMvRXVm?=
 =?utf-8?B?NnJxRGQxS0pka09raGZrZGM0UU01QmNUME9zTmlLRXdHbkJ0ZjZYRExUV05E?=
 =?utf-8?B?dHYvV3pTcS94VUwySy84Q1VKNDlyVldyVlVRZC9Eak1SUkhtZllHS1F5cU1r?=
 =?utf-8?B?ZVBWWE5MN2crUGRLNHZacmdNRlE2YUtVeW55Ym9GTXhnM1IweERqWmVyc1BH?=
 =?utf-8?B?YW5JaVNNRnlVc0Y2UGUyTHprR0NmcWNYQTZYUVhENWcwaERvdDBKMTc1NVhY?=
 =?utf-8?B?SXpTa2hEWkpCWVZiekdiaTBrbzA3VlZSVW9oN2R1RjB4OHFxRG5ZYjhVaGRC?=
 =?utf-8?B?RmE3SW44c2Fhdm54UjFGazByT1VyWThsOVNHSXRFU3NNRGRWbU9yMTF4WFF4?=
 =?utf-8?B?S2xBNnJrMnVTVUpYS0txUG1QT0JSeDBDZnE3eVpnQWp4MTA5eGlySVRnRzZ3?=
 =?utf-8?B?SUQ2Y3Qrbm11QitPRTd3ZVlzQitHQ0FFRVpPRU1mR2U2STBIRzR2d2VRcEw2?=
 =?utf-8?B?QWNra0FoUm9ZMlRnelNVaUhiSU41WUkyaDJkYU1JTWovYVVVTXpXWjIra0tJ?=
 =?utf-8?B?NUMzK3F4M1gzSFAxUUJTa2tzQUpMb0E1VkxGenloemtlQ3ZiQmlaaUZsb1dq?=
 =?utf-8?B?dnJ4MnN6WTY3RWZVZXhRR2xkM2lmT1R6MHVRcFY2U3JZenBlYWcyanFVVHhz?=
 =?utf-8?B?aWZxVUY3Y3pUNzdTR2E5QzEyNUJaSW5ITlpyRTZZSDcwWGRiQk15YlBEUXJU?=
 =?utf-8?B?M0x1L2NGZmNhRmJXY1RYS2JiUStCbEt6Y2E2Y0JJOHNNNE8xODQ2OWRFb0p4?=
 =?utf-8?B?Z2ROdlhhTHpWM1hGbU1iRWxMaXZDVjF1L0xjT3lWTUU5SVVXdTY5dGVMZ2dy?=
 =?utf-8?B?OUFYSVRhbkFha0s4SGtZVXF4SzBZbWEybytyWFc3SE9jU29BYzIyUzgwd1Fz?=
 =?utf-8?B?TVBUQThsMW0yaWxpZjNsY052V3JYeGFPZHpMUzY5VGlOUDFKVGNKekVUN1ds?=
 =?utf-8?B?QzA5dFhSblJ1SUpsZ0ZCUlpEQlZZUXMwQVlKOStSSFQ3NU1qK0o5SnZ1Y0FU?=
 =?utf-8?B?bndoK0tzT2llMUROdnR4QmY4Y2E1cFlWMEpScE8zanNRUlFjbTYzc2lGMDM0?=
 =?utf-8?B?R3hDb2lqSVB5Uitmc0dweG1GbTdZL1lzVm1JWlNiN3NoU1NJdjVJd3U4aG01?=
 =?utf-8?B?eEQyS0hsMkxRK081MlVpRCs1SGFXRzgxR0Jac0hEZWlJK0s3TUZoWFBudGg0?=
 =?utf-8?B?L0h2cXhnM2g4SGV5MlFScmU1d2lwQUdCZlhISTZZZWxXc2QyR0pTZWJCQSsy?=
 =?utf-8?B?OC91NXcxNWdjTGpkemFZTkJxcjBZQnBZRi9kWUhCdGZQQlhyNmpERVZoaVFT?=
 =?utf-8?B?RnEyc3E2K1VMRDhoUUVxcDIvZTQwamZvZDlKRkZ4YXdqZXJWYXowSHlxR2Zm?=
 =?utf-8?B?T0RtWnUwMUt3YXptUEVtN1RNMGJKZjgyOXkzQVZxMGNnSXAvVWloTFZWc2Vk?=
 =?utf-8?B?OVorQmJXeHVEcW9ZMTBkSElYMVNUdVZqdWlxQjU5VVZENUVyRkpPN2Y5Skh1?=
 =?utf-8?B?Yk43NWpiSHNycTlRWGF1Zzl4U3Q3RnRmNDRHVDlyTG9KZmh6UmhMcjFTdDNW?=
 =?utf-8?B?UWcxNCtRQ3BxWkN1aldCTnhzUDNhNGRJMHUya0pTQjFuaW5ETGFWRlZoMHJM?=
 =?utf-8?B?dkRqaVdRWmtick03MUVBM1ozMHNnMTQvd0VsOEVUazVhVkpjQ1BEMTNFMk9l?=
 =?utf-8?B?RXBRMXVTenJOUHNhL2ltMFlHUUdvdnlWRUNWaHpYb2cvekdaZTMyUWkxeHJT?=
 =?utf-8?B?SSs1R0Q5TmNsSDBDU0Nrck5LWWFjaFRUTTQveVNiZU1ET0VOOU92S09DS3hX?=
 =?utf-8?B?RU5JZnFBejhqMW5Lc3krU0pqNnQ0SlVlYllTU1Uybk8wMjBoc2xDWnZPbU1Z?=
 =?utf-8?B?cTJOdXd2QnBWYWF5Z2lnQjJVd1hMeVJLREIzVDV3M2hBbHZxSXVjTmNXbkYv?=
 =?utf-8?B?ejVobkdDejVYbUJSVDQ3bEZSWXdNUk1DWHVmVlBnNkJzWEtnUTU1SzFLSWpJ?=
 =?utf-8?B?bnh6azhKWmM2YmxGT1A5N0llV2t0QStQOEQ5elBqMHVPdWdndFZHdlA5SXJO?=
 =?utf-8?B?bzFweUo2RkxTRzU2eFFjc0w1d1lkRmxybEVibWpmSzZUMUtCWDIrYkJBa3Bp?=
 =?utf-8?B?a0ZkUmFRVHBUMVJReTNWSlJOVzRTcnEvY0VtWjh3eUU4REV6RGE1N0RJb0I0?=
 =?utf-8?Q?RKL76ROFQ9W9Ad40=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BB23B597898634F98E9B23613285414@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83b1842-c3c6-44ef-825d-08da2850144f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 13:16:02.9283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alhT/UqQCv/8od9LdwGrPbNqM5HJMUdBo+jIhYThcQjXru7JzCOhfAroXCDqOroz/WmcAL2Mr40JdLVakmbmuClFrcoyIBtoavvxGxDcKYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4532

T24gMjUvMDQvMjAyMiAwOTozMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEFzIG9mIDY4YThhYTVk
NzI2NCAoImlvbW11OiBtYWtlIG1hcCBhbmQgdW5tYXAgdGFrZSBhIHBhZ2UgY291bnQsDQo+IHNp
bWlsYXIgdG8gZmx1c2giKSB0aGVyZSdzIG5vIG5lZWQgYW55bW9yZSB0byBoYXZlIGEgbG9vcCBo
ZXJlLg0KPg0KPiBTdWdnZXN0ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IC0tLQ0KPiB2MzogTmV3Lg0KPg0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4gQEAgLTMw
OCwxMSArMzA4LDkgQEAgaW50IGlvbW11X21hcChzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBkZg0K
PiAgICAgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgZGZuX3goZGZuX2FkZChkZm4sIGkp
KSwNCj4gICAgICAgICAgICAgICAgICAgICBtZm5feChtZm5fYWRkKG1mbiwgaSkpLCByYyk7DQo+
ICANCj4gLSAgICAgICAgd2hpbGUgKCBpLS0gKQ0KPiAtICAgICAgICAgICAgLyogaWYgc3RhdGVt
ZW50IHRvIHNhdGlzZnkgX19tdXN0X2NoZWNrICovDQo+IC0gICAgICAgICAgICBpZiAoIGlvbW11
X2NhbGwoaGQtPnBsYXRmb3JtX29wcywgdW5tYXBfcGFnZSwgZCwgZGZuX2FkZChkZm4sIGkpLA0K
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsdXNoX2ZsYWdzKSApDQo+IC0gICAgICAg
ICAgICAgICAgY29udGludWU7DQo+ICsgICAgICAgIC8qIHdoaWxlIHN0YXRlbWVudCB0byBzYXRp
c2Z5IF9fbXVzdF9jaGVjayAqLw0KPiArICAgICAgICB3aGlsZSAoIGlvbW11X3VubWFwKGQsIGRm
biwgaSwgZmx1c2hfZmxhZ3MpICkNCj4gKyAgICAgICAgICAgIGJyZWFrOw0KDQpIb3cgY2FuIHRo
aXMgcG9zc2libHkgYmUgY29ycmVjdD8NCg0KVGhlIG1hcF9wYWdlKCkgY2FsbHMgYXJlIG1hZGUg
b25lIDRrIHBhZ2UgYXQgYSB0aW1lLCBhbmQgdGhpcyB3aGlsZSBsb29wDQppcyB1bmRvaW5nIGV2
ZXJ5IGl0ZXJhdGlvbiwgb25lIDRrIHBhZ2UgYXQgYSB0aW1lLg0KDQpXaXRob3V0IHRoaXMgd2hp
bGUgbG9vcCwgYW55IGZhaWx1cmUgYWZ0ZXIgdGhlIGZpcnN0IHBhZ2Ugd2lsbCBlbmQgdXANCm5v
dCBiZWluZyB1bm1hcHBlZC4NCg0KfkFuZHJldw0K

