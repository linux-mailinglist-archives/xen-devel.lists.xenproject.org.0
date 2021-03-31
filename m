Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74D34FE23
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103841.198070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCu-0004wD-G5; Wed, 31 Mar 2021 10:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103841.198070; Wed, 31 Mar 2021 10:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCu-0004ve-CD; Wed, 31 Mar 2021 10:36:16 +0000
Received: by outflank-mailman (input) for mailman id 103841;
 Wed, 31 Mar 2021 10:36:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYCs-0004un-Gm
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:36:14 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 708e5ba8-4afb-4791-94a4-f598a6585d17;
 Wed, 31 Mar 2021 10:36:13 +0000 (UTC)
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
X-Inumbo-ID: 708e5ba8-4afb-4791-94a4-f598a6585d17
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617186972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=BZyxwqwyKCBvk+CFEEPMfCfivieAaaU9nS1MxnsMyOk=;
  b=anUu9mHhbDqO7K2cjT5JUqp7AMREM17mju5grLFBe+qMiuELHJI4JjM/
   YlLGo+Kayp+3uExbeVjSuhXLV+2uOdfPjyCxYVPDIpXsYCQ5vAt6XZm/0
   4zZs8RkmbQFJbo60xO2exgi0eifEOLBxWFmMrcJxubAs2JEm33OkRp9xd
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7sweMx5zWJWaAZNnY8I3TtLQCrhCvt5dyYhSWNsHIcX7mNhRYJVlxKxRgWU3iQD6bGTKdMw74D
 7Y2rt241g3zBMKcr45pqAnzpmYPbZO/rN77CWnLE3dXrV2eo6knASSLCNHgfeJNILDYLhKban7
 0B3p54OROfNl6fSKuQ89IJnwQLZvJ9BIRckSmJ+iIiM256oMZBRFDDPgEdQI3rfq1l7Stbomas
 ffpeuIlarle2akh6b2GihexNZ0ybHLjmaj0DfIsBLRIrQYr9wnYo4mD1ySey5FvXIRm4PhXZIa
 bII=
