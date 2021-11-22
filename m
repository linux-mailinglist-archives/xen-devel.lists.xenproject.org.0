Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DBC458C79
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 11:40:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228741.395861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6kL-0003MK-BF; Mon, 22 Nov 2021 10:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228741.395861; Mon, 22 Nov 2021 10:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6kL-0003K8-6k; Mon, 22 Nov 2021 10:40:25 +0000
Received: by outflank-mailman (input) for mailman id 228741;
 Mon, 22 Nov 2021 10:40:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=smF8=QJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mp6kJ-0003K2-DO
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 10:40:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96b15cd7-4b80-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 11:40:21 +0100 (CET)
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
X-Inumbo-ID: 96b15cd7-4b80-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637577621;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=PWnlmQAyqJANGP6mdsBrEbk9NfHx1x93qoMQ0d318Wg=;
  b=HA96FdnqKTUIHlNM2lMMwNekuIOmWW3VOVXYks231m+Q7zssLAMc84G6
   5lJ/DhUUUcJ+xMCbdi6lJbDr4rNC7HN3QDVvjRQuaOB/YvzEBA92aTsSi
   8o+P99/LWmMb8WP0nHn3Qrj+avCFFslh6mvY//uOkC7JL/ka0OZLdWxRJ
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RSJPEdZt3xWTDEpjut695opzrFULlV7qEvTSzznshOLmkNNTnLG8lVVQ+Q8JcLGMaXqpVe78jc
 ocH9wT+iPb/uv4zPpmGOwjxHdSsTnMH/KJ0oekrRjQUOTdv2GA/6FBpyg6c8to6s1Eb9VOSSYi
 RiNbSrfpKMcTcTPIGyn617Z356/l3N/JhKSXogMWEWPAn4TmrQc5V0USCkJJEo/JlL07sXuO5t
 lbjZ0bRQ2+u7q/8ry84G+3yN4kJF4TshM7f9swtw3rZOysDVEx70/QwDzO9mjU8pbxwyZUYa3J
 nfI21EXq1g4Jk3tw7OE4XQng
X-SBRS: 5.1
X-MesageID: 57865401
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 YkT93CY0sJdGX21qTL/PsCGvNo=
IronPort-HdrOrdr: A9a23:GKRQmKBkovAatH3lHehLsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6Le90c67MA7hHP9OkPMs1NKZPTUO11HYVb2KgbGSpgEIeBeOiNK1t5
 0QC5SWYeeYZTMR4LeYkWvIYurIqOP3j5xA7t2uqUuFIzsaD52JuGxCe3qm+wBNNUN77d1TLu
 vo2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnV4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUtZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQmQoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPZi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZPIMvD0vFlLA
 BSNrCf2B4PGmnqKkwx/1Mfj+BEZ05DXitvGSM5y4ioOzs/pgEO86JX/r1Zop46zuNPd3Bz3Z
 WyDk1ZrsA/ciYoV9MOOA54e7rNNoXse2OFDIvAGyWtKEk4U0i936Ifpo9Fot2XRA==
X-IronPort-AV: E=Sophos;i="5.87,254,1631592000"; 
   d="scan'208";a="57865401"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mn+IKA+vWpVTkMQwqm40JHthSqyZn55acFr/3sZP64F92Hfb0KR3Tw7th6ocKuSSFhkFanj/iQQ5jmMCqHyIQgP1c05SHmGGpHT5EtGZNHLuGdyRZDb8lCxZpaZ06mFbogv5fWdEal3TtPj4ZtONWWiQaYWiD+9iyeDzZ2D7WYJxyiK5fTjZ+jsMMs5DAMTkUghSywJp3xKmk6H3bDp6MFPUPm80xmDSuQCafQ6jsXl0OpklwvJxzqeqSGCBYuIgX4m6jasNt4x2Am6mCexwLNJksdf8q7NtAGoBlUlqfvTTvVNOZ/vRTXP5usCPqHJ7qiL8ZCbnPeAU9XrWvrzN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnohVBjwm61/g4wclhhgeC3O/w7YIUdKUBYrErdDf4M=;
 b=ZSRtZPmiCTauCzh8v/Z5CFFRFqaDByzOMDIvcFSjjd+jxKNLlsWeaZaMN8lGw8FhnJrVQIdeIs3/9H1JzznrRkHWgoVYfIvxLcG15YzeK7w7sukoSf8l9Ee9VfKMvx+t4ted9Bsi5ZO2xFVQUiOpeD+jer+Q+rBeTiMcAJHRoEwQ5MzHjdkbX6g7wob/KYEj0Toqed7+9pLQOf0PLLOGVjWM0++LzZBj3f35ZgF6UTMixzl6VC8l+0ee5/spyg6LrdHqjFKa+pv1781A0wgmVgHXygHqN+241S/r0fkJ5JfedR/zwTzfDn76nYsKob/SlpZsGj+yP/+hu+UzLPJglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnohVBjwm61/g4wclhhgeC3O/w7YIUdKUBYrErdDf4M=;
 b=eHqocoDDGzitSrgjxGBqk8XoyFuRnry33r1ZJ5IIMSQdtysIStg3JCned/CR0eiY22NxKUfTJuTdc4cBlrZJXHmRl+jGzqfgE5cVDpTiNX/49co9277l6aCLMsicIgw+2vdvJxDZqds03v5u69CkVk+eQ5bKPmq5wLe0wjey1/o=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Community Manager
	<community.manager@xenproject.org>, Ian Jackson <iwj@xenproject.org>,
	Alistair Francis <alistair.francis@wdc.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Dario Faggioli <dfaggioli@suse.com>, David Scott
	<dave@recoil.org>, Doug Goldstein <cardoe@cardoe.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, Julien
 Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>, "Nick
 Rosbrook" <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>, Quan Xu
	<quan.xu0@gmail.com>, Rahul Singh <rahul.singh@arm.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Shriram Rajagopalan <rshriram@cs.ubc.ca>, Stefano Stabellini
	<sstabellini@kernel.org>, Stewart Hildebrand
	<stewart.hildebrand@dornerworks.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	"Wei Liu" <wl@xen.org>
