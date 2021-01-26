Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1469530440C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 17:57:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75328.135600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Res-00084Q-Co; Tue, 26 Jan 2021 16:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75328.135600; Tue, 26 Jan 2021 16:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Res-000843-9T; Tue, 26 Jan 2021 16:57:38 +0000
Received: by outflank-mailman (input) for mailman id 75328;
 Tue, 26 Jan 2021 16:57:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PjTf=G5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4Req-00083y-By
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 16:57:36 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaa9f744-97fe-4968-9f2d-c01438b26fdf;
 Tue, 26 Jan 2021 16:57:34 +0000 (UTC)
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
X-Inumbo-ID: aaa9f744-97fe-4968-9f2d-c01438b26fdf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611680254;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4fguACmtcg03VCx8XecIJ/7P0HAYp1GxGXewOgXJ53Q=;
  b=eFeSERPLezpGZm5lMMvVZCyd/lpgEZn6OXIQIuVID4lnVAv0UB7z2dC/
   sV9YX/Sr/oJksdQVbvYMWQkSnb5vRT9IN+rDNxEGIjDjS6g0NGkDfl5qH
   B8tArMPetg1BbLma5/5gyRtpsCDyRKxRpk9a6nVDIKQyX38JOoeu7+2c1
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xO2BuPt/j3SKvF34/giTkaSL+qxgdVWfJCoxYy3zP+zACbwOHHSAgBM7mzTVCCtgRsID+1pw4M
 ciyQidpjyPzM06M8CSinBSGTpxurleKW1hTb0nF84nuC/YMIF44NRnz+97+J1fXIlsmiNnj7ho
 AenHB01FC/qEzbLmjGTrJpL1xTNqVfbmEz0CleNBE3S/CRecdLVTFrCzorxfxNiwWw3EUu731V
 xqZXlUCqQtq0CLW91wfnBiKoCMbnyF8p0dTrFInRbGav3WSYMRn+MOQOF2M5s+UHBhLx3kW25Z
 P3E=
X-SBRS: 5.2
X-MesageID: 37202255
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="37202255"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxGrwTb5W5IXCEx22uCgb4KVKV1apCaorPZAyGRhWMmEDP1AdFcPdlY/uM5vlLNqw+ErUv+XeuFIu1wFvS2ggWOUfx3rX2dSKugYpbW4HOPZ+1zv03s3kAf62aDgiysZrGOvEe4GAJydNkmqytOJ9Q99VQS0fXXGe2NQHAgfVXcTpe/0YVVZ1apOaXEYW2JaFE26SAebdRevbLVhtvBBqch4fLes/9kKDpwt6eLtiXFFRDLkBWGgyiMSNsjPu+PylnCoFcbShnSY/t9bLnYvKjghuOosdzTajokuABLzOi47fgBiivEsntliFZtoHmkkHklJXfTTjrvcuWAh/h0Ojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOmcSWe4kl7YGRgMpBv3Md/25J1BuFNzG511s1A3SKE=;
 b=JXqz8AYZJHnFbw/QkxCk0LQ/Qy6CqpLKF5HRfaDUkQE/lcxYIWl7WvHBqwwVtpAfDRCGW8NV1YjowEYv/UuZ1Q2gXwY+bmzgSz1+gzb2wn/zV2LfYIO69MePnw3OlaWGqpCARv7Iy9UgDsJn5+bTsTycsh003geD7MCmPymYninXrHyjchCdKilfvRtIp0H6ZNzSQWVckdRRHZQv4bD4WtWhVT15skawZNt+zcBStGwdCm9MfE1zp6K3+beSJmxMxhF+W7h7AhPaHvkaX26+vC6+hmQ/2vmWnAL/MIh9SCp489vUlp8YFNu3d3s1gRcfFQeapT16P5A44n4Zog5Ucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOmcSWe4kl7YGRgMpBv3Md/25J1BuFNzG511s1A3SKE=;
 b=Hzv+LihKNSR89radZK6oWLXNSG3NFZ5TV71ly2th9MDfeuycXveR8m/KJB4RvjXuUjM7YQqysBK3+SPvfMXK6lYrBdYwbVeIKHeixlq7+74IfOj2nKYpKfwZYKJfcpc+rpKRulD0HqeTcbKHmvJqbHNYWfEVDvib+2seT6hQGtw=
