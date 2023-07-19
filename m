Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33821759976
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 17:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565939.884563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM8ym-0000km-A3; Wed, 19 Jul 2023 15:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565939.884563; Wed, 19 Jul 2023 15:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM8ym-0000j6-74; Wed, 19 Jul 2023 15:20:40 +0000
Received: by outflank-mailman (input) for mailman id 565939;
 Wed, 19 Jul 2023 15:20:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KnqJ=DF=citrix.com=prvs=5573504fe=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qM8yk-0000ix-0L
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 15:20:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce6303e4-2647-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 17:20:36 +0200 (CEST)
Received: from mail-dm6nam04lp2048.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2023 11:20:33 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB5596.namprd03.prod.outlook.com (2603:10b6:806:b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 15:20:30 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 15:20:30 +0000
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
X-Inumbo-ID: ce6303e4-2647-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689780036;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ozS7Tb4gGfmaSI5BHDlpBriK/I7iKRLIOMInolWXJZ4=;
  b=YCKV6OahP7mkYyiZk8Hs3Xrf/wjk4o/B4VFtvdm5/4vtXg2ni24m6yjl
   7dQDkbu6DMp+CrKAp0XdI6oH4q5Pe1vB3GNKtT6L/Ao0JDgszLGp14+Os
   6PZS/G1sAFjM3RHGNW6vkh0XxZ6IXaxKd6C/Lk81LwXwD3SQ00B92gkun
   Q=;
X-IronPort-RemoteIP: 104.47.73.48
X-IronPort-MID: 116626516
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:f88kTq1kkFbWpBKx8vbD5fRwkn2cJEfYwER7XKvMYLTBsI5bpzwBy
 TdKXj2DaffcYzb9coh+PYvi9kIF7J6DyIdmQAc+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNnNKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfCkhr7
 vFAGBc0Uzegt/iZn7zkatBDv5F2RCXrFNt3VnBI6xj8VapjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6PnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv12LGVw36iBur+EpWUqOVyj0ao+1UXVhA9BQWSgfaygVSHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ul7Cmdx6yS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pES0cLGtHaSpaSwIAu4XnuNtr0kKJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNXNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:E/T4mKw2iN8H2i5GTM5PKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-Talos-CUID: 9a23:jSBVg2E8OnzhMQjWqmJs3WsPF5gVVUTg61TgOWDnBzlJcZKsHAo=
X-Talos-MUID: 9a23:EbTyrgkptxhZag7L9uQvdnpOatxw7L+VNXkJz5gt65etFSN7MC2k2WE=
X-IronPort-AV: E=Sophos;i="6.01,216,1684814400"; 
   d="scan'208";a="116626516"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H41xenTo4DTvoGt07uWsvBoLnU8psDvfQlj/jfwAYPp2X31m5r3MTCaWvFgx4sKI85LRI/n5Cvk4m/1O3ZlHYpMMfe4aHbVsfM8tZLOLtOeFXn55WnouQ+LRhf0V77v5dSpZwR/35/nqi4NiSccE4AKpS9KEXXnAgyf2pUxbc/tUquSVHcKPsN4anzOd6xJbg85MJNeEt0J4FozmmhrbpkE/JaeibbyKCVSxdSE+AnIFc+US/4RrgJW4TRn+lngwEc8O4OEiCcATTAeZEPZ4wd1YfRJbieTCYLbQAcZTV50TuXQzPzCyiphDMyrBRHeJ9mHEYCtgwiZ5YapjFb1QEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FD0RRnWoxDBvYsETeuXA8Jf8a3WiOG2ldK0TwrHFqUY=;
 b=eTbx5wuL76gXBh2548sHfQRgXCBNgmuhCta1LFlQszOpwFwFK84iM/uQH1UD0fpmIzSzdoGAgCwRkrHrGVAg7rBaeWWeNIjC7ENtAaeHZdpUmFac98LgZRz95sohH2ZqIA4kH/6XXVmqamedWBkjmNCcE/A+5UWJSrgqCH2+zFt/YNoyD3nFI/nVtPfJkqkG/IX2e96O3eMfYyvkBXo77f0TPtBXZPqIlIlGcMdtN6WWLINBcj5hi+d3QJIN0ntIcXWsRos9bzzxehG5ZTXVuAxV0G4Xj5qC/vxPmI657unFvxMXAmqMvOQYmW9ng3VoYrWY0nYrgE+tm9KprlWezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FD0RRnWoxDBvYsETeuXA8Jf8a3WiOG2ldK0TwrHFqUY=;
 b=e4XJzWu5qoOvVXu2noH62+TFdGoomo99kxL4O8Bt5NZt7pYI3IrA/3VMuhdd3QxO8lZl9BwYgS3VqqiG6x46vS6Flxkq+MXPnJFZoshjWu5ZJA7uAuCQWpsY8qyeou953Hr1+5vMgMJOAnJFmrNmO0pC88+4ycSGCjSVBa2V86Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Jul 2023 17:20:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/5] x86/ioapic: RTE modifications must use
 ioapic_write_entry