Subject: [PATCH for-4.16 v2] CHANGELOG: add missing entries for work during the 4.16 release cycle
Date: Mon, 22 Nov 2021 11:40:05 +0100
Message-ID: <20211122104005.58897-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0050.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b6fb7e1-e0c6-408b-7943-08d9ada47831
X-MS-TrafficTypeDiagnostic: DM6PR03MB4298:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB4298CB4FD5AB95CF152859B18F9F9@DM6PR03MB4298.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: npQKb6c4xjgv4YfjHBlHFEdSIlipJNUGSh5BRg06bUYyCU8bvXPk5OiVItqNFXcUzV6KBUD7oMDmrwLiCr17nsgsvsuQmPgkaQIMlo58E1DlHeiOUDAL4d6t16qBaH0bSEHJJW1FtiqGtLrCrlM07g2O3nwduYfyi+Rsc9/IFBhF/gC2/DDNimxmNvZ6fNPcLvUl7l5WTmdTxPls3kvGHZcFrqF08bhPdaEE0TtVxD5xlNEQj5+0w28XSz0+OksFX66XtwQxIUubZK2E0pIiKvNijphIC0SygynQjjRamDBlXS//7MD5imfU+8i18BkEJYMt4nqH0f0ATEqJANV3BBy4zcYfaxpuMRNhSmQy50gpvjAVTjvzRBD8HUzrhGSalMQR0CZP+W4r5qxGQ9ZwxIkEPzDuxqNBd0UZh+QhqIS3mzOB8cB98oTGUH9w7XB18AaC6w1bF0TpbOeDFbQ1GZOhGiNHKAI4HDzin268HHgce9Y4f3od5xKtMrsD6td0kGcV2F/TLbR1etHZzlJCM9NwpVLh8B8AwBqxwaVs37MNz7BXtj5lFJ9hkfOF1uQoHGDp+I/KIomvkriCdtTiVuC3TwxQxP4mEkmg9L9c/NCezYFoX5g0bri3HIXn52wHGQq5Yyp7iVIMUpnv1FBLrP49ntVOHBOYvd5T10uP78WTj41qSVg9zoJhg5JPjh/pH//bvYD8iK9v+QD9Ko7SVrFbeL8sEpexh4/rrXpGI+xriLTHTs7EsqCwpzgD5WdXRXusx/BAYE9+xdPwaTw27lY9OkXPSiGwYMFcmkE//x/ujntL4gr/IervWJcGI+tjIpjYz8xMS5azAZPiFVsOrDgZMgriABos7bZlhI4K42XWAVYLCJbzLWZOgB/CYOSH30ys7I6Hx4yOkL+v3HzjMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(66556008)(66476007)(66946007)(54906003)(6496006)(86362001)(83380400001)(1076003)(38100700002)(508600001)(6486002)(956004)(2616005)(7406005)(6916009)(7416002)(82960400001)(2906002)(186003)(316002)(8936002)(5660300002)(6666004)(8676002)(66574015)(4326008)(26005)(207903002)(219803003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmtpbFc3Qit6SnpxUm1KeTN0aVl2bHVYVlR6MTFOeGUxckEvMGFOZitpcks4?=
 =?utf-8?B?NnNwTGtxVjE0N3NZYUxrTFNseERyNDE5U2tXMDJCK1JkMkZQMG9ldDFJWTlF?=
 =?utf-8?B?ckxFUW1zMHhQNEZpUkJHWVplb2xacGpNSXhuMUJFc2FCQlVac0lJQ2NvUWh5?=
 =?utf-8?B?Nlh3UUFNOHhqMlBiS1hJZ01XYkNVQ0p2bVErRmdONEsxM1REWE5IN2lNUWR2?=
 =?utf-8?B?N0U0TGVDam1WWVk3Z21qaHV0TFpUNHlDSFlhOWNLS0xwSExUQ1JFUk9td0NY?=
 =?utf-8?B?cDhhTXpYa3FUV3U0THAwbUNUOU83YzF0cmpmM2dmUnV5RHU3Qm8yNjBWSlhG?=
 =?utf-8?B?YWZmUExRdWMvNlMrbGVZeVNtemhBcHRjcy92MGhKWGpVUVVOK2I4UzRiSTNZ?=
 =?utf-8?B?OTZ3SzVnakFrVE8wbHE3QVJuZ3F4VFk1VFhTbDJnZ3BzS3RiS09xczJYZG9t?=
 =?utf-8?B?SnlUalU2UnBFYWV6UjBCenA3UVh1VFN3bjhHYkpmU3pVQjdoN3F1NVBUWGM0?=
 =?utf-8?B?MWR2NHFyeWg4bWFlZE42SVphR2ZyRVR6SXl6TlBaKzd2cHNRMHVvMVRjallw?=
 =?utf-8?B?QU5zaDhoNG9va29kYjdSUDFSQ3JYS2haN2grcS9XZ1N5V0gvb2piazVGU2dv?=
 =?utf-8?B?dlhRTXBBeE9nZHRhNksrUDZXbUx2NEwvdHV3cTcrbmF4WVFOenZXdnJ3TVY2?=
 =?utf-8?B?aWo0dUZlTjdPNThDUW8wRFNJNURRaHdQQUJCa3I0bGVGQkRNZDBDME1IT2Rk?=
 =?utf-8?B?NHM1dWhVdmJOL3RHREduNGxNdnBwWWtGMWRaK21SZ1FPaThmN0piREpxOGxt?=
 =?utf-8?B?RXQrRmtVQW1pS3FrTGlQaWorV001SHBqdmxiQSs5THJveGhQNDJHWldRVElD?=
 =?utf-8?B?NVcxSnEvTDVWcjRoV2ZDK1QzU1dCZWxTRW04SGN2TlVuZnNzZFdFdlVHZUNu?=
 =?utf-8?B?amY0ZFA1WlpGQW52WEdXekxrVTAvWG5yZmg1NExDenlEaitIOHVOVmpxeUVo?=
 =?utf-8?B?VGgvbVdqSW9oYmFxV1ZVa0Z6NVpDOXozVDRjelNxd21Sc0lhcG5PZm5jR0N3?=
 =?utf-8?B?M20zRUtUdk13a05aRDRDb2RXeHlXVEZ1VXRtazRYNjEvY3IyR2JweUFvYW43?=
 =?utf-8?B?WUc5dGtZblU0a3lmR1UzK3lYQlo5SG5ob0JIQW1ZM2lJNXZnaUpRUmFZVmNN?=
 =?utf-8?B?eTlYU2pOVmo2MkoyZnJBZWFZMTVoQXVPUTZRZnJycnhuS09SZzJ0cktudUIx?=
 =?utf-8?B?YWhxWFI1ZjY4eWhGcHVIZjZFL0xmbjRKaFZBSlhYdXlXUU1LdlZjVmFwV2Nm?=
 =?utf-8?B?TzJFbXEwYTJ5bnNvS1pNVVBoNWwrSmlCTXkwVmlJUzBpV1g2b2gzckxwTkV4?=
 =?utf-8?B?dEQ0N3FnUCtnaUhsbDdFVzlkRU5adG95TEtxbmRQYkxwdzh5RmV0STBWd2Yr?=
 =?utf-8?B?UVU2Y2VvbzlVU1NWWW5laUxVekhVL1JyUWxOSXkxMWp1aWl4a3FSZEowNE9v?=
 =?utf-8?B?TFNKcStrazFLaUthMmRTY1gvaURsOGdaSmt4MXkycDc2Tkg5V1hlandUd25m?=
 =?utf-8?B?OGt2M3VhWENtUHp2MjNWM3JxR3ZWK3pabW9BbnJ6NXd5SVBtWnhBL1c2T3NJ?=
 =?utf-8?B?YU1LRXpSRnhWV1ExSHRrbzJDOUdrYThja25NOVB6aEdtU2gyWkcwQUx3TzAr?=
 =?utf-8?B?d2dtRHlnUCtWaUNJdGdxNk1Edk5jdVlnb3BzcVdvUytGUFlLVkZkcFZiTjBW?=
 =?utf-8?B?REpkS3ZyTXJsWC9TK3VrY0JVTnQxKzF3TUxIUWFHSEZibjJNR0ZKdkE4Mm9J?=
 =?utf-8?B?Q24rSHlRMDNDOFlDNHJmbE04eHdIaGpwdEtoUXdHSENmUHF6YmZYa1lLZEpz?=
 =?utf-8?B?UnBZWmZpaENmZURGTnBEek0vYlNTS3NVY29KTFoyVnN0ZVJrUXNTckVxRFJF?=
 =?utf-8?B?ZzFvMzY1TGp6R0VuMTc2VWt3MWRSN1hYbURiYUozOWRmRnRDTG9ETXY2cmQv?=
 =?utf-8?B?ZUUwYVFJa0FTZkpOL2V5eldYcTlHRE5ESUZLd3lDR2EzVzBNVyt3THprcktC?=
 =?utf-8?B?SzNIR3p3SE82dGdmVnQrNEZiY2FieHl1V3Yza2hzbE1VYVhXY09PN2ZOcmZy?=
 =?utf-8?B?R2tuaDh0cHdnNHUzSG5qd3JzVjJZazRRazdYUi9rRys4ekEwSW9nL3RwZnQ5?=
 =?utf-8?Q?t59QrmrT6Igy3KanjD3nrJg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6fb7e1-e0c6-408b-7943-08d9ada47831
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 10:40:15.3729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkwX/Ebap4jcqfqoLaExAWxtZ6HqurUQS/PQ+maTSVQxcxjIuyU/BH+Nch3N+yIo0qlW8H1bnuKvrI1KeUpLig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4298
X-OriginatorOrg: citrix.com

