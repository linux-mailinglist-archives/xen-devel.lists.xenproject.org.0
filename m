Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5654456194
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 18:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227537.393553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnlKN-0003zP-8j; Thu, 18 Nov 2021 17:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227537.393553; Thu, 18 Nov 2021 17:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnlKN-0003x6-4Z; Thu, 18 Nov 2021 17:36:03 +0000
Received: by outflank-mailman (input) for mailman id 227537;
 Thu, 18 Nov 2021 17:36:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45Id=QF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnlKL-0003wz-Qw
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 17:36:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd31b9b4-4895-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 18:36:00 +0100 (CET)
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
X-Inumbo-ID: fd31b9b4-4895-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637256960;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kWT75wfhc7JiF6WpfaHQzETyxGTEAcs5UxforT8c0Wg=;
  b=OYqGRqfdVyd917mwm8KsLN2858vQob06yaXi3G37U9yG/QNqOgVzAGjZ
   Iflycle8uTqYXayBX3M8GkOoTvK7wZCdkud6VFiAik1a6ysHZNMQhMWIk
   00uY0uyB0zrhkKWVMj5yez75kolSLCUIb4UmaKEdhOgst1am3hJFuClhQ
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RfyjLZsZVSYSMPLs+pCVth9u8TprAeLslPIUYfTGyTXU0oq6OLRX9ghEDkZh8su1O7hivmiyg4
 /syJ4NS2Y/pb/5qrFmRHuIUn8yxuU8Ivpj4F0q9aiU/fak3arNl7igLFpprnIIwnJwvMP4Fit3
 gnLPmbTG8tVttD9CXsfXUvit7kHs63QPH2NLxA4Q+vVDDtpN/7BE4Jx29/H0HkU7hctaKHQ2mB
 2ICJIrrduW926PVpvW6bJZxN1viKPMpfJi+dw08w5YOignBPsiKdrRAtMfI66/GgmfRms+rdGi
 Gex2mp2tcsIK/83wKEy5QkwR
X-SBRS: 5.1
X-MesageID: 57672370
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 IMF8XrqMxntmpxkSI7/PBBgbTuLEh8C+k81xA==
IronPort-HdrOrdr: A9a23:E8wIsqoA/BVZcyErT7JX/ScaV5u6L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPPHFXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhJYwCFzOe74K7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLhSP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4Dp0/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjDSDczG6N69MpkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l2KvyEBS0dI7vjh6a88zebVRpYsQ8Ad+C5EbBh/374ghDa
 1HENzc3vBLalmXBkqp/1WH+ObcHEjbIy32B3Tr4qeuonxrdTFCvgUlLfUk7zQ9HMlXcegC2w
 zGWp4Y3Y2mAPVmK56VP91xM/dfPFa9Ny4kAFjiUmgPK5t3Tk4li6SHq4ndt9vaMqDh8vMJ6e
 P8uRVjxDcPR34=
X-IronPort-AV: E=Sophos;i="5.87,245,1631592000"; 
   d="scan'208";a="57672370"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/skgblitx+Xo6eMfS+APNUfp3q4SVhpIlmpzzL9kdtLOtXpZPmH71WyDFeVCyYGQT4AIVS+o35Nef7vLIlQhqkyTJi2JJyw+Z0qSUoa9HAWLTX9bJ8/yq9OIcOtvZ/azJnOb4c9A0pbkaMmJNaeXG1uMJ9x+WvbRkKqPsk8H7HgGg8je6OT1drpk3JWy5qDejj9Rd+8aWxx8zmFJX1o23UXa7h2ZY//Vq5wIxS2NdBTPzWUtF7M4PMVvCqB9NAQGw4j8bX7aN2wwvpEyAKCXFsUsknmRiy+ojlLvaMCHfbXF6D+lY4ut7v5bHJnhoQZlqs9EgDpfv4gWwsuW/t8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEMzDZ1qM1ZWDzNxPJYex5hz0cSy3ER9QpjwLe8HLj4=;
 b=bB8YBpJPd1WZdCswoGH0rawk7rNTo6xltqBbJApCybsOSZEt71oVU3/OHnJMBsskh3Q6UBgsSrMPddNkkcwq8CTiSxdK1yKXaGA6f3sxPC7YxRGPVf7o0YGUxg/VOizG7gkNJRmfBQ9TE1ZwayCg8pPRTvPmYoLv1OCiHvKPMpT4PqWVBYmHiH5gDIs0bYWYWJnG0kKqjRBuaqBzvZIumqShJMyCaFQFcSYshpM5E5sJOJBkgR2TKQOA0z+tJ1Mmrnj8GP6/xu8eDITn0SLVx69Y+s6JEZQprhokm1Zjk2ERCTsgySPVy+qoTuTuPEzQMq/eNXy8I42wNenp1nOiXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEMzDZ1qM1ZWDzNxPJYex5hz0cSy3ER9QpjwLe8HLj4=;
 b=Ii7wqRGEX3ymBCtOY4eOdCoYz/hPuy8OhPQQZ0medLIndyndgdYL9TtydPfx0QAUdnmooQTwgpMlO5dZem50MB4+QN87mkLyiawQ81bHyoxGnoooT6k1cPLhVF+35jpmrZQhQgQljwZZnHDG6eNEjWTZwLEy2QxeCgZHbySKKtg=
