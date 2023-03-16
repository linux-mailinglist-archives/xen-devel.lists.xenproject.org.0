Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E9F6BCEEA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 13:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510534.788348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmMA-00037C-3m; Thu, 16 Mar 2023 12:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510534.788348; Thu, 16 Mar 2023 12:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmMA-00034m-0e; Thu, 16 Mar 2023 12:05:18 +0000
Received: by outflank-mailman (input) for mailman id 510534;
 Thu, 16 Mar 2023 12:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZp/=7I=citrix.com=prvs=432965e83=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcmM9-00034e-6T
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 12:05:17 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cebf0072-c3f2-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 13:05:15 +0100 (CET)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 08:05:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5407.namprd03.prod.outlook.com (2603:10b6:a03:28f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 12:05:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 12:05:08 +0000
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
X-Inumbo-ID: cebf0072-c3f2-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678968315;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=90N1fiKTxDs/pneAnOmQMQjwrXO2CJJb/pViRvwyGiw=;
  b=bmVVPPH3s+qZZNvIlV97L+3WYV0U+SXwURymACnGPQJUkMVI9HqN6gZ7
   kNeRtP76OHShHGEyd/aXXHTA46Wa5Uws91cPCaDjELl8fxKvGYQm/2sFt
   44HD+Mrj5SZK1AdPv2Xo3Xi/1tFbvf8W79qdAADYMnV4k3rLkc2G2nCSn
   U=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 101013119
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gJ/GgqiGMznEQl3s01OfAvwtX161UxEKZh0ujC45NGQN5FlHY01je
 htvWGiHOf2OYWPwKIgjaIuy9UIH6sOAxoQ2GQo4/Cw3Qygb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5waAzyd94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQGGBINTimgndm/ybCjc89lns4Na9vkadZ3VnFIlVk1DN4AaLWaG+Dgw4Ad2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMpluG1bbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXhrqcx2QTCroAVICMLe1rjkfmdtlKnYsNOC
 koSwgYyjZFnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQ10
 neZktWvAiZg2JWQQGiY/62ZrhuzPzYUNm4IYSIYTQoD7MLnqYt1hRXKJuuPC4awh9zxXDv2n
 DaDqXFmg61J1JZWkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshXZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:NCP8qa9qyUNSODcnxYpuk+GPdr1zdoMgy1knxilNoENuA6ulfp
 GV7ZAmPEHP+VMssSkb6KS90KnpewKgyXcH2/hnAV7CZni5hILMFusSi7cKrAeQahEWmtQtrp
 uINpIOfeEYbmIKyPoSgjPIYOrIqePvmMvE6ds2jU0dPz2CAJsQkzuRfzzrbHGeMzM2eqbReq
 DsnPZvln7sQ2oWc867b0N1L9TrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mAryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczEgNl1mpDo1L8Zqq
 iVn/4SBbUp15oXRBDunfLZ4Xi47N/p0Q6+9bbXuwq+nSWzfkNNNyMIv/MRTvKe0Tt+gDi06s
 0kvgLp1Os0fGqw5BjV1pz1fCsvu0qvq38rkeoelBVkINojgfZq3MQi1VIQH5EaEC3g7oc7VO
 FoEcHH/f5TNUiXdnbDowBUsZyRt1kIb1m7q3I5y42o+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4XY46MImKI32IRQiJPHOZIFzhGq1CM3XRq4Tv6LFw4O2xYpQHwJY7hZ
 yEWlJFsmw5fV7oFKS1rd522wGIRH/4USXmy8lY6ZQ8srrgRKDzOSnGU1wqm9vImYRRPiQaYY
 f+BHt7OY6vEYK1I/cD4+TXYegZFUUj
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101013119"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pf96e+BSj7Hsf1/V3+0NYuKoxHsYwAen9I1WtzilY80ifGLzdKYuGdmlccpkdwLi8y8pfEhsKTSY6kqFtvfcJxBGllAZEu16+tUhKXVBoqGb/9pmad2IxtZtqQTCuE2Q7M1gkD58xUm6uJBi71JqcbzjwPpnnA/YSe6p6rh7Kg2f96IF6AiKVU4uzG3zrLzA3TQzjTZO+l1oTEqJpWA686wJylrLlHPS6BlQRkeKgQDbFw+1oMPZkXyASnOlzR0pIFFJkE9kPIND0Epa0VnjfogB75dtQsVbmagY691qnW4HibNxEL4wjJVDvP8i/XT6DZeqkDfpBJtrq58TCDDz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+DCcc336ExMdTOny7T7rY3WSVI9zNpdaF0NdJx5JvM=;
 b=MklIslCR3k/1fYHVx2l92MxaeKXw4/G2BqnHm498YZeh/4jgvAd+iao2zKMpAGWDmEsYblzVVPwLdt2Co5NYwJ7FH+wTCxL5nE6I55IvshACf5ooEk+ScUl/6Sq2NALogKpYHzSjpT1J72is45WMBC143k3PlzcAP9P4BXgnZo1i+m6eK7HVqtpiKa3Wb7L7Sv4yGV+pyOTMW0a1UVm7yxWyryW2FvSBb8QLNL7oXTKfuWx7vV+UWtrpPOiBkVg3IJROfDcUivus8xPysd+A+KeYtETIfSNmipqhT2amWlw7ngDDwfYXlBlvBJP63eKWTTSP75SkkURgzgPP3GVAOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+DCcc336ExMdTOny7T7rY3WSVI9zNpdaF0NdJx5JvM=;
 b=KxTx97HxEfkBriKPPDpJJicZD2jtdIZsseCpepyCikc6gFm+A20OAprs3OozLUd5GHXdP0s92xLfqc4S6HfgSftNOmtG/5vnEtFy5vS/0H1uZclbq/By/yu+l31On2MGv4evzN7wy2niWgLHjM+qFlSWnvc3wRFmtQVjIaVNTGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <60df98c3-8f92-e213-2653-67eb829b2f37@citrix.com>
Date: Thu, 16 Mar 2023 12:05:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/7] tools/misc: Drop xencons
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
 <20230314141520.3652451-3-andrew.cooper3@citrix.com>
 <f82630fc-0a45-48f3-aafb-6b96af287652@perard>
