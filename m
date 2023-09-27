Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0097A7B0760
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 16:54:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609082.947941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlVvH-0007gW-3I; Wed, 27 Sep 2023 14:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609082.947941; Wed, 27 Sep 2023 14:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlVvH-0007eF-0M; Wed, 27 Sep 2023 14:53:55 +0000
Received: by outflank-mailman (input) for mailman id 609082;
 Wed, 27 Sep 2023 14:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUTS=FL=citrix.com=prvs=6275c33bf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlVvE-0007e4-SC
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 14:53:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa68d857-5d45-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 16:53:50 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 10:53:47 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB5529.namprd03.prod.outlook.com (2603:10b6:806:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 27 Sep
 2023 14:53:45 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 14:53:45 +0000
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
X-Inumbo-ID: aa68d857-5d45-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695826430;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CStWi641TAwaJ4yfoBBemV1EpvOh4njKbK1MzZnocro=;
  b=X+AF706Wn1LRI+7z401rC3dfG4GSZ9DIY8glnUMfzYp/O+fsywgG51+f
   xvFm++Qp13F9/Rc1WoHdE49kdy+L2Oa0mWiwFj/fZcz/rEjsXiaw4xb6x
   gUOKsvAG3nHJK4mU7cyXQv210A9ocf2y7op79iFq9HJMB8snwnINXA2n/
   c=;
X-CSE-ConnectionGUID: dknzheeOTkiyZ2Eziq9CCw==
X-CSE-MsgGUID: KZUUhhySR46WjyyQZEzzqg==
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 123972727
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:LmJYxqyzbc3ipJi3hQt6t+f5xyrEfRIJ4+MujC+fZmUNrF6WrkUBy
 DYWCGuBPvvfNmf0c40jO97ioxkHvJ7Wm9M1TQJu/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QRvP68T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KW1N8
 +4YJT0qUhOCltDs7aC6U7hHrdt2eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVIguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WUzHyhB9hNfFG+3t1YvWCTxn0oMkFIalmqsMCLp1ysQt0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWulkIpcsC1qH+8VWZhTup/8LNVlRsuFSRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGe0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:cg1Ru63oToSVuOedvd1oAAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:gqpmKW8a2NTIPQxiWpWVv0IXHNIlf3D68HTRMn3iJHRoUey+YkDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AbxZFrg6j8FBzYVu5dRautk2WxoxL0ZmTCEAcqq9?=
 =?us-ascii?q?a5faGJD1JCRqPni24F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,181,1694750400"; 
   d="scan'208";a="123972727"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GB6gygtiPnJ1OZ0PHv7eBOH9rNfxc4hgM9Ce2cmIaVf8kT0koNhpOO0ZL24Z3ojegDuoYHh7HuFtlswr7HRbQol2NgOjF41gq23PUPcUe/YSDeDkhNChBg28gRtkOTw0U708AfiNHT7CVFV4JvaXMGKTja/nWyFlPuQWXeZa6xBPpg/zQnCwglsSPdySDKRJFzV0PP9qxnCIL9mKVLDf0k8RkbUYolhNJ5ub+ozQ9HtDjwnR+C0qWOWGsqKIBumjeB8c94rp2DP1Bktgl0bc5vZTqZpdtSP0V19q0FFQBD8Q5jNgSoafQ8y9GiQWeimGhduT5CWSh55uoGUtDYdLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0B+c3Frbz8Lioj9t2uzh+9DwcCQBmsRVoYsycP/KRf8=;
 b=eGGKAFEP1OzlYqDsrVpFFqlk91Jf+MFEwlT+FOmJGoVURENAZWT8sLxnkx5OXxVsxa6FGHF3PqXb7cU9aFZQFQO2mqtVIaNj4TwE9n8zB9Q2DwZ/3YgdesalTPl39gXqc89Qk9VYEM8OUQKWsVa9K/A/BiJkagKLO6C1ZUb9nEHuNB54IAlOu6Nn0uL6HIUaTnSi8c24xSNodY0618it2GoP9KqYTaSZTW9AOy+asTrRfkHBoQjbvhrFHtRqM5HQc7gRSIu8eh4nFcc3sEbc9F+ACpkVtQAGP/grZtfKSxc2LBQFjFLFCIPOns3zUvpcBG4NjYwuaI55nZ7q/NTsXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0B+c3Frbz8Lioj9t2uzh+9DwcCQBmsRVoYsycP/KRf8=;
 b=D08maTOxlT4gt2++AQ4nBcx8d68ZIfAr5KDS5TpnwcYtaVk+BNumh5aXIGTLliNrAXQQH5VJ2BLLRGrbnH1UTmTeC8GUKUbUL+K+VjO3W0cV8MBuNpTpw2wSmusD3+ejG67oK6Tke7ukW1ZVBIzH4BsVLB/FF8UUX3eBZz8NcIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Sep 2023 16:53:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/8] domain: map/unmap GADDR based shared guest areas
