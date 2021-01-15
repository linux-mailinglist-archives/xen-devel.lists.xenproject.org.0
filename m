Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89612F776E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 12:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67962.121519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0N7S-000469-HW; Fri, 15 Jan 2021 11:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67962.121519; Fri, 15 Jan 2021 11:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0N7S-00045k-Do; Fri, 15 Jan 2021 11:18:18 +0000
Received: by outflank-mailman (input) for mailman id 67962;
 Fri, 15 Jan 2021 11:18:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0N7R-00045f-8V
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 11:18:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df64d1a9-f18c-4b4e-a797-f91d5d6ea83d;
 Fri, 15 Jan 2021 11:18:15 +0000 (UTC)
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
X-Inumbo-ID: df64d1a9-f18c-4b4e-a797-f91d5d6ea83d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610709495;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d4zsbMTVYGdj9UVCnqxaXuHZga09VL2pqpt/T3wsr1A=;
  b=BfkE5cNlhOATWzG2QlwOXxRjuTFmpZJzCBQrYhqfv3AWw+anF7UNCAgv
   jbIO4Z5p91QhM7sQsXQGYMGPA6bzMpzkMnoPubhUY2V5ROtH7XGgJDYk1
   /oih8tGaiYEeGdka/fTnfUrO+1/J9/nSxwrmT8Xc6Q6isfWxPmWvmOaIt
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bcaQif4f9PKn2kDgi6qXr/VMukK8CWQg0lEpZ25uYvp8KRSMo4uEpIExdYMqixb2NEhYJ10Wat
 kQl0AomXsRhB3W/M0YzF6YuQG4+5oAR/xTWG3c6VPiey5T00zvcOMGm9MxKRzMipDo/1EKc0Ab
 bddp2QVY/chrBWAyQh1sfTWMXn61hIlDgXBTyHmpeGM0M2jT9h5ytyr8fG4XiIWTJi9FSuEvAE
 RDC1eZIMMa2/55b4ekCH8GK4pmEHrZxU3JhJ4frUXV2KbeAH1fyaxji0ePIIzLlH0eSAFonXBl
 Btw=
X-SBRS: 5.2
X-MesageID: 36456600
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="36456600"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+YQf8/5tDAUDD2x9bpxOPwWY9vx3I5o4/5JRU3SgysssWUV1s4qY2qbx5epjLFNy4Miv4rtZJfZ4mbHgknNgQSvs3xD2pemO3PuUx18UrRiAbr+L02eOwzxBUIus8eOQ1saFeHizocJP5MduztdxojmfSEDb0w3kuyMlvcTLUqDXcsuuclD04PSdow98uChCfmuIXK1ZKzGwqi3QuHsCq0RfUT33g+TDXfd2hb7UM0kJqYCA8TSlewS/0CRF778Sc7uL1SKFgtipMqn4d3n8whd1vYYjKVHpILlsAe/lBY2cjyNd+Wile8NmQ2Qpuc+jIx2E2kIg7S1P4tjGiIMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4zsbMTVYGdj9UVCnqxaXuHZga09VL2pqpt/T3wsr1A=;
 b=Y0D5+oM9l5RNF94Tn2kFNPloV/hjOx5onKj/pZsHv1jHHq6XixEbLtjKslgYJl37VH3W3MfLSiSqQntZLZbEoJhiTSOSmArLaBHXFt7+/cPJ3L0qlaECNGwMEw1kn8fAHj4kyUxkUX7MIbMT3ng4r2I0/7xyZg3nFFT6uYYFLZjj7IxVjdL8BePmDb8Ef61+LONvu2DW0izQ5VZb/WZcZAeqHWMHgzXC6QP7affceLvR5s/3TyNU9oYnmi5rM1Iuitwe9unW+uVz6NHimT6pJwK2881PM7MfxjsXI7os2bOc+AvYq06zbxRT00WeBnPt9Zq2uiqNbFyhthUt05ULKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4zsbMTVYGdj9UVCnqxaXuHZga09VL2pqpt/T3wsr1A=;
 b=cMIpkPniaJjnX7xTgmVmvSvEUFODRHYtw3RQY/0dsiXkeuCvs403JzpD5NpHRqkdN91hO6ignstglw5ppkULRNy2oxu6IMBmLaITdjTAbRy9nh9XBBYFYRTB6l1NF7x+QbSRxXkIzC6CKLVlXRrbxnYiwB9r204qSpqurw96n3E=
Subject: Re: [PATCH 2/3] lib: introduce xxhash
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, M A Young
	<m.a.young@durham.ac.uk>
References: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
 <8545f5cb-8c4e-4486-6350-57de8bac36de@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5c773c7c-2864-6174-be4c-e4c484789432@citrix.com>