In-Reply-To: <f82630fc-0a45-48f3-aafb-6b96af287652@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0494.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5407:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d0e09d-f86b-4a51-147a-08db2616afe9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gnsiEFAsE+O3ah/y6IRbBQ1vSj3y3OCKRi8rxXlXycd0Z9ZLem10zDb9N2nW/0muEMQgsUNvb3RPZcup+Xv4yZTa+qTU7kNR27FiCckDM3prJ0H3ek3+hbQU80grRII634qqJPxaVxKEteKn9U0iNX0Ug2CRZvz/+M0x/+mFgdpDQ8YNlazCSIq6FPnIxtiF2Rvpcf7RtuZc/abcVITSwkvCNLOye9SI1KogAQ+vZEcxTPVM22V8vhMIjcpdbboT65erBhsbr6gQUKsqgDdVHNqB++nURWPHYcCKlw+RjMfg/+0oY7waGc9blU9Qe9ofgahEQmBl/R24818Dm85AjC3JNz9gZ3thVOOGn3upTRRjGSQ+1DdRjkOsJDYUWO57CfhZIoncEK7OoIPdmS+2CRiHEHniBz1jAu6iV39iLfYyAxJxRKUFJVg8henmOXUQVATlGTTzxwil+zeAdDGlMmH6fuelMJvP0GuRECNfFRitt3xG7cS7+dJ8cYRQY+//w2T1D3ACMp22kr+y/jMo5Nwa+RJAW2hRJ109roWP+BftIY7EOMiVtI+QQ9EwDUidbfwpCHr5/m41CVrkxhl2axc5OVeYy65UyngkGzcFeAA71PoEgHuN579VJ3+D4ZI4e5oyhpARld9f0U/w2mcYtzmvmocYzgdiOlOv93Uze94K+8CqMaD9iLNO8qMR3lugw6IztvlzAQV5g91KAwIG16OLVbUYbvKQgLsUHdxpnMI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199018)(6486002)(8676002)(478600001)(2616005)(31686004)(6512007)(6506007)(83380400001)(107886003)(6666004)(37006003)(53546011)(316002)(6636002)(54906003)(186003)(26005)(66946007)(66556008)(66476007)(4326008)(8936002)(6862004)(5660300002)(41300700001)(4744005)(38100700002)(82960400001)(2906002)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkJkNysvb0YrRmlCNmJnVURIbFdQMkZIcVpxWSs2UUtlYkdDdW53bXoyaEFY?=
 =?utf-8?B?eXdHZzlNTlI3eldjM3Z3QzM5dlNoRnRHTzNld1VRSi9Tc0htNmh0YUFneEha?=
 =?utf-8?B?TW8wVVB0M0t2QitQckNGd3AwYU4xTUdIVXNUT0ptRER4OStTMjFuNjNKK0gz?=
 =?utf-8?B?VlZycXVZb1M4SnAvMWdWUlFudEZGUmJZcmRpWk1sR0RiNm1yMmJRVXJ4S1dq?=
 =?utf-8?B?UTBZWmMrY2NHVlovMzdRazZOQURKbUUrKzBLbmNTR1FZUUZHOWhkVjhrS2U3?=
 =?utf-8?B?dmRuU1UyRnlWSDI5eVEvcTN4ZUNTTXdpdnJmQThNMzhQWEgyMXZSV2ZTU01L?=
 =?utf-8?B?SEgvTUNsaHcxN0h0Wm5IZENzdFdtQUlBYmlFWGRDbWx6TFlzNzV5N3Y3dkhF?=
 =?utf-8?B?dTZuaVViSlFOWkh6SGZEbXRlckVFWlJ1OEsvYXlCbDQ0RGZhdCtPSUdXS04r?=
 =?utf-8?B?QVJpYW5BZ1JiL1NYZ2d3bWpQRE56YVVlUERQNFZ5VEtZV0VZNXBJcEk1SzRn?=
 =?utf-8?B?bDNBbkxnWmV1alg5L3NxSzRkMXhkVzBHMzlJbU45K3ZCMTdlVlB6cURCVEpN?=
 =?utf-8?B?WXoxUnRHWTlhS0FROHVvTTRaeGVmRi94a01oMk9mQitNM3JoZWRBNmFhWW56?=
 =?utf-8?B?SHBkSDlGSVEvNWhqN1VPQWZhL0FheGY2V2xJcnVWYUtuQmZGYjVGN1FNcDdt?=
 =?utf-8?B?L2t1U00wVXFSbVpFYlpBU3FXL3lCVkRsNmM5TWhCU1Y0T3NlOCtJQk1POWo4?=
 =?utf-8?B?bGVoa2I1eVZRejBQV2RrcGhzMTFqTllNMXJrNDFwUktrK2FOR0hRb2tkSDQ4?=
 =?utf-8?B?OTQrUldlcE92T1k5NXFPWU1URlo0YWFUcll1UktIVjlXMzNWZXJrVXkyelJt?=
 =?utf-8?B?blZnYk12RzBHMVBsNGgxN2JTNVpuVFdyUWFsYjc0THZ2QW9qd0h0VDRKWXZ3?=
 =?utf-8?B?bnVxZHloamQxTnZRaVNtdGxMZmNOMG1FUUMweE01MUY5NXM3VFlwVEVPMHNa?=
 =?utf-8?B?bjVrYlFyQ1pXSHRZNWV5MExsZE9IeTdaNXZZZXVnWnpNUklYTUxuVzUxREE1?=
 =?utf-8?B?L0d3aldycDF4cmxaZGZZUTdBL1RTd21MZzQrYnRhUkRzSmFpR0JSYnJ6Szho?=
 =?utf-8?B?aGhtTUlsYnhReGwwN01jL1piZGJlRjhXTVYzemRnd2ZhSzB0SDlvc1hhT1B0?=
 =?utf-8?B?dUh1aGRKYlpQM09BdkRTMkl5QVBsRjZha0llaHZNZER3YTkxMzZ5dlh3dm5i?=
 =?utf-8?B?Znk4azZ3SFd1K0E1amRMYzdiQWc1NzZWNHdxQ0U4RWdPRE50VWZkRG1BOWFZ?=
 =?utf-8?B?bTZNNWtxNEQzK1dwSHExTmExeU5TZWJQUHlzdmt3SFVHSi9tQ3BlU21LVXdZ?=
 =?utf-8?B?NnNVd1FzK05BYTBkakdma2pwTU1ESzBNMFRvMWpSVTlzNXAzS3VhQnFUdkNN?=
 =?utf-8?B?SjBwMnJmeGZVdGdmcWViVGx5eHE5bDgwNmxPOGdyZlR6eU4xWng0SU5WY3NW?=
 =?utf-8?B?RXRISStkVzNJZm9tY3pRbEtKRkh6cEo3emMreTM0cm00NElzd09seVV3UHZ2?=
 =?utf-8?B?dmVEbUE5RDkzYlh1eG1BT0hrT08vcE93S2lKSHNVQjBEcjkvZFV0UXRXRzls?=
 =?utf-8?B?eDJlNjUzZzcxTEFIbmtPTE9aMjlJR0FmOW5YV3lvTkROcFhUVzdPVXV2bEwv?=
 =?utf-8?B?N1g2ZWV1L3hDOVZDeU1KYUFaZldNaSswNjk1NjFsNjRBeWJGUzdqbzlEeWpx?=
 =?utf-8?B?T08zcWdZNW45Wk5odmRoYzhJN3J6eDgxZUd2Y29rNUlSQkd1d25ZVEEvcEM1?=
 =?utf-8?B?aWtCcEpIVEVabW1PcExIUHlHOWErR29Gb2NBcGp4bWpQYW1LKzBJZHk5UmZH?=
 =?utf-8?B?ejlnM1J5UW5OOVhqRnpmMmpEcXBSZmxUblVvQ3hWZmRzYlJGV1hOTjN6ZzAv?=
 =?utf-8?B?MHo5M29uTmVRUFNIWjdNVVVnbWIxYzZkcFZQQnI4emxWT2RvZmJ4aGp0Z2NS?=
 =?utf-8?B?ekFsTFJ1WHRjcktKSjQwRkFTWm1jWHhqK2hLT0JTcGtGVWI5MWhxY29zeHg2?=
 =?utf-8?B?ZWEzWXhUWmM1N2t0STVSbmhUa1BTdjUrdGtuckxobDltd2RZbHFINkJGUmRw?=
 =?utf-8?B?ZklzSGJTcnppOTN0Z3dFN2pYRlp4N3ZpWDhPTmxPSjRUYkhrUVBGTzMraE1I?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GIe5iL9OTROC6gesndU/9oa5RWsvABzZFK90l2OU9SAYsjxotZZCxzUYO9lQNdv9/WMFilczE09WeDOqc0u8w9hfuKLeIAp0F9NnCuvyuJUluzRjK2Izq9zSElESaJYg0ZcMXyZaXdOYmprxRRF2Dc1GRKMtsQxuh5CCE6vX1EGH68UssjBB0n5c/5bkzV22ck/elhfSYzQFatTJbn8VmcLu6cFU9rxSwhs0KPfCymcbxcTxmqstjwJYTFdXbAiZFPnF+CI/cPaD/dXLX5a5+bHbw/LgJdejk01idG02r9/g27NiEYwOPuYSRMzLKYcZ8OCS9ssw6UE+hxNM/PyjSslHYcwabW/vmOZVi7pe1sYiGSa0xE4awIFeyvAM2ywH6HMi/CHoqWuNbPiNsE4JKxdvcVvidYpVuzZc+pz0iYauKU4jWQdrPjRxPKQEbCHp799jMluZG0zpqICoQgL7Rom5RAzXjsm+IgZYAoVcFKsLSPqLfcNpYUi6Mvlh+ZW0KJxPKkg+MogTTRL8j7gKX/McAd8+XFKpRATm5YnbKTvsajO7GOLLKRGyL1WaFSRj02RETSzbp9Gth0T2c1BYvjHxWlKSQtKISrJUlLNS6cEWPVq+a1ZixvXoLSIV22kJ6rToUL/+gBTijzoVexZ2Tv0ZYGmV9MIhVmATQmFEGWPrco5pCm/VghaM+AiubBJ/xg+W21zNeo9C3IA0xbAYXDAJ9RDwQnoySH5LdI0yVo2gBF3TLryxZ4eqzPYg3zXfzrk02Qqfp0tLbZgqdXVyvqP3naxfrJX1ks9T6jbelYHo9fQ8srmTTI/awaXE2MlA5xAYGoIi33RFzTHxkRni/CM3IPg6WeQP0kV19hloGjw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d0e09d-f86b-4a51-147a-08db2616afe9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 12:05:08.8137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMXLH6KGK7hj/3toR75SUgw5Zz+eyROben/S9+PQ/AcXdfv+DoZzIXyBkqprvoRm0faCX/AFofOa5zRkQm5Y5A83AAsFt6fy2sni59HG0FU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5407

On 16/03/2023 11:33 am, Anthony PERARD wrote:
> On Tue, Mar 14, 2023 at 02:15:15PM +0000, Andrew Cooper wrote:
>> This is a python script which has it's shebang modified by be python3, but
>> was never converted to be python3 compatible.
> Not quite, that's the original shebang ;-)

What I meant was that INSTALL_PYTHON_PROG turns it into a python3 shebang.

I'll see if I can think of some slightly clearer wording.

>
>> The most recent reference I can find to this script (which isn't incidental
>> adjustments in the makefile) is from the Xen book, fileish 561e30b80402 which
>> says
>>
>>   %% <snip>  Alternatively, if the
>>   %% Xen machine is connected to a serial-port server then we supply a
>>   %% dumb TCP terminal client, {\tt xencons}.
>>
>> So this a not-invented-here version of telnet.  Delete it.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

~Andrew