Message-ID: <ZRRB8ug8mNyvVsnK@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <140e906f-07c4-ae40-1d37-ae9966709289@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <140e906f-07c4-ae40-1d37-ae9966709289@suse.com>
X-ClientProxiedBy: LO4P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB5529:EE_
X-MS-Office365-Filtering-Correlation-Id: df99945d-3800-44e1-3058-08dbbf698bd4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eEZtxPeJygASWmO9gB9bntMwc3l0neNprHda7dva1Rwf/jwepNLVWrUhVTRiw1DT9KiGaezd1uB/0FAWiSIeYyvzuZ8RGZ+jfcR9qL8Qs7TtkKuzUkT1ZtwYFjSPaucZcxlAvpWaYzueOj22HrnPhJcdM3Ryp/9YM2VCVqGT4bSoczRF5RlrCU4Hdi2h+QfKxBoxM7fmh2FaqjE/+RzNoP75gpqG2WCWqSgwDn/YiaB3D707FMe9w52ogMrics6nZStFWQVIDAAgathwLXNxT0I39uxzrSOHxF/oi2haJWWvl4iGhy9G+M0mdJwC0zsWtwUsQ/tjYSRnIfi4WiQq7VvkdFqoJzOvXlji+dmpAND7c53n761HY3HSgJW1A89biylQ7P9vcjzk/qdaPYeWSkRrT0UkWUBjl8wVmyWKL70NRdfXs73VvlvnCwMnukJOTqQfPQM32oSKkv4tuVj2GDOoDISPeWLmXp248PvvmfP9yynYLsBJQmkwzCjXNQ2gz3OZmouC8azMbT0EkDuQDr9cnQDL5eq69vDWYIOCMYm1YIcvRKxD3QwmVuVX9UuK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(396003)(376002)(366004)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(66946007)(33716001)(316002)(66556008)(6916009)(54906003)(85182001)(83380400001)(6486002)(6506007)(9686003)(6666004)(66476007)(26005)(6512007)(478600001)(82960400001)(5660300002)(8936002)(2906002)(8676002)(4326008)(38100700002)(86362001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVVpYjE4Qyt4eTR0QktWOHA3SEZybDhmdGdtYjVUeE9UNi8yQjlHZVFLWU9X?=
 =?utf-8?B?TWVZaGF0QjduaWZQaGdEbG9WMnhiMEFYMUt2eUIvL1V3RHYxalBFWkU1ZUdO?=
 =?utf-8?B?RXFvN3J5Tm1zOGprRFcydWRqSmMxMzlXenMyMWtDZzNIOWxVTUJxb3RGSUdZ?=
 =?utf-8?B?R0plT0p0M2UrdlEwUEZLTFhQd2p5Zy9iTk1UcWZ4bUZDeVRjNlRMR2l5NjQw?=
 =?utf-8?B?aVZBMTdjdERwV2k5MCtaTUlpLzErNGg5YjVtdVJMbUZMTUNvdmxwQlE1RlZK?=
 =?utf-8?B?bVk5VWUvbGF6SjNzTzVxQzMrVGljZ2xlSGZZYmJpUSs5dVF4UU5qRE9qYWgy?=
 =?utf-8?B?VGN5aHVuMDkwSW1sOFV6a1JzQXhZTDJJN1pwc2pyZ2szck94SDdYUlp0QU9x?=
 =?utf-8?B?cTFiMVdHaCtWQ0FSVWJWR24yQTZMQ0Z0VUxHSVdSckgyQytPRGxQdk9mM3hB?=
 =?utf-8?B?OUdiY01tWmQ3V1k0Sm9VL2hEUEI0RGlaZVZVQ1c1WlM1YjhOaGhVV2c1dlpo?=
 =?utf-8?B?KzFDRUkrWDlHSzMzdWhXWCtXMnJHY3h5QTBHUTIzRlpZQnVXeDVLOFlWVDR6?=
 =?utf-8?B?WTRxWnMyZFlMQjZUMHdaa3B6bmEvTEt1ZUlNWmNPNkxRNEgxSmk3eGNLMHhQ?=
 =?utf-8?B?N0xNZncwTVdITnNRVUNkdXJPT3h5c1NMcjU4UGRwWXJGOWJNZ1VTWjhhY2R3?=
 =?utf-8?B?MUdyMEx3ZTh4OHhGa1hOL2xhdEp0STBOVTFHMUUyNFg1Ukp1d0tTV2VIMVBr?=
 =?utf-8?B?RExqQjNlQWJWNzZaaTcrRGRUMjJGUmZoL1hGaXI1bisyTDc3VmlzdkxJUFg5?=
 =?utf-8?B?aFNuV2J3d0M2VnJOV21lOEhyRG4yR1ZpTjhxM0phdyt4djNmd3prcFRsUW1V?=
 =?utf-8?B?bytnSzUxNENCaTJna1dUcUVkOENweUxGdmRMbWlaUTdsQkVHanJCY0VsY0Fi?=
 =?utf-8?B?bi9qZFViQzkvMjlQQzhPSjBwVjlCYktzdHgzNk9WVk1wc0pOd2RFYXVKa2xM?=
 =?utf-8?B?RFdxR3NteXk0K3pnOWh6a3Fub29PbmY3ZTdGc0FqZ213Rk5oQjNnejVIbmly?=
 =?utf-8?B?WjU4QVIvUTcrKzF2aDUzUU1JNFhITDM0a3RCVHgySGFFQkpmendadVVIYjRK?=
 =?utf-8?B?bjdLaUVhbHBTQ21TaVRCRzFleGtLSmdjWVRCWmV1OHE3OFRlalJCSlpKYmtI?=
 =?utf-8?B?RzJwNVo2a01PaVpJakRHRU1ja3NFUFgwUXRJT3crKzJOYWFKV0VQSXluRUlE?=
 =?utf-8?B?Skd5YS9MaXI0dS9Gb3NWQTZtQWJkK2NKNXB2RlNmREJNdGRQRXFtUG9HdVhu?=
 =?utf-8?B?ZHFNN2tueUx2SURnSEZyNzd4VDdMUFRjZUNpeHI2YVFWV1Y2SDlZTFBzQVlE?=
 =?utf-8?B?T1hITSs5ZGxJTzRrS3ZnczlIT1JlOHM5MHZXUHRjTWxINHJuQTcxcU5vUDEy?=
 =?utf-8?B?R2VtcG52WENLTG1lcFRTY3BLSzl1d0IwTGJCalNyZ2N5Y3ZOVmJyT2xadXhT?=
 =?utf-8?B?MkFQUW5DamE5NW14MC9UR0JuQklONE1udTlOMVg2ZFVYM1RHc3RRemxmbklW?=
 =?utf-8?B?YTVsUVp4dXFJZytGQi9jYVJabDBOSHBPYldGcnowNGJTT3poQjhjeHBWTDBy?=
 =?utf-8?B?MXVvK05yTmJrMXZoenVzbnpRMGhjQU02aXZjeHplZ2dpV2pucTJEd3J5U1FQ?=
 =?utf-8?B?cWZKWDJWMzNCMGdJUkdDMEI3TzNaY2VTbEtoaHBQSWlzeFZMYVdiQklKMUxJ?=
 =?utf-8?B?VHNtR1pLS29WSTRoQllsZ3FqOVBkNG9tN0Zwb3UxSWo3cWU2NE5HMndSN2pI?=
 =?utf-8?B?NHdSQmZLZWNvcldJekF3cmEwQlRDSFB3cFlPT01QZklHRmZHZUhORTdieFRh?=
 =?utf-8?B?QnFNYmRSU2VSNXdWSXhZRTk0S1hwOVFFVEc5Y04zVkpXYk1TdzJMOElHTlhC?=
 =?utf-8?B?RHoxdGp4TzcrQ2NoSGpySythU0IraVllOHVDbXpyT09pREszdkV2dWc5OVFw?=
 =?utf-8?B?WnprVXU2K0dQcm5NV1ExckkvU25kYjVxT3hpSkdrSTZyS2hYTmp0eWg1azRH?=
 =?utf-8?B?dC9nMVBYeCtIZDRYcXA4VW1LY3N4VGtxM1J3ZERHZmJ5RFQ2MGRrd0VnNFE4?=
 =?utf-8?B?WDc4TUNWQ2pPRWpCMGpodUJvczN5anVMV1JOWmxrcFllZE14OUZ2Ty9udlEy?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ztyIV2skYMYlOgEqPWtDOSjn5m8/rY4Nyn+AMZLiI7wx0spm1gKcPoLWA8MB7PXQSfZE9nUQpeFDWDsPsAvxQpjpG7ttoYHj3ydckcyEeK/pmTT8ocXca6yXwbny2lnK/3PZmkBI7IpgfOCxvV4wV/blLWYeay7k8/SsOhY1+3iOEI9IuAAqV1gGpNsxoEiZfRML5tqNzig/6zE2AP1oAKw83C0MmuyaGow6LZ2e6P7Ohx9fhC2biJyJ+5cj3OUwZuEwsEXydD6LEjKcSyeFRc5Ks6Ef+OG4u3zC9D5QxTBHjJgsyQS1kz1B/QPUoODmOfZ0A/0D3j7Bb0G8YrJsBsCgaYWu77JElv/jugUZ5ETnQwF/0YcnO58KNnmsZ4DZ2d4lvkrbaI6WiOMhQC/dCBHpgXhvpivWX4cKMI+docCMJykLY28rbuOC1OJxuB6rAnx0wPHCUHjRC6G2jO4p8+Lk5TKG74xSZtlRvHwXE4DOTmkJc+kPkm6WCifyGe/oVn68X1mUPntswRhiYLtN+GXksgnDExocqU2BnIWN2dECo8IB6AuKtiL4XJgx7FjvdE6QhMviU+EhyPsX7qIFoJMYS3+GdILzJTlYv/tJeknN4jTUjOdN4I22VHOtiIVoFA8DU2nGt4JTIsfyWZFclp4KbX3zdAEug+hBOkhZnOPtqce8oROg2tOJCCTbgd1yVRj0UQ/xyEf5ooy4kwfCLI7ZOZsgat9+UcNX604AuFn+APgkwkS7upYI3k7L7UJQckVRPqEcxLtfU29q+Ad5r2+ZF02zMdz7N3aSdnU0awMBaBXiK+QcZrt5RixVVX72HaxMGbRhhv+urxaBqjm+yqF+tzexgqnAD/JWSFnOtAk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df99945d-3800-44e1-3058-08dbbf698bd4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 14:53:45.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xM54CJH1u15W2Xg9PkWBJjKcsOTRk9t6FurDhiZ20yMpK5gUy2Qn8W6yaNl0IiLeIpBMoyrcqOMk51YGScJhAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5529

On Wed, May 03, 2023 at 05:57:09PM +0200, Jan Beulich wrote:
> The registration by virtual/linear address has downsides: At least on
> x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
> PV domains the areas are inaccessible (and hence cannot be updated by
> Xen) when in guest-user mode, and for HVM guests they may be
> inaccessible when Meltdown mitigations are in place. (There are yet
> more issues.)
> 
> In preparation of the introduction of new vCPU operations allowing to
> register the respective areas (one of the two is x86-specific) by
> guest-physical address, flesh out the map/unmap functions.
> 
> Noteworthy differences from map_vcpu_info():
> - areas can be registered more than once (and de-registered),
> - remote vCPU-s are paused rather than checked for being down (which in
>   principle can change right after the check),
> - the domain lock is taken for a much smaller region.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: By using global domain page mappings the demand on the underlying
>      VA range may increase significantly. I did consider to use per-
>      domain mappings instead, but they exist for x86 only. Of course we
>      could have arch_{,un}map_guest_area() aliasing global domain page
>      mapping functions on Arm and using per-domain mappings on x86. Yet
>      then again map_vcpu_info() doesn't (and can't) do so.

