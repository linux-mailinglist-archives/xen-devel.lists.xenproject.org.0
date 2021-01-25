Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0037D302390
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 11:20:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73971.132944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3yz2-0007Mu-48; Mon, 25 Jan 2021 10:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73971.132944; Mon, 25 Jan 2021 10:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3yz2-0007MV-1B; Mon, 25 Jan 2021 10:20:32 +0000
Received: by outflank-mailman (input) for mailman id 73971;
 Mon, 25 Jan 2021 10:20:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l3yz0-0007MQ-FW
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 10:20:30 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2af110ae-dbb0-442f-a3ce-8bb3eef44e7f;
 Mon, 25 Jan 2021 10:20:29 +0000 (UTC)
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
X-Inumbo-ID: 2af110ae-dbb0-442f-a3ce-8bb3eef44e7f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611570029;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R0r5IzGmDmWRCpJZ7IVZaKIAcZKG7KKyM2xSECABSws=;
  b=TfDZX4Vfg5OvUN/Y1XID77VV/KhQGCrqwGGVVyZbQpBTfG7I6XhEvNMu
   TYQfaGOmAcHSlC3fKmcrLp1Cks8yYI84/z4A+oSja78DGtX2i2uY+sdil
   Rmew5UZ8aCHzk44oDumn09Wrq8RQiQel6gKZXHhzI43OsO/HtLtXTxcyn
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vsNkZWSEdtD50yAIwdT9bNrL4jmMuDSYFBkMO7Rplk/qJH2uSTiTVo5P6H7JFHZftC7dLGPPNz
 4JHEwE4G5RZaWoRDI5+WJS2FgQsyot/WC8OBp1Xec17+GtHNOVJKvoqIkFd/1RdI0aEly2wVK2
 JPUiI5NKOrmaZJ5TVziTxPDOSZI3yntgpOhHPGsEDBvXPeAIjLjaNi9XWkduOcie5y9WUyUq2m
 dS2y/3R/BWlHAnq3R1i5lcGMbYognOawp5Mpc/1OE5jdrgzlyk1W1JRDkJwk+/8OeYkgwIRUlw
 uFo=
X-SBRS: 5.2
X-MesageID: 36145074
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,373,1602561600"; 
   d="scan'208";a="36145074"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nfx49u2qrRPVQMyr5VZ71QSMXEwMGDvHOpmIfS6YP9Z8/u/FplYFaz8lbUO3ZXcEve7fG32SidzPFLAMPM+4BGQCSMxzWJsWp7ozhjaPtT72NlmVM7h4sRHe5KteYFt18J5FdKB/V6rxHJ24BkwdgiCSNLs2iUWgdL3Km7b0LaZDrTPZqeetGo1yP0pMdm0nnwvTe4xB9n0zm9aoNrIu0/mmZCdPOMBpu2Xi7FU112NtJFHDu4Y3r4riBof8+qmc622qfILxarA/eta/a31IlEboYbAs8ju0wDa/SFDJwPgGW6fTO47QidvIj4dNCa5EimIxvlHIXzkgqyr1h9OhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KijevWn2ThUgpyKEDfC1tAXfXNNpXXx0x6p5sh5R76k=;
 b=etNpRI1UbXIaK8M0I9k1+tFlSnvN2RDp74px86QBOAnftv1oyp+Zed/XdLwtyrHNuKQLynTXmvXf/GoDl0nLyCoHuvOHIMXCekCiINgNl5ckIe0P9Fe5FTF2GMTCUy167nuErE0STUIfihPZl46RKTr7v7uMZtwYMvj7yZ26w//KKh2IPnzv+nQt9rJau/KA0+Eoe4MiwXUvUPM5NgYVxzJp/csrCEWpne1e2doEQno3eV0DHay3i4hP52ular7stFuY+ol3Rzqs9CX0TvkkKAyn+BBM8dOMMolsOxQebLkrsMtHlf5PPfkQdI5jRJRFfNzBiCdmHGsKfTq8vdeJSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KijevWn2ThUgpyKEDfC1tAXfXNNpXXx0x6p5sh5R76k=;
 b=ngcJ8EFbbzG2++No4rx/zlbGqac+dxx5OJdtXE2VWSZtDaG/5TX9E8Mxhc6joPrl3kxDzLHQ1XrgcZ6xeqaSf5Z5tggy2z9O3s8LHlgsJRh8P4LqgVX7Dy1aK3hNum97IUMpwaC2L4qBcY66HpswC6n50FeqOEQJpflWOq/b3rY=
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
To: Jan Beulich <jbeulich@suse.com>, Elliott Mitchell <ehem+xen@m5p.com>
CC: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <202101242308.10ON8Umj004866@m5p.com>
 <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ce1118cc-f6a1-f53a-cd32-3f03bf3f5d3d@citrix.com>