Date: Thu, 18 Nov 2021 18:35:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Alistair Francis
	<alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Christian
 Lindig <christian.lindig@citrix.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Dario Faggioli <dfaggioli@suse.com>, David Scott <dave@recoil.org>, Doug
 Goldstein <cardoe@cardoe.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, Julien
 Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Marek
 =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Meng
 Xu <mengxu@cis.upenn.edu>, Nick Rosbrook <rosbrookn@ainfosec.com>, Paul
 Durrant <paul@xen.org>, Quan Xu <quan.xu0@gmail.com>, Rahul Singh
	<rahul.singh@arm.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>, Shriram Rajagopalan
	<rshriram@cs.ubc.ca>, Stewart Hildebrand
	<stewart.hildebrand@dornerworks.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei
 Liu <wl@xen.org>, Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Message-ID: <YZaO0Cc16mzVgwq0@Air-de-Roger>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2111180920500.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2111180920500.1412361@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: MR2P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5b388fe-c6f4-483d-93e2-08d9aab9df8c
X-MS-TrafficTypeDiagnostic: DM5PR03MB2921:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB29213782EBDEEED0D4D9A6F98F9B9@DM5PR03MB2921.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bzawWG8d/draOXLDugNxHvPo67f/TOdXEY/5BgTFhaJ+uhmVeB7MCZVNDIwGW5DcUwuIJV3+FEhTwBb/J5yQRH33fXYXAE2EBdd5jHh1THs3jo68aicTpX5+R2RMhsqPKKssn1kfJyZ2/EJ3k1V0VsgSY586gg0N42HPb9s5cvugIMqBomCY3iCpqlEOwzU1/FwJZm0mSHNqst3WJfHulJbdwFOLNFw6LOKDnBRpzRJ1Wo8g7JhEPV8vBpWahn4yqEdhMaYA2GHEs9bb/pNgnK/1LG2yV0VyTr/vV94vqGroUD57SJ4lHfhw9cI7YemX6ioY4JcfIMGOrUZMoVXG9XPJceOZCW5jrb1pltisngItDuzFBrQBsWTp/baq/XZj8PWxksDWLxZc0bwRhqhC0q1RHdBFn7AQW5NqmHujRhHQGy/iZR7ZhKtysJCSG1BrEOhfLb9NwZFBg0aMuaiByC9jXXrwJ8WUfXyqtx1U8EViHU5sZb9wjIkY5ZUwgs3GzXHq6+A6nQPyVWIaXpB+tdEL/uKm90wKYswshkenpMe6wJrCEPG8QBLkCGIwvSELo89kCr4ZPZpHJ0P3B5GlwHP/JIfWic5vo3fhc1z7nfOzShGs6IeQw8m3R3uxacKXI9O/nF25ZDHHCu6D9w9A/pcWMn+F31DILayozooDFHs6Ik2Ehge6mfRKYegVvl1MftFsc99ht3MfIYXI3LPDHXo/nkczU/RRGjcWS8JhXvbTb2zB+/aARzw+1CimNiPgTpuFLuowDXHvASb8SCbNbbqdW+nVMs7mKxwGxjOaFTH1WjLWdMohR05RILfiaI5jVBZV4xVErMh/5TeY05cJ+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(956004)(6486002)(186003)(86362001)(26005)(6496006)(66946007)(82960400001)(33716001)(83380400001)(4326008)(2906002)(38100700002)(85182001)(9686003)(66556008)(66476007)(8676002)(54906003)(5660300002)(7406005)(8936002)(316002)(6666004)(6916009)(7416002)(508600001)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MS9HbXJvdHBRb0huSm43aDRPdmZtNEQ1eUxXOUhXQ1MvcFFaNnpROHV6d1RE?=
 =?utf-8?B?bUdWTWFiQnp6cHBRd3l3N1BveU8yNHV6dFFCSzlpTFc4YzdGa3owVGppY3li?=
 =?utf-8?B?cFNKRWJ1UUZHZmEzYWpkT1JBU1VPY0hSU3hjdHVxdCtEbWhRd2xVWENra2Vi?=
 =?utf-8?B?dGUzUHBmZmthTDVvSlRHbmpqT3labFBFeUhrTXFMUW9aNW16QlZNT1EvNU5O?=
 =?utf-8?B?RVVnNXNtZEJ6Y2lHWU8ybngwMHZ3VHgrelRPVHZZS29oWW13QU1Td2tlc2dX?=
 =?utf-8?B?QlFReTBKSEZHSWFXY3BESjdCTjAvSlFsZFBWNjZlaW8wUDlJZjc3MFpldjYv?=
 =?utf-8?B?bDJVUzgvQlNReGd4Y3o0S0kwSjVIV1NtSkJQRVcxUEozZkZ6MFlOTEFkK0ZK?=
 =?utf-8?B?NllrMWx1d3QybjBZVXJMeENsdkpndDUyc3BOaElPVjZwT2UvQ1czYnN0UHVl?=
 =?utf-8?B?VzZmTHFQVHBlKy9QMWczSGxYdTZJeU84d0txL1d0VkFsVTdqa3ZKcXJnU3JH?=
 =?utf-8?B?TW9rcjRQZXd2Ym9KRnN0MHhSYjV6b2VWcUNvOEEzZDNZakVrQS9hcUMwdkRY?=
 =?utf-8?B?QmdlM2l6R1V3MnBiUm9QQlBKcUZRRkZrTExoTHloU0xPaVR4NVFuWGRDTkJG?=
 =?utf-8?B?Q3Zub3lNaTJiNDV3RGMvQ1pxekR5TDJSK2JWcmYwdkRGNkZub2lHZWtNL2U0?=
 =?utf-8?B?aUVZYktJeWt5S3phU1ExaEZYNDVxS2lZQlc5T2greEZ3Skh4enFKQnY4NDEx?=
 =?utf-8?B?WjlSaXVxTWd1WkFMYnZnY1hETHFwZGU0UUxXZkpJS0pmanNHV0FiLzg1Y3pR?=
 =?utf-8?B?SnRqUElRY2JiWlEvTVBxbUkvN20rZEYydXJ0MTRNTFZuSEljcFd2Z0tudXM2?=
 =?utf-8?B?aVNpRU9vQm1TZUwvQ0dSU05saVZ3cklOcmlFdTBvVzFnTTJjeFRqVU9CZ2NT?=
 =?utf-8?B?RkZHU2FVTEpYNEJRRmdKbkU3NGVrbWhlbnAyQUFOVjlwR3JpWjlBb1pzbkVx?=
 =?utf-8?B?ZFdpRWNLZTRnMjZCd3UwZWVBNDJyaHI4dXBhTXdxRTJIUlBUbGxnT0RHbGIw?=
 =?utf-8?B?WDgzTXhhcGNybjhhc1BJRzZES3dETlRYWHZ6SS9PME5GU1BiaXFINkFsbHRy?=
 =?utf-8?B?NFcvUW9KS1hVaUNESGpiRFNVVkdSUUtubVdIbi9BK1hlNEhkaXp6UjZEODFX?=
 =?utf-8?B?WXNSTEtQbFZEa1ZOdVBaOXQ3cUg2UVZqM3FqUnVvdk5OQlhuWVBudjlpdUox?=
 =?utf-8?B?UW4ycUl6VW5ISEtMYmljclNDVXUrRzRMOUMwcUQ5U1JGdndWYnJsU0pOUmFv?=
 =?utf-8?B?SzE4dzlpMjZXbzErcXFOamIrS1VQMEY5YWYwMEpsT3d3R1ZUWXJ3OWZ0Vzg5?=
 =?utf-8?B?SUlBR1N6Vnc4TDE4ZzZwdUtXOEE3ZDZacDgxU0ZONWJPdkJXVHVYckNaSXpI?=
 =?utf-8?B?T1JqbzZWZXppQXFHWUNEei8yMXhaNUE2ZTU4T3lBMkxzbFFDUzVGMDRySkVw?=
 =?utf-8?B?aHNXQlJGOEgxb3lXQkZnRnBLeVN3WnlCRS9aMkhhR2Y5eEUya3FKMmg3amlH?=
 =?utf-8?B?UEsvbDRJR1U0L1dOM2l2RVhsdzluaW5FNkhBKzQyMU5qTDFkdWtPSWZtYUhn?=
 =?utf-8?B?c3ZNYzNPMkswajhIWmx4ME9OQlo0NFZXU2oyRWlMbFg0QjlRcDJDaDIwLzdo?=
 =?utf-8?B?YzYwdEg2ckM2czNxVlQ1eUwrMUM4djRxeDMzMGZZR3RHMXIzRjFvWml6VmRH?=
 =?utf-8?B?TEkzelBIUmV0WHdRYzdoSFpwOVprSlZxRWxacWhRTkhlVGVuWkdRYjI3K3ZR?=
 =?utf-8?B?a3hqWnF1QnBud3dvemlKTXN3RzFHcmZtaVNrcitrUEw1WmNuMktlbEhJVC9O?=
 =?utf-8?B?TVIySU9RZEZVSHlyb1NCMkFncEhpNmtoZTZUOVI1WTZZaVZFVEdScWx0S2to?=
 =?utf-8?B?L0xmcDBHb0IzalE1WXpNZ0ZqZ2lOQUh5cDhJNFI1T0NZbzNxOWpWZm50SGNm?=
 =?utf-8?B?UjFsYUwzRDBDWEVncGRlVDdlTGc1RGE5bWg5VEdmQmZKcHlmMzZlbXFIVUY4?=
 =?utf-8?B?WXc4bm84QUd0UXcwNkdFUTcrTllLdmNjR0Qxa3FhVWcxZkNnK2wxdFZ6VjBT?=
 =?utf-8?B?MnBXd2dvZm1HMm1qSVpmVmt1QThqckRqUDdqRXVXcXowYjh4OE5hVFR3Q3ZH?=
 =?utf-8?Q?Rs8VwHI9xa2f9swT9kWrAWw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b388fe-c6f4-483d-93e2-08d9aab9df8c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 17:35:54.8039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r58DIJ3CrEM3gfxgYH1J1maKFb+lHNxSpCwP5xxXN9DRFegjTKp0cZMOBXaFYUGT9p7eNLJZMj1CyJsPpZhC8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2921
