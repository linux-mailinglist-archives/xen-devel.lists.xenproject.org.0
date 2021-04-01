Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97AC351499
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 13:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104387.199655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRvre-0004Ak-7k; Thu, 01 Apr 2021 11:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104387.199655; Thu, 01 Apr 2021 11:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRvre-0004AK-3J; Thu, 01 Apr 2021 11:51:54 +0000
Received: by outflank-mailman (input) for mailman id 104387;
 Thu, 01 Apr 2021 11:51:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRvrc-0004AF-8K
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 11:51:52 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bad752b4-6f0c-428d-b3f3-ee11ccb00475;
 Thu, 01 Apr 2021 11:51:51 +0000 (UTC)
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
X-Inumbo-ID: bad752b4-6f0c-428d-b3f3-ee11ccb00475
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617277911;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d4jgKVieTHjDdONydkGo/SyR7h6s4QTs1b98ndlh0K4=;
  b=dvt6XEWm8BonrHVpX0MXWQY49EUe3Hnd/LgMOD7oL6XHThDmaS1xeUYk
   JSijEv4vtd5Rrt8JzAj1I/C/6oS8McAsiYalPb07J5XkKooXHypcslS/t
   gpfUC7+6wAomCIDvtyUL52XRrKLngeseJsGp3P6p7hLJeE2WoXvjX4Oep
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GHZsvZD3DZTaWFfnmKSwpRF0eKfEwnEUOtLE/xfH6ULO/58hG3Bt9HuOtP7diodbOjORx//4WE
 KjW49zG4qyik/Lt0rVkkaiBOkMpP7blP885jmRuWV8S1wndBkEJ6CSE+sg6D1tbDDtTTqAswtU
 48G2Bv7QjJQzbOrXcVmtPfwT/BylrOuq/A/UdsKwIav+9wUV5mzbL+TK4em9ISyDpPIJPp4vun
 vUqhCF7lk3hZwKlOVOVubT64DCeJsglZmuSpoddRdZ8ibRKAWy+4WGBaj2y7yJ7Hdzl4fJSP5h
 D7o=
