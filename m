Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01056F17A2
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 14:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527291.819758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psN8U-0001EM-FL; Fri, 28 Apr 2023 12:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527291.819758; Fri, 28 Apr 2023 12:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psN8U-0001BS-Bc; Fri, 28 Apr 2023 12:23:38 +0000
Received: by outflank-mailman (input) for mailman id 527291;
 Fri, 28 Apr 2023 12:23:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzbF=AT=citrix.com=prvs=4752babc1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psN8S-0001BI-QJ
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 12:23:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dee6d28-e5bf-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 14:23:34 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2023 08:23:32 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4984.namprd03.prod.outlook.com (2603:10b6:a03:1ea::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 12:23:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 12:23:30 +0000
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
X-Inumbo-ID: 7dee6d28-e5bf-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682684614;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=c4g8OMBQyK2XZl71iDoSI61NhSymN4enTpC4Vy8hndo=;
  b=Xkmmb8B/ewBK6JdzvGRwJrQlXY6YcxHLZmRy3vuyegpyMFXS/kBJWHJi
   h9qnYdMtgm5y1B/D2XsVI8lFnd439/xiAOhqPZVb5V82n/O5yEsTPLR9u
   8fS6VHvdyejTw/UJ4aFJDDPwZbwjm3AFufUkVRTUC74/hDSfUtQJ/8nvZ
   M=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 107101978
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1Cxm3aiKyDFNLP0RBI8wgWFpX161phEKZh0ujC45NGQN5FlHY01je
 htvXDrUM6yJM2SkKdF2Otm29BtXvcSAydFmGlRq+CE2Fnkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4AWOzyV94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRDBmgcXg2Zu96S+72ZSM1BqON6cMT0adZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGyb7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXnr6Yz0QLDroAVIBIPVgqdr9mEsHavS4pmF
 GEep3UHladnoSRHSfG4BXVUukWstxoRWdNWH/c9rh+Ezq7Z4QGxDWwDUzIHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTTAAZRsI5Z/kuo5bphDAVNF4C4auk8b4Xzr3x
 li3QDMWgrwSiYsH0vu99FWe2ja0/MGWEUgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvZ5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:xZF+g61SaGs2ggy91qttmgqjBIskLtp133Aq2lEZdPU1SL3gqy
 nKpp4mPHDP+VMssR0b6LK90ey7MBDhHP1OgLX5X43SODUO0VHAROpfBMnZowEIcBeOkdK1u5
 0QFZSWy+edMbG5t6vHCcWDfOrICePozJyV
X-Talos-CUID: =?us-ascii?q?9a23=3AgJcRuGr5J3lQOiboZNIGDDXmUZsLKmzt0W3sH2u?=
 =?us-ascii?q?DBkRrbJC7bgbM9bwxxg=3D=3D?=
X-Talos-MUID: 9a23:vgRhYgQ4RU/hrxKLRXTjnTIzEslI3p6WGVBVqKorsZTbHBR/bmI=
X-IronPort-AV: E=Sophos;i="5.99,234,1677560400"; 
   d="scan'208";a="107101978"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nH+qUEsE+oI+W1qNFdJosl5KV/CLYfMyLnP+eIACX9+G3aFfkBFFdkKIFHsestvXBdlBV5+nSVeu//QwDizj2Cy7RmVYoxnipWH9r677k1lzkBrbuaD+dEKdCsYe1ZJ6n/v+ANocqG3t+kW4s8+heRRJ6i+azZxu2ET6oRE0Nazpt5HC8S++Blm5Vqxxiu5zixJt/+2KpmWyFmtmYyvwH4iByEd2VT5GkLZE5JBeAsMoZA4g7lG2ZAmfFiYdNRBG2lkIgPnj3JsQsQVxuaPZpSwmkJ2o8xmAd1yatofWR5IL9R/DBMzB9xHtjoNw1ZtggNtUeMxCWPnTHdUST87jlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFWB7fPYNURP88i6cGvb3OG8iyV8YeJBR9miWlCarbU=;
 b=OVxUmvvtLVmCmU/4A2p16cPe5RnvK29gh0KGfstItOQBX3IaRfK2vHLswarefXbkVxgLVbV6pop+2S+XN6tCz1uFu2CWqS33xtwv0ItIMlTFFWoZvtEsQAtXhh+FmuMLmoiCRCxzJij9/zKUclQHz4vNthapGnjknMbQx0Z2Wnsi0vwwJh4xxLfl9lzs5842GbiUR1m59K/4rvHrAk4nJ1rfRusq88IkpphrMixPSVeY2pv7UIHxAmfzQitoxc0z6oj0XxDEPBMEFS4FVXJhqLv295aKQQs+wVR2uZTU0MSUOOhgEBSNjvf2CI6Z8B8qITVC3OdVqDsyQRmiRAzf0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFWB7fPYNURP88i6cGvb3OG8iyV8YeJBR9miWlCarbU=;
 b=fRVleyHr3CfIT+qIPBl7/6hGHmdnGkSWWFi8NzkeeC7G4v5iBH7cnJR7o3nvie4A0yg68YQJF17fRs9hhGUfllP5dXFNpka2b49hp97YmV0tNWW5vQ9z79+73up5HBnbn4WW8HLT8zV0dDxmBnOjeJ8UErMruHx/ExAZ807YlT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b67921bf-032a-8baf-f2aa-0776ca5b085f@citrix.com>
Date: Fri, 28 Apr 2023 13:23:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/7] tools: Create xc_domain_getinfo_single()
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
 <20230428104124.1044-3-alejandro.vallejo@cloud.com>