Subject: Re: [PATCH] x86/PV: use 64-bit subtract to adjust guest RIP upon
 missing SYSCALL callbacks
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <29c38fa2-8337-0566-2053-ddcaf88ed01d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ed049c44-6d3b-0e2b-e541-47c011583167@citrix.com>
Date: Tue, 26 Jan 2021 16:57:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <29c38fa2-8337-0566-2053-ddcaf88ed01d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0312.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::36) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9596682d-98cd-4abc-f237-08d8c21b7882
X-MS-TrafficTypeDiagnostic: BYAPR03MB3607:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3607EB21E98B9E993A77B442BABC9@BYAPR03MB3607.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A7eh/VnA2hnv4S0oDx2rcd6dgofjvi2Mt3HSt6VhXxidOxbrGlVuNCz5eDUn4LoMd4W2SDLdRB/xZw4xa4uhMtv5TEMZy1Dj2P+jqyuyiuK+9YmKfb7HGI4104sSJKZ/GJD+YyQTuDxiXLxzk7Akjed9Ts0tuaatpJnnbxU4Nhj7ROKgkjEy+CYPl+fKM1nTSJ/1OYgZPq71yeRYW3CHWFwmZKYLrTRunH+Ymft4H1Nehve4jURxtLvKOgWG/72GZvsAyI43Db2KDlowPVQZKF+al4Dfau+i2v/w4sGKDjrjjOe5Yhy6gBsP9vwBJib31b5cs8Uss1wLlvPFWRfRMRA41UFXCH/Ooh8RSYzeZgoa/+aT+SkMj0Wt7rG8pPWdscPqPZdDYTxII+S+wgkks3ZeQNDjokNRB8KYPMFFH/pfQ3cwIEYxaArvuG/FVeO3es4/jRRc40cFPCcsR2A/CamaJDdLkrO2MGE235sKbOpVmF4CurXRPwF4xFs/Rjmr8879I4Vi45Pkt/n/ikWebk8kvddG5DYF/Q2zwuBXpGl29V1oKXCC8KLd/uLmHvDJMjMY09eS4OH+9/7z2nHQSZL5XzRYkhjKhCYaOybpVGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(31686004)(6486002)(4326008)(5660300002)(54906003)(8936002)(110136005)(36756003)(16576012)(6666004)(53546011)(316002)(86362001)(2906002)(31696002)(16526019)(956004)(186003)(2616005)(66476007)(4744005)(66556008)(478600001)(66946007)(107886003)(26005)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NS9Td0RrZGZ4bkJPNVc0UUNmZWNWZ2hIWVdGQmczQlNiUzNTOUtGdWNMODM5?=
 =?utf-8?B?K1Y2TWlmUmorRHpOb3NGUG9hWU1HZ1k0cGdNajdHYjJMQ3VaMHQwelJ6SXdX?=
 =?utf-8?B?SGlzNnFVVWRORXNwV2V1RjJGLzJWdkovZUlodk9ZcW5sVEZhY1NHZExhTU9G?=
 =?utf-8?B?YWhUbWVuSFFMVWtOZTJRS1djczI5dFVPbWNIL3JWOW84ZE1RSndSTFlnOTFJ?=
 =?utf-8?B?NSsyR2ZKdERIeGJTR3Fsck1vR2gvdWpCTXhYZXowVU9weGwvQllhSXNWZTB3?=
 =?utf-8?B?ckRzNWtoK1VSK0h4MkdpSkNDYnV0WkxhRnhaUVprbjVaMHJUcFhsaGN5dVFr?=
 =?utf-8?B?OHROWXRTc3dSU2JQOUJSaU5IbXlxSjVIc1NrVlVLWlJ0MmhEeWcvWHp0Wi8z?=
 =?utf-8?B?ck9Yc2lHMkdydHowNzloWkovT3p0NjBKOUtnY1pNZUVWK0pQZlVQOU9iOCtI?=
 =?utf-8?B?Y2djOTk1MWxNWmJmOGFleEFmTjN4ME5wcVJHOVUyOUtiNWgvUjRBaXpwVFRj?=
 =?utf-8?B?Y0xYYzl4MElOblRtWUcvVUU0NEh4dUc2VEJxR0Q4S1FUZmYxQ2RhVENPNXox?=
 =?utf-8?B?UStqZHZ5d2Q3QzVHa1hvVFdwWUJaY200NmhFS1lKSXEwMlFaZlQzeitENnpK?=
 =?utf-8?B?TStrYnd3ckZvS0MzNm56bHZyYkxDTFBCK3V0MmFncC9IeFZtNTl2T3A4Z2JQ?=
 =?utf-8?B?K1BFNFJFUGRDZzVkSVNrVmFtUXVHVkxZdURJR2M5S1E2WnhoQVpZaUxuZ2c1?=
 =?utf-8?B?VnIrNG41aWZwSFg2RHZvN0N6OTZXZGpQU0h5Wkp0V01zOEdtRlRWWURjOTln?=
 =?utf-8?B?YUx1T3JGYWczakhJb0VZWGJQcUhzV3hXdmJQNmo5bnhpMmpFSExDYXpGdGRy?=
 =?utf-8?B?SFRpbGFraitoSy9jTEhCM0ttd250ZEhGY1RlSTdPRzVMekZFWWp1R1JRZG1U?=
 =?utf-8?B?MzVaUHdCMG4zVTk0T1J2OFdUQy8yMTRKaTQxejBZRmJlSVc1VmtwQ3A2bito?=
 =?utf-8?B?elZXK1QwaFMvUzZlcFRWMVNlaXJvNTZTcE05RGM4N2EvMC8wZ2lQTXVDTXpZ?=
 =?utf-8?B?cGpqaE1kM3FmckwzT2x0TnQvTXBHMXo0ejNuUEt5dFFnNGdhMVR6eDRzeERI?=
 =?utf-8?B?RHBwT0VITTExSzJMaGdGdmZsY3ZGMDRYb1E3UXc5ZFl4NXRscWp2R0RrZWNk?=
 =?utf-8?B?anJIZU14ckNpV0dwWE1EM0prYnhTM2c5cjBTMDFnM3NTU2VEU2hpZVE3dnFZ?=
 =?utf-8?B?b0xNUVd1VW50SVBPak5FTk11Z1VZYWZMOTRlSjlLU3NNTlU1WVJDaS9XR1NL?=
 =?utf-8?B?UzlpMEVBWk8yS2djQkYzWU5qT0NOeGFaaVRwdDJyeE0vZ253dWNJcDZZeHY4?=
 =?utf-8?B?ZDRpWW9WQW9oY0Q2RmZybTRJR0dBWFQzczZMaXBuUHIzeGszNWpZZlhueVgw?=
 =?utf-8?Q?5qFiHuL8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9596682d-98cd-4abc-f237-08d8c21b7882
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 16:57:31.7076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HHiygX5VGVOUvAdbZfdQQe0zTMr59lcLgV5anQoX1lq8k3OeMaaRE3hNt1DRontId/pEMU/xG70a9/zXBE7OVvRbTIVMAZucNPx/lZmpIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3607
X-OriginatorOrg: citrix.com

On 26/01/2021 16:31, Jan Beulich wrote:
> When discussing the shrunk down version of the commit in question it
> was said (in reply to my conditional choosing of the width):
>
> "However, the 32bit case isn't actually interesting here.  A
>  guest can't execute a SYSCALL instruction on/across the 4G->0 boundary
>  because the M2P is mapped NX up to the 4G boundary, so we can never
>  reach this point with %eip < 2.
>
>  Therefore, the 64bit-only form is the appropriate one to use, which
>  solves any question of cleverness, or potential decode stalls it
>  causes."
>
> Fixes: ca6fcf4321b3 ("x86/pv: Inject #UD for missing SYSCALL callbacks")
> Signed-off-by: Jan Beulich <JBeulich@suse.com>

Crap.  I folded the fix into my wrong tree.  Sorry.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew

