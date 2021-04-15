Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D915F36097E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 14:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111111.212433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX1C0-0003IX-Eb; Thu, 15 Apr 2021 12:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111111.212433; Thu, 15 Apr 2021 12:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX1C0-0003I8-Au; Thu, 15 Apr 2021 12:33:56 +0000
Received: by outflank-mailman (input) for mailman id 111111;
 Thu, 15 Apr 2021 12:33:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4R4=JM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lX1Bz-0003I2-L3
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 12:33:55 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b8714a2-f938-4946-ade8-44dbeec7d891;
 Thu, 15 Apr 2021 12:33:54 +0000 (UTC)
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
X-Inumbo-ID: 8b8714a2-f938-4946-ade8-44dbeec7d891
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618490034;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gPJ1DoyW9oArFci0OPl/MBWFoY/sflxknzK44uOhkW0=;
  b=Bs6FD/kxFoJyj4Ls/mfDHjfKmq9OYm5ePZEP+LUQM0gYP9mXjcYQJ7/V
   wCOJX1T50py2qgBxIo9u7+sb73TmDgmLEpT6Re/1iZlArFwPNWaQdWTAk
   7GV95hep0NVR4r2j2QUb+UoaN3XyKfvf+P7DefP/SPucrLXo/uznY6X44
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pVEOgEhNR9s1+ii5gvrCAEIDgg/R3c4u9dRxF5dq7STB0JknjKmPFfo5yHzl3McU69LK7FH+R2
 47yAXWH24yF6MK4c3wHCHTk0X2j2r+jsTt4M2fH5OuzEthHDck0Ja5kzdNG3a1Fg3i+zHioFrm
 Z2PnSmP52OQDPkAURUy8wNXHEBXryyZ8/zaLNa93LjmA3WDkUT8UXjvaXrdUzP8AooYSKy0fEs
 GBEhUR76Z8lW/Gl3bYhdYpAXMhYiO2O5wBz4WXmDnWiEuODi5mwjh9AHNHoXILXBeXrM7RUWNZ
 XMc=
X-SBRS: 5.2
X-MesageID: 41501466
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:nEEayKhOTcNADHiQqPOzz2tSwnBQX/h13DAbvn1ZSRFFG/Gwv8
 qlkO0HkTr9jzgMUH8t8OrwXZWoa3Xa6JJz/M01NbCtQAHptAKTXeVfxKHlxCDtHDC7y/5F2c
 5bAtJDIfD5EFQSt7eY3CCWCNAlqePqzImNpcPzi0hgVhtrbaYI1XYFNi++HldtTAdLQboVfa
 DshPZvnDardXQJYsnTPBBsNIKvm/TwiJnkbRQabiRI1CCyjCil4LO/Mx+U0gZ2aVNy6Ioi6m
 TMnkjF4LyiuZiAqyP06mm71ftrseqk7uEGJcSXzuAJNz3ni2+TFeNccozHmApwncaCxxIBls
 LWrxIpIsJpgkmhGF2dkF/X8SnblB4l9n/lzjaj8AfeiN28QCh/B9tKhIpffBec70Y7ptlz3L
 hG2H+Du4NNAQnNmzn84NbURwhn/3DE2EYKgKoWlThSQIEeYLheocgD50tTCo4HBz+/55sgFO
 VoEcHA9PdbeV6XdBnizxFS6c3pWG8yEBeASlUDvcLQ0yE+pgED83cl
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="41501466"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDiIXghETKyKrZ51rkUmk/tKz7+Rt8t8esnp25+2RpiTO1Po2edJ7C8wYNhcwaqlSrA5tR8q4NV7Fu7BaFVatXFU9CChM+B4UtPRFm0cs2NUXWrdQZ3cKd5roXMIei/VDpjKWALj/UG7aTf8Fnd3Mh5MFz8/820O19R8KMtlc6FOBFb+qFc6X/qTL6Rps/5+v44urWHDZ2cpQhfGiQLDCUfgGQgh2gdj504dkAjlsAKwXx8114FToHAb/IUowUnqIqyGKSq25yJdVfXKg9xe0+4D2T8ML9+0vBfOuWrrOxCeqsg1Ps36fYMAb6SV2MDymRw4gMpMhYqJ+ILchl/S1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0mjW4C4qQjRrAUqsf1uZsa6jGtT7ww02hPQnyPmLiQ=;
 b=CKQeNRrnphNyPZrmSLHZcCJJiM3RCsMViT+kBWj71APEPN3XLjX8METpOjp9RNnQJl8aJf1e3pXSd797G2jpYxrY7P08d4ua1I01D9DsFl6j3Us+OKTh1DkxrCcjdt70dCdFVPmJEijQtSdFHJgiXQalUs890rr4mWxUm/hy+I3F0zdvhYMT/Id08ablNqo5Str58U1LUgL7P/iMN6dlx10kDXnlSPf9lzZtcMO2P9t5p6ulY5ry0oN6oFnJs922vjf7gBwTqllVgIfku5DxgCOtbGMe0pSXr/+XqJHQAZzli7pz56U9OkPTZsI+c7iXZkp8DLBZg4vimV12a4tAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0mjW4C4qQjRrAUqsf1uZsa6jGtT7ww02hPQnyPmLiQ=;
 b=cdj02p3bUsSNmNEjvbnCT39wzmQXR0BMD7h+idD/BPNLiIvhoqWk+T4Gtd1jEQSGdTe7cul3ectIHJc96qSY4YjJYISOYViwuoiMzZ4BEH9vkXq8tq5cHME0o8NC409dEFHtXHVHY5JYmxfOhmKzE5oQmaVKNGRbyT1wVKJCk0I=
