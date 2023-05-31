Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD4C717D75
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 12:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541726.844762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4JWI-0002hQ-Kx; Wed, 31 May 2023 10:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541726.844762; Wed, 31 May 2023 10:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4JWI-0002eu-Hj; Wed, 31 May 2023 10:57:34 +0000
Received: by outflank-mailman (input) for mailman id 541726;
 Wed, 31 May 2023 10:57:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EXUc=BU=citrix.com=prvs=508c705fb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4JWG-0002eZ-UI
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 10:57:33 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeca9397-ffa1-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 12:57:29 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 06:57:23 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5267.namprd03.prod.outlook.com (2603:10b6:a03:225::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 10:57:21 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 10:57:20 +0000
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
X-Inumbo-ID: eeca9397-ffa1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685530649;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/a8q9dRYrWNiaxur1bpULk9irO0PxOsB2WfuQJYO7Gk=;
  b=cComfOYl+Kq9U8O+XzTo72y/6bysAaNH8gR6EbwgfIkOIJyY2pcFspJw
   bgldp/K7YuU3dBoDxuc7MeTeVj3CL0SwtBrevnMyFOZ4szFE3Gaqf8wiC
   f70DzdEZBoZGb5EPuiV2PG5mJzBHeSNW6S36MXkP3Ct2b7GebOsr7C8jT
   o=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 109816428
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:clLjn6imFJAhiPJGzm/B2LF0X161RhEKZh0ujC45NGQN5FlHY01je
 htvWj+FOP3fNmCgLtgga4nl904Ev5TSyIA1SARkpShmRSob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QSHzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQlBTsMViHA29mOnpLnFLZtg+Q/L8TkadZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGya7I5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjCdJLSuHippaGhnW33Dc/KTgESWG3uKWCs2eAa9tUc
 kMtr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A79y9pog210vLVow6T/XzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:bQnVGqwYvDYNqSwVkXmvKrPwhb1zdoMgy1knxilNoHxuH/BwWf
 re/8jztCWE8gr5PUtLpTnuAtj5fZqxz+8N3WBVB9mftWrdyQmVxeNZnO3fKlTbckWUmoFgPO
 VbEpSWY+eAaGSS4/yb3CCIV/QtzMC8/Ke07N2uq0uENGpRGtpdBn9Ce2GmO3wzeSJBApYVEp
 6V5s18pzSmdXl/VLXLOlA1G9XpodrGsonnbx4ADxsM4mC1/EyVwY+/LjOf2Rs5SDNAwbAr9E
 fflQiR3NTcj9iLjiL20WjeyY9Xltvnwt5/AqW3+7QoAySpjhy3IIdsX7DHuzwquuSi9Usni7
 D30modA/g=
X-Talos-CUID: 9a23:YejIxW/TKbCW/gdENLmVv3M5EcEdQz6B90+OAxPmVmdsaKGWRFDFrQ==
X-Talos-MUID: 9a23:WxtGbgp0NDAyMTwtAmIezxV4b+tJxrayMkwUza4/kve0PCcpNA7I2Q==
X-IronPort-AV: E=Sophos;i="6.00,205,1681185600"; 
   d="scan'208";a="109816428"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCXdpKQsX26yj8wOL71R0PTUBvUdCV2wpHGoMoN4etako9pmrJ0uPJP2n0+3tCqAruL3gOZESs4Fge3mYxW8fWjhJ3sn2ZsRfW1nug8O/wg5TRl4qI3G9Kl76kDh1XEuFmsjCDuxuwoWoyGPfiSI+omzNTd6DP3fflU94vccW2lBL2njwPkXhP7OWnFAgFliZGuLJgVcy6oKgvGyWdJQOfCrb+G5EY08Y422a2or9JrHOaIEa6worWq8FidWfvnS2xKqCsx3MVKNcC8WnRC8n4fksUIAJgqri4mz/Inc8tAloiAKqNKaYf+S3opMa1RPHFi+6eqxvtS6KviLtHH9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k11gLLKqtlPS8PlX5FS1VGfQ7U3VS0mLMVNd3u96KMI=;
 b=mKAS0TZnw1C0Pk2HaGInWqlwr/JekyMd6YW8Rqtw20xZy1z8qqn4Cy5eGpYGlMxIvUFzap2o6JpRWjcyMfTNSAPL1Pr0W/O2Atym72vwcHdMiYLCl7VNwAioEXAFXZ4NFwReYZoogn6o9U6hn5X32CAkbwX5+SwqvlhVHjCfrFCBSJlwCvpjvmaXFJR71WJ5bnEkIHRhZ1H2UNSEOV+yLTjcEL+YWJHeuWsxrEUp7uirRVQzZ2pHASzmfVe/kAWWnHSEPXNnSEe98eRlvc1SDamsf5JXWG0m9GtlerRUy0ja7PQIEM+S3wV6L9TOb0mUIqBm905xEl4VxCZhHgwyWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k11gLLKqtlPS8PlX5FS1VGfQ7U3VS0mLMVNd3u96KMI=;
 b=VSMcT0EPHQaJigUSUTsvJOK97UsAn1BoTCg/cEm8uYLQOQqUyOdlH+llNecmxylpqAy4Z0FnN0Z+FuzuM/JAauFu7vfvrV2vo2mh57EVu4Q5JaejJtTOHJ2/WDgr+59qaCFj8GjzBFN3dOjZ/4myPCCTQR02K++HBAh0M3p5cz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 31 May 2023 12:57:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] multiboot2: do not set StdOut mode unconditionally
