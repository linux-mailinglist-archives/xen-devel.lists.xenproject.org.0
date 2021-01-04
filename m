Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFC12E993B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 16:54:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61328.107813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSBg-0008Sq-FC; Mon, 04 Jan 2021 15:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61328.107813; Mon, 04 Jan 2021 15:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSBg-0008SR-Bo; Mon, 04 Jan 2021 15:54:28 +0000
Received: by outflank-mailman (input) for mailman id 61328;
 Mon, 04 Jan 2021 15:54:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwSBf-0008SM-MO
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 15:54:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc300576-fbd3-4dce-8ba4-631b229c963a;
 Mon, 04 Jan 2021 15:54:26 +0000 (UTC)
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
X-Inumbo-ID: bc300576-fbd3-4dce-8ba4-631b229c963a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609775666;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1gafsaW9kAfKSYqWQgO7FEy3tUF7YQ3wqmWnyxSjb9M=;
  b=IgwAI5Ax0FQZbD8VKus8WHp1LKVH7dsingpnz3sUhQrPaXZR6Hkhzu5S
   Nu3evCvc4Q2l8sHAiUvT19NI4x5GKaYQ2FmatzL+HLICsWm+oxDv16CNU
   eI77xV6kNKUscVgulAbqstaiMrMcJhYcaAKinoskStWZDW/i3i4KdAcSM
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5bZPOpCJaCS+X7Kvl+fusLlfI0wPGgxceqxwds3plYtA/mCgToCBMjkRn3DyqIX4G4aKzt10s4
 Ce9+qtcaA7EMzjlMXJMAds3r0bSJ9QpknaRQImwPjy/iEtg+qCR23iE0/KKD8mHsmOI9fRi1GV
 i42+Iwf25E6gNtcJPXHUL3YwJ01FCKeSsWyVkceotcJ8VNiQwVGjQhkAKHtcxuFHBQ404qh/dk
 i/LSzw8tHtes4Og9ebm5akIYAJ34PPqZJYelt/QidgO6EiaO77/mj6dnHczrs2xjIL5Rw2w0f7
 nds=
X-SBRS: 5.2
X-MesageID: 35613344
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="35613344"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RamRLRuKFgwOVJlVXzo/ohZqWmtyuIxo8Sz/OccVQDmILbie/odLNfu5iml3p90Dcyh2Q6v5UJJjv/SAwSipBajN0oslIL91btD0fQxi3jb95+CzGhq0cFZZ8iZ6IQDRU7c0AIav6ugdPpVg0hBn9TZb5PR0+oz/F7vBe68TJeksfls092R9iNoLU+b9S4IqIL/fkLYrThIGauwh+znyWtqn0XTZzAxcuCL0QrNd5X/n/ukwfpNB8ee68EHeKbFio6q1lphwuU4Swk4nTeSYPX7cK0Ug2bhKaGzmv8AEp2DzMFvsTAwDl6Vf50la2Kfm9tn9riveQ92RUJyhIfpVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcGyI5y+1HtOFTZbEViFUMs+FHUJaXExcU7E1z8Z6fA=;
 b=To7jVbGd1Wm1H/QI/UQ7PsY9TS6y5Wldw5AQ47a7mzUinrFu+VNXEfrqyPA0HcBbDnX20L6/YicpEm31s1cY0UjlV28NXVXtzfDqPeVyWmpsx94R7sO0hMM4A1anM94QdKL1faXk8uw9MGoc/4QER3sQMeT3Y7Cw6R+sWdm7xk42USXuIWKVoqLro5mSCpkBlhQ2r7/CIPT3MMRFzfLiIuO0MSrcBzZK+h7HESIAxUdl2VAuN9d3jFsPs1L7pVtFWBjmrFXDE9Mz4wFXMcl2Z+WchU+HYu2Nh0LQNdMm+7NNi8NR5jbyskE6oo8qvumVeLBl/KHtR6BSsMlmKbMWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcGyI5y+1HtOFTZbEViFUMs+FHUJaXExcU7E1z8Z6fA=;
 b=QP6NXJRWDqI2WKno1WSHnWxu25/Ezkja6LXfGuBoLQ7X9gQzQeIXWEmbNh8ajpaLTATzjbGt5k4lCAtLAdVHJ+rmzxvWlU4Yajph6eBRwCZMHLwoAf1qGiZc/a2U0FaSW7hcrOBksxdFpQsqjzWEUA9BoZm1aC1LPKx6EV5+M58=
