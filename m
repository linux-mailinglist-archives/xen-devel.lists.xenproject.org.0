Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4365394DB
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 18:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339868.564780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw4Xc-0000XB-2w; Tue, 31 May 2022 16:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339868.564780; Tue, 31 May 2022 16:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw4Xc-0000Ul-0D; Tue, 31 May 2022 16:16:20 +0000
Received: by outflank-mailman (input) for mailman id 339868;
 Tue, 31 May 2022 16:16:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8THd=WH=citrix.com=prvs=14366b804=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nw4Xa-0000Ue-CC
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 16:16:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdfcc787-e0fc-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 18:16:16 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 12:16:03 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB3939.namprd03.prod.outlook.com (2603:10b6:408:25::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Tue, 31 May
 2022 16:16:02 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 16:16:02 +0000
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
X-Inumbo-ID: fdfcc787-e0fc-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654013776;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kbwgNz4mFNW6+xZxRB1VW5GX1OZj27txPQswu2mAgTw=;
  b=KpTgLXWc0OcBpztww/Gd//2ZFOzAwAwhJACmlmCD7Suebx4/2J0BxYXw
   W88cf2raRBp241ntR5E9snGHQtlRkR3E6I+2S2X0RS1IRQdvIuEJcYZtk
   /fRvuw+AUBMjl8vHlNV4YjGp2HI5IoI6OUp80bKrvxWIdN+2aR0On5P1A
   Q=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 72941733
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:s3mQV6/MzKB/aZ8wxSRjDrUD9n+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TZNXmrUP/+PMTTyLdglb4rk8xgFvsTWyYJiSlBor3w8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IPgW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncW3Uyp2fe7No+IMCiICPhpCB6Rfo4aSdBBTseTLp6HHW13F5qw0SWQJZ8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHfuMuYQwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKWwE8Q3O/sLb5UDi8xMg3KHoPeaWWe2yVflHux6K/
 TjvqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsH0QhmQsHOC+BkGVLJt//YS7QiMzu/R/FyfD21dFDpZMoR674kxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLSvDdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:WZWoSqHG4RjYj4FspLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,265,1647316800"; 
   d="scan'208";a="72941733"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZCN3r/+SFHf2HgkclEiCvl/Urz7DIfOsP/Hs5VB45Z2uUk7jtSxzubnc6Rkz3PsfjoQzrc8zSRwnp0iyzjmCjhyKEakS0YI4Xd9WbUtWFG7J9MLNGTKacBidxbDh6DyU+c1TyiLrQ3LF0T9CM9SeLQZe7YYbqUnj/f8Zwai48YHA9guHVP5ex9jP6s+iZieCaUpXWkaCcwQCR/2FvjEW4qVws633oX624X5/w+Pd5I+G665JVdA7fA1UKec2DXRvlWh7CwpfkUrCOA/vLfCl58LmzFmGctlVCGTU8eT7eip2AcjSkRvGMHQ+5nBBZkGGSkXbDGm9/EjDvLTfb5qpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tv6JrPyWyvBirgVn/N0qBAcfJniTmSjhtQuSiaBExcA=;
 b=IsRlSsK7MMGD/J7N+oaCJeWaDYCraCSxs0dJlGMsyFBNA4eJ2tyA17sb/nvcNSO1TzCSuUldDCa7GdKlEFpnsVOQtoBIJKFVze5db+G5fIk4rDHllAU9NJMBvSMRttAc8pX//b6EPGcJdSoIqdJdCr+Q/93hHt6AgcCsJm1RynxmWY/J0LdSqwK+sBINsYQOWRjkw0BaCa+sTzVgYrM9GmMf5KTUOld3CFDVHQCQm3+UgUgkEvRaqDSi18JW8dIu4XybLtMz9YCXPzGsPd3R2iGUASAs4LkoUc5aFoxkO3J2qgdhlJ2xKt9GWzvJhuKaWIWbwMn7A9Y8ito5cTzt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tv6JrPyWyvBirgVn/N0qBAcfJniTmSjhtQuSiaBExcA=;
 b=RNuV2VkTihs+5zd+sCJafsUSKcnqATEfDA2l60/mgIqTMnDjFkq5dU6n9vmgUP+VsMyIo1GW3NIYxHP3QReNuHvCdt/uAaL4hn8316gTjOiV9DlpRQg5COK/OadWvDDNRUqg9FmWrcbLoyZWjL63ZzSkK4iXj1eR/0tYdRfXKJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 31 May 2022 18:15:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 01/15] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <YpY/Pm43mMJFGYql@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <1de2cc0a-e89c-6be9-9d6e-a10219f6f9aa@suse.com>
 <YpYozCRkfs1KdBus@Air-de-Roger>
 <22d2f071-4046-52c6-6f11-23fb23fb61c1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22d2f071-4046-52c6-6f11-23fb23fb61c1@suse.com>
