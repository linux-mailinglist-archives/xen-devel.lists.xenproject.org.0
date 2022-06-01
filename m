Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA553A016
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 11:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340354.565373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKLa-0001Pc-V4; Wed, 01 Jun 2022 09:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340354.565373; Wed, 01 Jun 2022 09:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKLa-0001NU-Rk; Wed, 01 Jun 2022 09:08:58 +0000
Received: by outflank-mailman (input) for mailman id 340354;
 Wed, 01 Jun 2022 09:08:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s3TG=WI=citrix.com=prvs=1441e74d4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nwKLY-0001NO-Q8
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 09:08:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75dc1f85-e18a-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 11:08:55 +0200 (CEST)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2022 05:08:43 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BLAPR03MB5393.namprd03.prod.outlook.com (2603:10b6:208:291::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 09:08:40 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 09:08:39 +0000
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
X-Inumbo-ID: 75dc1f85-e18a-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654074535;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=uVVpD0CGJvdVcdmN0zON1HWOHM9Bk3LNLwZlVkxRRlU=;
  b=eN15FkejMe6l7x5Y3z3YMQz8b+aD55Oj07vFR+bHOn1+L6DZ2fk5YT4T
   tRzgW1Yx7vSo7tM56mojX3S3tZPUMt93odQkSMqZwk9k/8Ab2F0Ru+Wzm
   ldJF6nr43D97X8/pLV7b925QxGORl1br7j6yL3ewFDNs8t7/sDndzhQOJ
   E=;
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 75136455
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SkDDsazU+FJ6VMU1r5x6t+dNxyrEfRIJ4+MujC+fZmUNrF6WrkUFm
 DMXWDuOMqmNNjCmc413a9u2pEIO6pKEyN5qQFZlpSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY22YHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplubuzVzYjJ4b1tadBWTtkFC9aDZZM9+qSSZS/mZT7I0zuVVLJmq0rIGRoeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeE+OTvYEwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgLmQD9g7I+MLb5UD89glq1pfVG+aLe8WVZZtvvH6Tm
 lL/qjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsH0QhmQsHOC+BkGVLJ4DOkS+AyLjK3O7G6k6nMsSzdAbJkqsZEwTDlzj
 luRxYqxW3poraGfTm+b+vGMtzSuNCMJLGgEIygZUQ8C5Nqlq4Y25v7Scute/GeOpoWdMVnNL
 /qi9UDSW517YRY36piG
IronPort-HdrOrdr: A9a23:/O5A1a1NF061F+qO2y9BRwqjBSByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMEg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iosKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCulqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv60vouqhNDqWs3N
 60Q5iApIs+MPP+UpgNdNvpYfHHfVAlEii8Rl57HzzcZdI6EkOIjaLLy5MIw8zvUKA07fIJ6e
 b8uRVjxCQPR34=
X-IronPort-AV: E=Sophos;i="5.91,266,1647316800"; 
   d="scan'208";a="75136455"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLUYb6r/+sBXxSBiy0NeiQyRC8VVGYPSREdVY4+l0FdULuPNJSVCeshRwWyVkIqeDn2ycgl8iNaOo99a7i4KrZhJcV/nPLmlSKep486UClA0aDmYQTaEozuZwlpECdR8ZnURxfc65MrdxpFvMLCtxKrhBRM3+SkyAj4a47/ED+LGcAmyNQVHL35IETNeaEo6T7W6E/yrvhMkpFwphtm4GTVxSg0XabXvBXiu1Cmm7xgYKvhTX+JEzS/ie8WyerX5Hjhl1vETjdtWAkgfgd+xxnaOmdHJVmS/L2UN9QknaBB7fuuglYsHV+UOEOtysKWmmdB5+9epMUl7eDm5jc9pxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmJL8rCX2dWF7cn9lm8Lab5GIBv+/1c3huTGt1gpfug=;
 b=Px2itKSYw9PybJ9/bPpKCrGbwrtD3RenVtM+e7Cyy7wQvn/6gqP2y792ocgR/4yY2jN7kwFfpkUc2qHu8DqxdFcRIDtpT3siPuxWyYMr4gBRRZFv57ESKlLq+q51K08p6f78SkZKuAN6kuwjnw+9NOtFPNGs6ndRmJFagcPFjLAciR4fvGT0sKBFrqTVApBqiwQiyAqfmp8Iq3QpUDygY51OufpBxBYv6tlFMM8dVG1LsVBAfTJ1Kurhi0CzyRT4QFKmv+Cw+hwSLVsB1PiNOxRSwzYdxK7+Olvoc31JQ0f6kx49vpilfFh+PQ4CL0zsWpdtPCrxxCqv0YYzOPCoYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmJL8rCX2dWF7cn9lm8Lab5GIBv+/1c3huTGt1gpfug=;
 b=p1fu3z4lVKx66qdrxXmevJEYp8MF+9Xyof5MfomVBfI8Hd/NdkJoHvGem1+BApAmD/PN/fywtgWy5W64nqrxlXBkQ78h70nxo34ziPCkCSsMqYeAjzGng3GS7G83no4Icv9Hy9iH/8CVuSOTU+KegojPjir9PZwvhQAM42KCcU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 1 Jun 2022 11:08:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 02/15] IOMMU/x86: perform PV Dom0 mappings in batches