X-SBRS: 5.2
X-MesageID: 40415665
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EBtb1K3DTN0tXw2AbsaiQAqjBTd3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcBdxi1SYzzrdnFebg9AGJY/Cd
 6g/cJBvTWtYjA6ac68C3kDUYH41qH2vbjhZgMLAANi1RmWgVqTmcPHOjW7/jNbaTNAxr8+7X
 PI+jaW2oyPu+y2oyWssVP7wI9RnLLau7l+LeyKzvMYMzD9zjuvDb4RIIGqmBAQjKWR5E0xkN
 /Kyi1QT/hbz3/KZGm6rV/M9mDboU8TwkTvw1OZnnfvyPaRLFlRa7sj9PBkWyDU5EY6sNZ33L
 gj5RPii7NtAQ7dhyO43tDUVnhR5zuJiEA/mu0ehWE3a/p4VJZtq+UkjSZoOaZFNif75Ic7Kf
 JpHcHR6d1HGGnqEUzxjy1BxsehUW80GQrDak8eutaN2zwTp3xhyVAErfZv0ksoxdYYcd1p9u
 7EOqNnmPVnSdIXV7t0AKMkTdGsAmLAbBrQOAupUBvaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dnXIuemr1YPf+nKFjw1ToeiGQTD7twsZR69xSobvnXofmNiWFVRQHj9agmfMCGcfWMs
 zDea5+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49RhagucTOBor2tvHKUfraKbb3eAxUGF/XMz
 8mZnzeNc9A5kekVjvTmx7KQU7gfUT54NZRHcHhjq0u4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66itqu6oGKx7FvZ9mkBAGsYMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYjhyUt3RCw
 wag1hs46q4I9ixyEkZepyaG1Pfq0FWiGOBTp8alKHGz9ziYIkEApEvX7E0Mx7KGRxzkQNDs3
 xCdwcAe0/aGlrV+OaYpa1RINuaW8h3gQ+tL8IRg2nYr1+gqcYmQWZeYySjSveNgQElRyNdg3
 p496N3usvGpR+fbU8ExMgoOlxFb2qaRJZLFh6Maolvlrf3Qw1oVmuRiTuGixY8R3ry+ywp9x
 /cBBzRXcuOLktWu3he3Kqvyl9ye2mHV29ba3xxs+RGZC/7k0c29dXOSru40mOXZFdH//oUNy
 vdZyAOZil0wcqs6RKTkDGeNHkvy5k0JNbBBLA7f7y74ALqFKS40YU9W9NE9pdsM97j9tIRWe
 WEYgmPMXfWDfgq1wH9nAdSBABE7F0f1dXm1x3u4DLmgDoRAf/OLE9nQL9eCdeG9GTgT+uJ1p
 I8rd9dh5rFDkzBLvq9jYfQZHp/DzmWh0icZeQhs4pVsqI/r6EbJeiSbRL4kFV8mCwjJ8L1nn
 4ESKt14Lr9KpZiFvZiDh5xzx4MrpCzN0MlvQz9P/8mcXwsh3HdOcmV47Cgk8tZPmSx4C/5OV
 yS6ERmjo/4dhrG8b4REKQrJ2tKLGA69XR55euHHregQjmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 I/x92TheeYe27Z3w/X1AELb55mwiKCQcmoBhiLFvMN29umOU6Uiq/v2fWNtl7MOHKGQnVdo5
 ZEe0wWZtlCjTdnrLRf6FnMdoXH5mQ/k1Vf5jl7kEXKwYbO2haDIX17
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40415665"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nt3GhNGopzsE2YzTerzZrxwAENTHZOA2BtwDyIC13GHI8g6UneOeJXM83D/uLGATlRC0wJqHXDZWeQIWIL1fLLngqTxWGhephZNQWrcMpdLehv7NDFd+Si4kQJKuAGjN9oS1XRxULMM/nWTnt6eZ7Bgviyxpbk4rq/L8P6+5N9bNWtLpkOvoB3QFwZSoOlfF4K8CcYg6dkOAvsHsFOctDhUMakiHcjV/JYBoMO1goxCuWQl2xP1U5T1A4BhoJMrbzBuvU6lweKXy11m3I++X7s+Kb/bP7eCr4O/twSg2lyDGUQhrX4BJfQm4U3w8sQcKdg9H6wNubDRn0jQ++RBi4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbLS6BH8MbuCXwxN5xjKUX6UwKmNt7gnMdLP8UFuW2Y=;
 b=G8Tgtvm72k9EzMB5hH2xb/QvQqmjaG40JxAoQtpeyq6vOjELydrqhjF07xLDLUlVkUWkTJ5uz9UNwhI6FQMGsLGj1x9JDWf6J9n2K/KSFFBZ1CVHfguM450CqmNnxasGh0RtaVwYdswZ88et0g10+D1FnELdPvjZyG3JG+SYMkeCq30vR8slfU+1eTzLrQ6rfudVNQmPy1XjBQ0/LL1trftJrFhcx/PfcQdekz+Tj3ag9xyTYPvp528s0LFeykB0N4OF3ncJNYihDaOipzuP3tzk5NhYR/g5upBO3Od1Jz/y1dmafC/moqyXu/3QYu4GM2a9x5zI9vwLSgnIZJP9yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbLS6BH8MbuCXwxN5xjKUX6UwKmNt7gnMdLP8UFuW2Y=;
 b=KEKsVdkyKlVa/Q+s8RzEVvve8vqeAKcPkP8yiGIFTFT6VswAkiX2God7WCHd5S2kQOsBZJrhEnjYNP3+wsctiihkIArWAPRjFel1a9/r4JJ6jwxPOYgQbWY+PVNyu0IjbFcycghLhCa8sW6picM5IGik1ALDVqGYSc7Yi9OheJ8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 05/11] x86/vioapic: switch to use the EOI callback mechanism