Date: Thu, 15 Apr 2021 14:33:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 11/17] x86/CPUID: adjust extended leaves out of range
 clearing
Message-ID: <YHgyqyMf09MuFPOH@Air-de-Roger>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <0f04f568-e55a-ef20-aa97-fbb199dfae37@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f04f568-e55a-ef20-aa97-fbb199dfae37@suse.com>
X-ClientProxiedBy: MR1P264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea429f82-8008-41b9-2af0-08d9000aba38
X-MS-TrafficTypeDiagnostic: DM6PR03MB5066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5066327B764315478D5329928F4D9@DM6PR03MB5066.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z3xvDgx0Yrf9C3ohaSOUKp8IOMc9cth4JkkHMrTtq9xWBy6NA6tAD6KscaxzZUy3u8H52PodnbbZ1rSwWBGg/EnAeQurVvX/xUHpfC6BRqOy3WIsrLNIFSbxCVtJFhlMImboy6MJ10zpnd0Y3/aeCZDnAlZ32cvLw7OQOaMZ76SOPZHuWKkjwpZABilKkOdRP0qd7MhibC2JAxKQoq6Yi2L2VYz6gYSfEHc+omo/+Z3gGR1ozBgAlOYc63CooY72PuCXHLEn4Ofjg98sGcRgLqh5v2Y2sx4A3G14/WeaIGyNNA+J7mRtVyi68r/ugx4q8dvyz/Jk7fypjWu1IdOAJUFYaiQgStjg8pi4mqcpD/AZN9fZG71akCcj7z4JtXzsZcAnKXifxQKsLKJfNwzAfTaSJ+T58YTwlBn46SiqRjxQ2gTOnUsKBwODurZ5JGF5KxfQlCxpx3hurPeWS1S0St8TH6w1jIoJVsOqlQ5hG9UFq+7RXLG7vWpLrVBwjZZXMw24MjPqMDKHigwJMRZL2ozNkvNDEpbwQkSOonayyn4z6yZgT2cMdnkiSrdKGTUWBdXUwGrc07BWLX46pBK4J/lqVDzRSH053D35Bcb4OZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(478600001)(6666004)(4326008)(8676002)(85182001)(8936002)(6496006)(86362001)(26005)(9686003)(2906002)(6486002)(66946007)(66556008)(38100700002)(956004)(66476007)(5660300002)(16526019)(6916009)(4744005)(54906003)(316002)(186003)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WWpVczdwTzYrQVRtL1h4NDBWLzhPUjlpVlBhL2ppZ3NncjgyNDVFQjgxRjky?=
 =?utf-8?B?MVdnejNOMWZlMlhKd2FoRDBPYWZBaGxSZ3l0a2NnTjB6dGtVM0NVeDN1aUdi?=
 =?utf-8?B?RWN3QW9jcXZqbE5ZQStiM0kxTE9CNVhac1VhY1Q1NlFqSmlrNGVQVm9wQjdK?=
 =?utf-8?B?V3c0Wk5sZHg2bTVnQlRQRmNiV1ZMdVN3RUJGN3daM1BkRGZUZEUySnRpTGtV?=
 =?utf-8?B?TGlma2YvYVhCcER0bjB0YWVKUEM5K0FuRzV5V1FLaTRQYzloSXFKWUJ1MlFm?=
 =?utf-8?B?SW9PL1NYS09aR1ZEbDF3MTdmSC9Kek1CMVhpZi91YTg3UEJDWktXcllZNXRi?=
 =?utf-8?B?VU44MUg3eENvS3hUVU82aytncTdqOHppc1ZyS3llMjI4cGJ1cTIzcGF2RTVT?=
 =?utf-8?B?UllvMm9NNXdXV3Nyb2dobXFyQ3JQQVBWWEZJTFNyN2VNY215bGMzcThRN2s2?=
 =?utf-8?B?Y2hLZHZOQU5FL3pMZ1FYSXNkMTR6NGJlQ05ZbEU2WGpOWlFRUVB0OVhWRkVI?=
 =?utf-8?B?SjJ6MzUrRzYrYzJhTG9aQTBYTi9qbEN6SEJ4ZDByUyszanpxQmFkZWZUNm8z?=
 =?utf-8?B?b1RVUGVVSGZZNVZDRFVkaXN2UHhHZW05WXRTLzNsdUJIVG14Q1UvUUxrMlpj?=
 =?utf-8?B?cE11S09RVXFydWpyeldXbWVkUXg1YlIxZXlmOFpJYnd3OUZydzJ5L1VteitD?=
 =?utf-8?B?dXJhTFdVbWY3cXQ1TTZDQ21ldUxUWE1pRG0yNlo2SUlMS2xQay9YMVB5Zk5n?=
 =?utf-8?B?cGVGaEVQYmFiVG1iK0o1anIxSUp6L0tZZDg3WEYxaUExdEhzS3NZUDVZa3ly?=
 =?utf-8?B?U0pEWWdMdWtycEttZkZvb3ZKeUhoemRqNUVHUFRNNTdYbGR6c2hWTWp2ZDlO?=
 =?utf-8?B?NEUxc2p0QVVKYmJZeEdDUlpqcTlkSTVrZDh1eTJQd3A4cnhzbCtZeU5KVGVG?=
 =?utf-8?B?ZXdXai9taWw2WkY5V0pRZHhISjFlMjZzam5RU0drQ2ltd3VxM1lkY1hPN216?=
 =?utf-8?B?YXdtUDdjdzk3eUV5QWNlSCtnK3FGVTE2U1A0YXhCTWFxdGZ6aFRrNmpSRGZw?=
 =?utf-8?B?ZGZ0Z0lDS1RCcmlRNjc3ejhBUlpSQVVHVjdEeitDL2tROElLdmgxMGR1ejZ0?=
 =?utf-8?B?aFpVUjltY1p6aDlLWFQzZVZ4T3g1b2tzd1llK3FXQlRNU0JtMEozV1lMMnZD?=
 =?utf-8?B?dUNKN04vWXJuNWdDWTRheEFaNHl2eWc1VmNaZ3NBYUVKM0hyTUpVbkhySmhB?=
 =?utf-8?B?TURWQlp6UlIzZnducmtmM2U0c3ZIclRTNlZmZkthNCtickp3d3o0V3puVGpU?=
 =?utf-8?B?K1dKZXIzZzVlYXF1TEZtdFF0VDlCMzZBYXRySGprazlvZHRxdmJKaHRmQzFm?=
 =?utf-8?B?cUlwaWFDRVUvRUhCQUM4QUU4T2hsbzRPbXFiVmQyaGV5N3dXeHhWWWtlNzcw?=
 =?utf-8?B?SUVEd2lwdEYvZG5FcDRIK0l6M3pldGx3M1c1UWlKOVFPTVFTN0dwbjdFMzdG?=
 =?utf-8?B?NzNMOS9zMUFDK2Q1RVVUbSs5elhGUmtPS2VIbHo0QmF3cWNmcDI2QWdEVkhG?=
 =?utf-8?B?SmdHaHJpWHh2V0tWMlVKWi9lNGhQQk50QkozSSswSW5LelowdnFRYlVtOTNM?=
 =?utf-8?B?SndYT1BocW1VVVJ1d3NtSURFV0tBUnZ2RWw2N2QwejY4RnJxS015OHFycWw2?=
 =?utf-8?B?L1hhTWpsS0YvOEZETXUrSVliWEw0dTgzSENKRGliZWpUVDE0bWJuWXVTTUVR?=
 =?utf-8?Q?FqhkZ1kZE64QgFrlI8McxibGJKzjftG2ZkBfzhC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea429f82-8008-41b9-2af0-08d9000aba38
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 12:33:52.4363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3exL0LfE7jGj4jf0hdMOApyBgFxHcbbE+bKyhbFcSGOVafbbJ42P+O9FwK+SHgoh18sv1Dtt4eaPsiGzt6p+qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5066
X-OriginatorOrg: citrix.com

On Mon, Nov 23, 2020 at 03:32:35PM +0100, Jan Beulich wrote:
> A maximum extended leaf input value with the high half different from
> 0x8000 should not be considered valid - all leaves should be cleared in
> this case.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

