Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C815E498440
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 17:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259911.448688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1sv-0008Pe-FN; Mon, 24 Jan 2022 16:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259911.448688; Mon, 24 Jan 2022 16:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1sv-0008NA-CE; Mon, 24 Jan 2022 16:08:01 +0000
Received: by outflank-mailman (input) for mailman id 259911;
 Mon, 24 Jan 2022 16:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BDBv=SI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nC1su-0008N4-Fd
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 16:08:00 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cacf4835-7d2f-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 17:07:58 +0100 (CET)
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
X-Inumbo-ID: cacf4835-7d2f-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643040479;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rwA03VQyU1isUQuleHsrasI4qxOPrQ2Xrg02KGvaCcw=;
  b=RQiNPJ8aZx1lo64JifRCTqPPO4LlINEf7Ork1n+TnZnU+EcqscYSS/sY
   qDDhKAlQigjT+MWWnsA9YQ2t+8tjXuygVLpXYLXoHafDPl7eHZJ7BJuRm
   RPQSWuz1Jf2smEFTxpzrbh/syDIdcqRcJP2jxv/u05U+077SoYGEYgHZd
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qeS+KWBbNRmDCxIFr3+Ut1iZGcXAvJAYN8HS9zgUNMvMgRpWhmFsWib9ClRdNZWsYYR+fPATqV
 KUnmrxk5UgRy/VIpk3v+mJMIVqjE4ap1SlZ7j/+jb4rLdoy3tYVmRW36GHY7ZgQG+Nd3fTpECW
 ukiPevEZUx7nw1uJUrOKvQIxtV9YoM+HImWifll2DswUu8R51K1zcjQHeG5JkJfLskoYbGyUqT
 3iuNtvgirNeNZuMT+s7mILAtvUp0jmyr/KcSC/IH1UOWwxgSDc/cpH6xfuhceen8LKKNSChBvm
 0NMtBySVWsOXRJCwSuCcd0Rb
X-SBRS: 5.2
X-MesageID: 62558039
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8g91pKp1QyFu0EwhWiO9tuuTZD5eBmLKYhIvgKrLsJaIsI4StFCzt
 garIBmEO/2OZjOgfdF+YI21o0oBuMDdyN9qSgE6r3xhFiIQo5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYewFR0jb/HJpPQUUwhTHx9PGupX95aSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4UQKuOP
 5FIAdZpRAzsXxseAmczNJIjsbu5vH3dbTNzg03A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9QvkXKoCGbv+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0QNoMCedrtASx2qPU8g2VOFkjCS9OQYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4PeRECnCBtJ6sybp1qXHa5
 BA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL5LN4Lu2wvdRkwWirhRdMOS
 BSL0T69GbcJZCf6BUOJS9zZ5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWTqL89Aj+5D7n1ulAv7GMGgpzz6gOX2WZJgYepfWLd4RrpnvPrsTcS82
 4s3CvZmPD0GALShOXGGqNBKRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKm7ZEeAQnVOH1ldp31WpNz8SAyMSA2ZA760Hk/e4e/qqwYcsJvL7Ug8eViy99yT
 uUEJJrcUqgeFGyf9mRPd4T5oaxjaA+v2VCEMR26bWVtZJVnXQHIpIPpJ1O96CkUAyOrnsIiu
 Ln8hBjDSJ8OSl06XsbbYf6i1X2run0ZlL4gVkfEOIALKk7t7JJrO2r6ifpue5MALhDKxz270
 QeKAEhH+bmR8tFtqNSQ3PKKtYakFed6D3F2JWiD4ObkLzTe80qi3ZREDLSCcwfCWT6m466lf
 +hUka3xaaVVgFZQvoNgOL931qZitcD3rrpXwwk4TnXGa1OnVuFpLnWchJQds6RMwvlSuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4cBfg+St63LubSkEDbRCDhRtUIKZxLI54k
 /wqv9Qb6lDnhxcnWjpcYvu4K4hYwqQ8bpga