Message-ID: <ZLf_OJnYjyirT7Ee@MacBook-Air-de-Roger.local>
References: <20230718124334.36548-1-roger.pau@citrix.com>
 <20230718124334.36548-3-roger.pau@citrix.com>
 <1bc67bb2-9b01-eb18-eb6a-741067a9b35c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1bc67bb2-9b01-eb18-eb6a-741067a9b35c@suse.com>
X-ClientProxiedBy: LO4P265CA0246.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f968f2-a3bd-4c2d-293a-08db886bb00d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	18n9MiYi1OLbkl5WsnTRBO8GzCyBpSIr86hIS30Y6Xl/TDsJTHOvO8H9l3S1jq9LMEbmor5u2flfkBICyIlujn3Wdlvuse6BwXZrlsDU7jSguqk8tu2qmwLvQqPul8zb4YnQkK2jQBFOOVq+0RSzSMkV8f1tZ36mjzeKFVimFhfTJ5Z2lJbQU3kUCN3AaCbcOsZILlYomfq21Onhs3gbB70oo8qzXmkGDLbwd2L66b0PfGL399iv8qnAln8h6iWf3qXlsAxU67Nqt3ldVfG7QYs/dqGy807xZA/dIIB6Bi0/jU06XXaMwdjyfaYSNwyYSEGARcUprf2R1nLA11yTMQikFv1TiOTA8VF3JVQQp15korESZQoXK8r46vMkh5yDiQxO1AXk4100np2mPcLOr/jx7kvqc2zgMArE6/X8z4I31SYLYUa8DmJrdMnV3rCwmBcVBERzy/V/7KmxYtMv5jg0D2RBZRScxKbC+tA43GALqYTqVJ6dQluPzTPLRjr36rjd90z9hpmyaGV6VVoQE2ELoc7BhvELxM6I3CIfPkN+nHCr9Xa55G3i7A+j9727
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199021)(53546011)(54906003)(478600001)(66899021)(6666004)(9686003)(6512007)(6486002)(186003)(26005)(85182001)(6506007)(86362001)(41300700001)(6916009)(4326008)(316002)(66946007)(66556008)(66476007)(8936002)(8676002)(82960400001)(38100700002)(5660300002)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NktHamFXeDQvK1NGUlZySEhGZWxGK2ZaUURJZ2pZd1VFNmxBK0dTRmRLZWQ2?=
 =?utf-8?B?bCtFMUNjUFk1UEdSaEx5b0Y3STBQUkFWbTA3ekhYZ2ZSWWZ3Tit1a2hMR1N5?=
 =?utf-8?B?SUordkxKZStmOVpqQTFiaUpIbmJCNGdtVytZNytONUxvL2dyR0lEYUZQd0lC?=
 =?utf-8?B?ZU5IQS9yN285YmlrVFJhZzNpaHNtMkVrLzg1aWttUXcxaUt6MFhqU1VJKzl5?=
 =?utf-8?B?aFdpVzg0TGhWTnZmdCtmTmVQS09QVndoeEZ5RmRDa1BSdlhNUzBwb013VFQz?=
 =?utf-8?B?MXNVV1NpejdOSVlZaDFJWGRDbGc0ZTJ1TVRSSkFCbGhPdDBHM1JITTF4aVZ2?=
 =?utf-8?B?Tm5nZ3JFK051QUxSRk9pa2xQMTJ4V2x1RjZVbStORXZJSGZpNDVXMThCbTBq?=
 =?utf-8?B?WGhyWUxMUzNxc0RMYUFDaHcvaXhRaW5rNm9yeThueEM3cXhhRjAxcDM3SFVz?=
 =?utf-8?B?b1dmSEZWa2FnL0lMNUdGQmlKNUsrQWxPamNGZUcrZkpTZmI5d2oxY1hPaWR6?=
 =?utf-8?B?dzUvemhCWHdQL01JT2pOZWdPSWNzWjh5bTVqRWtrUS84UU1LUFNRNkU3L2Zz?=
 =?utf-8?B?Z1ZEOGdWdE1vWXF2TjR6bkEyTzEzdExPSDlPV3VMcVFCVWdoUlpMQ3RPQXZ1?=
 =?utf-8?B?elZxZHhHMkNSZGJmQVozZW5sbWdCSW9TaTdGeks2aUtQSlhKRFlzWEFoZVhJ?=
 =?utf-8?B?d0ZiWmpaQkFPcGNYZFVPTkc3Y3pxdExFMmxkUVNZSUNuTVFyM0dsUTBsUSs2?=
 =?utf-8?B?TkdzWElncnZvZUZ1YmlrQTFkeXFRWjhyaERpeWdKVFdHYTFQTlYxQnp1QVNj?=
 =?utf-8?B?ZGpJenpUNVZob2tuME4rZlczQnJlUkVnaHpOQlpETGRjMitURjZwUThYMkpk?=
 =?utf-8?B?ajRTOFgrM2RVUU9vS05kTmlIUG9iNEh1eVBqODNNS3Rib0JXcE93dDZWZ0dB?=
 =?utf-8?B?SW8vWVZVRzZTV0lnbUFxSUMvRmhMbEtMM0xwUXkxZ0NVUlpaa2MzaVEydFlC?=
 =?utf-8?B?aEZ6d0pXNlFoK1BMWVpBVlo5VC9FaDZqcGRhRkZpalplcGhKaW91Sjc5SjFF?=
 =?utf-8?B?OXdsa3dJd09aRnpPeWQ1VUkxRVNnaHJYbERzbU1YUmhxTFpaejVleThKTWVE?=
 =?utf-8?B?Y3BBbEdOd3ZKMjBPbUpxUG5YQmN5eWwyVklBTXFrclBtcllCNit1NjA2cU9E?=
 =?utf-8?B?K1cvcGlSMk1Gdk9mSDR5a1pRdGt4bnRCNEd3SGpiSUszMllNV3pwSVRNZGNi?=
 =?utf-8?B?dHNUZnVNNWhiMFdRbElTZmlkb0toNDJaS1RmY09CRWdrdm9LMmgvWkpuNzBO?=
 =?utf-8?B?QUFnQlAxajVPald5T1BKUVZyWTRScXdvTGFnM2hpVUZzRUdFdCtDTnZCRlJL?=
 =?utf-8?B?dUtVOWkxWHZTTUtZWEtvYkZCTGJqRW5pb3RORVJkdWNPbXZjM2huaGRSL2FP?=
 =?utf-8?B?T1JLNVc1WjQ1WHUrYjA4UTdaTllGOW05WGRMNnZRNG1PZGVPQnZOWFVBOHRI?=
 =?utf-8?B?MlhOZGdURDlCWmRmQ21QRGgva3lSV1pINFphT3ZEVjgyVytHQVUxNjZoQlZl?=
 =?utf-8?B?WTl5VGFWSlJkTVdRYVhyTWUrRVBWOTNydjhYeWNHdXlUY2lRRlNEZ2t3WjJK?=
 =?utf-8?B?MENKNDR2VFBCdXlZMHN6K0ZwL1huRHlSL2doZmNLUTZJVkwwbmhvcDdqYkln?=
 =?utf-8?B?ZWRiV1hYcWxwY0UyNTZWbEs3UHdka1FxR1lIMmt1SjJ4U3ltMmcwL2RjdUFE?=
 =?utf-8?B?MWJ6bmhreHpRK3R5cFFnQUtnbHVlcHZJaXdkdG5wZytBYm04SmVBdUhDWlU0?=
 =?utf-8?B?RE5Ia2hPSExQRUE5aWsxWEw0K1Q5R1FJamJEZVptQUlyakEzbHpEdFZ2dlBs?=
 =?utf-8?B?MEYyVWlRWFlsZkRwSUNuK1BUSWU0TjBEV0FkMHlLdUw2OVRnK2I0NTZ1NzU3?=
 =?utf-8?B?UFJxWXFFVVVFdkF3UndiQ0VnMjJQQS9xUWU5d3B6YkR1MDV4ejVhcnJnMmVx?=
 =?utf-8?B?TFZUcUVsb0dhaXl6eFdML3JFRjJ1VTIxTzY5dnV5YzVIeU95YkVQTnlxRTJO?=
 =?utf-8?B?akt5bDlta1huL0pJdVZwQWlSUFBnbFlTRHBGeitORjR6SGN0Y1FUaWUzOTVl?=
 =?utf-8?Q?uLMh1Zrgkgu/JRLSdddqoa6Q4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0wdvDPTrp1tky1BWdlmk2jpm088YBpiHAMf7NTxZ8kpgG3XiSGORkDrP4g0jBseahuuRit2EkKH/3KCvMTucdYSbMKZ9szDNJvtliedmXk4AC4E18IglhhDONPS7dGDSQaq0QaHOifjFmsJdW9iVt61Sg3Xj48lS5l/5mFHz+kw3IGi9xqs1K6QgHlAp74araC10Iug0V/MOvNME6rcVUglYqZUsooaevFZ+c2kRTFIWSlwjvn44CBWhR5IZoUpnGj5piKj+EEW01v9IhP/xqxEZYbmj9ksZ9K56FiGpA7JyDY+XbrQnu0uJpNBE/8Ks0dzJ3xFQ04t1tRfnSWheirBoGy1eS/EbRnAPb9neQ7S34YdMlwGTxCYOkDJrvabqhCWrTkmpQAV23y1nrigVE9sTgYr1o2FqxNf2YGLhOKUnXCX5GltUUkP7xbI/jj4k0aBZc7RmAKDCZDL0sgXTaSsBYZYl1uT5oOf1Vh8+jDrJXoUNuW6MREkAYsLjMtTOAJRoACYR6GZ3kE93qgemHaF7UP7ar4hqCoBaI/4hqGv+P4u4TEy4wxML0Xg090zydN4vdtQiQujTEzUWr2tn7Z/kjvck3W53y8z/8u8D1viLhAyy7UWsxQqsLdkoKE/2ggXnjxkM0UnC/G434ydt4fGvefETuDRzH90ovj7KO3YGutOlx8cPuUz5FSRDs2IZfFlebrwXqtKtS5wNAmgYXME+zCw4D74hNFN/l7dWAjY5zfUDnekOvkk7VJ/3zoh4SLqBpgxA2rIdIYTWRE3HfZI5bP1Gkiyq2u1Gm+CC/zRsBgCcppYPdwQApY2iB3zU
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f968f2-a3bd-4c2d-293a-08db886bb00d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 15:20:30.3126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LaIBHnHcKdD3sZyZbiIQj0StFOVhooumod6hihZBvuEZU/PXZHBc7Xl2O0FhVk766nwkU+QK1srPPbgXZMGFfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5596