Date: Mon, 4 Jan 2021 16:53:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 5/5] x86: don't build unused entry code when !PV32
Message-ID: <20210104155358.snzakj4kcs47tt22@Air-de-Roger>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
 <20201228153004.qip3v6er5rk22fnu@Air-de-Roger>
 <0341c1f1-dc50-552c-f246-56605ae7c83a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0341c1f1-dc50-552c-f246-56605ae7c83a@suse.com>
X-ClientProxiedBy: MR2P264CA0042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::30)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 956bbf0a-2312-4e65-bd0c-08d8b0c8f633
X-MS-TrafficTypeDiagnostic: DM6PR03MB3674:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3674179D867BD553C12C756B8FD20@DM6PR03MB3674.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5w/E/3x6PxSaFYBgsu26nrX8vUnEO3esJCeaebR4J8gdjsSm5I09XJ4guZoSaCPsXPjbivmbvwcZHKASjCUu6R9dbLCuCbwAMUVY/a+vh+8cKdIDRk9vdy2K8qv1fpppa/IPcWMTsjmSwGSHYq5nBhzqeBHxozB6oGZ0ujimsjAlz6is9dlStWPzqH2ihECj+KEQMS0yWykFo2GZRqxKyNXQCKREoySI5WfWNnFtjEJ6k0eqtFuc+eRTLdY2Z0FDhC1DfeZCicpM3EgmwUtDdN2GsQ+0+7dNUEBtYadrPG/VJhhUiq8KNNWMjWr/Oj92igSgPh7lLnWuYCgqh8tEYPembvWMxeRyy7L8Lf0BlS4nZbKgYfFzjvKl5CwWU6A4o2jc92TRws8en+m1yBe/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(110136005)(54906003)(1076003)(26005)(33716001)(9686003)(53546011)(6486002)(4326008)(956004)(316002)(478600001)(6496006)(5660300002)(8936002)(6636002)(16526019)(186003)(66476007)(66556008)(66946007)(8676002)(2906002)(85182001)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y1pjMEVROXZqZ3V1bUg0OGZpdy9wS01aU3JUeSt1bHhLY052Q1R4RDBFb0NP?=
 =?utf-8?B?Q0FFQlRtbUxJbm8xckxCdER1d2dCK296K0RVeDZnRHVXMlIwRWg0SWhxMm02?=
 =?utf-8?B?YVplTFE0U2UxTmdpc2xpbjJKaXdMYWRhLy9xY0VuMWZzbjd0Y05UekhEeGtk?=
 =?utf-8?B?U3ZGQ0NqeDAwUHFFZDBWQXJFQWlVYUJYUUJRdEp1Tkt5bndhM0lKUFVucURj?=
 =?utf-8?B?Y3RzQ21XQ1FKNW9TSmNDd0krbTBleFRHRDcyOXZDVW9YMm5mT2o4RWpZd2oy?=
 =?utf-8?B?RWRuUElpbjZuSDQ0OXp5V21CY0ZFdUdwYUp5cGI4SkdyYWFMOHh1VERaZDNU?=
 =?utf-8?B?VlY0ZGJEcjRVMzVkd0cxaTZHTGlaK1dEZ3llVVljQXZKRVUvREhBbUFUUkpZ?=
 =?utf-8?B?ZTZRRGxtTlFVOU9ieCt1SiszdzhzaTdMWnFJWmp5VXRhSng2WTJWaXphSk1G?=
 =?utf-8?B?TlByZWZXdFB5ekV6RHFSTGdQL09lcXZjRm50a3hSMXdvVUczSFRSVUJ1MS84?=
 =?utf-8?B?Mm5jdHRJcmZrSFJrZlVYUFhzZFBEQk9USkd5Z3hqQ1BjSTV5bkc3MXMwZE1D?=
 =?utf-8?B?cVRMeHR5K1IyVGlvdnVNMWo0Y0ZWcUUvSlpVc1BVUXg3TitQaVdGb244ZmtN?=
 =?utf-8?B?NXJjRXFwK2NlSzJncGQ2K2dzLzc2bWJ1MW8rV3QvOEEwYTJWYlp5R0p0SEt2?=
 =?utf-8?B?SEdwM3pUZVpSVzR6MVZzTUFWYnU0eG5wMnJ3Tk1RRFBLZTFObUpuZkx4Uzhi?=
 =?utf-8?B?RnVJV2tEMzdiMk03NVZuYUh5Rnhid0xPa3FaQVpqVnBUaVRVTUNKbUlPL2FI?=
 =?utf-8?B?ZjZmUnFCWW1Hajg5c1BiY0RORVlYZC9HSVhEZFZncS9wMEFFbHlZeW95YjlN?=
 =?utf-8?B?cUY4cWIxYmY3S0V1VHlHTmRCQkQ0Y2NVdmFCVU5uNzJseE4xUDlZZElwSERX?=
 =?utf-8?B?dDg3SklYU2p6ajhKaDBuVDI2RkNBUTlMSVZiTWVZb2F2dDRtb2I2eUpHNGRo?=
 =?utf-8?B?TmdkYUxscTU5R25pajJpR0ozTldYVG05b2lXc0NSUE1QRTQyTHRrYnZ2ZjlR?=
 =?utf-8?B?RmM5VCtCYUpIc2t1bVhGb2wyR216aU5CQUhWSHRUWWNxZGtZL1RoRmFuaEJl?=
 =?utf-8?B?VnhBRDlJMEEwSE1mbDZtS2lXL1d6Vk5wbmdFK2w4MlhvTy9kdi91cEEzZ3Mv?=
 =?utf-8?B?b01LVnA5cnlhZ0F3WStYU09MS092MmU3aGU5aTJCQVhySDNJUHdhVHBkSnpB?=
 =?utf-8?B?M0Y0Y1l6a3JtbENWaVRxNVk3eWFZN00yR2Nsektzd2xzaE04MkhxN20wU0hW?=
 =?utf-8?Q?znCIfUIfLa5u+7E0+SFw5loK7VOjaDIrPW?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:54:04.2114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 956bbf0a-2312-4e65-bd0c-08d8b0c8f633
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGuSFVoN5PIS02HTTRK1qTUHLV6VYf4/USNx6pQPVEDptzfQZCw1jB8yNQi5Y8gkflghHoZzgmHqBSsCixWaOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3674
X-OriginatorOrg: citrix.com

On Mon, Jan 04, 2021 at 02:56:12PM +0100, Jan Beulich wrote:
> On 28.12.2020 16:30, Roger Pau Monné wrote:
> > I would like to have Andrew's opinion on this one (as you and him tend
> > to modify more asm code than myself). There are quite a lot of
> > addition to the assembly code, and IMO it makes the code more complex
> > which I think we should try to avoid, as assembly is already hard
> > enough.
> 
> Well, while I can see your point (and I indeed asked myself the same
> question when making this change), this merely follows the route
> started with the addition on CONFIG_PV conditionals. If we think that
> prior step didn't set a good precedent, we ought to undo it.
> Otherwise I see no good argument against doing the same kind of
> transformation a 2nd time (and further ones, if need be down the
> road).

I think we need to apply some common sense and reach consensus about
where it's fine to make code conditional at build time as to not make
the existing code much harder to read and reason about. This is mostly
a subjective decision, so I understand your concern.

I still think I would like Andrew opinion on this one, as said you and
him are the ones mostly doing assembly coding. I find it already hard
to follow myself without the conditionals.

Thanks, Roger.

