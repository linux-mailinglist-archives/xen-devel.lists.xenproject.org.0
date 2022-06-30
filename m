Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A756207F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 18:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358615.587895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6xDk-0003TG-O7; Thu, 30 Jun 2022 16:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358615.587895; Thu, 30 Jun 2022 16:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6xDk-0003QY-L2; Thu, 30 Jun 2022 16:40:48 +0000
Received: by outflank-mailman (input) for mailman id 358615;
 Thu, 30 Jun 2022 16:40:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6xDk-0003QS-2S
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 16:40:48 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 635e97f0-f893-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 18:40:46 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 12:40:44 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CH0PR03MB6114.namprd03.prod.outlook.com (2603:10b6:610:b9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 16:40:41 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 16:40:41 +0000
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
X-Inumbo-ID: 635e97f0-f893-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656607246;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TXxDLEZP8qVY5qtFkA+2S04SAHfniynB8YILSvOI9Vk=;
  b=RZNnQWB5m5e5KcgeneS0GqL4KNJo61usjwF5H++a2ujUcgVAQRqjD1z4
   HZwfm0EJaEeYe9xOg5fD1skAZvQ6JHR9ebcdwj82IamSUHaXPnMFtT25Z
   svNPdx1lHs+XP7PCSOUrCVF0HMBMupgPs6nDCqbDLcpY7lk8opV+O15rd
   g=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 77385043
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:23MFNKxRrhPO9lOZEGR6t+dDxyrEfRIJ4+MujC+fZmUNrF6WrkVWm
 DBMDz+HOKyDZ2DxeNp1aozloRlVsJ6Gm9U2SVM//iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY22oDhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplhJyKU14WHvX2urojaz9pAwhDJZVI0eqSSZS/mZT7I0zuVVLJmq0rKX5seIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeHuOTvYQwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgLGYI9QrJ/sLb5UDz9yts/YbxOePtWd7WZP9EuEKl/
 2PJqjGR7hYycYb3JSC+2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRqGSzRtZeI
 Ew84Tc1oO4580nDZsb5dw21pjiDpBF0ZjZLO+gz6QXIz7WO5Q+cXzAAVmQYMIdgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZo8L/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:Lz0i66xN6G1781FFdJ8pKrPxt+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvXRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIG/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF9nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvGOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KNoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFrLA
 BXNrCT2B9qSyLaU5iA1VMfgOBEH05DVCtue3Jy9fB8iFNt7TNEJ0hx/r1sop5PzuN+d3B+3Z
 W0Dk1ZrsAxciYoV9MMOA4ge7rCNoWfe2O6DEuiZXLaKYogB1Xh77bK3ZRd3pDYRHVP9up4pK
 j8
X-IronPort-AV: E=Sophos;i="5.92,234,1650945600"; 
   d="scan'208";a="77385043"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqsAPW1LKZQbYwkzBM7R/EIuIIxNsLV8LjvZ/P8wvVQSKbgtxHoC48ieKd/ws+OYJVXGNr12hqHMsGwIvWEj76nsTWcZd9SQfTUcuG7LqfRcleladwI6zAyxKBH9gnuC7eNGpm0eYiNACiadj3pRwQ8IPp6H/11Yg0Q//S5QGSAGED0LIBmD6G+DM4fTkqevC9l+oRlVYDy7yRYjyxqNu/xgDqZghY3EL4TbXg2aQwSQQZvLa2CETpn1P/U/X+kwSOse92BRq9HJNQNCQfZhvgAQsEg++PrxHmFl+y5ovgUXGJapUuD0sKb1jW2dKkknTuZnFpGvC2UWY2yOKj4/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKS1QyhNxme7N0Fa1uomyyNeEeioVy2n4cZCZD/R160=;
 b=QEwvNrMvs74jVKFtU9pEivfcc18zwp19qMsq+Ol4r4i1Wia3RNvo/5r7qIb4VFLQI5r33ueWJDcSmvjEgnZZYveR/GQ5e73dQS4JYqrD2sCJzUGiG4g/HCoAzq5SR04VJn674q/nznkE/Tf9WbdDYo7Aq0LPR+o1yMOFJFf6z6XL6+N2VZfHVnhdcEYTSwtVEWaYeQBT5Jmq1Qxj6MFlBUhzkQMxQcL4k7CXe1NLaYXfLAMkxZSCLHnznSOzNRDIsrB4e8SH/zYayCa5kw/0HcI/3/11tVwK6kwXMKl0NqO92zjbq6DFxSdbap/gPkw3Z8Wxq7ehCR/gs3k8vGJNrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKS1QyhNxme7N0Fa1uomyyNeEeioVy2n4cZCZD/R160=;
 b=hRhoTTlWtpHP2WuJIZyz9mE6ebfTarc3xbxO93NZ6rS9/z9BBDxmuqtjSUQ4JhOmhkUUwF4spqIMkzZOcn8p0nyp4lw3PNHGB8VAOI0Kcig4Hyb6QXus6iGFfi54hQW6zpbaDU9HMmCwzI9fhCon2NLwTfEmENLOkhiVPDH/84M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Jun 2022 18:40:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] x86/spec-ctrl: Knobs for STIBP and PSFD, and
 follow hardware STIBP hint