Date: Wed, 31 Mar 2021 12:32:57 +0200
Message-ID: <20210331103303.79705-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210331103303.79705-1-roger.pau@citrix.com>
References: <20210331103303.79705-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8063ccd-c7ae-4def-a92f-08d8f430c94c
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5968C7D475CF1E28866D849E8F7C9@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /FFoXPnFQtGk3HaQwqeNi3TMIhhfxrj3infJ+2yDmaEOrXF+plMov929zYxyWtUU423JsZL8YDUbjMtLrttS1ikOYJUSQX9CufkYu1wfD482gIdOxm+k9sGZswZ6dClfl6+Cdy78GLyLEivg3vbhSwgUd2wt4RLuMyBwxnRVuvpc1ZGDWscWrqEjyzEsuoBdBqGJbbm1tiHEJi/rXPJ6F6s2SW3IaAqAD4dvwr4LCPLqjfXrkcAlM2ez70AZubdumVqGF9AGj7CSuPyDPRovTV4hn87Dg1hrzXj/xVHQ7j/17HPyYh1kPu6tD8GtpaaCUPmTas22LqGh80NamRVxCD3l6yKqHnPSoU9xbUCyDpY7ug8TGpUiTlStIAQsATXCC0VGIBTh2cwmkhmVi9ulMOxJR/uSkIUfV/HZZ6glbqq37A2ym5iUhuaniMsnMAsAza/mGABs873wJCnAbn2xaAPqfLNshRNUQn6Tu3E60RkmNFoYwGS/i0VxboH/B1lVXbi9+nQKx8xL2VYxv/yFIGUdZJb9zTzwRCvsiakYmfKb27LYx5esXShzRIqZ4CJQSw2UUZqRU5lg3hCnQYMnd/46RCGivqS+0enOkO5Mq+pC0tVtts5uMQaVYVS3WsFWqiEu66jHoMRE5p0dIKsm4dl5qq4sqwno8NEsOFz4yx6YH5a7kGc60TQpjY9hPIeH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(26005)(2906002)(6486002)(8676002)(1076003)(36756003)(38100700001)(8936002)(83380400001)(16526019)(86362001)(186003)(6916009)(6496006)(66556008)(66946007)(478600001)(66476007)(5660300002)(316002)(4326008)(2616005)(6666004)(956004)(54906003)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RFpHdnBDbG51MDJ6TEVrSlA3dTltbW1DeDFRdU5qUWxZZFdRMExVOVdZWER4?=
 =?utf-8?B?eHNCVWxEMXJnTXpKVFF4djl0MFVZYThZenl1djROSDZreGpjNmFaM21GYzlE?=
 =?utf-8?B?T0IzbldWK0ZxVmlPNXh0U2p6SXBhRnJ4dUo3V2l1d3ZwM3ZOaXZHMzluMGV2?=
 =?utf-8?B?RDk3aVcvZUo3c01kTzREdktqOWZSYTZIbFp2T3JPdGVSNXdieXlzNlhmVkZk?=
 =?utf-8?B?ZmFaK2xqUXZkSkVvQzlOU09QV0lsSTFJQ0haSDRKWUhWM0lyODhHRnNHUVVZ?=
 =?utf-8?B?RnN5eGc0TDVkSXR6aGVuTGZQdDBJcEI1T3M3Nk13NlFva1lJb3Frdml3NDg1?=
 =?utf-8?B?Rk9XNVNYa0VhWWdROXBwTGFTVXVCR0NXaUJtWkxGUlhjblZROHhiMzBiY0NV?=
 =?utf-8?B?dC8vdDhsVEN6Y0k4K3RUeUJCTzlWMmwyNTZUNE1GNi9WcEViNGpOK1FwcUFi?=
 =?utf-8?B?VGFYdkZwS3lZRnFnR0NPSFBhWENvbERCZjdZZzQzMjdzVmpaQmNhcnNqQkJM?=
 =?utf-8?B?eGl1RzBKdzN1UkYxMDZhNEdZeGJvcVJGbEp0aUZjNDVjd2dxbWFMQ0YrUWsx?=
 =?utf-8?B?RDFZaDd0VHIrNkRiVFhUNHVnOHJWdkZQRjIzaWg3QTQ4OGt3a01jbzkxMFNv?=
 =?utf-8?B?K3RSRGpsQjRDdlBMY0ljU3NVZG90VDl5RlA3dTRBdXNmQ3AveEc0Q0xXOExY?=
 =?utf-8?B?QTJ3a0RMN1BTOVM2YXFJRUtERVE1VjN0NHZuM1I2WnR2ZmltR09tNzdROW80?=
 =?utf-8?B?TWVQc1BSakx5UWQ3NGpMOTl0RGIveUp3SW5pUFpTQmtXN3IxNjBTNUlkYS9x?=
 =?utf-8?B?Z1Q1YllSS1d2UEVZY1Y4Q0N6N0RMR2tVRnZGZVFzOEhuenh4YjJVcU1EOXpM?=
 =?utf-8?B?RGt1Z0dXbG9tbms2c01CbS9Ub0R4R3NIdFdUdXBmaUVpS0RpYW9Wd3o1MzVl?=
 =?utf-8?B?K2hiU1NSNHJqZXVFY2QyVFVOUTkzRTMzaUNTT0dCaGYyU2JGeUhHeEp1c09t?=
 =?utf-8?B?R3NiQVlNMmRHNWZuNWlWQ29qWVRoR3d2TVNmQzM5QlZmZ2tuOFEvY0UrZ0ty?=
 =?utf-8?B?aXpYbGZpVzlyajZuZnBiR1JyYXp2RURCRkZoV2lGajhxRDRFaHROUXBqdlZl?=
 =?utf-8?B?eHZzMlV6UEMybUVwbC9xZ1Q5MFlTc0xXRXVjU0pyTHFXMGVqbjFSVXpPZFEz?=
 =?utf-8?B?NjQ1K20vTjZ4N2dYdzkxeks3U1o2bTkvRXU2OGwrYWZ3VWZxWnRld0NjQVNM?=
 =?utf-8?B?UWxwSGRGc3B6OGhFVTJHVUhJcUNVU0tOMk9ZNm9JaHZRV0lnMUg5a2t1QjVp?=
 =?utf-8?B?L2tFTWNlaCs3Yjg2c283T0d3Q0xDeTB5L3VLTWFTaUU1a0pkeWtVT2pmS0dl?=
 =?utf-8?B?UjZIcjU1OHZvcDJDd2lZSldPeXRWSk9pQ2YwUE0rajBRTWhkUGNLUGVSV2pt?=
 =?utf-8?B?ak5pb3ExYmMxcmd4SCtSeTRKKzVjMS9DODR5eVNXbDJHV3psV2hNcEVxUVVx?=
 =?utf-8?B?U0RUaHZFUkViSG1Oem52YkdzUlhTWDg2eEM1WlE2UWgzSUs4OURiOFArUitM?=
 =?utf-8?B?STcrcUJxbXVuWERyREdBVkRBVWFyYzUwNWppNlY4MjFJUjJldXQ2bk8vOEhD?=
 =?utf-8?B?VGFSTHd4Wms2emtmN0QzK0F2RjBqSERBYUNnekVCQ1h5cC9qbzAxVXErZlFm?=
 =?utf-8?B?MVEzNmpWL2x3RFllUi9UUDAyL0ZPTFZtb21ucXF6RExZK1V3aDhpRW1KS1lN?=
 =?utf-8?Q?fBrFuB/atB95mQZWMzdx+OtJ9SQEyWerXsdy3rZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8063ccd-c7ae-4def-a92f-08d8f430c94c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:36:04.6593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWaxEIV5pDDpgahkbuy9zCxae3GNfBE9cDuQjcyBJeNdzTb9Nx53g8mynf5xb8FaYUIvreKXi3l80ZddvRAKPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