Date: Fri, 15 Jan 2021 11:18:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <8545f5cb-8c4e-4486-6350-57de8bac36de@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO3P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::20) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78c26a79-8131-4b79-935a-08d8b9473eba
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5646:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB56469B7C762E968963B78E87BAA70@SJ0PR03MB5646.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nFUXykGfjUgK+tmGbp9IHvr40CUgd7XaFPGgjj+tY4CK38Nrhaxvsqrq8CZVfS3xc2BOZy5D9IujxIcMiXP8OMZ+vFMzbLtNHLrmWa0NXO/8Zu6vj+yxucQhYsP2MTw2yIxMy3y4YJY7IW94pEHNN+0Zkj1VVCv3uYZ7xAdzjyZv1IKoGM47TmWKUmdB+EqZs1Y732acObLNrt92tM2ekJkC9XNxUBVuPYzldXP7wpdLN6iezVUidtX0w5hPzzXlfsg7oAGr0ElLBm5ERUAiWJR4Tz1ZJ1hI9qYn9ZtgUiG+1korxbTqVX1Nz1gaaMyRn+4HwqBA5HK3CcU471lqrFaVsDWKksxDNYktyPM+EGz9BaQ0xqeTizvExXjalRBOnIiXum/a2sx7609mn/l8/ncjPPi7bOD3zVWEJw+wDK0TgM97ymQQpNngHEUEv+VWRVVtaKXSJiCDsZftkbjPFtAxleqQsJjjHIbjbcmv8pc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(66946007)(16576012)(54906003)(110136005)(16526019)(6486002)(8676002)(478600001)(26005)(66556008)(186003)(6666004)(66476007)(31686004)(31696002)(2906002)(36756003)(5660300002)(4326008)(2616005)(4744005)(956004)(86362001)(53546011)(296002)(83380400001)(8936002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dk16Y291UXB4OWJ1UkFwa3F6Tkxyayt2Wm85Slp0Si82QVUxQW1OeUJNVGRh?=
 =?utf-8?B?a0JPN1ZkcmhwYStwSzMvV3NaTThYZ0d2Ui9EUnFGOS9KakkzRWFESWxadSs2?=
 =?utf-8?B?VVczQUthSzNtNWFCNDhnNllzUFhaZHJTMTFZaUUyQ0pqTkdzTC83NWQzK2pm?=
 =?utf-8?B?alBzeHd4b0NSVWhaYnlIYkdpSVNNUUJna2s0b3BUcCtaWElFditwY3RiZklX?=
 =?utf-8?B?WXptQ1VidG5WeE5kdjhZLy9BdTdGUXAyajZPZVpDMmZGb0EwWjhtYkdUSFdo?=
 =?utf-8?B?ZVBzc1lnakd2bEo4bGNMa1NxSEF3b3BzZWsxeHNUSnRobU9PTk1Ma3llWFNh?=
 =?utf-8?B?TTAxNGdJNHJTc3dhOTVaRC9FMllRVEZWUmoyZG1qMmlBNzcyMFdZT2NtdnhI?=
 =?utf-8?B?a2VHRjJRREJzS0RGWlg0cG9jNHNPMjFVWmxjZUp1cC9xbUZLZXBUTzA2Q3Zo?=
 =?utf-8?B?RjN2bk5lVUhRQWtjMThKaFlQK0dDUUtGRnA0MFNlTnJoYjFjUXBOWU5nY2JG?=
 =?utf-8?B?RHdjU3V4N2hjSHh0ZExEaWtneEJZc1MyNkpscjV1T3cxZXB4T1oyTFh1cDZo?=
 =?utf-8?B?U0htLzVtMlpidUJVdkRtWDdTay93OWFNME1ja2lqVmRzbDJodk9JVjhKQWNO?=
 =?utf-8?B?Mi90N0w1Sk1XVWluR05mUElqcUp5TTI0eVNuNGVpRXRFOVB6T3RnVlFlU0Fh?=
 =?utf-8?B?RjlvMmNrMW9DU1I3aUdrMlQrMWw2L0pnbG1jTW82TUtSOVNQQS9wUW93MmpF?=
 =?utf-8?B?T250MmxpRmswOW5IR2Q1RE02N1g1bE5lRzBwM1A3U01nUjQvWUVuQXZ6QytQ?=
 =?utf-8?B?UE5Rd1BXWjNYb1JGUXIvaGxNUVN4VHArRG5YL0JLZXcveFVSbEhZWjFpRWlr?=
 =?utf-8?B?dytPeEVBcGY5ZFdsY1lzTUdHMDlyY21pR1Z6N21ETmVNSXBXSzUxakZBOFN4?=
 =?utf-8?B?WC9lNzBYMHI4TW5vWnNWQTVKb3hTVkxSdjZIVjBxbko2K3dUNnE2ZWJJRlls?=
 =?utf-8?B?TVAzVlhRemo1ME0wdjdQWDNVT2FZT1B0NmJKR3lxVktaUTF1SUhrUlRVOXcz?=
 =?utf-8?B?a0gra0sxWEN5eER3ZXEvdmNGR3FEcWpabXoxQUJPUkxMLzhVZGo1TFlEY21R?=
 =?utf-8?B?UndYRm9GSG92eSt3QkxqQ2dIN0VFclkrZXdCKzlYWmVoWmx4WmdXeU9OV2h3?=
 =?utf-8?B?dFJGcitZUkc0c1VZZXdtVnh4MkplOHJkSElYSk9DMHJ6Q0pVZFZhRk9RYW1a?=
 =?utf-8?B?ekdBZlRqVWhUWElHaDR4Z2dDNEdCVXhGMndJVFg2UHVlYjBoODc0UlFlYkZY?=
 =?utf-8?Q?QEmKu2a8Tf2UqLJpNpMWpNCBP85WPXrlDX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c26a79-8131-4b79-935a-08d8b9473eba
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 11:18:12.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lk9gj0XoAWL6blyCbvRChlwKhegPU9c1olEuiAM4sDYPn3tOtIVdLthP0INUc4z32KDRHjMIaskq9VCustpOgYm6in6TxdGlXP8Z5L9fauU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5646
X-OriginatorOrg: citrix.com

On 15/01/2021 10:06, Jan Beulich wrote:
> Taken from Linux at commit d89775fc929c ("lib/: replace HTTP links with
> HTTPS ones"), but split into separate 32-bit and 64-bit sources, since
> the immediate consumer (zstd) will need only the latter.
>
> Note that the building of this code is restricted to x86 for now because
> of the need to sort asm/unaligned.h for Arm.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I think we do need to sort ARM for 4.15, but it doesn't need to block
this patch right now.

