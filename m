Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B472F6ADF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 20:26:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67526.120602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l08GV-0006eD-Th; Thu, 14 Jan 2021 19:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67526.120602; Thu, 14 Jan 2021 19:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l08GV-0006do-QJ; Thu, 14 Jan 2021 19:26:39 +0000
Received: by outflank-mailman (input) for mailman id 67526;
 Thu, 14 Jan 2021 19:26:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUaL=GR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l08GU-0006dj-Ja
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 19:26:38 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca84d9fb-e238-4fa5-989a-833d7e0856a7;
 Thu, 14 Jan 2021 19:26:37 +0000 (UTC)
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
X-Inumbo-ID: ca84d9fb-e238-4fa5-989a-833d7e0856a7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610652397;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JOmDALd/o+A7g/3DfJeWBGvtmdZM1IA/wBndspWMfXM=;
  b=YATc9uITisxoMNoiAx0ftBy1SqJfraxYvdkcjDVLVoEiaEG4Be9dteq1
   lEWWNJcDvzayCsWX04jbHgRKompP9JRoMWPW0e85rlnoj7FRGbBLW57lA
   0TacW+cNDsgMA1Y1m+lSwiHov5kRKMDd4pywJrwsY+PHgPFlMoXqqtIoQ
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kenNz0ii7au8gQj5TwSsqmLjUwHMSmXPfzcjbWN03fdou4QmpuPip7ipVuuH+zQO702s8qOIlq
 ZkMDpmOlIE4+vtHLCgnxZP8Lz6SWHqvsvoJ5yL12Yfljf08TC4rsjY5jg8h02HaEkVk2rD3RuB
 AA2NktEJgGdCtHdjzGoheyWDIdgOjT7BB7RuGdejopV+i3GSywgpVDvIBbcwe4lJJd5Zn1hhhg
 w2pDhBbf31IV81Hy1Q+x56FqIWJCypKL6fFlNBSNEUY0a9+GiuAD3vEexff/aVKhQbYcc4359f
 b5E=
X-SBRS: 5.2
X-MesageID: 35110928
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35110928"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCPAuzniiLyTSAqLlr2GtjecCRJP5KZdkIswN84/ynebZfRp+gRnrpYVlYhVvz6kyOljQYoNKFO2jZUNqopHxl2khSU4led1X24lIHGZY6CbceY0UuJwcJJL198VjhYlsZdR/ufegwTyEHyuZBMFuUEJcsfdOKjiaa/hXN+hORs7LoK3l8zXYnC15Nq8Q7vKcPrfhu4Z4skZOC4xJTKsMFcSaDzCQt38aYRu/2KMtgwAvjpLIcMoQb3QmgySnuNqRrvU3bjSBj87uyVebJbvCX1jdfcn1Ki0n6JHSm6Q9NbKnDlyQzEQQmrUYzXP7eynqopTL8wbPijZVIIFuJHTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOmDALd/o+A7g/3DfJeWBGvtmdZM1IA/wBndspWMfXM=;
 b=I2cvnZxQRy5rzSObr4rt9zNlDoC6A0NIcyZD8mJ5XceY/1p38HuspJPPCd9a5LWbbJ5rRZC5WxKxlAKvoO4fmo3+VlKHalSgoXjl+bh5T6ecmvSn9sElhpMKwjEpEhXa3lztgiOp5NlZIS6QEO2YdzlljjgfMjdl4hecd0BpMhWuVqQiEvZnN/6V255vP86+KllReUJRk6psqea/j2900c0bKTbB9T1nfdcPkNgHuWcsiZWAabLZFA8/KdOiWj0DRBRZdINsfbflrocQEzjw4NtGxqLwGD76v+ZE8ZdspR5fwqABLtxvuGCyQG+uHFfTQVijdcUMaSxlc3Yo1W1wJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOmDALd/o+A7g/3DfJeWBGvtmdZM1IA/wBndspWMfXM=;
 b=Od/fWRG9PMnlK7qh0OnPBscggEjwRyLLmdLTsg3rKJAybtk5goJy1H5pJM0S+EvKtkr32otUpjA+j3m9wSn9sLjb2jbuJd20RhisRu79ogq33hg9JJAib48beY+TU2BO2JtCYuOK4xMJR0bX/tH9IGtfTnMPVRUO/EJJpzHxRbg=
Subject: Re: [PATCH v11 04/27] tools/libxenevtchn: propagate xenevtchn_open()
 flags parameter
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210114153803.2591-1-jgross@suse.com>
 <20210114153803.2591-5-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c1388df0-8f4c-2311-c09a-11577ea9357d@citrix.com>