X-OriginatorOrg: citrix.com

On Thu, Nov 18, 2021 at 09:23:40AM -0800, Stefano Stabellini wrote:
> On Wed, 17 Nov 2021, Roger Pau Monne wrote:
> > Document some of the relevant changes during the 4.16 release cycle,
> > likely more entries are missing.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  CHANGELOG.md | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index ad1a8c2bc2..8b0bdd9cf0 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >   - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
> >     no longer be built per default. In order to be able to use those, configure needs to
> >     be called with "--enable-qemu-traditional" as parameter.
> > + - Fixes for credit2 scheduler stability in corner case conditions.
> > + - Ongoing improvements in the hypervisor build system.
> > + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
> > + - 32bit PV guests only supported in shim mode.
> > + - Improved PVH dom0 debug key handling.
> > + - Fix booting on some Intel systems without a PIT (i8254).
> > +
> > +### Added
> > + - 32bit Arm builds to the automated tests.
> 
> I think you can expand this:
> 
> - greatly improved gitlab-ci based automated tests:
>     - 32-bit Arm builds
>     - x86 full system tests
> 
> Or with single lines only:
> 
> - 32bit Arm builds to the gitlab-ci automated tests
> - x86 full system tests to the gitlab-ci automated tests

Added, thanks.

Roger.