Document some of the relevant changes during the 4.16 release cycle.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
Changes since v1:
 - Add qemu-traditional and pvgrub notes.
 - Expand vPMU support to note it's limited.
 - xenstore library API changes.
 - xencall2L addition.
 - gitlab CI changes.
 - dom0less improvements.
 - vGIC fixes.
 - New Arm features.
 - OP-TEE fixes.
 - Arm64 heterogeneous CPU support.
---
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Cc: Dario Faggioli <dfaggioli@suse.com>
Cc: David Scott <dave@recoil.org>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Josh Whitehead <josh.whitehead@dornerworks.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Jun Nakajima <jun.nakajima@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Cc: Meng Xu <mengxu@cis.upenn.edu>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Quan Xu <quan.xu0@gmail.com>
Cc: Rahul Singh <rahul.singh@arm.com>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Shriram Rajagopalan <rshriram@cs.ubc.ca>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tim Deegan <tim@xen.org>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Cc: Wei Liu <wl@xen.org>
---
 CHANGELOG.md | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ad1a8c2bc2..4652ced650 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -21,6 +21,32 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
    no longer be built per default. In order to be able to use those, configure needs to
    be called with "--enable-qemu-traditional" as parameter.
+ - Fixes for credit2 scheduler stability in corner case conditions.
+ - Ongoing improvements in the hypervisor build system.
+ - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
+ - 32bit PV guests only supported in shim mode.
+ - Improved PVH dom0 debug key handling.
+ - Fix booting on some Intel systems without a PIT (i8254).
+ - Do not build qemu-traditional or pvgrub by default.
+ - Cleanup of the xenstore library interface.
+ - Fix truncation of return value from xencall2 by introducing a new helper
+   that returns a long instead.
+ - Fix system register accesses on Arm to use the proper 32/64bit access size.
+ - Various fixes for Arm OP-TEE mediator.
+
+### Added
+ - 32bit Arm builds to the gitlab-ci automated tests.
+ - x86 full system tests to the gitlab-ci automated tests.
+ - New x86 pagetable APIs.
+ - Arm limited vPMU support for guests.
+ - Static physical memory allocation for dom0less on arm64.
+ - dom0less EFI support on arm64.
+ - GICD_ICPENDR register handling in vGIC emulation to support Zephyr OS.
+ - CPU feature leveling on arm64 platform with heterogeneous cores.
+ - Report unpopulated memory regions safe to use for external mappings, Arm and
+   device tree only.
+ - Support of generic DT IOMMU bindings for Arm SMMU v2.
+ - Limit grant table version on a per-domain basis.
 
 ## [4.15.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - 2021-04-08
 
-- 
2.33.0


