Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41AC6E648E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 14:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522830.812451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pokmX-0002IN-0z; Tue, 18 Apr 2023 12:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522830.812451; Tue, 18 Apr 2023 12:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pokmW-0002CR-T3; Tue, 18 Apr 2023 12:50:00 +0000
Received: by outflank-mailman (input) for mailman id 522830;
 Tue, 18 Apr 2023 12:49:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTWx=AJ=citrix.com=prvs=4659928b3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pokmV-00029E-GE
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 12:49:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 847e53d1-dde7-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 14:49:57 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 08:48:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6952.namprd03.prod.outlook.com (2603:10b6:a03:41a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 12:48:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 12:48:43 +0000
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
X-Inumbo-ID: 847e53d1-dde7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681822197;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1szQQbgu38S/FhK4aocf8lyVuLfzMiBV3lfjR3A9IV8=;
  b=I4TcWFiLXIr5xtBjck7arfkX/PpfwpqmeSl6iUc2NNwKQro6mt5Xie3K
   KgK976Y5cheFVCNX/SNGdJOeS4xgseOSNW/u95Z2BwDQZXSyCjTabUv0/
   6NPISszp5XqfAMQ1Dtt3Kd7jFvEj7W8YK+GE4xfss32dNe3UtHgYal20e
   g=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 105985840
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UDGNuKhPdbWpKVb8mPKDIJ+eX161TxEKZh0ujC45NGQN5FlHY01je
 htvD2CBOKqNZzbyLdpwbIi+8U0Cv8CByYc3GgFq/CFhQyMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4AaOzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ4ImlUcEyYo9ifnuLmbMM23eMpLuDkadZ3VnFIlVk1DN4AaLWaG+DmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluG1YbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXlp6430AHLroAVIDQ3ZVyFvvC/tlyRXdV0F
 UUXqyUkkqdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ/i0zJR9M6SKqt1IStSHf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodtjIJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:Abe2JqhAjyEPUkPl5erW94uAWnBQXvUji2hC6mlwRA09TyX+rb
 HNoB17726WtN91YhodcL+7WZVoPkmsk6KdjbN/AV7aZnifhILwFvAY0WKA+V3d8k/Fh5RgPM
 5bGsAVNDSaNzZHZKjBjDVRx74bsaC6GHnEv5a6854Ud2xXg1wJ1XYcNu6AeXcGIzV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AhuiHDmtcI0DeUW1IiutZGn3C6IsFeCSE0ivLB3W?=
 =?us-ascii?q?RVzY0bpfPEnia+oprxp8=3D?=
X-Talos-MUID: 9a23:6QbACwjgIZ7ywmyWE++2m8MpHeZY5JqxAUYxg7oAvOK6PC8hND2ig2Hi
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="105985840"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4vVERsht+FW+BYw9aUa4i0AU3p28d2eEpYOTsvZLljx7FjfdMLeIgw9TwgWDUbmyCsA4N6RKuSKibwVGBVLbrwPSqxNHbYZH8NPAwCE2sP2I758m+He9yJ800MilxPfPSoSq3NRuDX0XUNmZdmr8bCkLWZn9ev8A5irDxgAW0eJm2vJWDaZF4/i6mqrPijXmjxjaP18n5qKzDsIDevN/gfSHxF36Q7VrKFjY+MrZLjh07dPpJXmtdT/6k2n/VfemYA9doL3dtxEGiaPNLDVoA/6FoHKMLzNK0oKl8tglEoZoe6HokjOMv52/EpeLtC8imTjD87E9nsjD9X93KsDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRUdGIkBe+/samxQSGlU7uiOQ2DDQnQ65pV1K5DDiSI=;
 b=AwiUbdAAPdVJp/CXHiKy8c9tVsk25wpp97vdZDzNi4upXT8P40MV+k8X17cGHp5nrTusLMCBJHT0hEFMmQ6S9K7Lw4Woeobv9EhKpeUN75mbFQ4lI7LdiKTTqMRFUOvE9Y0OBhTQD9/aIO64TcDY5xMFyrdsPyfDNMYQZxPTsJGuPTjTNq3LduMZIhPBCczxIb7cBP9EaWyGD3NNfVH2x+EeX0Oc5/JCrlEsqceXlG4+FUp2jTqQqfX9WZiTjqhu2k/uZv85uHtI7q1SV4Qlk/PXJMQJnx7z6YN7hgRy+kAHzGZ4tVsLzHq1PLtTTRtwYNCKsx5FuRAf+sx+PHhQsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRUdGIkBe+/samxQSGlU7uiOQ2DDQnQ65pV1K5DDiSI=;
 b=wuCGYbW+gP7P/s7h+/6xpBPLxBSpQS3OcbE9XiX0DNrxh+aj94peMlcYeaF2aEvIsn3T0ItsdgluOfGeGe5+mwP4G4lvm2z1EoYVQL0IPVV9FpLgCkvIdu+I9gvobIzSFSZcccBmK0Q3V2nF093mvm3gGkWxdbGbjCJFjuom4iI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <69c0fb99-5c04-7b6e-bd0c-6e32bce12358@citrix.com>
Date: Tue, 18 Apr 2023 13:48:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230418092458.15253-1-roger.pau@citrix.com>
 <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
In-Reply-To: <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 34623a80-25b3-4f0e-cbb5-08db400b3e19
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a0ElOzN8+J3SDlRFNwce7bK2XyReFGjKW/gRmcklRhM9H2AaiJ+lqEUWXEuGJ2IGcTQNs/omgjcoDfHq8Mm9lvJsTDUjvwArfX+dz7/glcY/EWawJ8awQs/SObOYAFa7qDCpG6xgUhJ3zQFK/+ip2F1AKci/+WzPhXHUwS1qZQP67GOuD5dIX6Q7q4VPxK+5YzCUzGkRYpWxkBINBgAwDpvFB8WzhSuC+JKkTZKT2VOi5L9P3Opgl6kK3u+dKcUpxDnwfnB7PhM4JXjJCPMWEEvVkKJupyISqlkwl0XyvsYPR41hlvOsI89HmSHAfc8MpRjD9KP16n2Isnw78invGt19CZFR0TbAxvZQiPen9eMomQ2cxhTDKqoVyaDNt4fE6Qw1H/OEUvS9jQCJCGt+E2ji6JhD0EiSlfWdI4oT7rWDJnL7ZboXFJor6Y8NNrZk9Ssm6HJLMTDposwPxwlFe0Su5nKTuMU58jM2QXAQYQiHfZ/fOioh0s3o3knOnmMCyT3WJ+OwcG2BU0ljySH3iQ9LjNN5jvIlXdA7xIJnGtPpT4CmqinPNdh2o024l6zkv+FQ17+zjUzrB/uNn+UcUq/+y4Q4IbDiyKqhUdFRkNx8Tjsd8cXqJ+/+m/2rsOdLl6MGEccdMnVMmPfHl323qg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(31696002)(2906002)(82960400001)(478600001)(6486002)(6666004)(2616005)(38100700002)(83380400001)(26005)(53546011)(6506007)(6512007)(31686004)(86362001)(186003)(36756003)(41300700001)(316002)(5660300002)(8676002)(8936002)(6636002)(110136005)(66556008)(66476007)(4326008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk9YRmd4aVQzZGttcmVRR2VkdUYwMVJxR1RZTCt2VTlvelRxVU9rU1UrT01k?=
 =?utf-8?B?RFJ6c2orVWRnY1h6MWxRZkdPb0VzTG52MnZqV09zL0YrRWRoVnQ5eDhZbG5E?=
 =?utf-8?B?YXk0eklRM2plcm84WEVNOG9KNVpJdXVSZ2RhUHF3S2huOHNVT0VyOHRIMjVT?=
 =?utf-8?B?S0tFZGRiK04wWms2dWN6c2xMMUFTRi93MUxkQUhQRlJ5TUhkRUtNM3ZoSmIv?=
 =?utf-8?B?bjQ0bktXSzBlR2hOeVFjaDBJZmhtMmp6ejZXQzJUM21MaHRMRTYvTzZtZ2c3?=
 =?utf-8?B?OXROUTUvNm1hUWJ6MHk5Yi96UlhSODk3ZTA4OU5kVS91Vnl5bGQ4MklveTBL?=
 =?utf-8?B?Zmorc09lN2NUVW5wOUYvUFR1bHRtY3ljdkcvWjZmSTRVUDlkemZ0MGlkRkJO?=
 =?utf-8?B?ZGhPRnhUeHRqMTNTYkRSdlRmbjVHdHpTTzBKZEhYOUFwRUFoa3V0eWZhQWV1?=
 =?utf-8?B?K2tCdnY4aVBDYnVaZys4M1liOXBCNEFrL0VpQTdMZkRicGNrT2g5R09zK3hO?=
 =?utf-8?B?cThvL2dZeEcrK2FsR1NjWmZ1ZnJTQ25vWmdHQzFRL0dWV3diR3dvRmtOYlhB?=
 =?utf-8?B?OEtiTVpycnIzZW5jazF3VUs4V20vY3ZpZXBvK2FkeXFWL201Sys4OG1aS054?=
 =?utf-8?B?c2tXN2xrWkd6UUdOWVplSGo4cXc0TW5sYXk0K29Oa2FmbjgxV0dyZWJ1Q1k2?=
 =?utf-8?B?K21WV1dONWtVNVJ2Z3BhTjhpS0R3bnpDanVNS0RWUnRENW1vajh3TGtkWDRQ?=
 =?utf-8?B?QnpIOWNpT0lNZVM0MWVncDd2cjl6ekFKaEFPMWV4UWdRZmpzM0xsQ01GNnBB?=
 =?utf-8?B?TU5UZ0lFa1RtNjJNWW9XcmkwUmUvakZEQmdETmlEdDRJV3JpT2ZzUGZrVUpF?=
 =?utf-8?B?TXUyNmhFWlFPc1p0eXd0dE1ROUNEY0lsaUx6N2pjbW5iMUtsQUVuck1QRytD?=
 =?utf-8?B?bFFFK0hHbVRxdkU0Nmk0VkZxRy82cHpjeGVxYnp1UjU1VXl0WFJBSDAyTytp?=
 =?utf-8?B?V0VvenZQdDJzVU9UakV1bWM4VWtpNkJhZ05Hd0xGbmJXRE1XZWhnTHorb2ho?=
 =?utf-8?B?bFJyUTBscXdJYjFidGVDSmZUclo5MnRlbDlJWnF1RnZoUmRDakhoaWYzNHZH?=
 =?utf-8?B?dzlSU29GaDhyOGFYUHNZMVJkRHp1MXhkWDZiaEhPTjNyTjMyZ0s1cDljUUVP?=
 =?utf-8?B?am5SZ3NnemRKZjAwZm45bTg3Qy9nRzhQNjNHOTdSRHdSNGN0TG1sTnI0ZzJp?=
 =?utf-8?B?aWtZQ3Mxa0dsNGRtU29BWnVLajBGaVlOdnpMRTl1TDQ2eSt1ankxaElDc1Zu?=
 =?utf-8?B?NXEyZEhKWXdJRmtLZC94WExaMlBjNGRzRFFqd1BVSXdvNTlmYTVzWk9MZVhE?=
 =?utf-8?B?N21TcXIranlpTEFFZEpkdjVkZEVZb0NnTFJFbzZyZzRSbjhCaGtMeUFwZHNm?=
 =?utf-8?B?UzJza0tRbVB3STFudDh0WEJqWVNGWk0zNnYyR1B6SlVNM0pIb05WcVl2WC9p?=
 =?utf-8?B?L09tTmlZMlNuQ2E1UlRxY2grYVpTclpialNOTndhOHJvQXpDMGt3dk5TNGZ2?=
 =?utf-8?B?SzV6MnJWNkFaWm96OEdVdkhuUkVXNngrVFFFNW5kUEhFZElDUkNqZ3I0Z3N3?=
 =?utf-8?B?VjBIQ01RN2JQUmFIYXpmUklNbmR2Q2lIWEJ6aXVsRkxYamVLNHFYSWtNWGRS?=
 =?utf-8?B?aGordzZkdm5mRmh6SWxrOTlaRmRHRnh0Q1Y3M0dNamoyckc0cWVuV2IrRW0z?=
 =?utf-8?B?UWtBTXFoMVZZaEd6a01JOE1yTXpVL1VMNVhSVVJVb1c5TDB0UGU3TmJ5RE1H?=
 =?utf-8?B?ZUt4bEJHTmFqMnRkYnd2MHZkRmtmS1lpNlBXd2pKN3czZ2xvZmFUVEdJamNM?=
 =?utf-8?B?Y2VaMUN4aXpkTExJc1FHcWdIVHVQVkVnbk9uT2prSzhYZVNvYUs5RXZpMmhF?=
 =?utf-8?B?Nzl2NVBuWDhGUUtjWDVhTGtGdHpFRGNPYjlPUmYrNEVwSlNHeVVWVmZsVXFa?=
 =?utf-8?B?UVNpM0s5OGFoS2hpd2w2MHNLUkw1S1F5UkN5TmZmMFJlNFpubUJobE04Z1ZE?=
 =?utf-8?B?dDlobERhTlE5eU1MNWw4SmsrYjh4cHJ4UXE1UGdSKzFVdUlVSWlIYVBqWFR1?=
 =?utf-8?B?RzBDak5Mb003WXNUQjREL09tNUdIREFLRFg1dHg4aUlHTk5Ka250OThwSDdr?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GiHwHvVnhpCMl1KJBuPMwRHPTOHmapwrDNEPKVEy+7NqRmKuErM5R9LCHi3g4v/JZ4eB4MZZkCFCT6PKlTkBAzwAnh5nhUcM/f2Tj/1edNQfJWfVuRv3Nm0opqfJURKx6xJWv1e4GgPsTvTtJkx93V1ZbqJm6/EcD7+3ohyFRnv+QhFnzPrV9EpBWNBqs1LS+U5S0ifxSgWMqA3lfZbNK5mNTc9rnG+TCIVl2XWpbRs9roKtAjhK98cZbnQhO11bjUVxs79u208DFaOL1G693rJ14ewE5q0fP6ZEzIIZFAnI2zv6pEOo9NTLErSxXYA2S1r5/UrSRK7aTSDcWzVveDs3o7NlDS2mJWKWJyYf5ijvTewi8TfdMwJMLOBeov6aTGSeHO3xs+6xfGCz/gMQIvUANV/27zAgnsOEtDd7swQ/hvfmNeU9ANjvwKC349KTmWDxW68+l1Jv0JD4r7xqe9CH+JxmhUxBLjpFlFkOyORJo5bT35c+o8BQHitqPmMcILdY7KNDlkw+YfYynMDwAvACVoroOTizFDYcPlahbyco7a8Q+CL6hEjFx7E4YWrz/xqt6srH66LMBualrUZfnmFnREb+/gAGYArRL7OYRHwQztPcDM1qFjzbUBucPwVZHYFL6jFRmTs85plnh2rmXO+37CvpCKtWBg9AiklraX9y7sqlSlznLav8tGkianEPByG0d49f38hZgV5yNTvC+VA/gEUmHoR/HZtoTRcx21Ef55yPM73LEEjBvi/gvhicdd8/L/f7ytTrRJYIjugTFFdQjYEV2FctyycU2fX57i/KVxrLms3DQc0OOrECOX6pJ3vVMhgjFSCHicj6QU3q/Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34623a80-25b3-4f0e-cbb5-08db400b3e19
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 12:48:43.6660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSiJM4MCRSFVAd+g4rmwwXMQH5lTV2dC/UJBOGRAfIq9LDNzwekA5KdMVt3txl0PjL2xnTjZZ0fEwMxrJAuQdUVNCMsycihxgYMRs00YE4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6952

On 18/04/2023 12:00 pm, Jan Beulich wrote:
> On 18.04.2023 11:24, Roger Pau Monne wrote:
>> Some of the assembly entry points cannot be safely patched until it's
>> safe to use jmp, as livepatch can replace a whole block with a jmp to
>> a new address, and that won't be safe until speculative mitigations
>> have been applied.
> Isn't the issue only with indirect JMP, whereas livepatch uses only
> direct ones?

We already have direct jumps prior to speculation safety logic. 
Livepatching putting more in doesn't change our safety.

>> --- a/xen/arch/x86/include/asm/config.h
>> +++ b/xen/arch/x86/include/asm/config.h
>> @@ -44,6 +44,20 @@
>>  /* Linkage for x86 */
>>  #ifdef __ASSEMBLY__
>>  #define ALIGN .align 16,0x90
>> +#ifdef CONFIG_LIVEPATCH
>> +#define START_LP(name)                          \
>> +  jmp name;                                     \
>> +  .pushsection .text.name, "ax", @progbits;     \
> In how far is livepatch susceptible to two .text.* sections of the same
> name? This can result here and perhaps also for static C functions.

Well - the section is the unit of binary-diffing noticing a difference.

If we have a naming collision here, then I expect the linker will merge
the two section, and the livepatch will end up bigger than it strictly
needs to be.

~Andrew