IronPort-HdrOrdr: A9a23:6yGFRaA8Q0MCklblHemo55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,311,1635220800"; 
   d="scan'208";a="62558039"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkGXndhdxoXOhD6TExGfyAdcpX16qzcT1QQv10wi9IszlAeoL39M81Xbt6NAPTBg+83BD6O1tcgWykMFE/n5j6cnu2U2IeKp0vw0NFEnfFt9KPzF6UdkjK4IWAiwVOKLEPipOL2IaNpvGGgnD5FRWNxY/oMlrmu5HTr6ryfskCHjHP6M6FFg3Qobaw8Qesjqng3E/opX3KgHEAHDjjTY6GpoYdr2OjaQrGAaerhUfpxLqxozkJ9ep1NdH9RpUbjzs4JXW0iz7LBEzLFACk4W/hHDLBIGdhXRXRCYWpCq4vFXoRemoJK3/jcDLxg8OnM3JyoQoJcXkfk0RrV6DN9jrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sm1Zim0MmcGem+5CiO9CFZr33Oed1wzOntU1JvvKoAA=;
 b=ledngFUgTosoAQHOxyBc+dc8DHkXJEeQhROzpFZb28GaZMqag1hx1h7XhYAMVxgW6IRAGmDO9zyUztNPrEWoFGbB46K4lWOFL/lstkssRIajHZedXV1mvr+FoQFhPk768Cd2tu6I6nQeczTjqleuXbpqUFq2rJvKgO6sKcGKQOKjlF2XaN6NvHZeaf0TuAFO2PUJnzyV4H/4LiONAFCrGOxMcUuluevjX6NUbm9BJdiFVZBvnzO1fBzdDqjzBEc3DfSjpdTX7yEB5yaXukVeol6nC0HHaZNqfNHpOdBd0OYkSK6yw9jA4joPB6QeeTKHwiBP9RCjCWHV2VHhDKGFIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sm1Zim0MmcGem+5CiO9CFZr33Oed1wzOntU1JvvKoAA=;
 b=w/LWLJkOUPjfg1BM0k6kgOXpPg1XrXJ+WiMC7oCV6Wd2hd+8LdNH8kOyaDcXHFgF0oHBhGq5L4jqp+ANLHk/8bnse6rezXAzqdi6Nk//kYSs756+C+pqLvINM9PyTlTcSASIHNS05clJZjq/KZdh6QxOrB81GyGbMnk0OXmggB4=
Date: Mon, 24 Jan 2022 17:07:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/pvh: fix population of the low 1MB for dom0
Message-ID: <Ye7O0/AWLRGpYmd5@Air-de-Roger>
References: <20220124152316.37049-1-roger.pau@citrix.com>
 <9f2407e9-90c1-2c52-202b-7d6b5bda3217@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f2407e9-90c1-2c52-202b-7d6b5bda3217@suse.com>