On Tue, Jul 18, 2023 at 05:40:18PM +0200, Jan Beulich wrote:
> On 18.07.2023 14:43, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/io_apic.c
> > +++ b/xen/arch/x86/io_apic.c
> > @@ -269,15 +269,15 @@ void __ioapic_write_entry(
> >  {
> >      union entry_union eu = { .entry = e };
> >  
> > -    if ( raw )
> > +    if ( raw || !iommu_intremap )
> >      {
> >          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
> >          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> >      }
> >      else
> >      {
> > -        io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
> > -        io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> > +        iommu_update_ire_from_apic(apic, 0x11 + 2 * pin, eu.w2);
> > +        iommu_update_ire_from_apic(apic, 0x10 + 2 * pin, eu.w1);
> >      }
> >  }
> 
> I think __ioapic_read_entry() wants updating similarly, so that both
> remain consistent.

My plan was to deal with __ioapic_read_entry() separately, as I would
also like to convert iommu_read_apic_from_ire() to get passed a pin
instead of a register, but I could make your requested adjustment here
for consistency with __ioapic_write_entry().

> > @@ -433,16 +433,17 @@ static void modify_IO_APIC_irq(unsigned int irq, unsigned int enable,
> >                                 unsigned int disable)
> >  {
> >      struct irq_pin_list *entry = irq_2_pin + irq;
> > -    unsigned int pin, reg;
> >  
> >      for (;;) {
> > -        pin = entry->pin;
> > +        unsigned int pin = entry->pin;
> > +        struct IO_APIC_route_entry rte;
> > +
> >          if (pin == -1)
> >              break;
> > -        reg = io_apic_read(entry->apic, 0x10 + pin*2);
> > -        reg &= ~disable;
> > -        reg |= enable;
> > -        io_apic_modify(entry->apic, 0x10 + pin*2, reg);
> > +        rte = __ioapic_read_entry(entry->apic, pin, false);
> > +        rte.raw &= ~(uint64_t)disable;
> > +        rte.raw |= enable;
> > +        __ioapic_write_entry(entry->apic, pin, false, rte);
> 
> While this isn't going to happen overly often, ...
> 
> > @@ -584,16 +585,16 @@ set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
> >              dest = SET_APIC_LOGICAL_ID(dest);
> >          entry = irq_2_pin + irq;
> >          for (;;) {
> > -            unsigned int data;
> > +            struct IO_APIC_route_entry rte;
> > +
> >              pin = entry->pin;
> >              if (pin == -1)
> >                  break;
> >  
> > -            io_apic_write(entry->apic, 0x10 + 1 + pin*2, dest);
> > -            data = io_apic_read(entry->apic, 0x10 + pin*2);
> > -            data &= ~IO_APIC_REDIR_VECTOR_MASK;
> > -            data |= MASK_INSR(desc->arch.vector, IO_APIC_REDIR_VECTOR_MASK);
> > -            io_apic_modify(entry->apic, 0x10 + pin*2, data);
> > +            rte = __ioapic_read_entry(entry->apic, pin, false);
> > +            rte.dest.dest32 = dest;
> > +            rte.vector = desc->arch.vector;
> > +            __ioapic_write_entry(entry->apic, pin, false, rte);
> 
> ... this makes me wonder whether there shouldn't be an
> __ioapic_modify_entry() capable of suppressing one of the two
> writes (but still being handed the full RTE).

We would then need the original RTE to be passed to
__ioapic_modify_entry() in order for it to decide whether one of the
accesses can be eliminated (as I don't think we want to read the RTE
to check for differences, as we would then perform even more
accesses).

This would only be relevant for systems without IOMMU IRTEs, as
otherwise the IO-APIC RTE gets modified by the IOMMU handlers.

Thanks, Roger.