Date: Mon, 25 Jan 2021 10:20:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::18) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b72314b4-1a7d-4eb1-638c-08d8c11ad4e5
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5517:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5517320C5814F363EC263223BABD9@SJ0PR03MB5517.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BF2/ORiOvjW5SvjNs2NboYQKsD3ggU5RaUJhtDlDdVPTSB+7WYK+xln9wzOTHjDepvr/leH6Fs56DTJtdXDcaHVeUJj9vTxaHy6S4SJgKJbHD9oQByKdbaaa4rqVJtOqnVt87mQ3bKftnlaWXyhvk6ei3FCJ31tDRJLxk/NK+8ctqDn5mkhi6oPbgdqumpD4btbS8VNkFFdYYBG4T9rxk32REMA+SSrYLZUIYWMZF5mWSkOq6sD6kgnPQewo/Sxtd2FP5lDLokONnmXihd1FJV5nL2E1wK8ridJ5wTKc+lQtLnhgnpNEF4QuCN+yZyOWjAEV4oV5KUrQF3E1Ko3bptpr/Y9QCCUHYcU9PlpCjcArKTGWknceDgE3mrNJtAc/WfP8//3XpbVt9TTyBHYtWQws6zJ8cutx45cDq7FyzcCHpvjAn1VHvjeEwicd0C5NMvXOstWdsAc01j9vgVu3XrOni/KQjnlPLsEEBKcUe4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(31696002)(16526019)(110136005)(186003)(5660300002)(54906003)(316002)(4326008)(8936002)(83380400001)(16576012)(86362001)(2906002)(66556008)(66946007)(66476007)(478600001)(6486002)(2616005)(36756003)(31686004)(8676002)(4744005)(6666004)(956004)(53546011)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dkoxVmdYYjJXbDlwLzdUcmVjOGlkL0pENnF2WFlUQTVsMXp4Nm9jUGNYYmNq?=
 =?utf-8?B?V21WTm9TQjVsd1ltS3dXMXQ4ZkFaWnZqZkVNS2NsMkZwYUU4a0FNOXo1aHkr?=
 =?utf-8?B?MzM1Tno2ajhVdE92cVI2VlpVNngwR0k3b2tOZlNCTTlCT2FYRTQyV3RGdFFY?=
 =?utf-8?B?WFZvWHEwRkFSbm10NUUzM1J4NDN5V05kSnhveExuRm1oRkZOM3Y1YXcyTWVt?=
 =?utf-8?B?dktuWG1xZ2gvVFJPWWVKdjAzdXEweTJJelROdTcxK3FsZnRvV2F0NFVXUS80?=
 =?utf-8?B?Q2JHT09wK093QUhNd3l4aldZZ1l2SCt4aS8zajY5UnBuUHJkbWNwdXFoK292?=
 =?utf-8?B?aHZaRlB0U254enU0czdPOE42dHZYdzQvNURIOVBpeXp2OTJOVS9oR3VlZzZ2?=
 =?utf-8?B?RS9QRVUrS25MSjRScXMyRjVTbjhEQzlneWhURjhXc2Z3cURDRFlIZnlQRS8v?=
 =?utf-8?B?blZOSktPM01WSmU1NUNvQVlaakdudG16V0Nnem0zMEh1SzgvUFUxbkpGazJY?=
 =?utf-8?B?SlN4UU5CVUtmamlEWkgwZFIxT1BMVTh2c3NiSEJYUHhtR1VWeFAwU2hJZ3dq?=
 =?utf-8?B?dG9CTjNoQ0E3N2I4SFMyajZFcjRwWW5LK0Y4NG9SQTJRSzg2TUp6WUNUS29n?=
 =?utf-8?B?UHB3VEpRcWlmOEkyblpPL3IxMUI2MS9tVmhPU0MrN0hKcWhMeVBpK3RXaVVa?=
 =?utf-8?B?L2RtRnNEWHNUbk82ZGE5Z3FId0VNVXh3N0VHT1dsOHBGZTVDRkNwclNWdjB5?=
 =?utf-8?B?dHJtKzZBVE1BWkVGWUw4VzRYQkoxT20yWDdrdXk5V1NnMXM0YS9xQVRZWng5?=
 =?utf-8?B?OVN5WnhXeHlCbVdodFA2SFo0eTZ6ZDVIQ0w5b3ltbDZKNzVtNmhJYXRzeTVk?=
 =?utf-8?B?QW85VW45YkhnV0REUkNJZTZYRXZmUDFVeGNyVmdtbDRmTytZTUpmT1pWYVgv?=
 =?utf-8?B?L0pWMmpvcU9wTFBHZktSdVY1VjNNTlBZZENNZ29HSUxzWDR4K05qNXpkbFBp?=
 =?utf-8?B?V256TFNKeWp0L1krT09wblBSazB2TElrampuVUpqS0NKSjRTMXkzd2pIZ292?=
 =?utf-8?B?ek1JM0drOXpmeVQwMmV0SGdYTVo0aldVYjZvUm9MZWs2dlBCaGlaNko5eHh1?=
 =?utf-8?B?WVlEL29pZXduL3dIcm53andkRnRIVVg1TGFKaFI2UE4zZThEK2NHSzBVRCtY?=
 =?utf-8?B?Q0NBSFYyc3EzT3M5Y3dDQmZ6T1hhTHhNWkJ1cVkxUWVHK3VpU2xOMWZsRnRl?=
 =?utf-8?B?UERpVHhFY2I1ZE0zOXcwYXFYeFVqQW5nMXFvWkllWTlkY1lhc1pjbXZHWFNm?=
 =?utf-8?Q?/MqWBMgjULNNjHsej8Rz1XC4UXf9fofxH+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b72314b4-1a7d-4eb1-638c-08d8c11ad4e5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 10:20:26.0577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgfSD3l7KLbjfVAqbKskP2f0ItjS531/HTAmBnKm2jDu2FDjmQFuzUPqrVGVfk7f/Ts47orH4xMbngjUZJKAQbIhaDX8VUu0YjCPZrn14z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5517
X-OriginatorOrg: citrix.com

On 25/01/2021 09:56, Jan Beulich wrote:
> On 24.01.2021 05:47, Elliott Mitchell wrote:
>> Previously p2m_pod_set_cache_target() would fall back to allocating 4KB
>> pages if 2MB pages ran out.  This is counterproductive since it suggests
>> severe memory pressure and is likely a precursor to a memory exhaustion
>> panic.  As such don't try to fill requests for 2MB pages from 4KB pages
>> if 2MB pages run out.
> I disagree - there may be ample 4k pages available, yet no 2Mb
> ones at all. I only agree that this _may_ be counterproductive
> _if indeed_ the system is short on memory.

Further to this, PoD is very frequently used in combination with
ballooning operations, in which case there are (or can be made to be)
plenty of 4k pages, even without a single 2M range in sight.

~Andrew

