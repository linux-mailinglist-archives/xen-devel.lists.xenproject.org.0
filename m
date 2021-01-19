Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1617F2FB9AF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 15:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70415.126367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1s9L-0007gv-IM; Tue, 19 Jan 2021 14:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70415.126367; Tue, 19 Jan 2021 14:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1s9L-0007gW-DX; Tue, 19 Jan 2021 14:38:27 +0000
Received: by outflank-mailman (input) for mailman id 70415;
 Tue, 19 Jan 2021 14:38:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jC7I=GW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1s9J-0007gQ-Ao
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 14:38:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11051b52-1cb8-4848-bda6-2ba832cef0a6;
 Tue, 19 Jan 2021 14:38:23 +0000 (UTC)
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
X-Inumbo-ID: 11051b52-1cb8-4848-bda6-2ba832cef0a6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611067103;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3sa4drC31pFXZSTmlxrAH7E/br7gMHGZ0EprlZwf/uI=;
  b=DjJ9+PdMKipjuCvlrH7ZhljwJ7Ucai0qr/Y/T+7O7WIVhG1XQFRxS6Si
   elQXKA4vWK23Fn6cg33vGXHGR6zFamUDAFOVbgcq5QgKEUflfSoTWiWFR
   ZwbTJPHqr9vIOMktTexuRGzEPZEugl0oBlTD6Uz7DztH9Sd8Yqi/ZElkG
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NSQ9gwJn7Xz3scB1NEjCyYLhIriraIYxVg6SaV4x0FyW0FmEILJFuww3h9p6jIy3mcP8ewoL34
 HTisXtCo3wsxC6Ics9+xLe/QHpQPdQUBQXpHBFeq4zOiGMZ2MZujgC1n2tl9p/xJbeyqxuiNTl
 bi3tVy0QEKllmw21gzAUNpoweI2pQoEzrSRg9B/tyGS5e/mgO22mg1cKYDZOJkWM78mqfAeeDj
 a7EBYn6rrXXH6YIMVfBP8hbhRqq28+IIxfpMKuHZtfHYqbVttNsn3+kAqzDdne//Nlxv6ouZgh
 vIs=
X-SBRS: 5.2
X-MesageID: 35376805
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,359,1602561600"; 
   d="scan'208";a="35376805"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSRB+QBup0iujWehQxAfhE8zO8/9AMd4aWwwLVDPaJ2kD533p0mcBjkh3LOJEBuV4wsDCTvzCGWTdCc7iIVm/tpHKveyvG4mntFZrEpDwR+d/E/gyrrWDNRIPYAw955wR4Oa0NaNlA3SGi9VxmF1EVJB6j77+yBy556ms5rFHPwMTiFWNjAYPjJRHvPMNUyNaWRAEuIZF1W1TDqwvHmJhq2X84D44WWXDWMUNnghmTxh8sAqz/LdBcme9gHaLwZY0yzpOyaHhNdSA78sIGV4cRow5EuK5A9PM8kHqBKuH/A6Y1Ok1CBhvPdYaMOTs9KM8QfmKIvYx/Eb3kM6mVhHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FG46/5jfbqtW7jdeIaBcf2b6zG+35QeJUJ8B67129j0=;
 b=gQbOzT+NnxDJ4NsJu2KmJ2jHS0ndQAjrDP0JWBAzZ3kEC5HzrfELfVMos3b/F77evIr38NKFV7x5arQclT3q26P5Z3lwghOXsdqbrNZyqP/ttzuG/xsWgp916rl51ufNovcMmvoNvuE+Mcmu1lz0e6FXTf9Y/W8hrqsgKK0Cu3Lk3Sj6442/302o82NsTE1/li/vbyMa9ndROa4iwiRUOjU6rH21HeqLcchw4/3xdVDlc7YB5ZKLSfxnEZQbf+F/ovE9byKZOev3NL6ZhfdcLLaqUcBk9KtzLmmALy/vrYaz53UwvXgpYVeYY5649I8YRVBYT2AFrlibAowhwOkXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FG46/5jfbqtW7jdeIaBcf2b6zG+35QeJUJ8B67129j0=;
 b=kEZ7XJsxQl8k5D8svX2ro0r1ioDR5AteHtQu8L5rM9I6fngLRnGCeo7zlZ7vfxTOFIHBb0IYq1ZwkUgV3L1EwLVOCNuoVbtb/yuYnGlTtEMjjCQPg030BKUECuG/TUDzawzxnwpizw+23/LN/LN0sQQsqLsNafM5B05LU6CN/k4=
