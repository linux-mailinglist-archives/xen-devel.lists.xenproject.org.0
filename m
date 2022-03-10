Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81BE4D42F2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 09:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288231.488789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSEcU-0000Cw-QL; Thu, 10 Mar 2022 08:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288231.488789; Thu, 10 Mar 2022 08:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSEcU-0000AT-NF; Thu, 10 Mar 2022 08:58:02 +0000
Received: by outflank-mailman (input) for mailman id 288231;
 Thu, 10 Mar 2022 08:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSEcS-0000AJ-PC
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 08:58:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c684178-a050-11ec-8539-5f4723681683;
 Thu, 10 Mar 2022 09:57:54 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-8CdeSyXnMTGc-KAMACNXQw-1; Thu, 10 Mar 2022 09:57:56 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM6PR0402MB3895.eurprd04.prod.outlook.com (2603:10a6:209:1a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 08:57:55 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 08:57:54 +0000
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
X-Inumbo-ID: 2c684178-a050-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646902678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IJHG4FXpB+oWx5WMa3/a2NqPpI1HWKX2PQ5pEE/c3C0=;
	b=Kmk4+Yj60EXD0p7ORj8KrakV48MjbUgm+BafwI1FlqDTbamWAUdoerXraLxZbRm7xP107T
	qHWDbUpXOoeg1Dazh7pe732YNBCJv1L+946Jt/3G+qTSBYoz/mQPlCUP0nA/PzklHeo7JW
	mfv5CLbWaQL+kdKq81/zgE9p/3IPl6k=
X-MC-Unique: 8CdeSyXnMTGc-KAMACNXQw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJQKJEoFsolfqaHMWW9zA3XBuj7i1VYL19nNofpmDWa4+d3rJWrIh5SuQ2Fp7hk4ohKiyYycH9UzDq5ZCtZQBdx5PS5plGAGtBKe4LwDHM14ZoSwXyuTum99okfAWhNaXMg8gso9weJibSbvVyIo+JQQu0oIQpEcqiH5rB7tXqByXWnatCTuvXfA1Yqwrj44Nct/Bnp8mRPZWb5sJjY/hYHQRR2AWbQM+/HUhQxYAFkvx3PUidSLlhVFi4O5+4F04VTQQwwZuGEicLZ8UR7qj9JVllpRU+12enCWWvomOKlobWlV4MMX5Gh0/OiFIlkTu5nAKHlbGtvhTrR85DqhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJHG4FXpB+oWx5WMa3/a2NqPpI1HWKX2PQ5pEE/c3C0=;
 b=E3z3DvVMC3/d1VOcsYXkX/rF4C8lc8zQ8chsH4+SST1Ylu08PHk7x/hXtamGH9JoCJmftHRNPz7+Otj49/NkPhD6nOILb/dm5qVRSYRJ4lgitidcSDcFE+3m3QhwvaB7zqzWjSpqa2p90KobQie9WEBz4qTQ9hGNwwPDRU3jXFDhO18AEtSBXTOAcW/kkxhfAC+2ZG2NcUNtyl9fXpY/wfK6LFlmkHZzXqBMG2tJ3EL5tGsYTwuPnTgcvQYlUIVedyIX70PmKzSsRf0g8rVLHkDa63sIzEnYl+gBjIS8fmttYgRmwUa2I1S/14jQlTVBWuVpb+IPk574JF6zhsqkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com>
Date: Thu, 10 Mar 2022 09:57:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.16.1
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::20) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d59865d1-34e8-436a-9817-08da027410d0
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3895:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3895D3D828E3329AC0A4D1EEB30B9@AM6PR0402MB3895.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o2ob+FLoj4pb84KeDUPTIhyw2hpHab44U4+PTNGn714POC6FGYz3DBm3hga0m3tFUpaBl2kXcvp+bNtrCdnm7tyPY+Sa4B3VO8/8Vrgr4da34PlY9yMC4pANWEbn9EIXI2s3BUZNb1JfgPEVqpcX5697NEpxyfBwcA3FNbL8wIgSupw58xV4LU5Wjnc+YHBoOxUBazic+tWpA7LmNC+TYYpZJb4Ws9ZucWR4N4U6Cij2FRgQK0m0dJXBES6A84DkpvInMwdO3K/6cGDifr1OR5ffPYtLTdZOR0uDD2VlYz7nYyroQmgHpkbEHYAtXA6AyIQK9rKwTXSKNwA/mK3SKH7kn8c5NPIHf6HcGfmpUpYWHRWyZ5w4P/6oTCjAv06pVdrxqgQIKFLWJy1pvaaN4dd0uBZ6OGnqGJyzaugBIss+qdnJ9NJaSJMbW150zcSXqLwYCd/UxVjbK6gOlkgqp0PBD0H4QQXLZ+U6DhtlgakOcvXOMTfn3bKkYIUxiKPXGS0dhuZ6shZRqBns9jSb66Hvtb/GUxYuMEzRWraR8tFu0PPezJauqYb6PEU8cF8eLkmExizm5NBYCQiXa9S2MqFAE6Jwrbo3mYQEAqVeViF1A+hYT3yp/LI72gR8mBLWP9+Z/3Ud9OFqYbbdTBv0igLv5RMvW1xd4SYjanPw9TG61yBiQyY6MZPZOA9hLMpDhTABui6UgAzRXUUjV3HmwTf9SE2T/cvUfLLV0NzG+j4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(316002)(6916009)(66946007)(86362001)(66476007)(508600001)(8676002)(38100700002)(7116003)(4326008)(6666004)(6486002)(2906002)(31686004)(6506007)(6512007)(186003)(2616005)(66556008)(26005)(5660300002)(4744005)(31696002)(8936002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXNsR3QwZFhSSlZ3VklJdnY3WXFoV3ZsMHRiem9jalpCRVNpcHMwYXFneGlO?=
 =?utf-8?B?cmpsenJ5MTI1VUdnVVlBYlQvbW1DS3laTGo3OG0yV2Z2TUluM2JmM1lkL3ox?=
 =?utf-8?B?UUhtNE1EWk9ISGZvcHNpR1NEVDFMcktSbWppYXZWU3VyaGtUOTE4cVhEUVJN?=
 =?utf-8?B?TTVEK0J6bHlmRHU3a2NNZWt3OENqY1BjeWZPZGVuMzU4NjREU1FRUlAyN1Fx?=
 =?utf-8?B?bHltaUQ0SDJCeS9yci9DWGNoTnBldjdUTFJRM3BrbkhCanRxOStNM2d1RFhG?=
 =?utf-8?B?cTRZVHFvNCt3WnU3dUY1K25YNWxsK0NnQlQ5dHRsMUVYRWVjWWxCNU5Ra0w4?=
 =?utf-8?B?WUFuQjdOck5JTWoxV0FiVm16cmVlWWVjaFBNeWQwVjc5L2t0djFjWlFEVXkz?=
 =?utf-8?B?U1AwOU5EQThZM2hqRy9ia3RtWXl4WVRRbjF2VmN3MlZ2WE5Gc0JZcDZLdEVq?=
 =?utf-8?B?Yk5GWWJzRnlCRkRrRHJ2OUpLM2ZHK1hXNWx1UHNhdHVCUXZIeGprbEMzNHJK?=
 =?utf-8?B?RVFYUE1wMGJXVW5uZUp4NWRTSWErTnN5SmNQZkRXUTVrL0l2Ky9Gd21uN2NY?=
 =?utf-8?B?QkRhaHFJdEk3SGY4ME1mVGlMWE40SEZZNUVxOGk0ajdYZ1NsaXplOU9haGgr?=
 =?utf-8?B?UXFpWXloYWlFYytpSjBXdUxzTFFaMHRWMXh2aXgzdmsraktJZURvYjJzMHg3?=
 =?utf-8?B?bU9mcERxams2QWgyQ3MvOTRzMzZPUTdDNUwvRzB5dTlhZmpRVExYSTdqVC9Y?=
 =?utf-8?B?WVNsUFdFOE0xZmQxdEpyMnorWnNnV1RFbmttWFM1aEdXbDhjZW82dUM4UUFS?=
 =?utf-8?B?WmdQQklhMnVrazBPQnNnbU5BUThkQ0x4T29Xb1BJcVFTYlRVZmt2VUZGVVBF?=
 =?utf-8?B?aEJJeVlTeGJ3Z1pDU2wrajhqdzVYME1UZFR4Y0JGeURIQm9WcEhWRmN1bFJ2?=
 =?utf-8?B?aXFZL1VVN3hzenlpeEsyTFdndlVHMm5IWHFDNnoxTll4VGpXMmFmK3VKby9E?=
 =?utf-8?B?NlpEM0tseEdSZHcvME9GMEZBZG5vM29xbXgxaGk0OHJXWk5oejFoSzdmUWVJ?=
 =?utf-8?B?UTJGZnVxckdaL0RJcEVVcEJwc0JiQzhhbkF5M2N1SW53YTV5Q2IrY09OZW1y?=
 =?utf-8?B?SjR1YVE1eExFNVEyVXF0OGxxTnpsMHFKOU1LcTJhTkVNb2s2QjdHMjdMRmUx?=
 =?utf-8?B?OVpBL24wSkJRK1F0d3NXZHRTa1F6THFYZXhKeHRpRWU3cFE4WjlJREQxMlF4?=
 =?utf-8?B?Y0duM2t6MGY2U0ZvWDc4YU53RVVoWDFnZUgra3RuaU5HYlI3eEUzRUpOenBG?=
 =?utf-8?B?RU9MR2Z4YUFqTkVYTnR6NUhzUlNmemx3QlNIL0xQdkpYZEtjVVk4anpMQm9E?=
 =?utf-8?B?SXJONjg4SmxuUm1IWWF3OUN4dHlsZC9DOVp3eHVUaW85Y1owbkhEaWtCVzJi?=
 =?utf-8?B?Q3BEYlJBMHBTYXBRSS85K3ErMHArWWZwRllsOFhPdEo0OWh6QzQzSFRUMU9Z?=
 =?utf-8?B?aXpvSDBMRUNFQzNZUFF5Z0JxdVdkcmtwMVdQby9YUE9iTkpVbHFpckYrVERX?=
 =?utf-8?B?SEdZZGwwakpkdDZvaTI0dC9SYkNyYmNZQ2lZdk5PVjUwUEFyWkdNcWZ3UUwx?=
 =?utf-8?B?azRSR0xDRElNTFBBRHpoUEtkWERmNzh0TGtBVTF1ZGY1MWgyaFdSNXJyQXhY?=
 =?utf-8?B?N1RTN0hjWndTamw0bFVTT1JhclNLd2pDcTI2YXdxOTZDTEJvcFRpaVcrY2FM?=
 =?utf-8?B?WEtsSGZDR1VEY1owSklLK05jbGdURW9yMTZHSmpVMTAySVNmK0NWTFpmMmlC?=
 =?utf-8?B?dXMzaklCZTFMWkIvRW9EbksrcnhaclFnQWN0OWkwM08rMGU2MFR4NldiN21Q?=
 =?utf-8?B?NTd5Yng3T2tKaXBVVWJnNXRuSkRodXNNMGhxNXNENFR4ZlBvdDhlUlBGd1U5?=
 =?utf-8?Q?QAihDG2wNGV7SkT4Rg2klpZBq/lJZekq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59865d1-34e8-436a-9817-08da027410d0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 08:57:54.9320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdqNzHcMwT69x6JZ4rgXSFrR2QrSGqnIScep0d+yoRCYe/f8X5i4La2uTdDJZYY3Q+PrtRZyMgD0cv+r0Mk4nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3895

All,

the release is due in a few weeks time.

Please point out backports you find missing from the respective staging
branch, but which you consider relevant. One I have queued already, but
which I'd like to put in only once the pending fix to it ("x86: avoid
SORT_BY_INIT_PRIORITY with old GNU ld") has also landed in staging, is

4b7fd8153ddf x86: fold sections in final binaries

Jan


