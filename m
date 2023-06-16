Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25EA7331E8
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550172.859127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Eb-0003Co-95; Fri, 16 Jun 2023 13:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550172.859127; Fri, 16 Jun 2023 13:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Eb-0003BA-3z; Fri, 16 Jun 2023 13:11:25 +0000
Received: by outflank-mailman (input) for mailman id 550172;
 Fri, 16 Jun 2023 13:11:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9EZ-0002qy-GL
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:11:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4978018b-0c47-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 15:11:21 +0200 (CEST)
Received: from mail-sn1nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:11:20 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6547.namprd03.prod.outlook.com (2603:10b6:806:1c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:11:18 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:11:18 +0000
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
X-Inumbo-ID: 4978018b-0c47-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=caRvDxyjTRnpGoU3owd5Gsf9GzyF5C4JPa0GfIQXU2U=;
  b=LzcWEAptuvwyaLDbpR/Alxrl7K1lLk1BBl+uOn+jLRHPlJijktWNrFcl
   k6+NqHdB1/Vojuum3etCh1piKjhCGDihc8rUqwUNNGO1pzxyBCnlKZe2U
   01EWVkJIvzymW68MOJSYWUT9k0YPBvcv4zXee9OHoHi/Fc0+M8IyfsTAz
   c=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 113085905
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JL4B26LqReWdEkMtFE+R9pQlxSXFcZb7ZxGr2PjKsXjdYENSgTUOz
 DROCmyGaf3cZzfxe9h1PNi08B8CuZGDy4RqT1dlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4AVgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5zG05g/
 /8/NgozQTOJ1umq57+WS+lj05FLwMnDZOvzu1lG5BSBV7MdZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTSPpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv33r+SzHumMG4UPJOYqLlAmV+4/zMsFCIEanabpd/j1VHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+pQSiaPCEUKSoZY3YCRA5dud37+tlv0lTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:tluO1K5hSY1mSQekNAPXwVyBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhIE3Jmbi7WJVoMkmsjqKdgLNhdItKMzOW3FdAQLsN0WKm+UyYJ8SczJ8U6U
 4DSdkYNDSYNzET4anHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCazqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOtXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6Q64aT1eUbpDLS8KoMOCW+sLlVFtwqsHfpWG1VYczMgNnympDt1L9lqq
 iPn/5qBbUI15qYRBDJnfKq4Xiq7N9m0Q6f9XaIxXTkusD3XzQ8Fo5Igp9YaALQ7w46sMh7y7
 8j5RPsi3N7N2KzoM3G3am8azh60k6v5XYym+8aiHJSFYMYdb9KtIQauEdYCo0JEi724J0uVL
 AGNrCr2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgMYfgnAD/pQgTIQs3Z
 WyDo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdHmfJFz2fZt3SE4la6SHkIndyNvaCaDglqFC56
 gpeGkoy1IPRw==
X-Talos-CUID: 9a23:cQy8/G/Qls05LFq5uCaVv0oONe4vcVrD9kn/AEXpAnpORZCUSVDFrQ==
X-Talos-MUID: 9a23:c4qGqAtuDdIp1/3nI82nqhE8c+1x4Y+XV38Rroc5lumAE3YvJGLI
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="113085905"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfS50OwOsfVN15ndc3wfgpZgNxrhlVyYuApV0nwO/aSl664mkKfH5Tm9+HQAFTGXsZKcye5Mn+MiNgxvrXHJadOrVsPPb039sgZ/RI7H3Ayc0+I+fdmSQfXL66IeKhEgvv/RIY6uezTfiBT09v3XESsV0L7sfeccdsc4Jl/AvDfJ+RCOFGFSFEWxbl8thNPkactf9yGYgPZPFVOqNOc3JmRYcU6EcyBt/lpLXesFqz6jO4QExpxt6VjA3DnquXlO1SbpxxPd/BgQUatLx2+0sPd07xxjFcTZ/xi1BhMCMJsmnNMsof3DGx3BxmVkKiKe32xqh4lM2BNaq90ZOyt92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ac5AClrtpFCusFXUZIqoP1b/u9m1+EtbcnCrqOyjr0M=;
 b=AKzvTEZbgV28A/m647AxVkD6+PZQXdmvCTN/pTHhJpkFtr+jYfv60a06lCq6aLOVSgriQaynpLcZVOEPj5nJOQFENooLi+eEO9KccBK080bLQ2PZfBb0kYj88mvArx7TYl3mMAHHqo0CjuPB/RvjsZr2IYJarlLEReqPBhDdhzfvr77DR8rU0OeKF4jZnuvXVod6Ptk/02JYICW/1l2eLcrzL8LOs2DdCfqJydaHE1p5pNw0Pk6QA93IvgxCZUlryxUlaJwljByPr6T6MbabbgRvM1dNSnJdrq4Q7tA9dHxofbk19MASJyHPncsNc9Jrt/ZobQ0YWZLZPp5e9JwLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ac5AClrtpFCusFXUZIqoP1b/u9m1+EtbcnCrqOyjr0M=;
 b=azvp6vqemXWJ3hlgxFNuMtzUZWE6mc1y4afdEnMC0l7WYYSwbmx3DG4UilTQMu1iOQ/K6Zh8dvTSHQRIQLOlmVykJ+om5U7E58eqeeKMQgYfZLiJZ+2SYjgSKKmN78TqXDgsMQ7GYIQCSfBoj/LPtIIhJ/noR600IHFFYmFHSf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 04/13] libx86: introduce helper to fetch msr entry