Message-ID: <Yr3SBViu6mJbdWdZ@MacBook-Air-de-Roger.local>
References: <20220629184508.15956-1-andrew.cooper3@citrix.com>
 <20220629184508.15956-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220629184508.15956-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO2P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07df8fea-eda2-4100-f3b9-08da5ab7454d
X-MS-TrafficTypeDiagnostic: CH0PR03MB6114:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PWYkQjUTBwTA5uoqP99S8+617l5BqwQwtSWn+D2wvFOQQIespYSdJ6LIZEUQiSfqDuMpyLJF+7Zx7ClwC+6aePKAGf2YztCxyEHHMfIOG76az1+mSWCeAx1Yvd4/u/+F1CTG9x9QMwfCU5zjoVU5Yhl2CSmJX0Exzvh+RZpGqX6YrNxRKu4aJDbZYXy333ruEEd6jzUewGvqRQjaYqfTFwrry2uMTrHdcp3jQMhUxXpNeqNhH4h22B622ReSAHdWlD/N7cC0iMDtr5d7UYFMpmhaPiYrS3gK7qvWVwFhg0G/IXPz0+uQmJnGnV8XaXe/fSsJWPKZsFZkhISTOdsmwesIbhzQB+eElOi8Y4GS7mfGXapHS76XfUzBZ43MrOIhUUE2lHSUMoYZ77RiZOz+aGE+awlt/ZrtIlzdVN2pigfAWS9LLk/P0nrituaCWI2wP/ni3W8ilOBX7Nhp51h0T85/90i6vc8VNIXCUMfNaCvMTIGCQOCina3Zrzl2T0Szp6yv2sV9F19FYlipOsYV4cmuvPAXtBtj7bMVtSa9UDPCij6DlDtz+vvY/LkC12+0JuKHo/84A/x0F8unqiSS2Z94cw2hj/G2WEMgq4q8rhA+1oOw7sNmWNSHHxRB2Nfw7tY6YFvh/1XwmSwAUaMUP9isGVAWpWgs18pBmZTy7GseSsNwTpBfVh+N6vDQ2U7o8wK4MI6NeeavG8ahYeuRwfEuBhUUFTPYw8I5pEZYlWDvNHVIcJOcxIkIkf7JeA+qSJBQf4sed3VohPU3dlna9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(85182001)(86362001)(38100700002)(186003)(41300700001)(6506007)(83380400001)(26005)(6512007)(9686003)(82960400001)(6486002)(66476007)(316002)(8676002)(4326008)(6666004)(478600001)(66556008)(66946007)(5660300002)(2906002)(6862004)(4744005)(8936002)(6636002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnRRK2c0ckNveTBLVlhBeE12Y3BOaFN0cFRjN1J5OWFEaVJWQ2tYM0lOSjZr?=
 =?utf-8?B?ODdkbzF6SjI0dlViTU9kRE5PN0lJU1VhVll2Vm5RRS82elBsUFZqcnR1S1Q2?=
 =?utf-8?B?Wk10YVhSZ2xkVk5HRTE2dHhNS1BBbUx0bUdhc2cvYVUwT3RKOWFPZzVZTVB3?=
 =?utf-8?B?L29vVHlWU2JaSXdlTCtQOFRmajN1UWtwTDZRQ0V6SVFTSnFZR054L0IwM3Vk?=
 =?utf-8?B?bUJ6YkM0b2J3YjNlODl2dTlqSkxIelduQVAxbXpIT0QwT0FLQUlPZ0Z6Zm1w?=
 =?utf-8?B?Um9EZjdvb255L3NpdVJNSjg3QUt2cFRWVHZpWjE1UFAvYWk5K1k0RFlCdUkz?=
 =?utf-8?B?OWJwVkxhcWlWY3lablZpeTdXOG5sWnVMdWpScVJCRjB6cVdSOVBMOVprMldL?=
 =?utf-8?B?dGNBUnA4MlRpd0dMZDBFQ0pqZS9lTG1aYzlDOUhQRlgxd1dJZFBNK2J0QWpD?=
 =?utf-8?B?Y3RCaHh5VlFrdzNlL052eGhpamt2NkJrTnR3RUNsUTltanA2d2QwVkNpSzRq?=
 =?utf-8?B?SmFjc2VuOUpuWEtwOXdpUk4yNkhzczJHMWEvNXc2T0JRaStCQnlaWGVneTJp?=
 =?utf-8?B?d3hiMjYwb1RLQU8yMWxPZVdFMkJIZVhrU0dieG54QVROYzl5YnpwNmdmZlVV?=
 =?utf-8?B?ZzA5TW45MGkxYmI3OWdqdTJYOHdTZFVCcVRsLzl0ZlRBaUxtVUpITm5nNWNL?=
 =?utf-8?B?MjNHSXRMcTJFaGhxQTB3bWRERElhbENMcUg0VHc0MndwdlhRREVHN3R5cjBY?=
 =?utf-8?B?MGV6aUVWM2wxV3dKeitjdG91aWk2a1lEa1FoaW51ZVN2K3grcUQzZ3NUSWFI?=
 =?utf-8?B?b1pOS3lxZERMOUdDaURlUlZQOHdFNXc4eURXazBaS1k2ZURuMTZkcnlXTnJW?=
 =?utf-8?B?TU14blZnZERpeGFCZ0s0YURsZjJQQnNVQVdjS1kxWlNPZXA1bUI3RTdqUkpw?=
 =?utf-8?B?YUhJMFNxVHdod2o5b2pLdTVwcXRNRkl0Zk1sbGtsc2I5aDh0VFh4QUxUSFZZ?=
 =?utf-8?B?bG0rTzdid21lbWVUanpZWnQ0VktlWE9manR0VFVaNTNRbi91NmNiSjdZTjZs?=
 =?utf-8?B?R3RTTDJKMWgzcDQyMWlpc3VKN3EyQjJKR0VIQmRCL1BKOGdmMURiUWRXWXhB?=
 =?utf-8?B?dWZHa2lWazJ0TC9IUXNLM2FNZU1GTVVSaklRYmRiamJIdVhQbXVqbmxhaXI3?=
 =?utf-8?B?Z1dQclhsZlVMK0UwRFBBc2c3bFp5VG9tMmROZHN2U3BBL1htNXEwWFFEd05m?=
 =?utf-8?B?WExEMDFkM0NDa1ZkQzJnTVdIUmpTZjY5Z3kvMlFJWHJVdmtoYzR6MjVtMUJ4?=
 =?utf-8?B?bW0rRUdGK3BLSFlpRWhYM3BWcWxoMnFIbzFmelZjRTFuNmZmaDgzRnhYbEI4?=
 =?utf-8?B?NmQwOFliSzBuRDdXemZ5dTl3cFBvci9UZzg3WWpReS9HTzRKM0pZdGRUbExl?=
 =?utf-8?B?dnV2UXJHOHc3c3gyTldhRktrUjRHMkI3blJpTU16TWo2MXhieVJ1RXY3clh6?=
 =?utf-8?B?NGVrTy90NW5ucmxJRVZKVlJyNUszWE04K3pFbVVNaFdoWjl0alNkaklOTFJm?=
 =?utf-8?B?UWJMSkxBTm10VFJORGVhRjNDNHlLS0hXZ3p0SXhUcGRUcTRlZmNLeW5tSk84?=
 =?utf-8?B?N2xJL2h4Q1hoaitNZnlwTmhSWkxKUDFXOEJHK21KdzliVW1PMmRsTFczanhD?=
 =?utf-8?B?RW5qY3VCV0hVNmVqcEYrNUZTbjB4WGxFVTVUa1pPS2d3YVdKZWF4QVNOMlJU?=
 =?utf-8?B?R2UxbVVacDgyMStHTTY2S1JlNGQxbU51UUNGa1BCanVNck1ldWZwdFZPM2ta?=
 =?utf-8?B?eVhORmx1aTZkRFdCN0swMmlCVlFtQXVnUzJOeGZyRjd2a1diT2IxTWZsT3Rk?=
 =?utf-8?B?OWNkYmlqa0dnZzdsNFlFKzUzU2dhNjFzUWwwZVE5OTZBbHY3ZGlVUlo4bDRm?=
 =?utf-8?B?aXl2Tmw4eG5kamZTRk1zWTN6QSsybEpKSmFNbm9PcW1XVE9URW5jRTNxNE45?=
 =?utf-8?B?UmxFUGdEOEwwbnA4NGtDTis0N2NkUzIvazQ5R0N0Yy8xMGpiTXZUNUpMNVpE?=
 =?utf-8?B?OXhKUk01V0I0VTlKZHBLYnd1TUtrZ0pXUEdXekFnY1ZiNlNxU2FYZWxxNVBS?=
 =?utf-8?B?WHd1Zm1WTkI1aFdpVTg5ZGdoY0d5Mll6eXJFUE0reElNa3FDS09kWlA0dDBX?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07df8fea-eda2-4100-f3b9-08da5ab7454d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 16:40:41.5691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFvh+nYlUC1bmkJo+mK6TWkidJvzpP1YHGN20AMOwixw8YZH+H83VhDRhHBOLlBcJiuXNPCYWexu07LXGVqxsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6114

On Wed, Jun 29, 2022 at 07:45:08PM +0100, Andrew Cooper wrote:
> STIBP and PSFD are slightly weird bits, because they're both implied by other
> bits in MSR_SPEC_CTRL.  Add fine grain controls for them, and take the
> implications into account when setting IBRS/SSBD.
> 
> Rearrange the IBPB text/variables/logic to keep all the MSR_SPEC_CTRL bits
> together, for consistency.
> 
> However, AMD have a hardware hint CPUID bit recommending that STIBP be set
> unilaterally.  This is advertised on Zen3, so follow the recommendation.
> Furthermore, in such cases, set STIBP behind the guest's back for now.  This
> has negligible overhead for the guest, but saves a WRMSR on vmentry.  This is
> the only default change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