X-SBRS: 5.2
X-MesageID: 40681546
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GII2+64lif+rJXD/NAPXwUGEI+orLtY04lQ7vn1ZYRZeftWE0+
 Wnm/oG3RH54QxhIE0IscycOaWGXHPX/YN0545UBru5QAz6ogKTXcNfxKHJqgeBJwTV8OlB2a
 B8N413D9PtBVZ35PyKpzWQOdAm3dWB7eSUlf7Tpk0dCz1CRoNBy0NCCgidGlBrXwUuP/EEPb
 eV+8YvnUvFRV05dcK+b0NqY8HioJnxmIvicVo6AXccmXCzpBeJzJK/LBSCxBcZVFp0sP4f2E
 zIiRbw6Knmk9zT8G6660bp455bmMTsx7J4baTn5qcoAw7hhQqyaINqV6fqhkFSnMiU9F0onN
 PQyi1QXPhb1nLLcmm55Tvr1gXwuQxejkPK9F6CjXPv5fH+XTIxYvAx575xTx2x0SsdleA59I
 gO42WYr4ZaZCmsoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJ8Cv47bWnHwbFiNN
 MrINDX5f5Qf1/fRWvepHNTzNulWWl2NguaQ3IFptee31Ft7TpE5npd4PZasmYL9Zo7RZUBzf
 /DKL5UmLZHSdJTSq5hGuEbQ4+SBnbWSRzBdEKeSG6XWZ0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCo8YETrBcqS3IBa8xzETWmnNA6dhf121txcgPnRVbDrOSqMRBQFiM27ucgSBcXdRr
 KyNfttcrHeBFqrPbwM8xz1WpFUJ3VbetYSoMwHV1WHpd+OLoXrs+fcYevCPbaFK0dkZkrPRl
 84GBTjLsRJ6U6mHlXihgLKZn/rckvjuZRqEKbb+OAXwJMXNpJFtxUUjVjR3LDGFRRy9ogNOG
 duKrLula224UOs+3zT0mlvMh1BSlpO7K74SHNMrw8SO0byebIO0u/vOVx67T+iHFtSXsnWGA
 lQqxBL4qqxNYWX3j1nIcmgKHimg3wao2+qQ58QlraY39rsfoo1A/8dKe9MPDSOMyYwuA5x7E
 9fdQcPRybkZ0jToJTgqKZROcbyWJ1XhhyxLctdtHTF3H/s3/0Hdz8+XzqjW8aMnEIJXDpbhl
 p47qkF6YDw3QqHGC8agOA1OlVXdSCsGbpDSD6OYp5Z84qbPT1YfCOtnjyVixY6Z2zw0V4d71
 aRZRG8aLXFBEFQtWtf1buv+FRodn+Fd0Y1cXxit5ZhfF62zkpbwKuOZqCp1XGWZUZHyuYBMC
 vdaT96GHId+/mnkBqUki2FD3Mo29EnOfHcFq0qd/XW1mm2IIOF0aEAEPk8xucRCPn+9usKW/
 mYYQmbMXfxDP4owRWcojI9IzZvwUNU4M/AyVng9iy1zXQ/Cf3dLBBvQKwaOciV6yzhS+yT2J
 t0gNoptYKLQxLMQ8/DzbuSYy9IKxvVr2LzVe0upJxOta85tbd4HfDgIEj1/WAC2A97INb/lU
 sYTqg+/avIPZV3edcOPy1e5Vgkmb20XT0Wmx2zBvV7e14jj3XWZYzUp7XJrKciGU2Hqk/7P0
 KF/yhU4vfCWG+C2Nchet0NCHUTbFJ57nJouP6GfcnXDg6hculY5lq0MnOnatZmOdi4MKRVqg
 w/+s2Cmu+cajHx1w/RtyZqO64myRfafeqiRAaXXfNS+9O0OV6QkrKn7c66gjDwUya6YS0j9P
 N4XF1VaN9ChDkkhJA21Sb3SrWfmDNZr2dj
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40681546"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sbejz3DKoyaZiLEfnI0RSj9mvO9wey+04AZXo2EKNO30olK2ilY6QqbMSItR2HQu5gUhPqqogrUPiyfrKZXPS7Fq9DtBfVjq4zU13KSD/GGjUIbBx69NBJl/JtZv1l9knUNrzyyfN7wdhfK/RBCkICTzS4LxXz75Lz2OOU5R1J521HFN1yjjQJ3EdAYk9V1cNrmTotPAWXFab43NZNbZNPIVF6NpdSuBdrRnmonzPhbFhojWKkXFKG/HOkxS8vP0GSnUPvgPIdjSj9Q+VAPnn7jOBUR+x4ewqiW1mXT/9R2WfoR8JYr2njh1Dinw2iuYvUBC0pXHVtamUz+fH2O1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4jgKVieTHjDdONydkGo/SyR7h6s4QTs1b98ndlh0K4=;
 b=TIHOSzftfJL4Fr52q8nKehU0mzldOOO6Ak0kG+XTR0LvGHbrJm5S+tVjyWubMc2ekrEijbAwjTPOwsjlXSJIPLiXV0YwP2olVgvBVv9PVV8pJjT3kUGC1qV5CltUuj/1SK6nsqt+565SkHW/pfDf7QQs1Gbs6ECRxkprov+NizNfgZGdHpYIbsBbw/FSSi/QQKZjjOKTwikM2Lt8TV6pvxVMgHnfzkWgQWYXB5cca2gNKmrEOENvptfjDo+OKZGyUdU2mStHm0nkKBJ63RqND9khdrTcZbBE+Yf9PXAUS4rW7mrfgeyXGKEUr4Z7bmHhjP7DGa1RxFPb2KTWhIOZww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4jgKVieTHjDdONydkGo/SyR7h6s4QTs1b98ndlh0K4=;
 b=eOmpsxyUZVeUSKd+QXXS0wFi+kR2bjBMlVzJKBm+MhAumRAzQsjPorcbHIsWWPeYIfnPqy1MzGH0xefzY9Sudl+SZ/T/Mrs20B9MP50V3Jp7LPTBKXqMdEknI7CQr6PL/qqdiIfl9SzXxVQ4laUo+zx0GkjVYS9pl1uag6tRHgc=
