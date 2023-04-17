Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0436E6E4269
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 10:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521834.810758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poK66-0006gF-EB; Mon, 17 Apr 2023 08:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521834.810758; Mon, 17 Apr 2023 08:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poK66-0006e3-BI; Mon, 17 Apr 2023 08:20:26 +0000
Received: by outflank-mailman (input) for mailman id 521834;
 Mon, 17 Apr 2023 08:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poK64-0006dx-4r
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 08:20:24 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe13::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2153085-dcf8-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 10:20:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9926.eurprd04.prod.outlook.com (2603:10a6:150:11a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 08:20:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 08:20:19 +0000
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
X-Inumbo-ID: b2153085-dcf8-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5HTmH62AVKaxFpCOnt9O6LDp3/PAzmeF7r0Is6OvS9m7Nxg1W5i1wzGyzmAMEfW/DPZ7HDiaCAcTXWwz2SSSx/4v8hNea2oxv1ktt9ETuAmdsSaUPy5Vvqayg3cCjYgAKNXtpBY3ileJ3gA2koCLeQdPjfnmfedLl/AD/nTBEtSrLWiW7zT/bbzdBOhp4I0RUtnQi/nSknXubRDcEKlGY9eSN/i2Y5nlqQyefcjgy1AguNpTIA54bTqCW2CebSN4bvApFOcDaOsp5/9dxjWtBL+6ZOisvyCzMKUlpPkteqLB0wqhAt8tf/mEYzafFa1Fb4caTLrtZxtlQOpw6YQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlbgpBd1vmkvi6OkFSdxXkSGwA24cB9Fe9vKuAhhh8Q=;
 b=jFuU7qRIttJKI/JvgWoWSe7YNLyxqbgnmsBf2ZTxAPVyVnpjul9+lDsWhXDGXe5YiPJZdieXR/9MKfBJKiqCOu0QsMFmViW8J2wsnOSKjn61vA1QaQZBw1wA6ap7Ezq4Sp/qGwxU6vsv9cwaVmzKvcpYitx3Yi1ASx/TQm2gcj0j1A/BGuhBi4kBr02A1sTPlqMD/hMDe5YIJ5MGy36iT9oDmH94gHbjbGDR15Yh+okTleQz5xLrqyOfsT29GAIA/4y96DiWj0rmeXlasbKZx82BdEaGlBT+ylwx60Dv6OgPHw6nvx790EanFV14Cli6laoeF0yb/yebN8Z+iwQWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlbgpBd1vmkvi6OkFSdxXkSGwA24cB9Fe9vKuAhhh8Q=;
 b=cU1c+R8WunX5Fg7XWyFGISGy1cj8p8BnN28J6cEQpPZxbhUVwJ6TKcEIR5icA542v7bQKre2nhtYE3nZX7V95itxEk+O2KpYReiyIb+Jz/sW0Oug3kfhZH2y3Uq5Wi++tGUoMZzRfDVpAbIfKQuZu6KzZ9JcIpbIlcaVuA64tSJ3cTVnoMMqaflM2Hp6gNJh9fvb8VVYJQRAYTuqBt2dHkpkacCoepeWsi+bm04JL67K+HGtDij2bsdgqCCEyGqqLOsOfGzkWvYiQMLCV8Yh5bvqvEJ7675sHfZg1jPK8surltyaW3cxqOI3cSM98gasm2s6BX4IZ8hUbV+wjMCJHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9491746d-2216-06e2-f0c2-e7031267b901@suse.com>
Date: Mon, 17 Apr 2023 10:20:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Gitlab status on older branches (Inc some 4.18 blockers)
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "committers@xenproject.org" <committers@xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <Michal.Orzel@arm.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <193206bf-76a0-818d-8fa8-1886a15ad5e5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <193206bf-76a0-818d-8fa8-1886a15ad5e5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9926:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a743b3-6d92-499f-9abd-08db3f1c9524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CwDaAq69KbdTLYCgbhZl/aWHc2T7y5tQ1wjywMQLbiGeLKUAukS4V3nw7snOEURr2oTcWB5X94k+bu/qHz9IiUtTh5RphvNu9dXtBuS/6JsYjf3htaREBhOsxnOElVUChkLIG8zh89nXeFjQLvbjopgtVQ5grHYGmzhhm9qfDzhis0xY6T6fWvlkBN/2dyUrumX/N99l8HiNONaQaGa2SXVtBncVqQCgeFc0+FbhEeNBH1WjDsbUzQXGSc41PsW46gS1ZGf4rEKDJP5i6WQ07aedOPqWE/rnb2eGD6lmpdfM8E84wZTj6fLqz1GnhzfMoTu3u115yTNu1Wgibv8qNbTnZQ8XaFz+AZo7j96YZ0bRfY++PqQK44SOquuD8LC3jtzCufCZGGWQgD03fVfLf1hfX7tt2fhwbvtPceNeNmWRCtP7fizMN3BAJGqTEbqnFHyZeE1zAdJC1AwPz+wze9eY5tCSRFwUx+yiBqZHE/YmDnvuSCetv2S/BDdac26dp3QGbWg1ZHI8Ll0k2j9PaKldHCZBJxPSTMkN+mV2bRgEr2s4T+R4OcA4pT7a47Dr0svtjs+De/gTfMg85++DiK15JWGlxGr/yeV7Dak/3bOFw4lR2tHaVylfQieHhenWeW6crnzhGNK2+OppmAMtLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199021)(36756003)(6916009)(54906003)(4326008)(316002)(66556008)(66946007)(66476007)(6486002)(478600001)(5660300002)(8936002)(8676002)(41300700001)(2906002)(86362001)(31696002)(38100700002)(2616005)(26005)(6512007)(6506007)(186003)(53546011)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REhhMFRHNjVoQzlERVorNXBFZ2FJZEtwZ3RKRHM4UlR0Y2hIOG5PRWNOQS9w?=
 =?utf-8?B?V1hET1NheFFZQXJ5YWpnUDVrYyt1U0wwYmVpNTFLU01mTmJ6dFlpYWthYTlT?=
 =?utf-8?B?aGlrNGIzVlBkUWlQQVZhTFZ0WHNnTWZpRGZ2SmFpREdnN1psV0I3M0pLakxr?=
 =?utf-8?B?cUFlcU9YMnFGYWhyRTk2emt2TFpqYWZuK01FQ2Y2MTFwMVRQNFc1L0ZhbTBG?=
 =?utf-8?B?TnhYNndwY2NsVFdPclJPMTZSbis4RVArUEFIdTVXSW54ZXA0WCsvNGRTKzl6?=
 =?utf-8?B?NVYzWjRxTkxNc1FBM1R3b0FtUktzakJld01HYVMrT0ZpZUxBZjIyNUlZaE1h?=
 =?utf-8?B?T1V3KzZWejF3bmhlaG9EQzNnU3RleWFVbWZVZmRrYXZhQk4rS3FUdVJUQlRq?=
 =?utf-8?B?ckJFS2RuMjJnclZBMjg5NENMQWNma3IySklIRGYzdlZwUlNZblZsZWFVOFRJ?=
 =?utf-8?B?VXZtYzFJQXB5RDVJdkxXTlFyZjhYdXgyb3NjWGIyRExobE9SMHVxaFVMOE9F?=
 =?utf-8?B?eHpPNWIzQXpxaEkvRFFGZ1J4Z0t2UlpOalJNUlc3NmhsSmNjV2pHWWhHMmpM?=
 =?utf-8?B?TURkV1BaYU8yVW9MVHcrTFY5SHJkeHFEeUNWOVgzSHI2YmVlaGlocUxDeEVE?=
 =?utf-8?B?b2krNnZuMVhYSk4yeUNXcUI3QkZFMDNmSWUrYzJwblRFQitxT1dyNkdxWitX?=
 =?utf-8?B?dzBqVm55bm83UGF0a01MaFg3bENwMUEwdmlUdEptLyszT05YZk1WMnMxSlhQ?=
 =?utf-8?B?YmRLSFlrRFl2UUU1a0UwY2J0aWJjbzZTZmZkN3VMcWVFWHhhVGZuNjN6S1BW?=
 =?utf-8?B?NTdGWHYvZXNQUHJ1T2pxd0hBSFF0dlRTbGdhcllTenV1SW5aV21vb3I5eXFF?=
 =?utf-8?B?elRvR1F1SldlNFc4OXd1WGhsZTNRNXF6b0xsenZPLzdiUzJaUWVZYmhhbk5w?=
 =?utf-8?B?NG04RVF5OUR4amVERlpkUmg2aUVYNUNINFVzL3kzbUNVNnNvZ1F5UkwvbXp4?=
 =?utf-8?B?TTFudGVjRGpOR3BDSklJT2hvVjFyRzN3cGV4TjYyUzIrcS9DejkvWGtjV2s0?=
 =?utf-8?B?WGhnbzhHNVNFT1BKWVRBaVR4eWxudXdpVjRIRG5YZDloWWR4QTNXL1ZaeDNM?=
 =?utf-8?B?OWp3QTMxRjFCYkFKTmhLMUtRM09sbksxUVBxZjNKTUNZQmdZck5RcjQ3UmFJ?=
 =?utf-8?B?NVNqNjRlbVJXQzl1UGhYV1RvbHNVZHc1L1VYZ0doSXcvSG10S0F1bDc2OUU1?=
 =?utf-8?B?K2thVTg0d2QyUVhYRDdEVUZtbzlBd3Fuc2tpSy9HZkhkRHZGRnEwSUhtQlFh?=
 =?utf-8?B?QmlCQmtNd3ZsK1MwMW83c3Y1bTNzTnJ0ZmM1NWl0cXFUTWdUSFFuM1M3eXQ0?=
 =?utf-8?B?d3FqZEpDamZDRHdEUmlIYjFZL1dIaVhvMDFoWjhqMTFTVGZickZyNVZZdmdw?=
 =?utf-8?B?cDVoaXVJVWZQZ1lmc0RyU284MU9YRG1kNys5SE4zWFE3bVdjNnI5VjBOLzBq?=
 =?utf-8?B?SzhUWFNLU0xUVnF2WW5GZ01CVXp0MWxSQWNhVURRUS8wdWpPSHBDSVdPNnp6?=
 =?utf-8?B?L0ZvVUxaVm9LK09adDZoRWhGSHVlUHhSQ3RCejNqS3hoTy9QWlhLT3MrK1Nt?=
 =?utf-8?B?bFpzZ3Y2Zm4yTUE1V3B6RjBRa1RyeGlNZUhTd2plWmduUVBiM055WUVaeEtl?=
 =?utf-8?B?VWRINkh1UXlnQ1dvWFBZL2I5RWhiL0R4a1IxbGJ3LzlnMm80algvNkIyUDM1?=
 =?utf-8?B?UDhmQTMwZ2c0U0xwSi81TGphKzVIckowTG9ycktwak5UWnFyV1RYbzZHdld1?=
 =?utf-8?B?TVJoNDZVM0hLQnMzZmlvQ1N4OUJEaUNEM2hXYUd4dDNQcXBCdnlXN3BTdllQ?=
 =?utf-8?B?b2c1SHFjOG5lL3hOVG9JL1lpOGJmTUlGTzRseVA4V21TMDNzYVErMVZReWk2?=
 =?utf-8?B?bjVsZ2NXdlV3dVUxNlFad01KR2tjbW1GZm1mU3VPWFBDRWtrVDBwT2RDbjgw?=
 =?utf-8?B?UCt2ZTJPMDlhM2YzUE45S2o1K3BTQ0lZbXNnNHdWSSs0Y09jVW5Qa0JXQ0Vy?=
 =?utf-8?B?VzZjYXlGWmpQSC9GcHpiek90Ukw0Qi9CTGFvaXFuUTVuZ2FvbHBFclVjZ2cy?=
 =?utf-8?Q?IXB1j4Tjk2kdsakuxJ8g823vt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a743b3-6d92-499f-9abd-08db3f1c9524
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 08:20:19.8327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2JXEtuObe7f/oRD+HfUyyN9kMwiUJ3Xg9xWA+3Szd66ejN3LMe6kCPJXrem/9ma7VY6JwCXfJJRhSCGP3n+SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9926

On 12.04.2023 19:08, Andrew Cooper wrote:
> Hello,
> 
> I've done various backports to staging-4.14 and later trying to improve
> the state of Gitlab testing.
> 
> The good news is that 4.16 and 4.17 now pass.  The bad news is that
> there are still bugs which need fixing, but lets start with the older
> branches.
> 
> Also, I was forced to backport an update to SeaBIOS 1.16 to all branches
> in order to fix compile failures in build environments we supported at
> the time of each of these releases.  I honestly don't know what we were
> failing to do testing wise back then, but whatever we missed ought to
> have been release blockers.

I find this odd. Even 1.14.0 post-dates 4.14.0, so I don't see what we
could have updated to at the time. Furthermore I believe we never
updated SeaBIOS after the initial major release, so to be honest I
consider the above insufficient justification (i.e. lack of detail).

That said, SeaBIOS changes over the last couple of years look to have
been pretty minor, so hopefully we indeed won't run into issues from
doing this backport. We may even want to reconsider what we've done so
far, towards updating for dot-releases as well.

Jan

