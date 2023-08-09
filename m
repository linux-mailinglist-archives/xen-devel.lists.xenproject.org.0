Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B947776C66
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 00:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581440.910143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrv4-0003dF-OW; Wed, 09 Aug 2023 22:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581440.910143; Wed, 09 Aug 2023 22:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrv4-0003ar-Le; Wed, 09 Aug 2023 22:44:46 +0000
Received: by outflank-mailman (input) for mailman id 581440;
 Wed, 09 Aug 2023 22:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkWR=D2=citrix.com=prvs=578b5fa55=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTrv3-0003al-EX
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 22:44:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54b609e4-3706-11ee-b282-6b7b168915f2;
 Thu, 10 Aug 2023 00:44:43 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Aug 2023 18:44:37 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4969.namprd03.prod.outlook.com (2603:10b6:5:1e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Wed, 9 Aug
 2023 22:44:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 22:44:35 +0000
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
X-Inumbo-ID: 54b609e4-3706-11ee-b282-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691621083;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+Nmxt6PsPoTAOqwy1lXBdfIyqlB7qE0GdGZxS716VyY=;
  b=EXKyiJXtS4Pf76RSscfz9JeqKXs80sYe9XZYYL0H/LNw2Q1Ssx+RX+LH
   E/bkoAad102VUBMxYW2Tfhs2a2YAX49aseaYu/BcYT1RCoZqPH/p35uo8
   dzlHWhoA1aR97MzT7q6aI9OEU9TrJ+tXQU3/Zfsa97FLzrUEnKcZsbysO
   g=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 121706681
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:veJujaK03ZZQfKw1FE+RQJQlxSXFcZb7ZxGr2PjKsXjdYENS32MAn
 TFKCm3XOP6JY2D9Kot3YI2z9UMD7ZPdm4dqTwVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gRvPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c56Qnhj/
 v8CJwpWfwGNrcy154uaU+Vj05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMkGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHmiB9pMSu3hnhJsqHvNwV1MBTEWb0OQvfmginKhUooYI
 kNBr0LCqoB3riRHVOLVRAakqXSJuhodXdt4EOAg7gyJjK3O7G6xJmUCVC8HV9Ugu+c/Xzls3
 ViM9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiIo0ixfSSNd/Aeiwh9v8Fjzq6
 yCHqjAkgLcehtJN0L+0lXjFiT+xopnCTiYu+x7aGGmi62tRZpOhZoGuwUjW67BHNonxZnOMp
 mQeks6SqsUHF4iQlTelSf8IWrqu4p643Cb0hFduG9wt8mqr8nv6J4RIumgheAFuL9oOfiLvb
 AnLowRN6ZRPPXysK6hqf4a2DMdsxq/lfTj4as3pghN1SsAZXGe6EOtGPCZ8A0iFfJAQrJwC
IronPort-HdrOrdr: A9a23:tmTi2qDBEbEfC4HlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: =?us-ascii?q?9a23=3AHDWEkWsNvTdG5qAI98cVgqUA6IsoMWTwx3TKLHX?=
 =?us-ascii?q?jGHdnYpOWbmax4a9rxp8=3D?=
X-Talos-MUID: 9a23:B9kMbga6Eu57M+BTkWHrtW5vGMdS+4+yCFkNrYoP446NOnkl
X-IronPort-AV: E=Sophos;i="6.01,160,1684814400"; 
   d="scan'208";a="121706681"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LH4s8XOD35NmPxZA0nJuLzX+Ws8nYp/6a8lxw/pgbgOCGU7GWOQFRV2j/+F7VgCUmcNhqYlJZeimm6RZkwddGXMiHeSXdoAjWP5xl7VMNCKXFrQaaOLcjJVWuTBynpNPehlzl8M7lksmyBsf4w2n8Xh8d3gRXzIvLlM3XEIL4VUnEFdMlTpcDkrVvZUOU6v0umVVXyRBFEmBhUPpE4zEFCVgIa6GJSLHCHYNTAKXlb+yFnokDyAY/VUMzR8mPshNsei/knhRz9fmC9KAkxco+jneIHlrA7a8rGAy+hEO22S55GN1NNTq/QtRnNoNmwMyV6Zb3SG+sdPIltzLi5E6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Nmxt6PsPoTAOqwy1lXBdfIyqlB7qE0GdGZxS716VyY=;
 b=exCe9xbVa6btVEDsSoQeaa6ILUlHJGQezVlN4NnF3EzYVsf1cCPWQmVJ4vtQ9ubrzlml3nv5yTkbqeLGtgwswAeO+DEgn4BTaCXWlBk6ZPKKODSxmuU937Qq1/JdxhhZzAweDmmN56qBO7/3cA1/tApS/X/Xn7kU7DUIEIkUBx+PyFf/GGyQNqVKCQwk2XWVOc7mLbrH0F2+5l4ZXWt2FfnZe0Z4N5UmouYNUz7exL74GRielpkGHt1MZKyhNXpndzejirSogEATqT6ldXIWxMUpUygYE14ay5oO74bWXO5xgut2lgRPNReDDZFFbLrXNajXBs1DOeAw2CiMg/YJ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Nmxt6PsPoTAOqwy1lXBdfIyqlB7qE0GdGZxS716VyY=;
 b=K5p2RiiiUGR00nQFWwKdsfHqQuvYI0/TMlQ+r3mnwP9dK0lmnGKdxwd3oPyCtPDMGrEN7nGbDwk3Hbt+yqQYPRoU5bcCSB+z7onpvrApAs6OgpS0J3Zq8/fOLOgogKqhwX1Hbe6Itv2+Wfaqajfq4zcsukyfzpWAJO8ZGPBmsgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c84814f3-93bc-a4a1-e609-cb35092f00d1@citrix.com>
Date: Wed, 9 Aug 2023 23:44:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen 4.18 release: Reminder about last posting date
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <AS8PR08MB79911746BC3D82A6341EDA6F920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <ec8e75da-743b-50dc-4665-854c446c974e@citrix.com>
 <alpine.DEB.2.22.394.2308091437200.2127516@ubuntu-linux-20-04-desktop>
 <1ac14ed0-d489-0efe-0b0c-200792a50fde@citrix.com>
 <alpine.DEB.2.22.394.2308091526060.2127516@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2308091526060.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB4969:EE_
X-MS-Office365-Filtering-Correlation-Id: af59176e-0ab2-4835-028b-08db992a3418
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GXSIcQeoAJdXmzJEPzcKDQ0OPQGH03JHyfN6pI3mzZF0ergu3ZPCP5Hxx63UrqFA9tKZotHKF6c0aI03pq4o32c/TJUN+F8dDtAji+zyKKEXqEfb13BsMy2UkrKfdOKc26wEGz2kI1otTYPICsW1Js2pKTuq8ikdDRhppHhDiEggwwVyoEuQ1kEvhNTKM5Azkp5glp77X2j1Xbo+7Y44jlaWDk3YX6JPGIa767+rkOWUH/qIuN4Ls4RCj0xGjE1978Qx1BYmKgwyFypFgNIX2hlc+DYZ6TBSIBXwJJW9m0EMGm1WG6JSZqjf5JcVEKHl7R8OGwFZqqHjJENW/nRe7OHfs2jr7QWrIdgo9i6og/IEgxFT8olsiwe9GwBhLSs6O/ZIihH/+CQ4850QIRZXveBkhUIrcs3vzS9r+gYs+J/VQY6L/d7SZJHJE9eLLz9831c6brStEE5B0D8XydqZ7G4N2GMutiUyRNeCtfOWynmGmg+GHsVGTnBfnxiWeEjgv+ZPq/yH7pHZZzbinPjK3Zr5maqwjEcex8Pd5CUZX6mSkU4frO7glf5bKtVZVsLtWQI7DlKuUgOi/WOt6zqxGcPKuPVfG2C169Ixa7kupfJi8Sldy1WGdySSuWH/R7XrQOB0beTRpE7kkXEHKdJ9SQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(186006)(451199021)(1800799006)(83380400001)(6506007)(2616005)(53546011)(26005)(6916009)(2906002)(41300700001)(45080400002)(66556008)(66476007)(66946007)(316002)(54906003)(478600001)(4326008)(8936002)(8676002)(5660300002)(6486002)(6512007)(6666004)(966005)(38100700002)(82960400001)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnBqOGUyZVBjZElWQ25tWSsvK25hZHlHc2FzQWgvMkZTMUVaWGp3NVo3b0RC?=
 =?utf-8?B?b2RwN0dqNWM1UkhPRW8rdFE0S2ZHdFZuR08vTnVYNjdrUGs3blBGRmdlOVhV?=
 =?utf-8?B?VHhTZXZCZTZDaFJxUEd3SVB3blNBL0YrWUJ3L1g2MGcxNGpLVFh0ZlhzT0Fh?=
 =?utf-8?B?WnJXNGpzaXFBd1dYRUYxZ2hDK1dNV3hNMGF6NEc0YUlXQnpNRFpmRk1WQ1ZO?=
 =?utf-8?B?dXBLblBhSUl5T2lvdzhqL3U3ZkdRaWZrYmpCUDNwaEpsNVBDVHY4REhTVWM0?=
 =?utf-8?B?OHJINVZENXpVaDVyUVZvT3pTSXhJSUdLUWUrNitmcjlLSjdYRW44eGpSMG5M?=
 =?utf-8?B?M2YwYmlPempNVnMvRTdXT3RLczVVT2RtQThTM0h4ZWNsR2lldFV1UDRFOC9X?=
 =?utf-8?B?K1BobUptWWx0WkpyYmZnWHJZTkRpZENNSVI2MVB1WnJUSk9wMmFCVkZCNTJ4?=
 =?utf-8?B?bWlPTjZYdWlGVHZ0RTh3UWZhK0YxeVdDQUtkRjBvMDhVTUp5NmpqNXNGaStk?=
 =?utf-8?B?SHF3UDZUMWc0VWhvenZ4L1dzNjRxTUM1c2o3SUxZY2gvdkt5cG5WaklNWWU5?=
 =?utf-8?B?ZkpLRXg3YlZ1U2tXSnNOYkxQb25ZY0poTUE3a29pSndpSzd5dmtWcE1xbWRj?=
 =?utf-8?B?N0hOU3lmZ0ZjeVVKUzFFMmdkTzdvTzVudVhwbmE3SkNhZmg2dHhpczRvdmhO?=
 =?utf-8?B?SmI2VWIvSnNaVXVIYmpmZnNHMHRkN1o1SmtzSU1BazQxcy80Rm5Wc1piWG1s?=
 =?utf-8?B?eXQxQUlkdDRsVHVNMGk4cGl3c2s5S0NIZnFuT2FoS05NaXg4U21MWi90RzUx?=
 =?utf-8?B?S1RJUFdXVFFvSXlOOWtXUVUybDhXUXhnajdwYzZBZFZYQXQyWjJsaDZkK0hp?=
 =?utf-8?B?d1ErQk45eHVtQ1BLcmRkUGNBU2lUellsWGRwa1Z1RDlodEJvNXNlOGVjaGZW?=
 =?utf-8?B?YnJWTHk4S1lva2Q0OFBPTHVLS2YzcXlkT3VMcUNvK3J5M0Z2d2M3MW5KVmFn?=
 =?utf-8?B?Z25QVitRZHVHdi9yNEVwM1NzUXh2UFVLcW4rOVY3TFNMaUVNcmt0QVpjY3Ur?=
 =?utf-8?B?M0FlaXc0eWZvYW52d2hyOTU1TUJ6VXFyY29vbFZSUU1nd3JRekRtUGZzU1Fp?=
 =?utf-8?B?b3lrUyszQWZZVmJlRGVKTm9HaU5iSmpHK1dFUVYrVHZJL3dxa0dLVXlraWFT?=
 =?utf-8?B?WHBSZEVobXhSY2FMOStRNnZjVENaQ1dFQVhJRkpnbjJUV0ZicEp5b291UCty?=
 =?utf-8?B?MUlZUnVvaGdhaTN3WkU5dHBiem5QMU1IaXNvRG9hVm42ckliTW9DemtFdVM5?=
 =?utf-8?B?d2N2Rjc3R3B1dEcvTzZod2RPMDdWckJ4QXdadUJuL2JqRXpJdGltbTRDWjhX?=
 =?utf-8?B?RCtWUnBPODlINnJpdmtVazdaQWpFV09pUHhKa3ZmT1ljbFNaQjNOTHlHUGQ4?=
 =?utf-8?B?RnpDRGVOVTRLZFlFbThqN05WU0tKYXY5ODNGdVc5d0NaVm5DcHZhallyWU0z?=
 =?utf-8?B?dEM1eGZJcTJOYWJXbzlvV1dwbkVKQzRnMThsSVhxQWFBUE55RnZVZHdVWkRq?=
 =?utf-8?B?QlBwVDdJVmFhVnpmNy9wM2ZCdC90RGhXS014dkxWYWpvQmtPS1MrdzNIRjB4?=
 =?utf-8?B?cElMbmorTEJBdittSzl4dllQOXBlMW9QbnNQUW1lUHpJeTJOQ2RaSURkUGE5?=
 =?utf-8?B?bzNJTENiQ3JqU2JOSEJaaFNpOEhpSmpPeFd5QUFycDJuKzFsWVB5REYrV3ZF?=
 =?utf-8?B?M3NKOXlnN1lzTzdoTno5L2ZFQTJSeUhpL1RTSGVYRENVNHdWRlBGWHExZmlP?=
 =?utf-8?B?S2ZkbDZObmFudTk0RG1XT2U2SFI4SGlsNG5GZzhGWU93RmJsQ3RiVGRJb2tS?=
 =?utf-8?B?N3FTNTIzUzBBSGQzL1ZBMVlPQ3d2b1F5Rk16K1ZjNDN1OEY2Wkt3NTUzSTVs?=
 =?utf-8?B?RWpxQ3Juckhyc0ZiSGR2eDRxT3FlSmlQOXpQd0U1YnF4a0dEM3FSeTlKQUFO?=
 =?utf-8?B?bnpRZWk0ZTZEYXFnamg2dDFvT1FBcXBSYndiUHFyM3RBS3F4OWIvZkVtSFA3?=
 =?utf-8?B?WEVMZWtJN2hPbG9mQjRtc0pHbkhSa216RE13YmVZQ0tSL2dlZ21oNHg3L01o?=
 =?utf-8?B?eUVOTW9ic0UvajEvNFdiV3BkMWJFc0ladWl5c1JIQ2VwOEpGUzNjeERhV3Np?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mzv/9qxPHiNVMRoFSN/5qJWNwWhsDFOvjzQWVi/e2joMkrUExulAwflGpdkKHHUiJlkvo8xdhUGdUVFP/j3lBAJ4WnH3BqJGdUS0Wh0zFfSQcH3i1mtF697xRED9Ml0hvvmUe9Irn6dfSb2WD8uYNwoh+6rSAxnGwvDTtBy6ASsA71JXXszDT+tZLqLexrUesAMJX+10n7laWpcJY90frb4AFpDgY+K33gYc7kBp0zzEFDAhz8YoRfEmhl+/IrknFmjfcZUYVTi4a5rWQ697Dube/fbK8UtGkgvTRFxmUSudhZSwfkncF8vTiiZjryeaLscDOm/JatOod/6VKA2mD6JWfPkIaYHG4DW3krulNfHAajeRaNxFNni6sCiy7GiOG+zrgot4us501gIDc/ebU3vqPcso/odoj/2Glqv6a/TarcaMw2MD5aRdNrQJTuU/CDub/SGcLjfk16Od7/RXiyMVaH1DypEdRHdFNVZ7eyxp/hnMYhNzKOSGOSkjXDJhf5EHEpXlCathtd+I7wY39TDRWHOj/yUof2an5Y7LDbtlNQLo+Z+l04s9l2IwNhuDc29OSbn8yPP+17UpeMxXj1LmmWE4WiROgCGbufKX+NpgOplLEX0oLGjGl5k/fIEfzaJUUCmj1NfqGh8rVN/XQVWNbWIm31xb03F6gUrsKedtmV+u3gyxTILaLFgF4/4xy9qOz3SoTSKWETJLqfLY2PWSpBnYhEqEzATy3Tx7nC7bHoc3sVzCl4tDWJlCHTUr1pcltHtDEoFIhIkzs0ZeTNC7T7BuXKuxRbqr+IpPdaM0HABVKDQerJ7mEa0VJxKt0+j5QNaiZ1EOVjGIn2KGmv121oqJozLixx0WV+pFWVvTjJcVU/HMTrLBEbdGGHg8CJcBxW693JWORXJEWq/Tr2Sg1NG95m0wP53DdhtrN/8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af59176e-0ab2-4835-028b-08db992a3418
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 22:44:35.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HW/KzBCzOEfpM8V/3cuG9JNAOpaKvF2XS4QBT0yYMU64+ZieX2ck3/9WmEkRC+KZOTPF4JMQt0fgR90sjyDJVYHfebl4X//rLDwKJTy7//o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969

On 09/08/2023 11:34 pm, Stefano Stabellini wrote:
> On Wed, 9 Aug 2023, Andrew Cooper wrote:
>> On 09/08/2023 10:43 pm, Stefano Stabellini wrote:
>>> On Wed, 9 Aug 2023, Andrew Cooper wrote:
>>>> On 07/08/2023 2:24 am, Henry Wang wrote:
>>>>> Hi everyone,
>>>>>
>>>>> Following the release schedule discussion in in April, I am sending this email
>>>>> to remind that according to the release schedule [1], August 11 (this Friday)
>>>>> will be the last posting date, when patches adding new features are expected
>>>>> to be posted to the mailing list by this date.
>>>>>
>>>>> Also, note that we currently have 1 release blocker [2] which might need
>>>>> some attention.
>>>>>
>>>>> [1] https://lore.kernel.org/xen-devel/AS8PR08MB79919F9CE0B2BF80E7103FB592609@AS8PR08MB7991.eurprd08.prod.outlook.com/
>>>>> [2] https://gitlab.com/xen-project/xen/-/issues/114
>>>> Off the top of my head.
>>>>
>>>> There are still unaddressed Gitlab bugs from the Eclair integration
>>> The bug you managed to find it is now fixed (commit e55146071de9). I am
>>> all for fixing Gitlab bugs so let me know if you find anything else! I
>>> am not aware of any other issue with Eclair at the moment.
>> I meant the one where Eclair is still running on `smoke` and twiddling
>> its thumbs for 1h doing so each time OSSTest says yes to a push.  It
>> will be a missing 'exclude' somewhere, but I haven't hand enough time to
>> look.
> Ah, yes, got it. I would call it "Eclair lagging behind". I am happy for
> this to be a blocker.

Something else for the list is to see about trimming down the testing
we're doing.

I had to cancel 7 pipelines (mostly patchew) in order to get a gitlab
run on a late-breaking tweak on the security content yesterday.

Take
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/959800176
as an example.  Nearly 2h to run, and queued for 2h before that waiting
to start.  This is not a rare occurrence right now.

>>>> and other Gitlab bugs (use of unstable containers) which I'd unwilling
>>>> to let 4.18 be released with, given the pain we've had on the stable
>>>> trees trying to keep CI working.
>>> That is fair enough. To make this more concrete and easier to track, the
>>> following would need to be changed to using stable containers:
>>>
>>> - .qemu-arm64
>>> - .qemu-arm32
>>> (I am not counting .qemu-riscv64)
>>>
>>> Andrew, is that what you meant? Am I missing anything?
>> Every debian unstable container, and the other containers (OpenSUSE)
>> which are using an non-specific upstream version.  Upstreams which
>> really are rolling distros (Arch, Tumbleweed) need to be made non-fatal.
> I was more asking whether for 4.18 you want to fix only test.yaml or
> also build.yaml. (Typically it is test.yaml that causes most issues
> with rolling containers.)

Everything.  Because both bite equally hard in stable trees.

It's not hard to do - just needs some time.

~Andrew

