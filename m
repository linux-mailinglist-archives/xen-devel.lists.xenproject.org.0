Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDABA7A645E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 15:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604684.942195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaRI-0001pS-VR; Tue, 19 Sep 2023 13:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604684.942195; Tue, 19 Sep 2023 13:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaRI-0001mi-SU; Tue, 19 Sep 2023 13:06:52 +0000
Received: by outflank-mailman (input) for mailman id 604684;
 Tue, 19 Sep 2023 13:06:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiaRH-0001ma-Fd
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 13:06:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64a8ca80-56ed-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 15:06:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7811.eurprd04.prod.outlook.com (2603:10a6:20b:236::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 13:06:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 13:06:47 +0000
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
X-Inumbo-ID: 64a8ca80-56ed-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkIp4wJn7W+jDtTcbzoCbkUh2aK7h23dzTYsmmCPMe1vcpBMF/YHdHyCOu8HI8w8Pau1Ye74+mrRFIXl6w6P5rD4fjeJgR6P108NBjds0tNeqj2ZsQWjP1uFWz/z8/MDtW+9RFpzck9TFEa7Hxfz05408k8u5nmMdAoROX3HN70t+yZDO1jAi6sERgTWxeXM/ueyPrfB2vL8VJZg+HzTZUMmfstzbZGPwSd2QkHDEEgTruac38bLzjlgcD7r1xa9XzSgwqrSYDhOlAaqfd5H9pzglC3uwNY/jQsrRG92i5v5b4y90sBDakRpLTXjUEEueAB1PcMMK1Tdpk04c1SH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVCEi4nIxHCoCedIiebXPjWYEiv/JkU3+hYP8XtVUBo=;
 b=InBqKqvcTSp5hrgwvCi9XBub78R9Qs4ey4qP4/CsvmLxflCBaXlVQz8ha6HuAI07pNH8Oxp/v9mUceqTZLCpzTCu7NI7dlVJKCIqAHDbhA1AODGowkNsNDBBNkhzc08yQyuFg9kfy/4bVAhCh540M98DE2Ef5lA0iF1gO+cF0JTs6VMGrQWh690etEodPnJOZLh9cWU1qzaAJwmVPTH2+3WQISzL4NUIDtJZc/gM01/FvXpGc4sJ6eI6CJp7HneZhRVh37NxEJzmTxF5Zfyt1X8P+crRsLAGeoHoAmvDJ03wMdC1mrU5J6sV+bOXzmHGIQ1mvVOgLH9o4U956Wlqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVCEi4nIxHCoCedIiebXPjWYEiv/JkU3+hYP8XtVUBo=;
 b=107/PM0Q94YVHajDOm2EIgZwF/KlgBZ5j96HLmyBr8m8oDqd71gM/ctYnmmisUY6kpCx0YFUoIC1WCkaGu2fsfX+r1Jl92ZJ9rrZQebSF7HERkmsTSJ0dsJaKyOfnJLejaicO4bt8HNfHtbONAfhnLnQXqYzl3E7ull2JjqnOSXDvRSTb5lzKJHXS+EnBcnmqJPhNxGIycnAuqhVr2LhgQkqlaG4xdbDhlO1KKnthv8AtcdJeKEreH30Poxevaa0g+lmRaq1MuQdulpFfylaCfrLIJalHDXyBYAQcrf9Q0npPyjRAbBYSUoUdH35H2nwp0ZKT21lWYBoEBpd8+UZdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46b0b9e0-29b2-d526-d32f-d03415e621fb@suse.com>
Date: Tue, 19 Sep 2023 15:06:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] console/serial: bump buffer from 16K to 128K
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230919125118.12657-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230919125118.12657-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab97b41-99b2-4342-2db9-08dbb91147ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oG9tmyN1kctK0IdL2H0e2RuGqa9fMYQ6s99JCsfnsDLlOFPLm3BFshQeLoW3h15+CoRn7w7j2XSc0AeKZUGpk9hyoq8h6Kg7QI7EUUuZjb15RDiK12cYdS4mr4GYy1chPVIFdD+hoKwIzEpBzLCPNHLThRB8zZJ+5u97U9F2DwR5I0LmKLJ6PD6sFzSeRnkBzlBABXJg8qWNjKnzBU0ZzMXWRxlNFXA6yWuOIkNXjqD30FMa/fOcgXQ25VTlrgnljl8jPuj3W6DtxeyevzOy/RHT2SBlLmBRxKY102XpbjOVUkF0CI8cCGN3/98ZDFCovo0ttq6KpwYmSBZhTXp3Ix1vchXlEhFYyNbcSKXBSqTzQFb5k/sCxugpi+PLEmWHrqYI9nCNwOt/jSyf5ETjy/FGoXkYVFkFpJ2oYGZn1a4c6L2LLQoEVg/unBbV8Vk2SxCFNa4nkrrHxS/SmSTOZtLk0Wo3xsj/CMVfL/SK2wzSIYn+aIDqbJ51Sw//ok1bJJsA92iKakKFHejVa5L5Vyi3bP0FKHdI5czJiDdJk6s8vCSrIrm3AXoVrX0MYOTNCvEZ5uDf+L7om3CyfQJVLTpLLIgmJUz4nHWEVf5Ho6/a/OtrYvXH52NmsU+P7LnvkQbXpVpU71aIcXVJlq2qMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(1800799009)(451199024)(186009)(2616005)(6512007)(54906003)(66476007)(66556008)(66946007)(316002)(6916009)(6506007)(41300700001)(31686004)(6486002)(5660300002)(8936002)(31696002)(4326008)(8676002)(53546011)(86362001)(478600001)(26005)(36756003)(83380400001)(38100700002)(4744005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1dkeGUydnJwSzhISTVlTVdjR0hYa1lkUHpFcFp4QVpIcHBjeGd4azlVblN2?=
 =?utf-8?B?eWl1eEFweUtlN1JnTzhwQVZiZS9MdnhBci9WR2ZVd0RRS2R1Ylh4bWdRNlB3?=
 =?utf-8?B?aldWL2d6SEpwUkFvempyMHMwQW9zR0ExeUxFS1NLbEJwSUJHdUlrZy9uQm93?=
 =?utf-8?B?cVc2d1AvRW9uRXRWdVluWFczenZRdlMwc1h5c3dZS3JYTHRoQjBXL3k5SEZ4?=
 =?utf-8?B?ZlZvNE5CSTlwaUtlNS9vRlZOQ2hEQWVsY1Q5U0NRS0Q2dmdjUjdiZ09IQ3Vz?=
 =?utf-8?B?a3R5aDR6T253NWIzaWw2UXJYVjNrT0IzSWdGeXFTK3FKNy9RSHpMdEgrYW0x?=
 =?utf-8?B?K1Y2NU1sU2tTUnN0QXB0TVhtdnlmc3ZibDJQUzZuanYrQnpQc2dyMloxc3lO?=
 =?utf-8?B?VlkwdlNtN29FUlB5M0xrUEZFMjBENDcvUTM1a0xIZWtxZ1d2OFhodHE1TzVr?=
 =?utf-8?B?VEZpeFk4NFUwUkNVSlUvWDJxWUt1NGN4OTVOQnBlcXdBRmJSWFFhMC90emlT?=
 =?utf-8?B?bktISklwLzB6WVVWS3Q4cU5XdGtYOERyVk45am15a2FvSkJwWmxuWTNBV2RV?=
 =?utf-8?B?R0srVDNXbDVmajBwNStqY1NicUYwM2JLL0czekxEcXJYcVpYRzVMWWxaZFYy?=
 =?utf-8?B?K0NxVFR6Qk1LV1FkanZXU0xwY3A1VHM3cTBNWmViU3V6NkcyeTlsM2d3d29H?=
 =?utf-8?B?OFhxYzZxZENWUzB2SjVMekdaVHVDRUF5WFV2b2I4cSszcGQ0T2NFY0Y1TTNG?=
 =?utf-8?B?QW9LSEQrVVJPSUo3TWdiczMxQlI2QnI5Q1BjOVNFdmZVRDlWUUpxSU9xbVd3?=
 =?utf-8?B?YmtpQ3h2a2MxOFBDTndPdXZ3WFNFaUdUdFcxdzFHbEtVdEsvNTdxWkNRaHds?=
 =?utf-8?B?bVBuSGc5emZSc3NzWGh4dzlyUDZVYlFKcDV5Z3ZzL0NlTDk0bUNrQXk3UFJE?=
 =?utf-8?B?cXlSeHNjTFQ3NGJoeVZaek5QMmpSMXZiYXNYQlc0UGZjdFRtcEx4citrZFFN?=
 =?utf-8?B?SjhxOHJrQkZvSXBZdlFNN0NNSDV1RkxEUndNeTlNRWh4eHRSVFNmS1pIN3kx?=
 =?utf-8?B?bjVUbHFiR1JNaWhBNE9xenlVZnlyU1dwQzNjdXNOODV0YVpnMmdMc1AzMGdS?=
 =?utf-8?B?WlBhZXB2OU4ySWlQVDFOR2YzbnpEdFRTYTQ4WE41cFE0bExuVDhRaXRMZ2JR?=
 =?utf-8?B?aHBPUGlRVmFaZmdYOFVmR3ZWRDRhclMvTzJxRldDUHJBbllqRFVkQmZnczQw?=
 =?utf-8?B?azBidHBSOXZwZzFJYWIxYXp3dUgrTnN4eXlyOVNuVjNKSmpjVGRWbE1FL2FJ?=
 =?utf-8?B?aWdyc21Mc3ZyYmJLZGY3QkpiZnRGY25PVmNVYW9BWEgxVmJ4L3B2dTQ0RUha?=
 =?utf-8?B?Yk9SMWFrdi9RT29VZzNSQjVyR3N0RzV3c1RLc3I0dmhBQWgyeVRqcTRxamJR?=
 =?utf-8?B?MkYrVmt1aHdrNzB3YWd2VWdqVlEyeTVlaGY1WEVNRWJRSnJOVVJoNDZrMmFB?=
 =?utf-8?B?Q2RhWkN0L3lOamVOcUJuS2s4aVM0TlJvdjgySnkyaFNmNzJYNkYrMEpPM3U2?=
 =?utf-8?B?ZmdHZzVhQm9KaVpwaU84RkpndFFwMlEyTDdLNm9Gc1hHNmhkZ3RtVStCOHZ2?=
 =?utf-8?B?c2xzMlJUT3pQcmRjSWVJZ1IwZ0d1dVN6clJCc3pJZ2pFMG9PZ1lxR0dTQ25D?=
 =?utf-8?B?WlN3NTRKMWRxbnBibHd5bmF6VTBhSW5VZE5rSm4vNFZhOXd6ZjNGL3dWamM0?=
 =?utf-8?B?T01MUWhuWUIxOEV5WDY1MFhnMkl0MFlwT3VLNFZLK3d3aERvb2VRbUFuK2VQ?=
 =?utf-8?B?REVPdEh3cjJpODEyaUJKNTlyMUNydnlLZFBzRUZCNTFYRXZycmQ1YUZzYkxh?=
 =?utf-8?B?c2NFVE9KQklGaTYrRzZ0WStkL1dmcVU4UFFTQXNoWSs1cnRZbTlydTlPdDcx?=
 =?utf-8?B?azM0TzQ4RFlDVVZlT0l3NlN4R0JBTVBWeGJmUEJVbGw0OHgvMmdTclNrMlNY?=
 =?utf-8?B?cldSZXNZS3Z3aCsyNzIvMm5Oa3lrNmIwQnlPN21aY3VZZ3RxTTg5VVpFSXlZ?=
 =?utf-8?B?TE93TGE3aktqY1dPQ0xXajgvbm00aUZCMWtKdWlWRkZJcnB1VDNEN1g4clNj?=
 =?utf-8?Q?OEjnMNF+jPp5xkvWnUp5sW4+a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab97b41-99b2-4342-2db9-08dbb91147ef
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 13:06:47.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fC11jI5Hg0FqGHD+B5A7DI7ZjMRLamA3KAaFsC14XkHIB9AHCQVD+4EYfXqNUAV+MAf6qNBjt3CWxweIJ/k7MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7811

On 19.09.2023 14:51, Roger Pau Monne wrote:
> Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
> being filled halfway during dom0 boot, and thus a non-trivial chunk of
> Linux boot messages are dropped.
> 
> Increasing the buffer to 128K does fix the issue and Linux boot
> messages are no longer dropped.  There's no justification either on
> why 16K was chosen, and hence bumping to 128K in order to cope with
> current systems generating output faster does seem appropriate to have
> a better user experience with the provided defaults.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> --
> Changes since v2:
>  - Bump to 128K.

Wow, I was hesitant about 32k, and now we're going all the way up to 128?
Even the recent report indicated 24k would be fine there ...

Jan