X-ClientProxiedBy: MR1P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcdb9560-0422-49b1-8ab8-08d9df53ac20
X-MS-TrafficTypeDiagnostic: DM6PR03MB4538:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4538E1875D8A4F16E2CD0C4F8F5E9@DM6PR03MB4538.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jGUnoQUDxjWfg7Eh26B4Br/1qBWq5rnCd0/EXaN6CpFVodnYZwFHWuCdX86mHl3Q/1i0TEphrmZnQettThoPTWQnMfLQNfD5QztuIauGMOfUDmywIXISfQ3GQamIG3cFjg+/xv1rLdLbri4MWVrOZzhsvPRsDbvU1CG3aH0NRZ+3ajvuL4A9gIQCm0ii+5YGYAFm3OVnvm8Qc105tfZXU6WSe72rVU6/NyRlQF8ii3D2H4hssgQEmFw4FDZZXL6EyG9hZZSlBKvnT4QYX8rzxU/10M8n8Rpvv4/phd6DReBMw0dnJv15MJn6TvXtjxFFlpkSACwBvg7sLyVY5kjEfyWTBxct+x4q7lPk/Y+T+t8uyLHFJ6jzSiUNs7aYqSG8DsIEY05eBf7heQ7CAV2vLaK3im3kbcld9wY9J4rbURsCOrw7JH52iv97tFXe9ZJ1BE6NDWmgt1Ou1x8zckz/OxDwimZ2tU0hMb1mdp5TDti5uTX61CagasqHS3BlS22F33zzZxtl3FzsH1vyVaD8njZaBfEvR0AaJH2dsXjI5ahsCnkGDiJLi/+wnxwaQi8/dGBvoUblciVeNMFfj+O3TPK4XUhJUj4rjFZQEWdM0i6B4qGUK44SP1eLVInkRnoKhP2ImR/OkYdXdHZjbqkdag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(26005)(9686003)(6506007)(38100700002)(6916009)(83380400001)(86362001)(4326008)(316002)(66946007)(6512007)(85182001)(8676002)(8936002)(54906003)(5660300002)(66476007)(6486002)(66556008)(53546011)(2906002)(6666004)(82960400001)(33716001)(508600001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm9RQVdzajZYUmFtTzdiRE11eHhrangrejFRWEFwSmszejRuTEMxbUxhYjMy?=
 =?utf-8?B?RTRwbjY3emwveStXUkZhVFpWaWx0ckRWS2FoSW1nTURJNjZmR29yM05VNlU2?=
 =?utf-8?B?SEZ3YWhKSmZSTUY3SjNNSGNOOXRLcUhOcFBSemhvcVA4Sk5wK3BEWXVDSmU5?=
 =?utf-8?B?ZUd5UFBvUmUzVGpHWm5pcE9lbnZZUzkwdkJDSlhHU1lpVVpvRXBxNVEwTi8v?=
 =?utf-8?B?Ykx5ZkFDK3ZRcHVvUmhyNFRhd1RnTjVpMzluZ1RKaGFRZkoyR3BKazg5Yitk?=
 =?utf-8?B?aFRidFNGbS9SU3o2SGQ1b2orbW9GM205WnVxTmxFU3lPK3BKYmdzRzhjVkR0?=
 =?utf-8?B?T3k4eGdlUGcyRkFsWTFWcVhGekpGUzVkdVJTQldHdDRXRUJEcWg2dUlRUTF4?=
 =?utf-8?B?bkI2cy9pUmFRQmY3bi9kWUxtQ1lHd3IyNlQvdjZhdkhmTWh4Ync5RDZtQ2Zr?=
 =?utf-8?B?QnE3NUc5V0kzUGhMYnRjb2RhOHBPNFlML01LY0V6cnN5cnhTNklZWGszSmh0?=
 =?utf-8?B?YkYzdGpsc0UxYjExcDJncXJnS3lSMi9NZEJRZmVlWi9aOHZNZXNaWmxjUFV1?=
 =?utf-8?B?WE1pdDZIZ0RqSVFlZlNmZjd2ODFMYXlVaHVycTNqOEVScW5Sb0l3eHpkS3BW?=
 =?utf-8?B?VHc2cCszVHpBSE9TS05FeEhpaGl6UFZMNFN6Q0RyQ3lGTzAxQitDL1VPQmE3?=
 =?utf-8?B?RTlGRWVaMVhHQ2t3elBGZnNvWVBwSXJmZnhmYWhmUnZZZVlJcUM0cDJKVGxT?=
 =?utf-8?B?YlVJNU5YWFdoeHJoRW92OEpEZHpTbkdsVlA5R3IvcVNYdkdtckdaaHIzcmZq?=
 =?utf-8?B?RTEwTXhDVDEwNUdaMWxoeVEzWkRkdWJmMHZYSUR3NEJ4OFJpZFVpK3pSWWV0?=
 =?utf-8?B?NjZsS2o2bnptbWxmdStEcGlwcEZiV0tSYWgyWmlqckVINWZtV25DYTl3cXo5?=
 =?utf-8?B?ZUQ1ME9MWENEaVBKVVhIWmlPbE9GNGh5cituSUV2eC9HWnB2NnhFZjJqOU1X?=
 =?utf-8?B?RUUrQldpajZkbUp0TEg3VDhqb3RxeTQvMUU5QTRwaklwV3MyMTVZS2JSZ1Np?=
 =?utf-8?B?WlA5bGxXaHR4TzhmUGs5bCtKbUZ0NENwRmtlQ1g5a012Vk84OGtKMGIrWllM?=
 =?utf-8?B?RjlPL3pTdVNWVG1JZDZnSVRpVElTcW9EWVhzdm1aTXlpRlk3aHRpYmt3SGxF?=
 =?utf-8?B?eFVMRmdEUXk3UnVybHNnOS9WVTNxZ0tXMFEvZVozLzE0ZGJDT0I1VkxpVWV4?=
 =?utf-8?B?SnllR0hUbVpKKzE1dDQ0TzdWTFh2OTJodTVScktPTERIMkRJSGd0cktVUW4r?=
 =?utf-8?B?bExJejlLeHVBd0E4NmtwSDY4RmZianVjYlBGeHRVQzkvSXlsREZYOFdHN2Ez?=
 =?utf-8?B?TVdQd294OXg2YnczY3lRQVpjbHJLVFQzQzZjM0xpcU15WlN5R0Z3LzF2WFdR?=
 =?utf-8?B?M1h1MytYTTRlVmtVejJTaGJtdWhoQVZWc3Q1QTYvM3hUNkFidEZreXhNTVpL?=
 =?utf-8?B?dnRUQ0ZtNmR0YVA4YXJDeUlUcDdEWXRDQXlmRi8zcGx6RDFJdGwxaCtaT0tJ?=
 =?utf-8?B?YzlQRjdKRndRODBpTjZDeStQcnhUVkpuMDN0M3k0eEdaRjZHaGFMSUh3UXMw?=
 =?utf-8?B?a3FrS1ZsQ1dVY25vc0dsV3dyQUtRNGY1REZhcW9JVm01WUUrK2VURHNTSWZO?=
 =?utf-8?B?eFlIakc4QkNMQlF3RkVueW9oOElPbTdKZjJtRXhaemRVWFNJaHdYZklsVVdM?=
 =?utf-8?B?WGJ0RE9RTDhWL3RFSTJtQlM1b0sxd0VCV0dJUW1yNWY0OGo1SllodFMycy8x?=
 =?utf-8?B?aDFNS0pmNU93enc5Z0RJQks0UmhKS1c3WjcyWFd4Z3ZORFhkUVFDbDVLTHdY?=
 =?utf-8?B?Q0lFRS9VQ0hUMURTd2xhV0x3Z2cvaURpTmpDdWJxVWQrYVl0R3pXWExEUVRE?=
 =?utf-8?B?bHhmOHB1TUx2SmhlM1Z1TWpkUGFISHFDbk9RcDZoU2c2K1RsZklFMEZHY3Zp?=
 =?utf-8?B?VmFjV1A0YmJRbGVGQ1llWHRLSkVOTFlncTNrUkpEcXMwZmxYRGpGaFlhWDRT?=
 =?utf-8?B?ajgwbWhMS1ZxWHVIRkpRVEU5QWhBTS9LR1ZRYTJHTDlsRmttTjkxckx3dWdP?=
 =?utf-8?B?UllCTGhocTdVaGRqVlZuR0tCTlJJVzJTZ1MwRlQ1TEVQaThOeTlCd3hzK0dt?=
 =?utf-8?Q?j8kOj3S8Pk83azyyplLvg9I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdb9560-0422-49b1-8ab8-08d9df53ac20
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 16:07:51.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GY/7jUqTZiiUwqHEX6InHt9mE4bL6jBOdZlIMYkMfA5W0S9zSCjHBNUBlz5SEEkRrUJ8J1tUMzCBPo1yp9I+OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4538
X-OriginatorOrg: citrix.com

On Mon, Jan 24, 2022 at 05:01:04PM +0100, Jan Beulich wrote:
> On 24.01.2022 16:23, Roger Pau Monne wrote:
> > RMRRs are setup ahead of populating the p2m and hence the ASSERT when
> > populating the low 1MB needs to be relaxed when it finds an existing
> > entry: it's either RAM or a RMRR resulting from the IOMMU setup.
> > 
> > Rework the logic a bit and introduce a local mfn variable in order to
> > assert that if the gfn is populated and not RAM it is an identity map.
> > 
> > Fixes: 6b4f6a31ac ('x86/PVH: de-duplicate mappings for first Mb of Dom0 memory')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit ...
> 
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -466,11 +466,17 @@ static int __init pvh_populate_p2m(struct domain *d)
> >      for ( i = rc = 0; i < MB1_PAGES; ++i )
> >      {
> >          p2m_type_t p2mt;
> > +        mfn_t mfn;
> >  
> > -        if ( mfn_eq(get_gfn_query(d, i, &p2mt), INVALID_MFN) )
> > +        mfn = get_gfn_query(d, i, &p2mt);
> 
> ... preferably with this becoming the initializer of the variable then
> and ...
> 
> > +        if ( mfn_eq(mfn, INVALID_MFN) )
> >              rc = set_mmio_p2m_entry(d, _gfn(i), _mfn(i), PAGE_ORDER_4K);
> > -        else
> > -            ASSERT(p2mt == p2m_ram_rw);
> > +        else if ( p2mt != p2m_ram_rw && !mfn_eq(mfn, _mfn(i)) )
> > +                /*
> > +                 * If the p2m entry is already set it must belong to a RMRR and
> > +                 * already be identity mapped, or be a RAM region.
> > +                 */
> > +                ASSERT_UNREACHABLE();
> 
> ... (not just preferably) indentation reduced by a level here. (I wonder
> why you didn't simply extend the existing ASSERT() - ASSERT_UNREACHABLE()
> is nice in certain cases, but the expression it logs is entirely unhelpful
> for disambiguating the reason without looking at the source.)

Indeed, that's better. Sorry about the indentation, not sure what my
editor has done here.

Thanks, Roger.