Date: Tue, 19 Jan 2021 15:38:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Marek Kasiewicz
	<marek.kasiewicz@3mdeb.com>, Norbert =?utf-8?B?S2FtacWEc2tp?=
	<norbert.kaminski@3mdeb.com>, Michal Zygowski <michal.zygowski@3mdeb.com>,
	Piotr Krol <piotr.krol@3mdeb.co>, Krystian Hebel <krystian.hebel@3mdeb.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Rich Persaud
	<persaur@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 1/3] x86/smpboot: Re-position the call to tboot_wake_ap()
Message-ID: <20210119143814.xtijb2ggz5yz5xvj@Air-de-Roger>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210115231046.31785-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210115231046.31785-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AM5PR0202CA0024.eurprd02.prod.outlook.com
 (2603:10a6:203:69::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea8e6220-5ebf-4833-7d4a-08d8bc87dd5e
X-MS-TrafficTypeDiagnostic: DM6PR03MB3834:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3834DCDD011FE62E86EA0E298FA30@DM6PR03MB3834.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfzQvo/XVpvb5wZUUExPpwd6pPFoOYj81gXq8GCDmh3Ql6m8MelYz5RltYfVZ0hgmq2IVHCgTInPgzYlFyzAF8UxEEX4xzsIuvznqdvE5JYhSGM1n7Q/KZKnmQZG9CIZk51IRwt5jDekvB5xqaKVusNL2J+5jAoOfWE3wa1Lx2QNzjuKrH6rVcjf9eYNUK81+NOeXuubdIiMk7fA1y+R9IOqBGo0meCUJsuIQ+xZQIas4Ugs7DsoQcuzc5pb41cvxbkN39pi167e+D1kUxPPw0iUvQafVjIDIKO4LxdFo5pCQY4waNZZj6xoWHrT0H/bv4Hpya0m/EvKjqqOqct+ygdja+4bIw73B+t7aKvWW0UehHkHVOenC9N7fOKHzgF2P3UFOtTtHrzR2hu4t0xGbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(83380400001)(33716001)(5660300002)(478600001)(956004)(6666004)(6496006)(2906002)(1076003)(7416002)(8676002)(6636002)(6486002)(66556008)(54906003)(86362001)(316002)(9686003)(8936002)(186003)(66476007)(85182001)(4326008)(6862004)(66946007)(26005)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SlpDS1BENEI0a0J1Y1RzL2FlL04zZit1RFFuMGtHMGd5NGF1NWhjcHZ0WDVZ?=
 =?utf-8?B?M0twLzB5a3ZoK1VTQ3p3bjdEZnVrVjliZmdHTmt5Mk9TbGNNTUdPTVllY3pp?=
 =?utf-8?B?ejBORHNUYmkvb05oU3lBWXFmVnpvbnV3bklUaTBzR2oyVjIvYTE3WFdyOGJI?=
 =?utf-8?B?dkMxOThRSjZUNmNHWjBDSUNXbDVDaUl1SSswbDBXZzAvQzN2WDZ3OEhNMWVm?=
 =?utf-8?B?Ykxpb2RVUjlsMHNOa3ArVFZ1QXJ0ZjJ3ejBjdldyY3JnT1ZoUEw0eVhRR3RY?=
 =?utf-8?B?M3RweXlYWjcybktSTDYvaU9hWlphOGlJbC9hVGJ6RzVxT01OS2Y0UVBqRVZC?=
 =?utf-8?B?Y0M0Q2g3TUdqVDFZV3lPL1pxaU0wYk8zTmQ1V3FOMGJ0NDZXSFRQN3FOdE1G?=
 =?utf-8?B?WDhxdSt2VytWV2dtaEU4eUxKelhDWHljUER2Y2cxMVI3Y3VWdmFJWWJSSUc2?=
 =?utf-8?B?VWF4Q3BZNmVxamNLenYzLzQ3VEJBZU1jNHJIdVVneWxFNkZndy9tR05GZHdh?=
 =?utf-8?B?TXJFRVFJQ1lEeFJ3NEhNQytpWm5zTEY1d1JFQ3h0NjZMSC8reFNSRzdwcUdH?=
 =?utf-8?B?WG94MkR4Q0hHd0JrUkFPTmJLWVM5cHZ2V1BQQnZmZGNSQUR5NzQ0N25iaDFH?=
 =?utf-8?B?RnFzRGRaRDg2OU9UazFobTR5aHY5cXAxQkYreWMvc0J2VXYrR1RZUmV4YkJL?=
 =?utf-8?B?ZmRSU3Zrb0JIdHpwbkErNHNhTXdyTGZESFlpN1RNaEM4ZnpnRWdNVisrY0Q1?=
 =?utf-8?B?aWZUUVlqRm9EVlcydlBGV2FmNDkyd2d0djNGVnhlSUlKTVQ2ODRlWWpLRkNU?=
 =?utf-8?B?bEdJZTRtNGtEVld2SFNsb0F5Zm9IcDZvSkJ3K2lnZzFJWHVPM1lZQitTWXU3?=
 =?utf-8?B?aGhpZXA5R3dVRHJDMzZYVkFvKy9QbElyMVo1RjVRNE95cnEweEtWaFU1UDA3?=
 =?utf-8?B?U2FZOFdMaUd6cE4rcGlOb256Q1IxY1U2S1R4RVBGK1B0N21XcGlwWlFETkdi?=
 =?utf-8?B?ODJGTFdBZThaajB3ckZHNDJpNGdEYUN5VDVYUjhWNnMrVjVGeGlUS2l0V3NW?=
 =?utf-8?B?M3VXbkRVamx1NFNvWVF5ZGdueTk4RWRrVjZtWDgvUWRSTktNbDM3TUtweDA4?=
 =?utf-8?B?VTY3ZjhhS2FnUy9zeWFjNllGRzZWUFc4STdXODgyUjJLVHg2Q1l6ODNOUVJk?=
 =?utf-8?B?M2J6RjFtNHZjY0FocW9RazJjVTRmTnpaTUdmZG9NRUxkUGladWJKUml1K1Jm?=
 =?utf-8?B?aEZHeEp3VEkxRlphNG5LT05EWmNKY1ZIVVIrbHRnWkhsbG12MGlCa3V3UXl2?=
 =?utf-8?Q?Ai1IjBRF72yRvxKAHo2y6+JsbIdmWM48NL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8e6220-5ebf-4833-7d4a-08d8bc87dd5e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 14:38:19.5540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QESEc51Kub9nuhpxZx+wA8gX8oCQ4xuycYaw4mEiYm1lG+PamPEqpjl/FdQZttUgezbLtc5j0ibh0ErQxoFp7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3834
X-OriginatorOrg: citrix.com

On Fri, Jan 15, 2021 at 11:10:44PM +0000, Andrew Cooper wrote:
> So all the moving parts are in one function.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
> CC: Norbert Kamiński <norbert.kaminski@3mdeb.com>
> CC: Michal Zygowski <michal.zygowski@3mdeb.com>
> CC: Piotr Krol <piotr.krol@3mdeb.co>
> CC: Krystian Hebel <krystian.hebel@3mdeb.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Rich Persaud <persaur@gmail.com>
> CC: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  xen/arch/x86/smpboot.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 67e727cebd..9eca452ce1 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -426,6 +426,13 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>      int maxlvt, timeout, i;
>  
>      /*
> +     * Some versions of tboot might be able to handle the entire wake sequence
> +     * on our behalf.
> +     */
> +    if ( tboot_in_measured_env() && tboot_wake_ap(phys_apicid, start_eip) )

I think you are missing a ! in front of tboot_wake_ap?

Thanks, Roger.