X-ClientProxiedBy: LO4P123CA0371.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a4b02da-f1c8-43b3-44c8-08da4320db18
X-MS-TrafficTypeDiagnostic: BN7PR03MB3939:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB3939A160833C92A8046C0C258FDC9@BN7PR03MB3939.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3joPW+Y99AqVT77rLI+xRgifpCWbRy9W/cWkBWzEiu5ZZ2dJCbBXUyfMe4lqDaC3SWxa+WoBprWMZ6mivYnZzxZGMjZyYQtLH3F29S6IoOnhQSs9He0vBiB4/2JjzNzAkFWde9W8lHxc6OCaJCchpfzG25wT9ayP+54y2OCZwpoKWZC8B+P/erpFYWy4t0IYpjNKdMDahA2xRYIoFN9jvLDkCIrK7XfALlZQfELw30KVJXSRKf/MtXZoQ0Km1KfXXwyO8opMaQSD+MGa2KWD1R4jo6dVT5WAJi+bMmXZizjb/iTnlnfTQnsfMmz4+eAvOCCvY3G/X49x8VlLGnLRhHVAOGA5NOa5Hi4Z7QZkwMrJrevRWsS3hdj1Cd6qJlKtiKCKfFVdoh0/Na76ggC+Iaib9xa/B1/Gs+YBlzvxmf/LJf1mk4ctwuQ68OtANLGs6nHSLWuCUr8M8wocfYjUye37yw4iwR3wcpA6DfpTrnM838CcKoAoCKEhgdqIKvf+PRwHol8CB4I4G4cL/+EvRIIojBZsFkUI8tKhUvnY9YvBWr3+4WnEcc9J7oQeYCpqr7XYBe50bgsHFYBxcwlpqIIr76xRDi2VO9fEpmLp/+byK5eOsFT6msc5NsYrTWD3stLNijtno6fjmXqg4SJ6wg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(6486002)(86362001)(26005)(9686003)(6512007)(6666004)(2906002)(82960400001)(38100700002)(186003)(83380400001)(6506007)(66946007)(53546011)(5660300002)(8676002)(4326008)(508600001)(85182001)(66476007)(316002)(33716001)(66556008)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG5aeVNuNnJmblhkdVVaeUlZb2JndG8xcFUrbDFpbitCT056cFVENE1WdmFO?=
 =?utf-8?B?TVNhdG5rMStZUmxicWhnZGpudHo3QnlJajk3N1JzdHNZWGFhbm9HNU1XNkll?=
 =?utf-8?B?dGRVQUV5YkJwTnJWQzZBc0JGaVVrZ1lsUnkzNzlJOFZBdDZGNUNuYnpQajdj?=
 =?utf-8?B?cWk1ME5VNDU1SmRXemloSG1OS2ZqSEVRWmtMTUQ5SDlyeCtWSkluMnpOaFAz?=
 =?utf-8?B?a3cyS2tpQTdVS2RwNVQ5OWFjdnd6ejVzR2U0SVR1ZHlxd0RKRW1lYmdoMW56?=
 =?utf-8?B?UzBxTXlPbVY4YUZ3MjFoTFlKUUVGWlJjYmRzNzMxREFLaDMwV3UxQ0VoVEU1?=
 =?utf-8?B?Q25OUk5sRFdsR1FuYkE3QmNIM2U2WjhZZ2dqS2J5Z2hVVEZZOXJWV0lWN0Q0?=
 =?utf-8?B?VkJ5VS8wMlpYYU5Jc3o0ZTc2aTZzWUtvUlp0RDB2YkVzOUl5SndXOEYxclhB?=
 =?utf-8?B?VmpYbC92dUVhYXV3bGsrNHJXVEdLeVgvMjFwWE0yT3gvR2dnZ2xyZVpGVVhp?=
 =?utf-8?B?Uk5Kd2U2R0R4SllDU0lSbG5tQk9lWUdvVGFrWVoxcDRRTDUweUVHWkt5Ykwy?=
 =?utf-8?B?dngyZ1dGY05FcWJjNU1rQnFUQlNSY3JDbWM5bHpWOHNBdllZL2MwZTV0RCsz?=
 =?utf-8?B?WFhZMm1HZEkvWjNGUDRoTWc5ZHY1dHhpSjExNXJzU1RQNnR6L0FkaDFONGhs?=
 =?utf-8?B?Qkl1UjBEMms4OUxGSjl4NFBuNW1QdEtUWUFONFJOenAyNm9SdDhFMW5YWUZB?=
 =?utf-8?B?Q1Y2RG0wODljRHdidkhCUG1sUFF5ckYwUXllR1lHL3p4N0FlYXJSdDd5cGFR?=
 =?utf-8?B?dDhEQ2llVzB3b09TZE9Uc29ibjlXZFJzemFUcEk1WWprekxtQ2FBTGFnOU42?=
 =?utf-8?B?NXoyOFRnUFhrQU4wN1h6RjhPZDhTRHZDWXd5R0VXQndKbi9LZ1hYTmw4Z1FY?=
 =?utf-8?B?UFpVQmdxc25ST1Z2bFEvbW8vUGtEQzZWZE1Velk0RVMveCtOd0hSaFplYVpv?=
 =?utf-8?B?WFUwcUd4bVcrOGlxYlNLRExoV2NOTU5QVFQ5UEJMclpZT1IrdGZvRFp4cHll?=
 =?utf-8?B?ejBGSWdXamRRaUJQcHJSTG9uQXlVeGF4Qi8xMVdVeDA5TDBEcVl6dDg5RzNk?=
 =?utf-8?B?dmRnVkIzc216ZTdqRzNMTys0OVZMbTNRd3QwWUpLSmVVVzB5ajRmTENPT2wz?=
 =?utf-8?B?U05ZZ2xNbzR0bmU1cUpWVndVWXAzT3QwdkE1cGk0djVNSkJKRmFKQ2JYd2hy?=
 =?utf-8?B?S295RnNpbnl1RXpTUjlvaEc4VzdHWVorWXVNSnpmVEk5eklZdFJFMng1NlRS?=
 =?utf-8?B?TUhqWU9peWNrL3IxbHpWS0JPRFhYMWcyeEhhZzVRN0VuanJJTURjSTI2SnZO?=
 =?utf-8?B?UEJnbTcvVVIwUWROMFVrbFhmRWZaL002L095d3l1RnhhY0trdE80eVJvQXRt?=
 =?utf-8?B?VUpxY3k2ODZDdllyb0lheDc5Zm1Zc0lRTHBkbkRPaTl5RExSTzFxOHJLNVQ5?=
 =?utf-8?B?VHZMLzJMa01WVXhmQ29TR1gvaWNvOHRHYXNDOXk4aEJZYlFJUzlzRDJKS1Jy?=
 =?utf-8?B?SUdGZWwrRmIzdkV1SmIvR2FJejRoM2FpOUcxenVCNUZ4dE5PMmZYSFBsOUx5?=
 =?utf-8?B?RmRBSnJwSW5MajlHdU1EL2NCTGE4dDE2eGhUWnZDY3Bsd3QwUEpnSEtmdnhL?=
 =?utf-8?B?dGFidURvQS90NmZPUCtuVjltN0ZITXdLZ2dXMmhvNlA0UnczZVdxaUJpWE5W?=
 =?utf-8?B?WWpFeWFrSHpwNzEwWXZhbkVnRHlyaXNoOTQzellsK0VGcEZIY284bTJRSUlr?=
 =?utf-8?B?UE5ONUdrYjVOUjk2Wk9HYUNTeXlyeS9YQk02bG9iZG1XeVJBREhPcGR4Qjdr?=
 =?utf-8?B?ck9iNjVScGV6WCtJUDlHaDJtU0ZrMk5qamlxaTFoNUI0cVNXZUM5SDZ6Tysz?=
 =?utf-8?B?Z1NVaU9kM2JISGxDSHdGZHM4YlUrN0hraTlzZnNKaW5IaE11WnJGU2hkL2RV?=
 =?utf-8?B?Mnp0ODRQZ2xucW5XZ2NFS2p0K2U5d2Ywc3IrQStYMldtTmVGbHIyRkk5QXJD?=
 =?utf-8?B?MHBTVEpDejNzOVRmdlpvUTk1S0hzbVM5L1NJUzNIcHpwWVNLbTZNaW5PK3gw?=
 =?utf-8?B?TE0rai9aaU5YWVZTdHV6S3J4VlVsRk9kZk5Fc041cjlJOGhmVysrQmM3cStX?=
 =?utf-8?B?bXlMemZiRzVRd0dzL2JlYkkwd0FkRE9KbVFycmhkd0p3bUlScnJCRzB4ZUVi?=
 =?utf-8?B?amVadEJER0pXUjJjSm9jSkVlV1NML0FYYVBxNkZXYjJLMUE1d1hsdEI2WU5l?=
 =?utf-8?B?ZTJLbG5YOWlWWE1Wa0g4WVg0Z3FUczlPVjhKK2JZMGZSU0ZBWXQxR283S3Vm?=
 =?utf-8?Q?RpqmUrol2dKtIvZQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4b02da-f1c8-43b3-44c8-08da4320db18
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 16:16:02.2192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxC/daKAQFlUbwtVqd53TrcQmAPsRZfszYDvRtbLiPs5ivDlvh+ODWPTaoZqMp9A/8NYpb82tqwwJ3NFryzhgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3939