Message-ID: <ZHcoCcd5nugmWURI@Air-de-Roger>
References: <20230331095946.45024-1-roger.pau@citrix.com>
 <20230331095946.45024-4-roger.pau@citrix.com>
 <b9bd819d-93ad-d511-4602-8e3f4f515546@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b9bd819d-93ad-d511-4602-8e3f4f515546@suse.com>
X-ClientProxiedBy: LO2P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5267:EE_
X-MS-Office365-Filtering-Correlation-Id: c38e0ba5-41ef-46e7-b31d-08db61c5ce3b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hj/JPLFnzp+8S0qFDd/4vHW/e8DL7sP+Pp9xwO5GidTg/csv8zDX+dxKAEUNw6awsbF1ImJkivhl/zERHkg9RzLIOt9u+6Uc6VjUJLMRbTRbAR7wR52SkRVOcMOe8Y/Gh7HZgN19UnS7xy3qvh82wcKTvaqumLTMwxisqZv4Jakv/iJamuGwkL2rlX1vOuTCUSSdu0zwia9gjIKznRc29qveI1ED37F5pI3NrT0vqTSCPtu9VJUsh9MHura4PAA0XJKhTVKn2QlJON5A8ygd0lSBmOkOwtZI51XGqnkZ6HZ8TSe2h0ZmUwKZdKprFXZHK7fGb1OlxUNChH0vJWMCkjGrrVaPYw1SAn79e5MTxT/v05HFmgBGgits6BXDPxTPP6mGcZcN6+aWxl0QBi2JVE9SP7N1YMotKNi2t/6EYGowVhLySBKGv1SXfle+ESNqmq2MiyqIfRlW77hE4eDMxMtyeJTcTrZG4H+NyqigTeztAPCgbEGKAVVfk7yjzUceSqC7FIopdAkFS71z57xNSpqWnBOpORyoeiAvt+fxOS+RDj8zefGaGV0Scgj+rFYT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(54906003)(8936002)(8676002)(4326008)(2906002)(66556008)(66946007)(66476007)(6916009)(41300700001)(5660300002)(316002)(478600001)(6486002)(6666004)(6506007)(33716001)(6512007)(9686003)(53546011)(186003)(26005)(83380400001)(85182001)(82960400001)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTk5anVaMFUvYzhURm1CMGEwVmx2LzJ2d0d3ZkQ1VVE1WVhNSnRoYU1EblZk?=
 =?utf-8?B?S2xGNy9aRzI0RWxRWitpNXpsTzd5TlY0NEs4elNHcndOQ2l2TG5iejRFbTJD?=
 =?utf-8?B?MEtIQ2RiRTdETnB0S1oyd3VJWlBhWENyOWovQ1ViT241ZDlEU2hMRDRPYTg0?=
 =?utf-8?B?b2ZZQnpyc1o2RGF5UlZCYmFYRWV6VktnQldReWIwNHBWbDBLQ01CUjRDejJo?=
 =?utf-8?B?bjQ1b0Jnekx2eVhYN1Nqak5qT2FOK3RXR1FuTnFsR1lQOGROcnFLMXZIcHh0?=
 =?utf-8?B?SjdhT3ArbnhMcmJLMnNGS09ZNEphOEN2c2dPS0RsQ3cxVFlVVEs1V3dESktp?=
 =?utf-8?B?elVZZXV1OGtueVp5NHR3RUZpUEdCRkxMeEEyMXlZd0ZYN2dlRnBJMitoYW1h?=
 =?utf-8?B?RFdDT3o5UlR3SCthRXIxL1FRbDhjbzFveis3bThFWG1xRHZBc3J2NFAwQWxx?=
 =?utf-8?B?emZZMTVSRGhEWXNSUGNhOFBPbFZNTjA3Nm12VkpYUUVQdG9YQ0JmM1Rlb0FG?=
 =?utf-8?B?aVNTSW0zaXowTWYyNzgwN2I2NCs1bWJtK1poV3FtQ3NHa1hDRWkwWE9SSEVn?=
 =?utf-8?B?ZnNSL3BCTWxwSUJyVnAzWUpjMGc1VlNzM3U2djM0WGxMU3RFdHBMY09ESDNP?=
 =?utf-8?B?WGZTd3RoUXlaQWNndEN3MmhCVWhqcHZLUXZYSjUzei9ZVyt2QXhKTThCc1hn?=
 =?utf-8?B?dytYU3VYQU00TjFXVkpOQm9sSlYzSkIzVldQZEs4ZnoyL2MzYlJoOHBHRjh2?=
 =?utf-8?B?RW54Z0YvQndKem9PSit3eHFOaGhWN2FiRTk2SFpXK2RzUE9tTlJTTHl3M1E1?=
 =?utf-8?B?NXZ0RjZUQStYZWsyVnFKZ2JjU2F6Y29ZbzVRQzkzRGRYV08vd2RsbXRscjJk?=
 =?utf-8?B?ejc1SHUrQmVWM3VqVjlDQW9XY01wZUxmd05sSmZxMmxMVmhDMTJyb2UzT3M2?=
 =?utf-8?B?azFMQzdsekhDTnlYN282SThZcFJBQ0ozYUdiUFFxcS9vaE1FcVhTR3NlYTMy?=
 =?utf-8?B?RlJJTUp0dWEyZXA4cklHWWVYTVVxNVlWVTZCSnJWeFB1NEVvdTR5YUdmazlk?=
 =?utf-8?B?N1RiT29zWGdlZXNSUmJDUW1WOGFoZDB2Q0I0YzUyemVKMmJ3aGJBSnc5TENT?=
 =?utf-8?B?NGR4cVFSeDRuektqb25ETmx2N25wTkVnMTZYK212VmRpWlBHVHRvQ2lhZDdu?=
 =?utf-8?B?Tll3WUlmQjcrR1RKNmNhOU1YeVAvZjVqUXU4bHRqUCtyejBiTHpla2xHQTlI?=
 =?utf-8?B?alE1SDlqMHVOOENkaFJRdDJHNWhzazlXQ1Bna2RKZHF0b1lJYk1BcFFGZVZE?=
 =?utf-8?B?TWcxVkJuQW4rbExBS3l4YU5nekZpK0w1NlE5SjNQSTdrdktpTlRoNVUzZHAz?=
 =?utf-8?B?OEtqWkRrVGJtTkVJemxxSExwdC85VlpBUUpFMGkrKzlWSGxKc0pnQWJrelVJ?=
 =?utf-8?B?aEF2SWRGYjY1UkxYY1hNeURkbXUxWnEvWTg5RUpvaE1YTTkzUWRpVGZMUzBU?=
 =?utf-8?B?OE9jMWxDdmtXaXF6aGdhMlg3WVFRNnBYdW1GaXNtS3p1dGo4RzZWK3F4K1Z2?=
 =?utf-8?B?eklCLzRXQjJjWlNvK09WRVJQUVhOQUlPNTJPazcrMUFReHZxVExGL3Q1VzQ0?=
 =?utf-8?B?WTFHQnRDOGdIa3ZtLy92YUlVUFpNVTNWRFRGUUpSdy9QajQ2YlR0YmRWakQw?=
 =?utf-8?B?Yk01d2p6bkt4QXptVnVIRW9HdUdNMHJ1alk5VC9SRVJhNlZtS1VTaEQ4VGph?=
 =?utf-8?B?R1kzcmN0WkNVUVRHY01wWDBJcmh4NHRtN3lVZEU5RHpnalhIQWVMYlZRWThN?=
 =?utf-8?B?bFlXeXV1SWZVajB3ZURWMmZrTWF1dFhYYStGUng2QkxQbHpNRHAvTGtqdStz?=
 =?utf-8?B?MEN4U0F1NzVwRFZ6bUJUVkZvaHBpOG1RZHpIN2dFM2p5TFBvbHVGOFF0a0VU?=
 =?utf-8?B?SEQ4R1lDcHA0ZDRRK1ArRWNBNlNVMjVFVDRrZFV2QkxXcUFFRmQwVnJZY0NJ?=
 =?utf-8?B?cDNNd29Sc21ZMUJrR0gzak5tVGpxOHlYdEJHVUY1SlFDMEplclpDa3Q0VWlW?=
 =?utf-8?B?YUlrV1hoMEJUcWh0b3ZqUmNBdDF5akJIWGk0VndBUmhmSkZIWDNnN1dQaTlk?=
 =?utf-8?B?TldGdlNaOWtFZ0ptNk5nT0Zhd0xQMjVEZUxrL3pyZ2U4eDZnMkRQRXBoMnZH?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PYXwuT2M1aTkAqgiDEbQyotYLWBqO/ogzG/Sj4FdLAL4bKUH1usbWQPo1uRSKhxqDLXZ/upPeiVD9pWQI9v7UC6sSFfqoi4dSFkQk4sXpEdHOQ6MieuS5jTiktVBxQrfxepf7XxdxbGxTASgwnjmvKnJcNs7rxw6bQVXI63bRq1qsagzetAurvV2YCS+4WJ2oARs96OdHUTylfUu9EVQIknj9Y+vBVksrwuJyqmlBMHmzYzQKQyDu4tfnTuJVLKzMj/XIsHBnnob0wR3MFolrsfJxtWxH+djc0ZIRu4BTL4I/GG8x064RK6Cb7sWXq6gZqqqffTQDGMHFIBoPIgOIzjdCTm0JCsmEd9t0e2b52DoYDIcyuI4Ii5PCv43WNYxMkjJHjBKKVAiwb3GM6gRScae7VIGVliv9QmqofyfVF2ULrpOs3zeoWP8limQ0veRshVo+cT/KYLZSDyvl99z9WUin8PCeXd/9y/ktOmNh8D5Mppm+ig5kKnaBjD0ecf+KNDojhCpaGMjGyDTf3KI7OoYnxnk2hD1iYuRh134Yo5j0tLS6ekkOilImh9jlxygentXkju6MRJ/UCDojmNYfkBFEOTbBML5UUnvWbST3qfT+BiROiYM4PbObBJDTjzqnameuKC1OtvFkL42i8j99UkuftZjeetP+/xpZVgHdx1sAv3talKg+vsKgEWGbrklaFOVs7tSmk4ZWcXa+dQjckfyMrBNfbuX57ySsD3xD2PQ5DCU4Dc9XsaVmUkkKOEebYqsPloyGdv1+z5f66SwfjsXhMWKrD4585aFHlG+S/z9ZQISoVH7WQ/+piWajdZ9G4AF8xM/wub3PlUIBHiHKg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c38e0ba5-41ef-46e7-b31d-08db61c5ce3b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 10:57:20.3684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2hHbzKW/N14rWSPdgfG6kStw/ZAHMWJxw2f1kcD1ASPE8XcdHoveX/yMRZM1m16re3pRWgfdZn5jZ2uvWCn7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5267