Switch the emulated IO-APIC code to use the local APIC EOI callback
mechanism. This allows to remove the last hardcoded callback from
vlapic_handle_EOI. Removing the hardcoded vIO-APIC callback also
allows to getting rid of setting the EOI exit bitmap based on the
triggering mode, as now all users that require an EOI action use the
newly introduced callback mechanism.

Move and rename the vioapic_update_EOI now that it can be made static.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Explicitly convert the last alternative_vcall parameter to a
   boolean in vlapic_set_irq_callback.

Changes since v1:
 - Remove the triggering check in the update_eoi_exit_bitmap call.
 - Register the vlapic callbacks when loading the vIO-APIC state.
 - Reduce scope of ent.
---
 xen/arch/x86/hvm/vioapic.c | 131 ++++++++++++++++++++++++-------------
 xen/arch/x86/hvm/vlapic.c  |  11 ++--
 2 files changed, 92 insertions(+), 50 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index dcc2de76489..d29b6bfdb7d 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -394,6 +394,50 @@ static const struct hvm_mmio_ops vioapic_mmio_ops = {
     .write = vioapic_write
 };
 
+static void eoi_callback(unsigned int vector, void *data)
+{
+    struct domain *d = current->domain;
+    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
+    unsigned int i;
+
+    ASSERT(has_vioapic(d));
+
+    spin_lock(&d->arch.hvm.irq_lock);
+
+    for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
+    {
+        struct hvm_vioapic *vioapic = domain_vioapic(d, i);
+        unsigned int pin;
+
+        for ( pin = 0; pin < vioapic->nr_pins; pin++ )
+        {
+            union vioapic_redir_entry *ent = &vioapic->redirtbl[pin];
+
+            if ( ent->fields.vector != vector )
+                continue;
+
+            ent->fields.remote_irr = 0;
+
+            if ( is_iommu_enabled(d) )
+            {
+                spin_unlock(&d->arch.hvm.irq_lock);
+                hvm_dpci_eoi(vioapic->base_gsi + pin);
+                spin_lock(&d->arch.hvm.irq_lock);
+            }
+
+            if ( (ent->fields.trig_mode == VIOAPIC_LEVEL_TRIG) &&
+                 !ent->fields.mask && !ent->fields.remote_irr &&
+                 hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
+            {
+                ent->fields.remote_irr = 1;
+                vioapic_deliver(vioapic, pin);
+            }
+        }
+    }
+
+    spin_unlock(&d->arch.hvm.irq_lock);
+}
+
 static void ioapic_inj_irq(
     struct hvm_vioapic *vioapic,
     struct vlapic *target,
@@ -407,7 +451,8 @@ static void ioapic_inj_irq(
     ASSERT((delivery_mode == dest_Fixed) ||
            (delivery_mode == dest_LowestPrio));
 
-    vlapic_set_irq(target, vector, trig_mode);
+    vlapic_set_irq_callback(target, vector, trig_mode,
+                            trig_mode ? eoi_callback : NULL, NULL);
 }
 
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
@@ -514,50 +559,6 @@ void vioapic_irq_positive_edge(struct domain *d, unsigned int irq)
     }
 }
 