Message-ID: <Ypcsk/5eaUHkFJL2@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <67fd1ed1-4a62-c014-51c0-f547e33fb427@suse.com>
 <YpY71HuPOP59Do+Y@Air-de-Roger>
 <0146fc48-096a-1c5e-406f-bd7b471fc1fa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0146fc48-096a-1c5e-406f-bd7b471fc1fa@suse.com>
X-ClientProxiedBy: LO4P123CA0040.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60009361-ee42-4c1d-89d0-08da43ae5184
X-MS-TrafficTypeDiagnostic: BLAPR03MB5393:EE_
X-Microsoft-Antispam-PRVS:
	<BLAPR03MB5393E4DEDF231F0D91AB33F28FDF9@BLAPR03MB5393.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tR5Bp1rT8wUNpE+0zF9Z4+eS6N/0H65qaKB/ROEC4yMIcjN4gFP2QpSmY6uvyHwJGnm3hs9vv7yxmMDTLZYhN0U/mqnlOCx0uXWEGhwN5vQqipavRCUG0chh9Z6m6P+45KtMQ2pyeezsieuj5veMOBKVck4sjC2Fq3QiTpycxUSJ/7KDc4VpU7EuF99nusRkGk0r/xJXFN2UWZgudeo71rMRMBFbqJHAUVU1dCBd/fcMdWbs74s6RKwgzhvTtnnlv6dRuegrJlirvudGT2u+qVB2x+5bFMtue4zp+xdYoOB0MZZlRjteN+nuKVGoal59GZeI6mRD90dhnHayQYoUy6+ocxP3tDUq5mGEfoxvpjmpYEV7g3vIrB1Um5On6Rj301wjqcw0NufO7rZomEuIX0i45rRupr0HaBGieXL2Fi5Lt9GgHdap4jpAQaWwQAIqbGhjnEaq25qOe0IQyPdSkMw4Lxeq8APTcH/pUEQghbvFwwPv7QggjJGc3+xv8R6ctreQmijwHeChVEopQi14z0D9I3CwKB3S8XC1TYPyb6laHoWhiYfCBOpzCaE562Grc4Hu1eR+LvF7AcE3u3Ta6UaI4m4OtNmtW/xdu7kpdB6RqQi9bZNBFxNayBIVNos9z2Hm5QOqJHQ7jeiyp3LG9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(26005)(86362001)(53546011)(6512007)(6506007)(9686003)(83380400001)(85182001)(33716001)(38100700002)(6666004)(2906002)(82960400001)(316002)(508600001)(5660300002)(6486002)(8936002)(66556008)(66946007)(66476007)(4326008)(8676002)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akhTd0hLS2NuRVE1UFByd2tHcTEwSkNXUlAra01iRjdrOW1UcXB6MnJuaHpo?=
 =?utf-8?B?NjQ0UVZCOXpnUXN5clNXNGxRMklsQlkrTEY1Y0ZqZHIxcHFIUDZaTHZ0OEVq?=
 =?utf-8?B?VnhwQVdUTER2cnJGYkF4elBXMG9hczJEOEFNRGlOTW14aEdZL3UwWVBiN1F3?=
 =?utf-8?B?MHlaVHFOZWVPejhpaHBYWnM4UldCU0JhSDJRMEpXQjF3bzJvTXlSaDhBS0pV?=
 =?utf-8?B?YU91WkJ4Uk1xb1JlamdKSXBWT1ZIeHIxRURYb0hSVUVoQVFPOXhIMUpVY3VS?=
 =?utf-8?B?eGdNdk1mcnpFODVRK1BRTEJYVHVsWERRTWYwcUZzbmtNcWZLR1FxaTFjTEpP?=
 =?utf-8?B?QTJuTllPcXdqN3JCUnlBSlhTY0lESjN0NVBkVVp2aWcyNDg3N3k3MVZsYlNN?=
 =?utf-8?B?MzZYS1U5ZzJ1R09BUEthWUlYc3E5ZU9UZTRhS2JWQmRTa01TWkthYkc5WUZp?=
 =?utf-8?B?UVBHVGtNcEZPWmxyOHhCR2xaQ0xuSFpCMGFSeENnNHB4QTJ0Y2RjaU9Gbndj?=
 =?utf-8?B?TU1vTzlIU05kbTJ3RStMUVBnbElNUjZFT1daK3ovRHMyRlhwZ1lGb3FWTzk2?=
 =?utf-8?B?WjNHTHVhdUZBUkwzTzhBT054eURQcFljb3lkUFlaZmROUVJ4a3JYZU1ML2wx?=
 =?utf-8?B?UHRoY1E0T2FUTitubkdhUzk5QUJLRDRjcmhzV2xoSWRxTXBvVDJZNzVXNnRa?=
 =?utf-8?B?eTcrb1ZjMDdNcE1seTZIYytMamhPdmgrZ2xKQXJCYUNSeTI2UEQxSStuK3dG?=
 =?utf-8?B?V0JSQ1FZMjVmUCtWWHlMazJBcEJ0SHgxalpkZW5yZ0s4dVh3K2pDbWNmemlB?=
 =?utf-8?B?eGFwKzZBSWl0K0JsR1hkaERmcFZDMTJkT2VST2pKYVdSbzVVa295U2VuZGdL?=
 =?utf-8?B?Y2VNYWczSHZ1STNCOUV2Wlo0VVZuNDM5R1ZUM2lQVmRsY3huZWhDZGpZeSth?=
 =?utf-8?B?Z2NTZDVGVnFXZUZOREppTE5tV3JsUWJCM21sWE95RTFVbUdNL3RDVmZ4SkdZ?=
 =?utf-8?B?aVRjNEw2T09zOWxMRnBiNnZMRFZnSHF0a3lhZVg2VlRoY2xVMmdSNEcyTUFx?=
 =?utf-8?B?eis0SnNBYmUrVmZUSEtTTjd3UmR2N015S3ViVjdqWC9hZnBNeVRNRFBZSWRK?=
 =?utf-8?B?V25hNzV3TERWVXcxV3Nwc1NSeS9lZHhBZmdIOFplSkFVS1JzeUZvdkpxdUxz?=
 =?utf-8?B?OU9SeHVXS3lXV2dsVEVJUXhhaDcrbytKYTN6K1V0ZFo1WXNNdkpUb1ljSWZJ?=
 =?utf-8?B?MFhXcnBYV2pGUkFwRDdSNGJ5ZGZ5aEZFTTBCaHFKSlNQdHB3TlhZUXZXamVO?=
 =?utf-8?B?QzlUYVRDV3VaM0JtLzV6QVprY1RaUWVuZno0dSswTTJkVTVGODNvdWt3MWoy?=
 =?utf-8?B?OS84N1VzeitHTWpQbDl3d2VabEJwTmlXQzdmSlhpcEJqWUJ4RWpLTEVPUHZR?=
 =?utf-8?B?bnVwSGR0d1VjZGV1azhmOW5oTXVuQTlEeXVnbVEvb0JDcEJuUU9PSkt2c214?=
 =?utf-8?B?UjJyakd6YkZ0RVdudmtTRDg0L1BUVzJLWCt2Ly9RT2tuNzk1Q3BscGEwUG1k?=
 =?utf-8?B?dTQxMm9FdHdhWTRrVmJEYWxOYUNoUFQ4K3g0MktrdjByNlc4UWFIM2pOVlQw?=
 =?utf-8?B?Yi9na1ljV1JEcElFaE5qaHdvRUZQMXpZQWkwSEpjM1pkcmFXY1VMT1V5OEJt?=
 =?utf-8?B?NXVCMjBDNW5PeEtKbFpVejJaRWp0ZlR3SzlVV2taeFhLb09URHNBREZtYyt0?=
 =?utf-8?B?cEc5TlpadHVMeE5neU50RFlPRGNMdzJtOHRpUUdYSlNJYnRVWEV1dzVqRy9k?=
 =?utf-8?B?N0hEeDRSZ0NveUUzTmpYS3BGMFlWcFA1RW9kSyt2cXdzQlFJRHNPTTdaMHlX?=
 =?utf-8?B?K3FFZzNkTWtaOXpFTkEvSG1VK3A3c3drUWpWa0ZuWXNPYmZtdmRLRWM3U0xQ?=
 =?utf-8?B?VGxaSDlRbE42Vlc1aFJEZ3NjWjF4Tmk3N1B6NTAxbEp3Z242SEYyaGh4VmY2?=
 =?utf-8?B?V2h2ZlJHWHFjeWdXNU4vc0dIWXAwUnVpY25makxxaUI4M2pxZzVDSGpvMHJW?=
 =?utf-8?B?ZFl4QkpqM0lJUlBvaVUvK1d5L0ZUSmovZ0I3YVUwV29TRUdaLzdHVHJZSitL?=
 =?utf-8?B?RmVwczAxc1lYL2ZKanZtOXdESmlCSVFNcjRyeEZtNWxBclMrMzBTUmErMWl1?=
 =?utf-8?B?OWM2UzROT3l5UGgrMUllVjlKV0o1VWd1S1Z3bFdab0J5R0U4OHpvcjZIdUow?=
 =?utf-8?B?NWw1K1NrODErc1FRVHdTYXRQT20wejRzbkxlTjhRbU5US2t5eEtPVENJMWZ4?=
 =?utf-8?B?ZWtFVGxYaEZ5a3N2dytBSGNORW9xZnlnaXVMNjQvcUpxQlRUL3VGd2lGckV1?=
 =?utf-8?Q?zD3Pzu9Oni+u/xdY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60009361-ee42-4c1d-89d0-08da43ae5184
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 09:08:39.9075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pneE3oZy8RQxRz+4cCGgVPcjy764B0vjojU1hl0wh0+c0pOHLSejkT65EjiejMJ+JBCX+c/ShS3XCSiVXovFGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5393