In-Reply-To: <20230428104124.1044-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0047.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f414bb-34ef-4762-5cb8-08db47e36005
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uWyQQfXLJmao5E2ItMlyCe2/B9ZS2mXdIj7gV02VxrjvQIkD8btDvQbA0CWdUSP/SmL3gRic7DVTPGcHorxXRwGJbW0TaXRKGuyUxVA7cy3g0kulGl0GdH5TFFs2DIqzU5s3ZFBrHusLdpfdpUpgm4zqoeTaw0hqzRiYbtVLQ1w/INtnKgaku9yzJEP382XYwHk/T/mMk2aFJPPjqeIM5m5q4aYOJdf8Zo7TfRGDdIZxFMJI3bcxBa7fW58G3K/QS9IiX5R2t/sRctRDxEvUEUAMMX04T0ua5Ac8Tg29RNgj2+jax4dzVFHMndbFsldiTV2mT4k9BL/JT+cdzIYPsdEiF5agQ5rdxySqg3ZDVLE6H5Inwe3FeOWPPXC6WztIMt6XgA3Zbq05nU+YCkJc/G3w01VjqueZuE/cOSW2dTs8nA8C+MwY+HZpmJ/tGpBdCOe13LcjqYz/zEXobp2YZRR31JVWcxHIyCiNpesjyn+58Uqje26DDbg9TrJixXpnTJkZQG/9xD+xiPMAEfFpZnwGaHJh6QUgJBKkfQuDUH6Uroe0/+LOwyTV6TEC+fQRLqMaiqFFULYto861eDOwKb0haOT+7rYJUF1YeYtsAt+VDxMDUDPn7bBJVbk/av2Z6ZMn/pWyKyOIJOC5VfOWQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199021)(478600001)(110136005)(36756003)(38100700002)(8676002)(8936002)(54906003)(5660300002)(4744005)(2906002)(66946007)(66476007)(66556008)(4326008)(316002)(82960400001)(41300700001)(31696002)(6666004)(6506007)(31686004)(2616005)(26005)(86362001)(186003)(53546011)(6512007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnRndGdjazRtaFU4VmFmYkE5QzVUOVFnblFNb09FenFzK0pudUdDNDZzV2V4?=
 =?utf-8?B?dU05VW5ZZERxeEg2bE9yMjAxZVNYcGlLNC82eERFZ2FWanFnQlVCSXQ3ckdC?=
 =?utf-8?B?MTFkZ2k3Z1VCTVZONXdDcUluV0hucy8rTm1mbkFHVEhZVzdqajNrSHAzY3NW?=
 =?utf-8?B?RXB5VFRPT1E0ZTZYVUpya2dNNFJIWVd6VXIvYUtUek9EWWhzcVFBQTI4VkNQ?=
 =?utf-8?B?azlxK2NjNm9pbWpJNWplbHFrWnJZNFcyZFZiM0dpMkZSMmsyZHZQWWFoT1Y3?=
 =?utf-8?B?MGNxamNBUnFlNmNYSCtPWUYxMzdMTUV4bGhhb0h6ZDljZDhNQUJJRlFmeUxl?=
 =?utf-8?B?UlNwenAya203ZFJQWjgycHpXVThMNlRNOGF2OE9pMS9hQmU1cmc4RGR1TVp1?=
 =?utf-8?B?c1VoMUQ3S1FSUlBSZXVZQUJyVDhGTjRFWlUvSVp1bG5JTEwrZWZ0NGo3YVVv?=
 =?utf-8?B?Y0lPNHg0dFM0a3ZRRGUraDVPamVqU29QSGNkWmdSS2pzWmRmbkdDUU1Nd3FJ?=
 =?utf-8?B?Y2lNd2dsTVRiUWRxamJMM1ExYWdDajZhNTZsNEwzNHZ2ZDhrTWg4M0krTXJj?=
 =?utf-8?B?QThEY0xpRHhDNEpva0tRekxjY0ZFVE9kTmV2TmFmc3J3YzlhWUFNdUZHb2JN?=
 =?utf-8?B?U1NwMVU3NFhDMENMSEQrcXN3NGhHZTlJRHdiZXlMendNOWVKLzN2dlI1bDYz?=
 =?utf-8?B?WnFscmdtSVVWMG5SUnZBaWVISGpmcDJDaG40aHpURG5ENm9pK1p5T2tkWXhx?=
 =?utf-8?B?ZlRQazZPdEFsT0h0Rml1MmxBbFhHWjJkNVRPNUNLK0NVTEUvUFFDYjc4RU9y?=
 =?utf-8?B?cmpaeHJrWWNERW5mbTdGZ2dESmN3TWxOdS9OeU93dGE5UXBmNUNFVElWeU1u?=
 =?utf-8?B?TXFPSVdJR1VsZU5EZmdnNWp5cnpzZ1JjMEMwVCtTN3ZESTRaK0gremNwZGFy?=
 =?utf-8?B?SFJyUnlSRHM3Qk1CdUJIL0FOZVFRTC9RdDhPbkk1TEI4cmh0QW1XTDRlbGlE?=
 =?utf-8?B?T01JdWpudklyWktQWFBWNDVQV094YmtWKzkzKzFXRzl6VHRUZmZkV3NpVlZ1?=
 =?utf-8?B?aC9LaUJFUXkxVkpFMUxTeE05YWM1WmZMK3gzMzBhZXV4UmlFaFUzWEVxNy9w?=
 =?utf-8?B?aDVodGx6RjJQaXIvVzkvTlBjaUFtNkhTU2tZL3ZBTXRrWXNlOEVqemVOWE1k?=
 =?utf-8?B?NnlxSVdzSjJ4NW01bzkzM1IyREVPeE96TmwyeFUrRzNUdzhrS1hENDJNZVNa?=
 =?utf-8?B?RUZvYUV4MlZUUFo0ejgxNU05Mmk1emRmT3VTbXNvcjZnQm1BMzJ3SEhLc1Z0?=
 =?utf-8?B?Q3I3RzIzekdOd3lQcUVQRXdyT1AxVXVLRGR3UmI5ZmN0N1NWWENib0VrUlZJ?=
 =?utf-8?B?TWJtMVlDbHNOSWYxdkw0ZktQYWpFSittREZ1NGVlN1oxQm5rOUFsQVpsaFlz?=
 =?utf-8?B?N2RKVW9FbU4wZmNpU2lNeENYTlpYdC9xTE93bUU5bW9UVEVOVy80TktGdVVq?=
 =?utf-8?B?cE5oc2Q5dW5TWUxJQkVpaU9jZXFZeEcyZk1XV2NPS0NGZEJUVERHZU16WkhM?=
 =?utf-8?B?YUZkeTkzYjBMU3JITENtU0dKLzVXVjJaV3RHMUFzWVZsTytxZmlpYUlBdXBl?=
 =?utf-8?B?dTRhaVJ6ZGczcGVQOW1PczVlZC9QMDZoM3dmaldDQVVQc1FIN25wOThhYlh2?=
 =?utf-8?B?TTNKSGprbStVL0hKM3FzRjd4Um4reElVTDhQZ2lPOUhHTThETmNzMjNFRCsx?=
 =?utf-8?B?cUFiak5UM2tIbDdsY3Mxd2RLanV0OVdhZzJBQTdqdklpZHhnQmNNUkFJZkFi?=
 =?utf-8?B?b3dsV21rVEp0VHZCY0lMVWxZc2JZYTNDVjZmMUI0cVNhNVdacXg0WG9JWnpG?=
 =?utf-8?B?amVLOU5JOVprMDd5ZU91cjZ5SlZXSjJWL3RRRHhlM2ZNRy9WMWJnWlczT0Mx?=
 =?utf-8?B?T1I4c1RsTHY2bDNMU3hSbmpjb1llZUFMelFkYkZYVnVBOUhqOEtra0JvK3Ri?=
 =?utf-8?B?MVNxaTJCbDFlOGtqK2JtTGY5OVB2dDFLRnc1aGhMZHpVcWNGcmgzMzVFenRE?=
 =?utf-8?B?c0k2dWFnMFE5RURLdVcxZ0tJdng0dktIUDFOV0NpSXZvMEIrYXBIYzZlSm1C?=
 =?utf-8?B?UXBkTnhYMFVBSjFORVlVOGFaTkdTb0lBbFVhaFpQbTBpamhqSDRxU0RUSEhX?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xu23S+ME+KypOKrn4RnRODlRD5RAJ/EUVuRsJhM5mvarEVFmqnzlOvkWPJMbKGl63g1rzM+f5qVR8RLhnQB3GxljCrjDTvL7A3iCGO33DH3sf1IUWSeL60znSjFrU6haDrPI0me8TTpA/kUofvDdjnlm8aXmV5wYhyVJcRTsayaN892RJZVRrcVrCP5F6f+MwDMjStE5sqTOlBrnnzocTbWDq6qv83JKJzuT0DNjig4j9GYmBSjh+T9yFtKTk5GAwvfQfWQVTVHdF0DMad1i+KwkY2F2W3EBrDT4ifDvtSU01oT24G5mvbBY15gxGI0rDtpkcls7lP6iKkQxMTq9J6pq+FyPV75fhrW8TqLKDHYcj/0Vnnk0vPcp+iQHubnGXBMjyKmPDYPsOJtc7LUGRvyVO1VI/+0rGxJJXm9RBRx28pNFt0DM1kzvUbKQi6R16WxS6KB/MWQn6dTFMqAaLfViVZo82LHc+9I/6OCbUXj7ZHR9dIwGlxSgSEWptU/Lwp7m4M+kJcojPsytOKo0NG/4s8xBtATZcbS8sblrkLKjk/BbvoBRimUV84z/6cyR+zatDOxGCdZ/MpAB4pD04UmwVkCcDz4yd1k4VqEHvp6gpd+iZ7knxwdUnEHhG/TE233B8wtHJtczu8BnYvRI4o3p7j7ephnOJNuZmsQ34+qoPY+CuERpJkc55EC/qjOYj/P71F/fNean/zXEQra1Z+lwKiabuLVJ6xmAxAdvDEzeKkn2pEonNQaDLuImlqBBkou7wdLmqvKPZQ68cQaeQ9ZdiCiz0FS9NFXFYwBzN3BCSaijP+Lwc4DT0L5+MzXb5QGyNd+/7HKjEgxyEQ82IMzjUN9EjE8Kft4SEYsOo08=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f414bb-34ef-4762-5cb8-08db47e36005
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 12:23:29.9786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTMqmRZ7b7gW5cbsku1nomaUIbCkgWfOtBsQSRDvKmGIeCYQ1mKK8vYtLw2noUSYa/5zj4I+89cJ1PRdygGJXApUMgg/QJzrE8/oWYEg8uE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4984

On 28/04/2023 11:41 am, Alejandro Vallejo wrote:
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index e939d07157..6b11775d4c 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -345,6 +345,29 @@ int xc_dom_vuart_init(xc_interface *xch,
>      return rc;
>  }
>  
> +int xc_domain_getinfo_single(xc_interface *xch,
> +                             uint32_t domid,
> +                             xc_domaininfo_t *info)
> +{
> +    struct xen_domctl domctl = {
> +        .cmd = XEN_DOMCTL_getdomaininfo,
> +        .domain = domid,
> +    };
> +
> +    if ( do_domctl(xch, &domctl) < 0 )
> +        return -1;
> +
> +    if ( domctl.u.getdomaininfo.domain != domid ) {

One tiny style issue.  This brace should be on the next line.

I'll fix on commit.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