Date: Fri, 16 Jun 2023 15:10:10 +0200
Message-Id: <20230616131019.11476-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4acfea-9356-4b93-cdbd-08db6e6b2bee
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZbVM+DXjxdXVnPJ+8JhspgkYra+F+UNEgkm0NMP3nt48h8ypryYtybl2jy9ddMZYoLpjpeYQ2hxH+lHtebsNscdxJOcV7/xT0pitsv8sl0WaBRelktqoZMCDIooV1prbpryRkdEpbvEg0XcQMZyDKDszulpfHN2U/ORDb5ietSnRg3D7zebZsBXUhR78sYrAuefS0nFA63LgdyDfJdqQ2V9t+DXHmswM6s0cfESX+B3YdEc56+Vll7iNLF81pZhSQQSzkRG0vE+IJUPxdPKSRWGK8U0TSUB21SSIIWzrhD4vSOceRuCPIDoX4TkaiCz3tidXXsCy1aFIgEVp7dDZZOB7dz0WLPtD6TcSxMKFpQzvvctjj6Zm5oxTY/T4HfzfRwu5JoSjIfH9BEn85714eSgXtVFEFQs7WDadk1yYDXMDKAxAOzT95hR1DToejtgBj+NmY3yS/zpgGkog0FVXTAr1EGg9hg4cEorIbnyZrmQGYIPz92rF8gB7IYjPaJhs7LC+TZJZzg0z7kCjgukSrP3viN9EL2FnG16ww/Vz2CWzywr9uwc59hmDTaJmCkT4hJvSy55cRLcsq4s6rNnNJOgKHhj2/YTOTXQSFJDTPUdigGyKkwyKJa+pKFqHk1lt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(86362001)(38100700002)(8676002)(5660300002)(82960400001)(316002)(8936002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(54906003)(83380400001)(2616005)(66899021)(186003)(36756003)(478600001)(107886003)(1076003)(6512007)(6506007)(26005)(2906002)(6486002)(6666004)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDk2eVhWY29mUkIyZUxkVlFEN0kyUnVBTVdXRmQ4UWRrelBvcVpMbk5NMlVu?=
 =?utf-8?B?VGg3Z01nVVJiMWhPcXQ0bFg4M0R1NU5xQ2VlSkt3c01UQzM4YVdIZmV2T0o0?=
 =?utf-8?B?UnVQZjJHOU02VWRDMjkzL2FiMnNSOUVVSGFleFBqMEw1Mm1LS3NveFdVeXRE?=
 =?utf-8?B?VnllZ1J1U1R6Vmo0djFXVE8xWUV3ZGhONVZGb2JZYjUvTW5Hb0ZON0V1WC83?=
 =?utf-8?B?OEFwVWMyQUZJbG0yT0dGMkFEbHcvRmpnWERERzVJc1ZKTnZFWmNIVHo2VUpz?=
 =?utf-8?B?R1dHdDdrenFuL0MxMUlUUXZyaWpXaUEyT2hJTFJDMDZzNWFpM0JiNW1PS09w?=
 =?utf-8?B?dXBqZUVGUGpQYVg4YmExb0poeVhhcUM3cS8rUGRPRzErWXIwTUZnUVNzdVNq?=
 =?utf-8?B?UTdBUmlpdWx2L1hFVU10L2Jka2NwYXRwYlFrTHZKRlRzN2RqTDBKVVErWWd6?=
 =?utf-8?B?YnZVMUYraU12WnRyaWpwL0ZQU0NPSUJrSGRMVzYzdFcxc2REQWZHdDFnTXJE?=
 =?utf-8?B?cnExcmduTE1MOW1qQXBXMU1zdFlzNHJCdTBYMk5PZU9rMjUrUWY0c3R1Z2Nx?=
 =?utf-8?B?cDV6c1J2NjdEckhxZUpvaE1tOHB6Ty9KemZwRWNiVW1SVFN0NnN5aVRtdnFT?=
 =?utf-8?B?czFuTnZuZ3VrUVBXK0RuQjJIWTNiWlpNVlpCODhPT0lhZUFxZ0E1aS9sVGZo?=
 =?utf-8?B?QmE5d3VXdnFLa2VXTDM2QWRzdE9yOW02enpKRnltc0tRL1NMRU96a2ZIQXpp?=
 =?utf-8?B?V2hQZmkrTUxkRU1aUkgxb1dvcTF0RnNibTdrY1hhTmhieTVpV1g2N1AxWmtO?=
 =?utf-8?B?OHA3UWxSOFJWRGlpOEZYRVpRTW40SDhXOC9vOXg0UWpwWHZnQ0R0L1pJTHh2?=
 =?utf-8?B?VkRZOG5EQTA4VnBNRm8zTjM5VkpiUkpiY00raGpHdGpmRUNzOEJRUTBaVGQw?=
 =?utf-8?B?dHNZOHR0NFdmVHJwU1BqZ1FENXBXUHNVc016a1dLQ2d4YzU1K2hYYURJcnVp?=
 =?utf-8?B?Qi9mSS9RY3hqcE9jbTFoNk4xcDh6R3hudFdXWC9NS3RkUTVjdkcvNXdKeGdP?=
 =?utf-8?B?VVR2TW82MlgvV0ZwMzRhak53NzNqekdnQjRHbmhsN2JKODlJL2NtQjlFeUsv?=
 =?utf-8?B?QUNxM0craUlBckhFVXVyOWp6ak9Vc1N6b21xTEx6UmFnVjJsbVdVYVdTTXo0?=
 =?utf-8?B?RWIvSlpyck43VjVjY1JFcWNTenFJWDBEaEpqeFlmcUdieng5aEdjMWdnQ0l3?=
 =?utf-8?B?OGVGaHlXVXB0RS9vMGZRMXZrbnROVEpNRG9pVloySElkUTZjT3BqVFRwQ3U4?=
 =?utf-8?B?Z1dITDk5RmxILzdZNExDdGVUc1NQM3p0UVZha1JDK0JqVm9RUjVjd3VQSXoz?=
 =?utf-8?B?QWdadHVKZGJTNWphd2NpdzhxMkIrdFFuUXVadGNNQVFFZWhrL29DL1RHV1BN?=
 =?utf-8?B?QVc2ZGUwa0JIWHJheUd4UlJTUlpMd0pSL1MrSTZ1SlpnalFBQ0hKcHpSajZP?=
 =?utf-8?B?ZEQzb1dyeG1NRWFQcjR6WEVzRm9SOWxhREljSEhIMkxpQ1N5QUhEOHBVbllq?=
 =?utf-8?B?RmUvUUtsY2V2YUxoUG5FeGQ0dDJycXY1VDg0YzQyUnhyWUpWN2JmVnRwaDg5?=
 =?utf-8?B?bC9CbzQzVXlvTkwvcUFIYWtpa25rN2gwMGxvZVVNUEZzdUVaWERORG1RWm4w?=
 =?utf-8?B?VXBkd2JvWkczVHVEMWJybUFBRlEvcnE4QWlpbXZVRzl5T2VNYjZRZlpTQzRr?=
 =?utf-8?B?QU9ySGliUm9wSlkvbGJscXlsQkFNeWprYXRyK3JTSk5PWnhkRU55Z2N6NDlU?=
 =?utf-8?B?dzM5QmMyYW9jRklIeHkwTUkyRUZFbnVOZUQ5Z3h5Nm5wNGloc0xuaDVLeFFv?=
 =?utf-8?B?SW9hSnYvLzF6a0oxekY0Ti9YRDQ5SWpsTExFOXdJVWNUV2lmSjdhcGNzK3J1?=
 =?utf-8?B?MUcwOW1pRmpleWhlRkJFSnhXZnYwSVR1bytOcHpvYjRLOXJoUjNFZ1lSV0lX?=
 =?utf-8?B?Z0xoak5WakUvSjlDVzFKSVBwOEJUTkRRTjVyd2FnK2krenk5WDdCaXFZeDVu?=
 =?utf-8?B?eDNEUXJ2VmUwR0UxeVRXQTVRRGJLUk01UTgvTldFTEVNOVdiYXlOMG04N0lQ?=
 =?utf-8?B?endPa0xXZ1ZodnBZWjZOditLTzhNODhNTVB5a05qSzRSNm85ZCtxN2h3YUgw?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o6P9uSlgZ32POVtBR8VdyEm7b0AZOcfMJxOWLTm4ayH18g23hXTxsb5y/QLLNJdFS3WIHHTO/kp4jLyooDZ+y6bbFAL1OD4wU0T/6SgJAocgLujY9DWLyOZsjdhUDxSwtJ5HA7Wb4SUmWBSY28cuPxdibsGi+Lpr7h5cVzTmkVmfOhH8+w1bxn0QPgUJTjgJHRQMzpBF4MB0mv4O8dFvpMMmQkXMvSaUB3y56LoNVtLyG9BnAjasDeBE2NIlsivDS7IURmj3EOrovTDACWu737iTVXZRcaEHFAerhpD4BoVyKx+P2DpR9BhIp7/JbS1qqPPxXBVQkaDXKn/CfFlNbql2x8ckMWJ37JLuXAfwBXuCCbhRCfLvcRui5URttQRBu3sLP8pdoeLr39JGUqFB0hapmA03HFhotvsBEBSOQA4Xff8uI66EPilWSbI7oHWB7bJKFpuGKLsf7ajawWCgvLZZtDPwEPH28w7pdO4Quhusz/q3hcYuqer3MEGeC8qm7gjwQ78a9xK/Dr2weJRg6hF/lYSuXDXR1t1d1NW3s3PWtHJCvaM+qUDOV+LUm/iqOBy4Hg/NOnE3i8NZULmXbe7cePTHVVxYwqmX0SjyBFT6G3TRAqU4XoWgILWenMRrVPp3TNie0yqMtNyJRrDRbIsSm35wx6ho10zbPqk0dIC3PCrpBiY2CUincvA1oL+5tNj5EPHW7bzQVpjsPjv+RsqYdsEguPDOsosK94xqxdzgcs8k/qV5wVpSnSSvl6FvYUeL8lf1dmdPapU1PVDPxHNYXMjTjo6Vmfl9META4eQbAhhELMZx2Ohede3Ahq24
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4acfea-9356-4b93-cdbd-08db6e6b2bee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:11:18.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzhsfdRT8FSeanrH7MwIqdqVB+kCTvzYmCOYaAY1Hc/27i/V4khu5UIlAGPtr7/u0ytb0b+brvwafnQzt/IB/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6547

Use such helper in order to replace the code in
x86_msr_copy_from_buffer. Note the introduced helper should not be
directly called and instead x86_msr_get_entry should be used that will
properly deal with const and non-const inputs.

Note this requires making the raw fields uint64_t so that it can
accommodate the maximum size of MSRs values, and in turn removing the
truncation tests.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - Rename _x86_msr_get_entry to x86_msr_get_entry_const.
 - Add newline before endif.

Changes since v3:
 - New in this version.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 43 +++++++++++++++++++++---
 xen/include/xen/lib/x86/cpu-policy.h     | 18 +++++++++-
 xen/lib/x86/msr.c                        | 41 +++++++++++-----------
 3 files changed, 75 insertions(+), 27 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index a11c8f067aad..2ce6ee96f91f 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -387,11 +387,6 @@ static void test_msr_deserialise_failure(void)
             .msr = { .idx = 0xce, .flags = 1 },
             .rc = -EINVAL,
         },