On Wed, Jun 01, 2022 at 09:30:07AM +0200, Jan Beulich wrote:
> On 31.05.2022 18:01, Roger Pau Monné wrote:
> > On Fri, May 27, 2022 at 01:12:48PM +0200, Jan Beulich wrote:
> >> @@ -406,20 +406,41 @@ void __hwdom_init arch_iommu_hwdom_init(
> >>          if ( !perms )
> >>              rc = 0;
> >>          else if ( paging_mode_translate(d) )
> >> +        {
> >>              rc = p2m_add_identity_entry(d, pfn,
> >>                                          perms & IOMMUF_writable ? p2m_access_rw
> >>                                                                  : p2m_access_r,
> >>                                          0);
> >> +            if ( rc )
> >> +                printk(XENLOG_WARNING
> >> +                       "%pd: identity mapping of %lx failed: %d\n",
> >> +                       d, pfn, rc);
> >> +        }
> >> +        else if ( pfn != start + count || perms != start_perms )
> >> +        {
> >> +        commit:
> >> +            rc = iommu_map(d, _dfn(start), _mfn(start), count, start_perms,
> >> +                           &flush_flags);
> >> +            if ( rc )
> >> +                printk(XENLOG_WARNING
> >> +                       "%pd: IOMMU identity mapping of [%lx,%lx) failed: %d\n",
> >> +                       d, pfn, pfn + count, rc);
> >> +            SWAP(start, pfn);
> >> +            start_perms = perms;
> >> +            count = 1;
> >> +        }
> >>          else
> >> -            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
> >> -                           perms, &flush_flags);
> >> +        {
> >> +            ++count;
> >> +            rc = 0;
> >> +        }
> >>  
> >> -        if ( rc )
> >> -            printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",
> >> -                   d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, rc);
> >>  
> >> -        if (!(i & 0xfffff))
> >> +        if ( !(++i & 0xfffff) )
> >>              process_pending_softirqs();
> >> +
> >> +        if ( i == top && count )
> > 
> > Nit: do you really need to check for count != 0? AFAICT this is only
> > possible in the first iteration.
> 
> Yes, to avoid taking the PV path for PVH on the last iteration (count
> remains zero for PVH throughout the entire loop).

Oh, I see, that chunk is shared by both PV and PVH.

Thanks, Roger.