On Tue, May 31, 2022 at 05:40:03PM +0200, Jan Beulich wrote:
> On 31.05.2022 16:40, Roger Pau Monné wrote:
> > On Fri, May 27, 2022 at 01:12:06PM +0200, Jan Beulich wrote:
> >> @@ -289,44 +290,75 @@ static bool __hwdom_init hwdom_iommu_map
> >>       * that fall in unusable ranges for PV Dom0.
> >>       */
> >>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
> >> -        return false;
> >> +        return 0;
> >>  
> >>      switch ( type = page_get_ram_type(mfn) )
> >>      {
> >>      case RAM_TYPE_UNUSABLE:
> >> -        return false;
> >> +        return 0;
> >>  
> >>      case RAM_TYPE_CONVENTIONAL:
> >>          if ( iommu_hwdom_strict )
> >> -            return false;
> >> +            return 0;
> >>          break;
> >>  
> >>      default:
> >>          if ( type & RAM_TYPE_RESERVED )
> >>          {
> >>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
> >> -                return false;
> >> +                perms = 0;
> >>          }
> >> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
> >> -            return false;
> >> +        else if ( is_hvm_domain(d) )
> >> +            return 0;
> >> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
> >> +            perms = 0;
> >>      }
> >>  
> >>      /* Check that it doesn't overlap with the Interrupt Address Range. */
> >>      if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
> >> -        return false;
> >> +        return 0;
> >>      /* ... or the IO-APIC */
> >> -    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
> >> -        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> >> -            return false;
> >> +    if ( has_vioapic(d) )
> >> +    {
> >> +        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> >> +            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> >> +                return 0;
> >> +    }
> >> +    else if ( is_pv_domain(d) )
> >> +    {
> >> +        /*
> >> +         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
> >> +         * ones there (also for e.g. HPET in certain cases), so it should also
> >> +         * have such established for IOMMUs.
> >> +         */
> >> +        if ( iomem_access_permitted(d, pfn, pfn) &&
> >> +             rangeset_contains_singleton(mmio_ro_ranges, pfn) )
> >> +            perms = IOMMUF_readable;
> >> +    }
> >>      /*
> >>       * ... or the PCIe MCFG regions.
> 
> With this comment (which I leave alone) ...
> 
> >>       * TODO: runtime added MMCFG regions are not checked to make sure they
> >>       * don't overlap with already mapped regions, thus preventing trapping.
> >>       */
> >>      if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )
> >> -        return false;
> >> +        return 0;
> >> +    else if ( is_pv_domain(d) )
> >> +    {
> >> +        /*
> >> +         * Don't extend consistency with CPU mappings to PCI MMCFG regions.
> >> +         * These shouldn't be accessed via DMA by devices.
> > 
> > Could you expand the comment a bit to explicitly mention the reason
> > why MMCFG regions shouldn't be accessible from device DMA operations?
> 
> ... it's hard to tell what I should write here. I'd expect extended
> reasoning to go there (if anywhere). I'd be okay adjusting the earlier
> comment, if only I knew what to write. "We don't want them to be
> accessed that way" seems a little blunt. I could say "Devices have
> other means to access PCI config space", but this not being said there
> I took as being implied.

But we could likely say the same about IO-APIC or HPET MMIO regions.
I don't think we expect them to be accessed by devices, yet we provide
them for coherency with CPU side mappings in the PV case.

> Or else what was the reason to exclude these
> for PVH Dom0?

The reason for PVH is because the config space is (partially) emulated
for the hardware domain, so we don't allow untrapped access by the CPU
either.

Thanks, Roger.

