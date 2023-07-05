Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96917482F0
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 13:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559101.873787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH0lW-00076Q-IV; Wed, 05 Jul 2023 11:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559101.873787; Wed, 05 Jul 2023 11:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH0lW-00073s-Fh; Wed, 05 Jul 2023 11:33:46 +0000
Received: by outflank-mailman (input) for mailman id 559101;
 Wed, 05 Jul 2023 11:33:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=asTv=CX=citrix.com=prvs=543a7ddba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qH0lU-00073m-TE
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 11:33:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca122e7a-1b27-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 13:33:42 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jul 2023 07:33:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by LV3PR03MB7477.namprd03.prod.outlook.com (2603:10b6:408:199::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 11:33:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 11:33:29 +0000
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
X-Inumbo-ID: ca122e7a-1b27-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688556822;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=j21lgw9NU0+Yn3gk7f3NFmLWy6YsieeH8EAnHE4vLYU=;
  b=GuUgMrgc1ltdFB4bXC+XsF95eAn67CZYXwNmWYsmx2FPbE2t//oA6UVb
   1XcEbESShGjQhp/iXRQvTKwLc3aFZvn8XURsAAq0YWI1cDEWCCnhrtQ31
   HSLv+jQXf/sZfScDxaXMp5twsVjpyYk1YYYXm/fnBRf/OKjsUS1yoQAlj
   c=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 115237688
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hes7kamIvMi7D4mrcLVqfrbo5gx5J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMXzvXP6uMMGr9et1xb9nioR4F6JeAmIJlGVQ/+yE1RiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5AKGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aUWGDxOUT6Evd63wLm2Ee9jiOMcFPC+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC1WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeDiraE00A37Kmo7FEU0eRjjr+mAtV+1C9BSN
 G054DI3lP1nnKCsZpynN/Gim1aLsxkGVNcWH/A87AiV4qHQ5BuVQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAZI2YNai4DSQot+MT4rcc4iRenZtRpHbOxj9b1MSrt2
 D3Mpy87750RkMoK2qOT7V3BxTW2qfDhVRUp7w/aWmak6AJRZ4O/YYGsr1/B4p5oM4KxXlSH+
 n8elKCjAPsmCJiMkGmHRroLFbTwv/KdamSE2RhoAoUr8Cmr9zi7Z4dM7TpiJUBvdMEZZTvuZ
 0yVsgRUjHNOAEaXgWZMS9rZI6wXIWLITLwJiti8ggJyX6VM
IronPort-HdrOrdr: A9a23:wk44b6CXgzkCl4flHemi55DYdb4zR+YMi2TDtnoBLiC9F/by/f
 xG88526faZslsssQgb6LK90cq7MBfhHOBOj7X5VI3KNDUO3lHIEGhM1+vfKlbbdBEWmNQttp
 uJmMVFebjNMWQ=
X-Talos-CUID: =?us-ascii?q?9a23=3AbfHC2WkbGhXZxmaJDV3yUtvfidLXOSTT/HuTHGG?=
 =?us-ascii?q?/M1poSLaYElmf9oRbq/M7zg=3D=3D?=
X-Talos-MUID: 9a23:EfXxUwnf/3U8r+Wc21FVdnp+bOVEoPygGHkygJ5WucSbFAFqIy6k2WE=
X-IronPort-AV: E=Sophos;i="6.01,182,1684814400"; 
   d="scan'208";a="115237688"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPKueWkKlYd73LcWADI/Ms5j/ppSQPXYxpa8kppRsgt1e7v8gCipdxcLupmFRhwWv0iaRfzdgGXvsYSK4uwnOvZtAww2S++D3YxvLWs4fMNlFnCPQI8bzYJQTnZDtnxUT+9oiSulPydNiVE2be71Ns78IdCv5HN3sJweKrETv3AG/PlD5wgq4RFwk5yw+T2vK9DujuMZJilSz5sQfIXygVsK7hOj0vn+yE7NMLPAFd3lhIxAQU95GUkwRCxDb2TiDSyTmFjiBBEZZXuJShgEf+bAmAVIRyVFb3I6yIMxVea4gmX8SO7uQIwWJ91UknthYqj8/UwSdtBa3bljIFPtRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q68qehWTC/YAaN/i7zcOXWAiNaBe8hg/BHivHXV3zhk=;
 b=n1nEX2nk5F5tJXb5uHTUgdbcV9LkC3lUbQxt8Pu4ohe31KQ0Js1/mHnkjTauCZU4IJso0q8C87ZknZKf+zwCU8ZJzwHpdi5u6QaJnDSIfyojObUtNvCdLWBiwzgAZ0p8bq5VvAwK69CUXZKOiTGlMOwIF+pufHz1OHA0cmAqMcc46amZXuB8DgQ7VyOYycQahjarkcxmAebhrCb/NHrrOZLeknn/X7hlpth6XX+nm9EzKwXofWrPtEagTha3rlNqLXJV6dHXA4rTU6D3UkuFWJageUg/EjmIkcmRH9njDh71nsdSlydB/r+IznB9ArF8qkqZinC4HlZuFWYgNZWUHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q68qehWTC/YAaN/i7zcOXWAiNaBe8hg/BHivHXV3zhk=;
 b=Z7xmjq79X/lyNKGMo1GHaiI8YrfcdW30kNCcva9CXi7nD38uMYRCplWfItR0GRVK3ueUIfk35MGI5FPmmpadg25zvgKtvtZk1jayZ+F+/JoK0FYp7EYn/ydH7lMRES3w2J34diZbTFZJY3aaTw5Vess4LmYcyXlkGvq4iuF82Xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <48a105af-2a8f-23cb-48ae-ead12ceadd68@citrix.com>
Date: Wed, 5 Jul 2023 12:33:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] credit: Limit load balancing to once per millisecond
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230630113756.672607-1-george.dunlap@cloud.com>
 <b046ddf8-d70b-e2db-f996-32e6a7164cd8@citrix.com>
 <CA+zSX=bqf4QspF=ZW+rWwkfNp3u4xYjzDipsJX9_j2CpdtdhLg@mail.gmail.com>