Subject: Re: [PATCH 1/8] x86/EFI: drop stale section special casing when
 generating base relocs
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <63ad859f-82f0-62ea-5e55-9c6d3db6816e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5b42bfd1-7d54-8e2a-9fb9-3c153532bb1a@citrix.com>
Date: Thu, 1 Apr 2021 12:51:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <63ad859f-82f0-62ea-5e55-9c6d3db6816e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c45788be-d1a1-4eec-d10f-08d8f5048668
X-MS-TrafficTypeDiagnostic: BN6PR03MB2516:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB2516028F47A8E9A12292BD3DBA7B9@BN6PR03MB2516.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZT/+TusCsGa7PrSTxjtU3Rc3ndZVlr0fqvu2ZdgkYNJuzQOZpLWuFUc4IVSc9A6lhX6mDWue+Ap7IKH3vj99P3QcR2WzwwVQMFkKCt7n9QpU41PvaXuwF0qtw7AK6E3b/rNruoJiY92+Mo70GgPX8vORraJIIhTcOmv2YNTHFrWowQkDbSX7XL5mvxT9kDLsrohd+p/uZEiM1SsUAizaTtSoJP5QMLnTUxNO0mK/pR5gMGwN08OnlZWomYwRrDUXqwPNM7OEdurlVd6si+JF2l0MJByybDxbzIKqe6WVlYvcEXvgGtQ2CvW47R4lhAGQ/rDwtJ2CPT5qJSjHDsP8eagqYVcUnKKdXX74zza0HGWUn56NYCQ8oXxoA8JFw/XzK3RgDdvExw9kzHKnGYHI+DSKWuAxexTwPRuxF0FWymV7QwBFVKvQPH0J2scv/XTzXa/mryCk1jZ4fKghs8gddCO25qtEhk+g1Yip+H0jwWU61vvhbMeqJXK1hC5sTLY1ntEcTZ8hQxPyrruneEhpo3WIEF9BFbLcIwNssXIaNl7hXVLzIULYGT8E9H4sqlOacGk95SiyLX93LBnwQLGc/Es0V6TpeRcUqV7350OXMpjbio0+WU00boFZB60oLjPNNvK77BGoDGHxI2pbNooHzdZ8ViYR6XEMFWkbfUjcJP02WjiDbci0a3RGQbsPhDaEjB4TRzX7loM8p03K/IOLED130Kk9FhLZKqYI+ZmaLM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39850400004)(366004)(107886003)(31686004)(54906003)(110136005)(4744005)(5660300002)(6486002)(31696002)(8936002)(86362001)(53546011)(16576012)(16526019)(186003)(4326008)(66556008)(66476007)(26005)(38100700001)(36756003)(478600001)(66946007)(956004)(2906002)(316002)(6666004)(2616005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VnlRTTBOdVhtUWtKZ25lc1ZBNHFONHk0cHpOMStzRHkwUlFWa3BDRjlZNkVB?=
 =?utf-8?B?TnhtSlhWdUJHbngrUUtqTHJWcGpvRHlzN0hlMGw0OXV0YjZBRTdwaitQUFZi?=
 =?utf-8?B?RGtaNGRJZ1lJSEhsamRycHh2Qll0cnJuTmJoUjREQ05vYVFVOHlWLzhtSUY0?=
 =?utf-8?B?c3BybHRNTjdQMUlablpubUR6NGpUM2VzY0FIT1NMRjNWYXI4eWRtSXVsUDJs?=
 =?utf-8?B?YzAyd2VteFdpdk9NSFlIdFJHci9zZElPS3M0dklGZHhhR3Nub2JYdTk5QUp2?=
 =?utf-8?B?KzJxSWVYSjVnSXozdXErQWJ0VmRsbGdWY0M4Z0FQQ2dlSzNkcFRmQ2ovUWY0?=
 =?utf-8?B?WHEyTCtobThUYTc5M0RHOTg5U1Z3QTJzWFV6L3pNdXlNUzFoLzhtb0xzRDA0?=
 =?utf-8?B?RnAyZTg1MjRBUW5Ubmp4YTU3MzlvNXVqd1NQcHRTQThGc09mSzc5cUtQRTho?=
 =?utf-8?B?Ty9rSkZUaEJaV0JFUkVvNDdpL3pMbUhOb21jWm0wK0N3UDVpNWFVZGszK3lF?=
 =?utf-8?B?NmxTUEs0Qis4aEIwVXJ5OXF2Q3oxUjFMT1FEM1ZkaHV0NGVBdjJnZkc0Vys5?=
 =?utf-8?B?WGlJcUM2WUxtVVl1Nk10L2N4bkhjY1JKSXI4eTZwMVlqb3dzZGVMWFZueERl?=
 =?utf-8?B?aEpGZCtSRW0xZTZmU0lOajl4WktZVXk0VngzMkJaVWtLUVBlTHVGWFVaL2dh?=
 =?utf-8?B?aGFSemxsMndqZ2RRcEExbHVNVGZKRldsR1BpNDEwRmliQTdmNkhLRnRaY2tv?=
 =?utf-8?B?Zkt4M1BIYTMvYVNSaXJLczRVZkZJb09ScG16UzBFYTBmb2dkV1JPTTFhYlho?=
 =?utf-8?B?SzFBaklMRHRkOWQwbnBqcWY4UkdhdnFnSDhSaXJ5RlZUN0dERGwreFZBNC9a?=
 =?utf-8?B?NXhsRk9lc0gybjhRNitKWHZSWlUwWFNGdVA3bGFGbUlENTVVd3QyU1BVN3E2?=
 =?utf-8?B?TmI5S2RjK2RQZDZLZ1pUclpKQ0RkNjNxUW1XdmVHMzdhNldDa3JTTjZJTWQ1?=
 =?utf-8?B?a1VZS2ZkU1FSN01OakpFYUQ4RWsyT2NROGJnWVkyb0l2T1VJTWFId2JXTDNB?=
 =?utf-8?B?QkNpc1J3YzdpdEVhWStsaXpIVDFjeGw3TDJIc1JCOWpOTVZ4Z0ZyVUpmc3Rm?=
 =?utf-8?B?L2d1L3pROVBLZFNzYUNmVEx3bGxrdEFpQWVpT09zblpsVmNZUE1NTnhoQ1dQ?=
 =?utf-8?B?cWpYVm01WFlHR2libGJCeWtZQWcxUW1udmdhL3ExYUFsVTErTlRKTnEvOXNp?=
 =?utf-8?B?SVp6TWM4WVAycmxkdW5mTGFSMFlqZE53UDRnckRuSjJxMkpldDJTQ1N2WlJx?=
 =?utf-8?B?NXBaU21VM0p0Wit5Z1dGcy8rdkVwSTFTbWFCbjVSdDVTZFJ0WWF4dG5qSHpS?=
 =?utf-8?B?Y2tmb1BZOHRSQkM1N3hWdzJXRHdpalBBNlExeUJzeVNBeG96TXBsWXd1cVpu?=
 =?utf-8?B?MjdRTm52OGtQZEZRaHUzbVFLd0RabXFnZm1Lb0tTbEpLRFQvWmk3WEszS29N?=
 =?utf-8?B?dlY0TjczN0R5blNFaU5BT1ZWYURZYjVqd3c0emFmOGNJV0RWZGg3ZWI2QWFU?=
 =?utf-8?B?enoyMEc0aFRia2RKWC9xVlhjVU1Kby90SHV3aDFTWnVtRmVnNjlhdVRkcHlE?=
 =?utf-8?B?a1U3VEJxRTIzTmFOSlVtOEJCUzZOR3pLTllGWm9ucVdBcUVGV1M5a2NRZ3dS?=
 =?utf-8?B?bWtsVG9oeDRncUJSeGRmK05qb3NrajdkTE5nU2ZRZVBKaXpMN3BFUTVLR1lm?=
 =?utf-8?Q?FrJOfEXNEp5URCAQoV0g9VrSjlr0vftSdiyqvtS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c45788be-d1a1-4eec-d10f-08d8f5048668
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 11:51:45.8144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AX3aD1zAyXazi4oj5LVVtMVKKWQOFhBsIJUFDsjiSoMfO4/hbingB9+kQOHZGis0v+PbBocuNf9526br/ZZ64pZUFNkwggn0m1gBDS0VL8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2516
X-OriginatorOrg: citrix.com

On 01/04/2021 10:44, Jan Beulich wrote:
> As of commit a6066af5b142 ("xen/init: Annotate all command line
> parameter infrastructure as const") .init.setup has been part of .init.
> As of commit 544ad7f5caf5 ("xen/init: Move initcall infrastructure into
> .init.data") .initcall* have been part of .init. Hence neither can be
> encountered as a stand-alone section in the final binaries anymore.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