On Wed, Apr 05, 2023 at 12:36:55PM +0200, Jan Beulich wrote:
> On 31.03.2023 11:59, Roger Pau Monne wrote:
> > @@ -887,6 +881,15 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
> >  
> >          efi_arch_edid(gop_handle);
> >      }
> > +    else
> > +    {
> > +        /* If no GOP, init ConOut (StdOut) to the max supported size. */
> > +        efi_console_set_mode();
> > +
> > +        if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
> > +                               &cols, &rows) == EFI_SUCCESS )
> > +            efi_arch_console_init(cols, rows);
> > +    }
> 
> Instead of making this an "else", wouldn't you better check that a
> valid gop_mode was found? efi_find_gop_mode() can return ~0 after all.

When using vga=current gop_mode would also be ~0, in order for
efi_set_gop_mode() to not change the current mode, I was trying to
avoid exposing keep_current or similar extra variable to signal this.

> Furthermore, what if the active mode doesn't support text output? (I
> consider the spec unclear in regard to whether this is possible, but
> maybe I simply didn't find the right place stating it.)
> 
> Finally I think efi_arch_console_init() wants calling nevertheless.
> 
> So altogether maybe
> 
>     if ( gop_mode == ~0 ||
>          StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
>                            &cols, &rows) != EFI_SUCCESS )

I think it would make more sense to call efi_console_set_mode() only
if the current StdOut mode is not valid, as anything different from
vga=current will already force a GOP mode change.

Thanks, Roger.

