Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A6950E14A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312919.530324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyVv-0007Ek-8p; Mon, 25 Apr 2022 13:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312919.530324; Mon, 25 Apr 2022 13:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyVv-0007CT-5x; Mon, 25 Apr 2022 13:12:27 +0000
Received: by outflank-mailman (input) for mailman id 312919;
 Mon, 25 Apr 2022 13:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2itc=VD=citrix.com=prvs=107928106=roger.pau@srs-se1.protection.inumbo.net>)
 id 1niyVu-0007CN-64
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:12:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 574c65a6-c499-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 15:12:22 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Apr 2022 09:12:20 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB2492.namprd03.prod.outlook.com (2603:10b6:3:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 25 Apr
 2022 13:12:18 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 13:12:18 +0000
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
X-Inumbo-ID: 574c65a6-c499-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650892342;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hVRPEx0RduZMFDeuGFqZ54FcyypAa690gIEqpLf767E=;
  b=Yu+kQ5QMIGnlFydJMa+OFxiaSXpWM5e/jBKpmKUinfpnaKpmQKxHRLSL
   Ed3wIf0qe5ycOkMPUhblu0evDhJvnClSSexCDvw6c+YnYHvtDaWZ/mKkg
   jRn6su2mRJwqIE4n4jv+I41SvejHnhegEcCH70VLLXeHGhTEySkjGHeh8
   c=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 69735420
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:potb0aloWj31QiMoFYvHV3bo5gwSJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKDTzXOP3ZNGL9Lt9xbNjn8EIGvJbXytVnSQtrpXpkEiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWV7V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYFTw7YabzgskkcxRTPRpifqkWxa35GC3q2SCT5xWun3rE5dxLVRhzEahGv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXupkBgmdYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUG+Q3O+PZtuwA/yiRK+rTtaIHtJuCsXMN6zmy8+
 0za8lbmV0Ry2Nu3jGDtHmiXrujLkCDgRJMJFJW38/drhBuYwWl7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQp3qJvQUVXdZKJPEr8wGGyqfS4AGxC3ANS3hKb9lOnNAybSwn0
 BmOhdyBLSZoq7ePTnWe8J+bqDqzPW4eKmpqTS0LVwwe+PH4vZo+yBnIS75LC7Wph9f4HTXxx
 TGiryUkgbgXy8kR2M2T/03Dgj+qjojESEgy/Aq/dlyi6gR1dYu0fbuC4FLQ7etDBIuBR1zHt
 38B8+CU4foSF5iLmGqISf8UAbCyz/+fNXvXhlsHInU63zGk+nrmcYUO5jh7fR5tKpxdJ2+vZ
 1LPswRM4pMVJGGtcaJ8f4O2DYIt0LTkEtPmEPvTa7Kif6RMSeNOxwk2DWb44ownuBJEfX0XU
 XtDTfuRMA==
IronPort-HdrOrdr: A9a23:3Ekc36xBWa6mKkGo81guKrPxvuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvoRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIF/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF8nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvWOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1rop5PzuN5d3B+3Z
 W0Dk1ZrsAxciYoV9MMOA4ge7rBNoWfe2O7DIqtSW6XZ50vCjbql6PdxokTyaWDRKEopaFC6q
 gpFmko/1IPRw==
X-IronPort-AV: E=Sophos;i="5.90,288,1643691600"; 
   d="scan'208";a="69735420"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQbkHNoYnIf9F9k8IkRTO7HxNT8FuoNqCv19+AzJX8faYis1uEUU/yv8d83kjTUIE8svvEQrsk7HkSTopn5zWL1R9lEZGwbbWkBtgRxwDK8TrnHkNhASfzesbWTh4McQqJUy21fsnHcSm1pR2PltSbdaLiMAxidmUl2VFlNDV+fMiZl7NIHx9X24lFQm5fYJycokwm/D8TSY4bbl3C9/ONXq5qcUC2yAD8/yafYGuPPC+W2QXgASXFH1/8UH3x0fMo3D6XyaOGRukezeR7EP5vJVrNLbn1Yni+UL5McvbRdV2LKYtLX0/z6lywtey7OL7xX0o7Gycf0qjO9bVD1E3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueiUv3ANFHhKZifcnbhcc6x3asJ/gBDKdLEmM6uG4D0=;
 b=SR9mRJbeLu26wFKYPxzB9kAWWLzYjiijYHw6/RceZuItd0eKIZI1TOeNdzKE+A6jGx03bfdUat7/iIc2MC6RLA2z7ElCtLJfr7WA1kvwmUCraMNiWrv4O0Xo27GshXJGCBDgIaN8GFU7WW5/gsf7XNU5dR3bQ+EWWxBOE37vmQZzeyzoWhqywTIn1BzYH1J+ceIfr3Luad7h9q86kBZ5Vim0DYass7kjYwDf078G65zLT6Qtd/Rk3UtpyoEtRA5L+pXbBroOcrHC1KneNdbS4R6PY5Gslvr9cPF6S6RHS57rubrW6uRHkz5ic6Vs6T5O+tACY1lG1STyapp2B7hUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueiUv3ANFHhKZifcnbhcc6x3asJ/gBDKdLEmM6uG4D0=;
 b=vw+ITYkVDIe14Mjufr3i5BRCTxIdC5deHL56+oLjaFGP0881fBXs3KmTh+M58nXhtxeLcWIuzAdCx3VGtE9+T/3g0/EuJ5P+hd6zd6x7uH9ZKB+QSqF6YFNfY5j33TFsJV4h+zNFNA2UAs4udalfUyRUiVtTLBsy8pgBlsNpTjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 25 Apr 2022 15:12:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
Message-ID: <YmaeLc2iwxUPUAvF@Air-de-Roger>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
 <YmJ4NLuvA63Irow+@Air-de-Roger>
 <24112cfc-0446-d81e-85f1-ebf9da0afe14@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24112cfc-0446-d81e-85f1-ebf9da0afe14@gmail.com>
X-ClientProxiedBy: LO2P265CA0107.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fef7663-b10f-46b9-1778-08da26bd395e
X-MS-TrafficTypeDiagnostic: DM5PR03MB2492:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB24926A543BB4A674EB74C9EC8FF89@DM5PR03MB2492.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j82/i0KHHJrk21CX/1hn8yLlq5qpYCYIUmxT5r0k4h5pmFuv0OHFLYKagxmQdnumFEyPQ44d7kgOziUcC7UXW9eFvpmCv4C5qcYSsHPh2jVzLfofotwXl4zmE0XqPDLivly164B/ZKWpRXoEa/3rFbWjQh6/gBJalQF8LqtDstJFsLi7i+ut8YHT+2RrQtwS2GoRqwq8pV1ADLB55zf+dBKVv8LBBbR3/Ycy6XsRo5TnTNdW6LEHTIB/Jf5CotXBggx2wW5MSN9tBdM9b6CbdYVGwQkYXb0uPakbcHkJa5KWsXi5zALTez6+ZhgZlLr03Qyfa53j2/7TTkysNSu6yrYGac1Kvp+Ur7cvspjvdEIV+8rg9gIBwKCYFE/OygIcwnnEdoFfhmSKKHi6dnzIlVqU0eJ9vpQWah2Ojp3b4stOXYCQoOgTssaOtUsE39ysNHOjmXzjkWzDRNarpmAJ1vpa8P39C9ZspGQKbzQbpsLwxBTnMpHi/BYTXTOcKeQRO+Xys4cwmtJko4XPsSJuHGFkoEl8osGcuj+JPLQb3nyfox1CbcTejqP+Tyk6QA9ikgbpqPAFeyeE0ks4pTZ2G3hBAGsjeopbXbp0e98DbVHj16hTpPsuWINcI9ZXukdbRmjnE+DNT7ZhKEMnB08H6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(53546011)(186003)(83380400001)(2906002)(9686003)(6512007)(6666004)(6506007)(6916009)(316002)(54906003)(85182001)(86362001)(6486002)(508600001)(5660300002)(26005)(4326008)(66556008)(8676002)(8936002)(38100700002)(66946007)(66476007)(7416002)(82960400001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emdCU3JCM2MzcUJoVGIvMG00VTZhYk9NRHdhbXQxRVZaR0ZBVFV1Vkd4ZE8r?=
 =?utf-8?B?Qnd0LzBGY2l0aVZXVkJyREZzNlEvejF3RE9lNll4WmJGMlZkMk03QmxJU0Jx?=
 =?utf-8?B?Um9hODVSaXA1MlFtdUxUTzRNc3JqTVFQcjVtSlBLdDJvQThrWGcwSzBLRXJy?=
 =?utf-8?B?Z1Z6MzVIa0k2cmRIQ3paZ080V251QkJNYVcwaHdtN0JWSFZ1Sk1zeVZsNVZG?=
 =?utf-8?B?ajBkV1RRZGQxR2g5VVZ4OEhCZTQybkkxdmdMNkZSOUFOTys0UEJOSlhBRkRC?=
 =?utf-8?B?OTJFREpaOGk2MUtjb3IrU0VuZU9JRC96bkpIY0ZxRmxsNVlHbHdPRFRLdHh4?=
 =?utf-8?B?ZnA5YjBNNVUrYWJLTCtHNC9odEJyV2dCVkFmQXJDZEdpM3A0Z3k5cXVXSjcy?=
 =?utf-8?B?cHZ1bWgwblBiaWErNWFQbWpxbWtTL25zcXpNRVI4enNIVGJZTU1rMW9ma1Av?=
 =?utf-8?B?aVBGMGx5MTQzblI5VVcwTVp3VmpMelAwMmlQcDd3eUk3bmozQzlzekU0bzdK?=
 =?utf-8?B?V29EKzN6T1BzNGRDaFBCR2tHQmNGdVVNbjkwbmhBVUZnZS82Y01ONFUwVWQ3?=
 =?utf-8?B?SnJoM2JNS0ttUTJsRS84K3VRbERRbE9ILzVVRG53c2RhUkF6MS8wZ3pWWS9M?=
 =?utf-8?B?R0FWWGMrbWJ3dUtYS1VRcVd3SmhYZjJqemxMQ0lkTUc0ZXVpZGJDbndYeStN?=
 =?utf-8?B?bUtLS016bUV2S0ZjekdTWjByZlBHejVsdE1rS2F0Q3BwR3BuaEZtQzhTSlhY?=
 =?utf-8?B?N2VCeXdJOWluOGNYamNHaElHYzNWd242YzVqUDI1TklFa1h0WGgrVWZhTjha?=
 =?utf-8?B?aW52cEw3eVNFOTdteFpDa2ZJS1NLZkY3Q3NpRU8xWGFma3R1ZFZxUDhGQ2J2?=
 =?utf-8?B?OXloNWhXNCt6Nno4Mkt4TFdLeWdlMjJMVmVSbUF3SUcrdnk3UVFHdVdhSjZP?=
 =?utf-8?B?V2tHREs2OFBjc3lYckczeGVreUFsSWo1aVI2SkJ3NG9ZVFFDYXNXZi8yR2dw?=
 =?utf-8?B?OVZsTm1jZk0zTDZEWXRiUitjSXlwdzFSdzBiNGU0WmVLNzRVamZQeE1NRDRv?=
 =?utf-8?B?SXk2eUd4clNmR05WYVpIR3NJeTZCSEQ1Rlh3M0gwWHY4UXd3RWhhajRzRGFN?=
 =?utf-8?B?QVhuODdyT3Z4TzlRMG4rQzZFNFpTdHVtZWxYdUwyR2VJa2w3MXZsdFZCaTdL?=
 =?utf-8?B?NVJyMVp5MVlIeDA0ejVIMUdVRThrd1FvWkpESVlzdWZtV0cxMUNDWjM4Y1BD?=
 =?utf-8?B?cCt6NG05WkhIbnlCWWwzODY4eEZwbjNCT1Ivc1pRSEFXTWUrOXY2ZlhMZ1Y5?=
 =?utf-8?B?bW5TRzhERDdoZXdrcGFNZ1B6R2hXd2UySUQzRE9IeWpiWWtVSFBlNWJXNml2?=
 =?utf-8?B?VUUwRkw5WUhnbmoxRjdSc1hHb1hXQVF5aWVtUy9wY005WmM0bm1tdEFmNW5X?=
 =?utf-8?B?blB1cVpBVVlsQ090V3FDOTdkdUJJOTI4aVVkY1pOSEJwdFJ4bnJLT1lnTkNm?=
 =?utf-8?B?aFBrRmljb3VveFJLOFR0SDJxZHo2emxwOHlQdTNoQ1YzVVB6anVRVTU1VkZv?=
 =?utf-8?B?RlRrRnZ1MjFTYmhaYlhSa3EwWDVvNGdSc0pNTCtTSGMwUEZkYTdoUnpPWEZZ?=
 =?utf-8?B?T0dWY2ZoOHQyZjkwakt2RFBOL2NjWS9STFRreDVSRFY3bGNvQWdwZkdERVhU?=
 =?utf-8?B?dERmZXlpMHZLN1lvNnhRTEo1OVprTHNsZzMvb0R3UVhYVVU3N0FsRENDc0N6?=
 =?utf-8?B?d1YwVUc1WHljQnhGbTVqTVBTaG9FNzZ3dGs3dVlVQlYvK0RlNitHR2hWODdH?=
 =?utf-8?B?cTJrdVIyLzJsT3hTckZ5eXVsUytUK2YrT21yU2hpemhmMUtaRHNpbXNaU2Q4?=
 =?utf-8?B?UWlTMXp2VVBrQ282N0ZhV24vMVF2Qk84RFV6WkdEMG9Mc0Y4SmU3UEZCQ3NC?=
 =?utf-8?B?aTNXeW54Y3ZzYmxRWXRkK043cGcyRTFZUDQ1VTJ5TWRuQXQrR3FKU0lHeGVK?=
 =?utf-8?B?VWdORUJvV2xkdkx1S2VuL1dSWDJiVXp6SWRWQkhKbGtiRWlNeW9pWjZJU0NP?=
 =?utf-8?B?MVVQWG9rNnduN01ldkZTd1F1d1BnbTZCSitvZm9TOWV2TlFWOXRFUzhSd1Bk?=
 =?utf-8?B?TzlRaytSNlhYOUdaZmZXTTI3NHREaTVRaXJoVjlFUXhET3VJcjdxSUtUMWJ1?=
 =?utf-8?B?b2EzWXhZVWZ3UDhIK0l5RDJlR0JHZXAwNWw4N3R3RjJxRTJHV2Q2dXlYSmEz?=
 =?utf-8?B?Wi9VVTU2ajN0cG1ndVJVNGFucFhMcUc4bDNNVWkvMkkyanB1dHNKK0hiZXBx?=
 =?utf-8?B?K1NNVHdGaDFwbHphaHRsc0JvWEZxQ284SlphWkF4UmtEL1ZaNEVpZTdtNTJX?=
 =?utf-8?Q?Rwy4dFY1I7wAnamI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fef7663-b10f-46b9-1778-08da26bd395e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 13:12:18.3094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQsvnLpUg9AM0ljlCmgJyKBiaxZzmLzPnRrPPOzr8OsvinCai/Z2aQtTN8wo7JiRHUaRSUI6MhJbWtRSksxb5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2492

On Sat, Apr 23, 2022 at 10:39:14AM +0300, Oleksandr wrote:
> 
> On 22.04.22 12:41, Roger Pau Monné wrote:
> 
> 
> Hello Roger
> 
> > On Fri, Apr 08, 2022 at 09:21:04PM +0300, Oleksandr Tyshchenko wrote:
> > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > 
> > > This patch adds basic support for configuring and assisting virtio-mmio
> > > based virtio-disk backend (emualator) which is intended to run out of
> > > Qemu and could be run in any domain.
> > > Although the Virtio block device is quite different from traditional
> > > Xen PV block device (vbd) from the toolstack's point of view:
> > >   - as the frontend is virtio-blk which is not a Xenbus driver, nothing
> > >     written to Xenstore are fetched by the frontend (the vdev is not
> > >     passed to the frontend)
> > >   - the ring-ref/event-channel are not used for the backend<->frontend
> > >     communication, the proposed IPC for Virtio is IOREQ/DM
> > > it is still a "block device" and ought to be integrated in existing
> > > "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
> > > logic to deal with Virtio devices as well.
> > > 
> > > For the immediate purpose and an ability to extend that support for
> > > other use-cases in future (Qemu, virtio-pci, etc) perform the following
> > > actions:
> > > - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
> > >    that in the configuration
> > > - Introduce new disk protocol field to libxl_device_disk struct
> > >    (with LIBXL_DISK_PROTOCOL_XEN and LIBXL_DISK_PROTOCOL_VIRTIO_MMIO
> > >    types) and reflect that in the configuration (new "protocol" option
> > >    with "xen" protocol being default value)
> > > - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
> > >    one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
> > > 
> > > An example of domain configuration for Virtio disk:
> > > disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, protocol=virtio-mmio']
> > > 
> > > Nothing has changed for default Xen disk configuration.
> > > 
> > > Please note, this patch is not enough for virtio-disk to work
> > > on Xen (Arm), as for every Virtio device (including disk) we need
> > > to allocate Virtio MMIO params (IRQ and memory region) and pass
> > > them to the backend, also update Guest device-tree. The subsequent
> > > patch will add these missing bits. For the current patch,
> > > the default "irq" and "base" are just written to the Xenstore.
> > > This is not an ideal splitting, but this way we avoid breaking
> > > the bisectability.
> > > 
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > ---
> > > Changes RFC -> V1:
> > >     - no changes
> > > 
> > > Changes V1 -> V2:
> > >     - rebase according to the new location of libxl_virtio_disk.c
> > > 
> > > Changes V2 -> V3:
> > >     - no changes
> > > 
> > > Changes V3 -> V4:
> > >     - rebase according to the new argument for DEFINE_DEVICE_TYPE_STRUCT
> > > 
> > > Changes V4 -> V5:
> > >     - split the changes, change the order of the patches
> > >     - update patch description
> > >     - don't introduce new "vdisk" configuration option with own parsing logic,
> > >       re-use Xen PV block "disk" parsing/configuration logic for the virtio-disk
> > >     - introduce "virtio" flag and document it's usage
> > >     - add LIBXL_HAVE_DEVICE_DISK_VIRTIO
> > >     - update libxlu_disk_l.[ch]
> > >     - drop num_disks variable/MAX_VIRTIO_DISKS
> > >     - drop Wei's T-b
> > > 
> > > Changes V5 -> V6:
> > >     - rebase on current staging
> > >     - use "%"PRIu64 instead of %lu for disk->base in device_disk_add()
> > >     - update *.gen.go files
> > > 
> > > Changes V6 -> V7:
> > >     - rebase on current staging
> > >     - update *.gen.go files and libxlu_disk_l.[ch] files
> > >     - update patch description
> > >     - rework significantly to support more flexible configuration
> > >       and have more generic basic implementation for being able to extend
> > >       that for other use-cases (virtio-pci, qemu, etc).
> > > ---
> > >   docs/man/xl-disk-configuration.5.pod.in   |  37 +-
> > >   tools/golang/xenlight/helpers.gen.go      |   6 +
> > >   tools/golang/xenlight/types.gen.go        |  11 +
> > >   tools/include/libxl.h                     |   6 +
> > >   tools/libs/light/libxl_device.c           |  57 +-
> > >   tools/libs/light/libxl_disk.c             | 111 +++-
> > >   tools/libs/light/libxl_internal.h         |   1 +
> > >   tools/libs/light/libxl_types.idl          |  10 +
> > >   tools/libs/light/libxl_types_internal.idl |   1 +
> > >   tools/libs/light/libxl_utils.c            |   2 +
> > >   tools/libs/util/libxlu_disk_l.c           | 952 +++++++++++++++---------------
> > >   tools/libs/util/libxlu_disk_l.h           |   2 +-
> > >   tools/libs/util/libxlu_disk_l.l           |   9 +
> > >   tools/xl/xl_block.c                       |  11 +
> > >   14 files changed, 736 insertions(+), 480 deletions(-)
> > > 
> > > diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
> > > index 71d0e86..36c851f 100644
> > > --- a/docs/man/xl-disk-configuration.5.pod.in
> > > +++ b/docs/man/xl-disk-configuration.5.pod.in
> > > @@ -232,7 +232,7 @@ Specifies the backend implementation to use
> > >   =item Supported values
> > > -phy, qdisk
> > > +phy, qdisk, other
> > >   =item Mandatory
> > > @@ -244,11 +244,13 @@ Automatically determine which backend to use.
> > >   =back
> > > -This does not affect the guest's view of the device.  It controls
> > > -which software implementation of the Xen backend driver is used.
> > > +It controls which software implementation of the backend driver is used.
> > > +Depending on the "protocol" option this may affect the guest's view
> > > +of the device.
> > >   Not all backend drivers support all combinations of other options.
> > > -For example, "phy" does not support formats other than "raw".
> > > +For example, "phy" and "other" do not support formats other than "raw" and
> > > +"other" does not support protocols other than "virtio-mmio".
> > >   Normally this option should not be specified, in which case libxl will
> > >   automatically determine the most suitable backend.
> > > @@ -344,8 +346,35 @@ can be used to disable "hole punching" for file based backends which
> > >   were intentionally created non-sparse to avoid fragmentation of the
> > >   file.
> > > +=item B<protocol>=I<PROTOCOL>
> > > +
> > > +=over 4
> > > +
> > > +=item Description
> > > +
> > > +Specifies the communication protocol to use for the chosen "backendtype" option
> > > +
> > > +=item Supported values
> > > +
> > > +xen, virtio-mmio
> >  From a user PoV, I think it would be better to just select xen or
> > virtio here, but not the underlying configuration mechanism used to
> > expose the devices to the guest.
> 
> I got your point.
> 
> 
> 
> > 
> > We would likely need to add a different option to select mmio or pci
> > then, but that should be set by default based on architecture/guest
> > type.  For example on x86 it should default to pci, while on Arm I
> > guess it will depend on whether the guest has PCI or not?
> > 
> > In any case, I think we should offer an option that's selecting
> > between xen or virtio protocol, and the way to expose the
> > configuration of the device shouldn't need to be explicitly selected
> > by the user.
> 
> 
> ok, for now I will use "xen and virtio" values for the "protocol" option,
> then internally toolstack will assume that "virtio" really means
> "virtio-mmio".
> 
> When there is a need to expand that support to "virtio-pci", we will see how
> to deal with it from the configuration PoV, probably like you suggested
> above by adding another option (e.g. "transport") with default values based
> on the architecture/guest type.

I think this likely also wants to be a separate field in libxl_device_disk,
which could be left empty and libxl will attempt to set a default.
For example have the following in libxl_types.idl:

libxl_device_protocol = Enumeration("device_protocol", [
    (0, "UNKNOWN"),
    (1, "XEN"),
    (2, "VIRTIO"),
    ])

libxl_device_configuration = Enumeration("device_configuration", [
    (0, "UNKNOWN"),
    (1, "XENBUS"),
    (2, "MMIO"),
    ])

libxl_device_disk = Struct("device_disk", [
    ("protocol", libxl_device_protocol),
    ("configuration", libxl_device_configuration),
    ])

I don't like libxl_device_configuration much, I think is too generic,
but I can't think of anything better.  Maybe others can provide better
names.

Thanks, Roger.