In-Reply-To: <CA+zSX=bqf4QspF=ZW+rWwkfNp3u4xYjzDipsJX9_j2CpdtdhLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0282.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|LV3PR03MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: e6858e94-64cf-4e2c-36a5-08db7d4ba7be
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hDhiaRbepGDbbYd8fjUt3sVC+OljFzVm4Z0sEt8Jw8Ru8ghmTjB0/w5Ko6IWY0T68WEScxfCRbHE9HfM9tN0lUTqxgVUwFo3n4+ueGjT1nUEi/mfeB0m+5WEP15nQ4enRdurOiS9ORYCzpeUKtBOgGkwD/w8SEjY3vGb5D2ZtjxUw0tFfjHF0gAupGwIkWackjzwnikyrzpDYBkM+JX61ZPyZWcEG3oYpo20YNd8DRACo0AiBArfqtdBzVkNaSVmrx+F1IyeHumlP22+wDzauRnvusmCNXXeaByQUeZYCtBrftqoSU07k3eXmlEe00XRFWnJ+nRsDf0L3y6hQbtl0KiXMEiQUSoxDk79sLtCHOcOHn0ikquYNVnB4UdqSAZ8FkRQktHWNz8/BBBX0hfpWHd2RKRb1v1j7LTGwvuZhRAkt64FVm+hLk1uoazMJlLZnY2n0B7Dk5/eRm9K8qEEzQ28s2IQRPi6M/Tr8VdgTbtXAzKS3o36z56XawOnB5mi9AHovjMTFQD+4tuBagAy2FOSfsnc/wNP9a3XlvLm95huwKq+LfZTQhUrcvoIMO40TWpJ296jJnGS3yDSPLKF2RhovMXoIonYDQ5QXi2cTGQqEfza5b57VKaBVvg6H+yTsnUJ6Yo54CCacPrd4tJTmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(36756003)(31686004)(4744005)(86362001)(31696002)(2906002)(5660300002)(6512007)(186003)(26005)(6506007)(53546011)(6666004)(54906003)(6486002)(82960400001)(66556008)(66476007)(6916009)(4326008)(38100700002)(316002)(2616005)(66946007)(478600001)(8936002)(8676002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDNwL1k2ZUR1ZTU2SUx4ODlYams3T0VBZDV6TXZqWEQwMFNnTUExYmlBK2NM?=
 =?utf-8?B?V1dGVEZVSzRyYVZkQjRuYWFselBzT1FrSFRjdlpib2JmQ2QwTzFjSTNIcElQ?=
 =?utf-8?B?dGp4QTNPUDU0R0x5YmNzWGVrTHBPS2ZkaVV5WnJOYnc3aS9LM1F0YnBZT1BF?=
 =?utf-8?B?aHpmYTR6aXJRUUtYMEpDbjZ3RGM3SEljalRqVzdTeVB1MGx5NVc4Nlhwa3Zy?=
 =?utf-8?B?Y0c3SG5BZVo4a3RHd0FaZlllOERrTkZuZk5TM05zOUlJckNjWk1rL3dxNFlJ?=
 =?utf-8?B?bHRONXhweERjVU5ZcWVBeGJIblFRR2VUOFYzL1lSSXM0SnRmOWcwVmd4OFhH?=
 =?utf-8?B?M2c2Y01rWE9nWHMwbXB0MmhPcGVWblpidUFySFlhVkhqa3VUS3NrVW83Y09V?=
 =?utf-8?B?STh4OGkyZkVDRnRaL05GUDRWRU53S2Nzb3pKOE5CNGMwTWhUYzc3M3pzTlBX?=
 =?utf-8?B?aWw1K0xvY0VLbEwwNW84UDJMRkpURXQ1VzhLOGR4d093cTVUTmlSRzdLSHJR?=
 =?utf-8?B?TnBsalZycjZzZWFFYnNwMFFoeGxndlFJVnlwRnJvU01KQ3VLTVkrTUE0RVgz?=
 =?utf-8?B?WE9CTHdQbzlVR0JjQ1VOT09aTDhuaTk2VEFkOVdjUTJxNUQrZExaVVYyc1dZ?=
 =?utf-8?B?RGhPT1RmTDVkN0xvZERRbFlTOUZwU0dockpsUE9nSGhFMEdDQTQ2c1huK2xH?=
 =?utf-8?B?ZzdVMENYcnRoU1RsU3I5UE9sRlJpdzIzQUIzK2pUV21pdG1oZ1BXaFl3SVFV?=
 =?utf-8?B?Y3dkQldOY1ByNjJ1bGpCczlWYmI5SlBvQlNsM2dzajRVOTFzVjFvOXowQW8y?=
 =?utf-8?B?TUFQRndkeURjUEdDMnMzWGt0a05OZG9yWjA3YWlybWZpaGc4UjZPeWdCZ3p2?=
 =?utf-8?B?cW5TMDBSWXR4SFpveVExOVVKRnkwTERxRU9xRHlMWFBHcEVIZ2pBZlhLakF0?=
 =?utf-8?B?SVRBTTYvOGpiVE9Dd3poam5CODNjTlJwY1daa3R1ZnlObm1LVTFoSHUyVTNw?=
 =?utf-8?B?bHI1Q0JJNTRVQTBUMGhGb2hSMkRwOFRFN3ZpSGZDTVkzTHF2UmNpUkIvL0M1?=
 =?utf-8?B?TUt0ZEc4UjBiL1hnanRETWJZM09rZUxnbStxQ3RyRi96Q20wMS9HTWtFN09K?=
 =?utf-8?B?ZU9NOW9MZmE4dHZvcDYwUnFOWU4ybVovWG5UVC9WSTdoU3FXcE00ZWxSbkJt?=
 =?utf-8?B?TVcrWWg3ak40ZWNHUFdWTWNsVEs1ano4QzhnekU2aEhBdDJSeVZDTjBhY0hm?=
 =?utf-8?B?Znp2M2Flak5zUkg0U2c4QnZtMDVRV3YzSXpCMWpZamM5ZXZsK28xcHNvSDBK?=
 =?utf-8?B?TnlMN1NiVUNLVHFQb3NvMDNrZTAxaC92ZXFiZmhkdVVtYWYrWFFFZmNMc3M1?=
 =?utf-8?B?d0Q1b213RFlQd3ArOTN4RGZTWXJPYVRvUENkd0N4MmlQRFF0eG5aUTQ5dGRV?=
 =?utf-8?B?cHorV2ZWQVlxY2R1K2JLSUo5dy9TY1BwSm9DY3RVdW11TFJ2blp1U0FibG90?=
 =?utf-8?B?K0hXOHd4QWo1bnB3ckNBMDZ5WFFBODU2NTlkMnRieXBYaDNoQVh3NE5aWE15?=
 =?utf-8?B?ZzVvOXBvdjJZYVhiTFV2ZmRlczBhd0g2UHlLS2pIQXBSMkZMVVVPZjl1NWtT?=
 =?utf-8?B?dnFWZGU1WmpIekNvZ3pDd04vcGlkZ1pMc2VoczgyQUJQK0tJN2E2TU44TU5R?=
 =?utf-8?B?ZlM1UGx2WmV4NVdXdDZhT3NmNmNHN1o5UDdMK1ZUaTFWTjl6RzFZbFM0OW9F?=
 =?utf-8?B?bVZSZlUySGx0Q2luYVJBUU5LM00rYzVPSlJtMzlUeEd2RHFvWDFGNEI3ZFN1?=
 =?utf-8?B?WGxyaWMvOEJnNTViZnNBNmY4azV5Z0NGOURpTkludFk4WThvYmZtdU5oUytw?=
 =?utf-8?B?UUJHUENDTnJrVkZNSVhQY2hEQ0pFZVcvanlxZTYxSzVlSmE4UHFUcXROZUxP?=
 =?utf-8?B?dGFzTVc2bysxQmFmTnU0SnZrU1NwQVlRMnlXL0dVdTNqQStKSk82aXpTR3dQ?=
 =?utf-8?B?NnB1YVZqemJOeUZzaEJSM1VyaGdEbk1USVZUaWpienQ4QVpBckZxM0UrT3RL?=
 =?utf-8?B?OXAySndPa09zeXhyVkJCWWpPRkREM1NXVnREemU2WkI0aUNKZEJMVVlWVlgy?=
 =?utf-8?B?KzFwTytPNS91eWIyWk5yVWNQc1NiZ0xVdUYva01WWEtaWGxvaEN5WHY2OGpz?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	acmDeSqGp5DmPFlTCi9nIOpd0WFu5HyDDjwIBOP0OAH+1I3O1KLoI39rfcvpNz5B5n8YG+d2wNC4/STYsNuBK+VFHZWv8VGscWsxtefD4/cRHYJnJUUXqRw9HMlsqxzETrf87GIkg2tW7SwYweljrrrQg9bTjutArfJkHM7apGre3yUDceUZVzQYT90GH1gqS6SDuC5yoBjSUcstHtQaKETNV6BIIMStk9B0X/B5+hMqawApWHLLjmTgHeIaVDXjTv/gTiVL4UZDVEf31XPx8WAT55RSF3hn7KLZiHjAHSGBYCVZ1G2pfuEAbmC7TBmSjNL26+OfYhSJusGe5YfQSivlfrpec3uvqrMbqBLtO6zGmzH6bsbW9F8GUs12IoTACmA6+myMwq7c+WW5EerYnHozFcoUOUZqjdoay/QOSrBwO/s1KjX/YAUSOl9paV77+sAFW2JX26CpJ82RZ6uWZX00VElbeaNcL1+oiNiDqwjyFZZEoU2mq97aXADBMUOwf/3cbRjDJQDbqG99n+VlafwYAYXr+nPeUz95/fnn3ZIZSf97yxVR6j740Wp3S1Aw9mczs1rqk8Cxnbf6EcEAqfVFJIxEU0CjKQLR7GtstjfWje8cGfLj82ubJ3/FyqMwBUCFGsmRZQY2awwYjttzcVesRj40fLyOSmojwcKmsQDp9UfpkOsCv2mDhpyLALWAp6G+gReaKcZ0kk4g1n+boj3yWGKEfTI11NKDcyt3fRGwQUSUWBy/bf22sU2urfUrwqxZp6S/dGdV5WqOmTnmSlbOjW6QwuAULL9Qb/iLuoYS6CztpUTvIkFjyXZlDrDJk0KaUrOIeUjtFMg6z27nRjJegQsXydobz4ZhFV/8gwZumrnLONBzug4td/vD8kLO
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6858e94-64cf-4e2c-36a5-08db7d4ba7be
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 11:33:29.5798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62HQQcguWur63+AUI0/VskxPd45fNjhHGB5+flxwzBxdy/htvkz9FLeChhaRtQZl4o5mv/LGkC9Gn9a0uAjbT/3Jo1REohf5O23pX6tsYZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7477

On 05/07/2023 10:25 am, George Dunlap wrote:
> On Tue, Jul 4, 2023 at 6:34 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 30/06/2023 12:37 pm, George Dunlap wrote:
>>>
>>>  docs/misc/xen-command-line.pandoc |  6 +++++
>>>  xen/common/sched/credit.c         | 40 ++++++++++++++++++++++++++-----
>>>  xen/include/public/sysctl.h       |  6 +++++
> 
>> Given this filelist, why the sysctl change?
> 
>> There's no logic to drive this parameter in the xc/libxl param get/set.
>> 
>> The only two in-tree users I can see are xenpm, along with an
>> unconditional print to stderr saying it's deprecated and to use xl,
>> and xl.
> 
> 
> Yes.  I think unless someone objects then, I'll drop the sysctl
> interface from this patch, and add it in a follow-up patch (perhaps at a
> later date, depending on how much time I have this week).

Yeah, that sounds fine.

~Andrew