I guess it's fine as you propose now, we might see about using
per-domain mappings.

> RFC: In map_guest_area() I'm not checking the P2M type, instead - just
>      like map_vcpu_info() - solely relying on the type ref acquisition.
>      Checking for p2m_ram_rw alone would be wrong, as at least
>      p2m_ram_logdirty ought to also be okay to use here (and in similar
>      cases, e.g. in Argo's find_ring_mfn()). p2m_is_pageable() could be
>      used here (like altp2m_vcpu_enable_ve() does) as well as in
>      map_vcpu_info(), yet then again the P2M type is stale by the time
>      it is being looked at anyway without the P2M lock held.

check_get_page_from_gfn() already does some type checks on the page.

> ---
> v2: currd -> d, to cover mem-sharing's copy_guest_area(). Re-base over
>     change(s) earlier in the series. Use ~0 as "unmap" request indicator.
> 
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1576,7 +1576,82 @@ int map_guest_area(struct vcpu *v, paddr
>                     struct guest_area *area,
>                     void (*populate)(void *dst, struct vcpu *v))
>  {
> -    return -EOPNOTSUPP;
> +    struct domain *d = v->domain;
> +    void *map = NULL;
> +    struct page_info *pg = NULL;
> +    int rc = 0;

Should you check/assert that size != 0?

> +    if ( ~gaddr )

I guess I will find in future patches, but why this special handling
for ~0 address?

Might be worth to add a comment here, or in the patch description.
Otherwise I would expect that when passed a ~0 address the first check
for page boundary crossing to fail.

> +    {
> +        unsigned long gfn = PFN_DOWN(gaddr);
> +        unsigned int align;
> +        p2m_type_t p2mt;
> +
> +        if ( gfn != PFN_DOWN(gaddr + size - 1) )
> +            return -ENXIO;
> +
> +#ifdef CONFIG_COMPAT
> +        if ( has_32bit_shinfo(d) )
> +            align = alignof(compat_ulong_t);
> +        else
> +#endif
> +            align = alignof(xen_ulong_t);
> +        if ( gaddr & (align - 1) )

IS_ALIGNED() might be clearer.

> +            return -ENXIO;
> +
> +        rc = check_get_page_from_gfn(d, _gfn(gfn), false, &p2mt, &pg);
> +        if ( rc )
> +            return rc;
> +
> +        if ( !get_page_type(pg, PGT_writable_page) )
> +        {
> +            put_page(pg);
> +            return -EACCES;
> +        }
> +
> +        map = __map_domain_page_global(pg);
> +        if ( !map )
> +        {
> +            put_page_and_type(pg);
> +            return -ENOMEM;
> +        }
> +        map += PAGE_OFFSET(gaddr);
> +    }
> +
> +    if ( v != current )
> +    {
> +        if ( !spin_trylock(&d->hypercall_deadlock_mutex) )
> +        {
> +            rc = -ERESTART;
> +            goto unmap;
> +        }
> +
> +        vcpu_pause(v);
> +
> +        spin_unlock(&d->hypercall_deadlock_mutex);
> +    }
> +
> +    domain_lock(d);
> +
> +    if ( map )
> +        populate(map, v);

The call to map_guest_area() in copy_guest_area() does pass NULL as
the populate parameter, hence this will crash?

Should you either assert that populate != NULL or change the if
condition to be map && populate?

> +
> +    SWAP(area->pg, pg);
> +    SWAP(area->map, map);
> +
> +    domain_unlock(d);
> +
> +    if ( v != current )
> +        vcpu_unpause(v);
> +
> + unmap:
> +    if ( pg )
> +    {
> +        unmap_domain_page_global(map);
> +        put_page_and_type(pg);
> +    }
> +
> +    return rc;
>  }
>  
>  /*
> @@ -1587,9 +1662,24 @@ int map_guest_area(struct vcpu *v, paddr
>  void unmap_guest_area(struct vcpu *v, struct guest_area *area)
>  {
>      struct domain *d = v->domain;
> +    void *map;
> +    struct page_info *pg;
>  
>      if ( v != current )
>          ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));
> +
> +    domain_lock(d);
> +    map = area->map;
> +    area->map = NULL;
> +    pg = area->pg;
> +    area->pg = NULL;

FWIW you could also use SWAP() here by initializing both map and pg to
NULL (I know it uses one extra local variable).

Thanks, Roger.