-        {
-            .name = "truncated val",
-            .msr = { .idx = 0xce, .val = ~0ull },
-            .rc = -EOVERFLOW,
-        },
     };
 
     printf("Testing MSR deserialise failure:\n");
@@ -740,6 +735,43 @@ static void test_cpuid_get_leaf(void)
     }
 }
 
+static void test_msr_get_entry(void)
+{
+    static const struct test {
+        const char *name;
+        unsigned int idx;
+        bool success;
+    } tests[] = {
+        {
+            .name = "bad msr index",
+            .idx = -1,
+        },
+        {
+            .name = "good msr index",
+            .idx = 0xce,
+            .success = true,
+        },
+    };
+    const struct cpu_policy pc = { };
+    const uint64_t *ec;
+    struct cpu_policy p = { };
+    uint64_t *e;
+
+    /* Constness build test. */
+    ec = x86_msr_get_entry(&pc, 0);
+    e = x86_msr_get_entry(&p, 0);
+
+    printf("Testing MSR get leaf:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+
+        if ( !!x86_msr_get_entry(&pc, t->idx) != t->success )
+            fail("  Test %s failed\n", t->name);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -840,6 +872,7 @@ int main(int argc, char **argv)
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
+    test_msr_get_entry();
 
     test_is_compatible_success();
     test_is_compatible_failure();
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 3fcc02c729db..877879fc8c16 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -337,7 +337,7 @@ struct cpu_policy
      * is dependent on real hardware support.
      */
     union {
-        uint32_t raw;
+        uint64_t raw;
         struct {
             uint32_t :31;
             bool cpuid_faulting:1;
@@ -559,6 +559,22 @@ const struct cpuid_leaf *x86_cpuid_get_leaf_const(const struct cpu_policy *p,
 #define x86_cpuid_get_leaf(p, l, s) \
     ((__typeof__(&(p)->basic.raw[0]))x86_cpuid_get_leaf_const(p, l, s))
 
+/**
+ * Get a MSR entry from a policy object.
+ *
+ * @param policy      The msr_policy object.
+ * @param idx         The index.
+ * @returns a pointer to the requested leaf or NULL in case of error.
+ *
+ * Do not call this function directly and instead use x86_msr_get_entry that
+ * will deal with both const and non-const policies returning a pointer with
+ * constness matching that of the input.
+ */
+const uint64_t *x86_msr_get_entry_const(const struct cpu_policy *p,
+                                        uint32_t idx);
+#define x86_msr_get_entry(p, i) \
+    ((__typeof__(&(p)->platform_info.raw))x86_msr_get_entry_const(p, i))
+
 #endif /* !XEN_LIB_X86_POLICIES_H */
 
 /*
diff --git a/xen/lib/x86/msr.c b/xen/lib/x86/msr.c
index e04b9ca01302..25f6e8e0be92 100644
--- a/xen/lib/x86/msr.c
+++ b/xen/lib/x86/msr.c
@@ -74,6 +74,8 @@ int x86_msr_copy_from_buffer(struct cpu_policy *p,
 
     for ( i = 0; i < nr_entries; i++ )
     {
+        uint64_t *val;
+
         if ( copy_from_buffer_offset(&data, msrs, i, 1) )
             return -EFAULT;
 
@@ -83,31 +85,13 @@ int x86_msr_copy_from_buffer(struct cpu_policy *p,
             goto err;
         }
 
-        switch ( data.idx )
+        val = x86_msr_get_entry(p, data.idx);
+        if ( !val )
         {
-            /*
-             * Assign data.val to p->field, checking for truncation if the
-             * backing storage for field is smaller than uint64_t
-             */
-#define ASSIGN(field)                             \
-({                                                \
-    if ( (typeof(p->field))data.val != data.val ) \
-    {                                             \
-        rc = -EOVERFLOW;                          \
-        goto err;                                 \
-    }                                             \
-    p->field = data.val;                          \
-})
-
-        case MSR_INTEL_PLATFORM_INFO: ASSIGN(platform_info.raw); break;
-        case MSR_ARCH_CAPABILITIES:   ASSIGN(arch_caps.raw);     break;
-
-#undef ASSIGN
-
-        default:
             rc = -ERANGE;
             goto err;
         }
+        *val = data.val;
     }
 
     return 0;
@@ -119,6 +103,21 @@ int x86_msr_copy_from_buffer(struct cpu_policy *p,
     return rc;
 }
 
+const uint64_t *x86_msr_get_entry_const(const struct cpu_policy *p,
+                                        uint32_t idx)
+{
+    switch ( idx )
+    {
+    case MSR_INTEL_PLATFORM_INFO:
+        return &p->platform_info.raw;
+
+    case MSR_ARCH_CAPABILITIES:
+        return &p->arch_caps.raw;
+    }
+
+    return NULL;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.40.0


