Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AEF6E7EF6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 17:56:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523597.813809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppA9w-0005Xt-0p; Wed, 19 Apr 2023 15:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523597.813809; Wed, 19 Apr 2023 15:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppA9v-0005VE-TR; Wed, 19 Apr 2023 15:55:51 +0000
Received: by outflank-mailman (input) for mailman id 523597;
 Wed, 19 Apr 2023 15:55:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ppA9u-0005Up-9b
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 15:55:50 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a51151dc-deca-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 17:55:47 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 11:55:38 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB7030.namprd03.prod.outlook.com (2603:10b6:806:333::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 15:55:35 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 15:55:35 +0000
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
X-Inumbo-ID: a51151dc-deca-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681919747;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=E/xgNpqFB3QeVJdJrTJxWmIQMMWo15dz77hJ4wJEjzk=;
  b=c0OvsGa9IEKnmUlInha/9m0diyLz1OG8xaw6Wk7IwpIaPreVrWeqP/WG
   DKnIAzR/u+QJpg1wVeXlZ5rckyh/oQPdYVW2zNnfiYH4d5vu/Eyi8osJ3
   8QDU8qGSEczTTlQX70gyh950BWTmGlxU0wfM9dq1qtoyZho3NCj61b/kT
   A=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 108565700
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Y7fvbahGdakqwiIIzRrcQnhiX161VBEKZh0ujC45NGQN5FlHY01je
 htvWWDUa6reZmOmLtEgPoznoE5VsZfSytZkGlRprnw9EH4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4AaPzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQIJHdcaCifg9mu++2aG8MrnOkRdODCadZ3VnFIlVk1DN4AaLWaGuDhwoYd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluGyb7I5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjCN9MSeLgrpaGhnXOzGYBByU2bGeEoOarj2yFdoNSC
 nMLr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YWqU67O8vT60fy8PIgcqeissXQYDpd75r+kOYgnnS99iFOu+iYTzEDSpm
 jSS9nFh2PMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:QZYqGa6LOo9inBxHNAPXwNnXdLJyesId70hD6qkRc203TiX8ra
 vFoB1173PJYUkqKRMdcLy7VZVoIkm9yXcW2+cs1N6ZNWHbUQCTQ72Kg7GC/9ToIVyaytJg
X-Talos-CUID: =?us-ascii?q?9a23=3ArFrU5GtXG79faxrO/DBUMc/u6Is1fjqMyk/MJ3S?=
 =?us-ascii?q?gMjlIGZfSU3KioIpNxp8=3D?=
X-Talos-MUID: 9a23:d/KAeguViQOn3lJgjc2n2TtoJshQw52SN0ESg5AkgOTVOA1PJGLI
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="108565700"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrOh7XV1fyMTqusNF13J19r3xsZKOP6bnBh6qdFM7yozjUpKe78yZSTNeEpNEyIQqTvz/CBcX+JAOemIqQyFGmP6TuulL8Vf2C3e/gJiXhbMII9M/aQHOLzEpA7z1LsqPxX3snysW/fcPqaeJf7fEE/RwgCqSPaCcl5X347J0tCltS6fQF7hi9WcB4Dyu/1k3UQj6vRq4CmvcGaL0cHqwFzFTieRkd2pnosRvrh8EsBJqfNT7bKr7+m7ZEda7o0siks8Fql3a7q6vTrDAONcmw/1Rfa3vHcf9vCfzhRLqaVEQqHs0nOEx0BtL4YUgdzOS8YLqf8Bq1ctN+BYnajWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAi+37JWDwMaeQymdzel3P9769qLutm3BqZRLCAEZHI=;
 b=A2s1k4hr5tQYLXtUjLy35EdS/O+QPj8PwH0GOR9b0wjkAuSNnCOvY10WCA0wvPRkxTvZh2Bz0EhEdfphRoZsj1H028ewad3AkTc4ADGuW/oJ1fibKxMhNIFNIaF1g647PTyM0ANw9sh1KtgFJW3PEHSTeDbQhHljEzP6fxrNztjf1okGogEn+Q8NtwW1QJ796TZzVzBu1WS6uh1qX49GYS37jdsSb8t+XapVoo9En6mKvGzpC0bfuf6fdY9Qn0zH6zPQy9ZelUA2sRs6EfdH7AhWr5U/aPCvRLrA9p8xV/t3ydsepC7etNVR3dvvYbx6nXickHxGX3mrhtiw7mWGew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAi+37JWDwMaeQymdzel3P9769qLutm3BqZRLCAEZHI=;
 b=QadnrXKWe34fCTunwM2rFgU9iuUDJwcCvxtAZXASKKombyOFHquvUmG6JH89SkReqZjGMrTw5j2fX5cAp6M+fZJnBGowV7Z+6/gv5Fho47R2skSJBhRXcfVO1xnkF9GEKWVxJq6N4KST4K6ox7kkBmW4C50C+DNsVuuhOukaMKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Apr 2023 17:55:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <ZEAO8e9iTjmi86fr@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <116bb94f-955c-4c46-f16a-d7a5e1cc72b5@suse.com>
 <ZD6AejXJxQxAyrx1@Air-de-Roger>
 <c736271f-96ad-dfdb-48ae-b8e9cc002d9b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c736271f-96ad-dfdb-48ae-b8e9cc002d9b@suse.com>
X-ClientProxiedBy: LO6P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4963d9-ab06-4f60-9318-08db40ee833e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EvXw1KMx5bYt+0OyCmR2HaSt7HBKU9ROTFB66SSR+hjsweCBJZXOL1x95tGJNJVt7uj+0hL7t55Q/YEvHXa9cSB8TuHQlThYVGTr/qC4X4miwTU5Qd6PPjWNq9Bi/1FGs7JXp+ddxvk1re/2UcFJZ6J2FSVyX8FINs6Zn8VoCZLSp169v6yTXPnxFCuPLtAu3KjkPZ50HRw1HguSDFL2DNcWopPsssigjkHo2RLWM+l3usxxVvaX1v8DH5Jtphts3dbJikLAMVk1rF+U7zaxIrt+6mlX+S8H6jomlYjaPXsU7MxtLMnGZe/lIbJD9Oe2KsH/CPEhQd/TJ0roFmxLCqdm+Zydhky7uRSaZafw1MgJ/rWG2mZD2QtuBSo4CxMI4sVVxHkR98qkPNTDU7fWtFLXnhLL5X8PK5axWJJFZBRfEfTDR0NywKszhGd2HY3c/7Mtg0f58sgdeE0KBTU5AopNqwq3SMvwTm2fVBqehU4uCXAmUSKsvwgt1CB1Q7685lUYKQaUfPbzsiYArgE8TP0M4QuR0GSyzi+8HWiVTKqlf5e5lqTvfzGV1Sf9Hf+d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(83380400001)(6486002)(82960400001)(2906002)(38100700002)(54906003)(316002)(5660300002)(41300700001)(8936002)(8676002)(66556008)(66946007)(66476007)(478600001)(6916009)(4326008)(86362001)(85182001)(6666004)(26005)(186003)(6512007)(6506007)(9686003)(53546011)(33716001)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWphV04vbHBBOWY2WlV0SjIzMHVvL2NDVTFZRlFmSzV1VXljSWpyN3dlUVdL?=
 =?utf-8?B?eUxqT0JnNVM0Q2NrbnpoK29VeHZ0VERORzV6NU5oUGFJS21xOUFySStXalRK?=
 =?utf-8?B?Z0ZrVjlSTDV2eEhVTGZiUGdNMEJzRkE3UVpwN01EdWNFbzFJVExFemVtL29h?=
 =?utf-8?B?MEs2bVVHSkJ6NEtUUFd4RDJaYkhSbXJKVno3MW1IeWxaRktyWnlyV3E2ZWF5?=
 =?utf-8?B?RXhBVll5aS9NOVo0UjRyYU85Tmp3MWZhbDBaNCtOWmRScUpEbnozbnlGMkNJ?=
 =?utf-8?B?QUs5K0pVc2c4cVBNRG04UndMSUQrYjZHb0xpanhzM2RzYWdyNlJLVkk2K3hn?=
 =?utf-8?B?MlV6R0J6N3VvWXFDMmtka0dOb05QUHBTTCs0Yndlb0ZvMkJCTlNPVTJOTC9D?=
 =?utf-8?B?ZUkxeHdkektGeW9Td0ZHdUlSVjlMUVBFcVJKTW5XczF2d0hMSG8zdk55ckJo?=
 =?utf-8?B?MDlFNE1LSlVYZmVPZitHbERpUE84MUVNR29GTFhia1VXaUJaSmlYS0Y5bzZ3?=
 =?utf-8?B?d3R5Mi9CS3BRalJkWVcvSDJ1TklzdTZucVczOGs2Y1lGRGZndWdySm16cGFH?=
 =?utf-8?B?YnROME1ueDdyNGsrZU5NZ21NeVZYN2hwQzROQ202ak5iamJmaDhZNXBIL0x2?=
 =?utf-8?B?MGN5TFFvYTNlMzhSTCt1Vmw5N2pVM2ZGblRXOHZuQVg3dTR4dENpL1Q1MkpZ?=
 =?utf-8?B?eGRONy9wQlFVRVR0THBmL1k2elZvcDRxVkp3b2JHM2FjQnloNUVxL2FRemts?=
 =?utf-8?B?RGhBOUpldjhwOTZsOGgxVzJkTnVNVy94aWozdnQ1cmREamw0TjN1SVBnaFh5?=
 =?utf-8?B?Y3J1M0M0R3BqTlBMQUZDQmtXaHdnWXZmbW9Qc25CY2VYU1hsWWlQck5QbC8w?=
 =?utf-8?B?NzhTWDFvMWNuYVIrWC9YY3pUWFgzclFDTWNWRVpDOU1FMkJQZkJlV3FzRUdE?=
 =?utf-8?B?Z2l3OGdiREhramVBb2pYeGQxcW9OMjRiSy8yOE1FUlo3M1hiTDRyWVA0RkdW?=
 =?utf-8?B?NG5wR3l0eWNkTVVNclJ5RmM5c2VCZWNKeFh1TXFEd3J6UFRSSllOWlJLQzJh?=
 =?utf-8?B?NXE0RHV0M2dnS2g3RFVZeDRadVZCVG81aVZ0Y2ZrY3FyNEtEWXg1N3NaZ0U5?=
 =?utf-8?B?NTAyaldRZE50ZG9Ya1c2bnE2djM3OXZnS3UreGMzL0tmcmVacHptbGZIckg3?=
 =?utf-8?B?SHFiOWJ4VG43VlY5aFhHdXZScGNwMHBTUjhVRVFPVCtBUHVMMElHRXY3QkI5?=
 =?utf-8?B?ZHNVVjZrcUo4TmVDU2hVM2N5UEsvZ0pZVnRoenBWSFNRRHcyb3ZpcUtreEVM?=
 =?utf-8?B?NC8rOEFKMWhzYTZ0M05DeVFVUWNGdmlHZmxZTEo3Rng3TjlUdEFES1VNUzNh?=
 =?utf-8?B?R3BXaE94SHdja0RiSFhETStWekE3V2ZuQUlGSUg4SGwxT0RHRXZRdlhQNUcy?=
 =?utf-8?B?WFF0bzc4bVl3dzRrNHZaM2VRb3YzV3l3eVRUS2o3ZlNrMU51Sno1dmVCenRN?=
 =?utf-8?B?MllQRGVOaUoyQmIzSnlnNzcrTC91ZnZ3UUVSTEZIcmE0eVVrYzMzMjY3OE1V?=
 =?utf-8?B?ZlE0aEhwMnZFU3ZLZEwxd3IvY1QxQTNxZDFCcWR5VzJZcmlwMmdvWVVtVjRX?=
 =?utf-8?B?bXZXUFMvUjFFZGU2dG5OaDlPUWI2UGVxOTkvamlmRnhPVS9Qa3ZVSTJKQ0dy?=
 =?utf-8?B?MnJMQk5UNitrdnY5VFdWbjBLdjhzeW1jUHl1dC8zcnYwY09xdUE5U0lPTHFs?=
 =?utf-8?B?L0tHaWR4SGZnTDhvNGZtSW5jNXl3ZTVvYkhzZEVvV0dsVDZBeDgxcm85dnNm?=
 =?utf-8?B?OUJNYWE5cUY0Z1NBVG5QU056THpjMDYxcFJrOU9XUWtjR000Q24wRWx5Q0Ir?=
 =?utf-8?B?WjRlT0ZHckZHbXd6T3luQStsUUFONlJTMzdIeE4vZi93K05UOVpWZ3pRZ0Yx?=
 =?utf-8?B?QkxNeHJuZkFhcjRoa2FmK2pma1Vmd0I0UUk2SDFiTVhwSTN2VkliZzRkTDZV?=
 =?utf-8?B?cnRzRW1yMEdsUFFJeFIzZHBOdStZMzR2QzUyTk1ZMklqcnk4VUZIWWpZc3pr?=
 =?utf-8?B?OVVxTnNid1pQSlJ6eFBPNXljdEFFemNXTUlOYlZsazRrRjJzbGxqWUJpejZO?=
 =?utf-8?B?NnZoaExZWWNZY2lYcTJFT2xTRnp5STVsd0Z0YWhUSWFiSWRZQk1Vc01PMjdV?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x2EuZ+s/5C9xoGhloUfY1+1MMEoKj5WZVdr9yRPlb7VeuXnfQUlkhmHt8YnhzSRfQbPHsKlm4+dEBa+PWKtevw8JI3wRtZAUrIYhlL1q2u01cznH9wYMjSQkHEqcImxdJWnjHAL84uy1GRfRwN2jWIRih9ODG32tbqCdgzvyHH7vdJPK90jphNVZe7SIOh1PdNd/E3GQ95LebzDP2NvBjnQJhonS9rf9PUrXks1BNpPgmldYEJ1+H+oGJlwCxwcLv72mhtMVtA+zwu5Rd/jNg3zhN3ii45/HRDOIsQ+3WyNCpGoVfrWB4IMwK2dATUJAFwWy8a2PDt7i4zNckKJG9qTcQ6+upQV7M6ju5WhDNMeDKJdax3GSqxr/PRx3ybx1pL3XfTDGzewu6ki7SYGRp6ptEbmzB5UF8C+5iw3aNkLxOoeq634hyGFHJmn6vBwxAVdDvvTEi4WB1WHafmSmgz9ZcvHoFq3s9NsEg7+PWt+ov2vxp6SbbxI3aDtLBX7oyp/1rS90rK/+AqoQdKGdLepcBA7/XtzLl7YdZjhfjTm3U0Qd7rgIFzTe2fpUCj3XT9bD3WA5xOp2V6qZFxuEtyDwGmk2Hp5wf34uGPoiZCxhdZYkypC8I7li1umnNtwKBlFJiA5kUSTayG7K8QIKalJc91TIXIoUdFdH+T+ouKpoFqaH6OktD6RMSFZ2xuv4AI9aq1XQYun+U+w5tuyYGLQllLyTVJ/ovhTC2Qb84qgdzKWghXi4KYaZEY3S++JiVksaPAjhi86XaMcjoSZY3Uu8JOaguf0orL+p6yBCLk9zMGdrq35O4e9AxOUONiyu
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4963d9-ab06-4f60-9318-08db40ee833e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 15:55:35.3001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wY3JhhKCnDAoBl5/7wU49e7nlnLtoFBTAs8cx/UKN0tS5glfVoj6W+XQ+I/BqbVWS+wTjCZHcOqHimxRav/UUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7030

On Wed, Apr 19, 2023 at 03:58:10PM +0200, Jan Beulich wrote:
> On 18.04.2023 13:35, Roger Pau Monné wrote:
> > On Tue, Apr 18, 2023 at 11:24:19AM +0200, Jan Beulich wrote:
> >> ... in order to also intercept Dom0 accesses through the alias ports.
> >>
> >> Also stop intercepting accesses to the CMOS ports if we won't ourselves
> >> use the CMOS RTC, because of there being none.
> >>
> >> Note that rtc_init() deliberately uses 16 as the upper loop bound,
> >> despite probe_cmos_alias() using 8: The higher bound is benign now, but
> >> would save us touching the code (or, worse, missing to touch it) in case
> >> the lower one was doubled.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Before committing I went back to read through doc and earlier comments,
> in particular regarding the NMI disable. As a result I'm now inclined
> to follow your earlier request and fold in the change below. Thoughts?

It was unclear to me whether port 0x70 also had this NMI disabling
behavior when the RTC/CMOS is not present but it seems that port is
shared between the RTC index and the NMI logic, so lack of RTC doesn't
imply lack of the NMI bit.

> Jan
> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1305,6 +1305,13 @@ bool is_cmos_port(unsigned int port, uns
>  {
>      unsigned int offs;
>  
> +    /*
> +     * While not really CMOS-related, port 0x70 always needs intercepting
> +     * to deal with the NMI disable bit.
> +     */
> +    if ( port <= RTC_PORT(0) && port + bytes > RTC_PORT(0) )
> +        return true;

It might make it clearer to move this after the !is_hardware_domain(d)
check, as non-hardware domains don't get access to that port anyway?

> +
>      if ( !is_hardware_domain(d) )
>          return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
>  
> @@ -1342,6 +1349,17 @@ unsigned int rtc_guest_read(unsigned int
>           * underlying hardware would permit doing so.
>           */
>          data = currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(0)));
> +
> +        /*
> +         * When there's (supposedly) no RTC/CMOS, we don't intercept the other
> +         * ports. While reading the index register isn't normally possible,
> +         * play safe and return back whatever can be read (just in case a value
> +         * written through an alias would be attempted to be read back here).
> +         */
> +        if ( port == RTC_PORT(0) &&
> +             (acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) &&
> +             ioports_access_permitted(currd, port, port) )
> +            data = inb(port) & 0x7f;

Do we really need to mask the high bit here?  We don't allow setting
that bit in the first place.

Thanks, Roger.