-void vioapic_update_EOI(unsigned int vector)
-{
-    struct domain *d = current->domain;
-    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
-    union vioapic_redir_entry *ent;
-    unsigned int i;
-
-    ASSERT(has_vioapic(d));
-
-    spin_lock(&d->arch.hvm.irq_lock);
-
-    for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
-    {
-        struct hvm_vioapic *vioapic = domain_vioapic(d, i);
-        unsigned int pin;
-
-        for ( pin = 0; pin < vioapic->nr_pins; pin++ )
-        {
-            ent = &vioapic->redirtbl[pin];
-            if ( ent->fields.vector != vector )
-                continue;
-
-            ent->fields.remote_irr = 0;
-
-            if ( is_iommu_enabled(d) )
-            {
-                spin_unlock(&d->arch.hvm.irq_lock);
-                hvm_dpci_eoi(vioapic->base_gsi + pin);
-                spin_lock(&d->arch.hvm.irq_lock);
-            }
-
-            if ( (ent->fields.trig_mode == VIOAPIC_LEVEL_TRIG) &&
-                 !ent->fields.mask && !ent->fields.remote_irr &&
-                 hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
-            {
-                ent->fields.remote_irr = 1;
-                vioapic_deliver(vioapic, pin);
-            }
-        }
-    }
-
-    spin_unlock(&d->arch.hvm.irq_lock);
-}
-
 int vioapic_get_mask(const struct domain *d, unsigned int gsi)
 {
     unsigned int pin = 0; /* See gsi_vioapic */
@@ -611,6 +612,8 @@ static int ioapic_save(struct vcpu *v, hvm_domain_context_t *h)
 static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
 {
     struct hvm_vioapic *s;
+    unsigned int i;
+    int rc;
 
     if ( !has_vioapic(d) )
         return -ENODEV;
@@ -621,7 +624,43 @@ static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
          d->arch.hvm.nr_vioapics != 1 )
         return -EOPNOTSUPP;
 
-    return hvm_load_entry(IOAPIC, h, &s->domU);
+    rc = hvm_load_entry(IOAPIC, h, &s->domU);
+    if ( rc )
+        return rc;
+
+    for ( i = 0; i < ARRAY_SIZE(s->domU.redirtbl); i++ )
+    {
+        const union vioapic_redir_entry *ent = &s->domU.redirtbl[i];
+        unsigned int vector = ent->fields.vector;
+        unsigned int delivery_mode = ent->fields.delivery_mode;
+        struct vcpu *v;
+
+        /*
+         * Add a callback for each possible vector injected by a redirection
+         * entry.
+         */
+        if ( vector < 16 || !ent->fields.remote_irr ||
+             (delivery_mode != dest_LowestPrio && delivery_mode != dest_Fixed) )
+            continue;
+
+        for_each_vcpu ( d, v )
+        {
+            struct vlapic *vlapic = vcpu_vlapic(v);
+
+            /*
+             * NB: if the vlapic registers were restored before the vio-apic
+             * ones we could test whether the vector is set in the vlapic IRR
+             * or ISR registers before unconditionally setting the callback.
+             * This is harmless as eoi_callback is capable of dealing with
+             * spurious callbacks.
+             */
+            if ( vlapic_match_dest(vlapic, NULL, 0, ent->fields.dest_id,
+                                   ent->fields.dest_mode) )
+                vlapic_set_callback(vlapic, vector, eoi_callback, NULL);
+        }
+    }
+
+    return 0;
 }
 
 HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_load, 1, HVMSR_PER_DOM);
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 10b216345a7..63fa3780767 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -192,7 +192,13 @@ void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
 
     if ( hvm_funcs.update_eoi_exit_bitmap )
         alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
-                          trig || callback);
+                          /*
+                           * NB: need to explicitly convert to boolean to avoid
+                           * truncation wrongly result in false begin reported
+                           * for example when the pointer sits on a page
+                           * boundary.
+                           */
+                          !!callback);
 
     if ( hvm_funcs.deliver_posted_intr )
         alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
@@ -496,9 +502,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
     unsigned long flags;
     unsigned int index = vector - 16;
 
-    if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
-        vioapic_update_EOI(vector);
-
     spin_lock_irqsave(&vlapic->callback_lock, flags);
     callback = vlapic->callbacks[index].callback;
     vlapic->callbacks[index].callback = NULL;
-- 
2.30.1


