Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFA855190B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 14:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352762.579620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Gda-0003WI-U9; Mon, 20 Jun 2022 12:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352762.579620; Mon, 20 Jun 2022 12:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Gda-0003Tw-RD; Mon, 20 Jun 2022 12:36:14 +0000
Received: by outflank-mailman (input) for mailman id 352762;
 Mon, 20 Jun 2022 12:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruGu=W3=citrix.com=prvs=1630bf34c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o3GdY-0003SO-Mm
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 12:36:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eddac4c-f095-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 14:36:09 +0200 (CEST)
Received: from mail-bn1nam07lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2022 08:35:46 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5664.namprd03.prod.outlook.com (2603:10b6:a03:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 12:35:44 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 12:35:44 +0000
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
X-Inumbo-ID: 8eddac4c-f095-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655728569;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=RF9cLs8rPB7KP1minkLNrdTlLRnKkcWcJkUGY/AVWGo=;
  b=OqIIX7BSQ6if2yx+mZ1z+Sa9rqVcrbSCg6K+oiGDx2ooyIMAXE8IWCcy
   ybORZXcvebkngJDRQ4ynf+EKv/ETW17Q/7jayOKvkZlPMS7Nbe2mRiKoG
   hEw/KhWsNDh7vpZkrNRUlA7QuGvqM5jUNe2mtDxBFhCXa/EWutlN8W+od
   c=;
X-IronPort-RemoteIP: 104.47.51.45
X-IronPort-MID: 73332866
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2zHHeq5pNxyzR0gypFRkGwxRtFPGchMFZxGqfqrLsTDasY5as4F+v
 mocXDuPbPeDNmugfNpwYdjloB8DuJLcmtQ3GQA4pHs8Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbgXVvR0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSzalwCMoHek94+Sh5nVDpdJ4xYqa3udC3XXcy7lyUqclPK6tA2VgQcG9Rd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiTo4MFtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGYD8wjF+/RfD2776BddiZrrANrudc2jd/d8zhrHj
 0P3xjGsav0dHJnFodafyVq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRolG6c8JSL
 QoT4CVGhao97kuwVfHmQga15nWDu3Yht8F4FuQ77ESHzPPS6gPBWWwcFGYdNZohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnHr6PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:CBvTxKMh6KFwB8BcTyf155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBDpTnmAtj5fZq8z+8N3WB1B9uftWbdyQ+Vxe1ZjbcKoAeQZhEWiNQtsp
 uIGpIWYLOQMbETt7eB3ODSKadE/DDoytHKuQ+IpE0dNj2CJpsQmDtRO0K+KAlbVQNGDZ02GN
 614ddGnSOpfTAyYt6gDncIcuDfr5mT/aiWKCIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7WQywPa1UXU85NK8eGRvOdrNYipsIw4Oz/sggGnaMBIXKCDhik8pKWV5FMjgL
 D30mUdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxyL5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjxUC3abFuJ4O5kLZvsn+8SPw7bWPHAcEcYa
 JT5fjnlbprmQjwVQGYgoFtqObcLUjbUC32AXTqgfblrAS+rEoJs3fw+/Zv4EvojKhNLaWsx9
 60R5iAx4s+OvP/U8pGdZY8aPryLFDxajTxF0/XCWjbNcg8SgLwQtjMkf0I2N0=
X-IronPort-AV: E=Sophos;i="5.92,306,1650945600"; 
   d="scan'208";a="73332866"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edw1k4evUgB/+3rZjxrHSMSaOD6wBirbfHbGxpL5nzTylRBdclrnpmYMXXrZoXkoJE646+DpBGjaAjnfVw1bdex2wvUZu87wkCDNri2SX38I7w29uEHa4gr8EF0uWI9I/dsNAQInI7cgUHC+IKisor7pP6DdZb+OFc8i0CLKt7AWjAGSNOhLU2bjkCkVoM73q/056QJlyi589JajWHoydPyuYAPidTON9rYWrueGTdWbRNaCnuHl+LcXnEl617iHob7o7jGWIr4KSSPymkulk2jpRycWpqz4xOVPIXHpuZjxLg3A65tO27OTdwvMPcKBJFK3dgy4cRQurxUsVpPt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqzsEmV6kSo5TqA5YhqsX2vWi4HCPrafXmwpwSoqiJk=;
 b=TKE3FFJURag25E121PbRbsClE+rqLojZQ8URMYmqdiunqP2opsCrkE+KknrmI1JIVhf2b4zSjjiFdmwmhWkjNmRnlhq95jlNdtDgBLdd0oGe1FOH9ieJyZ9SM3Um0C9IezJhPdfkin2p23aDp1ZYbBgG71njopcs9KNt/XhuI/oAgdOT5RRWcsNyYa9suKE3BQLkVExwU/nMXUdS24QrfZwJ4XIUYyjU9dCCr2EUEBSX6awwHs6FnW1d/jUb37jz+zJonSkzji6BhbtP0JO8Qvz5dWN3J4NE+xvGBVezL0Ohk7sNAq3mEvfaGD5rLGUBE93fgLE8qEnKQPmBYz5P+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqzsEmV6kSo5TqA5YhqsX2vWi4HCPrafXmwpwSoqiJk=;
 b=XsivyPnkjxU4xSEGFjcFyI6ESVKeRPh/ILG2ymQJagHRkunNsfljIvJr9Mw9SJ/mVGSW/Axx/SnVe0Fe91WnTf8RtyLRuIGdTu25dh0fdvkNqBNsaocnYM8cPoKal0/gB3tiKo8/n1WSviApFQZqAc/jNFVwNppwqA7Wz4dzzJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/include: drop leading underscore from xen_list header
Date: Mon, 20 Jun 2022 14:35:00 +0200
Message-Id: <20220620123500.2866-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 708469f1-15a3-4c48-988f-08da52b96523
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5664:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB566475AA45992B95445D7D8B8FB09@SJ0PR03MB5664.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eyfxsx/1dcnybseddKa/LNVBO+wtbRk2wIIY9u7jacgm5TEr6qwqxHZVyGN4Gck7lFv3+Ocw94+9QnsrzZPwsn8T1P773W8EmhdndHDWdTjqmJwnLQh3yLi/YJCEdeLB2xxfPkm53FUvsX1qrtE96Jxrijry2yLutzD2FJYQ9X23LGyJPpoJVz2nraeSAaoGbveeTZ5mDupmvkSP+QrkpilapMvb/+0iadFWDHkecm20NipxLNq3YPt3UXlijtXRD/HKbIPN1FpYF+4VDbSD14zeWl+MIXe4bjUH9hvcyVXKlAf5xtN5Tq45jGaVrsylXjE7qRuUhpReU3KrSWsXgZ+rfUznfqSwL/LZP476RHqlrj74yfXA56I0SQ24mlDxUpbCdO9DJ4WSqW++EhYgvji2FBIy0QwPgrRbltNiQD/Q+hAZaFb4W0BCLTRb8Ung7dYeh8MARXH5hiibUUZFwRsGTtMwQWXZ9J/aCbLsbVL2cPklrVrXMOtIgnCQRWOaRVHVVHCh+ZZ/a3pLHUBWkzJLb7GHHiEGHozPddfaskfj+8nkqr3zG2M/sFykBYcazA9VnEugwDIXZ5dbtPmVhzfjQzAPgRdNZzMMDzndU2OOmIc7U5t1KbG5Y6zVinRpW5wmKZud66aVfHtkbPe+VQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(8936002)(5660300002)(478600001)(36756003)(82960400001)(2616005)(1076003)(186003)(41300700001)(83380400001)(2906002)(26005)(6512007)(66476007)(66946007)(86362001)(66556008)(54906003)(8676002)(4326008)(6666004)(38100700002)(6506007)(316002)(6486002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3FGT2tOVnArRXNhaHZjRnVIOGtRY1hZd1FhT2pNTEpJT2tseldYNDUzSmc5?=
 =?utf-8?B?dGdWY0FYaEhTc1VjbysxSzBtNWMwQ0VYU0tGWkxzYXpqaUo2ZloyVEhvdHBU?=
 =?utf-8?B?azFlbDBENEkzeGhPSElZaVF6MTVENWFlZ0g4ZXk1YXRBZ2xQNVNhMUh4MFVr?=
 =?utf-8?B?YWwybTd0dEhFOEFpOVdiMk52SThjSUI0S2J0eVhQRzR0UE9WNGtxM1RNdmdq?=
 =?utf-8?B?QzlxQVNoajRoMDhCTzEza2xJbnVPekljL2JrVTdMZUlaMXZCZW1FK1ZGbGtm?=
 =?utf-8?B?ak9kNllNZFgzMHBGWjBhZ2o5bWc1TkJERlMxSmh5Q01oSmxGVTU4a1JualQy?=
 =?utf-8?B?MkZWQzRWd0MwZEFqQkhsc2RVZXVRNGhkamdkTEFwTUYxR2wxc0dwKzY4RDVS?=
 =?utf-8?B?enRQYXR0QkpjbFNJY2l1RFhlRlBEMlJ4QVl4U1puRWZRcnhZSzE4Y3VyVXBV?=
 =?utf-8?B?TzlYQnNwODZNcGdnb1owUklNSm1KSGhXcWFqbVRzc1d1YWgrNkZSTE13blNN?=
 =?utf-8?B?enpiU243ZS80dXdwV0svRERUSUpqQ050dVdQdXBQcjN0RklxdUNUaFVGNDlu?=
 =?utf-8?B?YlFDd2pFMlR1ZTMyYm91MXFnM29xU21PbFNDUUU4RnRyQjk5SktnUTRBMGpM?=
 =?utf-8?B?WitUdVkvVlMwSitVZzRBalMvaDcvaHFDeGoyb0dOTHM1WEs5aEdab3BFNSs2?=
 =?utf-8?B?OEtoM2lQcXp1Q3BWOGphd0JxWlVtQXllSUNBcnRrb0lqQWtvSVRuZkd0N3E0?=
 =?utf-8?B?RDVIRnpxM21iakJmemE1WlpHRmtFbGJEUEpGbGlnVmhrcVpHRHVvUHJzdkh0?=
 =?utf-8?B?bWlnRlg5UGF3YXFDTjFoNytRT25tZjZrK09ISjAyN2VENUt1Wks3ZzFqd3Z5?=
 =?utf-8?B?d3UzRzhXYjdiWUpwa2l4aUZxM3VjelJERmJKTTZlZERHckpHc1VXTDJPYStS?=
 =?utf-8?B?T0thSm81Q2JPZUpDdnFrVUZXSnV5eFFTaEdVWGRuOVcxTnY0RE5vWkc2Sjdt?=
 =?utf-8?B?eGNGMFd4RHRoVjdhTlkwL21YNlVSOTNpdjhTZUlLdWtKMVJ2MUpnaW9QYmRi?=
 =?utf-8?B?c2tVZE1ybVhDTzlxSkh3VWE1Z1ZzZ2lGekJhZlNnU3ZxYko1VWRRbjkzSEYy?=
 =?utf-8?B?cG1PeHI0Y0tCaFJ2ZTBjRWN5MEdKdFRPVjFpdWFKY3NwZnJoSHViVFpVWFpU?=
 =?utf-8?B?TzNGUnQ1K1V3c01TUHpNd25md2l3d0JybTlmUUpVV1Z6dVNxV2paa2EwdFU4?=
 =?utf-8?B?U3dqOXBhZ25nQW1uTGVEc1RXYm9LckZoZXA3N1FYVGxWZHROa1QxWG9BTzg4?=
 =?utf-8?B?MHExd0QzNTFiU3FSZmpBTmhlQjBIY2pHRWM3d1kzeGF1VjZjdU9qd3RoQWFx?=
 =?utf-8?B?NlY0RlJGaDV5VCs1aEdETVZlRHBjNktFLzRleVFMSWlycjl4OC94VXVDektq?=
 =?utf-8?B?VVFRZ08zWDlhaHRhR1ZpUkFlZ3U5eGxQZlg2NjBtUXo4alFkai95WHVYWjBT?=
 =?utf-8?B?ZkUwVHFnU0VEUGRNSTNmd1VnMTJzaEVpMHFSM1NRaktGK2ViYzhna1ZNTFlL?=
 =?utf-8?B?TFQwQmxyZlZSYTdiVXlYOU5jTnFxbU1Sa3ArMGhraG5tQ21YRFl2Y3F2T1lJ?=
 =?utf-8?B?SW5yWlRJQmpUcjAvejJpK1hEdnRjOFRiYm80ZldTakEzTlNIdGdtVEdIN2xM?=
 =?utf-8?B?bEJzZGVaM1BnVGo3U2dSK1g0dGtDYnFNOGpBdGJ3MXpIOW8xeGd0TkJhYXRM?=
 =?utf-8?B?RklWTkxxWGlVR2R2TjRsTUFabzNxR0dKb0x2ODZMSklhT0sxZVAzSk9IMkdG?=
 =?utf-8?B?TEdLeitNUWFnT1ZNUjhUdWVFNkhXMERVTTlvcEpzKzluL3ViVmxZRVNkb0Ra?=
 =?utf-8?B?Y3E2UUFGYjJteldsRGFQZkkrak5pYlZiS2w3MWd4eDE3WmpuK3l4RVJ0SGdy?=
 =?utf-8?B?c0tYRFF4RmdjSlBEZXF0TXFNcXF6aTVmR1FSdXAyL1ZuNW1hdHF6ZEZPeFJl?=
 =?utf-8?B?b2Rqa2c4NThya3lMNC9ZUmdGbzFEZXliOEVvYjdOZjViR21FV2tkb21sZ0Zj?=
 =?utf-8?B?UE1IaFpUTTlUMFpjdGlMeXlzRHd5N3h6cW41TFFUSlBJZlBBYjVlc3dkNGYz?=
 =?utf-8?B?M1B3VTF1bU5ROGVldkJ6OE5RM0JidHhBUnJPUnhWY0dZMlVaaVVwUGNBamZ0?=
 =?utf-8?B?YUxHREhQY2JFN0cyNkNkeHQrLzBrSkE2RG5pSjNSSTRGVWhzWnh1NVlpalBx?=
 =?utf-8?B?ZnJpbEMwTVZaREhPZlZXS1k0cDJlc1R1T1l5enMvKzBtbEV1KzBaNEdOWUFV?=
 =?utf-8?B?RDhBZDdKQXcyKzRvdlpkOFE0S2tkbmZ0V3BBSEtHdWZPWklUeTBEdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708469f1-15a3-4c48-988f-08da52b96523
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 12:35:44.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQ1xEmLRdLWH7is87ubUx1SnRQHiBBa4aSQOyVtZCs75dRoQYF7mCjC9oZWIbCOPda0+Qz1lxyjJheC+h+l4yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5664

A leading underscore is used to indicate auto generated headers, and
the clean use of 'rm -f _*.h' will remove those.  _xen_list.h also
uses a leading underscore, but is checked in the repo and as such
cannot be removed as part of the clean rule.

Fix this by dropping the leading underscore, so that the header is not
removed.

Fixes: a03b3552d4 ('libs,tools/include: Clean "clean" targets')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/Makefile                    | 4 ++--
 tools/include/libxl.h                     | 2 +-
 tools/include/{_xen_list.h => xen_list.h} | 0
 tools/include/xentoolcore_internal.h      | 2 +-
 tools/libs/evtchn/minios.c                | 2 +-
 tools/libs/light/libxl_qmp.c              | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
 rename tools/include/{_xen_list.h => xen_list.h} (100%)

diff --git a/tools/include/Makefile b/tools/include/Makefile
index 3a03a0b0fa..b488f7ca9f 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -70,13 +70,13 @@ install: all
 	$(INSTALL_DATA) xen/io/*.h $(DESTDIR)$(includedir)/xen/io
 	$(INSTALL_DATA) xen/sys/*.h $(DESTDIR)$(includedir)/xen/sys
 	$(INSTALL_DATA) xen/xsm/*.h $(DESTDIR)$(includedir)/xen/xsm
-	$(INSTALL_DATA) _xen_list.h $(DESTDIR)$(includedir)
+	$(INSTALL_DATA) xen_list.h $(DESTDIR)$(includedir)
 
 .PHONY: uninstall
 uninstall:
 	echo "[FIXME] uninstall headers"
 	rm -rf $(DESTDIR)$(includedir)/xen
-	rm -f $(DESTDIR)$(includedir)/_xen_list.h
+	rm -f $(DESTDIR)$(includedir)/xen_list.h
 
 .PHONY: clean
 clean:
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 51a9b6cfac..7ce978e83c 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -747,7 +747,7 @@
 typedef struct libxl__ctx libxl_ctx;
 
 #include <libxl_uuid.h>
-#include <_xen_list.h>
+#include <xen_list.h>
 
 /* API compatibility. */
 #ifdef LIBXL_API_VERSION
diff --git a/tools/include/_xen_list.h b/tools/include/xen_list.h
similarity index 100%
rename from tools/include/_xen_list.h
rename to tools/include/xen_list.h
diff --git a/tools/include/xentoolcore_internal.h b/tools/include/xentoolcore_internal.h
index deccefd612..1be014434d 100644
--- a/tools/include/xentoolcore_internal.h
+++ b/tools/include/xentoolcore_internal.h
@@ -27,7 +27,7 @@
 #include <stddef.h>
 
 #include "xentoolcore.h"
-#include "_xen_list.h"
+#include "xen_list.h"
 
 /*---------- active handle registration ----------*/
 
diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 8ff46de884..28743cb055 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -20,7 +20,7 @@
  * Split off from xc_minios.c
  */
 
-#include "_xen_list.h"
+#include "xen_list.h"
 #include <mini-os/types.h>
 #include <mini-os/os.h>
 #include <mini-os/lib.h>
diff --git a/tools/libs/light/libxl_qmp.c b/tools/libs/light/libxl_qmp.c
index 8faa102e4d..6b0cd607d8 100644
--- a/tools/libs/light/libxl_qmp.c
+++ b/tools/libs/light/libxl_qmp.c
@@ -63,7 +63,7 @@
 
 #include <yajl/yajl_gen.h>
 
-#include "_xen_list.h"
+#include "xen_list.h"
 #include "libxl_internal.h"
 
 /* #define DEBUG_RECEIVED */
-- 
2.36.1


