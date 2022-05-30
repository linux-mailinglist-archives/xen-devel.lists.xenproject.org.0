Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103285385A2
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 17:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338665.563465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhmb-0007BC-Q2; Mon, 30 May 2022 15:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338665.563465; Mon, 30 May 2022 15:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhmb-00078x-Mb; Mon, 30 May 2022 15:58:17 +0000
Received: by outflank-mailman (input) for mailman id 338665;
 Mon, 30 May 2022 15:58:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8YcB=WG=citrix.com=prvs=14204b923=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nvhma-000786-Ce
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 15:58:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f23b5ff-e031-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 17:58:14 +0200 (CEST)
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 11:58:11 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN2PR03MB2336.namprd03.prod.outlook.com (2603:10b6:804:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 15:58:08 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 15:58:08 +0000
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
X-Inumbo-ID: 4f23b5ff-e031-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653926294;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WHfvbyMRtU38XOD1GEN7akuDaCYkFIbPbS1yfvgNZWo=;
  b=IfsHxP1daHA0eTnW4IFO1tqEmeIX1IqfoRMViw/qMY5ZLuyC/ZYPz3C8
   /HeL0ER7Y+O1FJCoCBLX39cAMsvHFWsEHIiHdqJK2FvBnJ1U0QA40UuBj
   DliU2gytzs1TLgazypNt1+D9qCkTa6rdpY0eyDC/ZyphZu2EZ2XZzD1CD
   A=;
X-IronPort-RemoteIP: 104.47.58.171
X-IronPort-MID: 72456830
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YI4ghK2RQ7DKOzreBPbD5adwkn2cJEfYwER7XKvMYLTBsI5bpzRRx
 mQWDDyObKreMWr9Kd8iaIqypxlS657VzIVqQQNtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMz2YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1fj8eNGCIgLpSS2+lNfSRyOiNiNqBJreqvzXiX6aR/zmXgWl61mrBEKhFzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82TBfyVvLe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrialL2AG+AnNzUYxy2LuwhF02ai3CcjuY/+VG/oFmliEt
 luTqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDUd3VTxC+5nmesXYht8F4FuQ77ESHzPrS6gPAX2wcFGceMZohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnF76PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:AX1vFaimQuZnO1evhwOKBXmOg3BQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A/eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wga7VBaM0ot
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.91,263,1647316800"; 
   d="scan'208";a="72456830"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmQySVZyGPEdRDTt3YZgsNh9FK8kFisYeyDfHhdy4lVr18ogkZ8ktfN9j0I8r23xArExpePnlDtJrJ1sVr6lyo+/RTEStFBTcB+7U1wmLsheTYSkCZhB/7J9dqnJHfj8AoSnluzPFRc/g7WEdeMYkY7x5y8w1VO/hgZdayWpfVe6QGEViIc0yYLv85Ig1bN547hL4GFRnhwoToEKPXfGnbmQjaliEvokRNd8PlDYOvBB0Z8u2Dp2Jaj917OATc8bIYIz4BzJ34cm1J2ByDaD1rZiZ+Aa6dNFotb3jVzmJ3mK3nqZoulpWCZym8tf1yKqMAWqffRYn9n8wJDptbbhPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGEJv2/xS2r///eJf+EYnL8iSxPU6Q329LiR+covoNw=;
 b=PuGowA85XHIzXoDe6rQIcUVhcI2V7c+9vS+/yE5jp5wYv+PJ2WeLXRrFl2DXUsiiSy8PymXHKVDyrPqPeJFqNFLCrbuzPepmWPKVG0TMeV6FdHMSlIN2tXhJgkiLHdEGTCrIEpTPW8iGp7P8YHT0VKRV+wurS0nRP/P/r6uO0VUiWQBTE3kYF3bDz5sEjIZm243CRcF6Int91k9erFUVUTnjS2zfm7qOgwoXfvGaj2TzrJa73DEyOLW9kR0dsUn0wDYA4XDfeQFnDWRcmvlkY9+i7ygRybe0OyEqmGEW/mjYokaa7C2DVAqn0XSqhOzv5+ccJ7dNBjhLjN4kAB4IXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGEJv2/xS2r///eJf+EYnL8iSxPU6Q329LiR+covoNw=;
 b=klnw9+KkGVL4IE2rVhX4lDFroNAxBouyq7CppIPuE3TFbvG331f2cyXmUAXtT06bUOKTLJznkmrTkosad2KdbFygC4bvWMT4u3daySHmK8fgMvmjbDzQaksA2MNt7Chs8CLLRenE3/YQDx5NK5qQZSdxksoSh4oQ3XlcwdqtCKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 30 May 2022 17:58:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: harden use of calc_ler_msr()
Message-ID: <YpTpjOnY48UNlIe6@Air-de-Roger>
References: <b0fa2f54-e7a2-67c7-e611-69abdbb6829d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0fa2f54-e7a2-67c7-e611-69abdbb6829d@suse.com>
X-ClientProxiedBy: LO4P265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef5ec7f1-f1c3-4501-1533-08da42553079
X-MS-TrafficTypeDiagnostic: SN2PR03MB2336:EE_
X-Microsoft-Antispam-PRVS:
	<SN2PR03MB2336A70A40BB9A16AEAC82528FDD9@SN2PR03MB2336.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DbNujIlP7mur/KDimtohF7En6lK7PVxTQ4uWRmXLyca2L5FiCR0EwvvAVHG4lM7mPkfx+AWmzZE0ooDV0vyggFscRitG0CoG7XCpoX/Cal3aJlxlyXsNUz49UTVUuIay7PqsuSDbzen88klxxb1DShcpVr/B2lw28LKgPnbnr++3pRdjRK1xj+5YTGbzPBlZhwjPkxq2B97jVV5gPC4uOAT2T18PjHjofoDrCk3jleDL89S2LxNpMf0RDBPMcXTnasVO3hZ9BhN8+um+U7ENIp6hl67qHJHbwkIUWcmEI+VQVqhErmxUY5fiAgWqqdDRr82t2Xbe8EfNLJA7QX4iiXrbU4njoh/5D/zDKnAoWNxgzBj9xEuDVZ4+MenYeMZkEMBEs6Cu7q0FSdLPTOhqsTkF1oj6vzyJrDa8reBRNn4eTuVQXImGZX/V2ZmWDQMMcRkE38UCw2jZ9SHzW3RlGtJlmjPnjWru+W2wJDUrhz0QUj6XLmi0aBv/HWWa2YDohBNlM8eQnwLm+MqdbVhdphhn+xRsHIbC+kgyvsYMxaiilsModaLwYAon89Oq7qY7TOWGROuLM/bY7eCiXi50aQuOy5Oek5ZgoPSVi9CDbFQWJdivLmW9Qfd2v4isnHop9JpfQS+B1oFDzpaewLKk0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(186003)(508600001)(86362001)(5660300002)(33716001)(82960400001)(83380400001)(6486002)(54906003)(2906002)(66556008)(66476007)(8676002)(6512007)(66946007)(9686003)(4326008)(8936002)(38100700002)(316002)(6666004)(6916009)(26005)(85182001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFljYmFUeXFhOEYrZENkRVFMRWoxamxYZjF2Q2JtWm1zaDZNaG45T2xFVU9U?=
 =?utf-8?B?aG93N1gwZVo5V2NNY0g4b0phRmhrT3Foa3RYUk1ZVTlsNTREck9TN3NlY0NK?=
 =?utf-8?B?cjVYSnVnT3c0Zkg0czB4ODcxYllLOUNOT3BDVFhqaE55NFBnTC9BWjRWWnVJ?=
 =?utf-8?B?M2x3dXFaVGhDeVN1T1pMSDdvUkZsVzFxTFpoWm5FSDlCWjRJM2FHVTF5WHh5?=
 =?utf-8?B?b2I2Q1I5dmQrTjBJR1krVkR0dzNEOHVzSXRHNGhpWVZiakVzTzZqK1NROGFK?=
 =?utf-8?B?bkpzMUZFWXg1RG9Bb1FOd09keCt2YUVHaTg1MFhsUi8ya2YxZWVhTkQrcUlo?=
 =?utf-8?B?K281M2JCTkVKMXN6QWE2U0VweEZ2U0N3WDc4bTlFK2JhOXFsKzBGdThvWHdl?=
 =?utf-8?B?QzR1NEtidWtya2JDV3QxZTA4UDJaNFJyNitKdlVKQkxoM3QvaGlxKzB6U3pn?=
 =?utf-8?B?QXUvd0VKRHlvM3AvdHhlZHZZaFpRZ0IyTVk1SUxyMEZSeUUwazZvQWxUTVJV?=
 =?utf-8?B?dmR1SlplVmxaaDJ6VmpxZ2M5TjdhOFlkNmNjcFNiWXhJUkFETGE2MTlRbGtO?=
 =?utf-8?B?NlN6cEJMakpObDBBUVhvb05zcC9PR1BZSEhlZVRsVkc3SEJBR2tRQ3BLeis3?=
 =?utf-8?B?ak1kNUUwRFJzVGlPVHJvd1J3NjJyeHNNb1VsaitpR3RsaVdxcGczRXlpNDJC?=
 =?utf-8?B?MmRqY2VzRjN4aXlxUmxRRGt4M3ZBV3huNWZSQUpmRUJxZVd2dmRTSklYdE9t?=
 =?utf-8?B?TGlLczQrZGM1d3hQSkg2dStGWXlVTVBzNzQvRWhHNXNnd0plNENTaGt6QWs1?=
 =?utf-8?B?YXl4UWlHTll4NHF0aEdINzNEU29OcERhU0Z4YWtxZGhMcUxBZzNpQmJROHRt?=
 =?utf-8?B?WTB5WWVBbVNyN0JoYk1wMDJUOG9HcTlhVnJYZXcvNW1jclVQS091YUJQMXdi?=
 =?utf-8?B?Yy93ekYrdVgzZ1lXT1l2eWhaNTh6SWduMWFQUkNDS3NOQVh1WDgyZkhydlps?=
 =?utf-8?B?dEJWNkZVaVhPWk5RL1JncmNWc1AzSEQ3ZU5TN1JWZXEvODFpLzFuNk5SeXpa?=
 =?utf-8?B?dzBmQmFFNzNwdFZiVnQ3YURhd3ZQdm4vSlRudFdBM2Rha1VvaVlIZHJ0YVB0?=
 =?utf-8?B?N1lycStlQ0tJTnltK0ZSbmNXN3dyY25iaU9mUnZSbVN6eW9QZnRkbTZFamhS?=
 =?utf-8?B?MTB4MTlJdVRqUHpwUm5hby9YQktlU01OVGd4MjRSM3BVU0RkQ3pUOEVlSHIw?=
 =?utf-8?B?b2xWVFFqVnlpcFliNDg4M3M2azRiUjhMSEE3UXBCMkcybThleEVmeEZDN25P?=
 =?utf-8?B?TUhFVnQ0bjZ3RkRVcHVpTFZIV0NaV0NCYWNDT1o3aFk4aWlOVXRsVXlZY1l3?=
 =?utf-8?B?OTlVQVk2d3pBaXN4c3lpelJ2VEtQcG9vdzVFT1RXSkllaFBpOTNEdDBIWVhI?=
 =?utf-8?B?UVBHKzE4Um1Ob2F2VmlBcFFJL0poTU15V3lnVUNrK0pBRTIrdm1TdSsvNktq?=
 =?utf-8?B?TCtCTlRJeUc5ZHEvRlNmVVZra3diRHgxNEVaZ3lDMjNVbFl1bEJDaTBtSnpW?=
 =?utf-8?B?Ui9HOXpnOUdKa1IwRXRramZhQVU3WEtjWG9KWE1KL0ZnMUI5MDhTdHBzaENZ?=
 =?utf-8?B?dGRBKzByZk5LUGpYc1lCeWdocEozQnNJelNtQmQvODNoY3JxeHNTU3dwdGdl?=
 =?utf-8?B?T09tNlhxUncvbEdKb1NlQk9FUGhVait6d2VQQnQ4ZU5HWUk3SlNaekRBYmFk?=
 =?utf-8?B?VkZ6T25VenluUUt4Qi9ucVU5aWZZTTBqNndnQmYrQ2l1cHoyZHJKVTRHMjBv?=
 =?utf-8?B?cGc5bVN0Y1Q1SDVRdUNqVHh5OGdEb2FNc0lVeWRyY0M0S2J2bURNWFpnT0xk?=
 =?utf-8?B?LytNT1JvUWpKRmpmdW1LaEdxNWJYa1l3a3ZiL1dnSmNtRnNkV3MrM000TDhj?=
 =?utf-8?B?SjU4NlhXa3RnV0U0RHRuTFROek5TQ28xbGdGRnhIR25HSXlYNmswdWdQYmpa?=
 =?utf-8?B?UmtWNTVyNU5VQVY4OU5mRDd0WWEzNUN5WEIxODFmamxqZ3lqbDBvb1hjL2lt?=
 =?utf-8?B?bkd0b1h2UGhjQU9ScEtCTlBjRmY0ZDRMVUJWM2lLWVBsaHErUmJpcFh1TDdP?=
 =?utf-8?B?aDNHZFRFNHVUTUZZbU5vMWJsVldHZ2k0dnF5T0tEOFdPMTVZTkN1ZWtYZHpt?=
 =?utf-8?B?QmI2bkY4STRKVS9MendRdzkrazRMcG1BRHhLL0E2MjAvVmFsaElIR29TWEQ2?=
 =?utf-8?B?NU1MUDh1TXJiaE9qc3dIT1IvVlF2M2FOZGJZakJxa2IrWitTYWJDa1MwQkFp?=
 =?utf-8?B?R1dyc1lpUlhVZDYwMkVkNHlzL09xVDAxSXBuWmZGT0s5V3EvcktnSklic3Ja?=
 =?utf-8?Q?3n/U4V3WgZEkJB5w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5ec7f1-f1c3-4501-1533-08da42553079
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 15:58:08.1284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Io/fUDpQBuhXGBtWoEX08uSA1xN4lnZZjhuNFYxGwvE0vIfguDSrJVjK0kD951VH7JjmlSQPfQtMTKGL8B7JMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2336

On Mon, May 30, 2022 at 05:48:51PM +0200, Jan Beulich wrote:
> Avoid calling the function more than once, thus making sure we won't,
> under any unusual circumstances, attempt to enable XEN_LER late (which
> can't work, for setup_force_cpu_cap() being __init. In turn this then
> allows making the function itself __init, too.
> 
> While fiddling with section attributes in this area, also move the two
> involved variables to .data.ro_after_init.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -126,11 +126,11 @@ DEFINE_PER_CPU_PAGE_ALIGNED(struct tss_p
>  static int debug_stack_lines = 20;
>  integer_param("debug_stack_lines", debug_stack_lines);
>  
> -static bool opt_ler;
> +static bool __ro_after_init opt_ler;
>  boolean_param("ler", opt_ler);
>  
>  /* LastExceptionFromIP on this hardware.  Zero if LER is not in use. */
> -unsigned int __read_mostly ler_msr;
> +unsigned int __ro_after_init ler_msr;
>  
>  const unsigned int nmi_cpu;
>  
> @@ -2133,7 +2133,7 @@ static void __init set_intr_gate(unsigne
>      __set_intr_gate(n, 0, addr);
>  }
>  
> -static unsigned int calc_ler_msr(void)
> +static unsigned int noinline __init calc_ler_msr(void)
>  {
>      switch ( boot_cpu_data.x86_vendor )
>      {
> @@ -2171,8 +2171,17 @@ void percpu_traps_init(void)
>      if ( !opt_ler )
>          return;
>  
> -    if ( !ler_msr && (ler_msr = calc_ler_msr()) )
> +    if ( !ler_msr )
> +    {
> +        ler_msr = calc_ler_msr();
> +        if ( !ler_msr )
> +        {

While doing this rework it might make sense to print some message
here, like: "LER option requested but no LBR support available" or
similar IMO.

The rest LGTM:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