Date: Thu, 14 Jan 2021 19:26:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210114153803.2591-5-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0147.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::8) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdcda04e-5b67-4787-0e5c-08d8b8c24e0d
X-MS-TrafficTypeDiagnostic: BY5PR03MB5063:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5063BFDE25BA15D6385AD16BBAA80@BY5PR03MB5063.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jCf9Ugcumwzu3Jm1DG9JKrYhCIo8+iWftpeQcyaXWTuPNuXT7obxftRgGOgLdjb3qJuFp3fhHmwxB+aP2YB8knEbUpTgyosghkpXskAkydj3LqRsgqB2QUdW/jWmWbk+YK7oS9tvCcOVyd2GT5bLIGgb9fBb11CxYQNJmqlC7GzTY0PDDtk7j8wN5lgLVzx0GU/VRwWAQbEQA8ObVopAdAVVOfW3PKGrDLH1W8NSGrcwBlPBsKZ2Wop66DhjpQQRTsF7HKXw4jz2gNFKAhC5bapRgAFB3rEETB9gQgSPMfz66HuIq60z9ZBUo9+Xtbhxbr7Nn8RA51MGWtp74iURD09hiE3qB2F+GfrREXin2jRWSWfcYxNXe5L23hUhRbzO+DzdzfJbyQYItvEjiwh7vuHVkHvEyBr16ZBj/YpqhsRnNbUbhEnoQ7KgiaBn7LqFgZvEAUSjDL2mx4ksxF+/T1tK4HFMrpZJidjcanwG6+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(8936002)(8676002)(956004)(66556008)(6486002)(66946007)(6666004)(186003)(16576012)(53546011)(4326008)(558084003)(83380400001)(5660300002)(31696002)(36756003)(86362001)(316002)(16526019)(26005)(54906003)(2616005)(31686004)(478600001)(66476007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzlyQ3d3REJaanFhYnZtZVdWMHF4ZTlZUHRsaHI1OXNKZ2Z0cXphNHNwaUYx?=
 =?utf-8?B?WW1nYWlKR1ROSzBOZnk0NGRyanBVcTNRRGxZd2tsdGx6am1kM0pqUWN2dHQ5?=
 =?utf-8?B?cUVlRFRzNVlsbnpFUkh5UG5pS1EwU3lLU2k0TDRubDVCaEJpWHByeEt4M1JH?=
 =?utf-8?B?MW9BSWlKU3J5bzlnM25SdW0zSitmTzlJbGxUUUhJNUJ5Q2c4NzMxOVJnUkdi?=
 =?utf-8?B?SHE4eDlxS2JvSzB0VUM2aG81bWNyVTlBMzM3RE0zU1h1WXZ6QWJjY3RmTXZQ?=
 =?utf-8?B?MGFtRm9Zb1k5aXVWb1V5T3hZTXhCSjRxenpCaFd5OTJ0Q0t2bG5hOWp1YkVm?=
 =?utf-8?B?L09JK2FSUWV0bDNWSk5FMWsweGZzRVdkTlc3bzRJUFFnU3FsRTV6dUdnaVZ5?=
 =?utf-8?B?enZtWDdZQm1tTXZ1YUc0eFpBb3kyY2c2T3h4aWMrT0dJcys3b0d0V1NFZ3VS?=
 =?utf-8?B?dlY1WThRVGtRMGpjRzlqL0lLZHBOb0NVTHJrM0JYM3ZFc3lrMjVqSUxBMHND?=
 =?utf-8?B?TDA1WjdlU3NKVXozRERQYkh6WVRLUUMwb0I2eGMyL3JWY1l2OVN6L3FLNzh6?=
 =?utf-8?B?VllYSGN4akUyMWtaRC84VUg3YnIvVUlrdnNpM0N6cVlxOVBKdjgwWmt4UFZ5?=
 =?utf-8?B?b0dyVk5QK1NlL1Z1R21QeW4zRDFRZjlQZlhwL3dNdi9neUg1eld2Z1docGdJ?=
 =?utf-8?B?dlR0MUZ1SmxCMTJMeEZBREtqZUcvY1ltc2pQWStQU0J0Y2kveC8rdUNWdkY1?=
 =?utf-8?B?d3FjLzB1THhFSGN4cE90azF0YUNVaC9PMzJNb1MrTXM3dFZNVFJKTk14d0xs?=
 =?utf-8?B?SnNoYjVIaEVkRnRuOURiT2lkUVVlTVdHYWhOZ00zQ0tQZEhvL3llMmVXM3Nu?=
 =?utf-8?B?Sm1mQk5xdTFhRXlVZ1lGU2tQOEJKb3lWd1p1ekoyOUg1Y0c1QlVUaGJFMmlT?=
 =?utf-8?B?MkNtb1JmQlpuV1FqQm81RDNuNVJqdnhtdkFLV2tOL0s5WG5rS0tNang3V1Jm?=
 =?utf-8?B?eGkydTBTTDBLQXkyTHhscVAzSVczTUtITnZQVjgwYjhCaWJHZkZOdFFGaDBL?=
 =?utf-8?B?RDlNcmlnVFRoR2dNZzFvaGpYWjQ5RDNOOC9LWkxJVTUvNWVzaG5FbDJFWDJC?=
 =?utf-8?B?aFIrbGR6R1R0YzB0OXVIUXBEdlh0QWpYSHJWSGJiQTBkeC9KMFBDb21YTCs2?=
 =?utf-8?B?Z2VxSk8wUEtnV3VRQkgxRjJ4Z241RkZtWTBpSzFVdTlPVEtUaGVnOG9LbG9q?=
 =?utf-8?B?azVRdGR2dHgxZ24vUUwrdzNjN3dzTG4ydXNJYjgxZXozdU50Tk9HTTFJcEdm?=
 =?utf-8?Q?/9gqzCD4ePvhBQ0Vz8GTIjyHtwIJp5QV14?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 19:26:34.4730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcda04e-5b67-4787-0e5c-08d8b8c24e0d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8W7JOVPF2S7TAsnH1WhYdgOq6C1wPqk1qOZ6S5bTcv+Z2CamuaFA1X/tmkQ2nX1CRPNNf4pT+1BghfszYQDQYHdbhTB60McrqPyfflo4RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5063
X-OriginatorOrg: citrix.com

On 14/01/2021 15:37, Juergen Gross wrote:
> Propagate the flags parameter of xenevtchn_open() to the OS-specific
> handlers in order to enable handling them there.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

